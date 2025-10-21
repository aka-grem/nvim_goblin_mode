-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Clear highlights on search when pressing <Esc> in normal mode
--
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Neotree
vim.keymap.set('n', '<F2>', ':Neotree float<CR>', { desc = 'Open Neotree as a floating window' })

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Comment keymaps
vim.keymap.set('n', '<leader>c', '', { desc = '[C]omment' })

vim.keymap.set('n', '<leader>ct', '', { desc = '[C]omment [T]odo' })
vim.keymap.set('n', '<leader>cte', 'STODO: <Esc>:exe "normal" "gc0" <CR>A', { desc = '[C]omment [T]odo [E]mpty' })
vim.keymap.set('n', '<leader>cti', 'STODO: implement<Esc>:exe "normal" "gc0" <CR>', { desc = '[C]omment [T]odo [I]mplement' })
vim.keymap.set('n', '<leader>ctr', 'STODO: remove<Esc>:exe "normal" "gc0" <CR>', { desc = '[C]omment [T]odo [R]emove' })

vim.keymap.set('n', '<leader>cn', 'SNOTE: <Esc>:exe "normal" "gc0" <CR>A', { desc = '[C]omment [N]ote' })

vim.keymap.set('n', '<leader>cf', 'SFIX: <Esc>:exe "normal" "gc0" <CR>A', { desc = '[C]omment [F]ix' })

vim.keymap.set('n', '<leader>cw', 'SWARNING: <Esc>:exe "normal" "gc0" <CR>A', { desc = '[C]omment [W]arning' })

vim.keymap.set('n', '<leader>ch', 'SHACK: <Esc>:exe "normal" "gc0" <CR>A', { desc = '[C]omment [H]ack' })

vim.keymap.set('n', '<leader>ce', 'STEST: <Esc>:exe "normal" "gc0" <CR>A', { desc = '[C]omment [E]xperiment (Test)' })

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Godot keymaps
vim.keymap.set('n', '<leader>g', '', { desc = '[G]odot' })

-- NOTE: This requires the Godot editor's DOTNET settings to have 'External Editor' set to 'Custom', 'Custom Exec Path' set to 'nvim', and 'Custom Exec Path Args' set to '--server ./godothost --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"'.
-- It also requires the TEXT EDITOR settings to have 'Use External Editor' checked, 'Exec Path' set to 'nvim', and 'Exec Flags' set to '--server ./godothost --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"'
local function start_godot_host()
  vim.fn.serverstart './godothost'
end
local function stop_godot_host()
  vim.fn.serverstop './godothost'
end

vim.keymap.set('n', '<leader>gh', '', { desc = './godothost' })
vim.keymap.set('n', '<leader>ghs', start_godot_host, { desc = '[G]odot [H]ost [S]tart server. Nvim instance starts acting as the external editor for Godot.' })
vim.keymap.set('n', '<leader>ghe', stop_godot_host, { desc = '[G]odot [H]ost [E]nd server. Nvim instance stops acting as the external editor for Godot.' })

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- NOTE: Useful pasting shortcuts
local function insert_after_cursor(text)
  vim.api.nvim_paste(text, false, -1)
end

vim.keymap.set('n', '<leader>p', '', { desc = '[P]aste' })
vim.keymap.set('n', '<leader>pc', '', { desc = '[P]aste [C]urrent' })

vim.keymap.set('n', '<leader>pcf', '', { desc = '[P]aste [C]urrent [F]ile' })
vim.keymap.set('n', '<leader>pcfn', function()
  insert_after_cursor(vim.fn.expand '%:t')
end, { desc = '[P]aste [C]urrent [F]ile [N]ame' })
vim.keymap.set('n', '<leader>pcfp', function()
  insert_after_cursor(vim.fn.expand '%')
end, { desc = '[P]aste [C]urrent [F]ile [P]ath' })

vim.keymap.set('n', '<leader>pcfd', '', { desc = '[P]aste [C]urrent [F]ile [D]irectory' })

vim.keymap.set('n', '<leader>pcfdf', function()
  insert_after_cursor(vim.fn.fnamemodify(vim.fn.expand '%:p:h', ':p'))
end, { desc = '[P]aste [C]urrent [F]ile [D]irectory [F]ull' })
vim.keymap.set('n', '<leader>pcfdr', function()
  insert_after_cursor(vim.fn.expand '%:h')
end, { desc = '[P]aste [C]urrent [F]ile [D]irectory [R]elative' })
vim.keymap.set('n', '<leader>pcfdi', function()
  insert_after_cursor(vim.fn.fnamemodify(vim.fn.expand '%:h', ':t'))
end, { desc = '[P]aste [C]urrent [F]ile [D]irectory [I]mmediate' })

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- vim: ts=2 sts=2 sw=2 et
