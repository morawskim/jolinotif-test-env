.PHONY: memory run-without-ffi

memory:
	valgrind --tool=memcheck --leak-check=full php memory-usage.php

run-without-ffi:
	php -n memory-usage.php
