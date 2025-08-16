#!/usr/bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH 
brew install pipx rust eza tree bat thefuck entr tldr vlc ffmpeg motrix ripgrep zsh pure fzf
brew install --cask visual-studio-code firefox
brew install zsh-autosuggestions zsh-syntax-highlighting

pipx install quickdownload
pipx install yt-dlp

cargo install --locked zellij

git clone https://github.com/Nikhil-K-Singh/FilePilot.git
cd FilePilot
cargo build --release
cd ..


# qd https://desktop.docker.com/mac/main/arm64/Docker.dmg

# sudo hdiutil attach ./Docker.dmg
# sudo cp -R /Volumes/Docker /Applications
# sudo hdiutil unmount /Volumes/Docker
# this will install docker with the GUI but the daemon etc will run as expected

# qd https://central.github.com/deployments/desktop/desktop/latest/darwin-arm64 -o "GithubDesktop.zip"

#unzip GithubDesktop.zip
#mv GitHub\ Desktop.app /Applications

# brew install --cask docker
# brew install docker-compose
