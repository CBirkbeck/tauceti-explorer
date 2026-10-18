# BP-StableReductionPartII--MC.1 — completed planning pass

Agent: Codex, session `codex-F1Oum3`. Issue: #8901. Scope: `StableReductionPartII:MC.1`. The claim was confirmed by the bot before work began. This pass changes only the issue’s packet, reader document, suggested file and this handoff.

## Delivered and status

The packet is **complete** and MC.1 coverage is **planned**, with an explicit frontier. It is not closed. There are 12 new nodes: 1 definition, 4 constructions, 4 theorems, 2 comparisons and 1 application; 23 API items and 20 definition/construction tests. The five baseline citations were read at their pins. No planets are added: the parent’s six MC.1 planets remain the assembly selection. Every implementation status remains unchecked.

The reader document gives the complete statements, hypotheses, proof routes, dependencies, APIs and distinguishing tests. A thirteen-entry `targetResolutions` map in the packet covers every inherited MC.1 target without copying or editing its node. The parent packet is unchanged.

The new proof refinements are:

- The tricanonical numerical profile and its arbitrary-base cohomology/evaluation comparison.
- A universal cohomology rank stratum followed by an evaluation-isomorphism open for the relative polarization locus; a determinant open imposes the complete coordinate series. The base-line twist is retained, without adding a trivialization.
- Projective-frame comparison, a bounded bare Isom graph polynomial, and the universal relation `U_g × PGL_r`. The fixed graph polynomial gives finite presentation; polarized Isom pairs would add unwanted scalar data.
- The normalization deformation sequence, its dimension calculation, and comparison with the actual Hilbert completion after coefficient-ring base change. The framing contributes `r²−1` formal variables.
- Algebraic boundary branches obtained from the finite unramified singular scheme, with Cartier and relative-transversality descent contracts. No arbitrary completed factorization is assumed to algebraize.
- The refined DVR test applied to generic points of the universal Isom **source**. Source density is established before Isom properness. Smooth-generic uniqueness is used only in that universal test, then properness descends to all pairs, including those with nodal generic fibre.

## Exact frontier for supplier work and assembly

The packet has two grouped gaps and twelve requests. Eight requests are extensions, numbered Q1–Q8; four acknowledge existing upstream contracts, without requesting new planning in StableReduction Layers 1, 2, 3 and 8.

1. **Q1 — AlgebraicModuliForArithmeticGeometry:R09.1.** Arbitrary-base relative dualizing/very-ampleness comparison, stable Hilbert openness and Noetherian-approximation compatibility. Stable-fibre positivity and vanishing remain existing inputs.
2. **Q2 — R09.1.** The all-base projective-bundle line-twist comparison, PGL action and smooth projective-frame torsor. Build on the existing SF.2 affine matrix-algebra automorphism and scalar-gerbe nodes; do not create a second generic PGL carrier.
3. **Q3 — SchemeAndStackFoundations:SF.2.** Coherent sheaf/global Ext and the local-to-global spectral sequence, with the lci cotangent comparison and finite-support cohomology needed for the nodal calculation.
4. **Q4 — AlgebraicModuliForArithmeticGeometry:R09.6.** Existing-atlas completion comparison, formal frame variables and descent of smoothness/dimension/Cartier ideals/intersection smoothness. An algebraically closed residue field need not be finite type over Z: apply the existing scheme-formal comparison after base change to its Cohen coefficient ring, rather than misapplying generic algebraization over Z.
5. **Q5 — SF.0.** Étale splitting of a finite unramified morphism into disjoint closed immersions, with its exact hypotheses.
6. **Q6 — SF.4, with SF.1 descent.** Relative normal-crossing coordinates from smooth intersections of Cartier branches. The existing absolute regularity criterion is insufficient over Z.
7. **Q7 — SF.1.** The dense-image stack properness criterion of Stacks 106.11.3, with the generic identification, 2-arrows and extension valuation ring retained.

8. **Q8 — SF.1.** The smooth-atlas stack dimension formula on geometric fibres and its base-change invariance, giving 3g−3 after subtracting r²−1. Smoothness descent alone does not supply this formula.

The exact consumed statements and node lists appear in each request. Closure must also respect gaps already recorded in supplier packets. In particular, SF.4’s generic node-deformation target records the continuous-versus-algebraic completion issue; Stacks 93.16.2–93.16.4 identifies the comparison required to close it. This pass does not edit that owner or claim its gap is closed. Only the smooth case of SF.1’s groupoid presentation theorem is used; the separate merely-flat-groupoid bootstrap issue is not needed. Likewise, the PGL_r torsors use only the affine-group case (a) of SF.1/torsor-representability, supplied by affine fpqc descent; the general non-affine-group bootstrap is not assumed.

**Ownership overlap:** SF.4 already owns `stable-curve-stack`, `isom-stable-curves`, `stable-curve-stack-algebraic` and `stable-curve-stack-smooth`. The packet proposes a rescope: retain those terminal owners, identify the parent’s unpointed MC.1 targets with their n=0 instances, and attach the explicit unpointed proof refinements here. Do not make these proofs depend on the terminal stable-curve results they help establish. The input moduli groupoid and effective descent also have existing parent IDs in MC.0; assembly must identify these definitions, rather than duplicate them.

## Library and source audit

Pinned baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed `data/library-coverage.json` entries for R09.1, R09.2, R09.4 and R09.6 were read. Current read-only upstream StableReduction, JacobianChallenge and AlgebraicVectorBundles documents and suggested files were checked. Current Tau Ceti’s vector-bundle, invertible-sheaf, absolute module-cohomology and stable-reduction model interfaces were inspected. Their existing targets are imported, with no theory developed in the shared trees.

The supplied roadmap checkout is at `0d144d044dacebca17b654695b6f1ad58f159b27`; the current library is at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The tier guide calls foundations merged, but the supplied checkout has no SchemeAndStackFoundations or AlgebraicModuliForArithmeticGeometry directory. The packet records this discrepancy and uses the available exact supplier nodes as plans, not as checked upstream implementations.

Public source passages read:

- Deligne–Mumford, §1 pp. 76–85; §4 pp. 97–104; Proposition 5.1 and Theorem 5.2 with proof, pp. 104–105. The relative boundary locator is **Definition 1.8 and Corollary 1.9, p. 83**; Corollary 1.7 is smoothness. The atlas criterion is Theorem 4.21, p. 104; the stack properness criterion is Theorem 4.19, p. 103.
- Stacks, Moduli of Curves §§109.15, 109.19 and 109.22, pp. 15–16, 19–21 and 25–27.
- Derived Categories of Spaces, Lemma 75.25.1 and remarks, pp. 60–62, and Lemmas 75.26.4–75.26.7, pp. 64–66.
- Examples of Deformation Problems, Lemmas 93.16.2–93.16.4, pp. 28–29.
- Limits of Schemes, Lemmas 32.15.2–32.15.3 and proofs, pp. 39–42.
- Étale Morphisms of Schemes, §§41.17 and 41.21, pp. 19–20 and 26–29.
- The Geometry of Algebraic Stacks, Definitions 107.5.2/7 and Lemmas 107.5.4–107.5.11 with proofs, pp. 10–13.
- More on Morphisms of Stacks, Lemmas 106.11.1–106.11.3 and proofs, pp. 27–30.

URLs, access date, editions and SHA-256 hashes are in the packet and reader document. The source statements are written in our own words. No PDFs, passages, excerpts or extracted source text enter the repository. No private book was used. DM §§2–3 and the transitive generic projective-automorphism/GIT proofs were not exhaustively reread: these are existing or requested supplier work, not concealed source-closure claims. The previously recorded A0-extension source errata are not filed again; the cohomology stratum is used in degree zero with its universal condition.

One new source misprint is recorded, pending independent review: `StableReductionPartII/E-MC1-001`, Stacks Lemma 107.5.5 (0DRJ), p. 11. Its proof opening uses addition where the stated formula and proof conclusion use subtraction. The identity and A¹ atlases of Spec k distinguish the two. The official tag comments and current GitHub source were checked for a correction; none was found. This changes no intended mathematical result. The packet records the exact PDF edition and hash in `sourceVersions`.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.1.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.1.lean`: **compiled at the pinned shared build**, with nine expected proof-placeholder warnings and no other warnings or errors.
- Packet/reader target, API, test and source consistency, allowed-path inventory, parent immutability and dependency-cycle checks are performed before submission.

The Lean file has one real-bodied numerical definition, five API theorem signatures and four examples. Heavy geometric carriers are documented precisely in the reader instead of introduced as placeholders, following WORKERS.md’s 2026-10-12 shape. No completed mathematical implementation is asserted.
