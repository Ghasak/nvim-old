local global = require("core.global")
local vim = vim
-- ===========================================================================
--                 Create Directories for Caching files
-- ===========================================================================
local plugin_loader = {}

function plugin_loader:init()
    local home_dir = vim.loop.os_homedir() -- >> Users/ghasak.ibrahim
    local packer_path = vim.fn.stdpath("data") ..
                            "/site/pack/packer/start/packer.nvim" -- >> Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/packer.nvim
    if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
        vim.api.nvim_command(
            'echohl WarningMsg |echom "Nvim-packer is not installed, will be fetch from github, wait momentarily ... " | echohl None')
        vim.fn.system({
            "git", "clone", "https://github.com/wbthomason/packer.nvim",
            packer_path
        })
        vim.cmd("packadd packer.nvim")
        vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
        vim.cmd([[autocmd User PackerComplete ++once lua load_config()]])
    end
    vim.cmd("packadd packer.nvim")
    -- vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
    local packer = require("packer")
    local util = require("packer.util")
    packer.init({
        ensure_dependencies = true, -- Should packer install plugin dependencies?
        package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
        -- comple_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
        compile_path = util.join_paths(vim.fn.stdpath("data"), "plugin",
                                       "packer_compiled.lua"),
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
                fetch = "fetch --depth 1 --progress",
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
        display = {
            non_interactive = false, -- If true, disable display windows for all operations
            open_fn = function()
                return util.float({
                    border = "rounded"
                })
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
        log = {
            level = "warn"
        }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
        profile = {
            enable = true,
            threshold = 1 -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
        }
    })
    packer.reset()
    -- local compile_path = util.join_paths(vim.fn.stdpath("data"), "plugin", "packer_compiled.lua")
    -- packer.compile(compile_path)
    self.packer = packer
    -- compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
    --local package_root = require("packer.util").join_paths(vim.fn.stdpath("data"), "site", "pack")
    --local compile_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "plugin","packer_compiled.lua"),
    -- Adding the package path to the runtime path
    -- This will add the directories that we need to open the packer quickly, previously I used (packer.load(path))
    --vim.cmd[[ set rtp+=~/.local/share/nvim/plugin/*.lua]]
    --vim.cmd [[let &packpath = &runtimepath]]

    return self
end

return {
    init = function() return plugin_loader:init() end
}
