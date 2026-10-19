# REV-PhiGammaModulesAndIwasawaCohomology

Independent review of `BP-PhiGammaModulesAndIwasawaCohomology` (Codex, session codex-leYaii, PR #10455). Reviewer: Claude, session claude-3oe87N, 19 October 2026. Issue #472.

**Verdict: accepted, with corrections.** The packet's `review` object lists a verdict for every node.

## Counts

| | Before | After |
| --- | ---: | ---: |
| Nodes | 98 | 98 (none added or retired) |
| Kinds | 8 def, 30 constr, 43 thm, 9 comp, 8 lemma | 8 def, 26 constr, 39 thm, 17 comp, 8 lemma |
| API items / named examples | 114 / 114 | 103 / 102 |
| Planets | 34 | 26 |
| Imports | 29 | 40 |
| Requests | 12 | 10 |
| Gaps | 14 | 12 |
| Source issues | 1 | 2 |
| Node verdicts | | 49 verified, 49 corrected |

Checks: `check_blueprint.py` with the pinned index gives 0 errors and 0 warnings. The in-memory `merge_blueprints` raises nothing and skips no links. No node-level cycle passes through PG across all packets. `lean-check` exits 0 with only `declaration uses 'sorry'` warnings; the suggested file is unchanged. `check_sorry_data.py` passes.

## Main finding: the plan re-planned what lower tiers now own

PG is outside the 94. Under the tier order of 2026-10-09, PadicHodgeTheory (tier 13; TauCetiRoadmap #1062) and FiniteFlatGroupsAndIntegralPadicHodgeTheory (tier 10) lie below it. The PadicHodgeTheory package (PKG-PadicHodgeTheory~codex, 2026-10-16, "Moves down and outgoing rewires") moved PG.0 into its §§1.4–1.5 and 4.1, PG.1–PG.2 into §§4.2–4.3, PG.3 into §4.5 and PG.6 into §4.4, and told PG to import them.

The accepted `PadicHodgeTheory.json` packet already states this material as atlas nodes with no PG prerequisite:

- P7/cyclotomic-field-of-norms-interface
- P7/phi-gamma-module-interface
- P7/etale-realization-and-overconvergence
- P7/herr-complex-interface
- P7/plan/robba-ring-of-p-adic-field
- P7/plan/robba-realisation-comparison
- P7/plan/wach-dcris-comparison
- P8/relative-local-systems-and-frobenius-modules
- P8/relative-frobenius-cohomology-comparison

The FiniteFlat packet has R07.4/etale-phi-modules-cohen-ring and R07.4/etale-phi-modules-with-coefficients.

The BP read RS-26 (September) as giving PG ownership, and wrote that the P7 interfaces should point to PG. That is the wrong direction once tiers apply (WORKERS.md, "Upstream tiers"; PROTOCOL §§3, 15).

**Correction.** All ids are kept, because PadicHodgeRegulators, PadicLocalLanglandsForGL2Qp and the PadicHodgeTheory--P7 packet cite PG.

- **Comparison receipts.** These nine nodes now state the owner's result, cite the owner node and say only how PG uses it or what it adds:
  - PG.0/field-of-norms
  - PG.0/cyclotomic-coefficients (adds the Kedlaya–Liu all-component comparison)
  - PG.1/fontaine-D, PG.1/fontaine-V and PG.1/fontaine-equivalence
  - PG.1/perfectoid-integral-local-systems
  - PG.1/etale-phi-cohomology
  - PG.3/herr-tate-duality (adds the residue model and the constant C_p)
  - PG.6/wach-dcris
- **Narrowed nodes.** These twelve nodes are cut down to what PG adds, with the owner as a prerequisite:
  - PG.0/coefficient-actions: relative annuli over affinoid algebras.
  - PG.0/etale-phi-module: integral and extended-ring variants.
  - PG.1/torsion-rational-compatibility: torsion and change of field.
  - PG.1/pure-equivalence: the (c,d)-pure clause.
  - PG.2/cherbonnier-colmez: integral lattices.
  - PG.2/radius-models: arbitrary Frobenius modules.
  - PG.2/etale-tilde-equivalence: extended rings.
  - PG.2/period-sheaf-equivalences: Γ-equivariant descent over K.
  - PG.3/arithmetic-herr, PG.3/galois-herr-comparison, PG.3/herr-cup and PG.3/herr-field-maps: affinoid, integral and cochain-level clauses.
- **Owner closures.** Before citing each owner node I computed its prerequisite closure over all packets; none contains a PG id.
- **Planets.** Eight planets that named owner results were removed: Field of norms, Cyclotomic coefficients, Étale Frobenius lattices, Fontaine invariants functor, Fontaine equivalence, Cherbonnier–Colmez theorem, Étale Robba equivalence and Wach crystalline comparison. Each owner packet should carry them.
- **Gaps.** G1 (APF norm field) and G4 (perfectoid approximation) are dropped, because their content now sits with the owners. G2 is narrowed to integral overconvergent lattices and G9 to the residue constant C_p.
- **Coverage.** The `remaining` lists of PG.0–PG.3 and PG.6 name the owners.

## Other corrections

**Locators (28).** A scripted header sweep over the twelve page-marked PDFs, with every miss read by hand, found:

- **KPX v3, §2.3.** Lemma 2.3.5, not "Proposition 2.3.5", and it is Shapiro's lemma. PG.3/arithmetic-herr now cites Notation 2.3.1 and Definition 2.3.3 instead; Lemma 2.3.5 was added to PG.3/herr-field-maps.
- **KPX v3, §§3.1 and 4.2–4.4.**
  - Corollary 3.1.3 and Corollary 4.4.11, not a Lemma or a Theorem.
  - §4.2 is on pp.36–38: Definition 4.2.2, Proposition 4.2.3 and Lemma 4.2.5 on p.36.
  - Theorem 4.4.3 is on p.42.
  - The four ψ-complex nodes had no page.
- **CC 1998.** Théorème III.1.1 is on p.16, not p.15.
- **KL I.** 1.5.1 is a Convention, and Definition 1.5.4 is on p.24.
- **LLZ.** There is no Definition 3.1; the 1−φ map is in the §3A paragraph before Remark 3.1, p.1116. Lemma 1.7 is on p.1103.
- **BHS.** The Herr complex is (3.10) on p.342. Definition 3.3.2 is on p.342.
- **KPX §4.4.** Theorem 4.4.4 is a Remark.

**Statements re-read against the sources.** They are correct as planned:

- KPX: Definition 2.3.3 differentials and generator change, Ψ_M, the cup formula of Definition 2.3.10, Theorems 2.3.11 and 3.1.1, Propositions 4.2.3 and 4.3.8, Theorems 4.4.5–4.4.6 (amplitude [0,2]), Theorem 4.4.8, Propositions 6.2.8 and 6.2.9, Theorem 6.2.14, Corollary 6.3.10 (connected components irreducible) and Theorem 6.3.13.
- BHS (3.10)–(3.13). The sign comparison −1 in degree two holds.
- KL I Lemma 1.5.2, §3.2 and Definition 8.5.7, and the KL II Appendix A errata (p.189).
- Pottharst Theorem 2.8 and Lemma 2.9, and the Berger 2004 Wach statements.
- The numeric tests of PG.3–PG.6 were recomputed.

**Sources added.**
- **Cherbonnier–Colmez 1999** (author PDF, sha256 `d8f422d1…`). Théorème II.1.3 (p.12, after Fontaine) is the primary source of D(T)^{ψ=1}≅H¹_Iw, which PG.5 lacked; G10 is updated accordingly.
- **Berger's errata** (created 13 October 2026).

**Source issues.**
- E1 (KPX Definition 2.2.2 orientation) is **confirmed**: Notation 2.2.3 and the ψ formula use the corrected direction.
- **New E2.** Berger 2004 Definition III.4.1 needs B_F⊗N étale in the rational case. Berger's own erratum, §2, p.3, says so, and PadicHodgeTheory/E10 records it. PG.6/wach-module now includes the condition.

**Requests.** The PadicHodgeRegulators:L1 stage request is replaced by its exact nodes, L1/bloch-kato-subgroups and L1/bloch-kato-exponential (im exp = H¹_e). The PerfectoidSpaces:P3 request and three P3 imports are dropped as unused. The L0a request now says that the Z_p^× case is upstream PadicMeasuresIwasawaAlgebras §3a.1, on TauCetiRoadmap main, and that the O_K^× and Γ_K character spaces belong to LocallyAnalyticDistributions L3. All 26 identical import `need` sentences were replaced by the specific use.

**Upstream notes.** Two were corrected:
- The note on the RS-26 direction.
- The claim that PadicMeasuresIwasawaAlgebras is absent upstream. It is merged on TauCetiRoadmap main; the planner's local checkout was a PR branch.

One note was added on LocalGaloisDeformationRings §0.4.

**Baseline.** All twelve declarations exist at the pins. The cited source lines are 307, 577 and 457, and each statement provides what its citing nodes use.

**Reader.** The reader was regenerated from the corrected packet, after the renderer reproduced all 98 HEAD node blocks, gaps, requests, the routed table and the references byte for byte. Its ownership section, intro and stage intros were rewritten. It was then escaped for `src/markdown.js`: the HEAD reader rendered 79 spurious emphasis spans (`Γ_K…_K`) and 4 accidental links (`[s,r](π_K)`); now there are none, and the one intended italic title remains.

## Questions for the orchestrator (packet `restructure` entries 2–4)

1. **PadicHodgeTheory has two accepted decompositions.**
   - The legacy atlas stage `PadicHodgeTheory:P7` still requires PG.3 and PG.6.
   - `PadicHodgeTheory--P7.json` cites the bare stages PG.0–PG.3, PG.5 and PG.6 about forty times.
   - It also reuses ids from `PadicHodgeTheory.json` with different statements: the --P7 version of `P7/b-pair-robba-equivalence` cites PG.2.
   PG now cites the `PadicHodgeTheory.json` nodes, so the stage graph has P7↔PG.3 and P7↔PG.6 cycles until those upward requires are dropped. The PadicHodgeTheory package already drops them. Please choose the decomposition, drop the P7 → PG requires and keep one node per id.
2. **Upstream-only owners.** The PadicHodgeTheory package §4.4 states Wach existence, height and reconstruction. LocalGaloisDeformationRings §0.4 (#923) states Herr cohomology over finite local coefficient algebras with Ext, base change and duality. Neither atlas packet has these nodes yet: the PHT Wach node imports Wach modules from a bare FiniteFlat R07.4 stage that does not state Berger's theorem. When they exist, PG.6/wach-module, /wach-existence, /wach-height, /wach-reconstruction and PG.3/herr-ext should become receipts.
3. **Kedlaya–Liu Witt-vector descent over perfect F_p-algebras** (PG.1/asw-*, /frobenius-idempotents, /unipotent-lang) is used inside the proofs of PadicHodgeTheory P8 without a prerequisite node; it probably belongs there. The (c,d)-pure local systems are also stated by VectorBundlesAndIsocrystals VB4, which is outside the 94 like PG. These ownership calls are left to you.
