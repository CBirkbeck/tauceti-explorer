# BP-DiamondEtaleCohomology--C0 handoff

Issue #709; worker Claude (session `claude-Ow9Ujk`); claimed 7 October 2026. Input main commit `bd4ae3b5`.
Deliverables: `research/blueprint/packets/DiamondEtaleCohomology--C0.json`, `research/blueprint/readmes/DiamondEtaleCohomology--C0.md`, `research/blueprint/suggested/DiamondEtaleCohomology--C0.lean`, this note.

## What is done

A complete target-level pass over stages C0–C7, written from ECD (Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4, SHA-256 `78ca42bb…3efc`, the same file the C8 part read), §§14 and 16–20 read in full. Packet status `complete`; every stage `planned`, none `closed` (two recorded gaps and nine supplier requests remain).

- 118 nodes: 13 definitions, 19 constructions, 71 theorems, 15 lemmas; 191 API items; 137 unit tests; 37 planets (at most six per layer); 20 Mathlib baseline declarations, each read at `082e2d3` and present in the pinned index.
- C0 (14.1–14.11): the three sites with cutoffs, cutoff derived categories, geometric stalks and enough points, λ_Y and ν_Y, the hull λ∘_X and Lemma 14.5, 14.4, 14.7, 14.8, continuity 14.9 (absolute and relative), repleteness of the v- and quasi-pro-étale topoi by countable lifting towers (as the stage text asks; this replaces ECD's weakly contractible basis, which no supplier states), left-completeness 14.11, comparisons 14.10.
- C1 (16.1–16.10): explicit base change transformations with composition and slice compatibility; Theorem 16.1 as three separate nodes; 16.4, 16.6, 16.7, 16.9, 16.10. Derived statements are for complexes on Y_qproét whose cohomology sheaves come from Y_ét, so C1 does not use D_ét.
- C2 (14.12–14.16, 16.5, 16.8, 17.1–17.4): v-locality after 16.1, D_ét with full API/tests, left completion, cohomology-sheaf criterion, enhanced categories at a cutoff, hyperdescent before Lemma 17.1 (whose proof uses it), R_Yét and its bounded formula (maintainer-routed PAPER-SCHOLZE-17/381).
- C3 (17.5–17.9): f^∗ (composition law (f ∘ g)^∗ ≃ g^∗ ∘ f^∗, Lean form `pull (g ≫ f) ≅ pull f ⋙ pull g`), Rf∗, Rf∗ = R_Yét Rf_v∗, the locally spatial comparison (maintainer-routed PAPER-SCHOLZE-17/387, with a proof supplied), Proposition 17.6 in both forms, ⊗^L, RHom, 17.9, change of coefficients.
- C4 (§18): proper and partially proper maps, the locally compact Hausdorff comparison (maintainer-routed PAPER-SCHOLZE-17/411, an exercise in ECD; proof supplied), valuative criteria, the envelope Ȳ and Proposition 18.7 in four nodes, the canonical compactification and its universal property, 18.8, 18.9 with its claim, 18.10.
- C5 (19.1–19.4): étale f_! with base change and the open-support triangle, the exchange map, the compactification hypercover, the Zariski–Riemann topos, Lemma 19.4 as a C5 node (the H1:henselian node is Huber's absolute statement, not 19.4), Theorem 19.2 bounded and unbounded.
- C6 (19.5): parts (iii), (ii), (i), the annulus reduction and annulus cohomology, and the invariance of cohomology and connected components (requested by DiamondSixOperations S4).
- C7 (§20 except 20.9, 20.10, 20.17, which are the C8 part's): constructible sheaves on spectral spaces, strictly totally disconnected spaces and small v-stacks; 20.3–20.8; local systems; L|_Z; perfect-constructible complexes 20.11–20.16 with Proposition 20.14 (maintainer-routed PAPER-SCHOLZE-17/464); the field corollary requested by the C8 part. Proof order as the stage text demands: 20.15 full faithfulness → 20.16 → 20.15 essential surjectivity (and the ring case).

Checks run: `scripts/check_blueprint.py --index <pinned declarations.tsv>`: 0 errors, 0 warnings. Every excerpt was checked by script against the extracted ECD text (NFKC, whitespace removed). Every cross-packet prerequisite id was checked to exist; no node-level cycle; the only induced paths into this roadmap go from C7 to the C8 part's point-quotient, specialization-stabilizer and point-sheaf nodes, whose closures reach C0–C4 only, which do not depend on C7. `research/blueprint/intake.py check-files` on the four files: see the pull request. The reader is generated from the packet (every node's statement, proof steps, API, tests, acceptance, dependencies and source are printed), with hand-written introduction, conventions, proof order and per-layer overviews.

## Red-team finding RT-AREA-padic-1/11

Handled by option one of the fix: ECD §18 (proper and partially proper maps, the envelope, the canonical compactification and its universal property, 18.8–18.10) is planned in C4, and the packet's first `restructure` entry asks the maintainer to correct RS-05's owner entry for "Diamond canonical compactification geometry" to DiamondEtaleCohomology:C4 (formerly D5 and S0) and to rewrite the D5 keep reason (ECD §§11–13) and the D2 keep reason (effective descent is D3's). This agrees with the DiamondsAndVStacks packet (which treats ECD 18.6 as C4's) and with DiamondSixOperations' request to C4. RS-05 itself was accepted before this job and is otherwise followed: C5 imports the henselian comparison from ClassicalAdicEtaleCohomology:H1:henselian, and the generic enhanced theory is imported from EnhancedDerivedSheaves E1–E3.

## Maintainer-added sources

- ECD items 381, 387, 411, 464 (C2, C3, C4, C7): nodes `C2/etale-coreflection-bounded-formula`, `C3/pushforward-locally-spatial`, `C4/locally-compact-hausdorff-proper`, `C7/perfect-constructible-restricted-compactness`. All four are asserted without proof in ECD; the nodes supply proof sketches.
- Caraiani–Scholze item 69 and Fargues–Scholze Problem I.11.1 are routed to C8, which is the other part (`DiamondEtaleCohomology--C8.json`, accepted); nothing in C0–C7 uses them.

## Gaps (recorded in the packet)

1. ECD Proposition 14.7 in degrees ≥ 2 for v-cohomology (PAPER-SCHOLZE-17/E46): the Čech step needs vanishing on fibre powers that ECD does not prove. Two repair routes are recorded at the node and in `gaps`. Degree 1, groups, and all quasi-pro-étale statements are unaffected.
2. ECD Theorem 19.5(ii), the vanishing RΓ(Y′_n, f_n^∗j_!A_0) = 0 (PAPER-SCHOLZE-17/E60): Theorem 19.2 does not apply to the non-proper annulus. The comparison-with-canonical-compactification route and the explicit route are recorded. Part (iii) is unaffected.

## Requests (nine)

DiamondsAndVStacks D0 (SGA 4 VI 8.7.7 limits of coherent topoi and coherent-topos interfaces; joins the existing H0 and P0 requests), D3 (Lemma 9.5 as its own node; Propositions 10.9 and 10.10 for v-stacks), D5 (sub-v-sheaves from pro-constructible generalizing subsets; localization and field-point presentation, joining C8's requests; locally compact Hausdorff v-sheaves), EnhancedDerivedSheaves E2 (module-coefficient versions of left completion, R lim amplitude and hypercover descent), E3 (HTT 5.5.3.12 and 5.5.2.2), SchemeAndStackFoundations SF.2 (étale topos of a limit of schemes; proper base change). Exact wording and consumers are in the packet.

## Incoming requests

Every request other packets address to C0–C7 is answered by named nodes; the packet field `consumerContracts` lists them per consumer (AdicCoefficientsAndComparisons, the C8 part, DiamondSixOperations, FarguesFontaineDiamonds, VectorBundlesAndIsocrystals VB3, PrismaticCohomology PR.0/PR.8). Two requests go beyond C0–C7's scope and are recorded in `restructure`: PR.8's completed structure sheaves Ô_Y (a diamond has none without an untilt) and PR.0's lisse Z_p-category (supplied here only through D_ét).

## Source issues

No new mistakes found. The 21 PAPER-SCHOLZE-17 errata of §§14 and 16–20 that these stages use (E44–E48, E52–E61, E89, E91–E95; all confirmed by that extraction's review) are used in corrected form at the nodes listed in the packet field `inheritedSourceIssues`, and are not re-recorded in `sourceIssues` to avoid duplicates in the register. E61 (20.16 (i) ⇒ (ii)) has its repair argument written into the node's proof steps.

## Restructure proposals

(1) RS-05 owner correction for §18 (above). (2) Retire `C8/strictly-disconnected-acyclic` in favour of `C0/std-etale-acyclic` at assembly (same statement, §14 material). (3) One sentence in C1/C2 saying Corollaries 16.5 and 16.8 are in C2. (4) Route PR.8's structure sheaves elsewhere.

## Suggested Lean file

`research/blueprint/suggested/DiamondEtaleCohomology--C0.lean` (≈5,100 lines, Mathlib imports only) **compiles**: `lean-check` at the pinned Mathlib `082e2d3` reports no errors and no warnings other than `declaration uses sorry` (636). The shared build's Tau Ceti is a different commit, so no Tau Ceti module is imported. Free memory was above 100 GB.

- Coverage: a script checks that every API name and every unit-test name of the 118 nodes, and a declaration for every theorem and lemma node (lowerCamelCase of the id), occurs in the file; it reports none missing. The file has about 240 theorems, 410 definitions and 130 test `example`s.
- Form: the file follows the PROTOTYPE LIMIT pattern of the accepted FarguesFontaineDiamonds file. A data-only supplier structure `Carriers` (small v-stacks, diamonds, locally spatial diamonds, strictly totally disconnected spaces, the underlying-space functor, small skeleta at a cutoff of the étale, quasi-pro-étale and v-sites, perfectoid Tate and field pairs, étale maps) has no Prop-valued fields. The notions this packet owns are genuine definitions over it or over Mathlib: the sites as Grothendieck topologies, `D(−, Λ)` as Mathlib's `DerivedCategory` of sheaves of Λ-modules, D_ét as an `ObjectProperty`, universal closedness, quasicompactness, separatedness, properness and partial properness, the valuative lifting properties, tautness, repleteness, constructible sheaves on spectral spaces (with `Topology.IsConstructible`, `constantSheaf`, `Module.Finite`), perfect complexes as bounded complexes of finite projective modules, perfect-constructibility, local systems, and thickness as `IsTriangulated ∧ IsStableUnderRetracts`. Lemma 19.4 is stated over Mathlib valuation subrings with `Sheaf.H`; prime-to-p hypotheses are `(n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)`; the pullback law is `pull (g ≫ f) ≅ pull f ⋙ pull g`; base change transformations are built as mates.
- Omitted, as the header says: hypotheses not typable against the carriers (0-truncatedness of maps of v-stacks, local separatedness, κ-smallness, "algebraically closed" for geometric points modelled as connected strictly totally disconnected spaces), and the ∞-categorical content (presentability, enhanced hyperdescent, coherences), which is recorded at the homotopy level. No condition is replaced by `True` or a Prop-valued placeholder. Seven tests that need data the carriers lack (residue fields, Gauss points, Galois covers) are comments only. An arbitrary instance of `Carriers` does not satisfy the theorems.

## What a follow-up must do

Close the two gaps; receive the nine supplier contracts and replace the stage-level prerequisites by the suppliers' node ids; refine to lemma level where the coverage records say so (the generator checks of 14.2, the finite-stage covering descent of 14.9, the Čech argument of 16.8, the coherent functoriality data of §17 used in §22, the extension step of Remark 20.3, the hypercohomology step of 20.14 and the ring case of 20.15); at assembly with the C8 part, apply restructure entry (2).

## Sources read and missing

Read: ECD arXiv v4 §§14, 16–20 in full, §1 Theorems 1.11–1.13, §15 as context (downloaded 7 October 2026; hash above). Supplier packets read: DiamondsAndVStacks, PerfectoidSpaces--P0, EnhancedDerivedSheaves--E0/E5, ClassicalAdicEtaleCohomology--H0/H4, the C8 part, DiamondSixOperations, AdicCoefficientsAndComparisons, FarguesFontaineDiamonds, DeformationAndDerivedPatchingAlgebra--P7/P7-2, SchemeKTheoryOperations. Not read directly (their content enters through supplier nodes): BS15 (Bhatt–Scholze, pro-étale topology), Huber's 1993 and 1996 works, SGA 4, HTT.
