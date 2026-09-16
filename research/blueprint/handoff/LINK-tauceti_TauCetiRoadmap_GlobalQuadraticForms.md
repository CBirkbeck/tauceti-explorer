# Handoff: GlobalQuadraticForms links

## Identity, ownership, and status

- Job: `LINK-tauceti_TauCetiRoadmap_GlobalQuadraticForms`; issue [#27](https://github.com/CBirkbeck/tauceti-explorer/issues/27).
- Worker: **ChatGPT Pro — cgp-95cdeccd608b**; date: 2026-09-16.
- Claim comment: [5697552450](https://github.com/CBirkbeck/tauceti-explorer/issues/27#issuecomment-5697552450); session-specific acceptance: [5697554564](https://github.com/CBirkbeck/tauceti-explorer/issues/27#issuecomment-5697554564). The claimed label was independently re-fetched before substantive work.
- Input revision: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`.
- Isolated branch: `cgp-95cdeccd608b/link-global-quadratic-forms`.
- Packet checkpoint commit: `7eb608147e492f8b84cebfc38878e3963e74b181`.
- **Partial link audit, not a complete catalogue screen, an independent review, or an implementation.** No review verdict is added.

Authorised deliverables are this note and `research/blueprint/links/tauceti_TauCetiRoadmap_GlobalQuadraticForms.json`. No source roadmap, application file, atlas data, queue, reserved identifier, or another worker's packet has been edited. No git command was run.

The baseline file was read: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declaration names quoted here are planned roadmap contracts. This link job makes no declaration-level claim of library availability and did not verify Lean implementations.

## Delivered mathematical mapping

The packet records **37 new directed links**: **35 incoming** (22 from QuadraticFormInvariants, four from NumberFieldArithmetic, four from GlobalNumberFields, five from ClassFieldTheory), and **two outgoing** to `GeometryOfNumbersAndQuadraticArithmetic:GN.2`. Each has two verbatim source passages and a hypothesis-sensitive reason. The one overlap recommends **keep**, with explicit reuse boundaries rather than a roadmap-wide merge.

A pre-existing link from GlobalQuadraticForms Layer 1 to SpinRepresentations Layer 1 is listed separately and not duplicated. It supplies complex classification by rank, not the arithmetic Hasse principle or an SO-torsor theorem.

The mapping preserves these distinctions:

- Canonical local-field structures versus completion maps in an actual field extension: tower maps are used in quaternary base change, not in defining ordinary localization.
- Field-generic Witt/discriminant theory versus nonarchimedean classification and dyadic square theorems. Real signs are computed separately.
- Mixed weak approximation versus additive strong approximation; idelic carriers and norm maps versus arithmetic norm-index and Hasse-norm theorems.
- The Hilbert product formula is necessary for prescribed sign patterns but does not construct them. The concrete quadratic norm index is a separate input.
- Global isometry uniqueness does not manufacture a global realization of local invariant data.
- Rational isometry does not imply integral isometry, membership in a genus, or a hermitian analogue.

## Target-stage input/output inventory

All ten target stages were read in full. This inventory identifies the declaration-level needs that guided stage matching; it is not a blueprint packet.

| Target layer | Inputs and outputs checked |
| --- | --- |
| 0 | Actual scalar extension into finite, real and complex completions; canonical finite-local-field structure; tower compatibility only for changing fields. Outputs localization and intrinsic local predicates, with rank-qualified complex automaticity. |
| 1 | Real diagonalization and inertia; outputs signatures, real classification, and complex classification by rank. No finite-local-field theorem supplies the real signature. |
| 2 | Plain discriminant and local Hasse API, canonical completions, odd-unit Hilbert calculations and local classification. Outputs finite Hasse support and almost-all isotropy in the stated rank range. |
| 3 | One global square class, signatures, exact local realization exceptions and Hilbert reciprocity. Outputs admissible positive-rank invariant systems, not unrelated choices of local discriminants. |
| 4 | Mixed weak approximation, local square openness, canonical ideles/norm maps, concrete norm index, cyclic Hasse norm and the sign dictionary. Outputs the global square theorem, quadratic norm adapter, localized product formula and prescribed even Hilbert-sign patterns. |
| 5 | Binary square criterion, ternary norm theorem, field-generic quaternary descent, completion towers and higher-rank vector approximation. Outputs Hasse–Minkowski isotropy, with ranks two, three, four and at least five separated. |
| 6 | Nonzero-scalar representation/isotropy criterion and regular Witt cancellation. Outputs scalar and form representation principles and global isometry from local isometry. |
| 7 | Exact local realization, approximation, correction planes, global form representation and local Witt cancellation. Outputs actual global realizations and their uniqueness. The rank-one and hyperbolic-binary exceptions remain explicit. |
| 8 | Global isometry plus genuine Witt-ring functoriality. Outputs complete invariant classification, local-global hyperbolicity, injectivity of the Witt localization map, and a form-theoretic SO consequence. No H1 carrier or surjectivity theorem is introduced. |
| 9 | Earlier theorem and local-computation outputs. Tests include a finite obstruction invisible over the reals, a rational isometry, a two-real-place example over Q(sqrt(5)), small-rank nonexamples and the quaternary finiteness trap. |

## Six precise corrections, gaps, or coordination requests

**1. Quaternary sign explanation — definite arithmetic error.** In target 5.1 the explanatory bullet says that `(-1)^(n(n-1)/2) = -1` in dimension four. It is `(-1)^6 = +1`. Signed and plain discriminants therefore agree in rank four. Retain the chosen plain convention but correct that sentence in a separately authorised source edit. This does not refute the displayed descent theorem.

**2. Approximation locator — definite cross-reference mismatch.** The target's contract discussion cites GlobalNumberFields 0.2. The pinned supplier places `weakApproximation_denseRange` in **Layer 1, weak approximation and multiplicative congruences**. The packet uses the actual stage ID. The required statement is mixed-completion density, not merely a congruence corollary.

**3. Arbitrary-idele norm range — missing named supplier contract in the material checked.** Target 4.2/4.4 requires `mem_range_ideleNormMap_iff` for an arbitrary idele. The complete CFT Layer 13 and the name search expose the principal-idele specialization `principalIdele_mem_range_ideleNormMap_iff`. Do not treat that specialization as the full theorem.

Required supplier statement: for a finite separable extension of number fields E/K, an arbitrary idele is in the range of the canonical idele norm iff all finite and infinite coordinates are norms from their local finite étale algebras. Prove almost-all unit lifts and restricted-product assembly; derive the principal case. Cyclicity is needed by the global-element Hasse norm theorem, not by this range characterization. Use the canonical maps and explicit finite/infinite coordinate comparisons. This is a not-found report, not a proof that no implementation exists.

**4. Arbitrary-idele Hilbert support — expose the bridge.** In target 4.4 step 2, support of the character product for a varying idele does not follow directly from the previously stated theorem for two global elements. Use the finite nonunit support of the idele, the support of the fixed global coefficient, the dyadic places and the archimedean places; then apply the odd-residue unit-unit formula. This supplies an explicit intermediate lemma without invoking reciprocity for a fictitious global representative.

**5. Empty exceptional set — supply a nonzero choice.** In target 5.4 the neighborhoods force Q(x) nonzero only if the exceptional set T is nonempty. If T is empty, choose a global nonzero represented value of the regular binary space U, or add an auxiliary place/neighborhood. This is a missing branch of the written route, not a counterexample to the theorem.

**6. Prospective consumers — resolve actual stage ownership.** The target names Orthogonal and Spin Groups as the consumer of the SO form-theoretic corollary. Its exact registered consumer stage was not resolved in this screen. Registered SpinRepresentations consumes a complex normal form instead. The read scope of Completed/IntegralLattices concerns discriminant-form gluing and does not establish the claimed integral-genus consumer. Find and read the intended stages, or arrange separately authorised roadmap definitions; do not invent endpoints.

## Reading provenance and negative claims

The packet contains pinned public URLs, blob SHAs where available, and reading extents. Entire documents read: GlobalQuadraticForms, GlobalNumberFields, and GeometryOfNumbersAndQuadraticArithmetic. Additional complete relevant stages read: NumberFieldArithmetic Layer 5; QuadraticFormInvariants 0, 1, 3, 4, 6A, 6C, 6D, 6E plus relevant norm-form material and contracts; ClassFieldTheory 10–14; SpinRepresentations Layer 1. IntegralLattices was read only through line 190, and is not certified globally irrelevant.

The target roadmap extract had `stageEdges: []` at the input revision. The existing NumberFieldArithmetic packet was checked and contains no edge to this target. An exact `GlobalQuadraticForms#` code search returned only the Spin packet at indexed revision `262dee344399d4123a712655f2be585d7e68720d`; that packet was then opened at the input revision and its existing edge excluded. Index searches do not certify every concurrent branch or unindexed file.

This job checked repository roadmap passages, not the cited O'Meara, Lam, or class-field-theory book proofs. Their locators are not marked independently verified. No private reference material or extracted book text is included.

## Validation

Ran local `python3 -c 'import json; json.load(open("research/blueprint/links/tauceti_TauCetiRoadmap_GlobalQuadraticForms.json"))'` and a scratch-only packet checker. The latter passed 37 distinct endpoint pairs, ownership, evidence shape/minimum length, packet-only acyclicity, excluded-duplicate and examined-ID checks, overlap recommendation values and the private-path scan. A direct arithmetic check also confirmed the quaternary sign computation.

**Not run locally:** `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_GlobalQuadraticForms.json`. The exact repository script was read (blob `88135efe5a74ef82e088f3fa3189893e27a7867a`); it requires the complete `data/atlas.json`, unavailable to this local runtime. The small extracts enabled source work but did not supply that local execution input. The local checker is not a substitute for full-world endpoint, quote or cycle validation.

The existing `.github/workflows/swarm-check.yml` was inspected (blob `d638775ee3342612163098a71aab508d381c8bc6`): it invokes the repository validator for changed link JSON files in PRs. At this checkpoint its result has not been observed. Record the actual run and log in the submission thread; never infer mathematical correctness from structural checks.

## Continuation and integration boundary

Complete the catalogue screen before changing `status` to `complete`: all classical-area roadmaps, neighboring-area summaries, every other upstream Tau Ceti roadmap, and all relevant object/synonym hits. The eight `examined` entries deliberately record unequal reading depths. Search terms should include Hasse–Minkowski, rational equivalence, local/global quadratic forms, global square theorem, cyclic norm, Witt localization, prescribed invariants, SO torsors, genus, and spinor genus. Do not add an edge for the unrelated Hermite–Minkowski finiteness theorem or for shared use of the word Hasse.

Resolve the six requests above through the appropriate owners, check the complete graph and concurrent submissions, and obtain independent review. The intended structural recommendation is to keep the existing roadmaps, making GN.2 reuse explicit; no merge is requested. Submitted work remains unintegrated and unapproved. Do not release this submitted claim merely to take another task.
