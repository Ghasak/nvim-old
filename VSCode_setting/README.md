# Integrate VSCode with Neovim

There are several steps are needed to accomplish this integration. Here is a quick summary on how to do so,

![VSCode with Nvim 0.6](./SS-01.png)

## Install VSCode Neovim plugin

Check the link Here

- [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)

## Custom nvim config for vscode Only

Here, we can make this happen by adding custom configuration's path to the
`VSCode setting` also, we need to provide a link to the `nvim` which is
installed on our machine. Currently, I am using `nvim 0.6` which works
flawlessly.

- Since I installed (nvim 6.0) in a new directory called `~/dev/bin/nvim`, I
  created a symlink to point to this (nvim) Using :: (note: if you update your
  `nvim` version this symlink will be broken, so you need to create a new
  symlink to the new nvim version similarly.)

```shell
ln -s ~/dev/bin/nvim  /usr/local/bin/nvim
```

you will add the following in the `VSCode Setting file`,

```shell
"vscode-neovim.neovimExecutablePaths.darwin": "/usr/local/bin/nvim",
# This one is not needed //"vscode-neovim.neovimExecutablePaths.darwin": " /Users/ghasak.ibrahim/dev/bin/nvim",
"vscode-neovim.neovimExecutablePaths.linux": "/usr/local/bin/nvim",
"vscode-neovim.neovimInitVimPaths.darwin": "$HOME/.config/nvim/VSCode_setting/init.vim"
```
