#!/usr/bin/env bash

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu -p "Password: "  -bw 4 -i -width 80 -lines 3 -location 6 -no-custom -sync -yoffset -50 "$@")

[[ -n $password ]] || exit

pass show -c "$password" 2>/dev/null
