#!/bin/sh

# DotFiles Repository Installation Script
# =======================================
# This script installs chezmoi if not already installed,
# and uses it to install the dotfiles repository.
#
# References
# ----------
# - https://github.com/twpayne/dotfiles/blob/master/install.sh


set -eux

# Default installation directory
bin_dir="$HOME/.local/bin"

# If the first argument is a positional argument (i.e. not starting with '-'), 
# use it as bin_dir.
if [ "$#" -gt 0 ] && [ "${1#-}" = "$1" ]; then
  bin_dir="$1"
  shift
fi

if [ "$(command -v chezmoi)" ]; then
  # chezmoi is already installed
  chezmoi=chezmoi
else
  # Install chezmoi
  chezmoi="$bin_dir/chezmoi"
  # By default, chezmoi is installed to `./bin`.
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
fi

# Get the local path to this dotfiles repository
# by finding this script's directory path.
# - https://stackoverflow.com/a/29834779/12156188
CHEZMOI_SOURCE_DIR="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# Use `exec` to replace current process with `chezmoi init`
exec "$chezmoi" init --apply "--source=$CHEZMOI_SOURCE_DIR" "$@"
