# DESIGN-HodgeClassesForJacquetLanglands

Codex, session `codex-fABs77`; issue #3457. This is a complete target-level design pass for the entire roadmap, ready for independent review. It is not an implementation or a closed prerequisite graph.

## Deliverables and coverage

The roadmap definition, packet, reader and suggested Lean file agree on eleven layers, JL.0–JL.10. All eleven have coverage `planned`; none is `closed`. There are 71 nodes: 6 definitions, 15 constructions, 36 theorems, 13 comparisons and 1 application. The 21 definitions/constructions each carry three API items and three discriminating tests: 63 API items and 63 tests. There are 45 planets, at most six in any layer, and eight pinned baseline declarations. Every node remains `implementationStatus: unchecked`.

All 62 items routed to this roadmap by `PAPER-ICHINO-PRASANNA-23` are explicitly mapped in `node.routedItems`. The reader has the complete statements, hypotheses/conventions, proposed declaration names, proof routes, direct dependencies, acceptance checks, APIs and tests. The harmonic layer JL.4 precedes the rational coefficient comparison JL.5. JL.9 is required only for the conditional all-prime Galois result in JL.10; the unconditional Hodge theorem does not depend on it.

## Checks

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeClassesForJacquetLanglands.json` reports zero errors and zero warnings.

`lean-check research/blueprint/suggested/HodgeClassesForJacquetLanglands.lean` completed successfully at the pinned shared build, with only the intended unproved-statement warnings. Memory was checked before compilation. The 132-line file has four light definitions with real bodies, ten theorem signatures and nine examples. It states the diagonal semilinear operator, weight-map/parity checks, normalized Hodge table and matrix determinant descent, using existing field/function/matrix carriers. It introduces no heavy assumed data or fictitious cohomology carrier. Its successful elaboration checks types, not proofs of the mathematical targets. An initial obsolete import was replaced before the successful check.

Additional consistency checks verify all 62 routed item ids, every definition/construction’s three API items and three tests, reader inclusion of all node/API/test names, an acyclic node graph, the numerical exterior-square and character-map identities, and a strict five-file deliverable boundary. No packet or reader contains source excerpts, Lean code, private paths or embedded source files.

## Closure work for the next worker

The packet has four named gaps, each with exact consumers and published-source locators. These are supplier interfaces whose proposed Part II roadmap ids do not yet have registered stages; they are not invented as prerequisites.

1. **Quaternionic Shimura realizations.** Assign arbitrary-Σ quaternionic local systems, their special L-rational multiplicity models, degree-d Matsushima realizations of rank 2^d, Poincaré pairings and compatible Betti/all-ℓ models to **HilbertModularVarietiesAndShimuraCurves, Part II (quaternionic)**. Include the empty-Σ finite compact Shimura-set case; strict Deligne SV3 is not imposed on a compact Q-adjoint group.
2. **Automorphic cohomology and rational coefficient descent.** Assign compact Matsushima with all rational Hecke conjugates, normalized central traces to the actual image, homogeneous-variation Hodge-degree rules, and the required Tits/Schur descent for rational harmonic coefficients and the block projection to **ShimuraVarieties, Part II (automorphic cohomology)**. Canonical-model functoriality in V8 is insufficient for these cohomology statements. A field of rationality is not automatically a field of definition for arbitrary quaternionic representations.
3. **Quaternionic theta periods and the residue at s=3/2.** Assign the precise toric/product-period nonvanishing, quaternionic doubled intertwiner/residue identities, local toric test vectors, norm-one character extension and minimal discrete-series tensor-product interface to **MetaplecticAutomorphicForms, Part II (Shimura–Waldspurger)**. MP.6’s GQT positive-range value formula does not supply the quaternionic residue with no range comparison. MP.3 already supplies quaternionic splittings, Morita/splitting comparison and unramified theta; those are directly imported and must not be replanned.
4. **Compatible realizations.** Assign the category M_k^L, its all-prime comparison maps and simultaneous fixed-tensor subset HT to **MotivesAndAlgebraicCycles, Part II**, with geometric comparison from the Shimura extension. MC.2’s Weil axioms and MC.7’s abstract Hodge-class notion do not alone supply this category. HT here is not merely the local p-adic Hodge–Tate property.

There are fifteen existing-stage requests, all recorded with exact statements and consuming nodes: GN.2; AF.4; MP.3 and MP.2; ML.4; R06.2; PadicHodgeRegulators L1; ClassFieldTheory Layers 10, 11 and 13; ReductiveGroups Layer 3; GlobalNumberFields Layers 1, 2, 4 and 9. Bind these requests to verified exact nodes when available. No external issue, message or supplier file was created. The packet’s `restructure` records the ownership boundary and proposed Part II additions. These are request records, not claims that another worker accepted them.

The next worker is the independent reviewer: recheck the targets and source corrections, especially the invariant-component determinant argument and the actual Hilbert-Galois normalization in JL.9. The packet is complete as a planning pass, with four honest supplier gaps; closing those interfaces requires follow-up ownership work, not another claim by this session.

## Source work and corrections

The source read is Ichino–Prasanna, *Hodge classes and the Jacquet–Langlands correspondence*, Forum Math. Pi 11 (2023), e22, DOI 10.1017/fmp.2023.20: main theorem pp. 4–5, the full relevant definitions/proof chain pp. 14–99 and Proposition A.1 on p. 101. The packet records its public publisher URL, access date and the hash of the downloaded published PDF. Cambridge can stamp downloads differently, so that hash identifies this read copy rather than a promise of identical future bytes. General auxiliary results are exact supplier imports or named boundaries; this design does not claim to have read the paper’s entire bibliography. No restricted book was needed, and no source is missing for this target-level pass.

All eight findings from the extraction and `REV-PAPER-ICHINO-PRASANNA-23` were rechecked and recorded in own words. Their earlier independent confirmation is attributed; this author does not certify an independent review of the new design. Searches of the publisher record, Prasanna’s research page/published PDF link and exact-title erratum queries on 19 October 2026 found no published erratum.

The statements use rational Hodge structures with L-action, degree d instead of the printed 2d, the quaternionic group in the rotated diagram, the torus morphism without a component bijection, and a full Hecke character on A_E×/E×A_F×. Proposition A.1’s second denominator factor is missing the local subscript v, not the factor itself. The Hodge-type parenthesis is corrected.

For E8, degree-zero rational coefficients do not force Galois invariance. The explicit cocharacter factors through j(s)=([s,s],s); the reflex-norm image is killed by η_T because η is trivial on A_F×. Thus c_η belongs to the scalar extension of the actual invariant component space W_Q. Determinant nonvanishing descends in the two parameter blocks over Q(k) and Q, using finite coefficient spans over each base field. It does not average an invertible operator or assume the whole component action is trivial.

Two extraction corrections are kept separate from published-source issues: the seesaw is equation (10.7), p. 72, rather than (10.8), p. 73; and the three-plus-one restriction uses W=U₃⊗U₄ from (5.16), p. 37. IP23’s theta integral has no conjugation of the automorphic vector, whereas the MP.5 supplier does: θ_IP(f)=θ_MP(bar f). The backward lift uses the corresponding conjugation. The document pins this translation and retains the prescribed infinity types.

## Baseline and current-upstream boundary

Pinned sources checked: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Existing Hodge/Tate/internal-Hom, exterior-power functoriality/pairing/top-determinant and quaternion square-rescaling statements were read directly. Current Tau Ceti main and current TauCetiRoadmap were inspected separately; no build was run there. The current exterior determinant declaration has moved to `ExteriorPower/Basic.lean`, while the baseline citation correctly uses `LinearAlgebra/ExteriorPower.lean`.

Current OrthogonalSpinGroups, ReductiveGroups, ClassFieldTheory and GlobalNumberFields boundaries were read; HodgeStructures conventions and the reviewed library audit were checked. General spin/Clifford and low-rank algebraic-group theory stays with OrthogonalSpinGroups and its stated AlgebrasWithInvolution direction. The present explicit hermitian exterior-square and block comparison retains the additional volume, multiplier and coefficient data needed for this proof.
