{
  pkgs,
  certEnv,
  boluo-site,
  commonImageContents,
  imageLabel,
  ...
}:
pkgs.dockerTools.buildLayeredImage {
  name = "boluo-site";
  tag = "latest";
  contents =
    with pkgs;
    commonImageContents
    ++ [
      curl
    ];
  config = {
    Env = certEnv;
    Cmd = [ "${boluo-site}/bin/boluo-site" ];
    Labels = imageLabel;
  };
}
