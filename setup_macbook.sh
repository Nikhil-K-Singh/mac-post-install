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

# Build FilePilot
git clone https://github.com/Nikhil-K-Singh/FilePilot.git
cd FilePilot
cargo build --release
cd ..

#DOCKER
# if DOCKER installation fails to pull packages check the DNS on your wifi connection from your system settings,
# set DNS to 8.8.8.8 and 1.1.1.1
brew install --cask docker

#GITHUB DESKTOP
quickdownload https://central.github.com/deployments/desktop/desktop/latest/darwin-arm64 -o "GithubDesktop.zip"
open GithubDesktop.zip
