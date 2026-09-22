# Handoff: PAPER-LIU-WANG-22

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1262).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.**

- arXiv 2012.15014v4 ("Refereed version", 10 August 2022, posted after publication) was read in full from its TeX source.
- The published text (Invent. Math. 230, pp. 851–932) is paywalled. Only its abstract, dates and section list were compared.
- The Publisher Correction (p. 933) corrects only the authors' affiliations.
- Locators give arXiv v4 pages.

**Deliverables:**

- `research/blueprint/papers/PAPER-LIU-WANG-22.result.json`: 66 items (7 planned, 59 missing), 13 prerequisites and 15 source issues. The routes are:
  - a Part II of KTheoryFiniteLocalFields (54 items);
  - a source route to RefinedTraceMethods RT.6 (4 items);
  - a source route to RT.1 (1 item);
  - a source route to KTheoryFiniteLocalFields L.5 listing 2 planned items.
- The report, `research/blueprint/papers/PAPER-LIU-WANG-22.md`.

## Judgement calls for the reviewer

**The Part II.** `KTheoryFiniteLocalFieldsPartIIDescentSpectralSequences`, area `ktheory`. The paper's method is planned nowhere in the atlas: descent along 𝕊_{W(k)} → 𝕊_{W(k)}[z], Hopf algebroids and comodule Ext, and the refined Nygaard filtration. L.5 plans the classical odd-p calculation and waits for a separate theorem at p = 2. The alternatives were:

- a source of L.5, which would mix two proofs of one theorem in one layer;
- a new roadmap, but the outputs are L-level theorems about O_K.

**Planned items:**

- Theorem 8.20 (odd p) and Corollary 5.19 (THH of O_K) are marked planned in L.5, because L.5's scope covers them.
- Theorem 8.21 (p = 2) is missing.
- If L.5 is read as committing to the Hesselholt–Madsen proof only, move Theorem 8.20 to the Part II.

**The §2 inputs are split between RT.6 and the Part II.**

- Lemma 2.3, Propositions 2.10 and 2.14, and Theorem 2.17(1)–(5) go to RT.6, matching the BMS2 extraction's routing of BMS2 Construction 11.5 and Proposition 11.10.
- The normalization uv = E_K(z) with E_K(0) = p, Theorem 2.17(6), stays in the Part II.

**Lemma 8.10 (additive Hilbert 90 over finite fields) is missing.** Mathlib has the multiplicative form (`groupCohomology.exists_div_of_norm_eq_one`). A reviewer may prefer to flag it as a small library contribution.

**Two error candidates.**

- E14 is recorded as an error with reach "the proof": a congruence mod p that holds only mod ζ_p − 1. The proposition stands.
- None of the fifteen issues could be checked in the published text.

## Leads not recorded as source issues

**Typos:**

- "poof" (proof of Lemma 6.12);
- "trvial" (proof of Theorem 8.21);
- "Frobeninus" (§1);
- an unmatched parenthesis in TP(−/E) = (THH(−/E)^{t𝕋} (Definition 2.4).

**Harmless slips:**

- The proof of Proposition 6.34 writes λz_1^{…}dz where z_0 is meant; they agree in the associated graded.
- The proof of Lemma 6.10 drops the unit μ.
- The proof of Proposition 7.1 writes d_r for d^r.

**Terse arguments:**

- Appendix A treats a general lci ideal "by Zariski descent", but every application uses a global regular sequence.
- Remark 6.45's correspondences with earlier Tate differentials are asserted without proof.
- The §9 claim that λ generates the cokernel of the trace K(Z_p; F_p) → TC(Z_p; F_p) has no proof. §9 was not extracted.

## Not done

Nothing remains in the extraction.
