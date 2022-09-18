#  Neovim Configurations File (build v.01)

## What is new?

As `nvim` is now updated to version `0.7` with a stable release. The plugin
`nvim-telescope` has no backward compatibility and require only `nvim 0.7+`.
Therefore, it is time to upgrade the configuration file of `init.lua`. The
native `nvim` module of `nvim-lsp` has become `nvim-diagonstics`, the built-in
APIs are now different, which many other third-party-plugins haven't been
supported yet. In this repository, I have migrated to the new `Nvim 0.6`, after
fixing the `lsp-saga`, this including the `lsp-signture` which are both
now working synchronously with the `lsp-connfig`. Features in this migration
are, to name few:

- Now all packages are supported with the `NVIM v.07+`.
- Some compatibility issues are now fixed with the `lsp-configs`, especially
  passing the `custom_attach`, `handler`, and `compatibility` to the
  `nvim-lsp-installer` setup API.
- [Manually] Adding a backup script to the `.local/share/nvim`, which will
  allow us to experiment with new plugins or try new features without affecting
  the main branch of our daily driver (just to retrieve any version to my
  current `nvim IDE`.)
- Adding branches to the `~/.config/nvim/`, for each version, also a branch
  called `feature/dev` to check and try any new feature or package.

### Nvim updates in nutshell
You will always need to configure
1. Packer for new library/package
2. `LSInstall` to get the language sever setup and configurations.
3. `tree-sitter` for getting the syntax highlighting with much better way.

### About Branch and GitHub
Once you have updated the `main` branch (change, modify, create ... etc.)
The current working flow to address such updates with my `main` repository is:

1. On the main branch, `git add --> git commit --> git push `, you will get your
   `main` branch in the `remote` repository at `GitHub` to the latest comments.

2. Switch to the release branch currently I am using the `nvim0.7` branch, using
   `git checkout nvim0.7`,

```shell
  - git merge main
  - git add -a
  - git commit -m "some message"
  - git push
```

3. On GitHub main repository. You will see that your pull request to merge with the
   main doesn't appear, the reason is that your `main branch` becomes an
   identical copy to our `nvim0.6 branch`.

## Update history
I have upgraded my `nvim` to version `7.0` which is the latest to 20,

```shell
window.documention => cmp.config.window.bordered()

```

## Contents
The following configurations are based on `lua` with `nvim` as my daily-working
environment. Nowadays, the main `nvim` developers team have recommended using
`lua scripting language` for the configurations file, namely the `init.lua`
instead of `init.vim` with vim scripting.

![Current versions view](./assets/SS-03.png)
![Packer Package Manager](./assets/SS-02.png)

## Debugging Support
I have added the most requested feature of `nvim0.6` with debugging support, right now I have finished:
- [x] python debugger with `nvim-dap`, as shown below
![python debugger with `nvim-dap`](./assets/SS-04.png)

## Features to be developed
This section will be dedicated to show new feature for my new `nvim` IDE.
### Implement OpenAI
- This is to be investigated later, as I need to pay for `openAi` for the amount
of all `token` with `DaVinci` model. Simply use the `nvim.magic` to get the
backend of the integration with `openAi`.
  - Maybe you can use `GPT-3’s free alternative`

### Implement GitHub Copilot
The `Github Copilot` is built on top of `openAi` `DaVinci` model, I am already
in the technical preview, and my `Github` account is already connected with the
`copilot`. Steps that I followed are mainly from the repository of `GitHub
copilot`. I remapped the `TAB` to `leader TAB` to not affect any other
plugins' workflow.

### Implementation of Remote Server IDE

Check
- [Explanation](https://www.youtube.com/watch?v=wVAsbpByQ3o&ab_channel=senkwich)
- [distance](https://github.com/chipsenkbeil/distant)
- [distance.nvim](https://github.com/chipsenkbeil/distant.nvim)


#### General notes

The current configurations are a mix of common keys from my old configurations
with `COC and COC-LSP` and my current one with `nvim-lsp`.

- For key-mapping you can check any key that affects your cursor movements
  among the opened buffers, simple use `:map <key>`, or `verbose map` to see
  all the key-mappings.
- To check the registers, I usually use `:reg`.
- There are a few setting explanations that I haven't included yet in the
  following table.

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
| 13  | :CocCommand python.+TAB  | you can find setup for formatter, `linter`, ..etc                                                                                      |            |
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
| 25  | using F5                 | Open `ipython` and run the script you have                                                                                            |            |
| 26  | :index                   | To see all key maps                                                                                                                   |            |
| 27  | F1                       | See hover of definition with coc                                                                                                      |            |
| 28  | d0 or d^                 | Delete to beginning of line from the cursor position                                                                                  |            |
| 29  | dgg and dG               | delete to beginning of page and end of page from the position of your cursor.                                                         |            |
| 30  | leader + c +r then i + w | i + w means inside word, this will allow to replace a word that copied in the register with a given word (you need a plugin)          |            |
| 31  | v + i + w then p         | Achieve the same thing but not repeated like the one above                                                                            |            |
| 32  | c + s + " + '            | this will work as change the surrender (you need a plugin)                                                                            |            |
| 33  | :Markdown_preview        | Toggle markdown using browser (not like glow)                                                                                         |
| 34  | double ""                | in normal mode (double ") will give us the terminal of the register                                                                   |
| 35  | :SymbolOutlines          | Open the symbol-outline menu for fast coding movements                                                                                |
| 36  | :Trouble                 | Code diagnostic with nice layouts                                                                                                     |
| 37  | :Ctrl-\                  | open quick terminal written in lua super fast.                                                                                        |
| 38  | ~                        | changing the letter (Capital to small letter)                                                                                         |
| 39  | gr                       | replace with register yanking then paste (repeatable)                                                                                 |
| 40  | gy                       | re-mapping to lsp-config for show references                                                                                          |
| 41  | grr                      | form lspsaga replace the work with a given sentence.                                                                                  |            |
| 42  | leader t+m               | `Activite` the table mode                                                                                                             |            |
| 43  | leader b+n               | Open terminal horizontally                                                                                                            |            |
| 44  | leader g d               | go to definition in nvim-lsp built-in, while (g d) will be using lspSaga                                                              |            |
| 45  | g  h                     | hover with `lspsaga`, while F1 hover using `nvim-lsp` built-in.                                                                                    |
| 46  | Neoformat -formatter     | Using the formatter with the nvim depending on the language server, (e.g., Lua: luastyla)                                                          |
| 47  | shift+f                  | first highlight to get (:\`\<,\`\>)norm (**A** for end of lines, **I** for beginning of lines) adding the text you want               | https://www.youtube.com/watch?v=gccGjwTZA7k
---

### Requirements
The requirements that I am looking for in my IDE are: **note**, check sign means already implemented.

- [x] Supporting a native `lua-lsp` with `nvim 6.0+`.
  - `Intellisense` support (very important feature).
  - `Diagnostic` for
    - errors,
    - hover on error,
    - show implementation,
    - jump to definition,
    - code action suggestions (such as `Lspsaga` and `lsp-signture`).
- [x] All language servers `LPS` that I need on daily basis, (`lua`, `python`, `R` , `javascript`, `shell`, `rust`, `C++` and `Julia`)
- [x] Support for data-science paradigms and tools, including the `Jupyter-notebook`, `debugger` with `Jupyter-notebook` ... etc.
- [x] Fully customizable with each piece of code I know its purpose and its effect.

### To do

- [x] Adding `dap` for `python`, `lua`, `js` and `R`.
- [x] Optimize the performance of the launched packages with events, `cmd`, `impatient` plugin and `lazy-loading`.
- [x] Adding `org mode`, `to-do` list and some other interesting plugins.
- [x] Automate `lua` coding with optimized `nvim` scripts for on-first installation and on-first launching,
      (such as changing the packer-compiled directory with packer.`init()`, up to
      now, the `nvim` will not be automated to recompiled on attach, need manually to
      compile).

- [x] Adding `auto commenting` Lines.
- [ ] Adding `multi-cursors` support
- [ ] Save session with `nvim`.
- [x] Debugging support for each programming language in our LSP list.

### Setup Lua, that already I transfer from previous vim with coc-setting.

Things to be included in my current developed branch.

- [x] Syntax highlighting
- [x] Snippets
- [x] Tree-sitter
- [x] Jump to definition
- [x] Show definition on hover
- [x] Show Implementations.
- [x] Show reference
- [x] Theme
  - Status-line with `lua` support (in favor of `airline` it is a bit slower)
  - Global theme (already automated)
  - Customizing the icons
- [x] Floating terminal
- [x] Show ranger
- [x] Check spelling
- [x] Show directory and location within the given scope
- [x] Show down terminal (terminal not float, stay opened)
- [x] Update on change with other editor (Running a script on fly)
- [x] Dashboard and Dashboard Customization.
- [x] `Tab` configurations.
- [x] Moving block of code on request.
- [x] Navigate using `ctrl + j` and `k` for `omini-windows`.
- [x] Installing `CCC-Server`, but not conflict with our `nvim-lspconfig`
  language-servers, (this feature is not required anymore with
  `lsp-config.lua`).

#### Things to be considered

You will need the following necessary packages

- `nvim-lspconfig` for `language-server`.
- `nvim-lsp` language installer (adding install a specific language)
- `Lua language server` for `luajit` installed up-and-running.
- `Lua configuration` with formatting.
- `lspsaga`, `lspinstall` and `lsp-signture`.

#### Setup packer

For more information on `Packer package manager` see:
- [packer](https://github.com/wbthomason/packer.nvim).
- `Packer` now support `on-save` `sync and loading` modules.


## Building Nvim from Scratch requires:

- Install `Lua LSP-language server` from scratch (without `nvim-lsp-install`)
- Configure Lua `LSP-Language server`
- Auto completions with `CMP` plugin.
- Lua formatter
- Programming language servers

![Language server loaded](./assets/current_loaded_programming_langauge_servers.png)

There are several `formatters` available, that we can add to format our `lua` code such as `luaformatter`, `stylua` ... etc.
To install `stylua` ensure you have already `Cargo` and `Rust` language installed on your machine.

```sh
cargo install stylua
luarocks install --server=https://luarocks.org/dev luaformatter
```

# Useful information
## Execute lua in cmd
For example, to get the operation system name we can run
```shell
:lua print(vim.ovim.loop.os_uname().sysname) <- this will return Darwin.
:lua print(jit.os)                           <- this will return OSX
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
#  This will get us the full path
local file = vim.fn.expand("%:p")
```
## Testing the speed of neovim launching time.

Use the command `vim-startuptime` which will offer a quick calculation of the launching time.

- For my private `MacBook`, I used the custom binary (pre-built) with `vim-startuptime_darwin_amd64.zip`
- [vim-startuptime website](https://github.com/rhysd/vim-startuptime)
- Right now, I used individual location for my `nvim`, that I installed it manually at `$HOME/dev/bin/nvim`
- [Neovim build from the source](https://github.com/neovim/neovim/wiki/Building-Neovim)
- `Plugins directory` will be at same directory of our `nvim`, I have tried to change this directory, but it causes many problems. When you do a fresh installation, ensure you have removed these old directories:
  - ~/.config/plugin
  - ~/.local/share/nvim

## Creating file or directory in vim without plugin

### Formula

1. In the command prompt of `Nvim`, you can use the following configurations.

```shell
! cd /directory/direcotyr_2/direcotry_3
! mkdir <name>
! touch <name>.extention
```

2. Accessing the prompt to open browser

```shell
!open -a "Safari" <link, e.g www.google.com>
```

## Changing the nvim-clap theme color

- Requirements for `nvim-clap`, [no longer are needed since I am using `tree-sitter` anyway]

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
For spell checking, I am using the 'kamykn/spelunker.vim', and mapped the (ZL
and Zl) for checking the spelling. This is less attractive compared to the
`nvim spell checking` from `COC`.

## Fuzzy Finding

One of the coolest feature that has been implemented is the `fuzzy finder` in
`lua`. For all the features that comes with the `Fuzzy Finder`, it allows
also to get the `path` (directory in string form similar to the `VSCode` plugin).

- The mapping is located at `lua/scripts/myCommandWrapper.lua`, which will be
  triggered in the `insert mode` with (`CTR-X`, then `CTRL-F`). It will automatically
  complete the path while coding, while you are searching for any specific
  word. This feature is still existed, but now we have `cmp-path` plugin which
  is much better for this particular task.

- [Idea got it from](https://vi.stackexchange.com/questions/34392/path-completion-with-fzf-from-absolute-path)
  you will need the following plugins:

```shell
  use{'junegunn/fzf', run = "fzf#install()"}
  use{'junegunn/fzf.vim'}
```

- [`FZY` finder repository](https://github.com/junegunn/fzf.vim)

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

You can use `Bdelete`. I have mapped this to `<leader>w`, this will allow to close
the given window without closing all the other buffers.

## Highlight words in vim with (f/t/F/T)

- [vim-eft plugin](https://github.com/hrsh7th/vim-eft)

## Performance and optimization

I have used two types of performance evaluators to check the startup speed by
measuring each individual plugin launching time in milliseconds. First the
`vim-startuptim ` which is assigned with a flag `--vimpath=nvim`. Second, the
`packer profile` with `:PackerProfile
profile=true`. Recently, I have also included a tool that comes with
`impatient` plugin to cache plugins it called `LuaCacheProfile`. The results
are shown below

```shell
  Config for sidebar.nvim took 78.00594ms
  Sequenced loading took 11.807982ms
  packadd for vim-matchup took 1.459474ms
  packadd for nvim-lspinstall took 1.211138ms
  Config for bufferline.nvim took 1.012205ms
```
- Applying a stress test for the launching time for `nvim 0.6` with the new configurations `Thus. Jan. 6th 2022`.
```bash
# Applying
╰ for ((i = 1; i < 10; i++)); do echo "\ue741 \uf432  Trial no. ${i}\n"; vim-startuptime --vimpath=nvim | head -n 4 | grep "Total Average"; done
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


## Table mode in nvim

Using a plugin `vim-table-mode` to create a nice table, need to remember the following

- <leader> tm => is the trigger to the table in markdown format (\*.md)

#### How it works

1. Enter the first line, delimiting columns by the | symbol. The plugin reacts by inserting spaces between the text and the separator if you omit them:

```shell
| name | address | phone |
```

2. In the second line (without leaving Insert mode), enter | twice. The plugin will write a properly formatted horizontal line:

```shell
| name | address | phone |
|------+---------+-------|
```

3. When you enter the subsequent lines, the plugin will automatically adjust the formatting to match the text you’re entering every time you press |:

| name                        | address             | phone                                          |
| --------------------------- | ------------------- | ---------------------------------------------- |
| Formulate the address first | For on the idea for | Create the right table in material_design_dark |
| This could                  | How about the       | Working on the second objectives               |

# Special Language Servers Configurations.

## Julia LSP

Installing the `Julia-lsp` needs, read from the references `Julia Language Reference`.

- [Julia Language Server](https://github.com/julia-vscode/julia-vscode)

`LanguageServer.jl` can be installed with `julia` and `Pkg`:

```shell
julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
```
where `~/.julia/environments/nvim-lspconfig` is the location where the default
configuration expects `LanguageServer.jl` to be installed. To update an
existing install, use the following command:

```shell
julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.update()'
```
- **Note**:
In order to have `LanguageServer.jl` pick up installed packages or dependencies
in a Julia project, you must make sure that the project is instantiated:

```shell
julia --project=/path/to/my/project -e 'using Pkg; Pkg.instantiate()'
```
- **Note**
To install the `intractive REPL` of Julia with `jupyter` you can use, inside
the `julia` REPL use `]` to access the `Pkg` the package manager of `nvim`.

## Adding auto-formatter for shell-scripts or bash
For using `NeoVim`, if the language server is `shell-lsp` for `bash` or `shell`, you can add the autoformatter similar to `lua` as following.
1. Instal Go to your system
2. Install using Go the auto-shell-formatter, `Neoformat` must see it that it is being installed to your default shell (`zsh`)
```shell
go install mvdan.cc/sh/v3/cmd/shfmt@latest
```
3. you can source the `shfmt` to your terminal so that the `neoformat` can see it, as `export PATH=$PATH:$HOME/go/bin/`. You can also run it externally using


```shell
shfmt -l -w script.sh
```

## How to capitalize and deCapitalize in NeoVim

```shell
Using the keybinding
g + u : for first letter capitalize (change upper to lower, you need to do that on the letter you want to change then escape then l or h only once)
g + U : for capitalize all the letters (change upper to upper, you need to do that on the letter you want to change then escape then l or h only once)
g + ~ : to switch between the capitlal to small letter and viceversa (you will need shift to get the telda)

bonus
g + U 3 w will do for 3 words a head and captilze each word.
```
- [10 Advanced Vim Features You probably didn't know](https://www.youtube.com/watch?v=gccGjwTZA7k)

# Tips and tricks in NVIM
The following tips and tricks are for heavy `nvim` usages
### Auto-complete
editing `auto comoplete` can you use `Ctrl + p` or `Ctrl + n`

### Buffers
You can use the following commands `:bnext`, `:bprevious` `buffers`, `bd` and `:enew` which
allow us to work with buffers more accurately.

### Recordings
Recording is just using the `Macros` in `Nvim`, this need to study more about
this feature and to be added here later.
- Press `q + a`.
- Do the sub-task.
- Close macro `q`
- Apply the macro using `@a` or `@a 12` will be repeated 12 times.

### Norm command
`normal` or `norm` can be used with a lot of features.
#### Adding to end or beginning of lines
NOTE: (Read entry 47 in the table commands above for our daily shortcuts)
The following trick allow us to write to the end of lines or beginning of lines
Simply you can use the following.
1. Highlight all the lines using *shift + v* then use *:* to get: :`<,`>.
2. Adding `normal` or `norm` to the formula.
3. Adding to end you can use *A* to the beginning add *I*.
4. Add your text to the end.

```shell
:`<,`>norm A whatever you will add to end of all lines.
:`<,`>norm I whatever you will add to beginning of all lines.
:`<,`>norm $X this  will delete last character at the end.
:`<,`>norm ^X this  will delete first character at the end.
```
## Executing CLI commands (from LINUX)
We can use the following `:!command` that will be show the command with input and output

```shell
# This command will be used to sort alot of lines uniquly
:`<,`>! sort # for sorting
:`<,`>! wc -l  # for count number of lines
```

## Form multi-lines into one-line single line in vim
You can first select using `shift+v` for horizontal selection, to select all the lines you have
Then
```shell
:'<,'>j
```
or you can use
`g + shift +j` g command means only hits `g` letter to trigger the vim function for this purpose
## Do the opposite, form one-line to multi-lines
For sure we can do the opposite using, you can select the maximum number of your given string in oneline
```shell
:set textwidth=10
then use
g then q
dont forget to reset after you finish
:set textwidth=0
```
- [Vim Tutorial - Join and Split Lines](https://www.youtube.com/watch?v=MA9WFO_WUOM)

## What the meaning of visual-mode
`v`          :is selecting visually a segment of a a given line.
`shift v`    :is selecting visually multi-lines horizontally
`ctrl v`     :si selecting visually multi-lines vertically.

## Open Website from nvim, or go to file
the command `g` stand for `G-command` one of the features that I like is `gx`
will open the link while the cursor on it in the browser. Open files / URLs with gf / gx

## Encrypting files with :X
[this feature available only for `Vim`, and it is not available for `nvim`, We
can add encryption to our file and only can be opened using the password we
have offer
1. to Encrypt
```shell
:X
```
It will allow to encrypt your file after you input and confirm your password for this file.

2. To decryPt
do same without passwords by hitting enter + enter

## Spell Checking
you can use `z=` once your cursor is on top of the wrong-spelling word, which
will give you a list of all the possible options to fix the wrong spelling.
To add a word to the custom dictionary use `zg` over the new word (e.g., treeSitter)
it will be added to `~/.config/nvim/spell/en.utf-8.add`.

## Arithmetic Expression
### Increment and decrements
You can basically do arithmetic in `nvim` such as
- increment and decrements an integer value using `ctrl + a` or `ctrl +x` over the number (e.g., 144)
Using it with number increment list with `macro`
1. Record a macro using `q+a`
2. make a line with a number then copy it for next line
3. increment the number of the list using `ctrl+a`
4. finish recording the macro with `q`
5. repeat the macro using `@a` or `@a 3` to repeat it three times

### Execution commands
- Put the cursor over the following expression in a new line:
echo $((100 + 54))
- You can execute a command in your `nvim buffer` using `:.!zsh` to redraw your command line and get you the results inside the buffer.
- You can execute a command in your `nvim command palette` with `:!!zsh`

### Combine Commands


1. Hello world
2. Hello world
3. Hello world
4. Hello world
5. Hello world
6. Hello world
7. Hello world

- Assume we have the text above. highlight all these lines
- use :`<,`>s/\..\+//cig
- It will get you all the numbers
1
2
3
4
5
6
7
- Highlight again and use `<,`>norm A + to add (+) to the end of each line
1 +
2 +
3 +
4 +
5 +
6 +
7 +

- Highlight again and use `<,`>join (or simply j) to join them all together.
1 + 2 + 3 + 4 + 5 + 6 + 7 +
- Finally get the value of this expression using `:.!zsh` as:
echo $((1 + 2 + 3 + 4 + 5 + 6 + 7))

- Now we can get the final value as
28

## How to increment a list (most elegant way)
We can use the following steps:
- Create a list with zeros as shown using `ctrl+v` then `shit + i` then `0` and enter.
```shell
- [0] list number 1
- [0] list number 1
- [0] list number 1
- [0] list number 1
```
- Now you highlight `visual block` using `<C-v>` also knows as `ctrl+v` again the list at `0` and perform `g<C-a>`
```shell
- [1] list number 1
- [2] list number 2
- [3] list number 3
- [4] list number 4

```

- [Quick vim tips to generate and increment numbers](https://irian.to/blogs/quick-vim-tips-to-generate-and-increment-numbers/)

### More example
1. Try to put some text with increment
```shell
:for i in range(1,10) | put ='192.168.0.'.i | endfor
```
2. Try to create counter with 00 prefixes
```shell
:put =map(range(1,150), 'printf(''%04d'', v:val)')
```
- [More tips and tricks about increments](https://vim.fandom.com/wiki/Making_a_list_of_numbers)

## How to capitalize first letter in many lines
- [my comment can be found here](https://stackoverflow.com/questions/3126500/how-do-i-capitalize-the-first-letter-of-a-word-in-vim/72860055#728600550)

- [10 Advanced Vim Features You probably didn't know](https://www.youtube.com/watch?v=gccGjwTZA7k)
- [dotfile](https://github.com/sdaschner/dotfiles/blob/master/.vimrc)

## How to select or append from position to end of multi-lines

1. Click somewhere (anywhere) in the first line you wish to append text to.
2. Press Control + V.
3. Press Down to create an arbitrary vertical block selection that spans the desired lines.
4. Press $ to expand the visual block selection to the ends of every line selected.
5. Press Shift + A to append text to every selected line.
6. Type the text you want to append.
7. Press Escape and the text will be appended across the selected lines.
- [Vim Select the ends of multiple lines block mode ](https://stackoverflow.com/questions/10772598/vim-select-the-ends-of-multiple-lines-block-mode-but-where-the-ending-column-v)
# Language Server
## Adding Latex language server
I have chosen the `latex:textlab` as my language sever for the latex to get all
the features required to write in `latex`. Following the Steps

1. Install the language server using
I have chosen the `textlab` as it is developed with `Rust`,and it is superFast.

```shell
LSInstall latex
# choice textab

```
2. Compile your `file.text` into a `PDF` you need to use the following command

```shell
latex -pdf file.text  <- This will complie your entire .text file at once.
latex -pvc file.text  <- This will allow the  document to be complied while you write your code and once you save it will complied automatically
# To exit the automatical compliation use Ctrl+Z
```
3. Automatically compile the Latex file to PDF
Following the `nvim` plugin `knap` which can automatically compile the text file
to PDF. The file should compile and display using one of the `pdf` reader that
the author specified in his repository. The one I am using is the `Sioyek`
which is faster and dynamically update the PDF while typing.

- [knap plugin](https://github.com/frabjous/knap#mupdf)
- [Sioyek pdf](https://sioyek.info), You need a cheat-sheet for `Sioyek`


# Troubleshooting, Bugs and Errors
after running `nvim` it is a good pratice to use `:messages` or `:notifications` for debugging messages.
1. Nvim 0.7
- For`README.md` there was an issue can be solved using `:TSupdate`, follow here
  - [Fixing the issue of markup server error](https://github.com/nvim-treesitter/nvim-treesitter/issues/634)
- Clang has an issue due to not adding the capabilities option for the `utf-8`
  - [nvim language server - clang ](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd)

```shell
# First I added this one but it was not working
-- capabilities.offsetEncoding = {'utf-8', 'utf-16'}
# Then remvoed the lua-table (a.k.a. dictionary)
capabilities.offsetEncoding = 'utf-8'

```
- `Markdown-preview` doesn't do anything.
This thread has allowed me to fix this problem as I needed to update the plugin dependencies using `:call mkdp#util#install()`
- [markdown-preview bugs and fixes](https://github.com/iamcco/markdown-preview.nvim/issues/188)

2. Nvim 0.7.2
I have encountered with the following problems
- `Language server error message` I have fixed by adding a function in the bottom on lsp-config.lua file
```lua
-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
end
```
- `tabnine` was not updated because simply you can remove it first and re-install this plugin or you can go to
```lua
-- Solution number -1-
return require("packer").startup(
 function(use)
 	use "hrsh7th/nvim-cmp" --completion
 	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
 end
)

-- Solution number -2-
-- go to
cd ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/
-- and run
./install.sh

```
- `tree-sitter` was broken for each language, simple I executed in nvim command line `:TSUpdate`


## References

- [CMP module](https://github.com/abzcoding/nvim/blob/main/lua/config/cmp.lua)
  - Got the tab completion for the `cmp` plugin.
  - Got the `neovide` configuration if the `neovide` buffer is launched, instead of sourcing, can be found in (options)
- [lua plugins configs](https://github.com/alpha2phi/dotfiles/blob/main/config/nvim/lua/plugins.lua)
  I got the set of tpope plugins for developments, with debugging and dap for python and other language-server.
- [Julia Language Reference](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#julials)
- [lsp language server configurations](https://github.com/itstheandre/config/blob/620fee79d77711001903d6d751c08c71c198c8b4/nvim/.config/nvim/lua/andre/lsp/language_servers.lua)
- [ASCII Arts I](https://asciiart.website/index.php?art=comics/batman)
- [ASCII Arts II](https://curlie.org/en/Arts/Visual_Arts/ASCII_Art/Collections)
- [ASCII Arts III](https://www.wikiwand.com/en/ASCII_art#/Non_fixed-width_ASCII)
- [Getting starting using lua with Neovim](https://giters.com/mrowegawd/nvim-lua-guide)
- How to program a status line in lua
- [How I Made My NEOVIM STATUSLINE IN LUA](https://elianiva.my.id/post/neovim-lua-statusline)
- [ChristianChirulli awesome repository-supporting lua config](https://github.com/ChristianChiarulli/nvim)
- [Packages status in neovim](https://neovimcraft.com)

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




