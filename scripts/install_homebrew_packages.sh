
BREW_PACKAGES=(
  "bash-completion"     # bash completion for git and other things https://github.com/scop/bash-completion
  "bat"			            # A replacement for cat:  https://github.com/sharkdp/bat
  "diff-so-fancy"       # A replacement for diff: https://github.com/so-fancy/diff-so-fancy
  "exa"                 # an enhanced, modern ls
  "exiftool"            # just in case
  "fd"			            # A replacement for find: https://github.com/sharkdp/fd
  "freetype"            # for worship-manager
  "gcc"                 # gnu compiler collection https://gcc.gnu.org/
  "git"                 # version control https://git-scm.com/
  "gnu-sed"             # get "standard" sed that is used on Linux.
  "heroku-cli"          # for heroku apps
  "heroku/brew/heroku"  # for heroku
  "imagemagick"         # for worship-manager
  "libmagic"            # for worship-manager
  "libreoffice"         # for worship-manager
  "micro"               # micro text editor
  "mobile-shell"        # mobile shell
  "nano"                # get an enhanced nano
  "ripgrep"             # A replacement for grep: https://github.com/BurntSushi/ripgrep
  "tmux"                # window management https://tmux.github.io/
  "tree"                # get the standard "tree" command on Linux.
  "wget"                # curl alternative https://www.gnu.org/software/wget/
  "zsh"                 # z-shell
)

# Install homebrew packages that might not already be installed.
echo -e "\nInstalling packages from regular brew"
for pkg in "${BREW_PACKAGES[@]}"; do
    if ! brew list --formula | grep -q "^${pkg}\$";
    then
    echo "Installing $pkg"
    brew install "$pkg"
    fi
done
echo "Homebrew and favorites successfully installed, moving on..."
