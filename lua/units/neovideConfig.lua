-- "===========================================================================
-- "
-- "        ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗██████╗░███████╗
-- "        ████╗░██║██╔════╝██╔══██╗██║░░░██║██║██╔══██╗██╔════╝
-- "        ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██║░░██║█████╗░░
-- "        ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║░░██║██╔══╝░░
-- "        ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██████╔╝███████╗
-- "        ╚═╝░░╚══╝╚══════╝░╚═══╝░░░░╚═╝░░░╚═╝╚═════╝░╚══════╝
-- "
-- "===========================================================================
-- " Source:
-- "   - https://github.com/Kethku/neovide/wiki/Configuration
-- set guifont=VictorMono\ Nerd\ Font\:h15
-- let g:neovide_refresh_rate=75
-- let g:neovide_transparency=0.8
-- let g:neovide_cursor_animation_length=0.10
-- let g:neovide_cursor_trail_length=0.3
-- let g:neovide_cursor_antialiasing=v:true
-- " cursor Particle:  torpedo, Pixiedust, sonicboom, Ripple
-- let g:neovide_cursor_vfx_mode = "torpedo"
-- "


local M = {}

M.neovide_config = function()
    vim.cmd [[set guifont=VictorMono\ Nerd\ Font\:h15]]
    --vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h12]]
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_opacity = 80.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 5.0
end



return M
