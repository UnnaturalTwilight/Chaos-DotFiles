#!/usr/bin/env bash
# Script to throw a couple of notifications if the system is not booted in a certain state.

# check mount state of windows partition
if findmnt -r | grep -q '/mnt/c'; then
    if findmnt -r -O ro | grep -q '/mnt/c'; then
        notify-send "C:/ is mounted read-only" "Windows may not have been fully shut down." --urgency=critical --app-name="Boot State Checker"
    fi 
else
    notify-send "C:/ is not mounted" "Apps that depend on data stored under windows will not work." --urgency=critical --app-name="Boot State Checker"
fi

# other checks