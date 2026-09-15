# Roadmap: p-adic Hodge theory and geometric comparison

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct the period functors and comparison theorems required to show that geometric and automorphic representations satisfy the hypotheses of local deformation and modularity-lifting theorems. The starting point is not “assume p-adic Hodge theory”: period rings, admissibility and the geometric comparison are each assigned below.

## Existing material and ownership

Consume local fields, completions and Witt vectors from the existing portfolio and Mathlib. AdicSpaces supplies some Fontaine-ring ingredients for its Fargues–Fontaine construction, but explicitly does not supply B_cris, B_st, p-adic Hodge comparison or the vector-bundle classification. R05 supplies formal geometry. Étale cohomology and ℓ-adic realisations come from #196; using an abstract cohomology functor is not a substitute for these comparisons.

## Conventions

Use HT(χ_p)=+1 and record the translation from sources with the opposite convention. Treat representations over finite extensions of Q_p, not just Q_p coefficients. Define crystalline, semistable, potentially semistable and de Rham by the actual period functors and dimension/comparison conditions. Hodge type, inertial type and Frobenius eigenvalues are different data.


<a id="r06-1"></a>

## R06.1. Period rings

**Milestone:** `R06.1`

Import C_p and its tilt from PerfectoidSpaces, the shared A_inf/theta and integral PD-period maps from [AInfCohomology AI.0](../AInfCohomology/README.md#ai-0), and generic PD envelopes from [CrystallineCohomology CR.0](../CrystallineCohomology/README.md#cr-0). Construct B_dR^+, its filtration and B_dR, B_cris^+, B_cris and B_st from those same objects. Prove the topological, Galois, Frobenius, filtration and monodromy properties and comparison with the arithmetic construction. Generic derived completion and cotangent complexes belong to DerivedDeRhamCohomology DD.0–DD.1; this stage applies them and does not introduce a second A_inf/theta or PD-envelope carrier. The existence and invariants of the rational period rings remain mathematical targets, not opaque constants.

**Dependencies:** [AInfCohomology AI.0:integral](../AInfCohomology/README.md); [ArithmeticGaloisRepresentations R01.1](../ArithmeticGaloisRepresentations/README.md#r01-1); [CrystallineCohomology CR.0](../CrystallineCohomology/README.md); [DerivedDeRhamCohomology DD.1](../DerivedDeRhamCohomology/README.md); [PerfectoidSpaces P1](../PerfectoidSpaces/README.md); [PerfectoidSpaces P2](../PerfectoidSpaces/README.md).

<a id="r06-2"></a>

## R06.2. Period functors and admissibility

**Milestone:** `R06.2`

Define D_HT, D_dR, D_cris and D_st and their comparison maps. Prove invariants, dimension bounds, exactness in the admissible categories, tensor/dual compatibility, descent under finite extension, and base change of coefficients. Construct filtered (φ,N)-modules with descent data. Prove weak admissibility versus admissibility in the precise setting used to construct representations and local deformation spaces.

**Dependencies:** R06.1 (preceding layer).

<a id="r06-3"></a>

## R06.3. Monodromy and Weil–Deligne comparison at p

**Milestone:** `R06.3`

Prove the p-adic monodromy theorem needed to attach a potentially semistable Weil–Deligne parameter to a de Rham representation. Define that parameter from D_st after a finite extension and prove independence and descent. Compare the determinant, twists and Frobenius conventions with R01. Trivial inertia and zero monodromy do not impose a predetermined pair of Frobenius eigenvalues.

**Dependencies:** R06.2 (preceding layer).

<a id="r06-4"></a>

## R06.4. Integral and small-weight interface

**Milestone:** `R06.4`

Prove the rational consequences and small-weight comparison interface of the integral classifications constructed in R07.3–R07.4. The period-functor foundations are R06.2; this later stage is not a prerequisite for those classifications. Fontaine–Laffaille uses e=1, unrestricted torsion full faithfulness in a common shifted interval [0,p−2], and rational admissibility at filtration length <p. The wider torsion endpoint [0,p−1] requires the explicit nilpotent/unipotent restrictions in Fontaine–Laffaille §0.9/§6. Translate the filtration indices to HT(χ_p)=+1 instead of changing covariance silently. State separately p=2 and modular weights p and p+1, which need the appropriate Breuil–Kisin/local theorem. Include the ordinary and crystalline criteria actually invoked in those branches.

**Dependencies:** [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-3); [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-4); [PadicHodgeTheory R06.2](README.md#r06-2).

<a id="r06-5"></a>

## R06.5. Geometric comparison theorems

**Milestone:** `R06.5`

Import de Rham and crystalline/log-crystalline cohomology from DerivedDeRhamCohomology DD.2/DD.6 and CrystallineCohomology CR.1–CR.6, and the actual proper-smooth crystalline, de Rham and semistable comparison theorems from [CohomologyComparisons CP.2–CP.4](../CohomologyComparisons/README.md#cp-2). This stage owns their representation-theoretic applications to abelian varieties, modular curves, Kuga–Sato varieties and Shimura curves: identify the R06.2 period functors with geometric cohomology, prove admissibility and recover Hodge filtrations, weights, cohomological duals and Tate twists. Do not reconstruct sites, crystals or the geometric comparison morphism here. General étale realization is consumed from #196/JacobianChallenge and WeightsInEtaleCohomology.

**Dependencies:** R06.2; R06.4; WeightsInEtaleCohomology R34.3 for the semistable geometric branch; [CohomologyComparisons CP.2](../CohomologyComparisons/README.md); [CohomologyComparisons CP.3](../CohomologyComparisons/README.md); [CohomologyComparisons CP.4](../CohomologyComparisons/README.md); [CrystallineCohomology CR.6](../CrystallineCohomology/README.md); [DerivedDeRhamCohomology DD.2](../DerivedDeRhamCohomology/README.md).

<a id="r06-6"></a>

## R06.6. Arithmetic consequences

**Milestone:** `R06.6`

Deduce good-reduction crystalline and semistable-reduction semistable statements for Tate modules. Compute the Tate-curve extension class and its filtered (φ,N)-module. Supply the functorial p-adic local–global compatibility inputs used by R19. Do not conclude that every de Rham representation is crystalline, or that the bad coefficient-prime parameter of an almost strictly compatible system is determined without the extra source hypothesis.

**Dependencies:** R06.5 (preceding layer).

## Required examples and checks

Compute Q_p, Q_p(1), an unramified twist and the Tate-curve representation. For a good ordinary and a good supersingular elliptic curve, verify the same Hodge weights but different Frobenius structures. Test duality signs against the arithmetic determinant.



## References

FONTAINE, FONTAINE_LAFFAILLE, KISIN08, T_SAITO. The bibliography records what was inspected and what remains to be transcribed.

<a id="p7"></a>

## P7. Robba analytic foundations and representation-theoretic handoffs

<a id="p7-annulus-foundations"></a>
<a id="stage-P7:annulus-foundations"></a>

### P7:annulus-foundations. Early analytic coefficient rings

Construct the bounded, overconvergent and Robba coefficient rings from actual convergent Laurent series on annuli, their norms/topologies and restriction maps, Frobenius and cyclotomic Γ action. Prove annulus/limit and coefficient-extension comparisons, and the relevant completed tensor identities. This early stage uses local-field/Witt/analytic foundations and R06.1 only; it does not consume Herr, Wach, regulators, Colmez or global modularity.

The sole owner of étale (φ,Γ)-modules and their Galois equivalence is [PhiGammaModulesAndIwasawaCohomology PG.0–PG.3](../PhiGammaModulesAndIwasawaCohomology/README.md). PG.4–PG.5 construct ψ and the cyclotomic Iwasawa comparison; PG.6 constructs Wach modules. Import those results for the period-functor comparison, with cup products, duality, twists and residue normalization matched to ArithmeticGaloisDuality. No second Herr or Wach carrier is constructed here.

Compare PG.6's Wach realization with the D_cris filtration of R06.2 and R07.3–R07.4's integral lattices under the overlapping crystalline, weight and base-field hypotheses; the Wach construction/classification and Frobenius matrices remain PG.6. Bloch–Kato exponential, Perrin–Riou regulators and signed Coleman maps remain PadicHodgeRegulators. Colmez's GL₂(Q_p) correspondence imports PG.1–PG.3 and does not own their general foundations.

<a id="p8"></a>

## P8. Shared relative period sheaves

<a id="p8-local-rational"></a>
<a id="stage-P8:local-rational"></a>

### P8:local-rational. Period sheaves and local Poincaré lemma

This is the early cut used by CohomologyComparisons CP.3: construct only the rational relative period sheaves, local acyclicity, strictness and local Poincaré lemma below, from R06.1, AInfCohomology AI.3 and AdicEtaleGeometry. It does not use CP.3/CP.4. The proper comparison/application suffix of P8 subsequently imports CP.3/CP.4. Keep these two dependency directions distinct.

On the analytic pro-étale site supplied by AdicEtaleGeometry import the integral A_inf sheaf from [AInfCohomology AI.3](../AInfCohomology/README.md#ai-3). Construct the rational structural B_dR and crystalline/semistable period sheaves from the same rings as R06.1. Prove rational local acyclicity, filtration strictness and the relative Poincaré lemma; apply CohomologyComparisons CP.3–CP.4 to the proper-smooth comparison with connection and tensor compatibility. Integral AΩ, Lη, BKF modules and integral proper-cohomology comparisons remain AI.1–AI.7/CP.1, not duplicate P8 constructions. Supply degree-one abelian comparison to HodgeTateAndCanonicalSubgroups T1. That roadmap owns the logarithmic Kummer-site extension, canonical automorphic local systems and subgroup estimates; FarguesFontaineDiamonds owns the curve, its vector bundles and untilt divisors. All use the same theta map and comparison morphisms.

### Corrected structural period-sheaf construction

Apply Scholze’s 2013 corrigendum throughout P8: the structural B_dR^+ sheaf is formed using the p-adically completed tensor with A_inf before p-inversion and kernel-of-theta completion, followed by the specified colimit/sheafification. The uncompleted tensor formula is not used. AdicEtaleGeometry supplies the corrected pro-étale covering condition; unrestricted continuous open surjections of profinite sets are not assumed to split. The erratum removes the erroneous point descriptions, so comparison proofs use the surviving coherent-topos/site results.


## Source anchors and prototype coverage

- PadicHodgeTheoryForModularity source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

## Completion contracts added on 2026-09-15

**Applies to:** `R06.1`, `R06.2`, `R06.3`, `R06.5`, `P7:annulus-foundations`, `P8:local-rational`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For weakly admissible versus admissible, separate the construction of filtered semilinear objects from the theorem producing a representation: build the degree/slope comparison and recover its invariant lattice/rational representation in the precise discretely valued field setting. For the p-adic monodromy theorem import the Frobenius differential-module theorem from PadicDifferentialEquationsAndRigidCohomology RD.2 together with the Robba/Galois comparison; de Rham implies potentially semistable only after these steps.

### Producer–consumer contract

Normalize monodromy as Nφ=pφN on the cohomological semilinear object. The seed now tests this order on a linearized/coefficient-specialized model. HT(χ_p)=+1 remains the arithmetic convention and must be explicitly translated when passing to filtered cohomology or dual Tate modules.

### Acceptance and source route

Q_p(1), an unramified twist and a Tate curve distinguish Hodge weight, Frobenius eigenvalue and N. P8 local period sheaves and Poincare lemma must be constructed before their proper comparison suffix.

**Source route:** CK §9.1, extracted lines 5498–5512; Fontaine period functors; Kedlaya local monodromy and its Galois application. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
