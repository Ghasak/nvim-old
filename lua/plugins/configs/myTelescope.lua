local M = {}

-- Mapping function for the telescope which are defined globally using (vim.g.nmap/imap/vmap/tmap)
local map = function(op, outer)
  outer = outer or { silent = true, noremap = true }
  return function(lhs, rhs, opts)

    if type(lhs) ~= "table" then
      lhs = { lhs }
    end

    opts = vim.tbl_extend("force",
      outer,
      opts or {}
    )

    for _, v in pairs(lhs) do
      vim.keymap.set(op or "n", v, rhs, opts)
    end

  end
end

vim.g.nmap = map("n")
vim.g.imap = map("i")
vim.g.vmap = map("v")
vim.g.tmap = map("t")

-- Will be loaded
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

M.setup = function()

  -- Allow to open help files in new tabs.
  -- read here: https://stackoverflow.com/questions/4687009/opening-help-in-a-full-window
  vim.cmd([[
  augroup help_as_buffer
  autocmd!
  autocmd FileType help :tabnew % | tabprevious | quit | tabnext
  autocmd FileType help set buflisted
  augroup END
  ]])

  local ivy = themes.get_ivy({
    show_untracked = true
  })

  vim.g.nmap("<leader>ff", function()
    -- if not pcall(builtin.git_files, ivy) then
    --     builtin.find_files(themes.get_ivy({ no_ignore = true }))
    -- end
    builtin.find_files({ sorter = require('telescope.sorters').get_generic_fuzzy_sorter({}) })
  end)

  vim.g.nmap("<leader>fg", function()
    builtin.live_grep()
  end)

  vim.g.nmap("<leader>fb",
    function()
      builtin.buffers(themes.get_dropdown({
        previewer = false
      }))
    end)

  vim.g.nmap("<leader>fh", function()
    builtin.help_tags(ivy)
  end)

  vim.g.nmap("<leader>fp", function()
    telescope.extensions.project.project {}
  end)

  vim.g.nmap("<leader>th", function()
    builtin.colorscheme(ivy)
  end)

  vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
  end)

end

M.config = function()
  telescope.setup({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },

      preview = {
        check_mine_type = false,
        timeout = 100
      },
      file_ignore_patterns = { ".git/" },

      prompt_prefix = "    ",
      selection_caret = "   ",
      -- prompt_prefix = "> ",
      -- selection_caret = "> ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          mirror = false,
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },

      color_devicons = true,
      mappings = {
        i = {
          ["<c-k>"] = actions.move_selection_previous,
          ["<c-j>"] = actions.move_selection_next,
          ['<c-d>'] = actions.delete_buffer
        },
        n = {
          ["<Esc>"] = actions.close
        }
      }
    },
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    dynamic_preview_title = true,
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      },
      project = {
        hidden_files = true
      }
    },
  })

  --telescope.load_extension('project')
  --telescope.load_extension("fzf")

  M.setup()
end

return M
