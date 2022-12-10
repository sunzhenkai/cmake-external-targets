.PHONY: clean

clean:
	@rm -rf /tmp/cpp-external-*
	@rm -rf cmake-build-*

remove-prefix:
	@rm -rf /tmp/cpp-external-prefix