"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""


with open(config["dms_viz_config"]) as f:
    dms_viz_config = yaml.YAML(typ="safe", pure=True).load(f)

rule configure_dms_viz:
    """Configure a JSON file for `dms-viz`."""
    input:
        unpack(
            lambda wc: (
                {"per_antibody_escape_csv": 
                    "results/summaries/all_antibodies_and_cell_entry_per_antibody_escape.csv"
                }
                if dms_viz_config[wc.struct]["escape_or_phenotype"] == "escape"
                else {}
            )
        ),
        phenotypes_csv="results/summaries/all_antibodies_and_cell_entry.csv",
    output:
        json="results/dms-viz/{struct}.json",
        json_no_description=temp("results/dms-viz/{struct}_no_description.json"),
        sitemap=temp("results/dms-viz/{struct}_sitemap.csv"),
        phenotypes=temp("results/dms-viz/{struct}_phenotypes.csv"),
        description_md=temp("results/dms-viz/{struct}_description.md"),
        pdb_file=temp("results/dms-viz/{struct}.pdb"),
    params:
        config=lambda wc: dms_viz_config[wc.struct],
        description_suffix=(
            f"Study by {config['authors']} ({config['year']}).\n"
            f"See [{config['github_repo_url']}]({config['github_repo_url']}) for code."
        ),
    log:
        notebook="results/notebooks/configure_dms_viz_{struct}.ipynb",
    conda:
        "conda_envs/dms-viz.yml"
    notebook:
        "analysis_notebooks/configure_dms_viz.ipynb"



rule get_filtered_csvs_and_plots:
    """Create filtered CSV files and static escape plots."""
    input:
        # files for correct rule ordering
        "results/antibody_escape/averages/S4378_mut_effect.csv",
        "results/antibody_escape/averages/S43711_mut_effect.csv",
        "results/antibody_escape/averages/S43720_mut_effect.csv",
        "results/antibody_escape/averages/S43727_mut_effect.csv",
        "results/antibody_escape/averages/S43742_mut_effect.csv",
        "results/antibody_escape/averages/S44428_mut_effect.csv",
        "results/antibody_escape/averages/S44433_mut_effect.csv",
        "results/antibody_escape/averages/S44446_mut_effect.csv",
        "results/antibody_escape/averages/S44478_mut_effect.csv",
        # input files
        func_scores="results/func_effects/averages/293T_entry_func_effects.csv",
        nb="analysis_notebooks/get_filtered_CSVs.ipynb",
    output:
        # dummy files for correct rule ordering
        "results/filtered_CSVs/S4378_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43711_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43720_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43727_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43742_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44428_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44433_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44446_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44478_filtered_mut_effects.csv",
        filtered_func_scores="results/filtered_CSVs/293T_entry_filtered_mut_effects.csv",
        nb="results/notebooks/get_filtered_CSVs.ipynb",
    params:
        antibody_escape_dir="results/antibody_escape/averages/",
        filtered_csv_dir="results/filtered_CSVs/",
        escape_plots_dir="results/escape_plots/",
        times_seen=2,
        n_selections=8,
        frac_models=1,
        cell_entry_default=-3,
    log:
        "results/logs/get_filtered_csvs_and_plots.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p func_scores {input.func_scores} \
            -p filtered_func_scores {output.filtered_func_scores} \
            -p antibody_escape_dir {params.antibody_escape_dir} \
            -p filtered_csv_dir {params.filtered_csv_dir} \
            -p escape_plots_dir {params.escape_plots_dir} \
            -p times_seen {params.times_seen} \
            -p n_selections {params.n_selections} \
            -p frac_models {params.frac_models} \
            -p cell_entry_default {params.cell_entry_default} \
            &> {log}
        """

rule map_scores_onto_pdb:
    """Map scores onto PDB structure."""
    input:
        # files for correct rule ordering
        "results/filtered_CSVs/S4378_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43711_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43720_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43727_filtered_mut_effects.csv",
        "results/filtered_CSVs/S43742_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44428_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44433_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44446_filtered_mut_effects.csv",
        "results/filtered_CSVs/S44478_filtered_mut_effects.csv",
        # input files
        pdb_file="data/7puy.pdb",
        nb="analysis_notebooks/pdb_mapping.ipynb",
    output:
        nb="results/notebooks/pdb_mapping.ipynb",
    params:
        pdb_dir="results/mapped_scores_onto_pdb/",
        filtered_csv_dir="results/filtered_CSVs/",
    log:
        "results/logs/map_scores_onto_pdb.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p pdb_file {input.pdb_file} \
            -p pdb_dir {params.pdb_dir} \
            -p filtered_csv_dir {params.filtered_csv_dir} \
            &> {log}
        """


docs["Visualizations of DMS data on protein structure"] = {
    "dms-viz JSONs": {
        "JSON files for dms-viz": {
            struct: rules.configure_dms_viz.output.json.format(struct=struct)
            for struct in dms_viz_config
        },
        "Notebooks generating JSONs": {
            struct: rules.configure_dms_viz.log.notebook.format(struct=struct)
            for struct in dms_viz_config
        },
    },
}

# Files (Jupyter notebooks, HTML plots, or CSVs) that you want included in
# the HTML docs should be added to the nested dict `docs`:
docs["Additional files"] = {
    "Create pre-filtered files and escape plots":{
        "Notebook configuring data filtering and plotting" : rules.get_filtered_csvs_and_plots.output.nb,
    },
    "Map DMS scores onto PDB structure":{
        "Notebook mapping scores onto pdb structure" : rules.map_scores_onto_pdb.output.nb,
    },
}
