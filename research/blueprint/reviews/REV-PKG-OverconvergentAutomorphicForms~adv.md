# Independent package review: OverconvergentAutomorphicForms

Issue: #11525. Reviewer: Codex — codex-KpHIgP. Date: 2026-10-20.

**Verdict: accepted with the corrections below applied.** This is a review of
another worker's package, not a review of my own submission. I compared the
README and every Lean declaration with the accepted O0, O8 and assembly inputs,
including the five additions absent from the assembly's older import inventory.
Their union contains 101 distinct target IDs. The report below accounts for all
101, as well as the expanded analytic foundations and comparison APIs.

Acceptance means that this is a usable roadmap for a draft upstream PR. It does
not certify that its geometric constructions have been formalised, or that its
explicit extension targets are consequences of the weaker cited theorems.

## Corrections made

1. **Wild Hecke conjugation (§6.4).** The old text combined the coordinate map
   z↦ϖz with γ↦uϖ⁻¹γuϖ. The required map is γ↦uϖγuϖ⁻¹. Its entries are
   [a,ϖb;ϖ⁻¹c,d], and its lower-row factor at ϖz is cz+d. At p=5,
   γ=[1,0;25,1], z=5, the correct denominator is 126; the old direction gives
   3126. Both are 5-adic units, so a test of invertibility alone misses the
   error. Added `lowerFactor`, its general commutative-ring identity with ϖ a
   unit, three README Checks and two proved Lean examples. The theorem is
   applied on the generic fibre; integral subgroup preservation still needs
   the stated divisibility of c.
2. **Induction hypotheses (§0.4).** Made the split reductive model over a finite
   splitting field and the rational form of its torus explicit. This preserves
   nonsplit original Shimura groups. The finite-character comparison now
   requires the character on M₁, its triviality on M₁∩Mₙ and the trivial
   positive-torus action on its one-dimensional factor. A character of the
   compact torus alone does not supply that extension. Added a cube-root
   calculation distinguishing the inverse twist.
3. **Siegel analytic weights (§0.5).** Specified the multiplicative analytic
   extension to the actual torus neighborhood. Two-sided Gauss bounds are
   required for the integral and isometric assertions. A continuous character
   is admitted after choosing a sufficiently deep stage, not at every fixed
   stage. Added the connected-disc finite-character obstruction as a Check.
   Corrected the citation to DRW **Remark** 3.1.9, rather than Lemma 3.1.9.
4. **Formal line effectivity (§1.3).** Included the topologically finite-type
   formal base over O_K and the inverse system of finite étale Galois torsors
   from Heuer Definition 3.7/Proposition 3.8. The coefficient must be a
   continuous formal-unit cocycle with the specified compatible effective
   reductions.
5. **Supplier locators.** The coefficient-sheaf targets named in the supplier
   contract are in AdicSpacesPartIV **R5.7**, not R5.6. The pinned unit-norm
   declaration is `NumberField.isUnit_iff_norm`, not
   `NumberField.RingOfIntegers.isUnit_iff_norm`.

No accepted target, pre-existing Check or general-rank/general-datum branch was
deleted. The packets are unchanged. `metadata.toml` remains `math.NT`.

## Form, dependencies and duplication

The mathematical form was compared with the upstream ModularForms and
ModularCurves documents, then with current AlgebraicVectorBundles and
LocalGaloisGroups. The README has its summary, boundaries, conventions, exact
contracts, ordered layers, named APIs, discriminating Checks, examples and
dependencies. It is organised around constructions, not around a source's
sections. No source passage has been inserted.

I read the reviewed O0–O8 entries in `data/library-coverage.json`, searched by
the underlying mathematical objects, and inspected the supplying declarations
at Mathlib `082e2d37` and Tau Ceti `f790474`. In particular, the determinant norm
is `LinearMap.det` of multiplication; `Algebra.norm_algebraMap` requires the
finite free setting; `NumberField.RingOfIntegers.rank` supplies the integral
rank; the unit-norm theorem uses absolute norm one. None is an integral
embeddingwise splitting assertion. The compact module topology, tensor
inclusion and continuous-character operations in the light declarations use
the existing carriers.

The additional current-library audit used Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and upstream main
`0d144d044dacebca17b654695b6f1ad58f159b27`. It covered every target family in the
table below, all nine newer roadmaps named by PACKAGE_REVIEW, and Completed's
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
The real/complex operator results and generic integral lattices there do not
supply affinoid-family complete continuity or analytic O⁺ equalizers.
AlgebraicVectorBundles supplies the generic sheaf, tensor and dual theory.
Current Tau Ceti's `NumberField.NarrowClassGroup` and `instFinite` in
`TauCeti/NumberTheory/NumberField/NarrowClassGroup/{Basic,Finite}.lean` supply
the polarization-class index. Its highest-weight generation and weight-cone
theorems in `TauCeti/Algebra/Lie/HighestWeight/Module.lean` supply algebraic
representation theory, not the analytic induction or Jacquet construction.
These are correctly consumed in the boundaries. **No additional duplicate
target needed removal during this review.**

I independently read the actual supplier files at
[PerfectoidTowers PR 816](https://github.com/TauCetiProject/TauCetiRoadmap/pull/816),
head `537fec2d9dc75b76b85fd4c203bc00a6a974b579`, and
[AdicSpacesPartIV PR 815](https://github.com/TauCetiProject/TauCetiRoadmap/pull/815),
head `787cee72b9927af27279fa3e3fdf46cb680a35d4`. P9.11 really gives both
`WeightExtension.structureSheafEqualizer` and its integral counterpart on every
open of the product under the stated smooth/perfectoid hypotheses. P9.13 really
requires an integral matrix frame and its integral inverse; the fixed-subsheaf
construction alone does not supply effectivity. R5.7 separates affinoid-weight
products, local equalizers and the restricted Kiehl conclusions. The README
keeps these distinctions. An analytic positive-dimensional B_m-torsor is not
covered by the profinite-torsor theorem.

The Caraiani–Newton order places the named analytic/distribution, tower,
completed-cohomology, automorphic-bundle and spectral suppliers before the
Hilbert canonical and Shimura tower inputs of tiers 16–17. This roadmap is
outside that 94-roadmap ordering and follows those inputs. Its §0.6 states the
general analytic-vector, distribution, full-character and Jacquet foundations
locally; it makes no upward import from LocallyAnalyticRepresentations or
LocallyAnalyticDistributionsPartII. No `UPSTREAM:` or
FoundationsAndLibraryIntegration prerequisite remains.

## Adversarial pass over the accepted targets

IDs in this table abbreviate `OverconvergentAutomorphicForms:`. Each row also
covers the target's named functoriality and API statements in its indicated
subsection. A case excluded by the stated hypotheses is a domain check, not an
extension of a geometric theorem to that case. “Retained” means the check
supports the stated target with its hypotheses, not that its proof is in Lean.

| Target | Instances and calculation | Result / location |
| --- | --- | --- |
| O0/units-at-p | F=ℚ; split quadratic p=5; ramified quadratic; pⁿ→0 in the finite-module topology. | Retained, §0.1; no integral product over embeddings. |
| O0/norm-at-p | Scalar 2 in degree two has norm 4; 0↦0; −1↦(−1)^d. | Retained, §0.1. |
| O0/principal-units | r=0 gives the whole unit group; r≥1 gives congruence units; p=2 needs deeper torsion-free charts. | Retained, §§0.1–0.3; r=0 is not declared pro-p. |
| O0/geometric-weight-characters | Trivial character, algebraic powers, finite characters of increasing conductor. | Retained, §0.2; point functor distinguished from rigid realization. |
| O0/arithmetic-weight-characters | Each factor separately nontrivial; evaluation on (x,1) and (1,y). | Retained, §0.2; neither factor is discarded. |
| O0/weight-dual-group-map | x=1 and an element with nontrivial norm; second coordinate is N(x)⁻¹. | Retained, §0.2; proved inverse-norm example. |
| O0/weight-comparison | w=1 and t=1 separately; scalar extension respects both coordinates. | Retained, §0.2. |
| O0/weight-comparison-formula | F=ℚ, w=x^a,t=x^v gives exponent 2a−v. | Retained, §0.2. |
| O0/weight-comparison-norm-factor | κw⁻²=t(N)⁻¹; a norm −1 unit retains t(−1)⁻¹. | Retained, §0.2. |
| O0/weight-comparison-totally-positive-units | Positive units have norm 1; mixed signs need not. Congruence units at N≥4 separately have norm 1. | Retained with the two hypotheses kept distinct, §§0.2,4.2. |
| O0/weight-radius-parameter | Trivial weight gives 0; x^k on 1+p^r₀ℤₚ gives |p^r₀k| for k≠0; dyadic r₀=3. | Retained, §0.3; not the old rescaled universal parameter. |
| O0/continuous-character-bounded | Pro-p generators in a reduced uniform algebra give a common bound <1; norm-unit residue characters on the full unit group need not. | Retained, §0.3; finite-generation and norm hypotheses matter. |
| O0/analytic-continuation-of-bounded-weights | A high-conductor point eventually extends but can fail at an assigned larger disc. | Retained existentially, §0.3; no false numerical radius. |
| O0/bounded-weight-families | Constant map from a smooth base; rational restriction; unbounded conductors across charts. | Retained, §0.3; smoothness of the base is separate. |
| O0/finite-analytic-coefficients | Zero, trivial line and two different character lines; discontinuous action rejected. | Retained, §0.4; lattice is extra data. |
| O0/coefficient-tensor-dual | Ranks 2×3=6; character 2 dualizes to 1/2; zero and nonflat coefficient extension. | Retained, §0.4; integral equalizers need extra hypotheses. |
| O0/analytic-induced-coefficients | Torus gives a line; SL₂ has an analytic variable; non-Zariski-dense M₁ still needs its thickening. | Model hypotheses clarified, §0.4. |
| O0/algebraic-induced-comparison | Weight k polynomials exclude z^(k+1); positive action has the w₀κ twist; finite χ=ζ uses ζ⁻¹. | Finite-character extension and action fixed, §0.4. |
| O0/unitary-completed-coefficients | Precision limit outside level colimit; other-p coefficient of rank >1; nonempty local free orbits give s≥1. | Retained for general n≥2, §0.7. |
| O0/unitary-jacquet-eigenvariety | Distinct uniformizer values give distinct characters; zero Jacquet fibre contributes no point. | Retained, §0.7; actual faithful Hecke image required. |
| O0/unitary-eigenvariety-geometry | n=2,d_K=1 gives 2; d_K=2 gives 4; zero Π fails the positive-multiplicity input. | Retained with projective-chart targets, §0.7. |
| O0/unitary-eigenvariety-reduced | A nilpotent spectral algebra can have the same point set; CM alone is insufficient. | Retained with separate density/semisimplicity targets, §0.7. |
| O1/right-automorphy-cocycle | Trivial group; two noncommuting unipotents; frame b=2 changes a line coordinate by 1/2. | Retained, §1.1; inverse and order correct. |
| O1/equivariant-coefficient-sheaf | Identity torsor, rank zero, trivial line, nontrivial stabilizer acting as −1. | Retained, §1.2; coarse and stack cases separated. |
| O1/coefficient-descent-functoriality | Finite tensor/dual descent versus infinite induction; group order divisible by p; nonflat integral change. | Retained, §1.2; no averaging inference. |
| O1/analytic-line-effectivity | Dense open in smooth rigid X versus infinite perfectoid base; formal-unit versus geometric O⁺ cocycle. | Formal finite-type hypotheses added, §1.3. |
| O2/admitted-hilbert-domain | p=2,3,5; ε=0; odd-prime equality endpoint; n=0,1,∞. | Retained, §2.1; strict endpoint and scaled AL distinguished. |
| O2/hilbert-automorphy-factor | Identity, diagonal(a,d), upper unipotent, lower c≠0. | Retained, §2.2; lower entry d fixes the denominator. |
| O2/hilbert-cocycle-law | Two fractional transformations, with both denominators units; scalar right conversion uses inverse. | Retained, §§1.1,2.2. |
| O2/geometric-hilbert-sheaf | κ=1 gives O; κ=x^k gives inverse kth factor; nontrivial character fails scalar invariance. | Retained, §2.2. |
| O2/hilbert-level-radius-maps | Identity/composite maps; n=0 uses AL₁; at p=5 level scaling changes the source bound. | Retained, §2.1–2.2. |
| O2/hilbert-algebraic-specialisation | Weight 0, positive and negative k; multiple embeddings without integral splitting. | Retained, §2.3. |
| O3/integral-hilbert-sheaf | 1 is integral, p⁻¹ is not; action needs both character and inverse integral. | Retained, §3.1. |
| O3/integral-rationalisation | Quasi-compact common denominator; no uniform denominator on arbitrary non-quasi-compact globals. | Retained as a sheaf statement, §3.1. |
| O3/hilbert-weight-pullback | Identity and two successive base maps; nonflat integral tensor need not commute with invariants. | Retained, §3.2. |
| O3/fixed-radius-hilbert-forms | Trivial weight; different integral lattices; fixed finite/infinite levels not conflated. | Retained, §3.3. |
| O3/overconvergent-hilbert-forms | Equality after a further positive restriction; ε=0 is not a stage of the positive colimit. | Retained, §3.3. |
| O3/ramified-modified-lattice | Ramified O_F⊗O_C not a product; rational eigenspaces do not recover the integral lattice. | Retained as supplied modified lattice plus coefficient application, §3.4. |
| O4/presentation-geometric-small | Trivial and nontrivial geometric weights on the small cover. | Retained independent equalizer, §4.1. |
| O4/presentation-geometric-full | Additional diagonal torsor has j=1, but functions have different domains. | Retained independent equalizer and comparison, §§4.1,4.3. |
| O4/presentation-arithmetic-intermediate | w(x̄), not w(det γ); changing polarization changes the actual action. | Retained, §4.1. |
| O4/presentation-arithmetic-full | w(det γ) on the full group; weight relation cancels central congruence units. | Retained, §§4.1–4.2. |
| O4/arithmetic-representatives | Mixed-sign η≡1 mod N still has N(η)=1; closure uses continuity. | Retained, §4.2; positive units alone are insufficient. |
| O4/geometric-full-cover-comparison | Diag(ε,1) has lower factor 1; compare via the actual span, not equal functions. | Retained, §4.3. |
| O4/twisted-polarisation-action | Identity and product; ε acts by w(ε) and inverse pullback. | Retained, §4.3. |
| O4/finite-polarisation-descent | Trivial Δ; nontrivial character; p divides |Δ|. | Retained, §4.3; effective torsor descent replaces averaging. |
| O4/weil-pairing-comparison | Pairing changes with deck action; if w(e)=2, comparison multiplies by 1/2. | Retained, §4.4; raw pairing does not descend. |
| O4/polarisation-class-forms | F=ℚ has one class; several classes retain separate coefficients. | Retained, §4.5; library narrow classes consumed. |
| O4/polarisation-choice-independence | Positive p-unit changes can move components; two transports compose. | Retained, §4.5; entire class system retained. |
| O5/aip-independent-coefficients | Analytic B_m has a positive-dimensional coordinate; κ=1 and nontrivial weights. | Retained, §5.1; not defined by pulling back the perfectoid line. |
| O5/aip-translation-valuation-units | Finite roots of unity and their inverses are valuation units; p⁻¹ is not. | Retained, §5.1; this alone is no eigenframe. |
| O5/aip-line-and-gluing | Universal small line versus full finite-character factor; dyadic sign not a small universal character. | Retained, §§5.1–5.2; full positive-radius integral freeness conditional. |
| O5/geometric-aip-comparison | Change eigenframe by a unit; rational comparison versus integral unit inverse. | Retained, §5.3 with exact generator/model targets. |
| O5/arithmetic-aip-comparison | Central cancellation and pairing inverse remain through finite descent. | Retained, §5.3. |
| O5/aip-comparison-naturality | Two radius/weight maps and identity; integral version requires flat/model comparison. | Retained, §5.3. |
| O5/aip-torsor-structure-invariants | A B_m torsor is not a profinite torsor; all-open function descent is its own target. | Retained, §5.1. |
| O5/finite-character-integral-generator | χ=1; χ of order 3; an annular finite étale cover need not give a unit eigenfunction on the base. | Retained, §5.2; full Čech and model input explicit. |
| O5/aip-frobenius-restriction | Frobenius differential multiplies by p; its inverse need not preserve O⁺. | Retained rationally with integral bounds, §5.3. |
| O6/hilbert-cusp-forms | Constant 1 at a boundary is not cuspidal; zero is; multiply by the boundary ideal. | Retained, §6.1. |
| O6/hilbert-koecher | d=1 boundary divisor versus d>1 codimension; cover normality required. | Retained with geometric hypotheses, §6.1. |
| O6/tame-hilbert-hecke | Unit ideal degree 1; prime norm q degree q+1; composites use the product formula. | Retained, §6.3; not the bare norm normalizer. |
| O6/wild-hilbert-hecke | p=5, c=25,z=5; correct conjugation gives 126, reversed 3126; ℓ=ne+1. | Conjugation fixed, §6.4; coefficient direction pinned in Lean. |
| O6/hilbert-diamond-operators | Unit acts through its character; identity and multiplication, including dyadic sign. | Retained, §6.3. |
| O6/aip-hecke-equivariance | Coefficient comparison before trace; scaled source radius and common level retained. | Retained, §6.4. |
| O6/hilbert-q-expansion-comparison | Constant/cusp coefficient and a changed frame; all relevant cusp/Igusa components. | Retained, §6.5. |
| O6/fixed-cusp-banach-modules | Finite level with positive radius; infinitely many q coefficients; property (Pr) is not finite rank. | Retained, §6.6. |
| O6/compact-radius-restriction | Strictly smaller refined affinoid versus identity restriction; complete continuity is relative over A. | Retained, §6.6. |
| O6/controlling-hilbert-operator | Ramified exponent e_𝔭 and ∏q_𝔭^e_𝔭=p^d; one partial U need not improve every direction. | Retained, §6.6. |
| O6/controlling-complete-continuity | Improved-radius factorization followed by strict compact restriction; ordinary ε=0 excluded. | Retained, §6.6. |
| O6/hecke-lattice-renormalisation | q_𝔭U_𝔭 and p^dU_p cancel normalized trace denominators; sufficient, not claimed optimal. | Retained, §6.6. |
| O6/cuspidal-coefficient-vanishing | Toric monomial splitting when ℓ=p; no division by ℓ; higher q>0. | Retained, §6.2 with formal-functions input. |
| O6/hilbert-cusp-higher-vanishing | Boundary ideal rather than O; finite-character torsion line; all higher degrees. | Retained, §6.2. |
| O6/padic-hilbert-q-expansion | First nonzero cusp term; coefficients lie in their frame line; one component cannot detect all others. | Retained, §6.5. |
| O7/ordinary-completed-functions | x↦x on ℤₚ factors at each precision, not at one level integrally. | Retained ordered limit, §7.1. |
| O7/ordinary-weighted-forms | Trivial weight, nontrivial inverse character, bounded completed coefficient lattice. | Retained, §7.1. |
| O7/igusa-completion-comparison | Discrete reduced special fibre versus O_C/p with nilpotents; require R_i=A_i°. | Retained with model and norm targets, §7.2. |
| O7/ordinary-restriction | Constant 1; p⁻¹ section; positive representatives agree after common restriction. | Retained, §7.3; no surjectivity assertion. |
| O7/ordinary-coefficient-comparison | Unit frame gives weighted functions; arbitrary rational frame does not identify unit balls. | Retained conditional on §7.2, §7.3. |
| O7/ordinary-hecke-expansions | Precision-compatible traces and expansions; weights and frame factors retained. | Retained, §7.3. |
| O8/graph-normalisation | Rank 0,1,2; det J a unit in a ring versus merely nonzero over a DVR. | Supplied §3.4 contract, used in §8.1; not replanned. |
| O8/factor-composition | Consecutive noncommuting factors J_γ(Z)J_δ(Zγ); both determinants units. | Supplied ordered identity, §8.1. |
| O8/coordinate-composition | Two valid graph charts; a singular denominator is outside the domain. | Supplied coordinate law, §8.1. |
| O8/antidiagonal-dual-factor | Rank 1 scalar; empty index; rank 2 gives diag(1,4), wrong order diag(4,1). | Retained additional basis dictionary, §8.1; Lean hypotheses sufficient. |
| O8/determinant-character-cocycle | χ on both ordered invertible factors; identity and product characters. | Applied to actual supplied factors, §8.3; determinant multiplicativity imported. |
| O8/hodge-frame-transformation | diag(I,uI) has J=I,c=u; quotient frame fixed, naturally dual frame scales by u⁻¹. | Supplied corrected frame, §8.2. |
| O8/determinant-frame-transformation | Wedge of rank g frame; empty wedge 1; c^−g on the alternative dual frame. | Supplied frame applied in §8.3. |
| O8/scalar-coefficient-identification | χ=1; det J=6 gives inverse 1/6; negative characters use duals. | Retained, §8.3. |
| O8/determinant-hodge-specialisation | m=0,1,−1; product with determinant frame is invariant. | Retained comparison, §8.3. |
| O8/algebraic-levi-specialisation | Zero, line, rank-two representation and extra similitude character. | Retained, §8.3; determinant does not replace a representation. |
| O8/determinant-line-map | Identity evaluation recovers a; diag(2,3) gives 6; upper unipotent gives a. | Retained over general commutative R,S, §8.4. |
| O8/siegel-analytic-instance | Genus 1 line versus genus 2 unipotent functions; Gauss-integral versus pointwise integral. | Retained with weight extension, §§0.5,8.4. |
| O8/algebraic-induced-injection | Dominant polynomial weights inject; higher monomial stays analytic; negative determinant uses separate line. | Retained, §8.4. |
| O8/atkin-lehner-chart | q=2,z=3 gives [−6,1]; Z=0; q=0; characteristic 2; empty index. | Retained ring identity, §8.5; tower action needs q a unit. |
| O8/toroidal-coefficient-instance | Trivial line and zero; non-perfectoid general Shimura tower; arbitrary Banach representation. | Retained on supplied diamond/site with actual descent category, §8.6. |
| O8/toroidal-algebraic-comparison | μ-central weights j=0,1; j=1 retains ℚₚ(1); cone-changing Hecke element. | Retained twist and common refinement, §8.6. |
| O8/supplied-domain-instance | Identity reduction, zero representation, domain without an ordinary meaning. | Retained, §8.6; no invented canonical subgroup. |
| O8/bruhat-reduced-family | m′=1 forces m=n; n=0 needs 0-analyticity; SL₂ ν=0 gives κ=0 or −2ρ. | Retained shifts, actual reduced group, finite-cover hypotheses and all-degree comparison, §8.7. |
| O0/siegel-analytic-coefficients | High conductor on fixed disc; (T^p−T)/p; normalized coordinates u/p. | Analytic extension clarified, §0.5; Gauss lattice retained. |
| O0/analytic-induction-conventions | κ_BP=w₀(κ_D⁻¹); h↦h^−T; test a diagonal character and reversed composition. | Retained, §0.5; left action and character agree. |
| O8/siegel-factor-neighbourhood | J−J₀=EC, C∈pMat, hence radius w+1; full similitude versus fixed-pairing subgroup. | Retained, §8.2; coefficient group is the one the estimate reaches. |
| O4/effective-arithmetic-descent | Central closure, finite quotient of order divisible by p, and all-open fixed sections. | Retained, §§4.2–4.4 with P9 hypotheses. |

The expanded foundational API and comparisons received the same pass:

| Additional targets | Tests of hypotheses and conventions | Outcome |
| --- | --- | --- |
| `groupAnalyticDistributions`, `frechetSteinStructure`, `coadmissibleModule`, their recovery/kernel/cokernel APIs | Trivial group gives E; δ_hδ_k=δ_hk distinguishes a nonabelian group; the algebra itself recovers A_j; dense nonclosed quotients are not Hausdorff cokernels. | §0.6 retains left modules, left-Noetherian algebras, right-flat maps and topology. |
| `analyticVectors` and admissible Banach/analytic representations, their duality APIs | C(H,E) gives the regular measure dual; finite sums; trivial group excludes infinite-dimensional admissible objects; continuous but nonanalytic orbits are excluded. | §0.6 distinguishes D_cont from D_la and closed embeddings from algebraic ones. |
| `fullCharacterSpace`, `essentiallyAdmissibleRepresentation`, `abelianDual_coherentSheaf` | Z=1 gives a point; ℤ gives G_m; (K×)^n has n uniformizer coordinates; locally ℚₚ-analytic compact dimension differs from locally K-analytic dimension. | §0.6 keeps the analytic field, the central-action agreement and a dense Mellin injection that is not onto for noncompact Z. |
| `finiteSlopePart` and its evaluation/universal-property APIs | Trivial character; nonzero eigenvalue versus zero; independent uniformizer values; Z-stable Banach exhaustion. | §0.6 uses equivariant continuous maps from O(Ẑ), with the stated topology. |
| `positiveJacquetHecke`, `locallyAnalyticJacquet` and their comparison APIs | For GL₂(ℚ₂), normalized averaging on constants is 1, unnormalized is 2; P=G has N=1; smooth coinvariants and algebraic W^N are distinct operations. | §0.6 keeps the index inverse, coset representatives, left exactness and general parabolics. |
| `unitaryJacquet_analyticStages`, `positiveCompactFactorization`, `projectiveCharts`, `unitaryClassicalPoints_accumulate`, `unitaryClassicalHecke_semisimple` | The BHS unnormalized positive operator differs by c_z; compact restriction needs strict improvement; n d_K is not the full torus dimension; noncritical algebraic gap bounds depend on bounded slopes. | §0.7 states the actual arithmetic proof inputs and specializes local arguments without patching variables. |
| `coefficientFunctions_siteComparison` and analytic Banach descent | Finite rank versus infinite induction; smoothoid scalar functions versus coefficient Gauss lattices; arbitrary Banach representation has no automatic coherence. | §1.2 supplies a genuine coefficient-specific target beyond P9's scalar equalizers. |
| `hilbertPeriod_endpointExtension`, `hilbertPeriod_unsplitRamifiedGenerator` | Odd-prime equality is outside the strict source; ramified integral tensor is not a product. | §2.1 keeps both broader desired results as explicit extra targets. |
| AIP all-open invariants, full finite-character base generator/model comparison, `finiteCharacterGenerator` | Positive-dimensional B_m; order-p finite quotient; χ=ζ gives inverse eigenfunction; split-cover generator need not descend to an integral base generator. | §5 retains separate construction and full Čech/model obligations. |
| Ordinary spectral unit-ball/model/lattice comparisons | ℤₚ versus pℤₚ; nondiscrete O_C/p not reduced; geometric O⁺ is not a chosen tensor lattice by definition. | §7 names exactly the missing integral hypotheses instead of invoking Heuer's natural map as an isomorphism. |
| Bruhat/distribution functoriality and locally projective Banach/derived comparisons | Trivial and nontrivial root shifts; zero unipotent dimension; finite group averaging only rationally; H⁰ and every H^i, i>0. | §8.7 retains κ+2ρ_nc, finite-flat trivializing covers and finite quasi-Stein-union hypotheses. |

## Source verification and outstanding theorem inputs

All source reading was from public primary sources on 2026-10-20. The locators
use the versions identified below, not a mixture of author and publisher page
numbers. I checked the six currently flagged unverifiable contracts in the O0
review: the three unitary/Jacquet geometry targets, the full-character AIP line,
and the two ordinary completion/coefficient comparisons. I also revisited the
earlier finite-generator and geometric AIP concerns. The unitary local
arguments are now named in §0.7; the remaining AIP/ordinary integral inputs are
explicit targets with their precise conditions, not silently attributed to
stronger source theorems. Historical “unverified typed prototype” flags concern
carriers that the current Lean-shape rule requires to stay in the README.

The locator table records more than the required fifteen checks. In addition
to the flagged items, fifteen rows were selected using seed 11525 from this
36-row source-locator register; the source conclusions were read directly.
The sampled rows, counted from one, are 5, 6, 7, 10, 11, 14, 18, 19, 22,
28, 30, 31, 33, 35 and 36.
The entire register was checked because its neighboring hypotheses mattered.

| Source and locator | What the source supports / limit checked |
| --- | --- |
| BHW §6.1, pp.1756–1757 | Compact weights and the character-map convention; ramified integral splitting is not licensed. |
| BHW Definition 6.5 and Proposition 6.6, pp.1758–1759 | Actual automorphy equalizers and analytic line assertion. |
| BHW Theorem 7.14, pp.1764–1765 | Coefficient comparison through actual frames on its common domain. |
| BHW Definition 9.1/Lemma 9.2, pp.1780–1782 | Four presentations and central-unit representative cancellation. |
| BHW Lemma 9.3 and Definition 9.4, pp.1782–1783 | Mixed-cover geometric comparison and inverse-pullback twist. |
| BHW Lemma 9.7, pp.1784–1785 | Pairing character occurs inversely in the comparison map. |
| BHW Lemma 10.3 and its proof, p.1790 | Correct wild conjugation is [a,ϖb;ϖ⁻¹c,d]; used to fix §6.4. |
| AIP-adic Lemma 2.4, pp.7–8 | Finite torsion factor, q=p or 4, and level-two quotient. |
| AIP-adic Proposition 4.3/Lemma 4.4, p.16 | Small universal formal line and valuation-unit control; not a full finite-character integral generator theorem. |
| AIP-adic Proposition 4.7, p.18 | Compatible stages and universal-line restriction. |
| AIP-adic §6.4/Theorem 6.7, p.29 | Full finite factor is coherent, ordinary invertible; rational comparison and Frobenius compatibility. |
| AIP-cusp Lemma 6.3/Proposition 6.4, pp.32–33 | Monomial split injection and all-degree boundary vanishing, including ℓ divisible by the characteristic. |
| BP §6.2 setup, p.147 | Split integral model over a finite field extension, with a rational torus form; not original-group splitness. |
| BP §§6.2.9–6.2.11, p.150 | Character on M₁, inverse finite twist, trivial positive action, and positive-normalization twist of algebraic induction. |
| BP §6.2.20, pp.152–153 | Bounded open-polydisc distribution module and its algebraic dual comparison. |
| BP §§4.4.38–4.4.40, pp.79–80 | General toroidal diamond, opposite parabolics and μ-cyclotomic torsor comparison. |
| BP Propositions 4.6.9,4.6.12,4.6.14–4.6.15, pp.93–95 | Actual reduced group, 0≤m−n≤m′−1 and finite trivialization in the pregood Hodge-type setting. |
| BP Proposition 6.3.3/Corollary 6.3.4, pp.153–154 | Projective Banach model and étale/analytic cohomology comparison in all degrees with the stated cover inputs. |
| BP Propositions 6.3.6–6.3.7, p.154 | Dominant algebraic comparison and finite-character conductor bound b≤min(m′,n). |
| DRW Lemma 2.3.1/Lemma 2.4.1/Corollary 2.4.2, pp.15–17 | Row-graph order and the printed dual-frame convention; corrected quotient/Tate linearization remains an explicit supplier contract. |
| DRW Remark 3.1.9 and Definitions 3.1.10,3.1.13–3.1.14, pp.22–25 | Analytic weight extension and normalized induction/transpose action. Geometric Gauss bounds are not rational-point tests. |
| DRW §3.4, pp.37–38 | Finite algebraic coefficient is a subrepresentation, not the whole analytic induction. |
| Emerton-analytic Definitions 1.2.6,1.2.8,1.2.10/Theorem 1.2.11, pp.22–27 | Noncommutative Fréchet–Stein and coadmissible-module hypotheses and abelian category. |
| Emerton-analytic Propositions 6.4.1,6.4.5–6.4.7/Definition 6.4.9, pp.124–129 | Full noncompact character space, Mellin completion and essential admissibility. |
| Emerton-Jacquet Definition 3.2.1/Propositions 3.2.4,3.2.6,3.2.12, pp.796–799 | Topological finite-slope universal property and eigenspace evaluation. |
| Emerton-Jacquet Definitions 3.4.1–3.4.5/Proposition 3.4.6, pp.806–807 | Normalized coset average and general-parabolic Jacquet construction. |
| Emerton-Jacquet Theorem 4.2.32, p.828, Propositions 4.3.4,4.3.6, p.834 | Essential admissibility, smooth coinvariants and algebraic N-invariants. |
| Ding §4.2.2/Proposition 4.14, pp.66–67 | Actual completed coefficient, n[K:ℚₚ] dimension, Cohen–Macaulay coefficient and reducedness via additional local arguments. |
| Breuil–Ding Lemma 6.1/proof, pp.83–84 | General n integral free-orbit regularity, despite the rank-three principal application. |
| BHS1 Proposition 5.3, pp.44–45 | Analytic stages, (Pr), compact transition factorization and unnormalized positive operator. |
| BHS1 Lemma 3.10/Proposition 3.11/Corollary 3.12, pp.23–26 | Finite projective weight charts and no embedded components; patching dimensions are not imported. |
| BHS1 Theorem 3.19/Corollary 3.20 and proof, pp.29–33 | Bounded-slope gap conditions, componentwise classical accumulation and semisimplicity route to reducedness. |
| BHS2 Lemma 3.8, p.24 | Depth of the coefficient module over a finite spectral algebra with a regular weight base. |
| Chenevier Proposition 6.4/Lemma 6.5, pp.20–21 | Semisimple-fibre criterion and role of no embedded components; this version has different published numbering. |
| Heuer Corollary 1.5, p.3 | Smooth rigid dense-open line effectivity; not arbitrary perfectoid bases. |
| Heuer Definition 3.7/Proposition 3.8, p.15 | Topologically finite-type formal base, formal unit cocycle and compatible finite-level effective lines. |

The independently downloaded source versions have the following SHA-256
digests. Author PDFs are identified by their content, not by an assumed
publication date.

| Source version | SHA-256 |
| --- | --- |
| [bhw](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf) | `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4` |
| [drw](https://arxiv.org/pdf/2106.00094v3) | `41ced4964ca50027e9fb93813047820a2853b9632fed221cbd5690be4d3294a8` |
| [emerton-analytic](https://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf) | `e123a87644ef29d96db71525903344307ac2d70f46dba3b82fd87100a49e3b79` |
| [emerton-jacquet](https://www.numdam.org/item/10.1016/j.ansens.2006.08.001.pdf) | `c7d6eceaab1b49357851c0431838ad5ef2595b7db68d85d1d719fd2a7319206e` |
| [bp](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf) | `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae` |
| [aip-adic](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) | `34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd` |
| [aip-cusp](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf) | `1f42b2c19b9542e937b6d02c244f71c7a1ef1d15840b8fab209950227269c406` |
| [ding](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` |
| [heuer](https://arxiv.org/pdf/2012.07918v2) | `7d07fca4f8fdf0fb80a49509b5116852a537b19e38fd6aa094adfd3b88ae261f` |
| [bhs1](https://math.univ-lyon1.fr/homes-www/schraen/BHS1final.pdf) | `98c39b2d432ec418cbaf73f17e9d1cf56f3dca1701a2b1a663bbc1661791d026` |
| [bhs2](https://math.univ-lyon1.fr/homes-www/schraen/BHS2.pdf) | `fd1427b20d7cdd70bb0fc09384347766f91098d0fb166561ba9400929afc63ab` |
| [breuil-ding](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/compaGL3.pdf) | `41a0e1c2d3f4161d6664facd3e8c476345978bff5e84e717cc1e09f6b5f0d751` |
| [chenevier](https://arxiv.org/pdf/math/0301032v1) | `e691b2b4322a127ad0e7bb72c3294d23615b18ab1a2cb04d0bca1fbb1d38400f` |

The broader odd-prime endpoint and unsplit ramified-generator assertions,
positive-radius full finite-character integral model comparison, and
nondiscrete ordinary spectral unit-ball comparison remain named results to
prove in the roadmap. No checked source proves those stronger assertions
unconditionally. No published-version claim is made for the DRW findings:
the package consistently cites arXiv v3 and avoids relying on the disputed
printed intertwiners. No restricted book was needed.

## Lean signature and variable audit

The file has only existing carriers and real-bodied light definitions. Its
global `noncomputable section` changes computability, not the hypotheses.
The Hilbert variables are `[Field F] [NumberField F]` and prime p; total reality
is imposed only for the geometric/positive-unit assertions that need it.
The character section uses a commutative topological ring R and its units.
Matrix sections retain arbitrary commutative rings, finite indices and empty
indices where appropriate. No data declaration has a `sorry` body, and no
theorem assumes its own conclusion.

| Signature checked | Agreement with README / nonvacuity test |
| --- | --- |
| `compactSpace_Op` | Finite-module topology on the actual tensor; excludes the discrete-topology substitution. |
| `finrank_Op` | Any number field and prime, including ramification; no total-real hypothesis inserted. |
| `norm_tmul_one` | Actual integral element, norm over ℤ then cast to ℤₚ; scalar zero and −1 retain their norm. |
| `continuous_normUnits` | Restricts the actual determinant norm to units with the specified topology. |
| `open_finiteIndex_principalUnits` | r is any natural including 0; the proved r=0 example gives ⊤. |
| `weightMap_mk_apply` | Arbitrary continuous w,t and unit x; inverse norm survives w=1. |
| `congruence_unit_norm_one` | N≥4 and η−1∈(N); no unjustified total positivity or odd-p assumption. |
| `weightMap_mk_congruenceUnit` | Same η, no total positivity, central inverse factor cancels w². |
| `right_cocycle_of_left` | Γ and C may be noncommutative; left action/cocycle supplied, two inverse factors in correct order. |
| `wild_factor_conjugation` | Any commutative R; ϖ:R×, not an integral nonunit assumed invertible; correct generic-fibre domain. |
| `antidiagonal_dual_factor` | General finite index, W²=I and WZᵀW=Z; no symmetry or field assumption needed. |
| `determinantLineMap_injective` | Different commutative R,S; evaluation at I works even for a=0, rank 0 and the zero ring. |
| `atkin_lehner_chart` | All commutative rings and q, including q=0 and characteristic 2; geometric invertibility is separately scoped. |

Every kept definition has its README API and at least three discriminating
Checks. Its Lean examples are proved, with at most two per light definition.
The closing block preserves the heavy construction names whose carriers are
absent at the pins. In particular no synthetic `Prop`, `True` placeholder or
sorry'd analytic carrier was introduced to force a headline theorem into Lean.

## Validation and handoff

- The three unchanged accepted packets each pass `scripts/check_blueprint.py`
  with zero errors and zero warnings.
- `lean-check` of the package's `Suggested.lean` exits 0 at the shared pinned
  build: fourteen `declaration uses sorry` warnings, no other warnings or
  errors. The new diagonal and conjugation-direction examples are proved.
  This checks elaboration, not the truth of the admitted theorem targets.
- `intake.py check-files` reports four files and zero problems;
  `git diff --check` passes. Only the package README/Suggested/review JSON and
  this review are changed; metadata and input packets are preserved.

All implementation obligations needed by a future contributor are in the
README and the explicit-input discussion above. No scratch file is required
to continue. No suspicious instruction was encountered in source/PR data;
those texts were used only as evidence. This run submits this one review and
claims no further job. The PR must say `Refs #11525`, identify Codex and state
the checks and Lean result. The worker does not merge, close or relabel it.
