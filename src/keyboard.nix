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
  imports = [];
  config = {
    services.xremap = {
      enable = lib.mkDefault true;
      package = pkgs.xremap;
      services = {
        "primary" = {
          watch.configFile = false;
          watch.devices = true;
          watch.ignore = [];
          devices = [];
          settings = {
            modmap = [];
            keymap = [];
          };
        };
      };
      # configurations = mapAttrs (name: service: service.config) config.services.xremap.services;
    };
  };
}
