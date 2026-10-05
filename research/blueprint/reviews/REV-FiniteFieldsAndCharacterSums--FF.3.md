# Independent review of FF.3

**Verdict: accepted.** This is a complete target-level planning pass under PROTOCOL §0; FF.3 is **planned**, not closed. The new polynomial census is sound, and the accepted parent's algorithm targets remain imports. Open implementation, cost and geometric comparison contracts remain explicit.

Reviewer: Codex — `codex-JWkQAv`, job `REV-FiniteFieldsAndCharacterSums--FF.3`, issue [#6308](https://github.com/CBirkbeck/tauceti-explorer/issues/6308), 2026-10-05. The author was Codex — `codex-jYursF`, [PR #6365](https://github.com/CBirkbeck/tauceti-explorer/pull/6365). This reviewer session did none of that work. Reviewed the full [packet](../packets/FiniteFieldsAndCharacterSums--FF.3.json), [suggested file](../suggested/FiniteFieldsAndCharacterSums--FF.3.lean), [reader](../readmes/FiniteFieldsAndCharacterSums--FF.3.md), author handoff, accepted parent packet, FF.3 library audit, supplier descriptions, accepted RS-03 ownership decisions and all six routed verifier findings. Also read the upstream AlgebraicCodingTheory and LocalFieldsRamification documents.

## Counts and corrections

| Item | Reviewed result |
| --- | --- |
| New nodes | 8: 3 constructions, 5 theorems; all 8 verified |
| API items / construction tests | 14 / 11, with 4, 3 and 4 tests for the three constructions |
| Baseline citations | 12 confirmed; 0 removed, replaced or added |
| Parent imports | 23; every imported statement agrees exactly with its accepted parent node |
| Added / removed mathematical nodes | 0 / 0 |
| Supplier requests / explicit gaps | 4 / 2 after carrying forward the inherited Schoof gap |
| Planets | 0 new; the six parent FF.3 planets retained by ID |
| Fresh source issues | 0; the existing BKK boundary issue independently confirmed |
| Coverage | 1 stage planned, 0 closed; packet complete |

The packet corrections are confined to dependency and coverage metadata:

1. Expanded `restructure[0]` to require a registered elementary factorization/Hensel component distinct from point counting. CN.1 consumes that elementary component. Substituting WC.5 for FF.2 on an unsplit FF.3 would still force cohomology into CN.1. The proposal also explicitly separates FF.4's elementary constructions from bound-dependent applications and permits an individual algorithm import where needed. It preserves the original proposal to move the elementary monic carrier to FF.0, with consistent incoming-reference updates and no duplicate declaration.
2. Expanded the FA.7 ownership instruction to preserve place enumeration, Riemann–Roch computations, ray characters, conductors/local completions and other certificate exports. Qualified reconstruction from the first g extension counts by the smooth projective geometrically connected genus-g curve hypotheses, Newton identities and normalized functional equation. This is a curve zeta-numerator contract, not a replacement for arbitrary Artin/ramified L-polynomial computations.
3. Removed `FF.3/point-count-certificate` and `FF.3/weil-error-bound-for-hyperelliptic-counts` from the WC.5 request's `neededBy`. The former is the parent's elliptic root-table checker; the latter has its direct FF.2 character-bound supplier. The request now explicitly concerns the general point-bound component. Its all-extension curve/variety statement is unchanged.
4. Copied the accepted parent's **Schoof prime-growth estimate and instantiated operational cost model** gap into this supplement, with provenance, and added it to coverage `remaining`. The supplement imports `schoof-algorithm-cost`; assembly must retain the quantitative prime-product/Chebyshev obligation, excluding the field characteristic, alongside the CN.0 model obligation. A supplier request for operation counting alone does not supply that number-theoretic estimate.
5. Added the accepted independent `review` object and individual reasons for all eight node verdicts.

No node statement, source excerpt, proof sketch, mathematical prerequisite, API, test, baseline declaration or suggested Lean signature was changed. No foreign packet, atlas data, queue, source registry or reader file was edited.

## Sources and each node

Personally retrieved and read the exact public editions on 2026-10-05:

- Jonas Bergström, Carel Faber and Sam Payne, [arXiv:2206.07759v2](https://arxiv.org/pdf/2206.07759v2), §5 opening and counting argument, printed pp. 7–8. PDF SHA-256: `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758`.
- Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma, [arXiv:2007.14567v3](https://arxiv.org/pdf/2007.14567v3), Lemma 3.2 proof, printed pp. 19–20, and Proposition 8.1/use, pp. 39–40. PDF SHA-256: `adb1359df46f92d608009b32f45939672e08b1e3fe052587b035431e70d5d3e1`.

Both hashes match the packet. Every excerpt occurs at its locator. The monic refinements, finite equivalence and coefficient recurrence are explicit consequences rather than purported verbatim theorem statements. BFP's curve interpretation uses odd characteristic; the polynomial arguments themselves do not. Neither journal version was collated.

All node IDs below have prefix `FiniteFieldsAndCharacterSums:FF.3/`.

| Node | Verdict and closure check |
| --- | --- |
| `monic-squarefree-polynomial-set` | Verified. Filters the imported monic census with Mathlib's factor-multiplicity predicate. Finite fields are perfect, so the separability API applies. Degree zero contains 1; zero is excluded. |
| `unique-monic-squarefree-square-decomposition` | Verified. Generic UFD existence plus monic normalization supplies existence. Parity of each normalized factor's multiplicity fixes both factors; reconstruction and monic degree laws finish uniqueness and the degree equation. No coprimality premise is introduced: X³ has pair (X,X). |
| `squarefree-square-degree-equivalence` | Verified. The finite index enforces 2j≤n. Uniqueness recovers the inverse, and the degree equation places it in the correct fiber. The forward and inverse API identifies actual factors, not opaque propositional data. |
| `monic-squarefree-convolution` | Verified. Counts the finite disjoint union using the imported cardinality of all monic polynomials. Includes degrees zero and one. |
| `monic-squarefree-count-formula` | Verified. Shifting the n−2 convolution isolates the leading term for n≥2. The two small degrees are separate; the natural-number subtraction is legitimate. |
| `hyperelliptic-presentation-polynomial-set` | Verified. Contains both adjacent degrees and every nonzero leading coefficient. The latter and normalization recover its unique scalar/monic presentation. Scalar and field-isomorphism APIs use existing polynomial laws. |
| `hyperelliptic-presentation-count` | Verified. Unique scalar presentation contributes q−1; cancellation gives the positive-genus formula, with the genus-zero exception retained. No characteristic-two curve parametrization or orbit/stack quotient is claimed. |
| `monic-prescribed-constant-count-boundary` | Verified. Degree zero is the coefficient fiber of 1; positive degree fixes one lower coefficient. This counts all monic polynomials, independently of the irreducible fixed-constant supplier. |

The target-level granularity is appropriate: the census, normalized decomposition, finite equivalence and their key counting results are separate reusable targets. Factor-parity algebra, finite cardinality manipulations and coefficient-fiber restriction need no additional lemma nodes at this granularity.

BKK Proposition 8.1 excludes degree zero. The route for `/73` specializes the parent's prime-polynomial and upper-bound nodes to F_p, giving the weighted reciprocal bound after dividing by p^k. The `/130` route uses the distinct prescribed-nonzero-constant parent theorem, including its absolute relative-error constant 3, rather than substituting the unconditioned prime-polynomial estimate. Degree-one and zero-constant cases remain separate. These are imports of reviewed proof routes, not claims to have freshly read every original source behind the parent.

The BKK p.20 auxiliary monic-factor count fails at degree zero: the fiber is the indicator of constant coefficient 1, not the positive-degree expression. This independently confirms the already reviewed parent `FiniteFieldsAndCharacterSums/E734` and paper-extraction E6. The new boundary theorem applies that correction. `sourceIssues: []` is appropriate for this supplement; it does not erase or duplicate the parent record. No new source error was found, and no claim is made about the uncollated published version.

## Pinned baseline and audit

Read all 12 declaration statements and their ambient contexts at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The source files are [Squarefree/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Squarefree/Basic.lean), [NormalizedFactors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/UniqueFactorizationDomain/NormalizedFactors.lean), [Polynomial/FieldDivision](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/FieldDivision.lean), [Polynomial/Monic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Monic.lean), [Perfect](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean) and [RingTheory/Polynomial/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Basic.lean).

| Declaration | Confirmed statement and required context |
| --- | --- |
| `Squarefree` | Monoid predicate: a square divisor has a unit base. |
| `exists_sq_mul_squarefree` | CommMonoidWithZero with unique factorization: e²d=x with squarefree d. Supplies generic existence, not monic normalization or uniqueness. |
| `UniqueFactorizationMonoid.normalizedFactors_mul` | Normalization/UFD context; nonzero x and y; factors of xy are the multiset sum. |
| `UniqueFactorizationMonoid.normalizedFactors_pow` | Same ambient context; factors of x^n are n times the multiset. No extra nonzero hypothesis. |
| `UniqueFactorizationMonoid.squarefree_iff_nodup_normalizedFactors` | UFD plus normalization; x≠0; squarefreeness iff no repeated normalized factors. |
| `UniqueFactorizationMonoid.prod_normalizedFactors_eq` | Strong normalization/UFD; x≠0; factor product equals normalize x. |
| `Polynomial.monic_normalize` | Field with decidable equality; nonzero input has monic normalization. |
| `Polynomial.eq_of_monic_of_associated` | Semiring; two associated monic polynomials are equal. |
| `Polynomial.Monic.natDegree_mul` | Semiring; both factors monic; natural degrees add. |
| `Polynomial.Monic.natDegree_pow` | Semiring; monic input; the power multiplies natural degree by its exponent. |
| `PerfectField.separable_iff_squarefree` | Perfect field; polynomial separability iff squarefreeness. The same file supplies finite-field perfectness. |
| `Polynomial.degreeLTEquiv` | Semiring; degree-less-than-n module linearly equivalent to Fin n coefficient vectors, including n=0. |

Monic inputs and factors are nonzero, so the nonzero premises used in reconstruction and multiplication are available. Finite-field polynomials have the UFD and strong normalization instances required here. No generic library result is incorrectly advertised as the new finite polynomial census.

Read the reviewed FF.3 audit in `data/library-coverage.json`. Searched pinned Mathlib squarefree/UFD/polynomial APIs and the Tau Ceti tree at `f790474821cf4256814db967cb154e7af3d0c369`. Tau Ceti's squarefree-part results for integers/rationals and its polynomial factor/CRT APIs do not give the normalized monic pair uniqueness or these finite-degree counts. The supplement therefore does not re-plan a baseline census. The monic carrier is the accepted parent's imported node; its concrete copy in the suggested file is clearly identified as a temporary adapter, not a new node. The BFP paper route explicitly gives FF.3 ownership and instructs ArithmeticStatistics ST.4 to import the count.

## Suppliers, coverage and confirmed findings

All original FF.3 target families remain supplied by the parent: polynomial enumeration and irreducibility, squarefree/DDF/equal-degree/full factorization, correctness and cost, checked factorization, Hensel lifting, elliptic counts/certificates, affine error bounds, and Schoof. The 23 imports preserve their exact statements. The new census closes the routed BFP planning frontier. General point bounds end in the precise WC.5 request and a recorded model-comparison gap; no general-variety certificate algorithm is inferred from an elliptic checker.

Read CN.0, CN.5 and WC.5 supplier descriptions. The two CN.0 requests specify program/randomness/expected-cost primitives, coefficient representations, operation-to-bit bounds and executable refinements; those services remain requests rather than assumed exports. CN.5 supplies reusable finite-verification recording and cost discipline; FF.3 retains checker semantics. WC.5 supplies actual all-extension point/cohomology comparison with geometric Frobenius conventions, the 2g curve constant, the positive-dimensional Betti bound and separate dimension-zero treatment. The WC.5 link's quotes are literal substrings of the extracted supplier/consumer descriptions. These precision and ownership boundaries justify planned coverage with the two gaps and four requests still open.

| Confirmed finding | Disposition and remaining integration |
| --- | --- |
| `RT-AREA-finitefields/1` | Corrected proposal requires elementary/point-count components and FF.4 elementary/bound separation before depth regeneration; CN.1 imports only the elementary owner. Register component stages and forwarding edges in the authorized structure job. |
| `/2` | Retains the full nonelliptic all-extension WC.5 contract and concrete-model comparison gap, with hypotheses and dimension boundary. Elliptic Hasse and affine character bounds keep their suppliers. Bind the inferred WC.5 edge to the registered general-bound component. |
| `/10` | Uses reviewed parent nodes and exposes current CN/WC supplier questions. Accepted planning does not certify historical EXT-08 queue/decision/promotion metadata as repaired. Apply those changes through their supported integration route, retaining genuine unread-source/closure gaps. |
| `/11` | Single FF.3 owner for factorization theory, randomness and cost; CN.1 keeps its checked-output/refinement adapter. Transfer the stale CN node/evidence through the authorized pipeline, preserving deliberately deferred links. |
| `/12` | Corrected FA.7 instruction preserves its other function-field targets and qualifies curve zeta reconstruction. Apply the factorization/certificate handoff through the FA.7 and RS-04 review/fix route. |
| `/17` | Version-specific new BFP/BKK evidence checked. Parent Shoup factorization, Schoof/Sutherland counting and distinct Hensel routes are inherited, without claiming a bibliography is a checked proof. Foreign FF.4/source-registry integrations retain their own source-gap obligations. |

## API, prototype and validation

The three construction APIs expose membership, small-degree simplification, compatibility, factors/inverse characterization, normalization, scalar action and coefficientwise transport. Existing finite-set/subtype equality, Equiv inverse laws and Polynomial scalar/map laws provide the appropriate extensionality and structure; a new action or functor wrapper is unnecessary. The suggested file includes the corresponding laws and every packet API/test name. The 11 named tests detect missing units, repeated roots in characteristic two, a false coprimality restriction, omitted nonmonic polynomials, squares at allowed degree, and zero. Additional numerical examples exercise the theorem boundaries.

Independently enumerated monic polynomials using **square divisibility**, rather than the author's derivative/gcd method: test whether any positive-degree monic square divides each input. Used F₂, F₃ and F₄=F₂[a]/(a²+a+1) in degrees 0–6, and F₅ in degrees 0–5. For all **10,587** inputs, enumerated every valid (h,m) and checked that h·m² has exactly one preimage and exhausts the target set; checked all constant-coefficient fibers and squarefree cardinalities. Also directly enumerated nonmonic P₀ and P₁ over each field. All checks passed.

| Field | Squarefree counts starting at degree zero | P₀ / P₁ |
| --- | --- | --- |
| F₂ | 1, 2, 2, 4, 8, 16, 32 | 4 / 12 |
| F₃ | 1, 3, 6, 18, 54, 162, 486 | 18 / 144 |
| F₄ | 1, 4, 12, 48, 192, 768, 3072 | 48 / 720 |
| F₅ | 1, 5, 20, 100, 500, 2500 | 100 / 2400 |

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFieldsAndCharacterSums--FF.3.json`: **0 errors, 0 warnings** after corrections.
- `lean-check research/blueprint/suggested/FiniteFieldsAndCharacterSums--FF.3.lean`: **exit 0**, exactly 44 declaration-uses-`sorry` warnings, no errors or other warnings. Available memory was 95 GB. Mathlib matches the pin exactly. The shared Tau Ceti checkout is newer, but this file imports only pinned Mathlib; Tau source inspection used its recorded commit. The unchanged suggested file needs no second elaboration.
- All eight declarations, 14 APIs and 11 named construction examples match across packet/prototype/reader. Existing six planet IDs and names match the parent; no planet is added beyond the layer's limit.
- `git diff --check`: clean. Only this job's packet, review report and handoff change.

The Lean file remains an admitted planning prototype. Elaboration and the external finite arithmetic checks do not prove its admitted declarations.

## Questions and instructions for the orchestrator

1. Register the elementary/point-count component stages before forwarding dependencies or recomputing depth. Which integration job will apply the stable-ID and monic-carrier moves, CN.1 transfer, and FF.4 split? The corrected packet supplies the assignments; this review has not changed the active graph.
2. Preserve both gaps and all four supplier requests when assembling parent and supplement. Identify the exact owner/source of the quantitative Schoof prime-product estimate and the concrete general-model rational-point comparison before claiming closure.
3. Reconcile FA.7/RS-04 without deleting FA.7's other targets, and keep curve zeta reconstruction distinct from its Artin/ramified computations.
4. Synchronize the reader through an authorized assembly/fix job. This review issue does **not** list the reader as a writable deliverable. Its eight mathematical nodes/APIs/tests agree with the packet. In “Certified services and their owners”, add the inherited Schoof cost gap and the full FA.7 preservation/hypothesis qualification above; in “Sources and atlas structure”, replace the stage-edge-only description with the registered component split and FF.4 split. Retain the general-model comparison gap. These are exact additions to integration/coverage prose, not changes to the eight mathematical statements.

No user answer is needed to complete this review. No mathematical contradiction remains; all unresolved contracts are recorded explicitly and belong to the named supplier or integration work.
