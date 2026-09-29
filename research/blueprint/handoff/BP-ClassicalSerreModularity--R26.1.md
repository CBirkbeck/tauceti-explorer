# BP-ClassicalSerreModularity--R26.1: checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #694; the bot confirmed the claim. **Status: partial.**
- R26.1–R26.4 and R26.6 are `source_decomposed`.
- R26.5, R27.1 and R27.2 are `partial`.

## What this checkpoint did

1. **Carried the reviewed decomposition.** The integrated decomposition (data/decompositions/ClassicalSerreModularity.json)
   has ten nodes in this part's scope, and all are carried with their statements.
   - Every excerpt was re-selected and verified against the pinned copies. The earlier excerpts came from a different
     text extraction (ρ̄ versus ¯ρ, and so on) and no longer matched.
   - The KW I preprint was fetched from the authors' page. Its TLS chain is incomplete, so the file was checked against
     the decomposition's recorded sha256 (3c389dc…); it matches.
   - Khare's arXiv v1 (3012a51…) and the Annals PDF (154c0c2…) also match the recorded hashes. Böckle's appendix
     (67de08f…) matches too.
2. **Re-homed a node.** RS-06 moves the KW I §7 prime-estimate node from R26.3 to R27.2, and its id changes accordingly.
   R26.3 now has Khare's own estimate.
3. **Decomposed Khare §§2–7**, which the decomposition had not read. There are 16 new nodes:
   - **R26.2:** the flatness method; Proposition 2.1; the smooth local ring at q (Böckle's Hensel computation);
     Proposition 2.2; Proposition 3.1.
   - **R26.3:** Khare's §4 estimate; Lemma 5.2; the interval containment; an explicit well-founded induction on the
     weight bound.
   - **R26.4:** Lemma 5.3; Lemma 5.4 with Corollary 5.5; the degenerate branches.
   - **R26.5:** the small-weight table.
   - **R26.6:** the assembly of the proof; Corollary 1.2 (with KW I's correction); Corollary 1.3.
4. **Avoided duplication.** Wintenberger's dihedral lemma (Khare 5.1), the base cases (Tate–Serre, Fontaine, Schoof,
   weights ≤ 8 and 14) and the base-case table are cited from SmallRamificationAndAbelianVarietyBaseCases R25.2, R25.5
   and R25.6. Local rings are cited from LocalGaloisDeformationRings. Skinner–Wiles is cited from
   OrdinaryAutomorphicFormsAndModularityLifting R21.5/theorem-a.

## Source issues (both in Khare's small-weight table, arXiv v1)

Both reach nothing.
- **E1 (misprint).** The weights 22–30 row says the mod-7 lift is "unramified outside 3, 19"; it should be 7, 29.
- **E2 (error).** The weight-32 row uses nebentypus ω_31^{16}. With foil 5 and a lift semistable at 31, only ω_31^{6i} is
  available; j = 18 gives weights 20 or 14, which are known.

I found E2 by checking every row's nebentypus against the coset χ⟨η⟩ of Proposition 2.2 (the Lean file checks the
table).

## Requests (13)

- PotentialModularityAndCompatibleSystems R24.3, R24.5 and R24.6.
- AlgebraicModularFormsAndSerreWeights R15.6 and R15.3.
- ArithmeticGaloisRepresentations R01.4.
- OrdinaryAutomorphicFormsAndModularityLifting R21.6.
- GL2ModularityLifting R22.1.
- DeformationAndDerivedPatchingAlgebra R03.3.
- SerreWeightAndLevelOptimisation R20.6.
- LocalGaloisDeformationRings R08.2, R08.3 and R08.6.

## Lean

`suggested/ClassicalSerreModularity--R26.1.lean` imports Mathlib only. It has the interval-containment algebra, the
small-weight table's new weights and nebentype cosets (including the E2 counterexample), and the good-dihedral arithmetic
tests. It compiles with 0 errors, 0 warnings and no `sorry`.

## What a continuation should do

1. **R27.1:** the existence of good dihedral primes (the Chebotarev insertion step) from KW I §4–5 and KW II.
2. **R27.2:** KW II's proofs of Theorems 4.1 and 5.1. KW II is on the authors' page (proofs.pdf), with the same TLS caveat.
3. **R26.5:** optionally, split the §6.1 rows into per-row nodes.
