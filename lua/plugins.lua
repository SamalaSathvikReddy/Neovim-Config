return {
  
  { 
    "ellisonleao/gruvbox.nvim", 
    priority = 1000 , 
    config = function()
      vim.o.background = "light"
      vim.cmd([[colorscheme gruvbox]])
    end , 
    opts = ...
  },

  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
  },

  {
    
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", 
    },
    lazy = false, 
  }

}
