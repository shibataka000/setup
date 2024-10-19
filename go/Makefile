.DEFAULT_GOAL := update

GOROOT := /usr/local/go
VERSION := $(shell curl -sL https://go.dev/dl/?mode=json | jq -r 'map(select(.stable)) | first | .version')
PACKAGE_SOURCE_URL := https://go.dev/dl/$(VERSION).linux-amd64.tar.gz
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(GOROOT)

.PHONY: uninstall
uninstall:
	sudo rm -r $(GOROOT)

.PHONY: update
update: uninstall install

$(GOROOT): $(PACKAGE)
	sudo tar -C $(@D) -xzf $(<)
	$(@)/bin/go version

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
