default:
  just --list

# Apt packages.
[linux]
install_essentials:
    apt-get install -y build-essential curl git vim

# Docker open-source backend.
[group('containers')]
install_colima:
    brew install colima

# Docker CLI frontend.
[group('containers')]
install_docker_cli:
    brew install docker

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

# Neovim.
[group('cli')]
install_neovim:
    brew install neovim

# Colorful CLI.
[group('cli')]
install_oh_my_posh:
    brew install jandedobbeleer/oh-my-posh/oh-my-posh
    oh-my-posh font install meslo

# Better grep.
[group('cli')]
install_ripgrep:
    brew install ripgrep

# Tmux for all.
[group('cli')]
install_tmux:
    brew install tmux

# Better cd.
[group('cli')]
install_zoxide:
    brew install zoxide

# Startup modifications.
[macos]
[group('shell')]
set_startup SHELL_PATH='$HOME/.zshrc':
    cat .template >> {{SHELL_PATH}}
    echo 'Restart the terminal to see changes!'

# Startup modifications.
[linux]
[group('shell')]
set_startup SHELL_PATH='$HOME/.bashrc':
    cat .template >> {{SHELL_PATH}}
    echo 'Restart the terminal to see changes!'

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

# Install Package Managers.
[group('quickstart')]
install_package_managers:
    just install_uv
    just install cargo
    just install_homebrew

# Install CLI tools.
[group('quickstart')]
install_cli_tools:
    just install_eza
    just install_fd
    just install_fzf
    just install_oh_my_posh
    just install_neovim
    just install_ripgrep
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

# Test for CI/CD.
[group('test')]
test:
    just set_startup test/file.txt
