----------------------------------------------------------------------------------------------------------------------
--
--                ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗  ██╗███╗░░██╗██╗████████╗░░░
--                ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║  ██║████╗░██║██║╚══██╔══╝░░░
--                ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║  ██║██╔██╗██║██║░░░██║░░░░░░
--                ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║  ██║██║╚████║██║░░░██║░░░░░░
--                ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║  ██║██║░╚███║██║░░░██║░░░██╗
--                ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝  ╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝
--                     █▀▄▀█ █▀█ █▀▄ █▀▀ █▀█ █▄░█   █▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█   █▀█ ░ █▄▄
--                     █░▀░█ █▄█ █▄▀ ██▄ █▀▄ █░▀█   █░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█   █▄█ ▄ █▄█
--
--
--                                              .a@@@@@#########@@@@a.
--                                          .a@@######@@@mm@@mm######@@@a.
--                                     .a####@@@@@@@@@@@@@@@@@@@mm@@##@@v;%%,.
--                                  .a###v@@@@@@@@vvvvvvvvvvvvvv@@@@#@v;%%%vv%%,
--                               .a##vv@@@@@@@@vv%%%%;S,  .S;%%vv@@#v;%%'/%vvvv%;
--                             .a##@v@@@@@vv%%vvvvvv%%;SssS;%%vvvv@v;%%./%vvvvvv%;
--                           ,a##vv@@@vv%%%@@@@@@@@@@@@mmmmmmmmmvv;%%%%vvvvvvvvv%;
--                           .a##@@@@@@@@@@@@@@@@@@@@@@@mmmmmvv;%%%%%vvvvvvvvvvv%;
--                          ###vv@@@v##@v@@@@@@@@@@mmv;%;%;%;%;%;%;%;%;%;%;%,%vv%'
--                         a#vv@@@@v##v@@@@@@@@###@@@@@%v%v%v%v%v%v%v%      ;%%;'
--                        ',a@@@@@@@v@@@@@@@@v###v@@@nvnvnvnvnvnvnvnv'     .%;'
--                        a###@@@@@@@###v@@@v##v@@@mnmnmnmnmnmnmnmnmn.     ;'
--                       ,###vv@@@@v##v@@@@@@v@@@@v##v@@@@@v###v@@@##@.
--                       ###vv@@@@@@v@@###v@@@@@@@@v@@@@@@v##v@@@v###v@@.
--                      a@vv@@@@@@@@@v##v@@@@@@@@@@@@@@;@@@v@@@@v##v@@@@@@a
--                     ',@@@@@@;@@@@@@v@@@@@@@@@@@@@@@;%@@@@@@@@@v@@@@;@@@@@a
--                    .@@@@@@;%@@;@@@@@@@;;@@@@@;@@@@;%%;@@@@@;@@@@;@@@;@@@@@@.
--                   ,a@@@;vv;@%;@@@@@;%%v%;@@@;@@@;%vv%%;@@@;%;@@;%@@@;%;@@;%@@a
--                     .@@@@@@;%@@;@@@@@@@;;@@@@@;@@@@;%%;@@@@@;@@@@;@@@;@@@@@@.
--                   ,a@@@;vv;@%;@@@@@;%%v%;@@@;@@@;%vv%%;@@@;%;@@;%@@@;%;@@;%@@a
--                    a@;vv;%%%;@@;%%;vvv;%%@@;%;@;%vvv;%;@@;%%%;@;%;@;%%%@@;%%;.`
--                   ;@;%;vvv;%;@;%%;vv;%%%%v;%%%;%vv;%%v;@@;%vvv;%;%;%;%%%;%%%%;.%,
--                   %%%;vv;%;vv;%%%v;%%%%;vvv;%%%v;%%%;vvv;%;vv;%%%%%;vv;%%%;vvv;.%%%,
--
--                  You are about to experience a potent dosage of Neovim Watch your steps.
--
--                               ╔══════════════════════════════════════════╗
--                               ║           ⎋  HERE BE VIMPIRES ⎋          ║
--                               ╚══════════════════════════════════════════╝
----------------------------------------------------------------------------------------------------------------------
-- Notice setting has to come before core,  as the  ruler highlight color will
-- be reset by the server diagonstic in the core from packerPackgeInit/config.
vim.g.start_time = vim.fn.reltime()
local load_module = require("core.utils").load_module
-- initalize the impatient to speed up the loading
local impatient_loaded_succeed = pcall(require, "impatient")
if impatient_loaded_succeed then require("plugins.configs.myImpatient") end

-- initalize the pre-defined modules of all setting and configurations
local init_modules = {
    "settings", "core", "scripts", "units.neovideConfig",
    "plugins.configs.myDap"
}
for _, module in ipairs(init_modules) do load_module(module) end

-- Function to show the full path in nvim when you open a given file
local function show_full_path()
    local file = vim.fn.expand("%:p")
    local async = require("plenary.async")
    local notify = require("notify").async
    -- vim.notify(file)
    async.run(function()
        local messege = string.format(" %s at %s ... ", file,
                                      os.date("%H:%M:%S"))
        notify(messege, "INFO", {
            title = " Initializing file"
        })
    end)
end

show_full_path()

-- Copliot plugin initializer
vim.cmd([[
        imap <silent><script><expr> <leader><TAB> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
]])

-- b:copilot_enabled       Set to v:false to disable GitHub Copilot for the
--                         current buffer.  Or set to v:true to force enabling
--                         it, overriding g:copilot_filetypes.

-- let g:copilot_filetypes = {
--       \ '*': v:false,
--       \ 'python': v:true,
--       \ }

-- This will disable the copilot globally.
-- vim.cmd([[
--         let b:copilot_enabled = {
--               \ '*': v:false,
--               \ }

--         let g:copilot_filetypes = {
--             \ '*': v:false,
--             \ 'lua': v:true,
--             \ 'python':v:true,
--         \}
-- ]])

-- This is the setting option for enabling/dsiable the copilot globally.
vim.cmd([[
        let g:copilot_enabled = v:true
]])

local function copilot_plugin_installed_check()
    -- This will check if the current command is existed but not checking if the command is enabled or not
    if vim.fn.exists("g:copilot_enabled") == 1 then
        print("copilot plugin is installed")
        local async = require("plenary.async")
        local notify = require("notify").async
        -- vim.notify(file)
        async.run(function()
            local messege = "copilot is installed ... "
            notify(messege, "INFO", {
                title = " Copilot Plugin"
            })
        end)
    end
end

local function copilot_plugin_enabled_check()
    -- This will check the option of our current setting variable for the copilot if its set to true or false
    -- print(vim.inspect(vim.api.nvim_get_var('copilot_enabled')))
    if vim.fn.exists("g:copilot_enabled") == 1 then
        if vim.inspect(vim.api.nvim_get_var('copilot_enabled')) then
            local async = require("plenary.async")
            local notify = require("notify").async
            -- vim.notify(file)
            async.run(function()
                local messege = "copilot is enabled ... "
                notify(messege, "trace", {
                    title = " Copilot plugin status"
                })
            end)
        end
    end

end

local function check_to_show_copilot_status_in_lualine_statusbar()
    if vim.inspect(vim.api.nvim_get_var('copilot_enabled')) then
        return true
    else
        return false
    end
end

-- copilot_plugin_enabled_check()
-- print(check_to_show_copilot_status_in_lualine_statusbar())
print(vim.inspect(vim.api.nvim_get_var('copilot_enabled')))
--print(check_to_show_copilot_status_in_lualine_statusbar())
