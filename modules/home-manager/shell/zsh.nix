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
      plugins = [
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
          name = "zsh-autosuggestions";
          src = pkgs.zsh-autosuggestions;
          file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.zsh-syntax-highlighting;
          file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        }
        {
          name = "zsh-you-should-use";
          src = pkgs.zsh-you-should-use;
          file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
        }
      ];
      initContent = lib.mkOrder 1500 (builtins.readFile ./zshrc.sh);
    };
  };
}
