#!/usr/bin/zsh
# SUGGESTED TO EXECUTE BELOW LINES ONE BY ONE , UNDERSTANDING WHAT EACH DOES 

# make Google DNS service for your network, allowing low latency compared to the local ISP
sudo networksetup -setdnsservers Wi-Fi 1.1.1.1

# setup adblock on DNS level
# goto https://ublockdns.com
# copy the account key gospel-turtle-clap-blood
# setup for "All apps on this computer" 
# curl -sSfL https://ublockdns.com/install.sh | sh -s -- UNIQUE_token


# Enabling fingerprint for sudo commands in session instead of password
sudo cp /etc/pam.d/sudo /etc/pam.d/sudo.backup && \
sudo sed -i '' '1s;^;auth       sufficient     pam_tid.so\n;' /etc/pam.d/sudo

# homescreen restructing with minimalist style
defaults write -g NSWindowShouldDragOnGesture -bool true && \
defaults write com.apple.dock autohide -bool true && \
defaults write com.apple.dock tilesize -int 32 && \
defaults write com.apple.dock magnification -bool true && \
defaults write com.apple.dock largesize -float 128 && \
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2 && \
defaults write com.apple.dock orientation -string left && killall Dock && \
defaults write com.apple.dock persistent-apps -array && killall Dock
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# installing rosetta to allow setting up Virtual Machines on the device
softwareupdate --install-rosetta --agree-to-license

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

# Install command-line tools
brew install pipx rust eza tree bat thefuck entr tldr vlc ffmpeg motrix ripgrep zsh pure fzf libtorrent-rasterbar
brew install zsh-autosuggestions zsh-syntax-highlighting
export PATH="$HOME/.local/bin:$PATH"

# Install downloading tools
# pipx install quickdownload         # I do not maintain this anymore.
pipx install yt-dlp        # downloading youtube videos from URI

# Install GUI applications
brew install --cask visual-studio-code
brew install --cask itsycal
brew install --cask firefox 
brew install --cask drawio
brew install --cask github
brew install --cask docker
brew install --cask chatgpt
brew install --cask claude-code
brew install --cask whatsapp

# Install Zellij
cargo install --locked zellij
export PATH="$HOME/.cargo/bin:$PATH"

# Install FilePilot        # Caution i do not actively maintain this
cd ~
git clone https://github.com/Nikhil-K-Singh/FilePilot.git
cd FilePilot
cargo build --release
cd ..

# Install Scribble       # Caution i do not actively maintain this
cd ~
git clone https://github.com/Nikhil-K-Singh/scribble.git
cd scribble
cargo build --release
cd ..

# Install miniconda to allow for multiple python runtimes
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

# if you need MS Office Suite on the mac,
# follow https://massgrave.dev/office_for_mac

exit
