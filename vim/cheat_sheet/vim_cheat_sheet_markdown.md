# VIM CHEAT SHEET

Comprehensive reference for Vim commands and configuration

---

**Vim operates in different modes:** Normal (default, press Esc), Insert (typing text, press i/a/o), Visual (selecting text, press v), and Command (executing commands, press :)

## Tips for Beginners

- Start with **vimtutor** - run this command in your terminal for an interactive tutorial
- Use **hjkl** for movement instead of arrow keys to build muscle memory
- Stay in normal mode as much as possible - only enter insert mode when actively typing
- Learn one new command per day rather than trying to memorize everything at once
- Practice the most common operations: navigation, insertion, deletion, and saving
- Use **:help** extensively - Vim's built-in documentation is excellent

## Configuration

Add these common settings to your `~/.vimrc` file:

### Display Settings

```vim
set number          " Show line numbers
set relativenumber  " Show relative line numbers
syntax on           " Enable syntax highlighting
```

### Buffer Settings

```vim
set hidden                  " Allow unsaved buffer switching
set autowrite              " Auto-save when switching buffers
set confirm                 " Ask before discarding changes
set switchbuf=useopen       " Jump to existing window if open
```

### Indentation

```vim
set tabstop=4       " Set tab width
set shiftwidth=4    " Set indent width
set expandtab       " Use spaces instead of tabs
set autoindent      " Auto-indent new lines
```

### Search Settings

```vim
set hlsearch        " Highlight search results
set incsearch       " Incremental search
set ignorecase      " Case-insensitive search
set smartcase       " Case-sensitive if uppercase present
```

### Interface Settings

```vim
set cursorline      " Highlight current line
set showmatch       " Highlight matching brackets
set ruler           " Show cursor position
set laststatus=2    " Always show status line
set wildmenu        " Enhanced command completion
set scrolloff=5     " Keep lines above/below cursor
```

### Editor Behavior

```vim
set noswapfile              " Disable swap files
set nobackup               " Disable backup files
set undofile               " Enable persistent undo
set clipboard=unnamedplus  " Use system clipboard
set mouse=a                " Enable mouse support
```

---

## Modes

### Mode Switching

| Command  | Description       |
| -------- | ----------------- |
| `Esc`    | Normal mode       |
| `v`      | Visual mode       |
| `V`      | Visual line mode  |
| `Ctrl+v` | Visual block mode |

### Entering Insert Mode from Normal Mode

| Command | Description             |
| ------- | ----------------------- |
| `i`     | Insert mode             |
| `I`     | Insert at line start    |
| `a`     | Append after cursor     |
| `A`     | Append at line end      |
| `o`     | New line below          |
| `O`     | New line above          |
| `s`     | Delete char and insert  |
| `S`     | Delete line and insert  |
| `gi`    | Insert at last position |

## Navigation

### Basic Movement

| Command   | Description           |
| --------- | --------------------- |
| `h j k l` | Left, down, up, right |

### Word Movement

| Command | Description   |
| ------- | ------------- |
| `w`     | Word forward  |
| `b`     | Word backward |
| `e`     | End of word   |
| `W`     | WORD forward  |
| `B`     | WORD backward |
| `E`     | End of WORD   |

### Line Movement

| Command | Description          |
| ------- | -------------------- |
| `0`     | Line start           |
| `^`     | First non-blank char |
| `$`     | Line end             |

### Screen Movement

| Command | Description      |
| ------- | ---------------- |
| `H`     | Top of screen    |
| `M`     | Middle of screen |
| `L`     | Bottom of screen |

### File Navigation

| Command  | Description       |
| -------- | ----------------- |
| `gg`     | Go to top         |
| `G`      | Go to bottom      |
| `:N`     | Go to line number |
| `Ctrl+f` | Page down         |
| `Ctrl+b` | Page up           |
| `Ctrl+d` | Half page down    |
| `Ctrl+u` | Half page up      |

### Jump Navigation

| Command  | Description     |
| -------- | --------------- |
| `Ctrl+o` | Jump back       |
| `Ctrl+i` | Jump forward    |
| `g;`     | Previous change |
| `g,`     | Next change     |

### Character Motions

| Command   | Description              |
| --------- | ------------------------ |
| `f{char}` | Find character forward   |
| `F{char}` | Find character backward  |
| `t{char}` | To character forward     |
| `T{char}` | To character backward    |
| `;`       | Repeat character motion  |
| `,`       | Reverse character motion |

## Editing

### Delete & Change

| Command | Description               |
| ------- | ------------------------- |
| `x`     | Delete character          |
| `X`     | Delete char before cursor |
| `dd`    | Delete line               |
| `dw`    | Delete word               |
| `d$`    | Delete to end of line     |
| `d0`    | Delete to start of line   |
| `D`     | Delete to end of line     |
| `cw`    | Change word               |
| `cc`    | Change line               |
| `r`     | Replace character         |

### Copy & Paste

| Command | Description           |
| ------- | --------------------- |
| `yy`    | Copy line             |
| `yw`    | Copy word             |
| `y$`    | Copy to end of line   |
| `y0`    | Copy to start of line |
| `p`     | Paste after           |
| `P`     | Paste before          |

### Undo & Redo

| Command  | Description       |
| -------- | ----------------- |
| `u`      | Undo              |
| `Ctrl+r` | Redo              |
| `U`      | Undo line changes |

## Text Objects

### Word & Paragraph

| Command | Description         |
| ------- | ------------------- |
| `iw`    | Inner word          |
| `aw`    | A word (with space) |
| `is`    | Inner sentence      |
| `as`    | A sentence          |
| `ip`    | Inner paragraph     |
| `ap`    | A paragraph         |

### Brackets & Quotes

| Command | Description   |
| ------- | ------------- |
| `i(`    | Inner block   |
| `a(`    | A block       |
| `ib`    | Inner block   |
| `ab`    | A block       |
| `i"`    | Inside quotes |
| `a"`    | Around quotes |

### Useful Combinations

| Command | Description          |
| ------- | -------------------- |
| `ciw`   | Change inner word    |
| `di"`   | Delete inside quotes |
| `ya(`   | Yank around block    |
| `>ip`   | Indent paragraph     |
| `=G`    | Auto-indent to end   |

## Registers

### Named Registers

| Command | Description           |
| ------- | --------------------- |
| `"ay`   | Yank to register a    |
| `"ap`   | Paste from register a |
| `"Ay`   | Append to register a  |

### Special Registers

| Command | Description         |
| ------- | ------------------- |
| `"+`    | System clipboard    |
| `"*`    | Selection clipboard |
| `"0`    | Last yank           |
| `"1`    | Last delete         |
| `"_`    | Black hole register |
| `:reg`  | Show all registers  |

## Search & Replace

### Searching

| Command    | Description                     |
| ---------- | ------------------------------- |
| `/pattern` | Search forward                  |
| `?pattern` | Search backward                 |
| `n`        | Next match                      |
| `N`        | Previous match                  |
| `*`        | Search word under cursor        |
| `#`        | Search word under cursor (back) |

### Replacing

| Command          | Description              |
| ---------------- | ------------------------ |
| `:s/old/new/`    | Replace first on line    |
| `:s/old/new/g`   | Replace all on line      |
| `:%s/old/new/g`  | Replace all in file      |
| `:%s/old/new/gc` | Replace all with confirm |

## Global Commands

### Pattern Matching

| Command          | Description                   |
| ---------------- | ----------------------------- |
| `:g/pattern/cmd` | Execute on matching lines     |
| `:v/pattern/cmd` | Execute on non-matching lines |

### Common Examples

| Command         | Description                     |
| --------------- | ------------------------------- |
| `:g/pattern/d`  | Delete lines containing pattern |
| `:g/^$/d`       | Delete empty lines              |
| `:g/pattern/t$` | Copy matching lines to end      |
| `:g/pattern/m$` | Move matching lines to end      |
| `:g/pattern/p`  | Print matching lines            |
| `:g/pattern/#`  | Print with line numbers         |

## File Operations

| Command         | Description           |
| --------------- | --------------------- |
| `:w`            | Save file             |
| `:w filename`   | Save as               |
| `:q`            | Quit                  |
| `:q!`           | Force quit            |
| `:wq`           | Save and quit         |
| `:x`            | Save and quit         |
| `:e filename`   | Open file             |
| `:r filename`   | Insert file contents  |
| `:sp filename`  | Horizontal split open |
| `:vsp filename` | Vertical split open   |

## Shell Commands

### Execute Commands

| Command      | Description            |
| ------------ | ---------------------- |
| `:!command`  | Run shell command      |
| `:r!command` | Insert command output  |
| `:%!command` | Filter through command |
| `:shell`     | Open shell             |

### Common Examples

| Command   | Description |
| --------- | ----------- |
| `:r!date` | Insert date |
| `:%!sort` | Sort lines  |
| `:%!jq .` | Format JSON |
| `:!wc %`  | Word count  |

## Visual Mode

### Visual Selection

| Command  | Description              |
| -------- | ------------------------ |
| `v`      | Character-wise selection |
| `V`      | Line-wise selection      |
| `Ctrl+v` | Block-wise selection     |
| `o`      | Go to other end          |
| `gv`     | Reselect last selection  |

### Operations on Selection

| Command | Description      |
| ------- | ---------------- |
| `d`     | Delete selection |
| `y`     | Copy selection   |
| `c`     | Change selection |
| `U`     | Uppercase        |
| `u`     | Lowercase        |
| `>`     | Indent right     |
| `<`     | Indent left      |
| `=`     | Auto-indent      |

## Folding

### Create & Toggle

| Command | Description |
| ------- | ----------- |
| `zf`    | Create fold |
| `za`    | Toggle fold |
| `zo`    | Open fold   |
| `zc`    | Close fold  |
| `zd`    | Delete fold |

### Fold Levels

| Command           | Description     |
| ----------------- | --------------- |
| `zR`              | Open all folds  |
| `zM`              | Close all folds |
| `zr`              | Open one level  |
| `zm`              | Close one level |
| `:set fdm=indent` | Fold on indent  |

## Buffers

| Command | Description      |
| ------- | ---------------- |
| `:ls`   | List buffers     |
| `:b N`  | Switch to buffer |
| `:bn`   | Next buffer      |
| `:bp`   | Previous buffer  |
| `:bd`   | Delete buffer    |

## Windows

### Window Splits

| Command    | Description      |
| ---------- | ---------------- |
| `:split`   | Split horizontal |
| `:vsplit`  | Split vertical   |
| `Ctrl+w s` | Split horizontal |
| `Ctrl+w v` | Split vertical   |

### Window Navigation

| Command    | Description             |
| ---------- | ----------------------- |
| `Ctrl+w w` | Switch windows          |
| `Ctrl+w h` | Move to left window     |
| `Ctrl+w j` | Move to bottom window   |
| `Ctrl+w k` | Move to top window      |
| `Ctrl+w l` | Move to right window    |
| `Ctrl+w c` | Close window            |
| `Ctrl+w o` | Close all other windows |
| `Ctrl+w =` | Equalize window sizes   |

### Window Resizing

| Command    | Description     |
| ---------- | --------------- |
| `Ctrl+w +` | Increase height |
| `Ctrl+w -` | Decrease height |
| `Ctrl+w >` | Increase width  |
| `Ctrl+w <` | Decrease width  |

## Advanced

### Marks

| Command       | Description             |
| ------------- | ----------------------- |
| `m[a-z]`      | Set local mark          |
| `m[A-Z]`      | Set global mark         |
| `'[mark]`     | Go to line of mark      |
| `` `[mark] `` | Go to exact position    |
| `''`          | Go to previous position |
| `'.`          | Go to last edit         |

### Macros

| Command  | Description       |
| -------- | ----------------- |
| `q[a-z]` | Record macro      |
| `q`      | Stop recording    |
| `@[a-z]` | Execute macro     |
| `@@`     | Repeat last macro |

### Repeat & Help

| Command       | Description         |
| ------------- | ------------------- |
| `.`           | Repeat last command |
| `:set nu`     | Show line numbers   |
| `:help [cmd]` | Get help            |

## Emergency

| Command  | Description           |
| -------- | --------------------- |
| `Esc`    | Return to normal mode |
| `Ctrl+c` | Return to normal mode |
| `:q!`    | Quit without saving   |
| `u`      | Undo mistake          |
| `:help`  | Get help              |

---

_Created by [youtube.com/@marco_peluso](https://youtube.com/@marco_peluso) • [marcopeluso.com](https://marcopeluso.com)_
