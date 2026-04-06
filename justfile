# CLI tools

# Apt packages.
[linux]
install_essentials:
    apt-get install -y build-essential curl git vim

# Docker open-source backend.
install_colima:
    brew install colima

# Better ls.
install_eza:
    brew install eza

# Better find.
install_fd:
    brew install fd

# Better fuzzy search.
install_fzf:
    brew install fzf

# Neovim.
install_neovim:
    brew install neovim

# Colorful CLI.
install_oh-my-posh:
    brew install jandedobbeleer/oh-my-posh/oh-my-posh
    oh-my-posh font install meslo

# Better grep.
install_ripgrep:
    brew install ripgrep

# Tmux for all.
install_tmux:
    brew install tmux

# Better cd.
install_zoxide:
    brew install zoxide

# Startup modifications.
set_startup SHELL_PATH='$HOME/.zshrc':
    cat .template >> {{SHELL_PATH}}
    echo 'Restart the terminal to see changes!'

# Rust Cargo package manager.
install_cargo:
    curl https://sh.rustup.rs -sSf | sh

# UV package manager.
install_uv:
    curl -LsSf https://astral.sh/uv/install.sh | sh

# Homebrew package manager.
install_homebrew:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install everything!
install-all:
    # Essential installs.
    just install_essentials

    # Install Package Manager.
    just install_uv
    just install cargo
    just install_homebrew

    # Install CLI tools.
    just install_eza
    just install_fd
    just install_fzf
    just install_oh-my-posh
    just install_neovim
    just install_ripgrep
    just install_tmux
    just install_zoxide

    # Modify z shell.
    just set_startup

# Test for CI/CD.
test:
    just set_startup test/file.txt