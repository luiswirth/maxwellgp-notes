#import "setup.typ": *
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.3.4"

= Contracting Homotopy <contracting-homotopy>

== Chain homotopy

$
  f - g = partial h + h partial
$

#align(center, diagram(
  spacing: (4.2em, 2.6em),
  node((0, 0), $A^0$),
  node((1, 0), $A^1$),
  node((0, 1), $B^0$),
  node((1, 1), $B^1$),
  edge((0, 0), (1, 0), $partial$, "->", label-side: left),
  edge((0, 1), (1, 1), $partial$, "->", label-side: right),
  edge((0, 0), (0, 1), $f$, "->", shift: -3pt, label-side: right),
  edge((0, 0), (0, 1), $g$, "->", shift: 3pt, label-side: left),
  edge((1, 0), (1, 1), $f$, "->", shift: -3pt, label-side: right),
  edge((1, 0), (1, 1), $g$, "->", shift: 3pt, label-side: left),
  edge((1, 0), (0, 1), $h$, "->", label-side: right),
))

- continuous homotopy of maps induces a chain homotopy
- contracting: $f = Id$, $g = 0$, so $partial h + h partial = Id$
- contracting homotopy $=>$ homology vanishes in positive degree

== Antiderivative

$
  partial h + h partial = Id
$

- no one-sided inverse: $partial h = Id => im partial = "all" => ker partial = "all" => partial = 0$
- $partial^2 = 0 => rank partial <= dim ker partial$
- splitting: $(partial h)^2 = partial h$, $(h partial)^2 = h partial$, $partial h + h partial = Id$
- $h$ inverts $partial$ from the right on $im partial h$, from the left on $im h partial$

Potential:
$
  partial xi = 0 => xi = partial (h xi).
$

- $h$ antiderivative, $h xi$ potential
- constructive Poincaré lemma

== Fundamental theorem of calculus

Poincaré homotopy on a star-shaped domain:
$
  (h omega)(x) = integral_0^1 intp_X omega|_(t x) dif t.
$

On $RR$:
#align(center, table(
  columns: 3,
  align: (center, left, left),
  stroke: none,
  inset: (x: 1.0em, y: 0.4em),
  table.hline(),
  table.header([degree], [term], [reading]),
  table.hline(),
  [1], $extd h$, $extd integral_0^x f = f extd x$,
  [0], $h extd$, $integral_0^x f' = f(x) - f(0)$,
  table.hline(),
))

- two halves of the fundamental theorem, one per degree
- degree zero: $extd h + h extd = Id - f(0)$, constant of integration $= H^0$
- Stokes: the adjoint generalization, this one: the antiderivative generalization

== Antiderivative is a transversal

Pairing identity:
$
  extp_alpha intp_v + intp_v extp_alpha = inner(alpha, v) Id
$

- $inner(alpha, v) = 1$: $intp_v$ antiderivative for $extp_alpha$, $extp_alpha$ antiderivative for $intp_v$
- metric-free

#align(center, context {
  let p = palette.get()
  cetz.canvas({
    import cetz.draw: *
    line((-2.2, 0), (2.2, 0), stroke: 0.5pt + p.muted)
    line((-2.2, 1.3), (2.2, 1.3), stroke: 0.5pt + p.muted)
    line((0, 0), (0.85, 1.3), stroke: 0.8pt + p.fg, mark: (end: "stealth", fill: p.fg))
    content((-0.22, -0.26), text(size: 8pt)[$O$])
    content((0.28, 0.78), text(size: 8pt)[$v$])
    content((1.75, -0.26), text(size: 8pt)[$ker alpha$])
    content((1.8, 1.56), text(size: 8pt)[$alpha = 1$])
  })
})

- $VV = ker alpha dsum span{v}$
- choosing an antiderivative = choosing a complement to $ker alpha$
- $extp_alpha intp_v$ projector, Hodge projectors as instances
- observer transversal: $partial_t$, not $(extd t)^sharp = -partial_t$, pairing needs no metric

*Open.*
- $extp intp_(partial_t) slash inner(k, partial_t)$ is idempotent, projects onto $im extp$, dimension 3 in degree 2
- projector onto the polarization space from the observer: combine with the interior mirror?
