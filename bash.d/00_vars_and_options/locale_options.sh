# Set the locale options to UTF-8

ENCODING=$(locale -a | grep -i utf8)

if [ ! -z "$ENCODING" ]; then
    export LANGUAGE=${ENCODING}
    export LC_ALL=${ENCODING}
    export LANG=${ENCODING}
    export LC_TYPE=${ENCODING}
fi

#export LANGUAGE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LC_TYPE=en_US.UTF-8
