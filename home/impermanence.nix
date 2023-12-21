{ config, ... }:

{
  home.persistence."/keep/home/${config.primary}" = {
    directories = map (d: { directory = d; method = "symlink"; }) [
      ".config/discord"
      ".config/github-copilot"
      ".config/google-chrome"
      ".config/nvim"
      ".config/spotify"
      ".config/Signal"
    ];
    allowOther = true;
  };
}
