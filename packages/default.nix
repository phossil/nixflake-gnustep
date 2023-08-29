{ pkgs, lib }:

lib.makeScope pkgs.newScope (self: with self; {
  xcode = callPackage ./libs/xcode { };
  terminal = callPackage ./terminal { };
  price = callPackage ./price { };
  step_sync = callPackage ./stepsync { };
  themes-gtk = callPackage ./plugins/themes-gtk { };
  # broken
  cenon = callPackage ./cenon { };
  help_viewer = callPackage ./helpviewer { };
  ftp = callPackage ./ftp { };
  graphos = callPackage ./graphos { };
  # broken
  code_editor = callPackage ./codeeditor { };
  # broken
  steptalk = callPackage ./steptalk { };
  text_edit = callPackage ./textedit { };
  # broken
  corebase = callPackage ./libs/corebase { };
  dbuskit = callPackage ./libs/dbuskit { };
  # broken
  opal = callPackage ./libs/opal { };
  simplewebkit = callPackage ./libs/simplewebkit { };
  vespucci = callPackage ./vespucci {
    simplewebkit = self.simplewebkit;
  };
  # broken
  themes-win_ux_theme = callPackage ./plugins/themes-winuxtheme { };
})
