### Priority

- Copy buffer (set up shortcuts for local & windows)
- Help navigation
- Final mappings
- Folding (understand ufo preview)
- Neotree (understand full path)

### diffview

something for resolving merges and examining diffs in git/hg
maybe switch to vim-signify from gitsigns

### Neotree

Setup a mapping for cycling thru file/git/etc
Setup a mapping (docs) for showing current file in tree

### Folding

Need to set highlight for the fold marker to be more visible for folded lines
set foldcolumn=3
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

### Settings

#### What are these for

set listchars=tab:▸\ ,eol:¬
"let &showbreak='↪ '

#### Tabs and wild???

What am i going to use for tabs? Globally? per file??
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set showtabline=1

#### Are these useful??

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

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_browser = 'windows-webbrowser'
"autocmd FileType markdown nmap <F8> :LivedownToggle<CR>

#### vim-signify

Do i need to switch to this from gitsigns so hg works

let g:signify_sign_change = '▲'
let g:signify_sign_add = '+'
let g:signify_sign_delete = '✘'
let g:signify_sign_delete_first_line = '✘'
let g:signify_sign_change = '~'

#### Tags

Can these be set per buffer? Like help?

map <Space><Return> <C-]>
map <Space><BS> <C-T>

### Autocommands

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"autocmd BufWritePre _.py,_.js :call <SID>StripTrailingWhitespaces()

"########### NormalMode - Load up a bunch of my favorite macros

" Lazy settings
" Make searching a little easier/cleaner
nnoremap <silent> n nzz " Make search next/prev be centered vertically
nnoremap <silent> N Nzz " Make search next/prev be centered vertically

"########### NormalMode/Leader - Macros
map <leader>! 0i:r!"ndd@n
map <leader>@ "myy@m

map <silent> \/ dePo/\<pA\>"wdd@w
"
map <silent> \H :tabnew<CR>:help<CR>:wincmd j<CR>:q<CR>
"
map <leader>U :%!
map <leader>u :'x,'y!
" Lazy Quickkeys
map <leader>R :%s/
map <leader>r :'x,'ys/

"# \b - Indent current block ( ie { } ) #
"# \i - Indent current function/procedure (Assumes basic formatting) #
"# \f - Format paragraph #
"# \F - Format entire document #
"# \< - Shift x -> y region 1 tab stop left #
"# \> - Shift x -> y region 1 tab stop right #
"# \, - Shift x -> y region 1 space left #
"# \. - Shift x -> y region 1 space right #
"###############################################################################
