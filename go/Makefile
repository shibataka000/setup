.DEFAULT_GOAL := update

VERSION := $(shell curl -sL https://go.dev/dl/?mode=json | jq -r 'map(select(.stable)) | first | .version')
INSTALL_PATH := /usr/local/go
DOWNLOAD_PATH := $(shell mktemp)
DOWNLOAD_URL := https://go.dev/dl/$(VERSION).linux-amd64.tar.gz

.PHONY: install
install: $(INSTALL_PATH)

.PHONY: uninstall
uninstall:
	sudo rm -r $(INSTALL_PATH)

.PHONY: update
update: uninstall install

$(INSTALL_PATH): $(DOWNLOAD_PATH)
	sudo tar -C $(@D) -xzf $(<)
	go version

$(DOWNLOAD_PATH): FORCE
	curl -sL $(DOWNLOAD_URL) -o $(@)

FORCE:
