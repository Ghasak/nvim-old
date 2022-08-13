
CMD = vim.cmd

-- This is a wrapping for many commands to allow more flexibilities.

vim.cmd[[
      command! HOME Startify
     "command! MYFZF FloatermNew fzf
      command! MYFZF fzf
      " There is also Regular Expression command :Rg
      " Also from Telescope: <Leader> f + g or <Leader> f + f
      command! MYRg FloatermNew --width=0.8 --height=0.8 rg
      " Using XPLR
      command! XPLR FloatermNew xplr
      " Using lazygit
      command! LAZYGIT FloatermNew lazygit

      command! IPY FloatermNew ipython
      command! IPY2 FloatermNew --wintype=normal --name=repl --position=right ipython
      command! IPY3 FloatermNew --width=0.5 --wintype=vsplit --name=repl --position=right ipython && FloatermSend %autoindent

      " This will go to the setting directly without a need to open a new buffer
      command! SETTING e $MYVIMRC

      " Make it easy to update/reload vimrc
      " source $MYVIMRC reloads the saved $MYVIMRC
      nmap <Leader>s :source $MYVIMRC<CR>
      " you can edit the init.vim aslo using
      " OR USE THE COMMAND (SETTNG)
      nmap <Leader>v :e $MYVIMRC<CR>

      " Autocompelete path with fzf
      inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

]]

