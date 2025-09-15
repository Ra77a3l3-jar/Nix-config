{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    mpd
    mpc
  ] ++ [ pkgs-unstable.rmpc ];

  # Optional: Basic MPD configuration
  xdg.configFile."mpd/mpd.conf".text = ''
    music_directory "~/Musica"
    playlist_directory "~/Musica/playlists"
    db_file "~/.config/mpd/database"
    log_file "~/.config/mpd/log"
    pid_file "~/.config/mpd/pid"
    state_file "~/.config/mpd/state"
    audio_output {
      type "pulse"
      name "PulseAudio"
    }
  '';
}
