

## Procedure:
## 1. make
## 2. make test
## 3. octave -q --verbose --eval ' pkg install rainflow-octave-1.0.2.tar.gz'
##############################################################################

VERSION ?=1.0.2
PKGDIR := $(shell pwd | sed -e 's|^.*/||')
PACKAGE ?= ./$(PKGDIR)-$(VERSION).tar.gz

.PHONY: test


all: 	build package

build:
	cd ./src; make

package: build
	@cd ..; tar --exclude-vcs -czf $(PACKAGE) $(PKGDIR); \
	echo -e "Created GNU Octave package file: $(PACKAGE)"; \
	echo -e "Install: $$ octave -q --verbose --eval ' pkg install .$(PACKAGE)'"; \
	echo -e "Test:    $$ octave -q --eval 'rfctest'"; \

clean:
	cd ./src; make clean
test:
	cd ./src; make test

