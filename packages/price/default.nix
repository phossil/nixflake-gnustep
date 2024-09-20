{
  lib,
  clangStdenv,
  fetchurl,
  gnustep,
}:

clangStdenv.mkDerivation rec {
  pname = "price";
  version = "1.3.0";

  src = fetchurl {
    url = "mirror://sourceforge/price/PRICE-${version}.tar.gz";
    sha256 = "16zl19pkz7rrrasygig1lc7jskq5z9n4b4lrji1kn0ii6w8wljs6";
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
    description = "Imaging application for GNUstep and MacOS ";
    homepage = "https://price.sourceforge.net/";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ phossil ];
    platforms = platforms.linux;
  };
}
