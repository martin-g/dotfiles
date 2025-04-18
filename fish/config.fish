#set fish_function_path $fish_function_path "/home/martin/.local/lib/python2.7/site-packages/powerline/bindings/fish"
#powerline-setup

#function fish_prompt
#    ~/bin/powerline-shell.py $status --shell bare 2>/dev/null
#end


thefuck --alias | source

starship init fish | source

zoxide init fish | source

fish_vi_key_bindings

#atuin init fish | source

if test -z $SSH_AGENT_PID
  eval (ssh-agent -c)
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK

  ssh-add ~/.ssh/arm64-ubuntu-key.pem
  ssh-add ~/.ssh/id_rsa.git
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/martin/miniforge3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

fish_add_path /home/martin/.pixi/bin
