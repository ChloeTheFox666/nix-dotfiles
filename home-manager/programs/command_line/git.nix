{ config, lib, machineName, ... }:

let
  machineUtils = import ../../utils/machineVariables.nix { inherit lib config; };
  machineVars = machineUtils.getMachineVariables machineName;
in
{
  programs.git = {
    enable = true;

    lfs.enable = true;
  };
}
