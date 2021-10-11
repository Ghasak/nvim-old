local M  = {}

M.setup = function()
    vim.g.dashboard_footer_icon = 'Developer  : G.I.'
    vim.g.dashboard_default_executive = 'telescope'
    -- vim.g.dashboard_default_executive ='clap'
    vim.g.dashboard_custom_header = {

    [[      ▄▄▄▄▄███████████████████▄▄▄▄▄    ]],
    [[    ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄  ]],
    [[   █▀████████▄             ▀▀████ ▀██▄ ]],
    [[  █▄▄██████████████████▄▄▄         ▄██▀]],
    [[   ▀█████████████████████████▄    ▄██▀ ]],
    [[     ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀   ]],
    [[       ▀███▄              ▀██████▀     ]],
    [[         ▀██████▄        ▄████▀        ]],
    [[            ▀█████▄▄▄▄▄▄▄███▀          ]],
    [[              ▀████▀▀▀████▀            ]],
    [[                ▀███▄███▀              ]],
    [[                   ▀█▀                 ]],

  }

    vim.cmd[[
      nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
      nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
      nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
      nnoremap <silent> <Leader>fw :DashboardFindWord<CR>
      nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
      nnoremap <silent> <Leader>fn :DashboardNewFile<CR>
      ]]
    vim.g.dashboard_custom_section = {
        change_colorscheme = {
            description = {'  Scheme change              <leader>tc '},
            command = 'DashboardChangeColorscheme'
        },
        find_frecency = {
            description = {'  File frecency              <leader>tf '},
            command = 'Telescope frecency'
        },
        find_history = {
            description = {'  File history               <leader>fh '},
            command = 'DashboardFindHistory'
        },
        find_project = {
            description = {'  Project find               <leader>fp '},
            command = 'Telescope project'
        },
        find_file = {
            description = {'  File find                  <leader>ff '},
            command = 'DashboardFindFile'
        },
        file_new = {
            description = {'  File new                   <leader>fn '},
            command = 'DashboardNewFile'
        },
        find_word = {
            description = {'  Word find                  <leader>fw '},
            command = 'DashboardFindWord'
        }
    }
end

return M
