# Neovim and init. configurations (build v.02)

## What is new?

As `nvim` is now updated to version 0.6 with a stable release, `nvim-telescope`
has not backword compatibility. The `nvim-lsp` now become `nvim-diagonstics`
built-in APIs which many other plugins are not supported yet. In this
repository, I have migrated to the new `version 0.6`, only the `lsp-saga` has
fixed, but still `lsp-signture` has not been updated yet (to be investigated
later).

- Now all packages are supported with the `NVIM v.06`.
- More compatibility issues are now fixed with the lsp-configs.
- Adding to a `git` version contorl to `.local/share/nvim` which will not be pushed to the Github, just to retrieve any version to my current nvim IDE.
- Adding branches to the `~/.config/nvim/` , for each version, also a branch called `feature/dev` to check and try any new feature or package.

### About Branch and Github
Current working flow with my main repo is:
Once you have updated your `main` branch (change, modified, create ..etc)
1. On main branch, `git add --> git commit --> git push `, you will get your main in `remote` updated to the latest comments.
2. Switch to the release branch currently I am using `nvim0.6` branch, using `git checkout nvim0.6`,
- git merge main
- git add -a
- git commit -m "some message"
- git push
3. On GitHub main repo. you will see that your pull-request to merge with the main doesnt appear, the reson is that your `main branch` is identical copy to your `nvim0.6 branch`.



## Contents

The following configurations my lua with nvim as my daily-working environment.
As now-days the main nvim development team are shifted completely to use lua
instead of vim scripting.

![Current versions view](./assets/SS-03.png)
![Packer Package Manager](./assets/SS-02.png)

#### General notes

The current configurations are mixed common keys between my old configurations with coc and my current one with lua.

- There are new configurations that I haven't implemented yet in the following table.
- For key mapping you can check any key mapping that affect your cursor movements among the opened buffers, simple use

`:map <key>`

- To check the registers we usually use `:reg`.

#### DAILY COMMANDS

| T   | Command                  | Descriptions                                                                                                                          | Reference  |
| --- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| 1   | HOME                     | Got to Stratify home page                                                                                                             |            |
| 2   | bd                       | close a buffer                                                                                                                        |
| 3   | leader + cc/cu           | Comment and uncomment                                                                                                                 | deprecated |
| 4   | Tab                      | navigate among buffers                                                                                                                |            |
| 5   | g + d                    | Go to definition                                                                                                                      |            |
| 6   | Ctrl + o                 | back from definition                                                                                                                  |            |
| 7   | F1                       | show function helper                                                                                                                  |            |
| 8   | Leader + ff              | fuzzy search for a given word                                                                                                         |
| 1   | HOME                     | Go to Stratify home                                                                                                                   |            |
| 2   | bd                       | close a buffer                                                                                                                        |            |
| 3   | Leader + cc /cu          | Commend and uncommon                                                                                                                  |            |
| 4   | Tab                      | Navigate between buffers                                                                                                              |            |
| 5   | g + d                    | Go to definition                                                                                                                      |            |
| 6   | CTRL + o                 | back from definition                                                                                                                  |            |
| 7   | Fn + F1                  | Go to description of the given function (python tested)                                                                               |            |
| 8   | Leader + ff              | Fuzzy search for a given word in your given directory                                                                                 |            |
| 9   | FZF / FILES              | Command to search for a file                                                                                                          |            |
| 10  | Leader + r               | Ranger                                                                                                                                |            |
| 11  | Leader + t               | floating Terminal                                                                                                                     |            |
| 12  | :CocList marketplace     | Search for a a plug for coc, use CTRL + o to go to Normal mode then use Space to multi-selection then tab to finish and use (install) |            |
| 13  | :CocCommand python.+TAB  | you can find setup for formatter, linter , ..etc                                                                                      |            |
| 14  | :CocConfig               | To see the configuration of COC                                                                                                       |            |
| 16  | :Rg                      | Regular expression searching for a word in terminal                                                                                   |            |
| 17  | :%s/\<Plug\>/Plugin/gc   | Regular Expression searching specific word exclusively and as for change one by one                                                   |            |
| 18  | Using coc-telescope      | you have (leader + ff , leader + fg)                                                                                                  |            |
| 19  | using MYReg              | For regular expression search                                                                                                         |            |
| 20  | :leader + m              | for markdown viewer (using glow)                                                                                                      |
| 21  | :leader + s              | Save and source your init.vim file                                                                                                    |            |
| 22  | :leader + ,              | To open the configuration file (init.vim)                                                                                             |            |
| 23  | :leader + e              | Open coc-explorer better than nerdTree                                                                                                |            |
| 24  | :leader + u              | UndoTree                                                                                                                              |            |
| 25  | using F5                 | Open ipython and run the script you have                                                                                              |            |
| 26  | :index                   | To see all key maps                                                                                                                   |            |
| 27  | F1                       | See hover of definition with coc                                                                                                      |            |
| 28  | d0 or d^                 | Delete to beginning of line from the cursor position                                                                                  |            |
| 29  | dgg and dG               | delete to beginning of page and end of page from the position of your cursor.                                                         |            |
| 30  | leader + c +r then i + w | i + w means inside word, this will allow to replace a word that copied in the register with a given word (you need a plugin)          |            |
| 31  | v + i + w then p         | Achieve the same thing but not repeated like the one above                                                                            |            |
| 32  | c + s + " + '            | this will work as change the surrender (you need a plugin)                                                                            |            |
| 33  | :Markdown_preview        | Toggle markdown using browser (not like glow)                                                                                         |
| 34  | double ""                | in normal mode (double ") will give us the terminal of the register                                                                   |
| 35  | :SymbolOutlines          | Open the symboloutline menu for fast coding movements                                                                                 |
| 36  | :Trouble                 | Code diagnostic with nice layouts                                                                                                     |
| 37  | :Ctrl-\                  | open quick terminal written in lua super fast.                                                                                        |
| 38  | ~                        | changing the letter (Capital to small letter)                                                                                         |
| 39  | gr                       | replace with register yanking then paste (repeatable)                                                                                 |
| 40  | gy                       | re-mapping to lsp-config for show references                                                                                          |
| 41  | grr                      | form lspsaga replace the work with a given sentence.                                                                                  |            |
| 42  | leader t+m               | Activite the table mode                                                                                                               |            |
| 43  | leader b+n               | Open terminal horizontally                                                                                                            |            |
| 44  | leader g d               | go to definition in nvim-lsp built-in, while (g d) will be using lspSaga                                                              |            |
| 45  | g  h                     | hover with lspsaga, while F1 hover using nvim-lsp built-in.                                                                           |            |

---

### Requirements

- [x] Support native lua-lsp with nvim 6.0+
  - IntelIncense (very very ), several plugins I have implemented ()
  - Diagnostic for errors, hover on error, show implementation, jump to definition, code action suggestions (Lspsaga and lsp-)
- [x] All language servers that I need on daily basis, (lua, python, R , javaScript, shell, rust and C++)
- [x] Support for data-science paradigms and tools including the Jupyter-notebook, debugger with Jupyter-notebook ..etc.
- [x] Fully customizable with each piece of code I know its purpose and the its effect.

### To do

- [x] Adding dap for python, lua, js and R.
- [x] Optimize the performance of the launched packages with events, cmd and lazy-loading.
- [x] Adding org mode, to-do list and some other interesting plugins.
- [x] Getting more lua coding for optimization nvim on first installation,
      (such as changing the packer-compiled directory with packer.init(), up to
      now, the nvim will not automated to recompiled on attach, need manually to
      compile)
- [ ] Adding auto commenting lines, and multi-cursors support
- [ ] Save session with nvim.
- [ ] Debugging support.

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

- Nvim 6.0+ currently I have a problem with 6.0, so shifted to use 6.0+,
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

## Programming language servers

![Language server loaded](./assets/current_loaded_programming_langauge_servers.png)

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
  Usually, I change (.git) to (.git.when_ready_to_upload) or what
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
- Applying a stress test for the lanucning time for nvim 0.6 with the new configurations `Thus. Jan. 6th 2022`.
```bash
# Applying
╰ for ((i = 1; i < 10; i++)); do echo "\ue741 \uf432  Trial no. ${i}\n"; vim-startuptime --vimpath=nvim | head -n 4 | grep "Total Average"; done                                                                                                                                                                     祥:7.193s  [   Jan 06, 2022-   1:56:20 PM]
# Results

   Trial no. 1
Total Average: 490.632000 msec
   Trial no. 2
Total Average: 493.893900 msec
   Trial no. 3
Total Average: 497.408600 msec
   Trial no. 4
Total Average: 525.027600 msec
   Trial no. 5
Total Average: 538.629000 msec
   Trial no. 6
Total Average: 583.140500 msec
   Trial no. 7
Total Average: 554.687200 msec
   Trial no. 8
Total Average: 522.458400 msec
   Trial no. 9
Total Average: 506.968300 msec

```

## Some useful API functions

```sh
-- Getting to know the cursor location
local current_line = vim.fn.line(".")
local total_line = vim.fn.line("$")
-- Getting to know the directory , file name, and extension
local filename = vim.fn.expand "%:t"
local extension = vim.fn.expand "%:e"
local extension = vim.fn.expand "%:f"
local extension = vim.fn.expand "%:F"
```

## Table mode in nvim

Using a plugin `vim-table-mode` to create a nice table, need to remember the following

- <leader> tm => is the trigger to the table in markdonw format (\*.md)

#### How it works

1. Enter the first line, delimiting columns by the | symbol. The plugin reacts by inserting spaces between the text and the separator if you omit them:

| name | address | phone |

2. In the second line (without leaving Insert mode), enter | twice. The plugin will write a properly formatted horizontal line:

| name | address | phone |
|------+---------+-------|

3. When you enter the subsequent lines, the plugin will automatically adjust the formatting to match the text you’re entering every time you press |:

| name                        | address             | phone                                          |
| --------------------------- | ------------------- | ---------------------------------------------- |
| Formulate the address first | For on the idea for | Create the right table in material_design_dark |
| This could                  | How about the       | Working on the second objectives               |

## References

- [Reference Num -1-](https://github.com/abzcoding/nvim/blob/main/lua/config/cmp.lua)
  - Got the tab complelation for the cmp pluging
  - Got the neovide configuration if the neovide buffer is launched, instead of sourcing, can be found in (options)
- [Reference Num -2-](https://github.com/alpha2phi/dotfiles/blob/main/config/nvim/lua/plugins.lua)
  I got the set of tpope plugins for developments, with debugging and dap for python and other language-server.

```sh
-- Debugging
    use { "puremourning/vimspector", event = "BufWinEnter" }

    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "mfussenegger/nvim-dap-python" }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui" }
    use { "Pocco81/DAPInstall.nvim" }
    use { "jbyuki/one-small-step-for-vimkind" }
```
