#!/bin/bash

lang="$1"
text="$(xsel -o)"

case ${lang} in
    ru) otter-browser "https://translate.yandex.ru/?lang=ru&text=${text}"
        ;;
    en) otter-browser "https://translate.yandex.ru/?lang=en&text=${text}"
        ;;
    *)  true
        ;;
esac
