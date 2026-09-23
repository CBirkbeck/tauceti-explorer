# Review: PAPER-LANDESMAN-LITT-24 (Landesman–Litt, Canonical representations of surface groups)

Job `REV-PAPER-LANDESMAN-LITT-24` (issue #1078), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-7b31c4`. **Verdict: accept**, after the corrections below, which were made in place. All five routes are accepted.

## What was read

- **arXiv v4** (23 February 2025, 62 pp.; the same PDF as the extraction, SHA-256 4cb511ba…) and its TeX source, read in full again. The published version, Ann. of Math. 199 (2024), 823–897, is paywalled and was not available.
- **Method:**
  - Two checkers split the paper (§§1–6 with the background items; §§7–10 and the appendix). Each compared every item with the text and TeX, listed uncovered results and recorded mistakes checked on page images.
  - The checkers consulted [LL22] (arXiv:2202.00039v2, v3), [KP20b] (arXiv:2009.07350v2) and [Gai07] (arXiv:math/0402184v4) for the cited statements.
  - I verified the proof of Lemma 8.6.1 in the TeX myself.
  - I checked every library citation at Mathlib 082e2d3 and Tau Ceti f790474, every stage id, and the Part II title.

## Changes made to the extraction

- **Statements (30 corrected):** 4, 14, 16, 17, 23, 25, 28, 29, 32, 33, 42, 49, 50, 51, 56, 57, 60, 63, 67, 68, 71, 72, 75, 77, 78, 80, 83, 88, 89, 94. The note of each says what changed. The material ones:
  - **77:** the moduli stack is over ℚ, not ℚ̄; over ℚ̄ the hypothesis is vacuous.
  - **83:** Remark 9.2.5 concerns the arithmetic fundamental group over K, not the geometric one.
  - **80:** the algebraic closures L̄, O_{L̄}, 𝔽̄ were restored.
  - **63:** Klevdal–Patrikis need G-irreducibility.
  - **72:** it merged two external results and misattributed one. The second is now split off as item 137.
  - **17 and 49:** they copied the paper's false uniqueness claim (E7) and its "v ∈ 𝕃_m" (E13).
  - **56:** the genus is g′ (E14).
  - **Total space versus fibre:** items 4, 14, 16, 23, 50, 57, 60, 67 and 68 wrote C° for both the total space 𝒞° and a fibre.
- **Locators (9 corrected):** 18, 60, 63, 66, 72, 75, 95, 97, 106. Item 111's locator also gained §3.1.
- **Library citations:**
  - **Item 94** claimed "the long exact sequence of homotopy groups of a fibration" from the libraries, but neither has it. The claim was removed and folded into the new Ehresmann item 135. The Tau Ceti classification of covers (`TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient`, `isRegular_subgroupQuotientProj_iff_normal`) is now cited.
  - **Item 100** now also cites `groupCohomology.H1InfRes`, `H1InfRes_exact` and `groupCohomologyIsoExt`.
  - **Other citations and planned stages:** checked and correct.
- **New items (28, all missing):**
  - **18 to MappingClassGroupsAndCanonicalRepresentations:**
    - 112 matrix-tuple form of the free-group corollary
    - 113 mapping class groups and the Birman sequence
    - 114 Teichmüller space
    - 115 Lyndon–Hochschild–Serre for discrete groups
    - 117 Burnside
    - 124 local systems and monodromy
    - 125 versal families of ϕ-covers
    - 126 socle filtration
    - 127 quasi-unipotence
    - 128 Dehn twists
    - 129 capping
    - 130 Jordan
    - 131, 132 non-density
    - 133 GL_r(𝔽_p) two-generated
    - 134 Example 10.2.4
    - 135 Ehresmann with the homotopy long exact sequence
    - 139 arithmetic lifts
  - **9 to HodgeStructuresPartII:**
    - 118 Deligne semisimplicity
    - 119 Saito/Timmerscheidt
    - 120 logarithmic comparison
    - 121, 122 parabolic structures
    - 123 Kodaira–Spencer
    - 136 smooth extension of fibrewise sections
    - 137, 138 the LL22 inputs
  - **1 to InverseGaloisAndArithmeticFundamentalGroups:**
    - 116 Artin's good neighbourhoods
  - **Not added:** two further proposals were folded into item 111 (the §3.1 deformation definitions) or merged into item 135 (a second Ehresmann proposal).
- **Briefs:**
  - **The new roadmap's brief** records the corrections its layers must respect:
    - in Lemma 8.6.1, choose Γ fixing the isomorphism class of ρ;
    - Lemma 2.2.2 is unique only in GL_r;
    - Lemma 7.2.5 concerns genus g′;
    - H¹(…)^ρ must be defined;
    - Lemma 2.4.2 needs g ≥ 1.
  - **The Hodge Part II brief** records:
    - the correct form of Lemma 6.1.1;
    - "semistable" in Proposition 5.2.3;
    - a good compactification in Lemma 8.3.3;
    - the LL22 Theorem 1.2.5 citation.
  - **Layer order:** routes 1 and 2 import from each other at different layers, which the design jobs must order.
- **Summary:** the item counts and the source issues were updated.

## Mistakes in the paper (`sourceIssues`, E1–E22)

- **E1–E3**, the extraction's three misprints, are confirmed. For E3, the extraction's added reason, that dominance alone would not suffice for Corollary 1.3.1, is not right, but the misprint stands.
- **E4–E22** are new, recorded against arXiv v4:
  - **E17 (gap):** the proof of Lemma 8.6.1 chooses Γ stabilising the classes σ_i, so it never uses MCG-finiteness. Without that hypothesis the lemma is false: the unipotent ρ(x) = (1 f(x); 0 1) has infinite image. The fix is to choose Γ fixing the isomorphism class of ρ.
  - **E18 (gap):** the proof of Lemma 8.3.3 treats the normalisation as a strict normal crossings compactification, which it is not in general. A resolution repairs it.
  - **E10 (gap):** Lemma 2.4.2 is unproved for g = 0, but it is never used there.
  - **E7 (error):** Lemma 2.2.2's uniqueness is false projectively; Q₈ is a counterexample.
  - **E13 (error):** Lemma 6.1.1's "v ∈ 𝕃_m" holds only in an isomorphic copy of 𝕃.
  - **E9 (error):** a false uniqueness step in the proof of Lemma 2.4.1, with a sound conclusion.
  - **E21 (error):** Gaitsgory proves de Jong's conjecture only for ℓ ≠ 2.
  - **The rest are misprints:**
    - E4 Ad ∘ ρ;
    - E5 PMod_{g,n+1};
    - E14 genus g′;
    - E12 semistable;
    - E19 LL22 Theorem 1.2.5;
    - E22 i − 1 arguments;
    - and others.
- **Effect:** none affects the main theorems.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LANDESMAN-LITT-24.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every planned and route stage id exists in the atlas.
