#!/bin/bash -e -o pipefail

source ~/utils/utils.sh

echo "Installing Python Tooling"

echo "Brew Installing Python 3"
brew install python@3.9

echo "Brew Installing Python 2"
# Create local tap with formula due to python2 formula depreciation
brew tap-new --no-git local/python2
FORMULA_PATH=$(brew extract python@2 local/python2 | grep "Homebrew/Library/Taps")
brew install $FORMULA_PATH

echo "Installing pipx"
export PIPX_BIN_DIR=/usr/local/opt/pipx_bin
export PIPX_HOME=/usr/local/opt/pipx

brew install pipx

echo "export PIPX_BIN_DIR=${PIPX_BIN_DIR}" >> "${HOME}/.bashrc"
echo "export PIPX_HOME=${PIPX_HOME}" >> "${HOME}/.bashrc"
echo 'export PATH="$PIPX_BIN_DIR:$PATH"' >> "${HOME}/.bashrc"
