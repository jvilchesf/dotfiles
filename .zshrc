. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Go enviromental variable
export PATH=$(go env GOPATH)/bin:$PATH
eval "$(direnv hook zsh)"

# Nvim enviromental variable
export XDG_CONFIG_HOME="$HOME/.config"

# WezTerm enviromental variable
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none

# Active autosuggestion
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Alias / Shortcuts
alias ssh_lakehouse="sshpass -p '205LakeHouse!' ssh administrator@209.34.52.39"
alias ssh_marihuana="ssh -i ~/.ssh/ssh_keys/kubernetes-admin-user-key.pem administrator@10.57.4.20"
alias ssh_nexpose="sshpass -p 'nexpose1' ssh Nexpose@169.129.66.26" 
export PATH="/opt/homebrew/opt/hdf5@1.10/bin:$PATH"
