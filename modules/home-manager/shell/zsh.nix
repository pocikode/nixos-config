{
  config,
  pkgs,
  lib,
  ...
}:

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
      autosuggestion = {
        enable = true;
        strategy = [ "history" ];
      };
      syntaxHighlighting.enable = true;
      enableCompletion = true;

      initContent = lib.mkOrder 1500 (builtins.readFile ./zshrc.sh);

      plugins = [
        {
          name = "fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ../config;
          file = "p10k.zsh";
        }
        {
          name = "zsh-you-should-use";
          src = pkgs.zsh-you-should-use;
          file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
        }
      ];
    };
  };
}
