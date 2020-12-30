TARGETS := all clean publish build
PKGBASE := $(wildcard */)
.PHONY: $(TARGETS) $(PKGBASE)

all: clean $(PKGBASE)

clean:
	rm -rf */{pkg,src,*.zst,*.tar.gz}

$(PKGBASE):
	echo Building $@
	docker run --rm -v "$(CURDIR)/$@:/build" -it ghcr.io/uetchy/makepkg

# for maintainers
build:
	docker build -t ghcr.io/uetchy/makepkg .

publish: build
	docker push ghcr.io/uetchy/makepkg