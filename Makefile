SHELL := bash
PATH := ./venv/bin:${PATH}
PYTHON=python3.7


all: test

venv:
		$(PYTHON) -m venv --prompt stpmex venv
		source venv/bin/activate
		pip install --quiet --upgrade pip

clean:
		find . -name '__pycache__' -exec rm -r "{}" +
		find . -name '*.pyc' -delete
		find . -name '*~' -delete

install-dev:
		pip install -q -e .[dev]

test: lint
		pytest -v tests.py

lint:
		pycodestyle stpmex setup.py


.PHONY: all clean install-dev test lint
