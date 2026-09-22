# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

######### ADDITIONAL RC LOADING

ZSH_ADDITIONAL_FILES=(
	"$HOME/.zshrc.local"
	"$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
	"$HOME/dotfiles/.p10k.zsh"
)

for rc_file in $ZSH_ADDITIONAL_FILES; do
	if [[ -f "$rc_file" ]]; then
		echo "Sourcing additional file: $rc_file"
		source "$rc_file";
	fi
done

######### SHELL INTEGRATIONS

source <(fzf --zsh)
eval "$(zoxide init zsh)"

######### ALIASES

alias dotfiles="cd ~/dotfiles && nvim ."
alias k='kubectl'
alias d='docker'
alias dc='docker compose'
alias vi=nvim
alias vim=nvim

export EDITOR=nvim
export VISUAL=nvim
bindkey -e # Use emacs bindings for the prompt

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

