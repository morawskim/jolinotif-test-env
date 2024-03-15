.PHONY: test-memory-leaks run-without-ffi clean

test-memory-leaks:
	valgrind --tool=memcheck --leak-check=full php memory-usage.php

run-without-ffi:
	php -n memory-usage.php

clean:
	rm -rf vendor/ composer.lock
