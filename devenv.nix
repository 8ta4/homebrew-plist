{ lib, pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;
  pre-commit.hooks = {
    gitleaks = {
      enable = true;

      # https://github.com/gitleaks/gitleaks/blob/76c9e3175bc88e4520494f160cc90c1d6231fb82/.pre-commit-hooks.yaml#L4
      entry = "${pkgs.gitleaks}/bin/gitleaks protect --verbose --redact --staged";
    };
    nixpkgs-fmt.enable = true;
    prettier = {
      enable = true;
      entry = lib.mkForce "${pkgs.nodePackages.prettier}/bin/prettier --ignore-unknown --write";
    };

    trailing-whitespace = {
      enable = true;

      # https://github.com/pre-commit/pre-commit-hooks/blob/4b863f127224b6d92a88ada20d28a4878bf4535d/.pre-commit-hooks.yaml#L204
      entry = "${pkgs.python3Packages.pre-commit-hooks}/bin/trailing-whitespace-fixer";

      # https://github.com/pre-commit/pre-commit-hooks/blob/4b863f127224b6d92a88ada20d28a4878bf4535d/.pre-commit-hooks.yaml#L206
      types = [ "text" ];
    };
  };

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
