{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    # Pick up default tmux colour scheme; Ghostty's VibrantInk handles the palette.
    # You can always override colours later in `extraConfig`.

    # Sensible defaults & TPM (plugin manager)
    plugins = with pkgs.tmuxPlugins; [
      sensible   # safer key‑bindings & options
      tpm        # Tmux Plugin Manager – installs the rest on first ⌃b I
    ];

    # Additional plugins managed by TPM.  `tmux-which-key` gives a pop‑up cheat‑sheet
    # like Neovim's which‑key.  They are declared here so you keep everything in Nix
    # but fetched at runtime by TPM, avoiding manual hashes.
    extraConfig = ''
      # List TPM‑managed plugins ------------------------------
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'yukidoke/tmux-which-key'

      # Initialise TPM (keep this line at the very bottom of plugin section)
      run '~/.tmux/plugins/tpm/tpm'

      # ---------- Quality‑of‑life settings ----------
      set -g mouse on          # enable mouse support (scroll, resize panes, etc.)
      set -g history-limit 10000

      # Use Ctrl‑a as the prefix?  Uncomment if you prefer:
      # set -g prefix C-a
      # unbind C-b
      # bind C-a send-prefix
    '';
  };
}
