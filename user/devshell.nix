{ pkgs, python38, ... }:

let
  base = [
    pkgs.cowsay
    pkgs.lolcat
  ];
in
{
  default = pkgs.mkShell {
    name = "default-devshell";
    nativeBuildInputs = base;
    shellHook = ''
      echo "Welcome to development shell!" | cowsay | lolcat
    '';
  };

  python38 = pkgs.mkShell {
    name = "python38-devshell";
    nativeBuildInputs = base ++ [
      python38.python38
      python38.python38Packages.pip
      python38.python38Packages.virtualenv
      python38.python38Packages.setuptools
      python38.python38Packages.wheel
    ];
    shellHook = ''
      echo "Welcome to Python 3.8 development shell!" | cowsay | lolcat
    '';
  };

  go_1_24 = pkgs.mkShell {
    name = "go-1.24-devshell";
    nativeBuildInputs = base ++ [
      pkgs.go_1_24
      pkgs.golangci-lint
      pkgs.goreleaser
    ];
    shellHook = ''
      echo "Welcome to Go 1.24 development shell!" | cowsay | lolcat
    '';
  };
}
