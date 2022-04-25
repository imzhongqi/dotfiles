# remove duplicate path
unique-path() {
    local paths=(${(s.:.)PATH})
    paths=(${(u)paths})
    export PATH=${(j.:.)paths}
}

