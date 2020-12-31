TARGETS := all clean publish build
PKGBASE := $(wildcard pkgs/*)
.PHONY: $(TARGETS) $(PKGBASE)

all: clean $(PKGBASE)

clean:
	sudo rm -rf pkgs/*/{pkg,src,*.zst,*.tar.gz,.cache,.bash_history}

$(PKGBASE):
	docker run --rm -v "$(CURDIR)/$@:/build" -it ghcr.io/uetchy/makepkg $$CMD

# for maintainers
build:
	docker build -t ghcr.io/uetchy/makepkg docker

publish: build
	docker push ghcr.io/uetchy/makepkg
