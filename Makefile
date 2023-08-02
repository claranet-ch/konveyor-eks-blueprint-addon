#!/bin/bash

# Libraries
TSC := node node_modules/.bin/tsc
ESLINT := node node_modules/.bin/eslint
COPY := node node_modules/.bin/copyfiles
THIS_FILE := $(lastword $(MAKEFILE_LIST))

deps:
	npm install

build:
	rm -rf dist 
	@$(MAKE) -f $(THIS_FILE) compile

compile:
	$(TSC)
	@$(MAKE) -f $(THIS_FILE) copyfiles

copyfiles:
	$(COPY) "src/**/*.yaml" "src/**/*.ytpl" "dist/" -u 1 -V -E