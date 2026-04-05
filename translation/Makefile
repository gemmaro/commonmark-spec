PO4A ?= po4a
outdir	:=	ja

all: ${outdir}/spec.txt \
		ja/Makefile \
		ja/tools/template.html \
		ja/tools/make_spec.lua \
		refs.ja.yaml
	${MAKE} --directory ja spec.html
.PHONY: all

ja/tools/make_spec.lua: ../tools/make_spec.lua
	mkdir -p $(dir $@)
	cp $< $@

ja/tools/template.html: ../tools/template.html
	mkdir -p $(dir $@)
	cp $< $@

ja/Makefile: ../Makefile
	ln $< $@

${outdir}/spec.txt: po/ja.po po/en.pot po4a.cfg
	${MAKE} translate

translate: credit.md
	cp ../spec.txt spec.txt
	lua ../tools/make_spec.lua refblock < ../spec.txt >> spec.txt
	$(PO4A) po4a.cfg
.PHONY: translate

po/en.pot:
	touch $@

refs.ja.yaml: refs.translatable.yaml po/ja.po
	./generate-translated-refs > $@

refs.translatable.yaml: refs.yaml
	./generate-translatable-refs < $< > $@

refs.yaml: ../spec.txt
	lua ../tools/make_spec.lua refyaml < $< > $@
