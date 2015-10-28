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


#
#
# xinput float <id>
# xinput reattach <id> <master>
#
#

bold=$(tput bold)
normal=$(tput sgr0)

# GNOME. Mostly Ubuntu.
if [ -n "`command -v gnome-screensaver-command`" ]
then
    lock="gnome-screensaver-command -l"
# KDE
elif [ -n "`command -v dm-tool`" ]
then
    lock="dm-tool lock"
# Cinnamon
elif [ -n "`command -v cinnamon-screensaver-command`" ]
then
    lock="cinnamon-screensaver-command -l"
# UGLY. For Fedora GNOME.
elif [ -n "`command -v dnf`" ]
then
    lock="dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"
fi

WORK=5     # In seconds.
REST=5      # In seconds.

# for i in `seq $WORK`
# do
#     echo -n "$i."
#     sleep 1
# done
# echo "!"
# xinput float 11

# for i in `seq $REST`
# do
#     echo -n "$i!"
#     sleep 1
# done
# echo "."
# xinput reattach 11 3
