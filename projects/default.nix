{ pkgs ? import <nixpkgs> {}
}:

let
  projectNames = [ "four" ];
  importProject = name: import (./. + "/${name}.nix") { inherit pkgs; };

  infoFile = { metadata, description }: pkgs.writeText "info.md" ''
    ---
    ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList
      (name: val: "${name}: ${val}") metadata)}
    ---
    ${description}
  '';

  projects = map (name:
    let project = importProject name;
    in {
      inherit (project) name;
      path = pkgs.linkFarm
        "elderephemera.github.io/projects/${project.name}" [
          { name = "info.md"; path = infoFile project.info; }
          { name = "content"; path = project.path; }
        ];
    }) projectNames;

in pkgs.linkFarm "elderephemera.github.io/projects" projects
