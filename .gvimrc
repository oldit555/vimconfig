if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
  macmenu File.Print key=<nop>
end
colorscheme solarized
syntax enable
set background=dark
set guifont=Monaco:h15
