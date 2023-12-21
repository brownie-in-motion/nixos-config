{ config, ... }:

let
  user = config.primary;
  keep = config.persist;
in
{
  home.persistence."/keep/home/${user}" = {
    directories = map (d: { directory = d; method = "symlink"; }) keep;
    allowOther = true;
  };

  persist = [ ".config/git" ];
}
