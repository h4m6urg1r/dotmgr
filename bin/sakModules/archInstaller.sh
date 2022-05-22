#!/bin/env bash

RootPartition="ArchLoonix"
BootPartition="BOOT"
HomePartition="Home"
SwapPartition="Swap"
Timezone="Asia/Kolkata"
Locales=["en_US.UTF-8 UTF-8", "en_IN UTF-8"]

main() {
	setDateAndTime
}

error() {
	echo $1
	exit 1
}

hasInternet() {
	wget -q --spider http://google.com && echo true || echo false
}

setDateAndTime() {
	if [[ $1 -eq "chroot" ]]
	then
		timedatectl set-ntp true
	else
		ln -sf /usr/share/zoneinfo/${Timezone} /etc/localtime
		hwclock --systohc
		timedatectl set-ntp true
	fi
}

localize() {
	echo "\n\n#\n# Locales activated by archinstall script\n#\n" >> $1/etc/locale.gen
	for locale in $Locales
	do
		echo "$locale" >> $1/etc/locale.gen
	done
	echo "LANG=$Locales[0]" > $1/etc/locale.conf
}

askInfo() {
	read -p "Enter your User name :- " userName
	read -s -p "Enter User password :- " userPass
	read -s -p "Enter Root password [Default: Same as user] :-" rootPass
	if [[ !$rootPass ]]
	then
		rootPass=userPass
	fi
}
