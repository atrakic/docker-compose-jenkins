SHELL := /bin/bash

.PHONY: help 
help:
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

run: up ## Run images
	@echo run

stop: down ## Stop images
	@echo stop

up:
	@docker-compose up -d

down:
	@docker-compose down

build: build-jenkins-master build-jenkins-slave ## Build images
	@echo building

build-jenkins-master:
	cd docker/master && docker build -t jenkins-master .

build-jenkins-slave:
	cd docker/slave && docker build -t jenkins-slave .
