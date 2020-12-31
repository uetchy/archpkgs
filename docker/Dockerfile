FROM archlinux:base-devel

RUN pacman -Syuq --noconfirm --needed git rust go python python-dephell && rm -rf /var/cache/pacman/pkg/*
COPY makepkg.sh /makepkg.sh
COPY sudoers /etc/sudoers
RUN useradd -d /build build-user
WORKDIR /build
RUN chown build-user:build-user /build
USER build-user
ENTRYPOINT ["/makepkg.sh"]