{
  description = "flake with a bunch of random gnustep packages";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # these are yet to be added to nixpkgs
      packages.${system} = with pkgs; rec {
        dbuskit = callPackage ./packages/dbuskit { };
        ftp = callPackage ./packages/ftp { };
        graphos = callPackage ./packages/graphos { };
        price = callPackage ./packages/price { };
        step_sync = callPackage ./packages/stepsync { };
        terminal = callPackage ./packages/terminal { };
        text_edit = callPackage ./packages/textedit { };
        xcode = callPackage ./packages/xcode { };
        # broken
        #cenon = callPackage ./packages/cenon { };
        #code_editor = callPackage ./packages/codeeditor { };
        #corebase = callPackage ./packages/libs/corebase { };
        #help_viewer = callPackage ./packages/helpviewer { };
        #opal = callPackage ./packages/libs/opal { };
        #simplewebkit = callPackage ./packages/simplewebkit { };
        #steptalk = callPackage ./packages/steptalk { };
        #themes-gtk = callPackage ./packages/themes-gtk { };
        #themes-win_ux_theme = callPackage ./packages/themes-winuxtheme { };
        #vespucci = callPackage ./packages/vespucci {
        #  inherit simplewebkit;
        #};
      };

      # make the flake look pretty :)
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
