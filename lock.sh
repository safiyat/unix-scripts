#!/usr/bin/env bash

#
#  Fedora:  
#           GNOME
#
#  Kubuntu: dm-tool lock
#           KDE
#
#  Ubuntu:  gnome-screensaver-command -l
#           Unity
#
#  Cinnamon:cinnamon-screensaver-command -l
#

bold=$(tput bold)
normal=$(tput sgr0)

function getDE()
{
    if [ "$XDG_CURRENT_DESKTOP" = "" ]
    then
        desktop=$(echo "$XDG_DATA_DIRS" | sed 's/.*\(xfce\|kde\|gnome\).*/\1/')
    else
        desktop=$XDG_CURRENT_DESKTOP
    fi
    desktop=${desktop,,}  # convert to lower case
    eval "$1=\"$desktop\""
}

function getLockCommand()
{
    getDE deskenv
    case $deskenv in
        kde)
            command="dm-tool lock"
            ;;
        unity)
            command="gnome-screensaver-command -l"
            ;;
        gnome)
            command="gnome-screensaver-command -l"
            ;;
    esac
    eval "$1=\"$command\""
}


getLockCommand command
echo "$command"
