deps: CRLF
	pip install -r requirements.txt; \CRLF
	pip install -r test_requirements.txt	CRLF
lint: CRLF
	flake8 hello_world test CRLF
run: CRLF
	python main.py CRLF
.PHONY: test	CRLF
test: CRLF	
	PYTHONPATH = .py.test --verbose -s