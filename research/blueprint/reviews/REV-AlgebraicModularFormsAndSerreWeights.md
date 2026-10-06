# Independent review: Algebraic modular forms, reduction and Serre weights

**Verdict: accepted after corrections.** Codex, session `codex-Amxd2a`, reviewed issue #345 on 6 October 2026, independently of the blueprint author (`codex-f7ZoAh`). This accepts a complete target-level planning pass. All six stages are planned; none is closed or implemented. The packet retains precise source, library and supplier obligations.

## Scope and counts

| Item | Before | Reviewed |
| --- | ---: | ---: |
| Nodes | 63 | 66 |
| Definitions / constructions | 20 | 21 |
| API items | 67 | 72 |
| Unit tests | 61 | 64 |
| Planets | 21 | 22 |
| Baseline declarations | 8 | 8 |
| Gaps | 9 | 13 |
| Requests | 26 | 29 |
| Source issues | 3 | 4 |

The per-node review records 40 verified, 23 corrected and three added nodes, with no unverifiable node or unresolved mathematical contradiction in the revised packet. All 24 node identifiers in the integrated decomposition are retained. The roadmap's library audit was read: the full geometric/Serre interfaces remain planned, while existing analytic modular forms, general tensor/module operations and the cited algebraic results are reused. The ModularForms and EllipticCurves upstream documents were read, including the relevant integral Hecke, all-weight section-space, finite-field and local-field interfaces.

Every original and added source locator/excerpt was checked against the public source bytes: 13 files, with all recorded SHA-256 values matched, and 121 consuming excerpts. Edixhoven's cited document is the dated author DVI, not an assertion that its pagination is the published pagination. The suggested file contains every one of the 72 API names and 64 test names. Every definition/construction has at least three tests. Planets select central objects and theorems, with at most six in each stage.

## Corrections

- Added the source-required supersingular section space `R15.3/supersingular-section-space`, including integer weights, fibre evaluation, extensionality, restriction, tensor multiplication and three discriminating tests. Added `R15.3/supersingular-hecke-twisted-periodicity`, Edixhoven Proposition 7.2, using the simple-Hasse-zero/Kodaira–Spencer proof valid also at 2 and 3. Its first shift twists eigenvalues by ℓ; its `(p−1)`st power gives the untwisted period `p²−1`.
- Expanded the existing twisted-duality node to state the field boundary sequence and its cusp-twisted dual target, with the factor `ℓ^{k−1}`. Linked weight reduction directly to these inputs. The simple supersingular divisor and finite eigensystem-support algebra remain explicit obligations, rather than an assumption of semisimplicity.
- Added `R15.2/boundary-eigensystems-are-eisenstein` and corrected the boundary regression and cuspidal-sequence acceptance condition. CG18 Remark 3.4's formula `1+ε(x)x^{n−1}` applies to the diamond orbit of ∞. Over 0 the formula is `ε(x)+x^{n−1}`; mixed cusp types allow two nontrivial characters. The general Eisenstein conclusion survives. At `N=7,n=3,p=5,x=3`, with ε quadratic, the two eigenvalues are 2 and 3 modulo 5. This is the already-reviewed [CG18 extraction's E23](../papers/PAPER-CALEGARI-GERAGHTY-18.result.json), independently rechecked here, and now packet E4. The exact R01.5 recognition node supplies the localization comparison; no second Galois attachment is planned.
- Added the direct dependencies actually used by rigid-level descent, base change, integral Hecke operators, strong q-expansion, Deligne congruence and modular eigensystem lifting. Read Katz 4.4.1, which supplies the admitted characteristic-p constant-expansion input to 1.12. Characteristic-zero constant-expansion vanishing and the arbitrary-coefficient reduction argument remain explicit gaps.
- Recorded the non-routine formal-functions/completion/depth, coherent finiteness/base-change and small-level degree interfaces. Requested the existing analytic Eisenstein normalization from ModularForms Layer 0; retained the exact Bernoulli valuation/integrality obligation. The classical lattice now also cites Deligne–Serre 2.6–2.7, separately from Katz's holomorphic base-change theorem and the cusp/character obstruction.
- Removed the global existence/minimality proof from the local Edixhoven-weight comparison. That node now proves only the two local discrepancies. Its exact R20.3 consumer owns the optimisation theorem; a reverse prerequisite would create a cycle.
- Corrected Katz Hodge-line locators to pp.82–83, the low-level failure remark to p.87, and the lattice base-change citation to Theorem 1.7.1 on p.85. Corrected Edixhoven's cycle argument to DVI p.8, Proposition 8.5 and equation 8.4.3 to p.28; extended the Serre determinant excerpt locator to pp.181–182; corrected four CG18 setup ranges to pp.313–316. The p=3, level-two Hasse lifting is included using Katz1.8.1, rather than applying the fine-level theorem outside its range. The node-level review identifies each affected node.
- Independently confirmed all three original source issues: Serre's omitted dyadic `m=3`, CG18's general-weight Fricke scalar `x^n`, and the degree-preserving `H⁰` target/auxiliary-level notation. Replaced explanatory paraphrases with short literal printed fragments. The Serre/Raynaud theorem-number correction is already recorded by its finite-flat owner and is not duplicated.

The retained gaps are material: level-prime denominator comparison, Gross's torsion weight-one construction, Jochnowitz and the exceptional level-one reduction input, dyadic niveau-two descent, Ribet's image input, the exact character/cusp reduction criterion, and the extension-sensitive Fontaine–Laffaille classification. Acceptance verifies their honest placement and the planned mathematics; it does not certify these inputs as proved.

## Pinned baseline

No citation was removed or replaced. Each declaration's exact statement was independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration | Confirmed use / boundary |
| --- | --- |
| `Algebra.adjoin_le` | Generated operator algebra is contained in an algebra preserving the line. |
| `Algebra.HasGoingDown.of_flat` | The finite free commutative operator algebra is flat. |
| `Ideal.exists_ideal_le_liesOver_of_le` | Produces a prime over zero below the residual-character kernel. |
| `TauCeti.integralClosure.isDedekindDomain` | Finite fraction-field extension suffices; no separability or module-finiteness of the integral closure is asserted. |
| `IsArtinianRing.isNilpotent_jacobson_bot` | The local Artinian maximal ideal is nilpotent. |
| `IsArtinianRing.localization_artinian` | Supplies Artinian localization. |
| `Module.mem_support_iff_of_finite` | A faithful finite module has full support. |
| `TensorProduct.AlgebraTensorModule.map_tmul` | Checks the base-changed action on pure tensors; it does not itself prove injectivity. |

The algebraic API-integration gap remains necessary for the additional localization, finite-fibre, flat-inclusion and endomorphism-base-change interfaces not identified by these eight citations.

## Routed finding and ownership

`RT-AREA-padic-1/26` is resolved on the reviewed R15 side. Both packet and reader import the general BT₁ Hasse section `det(V*)` from `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; R15.3 specializes it to the elliptic Hodge line and its dual-Frobenius/Tate normalization. It does not re-plan the general invariant in T0 or another roadmap. The added simple-zero divisor request is elliptic modular-curve geometry, owned by R13.5. This verdict does not review or edit the other roadmaps named by the routed finding.

## Validation and orchestrator follow-up

`python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModularFormsAndSerreWeights.json` reports **zero errors and zero warnings**. `git diff --check` passes. Source hashes, all excerpts, inherited identifiers, local dependency acyclicity, API/test-name coverage and the per-stage planet cap were checked independently.

The original `lean-check` attempt failed because the unused Tau Ceti integral-closure module was unavailable in the shared build. The final file uses only pinned Mathlib imports, and the unused Tau Ceti import was removed. The final `lean-check` exits zero, with only admitted-proof warnings. Fixes include tuple annotations, a reserved identifier, missing complex/ZMod field imports, noncomputable power-series coefficient definitions and a duplicate additive instance. The new finite-fibre signatures also elaborate. Tau Ceti's prerequisite theorem was verified in source at its pin; no claim is made that a different shared Tau Ceti checkout validates that theorem. The many geometric/Galois identifications omitted beside templates still need their supplier types, and all implementation statuses remain unchecked.

The issue permits edits to the packet and suggested file, but leaves the reader document read-only. The orchestrator should regenerate/synchronize [the reader](../readmes/AlgebraicModularFormsAndSerreWeights.md) from the reviewed packet: update its counts, add the three nodes and four gaps, narrow the all-cusp boundary scalar statement, remove the duplicated optimisation proof, apply the corrected locators and source-issue verdicts, and replace its obsolete compilation paragraph. In particular, its current boundary wording must not be taken as the reviewed unrestricted formula. Its Hasse ownership already agrees with the routed finding.

Next planning work should supply the recorded owner interfaces, rather than silently upgrading any stage to closed. There is no remaining review work within this issue's editable deliverables.
