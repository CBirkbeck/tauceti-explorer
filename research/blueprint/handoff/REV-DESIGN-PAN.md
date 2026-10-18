# REV-DESIGN-PAN handoff

Completed independent review by Codex, session `codex-J5ko7U`, on 2026-10-18. Refs #954. **Verdict: needs_changes. This review is complete; this is not a checkpoint.** No second job was claimed.

The packet's 94-entry `review.checked` ledger and [review report](../reviews/REV-DESIGN-PAN.md) contain the source checks, all corrections and explicit Banach counterexamples. The roadmap and reader are synchronized. Counts: 94 nodes (17 definitions, 13 constructions, 64 theorems); 179 API items; 123 tests; 33 planets; six confirmed baseline declarations; 16 requests; 12 gaps. Forty-six nodes were edited; no node was added or removed. Verdicts: 47 verified, 38 corrected, nine unverifiable. LA.0, LA.3, LA.9–LA.12 are partial with precise remaining lists; other stages are planned relative to their imports.

## Resume here for revision

1. **Geometric strictness, LA.3/LA.11.** Pan II arXiv v1 Lemma 3.4.3, pp. 28–29, fails in both directions. The report gives two counterexamples using `T:c₀→c₀`, `(Tx)_n=p^n x_n`. The actual geometric targets are not disproved. Replace this criterion for the restriction map, the sum of Čech images, the weight-χ maps, and truncated period filtration maps. Neither strictness of the individual embeddings nor preservation by analytic vectors proves that the sum is closed. Recheck every dependent Banach quotient, Hodge–Tate cohomology and Fontaine comparison after the repair.
2. **Relative module decompletion, LA.0.** Fill the precise P7 request for the relative Berger–Colmez Proposition 3.3.1 input. Finite-dimensional Sen modules and ring-level Tate–Sen axioms alone do not supply it.
3. **Drinfeld Higgs comparison, LA.9.** Supply the relative-Sen/Liu–Zhu compatibility deferred in footnote 3, p. 58, used for Theorem 5.3.6, pp. 63–64. Lubin–Tate's modular-curve reduction is insufficient. ET.6a assumes this compatibility, so do not import its conclusion circularly.
4. **Compact-support duality, LA.10.** Supply the finite-level topological Serre/de Rham compact-support duality of §5.6.9, p. 83, including transition maps and component actions; owner request is ProetaleCohomologyOfPAdicCurvesAndTowers. Use quasi-Stein geometry for the finite-level vanishing, not partial properness alone.
5. **Rank-one category O, LA.11.** Supply the translation/projective-cover calculation of §§6.5.8–6.5.13, pp. 113–115. The request is a LieHighestWeight Part II input; existing layers 7/9 do not include it. Exactness in the earlier step concerns the scalar central element and Galois invariants, not arbitrary full infinitesimal-character eigenspaces.
6. **Igusa comparison, LA.12.** Remark 7.3.9, pp. 123–124, sketches k=1 over `Q_p(μ_{p^N})`. RD.4 constant coefficients and RD.5 conditional finiteness do not supply the eigenspace comparison or congruence-relation B-action. Separate the k=1 obligation from any higher Sym coefficients.

Resolve the five `restructure` proposals through the orchestrator. In particular move Pan-specific ET.6a/CP.6 nodes down into LA.9/LA.11–12 or use a permitted bundle; never fix the lower-tier inversion by adding backward dependencies. Keep the Eisenstein extension in LA.5 and R31.4 as its original Emerton input. Repoint analytic-vector foundations to LocallyAnalyticRepresentationsOfLocalGroups once its design has stages. S5 infinite-level uniformization and P8 logarithmic lattice comparison remain precise existing requests. The special representation case is still a labelled conditional claim.

## Sources and validation

Pan I was checked in the open published text, DOI `10.1017/fmp.2022.1`; its E1 was also checked in arXiv v3. Pan II was checked in `https://arxiv.org/pdf/2209.06366v1`; **all its locators and findings are v1 only**. The Annals landing page was accessible, but the published PDF was not obtained. Collate against it when available. The packet records exact source hashes. E1 was confirmed, E2–E7 added and confirmed; the extraction's coefficient/subscript/Higgs/truncation findings were checked. No source passages are stored in these deliverables.

All six baseline declarations were read at the pins, and the current Tau Ceti/library roadmap state was checked, including the nine newer roadmaps. No upstream file was changed or built.

`check_blueprint.py` reports zero errors/warnings. The unchanged 260-line suggested Lean file elaborated through `lean-check` with exit zero and only the expected `sorry` warning at line 203. It contains elementary real-carrier models, not the unbuilt geometric theory. No background Lean process was left running. The scratch source downloads and working notes are disposable; every revision obligation is recorded here and in the report.
