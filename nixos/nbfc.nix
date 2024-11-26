# nbfc.nix
{
  config,
  inputs,
  pkgs,
  ...
}: let
  myUser = "yoda"; #adjust this to your username
  command = "bin/nbfc_service --config-file '/home/${myUser}/.config/nbfc.json'";
in {
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [pkgs.kmod];

    #  script = "${inputs.nbfc-linux.packages.x86_64-linux.default}/${command}";
    script = "${pkgs.nbfc-linux}/${command}";
   
    wantedBy = ["multi-user.target"];
  };
}
