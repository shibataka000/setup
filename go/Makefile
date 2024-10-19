.DEFAULT_GOAL := update

GOROOT := /usr/local/go
GO := $(GOROOT)/bin/go
VERSION := $(shell curl -sL https://go.dev/dl/?mode=json | jq -r 'map(select(.stable)) | first | .version')
PACKAGE_SOURCE_URL := https://go.dev/dl/$(VERSION).linux-amd64.tar.gz
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(GO)

.PHONY: uninstall
uninstall:
	sudo rm -r $(GOROOT)

.PHONY: update
update: uninstall install

$(GO): $(GOROOT)
	$(@) version

$(GOROOT): $(PACKAGE)
	sudo tar -C $(@D) -xzf $(<)

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
