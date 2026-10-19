# REV-DESIGN-ExceptionalThetaCorrespondencesForG2

Independent review of the new roadmap *Exceptional theta correspondences for G₂: minimal representations, Howe duality and theta dichotomy* (DESIGN-ExceptionalThetaCorrespondencesForG2, issue #3435, PR #10607, written by Codex session codex-0WOOFH). Reviewer: Claude, session claude-9wQhl1, issue #3527, 2026-10-19.

**Verdict: accepted with corrections.** The plan is a careful, faithful target-level reading of Gan–Savin's Howe-duality paper and the parts of their G₂ local Langlands paper routed to it. The review corrected one duplication with an upstream supplier, rewrote every source `match` (each had been a verbatim copy of its node's statement), made all sixteen supplier requests precise against the suppliers' pull-request heads, and repaired several locators, the unit tests and the roadmap definition. No node was removed and none was added.

## Files reviewed and changed

- `research/blueprint/packets/ExceptionalThetaCorrespondencesForG2.json`: corrected in place; `review` object added.
- `research/blueprint/roadmaps/ExceptionalThetaCorrespondencesForG2.json`: self-prerequisite removed; stage `requires` recomputed from node prerequisites (EX.6 no longer requires MP.2); EX.6 description updated; source read-sections synchronised.
- `research/blueprint/suggested/ExceptionalThetaCorrespondencesForG2.lean`: names aligned with the packet; three API declarations added; every test labelled. It elaborates.
- `research/blueprint/readmes/ExceptionalThetaCorrespondencesForG2.md`: node sections regenerated from the corrected packet with the design's own template (its renderer was first checked to reproduce the original stage text exactly); boundaries, baseline, supplier, source-mistake and source sections rewritten.

## Counts

| | Before | After |
|---|---|---|
| Nodes (definition / construction / theorem) | 96 (9 / 5 / 82) | 96 (9 / 5 / 82) |
| API items | 44 | 52 |
| Unit tests (with a valid `kind`) | 43 (0) | 44 (44) |
| Planets | 40 | 39 |
| Baseline declarations | 4 | 5 |
| Requests / gaps | 16 / 14 | 16 / 14 |
| Source entries (sourceId, locator) | 96 | 127 |
| `check_blueprint.py` errors / warnings | 0 / 0 | 0 / 0 |
| Stray emphasis spans in the reader (port of `src/markdown.js`) | 24 | 0 |

## What was checked

**Sources.** The recorded versions were fetched into scratch and their SHA-256 digests match the packet: Gan–Savin arXiv:2102.00372v1 (GS), the published Forum Math. Pi LLC paper (LL), Savin's appendix to Harris–Khare–Thorne (HKT), Gross–Savin 1998 (GrS), Hanzer–Savin 2020 (HS), Savin–Weissman v2 (SW), Savin 1999 (Sav), Magaard–Savin (MS), Gan–Savin 2004 (GS04) and the Gan–Gurevich preprint (GG). Prasad 1993 could not be fetched (the author page did not respond); the one node citing it relies on GS's citation, and this is recorded in its source entry. Every locator was located by a retrieval sweep (three Haiku agents, quotes only), and the reviewer read GS §§2–9, 11, 13 and 15, the cited passages of the other sources, and every flagged row. A Sonnet agent then cross-checked each rewritten match against the page it cites (see the end of this report).

The statements are faithful: the EX.1 reducibility tables match GS Propositions 3.1–3.3 and 10.1–10.4 with the extractions' confirmed corrections applied, the EX.3 Jacquet filtrations match Propositions 13.1–13.7, and the dichotomy, uniqueness and lift-table nodes match §§6–8, 12 and 14–15. Spot computations by the reviewer:

- The radical weights 2ρ_P = 3(3α+2β) and 2ρ_Q = 5(2α+β), the centre of U and the Heisenberg quotient U/Z(U), from the G₂ root system.
- The Weyl-invariant form on PGSp₆ characters: the third simple reflection (s₁, s₂, s₃) ↦ (s₁+s₂+s₃, −s₃, −s₂) preserves Σsᵢ² + c(Σsᵢ)² only for c = 1, so GS's printed −¼ is wrong and the node's form is right. Reflecting the coroot (1, −1, 0) gives (1, 1, 2), which confirms the third family of hyperplanes sᵢ + Σsⱼ = 0.
- Hanzer–Savin Theorem 6.4 with r = 3 and d = 8 gives poles 1, 5, 9. Their remark after Corollary 4.6 puts the minimal representation at 1 + (r−2)d/2 = 5, as the node says.
- GS Theorem 7.2: injectivity on nonzero lifts holds for all p, and only the nonvanishing of every lift needs p ≠ 3; the node is right.
- The Lean tests: diag(2, ½, 1) acting on the vector entries of a Zorn vector matrix (contragrediently on the second vector) is an automorphism, and the five subspace tests are correctly null or non-null.

**Matches and locators.** Every `match` repeated its node's statement word for word, so none said what the source states. All 96 were rewritten in the reviewer's own words. Locators that carried a second source under the first one's `sourceId` were split into separate entries: Sav, GS04, MS and Pra inside GS entries; GrS inside an HKT entry; LL inside GS entries for EX.0/complex-parameters and component-groups. Duplicated prefixes such as "LL LL" and "GrS GrS" were removed. Locator errors fixed:

- GrS Proposition 4.5 and its proof are on p. 200, not p. 202, and Gross–Savin's chapters are numbered 5 and 6, not V.
- GS §6.4 is on pp. 20–21.
- EX.7/fourier-jacobi-uniqueness cited a nonexistent Lemma 11.2; the result is Lemma 11.3, pp. 34–36.
- The Steinberg assignment θ(St±) is in the proof of Theorem 8.5(i), p. 28, not in Proposition 8.4.
- GrS Chapter 6 Lemma 2.9 (p. 213), which GS cites in Lemma 6.4, was added to EX.4/cubic-minimal-coefficients.
- GS Proposition 11.1 was added to EX.6/minimal-whittaker-fibers.
- Hanzer–Savin §4, the proof of their Proposition 6.3 and LL §10.2 were added to EX.10/global-minimal-residue.

**Baseline.** `TauCeti.Octonion`, `.norm_mul`, `.mul_self` and `.finrank_imaginary` were read in `TauCeti/Algebra/Octonion/Basic.lean` at the pinned commit and confirmed. `finrank_imaginary` holds over every commutative ring with the strong rank condition, not just in characteristic zero; its `provides` text was corrected. `tauceti:TauCeti.AlbertAlgebra` (`TauCeti/Algebra/AlbertAlgebra.lean`: the split Albert algebra without its Jordan identity) is at the pin and was added as the carrier of the split global pair in EX.10/global-exceptional-pair. No citation was removed.

**Closure and suppliers.** Every supplier roadmap is now an open TauCetiRoadmap pull request: SR and RG2 #785, MP #1063, ML #1180, AL #924, AF #1037, AS #925 and ET #999. Their READMEs were read at the current heads, and the 37 atlas supplier nodes cited by id were checked against what the nodes need.

- **Duplication fixed.** MetaplecticAutomorphicForms §3.38a (PR #1063) owns the restriction of the Mp₂ × SO₇ oscillator to Mp₂ × G₂, its Jacquet sequence and its cuspidal injectivity (Gan–Gurevich Proposition 8.1 and Theorem 9.1(c,d)). EX.6/mixed-mp2-g2-module planned the same module. It now states only Gan–Gurevich Theorem 9.1(d), that the lift is a nongeneric supercuspidal with Fourier–Jacobi model σ∨, and imports the module through `MetaplecticAutomorphicForms:MP.3`. Its proof follows Gan–Gurevich §9.5, and its title and planet changed. **This changes the node's mathematics.** The atlas MP packet has no node for §3.38a yet (see the questions below). EX.8/rho-supercuspidal-family now also cites MP.3 for injectivity. MP §§3.37–3.40 (rank-one constituents, GL₂–GSO₄, minimal orthogonal lift, division ternary lift) were already imported correctly.
- **Requests made precise.** Each of the sixteen requests now says what its supplier states as it stands at its pull-request head, and what is requested from an undesigned Part II. Four of the original requests asked suppliers for results their READMEs do not contain:
  - SR.2, SR.2a and SR.3 (pull request #785 has Whittaker multiplicity one only for GL₂, and no Plancherel theory) are requested from a *Smooth representations of local groups, Part II*: Whittaker multiplicity one for quasi-split groups, Prasad's GL₃ ↓ GL₂ theorem, the Mœglin–Waldspurger comparison with Varma's p = 2 extension, the Steinberg restriction to a maximal unipotent, the Harish-Chandra–Silberger criterion, Gan–Gurevich Lemma 9.4 and GS Lemma 11.6.
  - MP.3: the Saito–Kurokawa τ_ρ and Howe–Li low rank.
  - AL.4 (unramified factors only): the Langlands–Shahidi spin factor of PGSp₆.
  - AF.1: Salamanca-Riba's range theorem.
  - Four `part-ii` restructure entries record these Part IIs.
- **τ_ρ route fixed.** ModularityAndLanglandsExtensions §3.5 states the Gan–Takeda correspondence with part (vi): the Plancherel measures of a nongeneric supercuspidal match its parameter. Together with the Harish-Chandra–Silberger criterion this settles the nongeneric case of EX.1/pgsp-p1 that GS justify by generic theory (source issue E11). The proof steps, the request and gap G4 now say so, and the ML request drops its conditional "extend the supplier if needed".
- The SR packet's `part-ii` nodes (Schwartz Ext comparison, discrete-series projectivity) cited by EX.4 are not in pull request #785. They are the SR packet's own accepted Part II nodes, so citing them by atlas id stands.
- SmoothRepresentationsOfLocalGroupsPartII (accepted) owns the Fell-topology results of LL Appendix B. This roadmap does not use them, and the reader now states that boundary.
- EX.2/jordan-freudenthal claimed an "existing" cubic Jordan structure for every J. LieHighestWeight Layer 8 has only the split octonions, the split Albert algebra and the exceptional Lie algebras, so the cubic norm structures of F, E, D⁺ and H₃(B) are now constructed in the node. The EX.10/global-exceptional-pair proof steps were corrected the same way.
- Other fixes:
  - A duplicate prerequisite was removed from EX.5/pgl3-explicit-lifts.
  - EX.1/pgsp-p1 gained the SR.3 stage prerequisite.
  - EX.5/pgl3-minus-supercuspidal now notes that self-dual supercuspidals of PGL₃ exist only for p = 2.
  - The roadmap listed itself among its prerequisites.

The prerequisite graph and the stage graph are acyclic, and every stage target is realised.

**Granularity, API, tests, planets.** The granularity is right for target level. No unit test had a `kind`; all 43 were given kinds and qualified names. The API items and tests of the two octonion definitions were renamed to the suggested-file declarations, and the Lean file's extra line test was added to the packet. EX.0/complex-parameters gained a compatibility item with LanglandsParameterStacks:LP1/weil-deligne-parameters. The planet "Triality Ext vanishing", a technical lemma, was removed, and the EX.6 planet was renamed to "Metaplectic lifts to G₂".

**Suggested Lean file.** Before and after the review it elaborates in the pinned build (`lean-check`), with placeholder-proof warnings only (17 before, 20 after: `IsOctonionAutomorphism.comp`, `.symm` and `octonionAut_ext` were added). The other twelve definitions and constructions have no carriers at the pins and remain targets of the roadmap document; the file's header says so.

**Mistakes in the sources.** The twenty `sourceIssues` consolidate the extractions' confirmed findings (PAPER-GAN-SAVIN-23/E1–E52, PAPER-GAN-SAVIN-23-B/E6, E10, E11). Each was checked at its locator and confirmed; the reasons are recorded in the packet. The reviewer independently re-derived E10, the invariant form, and checked E6's mislabelled third part of Theorem 7.2 on p. 23. No new mistake was found.

**Library audit.** Nothing in `data/library-coverage.json` or in the pinned libraries is planned as a node; octonion arithmetic and the Albert carrier are baseline citations.

**New roadmap.** The layers are ordered as a formaliser would build them, and the scope is honest: it covers the 87 + 25 routed items and leaves the G₂ local Langlands correspondence itself to the undesigned LocalLanglandsCorrespondenceForG2. All suppliers are now correct.

## Nodes

All 96 nodes are marked `corrected` in the packet's review, because each match was rewritten. For the substantive corrections (EX.6/mixed-mp2-g2-module, EX.1/pgsp-p1, EX.2/jordan-freudenthal, EX.10/global-exceptional-pair, EX.0/null-subspaces, EX.0/octonion-group and the locator fixes above), the per-node note says exactly what changed. No node was added or removed, and none is unverifiable; the single Prasad citation rests on GS's citation and is marked as such.

## Questions for the orchestrator

1. The Part II requests above have no owner yet. *Smooth representations of local groups, Part II* would also be the natural home of the SR packet's existing `part-ii` nodes; the SR packet's own restructure proposal already points that way.
2. The atlas packet `MetaplecticAutomorphicForms--MP.0` lacks a node for §3.38a, which PR #1063 has; this roadmap cites the stage `MetaplecticAutomorphicForms:MP.3` in the meantime (recorded in `upstreamNotes`).
3. Complex L-parameters and component groups (EX.0) are a general notion. The restructure entry proposes moving them to their most foundational owner, LanglandsParameterStacks LP1 in its complex-coefficient form, once one is planned.
4. Gaps G1–G14 remain as the design recorded them, with G4 and G13 updated. They become the follow-up work for these stages.

## Sonnet cross-check of the rewritten matches

After the corrections, a Sonnet agent compared each of the 127 rewritten source entries with the page it cites. It found no problem with 115 and could not check the Prasad entry, which has no text. It flagged twelve overstatements in the reviewer's own first rewrite. The reviewer checked each against the text and corrected all twelve:

- GS Proposition 3.1(i) gives only s = 1/2; the negative point is the node's addition.
- In GS Proposition 5.4 only the second and third pieces carry the multiplicity m_E.
- GS Proposition 14.2 uses the restricted metaplectic SL₂ × SO₇ Weil representation and cites Gan–Gurevich; it does not use that name for it.
- LL Main Theorem (vii) needs p ≠ 3.
- Magaard–Savin Theorem 1.1 gives the N-coinvariants as the quotient, for groups with commutative N.
- Gan–Savin 2004 (four entries):
  - Proposition 5 is a quotient statement, not a filtration.
  - §6 computes no coefficients, so that entry was dropped from EX.5/e6-coefficient-models.
  - The lifts used for the nongeneric self-dual representations are Theorem 11 (§8).
  - The supercuspidal lifts are left unidentified there (Theorem 21).
- Gross–Savin Lemma 3.4, in two entries, is an orbit-and-stabilizer statement whose case (4) Gan–Savin cite for the twisted Jacquet module.
- Hanzer–Savin do not identify which residue is minimal when d = 8. The node's s = 5 is now an explicit part of gap G13, and the locators of Hanzer–Savin §4 were corrected.

`check_blueprint.py` still reports no errors and no warnings, and the reader still lints clean.
