#!/bin/bash
#Project by Gaurav kumar 20074013

HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=5
BACKTITLE=""
TITLE="IV. The System Status Commands Sub-menu"
MENU="Choose one of the following options:"

OPTIONS=(1 "-- Display the current date and time"
         2 "-- Current disk usage"
         3 "-- List current local and environmental"
         4 "-- Display process status information"
         5 "-- Quit -- Return to main Menu")

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
           x=`date +"%d/%h/%Y %R"`
           zenity --info --ellipsize --title="Date" --text="$x"   
           echo `./MainMenu.sh`        
           ;;
        2) 
           x=`df /dev/sda5 --output=used` 
           zenity --info --ellipsize --title="Memory Used" --text="$x"
           echo `./MainMenu.sh`      
           ;;
        3) 
           
           x=`printenv`
           zenity --info --ellipsize --title="Variables" --text="$x"
           echo `./MainMenu.sh`
           ;;
        4) 
           x=`ps -e`
           zenity --info --ellipsize --title="Process List" --text="$x"
           echo `./MainMenu.sh`
           ;;
        5) 
           echo`./MainMenu.sh`
           ;;
            
esac
./temp1.sh
