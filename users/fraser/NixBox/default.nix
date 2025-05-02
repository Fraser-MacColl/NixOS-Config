#
# Default Home-Manager configs for fraser, specific to NixBox host
#
{ pkgs, ... }:
{
  # Default for pretty much everything except below
  imports = [
    ../default.nix
  ];

  # #=--------------=#
  # |  RCLONE MOUNT  |
  # #=--------------=#

  home.packages = [ pkgs.fuse ];

  # Config file is not auto generated, as it would then need to hold secrets, which shouldn't be added to the nix store.
  # Instead, will a remote called "onedrive" once it exists in the default file location.
  # Basically, on fresh install run through the standard "rclone config" setup, and in future it will be autostarted.
  # Will probably need manually restarted on first addition however.

  systemd.user.services.onedrive-mount = {
    Unit = {
      Description = "Onedrive automount for fraser managed by home manager.";
      StartLimitIntervalSec = 70;
      StartLimitBurst = 3;
    };

    Service = {
      Type = "notify";
      ExecStartPre = [
        "${pkgs.coreutils}/bin/mkdir -p %h/Onedrive"
        "${pkgs.coreutils}/bin/sleep 20" # Sleep 20 seconds before starting to let wifi connect
      ];
      ExecStart = "${pkgs.rclone}/bin/rclone --vfs-cache-mode writes mount onedrive: %h/Onedrive";
      # This fusermount command consistently returning operation not permitted for some reason, despite manually running command working.
      # Just commenting out for the time being to stop constant errors in journal, though it's not a clean shutdown anymore
      # ExecStop = "${pkgs.fuse}/bin/fusermount -u %h/Onedrive";

      # In combination with the start limits above, this makes the unit try to restart 3 times
      # spaced 20 seconds apart. If these fail it sends a notification
      Restart = "on-failure";
      RestartSec = "20";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
