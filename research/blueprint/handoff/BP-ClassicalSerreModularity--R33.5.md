# BP-ClassicalSerreModularity--R33.5: checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #696; the bot confirmed the claim. **Status: partial.** R33.5
and R33.6 are both `source_decomposed`.

## What this checkpoint did

1. **Carried the reviewed decomposition node** `R33.5/dp-characteristic-two-closure` (DP §3), with its excerpts
   re-selected from arXiv v2 (sha256 0c6850d…, the same file as part R27.3).
2. **Added seven nodes.**
   - **R33.5:** the auxiliary odd prime for the dyadic weight-2 system (Lemma 1.14 at weight 2 gives p > 3); the
     qualitative theorem in every characteristic; and the dependency check that the roadmap asks for before certifying
     independence.
   - **R33.6:** the comparison of DP's modularity with the atlas's; the strong form by the modern route (the SAME
     statement as R27.6); the comparison of the two routes; and the R29 export parameterised by the strong form.
3. **Followed RS-06.**
   - R33.6 imports R27.4/strong-form-by-minimal-lifts and R27.6, as RS-06 lists them as suppliers.
   - The comparison node locates the one place where the modern route needs KW: the scalar local dyadic case. It does
     not claim the qualitative proof alone covers that case.

## Source issues

None new. E3–E7 (part R27.3) cover KW I and DP.

## Requests (6)

- PotentialModularityAndCompatibleSystems R24.3 and R24.6: the dyadic lift and system.
- GL2ModularityLifting R32.6: the globalisation audit.
- AlgebraicModularFormsAndSerreWeights R15.6.
- GL2AutomorphicRepresentationsAndTransfer R17.6: Rohrlich–Tunnell.
- SerreWeightAndLevelOptimisation R20.6.

## Lean

`suggested/ClassicalSerreModularity--R33.5.lean` imports Mathlib only. It checks:
- the p > 3 bound;
- that a unipotent matrix over ZMod 2 squares to 1 (no element of order 4, so no S₄);
- the orders 12 and 60 behind the A₄/Borel and A₅ = PGL₂(𝔽₄) remarks.

It compiles with 0 errors, 0 warnings and no `sorry`.

## What a continuation should do

1. Once GL2ModularityLifting R32.6's audit exists, update `R33.5/globalisation-dependency-check` and close the gap.
2. Optionally, read Rohrlich–Tunnell (1997) and check the §3 solvable branch against its hypotheses. Its owner is R17.6.
