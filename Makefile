build:
	elm make src/Main.elm --output elm.js

watch:
	-$(MAKE) build
	fswatch src/*.elm | \
	while read f; do \
	  clear; echo $f; $(MAKE) build; \
	done

browse:
	browser-sync start --server --files elm.js --startPath index.html
