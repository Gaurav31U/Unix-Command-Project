#!/bin/bash

printf "\t\t----- Welcome to Mini Project by Gaurav Kumar\nRoll no. 20074013\nEmail :- gauravk.cse20@itbhu.ac.in \n
\t $ To perform any task on this system all you have to do in select your choice of options from given. $\n
# First you have install to dialog,yad,zenity\n
# sudo apt install dialog\n
# sudo apt install yad\n
# sudo apt install zenity\n
# In File Menu you will find commands like ls, cat, cp etc.\n
# In System Status Menu you will find commands like ps, df, date, printenv\n
# In Text Menu you will find commands like grep, diff, wc\n\n"

echo "@Author: Gaurav Kumar"
echo "Roll no. 20074013"
echo "@Date:   03-06-2021"
echo "@Email:  gauravk.cse20@itbhu.ac.in"


printf "\n\n ------ \tPress key to sart the program and then Enter------\n"
read opt
if [[ $opt ]]
then
    echo `./MainMenu.sh`
fi
