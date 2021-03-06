#!/bin/bash

lang="$1"
text="$(xsel -o)"

case ${lang} in
    en) otter-browser --readonly "https://en.wiktionary.org/wiki/Special:Search?search=${text}" 2>/dev/null
        ;;
    ru) otter-browser --readonly "https://ru.wiktionary.org/wiki/Special:Search?search=${text}" 2>/dev/null
        ;;
    *)  true
        ;;
esac
