{ pkgs, lib, ... }:

{
  programs.nvf = {
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
				name = "gruvbox";
				style = "dark";
			};

			languages = {
				enableLSP = true;
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
}
