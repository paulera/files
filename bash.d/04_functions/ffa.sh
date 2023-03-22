# Use grep to find content in files recursively
# Usage: ffa <stuff you are searching for>
# This function ignores folders where you are unlikely to be
# searching stuff, like vendor and configuration ones.

ffa () {
	grep \
	    --color=always \
	    --exclude-dir=".git" \
	    --exclude-dir="vendor" \
	    --exclude-dir="node_modules" \
	    -B2 -F2 \
	    -i -n -H -a -R -I "$*" * &> /dev/stdout
}

