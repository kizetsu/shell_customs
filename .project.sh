#!/bin/bash
#

# project configuration
    # Define the folder where your projects are in (without trailing slash at the end)
    # e.g. ${HOME}/Documents/Projects
    # e.g. /var/www/
#PROJECT_DIR="/var/www"
PROJECT_DIR="/d/Projects"
COMMANDS=()

# get command to execute
__get_command()
{
    local _command="$1"

    __get_commands

    case "${_command}" in
        list)
            __list_projects "${@:2}"
            ;;
        go)
            __goto_project "${@:2}"
            ;;
        new)
            __create_project "${@:2}"
            ;;
        help)
            __show_help "${@:2}"
            ;;
        *)
            __show_usage
            ;;
    esac
}

__get_commands()
{
    COMMANDS=(
        'list'
        'go'
        'new'
        'help'
    )
    return
}

# list folders
__project_get_folders()
{
    command ls $@
    return
}

__get_path()
{
    local p d
    if [ "$#" -lt 1 ]; then
        p="${PROJECT_DIR}"
    else
        p="${PROJECT_DIR}"
        for d in "${@}"; do
            p="${p}/${d}"
        done
    fi
    echo "${p}"
    return
}

# list projects
__list_projects()
{
    local path="$(__get_path "$@")"
    command ls -alFh --color=auto "${path}"
    return
}

__goto_project()
{
    local path=__get_path "$@"
    command cd "${path}"
    return
}

__create_project()
{
    local path=__get_path "$@"
    command mkdir -p "${path}"
    return
}

__show_help()
{
    echo "usage: project {new|go|list} [NAME]"
    echo ""
    echo "new NAME          to create a new folder in projects"
    echo "go NAME           go to specific project folder"
    echo "list [NAME]       list all or specific project folders"
    return
}

__show_usage()
{
    __get_commands
    local c l=""
    for c in "${COMMANDS[@]}"; do
        l="${l/#\|/}|${c}"
    done
    echo "usage: project {${l}} [NAME]"
    return
}

# project functions
project()
{
    __get_command "$@"
}



# notices
# complete -W "list go new help" project
# oocalc_complete() {
#   local ext="ods"
#   local word="$2"
#   # Standard completion (filename-completion)
#   local i=0 line
#   declare -a list
#   while read line; do
#     list[i++]="$line"
#   done < <(compgen -f -- "$word")
#   # Filter: only filenames with the correct extension
#   local w e
#   for w in "${list[@]}"; do
#     if [ -d "$w" ]; then
#       continue
#     else
#       e="${w##*.}"
#       if [ "$e" = "$ext" ]; then
#         COMPREPLY[i++]="$w"
#       fi
#     fi
#   done
# }
# complete -o plusdirs -F oocalc_complete oocalc