#!/usr/bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH 
brew install pipx rust eza tree bat thefuck entr tldr vlc ffmpeg motrix ripgrep zsh pure fzf
brew install zsh-autosuggestions zsh-syntax-highlighting

brew install --cask visual-studio-code firefox

pipx install quickdownload
pipx install yt-dlp

cargo install --locked zellij

git clone https://github.com/Nikhil-K-Singh/FilePilot.git
cd FilePilot
cargo build --release
cd ..

#DOCKER: 2 APPROACHES
# if DOCKER installation fails to pull packages check the DNS on your wifi connection from your system settings,
# set DNS to 8.8.8.8 and 1.1.1.1
brew install --cask docker

#GITHUB DESKTOP
qd https://central.github.com/deployments/desktop/desktop/latest/darwin-arm64 -o "GithubDesktop.zip"
open GithubDesktop.zip
