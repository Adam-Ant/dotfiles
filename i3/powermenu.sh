#!/bin/bash
 
option=$(echo "Lock|Logout|Sleep|Power Off|Restart|Windows" | rofi -sep "|" -dmenu -i -p "Power Menu" -auto-select -hide-scrollbar -width -10 -lines 6 -eh 2 -line-margin 6 -bw 7| xargs)
case $option in
    Lock) ./lock.sh;;
    Logout) i3-msg exit;;
    Sleep) systemctl suspend;;
    'Power Off') systemctl poweroff;;
    Restart) systemctl reboot;;
    Windows)
        windows=`efibootmgr | grep -Po -m1 'Boot\K(\d{4}).*Windows.*' | head -c4`
        `sudo efibootmgr -n $windows`
        reboot;;
esac
exit 0
