alias qd="quickdownload"
alias eza="eza --color=always --long  --git --icons=always --no-user --no-permissions --tree --level=2"

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



# thefuck is to autocorrect your previously typed command
eval $(thefuck --alias)
eval $(thefuck --alias q)

alias fp="~/FilePilot/target/debug/filepilot"

# Created by `pipx` on 2025-08-09 16:31:34
export PATH="$PATH:/Users/nikhilsingh/.local/bin"
