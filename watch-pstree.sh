#!/usr/bin/env bash

function check_pstree() {
    # Check if pstree is installed
    if ! command -v pstree &> /dev/null; then
        echo "pstree could not be found, please install it." > /dev/stderr
        exit 1
    fi
}

function print_loop() {
    local process_id=$1
    local last_output=""

    if pstree --version &> /dev/null; then
        # We are working with GNU pstree.
        pstree="pstree --show-pids --show-parents --arguments --long"
    else
        pstree="pstree -w -g 3 -p"
    fi
    
    if ! ps "${process_id}" &> /dev/null; then
        echo "No process with PID ${process_id} found." > /dev/stderr
        exit 1
    fi

    while ps "${process_id}" > /dev/null; do
        # Print the process tree of the specified process ID
        output=$(${pstree} "${process_id}")
        if [ -n "$output" ]; then
            echo "Process tree for PID ${process_id}:"
            last_output="${output}"
            clear && echo "${last_output}" 
            sleep 1
        fi
    done
    clear 
    echo "Process with PID ${process_id} is dead now."
    echo "Last process tree output:"
    echo
    echo "${last_output}" 
}

function main() {

    # This script is used to monitor the process tree of a specific process and its children.
    # It will print the process tree in a human-readable format.
    # The script will run indefinitely until it is killed.
    # The script outputs the last pstree output, if the process is killed, with the message that the process was killed.

    # Parse command line arguments using getopts
    while getopts ":p:" opt; do
        case ${opt} in
            p )
                # Check if the process ID is a valid number
                if [[ ! ${OPTARG} =~ ^[0-9]+$ ]]; then
                    echo "Invalid process ID: ${OPTARG}"  > /dev/stderr
                    exit 1
                fi
                local process_id=${OPTARG}
                ;;
            \? )
                echo "Usage: $0 -p <process_id>"  > /dev/stderr
                exit 1
                ;; 
        esac
    done

    if [ -z "${process_id}" ]; then
        echo "Process ID is required."  > /dev/stderr
        echo "Usage: $0 -p <process_id>"  > /dev/stderr
        exit 1
    fi

    check_pstree
    print_loop "${process_id}"
}

main $@