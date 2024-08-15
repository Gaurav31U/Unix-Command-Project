#!/bin/bash
#Project by Gaurav kumar 20074013

HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=4
BACKTITLE="III. The Text Processing Commands Sub-menu"
TITLE="TEXT PROCESSING COMMANDS"
MENU="Choose one of the following options and Enter the filename or pattern :"

OPTIONS=(1 "-- Search a file for a pattern"
         2 "-- Count lines, words, and characters in specified files"
         3 "-- Display line differences between two files"
         4 "-- Quit -- Return to main Menu")

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
            x=`yad --title="Select the file" --file`
            if [[ -f $x ]]
            then 
                 y=`yad --title "Input Text" --entry --text "Enter string or pattern to searh in File"`
                 z=`grep -E $y $x`
                 if [[ $z ]]
                 then
                     zenity --info --ellipsize --title="Matched patterns" --text="$z"
                 else
                     zenity --info --ellipsize --title="Exception Results" --text="Match do not Found"
                 fi
            else 
                zenity --info --title="File" --text="Please select file"
            fi  
            echo `./MainMenu.sh`
            ;;
        2)
            x=`yad --title="Select the file" --file`
            if [[ -f $x ]]
            then
            	 y=`cat $x |wc -l`
                zenity --info --ellipsize --title="Number of line : " --text="$y Lines"
                y=`cat $x |wc -w`
                zenity --info --ellipsize --title="Number of words : " --text="$y Words"
                y=`cat $x |wc -c`
                zenity --info --ellipsize --title="Number of characters : " --text="$y characters"
            else 
                zenity --info --title="File" --text="Please select file"
            fi  
            echo `./MainMenu.sh`
            
            ;;
        3)
            x=`yad --title="Input first File" --file`
            y=`yad --title="Input second File" --file`
            if [[ -f $x && -f $y ]]
            then
                     x=`diff $x $y`
                     if [[ $x ]]
                     then 
                         zenity --info --title="Difference Result" --text="$x"
                     else
                         zenity --info --title="Difference Result" --text="Files are same"
                     fi
            else 
                zenity --info --title="File" --text="Please selects file"
            fi 
            echo `./MainMenu.sh`
            ;;
        4)
            echo `./MainMenu.sh`
            ;; 
            
esac
