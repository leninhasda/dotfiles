local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
  
return require('packer').startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")
  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim") 

  -- themes 
  -- use({
  --   "bluz71/vim-nightfly-guicolors",
  --   config = function()
  --     vim.cmd([[colorscheme nightfly]])
  --   end,
  -- }) 
  use({
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.o.background = 'dark'
      vim.cmd([[colorscheme gruvbox]])
    end,
  })

  -- use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  --use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  --use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  --use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- file explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    },
  })

  -- statusline
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine_nightfly = require("lualine.themes.nightfly")
      local new_colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        black = "#000000",
      }
      -- change nightlfy theme colors
      lualine_nightfly.normal.a.bg = new_colors.blue
      lualine_nightfly.insert.a.bg = new_colors.green
      lualine_nightfly.visual.a.bg = new_colors.violet
      lualine_nightfly.command = {
        a = {
          gui = "bold",
          bg = new_colors.yellow,
          fg = new_colors.black, -- black
        },
      }
      require("lualine").setup({
        options = {
          theme = lualine_nightfly
        }
      })
    end,
  })

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  
  -- autoclose parens, brackets, quotes, etc...
  --use({
   -- "windwp/nvim-autopairs", 
   -- config = function()
    --  require("nvim-autopairs").setup({
     --   check_ts = true, -- enable treesitter
      --  ts_config = {
       --   lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        --  javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        --  java = false, -- don't check treesitter on java
        --},
      --})

      --local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      --local cmp = require('cmp')
      --cmp.event:on(
      --  'confirm_done',
      --  cmp_autopairs.on_confirm_done()
      --)
   -- end,
  --}) 

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use({
    "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
    config = function()
      require("gitsigns").setup()
    end,
  }) 

  if packer_bootstrap then
    require("packer").sync()
  end
end)
