-- =================  Help can be found here  ==========================
-- :h statusline
-- =================  LSP language server client =======================
local function env_cleanup(venv)
    if string.find(venv, "/") then
        local final_venv = venv
        for w in venv:gmatch("([^/]+)") do final_venv = w end
        venv = final_venv
    end
    return venv
end

local lsp_func = function(msg)
    -- Function that return the client language server corresponding to the
    local server_icon = "歷"
    local server_icon_not_not_known = "轢"
    local servers = {}
    local path = vim.fn.stdpath("data")
    path = string.format("%s", path)
    local clients = vim.lsp.get_active_clients()
    local buff_ft = vim.bo.filetype
    for _, client in pairs(clients) do table.insert(servers, client) end
    for _, server in ipairs(servers) do
        if buff_ft == "lua" and server.name == "sumneko_lua" then -- [lua] For nvim 0.51 server.nam for lua is  lua, while for 0.6 it is sumneko_lua
            return string.format("%s : sumneko-lua-lsp", server_icon)
        elseif buff_ft == "python" and server.name == "pyright" then --  [python] For nvim 0.51 serer.name is python , while for 0.6 it is now pyright
            -- regular virtualenv stored in variable VIRTUAL_ENV
            local venv = os.getenv("VIRTUAL_ENV")
            if venv ~= nil then
                return string.format("%s-%s: pyright-lsp", server_icon,
                                     env_cleanup(venv))
            else
                return string.format("%s: pyright-lsp", server_icon)
            end
        elseif buff_ft == "r" and server.name == "r" then
            return string.format("%s : R-lsp", server_icon)
        elseif buff_ft == "markdown" and server.name == "ltex" then -- [Markdown] For nvim 0.51, server.name is html, while for 0.6 it is latex
            return string.format("%s : markdown-lsp", server_icon)
        elseif buff_ft == "typescript" and server.name == "tsserver" then
            return string.format("%s : typescript-lsp", server_icon)
        elseif buff_ft == "javascript" and server.name == "tsserver" then
            return string.format("%s : javascript-lsp", server_icon)
        elseif buff_ft == "julia" and server.name == "julials" then
            return string.format("%s : Julia-lsp", server_icon)
        -- Define  C++ language server
        elseif buff_ft == "cpp" and server.name == "clangd" then
            return string.format("%s : cpp-lsp", server_icon)
        else
            return string.format("%s : %s-lsp*", server_icon_not_not_known,
                                 buff_ft)
        end
    end
end

local check_git = function()
    local file_dir = vim.fn.expand("%:p:h") .. ";"
    local git_dir = vim.fn.finddir(".git", file_dir)
    local git_file = vim.fn.findfile(".git", file_dir)

    -- local result = {[['  ']] 'FugitiveHead'}
    local result = [['  ' '\'FugitiveHead\'']]
    return result
end


-- ================== check copilot if its installed and enabled =============
local function copilot_status()

    local copilot_icon_loaded = "   ﮧ "
    local copilot_icon_not_loaded = "   ﮧ "

    if vim.fn.exists("g:copilot_enabled") == 1 then
        if (vim.inspect(vim.api.nvim_get_var('copilot_enabled')) == "true") then
            -- return true if copilot is installed and set to be enabled
            return string.format("%s",copilot_icon_loaded)
        else
            return string.format("%s",copilot_icon_not_loaded )

        end
end
end

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
    red = "#ec5f67"
}

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
    if #git_file > 0 then git_file = vim.fn.fnamemodify(git_file, ":p") end
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
        file_changed:start(head_file, {}, vim.schedule_wrap(function()
            -- reset file-watch
            watch_head()
        end))
    else
        -- set to nil when git dir was not found
        git_branch = nil
    end
end

-- returns the git_branch value to be shown on statusline
local function branch()
    if not git_branch or #git_branch == 0 then return "" end
    local icon = ""
    return string.format("%s %s", icon, git_branch)
    -- return icon .. space .. git_branch .. space
end

-- run watch head on load so branch is present when component is loaded_gzip
-- watch_head()

local scrollbar = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    -- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }

    -- local chars = { "", "", "", "", "", "", "▆▆", "▇▇", "██" }
    -- local chars = { " ", " ", " ", " ", " ", " ", " ", " ", " " , " ", " ", " ", " "}
    -- local chars = {
    --     " ", " ", " ", " ", " ", " ", " ", " ", " "
    -- }
    local chars = {
        "  __", "  ▁▁", "  ▂▂", "  ▃▃", "  ▄▄",
        "  ▅▅", "  ▆▆", "  ▇▇", "  ██"
    }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local scrollbar2 = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = {" ", " ", " ", " ", " ", " "}
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end
-- ================= Work Space Loading time ==========================
local function format_messages(messages)
    local result = {}
    local spinners = {
        "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"
    }
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    local i = 1
    -- Only display at most 2 progress messages at a time to avoid clutter
    for _, msg in pairs(messages) do
        if i < 3 then
            table.insert(result,
                         (msg.percentage or 0) .. "%% " .. (msg.title or ""))
            i = i + 1
        end
    end
    return table.concat(result, " ") .. " " .. spinners[frame + 1]
end

-- REQUIRES LSP
local function hsp_progress()
    local messages = vim.lsp.util.get_progress_messages()
    if #messages == 0 then return "" end
    return format_messages(messages)
end

-- =======================  File Size =======================
local vim = vim
local space = " "

local function file_size(file)
    local size = vim.fn.getfsize(file)
    if size == 0 or size == -1 or size == -2 then return "" end
    if size < 1024 then
        size = string.format("猪 %d", size) .. "B"
    elseif size < 1024 * 1024 then
        size = string.format("猪 %d", size / 1024) .. "KB"
    elseif size < 1024 * 1024 * 1024 then
        size = string.format("猪 %d", size / 1024 / 1024) .. "MB"
    else
        size = string.format("猪 %d", size / 1024 / 1024 / 1024) .. "GB"
    end
    return size .. space
end

local function get_file_size()
    local file = vim.fn.expand("%:p")
    if string.len(file) == 0 then return "" end
    return file_size(file)
end

-- =================== Full path function ================

local full_path = function()
    -- Full path is with (F), short path is (f)
    return "%<%F%m %#__accent_red#%#__restore__#"
end

local system_icon = function()
    local system_type = vim.loop.os_uname().sysname
    local icon = ""
    if system_type == "Darwin" then
        icon = [["   "]]
    elseif system_type == "Linux" then
        icon = [["   "]]
    elseif system_type == "Windows" then
        icon = [[" 者 "]]
    else
        return ""
    end
    return icon
end

-- ==================== What to show on the status bar =====================
return {
    options = {
        theme = "gruvbox",
        --theme = "github_dark",
        -- Github theme: https://github.com/projekt0n/github-nvim-theme/blob/main/LUALINE.md
        --theme = "github_dimmed",
        icons_enabled = true,
        disabled_filetypes = {"dashboard", "NvimTree", "Outline"},

        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {

        lualine_a = {{[[string.format("%s"," ")]]}, {"mode"}, check_git()[1]},
        lualine_b = {
            {
                "branch",
                icons_enabled = false,
                fmt = function(str) return " " .. str end
            }, "diff", {
                "diagnostics",
                sources = {"nvim_diagnostic", "coc"} --  for nvim 0.6
            }
        },
        lualine_c = {{[[""]]}, {full_path}},
        lualine_x = {{"encoding"}, {"filetype"}, {lsp_func}, {system_icon()}},
        lualine_y = {{get_file_size}, {hsp_progress}},
        lualine_z = {
            {copilot_status},
            --{"% ʟ %l/%L c %c"},
            {"%m%5([ʟ%l/%L%)(c%c) %p%%]"},  -- compatible with nvim 0.7
            {
                scrollbar,
                separator = nil
            }
        }
    },
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

