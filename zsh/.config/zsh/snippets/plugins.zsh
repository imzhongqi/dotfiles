libs=(
  # OMZL::theme-and-appearance.zsh
  # OMZL::git.zsh
  # OMZL::prompt_info_functions.zsh

  OMZL::clipboard.zsh
  OMZL::completion.zsh
  OMZL::directories.zsh
  OMZL::history.zsh
  OMZL::key-bindings.zsh
)

# ohmyzsh 相关
snippets=(
  wait"2"
    OMZP::colored-man-pages/colored-man-pages.plugin.zsh
  wait"0"
    OMZP::docker-compose/docker-compose.plugin.zsh
  wait"0"
    OMZP::sudo/sudo.plugin.zsh
  # wait"0"
    # OMZP::kubectl/kubectl.plugin.zsh
  wait"2" 
    OMZP::extract/extract.plugin.zsh
)

# 补全
completions=(
  mv"*.zsh -> _fzf" atload'source _fzf'
    'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'
  'https://github.com/ogham/exa/blob/master/completions/zsh/_exa'
  nocd
    OMZP::docker-compose/_docker-compose
  nocd
    OMZP::docker/_docker
  nocd
    OMZP::fd/_fd
)

keybinds=(
  'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'
)

# 插件
plugins=(
  atload="set_fast_theme" atinit"zicompinit; zicdreplay"
    zdharma-continuum/fast-syntax-highlighting
  blockf atpull'zinit creinstall -q .'
    zsh-users/zsh-completions
  atload"_zsh_autosuggest_start"
    zsh-users/zsh-autosuggestions
  Aloxaf/fzf-tab
  changyuheng/fz
  hlissner/zsh-autopair
  Aloxaf/zsh-histdb
  wait"0c"
    skywind3000/z.lua

  # wait"0c"
  #   wfxr/forgit
)

