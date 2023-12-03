### Priority

- Opening page
- Neotree
- Help navigation
- Folding
- Final mappings
- Code browsing

### diffview

something for resolving merges and examining diffs in git/hg
maybe switch to vim-signify from gitsigns

### Neotree

Setup a mapping for cycling thru file/git/etc
Setup a mapping (docs) for showing current file in tree

### Folding

need to setup a nice folding marker etc
is there a way to set a marker with hidden text for deleted lines

set foldenable
set foldcolumn=3
set foldlevelstart=4
set foldminlines=1
set foldmethod=marker
nnoremap z<space><space> za

### Mappings

#### what are these for

nmap > :cnext
nmap < :cprev

can i reuse these for help navigation vs spc-enter and spc-backspace?

### Plugins to research

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

### Settings

#### What are these for

set listchars=tab:▸\ ,eol:¬
set noshowcmd
set noshowmode
set noerrorbells

#### Tabs and wild???

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set showtabline=1
set wildmode=list:longest
set wildmenu
set modeline

#### Are these useful??

set incsearch
set hlsearch
"let &showbreak='↪ '

#### vim-json

let g:vim_json_syntax_conceal = 1
set showmatch

" Fancy ANSI Chars Reference █
" ▉
" ╔══╦══╗ ┌──┬──┐ ╭──┬──╮ ╭──┬──╮ ┏━━┳━━┓ ╱╲╱╲╳╳╳ ▊  
" ║┌─╨─┐║ │╔═╧═╗│ │╒═╪═╕│ │╓─╁─╖│ ┃┌─╂─┐┃ ╲╱╲╱╳╳╳ ▋  
" ╠╡ ╳ ╞╣ ├╢ ╟┤ ├┼─┼─┼┤ ├╫─╂─╫┤ ┣┿╾┼╼┿┫ ┌┄┄┐ ╎ ┏┅┅┓ ┋ ▌
" ║└─╥─┘║ │╚═╤═╝│ │╘═╪═╛│ │╙─╀─╜│ ┃└─╂─┘┃ ░░▒▒▓▓██ ┊ ┆ ╎ ╏ ┇ ┋ ▍ ▁▂▃▄▅▆▇█  
" ╚══╩══╝ └──┴──┘ ╰──┴──╯ ╰──┴──╯ ┗━━┻━━┛ └╌╌┘ ╎ ┗╍╍┛ ┋ ▎
" ▏
" ▶  ❱ ⚑ ▲ △ ▴ ▵ ▶ ▷ ▸ ▹ ► ▻ ▼ ▽ ✓ ✔ ✕ ✖ ✗ ✘ ❍ ❎ ❏ ❪ ❫ ❬ ❭ ❮ ❯ ❰ ❱ ➢ ➣ ➤ ➥
" ⚠ ⚡ ◇ ◈ ◉ ◊ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◕ ◖ ◗ ◠ ◡ ◢ ◣ ◤ ◥ ◦ ◧ ◨ ◩ ◪ ◫ ◬ ◭ ◮ ◯ ◰ ◱ ◲
" ◳ ◴ ◵ ◶ ◷ ◸ ◹ ◺ ◻ ◼ ◽ ◾ ◿ ✅ ☐ ☑ ☒
"
" ︙ ⡇ | . │ ┃ ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ ╵ ╶ ╷ ⠅⠂
"

#### vim-instantmarkdown

"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_browser = 'windows-webbrowser'

#### vim-signify

let g:signify_sign_change = '▲'
let g:signify_sign_add = '+'
let g:signify_sign_delete = '✘'
let g:signify_sign_delete_first_line = '✘'
let g:signify_sign_change = '~'

#### Tags

map <Space><Return> <C-]>
map <Space><BS> <C-T>

### Autocommands

" ALL AUTOCOMMANDS ARE WRAPPED....
" Allows for functioning with vim-minimal & auto sourcing of vimrc
if has("autocmd")
augroup configgroup
autocmd!
"
" Enable file type detection
autocmd FileType dosini set foldminlines=0 foldlevel=0
autocmd FileType dosini highlight! link dosiniHeader Function
" Special handling for cson, json & avro
autocmd FileType json setlocal foldmethod=syntax foldlevel=9 foldminlines=5
autocmd FileType json highlight! link jsonKeyword Identifier
autocmd FileType json5 setlocal foldmethod=syntax foldlevel=9 foldminlines=5
autocmd FileType json5 highlight! link jsonKeyword Identifier
autocmd BufNewFile,BufRead _.avsc setfiletype json
autocmd BufNewFile,BufRead _.cson setfiletype coffee

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
" Treat .rss files as XML
autocmd BufNewFile,BufRead _.rss _.atom setfiletype xml
"autocmd BufWritePre _.py,_.js :call <SID>StripTrailingWhitespaces()

"autocmd FileType markdown nmap <F8> :LivedownToggle<CR>

augroup END
endif

"########### NormalMode - Load up a bunch of my favorite macros

" Lazy settings
map ; :
" Make searching a little easier/cleaner
nnoremap <silent> n nzz " Make search next/prev be centered vertically
nnoremap <silent> N Nzz " Make search next/prev be centered vertically
noremap <silent> <return><return> :nohlsearch<CR>

"########### NormalMode/Leader - Macros
map <leader>! 0i:r!"ndd@n
map <leader>@ "myy@m

" Shortcuts for adding pre/post chars to a word
map <leader>" ebi"ea"b
map <leader>' ebi'ea'b
map <leader>( ebi(ea)b
map <leader>* ebi*ea\*b
map <leader>[ ebi[ea]b
map <leader>* ebi*ea_b
map <leader>{ ebi{ea}b

" Shortcuts for (de)indenting a block by a space or a tab
" TODO: I may not need these anymore with dragvisuals
map <silent> \, :'x,'ys/^.//g<CR>
map <silent> \. :'x,'ys/^/ /g<CR>
map <silent> \< :'x,'y <<CR>
map <silent> \> :'x,'y ><CR>
map <silent> \/ dePo/\<pA\>"wdd@w
"
" Text reformatting
map <silent> \b (jmx)kmy\uindent<CR>(
map <silent> \E :%!expand -<CR>
map <silent> \f {j!}par 120<CR>}be
map <silent> \I :%!indent<CR>1G
" Help/Docs
map <silent> \h :!grep ^"# ~/.vimrc<CR>
map <silent> \H :tabnew<CR>:help<CR>:wincmd j<CR>:q<CR>
"
map <leader>n Gdd\/
" Execute cmd externally
map <leader>U :%!
map <leader>u :'x,'y!
" Lazy Quickkeys
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>R :%s/
map <leader>r :'x,'ys/
map <leader>w \/
map ; :

"###############################################################################
"# Cavanaugh's Custom "vi" Configurations #
"###############################################################################
"# EDIT MODE #
"###############################################################################
"# #
"# \["_\*] - Prefix/suffix current word with appropriate ["_\*] #
"# \[[({] - Prefix/suffix current word with appropriate [], (), or {} #
"# #
"# \E - Expand document tabs to x spaces #
"# \b - Indent current block ( ie { } ) #
"# \i - Indent current function/procedure (Assumes basic formatting) #
"# \I - Indent current file #
"# \f - Format paragraph #
"# \F - Format entire document #
"# #
"# \w - Search for current word #
"# \r - Search and replace in the x -> y region #
"# \R - Search and replace globally #
"# #
"# \u - Execute unix cmd on x -> y region #
"# \U - Execute unix cmd globally #
"# \! - Execute line as :r! command #
"# \@ - Execute line as a straight vi command #
"# #
"# \< - Shift x -> y region 1 tab stop left #
"# \> - Shift x -> y region 1 tab stop right #
"# \, - Shift x -> y region 1 space left #
"# \. - Shift x -> y region 1 space right #
"###############################################################################
