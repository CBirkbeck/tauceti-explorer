# PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21: Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture

Raphaël Beuzart-Plessis, Yifeng Liu, Wei Zhang and Xinwen Zhu, *Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture*, [Annals of Mathematics 194 (2021), no. 2, 519–584](https://doi.org/10.4007/annals.2021.194.2.5); arXiv [1912.07169](https://arxiv.org/abs/1912.07169).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1113). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.result.json](PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.result.json). It has:
- 63 items: 6 planned, 57 missing;
- 3 routes: a new Part II and two coalesced routes;
- 25 prerequisite entries;
- 9 recorded source issues.

## Independent review (REV-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21)

The independent review (Claude Code, session cc-2aeb03, 23 September 2026) corrected this extraction in place. The review
report is `research/blueprint/reviews/REV-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.md`; the counts in the sections below it are
the earlier ones and are superseded by these.

- **Items: 128** (7 planned, 121 missing), each missing item routed once.
  - 20 bundled items split, one numbered result per item; 65 items added for the split-off results and for definitions,
    constructions and cited inputs the proofs use.
  - 98 fields corrected: 41 statements, 36 locators, 17 names, 4 kinds. None removed.
- **Routes.** All three stand; their briefs carry the confirmed corrections.
- **Prerequisites.** The 25 cited works checked against Crossref, and Jacquet–Shalika (1981) added.
- **Mistakes: 47 confirmed** (33 misprints, 7 gaps, 7 errors); 2 reach a stated result and 8 a proof.
  - **E1–E9** are confirmed; E1 and E4 are revised.
  - **E10–E47** are new, each checked independently. The main ones:
    - **E39:** Proposition 4.7 is applied to archimedean test functions in the completed Schwartz space, which
      Chaudouard–Zydor do not cover; Theorems 1.8–1.10 and 4.14 rest on this extension.
    - **E45:** Theorem 4.14(4) needs π cuspidal automorphic.
    - **E19, E25:** the infinitesimal characters are only contained in ⋃_ϑ h*_{ϑ,C} ⊕ Y*_ϑ (SU(2)).
    - **E16, E36:** errors in the proofs of Lemma 2.10 (θ must be finite) and Proposition 3.17 (M = G).
    - **E21, E34, E35, E43:** gaps in Lemmas 2.18, 3.12, 3.13 and Proposition 4.13, all fillable.
  - Theorems 1.1, 1.3 and 1.4 stand.

## Sources read

- **arXiv v3** (June 2021), read in full from its TeX source, with the PDF used for numbering and pages. Numbers and pages below are those of the arXiv PDF.
  - The source file is `GGP_Annals_fin.tex`.
  - It was posted as a "minor revision … to appear in Annals of Mathematics", three months before publication, and it thanks the referee. It is the authors' final text.
- **The Annals version** (pp. 519–584) is paywalled and was not compared.
- **Errata:** Crossref records no correction or update.
- **Cited inputs were not read.** Items resting on one state it as the paper uses it: Zydor, Chaudouard–Zydor, Zhang, Xue, Yun, Beuzart-Plessis, Delorme, Donnelly, Kostant and the others.

## What the paper proves

**The Gan–Gross–Prasad conjecture for U(n) × U(n+1) in the stable case (Theorem 1.8).** For hermitian cuspidal Π_n and Π_{n+1}, L(½, Π_n × Π_{n+1}) ≠ 0 if and only if some pair of cuspidal representations of unitary groups, with base changes Π_n and Π_{n+1}, has a nonzero unitary period.
- **Theorem 1.9:** every hermitian cuspidal Π_{n+1} has a partner Π_n with nonvanishing central value.
- **Theorem 1.10:** the Ichino–Ikeda conjecture holds in the tempered stable case.
- **What is new:** the earlier requirement of a split place where both representations are supercuspidal is removed. That removal is what applications to motives such as symmetric powers of elliptic curves need.

**The key new tool is isolation by multipliers.** The trace formula needs test functions that kill the whole non-cuspidal spectrum. Previously such functions were built from supercuspidal matrix coefficients, which also kill every cuspidal representation that is nowhere supercuspidal. The paper instead modifies an arbitrary test function by a *multiplier*.
- **Theorem 2.13.** On the Schwartz algebra S(G) of a real reductive group, every W-invariant holomorphic function μ with moderate growth along the sets attached to the real form gives a multiplier μ⋆ with π(μ⋆f) = μ(χ_π)π(f).
- **Why Schwartz functions.** Compactly supported functions admit only polynomial or exponential-type multipliers, a result of Delorme.
- **The proof** goes through rapidly decreasing μ, Delorme's theorem (extended to reductive groups in Appendix A), difference operators after Kostant–Kumar, Kostant's theory of tensoring with finite-dimensional representations, and Harish-Chandra's Plancherel formula. It ends with a limit argument.
- **Theorems 3.6, 3.7 and 3.19.** Combining these archimedean multipliers with spherical Hecke operators isolates the cuspidal components in which a given character occurs:
  - first kill all but finitely many components, using Donnelly's bound on cuspidal Casimir eigenvalues and a finite set of K-types;
  - then kill the remaining wrong ones with "mixed" multipliers in the style of Lindenstrauss–Venkatesh.

**The application (§4).** The paper runs Zydor's Jacquet–Rallis relative trace formulas for quasi-cuspidal Schwartz functions.
- Multipliers that are compatible under base change preserve smooth transfer (Proposition 4.8, through Beuzart-Plessis's local comparison of relative characters, Lemma 4.9).
- Chaudouard–Zydor's comparison of the geometric sides then gives the spectral identities.
- A byproduct is weak base change for unitary groups proved without the endoscopic classification (Proposition 4.13, Theorem 4.14).

## What the atlas already has

- **Planned (6 items):**
  - (g, K)-modules, infinitesimal characters and Casselman–Wallach globalisation (AF.1);
  - finiteness of cusp forms at fixed level, K-types and infinitesimal character (AF.2, AF.3);
  - the decomposition of L² over cuspidal data with pseudo-Eisenstein series (AS.4, AS.1);
  - Rankin–Selberg integrals (AL.3);
  - the Mok and Kaletha–Minguez–Shin–White classification (ML.4);
  - the Ginzburg–Rallis–Soudry descent (ML.5).
- **Pending:** the Gan–Gross–Prasad framework is in GanGrossPrasadConjecturesForClassicalGroups, proposed by PAPER-JIANG-ZHANG-20. Its brief names this paper as a consumer and reserves the Ichino–Ikeda conjecture for the first consumer that needs it.
- **Not planned anywhere:**
  - Schwartz algebras of real reductive groups and their multipliers;
  - Harish-Chandra's Plancherel formula;
  - Delorme's theorems;
  - the isolation of cuspidal spectrum;
  - the global Jacquet–Rallis relative trace formulas and their spectral comparison. The local layers (smooth transfer, the fundamental lemma) are pending in JacquetRallisRelativeTraceComparison, proposed by PAPER-ZHANG-21.

## Routes

1. **New Part II: `AutomorphicSpectralTheoryPartIISchwartzMultipliers` (31 items).** Title "Automorphic spectral theory and trace distributions, Part II: Schwartz multipliers and the isolation of cuspidal spectrum", area `automorphic`.
   - **What it carries:** §2, §3 and Appendix A, with their inputs: Weierstrass products, the spaces M_θ and N_θ, the Schwartz algebra, Harish-Chandra's Plancherel formula, Delorme, Kostant, Kostant–Kumar and Donnelly.
   - **Where it starts:** AutomorphicSpectralTheory owns the L²-spectrum and its decomposition, but only for compactly supported test functions. The Part II adds Schwartz test functions and isolation, which later relative trace formula papers in the queue also use.
2. **Coalesced with `JacquetRallisRelativeTraceComparison` (22 items).** The route keeps PAPER-ZHANG-21's id, title, parent and area: "Endoscopic transfer and unitary trace comparison, Part II: Jacquet–Rallis relative transfer and Weil-equivariant trace comparison", a Part II of EndoscopicTransferAndUnitaryTraceComparison.
   - **What the candidate already plans:** the local Jacquet–Rallis layers, namely relative quotients, matching, orbital integrals, smooth and partial transfer, the fundamental lemma and a partially linearised relative trace formula.
   - **What this route adds:** the global spectral layer of §4 and Theorems 1.8–1.10. That is Zydor's coarse relative trace formulas for Schwartz functions, Chaudouard–Zydor, Beuzart-Plessis's local comparison of relative characters, multipliers that preserve transfer, the Burger–Sarnak trick, Flicker, strong multiplicity one, and weak base change (Proposition 4.13, Theorem 4.14).
   - **Why coalesce:** this is the same comparison carried to the spectral side, so a second Jacquet–Rallis roadmap would split one proof method across two owners.
   - **Area:** the candidate's area is `modular`. That is the parent's group, not a galaxy id in `data/galaxies.json`. The route keeps it so that the two routes match, and its reason asks the review to correct both (to `automorphic`).
3. **Coalesced with `GanGrossPrasadConjecturesForClassicalGroups` (4 items).** The route keeps PAPER-JIANG-ZHANG-20's id, title and area. It carries:
   - hermitian representations (Definition 1.5);
   - weak automorphic base change (Definition 1.6);
   - the Ichino–Ikeda conjecture in Harris's formulation;
   - the local Gan–Gross–Prasad theorem for tempered unitary pairs.

## Source issues (`sourceIssues` E1–E9)

**Gap (E1): Proposition 4.13(1), the archimedean compatibility of weak base change.**
- **What the proof does.** It argues by contradiction from "weak base change does not exist". By Definition 1.6 that only concerns the split places, so the contradiction yields existence.
- **What it concludes.** It concludes more: that some cuspidal datum realises the full character, including its archimedean part, which is claim (1).
- **Where the gap is.** When the base change exists but is not cuspidal (an endoscopic π^V, which is not CAP), the character on the GL side is CAP. Theorem 3.6 then does not apply, and nothing in the argument reaches the archimedean component.
- **The fix is short.** Use the isolating multiplier of Theorem 3.19. If the character occurs in no cuspidal datum, R(μ′⋆f′) = 0, the test function is trivially quasi-cuspidal, and the spectral side vanishes, contradicting the nonzero unitary side.
- **What it affects.** Theorem 4.14(4) and the archimedean assertion of Lemma 4.16 rest on (1) in exactly the non-cuspidal case. Theorems 1.8–1.10 use only cuspidal Π_m and are not affected.

**Misprints.**
- E2: ν for μ in Definition 2.3, and μ for ν in Remark 2.7.
- E3: "Definition 2.8(2)" for (1) in the proof of Theorem 2.13.
- E4: |u| = 1 for |u| ≤ 1, and ‖·‖ for |·|, in the proof of Lemma 2.21.
- E5: "(3.9)" for the decomposition (3.2) in Theorem 3.19.
- E6: I_γ for J_{δ^V} after (4.4).
- E7: J_{π_0}(f^V) for J_{π_0}(f^V_1) in the proof of Proposition 4.11.
- E8: N(h*_C) for N(h*_C)^W in Proposition A.1.
- E9: swapped factors and K-type subscripts in a display of Appendix A.

## Prerequisites not yet covered

Twenty-five entries, with DOIs confirmed on Crossref (Ramakrishnan's paper by its arXiv id):
- **Jacquet–Rallis:** Zydor; Chaudouard–Zydor; W. Zhang; Xue; Yun; Beuzart-Plessis (the new proof of the fundamental lemma, the Plancherel formula for GL_n(F)∖GL_n(E), local relative characters, and Astérisque 418).
- **Harmonic analysis:** Delorme 1984 and 1986; Donnelly; Kostant; Kostant–Kumar; Harish-Chandra's Harmonic analysis I and III; Wallach; Aizenbud–Gourevitch; Sakellaridis.
- **Periods and L-functions:** Flicker; Ramakrishnan; Lindenstrauss–Venkatesh; R. N. Harris; Ichino–Ikeda; Müller.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.result.json` reports no errors.
