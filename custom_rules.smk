"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""


rule configure_dms_viz:
    """Configure a JSON file for `dms-viz`."""
    input:
        # dummy files for correct rule ordering
        "results/antibody_escape/averages/S4378_mut_effect.csv",
        "results/antibody_escape/averages/S43711_mut_effect.csv",
        "results/antibody_escape/averages/S43727_mut_effect.csv",
        "results/antibody_escape/averages/S43742_mut_effect.csv",
        "results/antibody_escape/averages/S43752_mut_effect.csv",
        "results/antibody_escape/averages/S44428_mut_effect.csv",
        "results/antibody_escape/averages/S44433_mut_effect.csv",
        "results/antibody_escape/averages/S44446_mut_effect.csv",
        "results/antibody_escape/averages/S44478_mut_effect.csv",
        # input files
        site_map="data/site_numbering_map.csv",
        func_scores="results/func_effects/averages/293T_entry_func_effects.csv",
        nb="analysis_notebooks/configure_dms_viz.ipynb",
    output:
        dms_viz_phenotypes="results/dms_viz/phenotypes.csv",
        dms_viz_json="results/dms_viz/dms_viz.json",
        nb="results/notebooks/configure_dms_viz.ipynb",
    params:
        antibody_escape_dir="results/antibody_escape/averages/",
        dms_viz_subdir="results/dms_viz/",
        pdb_file="7puy",
        times_seen=2,
        n_selections=3,
        frac_models=1,
        cell_entry_default=-3,
    log:
        "results/logs/configure_dms_viz.txt",
    conda:
        "conda_envs/dms_viz.yml"
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p site_map {input.site_map} \
            -p func_scores {input.func_scores} \
            -p dms_viz_phenotypes {output.dms_viz_phenotypes} \
            -p dms_viz_json {output.dms_viz_json} \
            -p antibody_escape_dir {params.antibody_escape_dir} \
            -p dms_viz_subdir {params.dms_viz_subdir} \
            -p pdb_file {params.pdb_file} \
            -p times_seen {params.times_seen} \
            -p n_selections {params.n_selections} \
            -p frac_models {params.frac_models} \
            -p cell_entry_default {params.cell_entry_default} \
            &> {log}
        """

rule get_filtered_csvs_and_plots:
    """Create filtered CSV files and static escape plots."""
    input:
        # dummy files for correct rule ordering
        "results/antibody_escape/averages/S4378_mut_effect.csv",
        "results/antibody_escape/averages/S43711_mut_effect.csv",
        "results/antibody_escape/averages/S43727_mut_effect.csv",
        "results/antibody_escape/averages/S43742_mut_effect.csv",
        "results/antibody_escape/averages/S43752_mut_effect.csv",
        "results/antibody_escape/averages/S44428_mut_effect.csv",
        "results/antibody_escape/averages/S44433_mut_effect.csv",
        "results/antibody_escape/averages/S44446_mut_effect.csv",
        "results/antibody_escape/averages/S44478_mut_effect.csv",
        # input files
        func_scores="results/func_effects/averages/293T_entry_func_effects.csv",
        nb="analysis_notebooks/get_filtered_CSVs.ipynb",
    output:
        filtered_func_scores="results/filtered_CSVs/293T_entry_filtered_mut_effects.csv",
        nb="results/notebooks/get_filtered_CSVs.ipynb",
    params:
        antibody_escape_dir="results/antibody_escape/averages/",
        filtered_csv_dir="results/filtered_CSVs/",
        escape_plots_dir="results/escape_plots/",
        times_seen=2,
        n_selections=3,
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

# Files (Jupyter notebooks, HTML plots, or CSVs) that you want included in
# the HTML docs should be added to the nested dict `docs`:
docs["Additional files"] = {
    "Configuration for dms-viz ":{
        "Notebook configuring dms-viz" : rules.configure_dms_viz.output.nb,
    },
    "Create pre-filtered files and escape plots":{
        "Notebook configuring data filtering and plotting" : rules.get_filtered_csvs_and_plots.output.nb,
    },
}
