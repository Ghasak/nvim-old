# Nvim Workflow

## Configurations

The current configurations are from the needs of getting the best optimized `IDE` for
the startup time.

### Things to be considered
- [x] use the color-scheme form `NVChad`.
- [x] optimized with the `lazy loading` based on packer configuration .
- [x] remove the unnecessary packages form loading that comes with `nvim`.
- [x] Adding the lsp compatibility configuraition skippers for regualr `lsp` vs `rust-tools`.
- [ ] Adding the virtual text lsp configruration.
- [x] Refactoring all the crrent lsp files into more moduels follow the other way of writing.
- [ ] Using Nvim v.0.8
- [ ] Adding symboles inspector for the right corner.
- [x] `cmd` and `/:` should works
- [x] Spelling completion.
- [x] `LSP` configurations advanced, including highlighting and other optimizations
- [ ] Rust-tools and analyzer for complete configurations.
- [ ]

### Migration for Nvim 0.8
check `:h deprecated`
- [x] Need to change vim.highlight.create  into vim.create.hl.
- [x] `compatibility` changed to `compatibility_vim`. : read more about this refactoring later.
- [x] `vim.lsp.buf.format()` now replaces the `vim.lsp.buf.formatting()`


### Nvim with Lua API

- [pretty_print](https://github.com/max397574)
```shell
vim.pretty_print("")
```

### For mapping keyboard
there are two `apis`
- [x] got it from the telescope
- [telescope configuration](https://github.com/vzytoi/nvim.lua/blob/main/lua/plugins/telescope.lua)
```shell
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

```
which means using `vim.keymap.set()`

- [x] Using reqular nvim

```shell
vim.api.nvim_set_keymap("i", "<c-j>", '("<C-n>")', {
	noremap = true,
	silent = true,
	expr = true,
})

```

### Telescope commands

In the `cmd` you can use

```shell
:Telescope keymaps, registers, vim_options, jumplist, loclist, filetypes ..etc.

```
- [Check Vim Pickers](https://github.com/nvim-telescope/telescope.nvim#layout-display)

### Events managment in nvim
There are several ways to manage the `events` such as VimEnter, BufEnter ... etc. Read more here
- [Vim documentation: autocmd](http://vimdoc.sourceforge.net/htmldoc/autocmd.html#autocmd-events)



### Make statusline from scratch


```shell
local function status_line()
  local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
  local file_name = "%-.16t"
  local buf_nr = "[%n]"
  local modified = " %-m"
  local file_type = " %y"
  local right_align = "%="
  local line_no = "%10([%l/%L%)]"
  local pct_thru_file = "%5p%%"
  vim.cmd([[hi StatusLine ctermbg=red ctermfg=yellow ]])

  return string.format(
    "%s%s%s%s%s%s%s%s",
    mode,
    file_name,
    buf_nr,
    modified,
    file_type,
    right_align,
    line_no,
    pct_thru_file
  )
end
vim.opt.statusline = status_line()

```
To add color to `status-line` we can use the following, Go to the `one-darker` configuration file and add the following
which can alter the group color of the `statusline`
```lua
     -- StatusLine
      StatusLine = { fg = '#DADFF7' ,bg = '#008DD5' },
     -- StatusLineTerm = {},
     -- StatusLineNC = {},
     -- StatusLineTermNC = {},
```

### Debugging in lua

In command line prompt for `nvim` you can print the tables using one of the following.

```lua
:lua vim.pretty_print(packer_plugins)
:lua print(vim.inspect(packer_plugins))
```


### Order of execution in nvim

Anything you put inside the `plugin` (notice there is not s), which is same
directory that the `nvim-packer` store the `startup` it will be used to load
the `nvim configuration` It is very useful to understand the directory order to
put the configurations files that used by the nvim for speeding up the startup
time.

- [x] Create a `test.lua` file at the `plugin` then it will source automatically.
- [x] You can put a code inside this `test.lua` any code which can be loaded after all the `lua` files will be sourced and executed.
- [x] Notice that `packer-plugins` is a global variable which will be
  established after sourcing the `packer_compiled.lua`. It will check for a
  plugin called `undotree` (the name should be same as the one from the GitHub
  repository).Here, we will get (`wow`) when we open `init.lua` file automatically.

```shell
if packer_plugins["undotree"] and packer_plugins["undotree"].loaded then
print("Vim undotree is loaded")
-- other custom logic
end

print("wow")

```

```shell
 ├──     LICENSE
 ├──     README.md
 └──     VSCode_setting/
 │  ├────     README.md
 │  ├────     SS-01.png
 │  └────     init.vim
 └──     assets/
 │  ├────     SS-01.old
 │  ├────     SS-01.png
 │  ├────     SS-02.png
 │  ├────     SS-03.png
 │  ├────     SS-04.png
 │  └────     current_loaded_programming_langauge_servers.png
 ├──     init.lua
 └──     lua/
 │  └────     core/
 │  │  ├────     global.lua
 │  │  ├────     init.lua
 │  │  └────     keymappings.lua
 │  └────     plugins/
 │  │  └────     configs/
 │  │  │  ├────     init.lua
 │  │  │  ├────     myFzf.lua
 │  │  │  ├────     myImpatient.lua
 │  │  │  ├────     myNvimTree.lua
 │  │  │  ├────     myTelescope.lua
 │  │  │  ├────     myUndoTreeConfig.lua
 │  │  │  └────     onedark_config.lua
 │  │  ├────     init.lua
 │  │  ├────     packerPluginsManager.lua
 │  │  └────     packerPluginsManagerLoader.lua
 │  └────     settings/
 │  │  ├────     init.lua
 │  │  └────     options.lua
 └──     plugin/
 │  ├────     packer_compiled.lua
 │  └────     test.lua
```

Read more here
- [Plugin Layout in the Dark Ages](https://learnvimscriptthehardway.stevelosh.com/chapters/42.html)




### Adding upper case (captial letter)



-- This will work if you add to (common) for the color scheme.
-- Defing first the synatx group by linking them to existed on using:
-- highlight def link <you_custom_group_name> guifg=<hash-color-name>
-- Then assign to the specific pattern that you want to highlight
```shell
vim.cmd([[
hi def link GGX Title
syn match GGX /[A-Z]+/
syn match GGX /[A-Z]\{2,\}/ "two words or more
syn match GGX "\v<[A-Z]+>"
]])

```
You can also specify some highlight using:
```shell
vim.cmd([[highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE]])
```

There are three ways to highlight custom group (group created by user) these are
1. Using direct nvim syntax


```vim
highlight GGX guifg=#EEEDBF
```
2. Adding to the `one-dark-config.lua` file at the defined highlights like:
Here we will add `GGX`

```lua
	    highlights = {
     -- Common
       Visual = { bg = '$bright_orange', fmt = 'bold'},
       Normal = { fg = '$beautiful_black' ,bg = '$beautiful_black' },                                -- backgorund default color
       Terminal= { fg = '$beautiful_black' ,bg = '$beautiful_black' },                               -- terminal color for nvim
       EndOfBuffer = { fg = '$beautiful_black' ,bg = '$beautiful_black' },                           -- End of buffer color
       VertSplit = { fg = '$light_green' ,bg = '$beautiful_black' },                                 -- when using vertical split
       SignColumn = { fg = '$beautiful_black' ,bg = '$beautiful_black' },                            -- SignColumn control the edge of nvim buffer
     -- Syntax
       String = {fg ='$light_green'},                                                                -- For only string in nvim
	   -- nvim-tree
	    NvimTreeVertSplit =  { fg = '$light_green' ,bg = '$beautiful_black' },                       -- When you split inside nvim-tree the fg will be activited
	    NvimTreeNormal = { fg = '$light_green' ,bg = '$beautiful_black' },                           -- fg means files names, folder names ..etc.
	    NvimTreeEndOfBuffer = { fg = '$light_green' ,bg = '$beautiful_black' },
      NvimTreeGitNew = {fg ='$light_green'  },                                                       -- This will change only the
     -- GGX = {fg = '#EEEDBF'}

```
3. This is native to nvim which we can use

```lua
    vim.highlight.create('GGX', {guifg="#EEEDBF"}, true)
```

We are using now `Global` function to source all the current files
```lua
-- Function used to color (yellow) the upper cases words
_G.highlight_upper_letter_cases = function()
    -- The following
    -- This will work if you add to (common) for the color scheme.
    -- Defing first the synatx group by linking them to existed on using:
    -- highlight def link <you_custom_group_name> guifg=<hash-color-name>
    -- Then assign to the specific pattern that you want to highlight
    -- You can link from other group using:
    -- vim.api.nvim_command([[hi def link GGX Title]])
    -- Or create a new group
    --vim.highlight.create('GGX', {guifg="#EEEDBF"}, true)
    --vim.api.nvim_command([[highlight GGX guifg=#EEEDBF]])
    vim.api.nvim_command([[syn match GGX /[A-Z]+/]])
    vim.api.nvim_command([[syn match GGX /[A-Z]\{2,\}/]])
    vim.api.nvim_command([[syn match GGX "\v<[A-Z]+>"]])
    -- this will be executed only when open vim on event VimEnter (then source all nvim files)
    vim.cmd([[autocmd VimEnter ~/.config/nvim/* source %]])
end
```


## UNDERSTANDING THE COLOR

In `nvim-lua` configurations there are basically three layers that control the `color` of each `group`
- `group` colors are the one defined for specific action in `nvim` such as: digit, tab, normal, background ..etc.
These layers are:
A. Default Layer (this will be native to the color-scheme that you select. (mostly the tree-sitter parser colors are included)
B. Tree-Sitter Color-Groups which used once you install the `nvim-treesitter`
C. Component of the `plugins` that alter the colors (e.g., statuline, bufferline, nvim-tree and lsp configurations)
D. The user custom individual colors defined.

Notice: to change the color, you need to consider to which level you want to alter the color,


## VIM EVENTS
- [list all vim script events](https://tech.saigonist.com/b/code/list-all-vim-script-events.html)

## MEASURE SPEED OF NEOVIM
- [Speedup Neovim ](https://aca.github.io/neovim_startuptime.html)

