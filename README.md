### Windows Neovim Setting

```ruby

cd .config/nvim/.cache/dein/repos/github.com/takkii

git clone https://github.com/takkii/tenfile.git

cd tenfile

ruby install.rb

init.vimを初期配置

~/AppData/Local/nvim/init.vim

公式サイトより設置PATH確認

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

sh ./installer.sh ~/.cache/dein

自前なので、他はPython3のPATHを変更

let g:python3_host_prog='D:/Python3/python.exe'

```

dein.toml

```markdown

[[plugins]]
repo = 'takkii/tenfile'

```

config 設定例

```markdown

"Config Setting---------------------------

set laststatus=2

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified', 'ale'],
  \  ]
  \},
  \'component_function': {
  \  'ale': 'ALEGetStatusLine'
  \}
\ }

let g:ale_fix_on_save = 1

"Config Setting---------------------------

let g:quickrun_config = {'*': {'split': ''},'ruby': {'command': 'D:/Ruby26-x64/bin/ruby.exe'}}
set splitbelow

" Use deoplete.
set completeopt-=preview
let g:float_preview#docked = 0

" Gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:ale_linters = {
	\ 'go': ['gopls'],
	\}

"Config Setting---------------------------

```

Denite 設定例

```markdown

nnoremap <silent> <space>fr :<C-u>Denite file_mru -split="floating"<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent> <space>
  \ fr :<C-u>Denite file_mru -split="floating"<CR>
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_setting()
function! s:denite_filter_my_setting() abort
  inoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
  inoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
endfunction

```

Defx 設定例

```markdown

	autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \ 'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

```

ホームディレクトリに起動時移動

```markdown

cd ~

```

※ 各自、例を参考に設定。