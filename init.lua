--[[
================================================================
===============================|================================
                               |
                           8 8 | 8 8
                          / / _|_ \ \
                          \_\(^_^)/_/
                           8_// \\_8
                              \ /
                               8
================================================================
================================================================


Some useful resources:
  - https://learnxinyminutes.com/docs/lua/ 
  - Use `:help lua-guide` as a reference for how Neovim integrates Lua.
    - (HTML version): https://neovim.io/doc/user/lua-guide.html 
  - Use ':Tutor' to access the tutor.
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Modules ]]
require 'modules.options'
require 'modules.keymaps'
require 'modules.basic-autocommands'
require 'modules.lazy-bootstrap'
require 'modules.lazy-plugins'
require 'modules.godot'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
