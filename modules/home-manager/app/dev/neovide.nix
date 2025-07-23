{ lib, ... }:
{
  programs.neovide = {
    enable = true;
    settings = {
      font = {
        size = lib.mkForce 11.0;
      };
    };
  };

  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "cspell"
    ];

    userSettings = {
      features = {
        edit_prediction_provider = "copilot";
      };

      inlay_hints = {
        enabled = true;
      };

      terminal = {
        detect_venv = {
          on = {
            directories = [
              ".env"
              "env"
              "venv"
              ".venv"
            ];
            activate_script = "default";
          };
        };
        env = {
          TERM = "alacritty";
        };
      };

      lsp = {
        "gopls" = {
          initialization_options = {
            hints = {
              "assignVariableTypes" = true;
              "compositeLiteralFields" = true;
              "compositeLiteralTypes" = true;
              "constantValues" = true;
              "functionTypeParameters" = true;
              "parameterNames" = true;
              "rangeVariableTypes" = true;
            };
          };
        };
      };

      languages = {
        "Go" = {
        };
      };

      load_direnv = "shell_hook";
      base_keymap = "VSCode";
      show_whitespaces = "selection";
      buffer_font_size = lib.mkForce 13.0;
      buffer_line_height = "standard";
    };
  };
}
