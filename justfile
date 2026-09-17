documents := "main foundations"

# Compile the documents to out/.
build:
    mkdir -p out
    for d in {{ documents }}; do typst compile src/$d.typ out/$d.pdf --root "$PWD"; done

# Recompile one document on every change.
watch document="main":
    mkdir -p out
    typst watch src/{{ document }}.typ out/{{ document }}.pdf --root "$PWD"

# Check that the documents still compile, keeping nothing.
ci:
    nix fmt -- --ci
    for d in {{ documents }}; do typst compile src/$d.typ "$(mktemp -d)/$d.pdf" --root "$PWD"; done
