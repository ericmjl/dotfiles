import os

# Test homebrew packages
homebrew_packages = {
    "bat",
    "diff-so-fancy",
    "exa",
    "fd",
    "gcc",
    "git",
    "gnu-sed",
    "micro",
    "mobile-shell",
    "nano",
    "ripgrep",
    "tmux",
    "tree",
    "wget",
    "zsh",
}


homebrew_commands = {p:p for p in homebrew_packages}
exceptions = {
    "gnu-sed": "sed",
    "mobile-shell": "mosh",
    "ripgrep": "rg"
}
homebrew_commands.update(exceptions)

def test_homebrew_packages_installed():
    for pkg, cmd in homebrew_commands.items():
        # sh.type(cmd)
        result = os.system(f"type {cmd}")
        assert result == 0, f"{pkg} not found!"

if __name__ == "__main__":
    test_homebrew_packages_installed()
