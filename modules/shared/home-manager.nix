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
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "zsh-autocomplete"
        "zsh-syntax-highlighting"
        "zsh-autosuggestions"
      ];
      custom = "$HOME/.oh-my-zsh/custom/";
      theme = "powerlevel10k/powerlevel10k";
    };
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
        };
        theme = {
          enable = true;
          name = "catppuccin";
          style = "macchiato";
        };

        filetree.neo-tree.enable = true;

	binds = {
          whichKey.enable = true;
	};

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          go.enable = true;
          python.enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}
