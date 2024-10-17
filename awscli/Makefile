.DEFAULT_GOAL := update

INSTALL_PATH := /usr/local/aws-cli
DOWNLOAD_PATH := $(shell mktemp -p $(shell mktemp -d))
DOWNLOAD_URL := https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

.PHONY: install
install: $(INSTALL_PATH)

.PHONY: uninstall
uninstall:
	sudo rm $(INSTALL_PATH)

.PHONY: update
update: uninstall install

$(INSTALL_PATH): $(DOWNLOAD_PATH)
	unzip -d $(<D) $(<)
	sudo $(<D)/aws/install
	aws --version

$(DOWNLOAD_PATH): FORCE
	curl -sL $(DOWNLOAD_URL) -o $(@)

FORCE:
