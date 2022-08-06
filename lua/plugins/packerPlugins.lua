-----------------------------------------------------------------------------------------------------------------------
--
--                    ██████╗░░█████╗░░█████╗░██╗░░██╗███████╗██████╗░
--                    ██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔════╝██╔══██╗
--                    ██████╔╝███████║██║░░╚═╝█████═╝░█████╗░░██████╔╝
--                    ██╔═══╝░██╔══██║██║░░██╗██╔═██╗░██╔══╝░░██╔══██╗
--                    ██║░░░░░██║░░██║╚█████╔╝██║░╚██╗███████╗██║░░██║
--                    ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝
--
--            ██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██░░░░░███████╗██████╗░
--            ██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░██╔════╝██╔══██╗
--            ██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░█████╗░░██████╔╝
--            ██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░██╔══╝░░██╔══██╗
--            ██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗███████╗██║░░██║
--            ╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝╗
--
-----------------------------------------------------------------------------------------------------------------------
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    local packer_bootstrap = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
end

-- Autocommand that reloads neovim whenever you save the packerPlugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost packerPlugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

local use = require("packer").use

require("packer").startup({
    function()
        -- Packer can manage itself
        use({"wbthomason/packer.nvim"})
        use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
        use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
        -- add other use .. for other packages
        -- Theme of Gruvbox.nvim
        -- use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
        -- use 'eddyekofo94/gruvbox-flat.nvim'
        -- use 'gruvbox-community/gruvbox'
        --
        use({"sainnhe/gruvbox-material"})

        -- ==========================================================================
        -- 	                      Utilities for NVIM IDE Env
        -- ===========================================================================
        use({
            "lewis6991/impatient.nvim",
            -- rocks = 'mpack',
            config = function()
                require("plugins.configs.myImpatient")
            end
        })

        -- ==========================================================================
        -- 	                      Programming Language Servers
        -- ===========================================================================
        -- Treesitter
        -- use('nvim-treesitter/nvim-treesitter')

        use({
            "nvim-treesitter/nvim-treesitter"
            -- config = function()
            -- 	require("plugins.configs.treesitter")
            -- end,
        })
        ---------------------------------------------------------------------------------------------------------------
        -- LSP neovim (integrate with native language server)
        -- A collection of common configurations for Neovim's built-in language server client.
        use({
            "neovim/nvim-lspconfig",
            config = function() require("plugins.configs.lspconfig") end
        })
        -- LSP language server Manager
        use("williamboman/nvim-lsp-installer")
        -- lspsaga.nvim
        -- A light-weight lsp plugin based on neovim built-in lsp highly a performant UI.
        --  Old version not compatable with nvim 0.6 yet
        -- use ('glepnir/lspsaga.nvim')
        -- a fork of lspsaga which is compatable with nvim6.0
        -----------------------use('tami5/lspsaga.nvim')
        -- or
        -- use ({ 'tami5/lspsaga.nvim', branch = 'nvim6.0'})

        -- Adding lsp signature for nvim
        use({
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function() require("lsp_signature").setup() end
        })

        use({
            "andymass/vim-matchup",
            setup = function()
                require("core.utils").packer_lazy_load("vim-matchup")
            end
        })
        use({"onsails/lspkind-nvim"})
        -- load luasnips + cmp related in insert mode only
        -- snippets
        use({"rafamadriz/friendly-snippets"}) -- a bunch of snippets to use

        use({
            "L3MON4D3/LuaSnip",
            -- snippet engine
            -- wants = "friendly-snippets",
            config = function()
                require("plugins.configs.others").luasnip()
            end
        })
        use({"SirVer/ultisnips"})

        use({
            "hrsh7th/nvim-cmp",
            config = function() require("plugins.configs.cmp") end
        })
        -- The completion plugin

        use({"saadparwaiz1/cmp_luasnip", after = "LuaSnip"})

        use({"hrsh7th/cmp-nvim-lua", after = "cmp_luasnip"})

        use({"hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua"})

        use({"hrsh7th/cmp-buffer", after = "cmp-nvim-lsp"})

        -- use({
        --     "rafamadriz/friendly-snippets",
        --     after = "cmp-buffer"
        -- })
        use({"hrsh7th/cmp-calc", after = "cmp-buffer"})

        use({"f3fora/cmp-spell", after = "cmp-buffer"})
        use({"hrsh7th/cmp-path", after = "cmp-buffer"})
        use({"hrsh7th/cmp-emoji", after = "cmp-buffer"})
        use({"ray-x/cmp-treesitter", after = "cmp-buffer"})
        use({"hrsh7th/cmp-cmdline", after = "cmp-buffer"})

        -- tags with vista (compatible with clap)
        -- Showing all funtions and parameters in the buffer, see also <ctags>
        use({"liuchengxu/vista.vim"})

        -- Adding symbols outline (similar to vista)
        use({
            "simrat39/symbols-outline.nvim",
            config = function()
                require("plugins.configs.mySymbolsOutline").init()
            end
        })

        -- sidebar.nvim
        -- use({
        --     "sidebar-nvim/sidebar.nvim",
        --     config = function()
        --         require("sidebar-nvim").setup({
        --             disable_default_keybindings = 0,
        --             bindings = nil,
        --             open = false,
        --             side = "right",
        --             initial_width = 35,
        --             update_interval = 1000,
        --             sections = {"datetime", "git", "diagnostics"},
        --             section_separator = "-----"
        --         })
        --     end
        -- })

        -- Code running
        -- use({
        --     "michaelb/sniprun",
        --     run = "bash install.sh",
        --     config = function()
        --         require("plugins.configs.mySniprun").setup()
        --     end
        -- })
        -- Code formatting
        -- Null-ls.nvim allow to inject LSP diagnostics, code actions and more via lua.
        use({"jose-elias-alvarez/null-ls.nvim"})
        use({"sbdchd/neoformat"})

        -- Sending code to jupyternotebook
        -- Source: https://github.com/untitled-ai/jupyter_ascending.vim
        use({"untitled-ai/jupyter_ascending.vim"})

        -- TabNine auto-compleletions
        use({
            "tzachar/cmp-tabnine",
            run = "./install.sh",
            requires = "hrsh7th/nvim-cmp",
            after = "cmp-buffer"
        })

        -- lsp_signature.nvim
        use({
            "tami5/lspsaga.nvim",
            ---"glepnir/lspsaga.nvim",
            opt = true,
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.mySaga").conf()
            end
        })

        -- Navigation for all the coding problems
        use({
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end
        })

        -- Debugging
        use({"puremourning/vimspector", event = "BufWinEnter"})

        -- DAP
        use({"mfussenegger/nvim-dap"})
        use({"mfussenegger/nvim-dap-python"})
        use({"theHamsta/nvim-dap-virtual-text"})
        use({"rcarriga/nvim-dap-ui"})
        use({"Pocco81/DAPInstall.nvim"})
        use({"jbyuki/one-small-step-for-vimkind"})
        use({"nvim-telescope/telescope-dap.nvim"})

        -- Copilot AI
        -- Technical review of copilot, an AI solution built on top of openAI
        -- Davincie.
        use({"github/copilot.vim"})

        -- ===========================================================================
        -- 	                       Aesthetics Plugins
        -- ===========================================================================
        -- Using onedark theme
        use({"navarasu/onedark.nvim"})
        -- Using gruvbox theme
        use("morhetz/gruvbox")
        -- Using Github wiht configurations
        -- use({
        --   'projekt0n/github-nvim-theme',
        --   config = function()
        --     require("github-theme").setup({
        --         require('../colors/themes/myGitHubTheme')
        --         })
        --   end
        -- })

        use({"tpope/vim-fugitive"})
        -- use({ "vim-airline/vim-airline" })
        -- --status line built with lua
        --		use({
        --			"shadmansaleh/lualine.nvim",
        --			requires = { "kyazdani42/nvim-web-devicons", opt = true },
        --		})
        use("vim-airline/vim-airline-themes")

        use({
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        })

        -- To show the diff of file
        -- use({"airblade/vim-gitgutter"})       -- Not compatable with the nvim-diagnostics  in nvim 0.6
        use({"ryanoasis/vim-devicons"})

        -- New collections of themes
        use({"NLKNguyen/papercolor-theme"})
        use({"folke/tokyonight.nvim"})
        use({"sainnhe/everforest"})
        use({"folke/lsp-colors.nvim"})
        -- Using BufferLine to give a nice tab shape with icons and other config
        -- Source: https://github.com/akinsho/bufferline.nvim
        use({
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugins.configs.myBufferConfig").setup()
            end
        })
        -- Using Indent blankline, specially useful for python
        -- Source:
        use({
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = function()
                require("plugins.configs.myIndentBlankLine").init()
            end
        })

        -- smooth scroll
        use({
            "karb94/neoscroll.nvim",
            config = function()
                require("plugins.configs.others").neoscroll()
            end
        })
        -- This will  highlight the colors as #558817
        use({
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").colorizer()
            end
        })

        -- misc plugins
        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.configs.others").myAutopairs()
            end
        })

        -- Clear highlight when you search for a word automatically
        use({
            "romainl/vim-cool",
            config = function() vim.g.CoolTotalMatches = 1 end
        })

        -- Markdown, Markup-language better view (two plugins)
        use({
            "npxbr/glow.nvim",
            config = function() require("plugins.configs.myGlowMark") end
        })

        -- Using MarkdownPreview
        -- use({
        --     "iamcco/markdown-preview.nvim",
        --     run = "cd app && yarn install"
        -- })
        -- install without yarn or npm
        -- use({
        --     "iamcco/markdown-preview.nvim",
        --     run = function() vim.fn["mkdp#util#install"]() end
        -- })

        use({
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
            ft = {"markdown"}
        })

        -- Delete a buffer and keep your opened windows intact
        -- Bdelete == bd (buffer delete)
        use({"famiu/bufdelete.nvim"})

        -- Adding notification for nvim
        use({
            "rcarriga/nvim-notify",
            config = function() require("plugins.configs.myNotify") end
        })

        -- Context that shows the currently visible buffer contents.

        -- GPS
        use({"SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig",
            config = function() require("plugins.configs.myGPS") end
    })

        -- ===========================================================================
        --           Navigation and Searching
        -- ===========================================================================
        -- Using floating terminal
        use({"voldikss/vim-floaterm"})
        -- More flexible terminal with lua
        use({
            "akinsho/toggleterm.nvim",
            config = function()
                require("plugins.configs.myTerminal").setup()
            end
        })
        -- Using Rnvim  <Ranger>
        use({
            "kevinhwang91/rnvimr",
            config = function()
                require("plugins.configs.myRanger").Style()
            end
        })
        -- Telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/plenary.nvim"}},

            config = function()
                require("core.utils").packer_lazy_load("telescope.nvim")
                require("plugins.configs.myTelescope")
            end
        })
        -- Undo tree (for recover any mistake in the buffer)
        use({
            "mbbill/undotree"
            --    config = function ()
            --      require("plugins.configs.myUndoTreeConfig")
            --    end
        })
        -- Nvim-Tree for navigation
        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = function() require("plugins.configs.myNvimTree") end
        })

        --     use {"kyazdani42/nvim-tree.lua",
        --     config = function ()
        --       vim.g.nvim_tree_indent_markers = 1
        --       require("plugins.configs.myNvimTree")
        --     end
        --   }

        -- Ctrl + P searching
        use({
            "ctrlpvim/ctrlp.vim",
            config = function()
                local cmd = vim.cmd
                -- Allow the ctrlP to not search the .git repository.
                cmd([[
                  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
                  ]])
            end
        })
        -- Using sneak for faster jump inside the buffer
        use({
            "justinmk/vim-sneak",
            config = function()
                require("plugins.configs.sneak").sneakSetup()
            end
        })
        -- clap (offer directory autocomplete)
        use({"liuchengxu/vim-clap"})

        -- Better repeat (.) with nvim (from tpope)
        use({"tpope/vim-repeat"})

        -- Better surrounding
        use({"tpope/vim-surround"})

        -- Development
        use({"tpope/vim-dispatch"})
        use({"tpope/vim-commentary"})
        use({"tpope/vim-rhubarb", event = "VimEnter"})
        use({"tpope/vim-unimpaired"})
        use({"tpope/vim-vinegar"})
        use({"tpope/vim-sleuth"})

        -- fuzzy finder
        -- use {'vijaymarupudi/nvim-fzf'}
        use({"junegunn/fzf"})
        use({"junegunn/fzf.vim"})

        -- Dashboard
        -- use({
        --     "glepnir/dashboard-nvim",
        --     config = function()
        --         require("plugins.configs.dashboard").setup()
        --     end
        -- })

        -- alpha for welcome message of nvim
        use({
            "goolord/alpha-nvim",
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function()
                require("alpha").setup(require("alpha.themes.startify").opts)
            end
        })

        -- Startify
        use({"mhinz/vim-startify"})

        -- vim-eftt (highlight the f/t/F/T mappings)
        -- Source, https://github.com/hrsh7th/vim-eft
        use({
            "hrsh7th/vim-eft",
            config = function()
                require("plugins.configs.myVim_eft").setup()
            end
        })

        -- vim-visual-multi (multi-cursor similar to vscode)
        --         use({
        --             "mg979/vim-visual-multi",
        --             branch = "master"
        --         })
        use({"gennaro-tedesco/nvim-peekup"})
        -- ===========================================================================
        --                            Git and Diff
        -- ===========================================================================
        use({
            "APZelos/blamer.nvim",
            config = function()
                require("plugins.configs.myGitBlamer").BlamerSetting()
            end
        })
        -- adding (+/-) for diff, in the Gutter      -- Not compatable with the nvim-diagnostics  in nvim 0.6
        -- use({"mhinz/vim-signify"})

        -- Git
        use({
            "lewis6991/gitsigns.nvim",
            config = function() require("plugins.configs.myGit") end
        })

        -- Git Diff
        use({
            "sindrets/diffview.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function() require("plugins.configs.myGitDiff") end,
            cmd = {
                "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
                "DiffviewFocusFiles"
            }
        })

        -- ===========================================================================
        --                         For Editor
        -- ===========================================================================
        -- Allow making tables in Markup-language (*.md) files.
        use({"dhruvasagar/vim-table-mode"})
        -- For latex to preview lively the pdf while editing
        -- use("xuhdev/vim-latex-live-preview")
        use({
            "frabjous/knap",
            config = function() require("plugins.configs.myknap") end
        })

        -- ===========================================================================
        --                          Other Plugins
        -- ===========================================================================
        -- At the moment I am using spell checking from coc, only
        --  use {'neoclide/coc.nvim', branch = 'release',
        --  setup = function()
        --       require("core.utils").packer_lazy_load "vim-matchup"
        --    end,
        --  }

        --  -- Spell Checker
        -- Spell checking
        use({
            "kamykn/spelunker.vim",
            config = function()
                require("plugins.configs.spellChecking").setup()
            end
        })
        -- configure
        use({
            "lewis6991/spellsitter.nvim",
            config = function() require("spellsitter").setup() end
        })

        -- This is necessary to create popmenu to the spell checking
        use({"kamykn/popup-menu.nvim"})
        -- Using next word
        --  use{'prabirshrestha/asyncomplete.vim'}
        --  use{'prabirshrestha/async.vim'}
        --  use{'high-moctane/asyncomplete-nextword.vim'}
        -- Replace word with register
        use({"vim-scripts/ReplaceWithRegister"})
        -- use({ "inkarkat/vim-ReplaceWithRegister" })
        --  -- Copy and paste from clipboard into your nvim
        use({"christoomey/vim-system-copy"})
        -- Using accelerator for j and k
        -- Source: https://github.com/rhysd/accelerated-jk
        use({"rhysd/accelerated-jk"})
    end,

    -----------------------------------------------------------------------------------------------------------------------
    config = {

        ensure_dependencies = true, -- Should packer install plugin dependencies?
        package_root = require("packer.util").join_paths(vim.fn.stdpath("data"),
                                                         "site", "pack"),
        -- Old implementation without impatient plugins
        compile_path = require("packer.util").join_paths(vim.fn
                                                             .stdpath("config"),
                                                         "plugin",
                                                         "packer_compiled.lua"),
        -- Check impatient plugin for more details
        -- Move to lua dir so impatient.nvim can cache it
        -- compile_path = require("packer.util").join_paths(vim.fn.stdpath("config"),'/lua/packer_compiled.lua'),
        plugin_package = "packer", -- The default package for plugins
        max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
        auto_clean = true, -- During sync(), remove unused plugins
        compile_on_sync = true, -- During sync(), run packer.compile()
        disable_commands = false, -- Disable creating commands
        opt_default = false, -- Default to using opt (as opposed to start) plugins
        transitive_opt = true, -- Make dependencies of opt plugins also opt by default
        transitive_disable = true, -- Automatically disable dependencies of disabled plugins
        auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
        git = {
            cmd = "git", -- The base command for git operations
            subcommands = { -- Format strings for git subcommands
                update = "pull --ff-only --progress --rebase=false",
                install = "clone --depth %i --no-single-branch --progress",
                fetch = "fetch --depth 999999 --progress",
                checkout = "checkout %s --",
                update_branch = "merge --ff-only @{u}",
                current_branch = "branch --show-current",
                diff = "log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD",
                diff_fmt = "%%h %%s (%%cr)",
                get_rev = "rev-parse --short HEAD",
                get_msg = "log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1",
                submodules = "submodule update --init --recursive --progress"
            },
            depth = 1, -- Git clone depth
            clone_timeout = 60, -- Timeout, in seconds, for git clones
            default_url_format = "https://github.com/%s" -- Lua format string used for "aaa/bbb" style plugins
        },
        non_interactive = false, -- If true, disable display windows for all operations
        display = {

            open_fn = function()
                return require("packer.util").float({border = "rounded"})
            end, -- An optional function to open a window for packer's display
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

        luarocks = {
            python_cmd = "python" -- Set the python command to use for running hererocks
        },
        log = {level = "warn"}, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
        profile = {
            enable = true,
            threshold = 1 -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
        }
    }
})

-- This will cause breaking the buffer while we change some  packages, but it is nice to keep
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-----------------------------------------------------------------------------------------------------------------------
-- This is necessary as we have changed already the directory of our compilation.
local path = require("packer.util").join_paths(vim.fn.stdpath("data"), "plugin",
                                               "packer_compiled.lua")
-- require("packer").compile(path)
-- require("packer").compile(path)  -- this will be required if change the packer compile directory
-- Configurations for the sneak plugin

-- ===========================================================================
--                       Sneak checking if it is installed
-- ===========================================================================

local function sneak_loader()
    local sneak_package_path = "/site/pack/packer/start/vim-sneak"
    install_path = fn.stdpath("data") .. sneak_package_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] Sneak library at :%s is not existed, will be installed after packer compiled ." | echohl None]]):format(
                install_path))
    else
        require("plugins.configs.sneak").sneakSetup()
    end
end

-- ===========================================================================
--                      Check for blamer if it is installed
-- ===========================================================================

local function blamer_loader()
    local blamer_package_path = "/site/pack/packer/start/blamer.nvim"
    install_path = fn.stdpath("data") .. blamer_package_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] Blamer library at :%s is not existed, will be installed after packer compiled ." | echohl None]]):format(
                install_path))
    else
        -- Adding  configurations for blamer
        require("plugins.configs.myGitBlamer").BlamerSetting()
    end
end

-- ===========================================================================
--                      Check for undotree if it is installed
-- ===========================================================================

local function undotree_loader()
    local undotree_package_path = "/site/pack/packer/start/undotree"
    install_path = fn.stdpath("data") .. undotree_package_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] UndoTree library at :%s is not existed, will be installed after packer compiled ." | echohl None]]):format(
                install_path))
    else
        -- Loading undo-tree for our persistence data and saving directory
        require("plugins.configs.myUndoTreeConfig")
    end
end

-- ===========================================================================
--                      Check for luaStatus if it is installed
-- ===========================================================================

local function lualine_loader()
    local lualine_package_path = "/site/pack/packer/start/lualine.nvim"
    install_path = fn.stdpath("data") .. lualine_package_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] lualine library at :%s is not existed, will be installed after packer compiled ." | echohl None]]):format(
                install_path))
    else
        -- Configure the status line for gpb
        local conf = require("plugins.configs.myLuaLine")
        require("lualine").setup({
            options = conf["options"],
            sections = conf["sections"]
        })
    end
end

-- ===========================================================================
--                     Markdown table on the fly
-- ===========================================================================

local function myMarkdownTableMode_loader()
    local myMarkdownTableMode_package_path =
        "/site/pack/packer/start/vim-table-mode"
    install_path = fn.stdpath("data") .. myMarkdownTableMode_package_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] myMarkdownTableMode_package_path library at :%s is not existed, will be installed after packer compiled ." | echohl None]]):format(
                install_path))
    else
        -- Configure the markdown table plugin
        require("plugins.configs.myMarkdownTableMode")
    end
end

-- ===========================================================================
--                     Startify Config launcher
-- ===========================================================================
-- To check if the startify plugin has been already installed
local function myStartifyConfigLauncher()
    local startify_plugin_path = "/site/pack/packer/start/vim-startify"
    install_path = fn.stdpath("data") .. startify_plugin_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] Startify library at :%s is not existed, will be installed after packer sync and compiled ." | echohl None]]):format(
                install_path))
    else
        -- Configure the startify table plugin
        require("plugins.configs.myStarify")
    end
end

-- ===========================================================================
--                     Loading my custom Quote random generator.
-- ===========================================================================

local function myQuoteConfigLauncher()
    local nvim_notify_loader_path = "/site/pack/packer/start/nvim-notify"
    install_path = fn.stdpath("data") .. nvim_notify_loader_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] Nvim Notify library for my Quote generator at :%s is not existed, will be installed after packer sync and compiled ." | echohl None]]):format(
                install_path))
    else
        -- Configure the quote table plugin
        require("plugins.configs.myQuote")
    end
end

-- ===========================================================================
--               Fetching the startup packages
-- ===========================================================================
-- Sneak moving
sneak_loader()
-- blame git with the given code
blamer_loader()
undotree_loader() -- This cause a problem with the current.
myMarkdownTableMode_loader()
-- Custom lualine for my own preferences compatable with Lua 0.6
lualine_loader()
-- myStarify  config launcher
myStartifyConfigLauncher()
-- myQuote Configuration loader
myQuoteConfigLauncher()
-- ===========================================================================
--              Treesitter highlighting, indentation, folading ..etc
--              check: https://codevion.github.io/#!vim/treelsp.md
-- ===========================================================================
-- This will allow to install all the treesitter at once, you can also use
-- specific language as shown in the plugins.configs.mytreesitter.lua (not used)
local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = "all", -- Only use parsers that are maintained
    highlight = { -- enable highlighting
        enable = true
    },
    indent = {
        enable = false -- default is disabled anyways
    }
})
