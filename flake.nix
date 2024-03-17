{
  description = "flake for testing miscellaneous derivations";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # these are yet to be added to nixpkgs
      packages.${system} = with pkgs; {
        xcode = callPackage ./packages/libs/xcode { };
        terminal = callPackage ./packages/terminal { };
        price = callPackage ./packages/price { };
        step_sync = callPackage ./packages/stepsync { };
        themes-gtk = callPackage ./packages/plugins/themes-gtk { };
        # broken
        #cenon = callPackage ./packages/cenon { };
        help_viewer = callPackage ./packages/helpviewer { };
        ftp = callPackage ./packages/ftp { };
        graphos = callPackage ./packages/graphos { };
        # broken
        #code_editor = callPackage ./packages/codeeditor { };
        # broken
        #steptalk = callPackage ./packages/steptalk { };
        text_edit = callPackage ./packages/textedit { };
        # broken
        #corebase = callPackage ./packages/libs/corebase { };
        dbuskit = callPackage ./packages/libs/dbuskit { };
        # broken
        #opal = callPackage ./packages/libs/opal { };
        simplewebkit = callPackage ./packages/libs/simplewebkit { };
        # i deleted my poorly made mirror
        #vespucci = callPackage ./packages/vespucci {
        #  simplewebkit = self.simplewebkit;
        #};
        # broken
        themes-win_ux_theme = callPackage ./packages/plugins/themes-winuxtheme { };
      };

      # make the flake look pretty :)
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
