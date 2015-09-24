# Extracting
ffa () {
	grep --color=always -B2 -F2 -i -n -H -a -R $* *
}

