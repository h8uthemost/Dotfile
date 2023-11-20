#!/bin/sh

echo "Which WM?"
echo "1) i3"
echo "2) bspwm"
echo "3) herbstluftwm"
echo -ne "Select: "

read input1
case $input1 in
    1)
        startx /usr/bin/i3
    ;;
    2)
        startx /usr/bin/bspwm
    ;;
    3)  startx /usr/bin/herbstluftwm
esac

