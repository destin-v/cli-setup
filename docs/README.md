<p align="center">
  <a href="https://github.com/destin-v">
    <img src="https://raw.githubusercontent.com/destin-v/destin-v/main/docs/pics/logo.gif" alt="drawing" width="500"/>
  </a>
</p>

<p align="center">
  <img src="logo.svg" alt="drawing" width="250"/>
</p>

# Description
Setup Command Line Interface (CLI) tools on a fresh Mac/Linux computer.

# Install
Install [**cargo**](https://doc.rust-lang.org/cargo/getting-started/installation.html) or [**homebrew**](https://brew.sh/) first if you do not have it!  Then install [**justfile**](https://just.systems/man/en/):

|Package Manager | Package  | Command            |
|---             |  ---     | ---                |
|Cargo	         |just      | cargo install just |
|Homebrew	       |just      | brew install just  |

```bash
# Show install options
just -l
```

```bash
Available recipes:
    install-all                           # Install everything!
    install_colima                        # Docker open-source backend.
    install_eza                           # Better ls.
    install_fd                            # Better find.
    install_fzf                           # Better fuzzy search.
    install_homebrew                      # Install Homebrew.
    install_neovim                        # Neovim.
    install_oh-my-posh                    # Colorful CLI.
    install_ripgrep                       # Better grep.
    install_tmux                          # Tmux for all.
    install_uv                            # Package Managers
    install_zoxide                        # Better cd.
    set_startup SHELL_PATH='$HOME/.zshrc' # Startup modifications.
    test                                  # Test for CI/CD.
```

You can install all packages via:

```bash
just install-all
```