{pkgs,...}:

{
	imports = [
	../workstation/home.nix
];

	gnome_de.enable = false;
	hyprland_wm.enable = true;
}
