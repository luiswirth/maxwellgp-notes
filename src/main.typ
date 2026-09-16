#import "setup.typ": *
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/cetz:0.3.4"
#show: setup

#align(center)[
  #text(size: 1.6em)[#title]
  #v(0.5cm)
  #author
]

= Mathematical Background

== Maxwell's Equations

Electromagnetism is governed by Maxwell's equations, which in vacuum read
$
 "Faraday's Law"& quad curl Ev = -partial_t avec(B) quad quad & div avec(D) = rho quad "Gauss' Law" \
 "Ampere-Maxwell Law"& quad curl Hvec = avec(J) + partial_t avec(D) quad quad & div avec(B) = 0 quad "Gauss' Law" \
$
closed by the constitutive relations
$
  avec(D) = epsilon_0 Ev quad quad avec(B) = mu_0 Hvec
$


Or in differential geometry using Faraday 2-form
$
  F = Ev wedge dif t + Bv
$
we can write
$
  dif F = 0
  quad quad
  dif hodge F = J
$

with Dirac operator
$
  Dif F = hodge J
$

== Algebraic Maxwell Equation & Fourier Transform


Algebraic geometry and polynomial rings.

Let $D = (partial_t, partial_x, partial_y, partial_z)$. We can represent the
source-free Maxwell's equations as a matrix differential operator $P(D)$ acting
on the 6-component vectors $u = (Bv, Ev)^transp$:
$
  P(D)u = 0
$

Under the Fourier transform we can work on the polynomial ring $CC[omega, k_x, k_y, k_z]$.
We replace derivatives with polynomial variables $partial_t |-> -i omega$ and $nabla |-> i kv$.
This yields the symobl matrix $P(-i omega, i kv)$:\
... Maxwell in fourier.


Under the Fourier transform on Minkowski space $RR^(1,3)$ with signature $(-,+,+,+)$
$
  &partial_t &&limits(|->)^cal(F) -i omega
  \
  grad = &nabla &&limits(|->)^cal(F) i kv
  \
  curl = &nabla times &&limits(|->)^cal(F) i kv times
  \
  div = &nabla dot &&limits(|->)^cal(F) i kv dot
  \
  Delta = &nabla dot nabla &&limits(|->)^cal(F) i kv dot i kv = -abs(kv)^2
$

The principal symbol is
$
  P(omega, kv) = -omega^2/c^2 + abs(kv)^2
$

The characteristic variety (light 3-cone in 4D) is
$
  Lambda = {(omega, kv) mid(|) abs(kv)^2 = omega^2/c^2}
$

== Maxwell Vector Wave Equation

Take curl of Faraday
$
  curl curl Ev = -partial_t curl avec(B)
  \
  curl curl Ev = -partial_t (mu_0 avec(J) + mu_0 epsilon_0 partial_t Ev)
  \
  (1/c^2 partial_t^2 + curl curl) Ev = -mu_0 partial_t avec(J)
$

Use
$
  curl curl = grad div - Delta
$

Gives master equation
$
  (1/c^2 partial_t^2 + grad div - Delta) Ev = -mu_0 partial_t avec(J)
$

Now use Gauss and arrive at the *Maxwell Wave Equation*
$
  square Ev = (1/c^2 partial_t^2 - Delta) Ev = -grad rho/epsilon_0 - mu_0 partial_t avec(J)
$

== Time-Harmonic Maxwell's Equations

$
  Ev (t, xv) = Ev(x) exp(i omega_0 t)
$

We pass to time-harmonic fields of angular frequency $omega$ under the
$e^(-i omega t)$ convention, so that $partial_t$ acts as $-i omega$. In a
source-free region the two curl equations become
$
  curl Ev = i omega B quad quad curl Hvec = -i omega D
$
Eliminating the magnetic field by taking the curl of the first equation yields
the time-harmonic curl--curl equation
$
  curl curl Ev - k^2 Ev = 0 quad quad k := omega sqrt(epsilon_0 mu_0) = omega / c
$ <eq:curlcurl>

The electric field is divergence-free, $div Ev = 0$. The identity
$
  curl curl = grad div - Delta
$
then reduces the curl--curl equation to the vector Helmholtz equation
$
  Delta Ev + k^2 Ev = 0
$
so each Cartesian component solves the scalar Helmholtz equation, the starting
point for the plane-wave representations of later sections.

Principal symbol
$
  P(kv) = -abs(k)^2 + k_0^2
$

Characteristic Variety (2-Sphere in 3D)
$
  Lambda = {kv | abs(kv)^2 = k_0^2} = k_0 SS^2
$

== Characteristic Variety and Plane Waves

Every solution is therefore built from transverse plane waves
$avec(a) e^(i k kn dot rv)$ with direction $kn in SS^2$ and amplitude
$avec(a) perp kn$. That such waves exhaust the solution space is the content of
the *Ehrenpreis--Palamodov principle*: for a constant-coefficient system
$P(partial) u = 0$ every solution on a convex domain is a superposition
$
  u(xv) = integral_V e^(i avec(xi) dot xv) dif mu(avec(xi))
$
of exponential modes carried by the characteristic variety
$V = {avec(xi) mid(|) det P(avec(xi)) = 0}$, an inverse Fourier transform of a measure on
$V$. In general the modes are weighted by polynomial multiplier operators that
encode the multiplicity of the variety. For the Helmholtz operator the variety
is the simple sphere, no multiplier is needed, and the principle is the classical
*Herglotz representation*
$
  Ev(rv) = integral_(SS^2) avec(a)(kn) e^(i k kn dot rv) dif kn quad quad avec(a)(kn) perp kn
$
with a tangential amplitude density $avec(a)$ on the direction sphere. The
transversality $avec(a) perp kn$ is precisely the multiplier of the Maxwell
system, selecting the two physical polarizations on the variety. The prior of the
next section is a Gaussian measure placed on exactly this density.


== Ehrenpreis--Palamodov Fundamental Principle

- Characteristic Variety
- Inverse Fourier Transform
- Superposition of Plane Waves

$
  exp(i (kv dot xv - omega t))
$

4D Frequency space
$
  (omega, k_x, k_y, k_z)
$

== Ehrenpreis--Palamodov Gaussian Processes

High-level overview of the EP-GP framework.

Replace integral with sum.
- use finite superpositions.
- use quadrature.

Put normal prior on plane wave coefficents.
-> Obtain Gaussian Process


== Fundamental Solution

The free-space response to a point source is the fundamental solution of the
Helmholtz operator,
$
  Phi(xv, zv) = 1/(4 pi) exp(i k norm(xv - zv))/norm(xv - zv)
$
which satisfies $(-Delta - k^2) Phi(dot, zv) = delta_zv$ together with the
outgoing condition at infinity.

The electric field radiated by a point dipole at $zv$ with polarization vector
$pv$ follows by applying the dyadic curl--curl operator,
$
  Ev^i (xv; zv, pv) = i/k curl_xv curl_xv (Phi(xv, zv) pv)
$
which solves the time-harmonic curl--curl equation away from the source. We work
throughout with this free-space fundamental solution. The boundary-adapted
Green's function of the cavity, which would itself satisfy the conducting-wall
condition, is a distinct object that we never form explicitly.

== Reaction-Field Problem

Let $D subset.eq RR^3$ be a bounded cavity with perfectly electrically conducting
boundary $partial D$, and let $Lambda subset.eq D$ be an interior surface on which
the sources and measurements are placed. A dipole at a point $zv in Lambda$
radiates the incident field $Ev^i$ above.

Its tangential trace on the wall induces the boundary forcing
$
  avec(h) = -nv_(partial D) times Ev^i quad "on" partial D
$
The scattered field $Ev^s: D -> CC^3$ is the response that restores the
conducting-wall condition, and satisfies the interior curl--curl problem
$
  curl curl Ev^s - k^2 Ev^s &= 0 quad "in" D \
  nv_(partial D) times Ev^s &= avec(h) quad "on" partial D
$
The total field is $Ev = Ev^i + Ev^s$, and the boundary condition above is
exactly the statement that its tangential trace vanishes on the wall,
$nv_(partial D) times Ev = 0$.

=== Tangential Traces

Two traces of a field on a surface enter the formulation: the tangential
projection $Pi_t avec(u) = nv times (avec(u) times nv)$ and the rotated
tangential trace $J avec(u) = nv times avec(u)$. The rotation $J$ acts as a
quarter turn in the tangent plane and satisfies $J^2 = -Pi_t$, so it equips the
tangential fields with a complex structure. The boundary forcing and the
measurement are both rotated traces, which is why they are related through $J$.

The measured data is the tangential trace of the scattered field on the interior
surface $Lambda$,
$
  yv(xv) = nv_Lambda (xv) times Ev^s (xv) quad quad xv in Lambda
$
where $nv_Lambda$ is the unit normal on $Lambda$. Collecting these responses over
all dipole excitations defines the reaction operator, the central object of the
benchmark.


== Boundary Element Method

Indirect Approach using Maxwell Single-Layer Operator.

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


= Physics Insights

== The Two Layers of Maxwell

Maxwell's equations decompose into a topological layer ($dif F = 0$, $dif G = J$)
requiring only the differentiable structure, and a metric layer ($G = Z_0^(-1) hodge F$)
requiring the Hodge star. The topological equations express conservation and
integrability; the metric equation encodes the medium's response. This separation
is invisible in vector calculus but manifest in forms.

== The Physical Fields as Forms

The electromagnetic field $F = Bv + Ev wedge dif t$ and excitation $G = avec(D) - Hvec wedge dif t$
are both 2-forms, with swapped decompositions. The Hodge star maps $F -> G$ by
interchanging flux-type quantities ($Lambda^2_"space"$, no $dif t$) with
circulation-type quantities ($Lambda^1_"space"$, with $dif t$), simultaneously
swapping electric $<->$ magnetic.

== Why $Ev$ Carries $dif t$ and $Bv$ Does Not

The electric field does work on charges (temporal coupling); the magnetic field
only redirects momentum without energy transfer ($avec(F)_"mag" dot avec(v) = 0$).
The $dif t$ leg in $Ev wedge dif t$ reflects this temporal coupling. Under Lorentz
boosts, $Ev$ and $Bv$ mix because the boost rotates the time direction into a
spatial direction. Only the combined 2-form $F$ is frame-independent.

== Primal vs Dual

Vectors (primal) represent directions of motion and flow -- tangent to curves.
Forms (dual) represent quantities you integrate -- measurement devices. The degree
of a form equals the dimension of what you integrate over. Force is naturally a
1-form (work $= integral_gamma f$), and $dif f$ is intrinsically a covector.
The metric converts between the two worlds; in Euclidean $RR^3$ with Cartesian
coordinates the distinction collapses, which is why vector calculus gets away
without it.

== Exterior Algebra vs Clifford Algebra

Exterior algebra: no metric, product $wedge$, rule $v wedge v = 0$.
Clifford algebra: with metric, product $dot.c$, rule $v dot.c v = g(v,v)$.
The Clifford product decomposes as $u dot.c v = g(u,v) + u wedge v$ -- it
contains the exterior product as its antisymmetric part and the inner product
as its symmetric part. Setting $g = 0$ recovers exterior algebra.

== The Hodge--Dirac Operator

The Hodge--Dirac operator $D = dif + delta$ acts on differential forms.
The exterior derivative $dif$ (grade-raising, metric-free) and codifferential
$delta$ (grade-lowering, metric-dependent) are nilpotent individually
($dif^2 = 0$, $delta^2 = 0$), but their combination squares to the Hodge
Laplacian $D^2 = Delta$. The symbol $sigma_D(k) = i(k wedge (dot.c) + iota_(k^sharp)(dot.c))$
is Clifford multiplication by $k$, and $sigma_D(k)^2 = -g(k,k)$ is the defining
Clifford relation. The full Maxwell system unifies into $D F = 0$.

== The Potential Hierarchy

Each level of potential arises from the Poincare lemma applied one more time:
$
  avec(Pi) in Lambda^2
  limits(->)^delta
  avec(A) in Lambda^1
  limits(->)^dif
  F in Lambda^2
  limits(->)^(Z_0^(-1) hodge)
  G in Lambda^2
  limits(->)^dif
  J in Lambda^3
$

Gauge freedom $avec(A) |-> avec(A) + dif chi$ is a consequence of $dif^2 = 0$.
The Lorenz gauge $delta avec(A) = 0$ makes $avec(A)$ coclosed, allowing
$avec(A) = delta avec(Pi)$. The Hertz potential $avec(Pi)$ is the deepest
level where both $dif$ and $delta$ remain nontrivial; going deeper kills one
path via nilpotency. Self-consistency requires $Delta avec(Pi) = 0$.

== Why Hertz + EP-GP Works

The Hertz potential is the right level for the GP construction.
- Building the prior on $F$ directly requires enforcing $D F = 0$ as a constraint.
- Building it on $avec(A)$ wastes probability on gauge directions.
- The map $avec(Pi) |-> F = dif delta avec(Pi)$ automatically satisfies Maxwell
  when $Delta avec(Pi) = 0$, enforced by restricting spectral support to the
  light cone.
- The polarization operator $P(k) = extprod_k intprod_(k^sharp)$ maps 6 Hertz
  components onto exactly 2 physical polarizations with no surviving gauge freedom.
  It is nilpotent on the cone, not a projector; see @contracting-homotopy.

= Gaussian Process Notes

== Bayesian Linear Regression

Basis expansion: finding optimal coefficients is least squares.

- weight space = feature space
- kernel space = function space

Bayesian linear regression is UQ for least squares.
$
  min_avec(c) norm(amat(A) avec(c) - avec(b))^2 + lambda norm(avec(c))^2
  quad "(regularized LS)"
$
Put Gaussian prior $avec(c) tilde cal(N)(0, sigma_c^2 amat(I))$ and Gaussian
likelihood on the residual. Posterior mean over $avec(c)$ is the regularized LS
solution with $lambda = sigma^2 slash sigma_c^2$.

Marginal likelihood gives automatic regularization-strength selection -- no
hand-tuning $lambda$.

BLR with finite feature map and Gaussian prior on weights is a GP with kernel
$k(xv, yv) = psi(xv)^transp Sigma psi(yv)$. It is finite-rank / degenerate.
A GP is more general (any valid kernel, including infinite-dimensional ones).
Weight-space BLR is the special case of a finite-rank kernel.

Tikhonov regularization = regularized LS. In the Bayesian setting:
$lambda = sigma^2 slash sigma_c^2$ (noise variance / prior variance).

== Collocation vs Galerkin

Collocation: enforce equation (PDE or BC) via pointwise evaluation at discrete points.
- more points than variables: least squares / regression (residual)
- same number: linear system / exact interpolation

FDM is collocation. FEM is Galerkin.

Galerkin: enforce equation in weak integral sense. Multiply residual by test
functions and require the integral to vanish for all test functions. Residual
is orthogonal to the test space.
$
  min_u J(u) = norm(L u - f)^2 = integral (L u - f)^2 dif x
$
Normal equation: $L^* L u = L^* f$, or using test functions and the adjoint:
$inner(L u, L v) = inner(f, L v)$ (like Galerkin but testing against $L v$).
