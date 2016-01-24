# minimal file listing
l() {
	ls -lh --group-directories --color=always --time-style=long-iso $* | awk "{print \$1, \$3, \$4, \$8, \$9, \$10;}" | grep -v ^total$
}

