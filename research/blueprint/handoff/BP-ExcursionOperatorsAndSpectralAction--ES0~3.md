# Revision 3 checkpoint: Excursion operators and spectral action, ES0–ES4

Job `BP-ExcursionOperatorsAndSpectralAction--ES0~3`, issue #7962. Codex, session `codex-Oy0ZQy`, 10 October 2026. **Blocked checkpoint; the revision is not complete.** The independent revision 2 `needs_changes` review is preserved unchanged. Do not send this checkpoint onward as accepted.

The sole claim was confirmed in [bot comment 6093330599](https://github.com/CBirkbeck/tauceti-explorer/issues/7962#issuecomment-6093330599), following [claim comment 6093329563](https://github.com/CBirkbeck/tauceti-explorer/issues/7962#issuecomment-6093329563). No manager-priority issue was available. The available focus packages inspected had documented supplier/review blockers outside their deliverables; this focus planning revision was taken under the worker ordering. No other issue was claimed.

Branch `codex-Oy0ZQy-excursion-es0-revision`, based on `b6ce57e677e6304cd146c629bc47d984ccc15f92`. Only the four issue deliverables changed. Continue from the existing [packet](../packets/ExcursionOperatorsAndSpectralAction--ES0.json), [reader](../readmes/ExcursionOperatorsAndSpectralAction--ES0.md) and [suggested file](../suggested/ExcursionOperatorsAndSpectralAction--ES0.lean).

## Concrete progress

The formerly omitted `support_coefficient_change` now has a genuine degree-zero signature using native Mathlib types. It assumes a commutative algebra R→S, flatness of S over R, the central-action End module structures and their scalar compatibility, and an S-linear equivalence S tensor_R End(A) ≃ End(A_S) carrying the tensor identity to the identity. It concludes both Ann_S(A_S)=Ann_R(A)S and inverse-image equality of supports. It assumes no annihilator or support equality.

The proof plan evaluates at id_A, applies the existing flat tensor exactness to the kernel inclusion followed by R→End(A), identifies S tensor_R R with S, and uses the identity-preserving End comparison to identify the new evaluation map. Ideal.map and the existing zero-locus formulas finish the comparison. These routine steps stay in the target's proof sketch; no new general tensor or flatness nodes were added.

`centralAnnihilator_map_le` now states the unconditional ideal containment for an additive functor compatible with the central actions. Together with the existing `centralSupport_map`, it covers the containment part without flatness or an End equivalence. The actual geometric End comparison remains an explicit supplier input.

Two additional acceptance examples distinguish the equality hypotheses:

- For R=S=Z, the scalar module Z has annihilator zero and the zero module has annihilator the unit ideal. The compatible additive zero functor does not supply the missing End comparison, despite the flat coefficient map.
- For Z→Z/2, take the scalar object Q and its zero scalar extension. End(Q) tensor_Z Z/2 is zero and hence agrees with End(0), preserving the identity. Nevertheless the annihilator grows from zero to the unit ideal. Z/2 is not flat over Z. The example therefore excludes dropping flatness even when the End comparison exists.

These are actual ModuleCat signatures, not declarations of enhanced Perf tests. Every proof remains `sorry`, as the suggested-file protocol requires. No formalization is claimed.

Seven source-checked Mathlib declarations were added to the baseline: Module.Flat, Module.Flat.lTensor_exact, LinearMap.toSpanSingleton, Ideal.map, PrimeSpectrum.preimage_comap_zeroLocus, PrimeSpectrum.zeroLocus_span and ZMod. There are now 34 baseline declarations.

## Existing upstream work is imported

At current TauCetiRoadmap commit `dea8191cc6047d6142a65872ebce6eeeb841a29b`, [SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/dea8191cc6047d6142a65872ebce6eeeb841a29b/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md) already supplies SR.0.4 `smooth-centre` and SR.1.3 `bernstein-centre-corners` / `l-adic-separatedness`. Its Suggested.lean declares SmoothRep as the smooth full subcategory and SmoothCentre as its ordinary CatCenter. Its corner and separatedness targets were read in the README; their names are not claimed to be executable declarations in Suggested.lean.

The SR.1 request now records that existing upstream import with its cofinal invertible-pro-order and separated-coefficient hypotheses. The record stays in requests so the existing stage references resolve, but has supplied status and is also recorded among resolvedRequests. Thus there are sixteen contract records, fifteen open. No ordinary center target is replanned here. The enhanced restriction/heart comparison remains ES0's work.

The current library checkout inspected was TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All nine newer upstream directions were screened for relevant enhanced/action interfaces, including their Suggested files; OperatorTheory's files are under its subroadmaps. None supplied the missing geometric types. The current smooth-representation roadmap explicitly assigns its infinity-categorical enhancement to the enhanced-sheaf/v-stack owners.

## Reviewer corrections retained

All eight revision 2 corrections were checked against the source and current supplier contracts and retained:

1. Classical-center restriction and Whittaker extension use VS4/lisse-stratum-left-adjoint, the fully faithful adjunction of VII.7.2, pp. 272–273.
2. The spectral-center map imports GS4 and retains invertibility of |pi_0 Z(G)| (IX.5.2, p. 329), separate from the dual fundamental-group torsion restriction for integral actual-Perf generation.
3. Integral change of data uses ES3's approximation and LP4/rep-action-on-perf, rather than ES2's characteristic-zero family. The LP/HS coefficient comparisons remain explicit (X.0.1, pp. 339–340; X.3.1, pp. 348–349).
4. Finite-wild descent requires quotient-equivariant pullback full faithfulness with enhanced homotopies, as in IX.5.1, pp. 327–328; ordinary triviality on objects is weaker.
5. The dual-number exact sequence is a D(R) test with an endpoint k that need not be compact. The compact nilpotent support test instead uses k in Perf(k) and the central action through R→k.
6. Duality imports VS5/lisse-bernstein-zelevinsky-duality (VII.7.6, pp. 274–275), retains the rho-hat(-1) correction of VI.12.1, pp. 239–241, and discards it only on the conjugation quotient in IX.5.3, pp. 329–330.
7. Local-shtuka compatibility imports HS3/hecke-cohomology-comparison, general-bound-compactness and level-trace-and-pullback. General bounds, pro-p compactness, level/tower domains and index normalization stay explicit; no single compact cutoff is asserted for the tower (IX.3.2, pp. 326–327).
8. The three VS/HS mathematical requests and their gap remain resolved. Their accepted planning contracts supply no corresponding enhanced Lean exports, so the distinct signature gap stays open.

RT findings 5, 6, 7, 9 and 34 and rejected finding 35 remain handled as before: LP2 owns abstract excursions, ES2/ES3 own Chapter X universality, LP4 owns VIII.5.1 generation/module comparison, SR owns the ordinary smooth center, and ES7 owns the general parabolic/stratum return. No supplier file, review or atlas file was edited.

Source issue E1 and its independent confirmed verdict were preserved byte-for-byte as JSON data. It concerns the commutative reindexing square on p. 292 of the hash-identified author copy, not an unverified published passage. Its earlier independently checked counterexample and source-version limits remain intact.

## Why the remaining revision cannot be completed here

The missing interfaces are actual mathematical types, rather than theorem proofs that can be replaced by `sorry`. The E5 packet is partial. Its presentability contracts have no declarationName exports for stable Lambda-linear infinity-categories, enhanced exact functor/mapping objects, E_2 identity endomorphisms, compact/Ind mapping comparisons or coherent finite-set action anima. Accepted LP/HS/VS packets state the mathematical contracts but do not export the enhanced geometric Lean types this file needs.

Current TauCeti near misses were read: DGCategory is an enriched category over complexes; ProjectiveStableCategory is the ordinary projective quotient of a Frobenius exact category; GradedLinearQuiver supplies graded Hom modules without composition. None provides the condensed stable-category/coherence interface required by the proposed ES signatures. Ordinary Scheme vector bundles in AlgebraicVectorBundles do not supply LP's derived quotient-stack Perf and animated equivariant relative tensor categories.

PROTOCOL section 13 requires unstated conditions to be omitted instead of replacing them by arbitrary proposition fields. Section 15 forbids duplicating supplier foundations. Completing those foundations in these four ES deliverables would violate the ownership boundary. The generic support repair above is possible with native types; enhanced action equivalences, definitions and their tests cannot be faithfully completed until the owners supply their real interfaces. This checkpoint stops for that blocker, not for elapsed time or a node budget.

## Exact continuation

The packet's suggestedLean.inventory contains the complete missing-name lists. There are now **34 missing node names, 16 missing API names and 18 missing proposed test labels**, down from 35 missing node names. Eight proposed node names and 22 API names are executable; seventeen examples carry thirteen of the thirty-one proposed test labels, plus the two additional coefficient-hypothesis labels. Name presence remains an upper bound on full coverage: several existing declarations are ordinary observations.

All 42 node IDs, 26 planets and unchecked statuses are preserved. Eight stages are planned, none closed. Four gaps remain: enhanced signatures; LP3's DVR highest-weight filtration for X.3.2; the exact LP1/VS3/HS1/E5 geometric derived scalar-extension range; and LP1's elliptic-component deformation calculation. No additional mathematical gap was silently removed.

The next worker should first obtain concrete interfaces from the following owners, then replace the omitted and weaker signatures in place:

| Owner | Required input |
| --- | --- |
| E5:abstract / E5:presentability | Stable linear infinity-category, enhanced mapping objects and pi_0; exact monoidal functor/action anima; compact/Ind extension and relative tensor/localization interfaces. |
| E5:animation | Animated finite Q-torsor-set and free-group resolution interfaces with coherent transport over Fin. |
| HS1 / HS4 | Condensed continuous Weil-equivariant enhanced Hecke family and pro-p quotient pullback full faithfulness. |
| LP1 / LP3 / LP4 | Derived quotient-stack Perf/universal representation evaluation, equivariant Ind-module comparisons and DVR approximation/generation/base-change types. |
| VS4 / VS5 / HS3 | Executable exports of the already accepted stratum adjunction, lisse duality and normalized multi-leg comparison; do not reissue their mathematical planning requests. |

Use the supplied enhanced types, preserve the current coefficient ranges, and state the universal-action comparisons as equivalences of coherent-data anima. Instantiate support_coefficient_change only where the actual geometric End tensor comparison is proved. Keep the ordinary smooth-center import receipt and the unchanged needs_changes review until a fresh independent review replaces it.

## Reading and checks

The public [author manuscript](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) has SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Printed and PDF pages agree. This run read VI.12 pp. 239–241; VII.7 pp. 272–275; IX.3–IX.5 pp. 326–330; X.0–X.1 pp. 339–344; and X.3 pp. 348–350 for the corrected contracts. The previous wider receipts are retained in revisionReadingHistory; no new full-source or published-edition read is claimed. [Stacks Definition 10.39.1](https://stacks.math.columbia.edu/tag/00H9) and the pinned Mathlib flatness/exactness statements supply the elementary support argument. All results are paraphrased; no source passages or private-library files were copied.

The reviewed eight ES audit entries, relevant supplier contracts and current upstream ReductiveGroups and SemisimpleAlgebras readers were read. New baseline declarations were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The packet's TauCeti pin remains `f790474821cf4256814db967cb154e7af3d0c369`; this suggested file imports only Mathlib, so current/unpinned TauCeti is not used for elaboration.

Validation:

- Packet checker with the pinned declaration index: exit 0, zero errors and warnings; 42 nodes, 38 APIs, 31 proposed definition tests, 26 planets, 34 baseline declarations, four gaps, sixteen contract records, eight planned stages and none closed.
- `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES0.lean`: exit 0, 52 declaration-uses-sorry warnings and no other diagnostics. Available memory exceeded 100 GB. No language server or library build was started.
- Nested-comment-aware executable inventory agrees with the packet; reader target fields agree; node IDs, review, source issue, planets and unchecked statuses are unchanged. Internal dependencies are acyclic. Only authorized deliverables changed, with no local paths or excerpt fields.
- `git diff --check`: clean.

All continuation information is in these deliverables. Scratch source files and logs are discarded after the pull request opens.
