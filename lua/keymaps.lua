--Upcoming changes: [[ Basic Keymaps ]]

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

-- vim.keymap.set('n', '0', "^")
-- vim.keymap.set('n', '^', "0")

vim.keymap.set('n', '<leader>w', ":w<CR>")
-- vim.keymap.set('n', '<leader>q', ":qa!<CR>")

vim.keymap.set('n', '<C-h>', "<C-w>h")
vim.keymap.set('n', '<C-j>', "<C-w>j")
vim.keymap.set('n', '<C-k>', "<C-w>k")
vim.keymap.set('n', '<C-l>', "<C-w>l")

vim.keymap.set('n', '<leader>vs', ":vs<CR>", { desc = 'Open vertial split' })
vim.keymap.set('n', '<leader>sp', ":sp<CR>", { desc = 'Open horizontal split' })

vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>r', function()
--   builtin.live_grep({
--     additional_args = function()
--       return { "--glob", ".gitlab/**" }
--     end
--   })
-- end, {})

-- Only copy non empty stuff
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')

vim.keymap.set("n", "dd", function()
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

vim.keymap.set("v", "<leader>p", "\"_dP")

vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<leader>db', ":%bd|e#<CR>")

vim.keymap.set('n', '<leader>yf', function()
  local curpos = vim.fn.getpos(".") -- save current cursor position
  vim.cmd('normal! ggVGy')          -- yank entire file
  vim.fn.setpos('.', curpos)        -- restore cursor position
end, { desc = 'Yank entire file without moving cursor' })
