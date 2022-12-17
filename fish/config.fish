if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH /opt/homebrew/bin $PATH
set PATH /.profile $PATH
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

starship init fish | source
