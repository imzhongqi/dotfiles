source $ZDOTDIR/zshrc.zsh

# remove duplicate path
() {
    local paths=(${(s.:.)PATH})
    paths=(${(u)paths})
    export PATH=${(j.:.)paths}
}
