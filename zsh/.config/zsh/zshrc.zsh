# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PROXY_ADDR='http://localhosts:1080'

# zsh 命令行提示符 % 问题
PROMPT_EOL_MARK=''

# fzf-tab 颜色小问题
FZF_TAB_NO_GROUP_COLOR=$'\033[0m'
FZF_DEFAULT_COMMAND='fd --type f'
HIST_STAMPS='yyyy-mm-dd'

setopt autocd
autoload -Uz zcalc zmv

local extract="
# trim input
in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
"
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'

bindkey '\ef' fzf-cd-widget # fzf alt-c 重新绑定为 alt-f

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
zinit light-mode nocd for $snippets
zinit light-mode depth"1" nocd for $plugins
zinit light-mode nocd for $keybinds
zinit as"completion" for $completions

source $ZDOTDIR/.p10k.zsh
zinit light-mode nocd for $themes

