import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  lang: "en-US",
  title: "Lassa GPC DMS",
  description:
    "Interactive figures and detailed results for deep mutational scanning of the GPC from the lineage IV Lassa virus Josiah strain.",
  base: "/LASV_Josiah_GP_DMS_Scripps_mABs/",
  appearance: false,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: 'Antibody Escape', link: '/antibody_escape' },
      { text: "Appendix", link: "/appendix", target: "_self" },
    ],
    socialLinks: [{ icon: "github", link: "https://github.com/dms-vep/LASV_Josiah_GP_DMS_Scripps_mABs" }],
    footer: {
      message: "Copyright © 2024-present Will Hannon and Jesse Bloom",
    },
  },
});
