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
