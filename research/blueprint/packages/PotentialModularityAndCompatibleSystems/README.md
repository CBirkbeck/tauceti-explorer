# Roadmap: potential modularity and compatible systems

**Summary.** This roadmap builds the field-selection and compatible-family machinery that turns residual modularity into global lifts and transports modularity between coefficient primes. Its geometric core is Moret–Bailly's integral-point theorem with local splitting, completion and avoidance conditions. Its arithmetic core separates residual modular witnesses, finiteness of a global deformation ring, extraction of a characteristic-zero point, modularity of a given lift and construction of a family through that lift. The resulting interfaces support the Khare–Wintenberger proof of Serre's conjecture and the potential-automorphy arguments that use compatible systems of higher rank. The auxiliary modularity is proved through Skinner–Wiles level adjustment, Taylor's crystalline lifting theorem and soluble descent, and the ordinary finiteness applications rest on a rank-two ordinary R=T on definite unitary groups planned here.

The generic family objects and their operations are developed independently of potential modularity. They contain actual continuous semisimple representations at coefficient places, common Frobenius polynomials and labeled Hodge data. Automorphic and geometric families then instantiate those objects. In rank two, keep the Khare–Wintenberger local compatibility conditions separate from the BLGGT conditions: an assertion away from the coefficient characteristic cannot replace an assertion at that characteristic.

The endpoints are controlled residual potential modularity, potential modularity of given lifts with the specified local types, finite unframed global rings, lifts of the four required Khare–Wintenberger types, and compatible families through those lifts. Higher-rank systems, monodromy, density-one residual irreducibility, polarized operations and their L-functions are included as reusable infrastructure. General regular de Rham potential modularity, full modularity-lifting theorems and the global proof of Serre's conjecture have their own owners.

## Scope and ownership

A prerequisite written `Roadmap:Layer/target` denotes that owner's mathematical interface. A reference to a target in this document names the relevant layer and links to its statement. Inputs from the following owners are used with their full hypotheses; their constructions are not repeated here.

| Owner | Interface used here |
| --- | --- |
| SchemeAndStackFoundations SF.1–SF.4; AlgebraicModuliForArithmeticGeometry R09.3 and §7.3; ReductiveGroupsPartII RG2.0.1, RG2.0a.2 | Smooth and geometrically connected schemes, finite étale torsors, Chow's lemma and smooth hyperplane sections, relative Cartier divisors, curve cohomology and Abel maps (SF.1–SF.4); effective descent and Weil restriction (R09.3); relative Picard sheaves and their representability (§7.3); the topology on local points of schemes, openness of smooth maps on them, and smoothness and points of Weil restrictions (RG2.0.1, RG2.0a.2) |
| AbelianSchemesAndArithmeticModuli A6; HilbertModularVarietiesAndShimuraCurves H2.2, H2.6, H6, R18.3 | Integral Hilbert models at good primes, openness of the ordinary locus, definite quaternionic class sets and pairings, representable twisted Hilbert moduli, descended geometrically connected components, torsion identifications respecting pairings, local points and Weil restriction |
| GlobalNumberFields Layers 9–10; ClassFieldTheory Layers 7, 11–12; AutomorphicGaloisRepresentationsPartII AG2.0; AutomorphicGaloisRepresentations §3.13 | Algebraic Hecke characters, units and approximation, local and global reciprocity, the l-adic character of an algebraic Hecke character (AG2.0) and the converse for geometric characters (§3.13); Chebotarev supplies the prime-selection results |
| ArithmeticGaloisRepresentations R01.1–R01.5/G7; PadicHodgeTheory R06.2–R06.4; LocalGaloisDeformationRings R08.2/R08.6/L7/L8 | Continuous arithmetic representations and their operations, local Euler and ε-factors, finite residual image, stable lattices, polarized representations with their multipliers and signs (§7.4), Zariski closures of one representation (§7.6), adequacy, local WD and Hodge comparisons, Fontaine–Laffaille and ordinary local deformation rings |
| GlobalGaloisDeformations R04.2–R04.6, G7, §§5.1, 5.7, 6.4, 8.5; DeformationAndDerivedPatchingAlgebra R03.3–R03.6 | Carayol trace theorem, Taylor–Wiles data and primes, polarized deformation problems, finiteness of restriction, global local-condition rings, framed/unframed comparison, presentations and finite-image criteria, finite-flat complete intersections and characteristic-zero integral points |
| GL2AutomorphicRepresentationsAndTransfer R16.1, R17.3–R17.6 | Finite Hecke characters with prescribed local components, Jacquet–Langlands, soluble base change and descent, quadratic automorphic induction and potential-modularity interfaces, with invariance and cuspidality conditions |
| WeightsInEtaleCohomology; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3, R07.5 | The Riemann hypothesis for curves over finite fields and the Lefschetz trace formula (2.11); Fontaine–Laffaille filtered modules and their torsion functor (4.3); Savitt's residual types (12.4) |
| AutomorphicGaloisRepresentations R19.2–R19.6, §3.13, §7.1 | The compatible-system carrier with its weak, strict and almost-strict predicates and operations (§7.1), geometric characters (§3.13), Galois realizations of Hilbert forms and of quaternionic Hecke algebras (§6.10), common-coefficient eigenform families, away-coefficient comparison and the full Skinner coefficient-prime theorem |
| OrdinaryAutomorphicFormsAndModularityLifting §§1.4–2.10, R21.2, R21.6; PadicFamilies L0a/L5 | The definite-quaternion pairing, traces and Ihara lemmas behind level adjustment; Hilbert ordinary weight change and ordinary lifts; ordinary projectors and Hida control |
| GL2ModularityLifting R22.1, R22.4–R22.6 and R32.6 | Allowable base change (R22.1), integral R=T for smooth local conditions (R22.4), full odd-prime and dyadic KW lifting, and the modern residually reducible de Rham transfer |
| NeronModelsAndSemistableAbelianVarieties §§5.1, 5.3; ShimuraVarieties §§5.3–5.10 | Néron–Ogg–Shafarevich and the crystalline comparison for good reduction; CM abelian varieties, their models and the main theorem of complex multiplication |
| InverseGaloisAndArithmeticFundamentalGroups IG.1–IG.2; GL2AutomorphicRepresentationsAndTransfer R16.1; SerreWeightAndLevelOptimisation §6.6; EndoscopicTransferAndUnitaryTraceComparison §6.29; AutomorphicFormsOnReductiveGroups AF.4–AF.5 | Étale fundamental groups and specialization of finite quotients; finite Hecke characters with prescribed local components; the Khare–Wintenberger optimisation field; Labesse's base change and descent for unitary groups; algebraic modular forms on groups compact at infinity |

Layer 1 builds on the compatible-system carrier of AutomorphicGaloisRepresentations §7.1: `CompatibleSystemData` with its weak, strict and almost-strict predicates and the operations of coefficient extension, direct sum, dual, tensor product, algebraic-character twist, finite restriction and conjugation. It also builds on the polarized representations of ArithmeticGaloisRepresentations §7.4 and on the algebraic Hecke characters of AutomorphicGaloisRepresentationsPartII AG2.0 and AutomorphicGaloisRepresentations §3.13. It adds what those do not contain: the Khare–Wintenberger rank-two predicates, very weak and extremely weak data, induction and symmetric and exterior powers of families, polarized families, regularity and purity, Artin and character families, L-functions, the arithmetic representation ring, monodromy and density-one irreducibility. It takes no eigenform or potential-modularity theorem as a premise. The construction of an eigenform family belongs to R19; proving that a supplied lift becomes automorphic belongs to Layer 5; assembling its descended family belongs to Layer 12.

The current Tau Ceti library supplies line-bundle classes and their tensor group, arbitrary-morphism rigidified line bundles, their isomorphism classes, pullback, forgetting and the global-unit criterion for equality. AlgebraicVectorBundles Layer 0 supplies geometric tensor/dual infrastructure, and JacobianChallenge Layer D supplies the ordinary relative Picard functor. Layer 2 uses these objects for a finite flat boundary and adds the relative group-sheaf, representability, degree and divisor-fibration results. LocalGaloisGroups' tame frame and ProfiniteArithmetic supply local Galois and profinite primitives; Completed RestrictedProducts supplies the adelic carrier. Those objects are imported. The current library's `HeckeCharacter/Purity.lean` supplies the purity of infinity types of algebraic Hecke characters. RepresentationTheory/InductionRestriction Layer 6 owns finite-group virtual characters and Brauer induction. Here the additional ring is for continuous, finitely ramified representations of the infinite arithmetic group G_F, with arithmetic induction and local Euler factors.

Layer 8 plans the rank-two ordinary theory on definite unitary groups in two variables (ordinary Hecke algebras, ordinary R=T for adequate residual image, ordinary automorphy lifting and finiteness) that the ordinary finiteness and Newton–Thorne applications use; the n-dimensional versions belong to PotentialAutomorphyInfrastructurePartII. The level adjustment of Skinner–Wiles and Taylor's crystalline lifting theorem, used for the auxiliary modularity in Layer 4, are planned here as well.

## Conventions

Fix algebraic closures and the compatible embeddings needed to compare local groups. Write G_F for the absolute Galois group with its Krull topology. Every arithmetic representation is continuous; an algebraic representation by itself does not include that condition. A residual representation is the semisimplification of reduction of a stable lattice, with independence up to isomorphism. Absolute irreducibility includes coefficient extension. S-type means a continuous, odd, absolutely irreducible two-dimensional representation over a finite field of characteristic p, as in KW I §1, p. 2. Normalized Serre weights are supplied by AlgebraicModularFormsAndSerreWeights R15.4 and are at least two. The residual prime of the starting representation is p; l is the residue characteristic of a system's coefficient place λ; q or v denotes a place of its base field. In Taylor's auxiliary ordinary construction l is the starting prime and p is a distinct auxiliary prime.

For the KW rank-two endpoints use their arithmetic-Frobenius and Hodge–Tate normalization, HT(ε)=+1. For the BLGGT generic carrier use geometric Frobenius and HT(ε)=−1. Thus the geometric cyclotomic system has good polynomial X−q_v⁻¹ and pure weight −2. A weight-k newform has cohomological geometric data H={0,k−1}, Q_v=X²−a_vX+q_v^(k−1); the KW arithmetic member is its contragredient with KW's Hodge convention. State the dualization and reciprocity comparison when moving between carriers. A common coefficient field is a number field, and Frobenius comparisons are made after its embeddings into the respective local algebraic closures, never by directly equating values in unrelated l-adic fields.

Weil–Deligne comparison means Frobenius semisimplification; it retains the monodromy operator N. Unramified WD data mean trivial inertia and N=0. For de Rham members this condition implies crystallinity at the coefficient prime through R06.3. Inertial type alone forgets N and does not certify a local lift with a prescribed determinant. The global rings used in finiteness and point extraction are unframed, with fixed determinant; their framed formal power-series enlargements have a different finiteness behavior.

A Skolem point must satisfy every local embedding condition. Splitting after tensoring with L_v means a product of copies of L_v as an L_v-algebra. It is weaker than prescribing each completion to be L_v. A prescribed-completion theorem is identified explicitly when that stronger conclusion is needed. Galois closure and avoidance are tracked throughout; an intersection computation cannot replace the tensor definition of disjointness without its finite Galois hypotheses.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use the following library primitives at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- `IntermediateField.LinearDisjoint` supplies tensor-based field disjointness. `LinearDisjoint.inf_eq_bot` gives trivial intersection; `LinearDisjoint.iff_inf_eq_bot` has finite-dimensional hypotheses on both fields and a Galois hypothesis on the left one.
- `AlgebraicGeometry.Spec` and `Scheme.Modules.pullback` supply scheme points and restriction of module sheaves. Tau Ceti's `InvertibleSheaf` and `InvertibleSheaf.trivial` supply the line bundles and trivial bundle. `LineBundleClass.mk_eq_mk_iff` recognizes equality of unrigidified classes by a sheaf isomorphism. Layer 2 adds the relative curve construction over the current library’s rigidified line-bundle classes. The latter are cited below as current-library prerequisites, without private substitutes in Suggested.lean.
- `NumberField.Chebotarev.frobeniusPrimeSet` defines the set of unramified primes of an Artin conjugacy class. Prime existence and density are theorems of the Chebotarev roadmap.
- `Field.absoluteGaloisGroup`, `Representation`, `Representation.IsSemisimpleRepresentation`, `Representation.IsIrreducible` and `Representation.dual` provide the Krull-topological Galois group and algebraic representation interfaces. Continuity, finite ramification and absolute irreducibility are additional arithmetic conditions. `NumberField.FinitePlace` and `FinitePlace.embedding` provide coefficient places and completion embeddings. `LinearMap.charpoly` applies to finite free modules.
- `Representation.ind` and `Rep.indResAdjunction` give algebraic induction and its restriction adjunction for groups over a commutative ring. Arithmetic continuity and finite-dimensionality are supplied by R01.1/G7. `Finsupp` gives an additive irreducible-multiplicity lattice; tensor product needs its own structure constants.
- `MvPowerSeries`, `IsLocalRing`, `IsDiscreteValuationRing`, `IsAdicComplete`, `ringKrullDim`, `RingTheory.Sequence.IsRegular` and `Module.Flat` are the commutative-algebra vocabulary. Regularity includes a nonzero final quotient, and a DVR is not a field. The regular-local and Cohen–Macaulay algebra comes from R03.3; point extraction comes from R03.4.
- `Complex.Gammaℝ`, `Complex.Gammaℂ` and `Complex.Gammaℝ_mul_Gammaℝ_add_one` give the real and complex archimedean factors and their duplication identity.
- `NumberField.InfinitePlace.Completion` and `HeightOneSpectrum.adicCompletion` give the completion `K_v` at every place, `IsModuleTopology` the canonical topology on a finite extension of `K_v`, and `IntermediateField.LinearDisjoint`, `algebraicClosure` and `IntermediateField.extendScalars` the field-theoretic conditions. `Field.absoluteGaloisGroup.map` restricts Galois representations along field embeddings, `cyclotomicCharacter` and `PadicAlgCl` give the `p`-adic cyclotomic character and `ℚ̄_p`, and `NumberField.IsTotallyReal`, `NumberField.IsCMField` and `NumberField.Set.HasDirichletDensity` the field and density conditions.
- `AlgebraicGeometry.IsSeparated`, `LocallyOfFiniteType`, `QuasiCompact`, `GeometricallyIrreducible`, `Surjective`, `Smooth`, `GeometricallyConnected`, `GeometricallyIntegral`, `IsOpenImmersion`, `IsClosedImmersion`, `AffineSpace` and `topologicalKrullDim` give the scheme-theoretic conditions on Skolem data and their reductions; finite type requires both local finite type and quasi-compactness.

### From the arithmetic roadmaps

The owner table in Scope and ownership gives the imported layers. Consume their actual arithmetic objects: continuous representations with coefficient embeddings and places; Weil–Deligne parameters with monodromy; labeled de Rham and crystalline comparisons; representable Hilbert moduli with their smooth, geometrically connected components; fixed-determinant unframed deformation rings and their point-to-lift equivalence. In particular, a coefficient realization uses a chosen algebraic closure of the relevant completion, not an arbitrary field. Changing coefficients requires the restriction of places and continuous completion embeddings. A monodromy datum is computed from the Zariski closures of the supplied system's images, rather than a collection of unrelated abstract groups and integer functions.

Use `TauCetiRoadmap.PotentialModularityAndCompatibleSystems` for the names below. The README states the complete mathematics. [Suggested.lean](Suggested.lean) gives representative signatures expressible using the pinned declarations; further constructions require the supplier APIs specified at their targets.

## How to read the build

Layer 1 builds compatible-system infrastructure independently of potential modularity. Layers 2–7 select fields, construct the auxiliary moduli points, prove the auxiliary modularity by level adjustment, crystalline lifting and descent, prove residual and given-lift potential modularity and record their exports. Layers 8–11 establish ring finiteness, including the rank-two ordinary R=T on definite unitary groups and its finiteness theorem, extract points and apply the lifting theorems. Layers 12–13 assemble and compare the resulting families. Within a layer, prerequisites precede their consumers; each construction lists its sources and exact needs.

<a id="layer-r24-5-operations"></a>
## Layer 1: Compatible-family infrastructure


Construct the carrier and its arithmetic operations before invoking any automorphic-family existence theorem. Character and Artin families give basic examples. Monodromy and density-one results use this same carrier, together with the reductive-group and local arithmetic inputs listed at each target.

<a id="target-weakly-compatible-system-rank-n"></a>
### 1.1 Weakly compatible families of arbitrary rank

Fix number fields F,M and rank n. A weakly compatible system is an element of the carrier `CompatibleSystemData` of AutomorphicGaloisRepresentations §7.1 satisfying its predicate `IsWeaklyCompatible`: a finite exceptional set S, monic Q_v∈M[X] of degree n for v∉S, continuous semisimple r_λ:G_F→GL_n(M̄_λ) at every finite place λ of M, and n-element Hodge multisets H_τ for every τ:F↪M̄, such that at λ of residue characteristic l and v∉S with v∤l the member is unramified with geometric-Frobenius characteristic polynomial ι_λ(Q_v), at every v|l it is de Rham, and crystalline if v∉S, and every coefficient embedding extending λ identifies the labeled Hodge multiset with H_τ. That carrier and predicate are imported; this target adds the comparisons with the other definitions this roadmap uses.

These are data and axioms of the carrier, including the actual representations; common traces alone are insufficient. Taylor's rank-d contract over ℚ asks instead for fixed Hodge–Tate weights at all λ and crystallinity outside S, without separately requiring de Rham behavior at exceptional coefficient primes. The KW rank-two carrier also contains all-place WD parameters. Its comparison with this weak carrier therefore checks the additional all-member de Rham and outside-S crystalline conditions.

The construction has the following API:

- `WeaklyCompatibleSystem`: the elements of `CompatibleSystemData` (AutomorphicGaloisRepresentations §7.1) satisfying `IsWeaklyCompatible`.
- `WeaklyCompatibleSystem.rank`: The rank n.
- `WeaklyCompatibleSystem.charpoly_frob`: For v ∉ S, v ∤ l: r_λ unramified at v with charpoly r_λ(Frob_v) = Q_v.
- `WeaklyCompatibleSystem.deRham`: r_λ|_{G_{F_v}} de Rham for v | l, crystalline for v ∉ S.
- `WeaklyCompatibleSystem.ofCompatibleSystem`: Convert a rank-two KW system only with additional hypotheses: every coefficient member is de Rham of the common weights at every place above ℓ and crystalline outside an enlarged fixed finite S. Plain or almost strict compatibility alone does not imply these.
- `WeaklyCompatibleSystem.enlargeRamificationSet`: For finite S⊆S′, keep every r_λ and H_τ, restrict Q_v to v∉S′, obtaining a weakly compatible system.

**Checks.**

- `wcs_cyclotomic`: With geometric Frobenius and HT(ε_ℓ)=−1, ε has rank 1, S=∅, Q_p(X)=X−p⁻¹, H={−1} and weight −2. X−p would be the arithmetic-Frobenius polynomial.
- `wcs_newform_delta`: Use the cohomological member of the Δ family in BLGGT convention: rank 2, H={0,11}, Q_p(X)=X²−τ(p)X+p¹¹; Q₂=X²+24X+2048. The KW arithmetic member is its contragredient, with their HT(ε)=+1 convention.
- `wcs_not_just_traces`: Two systems with the same Q_v are isomorphic member by member only up to conjugation; the carrier stores the r_λ themselves.
- `wcs_S_enlarge`: Enlarging S gives an equivalent system (fewer polynomials, same representations).

Use `WeaklyCompatibleSystem` for this construction.

The sources are [BLGGT v1][blggt-2014], §5.1, definition of a weakly compatible system, p. 51 (arXiv v1; printed page = PDF page); [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, rank d weakly compatible systems over ℚ, p. 773 (PDF page 45).

*Needs:* `AutomorphicGaloisRepresentations` §7.1 (`CompatibleSystemData`, `IsWeaklyCompatible`); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `PadicHodgeTheory:R06.2`; `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`; `mathlib:LinearMap.charpoly`; `mathlib:NumberField.FinitePlace`; `mathlib:NumberField.FinitePlace.embedding`.

<a id="target-compatible-system"></a>
### 1.2 Rank-two plain, almost-strict and strict families

For number fields F and E, define a rank-two E-rational family with continuous semisimple ρ_ι for every prime l and embedding ι:E↪Q̄_l, a Frobenius-semisimple WD parameter r_q over E at each finite q, unramified except at finitely many q, and fixed integers a≥b. Plain compatibility compares WD parameters whenever q∤l and requires crystallinity of weights (a,b) at coefficient places for sufficiently large l.

KW strictness requires every member to be geometric of these weights and compares WD(ρ_ι|D_q)^Fss with ιr_q at **every** q, using Fontaine's construction when q|l. KW almost strictness adds to plain compatibility two coefficient-prime clauses: full geometric/WD comparison when the semisimplified residual member is irreducible; and, for l≠2 and unramified r_q, crystallinity of the common weights. It imposes no further coefficient-prime comparison in the residually reducible ramified case. Regularity means a≠b. Plain and KW almost-strict carriers need not be de Rham at every member.

Dieulefait–Pacetti use a different almost-strict contract: every member is de Rham at its coefficient prime. Compare their five-tuple only after identifying coefficient embeddings and normalizations. Keep this additional condition explicit when translating between the two definitions.

AutomorphicGaloisRepresentations §7.1 defines on `CompatibleSystemData` the all-place strict predicate `IsStrictlyCompatible` and the Dieulefait–Pacetti almost-strict predicate `IsAlmostStrictlyCompatible`, which at an odd coefficient prime with unramified common parameter still requires the full comparison. Use them. The Khare–Wintenberger family here is the rank-two specialization of that carrier indexed by embeddings ι with fixed integer weights a≥b; KW strictness is AGR's strict predicate for it, and KW almost strictness, which at such a prime asks only for crystallinity of the common weights, is the separate predicate below.

The construction has the following API:

- `CompatibleSystem`: E, the family ρ_ι, the Weil–Deligne data r_𝔮 and the weights (a, b)
- `CompatibleSystem.IsStrict`: compatibility with r_𝔮 at every 𝔮, including 𝔮 above ℓ; it is `IsStrictlyCompatible` of AutomorphicGaloisRepresentations §7.1 for the underlying data
- `CompatibleSystem.IsAlmostStrict`: the two conditions at 𝔮 | ℓ (irreducible residual, or ℓ ≠ 2 and r_𝔮 unramified)
- `CompatibleSystem.IsRegular`: a ≠ b
- `CompatibleSystem.IsStrict.isAlmostStrict`: strict ⇒ almost strict ⇒ compatible
- `CompatibleSystem.enlargeCoefficients`: Extend E to a finite number-field extension E′ and reindex embeddings; preserve the same members and local data after extension. Eigenform constructors are imported from R19.3 and are not defined here.

**Checks.**

- `newform_is_strict`: Import the Δ eigenform family from R19.3: weights (11,0), regular and strict after the complete coefficient-prime theorem from R19.5.
- `weight_one_irregular`: a weight-one newform gives an irregular system, a = b = 0
- `almost_strict_not_strict`: The almost-strict axioms supply no WD comparison in the residually reducible ramified coefficient-prime case; this tests the scope of the axioms, not failure of the constructed geometric families.
- `hodge_tate_weights_convention`: weight a + 1 when b = 0: a newform of weight k gives (a, b) = (k − 1, 0)

Use `CompatibleSystem` for this construction.

The sources are [KW I][kw-serre-modularity-I], §5, p. 7 of the preprint, §5, p. 8 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Definition 1.10 and after, p. 7 of the arXiv version.

*Needs:* `AutomorphicGaloisRepresentations` §7.1 (`IsStrictlyCompatible`, `IsAlmostStrictlyCompatible`); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.2`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`.

<a id="target-weakened-compatible-data"></a>
### 1.3 Very weak and extremely weak families

Extremely weak data retain the number fields, finite exceptional set, actual continuous semisimple members and common monic good Frobenius polynomials of a weak system, but impose only HT_τ(det r_λ)=ΣH_τ at every λ. They require no full-member Hodge or de Rham comparison. Very weak data additionally require crystallinity at all places above l and the full Hodge multisets for l outside a Dirichlet-density-zero set. A weak system is very weak, and a very weak system is extremely weak.

In rank one the determinant condition recovers the full Hodge condition, and character classification gives weak compatibility. In higher rank it controls only the sum of the Hodge entries. Accordingly, induction and Artin-twist purity use the canonical transported Hodge data rather than arbitrary multisets with the same sum.

The construction has the following API:

- `ExtremelyWeaklyCompatibleSystem`: The common Q, members and H with determinant-Hodge condition only.
- `VeryWeaklyCompatibleSystem`: Extremely weak data with density-one crystallinity and full labeled Hodge comparisons.
- `WeaklyCompatibleSystem.toVeryWeak`: Forget the all-λ de Rham/full Hodge requirement to the density-one one.
- `VeryWeaklyCompatibleSystem.toExtremelyWeak`: Forget the density-one full-member condition, retaining determinant Hodge comparison.
- `ExtremelyWeaklyCompatibleSystem.hodgeSum`: At every λ, the determinant labeled Hodge number equals Σ H_τ.

**Checks.**

- `weakening_rank_one`: A rank-one H_τ={a} is determined by its determinant Hodge sum a.
- `weakening_higher_rank_metadata`: Rank-two H={0,2} and H′={1,1} have the same determinant sum 2; the determinant condition distinguishes neither the Hodge multiset itself nor regularity.
- `weakening_hodge_purity_not_sum`: For a weight-zero rank-two Artin family, H_τ={−1,1} and H_cτ={0,0} have the correct zero determinant sums but fail H_cτ=−H_τ. Thus extremely weak Hodge metadata need not satisfy purity.
- `weakening_transitive`: The composite weak→very weak→extremely weak map preserves each r_λ, Q_v and H_τ.

Use `ExtremelyWeaklyCompatibleSystem` for this construction.

The sources are [ACC+][acc-2023], §7.1, pp.1084–1085.

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `PadicHodgeTheory:R06.2`.

<a id="target-system-operations"></a>
### 1.4 Twisting, restriction and induction

Twists by algebraic-character families, restrictions to finite base-field extensions, coefficient extension and conjugation are the operations of AutomorphicGaloisRepresentations §7.1, with its transport of the weak and strict predicates and its rank-two almost-strict transport rule; import them. Construct here the induction from a finite extension, applying representation, WD and Hodge operations together. Enlarge S by ramification of the extension for induction, and at each local place use the sum of locally induced WD parameters. At a place above the coefficient prime this requires that D_pst of an induced representation is the induced Weil–Deligne representation; prove it here from the compatibility of Fontaine's functor with restriction and the Mackey description of induction. Plain compatibility is preserved; all-place strictness is preserved for the de Rham input systems using the local operations of R06.3.

For an almost-strict system the unconditional output is plain. Retaining almost strictness requires checking every newly irreducible residual output against the source's coefficient-prime comparison cases and every unramified coefficient-prime output for crystallinity. A strict character twist preserves the residual irreducibility test in rank two; restriction or induction can change it. A virtual Brauer combination is still a class in a representation ring until genuineness is proved.

The construction has the following API:

- `twist`: Memberwise tensor with a strict character system; local WD tensor and Hodge shifts.
- `restrict`: Restrict to G_F′; Q roots raised to residue degrees and H_τ pulled back.
- `induce`: For finite F′/F induce each member, rank multiplied by [F′:F], enlarge S by ramified primes, local WD induction and Hodge multiset union.
- `restrict_charpoly`: At w|v outside S, roots of Q_w are α^[k(w):k(v)] for roots α of Q_v.
- `induce_rank`: Rank Ind_F′^F ℛ=[F′:F] rank ℛ; induction need not preserve regularity or irreducibility.

**Checks.**

- `twist_cyclotomic`: Twisting by ε shifts each BLGGT Hodge number by −1 and pure weight by −2.
- `restrict_trivial_extension`: For F′=F restriction returns the same members, Q and H.
- `induce_quadratic_trivial`: Induce the trivial character across a quadratic extension: rank 2, H={0,0}, polynomial (X−1)² at split good primes and X²−1 at inert good primes.
- `induced_regular_nonexample`: The induced quadratic trivial character is a sum of trivial and quadratic characters and is not regular; generic induction is not an irreducibility theorem.

Use `twist` for this construction.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93 of the preprint.

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); `AutomorphicGaloisRepresentations` §7.1 (`twist`, `restrict`, `coefficientExtension`, `conjugate`); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`; `PadicHodgeTheory:R06.2` (induction and restriction of scalars); `ArithmeticGaloisRepresentations:R01.2`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `mathlib:Representation.ind`; `mathlib:Representation.dual`.

<a id="target-polarized-system"></a>
### 1.5 Polarized weakly compatible families

For CM F/F⁺ and a weak system ℛ, take a rank-one multiplier system ℳ of G_(F⁺) over the same coefficient field, with ramification below that of ℛ. A polarization includes, for every λ and real place v, an actual perfect pairing B with B(x,y)=ε_vB(y,x), B(r_λ(g)x,r_λ(c_vgc_v)y)=μ_λ(g)B(x,y), and ε_v=−μ_λ(c_v). Total oddness means ε_v=+1 at every real place. Forgetting the pairing gives essential conjugate self-duality, not a polarization witness. For totally real fields use the orthogonal/symplectic convention of BLGGT §2.1 instead of imposing the CM sign equation without a CM extension. The representation-level pairing, multiplier, sign and total oddness are those of ArithmeticGaloisRepresentations §7.4 (`PolarizedRep`); this target assembles them over a family.

The construction has the following API:

- `PolarizedSystem`: Pair ℛ,ℳ with an actual polarization witness at every λ.
- `PolarizedSystem.multiplier`: The rank-one character system ℳ of G_F⁺, including μ(c_v).
- `PolarizedSystem.pairing`: The perfect representation-level pairing from G7, for each λ and real place v.
- `PolarizedSystem.IsTotallyOdd`: All pairing signs ε_v are +1; for CM this requires μ(c_v)=−1.
- `PolarizedSystem.conjugateDual`: Each r_λ^c is isomorphic to r_λ∨⊗μ_λ|G_F, with the specified pairing.

**Checks.**

- `polarized_cm_unit`: The trivial rank-one system on G_F has a symmetric pairing and CM multiplier δ_F/F⁺, with μ(c_v)=−1; multiplier 1 has the wrong BLGGT sign.
- `polarized_rank_two`: For the cohomological elliptic family over a CM field, use the rank-two duality pairing with the properly normalized multiplier and its real-place sign; total oddness is tested on the actual conjugate pairing, not only det on G_F.
- `polarized_multiplier_wrong`: Changing μ(c_v) while retaining the same pairing reverses the required CM equation ε_v=−μ(c_v).
- `polarized_forget_pairing`: Forgetting the perfect signed pairing gives r^c≅r∨⊗μ; an isomorphism alone does not determine a correctly signed polarization.

Use `PolarizedSystem` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], §2.1, p.31; §5.1, p.62.

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:G7` (§7.4, `PolarizedRep`, `IsTotallyOdd`).

<a id="target-compatible-system-predicates"></a>
### 1.6 Regularity, purity, strictness and automorphy

Define the following predicates separately on a weak system ℛ=(M,S,Q,r,H). Regular means every H_τ has distinct entries. Extremely regular additionally means that, for some τ, distinct submultisets of the same cardinality have different sums. For rank-one systems over totally real fields, total oddness means r_λ(c_v)=−1. Essential conjugate self-duality is expressed using a character system ℳ of G_(F⁺) and representation-level comparisons; total odd essential conjugate self-duality uses their signed pairing convention.

Irreducibility means irreducibility at every λ over a set of rational primes of Dirichlet density one. BLGGT strict compatibility supplies a WD_v over M̄ with Frobenius-semisimple comparison at all λ **away from the residue characteristic of v**. Purity of weight w requires |ια|²=q_v^w for every good Frobenius root and H_(cτ)={w−h:h∈H_τ}. Strict purity additionally requires every local WD_v pure of weight w, including its monodromy filtration. Automorphy requires a regular algebraic cuspidal π of GL_n(A_F) whose normalized rec(π_v|det|^((1−n)/2)) has the specified good polynomial.

Taylor's strong compatibility over ℚ corresponds to this away-coefficient strictness; his rank-two regularity also includes odd determinant. The CM system convention and its totally real pairing variant must use their respective representation-level definitions. Neither this strictness nor purity upgrades to KW all-place strictness without a coefficient-prime theorem.

The construction has the following API:

- `WeaklyCompatibleSystem.IsRegular`: Distinct Hodge–Tate numbers for every τ.
- `WeaklyCompatibleSystem.IsExtremelyRegular`: Regular, and some H_τ has no distinct equal-cardinality submultisets with the same sum.
- `WeaklyCompatibleSystem.IsStrictlyCompatible`: A Weil–Deligne representation WD_v(ℛ) matching every r_λ at v, λ ∤ residue characteristic of v.
- `WeaklyCompatibleSystem.IsPure`: Weight-w purity of the Q_v and the symmetry H_{cτ} = w − H_τ.
- `WeaklyCompatibleSystem.IsEssentiallySelfDual`: Essential conjugate self-duality with a character system of G_{F⁺}, and its totally odd version.
- `WeaklyCompatibleSystem.IsIrreducible`: Irreducible for λ above a density-one set of primes.
- `WeaklyCompatibleSystem.IsAutomorphic`: Frobenius polynomials of a regular algebraic cuspidal π.

**Checks.**

- `pred_newform`: A newform of weight k ≥ 2 is regular, strictly pure of weight k − 1, irreducible and automorphic.
- `pred_regular_fails`: ε ⊕ ε is not regular (H = {−1, −1}).
- `pred_odd_purity`: For n odd and v real, purity forces w even (BLGGT p. 53).
- `pred_strict_vs_almost_strict`: Check the away-coefficient WD comparison separately from the coefficient-prime conditions. BLGGT strictness has no coefficient-prime WD clause, and KW almost strictness requires additional conditions there.

Use `WeaklyCompatibleSystem.IsRegular` for this construction.

The sources are [BLGGT v1][blggt-2014], §5.1, the subsidiary definitions, p. 51 (arXiv v1; printed page = PDF page), §5.1, strict compatibility and purity, p. 52 (arXiv v1; printed page = PDF page), §5.1, automorphy, p. 53 (arXiv v1; printed page = PDF page); [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, Taylor's remark on motives, p. 773 (PDF page 45).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:G7`; [Layer 1, Polarized weakly compatible families](#target-polarized-system).

<a id="target-linear-algebra-operations-on-systems"></a>
### 1.7 Linear-algebra operations on families

Over a common coefficient field use the direct sums, semisimplified tensor products and contragredients of AutomorphicGaloisRepresentations §7.1, and construct symmetric and exterior powers, using the characteristic-polynomial identities of ArithmeticGaloisRepresentations §7.1. At a good place, sum multiplies the polynomials, tensor multiplies every pair of roots, and the dual polynomial is X^n Q_v(0)⁻¹Q_v(X⁻¹). Symmetric powers use repeated products, exterior powers distinct products. Hodge data are the corresponding disjoint unions, pairwise sums, negatives and repeated/distinct sums.

These operations, restriction and induction preserve weak and away-coefficient strict compatibility with the appropriate enlargement of S. Pure direct sums require equal weights; tensor weights add, duality negates weight, and the k-th powers have weight kw. Restriction and induction preserve weight with their canonical transported Hodge data; local strict purity uses the analogous WD preservation. Duality and restriction preserve regularity. The other operations can create Hodge collisions. Duality preserves irreducibility, while arbitrary sums, tensors, restrictions and inductions need not. Cuspidal automorphy is asserted only through a theorem establishing it for the particular operation.

For the dual characteristic polynomial, define `Factors.dualPolynomial Q=C(Q(0)⁻¹)Q.reverse` only with the intended monic, nonzero-constant domain.

The construction has the following API:

- `directSum`: Members r⊕s; Q_v=Q_r Q_s; H disjoint union; common pure weight required for purity.
- `tensor`: Members (r⊗s)^ss; roots αβ; H all pairwise sums; pure weight w+w′.
- `dual`: Members r∨; normalized reciprocal Q_v; H=−H; pure weight −w.
- `symmetricPower`: Sym^k members and repeated k-fold weight sums; rank binomial(n+k−1,k).
- `exteriorPower`: ∧^k members and distinct k-fold weight sums; rank binomial(n,k), zero if k>n.
- `dual_charpoly`: The normalized reciprocal polynomial is monic of rank n; for rank 2, X²−aX+b becomes X²−(a/b)X+1/b.
- `directSum_pure`: Pure systems of the same weight w have pure direct sum of weight w; differing weights invalidate the conclusion.

**Checks.**

- `dual_polynomial_rank_one`: over ℚ, X−2 becomes X−1/2.
- `dual_polynomial_rank_zero`: the polynomial 1 remains 1.
- `dual_polynomial_singular`: X has zero constant term, and the raw helper returns 0; it is outside the invertible-operator domain.

- `dual_rank_two`: X²−aX+b with b≠0 becomes X²−(a/b)X+1/b.
- `sym2_distinct`: For h₁≠h₂, {2h₁,h₁+h₂,2h₂} is distinct, so Sym² of regular rank two stays regular.
- `tensor_collision`: H={0,1} and H′={0,−1} give tensor H={0,−1,1,0}, which is not regular.
- `direct_sum_mixed_weights`: 1⊕ε has geometric-Frobenius roots 1,p⁻¹ and weights 0,−2, so is not pure of one weight.
- `exterior_above_rank`: ∧³ of a rank-two system is the rank-zero system with Q_v=1 and H empty.

Use `directSum` for this construction.

The sources are [BLGGT v1][blggt-2014], §5.1, operations, p. 51 (arXiv v1; printed page = PDF page), §5.1, restriction, p. 53 (arXiv v1; printed page = PDF page).

*Needs:* [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Twisting, restriction and induction](#target-system-operations); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:G7`; [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `PadicHodgeTheory:R06.2`.

<a id="target-polarized-operations"></a>
### 1.8 Operations with polarization witnesses

Apply the multiplier and sign formulas of ArithmeticGaloisRepresentations §7.4 memberwise. Write δ=δ_(F/F⁺) in the CM setting. Duality has multiplier μ⁻¹ and the same sign. Tensor product has multiplier μμ′δ and sign εε′; the quadratic factor corrects the value at complex conjugation while restricting trivially to G_F. For nonzero k-th symmetric or exterior powers in characteristic zero use sign ε^k and multiplier μ^kδ^(k−1). At k=0 the unit has multiplier δ and sign +1, consistent with the integer exponent in that formula.

Direct sums require the same multiplier and signs. A character twist uses μ times the extension of χχ^c having value +1 at complex conjugation. Restriction requires compatible CM fields and real subfields. Induction requires a specified extension of the multiplier and a check of the induced perfect pairing and sign. Check regularity and irreducibility independently of these pairing constructions.

The construction has the following API:

- `PolarizedSystem.tensor`: Tensor pairings and multiplier μμ′δ; signs multiply.
- `PolarizedSystem.dual`: Dual perfect pairings and inverse multiplier.
- `PolarizedSystem.twist`: Twist by χ with norm-character multiplier correction.
- `PolarizedSystem.power`: Symmetric/exterior k-th pairing with μ^kδ^(k−1) and ε^k.
- `PolarizedSystem.tensor_isTotallyOdd`: Two totally odd CM systems yield a totally odd normalized tensor system.

**Checks.**

- `polarized_tensor_sign`: ε=ε′=+1, μ(c)=μ′(c)=−1: uncorrected product has μμ′(c)=+1; corrected μμ′δ(c)=−1.
- `polarized_dual_sign`: Inverse of a −1 multiplier at c is −1, matching the unchanged +1 sign.
- `polarized_unit_tensor`: The polarized CM unit has μ=δ; tensoring it with (ℛ,μ) gives μδδ=μ.
- `polarized_sum_mismatch`: A block sum of pairings with signs +1 and −1 is neither symmetric nor alternating; there is no common sign without changing the inputs.

Use `PolarizedSystem.tensor` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], §2.1, p.31; §5.1, p.62; tensor-product use in §4.3.

*Needs:* [Layer 1, Polarized weakly compatible families](#target-polarized-system); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); `ArithmeticGaloisRepresentations:G7`.

<a id="target-character-system"></a>
### 1.9 Algebraic character families

Use a type-A₀ algebraic Hecke character χ of F, with a number field M containing its algebraic finite values, to assemble the common-coefficient rank-one family of its l-adic realizations. It is de Rham at every coefficient place and crystalline outside the finite conductor set. If its connected-infinity character is ∏_τ(τx)^(−a_τ), its labeled Hodge multiset is {a_τ}. The good geometric-Frobenius polynomial comes from the common algebraic character value and the fixed reciprocity convention.

Conversely, a finitely ramified de Rham l-adic character is the avatar of such a Hecke character after enlarging the coefficient field. Import Hecke characters and their infinity types from GlobalNumberFields Layers 9–10 and reciprocity from ClassFieldTheory Layer 11, whose arithmetic normalization is composed with inversion for geometric Frobenius. The l-adic character of an algebraic Hecke character, its Hodge–Tate numbers and its weight are AutomorphicGaloisRepresentationsPartII AG2.0 (`AlgHeckeChar.galoisChar`); the converse is AutomorphicGaloisRepresentations §3.13 (`geometricCharacter_isHeckeAvatar`). This target assembles these realizations over one coefficient field into a family.

The construction has the following API:

- `characterSystem`: Assemble the common-field rank-one family from the owner’s algebraic Hecke character realizations.
- `characterSystem_hodge`: H_τ={a_τ} for connected-infinity exponent −a_τ.
- `characterSystem_frob`: The common linear polynomial matches the geometric Frobenius value with the chosen Artin convention.
- `characterSystem_unique`: Unique up to memberwise representation isomorphism from good Frobenius polynomials.

**Checks.**

- `character_trivial`: χ=1 gives Q_v=X−1, H={0}, weight 0.
- `character_cyclotomic`: The algebraic idele norm ||·||_F gives the cyclotomic family in the geometric Artin convention: H={−1}, Q_p=X−p⁻¹, pure weight −2.
- `character_finite_order`: A finite-order Hecke character has H={0}, all good roots roots of unity, and weight 0.
- `character_non_algebraic`: An arbitrary continuous character with nonintegral infinity exponent has no type-A₀ algebraic realization theorem and is not accepted by this constructor.

Use `characterSystem` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], Appendix A.2, p.87, before Lemma A.2.1; [ACC+][acc-2023], §7.1, pp.1085,1092.

*Needs:* `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`; `AutomorphicGaloisRepresentationsPartII:AG2.0` (`AlgHeckeChar.galoisChar`, `hodgeTate_galoisChar`, `AlgHeckeChar.wt`); `AutomorphicGaloisRepresentations` §3.13; [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

<a id="target-rank-one-purity"></a>
### 1.10 Rank-one purity

Every rank-one weak system is pure of some integer weight w, and the same holds for rank-one extremely weak data with their determinant Hodge condition. Character classification (AutomorphicGaloisRepresentations §3.13) gives a single w with a_(cτ)+a_τ=w and |ιr(Frob_v)|²=q_v^w at every good v and complex embedding; the infinity-type identity is the purity of algebraic Hecke characters (`HeckeCharacter/Purity.lean` in the current Tau Ceti library, and GlobalNumberFields Layer 10), and the Galois-side weight is AG2.0's `AlgHeckeChar.wt`. Algebraic Hecke-character theory also supplies pure local WD parameters. The algebraicity/Hodge hypothesis is necessary; arbitrary continuous character data do not carry this purity assertion.

Use `rank_one_purity` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], Appendix A.2, p.87, items (1),(2),(8); [ACC+][acc-2023], §7.1, p.1092, purity paragraph.

*Needs:* [Layer 1, Algebraic character families](#target-character-system); [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data); `AutomorphicGaloisRepresentations` §3.13; `AutomorphicGaloisRepresentationsPartII:AG2.0`; `tauceti:TauCeti.HeckeCharacter` (purity of infinity types); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

<a id="target-induced-character-purity"></a>
### 1.11 Purity of induced character families

For finite F′/F, induction of a pure rank-one character system of weight w is pure of weight w, using the canonical Hodge data H_τ=⊔_(σ|τ)H_σ and adjoining extension ramification to S. In a residue-degree-f block an induced Frobenius eigenvalue β satisfies β^f=α_w. Since q_w=q_v^f, the absolute-value condition descends to |ιβ|²=q_v^w. The same conclusion holds for extremely weak rank-one character input with these transported Hodge multisets. It gives neither regularity nor irreducibility, and does not permit freely chosen higher-rank Hodge metadata with only the right total sum.

Use `induced_character_purity` for this construction.

The sources are [ACC+][acc-2023], §7.1, p.1092, purity paragraph; [BLGGT v4][blggt-2014-v4], §5.1, pp.62–63.

*Needs:* [Layer 1, Rank-one purity](#target-rank-one-purity); [Layer 1, Twisting, restriction and induction](#target-system-operations); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-artin-system"></a>
### 1.12 Artin families

Given a finite quotient Γ of G_F and a characteristic-zero representation a of Γ over a number field M, extend coefficients at every finite place of M to construct its Artin family. Put in S all primes ramified in the quotient. Each member has finite image and is de Rham and potentially unramified, with n zero Hodge–Tate weights; it is crystalline at coefficient places outside S. Good Frobenius eigenvalues are roots of unity and the common polynomials are those of a(Frob_v). The family has weight zero, with no automatic irreducibility or regularity conclusion.

The construction has the following API:

- `artinSystem`: Extend the given finite-quotient number-field representation to every coefficient place.
- `artinSystem_hodge`: H_τ is n copies of zero.
- `artinSystem_charpoly`: Q_v is the characteristic polynomial of the finite quotient Frobenius element.
- `artinSystem_pure`: The Artin family is pure of weight 0 with finite-monodromy local WD data.

**Checks.**

- `artin_trivial`: The trivial rank-one quotient gives Q_v=X−1 and H={0}.
- `artin_quadratic`: For a quadratic character, good Q_v is X−1 at split primes, X+1 at inert primes.
- `artin_rank_two_irregular`: Any rank-two Artin family has H={0,0}, so it is not regular, even when its finite-group representation is irreducible.
- `artin_roots_unity`: Finite-order matrices have eigenvalues roots of unity under every complex embedding; their absolute value is 1.

Use `artinSystem` for this construction.

The sources are [ACC+][acc-2023], §7.1, pp.1086,1092.

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `PadicHodgeTheory:R06.2`; `mathlib:Representation`; `mathlib:LinearMap.charpoly`.

<a id="target-artin-twist-purity"></a>
### 1.13 Purity of Artin families up to twist

If ℛ is the tensor of a rank-n Artin system and a rank-one algebraic character system of weight w, it is pure of weight w with the canonical Hodge multisets consisting of n copies of the character's Hodge number. Good eigenvalues are roots of unity times the character value. Apply the same argument to an ACC+ rank-two extremely weak system Artin up to twist only when the actual character twist and canonical Hodge data, or a very weak realization, identify that family. A determinant sum alone does not force higher-rank Hodge purity.

Use `artin_twist_purity` for this construction.

The sources are [ACC+][acc-2023], §7.1, pp.1086,1092.

*Needs:* [Layer 1, Artin families](#target-artin-system); [Layer 1, Rank-one purity](#target-rank-one-purity); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-rank-two-reducibility-independent-of-lambda"></a>
### 1.14 Independence of characteristic-zero reducibility

For a rank-two weak system over ℚ in Taylor's sense, absolute reducibility of a characteristic-zero member implies absolute reducibility of every member. Classify its two one-dimensional Hodge–Tate constituents as finite-order characters times cyclotomic powers (AutomorphicGaloisRepresentations §3.13, `geometricCharacter_totallyReal`), extend them to algebraic Hecke-character systems, and compare their direct sum with the original family by good Frobenius polynomials. This is a theorem about characteristic-zero members, not the exceptional primes of residual reducibility.

Use `rank_two_reducibility_independent_of_lambda` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, before Lemma 6.5, p. 773 (PDF page 45), §6, after Lemma 6.5, p. 774 (PDF page 46).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); `ArithmeticGaloisRepresentations:R01.5`; `AutomorphicGaloisRepresentations` §3.13; [Layer 1, Algebraic character families](#target-character-system); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-system-l-functions"></a>
### 1.15 L-functions and archimedean factors

For an embedding ι:M↪ℂ, define L^S(ιℛ,s)=∏_(v∉S) q_v^(ns)/ιQ_v(q_v^s). Purity of weight w gives convergence and analyticity on Re(s)>1+w/2. Here q_v>1 and every root of ιQ_v has modulus q_v^(w/2), whereas |q_v^s|=q_v^Re(s); hence the denominator is nonzero in this half-plane. When S contains every place above l, the partial function is determined by r_λ. For an away-coefficient strictly compatible system define the full finite Euler product using WD_v; it differs from L^S at only finitely many factors.

For a regular pure system use the following archimedean factors, with Γ_R(s)=π^(−s/2)Γ(s/2) and Γ_C(s)=2(2π)^(−s)Γ(s)=Γ_R(s)Γ_R(s+1). At a complex place with embeddings τ,τ′, put

L_v(s)=Γ_C(s−w/2)^n ∏_(h∈H_τ,h<w/2) Γ_C(s−h)/Γ_C(s−w/2) ∏_(h∈H_τ′,h<w/2) Γ_C(s−h)/Γ_C(s−w/2),

and ε_v=i^(Σ_(h∈H_τ)|h−w/2|+Σ_(h∈H_τ′)|h−w/2|).

At a real place let d_+=d_−=n/2 for even n; for odd n and even w let d_±=(n±(−1)^(w/2)det ℛ(c_v))/2. Put

L_v(s)=Γ_R(s−w/2)^(d_+) Γ_R(s+1−w/2)^(d_−) ∏_(h∈H_τ,h<w/2) Γ_C(s−h)/Γ_C(s−w/2),

and ε_v=i^(d_−+Σ_(h∈H_τ)|h−w/2|). Complete the function by Λ=L∏_(v|∞)L_v and define the global ε-factor as the product of local WD ε-factors and these infinite factors, using the standard additive character of A_F/F. Interpret the archimedean quotient formulas as meromorphic expressions, with cancellation before evaluation at removable singularities. The pointwise helper `Factors.archimedeanGammaFactor` uses Mathlib’s total complex Gamma functions: its quotient agrees with the meromorphic expression only where Γ_C(s−w/2) is nonzero, namely s−w/2∉{0,−1,−2,…}. At other arguments use the continued, cancelled factor. The helper `Factors.archimedeanD` is interpreted as multiplicities only for det(c_v)∈{−1,1} and, when n is odd, even w. These formulas use BLGGT v4; its v1 separate Hodge-factor expression is not used for odd w. Do not infer a functional equation for every system merely from defining its completed function.

The construction has the following API:

- `partialLFunction`: L^S(ıℛ, s) as an Euler product.
- `lFunction`: L(ıℛ, s) for strictly compatible ℛ.
- `Factors.archimedeanGammaFactor`: L_v(ıℛ, s) at complex and real v in BLGGT v4's form, through Complex.Gammaℝ and Complex.Gammaℂ.
- `Factors.archimedeanEpsilon`: ε_v(ıℛ, ψ_v, s) = i^{Σ|h − w/2|} (complex v) or i^{d− + Σ|h − w/2|} (real v).
- `Factors.archimedeanD`: d± at a real place: n/2, or (n ± (−1)^{w/2}det ℛ(c_v))/2 for n odd.
- `completedLFunction`: Λ(ıℛ, s) and ε(ıℛ, s).
- `partialLFunction_converges`: Convergence on Re s > 1 + w/2 for pure ℛ.
- `partialLFunction_eq_of_lambda`: L^S(ıℛ, s) = L^S(ı̃r_λ, s) when S contains the places above l.

**Checks.**

- `trivial_character`: F = ℚ, n = 1, r_λ trivial: w = 0, d+ = 1, d− = 0, H = {0} has no h < 0, so L_∞ = Γ_ℝ(s) and ε_∞ = 1; Λ(ı1, s) = Γ_ℝ(s)ζ(s) is completedRiemannZeta, and Λ(1 − s) = Λ(s) is the functional equation with ε = 1.
- `gamma_duplication`: Γ_ℂ(s) = Γ_ℝ(s)Γ_ℝ(s + 1) is Mathlib's Complex.Gammaℝ_mul_Gammaℝ_add_one.
- `cyclotomic_character`: F = ℚ, r_λ = ε_l in BLGGT's conventions (Frob_v geometric, HT_τ(ε_l) = {−1}): Q_p(X) = X − p^{−1}, weight −2, L^S(ıε_l, s) = ζ^S(s + 1); d+ = (1 + (−1)(−1))/2 = 1, d− = 0, so L_∞ = Γ_ℝ(s + 1) and ε_∞ = i^{0 + |−1 + 1|} = 1.
- `elliptic_curve_gamma_factor`: F = ℚ, ℛ = H¹ of an elliptic curve: n = 2, w = 1, H = {0, 1}, d± = 1, so L_∞ = Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)·Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s) as a meromorphic function, and pointwise when s−1/2∉{0,−1,−2,…}; ε_∞ = i^{1 + 1/2 + 1/2} = −1. v1's Hodge factor is undefined here (w odd).
- `gamma_quotient_at_pole`: at s=1/2 the raw quotient helper for H={0,1}, w=1 gives 0 because Γ_C(0)=0 in Mathlib’s total convention, while the cancelled factor Γ_C(1/2) is nonzero. Thus the unconditional pointwise identity fails.
- `archimedean_parity`: rank one with w=0 and det(c)=−1 gives (d+,d−)=(0,1) and epsilon i; rank two with w=1 has (1,1). Rank zero with empty Hodge multisets gives factor and epsilon 1.
- `gamma_complex_pair`: at a complex place H=Hbar={0}, w=0 gives Γ_C(s); its epsilon is 1. For H=Hbar={0,1}, w=1 the continued factor is Γ_C(s)^2 and epsilon −1.

Use `partialLFunction` for this construction.

The sources are [BLGGT v1][blggt-2014], §5.1, pp. 52–53 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.1, pp. 63–64 (arXiv v4).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`; `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`; `mathlib:Complex.Gammaℝ`; `mathlib:Complex.Gammaℂ`; `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one`.

<a id="target-galois-grothendieck-ring"></a>
### 1.16 The arithmetic representation ring

For a number field F and prime l, form the additive Grothendieck group Rep_(F,l) of finite-dimensional semisimple continuous Q̄_l-representations of G_F, unramified almost everywhere. Semisimplified tensor product gives its commutative ring structure. Cancellation follows from trace recognition. Trace at σ is a ring homomorphism; dim=tr(1) takes integral values. The symmetric Hom pairing satisfies ([U],[V])=dim Hom_(G_F)(U,V), and for a virtual class A=Σn_i[V_i] in the irreducible basis, (A,A)=Σn_i². Hence (A,A)=1 and dim A>0 force A to be a genuine irreducible class.

Supply the product formula along a Zariski-dense map into G₁×G₂, conjugation, restriction as a ring map, and induction with its trace and dimension formulas. Include the arithmetic projection formula, Frobenius reciprocity, Mackey decomposition and the pairing identity obtained by inflating the finite-group Brauer decomposition. For an unramified-outside-S virtual class, with S containing places above l, define L^S multiplicatively on the irreducible multiplicities; induction gives L^S(Ind A)=L^(S′)(A). The additive multiplicity lattice can use `Finsupp`; its pointwise multiplication is not the tensor-product ring law.

The construction has the following API:

- `RepRing`: Rep_{F,l} with ⊗ as multiplication.
- `RepRing.trace`: tr σ : Rep_{F,l} → ℚ̄_l, a ring homomorphism.
- `RepRing.pairing`: (A, B) = dim Hom, extended bilinearly.
- `RepRing.eq_irreducible_of_pairing_eq_one`: Positive dimension and (A,A)=1 imply A is the class of one genuine irreducible; expand A in the irreducible basis and use Σn_i²=1. The coordinate statement is `RepRing.eq_single_one_of_norm_one` in Suggested.lean.
- `RepRing.res`: Restriction, a ring homomorphism.
- `RepRing.ind`: Induction with trace formula, projection formula, Frobenius reciprocity and Mackey.
- `RepRing.brauer_transport`: Inflate the supplied finite-quotient Brauer decomposition and use the arithmetic projection formula to obtain A = Σ n_i ind([ı^{−1}ψ_i] res A).
- `RepRing.partialLFunction`: L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive and inductive.

**Checks.**

- `pairing_norm`: A = 2[V₁] − [V₂] with V₁ ≇ V₂ irreducible: (A, A) = 4 + 1 = 5, and dim A = 2 dim V₁ − dim V₂ may be negative.
- `trivial_class`: [1] is the unit, with (1, 1) = 1 and dim 1 = 1.
- `induced_dimension`: dim ind_{F′/F}[1] = [F′ : F], and (ind[1], [1]) = 1 by Frobenius reciprocity.
- `virtual_not_genuine`: For the virtual C₂ class A=3·1−ε, dim A=2 but (A,A)=10; rank two alone fails genuineness. Norm-one plus positive dimension is the criterion actually used.

Use `RepRing` for this construction.

The sources are [BLGGT v1][blggt-2014], §5.4, items (1)–(9), pp. 61–63 (arXiv v1).

*Needs:* [Layer 1, L-functions and archimedean factors](#target-system-l-functions); [Layer 1, Twisting, restriction and induction](#target-system-operations); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `mathlib:Rep.indResAdjunction`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

<a id="target-monodromy-component-field"></a>
### 1.17 The common monodromy component field

For any weak system there is a single finite Galois F⁰/F identifying Gal(F⁰/F) with G_λ/G_λ⁰ for every λ. If the system is regular, constituents restricted to an open subgroup have multiplicity one. After one finite extension of the coefficient field, every such constituent is defined over the corresponding completed coefficient field and admits a stable integral lattice. The result guarantees existence and coefficient descent; it chooses no canonical lattice. The split-eigenvalue descent criterion is part of its proof.

Use `monodromy_component_field` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], Lemma 5.3.1, pp.70–71, Appendix A.1 Lemma A.1.5, p.85.

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:G7` (§7.6: Zariski closure, identity component and component field of one representation); `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`.

<a id="target-larsen-rational-system-groups"></a>
### 1.18 Rational-system monodromy data

For a rational weak system r_l:G_F→GL_n(ℚ_l), form its algebraic monodromy group G_l, reductive identity component G_l⁰, image Γ_l, and Γ_l⁰=Γ_l∩G_l⁰(ℚ_l). Include the common component field F⁰/F with Gal(F⁰/F)≅Γ_l/Γ_l⁰. Let Z_l, G_l^der, G_l^ad, C_l and G_l^sc be respectively the centre, derived group, adjoint quotient, abelian quotient and simply connected cover, and let H_l=G_l^sc×Z_l→G_l⁰.

Define Γ_l^Z, Γ_l^C, Γ_l⁰⁰ and Γ_l^H by intersection, projection and preimage. Choose maximal tori and constants A(n),B(n): the central-cover kernel order divides A(n); X*(T^ad)⊆X*(T^der)⊆X*(T^sc)⊆A(n)⁻¹X*(T^ad); and B(n) bounds the relevant representation weights. Supply Serre's θ_l:S_(F⁰,l)→C_l, agreeing with (r_l mod G_l^der)∘Art_(F⁰) on an open subgroup of O_(F⁰,l)^×. Construct it from the abelian representation r_l mod G_l^der of G_(F⁰) into the torus C_l: after a finite extension splitting C_l, every character of C_l composed with it is a geometric character, hence the avatar of an algebraic Hecke character (AutomorphicGaloisRepresentations §3.13), and the infinity types of these characters define the algebraic homomorphism θ_l. The group constructions depend on the actual rational members and their Zariski closures.

The construction has the following API:

- `LarsenData.G`: G_l, the Zariski closure of the image, with G⁰_l, Z_l, G^der_l, G^ad_l, C_l, G^sc_l, H_l.
- `LarsenData.componentField`: F⁰/F with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for every l.
- `LarsenData.gammaH`: Γ^H_l ⊆ H_l(Q_l), the preimage of Γ⁰⁰_l.
- `LarsenData.A`: A(n): #ker(G^sc_l → G^ad_l) | A(n), uniformly in ℛ and l.
- `LarsenData.theta`: θ_l : S_{F⁰,l} → C_l.

**Checks.**

- `torus_case`: CM-type systems: G⁰_l a torus, H_l = Z_l, and Γ^H_l = Γ^Z_l.
- `gl2_case`: For a non-CM elliptic curve over ℚ: G⁰_ℓ=GL₂, G^sc_ℓ=SL₂, Z_ℓ=𝔾_m, C_ℓ=𝔾_m via det. The kernel of SL₂→PGL₂ has order 2, so 2 divides a uniform A(2); no universal choice A(2)=2 is asserted.
- `finite_image`: An Artin representation: G⁰_l = 1, so F⁰ is the field cut out by r_l and all other groups are trivial.
- `theta_bound_depends_on_system`: A(n) and B(n) depend only on n, but C(ℛ) and D(ℛ) of Lemma 5.2.1 cannot be chosen independently of ℛ: for ℛ = ε^k over ℚ (n = 1), θ_l is x ↦ x^{±k}, so its exponent has absolute value |k|.

Use `LarsenData.G` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], §5.2, pp. 65–66 (arXiv v4).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, The common monodromy component field](#target-monodromy-component-field); `ArithmeticGaloisRepresentations:G7` (§7.6); `tauceti:TauCetiRoadmap/ReductiveGroups` (Layer 6: centre, derived group, adjoint quotient, simply connected cover and central isogenies); `AutomorphicGaloisRepresentations` §3.13.

<a id="target-serre-theta-uniform-bounds"></a>
### 1.19 Uniform bounds for Serre's torus map

For the rational-system monodromy data, prove four uniform assertions: θ_l is surjective; for l outside S its reciprocity comparison holds on all O_(F⁰,l)^×; there is C(ℛ), independent of l, such that (A(n)μ)∘θ_l=Σ_σm_(μ,σ)σ for every central weight μ, with |m_(μ,σ)|<C(ℛ); and the torsion of X*(S_(F⁰,l))/θ_l*X*(C_l) has cardinality bounded by D(ℛ), also independent of l. Use the actual algebraic tori and character-lattice maps, with the reciprocity and Hodge constraints supplied by their owners.

Use `serre_theta_uniform_bounds` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], §5.2, Lemma 5.2.1 and proof, pp. 66–67 (arXiv v4).

*Needs:* [Layer 1, Rational-system monodromy data](#target-larsen-rational-system-groups).

<a id="target-larsen-good-primes"></a>
### 1.20 Good integral monodromy primes

For a rational weak system choose a Dirichlet-density-one set L with the following integral monodromy properties. For l∈L, G_l⁰ and its associated groups are unramified; there is a semisimple integral model G̃_l^sc with Γ_l^H=G̃_l^sc(ℤ_l)×Γ_l^Z; the index [Z̃_l(ℤ_l):Γ_l^Z] is uniformly bounded; the conjugation action extends uniquely to H̃_l=G̃_l^sc×Z̃_l; and V_l has an H̃_l⋊Γ_l-invariant lattice.

After an unramified extension M_λ/ℚ_l of uniformly bounded degree, all G_l^sc-irreducible subquotients are defined. In the decomposition V_l⊗M_λ=⊕V_(λ,i), every H̃_l-invariant integral lattice splits into the intersections with these isotypic parts. Their irreducible G̃_l^sc(ℤ_l)-subquotients are absolutely irreducible of the expected constituent dimension and have one common isomorphism class for each i; distinct isotypic parts give distinct classes. These six conclusions are the input to the residual irreducibility theorem.

Use `larsen_good_primes` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], §5.2, Proposition 5.2.2 and proof, pp. 68–70 (arXiv v4).

*Needs:* [Layer 1, Rational-system monodromy data](#target-larsen-rational-system-groups); [Layer 1, Uniform bounds for Serre's torus map](#target-serre-theta-uniform-bounds).

<a id="target-residual-irreducibility-density-one"></a>
### 1.21 Density-one residual irreducibility

For a regular weakly compatible system over any number field, there is a Dirichlet-density-one set L of rational primes such that, for every λ over l∈L and every irreducible subrepresentation s of r_λ, the semisimplified reduction s̄ remains irreducible on G_(F(ζ_l)). Apply the monodromy and integral-lattice results above after the coefficient-field reduction needed for the general system. The assertion concerns every irreducible constituent, and density one rather than a cofinite set of primes.

Use `residual_irreducibility_density_one` for this construction.

The sources are [BLGGT v1][blggt-2014], §5.2, Lemma 5.2.1 and Proposition 5.2.2, pp. 54–58 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.3, Proposition 5.3.2, p. 71 (arXiv v4).

*Needs:* [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, The common monodromy component field](#target-monodromy-component-field); [Layer 1, Good integral monodromy primes](#target-larsen-good-primes).

<a id="target-constituents-essentially-self-dual"></a>
### 1.22 Polarized constituents and CM descent

Let F be imaginary CM and (ℛ,ℳ) a pure, extremely regular polarized weak system. For finite F′/F and any subrepresentation s of r_λ|G_F′, find a CM intermediate field F⊆F″⊆F′ over which s is invariant and polarized with multiplier μ_λ|G_(F″⁺). Total oddness is inherited when the original pair is totally odd. Purity and extreme regularity make the constituent's Hodge subset stable under polarized duality. Use the CM-base statement of BLGGT v4 Lemma 5.4.5; it applies to reducible subrepresentations as well as irreducible constituents.

The actual polarization witness is required; essential self-duality alone does not replace the signed pairing. Irreducibility of s is not a hypothesis.

Use `constituents_essentially_self_dual` for this construction.

The sources are [BLGGT v1][blggt-2014], §5.2, Lemma 5.2.3, pp. 58–59 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.4, Lemma 5.4.5 and proof, p. 76 (arXiv v4).

*Needs:* [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); [Layer 1, Polarized weakly compatible families](#target-polarized-system).

### Examples

The cyclotomic, discriminant-form, rank-zero and elliptic-curve checks distinguish Frobenius, Hodge and Gamma conventions. The theta exponent of a cyclotomic power also tests the dependence of monodromy bounds on the system.

### Dependencies

This layer uses `ArithmeticGaloisRepresentations`, `EndoscopicTransferAndUnitaryTraceComparison`, `PadicHodgeTheory`, `mathlib`, `tauceti`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r23-1"></a>
## Layer 2: Integral points and controlled fields


Build from local point topology and scheme foundations to integral approximation. The curve proof needs its relative Picard and cohomology interfaces; the number-field and function-field field-selection refinements then retain their different completion and constant-field conclusions.

<a id="target-skolem-datum-and-integral-point"></a>
### 2.1 Skolem data and integral points

Let B = Spec R, where R is either a ring of S-integers in a number field or the coordinate ring of a smooth connected affine curve over a finite field, and put K = Frac R. A Skolem datum consists of a separated, finite-type, surjective map X → B, with X irreducible and X_K geometrically irreducible; a finite set Σ of places outside Max R; finite Galois extensions L_v/K_v for v ∈ Σ; and nonempty, open, Gal(L_v/K_v)-invariant sets Ω_v of smooth points in X(L_v), using the local analytic topology.

Call the datum complete when Σ ∪ Max R contains every place of K. An integral point is an irreducible closed subscheme Y ⊆ X finite and surjective over B, with each Y ×_R L_v split into L_v-rational points in Ω_v. The equivalent field form uses a finite K′/K, the normalization R′ of R in K′, and x ∈ X(R′): require K′ ⊗_K L_v ≅ L_v^[K′:K] **as L_v-algebras**, and require the local image of x to lie in Ω_v for every K-embedding K′ ↪ L_v. This imposes splitting after extension to L_v; it does not require every completion of K′ to equal L_v.

The construction has the following API:

- `SkolemDatum`: (f : X → B, Σ, (L_v), (Ω_v)) with the conditions above
- `SkolemDatum.IsComplete`: every place of K lies in Σ or Max(R)
- `SkolemDatum.IntegralPoint`: an irreducible closed Y ⊆ X, finite surjective over B, L_v-split and inside Ω_v for v ∈ Σ
- `SkolemDatum.integralPoint_iff`: Integral points correspond to finite extensions K′/K with K′ ⊗_K L_v a product of copies of L_v, and an integral point all of whose K-embeddings into L_v land in Ω_v. Completions can be proper subfields of L_v.
- `SkolemDatum.enlargeSigma`: After removing a finite set of closed places from B, prescribe nonempty integral local opens over finite Galois L_v; closure of an integral point for the enlarged datum is an integral point for the original datum (II 1.10).
- `SkolemDatum.split_iff_algEquiv`: The generic splitting condition means that the multiplication/base-change algebra K′⊗_K L_v is isomorphic as an L_v-algebra to a finite product of L_v, not that K′⊗_K K_v has prescribed factors L_v.
- `SkolemDatum.fieldPoint_split`: An integral field point is split after scalar extension to every L_v in Σ; expose this without unfolding FieldPoint.
- `SkolemDatum.fieldPoint_local`: For each v∈Σ and each K-embedding K′→L_v, the induced local point belongs to Ω_v.
- `SkolemDatum.isComplete_congr`: Completeness depends only on Σ and Max(R): two data with equal sets have equivalent completeness predicates.
- `SkolemDatum.mapPoint`: For an R-morphism X→Y sending each Ω_v into the target Ω_v and preserving the place data, map normalized field integral points to target field points. This concerns the field-point presentation; geometric image/normalization comparison is separately required. Identity and composition of R-morphisms give the identity and composite maps on the normalized field-point presentation.

**Checks.**

- `skolem_complete_Z`: R = Z, Σ = {∞} is complete; X = G_m, L_∞ = C and Ω_∞ = {0 < |z| < 1} has no integral point, since the norm of an algebraic unit has absolute value 1.
- `skolem_incomplete_Z_half`: R = ℤ[1/2], Σ = {∞}: the place 2 lies neither in Σ nor in Max(R), so the datum is incomplete
- `skolem_trivial_X`: X = B and Ω_v the unique local point: K′ = K gives an integral point for every finite Galois L_v/K_v, including a nontrivial L_v. This distinguishes splitting over L_v from requiring completions equal L_v.
- `skolem_geometric_irreducibility`: take X=Spec O_E[1/2] for a real quadratic E/ℚ and select one real embedding as Ω_∞. Every extension point contains E and hence has both real embeddings; this datum fails the required conclusion. The generic fibre is irreducible over ℚ but not geometrically irreducible.
- `skolem_open_required`: a single point {x} ⊂ X(ℚ_p) of a curve is not v-adically open, so it cannot serve as Ω_v
- `skolem_fieldPoint_local`: For an integral field point, every K-embedding of its generic field into every L_v with v∈Σ gives a local point in Ω_v; a definition checking only one embedding fails this test.

Use `SkolemDatum` for this construction.

The sources are [Moret–Bailly II][moret-bailly-1989-II], 1.1 and Définition 1.2, p. 181, Définition 1.2, p. 181, Remarque 1.8, p. 184.

*Needs:* `mathlib:AlgebraicGeometry.Spec`; `mathlib:AlgebraicGeometry.GeometricallyIrreducible`; `mathlib:AlgebraicGeometry.Smooth`; `ReductiveGroupsPartII` RG2.0.1 (the topology on points of schemes over topological rings, `scheme-point-topology`, and openness of smooth maps on local points, `smooth-morphism-open-map`); `SchemeAndStackFoundations:SF.4` (models over the ring of integers).

<a id="target-density-of-algebraic-and-separable-local-points"></a>
### 2.2 Local density and integral points

Three density statements support the local conditions. For a finite-type, generically smooth scheme over a local field F, its points over the separable closure F^s are dense in its points over an algebraic closure, in the valuation topology. For a flat, surjective finite-type model over the integers A of a nonarchimedean local field F, with generically smooth generic fibre, an integral point exists over the integers A′ of some finite separable F′/F. Finally, if a discretely valued field F has separable completion F̂ and F_a is its relative algebraic closure in F̂, then Z(F_a) is dense in Z(F̂) for every finite-type F-scheme Z. Retain the separability/excellence assumption in the last statement. In characteristic zero the first density assertion identifies the two point sets.

Use `densityOfAlgebraicLocalPoints` for this construction.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 1.6.1 and proof, p. 183, Lemme 2.1, p. 185.

*Needs:* `ReductiveGroupsPartII` RG2.0.1 (the topology on local points, local compactness over local fields, openness of smooth maps; the local inverse function theorem for étale maps on points over a complete field is proved here, as in Moret-Bailly's proof of Lemme 1.6.1); `SchemeAndStackFoundations:SF.4`; `mathlib:NumberField.FinitePlace`; `mathlib:Algebra.IsAlgebraic`; `mathlib:Algebra.IsSeparable`.

<a id="target-elementary-reductions-of-skolem-data"></a>
### 2.3 Shrinking and enlarging Skolem data

Establish the reductions needed to apply approximation on a curve. Chow's lemma permits a quasi-projective replacement. Removing the closure of a proper closed subset of X_K preserves surjectivity and leaves a nonempty open part of each Ω_v, so one can arrange that the generic fibre is smooth. For a finite set T ⊆ Max R, replace B by B \ T and Σ by Σ ∪ T. The finite class group makes B \ T affine; local integral points over finite extensions supply the new Galois-stable opens at T. The closure in X of an integral point over the smaller base recovers an integral point for the original datum. The new arithmetic ring is a localization of R. These steps also allow a nonempty smooth open subscheme of X to replace X.

Use `elementaryReductions` for this construction.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Remarque 1.4, p. 182, Remarque 1.10, p. 184, Exemple 1.10.1, p. 184.

*Needs:* [Layer 2, Local density and integral points](#target-density-of-algebraic-and-separable-local-points); `SchemeAndStackFoundations:SF.4` (`chow-lemma`); `ReductiveGroupsPartII` RG2.0.1; `tauceti:TauCetiRoadmap/GlobalNumberFields` (finiteness of the class group).

<a id="target-reduction-to-relative-dimension-one"></a>
### 2.4 Reduction to curves

For quasi-projective X → B with smooth generic fibre, construct a one-dimensional closed subset T ⊆ X that is quasi-finite and surjective over B and meets every Ω_v. When dim X_K ≥ 2, a geometrically irreducible hypersurface through T_K, regular at its points, gives a closed model X′ with generic dimension one less. Intersecting Ω_v with the smooth locus of X′_K gives another Skolem datum. Its integral points map to integral points of X; its completeness condition is unchanged. Iterate to relative dimension one. The reductions themselves do not assume incompleteness. The geometric irreducibility of a general hypersurface section through T_K is Jouanolou's Bertini irreducibility theorem, in the form of the [Stacks Project, Lemma 37.32.3 (Tag 0G4F)](https://stacks.math.columbia.edu/tag/0G4F); its smoothness on the smooth locus is the Bertini smoothness theorem of the scheme foundations.

Use `reductionToCurves` for this construction.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 2.2, p. 185, Proof of Lemme 2.3, p. 185, 2.4, p. 186.

*Needs:* [Layer 2, Local density and integral points](#target-density-of-algebraic-and-separable-local-points); [Layer 2, Shrinking and enlarging Skolem data](#target-elementary-reductions-of-skolem-data); `SchemeAndStackFoundations:SF.4` (`bertini-smoothness`, `chow-lemma`); Stacks Project Lemma 37.32.3 (Bertini irreducibility).

<a id="target-generalized-picard-functor-and-effective-divisor-fibration"></a>
### 2.5 Rigidified Picard functors and divisor fibrations

In the smooth quasi-projective curve case, compactify X in a normal projective curve X̄ over B and let Z be the reduced boundary. After shrinking B and adding the removed places to Σ, require X̄ regular, all fibres geometrically integral, and Z regular, finite flat and surjective over B. Thus Z is a Cartier divisor. Write g = h¹(X̄_K, O) and z = deg Z_K > 0.

Use `RigidifiedLineBundleClass (Z_T ⟶ X̄_T)` as the objectwise classes and form their relative fppf sheaf PG(X̄,Z). The current library already defines the representatives, compatible-isomorphism quotient and pullback for an arbitrary morphism. The relative sheafification and its degree-d part PG_d are the additional constructions here. Tensor product and duality supply the group law. As relative sheaves the sequence is 1 → G_m,B → (π_Z)_*G_m,Z → PG(X̄,Z) → Pic_(X̄/B) → 1. PG is represented by a smooth separated group scheme locally of finite presentation; generic-fibre representability is sufficient for the approximation argument.

The symmetric power X^(d) parametrizes effective Cartier divisors finite flat of degree d and disjoint from Z. Its étale-divisor open U_d contains the local set Ω_v^[d] of L_v-split divisors supported in Ω_v. This set is open and is nonempty when [L_v:K_v] divides d. For the convention that the trivialization goes from the restricted line bundle to O_Z, invert the nowhere-vanishing section s_D|_Z. Sending D to (O(D),(s_D|_Z)⁻¹) defines φ_d : X^(d) → PG_d. For **d ≥ 2g + z − 1**, it is locally an affine-space bundle of dimension d + 1 − g − z. Keep the relative divisor, sheaf and degree constructions separate from the underlying set of line-bundle isomorphism classes.

The construction has the following API:

- `Picard.generalizedPicard`: The relative fppf sheaf of the existing rigidified line-bundle classes on (X̄_T,Z_T); define its degree grading and the base-change comparison.
- `generalizedPicard_exact`: The relative fppf sequence 1 → G_m,B → (π_Z)_*G_m,Z → PG(X̄,Z) → Pic_(X̄/B) → 1, with the maps induced by boundary units and forgetting.
- `generalizedPicard_representable`: Under the relative curve and boundary hypotheses above, a smooth separated group scheme locally of finite presentation represents PG; its degree-d component represents PG_d.
- `divisorClassMap`: φ_d : X^(d) → PG_d, sending D to the class of (O(D),(s_D|_Z)⁻¹).
- `divisorClassMap_affineFibration`: For d ≥ 2g + z − 1, φ_d is locally an affine-space bundle of dimension d + 1 − g − z.
- `omegaDivisors_open`: Ω_v^[d] is open in U_d(K_v) and nonempty when [L_v:K_v] divides d.
- `generalizedPicard_group`: In the relative curve setting the rigidified Picard functor is a commutative group sheaf. The product is (L⊗M,α⊗β) through the monoidal pullback comparison; the unit is (O_X,id), and the inverse is (Lᵛ,αᵛ) through the duality comparison. Establish representative evaluation, independence of compatible isomorphisms, associativity, commutativity, unit and inverse laws.
- `generalizedPicard_forget_mul` and `generalizedPicard_forget_inv`: The forgetful morphism preserves the tensor product and dual, rather than merely mapping representatives to their classes.
- `generalizedPicard_boundary_units`: Use the existing boundary-unit action and `RigidifiedLineBundleClass.mk_mk_eq_mk_mk_iff`. In the proper geometrically integral relative curve setting their fppf sheafifications identify (π_Z)_*G_m/G_m with the kernel sheaf. Objectwise lifting of an arbitrary Picard class is not asserted: exactness is after fppf sheafification.
- `generalizedPicard_pullback`: Extend `RigidifiedLineBundleClass.pullback` to the relative sheaf, preserve unit, product and inverse, and commute with forgetting to the relative Picard functor and with the divisor class map. Import the objectwise identity, composition and forgetful naturality laws.

**Checks.**

- `pg_affine_line`: X = 𝔸¹ ⊂ ℙ¹, Z = {∞}: g = 0, z = 1, and the fibre dimension d + 1 − g − z = d is that of monic polynomials of degree d
- `pg_multiplicative`: X = G_m ⊂ ℙ¹, Z = {0, ∞}: g = 0, z = 2, the degree-0 part is G_m (the generalized Jacobian of modulus 0 + ∞), fibres of dimension d − 1
- `pg_small_degree`: g = 1, z = 1, d = 1 < 2g + z − 1 = 2: Lemme 3.6 does not apply
- `pg_trivial_Z`: The empty boundary recovers the Picard functor; the curve approximation construction instead arranges z>0.
- `pg_rigidified_iso`: A boundary-compatible line-bundle isomorphism gives equal rigidified classes; literal equality of representatives is unnecessary.
- `pg_boundary_matters`: Over ℚ let X̄=ℙ¹ and Z={0,∞}. Give O_X̄ the two trivializations (1,1) and (1,2), directed toward O_Z. They have the same forgotten class and different rigidified classes: every global bundle automorphism is one scalar c∈ℚ×, whereas compatibility would require both c=1 and 2c=1. This detects a quotient that forgets the boundary.
- `pg_tensor_dual`: On the same pair, normalize a trivialization (a₀,a_∞) by its ratio a_∞/a₀. Classes of ratios 2 and 3 multiply to ratio 6; the dual of ratio 2 has ratio 1/2; ratio 1 is the unit. This fixes both the tensor law and the direction of the trivialization.
- `pg_base_change`: Base change from ℚ to ℚ(√2) sends the ratio-2 class to ratio 2, preserves the product 2·3=6, and commutes with forgetting. For a ring-valued test with unit a, specialization a↦1 can identify two classes, so no unconditional injectivity of base change is required.
- `pg_divisor_trivialization`: For an effective divisor disjoint from Z, its canonical section has no zero on Z. Its inverse trivializes O(D)|_Z and the resulting class has degree deg(D). A divisor through 0 is excluded for Z={0,∞}; using its zero section as a trivialization is impossible.
- `pg_whole_boundary`: rigidification along the identity of X gives one class; forgetting it gives the trivial line-bundle class. These are objectwise checks, distinct from relative fppf exactness.
- `pg_forget_representative`: For (L,α), the forgotten class is LineBundleClass.mk L.

Use `Picard.generalizedPicard` for the relative construction. Import `RigidifiedLineBundle`, `RigidifiedLineBundleClass.mk_eq_mk_iff`, `lift`, `lift_mk`, `pullback`, `pullback_id`, `pullback_comp`, `toLineBundleClass` and `toLineBundleClass_pullback` from the current Tau Ceti library (`LineBundle/Rigidified/Basic.lean`), and `mk_mk_eq_mk_mk_iff`, `stabilizer_eq_range` and `range_toLineBundleClass` from `LineBundle/Rigidified/Automorphisms.lean`, all in the `TauCeti.AlgebraicGeometry` namespace. These declarations are imported prerequisites and are not new targets.

The sources are [Moret–Bailly II][moret-bailly-1989-II], 3.1, p. 187, 3.2.4 and Lemme 3.3, p. 187, 3.4, p. 188, Lemme 3.6, p. 189.

*Needs:* [Layer 2, Shrinking and enlarging Skolem data](#target-elementary-reductions-of-skolem-data); `SchemeAndStackFoundations:SF.3`; `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`; `AlgebraicModuliForArithmeticGeometry` §7.3 (`relativePicardSheaf`, `rigidification_gm_torsor`, `relative_picard_algebraicSpace`); `SchemeAndStackFoundations:SF.3` (`picard-stack-curve`, `abel-maps-high-degree`); `NeronModelsAndSemistableAbelianVarieties` §4.9 (the generalized Jacobian of a modulus as an extension of the Jacobian by a torus).

<a id="target-local-picard-open-sets-and-strong-approximation"></a>
### 2.6 Local Picard opens and approximation

Set W_v^[d] = φ_d(Ω_v^[d]) in PG_d(K_v). For d ≥ 2g + z − 1 this is open, and it is nonempty if [L_v:K_v] divides d. If d ≥ 2g + z and d′ ≥ 0, multiplication of rigidified classes sends W_v^[d] × W_v^[d′] into W_v^[d+d′]. The multiplication bound is one larger than the affine-bundle bound.

Let an invertible sheaf M of degree d ≥ 2g + z − 1 and a boundary trivialization α have class in every W_v^[d]. If the Skolem datum is incomplete, strong approximation in the torsor of global sections s with α(s|_Z)=1 gives a section whose local divisor belongs to each Ω_v^[d]. Every irreducible component of div(s) is an integral point. Use strong approximation for torsors under finite projective R-modules: a finite projective R-module is a direct summand of a free one, so this reduces to additive strong approximation for the adeles away from one omitted place, which is where incompleteness enters. Use it together with the section/base-change and vanishing results for this relative curve.

Use `localPicardOpensAndApproximation` for this construction.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 3.7.2(ii), p. 190, Proof of Lemme 3.8, p. 191.

*Needs:* [Layer 2, Rigidified Picard functors and divisor fibrations](#target-generalized-picard-functor-and-effective-divisor-fibration); `tauceti:TauCetiRoadmap/GlobalNumberFields` (additive strong approximation for finite adeles); `SchemeAndStackFoundations:SF.3` (cohomology and base change for the relative curve).

<a id="target-quasi-compactness-of-the-generalized-jacobian-quotient"></a>
### 2.7 The compact generalized-Jacobian quotient

For an incomplete datum and any ample line bundle M₀ on X̄, find a positive tensor power M₀^⊗n and a trivialization along Z satisfying the preceding local Picard conditions. Normalize a starting power so its degree d is at least 2g + z, divisible by all [L_v:K_v], and its restriction to Z is trivial.

The controlling quotient PG₀(K_Σ)/im Γ(Z,O_Z^×), with K_Σ = ∏_(v∈Σ) K_v and the product topology, is quasi-compact. Consequently the powers of each element have the identity as an accumulation point. Prove the constituent compactness statements: J(F) is compact for a proper regular geometrically integral curve over a locally compact F; (R_Z ⊗_R K_Σ)^×/(R_Z^× K_Σ^×) is quasi-compact; and K_Σ^×/R^× is quasi-compact under incompleteness. The first holds because Pic⁰ of such a curve is a proper group scheme over F, so its F-points are compact for the point topology; the last uses the S-unit logarithm lattice of Dirichlet's S-unit theorem. Moret–Bailly prints the Jacobian lemma as 3.30.2, although its position and references identify it as 3.10.2.

Use `compactGeneralizedJacobianQuotient` for this construction.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 3.9, proof, p. 191, Lemme 3.9.2, p. 192, Lemme 3.10.2 (printed 3.30.2), p. 192, Proof of Lemme 3.10.4, p. 193.

*Needs:* [Layer 2, Local Picard opens and approximation](#target-local-picard-open-sets-and-strong-approximation); `SchemeAndStackFoundations:SF.3`; `AlgebraicModuliForArithmeticGeometry` §7.3 (`PicardZeroSheaf`, `picard_zero_criterion`); `ReductiveGroupsPartII` RG2.0.1 (`points-locally-compact-hausdorff`; points of projective schemes over a local field are compact); `tauceti:TauCetiRoadmap/GlobalNumberFields` (Dirichlet's S-unit theorem).

<a id="target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points"></a>
### 2.8 The integral-point theorem

Prove the integral-point theorem for every incomplete Skolem datum with the hypotheses above. The result supplies irreducible Y ⊆ X finite and surjective over B, split over each L_v and satisfying all local opens; equivalently it supplies K′, its normalization R′ and x ∈ X(R′) with the splitting and every-embedding conditions. Incompleteness is essential. Treat Σ = ∅ by the integral-point argument of Rumely's local–global principle; the nonempty-Σ proof uses the local density, curve reduction, rigidified Picard construction, compact quotient and strong approximation developed here. Spreading out also extends the theorem to the localizations of the arithmetic and geometric rings described in Moret–Bailly II Remark 1.7.

Use `moretBailly` for this construction.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Théorème 1.3, p. 182, p. 182, after Théorème 1.3; [Moret–Bailly I][moret-bailly-1989-I], Théorème 1.7 (Rumely) and 1.11, pp. 162-163.

*Needs:* [Layer 2, Skolem data and integral points](#target-skolem-datum-and-integral-point); [Layer 2, Reduction to curves](#target-reduction-to-relative-dimension-one); [Layer 2, Local Picard opens and approximation](#target-local-picard-open-sets-and-strong-approximation); [Layer 2, The compact generalized-Jacobian quotient](#target-quasi-compactness-of-the-generalized-jacobian-quotient).

<a id="target-theorem-g-from-moret-bailly"></a>
### 2.9 From integral points to split-field density

Derive the split-field density statement from the integral-point theorem: for a chosen nonempty open U ⊆ X, spread U to a smooth surjective model over an appropriate ring of integers with finitely many primes inverted. Enlarge the inverted set until the prescribed places and opens form a Skolem datum, while leaving a place outside both Σ and the closed places. An integral point gives a finite K′ split at S and a point of U(K′) in every prescribed open. Taking all U gives Zariski density. This construction explains why the integral theorem applies even when the conclusion concerns points on a variety over a field.

Use `theoremGFromMoretBailly` for this construction.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Introduction, Theorem G, p. 5.

*Needs:* [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Skolem data and integral points](#target-skolem-datum-and-integral-point); `SchemeAndStackFoundations:SF.4`.

<a id="target-taylor-theorem-g-split-completely-points-are-dense"></a>
### 2.10 Split-field density

Fix a number field K and finite set S of places, and let K_S be the maximal subextension of a chosen algebraic closure in which every place of S splits completely. For a smooth, geometrically irreducible, quasi-projective X/K with X(K_v) nonempty for v ∈ S, prove that X(K_S) is Zariski dense. More precisely, points can be chosen in any prescribed nonempty local opens and outside a proper closed subset. Each point descends to a finite subextension K′/K; one can subsequently pass to its Galois closure without losing splitting. For K = ℚ and S containing infinity, the selected fields are totally real.

Use `taylorTheoremG` for this construction.

The sources are [KW II][kw-serre-modularity-II], Proof of Theorem 6.1, ordinary case, p. 56; [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Introduction, Theorem G, pp. 4-5, Introduction, Theorem G, p. 5.

*Needs:* [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, From integral points to split-field density](#target-theorem-g-from-moret-bailly).

<a id="target-function-field-chebotarev"></a>
### 2.11 Chebotarev density for global function fields

Let K be a global function field with constant field F_q, D/K a finite Galois extension with group G and constant field F_(q^d), and C⊆G a conjugacy class whose image in Gal(F_(q^d)/F_q)=ℤ/d is the class of the n-th power of the q-Frobenius. Then for every sufficiently large integer m≡n mod d there is an unramified place of K of degree m whose Frobenius class is C, and the number of such places is (#C/#G)·d·q^m/m+O(q^(m/2)) for m≡n mod d; for m≢n mod d there is none. Fix a finite set of forbidden places; the places produced can avoid it.

Prove it by twisting and the Lang–Weil estimate. Let Y→X be the finite étale Galois cover of smooth geometrically connected curves over F_q, after removing the ramified places, attached to D/K, with Y geometrically disconnected into d components over F_(q^d). For σ∈C the degree-m places of X with Frobenius conjugate to σ correspond, up to the action of the centralizer, to the F_(q^m)-points of the twist of Y by σ; this twist is a geometrically irreducible curve exactly when σ maps to the m-th power of Frobenius in ℤ/d, and then Lang–Weil counts its points as q^m+O(q^(m/2)). Removing the points of smaller degree and dividing by the centralizer gives the count.

**Checks.**

- `ffcheb_constant_extension`: for D=K·F_(q^d) and C={φ^n}, the places of degree m have Frobenius φ^m, so the class φ^n occurs exactly in degrees m≡n mod d; no place of degree m≢n mod d has that Frobenius.
- `ffcheb_trivial_extension`: for D=K the statement is the existence of places of every large degree, with count q^m/m+O(q^(m/2)).
- `ffcheb_number_field_contrast`: in a number field there is no constant-field quotient and every conjugacy class occurs; the function-field statement must retain the congruence condition on the degree.

Use `functionFieldChebotarev` for this construction.

The sources are [Poonen, rational points][poonen-qpoints], Theorem 7.7.1 (Lang–Weil) and its proof, pp. 222–223; [BHKT][bhkt-published], proof of Proposition 9.2, published p. 78, where the result is applied with two coprime degrees.

*Needs:* `WeightsInEtaleCohomology` (the Riemann hypothesis for curves over finite fields and the Lefschetz trace formula, through which Lang–Weil is proved); `SchemeAndStackFoundations:SF.1` (finite étale Galois covers and twists of torsors); `InverseGaloisAndArithmeticFundamentalGroups` IG.1.1 (the arithmetic exact sequence of étale fundamental groups).

<a id="target-frobenius-primes-generate"></a>
### 2.12 Generating Frobenius primes

For a finite Galois D/K, choose finitely many unramified primes outside any finite forbidden set with representatives of Frobenius conjugacy classes generating Gal(D/K). Use Chebotarev prime existence and, where the geometric application requires it, local nonemptiness at the selected primes. In the function-field case incorporate the image in the constant-field quotient rather than silently imposing a degree restriction that excludes needed Frobenius classes; use the function-field Chebotarev theorem of §2.11. Mathlib’s Frobenius-prime-set definition supplies the carrier; prime existence in number fields is the Chebotarev theorem imported from its owner.

Use `frobeniusPrimesGenerate` for this construction.

The sources are [Snowden v1][snowden], §5.2, proof of Proposition 5.2.2, p. 16.

*Needs:* `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`; `ArithmeticGaloisRepresentations` §5.1 (every element of a finite Galois image is a Frobenius at a set of positive density); [Layer 2, Chebotarev density for global function fields](#target-function-field-chebotarev).

<a id="target-forcing-linear-disjointness-by-extra-split-places"></a>
### 2.13 Avoidance by extra split primes

Given a finite Galois avoidance field D/K, add finitely many unramified places outside the forbidden set whose Frobenius elements generate Gal(D/K), and at which the variety has local points. Alternatively, select a nonsplit place for each simple Galois subextension. A finite **Galois** K′/K split at these places is linearly disjoint from D. Indeed K′ ∩ D is normal over K, and all chosen Frobenius elements act trivially on it. They generate the quotient, so the intersection is K; this Galois-theoretic step is `Fields.eq_bot_of_fixed_by_generators` in Suggested.lean. For non-Galois avoidance data, first take the normal closure. Prime selection must preserve all originally prescribed local conditions.

Use `disjointnessByExtraSplitPlaces` for this construction.

The sources are [KW II][kw-serre-modularity-II], Proof of Theorem 6.1, last paragraph, p. 57; [KW Annals][kw-annals-2009], Proof of Theorem 2.1, p. 234.

*Needs:* [Layer 2, Generating Frobenius primes](#target-frobenius-primes-generate); [Layer 2, Split-field density](#target-taylor-theorem-g-split-completely-points-are-dense); `mathlib:IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

<a id="target-tower-linear-disjointness"></a>
### 2.14 Disjointness through towers

Work inside a common overfield with C⊆B⊆A and C⊆D. If A and D are linearly disjoint over C, then A and BD are linearly disjoint over B and A∩BD=B. Use tensor injectivity and the tower algebra structures to prove the transport. A converse from intersection alone requires the finite Galois hypotheses of Mathlib's `IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

Use `Fields.towerLinearDisjoint` for this construction; Suggested.lean states its intersection conclusion, with D finite over C.

The sources are [Qian][qian], §2 opening facts, preceding Lemma 2.1, p. 5 (arXiv v1).

*Needs:* `mathlib:IntermediateField.LinearDisjoint`; `mathlib:IntermediateField.LinearDisjoint.inf_eq_bot`.

<a id="target-cht-character-extension"></a>
### 2.15 Extending finite local characters

Extend the given finite-order characters at a finite set of completions of a number field, including its infinite places when prescribed, to a continuous finite-order idele class character. The extension with trivial behaviour at infinity is GL2AutomorphicRepresentationsAndTransfer R16.1 (`finite_hecke_full_local_prescription`, the same Lemma 4.1.1); this target adds prescribed components at the infinite places and the p-primary refinement. Use an open subgroup of finite index in the idele class group and extension into the discrete group of algebraic roots of unity. The resulting character may have larger order than the local characters. The p-primary refinement preserves p-primary values, without fixing an exact exponent.

Give the finite-image character target the discrete topology. Include all infinite places in S, extending the local data trivially at newly added ones.

Use `chtCharacterExtension` for this construction.

The sources are [CHT][cht], Lemma 4.1.1 and proof, p. 116; finite-order and p-primary refinements of the proof.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R16.1` (`finite_hecke_full_local_prescription`); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

<a id="target-cht-soluble-prescribed-completions"></a>
### 2.16 Soluble prescribed-completion extensions

Given a finite set S of places of a number field F and finite Galois local extensions E_v/F_v with soluble groups, construct a finite soluble Galois E/F, linearly disjoint from a specified finite avoidance field, whose completion at each chosen place is isomorphic to the prescribed E_v. Real completions can be required to remain real, giving a totally real E when F is totally real. The construction is allowed to enlarge the global degree; it does not promise a cyclic extension of a specified degree. Retain the precise local-extension hypotheses of the CHT lemma when invoking the character-extension construction.

Use `chtSolublePrescribedCompletions` for this construction.

The sources are [CHT][cht], Lemma 4.1.2, statement p. 116 and proof p. 117.

*Needs:* [Layer 2, Extending finite local characters](#target-cht-character-extension); [Layer 2, Generating Frobenius primes](#target-frobenius-primes-generate); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

<a id="target-moret-bailly-three-local-conditions"></a>
### 2.17 Three kinds of local conditions

For a smooth geometrically connected variety over a number field K, handle three finite sets of local opens: K_v-valued opens prescribing complete splitting, K_v^nr-valued opens prescribing unramified extensions, and K̄_v-valued opens allowing finite local extension. Require the relevant local Galois invariance and nonemptiness. Obtain a finite Galois K′/K, disjoint from a specified finite extension, and a point with every local embedding satisfying the corresponding open. The first set splits in K′ and the second is unramified. Keep these three conditions distinct when auxiliary moduli points are available only after a local extension.

Use `moretBaillyThreeLocalConditions` for this construction.

The sources are [Qian][qian], Proposition 4.2, statement and application, §4, p. 23 (arXiv v1).

*Needs:* [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [Layer 2, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); [Layer 2, Local density and integral points](#target-density-of-algebraic-and-separable-local-points).

<a id="target-moret-bailly-over-a-preliminary-extension"></a>
### 2.18 Approximation above a preliminary field

Let M/K be finite Galois, split at S₁ and unramified at S₂, and take a smooth geometrically connected T/M with the three kinds of nonempty invariant local opens at every place above S. Let L/K be finite Galois and disjoint from M/K. Obtain finite Galois K′/K containing M, disjoint from L, and a point in T(K′) satisfying all local conditions. Local invariance is over M_w; no extra equivariance of the opens under Gal(M/K) is required. Smoothness and geometric connectedness of the Weil restriction follow from the splitting of its base change to K̄ into the product of the conjugates of T, and its local points are the product of the local points of T over the places above v.

Use `moretBaillyAbovePreliminaryField` for this construction.

The sources are [BLGHT][blght], Proposition 6.2, pp. 40–41.

*Needs:* [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [Layer 2, Disjointness through towers](#target-tower-linear-disjointness); `AbelianSchemesAndArithmeticModuli:A6`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); `AlgebraicModuliForArithmeticGeometry:R09.3` (`r093-restriction-algebraicity`, `r093-restriction-base-change`).

<a id="target-snowden-soluble-preliminary-field"></a>
### 2.19 Soluble preliminary fields and split extensions

For a smooth geometrically connected number-field variety with finite local Galois extensions L_v and compatible nonempty invariant opens, choose a finite soluble Galois F₁/F and a finite Galois F₂/F. Arrange F₁ ⊗_F L_v split, F₂ split at the separately prescribed set S and after extension to each L_v, and F₂ disjoint from F₁ and the avoidance field. A point over F₁F₂ lies in every Ω_v under every F-embedding into L_v. Splitting over L_v is a scalar-extension condition; it does not identify the completions of F₂ with L_v.

Use `snowdenSolublePreliminaryField` for this construction.

The sources are [Snowden v1][snowden], Proposition 8.2.2 and proof, p. 26.

*Needs:* [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); `AbelianSchemesAndArithmeticModuli:A6`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); `AlgebraicModuliForArithmeticGeometry:R09.3` (`r093-restriction-algebraicity`, `r093-restriction-base-change`).

<a id="target-surjective-specialisation-finite-quotient"></a>
### 2.20 Surjective specialization of finite quotients

Let F be imaginary CM and Galois over ℚ, and let T/F be smooth and geometrically irreducible. Fix a finite avoidance extension and a finite set S₀ of rational primes. For every v|l with l∈S₀, give finite Galois L_v/F_v, compatible under the G_(ℚ_l)-action by σ(L_v)=L_(σv), and a nonempty open Gal(L_v/F_v)-invariant Ω_v⊆T(L_v). Choose a CM F′/F, Galois over ℚ and disjoint from the avoidance field, and a point P∈T(F′), with F′_w≅L_v and P_w∈Ω_v for every w|v. For any surjective finite quotient f:π₁^ét(T)→G, require also f∘P_*:G_F′→G surjective. The finite étale torsor combines this quotient condition with the completion conditions.

Use `surjectiveSpecialisation` for this construction.

The sources are [Bianchi potential automorphy][bianchi], Proposition 4.5.1 and proof, pp. 48–49.

*Needs:* [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); `AbelianSchemesAndArithmeticModuli:A6`; `InverseGaloisAndArithmeticFundamentalGroups` IG.1.1 (étale fundamental groups and the arithmetic exact sequence) and IG.2.6 (full-group specialization of finite quotients); `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); `AlgebraicModuliForArithmeticGeometry:R09.3` (`r093-restriction-algebraicity`, `r093-restriction-base-change`).

<a id="target-function-field-isomorphism-torsor"></a>
### 2.21 The function-field isomorphism torsor

Let X,Y be smooth geometrically connected curves over F_q, K=F_q(X), F=F_q(Y), H finite, and φ:π₁(X)→H and ψ:π₁(Y)→H. On Y_K construct Z=Isom_(Y_K,H)(X_φ,X_ψ), finite étale over Y_K. If ψ is surjective on the geometric fundamental group, Z is geometrically connected. It is a K-curve, not a finite K-scheme. For finite separable K′/K and z∈Z(K′) whose image does not come from Y(F̄_q∩K′), the nonconstant image defines an F_q-embedding β:F→K′, and β*ψ is conjugate to φ|G_K′. Include this nonconstant-image condition in the specialization API.

Use `functionFieldIsomTorsor` for this construction.

The sources are [BHKT][bhkt-published], Lemma 9.1 and diagram (9.1), published pp. 76–77; [Beuzart-Plessis–Harris–Thorne][bhkt-correction], p. 28, Isom-scheme paragraph.

*Needs:* `SchemeAndStackFoundations:SF.1` (finite étale torsors and Isom schemes); `InverseGaloisAndArithmeticFundamentalGroups` IG.1.1 (étale fundamental groups, the geometric fundamental group and the arithmetic exact sequence).

<a id="target-function-field-point-with-fixed-constants"></a>
### 2.22 Function-field points with fixed constants

Apply the function-field approximation construction with a proper closed subset excluded, preserving the constant field F_q and disjointness from a finite Galois avoidance extension. Obtain a finite Galois K′/K with the stated local splitting and a nonconstant specialization β such that β*ψ is conjugate to φ. Require geometric connectedness of the relevant torsor and the constant-field conditions separately; the embedding of the function field comes from the nonconstant image. Use the corrected BHKT statement rather than a zero-dimensional interpretation of its Isom torsor.

The output satisfies K′∩F̄_q=F_q and identifies β*ψ with φ|G_K′ up to H-conjugacy.

Use `fixedConstantField` for this construction.

The sources are [BHKT][bhkt-published], Proposition 9.2 and proof, published p. 78.

*Needs:* [Layer 2, The function-field isomorphism torsor](#target-function-field-isomorphism-torsor); [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Generating Frobenius primes](#target-frobenius-primes-generate); [Layer 2, Chebotarev density for global function fields](#target-function-field-chebotarev).

<a id="target-potential-global-galois-local-data"></a>
### 2.23 Potential realization of local Galois data

Let K be a global field, S a finite set of places, H a finite group, and M_v/K_v finite Galois extensions with embeddings Gal(M_v/K_v) ↪ H. There is a finite K′/K split at S and an H-Galois extension M/K′ realizing these completions and decomposition-group embeddings up to conjugacy. At real places prescribe elements of order dividing two. For totally real number fields, Calegari's refinement permits K′/K to be totally real and Galois and the resulting M to avoid a prescribed finite field over K. The function-field assertion here is BHKT Theorem 9.3; its conclusion does not include these extra Galois, avoidance or fixed-constant-field properties of K′.

Use `potentialGlobalGaloisLocalData` for this construction.

The sources are [BHKT][bhkt-published], Theorem 9.3, published pp. 78–79; [Calegari][calegari], Proposition 3.2 and proof, author pp. 5–6.

*Needs:* [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [Layer 2, The function-field isomorphism torsor](#target-function-field-isomorphism-torsor); [Layer 2, Function-field points with fixed constants](#target-function-field-point-with-fixed-constants); `SchemeAndStackFoundations:SF.1`; `InverseGaloisAndArithmeticFundamentalGroups` IG.1.1.

### Examples

The split tensor algebra is compared with prescribed completions, and the rigidified Picard tests separate boundary trivializations from unrigidified line-bundle classes.

### Dependencies

This layer uses `AbelianSchemesAndArithmeticModuli`, `AlgebraicModuliForArithmeticGeometry`, `SchemeAndStackFoundations`, `mathlib`, `tauceti`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r23-2"></a>
## Layer 3: Auxiliary characters and moduli


Choose the arithmetic data before applying the geometric theorem. The moduli scheme, torsion pairings and local points come from H6; this layer combines their specified components with local approximation and field avoidance.

<a id="target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions"></a>
### 3.1 CM characters with simultaneous local reductions

Let O be the integers in a finite extension of ℚ_p, with residue field k. Let K be totally real and L/K totally imaginary quadratic, split at all places above p. Take a finite set S of finite places containing those above p and split in L, and choose S_L with exactly one place above each member of S. Let φ:G_K→O^× be continuous and odd, equal to ε_p^n times a finite-order character for n∈ℤ, and choose continuous ψ̄_x:G_L_x→k^× for x∈S_L. Over a finite coefficient extension with integers O′, construct continuous ψ:G_L→O′^×, finitely ramified at the prescribed places, reducing to every ψ̄_x, and satisfying det Ind_(G_L)^(G_K)ψ=φ. The algebraic character and reciprocity construction is supplied by its owner; this theorem imposes the simultaneous local reductions needed by auxiliary torsion.

Use `taylorLemma11` for this construction.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Lemma 1.1 and proof, printed pp. 7-9.

*Needs:* `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

<a id="target-taylor-auxiliary-data-p-l-psi-n-m"></a>
### 3.2 Auxiliary primes, characters and coefficient fields

Let l be odd, k/F_l finite and F totally real. Assume continuous ρ̄:G_F→GL₂(k) has insoluble image, determinant ε̄_l, and shape (ε̄_lχ_v⁻¹,*;0,χ_v) at each v|l. Let F̃_v/F_v be the smallest totally tamely ramified extension making χ_v unramified. For ζ of order #k−1 set N₀=ℚ(ζ,√(1−4l)); choose λ₀|l with residue field k at which a=(1+√(1−4l))/2 is a unit, reducing to 1. Write q_v=l^[k(v):F_l] and choose β_v=ζ^(b_v)a^[k(v):F_l] reducing to χ_v(φ_v) for a Frobenius lift in G_F̃_v. If χ_v²≠1, define χ̃_v with this Frobenius value and Teichmüller inertia; if χ_v²=1 take the Teichmüller character.

Choose a prime p>3, p≠l, such that ρ̄ is unramified at every w|p with distinct Frobenius eigenvalues, p splits completely in the Hilbert class field of N₀ and in the field cutting out ε̄_l⁻¹det ρ̄, and p avoids every β_v−β_v^c. In the χ_v²=1 branch also exclude p dividing q_v−1. The field cut out by ε̄_l⁻¹det ρ̄ contains F, so p splits completely in F and F_w=ℚ_p for every w|p. Fix ℘₀|p and, for w|p, choose α′_w in the ring of integers of ℚ(a) of norm p and prime to ℘₀; multiply by ζ^(a_w) to get α_w reducing to a residual Frobenius eigenvalue at λ₀. These are exactly the conditions (C2)–(C3) of the input contract of HilbertModularVarietiesAndShimuraCurves H6.5, together with p>3, which the crystalline lifting theorem of §4.5 needs when §4.6 applies it.

Such primes exist and have positive density. Let M₁ be the Galois closure over ℚ of the compositum of F, the Hilbert class field of N₀ and the field cut out by ε̄_l⁻¹det ρ̄, and M′ its compositum with the Galois closure of the field cut out by ρ̄. By Chebotarev it suffices to find σ∈Gal(M′/M₁) such that ρ̄(gσg⁻¹) has distinct eigenvalues for every g∈Gal(M′/ℚ); the finitely many primes p≤3, p=l, p|β_v−β_v^c and p|q_v−1 are then discarded. An element of GL₂ has a repeated eigenvalue exactly when its image in PGL₂ is trivial or unipotent. The projective image P of ρ̄ is insoluble, hence almost simple with nonabelian simple socle S (Dickson). Its image P₁=proj ρ̄(Gal(M′/M₁)) is normal in P, and it is nontrivial. Otherwise the projective field lies in M₁; the subgroup Gal(M₁/F^gal) is soluble (M₁ is generated over F^gal by conjugates of soluble and abelian extensions) and normal in Gal(M₁/F), so it acts on the projective field through a soluble normal subgroup of the almost simple group P, hence trivially. The projective field would then lie in the totally real field F^gal, on which every complex conjugation acts trivially, contradicting total oddness of ρ̄. Hence P₁⊇S. The map σ↦(proj ρ̄(gσg⁻¹))_g on the finite-index normal subgroup of Gal(M′/M₁) landing in S in every coordinate has image a subdirect product of copies of S, hence a product of diagonal copies twisted by automorphisms; an element whose components in each diagonal copy are semisimple, nontrivial and of order prime to l has every coordinate of order prime to l and different from 1, so all ρ̄(gσg⁻¹) have distinct eigenvalues.

Choose a totally imaginary quadratic L/F, split at every v|l and w|p and not contained in F(ζ_p). Construct ψ with det Ind ψ=ε_p, reduction χ̃_v at the chosen v₁|v, and unramified local character at each w₁|p with Frobenius value lifting α_w. The reductions of ψ and ψ^c differ on the full local decomposition groups above l; inertia alone need not distinguish them. Enlarge N₀ to a Galois CM N in which its l-adic places split and its p-adic places are unramified, large enough for the chosen ψ̄-values at a place ℘|℘₀. Choose λ|λ₀ and let M be the maximal totally real subfield. The norm β_vβ_v^c is q_v, not the auxiliary prime p.

The construction has the following API:

- `TaylorAuxiliaryData`: The data (p, ℘₀, α_w, L, ψ, N, ℘, λ, M) with the stated properties, for a ρ̄ satisfying Taylor's standing hypotheses.
- `TaylorAuxiliaryData.exists`: Such data exist, with p>3 (the Chebotarev argument above for p, then Lemma 1.1 for ψ, then a CM extension N/N₀). They satisfy the input contract (C1)–(C6) of H6.5; (C6) is arranged by enlarging N so that N/M is ramified at a finite place.
- `TaylorAuxiliaryData.det_ind`: det Ind_{G_L}^{G_F} ψ = ε_p.
- `TaylorAuxiliaryData.psi_ne_conj`: ψ̄|G_{v₁} ≠ ψ̄^c|G_{v₁} for v | l: β_vβ_v^c=q_v when χ_v²≠1, with p∤β_v−β_v^c; when χ_v²=1 use the additional exclusion p∤q_v−1. The full decomposition group is required; the inertia characters may agree.
- `TaylorAuxiliaryData.split`: Every place of F above l and above p splits in L; L is totally imaginary and not contained in F(ζ_p).
- `TaylorAuxiliaryData.prime_ne_l`: The chosen auxiliary prime p is different from the original residual prime l, and p>3.
- `TaylorAuxiliaryData.conj_conj`: Conjugating the auxiliary character twice gives the original character; the involution is the nontrivial element of Gal(L/F).
- `TaylorAuxiliaryData.det_ind_apply`: For g∈G_F, det(Ind ψ(g))=ε_p(g); this is a pointwise evaluation of the determinant identity.

**Checks.**

- `taylorAux_N0_l5`: For l = 5 and k = F_5: ζ has order 4 and N₀ = ℚ(ζ₄, √−19); 5 does not divide 1 − 4·5 = −19, so 5 is unramified in N₀.
- `taylorAux_det_needed`: The simultaneous alternating torsion pairing requires det ρ̄=ε̄_l. A different determinant, such as ε̄_lω², cannot supply that pairing; also check the stored identity det Ind ψ=ε_p.
- `taylorAux_alpha_norm`: For α_w of algebraic norm p, diag(α_w,α_w^c) has determinant p. This is an algebraic norm calculation, not a p-adic cyclotomic value of a Frobenius lift at p.
- `taylorAux_not_in_cyclotomic`: L ⊄ F(ζ_p) is part of the data; a quadratic subfield of F(ζ_p) is not allowed.
- `taylorAux_local_decomposition`: The auxiliary object has a full local decomposition-group element on which ψ̄ and ψ̄^c differ; distinction need not hold on inertia.
- `taylorAux_beta_norm`: With l=5, residue degree one and a²−a+5=0, a^c=1−a and aa^c=5, which differs from the auxiliary p≠5.
- `taylorAux_oddness_used`: if ρ̄ were even, its projective field could lie in the totally real Galois closure of F, and every prime splitting completely in F would have scalar projective Frobenius; total oddness is what makes the prime choice possible.

Use `TaylorAuxiliaryData` for this construction.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], section 1, standing hypotheses, printed p. 6, choice of p, printed p. 7, choice of L, psi, N, M, printed p. 9, choice of N, printed p. 9; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Corrections to [Tay4], first bullet, p. 776.

*Needs:* [Layer 3, CM characters with simultaneous local reductions](#target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions); [Layer 2, Generating Frobenius primes](#target-frobenius-primes-generate); `HilbertModularVarietiesAndShimuraCurves` H6.5 (the input contract (C1)–(C6) that these data satisfy); `ArithmeticGaloisRepresentations` Layer 4 (Dickson's classification of subgroups of PGL₂); `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="target-local-points-at-l-p-infinity-and-the-point-over-e"></a>
### 3.3 The twisted Hilbert moduli application

Use the twisted Hilbert torsion moduli space X/K supplied by H6, with the prescribed real multiplication, ordered polarization module and identifications of A[λ] with ρ̄ and A[℘] with Ind ψ̄ carrying the fixed alternating forms to the Weil pairings; X is smooth and geometrically connected. Take the nonempty local opens at the places above l, p and infinity built from the explicit local points of H6.4 and H6.5. At the places above p (where K_w=ℚ_p) choose the open inside the locus of points whose abelian variety has good ordinary reduction; it contains the good ordinary point of H6.5 (O3). Where the construction gives K_v-points require splitting; where it gives points only over an unramified or a finite ramified extension (the places above l in cases (O1) and (O2) of H6.5) use the corresponding local condition of Layer 2. The integral-point theorem then gives a finite Galois totally real E/K, split at every place above p and with the prescribed behaviour at l and at infinity, linearly disjoint from the avoidance field, and an M-Hilbert–Blumenthal abelian variety A/E with A[λ]≅ρ̄|G_E and A[℘]≅Ind ψ̄|G_E, having good ordinary reduction at every place above p. In particular p splits completely in E.

The good-reduction locus at w|p is open. Forgetting the ℘-level structure gives a finite étale map from X⊗K_w to the moduli space with only the λ-level structure, which is prime to p and rigidifies the problem. That space has a smooth model over ℤ_p, because p is unramified in M; its ℤ_p-points form an open subset of its ℚ_p-points, and they are exactly the points whose abelian variety has good reduction (Néron–Ogg–Shafarevich, with the polarization, the O_M-action and the prime-to-p level structure extending by the Néron property). The reduction map on ℤ_p-points is locally constant and the ordinary locus is open in the special fibre, so the good ordinary locus is open; its preimage in X(K_w) is open.

Use `localPointsTwistedHilbertModuli` for this construction.

**Checks.**

- `aux_points_good_reduction_open`: a point of X(K_w) whose abelian variety has multiplicative reduction lies outside the chosen open; the Tate-HBAV points of H6.5 (O1) occur only at places above l, never at the auxiliary places above p.
- `aux_points_split_at_p`: because the local points at w|p are K_w-rational and K_w=ℚ_p, the field E is split at every place above p and p splits completely in E.
- `aux_points_forget_level`: the ℘-level structure has p-power level and is not étale over ℤ_p; the openness argument forgets it before using the integral model.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], the moduli space and its local points, printed p. 13; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], the analogous twisted moduli space and the application of Moret-Bailly's theorem at the end of the proof of Proposition 4.1, p. 762.

*Needs:* [Layer 3, Auxiliary primes, characters and coefficient fields](#target-taylor-auxiliary-data-p-l-psi-n-m); `HilbertModularVarietiesAndShimuraCurves` H6.2 (twisted Hilbert torsion moduli), H6.3 (component descent), H6.4 (real points), H6.5 (finite local points) and H6.9 (the geometric and local input export); `HilbertModularVarietiesAndShimuraCurves` H2.2 (the integral Hilbert model at good primes) and H2.6 (the ordinary locus is open); `NeronModelsAndSemistableAbelianVarieties` §5.1 (Néron–Ogg–Shafarevich); `ReductiveGroupsPartII` RG2.0.1 (the topology on local points, integral points open); [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions).

<a id="target-restriction-of-scalars-moduli-application"></a>
### 3.4 The Weil-restricted moduli application

For a finite totally real F₁/F and the smooth geometrically connected auxiliary X/F₁, use Weil restriction to form Res_(F₁/F) X. It has the same smoothness and geometric connectedness, and its F_v-points are ∏_(w|v) X(F₁,w). Apply approximation to these product opens over F, avoiding F₁ together with the prescribed avoidance field. This gives a totally real Galois F′/F disjoint from their compositum and an auxiliary moduli object over F₁F′. Weil restriction, its representability and the torsion/polarization objects are imported from A6 and H6.

Use `restrictedAuxiliaryModuli` for this construction.

The sources are [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proof of Proposition 9.1.11, p. 458.

*Needs:* `HilbertModularVarietiesAndShimuraCurves:H6`; `AbelianSchemesAndArithmeticModuli:A6`; [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); `AlgebraicModuliForArithmeticGeometry:R09.3` (`r093-restriction-algebraicity`, `r093-restriction-base-change`).

### Examples

The checks on the auxiliary prime, the conjugate character and the separate local points at l, p and infinity constrain the auxiliary construction.

### Dependencies

This layer uses `AbelianSchemesAndArithmeticModuli`, `HilbertModularVarietiesAndShimuraCurves`, `tauceti`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r23-3"></a>
## Layer 4: Residual potential modularity


Prove residual modularity independently of existence of a lift of the original representation. Taylor’s ordinary and niveau-two arguments supply the weight and level refinements; Snowden’s totally real theorem and the two-prime refinement have their own hypotheses and outputs.

<a id="target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l"></a>
### 4.1 The ordinary auxiliary Tate module

For the auxiliary M-Hilbert–Blumenthal abelian variety A/E with A[λ]≅ρ̄|G_E and A[℘]≅Ind ψ̄|G_E, take v|l unramified over ℚ_l and x|v in E. Assume χ_v²|I_v=ε̄_l^n with 0≤n<l−1, and exclude n=1 if ρ̄|G_v is semisimple. Then T_λA⊗ℚ_l has shape (ε_l(χ′_v)⁻¹,*;0,χ′_v) on G_x, for a tamely ramified lift χ′_v of χ_v. The differential inertia calculation uses ω⁻¹; this is what forces n=1 in the excluded semisimple branch. The finite-flat group-scheme inertia and CDT inputs belong to their local owners.

Use `taylorLemma15` for this construction.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Lemma 1.5 and proof, printed pp. 14-15, proof of Lemma 1.5, printed p. 14, proof of Lemma 1.5, printed p. 15.

*Needs:* [Layer 3, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations"></a>
### 4.2 Quaternionic forms and Hecke–Galois realizations

Take F totally real of even degree, D ramified exactly at infinity, weights k_σ≥2 with w=k_σ−1+2w_σ independent of σ, and continuous central character ψ agreeing with (Na)^(1−w) on an open subgroup of F_l^×. The quaternionic form space is a semisimple admissible representation of GL₂(A_F^(∞,l)); its U^l-invariants are the specified finite-level form space. After extending coefficients to ℂ, its quotient by reduced-norm functions decomposes into the regular algebraic cuspidal π of these weights and central character. Reduced-norm functions occur only in parallel weight two; at that weight the full decomposition also contains characters χ with χ²=ψ.

The corresponding Hecke algebra has a continuous Galois representation unramified at x∤𝔫l, with trace T_x and determinant ε_l(ψ∘Art⁻¹). At a non-Eisenstein maximal ideal it has an integral Carayol realization over the localized Hecke algebra. This algebra is generated by the U_(ϖ_x) for x|𝔫, x∤l and T_x at almost all other primes. The definite class sets and the fixed-central-character forms are HilbertModularVarietiesAndShimuraCurves R18.3.1–R18.3.3, the Jacquet–Langlands realization is R18.3.22, and the Galois representation over the localized quaternionic Hecke algebra is AutomorphicGaloisRepresentations §6.10; this target fixes Taylor's weight and central-character normalization on them.

Use `quaternionicHeckeGaloisRealisation` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §1, Lemma 1.3, p. 740 (PDF page 12), §1, proof of Lemma 1.3, p. 741 (PDF page 13), §1, the representations ρ and ρ_𝔪, p. 742 (PDF page 14).

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `HilbertModularVarietiesAndShimuraCurves` R18.3.1, R18.3.3 and R18.3.22; `AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic` (§6.10); `AutomorphicGaloisRepresentations:R19.2`; `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`.

<a id="target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l"></a>
### 4.3 Fontaine–Laffaille shapes of quaternionic forms

Let x∤𝔫 be a split place above l with 2≤k_x≤l−1, and let 𝔪 be non-Eisenstein in the quaternionic Hecke algebra. For an open ideal I of h_𝔪, identify ((ρ_𝔪⊗ε_l^(−w_x)) mod I)|G_x with the Fontaine–Laffaille realization of D in the specified local category, with D≠D⁰ and D⁰≠0. Consequently residual inertia is either ω₂^(k_x−1+(l+1)w_x)⊕ω₂^(l(k_x−1)+(l+1)w_x), or triangular (ω^(k_x+w_x−1),*;0,ω^(w_x)). Preserve the explicit twist and the split-place Fontaine–Laffaille interval. The torsion statement follows from the characteristic-zero one: (ρ_𝔪⊗ε_l^(−w_x)) mod I is a subquotient of a G_x-stable lattice in a direct sum of the representations attached to the eigenforms of the localized space, each crystalline at the split place x with weights in [0,l−2] (Hilbert local behaviour at l), and the essential image of the Fontaine–Laffaille functor is stable under subquotients.

Use `localResidualInertialShape` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §1, proof of Corollary 1.5, p. 743 (PDF page 15).

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion`; `AutomorphicGaloisRepresentations:R19.5/hilbert-local-behaviour-at-p`; `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `PadicHodgeTheory:R06.4`; `AutomorphicGaloisRepresentations:R19.5`.

<a id="target-skinner-wiles-level-adjustment"></a>
### 4.4 Level adjustment after a soluble totally real base change

Let p be odd, F totally real and ρ̄:G_F→GL₂(F̄_p) irreducible and associated with a Hilbert newform f of parallel weight two and level n_f, written n_f=n_f^(p)n_f′ with n_f^(p) supported above p and n_f′ prime to p. Then there is a finite soluble Galois totally real F′/F in which every place above p splits completely, such that ρ̄|G_F′ is still irreducible and is associated with a weight-two newform g over F′ whose level divides n_f^(p)∏_(q∈S)q, where S is the set of places of F′ not above p at which ρ̄|G_F′ is ramified. If f is ordinary, or nearly ordinary, at the places above p, g can be taken with the same property; if moreover ρ̄ is D_v-distinguished at every v|p and f is χ₂-good, then so are ρ̄|G_F′ and g. The field F′ can also be required to have prescribed splitting and ramification at a finite set of places of F outside the level of f, and to have even degree. In applications S is made empty first: a soluble totally real base change with prescribed completions kills the finite residual inertia away from p, and the level of g then divides n_f^(p).

The proof is the Skinner–Wiles argument. After an even-degree cyclic base change in which the places above p split, and further cyclic base changes, the local components of f at the primes of n_f′ are special of conductor q with unramified central character and Nq≡1 mod p. Transfer to the definite quaternion algebra D ramified exactly at the infinite places by the level-by-level Jacquet–Langlands–Shimizu isomorphism. At a prime q of n_f′ where ρ̄ is unramified, the exactness of the two-copy degeneracy sequence (Ihara's lemma for D), the stabiliser-weighted pairing and the trace maps between levels give a congruence to a form of level n_f/q. Induction on the number of such primes, with a soluble base change at each step making Nq≡1 mod p, removes them. Base change preserves cuspidality because ρ̄ stays irreducible over every field of the tower.

**Checks.**

- `sw_level_already_minimal`: if ρ̄ is ramified at every prime of n_f′, then S contains all of them and the bound is n_f itself; no level is removed.
- `sw_level_one`: for the CM seed of §4.6, whose level is prime to p and whose residual representation is unramified away from p over F, the bound n_f^(p)∏_(q∈S)q equals 1, so g has level one.
- `sw_prescribed_splitting_outside_level`: prescribed splitting at a place in the level of f is not part of the conclusion; such a place can stay ramified in the residual representation over F′.

Use `skinnerWilesLevelAdjustment` for this construction.

The sources are [Skinner–Wiles, base change][sw-base-change], main theorem and the remark following it, p. 17; reduction steps, p. 18; the definite quaternion algebra, Jacquet–Langlands–Shimizu and the pairing, pp. 18–20; Lemma 1 and the level-lowering congruence, pp. 20–25.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.3` (global Jacquet–Langlands with the level-by-level Hecke compatibility); `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`; `OrdinaryAutomorphicFormsAndModularityLifting` §1.4 (the stabiliser-weighted pairing and Hecke adjoints), §1.5 (trace maps between levels), §2.9 (Ihara's lemma for definite quaternionic forms) and §2.10 (exactness at deeper level); `HilbertModularVarietiesAndShimuraCurves:R18.3` (definite class sets); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions).

<a id="target-taylor-crystalline-lifting"></a>
### 4.5 Crystalline lifting in the Fontaine–Laffaille range

Let l>3 be prime, 2≤k≤l−1, and F a totally real field of even degree in which l splits completely. Let ρ:G_F→GL₂(O) be continuous, irreducible and unramified outside finitely many places, with O the integers of a finite extension of ℚ_l inside Q̄_l, such that ρ|G_x is crystalline with Hodge–Tate numbers 0 and 1−k at every place x above l. Assume that ρ̄ restricted to G_F(√l*), l*=(−1)^((l−1)/2)l, is irreducible, and that there are a regular algebraic cuspidal π of GL₂(A_F) of weight k, unramified at every finite place, and an embedding λ of its coefficient field into Q̄_l with ρ̄_(π,λ)≅ρ̄. Then ρ≅ρ_(π′,λ′) for a regular algebraic cuspidal π′ of weight k and an embedding λ′.

The proof first twists: det ρ/det ρ_(π,λ) has finite l-power order, so after twisting π (l>2) the determinants agree. Then it is the minimal R=T theorem: for every finite set Σ of finite places not above l, the map from the deformation ring R_Σ to the quaternionic Hecke algebra h_Σ is an isomorphism of complete intersections and the space of forms S_Σ is free over h_Σ. Here R_Σ classifies deformations of ρ̄ with the fixed determinant, Fontaine–Laffaille at the places above l (each F_x=ℚ_l, weights 0 and k−1 with k−1≤l−2) and unrestricted at Σ; h_Σ acts on forms on the definite quaternion algebra ramified exactly at infinity, of the corresponding weight and level. Prove it by the Taylor–Wiles method with Diamond's and Fujiwara's simplification: Taylor–Wiles sets of size h¹ exist because ρ̄|G_F(√l*) is irreducible and l>3; the Fontaine–Laffaille local conditions are formally smooth; patching gives a free module over a power-series ring, hence the isomorphism and freeness. The irreducibility hypothesis is on F(√l*), which is the field the Taylor–Wiles prime argument needs in this setting.

**Checks.**

- `taylor33_l_three_excluded`: l=3 is excluded; the prime-selection step uses l>3.
- `taylor33_weight_range`: k=l lies outside the hypothesis 2≤k≤l−1: the Fontaine–Laffaille window [0,l−2] does not contain the weights {0,l−1}.
- `taylor33_split_needed`: an inert place above l (F_x≠ℚ_l) is outside the hypothesis, so the theorem is not applied over a field in which l does not split completely.
- `taylor33_semistable_excluded`: a member with nonzero monodromy at a place above l, such as the Tate module of a Tate curve, is not crystalline, so the theorem does not apply to it.

Use `taylorCrystallineLifting` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Theorem 3.2 and Theorem 3.3 with its proof, p. 755; §2, the deformation rings and Hecke algebras with Lemmas 2.1–2.5 (Lemma 2.5 gives the Taylor–Wiles primes), pp. 745–750; §3, Lemma 3.1 and the argument for Theorem 3.2, pp. 751–755.

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); [Layer 4, Fontaine–Laffaille shapes of quaternionic forms](#target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l); `LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition`; `LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness`; `GlobalGaloisDeformations` §5.7 (existence of Taylor–Wiles primes for odd p, in Taylor's setting); `GlobalGaloisDeformations` §5.1 (Taylor–Wiles data) and §6.4 (the Taylor–Wiles system of deformation rings); `DeformationAndDerivedPatchingAlgebra:R03.5`; `DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-of-free`; `GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

<a id="target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar"></a>
### 4.6 Modularity transfer through the auxiliary variety

Let E be a totally real field, M a number field and A/E an abelian variety of dimension [M:ℚ] with O_M↪End_E(A), so that every Tate module T_μA is free of rank two over O_(M,μ); for M totally real this is an M-Hilbert–Blumenthal abelian variety (Taylor 2002), and Taylor 2006 uses a CM coefficient field. Let p>3 be a prime that splits completely in E, ℘|p a prime of M unramified over p, and suppose: A has good reduction at every place of E above p; A[℘]≅Ind_(G_E′)^(G_E)ψ̄ for a quadratic CM extension E′/E in which every place above p splits, with ψ̄ a character of G_E′; at each place w|p of E the two characters of A[℘]|G_w are one unramified and one of the form ε̄_p times an unramified character; and the CM form attached to the algebraic Hecke character lifting ψ̄ (by automorphic induction from E′) has weight two and level prime to p. Then T_℘A is modular over E: there is a regular algebraic cuspidal π of GL₂(A_E) of parallel weight two with ρ_(π,℘)≅T_℘A⊗ℚ. Consequently ρ_(π,μ)≅T_μA⊗ℚ for every prime μ of M, and for every μ the residual representation A[μ] is modular over E. This is the step that turns the auxiliary point of Layer 3 into a residual modular witness for ρ̄=A[λ].

Prove it by the base change, crystalline lifting and descent argument that Taylor gives as the alternative at the end of the proof of his Proposition 4.1; it does not use a nearly ordinary lifting theorem whose residual-image hypothesis excludes residual representations induced from a CM extension split above p.

1. Crystallinity. Good reduction at w|p makes T_℘A|G_w crystalline, with Hodge–Tate numbers 0 and −1 in Taylor's convention.
2. Residual irreducibility over E(√p*). The extension E′/E is split above p, whereas E(√p*)/E is ramified there, so the two are distinct and E′E(√p*) is a biquadratic extension. On inertia at a place of E(√p*) above p, which has index two in the inertia of ℚ_p, the ratio of the two local characters is ε̄_p restricted to that subgroup, of order (p−1)/2. This is nontrivial exactly because p>3, so ψ̄≠ψ̄^c on G_(E′E(√p*)) and the induced representation stays irreducible on G_(E(√p*)). The same argument works over every totally real extension of E in which p splits completely.
3. The seed. Choose a finite soluble Galois totally real E₁/E, split at every place above p, killing the finite residual inertia of Ind ψ̄ at the finitely many ramified places away from p (Layer 2). Base change the CM form to E₁; it stays cuspidal because the residual representation is irreducible over E₁, and its level stays prime to p. Apply the level adjustment of §4.4 to it: over a soluble Galois totally real E₂/E₁ of even degree in which p splits completely, ρ̄_℘ is the residual representation of a weight-two form of level one, because the residual representation is unramified away from p over E₁ and the p-part of the level is trivial.
4. Lifting. Over E₂ the representation T_℘A satisfies the hypotheses of the crystalline lifting theorem with l=p and k=2: p>3, 2≤2≤p−1, E₂ has even degree and p splits completely in it, T_℘A is crystalline of Hodge–Tate numbers 0 and −1 above p, its residual representation is irreducible on G_(E₂(√p*)) by step 2, and the seed of step 3 is unramified at every finite place. Hence T_℘A|G_E₂ is modular.
5. Descent. The tower E₂/E is soluble and Galois, and T_℘A is irreducible on G_E₂ (its residual representation is). Descend through the cyclic steps: at each step the automorphic representation upstairs is invariant under the Galois group, since its Galois representation is the restriction of T_℘A, so it descends to a cuspidal representation whose Galois representation is T_℘A twisted by a character of the step; choose the twist that recovers T_℘A.
6. Other primes. The traces of Frobenius on T_μA lie in M and do not depend on μ (for an abelian variety of this type the O_M-linear characteristic polynomial of Frobenius has coefficients in M independent of μ); by Chebotarev and Brauer–Nesbitt, ρ_(π,μ)≅T_μA⊗ℚ for every μ, and reducing modulo μ gives the residual witnesses.

The descent returns to E. The intermediate fields E₁ and E₂ may fail the splitting conditions at the starting prime of Layer 3, whereas E, produced by the approximation step there, has them; the output is therefore stated over E.

**Checks.**

- `aux_transfer_p_three`: for p=3 the ratio ε̄₃ restricted to the index-two inertia subgroup is trivial, so step 2 fails and p=3 is excluded (`Auxiliary.half_order_gt_one` in Suggested.lean records the order (p−1)/2>1 for p>3).
- `aux_transfer_tate_curve`: a member with multiplicative reduction at a place above p, such as the Tate module of a Tate curve, has nonzero monodromy and is not crystalline, so step 1 fails without good reduction.
- `aux_transfer_level_one`: for the CM seed with level prime to p and a residual representation unramified away from p after the first base change, the level bound of §4.4 is 1.
- `aux_transfer_descent_field`: the conclusion is over E, not over E₂, so the splitting conditions imposed on E in Layer 3 are retained.

Use `auxiliaryModularityTransfer` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], end of the proof of Proposition 4.1 (the alternative through the main theorem of Skinner–Wiles' base change paper, Theorem 3.3 and descent), pp. 762–763; [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], the auxiliary variety and its torsion, printed pp. 13–15; [Skinner–Wiles, base change][sw-base-change], main theorem, p. 17.

*Needs:* [Layer 4, Level adjustment after a soluble totally real base change](#target-skinner-wiles-level-adjustment); [Layer 4, Crystalline lifting in the Fontaine–Laffaille range](#target-taylor-crystalline-lifting); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`; `GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface`; `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction` (automorphic induction of the CM Hecke character); `AutomorphicGaloisRepresentationsPartII:AG2.0` (the ℘-adic character of an algebraic Hecke character); `NeronModelsAndSemistableAbelianVarieties` §5.1 (Néron–Ogg–Shafarevich) and §5.3 (the p-adic comparison at the residue prime: good reduction gives a crystalline Tate module); `ArithmeticGaloisRepresentations` Layer 6 (Tate modules of abelian varieties with real multiplication) and §5.3 (recognition by Frobenius polynomials); `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`.

<a id="target-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l"></a>
### 4.7 Ordinary residual potential modularity

Let l be odd, k/F_l finite, F totally real, and ρ̄:G_F→GL₂(k) continuous irreducible and totally odd. Suppose at every v|l it has shape (ε̄_lχ_v⁻¹,*;0,χ_v). Obtain finite Galois totally real E/F split at every v|l and a regular algebraic cuspidal π with residual member ρ̄|G_E. At an unramified x|l with nonscalar residual inertia, χ_x²|I_x=ε̄_l^n, 0≤n<l−1 and n≠1 in the semisimple case, require the characteristic-zero ordinary shape with a tamely ramified lift of χ_x. Use Taylor's corrected auxiliary construction and its determinant normalization where that construction is applied.

Corollary 1.7 treats an arbitrary continuous irreducible totally odd residual representation. Choose finite Galois totally real E/F whose l-adic places are unramified of residue degree at most two, with the residual modular witness. For its local ordinary conclusion, at the specified unramified v|l require nonscalar inertia and shape (χ_(v,1),*;0,χ_(v,2)) with **χ_(v,2)χ_(v,1)⁻¹|I_v=ε̄_l^n**. The lifted lower-right character is a tamely ramified lift of χ_(v,2). This ratio condition is on inertia; it does not normalize the determinant on all G_v. The quadratic-field and square-root-character construction must preserve total reality and the stated l-adic conditions.

Use `taylorOrdinaryPotentialResidual` for this construction.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Theorem 1.6, printed p. 15, Theorem 1.6, 'Moreover' clause, printed p. 15, paragraph before Theorem 1.6, printed p. 15, Corollary 1.7, printed p. 16; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Corrections to [Tay4], last bullet, p. 777, same bullet, p. 777.

*Needs:* [Layer 4, Modularity transfer through the auxiliary variety](#target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar); [Layer 4, The ordinary auxiliary Tate module](#target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l); `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

<a id="target-taylor-2006-potential-modularity-when-residually-irreducible-at-l"></a>
### 4.8 The niveau-two potential-modularity theorem

Let l>2 and ρ̄:G_ℚ→GL₂(F̄_l) be continuous odd with inertia ω₂^(k−1)⊕ω₂^(l(k−1)), 2≤k≤l. Obtain a totally real Galois F/ℚ of even degree split at l and a regular algebraic cuspidal weight-two π with residual representation ρ̄|G_F. At x|l its tame WD inertia is ω₂^(k−(l+1))⊕ω₂^(lk−(l+1)). Taylor's Corollary 4.6 permits its central character away from l to be unramified.

In Taylor's construction choose the two auxiliary primes p₁,p₂ by his Chebotarev conditions, which have positive density, and take p₁>3. The twisted moduli space X_ρ has a ℚ_(p₁)-point through its isomorphism with X_Dih over ℚ_(p₁) and the CM point of his Lemma 4.5; that abelian variety has good reduction above p₁, since the CM characters are unramified there and Néron–Ogg–Shafarevich applies. As in §3.3 the good-reduction locus of X_ρ(ℚ_(p₁)) is open, so the Moret-Bailly step can prescribe a local open inside it. The resulting abelian variety B over F, with B[λ] realising ρ̄ and B[℘_i] realising Ind(χ_(℘_i) mod ℘_i), then has good reduction above p₁. Since p₁ splits in the imaginary quadratic M and completely in F, the residual representation B[℘₁] is induced from the CM extension FM, split above p₁, with one unramified and one cyclotomic-times-unramified character above p₁. §4.6 with E=F, coefficient field EM (Taylor's notation), ℘=℘₁ and E′=FM gives the modularity of T_(℘₁)B and then of T_λB; reduction modulo λ gives the witness for ρ̄|G_F, and its WD inertial type at x|l is read from the action of I_x on T_(℘₁)B computed by Taylor. The descent in §4.6 returns to F, so the l-splitting and the inertial type are asserted over F.

Use `taylorNiveauTwoPotentialResidual` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Proposition 4.1 and following remark, pp. 755–756; the choice of p₁,p₂ and the twisted moduli spaces, pp. 756–760; Lemmas 4.4 and 4.5, pp. 761–762; end of the proof of Proposition 4.1, pp. 762–763; Corollary 4.6, p. 763.

*Needs:* `HilbertModularVarietiesAndShimuraCurves` H6.1–H6.3 (twisted Hilbert torsion moduli with paired torsion and component descent), H2.2 and H2.6; [Layer 3, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e) (the openness of the good-reduction locus); [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 4, Modularity transfer through the auxiliary variety](#target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar); `NeronModelsAndSemistableAbelianVarieties` §5.1; `AutomorphicGaloisRepresentations` §3.13 (CM characters as avatars of algebraic Hecke characters); `ShimuraVarieties` §5.3, §5.5 and §5.10 (CM abelian varieties, their number-field models and the main theorem of complex multiplication, for the CM point of Lemma 4.5); `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

<a id="target-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction"></a>
### 4.9 Quaternionic weight reduction

Let l>3 split completely in the even-degree totally real F, and 0≤i≤l−2. For character η̄^i of U₀(𝔫,l)/U₁(𝔫,l), use the local induced coefficient filtration 0→Sym^i→I_x^i→Sym^(l−1−i)⊗det^i→0. Its global subspaces S_T satisfy S_∅≅S_(i+2)(U_H(𝔫)). For x∉T construct an injection κ_x:S_(T∪{x})/S_T↪S_(T∪{x}), equivariant for good T_y,S_y and the required U_(ϖ_x), whose composite with the quotient projection is V_(ϖ_x).

Deduce the surjection of Hecke algebras to weight i+2. Localization at 𝔪 is nonzero if every V_(ϖ_x) lies in every maximal ideal of h″ above 𝔪. A sufficient condition is that 𝔪 is non-Eisenstein and each residual local restriction is not of shape (εχ₁,*;0,ω^iχ₂) with χ₁,χ₂ unramified. The U-ordinary comparison gives the triangular local shape with lower-right Frobenius eigenvalue φ(U_(ϖ_x)); the perfect pairing and adjoints give the dual V-shape. Use Sym^i and the quotient S_(T∪{x})/S_T in the construction.

Use `weightReductionHeckeSurjection` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, the pairing and the operators 𝐔, 𝐕, p. 764 (PDF page 36), §5, Lemma 5.1, p. 765 (PDF page 37), §5, Corollary 5.2, p. 767 (PDF page 39).

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); `AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic`; `HilbertModularVarietiesAndShimuraCurves` R18.3.5 (perfect quaternionic pairing).

<a id="target-taylor-2006-lemma-5-3-weight-shift"></a>
### 4.10 The weight shift by l+1

For k≥2, construct the weight shift from k to k+l+1 with the prescribed cyclotomic twist. Track the Hecke normalization: T_y is multiplied by N(y), while S_y is multiplied by N(y)². Retain the level and central-character conditions needed for Taylor's coefficient injection; the result transports the chosen residual system of eigenvalues, rather than identifying untwisted characteristic-zero representations of different weights.

Use `weightShift` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, proof of Lemma 5.3, p. 768 (PDF page 40).

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-taylor-2006-lemmas-5-4-5-6-weight-and-level"></a>
### 4.11 Weight and level removal

For l>3 and continuous odd ρ̄ of G_ℚ with inertia ω₂^(k−1)⊕ω₂^(l(k−1)), 2≤k≤l, obtain a totally real Galois F split at l and a weight-two regular algebraic cuspidal witness whose conductor at x|l divides x. Next make it unramified at finite places away from l. Finally choose F of even degree and a weight-k witness unramified at every finite place. Establish respectively Lemma 5.4, Corollary 5.5 and Lemma 5.6 using the CDT type/Jordan–Hölder interfaces and the specified Skinner–Wiles base change.

Use `weightAndLevelPotentialResidual` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, Corollary 5.5, p. 769 (PDF page 41), §5, proof of Lemma 5.6, p. 770 (PDF page 42).

*Needs:* [Layer 4, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [Layer 4, Level adjustment after a soluble totally real base change](#target-skinner-wiles-level-adjustment); [Layer 4, Fontaine–Laffaille shapes of quaternionic forms](#target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l); [Layer 4, Quaternionic weight reduction](#target-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction); [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-taylor-2006-theorem-5-7-serre-weight-at-level-one"></a>
### 4.12 The Serre-weight level-one witness

Let l>3 and ρ̄:G_ℚ→GL₂(F̄_l) be continuous irreducible odd with irreducible restriction to G_(ℚ_l). Obtain a totally real Galois F of even degree split at l and a regular algebraic cuspidal π with residual member ρ̄|G_F, infinity weight k_(ρ̄) and no finite ramification. Combine the niveau-two construction, weight changes and level removal. The prime-three case required for the larger KW theorem uses a separate Khare input and is not covered by l>3.

Use `taylorSerreWeightPotentialResidual` for this construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, Theorem 5.7, p. 770 (PDF page 42), §5, proof of Theorem 5.7, p. 771 (PDF page 43).

*Needs:* [Layer 4, Weight and level removal](#target-taylor-2006-lemmas-5-4-5-6-weight-and-level); [Layer 4, The weight shift by l+1](#target-taylor-2006-lemma-5-3-weight-shift); [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f"></a>
### 4.13 Controlled residual potential modularity

For an S-type residual ρ̄ of G_ℚ, assume 2 ≤ k(ρ̄) ≤ p+1 and absolute irreducibility on G_(ℚ(ζ_p)) when p>2, and nonsoluble image when p=2. Construct a totally real Galois F/ℚ of even degree, unramified at p and split there if ρ̄|D_p is irreducible, preserving the residual image. Over F the representation has a cuspidal Hilbert modular witness of weight k(ρ̄), unramified at every place above p (at p=2 this witness requires k=2), and a second witness of weight two with conductor dividing each v|p, unramified there when the residual representation is finite flat. Include the extension controls of Layer 6. This is a theorem about ρ̄; a characteristic-zero lift is not an input.

Use `kwPotentialResidual` for this construction.

The sources are [KW II][kw-serre-modularity-II], section 6, Theorem 6.1, pp. 53-54, Theorem 6.1(ii), p. 54, proof of Theorem 6.1, solvable case, p. 54, proof of Theorem 6.1, non-solvable case, p. 54, proof of Theorem 6.1, p = 2 and k(rho-bar) = 4, pp. 55-56, proof of Theorem 6.1, ordinary k(rho-bar) = 2 branch, p. 56, proof of Theorem 6.1, p = 3 branch, p. 56, proof of Theorem 6.1, weight adjustment, p. 57.

*Needs:* [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`; [Layer 4, Ordinary residual potential modularity](#target-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l); [Layer 4, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [Layer 4, The Serre-weight level-one witness](#target-taylor-2006-theorem-5-7-serre-weight-at-level-one); `AutomorphicGaloisRepresentations:R19.2`; `GL2ModularityLifting:R22.6/kw-dyadic-lifting`; `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`; `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `PadicFamilies:L5`; `SerreWeightAndLevelOptimisation:R20.3`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; [Layer 3, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity"></a>
### 4.14 The ordinary Annals variant

Let ρ̄ be S-type in odd characteristic p, irreducible on G_(ℚ(μ_p)), with 2≤k(ρ̄)≤p+1 and k(ρ̄)≠p. Obtain totally real Galois F/ℚ of even degree, unramified at p and split there if the local residual representation is irreducible. Preserve im ρ̄ and absolute irreducibility on G_(F(μ_p)). The first cuspidal Hilbert witness is everywhere unramified and has weight k; the second has weight two, is unramified away from p and has conductor dividing v at each v|p, with unramifiedness in the finite-flat case. Both are ordinary above p when ρ̄ is ordinary. Import the Hida and soluble base-change inputs giving these local properties. The supersingular cases use Taylor's l>3 theorem and the separate prime-three input.

Use `kwOrdinaryPotentialResidual` for this construction.

The sources are [KW Annals][kw-annals-2009], Theorem 2.1, p. 234, proof of Theorem 2.1, p. 234, proof of Theorem 2.1, p. 237, proof of Theorem 2.1, printed p. 235.

*Needs:* [Layer 4, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [Layer 4, The ordinary auxiliary Tate module](#target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l); [Layer 4, The Serre-weight level-one witness](#target-taylor-2006-theorem-5-7-serre-weight-at-level-one); `HilbertModularVarietiesAndShimuraCurves:H6`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `PadicFamilies:L5`; [Layer 3, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-snowden-totally-real-potential-residual-modularity"></a>
### 4.15 Residual modularity over totally real fields

Let F be totally real, p odd, and ρ̄ : G_F → GL₂(F̄_p) continuous and odd. Fix finite-order ψ with det ρ̄ = ψ̄χ̄_p, a finite M/F and a definite A/B/C type function t above p. Here Snowden's local types of a weight-two representation of G_(F_v) with determinant χ_p times a finite-order character are: A, potentially crystalline and ordinary; B, potentially crystalline and not ordinary; C, potentially an extension of the trivial character by χ_p. A type function assigns one letter to each v|p, and definite excludes the ambiguous A/C; for a parallel weight-two eigenform the type at v is A or B exactly when π_v is principal series or supercuspidal, and C exactly when π_v is special. Choose finite Galois M′/F containing M and a totally real Galois F′/F disjoint from M′ so that, for every further totally real F″/F′ disjoint from M′, ρ̄|G_F″ is the residual representation of a cuspidal parallel-weight-two form f with determinant ψχ_p and t_f=t|F″. One may require F′ to split at a finite S when its prescribed p-types are compatible with the residual local representations there. Ordinary type A is included. Snowden's conditions (A1),(A2) apply to the auxiliary and given-lift arguments; they are not assumptions on the original ρ̄ in this residual theorem.

Use `snowdenPotentialResidual` for this construction.

The sources are [Snowden v1][snowden], §2.1 and Remark 2.1.1 (the local types), p. 4; Theorem 5.1.1 and Proposition 8.2.1, pp. 15, 26.

*Needs:* [Layer 3, The Weil-restricted moduli application](#target-restriction-of-scalars-moduli-application); [Layer 2, Soluble preliminary fields and split extensions](#target-snowden-soluble-preliminary-field); `AutomorphicGaloisRepresentations:R19.2`; `AutomorphicGaloisRepresentations:R19.6`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `GL2ModularityLifting:R22.5`.

<a id="target-bcgp-controlled-residual-modularity"></a>
### 4.16 The two-prime ordinary refinement

Let F₁/F be finite totally real, and let distinct p,q>2 split completely in F₁. Suppose r : G_F₁ → GL₂(F̄_q) has determinant ε̄_q⁻¹, is unramified above p, and at every v|q has shape diag(λ_(α_v), ε̄_q⁻¹λ_(α_v)⁻¹), where λ_α is the unramified character taking arithmetic Frobenius to α. There is a totally real Galois F′/F, split above p and q and disjoint from F₁F_avoid, and a q-ordinary weight-zero cuspidal π over F₁F′ with trivial central character, unramified above pq, whose residual representation is r|G_F₁F′.

Use `bcgpPotentialResidual` for this construction.

The sources are [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proposition 9.1.11 and proof, p. 458.

*Needs:* [Layer 4, Residual modularity over totally real fields](#target-snowden-totally-real-potential-residual-modularity); [Layer 3, The Weil-restricted moduli application](#target-restriction-of-scalars-moduli-application); `AutomorphicGaloisRepresentations:R19.2`.

### Examples

The ordinary and niveau-two cases test the separate residual shapes; the l+1 weight shift and level removal retain their full hypotheses.

### Dependencies

This layer uses `AutomorphicGaloisRepresentations`, `GL2AutomorphicRepresentationsAndTransfer`, `GL2ModularityLifting`, `GlobalGaloisDeformations`, `HilbertModularVarietiesAndShimuraCurves`, `OrdinaryAutomorphicFormsAndModularityLifting`, `PadicFamilies`, `PadicHodgeTheory`, `SerreWeightAndLevelOptimisation`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r23-4"></a>
## Layer 5: Potential modularity of a given lift


Take the lift as data and use the residual modular witnesses in the appropriate lifting theorem. Preserve the local type and residual-image assumptions through field selection.

<a id="target-potential-modularity-of-a-given-lift"></a>
### 5.1 Potential modularity of a given lift

Take an S-type ρ̄ satisfying the KW I Theorem 5.1 hypotheses, and an odd finitely ramified lift ρ, minimal away from p as required by its lifting data, with one of the A/B/C p-types. At p=2 allow crystalline weight two, or semistable weight two when ρ̄ is not finite at 2. Select a totally real Galois F preserving the residual image and cyclotomic irreducibility, unramified at p and split there when the residual local restriction is irreducible or k=p+1. The residual witnesses and allowable base change give (α),(β); the equivalence of modularity over F and over a soluble extension is GL2ModularityLifting R22.5, and the soluble extension with the prescribed completions is that of Layer 2; the R22.5/R22.6 lifting theorem makes the **given ρ|G_F** the representation of a holomorphic cuspidal form. Existence of ρ is a separate premise. General regular de Rham lifts require a lifting theorem of that wider scope.

Use `potentialModularityGivenLift` for this construction.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93.

*Needs:* [Layer 4, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`; `GL2ModularityLifting:R22.6/kw-dyadic-lifting`; `GL2ModularityLifting:R22.5/kw-residual-modularity`; `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`.

### Examples

The prescribed local type and fixed determinant are tested on the supplied lift before applying a lifting theorem.

### Dependencies

This layer uses `GL2ModularityLifting`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r23-5"></a>
## Layer 6: Control of extensions


State each completion, splitting and avoidance condition in the field chosen for the modularity argument. Descent requires an automorphic theorem with invariance and cuspidality premises.

<a id="target-control-of-the-extension"></a>
### 6.1 Local control and avoidance

Build into the potential-modularity field the four controls of KW II Theorem 6.1(iii): when k=p and the residual inertia is trivial, trivialize the entire local decomposition-group restriction upstairs; make completions contain the chosen away-p local extensions; in the odd-prime k=p+1 case arrange complete splitting at p; and avoid the prescribed finite field by linear disjointness. Preserve the residual image and the cyclotomic irreducibility needed by subsequent lifting. Soluble descent is an additional automorphic theorem, requiring invariance and cuspidality; choosing a Galois extension alone supplies neither condition.

In the dihedral branch impose the extra split-prime condition of KW II p.54 that preserves irreducibility on G_(F(μ_p)). The determinant and weight are unchanged by field control.

Use `controlledExtension` for this construction.

The sources are [KW II][kw-serre-modularity-II], Theorem 6.1 (iii), p. 54, proof of Theorem 6.1, p. 57.

*Needs:* [Layer 4, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); [Layer 2, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [Layer 2, Disjointness through towers](#target-tower-linear-disjointness); `GL2AutomorphicRepresentationsAndTransfer:R17.6`.

<a id="target-bcgp-local-galois-data-without-descent"></a>
### 6.2 Local Galois data over a composite field

Let E′/E and F_avoid/E be finite and linearly disjoint, and prescribe a finite group G with local Galois extensions H_v/E′_v and embeddings of their groups into G at a finite set S′ above S. At real places prescribe c_v of order dividing two. Choose finite Galois K/E disjoint from E′F_avoid such that K′=KE′ splits every place in S′ over E′. Construct a G-Galois L′/K′ with the prescribed completions and decomposition groups up to conjugacy, including the prescribed complex conjugations. The result is over K′: no descent of L′ to K or disjointness of L′ from E′ over E is a conclusion.

Use `bcgpLocalData` for this construction.

The sources are [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proposition 9.1.12 and proof, pp. 458–459.

*Needs:* [Layer 2, Potential realization of local Galois data](#target-potential-global-galois-local-data); `AbelianSchemesAndArithmeticModuli:A6`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`; `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); `AlgebraicModuliForArithmeticGeometry:R09.3` (`r093-restriction-algebraicity`, `r093-restriction-base-change`); [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); `InverseGaloisAndArithmeticFundamentalGroups` IG.1.1 and IG.2.6.

### Examples

The local extensions and avoidance field are tracked before descent, so residual image preservation and soluble descent remain separate conditions.

### Dependencies

This layer uses `AbelianSchemesAndArithmeticModuli`, `GL2AutomorphicRepresentationsAndTransfer`, `GL2ModularityLifting`, `SchemeAndStackFoundations`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r23-6"></a>
## Layer 7: Exports and their direction of use


Keep the residual and characteristic-zero exports separate. The mathematical direction is field selection and an independent auxiliary lifting theorem → residual modularity → finiteness → characteristic-zero points. Modularity of a given lift uses the residual witnesses and its local lifting theorem; the family construction uses that given-lift conclusion.

| Input | Export | Use |
| --- | --- | --- |
| Residual representation with the hypotheses of Layer 4 | Controlled residual modular witness | Finiteness in Layer 8; residual premise for lifting in Layer 5 |
| Separately given lift with its local type | Automorphy after restriction, Layer 5 | Brauer family in Layer 12 |
| Local containment, splitting and avoidance data | Controlled field and admissible descent data, Layer 6 | Preservation of residual image and chosen local conditions |
| Finiteness and dimension bound for an unframed ring | Integral characteristic-zero point, Layer 9 | Lift existence; subsequent modularity lifting |

The sources are [KW II][kw-serre-modularity-II], Theorem 6.1 and proof, pp.53–57; Theorem 10.1 and §§10.1–10.3, pp.90–94. *Needs:* Layer 2–Layer 6 with their stated interfaces. The independent auxiliary lifting theorem is an input from the modularity-lifting owner; it cannot be deduced using the lift whose existence is being established.

### Examples

The residual witness and given-lift exports have different inputs; passing one to the other requires the lifting theorem.

### Dependencies

The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r24-1"></a>
## Layer 8: Finiteness of global rings


Use residual modularity over an auxiliary totally real field to prove module finiteness of the unframed ring. The ordinary CM adapter and its local-ring comparisons are part of the ordinary application’s premises.

<a id="target-auxiliary-totally-real-field-for-the-finiteness-argument"></a>
### 8.1 The auxiliary field for global finiteness

Construct the auxiliary totally real F/ℚ for the fixed-determinant global deformation problem. The field with its preserved image, splitting or unramifiedness at p, the character ψ_F and the two residual witnesses is SerreWeightAndLevelOptimisation §6.6 (`kwOptimisationData`, the Khare–Wintenberger II §8.1 field); this target adds the requirement on the universal residual representation τ and the type-A/B/C projections below. Preserve nonsolubility at p=2 or cyclotomic absolute irreducibility at p>2; arrange splitting at p when the local residual restriction is irreducible and unramifiedness otherwise. Require ψ_F unramified away from p and trivial local residual restrictions above p when the original restriction is unramified.

Supply the weight-k(ρ̄), everywhere-unramified cuspidal witness of central character ψ_F for type A only under p≠2 or k(ρ̄)=2. Supply the weight-two witness of the same central character, unramified away from p and of conductor dividing v at v|p, for types B/C; at p=2,k=4 it must arise from the specified semistable local quotient. Arrange splitting at p for the weight-p+1 lifting argument. Finally require the mod-p universal representation τ|G_F to be unramified away from p and infinity. This last condition is part of the finiteness construction, not a consequence of the existence of a single modular witness.

The construction has the following API:

- `AuxiliaryField`: F with the conditions (1)–(4) and the representations π′
- `AuxiliaryField.piA`: π′ unramified everywhere, weight k(ρ̄), central character ψ_F (type (A)); this projection is available only under p ≠ 2 or k(ρ̄) = 2. No type-(A) witness is supplied at p = 2, k = 4.
- `AuxiliaryField.piBC`: π′ of conductor dividing v at v | p, weight 2, central character ψ_F (types (B), (C))
- `AuxiliaryField.tau_unramified`: the reduction τ of the universal representation is unramified on G_F outside p and ∞
- `AuxiliaryField.exists`: existence from Theorem 6.1 with (iii)(b)–(d), Theorem 8.2 and the local killing of ramification
- `AuxiliaryField.piA_iff`: The type-(A) automorphic witness is available under p≠2 or k(ρ̄)=2; at p=2, k=4 only the type-(B)/(C) witness is part of the construction.
- `AuxiliaryField.piBC_eq`: The accessor returns the chosen weight-two witness with central character ψ_F, together with its Galois realization.

**Checks.**

- `aux_dyadic_weight_four`: At p=2,k=4 the type-A accessor has no witness; the type-B/C accessor returns the weight-two witness with the specified semistable condition C.
- `aux_unramified_at_p`: If the original local residual representation at p is unramified, require the selected field to trivialize it at every place above p; evaluate the stored restriction on the corresponding local Frobenius powers.
- `aux_not_cm`: The stored field is totally real and cannot contain an element i with i²=−1; a CM field cannot serve as the field of Hilbert modular witnesses here.
- `aux_tame_killing`: Tame inertia of order e at l≠p is killed by the prescribed ramified local extension; for e=3,l=7 use ℚ₇(7^(1/3)), with 3|(7−1), and evaluate the restricted universal residual representation on inertia.

Use `AuxiliaryField` for this construction.

The sources are [KW II][kw-serre-modularity-II], proof of Theorem 10.1, p. 90, proof of Theorem 10.1, first bullet, p. 90, proof of Theorem 10.1, third bullet, p. 91, proof of Theorem 10.1, fourth bullet, p. 91.

*Needs:* `SerreWeightAndLevelOptimisation` §6.6 (`kwOptimisationData`); [Layer 4, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); [Layer 6, Local control and avoidance](#target-control-of-the-extension); `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `LocalGaloisDeformationRings:R08.2`.

<a id="target-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring"></a>
### 8.2 Finiteness of the KW unframed ring

Under the residual-image, determinant and A/B/C local-condition hypotheses of KW II Theorem 10.1, prove that the fixed-determinant **unframed** global ring R̄_S^ψ is finite as a ℤ_p-module. Restrict its universal mod-p representation to the auxiliary F, apply the appropriate R=T finiteness over F, and deduce that the universal residual image over ℚ is finite. The finite-image criterion then yields module finiteness. Equivalently, since ρ̄|G_F is absolutely irreducible, restriction makes the global ring over ℚ a finite module over the ring over F (GlobalGaloisDeformations §4.2), and the latter is finite over ℤ_p by the R=T theorem over F. The framed ring is a formal power-series enlargement by 4|S|−1 variables and is not asserted module-finite.

Assume S-type, the odd-prime weight interval 2≤k≤p+1 and cyclotomic absolute irreducibility, or nonsoluble image at p=2. The local conditions are those of KW II Theorem 3.1; for p>2 condition C is used only when k=p+1. Over F use minimal odd deformations unramified away from p with determinant ψ_Fχ_p and the uniform A/B/C condition at p.

Use `kwGlobalFiniteness` for this construction.

The sources are [KW II][kw-serre-modularity-II], proof of Theorem 10.1, p. 91, proof of Theorem 10.1, pp. 91-92, end of proof of Theorem 10.1, p. 92, Theorem 10.1, p. 90.

*Needs:* `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`; [Layer 8, The auxiliary field for global finiteness](#target-auxiliary-totally-real-field-for-the-finiteness-argument); `DeformationAndDerivedPatchingAlgebra:R03.4`; `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`; `GL2ModularityLifting:R22.6/kw-dyadic-lifting`; `GL2ModularityLifting:R22.3/minimal-ring-finite`; `AutomorphicGaloisRepresentations:R19.6`; `GlobalGaloisDeformations:R04.4/restriction-finiteness`.

<a id="target-rank-two-definite-unitary-ordinary-hecke-algebra"></a>
### 8.3 Definite unitary groups in two variables and their ordinary Hecke algebras

Let L be an imaginary CM field with maximal totally real subfield L⁺ such that L/L⁺ is unramified at every finite place (so [L⁺:ℚ] is even), let l be odd with every place of L⁺ above l split in L, and let G/O_(L⁺) be the unitary group in two variables of the standard hermitian form, quasi-split at every finite place and compact at every infinite place, with its integral model and the isomorphisms ι_w:G(L⁺_v)≅GL₂(L_w) at split places v=ww^c. For a finite extension K/ℚ_l with integers O containing every embedding of L, a weight λ indexed by the embeddings above the chosen places ṽ|l, characters χ_v of Iwahori quotients at a finite set R of split places, and an open compact U, let S_(λ,{χ_v})(U,A) be the O-module of functions f:G(L⁺)\G(A^∞_(L⁺))→M_(λ,{χ_v})⊗A with f(gu)=u_(l,R)⁻¹f(g). Define:

- the Hecke operators T_w^j (j=1,2) at split places outside a finite set T and the Hecke algebra T^T_(λ,{χ_v})(U,A), a finite O-algebra, reduced for A=O;
- the Iwahori levels U(l^(b,c)), the normalized operators U^j_(λ,ϖ) and diamond operators ⟨u⟩ for u in the diagonal torus T(O_(L⁺,l)), and the ordinary idempotent e=lim U(l)^(r!) with S^ord=eS;
- the big ordinary Hecke algebra T^(T,ord)_({χ_v})(U(l^∞),O)=lim_c T^(T,ord)(U(l^(c,c)),O), an algebra over Λ=O⟦T(l)⟧, T(l) the pro-l part of T(O_(L⁺,l)).

The construction has the following API:

- `DefiniteUnitaryTwo.group`: G with ι_w at split places; it exists under the parity of [L⁺:ℚ] above.
- `DefiniteUnitaryTwo.forms`: S_(λ,{χ_v})(U,A); exact in A when no t⁻¹G(L⁺)t∩U has an element of order l, and free over O[U/V] for normal V⊆U with U/V an abelian l-group.
- `DefiniteUnitaryTwo.heckeAlgebra`: T^T_(λ,{χ_v})(U,A), commutative and finite over O.
- `DefiniteUnitaryTwo.ordinaryIdempotent`: e on S(U(l^(b,c)),A); S^ord is the largest submodule on which every U^j is bijective.
- `DefiniteUnitaryTwo.ordinaryHeckeAlgebra`: T^(T,ord)(U(l^∞),O) over Λ.
- `DefiniteUnitaryTwo.ordinary_free_over_lambda`: at a level with no element of order l in any t⁻¹G(L⁺)t∩U, the Pontryagin dual of eS(U(l^∞),K/O) is free of finite rank over Λ; hence T^(T,ord) is finite over Λ.
- `DefiniteUnitaryTwo.hida_classicality`: at an arithmetic prime ℘_(λ,α) of Λ the specialization of the dual ordinary module is the dual of the classical ordinary forms of weight λ and nebentypus α, compatibly with the Hecke algebras up to a nilpotent kernel.

**Checks.**

- `unitaryTwo_ordinary_zero`: if S(U(l^(b,c)),A)=0 then eS=0.
- `unitaryTwo_weight_zero_functions`: for λ=0 and no characters χ_v, S_0(U,O) is the module of O-valued functions on the finite set G(L⁺)\G(A^∞)/U, of rank its cardinality when the level is l-torsion free.
- `unitaryTwo_rank_one_comparison`: the determinant of G is the norm-one torus of L/L⁺; for n=1 the same constructions give functions on a finite quotient of the norm-one idele class group, U^1 is invertible and e=1.
- `unitaryTwo_parity`: a CM extension L/L⁺ unramified at every finite place has [L⁺:ℚ] even; for instance no imaginary quadratic field is unramified over ℚ at every finite place, so L⁺=ℚ never occurs.

Use `DefiniteUnitaryTwo.ordinaryHeckeAlgebra` for this construction.

The sources are [Thorne][thorne], §6, the group, Definition 6.1, Proposition 6.2 and Lemmas 6.3–6.4, pp. 30–35; §8, the Iwahori levels, the operators U^j and ⟨u⟩, Definition 8.1, Proposition 8.2 and Definition 8.3, pp. 44–46; [Geraghty, ordinary][geraghty-ordinary], §2.2–§2.6 (Definitions 2.2.1–2.2.4, 2.3.1, 2.4.1–2.4.5, Lemma 2.5.2, Propositions 2.5.3 and 2.6.1, Lemma 2.6.4), pp. 6–22.

*Needs:* `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms` and `AutomorphicFormsOnReductiveGroups:AF.4/coefficient-lattices` (algebraic modular forms on groups compact at infinity, and the coefficient lattices); `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups`; `PadicFamilies:L0a/finite-ordinary-projector`; `PadicFamilies:L0a/ordinary-part-bijective`; `LocalGaloisDeformationRings:L8/ordinary-coefficient-ring` (the ring Λ).

<a id="target-rank-two-unitary-galois-representations"></a>
### 8.4 Galois representations on the rank-two ordinary Hecke algebra

With the notation of §8.3: (1) Every irreducible constituent π of S_(λ,{χ_v})(Q̄_l) has a continuous semisimple r_l(π):G_L→GL₂(Q̄_l) with r_l(π)^c≅r_l(π)^∨(−1), local–global compatibility up to semisimplification at split places outside S_l∪R, the prescribed Iwahori character on inertia at R, and de Rham (crystalline at unramified π_v) restrictions at the places above l of the corresponding weight. (2) For a maximal ideal m of T^T_λ(U,O) there is a residual r̄_m:G_L→GL₂(T/m) whose Frobenius characteristic polynomials at split w∉T are X²−T_w^1X+(Nw)T_w^2 modulo m; m is non-Eisenstein when r̄_m is absolutely irreducible. For non-Eisenstein m, r̄_m extends to r̄_m:G_(L⁺)→𝒢₂(T/m) with multiplier ε^(−1)δ_(L/L⁺)^(μ_m), and lifts uniquely up to strict equivalence to r_m:G_(L⁺)→𝒢₂(T^T_λ(U,O)_m) with the same Frobenius polynomials. (3) The same holds for the big ordinary Hecke algebra: r_m:G_(L⁺)→𝒢₂(T^(ord)_m), and at each v|l its restriction factors through Geraghty's ordinary lifting ring over Λ_ṽ, so every specialization is upper triangular with diagonal characters the push-forward of the universal ones. (4) Base change and descent: a RACSDC π of GL₂(A_L) of weight ι_*λ descends to an automorphic representation of G(A_(L⁺)) with the same split-place components, and conversely every automorphic representation of G whose Galois representation is irreducible has a RACSDC base change whose Galois representation is r_l(π); an O-algebra map from the ordinary Hecke algebra whose restriction to Λ is arithmetic factors through a classical algebra and comes from such a π.

Use `DefiniteUnitaryTwo.heckeGaloisRepresentation` for this construction.

The sources are [Thorne][thorne], §6, Theorem 6.5 and Propositions 6.6–6.7, pp. 35–36; §8, Propositions 8.4–8.5, p. 47; [Geraghty, ordinary][geraghty-ordinary], §2.7, Propositions 2.7.2–2.7.4, pp. 24–26, and §3.1, Corollary 3.1.4, pp. 32–33; [BLGGT v4][blggt-2014-v4], §2.2 (polarized automorphic representations and their Galois representations), pp. 35–37.

*Needs:* [Layer 8, Definite unitary groups in two variables and their ordinary Hecke algebras](#target-rank-two-definite-unitary-ordinary-hecke-algebra); `EndoscopicTransferAndUnitaryTraceComparison` §6.29 (Labesse's base change and descent between unitary groups and GL_n over CM fields); `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`; `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`; `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`; `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`; `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`; `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`; `tauceti:TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants` (pseudocharacters and Cayley–Hamilton reconstruction); `LocalGaloisDeformationRings:L7/ordinary-flag-scheme`.

<a id="target-rank-two-ordinary-r-equals-t"></a>
### 8.5 Rank-two ordinary R=T for adequate residual image

With the notation of §8.3 and §8.4, with L/L⁺ unramified at all finite places, and let T=R∪S_l∪{v₁} be split places with v₁∤l. Assume r̄_m(G_(L_ṽ)) is trivial for v∈R∪S_l; Nv≡1 mod l for v∈R, with l^N>2 when l^N exactly divides Nv−1; r̄_m unramified above v₁ with Nv₁≢1 mod l; U_v the Iwahori subgroup at R∪{v₁}, so that no t⁻¹G(L⁺)t∩U has an element of order l; m non-Eisenstein in the big ordinary Hecke algebra; ζ_l∉L and ρ̄=r̄_m|G_L with ρ̄(G_(L(ζ_l))) adequate. Let 𝒮 be the polarized deformation problem over Λ with the Ihara-avoidance rings at R (inertia acting with characteristic polynomial given by characters trivial mod λ), Geraghty's ordinary rings over Λ_ṽ at S_l and the unipotent ring at v₁. Then r_m is of type 𝒮, and every lifting r of r̄_m of type 𝒮 (with trivial characters at R) that is unramified above v₁, for which some Hecke specialization is also unramified there, is conjugate to a specialization of r_m. Moreover μ_m≡0 mod 2, and with the unramified ring at v₁ the universal ring R^univ is a finite Λ-module.

In rank two the adequacy notion of Thorne's 2012 paper and the corrected one of his 2017 paper agree because l∤2, and Thorne's 2017 Proposition 7.2 replaces the Taylor–Wiles prime proposition, which needs ζ_l∉L, so the theorem is stated with that hypothesis. By the rank-two classification, adequacy of ρ̄(G_(L(ζ_l))) means absolute irreducibility, except that projective image PSL₂(F₃) for l=3 and PSL₂(F₅) for l=5 are not adequate.

The proof is Thorne's: Taylor–Wiles data of size q exist with the generator count q−[L⁺:ℚ]−[L⁺:ℚ](1−(−1)^(μ_m)) (adequate Taylor–Wiles primes); the Taylor–Wiles level structures with the parahoric projections identify the patched modules; the ordinary forms are free over Λ[Δ_Q]; patching gives a module over a power-series ring whose support is the union of the components of the Ihara-avoidance rings; Taylor's comparison of the unipotent and the distinct-character problems modulo λ forces the support to be everything, and the reduced-ness of the Hecke algebra concludes.

**Checks.**

- `rankTwoRT_adequacy_l3`: for l=3 a residual representation with projective image PSL₂(F₃) is absolutely irreducible on G_(L(ζ₃)) but not adequate, so the theorem does not apply.
- `rankTwoRT_zeta_in_L`: if ζ_l∈L the corrected Taylor–Wiles prime argument is unavailable; the hypothesis ζ_l∉L is part of the statement.
- `rankTwoRT_v1`: the auxiliary place v₁ with Nv₁≢1 mod l is what makes the level l-torsion free; dropping it, finite stabilizers of order l can occur.

Use `rankTwoOrdinaryRT` for this construction.

The sources are [Thorne][thorne], §4, Definition 4.1, Lemma 4.3 and Proposition 4.4, pp. 15–18; §5, the parahoric operators and Propositions 5.8–5.12, pp. 19–30; §8, 'Another patching argument', Theorem 8.6 and its proof and Corollary 8.7, pp. 48–53; [Thorne, adequacy][thorne-2017], §7, Propositions 7.1–7.2 and Corollary 7.3, pp. 30–32; [Geraghty, ordinary][geraghty-ordinary], §4.3, Theorem 4.3.1, p. 51.

*Needs:* [Layer 8, Galois representations on the rank-two ordinary Hecke algebra](#target-rank-two-unitary-galois-representations); `GlobalGaloisDeformations:G7/polarized-deformation-problem`; `GlobalGaloisDeformations:G7/polarized-presentation`; `GlobalGaloisDeformations:G7/polarized-tangent-obstruction`; `GlobalGaloisDeformations` §8.5 (Taylor–Wiles places in rank n); `ArithmeticGaloisRepresentations:G7/adequate-subgroup`; `ArithmeticGaloisRepresentations` Layer 4 (rank-two adequacy, `isAdequate_rank_two`); `ArithmeticGaloisDuality:R02.4`; `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`; `LocalGaloisDeformationRings:L7/trivial-residual-flag-ring`; `LocalGaloisDeformationRings:L7/ordinary-flag-scheme`; `DeformationAndDerivedPatchingAlgebra:R03.5`; `DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-support-top-components`; `DeformationAndDerivedPatchingAlgebra:R03.6/patched-module-support-theorem`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="target-rank-two-ordinary-automorphy-and-finiteness"></a>
### 8.6 Rank-two ordinary automorphy lifting and ordinary finiteness

Let F be CM or totally real and l odd with ζ_l∉F. (1) Lifting. Let (r,μ) be a two-dimensional algebraic polarized l-adic representation of G_F with r̄ irreducible and r̄(G_(F(ζ_l))) adequate, r ordinary at every place above l, and (r̄,μ̄) ordinarily automorphic. Then (r,μ) is ordinarily automorphic, of level prime to l if r is crystalline above l. (2) Finiteness. Let F be imaginary CM, S a finite set of places of F⁺ containing those above l and split in F, (π,χ) an ι-ordinary RAECSDC representation of GL₂(A_F) unramified outside S with adequate r̄_(l,ι)(π)(G_(F(ζ_l))), μ an algebraic character of G_(F⁺) with μ̄=r̄_(l,ι)(χ)ε̄^(−1) and HT_τ(μ)={w}, and for every τ a pair H_τ of distinct integers with H_(τc)={w−h:h∈H_τ}. With unrestricted local conditions away from l and the semistable ordinary rings of Hodge type {H_τ} above l, the universal ring of the polarized deformation problem of r̄ with multiplier μ is a finite O-module. The weights H_τ need not be those of π.

For (1) with F totally real, make a quadratic CM base change disjoint from the field cut out by r̄ over F(ζ_l) and descend at the end. For F imaginary, twist so that, in Thorne's normalization, the Hecke multiplier is δ_(F/F⁺)^n, which is trivial for n=2, make soluble CM base changes over which the hypotheses of the rank-two ordinary R=T hold (places above l and the ramified places split, r̄ trivial there, Iwahori-fixed vectors, the congruences Nv≡1 mod l with l^N>2, and an auxiliary place v₁), apply it, and descend by soluble descent. For (2), make the analogous soluble CM base change M/F, use the finiteness of the restriction map of global rings to reduce to M, and specialize the Λ-finiteness of the rank-two ordinary R=T at the arithmetic prime of the chosen weight.

**Checks.**

- `rankTwoLift_totally_real`: for F totally real and a weight-two ordinary r with adequate residual image, (1) applies after quadratic CM base change; the output is a cuspidal Hilbert form over F.
- `rankTwoFinite_weights_free`: the Hodge type {H_τ} in (2) may differ from that of π, but must satisfy H_(τc)=w−H_τ for the same w as μ: a polarized lift with multiplier μ has Hodge–Tate numbers with this symmetry, so a type violating it carries no characteristic-zero point.
- `rankTwoFinite_framed`: the conclusion is for the unframed polarized universal ring; a framed ring adds formal variables and is not finite over O.

Use `rankTwoOrdinaryAutomorphyAndFiniteness` for this construction.

The sources are [BLGGT v4][blggt-2014-v4], §2.4, Theorems 2.4.1 and 2.4.2, pp. 39–40; [Thorne][thorne], §9, Theorem 9.1 and its proof, pp. 53–54, and §10, Theorem 10.2 and its proof, pp. 56–58; [Gee–Geraghty][gee-geraghty], Lemma 3.2.5 and its proof, p. 14.

*Needs:* [Layer 8, Rank-two ordinary R=T for adequate residual image](#target-rank-two-ordinary-r-equals-t); [Layer 8, Galois representations on the rank-two ordinary Hecke algebra](#target-rank-two-unitary-galois-representations); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`; `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`; `OrdinaryAutomorphicFormsAndModularityLifting` §2.1 (nearly ordinary automorphic representations, the rank-two ι-ordinary notion); `GlobalGaloisDeformations:R04.4/restriction-finiteness`; `GlobalGaloisDeformations:G7/polarized-representability`; `LocalGaloisDeformationRings:L7/semistable-ordinary-quotient`.

<a id="target-ordinary-global-ring-finiteness"></a>
### 8.7 Ordinary unframed-ring finiteness

For p>2 and totally real F, fix a totally odd absolutely irreducible ρ̄, adequate on G_(F(ζ_p)), with ζ_p∉F. Let O be the integers of a finite p-adic coefficient field containing all labeled embeddings used below. Fix a continuous determinant d lifting det ρ̄ and S containing p and all ramification. Require an ordinary RAESDC cuspidal seed π with residual representation ρ̄ and **characteristic-zero determinant d**. At p fix regular labeled Hodge multisets H_τ={h_(τ,1),h_(τ,2)}, with sum HT_τ(d), and use the reduced O-flat semistable ordinary local quotient of this type. Away from p use unrestricted fixed-determinant local conditions. The fixed-determinant **unframed** global GL₂ ring R_F is finite over O; further away-p quotients remain finite.

The polarized input is the finiteness statement (2) of §8.6, the rank-two case of Thorne's Theorem 10.2: for a CM extension K/F, a polarized residual prolongation r̄:G_F→𝒢₂(k) and a fixed multiplier, an ordinary RAECSDC seed over K, adequacy on G_(K(ζ_p)), ζ_p∉K, a finite S split in K, unrestricted away-p lifting rings and the fixed symmetric regular Hodge-type semistable ordinary rings at p, the unframed polarized ring R_K is finite over O. The fixed Hodge type need not equal the seed's weight, but its symmetry must use the same multiplier.

Construct the totally real adapter as follows.

1. Choose a CM quadratic K/F split at every v∈S and disjoint from the residual-kernel/cyclotomic field. Quadratic weak approximation allows negative signs at all real places and local squares at S; an additional split-place avoidance prescription prevents containment in the finite avoidance field. Disjointness preserves the required residual image on G_(K(ζ_p)), hence adequacy, and ensures ζ_p∉K. Soluble base change of π is cuspidal because its restricted residual representation is absolutely irreducible.
2. Use the alternating determinant pairing of a rank-two representation to prolong every GL₂ deformation ρ of determinant d to 𝒢₂, with fixed multiplier ν=d. Explicitly, put J=(0,1;−1,0), send g∈G_K to (ρ(g),d(g)), and a complex conjugation c to (ρ(c)J⁻¹,1)j. Oddness and p>2 give det ρ(c)=−1 and ρ(c)²=1; ρ(c)J⁻¹ is symmetric, so the square of this last element is 1. The identity Jρ(g)^−tJ⁻¹=ρ(g)/d(g) checks conjugation. The multiplier at c is −1, and μ=dε is even: this is the κ=0 prolongation. This construction, up to strict equivalence, is natural in the coefficient algebra; it is not a separately chosen polarization for each point.
3. At each chosen w|v∈S, K_w=F_v. Restriction therefore identifies the selected local quotients, including their labeled Hodge types and the ordinary condition. The equality of the two Hodge sums with HT(d) gives the conjugate symmetry required by the multiplier. At nonsplit places outside S only the fixed CM component character is allowed to ramify; the underlying GL₂ representation is unramified. Thorne's G_(F,S) is Gal(K(S)/F), not the absolute Galois group of a totally real extension unramified outside S.
4. Universality gives R_K→R_F. The composite of the forgetful map from the unframed GL₂ ring of ρ̄|G_K to R_K with R_K→R_F is restriction of GL₂ deformations from F to K, and R_F is finite over the GL₂ ring of ρ̄|G_K because ρ̄|G_K is absolutely irreducible (GlobalGaloisDeformations §4.2, the argument of Gee–Geraghty Lemma 3.2.5: the closed fibre has finite image, traces generate, Nakayama). Hence R_F is a finite R_K-module, in the direction **extension-field ring → original-field ring**. Finiteness of R_K over O concludes the argument.

**Checks.** The identity extension gives the identity ring map. A free framing variable produces O[[x]], whose reduction k[[x]] is infinite: the argument does not prove finiteness of a framed ring. A local quotient selected by an ordinary flag with variable Hodge characters fails step 3; fixed regular type and a comparison of quotients are indispensable. A seed with the same residual determinant but a different characteristic-zero determinant fails the fixed-multiplier input. Absolute irreducibility alone also does not supply adequacy at the small primes.

Use `ordinaryGlobalFiniteness` for this construction.

The sources are [Thorne][thorne], §3, pp. 7–8, Theorem 10.2, setup and proof, author pp. 56–58, and Corollary 8.7, p. 53; [Gee–Geraghty][gee-geraghty], Lemma 3.2.5 and proof, p. 14. The rank-two determinant pairing gives the explicit prolongation formula above.

*Needs:* [Layer 8, Rank-two ordinary automorphy lifting and ordinary finiteness](#target-rank-two-ordinary-automorphy-and-finiteness); `GlobalGaloisDeformations:R04.4/restriction-finiteness`; `GlobalGaloisDeformations:G7/polarized-deformation-problem`; `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`; `LocalGaloisDeformationRings:L7/semistable-ordinary-quotient`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`; [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions).

<a id="target-cg-ordinary-ring-finiteness"></a>
### 8.8 The Calegari–Geraghty finiteness application

In the scalar branch of Calegari–Geraghty Theorem 4.8, take p≥3 and an absolutely irreducible modular ρ̄ of G_ℚ, twist-minimal away from p, **unramified at p with scalar Frobenius**, whose restriction to G_ℚ(ζ_p) is adequate: by the rank-two classification this is absolute irreducibility on G_ℚ(ζ_p) except for projective image PSL₂(F₃) when p=3 and PSL₂(F₅) when p=5. Those two residual images are the part of the Calegari–Geraghty statement outside this target, whose finiteness input is the adequate one. For each harmless-prime character φ fix χ_φ = ε⟨det(ρ̄) ε̄⁻¹⟩φ, where the brackets denote the finite Teichmüller lift. Use the framed ordinary R† at p and unrestricted fixed-determinant local rings at the other ramified places. Prove finiteness over O of the corresponding unframed R_φ. Its framed enlargement remains a power-series ring over it. The version adjoining the Frobenius eigenvalue is a finite quadratic algebra over R_φ, so it is finite as well. This supplies the finiteness input to the multiplicity argument.

After twisting the local residual scalar to 1, Theorem 3.19 with n=2 gives generic local matrices (εω⁻¹ λ(α⁻¹),*;0,λ(α)), with fixed determinant εω⁻¹. Kill the finite tame character ω by a soluble local extension, and spread these extensions into a soluble totally real field as in Layer 2. Restriction then lands in the fixed weight-two semistable ordinary quotient; prove this factorization as a map of complete local rings, using reduced O-flatness and the generic-point characterization, before applying finite restriction. The global seed must also be twisted by the half-power of its congruent-to-one finite determinant discrepancy, exactly as in the proof on PDF p. 67. For p odd that half-power exists on the pro-p finite character group. It is not a square root of ω.

Use `cgRingFiniteness` for this construction.

The sources are [Calegari–Geraghty][cg], Theorem 3.19, PDF p. 39, and Theorem 4.8 proof, PDF pp. 65–68, especially the determinant twist and component patching on p. 67 and the finiteness paragraph on p. 68.

*Needs:* [Layer 8, Ordinary unframed-ring finiteness](#target-ordinary-global-ring-finiteness); `LocalGaloisDeformationRings:L8` (ordinary rings with a Frobenius eigenvalue, `L7/ordinary-ring-with-frobenius-eigenvalue`); `ArithmeticGaloisRepresentations` Layer 4 (rank-two adequacy); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions).

### Examples

A framed ring adds formal variables and fails the asserted unframed finiteness conclusion. The auxiliary field tests retain its splitting and image conditions.

### Dependencies

This layer uses `AutomorphicGaloisRepresentations`, `DeformationAndDerivedPatchingAlgebra`, `GL2ModularityLifting`, `GlobalGaloisDeformations`, `LocalGaloisDeformationRings`, `OrdinaryAutomorphicFormsAndModularityLifting`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r24-2"></a>
## Layer 9: Characteristic-zero points


Combine a dimension lower bound and finiteness to obtain an integral coefficient-extension point. The representation is then specialized from the universal one; modularity is a separate, subsequent application.

<a id="target-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type"></a>
### 9.1 Points give lifts with the required local type

For a nonzero complete noetherian local fixed-determinant global ring R̄_S^ψ that is finite over O and has absolute Krull dimension at least one, use the characteristic-zero-point theorem to obtain a continuous map R̄_S^ψ → O′ for the integers of a finite extension of Frac O. Specialize the universal representation: it lifts ρ̄, has determinant ψχ_p and satisfies the chosen local conditions at every place. The local A/B/C classifications identify its required type. Finiteness alone is insufficient: a nonzero finite O-algebra of dimension zero can be killed by a power of the uniformizer and have empty characteristic-zero fibre.

Use `requiredTypeLiftExists` for this construction.

The sources are [KW II][kw-serre-modularity-II], proof of Proposition 4.5, p. 43, proof of Proposition 4.5, p. 45, Corollary 4.7 and proof, pp. 45-46, 10.3.1, p. 92, Corollary 4.7, p. 45.

*Needs:* `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product`; `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; [Layer 8, Finiteness of the KW unframed ring](#target-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring); `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`.

<a id="target-newton-thorne-khare-wintenberger-extraction"></a>
### 9.2 Points on prescribed Newton–Thorne components

Use Newton–Thorne Lemma 3.1 with p≥5, π RAESDC over totally real F, determinant ε⁻¹, weight zero and Steinberg at p, tame dihedral order p at v₀ with q_(v₀)≡−1 mod p, potential unramifiedness away from p, and residual image containing SL₂(F_(p^a)) for a>a₀(p). Select the ordinary potentially crystalline components at p, the Steinberg component at v₀, and the specified regular components elsewhere. Hida specialization and the explicit unipotently ramified lift establish local nonemptiness. The chosen global lift has determinant ε⁻²ω and Hodge–Tate weights {0,2}.

Use the Hida specialization π′ of the proof of Lemma 3.1 as the ordinary seed of §8.7: its characteristic-zero determinant is ε⁻²ω and its local weights are {0,2}. The original π has determinant ε⁻¹ and cannot itself serve as that seed. At each v|p, choose the unique regular potentially crystalline component through r_(π′,ι)|G_(F_v). Its ordinary locus is a union of components, as the source checks by dimension and the fixed Hodge type. After a single soluble extension killing all the finite p-adic inertial types, the universal restrictions factor through the semistable ordinary local quotients of the same transported weights. Use the reduced O-flat quotient characterization to prove the ring maps, not just membership of one characteristic-zero point. Choose this extension disjoint from the residual-kernel/cyclotomic field. The SL₂(F_(p^a)) image and a>a₀(p) condition supply the required adequacy; the nonordinary Steinberg component at v₀ is permitted by the unrestricted away-p ring in §8.7. Finite restriction and §8.7 then give module finiteness of the original selected-component global quotient. Its dimension bound gives a characteristic-zero point.

The automorphy of the extracted point is the lifting statement (1) of §8.6 (Thorne's Theorem 9.1 in rank two, after soluble CM base change and descent), applied with the ordinary seed π′; its residual image condition is the adequacy supplied by SL₂(F_(p^a))⊆ image with a>a₀(p).

**Checks.** The determinants ε⁻¹ and ε⁻²ω have the same residual reduction but different characteristic-zero Hodge sums; this detects the wrong seed. A Steinberg p-adic point has nonzero N and does not belong to the selected potentially crystalline component. The Steinberg component at v₀ is allowed because v₀∤p; requiring ordinarity at every place would discard the needed local lift.

The dimension bound gives dim R≥1 for the unframed global ring of these components, and the applicable finiteness comparison gives R finite over O. Hence R[1/p]≠0 and an integral characteristic-zero point exists over a finite coefficient extension. Its representation lies on the prescribed local components. Automorphy is obtained by a subsequent lifting application; it is not used as a premise for extracting this point.

Use `newtonThornePoint` for this construction.

The sources are [Newton–Thorne][newton-thorne], Lemma 3.1 and proof, §3, pp. 13–14 of arXiv:2212.03595v2; [Thorne][thorne], Theorem 9.1, pp. 53–54, and Theorem 10.2, pp. 56–58.

*Needs:* [Layer 8, Ordinary unframed-ring finiteness](#target-ordinary-global-ring-finiteness); [Layer 8, Rank-two ordinary automorphy lifting and ordinary finiteness](#target-rank-two-ordinary-automorphy-and-finiteness); `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6`; `LocalGaloisDeformationRings:R08.6/newton-thorne-local-quotients`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/hilbert-ordinary-weight-change` (the Hida specialization π′); `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-steinberg-lift`.

### Examples

The nontrivial special fibre and the chosen local component control point extraction; a zero algebra provides no characteristic-zero point.

### Dependencies

This layer uses `DeformationAndDerivedPatchingAlgebra`, `GlobalGaloisDeformations`, `LocalGaloisDeformationRings`, `PadicFamilies`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r24-3"></a>
## Layer 10: Prescribed lifts


Use the global presentation and finiteness separately, then identify the resulting local types. A compatible inertial lattice is not a substitute for a local solution of a prescribed lifting problem.

<a id="target-bockle-presentation"></a>
### 10.1 Böckle's global-ring presentation

Let ρ̄ : G_ℚ → GL₂(k) be odd and absolutely irreducible, with a global deformation condition X unramified outside finite S. Set d=0 and Ad_X=Ad⁰ρ̄ for fixed determinant, and d=1 and Ad_X=Adρ̄ otherwise. Assume the away-p local rings are complete intersections flat over ℤ_p of relative dimension h⁰(G_l,Ad_X)−Δ_l, and the p-adic ring is a flat complete intersection of relative dimension h⁰(G_p,Ad_X)+1+d−Δ_p. Writing Δ=ΣΔ_l, obtain a presentation R_X ≅ O[[x₁,…,x_(n+d)]]/(f₁,…,f_(n+Δ)). In particular Δ≤0 gives at most as many relations as variables; the minimal fixed-determinant case has a presentation W[[X₁,…,X_r]]/(f₁,…,f_s) with r≥s. Oddness enters the global Euler-characteristic computation. These local dimensions come from R08.6, and finiteness over O remains the separate input of Layer 8.

Use `bockle_presentation` for this construction.

The sources are [Böckle][bockle-appendix-2003], Proposition 1, p. 2, Proof of Proposition 1, p. 2; [KW Annals][kw-annals-2009], Proposition 3.4, printed p. 240.

*Needs:* `GlobalGaloisDeformations:R04.3/local-to-global-presentation`; `GlobalGaloisDeformations:R04.3/relative-tangent-space`; `LocalGaloisDeformationRings:R08.6/kw-local-conditions`.

<a id="target-finite-presentation-complete-intersection"></a>
### 10.2 Finite presentations and complete intersections

Let O be a complete DVR with uniformizer π, let A=O[[x₁,…,x_n]], and take f₁,…,f_m in its maximal ideal with m≤n. Suppose R=A/(f₁,…,f_m) is nonzero, complete noetherian local, has the same residue field as O, and is finite over O. Then m=n, (π,f₁,…,f_n) is A-regular, and R is a finite flat complete intersection over O with R[1/π]≠0. Import the regular-local/Cohen–Macaulay proof from R03.3 and, when Frac(O) has characteristic zero, point extraction through Layer 9 from R03.4. Finiteness is essential: O[[x]] has no relations and is flat but is not finite over O, so it cannot imply m=n.

Define `Presentations.HasPresentation O R r s` by an O-algebra equivalence with the quotient of r-variable formal power series by s equations. Define `Presentations.IsFlatCompleteIntersection O R d` by O-flatness and such a presentation with s+d variables and an s-term regular sequence, including a nonzero final quotient.

The API exposes the presentation equivalence, flatness and regular sequence; `Presentations.finite_presentation_complete_intersection` derives equal counts and regularity starting with an arbitrary uniformizer π.

**Checks.**

- `presentation_empty`: O has a presentation with zero variables and zero equations.
- `presentation_variable`: O also has the one-variable presentation O[[x]]/(x).
- `presentation_unit`: O[[x]]/(1) is a valid presentation of the zero algebra, so presentation alone does not imply nontriviality.
- `ci_empty`: every nonzero O is flat over itself and has relative dimension zero via the empty regular sequence.
- `ci_variable`: for nonzero noetherian O, O[[x]] is O-flat of relative dimension one; arbitrary coefficient rings are excluded.
- `ci_unit`: over ℚ, the quotient by (1) fails the regular-sequence nonzero-quotient condition.
- `ci_torsion`: ℤ/2 is not ℤ-flat, so it fails the flat-complete-intersection predicate.

Use `Presentations.finite_presentation_complete_intersection` for this construction.

The sources are [Böckle][bockle-appendix-2003], Lemma 2, p. 5; [Stacks Project, §10.97, Lemma 10.97.2](https://stacks.math.columbia.edu/tag/00MB) for noetherian completion flatness in `ci_variable`.

*Needs:* `mathlib:RingTheory.Sequence.IsRegular`; `mathlib:IsLocalRing`; `mathlib:ringKrullDim`; `mathlib:Module.Flat`; `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`; [Layer 9](#layer-r24-2).

<a id="target-bockle-minimal-r-equals-t"></a>
### 10.3 From auxiliary to minimal R=T

In Böckle's appendix to Khare's 2003 deformation/Hecke-ring theorem, assume an auxiliary set Q for which R_Q → T_Q is an isomorphism of finite flat W(k)-algebras. The minimal comparison R_∅ → T_∅ is then an isomorphism. Use the surjection R_Q → R_∅ for finiteness and compare geometric points of the generic fibres with the reduced finite flat Hecke algebras. The auxiliary R=T theorem is an input from R22; this comparison does not independently construct the auxiliary modular lift.

Use `bockle_minimal_r_equals_t` for this construction.

The sources are [Böckle][bockle-appendix-2003], Theorem 1, p. 1.

*Needs:* [Layer 10, Böckle's global-ring presentation](#target-bockle-presentation); [Layer 10, Finite presentations and complete intersections](#target-finite-presentation-complete-intersection); `GL2ModularityLifting:R22.3/minimal-ring-finite`; `AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`.

<a id="target-kw-annals-minimal-lifts"></a>
### 10.4 The minimal-lift theorem

For an S-type residual representation in odd characteristic, assume absolute irreducibility over ℚ(μ_p), 2≤k(ρ̄)≤p+1 and k(ρ̄)≠p. There is a lift minimally ramified at every prime. At k=p+1 one can choose either crystalline Hodge–Tate weights (0,p) or semistable weight two. Combine the minimal ring's presentation with at least as many variables as relations, potential-modularity finiteness and the complete-intersection result, then extract a characteristic-zero point. The source excludes weight p because its Fontaine–Laffaille and R=T inputs do not supply that case. This method is the one attributed to the remark in Khare–Ramakrishna §5.2; the theorem and its proof occur in KW Annals §3. The coefficient field of a lift is not fixed by the theorem.

Use `kw_annals_minimal_lifts` for this construction.

The sources are [KW Annals][kw-annals-2009], Theorem 3.3, printed p. 239, Introduction, printed p. 231, Lemma 3.6, printed p. 241, References, printed p. 252, Proof of Proposition 3.8, printed p. 242.

*Needs:* [Layer 10, Böckle's global-ring presentation](#target-bockle-presentation); [Layer 10, Finite presentations and complete intersections](#target-finite-presentation-complete-intersection); `LocalGaloisDeformationRings:R08.6/export-endpoint-weight`; `GL2ModularityLifting:R22.3/minimal-ring-finite`; [Layer 8](#layer-r24-1).

<a id="target-required-lift-types"></a>
### 10.5 The four required lift types

Fix an S-type ρ̄, with cyclotomic absolute irreducibility and 2≤k(ρ̄)≤p+1 for p>2, or nonsoluble image for p=2. A lift of required type is an O′-point of the fixed-determinant global ring for one of the following local prescriptions.

1. It is minimal at all l≠p and crystalline of weight k(ρ̄) at p. Require k=2 when p=2.
2. It is minimal at all l≠p and has weight two at p, with inertial WD parameter (ω_p^(k−2)⊕1,0). At k=p+1 replace this by (id,N) with N≠0 nilpotent; the dyadic exceptional weight is k=4.
3. Let q be odd with q∥N(ρ̄), p|(q−1) and residual inertia (χ,*;0,1). At p use type 2, and be minimal away from p,q. At q prescribe (χ′,*;0,1), where χ′=ω_q^i lifts χ and 0<i≤q−2. Require i even when p=2.
4. Let q≠p, p|(q+1), and assume residual decomposition-group shape (χ_p,*;0,1) up to unramified twist. At p use type 2 and be minimal away from p,q. At q prescribe χ′⊕χ′^q, with χ′=ω_(q,2)^iω_(q,2)^(qj) of p-power order and genuinely level two, 0≤j<i≤q−1. Require i+j even when p=2. Such a character is unavailable in the dyadic case v₂(q+1)=1.

The numerical part is `LiftParameters.RequiredLiftParameters`, with the four constructors and the displayed prime, exponent, order and parity restrictions. Its `auxiliaryPrime` returns q only in cases 3–4. Its `requiresSteinberg` is false for the minimal crystalline case and otherwise tests k=p+1. These parameters do not encode the residual local representation, determinant or point of a deformation ring; `RequiredLiftType` includes all those arithmetic data.

Minimality uses Diamond's condition and the dyadic version from KW II §3.3.1, imported through R08.6. In type 4 the distinct inertia characters split any characteristic-zero extension. If q∥N(ρ̄) and p∤q−1, a geometric lift with q∥N(ρ) is automatically minimal there; this explains the divisibility hypothesis of type 3.

The construction has the following API:

- `RequiredLiftType`: the case (1)–(4) with its auxiliary data (q, χ′) and the fixed character ψ
- `RequiredLiftType.localCondition`: the local condition X_v of LocalGaloisDeformationRings R08.6 at each v ∈ S
- `RequiredLiftType.ring`: the ring R̄^ψ_S of GlobalGaloisDeformations R04.6 for these conditions
- `RequiredLiftType.points_iff`: 𝒪′-points of the ring ↔ lifts of the required type
- `RequiredLiftType.det`: every lift of the type has determinant ψχ_p

**Checks.**

- `type3_parity_p2`: p = 2, q = 5: χ′ = ω₅ has i = 1 odd and is excluded; ω₅² (i = 2) is allowed
- `type4_level_two_exists`: p = 2: q = 7 has v₂(8) = 3 ≥ 2, so level-2 characters of 2-power order exist; q = 5 has v₂(6) = 1 and none exist
- `type2_steinberg`: k(ρ̄) = p + 1: the inertial parameter is (id, N ≠ 0), a Steinberg type
- `type2_parameters`: the weight-two prescription has no auxiliary prime; at p=3 its weight k=4 requires Steinberg monodromy, whereas k=2 does not.
- `type3_needs_p_divides`: p=3, q=5: 3∤4=q−1, so type (3) is unavailable. For a geometric regular lift with q∥N(ρ̄), the imported R08.6 automatic-minimality criterion applies at q when p∤q−1.

Use `RequiredLiftType` for this construction.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1, p. 9 of the preprint, Theorem 5.1(4), p. 10 of the preprint, Remark after Theorem 5.1, p. 10.

*Needs:* `LocalGaloisDeformationRings:R08.6/kw-local-conditions`; `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `AlgebraicModularFormsAndSerreWeights:R15.6`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`.

<a id="target-theorem-5-1-part-1-minimal-crystalline"></a>
### 10.6 Minimal crystalline lifts

With the common hypotheses of the required-type definition, obtain a type-1 lift, minimal away from p and crystalline of weight k at p. At p=2 require k=2. The odd-prime case includes k=p, using the KW II local rings and finiteness argument that extend beyond the Annals theorem.

Use `theorem_5_1_part_1_minimal_crystalline` for this construction.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(1), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* [Layer 10, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [Layer 8](#layer-r24-1); [Layer 9](#layer-r24-2).

<a id="target-theorem-5-1-part-2-weight-two"></a>
### 10.7 Minimal weight-two lifts

With the common required-type hypotheses, obtain a type-2 weight-two lift, minimal away from p. Its inertial WD parameter is (ω^(k−2)⊕1,0), or (id,N≠0) in the exceptional k=p+1 branch. At p=2,k=4 use the semistable noncrystalline weight-two condition C.

Use `theorem_5_1_part_2_weight_two` for this construction.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(2), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* [Layer 10, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [Layer 8](#layer-r24-1); [Layer 9](#layer-r24-2).

<a id="target-theorem-5-1-part-3-level-one-type-at-q"></a>
### 10.8 A level-one type at q

Under the common hypotheses and the complete type-3 local prescription, construct a lift with the chosen level-one inertia character χ′=ω_q^i at q and the specified weight-two p-type. The character parity at p=2, q∥N(ρ̄) and p|(q−1) remain essential. Once this lift lies in a system, an irreducible residual q-member has normalized Serre weight i+2 or q+1−i up to twist, as determined by its coefficient-prime type.

Use `theorem_5_1_part_3_level_one_type_at_q` for this construction.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(3), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* [Layer 10, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [Layer 8](#layer-r24-1); [Layer 9](#layer-r24-2); `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

<a id="target-theorem-5-1-part-4-level-two-type-at-q"></a>
### 10.9 A level-two type at q

Under the common hypotheses and the type-4 residual shape, divisibility p|(q+1), genuine level-two p-power character and dyadic parity restrictions, construct the prescribed lift. This inserts a good dihedral prime for the applications in ClassicalSerreModularity R27.1. The exceptional p=2,v₂(q+1)=1 case cannot be supplied with the required character.

Use `theorem_5_1_part_4_level_two_type_at_q` for this construction.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(4), p. 10 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* [Layer 10, The four required lift types](#target-required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; [Layer 8](#layer-r24-1); [Layer 9](#layer-r24-2); `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

<a id="target-theorem-5-1-application-table"></a>
### 10.10 Lift prescriptions in the modularity arguments

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

Use `theorem_5_1_application_table` for this construction.

The sources are [Dieulefait–Pacetti v2][dieulefait-pacetti], Proof of Theorem 1.9, p. 6 of the arXiv version; [KW I][kw-serre-modularity-I], §8.2, pp. 13–15 of the preprint.

*Needs:* [Layer 10, Minimal crystalline lifts](#target-theorem-5-1-part-1-minimal-crystalline); [Layer 10, Minimal weight-two lifts](#target-theorem-5-1-part-2-weight-two); [Layer 10, A level-one type at q](#target-theorem-5-1-part-3-level-one-type-at-q); [Layer 10, A level-two type at q](#target-theorem-5-1-part-4-level-two-type-at-q); [Layer 10, The minimal-lift theorem](#target-kw-annals-minimal-lifts).

<a id="target-modern-prescribed-type-lifts"></a>
### 10.11 Prescribed-type local-to-global lifting

Let p be odd and F totally real. Assume ρ̄ is odd, absolutely irreducible on G_(F(ζ_p)); if p=5 and its projective image is PGL₂(F₅), also assume [F(ζ₅):F]=4. For finite Σ containing p and all ramification, finite-order ψ with det ρ̄=ψ̄χ̄_p, a definite type t and inertial types τ_v, consider weight-two lifts of determinant ψχ_p, unramified outside Σ, with those local data. There are finitely many solutions, and a solution exists exactly when actual local solutions exist at every specified place. A compatible definite type on a subset Σ′ also gives the lift of Snowden Theorem 7.6.1.

For the application over ℚ the p=5 exception is automatic. Use crystalline p-type when k=2 and Steinberg p-type when k=p+1 where asserted. An inertial-type lattice reducing to residual inertia does not by itself provide a lift of the complete local decomposition-group representation with the chosen determinant and definite type. Establish that local nonemptiness through R08.6 before applying the theorem. Inertial type forgets N; definite type retains the relevant monodromy information. Snowden Proposition 7.7.1 supplies some definite-type lift of the same conductor, rather than every prescribed inertial type.

Use `modern_prescribed_type_lifts` for this construction.

The sources are [Snowden v1][snowden-2009], Theorem 7.2.1, p. 21 of arXiv:0905.4266v1, §1.4, notation, p. 3 of arXiv:0905.4266v1, §3.1 (A1)–(A2), p. 6; §7.1–7.7, pp. 20–23, especially Propositions 7.3.1 and 7.4.1 and Theorem 7.6.1 (arXiv v1); [Dieulefait–Pacetti v2][dieulefait-pacetti], Theorem 1.9(4), p. 6 of the arXiv version.

*Needs:* `LocalGaloisDeformationRings:R08.6`; [Layer 8](#layer-r24-1); [Layer 9](#layer-r24-2); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`.

### Examples

The q=5 and q=7 dyadic checks distinguish the two inertial character types. A quotient by the unit ideal is excluded from complete-intersection point extraction.

### Dependencies

This layer uses `AlgebraicModularFormsAndSerreWeights`, `ArithmeticGaloisRepresentations`, `AutomorphicGaloisRepresentations`, `DeformationAndDerivedPatchingAlgebra`, `GL2ModularityLifting`, `GlobalGaloisDeformations`, `LocalGaloisDeformationRings`, `mathlib`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r24-4"></a>
## Layer 11: Rational-field modularity lifting


Import the full rational-field lifting theorems, rather than reconstructing them from a smaller totally real theorem. This layer supplies the comparison needed by linked systems.

<a id="target-alpha-beta-from-residual-modularity"></a>
### 11.1 Residual weight witnesses for lifting

For a modular S-type ρ̄ satisfying the image hypotheses of KW I Theorem 4.1, import the weight part of Serre's conjecture to produce a weight-k witness of level prime to p and a weight-two witness of level Np. An allowable soluble totally real base change, unramified or split at p as required, gives the residual conditions (α),(β) used in the odd-prime lifting theorem, and (α) at p=k=2 and (β) at p=2. Gross's auxiliary level condition N>4 causes no restriction because the level need not be optimal. The k=p argument has the separate treatment of KW II §10.2.

Use `alpha_beta_from_residual_modularity` for this construction.

The sources are [KW II][kw-serre-modularity-II], §10.2, p. 92 of the preprint.

*Needs:* `GL2ModularityLifting:R22.5/kw-residual-modularity`; `SerreWeightAndLevelOptimisation:R20.6`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`; `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`.

<a id="target-kw-theorem-4-1"></a>
### 11.2 The full rational-field lifting theorem

Import the full rational-field modularity lifting theorem from R22.5/R22.6. Suppose ρ̄ is modular, with nonsoluble image at p=2 and absolute irreducibility on G_(ℚ(μ_p)) at p>2. For p=2, an odd finitely ramified lift is modular if crystalline of weight two, or semistable of weight two with residual k=4. For p>2, a finitely ramified lift is modular if crystalline of weight 2≤k≤p+1 or potentially semistable of weight two.

The interface combines residual weight witnesses, allowable base change, the relevant cases of KW II Theorem 9.7, the additional lifting inputs and soluble descent. Import `R22.5/kw-i-theorem-4-1-odd-prime` and `R22.6/kw-i-theorem-4-1-dyadic`: substituting Theorem 9.7 alone would lose some odd-prime cases, including the additional nonordinary weight-p+1 input.

Use `kw_theorem_4_1` for this construction.

The sources are [KW I][kw-serre-modularity-I], Theorem 4.1, p. 7 of the preprint; [KW II][kw-serre-modularity-II], §10.2, p. 92 of the preprint.

*Needs:* [Layer 11, Residual weight witnesses for lifting](#target-alpha-beta-from-residual-modularity); `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`; `GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

### Examples

At p=2 the dyadic theorem applies; at odd p, the residual and coefficient-prime hypotheses select the imported lifting interface.

### Dependencies

This layer uses `AlgebraicModularFormsAndSerreWeights`, `GL2AutomorphicRepresentationsAndTransfer`, `GL2ModularityLifting`, `SerreWeightAndLevelOptimisation`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r24-5"></a>
## Layer 12: Families through potentially modular lifts


Start with a given potentially modular lift. Automorphic families over soluble intermediate fields give a virtual Brauer class; prove its genuineness before asserting that it is a compatible family. The full coefficient-prime theorem then gives all-place strictness.

<a id="target-brauer-induction-system"></a>
### 12.1 Genuine families from Brauer induction

Suppose a given two-dimensional lift ρ becomes the representation of a holomorphic cuspidal Hilbert form over a finite totally real Galois F/ℚ, and remains absolutely irreducible over F. Write the trivial character of G=Gal(F/ℚ) as Σn_i Ind_(G_i)^Gχ_i with soluble G_i and fixed fields F_i. Soluble base change gives the corresponding cuspidal forms π_i over F_i. In every coefficient characteristic define the virtual class A_ι=Σn_i Ind_(G_F_i)^(G_ℚ)(χ_i⊗ρ_(π_i,ι)).

Assume the automorphic members at these soluble intermediate fields are absolutely irreducible and their overlaps are identified by Frobenius recognition. The dimension-two, norm-one pairing calculation then proves A_ι is a genuine absolutely irreducible representation. Its good traces agree with the given lift, it is independent of Brauer choices, and restriction to any F′⊆F with F/F′ soluble gives the member of the descended automorphic form. Put all automorphic families and characters over one finite coefficient field before forming the family; unrelated coefficient fields at different primes do not define a system.

The construction has the following API:

- `brauerSystem`: ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}) from the Brauer data and the base-changed π_i
- `brauerSystem_isTrue`: The virtual class has dimension 2 and norm-one pairing, hence is the class of a genuine absolutely irreducible member.
- `brauerSystem_trace`: After mapping the common algebraic trace into both coefficient fields, all good Frobenius characteristic polynomials agree with the given p-member; no direct equality between ℓ-adic and p-adic values is asserted.
- `brauerSystem_unique`: Uniqueness memberwise up to representation isomorphism after a common coefficient extension; no canonical basis, lattice or conjugating matrix is asserted.
- `brauerSystem_restrict`: restriction to G_{F′} with F/F′ solvable is automorphic

**Checks.**

- `brauer_trivial_F`: F = ℚ: 1_G = Ind 1, and ρ_ι = ρ_{π,ι} is the system of π itself
- `brauer_quadratic_coefficients`: G = ℤ/2: the regular character (2, 0) minus the sign character (1, −1) is the trivial character (1, 1), i.e. 1_G = Ind_1^G 1 − ε
- `brauer_virtual_nonexample`: the virtual character 3·1 − ε of ℤ/2 has degree 2 but value 4 at the generator, more than its degree, so it is not a character: degree 2 alone does not make a virtual representation true
- `brauer_trace_agreement`: For the geometric/dual family of a non-CM elliptic curve E/ℚ with F=ℚ, the construction returns the given automorphic cohomological family (or its KW-normalized dual) memberwise up to isomorphism.

Use `brauerSystem` for this construction.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93 of the preprint; [Khare, level one][khare-level-one], §3, proof of Proposition 3.1, pp. 16–17 of arXiv:math/0504080v1 (KW II cite it as the proof of Theorem 5.1 of the Duke version).

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); [Layer 1, Twisting, restriction and induction](#target-system-operations); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; [Layer 5](#layer-r23-4); `ArithmeticGaloisRepresentations:R01.5`; [Layer 1, The arithmetic representation ring](#target-galois-grothendieck-ring); `AutomorphicGaloisRepresentations:R19.3`; `AutomorphicGaloisRepresentations:R19.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`; `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

<a id="target-almost-strict-compatibility"></a>
### 12.2 The historical almost-strict comparison

For the Brauer family choose the decomposition field F(q) at a place Q|q and the local WD parameter r_q of the form descended there. Away from the coefficient characteristic, Carayol–Taylor local–global compatibility identifies r_q with the member's parameter. At q=l≠2 with unramified r_q, the Breuil–Berger input gives crystallinity and the same parameter. At q=l with irreducible residual member, Kisin's deformation input, after disjoint field selection, gives the geometric comparison. Together these establish exactly KW almost strictness. The contract does not cover q=l=2 with reducible residual member, nor a reducible residual member with ramified r_q. The strict result below uses a stronger coefficient-prime theorem.

Use `almost_strict_compatibility` for this construction.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93, §10.3.2, p. 94.

*Needs:* [Layer 12, Genuine families from Brauer induction](#target-brauer-induction-system); `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); `AutomorphicGaloisRepresentations:R19.3`; `AutomorphicGaloisRepresentations:R19.4`; [Layer 6](#layer-r23-5); `AutomorphicGaloisRepresentations:R19.5`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`; `AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

<a id="target-strict-brauer-system"></a>
### 12.3 All-place strictness of the Hilbert–Brauer family

For the Brauer family built from holomorphic cuspidal Hilbert forms of motivic weights k_τ≥2, Skinner's full coefficient-prime theorem supplies common Hodge–Tate weights and Frobenius-semisimple WD comparison at every finite q, including q=l, l=2 and residually reducible members. Decomposition-field descent therefore gives KW all-place strict compatibility. Unramified r_q then gives crystallinity, using the de Rham criterion that WD inertia is trivial and N=0.

Purity of the Hilbert modular families in the geometric convention descends to the same weight w; local strict purity is transported by local–global comparison. Invoke the automorphic purity and Skinner suppliers separately: BLGGT's away-coefficient strictness by itself does not establish the full coefficient-prime comparison.

Use `strict_brauer_system` for this construction.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, pp.93–94; [Skinner][skinner-2009], Theorem 1, pp.241–243; proof §2, pp.244–255; [BLGGT v4][blggt-2014-v4], §2.1 Theorem 2.1.1, pp.33–34; §5.1 pp.62–63.

*Needs:* [Layer 12, Genuine families from Brauer induction](#target-brauer-induction-system); `AutomorphicGaloisRepresentations:R19.5`; `AutomorphicGaloisRepresentations:R19.4`; `WeightsInEtaleCohomology:R34.6`; `PadicHodgeTheory:R06.3/weil-deligne-descent`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`; `AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

<a id="target-kw-theorem-5-1-systems"></a>
### 12.4 Families through the four required lifts

For an S-type residual representation satisfying the common KW I Theorem 5.1 hypotheses, and for each of the four lift types with its extra local conditions, obtain an E-rational odd irreducible almost-strict family whose selected p-member lifts ρ̄ with that type. In type 3, an irreducible residual q-member has weight i+2 or q+1−i up to twist. In type 4 for odd q, it has weight q+1−(i−j) or i−j when i>j+1, and weight q when i=j+1. These computations use Savitt's reductions of tame potentially Barsotti–Tate types (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5, `savitt-residual-types`).

The q=2 order-three application has its separate KW argument giving residual weight two; Savitt's theorem is not applied there. Diamond's allowed pairs j=m(q+1)/p^r−1 and i=q−1−j, 0<m<p^r/2, exclude i=j+1 in that selection. The good polynomials lie in one finite coefficient field. For these constructed families, the full coefficient-prime theorem upgrades almost strictness to strictness and supplies purity with the stated geometric normalization.

Use `kw_theorem_5_1_systems` for this construction.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1, p. 9 of the preprint, Remark after Theorem 5.1, p. 10, Proof of Theorem 9.1, p. 19 of the preprint; [KW II][kw-serre-modularity-II], §10.3.2, p. 94.

*Needs:* [Layer 10, Minimal crystalline lifts](#target-theorem-5-1-part-1-minimal-crystalline); [Layer 10, Minimal weight-two lifts](#target-theorem-5-1-part-2-weight-two); [Layer 10, A level-one type at q](#target-theorem-5-1-part-3-level-one-type-at-q); [Layer 10, A level-two type at q](#target-theorem-5-1-part-4-level-two-type-at-q); [Layer 12, Genuine families from Brauer induction](#target-brauer-induction-system); [Layer 12, The historical almost-strict comparison](#target-almost-strict-compatibility); `AlgebraicModularFormsAndSerreWeights:R15.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/savitt-residual-types`; [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system).

<a id="target-dieulefait-families"></a>
### 12.5 Families through given lifts

Take an odd irreducible continuous finitely ramified p-adic lift over ℚ, de Rham with Hodge–Tate weights {0,k−1}, k>1, whose residual restriction to ℚ(ζ_p) is absolutely irreducible, or whose residual image is nonsoluble at p=2. Construct a family for the following scope: after twisting, the residual representation satisfies the KW hypotheses, and the given lift has p-type A/B/C of Layer 5; at p=2 it is crystalline weight two or semistable weight two with non-finite residual local representation. This includes the minimal crystalline cases and the weight-two cases that are crystalline, Steinberg or KW type B at p. Potential modularity of the **given** lift and the Brauer construction, followed by the strict upgrade, give the de Rham condition at every member required by the Dieulefait–Pacetti definition.

The broader de Rham statement of DP Theorem 1.11 requires additional potential modularity: other potentially Barsotti–Tate inertial types need their lifting theorem, and k>p+1 or potentially semistable weight greater than two need a regular de Rham lifting theorem. These are boundaries of Layer 5. Dieulefait's 2004 Theorem 1.1 assumes crystallinity at an odd q, weights {0,w} with w odd, and q≥2w+1; it is not the source of the unrestricted statement.

Use `dieulefait_families` for this construction.

The sources are [Dieulefait–Pacetti v2][dieulefait-pacetti], Theorem 1.11, p. 7 of the arXiv version, Proof of Theorem 1.11, p. 7 of the arXiv version, Definition 1.10(4), p. 7 of the arXiv version; [Dieulefait, families][dieulefait-2004], Theorem 1.1, pp. 1–2 of arXiv:math/0304433v1.

*Needs:* [Layer 5](#layer-r23-4); [Layer 12, Genuine families from Brauer induction](#target-brauer-induction-system); [Layer 12, The historical almost-strict comparison](#target-almost-strict-compatibility); [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system).

### Examples

A positive virtual dimension alone cannot make a Brauer combination genuine. Pairing one, positive dimension and compatible restriction identify the actual rank-two family.

### Dependencies

This layer uses `AlgebraicModularFormsAndSerreWeights`, `ArithmeticGaloisRepresentations`, `AutomorphicGaloisRepresentations`, `GL2AutomorphicRepresentationsAndTransfer`, `PadicHodgeTheory`, `WeightsInEtaleCohomology`, `tauceti`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r24-6"></a>
## Layer 13: Residual members and linked systems


Reduce actual coefficient members on stable lattices, retaining the local and image conditions required by a change-of-prime argument. Distinguish a cofinite rank-two assertion from a general-rank density-one assertion.

<a id="target-residual-members"></a>
### 13.1 Residual members and their weights

For an E-rational odd irreducible rank-two almost-strict family over ℚ, take stable lattices and semisimplified reductions. Their determinants reduce the characteristic-zero determinants and their complex conjugations remain odd. Absolute irreducibility holds at every embedding above all but finitely many rational primes, using fixed Hodge weights and the uniform conductor bound. If a≠b, the restriction to ℚ(ζ_l) is also absolutely irreducible for all but finitely many l: outside ramification with l>2(a−b)+1, the weight a−b+1 cannot equal either (l+1)/2 or (l+3)/2 forced by the reducible-restriction alternative.

For q≠l the residual Artin conductor divides that of r_q. Finite inertia of order prime to l reduces injectively, preserving its shape, including the dihedral case of order 2t^a with l∤2t. At an odd l outside ramification, the member is crystalline. If the residual member is S-type and **1≤a−b≤l−2**, its normalized Serre weight is a−b+1 after twisting. Equal weights are excluded: an odd absolutely irreducible unramified Artin residual member has normalized weight l, not one. The general-rank regular-system theorem gives the cyclotomic restriction statement for every constituent on a density-one set, rather than this rank-two cofinite conclusion.

Use `residual_members` for this construction; the weight inequality is `ResidualMembers.weight_ne_half_weights` in Suggested.lean.

The sources are [KW I][kw-serre-modularity-I], Proof of Theorem 10.1, p. 20 of the preprint, §8.4, p. 17 of the preprint, Lemma 6.2(ii), p. 11 of the preprint, §1, p. 2 of the preprint; §10.1, p. 20; [Swinnerton-Dyer][swinnerton-dyer-1973], §2, Corollary 1, p. 15; §4, corollary to Theorem 4 and the weight-12 congruences, pp. 31–33; [Dieulefait–Pacetti v2][dieulefait-pacetti], Lemma 1.14, proof, p. 9 of arXiv:2108.07577v2.

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); `ArithmeticGaloisRepresentations:R01.3`; `ArithmeticGaloisRepresentations:R01.4`; `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`; `AlgebraicModularFormsAndSerreWeights:R15.4`; [Layer 1, Density-one residual irreducibility](#target-residual-irreducibility-density-one); [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `AlgebraicModularFormsAndSerreWeights:R15.4/fontaine-laffaille-weight-comparison`; `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`.

<a id="target-local-compatibility-at-the-coefficient-prime"></a>
### 13.2 Local information at the coefficient prime

For an arbitrary KW almost-strict family at its coefficient prime l, use only its residual-irreducible full WD/geometric clause or, for odd l and unramified parameter, its crystalline clause. Otherwise the definition gives no de Rham or WD comparison there. For the motivic Hilbert/Brauer families constructed here, the strict theorem gives potential semistability, common Hodge data and full WD comparison for every l, including l=2 and reducible residual members; an unramified parameter gives crystallinity. Applications of residually reducible de Rham modularity lifting use the theorem of GL2ModularityLifting R32.6.

Use `local_compatibility_at_the_coefficient_prime` for this construction.

The sources are [KW I][kw-serre-modularity-I], §5, p. 8 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Paso 5, p. 14 of the arXiv version.

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); [Layer 12, The historical almost-strict comparison](#target-almost-strict-compatibility); [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system); `AutomorphicGaloisRepresentations:R19.5`; `PadicHodgeTheory:R06.3/weil-deligne-descent`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`.

<a id="target-linked-systems-modularity-transfer"></a>
### 13.3 Links and modularity transfer

If one characteristic-zero member of a rank-two family agrees with the member of a newform f, comparison of the common good Frobenius polynomials and Chebotarev–Brauer–Nesbitt recognition identify every member with f's family after a common coefficient extension. Define a link between two systems at λ by an isomorphism of their selected semisimplified residual members. Given a link to a modular family, apply the imported KW I Theorem 4.1 only after checking its local and image hypotheses: nonsoluble residual image at 2, cyclotomic absolute irreducibility at odd characteristic, and the required local lift type. The systems may have different conductors and weights. The modern residually reducible de Rham transfer is the R32.6 input.

Use `linked_systems_modularity_transfer` for this construction.

The sources are [KW I][kw-serre-modularity-I], §8.2, p. 15 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Remark 4, p. 7 of the arXiv version.

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); `ArithmeticGaloisRepresentations:R01.5`; [Layer 11, The full rational-field lifting theorem](#target-kw-theorem-4-1); `AutomorphicGaloisRepresentations:R19.3`; `GL2ModularityLifting:R32.6/transfer-residually-reducible`; `GL2ModularityLifting:R32.6/transfer-dyadic`; `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`.

### Examples

Residual weight comparisons exclude the two exceptional cyclotomic-restriction weights, and linked-family transfer preserves each embedding and local normalization.

### Dependencies

This layer uses `AlgebraicModularFormsAndSerreWeights`, `ArithmeticGaloisRepresentations`, `AutomorphicGaloisRepresentations`, `GL2ModularityLifting`, `PadicHodgeTheory`. The exact declarations and earlier constructions are specified by *Needs* at each subsection.

## Downstream consumers

ClassicalSerreModularity R26–R27 and R33 consume the presentations, required lifts, good-dihedral-prime prescriptions, Brauer families and linked-family transfers. PotentialAutomorphyInfrastructure PA.5 and ModularityAndLanglandsExtensions ML.2 consume the field-selection and higher-rank compatible-system interfaces, and EllipticCurveModularityPartIIGL2TypeAbelianVarieties the rank-two families. These are applications, not suppliers to this roadmap.

## References

Page numbers below follow the indicated edition. BLGGT v1 and v4 have different numbering and pagination: the v4 archimedean formulas and CM constituent statement are used where specified. All mathematical statements above are formulations for this roadmap; citations identify their sources and the relevant hypotheses.

- **[Moret–Bailly II][moret-bailly-1989-II]** — Laurent Moret-Bailly. *Groupes de Picard et problèmes de Skolem II*. Ann. Sci. ENS (4) 22 (1989), 181–194; printed journal pages.

- **[Moret–Bailly I][moret-bailly-1989-I]** — Laurent Moret-Bailly. *Groupes de Picard et problèmes de Skolem I*. Ann. Sci. ENS (4) 22 (1989), 161–179; printed journal pages.

- **[Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur]** — Richard Taylor. *Remarks on a conjecture of Fontaine and Mazur*. Author preprint dated 23 May 2000 of the JIMJ 2002 paper; its printed page numbers, one behind the PDF page index.

- **[KW II][kw-serre-modularity-II]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *Serre's modularity conjecture (II)*. Author proofs.pdf preprint, 98 pages, of Invent. Math. 178 (2009), 505–586; preprint page numbers.

- **[KW Annals][kw-annals-2009]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*. Annals 169 (2009), 229–253; printed journal pages.

- **[Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation]** — Richard Taylor. *On the meromorphic continuation of degree two L-functions*. Documenta Math., Coates volume (2006), 729–779; printed journal pages (PDF page +728).

- **[Qian][qian]** — Lie Qian. *Potential automorphy for GL_n*. arXiv:2104.09761v1 (19 April 2021), published in Invent. Math. 231 (2023); arXiv v1 printed pagination.

- **[CHT][cht]** — Laurent Clozel, Michael Harris, Richard Taylor. *Automorphy for some l-adic lifts of automorphic mod l Galois representations*. Publ. Math. IHES 108 (2008), 1–181; printed journal pages.

- **[BLGHT][blght]** — Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor. *A family of Calabi–Yau varieties and potential automorphy II*. Final author copy (2010) of Publ. RIMS 47 (2011); author pagination.

- **[BHKT v2][bhkt]** — Gebhard Böckle, Michael Harris, Chandrashekhar Khare, Jack Thorne. *G-hat-local systems on smooth projective curves are potentially automorphic*. arXiv:1609.03491v2; author pagination.

- **[Bianchi potential automorphy][bianchi]** — George Boxer, Frank Calegari, Toby Gee, James Newton, Jack Thorne. *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*. arXiv:2309.15880v3, final author version; author pagination.

- **[Boxer–Calegari–Gee–Pilloni][bcgp-published]** — George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. *Abelian surfaces over totally real fields are potentially modular*. Publ. Math. IHES 134 (2021), 153–501; printed journal pages.

- **[Snowden v1][snowden]** — Andrew Snowden. *On two dimensional weight two odd representations of totally real fields*. arXiv:0905.4266v1 (2009); author pagination.

- **[Calegari][calegari]** — Frank Calegari. *Even Galois representations and the Fontaine–Mazur conjecture II*. arXiv:1012.4819, author preprint of JAMS 25 (2012); author pagination.

- **[Thorne][thorne]** — Jack Thorne. *On the automorphy of l-adic Galois representations with small residual image*. Author copy of JIMJ 11 (2012); author pagination.

- **[Skinner–Wiles, base change][sw-base-change]** — Christopher Skinner and Andrew Wiles. *Base change and a problem of Serre*. Duke Math. J. 107 (2001), 15–25; printed journal pages.

- **[Gee–Geraghty][gee-geraghty]** — Toby Gee and David Geraghty. *Companion forms for unitary and symplectic groups*. Final author preprint of Duke Math. J. 161 (2012); author page numbers.

- **[Geraghty, ordinary][geraghty-ordinary]** — David Geraghty. *Modularity lifting theorems for ordinary Galois representations*. Author preprint of 12 March 2010 of Math. Ann. 373 (2019); the preprint numbering, which BLGGT and Thorne cite.

- **[Thorne, adequacy][thorne-2017]** — Jack Thorne. *A 2-adic automorphy lifting theorem for unitary groups over CM fields*. Accepted manuscript (16 March 2016) of Math. Z. 285 (2017); manuscript pages.

- **[Poonen, rational points][poonen-qpoints]** — Bjorn Poonen. *Rational points on varieties*. Graduate Studies in Mathematics 186, AMS (2017); the author's online version, printed page numbers.

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
[qian]: https://arxiv.org/pdf/2104.09761v1
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

[sw-base-change]: https://citeseerx.ist.psu.edu/document?doi=78be3e19b2caf9a472352165d0685620cf710b2f&repid=rep1&type=pdf
[gee-geraghty]: https://www.ma.imperial.ac.uk/~tsg/Index_files/cfug.pdf
[geraghty-ordinary]: https://web.archive.org/web/2id_/https://www2.bc.edu/david-geraghty/files/oml.pdf
[thorne-2017]: https://www.repository.cam.ac.uk/handle/1810/254922
[poonen-qpoints]: https://math.mit.edu/~poonen/papers/Qpoints.pdf
