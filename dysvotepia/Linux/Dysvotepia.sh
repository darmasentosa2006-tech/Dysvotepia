#!/bin/sh
echo -ne '\033c\033]0;Dysvotepia\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Dysvotepia.x86_64" "$@"
