#!/usr/bin/zsh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

# Install command-line tools
brew install pipx rust eza tree bat thefuck entr tldr vlc ffmpeg motrix ripgrep zsh pure fzf libtorrent-rasterbar
brew install zsh-autosuggestions zsh-syntax-highlighting

export PATH="$HOME/.local/bin:$PATH"

# Install downloading tools
pipx install quickdownload
pipx install yt-dlp

# Install GUI applications
brew install --cask visual-studio-code firefox

# Install Zellij
cargo install --locked zellij
export PATH="$HOME/.cargo/bin:$PATH"

# update FilePilot if already installed
if [ -d "FilePilot" ]; then
  cd FilePilot
  git pull
else
  git clone https://github.com/Nikhil-K-Singh/FilePilot.git
  cd FilePilot
fi
cargo build --release
cd ..

#DOCKER
# if DOCKER installation fails to pull packages check the DNS on your wifi connection from your system settings,
# set DNS to 8.8.8.8 and 1.1.1.1
brew install --cask docker

quickdownload "https://shottr.cc/dl/Shottr-1.8.1.dmg" -o "Shottr.dmg" -p 8
open "Shottr.dmg"
#GITHUB DESKTOP
quickdownload "https://central.github.com/deployments/desktop/desktop/latest/darwin-arm64" -o "GithubDesktop.zip" -p 8
open "GithubDesktop.zip"
mv "GitHub Desktop.app" /Applications/
rm "GithubDesktop.zip"
