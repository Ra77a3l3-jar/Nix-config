{ pkgs, pkgs-unstable, ... }:

{

  home.packages = with pkgs; [
    nodejs_22
    yarn
    pnpm

    vue
    vue-language-server
    svelte-language-server
     tailwindcss
  ];

  programs.helix.languages = {

    language = [
      {
        name = "vue";
        scope = "source.vue";
        language-servers = [ "vue-language-server" ];
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
    ];
  };
}
