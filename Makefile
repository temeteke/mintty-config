.PHONY: all clean install uninstall FORCE
all: .minttyrc

.minttyrc: $(wildcard minttyrc.*) mintty-colors-solarized/.minttyrc.dark
	cat $^ > .minttyrc

mintty-colors-solarized/%: FORCE
	[ -d mintty-colors-solarized ] \
		|| git clone https://github.com/mavnn/mintty-colors-solarized.git \
		&& (cd mintty-colors-solarized && git pull)

clean:
	rm -rf .minttyrc mintty-colors-solarized

install: .minttyrc
	cp .minttyrc ~/.minttyrc
		
uninstall:
	rm ~/.minttyrc

FORCE:
