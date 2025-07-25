# Use grep to find content in files recursively
# Usage: ffa <stuff you are searching for>
# This function ignores folders where you are unlikely to be
# searching stuff, like vendor and configuration ones.

# The list of files will be saved in /tmp/files_that, to allow ease reuse of
# results with the function `that`

ffa () {
        grep \
            --color=always \
            --exclude-dir=".git" \
            --exclude-dir="vendor" \
            --exclude-dir="node_modules" \
            -C2 \
            -i -n -H -a -R -I "$*" * &> /dev/stdout | tee ~/.files_that

        # remove colors
        sed -i -r 's/\x1B\[[0-9;]*[JKmsu]//g' ~/.files_that

        # leave only occurence lines
        perl -i -ne 'print if /:[0-9]+:/' ~/.files_that

        # leaves only the filename
        sed -i -r 's/:.*$//g' ~/.files_that
        sed -i -r 's/\x1B\[[0-9;]*[JKmsu]//g' ~/.files_that
}
export -f ffa
