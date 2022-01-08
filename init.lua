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
-- Helper function for loading sub-modules
local function load_module(mod_name)
    local ok, err = pcall(require, mod_name)
    if not ok then
        local msg = "failed loading: " .. mod_name .. "\n " .. err
        vim.notify(msg, "error")
    end
end

-- initalize the impatient to speed up the loading
if load_module("impatient") then require("plugins.configs.myImpatient") end
-- initalize the pre-defined modules of all setting and configurations
local init_modules = {"settings", "core", "scripts"}
for _, module in ipairs(init_modules) do
    load_module(module)
end

-- Configurations of the Neovide IDE
require("units.neovideConfig").neovide_config()

-- Function to show the full path in nvim when you open a given file
local function show_full_path()
    local file = vim.fn.expand("%:p")
    --vim.notify(file)
    vim.notify(string.format("Initializing file: %s at %s ... ", file, os.date("%H:%M:%S")), "trace")
end

show_full_path()
require("plugins.configs.myDap")
