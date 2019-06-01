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
declare -r bin_name=${0##*/}

start() {
    declare _print_usage=0 _cmd=

    case "${1-}" in
        [iI][nN][fF][oO]) _cmd="info"
                          shift || true
                          ;;
        *) _print_usage=1
           _cmd="info"
           ;;
    esac
    if [[ -n "${1-}" ]]; then
        base_uri="$1"
    fi

    normalize_uri base_uri
    get_config_data configs ${base_uri}

    case "${_cmd}" in
        info) cmd_info configs
              ;;
        *) echo "ERROR: unknown command '${_cmd-undef}'" >&2
           exit 1
           ;;
    esac

    if (( _print_usage )); then
        usage
    fi
}

usage() {
    printf "\nUsage: %s [command] [path]\n" "${bin_name}"
    printf "Commands:\n"
    printf "  info\t\tPrint information about an item [default]\n\n"
} >&2

stdout_to_arr() {
    declare -n _parr=$1 
    shift
    declare _cmd="$@"

    # this OR list checks whether 'read' managed to get data or not
    IFS=$'\n' read -d '' -a _parr < <(${_cmd}) || (( ${#_parr[*]} ))
}

http_get() {
    declare _host="$1" _uri="$2" _str=
    declare -i _body=0
    declare -n _perrcode="$3"
    declare -n _perrmsg="$4"

    trap 'echo "ERROR: HTTP error code ${_perrcode}: ${_errmsg}" >&2' ERR

    exec {sock}<>/dev/tcp/${_host}/80
    printf "GET ${_uri} HTTP/1.1\nHost: ${_host}\nConnection: close\n\n" >&${sock}
    while IFS= read -u ${sock} -r _str; do
        if (( _body )); then
            printf "%s\n" "${_str}"
        else
            if [[ "${_str%$'\r'}" =~ ^HTTP/ ]]; then
                set -- ${_str%$'\r'}
                shift; _perrcode=$1; shift
                _perrmsg="$@"
                if (( ${_perrcode} != 200 )); then
                    exec {sock}<&-
                    false # trigger error trap
                    return 1
                fi
            fi
            [[ -z "${_str%$'\r'}" ]] && _body=1
        fi
    done
    exec {sock}<&-
}

get_content() {
    declare -n _pitems=$1
    declare _uri=$2
    declare _errcode= _errmsg=

    stdout_to_arr _pitems http_get ${base_host} ${_uri} _errcode _errmsg
}

get_config_data() {
    declare -n _pdata="$1"
    declare _path="$2"
    declare -a _res=()
    declare _key= _value=

    get_content _res /${base_dir}${_path}conf.db
    for _conf in "${_res[@]}"; do
        set -- ${_conf}
        _key=$1; shift; _value="$@"
        _pdata[${_key}]="${_value}"
    done
}

normalize_uri() {
    declare -n _pstr=$1

    _pstr="${_pstr/#\//}"
    _pstr="${_pstr/%\//}"
    [[ -z "${_pstr}" ]] && _pstr="/" || _pstr="/${_pstr}/"
}

cmd_info() {
    declare -n _pdata=$1
    declare -A _meta=()

    printf "The configuration available at the ${base_uri}\n\n"
    for _conf in ${!_pdata[*]}; do
        eval _meta=${_pdata[$_conf]}
        printf "%-8s    %s\n" ${_conf} "${_meta[info]}"
    done
}

start "$@"
}
