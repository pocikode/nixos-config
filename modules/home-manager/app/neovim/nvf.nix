{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    nvf_module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable NVF module for Neovim configuration.";
    };
  };

  config = lib.mkIf config.nvf_module.enable {
    programs.nvf = {
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

          keymaps = [
            {
              key = "<leader>gt";
              mode = [ "n" ];
              action = ":ToggleTerm<CR>";
              silent = true;
            }
          ];

          filetree.neo-tree = {
            enable = true;
            setupOpts = {
              git_status_async = true;
            };
          };

          terminal = {
            toggleterm = {
              enable = true;
              lazygit.enable = true;
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
  };
}
