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
#let current = $frak(J)$
#let hertz = $italic(Pi)$
#let Efield = $cal(E)$
#let Bflux = $cal(B)$

// The spaces, operators and symbols of the paper, as its macros define them.
#let MM = $bb(M)$
#let VV = $bb(V)$
#let VVdualc = $bb(V)^*_bb(C)$
#let lightcone = $cal(C)$
#let formsec(p, m) = $Gamma(Lambda^#p upright(T)^* #m)$
#let formalg(p, v) = $Lambda^#p (#v)$
#let iu = $upright(i)$
#let extd = dif
#let intd = codif
#let extp = $upright(epsilon)$
#let intp = $upright(iota)$
#let dirac = $upright(D)$
#let hertzop = $upright(H)$
#let ft(a) = $hat(#a)$
#let image = math.op("Im")

#let setup = notes-document.with(
  title: title,
  author: author,
  colors: light-theme,
  fonts: serif-fonts,
)
