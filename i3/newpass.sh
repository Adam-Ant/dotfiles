ROFI_OPTIONS="-bw 4 -width 80 -lines 1 -location 6 -yoffset -50"

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

ROFI_PATH=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu -p "Path: " -sync $ROFI_OPTIONS)
USERNAME=$(rofi -dmenu -p "Username: " $ROFI_OPTIONS)
URL=$(rofi -dmenu -p "URL: " $ROFI_OPTIONS)

printf "REPLACEME\nUsername: %s\nURL: %s" "$USERNAME" "$URL" | pass insert -m $ROFI_PATH

pass generate -ci $ROFI_PATH
