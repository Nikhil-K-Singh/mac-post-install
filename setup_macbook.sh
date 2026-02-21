#!/usr/bin/zsh


sudo networksetup -setdnsservers Wi-Fi 1.1.1.1

defaults write com.apple.dock autohide -bool true && \
defaults write com.apple.dock tilesize -int 32 && \
defaults write com.apple.dock magnification -bool true && \
defaults write com.apple.dock largesize -float 128 && \
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2 && \
defaults write com.apple.dock orientation -string left && killall Dock && \
defaults write com.apple.dock persistent-apps -array && killall Dock
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true


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
brew install --cask visual-studio-code itsycal firefox drawio github docker chatgpt claude-code

# Install Zellij
cargo install --locked zellij
export PATH="$HOME/.cargo/bin:$PATH"

# update FilePilot if already installed
cd ~
if [ -d "FilePilot" ]; then
  cd FilePilot
  git pull
else
  git clone https://github.com/Nikhil-K-Singh/FilePilot.git
  cd FilePilot
fi
cargo build --release
cd ..

cd ~
if [ -d "scribble" ]; then
  cd scribble
  git pull
else
  git clone https://github.com/Nikhil-K-Singh/scribble.git
  cd scribble
fi
cargo build --release
cd ..

mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

sudo cp /etc/pam.d/sudo /etc/pam.d/sudo.backup && \
sudo sed -i '' '1s;^;auth       sufficient     pam_tid.so\n;' /etc/pam.d/sudo
brew install --cask nikitabobko/tap/aerospace
defaults write -g NSWindowShouldDragOnGesture -bool true 
exit
