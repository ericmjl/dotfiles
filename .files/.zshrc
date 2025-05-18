# Ensure starship is available
eval "$(starship init zsh)"

# Ensure atuin is available
. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# Ensure Pixi is available
export PATH="/Users/ericmjl/.pixi/bin:$PATH"

# Ensure uv is available
. "$HOME/.local/bin/env"

# uv configuration
export UV_PYTHON_PREFERENCE="only-managed"

# Ensure direnv is available
eval "$(direnv hook zsh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Source other utilities
source $HOME/.path.sh       # PATH environment variable
source $HOME/.shortcuts.sh  # shortcuts to directories

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Enable git aliases
. $HOME/github/dotfiles/.shell_aliases/git.sh
. $HOME/github/dotfiles/.shell_aliases/cli.sh
. $HOME/github/dotfiles/.shell_aliases/other.sh
. $HOME/github/dotfiles/.shell_aliases/tmux.sh


precmd() { eval "$PROMPT_COMMAND" }

# starship init: https://starship.rs/guide/#🚀-installation
eval "$(starship init zsh)"

export PATH=$PATH:/Users/ericmjl/.pixi/bin
