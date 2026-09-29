# REV-PAPER-LAWRENCE-VENKATESH-20: review of the extraction of Lawrence–Venkatesh, *Diophantine problems and p-adic period mappings*

**Verdict: accept.** Both routes are accepted and the three recorded mistakes are confirmed. The published text, which the extraction could not find, turns out to be publicly readable; it was collated at all three mistakes, and all persist. The review also links the extraction to the 28 further mistakes the atlas already records for this paper, and closes the `published-version` gap.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #2162 (PR #4043). It has 67 items (3 library, 41 planned, 23 missing), 2 routes and 3 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

## Sources

- **arXiv v3** ([1807.02721v3](https://arxiv.org/abs/1807.02721), 76 pp.). The SHA-256 `e3013516…` matches the record.
- **The published article**, Invent. Math. 221 (2020), 893–999, in the journal PDF posted publicly by BIMSA: <https://bimsa.net/doc/publication/2578.pdf>, SHA-256 `588e450a…`, 107 pp. It carries the Springer imprint and DOI. The roadmap errata job had already used this copy for `research/blueprint/errata/MordellLawrenceVenkatesh.json`.
- **Correction search.** Crossref records no update relation, and arXiv lists no version after v3.

**What I read.** Line by line: §§2–3 and §5 (pp. 8–20 and 25–28), §7.2, §10.1–10.2 (pp. 55–58) and §12. That includes the counting in the proof of Theorem 5.4, Lemma 10.3's log-concavity argument and the variance (10.9); the last I checked on the page image, because the text layer is ambiguous there. For §§6–9 and §11, I read the statement of every numbered result, plus the proof of Lemma 6.4, which supports the item's "indeed r ≥ 5", and compared each with its item. I did not re-read §1 or §4. Every statement I compared matches its item.

## Statuses: all hold

- **Library (3).** `NumberField.finite_of_discr_bdd`, `Nat.forall_exists_prime_gt_and_eq_mod` and `Module.Grassmannian` resolve at Mathlib 082e2d3.
- **Planned (41).** They cite MordellLawrenceVenkatesh LV.0–LV.11, a roadmap with a written packet (`research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`) built on this paper's curve case, and LogicAndDefinabilityInNumberTheory LD.6 for Bakker–Tsimerman. The stage Targets cover them; for example, LV.11 is the assembly of Theorem 5.4, including the choice of q.
- **Missing (23).** These are the higher-dimensional half (§§9–12) plus Lemma 2.2, which nothing in the atlas or the libraries owns.

## Routes: both accepted

1. **Part II `MordellLawrenceVenkateshPartII`.** PAPER-LAWRENCE-SAWIN-25 proposed it (its route 1), with the same id, parent and area, and that extraction's review accepted it; DESIGN-MordellLawrenceVenkateshPartII is pending. The brief states Theorem 10.1 and Proposition 10.2 exactly.

   One inconsistency for the design job: the titles differ.
   - This extraction: "…Part II: non-density of integral points in higher dimension".
   - Lawrence–Sawin: "…Part II: the Shafarevich conjecture for hypersurfaces in abelian varieties".

   The design should choose one title covering both.
2. **Source → LV.1** for Lemma 2.2. LV.1's Targets list §§2.3–2.5 but not this elementary lemma.

## Mistakes in the paper: 3 of 3 confirmed on both versions

- **E1** (§10.2; arXiv p. 57, published p. 971). "(n+d choose d−1) − 1" should be (n+d choose d) − 1 ∼ d^n/n!. For n = 1 the printed value is d(d+1)/2 − 1 instead of d. (10.8) survives.
- **E2** (Lemma 12.1; arXiv p. 74, published pp. 995–996). g_N has frequencies up to 2N, but the proof sums and bounds only to N. With the full range, the tail is q^{(n/2+1)·2N}, so N must satisfy q^{(n/2+1)·2N} < b/3. With the printed N the argument gives only about 6b²/N.

  I rechecked the factor (2N+1)²/‖g_N‖² = 3(2N+1)/(8N²+8N+3) ≤ 3/(4N). The scope "a stated result" is right; the lemma is not used elsewhere.
- **E3** (§7.2; arXiv p. 35, published p. 941). "Pic⁰(C₁)^{G_q}" should read Aff(q), since G_q is undefined. I also rechecked the adjacent dimension (2g − 1)(q − 1)/2 by Riemann–Hurwitz.

## Mistakes already recorded elsewhere

`research/blueprint/errata/MordellLawrenceVenkatesh.json` records 28 mistakes in §§1–8 of this paper, MordellLawrenceVenkatesh/E1–E28. The roadmap's errata job found them, against both versions. They include:

- gaps in Lemmas 2.12, 6.3 and 8.6;
- an error in the proof of Lemma 6.1;
- the Figure 4 word in the proof of Lemma 8.8.

While reading the proof of Theorem 5.4, I independently found that "1 ⩽ i ⩽ 8" should be 1 ⩽ i ⩽ 7: the order of q_v modulo r is only assumed ≥ 8, so q_v⁸ ≡ 1 is possible. That is their E8.

To avoid duplicate entries in the register, I did not copy those findings here. A new gap, `roadmap-errata`, points to them from the affected items. The extraction's own E1–E3 (§§7.2, 10.2 and 12) are distinct from them.

## Checks

`scripts/check_paper.py` passes. The changes are:

- the three `review` verdicts, with published locators and searched entries;
- the published version in `sourceVersions` and `readSections`;
- the `published-version` gap closed and the `roadmap-errata` gap added;
- the report's section "Corrections by the independent review".
