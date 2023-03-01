.PHONY: all clean install uninstall FORCE
all: .mintty/themes/base16-solarized-dark.minttyrc

.mintty/themes/base16-solarized-dark.minttyrc: base16-mintty/mintty/base16-solarized-dark.minttyrc
	mkdir -p .mintty/themes
	cp $< .mintty/themes

base16-mintty/%: FORCE
	[ -d base16-mintty ] \
		&& (cd base16-mintty && git pull) \
		|| git clone https://github.com/iamthad/base16-mintty.git

clean:
	rm -rf .mintty base16-mintty

install: .minttyrc
	cp .minttyrc ~/.minttyrc
	cp -r .mintty ~/

uninstall:
	rm ~/.minttyrc
	cp -r ~/.mintty

FORCE:
