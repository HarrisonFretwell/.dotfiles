# ALIASES
alias yw="yarn workspace"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias pip="pip3"
alias k="kubectl"
# PATHS
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"
export PATH="/opt/homebrew/opt/gnupg@2.2/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Some fix for ctrl-h type keybinds in nvim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\177/' > $TERM.ti
tic $TERM.ti
if has('nvim')
    nmap <BS> :<C-u>TmuxNavigateLeft<CR>
else
    nmap <C-h> <C-w>h
endif
eval "$(starship init zsh)"
