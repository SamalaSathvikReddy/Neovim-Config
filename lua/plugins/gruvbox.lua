
-- theme
return { 
    "ellisonleao/gruvbox.nvim", 
    priority = 1000 , 
    config = function()
      vim.o.background = "light"
      vim.cmd([[colorscheme gruvbox]])
    
    -- Disable italics for comments & strings in Gruvbox
      local groups = { "Comment", "String", "Keyword", "Function", "Type" }
      for _, group in ipairs(groups) do
        local current = vim.api.nvim_get_hl(0, { name = group })
        current.italic = false
        vim.api.nvim_set_hl(0, group, current)
      end 
  
    end , 
    opts = ...
}

