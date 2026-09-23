# PAPER-ABE-18: Langlands correspondence for isocrystals and the existence of crystalline companions for curves

Tomoyuki Abe, *Langlands correspondence for isocrystals and the existence of crystalline companions for curves*, [J. Amer. Math. Soc. 31 (2018), 921–1057](https://doi.org/10.1090/jams/898); arXiv [1310.0528](https://arxiv.org/abs/1310.0528).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1430). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-ABE-18.result.json](PAPER-ABE-18.result.json). It has:
- 52 items: 1 planned, 51 missing;
- 2 routes: 1 coalesced Part II and 1 new Part II;
- 16 prerequisite entries;
- 27 recorded source issues.

## Sources read

- **arXiv v3** (9 April 2018), read in full from its TeX source and PDF. Numbers and pages below are those of the arXiv PDF (134 pages). v3 postdates acceptance: its acknowledgements thank the three JAMS referees.
- **The journal version was unreachable.** ams.org returns HTTP 403 to scripts and to WebFetch, and no author copy of the published text turned up. The published text may differ from v3; `searched` says so in every issue.
- **Errata:** Crossref records no correction. Later work that builds on the paper (Kedlaya, *Notes on isocrystals* and *Étale and crystalline companions I*; Abe–Esnault 2019) names no error in it.
- Background agents read §1, §2, and §3 with the appendix line by line. I read the introduction and §4.
  - I checked every issue recorded from the agents against the TeX before keeping it.
  - I dropped points that rest on conventions I could not settle, such as the normalisations in §2.4.2 and Lemma 2.3.27.

## What the paper proves

**Main theorem (Theorem 4.2.2).** Let X be a proper smooth geometrically connected curve over F_q with function field F. Irreducible rank-r Q̄_p-isocrystals with finite determinant on open subsets of X correspond, in the sense of Langlands, to cuspidal automorphic representations of GL_r(A_F) with finite central character. The correspondence matches Frobenius and Hecke eigenvalues and the local L- and ε-factors of pairs.

**Corollary (Theorem 4.4.1).** Every lisse ℓ-adic sheaf with finite determinant on a curve has a crystalline companion. This is Deligne's conjecture 1.2.10(vi), the *petits camarades*.

**The method (§4).** It is L. Lafforgue's proof, run with p-adic cohomology.
- The p-adic *principe de récurrence* (Abe, Crelle 2018, with the Abe–Marmora product formula for p-adic ε-factors) reduces the theorem to constructing A_r → I_r.
- That map comes from the compactly supported cohomology of Lafforgue's moduli of shtukas Cht^{r,p̄≤p}_N/a^Z, their compactification, and the open Cht-bar′:
  - boundary cohomology is r-negligible (the p-adic Lafforgue VI.17);
  - the essential part is pure of weight 2r − 2 and sits in degree 2r − 2;
  - Hecke operators act on it through the negligible/essential filtration;
  - their traces are transported from Lafforgue's ℓ-adic computation by the ℓ-independence of traces of correspondences;
  - Čebotarev density and L-function arguments identify H_π = q′^+E_π ⊗ q″^+E_π^∨.

**The foundations (§§1–3 and appendix).** To make this possible, the paper builds a six-operation formalism for holonomic arithmetic D-modules beyond realizable schemes.
- **§1**, on realizable schemes (Caro, Abe–Caro): Beilinson's equivalence, Ind-categories, the constructible t-structure, extension of scalars to Q̄_p with Frobenius structures, and trace maps for flat morphisms with Poincaré duality.
- **§2**, derived categories on algebraic stacks by simplicial presentations, then the full six operations on admissible (finite-diagonal) and c-admissible stacks:
  - duality, relative Poincaré duality, projection formula and Künneth;
  - weights;
  - a partial formalism on Con(−) for stacks locally of finite type;
  - Weil groups of isocrystals.
- **§3**, cycle classes and correspondences on stacks, and ℓ-independence of their traces (after Kato–Saito).
- **Appendix**: Beilinson–Drinfeld gluing, lemmas on stacks, the Lefschetz formula and L-functions, Čebotarev density, and Gabber–Fujiwara ℓ-independence on stacks.
- **§4.4**, applications: mixedness of holonomic complexes on curves, Čebotarev density for isocrystals, and converse companions under a Bertini-type conjecture. Later work of Abe–Esnault and Kedlaya made these unconditional.

## What the atlas already has

- **Planned (1 item).** Lafforgue's moduli of shtukas, their compactifications, Res and the Hecke correspondences: GlobalShtukasAndFunctionFieldLanglands GS.6 (L. Lafforgue's GL_n correspondence: compactifications of shtukas and boundary analysis), on top of GS.2.
- **Pending.** Arithmetic D-modules are pending in PadicDifferentialEquationsPartIIArithmeticDModules, proposed by PAPER-XU-ZHU-22 (merged). Its brief names this paper as the main source of its middle stages.
- **Not planned anywhere:**
  - p-adic coefficients in the function-field Langlands programme;
  - crystalline companions.
- **Pending companion proposals that leave the crystalline side open:**
  - PadicDifferentialEquationsPartIIRigidCompanions (PAPER-ESNAULT-GROECHENIG-20) source-gates "Abe's crystalline shtuka realization" as an outside input;
  - GlobalShtukasPartIICompanions (PAPER-KLEVDAL-PATRIKIS-25) states that it produces no crystalline companion.

## Routes

1. **Coalesced Part II: PadicDifferentialEquationsPartIIArithmeticDModules (34 items).** §§1–3 and the appendix go here.
   - The route keeps the candidate's id, title and area.
   - It adds the targets this paper supplies:
     - gluing D^b_hol beyond realizable schemes;
     - stacks and the six operations on (c-)admissible stacks, with weights;
     - trace maps and cycle classes;
     - ℓ-independence of traces of correspondences;
     - the appendix's Lefschetz, Čebotarev and Gabber–Fujiwara statements.
   - It asks for the corrections listed below.
2. **New Part II: GlobalShtukasPartIICrystallineCompanions (17 items).** "Global shtukas and Langlands over function fields, Part II: the Langlands correspondence for isocrystals and crystalline companions" (area `functionfields`).
   - It carries §4 and the introduction's conjecture.
   - It imports Lafforgue's geometry and his ℓ-adic essential-part computation from GS.2 and GS.6, and the p-adic machinery from route 1.
   - It source-gates the local p-adic ε-factor theory behind the principe de récurrence if no roadmap owns it.
   - It records the coordination: the rigid-companions Part II should import Theorems 4.2.2 and 4.4.1 from here rather than source-gate them, and the Klevdal–Patrikis Part II stays the ℓ-adic group-valued owner.

## Source issues (`sourceIssues` E1–E27)

**Errors and gaps in the foundations.**
- **E11 (error).** The modified dual on stacks is defined with the twist +d_{X_i/𝔛}; it must be −d. With +d the gluing isomorphism β_φ fails for Frobenius structures (e.g. BG_m).
- **E12 (error).** Lemma 2.2.4(iii) and Remark 2.3.1(ii) need 'surjective'. f : ∅ → 𝔆′ is finite flat.
- **E13 (gap, the proof).** The weight bound for push-forwards along projections (2.2.32(6)) does not follow from the cited E_1 estimate, which falls short by the simplicial degree (BG). Theorem 2.3.38(i), used in §4, rests on it; for admissible stacks it can be recovered through finite flat surjections from schemes.
- **E14 (gap, the proof).** In the proof of smooth descent (Proposition 2.1.13):
  - a smooth surjection onto Spec k(s) need not have a section;
  - testing at closed points is not justified on the Ind-category.
- **E4 (error).** Remark 1.1.2's isomorphism F^*(M^σ) ≅ F′^*(M^{σ′}) and the claimed equivalence of Frobenius structures for two lifts σ, σ′ are false: the Dwork isocrystal with σ′(π) = ωπ is a counterexample. The independence of Hol(X/K) still holds because σ^N = σ′^N.
- **E8 (gap, the proof).** The proof of the Corollary of Lemma 1.4.11 uses (k′, R′, K′, K′, s, id), which is not an arithmetic base tuple when k′ ≠ k.

**§3.**
- **E18 (error, the proof).** d_{Γ′∘Γ} = d_Γd_{Γ′} and 'norm is a ring homomorphism' fail for stacks with generic stabilisers: for BZ/2, Γ ∘ Γ is two copies of Γ, each with d = 2. §4.3.17 uses norm ∘ ϱ for the Hecke action.
- **E19 (error, the proof).** The Remark after Lemma 3.1.8 (generic flatness of p_1 on a dense open of S) is false for correspondences with non-dominant components. Corollary 3.2.1 is stated in that generality; its use in §4 is unaffected.
- **E20 (gap, the proof).** "The normal cone of an l.c.i. morphism is a vector bundle" holds for regular immersions only (the rank would be negative for A¹ → Spec k). The proof of Theorem 3.2.1 applies Lemma 3.2.6 to an alteration.

**Appendix.**
- **E22.** The Lefschetz formula A.3.2 needs F_x^{n/deg x}, not F_x^n. For X = Spec k_2 the printed version gives 2c⁴ against 2c².
- **E24.** The stacky trace formula A.5.1 is false for n ≥ 2 as stated (Spec F_{q²}).
- **E25.** Definition A.5.2 of compatible systems compares traces of F on induced objects, which vanish at points of degree > 1.
- **E26.** Lemma A.2.2 needs a finiteness hypothesis (infinitely many doubled points).

**Misprints.**
- E1: the pole corollary in 4.3.3 has E′(−t) for E′(t).
- E2: the (S)_1 decomposition has χ′_p for χ″_p.
- E3: the Weil II reference has the wrong pages and year.
- E5: an ill-typed display in 1.1.5.
- E6: the direction of R(H⁰f^!) in 1.2.9.
- E7: "(a ⊗ 1)φ = (1 ⊗ a)φ = 0" in 1.4.2.
- E9: "left adjoint" for Hom.
- E10: (Var 3) needs f ∘ g ∈ 𝔐_{d+e}.
- E15: "p = 1" for p = 0 in 2.3.17.
- E16: simplicial indexing.
- E17: an index clash in Theorem 2.2.20.
- E21: the codimension of c_Γ.
- E23: the proof of A.3.2.
- E27: the proof of A.4.1.

None of these is known to invalidate the main theorems, which later work has built on.

## Prerequisites not yet covered

Sixteen entries, with DOIs checked on Crossref:
- L. Lafforgue, Invent. Math. 2002;
- Abe, Crelle 2018; Abe–Marmora, JIMJ 2015;
- Abe–Caro on Beilinson's equivalence and on weights; Caro on overholonomic modules;
- Tsuzuki, Duke 2002;
- Kedlaya's semistable reduction I and IV;
- Laszlo–Olsson; Kato–Saito, Annals 2008; Drinfeld on Deligne's conjecture;
- Etesse–Le Stum;
- Abe–Esnault 2019; Kedlaya, *Étale and crystalline companions I*;
- Crew 1992.

Each entry says what the paper takes from it.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-ABE-18.result.json` reports no errors.

## Independent review (`REV-PAPER-ABE-18`, issue #1431)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept**, both Part II routes accepted,
all 27 findings confirmed, one `affects` field corrected in place. The full review is in
[`reviews/REV-PAPER-ABE-18.md`](../reviews/REV-PAPER-ABE-18.md).

Both recorded hashes match byte for byte. Simulating the shared counter independently gives the same
**243 numbered objects**, with the appendix lettered `A` — the reading the locators need — and
**coverage is complete**: the ten uncovered numbers are nine bare subsubsection headings and one remark.
The single `planned` item's two layers exist in `data/atlas.json`. Both routes reproduce their parent's
title verbatim, as PROTOCOL §15 requires, and neither duplicates existing atlas material: the p-adic
differential equations Part II is already proposed by `PAPER-XU-ZHU-22` with the same parent, and the
shtukas parent is ℓ-adic throughout, with no atlas coverage of isocrystals or companions.

All **27 findings quote the source verbatim and all 27 are confirmed**. Several are settled by the paper
against itself — the Corollary of §4.3.3 writes `E′(−t)` where the Proposition it comes from writes
`E′(t)`; `Tr_f ∈ Ext⁰` comes from `E_1^{0,0}`, not `p = 1`; the appendix's own `L_x(E,Z) =
det(1 − Z^{deg(x)}F_x)^{−1}` shows `F_x` is the `q^{deg x}`-Frobenius, so A.3.2's sum needs
`F_x^{n/deg x}`. Three by computation: the Dwork comparison map `exp((ω−1)πx)` has coefficients of
absolute value `p^{−s_p(n)/(p−1)}`, which do not tend to 0, so Remark 1.1.2's display is not an
isomorphism (E4); `Spec F_{q²}` over `F_q` at `n = 2` makes the stacky trace formula read `2 = 0` (E24);
and the `E_1` weight bound in §2.2.32 falls short of the abutment by the simplicial index (E13).

The one correction: **E4's `affects`**, from `nothing` to `the proof` — the display is the whole
justification of Remark 1.1.2, and the remark is used inside the proof of Lemma 1.4.11. The remark's
conclusion stands, but the entry's repair (`σ^N = σ′^N`) is a sketch, and the review says so.
