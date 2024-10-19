.DEFAULT_GOAL := update

BIN_DIR := /usr/local/bin
INSTALL_DIR := /usr/local/aws-cli
UNARCHIVE_DIR := $(shell mktemp -d)

AWS := $(BIN_DIR)/aws
AWS_COMPLETER := $(BIN_DIR)/aws_completer
INSTALLER := $(UNARCHIVE_DIR)/aws/install

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

$(INSTALL_DIR): $(INSTALLER)
	sudo $(<)

$(INSTALLER): $(PACKAGE)
	unzip -d $(UNARCHIVE_DIR) $(<)

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
