#!/bin/sh -e
script_dir=$(dirname "$0")

function help() {
    echo 'generate_imapfilter_config.ash {imapfilter_config_dir} {jinja_var_file}'
}

if [ -z "$1" -o ! -e "$1" ] ; then
    echo "Please provide imapfilter dir and ensure it exists ($1) provided" >&2
    help
    exit 1
fi

imapfilter_config_dir="$1"

if [ ! -e "$2" ] ; then
    echo "Please provide jinja vars files and ensure it exists ($2) provided" >&2
    help
    exit 1
fi

jinja2_vars_file="$2"


(
    set -x

    jinja2 render -D "imapfilter_config_dir=${imapfilter_config_dir}" "${script_dir}/templates/imapIdleDaemon.lua.j2" -d "${jinja2_vars_file}"  > "${imapfilter_config_dir}/config.lua"
    jinja2 render "${script_dir}/templates/config.lua.j2" "${jinja2_vars_file}" > "${imapfilter_config_dir}/rules.lua"
)
