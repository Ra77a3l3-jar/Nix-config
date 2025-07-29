{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';

    shellAliases = {
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
      gs = "git status";
      ga = "git add .";
      gc = "git commit";
      gp = "git push";
      ".." = "cd ..";
    };

    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fishPlugins.foreign-env.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];

    promptInit = ''
      function fish_prompt
        set_color cyan
        echo -n (prompt_pwd)
        set_color normal
        echo -n ' ❯ '
      end
    '';
  };

  # Optional if you want to make fish the default shell
  # home.shell = pkgs.fish;
}

