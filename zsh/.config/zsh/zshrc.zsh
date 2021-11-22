# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
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

zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'
zstyle ':fzf-tab:complete:kill:*' popup-pad 0 3
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ":fzf-tab:*" fzf-flags --color=bg+:32
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:exa' sort false
zstyle ':completion:files' sort false
zstyle ':fzf-tab:*:*argument-rest*' popup-pad 100 0

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

HISTDB_FILE=$ZDOTDIR/.zsh-history.db
# return the latest used command in the current directory
_zsh_autosuggest_strategy_histdb_top_here() {
    (( $+functions[_histdb_query] )) || return
    local query="
SELECT commands.argv
FROM   history
    LEFT JOIN commands
        ON history.command_id = commands.rowid
    LEFT JOIN places
        ON history.place_id = places.rowid
WHERE commands.argv LIKE '${1//'/''}%'
-- GROUP BY 会导致旧命令的新记录不生效
-- GROUP BY commands.argv
ORDER BY places.dir != '${PWD//'/''}',
	history.start_time DESC
LIMIT 1  
"
    typeset -g suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=(histdb_top_here match_prev_cmd completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_COMPLETION_IGNORE='( |man |pikaur -S )*'
ZSH_AUTOSUGGEST_HISTORY_IGNORE='?(#c50,)'

export _ZL_DATA=$ZDOTDIR/.z

set_fast_theme() {
    FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}alias]='fg=blue'
    FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}function]='fg=blue'
}

for snp in $ZDOTDIR/snippets/*.zsh; do
  source $snp
done

# zinit 配置
zinit lucid nocd light-mode for $snippets
zinit lucid nocd light-mode for $keybinds
zinit lucid nocd light-mode for $libs
zinit lucid as"completion" for $completions
zinit wait lucid depth"1" nocd light-mode for $plugins

# source $ZDOTDIR/.p10k.zsh
zinit depth"1 " nocd light-mode for romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
