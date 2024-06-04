---
aside: true
---

# Escape from monoclonal antibodies

**Currently only antibodies S437.11 and S444.46 are fully mapped. The remaining antibodies only have preliminary data from one biological replicate.**

The plots below show how mutations affect neutralization by a panel of monoclonal antibodies. The plots are interactive, and allow you to zoom and mouseover sites and mutations. Positive values indicate reduced neutralization by antibody while negative values indicate more neutralization. Note that the two different shades of gray in the heatmaps have differing meanings: light gray means a mutation was *missing (not measured)* in the library, whereas dark gray means a mutation *was measured but was so deleterious for cell entry* it is not possible to reliably estimate its effect on antibody escape (the threshold for how deleterious a mutation must be for cell entry to be shown in dark gray is controlled by the cell entry slider at the bottom of the plot).

Here is an explanation of the key elements for each plot:
 - The zoom bar at the top of the plot shows different regions of GPC, and can be used to zoom in on specific sites.
 - The line plot summarizes the neutralization escape caused by mutations at each site (larger values indicate more escape). The escape at a site is quantified using the site summary statistic specified by the interactive option at the bottom of the plot (eg, sum or mean effect of mutations at a site).
 - The heatmaps then show how each individual mutation affects antibody neutralization. The `x`'s indicate the amino-acid identity in the parental GPC strain, light gray indicates mutations that were not measured, and dark gray indicates mutations that are filtered out by one of the interactive sliders at the by one of the interactive sliders at the bottom of the plot (eg, they have a very negative effect on cell entry). You can mouse over any of the points. You can mouse over any of the heatmap cells for details.
 - The options at the bottom of the plot allow you to interactively adjust what is displayed. For instance, 
   the *minimum mutation entry in 293T cells* only shows mutations with at least some minimal cell entry
   function (and grays out mutations that are more deleterious). You can also select to floor the escape at zero to show / not show "negative" escape values. 


## Antibody S437.8
- The plot below shows how mutations affect neutralization by the monoclonal antibody S437.8. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S4378_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S437.8 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S4378_mut_effect.html'"></Altair>
</Figure>

## Antibody S437.11
- The plot below shows how mutations affect neutralization by the monoclonal antibody S437.11. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S43711_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S437.11 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S43711_mut_effect.html'"></Altair>
</Figure>

## Antibody S437.27
- The plot below shows how mutations affect neutralization by the monoclonal antibody S437.27. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S43727_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S437.27 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S43727_mut_effect.html'"></Altair>
</Figure>

## Antibody S437.42
- The plot below shows how mutations affect neutralization by the monoclonal antibody S437.42. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S43742_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S437.42 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S43742_mut_effect.html'"></Altair>
</Figure>

## Antibody S444.28
- The plot below shows how mutations affect neutralization by the monoclonal antibody S444.28. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S44428_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S444.28 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S44428_mut_effect.html'"></Altair>
</Figure>

## Antibody S444.33
- The plot below shows how mutations affect neutralization by the monoclonal antibody S444.33. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S44433_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S444.33 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S44433_mut_effect.html'"></Altair>
</Figure>

## Antibody S444.46
- The plot below shows how mutations affect neutralization by the monoclonal antibody S444.46. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S44446_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S444.46 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S44446_mut_effect.html'"></Altair>
</Figure>

## Antibody S444.78
- The plot below shows how mutations affect neutralization by the monoclonal antibody S444.78. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/S44478_mut_effect.html){target="_self"} to open the plot in a stand-alone window.

<Figure caption="Interactive plot showing effects of mutations on antibody S444.78 escape">
    <Altair :showShadow="true" :spec-url="'htmls/S44478_mut_effect.html'"></Altair>
</Figure>

## Static logo plots of escape

For static logoplot versions of escape, see [these svg files](https://github.com/dms-vep/LASV_Josiah_GP_DMS_Scripps_mABs/tree/main/results/escape_plots). Currently only antibodies S437.11 and S444.46 are fully mapped. The remaining antibodies only have preliminary data from one biological replicate.

## Numerical values of escape

For per-antibody escape values, see [these CSV files](https://github.com/dms-vep/LASV_Josiah_GP_DMS_Scripps_mABs/tree/main/results/filtered_CSVs). Currently only antibodies S437.11 and S444.46 are fully mapped. The remaining antibodies only have preliminary data from one biological replicate.