{ pkgs, ... }: {
  programs.helix.languages.language = [
    {
      name = "vue";
      scope = "source.vue";
      language-servers = [ "vue-language-server" ];
    }
    {
      name = "svelte";
      scope = "source.svelte";
      language-servers = [ "svelteserver" ];
    }
    {
      name = "php";
      scope = "source.php";
    }
    {
      name = "sql";
      scope = "source.sql";
    }
  ];

  home.packages = with pkgs; [
    nodejs
    vue-language-server
    svelte-language-server
    php
    sqlite
    tailwindcss
    npm
  ];
}
