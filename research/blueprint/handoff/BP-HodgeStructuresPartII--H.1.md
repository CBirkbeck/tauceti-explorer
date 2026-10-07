# Handoff — H.1 projective-base non-abelian Hodge moduli

Agent: Codex. Session: `codex-w37Ylo`. Job: `BP-HodgeStructuresPartII--H.1`, Refs #6938. The claim was confirmed by the bot before work began. This submission completes one target-level planning pass and claims no second job.

## Result and coverage

The packet has status **complete**; the single scoped stage `HodgeStructuresPartII:H.1` has coverage **planned**, with a precise remaining-work register. No stage is closed. Every implementation status remains unchecked. Completeness here follows the protocol's stopping rule once all stage targets have target-level nodes; it does not assert closed source proofs or available supplier implementations.

There are **36 nodes**: 4 definitions, 10 constructions, 1 lemma, 3 comparisons and 18 theorems; **59 API items**, **56 unit-test obligations**, **6 planets**, **13 baseline declarations**, **11 gaps** and **18 supplier requests**. The six planets are Betti moduli space, Dolbeault moduli space, De Rham moduli space, Hodge moduli space, Riemann–Hilbert correspondence and Non-abelian Hodge correspondence.

The graph covers the stable and semistable fixed-data moduli, actual families and fine framed schemes, operator boundedness/GIT, the Chern-zero component and local freeness, relative analytic horizontal frames and Riemann–Hilbert, harmonic metric existence/formality/compactness, the Hitchin map and semistable properness, Hodge scaling, the fixed-X formal and étale local products, and parameter flatness. The reader gives every statement, hypothesis, proof route, API, test, use, source and dependency. It has approximately 14,750 words.

The family determinant condition retains nilpotents. The dual-number test `(O,d+εα)` distinguishes it from a fibre-only condition. Unrigidified determinant fibres, determinant-rigidified groupoids and framed fine schemes have distinct inertia conventions. Projective refers to the base variety; the moduli are generally quasi-projective, and stable Hitchin properness is not asserted. The global Simpson regularity used is a homeomorphism, with stronger routed regularity explicitly open. No p-adic correspondence or global rigid Hodge splitting is constructed here.

## Validation and prototype boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.1.json` reports **0 errors and 0 warnings**, with the available declaration index. The prerequisite graph is acyclic, the external node/stage identifiers resolve, and all stage targets are represented.
- Additional consistency checks verify every planned declaration/API/test name in the reader and suggested-file declaration or omission inventory, the exact one-stage scope, unchecked implementation status, and the absence of private absolute paths and prohibited planning-document code.
- `lean-check research/blueprint/suggested/HodgeStructuresPartII--H.1.lean` elaborates successfully, with **18 admitted-proof warnings and no other warnings**. The genuine native portion contains two Betti set-level carriers, eleven API declarations and eight examples. These are signatures with unproved obligations, not completed implementations or proved tests.
- **34 planned nodes have omitted native signatures.** Each omitted declaration, API and example name is explicitly listed in the suggested file and in the packet's `signatureCoverage`. The comments are an omission inventory, not signatures or elaborated tests. G11 records this limitation. No missing geometric condition is replaced by an opaque proposition or arbitrary carrier.

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`, which is also the revision used by the shared elaboration build. Tau Ceti source statements were inspected at the required `f790474821cf4256814db967cb154e7af3d0c369` commit. The shared build's Tau Ceti checkout is at `cf386627e9176a3827c1a5fe804989fd94a4d216`; the prototype imports no Tau Ceti module, so its successful elaboration certifies only the stated pinned Mathlib subset. It does not certify a Tau Ceti geometric interface. Memory availability was checked before elaboration, and no build or language server was started.

## What must be supplied to close H.1

The packet gives consuming node ids and full required statements for every gap and request. Resume at these exact boundaries, preserving the existing ids and correct hypotheses:

1. **G1:** Obtain actual global relative operator, exterior/determinant, filtered differential-operator and Rees/PBW sheaf carriers from H.0, E1 and C0/C2. Read/export characteristic-zero local freeness for coherent integrable connections. The accepted affine/intrinsic H.0 nodes are imported unchanged.
2. **G2:** Expand the particular reductive GIT, finite-generation, numerical criterion, Matsushima/Luna and analytic quotient exports under R09.5. A finite-inertia theorem does not cover the unrigidified scalar GLr case. The source-specific operator adaptation is already planned here.
3. **G3:** Export coefficient horizontal-frame existence on nonreduced analytic bases and the relative Grauert/analytified Quot bridge. Fixed-X coherent GAGA and scalar hypercohomology comparison alone do not supply analytic family representability.
4. **G4:** Source-decompose compact Kähler coefficient Hodge decomposition, integration by parts, primitive-form norm identities, Chern–Weil realization/normalization and characteristic-class local constancy. Keep algebraic Chern/intersection and realization suppliers distinct from this analytic bridge.
5. **G5:** Supply End₀ dg Lie Artinian Maurer–Cartan/gauge invariance, reductive-stabilizer equivariance, completed coarse rings and the precise Artin approximation theorem. Verify the trace-zero adaptation of Simpson's fixed-X local product argument. Do not replace this geometric deformation problem by a Hochschild-only theorem.
6. **G6:** Source-decompose finite presentation of projective fundamental groups, generic Mehta–Ramanathan/Hom restriction, and hyperplane Lefschetz. Import upstream path-based covers unchanged.
7. **G7:** Supply compact bundle nonlinear heat existence/continuation, coefficient functional calculus and Uhlenbeck–Yau weak-subbundle regularity. The complete compact Simpson Higgs-functional proof route has been read; the generic imported machinery remains open.
8. **G8:** Retrieve and read Corlette, *Flat G-bundles with canonical metrics*, JDG 28(3) (1988), 361–382, DOI `10.4310/jdg/1214442469`. The public PDF endpoints tested returned interstitial HTML or errors; no PDF bytes, checksum or full-proof reading is claimed. Simpson 1992 Theorem 1(1) supplies the read primary statement, not its existence proof.
9. **G9:** Supply Ahlfors/subharmonic estimates, Uhlenbeck gauge compactness, harmonic-map energy bounds and Kempf–Ness moment-map compact lifts. Rellich compactness and algebraic Hitchin properness do not imply these inputs. Normalized-frame fibres are compact U(r) orbits with stabilizers.
10. **G10:** Determine the precise real-analytic/smooth/stratified enhancement of the routed EG20 item /006. Simpson II Theorem 7.18 proves the global coarse homeomorphism used here; stronger singular-space regularity is not claimed, and no source error is inferred.
11. **G11:** Replace each omission inventory entry by a genuine signature on the supplied native carriers, with its API and meaningful examples, then elaborate. Preserve the distinction between a set quotient and a coarse scheme or analytic space.

The **18 requests** name R09.1, R09.2, R09.5 and R09.6; C0, C1, C2 and C5; E1; SF.5; MC.2; H.0; four exact upstream PDE milestones; the UniversalCovers foundation stage; and DGAInfinity's finite-twisting layer. These are packet-level supplier requests, not claims that the exports exist. Where a finer exact node exists, including coherent analytification and accepted H.0 operator nodes, it is cited directly.

Six ownership proposals clarify H.1's projectivity wording, expand the generic reductive/coherent-restriction supplier, add the compact Kähler/relative analytic bridge, and propose Part II extensions of PDE, UniversalCovers and DGAInfinity. The upstream Tau Ceti roadmaps are not edited or replanned. The independent review must assess these supplier boundaries and the prototype omissions before accepting coverage.

## Sources and routing receipts

Six public primary sources were acquired and hashed: Simpson 1988 (published JAMS article, MIT mirror), Simpson 1992, Simpson 1994 I and II (published IHÉS articles), Simpson 1996 (arXiv v1, preprint pagination), and Esnault–Groechenig 2020 (published Acta article). The packet records public URLs, SHA-256 values, access date 7 October 2026 and the exact sections read. The reader reproduces that extent register. No whole-book or whole-routed-paper closure is claimed.

In particular, the read arguments include the operator boundedness/parameter/GIT/framed construction and delegated Theorem 1.21 universality proof, analytic Quot and good-quotient proofs, full relative horizontal-frame/Riemann–Hilbert and moduli-topology arguments, the compact Donaldson-functional/coercivity/heat-flow specialization, Higgs local-freeness/restriction/extension proofs, and the full fixed-X Hodge local-product/flatness argument. Generic imported GIT, topology, PDE, analytic and deformation proofs remain the specified gaps. The published scalar kernel of the Donaldson functional was also checked visually to fix its diagonal value and eigenvalue order.

The inherited EG20 §2.1 p.108 integrability/variety-name notation finding was freshly checked against the published bytes and recorded as already reported. No new corrigendum search or discovery is claimed. The parent's route manifest is left untouched. This part supplies the complex geometric portions of EG20 /003, /006, /007, /062 and the local-product input to /063. Arithmetic moduli/base change, the rigid quasi-finite locus/global splitting, other routed variations and all p-adic items remain in their assigned layers, especially H.5.

The reviewed library audit and relevant stage/link inputs were read, together with the upstream HodgeStructures and UniversalCovers reader documents. Every one of the thirteen baseline declaration statements was read at the pinned Mathlib revision. The inspected Tau Ceti HolomorphicSheaf functions-on-ℂ interface was rejected as a general analytic-space/bundle supplier.

All information needed to continue is in the four deliverables. Source PDFs and temporary authoring/check files are scratch material; no continuation depends on them, and they are removed after submission.
