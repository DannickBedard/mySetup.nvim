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

## Insert mode action

U -> On selection make UPPERCASE

u -> On selection make lowercase

y -> yand selection

<leader>y -> yand selection to system clipboard

c -> change selection

d -> delete selection

i" -> Select everything inside " (Can do with ", ', (, ), {, }, [, ], t) note: t is for tag

a" -> Select everything inside " including (same à i but include the around)

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

<leader><leader>n -> New tabs with the current page (:tabnew %<CR>)

<leader>n   -> Next tabs (:tabn<CR>)

<leader>N   -> Previous tabs (:tabp<CR>)

## Maks
m<char>     -> Set Mark
'<char>     -> Get Mark
m<CHAR>     -> Set Global Mark
'<CHAR>     -> Get Global Mark

## Telescope

<leader>sf  -> Search by fileName

<leader>fg  -> Fuzzy find global

<leader>fb  -> Fuzzy find buffer

<leader>fh  -> Find in help

## Harpoon

<leader>a   -> Harpoon current file to list

<leader>d   -> Harpoon remove current file to list 

<leader>1-9 -> Got to x item in list

<C-e>       -> Open list with telescope

<C-d>       -> delete current selected in list (List mode)

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

# Other tips

Rename something multiple time : 
\* on word afer N <action>gn than n to go to next occurence and to . to repeate the gn action

## Notes

Rename something multiple time : 
\* on word afer N <action>gn than n to go to next occurence and to . to repeate the gn action

Rename something multiple time : 
\* on word afer N <action>gn than n to go to next occurence and to . to repeate the gn action
