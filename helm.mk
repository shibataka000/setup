.DEFAULT_GOAL := update

BIN := /usr/local/bin/helm
VERSION := $(shell gh release list -R helm/helm -q .[0].tagName --json tagName --exclude-drafts --exclude-pre-releases -L 1)
PACKAGE_SOURCE_URL := https://get.helm.sh/helm-$(VERSION)-linux-amd64.tar.gz
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(BIN)

.PHONY: uninstall
uninstall:
	sudo rm $(BIN)

.PHONY: update
update: uninstall install

$(BIN): $(PACKAGE)
	sudo tar -C $(@D) -xzf $(<) linux-amd64/helm --strip-components 1
	$(@) version

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
