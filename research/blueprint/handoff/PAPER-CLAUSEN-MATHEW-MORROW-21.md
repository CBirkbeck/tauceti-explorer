# Handoff: PAPER-CLAUSEN-MATHEW-MORROW-21

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1418).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.** arXiv 1803.10897v2, the "revised and final version", was read in full from its TeX source and PDF. The published JAMS PDF returned HTTP 403, so the published version was not compared.

**Deliverables:**

- `research/blueprint/papers/PAPER-CLAUSEN-MATHEW-MORROW-21.result.json`: 122 items (1 library, 18 planned, 103 missing), 9 routes, 13 prerequisites and 7 source issues.
- The report, `research/blueprint/papers/PAPER-CLAUSEN-MATHEW-MORROW-21.md`.

## Judgement calls for the reviewer

**Theorem A is marked missing, not planned.** The AMMN extraction marks "Clausen–Mathew–Morrow's theorem" as planned in RefinedTraceMethods RT.3, on the strength of RT.3's phrase "a henselian pair in the proven range". RT.3 plans no proof of it. Nothing in the atlas plans the finiteness of TC/p, nonunital henselian rings or pseudocoherence. So this extraction routes the theorem and its proof to the new Part II, and asks RT.3's export and the AMMN Part II to import it. If the reviewer prefers the AMMN reading, only item 005 changes status. The proof items would still need the Part II.

**Split of continuity between two Part IIs.**

- I-adic continuity (§5.1) goes to the new Part II.
- p-adic continuity (§5.2) goes to the AMMN Part II, which already plans the continuity theorems for p-adic formal schemes.

**Equal-characteristic inputs.** The new Part II owns Geisser–Levine and Geisser–Hesselholt as imported theorems, because no layer plans p-adic K-theory in characteristic p. MotivicEtaleKTheory M.5 mentions only the Bloch–Gabber–Kato statement for Milnor K-theory of fields.

**Commutative algebra** goes to existing layers, consistent with earlier extractions:

- henselian pairs, henselization, Elkik and Popescu to SchemeAndStackFoundations SF.0;
- Kunz and excellence to DeformationAndDerivedPatchingAlgebra R03.3;
- p-bases and F-finite cotangent complexes to DerivedDeRhamCohomology DD.0.

## Leads not recorded as source issues

- **Proposition 2.27** (Frobenius fixed points of strict Dieudonné complexes commute with filtered colimits) is stated with "can be proved in an entirely analogous manner" and no proof. It is not used later, so I recorded it as an item for the design job to prove, not as a gap.
- **Hesselholt's HKR theorem (Theorem 2.25)** is quoted with R(σ_s) = pσ_{s−1}. Hesselholt's statement has pλ_sσ_{s−1} for a unit λ_s. This is harmless for all uses.
- **Theorem 4.29** is stated "for each n ≥ 0", but its part (3), π_n(K^inv(R)/p) ≅ ν̃^{n+2}(R), also holds for n = −1, −2 by the same long exact sequence.
- **Cross-reference wording slips** that are not recorded:
  - "Lemma 4.15 below", where the lemma is above;
  - "Proposition" for Lemma 3.21, Theorem 5.19 and Theorems 5.20–5.21;
  - "p^rZ/Z" for Z/p^rZ in Corollary 5.34.

## Not done

Nothing remains in the extraction. The published JAMS version was not compared.
