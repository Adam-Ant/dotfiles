#!/bin/sh
set -e

basename=$(basename ${1})

# Full path to bypass ssh-agent
/usr/bin/scp -i ~/.ssh/screenshoter ${1} screenshots@srv2.cwgaming.co.uk:~/${basename}

echo "https://admnt.cf/i/${basename}" | xclip -r -selection c

notify-send -t 1500 "Screenshot: Upload Complete!" "https://admnt.cf/i/${basename}"
