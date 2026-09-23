# Review: PAPER-DASGUPTA-KAKDE-VENTULLO-18 (Dasgupta–Kakde–Ventullo, On the Gross–Stark conjecture)

Job `REV-PAPER-DASGUPTA-KAKDE-VENTULLO-18` (issue #1148), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-d67081`. **Verdict: accept**, after the corrections below, which were made in place. All four routes are accepted.

## What was read

- **The published paper**, Ann. of Math. 188 (2018), 833–870 (38 pp.), read in full again. It is free on the Annals site, with the same SHA-256 (974e6427…) as the extraction's.
- **arXiv 1605.08169v1**, the only arXiv version (same SHA-256 0bc900e2…), compared wherever the two differ.
- **Errata:** Crossref records no update and the Annals page links no erratum.
- **Method:**
  - Four checkers split the paper: §1 to Remark 1.1; §§1.1–2; §3; §§4–5. Each compared every item with the text and recorded mistakes checked on page images.
  - Checker 4 rechecked the determinant argument of §5 (signs and the factor r!) and found it consistent.
  - I checked the main new finding (E18) myself on the page images of both versions.

## Changes made to the extraction

- **Statements:** 27 corrected. Among them:
  - deligne-ribet wrongly excluded χ = ω^{-1}.
  - siegel now records that it does not give algebraicity of L(χ, 0) when R ≠ ∅.
  - The teichmuller-character gloss is fixed for p = 2.
  - ferrero-greenberg no longer adds a non-vanishing clause the paper does not make.
  - global-reciprocity has the closure in (24), without which it is false once [H : Q] ≥ 4.
  - pairing-compatibility has its sign and the local/global κ.
  - theorem-3-2 has the arXiv v1 normalisation (E18).
  - theorem-4-1(3) has the full shape of (53).
  - lemma-4-3 covers every 𝔭 | p.
  - lemma-4-7 has a correct inertia argument.
- **Locators:** 10 corrected. Proposition 2.2's proof and the Hilbert class field are on p. 845, not p. 846.
- **Statuses:**
  - **ineq-4:** planned (I.5) → missing, routed to the Part II. I.5 plans Wiles's main conjecture at odd primes only and not the deduction of (4). For p = 2 the paper uses Charollois–Dasgupta and Spiess.
  - **local-tate-duality:** re-pointed from R02.4, which takes local duality as an input, to ClassFieldTheory Layer 5 (finite modules) and ArithmeticGaloisDuality:D7 (lattice and rational coefficients).
  - The other planned stages were read and do plan their items.
- **Library citations:** dirichlet-unit-theorem (`NumberField.Units.rank` and `unitLattice_rank`) exists at Mathlib 082e2d3 and says what the item says.
- **New items (7):**
  - **1 library:** ord_{s=0} and derivatives of p-adic analytic functions (`analyticOrderAt`, `iteratedDeriv`).
  - **6 missing:**
    - 5 to the Part II: Gross's R_p(χ) ≠ 0 for r ≤ 1; units of a CM field have no odd component; U_χ is spanned by the u_χ; the completed Hecke algebra T_m ⊂ ∏Λ_{m_H}; the degree-r layer of W_1, W_2, W_3.
    - 1 to AutomorphicPadicLFunctions: the Eisenstein series E_k(ψ, η) and the family E(χ, 1).
- **Part II brief:** a corrections paragraph covers E18, the inequality (4), Lemmas 4.3 and 4.7, the heuristic (16) and dim W_2.
- **Summary:** a closing paragraph gives the counts after the review.

## Mistakes in the paper (`sourceIssues`, E1–E35)

- **Of E1–E9:**
  - **E1 is rejected.** The independence left to the reader after Theorem 3.8 is routine. It uses the paper's own device of applying powers of Y and comparing leading terms, and W_3 has a one-dimensional socle.
  - **E8 is rejected.** arXiv v1 numbers one lower from (2) on, so its (20) is the published (21), and the citation is right.
  - **E2** is confirmed. Its "except when L*_an(χ) = 0" never applies, so for r ≥ 2 the map φ′ does not exist at all.
  - **E3** is confirmed, but it does not recur in (87).
  - **E9** is confirmed, but it is not the only arXiv slip corrected in print; see E11–E13.
  - **E4–E7** are confirmed as recorded.
- **E10–E35** are new.
  - **E18 (gap in the proof):**
    - The published Theorem 3.2 omits arXiv v1's normalisation ν_1(t)(E_1(1, χ_S)) = E_1(1, χ_S).
    - As printed, t = 0 satisfies it, but Theorems 3.3, 3.6 and 3.8 need ν_1(F) = E_1(1, χ_S) ≠ 0.
    - The fact is proved in the cited work and restated informally in §1.3, so restoring the clause repairs the proofs.
  - **E16 (gap in the outline, affects nothing):** the row-sum argument for (16) in §1.4 gives vanishing only modulo m·B·B_{p_2}⋯B_{p_r}. §5.1 does it correctly.
  - **Errors that affect nothing:**
    - **E26:** Remark 3.7's "U_l ↦ 1 (l | n)" contradicts Theorem 3.6.
    - **E32:** Lemma 4.7's "the image of inertia is pro-ℓ and B̄ is pro-p" is false. The conclusion holds by another argument.
  - **22 misprints:**
    - E11–E13 are arXiv v1 slips corrected in print.
    - The others include λ for 𝔩, the definition of v_{𝔭,𝓗} for 𝔭 ∈ R only (used at R′), dim W_2 = 2^{r_an} + … for 2^r + …, a sum from i = 1 in (70), 𝔪_W𝔶 mixing two rings, and L*_an(χ) for L*_an(χ^{-1}) after (89).
- **Effect:** Theorem 1 stands.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once, and every stage id exists in the atlas.
