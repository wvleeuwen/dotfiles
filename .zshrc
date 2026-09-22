ZSH_ADDITIONAL_FILES=(
	"~/.zshrc.local"
)

for rc_file in $ZSH_ADDITIONAL_FILES; do
	if [[ -f "$rc_file" ]]; then
		source $rc_file;
	fi
done

alias dotfiles="cd ~/dotfiles && nvim ."

alias vi=nvim
alias vim=nvim
export EDITOR=nvim
export VISUAL=nvim
bindkey -e

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

