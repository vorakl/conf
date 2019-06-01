#!/bin/bash
{
set -o errexit
set -o pipefail
set -o nounset
set -o errtrace

trap '{ echo -e "\nThe stack trace:"
        for i in ${!FUNCNAME[*]}; do 
           echo "${FUNCNAME[i]}, line ${BASH_LINENO[i]}, file ${BASH_SOURCE[i]}"
        done; } >&2' ERR

declare base_host="${CONF_BASE_HOST-conf.vorakl.name}"
declare base_dir="${CONF_BASE_DIR-conf}"
declare base_uri="/"
declare -A configs=()

start() {
    if [[ -n "${1-}" ]]; then
        base_uri="$1"
    fi
    normalize_uri base_uri
    get_config_data configs ${base_uri}
    show_info configs
}

stdout_to_arr() {
    declare -n parr=$1 
    shift
    declare cmd="$@"

    # this OR list checks whether 'read' managed to get data or not
    IFS=$'\n' read -d '' -a parr < <(${cmd}) || (( ${#parr[*]} ))
}

http_get() {
    declare host="$1" uri="$2" str=
    declare -i body=0
    declare -n perrcode="$3"
    declare -n perrmsg="$4"

    trap 'echo "ERROR: HTTP error code ${perrcode}: ${errmsg}" >&2' ERR

    exec {sock}<>/dev/tcp/${host}/80
    printf "GET ${uri} HTTP/1.1\nHost: ${host}\nConnection: close\n\n" >&${sock}
    while IFS= read -u ${sock} -r str; do
        if (( body )); then
            printf "%s\n" "${str}"
        else
            if [[ "${str%$'\r'}" =~ ^HTTP/ ]]; then
                set -- ${str%$'\r'}
                shift; perrcode=$1; shift
                perrmsg="$@"
                if (( ${perrcode} != 200 )); then
                    exec {sock}<&-
                    false # trigger error trap
                    return 1
                fi
            fi
            [[ -z "${str%$'\r'}" ]] && body=1
        fi
    done
    exec {sock}<&-
}

get_content() {
    declare -n pitems=$1
    declare uri=$2
    declare errcode= errmsg=

    stdout_to_arr pitems http_get ${base_host} ${uri} errcode errmsg
}

get_config_data() {
    declare -n pdata=$1
    declare path=$2
    declare -a res=()
    declare key= value=

    get_content res /${base_dir}${path}conf.db
    for conf in "${res[@]}"; do
        set -- ${conf}
        key=$1; shift; value="$@"
        pdata[$key]="$value"
    done
}

show_info() {
    declare -n pdata=$1
    declare -A meta=()

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

start "$@"
}
