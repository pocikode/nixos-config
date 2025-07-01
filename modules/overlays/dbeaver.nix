final: prev:
let
  version = "25.1.1";
in
{
  dbeaver-bin = prev.dbeaver-bin.overrideAttrs (old: {
    version = version;

    src =
      let
        inherit (prev.stdenvNoCC.hostPlatform) system;
        selectSystem = attrs: attrs.${system} or (throw "Unsupported system: ${system}");
        suffix = selectSystem {
          x86_64-linux = "linux.gtk.x86_64-nojdk.tar.gz";
          aarch64-linux = "linux.gtk.aarch64-nojdk.tar.gz";
          x86_64-darwin = "macos-x86_64.dmg";
          aarch64-darwin = "macos-aarch64.dmg";
        };
        hash = selectSystem {
          x86_64-linux = "sha256-PFY1eZFG8mvbG6D7pDJBBbsySeNmw6/DlxSyNvCJcSI=";
          aarch64-linux = "sha256-Fny8+XA7N3rmXqP2UfTPYFIwHHSZTLbABjm+ESMoFJ4=";
          x86_64-darwin = "sha256-/U8lcvJotAB+K0pQWpy6RIRqbfJzqVefS67qF9arzw0=";
          aarch64-darwin = "sha256-lfz+B2ZHaBoyDKduDn45ocSTMAsS/bBXrByBeIZb0Ew=";
        };
      in
      prev.fetchurl {
        url = "https://github.com/dbeaver/dbeaver/releases/download/${version}/dbeaver-ce-${version}-${suffix}";
        inherit hash;
      };

    installPhase =
      if !prev.stdenvNoCC.hostPlatform.isDarwin then
        ''
          runHook preInstall

          mkdir -p $out/opt/dbeaver $out/bin
          cp -r * $out/opt/dbeaver
          makeWrapper $out/opt/dbeaver/dbeaver $out/bin/dbeaver \
            --prefix PATH : "${prev.openjdk21}/bin" \
            --set JAVA_HOME "${prev.openjdk21.home}" \
            --prefix GIO_EXTRA_MODULES : "${prev.glib-networking}/lib/gio/modules" \
            --prefix LD_LIBRARY_PATH : "$out/lib:${
              prev.lib.makeLibraryPath [
                prev.gtk3
                prev.glib
                prev.webkitgtk_4_1
                prev.glib-networking
              ]
            }"

          mkdir -p $out/share/icons/hicolor/256x256/apps
          ln -s $out/opt/dbeaver/dbeaver.png $out/share/icons/hicolor/256x256/apps/dbeaver.png

          mkdir -p $out/share/applications
          ln -s $out/opt/dbeaver/dbeaver-ce.desktop $out/share/applications/dbeaver.desktop

          substituteInPlace $out/opt/dbeaver/dbeaver-ce.desktop \
            --replace-fail "/usr/share/dbeaver-ce/dbeaver.png" "dbeaver" \
            --replace-fail "/usr/share/dbeaver-ce/dbeaver" "$out/bin/dbeaver"

          sed -i '/^Path=/d' $out/share/applications/dbeaver.desktop

          runHook postInstall
        ''
      else
        ''
          runHook preInstall

          mkdir -p $out/{Applications/dbeaver.app,bin}
          cp -R . $out/Applications/dbeaver.app
          makeWrapper $out/{Applications/dbeaver.app/Contents/MacOS,bin}/dbeaver \
            --prefix PATH : "${prev.openjdk21}/bin" \
            --set JAVA_HOME "${prev.openjdk21.home}"

          runHook postInstall
        '';
  });
}
