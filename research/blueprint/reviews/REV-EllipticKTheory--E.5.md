# Independent review: Elliptic K-theory, E.5

**Accepted with corrections.** Job `REV-EllipticKTheory--E.5`, issue #6432,
reviewed by Codex — codex-kILZ6Z on 2026-10-06. The input was authored by
Codex — codex-jHS6hw for `BP-EllipticKTheory--E.5` (#6480); this reviewer did
none of that work. The acceptance is of a mathematical planning pass. No
proof is claimed implemented.

The packet remains `complete` and E.5 remains `planned`, not `closed`.
All targets have nodes, and unresolved supplier extensions end in precise
requests and recorded gaps, as PROTOCOL section 0 allows. The final packet has
11 nodes (8 theorems, 1 comparison, 1 application, 1 construction), 6 API
entries, 5 discriminating tests, 4 planets, 7 baseline declarations, 15
requests and 3 gaps. All 11 nodes have `corrected` review verdicts because
all 11 source excerpts needed correction. No nodes or baseline declarations
were added or removed.

## Source checks and corrections

I independently read the author-hosted public chapters
[III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf),
[IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf),
[V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) and
[VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf).
Their downloaded SHA-256 hashes agree with the packet's recorded hashes.
The relevant material is III.2.5.1 and III.7.2(a); IV.2.3.1–2.5,
Exercise IV.2.6 and IV.6.9; V.1.5–1.5.1, V.3.3.2, V.3.11–3.12,
V.6.12–6.12.1; VI.4.7 and VI.6.1–6.7. The accepted parent supplies the
isogeny determinant result rather than Weibel's projection formula alone.

Every original excerpt from Weibel was just a theorem number, and the parent
excerpt was just a node slug. I replaced these with words from the relevant
passage and a specific mathematical match. Mathematical glyphs in the excerpts are normalized to inline Unicode, preserving the source formulas. The matches distinguish the source
statement from its elliptic specialization and from derived lattice/degree
presentations. I corrected the chapter pagination: V.3.3.2 is on p.21,
V.1.5 and V.1.5.1 on p.4 (proof continues on p.5), and V.6.12–6.12.1
on p.48. Added IV.2.3.1–2.5/Exercise IV.2.6 citations document the
spectrum coefficient step.

Source issue `EllipticKTheory/E17` is **confirmed**. On the independently
rendered author-copy VI p.38, the sentence immediately before the coefficient
table prints the integral group of X, without the bar. Both tables and the
universal-coefficient proof concern the geometric curve. For X = P¹/F₂,
n = 2 and odd ℓ, K₁(X) = 0, whereas K₂(X̄; Qℓ/Zℓ) has two nonzero
divisible summands. Thus the printed sentence cannot be literal. The finding
remains scoped to this author-hosted copy; I did not collate the published
volume or claim a new error. The existing searches for an author correction
and the accepted parent's E1–E16 are recorded. E6 separately concerns a
missing bar in the edge-map proof. The correction already used in the packet
is sound; its mathematical conclusions are unaffected.

## Every node

The names below are the suffixes of `EllipticKTheory:E.5/` node IDs.

| Node | Independent mathematical and closure check |
| --- | --- |
| elliptic-operation-comparisons | A nonzero isogeny is finite flat of positive rank equal to its field degree through E.1. The S.2 pullback, perfect proper pushforward and affine-transfer nodes supply the actual maps. No zero isogeny or arbitrary pushforward is included. |
| isogeny-rank-determinant-action | Projection formula gives multiplication by (d,0,P_f). E.2's rank–Pic product gives (dr,de,dP+rP_f); applying it to 1 proves the integral K₀ iff. Separable trace duality gives determinant square trivial; odd [m] is both m-torsion and 2-torsion using the imported Picard dual, hence trivial. Degree-two separable covers in characteristic unequal to two give the nontrivial determinant counterexample. All these clauses are in the accepted parent. |
| projective-line-finite-field-comparison | S.5's O,O(−1) basis has inverse (π_*x,σ*x−π_*x); O(m) = (m+1,−m) and the rational-point class = (1,−1). Quillen's field groups give vanishing positive even groups and two odd cyclic summands. Added the direct elliptic odd/even node prerequisites for the contrast with elliptic even groups. |
| harder-elliptic-input-closure | Keep n=1 reciprocity/constant units separate from n=2 tame-kernel finiteness. III.7.2(a) is higher Milnor vanishing, not the latter theorem. For n≥3 use Geisser–Levine and the five-term localization segment, including K_(n+1)(F), to transport unique p-divisibility. Finite generation then gives finite order prime to p. Added the direct E.4 all-degree coniveau node and K₁/origin-splitting nodes; the E.3 localization node alone only states low degrees. |
| geometric-elliptic-k-modules | The integral odd term is D(i)² and even term is E(kbar)[prime-to-p torsion](i). In divisible coefficients the odd degree 2i−1 instead has elliptic twist i−1. The spectral-sequence and equivariant splitting are explicit M.6/M.7 requests, and curve Kummer/trace is imported from EDC.2. Added the general spectrum universal-coefficient supplier H.6 rather than treating L.1's ring-only interface as scheme coefficients. |
| elliptic-cohomology-frobenius-descent | Preserve j≥2 and ℓ unequal to p. Arithmetic Frobenius has twisted rational eigenvalues q^j, q^(j−1)α and q^(j−1)β, and q^(j−1); the Hasse bound excludes one. Continuous Hochschild–Serre and the coefficient triangle then give the invariant and degree-shift identifications. At trivial action H¹(G,Qℓ)=Qℓ; the source's unrestricted rational-invariants argument is not reused. |
| finite-elliptic-k-descent | The theorem concerns the actual base-change map for n>0, not an abstract equality of group orders. Its coefficient argument uses degree n+1. Added H.6 and the direct parent K₁/origin-splitting nodes for the separate n=1 branch. M.6/M.7 requests retain base-change, filtration and edge-map compatibility. |
| twisted-frobenius-kernel | The existing q-power point map is arithmetic Frobenius on geometric points. Coprime annihilators, not all torsion, are essential. The construction works over arbitrary field extensions; i=0 tests conventions but is not positive even K-theory. Clarified this in the constructor API, supplied the algebra-equivalence clause with its underlying point map, and corrected test kinds. |
| positive-odd-elliptic-k-groups | VI.6.7 and geometric invariants give two Z/(q^i−1) summands for i≥1; K₁ is k×². Generators are not claimed canonical. |
| positive-even-elliptic-k-groups | VI.6.7 identifies K₂ᵢ with B_i for i≥1. On 0→TℓE→VℓE→E[ℓ∞]→0, invertibility of 1−q^iπ on Vℓ identifies the torsion kernel with the lattice cokernel. The invariant subgroup of Tℓ would be zero and is not substituted. The lattice presentation is a derived result, not attributed directly to Weibel. |
| elliptic-k-group-orders | The odd order is (q^i−1)². The even order is det(1−q^iπ) = 1−a_q q^i+q^(2i+1). Upstream degree theory identifies it with the separable degree; its differential is the identity. The Hasse bound gives positivity, and reduction modulo p gives one. This determines order, not invariant factors. |

## Pinned library and ownership

I read each of the seven declarations at the recorded commits, not just the
name index. All are confirmed; none needed removal or replacement.

| Declaration | Pinned source and actual interface |
| --- | --- |
| WeierstrassCurve.Affine.Point | [Mathlib Point](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean): infinity and nonsingular affine points; the existing additive group over fields. |
| WeierstrassCurve.Affine.Point.map | Same pinned module: additive point map along a base-field algebra homomorphism between extensions. |
| FiniteField.frobeniusAlgHom | [Finite field basics](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Basic.lean): the #k-power algebra endomorphism. |
| AddSubgroup.torsionBy | [Torsion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Torsion/Basic.lean): existing multiplication-kernel subgroup; the integer parameter is compatible with positive natural annihilators. |
| TauCeti.Isogeny | [Basic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean): nonzero coordinate/function-field isogeny. It does not already supply the missing scheme or point-action comparisons. |
| TauCeti.Isogeny.degree | [Degree](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean): field-extension finrank; the finite-flat rank comparison is imported from E.1. |
| TauCeti.Isogeny.frobeniusIsogeny | [Frobenius](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Basic.lean): q-power isogeny and its function-field pullback. General point/scheme action is not provided at the pin. |

The accepted audit and `data/library-coverage.json` do not mark the E.5
higher K-theory targets as built. The plan reuses the existing point group,
point map, torsion and Frobenius. Accepted RS-18 assigns generic operations
and projective bundles to SchemeKTheoryOperations S.2/S.5, and this packet
imports their finer nodes. It imports the parent E.1–E.5 interfaces and the
WeightsInEtaleCohomology R34.2 node. It does not re-plan Tate modules,
Weil pairings, elliptic isogeny degree theory or Picard duality from upstream.
The JacobianChallenge and GrothendieckEulerForms documents were read for
upstream granularity and boundary examples; the relevant EllipticCurves and
ModularCurves supplier sections were also checked.

Every cross-roadmap supplier statement was compared with its use: S.2 and
S.5; L.1's field groups and algebraic-closure modules; N.3; T.2/T.4/T.5;
M.5d/M.6/M.7; EDC.2 trace/pairings; R01.1; R34.2; the upstream elliptic
layers 1–3 and ModularCurves 2d; and the newly requested H.6. H.6 already
owns general spectrum cofibers and Bockstein sequences. The added request
specifies the coefficient transition maps, divisible-coefficient colimit,
all required degrees and scheme/Galois naturality. No natural splitting is
assumed. This increases requests from 14 to 15 and expands the existing
coefficient gap without adding a competing construction.

Confirmed `RT-AREA-ktheory-2/1` is addressed in both the packet and the reader:
number-field N.3/T.5 nodes are not passed off as function-field inputs;
Milnor vanishing and tame-kernel finiteness have separate contracts;
M.5d's logarithmic-differential result is not passed off as full
Geisser–Levine; and absent upstream interfaces remain requests. The four
Part II proposals keep these general extensions at their owners. The review
adds the direct coefficient and localization links without changing those
boundaries. No unresolved mathematical contradiction was found.

## API, examples and validation

The one construction has six API entries. Its field-map entry now has both
the preservation theorem and a supplementary algebra-equivalence signature
specifying the underlying point map. Extensionality, inclusion, additive
structure and restriction universal property are inherited from the existing
subgroup, not rebuilt. Identity and composition restrict the existing point-map
laws. All six entries and five tests have corresponding elaborated signatures.

Test kinds now use PROTOCOL section 12: one degenerate case, three
computations and one non-example. Independently enumerating the affine points
of the four small equations gives rational point counts 4, 4, 1 and 5,
respectively. The named rational two-torsion points are nonsingular and
self-inverse. For y²+y=x³+x+1 over F₂ the trace is 2 and the geometric kernel
orders are 1 at i=0, 5 at i=1 and 25 at i=2. For y²+y=x³+x the trace is −2
and the i=1 order is 13. These tests detect missing twists, wrong trace sign
and inclusion of characteristic torsion. The origin case covers i=0.

The four planets are central constructions/theorems: Isogeny projection
formula, Harder finiteness, Twisted Frobenius kernel and Finite-field elliptic
K-groups. They are mathematical names and fit the stage's six-planet ceiling.
Assembly must choose the stage-wide selection together with the parent's
planets rather than concatenate both lists.

Validation completed on 2026-10-06:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticKTheory--E.5.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/EllipticKTheory--E.5.lean`: exit zero; exactly 13 warnings, all declarations using `sorry`.
- Independent finite-field enumeration and equation-derivative checks passed for the four displayed examples.

Lean elaboration checks the actual point-subgroup construction, its API, the
five tests and point-kernel cardinality signature. It does **not** check the
commented higher K/cohomology/Tate contracts: their actual supplier types are
absent. No substitute K-group or assumed comparison was introduced. Every
proof remains admitted. The coverage wording now makes this distinction
explicit.

## Handoff to the orchestrator

There is no remaining independent-review task. The three recorded gaps and
15 requests still need their suppliers before implementation. Route the four
Part II proposals to the respective owners. During assembly, include the
new direct E.4/H.6 dependency links and explain H.6's scheme-spectrum
universal-coefficient step in the merged reader. The separate E.5 reader is
not an authorized review deliverable, so its prose was left intact; its six-API
count and mathematics still agree with this packet. Reconcile the added
supplier detail and corrected chapter pagination when assembling.
