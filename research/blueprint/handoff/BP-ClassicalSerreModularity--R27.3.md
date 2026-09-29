# BP-ClassicalSerreModularity--R27.3: checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #695; the bot confirmed the claim. **Status: partial.** All
eight stages in scope are `source_decomposed`.

## What this checkpoint did

1. **Carried the reviewed decomposition.** The integrated decomposition has ten nodes in this part's scope, and all are
   carried.
   - Every excerpt was re-selected and verified against the pinned copies.
   - The four PDFs match the decomposition's recorded sha256: KW I 3c389dc…, the Annals paper 154c0c2…, DP
     0c6850d… and Serre 8048919….
2. **Narrowed statements as RS-06 requires.**
   - Theorem 1.2 moved out of the R27.3 assembly into R27.4.
   - The reviewed Theorem 3.4 node kept its id but now states only the theorem. Lemma 8.2 is its own node under R27.1,
     so that the modern strand can import it without the classical induction.
   - Hypothesis (H) is imported from GL2ModularityLifting R22.6/hypothesis-h (Kisin), not planned again.
   - Paso 6's terminal cases are imported from SmallRamificationAndAbelianVarietyBaseCases R25.5/paso-six-terminal-cases.
     R33.4 owns the case analysis and the transfer back.
3. **Added 22 nodes.**
   - **R27.1** (discharging the part R26.1 remaining item): Lemma 8.2 and the good-dihedral insertion.
   - **R27.3:** Theorem 3.3 and (D₀).
   - **R27.4:** the choice of p′; weight and level from minimal lifts, including the scalar dyadic case; Theorem 1.2.
   - **R27.5:** the dyadic weight claim, (D₁) by the prime 3, and (D_r) for r ≥ 2.
   - **R27.6:** the strong form and the finite-flat weight-two export for R29.
   - **R33.1:** the Fontaine–Laffaille bad-dihedral exclusion, the solvable termination and Paso 1.
   - **R33.2:** Ind κ, Lemma 2.1 and Paso 3.
   - **R33.3:** Remark 6, Paso 4 and Paso 5.
   - **R33.4:** the §2 assembly.
4. **Filled a missing step in KW I.** KW I state Theorem 1.2 with weight k(ρ̄) and level N(ρ̄), but §3.2 proves only
   modularity. The node `R27.4/strong-form-by-minimal-lifts` supplies the passage from KW I's own Theorems 5.1(1) and 4.1
   and Lemma 6.2(i). I did not record this as a source issue: the step is standard and short.

## Source issues

- **E3 (misprint).** KW I, proof of Theorem 9.1: the system lifts ρ̄₃, not ρ̄. "Theorem 5.1(2)" should be 5.1(4) with
  almost strict compatibility.
- **E4 (misprint).** DP Paso 2: the residue field order should be the unit group's order.
- **E5 (misprint).** DP Paso 2: inertia "at q" should be at N.
- **E6 (gap).** DP Remark 6: the stated reason gives no contradiction; KW I's odd-ramification-index argument does.
- **E7 (gap).** DP's definition of "minimal lift" does not preserve the type at N that Lemma 2.1 needs. KW I's notion does.

## Requests (13)

- PotentialModularityAndCompatibleSystems R24.3, R24.4 and R24.6.
- GL2ModularityLifting R32.5 and R32.6.
- AlgebraicModularFormsAndSerreWeights R15.4 and R15.6. R15.4 now includes the très ramifiée odd-ramification-index
  criterion, which both strands use.
- ArithmeticGaloisRepresentations R01.2, R01.3 and R01.4.
- SerreWeightAndLevelOptimisation R20.6: the p = 2, k = 4 optimisation.
- GL2AutomorphicRepresentationsAndTransfer R17.5: Langlands–Tunnell.
- Tau Ceti Chebotarev, layer 10.

## Lean

`suggested/ClassicalSerreModularity--R27.3.lean` imports Mathlib only. It checks the arithmetic of both routes:
- the Lemma 8.2 congruences (q = 409 for p = 5, and the prime 406561 for q = 13);
- the level-2 conditions;
- the E4 identity;
- the parity fact behind E6;
- the Lemma 1.14 bound and its niveau-2 case;
- Remark 5's congruences;
- the Paso 6 weights.

It compiles with 0 errors, 0 warnings and no `sorry` against the pinned toolchain (`lean` on the file, well under a
minute).

## What a continuation should do

1. **DP Theorem 1.7:** read the main theorem of Skinner–Wiles (Publ. IHÉS 89, 1999) and settle the second hypothesis
   (the gap). The branch itself is SmallRamificationAndAbelianVarietyBaseCases R25.5's.
2. **Part R26.1's R27.1 coverage record:** update it to point to the two R27.1 nodes here.
3. **Optional:** read KW I and DP in their published versions and re-check E3–E7 against them.
4. **R33.5–R33.6** (#696) continue this strand. `R33.4/dp-odd-characteristic-assembly` is the odd-characteristic input
   of R33.5.
