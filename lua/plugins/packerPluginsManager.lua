
local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = 1
  print "Installing packer close and reopen Neovim..."
  --vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
            open_cmd = "65vnew \\[packer\\]", -- An optional command to open a window for packer's display
            working_sym = "  ", -- '⟳', -- The symbol for a plugin being installed/updated
            error_sym = "  ", -- '✗', -- The symbol for a plugin with an error in installation/updating
            done_sym = "  ", -- '✓', -- The symbol for a plugin which has completed installation/updating
            removed_sym = "-", -- The symbol for an unused plugin which was removed
            moved_sym = "→", -- The symbol for a plugin which was moved (e.g. from opt to start)
            header_sym = "━", -- The symbol for the header line in packer's display
            show_all_info = true, -- Should packer show all update details automatically?
            prompt_border = "double", -- Border style of prompt popups.
            keybindings = { -- Keybindings for the display window
                quit = "q",
                toggle_info = "<CR>",
                diff = "d",
                prompt_revert = "r"
            }


  },
  profile = {
    enable = true,
    threshold = 1 -- the amount in ms that a plugin's load time must be over for it to be included in the profile
  }
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use ({"wbthomason/packer.nvim",
      config = function()
        require("core.lazy_load").packer_lazy_load()
      end

    }) -- Have packer manage itself
  -- ==========================================================================
  -- 	                      Utilities for NVIM IDE Env
  -- ===========================================================================
  use({"lewis6991/impatient.nvim",
  	config = function()
		require("plugins.configs.myImpatient").setup()
	end
	})
  use ("nvim-lua/popup.nvim")                        -- An implementation of the Popup API from vim in Neovim
  use ({"nvim-lua/plenary.nvim", module = "plenary" })
  use ({'navarasu/onedark.nvim',
  	config = function()
		-- Lua
		require("plugins.configs.onedark_config").setup()
		end
	})


  -- ==========================================================================
  -- 	                    Aesthetic and UI Design
  -- ==========================================================================
    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      event = "VimEnter",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

  -- ==========================================================================
  -- 	                     Navigation and Explorer
  -- ==========================================================================

  use ({"nvim-telescope/telescope.nvim",tag = '0.1.0',
  	keys = "<leader>f",
	cmd = "Telescope",
	package = "telescope",
	requires = {
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make", opt = true },
                { 'nvim-telescope/telescope-symbols.nvim', opt = true },
                { "nvim-telescope/telescope-project.nvim", opt = true }
	},
	config = function()
		require "plugins.configs.myTelescope".config()
	end,
	})
  use ({"nvim-telescope/telescope-ui-select.nvim",
  	opt = true,
	setup = function()
		vim.ui.select = function(items, opts, on_choice)
			vim.cmd([[
			PackerLoad telescope.nvim
			PackerLoad telescope-ui-select.nvim
			]])
			require("telescope").load_extension("ui-select")
			vim.ui.select(items, opts, on_choice)
		end
	end,
	})

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      opt = true,
      wants = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeToggle","NvimTreeClose" },
      -- module = { "nvim-tree", "nvim-tree.actions.root.change-dir" },
      config = function() require("plugins.configs.myNvimTree") end

    }
    -- undotree
    use { "mbbill/undotree",
    config = function()
      require("plugins.configs.myUndoTreeConfig")
    end,
    	cmd = { "UndotreeToggle", "UndotreeHide" },
     }

    -- FZF Lua
    use {
      "ibhagwan/fzf-lua",
      opt = true,
      wants = "nvim-web-devicons",
      --event = "BufEnter",
      event = "VimEnter",
      config = function() require("plugins.configs.myFzf") end,
      --cmd = {"lua require('fzf-lua').files()"},
      --cmd = {"FzfLua files"},
    }
      -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufReadPre",
      run = ":TSUpdate",
      config = function()
        require("plugins.configs.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
        { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
        { "p00f/nvim-ts-rainbow", event = "BufReadPre" },
        { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
        { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre", disable = true },
      },
    }
    -- Status line
    use {
      "nvim-lualine/lualine.nvim",
      after = "nvim-treesitter",
       setup = function()
         require("core.lazy_load").on_file_open "nvim-treesitter"
       end,
      cmd = require("core.lazy_load").treesitter_cmds,
      config = function()
        require("plugins.configs.myLuaLine").setup()
      end,
      wants = "nvim-web-devicons",
    }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

