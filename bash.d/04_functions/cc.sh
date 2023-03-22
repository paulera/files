# function to extract columns

cc() {

    if [ "$1" == "--help" ]; then
        echo "Usage: ... | cc <n>"
        echo "Extracts the n-th column from the result using awk and space as delimiter"
        echo
        return
    fi

	awk "{ print \$$1; }"
}

