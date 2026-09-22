# Heuer: the global p-adic Simpson correspondence

**First checkpoint — partial; not ready for acceptance as a complete extraction.**

Issue #1220. Agent: ChatGPT Pro, session `cgp-0922-6e8b41`, 22 September 2026.
The companion `PAPER-HEUER-25.result.json` is the machine inventory for this
checkpoint. Its source routes and Part-II proposal are provisional; they do
not assert implementation, independent review, or complete proof-input closure.
No Lean artifact was requested or compiled.

## 1. Source identity and what was actually read

The primary mathematical source is the **final publisher version** of Ben
Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*,
Inventiones Mathematicae **240** (2025), 261–312,
[DOI 10.1007/s00222-025-01321-4](https://doi.org/10.1007/s00222-025-01321-4).
The version of record was published on 10 February 2025. All 52 PDF pages,
including the references and the CC BY 4.0 licence, were read through the
publisher's parsed text. Publisher screenshot rendering failed. Selected
formulas and diagrams were instead visually checked in the author's accepted
[arXiv v3](https://arxiv.org/abs/2307.01303v3), dated 21 January 2025:
printed pages 5, 10, 23, 26 and 28. This is not a claim that a full visual
publisher inspection or a bytewise comparison of the versions took place.
No PDF bytes were acquired locally and no fresh PDF hash is claimed.

Two auxiliary sources were read selectively:

* [Heuer, *Moduli spaces in p-adic non-Abelian Hodge theory*,
  arXiv:2207.13819v2](https://arxiv.org/abs/2207.13819v2), 7 February 2024:
  the smallness definitions and local-correspondence construction in §6,
  including its treatment of noninvertible maps, and the continuous-cohomology
  comparison in Lemmas 6.9–6.11. The full analytic cocycle/intertwiner machinery
  of Propositions 5.5 and 5.9 and Appendix A still needs extraction.
* [Heuer–Werner–Zhang, *p-adic Simpson correspondences for principal bundles
  in abelian settings*, arXiv:2308.13456v2](https://arxiv.org/abs/2308.13456v2),
  17 March 2025: selected definitions in §6 and Theorem 6.12 with its proof.
  This is a **later auxiliary version**, not silently the version cited before
  publication of Heuer's article. Its proof uses Fargues's classification of
  analytic p-divisible groups. That classification has not yet been read.
  **Section 7's principal-bundle correspondence is not an input** to this
  extraction; using it would risk a circular proof dependency.

The main paper's citation of Guo Proposition 7.4.4 is recorded, but that
original proof has not yet been acquired. Likewise, the exact Bhatt–Hansen
proper-base-change input, the formal-model sources and the general Picard
representability sources remain requests, not claimed original-source reads.

## 2. The actual endpoint and the dependency boundary

Let K be a complete algebraically closed nonarchimedean extension of Q_p and
X a smooth proper rigid space, in the analytic-adic sense. Set

```
OmegaTilde = Omega^1_(X/K)(-1),
T_X = Sym_(O_X)(OmegaTilde-dual),
nu : X_proet -> X_et.
```

The theorem concerns **all finite locally free modules over the completed
structure sheaf on the original pro-etale site**, not just continuous
representations of pi_1(X) and not just globally small bundles. On the other
side are all analytic Higgs bundles `(E,theta)`, with
`theta wedge theta=0`; no semistability or vanishing-Chern-class condition is
inserted into this statement.

Choose a smooth lift of X over `B_dR^+/xi^2` and a continuous scalar
exponential `Exp:K -> 1+m_K` splitting log and agreeing with the analytic
series on its prescribed small domain. The result is an exact tensor
equivalence, natural for the **compatible lifted maps and compatible scalar
exponentials** in the theorem. It is not a choice-free equivalence independent
of the lift or Exp. The finite rigidifying sets and auxiliary base points,
however, disappear from the final construction.

The later cohomological theorem constructs a natural isomorphism

```
R nu_* V  ≅  [E -> E tensor OmegaTilde -> E tensor OmegaTilde^2 -> ...]
```

in the derived category on `X_et`, and hence the global derived-cohomology
comparison. An equality of dimensions, or unrelated local quasi-isomorphisms,
would not meet this endpoint. Remark 5.6's suggested extension to all perfect
complexes is not asserted proved here.

### Existing owners, not replacement foundations

The p-adic Hodge parent, AdicEtaleGeometry, AdicSpacesPartII, PerfectoidSpaces,
DerivedDeRhamCohomology, CohomologyComparisons, DiamondsAndVStacks and the
endoscopic/Hitchin owner were read. Relevant classical analytic-cohomology
sections were also read. Their interfaces impose the following distinctions.

| Input | Owner and boundary |
| --- | --- |
| Analytic spaces, coherent sheaves, finite spectra, formal models and GAGA | AdicSpacesPartII R0–R3/F0. Keep plus rings, nonreduced structure and the precise noetherian/nonnoetherian formal-model range. |
| Original analytic pro-etale site | AdicEtaleGeometry A1, with the corrected Scholze convention. Coherent pullback is not arbitrary v-pullback. |
| Period rings and structural period sheaves | PadicHodgeTheory R06.1 and **P8:local-rational**, not P8's later proper-comparison suffix. |
| Perfectoid toric towers and descent | PerfectoidSpaces P7/P9, importing the earlier purity/acyclicity inputs as needed. Finite levels are not already perfectoid. |
| Etale representability over analytic diamonds | DiamondsAndVStacks D6, with essential surjectivity on etale categories, not full faithfulness on all analytic morphisms. |
| Koszul complexes and qualified completion | DerivedDeRhamCohomology DD.1. The generic complex must be constructed once, not privately in a Simpson file. |
| Derived analytic-site cohomology | ClassicalAdicEtaleCohomology H0; the new proper torsion base-change source is proposed for H5. |
| Generic Higgs and spectral-image core | The existing ET.2b Higgs/Hitchin owner, with an **early common interface** for the analytic and finite-field clients; see the unresolved design cut below. |

The new categorical construction belongs in the proposed
**PadicHodgeTheoryPartIISimpson**. It does not rebuild these foundations.
In particular, CP.3's deformation of a **cohomology complex** is not the
existence of a smooth **space** over `B_dR^+/xi^2`.

The repository search for Higgs objects found the existing ET.2b obligation.
The generic Higgs module, its symmetric-algebra action and spectral image
must be shared with that owner. The source route is **not** permission to
make the Simpson proof depend on Ngo's support theorem, positivity of a
finite-field divisor, or the entire fundamental lemma. The future design
must expose the early algebraic/ringed-site core; that cut is still G1.

### What the pinned library audit does and does not establish

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The actual statements in
`Mathlib/RingTheory/Perfectoid/BDeRham.lean` and the relevant
`FontaineTheta.lean` passages were read at the pin.

The existing theta map, its surjectivity criterion and the bare BDeRhamPlus
carrier are genuine imports. The BDeRham file itself lists extension of theta,
principality and the DVR theorem as further work. A commutative-ring definition
of a completion does not supply the filtered period ring, its first-order
geometry, or a period sheaf.

**AUDIT-37 is not independently reviewed.** Its result was used as a search
lead, not as accepted proof of absence. `REV-AUDIT-37.md` was absent and its
review issue #872 was open, available and without comments when checked.
The inventory positively marks only the declarations actually read as
`library`; other named suppliers are `planned`, and the remaining source
obligations are `missing`. A full fresh pinned-tree audit remains G0.

## 3. Why coherent, nonreduced coefficients are essential

For a Higgs bundle, use the **image algebra**

```
B_theta = image(T_X -> End(E)),       script B = nu^* B_theta.
```

It is coherent, commutative and torsionfree over O_X, but need not be locally
free or reduced. Taking the characteristic-polynomial cover instead, or
reducing the image, changes the construction. For two size-two nilpotent
Jordan blocks, the image is `K[t]/t^2`, whereas the characteristic polynomial
has degree four. Both the image dimension and its nilpotent element matter.

The relative Picard functor is built from invertible **script B-modules on
X_proet**. It is not the Picard functor of the completed structure sheaf of
the nonreduced finite spectral space: that alternative loses the intended
nilpotent coefficient information. The quotient by classes pulled from the
parameter S is also essential to the relative Hodge-Tate map.

The proof begins by finding a finitely presented integral model B0. Its
p-torsionfree image B+ may cease to be coherent, so later arguments cannot
quietly reuse finite presentation of B+. The additive and multiplicative
quotient comparisons in Lemma 2.8 control precisely this transition.
At p=2, use the appropriate `4 B+` small exponential domain, or uniformly
`2p B+`; the naive `p B+` convergence argument is not uniform there.

Next prove `L nu^* B = nu^* B` for coherent B on the original pro-etale site.
This is a substantive local resolution/completion argument. It allows the
structure-sheaf Hodge-Tate theorem to extend to coherent coefficients:

```
R^n nu_* script B = B tensor OmegaTilde^n,
R^n nu_* script B^units = B tensor OmegaTilde^n  (n >= 1).
```

The degree-zero multiplicative term stays `B^units`. The first Leray edge
sequences are only **left exact**; right-surjectivity is proved later.

A lift produces the Higgs-Tate torsor of lifts of the structural map. Its
translation module is `nu^*(OmegaTilde-dual)`. Push it out along a coefficient
section to obtain an additive torsor, and compute its toric Kummer cocycle.
This proves that the additive Hodge-Tate edge map splits with the correct
Tate normalization. A cohomology lattice and the small exponential yield an
analytic splitting on an **open lattice**, not an analytic global splitting.

The multiplicative right-surjectivity argument uses Kummer theory, proper
finite-torsion base change and a connectedness lemma for quotients of locally
constant sheaves. The obstruction is killed as a **sheaf on the parameter
space**, not merely by checking K-points. The required proper source can be
singular and the torsion order can contain p. That is why the older
prime-to-residue-characteristic theorem is not a substitute for the cited
Bhatt–Hansen input.

## 4. From Picard classes to canonical actual lines

If the ordinary Picard sheaf of the finite spectral space is represented,
the full pro-etale Picard sheaf is represented. But the central construction
cannot assume this in general. Instead define the equalizer P of the
p-inversion map and the lift-dependent exponential section. Theorem 3.2 gives

```
0 -> Pic(X')[p-infinity] -> P -> A_B -> 0,
Lie(P) = A_B(K).
```

This smaller group is always represented, and its identity component is
p-divisible and still surjects onto A_B. The argument includes the connected
component/cokernel calculation; Lie surjectivity alone would not establish
p-divisibility of the required component.

For torsionfree coherent B, choose finitely many fibres detecting H0(X,B).
Properness makes that vector space finite-dimensional. The unit-group
calculation for finite K-algebras is elementary but indispensable:

```
(A tensor R)^units ≅ (Nil(A) tensor R,+) × R^units
```

when A is connected. Nilpotent exp/log proves the additive factor. For an
injection of finite algebras, the induced unit map splits, with a product of
additive and multiplicative groups as cokernel. These generic analytic unit
calculations have a source route to AdicSpacesPartII.

Rigidify a line at each detecting fibre. Two compatible isomorphisms differ
by a global unit trivial at all those fibres, hence are equal. This is a
**uniqueness** theorem; it does not say any two rigidified lines are isomorphic.
Uniqueness forces descent cocycles and permits passage from an isomorphism
class to an actual object with coherent comparisons.

Distinct lifted points can reduce to the same point of X. The reduction is
therefore a **multiset**, even though the chosen lifted points form a set.
This matters when comparing choices by their union. A single base point
cannot generally replace the finite rigidifying family.

The rigidified group P^M has a linearized extension, and the lifted points
split that extension. Apply the Lie exponential associated with the chosen
Exp_K to the tautological coefficient section. This yields the rigidified
class defining L_B. Common enlargements of the lifted sets produce unique
compatible isomorphisms, so L_B is independent of those auxiliary choices.
The output has

```
HTlog(L_B)=tau_B,
L_B tensor_B B' ≅ L_B'
```

with identity/composition compatibility and the stated geometric and tensor
naturality. The global exponential is a map on K-points, not a rigid analytic
map from all of G_a into a logarithm's small target.

### A tensor-scope check still requiring independent resolution

The statement of Theorem 3.22(4) and its invocation over O_X in the tensor
proof should be matched literally. The augmentation action of T_X on O_X
does not make `O_X -> B_i` T_X-linear when the Higgs section of B_i is nonzero.
A tensor product over T_X instead of O_X would impose unwanted relations.

There is a plausible direct completion of the argument: work with the
underlying O_X-algebra maps on rigidified Picard groups, apply their tensor
map, and observe on Lie algebras that it sends the two sections to their sum.
Functorial Lie exponentiation and common rigidification then identify the
lines. This uses the proof's underlying O_X-linear construction rather than
an unjustified T_X-linearity assertion. It must still be written with all
coefficient and torsionfree-quotient maps checked. **G6 is a hypothesis-check
request, not a claimed counterexample to the published tensor theorem.**

## 5. Canonical fields, untwisting and morphisms

The local small correspondence has to be an equivalence of categories with
**all homomorphisms**, not only isomorphism groupoids. Its constants depend
on the chart and the integral descent estimates. Arbitrary pullback does not
automatically preserve a fixed smallness condition. Every bundle is reduced
to that setting only etale-locally.

For any pro-etale bundle V, the small correspondence gives a local field.
To compare charts, introduce a common coherent coefficient algebra and local
lines with equal Hodge-Tate logarithm. Their difference has zero logarithm
and becomes an etale line. Full endomorphism functoriality then eliminates
the conjugation ambiguity: the locally constructed fields agree as fields,
not just up to unspecified isomorphism. They glue to the intrinsic theta_V,
which is integrable and natural.

The pushed-forward endomorphism sheaf is coherent, permitting the intrinsic
image algebra B_V. This does **not** show that `nu_* V` is itself locally free.
That conclusion only comes after untwisting by a line with logarithm tau_V:

```
V tensor_(script B_V) L_BV^(-1) = nu^* E.
```

The local comparison with a toric exponential line proves the descent and
identifies the descended Higgs field.

To define the functor on a map `phi:V -> W`, use the spectral algebra of
`V direct-sum W`. The explicit endomorphism `(v,w) -> (v,w+phi(v))` avoids
any row/column convention in block matrices. It commutes with the canonical
field, proving the required coefficient linearity. Canonical base change of
L_B now transports phi. Triple direct sums prove composition; there need not
be a direct map between the two minimal spectral algebras associated to an
arbitrary phi.

The unit/counit require identification of the spectral algebras after twisting,
not just cancellation of two unrelated lines. Exactness is local. Tensor
compatibility uses the sum Higgs action on the O_X tensor product and the
canonical line tensor identity, with its scope check above. Proposition 5.3
then uses the connected reduced Picard group to produce a connected family
joining V to its analytic untwist.

## 6. The cohomological proof is a second construction

The generic Koszul resolution identifies the Higgs complex with internal
`RHom_(T_X)(O_X,E)`. For the comparison with V, let J be the **spectral ideal**
annihilating E and complete T_X along J. It is not initially the augmentation
ideal. If needed, adjoining the zero-action component shrinks J so that J
lies in the augmentation ideal.

The algebras `B_n=T_X/J^n` are coherent, but need not be O_X-torsionfree.
Consequently Theorem 3.22's rigidified canonical-line construction cannot be
applied to them verbatim. Instead use the unrigidified exponential classes,
choose compatible lines L_n and form the inverse-limit line. Proper
finite-dimensional Hom spaces provide a Mittag-Leffler comparison of choices.
The extraction explicitly leaves the detailed effectivity, inverse-limit
convention and cancellation of auxiliary automorphisms in the derived map
as G7; a class-level compatibility statement is not enough on its own.

Flat completion and the Koszul resolution now construct a **global** map from
the Higgs complex to `R nu_* V`. Its local quasi-isomorphism is checked using
a smaller convergent coefficient algebra

```
O_U < p^(-alpha) partial_1, ..., p^(-alpha) partial_d >,
```

where the scale is selected to make the exponential converge. The Delta-cocycle
sends a coordinate generator to `exp(partial_i)`. The actual global map becomes
a comparison of two Koszul complexes, for `gamma_i-1` and `log(gamma_i)`.
Their quotient power series gives commuting invertible operators and an
exterior-degree chain isomorphism.

There are two separate analytic requirements here: continuous Z_p^d cohomology
must really be computed by the completed Koszul construction, and the toric
coefficient-extension comparison needs a **uniform** p-power annihilator before
taking inverse limits. Rational pointwise equalities do not justify either
integral limit step. The selected H22 proof decomposes the toric coefficients
into fractional monomials and controls nonzero character summands by a
root-of-unity factor times a unit. Its complete analytic proof inputs remain G3.

## 7. Two source formulas that should not be transcribed literally

The machine `sourceIssues` entries contain locators, corrections, checks and
erratum-search records. Both errors were visually verified in the author's v3
and occur in the publisher text as well. The intended arguments survive the
corrections; neither is presented as a false main theorem.

**E1, Lemma 4.6:** the action formula omits the factor x in the second tensor
factor. Without it, the right side is independent of x, so zero is not preserved
and the identity does not act as identity. Use multiplication by the cocycle
on x, as in the result inventory.

**E2, Proposition 4.13:** the displayed logarithm calculation subtracts the
logarithm of an already inverted line. It should add that logarithm, or subtract
the logarithm of the original line. Otherwise the purported cancellation gives
`2 tau_B` instead of zero.

The publisher page, arXiv history through v3 and targeted title/DOI searches
were checked on 22 September 2026. No matching correction was located. That
is not an exhaustive novelty claim. These findings have no independent reviewer
verdict yet. The block-matrix convention in the morphism proof is **not** listed
as an error: it can depend on row versus column notation.

## 8. Exact finite regressions actually executed

The following script passed locally with Sympy. It tests several ways a wrong
interface could still look plausible. It is neither a Lean proof nor a proof
of the analytic results.

```python
from math import factorial
import sympy as s

J = s.Matrix([[0, 1], [0, 0]])
N = s.diag(J, J)
I = s.eye(4)
assert N != s.zeros(4) and N*N == s.zeros(4)
assert s.Matrix.hstack(I.reshape(16, 1), N.reshape(16, 1)).rank() == 2
assert N.charpoly().as_expr() == s.Symbol('lambda')**4

A, B, C = J, 2*J, 3*J
assert A*B == B*A and A*J.T != J.T*A
k = s.kronecker_product
AB = k(A, s.eye(2)) + k(s.eye(2), B)
assert k(AB, s.eye(2)) + k(s.eye(4), C) == (
    k(A, s.eye(4)) + k(s.eye(2), k(B, s.eye(2)) + k(s.eye(2), C)))

x = s.Symbol('x')
tr = lambda p: s.rem(s.expand(p), x**3, x)
exp = lambda p: tr(1+p+p*p/2)
log = lambda u: tr((u-1)-(u-1)**2/2)
for a in range(-3, 4):
    for b in range(-3, 4):
        z, w = a*x+b*x*x, b*x+a*x*x
        assert log(exp(z)) == z
        assert tr(exp(z)*exp(w)) == exp(tr(z+w))
assert exp(x) != 1

for d in range(1, 9):
    V = s.Matrix([[s.Integer(i)**j for j in range(d+1)] for i in range(d+1)])
    assert V.rank() == d+1
    assert V[:1, :].rank() == 1 < d+1

v2_factorial = lambda n: sum(n//(2**i) for i in range(1, n.bit_length()+1))
for r in range(1, 10):
    n = 2**r
    assert n-v2_factorial(n) == 1
    assert 2*n-v2_factorial(n) == n+1

expm = lambda a: s.eye(2)+a*J
for a in range(-5, 6):
    for b in range(-5, 6):
        assert expm(a)*expm(b) == expm(a+b)
        assert expm(a)*s.zeros(2, 1) == s.zeros(2, 1)
assert expm(0) == s.eye(2)
for tau in range(-5, 6):
    assert tau+(-tau) == 0
    if tau:
        assert tau-(-tau) != 0

T = s.Matrix([[0, 1, 0], [0, 0, 1], [0, 0, 0]])
U = s.eye(3)+T/2+T*T/6
G = s.eye(3)+T+T*T/2
assert U.det() == 1 and T*U == G-s.eye(3)
assert s.Matrix.hstack(-B, A)*s.Matrix.vstack(A, B) == s.zeros(2)
assert s.Matrix.hstack(-J.T, A)*s.Matrix.vstack(A, J.T) != s.zeros(2)
print('PASS: spectral image, Higgs tensor, nilpotent units, evaluation, p=2, E1, E2, Koszul')
```

Every definition/construction in the JSON has intended API obligations and
at least three discriminating acceptance tests. These are specification tests;
only the finite script above is claimed executed.

## 9. What remains before acceptance

The JSON gap register G0–G8 is controlling. In particular: acquire the geometric
lift and proper-torsion originals; close local cocycle/intertwiner/cochain proofs;
read Fargues's classification and settle generic analytic-group ownership;
match the general Picard and representation-embedding suppliers; expose the
shared early Higgs interface; resolve the tensor scope and completed-line
choice checks; and obtain a reviewed pinned-library audit and independent
review of the source issues.

The five unrouted missing auxiliary items are intentional, with explicit gaps:
first-order lift existence, algebraic Picard specialization, topological
p-torsion, analytic p-divisible classification, and the representation embedding.
They must not be converted to opaque assumptions or silently counted as supplied.

A local repository clone was unavailable, so this session did **not** run the
unmodified full-catalogue `scripts/check_paper.py` or intake checks locally.
The submitted files require the normal Swarm check. No earlier worker's successful
checker run is being attributed to this new extraction. No Lean file was compiled,
no complete status is claimed, and no independent review has occurred.
