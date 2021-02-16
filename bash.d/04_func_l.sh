# minimal file listing

if [ "(type -t l)" == "alias" ]; then
        unalias l
fi

l() {
	ls -lh --group-directories --color=always --time-style=long-iso $* | awk "{print \$1, \$3, \$4, \$8, \$9, \$10, \$11;}" | grep -v ^total$
}

