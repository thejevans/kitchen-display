#!/bin/bash

xset s noblank
xset s off
xset -dpms -nocursor

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

/usr/bin/chromium-browser --enable-features=WebContentsForceDark --noerrdialogs --disable-infobars --kiosk http://HOME_ASSISTANT_IP_ADDRESS:8123/kitchen-display/0?kiosk &

while true; do
   xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
   sleep 10
done
