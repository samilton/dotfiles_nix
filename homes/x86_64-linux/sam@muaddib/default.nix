{pkgs, ...}: {
  desktops = {
    hyprland = {
      enable = true;
      execOnceExtras = [
        "${pkgs.trayscale}/bin/trayscale"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
        "${pkgs.blueman}/bin/blueman-applet"
      ];
    };
  };

  roles = {
    desktop.enable = true;
    social.enable = true;
    video.enable = true;
  };

  nixicle.user = {
    enable = true;
    name = "sam";
  };

  home.stateVersion = "24.05";
}
