#!/bin/bash
#Project by Gaurav kumar 20074013

HEIGHT=20
WIDTH=60
CHOICE_HEIGHT=6
BACKTITLE="II. The File Management Commands Sub-menu"
TITLE="FILE AND DIRECTORY MANAGEMENT COMMANDS"
MENU="Choose one of the following options then Enter name of file in current Directory:"

OPTIONS=(1 " -- Display the contents of a file"
         2 " -- Remove a file"
         3 " -- Copy a file"
         4 " -- List a file"
         5 " -- Size of a file"
         6 " -- Quit -- Return to main Menu" 	)

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
                content=`cat $x`
                zenity --info --ellipsize --title="Content of given file" --text="$content"
            else 
                zenity --info --title="File" --text="Please select file"
            fi  
            echo `./MainMenu.sh`   
            ;;
        2)
            x=`yad --title="Enter the file to remove" --file`
            if [[ -f $x ]]
            then
                rm $x
                zenity --info --ellipsize --title="File $x" --text="Deleted sussesfully"
            else 
                zenity --info --ellipsize --title="File" --text="Please select file"
            fi  
            echo `./MainMenu.sh`  
            ;;
        3)  
            x=`yad --title="Input first File" --file`
            y=`yad --title="Input second File" --file`
            if [[ -f $x && -f $y ]]
            then
                cp $x $y
                zenity --info --ellipsize --title="Copy Files" --text="$x copied to $y"
            else 
                zenity --info --title="File" --text="Please selects file"
            fi 
            echo `./MainMenu.sh`        
            ;;
        4)  
            x=`yad --title="Select the file" --file`
            if [[ -f $x ]]
            then
                y=`ls -l $x`
                zenity --info --ellipsize --title="File info" --text="$y"
             else 
                zenity --info --title="File" --text="Please select file"
            fi
            echo `./MainMenu.sh` 
            ;;
        5)  
            x=`yad --title="Select the file" --file`
            if [[ -f $x ]]
            then
                y=`ls -sh $x | awk '{ if(NR==1) print $1 }'`
                zenity --info --ellipsize --title="Size of File" --text="$y"
            else 
                zenity --info --title="File" --text="Please select file"
            fi
            echo `./MainMenu.sh` 
            ;;
        6)  
            echo `./MainMenu.sh`
            ;; 
esac
