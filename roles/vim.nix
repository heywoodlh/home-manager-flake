{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      syntax on

      " Nord colorscheme 
      colorscheme nord
      
      filetype plugin indent on
      let g:mapleader = "\<Space>"
      let g:maplocalleader = ','

      " Press ctrl+n to toggle nerdtree
      map <C-n> :NERDTreeToggle<CR>

      " Show line numbers
      set number

      " Convert tabs to spaces
      set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
      
      " Ignore case with search
      set ignorecase smartcase

      " Use the system clipboard on Windows/MacOS/Linux
      set clipboard^=unnamed,unnamedplus
    '';
  
    plugins = with pkgs.vimPlugins; [
      ale
      base16-vim
      colorizer
      indentLine
      nerdtree
      nord-vim
    ];
  };
}
