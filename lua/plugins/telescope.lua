-- telescope plugin : for fuzzy finding.
return {
  'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- configuring telescope with key mapping
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
  end
}
