if status is-interactive
    # Commands to run in interactive sessions can go here
	eval (/opt/homebrew/bin/brew shellenv)

	function fish_user_key_bindings
 		 bind \cr 'peco_select_history (commandline -b)'
 		 bind \c] peco_select_ghq_repository
	end

end


set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "$HOME/.deno/bin" $PATH
set -gx PATH "$HOME/opt/homebrew/Cellar/go/1.19.1/libexec/bin"
set -gx PATH "$HOME/tools/lua-language-server/bin/macOS:$PATH"
set -gx MOCWORD_DATA "$HOME/path/to/mocword.sqlite"

set -U FZF_LEGACY_KEYBINDINGS 0

source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

alias lazygit='lazygit -ucd ~/.config/lazygit'
alias e='exa'
alias el='exa -a -l'
alias ea='exa -a'

alias lado='lazydocker'
