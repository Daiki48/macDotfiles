if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi


#以下を追加して保存して閉じる
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
PATH=$PATH:~/.local/bin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# alias設定##############
alias ...='cd ../..'
alias ll='ls -la'

# git補完################
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit -u

source /Users/nakashima/.config/broot/launcher/bash/br


