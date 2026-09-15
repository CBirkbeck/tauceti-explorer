# Roadmap: Classical Serre Modularity

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Formalise Khare's level-one theorem and the specific strengthened corollary used to start the KW induction. It is not an existing base case merely because KW I labels it Theorem 1.1.

## Existing material and ownership

R24 supplies prescribed lifts and compatible systems, R22/R24 modularity lifting, R21 the ordinary/residually reducible results, R25 the small-ramification base cases, R17 soluble Artin modularity, and R15/R20 the weight theory. The theorem must be proved without importing R27 or R33.

## Conventions

The prime-to-p conductor is one; this does not say that the p-adic representation is unramified at p. Normalise weight by a cyclotomic twist only with its effect on the conclusion recorded. The induction is the precise nested argument of Khare's paper, not an assumed monotone decrease in conductor during every congruence.


<a id="r26-1"></a>

## R26.1. Statement and exact source decomposition

**Milestone:** `R26.1`

The source decomposition includes Khare–Wintenberger, Annals 169 (2009), 229–253, especially §5.2's killing-ramification argument and the q=2 case cited by KW I §8.3. It also includes Böckle's separate appendix, Theorem 1 and Proposition 1, to Khare's Inventiones 154 (2003) paper. The Khare arXiv main text alone does not contain that appendix. R24.3 constructs the prescribed-lift application using R04/R22, while this stage verifies the exact hypotheses of Khare's Corollary 1.2.

State the level-one theorem for every residual characteristic with its classical Serre weight. Extract the numbered reduction statements and Corollary 1.2 of Khare's paper with all hypotheses. Assign the local lifting, compatible-system and small-prime lemmas to their suppliers. The original theorem and its corollary must each have a proof entry; a reference to KW's use of them is not a proof.

**Dependencies:** [AlgebraicModularFormsAndSerreWeights R15.6](../AlgebraicModularFormsAndSerreWeights/README.md#r15-6); [GL2AutomorphicRepresentationsAndTransfer R17.6](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-6); [SerreWeightAndLevelOptimisation R20.6](../SerreWeightAndLevelOptimisation/README.md#r20-6); [OrdinaryAutomorphicFormsAndModularityLifting R21.6](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-6); [GL2ModularityLifting R22.6](../GL2ModularityLifting/README.md#r22-6); [PotentialModularityAndCompatibleSystems R24.6](../PotentialModularityAndCompatibleSystems/README.md#r24-6); [SmallRamificationAndAbelianVarietyBaseCases R25.6](../SmallRamificationAndAbelianVarietyBaseCases/README.md#r25-6).

<a id="r26-2"></a>

## R26.2. Prescribed lifts in conductor one

**Milestone:** `R26.2`

Construct each lift used in the level-one argument, prove its ramification and determinant, and place it in the compatible system from R24. Check the local weight and the available range of the lifting theorem at every change of characteristic. Track whether the new residual representation is irreducible, reducible or bad-dihedral.

**Dependencies:** R26.1 (preceding layer).

<a id="r26-3"></a>

## R26.3. Weight reduction and prime estimates

**Milestone:** `R26.3`

Prove the weight-reduction and weight-cycle statements of the level-one proof, with the exact auxiliary prime inequalities and congruences. Prove the analytic/elementary prime estimates and the finite exceptional checks needed for those inequalities. Define a well-founded measure for the recursive calls and verify each call is to an earlier case. A change of prime is not by itself a reduction of the measure.

**Dependencies:** R26.2 (preceding layer).

<a id="r26-4"></a>

## R26.4. Degenerate residual branches

**Milestone:** `R26.4`

Prove the soluble, residually reducible and cyclotomically reducible branches using the precisely matched Langlands–Tunnell and Skinner–Wiles statements. Supply the bad-dihedral exclusions and local parity arguments. A representation that was absolutely irreducible before changing prime can become reducible afterwards; this is a branch of the proof, not an impossible case.

**Dependencies:** R26.3 (preceding layer).

<a id="r26-5"></a>

## R26.5. Initial characteristics and terminal weights

**Milestone:** `R26.5`

Apply R25's proved arithmetic exclusions and R21's ordinary calculations to each remaining base case. For any abelian-variety realisation used, verify its dimension, field of definition and exact reduction set before invoking Fontaine or Schoof. The final proof must list the finite set of exceptional characteristics/weights rather than say “check the small cases”.

**Dependencies:** R26.4 (preceding layer).

<a id="r26-6"></a>

## R26.6. Level-one theorem and KW's initial case

**Milestone:** `R26.6`

Complete the induction, restore any twists, and prove the level-one theorem at the Serre weight. Prove the exact Corollary 1.2 used in KW I §8.3 and derive the W₁ statement there. Record that W₁ concerns locally good-dihedral representations with one prime dividing the odd level, not simply a restatement of conductor one.

**Dependencies:** R26.5 (preceding layer).

## Required examples and checks

Check the p=2 and p=3 unramified-outside-p cases and explicitly run the source's smallest nontrivial weight-reduction transitions. Verify the proof of W₁ against KW I §8.3 rather than inferring it from its name.



## References

KHARE06, KW1, ROSSER_SCHOENFELD62. The bibliography records what was inspected and what remains to be transcribed.

## Additional strand: Full classical Serre modularity over Q


Prove the full classical Serre modularity theorem for every residual characteristic, with exact prime-to-p Artin level and classical Serre weight. The proof follows Khare–Wintenberger I/II, Khare's level-one theorem and Kisin's dyadic completion, together with the earlier weight-and-level results.

## Existing material and ownership

All low-level mathematics is assigned in R01–R26 and the existing portfolio. The key imported statements are the exact versions of KW I Theorems 4.1 and 5.1 from R24, the level-one theorem/corollary from R26, the optimiser from R20 and Kisin's Hypothesis-H theorem from R22. This roadmap proves the global induction; residual modularity is not assumed.

## Conventions

Use the classical statement with k(rho-bar)≥2, not the sharper Katz weight-one formulation. At p=2, oddness is det(c)=-1 and imposes no additional nontriviality condition on c. Finite coefficient fields are allowed to vary and are related by explicit extension. Use the source's terminology “locally good-dihedral”; it is not a new abstraction invented for this plan.


<a id="r27-1"></a>

## R27.1. Good-dihedral representations and auxiliary primes

**Milestone:** `R27.1`

Define the good-dihedral prime exactly as KW I Definition 2.1, including the inertia character of odd prime-power order, its size bound, the q≡1 mod 8 condition and congruences at smaller primes. Prove the residual-image consequences over the range of characteristics used in the induction. Prove the existence and preservation results from the stated Chebotarev and lifting inputs; the prime's purpose is to control image after changing characteristic.

**Dependencies:** [ArithmeticGaloisRepresentations R01.6](../ArithmeticGaloisRepresentations/README.md#r01-6); [AlgebraicModularFormsAndSerreWeights R15.6](../AlgebraicModularFormsAndSerreWeights/README.md#r15-6); [GL2AutomorphicRepresentationsAndTransfer R17.6](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-6); [SerreWeightAndLevelOptimisation R20.6](../SerreWeightAndLevelOptimisation/README.md#r20-6); [OrdinaryAutomorphicFormsAndModularityLifting R21.6](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-6); [GL2ModularityLifting R22.6](../GL2ModularityLifting/README.md#r22-6); [PotentialModularityAndCompatibleSystems R24.6](../PotentialModularityAndCompatibleSystems/README.md#r24-6); [SmallRamificationAndAbelianVarietyBaseCases R25.6](../SmallRamificationAndAbelianVarietyBaseCases/README.md#r25-6); [ClassicalSerreModularity R26.6](README.md#r26-6).

<a id="r27-2"></a>

## R27.2. The induction hypotheses and weight reduction

**Milestone:** `R27.2`

Define L_r and W_r as in KW I §3: odd conductor with at most r prime factors and a good-dihedral prime, with W_r weight two and L_r permitting the stated weights, including the p=2 restriction. Prove Theorem 3.2, W_r⇒L_r, following §8.2, with every prime estimate, residual-image check and application of Theorems 4.1/5.1 explicit. The internal recursion on weight/characteristic needs its own well-founded proof.

**Dependencies:** R27.1 (preceding layer).

<a id="r27-3"></a>

## R27.3. Removing ramification and the initial case

**Milestone:** `R27.3`

Prove Theorem 3.1, L_r⇒W_{r+1}, from §8.1, accounting for the local data when a ramified prime becomes the coefficient prime. Prove Theorem 3.3, W₁, from the precise R26 corollary following §8.3. Combine these statements by induction on r to obtain all L_r and W_r. Do not replace this two-stage induction by a false assertion that conductor decreases at every step.

**Dependencies:** R27.2 (preceding layer).

<a id="r27-4"></a>

## R27.4. Removing the good-dihedral condition

**Milestone:** `R27.4`

The dyadic refinement imports the explicit Buzzard 2000 Theorem 2.8 and §3 analysis through R20.5, together with the assigned Wiese weight-one input. Keep representations induced from Q(i) separate from the §2 theorem that excludes them; §3 is the additional branch, not a removable genericity assumption.

Define D_r with the source's bound v₂(N)≤r and prove Theorem 3.4 by the level-raising construction of §8.4. Derive KW I Theorem 1.2: odd residual characteristic with odd conductor, and characteristic two of weight two. Carry the weight-and-level conclusion, including the scalar local dyadic case that was missing from an earlier generic optimisation argument.

**Dependencies:** R27.3 (preceding layer).

<a id="r27-5"></a>

## R27.5. Characteristic two of weight four and even conductor

**Milestone:** `R27.5`

Apply Kisin's precise 2-adic Barsotti–Tate theorem to prove Hypothesis H of KW I §9. Follow Theorem 9.1 to obtain the residual p=2, weight-four case and then odd characteristic with arbitrary even conductor. Include the local type and change-of-prime calculations of that reduction and verify the residual nonsolvable/soluble split. An argument proving only odd conductor is not the full theorem.

**Dependencies:** R27.4 (preceding layer).

<a id="r27-6"></a>

## R27.6. The full classical statement

**Milestone:** `R27.6`

Assemble all cases and R20's optimisation to produce an actual normalised characteristic-zero newform of level N(rho-bar) and weight k(rho-bar), a coefficient prime and an isomorphism with the residual representation. Prove the determinant/character compatibility and coefficient-field invariance. Export the finite-flat weight-two bounded-level consequence used by R29. Keep the assertion for arbitrary higher-dimensional representations or arbitrary base number fields outside this theorem.

**Dependencies:** R27.5 (preceding layer).

## Required examples and checks

Require separate tests of odd conductor, even conductor, p=2 weight two, p=2 weight four and a cyclotomic twist with larger original Serre weight. The final target must admit a p=2 representation with trivial complex-conjugation image when it satisfies the actual hypotheses.



## References

KW1, KW2, KISIN2, SERRE87, EDIXHOVEN92, ROSSER_SCHOENFELD62, WIESE04. The bibliography records what was inspected and what remains to be transcribed.

## Additional strand: A modern proof of classical Serre modularity


Implement the shorter qualitative proof of Dieulefait–Pacetti, together with the established classical weight-and-level refinement. This gives a modern continuation of the family, using stronger lifting theorems rather than pretending those theorems are free improvements to the KW proof.

## Existing material and ownership

R32 supplies the exact regular de Rham lifting statements; R24 prescribed lifts and almost strictly compatible systems; R25 arithmetic base cases; R17 soluble-image modularity; R21 the ordinary small-prime branch; R15/R20 classical weight and level. The dyadic exceptional strong refinement is supplied by the stated KW subtheorem in R27. The independent qualitative part and the shared strong refinement must be distinguished.

## Conventions

Follow the source's actual auxiliary-prime notation and translate it into the common arithmetic convention. The paper establishes qualitative modularity, then invokes the established classical optimisation. It is not a proof of the general Katz weight-one refinement. Do not require strict local compatibility at every coefficient prime when the system only provides an almost strict one.


<a id="r33-1"></a>

## R33.1. Qualitative target and first weight change

**Milestone:** `R33.1`

State the weak Serre theorem for all odd residual characteristics and the soluble/nonsoluble branches. Follow the source's first weight-change step: choose the large coefficient characteristic with the required Fontaine–Laffaille bound, obtain a weight-two lift and a compatible system, and terminate reducible/soluble branches with the appropriate R32/R17 theorem. Verify the local and image hypotheses at the return transfer.

**Dependencies:** [ArithmeticGaloisRepresentations R01.6](../ArithmeticGaloisRepresentations/README.md#r01-6); [AlgebraicModularFormsAndSerreWeights R15.6](../AlgebraicModularFormsAndSerreWeights/README.md#r15-6); [GL2AutomorphicRepresentationsAndTransfer R17.6](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-6); [SerreWeightAndLevelOptimisation R20.6](../SerreWeightAndLevelOptimisation/README.md#r20-6); [OrdinaryAutomorphicFormsAndModularityLifting R21.6](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-6); [PotentialModularityAndCompatibleSystems R24.6](../PotentialModularityAndCompatibleSystems/README.md#r24-6); [SmallRamificationAndAbelianVarietyBaseCases R25.6](../SmallRamificationAndAbelianVarietyBaseCases/README.md#r25-6); [GL2ModularityLifting R32.6](../GL2ModularityLifting/README.md#r32-6).

<a id="r33-2"></a>

## R33.2. Good-dihedral auxiliary ramification

**Milestone:** `R33.2`

Choose the auxiliary primes with their splitting, congruence, size and inertia-order conditions and construct the prescribed local lift. Prove the good-dihedral image control through the specified range of coefficient characteristics. Carry out removal of the other odd ramified primes, keeping the good-dihedral prime until it has served its purpose.

**Dependencies:** R33.1 (preceding layer).

<a id="r33-3"></a>

## R33.3. The prime two and the auxiliary prime

**Milestone:** `R33.3`

Follow the source's weight-two dyadic transition, including the semistable residual weight-four branch, the order-three local type and the finite-flat weight-two step. Then remove the auxiliary prime. In the residually reducible branch at that ramified coefficient prime, use Pan's de Rham theorem: the missing full Weil–Deligne compatibility of an almost strict system is not silently assumed.

**Dependencies:** R33.2 (preceding layer).

<a id="r33-4"></a>

## R33.4. Terminal characteristic five

**Milestone:** `R33.4`

Move to residual characteristic five and handle the weights 2, 4 and 6 as in the source. For weights 2/4 use the characteristic-three ordinary calculation and Skinner–Wiles with the exact residual characters. For weight 6 construct the semistable GL₂-type abelian variety in the cited Snowden form and apply Schoof's prime-5 theorem. Verify dimension, reduction and local type before using the nonexistence theorem.

**Dependencies:** R33.3 (preceding layer).

<a id="r33-5"></a>

## R33.5. Characteristic two and qualitative closure

**Milestone:** `R33.5`

Prove the remaining characteristic-two cases using Rohrlich–Tunnell for soluble image and the supplied weight-two lift/compatible-system and dyadic de Rham theorem in the nonsolvable case. This stage may use the already established odd-characteristic qualitative theorem, not its own p=2 conclusion. Check all dependence on R32's globalisation sources before certifying this as an independent qualitative proof.

**Dependencies:** R33.4 (preceding layer).

<a id="r33-6"></a>

## R33.6. Classical weight-and-level refinement

**Milestone:** `R33.6`

Apply the precise optimisation theorems, with the KW weight-two dyadic subtheorem supplying the exceptional classical refinement where needed. Produce the same final public Serre theorem as R27, not a competing definition of modularity. Record explicitly that the advertised independence concerns the qualitative argument, while this version of the full classical refinement reuses the assigned earlier optimisation results. Deduce the same R29 elliptic-curve theorem through a theorem parameter or a separate corollary.

**Dependencies:** R33.5 (preceding layer); [ClassicalSerreModularity R27.4](README.md#r27-4).

## Required examples and checks

Check every one of the source's six odd-characteristic steps and its separate characteristic-two section. Require explicit tests for the almost-strict/residually reducible branch and for the distinction between weak modularity and exact classical weight/level.



## References

DP23, PAN22, KW1, RT97, BLZ04. The bibliography records what was inspected and what remains to be transcribed.

## One statement, two proof routes

R26 is the level-one seed, R27 the Khare–Wintenberger full classical route, and R33 the Dieulefait–Pacetti qualitative route followed by the common classical refinement. Their public residual modularity predicate and classical Serre weight/level are the same definitions in AlgebraicModularFormsAndSerreWeights. Preserve the independent proof modules: R26 cannot import R27/R33; the classical R27 module cannot import the modern p-adic local Langlands or R32 module. R33 uses the named R27.4 dyadic strong-refinement input and therefore is not claimed independent for that stronger conclusion. No Katz weight-one strengthening is inferred.


## Implementation handoff: Executable induction and complete case closure

**Stages:** R26.1, R26.3, R26.6, R27.2, R27.5, R27.6, R33.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For each recursive call in the Khare/KW proof write the input characteristic, weight, prime-to-p conductor, auxiliary inertia order and residual-image branch, then the output values and well-founded measure. Attach the exact R24 lifting row and R22 component theorem used on the return path. The independent level-one module supplies both its theorem and the strengthened corollary needed for W₁.

**Acceptance and consumer contract.** The final dispatcher covers odd/even conductor, p=2 weights two/four, reducible intermediate reductions and the dyadic scalar exception. Require one concrete derivation per branch, including twists back to the original representation. R33 must declare its R27 dyadic refinement input; a modern qualitative proof is not automatically an independent proof of the refined statement. Full leaf transcription of the cited primary proofs remains an explicit source-decomposition task.

## Source anchors and prototype coverage

- LevelOneSerreModularity source targets.
- SerreModularity source targets.
- ModernSerreModularity source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
