.PHONY: install clean build test release

export PATH := $(shell npm bin):$(PATH)
SHELL := /bin/bash
TEST_CONFIG = NODE_ENV=test BABEL_ENV=test

install:
	npm prune
	npm install

clean:
	rm -rf lib
	rm -rf build

build: clean
	./node_modules/.bin/babel src -d lib

test: clean
	webpack
	mocha-phantomjs build/index.html

release: build
	@./release.sh
