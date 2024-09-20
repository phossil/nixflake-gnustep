{
  lib,
  clangStdenv,
  fetchurl,
  gnustep,
}:

clangStdenv.mkDerivation rec {
  pname = "ftp";
  version = "0.6";

  src = fetchurl {
    url = "http://savannah.nongnu.org/download/gap/FTP-${version}.tar.gz";
    sha256 = "046nqh97ak23fslccvbpkz4x77hgbn8807zdhfhzwdrz18flr27r";
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
    description = "FTP client for GNUstep";
    homepage = "https://gap.nongnu.org/ftp/";
    # license is noted in the info panel
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ phossil ];
    platforms = platforms.linux;
  };
}
