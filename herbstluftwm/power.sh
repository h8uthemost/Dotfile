#! /bin/sh

chosen=$(printf " Power Off\n Restart\n Suspend\n Hibernate\n Log Out\n Lock" | rofi -dmenu -i -p "Please select option:")

case "$chosen" in

"  Power Off") systemctl poweroff ;;

"  Restart") systemctl reboot ;;

"  Suspend") systemctl suspend ;;

"  Hibernate") systemctl hibernate ;;

"  Log Out") herbstclient quit ;;

"  Lock") betterlockscreen -l ;;

esac