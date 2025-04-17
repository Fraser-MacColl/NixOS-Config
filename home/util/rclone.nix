#
# Rclone config, set up to mount onedrive automatically
#

{
  pkgs,
  ...
}: {
  programs.rclone = {
    enable = true;

    remotes.onedrive = {
      config = {
        type = "onedrive";
        drive_type = "personal";
      };

      secrets = {
        token = "/home/fraser/.config/rclone/od_token.txt";
        drive_id = "/home/fraser/.config/rclone/od_drive_id.txt";
      };
    };
  };
}
