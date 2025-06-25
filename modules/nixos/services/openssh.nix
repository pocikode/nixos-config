{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.openssh.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable OpenSSH server.";
  };

  config = lib.mkIf config.openssh.enable {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "yes";
      };
    };
  };
}
