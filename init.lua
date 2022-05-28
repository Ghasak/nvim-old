-- --------------------------------------------------------------------------------------------------------------------
--
--                ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗  ██╗███╗░░██╗██╗████████╗░░░
--                ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║  ██║████╗░██║██║╚══██╔══╝░░░
--                ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║  ██║██╔██╗██║██║░░░██║░░░░░░
--                ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║  ██║██║╚████║██║░░░██║░░░░░░
--                ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║  ██║██║░╚███║██║░░░██║░░░██╗
--                ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝  ╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝
--                     █▀▄▀█ █▀█ █▀▄ █▀▀ █▀█ █▄░█   █▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█   █▀█ ░ 
--                     █░▀░█ █▄█ █▄▀ ██▄ █▀▄ █░▀█   █░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█   █▄█ ▄ 7
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
--                     .@@@@@@;%@@;@@@@@@@;;@@@@@;@@@@;%%;@@@@@;@@@@;@@@;@@@@@@ear
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
-- --------------------------------------------------------------------------------------------------------------------
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
    "plugins.configs.myDap", "plugins.configs.myCopilot"
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

