#!/bin/bash

# usage:  ya-trnaslate.sh <LANG> [console]
# If it's not specified 2nd parameter then a translation will be sent via notify-send


# Set YA_TRANSLATE_API variable to your API key!
[ -z "${YA_TRANSLATE_API}" ] && { echo "Set YA_TRANSLATE_API variable to your personal KEY" >&2; exit 1; }

# A direction of translation, like en, ru, en-ru, en-de
lang="$1"
[ -z "${lang}" ] && { echo "Set the direction of a translation as a first parameter in the command line" >&2; exit 1; }

# The rest of the string is a text for translation
text="$(xsel -o)"

if [ -n "$text" ]; then
    resCurl=$(curl -sL -d "text=${text}" "https://translate.yandex.net/api/v1.5/tr.json/translate?key=${YA_TRANSLATE_API}&lang=${lang}")
    [ -n "${resCurl}" ] &&  res=$(echo "${resCurl}" | jq -r '.["text"] | .[]')
fi

[ -z "$2" ] && notify-send "Translate: ${lang}" "${res}" || echo ${res}
