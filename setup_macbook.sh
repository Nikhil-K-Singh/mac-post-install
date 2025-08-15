brew install pipx rust eza tree bat thefuck entr tldr vlc ffmpeg motrix ripgrep zsh pure
brew install --cask visual-studio-code
brew install zsh-autosuggestions zsh-syntax-highlighting

pipx install quickdownload
pipx install yt-dlp

cargo install --locked zellij

git clone https://github.com/Nikhil-K-Singh/FilePilot.git
cd FilePilot
cargo build --release
cd ..
