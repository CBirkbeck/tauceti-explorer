# REV-PAPER-BHATT-SCHOLZE-17 — review of the extraction of Bhatt–Scholze, "Projectivity of the Witt vector affine Grassmannian"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1301).
- **Authors:** Codex, session `codex-c83e7a`, and Claude Code, session `cc-442dc5` (#2124, which completed it). This reviewer
  took no part in either.

**What was read.**

- **The paper.** Invent. Math. 209 (2017), 329–423, doi:10.1007/s00222-016-0710-4. It was read, as the extraction read it, in
  its final arXiv version 1507.06490v3: 61 pages, with a SHA-256 matching the extraction's record. It was read in full, as
  page images, in seven ranges:
  - §§1–2 (pp. 1–9);
  - §3 (pp. 10–15);
  - §§4–5 (pp. 15–20);
  - §§6–7 (pp. 20–31);
  - §§8–10 (pp. 32–40);
  - §11 (pp. 40–54);
  - §12 and the bibliography (pp. 54–61).

  Every item was compared with the page. arXiv v1 and v2 were compared where recorded mistakes concern them.
- **The libraries.** All library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-SCHOLZE-17.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.1007/s00222-016-0710-4.

## 1. Items

- **Corrected fields (139):** 73 statements, 63 locators, 2 kinds and 1 name; eleven notes gained a correction. Examples:
  - 2.8 is a Proposition, not a Theorem.
  - Lemma 2.10's parts are (a) and (b).
  - The Lemma 3.4 locators cited (i)/(ii) instead of (ii)–(xii), and S3054 dropped "flat".
  - A1212 is Corollary 12.12, not Proposition 12.12.
  - G707 and G708 wrote "finitely presented" where Lemmas 7.7–7.8 say "finitely generated".
  - G814 cited Keel's "Corollary 1.9" for Theorem 1.9.
  - G907 now states Proposition 9.7 with k algebraically closed (E41).
- **Removed (7), not in the paper:**
  - L07–L10, L16 and L17 (tori, character and cocharacter lattices), which the paper never mentions.
  - G816 (Keel's Lemma 1.4), which it does not cite.
- **Added (104).** They are definitions, constructions and cited inputs the proofs use without an item. Examples:
  - Theorem 1.1 itself;
  - the Witt vector affine Grassmannian and Witt vectors of perfect rings;
  - the stability and descent facts of §2;
  - the perfectly finitely presented morphisms and approximation results of §3;
  - the cited inputs of Lemma 4.6 (Gabber's triangle, Raynaud–Gruson, formal existence);
  - the K-theory inputs of §5 (localization, K = G, de Jong's alterations);
  - the valuation-ring inputs of Theorem 6.13;
  - the Demazure recursion of §7;
  - Keel's Lemmas 1.7–1.8, the Greenberg realization and Zhu's inputs of §§8–9;
  - the Steinberg extension and the tame symbol of §10;
  - Definition 11.1, Theorem 11.2(3) and Remarks 11.3–11.5;
  - the black boxes of §11 (Carlsson, Mathew, Bhatt–Halpern-Leistner, Lurie, Voevodsky, Kunz);
  - the symmetric-monoidal and infinite-loop-space background of §12.

## 2. Statuses

- **Library.** Every remaining library declaration exists at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All eighteen routes are accepted; `PAPER-BHATT-SCHOLZE-17.review.json` gives a reason for each, based on each route's recorded
reason.

- **Route 17.** The arc/v-topology roadmap is a new roadmap shared, under the same title, with Bhatt–Mathew (2021),
  Česnavičius–Scholze (2024), Clausen–Mathew–Morrow (2021) and Guo–Reinecke (2024).
- **Route 18.** Its title already begins with the parent's atlas title. Its brief now names E52.
- **Source routes.** The corrections are on the items.
- **Prerequisites.** Rebuilt as 28 cited works, one per entry, each with its DOI or a stable link and the place the paper uses
  it.
  - The old entries bundled works and pointed at bibliography labels.
  - Zhu (2017), which the registry already has, is left out.

## 4. Mistakes

**The extraction's twenty-six.** All are confirmed. Nine are revised, as the independent checks upheld:

- **E2.** Example 2.3's "lift to X̃" first appears in v3; v1 and v2 read "X".
- **E3.** Its reason is corrected.
- **E12.** The quotation is the exact text.
- **E17.** The labels (a), (c), (d) refer to the proof's own observations, so the old correction was wrong.
- **E22.** Mathew v1's numbering is the one to use.
- **E23.** The v1 argument for Lemma 4.6 is also in v2. The blow-up of the vertex of the cone over an elliptic curve is a
  counterexample to its vanishing claim.
- **E24.** The failing step in v2's Remark 5.33 is confirmed, with Gabber's counterexample.
- **E14 and E16** are also revised.

**New: 30 (E27–E56).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 29 claims, 28 were
  confirmed and 1 reclassified. The verifiers found one more, E45: "Lemma 3.12" for Proposition 3.12 in Definition 11.1.

The main new ones:

- **E27.** Theorem 1.3 is stated for any proper surjective map. The body proves it only for perfectly finitely presented maps
  (Theorem 6.13). A proper surjective map that is not finitely presented shows this is a real restriction.
- **E28.** Proposition 3.12 fails in the cardinality-truncated Perf of Remark 3.3: the limit need not exist there. Every use
  in the paper has the limit already in Perf.
- **E41.** Proposition 9.7 cites Zhu, who assumes k algebraically closed. For a general perfect k the target is
  π₁(G)_{I_K}. Res_{K′/K} G_m with K′/K unramified quadratic is a counterexample. The only later use, for SL_n, is unaffected.
- **Gaps reaching a proof:**
  - E29: Lemma 4.6, where completeness is lost after Z is replaced by Z′;
  - E31: Corollary 5.6, which needs Ω finite projective;
  - E36: Theorem 6.13, which needs a reduced model;
  - E37: Lemma 7.7, finite projectivity of N;
  - E39: Theorem 8.3, the use of Keel's Lemma 1.8;
  - E42: Proposition 10.1, ampleness of L;
  - E47: the argument in Remark 11.13's footnote;
  - E52: Proposition 11.41, existence of the pushout Y′.
- **E50.** Remark 11.24 credits Mathew with the countably generated case, but he proves the countably presented one.
- **E54.** Construction 12.5 must require X_∅ ≅ 1. It affects nothing.

The rest are misprints.

Theorem 1.1 and the other main results stand.

## Questions for the orchestrator

1. **Earlier arXiv versions.** E2, E23 and E24 concern v1 or v2 (E2 was introduced in v3, and E23 and E24 are corrected in
   it). They are kept with their version locators. The register should record which version each concerns.
