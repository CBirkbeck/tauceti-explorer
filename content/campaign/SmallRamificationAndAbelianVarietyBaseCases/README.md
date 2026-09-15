# Roadmap: Small ramification and the base cases for Serre modularity

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Prove the arithmetic nonexistence and small-characteristic theorems that initialise or terminate the Serre arguments. A finite table from a paper must be turned into a proved bound or an independently checkable certificate, not trusted numerical output.

## Existing material and ownership

Consume local ramification and global discriminant/Hermite–Minkowski theory from the existing number-field portfolio, R01's residual images, R07's finite-flat ramification, R10/R11's abelian varieties and semistable reduction, and R28's finiteness/isogeny results where the chosen proof uses them. Search the existing EffectiveBounds work before assigning analytic estimates; none is treated as implemented on the basis of its title.

## Conventions

Distinguish a representation unramified outside p from an abelian variety with good reduction outside p, and good reduction from semistable reduction at the remaining prime. The nonexistence theorems concern nonzero-dimensional abelian varieties. Residual representations are absolutely irreducible over the algebraic closure of the coefficient field.


<a id="r25-1"></a>

## R25.1. Explicit discriminant bounds

**Milestone:** `R25.1`

Derive the local discriminant upper bounds for the torsion fields appearing in the source, with wild ramification retained. Prove the global lower bounds used to exclude them, including any analytic explicit-formula estimate and certified numerical inequalities. Record degree, signature and root-discriminant hypotheses. If a finite exceptional list of number fields is used, prove its completeness from the bound and validate the listed fields.

**Dependencies:** [ArithmeticGaloisRepresentations R01.2](../ArithmeticGaloisRepresentations/README.md#r01-2); [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-6).

<a id="r25-2"></a>

## R25.2. Tate–Serre small-characteristic representations

**Milestone:** `R25.2`

Prove that the relevant odd absolutely irreducible mod-2 and mod-3 representations unramified outside their residual prime do not exist, following the exact Tate/Serre statements used by Khare and by Dieulefait–Pacetti Theorem 1.1. Include nonsolvable as well as soluble possible images and the coefficient-field issue. Solvability of GL₂(F₃) alone is not the proof.

**Dependencies:** R25.1 (preceding layer).

<a id="r25-3"></a>

## R25.3. Fontaine's everywhere-good-reduction theorem

**Milestone:** `R25.3`

Prove the nonexistence of a positive-dimensional abelian variety over Q with good reduction everywhere. Supply the finite-flat group-scheme, ramification and discriminant arguments and the step converting the resulting torsion restrictions into a contradiction. This is a theorem about all dimensions, not just the absence of conductor-one elliptic curves.

**Dependencies:** R25.2 (preceding layer).

<a id="r25-4"></a>

## R25.4. Schoof's semistable small-prime theorem

**Milestone:** `R25.4`

Prove the cases used in the source: no positive-dimensional semistable abelian variety over Q with good reduction outside a single prime in {2,3,5,7,13}. Include the classification or extension calculations for the finite-flat group schemes and the global argument passing from torsion to the abelian variety. Do not infer this result from Fontaine's everywhere-good-reduction theorem by dropping the last bad prime.

**Dependencies:** [FaltingsFinitenessAndIsogenyTheorems R28.5](../FaltingsFinitenessAndIsogenyTheorems/README.md#r28-5); [NeronModelsAndSemistableAbelianVarieties R11.6](../NeronModelsAndSemistableAbelianVarieties/README.md#r11-6); [SmallRamificationAndAbelianVarietyBaseCases R25.3](README.md#r25-3).

<a id="r25-5"></a>

## R25.5. GL₂-type and ordinary terminal cases

**Milestone:** `R25.5`

Supply the geometric realisation of the weight-two compatible systems used in the terminal branches, in the exact Snowden/source form, and verify good/semistable reduction at the required primes. R21 supplies the ordinary lifting statement; prove the extra local crystalline-to-ordinary calculations required at the terminal weights. Show how each small-weight case ends in a theorem already proved here or in R17/R21.

**Dependencies:** R25.4 (preceding layer); [PotentialModularityAndCompatibleSystems R24.6](../PotentialModularityAndCompatibleSystems/README.md#r24-6); [OrdinaryAutomorphicFormsAndModularityLifting R21.6](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-6).

<a id="r25-6"></a>

## R25.6. A complete base-case table

**Milestone:** `R25.6`

List every base case used by R26 and R33, its characteristic, weight, ramification, image and coefficient assumptions, and its proof supplier. Give a separate local calculation for each exceptional transition rather than a catch-all “small primes” clause. Keep proofs independent of the Serre theorem they are used to initialise.

**Dependencies:** R25.5 (preceding layer).

## Required examples and checks

Check the numerical discriminant certificates, the exclusion of conductor one in residual characteristics 2 and 3, and the semistable prime-5 terminal case of the modern proof. A semistable elliptic curve of conductor 11 must not be excluded by a theorem whose prime list stops at 13 but is not an interval.



## References

TATE94, SERRE87, FONTAINE85, SCHOOF05, KHARE06, DP23, ROSSER_SCHOENFELD62. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Finite arithmetic base-case certificates

**Stages:** R25.1, R25.2, R25.3, R25.4, R25.5, R25.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For each terminal row record characteristic, residual image, weight, conductor, field degree and the exact discriminant or finite-flat extension bound. Transcribe numerical inequalities with rational bounds and prove their finite range by checked arithmetic. An abelian realization must be produced with its dimension and good/semistable reduction set before invoking the nonexistence theorem.

**Acceptance and consumer contract.** The Schoof set is the exact source set {2,3,5,7,13}, not every prime at most 13. Fontaine good reduction and Schoof semistable reduction dispatch to different results. Include a positive-dimensional restriction-of-scalars example only with A6 finite-separable hypotheses and its bad places tracked. Every row consumed by R26/R33 must have a concrete terminal theorem.

## Source anchors and prototype coverage

- SmallRamificationAndAbelianVarietyBaseCases source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
