#
# Thunderbird email client setup
#

{
  ...
}: {
  # TODO try and understand this stuff better
  accounts.email.accounts = {
    mainEmail = {
      address = "fraser.a.maccoll@gmail.com";
      realName = "Fraser MacColl";
      flavor = "gmail.com";
      primary = true;
    };
  };

  programs.thunderbird = {
    enable = true;

    profiles = {
        mainEmail = {
          isDefault = true;
        };
    };
    # See below for more config options
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.thunderbird.enable
  };
}
