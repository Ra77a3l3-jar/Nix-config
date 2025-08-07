{ pkgs, ... }: {
  programs.helix.languages.language = [
    {
      name = "vue";
      scope = "source.vue";
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
    {
      name = "svelte";
      scope = "source.svelte";
      language-servers = [ "svelteserver" ];
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
    {
      name = "php";
      scope = "source.php";
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
    {
      name = "sql";
      scope = "source.sql";
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
  ];

  home.packages = with pkgs; [
    nodejs
    vue-language-server
    svelte-language-server
    php
    intelephense
    sqlite
    tailwindcss
  ];
}
