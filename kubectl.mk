.DEFAULT_GOAL := update

BIN := /usr/local/bin/kubectl
VERSION := $(shell curl -sL https://dl.k8s.io/release/stable.txt)
PACKAGE_SOURCE_URL := https://dl.k8s.io/release/$(VERSION)/bin/linux/amd64/kubectl

.PHONY: install
install: $(BIN)

.PHONY: uninstall
uninstall:
	sudo rm $(BIN)

.PHONY: update
update: uninstall install

$(BIN): $(PACKAGE)
	sudo curl -sL $(PACKAGE_SOURCE_URL) -o $(@)
	sudo chmod +x $(@)
	$(@) version --client

FORCE:
