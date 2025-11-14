-- enable line number and relative line number
vim.opt.number = true

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin-mocha")


-- width of a tab
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true

vim.opt.hidden = true

vim.opt.wildmenu = true           -- Enhanced command line completion.
vim.opt.wildmode = 'list:longest' -- Complete files like a shell.

vim.opt.ignorecase = true         -- Case-insensitive searching.
vim.opt.smartcase = true          -- But case-sensitive if expression contains a capital letter.

vim.opt.autoindent = true         -- Always set autoindenting on
-- vim.opt.copyindent = true  -- Copy the previous indentation on autoindenting (commented out)

vim.opt.number = true     -- Show line numbers.

vim.opt.ruler = true      -- Show the ruler.
vim.opt.cursorline = true -- Highlight the current line.

-- 📌 This sets:
-- A white cursor in normal mode
-- A yellow cursor in insert mode
vim.opt.termguicolors = true
vim.cmd([[highlight Cursor guifg=black guibg=white]])
vim.cmd([[highlight iCursor guifg=black guibg=yellow]])
vim.cmd([[set guicursor+=i:ver25-iCursor]])

-- Hide the cursor while typing
vim.opt.mousehide = true

vim.opt.incsearch = true  -- Incremental search, highlight matches as you type.
vim.opt.hlsearch = true   -- Highlight matches.

vim.opt.scrolloff = 10    -- Show X lines of context around the cursor.

vim.opt.title = true      -- Set the terminal's title.

vim.opt.visualbell = true -- No beeping.

-- Set the number of commands and searches to remember
vim.opt.history = 1000

-- Set the number of undo levels
vim.opt.undolevels = 1000

-- Ignore these patterns when completing file names
vim.opt.wildignore = '*.swp,*.bak,*.pyc,*.class,target,node_modules'

-- Set the number of spaces a tab counts for
vim.opt.tabstop = 2

-- Set the number of spaces to use for autoindent
vim.opt.shiftwidth = 2

-- Set the number of spaces to use for soft tab stops
vim.opt.softtabstop = 2

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Always show the status line
vim.opt.laststatus = 2

-- Set the format of the status line
vim.opt.statusline =
'[%n] %<%.99f %h%w%m%r%y %{exists(\'*CapsLockStatusline\')?CapsLockStatusline():\'\'}%=%-16( %l,%c-%v %)%P'

-- Do not wrap lines
vim.opt.wrap = false

-- Set linebreaks: break lines at word (requires nowrap)
vim.opt.linebreak = true

-- Folding settings based on indent levels
vim.opt.foldmethod = 'indent' -- Fold based on indent
vim.opt.foldnestmax = 10      -- Deepest fold is 10 levels
vim.opt.foldenable = false    -- Don't fold by default
vim.opt.foldlevel = 1         -- This sets the initial fold level

vim.diagnostic.setqflist()
vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
