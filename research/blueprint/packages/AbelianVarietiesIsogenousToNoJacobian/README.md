# Roadmap: abelian varieties isogenous to no Jacobian

**Summary.** This roadmap proves the bounded-degree hypersurface-avoidance theorem of Masser and
Zannier: for every g≥2 and every proper algebraic hypersurface H of the Siegel moduli space A_g
there is a Hodge-generic principally polarized abelian variety A, defined over a number field K with
[K:Q]≤2^{16g⁴}, whose geometric isogeny class avoids H (§10.1). For g≥4 the Torelli locus has
dimension 3g−3<g(g+1)/2, so this gives an abelian variety isogenous to no Jacobian, of a smooth
curve or of a stable curve of compact type (§10.2). The isogenies excluded need not respect
polarizations. The proof is a counting argument. Candidates are taken from the integral points of a
parameter box in a finite cover of A_g. Arithmetic specialization makes almost all of them Galois
generic (Layer 6), and quantitative isogeny and endomorphism estimates turn a hypothetical isogeny
to a point of H into a large field degree (Layers 1, 5 and 7). The periods of the Galois conjugates
then give integral points of polynomially bounded height on a definable set, and Pila's block
counting together with Ax–Lindemann for A_g shows that there are too few of them (Layers 2 and 9).
Theta coordinates of level sixteen make the field-degree bound explicit (Layer 8). The same method
gives the strong counting theorem with exceptional set O(N^{G−γ}) (§9.5), many isogeny classes
(§10.3), Euclidean density (§10.6), a unirational version (§10.7), the elliptic real-curve theorem
(§4.9), and a compact real-analytic image meeting every algebraic isogeny class (§11.6). Two closing
layers state research problems with exact specifications: rationality of all sixteen-torsion over
the same bounded field (Layer 12), and a local analytic replacement for a global hypersurface, which
in genus at least two cannot exist globally (Layer 13). The theorems of transcendence theory,
o-minimal counting, functional transcendence and the arithmetic of CM points that the argument uses
with their exact numerical shape are stated in Layers 1 and 2, since no other roadmap plans them.

| Layer | Title | Headline targets |
| --- | --- | --- |
| 0 | Moduli, the Torelli locus and period conventions | `siegelUniformization`, `torelliLocus`, `jacobianHypersurface`, `minkowskiDomain`, `periodMatrixCorrespondence`, `LambdaForm` |
| 1 | Quantitative arithmetic inputs | `periodTheorem`, `ellipticIsogenyEstimate`, `isogenyEstimate`, `endomorphismEstimate`, `cuspValueLowerBound`, `cmGaloisOrbitLowerBound` |
| 2 | O-minimal counting and functional transcendence | `RanExp`, `DefinableBlock`, `uniformBlockCounting`, `definableUniformization`, `axLindemannAg`, `weaklySpecial_hodgeGeneric` |
| 3 | Elliptic matrices and isogeny-class counts | `ellipticMatrix`, `finiteSubgroupCount`, `ellipticManyClasses` |
| 4 | Elimination and elliptic real-curve avoidance | `eliminationPolynomial`, `ellipticDoubleCorrespondence`, `ellipticAvoidance`, `oneParameterOffset` |
| 5 | Rosati geometry and controlled period matrices | `rationalAnalyticTrace`, `rosatiLength_mul_le`, `degree_le_rosatiLength_pow`, `offDiagonal`, `controlledLengthIsogeny`, `periodHeight` |
| 6 | Galois genericity and arithmetic specialization | `pToAdelic`, `galoisToHodge`, `serreOpenImage`, `genericityGridCount` |
| 7 | Candidate families and large-isogeny estimates | `candidateCount`, `heightDiscriminant`, `isogenyDegreeHeight`, `logThreshold` |
| 8 | Fourier order, theta coordinates and explicit degree | `fourierOrder`, `normForm`, `thetaConstant`, `thetaLevel`, `thetaModel`, `thetaParameter` |
| 9 | Projected blocks and quantitative avoidance | `correspondenceDefinability`, `hodgeGenericZeroImages`, `orbitDegreeCollapse`, `countingTheorem` |
| 10 | Arithmetic consequences and the Schottky application | `hypersurfaceAvoidance`, `noJacobian`, `manyClasses`, `denseIndependentSet`, `boundedCmCount`, `igusaSchottky` |
| 11 | Newton interpolation within isogeny classes | `newtonSeries`, `ellipticInterpolationImage`, `matrixInterpolationImage` |
| 12 | The full sixteen-torsion comparison problem | `arithmeticComparisonCover`, `rationalTorsionCyclotomic`, `supplementaryTorsionTarget` |
| 13 | Global analytic obstructions and a local existence problem | `closedHypersurfaceAlgebraic`, `noGlobalInterpolationHypersurface`, `localHypersurfaceSpec`, `localReplacement` |

## Scope and ownership

**Owned here.** The source-specific constructions and estimates of Masser–Zannier: the Torelli locus
as a subset of the coarse space and the hypersurface containing its closure; the classical reduced
domain and the enlarged product domain with their diagonal comparisons; the fractional-linear period
correspondence; the elliptic matrix estimate, the subgroup count and the elliptic counting argument;
the rational Rosati length with its submultiplicativity and degree bound, the entry estimates for
rational representations, the off-diagonal extraction and the controlled-length isogeny; the
genericity count, the candidate count and the large-isogeny estimates; Fourier orders of Λ-forms,
the coset norm, the theta constants of level (e,2e), the coefficient-kernel relation and the
explicit degree of the theta model; the projected-block collapse and the counting theorem; the
arithmetic consequences, density and the genus-four Schottky application; Newton interpolation and
the compact interpolation images; the sixteen-torsion problem and the global analytic obstruction
with the local replacement problem. Also owned here are the level-one uniformization of A_g and the
Fourier expansion of Λ-forms (Layer 0), which the suppliers below do not state in this form.

**Owned here because no other roadmap plans them.** Layers 1 and 2 state the external theorems the
argument uses with their exact numerical shape: the period theorem and the elliptic and general
isogeny estimates in the form of Gaudron–Rémond, the endomorphism estimate of Masser–Wüstholz, the
lower bound for cusp forms at algebraic points, the averaged Colmez formula, the subpolynomial bound
for Faltings heights of CM abelian varieties, the polynomial lower bound for Galois orbits of CM
points and the finiteness of CM points of bounded discriminant (Layer 1); o-minimal structures and
R_an,exp, the algebraic part and definable blocks, Pila's uniform block counting, the definability
of the uniformizations on fundamental sets, Ax–Lindemann for j and for A_g, weakly special
subvarieties and their dichotomy through Hodge-generic points (Layer 2). The cited papers establish these statements. The auxiliary-section method,
o-minimal cell decomposition and reparametrization, and arithmetic intersection theory used in
their proofs require further prerequisite targets; the gaps are stated at the affected subsections.
The displayed end theorems do not by themselves supply these inputs. The external theorems used inside
single proofs (Cadoret's open adelic image, Pink's comparison, Serre's open image theorem, Deligne's
monodromy lemma, Masser's specialization theorem, Igusa's estimates, Grushevsky's genus-four
Schottky theorem, Remmert–Stein and Chow in Demailly's form) are likewise stated as targets of the
layer that uses them.

**Imported.** Abelian varieties and schemes, polarizations, isogenies, quotients, Weil pairings,
complex uniformization and the arithmetic of Hom groups come from AbelianSchemesAndArithmeticModuli.
The Siegel moduli spaces, their level structures, universal families and coarse spaces come from
PELModuli. Hodge-genericity, Mumford–Tate groups and the Siegel datum come from ShimuraData.
Arithmetic quotients, the Baily–Borel compactification, the Koecher principle and the definable
comparison for arithmetic quotients come from ShimuraVarieties. Automorphy factors and slash actions
come from AutomorphicBundles. The Faltings height, the isogeny height formula, the Tate conjecture
and finiteness of isogeny classes come from FaltingsFinitenessAndIsogenyTheorems. Tate modules come
from ArithmeticGaloisRepresentations, Hilbert irreducibility and the integral thin-set count from
InverseGaloisAndArithmeticFundamentalGroups, and the integral-lattice covolume and
squared successive-minimum theorems from TauCetiRoadmap IntegralLattices, Layer 2D–2F. Dimension and generic projections come from
SchemeAndStackFoundations; analytic spaces, Remmert–Stein and Chow from
AlgebraicModuliForArithmeticGeometry and ComplexComparisonPartII. Lattice uniformization of elliptic
curves and modular polynomials come from ModularCurvesPartII and the normalized j from ModularForms;
relative Jacobians from JacobianChallengePartII; the stack of stable curves from
StableReductionPartII; CM types and reflex reciprocity from
ComplexMultiplicationAndExplicitReciprocity; and the analytic estimates for L-functions of CM fields
from AnalyticNumberTheory. The exact contracts are listed below.

**Not built here.** No general theory of abelian varieties, moduli, Shimura varieties, heights,
Galois representations, semialgebraic sets or o-minimal structures is developed here beyond the
statements listed. Compactifications of A_g other than the Satake compactification, and the
arithmetic fine-level comparison needed for the sixteen-torsion problem, are not constructed: Layer
12 states what such a construction must provide.

## Conventions

- **Moduli.** Work in characteristic zero. A_g is the coarse moduli space over Q of principally
  polarized abelian varieties of dimension g, and A_g(C)=Sp_{2g}(Z)\ℋ_g by §0.1. Put G=g(g+1)/2. T_g
  is the smooth Torelli image and closure(T_g) its reduced Zariski closure in the open A_g. H is a
  fixed proper algebraic hypersurface, possibly defined over C, unrelated to the Siegel space ℋ_g.
- **Periods.** ℋ_g is the set of symmetric complex τ=x+iy with y positive definite; periods use a
  symplectic integral homology basis. Write y_i=y_{ii} and D_y=y^{(0)}=diag(y_1,…,y_g). The Loewner
  order u≤v means that v−u is positive semidefinite (Mathlib `Matrix.PosSemidef`). The classical
  reduced domain F_g includes ordered diagonals; the enlarged domain used for product periods keeps
  the diagonal comparisons and the bound on real entries but drops the order of the diagonal.
- **Signs.** Sp_{2g}(Z) acts on the left by τ↦(aτ+b)(cτ+d)⁻¹ for γ=(a,b;c,d). The rational
  representation of an endomorphism is written with signed blocks (a,−b;−c,d), as in MZ20 (21) and
  (39); convert the signs before inserting the blocks into the period correspondence. Every
  denominator carries a nonzero-determinant hypothesis; the inverse of a singular matrix is never
  interpreted geometrically. Real blocks are cast entrywise into C.
- **Rosati length.** The Rosati trace is the rational trace on integral homology:
  ℓ(v)²=tr(ρ(v)ερ(v)^tε⁻¹) with ε=(0,−I;I,0), which equals 2Re tr_C(κ(v)yκ(v)̄^ty⁻¹) (§5.1). Thus
  ℓ([n])=√(2g)|n|; dropping the factor two changes both the norm and the discriminant. D(A) is the
  determinant of the rational Rosati Gram matrix on a Z-basis of End(A_{Q̄}), of covolume √D(A); it
  is distinct from the family degree D and from a target model degree D̃. Independent
  successive-minimum vectors need not form a basis.
- **Families.** An arithmetic family consists of dominant generically finite rational maps π:Ã⇢A_g
  and Ψ:Ã⇢𝔸^G with specified nonempty common regular domains and finite fibres; their coefficient
  and model fields are part of the data, and D(Ã,Ψ)=[F̃:Q][F_Ψ:Q]D_Ψ as in MZ20 §1.2 (1), p.638.
  Field of moduli, field of definition of an abelian variety, theta-coordinate field, cyclotomic
  field and torsion field are different objects; model descent uses the bounded fine-level lifting
  of §7.2.
- **Heights.** h(A)=h_F(A) is the stable Faltings height. The sources normalize it differently
  (Faltings' normalization in FaltingsFinitenessAndIsogenyTheorems §R28.1.5, GR14 §2, AGHMP §9.1);
  the normalizations differ by constants depending only on g, which every estimate absorbs, except
  §1.6, where the normalization of AGHMP is part of the statement. The height can be negative, so
  positive majorants use max{1,h(A)}. h(α) is the absolute logarithmic Weil height of an algebraic
  number; the height of a rational point is H(q)=max_i max(|a_i|,|b_i|) for q_i=a_i/b_i in lowest
  terms. Box sizes N, cutoffs M, isogeny degrees m and field degrees are positive integers with the
  lower bounds stated; logarithms are natural; ≪ has exactly the stated dependence and never depends
  on N, M or a conjugate being counted.
- **Genericity.** Hodge genericity means MT(H₁(A,Q))=GSp_{2g}, equivalently that the moduli point
  lies in no proper special subvariety. For a prime p, p-Galois genericity means that the image of
  Galois on the p-adic Tate module is open in GSp_{2g}(Z_p); Galois genericity is the adelic notion
  of Pink. Images are compared up to conjugacy and commensurability; isogeny does not preserve
  integral images. End(A)=Z does not replace Hodge or Galois genericity in dimension four.
- **Forms.** The Siegel Fourier expansion of a Λ-form is ∑_M a(M)exp(πi tr(Mτ)) over symmetric
  rational positive-semidefinite M with dM half-integral (integral diagonal, half-integral
  off-diagonal); the order is the least trace of a nonzero coefficient, with ord(0)=∞. Theta
  characteristics are row vectors and e is an integer level; Γ(e,2e) requires both the principal
  congruence condition and the diagonal conditions. The projective theta model uses e=16. The Γ in
  the Minkowski constant is Euler's gamma function.
- **Definability.** "Definable" means definable in R_an,exp (§2.2) unless another o-minimal
  structure is named.
- **Lean.** `Suggested.lean` uses the namespace
  `TauCetiRoadmap.AbelianVarietiesIsogenousToNoJacobian`; the names in this document are relative to
  it. It types the statements whose objects exist at the pinned libraries (the period-matrix linear
  algebra, the reduced domain, theta constants and levels, the counting lemmas, the numerical degree
  bound and the Newton series); the rest are stated here only.

## Exact supplier contracts

### From Mathlib (pinned)

| Declaration | Use and limitation |
| --- | --- |
| `Polynomial.resultant`, `Polynomial.resultant_eq_zero_iff` | The Sylvester resultant at fixed degree bounds and its common-factor criterion over a field, which includes the alternative f≠0 or g≠0 (§4.1). |
| `MvPolynomial.schwartz_zippel_totalDegree` | The proportion of zeros of a nonzero polynomial on a finite grid (§4.3, §6.8, §7.5); the side cardinality is cleared only for a nonempty side. |
| `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` | A polynomial vanishing on a product grid with each variable degree below the side size is zero (§5.10). |
| `Matrix.fromBlocks`, `Matrix.det_mul`, `Matrix.mul_nonsing_inv`, `Matrix.nonsing_inv` | Block matrices, determinants and the inverse of a matrix with unit determinant (§0.10, §5.12). |
| `Matrix.PosSemidef`, `Matrix.PosDef`, `Matrix.PosDef.one`, `Matrix.PosDef.add_posSemidef`, `Matrix.posSemidef_self_mul_conjTranspose` | The Loewner order and the positivity of I+ww^t (Conventions, §11.6). They do not provide a moduli space. |
| `Matrix.trace`, `Matrix.transpose`, `Matrix.map`, `Complex.ofReal`, `Complex.re`, `Complex.im` | The rational and analytic Rosati traces and the casting of real blocks (§5.1). |
| `UpperHalfPlane`, `ModularGroup.fd` | The upper half-plane and the closed standard fundamental domain of SL₂(Z), where the real part is at most 1/2 in absolute value and the absolute value is at least 1 (§3.1). |
| `jacobiTheta₂` | The genus-one theta function, which the theta constants of §8.6 specialize at g=1. |
| `isLittleO_log_rpow_rpow_atTop` | A power of a logarithm is little-o of every positive power (§7.7, §9.5). |
| `NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt` | A number field containing a primitive root of unity of order greater than two has no real place (§12.2). |
| `Real.Gamma`, `Real.pi`, `Nat.factorial` | The constants of the explicit degree bound (§8.13). |
| `Nat.primeFactors`, `ArithmeticFunction.sigma`, `Nat.divisors` | The modular degree ψ(m) and its comparison with σ(m) (§4.2). |
| `AddCircle`, `AddSubgroup` | Finite subgroups of (Q/Z)^{2g} (§3.2). |
| `HasSum`, `tsum`, `Differentiable` | The Newton series and Fourier expansions (§11.1, §0.11). |

### From Tau Ceti (pinned)

| Declaration | Use and limitation |
| --- | --- |
| `TauCeti.cholesky`, `TauCeti.continuous_cholesky` | The positive-diagonal lower-triangular factor of a positive-definite real symmetric matrix and its continuity; continuity suffices for the successive tolerances of §11.6, and no Lipschitz estimate is used. |

### From the current Tau Ceti library

These interfaces are present at Tau Ceti a91d3aaf and are consumed when the roadmap is
implemented against that library; they are not additional imports of the pinned suggested file.

- `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic:TauCeti.IsSemialgebraic` and
  `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Function:TauCeti.IsSemialgebraicOn`,
  `TauCeti.IsSemialgebraicMap` give the semialgebraic set and graph predicates over an ordered
  commutative ring. The image/composition API in `Semialgebraic.Image`, including
  `TauCeti.IsSemialgebraic.image_comp_inr` and
  `TauCeti.IsSemialgebraicOn.isSemialgebraic_image`, assumes projection closure `hproj`.
  `Semialgebraic.QuantifierElimination:TauCeti.exists_isQF_realize_iff` also assumes `hproj`;
  these declarations do not supply unconditional Tarski–Seidenberg over R. The remaining
  projection theorem, dimension and degree contracts belong to RealAlgebraicGeometry.
- `TauCeti.LinearAlgebra.IntegralLattice.PosDef.Covolume:TauCeti.IntegralLattice.covolume_range_sq_eq_determinant`
  and `TauCeti.IntegralLattice.covolume_range_eq_sqrt_discriminant` identify covolume squared
  with determinant and covolume with the square root of the discriminant, for a nondegenerate
  integral lattice realized isometrically in a real inner-product space with full real span.
  The successive-minimum bound and independent witnesses remain the IntegralLattices Layer 2F
  contract below.
- `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`
  is finite surjectivity of the underlying scheme map, with identity, composition and base-change
  interfaces. The polarization, geometric Hom, degree and analytic comparison contracts below
  extend this library predicate; no second basic isogeny predicate is defined here.

### From TauCetiRoadmap roadmaps

- **ModularForms**, Layer 0: the normalized level-one j=E₄³/Δ with its q-expansion and modular
  invariance (Layers 2, 3 and 11).
- **EllipticCurves**: elliptic curves over fields and their isogenies (§1.2).
- **RealAlgebraicGeometry**: semialgebraic sets, their dimension and degree, and the
  Tarski–Seidenberg theorem (§2.1, §2.3). Clearing the fractional-linear denominators of §9.1
  specializes this theory; no second projection theorem is introduced.
- **AdelicAlgebraicGroups**, Layer 3: Siegel sets, reduced positive forms and the Siegel property
  (§0.6); the classical domain for Sp_{2g}(Z) on ℋ_g is specialized here.
- **DiophantineApproximationAndTranscendence**, §0.2: `finite_setOf_mahlerMeasure_le`, finiteness of
  algebraic numbers of bounded degree and Mahler measure (§1.9).

- **IntegralLattices**, Layer 2D: covolume(L)²=det L for a positive-definite integral
  lattice. Layer 2F: for rank r≥1 the squared minima λ_i are attained by independent integral
  vectors and satisfy ∏λ_i≤γ_r^r det L. Taking square roots gives the length product bound
  ∏ℓ_i≤γ_r^{r/2}√det L used below. No claim that the witnesses form a Z-basis is imported.

### From the roadmaps of the atlas

- **AbelianSchemesAndArithmeticModuli.** §A2.5 `Polarization`; §A3.1 `IsAbelianIsogeny`; §A3.3
  `AbelianQuotient`; §A3.5 `dualIsogenyCartierKernel`; §A3.7 `polarizedWeilPairing`; §A3.8
  `FullLevel`; §A3.9 `Polarization.rosati`; §A5.1 `AbelianLattice`, §A5.2 (Riemann forms), §A5.4
  `polarizationType`, §A5.8 `SiegelFamily`; §A6.6 `degreePolynomial` (the degree is a homogeneous
  polynomial of degree 2g on End⁰), §A6.7 `homFreeFinite` (Hom is free of rank at most 4 dim A dim
  B), §A6.11 `charpolyTate`, §A6.14 `rosatiPositivity` (the form Tr(αβ^†) is positive definite).
  Assumed: these hold over any field of characteristic zero, with geometric Hom groups over Q̄.
- **PELModuli.** §M2.9 `PELModuli.universal` and §M5.2 `siegelModuli` (the fine space A_{g,n}, n≥3,
  with its universal family over Z[1/n]); §M3.9 `siegelFineUniformization` (A_{g,n}(C)≅⊔_ζΓ(n)\ℋ_g);
  §M6.5 `coarseModuli` (the coarse space A_g and its points over algebraically closed fields). The
  level-one analytic comparison is §0.1.
- **ShimuraData.** Nodes `D1/mumford-tate-group` and `D1/hodge-generic` (Hodge genericity as
  MT=GSp_{2g}); `D4/shimura-datum` and `D4/special-point`; `D5/siegel-datum` (the Siegel datum with
  its GSp_{2g}(R)-action). Weakly special subvarieties are not defined there; they are §2.7.
- **ShimuraVarieties.** §0.4 `TauCeti.Shimura.effective_proper_action`; §2.1
  `TauCeti.Shimura.rational_boundary`; §2.7 `TauCeti.Shimura.baily_borel` (normal projective minimal
  compactification with quasi-projective interior); §2.8 `TauCeti.Shimura.koecher`; §3.6
  `TauCeti.Shimura.definable_target_comparison` (for torsion-free arithmetic quotients; specialized
  to A_g through a neat level in §2.5).
- **AutomorphicBundles.** §B4.3 `AutomorphyFactor` and §B4.4 `slashActionOfAutomorphyFactor` (the
  automorphy factor and slash action with the left-action convention). The classical Siegel Fourier
  expansion with half-integral indices is not stated there; it is §0.11.
- **FaltingsFinitenessAndIsogenyTheorems.** §R28.1.5 `modularHeight` (Faltings' height, invariant
  under base change, giving the stable height); §R28.2.1 `height_isogeny` (h(A₂)≤h(A₁)+½log deg φ);
  §R28.4.5 `tate_end_iso` (the Tate conjecture for endomorphisms); §R28.5.3 `finite_isogenyClasses`.
- **ArithmeticGaloisRepresentations.** §6.1 `tateModule_functoriality` (an isogeny of degree d is
  injective on T_ℓ with cokernel of order the ℓ-part of d); §6.2 `weilPairing_galois` (Galois
  equivariance of the Weil pairing up to the cyclotomic character).
- **InverseGaloisAndArithmeticFundamentalGroups.** §IG.2.4 `IsHilbertian` (number fields are
  Hilbertian); §IG.2.6 (full-group specialization of regular covers); §IG.2.5 (the integral thin-set
  count #{a∈E∩Z^r:|a_i|≤N}≤C_E N^{r−1/2}log N for thin E⊆Q^r). The count concerns thin subsets of
  Q^r, which is the case used: the parameters of §6.8 are integral points of the affine space over
  Q.
- **SchemeAndStackFoundations.** Nodes `SF.0/algebraic-scheme-dimension` (dimension theory of
  schemes of finite type over a field) and `SF.4/generic-projection` (generic linear projections).
- **AlgebraicModuliForArithmeticGeometry.** §7.10.1 `ComplexAnalyticSpace` (complex analytic spaces
  with nilpotents, and their closed analytic subsets).
- **ComplexComparisonPartII.** §C4.1 `remmertSteinExtension` and §C4.2 `projectiveChowNonreduced`
  (Chow's theorem for closed analytic subspaces of projective space).
- **ModularCurvesPartII.** Nodes `R12.1/pointed-elliptic-uniformization` (lattice uniformization of
  complex elliptic curves) and `R13.4a/modular-polynomial` (Φ_m∈Z[U,V] irreducible, symmetric, monic
  of degree ψ(m) in each variable).
- **JacobianChallengePartII.** §1.2 `RelativeJacobian.RelativeJacobian` and §1.4
  `RelativeJacobian.PrincipalPolarization` (the relative Jacobian of a smooth proper curve family
  and its canonical principal polarization, without a section).
- **StableReductionPartII.** Node `MC.2/pointed-dm-theorem` (the stack of stable curves is smooth
  and proper over Z of relative dimension 3g−3). The compact-type locus is part of §0.4.
- **ComplexMultiplicationAndExplicitReciprocity.** §CM.0 `CMType` and `CMType.IsPrimitive`; §CM.2
  `arbitraryCMClassification`, `relativeCMModuliOrbit` (the orbit over the reflex field as an Artin
  quotient) and `reflexClassMap_unitObstruction` (the kernel of the reflex class map modulo the
  polarized stabilizer has order at most 2^g).
- **AnalyticNumberTheory.** Nodes `AN.4/bounded-degree-brauer-siegel`,
  `AN.4/quadratic-hecke-log-functional-equation` and `AN.4/quadratic-hecke-log-derivative-one` (for
  the quadratic character of a CM extension, |L′(1,χ)/L(1,χ)|≤C_{g,ε}|Disc E|^ε, and the logarithmic
  functional equation between 0 and 1).

## How to read the build

Layer 0 fixes the moduli and period conventions. Layers 1 and 2 state the external theorems: the
quantitative arithmetic estimates and the o-minimal and functional-transcendence results. Layers 3
and 4 carry out the whole argument in genus one, where complex conjugation replaces Galois
genericity and the elliptic matrix bound replaces Rosati lengths; they are a model for the general
case and prove the real-curve theorem. Layers 5 to 7 prepare the general case: Rosati geometry turns
an isogeny into an integral matrix of controlled size (Layer 5), arithmetic specialization makes the
candidates Galois generic (Layer 6), and the candidate count with the large-isogeny estimates forces
a large field degree (Layer 7). Layer 8 computes the explicit field-degree bound from theta
coordinates, independently of the avoidance argument. Layer 9 combines everything into the counting
theorem, and Layer 10 draws the consequences. Layer 11 builds compact interpolation images meeting
every isogeny class. Layers 12 and 13 do not feed the main theorem: they specify a stronger
arithmetic statement and a local analytic one, and prove the obstruction that rules out the global
version.

## Layer 0: Moduli, the Torelli locus and period conventions

The common language comes first: the level-one uniformization of A_g, the Torelli locus and its
closure in the open Siegel moduli space, a hypersurface containing it, the classical reduced domain
with its diagonal comparisons, descent of hypersurfaces to Q̄, the matrix set used in the counting
argument, and the Fourier expansion of forms for finite-index subgroups of Sp_{2g}(Z).
Compactifications enter only where a statement says so.

### 0.1 The level-one uniformization of A_g

Prove `siegelUniformization`. For g≥1 let ℋ_g be the Siegel space of symmetric complex g×g matrices
with positive-definite imaginary part, with the left action τ↦(aτ+b)(cτ+d)⁻¹ of Sp_{2g}(Z). Let
J:ℋ_g→A_g(C) send τ to the class of the complex torus C^g/(Z^g+τZ^g) with the principal polarization
whose Riemann form is the standard symplectic form on Z^{2g}. Then J is holomorphic for the analytic
structure of A_g(C), surjective, and its fibres are exactly the Sp_{2g}(Z)-orbits, so it induces a
homeomorphism Sp_{2g}(Z)\ℋ_g≅A_g(C) which is a biholomorphism onto the normal complex space
underlying A_g(C). For every n≥3 it factors through the level-n comparison: A_g is the quotient of
the fine space A_{g,n} by GSp_{2g}(Z/nZ) acting on level structures, and on complex points this is
the quotient of ⊔_ζ Γ(n)\ℋ_g by the same group.

(Tsimerman 2018, §6.1, p.387; MZ20 §1.1, p.636, for the translates by Sp_{2g}(Q).)

*Proof sketch.* At level n≥3 use the complex comparison A_{g,n}(C)≅⊔_ζ Γ(n)\ℋ_g, indexed by the
primitive n-th roots of unity ζ that are values of the Weil pairing. The group GSp_{2g}(Z/nZ)
permutes the level structures; its similitude factor permutes the components and Sp_{2g}(Z/nZ), the
image of Sp_{2g}(Z) by strong approximation, acts on each. The quotient of the analytic side is
therefore Sp_{2g}(Z)\ℋ_g. On the algebraic side the coarse space is the quotient of A_{g,n} by the
same finite group, and analytification commutes with quotients of quasi-projective schemes by finite
groups (Cartan's quotient theorem), which identifies the two normal complex spaces.

The API:

- `siegelUniformization.surjective`: J is surjective onto A_g(C).
- `siegelUniformization.fibre`: J(τ)=J(τ′) if and only if τ′=γτ for some γ∈Sp_{2g}(Z).
- `siegelUniformization.holomorphic`: J is holomorphic into the analytification of A_g.
- `siegelUniformization.level`: For n≥3, J factors through Γ(n)\ℋ_g→A_{g,n}(C) and the forgetful map
  A_{g,n}→A_g.

*Needs:* PELModuli §M6.5 `coarseModuli` and §M3.9 `siegelFineUniformization`;
AbelianSchemesAndArithmeticModuli §A5.4 `polarizationType` and §A5.8 `SiegelFamily`; ShimuraData
node `D5/siegel-datum`.

*Lean:* `SiegelSpace`.

The predicate API includes `SiegelSpace.mem_iff` (transpose symmetry and positive-definite
imaginary part), `SiegelSpace.imaginaryIdentity` and `SiegelSpace.fromBlocks` (membership
for a block diagonal is equivalent to membership for both blocks).

**Checks.**

- `siegelUniformization.genusOne`: For g=1, J(τ)=J(τ+1)=J(−1/τ), and J(i) is the elliptic curve with
  j-invariant 1728.
- `siegelUniformization.minusIdentity`: −I_{2g} acts trivially on ℋ_g, so the stabilizer of every
  point contains ±I and the action of Sp_{2g}(Z) is not faithful; the fibres of J are orbits, not
  torsors.
- `siegelUniformization.blockDiagonal`: For τ=diag(τ₁,τ₂) with τ_i∈ℋ_1, J(τ) is the product of the
  elliptic curves J(τ₁), J(τ₂) with the product principal polarization.

**Checks for the Siegel-space predicate.**

- `SiegelSpace.imaginaryIdentity`: iI_g is symmetric with imaginary part I_g, so it belongs
  to ℋ_g, including the empty matrix in genus zero.
- `SiegelSpace.zeroBoundary`: The zero matrix is outside ℋ_1; semidefiniteness cannot replace
  positive definiteness.
- `SiegelSpace.symmetryRequired`: [[i,1],[0,i]] has positive-definite imaginary part but
  is not symmetric and is outside ℋ_2.

### 0.2 The smooth Torelli locus

Define `torelliLocus`. For g≥2, define T_g⊆A_g as the image of the smooth genus-g curve moduli stack
under the canonical principally polarized relative Jacobian morphism. Take its reduced Zariski
closure inside A_g, not inside a Satake compactification. Isogenies in the avoidance problem need
not preserve polarizations.

(MZ20 §1.1 pp.635–636 and §1.2 p.637.)

*Construction.* The canonically polarized relative Jacobian of the universal smooth curve gives a
morphism from the moduli stack of smooth genus-g curves to the Siegel moduli stack, by the moduli
property of the latter; take the image of the induced map to the coarse space A_g and its reduced
closure. Its points are polarized isomorphism classes.

The API:

- `torelliLocus.mem_iff`: x∈T_g iff x is the canonically polarized Jacobian of a smooth genus-g
  curve over an algebraically closed field of characteristic zero.
- `torelliLocus.subset_closure`: T_g⊆closure(T_g), with closure in A_g.
- `torelliLocus.baseChange`: The relative Jacobian moduli morphism commutes with extension of
  characteristic-zero algebraically closed fields.
- `torelliLocus.jacobianComparison`: For a single curve the relative Jacobian specializes to the
  JacobianChallenge Jacobian with its theta polarization.

*Needs:* JacobianChallengePartII §1.2 `RelativeJacobian.RelativeJacobian`; JacobianChallengePartII
§1.4 `RelativeJacobian.PrincipalPolarization`; StableReductionPartII node `MC.2/pointed-dm-theorem`
(the stack of stable curves); PELModuli §M6.5 `coarseModuli`.

**Checks.**

- `torelliLocus.genusTwoClosure`: The closure of T_2 is A_2; it is not a proper hypersurface.
- `torelliLocus.genusFourDimension`: dim T_4=9 whereas dim A_4=10.
- `torelliLocus.productBoundary`: A product of two elliptic curves belongs to closure(T_2) and is
  not a smooth genus-two Jacobian with its product principal polarization.

### 0.3 Torelli dimension

Prove `torelliDimension`. For g≥2 in characteristic zero, dim T_g=3g−3. In particular 3g−3<g(g+1)/2
for g≥4.

(MZ20 §1.1 p.635; §1.2 p.637.)

*Proof sketch.* Apply infinitesimal/global Torelli to show the smooth Torelli morphism has
generically zero-dimensional fibres; use dim M_g=3g−3. For g≥4 reduce the inequality to
(g−2)(g−3)>0.

*Needs:* §0.2.

*Lean:* `torelliDimension_lt`.

### 0.4 Compact-type Jacobians and the Torelli closure

Prove `compactTypeClosure`. Over C, closure(T_g) inside A_g is the locus of principally polarized
Jacobians of stable compact-type genus-g curves. Its product factors come from the smooth
components; non-compact-type generalized Jacobians have toric parts and are not A_g-points.

(MZ20 §1.1 pp.635–636; §1.4 p.642.)

*Proof sketch.* Extend the Torelli morphism over the compact-type locus of the stack of stable
curves, where the relative Picard scheme of degree zero is an abelian scheme carrying the product of
the canonical polarizations of the components. To obtain a closed image inside A_g, use an
extension of the Torelli map from the entire proper stack of stable curves to the Satake
compactification, whose inverse image of A_g is exactly the compact-type locus. Properness
after base change to A_g, together with density of smooth curves, identifies the image with
closure(T_g). Properness of the stable-curve stack alone does not imply properness of its open
compact-type locus.

**Gap.** The listed suppliers do not state this Satake extension, its boundary characterization,
or the principally polarized relative Picard construction for compact-type families. These are
required inputs to this argument; the smooth-family relative Jacobian does not supply them.

*Needs:* §0.2; StableReductionPartII node `MC.2/pointed-dm-theorem` (the stack of stable curves).

### 0.5 A hypersurface containing the Jacobian locus

Construct `jacobianHypersurface`. For g≥4 over C, choose a proper algebraic hypersurface H_g⊆A_g
containing closure(T_g). The choice is an algebraic hypersurface in a quasi-projective moduli space;
it need not be defined over Q.

(MZ20 §1.1 p.635; §1.2 Corollary 1.2 p.637.)

*Construction.* Use quasi-projectivity and the positive codimension of the closure to find a nonzero
projective homogeneous equation vanishing on it. Restrict its zero locus to A_g and retain a
hypersurface containing that closure.

The API:

- `jacobianHypersurface.contains`: Every canonically polarized compact-type Jacobian lies in the
  chosen H_g.
- `jacobianHypersurface.proper`: H_g is a proper algebraic subset of pure codimension one after
  adding any needed hypersurface components.
- `jacobianHypersurface.dimension`: dim H_g=G−1 on its nonempty components.
- `jacobianHypersurface.ambient`: The containment is inside PELModuli A_g and is independent of a
  chosen level lift.

*Needs:* §0.3; §0.4; ShimuraVarieties §2.7 `TauCeti.Shimura.baily_borel` and §2.8
`TauCeti.Shimura.koecher`.

**Checks.**

- `jacobianHypersurface.genusFour`: For g=4 the Jacobian closure itself is the Schottky
  hypersurface.
- `jacobianHypersurface.genusThree`: The construction requires g≥4: closure(T_3)=A_3.
- `jacobianHypersurface.levelForgetful`: Every fine-level lift of a Jacobian maps into H_g under the
  forgetful map.

### 0.6 The classical Minkowski-reduced Siegel domain

Define `minkowskiDomain`. For g≥1, F_g is the set of symmetric τ=x+iy in ℋ_g for which y is
Minkowski reduced, every |x_ij|≤1/2, and |det(cτ+d)|≥1 for every block matrix in Sp_{2g}(Z). Pin the
classical reduction inequalities, including the ordered diagonal, and retain boundary equalities.

(MZ20 §4 p.653; Igusa references pp.192–195.)

*Construction.* Use the Siegel space with its symplectic action and the classical reduction
inequalities of Igusa: Minkowski reduction of Im τ, the bound on Re τ, and the determinant
inequalities. The resulting set is semialgebraic because the reduction theorem cuts the infinitely
many determinant conditions down to finitely many; this is part of the statement, not a consequence
of writing down the infinite intersection.

The API:

- `minkowskiDomain.mem_iff`: For τ∈ℋ_g, membership in F_g is equivalent to Minkowski reduction of Im
  τ, all |Re τ_ij|≤1/2, and all symplectic-block determinant inequalities |det(cτ+d)|≥1; these
  retain equality on the boundary.
- `minkowskiDomain.orbitMeets`: Every Sp_{2g}(Z)-orbit in ℋ_g meets F_g.
- `minkowskiDomain.realPart`: τ∈F_g implies |Re τ_ij|≤1/2 for all i,j.
- `minkowskiDomain.semialgebraic`: F_g is semialgebraic after the source reduction to finitely many
  polynomial inequalities.
- `minkowskiDomain.genusOne`: F_1 agrees with the closed SL_2(Z) domain |Re τ|≤1/2 and |τ|≥1.

*Needs:* ShimuraData node `D5/siegel-datum`; TauCetiRoadmap AdelicAlgebraicGroups, Layer 3, §3.2
(Siegel sets for a fixed maximal compact); ShimuraVarieties §0.4
`TauCeti.Shimura.effective_proper_action`; §0.1.

*Lean:* `IsMinkowskiReduced`, `minkowskiDomain`.

The light predicate `IsMinkowskiReduced` requires y positive definite, y_kk≤h^t y h
for every integer h whose coordinates from k onward have gcd 1, and nonnegative
adjacent entries y_{i,i+1}. Its API is `IsMinkowskiReduced.mem_iff` for these clauses,
`IsMinkowskiReduced.posDef`, and `IsMinkowskiReduced.diagonalOrder`; the last follows
by testing the appropriate coordinate vectors. This is the classical ordered form
used for Siegel reduction, including its adjacent-sign convention.

**Checks.**

- `minkowskiDomain.i`: τ=i lies in F_1 and has y=1.
- `minkowskiDomain.smallImaginary`: τ=i/2 is in ℋ_1 but not in F_1.
- `minkowskiDomain.diagonalOrder`: The block product diag(2i,i) need not lie in F_2 because its
  imaginary diagonal is not ordered.

**Checks for Minkowski reduction.**

- `IsMinkowskiReduced.orderedDiagonal`: diag(1,2) is reduced; diag(2,1) fails the first
  primitive-vector inequality at h=(0,1).
- `IsMinkowskiReduced.adjacentSign`: [[1,−1/4],[−1/4,1]] is positive definite and fails
  the adjacent-entry sign condition. Positivity alone is insufficient.
- `IsMinkowskiReduced.zeroBoundary`: The zero form in rank one is not reduced because
  positive definiteness is part of the predicate.

### 0.7 Igusa diagonal comparison

Prove `igusaDiagonalEstimates`. For each g≥1 there exists δ_g∈(0,1] such that every τ=x+iy∈F_g
satisfies δ_g y^(0)≤y≤δ_g⁻¹y^(0), y^(0)≥δ_g I, and √3/2≤y_1≤⋯≤y_g. Matrix order means positive
semidefinite difference.

(MZ20 §4 (23)–(24) p.653.)

*Proof sketch.* Apply Igusa's comparison of a Minkowski-reduced positive form with its diagonal
(Corollary 2, p.193) and the lower bound for the first diagonal entry on the fundamental domain
(Lemma 15, p.195); combine them into the two matrix inequalities and the ordered diagonal bounds.

*Needs:* §0.6.

*Lean:* `DiagonalComparison`, `igusaDiagonalComparison`.

Define `DiagonalComparison δ τ` by δD_y≤y≤δ⁻¹D_y, D_y≥δI, and
|Re τ_ij|≤δ⁻¹; no diagonal ordering is built into it. The comparison theorems use
0<δ≤1 and τ∈ℋ_g. Its API is `DiagonalComparison.mem_iff`, the projections
`lower`, `upper`, `diagonalLower`, `realPart`, and block-diagonal compatibility (§0.8).

**Checks for the diagonal-comparison predicate.**

- `DiagonalComparison.identity`: For δ=1 and τ=iI_g all three matrix differences vanish
  and the real-entry bound holds.
- `DiagonalComparison.smallImaginary`: At δ=1, τ=i/2 fails D_y≥I although its imaginary
  part is positive definite.
- `DiagonalComparison.offDiagonal`: At δ=1, τ=[[i,i/2],[i/2,i]] has positive-definite
  imaginary part but y−D_y has eigenvalues ±1/2, so it fails the lower comparison.

### 0.8 The enlarged product domain

Prove `blockProductDomain`. If two genus-g matrices satisfy the diagonal comparisons with the same
δ∈(0,1] and |x_ij|≤δ⁻¹, their block diagonal matrix in H_{2g} satisfies the same comparisons and
real-entry bound. No ordered diagonal hypothesis is retained.

(MZ20 §4 p.653; §5.1 p.662.)

*Proof sketch.* Write the real and imaginary parts as block diagonal matrices. Evaluate the
quadratic forms blockwise to preserve both comparisons; off-block real entries are zero.

*Needs:* §0.7; Mathlib `Matrix.fromBlocks`.

*Lean:* `diagonalComparison_fromBlocks`.

### 0.9 An algebraic hypersurface capturing algebraic points

Prove `coefficientDescent`. For a proper complex algebraic hypersurface H in a geometrically
integral quasi-projective variety X defined over Q̄, its Q̄-points are contained in a proper
Q̄-defined algebraic hypersurface H′. On a finite affine/projective cover, expand defining equations
against a finite Q̄-linearly independent coefficient basis; all resulting coefficient equations
vanish at algebraic points.

(MZ20 §3.2 pp.646–647 and §5.1 p.661 (Galois conjugation setup).)

*Proof sketch.* Decompose each finite coefficient span over Q̄ and evaluate at Q̄-points. Embed X in
projective space over Q̄. Choose a homogeneous equation vanishing on the closure of H but not
identically on X_C. Expand its finite coefficient span over Q̄; because X is defined over Q̄, at
least one coefficient polynomial is nonzero on X. Its zero set in X is a proper Q̄-defined
hypersurface containing H∩X(Q̄). Use algebraicity of finite isogeny quotients of algebraic A to see
that every relevant isogenous B has an algebraic moduli point.

*Needs:* SchemeAndStackFoundations node `SF.0/algebraic-scheme-dimension`; PELModuli §M6.5
`coarseModuli`.

### 0.10 A fractional-linear period-matrix correspondence

Construct `periodMatrixCorrespondence`. For g≥1, τ∈M_g(C) and any Z⊆M_g(C), define
W_τ(Z)⊆M_2(M_g(R)) by det(cτ+d)≠0 and (aτ+b)(cτ+d)⁻¹∈Z. Here a,b,c,d are the four real blocks cast
entrywise to C, in the order X_00,X_01,X_10,X_11. The signs in the integer rational representation
(a,−b;−c,d) are converted to this positive coordinate convention before membership.

(MZ20 §5.1 pp.662–663.)

*Construction.* The set is defined directly from matrix multiplication, entrywise extension of
scalars and the inverse of a matrix with nonzero determinant. Specialize Z=F_g∩J⁻¹(H) only after F_g
and the restricted uniformization J are available (§0.6, §2.5).

The API:

- `periodMatrixCorrespondence.mem_iff`: X∈W_τ(Z) iff det(cτ+d)≠0 and (aτ+b)(cτ+d)⁻¹∈Z in the pinned
  block convention.
- `periodMatrixCorrespondence.mono`: Z⊆Z′ implies W_τ(Z)⊆W_τ(Z′).
- `periodMatrixCorrespondence.inter`: W_τ(Z∩Z′)=W_τ(Z)∩W_τ(Z′).
- `periodMatrixCorrespondence.empty`: W_τ(∅)=∅.
- `periodMatrixCorrespondence.identity`: The 2×2 block identity belongs to W_τ(Z) iff τ∈Z, with
  ordinary matrix multiplication and inverse.

*Needs:* Mathlib `Matrix.fromBlocks`; Mathlib `Matrix.mul_nonsing_inv`.

*Lean:* `periodMatrixCorrespondence`, `periodMatrixCorrespondence.mem_iff`,
`periodMatrixCorrespondence.mono`, `periodMatrixCorrespondence.inter`,
`periodMatrixCorrespondence.empty`, `periodMatrixCorrespondence.identity`.

**Checks.**

- `periodMatrixCorrespondence.emptyTarget`: For any g≥1 and τ, W_τ(∅)=∅.
- `periodMatrixCorrespondence.identityGenusOne`: At g=1, τ=i and Z={i}, the real block identity lies
  in W_τ(Z).
- `periodMatrixCorrespondence.singularExcluded`: The zero block matrix does not lie in W_τ(Z), even
  for Z=all matrices, when g≥1.

### 0.11 Λ-forms and their Siegel Fourier expansion

Define `LambdaForm`. Let g≥2, let Λ be a normal subgroup of finite index in Γ=Sp_{2g}(Z) and let k≥0
be an integer. A Λ-form of weight k is a holomorphic function ϕ on ℋ_g with ϕ(λτ)=Δ(λ,τ)^kϕ(τ) for
every λ=(a,b;c,d)∈Λ, where Δ(λ,τ)=det(cτ+d). Because the translations by integral symmetric matrices
form a free abelian group of rank G=g(g+1)/2 and Λ meets it in a subgroup of finite index, there is
an integer d≥1 such that ϕ(τ+2ds)=ϕ(τ) for all integral symmetric s, and ϕ has a unique expansion
ϕ(τ)=∑_M a(M)exp(πi tr(Mτ)), normally convergent on compact sets, over symmetric rational M with dM
half-integral (integral diagonal, half-integral off-diagonal entries). Since g≥2, a(M)=0 unless M is
positive semidefinite (Koecher principle). A Γ-form is a cusp form when a(M)=0 for every M that is
not positive definite.

(MZ20 §5.2, pp.663–665; van der Geer, Siegel modular forms and their applications,
arXiv:math/0605346v1, §4, Definition 4.1 and Theorems 4.3–4.4, pp.9–10.)

*Construction.* The translation subgroup of Λ has finite index in the lattice of integral symmetric
matrices, so it contains 2d times that lattice for some d≥1. The function is then periodic and
holomorphic in each entry. Under the exponential convention exp(πi tr(Mτ)), the condition on
the frequency is d tr(Ms)∈Z for every integral symmetric s: equivalently dM is half-integral.
For a translation period t not written as 2d, the corresponding condition is that (t/2)M be
half-integral. This factor of two fixes the frequency convention used in all later order bounds. Uniqueness of coefficients is the uniqueness of Fourier series on the
compact torus of real parts. For the Koecher principle the argument of van der Geer, Theorem 4.3,
applies to Λ: the unimodular transformations τ↦uτu^t that lie in Λ (a finite-index subgroup of
GL_g(Z)) relate a(M) and a(u^tMu), and a non-semidefinite M produces coefficients that would force
the series to diverge.

The API:

- `LambdaForm.fourierCoeff`: For dM half-integral, a(M) is the integral of
  ϕ(τ)exp(−πi tr(Mτ)) over a real period box of side 2d in the independent symmetric entries,
  using normalized Haar measure. It is independent of the imaginary part.
- `LambdaForm.hasSum_fourier`: The expansion converges normally on compact subsets of ℋ_g to ϕ.
- `LambdaForm.fourierCoeff_eq_zero_of_not_posSemidef`: For g≥2, a(M)=0 unless M is positive
  semidefinite.
- `LambdaForm.ext_fourierCoeff`: Two Λ-forms with the same coefficients are equal.
- `LambdaForm.mul`: The product of Λ-forms of weights k and k′ is a Λ-form of weight k+k′, with the
  convolution of the coefficients.

*Needs:* AutomorphicBundles §B4.3 `AutomorphyFactor` and §B4.4 `slashActionOfAutomorphyFactor`;
ShimuraVarieties §2.8 `TauCeti.Shimura.koecher`; §0.1; Mathlib `Matrix.PosSemidef`, `HasSum`.

**Checks.**

- `LambdaForm.periodTwo`: For g=1, exp(πiτ) has period 2 and not period 1: the normalization exp(πi
  tr(Mτ)) attaches integer-period expansions to M with even diagonal.
- `LambdaForm.koecherGenusOne`: For g=1 the Koecher principle fails: the invariant function j(τ) has
  the coefficient 1 at M=−2 (the term exp(−2πiτ)), so holomorphy at the cusp has to be imposed
  separately in genus one.
- `LambdaForm.constant`: A nonzero constant c is a Γ-form of weight 0 with a(0)=c and all other
  coefficients zero; it is not a cusp form.

### Examples

- In genus four dim A_4=10 and dim T_4=9, so the closure of the Torelli locus is a hypersurface, the
  Schottky hypersurface of §10.10; in genus three dim T_3=6=dim A_3 and the closure is all of A_3,
  so §0.5 needs g≥4.
- τ=i lies on the boundary of F_1 (|τ|=1, Re τ=0) with y=1, while τ=i/2 is in ℋ_1 but not in F_1
  because |τ|<1; the image of i/2 under τ↦−1/τ is 2i∈F_1.
- For the identity block matrix X, X∈W_τ(Z) if and only if τ∈Z; for the zero block matrix the
  determinant condition fails, so it lies in no W_τ(Z).

### Dependencies

Other roadmaps: PELModuli, AbelianSchemesAndArithmeticModuli, ShimuraData, JacobianChallengePartII,
StableReductionPartII, ShimuraVarieties, TauCetiRoadmap AdelicAlgebraicGroups,
SchemeAndStackFoundations, AutomorphicBundles.

## Layer 1: Quantitative arithmetic inputs: periods, isogenies, endomorphisms and CM orbits

These theorems from transcendence theory, Arakelov geometry and the arithmetic of CM points are used
with their exact hypotheses and numerical shape: the period theorem, the elliptic and general
isogeny estimates, the endomorphism estimate for the Rosati discriminant, the lower bound for cusp
forms at algebraic points, and the polynomial lower bound for Galois orbits of CM points with the
finiteness of CM points of bounded discriminant. A qualitative isogeny theorem, a bare point count
or qualitative CM reciprocity cannot replace any of them. The constants depend only on g unless
stated otherwise.

### 1.1 The period theorem

Prove `periodTheorem`. Let (A,L) be a polarized abelian variety of dimension g over a number field
k, with stable Faltings height h_F(A) (normalized as in GR14 §2; other normalizations change only
the constants). For an embedding σ:k→C let Ω_{A_σ} be the period lattice of A_σ in its tangent
space, normed by the Hermitian form ‖·‖_{L,σ} of the Riemann form of L_σ. For a proper abelian
subvariety B of A_σ let δ(A_σ,L_σ,B) be the least nonzero distance from a period to the tangent
space of B, and let δ(A_σ,L_σ) be the supremum of these over all proper B. Then

```text
(1/[k:Q]) Σ_σ (deg_L A)^{1/g} / δ(A_σ,L_σ)² ≤ 50 g^{2g+6} max(1, h_F(A), log deg_L A).
```

In the form of Masser and Wüstholz: if ω≠0 is a period of A_{σ₀}, A_ω is the smallest abelian
subvariety whose tangent space contains ω, and k′⊇k is a field of definition of A_ω with
[k′:k]≤2(9g)^{2g}, then (deg_L A_ω)^{1/dim A_ω} ≤ 195 g^{2g+9}[k′:Q]‖ω‖²_{L,σ₀} max(1, h_F(A),
log([k′:Q]‖ω‖²_{L,σ₀})).

(GR14 Théorème 1.2, p.345, and Théorème 1.3, p.346; the Masser–Wüstholz form is recalled on p.344.)

*Proof sketch.* GR14 prove the inequality by the method of the auxiliary section written with
Arakelov slopes of Hermitian vector bundles: an auxiliary section of a power of L with controlled
norm and high order of vanishing along the direction of the periods, an analytic interpolation
lemma, and a matrix lemma bounding the smallest nonzero period norms ρ(A_σ,L_σ) in terms of the
height. The second statement follows by applying the first to A_ω, whose minima at σ₀ are bounded by
‖ω‖_{L,σ₀}.

**Gap.** The prerequisites below supply polarized abelian varieties and their heights, but not
adelic Hermitian vector bundles with Arakelov slopes, cubist metrics and their height comparison,
or the quantitative auxiliary-section and interpolation estimates. GR14 §3.2, pp.358–360, and
§6.1–6.8, pp.368–380, use these inputs in proving the period bound. They need named targets
with the numerical hypotheses retained; a polarization and a Faltings height do not provide
that theory.

The API:

- `periodTheorem.matrixLemma`: With ρ(A_σ,L_σ) the least nonzero norm of a period, (1/[k:Q])Σ_σ
  ρ(A_σ,L_σ)^{−2} ≤ 14 max(1,h_F(A),log deg_L A), and the right side may be replaced by 16h_F(A)+49g
  (GR14 Théorème 1.1, p.345).
- `periodTheorem.minimalSubvariety`: The Masser–Wüstholz form for A_ω stated above.
- `periodTheorem.ellipticCase`: For an elliptic curve the only proper abelian subvariety is 0, so
  δ=ρ. With the principal polarization, deg_L E=1 and the left side is the matrix-lemma
  left side. The constants 50 and 14 in the two displayed bounds are different; an arbitrary
  polarization contributes its degree on the period-theorem left side.

*Needs:* AbelianSchemesAndArithmeticModuli §A2.5 `Polarization`, §A5.1 `AbelianLattice` and §A5.2
(Riemann forms); FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`.

**Checks.**

- `periodTheorem.ellipticDelta`: For an elliptic curve E, δ(E_σ,L_σ) equals the least nonzero period
  norm, since B=0 is the only proper abelian subvariety.
- `periodTheorem.powerScaling`: Replacing L by L^{⊗n} multiplies deg_L A by n^g and ‖·‖²_L by n, so
  (deg_L A)^{1/g}/δ² is unchanged while log deg_L A grows by g log n: the exponent 1/g is the one
  that makes the left side independent of the power.
- `periodTheorem.negativeHeight`: h_F(A) can be negative; without the maximum with 1 the right side
  could be negative although the left side is positive.

### 1.2 Elliptic isogeny estimate

Prove `ellipticIsogenyEstimate`. Let k be a number field and E₁, E₂ elliptic curves over k that are
isogenous over k̄. Then there is an isogeny between them over k̄ of degree at most
10⁷[k:Q]²(max(h_F(E₁),985)+4log[k:Q])², hence at most 10¹³[k:Q]² max(h_F(E₁),log[k:Q],1)².
Consequently, if D≥2 bounds [k:Q], there is such an isogeny of degree at most c D²(log
D)²(1+h(j(E₁)))² with an absolute constant c, where h is the absolute logarithmic Weil height.

(GR14 Théorème 1.4, p.347, and Lemme 7.9, p.393; MZ20 §2, Lemma 2.2, p.644, where the earlier form
with (1+h(j))⁴ (Masser–Wüstholz 1990) is recalled.)

*Proof sketch.* GR14 apply the period theorem (§1.1) to E₁²×E₂², taking a period attached to the
graph of an isogeny; the smallest abelian subvariety containing it controls the least isogeny
degree. For the second form, Lemme 7.9 of GR14 gives h_F(E)≤h(j(E))/12−0.72−(1/2)log π, so
max(h_F(E₁),log D,1)≤(1+h(j(E₁)))·log D/log 2 for D≥2, which converts the bound.

The API:

- `ellipticIsogenyEstimate.faltingsForm`: The bound 10¹³[k:Q]²max(h_F(E₁),log[k:Q],1)².
- `ellipticIsogenyEstimate.jForm`: The bound cD²(log D)²(1+h(j(E₁)))² for D≥2.
- `ellipticIsogenyEstimate.heightComparison`: h_F(E)≤h(j(E))/12−0.72−(1/2)log π for every elliptic
  curve over Q̄ (GR14 Lemme 7.9 with h_F=h−(1/2)log π).

*Needs:* §1.1; FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`; TauCetiRoadmap
EllipticCurves (isogenies of elliptic curves); ModularForms Layer 0 (the normalized `j`).

**Checks.**

- `ellipticIsogenyEstimate.selfIsogeny`: For E₂=E₁ the identity has degree 1, below the bound; the
  estimate is about the least degree, not about every isogeny (multiplication by n has degree n²).
- `ellipticIsogenyEstimate.fieldDependence`: A bound in terms of h_F(E₁) alone is false: for a fixed
  elliptic curve E over Q with End(E_{Q̄})=Z and a cyclic subgroup C_p of prime order p,
  Hom(E,E/C_p) is generated by the quotient map, so the least isogeny degree is p, unbounded while
  h_F(E) is fixed.
- `ellipticIsogenyEstimate.logDTwo`: At D=2, log D=log 2>0, so the j-form has a positive right side;
  at D=1 the factor (log D)² would vanish, which is why D≥2 is required.

### 1.3 Isogeny estimate for abelian varieties

Prove `isogenyEstimate`. Let A be an abelian variety of dimension g over a number field K and put
Ξ(A)=((7g)^{8g²}[K:Q]max(1,log[K:Q],h_F(A)))^{2g²}. If B is an abelian variety over K and A_L, B_L
are isogenous for some extension L/K, then there are isogenies A_L→B_L and B_L→A_L, both of degree
at most Ξ(A)². In particular, for abelian varieties A, B of dimension g over a number field k that
are isogenous over C, the least degree of an isogeny between them over C is at most c_g
max(h_F(A),[k:Q])^{κ_g} with c_g, κ_g depending only on g; this is the form used for CM points.

(GR23 Théorème 1.9(1), p.15; Tsimerman 2018, Theorem 2.3, pp.382–383, which takes it from
Masser–Wüstholz 1995 (factorization estimates), Theorem II and the last paragraph of p.23; the first
form of the isogeny estimate is Masser–Wüstholz 1993.)

*Proof sketch.* GR23 attach to the isogeny class of A a canonical abelian variety whose endomorphism
ring controls all isogenies in the class (their Théorèmes 1.3–1.5), bound the relevant discriminant
by the period theorem applied to a canonical period (Théorème 1.8; §1.1), and specialize to obtain
Ξ(A); isogenies that appear only after extension of scalars are reached by Rémond's descent results.
The finiteness of the isogeny class used in the construction is Faltings' theorem. The polynomial
form follows from max(1,log[k:Q],h_F(A))≤max(h_F(A),[k:Q]), since log x≤x and [k:Q]≥1, so that
Ξ(A)²≤((7g)^{8g²}[k:Q]max(h_F(A),[k:Q]))^{4g²}.

**Gap.** The canonical representative and endomorphism-order constructions of GR23 Théorèmes
1.3–1.5, pp.12–13, and the discriminant/period bound of Théorème 1.8, p.15, are not targets
in this roadmap or in the stated supplier contracts. Finiteness of an isogeny class and
freeness of Hom do not provide these effective constructions. Their prerequisite chain,
including descent to extensions L/K, is required before the displayed bound has a closed plan.

The API:

- `isogenyEstimate.overExtension`: The bound Ξ(A)² for isogenies defined over any extension L of K.
- `isogenyEstimate.bothDirections`: Both an isogeny A_L→B_L and one B_L→A_L satisfy the bound.
- `isogenyEstimate.polynomialForm`: The least isogeny degree over C is at most c_g
  max(h_F(A),[k:Q])^{κ_g}.

*Needs:* §1.1; FaltingsFinitenessAndIsogenyTheorems §R28.5.3 `finite_isogenyClasses` and §R28.1.5
`modularHeight`; AbelianSchemesAndArithmeticModuli §A6.7 `homFreeFinite`.

**Checks.**

- `isogenyEstimate.trivialCase`: For B=A the identity has degree 1≤Ξ(A)².
- `isogenyEstimate.xiAtLeastOne`: Ξ(A)≥1 even when h_F(A)<0, because of the maximum with 1.
- `isogenyEstimate.ellipticComparison`: For g=1, Ξ(E)²=(7⁸[K:Q]max(1,log[K:Q],h_F(E)))⁴ is weaker
  than the elliptic bound of §1.2, which has exponent 2 in [K:Q].

### 1.4 Endomorphism estimate

Prove `endomorphismEstimate`. There are c=c(g) and λ=λ(g) such that for every principally polarized
abelian variety A of dimension g defined over a number field of degree at most D, the Rosati
discriminant of its geometric endomorphism ring satisfies D(A)≤c max{D,h(A)}^λ. Here D(A) is the
determinant of the rational Rosati Gram matrix tr(ρ(v_i)ερ(v_j)^tε⁻¹) on a Z-basis v_1,…,v_r of
End(A_{Q̄}) (Conventions), and h(A) is the stable Faltings height.

(MZ20 §4, Lemma 4.4, p.657, which is the main theorem of Masser–Wüstholz 1994 (p.641) together with
their inequality for the constant on p.650 with δ=1; GR23 Théorème 1.9(3), p.15, gives an explicit
bound of the same shape for the covolume of End(A_L) with respect to a Rosati metric.)

*Proof sketch.* Masser and Wüstholz bound the discriminant by applying their isogeny and period
estimates to A×A and to the endomorphisms viewed as isogenies of the product; GR23 obtain the
explicit bound vol(End A_L)≤Ξ(A)^{g/2} from their control of the isogeny class (§1.3). Since D(A)
does not depend on the field of definition, the bound holds for End(A_{Q̄}).

The API:

- `endomorphismEstimate.geometric`: The bound concerns End(A_{Q̄}); enlarging the field of
  definition only increases D.
- `endomorphismEstimate.product`: For A over a field of degree ≤D₁ and Ã over a field of degree ≤D₂,
  the product over the compositum gives D(A×Ã)≤c(2g)max{D₁D₂,h(A)+h(Ã)}^{λ(2g)}, stable heights
  being additive on products.

*Needs:* §1.3; AbelianSchemesAndArithmeticModuli §A6.7 `homFreeFinite`, §A6.14 `rosatiPositivity`
and §A3.9 `Polarization.rosati`; FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`.

**Checks.**

- `endomorphismEstimate.rankOne`: If End(A)=Z then D(A)=ℓ([1])²=tr(I_{2g})=2g.
- `endomorphismEstimate.ellipticSquare`: For A=E² with End(E)=Z and the product polarization,
  End(A)=M₂(Z) and the matrix units are orthogonal of squared length 2, so D(A)=2⁴=16.
- `endomorphismEstimate.cmGrowth`: For an elliptic curve with endomorphism ring an imaginary
  quadratic order O, the Gram matrix of {1,ω} is [[2,2Re ω],[2Re ω,2|ω|²]], so D(E)=4(Im ω)²=|disc
  O|: D(A) is unbounded, and the bound must grow with D and h.

### 1.5 Lower bound for cusp forms at algebraic points

Prove `cuspValueLowerBound`. (a) There are cusp forms ϕ_1,…,ϕ_r for Γ=Sp_{2g}(Z) of a common weight,
with rational Fourier coefficients, that have no common zero on ℋ_g. (b) Fix 0<δ≤1 and one such
ϕ=ϕ_k. There is C=C(g,δ,ϕ) such that whenever τ=x+iy∈ℋ_g satisfies y≥δy^{(0)} and y^{(0)}≥δι, J(τ)
is a principally polarized abelian variety A defined over a number field of degree at most D, and
ϕ(τ)≠0, one has log max{1,|ϕ(τ)|⁻¹}≤C D max{1,h(A)}.

(Masser–Wüstholz 1993 (periods and minimal abelian subvarieties), Lemma 8.6, p.440, Lemma 8.4, p.439
(with r=1 and the identity embedding), and (7.4), p.436, as applied in MZ20 §4, proof of Lemma 4.3,
pp.656–657; the 1993 paper is not freely available and these locators are those given in MZ20.)

*Proof sketch.* The value of a cusp form with rational coefficients at the period matrix of an
abelian variety over a number field is algebraic up to an explicit normalization, so a
Liouville-type inequality bounds it from below in terms of its degree and of the projective height
of the origin in a theta embedding (Lemma 8.4); the height of the origin is bounded by a multiple of
max{1,h(A)} ((7.4)). Part (a) is the existence, used in the proof of Lemma 8.6, of finitely many
cusp forms with rational coefficients without common zeros.

The API:

- `cuspValueLowerBound.noCommonZero`: The forms ϕ_1,…,ϕ_r have no common zero on ℋ_g.
- `cuspValueLowerBound.rationalCoefficients`: Every ϕ_k has Fourier coefficients in Q, in the
  expansion of §0.11.
- `cuspValueLowerBound.lowerBound`: The inequality of (b).

*Needs:* §0.11; §0.1; FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`.

**Checks.**

- `cuspValueLowerBound.genusOneDelta`: For g=1 the single form Δ (weight 12, integral coefficients)
  has no zero on ℋ_1, so r=1 is possible.
- `cuspValueLowerBound.decayAtCusp`: For g=1 and τ=it, |Δ(it)|=e^{−2πt}∏(1−e^{−2πnt})^{24}, so
  log|Δ(it)|⁻¹ is about 2πt: the lower bound forces t≪D max{1,h(A)}, the shape of §5.11.
- `cuspValueLowerBound.notInvariant`: |ϕ(γτ)|=|det(cτ+d)|^w|ϕ(τ)| for γ∈Γ, so the lower bound is a
  statement about the given τ under the stated hypotheses on y, not a function on A_g.

### 1.6 The averaged Colmez formula

Prove `averagedColmez`. Let E be a CM field of degree 2d with maximal totally real subfield F, χ the
quadratic Hecke character of E/F, and L(s,χ) its L-function without archimedean factors. For a CM
type Φ of E let h_Falt(E,Φ) be the Faltings height of any complex abelian variety with complex
multiplication by O_E of type Φ; it depends only on (E,Φ). With the normalization of the Faltings
height fixed in AGHMP §9.1,

```text
2^{−d} Σ_Φ h_Falt(E,Φ) = −(1/2)·L′(0,χ)/L(0,χ) − (1/4)·log|D_E/D_F| − (d/2)·log(2π),
```

the sum running over the 2^d CM types of E.

(AGHMP 2018, Theorem A, p.392 (Theorem 9.5.5 in the text); Yuan–Zhang 2018, Theorem 1.1; recalled in
Tsimerman 2018, Theorem 3.2, p.383.)

*Proof sketch.* Two independent proofs are known. AGHMP compute arithmetic intersections of special
divisors with big CM points on Shimura varieties of type GSpin(n,2), using Borcherds products and
Green function computations, and deduce the formula; Yuan and Zhang use Gross–Zagier type formulas
on Shimura curves over totally real fields. The independence of h_Falt(A) from A within the CM type
is Colmez's theorem.

**Gap.** The orthogonal Shimura integral models, big CM cycle, special arithmetic divisors
and arithmetic intersection formula used in this proof are not supplied by CM types,
reciprocity and Faltings heights. In AGHMP this formula is Theorem B, p.395, or Theorem 6.4.2,
p.474; its Green-function input is Theorem 6.3.1, p.473. These require exact prerequisite targets,
including the removal of the bad-prime error in the final averaged formula. An orthogonal
Shimura datum by itself would not supply them.

The API:

- `averagedColmez.colmezIndependence`: h_Falt(A) depends only on (E,Φ) for A with CM by O_E of type
  Φ (Colmez 1993, recalled in AGHMP p.392).
- `averagedColmez.formula`: The displayed identity.

*Needs:* ComplexMultiplicationAndExplicitReciprocity §CM.0 `CMType` and §CM.2
`arbitraryCMClassification`; FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`.

**Checks.**

- `averagedColmez.imaginaryQuadratic`: For d=1, E imaginary quadratic and F=Q, the two CM types give
  the same height and the formula is the Chowla–Selberg formula.
- `averagedColmez.typeCount`: The left side averages over exactly 2^d CM types, one choice in each
  pair of complex-conjugate embeddings.
- `averagedColmez.noArchimedeanFactors`: L(s,χ) omits the archimedean Gamma factors; using the
  completed L-function changes the right side by explicit Gamma-factor terms, so the normalization
  must be the stated one.

### 1.7 Faltings heights of CM abelian varieties are subpolynomial in the discriminant

Prove `cmFaltingsHeightBound`. For every g≥1 and ε>0 there is C(g,ε) such that for every CM field E
of degree 2g, every primitive CM type Φ of E and every complex abelian variety A with complex
multiplication by O_E of type Φ, h_F(A)≤C(g,ε)|Disc E|^ε. The proof also uses Bost's lower bound:
there is c_g with h_F(A)≥c_g for every abelian variety A of dimension g over Q̄.

(Tsimerman 2018, Corollary 3.3, pp.383–384, and Theorem 2.1 (Bost), p.382.)

*Proof sketch.* Apply Bost's lower bound to every term of the sum in §1.6 other than the one of A,
which bounds h_F(A) by 2^g times the right side plus (2^g−1)|c_g|. On the right side,
log|D_E/D_F|≤log|Disc E|, and L′(0,χ)/L(0,χ) is bounded through the functional equation by
L′(1,χ)/L(1,χ) plus O(log|Disc E|); the subpolynomial bound for the logarithmic derivative at 1 is
supplied by the quadratic Hecke estimates of AnalyticNumberTheory. Since |Disc E| grows, every
logarithm is O(|Disc E|^ε).

The API:

- `cmFaltingsHeightBound.bost`: h_F(A)≥c_g for every abelian variety of dimension g over Q̄ (Bost
  1996, as recalled in Tsimerman 2018, Theorem 2.1).
- `cmFaltingsHeightBound.subpolynomial`: h_F(A)≤C(g,ε)|Disc E|^ε.

*Needs:* §1.6; AnalyticNumberTheory nodes `AN.4/quadratic-hecke-log-functional-equation` and
`AN.4/quadratic-hecke-log-derivative-one`; ComplexMultiplicationAndExplicitReciprocity §CM.0
`CMType.IsPrimitive`.

**Checks.**

- `cmFaltingsHeightBound.genusOneGrowth`: For g=1, after the functional equation the formula reads
  h=(1/4)log|D_K|+(1/2)L′(1,χ)/L(1,χ)+c with an absolute c: the height is unbounded in K but
  O(|D_K|^ε).
- `cmFaltingsHeightBound.lowerBoundNeeded`: Without a lower bound on the other summands the average
  would not bound a single term: the heights can be negative, so Bost's bound is a real input.
- `cmFaltingsHeightBound.primitive`: The hypothesis that Φ is primitive guarantees End(A)=O_E; for a
  non-primitive type A is isogenous to a power of a lower-dimensional CM variety and the statement
  is applied to that factor.

### 1.8 Lower bound for Galois orbits of CM points

Prove `cmGaloisOrbitLowerBound`. For every g≥1 there is b_g>0 such that every special point x∈A_g
satisfies |Disc(R_x)|≪_g |Gal(Q̄/Q)·x|^{b_g}, where R_x is the centre of End(A_x) and Disc(R_x) its
discriminant. The constants are ineffective. This is the polynomial lower bound for Galois orbits
conjectured by Edixhoven, in the form of Pila–Tsimerman's Conjecture 7.1.

(Tsimerman 2018, Theorem 5.2 and Theorem 4.2, p.385; Pila–Tsimerman 2014, Conjecture 7.1, p.673; for
g≤6 earlier Tsimerman 2012.)

*Proof sketch.* For a CM field E of degree 2g and a primitive type Φ the set S(E,Φ) of isomorphism
classes with CM by O_E of type Φ has |Cl(E)| elements, at least |Disc E|^{1/4−o(1)} by
Brauer–Siegel, and its members correspond to ideals of O_E with isogeny degree equal to the norm; so
two members have least isogeny degree at least |Disc E|^{1/4−o(1)} (Proposition 2.2). Both are
defined, with their endomorphisms and 3-torsion, over a field of degree at most 4·3^{8g²}[Q(A):Q]
(Lemma 4.1 and its proof), so §1.3 with §1.7 gives [Q(A):Q]≫|Disc E|^{δ_g} (Theorem 4.2). The
passage from the field of moduli to the Galois orbit of x and the reduction of the general special
point to the primitive case go through the reflex reciprocity description of the orbit and
Ullmo–Yafaev's reduction (Tsimerman 2018, pp.385–386, citing Ullmo–Yafaev, Theorem 7.1).

**Gap.** The primitive-type proof must keep track of the field of moduli used for a CM
class and for a polarized pair. The rigidification argument applies to the polarized pair;
its extension bound cannot simply be transferred to an unpolarized field of moduli. The
necessary comparison, and the reduction from primitive maximal-order CM data to all special
points cited from Ullmo–Yafaev in Tsimerman 2018 pp.385–386, are not targets in the stated
CM supplier. They need exact statements rather than an implicit appeal to the final orbit bound.

The API:

- `cmGaloisOrbitLowerBound.primitiveType`: [Q(A):Q]≫|Disc E|^{δ_g} for A with CM by O_E of primitive
  type (Tsimerman 2018, Theorem 4.2).
- `cmGaloisOrbitLowerBound.moduliFieldExtension`: For a principally polarized pair (A,λ) there
  is a field containing its polarized field of moduli Q(A,λ), of degree at most 2·3^{4g²}
  over it, over which the pair, its endomorphisms and its polarizations are defined
  (Tsimerman 2018, Lemma 4.1, p.384). Full level 3 rigidifies the polarized pair.
- `cmGaloisOrbitLowerBound.orbitBound`: The displayed inequality for all special points.

*Needs:* §1.3; §1.7; ComplexMultiplicationAndExplicitReciprocity §CM.2 `relativeCMModuliOrbit` and
`reflexClassMap_unitObstruction`; AnalyticNumberTheory node `AN.4/bounded-degree-brauer-siegel`.

**Checks.**

- `cmGaloisOrbitLowerBound.genusOne`: For g=1 and x=j(E) with End(E)=O, |Gal·x| is the class number
  h(O) and |Disc R_x|=|disc O|; the statement is the Landau–Siegel bound h(O)≫_ε|disc O|^{1/2−ε}.
- `cmGaloisOrbitLowerBound.centreNotEnd`: For A=E² with End(E)=O_K, End(A)=M₂(O_K) has rank 8, but
  R_x=O_K and Disc(R_x)=disc O_K.
- `cmGaloisOrbitLowerBound.ineffective`: No explicit value of the implied constant is claimed: the
  Brauer–Siegel input is ineffective.
- `cmGaloisOrbitLowerBound.polarizedRigidity`: On E² the unpolarized automorphism
  [[1,3],[0,1]] fixes every 3-torsion point and is not the identity. It does not preserve the
  product principal polarization. Full level 3 alone cannot rigidify unpolarized automorphisms.

### 1.9 Finitely many CM points of bounded discriminant

Prove `cmBoundedDiscriminantFinite`. For every B>0 there are only finitely many special points x∈A_g
with |Disc(R_x)|<B, where R_x is the centre of End(A_x).

(Pila–Tsimerman 2014, Lemma 7.4, p.675; Pila–Tsimerman 2013, Theorem 3.1 (arXiv:1106.4023v1, p.3).)

*Proof sketch.* Lift x to the Siegel fundamental domain (§0.6). The entries of the lift Z are
algebraic of degree bounded by a constant depending only on g, and the height of Z is
polynomially bounded in |Disc(R_x)| (Pila–Tsimerman 2013, Theorem 3.1, proof pp.3–8). A safe
degree bound is (2g)!: in the CM lattice description the entries lie in a common normal closure
of the CM fields in the centre of End⁰(A). Its Galois group acts faithfully on at most 2g
embeddings, and rational symplectic changes of basis keep the entries in that field. This
argument also covers products; no degree-2g common field is assumed. Northcott's finiteness for algebraic numbers of bounded degree
and height leaves finitely many Z, hence finitely many x.

The API:

- `cmBoundedDiscriminantFinite.preSpecialHeight`: For a special point x with lift Z in the
  fundamental domain, H(Z) is polynomially bounded in |Disc(R_x)| (Pila–Tsimerman 2013,
  Theorem 3.1).
- `cmBoundedDiscriminantFinite.algebraicEntries`: The entries of Z are algebraic of degree at
  most (2g)!, uniformly in x. This is sufficient for Northcott and does not require the
  sharper bound 2g (the simple-case construction in the cited 2013 version uses 4g on p.6).

*Needs:* §0.6; §0.1; DiophantineApproximationAndTranscendence §0.2 `finite_setOf_mahlerMeasure_le`
(Northcott finiteness in bounded degree).

**Checks.**

- `cmBoundedDiscriminantFinite.genusOneSmall`: For g=1 and B=5 the special points are j=0 (disc −3)
  and j=1728 (disc −4): exactly two.
- `cmBoundedDiscriminantFinite.productDiscriminant`: For x=E₀×E₁₇₂₈ in A_2 with End(E₀)=Z[ζ₃],
  End(E₁₇₂₈)=Z[i], the centre is Z[ζ₃]×Z[i] and |Disc(R_x)|=3·4=12.
- `cmBoundedDiscriminantFinite.degreeBound`: In genus one (2g)!=2, agreeing with quadratic
  CM periods. In genus three three distinct imaginary quadratic factors may have common
  normal closure of degree 8; the uniform bound 6!=720 accommodates this compositum.
- `cmBoundedDiscriminantFinite.notIsogenyInvariant`: R_x is not an isogeny invariant: the curves
  with CM by the orders of conductor f in Q(i) are all isogenous, with |Disc|=4f² unbounded, so
  finiteness needs the bound on Disc(R_x), not on the CM field.

### Examples

- For k=Q and h_F(E₁)≤985 the elliptic estimate bounds the least isogeny degree by
  10⁷·985²≈9.7·10¹²; for curves of larger height the bound grows like h_F(E₁)².
- For g=1, K=Q and h_F(A)≤1, Ξ(A)=(7⁸)²=7¹⁶≈3.3·10¹³, so §1.3 gives isogenies of degree at most 7³².
- The Rosati discriminant of an elliptic curve with endomorphism ring Z[i] is 4 and with Z[ζ₃] it is
  3; for a curve without complex multiplication it is 2.

### Dependencies

Earlier layers: Layer 0. Other roadmaps: AbelianSchemesAndArithmeticModuli,
FaltingsFinitenessAndIsogenyTheorems, TauCetiRoadmap EllipticCurves, ModularForms,
ComplexMultiplicationAndExplicitReciprocity, AnalyticNumberTheory,
DiophantineApproximationAndTranscendence.

## Layer 2: O-minimal counting, definable blocks and functional transcendence

The counting part of the argument works in the o-minimal structure R_an,exp. Rational points of
bounded height on a definable family are covered by few definable blocks, uniformly in the
parameter; the uniformizing maps restricted to fundamental sets are definable; and functional
transcendence (Ax–Lindemann for j and for A_g) together with the dichotomy for weakly special
subvarieties through Hodge-generic points shows that the relevant blocks project to points.

### 2.1 O-minimal structures over the real field

Define `OMinimalStructure`. An o-minimal structure over R is a sequence S=(S_n)_{n≥1}, S_n a
collection of subsets of R^n, such that each S_n is a Boolean algebra containing every semialgebraic
subset of R^n; A∈S_n and B∈S_m imply A×B∈S_{n+m}; the projection of a member of S_{n+m} to the first
n coordinates lies in S_n; and every member of S_1 has finite boundary. Members of S_n are the
definable sets; a function is definable when its graph is. The dimension of a definable set is the
largest κ such that it has a point near which it is a C¹ submanifold of dimension κ.

(Pila 2011, Definition 2.1, p.1791, and the definition of regular points and dimension on p.1794.)

*Construction.* The structure axioms are closure properties; the theory used later (finitely many
connected components, cell decomposition, definable choice and the definability of the regular locus
in families) is the standard theory of o-minimal structures (van den Dries, Tame topology; Pila
2011, p.1791 and p.1794).

The API:

- `OMinimalStructure.semialgebraic_mem`: Every semialgebraic set is definable.
- `OMinimalStructure.finite_components`: A definable set has finitely many connected components.
- `OMinimalStructure.regular_definable`: For a definable family, the set of points that are regular
  of dimension κ in their fibre is definable.
- `OMinimalStructure.dim`: Dimension as the largest dimension of a regular point; the non-regular
  part has smaller dimension.

*Needs:* TauCetiRoadmap RealAlgebraicGeometry (semialgebraic sets and the Tarski–Seidenberg
theorem); Mathlib `IsConnected`, `ContDiff`.

**Checks.**

- `OMinimalStructure.semialgebraic`: The semialgebraic sets form an o-minimal structure: projection
  is the Tarski–Seidenberg theorem.
- `OMinimalStructure.integersNotDefinable`: Z⊆R is not definable in any o-minimal structure (an
  infinite discrete set has infinite boundary), so the graph of sin on all of R is never definable:
  its zero set is πZ.
- `OMinimalStructure.finiteUnionOfIntervals`: The definable subsets of R are exactly the finite
  unions of points and open intervals.

### 2.2 The structure R_an,exp and its o-minimality

Define `RanExp`. Define R_an,exp as the smallest structure over R containing the graph of exp:R→R
and the graphs of all restricted analytic functions, that is, of the restrictions to [−1,1]^n of
functions real analytic on a neighbourhood of [−1,1]^n. Since an intersection of structures is a
structure, the smallest one exists. Prove `ranExp_isOMinimal`: R_an,exp is o-minimal.

(Pila 2011, pp.1791–1792 (R_an by Gabrielov and van den Dries, R_exp by Wilkie and Khovanskii,
R_an,exp by van den Dries–Miller and van den Dries–Macintyre–Marker); Pila–Tsimerman 2014, §2.7,
p.665.)

*Construction.* O-minimality of R_an,exp is the theorem of van den Dries, Macintyre and Marker, also
obtained by van den Dries and Miller, building on Wilkie's model completeness of the real
exponential field and on Gabrielov's theorem of the complement for subanalytic sets.

**Gap.** The definition of the structure is elementary, but its o-minimality proof needs
model completeness and the restricted-analytic/exponential theory used by van den Dries,
Macintyre and Marker. None of these key inputs is in §2.1 or in the semialgebraic supplier.
The cited account identifies the theorem but does not supply a prerequisite plan for it.

The API:

- `RanExp.exp_mem`: The graph of exp:R→R is definable.
- `RanExp.restrictedAnalytic_mem`: The graph of every restricted analytic function is definable.
- `ranExp_isOMinimal`: R_an,exp is an o-minimal structure.

*Needs:* §2.1.

**Checks.**

- `RanExp.log`: log on (0,∞) is definable, its graph being the coordinate swap of the graph of exp.
- `RanExp.periodicNot`: sin on all of R is not definable (its zero set is infinite and discrete),
  while sin on [0,2π] is, as a rescaled restricted analytic function.
- `RanExp.polynomiallyBounded`: R_an alone is polynomially bounded, so exp is not definable in R_an;
  the exponential is needed for the cusp of ℋ_1 (§2.5).

### 2.3 Algebraic part, definable blocks and block families

Define `DefinableBlock`. Fix an o-minimal structure. For Z⊆R^n, the algebraic part Z^alg is the
union of all connected positive-dimensional semialgebraic subsets of Z. A definable block of
dimension w and degree at most d in R^n is a connected definable set W of dimension w, regular at
every point, contained in a semialgebraic set A of dimension w and degree at most d that is regular
at every point. A definable block family of dimension w and degree d is a definable family W⊆R^n×R^m
whose nonempty fibres are definable blocks of dimension w and degree at most d. A point is a block
of dimension 0, and a block of positive dimension contained in Z lies in Z^alg. Prove
`DefinableBlock.image`: if B⊆R^κ is semialgebraic and φ:B→R^ν is semialgebraic, the image of a
definable block W, meaning φ(W∩B), is a finite union of definable blocks; the analogous
fibrewise image of a definable block family is a finite union of definable block families.

(Pila 2011, Definition 3.1, p.1792, Definition 3.4 and the remark following it, p.1794, and
Lemma 3.5, p.1795; these blocks are the basic blocks of Pila 2009.)

*Construction.* For the image: intersect with B and decompose by induction on dimension into pieces
on which φ is continuous and the image is regular of constant dimension; each connected piece of W
in such a stratum is a block over the corresponding stratum of A, and its image is a block over the
image stratum (Pila 2011, proof of Lemma 3.5). The family version runs the same argument in
definable families.

The API:

- `algebraicPart`: Z^alg, the union of the connected positive-dimensional semialgebraic subsets of
  Z.
- `DefinableBlock.subset_algebraicPart`: A block of positive dimension contained in Z lies in Z^alg.
- `DefinableBlock.zeroDim`: A block of dimension 0 is a point.
- `DefinableBlock.image`: The image statement above.
- `DefinableBlockFamily`: Definable families all of whose nonempty fibres are blocks of fixed
  dimension and bounded degree.

*Needs:* §2.1; TauCetiRoadmap RealAlgebraicGeometry (semialgebraic sets, dimension and degree).

**Checks.**

- `DefinableBlock.point`: A single point is a definable block of dimension 0 and degree 1.
- `DefinableBlock.disconnected`: The two-point set {0,1}⊆R is not a block, since blocks are
  connected; it is a union of two blocks.
- `algebraicPart.expGraph`: For Z the graph of exp on R, Z^alg=∅, since the graph contains no
  semialgebraic arc; for Z=R×{0}, Z^alg=Z.

**Checks for the algebraic part.**

- `algebraicPart.point`: The algebraic part of a singleton is empty; zero-dimensional
  semialgebraic subsets are excluded.
- `algebraicPart.line`: For Z=R×{0}, its connected semialgebraic line gives Z^alg=Z.
- `algebraicPart.exponential`: For the graph of exp, Z^alg is empty: a semialgebraic
  arc would force a polynomial relation for exp on an interval.

**Checks for block families.**

- `DefinableBlockFamily.intervals`: W={(x,t):t>0, 0<x<t} is a family of degree-one
  one-dimensional blocks; fibres at t≤0 are empty and permitted.
- `DefinableBlockFamily.disconnectedFibre`: The constant fibre {0,1} is not a block
  family of dimension zero, since each nonempty fibre must be connected.
- `DefinableBlockFamily.dimensionJump`: Fibres {0} at t=0 and (0,1) at t≠0 cannot
  form one block family of fixed dimension, although every fibre separately is a block.

### 2.4 Uniform counting of rational points in definable blocks

Prove `uniformBlockCounting`. Let Z⊆R^n×R^m be a definable family and ε>0. There are finitely many
definable block families W^{(j)}⊆R^n×(R^m×R^l) and a constant c=c(Z,ε) such that W^{(j)}_{(y,η)}⊆Z_y
for all (y,η), and for every y∈R^m and T≥1 the rational points of Z_y of height at most T lie in the
union of at most cT^ε blocks of the form W^{(j)}_{(y,η)}. Here the height of a rational point is the
maximum over its coordinates of max(|a|,|b|) for a/b in lowest terms; for integer points it is the
sup norm. Consequently the number of rational points of height at most T in Z_y∖Z_y^alg is at most
cT^ε, uniformly in y.

(Pila 2011, Theorem 3.6 and Remarks 3.7(1), pp.1795–1796 (the case of rational points is Pila 2009);
Pila–Wilkie 2006, recalled as Theorem 3.2 of Pila 2011, p.1793; MZ20 §3.2, p.650, applies Pila 2009,
Theorem 3.5(2), p.158.)

*Proof sketch.* The counting theorem of Pila and Wilkie combines the o-minimal reparametrization of
definable sets by maps with bounded derivatives with the Bombieri–Pila determinant method, uniformly
in families. Pila 2009 refines it so that the rational points are covered by few basic blocks from
finitely many families; Pila 2011 adds degrees and passes to images under semialgebraic maps by
§2.3.

**Gap.** The rational-point case used here still depends on the block-counting theorem
behind Pila 2011 Theorem 3.6. Its proof on pp.1796–1797 invokes Pila 2009 Theorem 3.5; it
does not derive that case from the definitions of blocks. The uniform C^r reparametrization
and determinant estimate needed for the counting argument require targets and exact
family-uniform constants. The supplied semialgebraic projection theory alone is insufficient.

The API:

- `uniformBlockCounting.blocks`: The covering of the rational points of Z_y of height ≤T by at most
  cT^ε blocks from finitely many families.
- `uniformBlockCounting.outsideAlgebraicPart`: N(Z_y∖Z_y^alg,T)≤cT^ε uniformly in y.
- `uniformBlockCounting.integerPoints`: For integer points the height is max_i|x_i|.

*Needs:* §2.1; §2.3.

**Checks.**

- `uniformBlockCounting.lineNeedsBlocks`: For Z=R×{0} the rational points of height ≤T number about
  (12/π²)T², not O(T^ε); the theorem covers them by one block, the line itself, which lies in Z^alg.
- `uniformBlockCounting.uniformInParameter`: For the family of lines Z_y={(x,yx)} the number of
  rational points of height ≤T ranges from one (y irrational) to about T² (y=0), while one block per
  fibre suffices: the count of blocks is uniform in y, the count of points is not.
- `uniformBlockCounting.heightConvention`: H(4/6)=H(2/3)=3 and H((1/2,5))=5: heights use lowest
  terms and the maximum over coordinates.

### 2.5 Definability of the uniformizations on fundamental sets

Prove `definableUniformization`. (Genus one.) In the real coordinates (Re τ, Im τ, Re j, Im j), the
restriction of j to the closed standard fundamental domain F⊆ℋ_1, and to any finite union of
SL_2(Z)-translates of F, is definable in R_an,exp. (Siegel.) There is an open set U⊆ℋ_g containing
the Siegel fundamental set F_g of §0.6 such that the restriction to U of the holomorphic map
ℋ_g→P^m(C) given by modular forms, which induces an embedding of Sp_{2g}(Z)\ℋ_g with Zariski-open
image in a projective variety, is definable in R_an,exp. Consequently, for every algebraic
subvariety H⊆A_g the set F_g∩J⁻¹(H) is definable.

(Pila 2011, Proposition 4.3 and Remark 4.4, p.1799; Peterzil–Starchenko 2013, Theorem 1.1
(Theorem 8.3 in the text), arXiv:1103.3110v1, p.2; Pila–Tsimerman 2014, Theorem 2.6, p.665.)

*Proof sketch.* Genus one: on F the q-expansion j=1/q+744+f(q) with |q|≤e^{−π√3} expresses j through
q=e^{−2πIm τ}(cos 2πRe τ+i sin 2πRe τ), where e^{−2πy} is definable using exp and cos, sin are
restricted to a bounded interval, while f is analytic on a closed disc. Siegel: Peterzil–Starchenko
prove that restricted theta functions are definable on F_g (their Theorem 1.3) and deduce the
statement for the theta embedding; the general form for arithmetic quotients, through a neat level
and the Baily–Borel compactification, is the definable comparison of ShimuraVarieties §3.6, which
specializes to A_g after passing to a neat level and taking the quotient by the finite group of
§0.1.

The API:

- `definableUniformization.genusOne`: j restricted to F is definable in R_an,exp.
- `definableUniformization.siegel`: The restriction of the projective embedding of Sp_{2g}(Z)\ℋ_g to
  a neighbourhood of F_g is definable in R_an,exp.
- `definableUniformization.preimage`: F_g∩J⁻¹(H) is definable for algebraic H.

*Needs:* §2.2; §0.6; §0.1; ShimuraVarieties §3.6 `TauCeti.Shimura.definable_target_comparison`;
ModularForms Layer 0 (the normalized `j`).

**Checks.**

- `definableUniformization.wholeHalfPlaneFails`: j on all of ℋ_1 is not definable in any o-minimal
  structure: {τ:j(τ)=1728} is the SL_2(Z)-orbit of i, an infinite discrete set.
- `definableUniformization.needsExp`: j|_F is not definable in R_an: j(iy) grows like e^{2πy},
  faster than any polynomial, and R_an is polynomially bounded.
- `definableUniformization.compactPiece`: On a compact semialgebraic subset K⊆ℋ_1, j is real
  analytic on a neighbourhood of K. A finite cover by boxes inside ℋ_1 expresses j|_K as
  finitely many restrictions of restricted analytic functions, so it is definable in R_an.
- `definableUniformization.cantorDomain`: Let C be the middle-thirds Cantor set in [0,1].
  The compact domain K={x+i:x∈C} is not definable in an o-minimal structure. A definable
  graph of j|_K would have definable projection K, and hence define C, contradicting
  o-minimality. Analyticity of j does not make restrictions to arbitrary compact domains
  definable.

### 2.6 Ax–Lindemann for the j-function on C²

Prove `ellipticAxLindemann`. Let f∈C[y₁,y₂] be absolutely irreducible, involve both variables, and
not define a modular curve Φ_m(y₁,y₂)=0. Then Z=F²∩(j×j)⁻¹(C_f), in the real coordinates of
ℋ_1×ℋ_1⊆R⁴, contains no connected positive-dimensional semialgebraic set: Z^alg=∅. This is the case
n=2 of the Ax–Lindemann theorem for j: if τ₁, τ₂ are nonconstant algebraic functions on an
irreducible complex curve and there is no relation τ₂=hτ₁ with h∈GL_2^+(Q), then j(τ₁) and j(τ₂) are
algebraically independent over C.

(Pila 2011, Theorem 1.6 and Definition 1.5, pp.1788–1789, and its form for maximal algebraic
subsets, Theorem 9.1, p.1821; MZ20 §3.2, p.650, which also cites Zannier 2012, Lemma 4.4, p.113.)

*Proof sketch.* A real semialgebraic arc in ℋ_1² has coordinates that are algebraic functions of a
real parameter, so its complex Zariski closure is a complex algebraic curve W. If the arc lies in Z,
then f(j(τ₁),j(τ₂)) vanishes on W∩ℋ_1² by analytic continuation. By Pila's theorem the coordinate
functions on W are then geodesically dependent: one of them is constant, so C_f contains a
horizontal or vertical line, or τ₂=hτ₁ with h∈GL_2^+(Q), so C_f is a modular curve Φ_m=0. Both are
excluded.

The API:

- `ellipticAxLindemann.algebraicIndependence`: The algebraic independence of j(τ₁), j(τ₂) for
  geodesically independent algebraic τ₁, τ₂.
- `ellipticAxLindemann.noArcs`: Z^alg=∅ for f as above.

*Needs:* §2.3; §2.5; ModularCurvesPartII node `R13.4a/modular-polynomial`; ModularForms Layer 0 (the
normalized `j`).

**Checks.**

- `ellipticAxLindemann.diagonal`: For f=y₁−y₂ (the curve Φ_1=0) Z contains the diagonal of F², an
  algebraic arc: excluding modular curves is necessary.
- `ellipticAxLindemann.horizontal`: For f=y₂−c, Z contains F×{τ_c} with j(τ_c)=c, a
  positive-dimensional semialgebraic set: f must involve both variables.
- `ellipticAxLindemann.imaginaryAxis`: f=y₁+y₂ is not modular (Φ_m is symmetric and has no factor
  y₁+y₂), so its Z has empty algebraic part; this is the curve of MZ20, p.648.

### 2.7 Weakly special subvarieties of A_g

Define `WeaklySpecial`. An irreducible algebraic subvariety S⊆A_g is weakly special if there are a
Shimura subdatum (G,X) of the Siegel datum, a decomposition (G^ad,X^ad)=(G₁,X₁)×(G₂,X₂) and a point
x₂∈X₂ such that S is the image in A_g of a connected component of X₁×{x₂}. Prove
`weaklySpecial_iff_biAlgebraic`: S is weakly special if and only if an irreducible component of
J⁻¹(S) is algebraic in ℋ_g⊆Sym_g(C). Points and A_g are weakly special, special subvarieties are
weakly special, and an irreducible component of an intersection of weakly special subvarieties is
weakly special.

(Appendix by Z. Gao to André–Corvaja–Zannier, arXiv:1802.03204v1, §10.2, Definition 10.2.2 and the
discussion before Lemma 10.2.4, pp.26–27, citing Pink 2005, Definition 4.1(b), and Ullmo–Yafaev
2011, Theorem 1.2; Pila–Tsimerman 2014, Lemma 2.1, Corollary 2.2 and Lemma 2.3, pp.663–664.)

*Construction.* The characterization is Ullmo–Yafaev's theorem (bi-algebraic subvarieties are
exactly the weakly special ones). For the intersection statement use the characterization: an
irreducible component of the preimage of an intersection is an irreducible component of an
intersection of algebraic sets. A weakly special subvariety is the image of an orbit G₀(R)⁺·Z₀ of a
semisimple Q-group without compact factors (Pila–Tsimerman 2014, Lemma 2.3).

The API:

- `WeaklySpecial.point`: Every point of A_g is weakly special.
- `WeaklySpecial.top`: A_g is weakly special.
- `WeaklySpecial.of_special`: Special subvarieties are weakly special.
- `weaklySpecial_iff_biAlgebraic`: The bi-algebraic characterization above.
- `WeaklySpecial.inter`: Irreducible components of intersections are weakly special.

*Needs:* ShimuraData nodes `D4/shimura-datum`, `D4/special-point` and `D5/siegel-datum`; §0.1.

**Checks.**

- `WeaklySpecial.genusOne`: For g=1 the weakly special subvarieties of A_1 are the points and A_1,
  since PSL_2 is simple.
- `WeaklySpecial.productFibre`: For g=2 the image of {E₀}×A_1 under the product map is weakly
  special, and it is special if and only if E₀ has complex multiplication.
- `WeaklySpecial.nonExample`: The image in A_2, under the product map, of the curve j₁+j₂=0 of
  A_1×A_1 is not weakly special: by §2.6 the corresponding set of block-diagonal period matrices
  contains no algebraic arc.

### 2.8 Ax–Lindemann for A_g

Prove `axLindemannAg`. Let V⊆A_g be an irreducible algebraic subvariety and W⊆J⁻¹(V) a connected
semialgebraic subset of ℋ_g that is irreducible for the real Zariski topology. Then there is a
weakly special subvariety S⊆V with W⊆J⁻¹(S). Equivalently, a maximal algebraic subvariety of J⁻¹(V)
is weakly special.

(Pila–Tsimerman 2014, Theorem 6.1, p.670, and Theorem 1.1, p.659.)

*Proof sketch.* Pila–Tsimerman argue by induction on dim V. A maximal semialgebraic W in J⁻¹(V) is
complex algebraic. The identity component G₀ of the Zariski closure of the monodromy group of V is
semisimple and its orbit gives the smallest weakly special subvariety containing V. The set of
γ∈G₀(R) with γW in J⁻¹(V) near the Siegel set is definable (§2.5) and contains at least T^η integral
points of height at most T, by a hyperbolic volume estimate; §2.4 then gives a positive-dimensional
semialgebraic family of such γ, and the induction concludes.

The API:

- `axLindemannAg.maximalAlgebraic`: Maximal algebraic subvarieties of J⁻¹(V) are weakly special.
- `axLindemannAg.semialgebraic`: The semialgebraic form stated above.

*Needs:* §2.7; §2.4; §2.5; §0.1.

**Checks.**

- `axLindemannAg.point`: If V is a point, J⁻¹(V) is discrete and every connected W in it is a point.
- `axLindemannAg.productFibre`: For g=2 and V the image of A_1×{E₀}, J⁻¹(V) contains the algebraic
  set of block-diagonal matrices diag(τ,τ₀), and V is weakly special, as the theorem requires.
- `axLindemannAg.noWeaklySpecial`: If V contains no positive-dimensional weakly special subvariety,
  J⁻¹(V) contains no positive-dimensional semialgebraic set.

### 2.9 Weakly special subvarieties through Hodge-generic points

Prove `weaklySpecial_hodgeGeneric`. A weakly special subvariety of A_g containing a point whose
Mumford–Tate group is GSp_{2g} is either that point or all of A_g. Equivalently, a Hodge-generic
point lies in no proper bi-algebraic subvariety of A_g of positive dimension.

(Appendix by Z. Gao to André–Corvaja–Zannier, arXiv:1802.03204v1, Lemma 10.2.6, implication
(ii)⇒(v), pp.27–28; MZ20 §5.1, p.663, which also cites Ullmo–Yafaev 2011, Theorem 1.2, p.264.)

*Proof sketch.* Write the component of the preimage through a lift s̃ of the point as X₁×{x̃₂} for a
subdatum (G,X) with G^ad=G₁×G₂. The smallest Shimura subdatum whose space contains s̃ is the whole
Siegel datum because MT(s̃)=GSp_{2g}, so (G,X) is the Siegel datum; its adjoint group PSp_{2g} is
simple, so the decomposition is trivial and the component is a point or ℋ_g.

The API:

- `weaklySpecial_hodgeGeneric.dichotomy`: The dichotomy stated above.
- `weaklySpecial_hodgeGeneric.simpleAdjoint`: PSp_{2g} is Q-simple, so the Siegel datum has no
  nontrivial product decomposition.

*Needs:* §2.7; ShimuraData nodes `D1/mumford-tate-group` and `D1/hodge-generic`.

**Checks.**

- `weaklySpecial_hodgeGeneric.productFibre`: For g=2 the weakly special image of {E₀}×A_1 contains
  no Hodge-generic point: its points are products, whose Mumford–Tate groups lie in a proper
  subgroup of GSp₄.
- `weaklySpecial_hodgeGeneric.jacobianLocus`: For g≥4 the closure of the Jacobian locus contains
  Hodge-generic points and is neither a point nor A_g, so it is not weakly special (MZ20, p.663).
- `weaklySpecial_hodgeGeneric.cmPoint`: A CM point is weakly special (a point) but not Hodge
  generic: its Mumford–Tate group is a torus.

### Examples

- The unit circle x²+y²=1 is semialgebraic, so it equals its algebraic part; its rational points of
  height at most T come from Pythagorean triples and their number grows linearly in T, which shows
  why the algebraic part has to be removed before the T^ε bound applies.
- H(3/4)=4 and the integer point (2,−7,5)∈Z³ has height 7.
- For the curve j₁+j₂=0 the set of pairs (τ,τ′)∈F² with j(τ)+j(τ′)=0 contains no semialgebraic arc,
  while for j₁−j₂=0 it contains the diagonal.

### Dependencies

Earlier layers: Layer 0. Other roadmaps: TauCetiRoadmap RealAlgebraicGeometry, ShimuraVarieties,
ModularForms, ModularCurvesPartII, ShimuraData.

## Layer 3: Elliptic matrices and isogeny-class counts

These estimates isolate the genus-one arithmetic needed both for the elliptic argument and for the
comparison of isogeny classes. A degree-m elliptic isogeny need not be cyclic; the matrix estimate
applies to it nonetheless. The subgroup count counts subgroups, not choices of generators.

### 3.1 Bounded integer matrix of an elliptic isogeny

Prove `ellipticMatrix`. If E, Ẽ are related by an isogeny of degree m and τ, τ̃ ∈ F satisfy j(τ) =
j(E), j(τ̃) = j(Ẽ), then τ̃ = (aτ + b)/(cτ + d) with a, b, c, d ∈ Z, ad − bc = m and
max{|a|, |b|, |c|, |d|} ≤ 2m^{3/2}.

(MZ20 §2 Lemma 2.1 p.643.)

*Proof sketch.* Use the lattice description of an isogeny: E has a lattice Zτ+Z and Ẽ a lattice
containing it with index m after rescaling, so τ̃=(aτ+b)/(cτ+d) with ad−bc=m. Then Im τ̃ = m Im
τ/|cτ+d|²; after possibly exchanging the two curves (which replaces the matrix by its adjugate) one
may assume Im τ ≤ Im τ̃. Treat c=0 and c≠0 separately and bound a,b,c,d using |Re τ|≤1/2 and Im
τ≥√3/2.

*Needs:* §0.6; ModularCurvesPartII node `R12.1/pointed-elliptic-uniformization`; ModularForms Layer
0 (the normalized `j`).

*Lean:* `ellipticMatrix_bound`.

### 3.2 Finite subgroups of a rational torus

Prove `finiteSubgroupCount`. For g≥1 there exists C_g>0 such that the number of finite subgroups
Γ⊆(Q/Z)^{2g} of order at most m is ≤C_g m^{2g} for every integer m≥1. For g=1 the bound m² suffices.

(MZ20 §2 p.644; §5.1 Lemma 5.1(b) p.658.)

*Proof sketch.* Classify finite subgroups by the corresponding finite-index superlattices of Z^{2g}.
Apply the exact Hermite-normal-form/subgroup count in Masser–Wüstholz Lemma 6.1; do not count
choices of generators as distinct subgroups.

*Needs:* Mathlib `AddSubgroup`, `AddCircle` and `Nat.card`.

*Lean:* `finiteSubgroupCount`, `finiteSubgroupCount_genusOne`.

For the scalar sums define `dedekindPsi m=m∏_{p|m}(1+1/p)` for m≥1, and set
ψ(0)=0. This is the cyclic correspondence degree of the imported modular polynomial,
not the count of all subgroups of order m. The API `dedekindPsi_le_sigma`,
`sum_dedekindPsi_le` and `sum_dedekindPsi_sq_le` bounds ψ(m) by σ(m),
Σ_{1≤m≤M}ψ(m) by M², and Σ_{1≤m≤M}ψ(m)² by CM³ log M for M≥2 and an absolute C.
(MZ20 §2, p.644, and §3.2, p.647.)

**Checks for ψ.**

- `dedekindPsi.zero`: ψ(0)=0 and ψ(1)=1, so the positive-degree convention is explicit.
- `dedekindPsi.squarePrime`: ψ(4)=6 whereas σ(4)=7; noncyclic kernels are not counted by ψ.
- `dedekindPsi.squarefree`: ψ(6)=12=σ(6), and ψ(p)=p+1 for a prime p.

### 3.3 Many elliptic isogeny classes

Prove `ellipticManyClasses`. For every integer N≥2, the curves E_j, j = n1 + in2 with 1 ≤ n1, n2 ≤
N, represent at least C_0^{-1} N²/(log N)⁴ isogeny classes, C_0 > 0 absolute.

(MZ20 §2 p.644.)

*Proof sketch.* For each isogeny class, connect all its E_{n1+in2} to a fixed representative over
Q(i) by an isogeny of degree ≪(log N)² using the quantitative elliptic estimate. Express each as a
quotient by a finite subgroup, then divide N² by the subgroup bound ≪(log N)^4.

*Needs:* §3.2; §1.2.

### Examples

- The subgroups of (Q/Z)² of order 2 are the three subgroups of order 2 of (½Z/Z)², matching σ(2)=3;
  the number of subgroups of order at most 3 is σ(1)+σ(2)+σ(3)=1+3+4=8≤3².
- For τ=i and the degree-2 isogeny τ̃=2i, the matrix (2,0;0,1) has entries at most 2≤2·2^{3/2}.
- The matrix (2,1;0,2) of determinant 4 sends τ=i to τ̃=i+1/2, both in F, and its entries are at
  most 2≤2·4^{3/2}=16.

### Dependencies

Earlier layers: Layer 0, Layer 1. Other roadmaps: ModularCurvesPartII.

## Layer 4: Elimination and elliptic real-curve avoidance

Elimination controls the small-degree isogenies, and definable blocks control the remaining Galois
conjugates. It is the projected periods that have empty algebraic part: the ambient
eight-dimensional matrix correspondence can have positive-dimensional fibres, so applying point
counting directly to the matrix set would give the wrong conclusion.

### 4.1 Elimination along two modular correspondences

Construct `eliminationPolynomial`. Fix a nonzero polynomial f∈ℂ[y₁,y₂]. One can choose a constant
c(f)>0 and, for each integer m≥1, a nonzero G_m∈ℂ[x₁,x₂] of total degree ≤c(f)ψ(m)². Every
simultaneous solution (ξ₁,ξ₂,η₁,η₂) of Φ_m(ξ₁,η₁)=0, Φ_m(ξ₂,η₂)=0 and f(η₁,η₂)=0 satisfies
G_m(ξ₁,ξ₂)=0.

(MZ20 §3.2 Lemma 3.1 pp.646–647.)

*Construction.* Handle constant f and f depending only on y_2 separately. Eliminate y_1 by a
resultant; if its output depends on y_2, eliminate y_2 by a second resultant. Use modular polynomial
irreducibility and the absence of the free x-variable in the other factor to prove nonzero; bound
each determinant degree.

The API:

- `eliminationPolynomial.nonzero`: For f≠0 and m≥1 the chosen G_m is nonzero.
- `eliminationPolynomial.vanishes`: A common solution of the two modular equations and f=0 maps to
  G_m=0.
- `eliminationPolynomial.degree`: deg G_m≤c(f)ψ(m)².
- `eliminationPolynomial.constant`: For nonzero constant f choose G_m=1.
- `eliminationPolynomial.resultantComparison`: Each elimination uses Polynomial.resultant at the
  fixed source degree bounds, with its specialization law.

*Needs:* Mathlib `Polynomial.resultant`; Mathlib `Polynomial.resultant_eq_zero_iff`;
ModularCurvesPartII node `R13.4a/modular-polynomial`.

**Checks.**

- `eliminationPolynomial.constantOne`: For f=1 there are no common solutions and G_m=1 works.
- `eliminationPolynomial.identityCorrespondence`: For m=1 and f(y1,y2)=y1−y2 one may choose
  G_1=x1−x2 up to a nonzero scalar.
- `eliminationPolynomial.zeroExcluded`: f=0 is excluded: a nonzero polynomial cannot vanish on every
  pair under the identity correspondence.

### 4.2 A quadratic modular-degree sum

Prove `psiSquareSum`. For ψ(m)=m∏_{p∣m}(1+1/p) and integers M≥2, ∑_{1≤m≤M}ψ(m)²≪M³ log M. The
companion bound is ∑_{m≤M}ψ(m)≤∑_{d≤M}d⌊M/d⌋≤M²; keeping the floor factor is necessary for the
divisor-sum argument.

(MZ20 §3.2 Lemma 3.2 p.647; §3.1 p.645.)

*Proof sketch.* Bound ψ(m) by the divisor sum σ_1(m), expand its square and interchange the finite
divisor sums. Use lcm(d,d′)=dd′/gcd(d,d′), write gcd=e and bound the remaining harmonic sum.

*Needs:* Mathlib `Nat.divisors`, `ArithmeticFunction.sigma` and `Real.log`.

*Lean:* `dedekindPsi`, `dedekindPsi_le_sigma`, `sum_dedekindPsi_le`, `sum_dedekindPsi_sq_le`.

### 4.3 Few small-isogeny elliptic candidates

Prove `smallIsogenyCandidates`. Fix a nonzero polynomial f∈Q̄[y1,y2] and the real algebraic curve
C={c∈C:f(c,c̄)=0}, with constants depending on f. Given integers M ≥ 2 and N ≥ 1, there are only ≪_f
N M³ log M pairs n = (n1, n2) with 1 ≤ n1, n2 ≤ N such that E_n (j = n1 + in2) is isogenous to its
complex conjugate or to some E_c with c ∈ C via an isogeny of degree at most M.

(MZ20 §3.2 Lemma 3.2 p.647.)

*Proof sketch.* Use the nonzero polynomials Φ_m(n1+in2,n1−in2) and G_m(n1+in2,n1−in2). The
invertible complex linear change of variables preserves nonzeroness; apply the polynomial grid
count. Sum their degree bounds over m≤M using the ψ-square sum.

*Needs:* §4.1; §4.2; Mathlib `MvPolynomial.schwartz_zippel_totalDegree`; ModularCurvesPartII node
`R13.4a/modular-polynomial`.

### 4.4 Large isogenies force large fields

Prove `ellipticLargeField`. For N sufficiently large depending on the fixed f, with M=floor((log
N)³)≥2, suppose E_n is isogenous to Ẽ=E_c with c∈C and n is outside the exceptions of §4.3 at this
M. If Ẽ has a model over a number field of degree at most D̃≥2, then there is an isogeny of degree
m̃≪D̃⁷ and log N≪D̃²(log D̃)². Constants depend only on the fixed curve.

(MZ20 §3.2 Lemma 3.3 p.648.)

*Proof sketch.* Choose M=floor((log N)³) and an n outside the small-isogeny exceptions. Apply the
quantitative elliptic isogeny bound over a compositum with Q(i), giving m̃≪D̃²(log D̃)²(log N)².
Compare M<m̃, absorb logarithms and derive m̃≪D̃^7 and log N≪D̃²(log D̃)².

*Needs:* §4.3; §1.2.

### 4.5 The paired elliptic period correspondence

Construct `ellipticDoubleCorrespondence`. For τ,τ′∈ℋ_1 and a non-modular absolutely irreducible
C_f⊆C², put Z=F_1²∩(j×j)⁻¹(C_f). Let W_{τ,τ′}⊆R^8 be the pairs of real 2×2 fractional-linear
matrices with both denominators nonzero and both outputs in Z. Its projection π sends a pair to
those two periods; no determinant=m restriction is part of the ambient definable family.

(MZ20 §3.2 (13)–(18) pp.649–650.)

*Construction.* Form the product of two instances of the period-matrix correspondence with a common
target condition Z. Apply the supplied restricted j definability and the rational fractional-linear
map to obtain a uniform definable family in R^8×R^4.

The API:

- `ellipticDoubleCorrespondence.mem_iff`: Membership requires both nonzero denominators and
  f(j(output1),j(output2))=0 with both outputs in F_1.
- `ellipticDoubleCorrespondence.projection`: π(X,X′) is the ordered pair of fractional-linear
  images.
- `ellipticDoubleCorrespondence.height`: The integral matrices arising from degree m isogenies have
  all eight entries at most 2m^{3/2}.
- `ellipticDoubleCorrespondence.productCompatibility`: The two outputs agree with the genus-one
  specialization of periodMatrixCorrespondence.

*Needs:* §3.1; §0.10; §0.6; ModularCurvesPartII node `R12.1/pointed-elliptic-uniformization`;
ModularForms Layer 0 (the normalized `j`); §2.5; §2.1.

**Checks.**

- `ellipticDoubleCorrespondence.identityPair`: For identity matrices membership is exactly (τ,τ′)∈Z.
- `ellipticDoubleCorrespondence.oneZeroDenominator`: A zero denominator in either factor excludes
  the pair even if the other factor is valid.
- `ellipticDoubleCorrespondence.pairedNeeded`: A single R^4 correspondence does not encode both
  conjugate modular equations used in this proof.

### 4.6 The non-modular elliptic image has no positive-dimensional blocks

Prove `ellipticBlockImages`. If C_f⊆C² is absolutely irreducible, involves both variables, and is
neither a modular correspondence nor vertical/horizontal, then Z=F_1²∩(j×j)⁻¹(C_f) has empty
algebraic part. Every connected Pila-block image under π is a point.

(MZ20 §3.2 p.650.)

*Proof sketch.* By §2.6, Z contains no real semialgebraic arc when C_f is neither modular nor a
horizontal or vertical line. A definable block of positive dimension is a union of connected
positive-dimensional semialgebraic sets, so it would contain such an arc; hence every block meeting
Z, and every image of a block under the projection, is zero-dimensional and connected, that is, a
point.

*Needs:* §4.5; §2.6; §2.3.

### 4.7 Bounded elliptic Galois degree

Prove `ellipticOrbitCollapse`. Outside the small-isogeny exceptional set, the paired periods of the
conjugates of c have cardinality ≫D̃ and lie among ≤C_ε T^ε point images with T≤2m̃^{3/2}. Hence
D̃≪m̃^{3ε/2}; choosing 0<ε<2/21 and m̃≪D̃^7 forces D̃≪1.

(MZ20 §3.2 pp.649–650.)

*Proof sketch.* Count embeddings fixing Q(i) and the coefficient field of f, with constants
absorbing those fixed degrees. Use the uniform block count with parameters τ,τ′, then compare the
orbit lower bound to T^ε. Since 21ε/2<1, divide the power inequality and obtain a bound independent
of n,N.

*Needs:* §4.6; §4.4; §2.4.

### 4.8 The modular real-curve case

Prove `ellipticModularCase`. If the real algebraic curve becomes a modular correspondence
Φ_m(j,j̄)=0, any E_n isogenous to a curve on it is isogenous to its own complex conjugate. The
number of such n is ≪N(log N)^7; the fixed m changes the implied constant.

(MZ20 §3.2 p.648.)

*Proof sketch.* Compose the isogeny with its conjugate and the fixed modular isogeny on the curve.
Apply the quantitative elliptic isogeny estimate between E_n and its conjugate over Q(i). Use
Lemma 3.2 with a degree bound ≪(log N)².

*Needs:* §4.3; §4.4; §1.2.

### 4.9 The elliptic real-curve avoidance theorem

Prove `ellipticAvoidance`. Given a real algebraic curve C in A_1(C) = R², there is C = C(C) such
that for every integer N ≥ 2 there are at most C N(log N)^{10} pairs of integers 1 ≤ n1, n2 ≤ N for
which E_j, j = n1 + in2, either has complex multiplication or is isogenous to some E_c with c ∈ C.

(MZ20 §1.2 Theorem 1.7 p.640; §3.2 pp.646–651.)

*Proof sketch.* Every curve point isogenous to the algebraic E_n has algebraic j. Apply §0.9 in C²
to the algebraic locus of pairs (c,c̄) to replace C by a curve defined by a nonzero polynomial over
Q̄, and treat its absolutely irreducible components one at a time: the modular components by §4.8
and the others by §4.7, after removing the exceptions of §4.3. CM points are counted with the curves
isogenous to their conjugates.

*Needs:* §4.7; §4.8; §4.3; §0.9; §4.4.

### 4.10 Exceptional horizontal offsets

Prove `oneParameterObstruction`. Let d≥1 bound each variable degree of f. For n0≠0, if
G_m(x+in0,x−in0) is identically zero, the modular function-field argument forces ψ(m)≤d. For each
such m at most 2dψ(m)² integer offsets are exceptional.

(MZ20 §3.3 p.651.)

*Proof sketch.* Use the disjoint finite branch loci of the two modular extensions at ±in0 and
1728±in0 to prove linear disjointness over C(x). Compare the compositum degree ψ(m)² with the
f-relation bound dψ(m). Treat the line offset as a variable in the nonzero elimination polynomial
and bound identically vanishing specializations.

*Needs:* §4.1; ModularCurvesPartII node `R13.4a/modular-polynomial`.

### 4.11 A corrected polynomial bound for a one-parameter offset

Prove `oneParameterOffset`. With the variable-degree bound d≥1 and obstruction in §4.10, there is an
integer 1≤n₀≤2d⁴+1 such that every specialization G_m(x+in₀,x−in₀) is nonzero. The elementary proof
uses ψ(m)≥m, hence m≤d, and sums at most 2dψ(m)²≤2d³ forbidden offsets for each of at most d
degrees. The sharper bound 2d³+1 and a quantitative exceptional-count theorem on the selected
horizontal line are additional problems; they are not consequences of this union bound.

(MZ20 §3.3 p.651.)

*Proof sketch.* Only m≤d can satisfy ψ(m)≤d. Take the union of all exceptional offset sets and bound
it by ∑_{ψ(m)≤d}2dψ(m)²≤2d^4. Choose a positive integer outside that finite union.

*Needs:* §4.10.

### Examples

- ψ(6)=6·(3/2)·(4/3)=12=σ(6), ψ(4)=6<σ(4)=7, and ψ(p)=p+1 for a prime p.
- For C the real axis, f(y₁,y₂)=y₁−y₂ and G_1(x₁,x₂)=x₁−x₂, so G_1(x+in₀,x−in₀)=2in₀ vanishes
  identically exactly for n₀=0: the offset n₀=0 is excluded (MZ20 §3.3, p.651).
- For the imaginary axis, f(y₁,y₂)=y₁+y₂ is not a modular relation, so a generic curve E_c on it is
  not isogenous to its complex conjugate.

### Dependencies

Earlier layers: Layer 0, Layer 1, Layer 2, Layer 3. Other roadmaps: ModularCurvesPartII.

## Layer 5: Rosati geometry and controlled period matrices

The rational Rosati form is the Euclidean form on the endomorphism lattice; its integral Gram
determinant fixes the covolume used in Minkowski's theorem. The four entry estimates have the same
period-domain hypotheses, and their different powers of the diagonal entries matter when the product
period is not classically reduced.

### 5.1 The corrected rational Rosati trace

Prove `rationalAnalyticTrace`. For a principally polarized complex A of dimension g≥1, a symplectic
integral homology basis with polarization matrix ε and period τ=x+iy∈ℋ_g, and endomorphisms v,w, the
rational Rosati Gram entry tr_Q(ρ(v)ερ(w)^tε⁻¹) equals 2 Re tr_C(κ(v)yκ(w)̄^t y⁻¹). In particular
ℓ(v)² is the rational expression and is twice the complex self-expression. D(A) is the determinant
of the real rational Gram matrix, never of the complex Hermitian matrix.

(MZ20 §4 (21)–(22) p.653 and discriminant display p.655.)

*Proof sketch.* Identify the complexification of the rational representation with κ⊕κ̄. Take the sum
of the conjugate traces and use the source Rosati adjoint formula; pin ℓ to the rational trace.

*Needs:* AbelianSchemesAndArithmeticModuli §A3.9 `Polarization.rosati`;
AbelianSchemesAndArithmeticModuli §A6.14 `rosatiPositivity`; AbelianSchemesAndArithmeticModuli
§A6.11 `charpolyTate`; AbelianSchemesAndArithmeticModuli §A5.1 `AbelianLattice`, §A5.4
`polarizationType` and §A5.8 `SiegelFamily`.

*Lean:* `epsilon`, `periodRow`, `IsAnalyticRep`, `rosatiSq`, `rationalAnalyticTrace`.

The light matrix definitions pin ε=(0,−I;I,0), the row (I,τ), compatibility
κ(I,τ)=(I,τ)ρ, and the square length tr(ρ ε ρ^t ε^t). The analytic comparison theorem
is asserted only under that compatibility and τ∈ℋ_g.

Their APIs are `epsilon_eq_J`, `epsilon_sq` and `epsilon_transpose` for the alternating
matrix; `periodRow.leftBlock` and `periodRow.rightBlock` for the row's two blocks;
`IsAnalyticRep.mem_iff`, `IsAnalyticRep.zero`, `IsAnalyticRep.scalar` and
`IsAnalyticRep.mul` for compatibility; and `rosatiSq.zero`, `rosatiSq.scalar` and
`rationalAnalyticTrace` for square length. Positivity of square length requires
compatibility at a Siegel point; it is not asserted for arbitrary real matrices.

**Checks for the alternating matrix and period row.**

- `epsilon.genusOne`: ε=[[0,−1],[1,0]], with ε²=−I₂ and ε^t=−ε.
- `epsilon.libraryConvention`: On Fin g⊕Fin g, ε is Mathlib's `Matrix.J (Fin g) R`;
  its upper-right block is −I, distinguishing the opposite alternating convention.
- `epsilon.empty`: At g=0, ε is the unique empty matrix and its determinant is 1.
- `periodRow.ellipticI`: At τ=i the row is [1,i], rather than [i,1].
- `periodRow.zero`: At the zero genus-one matrix the row is [1,0], rather than zero.
- `periodRow.empty`: At g=0 the row has no entries; no scalar first column is added.

**Checks for the rational trace and compatibility.**

- `rationalAnalyticTrace.identity`: In genus one, τ=i, ρ=I₂ and κ=1 satisfy
  compatibility; the rational square length is 2 and the analytic trace is 1.
- `rationalAnalyticTrace.zero`: With ρ=0 and κ=0, compatibility holds and both
  expressions vanish.
- `IsAnalyticRep.nonExample`: At τ=i, κ=0 and ρ=I₂ fail compatibility since the
  first column of κ(I,i) is zero and that of (I,i)ρ is 1.
- `epsilon.sign`: In genus one ε=[[0,−1],[1,0]], ε²=−I₂ and ε⁻¹=ε^t=−ε.
  Substituting ε for ε⁻¹ gives square length −2 at ρ=I₂ and fails positivity.

### 5.2 Submultiplicativity and integrality of the Rosati length

Prove `rosatiLength_mul_le`. For endomorphisms v, w of a principally polarized complex abelian
variety A of dimension g, with the length ℓ of §5.1, ℓ(vw)≤ℓ(v)ℓ(w). Moreover ℓ(v)² is a nonnegative
integer, ℓ(v)≥1 for v≠0, and ℓ([n])=√(2g)|n| for n∈Z.

(MZ20 §4, (22), p.653, and p.656, citing Masser–Wüstholz 1994, Lemma 2.2, p.644.)

*Proof sketch.* By §5.1, ℓ(v)²=2‖y^{−1/2}κ(v)y^{1/2}‖² for the Frobenius norm, and κ(vw)=κ(v)κ(w),
so the Frobenius norm inequality ‖MN‖≤‖M‖‖N‖ gives ℓ(vw)²≤ℓ(v)²ℓ(w)²/2. The rational expression
tr(ρ(v)ερ(v)^tε⁻¹) is an integer because ρ(v) and ε are integral, and it is positive for v≠0 by
positivity of the Rosati form. For v=[n], ρ=nI_{2g} gives ℓ²=2gn².

The API:

- `rosatiLength_mul_le`: ℓ(vw)≤ℓ(v)ℓ(w).
- `rosatiLength_sq_nat`: ℓ(v)² is a nonnegative integer, positive for v≠0.
- `rosatiLength_intCast`: ℓ([n])=√(2g)|n|.

*Needs:* §5.1; AbelianSchemesAndArithmeticModuli §A6.14 `rosatiPositivity`.

*Lean:* `rosatiSq_mul_le`.

**Checks.**

- `rosatiLength.scalarStrict`: ℓ([n][m])=√(2g)|nm|<2g|nm|=ℓ([n])ℓ([m]) for nm≠0: submultiplicativity
  is not an equality.
- `rosatiLength.zero`: ℓ(0)=0.
- `rosatiLength.ellipticCM`: For an elliptic curve and v in an imaginary quadratic order,
  ℓ(v)²=Tr(vv̄)=2|v|².

### 5.3 The degree is bounded by a power of the Rosati length

Prove `degree_le_rosatiLength_pow`. For an endomorphism v of a principally polarized complex abelian
variety of dimension g, deg v≤(ℓ(v)²/(2g))^g≤ℓ(v)^{2g}, where deg v=|det ρ(v)| (zero when v is not
an isogeny). For the product A×Ã of dimension 2g this gives deg v≤ℓ(v)^{4g}, the inequality (31) of
MZ20.

(MZ20 §4, (31), p.656, citing Masser–Wüstholz 1994, Lemma 2.3, p.644.)

*Proof sketch.* The complexified rational representation is κ⊕κ̄, so |det ρ(v)|=|det
κ(v)|²=|det(y^{−1/2}κ(v)y^{1/2})|². The arithmetic–geometric mean inequality for the squared
singular values of M=y^{−1/2}κy^{1/2} gives |det M|^{2/g}≤‖M‖²/g=ℓ²/(2g).

The API:

- `degree_le_rosatiLength_pow`: deg v≤ℓ(v)^{2g}.
- `degree_le_rosatiLength_pow_amgm`: deg v≤(ℓ(v)²/(2g))^g.

*Needs:* §5.1; AbelianSchemesAndArithmeticModuli §A6.6 `degreePolynomial`.

*Lean:* `abs_det_le_rosatiSq_pow`.

**Checks.**

- `rosatiLengthDegree.scalar`: For v=[n], deg v=n^{2g} and (ℓ²/(2g))^g=n^{2g}: the sharper bound is
  an equality on scalars.
- `rosatiLengthDegree.ellipticCM`: For g=1 and v in an imaginary quadratic order, deg v=|v|² and
  ℓ(v)²/2=|v|².
- `rosatiLengthDegree.nonIsogeny`: For a projection v of a product onto one factor, deg v=0 while
  ℓ(v)>0.

### 5.4 Lower-left period-matrix entry bounds

Prove `entryCBounds`. Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A
in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI
and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be
the rational Rosati length of §5.1. Then |c_ij|≤C(g,δ)ℓ(v)/√(y_i y_j).

(MZ20 §4 Lemma 4.1 pp.654–655.)

*Proof sketch.* Expand the corrected complex Rosati self-trace into the two nonnegative terms
tr((a−xc)y(a−xc)^t y⁻¹) and tr(ycyc^t). Use y≥δ y^(0) twice and positivity of trace products to
dominate δ²∑c_ij² y_i y_j.

*Needs:* §5.1; §0.8.

*Lean:* `entry_c_bound`.

### 5.5 Upper-left period-matrix entry bounds

Prove `entryABounds`. Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A
in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI
and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be
the rational Rosati length of §5.1. Then |a_ij|≤C(g,δ)√(y_i/y_j)ℓ(v).

(MZ20 §4 Lemma 4.1 p.654.)

*Proof sketch.* Use the inverse-order inequality y⁻¹≥δ(y^(0))⁻¹ to bound a−xc from its trace term.
Recover a=(a−xc)+xc using |x_ij|≤δ⁻¹ and y_i≥δ.

*Needs:* §5.4; §5.1.

### 5.6 Lower-right period-matrix entry bounds

Prove `entryDBounds`. Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A
in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI
and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be
the rational Rosati length of §5.1. Then |d_ij|≤C(g,δ)√(y_j/y_i)ℓ(v).

(MZ20 §4 Lemma 4.1 pp.654–655.)

*Proof sketch.* Use κ=a−τc and κτ=−b+τd to bound yd entrywise. Multiply by y⁻¹, using its diagonal
comparison, to recover the claimed d-bound.

*Needs:* §5.4; §5.5.

### 5.7 Upper-right period-matrix entry bounds

Prove `entryBBounds`. Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A
in a symplectic integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI
and |x_ij|≤δ⁻¹. For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be
the rational Rosati length of §5.1. Then |b_ij|≤C(g,δ)√(y_i y_j)ℓ(v).

(MZ20 §4 Lemma 4.1 pp.654–655.)

*Proof sketch.* Bound κτ, hence b−xd, and recover b from the bounds already obtained for d and x.
The finite sums over matrix entries are absorbed into C(g,δ), together with the factor two of the
rational normalization (§5.1).

*Needs:* §5.6; §5.5.

### 5.8 Off-diagonal endomorphism extraction

Construct `offDiagonal`. For B=A×Ã let e,ẽ be the two factor projections as endomorphisms. The
additive Z-linear operator v↦v#=e v ẽ+ẽ v e sends a block Hom matrix to (α,α̃)↦(f̃(α̃),f(α)), with
zero diagonal blocks. Its Rosati length is ≤C_gℓ(v).

(MZ20 §4 (26)–(28) pp.655–656.)

*Construction.* Use the product projections and inclusions to split the Hom groups. Discard the two
diagonal blocks and apply the triangle/submultiplicativity length bounds to e v ẽ and ẽ v e.

The API:

- `offDiagonal.apply`: offDiagonal(v)(α,α̃)=(f̃(α̃),f(α)) in the source block decomposition.
- `offDiagonal.add`: offDiagonal(v+w)=offDiagonal(v)+offDiagonal(w).
- `offDiagonal.idempotent`: offDiagonal(offDiagonal(v))=offDiagonal(v).
- `offDiagonal.homComparison`: The two off-diagonal entries are exactly the product-Hom projections
  and not chosen maps.

*Needs:* AbelianSchemesAndArithmeticModuli §A6.7 `homFreeFinite`; §5.1; §5.2.

**Checks.**

- `offDiagonal.identityZero`: offDiagonal(id_{A×Ã})=0.
- `offDiagonal.alreadyOffDiagonal`: A block matrix with zero diagonal is unchanged.
- `offDiagonal.sameFactorEndomorphism`: An endomorphism acting only on A is sent to zero, not
  preserved.

### 5.9 A short independent endomorphism family

Prove `shortIndependentFamily`. For E=End(A×Ã) of rank r≤(4g)² and rational Rosati discriminant D,
there are Z-linearly independent v_1,…,v_r with ∏ℓ(v_i)≤C_g√D. Each nonzero integral endomorphism
has ℓ≥1, hence max_iℓ(v_i)≤C_g√D.

(MZ20 §4 (29) p.656.)

*Proof sketch.* Use the Rosati form to identify the endomorphism lattice with a full Euclidean
integral lattice with determinant D. For its squared minima λ_i, the imported independent
witnesses have ℓ(v_i)=√λ_i. Taking square roots of ∏λ_i≤γ_r^r D gives the required product;
the finitely many ranks 1≤r≤16g² give a constant depending only on g.

*Needs:* §5.1; AbelianSchemesAndArithmeticModuli §A6.7 `homFreeFinite`; the
positive-definite integral-lattice covolume and squared-minimum contracts stated under
prerequisites and boundaries.

### 5.10 A controlled-length off-diagonal isogeny

Prove `controlledLengthIsogeny`. There is c = c(g) such that for isogenous principally polarized A,
Ã of dimension g there are isogenies f : A → Ã and f̃ : Ã → A such that v(α, α̃) = (f̃(α̃), f(α)) on
A × Ã has ℓ(v) ≤ c D(A × Ã)^{1/2}; consequently (deg f)(deg f̃) = deg v ≤ ℓ(v)^{4g} (31).

(MZ20 §4 Lemma 4.2 and (30)–(31) pp.655–656.)

*Proof sketch.* The degree of ∑m_i v_i# is a homogeneous polynomial of degree 4g in the m_i (§5.3
applied to the degree function of AbelianSchemesAndArithmeticModuli §A6.6); it is not identically
zero because a pair of isogenies f, f̃ gives an off-diagonal element of nonzero degree. The grid
vanishing criterion finds m_i∈{0,…,4g} with nonzero degree. Bound the length of that combination by
the short independent family of §5.9 and the extraction bound of §5.8, then apply deg v≤ℓ(v)^{4g}.

*Needs:* §5.9; §5.8; AbelianSchemesAndArithmeticModuli §A6.6 `degreePolynomial`; Mathlib
`MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`; §5.3.

### 5.11 Imaginary periods bounded by Faltings height

Prove `periodHeight`. Given g ≥ 1 and 0 < δ ≤ 1 there is C = C(g, δ) such that if τ = x + iy∈ℋ_g
represents principally polarized A in a symplectic integral basis, defined over a number field of
degree at most D, satisfies y ≥ δy^{(0)} and y^{(0)} ≥ δι, then y_i ≤ C D max{1, h(A)} for i = 1, …,
g.

(MZ20 §4 Lemma 4.3 pp.656–657.)

*Proof sketch.* Choose a member ϕ_k of the finite family of cusp forms of §1.5 that does not vanish
at τ. That target bounds log max{1,|ϕ_k(τ)|⁻¹} by C D max{1,h(A)}. On the other hand the Fourier
expansion of a cusp form (§0.11) gives |ϕ_k(τ)|≤M exp(−2πc tr(y)) under the weakened hypotheses
y≥δy^(0), y^(0)≥δι (Igusa, Lemma 20, p.104, as used in MZ20, p.657). Comparing the two bounds
controls tr(y), hence every y_i.

*Needs:* §0.8; FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`; §1.5; §0.11.

### 5.12 Invertibility of the fractional-linear denominator

Prove `denominatorInvertible`. For complex square matrices a,b,c,d,τ,η of size g, if
det(a,−b;−c,d)≠0 and η(cτ+d)=aτ+b, then det(cτ+d)≠0 and η=(aτ+b)(cτ+d)⁻¹. The block matrix is
Matrix.fromBlocks a (−b) (−c) d; no polarization-preserving hypothesis is used.

(MZ20 §5.1 (39)–(42) p.661.)

*Proof sketch.* If (cτ+d)p=0 for a nonzero vector p, the displayed relation gives (aτ+b)p=0. The
block matrix kills (−τp,p), contradicting its nonzero determinant. Multiply the relation on the
right by the nonsingular inverse.

*Needs:* Mathlib `Matrix.fromBlocks`; Mathlib `Matrix.det_mul`; Mathlib `Matrix.mul_nonsing_inv`.

*Lean:* `denominator_invertible`.

### Examples

- For v=[n] on a g-dimensional A, ρ(v)=nI_{2g}, ℓ(v)²=2gn² and deg v=n^{2g}=(ℓ(v)²/(2g))^g.
- For A=E² with End(E)=Z the matrix units of M₂(Z) are orthogonal of squared length 2, so D(A)=16
  and the successive minima are all √2.
- For g=1, τ=i and v=[i] on the curve with complex multiplication by Z[i], κ(v)=i and
  ρ(v)=(0,−1;1,0) in the basis (1,i), so ℓ(v)²=tr(ρερ^tε⁻¹)=2=2|i|² and deg v=det ρ(v)=1.

### Dependencies

Earlier layers: Layer 0, Layer 1. Other roadmaps: AbelianSchemesAndArithmeticModuli,
FaltingsFinitenessAndIsogenyTheorems; the integral-lattice contracts stated above.

## Layer 6: Galois genericity and arithmetic specialization

The arithmetic specialization argument supplies the genericity hypotheses used by the block
argument. Geometric endomorphism ring Z, open p-adic image, adelic genericity and Hodge genericity
are different conditions, connected only by the stated implications; the dimension restriction in
Serre's theorem survives every later application.

### 6.1 Isogeny and conjugation invariance of p-genericity

Prove `pGenericIsogeny`. For a number-field principally polarized A of dimension g and a prime p,
openness of its p-adic division-field image in GSp_{2g}(Z_p) is invariant under geometric isogeny
and Galois conjugation. Extend fields to define the isogeny, use finite-index restrictions, and
compare integral lattices up to commensurability; do not assert equality of integral images.

(MZ20 §5.1 pp.658 and 663.)

*Proof sketch.* Apply the Tate-module isogeny comparison over Q_p and the Weil pairing. Restrict to
a finite extension and compare commensurable Z_p lattices; openness is unchanged by finite-index
restriction. Transport the representation under Galois conjugation.

*Needs:* ArithmeticGaloisRepresentations §6.1 `tateModule_functoriality` and §6.2
`weilPairing_galois`; AbelianSchemesAndArithmeticModuli §A3.1 `IsAbelianIsogeny`.

### 6.2 Cadoret: p-genericity implies Galois genericity

Prove `pToAdelic`. For a principally polarized abelian variety of positive dimension over a number
field, p-Galois genericity for a single prime p implies the Galois-generic property in Pink’s
convention, using the precise adelic open-image theorem of Cadoret. No Mumford–Tate conjecture is
assumed.

(MZ20 §5.1 p.658; Cadoret [5] Theorem 1.2.)

*Proof sketch.* Identify p-Galois genericity with the openness of the image of the p-adic Tate
representation in GSp_{2g}(Z_p), then apply Cadoret's open adelic image theorem (Cadoret 2015,
Theorem 1.2), whose hypotheses (a number field and an abelian variety, with the monodromy condition
supplied by the open p-adic image) are those stated.

*Needs:* ArithmeticGaloisRepresentations §6.1 `tateModule_functoriality` and §6.2
`weilPairing_galois`; FaltingsFinitenessAndIsogenyTheorems §R28.4.5 `tate_end_iso`.

### 6.3 Pink: Galois genericity implies Hodge genericity

Prove `galoisToHodge`. For a principally polarized number-field A, Galois genericity implies
MT(H_1(A,Q))=GSp_{2g}, hence Hodge genericity of its A_g-point. The implication uses the
absolute-Hodge theorem for abelian varieties; End(A)=Z alone is not a substitute.

(MZ20 §1.2 p.637; §5.1 pp.657,663; Pink [36] p.274.)

*Proof sketch.* Compare absolute Hodge tensors with invariant tensors of the ℓ-adic representation
using Deligne’s absolute-Hodge theorem. A full generic Galois group excludes additional defining
tensors of a proper Mumford–Tate subgroup; use Pink’s exact argument and the Siegel dictionary.

**Gap.** The listed ShimuraData targets define Mumford–Tate groups and genericity, but do not
supply Deligne's absolute-Hodge theorem for abelian varieties or its comparison with Galois
invariant tensors. This key theorem and its comparison hypotheses need an exact owner contract
before the implication has a closed prerequisite chain.

*Needs:* §6.2; ShimuraData nodes `D1/mumford-tate-group` and `D1/hodge-generic`; ShimuraData node
`D5/siegel-datum`.

### 6.4 Serre open image in the permitted dimensions

Prove `serreOpenImage`. Let A be a dimension-g principally polarized abelian variety over a number
field, with geometric End(A)=Z. If g is odd or g∈{2,6}, A is p-Galois generic for every prime p. No
corresponding inference is made for g=4.

(MZ20 §5.1 Lemma 5.1(c) p.658; Serre [39] p.35.)

*Proof sketch.* Use Faltings semisimplicity and the endomorphism comparison as the representation
input. Apply Serre’s dimension-specific group argument at its original statement, keeping geometric
endomorphisms and the symplectic-similitude condition.

*Needs:* ArithmeticGaloisRepresentations §6.1 `tateModule_functoriality` and §6.2
`weilPairing_galois`; FaltingsFinitenessAndIsogenyTheorems §R28.4.5 `tate_end_iso`.

### 6.5 Open arithmetic monodromy of the universal family

Prove `universalOpenMonodromy`. For generic x of A^G and A_x in the projection of Ψ^{-1}(x), defined
over a finite extension k_x of Q(x), the Galois group of k_x(A_x[p^∞])/k_x contains an open subgroup
of Sp_{2g}(Z_p) (Deligne, Hodge II, Lemma 4.4.16), and is therefore open in GSp_{2g}(Z_p) by the
Weil pairing.

(MZ20 §5.1 p.659; Deligne [10] Lemma 4.4.16.)

*Proof sketch.* Pull back the fine-level universal family to the generically finite cover of the
rational parameter space. Use Deligne Hodge II Lemma 4.4.16 for open symplectic geometric monodromy;
finite covers retain openness. Use the Weil pairing and the infinite cyclotomic determinant over the
number-field function field to obtain an open similitude image.

*Needs:* PELModuli §M2.9 `PELModuli.universal` and §M5.2 `siegelModuli`; PELModuli §M6.5
`coarseModuli`; AbelianSchemesAndArithmeticModuli §A5.1 `AbelianLattice`, §A5.4 `polarizationType`
and §A5.8 `SiegelFamily`; ArithmeticGaloisRepresentations §6.1 `tateModule_functoriality` and §6.2
`weilPairing_galois`.

### 6.6 Few endomorphism-specialization exceptions

Prove `endomorphismSpecialization`. For the fixed arithmetic finite cover π:Ã⇢A_g and dominant
generically finite parameter map Ψ:Ã⇢A^G used in the candidate setup, take the associated polarized
family on a specified common regular finite-fibre domain, with generic geometric endomorphism ring
Z. For every N≥2, the number of integral n∈[1,N]^G for which some regular projected fibre has
geometric End≠Z is ≪N^{G−1}(log N)^µ, µ=µ(g), with constants depending on the fixed family. The
fixed algebraic bad locus contributes O(N^{G−1}) separately. This is the source-scoped application
of Masser [23], not an assertion for an arbitrary complex family.

(MZ20 §5.1 p.658; Masser [23] main theorem.)

*Proof sketch.* Spread the family over a common open in A^G with generic geometric End=Z. Apply
Masser’s main specialization theorem with its exact polarization/height and parameter hypotheses;
include the excluded algebraic locus in the grid count.

*Needs:* PELModuli §M6.5 `coarseModuli`; AbelianSchemesAndArithmeticModuli §A6.7 `homFreeFinite`.

### 6.7 Full p-adic image from a finite Frattini quotient

Prove `frattiniSpecialization`. For the open compact p-adic image G of the universal family, its
Frattini subgroup Φ(G) is open. A specialized closed subgroup G_y with full image in G/Φ(G) equals
G. Hilbert irreducibility excludes a thin set so that this full image holds outside it.

(MZ20 §5.1 p.659.)

*Proof sketch.* Pass to the finite extension fixed by Φ(G), retaining the number-field constant
field and branch-locus exception. Apply Hilbert irreducibility to realize the full finite quotient,
then use the Frattini property G_yΦ(G)=G⇒G_y=G. Intersect the thin set over the constant number
field with Q^G using Serre’s restriction result.

*Needs:* §6.5; InverseGaloisAndArithmeticFundamentalGroups §IG.2.4 `IsHilbertian` and §IG.2.6
(full-group specialization).

### 6.8 The genericity exceptional-set bound

Prove `genericityGridCount`. For the fixed finite cover and generically finite parameter map, at
most C[N^{G−1}(log N)^μ+N^{G−1/2}log N] integral n∈[1,N]^G have a projected fibre point which is not
p-Galois generic, with fixed p and N≥2. If g is odd or g∈{2,6}, omit the half-saving term.

(MZ20 §5.1 (32) pp.658–659.)

*Proof sketch.* For the general case apply Cohen’s quantitative count to the thin set from the
Frattini specialization and bound its fixed algebraic exception by the polynomial grid theorem. In
the permitted dimensions use the stronger endomorphism-specialization count and Serre’s open-image
theorem.

*Needs:* §6.7; §6.6; §6.4; Mathlib `MvPolynomial.schwartz_zippel_totalDegree`;
InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 (the integral thin-set count).

### Examples

- Serre's theorem applies for g∈{1,2,3,5,6,7,9,…} (g odd or g=2,6) and not for g=4, which is why the
  half-saving term N^{G−1/2}log N stays in the genus-four count.
- p=2 is allowed: 2-Galois genericity means that the image of Galois on the 2-adic Tate module is
  open in GSp_{2g}(Z₂).
- A CM abelian variety has geometric endomorphism ring larger than Z and abelian Galois image, so it
  is neither p-Galois generic nor Hodge generic: after a finite extension its Galois image is
  abelian.

### Dependencies

Other roadmaps: ArithmeticGaloisRepresentations, AbelianSchemesAndArithmeticModuli,
FaltingsFinitenessAndIsogenyTheorems, ShimuraData, PELModuli,
InverseGaloisAndArithmeticFundamentalGroups.

## Layer 7: Candidate families and large-isogeny estimates

Fix the arithmetic cover, its parameter map, the hypersurface and a prime p before choosing a box
size N or a cutoff M. Every exceptional event is existential over the regular fibre: a box point is
bad if some projected point is bad. The fixed algebraic locus where a rational map is undefined or a
fibre is not finite is removed first.

### 7.1 Fields of regular finite fibres

Prove `fibreFieldBound`. Let π:Ã⇢A_g and Ψ:Ã⇢A^G be dominant generically finite rational maps over
number fields F̃,F_Ψ, with degree D_Ψ for Ψ. Outside a fixed algebraic exceptional locus, every
projected fibre point over an integral n has a field of definition of degree ≤D=[F̃:Q][F_Ψ:Q]D_Ψ in
the source’s moduli/model interpretation. Indeterminacy, nonfinite fibres and model descent are
separate hypotheses.

(MZ20 §1.2 (1) p.638; Lemma 5.1(a) p.658.)

*Proof sketch.* Restrict the rational maps to a common open where the fibres have controlled finite
degree. Bound residue degrees by D_Ψ over the map’s coefficient field, then form the compositum with
F̃. Verify the arithmetic model interpretation separately rather than identifying a coarse residue
field with a polarized model field.

*Needs:* PELModuli §M2.9 `PELModuli.universal` and §M5.2 `siegelModuli`; PELModuli §M6.5
`coarseModuli`; SchemeAndStackFoundations node `SF.0/algebraic-scheme-dimension`.

### 7.2 A bounded model field over the moduli field

Prove `boundedModelModuli`. For a principally polarized abelian variety Ã over Q̄ with moduli point
x ∈ A_g(Q̄) and field of moduli Q(x), there is a field of definition K̃ ⊇ Q(x) of Ã with [K̃ : Q(x)]
≤ c(g): lift x to the fine moduli space A_{g,3} of principally polarized abelian varieties with full
level-3 structure and take the residue field of the lift.

(Tsimerman 2018, Lemma 4.1, p.384, for polarized level-3 rigidification;
MZ20 §5.1, p.663, for the use of bounded model/moduli degree in counting.)

*Proof sketch.* Lift the coarse moduli point to a full level-3 cover and choose a geometric point
above it. Track the fixed-pairing cyclotomic component or use a similitude level over Q; bound the
residue degree by the fixed finite forgetful degree depending only on g. Pull back the universal
polarized abelian scheme to this residue field; compare [K̃:Q] and [Q(x):Q] in both directions.

*Needs:* PELModuli §M2.9 `PELModuli.universal` and §M5.2 `siegelModuli`; PELModuli §M6.5
`coarseModuli`; AbelianSchemesAndArithmeticModuli §A3.8 `FullLevel`.

### 7.3 Reverse a small isogeny by principal duality

Prove `dualSmallIsogenyCorrespondence`. For principally polarized A,Ã and an isogeny f:A→Ã of degree
m, identify the dual isogeny Ã∨→A∨ with an isogeny Ã→A of the same degree m using the principal
polarizations. Thus A≅Ã/ker(f∨), without requiring f to preserve the polarizations.

(MZ20 §5.1 Lemma 5.1(b) p.658.)

*Proof sketch.* Use duality and the equality deg(f∨)=deg f. Apply the quotient universal property
after the principal identifications to obtain A as the quotient of Ã by an order-m subgroup.

*Needs:* AbelianSchemesAndArithmeticModuli §A3.3 `AbelianQuotient` and §A3.5
`dualIsogenyCartierKernel`; §3.2.

### 7.4 Small-isogeny hypersurface images

Prove `smallIsogenyHypersurfaces`. Fix an algebraic hypersurface H⊂A_g and integer M≥1. The points A
with geometric End(A)=ℤ that are connected to H by an unpolarized isogeny of degree at most M lie in
an algebraic hypersurface of degree at most C M^{2g} in the fixed parameter model. The constant
depends on H, the cover, parameter map and embedding, and is independent of M and N. This target
requires the correspondence-degree estimate as well as the subgroup count. End(A)=ℤ is needed to
control the principal polarizations; all other points are included in the separate genericity
exceptional set.

(MZ20 §5.1 Lemma 5.1(b) p.658.)

*Proof sketch.* If End(A)=Z then every isogenous B has geometric End(B)=Z, so Hom(B,B∨)≅Z and B
carries at most one principal polarization; quotient counting therefore loses no polarization
choices. Hodge genericity implies End=Z. For an isogeny f:B→A one has f\*λ_A = sλ_B for a positive
integer s with deg f = s^g. The points in question are covered by the images in the parameter space
of the finitely many polarized isogeny correspondences of degree ≤M; the subgroup count of §3.2
bounds their fibre degrees, and a projective degree estimate for the image of each correspondence in
the fixed embedding bounds the degree of the hypersurface by C M^{2g}. The degree estimate for the
correspondences is part of this target: a bound for the number of points in a fibre does not by
itself bound the degree of an image.

*Needs:* §7.3; §3.2; SchemeAndStackFoundations node `SF.0/algebraic-scheme-dimension`; PELModuli
§M6.5 `coarseModuli`; §6.3.

### 7.5 The higher-dimensional candidate count

Prove `candidateCount`. Fix the cover Ã, the parameter map Ψ, the hypersurface H and a prime p; p=2
is allowed. There is an exponent µ(g) such that, for all integers M≥1 and N≥2, the number of bad
integral parameters n∈[1,N]^G is bounded by a fixed constant times N^{G−1}M^{2g}+N^{G−1}(log
N)^µ+N^{G−1/2}log N. A parameter is bad when at least one projected point A_n of Ψ^{-1}(n) lacks a
model over a field of degree ≤D from (1), admits an isogeny of degree ≤M to a point of H, or fails
p-Galois genericity. The constant depends on the fixed cover, Ψ and H. In odd dimension, and in
dimensions 2 and 6, the same bound holds after removing the final summand.

(MZ20 §5.1 Lemma 5.1 (32) pp.658–659.)

*Proof sketch.* The fixed locus where a fibre is not regular or not finite contributes O(N^{G−1})
points by the grid bound. The parameters with a point that is not p-Galois generic are counted by
§6.8. Every remaining candidate is Galois generic, hence has geometric End=Z, so §7.4 puts the
small-isogeny exceptions on a hypersurface of degree ≤C M^{2g}, and the grid bound counts its
integral points by C N^{G−1}M^{2g}. Adding the three counts covers every reason for being bad; in
the dimensions where the half-saving term is absent, the improved count of §6.8 is used.

*Needs:* §7.1; §7.4; §6.8; Mathlib `MvPolynomial.schwartz_zippel_totalDegree`.

### 7.6 Product discriminant and height estimates

Prove `heightDiscriminant`. For a candidate A=A_n and an isogenous Ã defined over a degree-D̃ field,
with D̃≥2, D(A×Ã)≪max{D̃,log N+h(Ã)}^λ and max{1,h(A),h(Ã)}≪log N+log m̃ for the selected isogeny of
degree m̃. The stable Faltings height may be negative.

(MZ20 §5.1 Lemma 5.2 (34)–(35) p.660.)

*Proof sketch.* Apply the endomorphism estimate (§1.4) to the product A×Ã over the compositum of the
two model fields. Bound h(A_n) by a multiple of log N using the fixed algebraic family and the
comparison of heights on it. Then use h(Ã)≤h(A)+(1/2)log m̃ for an isogeny of degree m̃ and
additivity of stable heights on products.

*Needs:* §5.10; FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`;
FaltingsFinitenessAndIsogenyTheorems §R28.2.1 `height_isogeny`; §1.4.

### 7.7 The isogeny-degree height bound

Prove `isogenyDegreeHeight`. For λ=λ(g)>0, the selected isogeny f:A_n→Ã has degree m̃≪max{D̃,log
N}^{2gλ}. Constants depend only on the fixed family and H.

(MZ20 §5.1 Lemma 5.2 (33) p.660.)

*Proof sketch.* Use deg f≤ℓ(v)^{4g} to get m̃≪max{D̃,log N+log m̃}^{2gλ}. Apply logarithmic
absorption for large m̃, absorbing bounded cases into the fixed constant.

*Needs:* §7.6; §5.10; Mathlib `isLittleO_log_rpow_rpow_atTop`; §5.3.

### 7.8 A logarithmic threshold forces large target degree

Prove `logThreshold`. Choose ν>2gλ and M=floor((log N)^ν). For sufficiently large N, a candidate
avoiding all degree≤M isogenies but isogenous to Ã has (log N)^ν≪m̃≪D̃^{2gλ}.

(MZ20 §5.1 (36) p.660.)

*Proof sketch.* Use m̃>M and compare with the previous maximum bound. The log N alternative becomes
impossible for sufficiently large N because ν>2gλ; retain only D̃.

*Needs:* §7.7; §7.5.

### Examples

- For the theta parameter map of §8.14, F̃=F_Ψ=Q and D=D_Ψ≤2^{16g⁴−1}.
- For g=2 (G=3) the candidate count is ≪N²M⁴+N²(log N)^µ: the half-saving term is absent because
  Serre's theorem applies in dimension two.
- With M=⌊(log N)^ν⌋ and ν>2gλ, the bound N^{G−1}M^{2g} becomes N^{G−1}(log N)^{2gν}, which is
  o(N^{G−γ′}) for every γ′<1.

### Dependencies

Earlier layers: Layer 1, Layer 3, Layer 5, Layer 6. Other roadmaps: PELModuli,
SchemeAndStackFoundations, AbelianSchemesAndArithmeticModuli, FaltingsFinitenessAndIsogenyTheorems.

## Layer 8: Fourier order, theta coordinates and explicit degree

This layer produces the numerical field-degree bound independently of the avoidance estimate. The
common theta multiplier, the finite-level norm and a strict Fourier cutoff give a projective
relation. Arithmetic descent of the coordinate model is a separate input from the analytic quotient
description, and it does not give a field over which every sixteen-torsion point is rational.

### 8.1 The order of a Siegel Fourier expansion

Define `fourierOrder`. For a nonzero Λ-form ϕ of nonnegative integer weight, g≥2, with Fourier
expansion indexed by positive-semidefinite symmetric rational M satisfying dM half-integral, define
ord(ϕ)=min{tr M:a(M)≠0}. Half-integral means integral diagonal and half-integral off-diagonal. The
trace support is a discrete nonnegative subset of (1/d)Z. Extend ord(0)=+∞ explicitly.

(MZ20 §5.2 p.665.)

*Construction.* The Fourier coefficients of a Λ-form are uniquely determined by the form (§0.11).
Their support consists of positive-semidefinite matrices M with dM half-integral, and the traces of
such M form a discrete subset of (1/d)Z≥0, so a nonzero form has a nonempty support whose traces
attain a minimum.

The API:

- `fourierOrder.supportMinimum`: For ϕ≠0, ord(ϕ) is attained and every nonzero coefficient has trace
  at least ord(ϕ).
- `fourierOrder.zero`: ord(0)=+∞ in the extended nonnegative order carrier.
- `fourierOrder.scalar`: For c∈C with c≠0, ord(cϕ)=ord(ϕ).
- `fourierOrder.vanishingCutoff`: For ϕ≠0, all coefficients with tr M≤W vanish iff ord(ϕ)>W.
- `fourierOrder.expansionCompatibility`: The coefficients are precisely the AutomorphicBundles
  Fourier coefficients in the same exp(πi tr(Mτ)) normalization; changing to 2πi rescales the index.

*Needs:* AutomorphicBundles §B4.3 `AutomorphyFactor` and §B4.4 `slashActionOfAutomorphyFactor`;
ShimuraVarieties §2.8 `TauCeti.Shimura.koecher`; §0.11.

**Checks.**

- `fourierOrder.constant`: For a nonzero constant weight-zero form the order is 0.
- `fourierOrder.zeroForm`: The zero form has order +∞ and is excluded from finite order bounds.
- `fourierOrder.cutoffEquality`: If the first nonzero trace is W, the assertion that every
  coefficient with trace≤W vanishes is false.

The light predicate `IsHalfIntegral M` means integral diagonal entries and
integral entries of 2M; symmetry is required separately by the Fourier-index theorems.
Its API is the diagonal and doubled-entry characterizations, closure under addition,
and `IsHalfIntegral.intCast` for every integral matrix.

**Checks for half-integrality.**

- `IsHalfIntegral.identity`: I_g and the zero matrix are half-integral.
- `IsHalfIntegral.offDiagonal`: [[1,1/2],[1/2,1]] is half-integral; requiring all
  entries integral would reject this index.
- `IsHalfIntegral.diagonalFails`: diag(1/2,1) fails even though all entries of 2M
  are integral; both clauses are needed.
- `IsHalfIntegral.quarterFails`: [[1,1/4],[1/4,1]] fails the doubled-entry condition.

### 8.2 Superadditivity of Fourier order

Prove `orderSuperadditive`. For nonzero compatible Λ-forms ϕ_1,ϕ_2, ord(ϕ_1ϕ_2)≥ord(ϕ_1)+ord(ϕ_2).
No equality is required; cancellation at the lowest trace cannot reduce the order.

(MZ20 §5.2 p.665.)

*Proof sketch.* Use the coefficient convolution formula with locally finite index sums at each
bounded trace. Every contributing pair has the sum of its traces at least the sum of the two minimal
traces.

*Needs:* §8.1; §0.11.

### 8.3 The coset norm of a Λ-form

Construct `normForm`. Let g≥2 and Λ◁Γ=Sp_{2g}(Z) have finite index n. For a Λ-form ϕ of weight k≥0
and representatives γ_1=1,…,γ_n, define Φ=∏_i ϕ(γ_iτ)/Δ(γ_i,τ)^k and Φ_1=∏_{i≥2}ϕ(γ_iτ)/Δ(γ_i,τ)^k.
Then Φ is a Γ-form of weight nk and Φ_1 is a Λ-form of weight (n−1)k. For ϕ≠0 both are nonzero.

(MZ20 §5.2 Lemma 5.3 pp.664–665.)

*Construction.* Use the automorphy-factor cocycle and the permutation of cosets under Γ to prove the
transformation law. For Φ_1 use its explicit product to prove analyticity; a formal ratio Φ/ϕ alone
does not justify cancellation across zeros. Use connectedness and analytic identity for nonzero
finite products.

The API:

- `normForm.product`: The norm equals the stated finite product of slash transforms.
- `normForm.weight`: Its Γ weight is index(Λ) times the original weight.
- `normForm.factorization`: Φ=ϕΦ_1 with Φ_1 analytic of weight (n−1)k.
- `normForm.representativeIndependent`: Changing the coset representatives does not change Φ, by the
  Λ law and the cocycle.
- `normForm.slashCompatibility`: Each factor is the imported left-action slash transform in the
  AutomorphicBundles convention.

*Needs:* AutomorphicBundles §B4.3 `AutomorphyFactor` and §B4.4 `slashActionOfAutomorphyFactor`;
§8.1.

**Checks.**

- `normForm.indexOne`: For Λ=Γ, Φ=ϕ and Φ_1=1.
- `normForm.constantOne`: The norm of the weight-zero constant form 1 is 1.
- `normForm.wrongWeight`: For n>1 and k>0 the norm has weight nk, not k.

### 8.4 Igusa full-group order bound

Prove `igusaOrderBound`. A nonzero Γ-form of weight k has ord ≤ κ_g k/(4π), with κ_g ≤ (2g/√3)c_g
for the Minkowski constant c_g ≤ (4/π)^g Γ((g+1)/2)² (3/2)^{(g−1)(g−2)} (Igusa [18, Th. 7 p. 206, p.
197]; Lekkerkerker [22, p. 63]). Here g≥2, k≥0 and the form is nonzero; Γ((g+1)/2) in the constant
is the Euler gamma function, not the symplectic group.

(MZ20 §5.2 Lemma 5.4 proof p.665 and constant bound p.666.)

*Proof sketch.* Apply Igusa’s Theorem 7 with the exact Fourier convention. Insert the stated
Minkowski-constant upper bound and retain every numerical factor.

*Needs:* §8.1; AutomorphicBundles §B4.3 `AutomorphyFactor` and §B4.4
`slashActionOfAutomorphyFactor`; §0.11; §0.7.

The numerical helper `minkowskiConstantBound g` is the displayed upper bound for c_g,
not the optimal Minkowski constant. Its formula, positivity for g≥1, and evaluation
at small g form its API; the order theorem uses g≥2.

**Checks for the numerical bound.**

- `minkowskiConstantBound.one`: At g=1, Γ(1)=1 and the value is 4/π.
- `minkowskiConstantBound.two`: At g=2, Γ(3/2)=√π/2 and the value is again 4/π.
- `minkowskiConstantBound.three`: At g=3, Γ(2)=1 and the factor (3/2)² gives
  144/π³. Omitting that factor gives the wrong value.

### 8.5 Finite-level order bound

Prove `finiteLevelOrderBound`. Let g≥2, k≥0 be an integer and Λ◁Γ=Sp_{2g}(Z) have finite index
n=[Γ:Λ]. A nonzero Λ-form ϕ of weight k satisfies ord(ϕ)≤κ_g n k/(4π), with Fourier order and κ_g as
in §8.1 and §8.4.

(MZ20 §5.2 Lemma 5.4 p.665.)

*Proof sketch.* For ϕ≠0 form its nonzero full-group norm Φ. Superadditivity gives
ord(Φ)≥ord(ϕ)+ord(Φ_1)≥ord(ϕ). Apply the full-group bound to weight nk.

*Needs:* §8.3; §8.2; §8.4.

### 8.6 Theta constants in the fixed row-vector convention

Define `thetaConstant`. For symmetric τ∈ℋ_g and real row characteristics m,m\*, define
θ_{m,m\*}(τ)=∑_{h∈Z^g}exp(πi(h+m)τ(h+m)^t+2πi(h+m)m\*^t). For positive even integer e, define
Γ(e,2e)={γ=(a,b;c,d)∈Sp_{2g}(Z):γ≡I mod e, diag(ab^t)≡diag(cd^t)≡0 mod 2e}. Equivalently use
diag(a^tc),diag(b^td) in the second condition. The blocks here have the usual symplectic signs,
independent of the signed endomorphism convention. Use the theta family θ_{m,0}(eτ), with
m∈e⁻¹Z^g/Z^g and canonical representatives. For the projective model require 8|e and e a square.

(MZ20 §5.2 pp.665–666; BCCR 2017 §2 p.3, Igusa subgroup definition preceding Definition 2.1.)

*Construction.* Use positive-definite Im τ to prove normal convergence of the theta series. Pin the
characteristic shifts, the congruence subgroup and the common transformation multiplier before
squaring.

The API:

- `thetaConstant.series`: The theta constant is the normally convergent series in the displayed
  row-vector convention.
- `thetaConstant.shiftFirst`: θ_{m+k,m\*}=θ_{m,m\*} for k∈Z^g by reindexing.
- `thetaConstant.shiftSecond`: θ_{m,m\*+k}=exp(2πi m k^t)θ_{m,m\*} for k∈Z^g.
- `thetaConstant.squaredWeight`: θ_{m,0}(eτ)² is a Γ(e,2e)-form of weight 1 with half-integral
  Fourier denominator d=e.
- `thetaConstant.analyticCompatibility`: Its holomorphy and slash law are statements in the imported
  Siegel/AutomorphicBundles types, not a private analytic carrier.
- `thetaLevel.mem_iff`: A symplectic integer matrix belongs to Γ(e,2e) iff it is I mod e and both
  diag(ab^t),diag(cd^t) vanish mod 2e.
- `thetaLevel.subgroup`: The congruence conditions define a subgroup of Sp_{2g}(Z); for positive
  even e it is normal and has finite index.
- `thetaLevel.inclusions`: Γ(2e)⊆Γ(e,2e)⊆Γ(e), with every level positive.
- `thetaLevel.transposeCompatibility`: The diagonal conditions are equivalent to
  diag(a^tc),diag(b^td)≡0 mod 2e, in the same principal-congruence subgroup.

*Needs:* ShimuraData node `D5/siegel-datum`; AutomorphicBundles §B4.3 `AutomorphyFactor` and §B4.4
`slashActionOfAutomorphyFactor`; §0.11; AbelianSchemesAndArithmeticModuli §A5.8 `SiegelFamily`.

*Lean:* `thetaConstant`, `thetaConstant_add_int_left`, `thetaConstant_add_int_right`, `thetaLevel`,
`principal_subset_thetaLevel`, `thetaLevel_mul_mem`.

**Checks.**

- `thetaConstant.zeroCharacteristicImaginary`: θ_{0,0}(it I_g) is positive real for t>0.
- `thetaConstant.oddElliptic`: For g=1, θ_{1/2,1/2}(τ)=0 by the odd-characteristic cancellation.
- `thetaConstant.secondShiftPhase`: For m=1/2 in genus one, shifting m\* by 1 multiplies the value
  by −1 and is not ordinary periodicity.
- `thetaLevel.identity`: The identity belongs to Γ(e,2e) for every positive even e.
- `thetaLevel.principalDoubleLevel`: Every matrix congruent to I mod 2e satisfies both diagonal
  conditions and lies in Γ(e,2e).
- `thetaLevel.ellipticShear`: For g=1 and positive even e, the shear (1,e;0,1) lies in Γ(e) but not
  Γ(e,2e), since diag(ab^t)=e is not zero mod 2e.

### 8.7 Squared theta combinations have weight one

Prove `thetaLinearCombinations`. For the specified positive even level e, the theta constants
θ_{m,0}(eτ) have the common multiplier needed so that every complex linear combination χ has χ² a
Γ(e,2e)-form of weight 1, with Fourier denominator e. For the geometric application use e=16.

(MZ20 §5.2 Lemma 5.5 p.665.)

*Proof sketch.* Prove the actual common-multiplier transformation law at the source level. Square
the linear combination and compare the resulting Fourier convention.

*Needs:* §8.6; AutomorphicBundles §B4.3 `AutomorphyFactor` and §B4.4
`slashActionOfAutomorphyFactor`.

### 8.8 Counting bounded-trace Fourier indices

Prove `fourierIndexCount`. For W≥0 and e≥1, the number of positive-semidefinite symmetric rational
g×g matrices M with eM half-integral and tr M≤W is at most (4eW+1)^G, where G=g(g+1)/2. Use the real
bound as stated, or its correctly rounded integer version.

(MZ20 §5.2 Lemma 5.5 proof pp.665–666.)

*Proof sketch.* Bound every diagonal by W and each off-diagonal by the positive-semidefinite 2×2
minor inequality. Encode the G independent entries in the half-integral lattice and count the
resulting finite box, retaining the diagonal/off-diagonal integrality distinction.

*Needs:* §8.6; Mathlib `Matrix.PosSemidef`.

*Lean:* `IsHalfIntegral`, `fourierIndexCount`.

### 8.9 A high-order homogeneous theta relation

Prove `thetaCoefficientKernel`. Let χ₁,…,χ_{G+2} be complex linear combinations of θ_{m,0}(eτ), let
W≥0 be real and D≥0 an integer. If (D+1)^{G+1}>(G+1)!(4eW+1)^G, there is a nonzero homogeneous
P∈ℂ[X₁,…,X_{G+2}] of degree D for which every Fourier coefficient of ϕ=P(χ₁²,…,χ_{G+2}²) with tr M≤W
vanishes. Thus ϕ≠0 implies ord(ϕ)>W. The strict inequality is what §8.10 uses; vanishing of all
coefficients with trace at most W proves it directly.

(MZ20 §5.2 Lemma 5.5 (48) pp.665–666.)

*Proof sketch.* The space of homogeneous polynomials of degree D in G+2 variables has dimension
binom(D+G+1,G+1)≥(D+1)^{G+1}/(G+1)!. Map it linearly to the Fourier coefficients of trace at most W
of P(χ₁²,…,χ_{G+2}²); by §8.8 there are at most (4eW+1)^G of them, so the strict inequality gives a
nonzero polynomial in the kernel. If the resulting form is nonzero, all its coefficients of trace ≤W
vanish, so its order is >W, including the endpoint W itself.

*Needs:* §8.8; §8.7; §8.1.

### 8.10 The order comparison forces an identically zero relation

Prove `thetaRelationVanishing`. Let n=[Γ:Γ(e,2e)] and β=κ_g n/(4π). If (D+1)^{G+1}>(G+1)!(4eβD+1)^G,
the relation from the coefficient-kernel theorem with W=βD satisfies P(χ_1²,…,χ_{G+2}²)=0
identically. Its degree in the unsquared χ variables is 2D.

(MZ20 §5.2 p.666.)

*Proof sketch.* If the resulting weight-D form were nonzero, its order would be both >βD and ≤βD.
Conclude it vanishes identically; each input square doubles the ordinary polynomial degree.

*Needs:* §8.9; §8.5.

### 8.11 The theta-coordinate projective model

Construct `thetaModel`. For e=16, form the quasi-projective image V_e of ℋ_g under [θ_{m,0}(eτ)]_m
and its irreducible projective closure. Its complex analytic quotient is the quotient of ℋ_g by
Γ(e,2e) in the exact source level interpretation. Its Q-coordinate model and Q-defined forgetful
morphism to A_g require the arithmetic descent theorem, independently of any universal full-torsion
family.

(MZ20 §5.2 pp.665–666.)

*Construction.* Use the theta embedding by the functions θ_{m,0}(eτ) and its identification of the
quotient of ℋ_g by Γ(e,2e) with an open subset of its image, under the stated level hypotheses (MZ20
§5.2, p.666, citing Masser–Wüstholz 1993, pp.415 and 422–423). Take the projective closure of the
image. The model over Q and the algebraic forgetful morphism to A_g are a separate arithmetic
descent statement and are proved as part of this target, not read off from the analytic quotient.

The API:

- `thetaModel.coordinateMap`: The coordinate map uses the family θ_{m,0}(16τ) in projective space.
- `thetaModel.dimension`: dim V_16=G.
- `thetaModel.quotientComparison`: The complex quotient comparison preserves the source’s exact
  congruence subgroup and coordinate ratios.
- `thetaModel.forgetful`: The arithmetic theta model has its proved algebraic forgetful map to the
  PEL A_g.
- `thetaModel.levelDistinction`: A full arithmetic symplectic-level model with universal scheme
  requires a separately proved comparison; it is not this coordinate model by definition.

*Needs:* §8.6; PELModuli §M6.5 `coarseModuli`; ShimuraVarieties §2.7 `TauCeti.Shimura.baily_borel`;
SchemeAndStackFoundations node `SF.0/algebraic-scheme-dimension`.

**Checks.**

- `thetaModel.realThetaRatios`: At τ=iI_g the defined theta ratios are positive real.
- `thetaModel.projectiveScaling`: A common nonzero scalar on all theta coordinates leaves the
  projective point unchanged.
- `thetaModel.torsionField`: The coordinate field and projective degree alone do not split A[16].

### 8.12 Generic projections preserve or bound projective degree

Prove `genericProjectionDegree`. Let V ⊂ P^r_C be an irreducible projective variety of dimension G <
r. For generic linear forms χ_1, …, χ_{G+2}, the projection V ⇢ P^{G+1} is birational onto a
hypersurface of degree deg V, so if the image lies in the zero set of a nonzero homogeneous
polynomial of degree δ, then deg V ≤ δ. A generically finite projection V ⇢ P^G has degree at most
deg V.

(MZ20 §5.2, p.666.)

*Proof sketch.* Choose a center disjoint from the irreducible projective V and sufficiently general
so that the projection to P^{G+1} is birational. Intersect with a general linear section to identify
its hypersurface degree with deg V. For projection to P^G compare fibre degree with the same
linear-section count.

*Needs:* SchemeAndStackFoundations node `SF.0/algebraic-scheme-dimension`; SchemeAndStackFoundations
node `SF.4/generic-projection`.

### 8.13 The explicit theta-model degree bound

Prove `thetaNumericalDegree`. For g≥2 and G=g(g+1)/2, deg
V̄_16≤2(G+1)!((32g/(π√3))512^{2g²}c_g)^G≤2^{16g^4−1}, with c_g bounded by the source gamma/Minkowski
expression. The index bound is [Γ:Γ(e,2e)]≤e^{2g²}(2e)^{2g²}.

(MZ20 §5.2 p.666.)

*Proof sketch.* Bound the index [Γ:Γ(e,2e)] by counting residue classes modulo 2e. Choose an integer
D satisfying the strict inequality of §8.10 with β=κ_g n/(4π), noting the parentheses
(D+1)^{G+1}>(G+1)!(4eβ(D+1))^G in the choice of D. A generic projection to G+2 coordinates (§8.12)
turns the identically vanishing relation of degree 2D into the degree bound; finally check the
numerical inequality for every g≥2.

*Needs:* §8.11; §8.10; §8.12; §8.4.

*Lean:* `minkowskiConstantBound`, `thetaNumericalDegree_le`.

### 8.14 A small-degree theta parameter map

Construct `thetaParameter`. Choose a suitable subset of θ_{m,0}(16τ)/θ_{0,0}(16τ) as a dominant
generically finite rational map Ψ:V_16⇢A^G. On its regular nonempty domain D_Ψ≤deg
V̄_16≤2^{16g^4−1}. The source arithmetic descent gives F_Ψ=F̃=Q; the main bound can be enlarged to
2^{16g^4}. This statement contains no rational 16-torsion clause.

(MZ20 §5.2 p.666.)

*Construction.* Choose algebraically independent coordinate ratios with generically finite map and
controlled degree. Verify their rational coefficient model and the forgetful morphism’s Q descent;
two varieties having Q models alone does not prove the map descends. Use the product field formula
for D and the geometric degree bound.

The API:

- `thetaParameter.genericDegree`: The generic degree is at most 2^{16g^4−1}.
- `thetaParameter.regularDomain`: The coordinate ratios define a rational map on a nonempty open
  where denominators and finite-fibre conditions hold.
- `thetaParameter.fieldFormula`: D=[F̃:Q][F_Ψ:Q]D_Ψ with the actual forgetful and parameter fields.
- `thetaParameter.projectionComparison`: The degree bound is the generic linear/coordinate
  projection degree of the same projective theta model.

*Needs:* §8.11; §8.13; §8.12.

**Checks.**

- `thetaParameter.degreeVersusTorsion`: A projective-degree estimate is not a bound for a torsion
  splitting extension.
- `thetaParameter.quadraticAllowance`: If D_Ψ≤2^{16g^4−1}, then 2D_Ψ≤2^{16g^4}.
- `thetaParameter.zeroDenominator`: A ratio with θ_{0,0}=0 lies outside that chart; it is not
  assigned an artificial parameter value.

### Examples

- For g=2 and e=16, [Γ:Γ(16,32)]≤16^{8}·32^{8}=512^{8}=2^{72}, and the number of Fourier indices
  with trace at most 1 is at most (4·16·1+1)³=65³=274625.
- For g=2 the explicit degree bound 2(G+1)!((32g/(π√3))512^{2g²}c_g)^G is below 2^{234}, well within
  2^{16g⁴−1}=2^{255}.
- For g=1, θ_{1/2,1/2}(τ)=0 identically, while θ_{0,0}(it)=∑_h e^{−πth²}>0 for t>0.

### Dependencies

Earlier layers: Layer 0. Other roadmaps: AutomorphicBundles, ShimuraVarieties, ShimuraData,
AbelianSchemesAndArithmeticModuli, PELModuli, SchemeAndStackFoundations.

## Layer 9: Projected blocks and quantitative avoidance

The matrix height bound feeds the uniform block count, and the projection of every relevant block is
a point. There are many distinct conjugate periods, not merely many homomorphism matrices; comparing
the lower bound for these periods with the point-block bound forces the target field degree to stay
bounded.

### 9.1 Definability of the period correspondence family

Prove `correspondenceDefinability`. If restricted J on F_g is definable and H is algebraic,
Z=F_g∩J⁻¹(H) and the family W_τ(Z), with τ as a real parameter, are definable. On det(cτ+d)≠0 the
projection π_τ(X)=(aτ+b)(cτ+d)⁻¹ is semialgebraic.

(MZ20 §5.1 pp.662–663.)

*Proof sketch.* The restricted uniformization J on F_g is definable in R_an,exp (§2.5), so
Z=F_g∩J⁻¹(H) is definable. On the locus det(cτ+d)≠0 the inverse (cτ+d)⁻¹ is the adjugate divided by
the determinant, so the map X↦(aτ+b)(cτ+d)⁻¹ is semialgebraic in (X,τ) and W_τ(Z) is a definable
family with parameter τ.

*Needs:* §0.10; §0.6; §2.5; §2.1.

### 9.2 Integral matrices of bounded polynomial height

Prove `galoisPeriodHeight`. For the Galois conjugates Ã^σ fixing the fields of A and H, choose
controlled-length isogenies and F_g period representatives. Their signed rational blocks ρ_σ are
integral, project to τ̃_σ∈Z, and have sup norm ≤C D̃^λ after enlarging λ≥4.

(MZ20 §5.1 (38)–(45) pp.661–662.)

*Proof sketch.* Apply entry bounds to the product block matrix in the enlarged H_{2g} domain, not to
a falsely ordered F_{2g} representative. Use conjugation invariance of heights/discriminants and the
product period-height bound to get ‖y‖≪D̃² and ℓ(v_σ)≪D̃^{λ/2}. Combine to obtain M_σ≪D̃^{2+λ/2}≤C
D̃^λ.

*Needs:* §5.12; §5.4; §5.5; §5.6; §5.7; §5.11; §7.6; §7.8; §0.10.

### 9.3 Hodge-generic points force zero-dimensional block images

Prove `hodgeGenericZeroImages`. Every Pila block B containing a relevant integral ρ_σ has
zero-dimensional connected image π_τ(B). A positive-dimensional image would give a
positive-dimensional weakly-special K⊂H through the Hodge-generic Ã^σ, contradicting the
point-or-whole-A_g dichotomy.

(MZ20 §5.1 p.663.)

*Proof sketch.* If the projection of a block were positive-dimensional, it would contain a real
semialgebraic arc in Z through the projected point (§2.4, §2.3). By Ax–Lindemann for A_g (§2.8) the
arc maps into a weakly special subvariety K⊆H containing the Hodge-generic point Ã^σ. By §2.9, K is
a point or all of A_g; the arc excludes a point and the properness of H excludes A_g.

*Needs:* §9.1; §6.1; §6.3; §2.4; §2.8; §2.9; §2.7; ShimuraData node `D5/siegel-datum`.

### 9.4 Bounded target field degree from projected blocks

Prove `orbitDegreeCollapse`. Take a model field K̃ with [K̃:Q(x̃)]≤c(g) and D̃=max(2,[K̃:Q]).
Distinct periods of conjugates fixing the fixed fields have cardinality ≥c′D̃. Uniform point-block
counting and T≤C D̃^λ give D̃≤C_ε D̃^{λε}; choose 0<ε<1/λ to conclude D̃≤C.

(MZ20 §5.1 p.663.)

*Proof sketch.* Divide the moduli orbit only by the degrees of the fixed fields and bounded
model-field lift. Count the distinct projected point images, not the many matrices in each
stabilizer fibre. Absorb the exponent λε<1.

*Needs:* §7.2; §9.2; §9.3; §2.4.

### 9.5 The strong quantitative hypersurface-avoidance theorem

Prove `countingTheorem`. Fix g≥2, a cover Ã⇢A_g, a parameter map Ψ:Ã⇢A^G and an algebraic
hypersurface H⊂A_g. Both maps are dominant and generically finite, with specified nonempty regular
domains. Write D=[F̃:Q][F_Ψ:Q]D_Ψ as in (1). For each γ<1/2 there is a constant C(Ã,Ψ,H,γ) such
that, for every integer N≥1, at most C N^{G−γ} integral parameters n∈[1,N]^G are exceptional.
Outside this exceptional set, every projected point in the regular fibre Ψ^{-1}(n) has a model over
a field of degree ≤D, is Galois generic and is geometrically isogenous to no point of H. Thus
genericity is Galois genericity, which implies Hodge genericity. When g is odd or g∈{2,6}, the
exponent may be any γ<1. There is a choice of Ã and Ψ over Q for which the field-degree allowance is
2^{16g⁴}. An exceptional fibre is one with at least one failing projected point.

(MZ20 §1.2 Theorem 1.3 p.638; §5.1 pp.658–663; §5.2 p.666.)

*Proof sketch.* Choose an intermediate exponent γ<γ′<1/2, or <1 in the permitted dimensions, before
absorbing the logarithmic factors in the candidate bound. Orbit collapse and the threshold exclude
all H-isogenies once N is sufficiently large. Add finitely many small N and the fixed rational-map
exception; use the theta degree map for the stated universal numerical bound.

*Needs:* §7.5; §7.8; §9.4; §6.2; §6.3; Mathlib `isLittleO_log_rpow_rpow_atTop`; §8.14.

### Examples

- With λ=4 the matrices have entries ≪D̃⁴, and any ε<1/4 makes the block count D̃^{4ε} smaller than
  the orbit size ≫D̃ for large D̃.
- In genus one the analogous exponent is ε<2/21: T≪m̃^{3/2} and m̃≪D̃⁷ give T^ε≪D̃^{21ε/2}.
- For g odd or g∈{2,6} every γ<1 is admissible in the strong theorem; for g=4 only γ<1/2.

### Dependencies

Earlier layers: Layer 0, Layer 2, Layer 5, Layer 6, Layer 7, Layer 8. Other roadmaps: ShimuraData.

## Layer 10: Arithmetic consequences and the Schottky application

The counting theorem gives points avoiding a prescribed hypersurface, and the dimension count for
the Torelli locus turns this into the no-Jacobian theorem. The density argument uses new arithmetic
parameter maps in each neighbourhood with a uniform model-degree bound; it cannot be replaced by
rational symplectic translates of one example, whose model degrees can grow.

### 10.1 The main bounded-degree hypersurface-avoidance theorem

Prove `hypersurfaceAvoidance`. For each g≥2 and proper algebraic hypersurface H⊂A_g, one can find a
number field K and a Hodge-generic principally polarized g-dimensional abelian variety A/K
satisfying [K:Q]≤2^{16g⁴}. No abelian variety represented by a point of H is geometrically isogenous
to A.

(MZ20 §1.2 Theorem 1.1 p.637; §5.1–5.2.)

*Proof sketch.* Use the theta parameter map of small degree (§8.14) and any admissible γ>0. For N
large the exceptional count is less than N^G, so there is a regular nonempty good fibre and a point
in it; the strong conclusion of §9.5 gives genericity and avoidance, and the field bound is
2^{16g⁴}. The sixteen-torsion problem of Layer 12 plays no role.

*Needs:* §9.5; §8.14; §0.9.

### 10.2 An abelian variety isogenous to no Jacobian

Prove `noJacobian`. In each dimension g≥4 there is a number field K of degree [K:Q]≤2^{16g⁴} and a
Hodge-generic principally polarized abelian variety A/K of dimension g whose geometric isogeny class
contains no Jacobian. This excludes canonically principally polarized Jacobians of stable
compact-type curves as well as smooth curves; the isogenies need not respect polarizations.

(MZ20 §1.2 Corollary 1.2 p.637.)

*Proof sketch.* Apply the main theorem to H_g containing the Torelli closure. Every relevant
Jacobian moduli point lies in H_g, so the selected variety is isogenous to none.

*Needs:* §10.1; §0.5.

### 10.3 Many isogeny classes in the parameter box

Prove `manyClasses`. For every ε>0 there are C_0=C_0(Ψ,ε)>0 and N_0 such that for every N≥N_0, the
regular projected points from Ψ^{-1}(n), n∈[1,N]^G, represent at least C_0^{-1}N^{G−ε} isogeny
classes. Work on a fixed common nonempty open where Ψ is regular with finite fibres and the
forgetful map π is finite, so the parameter-to-moduli multiplicity is uniformly bounded. The bad
algebraic domain is discarded separately, not counted with finite multiplicity.

(MZ20 §1.2 p.638 and §5.3 p.666.)

*Proof sketch.* Discard the fixed bad algebraic domain and the parameters with a point that is not
Galois generic (§6.8); for N large a positive proportion of the box remains, and Hodge genericity
gives geometric End=Z. Within one isogeny class, the isogeny estimate (§1.3) together with the
height bound of the fixed family bounds the degree of a connecting isogeny by a power of log N, so
each class contains at most (log N)^{O(1)} of the remaining points by the subgroup count (§3.2);
End=Z makes the principal polarization unique, so polarized moduli points are counted as well.
Bounded multiplicity on the chosen domain and absorption of the logarithmic factor into N^ε
conclude.

*Needs:* §3.2; §7.1; FaltingsFinitenessAndIsogenyTheorems §R28.1.5 `modularHeight`; §6.8; §6.3;
§1.3.

### 10.4 Bounded-degree points in every Euclidean open set

Prove `quadraticApproximation`. For every nonempty Euclidean open U⊆A_g(C), there is a Hodge-generic
hypersurface-avoiding point in U with model degree≤2^{16g^4}. Lift a regular point to V_16,
approximate its Ψ-image by ξ∈Q(i)^G and apply the counting theorem to Λ_d∘Ψ, where
Λ_d(x)_j=1/[d(x_j−ξ_j)].

(MZ20 §5.3 (49) p.667.)

*Proof sketch.* Work on a common regular chart and use a local branch or controlled inverse
neighbourhood for the generically finite map. For sufficiently large d, all inverse parameter points
ξ_j+1/(dn_j) lie in that neighbourhood. The extra coefficient degree is at most two; use
2D_Ψ≤2^{16g^4}, choosing at least one good n.

*Needs:* §9.5; §8.14; PELModuli §M6.5 `coarseModuli`.

### 10.5 Avoid finitely many preselected isogeny classes in an open

Prove `avoidFiniteIsogenyClasses`. Each nonempty Euclidean open contains bounded-degree
Hodge-generic hypersurface-avoiding points outside any prescribed finite set of isogeny classes.

(MZ20 §5.3 p.667.)

*Proof sketch.* Fix the reciprocal parameter transformation of §10.4, so that every sufficiently
large parameter box lies in the chosen neighbourhood, and fix its common regular domain of bounded
multiplicity. Choose 0<ε<γ with γ admissible in §9.5. Then §10.3 gives at least cN^{G−ε} classes
while §9.5 discards at most CN^{G−γ} parameter tuples, hence at most that many classes; the
difference tends to infinity, so after discarding the prescribed finite list of classes some point
remains, with the required field bound, genericity and avoidance.

*Needs:* §10.4; §10.3; §9.5.

### 10.6 A dense set of pairwise non-isogenous examples

Prove `denseIndependentSet`. For g≥4, choose a Euclidean dense subset S⊂A_g(C) consisting of
principally polarized abelian varieties with model fields of degree ≤2^{16g⁴}. The choices can be
made so that distinct members of S have distinct geometric isogeny classes, and none of these
classes contains a Jacobian.

(MZ20 §1.2 Corollary 1.4 p.638; §5.3 p.667.)

*Proof sketch.* Take a countable basis of the moduli topology and choose a point in each nonempty
basic open recursively. At each step exclude all earlier isogeny classes using the preceding lemma.
Containment in every basic open proves density; every selected point retains the common degree
bound.

*Needs:* §10.2; §10.5.

### 10.7 The unirational counting theorem

Prove `unirationalCount`. Let g∈{2,3,4,5} and fix a dominant rational parametrization Ξ:A^G⇢A_g over
Q. For a fixed hypersurface H⊂A_g and γ<1/2, a constant C(Ξ,H,γ) bounds the exceptional integral
parameters in every box [1,N]^G, N≥1, by C N^{G−γ}. Every nonexceptional parameter has a Q-defined,
Hodge-generic image whose geometric isogeny class avoids H; undefined images belong to the
exceptional set. For g∈{2,3,5} the bound permits every γ<1.

(MZ20 §1.2 Theorem 1.5 p.639; §5.1 p.657.)

*Proof sketch.* Apply the same candidate and block argument to the given dominant Q-rational map Ξ,
restricting to its regular generically finite domain. The image model is defined over Q by the
actual arithmetic moduli map, not by an arbitrary coarse field-of-moduli inference. Use the improved
genericity dimensions g=2,3,5 exactly.

*Needs:* §7.5; §9.4; §6.3.

### 10.8 The conditional rational fourfold consequence

Prove `rationalFourfold`. Assuming a Q-defined unirational parametrization of A_4, one can choose a
Hodge-generic principally polarized four-dimensional abelian variety over Q whose geometric isogeny
class contains no Jacobian.

(MZ20 §1.2 Corollary 1.6 p.640.)

*Proof sketch.* Take g=4 and the given dominant rational parametrization over Q. The bad set has
o(N^10) points, so choose a good regular rational image avoiding the genus-four Jacobian
hypersurface.

*Needs:* §10.7; §0.5.

### 10.9 Boundedly many distinct CM moduli points

Prove `boundedCmCount`. For a fixed arithmetic family with a uniform bound on its model-field
degrees, the number of distinct CM moduli points in A_g is bounded independently of N, by the
quantitative CM orbit lower bound and the finiteness of CM points of bounded discriminant. To bound
parameter tuples, also restrict to a fixed common open where Ψ has finite fibres and π is finite;
exceptional positive-dimensional fibres are excluded. The orbit lower bound is §1.8, unconditional
in every genus (Tsimerman 2018; the earlier route of Tsimerman 2012 was unconditional for 1≤g≤6 and
assumed GRH beyond); qualitative reciprocity alone does not provide it.

(MZ20 §5.4 p.667.)

*Proof sketch.* Bound the moduli orbit by the common model-field degree. Apply the quantitative CM
orbit theorem to bound the center-order discriminant, then Pila–Tsimerman Lemma 7.4 to obtain
finitely many CM moduli points. Conclude a uniform bound for distinct CM moduli points. On the
explicitly finite forgetful/regular-map open, multiply by the fixed finite parameter-to-moduli
degree for a parameter count. Outside it, count the bad algebraic parameter locus separately; it
need not contribute only O(1).

*Needs:* §7.1; §1.8; §1.9.

### 10.10 The genus-four Igusa–Schottky form

Prove `igusaSchottky`. F_g(τ) = 2^g U_g(τ) − V_g(τ)² with U_g = Σ θ_{mm\*}(τ)^{16}, V_g = Σ
θ_{mm\*}(τ)^8 over m, m\* ∈ 2^{-1}Z^g/Z^g is a Γ-form of weight 8; it vanishes identically on A_g
for 1≤g≤3, and for g = 4 its zero locus is the closure of the Jacobian locus (Grushevsky [16,
Th. 3.8]).

(MZ20 §5.4 p.670.)

*Proof sketch.* The theta transformation law makes U_g and V_g² forms of weight 8 for the full
group, hence F_g as well. In genus at most three F_g vanishes identically, and in genus four its
zero locus is the closure of the Jacobian locus (Grushevsky 2012, Theorem 3.8, cited in MZ20 §5.4,
p.670).

*Needs:* §8.6; AutomorphicBundles §B4.3 `AutomorphyFactor` and §B4.4
`slashActionOfAutomorphyFactor`; §0.4.

*Lean:* `halfChar`, `schottkyU`, `schottkyV`, `schottkyForm`,
`schottkyForm_eq_zero_of_card_le_three`.

The light helper `halfChar` sends the Fin 2 labels 0 and 1 to 0 and 1/2
coordinatewise. Its API identifies these representatives, their membership in
(1/2)Z/Z, and compatibility with splitting coordinates.

**Checks for half-characteristics and the theta sums.**

- `halfChar.zero`: The all-zero label gives the zero characteristic.
- `halfChar.one`: The label 1 in genus one gives 1/2, rather than 1.
- `halfChar.empty`: In genus zero there is exactly one empty characteristic;
  the empty theta series is 1, so U_0=V_0=1 and F_0=0.
- `schottkySums.ellipticI`: Put b=θ_{1/2,0}(i)=θ_{0,1/2}(i)>0. Jacobi
  gives θ_{0,0}(i)^4=2b^4 and θ_{1/2,1/2}(i)=0. Hence U_1(i)=18b^{16},
  V_1(i)=6b^8, and 2U_1−V_1²=0. This fixes both exponents and the factor 2.
- `schottkySums.productI`: At diag(i,i), block factorization gives
  U_2=324b^{32}, V_2=36b^{16}, and 4U_2−V_2²=0. The coefficient is 4 in genus two.

### 10.11 Factorization of theta sums on products

Prove `thetaProductFactorization`. For block-diagonal τ=diag(τ′,τ″), θ_{m,m\*}(τ) factors as the
product of the two block theta constants. Hence U_{g′+g″}=U_{g′}U_{g″} and V_{g′+g″}=V_{g′}V_{g″} in
the source’s sixteenth/eighth-power sums.

(MZ20 §5.4 p.670.)

*Proof sketch.* Split the characteristic and integer lattice sums along the block decomposition. Use
normal convergence to rearrange the product series, then factor the finite characteristic sums.

*Needs:* §8.6.

*Lean:* `thetaConstant_fromBlocks`.

### 10.12 Products lie in the genus-four Torelli closure

Prove `productsInTorelliClosure`. For block-diagonal τ, U_g and V_g factor as products; hence F_4
vanishes on products of two principally polarized abelian surfaces and on products of an elliptic
curve with a principally polarized abelian threefold, which therefore lie in the closure of the
Jacobian locus of A_4.

(MZ20 §5.4 p.670.)

*Proof sketch.* For the split 2+2 use V_2²=4U_2 in each factor to get V_4²=16U_4. For the split 1+3
use the corresponding low-genus identities. Apply the genus-four Schottky zero-locus identification;
these are closure assertions, not smooth-Jacobian assertions.

*Needs:* §10.10; §10.11.

*Lean:* `schottkyForm_fromBlocks_two_two`, `schottkyForm_fromBlocks_one_three`.

### Examples

- For g=4 the field-degree bound is 2^{16·4⁴}=2^{4096}.
- The Schottky form F_g=2^gU_g−V_g² has weight 8; for g=4 its zero locus is the closure of the
  Jacobian locus.
- For block-diagonal τ=diag(τ′,τ″) with τ′,τ″∈ℋ_2, U_4=U_2(τ′)U_2(τ″) and V_4=V_2(τ′)V_2(τ″), so
  V_2²=4U_2 in each factor gives V_4²=16U_4 and F_4=0.

### Dependencies

Earlier layers: Layer 0, Layer 1, Layer 3, Layer 6, Layer 7, Layer 8, Layer 9. Other roadmaps:
FaltingsFinitenessAndIsogenyTheorems, PELModuli, AutomorphicBundles.

## Layer 11: Newton interpolation within isogeny classes

Accumulating interpolation parameters are allowed because the values are chosen within explicit
successive tolerances on the Newton coefficients; arbitrary values at such parameters need not admit
an entire interpolant. The resulting moduli image is compact and parametrized by a real-analytic
map; neither embeddedness nor a global analytic hypersurface follows from that description.

### 11.1 Normalized Newton interpolation series

Construct `newtonSeries`. For an injective sequence t_n of real numbers and complex coefficients
a_n, form F(z)=∑_{n≥0}a_n∏_{m<n}(z−t_m)/(t_n−t_m), with empty product 1. The total sum is used; it
represents an entire interpolation function under the explicit coefficient envelope: for every R>0,
∑_n |a_n|∏_{m<n}(R+|t_m|)/|t_n−t_m| converges. No arbitrary interpolation data at accumulating t_n
is claimed to admit that envelope.

(MZ20 §3.3 interpolation (19)–(20) p.652.)

*Construction.* Use the finite normalized Newton polynomials and the infinite sum. The stated
majorants give normal convergence on every closed disk; apply the complex uniform-limit theorem. At
each t_k all terms with n>k vanish and the kth normalized polynomial equals one, giving the
triangular interpolation equations.

The API:

- `newtonSeries.at_parameter`: F(t_k)=∑_{n≤k}a_n∏_{m<n}(t_k−t_m)/(t_n−t_m), for injective t, without
  a global convergence assumption.
- `newtonSeries.finite_support`: If a_n=0 outside a finite set s, F equals the finite sum over s for
  every z.
- `newtonSeries.summable_at`: Under the stated envelope, the Newton terms are summable at every z∈C.
- `newtonSeries.holomorphic`: Under the envelope, F is complex differentiable everywhere, hence
  entire.
- `newtonSeries.polynomial_compatibility`: For finitely supported coefficients the function equals
  evaluation of the complex polynomial sum of the normalized Newton basis polynomials.

*Needs:* Mathlib `tsum`, `Finset.prod`, `Polynomial.eval` and `Differentiable`.

*Lean:* `newtonSeries`, `newtonSeries.at_parameter`, `newtonSeries.finite_support`,
`newtonSeries.summable_at`, `newtonSeries.holomorphic`, `newtonSeries.polynomial_compatibility`.

**Checks.**

- `newtonSeries.zero_coefficients`: All a_n=0 gives F(z)=0 for every z.
- `newtonSeries.constant_coefficients`: If a_0=c and a_n=0 for n>0, then F(z)=c.
- `newtonSeries.linear_basis`: For t_n=n+1, a_1=1 and all other a_n=0, F(z)=z−1, the native
  polynomial X−1.

### 11.2 Successive Newton coefficient tolerances

Prove `coefficientEnvelope`. For any injective real sequence t_n∈[1,2], there are positive ε_n such
that |a_n|≤ε_n for every n implies the coefficient envelope of §11.1. Choosing target values s_n so
that the triangular Newton coefficient a_n lies in that disk gives F(t_n)=s_n.

(MZ20 §3.3 interpolation (19)–(20) p.652; §5.4 pp.668–669.)

*Proof sketch.* Bound the nth normalized basis polynomial on the closed disk of radius n+1. Choose
ε_n so its nth majorant is at most 2^{-n}, retaining finitely many initial terms for each fixed
disk. Solve the triangular equation for a_n, whose coefficient at t_n is exactly one.

*Needs:* §11.1.

### 11.3 Select elliptic periods within coefficient tolerances

Prove `ellipticPeriodSelection`. Enumerate algebraic j-invariants and choose representative periods.
Positive rational scaling and rational translation preserve elliptic isogeny classes. They allow
distinct imaginary parts t_n∈[1,2] and real parts s_n that meet each successive Newton coefficient
tolerance.

(MZ20 §3.3 p.652.)

*Proof sketch.* Scale the imaginary part by a positive rational to choose a new t_n in the interval.
Translate the real part by a rational arbitrarily close to the prescribed coefficient target. Each
chosen period remains in the original isogeny class.

*Needs:* §11.2; ModularCurvesPartII node `R12.1/pointed-elliptic-uniformization`; ModularForms Layer
0 (the normalized `j`).

### 11.4 A bounded elliptic real-analytic interpolation image

Construct `ellipticInterpolationImage`. The image Z={j(F(y)+iy):1≤y≤2}, with the
coefficient-tolerant F from the elliptic selection, is compact and real-analytically parametrized,
has |j|≤2079+e^{4π}, and meets every algebraic elliptic isogeny class. By the real-curve avoidance
theorem it is not contained in any real algebraic curve. No embeddedness assertion is made.

(MZ20 §3.3 pp.651–652.)

*Construction.* The imaginary part stays in [1,2], so the period path stays in ℋ_1. Continuity of j
gives compactness, and the Fourier expansion of j on the strip gives the numerical bound.
Interpolation supplies a representative of every enumerated algebraic class; an algebraic curve
containing all of them would contradict the real-curve avoidance theorem (§4.9).

The API:

- `ellipticInterpolationImage.image`: Z is the image of [1,2] under y↦j(F(y)+iy).
- `ellipticInterpolationImage.compact`: Z is compact in C.
- `ellipticInterpolationImage.meetsClass`: Every elliptic curve over Q̄ is isogenous to a curve with
  j∈Z.
- `ellipticInterpolationImage.periodCompatibility`: Its isogeny relation is the imported rational
  lattice relation, not a private equivalence on j-values.

*Needs:* §11.3; §11.1; §4.9; ModularCurvesPartII node `R12.1/pointed-elliptic-uniformization`;
ModularForms Layer 0 (the normalized `j`).

**Checks.**

- `ellipticInterpolationImage.imaginaryBounds`: Every period used has imaginary part between 1
  and 2.
- `ellipticInterpolationImage.algebraicCurve`: Z cannot be contained in a real algebraic curve.
- `ellipticInterpolationImage.complexContinuation`: The positivity assertion concerns real y∈[1,2];
  arbitrary complex parameters are not asserted to lie in ℋ_1.

### 11.5 Dense rational symplectic isogeny orbits

Prove `symplecticDenseSelection`. The action of Sp_{2g}(Q) on ℋ_g has dense orbit through every τ,
and each rational symplectic translate represents an isogenous principally polarized abelian
variety. Thus each enumerated algebraic class can meet a prescribed nonempty period neighbourhood.

(MZ20 §1.1 p.636; §5.4 pp.668–669.)

*Proof sketch.* Use density of Sp_{2g}(Q) in Sp_{2g}(R), continuity and transitivity of the real
action. Clear denominators on the symplectic rational lattice comparison to obtain an actual finite
isogeny.

*Needs:* ShimuraData node `D5/siegel-datum`; AbelianSchemesAndArithmeticModuli §A5.8 `SiegelFamily`.

### 11.6 A compact matrix interpolation image meeting all algebraic classes

Construct `matrixInterpolationImage`. For g≥2, choose distinct interpolation parameters t_n∈[1,2]
and representatives τ_n of all algebraic moduli points, modified by Sp_{2g}(ℚ) within their isogeny
classes. Newton interpolation constructs matrices F_x,F_w of entire functions, real on the real
line, with F_x(t_n)=x_n and F_w(t_n)=w_n, such that F(t)=F_x(t)+i(I+F_w(t)F_w(t)^t) lies in ℋ_g for
real t∈[1,2]. Its compact real-analytic parametrized image K=J(F([1,2])) meets every isogeny class
represented by A_g(ℚ̄). No embedded-curve or global closed analytic hypersurface assertion is part
of this construction.

(MZ20 §5.4 interpolation (50)–(60) pp.668–670.)

*Construction.* Choose symmetric x and nonsingular lower-triangular w meeting the current
coefficient tolerance; density moves the enumerated representative near x+i(I+ww^t). Use the
existing continuous Cholesky factor to retain the w tolerance for the moved imaginary part;
Lipschitz continuity is unnecessary. Construct entire scalar functions entrywise, impose symmetry
and real values on real parameters, and use I+ww^t>0 only on [1,2]. Continuity of J on the compact
parameter interval gives compact K; interpolation proves class coverage.

The API:

- `matrixInterpolationImage.interpolation`: F_x(t_n)=x_n and F_w(t_n)=w_n entrywise.
- `matrixInterpolationImage.symmetricRealPart`: F_x(t) is real symmetric for real t.
- `matrixInterpolationImage.positiveImaginaryPart`: I+F_w(t)F_w(t)^t is positive definite for real
  t, by the positivity of Gram matrices.
- `matrixInterpolationImage.compactImage`: K=J(F([1,2])) is compact.
- `matrixInterpolationImage.meetsClass`: Each algebraic A_g isogeny class meets K.
- `matrixInterpolationImage.choleskyCompatibility`: The factor for each selected positive-definite
  y−I is the existing TauCeti.cholesky, whose continuity preserves the source tolerance.

*Needs:* §11.1; §11.2; §11.5; Tau Ceti `TauCeti.cholesky`; Tau Ceti `TauCeti.continuous_cholesky`;
Mathlib `Matrix.PosDef.one`; Mathlib `Matrix.PosDef.add_posSemidef`; Mathlib
`Matrix.posSemidef_self_mul_conjTranspose`; PELModuli §M6.5 `coarseModuli`;
AbelianSchemesAndArithmeticModuli §A5.1 `AbelianLattice`, §A5.4 `polarizationType` and §A5.8
`SiegelFamily`.

**Checks.**

- `matrixInterpolationImage.zeroFactor`: At w=0 the imaginary part is I, still positive definite.
- `matrixInterpolationImage.energyIdentity`: For real v≠0, v^t(I+ww^t)v=‖v‖²+‖w^t v‖²>0.
- `matrixInterpolationImage.closedComplexHypersurface`: Compactness and real-analytic
  parametrization of K do not make it a globally closed complex analytic hypersurface.

### Examples

- For t_n=n+1, a₁=1 and all other a_n=0, F(z)=(z−t₀)/(t₁−t₀)=z−1.
- On the strip 1≤Im τ≤2 the elliptic interpolation image satisfies |j|≤2079+e^{4π}.
- For w=0 the imaginary part I+ww^t is I, positive definite; for real v≠0,
  v^t(I+ww^t)v=‖v‖²+‖w^tv‖²>0.

### Dependencies

Earlier layers: Layer 4. Other roadmaps: ModularCurvesPartII, ShimuraData,
AbelianSchemesAndArithmeticModuli, PELModuli.

## Layer 12: The full sixteen-torsion comparison problem

This is a separate research problem: strengthen hypersurface avoidance by requiring every
sixteen-torsion point to be rational over the same bounded-degree field. It needs an arithmetic
fine-level comparison and the total extension degree. The main theorem of Layer 10 does not use a
solution of this problem.

### 12.1 Arithmetic comparison cover for full level sixteen

Construct `arithmeticComparisonCover`. The required arithmetic comparison consists of a finite cover
π:Y→V₁₆ over a specified number field, a universal principally polarized abelian scheme on Y, and a
full symplectic or similitude sixteen-level trivialization with its exact cyclotomic-component
convention. Include an analytification comparison with the theta quotient that preserves both
polarization and level. The coefficient fields and generic comparison degree are data of the
construction. Obtaining such data with the numerical bound needed in §12.4 is an existence problem,
not a consequence of the complex analytic level alone.

(Motivation and source context: MZ20 p.637 supplementary sentence and §5.2 p.666.)

*Construction.* Start from the fine moduli space of principally polarized abelian varieties with
full level-16 structure and its universal family, with the perfect Weil pairing. Construct the
comparison cover of V_16 and descend the polarized model and the full torsion trivialization to the
stated number field. Keep every extension and cover degree for the bookkeeping of §12.3; the complex
congruence subgroup alone does not provide these data.

The API:

- `arithmeticComparisonCover.projection`: Y has its finite comparison map to the theta coordinate
  model.
- `arithmeticComparisonCover.universalFamily`: The pullback of the PEL universal polarized scheme
  carries the specified complete level trivialization.
- `arithmeticComparisonCover.degree`: The coefficient fields and generic comparison-cover degree are
  explicit.
- `arithmeticComparisonCover.analyticComparison`: Its analytification comparison preserves
  polarization and the exact congruence-level interpretation.

*Needs:* §8.11; PELModuli §M2.9 `PELModuli.universal` and §M5.2 `siegelModuli`; PELModuli §M6.5
`coarseModuli`; AbelianSchemesAndArithmeticModuli §A3.7 `polarizedWeilPairing` and §A3.8
`FullLevel`; AbelianSchemesAndArithmeticModuli §A5.1 `AbelianLattice`, §A5.4 `polarizationType` and
§A5.8 `SiegelFamily`.

**Checks.**

- `arithmeticComparisonCover.realBase`: A real residue field cannot carry a principally polarized
  family with all sixteen-torsion rational.
- `arithmeticComparisonCover.cyclotomicOnly`: Containing ζ_16 does not itself trivialize the entire
  Galois module.
- `arithmeticComparisonCover.degreeOne`: Even a geometrically degree-one comparison needs proof of
  its arithmetic descent field.

### 12.2 Full rational torsion forces cyclotomic containment

Prove `rationalTorsionCyclotomic`. Let (A,λ)/K be principally polarized of dimension g≥1 in
characteristic zero. If all A[16](K̄) are K-rational, then μ_16⊆K: choose an exact-order-16 point
and use perfection of the alternating Weil pairing to find a partner pairing to a primitive
sixteenth root.

(MZ20 p.637 supplementary claim; §5.2 p.666.)

*Proof sketch.* Take a point of exact order 16 and, by perfection of the alternating Weil pairing on
A[16], a partner pairing with it to a primitive sixteenth root of unity ζ. Both points are
K-rational, and the pairing is Galois-equivariant, so ζ is fixed by Gal(K̄/K) and μ_16⊆K. A number
field containing a primitive root of unity of order greater than two has no real place.

*Needs:* AbelianSchemesAndArithmeticModuli §A3.7 `polarizedWeilPairing`;
ArithmeticGaloisRepresentations §6.1 `tateModule_functoriality` and §6.2 `weilPairing_galois`;
Mathlib `NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt`.

### 12.3 The complete arithmetic comparison degree

Prove `fullDegreeBookkeeping`. For a proved comparison cover Y and Ψ_Y=Ψ∘π, use
D(Y,Ψ_Y)=[F_Y:Q][F_{Ψ_Y}:Q]D_{Ψ_Y}, including the comparison degree. Alternatively for a
residue-field tower K_θ⊆K_A⊆K_cyc=K_A(ζ_16)⊆K_tor, [K_tor:Q] is the product of all four successive
degrees and [K_cyc:K_A]≤8. The two descriptions must not count the same extension twice.

(MZ20 §1.2 (1) p.638; §5.2 p.666.)

*Proof sketch.* Use the tower law for degrees of the model and torsion fields. Identify which
degrees are already included by the cover map and coefficient fields. Prove every remaining factor;
the geometric theta degree and the cyclotomic upper bound leave further factors unbounded.

*Needs:* §12.1; §12.2; §8.14.

### 12.4 The supplementary rational-torsion problem

Pose the research problem `supplementaryTorsionTarget`. For g≥2, find a principally polarized
hypersurface-avoiding A/K with [K:ℚ]≤2^{16g⁴} and all A[16](K̄) rational over K. A solution must
prove the arithmetic comparison of §12.1 and its complete degree estimate in §12.3. Describing the
complex quotient by Γ(16,32) or defining its theta ratios over ℚ does not establish this stronger
conclusion. This problem is separate from Masser–Zannier Theorem 1.1.

(Motivation and source context: MZ20 p.637 after Theorem 1.1; §5.2 closing paragraph p.666.)

*What a solution must provide.* A solution must produce a hypersurface-avoiding point from a proved
arithmetic comparison cover with the full level interpretation, and bound its total field degree by
2^{16g⁴}, counting every comparison, descent and torsion extension. The printed theta argument does
not establish this stronger inequality; it is an open problem, and the main theorem does not depend
on it.

*Needs:* §10.1; §12.1; §12.3.

### Examples

- If A[16] is rational over K then μ₁₆⊆K, so [K:Q] is divisible by φ(16)=8 and K has no real place.
- Containing ζ₁₆ does not make A[16] rational: for y²=x³−2 over Q(ζ₁₆) the polynomial x³−2 stays
  irreducible (degrees 3 and 8 are coprime), so no point of order 2 is rational.
- In the tower K_θ⊆K_A⊆K_A(ζ₁₆)⊆K_tor the middle step has degree at most φ(16)=8.

### Dependencies

Earlier layers: Layer 8, Layer 10. Other roadmaps: PELModuli, AbelianSchemesAndArithmeticModuli,
ArithmeticGaloisRepresentations.

## Layer 13: Global analytic obstructions and a local existence problem

The projective Satake boundary rules out the proposed global analytic endpoint in genus at least
two. The remaining local construction is an existence problem with explicitly specified domains and
compatible equations; the obstruction theorem and the local specification come first, and an
existence theorem needs a further argument, not compactness.

### 13.1 Satake boundary below hypersurface dimension

Prove `satakeDimensionObstruction`. For g≥2 and G=g(g+1)/2, the projective Siegel Satake boundary
has dimension G−g and every pure analytic hypersurface in the open A_g has local dimension G−1>G−g.
At g=1 the inequality becomes equality and this obstruction argument does not apply.

(Le Fourn 2019 Definition–Proposition 6.4(a,b), printed p.181 (PDF p.24).)

*Proof sketch.* Use the exact Siegel boundary stratification and maximal genus-(g−1) stratum.
Compute its dimension and compare with the pure codimension-one dimension.

*Needs:* ShimuraVarieties §2.1 (`TauCeti.Shimura.rational_boundary`) and §2.7
`TauCeti.Shimura.baily_borel`.

### 13.2 Every globally closed analytic hypersurface is algebraic

Prove `closedHypersurfaceAlgebraic`. For g≥2, every globally closed pure analytic hypersurface
W⊂A_g(C) is algebraic. Its closure in the projective Satake compactification is analytic by the
singular-space Remmert–Stein extension across the lower-dimensional boundary, then algebraic by
Chow; restriction returns W because W is closed in A_g.

(Demailly, CADG Chapter II (8.7) p.118, proof pp.118–121; (8.10) p.121; Le Fourn 2019.)

*Proof sketch.* Take the closure of W in the projective Satake compactification. Its boundary has
dimension G−g < G−1 = dim W by §13.1, so the Remmert–Stein extension theorem in the possibly
singular normal ambient space shows the closure is analytic. Chow's theorem in projective space
makes it algebraic, and intersecting with A_g recovers W because W is closed in A_g.

*Needs:* §13.1; AlgebraicModuliForArithmeticGeometry §7.10.1 `ComplexAnalyticSpace`;
ComplexComparisonPartII §C4.1 `remmertSteinExtension` and §C4.2 `projectiveChowNonreduced`.

### 13.3 No globally closed transcendental interpolation hypersurface

Prove `noGlobalInterpolationHypersurface`. For g≥2, no globally closed pure analytic hypersurface
W⊂A_g(ℂ) meets every isogeny class represented by A_g(ℚ̄). Indeed §13.2 makes W algebraic, and §10.1
gives an algebraic point whose whole isogeny class avoids W. In particular the compact
class-covering image K of §11.6 cannot lie in such a hypersurface.

(Motivation and source context: MZ20 §5.4 pp.668–670.)

*Proof sketch.* Algebraize W by the previous theorem. Apply the main algebraic
hypersurface-avoidance theorem to find an algebraic A whose class misses W.

*Needs:* §13.2; §10.1; §11.6.

### 13.4 A local analytic hypersurface specification

Define `localHypersurfaceSpec`. A local replacement consists of an explicitly chosen open U⊆A_g(C)
containing K and a pure codimension-one analytic subset W_U closed relative to U, containing K.
Local defining equations must be defined on specified domains and have proved
compatibility/extensions on overlaps. A germwise or nonclosed replacement has its own separately
stated conclusion; no existence is supplied by this specification.

(Motivation and source context: MZ20 §5.4 pp.669–670.)

*Construction.* Record U, the analytic ideal or zero locus W_U and the inclusion K⊆W_U. Overlap
compatibilities are statements about local equations on specified domains; functions defined on
different domains are never multiplied.

The API:

- `localHypersurfaceSpec.ambient`: The specification exports an actual open U and the inclusion K⊆U.
- `localHypersurfaceSpec.relativeClosed`: W_U is closed as an analytic subset of U, not asserted
  closed in all A_g.
- `localHypersurfaceSpec.contains`: K⊆W_U.
- `localHypersurfaceSpec.overlap`: The specified local analytic ideals/equations restrict compatibly
  on every stated overlap.

*Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1 `ComplexAnalyticSpace`; §11.6.

**Checks.**

- `localHypersurfaceSpec.genusTwoGlobal`: Taking U=A_2 would force a class-covering closed
  hypersurface to be algebraic and contradict avoidance.
- `localHypersurfaceSpec.differentDomains`: A finite product of functions on different open sets is
  not a global equation without compatible extensions.
- `localHypersurfaceSpec.sameDomainProduct`: On a common domain, a finite product of holomorphic
  equations is holomorphic and its zero set is their union.

### 13.5 The local replacement existence problem

Pose the research problem `localReplacement`. Construct an open U⊆A_g(ℂ) and a relatively closed
pure codimension-one analytic subset W_U satisfying §13.4 for the compact image K, or formulate and
prove a precise germwise or nonclosed alternative. A construction must give the domains of all
equations and their overlap compatibility. A finite chart cover of K does not by itself extend those
equations to a common domain, so the compactness argument does not prove existence.

(Motivation and source context: MZ20 §5.4 pp.669–670.)

*What a solution must provide.* Find a candidate open U or a precise germ/nonclosed formulation.
Prove common-domain extensions and overlap compatibility of the local equations. Check that the
resulting target does not invoke the disproved global closed-hypersurface assertion.

The API:

- `localReplacement.specification`: A successful construction returns the actual specified U,W_U and
  containment of K.
- `localReplacement.equations`: All equation domains and their compatibility proofs are identified.
- `localReplacement.analyticComparison`: The constructed analytic subset is a closed analytic subset
  in the sense of AlgebraicModuliForArithmeticGeometry §7.10.1, not only a union of smooth-chart
  zero sets.

*Needs:* §13.4.

**Checks.**

- `localReplacement.globalImpossible`: A globally closed class-covering hypersurface in A_g is ruled
  out for g≥2.
- `localReplacement.compactnessInsufficient`: A finite cover of K by charts alone does not extend
  their equations to a common ambient domain.
- `localReplacement.restriction`: A valid relative analytic hypersurface restricts to one on every
  smaller open containing the required part of K.

### Examples

- For g=2, G=3: the Satake boundary has dimension G−g=1, below G−1=2, so §13.2 applies.
- For g=1, G=1: the Satake boundary is a point, of dimension 0=G−1, so the strict inequality of
  §13.1 fails and the obstruction argument gives nothing in genus one.
- A finite product of holomorphic functions on a common open set is holomorphic with zero set the
  union, but functions on different open sets cannot be multiplied.

### Dependencies

Earlier layers: Layer 10, Layer 11. Other roadmaps: ShimuraVarieties,
AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII.

## Downstream consumers

- **HeegnerPointEulerSystems** uses Serre's open-image theorem in the permitted dimensions (§6.4)
  for the adelic image of elliptic curves and abelian varieties with trivial endomorphism ring.

## References

- **MZ20.** D. Masser and U. Zannier, *Abelian varieties isogenous to no Jacobian*, Ann. of Math.
  191 (2020), 635–674, [published
  article](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf). Cited by
  printed page. The main results are Theorems 1.1, 1.3, 1.5 and 1.7 and Corollaries 1.2, 1.4
  and 1.6.
- **GR14.** É. Gaudron and G. Rémond, *Théorème des périodes et degrés minimaux d'isogénies*,
  Comment. Math. Helv. 89 (2014), 343–403, [published
  article](https://content.ems.press/assets/public/full-texts/serials/cmh/89/2/12625/online/10.4171-cmh-322.pdf).
- **GR23.** É. Gaudron and G. Rémond, *Nouveaux théorèmes d'isogénie*, Mém. Soc. Math. France 176
  (2023), [HAL hal-02445032](https://hal.science/hal-02445032).
- **Masser–Wüstholz.** *Estimating isogenies on elliptic curves*, Invent. Math. 100 (1990),
  1–24; *Periods and minimal abelian subvarieties*, Ann. of Math. 137 (1993), 407–458; *Isogeny estimates
  for abelian varieties, and finiteness theorems*, Ann. of Math. 137 (1993), 459–472; *Endomorphism
  estimates for abelian varieties*, Math. Z. 215 (1994), 641–653; *Factorization estimates for
  abelian varieties*, Publ. Math. IHÉS 81 (1995), 5–24,
  [Numdam](http://www.numdam.org/item?id=PMIHES_1995__81__5_0). These are cited at the locators
  given in MZ20 and Tsimerman 2018.
- **Pila 2011.** J. Pila, *O-minimality and the André–Oort conjecture for C^n*, Ann. of Math. 173
  (2011), 1779–1840, [published
  article](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p11-p.pdf).
- **Pila 2009.** J. Pila, *On the algebraic points of a definable set*, Selecta Math. 15 (2009),
  151–170 (Theorem 3.5, as cited in MZ20).
- **Pila–Wilkie 2006.** J. Pila and A. J. Wilkie, *The rational points of a definable set*, Duke
  Math. J. 133 (2006), 591–616.
- **Pila–Tsimerman 2014.** J. Pila and J. Tsimerman, *Ax–Lindemann for A_g*, Ann. of Math. 179
  (2014), 659–681, [published
  article](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf).
- **Pila–Tsimerman 2013.** J. Pila and J. Tsimerman, *The André–Oort conjecture for the moduli space
  of abelian surfaces*, Compos. Math. 149 (2013), 204–216,
  [arXiv:1106.4023](https://arxiv.org/abs/1106.4023).
- **Peterzil–Starchenko 2013.** Y. Peterzil and S. Starchenko, *Definability of restricted theta
  functions and families of abelian varieties*, Duke Math. J. 162 (2013), 731–765,
  [arXiv:1103.3110](https://arxiv.org/abs/1103.3110).
- **Tsimerman 2018.** J. Tsimerman, *The André–Oort conjecture for A_g*, Ann. of Math. 187 (2018),
  379–390, [published
  article](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf).
- **Tsimerman 2012.** J. Tsimerman, *Brauer–Siegel for arithmetic tori and lower bounds for Galois
  orbits of special points*, J. Amer. Math. Soc. 25 (2012), 1091–1117,
  [arXiv:1103.5619](https://arxiv.org/abs/1103.5619).
- **AGHMP 2018.** F. Andreatta, E. Z. Goren, B. Howard and K. Madapusi Pera, *Faltings heights of
  abelian varieties with complex multiplication*, Ann. of Math. 187 (2018), 391–531, [published
  article](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf).
- **Yuan–Zhang 2018.** X. Yuan and S.-W. Zhang, *On the averaged Colmez conjecture*, Ann. of Math.
  187 (2018), 533–638, [published
  article](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf).
- **ACZ18.** Y. André, P. Corvaja and U. Zannier, *The Betti map associated to a section of an
  abelian scheme*, with an appendix by Z. Gao,
  [arXiv:1802.03204v1](https://arxiv.org/abs/1802.03204).
- **Ullmo–Yafaev 2011.** E. Ullmo and A. Yafaev, *A characterization of special subvarieties*,
  Mathematika 57 (2011), 263–273 (Theorem 1.2, as cited in MZ20 and ACZ18).
- **van der Geer.** G. van der Geer, *Siegel modular forms and their applications*, in *The 1-2-3 of
  modular forms*, Springer 2008, [arXiv:math/0605346](https://arxiv.org/abs/math/0605346).
- **Demailly, CADG.** J.-P. Demailly, *Complex Analytic and Differential Geometry*, [author's
  manuscript](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Chapter
  II §8.2, (8.7)–(8.10), pp.118–121: (8.7) is stated for a complex-space ambient, singular spaces
  included; (8.10) is Chow's theorem.
- **Le Fourn 2019.** S. Le Fourn, *A tubular variant of Runge's method in all dimensions, with
  applications to integral points on Siegel modular varieties*, Algebra Number Theory 13 (2019),
  159–210, [published article](https://msp.org/ant/2019/13-1/ant-v13-n1-p04-s.pdf), §6,
  Definition–Propositions 6.3, 6.4(a,b) and Definition 6.5, pp.180–182.
- **BCCR 2017.** D. Benson, C. Campagnolo, A. Ranicki and C. Rovi, *Cohomology of symplectic groups
  and Meyer's signature theorem*, [author's
  manuscript](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/paper1.pdf), §2, p.3 (the diagonal
  conditions defining the Igusa subgroup).
- **Further sources cited through MZ20.** J.-i. Igusa, *Theta Functions*, Springer 1972 (pp.177–178
  normality, p.185 weight, pp.192–197 and Theorem 7 p.206 for reduction and the order estimate,
  p.208 for the Fourier index count); A. Cadoret, IMRN 2015, Theorem 1.2; R. Pink, in *Geometric
  Methods in Algebra and Number Theory*, 2005, p.274; J.-P. Serre, *Œuvres* IV, p.35; P.
  Deligne, *Théorie de Hodge II*, Publ. IHÉS 40 (1971), Lemma 4.4.16; D. Masser, Bull. SMF 124 (1996); S. D.
  Cohen, Proc. LMS 43 (1981); S. Grushevsky, *The Schottky problem* (2012), Theorem 3.8; C. G.
  Lekkerkerker, *Geometry of Numbers* (1969), p.63; J.-B. Bost, Duke Math. J. 1996 (the lower bound
  recalled in Tsimerman 2018, Theorem 2.1).
