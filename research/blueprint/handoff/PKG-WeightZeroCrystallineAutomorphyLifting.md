# PKG-WeightZeroCrystallineAutomorphyLifting — handoff

Refs #9196. Claude (Opus 5.5), session `claude-Kdsiuy`, 14 October 2026. Sonnet helpers were used
only to locate supplier sections in other packages (retrieval); every supplier citation was checked
against the supplier text before use.

## What was done

`research/blueprint/packages/WeightZeroCrystallineAutomorphyLifting/` now holds the complete
package:

- `README.md` (about 1,750 lines): summary, scope and ownership, conventions, exact supplier
  contracts, six layers WZ.0–WZ.5 with 30 targets, per-layer examples and dependencies, a section
  of corrections to the sources, downstream consumers and references. All 21 targets of the accepted
  plan are present with their hypotheses, API (31 items) and Checks (29 named tests); a script
  confirmed that every plan target, API and test name occurs in the README and that no *Needs* line
  or target body refers forward.
- `Suggested.lean` (156 lines): light real-bodied definitions (`complementaryDegreeCondition`,
  `LevelFactors`, `AuxiliaryCoefficient`, `IsSelectedBlockParahoric`), the milestone of 2.1 over
  Mathlib carriers (`existsUnique_minimalPrime_le_of_isReduced`,
  `isDiscreteValuationRing_localization_of_isReduced`), the integer core of 3.8
  (`adequateDimensionBalance_counts`) and discriminating examples. No sorry'd data. Every sorry'd
  example was checked by hand to be true.
- `metadata.toml`: `topic = "math.NT"`.

## Targets owned here beyond the plan (moves)

The plan routed several inputs to "Part II" extensions of other roadmaps. A supplier map over all
cited packages and packets found no owner for them, so the package plans them as targets:

| Target | Content | Plan routed it to |
|---|---|---|
| 2.1 | O-flat + generically reduced special fibre ⇒ DVR at special minimal primes ⇒ unique generalization (CN Lemma 5.3.3 argument) | DeformationAndDerivedPatchingAlgebra P9 (accepted P9 has only support theory) |
| 2.2 | Components and dimensions of completed tensor products (BLGHT11 Lemma 3.3) | DDPA P9 (only the unreviewed summary packet has an R03.4 node) |
| 2.3 | "Connects" for crystalline lifts ⇔ common component of the base-field crystalline ring (BLGGT §1.4) | PotentialAutomorphyInfrastructurePartII PL.1 (states only BLGGT's definition) |
| 3.1–3.6 | Miagkov–Thorne adequate Taylor–Wiles method: selected-block parahoric levels, mod-p comparison (Thm 2.14), char-0 parahoric relations (Props 3.8–3.13), level comparison (Thm 7.6), Galois representations at TW level (Thm 7.7 via §5, §7.1), adequate TW primes (Prop 6.7) | GlobalGaloisDeformations G7 Part II, SmoothRepresentationsOfLocalGroups SR.2/SR.5 Part II, ALS.6 |

The local condition D^1_v itself is LocalGaloisDeformationRings §2.23 (`TaylorWilesBlock`), and the
p-split soluble preparation is built inside 4.1 from PotentialAutomorphyInfrastructure §2.5 (soluble
extensions with prescribed completions), so neither needs a new owner. The coefficient-valued rank-one
request to PadicHodgeTheory R06.2 is already met by its accepted nodes
`locally-algebraic-coefficient-characters` and `rank-one-de-rham-crystalline-classification`.
Future roadmaps that need the adequate method should import WZ.3 rather than plan it again.

## Corrections to the plan

- **Cyclotomic boundary.** The plan kept BCGNT Theorem 3.2.5 in full and left the case ζ_p∈F as an
  open input. Target 3.10 now assumes ζ_p∉F explicitly (the adequate primes of MT Prop 6.7 need it);
  the global theorem 4.4 is unaffected because its scalar witness forces ζ_p∉F. Recorded in the
  README's corrections, item 6.
- **Block convention.** Fixed as (n−d,d) with the selected block last throughout 3.1–3.6, as the
  plan asked; since this roadmap now owns the MT local theory, no supplier comparison is needed.
- **Stale supplier ids in the plan:** `LocalGaloisDeformationRings:R08.5` (ordinary rings) is the
  package's §1.3, §1.7, §1.9, §6.1, §6.24, §7.6 (packet ids L7/L8); `ArithmeticLocallySymmetricSpaces:ALS.1`
  levels and neatness are package §0.10–§0.11; the "IHG.5 tame/unrestricted factorization" is not in
  IntegralHeckeAndGaloisDeterminants — it is ACC Theorem 3.1.1 (contract on AG2.5) together with
  CrystallineLocalGlobalCompatibilityCM §7.5; the AS.5 "exclusion of proper parabolics" is
  ArithmeticLocallySymmetricSpaces §5b.8, with Franke's comparison from AutomorphicSpectralTheory
  §5.10/§5.12.

## Dependencies to resolve before this roadmap goes upstream

1. **WeightZeroCrystallineLiftingRings has no plan.** BCGNT Theorem 2.5.5 (generic reducedness of the
   weight-zero crystalline special fibre for p>n) is consumed in 2.5 as an exact contract, as the
   accepted plan required ("keep it in the sibling"). The paper routing accepted that Part II
   (REV-PAPER-BOXER-CALEGARI-GEE-ETAL-25, item 7), but no design job or packet exists. It needs the
   Emerton–Gee stack (arXiv:1908.07185) and BCGNT §2.
2. **CrystallineLocalGlobalCompatibilityCM §7.5** states CN Theorem 4.2.15 for V_λ coefficients. 1.1,
   3.5 and 3.7 need it for V_λ⊗O(χ⁻¹) (twist at places away from p) and at the selected-block
   Taylor–Wiles levels. The README's contract says so explicitly; that package should state this
   generality (BCGNT uses it in the same way).
3. **AutomorphicGaloisRepresentationsPartII AG2.5** is the cited owner of ACC Theorem 3.1.1 (torsion
   inertial comparison at ℓ≠p) here and in PotentialAutomorphyInfrastructure's contracts, but the AG2
   package does not state it; ACC Theorems 2.3.5/2.3.7 (torsion GL_n determinants) are likewise only
   supplied through CL §7.5 and the "TorsionCohomologyInfrastructure" roadmap that
   IgusaVarietiesAndTorsionConcentration names, which does not exist.
4. DeformationAndDerivedPatchingAlgebra, PotentialAutomorphyInfrastructurePartII and PadicHodgeTheory
   have accepted plans but no packages; the README cites their stage ids.

## Checks run

- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: no offenders.
- `lean-check research/blueprint/packages/WeightZeroCrystallineAutomorphyLifting/Suggested.lean`:
  exit 0; 14 warnings, all "declaration uses `sorry`"; no errors (Mathlib 082e2d3, Tau Ceti f790474,
  about 97 GB memory available).
- Name coverage and forward-reference scripts on README.md: no missing names, no forward references.

## Sources read for this package

BCGNT (author copy, §2.5 and §3, pp. 28–35), Miagkov–Thorne (published PDF, all sections),
Caraiani–Newton arXiv:2301.10509v3 (Theorem 4.2.15, Lemmas 5.3.3–5.3.4), ACC arXiv:1812.09999v2
(Lemmas 6.2.25–6.2.26, Proposition 6.5.3), BLGGT arXiv:1010.2561v4 (§1.4), BLGHT11 (EMS Press PDF,
Lemma 3.3), Thorne 2012 arXiv:1107.5989v1 (Proposition 4.4, Lemma 5.10), Stacks Tag 00PD. No passage
was copied; all statements are paraphrased.
