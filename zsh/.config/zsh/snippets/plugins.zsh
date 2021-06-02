# ohmyzsh 相关
snippets=(
  OMZ::lib/completion.zsh
  OMZ::lib/directories.zsh
  OMZ::lib/history.zsh
  OMZ::lib/key-bindings.zsh
  wait"2"
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
  wait"0"
    OMZ::plugins/docker-compose/docker-compose.plugin.zsh
  wait"0"
    OMZ::plugins/sudo/sudo.plugin.zsh
  wait"0"
    OMZ::plugins/kubectl/kubectl.plugin.zsh
  wait"2" 
    OMZ::plugins/extract/extract.plugin.zsh
)

# 补全
completions=(
  mv"*.zsh -> _fzf" atload'source _fzf'
    'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'
  'https://github.com/ogham/exa/blob/master/completions/zsh/_exa'
  nocd
    OMZ::plugins/docker-compose/_docker-compose
  nocd
    OMZ::plugins/docker/_docker
  nocd
    OMZ::plugins/fd/_fd
  nocd
    OMZ::plugins/cargo/_cargo
  nocd
    OMZ::plugins/rust/_rust
)

keybinds=(
  'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'
)

# 插件
plugins=(
  atload"_zsh_autosuggest_start"
    zsh-users/zsh-autosuggestions
  atinit"zicompinit; zicdreplay"
    zdharma/fast-syntax-highlighting
  blockf atpull'zinit creinstall -q .'
    zsh-users/zsh-completions
  skywind3000/z.lua
  changyuheng/fz
  Aloxaf/fzf-tab
  wait"0c"
    wfxr/forgit
  hlissner/zsh-autopair
)

