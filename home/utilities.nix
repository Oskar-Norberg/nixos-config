{config, pkgs, ...}:

{
  services.udiskie = {
    enable = true;
    settings = {
        program_options = {
            # TODO: Hardcoded garbage
            file_manager = "kitty -e yazi";
        };
    };
};
}

