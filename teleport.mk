.DEFAULT_GOAL := update

TSH := /usr/local/bin/tsh
VERSION := $(shell gh release list -R gravitational/teleport -q .[0].tagName --json tagName --exclude-drafts --exclude-pre-releases -L 1)
PACKAGE_SOURCE_URL := https://cdn.teleport.dev/teleport-$(VERSION)-linux-amd64-bin.tar.gz
PACKAGE := $(shell mktemp)

.PHONY: install
install: $(TSH)

.PHONY: uninstall
uninstall:
	sudo rm $(TSH)

.PHONY: update
update: uninstall install

$(TSH): $(PACKAGE)
	sudo tar -C $(@D) -xzf $(<) teleport/tsh --strip-components 1
	$(@) version

$(PACKAGE): FORCE
	curl -sL $(PACKAGE_SOURCE_URL) -o $(@)

FORCE:
