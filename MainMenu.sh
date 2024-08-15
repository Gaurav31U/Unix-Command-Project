#!/bin/bash
#Project by Gaurav kumar 20074013

HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=3
BACKTITLE="I. The UNIX help main menu"
TITLE="UNIX HELP MAIN MENU"
MENU="Choose one of the following options:"

OPTIONS=(1 "1 -- File and Directory Management Commands"
         2 "2 -- Text Processing Commands"
         3 "3 -- System Status Commands"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo `./File.sh`
            ;;
        2)
            echo `./Text.sh`
            ;;
        3)
            echo `./Status.sh`
            ;;
            
esac
