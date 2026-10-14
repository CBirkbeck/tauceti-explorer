# PKG-HodgeTateAndCanonicalSubgroups~2

Issue #9840; Claude (Opus 5.5), session `claude-P5lshb`; 2026-10-14. Revision round 2 of the package, answering
`reviews/REV-PKG-HodgeTateAndCanonicalSubgroups.md` (§5.1 supplier contracts, §5.2 duplication). `review.json` is left in
place for the next reviewer. No packet, reader or suggested input was changed.

## Result

The README now has 154 targets (was 137): Layer 0 has 28, Layer 1 has 5, Layer 2 has 14, Layer 3 has 12, Layer 4 has 8,
Layer 5 has 13, Layer 6 has 37, Layer 7 has 36 and Layer 8 has 1.

- The section "Exact supplier contracts" now lists only material the suppliers state, per supplier, with what is assumed.
  Every former "additional requirement" is now one of three things: a precise citation of a supplier target that states
  it; a new target of this roadmap; or an explicit narrowing of the dependent target.
- `Suggested.lean` is 229 lines and imports Mathlib only.
- Checks run:
  - `lean-check` exits 0 with four `sorry` warnings only (lines 43, 111, 139 and 154).
  - `scripts/check_sorry_data.py`: no offenders.
  - `intake.py check-files` on the three package files: 0 problems.
  - A scratch link checker: every `[L.N](#section-L-N)` link resolves with matching text, there are 154 anchors and
    headings, the `Needs` graph has no cycle and no reference to a later layer, and every Define/Construct target has
    at least 3 Checks.

## §5.2 Duplication: Layer 6 restructured and renumbered

PrismaticCohomology §8.60 (tier 13) is imported. It supplies log structures on étale sites, logification and pullback,
O⁺-charts, fs log adic spaces and strictness, Kummer maps, the Kummer étale site, its local systems, local log inertia and
R^iε_*(ℤ/n). Layer 6 keeps only the analytic refinements. The old-to-new map is below; Layer 6 links were renumbered
by script.

| Old | Change | New |
|---|---|---|
| 6.1 log structures on X_ét | narrowed to the characteristic, morphisms, exactness and the stalkwise strictness criterion (DLLZ-adic 2.2.2(4),(7)–(8), 2.2.4–2.2.7) | 6.2 |
| 6.3 integral charts | narrowed to charts as strict maps to monoid-algebra spaces, characteristic charts, fine/fs ⇔ integral/saturated, charts of morphisms | 6.4 |
| 6.11 Kummer étale maps | narrowed to the chart description, log-étale + exact characterisation, stalkwise index, cancellation, openness; composition and base change are §8.60's | 6.12 |
| 6.14 Kummer étale site | narrowed to structure sheaves O, O⁺, M, representability, affinoid acyclicity, ε and f_két, chart basis | 6.15 |
| 6.16 finite Kummer descent | narrowed to (i)–(iv); the local π₁ and Loc_Λ are §8.60's | 6.17 |
| 6.17 R^iε_* | **deleted**, wholly §8.60; references now cite `PrismaticCohomology` §8.60 | — |

The other old targets keep their content: 6.2→6.3, 6.4–6.10→6.5–6.11, 6.12–6.13→6.13–6.14, 6.15→6.16, 6.18–6.23→6.19–6.24,
6.24–6.25→6.26–6.27, 6.26–6.27→6.29–6.30 and 6.28–6.31→6.32–6.35.

The new Layer 6 targets are:
- 6.1, coherent étale descent (DLLZ-adic A.9–A.11);
- 6.18, normal extension across a normal-crossings boundary, after Hansen, Lütkebohmert and Bartenwerfer;
- 6.25, Cartan–Leray for pro-finite Kummer Galois covers;
- 6.28, étale vs pro-étale cohomology on non-noetherian perfectoid spaces;
- 6.31, derived limits over an acyclic basis (Scholze 2013, Lemma 3.18);
- 6.36, cohomological dimension of X_an;
- 6.37, the projection formula for locally free coefficients.

CohomologyComparisons §6.1 (tier 14) is the modular-curve case of the general sites and periods. Following PROTOCOL §15
(the general theory builds on the special case and proves compatibility), the new 7.15 states the agreement of the
general constructions with §6.1. No maintainer move is needed; the maintainer may still prefer to move the general
construction down.

## §5.1 Contracts: how each was resolved

| Contract | Resolution |
|---|---|
| R07.1 | (a) ω over O_C: new **0.25**. (b) Faltings complex: already **0.5**'s statement. (c) embedding: cite **R07.1.40** (Raynaud, Zariski-local on any base, so global over the local ring O_C). (d) Fitting degree: new **0.24**. (e) BT quotient: new **0.28**, for truncations H[p^n] of p-divisible groups. 3.6(2) is restricted accordingly (FAR11 states it for all BT_n). |
| R07.2 | (1) **0.12** now proves Pilloni's Lemma 6.3.4.1 itself. (2) cite **R07.2.21**'s det(ω^{(p)}) = (det ω)^{⊗p}. |
| R07.6 | Amplitude [−1,0]: new **0.26**, which also takes the isogeny Hodge triangle (old A4 item (1)). R07.6.6 is still cited for obstruction theory. |
| A2 | V_A = (F_{A^∨})^∨: new **0.27**. |
| A4 | (2) cite **A4.2–A4.3**. (1) is **0.26**(5). |
| P8 | (1) **narrowed**: 1.1, 2.6 and 2.10 are over finite K/ℚ_p (P8's generality). (2) new **1.5**: relative character compatibility, with uniqueness via Scholze 2013 Prop 6.16. (3) new **1.4**: degree-one HT sequence over arbitrary C (CDM12 3.20, 3.23, 4.10). |
| R11.3 | **Narrowed**: 0.18 is for abelian varieties over a complete discretely valued K. Over arbitrary C the character description is given for good reduction (1.5, 2.5). |
| C4, C5 | C4: cite **C4.4**, **C3.1** and **C4.15**; T[p^∞] is built from the character sheaf in 0.12. C5: new **5.13** (f_*O/p^k = f_*(O/p^k) and projection formula, PS16 A.4, A.9, A.10). **Narrowed**: 0.17 and 5.5–5.7 are Siegel only. GSp₄/F (Hilbert–Siegel) and the p = 2 modified bundles are outside the roadmap. |
| H2, H4 | 𝒪_F-structure: new **3.12**. Its proof covers n ≥ 2, or p unramified, or the level-n+1 subgroup existing; 3.10 and 5.1 use ε ≤ p^{−3} at n = 1 for ramified p. The all-prime radius is 3.10's own (HALO A.2). BHW endpoints are **narrowed** to strict for p ≥ 3 (4.6 and Lean). The Igusa map and generator are 5.2's own. |
| P9 | 2.12–2.13 cite **DiamondsAndVStacks D2.9** (v-descent of bundles). 5.8 had only a sentence and needs no input; invariants and coefficient sheaves are O5's. |
| R2 | Normal formal models and the formal-to-O⁺ transfer: new **3.11**. |
| B1, R09.1 | Flags: R09.1 (flag bundle). G → G/P and Levi quotients: **TauCetiRoadmap ReductiveGroups Layers 3, 7**. Tate-basis contraction, determinant local system and Hecke linearization: stated in **2.10**. ℳ_dR: B1 (filtration reduction). Integral frames: **outside the roadmap** (rational frames only). |
| ReductiveGroups (Ziegler) | New **2.14**: Ziegler 3.4, 3.14–3.15, 3.23, 3.52, 3.54–3.55. |
| AdicSpacesPartII R0, R3 | R0: new **6.18**. R3: new **6.1**. |
| CR.5:log-algebra | Superseded by §8.60 plus narrowed 6.2 and 6.4. CR.5 is cited for monoid-level statements. |
| H0 | Finite-module acyclicity: **6.1**. Non-noetherian Cor 3.17: **6.28**. Kummer Cartan–Leray: **6.25**. cd(X_an): **6.36**. The étale cd bound, Huber comparison and purity are cited from **H0 §11.1–11.2**. |
| E1, E2 | Projection formula: **6.37**. Basis R lim: **6.31**. |
| P8 (Scholze §5 lemmas) | P8 states the primitive comparison; the toric computations are 7.1–7.3's own (method citations). |
| P8:local-rational | The horizontal frame is constructed in **7.31**. |
| ALS.1, V8.general, CM special points, Liu–Zhu Thm 1.2, nonproper GAGA | **Narrowed**: 7.29 (old 7.27), 7.30, 7.36 and 8.1 are for Shimura data of **Hodge type**. The comparison comes from the relative comparison for A^m plus Hodge tensors (1.3); boundary extension uses 7.22, with no special points. Old 7.28 and 7.29 are **deleted**. Non-Hodge-type data are outside the roadmap. |
| Additional interfaces | Decompletion: owned by 7.18. Regular-singular extension: 7.22. Codimension two: 7.24. Gauss–Manin residues: 7.28. Relative finiteness: new **7.6** (SW 10.5.1 via DLLZ-adic 6.3.5). Rigid resolution: 7.4(3) **narrowed** to U = X − D with a smooth proper X. |

Layer 7 old-to-new map:
- 1–5 → 1–5; 6–13 → 7–14; 14–27 → 16–29; 30–36 → 30–36.
- Old 28 and 29 are deleted.
- 7.6 and 7.15 are new.

## Departures from the accepted plan (packets unchanged)

These are additions or narrowings relative to the packets. A follow-up may want the packets brought into line.
- Targets added: 0.24–0.28, 1.4–1.5, 2.14, 3.11–3.12, 5.13, 6.1, 6.18, 6.25, 6.28, 6.31, 6.36, 6.37, 7.6 and 7.15.
- Targets deleted: old 6.17, 7.28 and 7.29.
- Scope narrowed:
  - Hodge-type data in Layers 7–8;
  - Siegel data with p ≥ 3 for 0.17 and 5.5–5.7;
  - finite K/ℚ_p in Layer 1;
  - descended abelian varieties in 0.18;
  - truncations of p-divisible groups in 3.5–3.6;
  - strict BHW range for p ≥ 3;
  - 7.4(3).
- `Suggested.lean`:
  - removed `LogAdic.PrelogRing`, `IsLog`, `trivialLog` and `trivialLog_isLog`, since the notion is §8.60's;
  - `BHWPositionRange` is now strict for p ≥ 3, with a new endpoint example at p = 5;
  - the docstring and closing list were updated.

## For the maintainer

- **PerfectoidShimuraVarieties S6** assumed general Shimura data. Non-Hodge-type data now need their own source (DLLZ-RH
  §§5.4–5.6: Patrikis CM motives, Margulis superrigidity, the congruence subgroup property), which no roadmap plans.
- **Hilbert–Siegel (GSp₄/F)** versions of 0.17 and 5.5–5.7 (BCGP §6) need the model identification with Lan's normalized
  models (Lan, IMRN 2017, Def. 8.5, Thms 8.6–8.7). ShimuraCompactifications does not state it. A Part II or a follow-up is
  needed if BCGP consumers require it. The same applies to the p = 2 modified bundles: PS16 Remark 1.10 is unproved.
- PrismaticCohomology's package (currently needs_changes) must keep §8.60 with the statements listed above. Layer 6
  depends on it.
- Unchanged from the review: AutomorphicBundles B4.21 and B5.20–5.22 expect HodgeTateVBInput and LogHodgeTateInput
  upward; PerfectoidShimuraVarieties 0.2–0.4 still plans the tower of 2.1–2.3; PadicFamilies cites T5 at the same tier.
- FAR10 Définition 5 prints the p^k-shift of χ as "+ k". 0.24 uses the additive normalization −kr.
- The source copies in scratch (DLLZ-adic, DLLZ-RH, CDM12, FAR10, FAR11, ZIE, PS16, AIPH, BHW, HALO, Lan 2017) matched
  the README's SHA-256 values. Scholze 2013 is arXiv:1205.3463v2 (SHA-256 prefix ed9187b3269adb7e). New locators were
  read in those copies. Liu–Zhu, Hansen, Lütkebohmert, Bartenwerfer, de Jong–van der Put and Scholze–Weinstein are cited
  only through the DLLZ pages that quote them.
