default:
  just --list

# ============================================
# Essentials
# ============================================

# Apt packages.
[linux]
install_essentials:
    apt-get install -y build-essential curl git vim

# ============================================
# Docker
# ============================================
# Docker open-source backend.
[group('containers')]
install_colima:
    brew install colima

# Docker CLI frontend.
[group('containers')]
install_docker_cli:
    brew install docker

# A GUI docker terminal.
[group('containers')]
install_lazydocker:
    brew install lazydocker

# ============================================
# CLI
# ============================================

# Better cat.
[group('cli')]
install_bat:
    brew install bat

# Better htop.
[group('cli')]
install_bottom:
    brew install bottom

# Disk storage info.
[group('cli')]
install_dust:
    brew install dust

# Better ls.
[group('cli')]
install_eza:
    brew install eza

# Better find.
[group('cli')]
install_fd:
    brew install fd

# Better fuzzy search.
[group('cli')]
install_fzf:
    brew install fzf

# LazyGit
[group('cli')]
install_lazygit:
    brew install lazygit

# Colorful CLI.
[group('cli')]
install_oh_my_posh:
    brew install jandedobbeleer/oh-my-posh/oh-my-posh
    oh-my-posh font install meslo
    mkdir -p $HOME/.config/ohmyposh
    curl -o $HOME/.config/ohmyposh/custom.toml https://raw.githubusercontent.com/destin-v/ohmyposh/refs/heads/main/custom.toml
    

# Neovim.
[group('cli')]
install_neovim:
    brew install neovim

# NvChad
[group('cli')]
install_nvchad:
    git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

# Better grep.
[group('cli')]
install_ripgrep:
    brew install ripgrep

# Better manuals.
[group('cli')]
install_tldr:
    brew install tlrc

# Tmux for all.
[group('cli')]
install_tmux:
    brew install tmux

# Better cd.
[group('cli')]
install_zoxide:
    brew install zoxide

# ============================================
# Shell
# ============================================

# Shell modifications.
[macos]
[group('shell')]
set_startup SHELL_PATH='$HOME/.zshrc':
    cat template.sh >> {{SHELL_PATH}}
    echo 'Restart the terminal to see changes!'

# Shell modifications.
[linux]
[group('shell')]
set_startup SHELL_PATH='$HOME/.bashrc':
    cat template.sh >> {{SHELL_PATH}}
    echo 'Restart the terminal to see changes!'

# ============================================
# Package Managers
# ============================================

# Rust Cargo package manager.
[group('package manager')]
install_cargo:
    curl https://sh.rustup.rs -sSf | sh

# UV package manager.
[group('package manager')]
install_uv:
    curl -LsSf https://astral.sh/uv/install.sh | sh

# Homebrew package manager.
[group('package manager')]
install_homebrew:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ============================================
# Quickstart
# ============================================

# Install Package Managers.
[group('quickstart')]
install_package_managers:
    just install_uv
    just install cargo
    just install_homebrew

# Install Docker.
[group('quickstart')]
install_docker:
    just install_colima
    just install_docker_cli
    just install_lazydocker

# Install CLI tools.
[group('quickstart')]
install_cli_tools:
    just install_bat
    just install_bottom
    just install_dust
    just install_eza
    just install_fd
    just install_fzf
    just install_lazygit
    just install_oh_my_posh
    just install_neovim
    just install_nvchad
    just install_ripgrep
    just install_tldr
    just install_tmux
    just install_zoxide

# Install everything!
[group('quickstart')]
install_all:
    just install_essentials
    just install-package-managers.
    just install_cli_tools
    
    # Modify z shell.
    just set_startup

# ============================================
# Tests
# ============================================

# Test for CI/CD.
[group('test')]
test:
    just set_startup test/file.txt
