{ pkgs }:
let
  python3Optimized = pkgs.python3.override {
    enableOptimizations = true;
    reproducibleBuild = false;
    self = python3Optimized;
  };
in python3Optimized.withPackages (p:
  with p; [
    ipython # interactive shell
    jupyter # interactive notebooks
    matplotlib # plots
    numpy # numerical computation
    scipy # numerical computation
    pandas # data analysis
    requests # HTTP library
    setuptools # setup.py
    jupyter-client
  ])
