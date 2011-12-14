
#include ../../Makeconf

PKG_FILES = COPYING DESCRIPTION $(wildcard INDEX) $(wildcard PKG_ADD) \
	$(wildcard PKG_DEL) $(wildcard post_install.m) \
	$(wildcard pre_install.m)  $(wildcard on_uninstall.m) \
	$(wildcard inst/*) $(wildcard src/*) $(wildcard doc/*) \
	$(wildcard bin/*)


build:
	cd ./src; make

clean:
	cd ./src; make clean
test:
	cd ./src; make test

pre-pkg/%::
	# Do nothing prior to packaging


post-pkg/%::
	# Do nothing post packaging
