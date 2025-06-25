{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  direnv = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  zsh = {
    enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./config;
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
    initContent = lib.mkBefore ''
      # bat
      alias rcat="$(which cat)"
      alias cat="$(which bat)"
      export MANPAGER="sh -c 'col -bx | bat -l man -p'"
      export MANROFFOPT="-c"

      # direnv
      eval "$(direnv hook zsh)"
    '';
  };

  git = {
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

  vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
