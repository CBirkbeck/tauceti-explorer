# RT-PAPER-BHATT-MORROW-SCHOLZE-19: red team of the extraction of Bhatt–Morrow–Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4306).

**Target.** `PAPER-BHATT-MORROW-SCHOLZE-19` extracts B. Bhatt, M. Morrow and P. Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*, [Publ. Math. IHÉS 129 (2019), 199–310](https://doi.org/10.1007/s10240-019-00106-9). The extraction has:

- 114 items: 1 library, 56 planned, 57 missing;
- 13 routes: 12 source routes and 1 Part II;
- 12 source issues, all misprints.

**Who did what.**
- Claude Code `cc-442dc5` wrote the extraction (issue #1458, PR #1994).
- Claude Code `cc-fb70e5` wrote `REV-PAPER-BHATT-MORROW-SCHOLZE-19` (PR #2407). It accepted all routes, confirmed all 12 source issues and changed nothing.
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.** This session wrote three earlier red teams:
- RT-PAPER-BHATT-MORROW-SCHOLZE-18 (PR #4748);
- RT-PAPER-NIKOLAUS-SCHOLZE-18 (PR #4708);
- RT-PAPER-LAND-MATHEW-MEIER-ETAL-24 (PR #4730).

No finding here repeats one of those. Two findings touch the Nikolaus–Scholze extraction:
- **Finding 5.** The Nikolaus–Scholze item /127 (the HKR filtration, routed to RT.1) has the same order problem as BMS2's HKR items. My NS18 red team did not raise it.
- **Finding 6.** It relies on the Nikolaus–Scholze routes that send Bökstedt periodicity and the THH/TC⁻/TP computations for F_p (items /130–/135) to L.5.

**Result: 12 findings, 6 medium and 6 low.** The machine-readable file is [RT-PAPER-BHATT-MORROW-SCHOLZE-19.result.json](RT-PAPER-BHATT-MORROW-SCHOLZE-19.result.json).

- **Where the work is sound.**
  - Every numbered statement of the paper has an item, and most item statements are faithful.
  - E1–E7 and E9–E12 are real.
  - The review changed nothing, so it introduced no error.
- **Where it breaks.** Route order. The review checked only that each route's stage exists, not whether the stages are in the right order. Six findings put inputs in stages that are not upstream of the stages that use them, and one of these is a cycle.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v2 PDF (9 April 2019, "final version"; v1 9 February 2018) | [arxiv.org/pdf/1802.03261v2](https://arxiv.org/pdf/1802.03261v2) | `b2338ef1…b3594038` (matches) |
| arXiv v2 TeX source (`bms2.tex`) | [arxiv.org/e-print/1802.03261v2](https://arxiv.org/e-print/1802.03261v2) | `30968bad…4b91878ac` (matches) |
| Published version, open access | [Centre Mersenne PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-019-00106-9.pdf) | `6b43d1ff…23ff23dd` (matches) |

- All three were fetched on 30 September 2026.
- **Later versions and errata.** v2 is the latest arXiv version. Crossref lists no update for the DOI, and a web search found no erratum.
- **How I read it.** Five parallel readers split the whole TeX by section groups: §§1–3, 4–5, 6–7, 8 and 9–11. I re-checked every finding myself, in the TeX and on the published page. Four pages were checked as rendered images: pp. 268, 270, 285 and 300. Page numbers below are published pages.

## How route order was checked

I computed the ancestor set of every cited stage from three sources:
- the stage edges and stage requirements in `data/atlas.json`;
- every link in the restructuring results;
- every link in the packets.

Unaccepted links are included. Including them can only add ancestors, so a "not upstream" claim below is conservative. Every link proposed in a fix was checked acyclic. Each was checked alone and together with the confirmed RT-AREA-ktheory-2/36 link PR.4 → RT.6.

## Findings

### 1. The K-theoretic identifications make a cycle with the henselian-pairs Part II (medium, error)

- **The routing.**
  - Items 065 (Prop. 7.16, Z_p(0) = Z_p), 066 (Prop. 7.17, Z_p(1) = T_pG_m) and 089 (Cor. 8.23, K_* of quasiregular semiperfect rings) are routed to RT.6.
  - All three are proved through Theorem 7.15, K(S; Z_p) ≃ τ_{≥0}TC(S; Z_p) (item 063), for example: "This implies the identification Z_p(0) = lim Z/p^r … using Theorem 7.15" (p. 262).
  - Route 1 sends Theorem 7.15 to the Part II RefinedTraceMethodsPartIIHenselianPairs.
- **Why it is a cycle.**
  - That Part II's first prerequisite is RefinedTraceMethods.
  - So RT.6 would need a result owned downstream of itself.
  - Route 1's own brief records the back edge: "routed to RefinedTraceMethods RT.6".
- **Item 067.** It supplies K_0, K_1 and K_2 of local rings, and is planned at K.2:low-degree-comparisons. That stage is not upstream of RT.6 either.
- **The model to follow.** The Bhatt–Scholze extraction does this correctly. Its route 4 puts the K-theory consequences in the Part II and "import[s] PR.4 and RT.6".
- **Fix.**
  - Move items 065, 066 and 089 to route 1. The TC-internal part of item 065 stays at RT.6.
  - Make the Part II import RT.6, PR.4 and K.2:low-degree-comparisons.
  - In item 069 (Prop. 7.21), say that PR.4 uses the direct proof via Lemma 7.22, not the proof through K-theory.

### 2. The §8 characteristic-p chain runs against the stage order (medium, error)

**The problems.**
- **(a) DD.4 needs CR.4.**
  - The derived de Rham–Witt complex and its Nygaard filtration (item 081, Prop. 8.13) come "by taking the first part of Lemma 8.2 and left Kan extension" (p. 270). Theorem 8.14 (item 082) builds on them.
  - Both items are routed to DD.4.
  - Their inputs (items 071–072 and WΩ itself) belong to CR.4, which is not upstream of DD.4.
- **(b) DD.4 needs DD.5.** Remark 8.15 (item 083) uses the quasisyntomic site of DD.5, which is not upstream of DD.4.
- **(c) RT.6 and PR.3 need DD.4.**
  - Theorem 8.17 (item 084) is planned at RT.6 and PR.3.
  - Its proof uses Propositions 8.12–8.13 and Theorem 8.14.
  - Neither RT.6 nor PR.3 has DD.4 upstream. DD.4 has no consumers at all.

**Fix.** Record the links CR.4 → DD.4, DD.5 → DD.4 and DD.4 → RT.6, plus DD.4 → PR.3 if PR.3 keeps item 084. All of these are acyclic.

### 3. Route 13 gives PR.4 proofs whose inputs are not upstream (medium, error)

**Item by item.**

| Item | What its proof uses | Owner of that input |
| --- | --- | --- |
| 074 (Prop. 8.4) | The Nygaard filtration and logarithmic sheaves on WΩ | CR.4 |
| 087 (Lemma 8.19) | Theorem 8.14(4) | DD.4 |
| 088 (Prop. 8.20) | "the identifications of Theorem 8.17", and it states the TC exact sequence 0 → π_{2i}TC → π_{2i}TC⁻ → π_{2i}TP → 0 (p. 281) | RT.6 |
| 102–104 (§10) | AΩ, via "Theorem 1.8 tells us …" (p. 292) | RT.6/PR.6 and AI.3/AI.4 |

- None of these owners is upstream of PR.4.
- The confirmed RT-AREA-ktheory-2/36 fix adds PR.4 → RT.6. After that, any TC input to PR.4 is a cycle.
- The route's reason says "§8.3", but these results are in §8.4.

**Fix.**
- Split item 088. The TC sequence goes to RT.6; the statement A_crys(S)^{φ=p^i} stays at PR.4.
- Record DD.4 → PR.4 and CR.4 → PR.4.
- For §10, cite PR.6's comparison AΩ ≃ φ^*Δ and record PR.6 → PR.4.
- All of these links are acyclic, even together with PR.4 → RT.6.

### 4. BMS2's AΩ comparison sits at RT.6 without its A_inf inputs (medium, error)

- **The routing.** Items 091–097 and 099 (§9) and item 050 (Remark 6.6) are routed to RT.6.
- **What they use.**
  - AΩ_A = Lη_μRΓ(Spf(A)_C, 𝔸_inf) (Construction 9.5);
  - almost mathematics over W(𝔪^♭);
  - μ, ξ_r and ξ̃ (item 090, at AI.0);
  - BMS1's Breuil–Kisin–Fargues twist.
- **Why it is wrong.**
  - RT.6's ancestors include AI.1, but not AI.0, AI.3, AI.4 or PR.6.
  - RT.6's own text says that "A_inf/Lη [belong] to AInfCohomology", so the imports were intended, but no link supplies them.
- **Fix.** Record AI.0 → RT.6 and AI.4 → RT.6, both acyclic. Alternatively, route §9 to AI.7.

### 5. The HKR items at RT.1 have no cotangent complex upstream (medium, error)

- **RT.1's position.** RT.1 requires only H.5:spectra.
- **What route 3 puts there.**
  - the HKR filtration "by left Kan extension" with gr^i ≃ ∧^iL[i] (item 020);
  - the universal property of HH (item 019);
  - the quasismooth HKR theorem (item 031).
- **Why it is wrong.**
  - These need the cotangent complex (DD.0) and animation (E5:animation), and neither is upstream of RT.1.
  - Items 015 and 045 list RT.1 as a planner, but they need DD.2 and DD.5.
  - DD.5's text says "RT.1/6 uses these objects", but no edge lets RT.1 use them.
- **Related cases.**
  - The Nikolaus–Scholze item /127 has the same problem.
  - Item 043 (at DD.5) uses the conjugate filtration, which belongs to DD.3. DD.3 is not upstream of DD.5.
- **Fix.**
  - Record DD.0 → RT.1 and E5:animation → RT.1, or re-route items 019, 020 and 031 to RT.6.
  - Drop RT.1 from the planned lists of items 015 and 045.
  - Record DD.3 → DD.5.
  - All of these links are acyclic.

### 6. The THH(F_p) inputs are owned by L.5, which is not upstream of RT.6 (medium, error)

- **What BMS2 needs.**
  - Bökstedt periodicity is "the only non-formal input on THH" (Remark 1.5). Theorem 6.1 reduces to it.
  - Propositions 6.2–6.3 use Nikolaus–Scholze IV.4.8 and IV.4.9.
  - Theorem 8.17 uses Nikolaus–Scholze IV.4.10, IV.4.12 and IV.4.13.
- **Who owns them.**
  - The accepted Nikolaus–Scholze routes send these results to L.5, except IV.4.12, which goes to RT.2.
  - The review of RT-AREA-ktheory-2/34 settled L.5 as the single owner of Bökstedt periodicity.
- **Why it is wrong.**
  - Item 023 still names two planners, L.5 and RT.2.
  - L.5 is not upstream of RT.6.
  - Lemma 2.5 (item 024) uses Bökstedt's computation of π_*THH(Z), which nothing plans.
- **Fix.**
  - Plan item 023 at L.5 only, and record L.5 → RT.6 (acyclic).
  - Give π_*THH(Z) an owner.

### 7. Seventeen unrecorded mistakes in the paper (low, error)

All of these are in both arXiv v2 and the published text.

**Substantive.**
1. **Remark 1.16 (p. 209)** omits the Gysin shift. The first term should be WΩ^{n−1}_{k,log}[−n−1].
   - Check with n = 1 and k algebraically closed. The valuation sequence gives the fibre of (O_K^×)^∧[−1] → (K^×)^∧[−1] as Z_p[−2], not Z_p.
   - Schneider's triangle has i_*ν^{n−1}[−n−1].
   - The Hesselholt–Madsen graded pieces in the same remark also lack [2n].
2. **Proposition 5.6 (p. 237)** prints Ext^{i−c}; it should be Ext^{i+c}. The proof itself ends with RHom(M, N)[c].
   - The proof of Theorem 5.4 (p. 236) has the matching slip, Ext^{a−i+j}, so the argument is unaffected.
3. **Corollary 7.10(1) (p. 258)** prints D^{[0,max(i,d)]}; it should be min(i,d). With max, the stated consequence ∈ DF^{≤0} does not follow.

**Index and notation slips.**

| # | Where | Printed | Should be |
| --- | --- | --- | --- |
| 4 | §5.1 (p. 233) | gr^i = F(i)/F(i−1) | F(i)/F(i+1) |
| 5 | Proof of Corollary 5.10 (p. 239) | F ↦ F(∞) | F(−∞) |
| 6 | Proof of Lemma 4.7(2) (p. 222) | i < 0 | i > 0 |
| 7 | Proof of Propositions 6.2–6.3 (p. 246) | ξ replaced by φ^{−1}(α)ξ | φ^{−1}(α)^{−1}ξ |
| 8 | Same proof (p. 247) | "bounded below" and "bounded above" | swapped |
| 9 | Proof of Proposition 7.17 (p. 262) | S^{1/p} defined with X_u − u^p | X_u^p − u |
| 10 | §7.4 (p. 261) | Theorem 1.12(4) | 1.12(5) |
| 11 | Proof of Proposition 8.5 (p. 268) | p^{i+1}FWΩ^i | p^{i+1}FWΩ^{i+1} |
| 12 | Proof of Proposition 8.7 (p. 270) | H^j written with index i | index j, and dVWΩ |
| 13 | Proposition 8.13(3) (p. 274) | 𝒩^{≥i} ≅ Lτ^{≤i}Ω | 𝒩^i |
| 14 | Remark 9.11 (p. 290) | q = [ε] − 1 | q = [ε] |
| 15 | Proposition 11.3 (p. 300) | (s, n) ↦ (s^p, pn) | (s, pn) |
| 16 | Construction 9.13 (p. 291) | ⊗_{E_∞-k} | ⊗_{E_∞-𝕊} |
| 17 | Proof of Lemma 11.6 (p. 301) | "Cartesian" | coCartesian |

Row 15 is the only one that needs an argument: with the stated action t·(s, n) = (t^n s, n), the printed map is not equivariant, and (s, pn) is.

**Not filed.** The proof of Proposition 7.17 asserts that B^× ⊗ B^× → K_2(B) is surjective for every local ring B. To my knowledge this is known in general only when the residue fields are large enough. I could not settle whether this matters for the w-local rings used there.

### 8. Items that copy slips or drift from the paper (low, error)

| Item | Problem |
| --- | --- |
| 040 | Copies Proposition 5.6's Ext^{i−c}. |
| 059 | Copies Corollary 7.10's max(i,d). |
| 106 | Copies Proposition 11.3's (s^p, pn). |
| 041 | Says "exactly when"; Remark 5.9 says only "if". |
| 035 | Drops "p-complete with bounded p^∞-torsion". |
| 005 | Mis-pairs its "resp." clauses. |
| 070 | Omits the extension used in Proposition 7.21. |
| 111 | Overstates Remark 11.14's compatibilities. |
| 066, 064 | Notes miss the misprints next to E6 and E5. |
| 001 | Marked planned, but neither R07.4 nor AI.7 defines Breuil–Kisin modules with torsion and no height bound. |

### 9. Page locators (low, error)

| Item or route | Correct locator |
| --- | --- |
| 021 | §1.2, pp. 202–203 |
| 011 | p. 207 |
| 010 | pp. 206–207 |
| 022 | also §1.2, p. 203 |
| 081 | pp. 270–274 |
| 089 | pp. 282–283 |
| 109 | onto p. 303 |
| Route 13's reason | §8.4, not §8.3 |

### 10. Library citations (low, library-claim)

These were read at Mathlib `082e2d3`.
- **(a) θ's surjectivity.** Item 033 calls θ a surjection for every p-adically complete R, citing `fontaineTheta_surjective`, which does not exist.
  - The theorem is `surjective_fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:193–195`).
  - It requires Frobenius to be surjective on R/p.
  - Without that hypothesis θ can fail to be surjective: for R = Z_p⟨T⟩, θ is Z_p → Z_p⟨T⟩.
- **(b) Frobenius.** `WittVector.frobeniusEquiv` (`WittVector/Frobenius.lean:286`) applies to A_inf, because `PerfectRing (PreTilt O p) p` holds (`Perfection.lean:647`). Item 033 does not cite it.
- **(c) Cotangent complex.** The baseline note's "no cotangent complex" overlooks the naive one.
  - `Algebra.Extension.cotangentComplex` is at `Extension/Cotangent/Basic.lean:61`.
  - `Algebra.H1Cotangent` is at `:552`; it gives I/I² = π_1L_{S/R}.
- **(d) Divided powers.** `DividedPowers` (`DividedPowers/Basic.lean:78`), the divided powers on (p) ⊂ Z_p (`DividedPowers/Padic.lean:139`) and `DividedPowerAlgebra` go uncited, though items 078–079 build on them.

The statuses do not change.

### 11. Cited inputs with no item (low, missing)

- Nikolaus–Scholze IV.4.2, II.4.10, IV.2.4 and IV.4.12. The Nikolaus–Scholze extraction has items for these that should be cited as owners.
- Bhatt–Scholze's w-localization, used in Props. 7.16–7.17.
- Illusie's comparison and his equation I.3.21.1.5.
- Berthelot–Ogus's Lη_p quasi-isomorphism.
- BMS1's Theorem 1.8 and Lemma 3.14.
- Quillen's quasiregularity criterion.
- Scholze–Weinstein Proposition 4.1.11.
- Illusie 1979 and Bhatt–Scholze 2015 are missing from the prerequisites.

### 12. E8 is not corrected in the published version (low, error)

- **The claim.** E8 is recorded as known: "corrected in the published version (… p. 285, prints ∏ O_C)".
- **Why it is false.** The published p. 285 prints "(a_i) ∈ ∏_{i∈I} O_C^♭", the same slip as arXiv v2.
- **Where the claim is repeated.**
  - item 093's note;
  - the report's "one was corrected there".
- **Effect.** The errata register files this as a mistake already corrected in print.
- **Fix.**
  - Set known to "new" and add p. 285 to the locator.
  - Correct item 093's note and the report.

## What I checked

The full list is in the result file's `checked` field. In brief:

- **Authorship.** Checked from the target files and the git history.
- **Sources.** Checked all three hashes, looked for later versions and errata, and read the full TeX.
- **Items.** Compared all 114 statements and locators with the paper.
- **Source issues.** Re-checked E1–E12.
- **Libraries.** Searched the declaration index at both pins for every notion marked missing. Read the cited Mathlib files at the pin. Tau Ceti has nothing in this area.
- **Atlas.** Read the stage texts of the 24 cited stages, including PR.0–PR.7, DD.0–DD.5, RT.1–RT.6, AI.0, AI.1, AI.7, CR.0, CR.4, R07.4, L.5 and K.2.
- **Route order.** Computed ancestor sets as described above, with the atlas stage edges plus all restructuring and packet links.
- **Other extractions.** Compared with the Clausen–Mathew–Morrow, Clausen–Mathew, Bhatt–Scholze, Antieau–Mathew–Morrow–Nikolaus, Liu–Wang, Bhatt–Mathew and Nikolaus–Scholze extractions.
- **Other red teams.** Read RT-AREA-ktheory-1/2 and RT-AREA-padic-2 so as not to repeat their findings.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BHATT-MORROW-SCHOLZE-19.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on both files reports 0 problems.
