# RT-PAPER-BHATT-MORROW-SCHOLZE-18: red team of the extraction of Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4310).

**Target.** `PAPER-BHATT-MORROW-SCHOLZE-18` extracts B. Bhatt, M. Morrow and P. Scholze, *Integral p-adic Hodge theory*, [Publ. Math. IHÉS 128 (2018), 219–397](https://doi.org/10.1007/s10240-019-00102-z). The extraction has:

- 190 items: 2 library, 92 planned, 96 missing;
- 14 source routes;
- 18 source issues, all misprints.

**Who did what.**
- Claude Code `cc-442dc5` wrote the extraction (issue #1462, PR #2002).
- Claude Code `cc-fb70e5` wrote `REV-PAPER-BHATT-MORROW-SCHOLZE-18` (PR #2398). It accepted all routes, confirmed all 18 source issues and changed nothing.
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.**
- **Scholze 2013.** This session wrote PAPER-SCHOLZE-13 (*p-adic Hodge theory for rigid-analytic varieties*).
  - Finding 3 concerns that extraction's route 1, which sends Scholze's primitive comparison theorem to PadicHodgeTheory P8/P8:local-rational. The finding asks for that target to be narrowed to P8:local-rational.
  - Finding 14(a) uses its citation of Mathlib's `BDeRhamPlus`/`BDeRham`, which I re-read at the pin.
- **Reviews.** This session reviewed PAPER-KEDLAYA-LIU-15 (PR #4673), PAPER-FARGUES-FONTAINE-18 (PR #4683) and PAPER-SCHOLZE-17 (PR #4688). No finding here touches their routes or conclusions.

**Result: 15 findings, 8 medium and 7 low.** The machine-readable file is [RT-PAPER-BHATT-MORROW-SCHOLZE-18.result.json](RT-PAPER-BHATT-MORROW-SCHOLZE-18.result.json).

- **Where the work is sound.**
  - Every numbered statement of the paper has an item, and most item statements are faithful.
  - All 18 recorded source issues are real.
  - The review changed nothing, so it introduced no error.
- **Where it breaks.**
  - Five routes put inputs in layers that are not upstream of the layers that use them. Two of these make cycles.
  - One route contradicts the accepted RS-01 restructuring.
  - The paper has two false statements that items copy (Lemma 3.20's converse, Lemma 11.11's normalization). It also has three false proof steps and about fifteen misprints; none of these is recorded.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v3 PDF (15 Jan 2019, "final version"; v1 2016, v2 2018 superseded) | [arxiv.org/pdf/1602.03148v3](https://arxiv.org/pdf/1602.03148v3) | `285f7d20…9c4e072a` (matches) |
| arXiv v3 TeX source | [arxiv.org/e-print/1602.03148v3](https://arxiv.org/e-print/1602.03148v3) | `ff989b40…262b5aa4` (matches) |
| Published version, open access (179 pp.) | [Centre Mersenne PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-019-00102-z.pdf) | `a924d36c…2052702bb` (matches) |

- All three were fetched on 30 September 2026.
- **Later versions and errata.** v3 is the latest arXiv version. Crossref and the Centre Mersenne listing show no erratum.
- **How I read it.** Five parallel readers split the whole TeX source by section groups: §§1–3, 4–5, 6–9, 10–12 and 13–14. I re-checked every finding filed here myself, in the TeX and at the published page. Every quoted slip is present in the published version. Page numbers below are published pages.

## Findings

### 1. The §4.2 algebra is routed against RS-01, and coherence comes too late (medium, duplicate)

**The routing.**
- Route 3 sends Kedlaya's Lemma 4.6, Lemmas 4.7–4.10 and Corollary 4.12 (items 062–067) to AI.2.
- Proposition 4.13 (item 068) is planned at AI.2.

**Why it is wrong.**
- **RS-01.** RS-01 was written on 21 September and accepted on 23 September, before this extraction's review. It assigns "the generic BMS §4.2 A_inf-module/complex specialization, torsion-length, finite-presentation/freeness … lemmas" to **AI.5**. AI.2 keeps only the finite-free BKF/Fargues classification.
- **Ordering.** Lemma 4.9's proof (p. 269) says "We freely use Lemma 3.25 and Lemma 3.26" and uses "W_n(O^♭) is coherent". Route 4 sends that coherence material (items 051–056) to AI.3, which is not upstream of AI.2.
- **Third copy.** The CohomologyComparisons packet plans the same statements again. Its node CP.0/coherence-of-witt-vectors-of-perfectoid-integers covers the coherence material, and two CP.5 "supplier material" nodes cover Lemma 4.9 and Proposition 4.13.

**Fix.**
- Re-route items 062–068 to AI.5.
- Move items 051–056 to AI.0, which is upstream of AI.2, AI.3 and AI.5.
- Make the CP nodes aliases of these, as RS-01 prescribes.

### 2. Theorem 14.3 and Proposition 13.21 form a cycle (medium, error)

**The problem.**
- Theorem 14.3 (item 009) is planned at AI.5.
- Its BKF assertion is proved "using also Proposition 13.21" (p. 392).
- Proposition 13.21 (item 189) is planned at CP.2, which requires AI.5. So AI.5 would need a statement owned downstream of itself.

**Why CR.3 is the right owner.**
- Proposition 13.21 is purely crystalline: it needs only that Frobenius is an isogeny after inverting p, and crystalline base change.
- The CohomologyComparisons packet already asks CR.3 for exactly those inputs.

**Fix.**
- Plan item 189 at CrystallineCohomology CR.3.
- Link CR.3 → AI.5. This is acyclic.

### 3. Theorem 5.7 rests on an input owned downstream of it (medium, error; touches PAPER-SCHOLZE-13)

**The problem.**
- Theorem 5.7, the primitive comparison with A_inf coefficients, is routed to AI.4. The paper cites it from the proof of Scholze's Theorem 8.4.
- PAPER-SCHOLZE-13 routes Scholze's primitive comparison theorem to P8/P8:local-rational.
- P8 is downstream of AI.4 (AI.4 → AI.5 → AI.6 → CP.4 → P8), so that ownership makes a cycle. P8:local-rational is not upstream of AI.4 either.
- The proof of Theorem 13.1 (item 018, at CP.3) uses Theorem 5.7 again (p. 385). AI.4 is not upstream of CP.3.

**Fix.**
- Own the primitive comparison at P8:local-rational, which requires only AI.3, A1, H0, R06.1 and P3.
- Link P8:local-rational → AI.4.
- Narrow PAPER-SCHOLZE-13's route to P8:local-rational.
- Give Theorem 13.1's B_dR^+ reduction an upstream supplier.

### 4. Witt-vector lemmas at CR.4 are needed in AI.3 (medium, error)

**The problem.** Three results routed to CR.4 are used in proofs routed to AI.3. CR.4 is not upstream of AI.3.

| Result | Item | Used in (AI.3) |
| --- | --- | --- |
| Lemma 9.8 | 138 | proof of Lemma 9.7 (p. 324) |
| Theorem 10.4 | 149 | proof of Lemma 9.9 (p. 326) |
| Corollary 10.2 | 147 | before Corollary 3.29 (p. 261) |

**Fix.** Move these, with Lemma 10.1, to AI.0. Alternatively, link CR.4 → AI.3.

### 5. The §2 examples sit at AI.5 but need CR.3 (medium, error)

**The problem.**
- Items 023 and 024–029 are placed at AI.5.
- Their proofs need crystalline tools:
  - Lemma 2.12, routed to CR.3;
  - Illusie's H^*_crys of Enriques surfaces in characteristic 2;
  - Berthelot's weak Lefschetz theorem.
- CR.3 is not upstream of AI.5.
- Illusie's result and the Gabber/Poonen Bertini theorems have no items.

**Fix.**
- Route the examples to CP.5, which is downstream of both AI.5 and CR.3. Alternatively, link CR.3 → AI.5.
- Add cited-input items for Illusie's result and the Bertini theorems.

### 6. Faltings' almost purity has no item (medium, missing)

**What is missing.**
- The paper "relies on Faltings' almost purity theorem" (abstract).
- Its local forms have no items:
  - RΓ_cont(Γ, R_∞) → RΓ_cont(Δ, R̄^) is an almost quasi-isomorphism (p. 306);
  - the W_r and A_inf versions (pp. 327, 330).
- The almost-mathematics vocabulary has no items either: almost zero elements, almost quasi-isomorphisms, and the non-idempotent W(𝔪^♭) variant that the paper warns about (p. 327).

**Where they belong.** AI.3 says to "prove the almost purity comparison", and RS-05 gives almost algebra to P0 and almost purity to P3.

**Fix.** Add planned items at AI.3, P3 and P0.

### 7. The converse of Lemma 3.20 is false, and item 047 copies it (medium, error)

**The statement.** "If R^+ is perfectoid and bounded in R, then R is perfectoid in Fontaine's sense" (p. 255). This fails without the hypothesis that p is topologically nilpotent in R.

**Counterexample.**
- Let A be the (p,T)-adic completion of O_C[T^{1/p^∞}], and R = A[1/T] with the T-adic topology.
- A is a ring of integral elements: the Gauss valuations are multiplicative, so A is integrally closed in R. A is also perfectoid and bounded.
- But R is not perfectoid in Fontaine's sense. Map A → O_C by T^e ↦ 0 for e > 0. A topologically nilpotent unit π with π^p | p would map to a nilpotent element, hence to 0, and then p would map to 0 in O_C.
- The proof fails at "for n sufficiently large": with π_0 = T, the element π = θ([π^{♭1/p^n}]) is roughly T^{1/p^n}, and π^p never divides p.

**What is unaffected.** The paper only uses the forward direction.

**Fix.** Add the hypothesis to item 047, and record a new source issue.

### 8. Lemma 11.11's normalization is wrong, and item 162 copies it (medium, error)

**The statement.** Lemma 11.11 (p. 351) asserts λ_r([T_i]) = U_i.

**Why it is wrong.**
- In the proof, γ_i sends U_i to [ζ_{p^r}]U_i. Since [ζ_{p^r}] − 1 is a non-zero-divisor, U_i is not invariant, so U_i ∉ 𝒲_r^0(D).
- The proof's own identification sends U_i^{p^r} to [T_i].
- Compatibility with R forces the same exponent.

**Correction.** λ_r([T_i]) = U_i^{p^r}. The theorem is unaffected.

**Same passage.** The gcd element in the proof of Lemma 11.9 has the wrong root of unity. As printed, r = 2 and a = p give cohomology 0 instead of O.

### 9. Three false steps in proofs of true lemmas; E2's reason is wrong (low, error)

- **Lemma 6.9 (p. 292).** The proof claims 𝓘^{⊗n}C^{n−1} ⊇ (η_𝓘C)^{n−1}.
  - Counterexample: take C = Z in degree n−1 and 𝓘 = (p).
  - The step is true modulo cocycles, which is all the proof needs.
- **Lemma 4.8 (p. 268).** The proof's list of three kinds of rank-one submodules of K^♭ misses {|x| ≤ r} for r outside the value group.
  - The lemma survives.
  - E2's reason repeats the false classification.
- **Theorem 14.5 (p. 393).** The proof says the length identity "holds for any torsion W(k)-module".
  - It fails for W(k)[1/p]/W(k); it needs "finitely generated".

### 10. Unrecorded misprints (low, error)

All of these are also in the published version.

| Page | Where | Printed | Should be |
| --- | --- | --- | --- |
| 219 | §1.1 | "residue field of O" | O_K |
| 243 | proof of Lemma 2.12 | middle term 𝓘^{⊗r} ⊗ Ω^{j−1}_X | restricted to H |
| 264 | proof of Proposition 4.3 | x^p ∈ Z | x^p ∈ σ̃(Z) (Frobenius twist on coefficients) |
| 268 | proof of Lemma 4.6 | "M → M_2/p" | M/p |
| 268 | proof of Lemma 4.6 | ⊗_{R_2} k | ⊗_{O^♭} k |
| 279 | proof of Lemma 4.26 | T ⊗_{A_inf} | T ⊗_{Z_p} |
| 329 | proof of Lemma 9.13 | "Proposition 9.6" | Lemma 9.6 |
| 361 | §12.2 | the map S_Σ → A_inf(R_∞,Σ) | cannot exist as printed (S_Σ is an A_crys-algebra) |
| 365 | proof of Lemma 12.8(iii) | q − 1 | φ^{−1}(μ) |
| 366 | proof of Lemma 12.8(iv) | ξ_r | ξ̃_r |
| 374 | proof of Lemma 13.8 | N, pN | N′, pN′ |
| 381 | Proposition 13.15 | "(1)" | (i); fold into E17 |
| 383 | Remark 13.17 | "that of k" | K |
| 387 | proof of Proposition 13.21 | truncated fibre product | Y ×_{Spec O/p} Spec O/p^{1/p^n} |

E18's locator should read pp. 390–391.

### 11. Inexact item statements and notes (low, error)

| Item | Problem |
| --- | --- |
| 016 | States the E_∞ upgrade without the paper's ∞-categorical assumption on Lη. |
| 107 | Drops "T replete". |
| 114 | Remark 7.8 proves the non-cdga claim only for p = 2. |
| 131 | "R lim" must be along F; along R the limit is W(O), which is not A_inf. |
| 136 | Conflates two normalizations of the q-derivative. |
| 132 | Should cite Theorem 8.7, not Theorem 8.3. |
| 189 | The note's "Y ≅ Ȳ ×_k O/p^{1/p^n}" is false. |
| 059, 123, 024 | Inaccurate notes. |

### 12. Cited theorems with no items (low, missing)

- Berthelot's comparison of crystalline cohomology with the de Rham complex of a PD envelope (CR.2).
- Illusie's de Rham–Witt comparison and the Cartier isomorphism (CR.4).
- Kisin's full faithfulness from G_K to G_{K∞}, and the φ-module equivalence (R07.4).
- Beauville–Laszlo.
- Kiehl finiteness, and "a coherent module with integrable connection is locally free".
- The Gabber–Ramero cotangent vanishing.
- Scholze's Lemma 5.6.

### 13. Lemma 6.1 belongs to E1 (low, duplicate)

- E1 plans K-flat replacements.
- The AI.1 packet requests Lemma 6.1 from E1.
- Routing it to AI.1 would plan it twice.

### 14. Library citations (low, library-claim)

- **(a) Period rings.** Mathlib 082e2d3 defines `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:77`) and `BDeRham` (`:90`). Item 049 should cite them.
- **(b) θ's hypotheses.** `WittVector.fontaineTheta` is declared under `[Fact ¬IsUnit (p : R)] [IsAdicComplete (span {(p : R)}) R]` (`FontaineTheta.lean:118`), not "for any ring".
- **(c) Lemma 3.25(i)** follows from `Module.FinitePresentation.trans` and `FinitePresentation.of_isBaseChange`.

### 15. Page locators (low)

| Item | Correct page(s) |
| --- | --- |
| 003 | p. 222 |
| 011–013 | p. 226 |
| 019–021 | p. 225 |
| 058 | pp. 262–263 |
| 061 | pp. 265–266 |
| 075 | pp. 275–276 |
| 077 | pp. 276–277 |
| 189 | pp. 387–388 |

## What I checked

The full list is in the result file's `checked` field. In brief:

- **Authorship.** Checked from the target files and the git history.
- **Sources.** Checked all three hashes, looked for later versions and errata, and read the full TeX.
- **Items.** Compared all 190 statements and locators with the paper.
- **Source issues.** Re-checked E1–E18.
- **Libraries.** Read every cited declaration at Mathlib 082e2d3. Searched the declaration index of both libraries for the notions marked missing.
- **Atlas.** Read the full stage texts of AI.0–7, CP.0–6, CR.0–7, R06.1, P8, P8:local-rational, P1–P3 and E1–E2.
- **Restructurings and packets.** Read RS-01 and RS-05, and the packets that touch these layers.
- **Route order.** Computed dependency order from data/atlas.json stage edges together with the links of accepted restructurings, link maps and packets. RS-01's CP.3 → CP.2 link resolves an apparent gap for items 001, 006 and 008, so none is reported.
- **Other extractions.** Searched the accepted extractions for overlapping material:
  - Scholze–Weinstein 20 and Guo–Reinecke 24 treat BKF modules and Kedlaya's lemma consistently.
  - Scholze 13 and BMS 19 are consistent except for finding 3.
  - Koszul complexes appear at AI.1, DD.1, IHG.6 and HQ.1. That is an area-level question, and no finding is filed on it.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BHATT-MORROW-SCHOLZE-18.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on both files reports 0 problems.
