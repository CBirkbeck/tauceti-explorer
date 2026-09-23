# PAPER-NEWTON-THORNE-21-B: Symmetric power functoriality for holomorphic modular forms, II

James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms, II*, [Publications Mathématiques de l'IHÉS 134 (2021), 117–152](https://doi.org/10.1007/s10240-021-00126-4); arXiv [2009.07180](https://arxiv.org/abs/2009.07180).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1450). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-NEWTON-THORNE-21-B.result.json](PAPER-NEWTON-THORNE-21-B.result.json). It has:
- 37 items: 1 library, 10 planned, 26 missing;
- 4 routes: a source route, one new Part II and two coalesced candidates;
- 13 prerequisite entries;
- 2 recorded misprints.

## Sources read

- **The published version** (open access, CC BY 4.0), read in full. Page numbers below are the journal's.
- **arXiv v2** (27 September 2021) is the published text.
- **Errata:** no correction is recorded anywhere.

## What the paper proves

**The main results.**
- **Theorem A:** for every non-CM regular algebraic cuspidal π of GL_2(𝔸_ℚ), Sym^n π exists for all n.
- **Corollary B:** the completed symmetric power L-functions of every non-CM elliptic curve over ℚ are entire.
- **Appendix A:** the weight-one and CM cases.
  - It uses the Deligne–Serre projective images: dihedral, A_4, S_4, A_5.
  - The icosahedral case needs Kim's tensor-product transfers.

**The strategy.** Newton–Thorne I handled π with no supercuspidal prime. This paper inducts on the number of supercuspidal primes |sc(π)|, killing them one at a time as Khare–Wintenberger did for Serre's conjecture.

**Why a new lifting theorem is needed.** For p ≤ n, Sym^{n−1} of the residual representation is reducible.
- The residually irreducible lifting theorems (BLGGT14) do not apply.
- The ordinary residually reducible theorems (Allen–Newton–Thorne) do not apply either, because a supercuspidal π_p is never ordinary.

**The new lifting theorem (Theorem 2.1).**
- **Statement:** if π and π′ are weight-2, non-CM and non-ordinary, and are congruent with the same Steinberg places, then automorphy of Sym^{n−1}r_{π′} implies automorphy of Sym^{n−1}r_π.
- **The rings compared.** It patches two rings:
  - the rank-2 deformation ring R, acting through quaternionic forms;
  - the pseudodeformation ring P of conjugate self-dual semistable determinants of dimension n, acting through a definite unitary group.
- **The key input.** By the vanishing of adjoint Selmer groups (Newton–Thorne 2020), P_∞ is regular at the automorphic point.
  - So a single irreducible component through that point lies in the support of the unitary patched module.
  - The irreducible Spec R_∞ maps into that component.
- **What this avoids.** No dual Selmer control of Sym^{n−1} is needed.
- **The case p = 2.** It needs the Khare–Wintenberger twisting actions of Ĝ_m^γ.

**The induction (§3).**
- **Seasoned representations** (Definition 3.6) are good-dihedral at a prime q, with an extra Steinberg prime r.
- **Proposition 3.7** shows they have large residual image at each supercuspidal prime.
- **Propositions 3.9–3.11 and the proof of Theorem 3.1** run the induction, using:
  - Gee's lifts of prescribed type;
  - a non-ordinary weight-2 congruence built from types and Hida theory (Lemmas 3.4–3.5);
  - Theorem 2.1.

## What the atlas already has

- **Library (1 item).** Lemma 3.8 says the Galois group of a compositum is the fibre product over the intersection.
  - Mathlib has `IntermediateField.restrictNormalHomSupProd` and its injectivity.
  - Tau Ceti proves the range statement, `IntermediateField.mem_range_restrictNormalHomSupProd_iff`.
- **Planned (10 items):**
  - Theorem A and Corollary B (ML.3);
  - Appendix A (ML.1, ML.5);
  - Kisin's local rings (R08.4, R08.2, R22.6);
  - the deformation rings (R04.2–R04.3);
  - the quaternionic Taylor–Wiles modules (R22.2, R17.3);
  - patching (R03.5, R22.3);
  - good-dihedral primes (ClassicalSerreModularity R27.1, R33.2);
  - Gee's prescribed lifts (R24.3);
  - quaternionic forms and Jacquet–Langlands (R17.3, R19.2).

## Routes

1. **Source of ModularityAndLanglandsExtensions [ML.1, ML.3, ML.5]** (3 planned items): Theorem A, Corollary B and Theorem A.1.

2. **New Part II `SymmetricPowerAutomorphyLifting`** (24 items; parent ModularityAndLanglandsExtensions, area automorphic).
   - **Title:** "Modularity, automorphy and Langlands endpoint extensions, Part II: automorphy lifting for symmetric powers and the removal of supercuspidal primes".
   - **What it carries:**
     - Theorem 2.1 with its rings, Taylor–Wiles data, unitary Hecke modules, patching (p > 2 and p = 2) and the support argument;
     - the imported Newton–Thorne 2020 inputs;
     - all of §3's killing of ramification.
   - **Its siblings:** the two Part IIs proposed for Newton–Thorne I (merged in PR #2060):
     - `SymmetricPowersByAnalyticContinuation`;
     - `SymmetricPowersByUnitaryLevelRaising`.
   - **A different treatment exists.** PAPER-NEWTON-THORNE-26 (the Hilbert case, still partial) routed its analogous proof obligations as sources of ML.3 instead. The review should pick one treatment for the three Newton–Thorne papers.

3. **Coalesced with `SmoothRepresentationsPartII`** (1 item): Henniart's types for GL_2 (Breuil–Mézard appendix).

4. **Coalesced with `PolarizedAutomorphyLifting`** (1 item): the BLGGT14 Theorem 4.2.1 applications.

## Source issues (`sourceIssues` E1–E2, both misprints, checked on page images)

**E1 (p. 147).** The 3-adic image step in the proof of Theorem 3.1 cites Khare–Wintenberger for "Proj r̄_{π,ι}". It should read r̄_{π′,ι}, for three reasons:
- the good-dihedral form is π′;
- the next sentence uses an element of projective order t, which comes from π′_q;
- Lemma 3.4 is then applied to π′.

**E2 (pp. 130, 132).** Two index slips:
- Frob_ṽ should be Frob_w;
- ad r̄⁰(1) should be ad⁰r̄(1).

## Prerequisites not yet covered

Thirteen entries. All have DOIs confirmed on Crossref except Labesse 2011.
- **The key inputs:** Newton–Thorne 2020 (JEMS); Allen–Newton–Thorne; BLGGT14; Labesse.
- **Types and GL_2 inputs:** Gee 2011; Breuil–Mézard (Henniart's appendix); Buzzard–Diamond–Jarvis; Gee–Kisin.
- **Other inputs:**
  - Cline–Parshall–Scott; Böckle–Harris–Khare–Thorne;
  - Newton–Thorne 2016; Berthelot–Breen–Messing;
  - Kim 2004.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-NEWTON-THORNE-21-B.result.json` reports no errors, and every planned stage id exists in `data/atlas.json`.

## Review (REV-PAPER-NEWTON-THORNE-21-B, 23 September 2026)

The review accepted the extraction and all six routes after corrections made in place. It was done by Claude Code (session cc-38267a), and the full record is `research/blueprint/reviews/REV-PAPER-NEWTON-THORNE-21-B.md`. The review read the published PDF (the same file) in full, together with the arXiv v2 TeX.

- **Sources:** arXiv v2 is close to, but not identical with, the published text. The review found three copy-edits:
  - the proof of Proposition 2.5 cites ANT20 Proposition 2.5, where arXiv cites Bellaïche–Chenevier Proposition 1.5.1;
  - p. 148 says "potentially crystalline" twice, where arXiv says "potentially Barsotti–Tate";
  - p. 140 corrects ⊗_{v∈T} to ⊗_{l∈T}.
- **Statements corrected:**
  - Item 36 omitted the hypotheses of BLGGT14 Theorem 4.2.1 (CM base, polarization, l ≥ 2(d + 1), ζ_l ∉ F, irreducibility over F(ζ_l)).
  - Item 32 now records how the case 2 ∈ sc(π) must end (E3).
  - Item 34 no longer includes Gee's Theorem 4.6.1, which is now item 61.
  - Items 6, 15 and 18 name the Kisin paper they cite.
  - Planned layers were added to items 3 (R19.1), 6 (R08.5) and 7 (R04.4).
- **New items (24):**
  - **Planned (20):**
    - the definition of Sym^n π;
    - local Langlands and Weil–Deligne representations;
    - Galois representations of polarizable representations;
    - Gelbart's correspondence;
    - Newton–Thorne I Theorem B;
    - BCDT;
    - Godement–Jacquet;
    - Λ(Sym^n E, s);
    - the low-degree transfers;
    - ordinarity;
    - soluble base change and descent;
    - Labesse's base change;
    - Chenevier's determinants;
    - the unique decomposition of multiplicity-free determinants;
    - Cohen–Macaulay support;
    - Cline–Parshall–Scott;
    - Chebotarev;
    - Dickson;
    - Hida control;
    - the Khare–Wintenberger Ĝ_m^γ-invariants.
  - **Missing (4):**
    - the Ribet–Momose large-image theorem (a new source route to R19.3);
    - BLGGT14's relation ∼ and potential diagonalisability (to PolarizedAutomorphyLifting);
    - Gee's Theorem 4.6.1 (a new source route to R07.4–R07.5).
- **Routes:**
  - Items 8 and 17 moved from the new Part II to PolarizedAutomorphyLifting. They are the Newton–Thorne 2020 ring P and the vanishing of adjoint Selmer groups, which three extractions use, so they need one general owner.
  - The Part II brief was rewritten to state its imports and the corrections its layers must respect.
- **Source issues:**
  - E1 and E2 are confirmed.
  - **E3 (new, gap).** In the case 2 ∈ sc(π) of the proof of Theorem 3.1, the argument repeated with 3 replaced by 2 cannot end with Proposition 3.11, because π″ may have 3 ∈ sc(π″). It ends with the case already treated.
  - **E4 (new, misprints).** Notational slips in §2.

  None affects a stated result.
