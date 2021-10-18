-- =================  Branch checking ==========================

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local function env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch "([^/]+)" do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

-- To make it works: uncomment (watch_head), and including in section_a or b or c {{branch}}
local git_branch
local space = " "

-- os specific path separator
local sep = package.config:sub(1, 1)

-- returns full path to git directory for current directory
local function find_git_dir()
	-- get file dir so we can search from that dir
	local file_dir = vim.fn.expand("%:p:h") .. ";"
	-- find .git/ folder genaral case
	local git_dir = vim.fn.finddir(".git", file_dir)
	-- find .git file in case of submodules or any other case git dir is in
	-- any other place than .git/
	local git_file = vim.fn.findfile(".git", file_dir)
	-- for some weird reason findfile gives relative path so expand it to fullpath
	if #git_file > 0 then
		git_file = vim.fn.fnamemodify(git_file, ":p")
	end
	if #git_file > #git_dir then
		-- separate git-dir or submodule is used
		local file = io.open(git_file)
		git_dir = file:read()
		git_dir = git_dir:match("gitdir: (.+)$")
		file:close()
		-- submodule / relative file path
		if git_dir:sub(1, 1) ~= sep and not git_dir:match("^%a:.*$") then
			git_dir = git_file:match("(.*).git") .. git_dir
		end
	end
	return git_dir
end

-- sets git_branch veriable to branch name or commit hash if not on branch
local function get_git_head(head_file)
	local f_head = io.open(head_file)
	if f_head then
		local HEAD = f_head:read()
		f_head:close()
		local branch = HEAD:match("ref: refs/heads/(.+)$")
		if branch then
			git_branch = branch
		else
			git_branch = HEAD:sub(1, 6)
		end
	end
	return nil
end

-- event watcher to watch head file
local file_changed = vim.loop.new_fs_event()
local function watch_head()
	file_changed:stop()
	local git_dir = find_git_dir()
	if #git_dir > 0 then
		local head_file = git_dir .. sep .. "HEAD"
		get_git_head(head_file)
		file_changed:start(
			head_file,
			{},
			vim.schedule_wrap(function()
				-- reset file-watch
				watch_head()
			end)
		)
	else
		-- set to nil when git dir was not found
		git_branch = nil
	end
end

-- returns the git_branch value to be shown on statusline
local function branch()
	if not git_branch or #git_branch == 0 then
		return ""
	end
	local icon = ""
	return icon .. space .. git_branch .. space
end

-- run watch head on load so branch is present when component is loaded_gzip
--watch_head()

-- ================= Work Space Loading time ==========================
local function format_messages(messages)
	local result = {}
	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	local i = 1
	-- Only display at most 2 progress messages at a time to avoid clutter
	for _, msg in pairs(messages) do
		if i < 3 then
			table.insert(result, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
			i = i + 1
		end
	end
	return table.concat(result, " ") .. " " .. spinners[frame + 1]
end

-- REQUIRES LSP
local function hsp_progress()
	local messages = vim.lsp.util.get_progress_messages()
	if #messages == 0 then
		return ""
	end
	return format_messages(messages)
end

-- =======================  File Size =======================
local vim = vim
local space = " "

local function file_size(file)
	local size = vim.fn.getfsize(file)
	if size == 0 or size == -1 or size == -2 then
		return ""
	end
	if size < 1024 then
		size = size .. "B"
	elseif size < 1024 * 1024 then
		size = string.format("%d", size / 1024) .. "KB"
	elseif size < 1024 * 1024 * 1024 then
		size = string.format("%d", size / 1024 / 1024) .. "MB"
	else
		size = string.format("%d", size / 1024 / 1024 / 1024) .. "GB"
	end
	return size .. space
end

local function get_file_size()
	local file = vim.fn.expand("%:p")
	if string.len(file) == 0 then
		return ""
	end
	return file_size(file)
end

-- =================== Full path function ================

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

-- ==================== What to show on the status bar =====================
return {
	options = {
		theme = "gruvbox",
		icons_enabled = true,
		--  section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		--   component_separators = {
		--       left = "",
		--       right = ""
		--   },
		--   section_separators = {
		--       left = "",
		--       right = ""
		--   },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },

		-- disabled_filetypes = {},
	},
	sections = {

		lualine_a = { { [[string.format("%s"," ")]] }, { "mode" } },

		lualine_b = {
			{
				"branch",
				icons_enabled = false,
				fmt = function(str)
					return " " .. str
				end,
			},
			"diff",
			{
				"diagnostics",
				sources = { "nvim_lsp", "coc" },
				symbols = { added = "  ", modified = "柳", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.yellow },
					removed = { fg = colors.red },
				},
			},
			{
				{

  python_env = {
    function()
      if vim.bo.filetype == "python" then
        local venv = os.getenv "CONDA_DEFAULT_ENV"
        if venv then
          return string.format("  (%s)", env_cleanup(venv))
        end
        venv = os.getenv "VIRTUAL_ENV"
        if venv then
          return string.format("  (%s)", env_cleanup(venv))
        end
        return ""
      end
      return ""
    end,
    color = { fg = colors.green },
  },
        },
			},
		},
		lualine_c = {
			{ [[""]] },
			{ full_path },
			--            {
			--                "filename",
			--                file_status = true, -- displays file status (readonly status, modified status)
			--                path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
			--                shorting_target = 40 -- Shortens path to leave 40 space in the window
			--                -- for other components. Terrible name any suggestions?
			--            }
		},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = {
			{ "encoding" },
			{ "filetype" },
			{ system_icon() },
			--{"b%n", "%1v", "%3p%%", "linerr", "windowswap"}
		},
		-- lualine_y = {"progress"},
		lualine_y = { { "filesize" }, { hsp_progress } },
		lualine_z = { "% ʟ %l/%L c %c" },
	},
	-- lualine_z = { "location" },
	--lualine_z = {{"location"}},
	-- lualine_z = {{"% ʟ %l/%L c %c"}},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
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
