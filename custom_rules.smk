"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""


rule configure_dms_viz:
    """Configure a JSON file for `dms-viz`."""
    input:
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
        cell_entry_default=-1.5,
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

# Files (Jupyter notebooks, HTML plots, or CSVs) that you want included in
# the HTML docs should be added to the nested dict `docs`:
docs["Additional files"] = {
    "Configuration for dms-viz ":{
        "Notebook configuring dms-viz" : rules.configure_dms_viz.output.nb,
    },
}
