{ config, pkgs, ... }:

{
  nixpkgs.overlays = [ (self: super: {
      my_vim = super.vim_configurable.override {
        config.vim.ruby = true;
        ruby = pkgs.ruby;
        python = pkgs.python;
      };
    })];


  environment.systemPackages = with pkgs; [
    (
        pkgs.my_vim.merge {
          name = "vim";
        }
    )
  ];
}
