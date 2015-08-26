V=20150826

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 archstrike{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/archstrike{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=archstrike-keyring-$(V)/ $(V) | gzip -9 > archstrike-keyring-$(V).tar.gz
	gpg --detach-sign --use-agent archstrike-keyring-$(V).tar.gz

.PHONY: install uninstall dist
