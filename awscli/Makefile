.DEFAULT_GOAL := update

SYMLINKS := /usr/local/bin/aws /usr/local/bin/aws_completer
INSTALL_DIR := /usr/local/aws-cli
INSTALLER := $(shell mktemp -d)
PACKAGE_SOURCE_URL := https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(INSTALL_DIR)

.PHONY: uninstall
uninstall:
	sudo rm -r $(INSTALL_DIR) $(SYMLINKS)

.PHONY: update
update: uninstall install

$(INSTALL_DIR): $(INSTALLER)
	sudo $(<)/aws/installer
	$(@)/v2/current/bin/aws --version

$(INSTALLER): $(PACKAGE)
	unzip -d $(@) $(<)

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
