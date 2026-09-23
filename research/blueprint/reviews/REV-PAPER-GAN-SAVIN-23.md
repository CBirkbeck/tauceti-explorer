# Review: PAPER-GAN-SAVIN-23 (Gan–Savin, Howe duality and dichotomy for exceptional theta correspondences)

Job `REV-PAPER-GAN-SAVIN-23` (issue #1251), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-d67081`. **Verdict: accept**, after the corrections below, which were made in place. All four routes are accepted, including the new roadmap ExceptionalThetaCorrespondencesForG2.

## What was read

- **arXiv 2102.00372v1** (31 January 2021, 56 pp., the only version; same SHA-256 8b3b6702… as the extraction's) and its TeX, read in full again by four checkers: §§1–4, §§5–8, §§9–12 and §§13–15.
- **The published version**, Invent. Math. 232 (2023), 1–78, is closed access, and the authors' homepages give no copy.
- **Errata:** Crossref has no update relation.
- **Checks on page images:** every mistake was checked on a page image. Checker 4 verified the top exponents of Propositions 13.1, 13.3, 13.5, 13.6 and 13.7 against the infinitesimal character of the E_7 minimal representation with an exact Weyl-group computation.

## Changes made to the extraction

- **Statements:** 29 corrected. Among them:
  - Propositions 3.1 and 3.2 now have the correct quotients J_Q(1, ·).
  - The generic-supercuspidal lifts, the L-packets and the G_2 × Aut(J) dual pairs are stated exactly.
  - Five §13 items now write the top pieces as Π_{𝒩_i}, coinvariants for the E_7 radical, not Π_{N_i}.
  - The classical-Howe-duality item names the right third dual pair.
  - Corollary 15.7 has PGL_3 ⋊ Z/2Z.
- **Locators:** 6 corrected.
- **Statuses:** unchanged. smooth-rep-tools is only partly planned, since no stage plans the Langlands classification or Casselman's criterion; they are added as a new item. The library item (Tau Ceti's octonions) was checked at f790474.
- **The extraction's repairs:** both are **sound**: prop-3-1 (E3) and pgsp6-roots (the quadratic form). pgsp6-roots still carries the incomplete hyperplane list of E39.
- **New items (20):**
  - **1 planned:** local Jacquet–Langlands for PGL_2 and PB^× (ET.6).
  - **19 missing:**
    - 9 to the new roadmap: depth-zero unipotent supercuspidals, wave-front sets of G_2, Shahidi's criterion, Savin–Weissman, the E_7 parabolics, the null-subspace orbits, Gan–Gurevich's isotypic quotients, the see-saw identity (14.3), and the restriction of Π_{A_5};
    - 8 to SmoothRepresentationsOfLocalGroups;
    - 2 to MetaplecticAutomorphicForms.
- **New-roadmap brief:** a corrections paragraph lists the constraints below.

## Mistakes in the paper (`sourceIssues`, E1–E52)

- **E1–E22**, the extraction's, are all confirmed. The review sharpened the reach of the unproved steps:
  - **E20:** Proposition 5.4, the Mackey decomposition of I_E(s)|_{G_2}, has no proof. It carries Proposition 5.5, the weak dichotomy, Theorem 6.1, Propositions 6.6–6.7, Theorems 7.2 and 8.5, and the later uses in §§12 and 15.
  - **E10:** the twisted Jacquet module of §11.4 is asserted without argument. It carries Proposition 11.7, Lemma 12.1, Propositions 12.2–12.3, Theorem 12.4 and Corollary 12.5 for generic tempered π. Savin–Weissman bypass it only for generic supercuspidal τ.
  - **E12, E13, E22:** the omitted cases of Lemma 13.8, the P_1 case (Proposition 13.6) and Theorems 15.2–15.3 carry Theorems 14.1, 6.1, 12.4 and 15.1, Corollary 15.7 and Theorem 1.3(ii).
  - **E21:** without Z/2Z, Lemma 8.1(ii) is Gross–Savin's Lemma 2.9. The unproved content is which extension is τ^+. Lemma 8.3 matters only when p = 2.
  - **E3:** the same display has a second misprint; see E25.
- **E23–E52** are new: 19 misprints, and the following.
  - **E30 (error, a stated result):** the genericity clause of Theorem 8.2(i) and the "if" direction of Theorem 8.5(iii) fail.
    - Take τ = Ind(|·| ⊗ μ ⊗ |·|^{−1}μ^{−1}) with μ unitary and μ² ≠ 1. It is generic and nontempered.
    - θ(τ^+) carries the L-parameter φ_τ composed into G_2 (functoriality, [GS04]). The G_2 standard module for that parameter is reducible, so by the standard module conjecture its Langlands quotient is nongeneric.
    - Restrict the clause to tempered τ. Theorem 8.5(v) is unaffected.
  - **E29 (error, a stated result):** §8.1 lists the nongeneric self-dual representations of PGL_3 but omits the trivial one, so 1^± is undefined in Theorems 8.2 and 8.5.
  - **E42 (gap):** Proposition 10.4 rests on Shahidi's method, which covers only generic supercuspidals. §15 applies it to the non-generic Saito–Kurokawa τ_ρ. A Plancherel-measure argument for the L-packet would fill it.
  - **E47 (gap):** the split case of Proposition 13.3 is unproved.
  - **E34, E35 (gaps; short fixes):** Lemma 6.4's E must be a field for J = D^+; the second case of Proposition 5.5 is not treated.
  - **E49, E50 (errors in proofs):** in §13.4, no character δ′ makes Proposition 13.7's displayed action give (2)–(3), and the proof of Lemma 13.8 puts B̄ in the wrong factor of M_2.
  - **E25–E26 (misprints):** the quotients in Propositions 3.1(iii) and 3.2(iii) are J_Q(1, ·), not J_Q(1/2, ·). An exponent-length check and Aubert–Xu (citing Muić) confirm this.
  - **Errors that affect nothing:**
    - E23: the octonion rank-2 claim fails for x = 1 or x = 1 + n; it holds on trace-zero elements.
    - E39: §9 lists 6 of the 9 root hyperplanes of PGSp_6.
    - E45: the remark after Proposition 12.2 overstates Savin–Weissman.
- **Effect:** Theorems 1.1 (dichotomy) and 1.2 (Howe duality) are presumably true. Their arXiv v1 proofs are incomplete in the places listed, and the published version could not be checked.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-SAVIN-23.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once, and every stage id exists in the atlas.
