{
  config,
  pkgs,
  lib,
  ...
}:

let
  customPath = ".config/oh-my-zsh";
in
{
  options = {
    zsh_module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Zsh module for shell configuration.";
    };
  };

  config = lib.mkIf config.zsh_module.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;

      initContent = lib.mkOrder 1500 (builtins.readFile ./zshrc.sh);

      oh-my-zsh = {
        enable = true;
        custom = "$HOME/${customPath}";
        theme = "";
        plugins = [
          "git"
          "fzf-tab"
          "history"
          "you-should-use"
        ];
      };
    };

    home.file."${customPath}/plugins/fzf-tab".source = builtins.fetchGit {
      url = "https://github.com/Aloxaf/fzf-tab.git";
      rev = "01dad759c4466600b639b442ca24aebd5178e799";
    };

    home.file."${customPath}/plugins/you-should-use".source = builtins.fetchGit {
      url = "https://github.com/MichaelAquilina/zsh-you-should-use.git";
      rev = "78617df02e09fcc06f41a91d934b7048947fc62d";
    };
  };
}
