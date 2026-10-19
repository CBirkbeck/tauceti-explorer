# Independent review: EffectiveBoundsPartII

Refs #3520. Codex (GPT-6), session `codex-wGviuY`, 19 October 2026.

**Accepted at target level.** All 26 nodes are verified, and all 25 baseline
citations are confirmed at their stated pins. This accepts a complete planning
pass. It does not assert proof closure or implementation. EB.0–EB.2 remain
closed at target level; EB.3–EB.5 remain planned with two precise open supplier
requests. There are no unrecorded mathematical gaps or unresolved contradictions.

The designer was session `codex-t0cpUz`, as recorded in the
[design handoff](../handoff/DESIGN-EffectiveBoundsPartII.md) for
[#3402](https://github.com/CBirkbeck/tauceti-explorer/issues/3402).
This independent session's [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/3520#issuecomment-6258713883)
is separate. This reviewer did not author the design.

## Counts and changes

The packet retains 26 nodes: 7 constructions, 2 definitions and 17 theorems;
51 API entries, 34 distinguishing tests, 18 planets and 25 baseline declarations.
All nine definitions/constructions have at least three tests and explicit uses.
All 25 routed arithmetic source items have stable node coverage; the additional
node is the coefficient-box carrier. All implementation statuses stay unchecked.

One baseline annotation was clarified: the exact hypotheses of
`Algebra.Etale.iff_exists_algEquiv_prod` are `EssFiniteType` and `FormallyEtale`.
The original consequence for an etale algebra was valid, but the annotation now
states the library theorem's hypotheses explicitly and explains why the
finitely presented Jacobian-open algebra over Q satisfies them. No citation was
removed or replaced. No node, prerequisite, statement, API item, test or planet
was added, removed or corrected. The roadmap definition and suggested Lean file
need no edits. The reader now records the review and the same baseline detail.
The packet contains a separate justification for each of the 26 checked nodes.

## Source checks

Independently read Couveignes, [*Enumerating number fields*](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf),
Annals of Mathematics 192 (2020), 487–497, in full, including references.
SHA-256: `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`.
Each node's locator and matching explanation was checked against this version:
Proposition 1, §2 p. 490; the model construction, §3 pp. 491–495 and Proposition 2
p. 495; Theorems 1–2, pp. 487–488 and their estimates in §4 pp. 495–496.
The displayed hypotheses r≥1 and d≥5 on printed p. 491 were also visually
checked against the PDF, rather than trusting the extracted comparison glyphs.
The eventual degree condition is retained, and one enlarged absolute constant
covers all thresholds in the final statements.

No source error was identified in these targets, and `sourceIssues` remains
empty. The [publisher's article page](https://annals.math.princeton.edu/2020/192-2/p04)
and a title/author correction search disclosed no correction; this is a bounded
check, not a claim that every possible correction has been excluded. No source
passage or section-by-section source summary is included in the deliverables.

The generic supplier theorems were checked in their actual roadmap statements.
This review does not claim an independent reading of Siegel, Martinet or Fulton.
Their generic machinery is imported, and the two finer missing interfaces remain
explicit requests. The maintainer's cleared-source index was consulted; no
uncleared book copy was used.

## Baseline receipts

Statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
Mathlib sources were read in the checkout at that commit; Tau Ceti statements
were read directly from the pinned Git objects, separately from its current
library. Names alone were not used as evidence.

| Declaration | Module under the named library | Fit and boundary |
|---|---|---|
| `NumberField.discr` | `NumberTheory/NumberField/Discriminant/Defs.lean` | Signed integer discriminant of the ring of integers; size bounds take its absolute value. |
| `NumberField.discr_ne_zero` | Same | Nonzero discriminant gives absolute value at least one. |
| `NumberField.discr_eq_discr_of_algEquiv` | Same | Invariant under Q-algebra equivalence, so descends to the class count. |
| `NumberField.rootDiscr` | `NumberTheory/NumberField/Discriminant/Basic.lean` | Existing real root discriminant with inverse real degree exponent. |
| `NumberField.mixedEmbedding.covolume_integerLattice` | Same | Standard product-volume covolume is `2^(-r₂) sqrt(abs disc)`, before the arithmetic measure change. |
| `NumberField.mixedEmbedding.finrank` | `NumberTheory/NumberField/CanonicalEmbedding/Basic.lean` | Real dimension equals the field degree, counting each complex coordinate twice. |
| `NumberField.mixedEmbedding.latticeBasis` | Same | A real basis of mixed space from an actual integral basis, with lattice compatibility. |
| `NumberField.canonicalEmbedding.norm_le_iff` | Same | Sup-norm bound iff every complex embedding is bounded. |
| `NumberField.house` | `NumberTheory/NumberField/House.lean` | Existing canonical-embedding sup norm. |
| `NumberField.house_eq_sup'` | Same | Maximum of the embedding moduli. |
| `NumberField.one_le_house_of_isIntegral` | Same | Requires both integrality and nonzero element; the witness construction supplies them. |
| `MvPolynomial.restrictTotalDegree` | `RingTheory/MvPolynomial/Basic.lean` | Native bounded-total-degree submodule. |
| `MvPolynomial.basisRestrictSupport` | Same | Native restricted monomial basis; finite coefficient coordinates are imported from GI.0. |
| `MvPolynomial.mem_restrictTotalDegree` | Same | Membership exactly matches total degree, rather than separate variable degrees. |
| `MvPolynomial.aeval` | `Algebra/MvPolynomial/Eval.lean` | Actual algebra evaluation used in both the integral kernel and rational field map. |
| `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` | `Combinatorics/Nullstellensatz.lean` | An integral domain and strict individual-degree/grid-cardinality inequalities; apply over C with D+1 distinct grid values. |
| `Algebra.discr_not_zero_of_basis` | `RingTheory/Discriminant.lean` | Separability of number fields makes the rational-basis embedding matrix invertible. |
| `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two` | Same | Square embedding determinant computes the discriminant; complex norms produce the absolute discriminant in the Hermitian identity. |
| `ZLattice.covolume_eq_det_mul_measureReal` | `Algebra/Module/ZLattice/Covolume.lean` | Requires a discrete full lattice and Haar measure; apply in the intrinsic row span with an orthonormal reference basis. |
| `ZLattice.covolume_div_covolume_eq_relIndex'` | Same | Nested full lattices in a real inner-product space; the smaller lattice has the larger covolume. |
| `NumberField.finite_of_discr_bdd` | `NumberTheory/NumberField/Discriminant/Basic.lean` | Finite-dimensional intermediate fields in one characteristic-zero ambient field; pass to the ST.0 quotient in Qbar. |
| `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` (Tau Ceti) | `NumberTheory/EffectiveBounds/HermiteCount/Basic.lean` | Existing explicit fixed-ambient bound; not the new degree-sensitive discriminant exponent. |
| `NumberField.hermiteCountBound` (Tau Ceti) | Same | Existing primitive-polynomial counting expression, retained as reuse evidence. |
| `Algebra.Etale.iff_exists_algEquiv_prod` | `RingTheory/Etale/Field.lean` | Essential finite type plus formal etaleness gives a finite product of separable field extensions, possibly empty. Its proof establishes finite-dimensionality in this setting. |
| `MvPolynomial.pderiv` | `Algebra/MvPolynomial/PDeriv.lean` | Native bundled partial derivation; evaluated determinants commute with embeddings. |

## Closure and supplier contracts

Every stage target is realised, with each non-routine dependency supplied by a
local node, an exact imported statement, or one of the two recorded requests.
The target-level granularity is appropriate: matrix rank descent, determinant
identities, denominator clearing and finite-dimensional annihilator arguments
stay in their target's proof sketch.

The decisive checks were:

- The weighted canonical measure, house gauge and coefficient Euclidean metric
  are kept separate. Minkowski witnesses need not be an integral basis. The
  short rational basis is not used to compute the field discriminant.
- The arithmetic parameter change is invertible over C. GI.5's generic-affine,
  maximal-minor and minor-degree statements have the required dimension and
  characteristic-zero hypotheses. Its integer-coefficient pullback export is
  not used for the complex embedding substitution; the pinned grid theorem is.
- GI.0 supplies monomial count, coefficient coordinates and coefficient metric;
  GI.1 supplies value evaluation, derivative-on-kernel and jet-kernel-split.
  The integer relations span the entire complex value kernel before the
  derivative argument is applied.
- GN.0 supplies arithmetic orthogonal saturation, primitive complementary
  covolume and Hermitian Hadamard. The transpose image has index
  `[O_K:im(ev_Z)]` in the integral orthogonal; the nontrivial-index example
  `Q(sqrt(5))` tests precisely this distinction. The Gram identity retains
  complex conjugation and the absolute discriminant denominator.
- GN.1's upper second-Minkowski inequality, attaining independent witnesses and
  ordered-product root bound have the necessary full-lattice and body
  hypotheses. Keeping exactly `ell+1−n` equations leaves codimension n−1,
  so n independent block annihilators cannot all exist. One selected determinant
  is an element of K, hence nonzero at every embedding without normality.
- SF.0's exact atlas `jacobian-etale-algebra` statement includes the field-base
  finite-etale algebra and the factor projection compatible with the given
  surjection. The arithmetic component map uses the quotient/localization
  universal property and rational evaluation. Other field factors are allowed.
- The least positive binomial rank depends only on n. Its ratio, threshold tests
  at n=14,15 and eventual logarithmic bound support setting d=r. Model/factor
  pairs map onto unweighted ST.0 isomorphism classes; no one-model-one-field
  injection or automorphism weight is assumed. The final exponent estimate is
  uniform in H and includes H=1.

The requests remain necessary and precise:

| Supplier | Requested interface | Direct consumer |
|---|---|---|
| GN.1 | Intrinsic ell-dimensional Euclidean unit-ball volume at least `2^ell ell^(-ell/2)`, via the inscribed cube and orthonormal-coordinate invariance, for ell≥1. | EB.3/independent-short-relations |
| SF.5 | Total isolated local multiplicity at most `d^r` for r degree≤d equations in affine r-space, allowing positive-dimensional components elsewhere; apply on the nonsingular Jacobian-open locus. | EB.5/components-to-classes |

The available isolated-plane node does not supply arbitrary r. The general
upstream Bézout target owns the geometric argument; this continuation requests
its isolated-point consequence. Both requests are honest leaves, so they prevent
closure of the stated downstream stages without preventing acceptance of the
complete planning pass.

## Reuse, scope and tests

Read the relevant reviewed library-audit records: GN.0's native lattice and
covolume infrastructure is already built, GN.1's second-Minkowski theorem is
missing at the pins, and SF.5's general intersection machinery is not built.
No existing carrier or audited library theorem is replanned as a new definition.

Read current Completed/EffectiveBounds's README and Suggested.lean, current
GlobalNumberFields's scope and Layer 3 reader/signatures, and IntegralLattices's
Layer 2 reader and covolume signature. The latter's successive minima are
squared integral-form values, not the general house-body minima consumed here.
Current Tau Ceti effective-bounds sources were also inspected at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The completed parent's fixed-ambient primitive-polynomial count is an input;
GlobalNumberFields counts ideals in a fixed field, rather than field classes.
The arithmetic compact-model assembly is new in the stated direction.

Current TauCetiRoadmap main was additionally checked at
`f30bfe0a3b9d28515e04a1b779af08792e57ea76`: the
[SF §0.10 Jacobian target](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f30bfe0a3b9d28515e04a1b779af08792e57ea76/TauCetiRoadmap/SchemeAndStackFoundations/README.md#010-geometrically-unibranch-local-rings-and-schemes)
and §5.12 general Bézout target are already owned upstream. The current
Suggested.lean leaves these geometric targets in that README. Over an arbitrary
ring a Jacobian localization is etale of finite presentation but need not be
finite; this consumer works over Q and uses the exact field-base supplier
contract. No upstream roadmap was changed or reviewed as a separate job.

The roadmap layers and direct suppliers follow the arithmetic construction in
order. Regulator estimates, monogenicity, optimal exponents and a terminating
enumeration algorithm remain out of scope. Planet names describe the key
objects and named results rather than paper locators.

Every API was checked against its uses. All nine definition/construction nodes
have at least three tests, covering measure normalization, even/odd degree,
nonmaximal orders, rational versus integral evaluation, actual coefficient
norms, singular and multiple field factors, binomial minimality and degenerate
coefficient boxes. The 231-line Lean file has four actual light definitions over
existing carriers, no admitted data and no development of the imported theory.
Its selected examples need not exhaust the reader's Checks. The final Lean
signature bounds finite pairwise nonisomorphic families because the ST.0 carrier
is a reader target absent at the pins.

## Validation and follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveBoundsPartII.json`:
  zero errors and zero warnings, including the declaration-index checks.
- `lean-check research/blueprint/suggested/EffectiveBoundsPartII.lean`:
  exit 0 in the shared pinned build; only intended `sorry` proof warnings.
- `scripts/check_sorry_data.py`: no admitted data definitions.
- Intake file checks, JSON parsing, complete per-node review coverage,
  source-item coverage, reader/API/test names and whitespace checks pass.

The orchestrator can process this accepted review and retain the two supplier
requests for their owners. No further arithmetic redesign or ownership move is
requested. Packaging must preserve the exact interfaces and the open-stage
status until those interfaces are supplied. Nothing needs resuming in this
review session.
