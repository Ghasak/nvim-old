local full_path = function()
    -- Full path is with (F), short path is (f)
    return "%<%F%m %#__accent_red#%#__restore__#"
end

local system_icon = function()
    if vim.loop.os_uname().sysname == "Darwin" then
        local icon = [["   "]]
        return icon
    else
        return
    end
end

return {
    options = {
        theme = "gruvbox",
        icons_enabled = true,
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        component_separators = {
            left = "",
            right = ""
        },
        section_separators = {
            left = "",
            right = ""
        },
        disabled_filetypes = {"dashboard", "NvimTree", "Outline"}

        -- disabled_filetypes = {},
    },
    sections = {

        lualine_a = {{[[" "]]}, {"mode"}},
        -- lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp", "coc" } } },

        lualine_b = {
            {
                "branch",
                icons_enabled = false,
                fmt = function(str) return " " .. str end
            }, "diff", {
                "diagnostics",
                sources = {"nvim_lsp", "coc"}
            }
        },
        lualine_c = {
            {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
                shorting_target = 40 -- Shortens path to leave 40 space in the window
                -- for other components. Terrible name any suggestions?
            }
        },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = {
            {"encoding"}, {"filetype"}, {system_icon()},
            {"b%n", "%1v", "%3p%%", "linerr", "windowswap"}
        },
        -- lualine_y = {"progress"},
        lualine_y = {"progress"}
    },
    -- lualine_z = { "location" },
    lualine_z = {{"location"}},

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

-- {{"[[ ]]" ,'mode', }},

-- "let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%2v'])

-----------------------------------------------------------
--          Air Line Configurations
-----------------------------------------------------------
-- You will need (Airline installed, all the rest configurations are written in native vim)

-- vim.cmd([[
-- let w:airline_disable_statusline = 0
-- let g:airline_statusline_ontop = 0
-- let g:airline_section_c_only_filename = 1
-- let g:airline#extensions#battery#enabled = 1
-- let g:airline#extensions#ctrlp#show_adjacent_modes = 1
-- let g:airline#extensions#keymap#enabled = 1
-- ]])
--

-- vim.cmd([[
-- let g:airline#extensions#lsp#enabled = 1
-- let g:airline_stl_path_style = 'long'
--
-- if !exists('g:airline_symbols')
--   let g:airline_symbols = {}
-- endif
--
-- "set guifont=Monaco:h10
-- set guifont=VictorMono\ Nerd\ Font:h21
-- let g:airline_symbols.space = "\ua0"
-- " testing rounded separators (extra-powerline-symbols):
-- let g:airline_left_sep = "\ue0c6"
-- let g:airline_right_sep = "\ue0c7"
-- "let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%2v'])
-- "let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
-- let g:airline_skip_empty_sections = 1
--
-- ]])
--
-- vim.cmd([[
--   let g:airline_left_sep = ''
--   let g:airline_left_alt_sep = ''
--   let g:airline_right_sep = ''
--   let g:airline_right_alt_sep = ''
--   "let g:airline_symbols.branch = ''
--   let g:airline_symbols.branch = ''
--   let g:airline_symbols.colnr = ' :'
--   let g:airline_symbols.readonly = ''
--   let g:airline_symbols.linenr = ' :'
--   let g:airline_symbols.maxlinenr = ' ☰  '
--   "let g:airline_symbols.maxlinenr = ' '
--   let g:airline_symbols.dirty='⚡'
--   let g:airline_stl_path_style = 'long'
-- ]])
-- -- change sections
-- -- Reference:   https://stackoverflow.com/questions/10488717/how-can-i-permanently-display-the-path-of-the-current-file-in-vim
--               -- https://github.com/vim-airline/vim-airline/issues/235
-- vim.cmd([[
-- "set statusline +=%{resolve(expand('%:p'))}\ %*
-- "let g:airline_section_a += ''
-- let g:airline_section_a = airline#section#create(['  ','mode'])  "--   
-- "let g:airline_section_b = airline#section#create(['mode','hunks', 'branch'])
-- "let g:airline_section_a = 'b%n, w%{winnr()}%#__accent_bold#%{winnr()==winnr("#")?" [LW]":""}%#__restore__#'
-- let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
-- ]])
--
