{ config, ... }:

{
  networking = {
    hostName = config.primary;
    networkmanager.enable = true;

    # def con infra
    # http://184.72.58.228/ should be `sicer`
    # extraHosts = ''
    #   184.72.58.228 sicer
    # '';
  };

  services.resolved.enable = true;

  # currently in a coffee shop with super busted internet
  # might have to delete to make captive portals work in future (unsure)
  # networking.nameservers = [
  #   "1.1.1.1#one.one.one.one"
  #   "1.0.0.1#one.one.one.one"
  # ];
  # services.resolved = {
  #   dnssec = "true";
  #   domains = [ "~." ];
  #   fallbackDns = [
  #     "1.1.1.1#one.one.one.one"
  #     "1.0.0.1#one.one.one.one"
  #   ];
  #   dnsovertls = "true";
  # };
}
