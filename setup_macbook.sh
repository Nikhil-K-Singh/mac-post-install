#!/usr/bin/zsh


sudo networksetup -setdnsservers Wi-Fi 8.8.8.8 1.1.1.1
defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock tilesize -int 32 && killall Dock
defaults write com.apple.dock magnification -bool true && killall Dock
defaults write com.apple.dock largesize -float 128 && killall Dock
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2 && killall Dock

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
brew install --cask visual-studio-code firefox raycast drawio github docker 

# if DOCKER installation fails to pull packages check the DNS on your wifi connection from your system settings,
# set DNS to 8.8.8.8 and 1.1.1.1


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
quickdownload https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

# brew install firefoxpwa
# firefoxpwa runtime install
# firefoxpwa site install \
#   --document-url "https://mail.google.com/mail/u/0/" \
#   "https://mail.google.com/mail/u/0/manifest.json"

# firefoxpwa site install \
#   --document-url "https://calendar.google.com/calendar/u/0/r" \
#   "https://calendar.google.com/calendar/u/0/manifest.json"

# firefoxpwa site install \
#   --document-url "https://web.whatsapp.com/" \
#   "https://web.whatsapp.com/data/manifest.json" 


exit
