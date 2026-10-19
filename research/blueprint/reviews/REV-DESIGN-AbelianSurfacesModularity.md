# Independent review: AbelianSurfacesModularity

Job: REV-DESIGN-AbelianSurfacesModularity, issue #3484. Reviewer: Codex, session codex-RPRE2u. Date: 2026-10-19.

## Verdict and counts

**Accepted as a complete target-level planning pass, with explicit gaps.** Every node has a justified independent verdict in the packet's `review.checked`: 30 verified, 16 corrected, zero added and zero unverifiable. All 12 baseline declarations were confirmed at the pins. No source contradiction is left asserted as an unconditional result. This is acceptance of a plan; it does not establish its conditional endpoints or discharge supplier obligations.

| Item | Reviewed count |
| --- | ---: |
| Nodes | 46 |
| Definitions / constructions / theorems / applications | 4 / 3 / 37 / 2 |
| Definition/construction API entries | 52 |
| Definition/construction unit tests | 32 |
| Planets | 23 |
| Confirmed baseline declarations | 12 |
| Supplier requests | 25 |
| Gap groups | 7 |
| Planned / closed stages | 9 / 0 |
| Confirmed source issues | 4 |

The packet remains `complete`, rather than `closed`. All layer targets are realized at the packet's target granularity; their direct dependencies and requests now expose what remains. The seven definition/construction nodes have respectively 4, 4, 4, 5, 5, 5 and 5 tests. Their APIs cover the applicable constructors, invariance, characterizations, computation, base change and compatibility. The 23 planets denote the actual definitions and main results; none needed renaming. No intermediate proof lemmas were split into new nodes.

## Sources and scope of the check

I read the statements, hypotheses and relevant proof passages at every BCGP25 locator in the packet, using [arXiv:2502.20645v1](https://arxiv.org/abs/2502.20645v1), 28 February 2025. The inspected pages are 2–17, 118–120, 149–154 and 174–222; printed and PDF page numbers agree. Its recorded SHA-256 is 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c. This checked the endpoint statements and their cited inputs, rather than independently re-proving §§2–7.

I also read [Zarhin, arXiv:math/9909052v2](https://arxiv.org/abs/math/9909052v2), Theorems 2.1 and 2.4 (pp. 2–3), §3 and Lemma 3.1 (pp. 3–4), and Theorem 4.1 (p. 5). The latter very-simple-module argument, applied to the Galois-stable geometric endomorphism algebra modulo 2, supplies the requested general-surface adapter. The Jacobian-only statement of Theorem 2.1 does not by itself cover an arbitrary surface. The source edition, locators and digest are added to both source inventories and the packet's `sourceVersions`.

Kisin's original Math. Z. 230 (1999), Theorem 5.1, was not independently inspected. The inspected BCGP25 uses justify recording a precise *requested* local-neighbourhood contract; they do not justify attributing the old, overstrong full p-adic constancy claim to Kisin. Source verification of that theorem and the separate integral adapter remain explicit supplier obligations.

I read the statements of the cross-roadmap prerequisites, including their hypotheses, rather than accepting names as evidence of closure. The reviewed library audit and the current Tau Ceti library and TauCetiRoadmap were screened for overlap, including the roadmaps newer than the atlas snapshot. Existing Jacobian, polynomial-Galois, elliptic-curve and modular-form foundations remain imports. In particular the general similitude-group construction already belongs to ArithmeticGaloisRepresentations:G7/similitude-groups. No new generic foundation or duplicate upstream roadmap was added.

## Node corrections

The table records every changed node. Other changes to shared supplier requests are listed separately; thus a node can have verdict `verified` while a request used by its unchanged proof route has been corrected.

| Node | Correction |
| --- | --- |
| `AM.0/isobaric-modularity` | Normalized every constituent in the uniqueness API, added the actual isobaric multiplicity-one and exterior-power suppliers, and replaced a purported nonmodular potentially modular surface by a valid isogeny test. |
| `AM.0/p-distinguished` | Imported the all-characteristic similitude-group carrier and form-change comparison rather than treating the baseline Sp submonoid as GSp. Explained why the repeated-root quadratic has integral coefficients, using Galois stability of the two-element root set and algebraic integrality. |
| `AM.0/modular-of-gsp4` | Made the forward singular-weight spin transfer and the spherical ordinary local-packet/attachment adapters explicit supplier contracts; no ordinary-at-2 attachment is silently reused at 3. |
| `AM.1/outer-classes` | Imported the all-characteristic similitude-group carrier and form-change comparison rather than treating the baseline Sp submonoid as GSp. |
| `AM.2/s6-sp4-identification` | Imported the all-characteristic similitude-group carrier and form-change comparison rather than treating the baseline Sp submonoid as GSp. Restricted the S₅(a) non-example to equality of the full image; clarified the degree-zero divisor construction. Independently reproduced both order-six matrices and the three generators. |
| `AM.3/residual-a5-automorphy` | Separated finite-image complex lifting and its local scalar ramification from the more general Q̄₂-valued lifting supplier; requested the necessary residual and solvable local-control adapters. |
| `AM.3/two-adic-modularity` | Distinguished characteristic-zero integral enormity from residual regular semisimplicity, used both Corollary 7.1.4 hypotheses, corrected the residual automorphy isomorphism and made the assumed residual symplectic realization explicit. Supplied a precise adapter request for the principally polarized hypothesis of the Serre open-image supplier. |
| `AM.4/ordinary-weil-quartic` | Added the Néron R11.5 supplier for purity, integral Frobenius polynomials and the ordinary slope criterion, instead of deriving these from the finite Weil-polynomial classification. |
| `AM.5/product-fibre-remark` | Applied the scalar-sign correction consistently: traces −1,2 give −1, traces 1,−2 give +1; separated the product exclusion from the scalar-+1 five-class argument. |
| `AM.6/ordinary-at-three-points` | Replaced the overstrong full p-adic local-constancy contract by the required finite-level, prime-to-residue and integral-neighbourhood statements, explicitly left as supplier obligations. |
| `AM.7/three-adic-transfer` | Used precisely the Zariski and residual-cyclotomic hypotheses in the integral-enormity argument; corrected the shared lifting request so the ordinary seed may have singular weight. |
| `AM.7/fifteen-image-modularity` | Supplied a precise adapter request for the principally polarized hypothesis of the Serre open-image supplier. Made the forward singular-weight spin transfer and the spherical ordinary local-packet/attachment adapters explicit supplier contracts; no ordinary-at-2 attachment is silently reused at 3. |
| `AM.8/density-of-applicability` | Required joint equidistribution modulo 6, restricted the modularity density bound to boxes with a thin-set estimate, and replaced the unsupported thinness claim for all extra endomorphisms by finite mod-3 monodromy plus Theorem A. |
| `AM.8/mod-two-parameter-space` | Added the smooth rational G_m quadratic-twist parameter, its local-seed proof, three API items and a discriminating twist test. The source’s monic family is retained as c = 1. |
| `AM.8/mod-two-realization` | Replaced the overstrong full p-adic local-constancy contract by the required finite-level, prime-to-residue and integral-neighbourhood statements, explicitly left as supplier obligations. Used Z⁺ to cover the actual local quadratic twists, exposed the generic mod-3 monodromy input, and kept the polarized integral lifting and corrected [2,2,2] seed as explicit conditional obligations. |
| `AM.8/mod-two-modularity` | Made the forward singular-weight spin transfer and the spherical ordinary local-packet/attachment adapters explicit supplier contracts; no ordinary-at-2 attachment is silently reused at 3. |

The product correction distinguishes A₋ = E_{−1} × E₂, whose étale 3-torsion has scalar −1, from its quadratic twist A₊ = E₁ × E_{−2}, whose scalar is +1. Their polynomials are Q₋ = (x² + x + 3)(x² − 2x + 3) and Q₊ = (x² − x + 3)(x² + 2x + 3). The latter has Q₊(1) = 18 and belongs to the scalar-+1 five-class discussion of Remark 9.3.8, pp. 203–204. The final suggested file checks both factorizations, Q₊(1) and both reductions modulo 3. No value of a characteristic-zero Galois representation is inferred from these residual calculations.

The parameter-space enlargement retains the original monic family Z of §10.3.5 (p. 219), and adds Z⁺ = Z × Gm for y² = cχθ(x). Every genus-two canonical map has quotient P¹ in characteristic zero. A rational nonbranch point can be moved to infinity over an infinite field; the resulting branch coordinate is primitive in the fixed degree-six étale algebra, and c records the leading coefficient. This proves the local-seed coverage and unchanged 2-torsion used by approximation. This elementary adapter is identified as a review addition to the existing target, rather than attributed to the source or introduced as another roadmap. Three API entries and one twist test were added; the old unproved potential-modularity non-example was replaced by an isogeny-invariance test.

## Corrected supplier contracts and gaps

Eleven existing or new supplier entries changed. There are four new request entries, bringing the total from 21 to 25; existing entries were extended where the owner already had a contract.

| Supplier | Checked mismatch and resulting contract |
| --- | --- |
| AbelianSurfacesPotentialModularity AP.5 | Proposition 7.5.10 and Theorem 7.5.11 (pp. 177–179) compare seeds residually. The p > 2 seed is ordinary cuspidal and need not have regular weight. The Q(i) image equality is residual. |
| AbelianSurfacesPotentialModularity AP.0 | Full pure local comparison alone does not provide a chosen spherical ordinary member of a global packet or attach the same Galois representation at a different prime. Added the explicit local-packet and ordinary Satake/attachment adapter needed to pass from 2 to 3 and back. |
| GlobalGaloisDeformations R04.5 | Definition 7.1.1 and Corollary 7.1.4 (pp. 153–154) concern a compact characteristic-zero group. The Sp₄ Zariski-closure hypothesis and a residual cyclotomic regular semisimple element are both needed; the induced alternative has its own disjointness and image conditions. |
| FaltingsFinitenessAndIsogenyTheorems R28.4 | Replaced the vague Zarhin attribution by the precise module and endomorphism-algebra locators above; the general-surface argument is an adapter still requested from its owner. |
| NeronModelsAndSemistableAbelianVarieties R11.5 | Added integral good-reduction Frobenius polynomials, weight-one roots and the ordinary slope criterion needed by the Weil-quartic target. |
| NeronModelsAndSemistableAbelianVarieties R11.6 | Request finite-level generic torsion, prime-to-residue Tate/Weil–Deligne data and persistence of the relevant local conditions. Full p-adic representations are not claimed locally constant. Preservation of an integral polarized finite flat W is a separate, stronger request. The ordinary-at-three node now cites this contract directly. |
| AbelianSchemesAndArithmeticModuli A2 | The imported Serre open-image theorem is stated for principally polarized varieties. Added the finite-extension principally polarized isogeny adapter and transport of the connected Tate-module Zariski closure; no stronger version of that supplier is silently assumed. |
| AutomorphicLFunctionsAndLocalFactors AL.4 | Its existing comparison is conditional on established transfers and partial factors. Added transfer existence and all-finite-place comparisons for the small-rank exterior/tensor cases used by the modularity API. AL.3/isobaric-strong-multiplicity-one is imported separately for normalized uniqueness. |
| ArithmeticGaloisRepresentations G7 | A general Q̄₂-valued projective lift does not give a finite complex Artin representation. Added finite-image complex lifting, its residual identification and solvable totally real control of finite local scalar ramification while preserving A₅. |
| AbelianSchemesAndArithmeticModuli A4 | Hilbert irreducibility needs the family-specific full mod-3 monodromy first. Added this input for both the coefficient family and Z⁺ with fixed 2-torsion; the nonsurjective locus can then be treated by finitely many proper-subgroup covers. |
| EndoscopicTransferAndUnitaryTraceComparison ET.4 | The existing target is phrased as descent from GL₄. Added the forward singular-weight spin transfer, exclusion of nongeneral type under absolute irreducibility, and normalized local matching. |

The density node now requires joint equidistribution modulo 6 to multiply the two local proportions. Thin-set removal and the modularity lower bound are asserted in coefficient boxes. It no longer asserts that the entire geometric-extra-endomorphism locus is one thin set, or that arbitrary counting with uniform local marginals makes thin sets negligible.

One gap group was added for all-local transfers, ordinary packet choices and monodromy. The existing unplanned-supplier gap now includes finite complex lifting/local control, the nonprincipal open-image adapter and integral W-preservation, and explicitly records the uninspected Kisin original. Coverage `remaining` lists were synchronized. Existing gaps for Theorem 7.5.11 and its analytic/patching inputs, Arthur's classification, finite certificates, the [2,2,2] local seed and dyadic polarization remain open. No gap was hidden by changing a stage to `closed`.

## Baseline citations

All declarations were independently read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. **Removed: zero. Replaced: zero. Confirmed: twelve.** Their existing module paths are retained; the `checked` fields record this independent check.

| Declaration | What was confirmed |
| --- | --- |
| `mathlib:Matrix.symplecticGroup` | The submonoid equation AJAᵀ = J. This is Sp, not GSp; G7 supplies similitudes, change of form and invertibility conventions. |
| `mathlib:Matrix.J` | The block form on l ⊕ l, with blocks 0, −1, 1, 0. The paper’s antidiagonal form requires the imported comparison. |
| `mathlib:Matrix.charpoly` | The determinant definition of the characteristic polynomial of a square matrix. |
| `mathlib:Matrix.IsSymm` | Equality with the transpose, as needed in the odd-involution matrix criterion. |
| `mathlib:Equiv.Perm` | Permutations as self-equivalences; the finite permutation groups are available. |
| `mathlib:alternatingGroup` | The kernel of permutation sign, giving the intended A₅ and A₆ subgroups. |
| `mathlib:MulAction.stabilizer` | A subgroup fixing a chosen point; the S₅(b) interpretation uses exactly this notion. |
| `mathlib:groupCohomology.H1` | Degree-one group cohomology of a representation, not a built-in adequate-subgroup theorem. |
| `mathlib:Representation` | A monoid homomorphism to module endomorphisms; finite-dimensional characteristic-2 representation theory is still planned. |
| `mathlib:Polynomial.aroots` | The roots after mapping to the specified algebra, suitable for the complex Weil-root condition. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | A proper geometrically integral group scheme over Spec K; Jacobian and level-moduli APIs are not thereby supplied. |
| `tauceti:TauCeti.schurMultiplier` | H² of the multiplicative-unit representation; its definition does not already prove the A₅ lift theorem. |

## Source issues

All four entries now have `review.verdict = confirmed` and name this job.

| Entry | Independent conclusion |
| --- | --- |
| E1, Lemma 9.1.6(3), p. 190 | The unramified quadratic twist realizes the second scalar lift of the projective class while preserving the required curve conditions. This is an implicit proof step, not a counterexample. |
| E2, proof of Lemma 9.3.7, p. 203 | Direct action on U⁰/L in the paper’s basis reproduces the three generators of Lemma 8.1.3 and identifies the two printed matrices with the inverse permutations. Their conjugacy classes and the downstream argument are unchanged. |
| E3, Lemma 6.4.1, p. 149 | Multiplier −1 projects outside PSp₄(F₃); the printed group name must be PGSp₄(F₃). |
| E4, Lemma 9.3.7 and Remark 9.3.8, pp. 203–204 | The scalar-sign correction is already known as extraction E043 and is already used by AP.7/local-three-seeds. It was missing from this packet’s product discussion; no new discovery is claimed. |

The larger finite-group enumerations, resolvents, finite-field curve tables and LMFDB row predicates were checked against their source statements, but not independently reproduced. They remain certificate obligations. The small quotient-matrix computation and polynomial identities do not discharge those obligations.

## Files and validation

The roadmap definition now imports the additional direct supplier stages and describes compatible systems/ordinary attachments at their stated scope. The reader is synchronized with all 16 corrected node sections, nine layer descriptions and dependency lists, source inventories, imported-node index, 25 supplier contracts, coverage and seven gaps. The suggested Lean file adds three proved examples covering four identities: the scalar-+1 product factorization, its evaluation at 1, and the two mod-3 reductions in one conjunction. It introduces no new data carriers or sorry'd data.

- `python3 scripts/check_blueprint.py research/blueprint/packets/AbelianSurfacesModularity.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AbelianSurfacesModularity.lean`: **exit 0**, with only the four existing `sorry` warnings at lines 147, 177, 182 and 187.
- Direct quotient-action computation: the three Lemma 8.1.3 matrices and the two corrected order-six matrices agree with the paper’s basis convention.
- Every direct cross-packet node reference resolves; the reader’s corrected statements, hypotheses, proof steps, API and tests match the packet. Every stage still realizes its stated targets.
- `git diff --check`: clean.

## Routing questions for the orchestrator

These are programme follow-ups, not unfinished review work:

1. Assign the precise Theorem 7.5.11, integral-enormity, near-adequacy and dyadic Hida contracts to their intended Part II/new-roadmap owners, then replace the temporary AP.5/AP.0 routing when those stages exist.
2. Route the finite complex Tate lift/local scalar control, the nonprincipal Serre adapter and the explicit Zarhin module argument to their existing owners; do not create duplicate endpoint nodes here.
3. Obtain and verify Kisin’s original theorem and the separate integral W-neighbourhood result. Resolve the existing dyadic polarization and corrected [2,2,2] local-seed bridges before claiming Theorem 10.3.9 unconditionally.
4. Coordinate ET.4 forward spin transfer, AL.4 all-local comparisons and AP.0 ordinary local-packet choices, and assign A4’s two monodromy contracts before IG.2 is used to remove thin sets.
5. Schedule the finite certificates and frozen LMFDB row predicates. The 2024 counts are historical inputs, not a current database query.

The existing restructuring proposals are retained as proposals; no issue was closed, no upstream file was edited and no roadmap was promoted by this review.
