# Tensor displays and ordinary lifts — design handoff

Issue: #3355. Agent: Codex. Session: codex-kr62kA. Reading date: 19 October 2026.

The complete target-level planning pass is submitted for independent review. The packet is `complete`; this describes completion of the planning pass, not mathematical closure or implementation. TD.0, TD.1, TD.2, TD.3, TD.4, TD.5 and TD.6 are all `planned`. None is `closed`. Every implementation status is `unchecked`.

The deliverables share the canonical name FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII: the roadmap definition, blueprint packet, reader document and suggested Lean file. The packet contains 92 nodes: 14 definitions, 20 constructions, 5 lemmas, 41 theorems, 10 comparisons and 2 applications. It has 111 API items, 103 mathematical unit tests, 34 planets, 5 baseline declarations, 9 gaps and 7 supplier requests. Each definition and construction has uses, an API and at least three mathematical tests. No source passages or section-by-section source summaries are included.

## Scope and ownership

The six tensor-display briefs are merged here. The route ledger assigns every original item individually: Kisin–Zhou 25 (19), Zhu 17 (3), Kisin–Pappas–Zhou 26 (63), van Hoften 24 (6), Kisin 17 (36), and Kisin–Pappas 18 (52), totalling 179. Assignments include imported base results where appropriate; an imported item is not a second planned declaration.

The issue explicitly permits independent continuations to be split. The split ledger retains all original item IDs and source-brief ownership for:

- LubinTateFormalModulesAndQuasiCanonicalLifts: Burungale–Kobayashi–Ota 21 (12), Andreatta–Goren–Howard–Madapusi Pera 18 (19), and Fargues–Scholze 21 (2), totalling 33. The proposal preserves formal-module reciprocity, rank-one Breuil–Kisin realizations, Honda endomorphisms, quasi-canonical lifts and the Lubin–Tate boundary interface.
- FiniteFlatGroupsPartIIPeriodsOfDivisibleModules: Fargues–Fontaine 18 (153). The proposal preserves perfect-ring divisible modules, universal covers, connections and quasi-logarithms, universal extensions, period spaces and modification/vector-bundle comparisons.

These 186 items have not been given a completed blueprint in this submission. Their original route briefs remain the design inputs, identified by paper and item IDs in `splitRouteLedger`. Review should check the scope decision and forward these proposals to the maintainer.

The base roadmap's accepted packet and package, its handoffs, the reviewed library audit and the actual imported supplier statements were inspected. The audit has no entry for this new continuation. Current TauCetiRoadmap main and the current Tau Ceti library were inspected read-only, including the nine newer upstream roadmaps absent from the atlas snapshot. Current ReductiveGroups Part II already owns the algebraic lattice/fixer constructions used in KPZ26 §6. Their very-good display consequences are new here; the underlying lattice constructions are imported. General vector-bundle theory remains with AlgebraicVectorBundles.

At the prescribed pins, the statements read were WittVector, its Frobenius ring homomorphism, Verschiebung additive homomorphism, the Frobenius–Verschiebung identity, and DividedPowers. Their modules and full pinned commits are recorded in `baseline`. Searches in the pinned and current libraries found no display or tensor-deformation carrier to import. The suggested file therefore uses existing module, matrix, ideal and Witt carriers only.

## Mathematical conventions to preserve

Use p>2. Display and tensor comparisons are contravariant, and the Tate lattice is the linear dual Hom(T_pH,Z_p)=T_p(H*)⊗Z_p(−1). Fil¹ has rank dim H. The multiplicative and étale rank-one tests fix the convention.

Keep the smooth full integral tensor fixer distinct from its connected parahoric. Tensor torsors use the full fixer; Hoff's parahoric display and the explicit ordinary construction require the stated connectedness equality. A cutting family defines equality of group functors, not merely equality on geometric points.

The tilde functor is independent of a normal decomposition. Its four blocks are φ(A), pφ(B), φ₁(C), φ(D). Its map to Frobenius pullback has matrix diag(1,p), which can have a kernel on a torsion base. Construct the canonical first-order comparison through relative frames, never by uniqueness of its commuting square. First-order constancy is Ψ̄c=Ψ₀. In reflex-field applications reduce both sides from m²+pR to m²+π_ER.

Very-goodness is the additional infinitesimal tensor compatibility. Do not infer it from good embeddings or from naming a G-display. The versal theorem retains assumptions (A), (B), (C); the ordinary theorem uses a separate explicit central construction and does not assume (C). Its symmetries are rational self-quasi-isogenies, not integral automorphisms. The general basic-Levi application retains the M-valued filtration and corrected compatibility assumptions.

Whole-ring exactness of the arbitrary crystalline-lattice functor is not claimed: exactness is used on the punctured Breuil–Kisin spectrum. The hyperspecial explicit lift uses the stronger one-sided Frobenius factorization, with a compatible Hodge cocharacter. Specializing lattice matrices belong to the rational group, modulo its integral subgroup.

## Work required before closure

The gap records list exact consumers. Resolve these obligations, update direct prerequisites and coverage, and then obtain independent review:

1. **G1, local models.** Register the proposed local-model continuation and supply normality, flatness, good minuscule Hodge immersions, generic regularity, tangent spanning and central-torus specialization with the actual KPZ hypotheses. The routed name GeometricSatakeLocalModelsPartII has no registered stages here. Existing GS0 Witt geometry does not prove these results.
2. **G2, purity and components.** Supply punctured parahoric torsor extension/vanishing in the coefficient-ring range of Anschütz Proposition 10.3, the required patching theorem, and disconnected full-fixer component descent. The proposed ReductiveGroupsPartIIGrothendieckSerre is a new continuation candidate, not a supplied theorem. Preserve current upstream ReductiveGroups Part II unchanged.
3. **G3, normal-section and flatness criteria.** Extract the precise de Jong Proposition 7.3.6 and Raynaud–Gruson Theorem 4.1.2 inputs invoked by KP18 Corollary 3.2.11. Separate extension of integral tensor sections from flatness of their isomorphism scheme, with the actual completion and finite-presentation hypotheses.
4. **G4, integral Tannakian recognition.** Supply the Broshi-type theorem turning the exact faithful representation functor on the punctured spectrum into a torsor. Existing representability of a functor already known to be a torsor is insufficient.
5. **G5, relative periods.** Supply Faltings' relative p-divisible comparison after t inversion and the filtered Frobenius constants calculation for Kisin17 §1.1.15's normal coefficient rings and chosen generic-étale geometric cover. The source invokes Faltings at pp.114 and 119; that invocation was located, but those primary proofs were not read. CR.0 supplies the envelope carrier and CR.7 supplies evaluation interfaces, not this additional theorem.
6. **G6, admissible realization.** Extend the base R07.4/crystalline-01-is-bt statement from finite K/Q_p to the required finite extensions of W(k)[1/p] with perfect k, or supply the exact descent argument. Do not silently use its narrower statement over an algebraically closed residue field.
7. **G7, toral admissibility.** Obtain a freely readable primary proof, or a cleared copy, of the Rapoport–Zink Proposition 1.21 criterion invoked by Kisin17 p.32. No cleared copy was listed; no other copy was used. Check the inverse-cocharacter and Newton-average conventions, including all subobject inequalities. Wintenberger's torsor-class formula is not a replacement.
8. **G8, global realizations.** Assign the absolute-Hodge, de Rham and étale tensor-extension/comparison statements to a Shimura integral-model continuation. Current ShimuraVarieties V6's canonical-model inheritance does not establish them. This packet supplies only the p-divisible bridge.
9. **G9, general Levi application.** Establish the M-filtration and modern very-good compatibility in the nonordinary van Hoften application. The author version of Zhou explicitly assumes the filtration lift. The ordinary theorem alone does not remove these obligations.

TD.0 also retains verification of coherent normal-coordinate descent and the complete-local contravariant equivalence, with its admissible topology and duality signs. TD.1 retains verification of continuous PD inverse limits, the residual marking and first-order equation of the universal display, and convergence in the corrected p-adic lattice topology. These are explicit refinements in their coverage records, not claims of missing stages.

The seven requests are addressed to RG2.3; SF.1; SF.4; SF.0; CR.7; the base R07.4/crystalline-01-is-bt node; and GS0:Witt-geometry. Each states the exact extension or interface and its consumers. Existing fine nodes are used for Hartogs, smooth torsor lifting, Dieudonné evaluation, Grothendieck–Messing, ordinary Newton theory and σ-centralizers.

The original routing suggested higher PadicHodgeTheory/CohomologyComparisons suppliers for relative crystalline comparison. This plan moves that needed interface down to the existing lower crystalline coefficient direction, with G5 explicit. The Fontaine-envelope carrier remains CR.0's existing construction; TD.5 only evaluates it on the geometric cover. A higher comparison roadmap should import that interface from its lower owner when supplied.

## Sources and reading limits

The packet and reader bibliography give public URLs, editions, access dates, checksums and sections read for eleven primary sources. The reading concentrated on the target dependencies: KPZ26 §§5–6 and corrections in §7.3; KP18 §§3.1–3.3; Kisin17 §§1.1–1.2, the toral application and Errata; Kisin–Zhou author v2 §§3.2–3.4; Hoff's frame, display and deformation comparisons; Lau's perfect-ring and complete-local results; Zhu's framing; van Hoften's display and Levi interfaces; Anschütz's purity statement; Wintenberger's torsor formula and corollary; and Zhou author v2 §5.5.

Edition differences matter: Kisin–Zhou's ordinary theorem is Theorem 3.4.5 in the 7 October 2024 v2 read here. Lemma 3.4.3 is the central filtration input. Kisin17 locators use the author copy's pages, not the journal pagination. Zhou's author v2 §5.5 is not published §6.11. Wintenberger's frequently cited Corollary 4.5.3 is the unnumbered corollary following Proposition 4.5.3, pp.1331–1332. Source versions and hashes are recorded explicitly.

Nine source findings remain in `sourceIssues`, all paraphrased and awaiting independent verdicts. Their numbering retains E01–E04 and E06–E10. The Eisenstein p-unit scaling and Zhou citation-number reconciliation are editorial notes, not allegations of printed errors. The published KPZ26 corrections and Kisin17 errata control the corresponding target statements.

Missing primary proof extraction is explicit in G2–G7. No restricted source or book passage was copied. The two split directions were checked at the level of their original route briefs; they are not represented as primary-source-complete plans.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII.json` reports zero errors and zero warnings. The owned dependency graph is acyclic and has no forward layer prerequisites. All 179 in-scope route IDs and 186 split IDs were checked against the original briefs. Reader statements, APIs and tests are generated from the same authored target records as the packet.

The intake file check reports five files and zero problems. The suggested-file data-body check and staged whitespace check pass. Additional consistency checks verify scope agreement, every definition/construction's API and tests, reader agreement with all target statements and tests, source-version records, request reachability from each named consumer and the per-layer planet limit.

`lean-check research/blueprint/suggested/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII.lean` completed successfully at the pinned shared build, with thirteen declaration-uses-sorry warnings and no other warnings. The file has three light real-bodied definitions, no data defined by an admitted proof, and representative theorem and example signatures. Elaborating it validates this native-carrier fragment only; the heavy mathematics remains in the reader targets. No library build, language server or new Lake project was started.
