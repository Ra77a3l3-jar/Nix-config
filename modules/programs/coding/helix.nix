{ config, pkgs, lib, ... }:

let
  user = "raffaele"; # change this to your actual user
in
{
  system.activationScripts.helixConfig = {
    text = ''
      mkdir -p /home/${user}/.config/helix

      cat > /home/${user}/.config/helix/config.toml <<'EOF'
theme = "ayu_evolve"

[editor]
scrolloff = 999
line-number = "relative"
bufferline = "multiple"
mouse = false
auto-format = true
true-color = true
auto-completion = true

[editor.cursor-shape]
insert = "bar"
normal = "block"
select = "block"

[editor.indent-guides]
render = true
character = "|"
skip-levels = 1

[editor.statusline]
left = [ "mode", "spinner", "file-name" ]
center = [ "version-control" ]
right = [ "diagnostics", "selections", "position", "file-encoding", "file-line-ending", "file-type" ]
separator = "│"
mode.normal = "NORMAL"
mode.insert = "INSERT"
mode.select = "SELECT"
EOF

      cat > /home/${user}/.config/helix/languages.toml <<'EOF'

[[language]]
name = "zig"
language-servers = ["zls"]
indent = { tab-width = 4, unit = "    " }

[[language]]
name = "c"
language-servers = ["clangd"]
indent = { tab-width = 4, unit = "    " }

[[language]]
name = "cpp"
language-servers = ["clangd"]
indent = { tab-width = 4, unit = "    " }

[language-server.zls]
command = "zls"
EOF

      chown -R ${user}:${user} /home/${user}/.config/helix
    '';
  };
}

