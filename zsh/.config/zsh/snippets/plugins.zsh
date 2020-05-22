# ohmyzsh 相关
snippets=(
  OMZ::lib/completion.zsh
  OMZ::lib/directories.zsh
  OMZ::lib/history.zsh
  OMZ::lib/key-bindings.zsh
  wait"0" lucid
    OMZ::plugins/docker-compose/docker-compose.plugin.zsh
  wait"0" lucid
    OMZ::plugins/sudo/sudo.plugin.zsh
  wait"2" lucid svn
    OMZ::plugins/extract
  wait"2" lucid
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
)

# 补全
completions=(
  mv"*.zsh -> _fzf" atload'source _fzf'
    'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'
  mv"*.zsh -> _exa" nocd
    'https://github.com/ogham/exa/blob/master/contrib/completions.zsh'
  nocd
    OMZ::plugins/docker-compose/_docker-compose
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
  zsh-users/zsh-autosuggestions
  wait lucid atinit"zpcompinit; zpcdreplay"
    zdharma/fast-syntax-highlighting
  wait lucid blockf
    zsh-users/zsh-completions
  wait lucid
    skywind3000/z.lua
  wait lucid
    changyuheng/fz
  wait lucid
    Aloxaf/fzf-tab
  wait lucid
    wfxr/forgit
  wait lucid 
    hlissner/zsh-autopair
)

# 一些好用的命令
programs=(
  sbin mv"exa* -> exa"
    ogham/exa
  sbin mv"*/rg -> rg"
    BurntSushi/ripgrep
  sbin"fd/fd" mv"fd* -> fd"
    @sharkdp/fd
  sbin"fzf"
    junegunn/fzf-bin
)

themes=(
  depth"1"
    romkatv/powerlevel10k
)
