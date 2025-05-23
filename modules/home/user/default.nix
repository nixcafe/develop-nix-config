{
  lib,
  config,
  namespace,
  ...
}:
let
  cfg = config.${namespace}.user;
in
{
  options.${namespace}.user = {
    enable = lib.mkEnableOption "user" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    # Set the host parameters. Do not modify them if not necessary.
    cattery.user = {
      addToAccounts = true;
      settings = lib.${namespace}.host // {
        inherit (config.snowfallorg.user) name;
      };
    };
  };
}
