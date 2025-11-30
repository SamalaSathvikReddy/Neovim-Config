vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
  
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup("plugins")

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "c", "cpp", "python", "go", "javascript"},
  highlight = { enable = true },
  indent = { enable = true}
})

-- Disable italics for comments & strings in Gruvbox
local function remove_italics()
  local groups = { "Comment", "String", "Keyword", "Function", "Type" }

  for _, group in ipairs(groups) do
    local current = vim.api.nvim_get_hl(0, { name = group })
    current.italic = false
    vim.api.nvim_set_hl(0, group, current)
  end
end

remove_italics()

