-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }), -- always add autocmds to groups. they prevent duplicate listeners
  callback = function()
    vim.hl.on_yank()
  end,
})

-- NOTE: auto_mkview
-- FIX: adjust so that it doesn't interact with the neotree system
local auto_mkview = vim.api.nvim_create_augroup('auto_mkview', { clear = true })
vim.api.nvim_create_autocmd('BufWinLeave', {
  desc = 'Automatically save folds (and all the other stuff described in the help entry for :mkview) for a buffer when exiting or removing it from a window.',
  group = auto_mkview,
  pattern = { '?*' }, -- NOTE: this enforces a non-empty filename, avoiding the problem with empty buffers and pseudo windows (e.g., telescope).
  command = 'mkview',
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Automatically load saved folds (and all the other stuff described in the help entry for :mkview) for the buffer that is entered.',
  group = auto_mkview,
  pattern = { '?*' }, -- NOTE: this enforces a non-empty filename, avoiding the problem with empty buffers and pseudo windows (e.g., telescope).
  command = 'silent! loadview',
})

-- WARNING: renaming a file won't transfer the views (they will still be stored in the viewdir directory). Therefore, I need to clean the viewdir directory every so often.
-- FIX: this won't work unless i open it on the first of every month. fix it.
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Automatically clear the viewdir directory at regular intervals.',
  group = auto_mkview,
  callback = function()
    local currentDayOfTheMonth = os.date '%d'
    local cleaningRequired = currentDayOfTheMonth == '01' -- clean at the start of every month.
    if cleaningRequired then
      os.execute('rm -f ' .. vim.o.viewdir .. '/*')
    end
  end,
})

-- TODO: use autocommands to create C# specific keybinds (e.g., namespace stuff).
--          see :help lua-guide-autcommands for more info/examples.

-- vim: ts=2 sts=2 sw=2 et
