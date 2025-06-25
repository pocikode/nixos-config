{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    podman.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Podman support.";
    };
  };

  config = lib.mkIf config.podman.enable {
    environment.systemPackages = with pkgs; [
      dive
      podman-tui
      podman-compose
    ];

    virtualisation = {
      containers.enable = true;
      oci-containers.backend = "podman";

      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
