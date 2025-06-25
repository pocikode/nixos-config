{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  options = {
    git_module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Git module for shell configuration.";
    };
  };

  config = lib.mkIf config.git_module.enable {
    programs.git = {
      enable = true;
      ignores = [ "*.swp" ];
      userName = userSettings.name;
      userEmail = userSettings.email;
      lfs = {
        enable = true;
      };
      extraConfig = {
        init.defaultBranch = "main";
        core = {
          editor = "vim";
          autocrlf = "input";
        };
        pull.rebase = "true";
        rebase.autoStash = "true";
        credential.helper = "cache --timeout=3600";
      };
    };
  };
}
