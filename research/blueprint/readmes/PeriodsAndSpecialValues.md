# Periods, motivic L-values and special-value conjectures

This roadmap connects geometric comparison periods to special values of arithmetic L-functions. It fixes the comparison direction and rational structures first, then specifies critical-value algebraicity, actual evaluation of formal periods, regulator determinants, integral and equivariant leading-term statements, and the BSD and Bloch–Kato comparison interfaces. Two concrete developments put these conventions to work: mirror symmetry for the Dwork quartic and quintic, and the motivic proof of Hoffman spanning for multiple zeta values.

The scope is PS.0–PS.9. Conjectures are predicates with precise hypotheses; proved special cases enter only through source-qualified theorem witnesses. Certified numerical enclosures test normalization and nonvanishing but do not prove algebraicity or period-map injectivity. The quartic target includes its geometric marking and integral mirror map. The quintic target includes the formal Frobenius matrix and the specified bridge to the actual crystalline lattice. The multiple-zeta target includes the motivic Hoffman basis and numerical spanning; numerical independence is a separate conjectural assertion.

## Ownership and library inputs

The boundaries follow the neighbouring roadmap interfaces and the EllipticCurves link map:

- **MotivesAndAlgebraicCycles** owns the geometric motives and realizations (MC.2), relative framed motives (MC.4), and the full localized formal-period algebra and comparison torsor (MC.6). PS.2 supplies the actual integration evaluation and its normalization diagram. Generic finite quotients and relative resolutions require the separate geometry contract recorded below.
- **HodgeStructures** and **ComplexComparisonPartII** supply Hodge realizations, geometric comparison maps, relative integration and Gauss–Manin connections. This roadmap constructs the period invariants and family-specific reductions using those objects. **IntegralLattices**, current upstream Layers 5H and 6A, supplies primitive-embedding uniqueness in an even unimodular ambient lattice and indefinite unimodular classification. These targets are existing work.
- **ArithmeticGaloisRepresentations**, **NeronModelsAndSemistableAbelianVarieties**, **WeilConjectures**, **AutomorphicLFunctionsAndLocalFactors** and the modular-form suppliers own the local factors, compatible systems, analytic functions and special-value formulas. The motivic period identifications and normalization adapters are here.
- **PadicMeasuresIwasawaAlgebras**, **GeneralAlgebraicKTheory**, **MotivicEtaleKTheory**, **HigherRegulatorsAndSpecialValues**, **SelmerIwasawaCohomology**, **IntegralIwasawaTheory**, and the noncommutative Iwasawa suppliers own their generic determinants, K-theory, regulators, Selmer complexes and arithmetic theorem inputs. PS.3–PS.6 assemble their exact factors and orientations. The M.8 arithmetic-line contract must use independent MC.2/PS.0/L5 inputs so that this assembly introduces no dependency cycle.
- Existing upstream **EllipticCurves** Layers 1, 2, 4, 6 and 7 supply invariant differentials, Tate modules, local Tamagawa numbers, heights and the Sha/conditional BSD interface. The Layer 7 elementary real-period and BSD statement is over Q. General complex uniformization, second-kind de Rham bases and the geometric cycle comparison are separate comparison-supplier inputs. The EllipticCurves link map directs Layers 4, 6 and 7 to the corresponding PS.6 adapters; none of those layers is re-planned here.
- **PadicDifferentialEquationsAndRigidCohomology** and the crystalline comparison suppliers own the generic Dwork-to-crystalline bridge. PS.8 owns the selected families, residue reductions and boundary matrix. **BorelRegulators**, **MotivesAndAlgebraicCycles** and **NonabelianChabauty** supply the generic mixed-Tate extension and path objects; PS.9 owns the MZV presentations, coaction calculations and Hoffman argument. Generic polylogarithms are imported from **Polylogarithms**.

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. As recorded in the reviewed library audit, the pinned libraries supply matrix, exterior-power, Hodge, localization, integration, hypergeometric and tensor-word foundations, but no motivic comparison, formal-period evaluation, Gauss–Manin family, mixed-Tate category or MZV theory. Current upstream IntegralLattices supplies the generic lattice targets missing from the atlas snapshot. Its exact contracts are cited at the quartic marking target.

Tau Ceti at commit [a91d3aa](https://github.com/TauCetiProject/TauCeti/tree/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039) also has Gram-matrix integral lattices and their dual-coordinate API (`TauCeti.IntegralLattice.form_ofGramMatrix_basisFun_apply` and `mem_ofGramMatrix_basisFun_dualCarrier_iff`, `TauCeti/LinearAlgebra/IntegralLattice/StandardCoordinates.lean`). A future implementation uses that API for the quartic Gram form; its existence does not supply the geometric K3 marking or Nikulin uniqueness.

### Declarations consumed at the pins

- `mathlib:Matrix.det` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): Determinant of a finite square matrix over a commutative ring; coordinates only, not the determinant functor of complexes.
- `mathlib:Matrix.det_mul` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): det(AB)=det(A)det(B) over a commutative ring.
- `mathlib:Matrix.det_fin_zero` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): The determinant of a zero-by-zero matrix is one.
- `mathlib:IsLocalization.Away` (`Mathlib/RingTheory/Localization/Away/Basic.lean`): Localization at powers of one element, for commutative semirings.
- `mathlib:IsLocalization.Away.mul_invSelf` (`Mathlib/RingTheory/Localization/Away/Basic.lean`): The image of the localized element times invSelf is one.
- `tauceti:TauCeti.Hodge.tate` (`TauCeti/Geometry/Hodge/Tate/Basic.lean`): Integral Tate Hodge structure of weight −2m and type (−m,−m); its lattice map is the ordinary inclusion of integers into complex numbers, not a geometric 2πi comparison.
- `tauceti:TauCeti.Hodge.tate_F` (`TauCeti/Geometry/Hodge/Tate/Basic.lean`): Its Hodge filtration is the whole line for p≤−m and zero for p>−m.
- `mathlib:intervalIntegral` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`): Oriented interval integral, defined as the difference of the two Ioc Bochner integrals; use integrability before an analytic identity.
- `mathlib:intervalIntegral.norm_integral_le_of_norm_le` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`): For a≤b and an integrable majorant g, an a.e. norm bound on Ioc gives norm of the interval integral ≤ integral of g.
- `mathlib:intervalIntegral.integral_comp_mul_deriv'` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean`): Change of variables with HasDerivAt on uIcc, continuous derivative and g continuous on the image; apply to truncated nonsingular intervals.
- `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence` (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`): A.e. strong measurability, integrable domination and a.e. pointwise convergence imply convergence of Bochner integrals.
- `mathlib:IsLocalization.Away.lift` (`Mathlib/RingTheory/Localization/Away/Basic.lean`): A ring homomorphism sending the localized element to a unit extends to its away localization.
- `mathlib:MeasureTheory.Measure.haarMeasure` (`Mathlib/MeasureTheory/Measure/Haar/Basic.lean`): Normalized Haar measure attached to a positive compact set in a locally compact topological group with its Borel structure; apply the native Multiplicative type synonym for additive groups.
- `mathlib:MeasureTheory.Measure.infinitePi` (`Mathlib/Probability/ProductMeasure.lean`): Product of an arbitrary family of probability measures; it is zero by definition if the probability hypotheses fail. Normalize the good-prime factors before using it.
- `mathlib:Complex.Gamma_mul_Gamma_eq_betaIntegral` (`Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean`): For complex parameters of positive real part, Γ(s)Γ(t)=Γ(s+t)betaIntegral(s,t).
- `mathlib:Complex.Gamma_mul_Gamma_one_sub` (`Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean`): The complex Gamma reflection identity Γ(z)Γ(1−z)=π/sin(πz), with the library total-value convention.
- `mathlib:Finsupp.single` (`Mathlib/Data/Finsupp/Single.lean`): The free coordinate vector supported at a single word.
- `mathlib:Ideal.Quotient.mk` (`Mathlib/RingTheory/Ideal/Quotient/Defs.lean`): The canonical ring map into a quotient by an ideal.
- `mathlib:LinearIndependent` (`Mathlib/LinearAlgebra/LinearIndependent/Defs.lean`): Injectivity of Finsupp.linearCombination for the indicated vector family.
- `mathlib:PowerSeries.derivative` (`Mathlib/RingTheory/PowerSeries/Derivative.lean`): Formal derivative has coefficient (n+1) times coefficient n+1.
- `mathlib:PowerSeries.exp` (`Mathlib/RingTheory/PowerSeries/Exp.lean`): Formal exponential series over a Q-algebra, coefficient 1/n!; substitution requires a zero constant term.
- `mathlib:PowerSeries.mk` (`Mathlib/RingTheory/PowerSeries/Basic.lean`): Constructs a formal power series from its coefficient function.
- `mathlib:PowerSeries.substInv` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`): Compositional inverse for a zero-constant series with invertible linear coefficient; reuse rather than plan a generic inverse.
- `mathlib:Submodule.span` (`Mathlib/LinearAlgebra/Span/Defs.lean`): Smallest submodule containing the specified set; used for motivic spans and filtration.
- `mathlib:ordinaryHypergeometricSeries` (`Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`): FormalMultilinearSeries for the ordinary 2F1 coefficients over an RCLike field and normed algebra; does not supply 3F2 or analytic continuation.
- `mathlib:riemannZeta` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean`): Complex Riemann zeta as the zero-parameter even Hurwitz zeta; not a multiple-zeta function.
- `mathlib:riemannZeta_four` (`Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean`): riemannZeta(4)=π⁴/90 over C.
- `mathlib:riemannZeta_two` (`Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean`): riemannZeta(2)=π²/6 over C.
- `mathlib:zeta_nat_eq_tsum_of_gt_one` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean`): For natural k>1, riemannZeta(k) equals the complex tsum of reciprocal natural kth powers, with the zero summand zero.
- `tauceti:TauCeti.TensorWords.deconcatenation` (`TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented.lean`): Includes degree-zero tensor words and deconcatenation over all cuts, including the two outer cuts. This is not the shuffle multiplication.
- `tauceti:TauCeti.TensorWords.of` (`TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented.lean`): Includes degree-zero tensor words and the pure-word injection into the direct sum.
- `mathlib:PhragmenLindelof.horizontal_strip` (`Mathlib/Analysis/Complex/PhragmenLindelof.lean`): A holomorphic function continuous on a closed horizontal strip and bounded on both boundary lines is bounded inside if its growth is dominated by exp(B exp(c |Re z|)) for some c < π/(b−a). A finite-order entire quotient meets this growth condition.

## Conventions

Integration is β : H_dR ⊗ C ≃ H_B ⊗ C. Deligne's comparison is I = β⁻¹, and its determinant lies in Hom(det H_B, det H_dR) ⊗ C. With column coordinates and basis changes A on the source and C on the target, a comparison matrix transforms as C⁻¹ P A. Period coordinates modulo a coefficient field use one simultaneous E-unit across all embeddings; a single selected embedding gives only a component quotient.

For Q(−1) = H¹(G_m), β has scalar 2πi. The scalar of I on Q(n) is (2πi)^n. Geometric real Frobenius is E-linear; it is distinct from the semilinear conjugation on a complexified lattice. Deligne's plus/minus quotient comparison must itself be an isomorphism, including the rank-zero determinant convention 1. Local Euler factors are inverse characteristic polynomials. Normalized finite L-values may be zero; a unit-valued assertion has the additional nonvanishing hypothesis.

Determinant complexes carry their grading, dual/shift and local correction factors. An inverse determinant line alone does not identify the Fukaya–Kato and Burns–Venjakob leading-term conventions. The typed shifted/dual comparison and Bockstein normalization are supplier obligations. Integral assertions at 2 retain the real-place correction gate.

For the quartic, z = (4t)⁻⁴ is the Frobenius-series variable, while the unscaled hypergeometric variable is t⁻⁴ = 256z. Raw residue periods are t⁻¹ times the hypergeometric solutions, so the normalized form is tΩ. The marked lattice basis is (h,e,f) with Gram matrix [[4,0,0],[0,0,1],[0,1,0]], and the period line is [p,−1,2p²]. The local ratio at a real parameter s near 1 is pulled back by t = i·s to the marked chart at t = i. The based chart at t = 1 has the translated reflection in p−1. The two based loops retain their distinct markings.

MZVs use descending indices n₁ > ⋯ > n_d > 0, with k₁ ≥ 2 and every entry positive; the empty index has value 1. Reversal from ascending source notation reverses the whole word. In the Hoffman cut matrix, source words index rows and target pairs index columns; this explicit convention overrides the usual column-coordinate language for that combinatorial matrix. The bijection deletes a descending prefix 2^k3. Brown's shifted all-two term is the leading-zero shuffle-regularized integral Iᵐ(0;0(10)^n;1). Brown's nonnegative-weight algebra H retains nonzero ζᵐ(2) and its A ⊗ H coaction. PS.2's full Tate localization supplies arbitrary twists separately.

## Sources

Each target gives the theorem, section and page locator for its selected version. Source descriptions and mathematical statements are in this roadmap's own words. A locator in the Deligne translation refers to its PDF pagination; Hartmann findings refer only to the checked preprint. Source findings below distinguish author-final, published and uncollated versions.

- **Deligne** — Pierre Deligne, *Valeurs de fonctions L et périodes d’intégrales*. PSPM 33, Part 2 (1979), pp. 313–346; text read in Ghate–Beineke English translation, revised 2018. Page locators below refer explicitly to that translation PDF. Original French article not collated. [Source](https://mathweb.tifr.res.in/~eghate/Deligne.pdf).
- **HMS** — Annette Huber and Stefan Müller-Stach, *On the relation between Nori motives and Kontsevich periods*. arXiv:1105.0865v5 (21 May 2014) [Source](https://arxiv.org/pdf/1105.0865v5).
- **BCGP** — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. arXiv:1812.09269v3 (28 November 2021); not independently collated with the publisher version [Source](https://arxiv.org/pdf/1812.09269v3).
- **Serre** — Jean-Pierre Serre, *Facteurs locaux des fonctions zêta des variétés algébriques (définitions et conjectures)*. Séminaire Delange–Pisot–Poitou 11 (1969–70), exp. 19, pp. 1–15 [Source](https://numdam.org/article/SDPP_1969-1970__11_2_A4_0.pdf).
- **Tate** — John Tate, *Number theoretic background*. PSPM 33, Part 2 (1979), pp. 3–26; standalone article scan, printed p. 15 inspected [Source](https://ncatlab.org/nlab/files/TateNumberTheory.pdf).
- **BF** — David Burns and Matthias Flach, *Tamagawa numbers for motives with (non-commutative) coefficients*. Documenta Mathematica 6 (2001), pp. 501–570, publisher PDF [Source](https://ems.press/content/serial-article-files/25892?nt=1).
- **BV** — David Burns and Otmar Venjakob, *On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory*. Documenta Mathematica extra volume Coates (2006), pp. 165–209; author final with internal pages 1–45, independently collated with the published EMIS copy at the locators below [Source](https://www.mathi.uni-heidelberg.de/~otmar/papervenjakob/bock-final.pdf).
- **BK** — Spencer Bloch and Kazuya Kato, *L-functions and Tamagawa numbers of motives*. The Grothendieck Festschrift I (1990), pp. 333–400; standalone article supplied on academic site [Source](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf).
- **LTXZZ** — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*. Inventiones Mathematicae 228 (2022), pp. 107–375; published NSF Public Access Repository copy, DOI 10.1007/s00222-021-01088-4 [Source](https://par.nsf.gov/servlets/purl/10323568).
- **Johansson** — Fredrik Johansson, *Numerical integration in arbitrary-precision ball arithmetic*. arXiv:1802.07942v1 (2018) [Source](https://arxiv.org/pdf/1802.07942v1).
- **H** — Heinrich Hartmann, *Period- and mirror-maps for the quartic K3*. arXiv 1101.4601v1; downloaded PDF dated 29 October 2018; 29 PDF pages; findings E1–E4 apply only to this checked preprint [Source](https://arxiv.org/pdf/1101.4601v1).
- **LYA** — Bong H. Lian and Shing-Tung Yau, *Arithmetic Properties of Mirror Map and Quantum Coupling*. v3, 5 December 1994; author-preprint pagination, 32 pages [Source](https://arxiv.org/pdf/hep-th/9411234v3).
- **LYH** — Bong H. Lian and Shing-Tung Yau, *Mirror maps, modular relations and hypergeometric series I*. arXiv v1, 27 July 1995; 24 pages [Source](https://arxiv.org/pdf/hep-th/9507151).
- **SH** — Ilya Shapiro, *Frobenius map for quintic threefolds*. v2, 7 October 2008; 19 pages [Source](https://arxiv.org/pdf/0809.3742v2).
- **SS** — Albert Schwarz and Ilya Shapiro, *Twisted de Rham cohomology, homological definition of the integral and “Physics over a ring”*. arXiv preprint, 2008; downloaded version [Source](https://arxiv.org/pdf/0809.0086).
- **IKZ** — Kentaro Ihara, Masanobu Kaneko and Don Zagier, *Derivation and double shuffle relations for multiple zeta values*. Compositio Mathematica 142 (2006), 307–338; final author-hosted copy [Source](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf).
- **DG** — Pierre Deligne and Alexander Goncharov, *Groupes fondamentaux motiviques de Tate mixte*. IAS author preprint, 90 PDF pages; locators below use printed pages (PDF page = printed page + 2) [Source](https://www.math.ias.edu/files/deligne/Tate.pdf).
- **B** — Francis Brown, *Mixed Tate motives over Z*. v1, 7 February 2011; 19 pages; not the differently paginated Annals version [Source](https://arxiv.org/pdf/1102.1312).
- **Z** — Don Zagier, *Evaluation of multiple zeta values ζ(2,...,2,3,2,...,2)*. Annals of Mathematics 175 (2012), 977–1000; final author-hosted copy [Source](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4007/annals.2012.175.2.11/fulltext.pdf).
- **SO** — Ismaël Soudères, *Motivic double shuffle*. v3, 18 November 2008; 26 PDF pages; mathematical text also checked in ar5iv, and Proposition 3.8 and 4.24 locators checked visually in the PDF [Source](https://arxiv.org/pdf/0808.0248v3).
- **NS** — Masaru Nagura and Katsuyuki Sugiyama, *Mirror Symmetry of K3 and Torus*. arXiv author preprint, 28 December 1993; locators use printed pages (PDF page = printed page + 1) [Source](https://arxiv.org/pdf/hep-th/9312159).
- **IL** — Tau Ceti roadmap contributors, *Integral lattices, discriminant forms and primitive embeddings*. TauCetiRoadmap commit 070dc2becd74419e76303ede84b465ed4a69461f; current roadmap beyond the atlas snapshot [Source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/IntegralLattices/README.md).

## Layer overview

| Layer | Targets and role |
| --- | --- |
| PS.0 | Comparison spaces, determinant lines, real involutions, coefficient period classes, Deligne periods and normalization examples |
| PS.1 | Euler products, archimedean factors, criticality, algebraicity predicates, Artin/modular adapters and compatible systems |
| PS.2 | Actual evaluation of the MC.6 localized formal-period algebra and its comparison-torsor point |
| PS.3 | Rational fundamental lines, regulator trivializations and leading-term rationality |
| PS.4 | Integral lattices, finite/local determinant corrections and the real dyadic gate |
| PS.5 | Equivariant obstructions, ETNC predicates and source-qualified zeta-isomorphism adapters |
| PS.6 | Bloch–Kato data, elliptic/BSD assembly and Rankin–Selberg prediction and theorem gates |
| PS.7 | Certified quadrature and normalized-value enclosures; covariance and conjectural boundaries |
| PS.8 | Resolved Dwork quartic, geometric periods, mirror integrality; quintic connection, Frobenius and crystalline transport |
| PS.9 | Convergent and regularized MZVs, mixed-Tate periods, motivic coaction, Zagier evaluation and Hoffman basis/spanning |

The arithmetic route runs from PS.0–PS.2 through PS.3–PS.6, with PS.7 providing numerical checks. PS.8 uses the PS.0 comparison direction to identify geometric periods. PS.9 uses PS.2's actual localized evaluation and full comparison point to transfer motivic results to arbitrary mixed-Tate periods. Every dependency on another part is a node reference below. A named supplier contract is an input to implement, with its unresolved proof obligations stated after the targets.

## PS.0 — Comparison spaces and period lines

### Comparison determinant line

`PeriodsAndSpecialValues:PS.0/comparison-period-line` · construction · Planet: **Comparison determinant line**

For a genuine motive M/Q with coefficient number field E, a selected embedding into C and supplied finite free Betti and de Rham realizations B,D of equal rank d, let β:D⊗C ≃ B⊗C be the integration comparison and I=β⁻¹. Define the comparison period as the nonzero element det(I) of Hom(det B,det D)⊗C. In column coordinates P=[I], replacing Betti basis b by bA and de Rham basis d by dC gives P′=C⁻¹PA and det P′=det(C)⁻¹det(P)det(A). No existence of geometric realizations is asserted from arbitrary linear algebra.

**Hypotheses.**

- MC.2 supplies actual realization functors and tensor compatibilities; the imported C5 comparison supplies the smooth proper geometric cases. Extension to an admitted motive or projector is part of the supplied realization comparison, not a theorem for every motive.
- Use E⊗Q C when recording all coefficient embeddings; coordinate matrices refer to one component.

**Inputs.** `MotivesAndAlgebraicCycles:MC.2/realization-equivalence`, `PadicMeasuresIwasawaAlgebras:L5`, `mathlib:Matrix.det`, `mathlib:Matrix.det_mul`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5/multiplicative-period-interface`.

**Source and proof route.**

- **Deligne**, §0.4, p. 4; §5.1, pp. 15–16 (English translation PDF pages). Inverse integration comparison and its determinant-line interpretation.

1. Import the realization objects and comparison; invert β, rather than silently calling integration I.
2. Apply the supplied determinant-line functor to I; use Matrix.det and det_mul for its basis coordinates.
3. Check base change against the comparison functors; a chosen coordinate is not a canonical integral generator.

**API.**

- `comparison_period_line.matrix` (data): Return the matrix P of I in specified ordered bases.
- `comparison_period_line.line` (projection): Return Hom(det B,det D), independent of bases.
- `comparison_period_line.basis_change` (functoriality): P′=C⁻¹PA, with the displayed determinant transformation.
- `comparison_period_line.embedding_change` (compatibility): Scalar extension along σ:E→C gives the σ-component of the E⊗C comparison.
- `comparison_period_line.direct_sum` (compatibility): The determinant of a block sum is the tensor product, using the determinant functor’s grading and ordering.

**Checks and worked examples.**

- `comparison_period_line.empty` (characterisation): Rank zero has period one, not zero.
- `comparison_period_line.rank_one` (characterisation): For I(z)=αz, the coordinate is α; replacing the Betti basis by 2b multiplies it by 2.
- `comparison_period_line.inverse` (characterisation): If integration on H¹(Gm) has matrix [2πi], the I-matrix is [(2πi)⁻¹].

**Consumers.**

- `PS.1 and PS.3`: Extract periods in critical-value and regulator formulas.
- `PS.8`: Distinguish an actual geometric period normalization from a formal solution.

### Real comparison and conjugation

`PeriodsAndSpecialValues:PS.0/real-infinity` · theorem · Planet: **Real comparison**

For a real embedding and an actual realization, F∞:B→B is E-linear with F∞²=1 and carries H^{p,q} to H^{q,p}. After scalar extension, I intertwines F∞⊗complex conjugation on B⊗C with the scalar real structure on D⊗C. Thus B=B⁺⊕B⁻ over E, with projections (1±F∞)/2. The canonical semilinear lattice conjugation of a Hodge structure is a different operator from F∞.

**Hypotheses.**

- Characteristic zero; the comparison and real structures are the geometric ones.

**Inputs.** `PeriodsAndSpecialValues:PS.0/comparison-period-line`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`.

**Source and proof route.**

- **Deligne**, §0.2.5, p. 3; Proposition 1.4, p. 7 (English translation PDF pages). Geometric infinity action and comparison real structure.

1. Import naturality under the real embedding from MC.2/ComplexComparison.
2. Apply Deligne Proposition 1.4 to I; diagonalize the E-linear involution using 2 invertible.
3. Do not substitute the pinned Hodge lattice conjugation for the independent geometric F∞.

**Milestone checks.**

- On Q(1), F∞ is −1 although the ordinary lattice real structure fixes integers.
- A swapped pair H^{p,q},H^{q,p} contributes one plus and one minus dimension.

### Coefficient-field period class

`PeriodsAndSpecialValues:PS.0/period-class` · definition · Planet: **Coefficient-field period class**

For the comparison line of M with coefficient field E, define its basis-independent period class in (E⊗Q C)×/E×, where a single u∈E× acts through all embeddings simultaneously. In a selected component it is a class in C×/σ(E×). Equality of these classes means a specified coefficient-field unit relates two nonzero periods; it does not mean equality of scalars or equality of integral generators.

**Hypotheses.**

- A trivialization of each E-determinant line, and the comparison from PS.0/comparison-period-line.

**Inputs.** `PeriodsAndSpecialValues:PS.0/comparison-period-line`.

**Source and proof route.**

- **Deligne**, §2.6, p. 11; Conjecture 2.8, p. 12 (English translation PDF pages). Periods over E and their simultaneous E× ambiguity.

1. Use the action of E× on nonzero comparison coordinates.
2. The basis transformation formula shows that changing E-bases preserves the orbit.
3. Transport the orbit under coefficient embeddings; require one E-element rather than independently chosen algebraic factors.

**API.**

- `period_class.mk` (constructor): A nonzero coordinate determines an orbit.
- `period_class.eq_iff` (characterisation): Two tuples represent the same orbit iff their ratio is the diagonal image of one u∈E×.
- `period_class.basis_invariant` (compatibility): Changing E-bases leaves the class unchanged.
- `period_class.multiply` (structure): Tensoring comparison lines multiplies their period classes.
- `period_class.at_embedding` (projection): Evaluation at σ descends to C×/σ(E×).
- `period_class.one` (simp): The class of the constant tuple 1 is the multiplicative identity.
- `period_class.inverse` (compatibility): Dualizing the comparison line inverts its period class; multiplication by this class gives the identity.

**Checks and worked examples.**

- `period_class.rational_factor` (characterisation): For E=Q, 2α and α have the same class for α≠0, but need not be equal.
- `period_class.zero_excluded` (characterisation): Zero is not a period-class representative.
- `period_class.simultaneous` (characterisation): For E=Q(√2), tuples (√2,−√2) and (1,1) are equivalent, while (√2,√2) and (1,1) are not.

**Consumers.**

- `Deligne §2.8 and PS.1`: State simultaneous algebraicity across coefficient embeddings.
- `PS.7`: Prevent numerical equality being inferred from equality of period classes.

### Deligne plus and minus periods

`PeriodsAndSpecialValues:PS.0/deligne-periods` · construction · Planet: **Deligne periods**

For a pure realization for which the middle Hodge summand H^{w/2,w/2}, if present, has scalar F∞, choose the filtration cuts F⁺,F⁻ of dimensions d⁺=dim_E B⁺ and d⁻=dim_E B⁻ as in Deligne §1.7. Put D^±=D/F^∓. Whenever the induced I^±:B^±⊗C→D^±⊗C are isomorphisms, define c^±(M)=det(I^±), as nonzero elements of their determinant lines and then period classes. Record δ(M)=det I separately. A rank-zero sign has determinant one.

**Hypotheses.**

- The precise Hodge-filtration cuts exist with the stated dimensions and induced comparisons are isomorphisms; equal dimensions alone do not suffice.
- For a critical twist M(m), these conditions follow from the Hodge criterion, not from general analytic continuation.

**Inputs.** `PeriodsAndSpecialValues:PS.0/real-infinity`, `PeriodsAndSpecialValues:PS.0/period-class`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source and proof route.**

- **Deligne**, §§1.5–1.7, p. 8; §2.6, p. 11; (5.1.8), p. 16 (English translation PDF pages). Filtration quotients, sign periods and Tate-twist formula.

1. Use real-infinity to form E-linear eigenspaces.
2. Apply the actual filtration quotient maps and check the Hodge criterion of Deligne §1.7.
3. Take determinants using the common grading convention and period-class construction.

**API.**

- `deligne_periods.plus` (projection): Return the determinant of I⁺ with its source and target lines.
- `deligne_periods.minus` (projection): Return the determinant of I⁻, retaining the sign label.
- `deligne_periods.quotient_iso` (characterisation): Certify the actual induced isomorphism, not just rank equality.
- `deligne_periods.twist` (compatibility): c^±(M)=(2πi)^(−n d^±(M)) c^{±(−1)^n}(M(n)) as period classes.
- `deligne_periods.basis_units` (compatibility): Both sign periods transform by the determinant factors of their own E-bases.

**Checks and worked examples.**

- `deligne_periods.unit` (characterisation): For Q(0), c⁺=1 and the zero-dimensional c⁻=1.
- `deligne_periods.odd_twist` (characterisation): A twist by one swaps the plus/minus dimensions; ignoring the sign swap fails.
- `deligne_periods.singular_quotient` (characterisation): A noninvertible map between equal-dimensional spaces is rejected as a period comparison.

**Consumers.**

- `Deligne Conjecture 2.8`: Normalize the critical finite value of M(m).
- `PS.3`: Compare determinants with the real regulator exact sequence.

### Tate and elliptic normalization examples

`PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations` · application

Choose the counterclockwise loop on Gm and the form dz/z. Integration on Q(−1)=H¹(Gm) is 2πi, so Deligne’s I has δ(Q(n))=(2πi)^n, F∞=(−1)^n and type (−n,−n). For an elliptic curve E/R with oriented integral cycles γ₁,γ₂ and an algebraic de Rham basis ω,η, write the integration matrix B=(∫γᵢωⱼ)_{i,j}; the column-coordinate comparison is β=Bᵗ and I=(Bᵗ)⁻¹. The all-components real Néron period is the number of components times the positive identity-component integral. Relating it to a primitive B⁺ cycle requires the integral index at 2, not only a rational eigenspace. In the concrete curve y²=x(1−x)(1−x/2), take ω=dx/(2y), η=xω. Let γ_a traverse [0,1] with y positive and return on the opposite sheet, and γ_b traverse [1,2] with y=−i√(x(x−1)(1−x/2)) and return on the other sheet. Put K=∫₀¹dt/√((1−t²)(1−t²/2)), J=∫₀¹t²dt/√((1−t²)(1−t²/2)), H=∫₁²x dx/(2√(x(x−1)(1−x/2))). Then the row-cycle integration matrix is B=[[2K,2J],[2iK,2iH]], with the positive-imaginary γ_b orientation and the complementary-modulus identity at 1/2. Its column comparison is (Bᵗ)⁻¹; equivalently if a=2K,b=2J,c=2iK,d=2iH, it is (ad−bc)⁻¹[[d,−c],[−b,a]]. No numerical approximation is used to assert this equality.

**Hypotheses.**

- Import the algebraic elliptic curve and invariant differential from EllipticCurves, and the actual proper-curve de Rham/integration comparison from C5. EllipticCurves does not supply complex uniformization. For the explicit example, identify xω as a second-kind de Rham class and the displayed closed paths as the chosen homology basis; this geometric comparison is an explicit C5 contract.
- The basis matrix is nonsingular; orientation and form/cycle order fixed.

**Inputs.** `PeriodsAndSpecialValues:PS.0/deligne-periods`, `tauceti:TauCeti.Hodge.tate`, `tauceti:TauCeti.Hodge.tate_F`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5/multiplicative-period-interface`, `ComplexComparisonPartII:C5/regular-singular-de-rham-comparison`, `ComplexComparisonPartII:C5/curve-residue-localization`, `ComplexComparisonPartII:C5`.

**Source and proof route.**

- **Deligne**, §3.1, pp. 13–14; §4.1, p. 14 (English translation PDF pages). Tate integration normalization and the components factor in real abelian periods.

1. Evaluate dz/z on the chosen loop and invert the comparison.
2. Use the already constructed Tate Hodge type; supply the geometric comparison scalar separately.
3. Form the elliptic matrix with rows cycles and columns forms, then transpose before inverting.
4. Import the all-components real-period convention and keep its lattice index visible.
5. For the displayed curve substitute x=t² on γ_a and x=1/(1−u²/2) on the half γ_b path; this gives its complementary K integral. Evaluate η on the same paths to obtain J,H, then apply the inverse-transpose formula. The actual geometric comparison supplies nonsingularity.

**Milestone checks.**

- Q(1) has I-period 2πi, and Q(−1) its inverse.
- The elliptic comparison is inverse transpose of the displayed row-cycle integration matrix.
- Two real components multiply the identity-component period by 2; replacing a cycle basis by index 2 changes its determinant.
- On the displayed λ=1/2 curve, the first column of B is (2K,2iK), so replacing I by β or omitting the transpose fails the explicit matrix test.

## PS.1 — Critical values and algebraicity statements

### Motivic Euler product

`PeriodsAndSpecialValues:PS.1/motivic-euler-product` · definition · Planet: **Motivic Euler product**

A weakly compatible system R consists of a number field E⊂C, a finite bad set S, monic degree-d polynomials Q_v over E for v∉S, continuous semisimple representations over algebraic closures of E_λ r_λ unramified away from Sλ with those Frobenius characteristic polynomials, de Rham local restrictions at v|λ (crystalline outside S), and multisets H_τ for τ:F→Ebar agreeing with the labelled Hodge–Tate weights under every embedding Ebar→Ebar_λ over E. Strict compatibility additionally supplies, at every finite v, a WD representation over an algebraic closure of E whose scalar extension under every coefficient embedding equals WD(r_λ|G_v)^{F-ss}, including v|λ. Purity of weight w is the existing monodromy-filtration purity of each supplied WD representation; no descent of r_λ to E_λ is implicit. For this admitted system with Hodge/infinity realizations, import P_v(T)=det(1−T Fr_geom | (ker N_v)^{I_v}) and L_v=P_v(q_v^(−s))⁻¹. Define L_fin by its absolutely convergent Euler product for Re(s)>1+w/2; the proof bounds the local reciprocal roots by q_v^(w/2) and compares the resulting prime sum with the trivial-character Hecke Euler product. L_fin^S omits S. Retain every bad-place WD factor. Use local conductor exponents with an explicitly supplied global base-field/discriminant normalization N(R). Continuation is separate analytic data.

**Hypotheses.**

- Strict compatibility includes the Frobenius-semisimplified WD comparison for every coefficient place, including v above its residue characteristic.
- The imported monodromy-filtration purity bounds the eigenvalues on ker N by q_v^(w/2); Hodge and infinity data are additional inputs when not supplied by geometry.

**Inputs.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification-construction`, `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`, `ArithmeticGaloisRepresentations:R01.3`, `AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison`, `mathlib:Matrix.det`, `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`, `AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function`.

**Source and proof route.**

- **BCGP**, §2.8, pp. 35–37. Strict compatibility, purity and the Euler product from Weil–Deligne representations.
- **Deligne**, §§1.1–1.2, p. 6 (English translation PDF pages). Admitted local factors and finite Euler products.

1. Import the actual continuous Galois representations, local WD construction and conductor exponents from AGR; formulate the BCGP compatible-system predicate here. AGR R01.5 recognition is not a construction of compatible systems.
2. Apply determinant polynomials on inertia-invariant monodromy kernels; prove coefficient-embedding independence using strict compatibility.
3. For Re(s)>1+w/2, bound the local reciprocal roots and compare the absolute logarithmic series with the supplier’s trivial-character Hecke Euler product. Keep full and partial products and their finite ratio distinct.

**API.**

- `motivic_euler_product.local_polynomial` (projection): Return P_v with Frobenius, inertia and monodromy conventions.
- `motivic_euler_product.coefficient_embedding` (compatibility): Changing λ or embedding gives the image of the same E-polynomial under strict compatibility.
- `motivic_euler_product.finite_product` (constructor): Construct the convergent product on its convergence domain.
- `motivic_euler_product.remove_primes` (relation): L_fin^S=L_fin·∏_{v∈S}P_v(q_v^(−s)) wherever both sides are defined.
- `motivic_euler_product.conductor` (projection): Return the positive global conductor and a ledger of its local/discriminant normalization.
- `motivic_euler_product.unramified_adapter` (compatibility): Compare with AL.4 only through a proved local Satake–Galois compatibility.

**Checks and worked examples.**

- `motivic_euler_product.unit` (characterisation): The unit motive over Q has P_p(T)=1−T and Euler product ζ(s) for Re(s)>1.
- `motivic_euler_product.monodromy` (characterisation): On a nontrivial two-dimensional Steinberg WD block only the one-dimensional (ker N)^I contributes.
- `motivic_euler_product.omission` (characterisation): Removing one good factor multiplies the finite L-function by P_v(q_v^(−s)); it does not divide by it.

**Consumers.**

- `BCGP §2.8 and AbelianSurfacesPotentialModularity`: State continuation for the actual system attached to H¹(A).
- `ModularityAndLanglandsExtensions:ML.0`: Import this common motivic completion interface.

### Archimedean factors and completion

`PeriodsAndSpecialValues:PS.1/archimedean-completion` · construction · Planet: **Motivic completion**

For a pure Hodge realization over Q, use Γ_R(s)=π^(−s/2)Γ(s/2). A real conjugate pair (p,q),(q,p), p<q, contributes Γ_C(s−p)^{h^{p,q}}. A middle (p,p) block on which F∞=(−1)^{p+ε}, ε∈{0,1}, contributes Γ_R(s+ε−p) to its dimension. In Deligne convention Γ_C,D(s)=2(2π)^(−s)Γ(s); in BCGP convention Γ_C,B(s)=(2π)^(−s)Γ(s). At a complex place v, choose one embedding above v and use ∏_{p,q}Γ_C(s−min(p,q))^{h_v^{p,q}}, counting each ordered Hodge type at that embedding once; do not count its conjugate embedding again. Define Λ=L_fin·L_∞, with no conductor half-power absorbed. If b is the total number of complex gamma blocks counted with multiplicity, Λ_D=2^bΛ_B. Export this normalization map before transporting any value or epsilon factor.

**Hypotheses.**

- Actual Hodge data and infinity action from PS.0; complex-place factors obey the chosen field restriction convention.
- Gamma poles and continuations are the analytic functions, not values of Mathlib’s totalized Gamma at poles.

**Inputs.** `PeriodsAndSpecialValues:PS.1/motivic-euler-product`, `PeriodsAndSpecialValues:PS.0/real-infinity`, `AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`.

**Source and proof route.**

- **Deligne**, §§5.2–5.3, pp. 17–18 (English translation PDF pages). Gamma factors from Hodge numbers and infinity signs.
- **BCGP**, (2.8.4), p. 37. The conductor is not included in Λ and Γ_C has no prefactor 2.
- **Serre**, §§3.1–3.3, printed pp. 19-10–19-11 (PDF pp. 11–12). Archimedean factors attached to real and complex Hodge structures.

1. Form the finite archimedean product from Deligne §§5.2–5.3 and Serre §3.
2. Compare the two Γ_C normalizations one block at a time.
3. Multiply with the finite Euler product on its convergence region; continuation remains a separate predicate.

**API.**

- `archimedean_completion.gamma_factor` (projection): Return each gamma block with shift and multiplicity.
- `archimedean_completion.completed` (constructor): Λ=L_fin·∏_{v|∞}L_v in the specified normalization.
- `archimedean_completion.normalization_bridge` (equivalence): Λ_D=2^bΛ_B with b counting every block, including field embeddings.
- `archimedean_completion.finite_value` (projection): Recover L_fin=Λ/L_∞ at points where L_∞ is finite and nonzero.
- `archimedean_completion.twist` (compatibility): For Tate twist n, L_∞(M(n),s)=L_∞(M,s+n).

**Checks and worked examples.**

- `archimedean_completion.unit` (characterisation): For Q(0), L_∞=Γ_R(s), with a pole at s=0.
- `archimedean_completion.surface` (characterisation): For H¹ of an abelian surface over totally real F, BCGP has Γ_C,B(s)^2 per real place and Λ_D/Λ_B=2^(2[F:Q]).
- `archimedean_completion.diagonal_sign` (characterisation): A (0,0) block with F∞=−1 has Γ_R(s+1), not Γ_R(s).
- `archimedean_completion.complex_place` (computation): At one complex place, Hodge types (0,1) and (1,0), each of multiplicity one, contribute Γ_C(s)^2; using a single real-pair block loses a factor.

**Consumers.**

- `BCGP Theorem 9.3.1`: Compare automorphic and motivic functional-equation normalizations.
- `Deligne criticality`: Read poles of both the system and its dual.

### Critical integer

`PeriodsAndSpecialValues:PS.1/critical-integer` · definition · Planet: **Critical integer**

An integer m is critical for M precisely when the meromorphic factors L_∞(M,s) and L_∞(M∨,1−s) are both regular at s=m. For a real off-diagonal pair p<q this means p<m≤q. A real diagonal block (p,p,ε) requires both m+ε−p and 1−m+ε+p to avoid {0,−2,−4,…}. Take the conjunction over all nonzero Hodge blocks. This definition only concerns infinity factors and says nothing about vanishing or poles of L_fin.

**Hypotheses.**

- Pure geometric Hodge realization and duality; the analytic gamma-pole theorem from AL.1.

**Inputs.** `PeriodsAndSpecialValues:PS.1/archimedean-completion`, `PeriodsAndSpecialValues:PS.0/deligne-periods`, `AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`.

**Source and proof route.**

- **Deligne**, Definition 1.3, p. 6; §1.3, p. 7; §§5.2–5.3, pp. 17–18 (English translation PDF pages). Simultaneous regularity and its Hodge description.

1. Substitute the Hodge gamma shifts and their dual shifts.
2. Use the gamma pole set and purity to derive the off-diagonal interval.
3. Keep the dual test even when the first factor is regular; correct the translation’s §2.3(ii) sign as recorded in E2.

**API.**

- `critical_integer.iff_regular` (characterisation): Criticality is equivalent to regularity of both indicated meromorphic germs.
- `critical_integer.off_diagonal` (characterisation): For a lone p<q pair, critical m are exactly p<m≤q.
- `critical_integer.diagonal` (characterisation): Use the two displayed shifted even-nonpositive exclusions.
- `critical_integer.twist` (compatibility): m is critical for M iff 0 is critical for M(m).
- `critical_integer.embedding` (compatibility): The Hodge criterion is transported along coefficient embeddings.

**Checks and worked examples.**

- `critical_integer.zeta` (characterisation): For Q(0), precisely positive even and negative odd integers are critical; 0 is not.
- `critical_integer.modular` (characterisation): A Hodge pair (0,k−1),(k−1,0), k≥2, has critical integers 1,…,k−1.
- `critical_integer.dual_needed` (characterisation): For Q(0), m=1 passes Γ_R(m) but fails Γ_R(1−m); it is not critical.

**Consumers.**

- `Deligne §1.8/§2.8`: Limit conjectural algebraicity to critical integers.
- `PS.7`: Reject normalization tests at gamma poles.

### Deligne normalized-value predicate

`PeriodsAndSpecialValues:PS.1/deligne-algebraicity` · definition · Planet: **Deligne algebraicity**

For a critical m, a supplied meromorphic continuation regular at m, and simultaneous coefficient-embedding values L_fin^*(M,m)∈E⊗C, where the star here denotes the tuple of ordinary finite values, allowing zero, rather than a nonzero leading coefficient, let DeligneAlgebraic(M,m) mean L_fin^*(M,m)/c⁺(M(m)) lies in the diagonal image of E. Its nonzero refinement requires this ratio in E×. Use the finite value, the plus period of the twisted motive and its induced sign, not Λ(M,m). The predicate includes that a single coefficient element realizes all embedding components; it is invariant under E-basis changes. General Deligne algebraicity and any nonvanishing assertion are separate conjectural assumptions.

**Hypotheses.**

- All realizations and periods are from PS.0; analytic continuation and regularity are supplied or separately assumed.
- Periods are nonzero; a chosen representative is recorded for exact scalar formulas.

**Inputs.** `PeriodsAndSpecialValues:PS.1/critical-integer`, `PeriodsAndSpecialValues:PS.0/period-class`, `PeriodsAndSpecialValues:PS.0/deligne-periods`.

**Source and proof route.**

- **Deligne**, Conjecture 1.8, p. 8; §2.6 and Conjecture 2.8, pp. 11–12; (5.1.8), p. 16 (English translation PDF pages). The finite-value conjecture, simultaneous E-rationality and twist normalization.

1. Use the critical twist to construct c⁺ and its coefficient-field class.
2. Define membership in the diagonal coefficient algebra, and then the stricter unit version.
3. Use the basis-change and embedding formulas to establish independence of period representatives.

**API.**

- `deligne_algebraicity.ratio` (projection): Return the normalized finite value for chosen period bases.
- `deligne_algebraicity.iff_coefficient` (characterisation): Algebraicity means existence of one a∈E giving all embedding components.
- `deligne_algebraicity.unit_iff` (characterisation): The unit predicate is algebraicity plus nonzero value in every coefficient component.
- `deligne_algebraicity.basis_invariant` (compatibility): Replacing c by u c, u∈E×, replaces a by a/u.
- `deligne_algebraicity.galois` (functoriality): Reindexing embeddings transports a to its corresponding conjugate; it does not introduce independent coefficients.

**Checks and worked examples.**

- `deligne_algebraicity.zero` (characterisation): The zero normalized value satisfies coefficient membership but not the unit predicate.
- `deligne_algebraicity.zeta_two` (characterisation): With Q(2) period (2πi)^2, ζ(2)/(2πi)^2=−1/24.
- `deligne_algebraicity.completion` (characterisation): Using Γ_R(2)ζ(2) in the same formula changes the ratio and is rejected as the finite-value interface.

**Consumers.**

- `Deligne Conjecture 2.8`: Keep the conjecture distinct from proved Dirichlet/modular adapters.
- `PS.7`: Compare exact coefficients only after a period representative is fixed.

### Dirichlet and Tate motivic adapter

`PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter` · comparison

For a primitive Dirichlet character χ with coefficient field E, fixed complex embedding and the actual Artin motive Aχ whose finite Euler factors equal those of L(χ,s), transport the L0 Bernoulli/Gauss identities and AL.1 functional equation to the Deligne normalization of Aχ(m). Record χ versus its inverse, parity, conductor and the chosen Gauss-sum sign through an explicit period identification. At 1−n, n≥1, the finite value is the complex image of −B_{n,χ}/n in the supplier’s character convention. A positive critical value uses the imported functional equation and the correct dual character. For an induced character keep each omitted Euler polynomial; a vanishing polynomial requires the supplier’s leading-term correction, not division.

**Hypotheses.**

- Actual Artin realization and its period/Gauss comparison supplied; no arbitrary one-dimensional representation asserted motivic.
- The L0 principal-conductor-one endpoint convention is B₁(1)=+1/2; retain exceptional zeros and local conductors.

**Inputs.** `PeriodsAndSpecialValues:PS.1/deligne-algebraicity`, `PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations`, `DirichletPadicLFunctions:L0/normalized-value-complex-embedding`, `AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term`, `MotivesAndAlgebraicCycles:MC.2`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`.

**Source and proof route.**

- **Deligne**, §3.1–3.2, pp. 13–14; §§6.3–6.7, pp. 20–22 (English translation PDF pages). Tate powers and Artin period/Gauss normalization; analytic identities are imported from their owners.

1. Match Euler polynomials and the character/inverse convention before applying L0.
2. For nonpositive critical arguments use the embedded Bernoulli identity; for positive ones use AL.1 and the dual Gauss factor.
3. Apply PS.0 Tate scaling and the proved Artin period identification; transport finite corrections from AL.5.

**Milestone checks.**

- ζ(−1)=−1/12 and ζ(2)/(2πi)^2=−1/24 are distinct critical examples.
- ζ(0)=−1/2 follows from L0 but is not a critical value of Q(0).
- Changing primitive conductor to an induced modulus retains the exact missing-prime factors; no normalized quotient is formed when one is zero.

### Modular motivic period comparison

`PeriodsAndSpecialValues:PS.1/modular-period-adapter` · comparison

For a normalized cuspidal eigenform f over Q of weight k≥2 in the exact GL2 scope of AL.5, its supplied rank-two motive M_f has Hodge types (0,k−1),(k−1,0) and critical integers 1≤m≤k−1. Import the AL.5 formula using its modular-symbol periods Ω_f^±, then prove the comparison of those rational structures with c^±(M_f) in E×-classes. Only after this identification transport the formula with (2πi)^m and sign (−1)^m. For a scalar equality specify integral cycles, invariant differential and the comparison coefficient; period-class equality alone proves no canonical scalar identity. Retain conductor, ramified factors and imprimitive zero-factor leading terms.

**Hypotheses.**

- The motive, its eigenprojector and comparison are actual supplied constructions; the chosen coefficient field contains the eigenvalues.
- This target makes no general Rankin or arbitrary number-field algebraicity assertion beyond its supplier’s scope.

**Inputs.** `PeriodsAndSpecialValues:PS.1/deligne-algebraicity`, `AutomorphicLFunctionsAndLocalFactors:AL.5/critical-value-period-interface`, `AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction`, `AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term`, `MotivesAndAlgebraicCycles:MC.2`.

**Source and proof route.**

- **Deligne**, §7.8, p. 25; (5.1.8), p. 16 (English translation PDF pages). Modular critical-value normalization and its sign/Tate dependence.

1. Compare the modular-symbol Betti rational structure and algebraic de Rham eigenclass via the geometric comparison.
2. Use the weight-(k−1) Hodge pair to determine the critical interval and twist sign.
3. Transport the imported critical-value formula and finite Euler corrections through the explicit period identification.

**Milestone checks.**

- For k=2 only m=1 is critical, with the minus-sign period before the Tate factor.
- Replacing Ω by uΩ changes its exact coefficient by u⁻¹ while preserving the E× class.
- A zero local correction is handled at the correct derivative order.

### Serre compatible-system predicate

`PeriodsAndSpecialValues:PS.1/serre-system-predicate` · definition · Planet: **Serre functional equation**

For the BCGP-normalized completion of an admitted strictly compatible system R, define SerreSystem(R) to assert meromorphic continuation of Λ(R,s), Λ(R∨,s) agreeing with their Euler products on a right half-plane and the functional equation Λ(R,s)=ε(R)N(R)^(−s)Λ(R∨,1−s), with N positive and the dual conductor equal. Require nonzero meromorphic germs, and the chosen local epsilon/measure normalization. Applying the equation twice then gives ε(R)ε(R∨)=N(R). The conductor is not already multiplied into Λ. General SerreSystem is a conjectural predicate; potentially automorphic cases import a theorem giving its witness.

**Hypotheses.**

- Both dual completions and conductors refer to the same normalization of PS.1.
- The epsilon constants need additional geometric/local normalization data; strict compatibility alone does not manufacture them.

**Inputs.** `PeriodsAndSpecialValues:PS.1/archimedean-completion`, `ArithmeticGaloisRepresentations:R01.3`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`.

**Source and proof route.**

- **BCGP**, (2.8.4)–(2.8.5), p. 37. Completion and conjectural continuation/functional equation.
- **Tate**, (3.4.3)–(3.4.7), printed p. 15. Measure scaling, conductor shift and the contragredient epsilon identity.

1. Package continuation as extension of the existing holomorphic Euler-product function, not as an arbitrary entire-plane function.
2. State both dual functional equations; cancel a nonzero germ to obtain the product constraint.
3. Use Tate (3.4.7) with the dual Haar measure and opposite additive character to check compatibility with the supplied local epsilon convention.

**API.**

- `serre_system_predicate.continuation` (projection): Return an agreeing meromorphic extension and its dual.
- `serre_system_predicate.functional_equation` (projection): Return the equation with the explicit N^(−s) factor.
- `serre_system_predicate.epsilon_product` (compatibility): The two nonzero dual equations imply ε(R)ε(R∨)=N(R).
- `serre_system_predicate.half_conductor` (equivalence): If Λ̂=N^(s/2)Λ, its root constant is ε/√N; for self-dual data its square is one.
- `serre_system_predicate.normalization_change` (compatibility): Changing gamma blocks by constants rescales the two sides and their epsilon constants coherently.

**Checks and worked examples.**

- `serre_system_predicate.self_dual` (characterisation): For a self-dual system, ε²=N; ε itself need not be a sign in this normalization.
- `serre_system_predicate.zero_germ` (characterisation): Two identically zero functions are rejected as a witness of continuation of the Euler product.
- `serre_system_predicate.no_double_conductor` (characterisation): Inserting N^(s/2) into Λ without changing the displayed functional equation fails the half-conductor test.

**Consumers.**

- `AbelianSurfacesPotentialModularity Theorems 1.1.2 and 9.3.1`: Consume a common predicate with exact conductor normalization.
- `ModularityAndLanglandsExtensions:ML.0`: Import this predicate instead of defining another compatible-system completion.

### Hasse–Weil completion and duality

`PeriodsAndSpecialValues:PS.1/hasse-weil-predicates` · construction · Planet: **Hasse–Weil functional equations**

For an abelian variety A/F of dimension g, import strict compatibility and purity of H^i(A) for 0≤i≤2g, define Λ_i(A,s)=Λ(H^i(A),s) and Λ(A,s)=∏_iΛ_i(A,s)^{(−1)^i}. At good reduction the corrected local product has exponent (−1)^i and equals exp(Σ_{m≥1}#A(k_v^m)q_v^(−ms)/m). Define SerreC9_i(A) by meromorphic continuation and Λ_i(A,s)=w_i N_i^((i+1)/2−s)Λ_i(A,i+1−s), w_i∈{±1}, N_i∈Z_{>0}. Poincaré duality plus all SerreC9_i implies BCGP Corollary 2.8.7: Λ(A,s)=ε N^(−s)Λ(A,1+g−s) with ε real and N positive rational. Separately define the Conjecture 1.1.1 predicate for a smooth projective X/F of dimension d: its partial Hasse–Weil zeta function has meromorphic continuation, and there exist A₀>0, nonzero rational bad-prime polynomials P_v and the specified gamma product such that ξ(s)=ζ_X(s)A₀^(s/2)∏Γ_v(s)∏P_v(q_v^(−s)) satisfies ξ(s)=wξ(d+1−s), w=±1. These are conditional predicates, not general theorems.

**Hypotheses.**

- NeronModelsAndSemistableAbelianVarieties:R11.5 supplies BCGP Proposition 2.8.1.
- WeilConjectures:WC.1 supplies point counts and WC.2 supplies actual duality; use the chosen integral model and omitted bad set in the partial zeta predicate.

**Inputs.** `PeriodsAndSpecialValues:PS.1/serre-system-predicate`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `WeilConjectures:WC.2`.

**Source and proof route.**

- **BCGP**, §2.8, pp. 36–38, Conjecture 2.8.6 and Corollary 2.8.7; Conjecture 1.1.1, pp. 3–4. Abelian Hasse–Weil functions and the general smooth-projective conjectural statement.
- **Serre**, §4.1, (26)–(29), (5)–(7) and Conjecture C9, printed pp. 19-12–19-13 (PDF pp. 13–14). Cohomological continuation and functional-equation conjecture.

1. Import the cohomological systems and form their finite alternating products.
2. Apply the trace/point-count identity with the corrected cohomological exponent.
3. Apply Poincaré duality together with the individual conjectural equations to obtain the total equation.
4. Keep the general smooth-projective predicate’s existence of corrections explicit; do not turn unspecified bad factors into proved local definitions.

**API.**

- `hasse_weil_predicates.cohomological` (constructor): Construct Λ_i from the imported pure system H^i(A).
- `hasse_weil_predicates.alternating` (constructor): Construct Λ(A) with the cohomological sign, not a complex-variable exponent.
- `hasse_weil_predicates.good_reduction` (compatibility): Identify the local product with the point-count exponential in its convergence domain or formal variable.
- `hasse_weil_predicates.c9` (constructor): Form the exact individual continuation/functional-equation predicate.
- `hasse_weil_predicates.total_equation` (compatibility): Under all individual predicates and duality, derive the stated total equation.
- `hasse_weil_predicates.smooth_projective` (constructor): Form the separate existential corrected-zeta predicate of Conjecture 1.1.1.

**Checks and worked examples.**

- `hasse_weil_predicates.point` (characterisation): For dimension-zero A=Spec F, the alternating product has only H⁰ and gives the Dedekind zeta convention.
- `hasse_weil_predicates.elliptic` (characterisation): For g=1, the H¹ L-factor occurs inversely in the local Hasse–Weil zeta product; its exponent is independent of s.
- `hasse_weil_predicates.surface` (characterisation): For an abelian surface over totally real F, H¹ has Γ_C,B(s)^2 per real place; the full product still includes H⁰ through H⁴.

**Consumers.**

- `BCGP Corollary 9.3.3`: Conclude exactly the indicated Serre/Hasse–Weil predicates in the proved surface case.
- `AbelianSurfacesPotentialModularity and ML.0`: Use these common definitions instead of duplicate conjectures.

## PS.2 — Formal periods and integration evaluation

### Localized integration evaluation

`PeriodsAndSpecialValues:PS.2/integration-evaluation` · construction · Planet: **Localized period evaluation**

Import P_eff, L=(Gm,{1},dz/z,S¹), and P=P_eff[L⁻¹] from MC.6/formal-periods. For actual relative algebraic de Rham and singular realizations, define per_eff([X,Y,ω,γ])=∫_γω using the supplied comparison. Prove that it respects linearity, morphisms of pairs, connecting maps/Stokes, products and the unit. The positively oriented Tate integral is 2πi≠0, so the localization universal property yields the unique Q-algebra map per:P→C extending per_eff and satisfying per(L⁻¹)=(2πi)⁻¹. No effective/full identification is made without localization.

**Hypotheses.**

- ComplexComparisonPartII:C5 supplies comparison for pairs, boundary maps, tensor products and the actual integration interpretation.
- The formal algebra, its relations and Tate localization are supplied once by MC.6.

**Inputs.** `MotivesAndAlgebraicCycles:MC.6/formal-periods`, `MotivesAndAlgebraicCycles:MC.6/period-point`, `ComplexComparisonPartII:C5`, `PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations`, `mathlib:IsLocalization.Away`, `mathlib:IsLocalization.Away.mul_invSelf`, `mathlib:IsLocalization.Away.lift`.

**Source and proof route.**

- **HMS**, Definition 2.8 and Remark 2.9, pp. 10–11; Theorem 2.10, p. 11. Formal relations, localization and the actual period homomorphism.
- **Deligne**, §3.1, pp. 13–14 (English translation PDF pages). The positively oriented Tate integral.

1. Evaluate generators by the geometric comparison and pair with homology.
2. Use its three compatibilities and product naturality to descend to P_eff.
3. Evaluate the loop integral and prove nonzero; extend by IsLocalization.Away to P and compute the inverse image.

**API.**

- `integration_evaluation.on_symbol` (characterisation): per of the localized symbol equals its actual relative integral.
- `integration_evaluation.stokes` (relation): A connecting-map relation evaluates to equality with the specified boundary sign.
- `integration_evaluation.product` (compatibility): per(xy)=per(x)per(y), with the product orientation inherited from the relative Künneth map.
- `integration_evaluation.tate` (simp): per(L)=2πi and per(L⁻¹)=(2πi)⁻¹.
- `integration_evaluation.unique_extension` (universal-property): Any Q-algebra map agreeing with per_eff and inverting L equals per.
- `integration_evaluation.linear` (simp): For a,b∈Q and localized periods x,y, per(ax+by)=a per(x)+b per(y); in particular per(0)=0 and per(1)=1.

**Checks and worked examples.**

- `integration_evaluation.inverse` (characterisation): In P, LL⁻¹=1 and its image is exactly 1.
- `integration_evaluation.point` (characterisation): The point-pair symbol of the constant 1 evaluates to 1; zero form evaluates to 0.
- `integration_evaluation.stokes_interval` (characterisation): For X=A¹, Y={0,1}, ω=dx and γ=[0,1], evaluation is 1 and agrees with the boundary evaluation of x.

**Consumers.**

- `HMS Theorem 2.10 and PS.9`: Use actual numerical evaluation on the full formal-period ring.
- `RT-AREA-iwasawa-3/8`: Provide the missing inverse and localization contract without duplicating MC.6’s corrected algebra.

### Period torsor evaluation comparison

`PeriodsAndSpecialValues:PS.2/torsor-integration-comparison` · comparison

Under the canonical MC.6 isomorphism P≃O(Iso⊗(H_dR,H_B)) on the full integer-Tate category, PS.2 integration evaluation is pullback at the genuine complex comparison point β. The effective isomorphism first carries L to its comparison coefficient; localizing both sides gives the full isomorphism and the evaluation diagram commutes. Betti acts on the left by composition and de Rham on the right; this is the β convention, whereas PS.0 uses I=β⁻¹. Neither the torsor theorem nor faithful flatness implies injectivity of per.

**Hypotheses.**

- Use the full category and full localized comparison algebra supplied by MC.5–MC.6, not only the effective category.

**Inputs.** `PeriodsAndSpecialValues:PS.2/integration-evaluation`, `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`, `MotivesAndAlgebraicCycles:MC.6/formal-periods-equal-comparison-algebra`, `MotivesAndAlgebraicCycles:MC.6/period-torsor`, `MotivesAndAlgebraicCycles:MC.6/period-point`.

**Source and proof route.**

- **HMS**, Theorem 0.2, p. 2; Theorem 2.10, p. 11; Theorem 3.3 and Corollary 3.4, p. 13. Comparison algebra, localized formal periods and tensor-isomorphism torsor.

1. Import the category/localization and comparison-algebra equivalence, including its actual Tate-unit statement.
2. Check equality on integration symbols and on L⁻¹; use uniqueness of the localization lift.
3. Match β rather than I and preserve the two coaction directions.

**Milestone checks.**

- The comparison sends L to a unit on the full torsor, not merely a nonzero effective coordinate.
- The heap formula uses P⊗P⁻¹⊗P in the supplier’s tensor order.
- An equality of evaluation values alone is not returned as equality in P.

### Rank-one Tate torsor example

`PeriodsAndSpecialValues:PS.2/tate-torsor-test` · application

For the tensor category generated by the Tate object with all integral twists, specialize the imported MC.6 torsor theorem: the distinct Tate weights make its tensor automorphisms Gm, giving O(Iso⊗)=Q[t,t⁻¹], with t representing the β-period L of Q(−1). Under PS.2 evaluation, t↦2πi and t⁻¹↦(2πi)⁻¹; under the inverse comparison I the corresponding coordinate is inverted. The effective polynomial algebra Q[t] alone is not the full torsor algebra. For the finite étale scheme Spec(Q[x]/(x²−2)), the de Rham class x paired with the complex point x=√2 evaluates to √2. Algebraic zero-dimensional periods are obtained from this point-pair realization, and products of pairs agree with multiplication in this full ring.

**Hypotheses.**

- The rank-one category/torsor and its comparison are imported from MC.6; this target is the concrete integration normalization.

**Inputs.** `PeriodsAndSpecialValues:PS.2/torsor-integration-comparison`, `MotivesAndAlgebraicCycles:MC.6/formal-periods`.

**Source and proof route.**

- **HMS**, Remark 2.9, p. 11; Lemmas 3.1–3.2, p. 12. Tate inversion required for the full comparison algebra.

1. Restrict the supplied full comparison to the Tate-generated category; use the distinct Hodge weights to identify its tensor automorphisms with Gm and its coordinate algebra with the Laurent algebra.
2. Identify the distinguished integration coordinate and its inverse.
3. Use PS.2 product compatibility for all positive and negative powers.

**Milestone checks.**

- t·t⁻¹=1 evaluates to 1.
- Evaluation of t⁻² is (2πi)⁻².
- Replacing Q[t,t⁻¹] by Q[t] fails the negative-twist test.
- The zero-dimensional symbol (Spec(Q[x]/(x²−2)),x,point √2) evaluates to √2, and changing the point to −√2 changes the value.

## PS.3 — Regulator determinants and leading terms

### Rational motivic fundamental line

`PeriodsAndSpecialValues:PS.3/rational-fundamental-line` · comparison

For a motive M with semisimple Q-algebra A acting, assume the supplied finite-dimensional projective motivic cohomology spaces and realizations. Import M.8/arithmetic-fundamental-line for its selected Tate/elliptic cases. In general coefficients assume the stated finite projective motivic inputs, and assemble in the ordered determinant Picard category the explicit Burns–Flach factors of the Burns–Flach object Ξ_A(M)=dH_f⁰(M)·dH_f¹(M)⁻¹·d(H_f¹(M∨(1))^*)·d(H_f⁰(M∨(1))^*)⁻¹·∏_{v|∞}d(H_v(M)^{G_v})⁻¹·d(t_M), where t_M=H_dR(M)/F⁰. For M/Q with commutative E-coefficients the archimedean term is d(B⁺)⁻¹. Define the Fukaya–Kato line Δ_E(M)=Ξ_E(M)⁻¹ with the exact reversed tensor/inverse identification in the same determinant convention. These are rational objects; no finite torsion cardinality is erased from the separate integral problem.

**Hypotheses.**

- Motive and cohomology objects supplied by MC.2/M.8; finite dimensionality/projectivity are explicit assumptions, not consequences of notation.
- General determinant functor, symmetry signs, base change and exact-sequence isomorphisms supplied by PadicMeasuresIwasawaAlgebras:L5.

**Inputs.** `PeriodsAndSpecialValues:PS.0/comparison-period-line`, `MotivicEtaleKTheory:M.8/arithmetic-fundamental-line`, `MotivicEtaleKTheory:M.8/regulator-determinant-comparison`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source and proof route.**

- **BF**, §3.4, (29), p. 526. The rational fundamental object and its ordered factors.
- **BV**, §4.3, author final internal p. 20; published p. 187, definition of Δ and (17). The opposite fundamental-line orientation Δ.

1. Import M.8’s specialized arithmetic line; identify its factors with the displayed BF formula rather than constructing that line again. For general semisimple coefficients the displayed factor list is the PS.3 conditional assembly, using L5.
2. Use base change to identify scalar extensions; record the dual spaces before taking determinant inverses.
3. Compare the displayed BF and BV formulas term by term to identify Δ=Ξ⁻¹, retaining grading signs.

**API.**

- `rational_fundamental_line.xi` (constructor): Return the ordered BF fundamental object.
- `rational_fundamental_line.delta` (constructor): Return the inverse FK line and its comparison with Ξ.
- `rational_fundamental_line.base_change` (functoriality): Scalar extension carries every factor and dual to the corresponding determinant object.
- `rational_fundamental_line.coordinates` (compatibility): For chosen bases the line has the product of the listed determinants with exactly their exponents.
- `rational_fundamental_line.zero_rank` (simp): A zero-dimensional cohomology factor contributes the unit object, not a zero scalar.

**Checks and worked examples.**

- `rational_fundamental_line.inverse` (characterisation): Δ⊗Ξ is canonically the determinant unit in the fixed order.
- `rational_fundamental_line.dual_term` (characterisation): The factor d(H_f¹(M∨(1))^*) occurs with positive exponent in Ξ; replacing it by its inverse fails.
- `rational_fundamental_line.finite_torsion` (characterisation): A finite integral module becomes zero after tensoring with Q, but its integral correction must still appear in PS.4.

**Consumers.**

- `BF Conjecture 4 and BV Conjecture 4.1`: State ETNC and zeta elements in compatible orientations.
- `PS.6`: Identify the actual cohomology factors in BSD/Bloch–Kato cases.

### Real period–regulator trivialization

`PeriodsAndSpecialValues:PS.3/real-regulator-trivialization` · construction · Planet: **Period–regulator trivialization**

Under the Burns–Flach real regulator/height exact-sequence conjecture, let α:B⁺⊗R→t_M⊗R be induced by I. The supplied cycle/regulator and height maps give the exact sequence 0→H_f⁰(M)_R→ker α→H_f¹(M∨(1))_R^*→H_f¹(M)_R→coker α→H_f⁰(M∨(1))_R^*→0. Applying the ordered determinant identifications gives θ_∞:Ξ_A(M)_R→1. In invertible regulator cases its coordinate is the corresponding signed matrix determinant together with the comparison factors. Exactness/nondegeneracy, including the weight −1 height step, is an explicit hypothesis; an arbitrary nonzero matrix is not the motivic regulator.

**Hypotheses.**

- Actual motivic regulator maps from M.8, BorelRegulators or EllipticRegulators; the indicated exact sequence and required height pairing supplied or conjecturally assumed.
- A-equivariance and projectivity as in BF §3.1; real comparison from PS.0.

**Inputs.** `PeriodsAndSpecialValues:PS.3/rational-fundamental-line`, `PeriodsAndSpecialValues:PS.0/deligne-periods`, `MotivicEtaleKTheory:M.8/arithmetic-fundamental-line`, `MotivicEtaleKTheory:M.8/regulator-determinant-comparison`, `BorelRegulators:R.7/regulator-factor-two`, `BorelRegulators:R.7/number-field-small-cases`, `EllipticRegulators:ER.5/the-L-value-theorem`, `EllipticRegulators:ER.5/nonvanishing-and-what-is-not-claimed`.

**Source and proof route.**

- **BF**, §3.1, Conjecture 1, pp. 517–519; §3.4, pp. 526–529. The real exact sequence and its fundamental-object trivialization.

1. Import M.8/regulator-determinant-comparison for the admitted Tate/elliptic inputs. For general coefficients use the displayed real exact sequence as a hypothesis and assemble its determinant trivialization with the PS.0 comparison.
2. Apply determinant multiplicativity along the exact sequence and the short sequence defining α.
3. Translate to bases only after constructing the coordinate-free map; keep the grading signs and real orientations.

**API.**

- `real_regulator_trivialization.theta` (constructor): Construct θ_∞ only from the actual exact sequence witness.
- `real_regulator_trivialization.matrix` (compatibility): In selected bases return the signed period/regulator determinant.
- `real_regulator_trivialization.basis_change` (functoriality): Changing motivic bases changes determinant coordinates inversely on the two sides.
- `real_regulator_trivialization.height` (projection): Expose the actual weight −1 height pairing and its nondegeneracy assumption.
- `real_regulator_trivialization.orientation` (compatibility): Switching from Ξ to Δ inverts the trivialization and leading-term coordinate.

**Checks and worked examples.**

- `real_regulator_trivialization.empty` (characterisation): An empty regulator block has determinant one.
- `real_regulator_trivialization.scaled_regulator` (characterisation): Multiplying all entries of a rank-r regulator map by 2 multiplies its determinant by 2^r.
- `real_regulator_trivialization.degenerate` (characterisation): A singular height/regulator pairing cannot provide θ_∞ through the asserted exact sequence.

**Consumers.**

- `BF §§3–4`: Define the archimedean component of the relative obstruction.
- `PS.6`: Use the Néron–Tate height only through its actual comparison with the real sequence.

### Leading-term rationality predicate

`PeriodsAndSpecialValues:PS.3/leading-term-line` · definition · Planet: **Leading-term rationality**

For the finite L-function with a supplied nonzero meromorphic germ at s=0, define its order r and leading coefficient L*=lim_{s→0}s^(−r)L_fin(M,s), componentwise in the center for semisimple coefficients. In the commutative E case with θ_∞, define LeadingTermRational(M) to mean the nonzero element θ_∞⁻¹((L*)⁻¹) belongs to the rational E-fundamental line Ξ_E(M) inside its real extension, with the explicitly selected embedding and orientation. Define a general Beilinson leading-term assertion as the predicted order together with this rationality and the required regulator exactness, kept as conjectural premises. No assertion about an integral lattice follows from this rational membership.

**Hypotheses.**

- Finite-value normalization from PS.1 and θ_∞ from PS.3; the order and nonzero leading term require actual meromorphic continuation.
- For the equivariant formulation use the center/reduced-rank version of PS.5 instead of treating noncommutative coefficients as a field.

**Inputs.** `PeriodsAndSpecialValues:PS.1/motivic-euler-product`, `PeriodsAndSpecialValues:PS.3/real-regulator-trivialization`.

**Source and proof route.**

- **BF**, §4.3, Conjecture 4(i)–(iii), pp. 535–536. Continuation, predicted order and rationality of the equivariant leading term.

1. Factor each germ as s^r times a nonvanishing analytic unit, allowing negative r for poles.
2. Use θ_∞ to transport the inverse leading coefficient into Ξ; equivalently transport L* into Δ=Ξ⁻¹.
3. Separate rationality from the integral lattice-generation assertion introduced in PS.4–PS.5.

**API.**

- `leading_term_line.order` (projection): Return the order of the nonzero meromorphic germ.
- `leading_term_line.coefficient` (projection): Return the nonzero coefficient of s^r, so for holomorphic order r≥0 it is L^(r)(0)/r!.
- `leading_term_line.rationality` (characterisation): Membership in Ξ uses θ_∞⁻¹((L*)⁻¹); equivalently membership in Δ uses L* and the dual trivialization.
- `leading_term_line.finite_correction` (compatibility): Multiplying by an Euler germ of order e adds e to the order and multiplies leading coefficients.
- `leading_term_line.not_integral` (relation): Rational membership does not imply generation of any chosen integral lattice.

**Checks and worked examples.**

- `leading_term_line.factorial` (characterisation): For L(s)=3s²+O(s³), r=2 and L*=3, while L″(0)=6.
- `leading_term_line.pole` (characterisation): For L(s)=2/s+O(1), r=−1 and L*=2.
- `leading_term_line.index` (characterisation): The lattices Z and 2Z span the same rational line but give distinct generator assertions.

**Consumers.**

- `Beilinson leading-term boundary in PS.7`: Retain conjectural order and rationality explicitly.
- `PS.5`: Upgrade to an integral relative-K obstruction only under its additional hypotheses.

### Number-field and CM regulator adapters

`PeriodsAndSpecialValues:PS.3/regulator-specializations` · comparison

Import the Borel–Beilinson comparison with all Tate factors and embedding multiplicities: in the Burgos convention r_Borel=2r_Beilinson in degree j≥2, hence rank-d_j determinant ratio 2^{d_j}; import the associated nonzero rational proportionality to |ζ_F*(1−j)|. The zero-rank determinant is one. For the CM elliptic input use only the corrected ER.5/the-L-value-theorem at L(E,2), its specified maximal order, class-number-one setup, Fourier kernel, conductor and integral cycle U. Transport that supplier’s actual scalar via its regulator comparison; its nonvanishing result is not a spanning theorem for K₂. Export the matrix/determinant versions of these supplied results without creating new regulator definitions.

**Hypotheses.**

- Exact Borel conventions from R.7, including each real/complex embedding multiplicity.
- ER.5 supplies its corrected sign, missing roots-of-unity factor and conductor index-set restriction; unresolved supplier corrections remain gates.

**Inputs.** `PeriodsAndSpecialValues:PS.3/real-regulator-trivialization`, `BorelRegulators:R.7/regulator-factor-two`, `BorelRegulators:R.7/number-field-small-cases`, `EllipticRegulators:ER.5/the-L-value-theorem`, `EllipticRegulators:ER.5/nonvanishing-and-what-is-not-claimed`.

**Source and proof route.**

- **BF**, §3.1, pp. 517–519; §4.3, pp. 535–536. Determinant assembly and conjectural leading terms; arithmetic scalar formulas are imported from the cited supplier nodes.

1. Read the supplier’s comparison map before taking determinants and multiply one factor 2 per actual rank.
2. Check Q in even j≥2 as a rank-zero case and an imaginary quadratic field in j=2 as rank one.
3. Apply the ER.5 scalar only in its precise CM scope and compare its Bloch and Beilinson regulator conventions; use PS.3 determinant covariance.

**Milestone checks.**

- For F=Q and even j≥2, rank zero gives regulator determinant 1, not 0.
- For imaginary quadratic F at j=2 the factor is 2, not 4 and not 1.
- For rank d, the Borel/Beilinson covolume ratio is 2^d in the stated direction.
- An ER.5 nonzero class U does not prove that U spans K₂; its sign and CM hypotheses remain visible.

## PS.4 — Integral fundamental lines and local corrections

### Integral lattice in the BF line

`PeriodsAndSpecialValues:PS.4/integral-fundamental-line` · construction · Planet: **Integral fundamental lattice**

Let O_λ be a coefficient DVR with fraction field E_λ and T⊂V_λ(M) a stable finite free lattice. Import Δ_λ(T)=dRΓ_c(T)⁻¹ and its rationalization from M.8/arithmetic-fundamental-line. Assume actual global and local complexes with the required finiteness/perfectness and a proved rational comparison θ_λ:Ξ_E(M)⊗E_λ≃d_{E_λ}RΓ_c(O_{F,S},V). Using the inverse of this imported Δ_λ(T), transport the integral lattice I_λ(M,T,S)=θ_λ⁻¹(d_{O_λ}RΓ_c(O_{F,S},T)) in Ξ_E(M)⊗E_λ. The real comparison is θ_∞ from PS.3. For a general order O⊂A replace DVR lattices by the supplied projective order-structures and determinant objects; a global object Ξ_O requires the BF coherence hypothesis or its explicitly stated substitute. No global integral lattice is inferred just from rational cohomology.

**Hypotheses.**

- For p odd or no real places use the supplied bounded perfect compact-support model. Real dyadic places require the separate PS.4 gate.
- Cycle/Chern and p-adic de Rham comparison theorems, integral local finite conditions and projectivity are actual supplier hypotheses.

**Inputs.** `PeriodsAndSpecialValues:PS.3/rational-fundamental-line`, `PeriodsAndSpecialValues:PS.3/real-regulator-trivialization`, `ArithmeticGaloisDuality:D7/compact-support-cochains`, `ArithmeticGaloisDuality:D7/cochain-finiteness-perfectness`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/selmer-complex`, `SelmerIwasawaCohomology:L2/condition-change-triangle`, `SelmerIwasawaCohomology:L2/lattice-change-cone`, `MotivicEtaleKTheory:M.8/arithmetic-fundamental-line`, `MotivicEtaleKTheory:M.8/regulator-determinant-comparison`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source and proof route.**

- **BF**, §§3.2–3.4, pp. 520–529, especially §3.3 and Lemmas 5–6. Integral structures, rational comparison, choice invariance and global coherence.
- **BV**, §4.3, author final internal p. 20, (14); published p. 187, (18). The inverse-line p-adic period–regulator comparison.

1. Import M.8’s integral inverse determinant and actual regulator determinant comparison. Invert that line to match BF Ξ, then pull it back along θ_λ. No second construction of Δ or its generic quasi-isomorphism/base-change API is owned here.
2. Apply the generic determinant and the actual θ_λ, then pull back its integral lattice.
3. Use coherence only when assembling all λ into one order object; keep local construction and global gluing separate.

**API.**

- `integral_fundamental_line.local_lattice` (constructor): Return I_λ inside the specified rational fundamental line.
- `integral_fundamental_line.quasi_iso` (compatibility): A proved quasi-isomorphism of perfect integral models induces the same determinant object via the determinant functor.
- `integral_fundamental_line.comparison` (projection): Expose θ_λ and θ_∞ with their different coefficient fields and orientations.
- `integral_fundamental_line.base_change` (functoriality): Compatible flat coefficient extension transports the lattice with the derived complex.
- `integral_fundamental_line.coherence` (characterisation): Global order gluing requires the stated coherence/projective structure, not just all local rational spaces.

**Checks and worked examples.**

- `integral_fundamental_line.unit_complex` (characterisation): The zero complex contributes the unit lattice.
- `integral_fundamental_line.two_term` (characterisation): Over a DVR, [O→π^a O] interpreted as [O --π^a→ O] in degrees 0,1 is perfect and its acyclic rational determinant lattice is π^a O.
- `integral_fundamental_line.nonperfect` (characterisation): A torsion module of infinite projective dimension over a nonregular order does not acquire a determinant line merely because it is finite.

**Consumers.**

- `BF Conjecture 4`: Provide the integral object whose relative class is RΩ.
- `PS.6`: Retain the torsion and local terms in an actual motivic lattice.

### Finite lattice correction

`PeriodsAndSpecialValues:PS.4/finite-lattice-correction` · comparison

For a bounded perfect complex C over a DVR O, with finite-length cohomology and acyclic fraction-field extension, use dC=⊗_i(det C^i)^{(−1)^i}. Under the canonical rational acyclic trivialization, the determinant lattice is π^{−Σ_i(−1)^i length_O H^i(C)}O. For [O --a→ O] in degrees 0,1 with a≠0 this is aO, matching Fitt_O H¹=(a); shifting the complex by one inverts the lattice. A change T′⊂T of Galois lattice is computed from the actual perfect cone RΓ_c(T/T′) and its comparison triangles. Individual finite quotient corrections need not vanish; only the complete global balance gives the choice-invariance of BF Lemma 5.

**Hypotheses.**

- Bounded perfectness and finite-length cohomology; coefficient DVR for the valuation formula.
- For a general noncommutative order replace scalar Fitting equality by the generic relative determinant class; no naive scalar formula is asserted.

**Inputs.** `PeriodsAndSpecialValues:PS.4/integral-fundamental-line`, `PadicMeasuresIwasawaAlgebras:L5`, `ArithmeticGaloisDuality:D7/derived-tensor-and-tor`, `SelmerIwasawaCohomology:L3/selmer-determinant`.

**Source and proof route.**

- **BF**, §3.4, Lemma 5 and its proof, pp. 526–528; §3.2, (24), pp. 521–522. Lattice invariance and the distinction between the termwise and acyclic trivializations.

1. Specialize L5 and the existing L3/selmer-determinant valuation formula to a DVR, then invert the supplier’s inverse determinant to obtain the displayed dC sign. Use its actual acyclic trivialization.
2. Reduce the valuation calculation to the two-term multiplication complex, fixing the acyclic-trivialization direction.
3. Apply the exact triangle of the actual quotient complex for lattice change and the full local/global cancellation for invariance.

**Milestone checks.**

- [O --π³→ O] maps to π³O, while its degree-one shift maps to π⁻³O.
- A finite H¹=O/π contributes length +1 to the lattice exponent, not −1.
- A unit differential contributes O, and a zero differential is excluded from the acyclic formula.

### Local Euler and Tamagawa determinant corrections

`PeriodsAndSpecialValues:PS.4/local-correction-adapter` · comparison

For v∤p, import the finite local complex quasi-isomorphic to [V^{I_v} --(1−Fr_geom)→ V^{I_v}] in degrees 0,1. When the differential is invertible, its acyclic determinant factor is P_v(1), whereas the local L-value is P_v(1)⁻¹. For v|p use the actual crystalline finite complex, the tangent quotient t_v and the 1−φ comparison triangle of BF (22)–(23), not the v∤p formula. Transport integral kernel/cokernel indices through the supplied local finite-condition complex; in elliptic cases identify the resulting component-group factor with the existing Néron Tamagawa number under its hypotheses. If a local Euler factor vanishes, retain its cohomology and leading-order correction instead of cancelling it.

**Hypotheses.**

- Integral finite-condition compatibility and the relevant p-adic comparison are proved for the selected representation.
- Elliptic component-group/Tamagawa comparison and minimal differential normalization come from existing owners.

**Inputs.** `PeriodsAndSpecialValues:PS.4/finite-lattice-correction`, `PeriodsAndSpecialValues:PS.1/motivic-euler-product`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/selmer-complex`, `SelmerIwasawaCohomology:L2/condition-change-triangle`, `SelmerIwasawaCohomology:L2/lattice-change-cone`, `AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`.

**Source and proof route.**

- **BF**, §3.2, (19)–(24), pp. 520–522. The two distinct local models, the tangent term and their determinant trivializations.

1. Use local finite/singular triangles and their determinant maps.
2. Compare the rational acyclic trivialization with the termwise cancellation; they differ by det(1−Fr) or det(1−φ).
3. Use the integral cone lengths and actual component-group comparison to identify arithmetic local factors.

**Milestone checks.**

- For an unramified rank-one eigenvalue α≠1, the determinant contribution is 1−α, inverse to the L-factor.
- For α=1 the two-term complex has cohomology, so the acyclic formula is unavailable.
- At v|p omitting the tangent quotient fails the Bloch–Kato comparison triangle.

### Real dyadic correction gate

`PeriodsAndSpecialValues:PS.4/real-dyadic-gate` · application

At a real place and p=2, use the imported complete Tate cochains for C₂ and the modified compact-support fibre. For a torsion-free trivial O₂-action, Ĥ^{2k}(C₂,O₂)=O₂/2O₂ and Ĥ^{2k+1}=0; for the sign action these parities reverse. This complete complex is unbounded and cannot be assigned a perfect determinant by deleting its tails. PS.4 integral theorems therefore apply under p odd/no real places or a separately supplied bounded perfect replacement with a proved comparison retaining every two-primary correction. Inverting 2 recovers the bounded comparison, but proves no integral dyadic equality.

**Hypotheses.**

- ArithmeticGaloisDuality supplies the actual unbounded real complex and duality.
- No bounded perfect real-dyadic replacement is assumed to exist for arbitrary coefficients.

**Inputs.** `ArithmeticGaloisDuality:D7/compact-support-without-p`, `PeriodsAndSpecialValues:PS.4/integral-fundamental-line`.

**Source and proof route.**

- **BF**, §3.2, pp. 522–523; §3.3, pp. 524–525. Compact-support comparison and the integral structures whose dyadic real extensions require care.

1. Import the complete two-periodic complex and compute alternating norm/difference maps.
2. Use its nonzero recurring Tate groups to reject bounded perfectness in the stated example.
3. State the precise admissible range of each determinant theorem and leave a separate gap for a selected motivic bounded replacement.

**Milestone checks.**

- Trivial Z₂ gives even Tate group Z/2 and odd group zero.
- The sign lattice reverses the parity.
- Tensoring with Q₂ kills these groups; the integral formula must not be inferred from that rational vanishing.

## PS.5 — Equivariant Tamagawa-number statements

### Equivariant Tamagawa obstruction

`PeriodsAndSpecialValues:PS.5/equivariant-obstruction` · construction · Planet: **Equivariant Tamagawa obstruction**

Let A be a finite-dimensional semisimple Q-algebra and O⊂A an order with a projective O-structure on M. Under BF finiteness, real exactness and coherence, form RΩ(M,O)=[Ξ_O(M),θ_∞] in K₀(O,R), in its locally free class subgroup Cl(O,R). Use the extended boundary δ̂:ζ(A_R)×→Cl(O,R) of BF Lemma 9: a rational central multiplier λ makes λx a reduced norm, and the resulting correction is independent of λ. With L* in the real center define TΩ(M,O)=δ̂(L*)+RΩ(M,O). The ordinary noncommutative K₁/reduced-norm/SK₁ data are imported; scalar units alone do not define the equivariant obstruction.

**Hypotheses.**

- The selected order’s projective structures and global coherence, or an explicitly substituted local formulation of BF Conjecture 5/6.
- L* has nonzero components and the reality condition needed for ζ(A_R)×; the extended boundary is the actual supplied relative-K map.
- For the actual finite semisimple Q-algebra A, supply the reduced norm on K₁, its real quaternion positivity constraints and the rational norm/sign theorem used by BF Lemma 9. The dimension-one Iwasawa quotient theorem in NE.3 does not establish this coefficient-algebra contract.

**Inputs.** `PeriodsAndSpecialValues:PS.4/integral-fundamental-line`, `PeriodsAndSpecialValues:PS.3/leading-term-line`, `GeneralAlgebraicKTheory:KU-fundamental`, `IntegralHeckeAndGaloisDeterminants:IHG.0/azumaya-determinant`.

**Source and proof route.**

- **BF**, Lemma 9, §4.2, pp. 534–535; Conjecture 4, pp. 535–536. Extended boundary, its independence and the sign in TΩ.

1. Import the relative K-group and integral fundamental object, then pair it with θ_∞.
2. Construct the extended boundary through its rational sign correction as in BF Lemma 9; do not assume every real central unit is a reduced norm.
3. Add the analytic and cohomological classes with the displayed plus sign.

**API.**

- `equivariant_obstruction.r_omega` (constructor): Return [Ξ_O,θ_∞] in the relative class group.
- `equivariant_obstruction.extended_boundary` (constructor): Use δ̂ on real central units with the rational multiplier and independence proof.
- `equivariant_obstruction.t_omega` (constructor): Return δ̂(L*)+RΩ.
- `equivariant_obstruction.base_change` (functoriality): Compatible change of order or coefficient algebra transports the entire class, not just its characters.
- `equivariant_obstruction.commutative` (compatibility): For commutative O, vanishing is the exact fundamental-lattice generator assertion under θ_∞.

**Checks and worked examples.**

- `equivariant_obstruction.sign` (characterisation): TΩ=0 means δ̂(L*)=−RΩ, not δ̂(L*)=RΩ.
- `equivariant_obstruction.quaternion` (characterisation): A negative real scalar in a Hamilton quaternion component is not a reduced norm; δ̂ still uses its rational sign correction.
- `equivariant_obstruction.characters` (characterisation): Characterwise reduced-norm equality can leave an SK₁ or localization kernel; it is not automatically equality of K₁ classes.

**Consumers.**

- `BF Conjecture 4`: State rationality and integrality in the correct relative group.
- `NE.7`: Compare the determinant and zeta-isomorphism formulations.

### Equivariant Tamagawa-number predicate

`PeriodsAndSpecialValues:PS.5/etnc-predicate` · definition · Planet: **Equivariant Tamagawa-number conjecture**

Under the data of PS.5/equivariant-obstruction, define the BF ETNC package as: analytic continuation to 0; componentwise order ord₀L_A(M)=rr_A(H_f¹(M∨(1))^*)−rr_A(H_f⁰(M∨(1))^*); rationality TΩ∈Cl(O,Q) inside Cl(O,R); and integrality TΩ=0. Store these as separate propositions so a proof of analytic rank or rationality is not treated as integrality. Localized variants specify the order O[1/S] or O_λ and the induced relative class. General ETNC remains a conjecture; a theorem must carry the exact motive, order and primes.

**Hypotheses.**

- Coherence/projective structure and real regulator hypotheses of BF Conjecture 4; all center components and reduced ranks retained.

**Inputs.** `PeriodsAndSpecialValues:PS.5/equivariant-obstruction`.

**Source and proof route.**

- **BF**, Conjecture 4(i)–(iv), pp. 535–536; Conjectures 5–6, pp. 536–537. Continuation, reduced-rank order, rationality, integrality and local formulations.

1. Use the equivariant analytic order and center-valued leading coefficient from BF.
2. Define the two distinct target subgroups/equalities using the imported relative-K maps.
3. Expose projections and localization implications without asserting their converses.

**API.**

- `etnc_predicate.analytic` (projection): Extract the continuation and predicted componentwise order.
- `etnc_predicate.rational` (projection): Extract membership in the rational relative subgroup.
- `etnc_predicate.integral` (projection): Extract TΩ=0 for the specified order.
- `etnc_predicate.localize` (functoriality): A global equality implies each localized equality by the relative-K map.
- `etnc_predicate.recover_scalar` (compatibility): For one commutative coefficient component recover θ_∞(Ξ_O)=(L*)⁻¹O, equivalently the FK generator ζ with value L*.

**Checks and worked examples.**

- `etnc_predicate.rational_only` (characterisation): A nonzero rational relative class satisfies rationality but fails integrality.
- `etnc_predicate.odd_primes` (characterisation): An equality over Z[1/2][G] makes no assertion about the Z₂[G] component.
- `etnc_predicate.rank_term` (characterisation): Both H_f¹(M∨(1))^* and H_f⁰(M∨(1))^* occur in the predicted order; deleting the second fails the trivial-motive pole case.

**Consumers.**

- `PS.6`: Distinguish p-primary and all-prime special-value assertions.
- `PS.7`: Keep general ETNC among the explicit research predicates.

### Zeta-isomorphism orientation adapter

`PeriodsAndSpecialValues:PS.5/zeta-orientation-adapter` · comparison

Import the FK zeta-isomorphism conjecture from NE.7, not a second definition: ζ_Λ(T):1_Λ→d_ΛRΓ_c(U,T)⁻¹, with T=Λ⊗Z_p T_p and g(x⊗y)=x ḡ⁻¹⊗g(y). Under specialization by a motivic representation ρ, use the dual twist M(ρ*) and the supplied generalized base change. With Δ=Ξ⁻¹, ζ_E:1→Δ has θ_∞,FK(ζ_E)=L*, while θ_λ identifies Δ_λ with dRΓ_c(V)⁻¹. Prove that these identifications yield the BF vanishing equation with its chosen sign. Local epsilon isomorphisms and duality are additional imported conjectural/theorem data, not consequences of the bare existence of a scalar L-value. This finite-level determinant comparison does not by itself define the BV normalized Iwasawa leading term: its pair [C,a] requires a:1→d(C), whereas the displayed global ζ has target d(C)⁻¹. A supplied shifted/dual complex comparison must resolve this domain mismatch before any BV interpolation identity is used; simply inverting ζ changes its normalization.

**Hypotheses.**

- p odd in the BV/NE formulation; all NE.7 arithmetic perfectness and base-change hypotheses.
- The original Fukaya–Kato proof text was not acquired; this target uses the precise BV restatement and the existing NE supplier, with a collation gap.
- The normalized global leading-term comparison requires a separate supplier witness. Require its explicit shifted/dual complex, correctly typed ζ and Bockstein trivialization, with recomputed r_G, relative boundary and c_γ factor; existence of the inverse-line FK map alone is insufficient.

**Inputs.** `PeriodsAndSpecialValues:PS.5/etnc-predicate`, `PeriodsAndSpecialValues:PS.3/rational-fundamental-line`, `NoncommutativeAndEquivariantIwasawa:NE.7/fukaya-kato-zeta-isomorphism`, `NoncommutativeAndEquivariantIwasawa:NE.7/local-epsilon-isomorphism`, `NoncommutativeAndEquivariantIwasawa:NE.7`.

**Source and proof route.**

- **BV**, §4.3, author final Conjecture 4.1, internal pp. 20–21; published (17)–(18) p. 187 and Conjecture 4.1 p. 188. Leading-term domain check: published Definition 2.5 pp. 170–171, Definition 3.7 p. 177, Remark 5.6/proof pp. 194–195. The inverse fundamental line, dual specialization and finite-level normalization; normalized Iwasawa leading terms require the separate orientation comparison recorded in E5.

1. Match each factor of Δ with the inverse BF object, then match the real and p-adic trivializations.
2. Check the diagonal Galois action and the appearance of ρ*, rather than ρ.
3. For the finite-level BF comparison use the actual real and p-adic determinant identifications. For normalized Iwasawa interpolation first discharge the separately requested NE.7 orientation comparison, then retain its local epsilon/duality normalization.

**Milestone checks.**

- The zeta target is dRΓ_c⁻¹, not dRΓ_c.
- Specialization produces M(ρ*), and the Galois action contains ḡ⁻¹.
- The commutative comparison recovers δ̂(L*)+RΩ=0 in BF orientation.
- The unshifted BV pair [RΓ_c,ζ] is rejected when ζ has inverse-determinant target; no untyped composition or automatic inversion supplies a normalized leading term.

### Scoped Tate, Artin and abelian adapters

`PeriodsAndSpecialValues:PS.5/proved-case-adapters` · comparison

For any supplied proved ETNC case, transport the full relative class through BF Theorems 3.1 and 4.1 (coefficient extension, restriction and Morita equivalence), recording motive, order, localization and reduced-norm ambiguity. The abelian Tate test family is L/Q finite abelian, K⊂L and r≤0 with pair (h⁰(Spec L)(r), Z[1/2][Gal(L/K)]); its proof is requested from the integral-Iwasawa owner with the original Burns–Greither theorem and all descent hypotheses, rather than inferred from Dirichlet algebraicity. For BV Theorem 5.5 use the exact NE.7 Tate interpolation contract including p odd, the totally real p-adic Lie extension, the finite Galois field E/Q, the global and local cyclotomic-disjointness conditions, the p-adic Stark assumption, and existence of ζ; it is a conditional comparison. For Corollary 5.7 retain the supplier’s Q-valued-character restriction, Leopoldt and the exponent n_ρ; permutation characters have n_ρ=1. No arbitrary Artin, dyadic or noncommutative ETNC theorem is deduced. Both BV interpolation targets additionally require the reviewed shifted/dual determinant comparison from the preceding node. Their normalized formulas are not available theorem imports while that supplier gap remains. The sufficient condition that a character is permutation must not be replaced by the false converse that every integral combination of permutation characters is permutation.

**Hypotheses.**

- Each arithmetic theorem is imported with its exact statement/proof gate; BF Remark 10 alone is a bibliographic lead for the Burns–Greither case.
- An annihilator or Fitting-ideal theorem does not supply a relative determinant equality without the integral-Iwasawa comparison.
- BF restriction functoriality requires the specified projectivity over the smaller coefficient algebra/order; Morita transport carries its actual bimodule equivalence. No unrestricted restriction map is asserted.
- A p-adic regulator is used as an isomorphism only with its nonzero-regulator/Leopoldt premise. The Q-valued restriction in the published Corollary 5.7 corrects the author final; it does not resolve the determinant-domain gap.

**Inputs.** `PeriodsAndSpecialValues:PS.5/zeta-orientation-adapter`, `IntegralIwasawaTheory:I.7`, `NoncommutativeAndEquivariantIwasawa:NE.7/tate-motive-interpolation`, `NoncommutativeAndEquivariantIwasawa:NE.7/tate-motive-interpolation-rational`.

**Source and proof route.**

- **BF**, Theorem 3.1, p. 531, and Theorem 4.1, p. 539 (proofs pp. 531–533 and 539–541); Remark 10, p. 537. Functoriality and the exact known abelian Tate range; the original arithmetic proof is an explicit supplier obligation.
- **BV**, Author final Theorem 5.5/Remark 5.6, internal pp. 25–26, Corollary 5.7 p. 27; published Theorem 5.5 p. 193, Remark 5.6/proof pp. 194–196, corrected Corollary 5.7 p. 196. Conditional interpolation and its character/exponent qualifications.

1. Import the exact Tate/abelian theorem and compare its determinant orientation/order/localization.
2. Use BF functoriality to transport its class, retaining any kernel of the map.
3. For NE Tate interpolation require both the full arithmetic hypotheses and an explicit witness resolving its determinant-domain gap; only then apply the conditional normalized identity.

**Milestone checks.**

- For r=0 in the abelian Tate family retain Z[1/2][G], without claiming the omitted dyadic component.
- For a permutation character the exponent is 1; a general rational character may only give an n_ρ-th-power identity.
- An SK₁ ambiguity cannot be removed just by comparing scalar Artin evaluations.
- The sign character of C₂ is the difference of two permutation characters but is not itself permutation; n_ρ=1 in an integer-combination formula does not characterize permutation characters.

## PS.6 — BSD and Bloch–Kato assembly

### Bloch–Kato motivic pair

`PeriodsAndSpecialValues:PS.6/bloch-kato-motivic-pair` · definition

A BK motivic pair over Q consists of finite-dimensional Q-spaces V,D, a continuous finite-adelic Galois action on V⊗A_f preserving V under the selected real conjugation, a decreasing exhaustive separated filtration D^i, filtered comparisons D⊗Q_p≃D_dR(V_p) and D⊗R≃(V⊗C)^+ for the diagonal real action. Impose all four axioms of BK Definition 5.5: (P1) outside finitely many p every V_ℓ with ℓ≠p is unramified and V_p is crystalline; (P2) for every rational lattices T⊂V and L⊂D, outside finitely many p the filtered crystalline module admits integers i≤0,j≥1 with D^i=D,D^j=0,j−i<p, L⊗Z_p is strongly divisible, and its supplied Fontaine–Laffaille realization equals T⊗Z_p; (P3) for each p all local polynomials P_p(V_ℓ,u), including the crystalline ℓ=p polynomial, lie in Q[u] and agree; (P4) at each p there is a stable adelic lattice whose unramified H⁰ with ℓ-primary divisible coefficients is divisible for almost all ℓ. Weight ≤w means all local reciprocal roots have absolute value ≤p^(w/2) and D_∞^i∩V_∞^+=0 for i>w/2. A triple additionally supplies finite-dimensional Φ, R_∞:Φ⊗R≃D_∞/(D_∞⁰+V_∞^+) and R_Gal:Φ⊗A_f≃H_f,Spec(Z)¹(Q,V⊗A_f). Being induced by a geometric motive is an additional actual realization/regulator identification, never a consequence of these axioms alone.

**Hypotheses.**

- Import the actual adelic/Galois representations, period modules and small-weight strongly divisible realization; comparisons are morphisms of those objects.
- BK finite Selmer cohomology is the imported condition finite at every finite place. No unproved geometric P3/P4 or regulator bijectivity is silently inserted.

**Inputs.** `MotivesAndAlgebraicCycles:MC.2/realization-equivalence`, `MotivicEtaleKTheory:M.8/regulator-determinant-comparison`, `SelmerIwasawaCohomology:L4/period-realization`, `SelmerIwasawaCohomology:L4/fontaine-laffaille-data`, `SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison`, `SelmerIwasawaCohomology:L2/galois-selmer-group`.

**Source and proof route.**

- **BK**, Definition 5.5 and 5.5.1, pp. 371–372; triple comparisons, p. 374; §4 Theorem 4.1(iii), p. 362. Actual axioms, weight bound and real/adelic regulator identifications.

1. Assemble the displayed comparisons and four testable axioms on genuine supplied objects.
2. Import L4 small-weight crystalline realization for P2; the forbidden finite set may depend on both lattices.
3. Form weight bounds and the two triple comparison maps; keep the assertion of geometric origin separate.

**API.**

- `bloch_kato_motivic_pair.realizations` (projection): Expose V,D, filtration, all continuous coefficient actions and the actual comparison maps.
- `bloch_kato_motivic_pair.axioms` (projection): Expose P1–P4 separately, including the lattice-quantified P2 and every-prime P3.
- `bloch_kato_motivic_pair.weight` (characterisation): Check local reciprocal-root bounds and the real filtration/invariants condition.
- `bloch_kato_motivic_pair.triple` (constructor): Add Φ and the two specified regulator isomorphisms, not arbitrary one-dimensional identifications.
- `bloch_kato_motivic_pair.geometric_origin` (compatibility): A claimed geometric instance includes the actual maps from its motivic cohomology and an explicit proof/assumption of every axiom.

**Checks and worked examples.**

- `bloch_kato_motivic_pair.finite_bad_set` (characterisation): In a supplied rank-one Tate comparison, changing the de Rham lattice L to qL while fixing the Betti lattice T forces q into the P2 bad set; one fixed finite set cannot serve all rational lattice changes.
- `bloch_kato_motivic_pair.all_prime` (characterisation): Agreement of P_p(V_ℓ) only for ℓ≠p fails P3 unless the crystalline factor is also matched.
- `bloch_kato_motivic_pair.real_weight` (characterisation): A nonzero unit motive has V_∞^+≠0 and D_∞⁰=D_∞, so it fails weight ≤−3 at i=0.

**Consumers.**

- `BK Conjecture 5.15`: Specify the genuine input type and regulator comparisons before defining a Tamagawa identity.
- `PS.6 fixed-prime boundary`: Explain which adelic/global axioms are absent from a weaker localized formulation.

### Bloch–Kato points and Tamagawa measure

`PeriodsAndSpecialValues:PS.6/bloch-kato-points-and-measure` · construction

For a BK triple of weight ≤−3 and stable lattice T, set A_T(Q_p)=H_f¹(Q_p,T⊗Zhat) for finite p, and A_T(R)=((D_∞⊗C)/(D_∞⁰⊗C+T))^+ with the diagonal real action. Define A_T(Q) as the inverse image of R_Gal(Φ) inside H_f,Spec(Z)¹(Q,T⊗Zhat). Its rationalization is Φ and its completion is the integral finite Selmer group. Use the supplied BK exponential D_p/D_p⁰→A_T(Q_p), a local isomorphism, to transfer the Haar measure from a rational top-form trivialization ω of det(D/D⁰). At all sufficiently good p its total mass is P_p(V,1). Weight ≤−3 gives convergence of the product of these masses; define μ as the product of finitely many bad/real measures and the good-prime probability product scaled by ∏P_p(V,1). Since μ_p,aω=|a|_p μ_p,ω, the rational product formula makes μ independent of ω. Choose a lift of the real regulator A_T(Q)→A_T(R)/A_T(R)_cpt to define the diagonal arithmetic subgroup; its real image is discrete and cocompact. Set Tam(T) to the induced quotient volume of ∏_{p≤∞}A_T(Q_p)/A_T(Q). Finally Sha(T)=ker[H¹(Q,T⊗Q/Z)/(A_T(Q)⊗Q/Z)→⊕_{p≤∞}H¹(Q_p,T⊗Q/Z)/(A_T(Q_p)⊗Q/Z)]. This is BK’s arithmetic kernel, not a definition by selecting an arbitrary finite group.

**Hypotheses.**

- Use actual cohomology and local exponential maps from the suppliers, with their topology and the triple comparisons.
- Every Haar measure uses its Borel structure and local compactness. Prove probability normalization before infinitePi; the real regulator gives the discrete/cocompact quotient, and the quotient volume is independent of the lift.

**Inputs.** `PeriodsAndSpecialValues:PS.6/bloch-kato-motivic-pair`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `SelmerIwasawaCohomology:L4/period-fundamental-sequences`, `mathlib:MeasureTheory.Measure.haarMeasure`, `mathlib:MeasureTheory.Measure.infinitePi`.

**Source and proof route.**

- **BK**, (5.6)–(5.8), pp. 372–373; Definition 5.9 and triple/global points, pp. 373–374; Lemma 5.10, (5.11)–(5.13) and Proposition 5.14, pp. 375–376. Local/global points, exponential normalization, product measure, quotient volume and arithmetic kernel.

1. Construct local points from imported finite cohomology and the stated real quotient; use BK Theorem 4.1 and P1–P4 for the exponential local isomorphism and good mass.
2. Construct global points by the stated inverse image, using the actual adelic comparison to establish finite generation, rationalization and completion.
3. Normalize good compact factors to probability measures, apply the existing infinite product measure, and restore the convergent mass product. Use the rational product formula for top-form independence.
4. Use the real regulator to establish the arithmetic quotient and independence from the real lift; define its volume.
5. Construct the quotient-localization map on the actual groups and take its kernel. Apply BK Lemma 5.10 and Proposition 5.14 with their hypotheses; do not replace total finiteness by primary finiteness.

**API.**

- `bloch_kato_points_and_measure.local_points` (constructor): Return the finite-cohomology local group or the displayed real quotient.
- `bloch_kato_points_and_measure.global_points` (constructor): Return the inverse image of the actual regulator image; expose rationalization and completion maps.
- `bloch_kato_points_and_measure.local_mass` (compatibility): Outside a proved finite set the ω-normalized local total mass is P_p(V,1).
- `bloch_kato_points_and_measure.tamagawa_measure` (constructor): Return the product measure with the convergent good-prime mass factor and its top-form independence.
- `bloch_kato_points_and_measure.quotient_volume` (projection): Return the quotient volume with its discrete/cocompact and lift-independence witnesses.
- `bloch_kato_points_and_measure.sha` (constructor): Return the kernel of the displayed quotient-localization map.

**Checks and worked examples.**

- `bloch_kato_points_and_measure.good_factor` (characterisation): In a one-dimensional good factor P_p(1)=1−a_p with |a_p|≤p^(−3/2), its mass is 1−a_p, not its inverse.
- `bloch_kato_points_and_measure.probability` (characterisation): Passing unnormalized good Haar factors to infinitePi is invalid: a factor of mass different from 1 must first be normalized and its mass restored.
- `bloch_kato_points_and_measure.rational_form` (characterisation): Scaling ω by 2 multiplies the real measure by 2 and the 2-adic measure by 1/2, leaving the global measure unchanged.
- `bloch_kato_points_and_measure.torsion` (characterisation): The global torsion is H⁰(Q,T⊗Q/Z) by Lemma 5.10; the conjecture’s dual-torsion numerator is a different group.
- `bloch_kato_points_and_measure.zero` (degenerate): For V=D=Φ=0 and T=0 every point group and Sha are zero, the quotient measure has total mass 1 and Tam(T)=1.

**Consumers.**

- `BK Conjecture 5.15`: Provide the actual Tamagawa number and Sha whose equality the next target predicts.
- `PS.6`: Prevent an abstract regulator scalar or a finite p-primary list from standing for a global Tamagawa construction.

### Elliptic fundamental-line adapter

`PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter` · comparison

For E/Q with a fixed global minimal Néron differential, identify the supplied motivic realization H¹(E)(1) of weight −1, its Kummer/finite Selmer cohomology, real regulator exact sequence and integral local terms. Under the required finiteness and comparison hypotheses, translate its commutative fundamental-line assertion into L^(r)(E,1)/r!=Ω_E Reg_E·#Sha(E/Q)·∏_p c_p/#E(Q)_tors². Here r=rank E(Q), Ω_E is the integral of |ω| over all E(R) components, Reg is the determinant of the existing Néron–Tate pairing on a basis of E(Q)/tors, empty determinant 1, and c_p are the actual Néron component-group numbers. An index-m subgroup basis multiplies Reg by m². The equivalence is conditional on the actual regulator and integral Kummer/Tamagawa identifications, not an independent proof of BSD.

**Hypotheses.**

- Mordell–Weil finite generation, heights, local reduction/Tamagawa numbers and Selmer/Sha from the existing EllipticCurves roadmap.
- Sha finiteness and analytic leading term are assumptions unless a separate theorem supplies them; include the real dyadic gate.

**Inputs.** `PeriodsAndSpecialValues:PS.4/local-correction-adapter`, `PeriodsAndSpecialValues:PS.4/real-dyadic-gate`, `PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations`, `RankZeroOneBSD:BSD.8/elliptic-endpoint`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Source and proof route.**

- **BK**, Proposition 5.4, pp. 370–371; §5, pp. 374–377. Abelian Kummer/Selmer comparison and the distinct arithmetic finiteness assumptions.
- **BF**, §3.1, pp. 517–519; Conjecture 4, pp. 535–536. Weight −1 height exactness and the integral fundamental-line conjecture.

1. Import the actual weight −1 motive and Kummer comparison; use BK Proposition 5.4 to separate Selmer information from Sha finiteness.
2. Identify each cohomology/determinant factor with its Mordell–Weil, height, torsion and local component-group counterpart.
3. Check the all-components period and exact minimal differential, then translate Ξ versus Δ orientation to the displayed scalar equality.

**Milestone checks.**

- At r=0, Reg=1, so a zero regulator determinant cannot be used.
- If E(R) has two components, Ω_E is twice the identity-component integral.
- Replacing a Mordell–Weil basis by an index-3 subgroup basis multiplies Reg by 9 and requires the corresponding determinant-index correction.
- A rational cohomology identification alone does not remove the squared torsion denominator.

### BSD prime-by-prime assembly adapter

`PeriodsAndSpecialValues:PS.6/bsd-prime-assembly` · application

Import the BSD.8 endpoint, real identity and source-qualified prime-part dispatch. For analytic rank 0 or 1, a proof packet must separately supply rank equality, finiteness of Sha and the positive real identity, then the p-adic valuation equality at every prime in the finite support certified by the BSD owner. Transport that owner’s all-prime conclusion into the PS.4 line. No new prime-dispatch algorithm is defined here. If even one required prime, including 2 or a bad/residual prime, lacks a proved source-qualified gate, export only the proved localized statement and retain that exact unresolved prime in the integral assertion. Higher-rank BSD remains conjectural.

**Hypotheses.**

- All hypotheses of the actual BSD.8 theorem, including periods, differential, curve, analytic rank and exceptional-prime handling.
- No finiteness of Sha is inferred from its cardinality appearing in a desired identity.

**Inputs.** `PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter`, `RankZeroOneBSD:BSD.8/real-identity`, `RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch`, `RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions`.

**Source and proof route.**

- **BF**, Conjecture 4(iv), pp. 535–536; local formulation Conjecture 6, pp. 536–537. Integral versus localized leading-term assertions; arithmetic rank-zero/one proofs are imported from BSD.8.

1. Match the PS.6 scalar identity to BSD.8’s elliptic endpoint and Ω convention.
2. Apply its existing finite-support and valuation reconstruction only with all gates supplied.
3. Translate the result through the elliptic fundamental-line adapter, without strengthening a localized equality to an integral one.

**Milestone checks.**

- A proof away from 2 retains an unresolved dyadic gate.
- A proved rank equality alone gives neither #Sha nor the leading coefficient.
- When BSD.8 provides every source-qualified prime gate, its all-prime equality transports without redoing rational reconstruction.

### Bloch–Kato Tamagawa predicate

`PeriodsAndSpecialValues:PS.6/bloch-kato-tamagawa` · definition · Planet: **Bloch–Kato Tamagawa conjecture**

For a motivic triple (V,D,Φ) in the precise Bloch–Kato §§5.5–5.11 sense, of weights ≤−3, with the actual real and adelic regulator identifications, let T⊂V be a Z-lattice whose adelic extension is Galois stable. Use PS.6/bloch-kato-points-and-measure’s global points A(Q), local points A(Q_v), finite-condition kernel Sha(T) of (5.12)–(5.13), and Tamagawa measure of Definition 5.9 to define BK_Tam(V,D,Φ,T) as: Sha(T) is finite and Tam(T)=#H⁰(Q,T*⊗Q/Z(1))/#Sha(T). Here T*=Hom_Z(T,Z). Both total finiteness and the equality are conjectural in general. The fixed-ℓ formulation of Remark 5.15.2 is a separate localized statement under its weaker ℓ-adic/regulator hypotheses; it does not imply finiteness over all primes. Weight −1 elliptic BSD uses its separately stated height formulation rather than being forced into this weight-≤−3 definition.

**Hypotheses.**

- The triple comes from an actual motive and satisfies BK’s motivic-pair axioms; their global regulator identifications are supplied, not asserted from a tuple.
- The actual global/local groups, normalized measures and kernel are built by the preceding PS.6 assembly from the imported arithmetic/analytic objects; this target owns the conjectural equality.

**Inputs.** `PeriodsAndSpecialValues:PS.4/integral-fundamental-line`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/selmer-complex`, `SelmerIwasawaCohomology:L2/condition-change-triangle`, `SelmerIwasawaCohomology:L2/lattice-change-cone`, `MotivicEtaleKTheory:M.8/arithmetic-fundamental-line`, `MotivicEtaleKTheory:M.8/regulator-determinant-comparison`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `PeriodsAndSpecialValues:PS.6/bloch-kato-motivic-pair`, `PeriodsAndSpecialValues:PS.6/bloch-kato-points-and-measure`.

**Source and proof route.**

- **BK**, Definition 5.5, pp. 371–372; Definition 5.9 and (5.11)–(5.13), pp. 373–375; Proposition 5.14 and Conjecture 5.15/Remark 5.15.2, pp. 375–377. Original weight range, measure/kernel formula, lattice invariance and distinction between all-prime and fixed-prime statements.

1. Use the preceding actual points/measure construction, including top-form and real-lift independence, then apply the rational product formula.
2. Define the conjunction of finiteness and the precise Tamagawa identity.
3. Use BK Proposition 5.14 for change of lattice only under its hypotheses and distinguish the single-prime variant.

**API.**

- `bloch_kato_tamagawa.finiteness` (projection): Extract total finiteness of Sha(T), not just each primary part.
- `bloch_kato_tamagawa.identity` (projection): Extract the Tamagawa quotient with the dual-torsion numerator.
- `bloch_kato_tamagawa.volume_form` (compatibility): Changing a rational top form rescales local measures by normalized absolute values with product 1.
- `bloch_kato_tamagawa.lattice_change` (compatibility): Use BK Proposition 5.14 to transport the conjecture between stable lattices in the same rational realization.
- `bloch_kato_tamagawa.localized` (projection): A global identity implies its fixed-ℓ version; a single localized version has no converse to total finiteness.

**Checks and worked examples.**

- `bloch_kato_tamagawa.weight_range` (characterisation): A weight −1 elliptic realization is outside this exact definition; Q(2) has weight −4 and is in range when its motivic data are supplied.
- `bloch_kato_tamagawa.primary_finiteness` (characterisation): The group ⊕_p Z/p has finite p-primary parts but is infinite, so primary finiteness cannot witness the global predicate.
- `bloch_kato_tamagawa.product_formula` (characterisation): Scaling the top form by a nonzero rational a changes the product measure by ∏_v|a|_v=1.

**Consumers.**

- `PS.6/PS.7`: Keep the original Tamagawa conjecture separate from BSD and general ETNC.
- `BK Remark 5.15.2`: Allow precisely stated fixed-prime tests without hidden global hypotheses.

### Rankin–Selberg BBK prediction

`PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction` · definition · Planet: **Rankin–Selberg BBK prediction**

Let F/F⁺ be CM, n≥2, and n₀,n₁ the even and odd members of {n,n+1}. Let Π_α be relevant representations of GL_{n_α}(A_F): irreducible cuspidal, conjugate self-dual, with infinity principal-series characters arg^{1−n_α},arg^{3−n_α},…,arg^{n_α−1}. For a common strong coefficient field E and the supplied Galois systems put V_λ=ρ_{Π₀,λ}⊗ρ_{Π₁,λ}(n), normalized to weight −1. Define BBK_rank01 to assert, for every coefficient place λ, L(1/2,Π₀×Π₁)≠0 implies H_f¹(F,V_λ)=0, and global epsilon −1 together with L′(1/2,Π₀×Π₁)≠0 implies dim_{E_λ}H_f¹(F,V_λ)=1. This interface predicts ranks, not an integral leading-term equality or Sha finiteness. The diagonal Abel–Jacobi class Δ_λ lies in a finite direct sum of copies of this Selmer group; its nonvanishing and derivative nonvanishing are separate propositions.

**Hypotheses.**

- Relevant representation and strong coefficient field carriers, Galois systems, Rankin analytic normalization and Bloch–Kato local conditions supplied by their owners.
- The analytic center 1/2 and Tate twist n are transported together; no unproved automorphic tensor-product representation is assumed.

**Inputs.** `PeriodsAndSpecialValues:PS.1/serre-system-predicate`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/selmer-complex`, `SelmerIwasawaCohomology:L4`, `AutomorphicLFunctionsAndLocalFactors:AL.5`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`.

**Source and proof route.**

- **LTXZZ**, §1.1, Definition 1.1.3 and Theorems 1.1.5/1.1.9, published pp. 110–113. Relevant representations, normalization and the two conjectural rank implications; extraction item PAPER-LIU-ETAL-22/beilinson-bloch-kato fixes the ownership boundary.

1. Import Π_α and the normalized Galois tensor product, then the actual finite-condition Selmer group.
2. Form the two implication predicates with their quantifier over all λ.
3. Name the diagonal-cycle class only through its actual Abel–Jacobi construction from the arithmetic level-raising supplier.

**API.**

- `rankin_bbk_prediction.rank_zero` (projection): Extract the nonzero-central-value implication for any λ.
- `rankin_bbk_prediction.rank_one` (projection): Extract the epsilon −1/nonzero-derivative implication for any λ.
- `rankin_bbk_prediction.twist` (compatibility): Changing motivic normalization moves the center and twist together.
- `rankin_bbk_prediction.coefficient_extension` (compatibility): A proved Selmer base-change isomorphism preserves its dimension under extension of E_λ.
- `rankin_bbk_prediction.class_gate` (relation): A nonzero Δ_λ is separate from L′≠0. The route from derivative to a usable nonzero Abel–Jacobi class needs Conjecture 8.3.1, injectivity and the theorem’s actual geometric-level conditions; no converse is supplied.

**Checks and worked examples.**

- `rankin_bbk_prediction.one_place` (characterisation): A rank statement at one admissible λ does not witness the universally quantified prediction.
- `rankin_bbk_prediction.sign` (characterisation): The derivative implication requires epsilon −1; deleting it changes the stated conjectural interface.
- `rankin_bbk_prediction.direct_sum` (characterisation): A nonzero vector in H_f¹⊕…⊕H_f¹ gives a nonzero Selmer group, but is not by itself a dimension-one proof.

**Consumers.**

- `LTXZZ §1.1 and PAPER-LIU-ETAL-22`: Provide the PS.6 conjectural interpretation, separate from the paper’s scoped proof routes.
- `PS.7`: List rank predictions without asserting any general integral formula.

### Rankin rank-zero and rank-one import gates

`PeriodsAndSpecialValues:PS.6/rankin-proved-scope` · comparison

For the preceding Π₀,Π₁ with F⁺≠Q and λ admissible in the full LTXZZ Definition 8.1.1 sense (all L1–L7, not merely λ∤conductor), the published statements are: Theorem 1.1.5/8.2.2, nonzero central value gives H_f¹(F,V_λ)=0; Theorem 1.1.9/8.3.2, Δ_λ≠0 gives dim H_f¹=1. Import either as an unconditional theorem only after the arithmetic level-raising/Euler-system owner resolves its recorded proof gates. PAPER-LIU-ETAL-22 records unresolved issues in these routes, so the present plan uses them only through an explicit supplier witness. To deduce the rank-one conclusion from L′≠0, first use the cycle-nonvanishing prediction of Conjecture 8.3.1 and a separately supplied Abel–Jacobi injectivity statement to obtain a nonzero class satisfying the theorem’s geometric level and transferability conditions. No converse from a nonzero class to L′≠0 is asserted. No all-λ, all-prime or integral equality follows.

**Hypotheses.**

- The supplying Part II of SelmerIwasawaCohomology, routed as ArithmeticLevelRaisingAndBipartiteEulerSystems, must provide the actual class construction and reviewed proof-route contracts.
- The n=2/F⁺=Q relaxation in Remark 1.1.10 has its own proof route and is not inferred from the displayed F⁺≠Q statements.
- For the detailed Theorem 8.3.2 route retain Hypothesis 3.2.10 for n and n+1, the standard indefinite hermitian data and levels, and transferability at the specified bad places; F⁺≠Q permits the introductory theorem route, not omission of these geometric class contracts.

**Inputs.** `PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction`, `SelmerIwasawaCohomology:L4`.

**Source and proof route.**

- **LTXZZ**, Theorems 1.1.5 and 1.1.9, Remark 1.1.10, pp. 111–113; Definition 3.2.5 p. 145; Definition 8.1.1 pp. 303–304; Conjecture 8.3.1 and Theorem 8.3.2 pp. 315–316. Exact ranks, coefficient-prime scope and the distinct derivative-versus-cycle premise.

1. Match the full admissibility predicate and the precise Π/Galois normalization.
2. Require a supplier witness discharging the inherited extraction gates before applying a published conclusion.
3. For the derivative interpretation add the two separate conjectural comparison premises; retain the finite-direct-sum class target.

**Milestone checks.**

- An excluded/nonadmissible λ remains a gate even when the central value is nonzero.
- Δ_λ≠0 proves neither L′≠0 nor an integral formula without additional comparison theorems.
- The 126 issues in the routed extraction are not silently regarded as repaired or independently verified here.

## PS.7 — Certified computations and the research boundary

### Certified period quadrature examples

`PeriodsAndSpecialValues:PS.7/period-quadrature` · construction · Planet: **Certified period quadrature**

Specialize imported rational interval arithmetic and certified subdivision to actual period integrals. First π/4=∫₀¹dx/(1+x²): for S_N=Σ_{k=0}^N(−1)^k/(2k+1), the remainder has sign (−1)^{N+1} and absolute value ≤1/(2N+3), giving rational endpoints. Second, for rational 0<λ<1 define K_λ=∫₀¹dt/√((1−t²)(1−λt²)), as an improper endpoint integral. With t=2u/(1+u²), K_λ=∫₀¹ f_λ(u)du, f_λ(u)=2/√D_λ(u), D_λ(u)=(1+u²)²−4λu². On [0,1], D_λ≥1−λ and |f′_λ|≤8/(1−λ)^(3/2). Thus N≥1 midpoint panels have error ≤2/[N(1−λ)^(3/2)]. Replace this real bound by any certified larger rational and enclose every square root by positive rational square inequalities, adding the accumulated arithmetic widths. For y²=x(1−x)(1−λx), ω=dx/(2y), the oriented real oval over [0,1] has period 2K_λ. This is a specified cycle period; an all-components Néron period requires the separate elliptic adapter.

**Hypotheses.**

- Use exact rational λ, positive radicands and the actual branch/orientation.
- CN.4 supplies interval arithmetic, outward rounding and finite rational error accumulation; generic quadrature is not redefined.

**Inputs.** `PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations`, `ComputationalNumberTheory:CN.4/rational-interval-product`, `ComputationalNumberTheory:CN.4/rational-interval-product-sound`, `ComputationalNumberTheory:CN.4/outward-dyadic-rounding`, `ComputationalNumberTheory:CN.4/outward-rounding-width`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, `ComplexComparisonPartII:C5/multiplicative-period-interface`, `mathlib:intervalIntegral`, `mathlib:intervalIntegral.norm_integral_le_of_norm_le`, `mathlib:intervalIntegral.integral_comp_mul_deriv'`, `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Source and proof route.**

- **Johansson**, §§1–2, pp. 1–3. Validated interval subdivision and the requirement to certify analytic domains and branches; the explicit two integrands and elementary bounds are specializations proved here.

1. For the arctangent example integrate the finite geometric identity and bound the signed remainder.
2. For the elliptic example prove the rational substitution on truncated intervals and pass to the integrable endpoint limit; cancellation gives the nonsingular f_λ.
3. Use D=(1−u²)²+4(1−λ)u² or D≥(1−λ)(1+u²)² to prove positivity and the derivative bound.
4. For N equal panels integrate the Lipschitz midpoint error L/(4N), then combine rational enclosure and rounding errors.
5. Apply the actual cycle/form substitution to obtain 2K_λ, preserving the oval orientation.

**API.**

- `period_quadrature.arctan_bounds` (constructor): Return rational bounds from S_N and its signed remainder, enclosing π/4.
- `period_quadrature.legendre_integrand` (data): Return f_λ with its rational polynomial D_λ and positive square-root branch.
- `period_quadrature.legendre_change_variable` (compatibility): Identify the endpoint integral K_λ with the regular integral of f_λ.
- `period_quadrature.midpoint_bound` (characterisation): For N≥1 the exact midpoint sum differs from K_λ by at most 2/[N(1−λ)^(3/2)].
- `period_quadrature.rounded_enclosure` (constructor): Return rational endpoints with the analytic and rounding errors both added.
- `period_quadrature.elliptic_cycle` (compatibility): The explicitly oriented oval period of dx/(2y) is 2K_λ, not K_λ or an unspecified total period.

**Checks and worked examples.**

- `period_quadrature.arctan_first` (characterisation): N=0 gives 2/3≤π/4≤1; N=1 gives 2/3≤π/4≤13/15.
- `period_quadrature.lambda_half` (characterisation): For λ=1/2, D_λ(u)=1+u⁴≥1, so no endpoint branch singularity remains after substitution.
- `period_quadrature.wrong_branch` (characterisation): Choosing the negative square root reverses the period sign and is rejected by the positive-branch certificate.
- `period_quadrature.endpoint_excluded` (characterisation): λ=1 is excluded: K_λ diverges and the bound’s denominator vanishes.

**Consumers.**

- `PS.7 normalization tests`: Provide reproducible rigorous enclosures for a rational-period integral and a genuine elliptic cycle.
- `PS.8`: Illustrate why an analytic function approximation needs an actual geometric period comparison.

### Certified normalized-value enclosure

`PeriodsAndSpecialValues:PS.7/normalized-enclosure` · construction · Planet: **Normalized-value enclosure**

Given a supplied L-value or derivative enclosure, a nonzero period enclosure excluding 0, exact algebraic correction factors with their chosen embeddings, and the proved period-identification map, construct an outward rational complex box enclosing the normalized finite value. Import Dirichlet exact factors from L0, analytic GL1/GL2 formulas and zero-factor leading corrections from AL.1/AL.5, and certified L-enclosures from CN.4. Division requires a certified lower bound for the denominator norm. An exact algebraic recognition theorem additionally requires a separately proved discrete candidate set and separation bound, or an exact symbolic identity; interval overlap alone is only a numerical test.

**Hypotheses.**

- Each enclosure comes with its soundness theorem and all truncation/rounding errors; exact coefficient field and complex embeddings fixed.
- At exceptional zeros use leading terms and the matching derivative orders, not division by a zero correction.

**Inputs.** `PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter`, `PeriodsAndSpecialValues:PS.1/modular-period-adapter`, `PeriodsAndSpecialValues:PS.7/period-quadrature`, `DirichletPadicLFunctions:L0/normalized-value-complex-embedding`, `AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term`, `ComputationalNumberTheory:CN.4/complex-box-denotation`, `ComputationalNumberTheory:CN.4/rational-interval-inverse`, `ComputationalNumberTheory:CN.4/rational-interval-inverse-sound`, `ComputationalNumberTheory:CN.4/dirichlet-l-value-enclosure`, `ComputationalNumberTheory:CN.4/cusp-l-value-enclosure`, `ComputationalNumberTheory:CN.4/integer-recovery-sound`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`.

**Source and proof route.**

- **Johansson**, §§1–2, pp. 1–3. Sound enclosures and rigorously bounded truncation; exact normalization is supplied by the cited arithmetic adapters.

1. Transport all exact normalization maps first, including finite/completed distinction, Tate factors and Euler corrections.
2. Apply the imported product/inverse/rounding soundness to combine numerator, denominator and algebraic-factor boxes.
3. For exact recovery use the supplier’s integer/algebraic separation certificate only with a proved membership premise.

**API.**

- `normalized_enclosure.enclose` (constructor): Return a box with a proof that it contains the specified normalized finite value.
- `normalized_enclosure.denominator` (projection): Expose a strict positive lower bound for the period norm before inversion.
- `normalized_enclosure.exact_factor` (compatibility): Evaluate an exact algebraic factor at the selected embedding before enclosing it.
- `normalized_enclosure.error_budget` (projection): Expose separate analytic-tail, period, algebraic-evaluation and rounding contributions.
- `normalized_enclosure.recover_exact` (characterisation): Exact recovery requires a proved discrete membership/separation premise or symbolic equality.

**Checks and worked examples.**

- `normalized_enclosure.denominator_zero` (characterisation): A period box containing zero is rejected for division even if its midpoint is nonzero.
- `normalized_enclosure.zeta_two` (characterisation): The exact target for ζ(2)/(2πi)^2 is −1/24; a box near +1/24 fails the Tate-sign normalization.
- `normalized_enclosure.recognition` (characterisation): A tiny interval containing 1/2 does not prove its unknown value is rational.
- `normalized_enclosure.local_zero` (characterisation): A vanishing Euler polynomial invokes the leading-term adapter and changes the derivative order.

**Consumers.**

- `PS.7 certified computations`: Compare arithmetic examples using exact maps and rigorous errors.
- `RS-13 direct supplier links`: Use L0, AL.1 and AL.5 directly instead of rebuilding their arithmetic/analytic inputs.

### Normalization covariance of comparisons

`PeriodsAndSpecialValues:PS.7/normalization-covariance` · theorem · Planet: **Normalization covariance**

For each proved scalar comparison, carry an explicit ledger of coefficient embedding, Betti/de Rham bases, regulator normalization, lattice index, differential, Haar measure and finite Euler set. If the comparison matrix changes to C⁻¹PA its determinant changes by det(A)/det(C); a rank-r regulator scaled by a changes by a^r; a finite-index Mordell–Weil basis changes its height determinant by index²; Γ_C,D versus Γ_C,B changes the completion by 2^b; and Tate’s Haar scaling dμ↦c dμ changes a local epsilon by c^{dim V}. Transport the numerator and denominator through these exact identities before comparing enclosures. State and prove covariance of each example’s normalized value, rather than claiming every numerical ratio is invariant under arbitrary independent convention changes.

**Hypotheses.**

- Each transformation is an actual supplied comparison or proved formula and the maps are composable in the chosen example.
- Measures use positive scaling; orientations and coefficient-field units remain distinct from absolute values.

**Inputs.** `PeriodsAndSpecialValues:PS.0/comparison-period-line`, `PeriodsAndSpecialValues:PS.1/archimedean-completion`, `PeriodsAndSpecialValues:PS.3/regulator-specializations`, `PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter`, `PeriodsAndSpecialValues:PS.7/normalized-enclosure`.

**Source and proof route.**

- **Deligne**, §5.1, pp. 15–16 (English translation PDF pages). Period determinant and Tate covariance.
- **Tate**, (3.4.3)–(3.4.4), printed p. 15. Haar-measure and additive-character dependence.
- **Johansson**, §2, pp. 2–3. Interval outputs require sound propagation through the actual operations.

1. Apply the PS.0 basis formula, PS.3 determinant scaling and PS.6 lattice formula.
2. Use the PS.1 gamma normalization and Tate’s local-measure identity.
3. Compose the maps and transform both sides of each equality; propagate enclosure widths through the imported sound arithmetic.

**Milestone checks.**

- A rank-2 regulator multiplied by 2 changes determinant by 4.
- An index-2 Mordell–Weil sublattice changes the height determinant by 4, independently of the components factor in Ω.
- For a rank-4 local representation, Haar scaling by 2 changes epsilon by 16.

### Period conjecture and special-value boundary

`PeriodsAndSpecialValues:PS.7/period-conjecture-boundary` · definition · Planet: **Period conjecture**

For the full localized formal-period algebra and actual evaluation per:P→C, define PeriodConjecture as injectivity of per. It says precisely that an equality of numerical evaluations implies the corresponding formal relation; it is not implied by the torsor theorem. Keep this predicate separate from DeligneAlgebraic, LeadingTermRational, ETNC, BK_Tam, BBK_rank01 and the higher-rank BSD assertion of the elliptic adapter. Every exported theorem names the exact subset of these hypotheses it uses. A certified inequality is a theorem about an enclosure, and an observed numerical agreement supplies no witness to any of these general conjectures.

**Hypotheses.**

- P and per are the full localized constructions, not the effective algebra alone.

**Inputs.** `PeriodsAndSpecialValues:PS.2/torsor-integration-comparison`, `PeriodsAndSpecialValues:PS.1/deligne-algebraicity`, `PeriodsAndSpecialValues:PS.3/leading-term-line`, `PeriodsAndSpecialValues:PS.5/etnc-predicate`, `PeriodsAndSpecialValues:PS.6/bloch-kato-tamagawa`, `PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction`, `PeriodsAndSpecialValues:PS.6/bsd-prime-assembly`, `PeriodsAndSpecialValues:PS.7/normalized-enclosure`.

**Source and proof route.**

- **HMS**, Theorem 0.2, p. 2; Definition 2.8 and Theorem 2.10, pp. 10–11. The full formal/torsor comparison supplies evaluation; injectivity is an additional period conjecture.
- **BF**, Conjecture 4, pp. 535–536. Special-value assertions have their own analytic, rational and integral premises.

1. Define injectivity on the imported period map.
2. Use the already proved relation-respecting direction without adding an injectivity proof.
3. Record each named special-value predicate by reference to its unique earlier owner, and keep its explicit proof gates.

**API.**

- `period_conjecture_boundary.injective` (characterisation): PeriodConjecture is exactly ∀x,y∈P, per(x)=per(y) implies x=y.
- `period_conjecture_boundary.kernel` (equivalence): Equivalently the kernel of per is zero.
- `period_conjecture_boundary.formal_to_numeric` (compatibility): Formal equality always implies numerical equality without the conjecture.
- `period_conjecture_boundary.numeric_to_formal` (relation): The converse requires the injectivity hypothesis.
- `period_conjecture_boundary.separate_gates` (projection): The other named special-value assertions remain the existing predicates at their stated coefficient and prime scopes.

**Checks and worked examples.**

- `period_conjecture_boundary.localization` (characterisation): The inverse-Tate relation is already formal and needs no injectivity assumption.
- `period_conjecture_boundary.torsor` (characterisation): A torsor with a chosen complex point does not by itself force its coordinate evaluation to be injective.
- `period_conjecture_boundary.numeric` (characterisation): Overlapping error bars alone cannot establish formal equality or an exact leading coefficient.

**Consumers.**

- `PS.9`: Separate motivic identities from numerical identities through the actual evaluation map.
- `PS.7 research boundary`: Keep all general period and special-value conjectures explicit.

## PS.8 — Arithmetic mirror symmetry and period equations

### The resolved Dwork quartic family

`PeriodsAndSpecialValues:PS.8/quartic-pencil` · construction

For t in B = A¹_C minus {t : t⁴ = 1}, F_t is Σ_i X_i⁴ − 4tX_0X_1X_2X_3 = 0 in P³. Let G = {(a_i) in μ₄⁴ : Πa_i = 1}/diagonal μ₄. Define X→B as the simultaneous minimal resolution of F/G. The quotient has six A₃ singularities; X→B is proper smooth with K3 fibres. Retain the quotient map and the exceptional divisors. t=0 is a smooth Fermat fibre; t=∞ is a degeneration. The coarse coordinate z=(4t)⁻⁴ is used only on t≠0.

**Inputs.** `MotivesAndAlgebraicCycles:MC.2`.

**Source and proof route.**

- **H**, §4.1, Propositions 4.1–4.4, PDF pp.10–11. The invariant quotient and its relative A₃ resolution give this selected family; generic geometry remains G4.

1. Check the Jacobian criterion for F_t away from t⁴=1. Form the explicit invariant quotient ΣY_i−4tY₄=0, Π_{i<4}Y_i=Y₄⁴ in P⁴.
2. Resolve the six A₃ loci relatively as in the source; import the general quotient, resolution and cohomological realisation interfaces from the geometry supplier, rather than inventing a generic resolution theory.

**API.**

- `quartic_polynomial` (data): The homogeneous equation is ΣX_i⁴−4tΠX_i.
- `quartic_group` (data): G is the product-one subgroup of μ₄⁴ modulo its diagonal μ₄; its order is 16.
- `quartic_resolution` (projection): The proper resolution X→F/G is an isomorphism away from the six A₃ sections.

**Checks and worked examples.**

- `quartic_fermat_test` (computation): At t=0 the equation is ΣX_i⁴.
- `quartic_singular_test` (non-example): At t=1 the point [1:1:1:1] is singular; t=1 is excluded from B.
- `quartic_zero_test` (non-example): t=0 belongs to B although z has a pole there; an ODE singularity after quotienting parameters need not be a singular geometric fibre.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quartic-residue, PeriodsAndSpecialValues:PS.8/quartic-lattice`: The explicit resolved model supplies the domain for the descended residue, the rank-19 cycle lattice and its orthogonal complement.

### The normalized quartic residue form

`PeriodsAndSpecialValues:PS.8/quartic-residue` · construction

Let Ξ_t=(Σ_i (−1)^i X_i dX_0∧⋯∧hat(dX_i)∧⋯∧dX_3)/F_t. Use Hartmann’s tube-normalized residue, containing a factor 2πi. Its G-invariant residue descends and extends to a nowhere-vanishing relative two-form Ω on X/B. In the affine chart X_0=1 its local expression is 2πi dz₁∧dz₂/(4z₃³−4tz₁z₂).

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-pencil`, `PeriodsAndSpecialValues:PS.0/comparison-period-line`, `ComplexComparisonPartII:C5/gauss-manin-connection`.

**Source and proof route.**

- **H**, §4.2, Propositions 4.6–4.7 and formula (5), PDF pp.12–13. The residue, its group invariance and extension across the resolution use the tube-normalized factor 2πi.

1. Compute the residue on charts where the indicated partial derivative is nonzero and glue.
2. Use G-invariance and the crepant minimal resolution to descend and extend the form. Retain the tube integration convention in the Betti comparison.

**API.**

- `quartic_residue_local` (simp): On the indicated smooth chart Ω has the displayed 2πi-normalized expression.
- `quartic_residue_invariant` (compatibility): Pullback of Ω to F_t equals the G-invariant residue of Ξ_t.
- `quartic_residue_period` (compatibility): Integration over a two-cycle equals the tube integral of Ξ_t with the same residue convention.

**Checks and worked examples.**

- `quartic_residue_factor_test` (computation): At t=0 the local denominator is 4z₃³, and the numerator still contains 2πi.
- `quartic_residue_invariance_test` (compatibility): A product-one diagonal μ₄ substitution leaves the descended form unchanged.
- `quartic_residue_chart_test` (non-example): The displayed quotient is a chart formula only where 4z₃³−4tz₁z₂ is nonzero; zero denominator does not make Ω singular on X_t.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quartic-picard-fuchs`: Griffiths reduction differentiates this normalized relative two-form; tube integration fixes the period scalar.

### Quartic Gauss–Manin reduction

`PeriodsAndSpecialValues:PS.8/quartic-picard-fuchs` · theorem

On B the Gauss–Manin class Ω satisfies D_tΩ=0, where D_t=∂_t³−(6t³∂_t²+7t²∂_t+t)/(1−t⁴). Every locally horizontal two-cycle γ gives D_t∫_γΩ=0. With z=(4t)⁻⁴ and y=t∫_γΩ, the equation becomes L_z y=0 with L_z=θ³−4z(4θ+1)(4θ+2)(4θ+3), θ=z∂_z. The singular coarse parameters are 0,1/256,∞. The pullback identity is L_z=(1−t⁴)/64 · D_t∘m_{1/t}, not D_t∘m_t.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-residue`, `ComplexComparisonPartII:C5/gauss-manin-connection`.

**Source and proof route.**

- **H**, Proposition 4.14, pp.16–17; Proposition 4.26, p.21, corrected by E1.

1. Reduce the third parameter derivative of the rational residue form modulo exact forms, using the Jacobian relations in the source.
2. Apply the horizontal-cycle pairing, then θ=−t∂_t/4. Expand the operators to check the scalar and the direction of the multiplication operator.

**Milestone checks.**

- The constant input gives L_z(1)=−24z=−3/(32t⁴) after pullback.
- Raw periods have the asymptotic t⁻¹w₀((4t)⁻⁴), not tw₀.

### The quartic transcendental lattice and marking

`PeriodsAndSpecialValues:PS.8/quartic-lattice` · definition · Planet: **Quartic period lattice**

Use T₀=⟨4⟩⊕U on the ordered basis (h,e,f), Gram matrix G₀=[[4,0,0],[0,0,1],[0,1,0]]. The rank-19 primitive lattice M₂ lies in H²(X_t,Z), and its orthogonal complement is the constant marked rank-three lattice T₀ on the universal cover. M₂⊕T₀ gives a rational splitting; do not assert an integral direct sum. The period line is [p h−e+2p²f] for p in the upper half-plane.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-pencil`, `PeriodsAndSpecialValues:PS.0/comparison-period-line`.

Existing upstream input: [TauCetiRoadmap/IntegralLattices](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/IntegralLattices/README.md), targets 5H, 6A. Primitive-embedding uniqueness in the specified even unimodular K3 lattice; indefinite even-unimodular classification. Read in current upstream; the atlas snapshot has only the retired Completed/IntegralLattices predecessor. G5 records the catalogue linkage still required.

**Source and proof route.**

- **H**, Theorem 4.8, Theorems 4.10–4.12 and Corollary 4.13, PDF pp.13–16; Proposition 4.24, p.20. The selected rank-three marked complement and rational splitting are valid; the generic uniqueness assertion in Theorem 4.12 is corrected by E3.
- **IL**, Layer 5H (Nikulin Theorem 1.14.4) and Layer 6A; README at the recorded commit, unpaginated. Supplies ambient-even-unimodular primitive-embedding uniqueness and K3 lattice classification. These existing targets are imported, not planned here.

1. Use the quotient/resolution cycles and polarization to construct M₂ and its primitive rank-three complement T₀. H² of a K3 is the even unimodular lattice of signature (3,19); reuse current IntegralLattices 6A for its lattice identification.
2. Reuse IntegralLattices 5H, with the ambient lattice explicitly even unimodular, to match the two primitive T₀ embeddings. Here sign(T₀)=(2,1), its discriminant length is 1, and the complement rank is 19, so the strict signature inequalities and local length conditions hold. Hartmann Theorem 4.12 without ambient unimodularity is false (E3), but its K3 application meets the corrected hypotheses.
3. Compute the orthogonal complement and retain the discriminant gluing: M₂⊕T₀ splits rationally, not as an integral direct sum. Transport the selected marking to the universal cover. G5 records the missing atlas identifier for the already existing upstream supplier, not a new lattice theorem.

**API.**

- `quartic_gram` (data): The marked pairing has matrix G₀ and determinant −4.
- `quartic_period_line` (data): p maps to [p,−1,2p²], whose self-pairing is zero.
- `quartic_marking_transport` (functoriality): Marked cycles transport along based paths and transport respects concatenation and the pairing.

**Checks and worked examples.**

- `quartic_gram_test` (computation): h²=4, e²=f²=0 and e·f=1.
- `quartic_isotropic_test` (computation): For v=(p,−1,2p²), vᵀG₀v=0.
- `quartic_discriminant_test` (non-example): det G₀=−4, so T₀ is not the unimodular lattice ⟨1⟩⊕U.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quartic-monodromy`: The Gram form and marked basis define the Picard–Lefschetz matrices, their dual action on period coordinates and p=-a/b.

### Integral quartic monodromy and period normalization

`PeriodsAndSpecialValues:PS.8/quartic-monodromy` · theorem

At t₀=i/√2 use Hartmann Figure 2 based loops around i,−1,−i,1. In the convention PT_γ(h,e,f)=(h,e,f)M_γ, the matrices are M₁=[[1,0,0],[0,0,1],[0,1,0]], M₂=[[5,1,−3],[−12,−2,9],[4,1,−2]], M₃=[[17,6,−6],[−24,−8,9],[24,9,−8]], M₄=[[5,3,−1],[−4,−2,1],[12,9,−2]], M∞=[[1,4,0],[0,1,0],[−16,−32,1]]. They satisfy M_iᵀG₀M_i=G₀ and M∞M₄M₃M₂M₁=1. For Ω=a h+b e+c f, the row (a,b,c) continues by G₀M_γG₀⁻¹. The coordinate p=−a/b transforms at infinity by p↦p+4 and for γ₁ by p↦−1/(2p).

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-lattice`, `PeriodsAndSpecialValues:PS.8/quartic-picard-fuchs`.

**Source and proof route.**

- **H**, Theorem 4.8, pp.13–16; Propositions 4.21–4.25, pp.19–21.

1. Compute Picard–Lefschetz reflections in the explicitly marked vanishing cycles; multiply in the source’s based-loop order.
2. Pass to the dual period pairing rather than applying the cycle matrix directly to the coordinate row. Use the period-line formula to obtain the Möbius transformations.

**Milestone checks.**

- (M∞−1)³=0 but (M∞−1)²≠0.
- Both the translation and reflection are required to normalize the analytic ratio.

### The quartic Frobenius solutions

`PeriodsAndSpecialValues:PS.8/quartic-frobenius-series` · construction · Planet: **Quartic Picard–Fuchs solutions**

Put A_n=(4n)!/(n!)⁴, H_n^(r)=Σ_{j=1}^n j⁻ʳ, H_n=H_n^(1), g_n=4A_n(H_{4n}−H_n), h_n=A_n(16(H_{4n}−H_n)²−16H_{4n}^(2)+4H_n^(2)). Define w₀=ΣA_nzⁿ, g=Σg_nzⁿ, h=Σh_nzⁿ. On a chosen logarithm branch, f₀=w₀, f₁=w₀log z+g, f₂=w₀(log z)²/2+g log z+h/2 form a solution basis for L_z on 0<|z|<1/256. These are periods of tΩ after geometric normalization, rather than Ω itself.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-picard-fuchs`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.derivative`.

**Source and proof route.**

- **H**, §4.7, pp.21–23, formulas preceding Theorem 4.29.

1. Introduce A_n(ρ)=Π_{k=1}^{4n}(4ρ+k)/Π_{k=1}^n(ρ+k)⁴. Differentiate z^ρΣA_n(ρ)zⁿ up to order two at ρ=0, with factorial normalization.
2. The coefficient recurrence n³A_n=4(4n−3)(4n−2)(4n−1)A_{n−1} gives the equation; the ρ-family has residual ρ³z^ρ, which disappears in these derivatives. Apply the ratio test and the distinct logarithmic orders.

**API.**

- `quartic_coefficient_recurrence` (relation): For n≥1 the displayed third-order recurrence holds.
- `quartic_frobenius_analytic` (compatibility): The formal series define the indicated holomorphic/logarithmic solutions on the radius-1/256 punctured disk.
- `quartic_frobenius_initial` (simp): A₀=1 and g₀=h₀=0; these pin the logarithmic solution’s additive constant.

**Checks and worked examples.**

- `quartic_coefficients_test` (computation): A₁=24, A₂=2520 and A₃=369600.
- `quartic_log_coefficient_test` (computation): g₁=104 and g₂=12276.
- `quartic_empty_harmonic_test` (degenerate): H₀^(r)=0, so g₀=h₀=0.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quartic-symmetric-square, PeriodsAndSpecialValues:PS.8/quartic-mirror-coordinate, PeriodsAndSpecialValues:PS.8/quartic-local-continuation`: The coefficient arrays supply the analytic solution basis, its symmetric-square expression and the numerator g in the normalized mirror coordinate.

### Quartic hypergeometric symmetric square

`PeriodsAndSpecialValues:PS.8/quartic-symmetric-square` · theorem

On |256z|<1, w₀(z) = ₂F₁(1/8,3/8;1;256z)² = ₃F₂(1/4,1/2,3/4;1,1;256z). Use the existing ordinary hypergeometric series only for ₂F₁. The rank-three equation is the symmetric square of the corresponding rank-two equation.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-frobenius-series`, `mathlib:ordinaryHypergeometricSeries`.

**Source and proof route.**

- **LYH**, Proposition 3.1 and proof, pp.3–4; specialization λ=256, ν=1/4.

1. Apply the parameter-specialized second-order equation and derive its symmetric-square third-order operator.
2. Match the normalized analytic solutions at zero using their coefficient recurrences; this identity is an analytic hypergeometric identity, not by itself the Betti period comparison.

**Milestone checks.**

- The coefficient of z is 24 on both sides.

### Quartic local continuation and reflection

`PeriodsAndSpecialValues:PS.8/quartic-local-continuation` · theorem

First define the local analytic ratio P_loc(s) near s=1 on a slit neighbourhood, with U₁(s)=Γ(1/8)²/Γ(1/2)·₂F₁(1/8,1/8;1/2;1−s⁴) and U₂(s)=Γ(5/8)²/Γ(3/2)·(s⁴−1)^(1/2)₂F₁(5/8,5/8;3/2;1−s⁴). On the branch continued from real s>1, P_loc=i/√2·(U₁+cot(π/8)U₂)/(U₁−cot(π/8)U₂). For the marked geometric normalization based on the ray t=i·s, pull this formula back by s=−it to a slit neighbourhood of t=i: there p(t)=P_loc(−it). Thus the γ₁ square-root sign change sends p to −1/(2p). This uses the equal parameters corrected by E2. In the distinct based chart at t=1, γ₄ acts by p↦1−1/(2(p−1))=(3−2p)/(2−2p), so its centred local coordinate is p−1. Do not identify the two based loops or their unshifted local coordinates (E4).

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-symmetric-square`, `PeriodsAndSpecialValues:PS.8/quartic-frobenius-series`, `mathlib:Complex.Gamma_mul_Gamma_eq_betaIntegral`, `mathlib:Complex.Gamma_mul_Gamma_one_sub`.

**Source and proof route.**

- **NS**, §3.3, formula (26), printed p.9 (PDF p.10); §5.2, formula (39), printed p.14. Supplies the local ratio at the normalized real parameter and its square-root reflection; the packet then explicitly pulls it back to the marked t=i chart.
- **H**, Proposition 4.24, PDF p.20; Proposition 4.25, pp.20–21; Theorems 4.28–4.29, pp.22–23, corrected by E2 and E4. The geometric γ₁ and γ₄ actions differ by translation conjugation. The local formula at s=1 must be pulled to t=i before applying the γ₁ normalization criterion.

1. Continue the rank-two hypergeometric solutions from s⁻⁴ to 1−s⁴ using the Euler integral and beta/Gamma identity; inversion gives equal upper pairs. Differentiate in the Frobenius parameter to obtain the logarithmic companion and Gamma factors, using the real logarithm for s>1.
2. Pull the local formula back by t=i·s, so its large-parameter ray is the normalizing ray t=i√2 and its slit neighbourhood is at t=i. Since (−it)⁴=t⁴, the pulled series and the chosen logarithmic branch agree there. The square-root sign change supplies the γ₁ reflection; with the infinity translation it fixes the additive constant by Hartmann Proposition 4.25.
3. Keep the γ₄ chart separate. Conjugating R(p)=−1/(2p) by T(p)=p+1 gives T R T⁻¹(p)=1−1/(2(p−1)), the γ₄ action already computed from its matrix. Hartmann’s Theorem 4.29 proof treats the images of these distinct based loops as equal; E4 records the correction to that argument.

**Milestone checks.**

- The first regular solution has coefficient 1/32 at u=1−s⁴=0; Hartmann’s erroneous unequal pair gives 3/32.
- At U₂=0 the γ₁ local fixed point is p=i/√2; the γ₄ fixed points are 1±i/√2 in its based geometric coordinate.

### The normalized mirror coordinate

`PeriodsAndSpecialValues:PS.8/quartic-mirror-coordinate` · definition · Planet: **Normalized quartic mirror map**

In Q[[z]], q(z)=z exp(g(z)/w₀(z)); define Z(q) as its compositional inverse, which exists since q₀=0 and q₁=1. The analytic period coordinate is p=(2πi)⁻¹ f₁/f₀ on the chosen branch, hence exp(2πip)=q(z). Match this p to the geometric marked p by the monodromy theorem, not merely by L_z. Use log z real on the chosen ray t=i√2 and analytic continuation from it.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-frobenius-series`, `PeriodsAndSpecialValues:PS.8/quartic-monodromy`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.substInv`, `PeriodsAndSpecialValues:PS.8/quartic-local-continuation`.

**Source and proof route.**

- **H**, Theorem 4.29 and Proposition 4.30, pp.22–23; normalization proof corrected by E4. The series and cusp normalization hold; the based-loop identification used in the printed proof is replaced by the explicit γ₁ local chart.

1. Form the exponential because g/w₀ has zero constant term and w₀ is a unit. Reuse the generic formal-series inverse from Mathlib.
2. Use the local-continuation theorem after its explicit pullback s=−it to the γ₁ chart, maximal-unipotent translation and Hartmann Proposition 4.25 to match the ratio to the integral marking. Keep γ₁ and γ₄ based continuations distinct (E4). The common t-rescaling cancels from the ratio.

**API.**

- `quartic_mirror_initial` (simp): coeff₀(q)=0 and coeff₁(q)=1.
- `quartic_mirror_inverse` (relation): q∘Z=Z∘q=X as formal series.
- `quartic_mirror_period` (compatibility): On the stated branch q=exp(2πip) for the marked geometric period coordinate.

**Checks and worked examples.**

- `quartic_mirror_coefficients_test` (computation): q=z+104z²+15188z³+2585184z⁴ modulo z⁵.
- `quartic_inverse_coefficients_test` (computation): Z=q−104q²+6444q³−311744q⁴ modulo q⁵.
- `quartic_scaling_test` (non-example): Replacing z by t⁻⁴ multiplies the parameter by 256 and changes the leading normalization; its series coefficients are not the stated coefficients in z.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quartic-modular-relation`: The normalized inverse Z(q) selects the modular-polynomial branch with leading coefficient one, which is required by integral coefficient induction.

### The quartic modular relation

`PeriodsAndSpecialValues:PS.8/quartic-modular-relation` · theorem

Let x=1/j(q)=q+O(q²), where classical j is normalized by j=q⁻¹+744+⋯, and y=Z(q). Then P(x,y)=0, with P=−x²+xy−432x²y−207xy²−62208x²y²−y³+3456xy³−2985984x²y³. This statement uses the integral q-expansion and Schwarzian equation of the classical normalized j-invariant as a supplier input.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-mirror-coordinate`, `ModularCurvesPartII:R13.3`.

**Source and proof route.**

- **LYA**, §5.5, equations (5.18)–(5.19), printed p.21 (PDF p.22); §§4–5.1 for normalization. The displayed polynomial uses x=1/j, while the source also uses J=j/1728. The normalized cusp branch agrees.

1. Substitute the algebraic modular relation into the Schwarzian equation and verify equality of the rational differential expressions.
2. Match the normalized series at the cusp to select the branch. Keep j versus the source’s J=j/1728 distinct: x=1/(1728J).

**Milestone checks.**

- The degree-two homogeneous part is −x²+xy, so ∂_yP₂(1,1)=1.

### Integrality of the quartic mirror map

`PeriodsAndSpecialValues:PS.8/quartic-integrality` · theorem · Planet: **Quartic mirror-map integrality**

Every coefficient of Z(q) and q(z) is an integer. More precisely, for P in Z[x,y] whose least nonzero homogeneous part P_ℓ obeys P_ℓ(1,1)=0 and m=∂_yP_ℓ(1,1)≠0, for x(q)∈q+q²Z[[q]] and a normalized branch y(q)∈q+q²Q[[q]] with P(x,y)=0, coefficient induction gives y∈Z[1/m][[q]]. For the quartic relation ℓ=2 and m=1. No denominator prime is inverted in this integrality assertion; the geometry and crystalline good-prime restrictions are separate.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quartic-modular-relation`, `mathlib:PowerSeries.substInv`.

**Source and proof route.**

- **LYA**, §6, equations (6.1)–(6.4), printed p.22 (PDF p.23); quartic application, printed p.23. Coefficient induction over Z[1/m] gives integrality for the quartic m=1; the generic branch includes x=q+O(q²).

1. At each coefficient, the first occurrence of the new y-coefficient has multiplier m; the remainder is integral over Z[1/m] by induction. Include x=q+O(q²) among the hypotheses used by the source’s argument.
2. Use x=1/j with its integral expansion and m=1. Formal inversion of a series with leading coefficient one preserves integer coefficients, giving integrality of q. Do not apply Lian–Yau’s prime-degree theorem to degree four.

**Milestone checks.**

- Z₂=−104 and Z₃=6444 are integers.
- No enumerative identity or Frobenius congruence is inferred from this result.

### The invariant Dwork quintic family

`PeriodsAndSpecialValues:PS.8/quintic-pencil` · definition

For p an odd prime different from 5 and C_p a completed algebraic closure of Q_p, use V_λ: φ_λ=λΣ_{i=1}^5x_i⁵+Πx_i=0 in P⁴. Its smooth parameter locus is λ≠0 and 1+5⁵λ⁵≠0. The product-one diagonal μ₅ action modulo scalar μ₅ has order 125; the permutation group Σ₅ also acts. Select the rank-four invariant part of H³, not the full rank-204 cohomology. The formal point λ=0 is a degeneration and its limiting extension is not H³ of a smooth boundary fibre.

**Inputs.** `MotivesAndAlgebraicCycles:MC.2`.

**Source and proof route.**

- **SH**, §§3.1–3.3, pp.3–5; §4.1.

1. Compute the partial derivatives and the critical parameter equation. Construct the group-invariant projector over Q_p because p≠5.
2. Use the homogeneous twisted de Rham description in the source for the selected invariant part. Do not identify it with an unproved resolved mirror quotient.

**API.**

- `quintic_polynomial` (data): φ_λ=λΣx_i⁵+Πx_i.
- `quintic_invariant_projector` (constructor): The projector is 125⁻¹Σ_{g∈G}g on H³, with compatible Σ₅ action.
- `quintic_smooth_locus` (characterisation): In characteristic zero the stated family is smooth exactly when λ≠0 and 1+5⁵λ⁵≠0.

**Checks and worked examples.**

- `quintic_zero_test` (degenerate): At λ=0 the equation is Πx_i=0, a union of coordinate hyperplanes.
- `quintic_rank_test` (non-example): The selected invariant space has dimension 4, whereas the full H³ has dimension 204.
- `quintic_group_test` (computation): The diagonal quotient group has order 125, so its averaging projector is not integral at p=5.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quintic-formal-connection`: The invariant summand and smooth parameter locus determine the twisted de Rham complex and its formal rank-four basis.

### The formal quintic cohomology basis

`PeriodsAndSpecialValues:PS.8/quintic-formal-connection` · construction · Planet: **Quintic Gauss–Manin connection**

Choose π with π^(p−1)=−p. In the degree-zero homogeneous overconvergent twisted de Rham complex on (x₁,…,x₅,t), deg x_i=1 and deg t=−5, use d+πd(tφ_λ). Let H be the invariant formal extension with C_p[[λ]]-basis e_i=δ^iω, 0≤i≤3, where δ=λ∂_λ+πtλΣx_i⁵. Its relation is δ⁴ω=−g(24ω+50δω+35δ²ω+10δ³ω), g=5⁵λ⁵/(1+5⁵λ⁵). The basis is asserted over C_p[[λ]], with no assertion that it is an integral O_{C_p} lattice.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quintic-pencil`, `ComplexComparisonPartII:C5/gauss-manin-connection`.

**Source and proof route.**

- **SH**, Definition 4.2, p.5; Lemma 4.12, pp.8–9. The invariant formal basis and connection are computed in the degree-zero twisted model.
- **SS**, §2, pp.11–12. The affine regular-sequence comparison motivates the projective/completed comparison; its extension to this family remains G1.

1. Use the affine twisted hypersurface complex, then retain the homogeneous projective component and group invariants as in §§3.2–3.3. Reduce monomial classes by Lemma 4.8 and Corollary 4.10.
2. The reduced rank-four basis obeys the displayed relation; the logarithmic connection matrix has first three columns e₁,e₂,e₃ and last column −g(24,50,35,10). The affine/projective cohomological comparison and completion compatibility are explicitly audited under gap G1.

**API.**

- `quintic_connection_matrix` (data): The δ-matrix in the column-input convention is the companion matrix just displayed.
- `quintic_boundary_residue` (simp): At λ=0 the residue N sends e₀→e₁→e₂→e₃→0.
- `quintic_pairing` (compatibility): The flat alternating cup pairing obeys (e₀,e₃)=Y₀/(1+5⁵λ⁵), with Y₀≠0; at zero (e₁,e₂)=−Y₀.

**Checks and worked examples.**

- `quintic_nilpotence_test` (computation): N⁴=0 and N³e₀=e₃≠0.
- `quintic_pairing_sign_test` (computation): At zero the pairing matrix has entries J₀₃=Y₀, J₁₂=−Y₀, J₂₁=Y₀, J₃₀=−Y₀.
- `quintic_denominator_test` (non-example): The rational connection has a pole when 1+5⁵λ⁵=0; the formal extension at zero does not remove that pole.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`: The formal basis and nilpotent boundary residue fix the Frobenius matrix convention and its horizontal/pairing checks.

### The normalized Dwork Frobenius

`PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius` · construction

On the overconvergent twisted complex raw Frobenius pulls back (x,t,λ) to (x^p,t^p,λ^p) and multiplies by exp(π(t^pφ_{λ^p}(x^p)−tφ_λ(x))). Define F=p⁻²F_raw on the selected H³ model. It is semilinear for λ↦λ^p, satisfies δF=pFδ, and scales the alternating pairing by p³. The factor p⁻² is required to compare with the usual cohomological Frobenius convention.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quintic-formal-connection`, `CrystallineCohomology:CR.7`.

**Source and proof route.**

- **SH**, §3.3, pp.4–5; §4.3, pp.9–10.

1. Check that the exponential correction intertwines the two twisted differentials, retaining the differential pullback factors.
2. Reduce to the degree-zero invariant component, normalize by p⁻², and differentiate with respect to the parameter. The comparison with the crystalline Frobenius is a separate target, subject to G1.

**API.**

- `quintic_frobenius_raw` (data): F_raw is the pullback and exponential-correction operator on the twisted complex.
- `quintic_frobenius_horizontal` (relation): δF=pFδ, with the indicated semilinearity.
- `quintic_frobenius_pairing` (compatibility): (Fx,Fy)=p³σ((x,y)), for the chosen coefficient Frobenius σ.

**Checks and worked examples.**

- `quintic_frobenius_scale_test` (compatibility): F_raw=p²F; switching to raw Frobenius multiplies every matrix entry by p².
- `quintic_frobenius_parameter_test` (computation): F(λv)=λ^pF(v).
- `quintic_frobenius_pairing_test` (non-example): The normalized F is a p³-similitude, not an isometry of the pairing.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/dwork-coefficients, PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`: The normalized chain operator expands through its exponential into the Dwork coefficient sums and descends, subject to G1, to the boundary matrix.

### The Dwork series and boundary coefficient

`PeriodsAndSpecialValues:PS.8/dwork-coefficients` · definition

Let exp(z+z^p/p)=Σ_{n≥0}B_nzⁿ. Define σ₀=Σ_{n≥1}B_n(n−1)!, σ₂=Σ_{n≥3}B_n(n−1)!Σ_{1≤j<i≤n−1}(ij)⁻¹, and Δ₃=σ₂−σ₀³/6, as p-adic sums with convergence supplied as an explicit input until G2 is discharged. The boundary coefficient is C=p³·24Δ₃/25. Define these sums only with a HasSum/convergence interface, rather than interpreting a nonsummable total sum as zero.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`, `mathlib:PowerSeries.exp`.

**Source and proof route.**

- **SH**, Definition 6.1 and Lemma 6.2, pp.14–15; Lemma 6.3 and §§6.1–6.4, pp.16–19. Defines exp(z+z^p/p) and the series used in the boundary calculation. The complete harmonic-weighted convergence estimate remains G2.

1. Use the Dwork exponential estimates to justify the two weighted p-adic sums; the precise estimates missing from the source are recorded in G2.
2. For the monomial reduction, define D_{αβ}=[x^α]Π_{i=1}^β(x+i), P_{α,i}=5^(−α−1)D_{α,i−1} for i>0 and P_{α,0}=δ_{α0}, and Q_{α,s}=(−1)^αD_{αs}. Theorem 5.13 expresses each normalized pairing c_{α,I} as the degree 3−#I−α convolution of Q and the five P factors; use empty convolution=0 in negative degree. This provides the explicit coefficient input, rather than an unexplained matrix oracle.

**API.**

- `dwork_coefficient_recurrence` (relation): B₀=1 and nB_n=B_{n−1}+B_{n−p}, with B_k=0 for negative k.
- `dwork_delta` (data): Δ₃=σ₂−σ₀³/6 and C=p³·24Δ₃/25.
- `dwork_monomial_reduction` (compatibility): The polynomial coefficient convolution of Theorem 5.13 computes c_{α,I}, with c_{3,0}=1, c_{0,0}=c_{1,0}=c_{2,0}=0, and c_{α,I}=0 when α+#I>3.

**Checks and worked examples.**

- `dwork_initial_test` (computation): B₀=B₁=1 and B₂=1/2 for every odd p.
- `dwork_low_degree_test` (computation): For 0≤n<p, B_n=1/n!.
- `dwork_threshold_test` (computation): At n=p, B_p=1/p!+1/p; replacing the second term of the exponential by z^p loses this coefficient.

**Consumers.**

- `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`: The two convergent sums give the only off-diagonal boundary coefficient, including its factor p^3*24/25.

### Shapiro’s quintic boundary Frobenius matrix

`PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix` · theorem · Planet: **Quintic boundary Frobenius**

Assume the p-adic series defining σ₀ and σ₂ converge and the twisted/projective cohomology comparison used above. In the column-input basis e_i=δ^iω at λ=0, normalized F has matrix [[p³,0,0,0],[0,p²,0,0],[0,0,p,0],[p³·24Δ₃/25,0,0,1]]. Its only possibly nonzero off-diagonal entry is row 3, column 0. The residue N and this matrix satisfy NF=pFN, and FᵀJF=p³J for the displayed boundary alternating matrix J. The source’s numerical evidence for Δ₃ in terms of a p-adic L-value is not promoted to a theorem.

**Inputs.** `PeriodsAndSpecialValues:PS.8/dwork-coefficients`, `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`.

**Source and proof route.**

- **SH**, §§6.1–6.4, pp.16–19; Definition 6.1 and Lemma 6.2, pp.14–15; Theorem 5.13, pp.13–14. The normalized diagonal and row-3/column-0 term follow from the reductions and Dwork sums. There is no Theorem 6.1 in this version; crystalline identification remains separate.

1. Compute the coefficient of F(e₀) by the monomial reduction and Dwork series summation. Simplify the pairings to the cubic correction Δ₃.
2. Use δF=pFδ and the rank-four basis to obtain the remaining columns. Check the pairing and residue relations in the same basis.

**Milestone checks.**

- F(e₀)=p³e₀+Ce₃ and F(e₃)=e₃, so transposing the displayed matrix fails the residue identity when C≠0.
- This is a formal limiting matrix over C_p, not an integral matrix claim.

### The integral crystalline model and matrix transport

`PeriodsAndSpecialValues:PS.8/quintic-crystalline-comparison` · comparison

For odd p≠5 take the smooth family over Z_p[λ,λ⁻¹,(1+5⁵λ⁵)⁻¹]. Construct its invariant H³ crystalline/F-crystal and compare its rationalization to the Dwork module, with horizontal Frobenius and cup-product pairings. To transport the boundary matrix, require a proved semistable/log extension at λ=0 and its compatibility with the formal C_p[[λ]] extension; specify the transported lattice rather than declaring the e_i integral. This target is conditional on G1: the selected sources do not supply the complete integral and boundary comparison. No theorem that the displayed matrix acts on an integral lattice is asserted before those inputs are proved.

**Inputs.** `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`, `CrystallineCohomology:CR.7`, `CrystallineCohomology:CR.5`, `CrystallineCohomology:CR.6`.

**Source and proof route.**

- **SS**, §2, pp.11–12; §3, pp.12–13, especially the crystalline-comparison limitation on p.13. The source does not prove the complete projective/integral crystalline identification; this node states the required bridge explicitly as G1.
- **SH**, §§3–4, pp.3–10. The formal twisted model supplies the family-specific calculation to be compared, rather than a proof of the crystalline bridge.

1. Import proper-smooth crystalline finiteness/Frobenius and the group projector; establish the required invariant torsion-freeness in the selected family.
2. Prove the Dwork–crystalline comparison with normalization, then a log/semistable boundary comparison; transport the actual lattice through these maps. Each missing bridge is specified in G1 and requests, not inferred from matching ODEs.

**Milestone checks.**

- State the lattice over the coefficient ring, the good-prime restrictions, and the change-of-basis matrix before any integral/congruence conclusion.
- Mirror-map integrality above is already proved independently; neither enumerative equality nor a p-adic L-value identity follows from this conditional target.

## PS.9 — Multiple zeta values and mixed-Tate periods

### Admissible multiple-zeta indices

`PeriodsAndSpecialValues:PS.9/mzv-indices` · definition · Planet: **Multiple zeta values**

An index is a finite list k of positive integers. Its weight is Σk_i and depth is its length. It is admissible when it is empty or its first entry is at least two. Define ζ(k)=Σ_{n₁>⋯>n_r>0}Π_i n_i^(−k_i), as a real convergent sum for admissible k; ζ([])=1. Brown and Zagier use ascending summation indices and require the last index≥2, so ζ_desc(k)=ζ_asc(reverse k). No convergent value is assigned to ζ([1]).

**Inputs.** `mathlib:riemannZeta`, `mathlib:zeta_nat_eq_tsum_of_gt_one`, `mathlib:riemannZeta_two`.

**Source and proof route.**

- **IKZ**, §1, pp.307–308. Uses descending indices and convergence for first entry greater than one.
- **B**, Introduction, p.1. Brown uses the reversed, ascending convention; the packet consistently reverses whole words.

1. Prove absolute convergence for k₁≥2 by bounding the inner nested harmonic sums by powers of 1+log n₁ and summing n₁^−2 times that bound.
2. Enumerate strictly decreasing positive tuples and use the real nonnegative sum; the empty tuple contributes one. Prove the reversal dictionary by reversing the tuple order.

**API.**

- `mzv_weight_depth` (data): weight(k)=Σk_i and depth(k)=length(k).
- `mzv_convergence` (characterisation): For a nonempty positive index, its positive series converges exactly when k₁≥2.
- `mzv_depth_one` (compatibility): For integer n≥2, ζ([n]) equals the real value of Mathlib’s riemannZeta at n, with the n=0 summand convention reconciled.

**Checks and worked examples.**

- `mzv_empty_test` (degenerate): ζ([])=1 and its weight/depth are zero.
- `mzv_two_test` (compatibility): ζ([2])=π²/6.
- `mzv_one_test` (non-example): [1] is not admissible and its harmonic series diverges.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/word-products, PeriodsAndSpecialValues:PS.9/convergent-double-shuffle, PeriodsAndSpecialValues:PS.9/regularization-operator, PeriodsAndSpecialValues:PS.9/zagier-coefficients, PeriodsAndSpecialValues:PS.9/zagier-evaluation`: Admissibility controls convergence and library depth-one agreement; weight and index reversal control the one-three coefficients and all grading statements.

### Shuffle and stuffle word algebras

`PeriodsAndSpecialValues:PS.9/word-products` · construction

Use the computational coordinate module W=(List {0,1})→₀Q, linearly identified with TauCeti.TensorWords Q (Bool→₀Q); its existing concatenation is not its shuffle product. H¹=Q+Wy consists of empty words and words ending in 1; H⁰=Q+xWy consists of empty words and words starting in 0 and ending in 1. Encode k by 0^(k₁−1)1⋯0^(k_r−1)1. Shuffle recursively interleaves letters with multiplicity. Stuffle on positive-index words recursively interleaves leading indices and adds the merge term (a+b)::(u*v). Extend both products Q-bilinearly, transport stuffle through the encoding, and equip separate wrappers with their commutative algebra structures.

**Inputs.** `mathlib:Finsupp.single`, `tauceti:TauCeti.TensorWords.of`, `tauceti:TauCeti.TensorWords.deconcatenation`, `PeriodsAndSpecialValues:PS.9/mzv-indices`.

**Source and proof route.**

- **IKZ**, §1, pp.307–309.

1. Define the shuffle recursion (a u)⧢(b v)=a(u⧢bv)+b(au⧢v) with empty unit. Define the analogous stuffle recursion with positive merge term.
2. Prove associativity and commutativity by labelled interleavings/ordered merges; retain duplicate multiplicities. Identify the underlying direct-sum coordinates with TensorWords and its deconcatenation, while using separate product wrappers.

**API.**

- `mzv_encode` (data): encode(k) is the displayed 0/1 word; positive-index words biject with words ending in 1.
- `mzv_word_products` (relation): Both bilinear products obey the stated recursions and have the empty word as unit.
- `mzv_tensor_words` (equivalence): The coordinate module is linearly equivalent to TensorWords Q (Bool→₀Q), preserving length grading and all-cut deconcatenation, without identifying shuffle with concatenation.

**Checks and worked examples.**

- `mzv_shuffle_test` (computation): 01⧢01=4·0011+2·0101.
- `mzv_stuffle_test` (computation): [2]*[2]=2·[2,2]+[4].
- `mzv_encoding_test` (computation): encode([2,1])=011; it is admissible although its last index is one.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/iterated-integrals, PeriodsAndSpecialValues:PS.9/convergent-double-shuffle, PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra, PeriodsAndSpecialValues:PS.9/motivic-f-alphabet, PeriodsAndSpecialValues:PS.9/hoffman-level`: Shuffle multiplicities and positive stuffle merges define the two evaluations; the same free coordinates support path functions and Hoffman word enumeration.

### Endpoint and tangential iterated integrals

`PeriodsAndSpecialValues:PS.9/iterated-integrals` · construction

For 0<a≤b<1 and w=c::u define I_{a,b}([])=1 and I_{a,b}(c::u)=∫_a^b κ_c(t) I_{a,t}(u) dt, using Mathlib intervalIntegral, κ₀=1/t and κ₁=1/(1−t). For admissible words, the joint endpoint limit a→0+, b→1− exists. For all words use polynomial asymptotic regularization at the tangent +1 at 0 and −1 at 1; its constant term sets the singleton 0 and 1 integrals to zero. In this recursion the head letter has the largest integration time. Brown’s increasing-time word is the reverse of this word.

**Inputs.** `PeriodsAndSpecialValues:PS.9/word-products`, `mathlib:intervalIntegral`, `Polylogarithms:P.1/classical-polylogarithm`.

**Source and proof route.**

- **IKZ**, §1, pp.308–309. Iterated integrals use the decreasing-time word convention, with admissible endpoints.
- **DG**, §§3.11–3.13, printed pp.42–45. Tangential endpoint treatment gives the finite regularized integral instead of substituting missing ordinary endpoints.

1. Use compact-interval integrability to construct the recursion. Partition a product of ordered simplices to prove shuffle, with multiplicities.
2. Expand the 1/(1−t) kernels by nonnegative geometric series and apply monotone convergence for admissible endpoints; obtain the decreasing-index sum. Extract tangential regularized constants from logarithmic asymptotics.

**API.**

- `mzv_iterated_recursion` (relation): The displayed nested intervalIntegral recursion holds on interior cutoffs.
- `mzv_iterated_sum` (compatibility): For admissible k, lim I_{a,b}(encode k)=ζ_desc(k).
- `mzv_iterated_polylog` (compatibility): For n≥1 and 0<b<1, the a→0+ limit of I_{a,b}(0^(n−1)1) is Li_n(b), with Li₁(b)=−log(1−b).

**Checks and worked examples.**

- `mzv_iterated_empty_test` (degenerate): I_{a,b}([])=1 even when a=b.
- `mzv_iterated_zeta_test` (compatibility): The endpoint value of 001 is ζ([3]); the endpoint value of 011 is ζ([2,1]).
- `mzv_iterated_divergence_test` (non-example): I_{0,b}(1)=−log(1−b) has no finite limit at b=1; its regularized constant is zero.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/convergent-double-shuffle, PeriodsAndSpecialValues:PS.9/polynomial-regularizations, PeriodsAndSpecialValues:PS.9/motivic-path-torsor, PeriodsAndSpecialValues:PS.9/zagier-evaluation`: The endpoint sum identity connects numerical zetas to shuffle products; polynomial endpoint asymptotics construct regularization and the straight-path comparison.

### Convergent double shuffle and low weights

`PeriodsAndSpecialValues:PS.9/convergent-double-shuffle` · theorem

Evaluation Z:H⁰→R is an algebra homomorphism for both shuffle and stuffle products. In particular ζ(2)²=4ζ(3,1)+2ζ(2,2)=2ζ(2,2)+ζ(4), hence 4ζ(3,1)=ζ(4). The ordinary identity ζ(2)²=5ζ(4)/2 also gives ζ(2,2)=3ζ(4)/4.

**Inputs.** `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `PeriodsAndSpecialValues:PS.9/word-products`, `PeriodsAndSpecialValues:PS.9/mzv-indices`, `mathlib:riemannZeta_two`, `mathlib:riemannZeta_four`.

**Source and proof route.**

- **IKZ**, §1, pp.307–309; §2, pp.310–311.

1. Partition products of absolutely convergent nested sums by the order/equality of summation indices for stuffle. Partition integration simplices for shuffle.
2. Use the explicit low-weight product computations and the pinned ordinary ζ(2),ζ(4) evaluations. The equality ζ(2,1)=ζ(3) belongs to the later regularized-double-shuffle node, keeping this earlier prerequisite independent of its consumer.

**Milestone checks.**

- The coefficient 4 on ζ(3,1) retains shuffle multiplicity.
- The later ζ(2,1)=ζ(3) corollary is owned by regularized-double-shuffle; this node does not import a later consumer.

### The two polynomial regularizations

`PeriodsAndSpecialValues:PS.9/polynomial-regularizations` · construction · Planet: **Tangential regularization**

The shuffle and stuffle algebras H¹ each admit a unique polynomial extension of Z on H⁰ with y↦T, denoted Z_⧢ and Z_*. Concretely H¹_⧢≅H⁰_⧢[y] and H¹_*≅H⁰_*[y] with their respective products; apply Z on coefficients. The tangential integral regularization gives Z_⧢. T is a formal divergence parameter, not a numerical value of ζ(1).

**Inputs.** `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `PeriodsAndSpecialValues:PS.9/convergent-double-shuffle`, `mathlib:PowerSeries.mk`.

**Source and proof route.**

- **IKZ**, Proposition 1, p.309; §3, pp.312–314.

1. Triangularly remove leading y letters using each product, obtaining polynomial decomposition over the admissible subalgebra.
2. Extend the admissible evaluation multiplicatively with y↦T and prove uniqueness; compare the shuffle extension to the endpoint logarithmic polynomial.

**API.**

- `mzv_regularization_admissible` (compatibility): Both maps restrict to the constant polynomial ζ(k) for every admissible index.
- `mzv_regularization_y` (simp): Z_⧢(y)=Z_*(y)=T and both send the empty word to 1.
- `mzv_regularization_unique` (universal-property): Any algebra map on the corresponding H¹ extending Z and sending y to T equals the specified extension.

**Checks and worked examples.**

- `mzv_regularization_empty_test` (degenerate): Both maps send the empty word to 1.
- `mzv_regularization_two_ones_test` (computation): Z_*([1,1])=(T²−ζ(2))/2 and Z_⧢([1,1])=T²/2.
- `mzv_regularization_leading_test` (computation): Z_*([1,2])=ζ(2)T−ζ(2,1)−ζ(3); Z_⧢([1,2])=ζ(2)T−2ζ(2,1).

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/regularized-double-shuffle`: The distinct shuffle/stuffle extensions are the two sides of the Ihara–Kaneko–Zagier comparison; uniqueness permits the comparison proof via endpoint asymptotics.

### The regularization comparison operator

`PeriodsAndSpecialValues:PS.9/regularization-operator` · definition

Let A(u)=exp(Σ_{n≥2}(−1)^nζ(n)u^n/n)=Σa_ku^k. Define the R-linear automorphism ρ:R[T]→R[T] by ρ(T^m)=Σ_{k=0}^m m!/(m−k)!·a_k T^(m−k), equivalently ρ(exp(Tu))=A(u)exp(Tu). It is triangular with diagonal one, and is not a ring homomorphism.

**Inputs.** `PeriodsAndSpecialValues:PS.9/mzv-indices`, `mathlib:PowerSeries.exp`.

**Source and proof route.**

- **IKZ**, §2, equations (2.1)–(2.2), pp.309–310. Equation (2.1) defines A(u); (2.2) characterizes the linear operator ρ. Its failure to preserve multiplication appears already in degree two.

1. Construct A using the formal exponential and read its first coefficients. Define ρ on the polynomial basis and extend linearly.
2. Triangularity yields the inverse; equivalently replace A by A⁻¹. Do not impose multiplication compatibility, which fails in degree two.

**API.**

- `mzv_rho_monomial` (simp): The displayed coefficient formula gives ρ(T^m).
- `mzv_rho_generating` (characterisation): ρ(exp(Tu))=A(u)exp(Tu) coefficient by coefficient.
- `mzv_rho_inverse` (equivalence): ρ is a linear equivalence, with inverse given by the coefficients of A(u)⁻¹.

**Checks and worked examples.**

- `mzv_rho_one_test` (degenerate): ρ(1)=1 and ρ(T)=T.
- `mzv_rho_square_test` (computation): ρ(T²)=T²+ζ(2).
- `mzv_rho_cube_test` (computation): ρ(T³)=T³+3ζ(2)T−2ζ(3).

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/regularized-double-shuffle`: The triangular operator translates the stuffle divergence polynomial into the shuffle one; its T^2 and T^3 terms give the low-weight leading-one relations.

### Regularized double shuffle

`PeriodsAndSpecialValues:PS.9/regularized-double-shuffle` · theorem

For every w∈H¹, Z_⧢(w)=ρ(Z_*(w)). Consequently the constant term of Z_⧢(w₁⧢w₀−w₁*w₀) vanishes for w₁∈H¹ and w₀∈H⁰. In descending notation comparison on [1,2] gives ζ(2,1)=ζ(3), while comparison on [1,1] gives ρ((T²−ζ(2))/2)=T²/2. Completeness of the resulting relation ideal is not asserted.

**Inputs.** `PeriodsAndSpecialValues:PS.9/polynomial-regularizations`, `PeriodsAndSpecialValues:PS.9/regularization-operator`.

**Source and proof route.**

- **IKZ**, Theorem 1 and proof, pp.310,312–314; Theorem 2 and Conjecture 1, pp.310–315.

1. Compare the asymptotic polynomial of finite harmonic sums, with parameter log M+γ, to that of the multiple polylogarithm near 1 via Abelian asymptotics. The Gamma-factor expansion is precisely A(u).
2. Extend from the asymptotic comparison to H¹ by the polynomial decomposition; derive the extended relation with an admissible factor and evaluate the constant term.

**Milestone checks.**

- Both divergent-index calculations agree without assigning ζ(1) a convergent value.
- No inference that double shuffle generates every numerical relation.

### The mixed-Tate category over Z

`PeriodsAndSpecialValues:PS.9/mixed-tate-z` · construction · Planet: **Mixed Tate motives over Z**

Inside the Tate-generated triangulated subcategory DMT(Q) of MC.4, take the mixed-Tate heart MT(Q), whose t-structure is justified for number fields by Beilinson–Soulé vanishing. MT(Z) is its full tensor subcategory unramified at every finite prime, equivalently the successive adjacent-weight extensions have Kummer classes in Z×⊗Q=0. Objects have a finite weight filtration with gr^W_{−2n} a sum of Q(n). The canonical fibre functor is ω(M)=⊕_n Hom(Q(n),gr^W_{−2n}M). It is exact faithful Q-linear tensor, making this specific category neutral Tannakian.

**Inputs.** `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`, `MotivesAndAlgebraicCycles:MC.3/tannakian-category`, `BorelRegulators:R.3`, `MotivesAndAlgebraicCycles:MC.4`.

**Source and proof route.**

- **DG**, §§1.1–1.9, printed pp.1–16; §§2.1–2.3, printed pp.17–20.

1. Import geometric motives and their Tate inversion; restrict to the thick Tate-generated subcategory. Use the rational K-theory/motivic-cohomology comparison and Borel vanishing to establish the mixed-Tate t-structure.
2. Apply the adjacent-weight criterion for unramifiedness, then define the graded fibre functor using the canonical Tate graded pieces. The general category of all mixed motives is not a premise.

**API.**

- `mtz_tate` (constructor): For every integer n, Q(n) belongs to MT(Z) and Q(n)⊗Q(m)=Q(n+m).
- `mtz_weight_fibre` (data): The grade-n fibre is Hom(Q(n),gr^W_{−2n}M); forgetting the grading gives the chosen fibre functor.
- `mtz_unramified` (characterisation): The adjacent-weight Kummer extensions vanish at every finite prime exactly for objects in the selected MT(Z) subcategory.

**Checks and worked examples.**

- `mtz_unit_test` (degenerate): The fibre of Q(0) is Q in grade zero.
- `mtz_tate_test` (computation): The fibre of Q(1) is Q in grade one; its Hodge weight is −2.
- `mtz_kummer_test` (non-example): The Kummer extension attached to 2 is an MT(Q) object but not an MT(Z) object, because it is ramified at the prime 2.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/mixed-tate-galois, PeriodsAndSpecialValues:PS.9/motivic-path-torsor`: The exact faithful weight fibre reconstructs its Galois group; finite motivic path truncations must lie in this specific unramified category.

### Mixed-Tate extensions and the motivic Galois group

`PeriodsAndSpecialValues:PS.9/mixed-tate-galois` · theorem

Ext¹_MT(Z)(Q(0),Q(n)) is Q for odd n≥3 and zero otherwise, and Ext² between Tate objects vanishes. For ω above, G_MT=Aut^⊗(ω) is G_m⋉U_MT, with Lie U_MT free pronilpotent on one generator in each negative odd degree −3,−5,…; choices of generator lifts are not canonical. The regulator/Hodge-realisation injection on Ext¹ gives the full-faithfulness comparison used in lifting the path structures.

**Inputs.** `PeriodsAndSpecialValues:PS.9/mixed-tate-z`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `BorelRegulators:R.3`, `BorelRegulators:R.4`.

**Source and proof route.**

- **DG**, Proposition 1.9, printed pp.16–17; Propositions 2.2–2.3, pp.18–20; Proposition 2.14, p.25. Ext vanishing, the graded fibre functor, free Lie algebra and realisation injection supply the stated reconstruction; freeness is Proposition 2.3.
- **B**, §2.5, pp.6–7. Specializes to MT(Z) and uses negative odd Lie degrees, matching this packet’s convention.

1. Use the rational K-groups of Z and regulator injectivity to compute the extension groups and show the relation space vanishes. The absence of Ext² implies the graded Lie algebra is free.
2. Apply neutral Tannaka reconstruction with the chosen fibre functor. For Hodge full faithfulness use the Ext¹ regulator injection, not injectivity of the motivic numerical period map.

**Milestone checks.**

- There is no degree-one generator over Z, while over Q the Kummer extension space is nonzero.

### The motivic path torsor of the three-punctured line

`PeriodsAndSpecialValues:PS.9/motivic-path-torsor` · construction

For X=P¹_Q minus {0,1,∞}, construct the unipotent motivic fundamental groupoid and the torsor {}₀Π₁ between tangent +1 at 0 and tangent −1 at 1 as pro/ind-objects in MT(Z). The finite length quotients are constructed by the cosimplicial/bar motives of X; their de Rham coordinate algebra is the shuffle algebra on two letters with all-cut deconcatenation. Betti realisation is the corresponding unipotent path-completion, and the comparison evaluates iterated integrals on the straight path dch.

**Inputs.** `PeriodsAndSpecialValues:PS.9/mixed-tate-z`, `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`, `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `AnabelianGeometryAndNonabelianChabauty:NC.2`, `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

**Source and proof route.**

- **DG**, Proposition 3.10 and §§3.11–3.13, printed pp.40–45; Theorem 4.4, pp.47–50; §§4.13–4.18 and §5.3, pp.53–57. Finite motivic path truncations, tangential groupoids and unramifiedness over Z give the selected three-punctured-line object.

1. Use the normalized cosimplicial motive and its finite truncations; DG Proposition 3.10 compares the homotopy and simplex constructions. Request NC.2’s generic unipotent groupoid API with the additional Betti/bar/tangential comparison specified below. NC.2’s current stage does not yet state that entire interface; do not silently infer it from its de Rham/étale target.
2. Identify the logarithmic de Rham complex with the tensor-word model and the Betti comparison with iterated integration. Extend to the specified tangents, proving unramifiedness over Z and the groupoid composition laws.

**API.**

- `mzv_path_word_coordinates` (equivalence): The de Rham path-coordinate algebra is the shuffle-word algebra with its length filtration.
- `mzv_path_composition` (relation): Composition of three paths gives all-cut deconcatenation, including the empty outer factors.
- `mzv_path_betti_comparison` (compatibility): The straight Betti path evaluates the word coordinates by tangentially regularized iterated integrals, with the reversal convention stated above.

**Checks and worked examples.**

- `mzv_path_empty_test` (degenerate): The empty word evaluates to 1 on the straight path.
- `mzv_path_cut_test` (computation): The deconcatenation of 01 is 1⊗01+0⊗1+01⊗1, where the two outer 1 symbols denote the empty-word unit.
- `mzv_path_tangent_test` (non-example): The endpoints 0 and 1 are absent from X; their ordinary point-based torsor cannot replace the specified tangential torsor.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra, PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`: The straight-path coordinate algebra supplies the largest stable ideal and its period map; relative-cohomology frames must be compared to these path generators for motivic stuffle.

### Brown’s motivic multiple-zeta algebra and period map

`PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra` · construction

Let S=O({}₀Π₁) in the de Rham word model, and let dch:S→R evaluate the straight path. Let J_MT be the largest graded ideal stable under the U_MT coaction and contained in ker(dch), and define H=S/J_MT. This is not the quotient by the entire numerical kernel. For a descending admissible k set ζ^m_desc(k)=I^m(0;reverse(encode k);1). The descended period map per:H→R is a Q-algebra homomorphism with per(ζ^m_desc(k))=ζ_desc(k). Keep ζ^m(2) in H; it is nonzero.

**Inputs.** `PeriodsAndSpecialValues:PS.9/motivic-path-torsor`, `PeriodsAndSpecialValues:PS.9/word-products`, `mathlib:Ideal.Quotient.mk`.

**Source and proof route.**

- **B**, §§2.1–2.4, pp.3–6; Theorem 2.4 and properties I0–I3.

1. Form the sum of the graded stable ideals contained in the numerical kernel and check it stays in the kernel and stable. This is J_MT.
2. Descend straight-path evaluation and the relevant motivic iterated-integral relations to H. The largest stable ideal construction does not presume that the kernel itself is stable or that per is injective.

**API.**

- `mzv_motivic_period` (compatibility): per sends ζ^m_desc(k) to the decreasing-index convergent sum for admissible k.
- `mzv_motivic_shuffle` (relation): Motivic iterated integrals satisfy shuffle, reflection and tangential vanishing: the empty word gives 1 and nonempty constant-letter endpoint integrals give 0.
- `mzv_motivic_ideal` (universal-property): J_MT is the largest graded U_MT-stable ideal inside ker(dch), so any such ideal factors through its quotient map.

**Checks and worked examples.**

- `mzv_motivic_empty_test` (degenerate): ζ^m([])=1 and per(1)=1.
- `mzv_motivic_two_test` (non-example): ζ^m(2)≠0, since its period is π²/6≠0.
- `mzv_motivic_reverse_test` (compatibility): ζ^m_desc(2,1)=I^m(0;1,1,0;1), with period ζ_desc(2,1); using 0,1,1 is the other word convention.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/motivic-coaction, PeriodsAndSpecialValues:PS.9/motivic-f-alphabet, PeriodsAndSpecialValues:PS.9/motivic-double-shuffle, PeriodsAndSpecialValues:PS.9/hoffman-level, PeriodsAndSpecialValues:PS.9/numerical-spanning`: The quotient supplies actual motivic values before numerical evaluation, allowing coaction, the f-alphabet embedding, filtration spans and transfer of the basis to numerical spanning.

### The motivic MZV coaction

`PeriodsAndSpecialValues:PS.9/motivic-coaction` · construction · Planet: **Motivic MZV coaction**

Let U′ be the quotient of U_MT acting faithfully on the path torsor and A=O(U′). The quotient π:H→A kills ζ^m(2). Define Δ:H→A⊗H. For I^m(a₀;a₁,…,a_n;a_{n+1}), sum over subsequences 0=i₀<i₁<⋯<i_k<i_{k+1}=n+1: the first tensor factor is π(Π_{p=0}^k I^m(a_{i_p};a_{i_p+1},…,a_{i_{p+1}−1};a_{i_{p+1}})), and the second is I^m(a₀;a_{i₁},…,a_{i_k};a_{n+1}). All k from 0 to n occur, empty segments are 1, and A is in the first factor. This makes H a graded A-comodule algebra.

**Inputs.** `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.

**Source and proof route.**

- **B**, Theorem 2.4, pp.4–6; §3.1, p.7.

1. Apply the motivic path action and express it on coordinate iterated integrals; the subsequence sum describes path insertions into the retained letters.
2. Use the stable ideal to descend to H and project the cut segments to A. Verify coassociativity, counit and the product formula directly on word coordinates.

**API.**

- `mzv_coaction_cuts` (data): Δ on each iterated-integral generator is the stated subsequence sum, with A first.
- `mzv_coaction_algebra` (structure): Δ is a unital Q-algebra map and obeys the coassociative/counit comodule laws.
- `mzv_coaction_tate` (simp): π(ζ^m(2))=0 and Δζ^m(2)=1⊗ζ^m(2); quotienting A does not kill ζ^m(2) in H.

**Checks and worked examples.**

- `mzv_coaction_unit_test` (degenerate): Δ1=1⊗1.
- `mzv_coaction_two_test` (computation): Δζ^m(2)=1⊗ζ^m(2).
- `mzv_coaction_three_test` (computation): Δζ^m(3)=1⊗ζ^m(3)+ζ^a(3)⊗1, where ζ^a=πζ^m.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/motivic-f-alphabet, PeriodsAndSpecialValues:PS.9/coaction-derivation-kernel`: Its projected contiguous cuts define the D_r derivations, while comodule grading makes the f-alphabet upper bound available.

### The f-alphabet and motivic dimension bound

`PeriodsAndSpecialValues:PS.9/motivic-f-alphabet` · theorem

After a noncanonical choice of graded free generators, O(U_MT) is the shuffle algebra on f₃,f₅,… . Adjoining a central polynomial generator f₂ gives H_MT^+=O(U_MT)⊗Q[f₂], with deg f_i=i and deconcatenation coaction on the odd words. H embeds in H_MT^+ as a graded comodule, with ζ^m(2) corresponding to f₂ after normalization. The Hilbert series of H_MT^+ is 1/(1−t²−t³), so dim H_N≤d_N, d₀=1,d₁=0,d₂=1,d_N=d_{N−2}+d_{N−3} for N≥3.

**Inputs.** `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`, `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/motivic-coaction`, `PeriodsAndSpecialValues:PS.9/word-products`.

**Source and proof route.**

- **B**, §2.5 and Lemma 2.5, pp.6–7; §3.1, p.7.

1. Identify the coordinate Hopf algebra of the free prounipotent group by shuffle duality. Separate the even Tate parameter using a chosen rational point as in §2.4.
2. Compute the graded tensor-product generating function; the embedding gives an upper bound, which becomes equality only after the basis theorem.

**Milestone checks.**

- d₃=1,d₄=1,d₅=2,d₆=2; no f₁ occurs.

### Coaction derivations and their joint kernel

`PeriodsAndSpecialValues:PS.9/coaction-derivation-kernel` · theorem

For odd r≥3 let D_r=(proj to indecomposables A_r ⊗id)∘(Δ−1⊗id), a derivation H_N→L_r⊗H_{N−r}. For N≥2 the joint kernel of the D_r with odd 3≤r<N in H_N is Qζ^m(N), with even ζ^m(N) a rational nonzero multiple of (ζ^m(2))^(N/2). The word formula removes contiguous length-r segments, projects each removed segment to L_r and leaves the complementary motivic word.

**Inputs.** `PeriodsAndSpecialValues:PS.9/motivic-coaction`, `PeriodsAndSpecialValues:PS.9/motivic-f-alphabet`.

**Source and proof route.**

- **B**, §3.2 and Theorem 3.3, pp.7–9.

1. Project the explicit cut coaction to indecomposables; products of multiple nonempty cut pieces disappear, giving the contiguous-cut derivation formula.
2. Read the primitive kernel in the f-alphabet and the central f₂ factor, retaining weight and the strict inequality r<N.

**Milestone checks.**

- At N=3 no r lies in the range, and H₃ is the one-dimensional ζ^m(3) line.
- The kernel result detects a multiple of ζ^m(N), not zero automatically.

### Convergent motivic double shuffle and shifted all-two integrals

`PeriodsAndSpecialValues:PS.9/motivic-double-shuffle` · theorem

In Brown’s H, admissible motivic values obey shuffle and stuffle. For n≥1, the shuffle-regularized integral ζ₁^m(2^n)=I^m(0;0(10)^n;1) satisfies ζ₁^m(2^n)=−2 Σ_{i=0}^{n−1} ζ_desc^m(2^{n−1−i},3,2^i)=2 Σ_{i=1}^n (−1)^i ζ^m(2i+1)ζ^m(2^{n−i}). Its indecomposable coefficient is 2(−1)^n. Brown’s notation ζ₁ denotes a leading-zero integral, not an additional divergent index-one MZV. Transport Soudères’s convergent framed-motive identities to this path-period presentation (G3); shuffle regularization is already available from the path-integral identities.

**Inputs.** `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/motivic-path-torsor`, `MotivesAndAlgebraicCycles:MC.4`.

**Source and proof route.**

- **SO**, Definition 3.7 and Proposition 3.8, §3.2, pp.10–12; Proposition 4.24 and proof, §4.4, pp.23–26. Convergent framed-motive shuffle/stuffle is proved with frame-preserving maps; its presentation comparison is the open G3.
- **B**, Equation (3.8), p.9; Lemma 3.8 and proof, pp.10–11. The shifted-all-two identity uses shuffle regularization and convergent motivic stuffle, without an extra divergent stuffle extension.

1. Use Soudères’s pullback and product/compactification maps to compare relative cohomology frames. Preserve both the de Rham form and Betti integration frame in the shuffle and stuffle identities. G3 is the comparison of those framed objects with Brown’s generators in H.
2. Brown equation (3.8) follows from shuffle regularization in H and gives the first shifted-all-two sum. Apply convergent stuffle to ζ^m(2j+1)ζ^m(2^{n−j}); the alternating sum cancels the intermediate single-odd insertions, giving Lemma 3.8. No new divergent-stuffle polynomial extension is needed for this argument. Retain the i=n term, since ζ^m(2^0)=1.
3. Pass to indecomposables only after proving the identity in H. The resulting coefficient 2(−1)^n supplies the boundary contributions in the cut calculation. Equality after applying per would not suffice.

**Milestone checks.**

- ζ^m(2)²=2ζ^m(2,2)+ζ^m(4)=4ζ^m(3,1)+2ζ^m(2,2).
- At n=1, ζ₁^m(2)=−2ζ^m(3); at n=2 it is −2ζ^m(3)ζ^m(2)+2ζ^m(5). These identities are motivic, not consequences of period injectivity.

### Zagier’s one-three coefficients in descending notation

`PeriodsAndSpecialValues:PS.9/zagier-coefficients` · definition

For a,b≥0 and 1≤r≤a+b+1 define c(a,b,r)=2(−1)^r[binom(2r,2b+2)−(1−2^(−2r))binom(2r,2a+1)] in Q. This is Zagier’s ascending coefficient with a and b interchanged. Empty strings of twos are permitted and ζ({2}⁰)=1. The coefficient is dyadic, which is the arithmetic input to Brown’s determinant argument.

**Inputs.** `PeriodsAndSpecialValues:PS.9/mzv-indices`.

**Source and proof route.**

- **Z**, Theorem 1, p.981. Reversal exchanges a,b in the coefficient formula.
- **B**, Theorem 4.3 and Corollary 4.4, pp.12–13. The same rational coefficients and their dyadic estimates enter the motivic and determinant arguments.

1. Define the rational binomial expression with exact powers of two, treating binomial coefficients above the top index as zero.
2. Translate ascending to descending indices by reversing the entire index word, exchanging the two strings of twos.

**API.**

- `zagier_coefficient_formula` (simp): c is the displayed rational expression for 1≤r≤a+b+1.
- `zagier_coefficient_reversal` (compatibility): c_desc(a,b,r)=c_asc(b,a,r).
- `zagier_coefficient_dyadic` (characterisation): The denominator of c(a,b,r), in lowest terms, is a power of two.

**Checks and worked examples.**

- `zagier_three_test` (computation): c(0,0,1)=1.
- `zagier_two_three_test` (computation): c(1,0,1)=−2 and c(1,0,2)=9/2; hence the descending ζ(2,3) formula has these coefficients.
- `zagier_three_two_test` (computation): c(0,1,1)=3 and c(0,1,2)=−11/2; hence reversing the index changes both coefficients.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/zagier-evaluation, PeriodsAndSpecialValues:PS.9/motivic-zagier-evaluation, PeriodsAndSpecialValues:PS.9/hoffman-matrix-invertible`: The same reversed rational coefficients appear in ordinary and motivic one-three evaluations; their dyadic minima provide the determinant estimates.

### Zagier’s ordinary one-three evaluation

`PeriodsAndSpecialValues:PS.9/zagier-evaluation` · theorem

For a,b≥0, n=a+b+1, ζ_desc({2}^a,3,{2}^b)=Σ_{r=1}^n c(a,b,r)ζ(2r+1)ζ({2}^{n−r}). Also ζ({2}^m)=π^(2m)/(2m+1)!, including m=0. These are numerical equalities; their lift to H is a separate theorem.

**Inputs.** `PeriodsAndSpecialValues:PS.9/zagier-coefficients`, `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `PeriodsAndSpecialValues:PS.9/mzv-indices`, `mathlib:PhragmenLindelof.horizontal_strip`.

**Source and proof route.**

- **Z**, Theorem 1, p.981; all-two identities (5)–(6), p.979; §§2–4, pp.982–990, especially Lemma 2, p.989. Generating functions, integer interpolation and the directional exponential growth estimate prove the one-three formula.

1. Use the all-two sine-product identity to compute the entire generating function F(x,y) of one-three MZVs and the proposed function F̂(x,y) from the binomial expression. Z Propositions 1–3, pp.982–985, give their formulas and bounds; retain the directional estimates (18),(21), not just order-one growth.
2. Compare F and F̂ on integer interpolation points by Z Propositions 4–6, pp.985–989, and on the diagonal x=y. For fixed x, f(y)=F(x,y)−F̂(x,y) vanishes at every integer, has finite exponential order and satisfies O(exp(π|Im y|)).
3. Divide f(y) by sin(πy), removing the integer zeros holomorphically. The quotient has finite order and is bounded outside a horizontal strip. Apply the pinned PhragmenLindelof.horizontal_strip theorem: finite-order growth is dominated by its exp(B exp(c|Re y|)) bound for a positive c smaller than π divided by the strip width. Liouville then makes the quotient constant. For nonintegral fixed x, vanishing at y=x makes that constant zero; extend to integral x by analyticity and extract coefficients. This proves Z Lemma 2 in the form the generating-function argument actually uses.

**Milestone checks.**

- ζ_desc(2,3)=−2ζ(3)ζ(2)+(9/2)ζ(5).
- ζ_desc(3,2)=3ζ(3)ζ(2)−(11/2)ζ(5).

### Brown’s motivic lift of the one-three evaluation

`PeriodsAndSpecialValues:PS.9/motivic-zagier-evaluation` · theorem

With the same descending coefficient c, ζ^m_desc({2}^a,3,{2}^b)=Σ_{r=1}^{a+b+1}c(a,b,r)ζ^m(2r+1)ζ^m({2}^{a+b+1−r}). This motivic equality follows from coaction induction and the ordinary one-three evaluation, without assuming period-map injectivity.

**Inputs.** `PeriodsAndSpecialValues:PS.9/zagier-evaluation`, `PeriodsAndSpecialValues:PS.9/coaction-derivation-kernel`, `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`, `PeriodsAndSpecialValues:PS.9/zagier-coefficients`.

**Source and proof route.**

- **B**, Theorem 4.3 and proof, pp.12–13.

1. Apply each D_r with r<2a+2b+3 to the difference, using the contiguous cuts, the shifted-all-two identity from Brown Lemma 3.8 and induction on weight. All these derivations vanish.
2. The joint-kernel theorem makes the difference αζ^m(2a+2b+3). Apply per and the ordinary Zagier formula: αζ(2a+2b+3)=0. Positivity of this single odd zeta value forces α=0, without a general injectivity assumption.

**Milestone checks.**

- a=b=0 gives ζ^m(3)=ζ^m(3).
- The descending weight-five coefficients agree with those above.

### The Hoffman level filtration

`PeriodsAndSpecialValues:PS.9/hoffman-level` · definition

Let B_{N,l} be the finite set of descending words in {2,3} of total weight N and exactly l occurrences of 3. Let H_N^{2,3} be the Q-span of all their motivic values in H_N. F_lH_N^{2,3} is the span of words with at most l threes. Define the free word space W_{N,l}=Q[B_{N,l}] before proving independence. For N=2m+3l, #B_{N,l}=binom(m+l,l); it is zero if m is not a nonnegative integer. Include the empty word at N=l=0.

**Inputs.** `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/word-products`, `mathlib:Submodule.span`, `mathlib:LinearIndependent`, `PeriodsAndSpecialValues:PS.9/motivic-coaction`.

**Source and proof route.**

- **B**, §5, pp.13–14; §6, pp.14–17.

1. Enumerate the positive index words with the prescribed weight/level; form their free coordinate space and span map into H.
2. Filter by the count of threes. Establish the combinatorial cardinality by choosing the positions of the l threes among m+l entries, without assuming the span map is injective.
3. Apply the contiguous-cut formula: a nonzero odd-length removed segment has at least one 3 in the 2/3 encoding. This proves level lowering by parity (Brown Lemma 5.5); coefficient evaluation is a later step.

**API.**

- `hoffman_level_span` (data): F_l is the indicated Submodule.span and increases with l.
- `hoffman_level_cardinality` (simp): For N=2m+3l the free word space dimension is binom(m+l,l).
- `hoffman_level_derivation` (compatibility): For l≥1 and odd 3≤r≤N, D_r sends F_lH_N^{2,3} into L_r⊗F_{l−1}H_{N−r}^{2,3}. Brown Lemma 5.5 proves this by parity of contiguous cuts in the 0/1 encoding, independently of the one-three evaluation.

**Checks and worked examples.**

- `hoffman_empty_test` (degenerate): B_{0,0} contains just the empty word and F₀H₀=Q·1.
- `hoffman_weight_five_test` (computation): B_{5,1} consists of [2,3] and [3,2].
- `hoffman_weight_six_test` (computation): B_{6,0} consists of [2,2,2], B_{6,2} of [3,3], and B_{6,1} is empty.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/hoffman-cut-matrix, PeriodsAndSpecialValues:PS.9/hoffman-motivic-basis`: The free word enumeration, span map and level-lowering cuts define the matrix without assuming independence; its cardinality is then compared with the Hilbert bound.

### The Hoffman cut matrix

`PeriodsAndSpecialValues:PS.9/hoffman-cut-matrix` · construction

For N≥3 and l≥1, use the explicit odd 3≤r≤N coaction cuts to define coefficients on free spaces W_{N,l} and ⊕_r W_{N−r,l−1}. Brown’s M_{N,l} has source words as rows and target pairs (r,u) as columns (Definition 5.9); this row-vector convention is the transpose of the usual column-input linear-map matrix. Reduce the removed one-three segments with the motivic Zagier coefficients and the shuffle-regularized leading-zero all-two formula. Order both sets by Brown’s reverse lexicographic order with 3<2 on ascending words, transported by whole-word reversal to descending words. Reindex columns by the bijection (r=2k+3,u)↦2^k3u, with u of weight N−r and level l−1; equivalently append 3·2^k in ascending notation. This produces a square matrix without assuming motivic independence. Include r=N and the empty target when l=1. The explicit cut formula defines the matrix; invertibility is a later theorem.

**Inputs.** `PeriodsAndSpecialValues:PS.9/hoffman-level`, `PeriodsAndSpecialValues:PS.9/coaction-derivation-kernel`, `PeriodsAndSpecialValues:PS.9/motivic-zagier-evaluation`, `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`, `mathlib:Matrix.det`.

**Source and proof route.**

- **B**, Lemma 5.5, pp.13–14; Definitions 5.8–5.9, p.15; Theorem 6.1 and Corollary 6.2, pp.16–17. Source rows, target columns, the free-set bijection and the explicit leading-cut computation are distinct from proving independence.

1. Apply the contiguous-cut derivation formula to each formal 2/3 word, keeping the cuts with exactly one 3 in the level-l−1 quotient. Evaluate removed segments by the motivic one-three formula and the shifted-all-two integral identity; combine all contributions with the same odd weight and target word.
2. Use free source-row and target-column coordinates before taking the actual graded quotient. Delete the descending prefix 2^k3 to obtain the target pair (2k+3,u); its inverse prepends that prefix. Brown Definitions 5.8–5.9 fix row/column order. Theorem 6.1 describes formal entries modulo reversal differences and Corollary 6.2 gives the triangular leading matrix.

**API.**

- `hoffman_matrix_entry` (data): The source-row/target-column entry indexed by w,(r,u) is the rational sum of the explicit odd coaction cuts of w whose retained word is u, after evaluating the removed segment. The square version has column w′ reindexed by deleting its unique descending prefix 2^k3.
- `hoffman_matrix_square` (characterisation): For l≥1, (r=2k+3,u)↦2^k3u is a bijection from the disjoint target sets to B_{N,l}; the inverse deletes the prefix ending at the first 3. Thus the matrix is square before proving any motivic independence.
- `hoffman_matrix_leading` (relation): With source rows and target columns in the specified order, Brown’s column rescaling gives an upper triangular matrix modulo 2 with diagonal units. The minimal coefficient in a column comes from ascending 3·2^k, or descending 2^k·3. The same assertion cannot silently be assigned to the transposed convention.

**Checks and worked examples.**

- `hoffman_matrix_empty_target_test` (degenerate): At N=3,l=1 the map is the 1×1 matrix (1), targeting the r=3 empty word.
- `hoffman_matrix_weight_five_test` (computation): At N=5,l=1, descending source-row order [3,2],[2,3] and target-column order (3,[2]),(5,[]) give [[3,−11/2],[−2,9/2]], determinant 5/2. Multiplying the second column by 2 gives [[3,−11],[−2,9]], upper triangular modulo 2 with diagonal units.
- `hoffman_matrix_reversal_test` (compatibility): The target-column bijection prefixes descending 2^k3 to its retained word; the minimal-coefficient block is descending 2^k3, reversing Brown’s ascending 3·2^k. A suffix-deletion convention would identify different columns.

**Consumers.**

- `PeriodsAndSpecialValues:PS.9/hoffman-matrix-invertible`: The ordered explicit cut coefficients, including the empty target, are the input to the dyadic triangular determinant criterion.

### Brown’s 2-adic determinant argument

`PeriodsAndSpecialValues:PS.9/hoffman-matrix-invertible` · theorem

Every nonempty Hoffman cut matrix M_{N,l} is invertible over Q. The elementary criterion is: for a rational square matrix, if every below-diagonal entry has 2-adic valuation≥1 and each diagonal entry realizes its column’s minimum valuation, which is≤0, then the determinant is nonzero. Rescale each column by a power of two to make that minimum zero; reduction modulo 2 is upper triangular with nonzero diagonal. Brown’s coefficient estimates and leading-cut computation verify these hypotheses.

**Inputs.** `PeriodsAndSpecialValues:PS.9/hoffman-cut-matrix`, `PeriodsAndSpecialValues:PS.9/zagier-coefficients`.

**Source and proof route.**

- **B**, Corollary 4.4, pp.12–13; Lemma 7.1 and Theorem 7.3, pp.17–18.

1. Use the dyadic coefficient symmetry and minimal-column valuation from Corollary 4.4, with the index reversal already applied.
2. Rescale, reduce modulo two and apply the triangular determinant formula. Recover rational nonvanishing by undoing the invertible column rescalings.

**Milestone checks.**

- The criterion concludes det≠0, not that the original rational determinant is an integer or a 2-adic unit.

### The motivic Hoffman basis

`PeriodsAndSpecialValues:PS.9/hoffman-motivic-basis` · theorem · Planet: **Motivic Hoffman basis**

For each N≥0, {ζ^m_desc(k) : k is a {2,3}-word of weight N} is a Q-basis of H_N; the empty word is the weight-zero basis and weight one has empty basis. The level induction proves independence via the invertible cut matrices. The number of these words is d_N, matching the Hilbert-series upper bound; hence H=H_MT^+ and every motivic MZV is a rational linear combination of the 2/3 values.

**Inputs.** `PeriodsAndSpecialValues:PS.9/hoffman-matrix-invertible`, `PeriodsAndSpecialValues:PS.9/hoffman-level`, `PeriodsAndSpecialValues:PS.9/motivic-f-alphabet`.

**Source and proof route.**

- **B**, Theorem 1.1, p.1; Theorem 7.4, pp.18–19.

1. Induct on weight and level. A relation in highest level is sent by all D_r to lower-weight relations; invertibility of M_{N,l} forces its top-level coefficients to vanish. Descend the level filtration.
2. The surviving level-zero all-two value is nonzero by its period. Compare independent word count with the upper bound dim H_N≤d_N to prove spanning and equality with the ambient algebra.

**Milestone checks.**

- H₂=Qζ^m(2), H₃=Qζ^m(3), H₅ has basis ζ^m(2,3),ζ^m(3,2).
- The independence assertion lives in H, not in its numerical image.

### Numerical Hoffman spanning and mixed-Tate periods

`PeriodsAndSpecialValues:PS.9/numerical-spanning` · theorem · Planet: **Numerical MZV spanning**

Every convergent numerical MZV of weight N is a rational linear combination of numerical descending 2/3 MZVs of the same weight. Thus dim_Q span{ζ(k):weight(k)=N}≤d_N. Every period of MT(Z) is in the Q[(2πi)⁻¹]-linear span of MZVs, via the localized period algebra supplied by PS.2 and the comparison torsor MC.6. Numerical independence of the 2/3 values, exact numerical dimensions, completeness of double-shuffle relations, and general period-map injectivity remain conjectural assertions, with no theorem depending on them.

**Inputs.** `PeriodsAndSpecialValues:PS.9/hoffman-motivic-basis`, `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.2/integration-evaluation`, `PeriodsAndSpecialValues:PS.2/torsor-integration-comparison`, `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`, `MotivesAndAlgebraicCycles:MC.6/formal-periods-equal-comparison-algebra`, `MotivesAndAlgebraicCycles:MC.6/period-point`.

**Source and proof route.**

- **B**, Corollary 1.2, p.1; Corollary 7.5, p.19.

1. Apply the actual Q-linear algebra map per to the motivic basis expansion. A surjective image map preserves spanning and yields only an upper dimension bound.
2. Use the equality with the mixed-Tate comodule algebra and invert the Tate period for arbitrary twists. Import PS.2’s P_eff[L⁻¹], evaluation of L⁻¹=(2πi)⁻¹, and its tensor-comparison interface.
3. Require the PS.2 evaluation to factor through the MC.6 fullEquiv identification with the comparison algebra of the extended full Nori fibres, and to represent the same fibreComparison complex point. An equivalence only to an abstract Localization.Away of the effective comparison algebra is insufficient. Restrict this supplier to the mixed-Tate objects used here; Brown’s nonnegative-weight H and its unipotent coaction are not replaced by the entire localized Nori period algebra.

**Milestone checks.**

- Weight five is spanned numerically by ζ(2,3),ζ(3,2), without an assertion that they are numerically independent.
- Tate inverse evaluation uses PS.2 localization rather than an effective-period algebra missing the inverse.
- The inverse Tate object evaluates to (2πi)^(-1) through the same full comparison point. Brown’s H still has its nonnegative grading, nonzero ζ^m(2), and coaction into A tensor H; this import neither inverts ζ^m(2) inside H nor assumes period injectivity.

## Lean statement coverage

[PeriodsAndSpecialValues.lean](../suggested/PeriodsAndSpecialValues.lean) gives suggested forms on carriers available at the pins. The reader is definitive: every target, API contract, hypothesis and check remains specified above. The file uses one namespace, `TauCeti.PeriodsAndSpecialValuesSuggested`, and only light definitions with real bodies, end statements and a few examples. Elaboration with placeholder theorem proofs establishes no mathematical result.

| Targets | Suggested forms and reader-only interfaces |
| --- | --- |
| PS.0 | Complex-matrix covariance, a selected-component coefficient-unit relation, scalar Tate periods and pinned Tate-Hodge tests. The simultaneous coefficient quotient, geometric real involution, full Deligne quotient comparison and elliptic cycle matrix require their actual geometric carriers. |
| PS.1 | Integer gamma-pole exclusions, unit criticality, off-diagonal intervals and fixed nonzero scalar-period algebraicity. Euler products, analytic continuation and motivic realization comparisons remain reader targets. |
| PS.2 | Formal-period algebras, full Nori fibres, torsors and actual relative integration require the MC.6/C5 suppliers. Existing localization is consumed through its native API. |
| PS.3–PS.6 | Perfect-complex Picard functors, relative K-theory, arithmetic motivic lines, regulators and Selmer objects require the typed supplier interfaces. Their factor lists, orientation gates, API and tests remain reader targets. |
| PS.7 | Rational arctangent sums, actual Legendre integrals and substitution/error milestones. Cycle identification, the certified interval algorithm and the full normalized-value/conjecture predicates remain reader targets. |
| PS.8 quartic | Polynomial and local residue coefficient, explicit operator/Gram/monodromy matrices, Frobenius coefficients, hypergeometric symmetric square, mirror coordinate and inverse/integrality milestone. Global quotient/resolution, marked local systems, analytic continuation and normalized inverse-j objects remain reader targets. The scalar local-reflection identity is not the based-path theorem. |
| PS.8 quintic | Polynomial, companion connection, pairing and a parametrized boundary matrix with its horizontal/pairing identities. The Dwork series convergence, normalized chain map, invariant cohomology, log/crystalline comparison and transported integral lattice remain reader targets. |
| PS.9 | Actual descending sums, admissibility, numerical double-shuffle tests, Zagier's rational coefficients/evaluation and numerical Hoffman spanning. The total sum is used analytically only under admissibility/convergence. Shuffle/stuffle algebras, tangential objects, regularization maps, mixed-Tate carriers, motivic coactions, level filtrations and cut-matrix constructions remain reader targets. The explicit weight-five determinant checks rational arithmetic without constructing the motivic matrix. |

## Supplier contracts

### PadicMeasuresIwasawaAlgebras:L5 (PS.0–PS.7)

Determinant Picard functor of bounded perfect complexes over fields, DVRs and projective coefficient orders, with grading signs, inverse, dual, quasi-isomorphism, triangles, derived base change and the actual acyclic fractional-lattice trivialization. Import the generic functor; PS computes its arithmetic adapters.

Consumers: `PeriodsAndSpecialValues:PS.0/comparison-period-line`, `PeriodsAndSpecialValues:PS.0/deligne-periods`, `PeriodsAndSpecialValues:PS.3/rational-fundamental-line`, `PeriodsAndSpecialValues:PS.4/integral-fundamental-line`, `PeriodsAndSpecialValues:PS.4/finite-lattice-correction`.

### GeneralAlgebraicKTheory:KU-fundamental (PS.0–PS.7)

Relative K₀(O,A_R), its triple presentation, K₁ boundary, scalar-extension/restriction maps and exact sequence for projective order-structures, through the native K.3–K.5 owners aggregated at this checkpoint. No generic determinant functor is requested here. For the finite-dimensional semisimple Q-algebra A used here, also supply the passage from component Azumaya reduced norms to K₁(A) and K₁(A_R), compatibility of their relative boundaries, and the sign-corrected δ̂ of BF Lemma 9 with multiplier independence. The rational norm-image/real-positivity theorem is a separate arithmetic prerequisite to this construction, not a consequence of the Iwasawa dimension-one quotient interface.

Consumers: `PeriodsAndSpecialValues:PS.5/equivariant-obstruction`.

### ArithmeticGaloisRepresentations:R01.3 (PS.0–PS.7)

Import wd-from-monodromy and global-away-conductor for all admitted away-coefficient local exponents. Extend the latter’s excluded-prime scope only with the supplied compatible WD system; specify the exact positive conductor N(R), including base-field/discriminant normalization, used in the BCGP functional equation.

Consumers: `PeriodsAndSpecialValues:PS.1/motivic-euler-product`, `PeriodsAndSpecialValues:PS.1/serre-system-predicate`.

### MotivesAndAlgebraicCycles:MC.2 (PS.0–PS.7)

Actual Artin and modular eigenprojector motives in the stated scope, with coefficient fields, dual/Tate/real realization compatibilities and their geometric comparison. Artin Gauss-sum and modular-symbol period identifications must be actual morphism comparisons; equal ranks alone are insufficient.

Consumers: `PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter`, `PeriodsAndSpecialValues:PS.1/modular-period-adapter`.

### ComplexComparisonPartII:C5 (PS.0–PS.7)

Extend the proper smooth and curve comparison interfaces to the relative algebraic pairs used by MC.6 formal symbols, with naturality for pair morphisms, connecting maps/Stokes and relative products, and equality with integration. Existing proper and regular-singular curve nodes alone do not supply general singular pairs. For PS.0’s explicit elliptic matrix also identify the regular form ω and second-kind form xω in proper-curve de Rham cohomology, the two displayed closed paths in singular homology, and the comparison entries as their integrals. No complex-uniformization theorem is imported from EllipticCurves.

Consumers: `PeriodsAndSpecialValues:PS.2/integration-evaluation`, `PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations`.

### NeronModelsAndSemistableAbelianVarieties:R11.5 (PS.0–PS.7)

BCGP Proposition 2.8.1 for every H^i(A), 0≤i≤2g: actual strict compatibility at all v including v|λ, purity, and the indicated Hodge/infinity realization. The existing local-euler-polynomial node handles the local H¹ comparison but not this full all-degree global theorem.

Consumers: `PeriodsAndSpecialValues:PS.1/hasse-weil-predicates`.

### WeilConjectures:WC.2 (PS.0–PS.7)

Actual perfect Poincaré duality on H^i(A) and identification with the dual Tate twist H^{2g−i}(A), including local/infinity factors, needed for BCGP Corollary 2.8.7. Import the finite-field determinant duality already used by signed-zeta-functional-equation; provide this global-motivic compatibility extension.

Consumers: `PeriodsAndSpecialValues:PS.1/hasse-weil-predicates`.

### IntegralIwasawaTheory:I.7 (PS.0–PS.7)

The precise finite-level ETNC theorem for the abelian Tate family cited by BF Remark 10: L/Q finite abelian, K⊂L, r≤0, order Z[1/2][Gal(L/K)]. Supply original Burns–Greither theorem/section/page, descent and coefficient-order hypotheses, and its determinant/relative-class identity, rather than class-group annihilation alone.

Consumers: `PeriodsAndSpecialValues:PS.5/proved-case-adapters`.

### SelmerIwasawaCohomology:L4 (PS.0–PS.7)

The routed ArithmeticLevelRaisingAndBipartiteEulerSystems Part II: actual LTXZZ relevant Rankin Galois systems, strong coefficient field, full admissible-place predicate L1–L7, diagonal finite-direct-sum Abel–Jacobi class and reviewed theorem witnesses for Theorems 8.2.2/8.3.2 with inherited extraction proof gates discharged. The existing L4 Bloch–Kato condition is only the local-condition input.

Consumers: `PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction`, `PeriodsAndSpecialValues:PS.6/rankin-proved-scope`.

### AutomorphicLFunctionsAndLocalFactors:AL.5 (PS.0–PS.7)

The precise Rankin–Selberg L(s,Π₀×Π₁), central point 1/2, duality/epsilon and motivic normalization for the LTXZZ relevant conjugate-self-dual GL_even×GL_odd scope; the existing GL2 critical-value-period-interface does not supply a general Rankin special-value theorem.

Consumers: `PeriodsAndSpecialValues:PS.6/rankin-bbk-prediction`.

### NoncommutativeAndEquivariantIwasawa:NE.7 (PS.0–PS.7)

Resolve the reviewed BV global determinant-domain gap for Tate interpolation: specify the shifted/dual perfect complex C′, an actual comparison d(C′)≅d(RΓ_c)⁻¹, the map a:1→d(C′), its Bockstein trivialization and compatibility with ζ. Recompute r_G, relative boundary and the c_γ factor and prove the normalized Theorem 5.5/Corollary 5.7 statements with all arithmetic hypotheses. Neither inversion of ζ alone nor its existence supplies this witness. Retain nonzero-regulator hypotheses and the published Q-valued-character correction.

Consumers: `PeriodsAndSpecialValues:PS.5/zeta-orientation-adapter`, `PeriodsAndSpecialValues:PS.5/proved-case-adapters`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv (PS.0–PS.7)

Consume the existing invariant differential, functorial pullback and equation-level normalization from this layer; the proper-curve integration/path comparison is requested separately from C5. No new upstream target is requested.

Consumers: `PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68 (PS.0–PS.7)

Consume the existing Tate module, Weil pairing and duality identification for the elliptic H¹(1) realization. No new upstream target is requested.

Consumers: `PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv (PS.0–PS.7)

Consume the existing point-level reduction, component group and local Tamagawa number for the chosen minimal differential/model. No generic local L-function or new upstream target is requested.

Consumers: `PeriodsAndSpecialValues:PS.4/local-correction-adapter`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii (PS.0–PS.7)

Consume the existing canonical-height pairing, its nondegeneracy assumptions and Mordell–Weil regulator, with the index-squared basis law. No new upstream target is requested.

Consumers: `PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4 (PS.0–PS.7)

Consume the existing elliptic Selmer/Sha carriers and conditional arithmetic BSD quotient over Q with its full real-period convention. Its general number-field or complex-uniformization extension is not assumed.

Consumers: `PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter`.

### MotivesAndAlgebraicCycles:MC.2 (PS.8–PS.9)

Realisation and cup-pairing maps for the selected smooth projective quartic/quintic models, compatible with finite group actions and cycle maps. Generic quotient/resolution geometry used for the quartic is not supplied by the realisation theorem: gap G4 identifies its separate owner requirement.

Consumers: `PeriodsAndSpecialValues:PS.8/quartic-pencil`, `PeriodsAndSpecialValues:PS.8/quintic-pencil`.

### CrystallineCohomology:CR.7 (PS.8–PS.9)

For the displayed proper smooth quintic over its good-prime base, finite-projective crystalline cohomology with horizontal Frobenius, cup pairing and the order-125 invariant projector; identify the hypotheses required for integral torsion-freeness. This request does not pretend that CR.7 already proves a Dwork comparison.

Consumers: `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`, `PeriodsAndSpecialValues:PS.8/quintic-crystalline-comparison`.

### CrystallineCohomology:CR.5 (PS.8–PS.9)

The log-crystalline realization and Frobenius on a proved log-smooth/semistable model at λ=0, with the residue and pairing interface needed by the boundary transport.

Consumers: `PeriodsAndSpecialValues:PS.8/quintic-crystalline-comparison`.

### CrystallineCohomology:CR.6 (PS.8–PS.9)

A semistable comparison for the selected quintic degeneration, including compatibility of its log extension, monodromy, cup product and rational Frobenius; only after the model and comparison hypotheses in G1 are verified.

Consumers: `PeriodsAndSpecialValues:PS.8/quintic-crystalline-comparison`.

### ModularCurvesPartII:R13.3 (PS.8–PS.9)

The Tate-cusp normalization j(q)=q⁻¹+744+⋯ with integral coefficients, x=1/j∈q+q²Z[[q]], and its analytic Schwarzian comparison to the level-one modular invariant. The latter analytic identity must be imported from uniformisation R12.1 or supplied as a precise addition, not inferred from a formal Tate expansion.

Consumers: `PeriodsAndSpecialValues:PS.8/quartic-modular-relation`.

### BorelRegulators:R.3 (PS.8–PS.9)

The rational K-groups of Z needed for Beilinson–Soulé vanishing and the mixed-Tate Ext¹ computation: one-dimensional in K_{4m+1} for m≥1, zero in the other positive weights apart from K₁(Q) at the rational-field input.

Consumers: `PeriodsAndSpecialValues:PS.9/mixed-tate-z`, `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`.

### BorelRegulators:R.4 (PS.8–PS.9)

Injectivity of the Borel/Hodge regulator on the rational odd K-groups of number fields, sufficient for DG Proposition 2.14’s Ext¹ realisation injection.

Consumers: `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`.

### MotivesAndAlgebraicCycles:MC.4 (PS.8–PS.9)

The rational motivic-cohomology/Adams K-theory identification for number fields and the Tate-generated subcategory, sufficient for the specific mixed-Tate t-structure and Ext computations; also relative-cohomology framed motives and their functorial maps for the motivic stuffle comparison.

Consumers: `PeriodsAndSpecialValues:PS.9/mixed-tate-z`, `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`.

### AnabelianGeometryAndNonabelianChabauty:NC.2 (PS.8–PS.9)

Source-qualified extension to the currently stated unipotent de Rham/étale groupoid: finite Betti and de Rham path truncations, comparison with the cosimplicial/bar construction, tangential base points and their composition/comparison laws (DG §§3.10–3.13 and Theorem 4.4). PS.9 owns the mixed-Tate three-punctured-line specialization. This request is open because the current NC.2 statement does not already supply all these additional structures.

Consumers: `PeriodsAndSpecialValues:PS.9/motivic-path-torsor`.

## Proof and interface obligations

### PS.0–PS.7: Geometric period identifications

The imported analytic values are not by themselves Deligne algebraicity theorems. Source/refine the actual Artin Gauss-sum and modular-symbol-to-motivic comparison, with character inverse, sign, rational structure and chosen period. Deligne §§6.3–6.7 and §7.8 give the route, and the full geometric comparison proofs are explicit supplier obligations. MC.2 supplies the geometric objects; AL.5 the analytic formula.

Consumers: `PeriodsAndSpecialValues:PS.1/dirichlet-tate-adapter`, `PeriodsAndSpecialValues:PS.1/modular-period-adapter`.

### PS.0–PS.7: Relative-pair integration comparison

C5’s present proper smooth and curve contracts do not cover every singular algebraic pair in the MC.6 presentation. Its requested relative/Stokes/product comparison is an explicit prerequisite before descent of the actual integral evaluation can be completed. The explicit elliptic example additionally needs the second-kind de Rham classes and homology-path identification under this integration comparison; its elementary integral substitutions do not replace that geometric input.

Consumers: `PeriodsAndSpecialValues:PS.2/integration-evaluation`, `PeriodsAndSpecialValues:PS.2/torsor-integration-comparison`, `PeriodsAndSpecialValues:PS.0/tate-elliptic-normalizations`.

### PS.0–PS.7: Integral real dyadic determinant

Complete real Tate cochains at 2 are unbounded. Supply a specific bounded perfect replacement with its comparison and retained two-primary errors, or restrict the theorem to odd primes/no real places. No general integral replacement is asserted to exist. The p=2 elliptic comparison cannot be concluded from the odd-prime line.

Consumers: `PeriodsAndSpecialValues:PS.4/real-dyadic-gate`, `PeriodsAndSpecialValues:PS.6/elliptic-fundamental-adapter`.

### PS.0–PS.7: Original zeta-isomorphism and abelian Tate proof sources

The original Fukaya–Kato formulation was not acquired; the inverse-line convention is checked against both BV versions. The NE.7 supplier requires a corrected contract: its normalized Tate leading terms require a typed shifted/dual determinant comparison and recomputation of r_G, boundary and c_γ before use (E5). Original Burns–Greither proof and exact theorem locator for the BF Remark 10 abelian Tate family remain an I.7 obligation; that family requires the original theorem before it can be used as a proved ETNC import. BV Theorem 5.5 and published Corollary 5.7 remain conditional targets with their full hypotheses and orientation gate.

Consumers: `PeriodsAndSpecialValues:PS.5/zeta-orientation-adapter`, `PeriodsAndSpecialValues:PS.5/proved-case-adapters`.

### PS.0–PS.7: Rankin proof-route and derivative comparison gates

The routed PAPER-LIU-ETAL-22 extraction identifies unresolved proof-route gates. Its Part II owner must discharge the relevant gates before supplying unconditional rank-zero/one theorem witnesses. Derivative nonvanishing versus diagonal-cycle nonvanishing separately needs Conjecture 8.3.1 and Abel–Jacobi injectivity. The Part II has no registered atlas id in this checkout, so the request is attached to L4 and recorded in restructure.

Consumers: `PeriodsAndSpecialValues:PS.6/rankin-proved-scope`.

### PS.0–PS.7: Deligne original-version collation

The English translation revised 2018 was read; the original IAS file refused download. Collate original Proposition–Definition 2.3(ii), and the critical-period locators, before attributing E2 to the published French article. The corrected simultaneous dual regularity agrees with Definition 1.3 and the unit-motive test in the translation itself.

Consumers: `PeriodsAndSpecialValues:PS.1/critical-integer`, `PeriodsAndSpecialValues:PS.1/deligne-algebraicity`.

### PS.0–PS.7: Finite semisimple coefficient norm and sign comparison

IHG.0 supplies the Azumaya reduced-norm law. Its passage to the finite semisimple K₁/boundary maps and the rational norm-image theorem with real quaternion sign constraints needed by BF Lemma 9 must be supplied before the extended boundary is implemented. NE.3 currently concerns dimension-one Iwasawa quotient algebras and cannot replace this contract. The KU-fundamental request records the needed comparison; the generic arithmetic norm theorem needs routing to the central-simple-algebra direction.

Consumers: `PeriodsAndSpecialValues:PS.5/equivariant-obstruction`.

### PS.8–PS.9 G1: Quintic Dwork, integral crystalline and limiting-lattice bridge

The homogeneous/projective twisted-complex comparison must be proved on the actual overconvergent/completed family; the C_p formal module must be identified with the rationalized invariant proper-smooth F-crystal. Prove integral invariant torsion-freeness, a semistable/log model at λ=0, extension compatibility and the actual transported lattice. SS §3 explicitly does not prove full equality with crystalline Frobenius. Shapiro’s matrix calculation is not this proof. Candidate owner: a source-qualified addition to PadicDifferentialEquationsAndRigidCohomology, coupled with CR.5–CR.7; no claim that their present stage descriptions contain the complete bridge.

Consumers: `PeriodsAndSpecialValues:PS.8/quintic-formal-connection`, `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`, `PeriodsAndSpecialValues:PS.8/quintic-crystalline-comparison`, `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`.

### PS.8–PS.9 G2: Weighted Dwork-series convergence estimates

Give quantitative p-adic estimates proving convergence of ΣB_n(n−1)! and the degree-two harmonic-weighted sum for each odd p≠5. The selected Shapiro version asserts the convergence and refers to work in preparation; the checked passages do not supply the full estimate. The boundary theorem is stated with convergence as a premise until this is proved. No divergent total tsum convention substitutes for this premise.

Consumers: `PeriodsAndSpecialValues:PS.8/dwork-coefficients`, `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`.

### PS.8–PS.9 G3: Frame-preserving transport of convergent motivic stuffle

Construct the equality between Soudères’s relative-cohomology framed MZVs and Brown’s tangential path-period generators in H, preserving both frames and tensor/product structures. SO Proposition 4.24 proves convergent framed stuffle; B Lemma 3.8 assumes its validity for Brown’s presentation with ζ^m(2) nonzero. The explicit presentation comparison is the remaining source-specific proof obligation. Brown’s leading-zero identity (3.8) is shuffle-regularized, and Lemma 3.8 needs only convergent stuffle, so no additional divergent-stuffle polynomial extension is required by the Hoffman proof. MC.4 supplies generic relative motives. This gap is not numerical period injectivity.

Consumers: `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`, `PeriodsAndSpecialValues:PS.9/motivic-zagier-evaluation`, `PeriodsAndSpecialValues:PS.9/hoffman-cut-matrix`, `PeriodsAndSpecialValues:PS.9/hoffman-motivic-basis`.

### PS.8–PS.9 G4: Generic finite quotient and relative A3 resolution supplier

The explicit invariant quotient and six A₃ resolutions are given by Hartmann; a reusable algebraic finite quotient/minimal-resolution interface at the required relative generality was not found in the pinned trees or current upstream roadmaps. MC.2 supplies realizations, not resolutions. A geometry-owner addition must supply that interface; the explicit selected-family verification remains in PS.8. Do not relabel this generic missing geometry as existing cohomology.

Consumers: `PeriodsAndSpecialValues:PS.8/quartic-pencil`, `PeriodsAndSpecialValues:PS.8/quartic-residue`.

### PS.8–PS.9 G5: Current IntegralLattices supplier catalogue link

The current TauCetiRoadmap IntegralLattices README, commit 070dc2becd74419e76303ede84b465ed4a69461f, owns Layer 5H primitive-embedding uniqueness in an even unimodular ambient lattice and Layer 6A indefinite classification. Their exact contracts are recorded on quartic-lattice. The atlas snapshot only has its retired Completed/IntegralLattices predecessor, which does not contain these targets; no old stage id is substituted. The current upstream supplier needs a catalogue link. This is a catalogue/interface obligation, not missing generic lattice mathematics and not authority to replan or edit upstream.

Consumers: `PeriodsAndSpecialValues:PS.8/quartic-lattice`.

## Source findings and version boundaries

The two packets use overlapping E1–E4 labels. Each label below is qualified by its source and layer range. The findings concern the exact checked version, and the corrected target statements above retain all source-specific hypotheses. A proof-interface gap is not attributed as an error in a source theorem.

### PS.0–PS.7 E1 — BCGP

§2.8 local cohomological zeta-product display after (2.8.5), preprint p. 37; published p. 196 reported by the existing extraction, not collated here

Issue (paraphrase): The alternating local product uses the complex variable in the sign exponent (−1)^s.

Required statement or interface: The exponent is (−1)^i, the cohomological degree, when the factors are local L-functions (inverse characteristic polynomials).

Reason: For an elliptic curve the H¹ L-function must occur inversely, while H⁰/H² occur positively, at every complex s in the convergence region. A complex-variable sign cannot implement that point-count identity.

Version scope and prior record: Already recorded in PAPER-BOXER-CALEGARI-GEE-PILLONI-21; this packet imports that correction.

### PS.0–PS.7 E2 — Deligne

Proposition–Definition 2.3(ii), Ghate–Beineke English translation revised 2018, PDF p. 10 only; original French article not collated

Issue (paraphrase): The second infinity factor is evaluated as L∞(M∨(1),s) at s=n, with a positive s argument.

Required statement or interface: Use L∞(M∨(1),−s), equivalently L∞(M∨,1−s), at s=n, in agreement with Definition 1.3.

Reason: For Q(0), n=−1 is critical: Γ_R(−1) and Γ_R(2) are regular. The printed second factor instead evaluates Γ_R(1+n)=Γ_R(0), falsely excluding n=−1. The corrected dual test also rejects n=1.

### PS.0–PS.7 E3 — BF

Publisher PDF, Remark 7, printed p. 534

Issue (paraphrase): The displayed local L-factor is the characteristic polynomial P_v evaluated at (Nv)^−s, without a reciprocal.

Required statement or interface: Use L_v(M,s)=P_v(M,(Nv)^−s)^−1, consistently with §3.2 and the Euler product convention.

Reason: The unit realization has P_v(T)=1−T and local factor (1−(Nv)^−s)^−1. The displayed polynomial itself gives the opposite Euler factor. The surrounding intended convention fixes the missing reciprocal.

### PS.0–PS.7 E4 — BV

Author final Corollary 5.7/proof, internal p. 27; compare published Corollary 5.7 p. 196

Issue (paraphrase): The author final extends the permutation-character induction argument to Q_p-valued characters.

Required statement or interface: Use Q-valued characters, as the published version already does.

Reason: For C₃ and p=7 a nontrivial character is Q₇-valued but not Q-valued. No positive multiple is an integer combination of permutation characters, whose values are rational integers. Both versions were compared at this locator.

Version scope and prior record: Corrected in published Corollary 5.7 p. 196; independently recorded by NoncommutativeAndEquivariantIwasawa/E12.

### PS.0–PS.7 E5 — BV

Published Definition 2.5 pp. 170–171, Definition 3.7 p. 177, Conjecture 4.1 p. 188 and Remark 5.6/proof pp. 194–195; author final internal pp. 6, 10, 20–21, 25–26

Issue (paraphrase): The inverse-determinant global ζ is used to form a leading-term pair for the unshifted compact-support complex.

Required statement or interface: Supply the actual shifted/dual perfect complex, its determinant identification and typed Bockstein composition, then recompute order, boundary and normalization. Until then retain the interpolation identity only as a supplier target.

Reason: The pair [C,a] requires a:1→d(C), and t(C) starts from d(C). Conjecture 4.1 gives ζ:1→d(RΓ_c)⁻¹, while Remark 5.6 uses [RΓ_c,ζ]; (25) and (28) also present the Bockstein source in the inverse orientation. No comparison resolving these different domains is supplied at these locators. This is an interface/proof gap, not a counterexample to the intended arithmetic identity.

Version scope and prior record: Independently recorded in NoncommutativeAndEquivariantIwasawa/E28; the published text retains this domain mismatch.

### PS.0–PS.7 E6 — BV

Author final Corollary 5.7 proof, internal p. 27; published proof p. 196

Issue (paraphrase): The proof characterizes permutation characters by admitting an integer combination of permutation characters with multiplier n_ρ=1.

Required statement or interface: Permutation characters are actual permutation representations; an integer combination may have negative coefficients. Keep the corollary’s sufficient implication for permutation characters, without that converse.

Reason: For C₂ the sign character equals the regular permutation character minus the trivial one, but its value at the nonidentity element is −1. A permutation character has nonnegative fixed-point counts. The same proof sentence is present in both checked versions.

Version scope and prior record: Independently recorded in NoncommutativeAndEquivariantIwasawa/E32; retained in the published proof.

### PS.0–PS.7 E7 — BV

Author final §5.2, map following (19), internal p. 24; published §5.2, map following (23), p. 193

Issue (paraphrase): The map µ_p induced by the p-adic logarithmic regulator is presented as an isomorphism before a nonzero-regulator hypothesis is imposed.

Required statement or interface: Require its nonzero determinant, equivalently the relevant Leopoldt premise, before using µ_p as an isomorphism. Conjecture 5.2 and the corollary have additional premises that must be retained.

Reason: Factoring the logarithmic localization map through the trace-zero subspace supplies the map and equal dimensions, but not injectivity. Remark 5.4 separately identifies the missing regulator nonvanishing with Leopoldt in the permutation cases. This does not assert that Leopoldt is false.

Version scope and prior record: Independently recorded in NoncommutativeAndEquivariantIwasawa/E27; the published formulation retains the unsupported isomorphism.

**BV version record (published).** [Documenta Mathematica extra volume Coates (2006), pp. 165–209; published text collated separately from the author final.](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/burns_venjakob.pdf).

### PS.8–PS.9 E1 — H

H, Proposition 4.26 and Example 4.27, PDF p.21; §4.7 normalization; checked arXiv 1101.4601v1 only

Issue (paraphrase): the form is rescaled by t⁻¹ and the pulled-back hypergeometric operator is a scalar times D_t followed by multiplication by t.

Required statement or interface: Rescale the period form by t. With z=t⁻⁴ in H’s unscaled hypergeometric variable, the operator is (1−t⁴)/64 · D_t∘m_{1/t}. Raw periods are t⁻¹ times the hypergeometric solutions.

Reason: Put θ=−t∂_t/4. Both sides of the corrected identity have derivative coefficients (1−t⁴)/(64t), −3(t⁴+1)/(64t²), (6/t³−t)/64, −3/(32t⁴). Applied to 1, the printed right-hand side is −t²/8, while the hypergeometric operator gives −3/(32t⁴). The period ratio is unaffected by the common rescaling.

Version scope and prior record: No separate correction is recorded for the checked version.

### PS.8–PS.9 E2 — H

H, Theorem 4.28, PDF p.22, U₁ upper parameters; compared with NS formula (26), p.9; checked arXiv 1101.4601v1 only

Issue (paraphrase): U₁ uses the upper hypergeometric pair (1/8,3/8) in the variable 1−t⁴.

Required statement or interface: Use (1/8,1/8) for U₁ in the variable 1−t⁴, as in the original NS formula (26). U₂ keeps (5/8,5/8); those equal parameters are correct in this variable.

Reason: Changing from t⁻⁴ to 1−t⁴ includes the hypergeometric inversion transform, so one must not carry over the original unequal upper pair. The regular local solution has linear coefficient 1/32, not 3/32. NS gives the equal pair explicitly and the same square-root reflection.

Version scope and prior record: The source being cited, Nagura–Sugiyama hep-th/9312159, formula (26), already has the correct equal pair; no separate Hartmann erratum located.

### PS.8–PS.9 E3 — H

Theorem 4.12, PDF p.15, arXiv 1101.4601v1 only; K3 application on p.16

Issue (paraphrase): The preprint claims uniqueness of primitive embeddings of an even nondegenerate S into any even nondegenerate L under strict signature differences and rank(L)−rank(S)≥l(S)+2, without requiring L to be unimodular.

Required statement or interface: Require an even unimodular ambient L for the stated sufficient uniqueness theorem, or use the full discriminant-form classification for a general ambient lattice. The K3 application is valid because H² is even unimodular of signature (3,19); import the precise existing IntegralLattices 5H contract.

Reason: Let L=U⊕U⊕⟨−6⟩ with hyperbolic bases e₁,f₁,e₂,f₂ and g²=−6, and S=⟨2⟩. The primitive vectors v=e₁+f₁ and w=2e₁+2f₁+g both have norm 2, but gcd{(v,x):x∈L}=1 and gcd{(w,x):x∈L}=2. Divisibility is O(L)-invariant, so their primitive embeddings are inequivalent. L has signature (2,3), S has (1,0), l(S)=1, and rank gap 4≥3; all the printed inequalities hold. L has determinant −6 and is not unimodular.

Version scope and prior record: Scoped to the checked preprint; no assertion about the unread published theorem.

### PS.8–PS.9 E4 — H

Proof of Theorem 4.29, PDF p.23, arXiv 1101.4601v1 only; compare Proposition 4.24, p.20

Issue (paraphrase): The proof transfers the reflection known near t=1 for γ₄ to the marked γ₁ by claiming their images under t↦t⁻⁴ coincide as based loops.

Required statement or interface: Retain the based paths and branch translations. The unshifted local ratio at a real parameter s near 1 pulls back by t=i·s to the marked γ₁ chart near t=i. Use that reflection directly in Proposition 4.25; do not identify γ₁ with γ₄. The normalized series conclusion remains supported by this corrected argument.

Reason: The source’s marked monodromies are β₁(p)=−1/(2p) and β₄(p)=(3−2p)/(2−2p). They are different: β₄=Tβ₁T⁻¹ with T(p)=p+1, and their fixed points are ±i/√2 and 1±i/√2. Thus the claimed equality of based continuations is incompatible with the earlier monodromy calculation. The pulled chart uses (−it)⁴=t⁴ and the same real logarithm at t=i√2, so it supplies γ₁ without that identification.

Version scope and prior record: Scoped to the checked preprint proof; no assertion about the unread published proof.

**H version record (preprint).** [https://arxiv.org/pdf/1101.4601v1](https://arxiv.org/pdf/1101.4601v1). The complete 29-page checked PDF is the text for E1–E4. Its title page is dated 29 October 2018. The publisher landing page for DOI 10.1007/s00229-012-0577-7 was inspected but full published text was not available there; these findings make no assertion about the version of record.

**H version record (published).** [Manuscripta Mathematica 141 (2013), 391–422](https://link.springer.com/article/10.1007/s00229-012-0577-7). Metadata/preview only; full text not read. Listed to distinguish the inaccessible version of record from the checked preprint.

## Completion criteria

Each layer is a planned implementation target. Completion requires its statements, API and discriminating checks on the actual mathematical objects, together with the exact supplier contracts and proof/interface obligations listed above. A coordinate calculation, abstract equivalence or numerical test does not replace its stated geometric or arithmetic comparison.

- `PeriodsAndSpecialValues:PS.0`: Discharge L5 determinant and actual geometric-comparison contracts for the admitted motives; collate original Deligne locators.
- `PeriodsAndSpecialValues:PS.1`: Prove the Artin/modular geometric period identifications; obtain all-degree abelian strict compatibility and the exact global conductor/duality contracts. General Deligne and Serre/Hasse–Weil assertions remain explicit predicates.
- `PeriodsAndSpecialValues:PS.2`: Supply C5 relative-pair/Stokes/product comparison and complete the actual integration-evaluation descent; MC.6 already owns the localized algebra and torsor theorem.
- `PeriodsAndSpecialValues:PS.3`: Supply L5 and M.8 case-specific regulator/fundamental-line comparisons with the displayed BF/FK signs. General regulator exactness and Beilinson leading terms remain hypotheses.
- `PeriodsAndSpecialValues:PS.4`: Discharge perfectness/coherence and integral local-condition comparisons; resolve the real dyadic gate for any theorem claiming the prime 2.
- `PeriodsAndSpecialValues:PS.5`: Acquire original FK/Burns–Greither locators and reviewed theorem-scope witnesses; discharge relative K-group/order-structure contracts. General ETNC remains a predicate. Discharge the NE.7 shifted/dual determinant and normalized interpolation comparison, and the finite semisimple reduced-norm/sign contract; do not import the unresolved BV leading terms as proved formulas.
- `PeriodsAndSpecialValues:PS.6`: Discharge the conditional elliptic local/regulator comparison including 2, and the routed Rankin proof/derivative gates. All-prime BSD reconstruction is imported from BSD.8.
- `PeriodsAndSpecialValues:PS.7`: Discharge the imported arithmetic/period comparison contracts, then prove the two explicit quadrature specializations and their rounded error budgets. Exact recognition needs discrete membership/separation.
- `PeriodsAndSpecialValues:PS.8`: Discharge G1, G2 and G4 and the precise generic supplier requests before proof execution; link the current upstream IntegralLattices supplier recorded in G5.
- `PeriodsAndSpecialValues:PS.9`: Discharge G3 and the precise mixed-Tate/realisation suppliers before proof execution.
