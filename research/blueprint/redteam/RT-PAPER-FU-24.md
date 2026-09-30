# Red team: PAPER-FU-24 (Fu, *Sharp bounds for multiplicities of Bianchi modular forms*)

Job `RT-PAPER-FU-24` (issue #4054), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-FU-24.result.json`, in the format of PROTOCOL section 17.

**Result:** 17 findings: 7 medium and 10 low.

- The extraction is careful and deep: 137 items, 6 routes and 7 source issues.
- All seven source issues stand, and I recomputed each one.
- Theorems 1.2–1.5 stand. Theorem 1.5 rests on Ardakov–Wadsley 2014, as E3 and E5 say.
- Most findings are about ownership: mathematics that the atlas now plans twice, either because extractions accepted later claimed it or because this session's own fix reports proposed it. The rest are library citations, missing definitions and errata bookkeeping.
- There are three new, harmless gaps in the paper (findings 15–17).

## Independence

- **Who did the work.**
  - The extraction is by Codex `codex-c83e7a` and `codex-a71f92` (checkpoints #1399, #1659 and #1672, 21–22 September). Claude Code `cc-442dc5` completed it (#2102, 23 September).
  - The review, REV-PAPER-FU-24, is by `cc-d67081` (#2382, 23 September).
  - The errata file is by `cc-fb70e5`, and its review, REV-ERRATA, is by `cc-442dc5`.
  - `cc-f805bf` appears in none of these files, nor in the register entries for this paper.
- **Disclosure.** This session wrote FIX-RT-AREA-automorphic-1 and FIX-RT-AREA-iwasawa-1. Three findings touch proposals from those reports:
  - **Finding 2.** Automorphic-1 /3 widened NE.0 and requested an Auslander-regularity node, but left the owner of uniform-group theory open.
  - **Finding 14.** Automorphic-1 /17 proposes a new sub-stage, `PadicMeasuresIwasawaAlgebras:L1:banach-representations`, for the same Schneider–Teitelbaum theorem as the item `banach-iwasawa-duality`.
  - **Finding 3.** Iwasawa-1 /34 requested the GL₂/F Eichler–Shimura–Harder injection from ALS.5, and its atlas search missed Fu's route 3.

  None of these proposals is applied on main yet. Each fix names both sides.

## What was read

- **arXiv:2201.11190v2,** fetched 30 September 2026.
  - It has 25 pages, and its SHA-256 is `d71e9d3f…2614`, the same as the extraction's.
  - I read all of it, §§1–7 and the references.
  - v2 is the last version.
- **The version of record,** Ann. of Math. 200 (2024), 123–152.
  - The NSF PAR copy timed out twice from here, and the Annals PDF paths return 404.
  - The Annals article page links no erratum, and Crossref's record carries no update relation.
  - My quotations are therefore from v2. The extraction and the review both collated v2 with print and report that the numbered statements agree. Findings 15–17 should be re-checked against the printed pages.
- **Schneider–Teitelbaum,** arXiv math/0206056v1 (hash as the extraction records it), §4, for finding 15.
- **The repository.**
  - All items, routes, briefs, prerequisites and source issues, and the review's diff (commit 5c504014).
  - The errata file and its review, and the REGISTER entries.
  - The cited layers:
    - ALS.0–ALS.6;
    - CC.0–CC.8 and the integrated CC decomposition;
    - PMIA L0, L0a and L1, and its packet;
    - LA L0 and L1, and its packet;
    - NE.0, and its packet;
    - the Tau Ceti LieHighestWeight README (conventions, Layers 3 and 7);
    - the Tau Ceti ProfiniteProPGroups README (Layer 9).
  - The overlapping extractions, with their dates: BCGP 25, Dospinescu–Le Bras 17, Ding 25, Calegari–Dimitrov–Tang 25, Scholze 15, Calegari–Geraghty 18, Fargues–Fontaine 18, Pan 26 and Venkatesh 19.
  - The queue and the design jobs. Fu's three Part II routes are grouped by parent into DESIGN-LieHighestWeightPartII, DESIGN-LocallyAnalyticDistributionsPartII and DESIGN-ArithmeticLocallySymmetricSpacesPartII, all pending.
- **The pinned libraries,** Mathlib `082e2d3` and Tau Ceti `f790474`.
  - All 36 cited declarations exist.
  - I searched `declarations.tsv` for Ore/Goldie, PBW, Casimir, completed group algebra and Iwasawa declarations.

## What holds up

- **The source issues, recomputed.**
  - **E1:** the cusp-torus Koszul complex has cohomology (1,2,1), which gives the bound 3c.
  - **E3:** with Fu's normalization dχ(h) ∈ Z_p, the induced set is {2λ(Δ)+1 a square in Z_p}. This is the closure of the λ_k, so Theorem 1.4 needs genericity only there. The review had left this normalization unchecked.
  - **E4:** p^a ∈ m^{a+1} whenever the ring is ramified.
  - **E5:** the radii r_n = p^{−1/p^n} lie outside the proved range.
  - **E7:** at r = p^{−2/3}, ‖Δ‖_r ≤ p^{2/3} < p.
  - **E2 and E6** stand as recorded.
- **Fu's computations.**
  - Lemma 3.3's count (d+1)², Theorem 3.2's majorant, and §6's graded dimension (n+1)².
  - Prop. 5.3's ‖X_i‖_{r_n} = p^{n−1}, which agrees with Dospinescu–Le Bras E11.
  - The integral claim of Prop. 3.4: I tested it by exact lattice computation for n ≤ 7. The index is a power of 2, so nothing fails at odd p.
- **Routes.**
  - Every missing item is routed once, and there is no cycle.
  - No route goes into a finished blueprint: the NE, PMIA and LA packets are partial, began after 23 September, and cite no Fu source yet.

## Findings

| # | Severity | Kind | Where | What |
|---|---|---|---|---|
| 1 | medium | duplicate | route 2: D(G), D_r, Fréchet–Stein, Frommer | DL17 route 3 (accepted 24 Sep) and Ding 25 route 1 plan the same in LocallyAnalyticRepresentationsOfLocalGroups. BCGP 25 route 18 says this roadmap supplies them once. Two pending design jobs would build them. |
| 2 | medium | duplicate | items 48, 51, 52 (route 2) and 100 (route 5) | NE.0's packet now plans uniform groups, the Σc_α b^α series and global dimension d+1, and says Lazard theory "has no owner", while route 2 claims it. Item 100 is still "missing". Auslander regularity and gl.dim Q_p[[G]] = d are unplanned. Touches automorphic-1 /3. |
| 3 | medium | duplicate | cuspidal-support-dictionary, bianchi-boundary-estimate; route 3 brief | The boundary sequence (ALS.2/ALS.4, as Scholze 15/91 cites it), Poincaré–Lefschetz duality (ALS.5) and the Eichler–Shimura–Harder injection (requested at ALS.5 by iwasawa-1 /34) are re-planned. The brief does not import them. |
| 4 | medium | library-claim | skew-rank | Ore's theorem for noetherian domains is in Mathlib: `IsNoetherianRing.strongRankCondition`, `nonempty_oreSet_of_strongRankCondition` and `DivisionRing R[R⁰⁻¹]`. Only flatness, the right-handed version and the rank API are missing. |
| 5 | low | library-claim | integral-sl2-pbw, free-lie-pbw, central-pbw-normal-form, integral-central-generators | Uncited Tau Ceti inputs: the PBW spanning half (`span_orderedPBWMonomials_eq_pbwFiltration`), surjectivity of Sym → gr U, and the central `glCasimir` (Δ = Ω − ½z²). |
| 6 | medium | missing | Theorem 1.4, (35)–(38) | No item defines H_i(G, M ⊗ W) = Tor^{Q_p[[G]]} with the diagonal twist. Route it to NE.0. |
| 7 | low | missing | §7, last step | Nothing covers the passage from the homology bound to H^{r1+r2}: universal coefficients (ALS.1) and V ≅ V^∨. Fu's "Poincaré duality" is the wrong tool. |
| 8 | low | error | items 24, 66 | LieHighestWeight Layers 3 and 7 are stated over algebraically closed fields, and Fu needs split g over Q_p. Add a descent step. |
| 9 | low | error | item 9 | Tau Ceti ProfiniteProPGroups Layer 9 plans `completedGroupAlgebra` Z_p[[Γ]]. The PMIA packet itself warns against a second carrier. |
| 10 | low | error | item 106 | CC.6 plans only cohomological descent. Fu's (38) is homological with W_k coefficients. Cite CC.4 and request the homological form. |
| 11 | medium | duplicate | errata file and result, E1–E7 | Each mistake is recorded twice with conflicting kind and affects (E1, E2, E5), so the register has 14 entries for 7 mistakes. |
| 12 | low | other | both files | sourceVersions is missing, and the errata file fails check_errata. The published copy is not in sourceArchives. The page count reads 31 in one place and 30 in another. |
| 13 | low | other | REV-ERRATA-PAPER-FU-24.md | The reviewer `cc-442dc5` says it "took no part in … the paper's extraction", but it completed the extraction 7 hours earlier. |
| 14 | medium | duplicate | banach-iwasawa-duality | The proposed `PadicMeasuresIwasawaAlgebras:L1:banach-representations` (automorphic-1 /17) plans the same ST02a theorem. |
| 15 | low | missing (E8) | Theorem 4.2 | ST03 Theorem 4.5(ii) gives noetherianity only for r ∈ p^Q, not for every real 1/p ≤ r < 1. Affects nothing. |
| 16 | low | missing (E9) | proof of Theorem 3.2 | Only k ≥ α is treated. The infinitely many strips k_i < α_i are not. The extraction's items fix it, but no sourceIssue records it. |
| 17 | low | missing (E10) | §7 and Theorem 1.2 | The spectral sequence is applied only at K_f = GK^p, and the reduction from an arbitrary K_f is not given. |

## The medium findings in brief

- **1. Distributions.**
  - Fu's route 2 was accepted on 23 September. On 24 September, REV-PAPER-DOSPINESCU-LEBRAS-17 accepted a route putting "(1) the distribution algebra D(H), Fréchet–Stein algebras and coadmissible modules … (2) Frommer's description of D_h(G)" in LocallyAnalyticRepresentationsOfLocalGroups.
  - BCGP 25 route 18 says the reverse: "Supply the algebra and coadmissible-module foundations ONCE to LocallyAnalyticRepresentationsOfLocalGroups".
  - Fix: route 2 owns them and the others import them. A note goes to the maintainer for the DL17 brief.
- **2. NE.0.**
  - The NE blueprint's NE.0 nodes (28 September) cover the definitions and series for uniform groups, Lazard's noetherian theorem and global dimension d+1.
  - Fix: NE.0 owns the group theory and the Iwasawa-algebra foundations. Route 2 keeps L_G and the analytic structure. Item 100 becomes planned at NE.0 for global dimension, and route 5 keeps Auslander regularity and the rational statement.
- **3. ALS.** Route 3 should import ALS.2, ALS.4, ALS.5:finite-level-duality and the Eichler–Shimura–Harder injection. It keeps only Fu's SL₂/F dimension count and the Bianchi cusp-torus bound. This session's /34 request should be widened to SL₂ and name Fu as a consumer.
- **4. Ore's theorem.**
  - The chain at the pin runs:
    - `IsNoetherianRing.strongRankCondition` (InvariantBasisNumber.lean:249);
    - then `nonempty_oreSet_of_strongRankCondition` (Dimension/Localization.lean:298);
    - then `DivisionRing R[R⁰⁻¹]` (OreLocalization/Ring.lean:210).
  - Fix: split the item.
- **6. G-homology.** Theorem 1.4 is stated in terms of H_i(G, M̃ ⊗ W_k), and nothing defines it. Fix: a new definition item, routed to NE.0 beside item 100.
- **11 and 14.** These are bookkeeping and ownership fixes on files outside the extraction.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-FU-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 2 files, 0 problems.
