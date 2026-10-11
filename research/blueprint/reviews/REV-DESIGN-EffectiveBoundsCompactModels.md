# Independent review: EffectiveBoundsCompactModels

Job: `REV-DESIGN-EffectiveBoundsCompactModels`, issue #1720. Reviewer: Codex
(GPT-6), session `codex-xn7VMm`, 2026-10-11. The input designer was a different
session, `codex-hkuDPh`; this reviewer contributed none of the input work.

**Verdict: accepted as a complete planning pass.** All 27 nodes have individual
verdicts in the packet: 21 verified and 6 corrected. There are no added nodes,
unverifiable consumer nodes or unresolved contradictions. The existing precise
SF.5 request remains open, so the packet is `complete`, not `closed`, and all six
layers remain `planned`. Acceptance does not assert implementation or acceptance
of every supplier's complete roadmap.

The final inventory is 4 definitions, 5 constructions, 18 theorems, 28 API items,
27 definition/construction tests, 27 planets and 16 baseline declarations. Every
definition and construction has three discriminating tests. All implementation
statuses remain `unchecked`.

## Source and mathematical checks

I read the entire [published Couveignes paper, *Enumerating number fields*,
Annals of Mathematics 192 (2020), 487–497](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf),
including its references, and compared every packet locator and source match
with that version. Its SHA-256 is
`8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`,
matching the recorded source. The mathematical anchors are Proposition 1,
p. 490; Proposition 2, p. 495; Theorem 1, p. 487; Theorem 2, p. 488; and
§4, equation (1), pp. 495–496. The printed §3 hypothesis is `d≥5`, not `d>5`.
No source passage or source excerpt was added to the repository.

The packet makes explicit refinements beyond the paper's unspecified eventual
constants. I checked those refinements independently, rather than attributing
the constants `40` and `65536`, the inclusive degree threshold, or real `H≥1`
to the printed theorem. No source error was established; `sourceIssues` remains
empty. The index retained in the packet is important bookkeeping, not a claim
that the source contains an erratum.

The checks that carry the arithmetic argument were:

- Scaling each complex coordinate by `√2` has real determinant `2^s`. It
  transports the native product measure to the weighted metric's volume while
  retaining the transported supremum body. Thus GN's theorem for an arbitrary
  convex body in an inner product space supplies exactly the measure and gauge
  needed here. The first `floor(n/2)+1` ordered minimum witnesses have house
  at most the root discriminant for both parities of `n`.
- For the product-span lemma, a nonzero functional annihilating the product
  space makes `(a,b)↦f(ab)` a nondegenerate pairing: for `a≠0`, choose `c`
  with `f(c)≠0` and take `b=c/a`. A totally isotropic subspace therefore has
  dimension at most half the field degree. Separability is unnecessary for
  this lemma. It is used later, correctly, for the number-field embeddings
  matrix.
- The pulled-back jet minor can have complex coefficients. The native grid
  theorem works over a domain, so integrality of those coefficients is
  unnecessary. A variable degree at most `B=dn(r+1)` requires the inclusive
  grid of `B+1` values. Full value rank descends to rational evaluation; it
  does not imply integral evaluation is onto.
- The kernel of integral evaluation is saturated because its target is
  torsion-free. The transpose image can have strict finite index in the
  integral orthogonal complement. With a genuine integral basis, `A=T B`
  gives `det(A A*)=|disc K|det(B Bᵀ)`, while intrinsic lattice volumes give
  `covol(D)=q covol(L)`. For `K=ℚ(i), κ=2i, d=1`, `B=diag(1,2)`, `q=2`
  and the identity is `4=16/4`. Independent short integers cannot be
  substituted for that integral basis.
- Keeping `k=ℓ+1−n` successive-minimum relations leaves codimension `n−1`.
  If every gradient block were deficient, the `n` nonzero covectors supported
  on disjoint blocks would contradict that codimension. A minor chosen in one
  block is the image of one nonzero element of `K`, so the same equations work
  at all embeddings without a Galois assumption.
- Jacobian localization removes repeated roots and positive-dimensional
  components; its algebra may be zero. Counting needs isolated-point Bézout
  even when other components remain in the original zero locus. A bound for
  plane curves or for an everywhere proper complete intersection would not
  supply the requested result.

For the explicit constants, put `L=log n` and `n≥65536`. The trial value
`r₀=ceil(2L/log 2)` satisfies `r₀≥6`, `r₀+1≤2^(r₀/2)` and
`2^(r₀/2)≥n`, hence meets the capacity inequality. Also `r₀≤3L`. The
consecutive ratios of `choose(2r,r)/(r+1)` are strictly below four, so
minimality gives `M<4n(r+1)≤16nL`. Small positive values `r≤4` cannot meet
the capacity at this threshold. The elementary comparisons `16L≤n²` and
`(3L)(3L+1)≤n²` give the advertised logarithmic estimates. The four terms
in the logarithm of the coefficient height are bounded by `24L²`, `1.5L`,
`12L²`, and `6L log δ`. Their sum is at most `40L²+40L log δ`.

For counting, `rM≤48nL²`,
`log F=40L²+(40L/n)log H`, and `F≥1` implies
`log(2floor₊F+1)≤log 3+log F`. Since `r≤n`,
`log(r^r)≤3L²`. The logarithm of the finite union bound is consequently
at most `1920nL⁴+48(log 3)nL²+3L²+1920L³log H`, which is bounded by
`2000nL⁴+1920L³log H` at the stated threshold. Both coefficients fit
inside `65536`. This verifies the exponent of the final `n`-power as
`65536nL³`, and permits `H=1` without division by `log H`.

## Corrections applied

1. Expanded `CM.0/first-half-minima`'s proof sketch with the real coordinate
   transport, determinant and body hypotheses. This makes application of GN's
   inner-product-space theorem precise without introducing a second gauge.
2. In `CM.2/finite-index-gram`, replaced
   `ZLattice.covolume_div_covolume_eq_relIndex` by its general
   inner-product-space variant with a trailing prime. The old coordinate
   statement is valid after a further transport; the new citation applies
   directly to the intrinsic common span. Added
   `NumberField.discr_eq_basisMatrix_det_sq` and the required unimodular
   change from its canonical integral basis. Updated CM.2's roadmap inputs.
3. Added `coefficientBox_floor` as a compatibility API item and an actual
   suggested Lean theorem. The packet already used this floor equivalence
   in `CM.5/coefficient-box-card`; it now has a named interface and signature
   with the required `F≥0` hypothesis. Linked the cardinality proof to it.
4. Corrected the two Theorem 2 locators in `CM.5/finite-surjection` and
   `CM.5/field-count` from printed p. 487 to p. 488.
5. Added the complete independent review object and 27-entry ledger.

No node was split or added: the definitions and key theorems have the target
granularity required by the current WORKERS.md. Routine coefficient casts,
basis transport and logarithmic inequalities stay in proofs or the definition
API. No target, constant, ownership assignment, planet or test was removed.

## Baseline verification

Every original declaration was read at the required revision, with its exact
hypotheses and conventions. The replacement and new declaration were read too.
The [Mathlib revision is 082e2d37e8b0463410cdb532e111cd43d5a66174](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib),
and the [Tau Ceti revision is f790474821cf4256814db967cb154e7af3d0c369](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti).
The shared build's HermiteCount source was byte-compared with the pinned
Tau Ceti file and is identical.

| Final declaration | Verified input and limitation |
| --- | --- |
| `NumberField.mixedEmbedding.mixedSpace` | Real/complex product with native supremum norm; not the Euclidean mixed-space alias. |
| `NumberField.mixedEmbedding.covolume_integerLattice` | Product-volume covolume `2^(−s)√|disc|`; consumer explicitly scales the measure. |
| `NumberField.rootDiscr` | Absolute discriminant to reciprocal-degree real power. |
| `NumberField.one_le_house_of_isIntegral` | Requires both integrality and nonzero element; minimum witnesses provide these. |
| `NumberField.house_mul_le` | Submultiplicative house, as needed for products of short integers. |
| `Module.Dual` | Native linear dual, specialized to the relevant scalar ring. |
| `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` | Domain coefficients and each variable degree strictly below its grid cardinality. |
| `MvPolynomial.restrictTotalDegree` | Native total-degree submodule, including degree zero. |
| `MvPolynomial.aeval` | Native algebra evaluation with the correct coefficient algebra. |
| `LinearMap.dualMap` | Contravariant composition on linear duals, not the similarly named equivalence adapter. |
| `ZLattice.covolume_div_covolume_eq_relIndex'` | Discrete full lattices in a common finite-dimensional real inner product space and an inclusion. |
| `MvPolynomial.pderiv` | Native formal multivariate derivative. |
| `Localization.Away` | Localization at powers; its ring/algebra instances are supplied by the imported ring-localization module. |
| `NumberField.finite_of_discr_bdd` | Inclusive integer cutoff for embedded finite-dimensional fields in a fixed ambient extension. |
| `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` | Existing explicit fixed-ambient Hermite count, not the new compact-model estimate. |
| `NumberField.discr_eq_basisMatrix_det_sq` | Canonical integral-basis determinant squared in ℂ; arbitrary integral bases require the recorded unimodular change. |

Module paths for each declaration are in the packet. No nonexistent or
mathematically incorrect citation remains. One more declaration is present
than in the input; one old citation was replaced.

## Suppliers, ownership and suggested interfaces

I read the exact consumed nodes, not just their layer headings. GN.0 supplies
primitive orthogonal covolumes, intrinsic Gram covolumes and Hermitian Hadamard;
GN.1 supplies simultaneous independent minimum witnesses, the second-theorem
upper bound, the ordered-product inequality and the intrinsic ball-volume
bound. GI.0 supplies native coefficient coordinates; GI.1 supplies the first
jet and its kernel split; GI.5 supplies generic affine full jets and the minor
degree bound. Their packets have accepted reviews. ST.0's accepted packet
supplies the embedded-field quotient and Northcott carrier; no ST.3 counting
theorem or automorphism weight is imported.

The SF.0 Jacobian node states exactly the general native algebra contract used
here, including the empty product and field-factor assertion. Its supplier
packet currently has a `needs_changes` review, and that node is marked
`unverifiable` there because its suggested Lean interface is omitted. This
review independently checked the consumer's mathematical use and actual
signatures; it does not upgrade SF.0's review or assert that its missing
interface exists. Under PROTOCOL §3 an exact existing supplier node is cited
by id. This remains supplier work before implementation/upstream packaging.

SF.5's plane-curve node does not imply the arbitrary-dimensional isolated
intersection estimate. The existing request names the characteristic,
dimensions, positive degrees, local lengths, positive-dimensional allowance,
zero/constant consumer cases and consuming node precisely. It is retained in
CM.5's `remaining` entry and prevents a false closure claim.

I checked the reviewed library audit and the current upstream roadmap/library
checkout at roadmap revision
`070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti revision
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read
Completed/EffectiveBounds and Completed/IntegralLattices for their interfaces
and granularity, and the current IntegralLattices scope, native inputs,
positive-definite minimum targets and suggested declarations. Existing
discriminant, packing and Hermite infrastructure is imported. The new roadmap
does not rebuild integral-lattice carriers, discriminant forms, reduction,
generic successive minima, interpolation or Jacobian geometry. Its new targets
are the arithmetic specialization, explicit model estimates and ensuing
unweighted degree-sensitive count. The Part II parent and six-layer order
are correct. No ownership move is required.

The suggested file has genuine native coefficient vectors, kernels, dual
images, quotient/localization algebras and field-isomorphism quotients. No
mathematical object is replaced by an arbitrary `Prop` or a structure whose
field merely assumes the conclusion. The new floor statement expresses the
claimed equivalence directly. All 27 named test specifications are represented
by suggested examples, and the extra short-integer non-basis example is useful.
All 27 planets are definitions, central constructions or named bounds, with
stage counts `5,3,5,5,3,6`, respecting the limit of six.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveBoundsCompactModels.json`:
  0 errors, 0 warnings after corrections. A second check with `--index` against
  a freshly generated pinned-source declaration index also has zero errors and
  warnings and confirms all final declaration names and module paths.
- `lean-check research/blueprint/suggested/EffectiveBoundsCompactModels.lean`:
  exit 0 at the pinned shared build; 83 warnings, all declarations using
  `sorry`, and no other Lean diagnostics. This checks elaboration of the
  interfaces, not theorem proofs or executed tests.
- The submission path check, independent-ledger completeness and job completion
  predicate pass. Only this review's deliverables and handoff are changed.

The orchestrator should route the existing arbitrary-dimensional SF.5 request
and preserve the SF.0 supplier-interface work in that supplier's revision.
The reader is outside this review issue's allowed deliverables. Its two
Theorem 2 locators still need p. 488, its CM.2 input list should use the general
index theorem and added discriminant citation, and its coefficient-box API
should name the already-described floor equivalence when the roadmap is
packaged. These are recorded synchronization tasks, not a mathematical gap or
unfinished review. No checkpoint is required.
