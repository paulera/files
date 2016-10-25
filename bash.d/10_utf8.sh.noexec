# Enable UTF-8 in PuTTY (from http://www.earth.li/~huggie/blog/tech/mobile/putty-utf-8-trick.html).
# The \e%G sets UTF-8 mode; \e[?47h and \e[?47l switch to the alternative screen and back.

if [ "$FILES_ENV" == "mac" ]; then
    ESC="\x1B"
else
    ESC="\e"
fi

echo -ne "$ESC%G$ESC[?47h$ESC%G$ESC[?47l"
