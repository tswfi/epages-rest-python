init: install_pipenv
	pipenv --three
	make install_dependencies

init2: install_pipenv
	pipenv --two
	make install_dependencies

install_pipenv:
	pip install pipenv

install_dependencies:
	pipenv install requests
	pipenv install six
	pipenv install --dev pytest

test:
	@pipenv run pytest \
	|| (echo "Test(s) failed. Did you install the requirements and set the \
	environment variables (run_tests.sh.template)?")

.PHONY: init init2 install_pipenv install_dependencies test
