#
# Rclone config, set up to mount onedrive automatically
#

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    coreutils
    rclone
    fuse
  ];

  # Config file is not auto generated, as it would then need to hold secrets, which shouldn't be added to the nix store.
  # Instead, will a remote called "onedrive" once it exists in the default file location.
  # Basically, on fresh install run through the standard "rclone config" setup, and in future it will be autostarted.
  # Will probably need manually restarted on first addition however.

  systemd.user.services.onedrive-mount = {
    Unit = {
      Description = "Onedrive automount for fraser managed by home manager.";
      After = [ "network-online.target" ];
    };
    Service = {
      Type = "notify";
      # Causing issues with mkdir not existing
#      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/Onedrive";
      ExecStart = "${pkgs.rclone}/bin/rclone --vfs-cache-mode writes mount onedrive: %h/Onedrive";
      ExecStop = "${pkgs.fuse}/bin/fusermount -u %h/Onedrive";
    };
    Install.WantedBy = [ "default.target" ];
  };
}
