{...}:

{
  home.file = {
    ".scripts/brightness.sh" = {
      source = ./brightness.sh;
      executable = true;
    };

    ".scripts/fetch_music_player_data.sh" = {
      source = ./fetch_music_player_data.sh;
      executable = true;
    };
  };
}