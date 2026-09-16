# Compile the document to out/.
build:
    mkdir -p out
    typst compile src/main.typ out/maxwellgp-notes.pdf --root "$PWD"

# Recompile it on every change.
watch:
    mkdir -p out
    typst watch src/main.typ out/maxwellgp-notes.pdf --root "$PWD"

# Check that the document still compiles, keeping nothing.
ci:
    nix fmt -- --ci
    typst compile src/main.typ "$(mktemp -d)/maxwellgp-notes.pdf" --root "$PWD"
