#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

symlink() {
  local source="${BASEDIR}/${1}"
  local target=$2

  ln -fs $source $target
}

echo_ok() {
  echo -e '\033[1;32m'"$1"'\033[0m'
}

install_homebrew() {
  # Check if Homebrew is installed
  if [ ! $(which brew) ]; then
    echo_ok "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    echo_ok "Updating Homebrew..."
    brew update
  fi

  echo_ok "Installing Homebrew packages..."
  brew install nvm
  brew install tmux
  brew install yarn
}


install_apps() {
  echo_ok "Installing apps with Homebrew cask..."
  brew cask install google-chrome
  brew cask install visual-studio-code
  brew cask install iterm2
  brew cask install insomnia
  brew cask install spotify
}


install_vs_code_extensions() {
  echo_ok "Installing VS Code extensions"
  code --install-extension uloco.theme-bluloco-dark
  code --install-extension naumovs.color-highlight
  code --install-extension ms-vscode.hexeditor
  code --install-extension ms-vscode.cpptools
  code --install-extension ms-python.python
  code --install-extension eamodio.gitlens
  code --install-extension visualstudioexptteam.vscodeintellicode
  code --install-extension jpoissonnier.vscode-styled-components
  code --install-extension laurenttreguier.vscode-simple-icons
  code --install-extension wix.vscode-import-cost
  code --install-extension sonarsource.sonarlint-vscode
}

bootstrap_git() {
  echo_ok "Symlinking gitconfig..."
  symlink gitconfig ~/.gitconfig
}


main() {
  install_homebrew
  install_apps
  install_vs_code_extensions
  bootstrap_git
}