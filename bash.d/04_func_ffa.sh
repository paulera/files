# Extracting
ffa () {
	grep --color=always -B2 -F2 -i -n -H -a -R "$*" * &> /dev/stdout | grep -v "^grep: .*$\|^Binary file \(standard input\) matches$"
}

