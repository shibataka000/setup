.DEFAULT_GOAL := update

BIN := /usr/local/bin/terraform
VERSION := $(patsubst v%,%,$(shell gh release list -R hashicorp/terraform -q .[0].tagName --json tagName --exclude-drafts --exclude-pre-releases -L 1))
PACKAGE_SOURCE_URL := https://releases.hashicorp.com/terraform/$(VERSION)/terraform_$(VERSION)_linux_amd64.zip
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(BIN)

.PHONY: uninstall
uninstall:
	sudo rm $(BIN)

.PHONY: update
update: uninstall install

$(BIN): $(PACKAGE)
	sudo unzip -q -o -d $(@D) $(<) $(@F)
	$(@) version

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
