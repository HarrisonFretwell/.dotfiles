if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH /opt/homebrew/bin $PATH
set PATH /.profile $PATH
set PATH ~/.cargo/bin $PATH
set CC /usr/bin/clang
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

pyenv init - | source
starship init fish | source

