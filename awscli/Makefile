.DEFAULT_GOAL := update

BIN_DIR := /usr/local/bin
AWS := $(BIN_DIR)/aws
AWS_COMPLETER := $(BIN_DIR)/aws_completer
INSTALL_DIR := /usr/local/aws-cli
INSTALLER_DIR := $(shell mktemp -d)
PACKAGE_SOURCE_URL := https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(AWS) $(AWS_COMPLETER)

.PHONY: uninstall
uninstall:
	sudo rm -r $(AWS) $(AWS_COMPLETER) $(INSTALL_DIR)

.PHONY: update
update: uninstall install

$(AWS): $(INSTALL_DIR)
	$(@) --version

$(AWS_COMPLETER): $(INSTALL_DIR)

$(INSTALL_DIR): $(INSTALLER_DIR)
	sudo $(<)/aws/installer

$(INSTALLER_DIR): $(PACKAGE)
	unzip -d $(@) $(<)

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
