# function to extract columns

cc() {
	awk "{ print \$$1; }"
}

