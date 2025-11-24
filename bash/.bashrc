#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lh --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'

alias tmnew='tmuxifier new-session'
alias tmedit='tmuxifier edit-session'
alias tmload='tmuxifier load-session'

alias dj='python manage.py'

export EDITOR="nvim"
export ELECTRON_OZONE_PLATFORM_HINT="auto"

if ps -o comm= -p $(ps -o ppid= -p $$) | grep -qi alacritty ; then
    if [ -z "${NO_FASTFETCH:-}" ]; then
        fastfetch
    fi
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/home/TWEL/go/bin"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"

wd-stop() {
  waydroid session stop
  echo "Waydroid stopped."
}

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Fast git-branch prompt: only runs git when inside a git repo, uses no-optional-locks
parse_git_branch() {
  # return nothing quickly if not a git repo
  git -C "$PWD" rev-parse --is-inside-work-tree >/dev/null 2>&1 || return
  # get short branch name, avoid locks where possible
  branch=$(git -C "$PWD" -c core.bare=false --no-optional-locks \
    rev-parse --abbrev-ref --symbolic-full-name HEAD 2>/dev/null) || return
  # print a leading space plus branch in parentheses (so PS1 doesn't need its own space)
  printf ' (%s)' "$branch"
}

# PS1: note there is NO space immediately before $(parse_git_branch)
export PS1="\[\e[91m\]\w\[\e[94m\]\$(parse_git_branch)\[\e[00m\] > "
# export PS1="\u@\h \[\e[91m\]\w\[\e[94m\]\$(parse_git_branch)\[\e[00m\] > "


# Yazi auto-cd function
function y() {
    # Temporary file to store the last directory
    local tmpfile="/tmp/yazi-cwd-$$"

    # Run yazi and tell it to write the last directory to tmpfile
    yazi --cwd-file="$tmpfile" "$@"

    # If the tmpfile exists and contains a valid directory, cd to it
    if [ -f "$tmpfile" ]; then
        local last_dir
        last_dir=$(cat "$tmpfile")
        if [ -d "$last_dir" ]; then
            cd "$last_dir" || return
        fi
        rm -f "$tmpfile"
    fi
}

export FZF_DEFAULT_OPTS="
  $FZF_DEFAULT_OPTS
	--color=fg:#a7a7a7
	--color=fg+:#d5d5d5
	--color=hl:#C4693D
	--color=hl+:#E49A44
	--color=info:#a7a7a7
	--color=marker:#C4693D
	--color=prompt:#C4693D
	--color=spinner:#D87C4A
	--color=pointer:#E5A72A
	--color=header:#B14242
	--color=border:#a7a7a7
	--color=query:#d5d5d5
	--color=gutter:#121212"

# tmux-sessionizer
bind '"\C-f":"tmux-sessionizer\n"'

eval "$(mise activate bash)"

# Auto activate virtual environment
if [ -d ".venv" ]; then
    source .venv/bin/activate
fi
