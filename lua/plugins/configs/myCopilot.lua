-- ===================================================================================================================
--
--          ░█████╗░░█████╗░██████╗░██╗██╗░░░░░░█████╗░████████╗  ░█████╗░░█████╗░███████╗██╗░██████╗░░░░
--          ██╔══██╗██╔══██╗██╔══██╗██║██║░░░░░██╔══██╗╚══██╔══╝  ██╔══██╗██╔══██╗██╔════╝██║██╔════╝░░░░
--          ██║░░╚═╝██║░░██║██████╔╝██║██║░░░░░██║░░██║░░░██║░░░  ██║░░╚═╝██║░░██║█████╗░░██║██║░░██╗░░░░
--          ██║░░██╗██║░░██║██╔═══╝░██║██║░░░░░██║░░██║░░░██║░░░  ██║░░██╗██║░░██║██╔══╝░░██║██║░░╚██╗░░░
--          ╚█████╔╝╚█████╔╝██║░░░░░██║███████╗╚█████╔╝░░░██║░░░  ╚█████╔╝╚█████╔╝██║░░░░░██║╚██████╔╝██╗
--          ░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░╚════╝░░░░╚═╝░░░  ░╚════╝░░╚════╝░╚═╝░░░░░╚═╝░╚═════╝░╚═╝
--
-- ===================================================================================================================

-- Copliot plugin initializer
-- This will allow the copilot to be triggered with <leader> <TAB>
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

--                         █▀▀ █▀█ █▀█ █ █░░ █▀█ ▀█▀   █▀▀ █▄░█ ▄▀█ █▄▄ █░░ █▀▀
--                         █▄▄ █▄█ █▀▀ █ █▄▄ █▄█ ░█░   ██▄ █░▀█ █▀█ █▄█ █▄▄ ██▄
--                         -- --
-- This is the setting option for enabling/dsiable the copilot globally.
vim.cmd([[
        let g:copilot_enabled = v:true
]])

--                          █▀▀ █▀█ █▀█ █ █░░ █▀█ ▀█▀   █▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀ 
--                          █▄▄ █▄█ █▀▀ █ █▄▄ █▄█ ░█░   ▄█ ░█░ █▀█ ░█░ █▄█ ▄█ 
--
--                  █▀▀ █░█ █▀▀ █▀▀ █▄▀ █ █▄░█ █▀▀   █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
--                  █▄▄ █▀█ ██▄ █▄▄ █░█ █ █░▀█ █▄█   █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█


local function copilot_plugin_installed_check()
    -- This will check if the current command is existed but not checking if
    -- the command is enabled or not.
    if vim.fn.exists("g:copilot_enabled") == 1 then
        print("copilot plugin is installed ...")
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


-- local async = require("plenary.async")
-- local notify = require("notify").async

-- async.run(function()
--   notify("Let's wait for this to close").events.close()
--   notify("It closed!")
-- end)


local function copilot_plugin_enabled_check()
    -- This will check the option of our current setting variable for the
    -- copilot if its set to true or false
    -- print(vim.inspect(vim.api.nvim_get_var('copilot_enabled')))
    if vim.fn.exists("g:copilot_enabled") == 1 then
        if vim.inspect(vim.api.nvim_get_var('copilot_enabled')) then
            local async = require("plenary.async")
            local notify = require("notify").async
            -- vim.notify(file)
            async.run(function()
                local messege = "copilot is enabled ... "
                notify(messege, "WARN", {
                    title = " Copilot plugin status"
                }).events.close()
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
--print(vim.inspect(vim.api.nvim_get_var('copilot_enabled')))
--print(check_to_show_copilot_status_in_lualine_statusbar())
-- ===================================================================================================================
