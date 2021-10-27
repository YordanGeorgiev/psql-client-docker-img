# Makefile
# usage: run the "make" command in the root, than make <<cmd>>...
include $(wildcard lib/make/*.mk)

SHELL = bash
PRODUCT := $(shell basename $$PWD)


.PHONY: install  ## @-> setup the whole local devops environment (alias)
install: install-psql-client-docker-img


.PHONY: install-psql-client-docker-img  ## @-> setup the whole local psql-client-docker-img environment
install-psql-client-docker-img:
	$(call install-img,psql-client-docker-img,80)


.PHONY: install-psql-client-docker-img-no-cache ## @-> setup the application layer running image NO caching
install-psql-client-docker-img-no-cache: component = psql-client-docker-img
install-psql-client-docker-img-no-cache: exposed_port = 3000
install-psql-client-docker-img-no-cache: demand_var-ENV demand_var-TGT_ORG do-build-$(component)-docker-img-no-cache do-start-$(component)-container


install-$(component)-no-cache: demand_var-ENV demand_var-TGT_ORG do-build-$(component)-docker-img-no-cache do-start-$(component)-container


.PHONY: do-build-$(component)-docker-img-no-cache ## @-> build the $(component) docker image, NO docker caching
do-build-$(component)-docker-img-no-cache: demand_var-ENV demand_var-TGT_ORG
	@clear
	docker build . -t ${PRODUCT}-$(component)-img --no-cache \
		--build-arg UID=$(shell id -u) \
		--build-arg GID=$(shell id -g) \
		--build-arg ENV=$(ENV) \
		--build-arg PRODUCT=${PRODUCT} \
		-f src/docker/$(component)/Dockerfile


