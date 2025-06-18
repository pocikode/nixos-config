{
  config,
  pkgs,
  lib,
  ...
}:

let
  name = "Agus Supriyatna";
  user = "agus";
  email = "aguzsupriyatna7@gmail.com";
  profileID = "6c323a8b-4f47-4ee3-a0ea-70720347fc59"; # Gnome terminal profile ID
in
{
  direnv = {
    enable = true;
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
    '';
  };

  git = {
    enable = true;
    ignores = [ "*.swp" ];
    userName = name;
    userEmail = email;
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
    };
  };

  gnome-terminal = {
    enable = true;
    profile = {
      "${profileID}" = {
        default = true;
        visibleName = "My Terminal Config";
        font = "Agave Nerd Font 12";
      };
    };
  };

  nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        theme = {
          enable = true;
          name = "catppuccin";
          style = "macchiato";
        };

        filetree.neo-tree = {
          enable = true;
          setupOpts = {
            git_status_async = true;
          };
        };

        binds = {
          whichKey.enable = true;
        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          go.enable = true;
          python.enable = true;
        };

        formatter = {
          conform-nvim.enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}
