// The one place the library is imported, and the one place this document says
// how it departs from it. Every file of the document imports this one.

#import "@local/dottyp:0.1.0": *

// The single-letter vector shorthands, which the glob deliberately leaves out.
#import aliases: *

// Named here, since the title block reads them too and the two must not drift
// apart.
#let title = "MaxwellGP notes"
#let author = "Luis Wirth"

// The electromagnetic objects of the paper, named as the manuscript names them.
#let field = $frak(F)$
#let pot = $frak(A)$
#let hertz = $Pi$

#let setup = notes-document.with(
  title: title,
  author: author,
  colors: light-theme,
  fonts: serif-fonts,
)
