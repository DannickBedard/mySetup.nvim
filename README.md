# mySetup.nvim

Started using vim in feburary 2024

## Theme
One dark pro : https://github.com/olimorris/onedarkpro.nvim

## plugins

### Telescope :
Description : 
url : 

### NeoTree
Description : 
url : 

### Treesitter
Description : 
url : 

### Mason
Description : 
url : https://github.com/williamboman/mason.nvim

### Mason-lspconfig
Description : 
url : https://github.com/williamboman/mason-lspconfig.nvim

### Nvim-lspconfig
Description : 
url : https://github.com/neovim/nvim-lspconfig

# Keymap

## Navigation / Normal mode action

<leader>p   -> Paste from last yank (after cursor)

<leader>P   -> Paste from last yank (before cursor)

<leader>y   -> Yank to systemClipboard ("+y)

<leader>cp  -> Paste from systemClopboard ("+p)

<leader>cP  -> Paste from systemClopboard ("+P)

<leader>dirp -> Paste current dir ("%p)

yyp         -> Duplicate line without affecting register in my setup (:co.)

ddp         -> Swap line

<leader>j   -> Swap current line with the one under

<leader>k   -> Swap currnet ligne with the one above (does not work preperly when at the end of the file)

<leader>B   -> Enter visual block mode

<C-w>o      -> Close all other windows

gv          -> Go to previous selection

<C-6>       -> Alternative file nav

ciq         -> ci"
ciq         -> ci"
diq         -> di"
yiq         -> yi"
viq         -> vi"
caq         -> ca"
daq         -> da"
yaq         -> ya"
vaq         -> va"

## splits
<leader>s   -> Split vertical

<leader>S   -> Split horizontal
<c-w>o      -> Remove all split but keep the current window open
<c-w>=      -> Make all the split equal
<c-w>|      -> Make the current window wider horizontal
<c-w>_      -> Make the current window wider vertical

## Fold

zf{motion}  -> Fold current line to the motions
{Visual}zf  -> Fold the current selection
za          -> toggle fold under cursor

zo          -> Open the fold under cursor
zO          -> Open all fold
zc          -> close fold under cursor
zC          -> Close all fold

## Insert mode action

U -> On selection make UPPERCASE

u -> On selection make lowercase

y -> yand selection

<leader>y -> yand selection to system clipboard

c -> change selection

d -> delete selection

i" -> Select everything inside " (Can do with ", ', (, ), {, }, [, ], t) note: t is for tag

a" -> Select everything inside " including (same à i but include the around)

## Search mode (/)

<C-r><C-w> -> Search current word under cursor

<C-r>0      -> Paste yanked text

<C-r>"      -> Paste from register 

## Easy-motion
always begin with <leader><leader>

w -> Make selection forward in current line

b -> Make selection backward in current line

a -> Make selection hint beginin of work everywhere

j -> Make selection start of line under current line

k -> Make selection start of line hover current line

f<char> -> Make selection for char forward in current line (the cursor lend on the char)

F<char> -> Make selection for char backward in current line (the cursor lend on the char)

f<char> -> Make selection for char forward in current line (the cursor lend before the char)

F<char> -> Make selection for char backward in current line (the cursor lend before the char)

s<char> -> Make selection for char in the current file. (the cursor lend on the char)


## Tabs navigation

<leader>tt  -> New tabs with the current page (:tabnew %<CR>)
gt          -> Next tabs 
gT          -> Previous tabs 

## Quicks fix list

<leader>q   -> Open quick fix list
<leader>Q   -> Close quick fix list
<leader>n   -> Next in quick fix list
<leader>N   -> Previous in quick fix list
<leader>qf   -> First in quick list
<leader>ql   -> Last in quick list

## Maks

m<char>     -> Set Mark
'<char>     -> Get Mark
m<CHAR>     -> Set Global Mark
'<CHAR>     -> Get Global Mark

## LSP navigation / keymap

<leader>dh  -> Open diagnostic in floting window
<leader>dn  -> Naviagte to next diagnostic
<leader>dN  -> Naviagte to previous diagnostic
<leader>dq  -> Put all diagnostic to quickfix list

gd          -> Go to definition
gD          -> Go to declaration
<leader>h   -> Open lsp hover info
gi          -> Gi to implementation
<C-k>          -> signature_help ??
<leader>wa  -> Add workspace folder
<leader>wr  -> Remove workspace folder
<leader>wl  -> Liast workspace folders
<leader>oc  -> outgoing_calls
<leader>D   -> type_definition
<leader>rn  -> rename
<leader>ca  -> Code actions
gr          -> references
<leader>f   -> format



## Telescope

<leader>ff  -> Search by fileName

<leader>fg  -> Fuzzy find global

<leader>fb  -> Fuzzy find buffer

<leader>fh  -> Find in help

<leader>fr  -> Resume last search

<leader>fs  -> (find string) Find open telescope searching for word under cusor. Than you can filter by file name

<leader>fw  -> (find word) Open grep search then output to telescope searching for grep result. Than you can filter by file name
<leader>fW  -> (find WORD) Open grep search then output to telescope searching for grep result. Than you can filter by file name

## Harpoon

<leader>a   -> Harpoon current file to list

<leader>d   -> Harpoon remove current file to list 

<leader>1-9 -> Got to x item in list

<C-e>       -> Open list with telescope

<C-d>       -> delete current selected in list (List mode)

## Undotree

<leader>u   -> Toggle undo tree

## none-ls

<leader>gf  -> Format entire file

## Comment.nvim

gcc         -> comment current line or de-comment   
gbc         -> Toggle the current line using blockwise comment
gc          -> visual mode : Toggles the region using linewise comment
gb          -> visual mode : Toggles the region using blockwise comments 

## Neo-tree

<leader>ft  -> (file tree) Show fileExplorer on left :Neotree filesystem reveal left<CR>

H           -> while in file explore toggle hidden file


## oil

\-           -> Open current directory to edition un buffer

## Completion

<C-x><C-f> -> auto complet file path
<C-k> -> Open current signing of param in method
<C-n> -> Trigger completion next
<C-p> -> Trigger completion previous

## Commands (quickfixs)

:lopen              -> Open quick fix

:lclose or lcl      -> Close quick fix

:lnext              -> Go to next item

:lprev              -> Go to previous item

:lfirst             -> Go to first item

:llast              -> Go to last item

:ll<n>              -> Go to n item

# Other tips

Rename something multiple time : 
\* on word afer N <action>gn than n to go to next occurence and to . to repeate the gn action

## Notes

Rename something multiple time : 
\* on word afer N <action>gn than n to go to next occurence and to . to repeate the gn action

Issue with M^ :
:set fileformat=unix
or in bash :
dos2unix path/name*

Replace but keep a instance of the selection to happend our prepend
1234 -> BSP-1234
:%s/\(.*\)/BSP-\1

BSP-1234 -> 1234
:%s/\(.*\)-\(.*\)/\2/g
