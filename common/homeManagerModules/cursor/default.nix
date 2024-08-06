{ unstable, ... }: 
let
  inherit (unstable) stdenvNoCC;
  sakuya-cursors = stdenvNoCC.mkDerivation {
    pname = "sakuya-cursors";
    version = "2022-03-24";
    src = ./sakuya-cursors;
    dontUnpack = true;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/icons/sakuya-cursors
      cp -r $src/* $out/share/icons/sakuya-cursors
    '';
  };
in
{
  home.pointerCursor = {
    package = sakuya-cursors;
    name = "sakuya-cursors";
    gtk.enable = true;
    x11.enable = true;
  };
}
