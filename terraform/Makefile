.DEFAULT_GOAL := install

VERSION := $(patsubst v%,%,$(shell gh release list -R hashicorp/terraform -q .[0].tagName --json tagName --exclude-drafts --exclude-pre-releases -L 1))
INSTALL_PATH := /usr/local/bin/terraform
DOWNLOAD_PATH := $(shell mktemp)
DOWNLOAD_URL := https://releases.hashicorp.com/terraform/$(VERSION)/terraform_$(VERSION)_linux_amd64.zip

.PHONY: install
install: $(INSTALL_PATH)

$(INSTALL_PATH): $(DOWNLOAD_PATH)
	sudo unzip -o -d $(@D) $(<) $(@F)
	$(@) version

$(DOWNLOAD_PATH): FORCE
	curl -sL $(DOWNLOAD_URL) -o $(@)

.PHONY: uninstall
uninstall:
	sudo rm $(INSTALL_PATH)

FORCE:
