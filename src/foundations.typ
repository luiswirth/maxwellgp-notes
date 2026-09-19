#import "setup.typ": *
#import "@preview/fletcher:0.5.8": diagram, node, edge
#show: setup.with(title: "Foundations")

// The two symbols, at a fixed wave covector.
#let extdk = $ft(extd)$
#let intdk = $ft(intd)$

#let rule-table(columns: 2, align: left, ..cells) = std.align(center, table(
  columns: columns,
  align: align,
  stroke: none,
  inset: (x: 0.6em, y: 0.45em),
  table.hline(),
  ..cells,
  table.hline(),
))

// A chain of objects joined by labelled arrows.
#let chain(objects, labels) = align(center, diagram(
  spacing: 3.2em,
  ..objects.enumerate().map(((i, o)) => node((i, 0), o)),
  ..labels
    .enumerate()
    .map(((i, label)) => edge((i, 0), (i + 1, 0), label, "->", label-side: left)),
))

// Both product complexes on one row: exterior arrows above, interior arrows below.
#let product-complexes(space, ext, int) = align(center, diagram(
  spacing: 2.4em,
  ..range(5).map(i => node((i, 0), space(i))),
  ..range(4).map(i => edge((i, 0), (i + 1, 0), ext, "->", bend: 30deg, label-side: left)),
  ..range(4).map(i => edge((i + 1, 0), (i, 0), int, "->", bend: 30deg, label-side: left)),
))

// The Hertz diagram. Rows are form degrees, exterior arrows go down, interior
// arrows go up. The spectral one is the same diagram with hatted objects.
#let hertz-diagram(spectral: false) = context {
  let p = palette.get()
  let o(x) = if spectral { ft(x) } else { x }
  // The field and its potentials carry the diagram, so they are set largest.
  let main(x) = text(size: 1.7em, x)
  let side(x) = text(size: 1.25em, x)
  let d = if spectral { ft(extd) } else { extd }
  let de = if spectral { ft(intd) } else { intd }
  let ext(a, b, label: d) = edge(a, b, label, "->")
  let int(a, b, label: de) = edge(a, b, label, "->")
  align(center, diagram(
    spacing: (5.2em, 2.6em),
    ..range(5).map(i => node((-1, i), text(fill: p.muted, $#i$))),
    node((1, 0), side(o($chi$))),
    node((1, 4), side($#o($chi$)^*$)),
    node((0, 1), side(o($beta$))),
    node((0, 3), side($#o($beta$)^*$)),
    node((2, 1), main(o(pot))),
    node((2, 3), main($#o(pot)^*$)),
    node((1, 2), main(o(hertz))),
    node((3, 2), main(o(field))),
    node((4, 1), side(o(current))),
    node((4, 3), side($#o(current)^*$)),
    node((3, 0), side($0$)),
    node((3, 4), side($0$)),
    node((5, 0), side($0$)),
    node((5, 4), side($0$)),
    // gauge
    ext((1, 0), (2, 1)),
    int((1, 4), (2, 3)),
    // Hertz gauge
    ext((0, 1), (1, 2)),
    int((0, 3), (1, 2)),
    // Hertz paths
    int((1, 2), (2, 1)),
    ext((1, 2), (2, 3), label: $-#d$),
    ext((2, 1), (3, 2)),
    int((2, 3), (3, 2)),
    // Lorenz
    int((2, 1), (3, 0)),
    ext((2, 3), (3, 4)),
    // Maxwell
    int((3, 2), (4, 1)),
    ext((3, 2), (4, 3)),
    // conservation
    int((4, 1), (5, 0)),
    ext((4, 3), (5, 4)),
  ))
}

#align(center)[
  #text(size: 1.6em)[Foundations]
  #v(0.5cm)
  #author
]

= Insights

- spacetime $M$, Minkowski $MM$ over $VV = RR^(1,3)$, signature $(-,+,+,+)$
- spacetime: sections $Omega^p := formsec(p, M)$, calculus
- spectral: fiber $extalg(p) (VVdualc)$, algebra

== Spectral exterior calculus

Spectral transform, plane waves $exp(iu inner(k, x))$:
$
  extd |-> extdk,
  quad
  intd |-> intdk.
$

Symbols, with the products $extp = extp_k$ and $intp = intp_(k^sharp)$:
$
  extdk = iu extp,
  quad
  intdk = -iu intp.
$

#rule-table(
  table.header([*spacetime*, section-wise], [*spectral*, fiber-wise]),
  table.hline(),
  [exterior derivative $extd$], [exterior product $extp$],
  [interior derivative $intd$], [interior product $intp$],
  [nilpotency \ $extd^2 = 0, quad intd^2 = 0$], [nilpotency \ $extp^2 = 0, quad intp^2 = 0$],
  [Poincaré lemma], [exactness lemma],
  [Hodge--Laplace \ $lapl = extd intd + intd extd$], [Hodge--Laplace \ $(k dot k) Id = extp intp + intp extp$],
  [Hodge--Dirac \ (Clifford derivative) \ $dirac = extd + intd$], [Hodge--Dirac \ (Clifford multiplication) \ $ft(dirac) = extdk + intdk$],
  [Cartan formula \ $extd intp_v + intp_v extd = +lie_v$ \ $intd extp_alpha + extp_alpha intd = -lie_(alpha^sharp)$], [pairing identity \ $extp intp_v + intp_v extp = inner(k, v) Id$ \ $intp extp_alpha + extp_alpha intp = inner(alpha, k^sharp) Id$],
  [harmonicity \ $ker lapl$], [light cone \ $k dot k = 0$],
  [$lapl^(-1)$ off harmonics], [$(k dot k)^(-1)$ off the light cone],
)

=== Exterior and interior complexes

Spacetime:
#product-complexes(i => $Omega^#i$, extd, intd)

Spectral:
#product-complexes(i => $extalg(i) (VVdualc)$, extp, intp)

#rule-table(
  table.header([*exterior complex*], [*interior complex*]),
  table.hline(),
  [raises the degree], [lowers the degree],
  [topological, metric-free], [geometric, metric-based],
  [primal de Rham complex], [dual de Rham complex],
)

Adjoint complexes via Hodge duality.

=== Antiderivatives

$h$ is an antiderivative for $partial$ if $partial h + h partial = Id$.
Potential $h xi$: $partial xi = 0 => xi = partial (h xi)$.

Spacetime:
#rule-table(
  columns: 3,
  table.header([], [*exterior*], [*interior*]),
  table.hline(),
  [no structure], [Primal Poincaré homotopy], [Dual Poincaré homotopy],
  [off harmonics \ via metric], $h = intd lapl^(-1)$, $h = extd lapl^(-1)$,
  [on harmonics \ via observer], $h = intp_(partial_t) partial_t^(-1)$, $h = extp_(extd t) partial_t^(-1)$,
)

Spectral:
#rule-table(
  columns: 3,
  table.header([], [*exterior*], [*interior*]),
  table.hline(),
  [no structure \ $k != 0$], [$h = intp_v$ \ $inner(k, v) = 1$], [$h = extp_beta$ \ $inner(beta, k^sharp) = 1$],
  [metric \ off the light cone], $h = intp slash (k dot k)$, $h = extp slash (k dot k)$,
  [observer \ $omega != 0$], $h = intp_(partial_t) slash inner(k, partial_t)$, $h = extp_(extd t) slash inner(extd t, k^sharp)$,
)

== Maxwell complex

Spacetime:
#chain(
  ($0$, $Omega^0$, $Omega^1$, $Omega^1$, $Omega^0$, $0$),
  ([], extd, $intd extd$, intd, []),
)
$
  intd extd extd = 0
  quad
  intd intd extd = 0
$

#chain(
  ($0$, $Omega^4$, $Omega^3$, $Omega^3$, $Omega^4$, $0$),
  ([], intd, $extd intd$, extd, []),
)
$
  extd intd intd = 0
  quad
  extd extd intd = 0
$

Spectral:
#chain(
  ($0$, $extalg(0)$, $extalg(1)$, $extalg(1)$, $extalg(0)$, $0$),
  ([], extp, $intp extp$, intp, []),
)
$
  intp extp extp = 0
  quad
  intp intp extp = 0
$

#chain(
  ($0$, extalg(4), extalg(3), extalg(3), extalg(4), $0$),
  ([], intp, $extp intp$, extp, []),
)
$
  extp intp intp = 0
  quad
  extp extp intp = 0
$

solutions mod gauge (position 1)
$
  (ker intd extd)/(image extd)
  quad
  (ker extd intd)/(image intd)
$

obstructions to sources (position 2)
$
  (ker intd)/(image intd extd)
  quad
  (ker extd)/(image extd intd)
$

#pagebreak(weak: true)

== Hertz diagram

Spacetime:
#hertz-diagram()
#v(1em)

Spectral:
#hertz-diagram(spectral: true)
#v(1em)

#rule-table(
  columns: 3,
  table.header([], [*spacetime*], [*spectral*]),
  table.hline(),
  [primal Hertz path], $pot = intd hertz, quad field = extd pot$, $ft(pot) = intdk ft(hertz), quad ft(field) = extdk ft(pot)$,
  [dual Hertz path], $pot^* = -extd hertz, quad field = intd pot^*$, $ft(pot)^* = -extdk ft(hertz), quad ft(field) = intdk ft(pot)^*$,
  [paths agree], $lapl hertz = 0$, $(k dot k) ft(hertz) = 0$,
  [generator], [Hertz operator \ $hertzop = extd intd$], [polarization operator \ $P = extdk intdk$],
  [primal Maxwell], $extd field = 0$, $extdk ft(field) = 0$,
  [dual Maxwell], $intd field = 0$, $intdk ft(field) = 0$,
  [primal Lorenz], $intd pot = 0$, $intdk ft(pot) = 0$,
  [dual Lorenz], $extd pot^* = 0$, $extdk ft(pot)^* = 0$,
  [primal gauge], $pot + extd chi, quad lapl chi = 0$, $ft(pot) + extdk ft(chi), quad (k dot k) ft(chi) = 0$,
  [dual gauge], $pot^* + intd chi^*, quad lapl chi^* = 0$, $ft(pot)^* + intdk ft(chi)^*, quad (k dot k) ft(chi)^* = 0$,
  [primal Hertz gauge], $hertz + extd beta, quad lapl beta = 0$, $ft(hertz) + extdk ft(beta), quad (k dot k) ft(beta) = 0$,
  [dual Hertz gauge], $hertz + intd beta^*, quad lapl beta^* = 0$, $ft(hertz) + intdk ft(beta)^*, quad (k dot k) ft(beta)^* = 0$,
  [primal current], $current = intd field$, $ft(current) = intdk ft(field)$,
  [dual current], $current^* = extd field$, $ft(current)^* = extdk ft(field)$,
  [primal conservation], $intd current = 0$, $intdk ft(current) = 0$,
  [dual conservation], $extd current^* = 0$, $extdk ft(current)^* = 0$,
)

- source-free: $current = current^* = 0$
- primal Maxwell complex along the top, $chi -> pot -> current -> 0$, dual Maxwell complex along the bottom
- $hodge$ reflects the diagram, degree $p <-> 4 - p$

== Polarization space

$
  image P = ker extp inter ker intp inter extalg(2) (VVdualc),
  quad
  P = extdk intdk = extp intp = -intp extp,
  quad
  dim image P = 2.
$

#rule-table(
  columns: 3,
  table.header([*reading*], [*space*], [*count*]),
  table.hline(),
  [primal Maxwell homology \ via $extp$], $(ker intp inter extalg(1) (VVdualc)) / (extp extalg(0) (VVdualc))$, $4 - 1 - 1$,
  [dual Maxwell homology \ via $intp$], $(ker extp inter extalg(3) (VVdualc)) / (intp extalg(4) (VVdualc))$, $4 - 1 - 1$,
  [Hertz gauge quotient \ via $P$], $extalg(2) (VVdualc) / (extp extalg(1) (VVdualc) + intp extalg(3) (VVdualc))$, $6 - 4$,
)

Polarization theorem:
$
  extp (ker intp inter extalg(1) (VVdualc))
  = image P =
  intp (ker extp inter extalg(3) (VVdualc)).
$

#rule-table(
  columns: 3,
  table.header([*complexes*], [*off the light cone*], [*on the light cone*]),
  table.hline(),
  [exterior \ interior], [exact \ metric antiderivative], [exact \ observer antiderivative],
  [primal Maxwell \ dual Maxwell], [exact \ metric antiderivative], [homology $image P$ \ no antiderivative],
)

Geometry, $k$ real:
- induced $2$-form metric vanishes, totally null: $inner(k and alpha, k and beta) = (k dot k)(alpha dot beta) - (k dot beta)(alpha dot k) = 0$
- positive form, observer-free: $inner(k and alpha, k and beta)_k := alpha dot beta$ on $k^perp slash angled(k)$
- energy density $1/2 (Efield^2 + Bflux^2) = omega^2 alpha dot alpha$: observer only a scale
- $hodge image P = image P$, $hodge^2 = -Id$: complex structure, helicities as $plus.minus iu$ eigenlines

== Outlook

_DISCLAIMER: This is exploratory and has not been fully verified._

Spectral representation without Ehrenpreis--Palamodov, tempered solutions:
+ $dirac field = 0 => ft(dirac) ft(field) = 0$
+ $ft(dirac)^2 = (k dot k) Id => (k dot k) ft(field) = 0 => supp ft(field) subset.eq lightcone$
+ $ft(field)(k) in image P(k)$
+ $ft(hertz)(k) = h h ft(field)(k)$, antiderivatives from an observer, $omega != 0$

Scope: tempered, real $k$. Ehrenpreis--Palamodov: convex domains, complex $k$.

Representation on the polarization bundle, no Hertz components:
$
  field(x) = integral_lightcone exp(iu inner(k, x)) a(k) dif mu(k),
  quad
  a(k) in image P(k).
$

Coordinate-free kernel:
$
  K(x, x') = integral_lightcone exp(iu inner(k, x - x')) S(k) dif mu(k),
  quad
  S(k) = Id_(image P(k)) "w.r.t." inner(dot, dot)_k,
  quad
  mu "uniform on" lightcone_omega.
$

- standard Gaussian Hertz potential pushed through $P$: same prior up to scale, checked numerically
- the observer enters only through $omega$

#pagebreak()

= Appendix

#[
  #set heading(offset: 1)
  #include "contracting-homotopy.typ"
]
