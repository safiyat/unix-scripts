#!/usr/bin/env python

OSDIST_LIST = (('/etc/oracle-release', 'OracleLinux'),
               ('/etc/slackware-version', 'Slackware'),
               ('/etc/redhat-release', 'RedHat'),
               ('/etc/vmware-release', 'VMwareESX'),
               ('/etc/openwrt_release', 'OpenWrt'),
               ('/etc/system-release', 'OtherLinux'),
               ('/etc/alpine-release', 'Alpine'),
               ('/etc/release', 'Solaris'),
               ('/etc/arch-release', 'Archlinux'),
               ('/etc/SuSE-release', 'SuSE'),
               ('/etc/os-release', 'SuSE'),
               ('/etc/gentoo-release', 'Gentoo'),
               ('/etc/os-release', 'Debian'),
               ('/etc/lsb-release', 'Mandriva'),
               ('/etc/altlinux-release', 'Altlinux'),
               ('/etc/os-release', 'NA'))

PKG_MGRS = [{'path': '/usr/bin/yum',          'name': 'yum'},
            {'path': '/usr/bin/dnf',          'name': 'dnf'},
            {'path': '/usr/bin/apt-get',      'name': 'apt'},
            {'path': '/usr/bin/zypper',       'name': 'zypper'},
            {'path': '/usr/sbin/urpmi',       'name': 'urpmi'},
            {'path': '/usr/bin/pacman',       'name': 'pacman'},
            {'path': '/bin/opkg',             'name': 'opkg'},
            {'path': '/opt/local/bin/pkgin',  'name': 'pkgin'},
            {'path': '/opt/local/bin/port',   'name': 'macports'},
            {'path': '/usr/local/bin/brew',   'name': 'homebrew'},
            {'path': '/sbin/apk',             'name': 'apk'},
            {'path': '/usr/sbin/pkg',         'name': 'pkgng'},
            {'path': '/usr/sbin/swlist',      'name': 'SD-UX'},
            {'path': '/usr/bin/emerge',       'name': 'portage'},
            {'path': '/usr/sbin/pkgadd',      'name': 'svr4pkg'},
            {'path': '/usr/bin/pkg',          'name': 'pkg'},
            {'path': '/usr/bin/xbps-install', 'name': 'xbps'},
            {'path': '/usr/local/sbin/pkg',   'name': 'pkgng'}]

OS_FAMILY = {'Altlinux': 'Altlinux', 'AIX': 'AIX', 'MacOSX': 'Darwin',
             'Archlinux': 'Archlinux', 'Slackware': 'Slackware',
             'OracleLinux': 'RedHat', 'Fedora': 'RedHat', 'SuSE': 'Suse',
             'Scientific': 'RedHat', 'Gentoo': 'Gentoo', 'OmniOS': 'Solaris',
             'Funtoo': 'Gentoo', 'openSUSE_Leap': 'Suse',
             'XenServer': 'RedHat', 'Amazon': 'RedHat', 'FreeBSD': 'FreeBSD',
             'Mandrake': 'Mandrake', 'Raspbian': 'Debian', 'Debian': 'Debian',
             'Alpine': 'Alpine', 'RedHat': 'RedHat', 'Manjaro': 'Archlinux',
             'PSBM': 'RedHat', 'CloudLinux': 'RedHat', 'Ubuntu': 'Debian',
             'SmartOS': 'Solaris', 'openSUSE': 'Suse', 'SLED': 'Suse',
             'Mandriva': 'Mandrake', 'SLES': 'Suse', 'Nexenta': 'Solaris',
             'SLC': 'RedHat', 'Ascendos': 'RedHat', 'OVS': 'RedHat',
             'Solaris': 'Solaris', 'CentOS': 'RedHat',
             'OpenIndiana': 'Solaris', 'OEL': 'RedHat', 'SLES_SAP': 'Suse',
             'HPUX': 'HP-UX'}


def get_distro():
    pass
