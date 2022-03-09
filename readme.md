# ArchLinux PKGBUILD repository

## Cleanroom testing

Build each package within a clean built ArchLinux container on Docker.

```bash
make
```

### Test specific package

```bash
make pkgs/<pkgbase>
```

### Calculate SHASUM

```bash
curl <url.tar.gz> | shasum -a 256
```

## further readings

- [AUR submission guidelines - ArchWiki](https://wiki.archlinux.org/index.php/AUR_submission_guidelines)
