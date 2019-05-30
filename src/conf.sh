#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

main() {
    set_globals

    [[ -n "${1-}" ]] && base_uri="$1"
    normalize_uri base_uri

    get_config_data configs ${base_uri}
    show_descr configs
}

set_globals() {
    declare -g base_host="${CONF_BASE_HOST-conf.vorakl.name}"
    declare -g base_uri="/"
    declare -gA configs
}

stdout_to_arr() {
    declare -n parr=$1 
    shift
    declare cmd="$@"

    IFS=$'\n' read -d '' -a parr < <(${cmd}) || true
}

http_get() {
    declare host="$1" uri="$2" str
    declare -i body=0

    exec {sock}<>/dev/tcp/${host}/80
    printf "GET ${uri} HTTP/1.1\nHost: ${host}\nConnection: close\n\n" >&${sock}
    while IFS= read -u ${sock} -r str; do
        if (( body )); then
            printf "%s\n" "${str}"
        else
            [[ -z "${str%$'\r'}" ]] && body=1
        fi
    done
    exec {sock}<&-
}

get_content() {
    declare -n pitems=$1
    declare uri=$2

    stdout_to_arr pitems http_get ${base_host} ${uri} 
}

get_config_data() {
    declare -n pdata=$1
    declare path=$2
    declare -a res
    declare key= value=

    get_content res /conf${path}conf.db
    for conf in "${res[@]}"; do
        set -- ${conf}
        key=$1; shift; value="$@"
        pdata[$key]="$value"
    done
}

show_descr() {
    declare -n pdata=$1
    declare -A meta

    printf "The configuration available in the ${base_uri}\n\n"
    for conf in ${!pdata[*]}; do
        eval meta=${pdata[$conf]}
        printf "%-8s    %s\n" ${conf} "${meta[info]}"
    done
}

normalize_uri() {
    declare -n pstr=$1

    pstr="${pstr/#\//}"
    pstr="${pstr/%\//}"
    [[ -z "${pstr}" ]] && pstr="/" || pstr="/${pstr}/"
}

main "$@"
