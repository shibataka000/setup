.DEFAULT_GOAL := update

KUBECTL := /usr/local/bin/kubectl
VERSION := $(shell curl -sL https://dl.k8s.io/release/stable.txt)
PACKAGE_SOURCE_URL := https://dl.k8s.io/release/$(VERSION)/bin/linux/amd64/kubectl
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(KUBECTL)

.PHONY: uninstall
uninstall:
	sudo rm $(KUBECTL)

.PHONY: update
update: uninstall install

$(KUBECTL): $(PACKAGE)
	sudo cp $(<) $(@)
	sudo chmod +x $(@)
	$(@) version --client=true

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
