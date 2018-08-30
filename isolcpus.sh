#!/usr/bin/env bash

set -x

ISOLCPUS=$1

if [ -z ${ISOLCPUS} ]; then
    echo "No CPUs provided for isolation."
    exit
fi

GRUB_CMDLINE_LINUX=$(sed -ne 's/GRUB_CMDLINE_LINUX="\([^"]*\)"/\1/p' /etc/default/grub)

if grep -q isolcpus <<< "${GRUB_CMDLINE_LINUX}"; then
    echo "CPU isolation has already been done."
    egrep -o -e 'isolcpus[^"\S]+' /etc/default/grub
    echo
else
    GRUB_CMDLINE_LINUX="${GRUB_CMDLINE_LINUX} isolcpus=${ISOLCPUS}"
    sed -i -e "s#^GRUB_CMDLINE_LINUX=.*\$#GRUB_CMDLINE_LINUX=\"${GRUB_CMDLINE_LINUX}\"#g" /etc/default/grub
fi

echo "Updating grub..."
if command -v grub-mkconfig; then
    grub-mkconfig -o /boot/grub/grub.cfg
fi
if command -v grub2-mkconfig; then
    grub2-mkconfig -o /boot/grub2/grub.cfg
fi
