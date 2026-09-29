# BP-ClassicalSerreModularity--R26.1: checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #694; the bot confirmed the claim. **Status: partial.**
- R26.1–R26.4, R26.6, R27.1 and R27.2 are `source_decomposed`.
- R26.5 is `partial`.

## Checkpoint 2: alignment with PotentialModularityAndCompatibleSystems part R24.3

1. **The Böckle node became an application contract.** RS-06 moves the generic presentation to GlobalGaloisDeformations
   R04.3 and the prescribed-lift application to PotentialModularityAndCompatibleSystems R24.3. Part R24.3 (PR #3864) now
   plans Böckle's Proposition 1, Lemma 2 and Theorem 1. `R26.1/bockle-appendix-minimal-deformation-ring-presentation`
   keeps its id and states only Khare's application contract:
   - oddness;
   - Δ_ℓ = 0 in the four cases of Corollary 1;
   - Lemma 1 at a decomposable flat p;
   - T_Q reduced, and Carayol.

   It imports the R24.3 nodes. The direction R24.3 → R26.1 is the one RS-06 records, so there is no cycle.
2. **Stage prerequisites became node ids.** Six nodes that cited PotentialModularityAndCompatibleSystems R24.3, R24.5 or
   R24.6 as stages now cite the exact nodes: `required-lift-types`, `kw-annals-minimal-lifts`,
   `finite-presentation-complete-intersection`, `brauer-induction-system`, `almost-strict-compatibility`,
   `kw-theorem-5-1-systems`, `kw-theorem-4-1`, `residual-members` and `linked-systems-modularity-transfer`. The requests
   to R24.3 and R24.6 are dropped; the one to R24.5 stays for Taylor's potential modularity.
3. **R27.1 and R27.2 are `source_decomposed`.**
   - Part R27.3 (PR #3858) plans KW I Lemma 8.2 and the good-dihedral insertion under R27.1.
   - KW I Theorems 4.1 and 5.1 are R24.4 and R24.5, so the gap "KW I Theorems 4.1 and 5.1 are unproved inputs" is
     closed.
   - The Savitt gap now points to R24.5's request.

`check_blueprint.py`: 0 errors, 0 warnings. The suggested Lean file is unchanged and still compiles.

## Checkpoint 1

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

1. **R26.5:** optionally, split the §6.1 rows into per-row nodes. This is the only `partial` stage left.
2. Items 1 and 2 of checkpoint 1's list (R27.1 insertion; KW II) are done: see checkpoint 2.
