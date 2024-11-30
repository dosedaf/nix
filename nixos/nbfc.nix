# nbfc.nix
{
  config,
  inputs,
  pkgs,
  ...
}: let
  myUser = "yoda"; 
  command = "bin/nbfc_service --config-file '/home/${myUser}/.config/nbfc.json'";
in {
  environment.systemPackages = with pkgs; [
    # if you are on stable uncomment the next line
    # inputs.nbfc-linux.packages.x86_64-linux.default
    # if you are on unstable uncomment the next line
    nbfc-linux
  ];

  # Create the nbfc.json configuration file
	 system.activationScripts.createNbfcConfig = ''
   mkdir -p /home/${myUser}/.config
   echo '{"SelectedConfigId": "Acer Nitro AN515-58"}' > /home/${myUser}/.config/nbfc.json
   chown ${myUser}:users /home/${myUser}/.config/nbfc.json
 '';

  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [pkgs.kmod];
    # if you are on stable uncomment the next line
    #  script = "${inputs.nbfc-linux.packages.x86_64-linux.default}/${command}";
    # if you are on unstable uncomment the next line
    script = "${pkgs.nbfc-linux}/${command}";
   
    wantedBy = ["multi-user.target"];
  };
}
