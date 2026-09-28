# Handoff: BP-SmallRamificationAndAbelianVarietyBaseCases (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #995.

## What this checkpoint delivers

- Packet `research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCases.json`, status `partial`. It has 20 nodes: 4 definitions, 9 lemmas and 7 theorems, with 27 API items, 17 unit tests and 8 planets. It cites 36 baseline declarations and makes 9 requests. `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned declaration index.
- The roadmap document `research/blueprint/readmes/SmallRamificationAndAbelianVarietyBaseCases.md`.
- The suggested Lean file `research/blueprint/suggested/SmallRamificationAndAbelianVarietyBaseCases.lean`.

The restructuring RS-06 is accepted and was followed. This roadmap is kept. R25.1 imports the finite-flat wild bound (R07.6) and the local tame carrier (R01.2). R25.2 imports the finite GL₂/PGL₂ classification (R01.4) and coefficient-field descent (R01.1).

## Closed

**R25.2** (coverage `closed`). The plan covers Tate's theorem (p = 2, no oddness needed), Serre's mod-3 theorem and their combination, which is Dieulefait–Pacetti Theorem 1.1. Continuous F̄_p-valued representations are reduced to finite coefficient fields through their finite image. The proof plan runs as follows:

1. The tame case at p is excluded by Minkowski's bound alone: rd < p forces n ≤ 5, so the image is abelian.
2. In the wild case the decomposition group lies in a Borel. Local class field theory over an unramified or tame quadratic base then gives the upper ramification filtration:
   - δ ≤ 2 at p = 2, sharpening Tate's 5/2 − 2/|P|;
   - δ ≤ 13/6 − 1/|P| at p = 3.
   Both bounds are sharp on explicit fields (ℚ₂(√−1, √2) and ℚ₃(ζ₃, ∛3)).
3. Dickson's classification finishes the argument:
   - p = 2: the image is dihedral (then |P| = 2 and δ ≤ 3/2) or SL₂(𝔽_q) with n ≥ 60. Minkowski's thresholds (rd > 3 for n ≥ 6, rd > 4 for n ≥ 12) close both cases.
   - p = 3: 24 | n, and either |P| = 3 or n ≥ 720. The Odlyzko–Poitou bound gives rd > 10 for totally complex n ≥ 24 and rd > 12 for n ≥ 36, while the local bounds are 3^{11/6} ≈ 7.49 and 3^{13/6} ≈ 10.81.

No list of number fields is needed.

## Remaining

- **R25.1** (coverage `partial`): the torsion-field bounds of Fontaine's and Schoof's arguments. These are the root discriminant of ℚ(A[p]) from R07.6's δ < 1 + 1/(p − 1), at the primes those sources use, with the global comparison rows they need. If those sources use an exceptional list of fields, it also needs a completeness proof. Everything R25.2 needs from R25.1 is planned.
- **R25.3** (Fontaine), **R25.4** (Schoof, the exact set {2, 3, 5, 7, 13}), **R25.5** (GL₂-type and ordinary terminal cases) and **R25.6** (the base-case table): coverage `not_read`. A continuation job should read FONTAINE85 and SCHOOF05 first; the R25.1 remainder is part of that reading.
- The certified numerics of R25.1/totally-complex-root-discriminant-thresholds are planned, not carried out in Lean. The values I₁(13/2) = 0.99897… and I₁(8) = 0.91713… come from composite Simpson quadrature and agree to eight digits under refinement from 4000 to 80000 subintervals. The margins in log rd are 0.061 and 0.039.

## Requests

- ArithmeticGaloisRepresentations R01.4: Dickson's classification, the Borel normal form, and reducibility of abelian subgroups.
- ArithmeticGaloisRepresentations R01.1: finite image and finite coefficient fields.
- ArithmeticGaloisRepresentations R01.2: inertia and decomposition groups, unramifiedness, oddness, and local restriction.
- Tau Ceti LocalFieldsRamification Layers 1, 3 and 4: the unit filtration; the different, upper numbering, Herbrand functions and the discriminant in upper numbering; the tame quotient with σ τ σ⁻¹ = τ^q.
- Tau Ceti ClassFieldTheory Layer 7: the local reciprocity map, U^{(n)} ↦ G^{(n)}, and equivariance.
- Tau Ceti NumberFieldArithmetic Layer 6: global different exponents via completions.
- AnalyticNumberTheory AN.3: the explicit formula (Odlyzko 1990, (2.3)) for log |d_K|.

## Lean

The suggested file was not compiled. No pinned build is available to this worker, and the shared-machine rules forbid Lake builds. Imported objects are placeholders named after their owners' planned declarations.

## Sources

Read (URLs and SHA-256 in the packet):

- Dieulefait–Pacetti, arXiv:2108.07577v2: §1.1 and Paso 6.
- Khare, arXiv:math/0504080v1: §1 and §§7.2–8.
- Moon–Taguchi, arXiv:0710.1319v1: §§2–3.
- Jones, author preprint of "Wild ramification bounds and simple group Galois extensions ramified only at 2": §§1.1 and 2.2.
- Ghitza–Yamauchi, arXiv:2509.00635v2: §§2.2–3.
- Odlyzko, JTNB 2 (1990), 119–141: §§1–2.
- Fesenko–Vostokov, *Local Fields and Their Extensions*, 2nd edition: I.(5.7)–(5.8) and IV.(3.5).

Not accessible:

- Tate, "The non-existence of certain Galois extensions of Q unramified outside 2", Contemp. Math. 174 (1994), 153–156. The AMS copy is behind a login.
- Serre, Œuvres III, note on p. 710.
- FONTAINE85 and SCHOOF05 were not read in this checkpoint.

The plan therefore reconstructs Tate's and Serre's arguments from the published accounts above. Every local value was recomputed on explicit fields. The sharpened 2-adic bound δ ≤ 2 and the 3-adic bound 13/6 − 1/|P| are derived here. They are consistent with Moon's bound (Ghitza–Yamauchi, Lemma 2.6): equal to it at |P| = 2 for p = 2 and at |P| = 3 for p = 3, and strictly smaller otherwise. They do not appear as such in the sources read, and should be compared with Tate's paper and Serre's note when those can be consulted. No mistakes were found in the sources read, so `sourceIssues` is empty.
