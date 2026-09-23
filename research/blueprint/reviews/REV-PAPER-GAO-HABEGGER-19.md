# REV-PAPER-GAO-HABEGGER-19: review of the Gao–Habegger extraction

**Verdict: accept, after corrections made in place.** All nine routes are accepted.
- **Status and items.** One status changes (the Weil height moves from library to planned). Fifteen items are corrected and one is added.
- **Source issues.** E1–E17 are confirmed, and ten new issues are added. They include gaps in the proofs of Propositions 4.1 and 9.1 and a false kernel statement in the introduction, all repairable.
- **Paper.** Gao–Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*, Ann. Math. 189 (2019) 527–604.
- **Extraction.** cc-fb70e5, issue #1135.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **arXiv 1801.05762v3.** Read whole; the SHA-256 is the same as the extraction's (`ffe408dc…f34e`).
- **The published version.** The extraction reported it inaccessible, but the journal site serves it (annals-v189-n2-p03-s.pdf, 78 pages, SHA-256 `09304f58…3bfd`). It was collated with v3 by word diff and at every finding.
  - The statement numbering and the mathematics are unchanged.
  - Every recorded mistake is present in it.
  - E11 is half-corrected there.
  - Three section headings acquired wrong numbers (E27).
- **Method.** Three read-only helper agents of this session split the paper:
  - §§1–4 and Appendix B;
  - §§5–6;
  - §§7–11 and Appendices A and C.

  Every finding below was checked by the reviewer at the page image or re-derived.

## 1. Items

Corrections made in place:
- **Item 6.** It repeated the paper's false kernel. The Néron–Tate height over K = k(S̄) vanishes exactly on τ(A^{K̄/k}(k)) + A_tor, not on (A^{K̄/k} ⊗ K̄)(K̄) + A_tor (E18).
- **Item 30 (semi-rational Pila–Wilkie).** As extracted, it counted rational points; it now counts distinct values of the non-rational coordinates, as the paper does on pp.19–20. It also records that the path is taken with γ(0) ∈ Γ and a(0) ∈ ℤⁿ.
- **Item 41 (Lemma 5.6).** It had weakened the conclusion to the trace over the algebraic closure. The paper proves, and Lemma 5.8 needs, the ℂ(S)/ℂ-trace.
- **Item 71 (Theorem A.3).** Now stated over k₀ as the paper does, with the misprinted h^B_{S,M}(P) corrected to h^B_{S̄,M}(π(P)) (E24).
- **Item 22 (Lemma B.2).** Restricted to its actual statement.
- **Item 31.** Reads exp(y(0)) + G and cites Ax 1972.
- **Items 44, 45, 57, 59.** Their standing hypotheses are restored: the admissible setting, F algebraically closed in ℂ, the conditions on P, and irreducibility of Y′.
- **Item 63.** Now points to the global base-change comparison that Proposition 9.1 actually needs (E25).
- **Notes and locators.** Notes on items 3, 23 and 25; locator of item 74.
- **New item 76.** Koizumi's projective normality, which the admissible immersion (A2)–(A3) and Appendix C use without citation. Routed to AbelianSchemesAndArithmeticModuli.

## 2. Statuses

**Item 9 was wrongly marked library.** The absolute logarithmic Weil height on ℙⁿ(Q̄) is not in Mathlib:
- `Projectivization.logHeight` (Height/Projectivization.lean:51) is relative to a field with `Height.AdmissibleAbsValues`;
- for a number field it is not normalized by the degree;
- Mathlib has no Q̄ version.

RP.0 plans normalized absolute heights, so the item is now planned.

The other planned layers are right, checked against `data/atlas.json`: RP.0, RP.5, R11.1, R11.5, LD.6, A5, A6 and GN.1.

## 3. Routes

Every missing item is routed exactly once (66). The Part II ids and titles agree with the other papers using them:
- AbelianSchemesBettiMapsPartII, with DIMITROV-GAO-HABEGGER-21 and GAO-GE-KUHNE-26;
- DegeneratingHodgeStructures, with BAKKER-KLINGLER-TSIMERMAN-20 and BENOIST-19;
- ArakelovGeometryAndAbelianHeightsPartII and the uniformity Part II, with YUAN-26.

All routes are accepted.

## 4. Mistakes in the paper

**E1–E17: confirmed.** All seventeen are confirmed at their locators and are present in the published version. Refinements:
- **E2.** The correction is S̄′ ∖ Z.
- **E4.** A helper checked the corrected constant in PARI/GP.
- **E8.** It also covers the false sentence "dim Y ≥ 2 … so we are not in the minimal case" (p.28).
- **E11.** Only half-corrected in the published version (p.570).
- **E16.** Also covers ĥ_{K′,A′}.

**Ten new issues.** Page numbers are arXiv / published:

| id | kind | where | what |
|---|---|---|---|
| E18 | error | p.2 / 528 | the Néron–Tate kernel is τ(A^{K̄/k}(k)) + A_tor; a constant curve over Q̄(t) has K̄-points of the trace with positive height |
| E19 | gap | pp.16–18 / 545–547 | the proof of Proposition 4.1(ii)–(iii) treats a cohomological identity as an identity of forms; a trivialization with holomorphic leaves need not have the Betti fibres as leaves. Repair: the holomorphic relative exponential |
| E20 | error | p.12 / 541 | in §3.1 the point P must be torsion |
| E21 | misprint | p.58 / 595 | Appendix B needs A over K, not K̄ |
| E22 | misprint | p.29 / 561 | the sum of subgroup schemes is 𝒜, not ℬ |
| E23 | gap | p.32 / 565 | in Proposition 6.1(ii) with n = 1, reduced-fibre smoothness does not give smoothness of Z; use the Bertini transversality |
| E24 | misprint | p.56 / 593 | Theorem A.3 should read h^B_{S̄,M}(π(P)) |
| E25 | gap | p.49 / 585–586 | Silverman's inequality on X′₀ does not control [2^N]Q; the global comparison h_𝒜∘ρ ≍ h_{𝒜′} does |
| E26 | misprint | p.46 / 581 | S for S′, four times, in §8.3 |
| E27 | misprint | published pp.541, 560, 567 only | section headings cite Proposition 2.1, Theorem 4.1 and Proposition 5.1 for 3.1, 5.1 and 6.1 |

None affects a stated theorem.

**Noted but not registered:**
- "endomorphism" for automorphism in Remark 4.2;
- "condition (ii)" for (A2) on p.47;
- the overstatement after Proposition 8.1 (zero-dimensional components);
- the under-justified monodromy step in the proof of Theorem 5.1;
- cross-reference, citation and notation slips (Ax [2] for [3]; "B_s ∈ 𝒜_s").

## Checks

- `python3 scripts/check_paper.py` on the extraction: ok.
- The intake `check-files` on the four deliverables passes.

Lean: none.
