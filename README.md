# mySetup.nvim

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

<leader>cp  -> Past from systemClopboard ("+p)

<leader>cP  -> Past from systemClopboard ("+P)

yyp         -> Duplicate line without affecting register (:co.)

ddp         -> Swap line

J           -> = to 5j (replace default join keymap)

K           -> = to 5k (replace default join keymap)

<leader>j   -> override join line under

<leader>k   -> override join line hover

<leader>B   -> Enter visual block mode

<C-w>o      -> Close all other windows

gv          -> Go to previous selection

<C-6>       -> Alternative file nav

<leader>s   -> Split vertical

<leader>S   -> Split horizontal

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

<leader>tt -> New tabs with the current page (:tabnew %<CR>)

<leader>tn   -> Next tabs (:tabn<CR>)

<leader>tp   -> Previous tabs (:tabp<CR>)

## Quicks fix list

<leader>q   -> Open quick fix list
<leader>Q   -> Close quick fix list
<leader>n   -> Next in quick fix list
<leader>N   -> Prious in quick fix list
<leader>qf   -> First in quick list
<leader>ql   -> Last in quick list

## Maks
m<char>     -> Set Mark
'<char>     -> Get Mark
m<CHAR>     -> Set Global Mark
'<CHAR>     -> Get Global Mark

## Telescope

<leader>ff  -> Search by fileName

<leader>fg  -> Fuzzy find global

<leader>fb  -> Fuzzy find buffer

<leader>fh  -> Find in help

<leader>fr  -> Resume last search

<leader>ps  -> Find open telescope searching for word under cusor. Than you can filter by file name

<leader>pws  -> Open grep search then output to telescope searching for grep result. Than you can filter by file name
<leader>pWs  -> Open grep search then output to telescope searching for grep result. Than you can filter by file name

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

## Neo-tree

<C-n>       -> Show fileExplorer on left :Neotree filesystem reveal left<CR>

<leader>bf  -> :Neotree buffers reveal float<CR>

H           -> while in file explore toggle hidden file


## oil

\-           -> Open current directory to edition un buffer

## lsp

todo...

## Completion

todo..

## Text edition normal mode

<leader>j   -> override join line under

<leader>k   -> override join line hover

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

Rename something multiple time : 
\* on word afer N <action>gn than n to go to next occurence and to . to repeate the gn action
