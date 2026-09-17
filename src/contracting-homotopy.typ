#import "setup.typ": *
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.3.4"

= Contracting Homotopy <contracting-homotopy>

The organizing construction behind the Hertz ansatz. Closedness alone gives
nothing; what turns a closed form into the image of an operator is an
antiderivative for that operator, and where one exists it hands back the
primitive explicitly.

== Chain homotopy

Two maps $f, g: A -> B$ of complexes are chain homotopic if there is an $h$
shifting the degree the other way with
$
  f - g = dif h + h dif.
$

#align(center, context {
  let p = palette.get()
  diagram(
    spacing: (4.2em, 2.6em),
    node((0, 0), $A^0$), node((1, 0), $A^1$),
    node((0, 1), $B^0$), node((1, 1), $B^1$),
    edge((0, 0), (1, 0), $dif$, "->", stroke: p.fg, label-side: left),
    edge((0, 1), (1, 1), $dif$, "->", stroke: p.fg, label-side: right),
    edge((0, 0), (0, 1), $f$, "->", stroke: p.fg, shift: -3pt, label-side: right),
    edge((0, 0), (0, 1), $g$, "->", stroke: p.fg, shift: 3pt, label-side: left),
    edge((1, 0), (1, 1), $f$, "->", stroke: p.fg, shift: -3pt, label-side: right),
    edge((1, 0), (1, 1), $g$, "->", stroke: p.fg, shift: 3pt, label-side: left),
    edge((1, 0), (0, 1), $h$, "->", stroke: p.accent, label-side: right),
  )
})

This is not an analogy to the topological notion, it is its image under taking
chains: a continuous homotopy between $f$ and $g$ induces exactly such an $h$.

Specializing to $f = Id$ and $g = 0$ gives the contracting homotopy,
$
  dif h + h dif = Id,
$
which says the identity is chain homotopic to the zero map. That is the
algebraic form of contractibility, and it forces the homology to vanish in
positive degree.

== Why only the sum

A one-sided inverse is impossible for any complex. If $dif h = Id$ then $dif$ is
surjective, so $im dif$ is everything; but $dif^2 = 0$ gives $im dif subset.eq
ker dif$, so $ker dif$ is everything, so $dif = 0$ and $Id = 0$. The same
argument kills $h dif = Id$.

What $dif^2 = 0$ forces is $rank dif <= dim ker dif$, hence $rank dif <= n slash 2$:
the operator kills at least half the space.

The sum is not a compromise but a splitting. From $h dif = Id - dif h$ and
$dif^2 = 0$,
$
  (dif h)(dif h) = dif (h dif) h = dif (Id - dif h) h = dif h - dif^2 h h = dif h,
$
so $dif h$ is a projector and $h dif$ its complement. On $im (dif h)$ the operator
$h$ is a right inverse of $dif$, on $im (h dif)$ it is the other way round. The
two terms describe different halves, which is why both are needed.

== The primitive

Given $xi$ with $dif xi = 0$,
$
  xi = (dif h + h dif) xi = dif (h xi) + h (dif xi) = dif (h xi),
$
so $h xi$ is the primitive, written down. We call $h$ the antiderivative and $h xi$
the primitive it produces. On a closed element the second term is empty, which is
where the genuine one-sided inverse lives.

This is the constructive path of the Poincaré lemma.

== It is the fundamental theorem of calculus

On $RR$, star-shaped about the origin, the homotopy operator of the Poincaré
lemma is contraction with the radial field integrated along the deformation,
$
  (h omega)(x) = integral_0^1 intprod_X omega|_(t x) dif t.
$
On $1$-forms $omega = f dif x$ this is $integral_0^1 f(t x) x dif t = integral_0^x f$, so $h$
is the integral from the center. On $0$-forms $h = 0$.

Reading $dif h + h dif = Id$ degree by degree:

#align(center, table(
  columns: 3, align: (center, left, left), stroke: none, inset: (x: 1.0em, y: 0.4em),
  table.hline(),
  table.header([degree], [surviving term], [what it says]),
  table.hline(),
  [1], $dif h$, $dif integral_0^x f = f dif x$,
  [0], $h dif$, $integral_0^x f' = f(x) - f(0)$,
  table.hline(),
))

Those are the two halves of the fundamental theorem of calculus, each appearing
in a different degree. That is why the sum is needed: no single degree sees both.

The degree-zero line also shows the defect. It returns $f(x) - f(0)$ and not
$f(x)$, so there
$
  dif h + h dif = Id - f(0),
$
and the leftover is the constant of integration. That leftover is $H^0$: the
ambiguity in antidifferentiation is $ker dif$ one degree down, which in degree
zero is the constants and cannot be made exact. A contracting homotopy proves
$H^p = 0$ for $p > 0$ and never $H^0 = 0$.

Note that Stokes is a different generalization of the same theorem, the one about
the adjoint pairing of $dif$ against $partial$. This one is about the
antiderivative. Neither contains the other.

== An antiderivative is a transversal

On the exterior algebra the two products are antiderivatives for each other. By
the pairing identity
$
  extprod_alpha intprod_a + intprod_a extprod_alpha = inner(alpha, a) Id,
$
so $intprod_a$ is an antiderivative for $extprod_alpha$, and $extprod_alpha$ one
for $intprod_a$, exactly when $inner(alpha, a) = 1$.

The condition is geometric and metric-free. A covector $alpha$ cuts the space
into parallel level sets $\{alpha = c\}$, of which $ker alpha$ is the one through
the origin. Asking $inner(alpha, a) != 0$ asks that $a$ leave that hyperplane:

#align(center, context {
  let p = palette.get()
  cetz.canvas({
    import cetz.draw: *
    line((-2.2, 0), (2.2, 0), stroke: 0.5pt + p.muted)
    line((-2.2, 1.3), (2.2, 1.3), stroke: 0.5pt + p.muted)
    line((0, 0), (0.85, 1.3), stroke: 0.8pt + p.accent, mark: (end: "stealth", fill: p.accent))
    content((-0.22, -0.26), text(size: 8pt)[$O$])
    content((0.28, 0.78), text(size: 8pt)[$a$])
    content((1.75, -0.26), text(size: 8pt)[$ker alpha$])
    content((1.8, 1.56), text(size: 8pt)[$alpha = 1$])
  })
})

so that $V = ker alpha dsum span\{a\}$, the normalization to one being a
rescaling. Choosing an antiderivative is choosing a complement to $ker alpha$,
the direction along which one divides by $alpha$. Many exist and nothing so far
picks one out. Note also that $extprod_alpha intprod_a$ is then a projector, and
the Hodge projectors are instances of it.

== Off the light cone the metric names one

The wave covector supplies a candidate through the metric, $a = k^sharp$, whose
pairing is $inner(k, k^sharp) = k dot k$. Off the cone, rescale:
$
  h = intprod_(k^sharp) / (k dot k) "for" extprod_k,
  quad
  h = extprod_k / (k dot k) "for" intprod_(k^sharp).
$
One object serves both complexes, so the construction is canonical there. On
sections this is Hodge theory: the anticommutator of $dif$ and $codif$ is
$lapl$, so $codif lapl^(-1)$ and $dif lapl^(-1)$ are the antiderivatives, and
$
  dif codif lapl^(-1) + codif dif lapl^(-1) = Id - H
$
with $H$ the harmonic projector. On symbols $lapl$ is multiplication by $k dot k$,
and $H$ is the restriction of spectral support to the light cone.

== On the light cone an observer must

There $k dot k = 0$, and the failure is structural rather than a removable
degeneracy:
$
  inner(k, k^sharp) = k dot k = 0
$
puts $k^sharp$ inside $ker k$ itself. The wave covector lies in its own
orthogonal complement. Everything the metric builds from $k$ alone is a multiple
of $k$, and all of them pair to zero. A transversal still exists; the metric no
longer names one. Equivalently $H = Id$ there, so the Hodge route returns nothing.

An observer names one. With the splitting covector $dif t$ and vector $partial_t$,
and $k = -omega dif t + avec(k) dot dif avec(x)$ in signature $(-,+,+,+)$,
$
  inner(k, partial_t) = -omega,
  quad
  inner(dif t, k^sharp) = omega,
$
and with the symbols $hat(dif)(k) = extprod_(ii k)$ and $hat(codif)(k) = -intprod_((ii k)^sharp)$
both anticommutators come out the same,
$
  \{hat(dif)(k), intprod_(partial_t)\} = -ii omega,
  quad
  \{hat(codif)(k), extprod_(dif t)\} = -ii omega,
$
so $intprod_(partial_t) slash (-ii omega)$ and $extprod_(dif t) slash (-ii omega)$
are the two antiderivatives. One observer serves both complexes, as the metric did
off the cone, and $-ii omega$ is the symbol of $partial_t$: inverting the
Hodge--Laplace operator is replaced by inverting a time derivative. Needs $omega != 0$,
which for a real wave covector is the same as $k != 0$.

Use $partial_t$ and not $(dif t)^sharp$. They differ, $(dif t)^sharp = -partial_t$,
and the exterior side needs only the pairing, so the sharp would add a metric
dependence the construction does not have and introduce a sign. The sharp in
$intprod_(k^sharp)$ stays, since there the metric is genuinely needed.

== The Hodge conjugate of Cartan

On sections the two anticommutators above are Cartan's magic formula and its
mirror. For a parallel vector field $X$ and parallel covector $alpha$,
$
  dif intprod_X + intprod_X dif = lie_X,
  quad
  codif extprod_alpha + extprod_alpha codif = - lie_(alpha^sharp).
$
At $(X, alpha) = (partial_t, dif t)$ both right-hand sides are $lie_(partial_t)$,
since $(dif t)^sharp = -partial_t$.

The second identity is the first conjugated by the Hodge star. Its sign is fixed
by the symbols: $\{hat(codif), extprod_alpha\} = -inner(alpha, (ii k)^sharp) = -ii (alpha dot k)$,
which is the symbol of $-lie_(alpha^sharp)$, and two constant-coefficient
first-order operators with the same symbol agree. Checked directly on $0$-forms,
where $codif(f dif t) = -g^(t t) partial_t f = partial_t f$. The minus is the same
one as $hat(codif) = -intprod$, that is the failure of the symbol map to be a
$*$-map, $partial^* = -partial$.

== What this buys

*The Hertz potential is a second primitive.* Each Maxwell equation says the field
is closed for one of the two complexes, so each gives a potential. Each gauge
condition is closedness for the other complex, so the antiderivative applies
again, and both second primitives have degree two:
$
  field -> pot -> hertz,
  quad
  field -> pot^* -> hertz'.
$
The ansatz runs these forwards as two derivatives. Running them backwards is what
shows it loses nothing.

*The Lorenz gauge is free.* Forwards, $pot = codif hertz$ gives $codif pot = codif^2 hertz = 0$.
The condition that has to be imposed on a potential is automatic on a Hertz
potential. That is why no gauge fixing is needed.

*The rank-two count is the gauge count.* The $1$-form $alpha$ reconstructed by the
antiderivative is the potential amplitude, four components; $intprod alpha = 0$ is
the Lorenz gauge, removing one; $alpha |-> alpha + c k$ is the residual gauge,
removing another, and it preserves the Lorenz condition precisely because $k$ is
null. So $4 - 1 - 1 = 2$.

== The polarization space is totally null

On the cone an admissible amplitude is $F = k and alpha$ with $alpha dot k = 0$.
For two of them the induced form on $2$-forms, a Gram determinant on
decomposables, gives
$
  inner(k and alpha, k and beta) = (k dot k)(alpha dot beta) - (k dot beta)(alpha dot k) = 0,
$
the first term dead because $k$ is null and the second because $alpha, beta perp k$.
The spacetime metric restricts to zero on the polarization space.

Physically this is the vanishing of the invariant $F dot F$ on a plane wave, that
is $|Ev| = |Bv|$. The quantity that does not vanish is the energy density
$1/2(Ev^2 + Bv^2)$, and that one is observer-dependent. So there is no
observer-free prior, for the same reason there is no observer-free energy
density.

The same $partial_t$ therefore does three jobs: it is the transversal the light
cone forces for the homotopy, the source of the positive definite spatial metric
the covariance needs, and the time direction the time-harmonic reduction already
uses.

*Open.* Building the projector onto the polarization space from the observer.
What we have is $extprod_k intprod_(partial_t) slash inner(k, partial_t)$, which
is idempotent but projects onto $im extprod_k$, three-dimensional in degree two.
The polarization space is the two-dimensional subspace of that also killed by
$intprod_(k^sharp)$. Whether combining it with its interior-side mirror works has
not been checked.

