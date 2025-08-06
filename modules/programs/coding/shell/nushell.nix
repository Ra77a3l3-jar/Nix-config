{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;

    environmentVariables = {
      PATH = "$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH";
      MANPAGER = "batman";
      EDITOR = "hx";
      VISUAL = "hx";
    };

    configFile.text = ''
      # General Aliases
      alias hm-reload = source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      alias nos-rebuild = nixos-rebuild switch --flake ./#nixos --verbose
      alias ex = exit
      alias gs = git status
      alias tx = tmux
      alias cl = clear
      alias hs = history

      # Eza Aliases
      alias la = eza -la --icons
      alias ltree = eza --tree --level=3 --long --git --icons
      alias l = eza -l --icons --only-files
      alias ld = eza -l --icons --only-dirs
      alias lsd = eza --icons --only-dirs
      alias ls = eza -l --icons --sort=size
      alias ltime = eza -l --icons --sort=modified
      alias lnew = eza -l --icons --sort=modified --reverse
      alias lperm = eza -l --icons --group-directories-first
      alias lbig = eza -l --icons --sort=size | take 10
      alias lt = eza --git --tree -l --icons

      # zoxide init for nushell
      use ~/.zoxide.nu
    '';

    extraConfigFiles = {
      ".zoxide.nu".text = ''
        # This is where zoxide's nushell init script would go
        # You can generate it with: zoxide init nushell > ~/.zoxide.nu
      '';
    };
  };

}
