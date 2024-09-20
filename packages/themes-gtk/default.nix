{
  lib,
  clangStdenv,
  fetchFromGitHub,
  gnustep,
  gtk2,
  gnome2,
  pkg-config,
}:

clangStdenv.mkDerivation rec {
  pname = "themes-gtk";
  version = "2017-12-17";

  src = fetchFromGitHub {
    owner = "gnustep";
    repo = "plugins-themes-Gtk";
    rev = "9e422fca9fdb67104e1bae8990c24e963132b636";
    sha256 = "yKcUcElkXUrlf4ww1j1DJGTMq/bY6YE4OQLel5TI7YU=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    gnustep.make
    gnustep.wrapGNUstepAppsHook
  ];

  buildInputs =
    with gnustep;
    [
      base
      back
      gui
      system_preferences
    ]
    ++ [
      gtk2
      gnome2.GConf
      pkg-config
    ];

  meta = with lib; {
    description = "GTK theme for GNUstep";
    homepage = "https://github.com/gnustep/plugins-themes-Gtk/";
    license = licenses.lgpl21Only;
    maintainers = with maintainers; [ phossil ];
    platforms = platforms.linux;
  };
}
