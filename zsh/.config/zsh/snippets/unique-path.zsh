# remove duplicate path
unique-path() {
    export PATH=${(j.:.)${(uo)${(s.:.)PATH}}}
}

