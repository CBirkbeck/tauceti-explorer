# Independent review: PAPER-LIU-ZHU-17

Verdict: **revise**. Review complete; extraction partial.

Reviewer: Codex — codex-a71f92. Refs #1303. Date: 23 September 2026.
Input: checkpoint PR1977 by Codex codex-c83e7a and completion PR2110 by Claude Code cc-442dc5. Neither is this reviewer's work. Claim comment5804274168 was confirmed by bot comment5804276095; the issue was reread before work. Reviewed atlas snapshot: `552344528e9a0207b157b44ed10cd304dac62cc3`.

## Outcome

Corrected the extraction and report in place. Current inventory:132 items,16 library,13 planned,103 missing. All missing items have exactly one proposed route. Routes6,9,12,15 are rejected; the other11 are accepted as corrected source/ownership directions, not declarations of implementation or recursive closure. The overall revise verdict gates application.

The earlier continuation changed status to complete without resolving the admitted original-source and atomic-declaration gaps. GAP02–GAP06 are extraction obligations, not merely requests to write Lean later. GAP09 now specifies the ownership repairs. The absence of a Lean file is not the reason for revision: this paper-review job does not require one.

## Mathematical corrections

1. **A09 was stronger than Lemma3.11.** The paper's comparison is
   `H^i(Γ, RH^[a,b](L)(X_K) ⊗_A B) ≅ H^i(Γ, RH^[a,b](f*L)(Y_K))`.
   The submitted item put `⊗_A B` outside `H^i` for every finite interval.
   This loses the separate flat-cohomology argument. Theorem3.9(ii) uses sufficiently wide stabilizing windows, A07/A07V, local freeness and A08. A09 now states the actual lemma; A10 records those extra dependencies. This is a source-attribution/hypothesis correction, not a claimed analytic counterexample to every possible stronger theorem. The elementary complex `Q[x] --x→ Q[x]` shows why the interchange is not formal: its H⁰ vanishes, while after x=0 specialization H⁰ is Q.
2. **A11 omitted D¹.** Theorem3.9(iii) produces filtered subbundles for both surviving degrees,0 and1. Both filtrations and their arbitrary-pullback compatibility are now stated.
3. **R11/R12 swapped clauses.** The reconstruction is Theorem3.8(iii); the associated-graded Higgs comparison is (ii).
4. **T27 changed the space.** Example2.16(ii) is on the affinoid unit torus, not the entire analytification of G_m. The corrected statement includes m≥1.
5. **Missing inventory entries.** Added P19 for the Hodge–Tate local-system predicate of Remark2.5; P20 for the de Rham association predicate invoked in Theorem3.9(iv); and T28 for the unnumbered Higgs-complex computation of completed-structure-sheaf cohomology following(2.9). P19/P20 have three API obligations, three acceptance specifications and explicit consumers. P20 distinguishes Liu–Zhu's local smooth setting from Scholze Definition8.3's printed proper-smooth setting.
6. **Locators and supplier precision.** Replaced nonexistent §1.1/§4.3, corrected proof material in §2.3 and T01/T22/A01 formula references, and included KL2v1 Lemma5.6.6 for finite-projective quotient cochains. Corollary5.6.5 alone is scalar. [SW] is the 2014 Berkeley p-adic geometry lecture notes, not the separately authored Moduli of p-divisible groups article.
7. **Planned statuses.** P12's coherent-slice/filtered-colimit theorem is not literally an E2 theorem; E1 is added and the exact source contribution is missing. P17's Banach/procyclic package is not already R02.1/2. G01's analytic resolution is not SF.4's scheme/model package. Those three items are now missing.

The rewritten human report is synchronized with every item statement, API, test, proof route, source verdict and route decision. Original baseline/acquisition history is preserved and labelled historical, not passed off as fresh reading.

## Route audit

- **1: accept.** Corrected stage assignment: R06.1/2 and P8:local-rational own period foundations and predicates; the full P8 proper suffix is needed for T23, and R06.5 for G23 geometric representation applications. The early/local dependency cut is preserved.
- **2: accept.** A1 supplies the corrected analytic site; A2 imports the canonical geometry and coefficient descent, not a duplicate adic-space carrier. P13/P14/T18 are appropriate missing source statements, with perfectoid specialization hypotheses retained.
- **3: accept.** R0/R3 own smooth charts, analytic differentials, coherent modules and finite-projective descent. Algebraic Kähler differentials do not alone supply the completed analytic module. P18's source-qualified local-freeness proof remains an explicit gap, not a library claim.
- **4: accept.** After adding E1 and changing P12 to missing, the filtered-colimit/derived-limit contract is a source contribution to the shared derived-sheaf owner. Work on coherent slices and prove the actual limit hypotheses; do not assume arbitrary X is quasi-compact or every analytic topos replete.
- **5: accept.** DD.1 is the shared Koszul/derived-completion owner. The commuting-endomorphism specialization uses a polynomial-ring action, and A08 retains flat cohomology as a hypothesis. Reuse existing derived-category and Tor carriers.
- **6: reject.** R02.1/2 do not plan cyclotomic Tate–Sen normalized traces, norm estimates or arbitrary finite affinoid-module decompletion. P17 also combines site Cartan–Leray with Banach/procyclic and analytic comparison outside the stated compact/lattice scope. Split these inputs; use p-adic Hodge/geometric-tower suppliers for specialized estimates and the existing cohomology owner only for general carrier/comparison results.
- **7: accept.** CR.1 supplies the shared connection/stratification carrier. Its crystalline specialization requires quasi-nilpotence; this source contribution must not turn arbitrary analytic integrable connections into crystals. No new connection carrier is justified.
- **8: accept.** T6:comparison explicitly owns logarithmic RH, arithmetic rigidity and canonical local systems. Its ordinary empty-boundary prefix is the right home for Liu–Zhu, now including T28. The corrected A09/A11 and predicates preserve the Higgs/arithmetic distinction. Supplier closure remains an overall extraction gate, not a second RH roadmap.
- **9: reject.** SF.4 gives scheme/model/birational foundations, not the named rigid-analytic resolution theorem used in G01. Split algebraic compactification/spreading from rigid desingularization and connected-component propagation; assign the latter to an actual analytic owner with a precise source. G01 is no longer planned wholesale.
- **10: accept.** IG.0/1 own finite-cover Galois categories, inertia and specialization. G02–G04 are legitimate source additions with total finite étale normalization and p excluded in the tame argument. Purity and nonproper boundary/section avoidance remain named supplier obligations.
- **11: accept.** V4/V7/V8 match torus reciprocity, all-datum canonical models and the algebraic tower. Preserve source/target levels for Hecke maps and the separate special-point-in-each-component supplier; do not infer arbitrary-data canonical models from the abelian case alone.
- **12: reject.** RG2.0a constructs Weil restriction; RG2.5 constructs the integral dual/L-group. Neither plans the rational/real-split central quotient or adelic unit-lattice/discreteness conclusions G14/G15/G15C. Coordinate the torus algebra with the existing AdelicAlgebraicGroups central-quotient/reduction owner (AA.0–AA.3) and give precise statements instead of routing to unrelated dual groups.
- **13: accept.** BG0/BG2:uniformization are the correct reductive-isocrystal and bundle-classification owners. G21/G22 must use G^c for the given tensor functor unless an additional G lift is supplied (E10). Corrected [SW] provenance does not pretend its unread classification proof is closed.
- **14: accept.** Reuse the existing HodgeStructuresPartII candidate and its Landesman–Litt/Esnault–Groechenig briefs. A ringed-differential-site Higgs/λ-connection prefix can serve complex, crystalline and analytic consumers without making p-adic RH depend on complex Simpson. This extends, not duplicates, the upstream fibrewise Hodge roadmap.
- **15: reject.** The geometric-tower Part II direction is justified relative to PG.0–PG.7, but the current brief is not yet a safe implementation contract: KL perfect/imperfect rings, weak/local decompletion, finite-projective quotient cochains and theta specialization remain bundled; the original Tate–Sen import was invalid. T06 now cites Lemma5.6.6, but exact coefficient/radius/strictness hypotheses and supplier DAG still need extraction, plus the v1/current-version comparison. Keep this candidate, revise its detailed brief before creating its design job.

Read all cited stage descriptions and the full relevant p-adic Hodge, geometric-tower parent and comparison-owner READMEs. Read upstream AdicSpaces and HodgeStructures completely for ownership/density comparison. Read the existing Landesman–Litt and Esnault–Groechenig HodgeStructuresPartII briefs in full. The candidate is reused; no competing Hodge/connection or RH owner is proposed.

The rejected central-torus route is especially concrete: RG2.0a is Weil restriction and RG2.5 is the integral dual/L-group. Native AdelicAlgebraicGroups AA.1–AA.3 already owns adelic points, character/central quotients and reduction. That is the direction to coordinate, not a dual-group stage.

## Source findings

All inherited E01–E12 were checked in the complete final-arXiv source. The TeX was independently checked at the ambiguous displayed formulas and wording. Each has a per-entry verdict naming this review. E13 is new in this review.

- E01 confirmed: the binomial primitive needs the r+1 term; r=0 is already a counterexample to the printed upper limit.
- E02 confirmed only the theta target. Liu–Zhu already uses the completed tensor required by Scholze's corrigendum.
- E03 confirmed: the closed-embedding polynomial substitution must kill the source variables beyond m.
- E04 confirmed: truncation length and cohomology degree need independent indices.
- E05 confirmed: the two pullback formulas require f:Y→X. Theorem3.8 is on PDF23.
- E06 confirmed as a false quantified Lemma3.10, not a refutation of rigidity. With k=Q3 and χ(γ)=1+3^(m+1), a nonzero class of ζ_(3^(m+1)) in K/k_m is fixed. BC TS3 has the opposite bound, checked visually in the original. A selected generator supplies the intended kind of input; GAP04 still requires the finite-module norm argument.
- E07 confirmed narrowly: a disconnected frame torsor has a total quotient algebra, not one fraction field. A full GL_n torsor is not itself invalid.
- **E08 rejected.** The source does not say neighborhood basis or fundamental system. Its congruence kernels really are open identity neighborhoods without faithfulness. Preserve the effective-image clarification as exposition, not as a confirmed error.
- E09 confirmed: the Betti realization is singular homology, not the de Rham vector bundle.
- E10 confirmed only an omitted G-level lifting input in the ancillary remark. The supplied tensor functor has Rep(G^c) domain; this does not prove that an additional lift is impossible.
- E11 confirmed only a notation slip: restrict the inverse-limit reciprocity map, not the finite quotient map to its kernel.
- E12 confirmed: the rank-one tame argument must also exclude p from the surviving residue characteristics.
- **E13 confirmed.** The second Higgs-complex arrow is the exterior extension of θ, not curvature θ∧θ. For θ(e₂)=e₁dx, θ(e₁)=0, curvature vanishes but d_θ(e₂⊗dy)=e₁dx∧dy does not. The TeX has the same arrow label, so this is not OCR corruption. The intended comparison remains intact.

There are12 confirmed entries and1 rejected entry. The mathematical corrections are confined to arXiv v3. No finding is asserted to survive in the unavailable journal version. No author contact was made.

## Reading and correction search

- [Liu–Zhu arXiv v3](https://arxiv.org/abs/1602.06282v3): all35pages, proofs and bibliography; PDF SHA256 `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`. The author TeX was additionally checked.
- [Scholze corrigendum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf): all3pages. [Original paper](https://arxiv.org/abs/1205.3463): Definitions7.4–7.5 and8.3, Lemma8.6/proof and Lemma8.7 statement; not the entire paper.
- [Berger–Colmez](https://www.numdam.org/item/AST_2008__319__303_0.pdf): printed309–310 and314–315; TS3 inspected as a page image.
- [KL2v1](https://arxiv.org/abs/1602.06899v1): definitions/analytic comparison pp20–22; towers and imperfect-period definitions pp94–96; strict-cochain results pp109–110; (φ,Γ) definitions and Theorem5.7.4/proof pp111–113; toric sections pp130–135. General recursive dependencies and current-version collation remain open.
- [Conrad](https://math.stanford.edu/~conrad/papers/locchar.pdf): PropositionB.4(i), including its full proof, printed35–36. Arithmetic-Artin normalization is retained; part(ii)'s Frobenius formula is not imported.
- [Publisher](https://link.springer.com/article/10.1007/s00222-016-0671-7) metadata/bibliography and arXiv version history checked. Targeted title/identifier+erratum/correction and Higgs-cohomology searches found no applicable correction. Liu's author page timed out and Zhu's old homepage was unavailable on this independent attempt; earlier workers' successful-page/Crossref evidence remains attributed history. This bounded search does not prove novelty.

## Library and validation evidence

Independently opened all29 cited declarations in the actual pinned trees:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
All29 file hashes match the original evidence. Kept16 narrow library credits; no carrier was promoted to an analytic theorem.

Read reviewed coverage rows at the available exact keys: R02.1/2, SF.4, IG.0/1, V4/V7/V8, BG0/BG2, E2 and upstream ProfiniteCohomology Layer1. Several newer stages have no exact row. Direct statement and owner searches, not audit-key absence, determine those statuses. Searches across both libraries and native atlas did not find the specialized missing Higgs/RH/decompletion/rigidity results.

Checks passed:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIU-ZHU-17.result.json`.
- 55 repository tests: check_paper, source_issues, check_errata, errata, papers_queue and intake.
- Scratch-only checks:132 unique items;103 singly routed missing items; all13 source verdicts; acyclic132-node internal dependency graph; API/test/use coverage for every definition/construction;29 pinned hashes; exact corrected formula/locator/status assertions.
- 273 exact rational binomial-primitive checks;18 cyclotomic congruence/degree checks; a rank-two nonzero Higgs differential;4 rank-one bad-prime cases; disconnected product-ring and nonflat two-term-specialization diagnostics.
- Five-file intake/path validation is recorded in the handoff after its creation.

These finite diagnostics support the stated corrections; they do not prove analytic descent, Banach cohomology or global comparison. No Lean file was supplied or compiled.

## Resume conditions for the extraction

1. Split and reroute6/9/12 with precise supplier statements; revise15's KL coefficient/radius/strictness DAG without a fictitious Tate–Sen import.
2. Close GAP02–GAP06 declaration/hypothesis coverage, especially finite-module decompletion, singular connectedness propagation, tame specialization and the actual [SW] classification.
3. Collate the version of record if it becomes publicly accessible; do not erase the v3-only qualifier.
4. Preserve the corrected A09/A11, added P19/P20/T28 and rejected E08 while revising. Re-run schema, DAG and route tests.

This completes the independent review, not the requested revision of every supplier proof.
