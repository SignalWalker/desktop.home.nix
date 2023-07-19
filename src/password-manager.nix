{
  config,
  pkgs,
  lib,
  ...
}:
with builtins; let
  std = pkgs.lib;
in {
  options = with lib; {};
  disabledModules = [];
  imports = [];
  config = {
    home.packages = with pkgs; [
      bitwarden
      authy
    ];
    signal.desktop.scratch.scratchpads = {
      "Shift+A" = {
        criteria = {class = "Authy Desktop";};
        startup = "authy";
        autostart = true;
        automove = true;
      };
      "Shift+P" = {
        criteria = {class = "Bitwarden";};
        resize = 75;
        startup = "bitwarden";
        autostart = true;
        automove = true;
      };
    };
  };
  meta = {};
}