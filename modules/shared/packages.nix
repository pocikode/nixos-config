{ pkgs, ... }:
let
  myFonts = import ./fonts.nix { inherit pkgs; };
in
with pkgs;
[
  # A
  aspell # Spell checking dictionaries
  aspellDicts.en # English dictionary for aspell
  aspellDicts.id # Indonesian dictionary for aspell

  # B
  bash-completion # Bash completion scripts
  bat # A cat clone with syntax highlighting and Git integration
  btop # A resource monitor that shows system usage and stats

  # N
  nixfmt-rfc-style

  # O
  oh-my-zsh

  # T
  tmux # Terminal multiplexer
  tree # Display directory structure in a tree-like format

  # U
  unzip # Utility to extract compressed files
  unrar # Utility to extract RAR files
  uv # Python package installer

  # W
  wget # Command-line utility for downloading files from the web

  # W
  wget # Command-line utility for downloading files from the web

  # Z
  zip # Utility to create and extract ZIP files
]
