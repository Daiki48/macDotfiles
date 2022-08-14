if status is-interactive
    # Commands to run in interactive sessions can go here

	eval (/opt/homebrew/bin/brew -c)
  hs.ipc.cliInstall("/opt/homebrew")

	function fish_user_key_bindings
 		 bind \cr 'peco_select_history (commandline -b)'
 		 bind \c] peco_select_ghq_repository
	end

end


set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "$HOME/tools/lua-language-server/bin/macOS:$PATH"
set -gx MOCWORD_DATA "$HOME/path/to/mocword.sqlite"

alias lazygit='lazygit -ucd ~/.config/lazygit'

