# Translation for CommonMark Specification

This directory contains translations of the CommonMark specification.
To work on the translation workflow, you need the following software
installed.

* POSIX-compatible shell
* `patch` command
* Lua (as required by the CommonMark spec)
* LuaRocks (as required by the CommonMark spec)
  * lcmark LuaRock (as required by the CommonMark spec, including the
    cmark library)
  * lyaml LuaRock (as an indirect requirement, including the libyaml
    library)
  * Note: You can install these with the script
    `translation/bin/install`.
* po4a
* GNU gettext (especially `msgcat` and `msginit`)
* GNU Make (as required by the CommonMark spec)

To add your language, follow the steps below. Assuming your language
code is `$LANG`:

* Add `$LANG` to the line starting with `set --` in
  `translation/bin/translate`. E.g. `set -- ja $LANG`
* Add a gettext PO file at `translation/po.refs/$LANG.po`.
* Add a gettext PO file at `translation/po/$LANG.po`.
* Add an entry for your language in `translation/po4a.cfg` between `#
  Spec begin ...` and `# Spec end ...`
* Add `translation/src/make_spec.lua.$LANG.patch`
* Add `translation/addendum/credit.$LANG.md`
* Update the Git ignore entries in `translation/.gitignore`
* Run `./translation/bin/translate` to update
  `translation/po/$LANG.po`
* Translate!  Edit `translation/po/$LANG.po` and
  `translation/po.refs/$LANG.po`, then run
  `./translation/bin/translate`.  Repeat until no errors occur.
* (Optional) Add or update `translation/doc/CHANGELOG.$LANG.md`

Note that when initializing a gettext PO file, you should use the
`msginit` tool.
