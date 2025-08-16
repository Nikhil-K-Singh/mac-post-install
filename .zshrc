
# =================  Aliases  ========================

alias ll="ls -la"
alias ..="cd .."
alias home="cd ~"
alias Home="cd ~"
alias docs="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias github="cd ~/Documents/GitHub"

alias eza="eza --color=always --long  --git --icons=always --no-user --no-permissions --tree --level=2"
alias ytd="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias fp="~/FilePilot/target/release/filepilot"
alias myip="curl http://ipecho.net/plain; echo"
alias qd="quickdownload"
alias up="fc -ln -1 | awk '{\$1=\"\"; sub(/^ /, \"\"); print}' | pbcopy"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# =================  FZF  ========================
# setting up fzf key bindings and fuzzy completions
eval "$(fzf --zsh)"
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

export FZF_CRT_T_OPTS="--preview 'bat -n --color=always --line-range :250 {}'"
export FZF_ALT_C_OPTS="--preview 'eza| head -250'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

ytdf() {
  local file="${1:-links.txt}"
  while IFS= read -r line; do
    yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$line"
  done < "$file"
}




# thefuck is to autocorrect your previously typed command
eval $(thefuck --alias)
eval $(thefuck --alias q)

# prompt configuration

fpath+=("$(brew --prefix)/share/zsh/site-functions")
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
zmodload zsh/nearcolor
zstyle :prompt:pure:path color '#19b002'

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:success' color blue
zstyle ':prompt:pure:prompt:error' color red

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure

source ~/setup_macbook.sh

# =================  Aliases  ========================

alias ll="ls -la"
alias ..="cd .."
# Created by `pipx` on 2025-08-09 16:31:34
export PATH="$PATH:/Users/nikhilsingh/.local/bin"
