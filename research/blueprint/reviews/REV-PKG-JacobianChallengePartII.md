# Independent package review: JacobianChallengePartII

**Verdict: accepted with the corrections below.** The package is ready for a draft
TauCetiRoadmap pull request. This is a roadmap verdict, not a claim that its
geometric targets have been formalised. The open supplier roadmaps must precede
it in the upstream dependency order.

Codex, session `codex-TZm7pn`, 14 October 2026. Refs
[#7607](https://github.com/CBirkbeck/tauceti-explorer/issues/7607).
The package was written by Claude (Opus 5.5), session `claude-35dVql`; this
reviewer did none of that package job. The bot confirmed the review claim.

## Scope and form

Read the complete README, Suggested.lean, metadata and accepted 48-target
packet, together with WORKERS, PROTOCOL, expansion PROTOCOL, UPSTREAM_GUIDE and
PACKAGE_REVIEW. The upstream JacobianChallenge and AlgebraicVectorBundles
READMEs and suggested files supplied the form comparison.

All 48 mathematical targets remain in the eight layers. The packet's 60 named
API items and 52 named tests occur in the README; this is a mechanical coverage
check in addition to the statement-by-statement reading. The level-family
specialization preserves the intended universal application without depending
on the construction of a curve moduli space. No packet was edited.

The README starts with a summary, states scope, signs and supplier contracts,
and gives ordered layers, source locators, hypotheses, API, discriminating
checks and worked examples. It remains below the issue's 200 KB limit.
`metadata.toml` is the single line `topic = "math.AG"`. The mathematical package
contains no job identifiers, checkpoint language or source passages. The source
material is reorganised around the construction, rather than summarised in its
original section order.

## Corrections made

1. **Canonical relative polarization, §1.4.** The previous outline invoked the
   parent's field theta theorem as though it constructed theta polarizations
   over every local base. It now constructs the canonical family autoduality
   isomorphism `u` from Esteves–Gagné–Kleiman, using their independence theorem
   over the entire base and their base-change-compatible inverse. Set
   `λ_X = −u⁻¹`; field theta is used only to verify positivity. Their Abel map
   has the opposite sign to this package's Abel map. The added
   `PrincipalPolarization.abelPullback` API records `u∘λ_X = −id`, and the
   dual-number test compares origins differing by an infinitesimal Picard class.
   This supplies the missing overlap argument over nonreduced bases.
2. **Relative autoduality, §4.3.** It now consumes the canonical family `u` of
   §1.4, then uses pointed factorization, translation invariance of Pic⁰ and
   dual multiplication to obtain `i_α* = [d]∘u` on all test schemes.
3. **Both fibre conditions, §§4.6–4.7.** The old instruction to check that a
   lift retained the other projection condition was an unproved obligation.
   The proof now verifies the normal, integral, quasi-projective arithmetic
   hypotheses after base change to X and J. For X×J it uses constancy of curve
   degree on connected J fibres; for J×J it uses the Picard-class map from a
   connected J fibre, whose image meets and therefore stays in Pic⁰. The
   actual equalities already include the base-line correction. Each lift takes
   the d-th power, giving an explicit d² cokernel bound for the square.
4. **Relative Lie comparison, §6.1.** Replaced an unread book citation and a
   field-only deformation appeal by Kleiman's relative statement and the
   split dual-number units calculation, sheafification, O-linear structure and
   coherent base change. This works with the open smooth identity component
   even when the whole Picard object is an algebraic space.
5. **Source access.** Removed all operative citations to the author's unread
   Bosch–Lütkebohmert–Raynaud book. Every affected target has a public source
   and, where needed, an explicit derivation. The book was neither obtained
   nor read. No source excerpt was placed in the repository.
6. **Current-library boundaries.** Added the current field Euler-degree
   definitions and field `AbelianVariety.IsAlbanese` predicate as existing
   work, alongside the already recorded actual-class group, pullback and
   rigidified-functor APIs. Added the current ModularCurves elliptic-family
   interface and its polarization sign comparison. None is re-planned.
7. **Discriminating checks.** The inseparable Abel test now computes `[p]` on
   an elliptic curve and distinguishes finiteness from étaleness; it also
   computes the degree −1 case. The arbitrary-theta test now gives a genus-two
   example with `2[P]` not equivalent to the canonical divisor.
8. **Lean form.** Replaced the selective Mathlib imports by `import Mathlib`,
   as required by the current shape rule. The native coordinate definitions
   and their theorem signatures were retained; no heavy carrier was added.

## Source verification

Public PDFs were opened and the cited statements and relevant proofs read.
Page numbers below are those of the specified public versions, not journal
pagination. Yuan v4 has 125 pages; the packet used a later 126-page author
manuscript, so its appendix and late theorem pages differ by one. The package's
v4 locators already made the correct adjustment.

All nine affected subsections carrying the author's unverified book locators
were checked and supplied as follows:

| Package target | Public replacement and mathematical use |
| --- | --- |
| §0.1 degree constancy | Kleiman, proof of Theorem 4.8, pp. 28–29: fixed Hilbert polynomial loci; use the curve Euler-characteristic degree. |
| §0.2 degree components | DGH §6.1, p. 24; Kleiman, proof of Theorem 4.8, p. 29. |
| §0.3 representability | Kleiman Theorem 4.8, pp. 27–29, Proposition 5.19, p. 47, Exercise 5.23, p. 50; apply the supplier identity-component criterion. |
| §0.4 torsors | Kleiman Exercise 5.23, p. 50, with the stated étale-local curve section and tensor-law derivation; no assertion that the exercise itself states the full torsor interface. |
| §1.1 properness | Kleiman Proposition 5.20, pp. 47–48, Exercise 5.23, p. 50; the nonreduced-base criterion remains explicit. |
| §1.2 relative Jacobian | Yuan §2.2.1, p. 29; Kleiman Remark 5.26, p. 51. |
| §1.4 polarization | EGK Theorem (2.1), pp. 4–6, Proposition (2.2), pp. 6–7, Proposition (3.7), pp. 15–16, proof (4.1), p. 16; take the smooth-family specialization and correct the Abel sign. |
| §4.4 actual-to-relative | Kleiman Remark 2.11, pp. 20–21, sequence (2.11.4); distinguish cohomological and Azumaya Brauer groups. |
| §6.1 Lie comparison | Kleiman Theorem 5.11 and proof, pp. 42–44, Remark 5.12, p. 44; Yuan Lemma 3.4 proof, p. 44. |

The fixed random sample of 15 other targets (selection seed 7607) was checked
against the public sources:

| Target | Locator checked | Result |
| --- | --- | --- |
| §4.9 pointed square Picard comparison | Yuan §A.3, p. 108 | Axis-normalized actual classes, not the larger bi-Picard subgroup. |
| §5.5 triangular equivalence | Yuan Theorem 4.17(5) proof, p. 98 | Coordinate change; the arbitrary-group extension is separately derived by cancellation. |
| §3.11 symmetry | Yuan Definition 2.4, p. 30 | Twice-theta symmetry, with the supplier graph-bundle result. |
| §4.3 relative autoduality | Yuan Proposition 2.6 proof, p. 31 | Degree-d pullback; supplemented by the family theorem above. |
| §5.2 universal shift | Yuan Theorem 2.10(3), p. 37 | First coordinate retained and positive canonical shift. |
| §3.13 relative ampleness | Yuan Definition 2.4, p. 30 | Canonical ample twice-theta, with the supplier relative-ampleness contract. |
| §7.2 level Faltings–Zhang | DGH §6.1, equations (6.3), (6.5), p. 25 | Universal difference construction and arbitrary base change. |
| §3.1 Poincaré | Yuan §2.2.1, p. 30; Theorem A.3(2), pp. 109–110 | Negative addition sign. |
| §3.6 addition identity | Yuan Theorem A.3(2), p. 109 | Arbitrary theta class; normalization handled separately. |
| §4.5 actual torsion cokernel | Yuan Proposition 2.6 proof, p. 31 | Actual Picard classes, with the base correction retained. |
| §4.8 axis normalization | Yuan §A.3, p. 108 | Trivial restrictions, rather than chosen trivializations. |
| §7.1 level Jacobian | DGH §6.1, pp. 23–24, equation (6.1) | Fine-level setting; the generic family target avoids a moduli dependency. |
| §3.8 doubling | Yuan Theorem A.3(4) and proof, pp. 109–110 | Nonsymmetric formula contains the inverse-pullback term. |
| §2.3 pointed factorization | Yuan §2.2.1, p. 29, Proposition 2.6 proof, p. 31 | Degree-d multiplication plus translation. |
| §6.2 Hodge bundles | Yuan Lemma 3.4 and proof, pp. 43–44 | Rank-g comparison, permitting semi-abelian degeneration. |

Also checked Milne §8, Theorem 8.1 and discussion, pp. 27–28; Kleiman
Proposition 5.10, pp. 41–42; and Stacks Lemmas 35.23.21 (02L6), 35.23.25
(02LA), 41.7.2 (04XV). The Stacks hypotheses justify the local immersion and
finite-morphism descent used in Layer 2.

Read versions:

| Source | Public version | SHA-256 |
| --- | --- | --- |
| Yuan | [arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4) | `a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e` |
| DGH | [arXiv:2001.10276v3](https://arxiv.org/pdf/2001.10276v3) | `5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4` |
| Kleiman | [arXiv:math/0504020v1](https://arxiv.org/pdf/math/0504020v1) | `cc14e62f0ebebb8617777651bbcd08bb7548cb9fe955f3a25bb6491c5f3beeaa` |
| EGK | [arXiv:math/9911071](https://arxiv.org/pdf/math/9911071) | `ac72110ec0ae895f87f10da316f38ec0978e1d1737b1ed408599b7331b7f44d7` |
| Milne | [Jacobian Varieties notes](https://www.jmilne.org/math/xnotes/JVs.pdf) | `36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486` |

## Closure, suppliers and duplication

Read the 11 packet baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: invertible sheaves,
actual-class skeleton and tensor, residue-weighted divisor degree, module
cohomology, the field abelian-variety carrier, fppf topology, smooth morphisms,
`CommRing.Pic`, the native Hom group and precomposition of division. These
supply precisely the limited interfaces the README assigns them.
`CommRing.Pic` is an invertible-module class group; it supplies no relative
Picard representability theorem. The Tau Ceti actual-class skeleton at the pin
has only a commutative monoid interface.

The current read-only roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27`
(including the nine newer roadmaps and Completed) and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were searched by mathematical
carriers, hypotheses and operations. Read the relevant actual-class dual,
pullback and commutative-group APIs, the rigidified Picard functor, Euler degree,
Albanese predicate, and the numerical StableReduction Picard construction.
The last is a component/divisor lattice quotient, not a relative Picard scheme.
No further target duplicated an existing family construction. The additional
current interfaces are recorded only as boundary deferrals. **No new target
removals or ownership moves were needed.**

Supplier contracts were checked in the following upstream text:

| Supplier | Revision read | Contract and boundary |
| --- | --- | --- |
| [SchemeAndStackFoundations #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779) | `3c505772db579625b0447791a0d6a8712b4e2bea`, merged | fpqc locality, relative duality, field section-free Picard/Abel interfaces, invariant differentials, Hilbert/Quot. |
| [AbelianSchemesAndArithmeticModuli #849](https://github.com/TauCetiProject/TauCetiRoadmap/pull/849) | `1d8f8492f3c4aebf4bcc54d393fd7a9eeefb0130`, open | A0–A3 carriers, rigidity, cube, dual/Poincaré, positive Mumford convention, graph bundle, nonzero multiplication, pairing and full level. Properness alone is not treated as projectivity. |
| [AlgebraicModuliForArithmeticGeometry #853](https://github.com/TauCetiProject/TauCetiRoadmap/pull/853) | `2af27444982616fde961076096ad03f9d60f9b62`, open | §§7.3, 7.6.1, 7.9 actual/sheaf comparison, algebraic-space representability, Brauer obstruction, base change and identity-component criterion, including nonreduced-base smoothness. |
| [NeronModelsAndSemistableAbelianVarieties #852](https://github.com/TauCetiProject/TauCetiRoadmap/pull/852) | `15a4a79274efedbea63b7df3b36d67651c7dfebc`, open | §4.13 stable-family semi-abelian Pic⁰; fibre torus rank may jump. |

JacobianChallenge A–F, StableReduction 2–3, AlgebraicVectorBundles L0B–L0C and
ModularCurves §2D are consumed rather than re-planned. The kept elliptic
specialization fixes its sign relative to ModularCurves. The existing graph
bundle, cube identity and general Brauer sequence remain supplier applications,
not newly owned infrastructure.

The Caraiani–Newton ordering puts the general suppliers below this family
application; JacobianChallengePartII itself is outside the 94-roadmap list.
There are no `UPSTREAM:` or `FoundationsAndLibraryIntegration` dependencies in
the package. Layer 7 takes an arbitrary level-equipped curve family as input;
StableReductionPartII constructs the fine moduli space downstream. This
preserves the cycle removal made by the package author. Open supplier PRs are
an upstream ordering requirement, not a missing package contract.

## Definition tests and adversarial mathematics

Each main definition has at least three discriminating README tests: degree
components (elliptic, disconnected base, field comparison); torsors (difference,
missing origin, diagonal); relative Jacobian (elliptic, absence of curve point,
dimension); polarization (elliptic sign, absent theta, dual numbers); section-free
Abel (field, genus-one torsor, nonreduced base); degree-d Abel (zero, origin,
inseparable/negative); curve difference (diagonal, elliptic difference,
origin independence); Poincaré (axis, sign, nonsymmetric theta); degree-one theta
(genus one, genus two, nonsymmetry); twice-theta (degree two, diagonal dual,
missing degree-one class); actual Pic⁰ and bi-Picard (base classes, algebraic
triviality, non-examples); axis-normalized Picard (axes, distinction from
bi-Picard, trivial class); universal shift (zero shift, genus-one canonical-degree control,
fixed first coordinate); Faltings–Zhang (one tail, diagonal, pointed formula); shifted
Faltings–Zhang (one coordinate, two coordinates, diagonal); triangular
equivalence (one coordinate, inverse pair, diagonal). The light helper objects
in §5.6 also have three tests each: shifted canonical power, tail multiplication,
head/tail decomposition and represented-point homomorphism.

The full mathematical pass covered every target and defining convention:

| Statements checked | Instances and computation | Outcome |
| --- | --- | --- |
| §§0.1–0.4 | Degree 0/1 on disconnected tests; elliptic Pic¹; genus-one torsor without a point; δ(L,L)=0, δ(L,M)=M−L. | Degree is locally varying; no global origin inferred. Public torsor derivation supplied. |
| §§1.1–1.3 | Genus one without a curve point; constant and disconnected families; dual-number base. | J has identity and dimension g; projectivity waits for the ample bundle; base change is arbitrary. |
| §1.4 | Elliptic φ of O(0) sends a to O(−a−0); two degree-one origins over dual numbers. | Family autoduality fixes descent and the sign `uλ=−id`. |
| §§2.1–2.3 | d=0, 1, −1, p in characteristic p; change α by a degree-zero class. | Constant zero-degree map; positive difference sign; multiplication plus translation; strengthened negative controls. |
| §§2.4–2.5 | Genus-one isomorphism; genus-two immersion; inseparable [p]; d=0 constant map. | Proper/unramified/universally injective criterion applies; nonzero is essential; finite does not mean étale. |
| §§2.6–2.7 | Diagonal, swap, three-point cocycle, origin translation, diagonal base change over X. | y−x, and the over-X Abel map has that same direction; all tests are morphism identities. |
| §§3.1–3.3 | Elliptic theta O(0), graph bundle degree 2, diagonal Poincaré degree −2; sectionless family. | Evaluation convention requires −λ for P; twice-theta is the supplier graph bundle. |
| §§3.4–3.5 | g=1: inverse-theta pullback α and theta pullback α; g=2: inverse pullback 2α and theta pullback ω. | Degrees equal g; arbitrary α remains allowed. |
| §§3.6–3.9 | Elliptic diagonal; nonsymmetric genus-two theta; [2]*theta=3theta+[−1]*theta. | Negative addition, both theta terms on the diagonal; no symmetry hypothesis inserted. |
| §§3.10–3.13 | Geometric class 2theta; inverse bundle non-ample; zero rigidification; family without theta. | Symmetry and ampleness use graphBundle_spec; positivity and inverse distinguished. |
| §§4.1–4.2 | Base pullback classes; nontrivial degree-zero elliptic line bundle; Poincaré on two factors. | Actual classes retain base contributions; algebraic triviality, not a degree notion on higher-dimensional fibres. |
| §§4.3–4.5 | d=1, d>1, characteristic dividing d; no curve section; identity on J. | Relative [d] is not surjective on S-points by assumption; the actual base correction gives a d-th-power lift. |
| §§4.6–4.7 | Restrict a lift along the other axis; connected J fibre; successive d-th powers. | Added proof of both conditions; d² bound, with normal-base hypotheses verified. |
| §§4.8–4.9 | Base field with pointed curve; Poincaré axis restrictions; nontrivial external degree-zero classes. | Pic⁻ differs from Pic⁰⁰; field comparison uses the pointed Albanese property twice. |
| §§5.1–5.2 | g=1 excluded for nonzero canonical degree; y=0; elliptic coordinate 3+2=5. | Shift keeps y and adds the positive canonical Abel value. |
| §§5.3–5.4 | m=1, m=2, diagonal tuples, arbitrary pullbacks. | Shifted tails remain unscaled differences; no maximal-variation hypothesis. |
| §5.5 | n=0; pair (f,g/f); small diagonal; two noncommuting GL₂(F₂) matrices. | Inverse restores the head on the right: (a,b)↦(a,ba), not (a,ab). |
| §5.6 | Empty tail; e=−1,0,1,2; characteristic dividing 2g−2; noncommutative group. | B≫R=τ≫D; e=0 kills tails; group-homomorphism and factorization interfaces require commutativity; geometric transfers assume the property of [e]. |
| §§6.1–6.3 | Smooth family, one nonseparating node, compact-type degeneration. | Torus rank can be 1 or 0 while Lie/Hodge rank remains g; determinant applies to the fixed vector-bundle isomorphism. |
| §§7.1–7.2 | Level ℓ=3; g=1 carrier check outside the g≥2 target; 48 GL₂(F₃) bases versus 24 symplectic bases. | Pairing compatibility is additional to FullLevel; ℓ invertible and ζ fixed; no moduli construction promised. |

There is no scalar division or denominator whose nonvanishing is omitted.
Group quotients use inverses of actual group elements. The integer e=0 is
handled without an isogeny claim. Morphism descent and base change use all test
schemes, rather than geometric-point equality.

## Lean signature and shape check

The Lean file contains only native Over(S) group-object coordinate definitions,
finite-product equivalences/isomorphisms, milestone signatures and examples.
Its data fields have real bodies; only propositional proof fields and theorem
proofs use `sorry`. There is no new Picard, moduli, cohomology or abelian-scheme
carrier. The closing comment accounts for every README definition whose carrier
is absent at the pins. The finite-product helpers bundle existing data rather
than develop a geometric theory.

Spot checks against the README included more than the required ten signatures:

| Lean signature | Hypotheses and conclusion compared |
| --- | --- |
| `CurveDifference.pointedMap_value` | Second Abel value divided by first. |
| `CurveDifference.pointedMap_translate` | Commutativity required for origin independence. |
| `CurveDifference.pointedMap_baseChange` | Arbitrary scheme base change and product comparison. |
| `UniversalShift.baseChange` | Scheme pullback, retaining the first coordinate. |
| `FaltingsZhang.pointed` | Supplied difference identity; m+1 inputs and m outputs. |
| `FaltingsZhang.proper` | Proper structure map for the X fibre power and separated structure map for the A fibre power. |
| `ShiftedFaltingsZhang.first` / `tail` | First shifted canonical coordinate; unscaled tail. |
| `TriangularCoordinateEquivalence.inverse` | Right multiplication, without commutativity. |
| `TriangularCoordinateEquivalence.schemeIso_inv_coordinates` | Same inverse on every represented test point. |
| `TriangularCoordinateEquivalence.schemeIso_baseChangeIso` | Equality of complete transported isomorphisms. |
| `TailMultiplication.headTailIso_inverse` / `split` | Tuple order and product-transfer identity. |
| `TailMultiplication.points` / `represented` | Commutative group for bundled powering homomorphism. |
| `shifted_power_factorization` | Commutativity and the explicit degree-difference hypothesis; that hypothesis is the Abel identity, not the conclusion. |
| `TailMultiplication.finite`, `flat`, `finitePresentation`, `surjective` | Each assumes the corresponding geometric property of [e] separately. |

These are signatures, not proofs of truth. The mathematical pass above is
separate from elaboration. No `True` placeholder, sorry-defined predicate or
sorry-defined data was found.

## Validation and remaining work

- `lean-check` on the final Suggested.lean: exit 0, 78 warnings, all
  `declaration uses sorry`; no other warnings or errors. Compilation used the
  shared pinned build, with sufficient memory; no build or library update was run.
- `scripts/check_sorry_data.py`: exit 0, no offenders.
- `scripts/check_blueprint.py` on the unchanged accepted packet: 0 errors,
  0 warnings; 48 nodes, 60 API items, 52 tests, eight layers.
- `research/blueprint/intake.py check-files` on the deliverables and handoff:
  0 problems.
- `git diff --check`: clean.

No uncorrected package defect or source gap remains. The maintainer can port
this package once the cited supplier PRs meet upstream ordering. All
implementation work remains for Tau Ceti; acceptance here approves the
mathematical roadmap and its representative signatures.
