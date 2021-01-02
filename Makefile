TARGETS := all clean publish rebuild
PKGBASE := $(wildcard pkgs/*)
.PHONY: $(TARGETS) $(PKGBASE)

all: clean $(PKGBASE)

clean:
	sudo rm -rf pkgs/*/{pkg,src,*.zst,*.tar.gz,.cache,.bash_history}

$(PKGBASE):
	docker run --rm -v "$(CURDIR)/$@:/build" -it ghcr.io/uetchy/makepkg $$CMD

# for maintainers
rebuild:
	docker build --no-cache -t ghcr.io/uetchy/makepkg docker

publish: rebuild
	docker push ghcr.io/uetchy/makepkg
