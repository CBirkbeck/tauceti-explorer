# BP-PotentialModularityAndCompatibleSystems--R24.3: checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #977; the bot confirmed the claim. **Status: partial.**
- R24.3, R24.4, R24.5 and R24.6 are `source_decomposed`.
- R24.5:operations is `partial`.

## Checkpoint 2: a corrected attribution

KW Annals' introduction says the minimal-lift method "has been suggested in Remark in §5.2 of [27]". [27] is
Khare–Ramakrishna, *Finiteness of Selmer groups and deformation rings*, Invent. Math. 154 (2003) 179–198. It is not
Khare's paper with Böckle's appendix, which is [26].

Checkpoint 1 had written "Khare's Inventiones 154 (2003) paper" in `R24.3/kw-annals-minimal-lifts` and "Khare 2003" in
the README; both are corrected. The node now also quotes KW Annals' reference [27] (printed p. 252). The error was found
while carrying the draft EXT-12 in part R23.1 (#976, PR #3867). No other node is affected: Böckle's Theorem 1 correctly
places the appendix in Khare's paper [26].

`check_blueprint.py`: 0 errors, 0 warnings. The Lean file is unchanged.

## Checkpoint 1

1. **Started from the sources.** No integrated decomposition exists for this roadmap. The sources read are KW II (§§6, 8,
   9.2, 10), KW I (§§4–5), KW Annals (§§1–3), Böckle's appendix, Dieulefait–Pacetti (§§1.3–1.4) and Snowden (§7).
   - Hashes: KW I, KW Annals, DP and Böckle match the ClassicalSerreModularity records; KW II is 53f45f8…; Snowden is
     b0c0008….
2. **Planned 22 nodes.**
   - **R24.3:** Böckle's Proposition 1, Lemma 2 and Theorem 1; KW Annals Theorem 3.3; the lift types of KW I Theorem 5.1
     (definition with API and tests); the four constructions; the application table; Snowden's prescribed-type lifts.
   - **R24.4:** (α)/(β) from residual modularity, and KW I Theorem 4.1.
   - **R24.5:operations:** the compatible-system definition (API and tests), and twist/restriction/induction.
   - **R24.5:** the Brauer system (construction with API and tests), almost strict compatibility, KW I Theorem 5.1 and
     Dieulefait's families.
   - **R24.6:** residual members, compatibility at the coefficient prime (planet), and linked systems.
3. **Built on existing roadmaps.**
   - Finiteness and points are R24.1 and R24.2, in part R23.1 of this roadmap.
   - Theorem 9.7 is GL2ModularityLifting R22.5/R22.6; presentations are GlobalGaloisDeformations R04.3/R04.6; local
     rings and nonemptiness are LocalGaloisDeformationRings R08.6.
   - Nothing from those packets is re-planned.

## Source issue

- **E1 (misprint).** KW II's bibliography gives Khare's level-one paper as Duke 134, pp. 534–567; it is pp. 557–589.

## Requests (9)

- LocalGaloisDeformationRings R08.6 (Snowden's definite-type local rings);
- SerreWeightAndLevelOptimisation R20.6 (the weight part of Serre for modular ρ̄);
- AlgebraicModularFormsAndSerreWeights R15.4 (Savitt's residual weights) and R15.6;
- GL2AutomorphicRepresentationsAndTransfer R17.4 (solvable base change);
- ArithmeticGaloisRepresentations R01.2, R01.3, R01.4 and R01.5.

## Lean

`suggested/PotentialModularityAndCompatibleSystems--R24.3.lean` imports Mathlib only. It checks:
- the lift-type arithmetic (parity, level-2 existence, p ∤ q − 1);
- Diamond's (i, j) list at p = 3, q = 5;
- the Brauer example and non-example on ℤ/2;
- the degree of x² − 3;
- φ(5) = 4 for Snowden's (A2);
- the weight convention.

It compiles with 0 errors, 0 warnings and no `sorry`.

## What a continuation should do

1. **R24.5:operations:** rank-n and polarised systems (tensor, dual, symmetric/exterior powers), once RS-12 is settled.
2. **ClassicalSerreModularity part R26.1:** replace `R26.1/bockle-appendix-minimal-deformation-ring-presentation` by an
   import of `R24.3/bockle-presentation` (RS-06 makes R24.3 the owner; importing in the other direction would create a
   stage cycle).
3. **Optional sources:** read Savitt (Duke 2005, Corollary 6.15) for the residual weights, and Dieulefait (Crelle 2004)
   and Gee (Math. Ann. 2011).
