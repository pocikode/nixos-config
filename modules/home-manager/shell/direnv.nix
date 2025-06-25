{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    direnv_module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Direnv module for shell configuration.";
    };
  };

  config = lib.mkIf config.direnv_module.enable {
    programs.direnv = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
