.PHONY: memory run-without-ffi clean

memory:
	valgrind --tool=memcheck --leak-check=full php memory-usage.php

run-without-ffi:
	php -n memory-usage.php

clean:
	rm -rf vendor/ composer.lock
