# Neovim and init configurations (build v.01)

## Contents

The following configurations my lua with nvim as my daily-working environment.
As now-days the main nvim development team are shifted complitely to use lua
instead of vim scripting.

### Requirements

- [x] Support native lua-lsp with nvim 5.0+
  - IntelIncense (very very ), several plugins I have implemented ()
  - Diagnostic for errors, hover on error, show implementation, jump to definition, code action suggestions (Lspsaga and lsp-)
- [x] All language servers that I need on daily basis, (lua, python, R , javaScript, shell, rust and C++)
- [x] Support for data-science paradigms and tools including the Jupyter-notebook, debugger with Jupyter-notebook ..etc.
- [x] Fully customizable with each piece of code I know its purpose and the its effect.

### To do

- [ ] Adding dap for python, lua, js and R.
- [ ] Optimize the performance of the launched packages with events, cmd and lazy-loading.
- [ ] Adding org mode, to-do list and some other interesting plugins.
- [ ] Getting more lua coding for optimization nvim on first installation,
      (such as changing the packer-compiled directory with packer.init(), up to
      now, the nvim will not automated to recompiled on attach, need manually to
      compile)
- [ ] Adding auto commenting lines, and multi-cursors support
- [ ] Save session with nvim.

#### Setup Lua, that already I transfer from previous vim with coc-setting.

What usually we want from our configurations is the following items:

- [x] Syntax highlighting
- [x] Snippets
- [x] TreeSitter
- [x] Jump to definition
- [x] Show definition on hover
- [x] Show Implementations.
- [x] Show reference
- [x] Theme
  - Status-line of lua (prefered airline although it is a bit slower)
  - Global theme (already automated)
  - Customizing the icons
- [x] Floating terminal
- [x] Show ranger
- [x] Check spelling
- [x] Show directory and location within the given scope
- [x] Show down terminal (terminal not float, stay opened )
- [x] Update on change with other editor (Running a script on fly)
- [x] Dashboard and Dashboard Customization.
- [x] Tab configuration
- [x] Moving block of code on request.
- [x] Navigate using ctrl + j and k for omini-windows.
- [x] Install Coc-server but not conflict with our `nvim-lspconfig` language-servers.

#### Things to consider

You will need the following necessary packages

- Nvim 5.0+ currently I have a problem with 6.0, so shifted to use 5.0+,
  - We need some dependencies that comes with the installed version by the
    brew, but I will not use the nvim that comes with the nvim, so after
    install the dependencies, I can remove the nvim 6.0.
- nvim-lspconfig for language-server
- nvim-lsp language installer (adding install a specific language)
- Lua language server installed up-and-running
- Lua configuration with formatting.
- lspsaga and lspinstall, lsp-signture.

#### Setup packer

packer package manager is located at [packer ](https://github.com/wbthomason/packer.nvim)
I have appended this project on Mac as it has a problem with the packer to install the packages.
main issue is that brew installed the lua and there is also luajit_a which comes with the packer itself.

## Building Nvim from Scratch

## Install Lua LSP-language server from scratch (without LSPInstall)

## Configure Lua LSP-Language server

## Auto-complete with CMP

## Lua formatter

There are several formatter that we can add to format our lua code such as,
To format the lua code we need to install them first,

```sh
cargo install stylua
luarocks install --server=https://luarocks.org/dev luaformatter
```

## Testing the speed of the neovim launching time.

Use the command `vim-startuptime` which will offer a quick calcuation of the launching time.

- For my MacBook I used the custome binary (prebuild) with `vim-startuptime_darwin_amd64.zip`
- [vim-startuptime website](https://github.com/rhysd/vim-startuptime)

This is the first thing to make for the current file.,

- Right now I am using a neovim build (5.0), build with the requirements shown here.

- [Neovim build from the source](https://github.com/neovim/neovim/wiki/Building-Neovim)
- plugin directory will be at same directory of our nvim, I have tried to change this directory, but it causes many problems. When you do a fresh installation, try to delete the following two directories:
  - ~/.config/plugin
  - ~/.local/share/nvim

## Creating file or directory in vim without plugin

You can use the following,

### Formula

1. In the command prompt of `Nvim`, you can use the following configurations.

```sh
! cd /directory/direcotyr_2/direcotry_3
! mkdir <name>
! touch <name>.extention

```

2. Accessing the prompt to open browser

```sh
!open -a "Safari" <link, e.g www.google.com>

```

## Changing the nvim-clap theme color

- Requirements for the configure the theme of nvim-clap, and call the them using

```sh
vim.cmd[[let g:clap_theme = 'material_design_dark']]
```

- [x] ~/.local/share/nvim/site/pack/packer/start/vim-clap/autoload/clap/themes/material_design_dark.vim.modified.now.used
- Simply changed the color of the background to fit my terminal.

```sh

" Author: liuchengxu <xuliuchengxlc@gmail.com>
" Description: Clap theme based on the material_design_dark theme."

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:palette = {}

let s:palette.display = { 'ctermbg': '235', 'guibg': '#424242' }

" Let ClapInput, ClapSpinner and ClapSearchText use the same background.

let s:bg0 = { 'ctermbg': '60', 'guibg': '#424242' }
let s:palette.input = s:bg0
let s:palette.indicator = extend({ 'ctermfg': '238', 'guifg':'#676b83' }, s:bg0)
let s:palette.spinner = extend({ 'ctermfg': '11', 'guifg':'#ffe500', 'cterm': 'bold', 'gui': 'bold'}, s:bg0)
let s:palette.search_text = extend({ 'ctermfg': '195', 'guifg': '#CADFF3', 'cterm': 'bold', 'gui': 'bold' }, s:bg0)

let s:palette.preview = { 'ctermbg': '238', 'guibg': '#424242' }

let s:palette.selected = { 'ctermfg': '81', 'guifg': '#5FD7d7', 'cterm': 'bold,underline', 'gui': 'bold,underline' }
let s:palette.current_selection = { 'ctermbg': '236', 'guibg': '#31364D', 'cterm': 'bold', 'gui': 'bold' }

let s:palette.selected_sign = { 'ctermfg': '196', 'guifg': '#f2241f' }
let s:palette.current_selection_sign = s:palette.selected_sign

let g:clap#themes#material_design_dark#palette = s:palette

let &cpoptions = s:save_cpo
unlet s:save_cpo

```

## Checking my key-mapping with

You can use `:verbouse map`, or `:Telescope keymaps`, to check all the key bindings.

## Spell checking

For spell checking I am using the 'kamykn/spelunker.vim', and mapped the (ZL and Zl) for checking the spelling.
this is less attractive compared to the nvim spell checking from COC, Since I don't use coc anymore, I switched to this plugin instead.

## Fuzzy finding

One of the coolest feature I have created is to implement the fuzzy finder in lua to get the path
The mapping is located at lua/scripts/myCommandWrapper.lua , which will be triggered in insert mode with (CTR-X, then CTRL-F)
it will automatically complete the path for your while you are searching for any specific word.

- [Idea got it fromm](https://vi.stackexchange.com/questions/34392/path-completion-with-fzf-from-absolute-path)
  you will need the following plugins:

```shell
  use{'junegunn/fzf', run = "fzf#install()"}
  use{'junegunn/fzf.vim'}
```

- [FZY finder repository](https://github.com/junegunn/fzf.vim)

## Commands

| Command           | List                                                                                  |
| ----------------- | ------------------------------------------------------------------------------------- |
| `:Files [PATH]`   | Files (runs `$FZF_DEFAULT_COMMAND` if defined)                                        |
| `:GFiles [OPTS]`  | Git files (`git ls-files`)                                                            |
| `:GFiles?`        | Git files (`git status`)                                                              |
| `:Buffers`        | Open buffers                                                                          |
| `:Ag [PATTERN]`   | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all)               |
| `:Rg [PATTERN]`   | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all)               |
| `:Colors`         | Color schemes                                                                         |
| `:Lines [QUERY]`  | Lines in loaded buffers                                                               |
| `:BLines [QUERY]` | Lines in the current buffer                                                           |
| `:Tags [QUERY]`   | Tags in the project (`ctags -R`)                                                      |
| `:BTags [QUERY]`  | Tags in the current buffer                                                            |
| `:Marks`          | Marks                                                                                 |
| `:Windows`        | Windows                                                                               |
| `:Locate PATTERN` | `locate` command output                                                               |
| `:History`        | `v:oldfiles` and open buffers                                                         |
| `:History:`       | Command history                                                                       |
| `:History/`       | Search history                                                                        |
| `:Snippets`       | Snippets ([UltiSnips][us])                                                            |
| `:Commits`        | Git commits (requires [fugitive.vim][f])                                              |
| `:BCommits`       | Git commits for the current buffer; visual-select lines to track changes in the range |
| `:Commands`       | Commands                                                                              |
| `:Maps`           | Normal mode mappings                                                                  |
| `:Helptags`       | Help tags <sup id="a1">[1](#helptags)</sup>                                           |
| `:Filetypes`      | File types                                                                            |

## How to close your windows without affecting other buffers

You can use `Bdelete` we will map this to <leader>w, this will allow to close
the given window without closing all the other buffers.

## Highlight words in vim with (f/t/F/T)

- [vim-eft plugin](https://github.com/hrsh7th/vim-eft)

## Performance and optimization

I have used two types of performance, the `vim-startuptim ` assigned
with a flag `--vimpath=nvim`, also packer profile with `:PackerProfile profile=true`. The results are shown below

- **Note**:
Usually, I change  (.git) to (.git.when_ready_to_upload) or what
  ever, as i noticed the git affect the performance of my configuration
  (init.lua), the time increase at least 100 msec

''''''

```sh
  Config for sidebar.nvim took 78.00594ms
  Sequenced loading took 11.807982ms
  packadd for vim-matchup took 1.459474ms
  packadd for nvim-lspinstall took 1.211138ms
  Config for bufferline.nvim took 1.012205ms
```

```sh
─ ghasak.ibrahim   on ~/.config/nvim   
├─ﮧ  
╰綠﨡  vim-startuptime --vimpath=nvim                                                                                                                                                                                                                                                                                  祥:301ms  [   Oct 12, 2021-   12:16:53 AM]
Extra options: []
Measured: 10 times

Total Average: 498.940300 msec
Total Max:     529.594000 msec
Total Min:     456.653000 msec

   AVERAGE        MAX        MIN
---------------------------------
160.823900 214.973000 144.284000: /Users/ghasak.ibrahim/.config/nvim/plugin/packer_compiled.lua
 91.582500 110.265000  83.957000: opening bufers
 65.604600 110.307000  54.569000: /Users/ghasak.ibrahim/.config/nvim/init.lua
 33.986700  61.898000  27.400000: loading plugins
 33.821100  36.743000  32.519000: loading packages
 28.173300  72.163000  20.570000: BufEnter autocommands
 24.232600  45.017000  20.896000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/syntax/syntax.vim
 23.717000  42.870000  20.591000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/syntax/synload.vim
 19.646166  38.764000  14.141000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/gruvbox-material/colors/gruvbox-material.vim
 10.750100  20.879000   9.089000: inits 1
 10.674700  24.410000   8.518000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/plugin/matchup.vim
  8.900900  12.000000   7.684000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/filetype.vim
  3.668100   4.829000   3.350000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/cmp-look/after/plugin/cmp_look.lua
  3.666600   7.865000   2.752000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/section.vim
  2.737400   2.830000   2.656000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-devicons/plugin/webdevicons.vim
  2.709800   3.117000   2.601000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim/plugin/symbols-outline.vim
  2.573100   3.012000   2.333000: loading after plugins
  2.346600   3.349000   2.146000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-gitgutter/plugin/gitgutter.vim
  2.272400   2.562000   2.068000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-sneak/plugin/sneak.vim
  1.387900   1.509000   1.296000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/blamer.nvim/plugin/blamer.vim
  1.311700   1.443000   1.251000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/gruvbox-material/autoload/airline/themes/gruvbox_material.vim
  1.167800   1.263000   1.055000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/ctrlp.vim/plugin/ctrlp.vim
  1.129200   4.342000   0.633000: sourcing vimrc file(s)
  1.104700   1.201000   1.042000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/plugin/airline.vim
  1.077300   1.154000   1.014000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-fugitive/plugin/fugitive.vim
  1.052100   1.269000   0.941000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig/plugin/lspconfig.vim
  0.924800   1.044000   0.811000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/fzf.vim/plugin/fzf.vim
  0.923000   1.560000   0.692000: locale set
  0.821900   0.851000   0.804000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/spelunker.vim/plugin/spelunker.vim
  0.801700   0.930000   0.739000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim/plugin/lsp-colors.vim
  0.711100   0.797000   0.648000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/fzf/plugin/fzf.vim
  0.654900   0.688000   0.635000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/telescope.nvim/plugin/telescope.vim
  0.625500   1.098000   0.520000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/autoload/matchup/matchparen.vim
  0.493900   1.328000   0.287000: expanding arguments
  0.493000   0.542000   0.425000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-surround/plugin/surround.vim
  0.478200   0.520000   0.444000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim/plugin/lspsaga.vim
  0.457250   0.840000   0.362000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/syntax/syncolor.vim
  0.448300   0.495000   0.419000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions.vim
  0.439000   0.834000   0.334000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/autoload/matchup/loader.vim
  0.435200   0.577000   0.359000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/blamer.nvim/autoload/blamer.vim
  0.433400   2.296000   0.216000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/autoload/matchup.vim
  0.414700   0.451000   0.400000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/term.vim
  0.399500   0.776000   0.317000: init highlight
  0.358100   0.409000   0.293000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/dashboard-nvim/plugin/dashboard.vim
  0.332700   0.377000   0.302000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-eft/plugin/eft.vim
  0.332000   0.411000   0.284000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/gruvbox-material/autoload/gruvbox_material.vim
  0.293200   0.498000   0.250000: reading ShaDa
  0.292800   0.342000   0.245000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-gitgutter/autoload/gitgutter.vim
  0.290500   0.535000   0.226000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/man.vim
  0.272800   0.359000   0.241000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/trouble.nvim/plugin/trouble.vim
  0.272700   0.402000   0.239000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-signify/plugin/signify.vim
  0.272600   0.340000   0.215000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/branch.vim
  0.272400   0.303000   0.247000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-system-copy/plugin/system_copy.vim
  0.261300   0.475000   0.201000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/highlighter.vim
  0.249700   0.279000   0.236000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-floaterm/plugin/floaterm.vim
  0.247100   0.411000   0.186000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/shada.vim
  0.224300   0.299000   0.193000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-clap/plugin/clap.vim
  0.220000   0.239000   0.194000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/ctrlp.vim/autoload/ctrlp/mrufiles.vim
  0.219100   0.283000   0.188000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-cool/plugin/cool.vim
  0.212900   0.241000   0.181000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim/plugin/mkdp.vim
  0.212300   0.289000   0.177000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/util.vim
  0.209300   0.225000   0.196000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister/plugin/ReplaceWithRegister.vim
  0.209000   0.278000   0.177000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/ctrlp.vim/autoload/ctrlp/utils.vim
  0.207000   0.297000   0.190000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/rplugin.vim
  0.194500   0.298000   0.171000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/builder.vim
  0.189300   0.279000   0.156000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-gitgutter/autoload/gitgutter/highlight.vim
  0.185800   0.331000   0.153000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/tabline/buffers.vim
  0.182000   0.191000   0.162000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/tabline.vim
  0.178300   0.338000   0.153000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-gitgutter/autoload/gitgutter/utility.vim
  0.175600   0.367000   0.107000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/init.vim
  0.174100   0.186000   0.169000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline.vim
  0.173800   0.226000   0.146000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/rnvimr/plugin/rnvimr.vim
  0.160400   0.192000   0.133000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/accelerated-jk/plugin/accelerated-jk.vim
  0.159700   0.194000   0.136000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/sidebar.nvim/plugin/sidebar-nvim.vim
  0.156100   0.215000   0.115000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/jupyter_ascending.vim/plugin/jupyter_ascending.vim
  0.155000   0.188000   0.124000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-signify/autoload/sy.vim
  0.151400   0.231000   0.102000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/parts.vim
  0.149300   0.315000   0.081000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/tabline/buflist.vim
  0.148900   0.219000   0.133000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/undotree/plugin/undotree.vim
  0.144600   0.238000   0.095000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/autoload/matchup/ts_engine.vim
  0.144100   0.214000   0.123000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/whitespace.vim
  0.140100   0.205000   0.114000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/tabline/tabs.vim
  0.136300   0.196000   0.107000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/nvim-tree.lua/plugin/nvim-tree-startup.lua
  0.134800   0.237000   0.117000: inits 3
  0.131700   0.362000   0.100000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/autoload/matchup/perf.vim
  0.121200   0.190000   0.100000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/hunks.vim
  0.114400   0.152000   0.095000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/wordcount.vim
  0.111400   0.144000   0.096000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/default.vim
  0.110300   0.153000   0.092000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vista.vim/plugin/vista.vim
  0.096700   0.134000   0.076000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/glow.nvim/plugin/glow.lua
  0.090000   0.114000   0.076000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/themes.vim
  0.088800   0.131000   0.062000: inits 2
  0.085700   0.120000   0.074000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/ctrlp.vim
  0.085100   0.288000   0.053000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall/plugin/lspinstall.vim
  0.084100   0.113000   0.075000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/po.vim
  0.081200   0.293000   0.045000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/ftplugin.vim
  0.080900   0.255000   0.050000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/autoload/matchup/re.vim
  0.078700   0.153000   0.059000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/tabline/autoshow.vim
  0.078000   0.111000   0.064000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/nvimlsp.vim
  0.073700   0.081000   0.061000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/searchcount.vim
  0.073066   0.207000   0.021000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/matchparen.vim
  0.072300   0.088000   0.065000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/quickfix.vim
  0.072100   0.083000   0.068000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/fugitiveline.vim
  0.071100   0.096000   0.054000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/bufdelete.nvim/plugin/bufdelete.vim
  0.066400   0.224000   0.038000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/indent.vim
  0.064400   0.104000   0.045000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/keymap.vim
  0.057500   0.095000   0.044000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/toggleterm.nvim/plugin/toggleterm.vim
  0.055500   0.078000   0.049000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/fzf.vim
  0.054800   0.160000   0.037000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/gzip.vim
  0.053300   0.065000   0.049000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
  0.053100   0.073000   0.045000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/plugin/nvim-web-devicons.vim
  0.052400   0.099000   0.044000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/undotree.vim
  0.051100   0.074000   0.044000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/spelunker.vim/after/plugin/ctrlp/spelunker.vim
  0.049200   0.082000   0.040000: window checked
  0.044800   0.059000   0.039000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-airline/autoload/airline/extensions/vista.vim
  0.042800   0.073000   0.036000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-devicons/autoload/devicons/plugins/ctrlp.vim
  0.040100   0.076000   0.032000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/spellfile.vim
  0.038750   0.085000   0.026000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/vim-fugitive/ftdetect/fugitive.vim
  0.036400   0.061000   0.029000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/neoformat/plugin/neoformat.vim
  0.035800   0.052000   0.026000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/tutor.vim
  0.035500   0.041000   0.032000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/sniprun/plugin/sniprun.vim
  0.033200   0.046000   0.027000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/netrwPlugin.vim
  0.033000   0.041000   0.031000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/start/popup-menu.nvim/plugin/popup-menu.vim
  0.031900   0.043000   0.025000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/zipPlugin.vim
  0.029800   0.059000   0.022000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/health.vim
  0.028000   0.032000   0.025000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/tarPlugin.vim
  0.027600   0.038000   0.023000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/matchit.vim
  0.027500   0.050000   0.020000: /Users/ghasak.ibrahim/dev/share/nvim/runtime/plugin/tohtml.vim
  0.022900   0.029000   0.020000: /Users/ghasak.ibrahim/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim
  0.014700   0.070000   0.007000: editing files in windows
  0.012700   0.027000   0.010000: parsing arguments
  0.012700   0.027000   0.007000: --- NVIM STARTING ---
  0.012700   0.018000   0.012000: clearing screenf
```





## Some useful API functions

```
      local filename = vim.fn.expand "%:t"
      local extension = vim.fn.expand "%:e"
      local extension = vim.fn.expand "%:f"
      local extension = vim.fn.expand "%:F"
```





## References

- [Reference Num -1-](https://github.com/abzcoding/nvim/blob/main/lua/config/cmp.lua)
  - Got the tab complelation for the cmp pluging
  - Got the neovide configuration if the neovide buffer is launched, instead of sourcing, can be found in (options)
- [Reference Num -2-]()
