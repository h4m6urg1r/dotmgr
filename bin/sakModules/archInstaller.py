#!/bin/env python

import os
import json
import requests
import getpass

RootPartition = "ArchLoonix"
BootPartition = "BOOT"
HomePartition = "Home"
SwapPartition = "Swap"
Timezone = "Asia/Kolkata"
Locales = ["en_US.UTF-8 UTF-8", "en_IN UTF-8"]
Users = dict()


def main():
    setDateAndTime()


def fuck(error):
    print(error)
    exit(1)


def hasInternet():
    try:
        requests.get('https://archlinux.org')
        return True
    except Exception as e:
        return False


def execute(prompt: str = "", cmd: str = ""):
    if not cmd:
        fuck("Command not given")
    print(f"{prompt}: {cmd}" if prompt else f"executing {cmd}")
    os.system(cmd)


def setDateAndTime(env="live"):
    if env == "chroot":
        for i in dateTimeCmds["chroot"]:
            execute("Executing", "timedatectl set-ntp true")
    else:
        for i in dateTimeCmds["live"]:
            execute()


def localize(root="", locale_gen="/etc/locale.gen", locale_conf="/etc/locale.conf"):
    with open(root + locale_gen, "a") as localeGen:
        localeGen.writelines(["\n", "\n", "#\n", "# Locales activated by archinstall script\n", "#\n", "\n"])
        for locale in Locales:
            localeGen.writelines([locale, "\n"])
        with open(root + locale_conf, "w") as localeConf:
            localeConf.writelines([f"LANG={Locales[0]}", "\n"])


def askInfo():
    while True:
        user = input("Enter User's name that is to be added[Leave empty when done] :- ")
        if user == "":
            break
        passwd = getpass.getpass(f"Enter {user}'s passwd :-")
        Users[user]["password"] = passwd
    rootPass = getpass.getpass(f"Enter Root password[Default: {list(Users.keys())[0]}'s pawwsord will be used] :- ")
    if not rootPass:
        rootPass = Users[list(Users.keys())[0]]["password"]
