{
  lib,
  clangStdenv,
  fetchurl,
  gnustep,
}:

clangStdenv.mkDerivation rec {
  pname = "step_sync";
  version = "1.0";

  src = fetchurl {
    url = "http://savannah.nongnu.org/download/gap/StepSync-${version}.tar.gz";
    sha256 = "0f4xwf9wpqr7yf78829pfq1p8v5ridqi61146m1aa2r850wd5k4p";
  };

  nativeBuildInputs = [
    gnustep.make
    gnustep.wrapGNUstepAppsHook
  ];

  buildInputs = with gnustep; [
    base
    back
    gui
  ];

  meta = with lib; {
    description = "File synchronization tool for GNUstep";
    homepage = "https://www.nongnu.org/gap/stepsync/index.html";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ phossil ];
    platforms = platforms.linux;
  };
}
