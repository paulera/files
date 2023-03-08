# Extracting
ffa () {
	grep \
	    --color=always \
	    --exclude-dir=".git" \
	    --exclude-dir="vendor" \
	    --exclude-dir="node_modules" \
	    -B2 -F2 \
	    -i -n -H -a -R -I "$*" * &> /dev/stdout
}

