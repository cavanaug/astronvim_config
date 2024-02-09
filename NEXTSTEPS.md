## Cavanaugh Top Level

### Todo Items

- Typing practice, uncommon sequences that need to become automatic \[\]/,.\<>
  - Practice text object manipulations
    - inner (diw, di", di}, viw) and after (daw, da", da})
    - motion w, b, }, {
  - Next/Prev (Perhaps look at modal)
    - \]d \]c
- Copy buffer (set up shortcuts for local & windows)
- Help navigation
  - Figure out how to set custom mappings in help files.
- Final mappings
- Hydra plugin for state based mappings
- Folding (understand ufo preview & color highlighting)
- Neotree (understand full path)
-

### Tolearn Items

- quickfix
- noice (do I really want it)
- open file under cursor gff
- trouble
- marks (why not showing in signcolumns? conflict with git signs??)
- ultimate-autopair
- neoclip
- lsp-colors
- nvim-window-picker
- smart-splits
- neoconf

## Backlog

### diffview

something for resolving merges and examining diffs in git/hg maybe switch to vim-signify from
gitsigns

### Neotree

Write a neotree panel to show Info such as name, folder, possibly do something for buffers also

### Folding

Need to set highlight for the fold marker to be more visible for folded lines nnoremap
z<space><space> za

Ive got something for now, but could really use a bit more visibility on the fold info

### Mappings

#### what are these for

nmap > :cnext nmap \< :cprev

can i reuse these for help navigation vs spc-enter and spc-backspace?

### Plugins to research

### Settings

#### Are these useful??

```
" Fancy ANSI Chars Reference █
" ▉
" ╔══╦══╗ ┌──┬──┐ ╭──┬──╮ ╭──┬──╮ ┏━━┳━━┓ ╱╲╱╲╳╳╳ ▊
" ║┌─╨─┐║ │╔═╧═╗│ │╒═╪═╕│ │╓─╁─╖│ ┃┌─╂─┐┃ ╲╱╲╱╳╳╳ ▋
" ╠╡ ╳ ╞╣ ├╢   ╟┤ ├┼─┼─┼┤ ├╫─╂─╫┤ ┣┿╾┼╼┿┫ ┌┄┄┐ ╎ ┏┅┅┓ ┋ ▌
" ║└─╥─┘║ │╚═╤═╝│ │╘═╪═╛│ │╙─╀─╜│ ┃└─╂─┘┃ ░░▒▒▓▓██ ┊ ┆ ╎ ╏ ┇ ┋ ▍ ▁▂▃▄▅▆▇█
" ╚══╩══╝ └──┴──┘ ╰──┴──╯ ╰──┴──╯ ┗━━┻━━┛ └╌╌┘ ╎ ┗╍╍┛ ┋ ▎
" ▏
" ▶  ❱ ⚑ ▲ △ ▴ ▵ ▶ ▷ ▸ ▹ ► ▻ ▼ ▽ ✓ ✔ ✕ ✖ ✗ ✘ ❍ ❎ ❏ ❪ ❫ ❬ ❭ ❮ ❯ ❰ ❱ ➢ ➣ ➤ ➥
" ⚠ ⚡ ◇ ◈ ◉ ◊ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◕ ◖ ◗ ◠ ◡ ◢ ◣ ◤ ◥ ◦ ◧ ◨ ◩ ◪ ◫ ◬ ◭ ◮ ◯ ◰ ◱ ◲
" ◳ ◴ ◵ ◶ ◷ ◸ ◹ ◺ ◻ ◼ ◽ ◾ ◿ ✅ ☐ ☑ ☒
"
" ︙ ⡇ | . │ ┃ ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ ╵ ╶ ╷ ⠅⠂
"
```

#### vim-instantmarkdown

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'} "let
g:instant_markdown_logfile = '/tmp/instant_markdown.log' "let g:instant_markdown_browser =
'windows-webbrowser' "autocmd FileType markdown nmap <F8> :LivedownToggle<CR>

#### vim-signify

Do i need to switch to this from gitsigns so hg works

let g:signify_sign_change = '▲' let g:signify_sign_add = '+' let g:signify_sign_delete = '✘' let
g:signify_sign_delete_first_line = '✘' let g:signify_sign_change = '~'

#### Tags and navigation

Can these be set per buffer? Like help?

map <Space><Return> \<C-\]> map <Space><BS> <C-T>

### Autocommands

"########### NormalMode - Load up a bunch of my favorite macros

" Lazy settings " Make searching a little easier/cleaner nnoremap <silent> n nzz " Make search
next/prev be centered vertically nnoremap <silent> N Nzz " Make search next/prev be centered
vertically

"########### NormalMode/Leader - Macros map <leader>! 0i:r!"ndd@n map <leader>@ "myy@m

map <silent> / dePo/\<pA>"wdd@w " map <silent> \\H :tabnew<CR>:help<CR>:wincmd j<CR>:q<CR> " map
<leader>U :%! map <leader>u :'x,'y! " Lazy Quickkeys map <leader>R :%s/ map <leader>r :'x,'ys/

"# \\b - Indent current block ( ie { } ) # "# \\i - Indent current function/procedure (Assumes basic
formatting) # "# \\f - Format paragraph # "# \\F - Format entire document # "# \< - Shift x -> y
region 1 tab stop left # "# > - Shift x -> y region 1 tab stop right # "# , - Shift x -> y region 1
space left # "# . - Shift x -> y region 1 space right #
"###############################################################################
