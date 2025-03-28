#!/bin/sh

# DotFiles Repository Installation Script
# =======================================
# This script installs chezmoi if not already installed,
# and uses it to install the dotfiles repository.
#
# References
# ----------
# - https://github.com/twpayne/dotfiles/blob/master/install.sh


set -euo pipefail

if [ ! "$(command -v chezmoi)" ]; then
  # Install chezmoi
  
  # By default, chezmoi is installed to `./bin`.
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  # Installation location can be specified with the `-b` flag.
  # - https://www.chezmoi.io/install/#one-line-binary-install
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  # Already installed
  chezmoi=chezmoi
fi

# Get the local path to this dotfiles repository
# by finding this script's directory.
# - https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# Use `exec` to replace current process with `chezmoi init`
exec "$chezmoi" init --apply "--source=$script_dir"
