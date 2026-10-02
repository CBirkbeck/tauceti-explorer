# BP-DeformationAndDerivedPatchingAlgebra--P7: Hilbert–Serre proof checkpoint

Agent: ChatGPT Pro — `gpt6astra-20261002-c84f2a`. Refs #551.
2 October 2026. Claim 5955649599 was confirmed by bot 5955652371;
the issue was reread after confirmation. Publication base:
`27ae2a7daec09365d1ea5abc8a5148ce445ae429`.

**Partial source-proof checkpoint, not a completed blueprint or formalisation.**
Only this handoff changes. The canonical packet, reader and suggested file
are unchanged. Their inherited counts remain 72 nodes, 83 API entries,
67 definition/construction tests plus four lemma tests, 92 native examples,
13 planets, 157 baseline references, 14 gaps and two requests. These are
inherited inventory counts, not new implementation or validation claims.
Every existing ID, source route, source finding, reserved multiplicity
boundary and partial/not_read/unchecked status remains in the canonical files.

The complete preceding accumulated handoff, including the associated-graded
module construction and historical compilation receipts, is archived at
[the immutable publication base](https://github.com/CBirkbeck/tauceti-explorer/blob/27ae2a7daec09365d1ea5abc8a5148ce445ae429/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
This current receipt replaces that accumulation, not its canonical mathematics.

## 1. What this checkpoint supplies

A degree-one **kernel/cokernel induction** supplies the missing eventual
polynomial of the graded quotient lengths. It does not assume a regular
generator. It constructs the integration constant explicitly, supplies the
input to the existing cumulative-polynomial theorem, and gives a separate
formal-series numerator proof. It also specifies how to register the existing
Rees quotients using native graded interfaces, without constructing another
associated-graded carrier.

The argument is an alternate elementary proof of the length-valued case of
Stacks 10.58.7. The source first removes power torsion; here the single-step
kernel and cokernel are both modules over the smaller graded ring. This is
not an alleged error in the source and not a new general K-theory programme.
The recorded torsion-stabilisation route can be replaced for this consumer
once these refinements are integrated; it must not remain a spurious required
gap in that same proof.

## 2. Precise setting

Let A be a commutative Noetherian ring. Let S be a nonnegatively graded
commutative A-algebra with degree-zero identification S_0=A, generated over A
by a specified finite list x_1,...,x_r in S_1. The list need not be minimal;
zero or redundant entries are allowed. Let M be a finitely generated graded
S-module, nonnegatively graded for the formulas below. Assume each M_n has
finite A-length. This last assumption is automatic when A is Artinian.

Put h_M(n)=length_A(M_n), as a nonnegative integer after proving its length
is finite. Put M_n=0 and h_M(n)=0 for n<0 only when using integer-indexed
formulas. In a native natural-indexed implementation use n to n+1 and handle
degree zero separately; natural subtraction must not simulate negative indices.

For a finite Z-graded module the finite homogeneous generator argument below
provides a lower bound. Shift that bound to zero and translate the resulting
polynomial. A two-sided infinite product of components is never substituted
for the direct sum.

S is Noetherian: it is a quotient of A[X_1,...,X_r]. No infinite residue-field,
field, domain, regularity, reducedness, completeness or nonzero-module premise
is used. The zero ring/module cases are permitted. No degree-equals-dimension
claim is included in this theorem.

## 3. Finite homogeneous generators and finite components

Take finitely many S-generators m_j. Replace them by all their homogeneous
components. This is a finite set because each element has finite homogeneous
support. The new components generate M: their S-span contains each original
m_j, hence is all of M. Denote their degrees by d_j.

For a homogeneous element of M_n, express it using these generators, express
the scalar coefficients as polynomials in the x_i, and project to degree n.
It is an A-linear combination of

    x_1^a_1 ... x_r^a_r m_j,  with a_i>=0 and sum a_i+d_j=n.

There are finitely many such monomials for fixed n. Therefore M_n is a finite
A-module. This proves finite length when A is Artinian, without identifying
length with dimension over a residue field. For r=0, only the finitely many
degrees d_j can survive. In particular h_M is eventually zero, although M may
have nonzero finite length.

The generic Hilbert basis theorem, finite generation and finite-length
calculus are inputs, not new local substitutes. The existing adic degree-one
and degree-zero generation plans give this data in the application below.

## 4. The kernel and cokernel, including their gradings

Assume r>0 and write x=x_r. On the underlying S-module, multiplication by x is
an S-linear endomorphism mu_x. It raises degree by one; it is not a
degree-preserving endomorphism of the displayed grading.

Use the actual native kernel and quotient:

    K=ker(mu_x)=(0:_M x),   I=range(mu_x)=xM,   Q=M/I,   B=S/(x).

K and I are homogeneous. Indeed, writing m=sum m_n, the elements x m_n lie in
distinct degrees n+1. If x m=0, every x m_n=0. The degree-n component of x m
is x m_(n-1), so projections preserve I as well. Consequently Q has the
quotient grading; its component is

    Q_n = M_n / x M_(n-1),

through the actual quotient projection, not an unrelated isomorphic module.
K_n is the kernel of M_n -> M_(n+1). At n=0, xM has zero component, so Q_0=M_0.

Both K and Q are killed by x, and hence carry B-module structures by scalar
descent. For K, this is the annihilator condition itself; for Q, x m maps to
zero. S-linearity and commutativity show the whole ideal (x) kills each module.
The quotient action is characterized by [s]m=sm. Their gradings are compatible
with this action. As (x) has no degree-zero part, B_0=A, and B is generated by
the images of x_1,...,x_(r-1).

K is finite over S because S is Noetherian and M is finite; Q is finite as a
quotient. The same finite lists generate over B: every coefficient s can be
replaced by [s]. Thus both are finite graded modules over a ring with one
fewer designated degree-one generators. Their components have finite
A-length as submodules and quotients of the finite-length M_n. This is the
induction step's finiteness input, not an assumption that K is free.

## 5. The exact degreewise sequence and the signed recurrence

For n>=0 there is an exact sequence

    0 -> K_n -> M_n --x--> M_(n+1) -> Q_(n+1) -> 0.

To use native short exactness, factor the middle map through its image I_(n+1).
The two short exact sequences are

    0 -> K_n -> M_n -> I_(n+1) -> 0,
    0 -> I_(n+1) -> M_(n+1) -> Q_(n+1) -> 0.

The inclusions are injective, the quotient/image maps are surjective, and the
image/kernel equalities follow from the definitions and the homogeneous
comparison in Section 4. Apply Module.length_eq_add_of_exact twice. Only after
all four lengths are finite, cast into Z and cancel the shared image length:

    h_M(n+1)-h_M(n) = h_Q(n+1)-h_K(n).                 (HS)

Equivalently, for integer n>=1, Delta h_M(n)=h_Q(n)-h_K(n-1).
Neither the endomorphism mu_x nor a chosen component map is asserted
injective. No short exact sequence is assumed split, and truncated natural
subtraction is not used. This supplies the source proof's missing numerical
input without a separate largest-power-torsion construction.

## 6. Constructing the eventual polynomial, not assuming one

Induct on the length r of the specified generator list, simultaneously for
all S and M with that list length. Section 3 supplies r=0, with polynomial zero.
For r>0, apply the induction hypothesis over B to K and Q. Write their rational
tail polynomials as P_K and P_Q, valid from N_K and N_Q respectively. Define

    D(T)=P_Q(T)-P_K(T-1),
    N=max(1,N_Q,N_K+1).

Then (HS) gives h_M(n)-h_M(n-1)=D(n) for every n>=N.
Use the packet's existing normalized rational summation polynomial S(D),
characterized by S(D)(-1)=0 and S(D)(n)-S(D)(n-1)=D(n). Set

    P_M(T)=S(D)(T)+h_M(N-1)-S(D)(N-1).               (ANCHOR)

Its value at N-1 is h_M(N-1). Induction on n using (HS) proves
P_M(n)=h_M(n) for every n>=N-1. This formula supplies both P_M and a valid
threshold; an arbitrary constant of integration would not suffice.

The degree bound is also obtained by induction. For r=1, K and Q have
zero tails, so D=0 and P_M is constant. For r>=2 their polynomial degrees are
at most r-2; translation and subtraction do not increase that bound, and
antidifference increases it by at most one. Thus deg(P_M)<=r-1 for r>0,
with the usual bottom degree for the zero polynomial. For r=0, P_M=0.
This is a generator-count bound, NOT dim(M) or dim(A).

Uniqueness is equality of rational polynomials agreeing on an infinite tail
of distinct rational natural-number casts. The current packet already names
Polynomial.eq_of_infinite_eval_eq for this purpose.

The binomial-basis alternative is explicit: if
D(T)=sum a_i binom(T,i), then an antidifference is
sum a_i binom(T+1,i+1); add the anchor constant in (ANCHOR).
No new Bernoulli or general abelian-group numerical-polynomial type is needed.

## 7. Independent formal-series form and its limitations

For an N-graded M, put H_M(t)=sum_(n>=0) h_M(n)t^n in Z[[t]]. This is a
formal power series, not an analytic series and not a finite Laurent sum.
Since Q_0=M_0, the degree-zero coefficient and (HS) give the exact identity

    (1-t)H_M(t)=H_Q(t)-t H_K(t).

The same r-induction proves existence of P(t) in Z[t] with

    (1-t)^r H_M(t)=P(t).

For r=0 the finite-support h_M itself is P. For r>0, if P_Q and P_K are
numerators with denominator exponent r-1 for the two smaller-ring modules,
the numerator is exactly P_Q-t P_K. It can have negative coefficients and
cancellation. It is not a sequence of dimensions, and r need not be minimal.

Writing P=sum p_j t^j, the exact coefficient formula is

    h_M(n)=sum_(j<=n) p_j binom(n-j+r-1,r-1),         r>0.

Once n>=deg P, the summation range is fixed and this is a rational polynomial
in n; use the polynomial binomial convention there. Multiplying H_M by
1/(1-t) gives the cumulative series P/(1-t)^(r+1). For a Z-graded module,
first shift to the nonnegative case; otherwise its numerator may be Laurent.

This independent route verifies signs and thresholds in (ANCHOR). It does
not replace the chosen native cumulative theorem or add a new formal-series
carrier. A canonical integration should choose the recurrence proof first;
register the formal-series statement only where its actual uses justify it.

## 8. Applying this to the existing adic quotients

Let (R,m) be Noetherian local, q an ideal with radical m, and L a finite
R-module. Use exactly the existing carriers

    S=gr_q(R),   M=gr_q(L),   A=R/q,
    S_n=q^n/q^(n+1),   M_n=q^n L/q^(n+1)L.

The canonical packet represents these by its native Rees ring/module
quotients and compares them with direct sums. It already plans degree-one
generation of S and degree-zero generation/finiteness of M. q is finitely
generated because R is Noetherian. R/q is Artinian: a power of m is contained
in q, and the existing finite-adic-quotient-length argument applies to R/q.
It is the degree-zero ring R/q that is Artinian; S usually is not.

After proving and registering the graded comparisons in Section 9, all the
hypotheses of Section 6 hold. Length restriction along R -> R/q identifies
h_M(n) with the existing graded Hilbert function phi(q,L,n). Finiteness is
proved before any extended-length toNat conversion.

Thus supply Q=P_M and its threshold to the EXISTING node
`DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-polynomial-from-graded-tail`.
Its initial-segment correction gives

    P_HS(T)=S(Q)(T)+sum_(i<N0)(phi(i)-Q(i)),

where N0 is a valid tail threshold for Q. Therefore
P_HS(n)=length_R(L/q^(n+1)L) for n>=N0. The exact-sequence and antidifference
nodes already in the packet are used, not duplicated.

This replaces the graded-polynomial-existence gap in the source proof of
`DeformationAndDerivedPatchingAlgebra:R03.3/eventual-hilbert-samuel-polynomial`.
It does not prove deg(P_HS)=dim(L), associativity of multiplicity, completion
invariance, Nagata's criterion, a regular-local-domain theorem, or any
patching/deformation/derived result. Intrinsic dim(L) and ambient dim(R)
normalisations remain separate, as the reserved definition requires.

## 9. Native interfaces and a declaration-sized integration plan

Use the existing image submodules of the adic component inclusions. The
previous finite-expansion equivalences give a unique finite decomposition
into those images. The previous homogeneous multiplication gives
S_i S_j subset S_(i+j), and the degree-zero unit is the class of 1.
These are the fields of the native GradedRing/GradedAlgebra structure.
GradedAlgebra.ofAlgHom can package the existing inverse finite-expansion map
once its algebra-map and two generator identities are proved. This is an
instance/compatibility proof on the SAME Rees quotient, not another ring.
For the module, use the images of its existing component inclusions, the
same finite decomposition, and the previous homogeneous scalar formula.
Register DirectSum.Decomposition and SetLike.GradedSMul; the existing
GradedModule.linearEquiv then supplies the bundled internal/external comparison.

The following are proposed refinement suffixes under R03.3, NOT registered
new nodes or claimed compiled declarations in this checkpoint:

1. **adic-ring-grading-registration.** Establish the native grading on the
   existing quotient from its finite expansion and homogeneous products.
   Tests: degree zero contains the unit; the positive degree-one class of 2
   over Z/4,q=(2) survives; its square has degree two and is zero.
2. **adic-module-grading-registration.** Establish decomposition and graded
   action for the existing module, with the same scalar tower. Tests: L=R
   agrees with the ring action; L=R/q has only degree zero; q=0 retains L
   in degree zero. Do not claim these comparisons are definitional.
3. **finite-homogeneous-generators.** The finite set of homogeneous components
   of a finite generating set spans. Proof: Section 3. Needs native finite
   decomposition and submodule-span lemmas, not a new finite-generation type.
4. **finite-standard-graded-pieces.** The displayed degree-n monomials span
   over A. Proof: homogeneous projection plus finite exponent enumeration.
   Finite length follows under Artinian A or is retained as an explicit
   degreewise hypothesis in the more general Noetherian-A theorem.
5. **degree-one-kernel-homogeneous.** K is the native kernel, with components
   ker(M_n -> M_(n+1)). Proof: uniqueness of homogeneous decomposition.
6. **degree-one-quotient-components.** Q is the native quotient with the exact
   component projection M_n -> Q_n and kernel x M_(n-1). Prove degree zero
   separately; keep a genuine graded quotient, not an ungraded isomorphism.
7. **degree-one-smaller-ring-finiteness.** K and Q have the native S/(x)
   action, are finite, and have compatible gradings and finite A-length
   pieces. The ring has r-1 generators. Use Noetherianity for K, scalar
   descent for both, and the same finite generating lists.
8. **degree-one-piece-exactness.** The two actual short exact sequences through
   the image in Section 5. This names the inclusion, image and quotient maps.
9. **degree-one-length-recurrence.** Equation (HS), with integer subtraction
   only after the extended lengths are proved finite. Inputs: item 8 and
   native length additivity, not an assumed Euler characteristic.
10. **standard-graded-zero-generator-tail.** A finite homogeneous module over
    its degree-zero ring has finite degree support; the eventual polynomial
    is zero, even when the module itself is nonzero.
11. **standard-graded-length-polynomial.** The r-induction, actual polynomial
    (ANCHOR), threshold, uniqueness and generator-count degree bound. Split
    the threshold/degree corollaries at canonical integration if required;
    use the existing rational summation operation.
12. **hilbert-samuel-graded-tail.** Instantiate item 11 on the existing native
    Rees quotients after items 1–2; export Q,N to the existing cumulative node.

Items 5–9 are separate because homogeneity, scalar descent, finite generation,
exactness and signed length cancellation are distinct formal obligations.
The only structural prerequisite is the already owned R03.3 algebra.
The displayed plan has no backward edge: registration/finite generators ->
components -> kernel/quotient -> exactness/length -> induction -> adic tail ->
existing cumulative polynomial. Induction on r is theorem recursion, not a
cycle between declaration dependencies. No whole-atlas graph check was run.
There are already six R03.3 planets; this checkpoint adds none.

Freshly checked native declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `GradedRing`, `GradedAlgebra.ofAlgHom`, `DirectSum.decomposeRingEquiv` and
  `DirectSum.decomposeAlgEquiv`, in RingTheory/GradedAlgebra/Basic.lean,
  lines 1–210, blob `153d00659bf66d9f0b481d90ec2accbb8245f541`.
- `GradedModule.isModule`, `GradedModule.linearEquiv`, and the underlying
  graded action constructions, in Algebra/Module/GradedModule.lean,
  read through the end, blob `6bcc7226f18fe22f5bf7554ddf931e8a0c763f06`.
- `Submodule.IsHomogeneous`, its mem_iff, and `HomogeneousSubmodule`, in
  RingTheory/GradedAlgebra/Homogeneous/Submodule.lean, read through the end,
  blob `e2bf93cc440b078227149a7f3fc4f615f02574fe`.
- `IsNoetherian.noetherian`, `isNoetherian_submodule'`, and the chain
  stabilisation interface, in RingTheory/Noetherian/Defs.lean, lines 1–180,
  blob `b7f258dc8bb1cb4b0e6a7d00ee2b9d7f616f7331`.
- `Module.length`, `length_ne_top_iff`, `length_eq_of_surjective`,
  `length_eq_add_of_exact` and the injective/surjective bounds, in
  RingTheory/Length.lean, lines 1–260,
  blob `b67e6b42e767a11203b9b12e6d3cc50c71c82ad8`.
- `Module.IsTorsionBySet.module`, `.mk_smul`, `.isScalarTower` and
  `.semilinearMap`, in Algebra/Module/Torsion/Basic.lean, lines 540–615,
  blob `dfa54a53e844ab9233c068126bc5554b0cc02ed3`.

These readings establish the signatures and their scope, not the uncompiled
compatibility proofs. In particular HomogeneousSubmodule's existence does
not by itself construct every quotient grading used above.

## 10. Discriminating examples

For S=k[x,y] and M=S/(x^2,xy), with both variables of degree one,

    h_M = 1,2,1,1,1,...;
    h_K = 0,2,1,1,1,... for K=(0:_M x);
    h_Q = 1,1,1,1,... for Q=M/xM=k[y].

At n=1 in (HS), the equality is -1=1-2. A kernel-free recurrence gives 1
instead of -1, and natural subtraction gives 0 instead of -1. As a module
with two ring generators its numerator is 1-2t^2+t^3 over (1-t)^2.
The cumulative tail is n+2 for n>=1; its extrapolated value 2 at n=0 is
not the actual first value 1. This is the embedded-component pattern already
used by the reserved multiplicity tests, with the variables interchanged.

For k[x]/(x^a), the graded tail is zero but the cumulative tail is the
nonzero constant a. For k[x] whose module generator is placed in degree 3,
the graded tail is 1 but the cumulative tail is n-2, not n+1.

For A=Z/4, A[x] has component A-length 2; (A/2)[x] has component length 1
although it is not a free A-module. The proof requires neither free graded
pieces nor a choice of coefficient field.

If deg x=2 in k[x], h(n) is 1 for even n and 0 for odd n. A polynomial
agreeing with this tail would be 1 on infinitely many points and 0 on
infinitely many other points, impossible. Positive grading without degree-one
generation gives only a quasipolynomial in general.

Finite generation of M is essential as well: take a graded k-vector space
with M_n=k^(2^n) and let x act as zero. It is a graded module over standard
k[x], every piece is finite, but its Hilbert function 2^n is not an eventual
polynomial. Its k-th backward difference is 2^(n-k), never zero for n>=k.

## 11. Reading, ownership and validation boundary

Primary sources personally read in this continuation:

- [Stacks 00JV](https://stacks.math.columbia.edu/tag/00JV), the mathematical
  statements/proofs of Section 10.58, especially 10.58.1–7 and the
  nonstandard-grading warning 10.58.8.
- [Stacks 00K1](https://stacks.math.columbia.edu/tag/00K1), Proposition
  10.58.7 and its complete printed proof, compared with the alternate
  length-valued kernel/cokernel proof above.
- [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4), the graded and
  cumulative definitions, ideal-of-definition/finite-length passage, and
  Proposition 10.59.5 with its proof; the neighbouring Artin–Rees formulas
  were read but their remaining formal proof chain is not closed here.

These were inspected as live HTML text; no downloaded-byte hash or fresh
whole-paper erratum audit is claimed. No new source error is alleged.
The characteristic-zero, automorphic and other paper-route receipts in the
canonical packet remain historical, not freshly certified here.

Read the current handoff and relevant canonical nodes/gaps, the roadmap's
stage extract, reviewed AUDIT-17 report and the relevant R03.3 audit row
with its neighbours, and accepted REV-RS-08 with the applicable ownership
instructions. Read GrothendieckEulerForms' scope, graded/K0/Euler development
and worked examples, and Multiquadratic's document for upstream style.
Searches for HilbertSerre and native homogeneous quotients were scoped leads,
not an exhaustive absence claim. No existing upstream roadmap is modified.
General categorical Grothendieck groups remain with their upstream owner;
this length proof does not reconstruct them. Generic derived Rees, Milnor
and completion contracts remain with their recorded owners. R03.6 and every
other part of this roadmap are untouched.

Executed exact checks: **151 monomial-module models, 24,317 assertions**.
They use coefficient rings Z/(p^e), e=1,2,3, with 0–3 degree-one variables,
coefficient torsion, shifts, zero modules and monomial relations. Length
coefficients are computed directly from the monomial quotient; Hilbert
numerators use independent inclusion–exclusion. The actual finite cyclic
coefficient maps were also checked for p=2,3,5.

Highlights: 2,185 four-term length identities; 531 degrees rejecting an
omitted kernel; 1,495 independent reconstructions of (ANCHOR) using the two
smaller-ring modules; 2,869 exact series and 2,869 cumulative-series checks;
72 models with signed numerators; 24 negative first differences; and
64 checks each rejecting weighted-grading and non-finitely-generated
substitutes. The full counters and standalone reproduction program follow.
Finite tests support the examples; they do not prove the general theorem,
construct arbitrary graded quotient types, or validate Lean elaboration.

Program SHA-256:
`c73c4ee301bcf97bdf715905a826fb38bae65efd12336d5962ab719a2378dd6b`.
JSON output SHA-256:
`b486e799696f88e504466f67ca76427cdb6deb3e0fa6cbc0f32b6d9174e7bdcb`.

**Lean was not compiled.** The session had about 3 GB available memory,
below WORKERS' 20 GB threshold, and no existing pinned build. No project,
cache download, library build or language server was started. The standard
blueprint checker and atlas assembly were not run locally; the canonical
packet was not edited. Submission CI is a separate mechanical check, not a
mathematical review. The predecessor's successful compilation applies only
to its exact historical suggested file.

## 12. Resume

Integrate the twelve proposed refinements into the canonical packet, reader
and native suggested file, preserving all existing IDs and counts correctly.
First certify the native grading registration and component quotients, then
the smaller-ring finite modules and exact sequences. Supply the resulting
Q,N to the existing cumulative node and remove only the now-redundant
power-torsion proof obligation from that chosen route. Elaborate at an
existing pinned build and run the indexed checker and actual atlas projection.
Do not mark the source-level proof or these finite tests as Lean completion.

The degree/dimension and Artin–Rees comparison, multiplicity normalisations,
localisation/associativity, completion/geometric tests, regular-local-domain
chain, and every coefficient/derived/patching and routed-paper obligation
remain. The reserved general Hilbert–Samuel node stays with this owner.
No additional source finding, supplier request or planet is introduced.

## 13. Exact-model reproduction

Run this standalone Python 3 program. It uses only the standard library.

```python
"""Exact regressions for graded Hilbert--Serre; not proofs or Lean checks.
Only Python's standard library is used. No repository files are read or written.
"""
from collections import Counter
from fractions import Fraction
from itertools import combinations
from math import comb
from random import Random
import json

COUNTS = Counter()
RNG = Random(551)

def check(name, condition):
    if not condition:
        raise AssertionError(name)
    COUNTS[name] += 1

def exponents(r, degree):
    if degree < 0:
        return []
    if r == 0:
        return [()] if degree == 0 else []
    if r == 1:
        return [(degree,)]
    return [(i,) + rest for i in range(degree + 1)
            for rest in exponents(r - 1, degree - i)]

def divides(v, u):
    return all(a <= b for a, b in zip(v, u))

def coefficient_length(u, e, generators):
    # The coefficient of x^u is A/(p^a), of A-length a; A has length e.
    return min([e] + [a for a, v in generators if divides(v, u)])

def monomial_numerator(r, e, generators, shift=0):
    # Decompose lengths into e residue-field layers. For layer j, monomials
    # divisible by a generator with coefficient p^a, a <= j, are forbidden.
    # Inclusion--exclusion on monomial multiples gives the exact numerator.
    out = Counter()
    for j in range(e):
        gs = list(set(v for a, v in generators if a <= j))
        for size in range(len(gs) + 1):
            for sub in combinations(gs, size):
                lcm = tuple(max((v[i] for v in sub), default=0)
                            for i in range(r))
                out[sum(lcm) + shift] += (-1) ** size
    return {n: c for n, c in out.items() if c}

def series_from_numerator(P, denominator_power, n):
    if denominator_power == 0:
        return P.get(n, 0)
    return sum(c * comb(n - j + denominator_power - 1,
                        denominator_power - 1)
               for j, c in P.items() if n >= j)

def binomial_polynomial_value(x, k):
    out = Fraction(1)
    for i in range(k):
        out *= Fraction(x - i, i + 1)
    return out

def tail_value(P, r, n):
    if r == 0:
        return Fraction(0)
    return sum((Fraction(c) * binomial_polynomial_value(n - j + r - 1, r - 1)
                for j, c in P.items()), Fraction(0))

models = []
# Explicit examples: embedded component; nilpotence; non-field coefficients;
# positive grading shifts; zero module; redundant/zero generator relations.
models.extend([
    (2, 1, [(0, (2, 0)), (0, (1, 1))], 0, "embedded"),
    (1, 1, [(0, (5,))], 0, "nilpotent"),
    (1, 2, [(1, (0,))], 0, "residue_over_length_two"),
    (1, 2, [], 0, "free_over_length_two"),
    (1, 1, [], 3, "shift_three"),
    (2, 3, [(0, (0, 0))], 0, "zero"),
    (3, 2, [(1, (1, 0, 0)), (0, (0, 2, 0)), (1, (0, 0, 2))], 2, "mixed"),
])
for r in range(4):
    for e in range(1, 4):
        for case in range(12):
            gs = [(RNG.randrange(e), tuple(RNG.randrange(3) for _ in range(r)))
                  for _ in range(RNG.randrange(5))]
            models.append((r, e, gs, RNG.randrange(5), f"random_{r}_{e}_{case}"))

nonzero_kernels = 0
negative_differences = 0
negative_numerators = 0
for r, e, gs, shift, name in models:
    P = monomial_numerator(r, e, gs, shift)
    degreeP = max(P, default=-1)
    upper = max(18, degreeP + r + 6, shift + 8)
    h = [sum(coefficient_length(u, e, gs) for u in exponents(r, n - shift))
         for n in range(upper + 1)]
    Q = []
    K = []
    for n in range(upper + 1):
        if r == 0:
            continue
        # Kernel at source degree n: each coefficient map is the surjection
        # Z/p^l(u) -> Z/p^l(u+e0), so its kernel length is the difference.
        kval = 0
        qval = 0
        for u in exponents(r, n - shift):
            v = (u[0] + 1,) + u[1:]
            kval += coefficient_length(u, e, gs) - coefficient_length(v, e, gs)
            if u[0] == 0:
                qval += coefficient_length(u, e, gs)
        K.append(kval)
        Q.append(qval)
        previous = h[n - 1] if n else 0
        previousK = K[n - 1] if n else 0
        check("four_term_length_identity", h[n] - previous == Q[n] - previousK)
        if previousK:
            nonzero_kernels += 1
            check("omitted_kernel_rejected", h[n] - previous != Q[n])
        negative_differences += int(h[n] - previous < 0)
    cumulative = 0
    for n in range(upper + 1):
        cumulative += h[n]
        check("exact_hilbert_series", h[n] == series_from_numerator(P, r, n))
        check("exact_cumulative_series", cumulative == series_from_numerator(P, r + 1, n))
        # Coefficient multiplication by (1-t)^r agrees with P before truncation.
        convolution = sum((-1) ** i * comb(r, i) * (h[n - i] if n >= i else 0)
                          for i in range(r + 1))
        check("numerator_convolution", convolution == P.get(n, 0))
        if n >= max(0, degreeP + 1):
            check("graded_tail_polynomial", Fraction(h[n]) == tail_value(P, r, n))
            check("cumulative_tail_polynomial", Fraction(cumulative) == tail_value(P, r + 1, n))
    negative_numerators += int(any(c < 0 for c in P.values()))
    # r-th backward difference of the graded tail is zero, including r=0.
    start = max(0, degreeP + r + 1)
    for n in range(start, upper + 1):
        check("degree_bound_difference", sum((-1) ** i * comb(r, i) * h[n-i]
                                              for i in range(r+1)) == 0)

# Published-convention regressions on the embedded-component model.
r, e, gs, shift, _ = models[0]
h = [sum(coefficient_length(u, e, gs) for u in exponents(r, n)) for n in range(12)]
check("embedded_hilbert_values", h == [1, 2] + [1] * 10)
check("embedded_numerator", monomial_numerator(r, e, gs) == {0: 1, 2: -2, 3: 1})
for n in range(1, 12):
    check("initial_segment_correction", sum(h[:n+1]) == n + 2)
check("tail_not_value_at_zero", Fraction(0 + 2) != h[0])
# Nat subtraction silently loses the negative difference at n=2.
check("natural_subtraction_rejected", h[2] - h[1] == -1 and max(0, h[2] - h[1]) != -1)
# A variable of degree two has alternating Hilbert function, not a polynomial tail.
for order in range(1, 9):
    for n in range(order, order + 8):
        difference = sum((-1) ** i * comb(order, i) * int((n - i) % 2 == 0)
                         for i in range(order + 1))
        check("weighted_grading_not_polynomial", difference != 0)
# Finite-difference integration in the binomial basis, with an arbitrary tail anchor.
for case in range(100):
    a = [RNG.randrange(-5, 6) for _ in range(RNG.randrange(1, 6))]
    anchor = RNG.randrange(0, 6)
    initial = RNG.randrange(-8, 9)
    def d(n):
        return sum((Fraction(c) * binomial_polynomial_value(n, i)
                    for i, c in enumerate(a)), Fraction(0))
    def integral(n):
        return sum((Fraction(c) * binomial_polynomial_value(n+1, i+1)
                    for i, c in enumerate(a)), Fraction(0))
    expected = Fraction(initial)
    for n in range(anchor, anchor + 14):
        if n > anchor:
            expected += d(n)
        check("binomial_antidifference", integral(n) - integral(n-1) == d(n))
        check("anchored_recurrence_solution", initial + integral(n) - integral(anchor) == expected)

# Independently reconstruct the induction's smaller-ring numerator and anchored
# polynomial, instead of merely comparing the final Hilbert series.
def divide_one_minus_t(P):
    running = 0
    answer = {}
    for n in range(max(P, default=-1) + 1):
        running += P.get(n, 0)
        if running:
            answer[n] = running
    check("kernel_numerator_divisibility", running == 0)
    return answer

for r, e, gs, shift, name in models:
    if r == 0:
        continue
    P = monomial_numerator(r, e, gs, shift)
    colon = [(a, (max(0, v[0]-1),) + v[1:]) for a, v in gs]
    Pc = monomial_numerator(r, e, colon, shift)
    difference = {n: P.get(n, 0)-Pc.get(n, 0) for n in set(P) | set(Pc)}
    difference = {n: c for n, c in difference.items() if c}
    PK = divide_one_minus_t(difference)
    PQ = monomial_numerator(r-1, e, [(a, v[1:]) for a, v in gs if v[0] == 0], shift)
    def D(n):
        return tail_value(PQ, r-1, n) - tail_value(PK, r-1, n-1)
    # Newton forward differences at 0 give the binomial-basis coefficients.
    vals = [D(i) for i in range(max(1, r-1))]
    coeff = []
    while vals:
        coeff.append(vals[0])
        vals = [vals[i+1]-vals[i] for i in range(len(vals)-1)]
    def antidifference(n):
        return sum((a*binomial_polynomial_value(n+1, i+1)
                    for i, a in enumerate(coeff)), Fraction(0))
    N = max(1, max(PQ, default=-1)+1, max(PK, default=-1)+2)
    anchor = sum(coefficient_length(u, e, gs) for u in exponents(r, N-1-shift))
    for n in range(N-1, N+12):
        hn = sum(coefficient_length(u, e, gs) for u in exponents(r, n-shift))
        predicted = antidifference(n) + anchor - antidifference(N-1)
        check("actual_kernel_cokernel_induction", Fraction(hn) == predicted)
        kval = sum(coefficient_length(u, e, gs) -
                   coefficient_length((u[0]+1,)+u[1:], e, gs)
                   for u in exponents(r, n-shift))
        check("kernel_smaller_ring_series", kval == series_from_numerator(PK, r-1, n))

# Check the cyclic coefficient-map oracle by actual finite sets, not log ranks.
for p in [2, 3, 5]:
    for a in range(4):
        for b in range(a+1):
            source = list(range(p**a))
            image = {x % (p**b) for x in source}
            kernel = [x for x in source if x % (p**b) == 0]
            check("cyclic_coefficient_surjection", len(image) == p**b)
            check("cyclic_coefficient_kernel", len(kernel) == p**(a-b))
            check("cyclic_coefficient_length", p**a == len(kernel)*len(image))

# Dropping finite generation also fails: let all positive-degree elements act
# trivially on a graded k-vector space with dim M_n=2^n.
for order in range(1, 9):
    for n in range(order, order+8):
        difference = sum((-1)**i * comb(order, i) * 2**(n-i)
                         for i in range(order+1))
        check("infinite_module_generation_rejected", difference == 2**(n-order) != 0)

result = {
    "seed": 551,
    "models": len(models),
    "coefficient_rings": "Z/(p^e), e=1,2,3; lengths independent of p",
    "variables": [0, 1, 2, 3],
    "nonzero_kernel_degrees": nonzero_kernels,
    "negative_first_differences": negative_differences,
    "models_with_negative_numerator_coefficients": negative_numerators,
    "checks": dict(COUNTS),
    "total_assertions": sum(COUNTS.values()),
    "scope": "Exact finite-degree monomial/length and rational-polynomial regressions, not a proof of the general graded-module theorem or Lean elaboration"
}
print(json.dumps(result, sort_keys=True, indent=2))
```
