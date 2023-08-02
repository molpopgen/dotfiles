# Dotfiles

## Notes

`clang-format` needs to be `.clang-format`.  Put it either in `~/` or the root of a C/C++ project.

## Setting up fonts

1. Install Fira Code.
   * Version from OS package manager is good enough.
2. Download NerdFontsSymbolsOnly.zip from the latest nerd fonts releases
   * extract into ~/.fonts
   * `fc-cache -fv`

## neovim

To get black working for python:

* Determine the venv of the LSP by editing a Python file and running `ps ax | grep lsp`
* In a terminal, activate that venv and install [this](https://github.com/python-lsp/python-lsp-black).
* Restart neovim.

### kitty

Note: `kitty.conf` explicitly maps the dev icons to the nerd fonts symbols.
