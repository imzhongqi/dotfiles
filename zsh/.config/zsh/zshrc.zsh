# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh 命令行提示符 % 问题
PROMPT_EOL_MARK=''

# fzf-tab 颜色小问题
FZF_TAB_NO_GROUP_COLOR=$'\033[0m'
FZF_DEFAULT_COMMAND='fd --type f'
HIST_STAMPS='yyyy-mm-dd'

setopt autocd
autoload -Uz zcalc zmv
autoload -U colors && colors

local extract="
# trim input
in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
"
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'

bindkey '\ef' fzf-cd-widget # fzf alt-c 重新绑定为 alt-f


command -v nvim >/dev/null && EDITOR=nvim

# 加强版通配符
setopt EXTENDED_GLOB

# 用 vim 编辑命令行
autoload -U       edit-command-line
zle -N            edit-command-line
bindkey '^o'      edit-command-line     # C-o 打开 vim 编辑命令行

typeset -A ZINIT=(
  BIN_DIR         $ZDOTDIR/zinit/bin
  HOME_DIR        $ZDOTDIR/zinit
  COMPINIT_OPTS   -C
)

source $ZDOTDIR/zinit/bin/zinit.zsh

for snp in $ZDOTDIR/snippets/*.zsh; do
  source $snp
done

# zinit 配置
zinit lucid nocd light-mode for $snippets
zinit lucid nocd light-mode for $keybinds
zinit lucid as"completion" for $completions
zinit wait lucid depth"1" nocd light-mode for $plugins

source $ZDOTDIR/.p10k.zsh
zinit depth"1 " nocd light-mode for romkatv/powerlevel10k
