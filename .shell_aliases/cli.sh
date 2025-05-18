# Command line tool shell aliases

alias ..='cd ..'
which eza
if [[ $? == 0 ]]; then
    alias ls='eza --long --git -a --header --group'
    alias tree='eza --tree --level=2 --long -a --header --git'
fi
alias l='ls'
alias reshell="source $HOME/.zshrc"
alias shelledit="nano $HOME/.zshrc"
alias pico="nano"
alias nano="nano --softwrap"
alias cat="bat"
alias diff="diff-so-fancy"
alias find="fd"
