export CLICOLOR=1
export LSCOLORS=DxFxBxDxCxegedabagacad
export PATH=$PATH:/opt/homebrew/bin
PRMPT="%F{yellow}%n@%F{magenta}%m%F{green}%~%f $ "

precmd() {
    PROMPT=`prompt_info`
}

# Enable highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

fpath=(~/zsh-completions/src $fpath)

source ~/develop/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/develop/zsh-completions
source ~/develop/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Override highlighter colors
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=red
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=red
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=yellow
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

prompt_info() {
        if [ -d .git ]; then
                tracked=`git status -s -uno | wc -l | awk '{$1=$1};1'`
                all=`git status -s -unormal | wc -l | awk '{$1=$1};1'`
                branch=`git branch | grep -e "^*" | cut -d' ' -f 2`
		ahead=`git status -bs -unormal | grep -i '\[ahead' | wc -l | awk '{$1=$1};1'`
		aheadmark=''
		if [ "$ahead" = "1" ]; then
			aheadmark='++++ '
		fi
                if [ "$all" = "0" ]; then
                        echo "\n%F{yellow}($aheadmark$branch)%f\n$PRMPT"
                elif [ "$all" = "$tracked" ]; then
                        echo "\n%F{yellow}($aheadmark$branch+)%f\n$PRMPT"
                else
                        echo "\n%F{yellow}($aheadmark$branch*)%f\n$PRMPT"
                fi
	else
		echo "$PRMPT"
        fi
}


