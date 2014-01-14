# Enable UTF-8 in PuTTY (from http://www.earth.li/~huggie/blog/tech/mobile/putty-utf-8-trick.html).
# The \e%G sets UTF-8 mode; \e[?47h and \e[?47l switch to the alternative screen and back.
echo -ne '\e%G\e[?47h\e%G\e[?47l'
