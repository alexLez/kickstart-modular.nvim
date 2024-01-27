-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Reselect text after indentation
vim.keymap.set('v', '>', ">gv")
vim.keymap.set('v', '<', "<gv")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et

-- My maps

vim.keymap.set('i', 'jk', "<Esc>")
vim.keymap.set('i', 'kj', "<Esc>")

vim.keymap.set('n', '0', "^")
vim.keymap.set('n', '^', "0")

vim.keymap.set('n', '<leader>w', ":w<CR>")
vim.keymap.set('n', '<leader>q', ":qa!<CR>")
vim.keymap.set('n', '<leader>s', ":wq<CR>")

vim.keymap.set('n', '<C-h>', "<C-w>h")
vim.keymap.set('n', '<C-j>', "<C-w>j")
vim.keymap.set('n', '<C-k>', "<C-w>k")
vim.keymap.set('n', '<C-l>', "<C-w>l")

vim.keymap.set('n', '<leader>vs', ":vs<CR>", {desc = 'Open vertial split'})
vim.keymap.set('n', '<leader>sp', ":sp<CR>", {desc = 'Open horizontal split'})

vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
