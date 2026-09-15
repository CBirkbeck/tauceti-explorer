# Roadmap: Finite flat group schemes and integral p-adic Hodge theory

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Build the integral local theory that connects finite-flat residual representations, p-divisible groups and bounded-height Frobenius modules. Its main consumers are Serre weights, local deformation rings, potential modularity and small-ramification base cases.

## Existing material and ownership

ModularCurves #81 owns finite locally free subgroup schemes of elliptic curves, their quotients and pairing theory. General finite flat commutative group schemes and p-divisible groups over local bases extend that work here. Consume the general Hopf-algebra/affine-group-scheme correspondence and fppf descent rather than replacing them. R05 supplies formal moduli geometry and R06 the rational period functors.

## Conventions

Specify covariance/contravariance of Dieudonné and Kisin functors and the Tate-module comparison. Distinguish a finite flat group scheme, its generic-fibre representation, and a finite-flat model of a given representation. Existence, uniqueness and full faithfulness have different ranges of validity; no uniqueness assertion is imposed at p=2 without a theorem.


<a id="r07-1"></a>

## R07.1. Finite flat groups and p-divisible groups

**Milestone:** `R07.1`

Develop Cartier duality, connected–étale sequences over the allowed bases, generic and special fibres, finite-flat subgroup and quotient constructions, and fpqc descent. Define a p-divisible group as compatible finite locally free levels with the exactness and rank conditions. Construct its Tate module and compare duality with the cyclotomic twist. Finite-flat closure of a generic subgroup requires a proof under the correct base hypotheses.

Prove Raynaud's generic-fibre full-faithfulness/uniqueness theorem, Corollary 3.3.6, for finite flat commutative p-primary group schemes over a mixed-characteristic DVR with absolute ramification e<p−1, retaining the source's base hypotheses. Prove flatness of the extended kernel/cokernel and the Ext-injectivity assertion there. Also construct the (p,…,p)-type classification and its tame inertia characters used in R07.5 (Bull. SMF 102 (1974), §§2–3, especially Theorems 3.4.1/3.4.3). There is no e<p−1 case at p=2 with e≥1: dyadic uniqueness must not be obtained by deleting this inequality.

**Dependencies:** [AlgebraicModuliForArithmeticGeometry R09.3](../AlgebraicModuliForArithmeticGeometry/README.md#r09-3).

<a id="r07-2"></a>

## R07.2. Dieudonné theory

**Milestone:** `R07.2`

Construct Dieudonné modules over perfect residue fields and prove the classification in the covariant or contravariant convention chosen above. Include Frobenius/Verschiebung, dimensions, heights, slopes and the ordinary/supersingular cases. Supply the deformation results needed for p-divisible groups over nilpotent thickenings. Field-valued abelian varieties are imported from JacobianChallenge/R10; their p-divisible groups are an application.

**Dependencies:** R07.1 (preceding layer).

<a id="r07-3"></a>

## R07.3. Fontaine–Laffaille theory

**Milestone:** `R07.3`

Construct the integral filtered modules and the Galois functor, prove exactness and full faithfulness in the valid range, and identify the finite-flat and crystalline examples used in the programme. Prove how torsion subquotients and reductions change the filtration. Do not extend the range to its endpoints by notation: additional local arguments at weights p and p+1 are required in R08/R22.

Use an absolutely unramified base K=K₀ (e=1). For the unrestricted torsion full-faithfulness statement, after a common Tate shift keep filtration indices in [0,p−2], with the covariance and HT-sign translation explicitly proved. Distinguish this from the rational admissibility theorem for filtration length <p (Fontaine–Laffaille Theorem 8.4). At the wider [0,p−1] endpoint, the unrestricted torsion functor is not fully faithful: §0.9 identifies the collision of the weight-0 and weight-(p−1) rank-one objects. Prove endpoint full faithfulness only on the §0.9/§6 restricted subcategories (excluding the specified endpoint subobjects or quotients); do not replace those restrictions by a change of notation. At p=2 the safe interval is only [0,0]; weight-two and higher applications use their separately proved Breuil–Kisin/dyadic branches.

**Dependencies:** [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2](README.md#r07-2); [PadicHodgeTheory R06.2](../PadicHodgeTheory/README.md#r06-2).

<a id="r07-4"></a>

## R07.4. Breuil–Kisin modules

**Milestone:** `R07.4`

Construct the power-series coefficient ring, Frobenius modules and the height bound determined by the Eisenstein polynomial. Prove the appropriate classification of finite-flat groups and p-divisible groups, including descent data and generic-fibre comparison, for the base fields used in KW and Kisin. Separate finite-flat, potentially Barsotti–Tate and merely potentially semistable cases. Include the dyadic theorem rather than assuming p>2 throughout.

**Dependencies:** [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2](README.md#r07-2); [PadicHodgeTheory R06.2](../PadicHodgeTheory/README.md#r06-2).

<a id="r07-5"></a>

## R07.5. Local residual types and Serre weights

**Milestone:** `R07.5`

Derive the inertia characters of good ordinary and supersingular elliptic-curve torsion and the extension-sensitive finite-flat criteria. Supply the finite-flat generic-fibre calculations from which R15 later proves the p=2 Serre-weight dichotomy and the weight-two criterion for p≥5. Prove the extension-class distinctions used in the peu/très ramifiée cases. These computations feed the explicit recipe in R15, not an axiom defining the weight by desired modularity.

**Dependencies:** R07.4 (preceding layer).

<a id="r07-6"></a>

## R07.6. Integral deformation and ramification consequences

**Milestone:** `R07.6`

Prove the deformation-theoretic tangent and obstruction calculations supplied to R08, and the ramification bounds on torsion of finite-flat/p-divisible groups used in R25. Compare finite-flat models under field extension and twisting, and state exactly when a local deformation condition is stable under those operations. Supply the Galois-module comparison for abelian-scheme torsion from R10.

**Dependencies:** R07.2; R07.5; AbelianSchemesAndArithmeticModuli A3; CrystallineCohomology CR.0; CrystallineCohomology CR.1; [DerivedDeRhamCohomology DD.0](../DerivedDeRhamCohomology/README.md); [DerivedDeRhamCohomology DD.1](../DerivedDeRhamCohomology/README.md).

The Fontaine ramification input is *Il n'y a pas de variété abélienne sur Z*, Theorem A/§2.1: for finite flat p^n-torsion over the specified mixed-characteristic complete DVR, the upper ramification cutoff is u>e(n+1/(p−1)) in Fontaine's shifted convention G^(u)=G^{u−1}. The normalized different bound uses v(p)=1. Prove the convention translation to R01 before exporting this to SmallRamificationAndAbelianVarietyBaseCases; Fontaine's §2.2 higher-cohomological speculation is not a theorem target.

## Required examples and checks

Check μ_{p^n}, the constant group Z/p^n, an ordinary connected–étale extension, and supersingular elliptic torsion. Include two nonisomorphic integral models where generic-fibre uniqueness fails, to prevent accidental full faithfulness outside its range.



## References

FONTAINE_LAFFAILLE, KISIN09F, KISIN2, KW2, SAVITT05, LIU13. The bibliography records what was inspected and what remains to be transcribed.

## Integral ownership and deformation comparisons

This is the sole owner of dimension-general finite flat commutative group schemes, Cartier duality and Barsotti–Tate groups from Shimura A3–A4/T0 and Serre R07. Import generic PD thickenings/envelopes and the crystalline site/crystal/connection APIs from [CrystallineCohomology CR.0–CR.1](../CrystallineCohomology/README.md#cr-0); CR.7 exports the general cohomological handoff. R07.2 constructs the actual Dieudonné crystal of a group and proves its classification, and R07.6 proves the Grothendieck–Messing deformation equivalence over nilpotent PD bases under its exact hypotheses. Generic cotangent complexes and derived completion are imported from DerivedDeRhamCohomology DD.0–DD.1, not rebuilt here. Prove compatibility with endomorphisms, polarizations, duality and change of base. AbelianSchemesAndArithmeticModuli applies this to Serre–Tate theory; HodgeTateAndCanonicalSubgroups applies it to integral differentials and canonical subgroups. Breuil–Kisin classification in R07.4 remains distinct from the proper-cohomological descent to Breuil–Kisin modules in AInfCohomology AI.7; neither imports the other's later application as a prerequisite for its own definition.

Give separate covariant/contravariant comparison functors instead of silently switching the Tate twist. Source p-adic L-functions R09 L2 crystalline lattices, Fontaine–Laffaille/Breuil–Kisin and finite-flat prerequisites are shared here; Wach and Herr foundations are PhiGammaModulesAndIwasawaCohomology PG.6 and PG.3, based on PadicHodgeTheory's common period rings. Regulator maps are PadicHodgeRegulators. Include the dyadic classification with its additional hypotheses, using Liu's Barsotti–Tate/Kisin-module comparison as a checked source rather than extending an odd-prime theorem syntactically.


## Implementation handoff: Integral local ranges and deformation transport

**Stages:** R07.1, R07.3, R07.4, R07.5, R07.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Maintain a theorem table with base DVR, ramification index, residue characteristic, torsion exponent, filtration interval, covariance and permitted descent data. Construct the Galois functor, its exactness and its fully faithful range separately from essential surjectivity. Record the precise integral model used by every finite-flat representation.

**Acceptance and consumer contract.** Check that the e<p−1 uniqueness row cannot dispatch to p=2. Compare the two rank-one endpoint objects in the Fontaine–Laffaille failure example, and route endpoint weights to a separately proved restricted/Breuil–Kisin theorem. For Grothendieck–Messing export the nilpotent divided-power thickening and compatible filtration, so A4 cannot apply it to an arbitrary thickening.

## Source anchors and prototype coverage

- FiniteFlatGroupsAndIntegralPadicHodgeTheory source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
