# Review: PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 (Andreatta–Goren–Howard–Madapusi Pera, Faltings heights of abelian varieties with complex multiplication)

Job `REV-PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18` (issue #1144), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5` and Codex session `a71f92`. **Verdict: accept**, after the corrections below, which were made in place. All eleven routes are accepted.

## What was read

- **The published version**, Ann. of Math. 187 (2018), 391–531, 141 pp., read in full again. It is free on the Annals site, with the same SHA-256 (e1274468…) as the extraction's.
- **Method:**
  - Four checkers split the paper (§§1–3; §§4–5; §§6–7; §§8–9). They compared every item with the text and with the authors' Colmez_v3.5, and recorded mistakes checked on page images.
  - I checked every library citation and stage id, and the four Part II titles.

## Changes made to the extraction

- **Statements:** 77 corrected, mostly dropped hypotheses (above all "p a good prime"), missing definitions and wrong attributions. Among them:
  - product-formula and vandermonde cite results the paper never uses.
  - polarized-cm-family wrongly restricts the abelian-scheme extension to maximal level.
  - ell-system lives over Y_K[1/ℓ], not only the generic fibre.
  - Items 122 and 138 need log|D_E/D_F|.
- **Locators:** 111 corrected.
- **Statuses:**
  - **arithmetic-divisor:** planned (R35.1) → missing, routed to GSpinSpecialDivisorHeights. R35.1 plans arithmetic degrees on arithmetic curves, not arithmetic divisors on stacks.
  - **bk-dp:** planned → missing, kept in the R07 source route. No stage names the S-evaluation.
  - **faltings-height:** also planned at R35.3 ("Stable Faltings height").
  - **integral-lattice:** its note records that Tau Ceti also has the discriminant group.
  - **Library citations:** all exist at the pinned commits, including `NumberField.IsCMField` with `complexConj`, `CliffordAlgebra.ι_sq_scalar`, `FormalGroup.IsComm` and Tau Ceti's `IntegralLattice` and `discriminant`.
- **The extraction's own repairs:**
  - 27 are **sound**, including the normalisation repairs for E1–E3 and E5.
  - orth-fiber-connected (the repair of Theorems 4.4.5 and 4.4.6) is **unsound**; see E14.
- **New items (40):**
  - **5 planned:**
    - Kisin's functor (R07.4);
    - the contravariant Dieudonné crystal (R07.2);
    - Grothendieck–Messing and Zink (R07.6, R07.2);
    - the reflex norm of a torus cocharacter (V4, CM.0);
    - the Newton cocharacter (VB0, BG1).
  - **35 missing:**
    - 4 to LubinTate;
    - 4 to OrthogonalIntegralModels;
    - 12 to GSpinSpecialDivisorHeights;
    - 15 to the CM Part II. These include the Chowla–Selberg d = 1 case, which §9.5 needs but only cites.
- **Summary:** a closing paragraph records the counts after the review and the conclusions below.
- **Part II title mismatch:** PAPER-CHARLES-16 proposes the orthogonal-models Part II under an older title. This paper, PAPER-LI-ZHANG-22, PAPER-MAULIK-SHANKAR-TANG-22 and PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 share the newer one. The design job should reconcile them.

## Mistakes in the paper (`sourceIssues`, E1–E62)

- **E1–E27**, the extraction's, are all confirmed on page images.
  - **E1–E3:** each is false as printed. The paper's later use already matches the corrected versions, so Theorems 9.4.2, 9.5.1, 9.5.5 and **Theorem A hold as printed**. The extraction's pending caveats on items 129–134 can be closed.
  - **E4:** the recorded correction is wrong for d ≥ 2; the correct metric is |[z, z̄]₀|.
  - **E9** is re-pointed to Theorem 2.1.1's first sentence: M(T_p(H)^∨), not M(T_p(H^∨)).
  - **E14** is reclassified from a gap to an **error in a stated result**. Theorem 4.4.6(3) fails for n = 1.
    - Take V = B⁰, the trace-zero part of the indefinite quaternion algebra of discriminant 15, and L = O_B ∩ B⁰.
    - Then ν(K_ℓ) = (Z_ℓ^×)² at 3 and 5, so the model has four geometric components.
    - At p = 7, where L_(7) is self-dual, the fibre is not geometrically connected.
  - **E9, E10 and E19** are reclassified to "affects nothing".
- **E28–E62** are new.
  - **Errors or gaps in stated results:**
    - Proposition 4.4.1(4): "potentially good" must be "good".
    - "rank Λ ≤ 2" fails at p = 2.
    - Proposition 2.3.1 needs Spec R connected.
    - In (3.2.2), K0,p is not compact as printed.
    - Proposition 3.5.5 constructs N_cris only where Y_{K,q} is étale.
    - Proposition 7.1.4(2) is false when r(λ) = n(𝔭); a numerical check confirms this.
    - Proposition 7.1.2(2) is missing a factor N(𝔭)^{−m/2}.
    - W* on p. 476 is inverted.
    - A claim about the primes a binary form misses.
  - **Gaps in proofs:**
    - Lemma 2.5.3 at k = e − 1 for p = 2.
    - Proposition 4.1.1 for n = 2 with V_ℓ anisotropic.
    - The proof of Proposition 6.2.3 ignores the different.
    - The proof of Proposition 7.8.2 skips split primes.
    - §9.5 needs d ≥ 2; the Chowla–Selberg case d = 1 is only cited.
  - **The rest are misprints.**
- **Effect:** none of these affects Theorems A and B.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once. Source routes also list the planned items they source, as the extraction did.
- Every stage id exists in the atlas.
