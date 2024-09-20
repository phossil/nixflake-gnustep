{
  lib,
  clangStdenv,
  fetchsvn,
  gnustep,
  simplewebkit,
}:

clangStdenv.mkDerivation rec {
  pname = "vespucci";
  version = "0-unstable-2021-03-05";

  src = fetchsvn {
    url = "svn://svn.savannah.nongnu.org/gap/trunk/user-apps/Vespucci";
    rev = "3858";
    sha256 = "sha256-ZG/hh59RuXOXb2MGcVs0mnlkXcSnvdH2rVNQ9sFmqWI=";
  };

  buildInputs =
    with gnustep;
    [
      base
      back
      gui
    ]
    ++ [ simplewebkit ];

  meta = with lib; {
    description = "Vespucci is a navigator for the World Wide Web";
    homepage = "http://gap.nongnu.org/vespucci/index.html";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ phossil ];
    platforms = platforms.linux;
  };
}
