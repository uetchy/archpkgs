FROM archlinux:base-devel

# https://www.reddit.com/r/archlinux/comments/lek2ba/arch_linux_on_docker_ci_could_not_find_or_read/go4cp0p?utm_source=share&utm_medium=web2x&context=3
RUN curl -fsSL "https://repo.archlinuxcn.org/x86_64/glibc-linux4-2.33-4-x86_64.pkg.tar.zst" | bsdtar -C / -xf -

RUN pacman -Syuq --noconfirm --needed git rust go python python-dephell && rm -rf /var/cache/pacman/pkg/*
COPY makepkg.sh /makepkg.sh
COPY sudoers /etc/sudoers
RUN useradd -d /build build-user
WORKDIR /build
RUN chown build-user:build-user /build
USER build-user
ENTRYPOINT ["/makepkg.sh"]