# Potential Modularity and Compatible Systems

This roadmap builds the field-selection and compatible-family machinery that turns residual modularity into global lifts and transports modularity between coefficient primes. Its geometric core is Moret–Bailly's integral-point theorem with local splitting, completion and avoidance conditions. Its arithmetic core separates residual modular witnesses, finiteness of a global deformation ring, extraction of a characteristic-zero point, modularity of a given lift and construction of a family through that lift. The resulting interfaces support the Khare–Wintenberger proof of Serre's conjecture and the later potential-automorphy arguments that use compatible systems of higher rank.

The generic family objects and their operations are developed independently of potential modularity. They contain actual continuous semisimple representations at coefficient places, common Frobenius polynomials and labeled Hodge data. Automorphic and geometric families then instantiate those objects. In rank two, keep the Khare–Wintenberger local compatibility conditions separate from the BLGGT conditions: an assertion away from the coefficient characteristic cannot replace an assertion at that characteristic.

The endpoints are controlled residual potential modularity, potential modularity of given lifts with the specified local types, finite unframed global rings, lifts of the four required Khare–Wintenberger types, and compatible families through those lifts. Higher-rank systems, monodromy, density-one residual irreducibility, polarized operations and their L-functions are included as reusable infrastructure. General regular de Rham potential modularity, full modularity-lifting theorems and the global proof of Serre's conjecture have their own owners.

## Boundaries and prerequisites

A prerequisite written `Roadmap:Layer/target` denotes that owner's mathematical interface. A reference to a target in this document names the relevant layer and links to its statement. Inputs from the following owners are used with their full hypotheses; their constructions are not repeated here.

| Owner | Interface used here |
| --- | --- |
| SchemeAndStackFoundations SF.1–SF.4; AlgebraicModuliForArithmeticGeometry R09.3 | Smooth and geometrically connected schemes, finite étale torsors, Chow and Bertini reductions, relative Cartier divisors, curve cohomology, Picard representability and compactified Picard schemes |
| AbelianSchemesAndArithmeticModuli A6; HilbertModularVarietiesAndShimuraCurves H6 | Representable twisted Hilbert moduli, descended geometrically connected components, torsion identifications respecting pairings, local points and Weil restriction |
| GlobalNumberFields Layers 9–10; ClassFieldTheory Layers 11–12 and ClassFieldTheoryPartII | Algebraic Hecke characters, units and approximation, reciprocity and l-adic character realization; Chebotarev supplies the prime-selection results |
| ArithmeticGaloisRepresentations R01.1/G7; PadicHodgeTheory R06.3; LocalGaloisDeformationRings R08.2/R08.6/L8 | Continuous arithmetic representations and their operations, finite residual image, stable lattices, local WD and Hodge comparisons, definite local types and their deformation rings |
| GlobalGaloisDeformations R04.6; DeformationAndDerivedPatchingAlgebra R03.3–R03.4 | Global local-condition rings, framed/unframed comparison, presentations and finite-image criteria, finite-flat complete intersections and characteristic-zero integral points |
| GL2AutomorphicRepresentationsAndTransfer R17.3/R17.4/R17.6 | Jacquet–Langlands, soluble base change and descent, with invariance and cuspidality conditions |
| AutomorphicGaloisRepresentations R19.2–R19.6 | Galois realizations of Hilbert forms, common-coefficient eigenform families, away-coefficient comparison and the full Skinner coefficient-prime theorem |
| OrdinaryAutomorphicFormsAndModularityLifting R21.4/R21.5; PadicFamilies L5 | Ordinary R=T, the exceptional CM lifting/base-change interfaces and Hida specializations |
| GL2ModularityLifting R22.4–R22.6 and R32.6 | Allowable base change, full odd-prime and dyadic KW lifting, and the modern residually reducible de Rham transfer |
| ClassicalSerreModularity R27 | Applications of required lifts, good dihedral primes and changes of residual characteristic |
| PotentialAutomorphyInfrastructure PA.5; ModularityAndLanglandsExtensions ML.2 | Higher-rank potential-automorphy endpoints using the field-selection and generic-system interfaces |

In particular, R24.5:operations precedes AutomorphicGaloisRepresentations R19.3/R19.4, AutomorphicGaloisRepresentationsPartII AG2.2/AG2.6/AG2.7 and ComplexMultiplicationAndExplicitReciprocity CM.4. It takes no eigenform or potential-modularity theorem as a premise. The construction of an eigenform family belongs to R19; proving that a supplied lift becomes automorphic belongs to R23.4; assembling its descended family belongs to R24.5.

## Conventions and existing library interfaces

Fix algebraic closures and the compatible embeddings needed to compare local groups. Write G_F for the absolute Galois group with its Krull topology. Every arithmetic representation is continuous; an algebraic representation by itself does not include that condition. A residual representation is the semisimplification of reduction of a stable lattice, with independence up to isomorphism. Absolute irreducibility includes coefficient extension. S-type and normalized Serre weight use the ClassicalSerreModularity R27 conventions, with normalized weights at least two. The residual prime of the starting representation is p; l is the residue characteristic of a system's coefficient place λ; q or v denotes a place of its base field. In Taylor's auxiliary ordinary construction l is the starting prime and p is a distinct auxiliary prime.

For the KW rank-two endpoints use their arithmetic-Frobenius and Hodge–Tate normalization, HT(ε)=+1. For the BLGGT generic carrier use geometric Frobenius and HT(ε)=−1. Thus the geometric cyclotomic system has good polynomial X−q_v⁻¹ and pure weight −2. A weight-k newform has cohomological geometric data H={0,k−1}, Q_v=X²−a_vX+q_v^(k−1); the KW arithmetic member is its contragredient with KW's Hodge convention. State the dualization and reciprocity comparison when moving between carriers. A common coefficient field is a number field, and Frobenius comparisons are made after its embeddings into the respective local algebraic closures, never by directly equating values in unrelated l-adic fields.

Weil–Deligne comparison means Frobenius semisimplification; it retains the monodromy operator N. Unramified WD data mean trivial inertia and N=0. For de Rham members this condition implies crystallinity at the coefficient prime through R06.3. Inertial type alone forgets N and does not certify a local lift with a prescribed determinant. The global rings used in finiteness and point extraction are unframed, with fixed determinant; their framed formal power-series enlargements have a different finiteness behavior.

A Skolem point must satisfy every local embedding condition. Splitting after tensoring with L_v means a product of copies of L_v as an L_v-algebra. It is weaker than prescribing each completion to be L_v. A prescribed-completion theorem is identified explicitly when that stronger conclusion is needed. Galois closure and avoidance are tracked throughout; an intersection computation cannot replace the tensor definition of disjointness without its finite Galois hypotheses.

Use the following library primitives at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- `IntermediateField.LinearDisjoint` supplies tensor-based field disjointness. `LinearDisjoint.inf_eq_bot` gives trivial intersection; `LinearDisjoint.iff_inf_eq_bot` has finite-dimensional hypotheses on both fields and a Galois hypothesis on the left one.
- `AlgebraicGeometry.Spec` and `Scheme.Modules.pullback` supply scheme points and restriction of module sheaves. Tau Ceti's `InvertibleSheaf` and `InvertibleSheaf.trivial` supply the line bundles and trivial bundle. `LineBundleClass.mk_eq_mk_iff` recognizes equality of unrigidified classes by a sheaf isomorphism. R23.1 adds rigidifications, their compatible isomorphisms and the relative curve construction.
- `NumberField.Chebotarev.frobeniusPrimeSet` defines the set of unramified primes of an Artin conjugacy class. Prime existence and density are theorems of the Chebotarev roadmap.
- `Field.absoluteGaloisGroup`, `Representation`, `Representation.IsSemisimpleRepresentation`, `Representation.IsIrreducible` and `Representation.dual` provide the Krull-topological Galois group and algebraic representation interfaces. Continuity, finite ramification and absolute irreducibility are additional arithmetic conditions. `NumberField.FinitePlace` and `FinitePlace.embedding` provide coefficient places and completion embeddings. `LinearMap.charpoly` applies to finite free modules.
- `Representation.ind` and `Rep.indResAdjunction` give algebraic induction and its restriction adjunction for groups over a commutative ring. Arithmetic continuity and finite-dimensionality are supplied by R01.1/G7. `Finsupp` gives an additive irreducible-multiplicity lattice; tensor product needs its own structure constants.
- `MvPowerSeries`, `IsLocalRing`, `IsDiscreteValuationRing`, `IsAdicComplete`, `ringKrullDim`, `RingTheory.Sequence.IsRegular` and `Module.Flat` are the commutative-algebra vocabulary. Regularity includes a nonzero final quotient, and a DVR is not a field. The regular-local and Cohen–Macaulay algebra comes from R03.3; point extraction comes from R03.4.
- `Complex.Gammaℝ`, `Complex.Gammaℂ` and `Complex.Gammaℝ_mul_Gammaℝ_add_one` give the real and complex archimedean factors and their duplication identity.
- `NumberField.InfinitePlace.Completion` and `HeightOneSpectrum.adicCompletion` give the completion `K_v` at every place, `IsModuleTopology` the canonical topology on a finite extension of `K_v`, and `IntermediateField.LinearDisjoint`, `algebraicClosure` and `IntermediateField.extendScalars` the field-theoretic conditions. `Field.absoluteGaloisGroup.map` restricts Galois representations along field embeddings, `cyclotomicCharacter` and `PadicAlgCl` give the `p`-adic cyclotomic character and `ℚ̄_p`, and `NumberField.IsTotallyReal`, `NumberField.IsCMField` and `NumberField.Set.HasDirichletDensity` the field and density conditions.
- `AlgebraicGeometry.IsSeparated`, `LocallyOfFiniteType`, `Surjective`, `Smooth`, `GeometricallyConnected`, `GeometricallyIntegral`, `IsOpenImmersion`, `IsClosedImmersion`, `AffineSpace` and `topologicalKrullDim` give the scheme-theoretic conditions on Skolem data and their reductions.

Names in the API outlines below are those of [Suggested.lean](Suggested.lean): `TauCeti.PotentialModularity` for R23 and `TauCeti.CompatibleSystems` for R24. The mathematical definitions, hypotheses and tests in this README determine their intended meaning. The Lean file states every target, API item and test with `sorry` proofs. Objects owned by other roadmaps (Frobenius and inertia at a place, cuspidal representations and their Galois realizations, Hilbert–Blumenthal abelian varieties, deformation rings, Weil–Deligne and Hodge–Tate data, Hecke algebras, the analytic topology on local points) enter there as opaque data named after their owners, every predicate is defined from data, and a hypothesis that cannot yet be stated is named in the docstring of its declaration.

## Order of construction

The generic-system layer is displayed first because it is independent of the existence theorems and is used by the automorphic-family suppliers. The remaining layers follow the arithmetic argument.

| Layer | Construction |
| --- | --- |
| R24.5:operations | Actual compatible-family carriers, operations, character and Artin examples, L-functions, polarizations and monodromy |
| R23.1 | Integral points with local conditions and field control |
| R23.2 | Auxiliary characters, torsion and Hilbert moduli applications |
| R23.3 | Residual potential modularity and the weight/level refinements |
| R23.4 | Potential modularity of a separately supplied lift |
| R23.5 | Splitting, local containment, avoidance and admissible descent |
| R23.6 | Residual and given-lift exports and their direction of use |
| R24.1 | Finiteness of unframed global rings |
| R24.2 | Integral characteristic-zero points with prescribed local components |
| R24.3 | Presentation comparison and the four required lift types |
| R24.4 | Modularity lifting over ℚ through the full imported interfaces |
| R24.5 | Genuine Brauer families through potentially modular lifts and strict compatibility |
| R24.6 | Residual members and modularity transfer between linked families |

<a id="layer-r24-5-operations"></a>
## R24.5:operations — Compatible-family infrastructure


Construct the carrier and its arithmetic operations before invoking any automorphic-family existence theorem. Character and Artin families give basic examples. Monodromy and density-one results use this same carrier, together with the reductive-group and local arithmetic inputs listed at each target.

<a id="target-weakly-compatible-system-rank-n"></a>
### Weakly compatible families of arbitrary rank

Fix number fields F,M and rank n. A weakly compatible system consists of a finite exceptional set S, monic Q_v∈M[X] of degree n for v∉S, continuous semisimple r_λ:G_F→GL_n(M̄_λ) at every finite place λ of M, and n-element Hodge multisets H_τ for every τ:F↪M̄. At λ of residue characteristic l and v∉S with v∤l, require unramifiedness and geometric-Frobenius characteristic polynomial ι_λ(Q_v). At every v|l require de Rham behavior, and crystallinity if v∉S. Every coefficient embedding extending λ must identify the labeled Hodge multiset with H_τ.

These are data and axioms of the carrier, including the actual representations; common traces alone are insufficient. Taylor's rank-d contract over ℚ asks instead for fixed Hodge–Tate weights at all λ and crystallinity outside S, without separately requiring de Rham behavior at exceptional coefficient primes. The KW rank-two carrier also contains all-place WD parameters. Its comparison with this weak carrier therefore checks the additional all-member de Rham and outside-S crystalline conditions.

**API.**

- `WeaklyCompatibleSystem`: (M, S, Q_v, r_λ, H_τ) with the compatibility conditions.
- `WeaklyCompatibleSystem.rank`: The rank n.
- `WeaklyCompatibleSystem.charpoly_frob`: For v ∉ S, v ∤ l: r_λ unramified at v with charpoly r_λ(Frob_v) = Q_v.
- `WeaklyCompatibleSystem.deRham`: r_λ|_{G_{F_v}} de Rham for v | l, crystalline for v ∉ S.
- `WeaklyCompatibleSystem.ofCompatibleSystem`: Convert a rank-two KW system only with additional hypotheses: every coefficient member is de Rham of the common weights at every place above ℓ and crystalline outside an enlarged fixed finite S. Plain or almost strict compatibility alone does not imply these.
- `WeaklyCompatibleSystem.enlargeRamificationSet`: For finite S⊆S′, keep every r_λ and H_τ, restrict Q_v to v∉S′, obtaining a weakly compatible system.

**Tests.**

- `wcs_cyclotomic`: With geometric Frobenius and HT(ε_ℓ)=−1, ε has rank 1, S=∅, Q_p(X)=X−p⁻¹, H={−1} and weight −2. X−p would be the arithmetic-Frobenius polynomial.
- `wcs_newform_delta`: Use the cohomological member of the Δ family in BLGGT convention: rank 2, H={0,11}, Q_p(X)=X²−τ(p)X+p¹¹; Q₂=X²+24X+2048. The KW arithmetic member is its contragredient, with their HT(ε)=+1 convention.
- `wcs_not_just_traces`: Two systems with the same Q_v are isomorphic member by member only up to conjugation; the carrier stores the r_λ themselves.
- `wcs_S_enlarge`: Enlarging S gives an equivalent system (fewer polynomials, same representations).

**Lean name:** `TauCeti.CompatibleSystems.WeaklyCompatibleSystem`.

**Sources:** [BLGGT v1][blggt-2014], §5.1, definition of a weakly compatible system, p. 51 (arXiv v1; printed page = PDF page); [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, rank d weakly compatible systems over ℚ, p. 773 (PDF page 45).

**Prerequisites:** `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `PadicHodgeTheory:R06.2`; `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`; `mathlib:LinearMap.charpoly`; `mathlib:NumberField.FinitePlace`; `mathlib:NumberField.FinitePlace.embedding`.

<a id="target-compatible-system"></a>
### Rank-two plain, almost-strict and strict families

For number fields F and E, define a rank-two E-rational family with continuous semisimple ρ_ι for every prime l and embedding ι:E↪Q̄_l, a Frobenius-semisimple WD parameter r_q over E at each finite q, unramified except at finitely many q, and fixed integers a≥b. Plain compatibility compares WD parameters whenever q∤l and requires crystallinity of weights (a,b) at coefficient places for sufficiently large l.

KW strictness requires every member to be geometric of these weights and compares WD(ρ_ι|D_q)^Fss with ιr_q at **every** q, using Fontaine's construction when q|l. KW almost strictness adds to plain compatibility two coefficient-prime clauses: full geometric/WD comparison when the semisimplified residual member is irreducible; and, for l≠2 and unramified r_q, crystallinity of the common weights. It imposes no further coefficient-prime comparison in the residually reducible ramified case. Regularity means a≠b. Plain and KW almost-strict carriers need not be de Rham at every member.

Dieulefait–Pacetti use a different almost-strict contract: every member is de Rham at its coefficient prime. Compare their five-tuple only after identifying coefficient embeddings and normalizations. Keep this additional condition explicit when translating between the two definitions.

**API.**

- `CompatibleSystem`: E, the family ρ_ι, the Weil–Deligne data r_𝔮 and the weights (a, b)
- `CompatibleSystem.IsStrict`: compatibility with r_𝔮 at every 𝔮, including 𝔮 above ℓ
- `CompatibleSystem.IsAlmostStrict`: the two conditions at 𝔮 | ℓ (irreducible residual, or ℓ ≠ 2 and r_𝔮 unramified)
- `CompatibleSystem.IsRegular`: a ≠ b
- `CompatibleSystem.IsStrict.isAlmostStrict`: strict ⇒ almost strict ⇒ compatible
- `CompatibleSystem.enlargeCoefficients`: Extend E to a finite number-field extension E′ and reindex embeddings; preserve the same members and local data after extension. Eigenform constructors are imported from R19.3 and are not defined here.

**Tests.**

- `newform_is_strict`: Import the Δ eigenform family from R19.3: weights (11,0), regular and strict after the complete coefficient-prime theorem from R19.5.
- `weight_one_irregular`: a weight-one newform gives an irregular system, a = b = 0
- `almost_strict_not_strict`: The almost-strict axioms supply no WD comparison in the residually reducible ramified coefficient-prime case; this tests the scope of the axioms, not failure of the constructed geometric families.
- `hodge_tate_weights_convention`: weight a + 1 when b = 0: a newform of weight k gives (a, b) = (k − 1, 0)

**Lean name:** `TauCeti.CompatibleSystems.CompatibleSystem`.

**Sources:** [KW I][kw-serre-modularity-I], §5, p. 7 of the preprint, §5, p. 8 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Definition 1.10 and after, p. 7 of the arXiv version.

**Prerequisites:** `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.2`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`.

<a id="target-weakened-compatible-data"></a>
### Very weak and extremely weak families

Extremely weak data retain the number fields, finite exceptional set, actual continuous semisimple members and common monic good Frobenius polynomials of a weak system, but impose only HT_τ(det r_λ)=ΣH_τ at every λ. They require no full-member Hodge or de Rham comparison. Very weak data additionally require crystallinity at all places above l and the full Hodge multisets for l outside a Dirichlet-density-zero set. A weak system is very weak, and a very weak system is extremely weak.

In rank one the determinant condition recovers the full Hodge condition, and character classification gives weak compatibility. In higher rank it controls only the sum of the Hodge entries. Accordingly, induction and Artin-twist purity use the canonical transported Hodge data rather than arbitrary multisets with the same sum.

**API.**

- `ExtremelyWeaklyCompatibleSystem`: The common Q, members and H with determinant-Hodge condition only.
- `VeryWeaklyCompatibleSystem`: Extremely weak data with density-one crystallinity and full labeled Hodge comparisons.
- `WeaklyCompatibleSystem.toVeryWeak`: Forget the all-λ de Rham/full Hodge requirement to the density-one one.
- `VeryWeaklyCompatibleSystem.toExtremelyWeak`: Forget the density-one full-member condition, retaining determinant Hodge comparison.
- `ExtremelyWeaklyCompatibleSystem.hodgeSum`: At every λ, the determinant labeled Hodge number equals Σ H_τ.

**Tests.**

- `weakening_rank_one`: A rank-one H_τ={a} is determined by its determinant Hodge sum a.
- `weakening_higher_rank_metadata`: Rank-two H={0,2} and H′={1,1} have the same determinant sum 2; the determinant condition distinguishes neither the Hodge multiset itself nor regularity.
- `weakening_hodge_purity_not_sum`: For a weight-zero rank-two Artin family, H_τ={−1,1} and H_cτ={0,0} have the correct zero determinant sums but fail H_cτ=−H_τ. Thus extremely weak Hodge metadata need not satisfy purity.
- `weakening_transitive`: The composite weak→very weak→extremely weak map preserves each r_λ, Q_v and H_τ.

**Lean name:** `TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem`.

**Sources:** [ACC+][acc-2023], §7.1, pp.1084–1085.

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `PadicHodgeTheory:R06.2`.

<a id="target-compatible-system-predicates"></a>
### Regularity, purity, strictness and automorphy

Define the following predicates separately on a weak system ℛ=(M,S,Q,r,H). Regular means every H_τ has distinct entries. Extremely regular additionally means that, for some τ, distinct submultisets of the same cardinality have different sums. For rank-one systems over totally real fields, total oddness means r_λ(c_v)=−1. Essential conjugate self-duality is expressed using a character system ℳ of G_(F⁺) and representation-level comparisons; total odd essential conjugate self-duality uses their signed pairing convention.

Irreducibility means irreducibility at every λ over a set of rational primes of Dirichlet density one. BLGGT strict compatibility supplies a WD_v over M̄ with Frobenius-semisimple comparison at all λ **away from the residue characteristic of v**. Purity of weight w requires |ια|²=q_v^w for every good Frobenius root and H_(cτ)={w−h:h∈H_τ}. Strict purity additionally requires every local WD_v pure of weight w, including its monodromy filtration. Automorphy requires a regular algebraic cuspidal π of GL_n(A_F) whose normalized rec(π_v|det|^((1−n)/2)) has the specified good polynomial.

Taylor's strong compatibility over ℚ corresponds to this away-coefficient strictness; his rank-two regularity also includes odd determinant. The CM system convention and its totally real pairing variant must use their respective representation-level definitions. Neither this strictness nor purity upgrades to KW all-place strictness without a coefficient-prime theorem.

**API.**

- `WeaklyCompatibleSystem.IsRegular`: Distinct Hodge–Tate numbers for every τ.
- `WeaklyCompatibleSystem.IsExtremelyRegular`: Regular, and some H_τ has no distinct equal-cardinality submultisets with the same sum.
- `WeaklyCompatibleSystem.IsStrictlyCompatible`: A Weil–Deligne representation WD_v(ℛ) matching every r_λ at v, λ ∤ residue characteristic of v.
- `WeaklyCompatibleSystem.IsPure`: Weight-w purity of the Q_v and the symmetry H_{cτ} = w − H_τ.
- `WeaklyCompatibleSystem.IsEssentiallySelfDual`: Essential conjugate self-duality with a character system of G_{F⁺}, and its totally odd version.
- `WeaklyCompatibleSystem.IsIrreducible`: Irreducible for λ above a density-one set of primes.
- `WeaklyCompatibleSystem.IsAutomorphic`: Frobenius polynomials of a regular algebraic cuspidal π.

**Tests.**

- `pred_newform`: A newform of weight k ≥ 2 is regular, strictly pure of weight k − 1, irreducible and automorphic.
- `pred_regular_fails`: ε ⊕ ε is not regular (H = {−1, −1}).
- `pred_odd_purity`: For n odd and v real, purity forces w even (BLGGT p. 53).
- `pred_strict_vs_almost_strict`: Check the away-coefficient WD comparison separately from the coefficient-prime conditions. BLGGT strictness has no coefficient-prime WD clause, and KW almost strictness requires additional conditions there.

**Lean name:** `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsRegular`.

**Sources:** [BLGGT v1][blggt-2014], §5.1, the subsidiary definitions, p. 51 (arXiv v1; printed page = PDF page), §5.1, strict compatibility and purity, p. 52 (arXiv v1; printed page = PDF page), §5.1, automorphy, p. 53 (arXiv v1; printed page = PDF page); [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, Taylor's remark on motives, p. 773 (PDF page 45).

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:G7`; [R24.5:operations, Polarized weakly compatible families](#target-polarized-system).

<a id="target-linear-algebra-operations-on-systems"></a>
### Linear-algebra operations on families

Over a common coefficient field construct direct sums, semisimplified tensor products, contragredients, symmetric powers and exterior powers. At a good place, sum multiplies the polynomials, tensor multiplies every pair of roots, and the dual polynomial is X^n Q_v(0)⁻¹Q_v(X⁻¹). Symmetric powers use repeated products, exterior powers distinct products. Hodge data are the corresponding disjoint unions, pairwise sums, negatives and repeated/distinct sums.

These operations, restriction and induction preserve weak and away-coefficient strict compatibility with the appropriate enlargement of S. Pure direct sums require equal weights; tensor weights add, duality negates weight, and the k-th powers have weight kw. Restriction and induction preserve weight with their canonical transported Hodge data; local strict purity uses the analogous WD preservation. Duality and restriction preserve regularity. The other operations can create Hodge collisions. Duality preserves irreducibility, while arbitrary sums, tensors, restrictions and inductions need not. Cuspidal automorphy is asserted only through a theorem establishing it for the particular operation.

**API.**

- `directSum`: Members r⊕s; Q_v=Q_r Q_s; H disjoint union; common pure weight required for purity.
- `tensor`: Members (r⊗s)^ss; roots αβ; H all pairwise sums; pure weight w+w′.
- `dual`: Members r∨; normalized reciprocal Q_v; H=−H; pure weight −w.
- `symmetricPower`: Sym^k members and repeated k-fold weight sums; rank binomial(n+k−1,k).
- `exteriorPower`: ∧^k members and distinct k-fold weight sums; rank binomial(n,k), zero if k>n.
- `dual_charpoly`: The normalized reciprocal polynomial is monic of rank n; for rank 2, X²−aX+b becomes X²−(a/b)X+1/b.
- `directSum_pure`: Pure systems of the same weight w have pure direct sum of weight w; differing weights invalidate the conclusion.

**Tests.**

- `dual_rank_two`: X²−aX+b with b≠0 becomes X²−(a/b)X+1/b.
- `sym2_distinct`: For h₁≠h₂, {2h₁,h₁+h₂,2h₂} is distinct, so Sym² of regular rank two stays regular.
- `tensor_collision`: H={0,1} and H′={0,−1} give tensor H={0,−1,1,0}, which is not regular.
- `direct_sum_mixed_weights`: 1⊕ε has geometric-Frobenius roots 1,p⁻¹ and weights 0,−2, so is not pure of one weight.
- `exterior_above_rank`: ∧³ of a rank-two system is the rank-zero system with Q_v=1 and H empty.

**Lean name:** `TauCeti.CompatibleSystems.directSum`.

**Sources:** [BLGGT v1][blggt-2014], §5.1, operations, p. 51 (arXiv v1; printed page = PDF page), §5.1, restriction, p. 53 (arXiv v1; printed page = PDF page).

**Prerequisites:** [R24.5:operations, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [R24.5:operations, Twisting, restriction and induction](#target-system-operations); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:G7`; [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `PadicHodgeTheory:R06.2`.

<a id="target-system-operations"></a>
### Twisting, restriction and induction

Construct twists by strict character systems, restrictions to finite base-field extensions and inductions from finite extensions, applying representation, WD and Hodge operations together. Enlarge S by ramification of the extension for induction, and at each local place use the sum of locally induced WD parameters. Plain compatibility is preserved; all-place strictness is preserved for the de Rham input systems using the local operations of R06.3.

For an almost-strict system the unconditional output is plain. Retaining almost strictness requires checking every newly irreducible residual output against the source's coefficient-prime comparison cases and every unramified coefficient-prime output for crystallinity. A strict character twist preserves the residual irreducibility test in rank two; restriction or induction can change it. A virtual Brauer combination is still a class in a representation ring until genuineness is proved.

**API.**

- `twist`: Memberwise tensor with a strict character system; local WD tensor and Hodge shifts.
- `restrict`: Restrict to G_F′; Q roots raised to residue degrees and H_τ pulled back.
- `induce`: For finite F′/F induce each member, rank multiplied by [F′:F], enlarge S by ramified primes, local WD induction and Hodge multiset union.
- `restrict_charpoly`: At w|v outside S, roots of Q_w are α^[k(w):k(v)] for roots α of Q_v.
- `induce_rank`: Rank Ind_F′^F ℛ=[F′:F] rank ℛ; induction need not preserve regularity or irreducibility.

**Tests.**

- `twist_cyclotomic`: Twisting by ε shifts each BLGGT Hodge number by −1 and pure weight by −2.
- `restrict_trivial_extension`: For F′=F restriction returns the same members, Q and H.
- `induce_quadratic_trivial`: Induce the trivial character across a quadratic extension: rank 2, H={0,0}, polynomial (X−1)² at split good primes and X²−1 at inert good primes.
- `induced_regular_nonexample`: The induced quadratic trivial character is a sum of trivial and quadratic characters and is not regular; generic induction is not an irreducibility theorem.

**Lean name:** `TauCeti.CompatibleSystems.twist`.

**Sources:** [KW II][kw-serre-modularity-II], §10.3.2, p. 93 of the preprint.

**Prerequisites:** [R24.5:operations, Rank-two plain, almost-strict and strict families](#target-compatible-system); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.2`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `mathlib:Representation.ind`; `mathlib:Representation.dual`.

<a id="target-polarized-system"></a>
### Polarized weakly compatible families

For CM F/F⁺ and a weak system ℛ, take a rank-one multiplier system ℳ of G_(F⁺) over the same coefficient field, with ramification below that of ℛ. A polarization includes, for every λ and real place v, an actual perfect pairing B with B(x,y)=ε_vB(y,x), B(r_λ(g)x,r_λ(c_vgc_v)y)=μ_λ(g)B(x,y), and ε_v=−μ_λ(c_v). Total oddness means ε_v=+1 at every real place. Forgetting the pairing gives essential conjugate self-duality, not a polarization witness. For totally real fields use the orthogonal/symplectic convention of BLGGT §2.1 instead of imposing the CM sign equation without a CM extension.

**API.**

- `PolarizedSystem`: Pair ℛ,ℳ with an actual polarization witness at every λ.
- `PolarizedSystem.multiplier`: The rank-one character system ℳ of G_F⁺, including μ(c_v).
- `PolarizedSystem.pairing`: The perfect representation-level pairing from G7, for each λ and real place v.
- `PolarizedSystem.IsTotallyOdd`: All pairing signs ε_v are +1; for CM this requires μ(c_v)=−1.
- `PolarizedSystem.conjugateDual`: Each r_λ^c is isomorphic to r_λ∨⊗μ_λ|G_F, with the specified pairing.

**Tests.**

- `polarized_cm_unit`: The trivial rank-one system on G_F has a symmetric pairing and CM multiplier δ_F/F⁺, with μ(c_v)=−1; multiplier 1 has the wrong BLGGT sign.
- `polarized_rank_two`: For the cohomological elliptic family over a CM field, use the rank-two duality pairing with the properly normalized multiplier and its real-place sign; total oddness is tested on the actual conjugate pairing, not only det on G_F.
- `polarized_multiplier_wrong`: Changing μ(c_v) while retaining the same pairing reverses the required CM equation ε_v=−μ(c_v).
- `polarized_forget_pairing`: Forgetting the perfect signed pairing gives r^c≅r∨⊗μ; an isomorphism alone does not determine a correctly signed polarization.

**Lean name:** `TauCeti.CompatibleSystems.PolarizedSystem`.

**Sources:** [BLGGT v4][blggt-2014-v4], §2.1, p.31; §5.1, p.62.

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:G7`.

<a id="target-polarized-operations"></a>
### Operations with polarization witnesses

Write δ=δ_(F/F⁺) in the CM setting. Duality has multiplier μ⁻¹ and the same sign. Tensor product has multiplier μμ′δ and sign εε′; the quadratic factor corrects the value at complex conjugation while restricting trivially to G_F. For nonzero k-th symmetric or exterior powers in characteristic zero use sign ε^k and multiplier μ^kδ^(k−1). At k=0 the unit has multiplier δ and sign +1, consistent with the integer exponent in that formula.

Direct sums require the same multiplier and signs. A character twist uses μ times the extension of χχ^c having value +1 at complex conjugation. Restriction requires compatible CM fields and real subfields. Induction requires a specified extension of the multiplier and a check of the induced perfect pairing and sign. Check regularity and irreducibility independently of these pairing constructions.

**API.**

- `PolarizedSystem.tensor`: Tensor pairings and multiplier μμ′δ; signs multiply.
- `PolarizedSystem.dual`: Dual perfect pairings and inverse multiplier.
- `PolarizedSystem.twist`: Twist by χ with norm-character multiplier correction.
- `PolarizedSystem.power`: Symmetric/exterior k-th pairing with μ^kδ^(k−1) and ε^k.
- `PolarizedSystem.tensor_isTotallyOdd`: Two totally odd CM systems yield a totally odd normalized tensor system.

**Tests.**

- `polarized_tensor_sign`: ε=ε′=+1, μ(c)=μ′(c)=−1: uncorrected product has μμ′(c)=+1; corrected μμ′δ(c)=−1.
- `polarized_dual_sign`: Inverse of a −1 multiplier at c is −1, matching the unchanged +1 sign.
- `polarized_unit_tensor`: The polarized CM unit has μ=δ; tensoring it with (ℛ,μ) gives μδδ=μ.
- `polarized_sum_mismatch`: A block sum of pairings with signs +1 and −1 is neither symmetric nor alternating; there is no common sign without changing the inputs.

**Lean name:** `TauCeti.CompatibleSystems.PolarizedSystem.tensor`.

**Sources:** [BLGGT v4][blggt-2014-v4], §2.1, p.31; §5.1, p.62; tensor-product use in §4.3.

**Prerequisites:** [R24.5:operations, Polarized weakly compatible families](#target-polarized-system); [R24.5:operations, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); `ArithmeticGaloisRepresentations:G7`.

<a id="target-character-system"></a>
### Algebraic character families

Use a type-A₀ algebraic Hecke character χ of F, with a number field M containing its algebraic finite values, to assemble the common-coefficient rank-one family of its l-adic realizations. It is de Rham at every coefficient place and crystalline outside the finite conductor set. If its connected-infinity character is ∏_τ(τx)^(−a_τ), its labeled Hodge multiset is {a_τ}. The good geometric-Frobenius polynomial comes from the common algebraic character value and the fixed reciprocity convention.

Conversely, the classification of finitely ramified algebraic/de Rham l-adic characters supplies such a Hecke character. Import Hecke characters and their infinity-type purity from GlobalNumberFields Layers 9–10, reciprocity from ClassFieldTheory Layers 11–12, and the l-adic realization/classification comparison from ClassFieldTheory Part II. This target assembles their realizations into a system.

**API.**

- `characterSystem`: Assemble the common-field rank-one family from the owner’s algebraic Hecke character realizations.
- `characterSystem_hodge`: H_τ={a_τ} for connected-infinity exponent −a_τ.
- `characterSystem_frob`: The common linear polynomial matches the geometric Frobenius value with the chosen Artin convention.
- `characterSystem_unique`: Unique up to memberwise representation isomorphism from good Frobenius polynomials.

**Tests.**

- `character_trivial`: χ=1 gives Q_v=X−1, H={0}, weight 0.
- `character_cyclotomic`: The algebraic idele norm ||·||_F gives the cyclotomic family in the geometric Artin convention: H={−1}, Q_p=X−p⁻¹, pure weight −2.
- `character_finite_order`: A finite-order Hecke character has H={0}, all good roots roots of unity, and weight 0.
- `character_non_algebraic`: An arbitrary continuous character with nonintegral infinity exponent has no type-A₀ algebraic realization theorem and is not accepted by this constructor.

**Lean name:** `TauCeti.CompatibleSystems.characterSystem`.

**Sources:** [BLGGT v4][blggt-2014-v4], Appendix A.2, p.87, before Lemma A.2.1; [ACC+][acc-2023], §7.1, pp.1085,1092.

**Prerequisites:** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`; [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

<a id="target-rank-one-purity"></a>
### Rank-one purity

Every rank-one weak system is pure of some integer weight w, and the same holds for rank-one extremely weak data with their determinant Hodge condition. Character classification gives a single w with a_(cτ)+a_τ=w and |ιr(Frob_v)|²=q_v^w at every good v and complex embedding. Algebraic Hecke-character theory also supplies pure local WD parameters. The algebraicity/Hodge hypothesis is necessary; arbitrary continuous character data do not carry this purity assertion.

**Lean name:** `TauCeti.CompatibleSystems.rank_one_purity`.

**Sources:** [BLGGT v4][blggt-2014-v4], Appendix A.2, p.87, items (1),(2),(8); [ACC+][acc-2023], §7.1, p.1092, purity paragraph.

**Prerequisites:** [R24.5:operations, Algebraic character families](#target-character-system); [R24.5:operations, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [R24.5:operations, Very weak and extremely weak families](#target-weakened-compatible-data); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

<a id="target-induced-character-purity"></a>
### Purity of induced character families

For finite F′/F, induction of a pure rank-one character system of weight w is pure of weight w, using the canonical Hodge data H_τ=⊔_(σ|τ)H_σ and adjoining extension ramification to S. In a residue-degree-f block an induced Frobenius eigenvalue β satisfies β^f=α_w. Since q_w=q_v^f, the absolute-value condition descends to |ιβ|²=q_v^w. The same conclusion holds for extremely weak rank-one character input with these transported Hodge multisets. It gives neither regularity nor irreducibility, and does not permit freely chosen higher-rank Hodge metadata with only the right total sum.

**Lean name:** `TauCeti.CompatibleSystems.induced_character_purity`.

**Sources:** [ACC+][acc-2023], §7.1, p.1092, purity paragraph; [BLGGT v4][blggt-2014-v4], §5.1, pp.62–63.

**Prerequisites:** [R24.5:operations, Rank-one purity](#target-rank-one-purity); [R24.5:operations, Twisting, restriction and induction](#target-system-operations); [R24.5:operations, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-artin-system"></a>
### Artin families

Given a finite quotient Γ of G_F and a characteristic-zero representation a of Γ over a number field M, extend coefficients at every finite place of M to construct its Artin family. Put in S all primes ramified in the quotient. Each member has finite image and is de Rham and potentially unramified, with n zero Hodge–Tate weights; it is crystalline at coefficient places outside S. Good Frobenius eigenvalues are roots of unity and the common polynomials are those of a(Frob_v). The family has weight zero, with no automatic irreducibility or regularity conclusion.

**API.**

- `artinSystem`: Extend the given finite-quotient number-field representation to every coefficient place.
- `artinSystem_hodge`: H_τ is n copies of zero.
- `artinSystem_charpoly`: Q_v is the characteristic polynomial of the finite quotient Frobenius element.
- `artinSystem_pure`: The Artin family is pure of weight 0 with finite-monodromy local WD data.

**Tests.**

- `artin_trivial`: The trivial rank-one quotient gives Q_v=X−1 and H={0}.
- `artin_quadratic`: For a quadratic character, good Q_v is X−1 at split primes, X+1 at inert primes.
- `artin_rank_two_irregular`: Any rank-two Artin family has H={0,0}, so it is not regular, even when its finite-group representation is irreducible.
- `artin_roots_unity`: Finite-order matrices have eigenvalues roots of unity under every complex embedding; their absolute value is 1.

**Lean name:** `TauCeti.CompatibleSystems.artinSystem`.

**Sources:** [ACC+][acc-2023], §7.1, pp.1086,1092.

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `PadicHodgeTheory:R06.2`; `mathlib:Representation`; `mathlib:LinearMap.charpoly`.

<a id="target-artin-twist-purity"></a>
### Purity of Artin families up to twist

If ℛ is the tensor of a rank-n Artin system and a rank-one algebraic character system of weight w, it is pure of weight w with the canonical Hodge multisets consisting of n copies of the character's Hodge number. Good eigenvalues are roots of unity times the character value. Apply the same argument to an ACC+ rank-two extremely weak system Artin up to twist only when the actual character twist and canonical Hodge data, or a very weak realization, identify that family. A determinant sum alone does not force higher-rank Hodge purity.

**Lean name:** `TauCeti.CompatibleSystems.artin_twist_purity`.

**Sources:** [ACC+][acc-2023], §7.1, pp.1086,1092.

**Prerequisites:** [R24.5:operations, Artin families](#target-artin-system); [R24.5:operations, Rank-one purity](#target-rank-one-purity); [R24.5:operations, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); [R24.5:operations, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-rank-two-reducibility-independent-of-lambda"></a>
### Independence of characteristic-zero reducibility

For a rank-two weak system over ℚ in Taylor's sense, absolute reducibility of a characteristic-zero member implies absolute reducibility of every member. Classify its two one-dimensional Hodge–Tate constituents as finite-order characters times cyclotomic powers, extend them to algebraic Hecke-character systems, and compare their direct sum with the original family by good Frobenius polynomials. This is a theorem about characteristic-zero members, not the exceptional primes of residual reducibility.

**Lean name:** `TauCeti.CompatibleSystems.rank_two_reducibility_independent_of_lambda`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, before Lemma 6.5, p. 773 (PDF page 45), §6, after Lemma 6.5, p. 774 (PDF page 46).

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [R24.5:operations, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); `ArithmeticGaloisRepresentations:R01.5`; [R24.5:operations, Algebraic character families](#target-character-system); [R24.5:operations, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-system-l-functions"></a>
### L-functions and archimedean factors

For an embedding ι:M↪ℂ, define L^S(ιℛ,s)=∏_(v∉S) q_v^(ns)/ιQ_v(q_v^s). Purity of weight w gives convergence and analyticity on Re(s)>1+w/2. When S contains every place above l, the partial function is determined by r_λ. For an away-coefficient strictly compatible system define the full finite Euler product using WD_v; it differs from L^S at only finitely many factors.

For a regular pure system use the following archimedean factors, with Γ_R(s)=π^(−s/2)Γ(s/2) and Γ_C(s)=2(2π)^(−s)Γ(s)=Γ_R(s)Γ_R(s+1). At a complex place with embeddings τ,τ′, put

L_v(s)=Γ_C(s−w/2)^n ∏_(h∈H_τ,h<w/2) Γ_C(s−h)/Γ_C(s−w/2) ∏_(h∈H_τ′,h<w/2) Γ_C(s−h)/Γ_C(s−w/2),

and ε_v=i^(Σ_(h∈H_τ)|h−w/2|+Σ_(h∈H_τ′)|h−w/2|).

At a real place let d_+=d_−=n/2 for even n; for odd n and even w let d_±=(n±(−1)^(w/2)det ℛ(c_v))/2. Put

L_v(s)=Γ_R(s−w/2)^(d_+) Γ_R(s+1−w/2)^(d_−) ∏_(h∈H_τ,h<w/2) Γ_C(s−h)/Γ_C(s−w/2),

and ε_v=i^(d_−+Σ_(h∈H_τ)|h−w/2|). Complete the function by Λ=L∏_(v|∞)L_v and define the global ε-factor as the product of local WD ε-factors and these infinite factors, using the standard additive character of A_F/F. These formulas use BLGGT v4; its v1 separate Hodge-factor expression is not used for odd w. Do not infer a functional equation for every system merely from defining its completed function.

**API.**

- `partialLFunction`: L^S(ıℛ, s) as an Euler product.
- `lFunction`: L(ıℛ, s) for strictly compatible ℛ.
- `archimedeanGammaFactor`: L_v(ıℛ, s) at complex and real v in BLGGT v4's form, through Complex.Gammaℝ and Complex.Gammaℂ.
- `archimedeanEpsilon`: ε_v(ıℛ, ψ_v, s) = i^{Σ|h − w/2|} (complex v) or i^{d− + Σ|h − w/2|} (real v).
- `archimedeanD`: d± at a real place: n/2, or (n ± (−1)^{w/2}det ℛ(c_v))/2 for n odd.
- `completedLFunction`: Λ(ıℛ, s) and ε(ıℛ, s).
- `partialLFunction_converges`: Convergence on Re s > 1 + w/2 for pure ℛ.
- `partialLFunction_eq_of_lambda`: L^S(ıℛ, s) = L^S(ı̃r_λ, s) when S contains the places above l.

**Tests.**

- `trivial_character`: F = ℚ, n = 1, r_λ trivial: w = 0, d+ = 1, d− = 0, H = {0} has no h < 0, so L_∞ = Γ_ℝ(s) and ε_∞ = 1; Λ(ı1, s) = Γ_ℝ(s)ζ(s) is completedRiemannZeta, and Λ(1 − s) = Λ(s) is the functional equation with ε = 1.
- `gamma_duplication`: Γ_ℂ(s) = Γ_ℝ(s)Γ_ℝ(s + 1) is Mathlib's Complex.Gammaℝ_mul_Gammaℝ_add_one.
- `cyclotomic_character`: F = ℚ, r_λ = ε_l in BLGGT's conventions (Frob_v geometric, HT_τ(ε_l) = {−1}): Q_p(X) = X − p^{−1}, weight −2, L^S(ıε_l, s) = ζ^S(s + 1); d+ = (1 + (−1)(−1))/2 = 1, d− = 0, so L_∞ = Γ_ℝ(s + 1) and ε_∞ = i^{0 + |−1 + 1|} = 1.
- `elliptic_curve_gamma_factor`: F = ℚ, ℛ = H¹ of an elliptic curve: n = 2, w = 1, H = {0, 1}, d± = 1, so L_∞ = Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)·Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s) and ε_∞ = i^{1 + 1/2 + 1/2} = −1. v1's Hodge factor is undefined here (w odd).

**Lean name:** `TauCeti.CompatibleSystems.partialLFunction`.

**Sources:** [BLGGT v1][blggt-2014], §5.1, pp. 52–53 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.1, pp. 63–64 (arXiv v4).

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [R24.5:operations, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `EndoscopicTransferAndUnitaryTraceComparison:ET.6`; `mathlib:Complex.Gammaℝ`; `mathlib:Complex.Gammaℂ`; `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one`.

<a id="target-galois-grothendieck-ring"></a>
### The arithmetic representation ring

For a number field F and prime l, form the additive Grothendieck group Rep_(F,l) of finite-dimensional semisimple continuous Q̄_l-representations of G_F, unramified almost everywhere. Semisimplified tensor product gives its commutative ring structure. Cancellation follows from trace recognition. Trace at σ is a ring homomorphism; dim=tr(1) takes integral values. The symmetric Hom pairing satisfies ([U],[V])=dim Hom_(G_F)(U,V), and for a virtual class A=Σn_i[V_i] in the irreducible basis, (A,A)=Σn_i². Hence (A,A)=1 and dim A>0 force A to be a genuine irreducible class.

Supply the product formula along a Zariski-dense map into G₁×G₂, conjugation, restriction as a ring map, and induction with its trace and dimension formulas. Include the projection formula, Frobenius reciprocity, Mackey decomposition, Brauer induction and the resulting pairing identity. For an unramified-outside-S virtual class, with S containing places above l, define L^S multiplicatively on the irreducible multiplicities; induction gives L^S(Ind A)=L^(S′)(A). The additive multiplicity lattice can use `Finsupp`; its pointwise multiplication is not the tensor-product ring law.

**API.**

- `RepRing`: Rep_{F,l} with ⊗ as multiplication.
- `RepRing.trace`: tr σ : Rep_{F,l} → ℚ̄_l, a ring homomorphism.
- `RepRing.pairing`: (A, B) = dim Hom, extended bilinearly.
- `RepRing.eq_irreducible_of_pairing_eq_one`: Positive dimension and (A,A)=1 imply A is the class of one genuine irreducible; expand A in the irreducible basis and use Σn_i²=1.
- `RepRing.res`: Restriction, a ring homomorphism.
- `RepRing.ind`: Induction with trace formula, projection formula, Frobenius reciprocity and Mackey.
- `RepRing.brauer`: A = Σ n_i ind([ı^{−1}ψ_i] res A).
- `RepRing.partialLFunction`: L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive and inductive.

**Tests.**

- `pairing_norm`: A = 2[V₁] − [V₂] with V₁ ≇ V₂ irreducible: (A, A) = 4 + 1 = 5, and dim A = 2 dim V₁ − dim V₂ may be negative.
- `trivial_class`: [1] is the unit, with (1, 1) = 1 and dim 1 = 1.
- `induced_dimension`: dim ind_{F′/F}[1] = [F′ : F], and (ind[1], [1]) = 1 by Frobenius reciprocity.
- `virtual_not_genuine`: For the virtual C₂ class A=3·1−ε, dim A=2 but (A,A)=10; rank two alone fails genuineness. Norm-one plus positive dimension is the criterion actually used.

**Lean name:** `TauCeti.CompatibleSystems.RepRing`.

**Sources:** [BLGGT v1][blggt-2014], §5.4, items (1)–(9), pp. 61–63 (arXiv v1).

**Prerequisites:** [R24.5:operations, L-functions and archimedean factors](#target-system-l-functions); [R24.5:operations, Twisting, restriction and induction](#target-system-operations); [R24.5:operations, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `mathlib:Rep.indResAdjunction`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

<a id="target-monodromy-component-field"></a>
### The common monodromy component field

For any weak system there is a single finite Galois F¹/F identifying Gal(F¹/F) with G_λ/G_λ⁰ for every λ. If the system is regular, constituents restricted to an open subgroup have multiplicity one. After one finite extension of the coefficient field, every such constituent is defined over the corresponding completed coefficient field and admits a stable integral lattice. The result guarantees existence and coefficient descent; it chooses no canonical lattice. The split-eigenvalue descent criterion is part of its proof.

**Lean name:** `TauCeti.CompatibleSystems.monodromy_component_field`.

**Sources:** [BLGGT v4][blggt-2014-v4], Lemma 5.3.1, pp.70–71, Appendix A.1 Lemma A.1.5, p.85.

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:G7`; `ArithmeticGaloisRepresentations:R01.5`.

<a id="target-larsen-rational-system-groups"></a>
### Rational-system monodromy data

For a rational weak system r_l:G_F→GL_n(ℚ_l), form its algebraic monodromy group G_l, reductive identity component G_l⁰, image Γ_l, and Γ_l⁰=Γ_l∩G_l⁰(ℚ_l). Include the common component field F⁰/F with Gal(F⁰/F)≅Γ_l/Γ_l⁰. Let Z_l, G_l^der, G_l^ad, C_l and G_l^sc be respectively the centre, derived group, adjoint quotient, abelian quotient and simply connected cover, and let H_l=G_l^sc×Z_l→G_l⁰.

Define Γ_l^Z, Γ_l^C, Γ_l⁰⁰ and Γ_l^H by intersection, projection and preimage. Choose maximal tori and constants A(n),B(n): the central-cover kernel order divides A(n); X*(T^ad)⊆X*(T^der)⊆X*(T^sc)⊆A(n)⁻¹X*(T^ad); and B(n) bounds the relevant representation weights. Supply Serre's θ_l:S_(F⁰,l)→C_l, agreeing with (r_l mod G_l^der)∘Art_(F⁰) on an open subgroup of O_(F⁰,l)^×. The group constructions depend on the actual rational members and their Zariski closures.

**API.**

- `LarsenData.G`: G_l, the Zariski closure of the image, with G⁰_l, Z_l, G^der_l, G^ad_l, C_l, G^sc_l, H_l.
- `LarsenData.componentField`: F⁰/F with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for every l.
- `LarsenData.gammaH`: Γ^H_l ⊆ H_l(Q_l), the preimage of Γ⁰⁰_l.
- `LarsenData.A`: A(n): #ker(G^sc_l → G^ad_l) | A(n), uniformly in ℛ and l.
- `LarsenData.theta`: θ_l : S_{F⁰,l} → C_l.

**Tests.**

- `torus_case`: CM-type systems: G⁰_l a torus, H_l = Z_l, and Γ^H_l = Γ^Z_l.
- `gl2_case`: For a non-CM elliptic curve over ℚ: G⁰_ℓ=GL₂, G^sc_ℓ=SL₂, Z_ℓ=𝔾_m, C_ℓ=𝔾_m via det. The kernel of SL₂→PGL₂ has order 2, so 2 divides a uniform A(2); no universal choice A(2)=2 is asserted.
- `finite_image`: An Artin representation: G⁰_l = 1, so F⁰ is the field cut out by r_l and all other groups are trivial.
- `theta_bound_depends_on_system`: A(n) and B(n) depend only on n, but C(ℛ) and D(ℛ) of Lemma 5.2.1 cannot be chosen independently of ℛ: for ℛ = ε^k over ℚ (n = 1), θ_l is x ↦ x^{±k}, so its exponent has absolute value |k|.

**Lean name:** `TauCeti.CompatibleSystems.LarsenData.G`.

**Sources:** [BLGGT v4][blggt-2014-v4], §5.2, pp. 65–66 (arXiv v4).

**Prerequisites:** [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [R24.5:operations, The common monodromy component field](#target-monodromy-component-field); `ArithmeticGaloisRepresentations:G7`.

<a id="target-serre-theta-uniform-bounds"></a>
### Uniform bounds for Serre's torus map

For the rational-system monodromy data, prove four uniform assertions: θ_l is surjective; for l outside S its reciprocity comparison holds on all O_(F⁰,l)^×; there is C(ℛ), independent of l, such that (A(n)μ)∘θ_l=Σ_σm_(μ,σ)σ for every central weight μ, with |m_(μ,σ)|<C(ℛ); and the torsion of X*(S_(F⁰,l))/θ_l*X*(C_l) has cardinality bounded by D(ℛ), also independent of l. Use the actual algebraic tori and character-lattice maps, with the reciprocity and Hodge constraints supplied by their owners.

**Lean name:** `TauCeti.CompatibleSystems.serre_theta_uniform_bounds`.

**Sources:** [BLGGT v4][blggt-2014-v4], §5.2, Lemma 5.2.1 and proof, pp. 66–67 (arXiv v4).

**Prerequisites:** [R24.5:operations, Rational-system monodromy data](#target-larsen-rational-system-groups).

<a id="target-larsen-good-primes"></a>
### Good integral monodromy primes

For a rational weak system choose a Dirichlet-density-one set L with the following integral monodromy properties. For l∈L, G_l⁰ and its associated groups are unramified; there is a semisimple integral model G̃_l^sc with Γ_l^H=G̃_l^sc(ℤ_l)×Γ_l^Z; the index [Z̃_l(ℤ_l):Γ_l^Z] is uniformly bounded; the conjugation action extends uniquely to H̃_l=G̃_l^sc×Z̃_l; and V_l has an H̃_l⋊Γ_l-invariant lattice.

After an unramified extension M_λ/ℚ_l of uniformly bounded degree, all G_l^sc-irreducible subquotients are defined. In the decomposition V_l⊗M_λ=⊕V_(λ,i), every H̃_l-invariant integral lattice splits into the intersections with these isotypic parts. Their irreducible G̃_l^sc(ℤ_l)-subquotients are absolutely irreducible of the expected constituent dimension and have one common isomorphism class for each i; distinct isotypic parts give distinct classes. These six conclusions are the input to the residual irreducibility theorem.

**Lean name:** `TauCeti.CompatibleSystems.larsen_good_primes`.

**Sources:** [BLGGT v4][blggt-2014-v4], §5.2, Proposition 5.2.2 and proof, pp. 68–70 (arXiv v4).

**Prerequisites:** [R24.5:operations, Rational-system monodromy data](#target-larsen-rational-system-groups); [R24.5:operations, Uniform bounds for Serre's torus map](#target-serre-theta-uniform-bounds).

<a id="target-residual-irreducibility-density-one"></a>
### Density-one residual irreducibility

For a regular weakly compatible system over any number field, there is a Dirichlet-density-one set L of rational primes such that, for every λ over l∈L and every irreducible subrepresentation s of r_λ, the semisimplified reduction s̄ remains irreducible on G_(F(ζ_l)). Apply the monodromy and integral-lattice results below after the coefficient-field reduction needed for the general system. The assertion concerns every irreducible constituent, and density one rather than a cofinite set of primes.

**Lean name:** `TauCeti.CompatibleSystems.residual_irreducibility_density_one`.

**Sources:** [BLGGT v1][blggt-2014], §5.2, Lemma 5.2.1 and Proposition 5.2.2, pp. 54–58 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.3, Proposition 5.3.2, p. 71 (arXiv v4).

**Prerequisites:** [R24.5:operations, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [R24.5:operations, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [R24.5:operations, The common monodromy component field](#target-monodromy-component-field); [R24.5:operations, Good integral monodromy primes](#target-larsen-good-primes).

<a id="target-constituents-essentially-self-dual"></a>
### Polarized constituents and CM descent

Let F be imaginary CM and (ℛ,ℳ) a pure, extremely regular polarized weak system. For finite F′/F and an irreducible constituent s of r_λ|G_F′, find a CM intermediate field F⊆F″⊆F′ over which s is invariant and polarized with multiplier μ_λ|G_(F″⁺). Total oddness is inherited when the original pair is totally odd. Purity and extreme regularity make the constituent's Hodge subset stable under polarized duality. Use the CM-base statement of BLGGT v4 Lemma 5.4.5 and its irreducibility assumption.

Both the actual polarization witness and irreducibility of the selected constituent are required; essential self-duality alone does not replace the signed pairing.

**Lean name:** `TauCeti.CompatibleSystems.constituents_essentially_self_dual`.

**Sources:** [BLGGT v1][blggt-2014], §5.2, Lemma 5.2.3, pp. 58–59 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.4, Lemma 5.4.5 and proof, p. 76 (arXiv v4).

**Prerequisites:** [R24.5:operations, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [R24.5:operations, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); [R24.5:operations, Polarized weakly compatible families](#target-polarized-system).

<a id="layer-r23-1"></a>
## R23.1 — Integral points and controlled fields


Build from local point topology and scheme foundations to integral approximation. The curve proof needs its relative Picard and cohomology interfaces; the number-field and function-field field-selection refinements then retain their different completion and constant-field conclusions.

<a id="target-skolem-datum-and-integral-point"></a>
### Skolem data and integral points

Let B = Spec R, where R is either a ring of S-integers in a number field or the coordinate ring of a smooth connected affine curve over a finite field, and put K = Frac R. A Skolem datum consists of a separated, finite-type, surjective map X → B, with X irreducible and X_K geometrically irreducible; a finite set Σ of places outside Max R; finite Galois extensions L_v/K_v for v ∈ Σ; and nonempty, open, Gal(L_v/K_v)-invariant sets Ω_v of smooth points in X(L_v), using the local analytic topology.

Call the datum complete when Σ ∪ Max R contains every place of K. An integral point is an irreducible closed subscheme Y ⊆ X finite and surjective over B, with each Y ×_R L_v split into L_v-rational points in Ω_v. The equivalent field form uses a finite K′/K, the normalization R′ of R in K′, and x ∈ X(R′): require K′ ⊗_K L_v ≅ L_v^[K′:K] **as L_v-algebras**, and require the local image of x to lie in Ω_v for every K-embedding K′ ↪ L_v. This imposes splitting after extension to L_v; it does not require every completion of K′ to equal L_v.

**API.**

- `SkolemDatum`: (f : X → B, Σ, (L_v), (Ω_v)) with the conditions of 1.1
- `SkolemDatum.IsComplete`: every place of K lies in Σ or Max(R)
- `SkolemDatum.IntegralPoint`: an irreducible closed Y ⊆ X, finite surjective over B, L_v-split and inside Ω_v for v ∈ Σ
- `SkolemDatum.integralPoint_iff`: Integral points correspond to finite extensions K′/K with K′ ⊗_K L_v a product of copies of L_v, and an integral point all of whose K-embeddings into L_v land in Ω_v. Completions can be proper subfields of L_v.
- `SkolemDatum.enlargeSigma`: After removing a finite set of closed places from B, prescribe nonempty integral local opens over finite Galois L_v; closure of an integral point for the enlarged datum is an integral point for the original datum (II 1.10).
- `SkolemDatum.split_iff_algEquiv`: The generic splitting condition means that the multiplication/base-change algebra K′⊗_K L_v is isomorphic as an L_v-algebra to a finite product of L_v, not that K′⊗_K K_v has prescribed factors L_v.
- `SkolemDatum.fieldPoint_split`: An integral field point is split after scalar extension to every L_v in Σ; expose this without unfolding FieldPoint.
- `SkolemDatum.fieldPoint_local`: For each v∈Σ and each K-embedding K′→L_v, the induced local point belongs to Ω_v.
- `SkolemDatum.isComplete_congr`: Completeness depends only on Σ and Max(R): two data with equal sets have equivalent completeness predicates.
- `SkolemDatum.mapPoint`: For an R-morphism X→Y sending each Ω_v into the target Ω_v and preserving the place data, map normalized field integral points to target field points. This concerns the field-point presentation; geometric image/normalization comparison is separately required. Identity and composition of R-morphisms give the identity and composite maps on the normalized field-point presentation.

**Tests.**

- `skolem_complete_Z`: R = Z, Σ = {∞} is complete; X = G_m, L_∞ = C and Ω_∞ = {0 < |z| < 1} has no integral point, since the norm of an algebraic unit has absolute value 1.
- `skolem_incomplete_Z_half`: R = ℤ[1/2], Σ = {∞}: the place 2 lies neither in Σ nor in Max(R), so the datum is incomplete
- `skolem_trivial_X`: X = B and Ω_v the unique local point: K′ = K gives an integral point for every finite Galois L_v/K_v, including a nontrivial L_v. This distinguishes splitting over L_v from requiring completions equal L_v.
- `skolem_open_required`: a single point {x} ⊂ X(ℚ_p) of a curve is not v-adically open, so it cannot serve as Ω_v
- `skolem_fieldPoint_local`: For an integral field point, every K-embedding of its generic field into every L_v with v∈Σ gives a local point in Ω_v; a definition checking only one embedding fails this test.

**Lean name:** `TauCeti.PotentialModularity.SkolemDatum`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], 1.1 and Définition 1.2, p. 181, Définition 1.2, p. 181, Remarque 1.8, p. 184.

**Prerequisites:** `mathlib:AlgebraicGeometry.Spec`.

<a id="target-density-of-algebraic-and-separable-local-points"></a>
### Local density and integral points

Three density statements support the local conditions. For a finite-type, generically smooth scheme over a local field F, its points over the separable closure F^s are dense in its points over an algebraic closure, in the valuation topology. For a flat, surjective finite-type model over the integers A of a nonarchimedean local field F, with generically smooth generic fibre, an integral point exists over the integers A′ of some finite separable F′/F. Finally, if a discretely valued field F has separable completion F̂ and F_a is its relative algebraic closure in F̂, then Z(F_a) is dense in Z(F̂) for every finite-type F-scheme Z. Retain the separability/excellence assumption in the last statement. In characteristic zero the first density assertion identifies the two point sets.

**Lean name:** `TauCeti.PotentialModularity.densityOfAlgebraicLocalPoints`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], Lemme 1.6.1 and proof, p. 183, Lemme 2.1, p. 185.

**Prerequisites:** .

<a id="target-elementary-reductions-of-skolem-data"></a>
### Shrinking and enlarging Skolem data

Establish the reductions needed to apply approximation on a curve. Chow's lemma permits a quasi-projective replacement. Removing the closure of a proper closed subset of X_K preserves surjectivity and leaves a nonempty open part of each Ω_v, so one can arrange that the generic fibre is smooth. For a finite set T ⊆ Max R, replace B by B \ T and Σ by Σ ∪ T. The finite class group makes B \ T affine; local integral points over finite extensions supply the new Galois-stable opens at T. The closure in X of an integral point over the smaller base recovers an integral point for the original datum. The new arithmetic ring is a localization of R. These steps also allow a nonempty smooth open subscheme of X to replace X.

**Lean name:** `TauCeti.PotentialModularity.elementaryReductions`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], Remarque 1.4, p. 182, Remarque 1.10, p. 184, Exemple 1.10.1, p. 184.

**Prerequisites:** [R23.1, Local density and integral points](#target-density-of-algebraic-and-separable-local-points); `SchemeAndStackFoundations:SF.4`.

<a id="target-reduction-to-relative-dimension-one"></a>
### Reduction to curves

For quasi-projective X → B with smooth generic fibre, construct a one-dimensional closed subset T ⊆ X that is quasi-finite and surjective over B and meets every Ω_v. When dim X_K ≥ 2, a geometrically irreducible hypersurface through T_K, regular at its points, gives a closed model X′ with generic dimension one less. Intersecting Ω_v with the smooth locus of X′_K gives another Skolem datum. Its integral points map to integral points of X; its completeness condition is unchanged. Iterate to relative dimension one. The reductions themselves do not assume incompleteness. Import the geometrically irreducible Bertini statement from the scheme foundations.

**Lean name:** `TauCeti.PotentialModularity.reductionToCurves`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], Lemme 2.2, p. 185, Proof of Lemme 2.3, p. 185, 2.4, p. 186.

**Prerequisites:** [R23.1, Local density and integral points](#target-density-of-algebraic-and-separable-local-points); [R23.1, Shrinking and enlarging Skolem data](#target-elementary-reductions-of-skolem-data); `SchemeAndStackFoundations:SF.4`.

<a id="target-generalized-picard-functor-and-effective-divisor-fibration"></a>
### Rigidified Picard functors and divisor fibrations

In the smooth quasi-projective curve case, compactify X in a normal projective curve X̄ over B and let Z be the reduced boundary. After shrinking B and adding the removed places to Σ, require X̄ regular, all fibres geometrically integral, and Z regular, finite flat and surjective over B. Thus Z is a Cartier divisor. Write g = h¹(X̄_K, O) and z = deg Z_K > 0.

Define PG(X̄,Z) from invertible sheaves on X̄_T equipped with a trivialization along Z_T, modulo isomorphisms respecting that trivialization. Its degree-d part is PG_d. Tensor product and duality supply the group law. As relative sheaves the sequence is 1 → G_m,B → (π_Z)_*G_m,Z → PG(X̄,Z) → Pic_(X̄/B) → 1. PG is represented by a smooth separated group scheme locally of finite presentation; generic-fibre representability is sufficient for the approximation argument.

The symmetric power X^(d) parametrizes effective Cartier divisors finite flat of degree d and disjoint from Z. Its étale-divisor open U_d contains the local set Ω_v^[d] of L_v-split divisors supported in Ω_v. This set is open and is nonempty when [L_v:K_v] divides d. Sending D to (O(D),s_D|_Z) defines φ_d : X^(d) → PG_d. For **d ≥ 2g + z − 1**, it is locally an affine-space bundle of dimension d + 1 − g − z. Keep the relative divisor, sheaf and degree constructions separate from the underlying set of line-bundle isomorphism classes.

**API.**

- `generalizedPicard`: PG(X̄, Z): line bundles on X̄_S with a trivialisation on Z_S, up to isomorphism
- `generalizedPicard_exact`: 1 → G_m → (π_Z)_*G_{m,Z} → PG(X̄, Z) → Pic_{X̄/B} → 1
- `divisorClassMap`: φ_d : X^{(d)} → PG_d, D ↦ (𝒪(D), s_D|_Z)
- `divisorClassMap_affineFibration`: Lemme 3.6: for d ≥ 2g + z − 1, φ_d is a locally trivial fibration in affine spaces of dimension d + 1 − g − z
- `omegaDivisors_open`: Lemme 3.3: Ω_v^{[d]} is open in U_d(K_v), and nonempty when [L_v : K_v] divides d
- `generalizedPicard_forget`: Forget the rigidification to the Tau Ceti line-bundle class. This is bijective when Z is empty; for nonempty Z equality additionally requires compatibility with the boundary trivialization.
- `generalizedPicard_mk_eq_iff`: Two rigidified line bundles represent the same class exactly when a line-bundle isomorphism intertwines the boundary trivializations.
- `generalizedPicard_lift`: A function on rigidified line bundles invariant under compatible isomorphism descends uniquely to their quotient, with evaluation on a representative.
- `generalizedPicard_lift_mk`: Evaluation of the descended function on a rigidified representative equals the original function on that representative.
- `generalizedPicard_group`: In the relative curve setting the rigidified Picard functor is a commutative group sheaf, with tensor multiplication, the trivial rigidified unit and dual inverse.
- `generalizedPicard_pullback`: For a Cartesian base change of (X̄,Z)/B, pull back the line bundle and its boundary trivialization; preserve unit, product and inverse, satisfy identity/composition, and commute with forgetting to the relative Picard functor and with the divisor class map.

**Tests.**

- `pg_affine_line`: X = 𝔸¹ ⊂ ℙ¹, Z = {∞}: g = 0, z = 1, and the fibre dimension d + 1 − g − z = d is that of monic polynomials of degree d
- `pg_multiplicative`: X = G_m ⊂ ℙ¹, Z = {0, ∞}: g = 0, z = 2, the degree-0 part is G_m (the generalized Jacobian of modulus 0 + ∞), fibres of dimension d − 1
- `pg_small_degree`: g = 1, z = 1, d = 1 < 2g + z − 1 = 2: Lemme 3.6 does not apply
- `pg_trivial_Z`: The empty boundary recovers the Picard functor; the curve approximation construction instead arranges z>0.
- `pg_rigidified_iso`: A boundary-compatible line-bundle isomorphism gives equal rigidified classes; literal equality of representatives is unnecessary.
- `pg_boundary_matters`: Two rigidified representatives without any boundary-compatible line-bundle isomorphism have different classes even when their unrigidified classes agree.
- `pg_forget_representative`: For (L,α), the forgotten class is LineBundleClass.mk L.

**Lean name:** `TauCeti.PotentialModularity.generalizedPicard`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], 3.1, p. 187, 3.2.4 and Lemme 3.3, p. 187, 3.4, p. 188, Lemme 3.6, p. 189.

**Prerequisites:** [R23.1, Shrinking and enlarging Skolem data](#target-elementary-reductions-of-skolem-data); `SchemeAndStackFoundations:SF.3`; `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`; `AlgebraicModuliForArithmeticGeometry:R09.3`.

<a id="target-local-picard-open-sets-and-strong-approximation"></a>
### Local Picard opens and approximation

Set W_v^[d] = φ_d(Ω_v^[d]) in PG_d(K_v). For d ≥ 2g + z − 1 this is open, and it is nonempty if [L_v:K_v] divides d. If d ≥ 2g + z and d′ ≥ 0, multiplication of rigidified classes sends W_v^[d] × W_v^[d′] into W_v^[d+d′]. The multiplication bound is one larger than the affine-bundle bound.

Let an invertible sheaf M of degree d ≥ 2g + z − 1 and a boundary trivialization α have class in every W_v^[d]. If the Skolem datum is incomplete, strong approximation in the torsor of global sections s with s|_Z = α gives a section whose local divisor belongs to each Ω_v^[d]. Every irreducible component of div(s) is an integral point. Use strong approximation for torsors under finite projective R-modules, together with the section/base-change and vanishing results for this relative curve.

**Lean name:** `TauCeti.PotentialModularity.localPicardOpensAndApproximation`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], Lemme 3.7.2(ii), p. 190, Proof of Lemme 3.8, p. 191.

**Prerequisites:** [R23.1, Rigidified Picard functors and divisor fibrations](#target-generalized-picard-functor-and-effective-divisor-fibration).

<a id="target-quasi-compactness-of-the-generalized-jacobian-quotient"></a>
### The compact generalized-Jacobian quotient

For an incomplete datum and any ample line bundle M₀ on X̄, find a positive tensor power M₀^⊗n and a trivialization along Z satisfying the preceding local Picard conditions. Normalize a starting power so its degree d is at least 2g + z, divisible by all [L_v:K_v], and its restriction to Z is trivial.

The controlling quotient PG₀(K_Σ)/im Γ(Z,O_Z^×), with K_Σ = ∏_(v∈Σ) K_v and the product topology, is quasi-compact. Consequently the powers of each element have the identity as an accumulation point. Prove the constituent compactness statements: J(F) is compact for a proper regular geometrically integral curve over a locally compact F; (R_Z ⊗_R K_Σ)^×/(R_Z^× K_Σ^×) is quasi-compact; and K_Σ^×/R^× is quasi-compact under incompleteness. The first uses the compactified Picard scheme; the last uses the S-unit logarithm lattice. Moret–Bailly prints the Jacobian lemma as 3.30.2, although its position and references identify it as 3.10.2.

**Lean name:** `TauCeti.PotentialModularity.compactGeneralizedJacobianQuotient`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], Lemme 3.9, proof, p. 191, Lemme 3.9.2, p. 192, Lemme 3.10.2 (printed 3.30.2), p. 192, Proof of Lemme 3.10.4, p. 193.

**Prerequisites:** [R23.1, Local Picard opens and approximation](#target-local-picard-open-sets-and-strong-approximation); `SchemeAndStackFoundations:SF.3`.

<a id="target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points"></a>
### The integral-point theorem

Prove the integral-point theorem for every incomplete Skolem datum with the hypotheses above. The result supplies irreducible Y ⊆ X finite and surjective over B, split over each L_v and satisfying all local opens; equivalently it supplies K′, its normalization R′ and x ∈ X(R′) with the splitting and every-embedding conditions. Incompleteness is essential. Treat Σ = ∅ by the integral-point argument of Rumely's local–global principle; the nonempty-Σ proof uses the local density, curve reduction, rigidified Picard construction, compact quotient and strong approximation developed here. Spreading out also extends the theorem to the localizations of the arithmetic and geometric rings described in Moret–Bailly II Remark 1.7.

**Lean name:** `TauCeti.PotentialModularity.moretBailly`.

**Sources:** [Moret–Bailly II][moret-bailly-1989-II], Théorème 1.3, p. 182, p. 182, after Théorème 1.3; [Moret–Bailly I][moret-bailly-1989-I], Théorème 1.7 (Rumely) and 1.11, pp. 162-163.

**Prerequisites:** [R23.1, Skolem data and integral points](#target-skolem-datum-and-integral-point); [R23.1, Reduction to curves](#target-reduction-to-relative-dimension-one); [R23.1, Local Picard opens and approximation](#target-local-picard-open-sets-and-strong-approximation); [R23.1, The compact generalized-Jacobian quotient](#target-quasi-compactness-of-the-generalized-jacobian-quotient).

<a id="target-theorem-g-from-moret-bailly"></a>
### From integral points to split-field density

Derive the split-field density statement from the integral-point theorem: for a chosen nonempty open U ⊆ X, spread U to a smooth surjective model over an appropriate ring of integers with finitely many primes inverted. Enlarge the inverted set until the prescribed places and opens form a Skolem datum, while leaving a place outside both Σ and the closed places. An integral point gives a finite K′ split at S and a point of U(K′) in every prescribed open. Taking all U gives Zariski density. This construction explains why the integral theorem applies even when the conclusion concerns points on a variety over a field.

**Lean name:** `TauCeti.PotentialModularity.theoremGFromMoretBailly`.

**Sources:** [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Introduction, Theorem G, p. 5.

**Prerequisites:** [R23.1, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [R23.1, Skolem data and integral points](#target-skolem-datum-and-integral-point); `SchemeAndStackFoundations:SF.4`.

<a id="target-taylor-theorem-g-split-completely-points-are-dense"></a>
### Split-field density

Fix a number field K and finite set S of places, and let K_S be the maximal subextension of a chosen algebraic closure in which every place of S splits completely. For a smooth, geometrically irreducible, quasi-projective X/K with X(K_v) nonempty for v ∈ S, prove that X(K_S) is Zariski dense. More precisely, points can be chosen in any prescribed nonempty local opens and outside a proper closed subset. Each point descends to a finite subextension K′/K; one can subsequently pass to its Galois closure without losing splitting. For K = ℚ and S containing infinity, the selected fields are totally real.

**Lean name:** `TauCeti.PotentialModularity.taylorTheoremG`.

**Sources:** [KW II][kw-serre-modularity-II], Proof of Theorem 6.1, ordinary case, p. 56; [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Introduction, Theorem G, pp. 4-5, Introduction, Theorem G, p. 5.

**Prerequisites:** [R23.1, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [R23.1, From integral points to split-field density](#target-theorem-g-from-moret-bailly).

<a id="target-frobenius-primes-generate"></a>
### Generating Frobenius primes

For a finite Galois D/K, choose finitely many unramified primes outside any finite forbidden set with representatives of Frobenius conjugacy classes generating Gal(D/K). Use Chebotarev prime existence and, where the geometric application requires it, local nonemptiness at the selected primes. In the function-field case incorporate the image in the constant-field quotient rather than silently imposing a degree restriction that excludes needed Frobenius classes. Mathlib’s Frobenius-prime-set definition supplies the carrier; prime existence is the Chebotarev theorem imported from its owner.

**Lean name:** `TauCeti.PotentialModularity.frobeniusPrimesGenerate`.

**Sources:** [Snowden v1][snowden], §5.2, proof of Proposition 5.2.2, p. 16.

**Prerequisites:** `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`.

<a id="target-forcing-linear-disjointness-by-extra-split-places"></a>
### Avoidance by extra split primes

Given a finite Galois avoidance field D/K, add finitely many unramified places outside the forbidden set whose Frobenius elements generate Gal(D/K), and at which the variety has local points. Alternatively, select a nonsplit place for each simple Galois subextension. A finite **Galois** K′/K split at these places is linearly disjoint from D. Indeed K′ ∩ D is normal over K, and all chosen Frobenius elements act trivially on it. They generate the quotient, so the intersection is K. For non-Galois avoidance data, first take the normal closure. Prime selection must preserve all originally prescribed local conditions.

**Lean name:** `TauCeti.PotentialModularity.disjointnessByExtraSplitPlaces`.

**Sources:** [KW II][kw-serre-modularity-II], Proof of Theorem 6.1, last paragraph, p. 57; [KW Annals][kw-annals-2009], Proof of Theorem 2.1, p. 234.

**Prerequisites:** [R23.1, Generating Frobenius primes](#target-frobenius-primes-generate); [R23.1, Split-field density](#target-taylor-theorem-g-split-completely-points-are-dense); `mathlib:IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

<a id="target-tower-linear-disjointness"></a>
### Disjointness through towers

Work inside a common overfield with C⊆B⊆A and C⊆D. If A and D are linearly disjoint over C, then A and BD are linearly disjoint over B and A∩BD=B. Use tensor injectivity and the tower algebra structures to prove the transport. A converse from intersection alone requires the finite Galois hypotheses of Mathlib's `IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

**Lean name:** `TauCeti.PotentialModularity.towerLinearDisjoint`.

**Sources:** [Qian][qian], §2 opening facts, preceding Lemma 2.1.

**Prerequisites:** `mathlib:IntermediateField.LinearDisjoint`; `mathlib:IntermediateField.LinearDisjoint.inf_eq_bot`.

<a id="target-cht-character-extension"></a>
### Extending finite local characters

Extend the given finite-order characters at a finite set of completions of a number field, including its infinite places when prescribed, to a continuous finite-order idele class character. Use an open subgroup of finite index in the idele class group and extension into the discrete group of algebraic roots of unity. The resulting character may have larger order than the local characters. The p-primary refinement preserves p-primary values, without fixing an exact exponent.

Give the finite-image character target the discrete topology. Include all infinite places in S, extending the local data trivially at newly added ones.

**Lean name:** `TauCeti.PotentialModularity.chtCharacterExtension`.

**Sources:** [CHT][cht], Lemma 4.1.1 and proof, p. 116; finite-order and p-primary refinements of the proof.

**Prerequisites:** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

<a id="target-cht-soluble-prescribed-completions"></a>
### Soluble prescribed-completion extensions

Given a finite set S of places of a number field F and finite Galois local extensions E_v/F_v with soluble groups, construct a finite soluble Galois E/F, linearly disjoint from a specified finite avoidance field, whose completion at each chosen place is isomorphic to the prescribed E_v. Real completions can be required to remain real, giving a totally real E when F is totally real. The construction is allowed to enlarge the global degree; it does not promise a cyclic extension of a specified degree. Retain the precise local-extension hypotheses of the CHT lemma when invoking the character-extension construction.

**Lean name:** `TauCeti.PotentialModularity.chtSolublePrescribedCompletions`.

**Sources:** [CHT][cht], Lemma 4.1.2, statement p. 116 and proof p. 117.

**Prerequisites:** [R23.1, Extending finite local characters](#target-cht-character-extension); [R23.1, Generating Frobenius primes](#target-frobenius-primes-generate); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

<a id="target-moret-bailly-three-local-conditions"></a>
### Three kinds of local conditions

For a smooth geometrically connected variety over a number field K, handle three finite sets of local opens: K_v-valued opens prescribing complete splitting, K_v^nr-valued opens prescribing unramified extensions, and K̄_v-valued opens allowing finite local extension. Require the relevant local Galois invariance and nonemptiness. Obtain a finite Galois K′/K, disjoint from a specified finite extension, and a point with every local embedding satisfying the corresponding open. The first set splits in K′ and the second is unramified. Keep these three conditions distinct when auxiliary moduli points are available only after a local extension.

**Lean name:** `TauCeti.PotentialModularity.moretBaillyThreeLocalConditions`.

**Sources:** [Qian][qian], Proposition 4.2, statement and application, §4.

**Prerequisites:** [R23.1, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [R23.1, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [R23.1, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); [R23.1, Local density and integral points](#target-density-of-algebraic-and-separable-local-points).

<a id="target-moret-bailly-over-a-preliminary-extension"></a>
### Approximation above a preliminary field

Let M/K be finite Galois, split at S₁ and unramified at S₂, and take a smooth geometrically connected T/M with the three kinds of nonempty invariant local opens at every place above S. Let L/K be finite Galois and disjoint from M/K. Obtain finite Galois K′/K containing M, disjoint from L, and a point in T(K′) satisfying all local conditions. Local invariance is over M_w; no extra equivariance of the opens under Gal(M/K) is required.

**Lean name:** `TauCeti.PotentialModularity.moretBaillyAbovePreliminaryField`.

**Sources:** [BLGHT][blght], Proposition 6.2, pp. 40–41.

**Prerequisites:** [R23.1, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [R23.1, Disjointness through towers](#target-tower-linear-disjointness); `AbelianSchemesAndArithmeticModuli:A6`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`.

<a id="target-snowden-soluble-preliminary-field"></a>
### Soluble preliminary fields and split extensions

For a smooth geometrically connected number-field variety with finite local Galois extensions L_v and compatible nonempty invariant opens, choose a finite soluble Galois F₁/F and a finite Galois F₂/F. Arrange F₁ ⊗_F L_v split, F₂ split at the separately prescribed set S and after extension to each L_v, and F₂ disjoint from F₁ and the avoidance field. A point over F₁F₂ lies in every Ω_v under every F-embedding into L_v. Splitting over L_v is a scalar-extension condition; it does not identify the completions of F₂ with L_v.

**Lean name:** `TauCeti.PotentialModularity.snowdenSolublePreliminaryField`.

**Sources:** [Snowden v1][snowden], Proposition 8.2.2 and proof, p. 26.

**Prerequisites:** [R23.1, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [R23.1, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); `AbelianSchemesAndArithmeticModuli:A6`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`.

<a id="target-surjective-specialisation-finite-quotient"></a>
### Surjective specialization of finite quotients

Let F be imaginary CM and Galois over ℚ, and let T/F be smooth and geometrically irreducible. Fix a finite avoidance extension and a finite set S₀ of rational primes. For every v|l with l∈S₀, give finite Galois L_v/F_v, compatible under the G_(ℚ_l)-action by σ(L_v)=L_(σv), and a nonempty open Gal(L_v/F_v)-invariant Ω_v⊆T(L_v). Choose a CM F′/F, Galois over ℚ and disjoint from the avoidance field, with F′_w≅L_v and P_w∈Ω_v for every w|v. For any surjective finite quotient f:π₁^ét(T)→G, require also f∘P_*:G_F′→G surjective. The finite étale torsor combines this quotient condition with the completion conditions.

**Lean name:** `TauCeti.PotentialModularity.surjectiveSpecialisation`.

**Sources:** [Bianchi potential automorphy][bianchi], Proposition 4.5.1 and proof, pp. 48–49.

**Prerequisites:** [R23.1, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [R23.1, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); `AbelianSchemesAndArithmeticModuli:A6`; `SchemeAndStackFoundations:SF.2`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`.

<a id="target-function-field-isomorphism-torsor"></a>
### The function-field isomorphism torsor

Let X,Y be smooth geometrically connected curves over F_q, K=F_q(X), F=F_q(Y), H finite, and φ:π₁(X)→H and ψ:π₁(Y)→H. On Y_K construct Z=Isom_(Y_K,H)(X_φ,X_ψ), finite étale over Y_K. If ψ is surjective on the geometric fundamental group, Z is geometrically connected. It is a K-curve, not a finite K-scheme. For finite separable K′/K and z∈Z(K′) whose image does not come from Y(F̄_q∩K′), the nonconstant image defines an F_q-embedding β:F→K′, and β*ψ is conjugate to φ|G_K′. Include this nonconstant-image condition in the specialization API.

**Lean name:** `TauCeti.PotentialModularity.functionFieldIsomTorsor`.

**Sources:** [BHKT][bhkt-published], Lemma 9.1 and diagram (9.1), published pp. 76–77; [Beuzart-Plessis–Harris–Thorne][bhkt-correction], p. 28, Isom-scheme paragraph.

**Prerequisites:** `SchemeAndStackFoundations:SF.1`; `SchemeAndStackFoundations:SF.2`.

<a id="target-function-field-point-with-fixed-constants"></a>
### Function-field points with fixed constants

Apply the function-field approximation construction with a proper closed subset excluded, preserving the constant field F_q and disjointness from a finite Galois avoidance extension. Obtain a finite Galois K′/K with the stated local splitting and a nonconstant specialization β such that β*ψ is conjugate to φ. Require geometric connectedness of the relevant torsor and the constant-field conditions separately; the embedding of the function field comes from the nonconstant image. Use the corrected BHKT statement rather than a zero-dimensional interpretation of its Isom torsor.

The output satisfies K′∩F̄_q=F_q and identifies β*ψ with φ|G_K′ up to H-conjugacy.

**Lean name:** `TauCeti.PotentialModularity.fixedConstantField`.

**Sources:** [BHKT][bhkt-published], Proposition 9.2 and proof, published p. 78.

**Prerequisites:** [R23.1, The function-field isomorphism torsor](#target-function-field-isomorphism-torsor); [R23.1, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [R23.1, Generating Frobenius primes](#target-frobenius-primes-generate).

<a id="target-potential-global-galois-local-data"></a>
### Potential realization of local Galois data

Let K be a global field, S a finite set of places, H a finite group, and M_v/K_v finite Galois extensions with embeddings Gal(M_v/K_v) ↪ H. There is a finite K′/K split at S and an H-Galois extension M/K′ realizing these completions and decomposition-group embeddings up to conjugacy. At real places prescribe elements of order dividing two. For totally real number fields, Calegari's refinement permits K′/K to be totally real and Galois and the resulting M to avoid a prescribed finite field over K. The function-field assertion here is BHKT Theorem 9.3; its conclusion does not include these extra Galois, avoidance or fixed-constant-field properties of K′.

**Lean name:** `TauCeti.PotentialModularity.potentialGlobalGaloisLocalData`.

**Sources:** [BHKT][bhkt-published], Theorem 9.3, published pp. 78–79; [Calegari][calegari], Proposition 3.2 and proof, author pp. 5–6.

**Prerequisites:** [R23.1, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); `SchemeAndStackFoundations:SF.1`.

<a id="layer-r23-2"></a>
## R23.2 — Auxiliary characters and moduli


Choose the arithmetic data before applying the geometric theorem. The moduli scheme, torsion pairings and local points come from H6; this layer combines their specified components with local approximation and field avoidance.

<a id="target-taylor-auxiliary-data-p-l-psi-n-m"></a>
### Auxiliary primes, characters and coefficient fields

Let l be odd, k/F_l finite and F totally real. Assume continuous ρ̄:G_F→GL₂(k) has insoluble image, determinant ε̄_l, and shape (ε̄_lχ_v⁻¹,*;0,χ_v) at each v|l. Let F̃_v/F_v be the smallest totally tamely ramified extension making χ_v unramified. For ζ of order #k−1 set N₀=ℚ(ζ,√(1−4l)); choose λ₀|l with residue field k at which a=(1+√(1−4l))/2 is a unit, reducing to 1. Write q_v=l^[k(v):F_l] and choose β_v=ζ^(b_v)a^[k(v):F_l] reducing to χ_v(φ_v) for a Frobenius lift in G_F̃_v. If χ_v²≠1, define χ̃_v with this Frobenius value and Teichmüller inertia; if χ_v²=1 take the Teichmüller character.

Choose odd p≠l such that ρ̄ is unramified at w|p with distinct Frobenius eigenvalues, p splits completely in the Hilbert class field of N₀ and the field cutting out ε̄_l⁻¹det ρ̄, and p avoids every β_v−β_v^c. In the χ_v²=1 branch also exclude p dividing q_v−1. Fix ℘₀|p and, for w|p, choose α′_w in ℤ[a] of norm p using its ℘₀-unit conjugate; multiply by ζ^(a_w) to get α_w reducing to a residual Frobenius eigenvalue at λ₀.

Choose a totally imaginary quadratic L/F, split at every v|l and w|p and not contained in F(ζ_p). Construct ψ with det Ind ψ=ε_p, reduction χ̃_v at the chosen v₁|v, and unramified local character at each w₁|p with Frobenius value lifting α_w. The reductions of ψ and ψ^c differ on the full local decomposition groups above l; inertia alone need not distinguish them. Enlarge N₀ to a Galois CM N in which its l-adic places split and its p-adic places are unramified, large enough for the chosen ψ̄-values at a place ℘|℘₀. Choose λ|λ₀ and let M be the maximal totally real subfield. The norm β_vβ_v^c is q_v, not the auxiliary prime p.

**API.**

- `TaylorAuxiliaryData`: The data (p, ℘₀, α_w, L, ψ, N, ℘, λ, M) with the stated properties, for a ρ̄ satisfying Taylor's standing hypotheses.
- `TaylorAuxiliaryData.exists`: Such data exist (Chebotarev for p, then Lemma 1.1 for ψ, then a CM extension N/N₀).
- `TaylorAuxiliaryData.det_ind`: det Ind_{G_L}^{G_F} ψ = ε_p.
- `TaylorAuxiliaryData.psi_ne_conj`: ψ̄|G_{v₁} ≠ ψ̄^c|G_{v₁} for v | l: β_vβ_v^c=q_v when χ_v²≠1, with p∤β_v−β_v^c; when χ_v²=1 use the additional exclusion p∤q_v−1. The full decomposition group is required; the inertia characters may agree.
- `TaylorAuxiliaryData.split`: Every place of F above l and above p splits in L; L is totally imaginary and not contained in F(ζ_p).
- `TaylorAuxiliaryData.prime_ne_l`: The chosen auxiliary prime p is different from the original residual prime l.
- `TaylorAuxiliaryData.conj_conj`: Conjugating the auxiliary character twice gives the original character; the involution is the nontrivial element of Gal(L/F).
- `TaylorAuxiliaryData.det_ind_apply`: For g∈G_F, det(Ind ψ(g))=ε_p(g); this is a pointwise evaluation of the determinant identity.

**Tests.**

- `taylorAux_N0_l5`: For l = 5 and k = F_5: ζ has order 4 and N₀ = ℚ(ζ₄, √−19); 5 does not divide 1 − 4·5 = −19, so 5 is unramified in N₀.
- `taylorAux_det_needed`: The simultaneous alternating torsion pairing requires det ρ̄=ε̄_l. A different determinant, such as ε̄_lω², cannot supply that pairing; also check the stored identity det Ind ψ=ε_p.
- `taylorAux_alpha_norm`: For α_w of algebraic norm p, diag(α_w,α_w^c) has determinant p. This is an algebraic norm calculation, not a p-adic cyclotomic value of a Frobenius lift at p.
- `taylorAux_not_in_cyclotomic`: L ⊄ F(ζ_p) is part of the data; a quadratic subfield of F(ζ_p) is not allowed.
- `taylorAux_local_decomposition`: The auxiliary object has a full local decomposition-group element on which ψ̄ and ψ̄^c differ; distinction need not hold on inertia.
- `taylorAux_beta_norm`: With l=5, residue degree one and a²−a+5=0, a^c=1−a and aa^c=5, which differs from the auxiliary p≠5.

**Lean name:** `TauCeti.PotentialModularity.TaylorAuxiliaryData`.

**Sources:** [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], section 1, standing hypotheses, printed p. 6, choice of p, printed p. 7, choice of L, psi, N, M, printed p. 9, choice of N, printed p. 9; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Corrections to [Tay4], first bullet, p. 776.

**Prerequisites:** [R23.2, CM characters with simultaneous local reductions](#target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions); [R23.1, Generating Frobenius primes](#target-frobenius-primes-generate).

<a id="target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions"></a>
### CM characters with simultaneous local reductions

Let O be the integers in a finite extension of ℚ_p, with residue field k. Let K be totally real and L/K totally imaginary quadratic, split at all places above p. Take a finite set S of finite places containing those above p and split in L, and choose S_L with exactly one place above each member of S. Let φ:G_K→O^× be continuous and odd, equal to ε_p^n times a finite-order character for n∈ℤ, and choose continuous ψ̄_x:G_L_x→k^× for x∈S_L. Over a finite coefficient extension with integers O′, construct continuous ψ:G_L→O′^×, finitely ramified at the prescribed places, reducing to every ψ̄_x, and satisfying det Ind_(G_L)^(G_K)ψ=φ. The algebraic character and reciprocity construction is supplied by its owner; this theorem imposes the simultaneous local reductions needed by auxiliary torsion.

**Lean name:** `TauCeti.PotentialModularity.taylorLemma11`.

**Sources:** [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Lemma 1.1 and proof, printed pp. 7-9.

**Prerequisites:** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

<a id="target-local-points-at-l-p-infinity-and-the-point-over-e"></a>
### The twisted Hilbert moduli application

Use the Hilbert moduli scheme supplied by H6, with the prescribed endomorphisms, polarization and identifications of A[λ] with ρ̄ and A[℘] with Ind ψ̄. Choose a smooth geometrically connected component and nonempty invariant local opens at l, p and infinity. At places where the construction produces F_v-points require splitting; where it produces points only over an unramified or unrestricted finite extension use the corresponding local condition of R23.1. Moret–Bailly gives the auxiliary abelian variety over a controlled totally real field E. Representability, component descent and the local torsion/pairing constructions are inputs from H6 and A6.

**Lean name:** `TauCeti.PotentialModularity.localPointsTwistedHilbertModuli`.

**Sources:** [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], printed p. 13.

**Prerequisites:** [R23.2, Auxiliary primes, characters and coefficient fields](#target-taylor-auxiliary-data-p-l-psi-n-m); `HilbertModularVarietiesAndShimuraCurves:H6`; [R23.1, Three kinds of local conditions](#target-moret-bailly-three-local-conditions).

<a id="target-restriction-of-scalars-moduli-application"></a>
### The Weil-restricted moduli application

For a finite totally real F₁/F and the smooth geometrically connected auxiliary X/F₁, use Weil restriction to form Res_(F₁/F) X. It has the same smoothness and geometric connectedness, and its F_v-points are ∏_(w|v) X(F₁,w). Apply approximation to these product opens over F, avoiding F₁ together with the prescribed avoidance field. This gives a totally real Galois F′/F disjoint from their compositum and an auxiliary moduli object over F₁F′. Weil restriction, its representability and the torsion/polarization objects are imported from A6 and H6.

**Lean name:** `TauCeti.PotentialModularity.restrictedAuxiliaryModuli`.

**Sources:** [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proof of Proposition 9.1.11, p. 458.

**Prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6`; `AbelianSchemesAndArithmeticModuli:A6`; [R23.1, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`.

<a id="layer-r23-3"></a>
## R23.3 — Residual potential modularity


Prove residual modularity independently of existence of a lift of the original representation. Taylor’s ordinary and niveau-two arguments supply the weight and level refinements; Snowden’s totally real theorem and the two-prime refinement have their own hypotheses and outputs.

<a id="target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f"></a>
### Controlled residual potential modularity

For an S-type residual ρ̄ of G_ℚ, assume 2 ≤ k(ρ̄) ≤ p+1 and absolute irreducibility on G_(ℚ(ζ_p)) when p>2, and nonsoluble image when p=2. Construct a totally real Galois F/ℚ of even degree, unramified at p and split there if ρ̄|D_p is irreducible, preserving the residual image. Over F the representation has a cuspidal Hilbert modular witness of weight k(ρ̄), unramified at every place above p (at p=2 this witness requires k=2), and a second witness of weight two with conductor dividing each v|p, unramified there when the residual representation is finite flat. Include the extension controls of R23.5. This is a theorem about ρ̄; a characteristic-zero lift is not an input.

**Lean name:** `TauCeti.PotentialModularity.kwPotentialResidual`.

**Sources:** [KW II][kw-serre-modularity-II], section 6, Theorem 6.1, pp. 53-54, Theorem 6.1(ii), p. 54, proof of Theorem 6.1, solvable case, p. 54, proof of Theorem 6.1, non-solvable case, p. 54, proof of Theorem 6.1, p = 2 and k(rho-bar) = 4, pp. 55-56, proof of Theorem 6.1, ordinary k(rho-bar) = 2 branch, p. 56, proof of Theorem 6.1, p = 3 branch, p. 56, proof of Theorem 6.1, weight adjustment, p. 57.

**Prerequisites:** [R23.1, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [R23.1, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`; [R23.3, Ordinary residual potential modularity](#target-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l); [R23.3, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [R23.3, The Serre-weight level-one witness](#target-taylor-2006-theorem-5-7-serre-weight-at-level-one); `AutomorphicGaloisRepresentations:R19.2`; `GL2ModularityLifting:R22.6/kw-dyadic-lifting`; `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`; `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `PadicFamilies:L5`; `SerreWeightAndLevelOptimisation:R20.3`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; [R23.2, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity"></a>
### The ordinary Annals variant

Let ρ̄ be S-type in odd characteristic p, irreducible on G_(ℚ(μ_p)), with 2≤k(ρ̄)≤p+1 and k(ρ̄)≠p. Obtain totally real Galois F/ℚ of even degree, unramified at p and split there if the local residual representation is irreducible. Preserve im ρ̄ and absolute irreducibility on G_(F(μ_p)). The first cuspidal Hilbert witness is everywhere unramified and has weight k; the second has weight two, is unramified away from p and has conductor dividing v at each v|p, with unramifiedness in the finite-flat case. Both are ordinary above p when ρ̄ is ordinary. Import the Hida and soluble base-change inputs giving these local properties. The supersingular cases use Taylor's l>3 theorem and the separate prime-three input.

**Lean name:** `TauCeti.PotentialModularity.kwOrdinaryPotentialResidual`.

**Sources:** [KW Annals][kw-annals-2009], Theorem 2.1, p. 234, proof of Theorem 2.1, p. 234, proof of Theorem 2.1, p. 237, proof of Theorem 2.1, printed p. 235.

**Prerequisites:** [R23.3, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [R23.3, The ordinary auxiliary Tate module](#target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l); [R23.3, The Serre-weight level-one witness](#target-taylor-2006-theorem-5-7-serre-weight-at-level-one); `HilbertModularVarietiesAndShimuraCurves:H6`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `PadicFamilies:L5`; [R23.2, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l"></a>
### The ordinary auxiliary Tate module

For the auxiliary M-Hilbert–Blumenthal abelian variety A/E with A[λ]≅ρ̄|G_E and A[℘]≅Ind ψ̄|G_E, take v|l unramified over ℚ_l and x|v in E. Assume χ_v²|I_v=ε̄_l^n with 0≤n<l−1, and exclude n=1 if ρ̄|G_v is semisimple. Then T_λA⊗ℚ_l has shape (ε_l(χ′_v)⁻¹,*;0,χ′_v) on G_x, for a tamely ramified lift χ′_v of χ_v. The differential inertia calculation uses ω⁻¹; this is what forces n=1 in the excluded semisimple branch. The finite-flat group-scheme inertia and CDT inputs belong to their local owners.

**Lean name:** `TauCeti.PotentialModularity.taylorLemma15`.

**Sources:** [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Lemma 1.5 and proof, printed pp. 14-15, proof of Lemma 1.5, printed p. 14, proof of Lemma 1.5, printed p. 15.

**Prerequisites:** [R23.2, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar"></a>
### Modularity transfer through the auxiliary variety

Prove modularity of the auxiliary variety using its ℘-adic realization, whose residual representation is induced from the prescribed CM character. Apply the appropriate ordinary modularity lifting theorem, with its auxiliary-image and exceptional-CM hypotheses checked, and identify the compatible λ-adic realization. Reduction at λ then gives a modular witness for ρ̄ restricted to the selected field. The exceptional CM alternative uses the precise Skinner–Wiles theorem supplied by R21.5; it must not be replaced by a generic ordinary-lifting slogan. The local ordinary Tate-module statement supplies the other required hypothesis.

**Lean name:** `TauCeti.PotentialModularity.auxiliaryModularityTransfer`.

**Sources:** [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], remarks after the Moret-Bailly application, printed p. 13, same paragraph, printed p. 13, paragraph before Theorem 1.6, printed p. 15, same sentence, printed p. 15.

**Prerequisites:** [R23.2, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e); [R23.2, Auxiliary primes, characters and coefficient fields](#target-taylor-auxiliary-data-p-l-psi-n-m); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`.

<a id="target-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l"></a>
### Ordinary residual potential modularity

Let l be odd, k/F_l finite, F totally real, and ρ̄:G_F→GL₂(k) continuous irreducible and totally odd. Suppose at every v|l it has shape (ε̄_lχ_v⁻¹,*;0,χ_v). Obtain finite Galois totally real E/F split at every v|l and a regular algebraic cuspidal π with residual member ρ̄|G_E. At an unramified x|l with nonscalar residual inertia, χ_x²|I_x=ε̄_l^n, 0≤n<l−1 and n≠1 in the semisimple case, require the characteristic-zero ordinary shape with a tamely ramified lift of χ_x. Use Taylor's corrected auxiliary construction and its determinant normalization where that construction is applied.

Corollary 1.7 treats an arbitrary continuous irreducible totally odd residual representation. Choose finite Galois totally real E/F whose l-adic places are unramified of residue degree at most two, with the residual modular witness. For its local ordinary conclusion, at the specified unramified v|l require nonscalar inertia and shape (χ_(v,1),*;0,χ_(v,2)) with **χ_(v,2)χ_(v,1)⁻¹|I_v=ε̄_l^n**. The lifted lower-right character is a tamely ramified lift of χ_(v,2). This ratio condition is on inertia; it does not normalize the determinant on all G_v. The quadratic-field and square-root-character construction must preserve total reality and the stated l-adic conditions.

**Lean name:** `TauCeti.PotentialModularity.taylorOrdinaryPotentialResidual`.

**Sources:** [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Theorem 1.6, printed p. 15, Theorem 1.6, 'Moreover' clause, printed p. 15, paragraph before Theorem 1.6, printed p. 15, Corollary 1.7, printed p. 16; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Corrections to [Tay4], last bullet, p. 777, same bullet, p. 777.

**Prerequisites:** [R23.3, Modularity transfer through the auxiliary variety](#target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar); [R23.3, The ordinary auxiliary Tate module](#target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l); `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

<a id="target-taylor-2006-potential-modularity-when-residually-irreducible-at-l"></a>
### The niveau-two potential-modularity theorem

Let l>2 and ρ̄:G_ℚ→GL₂(F̄_l) be continuous odd with inertia ω₂^(k−1)⊕ω₂^(l(k−1)), 2≤k≤l. Obtain a totally real Galois F/ℚ of even degree split at l and a regular algebraic cuspidal weight-two π with residual representation ρ̄|G_F. At x|l its tame WD inertia is ω₂^(k−(l+1))⊕ω₂^(lk−(l+1)). Corollary 4.6 permits its central character away from l to be unramified. In the exceptional CM case check the supplied Skinner–Wiles alternative, or base change together with Taylor's crystalline §3.3 result and admissible descent.

**Lean name:** `TauCeti.PotentialModularity.taylorNiveauTwoPotentialResidual`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Proposition 4.1 and following remark, pp. 755-756, end of proof of Proposition 4.1, pp. 762-763, Corollary 4.6, p. 763.

**Prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

<a id="target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations"></a>
### Quaternionic forms and Hecke–Galois realizations

Take F totally real of even degree, D ramified exactly at infinity, weights k_σ≥2 with w=k_σ−1+2w_σ independent of σ, and continuous central character ψ agreeing with (Na)^(1−w) on an open subgroup of F_l^×. The quaternionic form space is a semisimple admissible representation of GL₂(A_F^(∞,l)); its U^l-invariants are the specified finite-level form space. After extending coefficients to ℂ, its quotient by reduced-norm functions decomposes into the regular algebraic cuspidal π of these weights and central character. Reduced-norm functions occur only in parallel weight two; at that weight the full decomposition also contains characters χ with χ²=ψ.

The corresponding Hecke algebra has a continuous Galois representation unramified at x∤𝔫l, with trace T_x and determinant ε_l(ψ∘Art⁻¹). At a non-Eisenstein maximal ideal it has an integral Carayol realization over the localized Hecke algebra. This algebra is generated by the U_(ϖ_x) for x|𝔫, x∤l and T_x at almost all other primes. Import Jacquet–Langlands and the Hilbert Galois realization separately.

**Lean name:** `TauCeti.PotentialModularity.quaternionicHeckeGaloisRealisation`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §1, Lemma 1.3, p. 740 (PDF page 12), §1, proof of Lemma 1.3, p. 741 (PDF page 13), §1, the representations ρ and ρ_𝔪, p. 742 (PDF page 14).

**Prerequisites:** `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `AutomorphicGaloisRepresentations:R19.2`; `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`.

<a id="target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l"></a>
### Fontaine–Laffaille shapes of quaternionic forms

Let x∤𝔫 be a split place above l with 2≤k_x≤l−1, and let 𝔪 be non-Eisenstein in the quaternionic Hecke algebra. For an open ideal I of h_𝔪, identify ((ρ_𝔪⊗ε_l^(−w_x)) mod I)|G_x with the Fontaine–Laffaille realization of D in the specified local category, with D≠D⁰ and D⁰≠0. Consequently residual inertia is either ω₂^(k_x−1+(l+1)w_x)⊕ω₂^(l(k_x−1)+(l+1)w_x), or triangular (ω^(k_x+w_x−1),*;0,ω^(w_x)). Preserve the explicit twist and the split-place Fontaine–Laffaille interval; the crystalline and torsion comparison inputs are supplied by the automorphic and p-adic Hodge owners.

**Lean name:** `TauCeti.PotentialModularity.localResidualInertialShape`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §1, proof of Corollary 1.5, p. 743 (PDF page 15).

**Prerequisites:** [R23.3, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`; `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `PadicHodgeTheory:R06.4`; `AutomorphicGaloisRepresentations:R19.5`.

<a id="target-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction"></a>
### Quaternionic weight reduction

Let l>3 split completely in the even-degree totally real F, and 0≤i≤l−2. For character η̄^i of U₀(𝔫,l)/U₁(𝔫,l), use the local induced coefficient filtration 0→Sym^i→I_x^i→Sym^(l−1−i)⊗det^i→0. Its global subspaces S_T satisfy S_∅≅S_(i+2)(U_H(𝔫)). For x∉T construct an injection κ_x:S_(T∪{x})/S_T↪S_(T∪{x}), equivariant for good T_y,S_y and the required U_(ϖ_x), whose composite with the quotient projection is V_(ϖ_x).

Deduce the surjection of Hecke algebras to weight i+2. Localization at 𝔪 is nonzero if every V_(ϖ_x) lies in every maximal ideal of h″ above 𝔪. A sufficient condition is that 𝔪 is non-Eisenstein and each residual local restriction is not of shape (εχ₁,*;0,ω^iχ₂) with χ₁,χ₂ unramified. The U-ordinary comparison gives the triangular local shape with lower-right Frobenius eigenvalue φ(U_(ϖ_x)); the perfect pairing and adjoints give the dual V-shape. Use Sym^i and the quotient S_(T∪{x})/S_T in the construction.

**Lean name:** `TauCeti.PotentialModularity.weightReductionHeckeSurjection`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, the pairing and the operators 𝐔, 𝐕, p. 764 (PDF page 36), §5, Lemma 5.1, p. 765 (PDF page 37), §5, Corollary 5.2, p. 767 (PDF page 39).

**Prerequisites:** [R23.3, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); `AutomorphicGaloisRepresentations:R19.2`.

<a id="target-taylor-2006-lemma-5-3-weight-shift"></a>
### The weight shift by l+1

For k≥2, construct the weight shift from k to k+l+1 with the prescribed cyclotomic twist. Track the Hecke normalization: T_y is multiplied by N(y), while S_y is multiplied by N(y)². Retain the level and central-character conditions needed for Taylor's coefficient injection; the result transports the chosen residual system of eigenvalues, rather than identifying untwisted characteristic-zero representations of different weights.

**Lean name:** `TauCeti.PotentialModularity.weightShift`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, proof of Lemma 5.3, p. 768 (PDF page 40).

**Prerequisites:** [R23.3, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-taylor-2006-lemmas-5-4-5-6-weight-and-level"></a>
### Weight and level removal

For l>3 and continuous odd ρ̄ of G_ℚ with inertia ω₂^(k−1)⊕ω₂^(l(k−1)), 2≤k≤l, obtain a totally real Galois F split at l and a weight-two regular algebraic cuspidal witness whose conductor at x|l divides x. Next make it unramified at finite places away from l. Finally choose F of even degree and a weight-k witness unramified at every finite place. Establish respectively Lemma 5.4, Corollary 5.5 and Lemma 5.6 using the CDT type/Jordan–Hölder interfaces and the specified Skinner–Wiles base change.

**Lean name:** `TauCeti.PotentialModularity.weightAndLevelPotentialResidual`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, Corollary 5.5, p. 769 (PDF page 41), §5, proof of Lemma 5.6, p. 770 (PDF page 42).

**Prerequisites:** [R23.3, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [R23.3, Fontaine–Laffaille shapes of quaternionic forms](#target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l); [R23.3, Quaternionic weight reduction](#target-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction); [R23.3, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-taylor-2006-theorem-5-7-serre-weight-at-level-one"></a>
### The Serre-weight level-one witness

Let l>3 and ρ̄:G_ℚ→GL₂(F̄_l) be continuous irreducible odd with irreducible restriction to G_(ℚ_l). Obtain a totally real Galois F of even degree split at l and a regular algebraic cuspidal π with residual member ρ̄|G_F, infinity weight k_(ρ̄) and no finite ramification. Combine the niveau-two construction, weight changes and level removal. The prime-three case required for the larger KW theorem uses a separate Khare input and is not covered by l>3.

**Lean name:** `TauCeti.PotentialModularity.taylorSerreWeightPotentialResidual`.

**Sources:** [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, Theorem 5.7, p. 770 (PDF page 42), §5, proof of Theorem 5.7, p. 771 (PDF page 43).

**Prerequisites:** [R23.3, Weight and level removal](#target-taylor-2006-lemmas-5-4-5-6-weight-and-level); [R23.3, The weight shift by l+1](#target-taylor-2006-lemma-5-3-weight-shift); [R23.3, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-snowden-totally-real-potential-residual-modularity"></a>
### Residual modularity over totally real fields

Let F be totally real, p odd, and ρ̄ : G_F → GL₂(F̄_p) continuous and odd. Fix finite-order ψ with det ρ̄ = ψ̄χ̄_p, a finite M/F and a definite A/B/C type function t above p. Choose finite Galois M′/F containing M and a totally real Galois F′/F disjoint from M′ so that, for every further totally real F″/F′ disjoint from M′, ρ̄|G_F″ is the residual representation of a cuspidal parallel-weight-two form f with determinant ψχ_p and t_f=t|F″. One may require F′ to split at a finite S when its prescribed p-types are compatible with the residual local representations there. Ordinary type A is included. Snowden's conditions (A1),(A2) apply to the auxiliary and given-lift arguments; they are not assumptions on the original ρ̄ in this residual theorem.

**Lean name:** `TauCeti.PotentialModularity.snowdenPotentialResidual`.

**Sources:** [Snowden v1][snowden], Theorem 5.1.1 and Proposition 8.2.1, pp. 15, 26.

**Prerequisites:** [R23.2, The Weil-restricted moduli application](#target-restriction-of-scalars-moduli-application); [R23.1, Soluble preliminary fields and split extensions](#target-snowden-soluble-preliminary-field); `AutomorphicGaloisRepresentations:R19.2`; `AutomorphicGaloisRepresentations:R19.6`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `GL2ModularityLifting:R22.5`.

<a id="target-bcgp-controlled-residual-modularity"></a>
### The two-prime ordinary refinement

Let F₁/F be finite totally real, and let distinct p,q>2 split completely in F₁. Suppose r : G_F₁ → GL₂(F̄_q) has determinant ε̄_q⁻¹, is unramified above p, and at every v|q has shape diag(λ_(α_v), ε̄_q⁻¹λ_(α_v)⁻¹), where λ_α is the unramified character taking arithmetic Frobenius to α. There is a totally real Galois F′/F, split above p and q and disjoint from F₁F_avoid, and a q-ordinary weight-zero cuspidal π over F₁F′ with trivial central character, unramified above pq, whose residual representation is r|G_F₁F′.

**Lean name:** `TauCeti.PotentialModularity.bcgpPotentialResidual`.

**Sources:** [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proposition 9.1.11 and proof, p. 458.

**Prerequisites:** [R23.3, Residual modularity over totally real fields](#target-snowden-totally-real-potential-residual-modularity); [R23.2, The Weil-restricted moduli application](#target-restriction-of-scalars-moduli-application); `AutomorphicGaloisRepresentations:R19.2`.

<a id="layer-r23-4"></a>
## R23.4 — Potential modularity of a given lift


Take the lift as data and use the residual modular witnesses in the appropriate lifting theorem. Preserve the local type and residual-image assumptions through field selection.

<a id="target-potential-modularity-of-a-given-lift"></a>
### Potential modularity of a given lift

Take an S-type ρ̄ satisfying the KW I Theorem 5.1 hypotheses, and an odd finitely ramified lift ρ, minimal away from p as required by its lifting data, with one of the A/B/C p-types. At p=2 allow crystalline weight two, or semistable weight two when ρ̄ is not finite at 2. Select a totally real Galois F preserving the residual image and cyclotomic irreducibility, unramified at p and split there when the residual local restriction is irreducible or k=p+1. The residual witnesses and allowable base change give (α),(β); the R22.5/R22.6 lifting theorem makes the **given ρ|G_F** the representation of a holomorphic cuspidal form. Existence of ρ is a separate premise. General regular de Rham lifts require a lifting theorem of that wider scope.

**Lean name:** `TauCeti.PotentialModularity.potentialModularityGivenLift`.

**Sources:** [KW II][kw-serre-modularity-II], §10.3.2, p. 93.

**Prerequisites:** [R23.3, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`; `GL2ModularityLifting:R22.6/kw-dyadic-lifting`; `GL2ModularityLifting:R22.5/kw-residual-modularity`; `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`.

<a id="layer-r23-5"></a>
## R23.5 — Control of extensions


State each completion, splitting and avoidance condition in the field chosen for the modularity argument. Descent requires an automorphic theorem with invariance and cuspidality premises.

<a id="target-control-of-the-extension"></a>
### Local control and avoidance

Build into the potential-modularity field the four controls of KW II Theorem 6.1(iii): when k=p and the residual inertia is trivial, trivialize the entire local decomposition-group restriction upstairs; make completions contain the chosen away-p local extensions; in the odd-prime k=p+1 case arrange complete splitting at p; and avoid the prescribed finite field by linear disjointness. Preserve the residual image and the cyclotomic irreducibility needed by subsequent lifting. Soluble descent is an additional automorphic theorem, requiring invariance and cuspidality; choosing a Galois extension alone supplies neither condition.

In the dihedral branch impose the extra split-prime condition of KW II p.54 that preserves irreducibility on G_(F(μ_p)). The determinant and weight are unchanged by field control.

**Lean name:** `TauCeti.PotentialModularity.controlledExtension`.

**Sources:** [KW II][kw-serre-modularity-II], Theorem 6.1 (iii), p. 54, proof of Theorem 6.1, p. 57.

**Prerequisites:** [R23.3, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); [R23.1, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; [R23.1, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [R23.1, Disjointness through towers](#target-tower-linear-disjointness); `GL2AutomorphicRepresentationsAndTransfer:R17.6`.

<a id="target-bcgp-local-galois-data-without-descent"></a>
### Local Galois data over a composite field

Let E′/E and F_avoid/E be finite and linearly disjoint, and prescribe a finite group G with local Galois extensions H_v/E′_v and embeddings of their groups into G at a finite set S′ above S. At real places prescribe c_v of order dividing two. Choose finite Galois K/E disjoint from E′F_avoid such that K′=KE′ splits every place in S′ over E′. Construct a G-Galois L′/K′ with the prescribed completions and decomposition groups up to conjugacy, including the prescribed complex conjugations. The result is over K′: no descent of L′ to K or disjointness of L′ from E′ over E is a conclusion.

**Lean name:** `TauCeti.PotentialModularity.bcgpLocalData`.

**Sources:** [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proposition 9.1.12 and proof, pp. 458–459.

**Prerequisites:** [R23.1, Potential realization of local Galois data](#target-potential-global-galois-local-data); `AbelianSchemesAndArithmeticModuli:A6`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; [R23.1, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); `SchemeAndStackFoundations:SF.2`.

<a id="layer-r23-6"></a>
## R23.6 — Exports and their direction of use


Keep the residual and characteristic-zero exports separate. The mathematical direction is field selection and an independent auxiliary lifting theorem → residual modularity → finiteness → characteristic-zero points. Modularity of a given lift uses the residual witnesses and its local lifting theorem; the family construction uses that given-lift conclusion.

| Input | Export | Use |
| --- | --- | --- |
| Residual representation with the hypotheses of R23.3 | Controlled residual modular witness | Finiteness in R24.1; residual premise for lifting in R23.4 |
| Separately given lift with its local type | Automorphy after restriction, R23.4 | Brauer family in R24.5 |
| Local containment, splitting and avoidance data | Controlled field and admissible descent data, R23.5 | Preservation of residual image and chosen local conditions |
| Finiteness and dimension bound for an unframed ring | Integral characteristic-zero point, R24.2 | Lift existence; subsequent modularity lifting |

**Sources:** [KW II][kw-serre-modularity-II], Theorem 6.1 and proof, pp.53–57; Theorem 10.1 and §§10.1–10.3, pp.90–94. **Prerequisites:** R23.1–R23.5 with their stated interfaces. The independent auxiliary lifting theorem is an input from the modularity-lifting owner; it cannot be deduced using the lift whose existence is being established.

<a id="layer-r24-1"></a>
## R24.1 — Finiteness of global rings


Use residual modularity over an auxiliary totally real field to prove module finiteness of the unframed ring. The ordinary CM adapter and its local-ring comparisons are part of the ordinary application’s premises.

<a id="target-auxiliary-totally-real-field-for-the-finiteness-argument"></a>
### The auxiliary field for global finiteness

Construct the auxiliary totally real F/ℚ for the fixed-determinant global deformation problem. Preserve nonsolubility at p=2 or cyclotomic absolute irreducibility at p>2; arrange splitting at p when the local residual restriction is irreducible and unramifiedness otherwise. Require ψ_F unramified away from p and trivial local residual restrictions above p when the original restriction is unramified.

Supply the weight-k(ρ̄), everywhere-unramified cuspidal witness of central character ψ_F for type A only under p≠2 or k(ρ̄)=2. Supply the weight-two witness of the same central character, unramified away from p and of conductor dividing v at v|p, for types B/C; at p=2,k=4 it must arise from the specified semistable local quotient. Arrange splitting at p for the weight-p+1 lifting argument. Finally require the mod-p universal representation τ|G_F to be unramified away from p and infinity. This last condition is part of the finiteness construction, not a consequence of the existence of a single modular witness.

**API.**

- `AuxiliaryField`: F with the conditions (1)–(4) and the representations π′
- `AuxiliaryField.piA`: π′ unramified everywhere, weight k(ρ̄), central character ψ_F (type (A)); this projection is available only under p ≠ 2 or k(ρ̄) = 2. No type-(A) witness is supplied at p = 2, k = 4.
- `AuxiliaryField.piBC`: π′ of conductor dividing v at v | p, weight 2, central character ψ_F (types (B), (C))
- `AuxiliaryField.tau_unramified`: the reduction τ of the universal representation is unramified on G_F outside p and ∞
- `AuxiliaryField.exists`: existence from Theorem 6.1 with (iii)(b)–(d), Theorem 8.2 and the local killing of ramification
- `AuxiliaryField.piA_iff`: The type-(A) automorphic witness is available under p≠2 or k(ρ̄)=2; at p=2, k=4 only the type-(B)/(C) witness is part of the construction.
- `AuxiliaryField.piBC_eq`: The accessor returns the chosen weight-two witness with central character ψ_F, together with its Galois realization.

**Tests.**

- `aux_dyadic_weight_four`: At p=2,k=4 the type-A accessor has no witness; the type-B/C accessor returns the weight-two witness with the specified semistable condition C.
- `aux_unramified_at_p`: If the original local residual representation at p is unramified, require the selected field to trivialize it at every place above p; evaluate the stored restriction on the corresponding local Frobenius powers.
- `aux_not_cm`: The stored field is totally real and cannot contain an element i with i²=−1; a CM field cannot serve as the field of Hilbert modular witnesses here.
- `aux_tame_killing`: Tame inertia of order e at l≠p is killed by the prescribed ramified local extension; for e=3,l=7 use ℚ₇(7^(1/3)), with 3|(7−1), and evaluate the restricted universal residual representation on inertia.

**Lean name:** `TauCeti.CompatibleSystems.AuxiliaryField`.

**Sources:** [KW II][kw-serre-modularity-II], proof of Theorem 10.1, p. 90, proof of Theorem 10.1, first bullet, p. 90, proof of Theorem 10.1, third bullet, p. 91, proof of Theorem 10.1, fourth bullet, p. 91.

**Prerequisites:** [R23.3, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); [R23.5, Local control and avoidance](#target-control-of-the-extension); `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `LocalGaloisDeformationRings:R08.2`.

<a id="target-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring"></a>
### Finiteness of the KW unframed ring

Under the residual-image, determinant and A/B/C local-condition hypotheses of KW II Theorem 10.1, prove that the fixed-determinant **unframed** global ring R̄_S^ψ is finite as a ℤ_p-module. Restrict its universal mod-p representation to the auxiliary F, apply the appropriate R=T finiteness over F, and deduce that the universal residual image over ℚ is finite. The finite-image criterion then yields module finiteness. Do not replace this last step by an unproved finiteness assertion for the restriction map between global rings. The framed ring is a formal power-series enlargement by 4|S|−1 variables and is not asserted module-finite.

Assume S-type, the odd-prime weight interval 2≤k≤p+1 and cyclotomic absolute irreducibility, or nonsoluble image at p=2. The local conditions are those of KW II Theorem 3.1; for p>2 condition C is used only when k=p+1. Over F use minimal odd deformations unramified away from p with determinant ψ_Fχ_p and the uniform A/B/C condition at p.

**Lean name:** `TauCeti.CompatibleSystems.kwGlobalFiniteness`.

**Sources:** [KW II][kw-serre-modularity-II], proof of Theorem 10.1, p. 91, proof of Theorem 10.1, pp. 91-92, end of proof of Theorem 10.1, p. 92, Theorem 10.1, p. 90.

**Prerequisites:** `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`; [R24.1, The auxiliary field for global finiteness](#target-auxiliary-totally-real-field-for-the-finiteness-argument); `DeformationAndDerivedPatchingAlgebra:R03.4`; `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`; `GL2ModularityLifting:R22.6/kw-dyadic-lifting`; `GL2ModularityLifting:R22.3/minimal-ring-finite`; `AutomorphicGaloisRepresentations:R19.6`.

<a id="target-ordinary-global-ring-finiteness"></a>
### Ordinary unframed-ring finiteness

For p>2 and totally real F, fix a totally odd absolutely irreducible ρ̄, adequate on G_(F(ζ_p)), with ζ_p∉F. Fix a determinant and S containing p and all ramification, and assume an ordinary regular algebraic cuspidal lift of that determinant exists. At p use Thorne's semistable ordinary local quotient of fixed regular Hodge type; away from p use unrestricted fixed-determinant conditions. With the polarized CM-extension adapter and finite restriction-map comparison of Thorne Theorem 10.2, the unframed GL₂ global ring is finite over O. Further away-p quotients remain finite. Applying this conclusion to an ordinary flag ring, R† or a different potentially crystalline component requires an actual local-ring/base-change comparison.

**Lean name:** `TauCeti.CompatibleSystems.ordinaryGlobalFiniteness`.

**Sources:** [Thorne][thorne], Theorem 10.2, setup and proof, author pp. 56–58.

**Prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; `GlobalGaloisDeformations:R04.6`; `LocalGaloisDeformationRings:L8`; [R23.1, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions).

<a id="target-cg-ordinary-ring-finiteness"></a>
### The Calegari–Geraghty finiteness application

In Calegari–Geraghty Theorem 4.8's setting, take p≥3 and an absolutely irreducible modular ρ̄ of G_ℚ, twist-minimal away from p. For each harmless-prime character φ fix χ_φ = ε det(ρ̄) ε̄⁻¹φ, use the framed ordinary R† at p and unrestricted fixed-determinant local rings at the other ramified places. Prove finiteness over O of the corresponding unframed R_φ, including the scalar unramified-at-p branch. Its framed enlargement remains a power-series ring over it. This theorem supplies the finiteness input to the multiplicity argument; the ordinary-ring comparison is a prerequisite.

**Lean name:** `TauCeti.CompatibleSystems.cgRingFiniteness`.

**Sources:** [Calegari–Geraghty][cg], Theorem 4.8 proof, PDF pp. 65–68, especially the finiteness paragraph on p. 68.

**Prerequisites:** [R24.1, Ordinary unframed-ring finiteness](#target-ordinary-global-ring-finiteness); `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; `LocalGaloisDeformationRings:L8`.

<a id="layer-r24-2"></a>
## R24.2 — Characteristic-zero points


Combine a dimension lower bound and finiteness to obtain an integral coefficient-extension point. The representation is then specialized from the universal one; modularity is a later application.

<a id="target-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type"></a>
### Points give lifts with the required local type

For a nonzero complete noetherian local fixed-determinant global ring R̄_S^ψ that is finite over O and has absolute Krull dimension at least one, use the characteristic-zero-point theorem to obtain a continuous map R̄_S^ψ → O′ for the integers of a finite extension of Frac O. Specialize the universal representation: it lifts ρ̄, has determinant ψχ_p and satisfies the chosen local conditions at every place. The local A/B/C classifications identify its required type. Finiteness alone is insufficient: a nonzero finite O-algebra of dimension zero can be killed by a power of the uniformizer and have empty characteristic-zero fibre.

**Lean name:** `TauCeti.CompatibleSystems.requiredTypeLiftExists`.

**Sources:** [KW II][kw-serre-modularity-II], proof of Proposition 4.5, p. 43, proof of Proposition 4.5, p. 45, Corollary 4.7 and proof, pp. 45-46, 10.3.1, p. 92, Corollary 4.7, p. 45.

**Prerequisites:** `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product`; `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; [R24.1, Finiteness of the KW unframed ring](#target-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring); `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`.

<a id="target-newton-thorne-khare-wintenberger-extraction"></a>
### Points on prescribed Newton–Thorne components

Use Newton–Thorne Lemma 3.1 with p≥5, π RAESDC over totally real F, determinant ε⁻¹, weight zero and Steinberg at p, tame dihedral order p at v₀ with q_(v₀)≡−1 mod p, potential unramifiedness away from p, and residual image containing SL₂(F_(p^a)) for a>a₀(p). Select the ordinary potentially crystalline components at p, the Steinberg component at v₀, and the specified regular components elsewhere. Hida specialization and the explicit unipotently ramified lift establish local nonemptiness. The chosen global lift has determinant ε⁻²ω and Hodge–Tate weights {0,2}.

The dimension bound gives dim R≥1 for the unframed global ring of these components, and the applicable finiteness comparison gives R finite over O. Hence R[1/p]≠0 and an integral characteristic-zero point exists over a finite coefficient extension. Its representation lies on the prescribed local components. Automorphy is obtained by a subsequent lifting application; it is not used as a premise for extracting this point.

**Lean name:** `TauCeti.CompatibleSystems.newtonThornePoint`.

**Sources:** [Newton–Thorne][newton-thorne], §3, p. 14, Khare–Wintenberger paragraph.

**Prerequisites:** [R24.1, Ordinary unframed-ring finiteness](#target-ordinary-global-ring-finiteness); `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`; `GlobalGaloisDeformations:R04.6`; `LocalGaloisDeformationRings:R08.6`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `PadicFamilies:L5`.

<a id="layer-r24-3"></a>
## R24.3 — Prescribed lifts


Use the global presentation and finiteness separately, then identify the resulting local types. A compatible inertial lattice is not a substitute for a local solution of a prescribed lifting problem.

<a id="target-bockle-presentation"></a>
### Böckle's global-ring presentation

Let ρ̄ : G_ℚ → GL₂(k) be odd and absolutely irreducible, with a global deformation condition X unramified outside finite S. Set d=0 and Ad_X=Ad⁰ρ̄ for fixed determinant, and d=1 and Ad_X=Adρ̄ otherwise. Assume the away-p local rings are complete intersections flat over ℤ_p of relative dimension h⁰(G_l,Ad_X)−Δ_l, and the p-adic ring is a flat complete intersection of relative dimension h⁰(G_p,Ad_X)+1+d−Δ_p. Writing Δ=ΣΔ_l, obtain a presentation R_X ≅ O[[x₁,…,x_(n+d)]]/(f₁,…,f_(n+Δ)). In particular Δ≤0 gives at most as many relations as variables; the minimal fixed-determinant case has a presentation W[[X₁,…,X_r]]/(f₁,…,f_s) with r≥s. Oddness enters the global Euler-characteristic computation. These local dimensions come from R08.6, and finiteness over O remains the separate input of R24.1.

**Lean name:** `TauCeti.CompatibleSystems.bockle_presentation`.

**Sources:** [Böckle][bockle-appendix-2003], Proposition 1, p. 2, Proof of Proposition 1, p. 2; [KW Annals][kw-annals-2009], Proposition 3.4, printed p. 240.

**Prerequisites:** `GlobalGaloisDeformations:R04.3/local-to-global-presentation`; `GlobalGaloisDeformations:R04.3/relative-tangent-space`; `LocalGaloisDeformationRings:R08.6/kw-local-conditions`.

<a id="target-finite-presentation-complete-intersection"></a>
### Finite presentations and complete intersections

Let O be a complete DVR with uniformizer π, let A=O[[x₁,…,x_n]], and take f₁,…,f_m in its maximal ideal with m≤n. Suppose R=A/(f₁,…,f_m) is nonzero, complete noetherian local, has the same residue field as O, and is finite over O. Then m=n, (π,f₁,…,f_n) is A-regular, and R is a finite flat complete intersection over O with R[1/π]≠0. Import the regular-local/Cohen–Macaulay proof from R03.3 and characteristic-zero-point extraction through R24.2 from R03.4. Finiteness is essential: O[[x]] has no relations and is flat but is not finite over O, so it cannot imply m=n.

**Lean name:** `TauCeti.CompatibleSystems.finite_presentation_complete_intersection`.

**Sources:** [Böckle][bockle-appendix-2003], Lemma 2, p. 5.

**Prerequisites:** `mathlib:RingTheory.Sequence.IsRegular`; `mathlib:IsLocalRing`; `mathlib:ringKrullDim`; `mathlib:Module.Flat`; `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`; [R24.2](#layer-r24-2).

<a id="target-bockle-minimal-r-equals-t"></a>
### From auxiliary to minimal R=T

In Böckle's appendix to Khare's 2003 deformation/Hecke-ring theorem, assume an auxiliary set Q for which R_Q → T_Q is an isomorphism of finite flat W(k)-algebras. The minimal comparison R_∅ → T_∅ is then an isomorphism. Use the surjection R_Q → R_∅ for finiteness and compare geometric points of the generic fibres with the reduced finite flat Hecke algebras. The auxiliary R=T theorem is an input from R22; this comparison does not independently construct the auxiliary modular lift.

**Lean name:** `TauCeti.CompatibleSystems.bockle_minimal_r_equals_t`.

**Sources:** [Böckle][bockle-appendix-2003], Theorem 1, p. 1.

**Prerequisites:** [R24.3, Böckle's global-ring presentation](#target-bockle-presentation); [R24.3, Finite presentations and complete intersections](#target-finite-presentation-complete-intersection); `GL2ModularityLifting:R22.3/minimal-ring-finite`; `AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`.

<a id="target-kw-annals-minimal-lifts"></a>
### The minimal-lift theorem

For an S-type residual representation in odd characteristic, assume absolute irreducibility over ℚ(μ_p), 2≤k(ρ̄)≤p+1 and k(ρ̄)≠p. There is a lift minimally ramified at every prime. At k=p+1 one can choose either crystalline Hodge–Tate weights (0,p) or semistable weight two. Combine the minimal ring's presentation with at least as many variables as relations, potential-modularity finiteness and the complete-intersection result, then extract a characteristic-zero point. The source excludes weight p because its Fontaine–Laffaille and R=T inputs do not supply that case. This method is the one attributed to the remark in Khare–Ramakrishna §5.2; the theorem and its proof occur in KW Annals §3. The coefficient field of a lift is not fixed by the theorem.

**Lean name:** `TauCeti.CompatibleSystems.kw_annals_minimal_lifts`.

**Sources:** [KW Annals][kw-annals-2009], Theorem 3.3, printed p. 239, Introduction, printed p. 231, Lemma 3.6, printed p. 241, References, printed p. 252, Proof of Proposition 3.8, printed p. 242.

**Prerequisites:** [R24.3, Böckle's global-ring presentation](#target-bockle-presentation); [R24.3, Finite presentations and complete intersections](#target-finite-presentation-complete-intersection); `LocalGaloisDeformationRings:R08.6/export-endpoint-weight`; `GL2ModularityLifting:R22.3/minimal-ring-finite`; [R24.1](#layer-r24-1).

<a id="target-required-lift-types"></a>
### The four required lift types

Fix an S-type ρ̄, with cyclotomic absolute irreducibility and 2≤k(ρ̄)≤p+1 for p>2, or nonsoluble image for p=2. A lift of required type is an O′-point of the fixed-determinant global ring for one of the following local prescriptions.

1. It is minimal at all l≠p and crystalline of weight k(ρ̄) at p. Require k=2 when p=2.
2. It is minimal at all l≠p and has weight two at p, with inertial WD parameter (ω_p^(k−2)⊕1,0). At k=p+1 replace this by (id,N) with N≠0 nilpotent; the dyadic exceptional weight is k=4.
3. Let q be odd with q∥N(ρ̄), p|(q−1) and residual inertia (χ,*;0,1). At p use type 2, and be minimal away from p,q. At q prescribe (χ′,*;0,1), where χ′=ω_q^i lifts χ and 0<i≤q−2. Require i even when p=2.
4. Let q≠p, p|(q+1), and assume residual decomposition-group shape (χ_p,*;0,1) up to unramified twist. At p use type 2 and be minimal away from p,q. At q prescribe χ′⊕χ′^q, with χ′=ω_(q,2)^iω_(q,2)^(qj) of p-power order and genuinely level two, 0≤j<i≤q−1. Require i+j even when p=2. Such a character is unavailable in the dyadic case v₂(q+1)=1.

Minimality uses Diamond's condition and the dyadic version from KW II §3.3.1, imported through R08.6. In type 4 the distinct inertia characters split any characteristic-zero extension. If q∥N(ρ̄) and p∤q−1, a geometric lift with q∥N(ρ) is automatically minimal there; this explains the divisibility hypothesis of type 3.

**API.**

- `RequiredLiftType`: the case (1)–(4) with its auxiliary data (q, χ′) and the fixed character ψ
- `RequiredLiftType.localCondition`: the local condition X_v of LocalGaloisDeformationRings R08.6 at each v ∈ S
- `RequiredLiftType.ring`: the ring R̄^ψ_S of GlobalGaloisDeformations R04.6 for these conditions
- `RequiredLiftType.points_iff`: 𝒪′-points of the ring ↔ lifts of the required type
- `RequiredLiftType.det`: every lift of the type has determinant ψχ_p

**Tests.**

- `type3_parity_p2`: p = 2, q = 5: χ′ = ω₅ has i = 1 odd and is excluded; ω₅² (i = 2) is allowed
- `type4_level_two_exists`: p = 2: q = 7 has v₂(8) = 3 ≥ 2, so level-2 characters of 2-power order exist; q = 5 has v₂(6) = 1 and none exist
- `type2_steinberg`: k(ρ̄) = p + 1: the inertial parameter is (id, N ≠ 0), a Steinberg type
- `type3_needs_p_divides`: p=3, q=5: 3∤4=q−1, so type (3) is unavailable. For a geometric regular lift with q∥N(ρ̄), the imported R08.6 automatic-minimality criterion applies at q when p∤q−1.

**Lean name:** `TauCeti.CompatibleSystems.RequiredLiftType`.

**Sources:** [KW I][kw-serre-modularity-I], Theorem 5.1, p. 9 of the preprint, Theorem 5.1(4), p. 10 of the preprint, Remark after Theorem 5.1, p. 10.

**Prerequisites:** `LocalGaloisDeformationRings:R08.6/kw-local-conditions`; `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `AlgebraicModularFormsAndSerreWeights:R15.6`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`.

<a id="target-theorem-5-1-part-1-minimal-crystalline"></a>
### Minimal crystalline lifts

With the common hypotheses of the required-type definition, obtain a type-1 lift, minimal away from p and crystalline of weight k at p. At p=2 require k=2. The odd-prime case includes k=p, using the KW II local rings and finiteness argument that extend beyond the Annals theorem.

**Lean name:** `TauCeti.CompatibleSystems.theorem_5_1_part_1_minimal_crystalline`.

**Sources:** [KW I][kw-serre-modularity-I], Theorem 5.1(1), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

**Prerequisites:** [R24.3, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [R24.1](#layer-r24-1); [R24.2](#layer-r24-2).

<a id="target-theorem-5-1-part-2-weight-two"></a>
### Minimal weight-two lifts

With the common required-type hypotheses, obtain a type-2 weight-two lift, minimal away from p. Its inertial WD parameter is (ω^(k−2)⊕1,0), or (id,N≠0) in the exceptional k=p+1 branch. At p=2,k=4 use the semistable noncrystalline weight-two condition C.

**Lean name:** `TauCeti.CompatibleSystems.theorem_5_1_part_2_weight_two`.

**Sources:** [KW I][kw-serre-modularity-I], Theorem 5.1(2), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

**Prerequisites:** [R24.3, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [R24.1](#layer-r24-1); [R24.2](#layer-r24-2).

<a id="target-theorem-5-1-part-3-level-one-type-at-q"></a>
### A level-one type at q

Under the common hypotheses and the complete type-3 local prescription, construct a lift with the chosen level-one inertia character χ′=ω_q^i at q and the specified weight-two p-type. The character parity at p=2, q∥N(ρ̄) and p|(q−1) remain essential. Once this lift lies in a system, an irreducible residual q-member has normalized Serre weight i+2 or q+1−i up to twist, as determined by its coefficient-prime type.

**Lean name:** `TauCeti.CompatibleSystems.theorem_5_1_part_3_level_one_type_at_q`.

**Sources:** [KW I][kw-serre-modularity-I], Theorem 5.1(3), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

**Prerequisites:** [R24.3, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [R24.1](#layer-r24-1); [R24.2](#layer-r24-2); `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

<a id="target-theorem-5-1-part-4-level-two-type-at-q"></a>
### A level-two type at q

Under the common hypotheses and the type-4 residual shape, divisibility p|(q+1), genuine level-two p-power character and dyadic parity restrictions, construct the prescribed lift. This inserts a good dihedral prime for the applications in ClassicalSerreModularity R27.1. The exceptional p=2,v₂(q+1)=1 case cannot be supplied with the required character.

**Lean name:** `TauCeti.CompatibleSystems.theorem_5_1_part_4_level_two_type_at_q`.

**Sources:** [KW I][kw-serre-modularity-I], Theorem 5.1(4), p. 10 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

**Prerequisites:** [R24.3, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [R24.1](#layer-r24-1); [R24.2](#layer-r24-2); `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

<a id="target-theorem-5-1-application-table"></a>
### Lift prescriptions in the modularity arguments

Use the following map from modularity arguments to lift prescriptions. Each use first checks the residual q-shape, p|(q±1) and dyadic parity required by its type.

| Argument in KW I | Lift types |
| --- | --- |
| §8.1, Theorem 3.1, removal of ramification | 1 |
| §8.2, characteristic three | 2, then 4 with ω_(3,2)² |
| §8.2, characteristic five | 2, then 3 with ω₅²; for the new residual five-member use 2 if 3 divides its conductor, and 1 otherwise |
| §8.2, inductive step | 2, then 3 with ω_P^i from §7; for the new residual P-member use 2 if the original p divides its conductor, and 1 otherwise |
| §8.3, Corollary 8.1 | 1 |
| §8.4, Theorem 3.4 | 2, then 4 at the good dihedral prime |
| §9, Theorem 9.1 | 2 and the order-three type 4 at 2 |

The Annals minimal-lift theorem is the type-1 case with k≠p. In Dieulefait–Pacetti Theorem 1.9, cases 1–3 use the appropriate odd-prime or dyadic instances of types 1 and 2. Its fourth case uses the prescribed-type local-to-global theorem below.

**Lean name:** `TauCeti.CompatibleSystems.theorem_5_1_application_table`.

**Sources:** [Dieulefait–Pacetti v2][dieulefait-pacetti], Proof of Theorem 1.9, p. 6 of the arXiv version; [KW I][kw-serre-modularity-I], §8.2, pp. 13–15 of the preprint.

**Prerequisites:** [R24.3, Minimal crystalline lifts](#target-theorem-5-1-part-1-minimal-crystalline); [R24.3, Minimal weight-two lifts](#target-theorem-5-1-part-2-weight-two); [R24.3, A level-one type at q](#target-theorem-5-1-part-3-level-one-type-at-q); [R24.3, A level-two type at q](#target-theorem-5-1-part-4-level-two-type-at-q); [R24.3, The minimal-lift theorem](#target-kw-annals-minimal-lifts).

<a id="target-modern-prescribed-type-lifts"></a>
### Prescribed-type local-to-global lifting

Let p be odd and F totally real. Assume ρ̄ is odd, absolutely irreducible on G_(F(ζ_p)); if p=5 and its projective image is PGL₂(F₅), also assume [F(ζ₅):F]=4. For finite Σ containing p and all ramification, finite-order ψ with det ρ̄=ψ̄χ̄_p, a definite type t and inertial types τ_v, consider weight-two lifts of determinant ψχ_p, unramified outside Σ, with those local data. There are finitely many solutions, and a solution exists exactly when actual local solutions exist at every specified place. A compatible definite type on a subset Σ′ also gives the lift of Snowden Theorem 7.6.1.

For the application over ℚ the p=5 exception is automatic. Use crystalline p-type when k=2 and Steinberg p-type when k=p+1 where asserted. An inertial-type lattice reducing to residual inertia does not by itself provide a lift of the complete local decomposition-group representation with the chosen determinant and definite type. Establish that local nonemptiness through R08.6 before applying the theorem. Inertial type forgets N; definite type retains the relevant monodromy information. Snowden Proposition 7.7.1 supplies some definite-type lift of the same conductor, rather than every prescribed inertial type.

**Lean name:** `TauCeti.CompatibleSystems.modern_prescribed_type_lifts`.

**Sources:** [Snowden v1][snowden-2009], Theorem 7.2.1, p. 21 of arXiv:0905.4266v1, §1.4, notation, p. 3 of arXiv:0905.4266v1, §3.1 (A1)–(A2), p. 6; §7.1–7.7, pp. 20–23, especially Propositions 7.3.1 and 7.4.1 and Theorem 7.6.1 (arXiv v1); [Dieulefait–Pacetti v2][dieulefait-pacetti], Theorem 1.9(4), p. 6 of the arXiv version.

**Prerequisites:** `LocalGaloisDeformationRings:R08.6`; [R24.1](#layer-r24-1); [R24.2](#layer-r24-2); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`.

<a id="layer-r24-4"></a>
## R24.4 — Rational-field modularity lifting


Import the full rational-field lifting theorems, rather than reconstructing them from a smaller totally real theorem. This layer supplies the comparison needed by linked systems.

<a id="target-alpha-beta-from-residual-modularity"></a>
### Residual weight witnesses for lifting

For a modular S-type ρ̄ satisfying the image hypotheses of KW I Theorem 4.1, import the weight part of Serre's conjecture to produce a weight-k witness of level prime to p and a weight-two witness of level Np. An allowable soluble totally real base change, unramified or split at p as required, gives the residual conditions (α),(β) used in the odd-prime lifting theorem, and (α) at p=k=2 and (β) at p=2. Gross's auxiliary level condition N>4 causes no restriction because the level need not be optimal. The k=p argument has the separate treatment of KW II §10.2.

**Lean name:** `TauCeti.CompatibleSystems.alpha_beta_from_residual_modularity`.

**Sources:** [KW II][kw-serre-modularity-II], §10.2, p. 92 of the preprint.

**Prerequisites:** `GL2ModularityLifting:R22.5/kw-residual-modularity`; `SerreWeightAndLevelOptimisation:R20.6`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`; `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`.

<a id="target-kw-theorem-4-1"></a>
### The full rational-field lifting theorem

Import the full rational-field modularity lifting theorem from R22.5/R22.6. Suppose ρ̄ is modular, with nonsoluble image at p=2 and absolute irreducibility on G_(ℚ(μ_p)) at p>2. For p=2, an odd finitely ramified lift is modular if crystalline of weight two, or semistable of weight two with residual k=4. For p>2, a finitely ramified lift is modular if crystalline of weight 2≤k≤p+1 or potentially semistable of weight two.

The interface combines residual weight witnesses, allowable base change, the relevant cases of KW II Theorem 9.7, the additional lifting inputs and soluble descent. Import `R22.5/kw-i-theorem-4-1-odd-prime` and `R22.6/kw-i-theorem-4-1-dyadic`: substituting Theorem 9.7 alone would lose some odd-prime cases, including the additional nonordinary weight-p+1 input.

**Lean name:** `TauCeti.CompatibleSystems.kw_theorem_4_1`.

**Sources:** [KW I][kw-serre-modularity-I], Theorem 4.1, p. 7 of the preprint; [KW II][kw-serre-modularity-II], §10.2, p. 92 of the preprint.

**Prerequisites:** [R24.4, Residual weight witnesses for lifting](#target-alpha-beta-from-residual-modularity); `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`; `GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

<a id="layer-r24-5"></a>
## R24.5 — Families through potentially modular lifts


Start with a given potentially modular lift. Automorphic families over soluble intermediate fields give a virtual Brauer class; prove its genuineness before asserting that it is a compatible family. The full coefficient-prime theorem then gives all-place strictness.

<a id="target-brauer-induction-system"></a>
### Genuine families from Brauer induction

Suppose a given two-dimensional lift ρ becomes the representation of a holomorphic cuspidal Hilbert form over a finite totally real Galois F/ℚ, and remains absolutely irreducible over F. Write the trivial character of G=Gal(F/ℚ) as Σn_i Ind_(G_i)^Gχ_i with soluble G_i and fixed fields F_i. Soluble base change gives the corresponding cuspidal forms π_i over F_i. In every coefficient characteristic define the virtual class A_ι=Σn_i Ind_(G_F_i)^(G_ℚ)(χ_i⊗ρ_(π_i,ι)).

Assume the automorphic members at these soluble intermediate fields are absolutely irreducible and their overlaps are identified by Frobenius recognition. The dimension-two, norm-one pairing calculation then proves A_ι is a genuine absolutely irreducible representation. Its good traces agree with the given lift, it is independent of Brauer choices, and restriction to any F′⊆F with F/F′ soluble gives the member of the descended automorphic form. Put all automorphic families and characters over one finite coefficient field before forming the family; unrelated coefficient fields at different primes do not define a system.

**API.**

- `brauerSystem`: ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}) from the Brauer data and the base-changed π_i
- `brauerSystem_isTrue`: The virtual class has dimension 2 and norm-one pairing, hence is the class of a genuine absolutely irreducible member.
- `brauerSystem_trace`: After mapping the common algebraic trace into both coefficient fields, all good Frobenius characteristic polynomials agree with the given p-member; no direct equality between ℓ-adic and p-adic values is asserted.
- `brauerSystem_unique`: Uniqueness memberwise up to representation isomorphism after a common coefficient extension; no canonical basis, lattice or conjugating matrix is asserted.
- `brauerSystem_restrict`: restriction to G_{F′} with F/F′ solvable is automorphic

**Tests.**

- `brauer_trivial_F`: F = ℚ: 1_G = Ind 1, and ρ_ι = ρ_{π,ι} is the system of π itself
- `brauer_quadratic_coefficients`: G = ℤ/2: the regular character (2, 0) minus the sign character (1, −1) is the trivial character (1, 1), i.e. 1_G = Ind_1^G 1 − ε
- `brauer_virtual_nonexample`: the virtual character 3·1 − ε of ℤ/2 has degree 2 but value 4 at the generator, more than its degree, so it is not a character: degree 2 alone does not make a virtual representation true
- `brauer_trace_agreement`: For the geometric/dual family of a non-CM elliptic curve E/ℚ with F=ℚ, the construction returns the given automorphic cohomological family (or its KW-normalized dual) memberwise up to isomorphism.

**Lean name:** `TauCeti.CompatibleSystems.brauerSystem`.

**Sources:** [KW II][kw-serre-modularity-II], §10.3.2, p. 93 of the preprint; [Khare, level one][khare-level-one], §3, proof of Proposition 3.1, pp. 16–17 of arXiv:math/0504080v1 (KW II cite it as the proof of Theorem 5.1 of the Duke version).

**Prerequisites:** [R24.5:operations, Rank-two plain, almost-strict and strict families](#target-compatible-system); [R24.5:operations, Twisting, restriction and induction](#target-system-operations); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; [R23.4](#layer-r23-4); `ArithmeticGaloisRepresentations:R01.5`; [R24.5:operations, The arithmetic representation ring](#target-galois-grothendieck-ring); `AutomorphicGaloisRepresentations:R19.3`; `AutomorphicGaloisRepresentations:R19.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`; `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

<a id="target-almost-strict-compatibility"></a>
### The historical almost-strict comparison

For the Brauer family choose the decomposition field F(q) at a place Q|q and the local WD parameter r_q of the form descended there. Away from the coefficient characteristic, Carayol–Taylor local–global compatibility identifies r_q with the member's parameter. At q=l≠2 with unramified r_q, the Breuil–Berger input gives crystallinity and the same parameter. At q=l with irreducible residual member, Kisin's deformation input, after disjoint field selection, gives the geometric comparison. Together these establish exactly KW almost strictness. The contract does not cover q=l=2 with reducible residual member, nor a reducible residual member with ramified r_q. The strict result below uses a stronger coefficient-prime theorem.

**Lean name:** `TauCeti.CompatibleSystems.almost_strict_compatibility`.

**Sources:** [KW II][kw-serre-modularity-II], §10.3.2, p. 93, §10.3.2, p. 94.

**Prerequisites:** [R24.5, Genuine families from Brauer induction](#target-brauer-induction-system); `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; [R24.5:operations, Rank-two plain, almost-strict and strict families](#target-compatible-system); `AutomorphicGaloisRepresentations:R19.3`; `AutomorphicGaloisRepresentations:R19.4`; [R23.5](#layer-r23-5); `AutomorphicGaloisRepresentations:R19.5`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`; `AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

<a id="target-kw-theorem-5-1-systems"></a>
### Families through the four required lifts

For an S-type residual representation satisfying the common KW I Theorem 5.1 hypotheses, and for each of the four lift types with its extra local conditions, obtain an E-rational odd irreducible almost-strict family whose selected p-member lifts ρ̄ with that type. In type 3, an irreducible residual q-member has weight i+2 or q+1−i up to twist. In type 4 for odd q, it has weight q+1−(i−j) or i−j when i>j+1, and weight q when i=j+1. These computations use Savitt's reductions of tame potentially Barsotti–Tate types.

The q=2 order-three application has its separate KW argument giving residual weight two; Savitt's theorem is not applied there. Diamond's allowed pairs j=m(q+1)/p^r−1 and i=q−1−j, 0<m<p^r/2, exclude i=j+1 in that selection. The good polynomials lie in one finite coefficient field. For these constructed families, the full coefficient-prime theorem upgrades almost strictness to strictness and supplies purity with the stated geometric normalization.

**Lean name:** `TauCeti.CompatibleSystems.kw_theorem_5_1_systems`.

**Sources:** [KW I][kw-serre-modularity-I], Theorem 5.1, p. 9 of the preprint, Remark after Theorem 5.1, p. 10, Proof of Theorem 9.1, p. 19 of the preprint; [KW II][kw-serre-modularity-II], §10.3.2, p. 94.

**Prerequisites:** [R24.3, Minimal crystalline lifts](#target-theorem-5-1-part-1-minimal-crystalline); [R24.3, Minimal weight-two lifts](#target-theorem-5-1-part-2-weight-two); [R24.3, A level-one type at q](#target-theorem-5-1-part-3-level-one-type-at-q); [R24.3, A level-two type at q](#target-theorem-5-1-part-4-level-two-type-at-q); [R24.5, Genuine families from Brauer induction](#target-brauer-induction-system); [R24.5, The historical almost-strict comparison](#target-almost-strict-compatibility); `AlgebraicModularFormsAndSerreWeights:R15.4`; [R24.5, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system).

<a id="target-dieulefait-families"></a>
### Families through given lifts

Take an odd irreducible continuous finitely ramified p-adic lift over ℚ, de Rham with Hodge–Tate weights {0,k−1}, k>1, whose residual restriction to ℚ(ζ_p) is absolutely irreducible, or whose residual image is nonsoluble at p=2. Construct a family for the following scope: after twisting, the residual representation satisfies the KW hypotheses, and the given lift has p-type A/B/C of R23.4; at p=2 it is crystalline weight two or semistable weight two with non-finite residual local representation. This includes the minimal crystalline cases and the weight-two cases that are crystalline, Steinberg or KW type B at p. Potential modularity of the **given** lift and the Brauer construction, followed by the strict upgrade, give the de Rham condition at every member required by the Dieulefait–Pacetti definition.

The broader de Rham statement of DP Theorem 1.11 requires additional potential modularity: other potentially Barsotti–Tate inertial types need their lifting theorem, and k>p+1 or potentially semistable weight greater than two need a regular de Rham lifting theorem. These are boundaries of R23.4. Dieulefait's 2004 Theorem 1.1 assumes crystallinity at an odd q, weights {0,w} with w odd, and q≥2w+1; it is not the source of the unrestricted statement.

**Lean name:** `TauCeti.CompatibleSystems.dieulefait_families`.

**Sources:** [Dieulefait–Pacetti v2][dieulefait-pacetti], Theorem 1.11, p. 7 of the arXiv version, Proof of Theorem 1.11, p. 7 of the arXiv version, Definition 1.10(4), p. 7 of the arXiv version; [Dieulefait, families][dieulefait-2004], Theorem 1.1, pp. 1–2 of arXiv:math/0304433v1.

**Prerequisites:** [R23.4](#layer-r23-4); [R24.5, Genuine families from Brauer induction](#target-brauer-induction-system); [R24.5, The historical almost-strict comparison](#target-almost-strict-compatibility); [R24.5, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system).

<a id="target-strict-brauer-system"></a>
### All-place strictness of the Hilbert–Brauer family

For the Brauer family built from holomorphic cuspidal Hilbert forms of motivic weights k_τ≥2, Skinner's full coefficient-prime theorem supplies common Hodge–Tate weights and Frobenius-semisimple WD comparison at every finite q, including q=l, l=2 and residually reducible members. Decomposition-field descent therefore gives KW all-place strict compatibility. Unramified r_q then gives crystallinity, using the de Rham criterion that WD inertia is trivial and N=0.

Purity of the Hilbert modular families in the geometric convention descends to the same weight w; local strict purity is transported by local–global comparison. Invoke the automorphic purity and Skinner suppliers separately: BLGGT's away-coefficient strictness by itself does not establish the full coefficient-prime comparison.

**Lean name:** `TauCeti.CompatibleSystems.strict_brauer_system`.

**Sources:** [KW II][kw-serre-modularity-II], §10.3.2, pp.93–94; [Skinner][skinner-2009], Theorem 1, pp.241–243; proof §2, pp.244–255; [BLGGT v4][blggt-2014-v4], §2.1 Theorem 2.1.1, pp.33–34; §5.1 pp.62–63.

**Prerequisites:** [R24.5, Genuine families from Brauer induction](#target-brauer-induction-system); `AutomorphicGaloisRepresentations:R19.5`; `AutomorphicGaloisRepresentations:R19.4`; `WeightsInEtaleCohomology:R34.6`; `PadicHodgeTheory:R06.3/weil-deligne-descent`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`; `AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

<a id="layer-r24-6"></a>
## R24.6 — Residual members and linked systems


Reduce actual coefficient members on stable lattices, retaining the local and image conditions required by a change-of-prime argument. Distinguish a cofinite rank-two assertion from a general-rank density-one assertion.

<a id="target-residual-members"></a>
### Residual members and their weights

For an E-rational odd irreducible rank-two almost-strict family over ℚ, take stable lattices and semisimplified reductions. Their determinants reduce the characteristic-zero determinants and their complex conjugations remain odd. Absolute irreducibility holds at every embedding above all but finitely many rational primes, using fixed Hodge weights and the uniform conductor bound. If a≠b, the restriction to ℚ(ζ_l) is also absolutely irreducible for all but finitely many l: outside ramification with l>2(a−b)+1, the weight a−b+1 cannot equal either (l+1)/2 or (l+3)/2 forced by the reducible-restriction alternative.

For q≠l the residual Artin conductor divides that of r_q. Finite inertia of order prime to l reduces injectively, preserving its shape, including the dihedral case of order 2t^a with l∤2t. At an odd l outside ramification, the member is crystalline. If the residual member is S-type and **1≤a−b≤l−2**, its normalized Serre weight is a−b+1 after twisting. Equal weights are excluded: an odd absolutely irreducible unramified Artin residual member has normalized weight l, not one. The general-rank regular-system theorem gives the cyclotomic restriction statement for every constituent on a density-one set, rather than this rank-two cofinite conclusion.

**Lean name:** `TauCeti.CompatibleSystems.residual_members`.

**Sources:** [KW I][kw-serre-modularity-I], Proof of Theorem 10.1, p. 20 of the preprint, §8.4, p. 17 of the preprint, Lemma 6.2(ii), p. 11 of the preprint, §1, p. 2 of the preprint; §10.1, p. 20; [Swinnerton-Dyer][swinnerton-dyer-1973], §2, Corollary 1, p. 15; §4, corollary to Theorem 4 and the weight-12 congruences, pp. 31–33; [Dieulefait–Pacetti v2][dieulefait-pacetti], Lemma 1.14, proof, p. 9 of arXiv:2108.07577v2.

**Prerequisites:** [R24.5:operations, Rank-two plain, almost-strict and strict families](#target-compatible-system); `ArithmeticGaloisRepresentations:R01.3`; `ArithmeticGaloisRepresentations:R01.4`; `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`; `AlgebraicModularFormsAndSerreWeights:R15.4`; [R24.5:operations, Density-one residual irreducibility](#target-residual-irreducibility-density-one); [R24.5, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `AlgebraicModularFormsAndSerreWeights:R15.4/fontaine-laffaille-weight-comparison`; `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`.

<a id="target-local-compatibility-at-the-coefficient-prime"></a>
### Local information at the coefficient prime

For an arbitrary KW almost-strict family at its coefficient prime l, use only its residual-irreducible full WD/geometric clause or, for odd l and unramified parameter, its crystalline clause. Otherwise the definition gives no de Rham or WD comparison there. For the motivic Hilbert/Brauer families constructed here, the strict theorem gives potential semistability, common Hodge data and full WD comparison for every l, including l=2 and reducible residual members; an unramified parameter gives crystallinity. Applications of residually reducible de Rham modularity lifting use the theorem of GL2ModularityLifting R32.6.

**Lean name:** `TauCeti.CompatibleSystems.local_compatibility_at_the_coefficient_prime`.

**Sources:** [KW I][kw-serre-modularity-I], §5, p. 8 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Paso 5, p. 14 of the arXiv version.

**Prerequisites:** [R24.5:operations, Rank-two plain, almost-strict and strict families](#target-compatible-system); [R24.5, The historical almost-strict comparison](#target-almost-strict-compatibility); [R24.5, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system); `AutomorphicGaloisRepresentations:R19.5`; `PadicHodgeTheory:R06.3/weil-deligne-descent`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`.

<a id="target-linked-systems-modularity-transfer"></a>
### Links and modularity transfer

If one characteristic-zero member of a rank-two family agrees with the member of a newform f, comparison of the common good Frobenius polynomials and Chebotarev–Brauer–Nesbitt recognition identify every member with f's family after a common coefficient extension. Define a link between two systems at λ by an isomorphism of their selected semisimplified residual members. Given a link to a modular family, apply the imported KW I Theorem 4.1 only after checking its local and image hypotheses: nonsoluble residual image at 2, cyclotomic absolute irreducibility at odd characteristic, and the required local lift type. The systems may have different conductors and weights. The modern residually reducible de Rham transfer is the R32.6 input.

**Lean name:** `TauCeti.CompatibleSystems.linked_systems_modularity_transfer`.

**Sources:** [KW I][kw-serre-modularity-I], §8.2, p. 15 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Remark 4, p. 7 of the arXiv version.

**Prerequisites:** [R24.5:operations, Rank-two plain, almost-strict and strict families](#target-compatible-system); `ArithmeticGaloisRepresentations:R01.5`; [R24.4, The full rational-field lifting theorem](#target-kw-theorem-4-1); `AutomorphicGaloisRepresentations:R19.3`; `GL2ModularityLifting:R32.6/transfer-residually-reducible`; `GL2ModularityLifting:R32.6/transfer-dyadic`; `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`.

## References

Page numbers below follow the indicated edition. BLGGT v1 and v4 have different numbering and pagination: the v4 archimedean formulas and CM constituent statement are used where specified. All mathematical statements above are formulations for this roadmap; citations identify their sources and the relevant hypotheses.

- **[Moret–Bailly II][moret-bailly-1989-II]** — Laurent Moret-Bailly. *Groupes de Picard et problèmes de Skolem II*. Ann. Sci. ENS (4) 22 (1989), 181–194; printed journal pages.

- **[Moret–Bailly I][moret-bailly-1989-I]** — Laurent Moret-Bailly. *Groupes de Picard et problèmes de Skolem I*. Ann. Sci. ENS (4) 22 (1989), 161–179; printed journal pages.

- **[Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur]** — Richard Taylor. *Remarks on a conjecture of Fontaine and Mazur*. Author preprint dated 23 May 2000 of the JIMJ 2002 paper; its printed page numbers, one behind the PDF page index.

- **[KW II][kw-serre-modularity-II]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *Serre's modularity conjecture (II)*. Author proofs.pdf preprint, 98 pages, of Invent. Math. 178 (2009), 505–586; preprint page numbers.

- **[KW Annals][kw-annals-2009]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*. Annals 169 (2009), 229–253; printed journal pages.

- **[Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation]** — Richard Taylor. *On the meromorphic continuation of degree two L-functions*. Documenta Math., Coates volume (2006), 729–779; printed journal pages (PDF page +728).

- **[Qian][qian]** — Lie Qian. *Potential automorphy for GL_n*. Invent. Math. 231 (2023), online-first file; its printed pagination.

- **[CHT][cht]** — Laurent Clozel, Michael Harris, Richard Taylor. *Automorphy for some l-adic lifts of automorphic mod l Galois representations*. Publ. Math. IHES 108 (2008), 1–181; printed journal pages.

- **[BLGHT][blght]** — Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor. *A family of Calabi–Yau varieties and potential automorphy II*. Final author copy (2010) of Publ. RIMS 47 (2011); author pagination.

- **[BHKT v2][bhkt]** — Gebhard Böckle, Michael Harris, Chandrashekhar Khare, Jack Thorne. *G-hat-local systems on smooth projective curves are potentially automorphic*. arXiv:1609.03491v2; author pagination.

- **[Bianchi potential automorphy][bianchi]** — George Boxer, Frank Calegari, Toby Gee, James Newton, Jack Thorne. *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*. arXiv:2309.15880v3, final author version; author pagination.

- **[Boxer–Calegari–Gee–Pilloni][bcgp-published]** — George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. *Abelian surfaces over totally real fields are potentially modular*. Publ. Math. IHES 134 (2021), 153–501; printed journal pages.

- **[Snowden v1][snowden]** — Andrew Snowden. *On two dimensional weight two odd representations of totally real fields*. arXiv:0905.4266v1 (2009); author pagination.

- **[Calegari][calegari]** — Frank Calegari. *Even Galois representations and the Fontaine–Mazur conjecture II*. arXiv:1012.4819, author preprint of JAMS 25 (2012); author pagination.

- **[Thorne][thorne]** — Jack Thorne. *On the automorphy of l-adic Galois representations with small residual image*. Author copy of JIMJ 11 (2012); author pagination.

- **[Calegari–Geraghty][cg]** — Frank Calegari, David Geraghty. *Modularity lifting beyond the Taylor–Wiles method*. Published Invent. Math. 211 (2018) PDF; locators using its PDF page numbers are marked explicitly.

- **[Newton–Thorne][newton-thorne]** — James Newton, Jack Thorne. *Symmetric power functoriality for Hilbert modular forms*. arXiv:2212.03595v2; author pagination.

- **[BHKT][bhkt-published]** — Gebhard Böckle, Michael Harris, Chandrashekhar Khare, Jack Thorne. *Ĝ-local systems on smooth projective curves are potentially automorphic*. Acta Math. 223 (2019), 1–111; printed journal pages.

- **[Beuzart-Plessis–Harris–Thorne][bhkt-correction]** — Raphaël Beuzart-Plessis, Michael Harris, Jack Thorne. *Inductive construction of supercuspidal L-packets*. arXiv:2502.20611v1 (2025), p.28 correction to BHKT Lemma 9.1.

- **[KW I][kw-serre-modularity-I]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *Serre's modularity conjecture (I)*. Author results.pdf preprint of Invent. Math. 178 (2009), 485–504; preprint page numbers.

- **[Böckle][bockle-appendix-2003]** — Gebhard Böckle. *Appendix 1: On the isomorphism R_∅ → T_∅*. Author appendix to Khare, Invent. Math. 154 (2003); own pages 1–6.

- **[Dieulefait–Pacetti v2][dieulefait-pacetti]** — Luis Victor Dieulefait and Ariel Martín Pacetti. *A simplified proof of Serre's conjecture*. arXiv:2108.07577v2 (2022); arXiv page numbers.

- **[Snowden v1][snowden-2009]** — Andrew Snowden. *On two dimensional weight two odd representations of totally real fields*. arXiv:0905.4266v1 (2009); author pagination.

- **[BLGGT v1][blggt-2014]** — Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. *Potential automorphy and change of weight*. arXiv:1010.2561v1 (2010), 68 pages; v1 pagination and numbering.

- **[BLGGT v4][blggt-2014-v4]** — Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. *Potential automorphy and change of weight*. arXiv:1010.2561v4 (2013), 93 pages; v4 pagination and numbering.

- **[Skinner][skinner-2009]** — Christopher Skinner. *A note on the p-adic Galois representations attached to Hilbert modular forms*. Documenta Math. 14 (2009), 241–258; printed journal pages.

- **[ACC+][acc-2023]** — Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne. *Potential automorphy over CM fields*. Annals 197 (2023), 897–1113; published journal-layout copy and printed pages.

- **[Khare, level one][khare-level-one]** — Chandrashekhar Khare. *Serre’s modularity conjecture: the level one case*. arXiv:math/0504080v1 (2005); §3 Proposition 3.1 is the Brauer argument cited as Theorem 5.1 in the Duke 2006 version.

- **[Dieulefait, families][dieulefait-2004]** — Luis V. Dieulefait. *Existence of families of Galois representations and new cases of the Fontaine-Mazur conjecture*. arXiv:math/0304433v1 (2003), of the J. reine angew. Math. 577 (2004) paper; preprint pages.

- **[Swinnerton-Dyer][swinnerton-dyer-1973]** — H. P. F. Swinnerton-Dyer. *On ℓ-adic representations and congruences for coefficients of modular forms*. Modular functions of one variable III, LNM 350 (1973), 1–55; printed chapter pages.

[moret-bailly-1989-II]: https://www.numdam.org/item/10.24033/asens.1582.pdf
[moret-bailly-1989-I]: https://www.numdam.org/item/10.24033/asens.1581.pdf
[taylor-2002-fontaine-mazur]: https://virtualmath1.stanford.edu/~rltaylor/fm.pdf
[kw-serre-modularity-II]: https://www.math.ucla.edu/~shekhar/papers/proofs.pdf
[kw-annals-2009]: https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf
[taylor-2006-meromorphic-continuation]: https://ems.press/content/book-chapter-files/27484
[qian]: https://par.nsf.gov/servlets/purl/10388233
[cht]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf
[blght]: https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf
[bhkt]: https://arxiv.org/pdf/1609.03491v2
[bianchi]: https://arxiv.org/pdf/2309.15880v3
[bcgp-published]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf
[snowden]: https://arxiv.org/pdf/0905.4266v1
[calegari]: https://arxiv.org/pdf/1012.4819
[thorne]: https://www.dpmms.cam.ac.uk/~jat58/bigness.pdf
[cg]: https://math.uchicago.edu/~fcale/papers/CG.pdf
[newton-thorne]: https://arxiv.org/pdf/2212.03595v2
[bhkt-published]: https://intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf
[bhkt-correction]: https://arxiv.org/pdf/2502.20611v1
[kw-serre-modularity-I]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[bockle-appendix-2003]: https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf
[dieulefait-pacetti]: https://arxiv.org/pdf/2108.07577v2
[snowden-2009]: https://arxiv.org/pdf/0905.4266v1
[blggt-2014]: https://arxiv.org/pdf/1010.2561v1
[blggt-2014-v4]: https://arxiv.org/pdf/1010.2561v4
[skinner-2009]: https://ems.press/content/serial-article-files/26055?nt=1
[acc-2023]: https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf
[khare-level-one]: https://arxiv.org/pdf/math/0504080v1
[dieulefait-2004]: https://arxiv.org/pdf/math/0304433v1
[swinnerton-dyer-1973]: http://gaetan.chenevier.perso.math.cnrs.fr/GT/swinnerton_dyer.pdf
