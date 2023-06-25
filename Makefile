.PHONY: clean

clean:
	@rm -rf /tmp/cpp-external-*
	@rm -rf cmake-build-*

remove-prefix:
	@rm -rf /tmp/cpp-external-prefix

install-dependencies:
	@bash scripts/install_dependencies.sh

resolve:
	@bash scripts/install_dependencies.sh