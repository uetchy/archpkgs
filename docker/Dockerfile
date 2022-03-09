FROM archlinux:base-devel

# RUN pacman -Syuq --noconfirm --needed git rust go python python-dephell && rm -rf /var/cache/pacman/pkg/*
RUN pacman -Syuq --noconfirm git reflector
RUN reflector --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist --verbose

COPY makepkg.sh /makepkg.sh
COPY sudoers /etc/sudoers
RUN useradd -d /build build-user
WORKDIR /build
RUN chown build-user:build-user /build
USER build-user
CMD ["/makepkg.sh"]
