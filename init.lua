----------------------------------------------------------------------------------------------------------------------
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
local init_modules = { "settings", "core", "scripts"}
for _, module in ipairs(init_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error in loading modules ...< " .. module .. " > " .. "\n\n" .. err)
	end
end

-- Configurations of the Neovide IDE
require("units.neovideConfig").neovide_config()

-- Function to show the full path in nvim when you open a given file
local function show_full_path()
	local file = vim.fn.expand("%:p")
	vim.notify(file)
end

show_full_path()

