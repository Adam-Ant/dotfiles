#!/bin/sh
set -e

FILEPATH="$HOME/Screenshots/$(date +%y%m%d-%H%M%S).png"

maim -s -b 2 -c 0.5,0.5,0.5,0.6 ${FILEPATH}

basename=$(basename ${FILEPATH})

# Full path to bypass ssh-agent
/usr/bin/scp -i ~/.ssh/screenshoter ${FILEPATH} screenshots@web.spritsail.io:~/${basename}

echo "https://admnt.pw/i/${basename}" | xclip -r -selection c

notify-send -t 1500 "Screenshot: Upload Complete!" "https://admnt.pw/i/${basename}"
