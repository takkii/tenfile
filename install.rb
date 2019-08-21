# frozen_string_literal: true
#!/usr/bin/ruby

class Dark
  def black
    myhome = File.expand_path('~/AppData/Local/nvim')
    Dir.mkdir(myhome, perm = 0o777) unless FileTest.exist?(myhome)
  end
end

Dark.new.black

class White
  def magic
    myhome = File.expand_path('~/AppData/Local/nvim/init.vim')
    File.open(myhome, 'a:utf-8', perm = 0o777) do |f|
      f.puts <<-DOC

"Config Setting---------------------------

let g:python3_host_prog='D:/Python3/python.exe'

"Config Setting---------------------------

" Copy and Paste ↓

"Defx Config Setting----------------------

"Defx Config Setting----------------------

"Denite config Setting--------------------

"Denite config Setting--------------------

"Config Setting---------------------------

"Config Setting---------------------------

"Config Setting---------------------------

" Copy and Paste ↑

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/.cache/dein/repos/github.com/Shougo/dein.vim
"set runtimepath+=~/.config/nvim/plugins/deoplete.nvim-5.0

" Required:
if dein#load_state('~/.config/nvim/.cache/dein')
  call dein#begin('~/.config/nvim/.cache/dein')

 let s:toml_dir  = $HOME . '/.config/nvim/rc'
 let s:toml      = s:toml_dir . '/dein.toml'
 let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

 " Toml save reading...
 call dein#load_toml(s:toml,      {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"Config Start ----------------------------

let g:neomake_open_list = 2
set background=dark
" colorscheme jellybeans
" colorscheme mrkn256
colorscheme iceberg
set splitbelow
set nobackup
set noundofile
set noswapfile
syntax enable
set number
set wildmenu
set wildmode=list:full

"Config End ------------------------------

cd ~/
      DOC
    end
  end
end

White.new.magic
