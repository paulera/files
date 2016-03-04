#!/bin/bash
if [ `uname -o` = "Cygwin" ]; then
    kill -WINCH $$
fi

