# Gross–Zagier formulas and arithmetic heights

This roadmap plans the complex Gross–Zagier identity, its arithmetic kernel proof,
and the weight-two anticyclotomic logarithm formulas. Its ten layers connect existing
height, Jacobian, modular-curve, representation and local-field foundations to
normalized toric periods and Heegner-point heights. The definitions specify the
actual arithmetic objects; a supplied vector or power series in the suggested
file represents only the finite algebra needed after those objects are constructed.

The primary blueprint continues the two accepted parts. It owns thirteen integrated
milestones or additional comparisons and imports 264 targets by their original IDs,
for 277 targets in this reader. Six obsolete targets are redirected to existing
height declarations or AutomorphicSpectralTheory. The primary packet records the
part hashes, corrections and substitutions, so the unchanged part files remain
the provenance of the imported statements. Its new material requires independent
review. Every layer is **planned**; none is closed or claimed implemented.

## Prerequisites and boundaries

The blueprint pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`
and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The 83 cited baseline
declarations were read at those pins. Current Tau Ceti `a91d3aaf` and current
TauCetiRoadmap main `0d144d04` were screened separately. In particular, current
elliptic height names have a different normalization from the blueprint pin.
Existing library definitions are imported, with a comparison of conventions.

TauCetiRoadmap StableReduction Layers 1, 4, 5 and 7 supply regular-model,
dual-graph, vertical-intersection and semistable base-change infrastructure.
JacobianChallenge supplies the Jacobian direction; GZ.2 adds admissible metrics
and global arithmetic gluing, rather than rebuilding regular models or Jacobians.
General ample canonical heights and Northcott are RP.0 inputs; general
Mordell–Weil finite generation is RP.1. Northcott alone supports the zero-height
torsion argument and does not prove general finite generation.

AutomorphicSpectralTheory AS.2 owns the hyperbolic automorphic Green resolvent
and its residue. Its effective PSL₂ sum counts ±I once, has Laplacian eigenvalue
s(s−1), and has residue −12/[SL₂(ℤ):Γ₀(N)]. GZ.7 retains the marked CM,
diagonal finite-part and arithmetic comparisons. The nine upstream roadmaps
newer than the atlas snapshot, and the four Completed roadmaps listed in
WORKERS.md, were screened through their actual Suggested files; no Gross–Zagier,
toric-period or admissible-height target was found there.

The square-root distribution is owned by AutomorphicPadicLFunctions L3h.
GeneralizedHeegnerCycles GH.4 owns BDP Theorem 5.13 for every r and j; GZ.9
imports its r=j=0 specialization and owns the Brooks quaternionic construction
and weight-two comparisons. GH.4’s conductor-n>1 Chida–Hsieh formula does not
supply the trivial-character endpoint. Modular-symbol measures in L2 are not
inputs to this CM construction. RankZeroOneBSD consumes Gross–Zagier; the
auxiliary quadratic field in GZ.8 is a hypothesis, rather than an import from BSD.2.

## Conventions

### Heights at the pin and in current Tau Ceti

At the blueprint pin, `Point.canonicalHeight` is h_O, the limit of
h_naive(2ⁿP)/(2·4ⁿ), and `neronTatePairing` is its half-polarization B_O.
Use the mathematical symbols h_x=2h_O and B_x=2B_O. Thus
B_x(P,Q)=h_O(P+Q)−h_O(P)−h_O(Q), B_x(P,P)=h_x(P), and the rank-r
Gram determinant is Reg_x=2^r·`regulator`. The geometric Poincaré comparison
uses B_x. It still depends on the historical YZZ source locator specified below.
These symbols introduce no new library height, pairing or regulator definition.

Current Tau Ceti instead defines `canonicalHeight` with denominator 4ⁿ, so
its height, half-polarized `neronTatePairing`, and `regulator` already give
h_x, B_x and Reg_x. Applying the blueprint's extra factors of two to those
current declarations would be wrong. A quadratic height q(a,b)=a²+2b² has
half-polar Gram determinant 2 and full-polar Gram determinant 8, detecting
the rank-two factor. At rank zero both determinant conventions give 1.

Number-field heights here are relative. Compatible degree-d base change
multiplies a relative height and pairing by d and a rank-r regulator by d^r.
Divide by [K:ℚ] for an absolute height. Each local formula tracks place degrees,
different and discriminant; residue cardinality and residue degree are distinct.

### Characters, periods and local signs

The χ-component satisfies gP=χ(g)⁻¹P. Its finite orbit sum is weighted by
χ(g), and probability averaging divides by the group order. Double averaging
scales a bilinear pairing by the inverse square of that order. The torus quotient
measure has total volume 2L(1,η), with completion specified by the formula;
the quaternionic Petersson Tamagawa measure has volume 2. These two volume
comparisons are separate inputs. The local Rankin epsilon factor is
η_v(−1) times the quadratic base-change epsilon factor, including the Langlands
lambda-factor. Use the corrected base-change matching sign, not an uncorrected
Rankin sign, when choosing the quaternion algebra.

Unitary L-functions have center 1/2 and weight-two motivic ones center 1.
The existing complex gamma factor is Γ_ℂ(s)=2(2π)^(−s)Γ(s). At a central zero,
the derivative of N^(s/2)Γ_ℂ(s)L(s) is √N·L′(1)/π. Replacing Γ_ℂ by half
that function changes the factor. The classical Petersson product is linear
in its first input and uses y^(2k)dxdy/y²; at weight two this is |f|²dxdy.
For a CM order w=#O×=2u, so Gaussian and Eisenstein stabilizer indices are
2 and 3. Scaling a modular differential, an isogeny or a rational structure
retains its Manin and period factors. A p-unit assertion uses the exact
JSW hypotheses, including p∤2ND, and does not set every Manin constant to 1.

### Arithmetic and analytic kernels

For g>0 use the Arakelov probability form, ddᶜ=(i/π)∂∂bar, and
ddᶜg_D=deg(D)μ−δ_D with the unsquared metric exp(−g_D). Principal complex
height symbols then use log|f|². At real places require conjugation descent.
The genus-one measure has its own translation-invariant normalization; division
by 2g−2 is restricted to g>1. Finite intersection lengths are weighted by log q_v.
Half Hom counts, coarse stabilizers, tangent symbols, tensor pairings and
modified self-intersections are compared explicitly before the global sum.

The classical resolvent starts with Re(s)>1 and is regularized at s=1; the
Colmez shifted resolvent starts with Re(s)>0 and is regularized at s=0.
The Colmez Green function has Hodge-line mean −1 and needs its constant
correction to become fully admissible. Keep the resulting Eisenstein terms
until the two auxiliary split-place conditions make them vanish.
The Siegel–Weil convergent-range condition m−r>n+1 does not include the
isotropic binary (2,1,1) or ternary (3,1,1) applications: the required
regularized comparison is a distinct supplier contract.

### Shared hypothesis blocks

A target naming H1–H13 assumes every clause of the corresponding block.
Extra clauses at a target remain in force; analytic hypotheses do not imply
the marked-divisor N>1 hypothesis or the ordinary prime assumptions.

- **H1.** K=ℚ(√D), D<0 a fundamental discriminant; ε=(D/·), h=#Cl(K), w=#O_K×=2u; A an ideal class; r_A(n) counts integral ideals of norm n and r_A(0)=1/w.
- **H2.** N≥1 is prime to D; f is a weight-2k newform, k≥1, with a(1)=1 where eigenform normalization is used. Petersson pairing is linear in the first argument, with y^(2k)dxdy/y² and no implicit volume division.
- **H3.** For the classical Heegner local statements: D is odd, D≡square mod4N, every p|N splits in K; x is the CM cyclic N-isogeny diagram over the Hilbert class field H, c=(x)−∞, d=(x)−0; σ corresponds to A under the stated Artin convention.
- **H4.** m≥1 with gcd(m,N)=1. At a finite place v|p, ord_v(π)=1, q_v=#κ(v); W is the completed maximal unramified extension of O_Hv. Actual chosen integral diagrams, not a canonical Hom functor of arbitrary coarse Artinian points, are used.
- **H5.** F is totally real, E/F is CM quadratic with character η; additive characters and self-dual measures follow the source
- **H6.** When quaternionic data occur, 𝔅 is totally definite incoherent with an embedding E𝔸→𝔅; B(v) is its nearby coherent algebra
- **H7.** For §7.2 computations: |Σ(𝔅)|>1; no finite place is ramified in both E and 𝔅; U=Ô𝔅× for a chosen maximal order Ô𝔅⊃ÔE
- **H8.** N_v is residue cardinality, d_v the different of F_v/ℚ_p, D_v the relative discriminant of E_v/F_v; arithmetic degrees are relative to F
- **H9.** φ has all five §7.2 local components; S² has two E-split, ℚ-unramified places; original 𝔧 belongs to 𝔅, nearby j to B(v)
- **H10.** Off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.
- **H11.** N>1 where the marked cusps 0 and ∞ must be distinct.
- **H12.** C is a compact connected Riemann surface of genus g>0
- **H13.** ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2)

## How to read the build

The prerequisite links, rather than numerical layer order alone, define the build. Layers 6–7 contain interleaved analytic and arithmetic inputs to their end identity; the expanded graph of 277 targets and 593 internal edges is acyclic. Definitions and constructions have their full APIs, uses and mathematical Checks here. Supplier stages name requested interfaces, unless an exact existing target is given. The following table gives the layer milestones and target counts.

| Layer | Direction | Targets | Status |
| --- | --- | ---: | --- |
| [GZ.0](#layer-0) | Normalization and change-of-convention interfaces | 14 | planned |
| [GZ.1](#layer-1) | Point heights on abelian varieties and the Poincaré pairing | 5 | planned |
| [GZ.2](#layer-2) | Admissible pairings on arithmetic surfaces | 17 | planned |
| [GZ.3](#layer-3) | Rational automorphic realizations and modular degrees | 11 | planned |
| [GZ.4](#layer-4) | Local toric multiplicity one, dichotomy and test vectors | 7 | planned |
| [GZ.5](#layer-5) | Coherent theta kernels and the Waldspurger formula | 11 | planned |
| [GZ.6](#layer-6) | Arithmetic generating series and incoherent analytic kernels | 68 | planned |
| [GZ.7](#layer-7) | Local arithmetic identities and boundary contributions | 108 | planned |
| [GZ.8](#layer-8) | The general Gross–Zagier pairing and explicit specializations | 19 | planned |
| [GZ.9](#layer-9) | The split ordinary p-adic logarithm/toric formula | 17 | planned |

## Supplier contract audit

The independent package review #9217 identified 23 absent and 43 partial historical contracts, plus missing Arakelov and rational-structure inputs. This consolidation makes their status explicit and proposes owners. The toric Hom definition is redirected to its existing GZ.4 owner; two P4 trivializations are imported with their actual hypotheses. The other entries remain exact extensions or source decompositions, not available exports. GZ.7 already states its height multiplicity and quaternionic-count formulas; that does not manufacture the reusable CM deformation input. The request list below records every consumer.

### R1-epsilon

Quadratic base-change epsilon comparison ε_RS=η_v(−1)ε_BC, in the corrected convention.

**Status:** extension-gap. **Proposed owner:** AutomorphicLFunctionsAndLocalFactors, Part II: quadratic base-change local comparisons.

**Supplier boundary:** `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Consumers:** [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Classical Rankin normalization](#target-gz-0-classical-rankin-normalization), [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [Rankin absolute convergence](#target-gz-6-classical-absolute-convergence), [Half-weight Waldspurger value](#target-gz-5-half-weight-waldspurger-value), [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number), [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character](#target-gz-8-rational-shimura-curve-heegner-formula), [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Corollaries on derivatives: positivity and Galois invariance](#target-gz-8-derivative-corollaries).

### R1-special-functions

The terminating p_(k−1), decaying q_(k−1), gamma/Mellin/Legendre identities and differentiation bounds.

**Status:** extension-gap. **Proposed owner:** AutomorphicLFunctionsAndLocalFactors, Part II: archimedean Rankin special functions.

**Supplier boundary:** `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Consumers:** [Integral Rankin kernel values](#target-gz-6-classical-integral-kernel-values), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Rankin Mellin regularization](#target-gz-6-classical-rankin-mellin-regularization).

### R1-diagrams

Hom and End of chosen cyclic-isogeny diagrams over complete local and Artinian bases; positive-degree fibres and stabilizers.

**Status:** extension-gap. **Proposed owner:** AbelianSchemesAndArithmeticModuli A6: cyclic-isogeny diagram extension.

**Supplier boundary:** `AbelianSchemesAndArithmeticModuli:A6`.

**Consumers:** [Half Hom count](#target-gz-7-classical-half-hom-count), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Prime-to-p Hom decomposition](#target-gz-7-classical-prime-to-p-hom-count), [CM Hom quaternion realization](#target-gz-7-classical-hom-quaternion-realization).

### R1-integral-JL

Primitive integral Jacquet–Langlands lattices, rather than rational transfer alone.

**Status:** extension-gap. **Proposed owner:** GL2AutomorphicRepresentationsAndTransfer, Part II: integral transfer lattices.

**Supplier boundary:** `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Consumers:** [Strict GL₂ realization and transfer](#target-gz-3-strict-gl2-realization), [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction).

### R1-cotangent

Saturated pullback of the Néron cotangent lattice along the p-optimal connected-kernel quotient in JSW Proposition 5.1.7.

**Status:** extension-gap. **Proposed owner:** NeronModelsAndSemistableAbelianVarieties R11.1: p-optimal quotient extension.

**Supplier boundary:** `NeronModelsAndSemistableAbelianVarieties:R11.1`.

**Consumers:** [Manin constant](#target-gz-3-manin-constant), [Manin isogeny and twist transfer](#target-gz-3-manin-isogeny-twist-transfer), [The formula for a p-optimal quotient](#target-gz-9-p-optimal-quotient-formula).

### R1-bad-differentials

Integral modular-parametrization differentials at bad primes, with Manin factors retained.

**Status:** extension-gap. **Proposed owner:** ModularCurvesPartII R14.6: bad-prime differential extension.

**Supplier boundary:** `ModularCurvesPartII:R14.6`.

**Consumers:** [Integral Manin constant and p-unit range](#target-gz-3-manin-integrality-and-p-unit), [Manin constant and modular degree](#target-gz-3-manin-degree-divisibility).

### R1-ordinary-intersections

Ordinary CM multiplicities and quasi-canonical lifting intersections over W (two historical contracts). GZ.7 already states the weighted multiplicity formulas; their deformation input is separate.

**Status:** extension-gap. **Proposed owner:** ComplexMultiplicationAndExplicitReciprocity, Part II: local CM deformation; GZ.7 owns its height multiplicities.

**Supplier boundary:** `HeegnerPointEulerSystems:HE.2`.

**Consumers:** [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Degree-one CM intersection count](#target-gz-7-classical-degree-one-intersection), [Supersingular Eichler realization](#target-gz-7-classical-supersingular-eichler-order), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [CM Hom intersection count](#target-gz-7-classical-hom-intersection-count), [Half Hom count](#target-gz-7-classical-half-hom-count), [Diagram isomorphism intersection count](#target-gz-7-classical-isomorphism-intersection-count), [New automorphism length](#target-gz-7-classical-new-automorphism-length).

### R1-extra-units

The existing CM cyclic-isogeny construction extended to discriminants −3 and −4, including automorphism weights.

**Status:** extension-gap. **Proposed owner:** HeegnerPointEulerSystems HE.1/cm-cyclic-isogeny-pair: extra-unit extension.

**Supplier boundary:** `HeegnerPointEulerSystems:HE.1`.

**Consumers:** [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class), [CM Hecke disjointness criterion](#target-gz-6-classical-disjointness), [CM action convention comparison](#target-gz-0-classical-cm-action-conventions), [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [Archimedean CM height sum](#target-gz-2-classical-archimedean-height-sum), [CM Eisenstein sum](#target-gz-7-classical-cm-eisenstein-sum), [Finite CM intersection height](#target-gz-7-classical-finite-intersection-height), [Definite period specialization](#target-gz-5-classical-definite-period-announcement), [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention), [Quadratic-twist real-period comparison](#target-gz-0-classical-twist-real-period), [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [The main identity on X₀(N): heights as Fourier coefficients](#target-gz-8-coefficient-identity).

### R1-kernel-continuation

Mixed incoherent-kernel continuation, parameter-uniform derivative bounds and legitimate derivative/integral exchange.

**Status:** extension-gap. **Proposed owner:** AutomorphicSpectralTheory, Part II: regularized theta-kernel analysis.

**Supplier boundary:** `AutomorphicSpectralTheory:AS.3`.

**Consumers:** [Incoherent central derivative](#target-gz-6-incoherent-central-derivative).

### R1-projections

Four historical contracts: compact-surface Green inversion and holomorphic/Petersson projection including logarithmic growth. GZ.6 states its explicit Fourier formulas, but their analytic existence and growth input is not AS.4.

**Status:** extension-gap. **Proposed owner:** AutomorphicSpectralTheory, Part II: Green inversion and regularized weight-two projection.

**Supplier boundary:** `AutomorphicSpectralTheory:AS.4`.

**Consumers:** [Arithmetic theta lifting comparison](#target-gz-6-arithmetic-theta-lifting), [Projected arithmetic kernel identity](#target-gz-6-generating-series-arithmetic-theta-lifting-and-the-kernel-identity), [Arakelov probability form](#target-gz-2-arakelov-probability-form), [Complex admissible metric existence](#target-gz-2-admissible-metric-existence), [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), [Projected derivative decomposition](#target-gz-6-colmez-projected-derivative), [Archimedean holomorphic projection of log δ∞·W^(2)](#target-gz-6-colmez-rev-archimedean-holomorphic-projection-of-log), [Logarithmic weight-two projection](#target-gz-6-classical-holomorphic-projection).

### R1-CM-lifts

Three historical contracts: Gross canonical/quasi-canonical lifts, endomorphism filtrations over W/π^n and quaternionic lifting counts, with ramification and dyadic hypotheses.

**Status:** extension-gap. **Proposed owner:** ComplexMultiplicationAndExplicitReciprocity, Part II: local CM deformation.

**Supplier boundary:** `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Consumers:** [Corrected CM multiplicity at 𝔹-split, E-nonsplit places](#target-gz-7-colmez-rev-corrected-cm-multiplicity-at-split), [Supersingular inert local intersection](#target-gz-7-colmez-local-m-inert), [Wild-inclusive ramified local intersection](#target-gz-7-colmez-local-m-ramified), [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Split CM intersection vanishing](#target-gz-7-classical-split-vanishing), [CM endomorphism congruence order](#target-gz-7-classical-endomorphism-congruence-order), [Inert disjoint intersection formula](#target-gz-7-classical-inert-disjoint-intersection), [Ramified disjoint intersection formula](#target-gz-7-classical-ramified-disjoint-intersection), [New automorphism length](#target-gz-7-classical-new-automorphism-length), [Special j tangent values](#target-gz-7-classical-j-tangent-values), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model), [Supersingular Eichler realization](#target-gz-7-classical-supersingular-eichler-order), [Inert CM Hom lattice](#target-gz-7-classical-inert-hom-lattice).

### R1-ordinary-moments

P4 supplies ordinary infinitesimal and translation trivializations of the Poincaré line. It does not supply the entire Brooks scalar automorphic-line/Serre–Tate moment comparison.

**Status:** partly-repointed. **Proposed owner:** AbelianSchemesAndArithmeticModuliPartII P4: compatibility extension, with GZ.9 owning Brooks moments.

**Supplier boundary:** `HilbertModularVarietiesAndShimuraCurves:R18.2`, `AbelianSchemesAndArithmeticModuliPartII:P4`.

**Consumers:** [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula), [The quaternionic weight-two formula of Brooks and JSW](#target-gz-9-quaternionic-weight-two-formula), [The formula for a p-optimal quotient](#target-gz-9-p-optimal-quotient-formula), [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality).

### R1-genus

Norm-representation genus criterion under Nn+l≡0 mod D, with local characters at every prime dividing D.

**Status:** extension-gap. **Proposed owner:** AnalyticNumberTheory, Part II: quadratic norm/genus congruences.

**Supplier boundary:** `AnalyticNumberTheory:AN.4`.

**Consumers:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [Quadratic-pair representation count](#target-gz-7-classical-pair-count), [Ramified-congruence pair count](#target-gz-7-classical-ramified-congruence-count), [Genus pair count](#target-gz-7-classical-genus-pair-count), [Genus-character filter](#target-gz-7-classical-genus-character-filter), [Inert-prime height sum](#target-gz-7-classical-inert-height-sum), [Inert unit-orbit count](#target-gz-7-classical-inert-unit-count), [Ramified-prime height sum](#target-gz-7-classical-ramified-height-sum), [Genus-character factorization](#target-gz-0-classical-genus-character-factorization), [Ramified theta reindexing](#target-gz-6-classical-ramified-theta-reindexing), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), [Genus-sign reversal](#target-gz-6-classical-genus-sign-reversal), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Different ideal reindexing](#target-gz-6-classical-different-reindexing), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity), [Logarithmic prime decomposition](#target-gz-6-classical-logarithmic-prime-decomposition), [Central-value genus-sum filter](#target-gz-5-classical-genus-sum-filter).

### R1-toric-Hom

The χ-equivariant toric Hom definition is already owned by GZ.4/toric-hom-space. SR.2 supplies only general smooth representation foundations.

**Status:** repointed. **Proposed owner:** GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space.

**Supplier boundary:** `SmoothRepresentationsOfLocalGroups:SR.2`.

**Consumers:** [Local toric functional space](#target-gz-4-toric-hom-space).

### R1-semistable-BK

The semistable abelian comparison log_BK∘κ=log_A, with the Kummer and filtered-module normalizations.

**Status:** extension-gap. **Proposed owner:** PadicHodgeRegulators, Part II: semistable abelian logarithms.

**Supplier boundary:** `PadicHodgeRegulators:L1`.

**Consumers:** [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula).

### R1-semistable-integration

Semistable weight-two Abel–Jacobi integration; good-reduction Coleman integration does not cover p∥N.

**Status:** extension-gap. **Proposed owner:** ColemanIntegration, Part II: semistable Abel–Jacobi integration.

**Supplier boundary:** `ColemanIntegration:L1`.

**Consumers:** [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula).

### R1-subgroups

Abelian p-adic analytic subgroup theorem and BSW eigencomponent/Serre-tensor consequences.

**Status:** extension-gap. **Proposed owner:** DiophantineApproximationAndTranscendence, Part II: abelian p-adic subgroups.

**Supplier boundary:** `DiophantineApproximationAndTranscendence:DT.3`.

**Consumers:** [Heegner points have nonzero logarithm in every eigencomponent](#target-gz-9-eigenlogarithm-nonvanishing).

### R2-Arakelov

Hermitian rational line bundles, Green arithmetic divisors, arithmetic degree and metric-compatible product formula. R35.1 has no target decomposition; its stage label is not an export.

**Status:** source-decomposition-gap. **Proposed owner:** ArakelovGeometryAndAbelianHeights R35.1: foundation decomposition required.

**Supplier boundary:** `ArakelovGeometryAndAbelianHeights:R35.1`.

**Consumers:** [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing).

### R2-rational-structures

Harris–Kudla algebraicity, Prasanna Theorem 2.4 integrality, and Theorem 3.2 explicit quaternionic Waldspurger formula. The new Petersson factorization proves none of these rational-structure comparisons.

**Status:** source-and-owner-gap. **Proposed owner:** GrossZagierAndArithmeticHeights GZ.5/GZ.9: precise source and rational-structure extension required.

**Supplier boundary:** `GrossZagierAndArithmeticHeights:GZ.5`.

**Consumers:** [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula).

### R2-Hermitian

Rosati/conjugate-dual Hermitian positivity for arbitrary χ. The accepted bilinear character pairing is insufficient for an unconditional converse.

**Status:** extension-gap. **Proposed owner:** GrossZagierAndArithmeticHeights GZ.1: character pairing extension.

**Supplier boundary:** [Character-component height pairing](#target-gz-1-character-height-pairing).

**Consumers:** [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion).

### R1-partial-1

Weil indices, norm shells, GL₂/K identification and general adjoint-value specialization.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Consumers:** [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), [Local Whittaker series for incoherent sections](#target-gz-6-colmez-rev-local-whittaker-series-for-incoherent), [Classical Rankin normalization](#target-gz-0-classical-rankin-normalization), [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [Rankin absolute convergence](#target-gz-6-classical-absolute-convergence), [Half-weight Waldspurger value](#target-gz-5-half-weight-waldspurger-value), [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number), [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character](#target-gz-8-rational-shimura-curve-heegner-formula), [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Corollaries on derivatives: positivity and Galois invariance](#target-gz-8-derivative-corollaries).

### R1-partial-2

Jacobian 2Θ specialization and tangent local-symbol comparison.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `HeightsRationalPointsAndObstructions:RP.0`.

**Consumers:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), [The canonical height on E(K) ⊗ ℚ](#target-gz-0-canonical-height-rational), [Hecke height-series cuspidality](#target-gz-6-classical-height-series-cuspidality), [Relative-field height comparison](#target-gz-0-classical-relative-field-heights), [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Tangent product formula](#target-gz-7-classical-tangent-product-formula), [Local intersection height comparison](#target-gz-2-classical-local-intersection-height).

### R1-partial-3

Theta line versus rigidified Poincaré line, with the actual polarization convention.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `AbelianSchemesAndArithmeticModuli:A2`.

**Consumers:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Faltings–Hriljac comparison](#target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions).

### R1-partial-4

Sibling-stage modular-curve material; the perfect Hecke pairing is specifically R12.5, and generalized elliptic curves specifically R13.1.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.5`, `ModularCurvesPartII:R13.4a`.

**Consumers:** [Special correspondence cycle](#target-gz-6-special-correspondence-cycle), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Manin constant](#target-gz-3-manin-constant), [Modular cusp and boundary correction](#target-gz-7-boundary-cusp-correction), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height), [Marked Green height characterization](#target-gz-7-classical-height-green-characterization), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [Trace coset classification](#target-gz-6-classical-trace-coset-classification).

### R1-partial-5

The precise GL₂ constituent/rational-structure comparisons at the chosen levels.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Consumers:** [Strict GL₂ realization and transfer](#target-gz-3-strict-gl2-realization), [Local toric functional space](#target-gz-4-toric-hom-space), [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction).

### R1-partial-6

Regularized small-dimensional Siegel–Weil and the unread Baruch–Mao comparison. The convergent range m−r>n+1 cannot handle the isotropic binary/ternary applications.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `MetaplecticAutomorphicForms:MP.6`, `MetaplecticAutomorphicForms:MP.7`.

**Consumers:** [Hyperbolic norm parameter](#target-gz-7-classical-hyperbolic-norm-parameter), [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [Inert norm-ideal map](#target-gz-7-classical-inert-norm-ideal-map), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model), [Half-weight Waldspurger value](#target-gz-5-half-weight-waldspurger-value).

### R1-partial-7

Graph Green kernel and model-measure comparison, beyond the general skeleton.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `TropicalAndBerkovichGeometry:TB.2`, `TropicalAndBerkovichGeometry:TB.3`, `TropicalAndBerkovichGeometry:TB.6`.

### R1-partial-8

Measure compatibility and nonholomorphic/logarithmic growth estimates.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**Consumers:** [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison), [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel).

### R1-partial-9

Character avatars, CM periods and the square-root measure: stage specifications exist, but their exact target packets remain missing.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `AutomorphicPadicLFunctions:L0`, `AutomorphicPadicLFunctions:L3`, `AutomorphicPadicLFunctions:L3h`.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), [Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions](#target-gz-9-imprimitive-function-dictionary), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula).

### R1-partial-10

Complete-DVR coefficients with infinite residue field Ô^ur, Amice surjectivity and Weierstrass factorization; L4’s finite-residue-field hypothesis does not cover Ô^ur.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L2`, `PadicMeasuresIwasawaAlgebras:L4`.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality).

### R1-partial-11

Nilpotent-thickening compatibility for the rigid/formal comparison.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Consumers:** [Good-place arithmetic identity](#target-gz-7-good-local-arithmetic-identity).

### R1-partial-12

CM fixed sections: the existing packet itself records their absent owner.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `HilbertModularVarietiesAndShimuraCurves:R18.5`.

**Consumers:** [Finite CM orbit average](#target-gz-6-colmez-torus-average), [Special test function and integral j](#target-gz-7-colmez-test-function), [Vertical correction vanishes at B-split places](#target-gz-7-colmez-vertical-split-zero), [Geometric realization of extended self-intersection](#target-gz-7-colmez-modified-projection), [Hodge-class terms vanish and the height series splits into horizontal and vertical parts](#target-gz-6-colmez-rev-hodge-class-terms-vanish-and), [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Superspecial multiplicity by uniformization](#target-gz-7-colmez-superspecial-m), [Vertical correction is nonsingular pseudo-theta](#target-gz-7-colmez-vertical-pseudo), [Extended local diagonal vanishes at small away-v level](#target-gz-7-colmez-small-level-diagonal).

### R1-partial-13

The precise Ramanujan estimate needed by the kernel continuation.

**Status:** partial-input. **Proposed owner:** Named supplier extension unless an exact existing export is identified; no scope move is applied here..

**Supplier boundary:** `AutomorphicGaloisRepresentations:R19.1`.

**Consumers:** [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point).

The partial inventory also includes general TauCetiRoadmap imports: they supply their stated general objects, and each GZ specialization remains a target. No new scope move or stage edge is applied by this document.

<a id="layer-0"></a>

## Layer 0: Normalization and change-of-convention interfaces

**Atlas planets:** Canonical height on E(K) ⊗ ℚ.

**Examples.**

- For w=6 and w=4, u=w/2 is 3 and 2. Using w in place of u changes a u² denominator by four.
- A rank-two full-polarization regulator is four times its half-polarization regulator; compatible quadratic base change adds a separate factor four.

<a id="target-gz-0-canonical-height-rational"></a>

### 0.1 The canonical height on E(K) ⊗ ℚ

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational` (construction).

The canonical height extends uniquely to a quadratic form ĥ_ℚ on the ℚ-vector space E(K) ⊗_ℤ ℚ with ĥ_ℚ(P ⊗ q) = q²·ĥ(P); torsion goes to zero. The same holds for ĥ_x and the two pairings. Averages of points, such as a normalised average of a Galois orbit, live here.

**Hypotheses.**

- W elliptic.

**Outline.**

1. ĥ is a ℤ-quadratic map W.Point → ℝ (canonicalHeightQuadratic) and ℝ is a ℚ-vector space; a ℤ-quadratic map into a ℚ-vector space extends uniquely along M → M ⊗ ℚ, because M ⊗ ℚ is the localisation of M at the nonzero integers and ĥ(nP) = n²ĥ(P) forces the value on P ⊗ (1/n).
2. Torsion maps to zero in M ⊗ ℚ, consistently with ĥ vanishing on torsion.

**Dependencies:** `tauceti:WeierstrassCurve.Affine.canonicalHeightQuadratic`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, `mathlib:QuadraticMap`, `mathlib:TensorProduct`, `mathlib:QuadraticMap.map_smul`, `HeightsRationalPointsAndObstructions:RP.0`.

**Uses.**

- [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average): Heights of averages of Galois orbits are computed in E(K) ⊗ ℚ.
- `GrossZagierAndArithmeticHeights:GZ.8`: Gross–Zagier formulas are identities of pairings on A(K)_ℚ ⊗ A∨(K)_ℚ.
- `HeegnerPointEulerSystems:HE.1`: Normalised Heegner points with denominators u are points of E(K) ⊗ ℚ.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.Affine.canonicalHeightRat` | constructor | canonicalHeightRat W : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ. |
| `WeierstrassCurve.Affine.canonicalHeightRat_tmul` | simp | canonicalHeightRat W (P ⊗ₜ q) = q^2 * P.canonicalHeight. |
| `WeierstrassCurve.Affine.canonicalHeightRat_unique` | universal-property | It is the unique ℚ-quadratic map agreeing with canonicalHeight on P ⊗ₜ 1. |
| `WeierstrassCurve.Affine.canonicalHeightRat_nonneg` | other | canonicalHeightRat W x ≥ 0. |

**Checks.**

- `WeierstrassCurve.Affine.canonicalHeightRat_inv_nat` (computation): canonicalHeightRat W (P ⊗ₜ (1/m : ℚ)) = P.canonicalHeight / m^2.
- `WeierstrassCurve.Affine.canonicalHeightRat_torsion` (degenerate): For torsion P, canonicalHeightRat W (P ⊗ₜ 1) = 0.
- `WeierstrassCurve.Affine.canonicalHeightRat_one` (compatibility): canonicalHeightRat W (P ⊗ₜ 1) = P.canonicalHeight.
- `WeierstrassCurve.Affine.canonicalHeightRat_not_linear` (non-example): Under Northcott finiteness, canonicalHeightRat W (P ⊗ₜ 2) ≠ 2 * P.canonicalHeight for infinite-order P: the positive height is quadratic.

**Acceptance.**

- ĥ_ℚ(P ⊗ (1/m)) = ĥ(P)/m².

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1, after Theorem 1.1, p. 2 (arXiv v2). The Heegner point over K is a trace, not an average.

<a id="target-gz-0-trace-versus-average"></a>

### 0.2 Trace versus normalised average of a Galois orbit

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average` (lemma).

Let H/K be a finite Galois extension of degree h and P ∈ E(H). The trace Tr(P) = Σ_{σ ∈ Gal(H/K)} σP lies in E(K), and the normalised average Av(P) = (1/h)·Tr(P) lies in E(K) ⊗ ℚ. Then ĥ_ℚ(Av(P)) = ĥ(Tr P)/h², and the same factor relates any pairing of averages to the pairing of traces. A formula written with averages and one written with traces differ by h² in every height.

**Hypotheses.**

- H/K Galois of degree h; the heights over H and over K are compared by the same normalisation.

**Outline.**

1. Av(P) = Tr(P) ⊗ (1/h), and GZ.0/canonical-height-rational gives the factor (1/h)².

**Dependencies:** [The canonical height on E(K) ⊗ ℚ](#target-gz-0-canonical-height-rational), `mathlib:IsGalois`.

**Acceptance.**

- Cai–Shu–Tian take the trace P_K(f) = Tr_{H_K/K} f(P) ∈ E(K); an average-based statement of the same formula carries h_K² in its constant.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1, after Theorem 1.1, p. 2 (arXiv v2). The Heegner point over K is a trace, not an average.

<a id="target-gz-0-unitary-and-motivic-centres"></a>

### 0.3 The motivic centre s = 1 and the unitary centre s = 1/2

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/unitary-and-motivic-centres` (lemma).

Let L(E, s) be the motivic L-function of an elliptic curve over ℚ of conductor N (centre s = 1), L(s, π_E) := L(E, s + 1/2) its unitary normalisation (centre s = 1/2), and Λ(E, s) := N^{s/2}·Γ_ℂ(s)·L(E, s) the completed function with Mathlib's Γ_ℂ(s) = 2(2π)^{−s}Γ(s). If L(E, ·) is differentiable at 1 and L(E, 1) = 0, then (d/ds)L(s, π_E) at s = 1/2 equals L′(E, 1), and Λ′(E, 1) = N^{1/2}·π^{−1}·L′(E, 1). With the other common convention Λ = N^{s/2}(2π)^{−s}Γ(s)L, the factor is N^{1/2}(2π)^{−1}.

**Hypotheses.**

- L(E, ·) differentiable at 1 with L(E, 1) = 0 (the case of odd analytic rank).

**Outline.**

1. The shift s ↦ s + 1/2 has derivative 1.
2. Product rule (deriv_mul) at a zero of L: (G·L)′(1) = G(1)·L′(1) + G′(1)·L(1) = G(1)·L′(1).
3. G(1) = N^{1/2}·Γ_ℂ(1) = N^{1/2}·2(2π)^{−1}Γ(1) = N^{1/2}/π (Complex.Gammaℂ_def, Complex.Gamma_one).

**Dependencies:** `mathlib:Complex.Gammaℂ`, `mathlib:Complex.Gammaℂ_def`, `mathlib:Complex.Gamma_one`, `mathlib:deriv_mul`, `mathlib:HasDerivAt.mul`.

**Acceptance.**

- The factor 2 between Γ_ℂ and (2π)^{−s}Γ(s) is a convention and must be written, not absorbed.
- Cai–Shu–Tian write L_v(s, A, M) = L(s − 1/2, π_v) at finite places, and the complete L(s, π_A) includes the archimedean factors.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, p. 4 (arXiv v2). The motivic L-function is the automorphic one shifted by 1/2: centre s = 1 against s = 1/2.

<a id="target-gz-0-heegner-unit-index"></a>

### 0.4 The unit index u

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index` (definition).

For an imaginary quadratic field K, u(K) = [O_K^× : ℤ^×] = #μ(K)/2, the number that appears squared in the Gross–Zagier constant. In Mathlib terms, u(K) = NumberField.Units.torsionOrder K / 2. So u(K) = 1 except u(ℚ(√−1)) = 2 and u(ℚ(√−3)) = 3.

**Hypotheses.**

- K imaginary quadratic.

**Outline.**

1. An imaginary quadratic field has one complex infinite place. The unit product formula forces every integer unit to have absolute value 1; mem_torsion therefore identifies its entire unit group with the finite cyclic torsion subgroup.
2. Choose a generator of order w=torsionOrder K. Cyclotomic irreducibility and lcm_totient_le_finrank with the second root 1 imply φ(w)≤2. Evenness of w leaves w=2,4,6.
3. A primitive fourth root generates ℚ(√−1); a primitive sixth root generates ℚ(√−3). Conversely their explicit roots realize orders 4 and 6. Every other imaginary quadratic field has w=2.
4. The subgroup {±1} has order 2, so its index is w/2. Apply the classification to the Gaussian, Eisenstein and discriminant −7 tests.

**Dependencies:** `mathlib:NumberField.Units.torsionOrder`, `mathlib:NumberField.Units.sum_mult_mul_log`, `mathlib:NumberField.Units.mem_torsion`, `mathlib:NumberField.Units.even_torsionOrder`, `mathlib:IsPrimitiveRoot.lcm_totient_le_finrank`, `mathlib:Polynomial.cyclotomic.irreducible_rat`.

**Uses.**

- `GrossZagierAndArithmeticHeights:GZ.8`: The explicit Gross–Zagier constant has u² in the denominator.
- `HeegnerPointEulerSystems:HE.1`: Heegner points over K are normalised by 1/u.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.unitIndex` | constructor | unitIndex K := NumberField.Units.torsionOrder K / 2 for K imaginary quadratic. |
| `TauCeti.GrossZagier.two_mul_unitIndex` | characterisation | 2 * unitIndex K = torsionOrder K. |
| `TauCeti.GrossZagier.unitIndex_eq_one_iff` | characterisation | unitIndex K = 1 ↔ K ≠ ℚ(√−1), ℚ(√−3). |

**Checks.**

- `TauCeti.GrossZagier.unitIndex_gaussian` (computation): unitIndex ℚ(√−1) = 2.
- `TauCeti.GrossZagier.unitIndex_eisenstein` (computation): unitIndex ℚ(√−3) = 3.
- `TauCeti.GrossZagier.unitIndex_sqrt_neg_seven` (degenerate): unitIndex ℚ(√−7) = 1.
- `TauCeti.GrossZagier.unitIndex_ne_torsionOrder` (non-example): For every imaginary quadratic K, unitIndex K≠torsionOrder K; compare Conrad’s inconsistent p.69 and p.119 uses explicitly.

**Acceptance.**

- Conrad's §1 defines u_x as #μ(K) itself, but his §9 uses u_x ∈ {1, 2, 3}; the Gross–Zagier constant needs #μ(K)/2 (GrossZagierAndArithmeticHeights/E1).

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1, Theorem 1.1, p. 2 (arXiv v2). u = #μ(K)/2 for c = 1; its square appears in the Gross–Zagier constant.
- [conrad-2004](#source-conrad-2004), §1, 'Some conventions', p. 69; corrected in GrossZagierAndArithmeticHeights/E1. Read with the correction E1: u_x is half that cardinality, as on p. 119.
- [gross-zagier-1986](#source-gross-zagier-1986), Published Invent. Math. 84 (1986), Chapter I, §6, p.230. The standing notation identifies 2u with the number of roots of unity.

<a id="target-gz-0-artin-map-convention"></a>

### 0.5 The Artin-map convention and the Galois action on Heegner points

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention` (comparison).

The Gross–Zagier and Conrad convention sends uniformisers to arithmetic Frobenius elements. The opposite (geometric) convention is its composite with inversion on Gal(H/K). Under the arithmetic convention [a] ∈ Cl_K acts on the Heegner point ([b], n) by ([b][a]⁻¹, n). Every formula indexed by class-group characters χ changes χ to χ⁻¹ when the convention changes; a Gross–Zagier formula pairs χ with χ⁻¹ and is therefore stated together with its convention.

**Hypotheses.**

- K imaginary quadratic with Hilbert class field H.

**Outline.**

1. The two reciprocity maps Cl_K → Gal(H/K) differ by inversion, by definition.
2. The action on Heegner points is Conrad's statement, p. 69, which he derives from the analytic description C/b → C/n⁻¹b.

**Dependencies:** `mathlib:IsGalois`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- A reciprocity law stated without its convention is not accepted.

**Sources.**

- [conrad-2004](#source-conrad-2004), §1, 'Some conventions', p. 69. The Artin-map convention of Gross–Zagier, which Conrad follows.
- [conrad-2004](#source-conrad-2004), §1, 'Some conventions', p. 69. Changing the Artin convention inverts the Galois action on Heegner points.

<a id="target-gz-0-real-period-components"></a>

### 0.6 Full real period, identity-component period and c∞

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/real-period-components` (comparison).

For E/ℚ with a minimal Weierstrass equation and Néron differential ω, let Ω⁰ be the least positive real period (∫ of |ω| over the identity component E(ℝ)⁰) and c∞ = #π₀(E(ℝ)), which is 2 if Δ > 0 and 1 if Δ < 0. The BSD real period is Ω = c∞·Ω⁰ = ∫_{E(ℝ)}|ω|, and it is what EllipticCurves Layer 7's integral 2∫_{D_W > 0} dx/√D_W computes. A formula stated with Ω⁰ must carry c∞ separately, and a formula stated with Ω must not multiply by c∞ again.

**Hypotheses.**

- E/ℚ; minimal model; Δ ≠ 0.

**Outline.**

1. E(ℝ) has two components exactly when the cubic 4x³ + b₂x² + 2b₄x + b₆ has three real roots, i.e. Δ > 0.
2. The integral over E(ℝ) is the sum over its components, which have equal ∫|ω| because translation by a point of the non-identity component preserves |ω|.

**Dependencies:** `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.b₂`, `mathlib:Real.sqrt`, `mathlib:MeasureTheory.lintegral`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Acceptance.**

- 37.a1 has Δ = 37 > 0, so c∞ = 2, and the LMFDB real period 5.9869172924… is the full period Ω = 2Ω⁰.

**Sources.**

- [lmfdb-2026](#source-lmfdb-2026), 37.a1 curve page, Mordell–Weil generators and BSD invariants/computation conventions (accessed2026-10-10). The displayed generator height equals its rank-one regulator, 0.05111140823996884… . Its full real-period computation includes the positive-discriminant factor2. General height-limit conventions are supported separately by Müller–Stoll and the pinned code; the knowls were not accessible in this review.

<a id="target-gz-0-root-number-and-measure-normalisation-corrections"></a>

### 0.7 Base-change signs and measure comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections` (comparison).

For K/F CM quadratic with character η and ωπχ|A_F×=1, let εBC,v be the root number of L(s,πK,v⊗χv). The Rankin-over-F root number is ηv(−1)εBC,v. Thus the toric distinction sign is εBC,v=χv(−1)ε(Bv). Fix the torus quotient measure of total volume 2L(1,η), its probability normalization by division by that volume, and the quaternionic Petersson Tamagawa measure of volume 2. Products of two probability toric periods are (2L(1,η))⁻² times products computed with the torus quotient measure.

**Hypotheses.**

- F is totally real; K/F is CM quadratic; fixed additive characters and self-dual measures
- The product torus measure is the specified quotient measure, not an asserted Tamagawa measure

**Outline.**

1. Compare the two definitions of local epsilon factors using erratum item 5.
2. Divide each period by the quotient volume; the two period factors account for 4L(1,η)².
3. Keep the independent Petersson volume in every local-to-global pairing.

**Dependencies:** `AutomorphicLFunctionsAndLocalFactors:AL.3`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

**Acceptance.**

- A place with ηv(−1)=−1 changes the Rankin sign but not the corrected base-change criterion.
- Probability and quotient period products differ by exactly 4L(1,η)².

**Sources.**

- [yzz-gross-zagier-erratum](#source-yzz-gross-zagier-erratum), items 4, 5, 10, 13, 15. The current author erratum fixes both signs and the quotient measure.

<a id="target-gz-0-identity-rescaling"></a>

### 0.8 Rescaling height and period identities

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/identity-rescaling` (theorem).

For a bilinear identity H(P,Q)=C·L·α(f₁,f₂), replacing H by aH, torus measure dt by bdt, invariant local forms by cv( , )v with ∏cv=c, and the global form compatibly, multiplies the corresponding sides by their actual linear factors: heights by a, each toric period by b, their product by b², local αv by bv cv, and a rank-r regulator by a^r for a>0. Rescaling a differential by d multiplies its absolute period by |d| and its Petersson squared norm by |d|². Coefficient embeddings commute with these algebraic rescalings when they preserve the chosen rational structures.

**Hypotheses.**

- All measures positive; all nonzero differential/pairing scalars; finitely many nonunit local rescalings
- The same periods and pairings are used on both sides; embeddings fixed

**Outline.**

1. Use linearity of integration and each pairing.
2. Apply Matrix.det_smul to the Gram matrix, retaining |a|^r if a is not assumed positive.
3. Separate period rescaling from the quadratic height rescaling.

**Dependencies:** [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), `mathlib:Matrix.det_smul`, [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison).

**Acceptance.**

- Scaling a torus measure by 3 multiplies a period product by 9.
- Scaling a positive pairing by 2 multiplies a rank-two regulator by 4.
- The zero-period case still obeys the cross-multiplied identity.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1, normalizations; §2, local toric integrals. The constants are tested against the explicit toric and differential conventions.

<a id="target-gz-0-classical-rankin-normalization"></a>

### 0.9 Classical Rankin normalization

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization` (comparison).

(5.4) For f a Hecke eigenform in the new space of weight 2 on Γ₀(N), normalized by a₁ = 1, and χ a complex character of Cl_K: L(f, χ, s) = Σ_{𝒜 ∈ Cl_K} χ(𝒜) L_𝒜(f, s).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Sum the partial series against χ.
2. Match the theta lift and Rankin local zeta integrals, including the removed level factors; shift the arithmetic centre k to the unitary centre 1/2.

**Dependencies:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), `AutomorphicLFunctionsAndLocalFactors:AL.3`, [The motivic centre s = 1 and the unitary centre s = 1/2](#target-gz-0-unitary-and-motivic-centres).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §5, (5.4), p. 229. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-0-classical-relative-field-heights"></a>

### 0.10 Relative-field height comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights` (theorem).

(6.4) ⟨a, b⟩_H = h ⟨a, b⟩_K = 2h ⟨a, b⟩_ℚ, the global heights on J over H, K and ℚ ([H:K] = h, [K:ℚ] = 2); the constants of (6.2), (6.3) differ from those of the announcement [17] because [17] used the height over ℚ.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Apply the compatible-place local-degree comparison to the same canonical height.
2. Sum the local degrees to obtain the field-degree ratio; retain the squared complex norm convention.

**Dependencies:** [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), `HeightsRationalPointsAndObstructions:RP.0`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §6, (6.4), p. 230. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-0-classical-cm-action-conventions"></a>

### 0.11 CM action convention comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions` (theorem).

In the parametrisation of the referenced classical source result 59: (a) complex conjugation acts by (𝒜, 𝔫) ↦ (𝒜̄, 𝔫̄) = (𝒜⁻¹, N𝔫⁻¹); (b) Gal(H/K) ≅ Cl_K acts on 𝒜 and trivially on 𝔫: with σ = σ_𝒜 the Artin image of 𝒜 (arithmetic Frobenius convention), σ_𝒜 : (𝒜₁, 𝔫) ↦ (𝒜₁𝒜⁻¹, 𝔫) (p. 243); (c) for d ‖ N, w_d maps (𝒜, 𝔫) to (𝒜[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄), 𝔡 = (d, 𝔫) (i.e. the opposite prime is chosen above every p_i | d); in particular w_N : (𝒜, 𝔫) ↦ (𝒜[𝔫]⁻¹, 𝔫̄) = (𝒜[𝔫̄], 𝔫̄) [corrected; printed 𝒜[𝔡] on p. 235 and (𝒜[𝔫], 𝔫̄) on p. 236, see PAPER-GROSS-ZAGIER-86/E2; p. 243 prints the correct rule]; (d) Gal(H/K) × W (W ≅ (ℤ/2ℤ)^s) acts freely and transitively on the Heegner points of discriminant D.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Compute the source Artin action on the ideal-lattice description of CM points.
2. Compare inverse-character and ideal-inverse conventions before taking eigencomponents.

**Dependencies:** `HeegnerPointEulerSystems:HE.0`, [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average), `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §1, pp. 235–236 (i), (ii); p. 243. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-0-classical-genus-character-factorization"></a>

### 0.12 Genus-character factorization

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization` (theorem).

Standing data of Chap. IV (p. 267): K imaginary quadratic of discriminant D, ε = ε_D = (D/·), Cl_K its class group; N ≥ 1 prime to D; f ∈ S_{2k}(Γ₀(N)) with Fourier coefficients a(n); L_𝒜(f,s) as in (0.1). For χ: Cl_K → ℂ^× put L_K(f,χ,s) = Σ_{𝒜∈Cl_K} χ(𝒜)L_𝒜(f,s) (0.3). If f is a Hecke eigenform, L(f,s) = ∏_p (1−α_p p^{−s})^{−1}(1−β_p p^{−s})^{−1} with α_p+β_p = a(p), α_pβ_p = p^{2k−1} (p∤N), 0 (p|N), and χ = χ_{D₁·D₂} is a genus character, then the convolution of L(f,s) with L_K(s,χ) equals L^{(N)}(2s−2k+1, ε)^{−1}·L(f,ε_{D₁},s)·L(f,ε_{D₂},s), where L(f,ε_{D_i},s) = Σ ε_{D_i}(n)a(n)n^{−s}; hence (0.4) L_K(f, χ_{D₁·D₂}, s) = L(f,ε_{D₁},s)·L(f,ε_{D₂},s). (The printed text writes L^{(N)}(2s+2k−1, ε) here; see the source issue.)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Import the quadratic genus-character factorization on ideal classes.
2. Apply class-character orthogonality to factor the genus L-series into its two quadratic Dirichlet factors.

**Dependencies:** `AnalyticNumberTheory:AN.4`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, introduction, (0.3)–(0.4), p. 268. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-0-classical-twist-real-period"></a>

### 0.13 Quadratic-twist real-period comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/classical-twist-real-period` (theorem).

Setting of Chap. V §2: f ∈ S₂(Γ₀(N)) a newform with rational integer coefficients, E/ℚ an elliptic curve with L(E, s) = L(f, s), π: X₀(N) → E a covering over ℚ with π(∞) = 0; K = ℚ(√D) as in §1 (D odd fundamental, every p | N split in K), u_K = #O_K^×/2. With Ω⁰ the fundamental period over E(ℝ)⁰ and (Ω′)⁰ the analogous period of the transported ω′ on E′: ‖ω‖²/|D|^{1/2} = [E(ℝ) : E(ℝ)⁰]·Ω⁰·(Ω′)⁰. These are identity-component periods; Ω in real-period-components denotes the full real period. The ω′ appearing in this formula is the transported differential ω/√D for the chosen complex branch of √D, not automatically a minimal Néron differential of E^D; changing to the minimal differential contributes its explicit rational scalar.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Transport the chosen invariant differential across the quadratic-twist complex isomorphism.
2. The invariant and anti-invariant cycles exchange; compare the period of the transported differential ω/√D. A minimal Néron differential may add a separate rational factor.

**Dependencies:** [Relative-field height comparison](#target-gz-0-classical-relative-field-heights), [Modular period-degree comparison](#target-gz-3-classical-modular-period-degree), [Manin constant](#target-gz-3-manin-constant), `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §2, p. 312. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-0-pinned-height-normalization-comparison"></a>

### 0.14 Pinned and current elliptic height conventions

**Target:** `GrossZagierAndArithmeticHeights:GZ.0/pinned-height-normalization-comparison` (comparison).

At the blueprint pin f790474, write h_O(P)=Point.canonicalHeight P and B_O(P,Q)=neronTatePairing W P Q. The code defines h_O as lim h_x(2ⁿP)/(2·4ⁿ), and B_O as half its polarization. Set h_x=2h_O, B_x=2B_O and Reg_x=2^r·regulator W as mathematical notation, not new library definitions. Then B_x(P,Q)=h_O(P+Q)−h_O(P)−h_O(Q), B_x(P,P)=h_x(P), and its rank-r Gram determinant has the stated scaling. The YZZ Poincaré height pulled back through the principal polarization is B_x. Current Tau Ceti a91d3aaf instead defines canonicalHeight by lim h_x(2ⁿP)/4ⁿ, and its half-polarized neronTatePairing and regulator already give B_x and Reg_x. Therefore all factors of two in this blueprint refer to f790474 and must disappear when those current names are used. For number fields the library height is relative: divide by [K:ℚ] for absolute height; under a compatible degree-d field extension the relative pairing scales by d and its rank-r Gram determinant by d^r.

**Hypotheses.**

- W is elliptic over a field with Height.AdmissibleAbsValues and a decidable equality for its point group.
- For a regulator, the torsion quotient is a finite free ℤ-module and the same basis and compatible local absolute values are used.
- Zero height implies torsion only under Northcott finiteness for the canonical height.

**Outline.**

1. Read both height definitions and their half-polarization formulas; use the attained pinned limit, rather than a bare limit operator.
2. Apply neronTatePairing_self and Matrix.det_smul to obtain the factors 2 and 2^r. No new canonical-height, pairing or regulator alias is needed.
3. Import compatible-place height transport from RP.0 and use NumberField.totalWeight_eq_finrank for relative/absolute scaling.

**Dependencies:** `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`, `tauceti:WeierstrassCurve.Affine.neronTatePairing`, `tauceti:WeierstrassCurve.Affine.neronTatePairing_apply`, `tauceti:WeierstrassCurve.Affine.neronTatePairing_self`, `tauceti:WeierstrassCurve.Affine.regulator`, `tauceti:WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`, `mathlib:Matrix.det_smul`, `mathlib:NumberField.totalWeight_eq_finrank`, `HeightsRationalPointsAndObstructions:RP.0`.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.pinnedHeight_pairing` | compatibility | At f790474 the full polar form equals 2·neronTatePairing. |
| `TauCeti.GrossZagier.pinnedHeight_regulator` | compatibility | On a rank-r basis the full-polarization Gram determinant is 2^r times regulator. |
| `TauCeti.GrossZagier.relativeHeight_baseChange` | functoriality | For compatible places and degree d, relative heights scale by d; absolute heights do not change. |

**Checks.**

- `pinnedHeight_zero` (degenerate): The zero point has both heights zero; in rank zero both regulators equal 1.
- `pinnedHeight_nonzero` (non-example): For an infinite-order point under Northcott finiteness, h_x(P)=2h_O(P) differs from h_O(P); equality of the two conventions fails.
- `pinnedHeight_doubling` (computation): h_x(2P)=4h_x(P), while B_x(P,P)=h_x(P)=2·canonicalHeight P at the blueprint pin.
- `pinnedHeight_rank_two` (computation): For the rational quadratic form q(a,b)=a²+2b², the half-polar Gram determinant is 2 and the full-polar Gram determinant is 8. This detects the exponent r=2.
- `pinnedHeight_relative_degree` (compatibility): A compatible quadratic field extension doubles a nonzero relative height but leaves its absolute height unchanged; a rank-two regulator scales by 4.

**Acceptance.**

- Consumers specify the pin, the divisor, the field normalization and the polarization before using a height or regulator.

**Sources.**

- [muller-stoll-2016](#source-muller-stoll-2016), §3 and Remark 3.1, arXiv:1509.08748v2, pp.3–4. The x-coordinate limit and its comparison with the half-sized divisor-(O) height support the convention dictionary; source reading is inherited from the accepted part.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.1.1, Theorems 7.1.1–7.1.2 and Proposition 7.1.3, pp.217–219. Historical accepted-part locator for the Poincaré/full-polarization comparison, not rechecked in this run. The factor between the pinned and current library pairings is independently checked in their source code; the geometric Poincaré identification remains subject to this source-access gap.

**Coverage:** planned. The following boundaries remain:

- Compatible-place relative/absolute height comparisons and period/Euler/differential carriers; implement the typed adapters.

<a id="layer-1"></a>

## Layer 1: Point heights on abelian varieties and the Poincaré pairing

**Atlas planets:** Poincaré height pairing; Endomorphism-field height.

**Examples.**

- For H/K quadratic, rational descent uses (P+σP)/2. A fixed point descends unchanged, while an anti-invariant rationalized point has zero averaged norm.
- Bilinear χ/χ⁻¹ orthogonality alone does not prove positive Hermitian height on an arbitrary χ-component.

<a id="target-gz-1-neron-tate-height-and-the-poincare-pairing"></a>

### 1.1 Poincaré height pairing

**Target:** `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing` (construction).

For a number field F and an abelian variety A/F with dual A∨, let 𝒫 be the Poincaré bundle rigidified along both zero sections. Define h𝒫(x,y) as its canonical height on A×A∨, normalized relative to F. The biextension laws make h𝒫 bilinear in x and y, zero on torsion, and adjoint under u:A→B: h𝒫_B(ux,y)=h𝒫_A(x,u∨y). For a symmetric ample line bundle L on A and φL(y)=Ty*L⊗L⁻¹, h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y).

**Hypotheses.**

- A is projective, smooth and geometrically connected; dual and rigidified 𝒫 supplied by A2
- Canonical heights use the compatible RP.0 relative-to-F normalization

**Outline.**

1. Import the line-bundle height machine, canonical limit and bounded-error uniqueness from RP.0.
2. Apply the rigidified biextension identities to eliminate the bounded errors in each variable.
3. Pull back 𝒫 under u×1 and 1×u∨; uniqueness proves adjunction.
4. Pull back along 1×φL and use the theorem of the square to obtain the full polarization.

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.0`, [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`, `AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph`.

**Uses.**

- `YZZ Theorem 7.2`: Express a polarized height as a pairing between A and A∨.
- `GZ.8 general height identity`: Pair the χ and χ⁻¹ points without selecting an artificial self-pairing.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `poincareHeight` | constructor | The canonical height of the rigidified Poincaré bundle evaluated at (x,y). |
| `poincareHeight_add_left` | relation | h𝒫(x+x′,y)=h𝒫(x,y)+h𝒫(x′,y). |
| `poincareHeight_add_right` | relation | h𝒫(x,y+y′)=h𝒫(x,y)+h𝒫(x,y′). |
| `poincareHeight_hom_adjoint` | functoriality | h_B(ux,y)=h_A(x,u∨y), including identity and composition. |
| `poincareHeight_polarization` | compatibility | h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y). |

**Checks.**

- `poincareHeight_zero` (degenerate): h𝒫(0,y)=h𝒫(x,0)=0.
- `poincareHeight_elliptic_diagonal` (compatibility): For L=(O), h𝒫(P,φL P)=2·Point.canonicalHeight P under the same field normalization.
- `poincareHeight_integer_adjunction` (characterisation): h𝒫(nx,y)=h𝒫(x,ny)=n h𝒫(x,y) for n∈ℤ.

**Acceptance.**

- Diagonal on a principally polarized elliptic curve is 2ĥ_(O), not ĥ_(O).

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Gives the Poincare pairing and its comparison with the L-pairing through the polarisation. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.1.1, Theorems 7.1.1–7.1.2 and Proposition 7.1.3, pp. 217–219. Full polarization is the Poincaré height pulled back by the translation-defined Mumford map. Dual homomorphisms are adjoint. The coefficient-valued trace and character restrictions in this target are derived algebraic interfaces, with the imported actual biextension and height machine retained.

<a id="target-gz-1-coefficient-valued-height"></a>

### 1.2 Endomorphism-field height pairing

**Target:** `GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height` (construction).

Let A/F be simple of strict GL₂ type with End_F⁰(A)=M a number field, and identify End_F⁰(A∨) with M by duality m↦m∨. For x∈A(F̄)⊗ℚ and y∈A∨(F̄)⊗ℚ define the unique H_M(x,y)∈M⊗ℚℝ satisfying Tr_{M/ℚ}(m·H_M(x,y))=h𝒫(mx,y) for every m∈M. The nondegenerate trace form gives existence and uniqueness. It satisfies H_M(mx,y)=mH_M(x,y)=H_M(x,m∨y), and its trace is h𝒫(x,y).

**Hypotheses.**

- The M-action is F-rational; M is finite separable over ℚ; h𝒫 is adjoint for dual endomorphisms

**Outline.**

1. Represent the ℚ-linear functional m↦h𝒫(mx,y) using the trace-dual basis of M.
2. Use adjunction and trace nondegeneracy to prove M-bilinearity and independence of that basis.

**Dependencies:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `mathlib:TensorProduct`.

**Uses.**

- `YZZ §1.3 and §7.1`: Retain the End⁰(A)-valued pairing in the height identity.
- `GZ.8 coefficient embedding comparison`: Recover scalar formulas by the specified embedding only after forming H_M.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `coefficientHeight` | constructor | The trace-dual coefficient H_M(x,y). |
| `coefficientHeight_trace` | characterisation | Tr(m H_M(x,y))=h𝒫(mx,y) for every m∈M. |
| `coefficientHeight_smul` | relation | H_M(mx,y)=m H_M(x,y)=H_M(x,m∨y). |
| `coefficientHeight_basis_independent` | extensionality | Any two trace-dual bases construct the same coefficient. |
| `coefficientHeight_add` | structure | The coefficient-valued pairing is additive in each variable: H(x+x′,y)=H(x,y)+H(x′,y) and H(x,y+y′)=H(x,y)+H(x,y′). Nondegeneracy of the coefficient-field trace pairing identifies these values uniquely. |

**Checks.**

- `coefficientHeight_rational` (compatibility): For M=ℚ, H_M equals the scalar Poincaré pairing.
- `coefficientHeight_zero` (degenerate): The coefficient is zero if either point is torsion.
- `coefficientHeight_trace_not_coordinate` (non-example): If M is quadratic and H_M=1, its trace is 2, although each real embedding evaluates it to 1.

**Acceptance.**

- No individual coefficient embedding is substituted for the trace characterization.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Gives the Poincare pairing and its comparison with the L-pairing through the polarisation. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §1.2.4, printed p.15; §7.1.1 Proposition7.1.3, printed p.219. The dual endomorphism action makes the scalar height M-balanced; the trace-dual identification produces an M⊗ℝ-valued pairing whose trace is the scalar height.

<a id="target-gz-1-character-height-pairing"></a>

### 1.3 Character-component height pairing

**Target:** `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing` (construction).

For a finite abelian extension H/K, a coefficient extension L/M and finite-order χ:Gal(H/K)→L×, set Vχ={x∈A(H)⊗M L : σx=χ(σ)x}. Extend H_M L-bilinearly to Vχ×V∨χ⁻¹ with values L⊗ℚℝ. Galois invariance makes distinct inverse-character components orthogonal. The χ-projector is eχ=|G|⁻¹Σσ χ(σ)⁻¹σ; its normalization distinguishes trace and average. On rational points modulo torsion the pairing is nondegenerate on paired components once the imported canonical height is positive definite on a finite-rank group.

**Hypotheses.**

- H/K finite abelian, characteristic-zero coefficients; strict GL₂ data of coefficientHeight
- Finite generation is imported from RP.1 only for the finite-rank nondegeneracy formulation

**Outline.**

1. Extend the bilinear map along M→L and apply the finite character idempotents.
2. Use σ-invariance to force χχ′=1 for a nonzero pairing.
3. Apply the RP positivity result to the real finite-rank realization and scalar extension.

**Dependencies:** [Endomorphism-field height pairing](#target-gz-1-coefficient-valued-height), [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average), `HeightsRationalPointsAndObstructions:RP.1`.

**Uses.**

- `YZZ main formula`: The two Heegner points lie in inverse-character components.
- `GZ.8 ring-class specializations`: Control the normalizing class number and coefficient field.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `characterHeight` | constructor | The restriction of scalar-extended H_M to Vχ×V∨χ⁻¹. |
| `characterHeight_projector` | compatibility | H_L(eχx,y)=H_L(x,eχ⁻¹y). |
| `characterHeight_smul` | relation | H_L(ax,by)=ab H_L(x,y). |
| `characterHeight_galois` | relation | H_L(σx,σy)=H_L(x,y). |

**Checks.**

- `characterHeight_trivial` (compatibility): For χ=1 the pairing is the H_M pairing on G-invariants after scalar extension.
- `characterHeight_wrong_character` (non-example): If χχ′≠1, H_L(Vχ,V∨χ′)=0.
- `characterHeight_average_square` (computation): Replacing both trace inputs by their |G|⁻¹ averages divides the pairing by |G|².

**Acceptance.**

- A nontrivial χ is paired with χ⁻¹, rather than with χ again.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Gives the Poincare pairing and its comparison with the L-pairing through the polarisation. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §3, p. 228; §6, p. 230. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §1, p. 308; Chapter I, §6, p. 230. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §1.3.1–§1.3.2, printed pp.16–17; §1.2.4, printed p.15. The probability-normalized character projector and its inverse-character dual are paired by the scalar extension of the M-valued height.

<a id="target-gz-1-elliptic-poincare-comparison"></a>

### 1.4 Elliptic Poincaré comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.1/elliptic-poincare-comparison` (comparison).

For a Weierstrass elliptic curve E/K with translation T_P(x)=x+P and polarization φ_(O)(P)=T_P*O((O))⊗O((O))⁻¹, corresponding to [−P]−[O] in Pic⁰(E), the RP canonical height for (O), relative to K using NumberField.instAdmissibleAbsValues, equals the pinned Point.canonicalHeight. Therefore h𝒫(P,φ_(O) Q)=2·neronTatePairing(P,Q), and the full-polarization regulator is 2^r times the pinned regulator. The equality requires the line-bundle-to-coordinate Weil-height comparison; a change to absolute heights divides both pairings by [K:ℚ]. Under the Abel–Jacobi identification Q↦[Q]−[O] instead, the canonical Poincaré height is −2·neronTatePairing(P,Q). These two identifications must not be interchanged.

**Hypotheses.**

- K a number field; compatible RP and Mathlib absolute values; E nonsingular

**Outline.**

1. Compare the (O) Weil height with one half of the coordinate x-height up to a bounded error.
2. Apply uniqueness of quadratic refinements to identify the doubling limits.
3. Take the full polar form, then apply the determinant scaling baseline.

**Dependencies:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), `HeightsRationalPointsAndObstructions:RP.0`.

**Acceptance.**

- Test a non-torsion diagonal and rank-two basis; rank zero cannot detect the factor.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Gives the Poincare pairing and its comparison with the L-pairing through the polarisation. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [gross-zagier-1986](#source-gross-zagier-1986), I §4 (4.3), p.228. The classical Jacobian height uses the doubled theta convention.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.1.1, Theorems 7.1.1–7.1.2 and Proposition 7.1.3, pp. 217–219. Full polarization is the Poincaré height pulled back by the translation-defined Mumford map. Dual homomorphisms are adjoint. The coefficient-valued trace and character restrictions in this target are derived algebraic interfaces, with the imported actual biextension and height machine retained.

<a id="target-gz-1-mordell-weil-galois-descent"></a>

### 1.5 Rational Galois descent of Mordell–Weil spaces

**Target:** `GrossZagierAndArithmeticHeights:GZ.1/mordell-weil-galois-descent` (comparison).

Let H/K be a finite Galois extension of number fields with group G, and let A/K be an abelian variety. The inclusion of K-rational points induces A(K)⊗ℤℚ ≃ (A(H)⊗ℤℚ)^G. Its inverse is the rationalized norm divided by [H:K], where N(P)=Σ_{g∈G}gP. If a field M⊂End⁰_K(A) acts on both point spaces and L/M is a field extension, the comparison is M-linear and commutes with tensoring to L. This gives A(1)=A(K)ℚ⊗_M L for the inverse-character convention of GZ.8. It supplies rational descent only; general Mordell–Weil finite generation remains an RP.1 import and Hermitian positivity for nontrivial χ remains a separate gap.

**Hypotheses.**

- A and the M-action are defined over K; H/K is finite Galois, so all group-order denominators are invertible in ℚ and L.
- When finite-dimensionality is used, import Mordell–Weil finite generation over H from RP.1.

**Outline.**

1. Ordinary Galois descent for rational points gives A(H)^G=A(K). Define the norm on actual points and tensor it to ℚ; after inclusion it is Σg on the rationalized representation.
2. An invariant rationalized point may have a lift whose gP−P are torsion. A common multiple kills the finitely many differences, so it comes from A(K) after rationalization.
3. On invariant vectors the averaged norm is the identity. On K-points the norm is [H:K] times the point. M-linearity follows from descent of the endomorphisms; exact scalar extension commutes with the finite equalizer.

**Dependencies:** `mathlib:IsGalois`, `mathlib:TensorProduct`, `mathlib:LinearMap`, `HeightsRationalPointsAndObstructions:RP.1`, `AbelianSchemesAndArithmeticModuli:A2`.

**Checks.**

- `rationalDescent_identity_extension` (degenerate): For H=K the inclusion and averaged norm are the identity.
- `rationalDescent_quadratic_norm` (computation): For G={1,σ}, the inverse is (P+σP)/2. A K-rational point is fixed; a rationalized anti-invariant point maps to zero.
- `rationalDescent_denominator` (non-example): Without division by [H:K], the norm-inclusion composite on a nonzero K-point is multiplication by the extension degree and is not the identity.
- `rationalDescent_scalar_extension` (compatibility): For G swapping two coordinates of M², the invariant line becomes L·(1,1) after extension to L, of dimension 1 rather than 2.

**Acceptance.**

- Both composites are identities, with the averaging denominator shown. The invariant space is not asserted equal to the full H-point space.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1, notation for A(χ), pp.6–8; §2.4, pp.17–18. CST uses the character-isotypic rational point space and normalized trace. The finite Galois descent assertion here is the elementary norm argument spelled out in the proof sketch, not a claimed named CST theorem.

**Coverage:** planned. The following boundaries remain:

- Realize the RP.0/A2 height and biextension carriers and the strict coefficient/character actions; 2011 source normalization is checked.
- Conjugate-dual Hermitian positivity for arbitrary finite characters, beyond bilinear character-component pairing.

<a id="layer-2"></a>

## Layer 2: Admissible pairings on arithmetic surfaces

**Atlas planets:** Arithmetic intersection pairing; Admissible arithmetic extension; Faltings–Hriljac theorem; Arakelov probability form; Arakelov Green function; Admissible graph measure.

**Examples.**

- On a good-reduction genus-one curve the admissible probability measure has total mass 1. A formula dividing by 2g−2 is undefined.
- A bridge in a reduction graph has infinite complementary resistance and contributes no continuous edge density; loops and component genera remain part of the measure.

<a id="target-gz-2-arithmetic-intersection-gluing"></a>

### 2.1 Global arithmetic intersection on curves

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing` (construction).

For a smooth proper geometrically connected curve X/F and a regular model 𝒳/𝒪_L after finite L/F, an arithmetic divisor is (D,(gσ)σ) with ddᶜgσ+δDσ smooth and complex conjugation compatible. Its intersection for generically disjoint D₁,D₂ is the sum of finite intersection lengths times log Nv, plus the archimedean Green evaluation and curvature integral; complex embeddings count twice real ones. Divide by [L:F]. Model pullbacks and finite-extension projection formulas identify the total intersection, and compatible arithmetic classes glue in the directed system of models; horizontal and vertical summands separately depend on the model.

**Hypotheses.**

- 𝒳 regular with imported local intersections; finite extension chosen semistable where needed
- Green singularities and logarithm conventions fixed; generically disjoint representatives

**Outline.**

1. Import regular models and the finite length pairing from StableReduction.
2. Combine the finite local lengths with conjugation-invariant archimedean Green data.
3. Use local projection formulas and the product formula to descend the normalized total through models and extensions.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Uses.**

- `YZZ §7.1.3–7.1.7`: Glue local height contributions over a number field.
- `GZ.7 local-to-global identity`: Keep the finite and archimedean normalizations synchronized.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `arithmeticIntersection` | constructor | The normalized finite-plus-infinite intersection on compatible arithmetic divisor classes. |
| `arithmeticIntersection_add` | relation | The pairing is additive in each variable and symmetric. |
| `arithmeticIntersection_projection` | functoriality | For a finite map f, (f*D,E)=(D,f*E), with proper push-forward multiplicities. |
| `arithmeticIntersection_baseChange` | compatibility | Unnormalized intersection multiplies by [L′:L]; normalized intersection is unchanged. |
| `arithmeticIntersection_symm` | structure | The global arithmetic intersection is symmetric: D-hat·E-hat=E-hat·D-hat, for the compatible regular models and Green normalizations. |

**Checks.**

- `arithmeticIntersection_fibre_kernel` (degenerate): An entire fibre has zero finite intersection with a degree-zero divisor.
- `arithmeticIntersection_principal` (characterisation): A principal arithmetic divisor with Green −log|f| has global intersection zero by the product formula.
- `arithmeticIntersection_complex_weight` (non-example): A complex embedding contributes weight two; counting it once changes the pairing over an imaginary quadratic field.

**Acceptance.**

- The entire fibre is in the vertical intersection kernel; no ordinary matrix inverse is used.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 7, Sec. 7.1.4, printed pp. 211-212. Gives the definition of flatness in both equivalent forms and the consequence that the generic fibre has degree zero. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §4, (4.2), p. 228. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224. Flat extensions have zero curvature and zero vertical intersection; their intersection is the negative Néron–Tate pairing. Admissibility imposes componentwise degree-one Hodge normalization, mean-zero Green functions and vertical orthogonality. Finite field extensions contribute their relative degree.

<a id="target-gz-2-admissible-arithmetic-extension"></a>

### 2.2 Admissible arithmetic extension

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension` (construction).

Fix a compatible arithmetic class ξ̂ of degree one on each geometric connected component of X. For D, its ξ̂-admissible extension D̄ is characterized by: D̄−deg(D)ξ̂ has zero curvature and is orthogonal to every finite vertical component; ∫g_D c₁(ξ̂)=0 at each infinite place; and the vertical correction V_D has (V_D·ξ̂)v=0. The singular fibre matrix is solved on the quotient by the total fibre; the last condition fixes that remaining fibre ambiguity. The construction is unique in the compatible model system and extends by rational linearity.

**Hypotheses.**

- Semistable regular model after base change; degree taken componentwise
- ξ̂ fixed with compatible admissible Green data

**Outline.**

1. Solve the vertical linear equations modulo the fibre kernel using the imported matrix result.
2. Solve the archimedean Green equation and fix its additive constant by the mean-zero condition.
3. Normalize the vertical fibre multiple against ξ̂ and verify uniqueness.

**Dependencies:** [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure).

**Uses.**

- `YZZ §7.1.5`: Define local height symbols of degree-one CM divisors.
- `GZ.7 Hodge and diagonal terms`: Keep their ξ̂-dependence explicit.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `admissibleExtension` | constructor | The unique ξ̂-admissible extension of D. |
| `admissibleExtension_characterization` | characterisation | The three normalization conditions characterize the extension. |
| `admissibleExtension_add` | relation | Extension is rational-linear in divisors. |
| `admissibleExtension_pullback` | functoriality | Pullback preserves admissibility when ξ̂ and its measure are pulled back compatibly. |
| `admissibleExtension_degreeZero` | compatibility | For componentwise degree zero the extension is flat. |

**Checks.**

- `admissibleExtension_zero` (degenerate): The extension of zero is zero.
- `admissibleExtension_xi` (characterisation): The fixed normalized representative of ξ extends to ξ̂.
- `admissibleExtension_disconnected` (non-example): A divisor of total degree zero with nonzero degrees on two components is not flat.

**Acceptance.**

- Positive-degree extensions depend on ξ̂ and do not descend through arbitrary rational equivalence.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 7, Sec. 7.1.5, printed p. 212. Gives the three defining conditions of admissibility and the existence-and-uniqueness statement, including the dependence on xi-hat. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224. Flat extensions have zero curvature and zero vertical intersection; their intersection is the negative Néron–Tate pairing. Admissibility imposes componentwise degree-one Hodge normalization, mean-zero Green functions and vertical orthogonality. Finite field extensions contribute their relative degree.

<a id="target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions"></a>

### 2.3 Faltings–Hriljac comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions` (theorem).

For componentwise degree-zero divisors D,E on a smooth proper curve X/F, choose disjoint representatives over L and flat admissible extensions on a regular semistable model. Then −[L:F]⁻¹(D̄·Ē)=h𝒫_J([D],φΘ[E]), the full-polarization canonical Jacobian pairing relative to F. It is independent of representatives and model. For disconnected curves the summands are orthogonal. Only degree-zero divisors descend to Pic⁰; the ξ̂-admissible positive-degree pairing is not asserted to factor through Pic.

**Hypotheses.**

- X has positive genus on the Jacobian components; canonical principal polarization imported
- Flat extensions, compatible local weights and generically disjoint representatives

**Outline.**

1. Identify the intersection height with a Weil height for the Jacobian theta divisor.
2. Apply the canonical-height limit and the Hodge index theorem, with the minus sign.
3. Use projection formulas and the product formula to remove choices.

**Dependencies:** [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension), [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `AbelianSchemesAndArithmeticModuli:A2`.

**Acceptance.**

- For an elliptic curve the diagonal is twice the pinned canonicalHeight.
- A positive-degree principal-equivalence change is not incorrectly declared invisible.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 7, Thm. 7.4, printed p. 212. Gives the arithmetic Hodge index theorem with its sign, as recorded in the statement. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §4, (4.3), p. 228 (quoted, Lang [24]). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224. Flat extensions have zero curvature and zero vertical intersection; their intersection is the negative Néron–Tate pairing. Admissibility imposes componentwise degree-one Hodge normalization, mean-zero Green functions and vertical orthogonality. Finite field extensions contribute their relative degree.

<a id="target-gz-2-arakelov-probability-form"></a>

### 2.4 Arakelov probability form

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form` (construction).

On C let (α,β)=(i/2)∫C α∧β̄ on H⁰(C,ωC), and choose an orthonormal basis α₁,…,αg. Set μAr=(i/(2g))Σj αj∧ᾱj. It is a smooth positive probability form, independent of the orthonormal basis. This is a genus-normalized form: the unscaled Bergman sum has mass g.

**Hypotheses.**

- Shared blocks H12, H13.

**Outline.**

1. Import holomorphic one-forms, integration and the positive definite hermitian pairing.
2. A unitary change of basis preserves the sum; integrate each diagonal term to obtain total mass one.

**Dependencies:** `ArakelovGeometryAndAbelianHeights:R35.1`, `AutomorphicSpectralTheory:AS.4`.

**Uses.**

- `Yuan Appendix A.1`: Fix the curvature normalization for every admissible metric.
- `GZ.2 Green normalization`: Take the mean-zero condition against a probability measure.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `arakelovMeasure` | constructor | The form (i/(2g))Σαj∧ᾱj. |
| `arakelovMeasure_basis_independent` | extensionality | The measure agrees for any two orthonormal bases. |
| `arakelovMeasure_mass` | projection | ∫C μAr=1. |
| `arakelovMeasure_isometry` | functoriality | A biholomorphism pulls the target Arakelov form back to the source form. |

**Checks.**

- `arakelovMeasure_genus_two` (computation): For g=2 each orthonormal summand contributes 1/2 to the mass.
- `arakelovMeasure_genus_one` (compatibility): For C=ℂ/Λ with area A, μAr is Euclidean area divided by A.
- `arakelovMeasure_wrong_mass` (non-example): For g=2 the unscaled Bergman form has mass 2 and is not μAr.

**Acceptance.**

- Do not omit the factor 1/g.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.1, p.102. The source defines the orthonormal-form construction.

<a id="target-gz-2-archimedean-admissible-metric"></a>

### 2.5 Archimedean admissible metric

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric` (definition).

A smooth hermitian metric on a holomorphic line bundle L/C is admissible when c₁(L,‖·‖)=deg(L)μAr. A smooth metric on L/C² is admissible when its restrictions to {x}×C and C×{x} are admissible for every x∈C. Multiplication of a norm by a positive constant preserves admissibility; degrees need not be one or positive.

**Hypotheses.**

- Shared blocks H12, H13.

**Outline.**

1. Use the imported Chern current of a smooth hermitian metric.
2. Define the two fibrewise restrictions on C² and impose the same degree-weighted equation.

**Dependencies:** [Arakelov probability form](#target-gz-2-arakelov-probability-form), `ArakelovGeometryAndAbelianHeights:R35.1`.

**Uses.**

- `Yuan Theorem A.1`: Normalize diagonal and dualizing metrics.
- `GZ.2 positive-degree extensions`: Retain the degree factor in the archimedean local condition.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `admissibleMetric` | characterisation | c₁(L)=deg(L)μAr, and the analogous two-fibre condition on C². |
| `admissibleMetric_tensor` | relation | Tensor products and duals add and negate degrees and Chern forms. |
| `admissibleMetric_rescale` | relation | Multiplication of the norm by a positive constant preserves admissibility. |
| `admissibleMetric_fibre` | projection | Either fibre restriction of an admissible metric on C² is admissible. |

**Checks.**

- `admissibleMetric_degree_zero` (degenerate): An admissible metric on a degree-zero bundle is flat.
- `admissibleMetric_degree_two` (computation): For degree two the curvature mass is 2.
- `admissibleMetric_wrong_curvature` (non-example): Curvature μAr is inadmissible for a bundle of degree two.

**Acceptance.**

- A degree-zero bundle has zero Chern form.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.1, p.102. The Chern-form criterion explicitly includes deg(L).

<a id="target-gz-2-admissible-green-function"></a>

### 2.6 Degree-weighted admissible Green function

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/admissible-green-function` (definition).

For a Cartier divisor D on C a Green function is a smooth real gD off |D| such that gD+log|f| extends smoothly whenever div(f)=D locally. It is admissible if the metric ‖1‖=exp(−gD) on O(D) is admissible, equivalently ddᶜgD=deg(D)μAr−δD as currents. The printed equation with μAr−δD is valid only for degree one.

**Hypotheses.**

- Shared blocks H12, H13.

**Outline.**

1. Apply the Poincaré–Lelong formula with the selected unsquared norm.
2. Insert c₁(O(D))=deg(D)μAr; both sides of the current equation then have total mass zero.

**Dependencies:** [Archimedean admissible metric](#target-gz-2-archimedean-admissible-metric), `ArakelovGeometryAndAbelianHeights:R35.1`.

**Uses.**

- `Yuan Appendix A.1`: Pass between divisor Green functions and hermitian line bundles.
- `GZ.2 arithmetic intersection`: Evaluate local archimedean symbols for divisors of arbitrary degree.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `admissibleGreen` | characterisation | The singularity and degree-weighted current equation characterize admissibility. |
| `admissibleGreen_add` | relation | gD+gE is admissible for D+E. |
| `admissibleGreen_constant` | relation | Adding a real constant preserves admissibility. |
| `admissibleGreen_metric` | compatibility | exp(−gD) defines the admissible metric on O(D). |

**Checks.**

- `admissibleGreen_zero` (degenerate): A constant is an admissible Green function for D=0.
- `admissibleGreen_degree_two` (computation): The smooth term for D=x+y is 2μAr.
- `admissibleGreen_missing_degree` (non-example): For D=0 the printed equation ddᶜg=μAr has incompatible total masses 0 and 1.

**Acceptance.**

- Integrate the current equation for D=0 and for a divisor of degree two.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.1, p.102. The general divisor equation needs the degree factor, which is recorded in sourceIssues.

<a id="target-gz-2-admissible-metric-existence"></a>

### 2.7 Complex admissible metric existence

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence` (theorem).

Every holomorphic line bundle on C, and every holomorphic line bundle on C² with the two-fibre criterion, has a smooth admissible hermitian metric. It is unique up to multiplication of its norm by one positive constant on the connected base. Equivalently two admissible Green metrics differ by an additive constant.

**Hypotheses.**

- Shared blocks H12, H13.

**Outline.**

1. On C solve the zero-mass curvature difference by the imported elliptic Green operator.
2. For C² use the fibrewise construction and the line-bundle decomposition, including the Jacobian/Poincaré component.
3. The ratio of two solutions is pluriharmonic in each fibre; compactness makes it constant.

**Dependencies:** [Archimedean admissible metric](#target-gz-2-archimedean-admissible-metric), `AutomorphicSpectralTheory:AS.4`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Acceptance.**

- Admissibility alone does not select an absolute multiplicative constant.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.1, p.102. The statement includes C and C².

<a id="target-gz-2-normalized-arakelov-green"></a>

### 2.8 Normalized Arakelov Green function

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green` (construction).

There is a unique symmetric smooth Green function gAr on C²∖Δ with singularity −log|local diagonal equation|, ddᶜ_y gAr(x,y)=μAr(y)−δx and ∫C gAr(x,y)μAr(y)=0. It defines a fibrewise admissible metric exp(−gAr) on O(Δ). Symmetry follows from the self-adjoint Green operator; the mean-zero condition removes the constant ambiguity.

**Hypotheses.**

- Shared blocks H12, H13.

**Outline.**

1. Solve the current equation for each x, subtract its μAr mean.
2. Use elliptic regularity away from Δ and the symmetric Green operator to glue the kernel.
3. Convert the logarithmic singularity to the diagonal line-bundle metric.

**Dependencies:** [Degree-weighted admissible Green function](#target-gz-2-admissible-green-function), [Complex admissible metric existence](#target-gz-2-admissible-metric-existence), `AutomorphicSpectralTheory:AS.4`.

**Uses.**

- `Yuan Appendix A.1`: Define the canonical diagonal and dualizing metrics.
- `GZ.2 admissible arithmetic extension`: Fix the infinite-place Green constant.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `arakelovGreen` | constructor | The normalized symmetric Green kernel on C²∖Δ. |
| `arakelovGreen_symm` | relation | gAr(x,y)=gAr(y,x). |
| `arakelovGreen_mean` | characterisation | ∫gAr(x,y)μAr(y)=0. |
| `arakelovGreen_diagonal_metric` | compatibility | exp(−gAr) extends to the admissible metric on O(Δ). |

**Checks.**

- `arakelovGreen_constant_shift` (non-example): For a nonzero real c, gAr+c fails the mean-zero condition.
- `arakelovGreen_degree_zero` (compatibility): For D=x−y, gAr(x,·)−gAr(y,·) has smooth curvature zero.
- `arakelovGreen_local_singularity` (characterisation): gAr+log|z−w| is smooth near a diagonal coordinate chart.

**Acceptance.**

- Use the unsquared metric convention in both the Green function and diagonal metric.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.1, p.103. The source fixes symmetry and the zero integral.

<a id="target-gz-2-arakelov-dualizing-metric"></a>

### 2.9 Arakelov dualizing metric

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric` (construction).

For each x∈C the residue map (ωC⊗O(x))|x→ℂ is an isometry when O(x) has the normalized Green metric and ℂ has its ordinary absolute value. These conditions determine the smooth Arakelov metric on ωC. Its curvature is (2g−2)μAr; in genus one the metric is flat.

**Hypotheses.**

- Shared blocks H12, H13.

**Outline.**

1. Use adjunction O(Δ)|Δ≃ωC⁻¹ and the smooth diagonal metric.
2. Dualize its diagonal restriction so that the residue trivialization has norm one.
3. Apply the curvature formula for the canonical Bergman measure.

**Dependencies:** [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), `ArakelovGeometryAndAbelianHeights:R35.1`.

**Uses.**

- `Yuan Theorem A.1`: Fix dualizing/diagonal compatibility.
- `GZ.7 arithmetic adjunction`: Measure the self-intersection by the tangent/residue line.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `arakelovDualizingMetric` | constructor | The residue-normalized smooth metric on ωC. |
| `arakelovDualizingMetric_residue` | characterisation | All the residue maps are isometries. |
| `arakelovDualizingMetric_curvature` | projection | c₁(ωC)=(2g−2)μAr. |
| `arakelovDualizingMetric_diagonal` | compatibility | It is the dual of O(Δ)\|Δ with its diagonal metric. |

**Checks.**

- `arakelovDualizingMetric_genus_one` (degenerate): For genus one its Chern form is zero.
- `arakelovDualizingMetric_genus_two` (computation): For genus two its curvature mass is 2.
- `arakelovDualizingMetric_rescale` (non-example): Multiplying only the dualizing norm by c≠1 destroys the residue isometry.

**Acceptance.**

- Do not replace the ordinary ℂ norm by its square.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.1, p.103. The residue normalization fixes the dualizing metric.

<a id="target-gz-2-graph-admissible-measure"></a>

### 2.10 Admissible reduction-graph measure

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure` (construction).

Let Kv=2g_v−2+val(v) be the canonical divisor KΓ on Γ. There is a unique probability measure μ of the edge-uniform and vertex-atomic class such that its normalized symmetric continuous Green kernel satisfies Δ_y gμ(x,y)=δx−μ, ∫Γgμ(x,y)dμ(y)=0, and c+gμ(KΓ,x)+gμ(x,x)=0 for a constant c independent of x. Push μ forward by the skeleton inclusion i to obtain the canonical admissible measure on Cᵃⁿ. The genus weights g_v are indispensable.

**Hypotheses.**

- K is complete discretely valued; C/K is smooth projective geometrically integral of genus g>0 with C(K) nonempty and split semistable reduction
- Γ is the graph of the minimal regular model, with unit edge lengths; eK=|uniformizer|⁻¹

**Outline.**

1. Import the reduction graph, skeleton inclusion/retraction, graph Laplacian and resistance Green kernel.
2. Use Zhang’s canonical-divisor condition to select μ among probability measures.
3. Normalize the Green kernel by its μ mean, and push the measure to Cᵃⁿ.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.2`.

**Uses.**

- `Yuan Theorem A.1 and Proposition A.5`: Normalize nonarchimedean dualizing and diagonal metrics.
- `GZ.2 vertical correction`: Compare the graph correction with the arithmetic model correction.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `graphAdmissibleMeasure` | constructor | The canonical-divisor probability measure μ. |
| `graphAdmissibleMeasure_mass` | projection | μ(Γ)=1. |
| `graphAdmissibleGreen_laplacian` | characterisation | Δ_y gμ(x,y)=δx−μ and its μ mean is zero. |
| `graphAdmissibleGreen_canonical` | relation | gμ(KΓ,x)+gμ(x,x) is constant. |
| `graphAdmissibleMeasure_pushforward` | compatibility | i*μ is the admissible measure on the analytic curve. |

**Checks.**

- `graphAdmissibleMeasure_good_reduction` (computation): For one vertex of genus g and no edges, μ is that vertex’s Dirac mass and gμ=0.
- `graphAdmissibleMeasure_tate_cycle` (compatibility): For a split multiplicative genus-one cycle μ is normalized length measure.
- `graphAdmissibleMeasure_genus_weight` (non-example): For a single genus-two vertex, omitting its genus weight produces mass zero rather than one.

**Acceptance.**

- State the selected graph-Laplacian sign in the supplier request.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.5, pp.115–116. The source invokes the canonical-divisor characterization.

<a id="target-gz-2-explicit-skeleton-measure"></a>

### 2.11 Explicit admissible skeleton measure

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure` (theorem).

With the graph data above, let r_e be the effective resistance between the endpoints of e in Γ∖e°, δ_e unit-mass length measure on e and δ_v a Dirac mass. Then i*μ=(1/g)i*(Σv g_vδ_v+Σe (r_e+1)⁻¹δ_e). A bridge has r_e=∞ and contributes zero; a loop has r_e=0. This agrees with the measure characterized by KΓ. The source’s canonical-bundle proof for g>1 does not by itself prove the genus-one case.

**Hypotheses.**

- K is complete discretely valued; C/K is smooth projective geometrically integral of genus g>0 with C(K) nonempty and split semistable reduction
- Γ is the graph of the minimal regular model, with unit edge lengths; eK=|uniformizer|⁻¹

**Outline.**

1. Compute the Chern measure of the model dualizing line as i*δKΓ.
2. Use the model-function/Laplacian comparison to get c₁(ωa)=(2g−2)i*μ.
3. For g>1 compare with the admissible Chern measure and Zhang’s resistance formula.
4. Supply a separate genus-one argument using a degree-one line bundle or the good/Tate reduction cases; this proof refinement is recorded as a gap.

**Dependencies:** [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure), `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.6`.

**Acceptance.**

- A unit single loop has uniform mass one; a bridge contributes none.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, Proposition A.5, pp.117–118. The displayed resistance expression and its genus-one proof boundary are retained.

<a id="target-gz-2-real-admissible-descent"></a>

### 2.12 Admissible metrics at real places

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/real-admissible-descent` (construction).

For a smooth projective geometrically integral curve over ℝ of positive genus, its canonical complex Arakelov probability, diagonal and dualizing metrics are invariant under complex conjugation with the line-bundle real structure. They descend to Cᵃⁿ=C(ℂ)/Gal(ℂ/ℝ). The residue and diagonal compatibility of Theorem A.1 remain isometries. For complex places use the complex metrics directly.

**Hypotheses.**

- The real line-bundle structure is included; the quotient keeps the conjugation action

**Outline.**

1. Conjugation preserves the positive hermitian pairing and normalized Green equations.
2. Apply uniqueness to establish invariant metrics.
3. Descend the invariant norms, preserving the canonical residue isomorphisms.

**Dependencies:** [Arakelov probability form](#target-gz-2-arakelov-probability-form), [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), [Arakelov dualizing metric](#target-gz-2-arakelov-dualizing-metric), `ArakelovGeometryAndAbelianHeights:R35.1`.

**Uses.**

- `Yuan Appendix A.6`: Use the canonical metrics at real places.
- `GZ.2 global gluing`: Assemble conjugation-compatible archimedean data.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `realAdmissibleMetric` | constructor | The conjugation-descended canonical metric. |
| `realAdmissibleMetric_pullback` | compatibility | Pullback to C(ℂ) is the complex Arakelov metric. |
| `realAdmissibleMetric_unique` | extensionality | The real metric is determined by this pullback. |
| `realAdmissibleMetric_residue` | relation | The descended residue/diagonal isomorphisms are isometries. |

**Checks.**

- `realAdmissibleMetric_conjugate_points` (characterisation): A point and its conjugate have equal induced norms.
- `realAdmissibleMetric_real_point` (compatibility): At a real point the residue norm is ordinary absolute value.
- `realAdmissibleMetric_wrong_involution` (non-example): A metric with unequal conjugate-point norms cannot descend.

**Acceptance.**

- The quotient does not identify real and complex place weights in global arithmetic sums.

**Sources.**

- [yuan-bigness-2026](#source-yuan-bigness-2026), 21 August 2024 author manuscript, §A.6, p.119. The source explicitly requires real descent.

<a id="target-gz-2-colmez-residue-line"></a>

### 2.13 Residue-normalized adjunction line

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/colmez-residue-line` (construction).

Over H, the Hilbert class field of E, let Pbar be the admissible arithmetic CM divisor, e its generic elliptic ramification index, and Mbar=LU,OH⊗O(Pbar/e). Residue gives a canonical generic trivialization M|P≃H; its integral image is a fractional ideal N with induced metric.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the orbifold Hodge bundle identity to identify its tensor with O(P/e) at P with (ω⊗O(P))|P.
2. Use the residue coordinate to trivialize the generic fibre and take the image of the integral lattice with its metric.

**Dependencies:** [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension), `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

**Uses.**

- `Yuan–Zhang 2018 §9.2, pp. 629–630`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `residueAdjunctionLine_constructor` | constructor | The residue image fractional ideal N of (L_U⊗O(P/e))\|P, with induced metric. |
| `residueAdjunctionLine_residue_coordinate` | extensionality | The generic residue trivialization is independent of the local coordinate. |
| `residueAdjunctionLine_finite_lattice` | projection | At w, N_w is the image integral lattice in H_w. |
| `residueAdjunctionLine_degree` | compatibility | The arithmetic degree equals the sum of residue-lattice lengths and negative log norms. |

**Checks.**

- `residueAdjunctionLine_coordinate_unit` (characterisation): Replacing local coordinate z by az+O(z²), a≠0, preserves the residue trivialization.
- `residueAdjunctionLine_ramification_one` (computation): For e=1 the bundle is L_U⊗O(P).
- `residueAdjunctionLine_unscaled_divisor` (non-example): For e>1, replacing O(P/e) by O(P) gives the wrong orbifold adjunction line.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §9.2, pp. 629–630. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-2-classical-complex-height-symbol"></a>

### 2.14 Squared-norm complex height symbol

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol` (construction).

For disjoint degree-zero a,b, −2Σ_i,j n_i m_j g_Ar(x_i,y_j), using the unsquared-norm normalized Arakelov Green function. Its principal-divisor law is log|f|², and it is symmetric and biadditive.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the normalized unsquared-norm Arakelov kernel and multiply its divisor contraction by −2.
2. The Green principal-divisor identity gives log|f|²; degree zero eliminates the additive constant and gives uniqueness.

**Dependencies:** [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), `HeightsRationalPointsAndObstructions:RP.0`.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §2, (2.1), pp. 236–237 (recalling Chap. I §4)`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.2 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `classicalComplexHeight` | constructor | For disjoint degree-zero a,b, −2Σ_i,j n_i m_j g_Ar(x_i,y_j), using the unsquared-norm normalized Arakelov Green function. |
| `classicalComplexHeight_principal` | characterisation | For b=div(f), the value is Σ_i n_i log\|f(x_i)\|². |
| `classicalComplexHeight_add` | relation | Additive and symmetric on disjoint degree-zero divisors. |
| `classicalComplexHeight_unique` | extensionality | Any continuous biadditive symbol with the principal-divisor law equals it. |

**Checks.**

- `classicalComplexHeight_zero` (degenerate): Zero divisor has symbol zero.
- `classicalComplexHeight_scale_function` (compatibility): Replacing f by cf has the same symbol because deg a=0.
- `classicalComplexHeight_square_factor` (non-example): Using −Σ g_Ar rather than −2Σ g_Ar gives log|f| instead of log|f|².

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.1), pp. 236–237 (recalling Chap. I §4). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-2-classical-archimedean-height-sum"></a>

### 2.15 Archimedean CM height sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum` (definition).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Assume r_A(m) = 0, so that c and T_m d^σ have disjoint support. Define ⟨c, T_m d^σ⟩_∞ := Σ_{v|∞} ⟨c, T_m d^σ⟩_v, the sum over the h complex places of H of Néron's archimedean local symbols. Since Gal(H/K) ≅ Cl_K permutes these places simply transitively, ⟨c, T_m d^σ⟩_∞ = Σ_{A₁, A₂ ∈ Cl_K, A₁A₂⁻¹ = A} ⟨(τ_{A₁,𝔫}) − (∞), T_m((τ_{A₂,𝔫}) − (0))⟩_ℂ, where τ_{A,𝔫} ∈ 𝔥 are the points of Chap. II §1 (roots of aτ² + bτ + c = 0 of discriminant D with N | a) attached to the class A and the ideal 𝔫.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Sum over the h complex places of the Hilbert class field.
2. Identify each embedding with the corresponding ideal class under reciprocity; the local symbol already uses |·|².

**Dependencies:** [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average), `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §4, first two displays, p. 248`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.2 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmArchimedeanHeightSum` | constructor | Σ_{v\|∞} of the classical complex local symbols, one squared-norm symbol for each complex place. |
| `cmArchimedeanHeightSum_orbit` | compatibility | Equals the class-pair sum with A₁A₂⁻¹=A. |
| `cmArchimedeanHeightSum_add` | relation | Biadditive on admissible inputs. |
| `cmArchimedeanHeightSum_class_count` | projection | H has h complex places; no extra factor two is applied to their squared-norm symbols. |

**Checks.**

- `cmArchimedeanHeightSum_h_one` (computation): For h=1 the sum is one complex-place symbol.
- `cmArchimedeanHeightSum_double_weight` (non-example): Counting every embedding and also using |·|² doubles the complex-place total.
- `cmArchimedeanHeightSum_disjoint` (characterisation): r_A(m)=0 is exactly the off-diagonal input condition when N>1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §4, first two displays, p. 248. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-2-classical-local-intersection-height"></a>

### 2.16 Local intersection height comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height` (theorem).

Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let 𝒳 be a regular model of the curve X over A_v, a, b relatively prime divisors of degree 0 on X over H_v, and A and B extensions of a and b to 𝒳. Assume A·C=0 for each irreducible component C of the special fibre. Under this vertical-orthogonality condition, ⟨a, b⟩_v = −(A · B) log q.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the regular-model local intersection/local-height comparison with valuation ord_v and residue size q_v.
2. Separate disjoint and tangent-regularized self terms; the local height is minus the intersection times log q_v.

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.0`, [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, introduction, (0.1), p. 252. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-2-classical-p-height-sum"></a>

### 2.17 Rational-prime CM height sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum` (definition).

For the classical Heegner data, define the tensor-normalized contribution at a rational prime p by ⟨c,T_m d^σ⟩_p^Δ=−Σ_(v|p)[I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(Δ)/(r_x+6)]log q_v. Here r_x+6=6/u and ord_(v,x)(Δ)=6ord_v(𝔫̄). Combine this finite sum with the eta-normalized complex contribution through classical-tensor-global-decomposition. For disjoint divisors r_A(m)=0 it is the ordinary sum of local symbols; for a diagonal at an exceptional CM point it is a redistribution of cotangent local symbols, not their uncorrected sum for an arbitrary tangent.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11.

**Outline.**

1. Use the Δ specialization of the tensor global decomposition.
2. Group its finite contributions by rational p and use log q_v=f_v log p.
3. Keep the paired eta normalization at infinity; an independently chosen cotangent sum may have additional scalar terms at p.

**Dependencies:** [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection), [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition), [Finite CM intersection height](#target-gz-7-classical-finite-intersection-height), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison).

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, (9.1), p. 264`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.2 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmPrimeHeightSum` | constructor | The finite sum of modified CM intersections minus the discriminant tensor correction, weighted by −log q_v. |
| `cmPrimeHeightSum_log_norm` | projection | Each summand uses log q_v=f_vlog p. |
| `cmPrimeHeightSum_galois` | extensionality | Reindexing the places by Gal(H/K) does not change the sum. |
| `cmPrimeHeightSum_global` | compatibility | The finite Δ-normalized contribution is Σ_p cmPrimeHeightSum, with finite support; its eta-normalized archimedean partner gives the global height. |
| `cmPrimeHeightSum_disjoint` | compatibility | If r_A(m)=0, this contribution equals Σ_(v\|p)⟨c,T_m d^σ⟩_v for the ordinary local symbols. |

**Checks.**

- `cmPrimeHeightSum_inert` (computation): For inert p, each q_v=p² and there are h places of H above p.
- `cmPrimeHeightSum_ramified` (computation): If [𝔭] has order f, there are h/f places and each log q_v=f log p.
- `cmPrimeHeightSum_wrong_cardinality` (non-example): p^f is the residue cardinality, not the residue degree f.
- `cmPrimeHeightSum_level_tensor` (computation): At a place v|𝔫̄ with u=3, r_A(m)=1 and ord_v(N)=1, the tensor correction contributes +3log q_v to the height sum, not +log q_v.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, (9.1), p. 264. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), (9.18), p.130; TheoremA.1 and (A.9)–(A.10), pp.139–140. Defines the normalized p contribution and relates it to the splitting formulas.

**Coverage:** planned. The following boundaries remain:

- Separate genus-one resistance-measure argument, non-split graph descent and arithmetic Green/metric carriers.
- The precise unsupported Arakelov, analytic projection and CM lifting supplier extensions listed in the contract audit.

<a id="layer-3"></a>

## Layer 3: Rational automorphic realizations and modular degrees

**Atlas planets:** Normalized Hodge class; Rational automorphic realization; Strict GL₂ realization; Composition pairing; Manin constant.

**Examples.**

- A ξ-normalized Abel map uses a rational degree-one divisor class, so multiplying by a denominator gives an integral realization whose recovery is independent of that denominator.
- Scaling a parametrizing differential by c scales its norm by |c|²; the comparison retains its Manin constant.

<a id="target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation"></a>

### 3.1 Normalized Hodge class

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation` (construction).

On each geometric component of a finite-level quaternionic Shimura curve X_U, let ℒ_U be the imported rational arithmetic Hodge line, with orbifold canonical generic class in the compact case and the specified logarithmic cusp class in the modular case. Define ξ_U=c₁(ℒ_U)/deg(ℒ_U) on that component. It has degree one, is Galois invariant and rational. For a finite level map p:X_V→X_U, p^*ξ_U=deg(p)ξ_V and p_*ξ_V=ξ_U, with degrees taken on each mapped component. Thus ξ-normalization is compatible with level maps; on a compact curve no rational cusp is chosen.

**Hypotheses.**

- The Hodge degree on each component is positive; coarse stack stabilizer and cusp corrections retained
- Finite levels, including the exceptional modular case, are treated individually

**Outline.**

1. Use the imported Hodge pullback isomorphism and its orbifold/cusp generic-fibre formula.
2. Divide by the component degree and use the finite-map degree formula.
3. Descend the rational class by Galois equivariance.

**Dependencies:** `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`.

**Uses.**

- `YZZ §3.1`: Fix the origin of maps from the curve to A.
- `GZ.6 CM degree-zero classes`: Subtract ξ on the CM point’s component.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `normalizedHodgeClass` | constructor | c₁(ℒ_U)/deg(ℒ_U), component by component. |
| `normalizedHodgeClass_degree` | projection | Each geometric component has degree one. |
| `normalizedHodgeClass_pullback` | functoriality | p^*ξ_U=deg(p)ξ_V, with identity and composite level maps. |
| `normalizedHodgeClass_pushforward` | functoriality | p_*ξ_V=ξ_U. |

**Checks.**

- `normalizedHodgeClass_degree_one` (computation): A component with Hodge degree d has normalized degree d/d=1.
- `normalizedHodgeClass_compact` (non-example): Normalization does not require a rational cusp or a chosen rational point.
- `normalizedHodgeClass_double_cover` (characterisation): For a connected degree-two level cover, pullback is 2ξ_V and push-forward of ξ_V is ξ_U.

**Acceptance.**

- A compact Shimura curve without rational cusp still has a degree-one rational ξ class.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.2.1, printed pp. 2-3. Fixes the standing hypotheses under which the Hodge class and the parametrisations of this node are constructed; added in review. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §3.1.3, Lemma 3.1.1, pp. 70–71. The orbifold canonical divisor includes coefficient one at cusps and 1−1/e at elliptic points. Its degree equals the dx dy/(2πy²) volume. Pullback and degree give the two distinct normalized transition maps.

<a id="target-gz-3-rational-xi-realization"></a>

### 3.2 Rational ξ-normalized realization

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization` (construction).

For a simple A/F that is a quotient of some Jacobian J_U, define π_A^U=Hom_F⁰(J_U,A), equivalently rational maps from X_U to A modulo constants whose rational extension to zero-cycles kills ξ_U. Take π_A=colim_U π_A^U under level pullback. The Hecke/right B_f× action and End_F⁰(A) action commute. A genuine integral map is ξ-normalized only when its value on ξ vanishes in A⊗ℚ; rational maps are not asserted to be ordinary morphisms divided by a denominator.

**Hypotheses.**

- A is geometrically parametrized by the given Shimura tower
- Hom⁰=Hom⊗ℚ; no modularity statement for arbitrary A

**Outline.**

1. Use the Abel–Jacobi universal property to identify Hom(J_U,A) with maps modulo constants.
2. Use ξ to choose the rational constant and form the filtered colimit.
3. Check commuting actions by the functoriality of correspondences.

**Dependencies:** [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`.

**Uses.**

- `YZZ §3.2 rational automorphic realization`: Realize the automorphic representation attached to a parametrized A.
- `GZ.8 test vectors`: Use rational maps as geometric inputs to the height identity.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `rationalXiRealization` | constructor | The colimit of Hom_F(J_U,A)⊗ℚ. |
| `rationalXiRealization_level` | projection | The canonical map from a finite-level Hom⁰ space. |
| `rationalXiRealization_ext` | extensionality | Two representatives agree iff they agree after pullback to a common finer level. |
| `rationalXiRealization_actions` | structure | The Hecke and endomorphism actions commute. |
| `rationalXiRealization_xi` | compatibility | The representative rational map sends ξ to zero. |

**Checks.**

- `rationalXiRealization_constant` (degenerate): A constant map represents zero.
- `rationalXiRealization_identity` (characterisation): For A=J_U the Abel–Jacobi map normalized by ξ represents the identity homomorphism.
- `rationalXiRealization_finer_level` (compatibility): A map and its level pullback have the same colimit class.

**Acceptance.**

- Changing a map by a constant does not change its Hom⁰ realization.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.2.1, printed pp. 2-3. Fixes the standing hypotheses under which the Hodge class and the parametrisations of this node are constructed; added in review. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §3.2.3, pp. 86–87. Use actual rational maps annihilating the normalized Hodge class and their identification with Hom⁰(J_U,A), before taking the level colimit.

<a id="target-gz-3-strict-gl2-realization"></a>

### 3.3 Strict GL₂ realization and transfer

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization` (theorem).

For a simple F-abelian quotient A of the quaternionic Shimura tower in characteristic zero, the Hecke isotypic summand gives a number field M=End_F⁰(A) with [M:ℚ]=dim A. The rational realization π_A is irreducible over M, its scalar extension to each fixed coefficient embedding is the specified automorphic quaternionic constituent, and it matches the GL₂ Jacquet–Langlands transfer. The rational endomorphism and Galois-field statements concern this parametrized A and its chosen rational Hecke summand.

**Hypotheses.**

- The relevant weight-two cohomological constituent occurs in the Jacobian; simple quotient and rational field of definition fixed
- The scalar realization/transfer and multiplicity-one inputs are supplied externally

**Outline.**

1. Decompose finite-level Jacobians by the rational Hecke algebra.
2. Compare the Hom⁰ multiplicity spaces with weight-two cohomology using the imported realization theorem.
3. Apply transfer and its rational-model comparison, then take the tower colimit.

**Dependencies:** [Rational ξ-normalized realization](#target-gz-3-rational-xi-realization), `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Acceptance.**

- The theorem contains no assertion that every abelian variety is modular.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.2.1, printed pp. 2-3. Fixes the standing hypotheses under which the Hodge class and the parametrisations of this node are constructed; added in review. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, Theorem 3.2.6 and Lemma 3.2.7, pp. 87–88. The proof decomposes rational Hodge cohomology into Hecke constituents, realizes the simple factors, and descends them using algebraic Hecke correspondences. This is the owned geometric realization theorem, not a consequence of AF.3 alone.

<a id="target-gz-3-composition-pairing"></a>

### 3.4 Volume-normalized composition pairing

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/composition-pairing` (construction).

For f₁∈Hom⁰(J_U,A) and f₂∈Hom⁰(J_U,A∨), define (f₁,f₂)_U=(f₁∘λ_J⁻¹∘f₂∨)/vol(X_U), as an element of End⁰(A)=M using the canonical principal polarization λ_J. The quotient volume is the fixed YZZ geometric volume, scaling by degree under level covers. The projection formula makes the pairing level independent, M-bilinear with the dual action, and perfect on the paired realizations. In dimension one, using the principal polarization of E, (f,f) is deg(f)/vol(X_U).

**Hypotheses.**

- A and A∨ satisfy the parametrized strict GL₂ hypotheses
- The composition includes λ_J⁻¹; f₂∨:A→J_U∨ is not silently identified with a map to J_U

**Outline.**

1. Compose the two Hom⁰ maps through the Jacobian principal polarization.
2. Use push-pull=[degree] for a finite level map and divide by its geometric volume.
3. Compare the induced polarization to prove perfectness; specialize the pull-push composition to [deg f] for E.

**Dependencies:** [Rational ξ-normalized realization](#target-gz-3-rational-xi-realization), [Strict GL₂ realization and transfer](#target-gz-3-strict-gl2-realization), `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A6/degree-formulas-for-polarized-isogenies`.

**Uses.**

- `YZZ §3.2 and main height formula`: Normalize modular degrees and pair the two rational realizations.
- `GZ.5 Petersson factorization`: Fix the rational global invariant form.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `compositionPairing` | constructor | The End⁰(A) composition divided by curve volume. |
| `compositionPairing_level` | functoriality | Pullback of both maps preserves the volume-normalized pairing. |
| `compositionPairing_endomorphism` | relation | The M action on the first map is adjoint to the dual action on the second. |
| `compositionPairing_elliptic` | compatibility | The polarized elliptic self-composition is deg(f)/vol(X_U). |
| `compositionPairing_add` | structure | For the fixed level volume, the composition pairing is additive in each Hom variable, with the dual map additive in the second variable. |

**Checks.**

- `compositionPairing_zero` (degenerate): The pairing is zero when either map is zero.
- `compositionPairing_cover` (computation): A degree-d cover multiplies both the unnormalized composition and the volume by d.
- `compositionPairing_isogeny` (characterisation): Postcomposition by a polarized elliptic isogeny of degree m multiplies the self-composition by m.

**Acceptance.**

- Both composition order and dualization are type-correct before taking the scalar coefficient.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.2.2, printed pp. 3-4. Gives the definition of the Hodge class and the exact case distinction recorded in the statement and hypotheses. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §3.2.4, Lemma 3.2.9 and Theorem 3.2.10, pp. 89–91. Dual composition is M-valued and perfect after isogeny decomposition. The level change satisfies p_*p^*=deg(p), exactly the ratio of the two geometric volumes, proving independence after volume division.

<a id="target-gz-3-petersson-composition-comparison"></a>

### 3.5 Petersson and modular-degree comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison` (comparison).

Under the fixed complex embedding of M, the composition form on π_A×π_A∨ agrees with the automorphic Petersson invariant form after the stated YZZ volume normalization. Fix local invariant forms whose restricted tensor product is this global form. For f∈S₂(Γ₀(N)) with ω_f=2πif(z)dz and unnormalized Petersson (f,f)=∫|f(z)|²dxdy, i∫ω_f∧overline(ω_f)=8π²(f,f); for φ:X₀(N)→E, φ*ω_E=cφω_f implies i∫φ*ω_E∧overline(φ*ω_E)=|cφ|²8π²(f,f)=deg(φ) i∫_Eω_E∧overline(ω_E).

**Hypotheses.**

- Pairings use the same coefficient embedding and differential; modular parametrization is nonconstant
- The geometric-to-automorphic invariant-form comparison is a theorem, not equality by arbitrary renormalization

**Outline.**

1. Use weight-two Hodge/cohomology duality and the polarizations to compare the invariant forms.
2. Fix the tensor factorization with unramified unit normalizations.
3. Compute ω_f∧overline(ω_f) and apply finite-map integration to obtain the modular-degree formula.

**Dependencies:** [Volume-normalized composition pairing](#target-gz-3-composition-pairing), [Manin constant](#target-gz-3-manin-constant), `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicFormsOnReductiveGroups:AF.2`, `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`, `ModularCurvesPartII:R14.3/cup-product-petersson`.

**Acceptance.**

- An isogeny changing both degree and differential respects the equality.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.2.2, printed pp. 3-4. Gives the definition of the Hodge class and the exact case distinction recorded in the statement and hypotheses. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [gross-zagier-1986](#source-gross-zagier-1986), I §6, p.230. The classical differential/Petersson equality supplies the factor 8π².
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §3.3.1 and §3.3.3, pp. 94–99; §3.6.3–§3.6.4, Theorem 3.6.2, pp. 110–113. Analytic and algebraic projectors are compared through actual cohomological realization. The generating-series/Shimizu operator scalar is L(1,π,ad)/(2ζ_F(2)); its full determination uses the Lefschetz and boundary computations of Chapter 4, which remain explicitly source-qualified.

<a id="target-gz-3-manin-constant"></a>

### 3.6 Manin constant

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/manin-constant` (definition).

For a normalized rational newform f of weight two and conductor N, a nonconstant parametrization φ:X₀(N)_ℚ→E and a chosen minimal Néron differential ω_E, define cφ∈ℚ× by φ*ω_E=cφ·ω_f with ω_f=f(q)dq/q=2πif(z)dz. Its sign changes with ω_E, but its p-adic valuation does not. For an isogeny ψ:E→E′ with ψ*ω_E′=aψω_E, c_{ψ∘φ}=aψcφ. Multiplication by n changes c by n and degree by n².

**Hypotheses.**

- f has a₁=1 and matches E; φ pulls back nontrivially; invariant differential is the minimal one

**Outline.**

1. Use multiplicity one to identify the pullback differential line.
2. Take the coefficient against ω_f and retain its nonzero rational value.
3. Compose differential pullbacks to prove the isogeny law.

**Dependencies:** [Rational ξ-normalized realization](#target-gz-3-rational-xi-realization), `NeronModelsAndSemistableAbelianVarieties:R11.1`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`.

**Uses.**

- `JSW Remark 7.3.3 and BSD.6/6a`: Compare the Néron period with the modular-form period at p.
- `BSD.7a and ModularIwasawaMainConjectures:L3`: Retain the differential factor in canonical-period comparisons.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `maninConstant` | constructor | The nonzero rational coefficient of ω_f in φ*ω_E. |
| `maninConstant_pullback` | characterisation | φ*ω_E=cφω_f. |
| `maninConstant_isogeny` | functoriality | c_{ψ∘φ}=aψ cφ, including identity/composition of isogenies. |
| `maninConstant_sign` | compatibility | Changing ω_E to −ω_E changes cφ to −cφ. |

**Checks.**

- `maninConstant_multiplication` (computation): For a nonconstant modular parametrization φ and n≠0, composition with [n] multiplies the Manin constant by n and the modular degree by n². The nonzero hypothesis keeps the composite nonconstant.
- `maninConstant_sign_valuation` (compatibility): The p-adic valuation is invariant under ω_E↦−ω_E.
- `maninConstant_11a3` (non-example): For the minimal X₀(11)→11a3 isogeny, cφ=deg φ=5 after a sign choice, so nonoptimal constants are not universally 1.

**Acceptance.**

- The definition does not assume that cφ=1.

**Sources.**

- [cesnavicius-neururer-saha-2022](#source-cesnavicius-neururer-saha-2022), Introduction, p.2. Defines the rational scalar and separates its integrality from the definition.
- [gross-zagier-1986](#source-gross-zagier-1986), Published Invent. Math. 84 (1986), Chapter V, §2, p.310. The surrounding differential pullback equation defines the Manin constant for the chosen parametrization and Néron differential.

<a id="target-gz-3-manin-integrality-and-p-unit"></a>

### 3.7 Integral Manin constant and p-unit range

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit` (theorem).

For any modular parametrization φ:X₀(N)_ℚ→E the Manin constant cφ is an integer up to sign. If φ is X₀(N)-optimal and p>2 is a semistable prime for E, then p∤cφ. In particular p∤2N suffices, hence p∤2ND supplies the p-unit statement used by JSW for E and, on choosing its own optimal parametrization, E^D. The sharper semistable statement including p=2 is available by Česnavičius; it does not make a nonoptimal parametrization p-optimal automatically.

**Hypotheses.**

- Optimal means the Jacobian quotient has connected kernel, equivalently minimal parametrization within the relevant isogeny class
- The JSW consumer also needs its stated residual/isogeny hypotheses for transfer to its chosen E

**Outline.**

1. Prove integrality by reduction to Γ₁(N) and q-expansion lattices (CNS Lemma 6.5).
2. Apply Mazur’s exactness theorem for Néron differentials at an odd semistable prime, with Raynaud’s finite-flat uniqueness.
3. Use the exact local differential-transfer theorem for the actual parametrization; do not drop its denominator factor.

**Dependencies:** [Manin constant](#target-gz-3-manin-constant), `ModularCurvesPartII:R14.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness`.

**Acceptance.**

- At p∤2ND both optimal constants are p-units.
- The 11a3 nonoptimal parametrization with c=5 prevents a universal isogeny-class p-unit claim.

**Sources.**

- [cesnavicius-neururer-saha-2022](#source-cesnavicius-neururer-saha-2022), Introduction p.2; Lemma6.5. States the optimal semistable p-unit range and identifies the exactness input.
- [jetchev-2008](#source-jetchev-2008), §1, p.812. The BSD use requires primes away from the conductor.

<a id="target-gz-3-manin-isogeny-twist-transfer"></a>

### 3.8 Manin isogeny and twist transfer

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/manin-isogeny-twist-transfer` (theorem).

For optimal φ₀:X₀(N)→E₀ and ψ:E₀→E, write ψ*ω_E=aψω_E₀. Then v_p(c_{ψφ₀})=v_p(aψ)+v_p(cφ₀); the dual isogeny gives aψ aψ∨=deg ψ up to the fixed differential signs. If p∤deg ψ, both valuations of aψ are zero and p-unitness transfers. For a squarefree quadratic twist D and p∤2ND, choose local minimal differentials and the twist isomorphism over ℚ_p(√D); its differential factor is a p-unit, and the optimal twist’s Manin constant is a p-unit. A chosen nonoptimal twist parametrization still requires the same p-prime-to-isogeny condition.

**Hypotheses.**

- Differentials are minimal at p; twist isomorphism and optimal parametrizations are specified
- Isogeny degree is prime to p whenever p-unit transfer is asserted

**Outline.**

1. Compose the pullback differential equations.
2. Use ψ∨ψ=[deg ψ] on differential lattices to control the two integral factors.
3. At p∤2D the quadratic twist is unramified and its minimal differential scaling is a local unit; apply the optimal p-unit theorem to the twist.

**Dependencies:** [Integral Manin constant and p-unit range](#target-gz-3-manin-integrality-and-p-unit), [Manin constant](#target-gz-3-manin-constant), `NeronModelsAndSemistableAbelianVarieties:R11.1`.

**Acceptance.**

- A degree-p isogeny is not allowed to transfer p-unitness without computing its differential factor.

**Sources.**

- [cesnavicius-neururer-saha-2022](#source-cesnavicius-neururer-saha-2022), Introduction pp.2–3. Explains why transfer must keep the isogeny differential scalar.

<a id="target-gz-3-manin-degree-divisibility"></a>

### 3.9 Manin constant and modular degree

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/manin-degree-divisibility` (theorem).

For Γ₁(N)⊆Γ⊆Γ₀(N) and any surjection φ:X_Γ,ℚ→E, cφ divides 6deg φ; if 8∤N and 27∤N, cφ divides deg φ. More precisely v_p(cφ)≤v_p(deg φ)+δp, where δ₂=1 only if v₂(N)≥3 and no prime p′|N has p′≡3 mod4, δ₃=1 only if v₃(N)≥3 and no p′|N has p′≡2 mod3, and δp=0 otherwise. For Γ=Γ₁(N) the stronger cφ|deg φ always holds.

**Hypotheses.**

- Néron differential and normalized newform fixed; all constants taken up to sign

**Outline.**

1. Use CNS integral dualizing differential theorem and the local Whittaker denominator bounds.
2. Combine with the finite-map trace on differential lattices to bound cφ by the modular degree.
3. Track the exceptional 2/3 denominators exactly as Theorem1.2.

**Dependencies:** [Manin constant](#target-gz-3-manin-constant), `ModularCurvesPartII:R14.6`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- For X₀(11)→11a3, c=deg=5 satisfies the bound while c=1 would be false.

**Sources.**

- [cesnavicius-neururer-saha-2022](#source-cesnavicius-neururer-saha-2022), Theorems1.1–1.2, p.3. States the general divisibility and exceptional local bounds.

<a id="target-gz-3-classical-eigendifferential-period"></a>

### 3.10 Eigendifferential period comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/classical-eigendifferential-period` (theorem).

For ω_f = 2πi f(z) dz the eigendifferential of f on X(ℂ): ‖ω_f‖² = ∬_{X(ℂ)} ω_f ∧ i \bar{ω_f} = 8π²(f, f).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.
- This differential comparison is restricted to k=1: f has weight two. For k>1, f(z)dz is not a differential on X₀(N).

**Outline.**

1. At weight two, expand (2πi f dz) ∧ i conjugate(2πi f dz)=8π²|f|² dx∧dy, with the complex orientation.
2. Integrate over a fundamental domain using the unnormalized weight-two Petersson measure. The modular-degree/Manin-constant comparison is a separate consequence, not needed for this identity.

**Dependencies:** [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison), [Manin constant](#target-gz-3-manin-constant).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §6, p. 230. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-3-classical-modular-period-degree"></a>

### 3.11 Modular period-degree comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.3/classical-modular-period-degree` (theorem).

Setting of Chap. V §2: f ∈ S₂(Γ₀(N)) a newform with rational integer coefficients, E/ℚ an elliptic curve with L(E, s) = L(f, s), π: X₀(N) → E a covering over ℚ with π(∞) = 0; K = ℚ(√D) as in §1 (D odd fundamental, every p | N split in K), u_K = #O_K^×/2. With ‖ω‖² := ∬_{E(ℂ)} |ω ∧ ω̄| and ‖ω_f‖² = ∬_{X₀(N)(ℂ)} |ω_f ∧ ω̄_f| = 8π²(f, f): ‖ω‖² = c²‖ω_f‖²/deg(π).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Integrate the squared pullback differential over X₀(N).
2. The analytic degree formula and ω∧ω̄ expression give the source real-period/Petersson constant with c_π².

**Dependencies:** [Eigendifferential period comparison](#target-gz-3-classical-eigendifferential-period), [Manin constant](#target-gz-3-manin-constant), `ModularCurvesPartII:R14.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §2, p. 310. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

**Coverage:** planned. The following boundaries remain:

- Actual quaternionic realization and integral differential carriers; Manin p-unit/degree and isogeny/twist comparison proofs.

<a id="layer-4"></a>

## Layer 4: Local toric multiplicity one, dichotomy and test vectors

**Atlas planets:** Toric functional space; Saito–Tunnell dichotomy; Normalized toric form; Toric test vectors.

**Examples.**

- For finite unramified n=c=0 with unit discriminant and different, β=1. With n=0<c and an unramified nonsplit torus, β=q^(−c)/(1+q⁻¹)².
- At a complex real place and matching weight two, C=4π³.

<a id="target-gz-4-toric-hom-space"></a>

### 4.1 Local toric functional space

**Target:** `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space` (definition).

For a local field Fv of characteristic zero, a quadratic étale algebra Kv embedded in Bv, an irreducible admissible representation πv of Bv× (generic if split), and χv with χv|Fv×·ωπv=1, define P(πv,χv)=Hom_Kv×(πv,χv⁻¹). Its elements are continuous linear functionals ℓ with ℓ(πv(t)f)=χv(t)⁻¹ℓ(f). At real places use the smooth Casselman–Wallach representation and continuous Hom; at nonarchimedean places use the smooth category.

**Hypotheses.**

- Quadratic étale includes Fv×Fv; coefficient field and continuity category fixed

**Outline.**

1. Restrict the existing representation to the embedded torus.
2. Form the equivariant Hom space using the matching-centre condition.

**Dependencies:** `SmoothRepresentationsOfLocalGroups:SR.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`.

**Uses.**

- `Saito–Tunnell theorem`: State distinction as dimension one versus zero.
- `GZ.5 and GZ.8 zero cases`: Explain vanishing when a local toric Hom is zero.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `toricHom` | constructor | The torus-equivariant continuous Hom space. |
| `toricHom_equivariance` | characterisation | ℓ(π(t)f)=χ(t)⁻¹ℓ(f). |
| `toricHom_transport` | functoriality | An intertwining isomorphism induces an isomorphism of toric Hom spaces. |
| `toricHom_center` | relation | If the centre does not match, every toric functional is zero. |

**Checks.**

- `toricHom_wrong_center` (non-example): If χ(z)ωπ(z)≠1 for some central z, the Hom space is zero.
- `toricHom_zero_vector` (degenerate): Every functional evaluates the zero vector to zero.
- `toricHom_character_inverse` (characterisation): A vector with torus character χ⁻¹ can pair with the functional; one with a different torus character is killed.

**Acceptance.**

- The central-character condition is necessary for a nonzero functional.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §3.1, p.21. Defines the inverse-character convention and the local functional space.

<a id="target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional"></a>

### 4.2 Saito–Tunnell dichotomy

**Target:** `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional` (theorem).

For the data of toricHom, dim P(πv,χv)≤1 and equals one precisely when εBC(1/2,πv,Kv⊗χv)=χv(−1)ε(Bv). For a nonsplit quadratic field and a discrete-series GL₂ representation, exactly one of the split algebra and its division inner form is distinguished. For split Kv the distinguished algebra is split. Include the real discrete-series/compact-quaternion alternative using the actual torus weights; nonarchimedean characteristic-zero local fields include dyadic and wildly ramified cases.

**Hypotheses.**

- πv generic in the split case; division case is compared with its discrete-series transfer
- Use base-change epsilon convention, or translate the Rankin convention by ηv(−1)

**Outline.**

1. Import the genuine local correspondence and epsilon factors.
2. Prove multiplicity one and the epsilon criterion by the Tunnell/Saito local character argument.
3. Treat split tori and real discrete-series weights separately; translate CST’s Rankin sign using GZ.0.

**Dependencies:** [Local toric functional space](#target-gz-4-toric-hom-space), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- A wrong local Hasse invariant forces zero Hom, including at a dyadic place.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Thm. 1.3, printed p. 10. Gives the theorem AS PRINTED in the book; the erratum (item 5) corrects the displayed criterion to epsilon(1/2,pi,chi) = chi(-1) epsilon(B), which is the form recorded in this node's statement. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §3.1, theorem preceding Lemma3.1. The local statement is in the Rankin convention; GZ.0 removes η(−1) for base-change epsilon.
- [saito-1993](#source-saito-1993), §1, pp.99–100; §2 proof, pp.100–108. For nonarchimedean local fields of characteristic zero, the character multiplicity is controlled by the base-change epsilon factor. The source uses a restriction character λ with λ|F×=ωπ; our toric functional uses χ=λ⁻¹. Residue characteristic two is included. The real-weight case requires the separate local-transfer/torus-weight input.

<a id="target-gz-4-normalized-toric-integral"></a>

### 4.3 Normalized local toric form

**Target:** `GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral` (construction).

For an essentially unitary local pair (πv,χv) with fixed invariant pairing b_v, define αv(f₁,f₂)=L(1,ηv)L(1,πv,ad)/(ζv(2)L(1/2,πv,Kv⊗χv))·∫_{Kv×/Fv×} b_v(πv(t)f₁,f₂)χv(t)dtv. Use the matching nonzero local factors and the quotient measure of GZ.0. The integral is absolutely convergent for these local data and generates P(πv,χv)⊗P(π̃v,χv⁻¹) when distinguished; it is zero otherwise. Define βv=αv/b_v only for pairs with b_v≠0; αv itself is defined for all pairs.

**Hypotheses.**

- Invariant pairing and quotient Haar measure fixed; essentially unitary; generic in split case
- Algebraic rationality is asserted only at finite places with the supplied rational structures
- Essentially unitary pair means there is a character μ=|·|^s such that π⊗μ and χ⊗μ_K^{-1} are both unitary, as in CST §3.1. It is not a condition on π alone.

**Outline.**

1. Apply the local matrix-coefficient decay/convergence theorem.
2. Use equivariance of Haar integration and multiplicity one to identify the generated tensor functional.
3. Evaluate spherical data and compare rational structures at nonarchimedean places.

**Dependencies:** [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), `AutomorphicLFunctionsAndLocalFactors:AL.3`, [Rescaling height and period identities](#target-gz-0-identity-rescaling).

**Uses.**

- `YZZ Theorems1.2 and1.4`: The local factors form the global invariant bilinear tensor.
- `CST Theorems1.6 and1.9`: Compare finitely altered test vectors.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `normalizedToricForm` | constructor | The L-normalized torus integral αv on πv×π̃v. |
| `normalizedToricForm_bilinear` | structure | αv is bilinear in its two vectors. |
| `normalizedToricForm_rescale` | relation | Scaling dtv by b and b_v by c scales αv by bc. |
| `normalizedToricForm_twist` | compatibility | Replacing (π,χ) by (π⊗μ,χ⊗μ_K⁻¹) preserves the form with compatible pairings. |
| `normalizedToricForm_zeroHom` | characterisation | αv=0 if the toric Hom space is zero. |

**Checks.**

- `normalizedToricForm_spherical` (computation): For unramified π,χ,K/F and unit-volume compact quotient, αv(f₁,f₂)=b_v(f₁,f₂) on spherical vectors.
- `normalizedToricForm_zero` (degenerate): αv(0,f₂)=0 even when βv would be undefined.
- `normalizedToricForm_measure_two` (non-example): Doubling dtv doubles αv; it does not halve it.

**Acceptance.**

- No denominator b_v is used in the bilinear αv formula.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §3.1, pp.21–22. Supplies the convergence and generating-functional statement; erratum restricts rationality.

<a id="target-gz-4-unramified-toric-value"></a>

### 4.4 Unramified toric value and finite product

**Target:** `GrossZagierAndArithmeticHeights:GZ.4/unramified-toric-value` (theorem).

For spherical unramified πv and χv on a split Bv, an unramified quadratic field Kv/Fv and dtv with compact quotient volume one, βv(f₁,v,f₂,v)=1. Thus α=⊗vαv is defined on restricted pure tensors with standard vectors and local invariant forms at almost all v; only finitely many normalized factors differ from one. Split unramified tori are evaluated separately with the multiplicative Haar normalization, including both GL₂ Whittaker directions.

**Hypotheses.**

- The local invariant vector pairing is nonzero when β is used
- All unramified normalizations are compatible with the global factorization

**Outline.**

1. Evaluate the toric matrix coefficient using the spherical Whittaker/Satake expansion.
2. Cancel the local L-factors and quotient volume.
3. Use the restricted tensor product and bilinearity to define the global form, including zero pairs.

**Dependencies:** [Normalized local toric form](#target-gz-4-normalized-toric-integral), `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`.

**Acceptance.**

- An unramified newvector with ramified χ is not covered by this theorem.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §3.1, spherical-value paragraph. Gives the unramified nonsplit calculation and its measure assumptions.

<a id="target-gz-4-admissible-toric-order"></a>

### 4.5 Admissible toric order

**Target:** `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order` (definition).

Let n be the conductor of πv^JL, c the conductor of χv, and c₁=0 when Kv is nonsplit and c<n, c₁=c otherwise. An admissible order Rv⊂Bv has discriminant p^n and Rv∩Kv=𝒪_{c₁}. When 0<c₁ and n>0 in the split algebra, require Rv=R′∩R″ with R′∩Kv=𝒪_c and R″∩Kv=𝒪_{max(c−n,0)}. If Kv is split and 0<c<n, there are two Kv×-conjugacy choices; choose the one whose χ_i(a)=χ(a,1) or χ_i(a)=χ(1,a) has conductor c. This is CST’s order, not every order with the same discriminant.

**Hypotheses.**

- The Saito–Tunnell matching condition; local characteristic zero
- At conductor mismatch where c₁<n, the nonsplit field part uses the torus-character eigenspace rather than claiming all R× invariants work

**Outline.**

1. Classify torus-conjugacy classes of Eichler orders by their two lattices.
2. Apply CST Definition1.3’s conductor orientation to select an order.
3. For division B use the unique compatible maximal/suborder data and torus eigencondition.

**Dependencies:** [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`.

**Uses.**

- `CST Propositions3.7–3.8`: Construct the one-dimensional nonzero test-vector line.
- `GZ.5 explicit formula`: Retain conductor and removed-Euler-factor corrections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `admissibleToricOrder` | constructor | The order together with its embedded torus and conductor orientation. |
| `admissibleToricOrder_intersection` | projection | Rv∩Kv=𝒪_{c₁}. |
| `admissibleToricOrder_discriminant` | projection | disc Rv=p^n. |
| `admissibleToricOrder_conjugate` | functoriality | Kv×-conjugation preserves admissibility with transported vectors. |

**Checks.**

- `admissibleToricOrder_unramified` (computation): For n=c=0 take the maximal order with full 𝒪_K intersection.
- `admissibleToricOrder_mismatch` (non-example): For nonsplit K and c<n, the required intersection is 𝒪_K, not 𝒪_c.
- `admissibleToricOrder_split_orientation` (characterisation): For 0<c<n in split K, the chosen lattice orientation corresponds to the conductor-c character factor.

**Acceptance.**

- The two split mismatch orders are not interchanged without also changing the character direction.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), Definition1.3 and preceding conditions, pp.5–6. The extra lattice and split-character conditions are part of admissibility.

<a id="target-gz-4-toric-test-vectors"></a>

### 4.6 Nonzero toric test vectors

**Target:** `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors` (theorem).

For a distinguished local pair, a nonzero toric functional has a nonzero test vector. In the nonarchimedean CST conductor setting the line V(πv,χv) is the central-character eigenspace for the specified admissible-order/newvector subgroup and, when nonsplit c<n, the χv⁻¹ torus eigenspace; CST Proposition3.7 gives dimension one and nonzero toric evaluation. In the split conductor-mismatch case the correct translate/orientation is required. At real places use the matching discrete-series/compact-quaternion weight. The general distinguished characteristic-zero theorem includes dyadic data; the explicit order formulas carry their individual hypotheses.

**Hypotheses.**

- The exact admissible order and conductor choices from admissibleToricOrder
- For a particular explicit local value, use the relevant CST case rather than a universal spherical assertion

**Outline.**

1. Apply local multiplicity one and construct the CST invariant/eigenline.
2. Compute its toric integral using the local order and newvector translates.
3. Use the archimedean weight decomposition for the real case.

**Dependencies:** [Admissible toric order](#target-gz-4-admissible-toric-order), [Normalized local toric form](#target-gz-4-normalized-toric-integral), `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`.

**Acceptance.**

- Ramified χ can kill the untranslated spherical vector; a nonzero translate is required.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), Definition1.4; Proposition3.7; §3.3. States the one-dimensional line and directs to its nonvanishing proof.

<a id="target-gz-4-explicit-local-toric-constants"></a>

### 4.7 Explicit local toric constants at test vectors

**Target:** `GrossZagierAndArithmeticHeights:GZ.4/explicit-local-toric-constants` (theorem).

Use CST’s local measures, a distinguished essentially unitary pair (π,χ), σ=π^JL, its normalized Whittaker newvector W₀, conductor n=a(σ), c=a(χ), quadratic discriminant D, different δ, residue cardinal q and c₁=0 for nonsplit K with c<n, c₁=c otherwise. Put α(W₀)=⟨W₀,W₀⟩/[L(1,σ,ad)L(1,1_F)L(2,1_F)⁻¹], β(f)=normalizedToricIntegral(f,f)/⟨f,f⟩ for nonzero f in the admissible test-vector line, and γ=vol(R×)/vol(U₀(n)). At finite places: α(W₀)|δ|^(1/2)=1 if σ is unramified, and L(2,1_F)L(1,1_F)⁻¹L(1,σ,ad)^(−δ_σ) otherwise, where δ_σ=0 precisely for a subrepresentation of Ind(μ₁,μ₂) with at least one unramified inducing character. Write b=β(f)|Dδ|^(−1/2). Then b=1 for n=c=0; b=L(1,η)²q^(−c) for n=0<c; b=L(1,1_F)L(2,1_F)⁻¹L(1,π,ad)^(δ_π) for n>0,c=0 and split K; b=L(1,1_F)L(2,1_F)⁻¹L(1,η)²q^(−c)L(1,π,ad)^(δ_π)/L(1/2,π,χ) for nc>0 with split K or c≥n; and b=e(1−q^(−e))L(1,π,ad)/L(1/2,π,χ) for nonsplit K and n>c, where e is the ramification degree. If R is nonmaximal or B is division, γ=L(1,1_F)(1−e(R)q⁻¹), with Eichler symbol e(R)=1,−1,0 for residue algebra κ², the quadratic residue field, or κ. These give αβγ|D|^(−1/2)=2^a L(1/2,π,χ)^(−b₀)L(1,η)^(2d)q^(−c₁): a=1 iff K is ramified and n>c; b₀=1 iff n>0, (K is ramified or c>0), and (n=1 implies c≥n); d=1 iff c₁≠0. At real places, αβ=C(π,χ)⁻¹/L(1/2,π,χ) for K=ℂ and αβ=C(π,χ)⁻¹ for split K. For a matching weight-k discrete series C=4^(k−1)π^(k+1)/Γ(k) in the complex case and C=1 in the split case. The constants are independent of scaling the nonzero test vector.

**Hypotheses.**

- The complete CST §3.1 local setup, matching local sign, central-character compatibility, admissible-order choice and essentially unitary pair are retained.
- The denominators are the nonzero local L-values and invariant pairings from that setup. The finite and real cases have separate carriers.
- The measure used in γ is the CST quotient measure; γ is a ratio of volumes, not their product.

**Outline.**

1. Compute the Whittaker norm from the newvector values (Proposition 3.11). Divide the toric integral by the test-vector norm and compute its five conductor cases (Proposition 3.12).
2. Use the admissible-order index and Eichler symbol for γ (Lemma 3.5). Substitute the α and β formulas to obtain the combined factor (Lemma 3.13).
3. At real places use the discrete-series Whittaker norm and the torus integral (Lemma 3.14). Keep q, D and δ distinct until the combined expression is formed.

**Dependencies:** [Normalized local toric form](#target-gz-4-normalized-toric-integral), [Admissible toric order](#target-gz-4-admissible-toric-order), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors), `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- For unramified data with n=c=0 and D,δ units, β=1.
- For n=0<c with unramified nonsplit K, β=q^(−c)/(1+q⁻¹)², so a conductor-independent constant is rejected.
- For the complex real place and weight 2, C=4π³; a reciprocal or factor-two error changes the explicit global constant.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), arXiv:1408.1733v2, Proposition 3.11 p.26; Proposition 3.12 p.27; Lemma 3.5 p.23; Lemmas 3.13–3.14 pp.30–31. The five toric cases, Whittaker factors and order-volume ratio supply the constants used by the explicit Gross–Zagier specializations. The fraction in Proposition 3.12 was checked on the rendered page.

**Coverage:** planned. The following boundaries remain:

- Local toric carriers, archimedean Hom topology and each conductor/test-vector case; Saito’s dyadic input is sourced.

<a id="layer-5"></a>

## Layer 5: Coherent theta kernels and the Waldspurger formula

**Atlas planets:** Quaternionic theta specialization; Waldspurger formula; Toric period nonvanishing.

**Examples.**

- Spherical finite Whittaker factors are 1 after normalization, while the global Petersson multiplier 2L(1,ad)/ζ_F(2) remains.
- The product of local pairings rescales bilinearly in contragredient vectors, and by |c|² for a Hermitian norm.

<a id="target-gz-5-coherent-quaternionic-specialization"></a>

### 5.1 Coherent quaternionic theta specialization

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization` (theorem).

For coherent quaternionic B/F and an embedded nontrivial quadratic field K/F, specialize the imported extended Weil representation and unit-quotiented theta kernel to q=Nrd_B and its binary norm subspaces K and Kj. Each binary norm is anisotropic even when B is split: with probability Haar, E(0,g,Φ)=2∫θ(g,h,Φ)dh. In YZZ’s toric convention, where the quotient has volume2L(1,η), the double toric theta integral is L(1,η)I(0,g,χ,Φ). For division B the anisotropic ternary trace-zero identity gives the Shimizu/Petersson contraction used in the factorization. For split B the generic ternary second-term identity remains an identity modulo the residual image; the exact split Shimizu comparison is a separate required input, not a consequence asserted here.

**Hypotheses.**

- Adelic additive character, self-dual measures, torus quotient and probability measures compared by GZ.0
- Convergence/regularization regime is matched to binary/ternary Witt index, not assumed
- For O(V_m)×Sp_(2n), ordinary convergence requires r=0 or m−r>n+1. Here n=1; a quadratic-field norm has (m,r)=(2,0), division trace-zero data have (3,0), and split trace-zero data have (3,1), outside the ordinary range. The generic split binary (2,1) is an additional MP supplier case, not the norm of this K/F. YZZ’s 2011 draft Proposition2.2.1 proves the nonsplit case by Siegel–Weil and refers its split case to a different Waldspurger argument.

**Outline.**

1. Import the exact binary norm and ternary trace-zero exports from MP.6.
2. Compare their Haar and Weil splittings to the toric conventions.
3. For division B use the anisotropic ternary Siegel–Weil identity and the source’s cuspidal unfolding. For split B first supply the separately normalized Shimizu factorization from Waldspurger’s original argument, or a fully sourced comparison from GQT’s residual-image identity to that pairing; no elimination of the residual terms is assumed.

**Dependencies:** `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`, `MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`, [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections).

**Acceptance.**

- The binary norm identity alone is insufficient: the ternary identity is a separate prerequisite.
- The generic split binary supplier uses A₁=B₀; it is not the quadratic-field norm used here. Neither that exceptional formula nor the split ternary quotient identity alone proves the split Shimizu contraction.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.4.2, printed pp. 11-12. Fixes the measure used in the Petersson pairing, distinct from the toric measure. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [gan-qiu-takeda-2014](#source-gan-qiu-takeda-2014), arXiv:1207.4709v3 §1.7, pp.3–4. The strict criterion prevents using the divergent split binary or boundary ternary ordinary integral. The orthogonal/symplectic specialization has ε₀=1.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), Public 2011 draft, §2.2.1, Proposition 2.2.1 and proof, printed pp.47–49. Confirms the quadratic-field/nonsplit hypotheses, probability and toric measures, and the explicit separate split proof route. It does not certify the inherited 2013 published excerpt or pagination.
- [waldspurger-1985](#source-waldspurger-1985), II.1, pp.182–184; II.2, Proposition3 and corollary, pp.184–187. The primary split comparison uses Shimizu and Whittaker unfolding. Its stated scalar still has to be translated through the local pairings and the probability/Tamagawa measures of this packet; the regularized residual-image identity alone does not perform that translation.

<a id="target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof"></a>

### 5.2 Waldspurger period formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof` (theorem).

Let π be a cuspidal quaternionic automorphic representation, K/F quadratic with ωπχ|A_F×=1, and χ unitary. Define Pχ using probability measure on K×A_F×\A_K×, the global invariant form using quaternionic Tamagawa volume2, and α as the restricted tensor product of GZ.4’s local bilinear forms. For all f₁∈π and f₂∈π̃, Pχ(f₁)Pχ⁻¹(f₂)=ζ_F(2)L(1/2,π_K⊗χ)/(8L(1,η)²L(1,π,ad))·α(f₁,f₂). This is an identity of bilinear forms, including zero global/local pairings. With quotient-volume2L(1,η) periods, the constant becomes ζ_F(2)L(1/2)/(2L(1,π,ad)).

**Hypotheses.**

- π is cuspidal; relevant local L-factors and adjoint value are nonzero/finite
- The toric and Petersson measures are the distinct normalizations above

**Outline.**

1. Use the quadratic-field binary Siegel–Weil identity and toric see-saw, together with the normalized Shimizu factorization. Its nonsplit proof uses the ternary identity; its split proof is the separate input recorded in coherent-quaternionic-specialization, not an automatic consequence of GQT’s quotient formula.
2. Unfold the global pairing to local Whittaker/toric integrals.
3. Evaluate the unramified factors and compare the adjoint Petersson normalization.
4. Translate quotient periods to probability periods and extend by bilinearity without division.

**Dependencies:** [Coherent quaternionic theta specialization](#target-gz-5-coherent-quaternionic-specialization), [Unramified toric value and finite product](#target-gz-4-unramified-toric-value), [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- Zero toric Hom at any place forces the global form to vanish.
- Scaling torus Haar measures respects the squared period factor.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Thm. 1.4, printed p. 11. Gives the formula with its exact constant, as recorded in the statement. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §2 equation(2.1), pp.12–13. The quotient-measure normalized formula checks the factor four L(1,η)².
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math.84(1986), ChapterIV §5, p.292, discussion of the squares furnished by Waldspurger’s theorem. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §1.4.2 Theorem1.4.2 pp.20–23; §2.4 pp.53–55. The author draft computes the probability-period constant through the factor4L(1,η)² and the Shimizu scalar ζ_F(2)/(2L(1,π,ad)). This supports the normalization independently of the unreacquired 2013 published reference.
- [waldspurger-1985](#source-waldspurger-1985), II.1, pp.182–184; II.2, Proposition3 and corollary, pp.184–187. The primary split comparison uses Shimizu and Whittaker unfolding. Its stated scalar still has to be translated through the local pairings and the probability/Tamagawa measures of this packet; the regularized residual-image identity alone does not perform that translation.

<a id="target-gz-5-toric-period-nonvanishing"></a>

### 5.3 Toric period nonvanishing criterion

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/toric-period-nonvanishing` (theorem).

A cuspidal quaternionic π has a nonzero χ toric period precisely when every local Hom P(πv,χv) is nonzero and L(1/2,π_K⊗χ)≠0. In the matching case, choose local vectors with αv≠0 at the finitely many ramified places and spherical vectors elsewhere; their global period product is nonzero by Waldspurger. If either condition fails every period vanishes. This criterion does not assert the existence of a nonvanishing quadratic twist without a separate analytic nonvanishing input.

**Hypotheses.**

- The invariant dual pairings and L-function hypotheses of waldspurger

**Outline.**

1. Use local distinction for necessity of the Hom conditions.
2. Use the bilinear identity for the central-value condition and construct a pure tensor with nonzero local form for sufficiency.

**Dependencies:** [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors).

**Acceptance.**

- A local sign mismatch yields zero even when the central L-value is nonzero.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §3.1 and Theorem1.8. Combines actual test-vector nonvanishing with the global identity.

<a id="target-gz-5-finite-vector-variation"></a>

### 5.4 Finite test-vector variation

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/finite-vector-variation` (theorem).

For pure tensors fᵢ and fᵢ′ agreeing outside a finite set S, the cross-multiplied Waldspurger identities compare the two period products by the corresponding αv products at S. Where all pairings and toric factors are nonzero, the ratio form is ∏_{v∈S}βv(f₁,v′,f₂,v′)/βv(f₁,v,f₂,v), together with the changed Petersson pairing. This specializes to split, ramified and definite quaternionic admissible-order lines without dropping conductor, unit-index, removed-Euler or archimedean factors.

**Hypotheses.**

- Ratio notation used only when each stated denominator is nonzero
- Explicit CST local factors apply only in their stated conductor cases

**Outline.**

1. Apply the bilinear formula twice and cancel equal unramified factors.
2. Translate the trace/class-group sum period to the quotient integral using its class number and volume.
3. For explicit cases insert CST §3’s local toric values.

**Dependencies:** [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors), [Rescaling height and period identities](#target-gz-0-identity-rescaling).

**Acceptance.**

- The formula remains cross-multiplied if a test-vector pairing is zero.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), Theorem1.9, pp.11–12. States finite-place/archimedean vector variation with nonzero-factor conditions.

<a id="target-gz-5-classical-weight-two-central-value"></a>

### 5.5 Weight-two central-value formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Suppose ε(N) = −1 and k = 1. For m ≥ 0 define b_{m,A} = r_A(m|D|)·h/u + Σ_{0<n≤m|D|/N} δ(n) R_{A𝔫}(n) r_A(m|D| − nN), with δ(n), R_{A𝔫}(n) as in (4.6). Then Σ_{m≥0} b_{m,A}q^m is a modular form of weight 2 and level N, and L_A(f,1) = (8π²/√|D|)·(f, Σ_m b_{m,A}q^m) for every f in the space spanned by newforms of weight 2 and level N. (At k = 1 the printed constant (2π)^{2k}2^{2k−1}(k−1)!/((2k−2)!|D|^{k−1/2}) equals 8π²/√|D|, so E43 does not affect this case, and no holomorphic projection is needed because Φ̃ of (4.4) is holomorphic.) The case k ≥ 2 is the referenced classical source result 335.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use the weight-two holomorphic central kernel, which needs no regularized projection.
2. Pair with the newform and simplify the constant to 8π²/√|D|; retain ε(N)=−1.

**Dependencies:** [Classical central-value kernel](#target-gz-6-classical-central-value-kernel), [Rankin kernel pairing](#target-gz-6-classical-rankin-kernel-pairing), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §5, (5.6) Theorem, p. 291. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-5-classical-central-value-endpoints"></a>

### 5.6 Central-value endpoint normalization

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/classical-central-value-endpoints` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). In Theorem (5.6) one may drop the term r_A(m|D|)h/u and extend the sum to 0 ≤ n ≤ m|D|/N, because δ(0) = 2^t (t = number of prime factors of D) and R_{A𝔫}(0) = h/(2^t u) (each genus contains h/2^{t−1} classes and r_B(0) = 1/(2u) for each class B), while P_{k−1}(1) = 1.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Keep the l=0 and n=0 endpoints of the finite central kernel sum.
2. Use r_A(0)=1/w and the class number formula to check the constant coefficient.

**Dependencies:** [Weight-two central-value formula](#target-gz-5-classical-weight-two-central-value), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §5, p. 291 (paragraph after Theorem (5.6)). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-5-classical-genus-sum-filter"></a>

### 5.7 Central-value genus-sum filter

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). For n, l ∈ ℕ: Σ_A R_{A𝔫}(n) r_A(l) = Σ_{genera G} R_{G𝔫}(n) R_G(l), which equals R(n)R(l) if the genus of an ideal of norm nl (if any) is {𝔫}, and 0 otherwise; here R(n) = Σ_{d|n} ε(d). If ε(N) = −1 (so N(𝔫) ≡ −N mod D) and l = m|D| − nN > 0, the genus conditions at the primes p | D with p ∤ n are automatic (l ≡ N(𝔫)n mod p), and δ(n) Σ_A R_{A𝔫}(n) r_A(m|D| − nN) = R(n) R(m|D| − nN) ∏_{p|(n,D)} (1 + ε̂_p((nN − m|D|)/(nN))), where ε̂_p : ℚ^× → {±1} is the homomorphism with ε̂_p(q) = (q/p) for primes q ≠ p, ε̂_p(−1) = (−1/p), and ε̂_p(p) = ((|D|/p)/p). [The printed prime-divisor condition uses p|N where p|D is required; issue PAPER-GROSS-ZAGIER-86/E44.]

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Sum the ideal-class central value over its genus characters.
2. Apply orthogonality to isolate the stated class/genus contribution and its 2^t factor.

**Dependencies:** [Weight-two central-value formula](#target-gz-5-classical-weight-two-central-value), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §5, p. 292 (first half). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-5-classical-definite-period-announcement"></a>

### 5.8 Definite period specialization

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement` (theorem).

In the definite ε(N)=−1, weight-two specialization, identify the CM class vector in the rational quaternionic eigenspace with the probability-normalized toric period. Under the local/global pairing and measure conventions of the normalized Waldspurger period formula, its χ,eigencomponent norm computes L(f,χ,1) with that formula’s exact product of local factors. This is a specialization of the coherent formula, not a theorem with an unspecified proportionality constant.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Interpret the definite CM class vector as a toric period in the coherent quaternionic realization.
2. Apply the normalized Waldspurger formula already planned here; the historical announcement alone does not supply its unspecified scalar.

**Dependencies:** [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof), [Weight-two central-value formula](#target-gz-5-classical-weight-two-central-value), `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §3, p. 314. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-5-classical-definite-square-class"></a>

### 5.9 Definite central-value square class

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-square-class` (theorem).

Fix a nonzero rational generator e of the one-dimensional M_f quaternionic eigenspace and its bilinear form. If the trivial-character CM projection is x_(1,f)=a_K e with a_K∈M_f, its norm is a_K²(e,e). The coherent normalized central-value identity then gives L(f,1_K,1)/C_K=a_K²(e,e), with C_K its specified discriminant, measure, Petersson and local factors; the square class after this normalization is independent of K. Zero projections are allowed.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use the one-dimensional rational coefficient-field eigenspace and its fixed bilinear pairing.
2. Writing x_(1,f)=a·e makes its norm a² times the fixed norm of e; the completed-period normalization must remain fixed when K varies.

**Dependencies:** [Definite period specialization](#target-gz-5-classical-definite-period-announcement), [Strict GL₂ realization and transfer](#target-gz-3-strict-gl2-realization).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §3, p. 314. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-5-half-weight-waldspurger-value"></a>

### 5.10 Half-weight Waldspurger value

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value` (theorem).

Let φ(z)=2√y Σ_(n≠0) a(n)K_(ir)(2π|n|y)e(nx) be a nonzero even level-one Hecke–Maass eigenform, a(1)=1. Choose the associated weight-1/2 Kohnen-plus eigenline at parameter r/2 and its vector F(z)=Σ b(n)W_(sgn(n)/4,ir/2)(4π|n|y)e(nx), normalized by (F,F)=1 under the DIT Petersson convention. For a nonzero fundamental discriminant d, 12π|d||b(d)|²=(φ,φ)⁻¹Γ(1/2+ir/2−sgn(d)/4)Γ(1/2−ir/2−sgn(d)/4)L(1/2,φ⊗χ_d). The phase of F is free and both sides are phase-invariant. The twisted L-function is the finite Dirichlet-series L-function; the two displayed gamma factors are not already included in it.

**Hypotheses.**

- r is real; φ is even and normalized by a(1)=1, rather than unit Petersson norm
- The half-weight form has the specified Whittaker and Petersson normalization, including the plus condition at 2

**Outline.**

1. Import the Hecke-equivariant Kohnen-plus/GL₂ eigenline correspondence, including the operator at 2 and the eigenvalue parameter r/2.
2. Apply the local/global Baruch–Mao central-value identity.
3. Compare its Whittaker coefficient and Petersson conventions with DIT Theorem4 and (5.17), retaining 12π and both signed gamma factors.
4. Pass to the unit half-weight vector; its arbitrary phase disappears in |b(d)|².

**Dependencies:** `MetaplecticAutomorphicForms:MP.7`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.3/maass-cusp-forms`.

**Acceptance.**

- d>0 uses gamma real part 1/4; d<0 uses 3/4.
- Multiplying F by e^(iθ) leaves the identity unchanged.
- Rescaling φ without a(1)=1 would change its Dirichlet coefficients and is not allowed without an explicit adapter.

**Sources.**

- [duke-imamoglu-toth-2016](#source-duke-imamoglu-toth-2016), published Annals 184 (2016), §5 Theorem4 pp.965–966 and (5.17) p.966. This is the explicit central-value identity, with the integral and half-weight normalizations stated immediately before it.

<a id="target-gz-5-petersson-whittaker-factorization"></a>

### 5.11 Petersson pairing as a product of Whittaker pairings

**Target:** `GrossZagierAndArithmeticHeights:GZ.5/petersson-whittaker-factorization` (theorem).

Let σ be a cuspidal automorphic representation of GL₂(𝔸_F), σ̃ its contragredient, and ψ the fixed global additive character. For factorizable φ₁∈σ, φ₂∈σ̃ with Whittaker functions ⊗_vW_{1,v}, ⊗_vW_{2,v}, let w_v=∫_{F_v×}W_{1,v}(diag(a,1))W_{2,v}(diag(a,1))d×a, and α_v=w_v/[L(1,σ_v,ad)L(1,1_v)L(2,1_v)⁻¹]. With the CST Tamagawa-compatible GL₂ measure, the global bilinear Petersson pairing is 2L(1,σ,ad)L(2,1_F)⁻¹∏_vα_v. Almost every normalized spherical factor equals 1. The local pairings use ψ and ψ⁻¹ in the two Whittaker models; identifying σ̃ with the complex conjugate yields the Hermitian norm specialization. This formula does not by itself prove algebraicity or integrality of a ratio between different quaternionic rational structures.

**Hypotheses.**

- σ is cuspidal and the global central characters cancel.
- Whittaker tensors, additive character and all measures are normalized as in CST §2.1; use the bilinear convention before passing to conjugate vectors.

**Outline.**

1. Unfold the GL₂ Rankin–Selberg zeta integral against a Schwartz section into the product of local integrals.
2. Take the residue at s=1 and compare the Eisenstein residue with the pole of L(s,σ×σ̃)=ζ_F(s)L(s,σ,ad).
3. Use the Iwasawa measure and newvector normalization to obtain the factor 2 and the local denominators; apply the explicit local constants only for the chosen newvectors.

**Dependencies:** [Explicit local toric constants at test vectors](#target-gz-4-explicit-local-toric-constants), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

**Acceptance.**

- Rescaling φ₁ by a and φ₂ by b scales both sides by ab, whereas a Hermitian specialization scales by a·conj(a).
- Changing reciprocal tensor normalizations at two places leaves the product unchanged.
- For spherical finite data away from the different the local normalized factor is 1; the global constant 2L(1,ad)/ζ_F(2) remains.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), arXiv:1408.1733v2, §2.1, Proposition 2.1 and equation (2.2), pp.14–15. The normalized product recovers the adelic Petersson pairing. The displayed denominator was checked on the rendered printed p.14.

**Coverage:** planned. The following boundaries remain:

- Exact split Shimizu normalization, definite coefficient scalar comparison and half-weight dyadic normalization.

<a id="layer-6"></a>

## Layer 6: Arithmetic generating series and incoherent analytic kernels

**Atlas planets:** Special correspondence cycle; Picard-valued generating series; Arithmetic height kernel; Incoherent central derivative; Projected kernel identity.

**Examples.**

- The regularized weight-two projection must remove the logarithmic cusp terms before its Mellin finite part defines Fourier coefficients.
- In the Colmez projection, each real place contributes −(γ+log(4π))/2 to the projected logarithmic Whittaker term; keeping this term cancels the completed-gamma correction.

<a id="target-gz-6-special-correspondence-cycle"></a>

### 6.1 Special correspondence cycle

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle` (construction).

For x∈B_f× and U_x=U∩xUx⁻¹, define Z(x)_U as the proper cycle push-forward of [X_{U_x}] under (p,p∘T_x):X_{U_x}→X_U×X_U. Multiplicities are generic residue degrees, including a noninjective level map; Z(x)_U is not its reduced image. Its action on Pic⁰ is the actual Hecke correspondence push-pull. Level composition obeys the double-coset convolution with multiplicities.

**Hypotheses.**

- Finite levels and proper maps; coarse/stack multiplicities specified by the imported cycle formalism

**Outline.**

1. Construct the two finite level maps from the imported Hecke tower.
2. Apply proper push-forward to the fundamental cycle, with residue degrees.
3. Use base change and composition of proper push-forward to identify its Pic⁰ action.

**Dependencies:** `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`.

**Uses.**

- `YZZ Chapter4`: Coefficients of the Picard-valued generating series.
- `GZ.7 intersection calculations`: Retain multiplicities in the height kernel.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `specialCorrespondenceCycle` | constructor | The proper push-forward cycle Z(x)_U. |
| `specialCorrespondenceCycle_action` | compatibility | Its Pic⁰ action is the Hecke push-pull map. |
| `specialCorrespondenceCycle_level` | functoriality | Level pullback/push-forward matches the corrected multiplicities. |
| `specialCorrespondenceCycle_convolution` | relation | Composition is double-coset convolution with its counting coefficients. |

**Checks.**

- `specialCorrespondenceCycle_identity` (computation): At x=1 the cycle is the diagonal with its proper multiplicity.
- `specialCorrespondenceCycle_degree_two` (non-example): A generically degree-two parametrization produces twice the reduced image.
- `specialCorrespondenceCycle_zero_action` (degenerate): The induced correspondence sends the zero Pic⁰ class to zero.

**Acceptance.**

- A degree-d map onto its image contributes d times that image.

**Sources.**

- [yzz-gross-zagier-erratum](#source-yzz-gross-zagier-erratum), item30 and §2. The current correction requires proper push-forward rather than image.
- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.1 pp605–607. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-cm-degree-zero-class"></a>

### 6.2 ξ-normalized CM divisor

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class` (definition).

For an imported CM point [h] on X_U and its geometric component c(h), define [h]⁰=[h]−ξ_{U,c(h)} in Pic⁰(X_U)⊗ℚ, then in the Jacobian via the Abel–Jacobi identification. Subtraction is componentwise: a Hodge class on a different component does not give a degree-zero divisor. The finite-character sum uses the same trace/average and reciprocity convention as GZ.0.

**Hypotheses.**

- CM points and their reciprocity are supplied by HE.1; rational Hodge class fixed

**Outline.**

1. Subtract the degree-one class on the point’s component.
2. Pass to the imported Pic⁰/Jacobian and check Galois/Hecke equivariance.

**Dependencies:** [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), `HeegnerPointEulerSystems:HE.1`, [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

**Uses.**

- `YZZ height series`: Define the two actual Jacobian inputs.
- `GZ.8 Heegner point`: Transport the same normalized divisor through the rational realization.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmDegreeZeroClass` | constructor | The class [h]−ξ on the CM component. |
| `cmDegreeZeroClass_degree` | projection | It has degree zero on every component. |
| `cmDegreeZeroClass_galois` | functoriality | Galois transport sends the point and its component Hodge class together. |
| `cmDegreeZeroClass_character` | compatibility | Character sums use the selected inverse-character projector. |

**Checks.**

- `cmDegreeZeroClass_degree_zero` (computation): 1−1=0 on the point’s component and zero on all others.
- `cmDegreeZeroClass_wrong_component` (non-example): Subtracting ξ on a different component leaves degrees 1 and −1, so is not componentwise Pic⁰.
- `cmDegreeZeroClass_hodge_average` (degenerate): A divisor equal to the chosen ξ has normalized class zero.

**Acceptance.**

- An unnormalized degree-one CM divisor cannot be used directly in a Jacobian height.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.5-1.5.6, printed pp. 15-16. Gives the height series, the xi-normalisation of the CM classes and the regularised toric integral. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.1 pp605–607. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §1.5.5, printed p.24; §3.1.3, printed pp.70–71; §5.1.2, printed p.183. The CM divisor subtracts the normalized degree-one Hodge class on its own component; the height series uses these degree-zero inputs.

<a id="target-gz-6-picard-generating-series"></a>

### 6.3 Picard-valued generating series

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series` (construction).

For U-biinvariant extended Schwartz Φ, let ϕ be its archimedean average. Define Z(g,Φ)_U=Z₀(ϕ)_U+w_U Σ_{a∈F×}Σ_{x∈U\B_f×/U} r(g)ϕ(x,a/q(x)) Z(x)_U in Pic(X_U×X_U)⊗ℂ, with the fixed Hodge/constant term and unit stabilizer w_U. The series converges coefficientwise in the stated Picard realization and defines a weight-two automorphic form. Its appropriately volume-rescaled level classes are compatible. The modularity assertion is a theorem about these actual cycle coefficients.

**Hypotheses.**

- Standard Gaussian archimedean data and allowed finite support; proper-cycle coefficients
- Compact case or separately corrected cuspidal finite-level case

**Outline.**

1. Form the corrected cycle coefficients and Hodge term with ϕ, not unaveraged Φ.
2. Use the imported Weil action/product formula and the source’s curve-cycle theta calculation to prove modularity.
3. Check coefficientwise convergence and level push-pull with volumes.

**Dependencies:** [Special correspondence cycle](#target-gz-6-special-correspondence-cycle), `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`.

**Uses.**

- `YZZ §4.2`: Build the actual arithmetic theta correspondence.
- `GZ.6 height kernel`: Evaluate this Picard-valued series on two normalized CM classes.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `picardGeneratingSeries` | constructor | The explicit Hodge-plus-Hecke series with Picard coefficients. |
| `picardGeneratingSeries_coefficient` | projection | The nonzero Fourier coefficients are the weighted proper special cycles. |
| `picardGeneratingSeries_level` | functoriality | The specified volume-rescaled classes are level compatible. |
| `picardGeneratingSeries_modular` | structure | The series transforms by the weight-two Weil automorphy law. |

**Checks.**

- `picardGeneratingSeries_zero` (degenerate): Zero Schwartz input gives the zero series.
- `picardGeneratingSeries_diagonal` (characterisation): The identity double coset contributes the actual diagonal cycle.
- `picardGeneratingSeries_rational_factor` (non-example): For F=ℚ the corrected whole factor is 1/2; substituting 2 changes coefficients by four.

**Acceptance.**

- The modular X₀(N) example recovers the Hecke generating series with the corrected normalization.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.4, printed p. 15. Gives the generating function and the modularity assertion; erratum item 8 corrects the Schwartz factor to phi. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-erratum](#source-yzz-gross-zagier-erratum), items8,30,31. The F=ℚ normalizing factor is 1/2, not 2, and cycle multiplicities must be retained.
- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.1 pp605–607. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §4.2.1–§4.2.2, (4.2.1)–(4.2.2), Lemma 4.2.1, pp. 121–122. The construction retains the stabilizer factor w_U and push-forward multiplicities. Modularity is proved by passing from the Gaussian orthogonal Shimura generating series and extending by the Weil action, with the constant and boundary degree terms included.

<a id="target-gz-6-arithmetic-height-kernel"></a>

### 6.4 Arithmetic height kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel` (construction).

Evaluate the level-compatible Picard correspondence Z̃(g,Φ) on [h₁]⁰ and pair its resulting Jacobian class with [h₂]⁰ by the GZ.1 Poincaré height. Define Z̃(g,(h₁,h₂),Φ) this way. Its χ-geometric kernel is the starred torus integral of Z̃(g,(t,1),Φ)χ(t): first probability-average over the central ideles, then integrate on [T]=T(F)\T(A)/Z(A) with the GZ.0 quotient measure. This central averaging is defined on a compact quotient for functions invariant under Z(F∞). Dividing the starred integral by vol([T]) gives the regularized average; for T(F∞)-invariant finite-level CM data that average is the finite-orbit average. Keep the factor vol([T])=2L(1,η) when converting back to the starred kernel. Preserve the proper cycle action and χ/χ⁻¹ inputs.

**Hypotheses.**

- Both CM classes have componentwise degree zero
- The toric integrand is Z(F∞)-invariant; [T] has finite volume and its centrally averaged integrand is integrable
- Finite-orbit specialization additionally assumes T(F∞)-invariance and an open compact stabilizer

**Outline.**

1. Apply the proper correspondence to the actual Pic⁰ class and use the full Poincaré height with finite-extension normalization.
2. Probability-average the integrand on the compact central idele quotient from §1.6.7; integrate the result on [T] to define the starred kernel.
3. For finite-level, T(F∞)-invariant CM data, identify the normalized regularized average with the finite-orbit average. Multiply by vol([T]) for the starred integral; separate this operation from later removal of Eisenstein/Hodge projection terms.

**Dependencies:** [Picard-valued generating series](#target-gz-6-picard-generating-series), [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class), [Character-component height pairing](#target-gz-1-character-height-pairing), [Faltings–Hriljac comparison](#target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections).

**Uses.**

- `YZZ Theorem3.21`: The geometric side of the projected derivative identity.
- `Colmez §8`: Separate horizontal, vertical and extended diagonal contributions.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `arithmeticHeightKernel` | constructor | The χ correspondence-height integral, with compact central probability averaging followed by the quotient-measure torus integration. |
| `arithmeticHeightKernel_bilinear` | relation | The kernel is bilinear in the two normalized Pic⁰ inputs and linear in Φ. |
| `arithmeticHeightKernel_level` | functoriality | Compatible finer-level representatives give the same kernel. |
| `arithmeticHeightKernel_local` | compatibility | On disjoint divisors it is the normalized finite-plus-infinite intersection height. |
| `arithmeticHeightKernel_average_conversion` | compatibility | The starred kernel is vol([T]) times its normalized regularized average; on a constant toric integrand c it is 2L(1,η)c, while its average is c. |

**Checks.**

- `arithmeticHeightKernel_zero` (degenerate): A zero normalized CM class gives zero kernel.
- `arithmeticHeightKernel_average` (computation): Averaging both trace inputs divides the height kernel by h².
- `arithmeticHeightKernel_cycle_multiplicity` (non-example): Replacing a degree-two push-forward by its reduced image halves that cycle’s height contribution.
- `arithmeticHeightKernel_volume` (computation): For a constant integrand c=1 and vol([T])=3, the starred kernel is 3 and the normalized regularized average is 1. A constructor silently returning the average fails this test.

**Acceptance.**

- A finite class-group average differs from the trace height by the square of its cardinality.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.5-1.5.6, printed pp. 15-16. Gives the height series, the xi-normalisation of the CM classes and the regularised toric integral. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.1 pp605–607. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §1.5.5, printed p.24; §5.1.2, printed pp.183–184; §1.6.7, (1.6.1)–(1.6.2), printed pp.34–35. The geometric kernel uses a starred integral. That integral centrally probability-averages before quotient-measure integration; the separate normalized average divides by the quotient volume and specializes to a finite sum.

<a id="target-gz-6-incoherent-central-derivative"></a>

### 6.5 Incoherent central derivative

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative` (theorem).

For the source’s incoherent quaternionic extended Weil data, form the actual mixed theta–Eisenstein kernel I(s,g,χ,Φ), initially in its convergence half-plane, then meromorphically continue it. Its sign at the centre forces I(0,g,χ,Φ)=0, and I′(0,g,χ,Φ) is its analytic derivative. After the stated growth estimates, differentiation commutes with the local/global expansions on compact g-sets. The zero-frequency Whittaker term has its separate normalized formula; it is not a limit of the nonzero-frequency formula.

**Hypotheses.**

- Incoherent Hasse signs and χ central condition; fixed holomorphic section in s
- Convergence, pole subtraction and projection hypotheses checked before exchanging sums or integrals

**Outline.**

1. Use the imported incoherent section and functional equation to obtain central vanishing.
2. Establish locally uniform derivative bounds after subtracting singular terms.
3. Differentiate the factorized Fourier expansion and keep the constant term separate.

**Dependencies:** [Mixed theta–Eisenstein kernel](#target-gz-6-mixed-theta-eisenstein), `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections`, `AutomorphicSpectralTheory:AS.3`.

**Acceptance.**

- At a Fourier index with exactly one bad nonsplit place the derivative occurs at that place.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.6, printed p. 16. Gives the kernel identity in its cuspidally-paired form and the explicit warning that the pointwise identity fails. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yuan-zhang-2018](#source-yuan-zhang-2018), §7.1 and §7.3. The mixed-kernel derivative includes a separate constant term and normalization.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §1.5.6, printed pp.24–25; §3.6.1, printed pp.109–110; §5.1.1, printed pp.182–183; Chapter6, printed pp.194–216. The incoherent mixed theta–Eisenstein family contributes its derivative at zero, with growth and local expansion conditions retained in the node and supplier requests.

<a id="target-gz-6-arithmetic-theta-lifting"></a>

### 6.6 Arithmetic theta lifting comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting` (theorem).

For Φ in the extended Schwartz space and φ in the specified weight-two constituent σ, the correspondence-valued arithmetic theta lift, defined by Petersson projection of Z̃(g,Φ), equals L(1,π,ad)/(2ζ_F(2)) times the homomorphism associated with the coherent theta lift θ(Φ⊗φ). This is an equality of actual Jacobian homomorphisms, using Pic(X_U×X_U)→Hom(J_U,J_U∨) before rational scalar extension.

**Hypotheses.**

- Rational realizations and dualities fixed; finite level for the trace computation
- Compact case and modular cusp boundary terms are treated separately

**Outline.**

1. Use multiplicity one to compare the two lifts up to scalar.
2. Compute traces on H⁰,¹ by Lefschetz intersection of the corrected correspondence with the diagonal.
3. Evaluate the Hodge/cusp/CM contributions to obtain the stated adjoint/zeta constant.

**Dependencies:** [Picard-valued generating series](#target-gz-6-picard-generating-series), [Coherent quaternionic theta specialization](#target-gz-5-coherent-quaternionic-specialization), [Volume-normalized composition pairing](#target-gz-3-composition-pairing), `AutomorphicSpectralTheory:AS.4`.

**Acceptance.**

- The scalar is L(1,ad)/(2ζ_F(2)), not an unspecified proportionality.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.6-1.5.7, printed pp. 16-17. Gives the arithmetic theta lifting identity and the two-step structure of its proof. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-erratum](#source-yzz-gross-zagier-erratum), items18,19,30. The integral Picard correspondence map and proper multiplicities are part of the type-correct construction.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, Theorem 3.6.2, pp. 110–111; §4.4.1, Propositions 4.4.1–4.4.3, pp. 134–137. The scalar is fixed by the trace on H¹: the degree terms in H⁰ and H² vanish against a cusp form, and the diagonal contribution determines the remaining trace. The split noncompact case retains its boundary correction; the complete Poisson/boundary proof remains a gate.

<a id="target-gz-6-generating-series-arithmetic-theta-lifting-and-the-kernel-identity"></a>

### 6.7 Projected arithmetic kernel identity

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity` (theorem).

For the fixed quaternionic constituent σ and admissible factorizable Φ, (I′(0,·,χ,Φ),φ)_Pet=2(Z̃(·,χ,Φ),φ)_Pet for every φ∈σ. Equivalently the σ-cuspidal projections agree with factor2. The equality is not pointwise in g: constant, Eisenstein, old and nearby-coherent terms are removed by their separately proved projection/orthogonality statements. Extend from the degenerate test data to all permitted data by local toric multiplicity one and the existence of a nonzero distinguished test pair.

**Hypotheses.**

- All derivative, geometric regularization and projection hypotheses of the preceding constructors
- Degenerate-case comparison and nonzero local test-pair reduction are proved

**Outline.**

1. Decompose both kernels place by place under the degenerate hypotheses.
2. Apply the local identities and nearby-coherent approximation theorem of GZ.7.
3. Project away the explicitly identified nonzero error; extend by the one-dimensional toric tensor functional.

**Dependencies:** [Incoherent central derivative](#target-gz-6-incoherent-central-derivative), [Arithmetic height kernel](#target-gz-6-arithmetic-height-kernel), [Arithmetic theta lifting comparison](#target-gz-6-arithmetic-theta-lifting), [Nearby quaternionic approximation](#target-gz-7-degenerate-schwartz-functions-local-decomposition-and-approximation), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors), `AutomorphicSpectralTheory:AS.4`.

**Acceptance.**

- The right-hand coherent error may be nonzero before projection.
- A vanishing global invariant pairing causes no division by zero.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.6, printed p. 16. Gives the kernel identity in its cuspidally-paired form and the explicit warning that the pointwise identity fails. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §3.6.1, Theorem3.6.1, printed pp.109–110; §5.1.3, Theorem5.1.1 and Remark11, printed p.184; §5.2.2, Theorem5.2.6 and Proposition5.2.7, printed p.187. The factor-two kernel identity is a Petersson comparison against the chosen constituent; it does not assert pointwise equality. Nonzero degenerate test data allow reduction to the stated special case.

<a id="target-gz-6-colmez-pseudo-theta"></a>

### 6.8 Pseudo-theta datum

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta` (construction).

Let V be a positive definite quadratic space over F and V0 ⊂ V1 ⊂ V subspaces over F with the induced forms, all even-dimensional; V0 may also be ∅. Let S be a finite set of nonarchimedean places, φ^S ∈ S̄(V(A^S)×A^{S,×}) with standard archimedean components, and for v ∈ S let φ′_v : GL2(F_v)×(V1−V0)(F_v)×F_v^× → ℂ be locally constant, invariant under right translation of g by some open compact K_v ⊂ GL2(F_v), and, for each g, of bounded support in (x,u); let µ ⊂ O_F^× have finite index with φ^S and φ′_S = ∏_{v∈S}φ′_v invariant under (x,u) ↦ (αx, α^{−2}u), α ∈ µ. The pseudo-theta series is A^{(S)}_{φ′}(g) = Σ_{u∈µ²\F^×} Σ_{x∈V1−V0} φ′_S(g,x,u) r_V(g)φ^S(x,u), with the Weil representation of V (not V1). It is nondegenerate if V1 = V, nontruncated if V0 = ∅, and nonsingular if each φ′_v(1,·,·) extends to a Schwartz function on V1(F_v)×F_v^×; then its outer theta series is θ_{A,1}(g) = Σ_u Σ_{x∈V1} r_{V1}(g)φ′_S(1,x,u) r_{V1}(g)φ^S(x,u) and its inner theta series θ_{A,0} is the same with V0 in place of V1 (θ_{A,0} = 0 if V0 = ∅).

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Use the imported Weil representation on V and the stated unit invariance to form the quotient sum.
2. Bounded bad-place support and positive definite Gaussian decay give local finiteness/convergence; restrict the nonsingular data to construct the two usual theta series.

**Dependencies:** `MetaplecticAutomorphicForms:MP.5`.

**Uses.**

- `Yuan–Zhang 2018 §6.2, pp. 579–580`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `pseudoTheta_constructor` | constructor | The locally finite unit-quotient sum in the stated ambient Weil representation. |
| `pseudoTheta_outer` | relation | The nonsingular outer theta uses the V₁ Weil representation. |
| `pseudoTheta_inner` | relation | The inner theta uses V₀; it is zero for the empty truncation. |
| `pseudoTheta_unit_invariant` | relation | The summand is invariant under (x,u)↦(αx,α⁻²u). |

**Checks.**

- `pseudoTheta_empty_truncation` (degenerate): For V₀=∅ the inner theta is zero; for V₀={0} it is the zero-vector theta term.
- `pseudoTheta_full_space` (compatibility): For V₁=V and genuine Weil translates at bad places, the nontruncated series is the usual theta series.
- `pseudoTheta_wrong_ambient_weight` (non-example): Using rV₁ in place of rV loses the positive-codimension (ρ∞δ) power in the comparison.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §6.2, pp. 579–580. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-pseudo-comparison"></a>

### 6.9 Pseudo-theta comparison on a small bad-place compact

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison` (theorem).

Let A = A^{(S)}_{φ′} be a nonsingular pseudo-theta series on V0 ⊂ V1 ⊂ V (d = dim V, d_i = dim V_i; θ_{A,0} := 0 if V0 = ∅), with φ^S standard at the archimedean places. Let S′ ⊇ S be a finite set of nonarchimedean places outside of which φ_v is standard, compatible with the orthogonal splittings V = V1 ⊕ V1^⊥ = V0 ⊕ V0^⊥, and the discriminant characters χ_{V1^⊥}, χ_{V0^⊥} are unramified. Then there is an open compact K_{S′} ⊂ GL2(F_{S′}) such that for all g ∈ K_{S′}GL2(A^{S′}): A(g) = χ_{V1^⊥}(a(g)) ρ∞(g)^{(d−d1)/2} δ(g)^{(d−d1)/2} θ_{A,1}(g) − χ_{V0^⊥}(a(g)) ρ∞(g)^{(d−d0)/2} δ(g)^{(d−d0)/2} θ_{A,0}(g). Here δ(g) = ∏_{all v} δ_v(g_v) with δ_v([[a,b],[0,d]]k) = |a/d|_v^{1/2}; ρ∞(g) = ∏_{v|∞} e^{iθ_v} for g_v = [[a,b],[0,d]]k_{θ_v}, a > 0; and χ_W(a(g)) := ∏_{w∉S′ finite} χ_{W,w}(a_w), where a_w is the upper-left Iwasawa entry of g_w and χ_W is the quadratic character of the discriminant of W. The characters are trivial when the complement has square discriminant, e.g. for quaternionic complements. As printed (without the characters), the identity holds only where every χ_{W,w}(a_w) = 1.

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Factor the archimedean Gaussian/weight terms and retain the full adelic δ. At finite places outside S′, splitting V = V_i ⊕ V_i^⊥ contributes χ_{V_i^⊥}(a(g)) as well as δ^{(d−d_i)/2}. Choose a common stabilizer K_{S′} at the exceptional places. Compare the V1 theta series and the truncated V0 term on K_{S′}GL2(A^{S′}); omit a discriminant character only where it is actually trivial.

**Dependencies:** [Pseudo-theta datum](#target-gz-6-colmez-pseudo-theta), `MetaplecticAutomorphicForms:MP.5`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §6.2, equation (6.2.1), p. 581. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-pseudo-automorphic"></a>

### 6.10 Automorphic sum reduces to nondegenerate outer theta

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-automorphic` (theorem).

Let {A_ℓ^{(S_ℓ)}}_ℓ be a finite set of nonsingular pseudo-theta series, A_ℓ sitting on V_{ℓ,0} ⊂ V_{ℓ,1} ⊂ V_ℓ. The positive definite even-dimensional F-quadratic spaces V_ℓ, the sets S_ℓ and the unit groups µ_ℓ may depend on ℓ. If Σ_ℓ A_ℓ(g) is automorphic on GL2(A), then Σ_ℓ A_ℓ = Σ_{ℓ∈L_{0,1}} θ_{A_ℓ,1}, where L_{0,1} = {ℓ : V_{ℓ,1} = V_ℓ}. Proof: Vandermonde in the values (1+iN)^{−[F:Q]} for distinct POSITIVE sufficiently divisible N (packet E60 and E72).

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Separate codimension powers using weak approximation and a Vandermonde system; choose distinct positive integral lower-unipotent parameters, not arbitrary distinct integers.
2. Apply pinned mixed-place weak approximation independently to the four matrix entries at the finite exceptional set S. The nonzero determinant locus is open, so the approximating rational matrix can be chosen invertible. Outside S an arbitrary element of GL₂(A^S) adjusts the remaining components. Thus GL₂(F)GL₂(A^S) is dense in GL₂(A); continuity and the common left GL₂(F)-automorphic law extend equality from 1^SGL₂(A^S). This uses weak approximation, with no restriction on determinants from strong approximation.

**Dependencies:** [Pseudo-theta comparison on a small bad-place compact](#target-gz-6-colmez-pseudo-comparison), `mathlib:Matrix.det_vandermonde`, `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma6.1(1) pp582–583. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-pseudo-weight-cancel"></a>

### 6.11 Positive-codimension theta cancellation

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-weight-cancel` (theorem).

Under the hypotheses of Lemma 6.1, suppose that for each k > 0 the orthogonal complements V_ℓ ⊖ V_{ℓ,1} (ℓ ∈ L_{k,1}) and V_ℓ ⊖ V_{ℓ,0} (ℓ ∈ L_{k,0}) all have the same quadratic discriminant character. Then Σ_{ℓ∈L_{k,1}} θ_{A_ℓ,1} − Σ_{ℓ∈L_{k,0}} θ_{A_ℓ,0} = 0, where L_{k,1} = {ℓ : dim V_ℓ − dim V_{ℓ,1} = k} and L_{k,0} = {ℓ : dim V_ℓ − dim V_{ℓ,0} = k}. Without the hypothesis the proof gives only the character-twisted identity on GL2(A_f^S).

**Hypotheses.**

- Shared blocks H5, H6.
- Within each positive codimension all complements have the same discriminant character.

**Outline.**

1. Apply pseudo-comparison including its discriminant characters. Choose distinct positive sufficiently divisible N so |(1+iN)^{−[F:Q]}| are distinct; the Vandermonde argument isolates the character-twisted coefficient in each codimension. The common quadratic character hypothesis in that codimension permits cancellation of that nonzero factor to give the stated untwisted theta identity. Without it keep only the twisted identity. The §9 application has common character η in codimension two and trivial character in codimension four.

**Dependencies:** [Automorphic sum reduces to nondegenerate outer theta](#target-gz-6-colmez-pseudo-automorphic).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma6.1(2) pp582–583. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-mixed-theta-eisenstein"></a>

### 6.12 Mixed theta–Eisenstein kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein` (construction).

Let B be a totally definite incoherent quaternion algebra over A = A_F with E_A → B, and φ ∈ S̄(B×A^×) invariant under U×U. Then I(s,g,φ)_U = Σ_{u∈µ_U²\F^×} Σ_{γ∈P^1(F)\SL2(F)} δ(γg)^s Σ_{x1∈E} r(γg)φ(x1,u). For φ = φ1⊗φ2 with respect to B = E_A ⊕ E_A j, I(s,g,φ)_U = Σ_u θ(g,u,φ1)E(s,g,u,φ2), where θ(g,u,φ1) = Σ_{x1∈E} r(g)φ1(x1,u) and E(s,g,u,φ2) = Σ_γ δ(γg)^s r(γg)φ2(0,u). By incoherence I(0,g,φ) = 0.

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Use the E⊕E𝔧 orthogonal decomposition and the imported theta/Eisenstein families.
2. Continue the absolutely convergent initial series meromorphically; apply incoherence for its central zero.

**Dependencies:** `MetaplecticAutomorphicForms:MP.5`, `AutomorphicSpectralTheory:AS.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

**Uses.**

- `Yuan–Zhang 2018 §7.1, pp. 583–584 (from [YZZ13, §5.1.1]); vanishing I(0,g,φ) = 0 stated in §1.3, p. 540`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `mixedThetaEisenstein_constructor` | constructor | The unit-quotient sum over P¹(F)∖SL₂(F) and x₁∈E. |
| `mixedThetaEisenstein_tensor_factorization` | relation | For φ=φ₁⊗φ₂ the kernel is Σu θ(g,u,φ₁)E(s,g,u,φ₂). |
| `mixedThetaEisenstein_linear` | relation | The kernel and its meromorphic continuation are linear in φ. |
| `mixedThetaEisenstein_central_zero` | relation | I(0,g,φ)=0 for incoherent data. |

**Checks.**

- `mixedThetaEisenstein_zero_schwartz` (degenerate): For φ=0 the meromorphic family is zero.
- `mixedThetaEisenstein_tensor_components` (characterisation): For a pure tensor the theta factor uses E and the Eisenstein factor its orthogonal line.
- `mixedThetaEisenstein_incoherent_central_value` (compatibility): The central family value is zero, while its derivative need not be zero.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1, pp. 583–584 (from [YZZ13, §5.1.1]); vanishing I(0,g,φ) = 0 stated in §1.3, p. 540. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-whittaker"></a>

### 6.13 Normalized local Whittaker terms

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker` (construction).

For a place v, a ∈ F_v, u ∈ F_v^× and φ_{2,v} ∈ S̄(E_v𝔧_v×F_v^×), put W_{a,v}(s,g,u,φ_{2,v}) = ∫_{F_v} δ(wn(b)g)^s r(wn(b)g)φ_{2,v}(0,u) ψ_v(−ab) db. For a ∈ F_v^×, W°_{a,v} = γ_{u,v}^{−1}W_{a,v}, where γ_{u,v} is the Weil index of (E_v𝔧_v, uq). For a = 0, W°_{0,v}(s,g,u,φ_{2,v}) = γ_{u,v}^{−1}·(L(s+1,η_v)/L(s,η_v))·|D_v|^{−1/2}|d_v|^{−1/2}·W_{0,v}(s,g,u,φ_{2,v}), with D_v the relative discriminant of E_v/F_v and d_v the local different of F_v. Then W°_{0,v}(0,g,u) = r(g)φ_{2,v}(0,u) for all v, and W°_{0,v}(s,g,u) = δ_v(g)^{−s}r(g)φ_{2,v}(0,u) for almost all v; at an archimedean v this s-dependent formula uses the standard Gaussian component. Globally W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_{0,v}(s,g,u), since ∏_vγ_{u,v} = −1 for incoherent B.

**Hypotheses.**

- Shared blocks H5, H6.
- The archimedean s-dependent zero-index identity is asserted for the standard Gaussian, as in Yuan–Zhang §7.3 Lemma7.6; it is not an assertion for arbitrary archimedean Schwartz functions.

**Outline.**

1. Take the Fourier integral with the source’s self-dual measure.
2. Apply the local intertwiner and Weil-index normalization separately to nonzero and zero Fourier indices; use its value at s=0 and the incoherent product sign.

**Dependencies:** `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Uses.**

- `Yuan–Zhang 2018 §7.1 pp584–586; §7.3 pp599–600`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `normalizedWhittaker_constructor` | constructor | Normalize the Fourier integral separately at a≠0 and a=0. |
| `normalizedWhittaker_zero_value` | simp | W°₀,v(0,g,u)=r(g)φ₂,v(0,u). |
| `normalizedWhittaker_nonzero_index` | compatibility | For a≠0 only the inverse Weil index changes the raw integral. |
| `normalizedWhittaker_zero_index` | compatibility | At a=0 include L(s+1,ηv)/L(s,ηv), \|Dv\|⁻¹/² and \|dv\|⁻¹/². |

**Checks.**

- `normalizedWhittaker_standard_zero` (computation): At standard almost-all-place data W°₀,v(s,g,u)=δv(g)⁻s r(g)φ₂,v(0,u).
- `normalizedWhittaker_zero_branch` (non-example): Omitting the zero-index L-factor fails W°₀,v(0,g,u)=r(g)φ₂,v(0,u).
- `normalizedWhittaker_incoherent_product_sign` (characterisation): The product of local Weil indices is −1, hence the global zero coefficient carries the minus sign.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1 pp584–586; §7.3 pp599–600. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-torus-average"></a>

### 6.14 Finite CM orbit average

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average` (construction).

CU=E*\Ef*/(Ef*∩U); integrate a function on CU using |CU|^−1Σ, not its unnormalized trace. The factor e=[OE*:OF*] is separate.

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Use the finite CM class quotient and its counting probability measure.
2. Check quotient invariance and compare its cardinality with the unnormalized sum, keeping the independent elliptic unit index.

**Dependencies:** `HilbertModularVarietiesAndShimuraCurves:R18.5`, [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average).

**Uses.**

- `Yuan–Zhang 2018 §7.1 p585;§8.1 pp606–609`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmOrbitAverage_constructor` | constructor | Average a function over the finite quotient C_U. |
| `cmOrbitAverage_constant` | simp | The average of a constant c is c. |
| `cmOrbitAverage_representative_independent` | extensionality | A quotient-invariant function has representative-independent average. |
| `cmOrbitAverage_trace` | compatibility | Unnormalized orbit sum equals \|C_U\| times the average. |

**Checks.**

- `cmOrbitAverage_constant_one` (computation): The average of 1 is 1 even when |C_U|>1.
- `cmOrbitAverage_singleton` (degenerate): On a singleton quotient averaging is evaluation.
- `cmOrbitAverage_unit_index_separate` (non-example): The elliptic index e=[O_E×:O_F×] is not the orbit cardinality and cannot replace |C_U|.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1 p585;§8.1 pp606–609. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-local-k-c"></a>

### 6.15 Local derivative and zero-term corrections

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c` (construction).

At nonsplit v define kφv from L(1,ηv)/vol(Ev¹) times φ1,v and the derivative of W° at a=u q(y2), with y∈B(v)−E. Define cφv from the normalized zero Whittaker derivative plus logδ(g)φ; extend general φ by fiberwise integration/linearity.

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Differentiate the separately normalized local Whittaker integrals and extend from pure tensors by linearity.
2. Use the shell expressions for coherent integral formulas and the local P-action for covariance.

**Dependencies:** [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells).

**Uses.**

- `Yuan–Zhang 2018 §7.1, pp. 585–586 (k p. 585, c p. 586); coherent formulas valid for all φ_v in §7.3, pp. 594 and 600`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `localDerivativeCorrection_constructor` | constructor | The nearby nonzero-index derivative k and the zero-index correction c. |
| `localDerivativeCorrection_pure_tensor` | characterisation | k=L(1,ηv)/vol(Ev¹) times φ₁,v and W°′ at uq(y₂). |
| `localDerivativeCorrection_linear` | relation | Both corrections extend linearly from pure tensors. |
| `localDerivativeCorrection_zero_correction` | compatibility | c contains W°′₀,v plus logδv times r(g)φv. |

**Checks.**

- `localDerivativeCorrection_zero_function` (degenerate): Both corrections vanish for the zero Schwartz function.
- `localDerivativeCorrection_arch_zero` (compatibility): For the standard archimedean Gaussian, c=0.
- `localDerivativeCorrection_different_index` (non-example): Substituting the a≠0 normalization at a=0 omits its L-ratio and gives the wrong correction.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1, pp. 585–586 (k p. 585, c p. 586); coherent formulas valid for all φ_v in §7.3, pp. 594 and 600. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-projected-derivative"></a>

### 6.16 Projected derivative decomposition

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative` (theorem).

Let F be totally real, E/F a totally imaginary quadratic extension with character η, B a totally definite incoherent quaternion algebra over A_F with E_A → B, U ⊂ B_f^× open compact, and φ ∈ S̄(B×A^×) invariant under U×U, standard at every archimedean place, satisfying Assumption 7.1. Then Pr I′(0,g,φ)_U = −Σ_{v|∞} I′(0,g,φ)(v) − Σ_{v∤∞ nonsplit in E} I′(0,g,φ)(v) − c1·Ω_φ(g) − Σ_{v∤∞} Σ_{u∈µ_U²\F^×} Σ_{y∈E^×} c_{φ_v}(g,y,u) r(g)φ^v(y,u) + Σ_{u∈µ_U²\F^×} Σ_{y∈E^×} (2 log δ_f(g_f) + log|uq(y)|_f) r(g)φ(y,u). Here Ω_φ(g) = Σ_{u∈µ_U²\F^×}Σ_{y∈E^×} r(g)φ(y,u), and I′(0,g,φ)(v) = 2⨍_{C_U} K^{(v)}_φ(g,(t,t))dt is the normalized average over C_U = E^×\E^×(A_f)/(E^×(A_f)∩U). For v|∞, K^{(v)}_φ(g,(t1,t2)) = w_U Σ_{a∈F^×} lim_{s→0} Σ_{y∈µ_U\(B(v)^×_+ − E^×)} r(g,(t1,t2))φ(y)_a k_{v,s}(y), with k_{v,s}(y) = Γ(s+1)/(2(4π)^s)·∫_1^∞ dt/(t(1−λ(y)t)^{s+1}) and λ(y) = q(y2)/q(y) ∈ F_v. For finite nonsplit v, K^{(v)}_φ(g,(t1,t2)) = Σ_u Σ_{y∈B(v)−E} k_{r(t1,t2)φ_v}(g,y,u) r(g,(t1,t2))φ^v(y,u), with k_{φ_v}(g,y,u) = (L(1,η_v)/vol(E_v^1))·r(g)φ_{1,v}(y1,u)·W°′_{uq(y2),v}(0,g,u,φ_{2,v}) (y2 ≠ 0) for φ_v = φ_{1,v}⊗φ_{2,v}, extended linearly. c1 = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, with L_f the finite part and d_E, d_F absolute discriminants. c_{φ_v}(g,y,u) = r_E(g)φ_{1,v}(y,u)W°′_{0,v}(0,g,u,φ_{2,v}) + log δ(g_v)r(g)φ_v(y,u) for pure tensors, extended linearly.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Differentiate the incoherent Fourier expansion, use YZZ holomorphic projection and the archimedean logarithmic integral, removing exactly the global gamma derivative. E10 fixes the intermediate c2 bookkeeping.

**Dependencies:** [Mixed theta–Eisenstein kernel](#target-gz-6-mixed-theta-eisenstein), [Local derivative and zero-term corrections](#target-gz-6-colmez-local-k-c), `AutomorphicSpectralTheory:AS.4`, [Two auxiliary split places](#target-gz-7-colmez-s2-assumption).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1, Theorem 7.2, p. 588; proof pp. 589–590. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-series-automorphy"></a>

### 6.17 Automorphy and cuspidality of the height series

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-series-automorphy` (theorem).

For φ ∈ S(𝔹×A^×) invariant under U×U (|Σ| > 1), the series Z(g,φ)_U is absolutely convergent and is an automorphic form in g ∈ GL2(A) with coefficients in Pic(X_U×X_U)_C (Theorem 8.1 = [YZZ13, Th. 3.17]). Consequently, for t1,t2 ∈ E^×(A_f), the height series Z(g,(t1,t2),φ)_U = ⟨Z(g,φ)_U t1°, t2°⟩_NT is an automorphic form, and it is a cusp form by [YZZ13, Lemma 3.19].

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Import the genuine Picard-valued modularity theorem, then apply the degree-zero height functional; original YZZ proof leaves remain open.

**Dependencies:** [Picard-valued generating series](#target-gz-6-picard-generating-series), [Arithmetic height kernel](#target-gz-6-arithmetic-height-kernel).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.1, Theorem 8.1, p. 606 (= [YZZ13, Theorem 3.17]); cuspidality of the height series: §8.1, p. 607 (= [YZZ13, Lemma 3.19]). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-rev-derivative-of-the-mixed-theta"></a>

### 6.18 Derivative of the mixed theta–Eisenstein series before projection

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-derivative-of-the-mixed-theta` (theorem).

For φ ∈ S̄(B×A^×) invariant under U×U (B incoherent): W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_{0,v}(s,g,u), with L(s,η) completed. This gives the analytic continuation of the constant term. Moreover I′(0,g,φ) = −Σ_{v nonsplit} I′(0,g,φ)(v) − c0 Σ_{u∈µ_U²\F^×}Σ_{y∈E} r(g)φ(y,u) − Σ_v Σ_u Σ_{y∈E} c_{φ_v}(g,y,u) r(g)φ^v(y,u) + 2 log δ(g) Σ_u Σ_{y∈E} r(g)φ(y,u), where c0 = d/ds|_{s=0} log(L(s,η)/L(s+1,η)) = 2L′(0,η)/L(0,η) + log|d_E/d_F|, by L(1−s,η) = |d_E/d_F|^{s−1/2}L(s,η). Only finitely many v contribute.

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Differentiate the completed global zero coefficient product and the nonzero Fourier terms separately.
2. Use the quadratic functional equation for c₀ and the finite bad-place support of normalized local corrections.

**Dependencies:** [Mixed theta–Eisenstein kernel](#target-gz-6-mixed-theta-eisenstein), [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Local derivative and zero-term corrections](#target-gz-6-colmez-local-k-c), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1, 'Decomposition of the constant term', pp. 585–586 (from [YZZ13, §6.1.2, Prop. 6.7]). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-rev-archimedean-holomorphic-projection-of-log"></a>

### 6.19 Archimedean holomorphic projection of log δ∞·W^(2)

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log` (theorem).

Let W^(2)(g_∞) = ∏_{v|∞} W_v^(2), with W_v^(2)(diag(y,1)) = y e^{−2πy}1_{y>0}. Under the holomorphic-projection formula of [YZZ13, Prop. 6.12], whose per-place factor is 4π lim_{s→0}∫_0^∞ y^s W(y) W^(2)(y) dy/y² (so that W^(2) projects to itself), log δ_v(g_v)·W^(2)(g_∞) projects to −(1/2)(γ+log 4π)·W^(2)(g_∞). Hence log δ∞(g)W^(2)(g_∞) projects to c2·W^(2)(g_∞) with c2 = −([F:Q]/2)(γ+log 4π). Consequently c1 = c0 − 2c2 = 2L′(0,η)/L(0,η) + log|d_E/d_F| + \[F:Q](γ+log 4π) = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, using L_∞(s,η) = Γ_ℝ(s+1)^{[F:Q]} and L′_∞/L_∞(0,η) = −([F:Q]/2)(γ+log 4π).

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Apply the regularized weight-two Whittaker projection at each real place.
2. Evaluate 2π∫₀∞e^(−4πy)log y dy=−(γ+log4π)/2 and add the real places.
3. Remove the completed gamma logarithmic derivative to obtain the finite-part L constant.

**Dependencies:** `AutomorphicSpectralTheory:AS.4`, [Derivative of the mixed theta–Eisenstein series before projection](#target-gz-6-colmez-rev-derivative-of-the-mixed-theta).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1, proof of Theorem 7.2, pp. 589–590. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-rev-local-whittaker-series-for-incoherent"></a>

### 6.20 Local Whittaker series for incoherent sections

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-local-whittaker-series-for-incoherent` (theorem).

Let v be finite, u ∈ O_{F_v}^× and φ_{2,v} ∈ S̄(E_v𝔧_v×F_v^×). For a ∈ F_v^×: W°_{a,v}(s,1,u,φ_{2,v}) = |d_v|^{1/2}(1−N_v^{−s}) Σ_{n≥0} N_v^{−ns+n} ∫_{D_n(a)} φ_{2,v}(x2,u)dx2. For a = 0: W_{0,v}(s,1,u,φ_{2,v}) = γ_{u,v}|d_v|^{1/2}(1−N_v^{−s}) Σ_{n≥0} N_v^{−ns+n} ∫_{D_n} φ_{2,v}(x2,u)d_ux2. Here dx2 is the self-dual measure for (E_v𝔧_v, uq), with vol(O_{E_v}𝔧_v) = |D_v|^{1/2}|d_v u q(𝔧_v)|; YZZ13 Prop. 6.10(1) as stated is correct only for a ≠ 0. Hence, for every φ_v and extending linearly: k_{φ_v}(1,y,u) = (L(1,η_v)/vol(E_v^1))·d/ds|_{s=0}[|d_v|^{1/2}(1−N_v^{−s})Σ_n N_v^{−ns+n}∫_{D_n(a)} φ_v(y1+x2,u)dx2] with a = uq(y2); and c_{φ_v}(1,y,u) = d/ds|_{s=0}[|D_v|^{−1/2}(L(s+1,η_v)/L(s,η_v))(1−N_v^{−s})Σ_n N_v^{−ns+n}∫_{D_n} φ_v(y+x2,u)d_ux2].

**Hypotheses.**

- Shared blocks H5, H6.

**Outline.**

1. Expand the Whittaker integral by additive-character conductor shells.
2. For a≠0 use finite opposite-norm support; for a=0 retain the additional local L-ratio before differentiating.

**Dependencies:** [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, pp. 593–594 (a ≠ 0) and pp. 599–600 (a = 0, correcting [YZZ13, Prop. 6.10(1)]). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-colmez-rev-hodge-class-terms-vanish-and"></a>

### 6.21 Hodge-class terms vanish and the height series splits into horizontal and vertical parts

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and` (theorem).

Let (B,E,U) be as in §7.2 with |Σ| > 1, and let φ be U×U-invariant and satisfy Assumption 7.1. For each fixed coefficient/intersection calculation, first fix the finite collection of CM points and supports entering Z_*(g)t1 and t2 (and any finite C_U averages used). Choose a finite extension H/F defining these points and supports, unramified above Σ(𝔹_f), by taking a finite compositum of their permitted fields of definition. This is a coefficientwise choice, not one field defining all of the varying-conductor set CM_U. A single field may be chosen for the finite orbit C_U. The model X_{U,O_H} is Q-factorial by Corollary 4.6; use ξ̂-admissible arithmetic extensions on it ([YZZ13, §7.1.6]). For any further permitted finite extension H′/H, arithmetic degrees/intersection pairings scale by [H′:H]; hence their values divided by [H:F] are independent of the chosen H and agree after passing to a common permitted compositum. Assemble the height series coefficientwise using these normalized pairings. For t1,t2 ∈ C_U, Z(g,(t1,t2))_U = ⟨Z_*(g)t1,t2⟩ − ⟨Z_*(g)t1,ξ_{t2}⟩ − ⟨Z_*(g)ξ_{t1},t2⟩ + ⟨Z_*(g)ξ_{t1},ξ_{t2}⟩; the last three terms vanish by Assumption 7.1, so Z = ⟨Z_*t1,t2⟩ = −i(Z_*t1,t2) − j(Z_*t1,t2). Here i comprises finite horizontal intersections and archimedean Green values, and j is the vertical part. In the paper’s F-relative normalization j = Σ_v j_v log N_v, with log N_v = 1 at real v, and j_v = ∫_{C_U} j̄_v(Z_*(g)tt1,tt2)dt; likewise i_v = ∫_{C_U} ī_v. The C_U integrals are normalized finite-orbit averages. Local base-change scaling includes ramification and residue-degree weights; it is the total weighted pairing divided by [H:F] that is invariant.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. For each finite support use the pointwise field-of-definition statement rev-cm-points-on-x-u and its finite compositum, preserving unramifiedness above the division places. Use qfactorial and the ξ̂-admissible extension construction.
2. Compare two choices of H over a common permitted compositum. Pullback of the arithmetic pairing multiplies its arithmetic degree by the extension degree, with local ramification/residue-degree weights and archimedean multiplicities. Divide by the degree over F; this proves coefficientwise independence and permits assembly without a common field for CM_U.
3. Apply the two S2 vanishing conditions to the three Hodge-class cross terms; decompose the remaining admissible pairing into horizontal and vertical terms. Take the normalized average over the finite C_U orbit and keep log N_v = 1 at real v.

**Dependencies:** `HilbertModularVarietiesAndShimuraCurves:R18.5`, [Two auxiliary split places](#target-gz-7-colmez-s2-assumption), [Arithmetic height kernel](#target-gz-6-arithmetic-height-kernel), [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.1, pp. 607–608 ([YZZ13, Prop. 7.5]). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-6-classical-partial-rankin-series"></a>

### 6.22 Ideal-class Rankin series

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series` (definition).

(5.3) For f = Σ a_n qⁿ in the new space and 𝒜 ∈ Cl_K: L_𝒜(f, s) = Σ_{n≥1, (n, DN)=1} ε(n) n^{1−2s} · Σ_{n≥1} a_n r_𝒜(n) n^{−s}. The first factor is L(2s − 1, ε) with the Euler factors at all p | N removed (not removed in the announcement [17], which is in error; there it was denoted L_σ(f, s)). For weight 2k (§9, Chapter IV (0.1)): n^{1−2s} is replaced by n^{2k−1−2s}.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Form the ideal-class norm coefficients and multiply their Dirichlet series by the quadratic L-factor with the p|N factors removed.
2. Use the finite character orthogonality relations to compare with character-indexed series; the local bad-factor identification is a separate AL.3 input.

**Dependencies:** `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AnalyticNumberTheory:AN.4`, `MetaplecticAutomorphicForms:MP.5`.

**Uses.**

- `Gross–Zagier 1986 Chapter I, §5, (5.3), p. 229; §9, p. 233; Chapter IV, (0.1), p. 267`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `partialRankin` | constructor | L_A(f,s)=L^(N)(2s−2k+1,ε) Σ a(n)r_A(n)n^(−s). |
| `partialRankin_character_sum` | compatibility | Σ_A χ(A)L_A(f,s)=L(f,χ,s), with the bad Euler factors of the normalization comparison. |
| `partialRankin_fourier_inverse` | extensionality | L_A=h⁻¹Σ_χ χ(A)⁻¹L(f,χ,s). |
| `partialRankin_removed_factors` | projection | L^(N)(t,ε)=L(t,ε)Π_{p\|N}(1−ε(p)p^(−t)). |

**Checks.**

- `partialRankin_trivial_character` (compatibility): Σ_A L_A=L(f,1_K,s).
- `partialRankin_bad_prime` (non-example): At p|N the factor 1−ε(p)p^(1−2s) is present in weight two; restoring its inverse changes the series.
- `partialRankin_basis_indicator` (characterisation): The inverse finite character transform selects A and no other class.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §5, (5.3), p. 229; §9, p. 233; Chapter IV, (0.1), p. 267. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-absolute-convergence"></a>

### 6.23 Rankin absolute convergence

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence` (theorem).

For weight 2k, the series defining L_𝒜(f, s) and the Euler product of L(f, χ, s) converge absolutely in the half-plane Re(s) > k + 1/2. In particular, the weight-2 case k = 1 converges absolutely for Re(s) > 3/2.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Import the AL.3 arithmetic-to-unitary coefficient comparison and absolute-convergence estimates, with shift s↦s−k+1/2, and the ideal-count bound r_A(n)≪_ε n^ε. For any strict margin Re(s)−k−1/2>0 choose a smaller ε to justify the product and rearrangement. Chapter I p.229 explicitly records the weight-two specialization; the weight-2k bound is a derived extension, not a quotation from p.267.
2. The half-plane is Re(s)>k+1/2; no rearrangement at the central point is used.

**Dependencies:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §5, p. 229 ('It is not difficult to show'; no proof given). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter IV, introduction, p. 267, after (0.1). Chapter IV (0.1) defines the weight-2k series but does not state this convergence bound. The general bound is a proposed consequence of the shifted Rankin coefficient/Euler-product estimates requested from AL.3; the explicit primary-source convergence assertion on p.229 is the weight-two specialization.

<a id="target-gz-6-classical-entire-functional-equation"></a>

### 6.24 Completed Rankin functional equation

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-entire-functional-equation` (theorem).

Under the standing hypotheses (in particular D ≡ □ mod 4N, so ε(N) = 1), for f in the new space of weight 2 on Γ₀(N) (normalized eigenform for L(f, χ, s)), the functions L_𝒜(f, s) and L(f, χ, s) have analytic continuations to the entire s-plane, satisfy functional equations under s ↦ 2 − s, and vanish at s = 1. Precisely (Chapter IV (0.2) with k = 1): L*_𝒜(f, s) := (2π)^{−2s} N^s |D|^s Γ(s)² L_𝒜(f, s) = −ε(N) L*_𝒜(f, 2 − s), and −ε(N) = −1.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Pair the continued kernel with newforms and use its coefficient functional equation.
2. The completed factor is (2π)^(-2s)(N|D|)^sΓ(s)^2; reflection s↦2k−s has sign −ε(N).

**Dependencies:** [Classical Rankin normalization](#target-gz-0-classical-rankin-normalization), [Classical L functional equation](#target-gz-6-classical-l-functional-equation).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §5, (5.5) Proposition, p. 229; proved in Chapter IV: continuation via Rankin's method (§1, Proposition (1.2)), functional equation (0.2) proved in §4, pp. 282–283 ('This completes the proof of the functional equation'). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-height-series-cuspidality"></a>

### 6.25 Hecke height-series cuspidality

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality` (theorem).

Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; N = 1 is treated in [18]); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1). The height-coefficient expansion g_𝒜(z) = Σ_{m≥1} ⟨c, T_m c^σ⟩ e^{2πimz} belongs to S₂(Γ₀(N)).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Apply the imported Hecke-equivariant Jacobian/local-height pairing to the finite-dimensional Hecke module.
2. Use the perfect Fourier-coefficient pairing of the Hecke algebra and weight-two cusp forms to produce the series with coefficient ⟨a,T_m b⟩. This imports Mordell–Weil and the Jacobian instead of defining either again.

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.0`, `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R12.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §6, (6.1) Theorem, p. 230; proved in Chapter V, §1, p. 306 (formal argument: for any ℚ-linear α: 𝕋 → ℂ, Σ α(T_m) qᵐ ∈ S₂(Γ₀(N)), via the perfect pairing 𝕋 × S₂(Γ₀(N), ℚ) → ℚ, (T, f) ↦ a₁(Tf); here α(T) = ⟨c, T c^σ⟩). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §1, p. 306 (proof of the first assertion of Theorem (6.1) of Chap. I). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-disjointness"></a>

### 6.26 CM Hecke disjointness criterion

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness` (theorem).

Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; N = 1 is treated in [18]); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1). Let m ≥ 1 with (m, N) = 1. The divisors c = (x) − (∞) and T_m d^σ = T_m(x^σ) − T_m(0) are relatively prime if and only if N > 1 and r_𝒜(m) = 0.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Identify a common CM point in the determinant-m Hecke orbit with an integral O_K-ideal of norm m in the corresponding Artin class.
2. Count the automorphisms modulo ±1; for N>1 the two cusp subtractions are distinct and cause no additional CM intersection.

**Dependencies:** [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class), `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §9, (9.1) Proposition, p. 232 ('it is easy to show'); refined in Chapter III, (4.3) Proposition, p. 258 (the multiplicity of x in T_m x^σ is r_𝒜(m), m prime to N) and Chapter II §5, p. 249. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-rankin-unfolding"></a>

### 6.27 Classical Rankin unfolding

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. Let f = Σ a(n)qⁿ ∈ S_{2k}(Γ₀(N)) (any cusp form) and M = N|D|. For Re(s) large, Γ(s+2k−1)(4π)^{−s−2k+1} L_𝒜(f, s+2k−1) = ∬_𝓕 f(z) \overline{θ_𝒜(z) E_s̄(z)} y^{2k} dxdy/y² = (f, θ_𝒜 E_s̄)_{Γ₀(M)}, with E_s as in the referenced classical source result 179 and 𝓕 a fundamental domain for Γ₀(M). Proof as printed: Γ(s+2k−1)(4π)^{−s−2k+1} Σ a(n)r_𝒜(n)n^{−s−2k+1} = ∬_{Γ_∞\ℌ} f \overline{θ_𝒜} y^{s+2k} dxdy/y². Then write Γ_∞\ℌ = ∪_{γ ∈ Γ_∞\Γ₀(M)} γ𝓕, use the transformation laws of f and θ_𝒜 under Γ₀(M), and interchange sum and integral.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Unfold against the level-N Eisenstein family in its absolute-convergence region.
2. Integrate each Fourier exponential to obtain the Γ(s+2k−1)/(4π)^(s+2k−1) factor; keep the kernel and L-series parameters distinct.

**Dependencies:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), `AutomorphicSpectralTheory:AS.2`, `MetaplecticAutomorphicForms:MP.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §1, pp. 270–271. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-trace-adjunction"></a>

### 6.28 Classical trace adjunction

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction` (theorem).

For N | M, f ∈ S_{2k}(Γ₀(N)) and g ∈ M̃_{2k}(Γ₀(M)): (f, g)_{Γ₀(M)} = (f, Tr^M_N g)_{Γ₀(N)}. Consequently (4π)^{−s−2k+1}Γ(s+2k−1)L_𝒜(f, s+2k−1) = (f, Tr^M_N(θ_𝒜 E_s̄))_{Γ₀(N)} for Re(s) large, with M = N|D|.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use the trace coset decomposition and change variables in the Petersson integral.
2. Compare the index-normalized trace with the source unnormalized trace before applying adjunction.

**Dependencies:** `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R14.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §1, p. 271. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-mobius-level-decomposition"></a>

### 6.29 Möbius level decomposition

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-mobius-level-decomposition` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. With M = N|D| and E^{(1)}_s as in the referenced classical source result 185: E_s(z) = ½ Σ_{e|N} μ(e) Σ_{c,d∈ℤ, M|c, e|d} ε(d)(cz+d)^{−(2k−1)} y^s|cz+d|^{−2s} = Σ_{e|N} μ(e)ε(e) e^{−(2s+2k−1)} (N/e)^{−s} E^{(1)}_s(Nz/e). Only e squarefree and prime to D contribute. For e > 1 the term Tr^M_N(θ_𝒜(z)E^{(1)}_s(Nz/e)) has level N/e < N: any system of representatives of Γ₀(M)\Γ₀(N) is one of Γ₀(M/e)\Γ₀(N/e), because (e, D) = 1. Hence, for f ∈ S^new_{2k}(Γ₀(N)), those terms are orthogonal to f. For non-holomorphic terms this uses §5: the product of f with a non-holomorphic form equals its product with a holomorphic form of the same level.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Separate the level divisors by inclusion–exclusion.
2. Apply trace adjunction to the resulting oldform/newform terms, retaining the Möbius factor.

**Dependencies:** [Classical trace adjunction](#target-gz-6-classical-trace-adjunction), `ModularCurvesPartII:R14.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §1, pp. 271–272. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-rankin-kernel"></a>

### 6.30 Classical Rankin kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel` (construction).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. Φ̃_s(z) = Φ̃_{s,𝒜}(z) = Tr^{ND}_N(θ_𝒜(z) E^{(1)}_s(Nz)) ∈ M̃_{2k}(Γ₀(N)), where Tr^{ND}_N means Tr^{N|D|}_N (the referenced classical source result 182). Its Fourier expansion in x is Φ̃_s(z) = Σ_{m∈ℤ} A_m(s, y) e(mx) (1.3).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Multiply the class theta series by the character-compatible Eisenstein family and trace from N|D| to N.
2. Check weight and cusp growth; the Fourier convolution has Nn+l=m|D|.

**Dependencies:** `AutomorphicSpectralTheory:AS.2`, `MetaplecticAutomorphicForms:MP.5`, [Classical trace adjunction](#target-gz-6-classical-trace-adjunction), `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.2/adelic-classical-bijection`.

**Uses.**

- `Gross–Zagier 1986 Chapter IV, (1.2) Proposition and (1.3), p. 272`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `classicalRankinKernel` | constructor | Tr_N^(N\|D\|)(θ_A(z)E_s^(1)(Nz)). |
| `classicalRankinKernel_trace` | compatibility | The result has level N, weight 2k and polynomial cusp growth in its initial convergence region. |
| `classicalRankinKernel_fourier` | projection | Its Fourier coefficient is the convolution with Nn+l=m\|D\|. |
| `classicalRankinKernel_class_dependence` | relation | The construction is linear in the ideal-class theta series. |

**Checks.**

- `classicalRankinKernel_level_one` (computation): For N=1 the trace still runs from level |D| to 1.
- `classicalRankinKernel_negative_D` (non-example): The positive level is N|D|; ND<0 is shorthand, not a congruence subgroup level.
- `classicalRankinKernel_zero_theta` (degenerate): Replacing θ_A by zero gives the zero kernel.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, (1.2) Proposition and (1.3), p. 272. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-rankin-kernel-pairing"></a>

### 6.31 Rankin kernel pairing

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel-pairing` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. For this discriminant and coprime positive level, define the trace kernel Φ̃_s = Φ̃_{s,𝒜} ∈ M̃_{2k}(Γ₀(N)) by Φ̃_s(z) = Tr^{ND}_N(θ_𝒜(z) E^{(1)}_s(Nz)), where θ_𝒜 is the theta series (1.1) and E^{(1)}_s(z) = ½ Σ_{c,d∈ℤ, D|c} ε(d)(cz+d)^{−(2k−1)} y^s|cz+d|^{−2s}. Then for every f ∈ S^new_{2k}(Γ₀(N)): (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_𝒜(f, s+2k−1) = (f, Φ̃_s̄), first for Re(s) large, with the Petersson product (f, g) = ∬_{Γ₀(N)\ℌ} f ḡ y^{2k} dxdy/y².

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Combine the unfolded integral, trace adjunction and Möbius level decomposition.
2. For the newform subspace obtain the exact Rankin-kernel pairing with the stated gamma and level factors.

**Dependencies:** [Classical Rankin unfolding](#target-gz-6-classical-rankin-unfolding), [Möbius level decomposition](#target-gz-6-classical-mobius-level-decomposition), [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §1, (1.2) Proposition, p. 272. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-prime-to-level-detection"></a>

### 6.32 Prime-to-level newform detection

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. Write Φ̃_s(z) = Σ_{m∈ℤ} A_m(s, y)e(mx) (1.3). The proof of (1.2) used only the orthogonality of f with forms of level strictly dividing N. f ∈ S^new_{2k}(Γ₀(N)) is also orthogonal to g(dz) for d > 1 and g of level dividing N/d, so in (1.2) only the A_m(s, y) with (m, N) = 1 are relevant. If Φ̃, Φ̃′ ∈ M̃_{2k}(Γ₀(N)) (with the growth of §5) have A_m = A′_m for all m prime to N, then (f, Φ̃) = (f, Φ̃′). In particular, the functional equation (0.2) and the formulas for L_𝒜(f, k) and L′_𝒜(f, k) reduce to identities for A_m(s, y), (m, N) = 1.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use the Hecke algebra/Fourier-coefficient perfect pairing on the newform subspace.
2. Prime-to-N Hecke operators determine each newform component; do not extend the assertion to arbitrary oldforms.

**Dependencies:** `ModularCurvesPartII:R12.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §1, Remark after (1.2) and (1.3), p. 272. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-eisenstein-transformation"></a>

### 6.33 Classical Eisenstein transformation

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-transformation` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For γ = (a b; c d) ∈ SL₂(ℤ) with (c, D) = |D₂|, D₁D₂ = D, and c* an inverse of c (mod D₁) with c* ≡ 0 (mod D₂): (E^{(1)}_s|_{2k−1}γ)(z) = ε_{D₁}(c) ε_{D₂}(dδ₁) δ₁^{−s−2k+1} E^{(D₁)}_s((z + c*d)/δ₁), where (F|_{2k−1}γ)(z) = (cz+d)^{−(2k−1)}F(γz).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Apply the Eisenstein transformation law with each ordered factorization D=D₁D₂.
2. Retain the κ(D₁) phase, especially κ= i for a negative discriminant.

**Dependencies:** `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §2, (2.2), pp. 273–274. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-trace-coset-classification"></a>

### 6.34 Trace coset classification

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. [Γ₀(N) : Γ₀(N|D|)] = Σ_{δ₁|δ} δ₁. The cosets Γ₀(N|D|)γ, γ = (a b; c d) ∈ Γ₀(N), are classified by δ₂ = (c, D) together with the residue class of c*d modulo δ₁ = δ/δ₂. So Tr^{ND}_N F = Σ_{D=D₁D₂} Σ_{j mod δ₁} F|_{2k}γ_{D₁,j}, where γ_{D₁,j} is any representative with (c, D) = δ₂ and c*d ≡ j (mod δ₁).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Classify the trace cosets by the denominator gcd and the source ramified divisor.
2. Use this finite decomposition to reorganize the level N|D| trace.

**Dependencies:** [Classical trace adjunction](#target-gz-6-classical-trace-adjunction), `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §2, p. 276. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-ramified-theta-reindexing"></a>

### 6.35 Ramified theta reindexing

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For every 1-periodic function f on ℌ: (f(z)θ_{𝒜𝒟₁}(z))|U_{δ₁} = (f(δ₂z)θ_{𝒜𝒟₁}(δ₂z))|U_δ = (f(δ₂z)θ_𝒜(z))|U_δ. The reason is that θ_{𝒜𝒟₁}(δ₂z) and θ_𝒜(z) have the same n-th Fourier coefficient for every n divisible by δ₂: r_{𝒜𝒟₁}(n/δ₂) = r_𝒜(n). This holds because 𝒜𝒟₁ = 𝒜𝒟₂ and every integral ideal of norm n (δ₂ | n) is 𝔡₂ times an integral ideal of norm n/δ₂.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Transform the theta series under the ramified ideal and cusp coset.
2. Reindex by multiplication with the different and use the genus character for the resulting class change.

**Dependencies:** `MetaplecticAutomorphicForms:MP.5`, `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §2, p. 276. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-eisenstein-combination"></a>

### 6.36 Genus Eisenstein combination

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination` (construction).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. ℰ_s(z) = Σ_{D=D₁·D₂} ε_{D₁}(N) χ_{D₁·D₂}(𝒜) / (κ(D₁)|D₁|^{s+2k−3/2}) · E^{(D₁)}_s(|D₂|z), the sum over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed; (D₁, D₂) and (D₂, D₁) are different terms, so there are 2^t terms, t the number of prime factors of D). ℰ_s depends on N (in fact only on N mod D) and on 𝒜 (in fact only on the genus of 𝒜); the paper suppresses this in the notation.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Sum over all ordered discriminant factorizations with their κ and genus factors.
2. The transformation formulas prove genus and residue-class dependence; ordered pairs must not be identified.

**Dependencies:** [Genus-character factorization](#target-gz-0-classical-genus-character-factorization), [Classical Eisenstein transformation](#target-gz-6-classical-eisenstein-transformation), [Ramified theta reindexing](#target-gz-6-classical-ramified-theta-reindexing), `AutomorphicSpectralTheory:AS.2`.

**Uses.**

- `Gross–Zagier 1986 Chapter IV, §2, (2.4) Proposition and the note after it, pp. 276–277`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `genusEisensteinCombination` | constructor | The 2^t ordered D=D₁D₂ terms, with ε_D₁(N)χ_D₁D₂(A)/(κ(D₁)\|D₁\|^(s+2k−3/2)) factors. |
| `genusEisensteinCombination_genus` | extensionality | Depends on A only through its genus. |
| `genusEisensteinCombination_level_residue` | extensionality | Depends on N only modulo D. |
| `genusEisensteinCombination_prime` | simp | For k=1,D=−p,ε(N)=1 it is E_s^(1)(pz)−i p^(−s−1/2)E_s^(D)(z). |

**Checks.**

- `genusEisensteinCombination_prime_terms` (computation): A prime discriminant gives two ordered terms.
- `genusEisensteinCombination_ordered` (non-example): Identifying (D₁,D₂) and (D₂,D₁) loses half the terms.
- `genusEisensteinCombination_i_factor` (characterisation): Negative D₁ has κ(D₁)=i; replacing it by 1 changes the Fourier coefficients.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition and the note after it, pp. 276–277. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-kernel-u-formula"></a>

### 6.37 Rankin kernel U formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-u-formula` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. Assume (D, 2N) = 1. Then Φ̃_s(z) = Tr^{ND}_N(E^{(1)}_s(Nz)θ_𝒜(z)) from Proposition (1.2) equals (ℰ_s(Nz)θ_𝒜(z))|U_{|D|}, where ℰ_s(z) = Σ_{D=D₁·D₂} ε_{D₁}(N)χ_{D₁·D₂}(𝒜)/(κ(D₁)|D₁|^{s+2k−3/2}) E^{(D₁)}_s(|D₂|z), summed over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed). χ_{D₁·D₂} is the corresponding genus character, κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0, and E^{(D₁)}_s is the Eisenstein series (2.1).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Apply the trace coset classification to the theta–Eisenstein product.
2. Use the ramified theta reindexing to obtain the U_|D| formula.

**Dependencies:** [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel), [Trace coset classification](#target-gz-6-classical-trace-coset-classification), [Ramified theta reindexing](#target-gz-6-classical-ramified-theta-reindexing), [Genus Eisenstein combination](#target-gz-6-classical-eisenstein-combination).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition, p. 276. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-prime-eisenstein-combination"></a>

### 6.38 Prime-discriminant Eisenstein formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-eisenstein-combination` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. If k = 1, |D| = p is prime (so D = −p, p ≡ 3 mod 4) and ε(N) = 1, then ℰ_s(z) = E^{(1)}_s(pz) − i p^{−s−1/2} E^{(D)}_s(z) (printed with superscript (p); see PAPER-GROSS-ZAGIER-86/E33).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. For a prime discriminant enumerate the two ordered factorization terms.
2. Insert ε(N)=1 and κ(D)=i to obtain the explicit difference.

**Dependencies:** [Genus Eisenstein combination](#target-gz-6-classical-eisenstein-combination).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §2, note after (2.4), p. 277. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-kernel-fourier-expansion"></a>

### 6.39 Rankin kernel Fourier expansion

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. Write ℰ_s(z) = Σ_{n∈ℤ} e_s(n, y) e(nx) (z = x+iy ∈ ℌ). Then Φ̃_{s,𝒜}(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_𝒜(l) e^{−2πly/δ} e((Nn+l)x/δ), with δ = |D|.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Expand the transformed Eisenstein combination and the ideal-class theta series.
2. Convolve the coefficients subject to Nn+l=m|D|, including the l=0 term r_A(0)=1/w.

**Dependencies:** [Rankin kernel U formula](#target-gz-6-classical-kernel-u-formula), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), [Eisenstein zero coefficient](#target-gz-6-classical-eisenstein-zero-coefficient), [Eisenstein nonzero coefficient](#target-gz-6-classical-eisenstein-nonzero-coefficient).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §3, (3.1), p. 277. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-genus-sign-function"></a>

### 6.40 Rankin genus-sign function

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function` (definition).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For n ∈ ℤ ∖ {0} and d a positive divisor of n: ε(n, d) = ε_𝒜(n, d) = 0 if (d, n/d, D) ≠ 1, and ε(n, d) = ε_{D₁}(d) ε_{D₂}(−N n/d) χ_{D₁·D₂}(𝒜) if (d, n/d, D) = 1, where D = D₁D₂ is the decomposition with (d, D) = |D₂|.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Choose D₂ by |D₂|=gcd(d,D) and set zero on common ramification.
2. Evaluate the two primitive quadratic characters and the genus character with signed n/d.

**Dependencies:** `AnalyticNumberTheory:AN.4`, [Genus-character factorization](#target-gz-0-classical-genus-character-factorization).

**Uses.**

- `Gross–Zagier 1986 Chapter IV, (3.2) Proposition, p. 277`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `rankinGenusSign` | constructor | The piecewise genus-character value ε_A(n,d), zero when gcd(d,n/d,D)>1. |
| `rankinGenusSign_values` | projection | The values are 0,1,−1. |
| `rankinGenusSign_complement` | relation | For the source norm congruence, ε_A(n,\|n\|/d)=−ε(N)sgn(n)ε_A(n,d). |
| `rankinGenusSign_multiplicative` | relation | Multiplicative in coprime divisors d of fixed n. |

**Checks.**

- `rankinGenusSign_common_ramification` (degenerate): If l|D divides both d and n/d, the sign is zero.
- `rankinGenusSign_positive_cancellation` (computation): For ε(N)=1,n>0 satisfying Nn+l≡0 with l a norm from A, Σ_d ε_A(n,d)=0.
- `rankinGenusSign_negative_index` (non-example): For D=−3,N=1,A=1, n=3 gives ε_A(3,1)=1, ε_A(3,3)=−1, whereas n=−3 gives both values 1. Thus σ_A(3)=0 and σ_A(−3)=2; replacing n by |n| loses the sign.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, (3.2) Proposition, p. 277. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-eisenstein-zero-coefficient"></a>

### 6.41 Eisenstein zero coefficient

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. The 0-th Fourier coefficient of ℰ_s(z) (The Eisenstein combination ℰ_s) is e_s(0, y) = L(2s+2k−1, ε)(δy)^s + (ε(N)/(i√δ)) V_s(0) L(2s+2k−2, ε) (δy)^{−s−2k+2}.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Compute the zero Fourier integral separately from nonzero indices.
2. Retain both quadratic L-factors and the gamma factors; it is not the n→0 limit of the nonzero formula.

**Dependencies:** [Genus Eisenstein combination](#target-gz-6-classical-eisenstein-combination), [Classical Eisenstein transformation](#target-gz-6-classical-eisenstein-transformation), `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (first formula), p. 277; proof pp. 278–279. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-eisenstein-nonzero-coefficient"></a>

### 6.42 Eisenstein nonzero coefficient

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For n ≠ 0, the n-th Fourier coefficient of ℰ_s(z) is e_s(n, y) = (ε(N)/(i√δ)) (δy)^{−s−2k+2} V_s(ny) Σ_{d|n, d>0} ε_𝒜(n, d) d^{−(2s+2k−2)}, with ε_𝒜(n, d) as in The sign function ε_𝒜(n, d).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Poisson-sum the nonzero Eisenstein coefficient and evaluate its integral V_s.
2. The divisor sum has the signed genus factors; keep both signs of the Fourier index.

**Dependencies:** [Genus Eisenstein combination](#target-gz-6-classical-eisenstein-combination), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (second formula), p. 277; proof p. 279. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-kernel-meromorphic-continuation"></a>

### 6.43 Rankin kernel meromorphic continuation

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-meromorphic-continuation` (theorem).

For each decomposition D = D₁·D₂ and each z ∈ ℌ, s ↦ E^{(D₁)}_s(z), defined by (2.1) for Re(s) > 3/2 − k, extends to a meromorphic function of s ∈ ℂ, given by the Fourier expansion of the referenced classical source result 209: the terms n ≠ 0 are entire in s (V_s(t) is entire for t ≠ 0, (3.3b)) and the series converges locally uniformly in (s, z) by the estimate V_s(t) = |t|^{O(1)}e^{−2π|t|}; the only possible poles come from the constant term V_s(0)L(2s+2k−2, ε)y^{−s−2k+2}. The continued function keeps the transformation law of the referenced classical source result 192. Consequently ℰ_s and Φ̃_s = (ℰ_s(Nz)θ_𝒜(z))|U_{|D|} continue meromorphically, Φ̃_s keeps its Γ₀(N) transformation law, and the expansions (3.1) and (3.2) hold for all s. This is what gives meaning to Φ̃_{−r} in Corollary (3.4) and to the values and derivatives at s = 0 and s = 1 − k used in §4.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use the continued zero and nonzero Eisenstein coefficient formulas.
2. The locally uniform Fourier bounds continue the kernel, with the source specified poles; those bounds are imported from AS.2.

**Dependencies:** [Rankin kernel Fourier expansion](#target-gz-6-classical-kernel-fourier-expansion), `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §3, implicit in Corollary (3.4) ('Φ̃_{−r}(z)', p. 281) and in §4 (p. 282); the paper states continuation only for V_s(t) (pp. 280–281). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-integral-kernel-values"></a>

### 6.44 Integral Rankin kernel values

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For r ∈ ℤ, 0 ≤ r ≤ k−1 (Φ̃ continued in s through its Fourier coefficients): Φ̃_{−r}(z) = Σ_{m=0}^{∞} ( Σ_{0≤n≤mδ/N} e_{n,r}(y) r_𝒜(mδ − nN) ) e^{2πimz}, where e_{n,r}(y) := e_{−r}(n, Ny/δ) e^{2πNny/δ} is given by e_{0,r}(y) = L(2k−2r−1, ε)(Ny)^{−r} if r < k−1, and e_{0,k−1}(y) = [L(1, ε) − ε(N)(π/√δ) L(0, ε)] (Ny)^{1−k}; e_{n,r}(y) = (−1)^{k−r} ε(N) (2π/√δ) (Ny)^{r−2k+2} p_{k,r}(4πNny/δ) Σ_{d|n, d>0} ε_𝒜(n, d) d^{2r−2k+2} for n > 0, with p_{k,r} as in (3.3d) and ε_𝒜(n, d) as in (3.2). The coefficients are polynomials in 1/y of degree r.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. At integral s evaluate the gamma-normalized V_s and its derivative.
2. Separate polynomial positive-index terms from the decaying q_(k−1) negative-index integral.

**Dependencies:** [Eisenstein zero coefficient](#target-gz-6-classical-eisenstein-zero-coefficient), [Eisenstein nonzero coefficient](#target-gz-6-classical-eisenstein-nonzero-coefficient), [Rankin kernel meromorphic continuation](#target-gz-6-classical-kernel-meromorphic-continuation), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §3, (3.4) Corollary, pp. 281–282. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-central-kernel-holomorphy"></a>

### 6.45 Central kernel holomorphy

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-central-kernel-holomorphy` (theorem).

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. At s = 0, Φ̃_{0,𝒜} ∈ M_{2k}(Γ₀(N)) (holomorphic, not in general cuspidal). This is the case r = 0 of (3.4); a priori it holds because ℰ_s(z) is holomorphic in z at s = 0.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Evaluate the Fourier expansion at the central kernel parameter.
2. The negative-index terms vanish and the remaining series has the exact holomorphic weight 2k transformation law.

**Dependencies:** [Integral Rankin kernel values](#target-gz-6-classical-integral-kernel-values), [Rankin kernel Fourier expansion](#target-gz-6-classical-kernel-fourier-expansion).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §3, after (3.4), p. 282. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-coefficient-functional-equation"></a>

### 6.46 Kernel coefficient functional equation

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-coefficient-functional-equation` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Let n ∈ ℤ satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A, and y > 0. Put e*_s(n,y) := π^{−s} δ^s Γ(s+2k−1) e_s(n,y). Then e*_s(n,y) = −ε(N) e*_{2−2k−s}(n,y) for all s. Explicitly: e*_s(0,y) = (s+k)(s+k+1)⋯(s+2k−2)\[π^{−s}δ^sΓ(s+k)L(2s+2k−1,ε)](δy)^s − ε(N)(2−k−s)(3−k−s)⋯(−s)\[π^{1/2−s}δ^{s−1/2}Γ(s+k−1/2)L(2s+2k−2,ε)](δy)^{2−2k−s}, the two brackets being interchanged by s ↦ 2−2k−s by the functional equation of L(s,ε); and for n ≠ 0, e*_s(n,y) = −iε(N)|n|^k π^{2k−1} δ^{−2k+3/2} y V*_s(ny) Σ_{d|n, d>0} ε_A(n,d)(|n|/d²)^{s+k−1}, so that (4.1) for n ≠ 0 follows from V*_s(t) = sgn(t)V*_{2−2k−s}(t) (Prop. 3.3c) and (4.3).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Apply the gamma reflection and integral continuation to the coefficient formula.
2. Compare s with 2−2k−s; the signed divisor complement yields the source sign.

**Dependencies:** [Eisenstein zero coefficient](#target-gz-6-classical-eisenstein-zero-coefficient), [Eisenstein nonzero coefficient](#target-gz-6-classical-eisenstein-nonzero-coefficient), [Rankin kernel meromorphic continuation](#target-gz-6-classical-kernel-meromorphic-continuation).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, (4.1)–(4.2) and the two displays after (4.2), p. 282. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-genus-sign-reversal"></a>

### 6.47 Genus-sign reversal

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Let n ≠ 0 satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and let d be a positive divisor of n. Then ε_A(n, |n|/d) = −ε(N)·sgn(n)·ε_A(n, d). (Both sides vanish unless (d, n/d, D) = 1. If (d, n/d, D) = 1 write D = D₀D′D″ with D₀, D′, D″ discriminants, |D′| = (d, D), |D″| = (n/d, D), D₀ prime to n; then the product ε_A(n,d)ε_A(n,|n|/d) equals ε_{D₀}(|n|) ε_{D′D″}(−N sgn n) χ_{D₀·D′D″}(A), and (4.2) gives χ_{D₀·D′D″}(A) = ε_{D₀}(l) = ε_{D₀}(−Nn), whence the product is ε_D(−N sgn n) = −ε(N)sgn(n).) In particular, if ε(N) = +1 and n > 0 satisfies (4.2), then Σ_{d|n, d>0} ε_A(n,d) = 0.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Replace d by |n|/d and evaluate the two primitive character signs.
2. The claimed reversal uses the norm congruence and ε(N); it is not a universal unsigned-divisor identity.

**Dependencies:** [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, (4.3) and its proof, pp. 282–283. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-l-functional-equation"></a>

### 6.48 Classical L functional equation

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-l-functional-equation` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). L_A(f,s) extends to an entire function of s and L*_A(f,s) := (2π)^{−2s} N^s |D|^s Γ(s)² L_A(f,s) satisfies L*_A(f,s) = −ε(N) L*_A(f, 2k−s). In particular, if ε(N) = +1 then L_A(f,k) = 0. (§4 deduces this from Prop. (1.2), Eq. (3.1) and (4.1), which applies to every coefficient because the n occurring in (3.1) satisfy (4.2).)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Pair the kernel functional equation with the newform.
2. Cancel the exact unfolding gamma and level factors to obtain Λ(s)=−ε(N)Λ(2k−s).

**Dependencies:** [Rankin kernel pairing](#target-gz-6-classical-rankin-kernel-pairing), [Kernel coefficient functional equation](#target-gz-6-classical-coefficient-functional-equation).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math.84(1986), ChapterIV (0.2), p.267; completion of the functional-equation proof in §4, pp.282–283. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-signed-divisor-sums"></a>

### 6.49 Signed divisor sums

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums` (definition).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). For an integer n ≠ 0: σ_A(n) := Σ_{d|n, d>0} ε_A(n,d). For n > 0: σ′_A(n) := Σ_{d|n, d>0} ε_A(n,d) log(n/d²). p_{k−1}(t) := Σ_{j=0}^{k−1} C(k−1, j)(−t)^j/j! (= p_{k,k−1}(t) of Prop. (3.3d)). Note that ε_A(n,d), hence σ_A(n), depends on the sign of n: ε_A(−n,d) = ε_{D₂}(−1)ε_A(n,d), D₂ as in the definition of ε_A. The polynomial p_(k−1) is imported as the generic terminating hypergeometric/Laguerre polynomial, not separately redefined in GZ; its exact formula is a supplier request.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Define the signed divisor sum and its log(n/d²) companion on their different domains.
2. Expand log(n/d²)=log n−2log d; retain signed n in σ, including the archimedean negative tail.

**Dependencies:** [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), `AnalyticNumberTheory:AN.4`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Uses.**

- `Gross–Zagier 1986 Chapter IV, §4, Proposition (4.4) (σ_A, p_{k−1}), p. 283; Proposition (4.5) (σ′_A), p. 284`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `signedDivisorSums` | constructor | The pair (σ_A(n),σ′_A(n)), with σ defined for n≠0 and σ′ for n>0. |
| `signedDivisorSums_log` | characterisation | σ′=log n·σ−2Σ_d ε_A(n,d)log d. |
| `signedDivisorSums_prime_support` | projection | Under the norm congruence, σ′ is a sum over primes with ε(p)≠1. |
| `signedDivisorSums_negative` | compatibility | σ_A(−n) retains the discriminant-dependent sign, as required in the resolvent tail. |

**Checks.**

- `signedDivisorSums_one` (computation): σ′_A(1)=0 because log1=0.
- `signedDivisorSums_split` (degenerate): A split prime contributes zero to the logarithmic prime decomposition under its hypotheses.
- `signedDivisorSums_negative_tail` (non-example): For D=−3,N=1,A=1,n=3, σ_A(3)=0 and σ_A(−3)=2; substituting σ_A(3) deletes the analytic tail.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, Proposition (4.4) (σ_A, p_{k−1}), p. 283; Proposition (4.5) (σ′_A), p. 284. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-central-value-kernel"></a>

### 6.50 Classical central-value kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-central-value-kernel` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Suppose ε(N) = −1. Then L_A(f,k) = 2^{2k+1} π^{k+1} / ((k−1)! √δ) · (f, Φ̃), where Φ̃ ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_{m=0}^∞ ( Σ_{0<n≤mδ/N} σ_A(n) r_A(mδ − Nn) p_{k−1}(4πNny/δ) + (h/u) r_A(m) ) y^{1−k} e^{2πimz}. The coefficients of Φ̃ are polynomials in y^{−1} of degree ≤ k−1; for k = 1, Φ̃ is a holomorphic modular form (not a cusp form). (Φ̃ = (N^{k−1}√δ/2π)·Φ̃_{1−k}; the proof is Prop. (1.2) and Cor. (3.4) with r = k−1.)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Evaluate the holomorphic central kernel and express its finite coefficients with σ.
2. Apply the norm congruence/genus relation; preserve the endpoint r_A(0)=1/w.

**Dependencies:** [Integral Rankin kernel values](#target-gz-6-classical-integral-kernel-values), [Rankin kernel Fourier expansion](#target-gz-6-classical-kernel-fourier-expansion), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, (4.4) Proposition, p. 283. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-different-reindexing"></a>

### 6.51 Different ideal reindexing

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing` (theorem).

With the standing notation (D odd, so D squarefree), for every m ≥ 0 and every class A: r_A(m|D|) = r_A(m). (The different 𝔡 = (√D) is principal and every integral ideal of norm m|D| is divisible by every ramified prime, hence equals 𝔡·𝔟 with N(𝔟) = m; for m = 0 both sides are 1/w.)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Multiply ideals by the different and track the ideal class and norm |D| factor.
2. This is a theta coefficient reindexing, not an equality of individual ideal representatives.

**Dependencies:** `MetaplecticAutomorphicForms:MP.5`, `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, used in (4.4) and (4.5) (the n = 0 term of Cor. (3.4), r_A(mδ − 0·N), is printed as r_A(m)), pp. 283–284; Theorems (5.6), (5.8) use both forms. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-central-derivative-kernel"></a>

### 6.52 Classical central-derivative kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Suppose ε(N) = +1. Then L′_A(f,k) = 2^{2k+1} π^{k+1} / ((k−1)! √δ) · (f, Φ̃), where Φ̃ = (N^{k−1}√δ/2π)·∂Φ̃_s/∂s|_{s=1−k} ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_{m=−∞}^{∞} [ −Σ_{0<n≤mδ/N} σ′_A(n) r_A(mδ − Nn) p_{k−1}(4πnNy/δ) + (h/u) r_A(m)(log y + Γ′/Γ(k) + log Nδ − log π + 2L′/L(1, ε)) − Σ_{n=1}^∞ σ_A(−n) r_A(mδ + Nn) q_{k−1}(4πnNy/δ) ] y^{1−k} e^{2πimz} (the first two terms are absent if m < 0; in the third term n has been replaced by −n). CORRECTED: the paper prints σ_A(n) in the third term; it must be σ_A(−n) (= δ(n)R_{A𝔫}(n) by Prop. (4.6a)), see issue PAPER-GROSS-ZAGIER-86/E38. Ingredients (p. 283–284): ∂e_s(0,y)/∂s|_{1−k} = 2L(1,ε)(δy)^{1−k}[Γ′/Γ(k) + log(δ²y/π) + 2L′/L(1,ε)]; for n > 0, ∂e_s(n,y)/∂s|_{1−k} = 2iδ^{1/2−k}y^{1−k}V_{1−k}(ny)Σ_{d|n}ε_A(n,d) log d; for n < 0, ∂e_s(n,y)/∂s|_{1−k} = −iδ^{1/2−k}y^{1−k}·∂V_s(ny)/∂s|_{1−k}·Σ_{d|n}ε_A(n,d), with V_{1−k}, ∂V_s/∂s|_{1−k} from Prop. (3.3d,e).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Differentiate each continued Fourier branch at the central parameter.
2. The positive-index term uses σ′, the negative-index term uses σ(−n) and q_(k−1); the zero coefficient is differentiated separately.

**Dependencies:** [Integral Rankin kernel values](#target-gz-6-classical-integral-kernel-values), [Rankin kernel Fourier expansion](#target-gz-6-classical-kernel-fourier-expansion), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Different ideal reindexing](#target-gz-6-classical-different-reindexing).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, pp. 283–284: the three derivative displays and (4.5) Proposition. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-sign-multiplicativity"></a>

### 6.53 Genus-sign multiplicativity

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-sign-multiplicativity` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). For fixed n ≠ 0 and coprime positive divisors d′, d″ of n with d′d″ | n: ε_A(n, d′d″) = ε_A(n, d′) ε_A(n, d″). Consequently Σ_{d|n} ε_A(n,d) d^{−s} has an Euler product, and, writing n = p₁^{ν₁}⋯p_s^{ν_s}n₀ with p_i | D and (n₀, D) = 1, σ_A(n) = ∏_{i=1}^{s}(1 + ε_A(n, p_i^{ν_i}))·Σ_{d₀|n₀} ε(d₀) (only d = p₁^{μ₁}⋯p_s^{μ_s}d₀ with μ_i ∈ {0, ν_i} contribute).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Factor the primitive characters on coprime divisors of fixed n.
2. Check the common-ramification zero branch before using multiplicativity.
3. Multiplicativity itself holds for every fixed nonzero n: for coprime d-prime,d-double-prime the discriminant factors D2-prime and D2-double-prime are coprime, their genus characters multiply, and the two cross character evaluations cancel as squares. The norm congruence (4.2) is required for the subsequent genus identification, not for this multiplicativity.

**Dependencies:** [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, proof of (4.6a), p. 286 (also used in (4.6b), p. 287, and the remark on p. 288). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-genus-sigma-identity"></a>

### 6.54 Genus sigma identity

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Let n be an integer satisfying (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and ε(N)n < 0. Then σ_A(n) = δ(n)·R_{A𝔫}(|n|). (For n prime to D: σ_A(n) = Σ_{d|n} ε(d) = R(n), the total number of ideals of norm n, and by (4.2) all of them lie in {A𝔫}.)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use the complement sign under the explicit norm congruence Nn+l≡0 mod D, l a norm from A.
2. Apply genus orthogonality to obtain δ(n)R_(A𝔫)(|n|); without the norm congruence the printed shortcut is false.

**Dependencies:** [Genus-sign reversal](#target-gz-6-classical-genus-sign-reversal), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition a), p. 285; proof pp. 285–287. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-logarithmic-prime-decomposition"></a>

### 6.55 Logarithmic prime decomposition

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Suppose ε(N) = +1 and n > 0 satisfies (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A [the hypothesis (4.2) is omitted in the printed statement of b); it is needed, see issue PAPER-GROSS-ZAGIER-86/E37]. Then σ′_A(n) = Σ_{p|n} a_p(n) log p with a_p(n) = 0 if ε(p) = 1; a_p(n) = (ord_p(n) + 1)·δ(n)·R_{A𝔫𝔠}(n/p) if ε(p) = −1; a_p(n) = ord_p(n)·δ(n)·R_{A𝔫𝔠}(n/p) if ε(p) = 0, In the inert and ramified branches choose the genus {𝔠} using an integral ideal of norm congruent to −p modulo D (Remark 1); the genus is independent of that choice. (Proof: a_p(n) = −2Σ_{d|n} ε_A(n,d) ord_p(d); multiplicativity reduces to the p-part; ε(p) = −1 and ν odd use ε_A(n,d₁) = ε_{A𝔠}(−n₁,d₁) and part a); p | D uses ε_A(n,d) = −ε_A(n,n/d) and ε_A(n,d₁) = ε_{A𝔠𝔭^{ν−1}}(−n₁,d₁).)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Expand σ′=log n·σ−2Σ ε_A(n,d)log d and separate prime powers.
2. Use multiplicativity and the norm congruence to cancel split primes and evaluate inert/ramified contributions.

**Dependencies:** [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Genus-sign multiplicativity](#target-gz-6-classical-sign-multiplicativity), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition b), p. 285; proof p. 287. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-prime-coefficient-parity"></a>

### 6.56 Logarithmic coefficient parity

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-coefficient-parity` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Under the hypotheses of (4.6b) (ε(N) = +1, n > 0, n satisfying (4.2)): Σ_{d|n} ε_A(n,d) = 0 (from (4.3)), hence σ′_A(n) = −2 Σ_{d|n} ε_A(n,d) log d; and all a_p(n) therefore lie in 2ℤ. The local parity inputs are δ(n) ∈ 2ℤ when a ramified prime divides n, and ord_p(n)+1 ∈ 2ℤ for inert p dividing n with R(n/p) ≠ 0.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Pair complementary divisors at the given prime power.
2. The quadratic sign forces the stated parity restriction on the surviving logarithmic coefficient.

**Dependencies:** [Logarithmic prime decomposition](#target-gz-6-classical-logarithmic-prime-decomposition).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, Remark 2 after (4.6), p. 285. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-single-prime-logarithm"></a>

### 6.57 Single-prime logarithm criterion

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-single-prime-logarithm` (theorem).

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Under the hypotheses of (4.6b): σ′_A(n)=0 whenever two or more inert primes have odd valuation in n; if there is exactly one such prime p, σ′_A(n) = (ord_p(n) + 1)·δ(n)·R_{A𝔫𝔠}(n/p)·log p (CORRECTED; printed ‘R_{A𝔫}(p)’, issue PAPER-GROSS-ZAGIER-86/E40); if there is none, n is a norm, and letting q be the norm of an ideal prime to D in the genus of (an ideal of norm n)·{A𝔫}, (−q/p) = −1 for an odd number of primes p | D, and σ′_A(n) = δ(n) ord_p(n) R(n) log p if there is exactly one such p, 0 if there are several. A priori reason: Σ_{d|n} ε_A(n,d)d^{−s} vanishes at s = 0 with derivative ½σ′_A(n) and has an Euler product, so σ′_A(n) ≠ 0 only if exactly one Euler factor vanishes at s = 0.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Apply the prime decomposition and the parity restriction.
2. The source genus condition leaves one nonsplit prime; preserve the ramified alternative instead of claiming the same valuation coefficient.

**Dependencies:** [Logarithmic prime decomposition](#target-gz-6-classical-logarithmic-prime-decomposition).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §4, remark following the proof of (4.6), p. 288. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-holomorphic-projection"></a>

### 6.58 Logarithmic weight-two projection

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection` (theorem).

Let Φ̃(z) = Σ_{m∈ℤ} a_m(y)e^{2πimz} ∈ M̃₂(Γ₀(N)) satisfy the growth condition (6.1) at all cusps ξ, and suppose A_ξ = A(N₁), B_ξ = B(N₁) depend only on N₁ = gcd(N, denominator of ξ). Let {α(M), β(M) : M | N} be the solution of the non-singular linear system (6.3) Σ_{M|N} ((M,N₁)²/M²) α(M) = A(N₁) (N₁ | N), (6.4) Σ_{M|N} ((M,N₁)²/M²) {β(M) + α(M) log((M,N₁)²/M)} = B(N₁) (N₁ | N). Then there is a holomorphic cusp form Φ = Σ_{m≥1} a_m e^{2πimz} ∈ S₂(Γ₀(N)) with (Φ, f) = (Φ̃, f) for all f ∈ S₂(Γ₀(N)) and, for (m, N) = 1, (6.5) a_m = lim_{s→0} [4πm ∫₀^∞ a_m(y) e^{−4πmy} y^s dy + 24α(1)σ₁(m)s^{−1}] + 24β(1)σ₁(m) + 48α(1)[σ′₁(m) − σ₁(m)(log 2m + 1/2 + ζ′/ζ(2))], where σ₁(m) = Σ_{d|m} d, σ′₁(m) = Σ_{d|m} d log d. (Proof: subtract Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms and has expansion A(N₁) log y + B(N₁) + O(y^{−1} log y) at ξ, then apply the case A = B = 0.)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Solve the two cusp-constant systems, using the invertible C_N matrix.
2. Subtract Σ_M(α(M)F(Mz)+β(M)E(Mz)), which is cusp-orthogonal.
3. Apply the supplier projection to the decaying remainder and evaluate the regularized Fourier Mellin integral; restore the exact α(1),β(1) correction.
4. Here a_m(y) is the coefficient after extracting e^{2πimz}, so the Petersson unfolding has e^{−4πmy}. With coefficients multiplying e^{2πimx} the corresponding exponential would be e^{−2πmy}.

**Dependencies:** `AutomorphicSpectralTheory:AS.4`, [Eisenstein Mellin asymptotics](#target-gz-6-classical-eisenstein-mellin-asymptotics), [Boundary Eisenstein cusp constants](#target-gz-6-classical-boundary-eisenstein-cusps), [Cusp constant matrix inverse](#target-gz-6-classical-cusp-matrix-inverse), [Projection boundary coefficients](#target-gz-6-classical-projection-boundary-coefficients), [Boundary Eisenstein orthogonality](#target-gz-6-classical-boundary-eisenstein-orthogonality).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, (6.2) Proposition, pp. 295-300. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-eisenstein-mellin-asymptotics"></a>

### 6.59 Eisenstein Mellin asymptotics

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-mellin-asymptotics` (theorem).

Write E(z) = Σ_m e(m,y)e^{2πimz}, F(z) = Σ_m f(m,y)e^{2πimz}. For m > 0: e(m,y) = −24σ₁(m), and as s → 0 (Re s > 0): ∫₀^∞ e(m,y)e^{−4πmy}y^s dy = −(6/(πm))σ₁(m) + o(1); ∫₀^∞ f(m,y)e^{−4πmy}y^s dy = ∂/∂t[−2π^{3/2+t}m^{−1/2−t}Γ(s+t+1)Γ(s−t)σ_{1+2t}(m)/((4πm)^{s+1/2}Γ(2+t)Γ(s)ζ(2+2t))]_{t=0} = −24 Γ(s+1)/(4πm)^{s+1} · [2σ′₁(m) + σ₁(m)(log(π/m) + γ − 1 − 2ζ′/ζ(2) + 1/s)] = −(6/(πm))σ₁(m)s^{−1} − (12/(πm))σ′₁(m) + (12/(πm))σ₁(m)(log 2m + ½ + ζ′/ζ(2)) + o(1), γ = Euler's constant. For (m, N) = 1 the m-th coefficient of Φ̃* = Φ̃ − Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} is a*_m(y) = a_m(y) − α(1)f(m,y) − β(1)e(m,y); these give (6.5).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use E₂*=E₂−3/(πy) and its Eisenstein derivative family.
2. Evaluate the Mellin transforms, keeping the Laurent pole and constant before differentiating at zero.

**Dependencies:** `QSeriesPartitionsAndMockModularForms:QM.3/nonholomorphic-eisenstein-series-e2-star`, `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 298-299. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-boundary-eisenstein-cusps"></a>

### 6.60 Boundary Eisenstein cusp constants

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps` (theorem).

Let M | N and ξ = a/c with (a,c) = 1, (c, N) = N₁; α = (a b; c d) ∈ SL₂(ℤ). Put a′ = (M/(M,N₁))a, c′ = c/(M,N₁) ((a′,c′) = 1), complete to α′ = (a′ b′; c′ d′) ∈ SL₂(ℤ), and relate z, z′ by c′z′ + d′ = ((M,N₁)/M)(cz+d); then (a′z′+b′)/(c′z′+d′) = M(az+b)/(cz+d), y′ = ((M,N₁)²/M)y, and E_{2,s}(Mz)|₂α = ((M,N₁)^{2+2s}/M^{2+s}) y^s + O(y^{−1−s}); hence E(Mz)|₂α = (M,N₁)²/M² + O(1/y), F(Mz)|₂α = ((M,N₁)²/M²)(log y + log((M,N₁)²/M)) + O(y^{−1} log y). Therefore Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} has expansion A(N₁) log y + B(N₁) + O(y^{−1} log y) at ξ iff (6.3), (6.4) hold.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Transform E₂* and the derivative to each finite-level cusp.
2. The leading log y and constant terms depend only on gcd(N,denominator); keep the y^(-1)log y remainder.

**Dependencies:** `QSeriesPartitionsAndMockModularForms:QM.3/nonholomorphic-eisenstein-series-e2-star`, [Eisenstein Mellin asymptotics](#target-gz-6-classical-eisenstein-mellin-asymptotics), `ModularCurvesPartII:R14.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 297-298. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-boundary-eisenstein-orthogonality"></a>

### 6.61 Boundary Eisenstein orthogonality

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality` (theorem).

Let N ≥ 1 and M | N, and let E(z) = E_{2,s}(z)|_{s=0}, F(z) = ∂_sE_{2,s}(z)|_{s=0} as in the proof of (6.2) (the referenced classical source result 264). Then z ↦ E(Mz) and z ↦ F(Mz) lie in M̃₂(Γ₀(N)) and (f, E(M·)) = (f, F(M·)) = 0 for every f ∈ S₂(Γ₀(N)). Consequently Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} has the same Petersson products with cusp forms as 0, and Φ̃ and Φ̃* = Φ̃ − Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} have the same holomorphic projection.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Pair the boundary Eisenstein families with cusp forms in their convergence region.
2. Continue the pairing and differentiate; cusp decay kills the boundary terms, giving zero for both E and F.

**Dependencies:** [Boundary Eisenstein cusp constants](#target-gz-6-classical-boundary-eisenstein-cusps), `ModularCurvesPartII:R14.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), p. 298 ('the function Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms'). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-cusp-matrix-inverse"></a>

### 6.62 Cusp constant matrix inverse

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse` (theorem).

Let C_N = (C_N(N₁, M))_{N₁, M | N}, C_N(N₁, M) = (M, N₁)²/M² (a σ₀(N) × σ₀(N) matrix). The entries are multiplicative, C_{∏p^{ν_p}}(∏p^{λ_p}, ∏p^{μ_p}) = ∏ C_{p^{ν_p}}(p^{λ_p}, p^{μ_p}), so C_N is the Kronecker product of the C_{p^ν} (N = ∏ p^ν). For N = p^ν, C_{p^ν}(p^λ, p^μ) = p^{2 min(λ,μ) − 2μ} (rows λ = 0..ν: (1, p^{−2}, …, p^{−2ν}), (1, 1, p^{−2}, …, p^{−2ν+2}), …, (1, …, 1)), and (6.6) C_{p^ν}^{−1} = (p² − 1)^{−1} × the tridiagonal matrix with diagonal (p², p²+1, …, p²+1, p²), superdiagonal −1, subdiagonal −p². In particular C_N is invertible and (6.3)-(6.4) have a unique solution. The displayed tridiagonal inverse is for ν≥1; for ν=0 use the 1×1 matrix (1).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Factor C_N as the tensor product of its prime-power matrices.
2. Multiply the prime-power matrix by the displayed tridiagonal inverse; both corner rows must be checked. The ν=0 matrix is (1), handled separately.

**Dependencies:** `mathlib:Matrix.mul_apply`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, pp. 299-300, (6.6). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-projection-boundary-coefficients"></a>

### 6.63 Projection boundary coefficients

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-projection-boundary-coefficients` (theorem).

In the setting of (6.2): α(1) = ρ^{−1} Σ_{N₁|N} (μ(N₁)/N₁²) A(N₁), β(1) = ρ^{−1} Σ_{N₁|N} (μ(N₁)/N₁²)(B(N₁) − 2A(N₁) log N₁) − 2α(1) Σ_{p|N} log p/(p² − 1), where μ is the Möbius function and ρ = ∏_{p|N}(1 − p^{−2}) = Σ_{N₁|N} μ(N₁)/N₁². (Proof: C_N^{−1}(1, N₁) = ρ^{−1}μ(N₁)/N₁², and Σ_{N₁|N} (μ(N₁)/N₁²) s_p(N₁) = −2 Σ_{N₁|N} (μ(N₁)/N₁²) A(N₁)(v_p(N₁) + 1/(p²−1)) with s_p(N₁) = Σ_{M|N} C_N(N₁,M)α(M)(v_p(M) − 2 min{v_p(N₁), v_p(M)}).)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Use C_N^(-1) first for α and then for β after removing the α logarithmic term.
2. Extract the M=1 entries and verify the prime-power tensor factorization.

**Dependencies:** [Cusp constant matrix inverse](#target-gz-6-classical-cusp-matrix-inverse), [Boundary Eisenstein cusp constants](#target-gz-6-classical-boundary-eisenstein-cusps).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, (6.7) Proposition, pp. 300-301. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-rankin-cusp-constants"></a>

### 6.64 Rankin cusp constants

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-cusp-constants` (theorem).

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. Let Φ̃ be the function of Prop. (4.5) for k = 1, i.e. Φ̃ = (√δ/2π)·∂/∂s Φ̃_s|_{s=0} with Φ̃_s = Tr^{ND}_N(θ_𝒜(z)E_s^{(1)}(Nz)) (Prop. (1.2)). Then Φ̃ satisfies the hypotheses of (6.2) with A(N₁) = (h/(2u²)) ε(N₁)N₁/N, B(N₁) = A(N₁)(log(N₁²δ/(Nπ)) − γ + 2(L′/L)(1, ε)) (N₁ | N), γ = Euler's constant. (Proof: at a cusp with invariant N₁, (Φ̃_s|₂α)(z) = (1/(2u))(ε(N₁)/N₂)[L(2s+1,ε)(N₁y/N₂)^s − (iV_s(0)/|D|^{1/2}) L(2s,ε)(N₁y/N₂)^{−s}] + … with N₂ = N/N₁, V_s(0) = −π^{1/2}Γ(s+½)i/Γ(s+1), using Lemma (2.3) and (2.2) of Chap. IV and the count of cosets of Γ₀(ND)\Γ₀(N)α with D | c (one) and (c, D) = 1 (|D| of them).)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Compute the central derivative kernel at each cusp via its theta/Eisenstein transform.
2. The A(N₁)log y and B(N₁) terms retain the quadratic L logarithmic derivative and level factors.

**Dependencies:** [Classical central-derivative kernel](#target-gz-6-classical-central-derivative-kernel), `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, (6.8) Proposition and proof, pp. 301-303. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-rankin-boundary-coefficients"></a>

### 6.65 Rankin boundary coefficients

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-boundary-coefficients` (theorem).

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. For Φ̃ as in (6.8): α(1) = (h/(2u²)) N^{−1} ρ^{−1} Σ_{N₁|N} μ(N₁)ε(N₁)/N₁ = (h/(2u²)) N^{−1} ∏_{p|N}(1 + ε(p)/p)^{−1}, β(1) = α(1)(log(δ/(Nπ)) − γ + 2(L′/L)(1, ε) − 2 Σ_{p|N} log p/(p² − 1)).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Insert these Rankin cusp constants into the two linear systems.
2. Use the matrix inverse to obtain α(1),β(1), keeping the product Π_(p|N)(1+ε(p)/p)^(-1).

**Dependencies:** [Cusp constant matrix inverse](#target-gz-6-classical-cusp-matrix-inverse), [Rankin cusp constants](#target-gz-6-classical-rankin-cusp-constants).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, display after (6.8), p. 303. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-rankin-mellin-regularization"></a>

### 6.66 Rankin Mellin regularization

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization` (theorem).

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. For m > 0, a_m(y) = A_m log y + B_m + Σ_{n≥1} C_{mn} q₀(4πnNy/δ) (from Prop. (4.5); q₀(t) = ∫₁^∞ e^{−tx}dx/x), with A_m = (h/u)r_𝒜(m), B_m = A_m(log(Nδ/π) − γ + 2(L′/L)(1,ε)) − Σ_{1≤n≤mδ/N} σ′_𝒜(n) r_𝒜(mδ − Nn), C_{mn} = −σ_𝒜(−n) r_𝒜(mδ + Nn) (σ_𝒜, σ′_𝒜 as in Prop. (4.6)). Then ∫₀^∞ a_m(y)e^{−4πmy}y^s dy = Γ(s+1)(4πm)^{−s−1}(A_m (Γ′/Γ)(s+1) − A_m log 4πm + B_m) + Σ_n C_{mn} ∫₀^∞ q₀(4πnNy/δ)e^{−4πmy}y^s dy, and ∫₀^∞ q₀(4πnNy/δ)e^{−4πmy}y^s dy = 2Γ(2s+2)/((4πm)^{s+1}Γ(s+2)) · Q_s(1 + 2nN/(mδ)) + ε_n(s), ε_n(s) = O(n^{−s−2}) (uniformly near s = 0), ε_n(0) = 0, using Q₀(1+2t) = ½ log(1 + 1/t) and Q_s(1+2t) = (Γ(s+1)²/(2Γ(2s+2)))[t^{−s−1} + O(t^{−s−2})] (t → ∞). Since C_{mn} = O(n^c) for all c > 0, 4πm ∫₀^∞ a_m(y)e^{−4πmy}y^s dy = B_m − A_m(γ + log 4πm) + (2Γ(2s+2)/((4πm)^sΓ(s+2))) Σ_n C_{mn} Q_s(1 + 2nN/(mδ)) + o(1) (s → 0).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Apply the continued Fourier integral to the differentiated positive, negative and zero branches.
2. Evaluate the logarithmic exponential integral and Legendre tail; only after this continuation extract the constant at s=0.

**Dependencies:** [Classical central-derivative kernel](#target-gz-6-classical-central-derivative-kernel), `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, §6, pp. 303-304. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-projected-derivative-cuspform"></a>

### 6.67 Projected Rankin derivative cusp form

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform` (theorem).

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. There exists a holomorphic cusp form Φ_𝒜(z) = Σ_{m≥1} a_{m,𝒜} e^{2πimz} of weight 2 and level N such that L_𝒜(f, 1) = 0 and L′_𝒜(f, 1) = (8π²/√δ)(f, Φ_𝒜) for every cusp form f in the space spanned by newforms of weight 2 and level N. (δ = |D|; the constant equals 8π²/√|D|, consistent with Chap. I (6.2).)

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Check the logarithmic growth condition at every cusp.
2. Apply the boundary-corrected weight-two projection; pairing with a cusp form is unchanged.

**Dependencies:** [Logarithmic weight-two projection](#target-gz-6-classical-holomorphic-projection), [Classical central-derivative kernel](#target-gz-6-classical-central-derivative-kernel), [Rankin cusp constants](#target-gz-6-classical-rankin-cusp-constants), [Rankin boundary coefficients](#target-gz-6-classical-rankin-boundary-coefficients), [Rankin Mellin regularization](#target-gz-6-classical-rankin-mellin-regularization).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (i), p. 305. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §9, (9.2) with k = 1, p. 233; proved in Chapter IV, Theorem (6.9), p. 305 (via Rankin's method §§1–3, the functional equation §4 and holomorphic projection with Hecke's trick §6). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-6-classical-projected-derivative-coefficients"></a>

### 6.68 Projected Rankin derivative coefficients

**Target:** `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-coefficients` (theorem).

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. For m prime to N, a_{m,𝒜} = − Σ_{1≤n≤m|D|/N} σ′_𝒜(n) r_𝒜(m|D| − nN) + (h/u) r_𝒜(m)[log(N|D|/(4π²m)) − 2γ + 2(L′/L)(1, ε)] + lim_{s→0}[−2 Σ_{n≥1} σ_𝒜(−n) r_𝒜(m|D| + nN) Q_s(1 + 2nN/(m|D|)) − (hκ/u²) σ₁(m) s^{−1}] + (hκ/u²)[σ₁(m)(log(N/|D|) + 2 Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)], where σ₁(m) = Σ_{d|m} d, κ = −12/(N ∏_{p|N}(1 + ε(p)/p)), σ_𝒜, σ′_𝒜 as in Prop. (4.6), Q_s = Legendre function of the second kind, γ = Euler's constant.

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. Insert the explicit Mellin constants and α(1),β(1) into the projection formula.
2. Combine the divisor logs using σ₁(m)log m−2σ′₁(m); the archimedean tail carries σ_A(−n).

**Dependencies:** [Projected Rankin derivative cusp form](#target-gz-6-classical-projected-derivative-cuspform), [Rankin Mellin regularization](#target-gz-6-classical-rankin-mellin-regularization), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (ii), p. 305. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

**Coverage:** planned. The following boundaries remain:

- Complete Picard modularity/trace proof inspection, actual automorphic/Picard carriers and regularized projection estimates.
- The precise unsupported Arakelov, analytic projection and CM lifting supplier extensions listed in the contract audit.

<a id="layer-7"></a>

## Layer 7: Local arithmetic identities and boundary contributions

**Atlas planets:** Degenerate Schwartz functions; Local arithmetic identity; Nearby quaternionic approximation; Modular cusp correction.

**Examples.**

- Marked cusp height comparisons require N>1. The cusps 0 and ∞ coincide at N=1, so their disjointness cannot be imported there.
- A new CM Hom element has nonzero anti-CM component b₋. This exclusion is needed before taking ord_p(Nb₋).

<a id="target-gz-7-degenerate-schwartz-classes"></a>

### 7.1 Degenerate Schwartz classes

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes` (definition).

At a finite place v, fix B_v=E_v⊕E_v j_v and write x=x₁+x₂ in these orthogonal summands. Define S¹ by Φ_v(x,u)=0 whenever ord_v(uq(x))≥−ord_v(d_v) or ord_v(uq(x₂))≥−ord_v(d_v), where d_v generates the different of F_v. Define S² by (r(g)Φ_v)(0,u)=0 for every g∈GL₂(F_v) and u∈F_v×. For the YZZ reduction choose an exceptional finite set S₁ of nonsplit places containing the ramification of F, E, B, σ and χ, and two auxiliary split unramified places S₂ disjoint from S₁. Use S¹ at S₁ and S² at S₂, with standard functions at nonsplit places outside S₁ and standard archimedean data. These subspaces impose different conditions; zero-evaluation for the identity Weil translate is insufficient for S².

**Hypotheses.**

- Finite v with the specified quadratic extension, orthogonal decomposition, different and actual extended Weil representation.
- For the global reduction, S₁ contains at least two finite places and all exceptional nonsplit places; S₂ consists of two split places unramified for σ and χ. Choose principal-congruence local levels at finite places, sufficiently deep at S₁, maximal at nonsplit places outside S₁ and at S₂. Exclude −1 globally and require the quotient maps used in the comparison to be unramified.

**Outline.**

1. Form the support-vanishing subspace S¹ and the intersection of the zero-evaluation kernels of all Weil translates S².
2. At nonsplit places use the anisotropic complementary summand and unipotent differences to obtain a nonzero theta image in each infinite irreducible representation.
3. At each auxiliary split place apply a Hecke operator minus its degree to the standard function; its Satake eigenvalue differs from the degree for the required infinite unitary representation, while its entire Weil orbit vanishes at zero.
4. Use multiplicity one and factorization to select pure tensor data with nonzero normalized toric contraction. The zero function alone does not prove this nonvanishing.

**Dependencies:** `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, [Nonzero toric test vectors](#target-gz-4-toric-test-vectors).

**Uses.**

- `YZZ Chapter5`: Remove self, singular, constant and Hodge terms in the kernel comparison.
- `Colmez Assumption7.1`: Use two explicit auxiliary split test functions to remove the constant term.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `degenerateSchwartzOne` | constructor | The support-vanishing subspace S¹. |
| `degenerateSchwartzTwo` | constructor | The orbit-zero subspace S². |
| `degenerateSchwartzOne_support` | characterisation | Either of the two valuation inequalities forces Φv(x,u)=0. |
| `degenerateSchwartzTwo_translate` | characterisation | Every Weil translate evaluates to zero at (0,u). |

**Checks.**

- `degenerateSchwartz_zero` (degenerate): The zero function belongs to both subspaces.
- `degenerateSchwartzOne_boundary` (computation): Equality v(uq(x₂))=−v(dv) already forces zero.
- `degenerateSchwartzTwo_identity_only` (non-example): Vanishing of Φv(0,u) alone is insufficient: every r(g) translate must vanish there.

**Acceptance.**

- Use S¹ at the exceptional nonsplit set and S² at the two auxiliary split places; preserve their different definitions.
- The global reduction includes nonzero toric contraction and sufficiently small level, rather than only membership in a degenerate subspace.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.8, printed p. 17. Gives the two degeneracy classes and their defining conditions. The locator is inherited from the reviewed decomposition; this session did not independently acquire the full book proof.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, Assumptions 5.2.1–5.2.5 and Proposition 5.2.7, pp. 185–187; Propositions 5.3.1–5.3.2, pp. 189–191; Proposition 5.4.1 and proof, pp. 191–193. The detailed reduction uses S¹ at exceptional nonsplit places and S² at two auxiliary split places. The nonzero local theta-image arguments use anisotropic support and a Hecke-eigenvalue/degree difference respectively. These draft locators are independent of the inherited 2013 introduction locator.

<a id="target-gz-7-good-local-arithmetic-identity"></a>

### 7.2 Good-place arithmetic identity

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity` (theorem).

Under the source’s degeneracy assumptions and standard good local data, the derivative local Whittaker component equals twice the arithmetic local height component. At finite nonsplit good places prove this from the actual CM deformation lengths, separating inert and ramified ordinary/supersingular cases; at division places use the nearby coherent algebra and Drinfeld uniformization. Archimedean local Green kernels agree with the holomorphically projected derivative after the same normalization. The general bad/wild case is handled by approximation, not by an unsupported explicit good-place formula.

**Hypotheses.**

- Good local level/conductor and degeneracy conditions as specified in the source
- Finite deformation theory and archimedean spectral convergence imported

**Outline.**

1. Compute lengths of the CM lifting loci and translate them to proper-cycle intersections.
2. Match these lengths with the derivative representation-density/Whittaker coefficients.
3. At infinity integrate the Green/resolvent expansion and prove the normalized identity.

**Dependencies:** [Degenerate Schwartz classes](#target-gz-7-degenerate-schwartz-classes), [Faltings–Hriljac comparison](#target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions), [Incoherent central derivative](#target-gz-6-incoherent-central-derivative), `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `AutomorphicSpectralTheory:AS.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Acceptance.**

- Ordinary split vanishing, supersingular inert and superspecial division cases have distinct formulas.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.9, printed pp. 18-19. States which local identities are proved directly and identifies the bad-prime obstruction that the approximation argument circumvents. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, Theorem 7.4.1 and its hypotheses in §7.4.1, pp. 233–236; Proposition 8.1.1, pp. 242–243; Proposition 8.2.7, pp. 248–249. The theorem separates split, archimedean, good nonsplit and exceptional finite places. The unramified multiplicity calculation includes the log(Nv) factor; general bad-place deformation proofs remain a gate.

<a id="target-gz-7-nearby-coherent-orthogonality"></a>

### 7.3 Nearby coherent kernel orthogonality

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/nearby-coherent-orthogonality` (theorem).

For an incoherent quaternionic collection 𝔅, switching its Hasse invariant at a nonsplit place v gives a coherent algebra B(v). A coherent toric theta kernel attached to B(v) is perpendicular to the target quaternionic constituent σ when its local ramification set disagrees with the corrected distinction set Σ(π,χ). The function need not vanish: its σ-Petersson pairing vanishes by the local zero-Hom theorem.

**Hypotheses.**

- B(v) is coherent and K embeds as required; the local sign mismatch is at a specified place

**Outline.**

1. Compare the switched local Hasse invariant with the toric epsilon sign.
2. Factor the coherent toric pairing and apply the vanishing local Hom.
3. Use global see-saw/projection to conclude perpendicularity.

**Dependencies:** [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Coherent quaternionic theta specialization](#target-gz-5-coherent-quaternionic-specialization), `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`.

**Acceptance.**

- A nonzero coherent kernel with wrong local sign is allowed; only its σ-component is zero.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.10, printed p. 19. Gives the definition of approximation, the density argument and the nearby quaternion algebra construction. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.4.3, pp. 236–237. After global automorphic comparison, the local epsilon mismatch makes the toric functional on the nearby coherent theta constituent vanish. It does not make each local error kernel zero.

<a id="target-gz-7-degenerate-schwartz-functions-local-decomposition-and-approximation"></a>

### 7.4 Nearby quaternionic approximation

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation` (theorem).

For the source’s degenerate global Schwartz data, decompose Pr I′ and Z̃ into finitely supported nonsplit local terms. At the bad places their analytic–arithmetic difference is approximated by coherent kernels from B(v), meaning equality on 1^SGL₂(A^S) for a specified finite S. Once the total difference and coherent sum are automorphic with the requisite continuous/K-finite transformation law, the source’s approximation/density argument upgrades the comparison to Pr I′−2Z̃=Σ_v I(0,·,χ,Φ(v)). This sum is generally nonzero, but its σ-projection vanishes by nearby-coherent orthogonality.

**Hypotheses.**

- The S₁/S₂ support, level, unramified and nonzero toric-contraction conditions specified by degenerate-schwartz-classes; archimedean standard functions.
- Density is invoked only in the automorphic category, not to infer a local bad-prime equality

**Outline.**

1. Kill self, logarithmic singular, constant and Hodge contributions under the precise source conditions.
2. Compute good-place identities and construct nearby coherent approximants at each bad place.
3. Use automorphy and the source density argument for the global difference.
4. Apply the separate toric orthogonality theorem; do not identify the error with zero.
5. Apply pinned mixed-place weak approximation independently to the four matrix entries at the finite exceptional set S. The nonzero determinant locus is open, so the approximating rational matrix can be chosen invertible. Outside S an arbitrary element of GL₂(A^S) adjusts the remaining components. Thus GL₂(F)GL₂(A^S) is dense in GL₂(A); continuity and the common left GL₂(F)-automorphic law extend equality from 1^SGL₂(A^S). This uses weak approximation, with no restriction on determinants from strong approximation.

**Dependencies:** [Degenerate Schwartz classes](#target-gz-7-degenerate-schwartz-classes), [Good-place arithmetic identity](#target-gz-7-good-local-arithmetic-identity), [Nearby coherent kernel orthogonality](#target-gz-7-nearby-coherent-orthogonality), [Arithmetic height kernel](#target-gz-6-arithmetic-height-kernel), [Incoherent central derivative](#target-gz-6-incoherent-central-derivative), `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

**Acceptance.**

- The argument removes mild-ramification hypotheses without claiming universal explicit wild coefficients.

**Sources.**

- [yzz-gross-zagier-shimura-curves-2013](#source-yzz-gross-zagier-shimura-curves-2013), Chapter 1, Sec. 1.5.10, printed p. 19. Gives the definition of approximation, the density argument and the nearby quaternion algebra construction. Reviewed decomposition supplies this locator; the full book proof was not independently acquired in this run.
- [yzz-gross-zagier-shimura-curves-2011-draft](#source-yzz-gross-zagier-shimura-curves-2011-draft), 6 November 2011 draft, §7.4.2–§7.4.3, Theorem 7.4.1 and (7.4.1), pp. 235–237. The local theorem gives genuine identities at good places and nearby coherent Schwartz approximants on the exceptional set. Only the total automorphic difference is extended by density; the coherent error is then killed after the required cuspidal projection.

<a id="target-gz-7-boundary-cusp-correction"></a>

### 7.5 Modular cusp and boundary correction

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/boundary-cusp-correction` (theorem).

For the noncompact split modular curve X₀(N), form the finite-level compactification and regularized Green/Hecke kernels. Their cusp expansions, finite-part constants, tangent-normalized diagonal values and Eisenstein contributions give the boundary corrections in the classical height kernel. The corrected height/Petersson identity holds after removing the explicitly proved old/Eisenstein components. It is not obtained by applying the compact quaternionic formula unchanged, nor by treating the exceptional infinite modular tower as locally noetherian.

**Hypotheses.**

- Classical Heegner hypotheses N, D coprime, D negative fundamental and the ChapterII–IV source hypotheses
- Use finite-level compactified curves and the source’s normalized cusp/tangent data

**Outline.**

1. Compute the resolvent cusp expansion and subtract its pole/constant.
2. Extend the diagonal by the normalized tangent and retain the eta/different self terms.
3. Assemble the finite and infinite corrections and show the remaining difference is old before newform projection.

**Dependencies:** `AutomorphicSpectralTheory:AS.2/automorphic-green`, [Resolvent cusp expansion](#target-gz-7-classical-cusp-expansion), [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Logarithmic weight-two projection](#target-gz-6-classical-holomorphic-projection), `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`.

**Acceptance.**

- A height with r_A(m)≠0 still requires the tangent/self corrections.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), II §§2,5; IV §6; V §1. The classical compactification and self terms provide the noncompact correction.

<a id="target-gz-7-colmez-test-function"></a>

### 7.6 Special test function and integral j

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function` (construction).

Consume quaternion-datum: choose a maximal order Ô_𝔹 ⊇ Ô_E in the finite incoherent quaternion algebra, and put U = Ô_𝔹^×, U_v = O_{𝔹_v}^×. Retain compactness |Σ(𝔹)| ≥ 2 and no common finite ramification of E and 𝔹. Every O_{B_v} below denotes this same chosen local order O_{𝔹_v}. Order containment is an explicit hypothesis, not an inference from Ô_E^× ⊂ U (E28). Take φ = ⊗φ_v with: (1) v|∞: the standard Gaussian; (2) v finite, nonsplit in E, split in B: 1_{O_{B_v}×O_{F_v}^×}; (3) v nonsplit in B: 1_{O_{B_v}^××O_{F_v}^×}; (4) v ∈ S2, a set of two finite places split in E and unramified over ℚ: 1_{O_{B_v}^××O_{F_v}^×} − (1+N_v+N_v²)^{−1}·1_{ϖ_v^{−1}(O_{B_v})_2×O_{F_v}^×}, where (O_{B_v})_2 = {x ∈ O_{B_v} : v(q(x)) = 2}; (5) v split in E, v ∉ S2: 1_{O_{B_v}×O_{F_v}^×}. For each finite v, fix 𝔧_v ∈ O_{B_v} orthogonal to E_v with v(q(𝔧_v)) ∈ {0,1}, equal to 1 iff B_v is nonsplit (then E_v/F_v is inert). In the split-B case, 𝔧_v acts as Galois conjugation on O_{E_v} ≅ M = O_{F_v}², transported by t ↦ t·m0 with m0 an O_{E_v}-module generator of M, and q(𝔧_v) = −1.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the containing maximal order and primitive O_E-module generator for the integral conjugation element.
2. Form the stated five types of local characteristic functions.
3. At S² apply the Hecke difference with degree N_v²+N_v+1 to prove full Weil-orbit zero evaluation.

**Dependencies:** [Two auxiliary split places](#target-gz-7-colmez-s2-assumption), `HilbertModularVarietiesAndShimuraCurves:R18.5`, `MetaplecticAutomorphicForms:MP.5`.

**Uses.**

- `Yuan–Zhang 2018 §7.2 pp590–592`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `colmezTestFunction_constructor` | constructor | The five-place restricted tensor product with the stated original integral 𝔧. |
| `colmezTestFunction_biinvariant` | relation | φ is invariant under the left and right U actions. |
| `colmezTestFunction_auxiliary_degenerate` | relation | For v∈S², r(g)φv(0,u)=0 for all g,u. |
| `colmezTestFunction_order_containment` | projection | The chosen maximal order explicitly contains O_E,v. |

**Checks.**

- `colmezTestFunction_auxiliary_q_two` (computation): For N_v=2, the second auxiliary term has coefficient −1/7.
- `colmezTestFunction_division_units` (non-example): At a division place φv is supported on order units, not the whole order.
- `colmezTestFunction_primitive_generator` (characterisation): The split-B identification uses an O_E-module generator; a nonprimitive nonzero vector need not give an integral isomorphism.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.2 pp590–592. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-order-sandwich"></a>

### 7.7 Integral order sandwich

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-order-sandwich` (theorem).

Use the chosen O_{B_v} ⊇ O_{E_v} and original integral 𝔧_v of test-function, with no common finite ramification. If D_v is the relative discriminant ideal of E_v/F_v, then D_v O_{B_v} ⊂ O_{E_v} + O_{E_v}𝔧_v ⊂ O_{B_v}, with equality on the right iff E_v/F_v is unramified (including split E_v).

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. When B_v is split, identify the chosen maximal order with End_{O_F}(O_E) using a primitive O_E-generator. Compare the trace-form discriminants of the maximal order and O_E + O_E𝔧_v and compute the dual lattice to obtain D_v O_{B_v} ⊂ O_E + O_E𝔧_v. The index is trivial precisely for unramified E_v/F_v.
2. When B_v is division, E_v/F_v is unramified by the no-common-ramification hypothesis, and O_{B_v} = O_{E_v} + O_{E_v}𝔧_v directly. Do not apply the split maximal-order discriminant-one calculation to this branch.

**Dependencies:** [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma7.3 p592. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-norm-shells"></a>

### 7.8 Norm congruence shells and ramified correction

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells` (construction).

For v finite and nonsplit in E, u ∈ O_{F_v}^× and a ∈ uq(E_v^×j_v) (the nearby line), put D_n(a) = {x2 ∈ E_v𝔧_v : uq(x2) − a ∈ p_v^n d_v^{−1}} and D_n = {x2 ∈ E_v𝔧_v : uq(x2) ∈ p_v^n d_v^{−1}}, with dx2 self-dual for (E_v𝔧_v, uq). Put α_v(y,u) = (log N_v/|D_v|^{1/2})·1_{D_v^{−1}O_{E_v}−O_{E_v}}(y)·Σ_{n=0}^{v(d_v)−1} N_v^n ∫_{D_n} φ_v(y+x2,u)dx2.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Define norm-congruence sets in the original quadratic line with its self-dual measure.
2. Use the local different for the additive-character threshold; define α by the finite shell sum on D⁻¹O_E∖O_E.

**Dependencies:** `AutomorphicLFunctionsAndLocalFactors:AL.1`, [Special test function and integral j](#target-gz-7-colmez-test-function).

**Uses.**

- `Yuan–Zhang 2018 §7.3, pp. 593–594 (D_n(a) and α_v p. 593, D_n p. 594)`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `normShell_constructor` | constructor | D_n(a)={x₂:uq(x₂)−a∈pⁿd⁻¹} and D_n with a=0. |
| `normShell_measure` | projection | Use the self-dual measure of the original quadratic line (E𝔧,uq). |
| `normShell_ramified_correction` | constructor | α uses the finite n<v(d) shell sum off O_E inside D⁻¹O_E. |
| `normShell_inert_cutoff` | relation | In the inert opposite norm class D_n(a) is empty above v(ad). |

**Checks.**

- `normShell_inert_last_shell` (computation): For v(ad)=0 the only possible nonnegative shell is n=0.
- `normShell_unramified_different` (degenerate): If v(d)=0 the finite sum defining α is empty.
- `normShell_different_vs_discriminant` (non-example): Replacing v(d) by v(D) changes the shell bound and is not the same definition.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, pp. 593–594 (D_n(a) and α_v p. 593, D_n p. 594). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-shell-inert"></a>

### 7.9 Inert norm-shell cutoff

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-inert` (theorem).

If Ev/Fv is unramified quadratic and a lies in the opposite nearby norm class, Dn(a)=Dn for n≤v(a dv), and Dn(a)=∅ for n>v(a dv).

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use opposite parity of the valuations of represented norms.

**Dependencies:** [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, Lemma 7.5(1), p. 594; proof p. 595. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-shell-ramified"></a>

### 7.10 Ramified norm-shell volume

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-ramified` (theorem).

For ramified Ev/Fv, Dn(a)=Dn for n≤v(a dv), is empty for n>v(a dv)+v(Dv)−1, and for v(a dv)<n≤v(a dv)+v(Dv)−1 has volume |Dv|^1/2 |dv| |a| q^(v(a dv)−n).

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the conductor of the local quadratic norm subgroup and index-two unit cosets, including wild/dyadic conductor.

**Dependencies:** [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, Lemma 7.5(2), p. 594; proof p. 595. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-k-inert"></a>

### 7.11 Inert logarithmic singularity and diagonal extension

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-inert` (theorem).

For inert v with §7.2 data, kφv(1,y,u)−(1/2)φv(y1,u)1OEj(y2)(v(q(y2)/q(jv))+1)log q extends to a Schwartz function; its restriction to E is φv(y,u)(|dv qjv|−1)log q/((1+q^−1)(1−q)). The jv in the singular term is the original test-function j, not the nearby j.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Insert shell cutoff into normalized Whittaker derivative and evaluate finite geometric sums; verify source's nearby-line convention when implementing.

**Dependencies:** [Inert norm-shell cutoff](#target-gz-7-colmez-shell-inert), [Integral order sandwich](#target-gz-7-colmez-order-sandwich), [Local derivative and zero-term corrections](#target-gz-6-colmez-local-k-c), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, Lemma 7.4(1), pp. 592–593; proof pp. 596–597. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-k-ramified"></a>

### 7.12 Ramified logarithmic singularity and diagonal extension

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-ramified` (theorem).

For ramified v with §7.2 data, subtract (1/2)φv(y1,u)1OEj(y2)(v(qy2)+1)log q from kφv(1,y,u). It extends to Schwartz; on E its value is φv(y,u)[(|dv|−1)/(2(1−q))+(v(Dv)−1)/2]log q+αv(y,u)/2.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Split the shell series into n<v(dv), n≤v(a dv), and the conductor tail; keep α on Dv^−1OE−OE.

**Dependencies:** [Ramified norm-shell volume](#target-gz-7-colmez-shell-ramified), [Local derivative and zero-term corrections](#target-gz-6-colmez-local-k-c), [Integral order sandwich](#target-gz-7-colmez-order-sandwich), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, Lemma 7.4(2), p. 593; proof pp. 597–598. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-c-arch"></a>

### 7.13 Archimedean zero-term correction

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-arch` (theorem).

For standard archimedean φ and all g,y,u, cφv(g,y,u)=0.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Evaluate normalized W0(s) as δ(g)^−s r(g)φ(0,u); derivative cancels the logδ term.

**Dependencies:** [Local derivative and zero-term corrections](#target-gz-6-colmez-local-k-c), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, Lemma 7.6(1), p. 599 (via [YZZ13, Prop. 2.11]). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-c-finite"></a>

### 7.14 Finite zero-term correction

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite` (theorem).

For v non-archimedean, (y,u) ∈ E_v×F_v^× and φ as in §7.2. If v ∉ S2: c_{φ_v}(1,y,u) = φ_v(y,u)·log|d_vq(𝔧_v)| plus φ_v(y,u)·2(|d_vq(𝔧_v)|−1)log N_v/((1+N_v^{−1})(1−N_v)) if E_v/F_v is inert; plus φ_v(y,u)·(|d_vq(𝔧_v)|−1)log N_v/(1−N_v) + α_v(y,u) if ramified; plus 0 if split. If v ∈ S2: c_{φ_v}(1,y,u) = −(2 log N_v/(1+N_v+N_v²))·1_{ϖ_v^{−1}(O_{B_v})_2}(y)·1_{O_{F_v}^×}(u), i.e. 2 log N_v·(φ_v(y,u) − 1_{O_{B_v}^××O_{F_v}^×}(y,u)); on E_v the set ϖ_v^{−1}(O_{B_v})_2 is {y ∈ ϖ_v^{−1}O_{E_v} : q(y) ∈ O_{F_v}^×}. Here α_v is as in Lemma 7.4.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the corrected a=0 Whittaker normalization; compute inert/ramified geometric series and the split norm-product volumes; verify both S2 summands separately.

**Dependencies:** [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.3, Lemma 7.6(2), p. 599; proof pp. 599–604. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-omega-self"></a>

### 7.15 Diagonal coefficient and modified self-intersection

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self` (construction).

Set Ωφ=Σu∈μU²\F* Σy∈E* r(g,(t1,t2))φ(y,u). The coefficient of t2 in Z*t1 is Ωφ/e, e=[E*∩U:μU]=[OE*:OF*] at maximal level. Define i0(t,t)=i(t,t)−Σv iv(t,t)logNv, where iv is the extended local diagonal pairing, not the actual global self-intersection.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Count the double cosets contributing the CM point t₂ and divide by [E×∩U:μU].
2. Subtract that diagonal coefficient to isolate proper intersection; use the extended local symbols for their own finite-part sum.

**Dependencies:** [Special correspondence cycle](#target-gz-6-special-correspondence-cycle), [Finite CM orbit average](#target-gz-6-colmez-torus-average), [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Uses.**

- `Yuan–Zhang 2018 §8.1, pp. 608–609 (the coefficient of [t2]_U in Z_*(g)t1 and Ω_φ); Theorem 8.6(1)–(2), p. 616 (i_0 and i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt)`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `modifiedSelfIntersection_constructor` | constructor | Ωφ and i₀=i−Σv i_v logN_v, with extended local diagonals. |
| `modifiedSelfIntersection_coefficient` | projection | The coefficient of t₂ in Z*t₁ is Ωφ/e. |
| `modifiedSelfIntersection_proper_subtraction` | relation | Subtract Ωφt₂/e before taking the proper horizontal intersection. |
| `modifiedSelfIntersection_average` | compatibility | i_v is the normalized C_U average of the extended local pairing. |

**Checks.**

- `modifiedSelfIntersection_split_extended_zero` (degenerate): At an E-split finite place the extended local diagonal is zero.
- `modifiedSelfIntersection_elliptic_index_two` (computation): For e=2 the diagonal coefficient is Ωφ/2.
- `modifiedSelfIntersection_self_not_extension` (non-example): The actual global arithmetic self-intersection i is not replaced by the sum of formal extended local diagonals.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.1, pp. 608–609 (the coefficient of [t2]_U in Z_*(g)t1 and Ω_φ); Theorem 8.6(1)–(2), p. 616 (i_0 and i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-arch-green"></a>

### 7.16 Regularized archimedean multiplicity

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green` (construction).

For distinct CM lifts use ms(γ)=Qs(1−2λγ), with Qs(t)=∫0∞(t+sqrt(t²−1)cosh u)^−1−s du. Define extended diagonal Green sums by excluding E* and taking the constant Laurent coefficient at s=0.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Import Q_s and the Green/resolvent meromorphic continuation from AS.2.
2. Form the nearby-quaternion sum excluding E× and take its Laurent constant; compare to ordinary distinct-point heights.

**Dependencies:** `AutomorphicSpectralTheory:AS.2`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [Special test function and integral j](#target-gz-7-colmez-test-function).

**Uses.**

- `Yuan–Zhang 2018 §8.2, pp. 609–610`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `regularizedCmGreen_constructor` | constructor | Take the Laurent constant at s=0 of the E×-omitted nearby-quaternion Green sum. |
| `regularizedCmGreen_distinct_points` | compatibility | For distinct points this agrees with the ordinary archimedean local height. |
| `regularizedCmGreen_diagonal_exclusion` | projection | The extended diagonal omits E× multipliers. |
| `regularizedCmGreen_constant_term` | characterisation | The finite part discards the simple-pole term, not the whole Laurent germ. |

**Checks.**

- `regularizedCmGreen_Q_zero` (computation): At s=0, Q₀(t)=½log((t+1)/(t−1)) for t>1.
- `regularizedCmGreen_ordinary_domain` (non-example): Including an E× multiplier on the diagonal introduces the undefined singular term.
- `regularizedCmGreen_pole_subtraction` (characterisation): For a/s+b+O(s), the regularized value is b.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.2, pp. 609–610. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-arch-proper"></a>

### 7.17 Archimedean proper-height expression

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-proper` (theorem).

At a real place, ivbar(Z*t1,t2)proper=Mφ^(v)(g,(t1,t2))−ivbar(t2,t2)Ωφ/e, where M is the regularized ms-weighted nearby-quaternion sum.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Subtract the explicit diagonal multiplicity and apply the off-diagonal Green expansion; justify meromorphic continuation separately.

**Dependencies:** [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Diagonal coefficient and modified self-intersection](#target-gz-7-colmez-omega-self), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.2, Proposition 8.2, p. 610. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-finite-multiplicity"></a>

### 7.18 Finite local multiplicities and diagonal omission

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity` (construction).

(i) Let v be finite and nonsplit in E, and B = B(v). The multiplicity function m is defined on 𝔥_{U_v} = B_v^× ×_{E_v^×} 𝔹_v^×/U_v away from the image of (1,1), with m(b^{-1},β^{-1}) = m(b,β). For distinct [β1]_U ∈ CM_U and [t2]_U ∈ C_U, ī_v(β1,t2) = Σ_{γ∈μ_U\B^×} m(γt_{2v}, β_{1v}^{-1}) 1_{U^v}((β_1^v)^{-1}γt_2^v) ([YZZ13, Lemma 8.2]). For all pairs, ī_v is defined by the same sum over γ ∈ μ_U\(B^× − E^×∩β1Ut2^{-1}), equivalently over (B^×−E^×) ∪ (E^× − β1U_vt2^{-1}). For (y,u) ∈ (B_v−E_v)×F_v^×, m_{φ_v}(y,u) = Σ_{x∈𝔹_v^×/U_v} m(y,x^{-1}) φ_v(x, uq(y)/q(x)). For (y,u) ∈ E_v^××F_v^×, n_{φ_v}(y,u) = Σ_{x∈(𝔹_v^×−yU_v)/U_v} m(y,x^{-1}) φ_v(x, uq(y)/q(x)). (ii) Let v be split in E, with ν1, ν2 above v and E_v diagonal in 𝔹_v ≅ M2(F_v). The function m_ν̄1 on GL2(F_v)/U_v is supported on N(F_v)U_v/U_v. For U_v = (1+p_v^rO_{𝔹_v})^×, m_ν̄1(n(b)) = 1/(N_v^{r−v(b)−1}(N_v−1)) when v(b) ≤ r−1. The function m_ν̄2 is the same with lower unipotents N^t, and m_v̄ = ½(m_ν̄1+m_ν̄2). The extended pairing is ī_ν(β1,t2) = Σ_{γ∈μ_U\(E^×−β1U_vt2^{-1})} m_ν̄(t2^{-1}γ^{-1}β1) 1_{U^v}(β1^{-1}γt2), and ī_v(t,t) = 0. Finally n_{φ_v}(y,u) = ½Σ_{x∈(N(F_v)U_v−U_v)/U_v} φ_v(yx,u) m_ν̄1(x) + ½Σ_{x∈(N^t(F_v)U_v−U_v)/U_v} φ_v(yx,u) m_ν̄2(x).

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Import CM deformation and ordinary/superspecial uniformization multiplicities.
2. Omit exactly the undefined diagonal orbit before forming the extended sum.
3. Change Hecke coset variables to form mφ and nφ; average the two split-prime ordinary functions.

**Dependencies:** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), `HeegnerPointEulerSystems:HE.2`, [Special test function and integral j](#target-gz-7-colmez-test-function).

**Uses.**

- `Yuan–Zhang 2018 §8.2 pp611–616`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmLocalMultiplicity_constructor` | constructor | The geometric multiplicity m away from the diagonal orbit and its mφ,nφ sums. |
| `cmLocalMultiplicity_diagonal_omission` | projection | For an extended pairing omit precisely the undefined E×∩β₁Ut₂⁻¹ summands. |
| `cmLocalMultiplicity_inverse_symmetry` | relation | m(b⁻¹,β⁻¹)=m(b,β). |
| `cmLocalMultiplicity_ordinary_average` | compatibility | At an E-split place use ½(mν₁+mν₂), upper and lower unipotents. |

**Checks.**

- `cmLocalMultiplicity_ordinary_r_one` (computation): For r=1,v(b)=0 the upper-unipotent multiplicity is 1/(N_v−1).
- `cmLocalMultiplicity_split_diagonal` (degenerate): The extended ordinary diagonal is zero.
- `cmLocalMultiplicity_wrong_half_sum` (non-example): Repeating mν₂ twice misses an upper-unipotent contribution; the two prime contributions must be averaged.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.2 pp611–616. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-nonsplit-proper"></a>

### 7.19 Nonsplit proper-height expression

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonsplit-proper` (theorem).

For nonsplit finite v, ivbar(Z*t1,t2)proper=Mφ^(v)+Nφ^(v)−ivbar(t2,t2)Ωφ/e, with M from mφ and N from nφ, and the distinct torus-translation conventions of Proposition8.3.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Separate B(v)*−E* terms from E* off-diagonal terms in the multiplicity sum and regroup through Hecke cosets.

**Dependencies:** [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Proposition8.3 pp611–612. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-ordinary-pairing"></a>

### 7.20 Ordinary multiplicity and local pairing

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-ordinary-pairing` (theorem).

Let v be split in E, with 𝔹_v ≅ M2(F_v), E_v the diagonal torus, and ν1 corresponding to the upper-left idempotent. For every open compact U and distinct CM points [β1]_U ∈ CM_U, [t2]_U ∈ C_U: ī_ν1(β1,t2) = Σ_{γ∈μ_U\E^×} m_ν̄1(t2^{-1}γ^{-1}β1) 1_{U^v}(β1^{-1}γt2). Here m_ν̄1: GL2(F_v)/U_v → Q is Zhang's ordinary multiplicity, supported on N(F_v)U_v/U_v. For U_v = (1+p_v^rO_{𝔹_v})^×, m_ν̄1(n(b)) = 1/(N_v^{r−v(b)−1}(N_v−1)) when v(b) ≤ r−1 ([Zha01, Lemma 5.5.1]). The same holds for ν2 with lower-triangular unipotents. Extended to all pairs by summing over γ ∈ μ_U\(E^×−β1U_vt2^{-1}), the formula gives ī_ν1(t2,t2) = 0 for every [t2]_U ∈ C_U.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. At small level the only contributing global γ is unique modulo μ; pass to general level using projection and the factor [μU:μU'].

**Dependencies:** [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.2, Lemma 8.4, pp. 613–614; ν2 version and m_v̄, i_v̄, pp. 614–615. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-split-proper"></a>

### 7.21 Split proper height and zero extended diagonal

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-split-proper` (theorem).

For E-split v, ivbar(t,t)=0 and ivbar(Z*t1,t2)proper=Nφ^(v), the half-sum of the two ordinary unipotent multiplicities.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use commutativity for the diagonal and change Hecke coset variables for the proper terms.

**Dependencies:** [Ordinary multiplicity and local pairing](#target-gz-7-colmez-ordinary-pairing), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Proposition8.5 pp615–616. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-height-decomposition-series"></a>

### 7.22 Full local decomposition of the height series

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-height-decomposition-series` (theorem).

Let (B,E,U) be as in §7.2 with |Σ| > 1, and let φ ∈ S(𝔹×A^×) be U×U-invariant and satisfy Assumption 7.1. Then for all t1,t2 ∈ C_U and g ∈ GL2(A): Z(g,(t1,t2),φ)_U = −Σ_{v nonsplit in E}(log N_v)∫_{C_U} M^{(v)}_φ(g,(tt1,tt2))dt − Σ_{v∤∞} N^{(v)}_φ(g,(t1,t2)) log N_v − Σ_{v∤∞} j_v(Z_*(g,φ)t1,t2) log N_v − i_0(t2,t2)Ω_φ(g,(t1,t2))/[E^×∩U:μ_U]. Here log N_v = 1 for real v. i_0(t2,t2) = i(t2,t2) − Σ_v i_v(t2,t2) log N_v, with i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt the extended local pairing. M^{(v)} is given by Proposition 8.2 for v|∞ and Proposition 8.3 for finite v. N^{(v)} is given by Proposition 8.3 for nonsplit v and Proposition 8.5 for split v. N^{(v)}(g,(tt1,tt2)) = N^{(v)}(g,(t1,t2)) because only y ∈ E^× occurs.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use rev-hodge-class-terms-vanish-and coefficientwise over finite permitted fields, with pairings normalized by [H:F]. Its two S2 places kill the Hodge cross terms. Decompose proper horizontal and vertical intersections, isolate the self-term, and use C_U-invariance of N; retain normalized C_U averages and log N_v = 1 at real v.

**Dependencies:** [Archimedean proper-height expression](#target-gz-7-colmez-arch-proper), [Nonsplit proper-height expression](#target-gz-7-colmez-nonsplit-proper), [Split proper height and zero extended diagonal](#target-gz-7-colmez-split-proper), [Diagonal coefficient and modified self-intersection](#target-gz-7-colmez-omega-self), [Two auxiliary split places](#target-gz-7-colmez-s2-assumption), [Hodge-class terms vanish and the height series splits into horizontal and vertical parts](#target-gz-6-colmez-rev-hodge-class-terms-vanish-and), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Theorem8.6 pp616–617. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-local-m-inert"></a>

### 7.23 Supersingular inert local intersection

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert` (theorem).

For E-inert and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+1)/2.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use YZZ local deformation multiplicity with its inert norm classes; the nearby j belongs to the switched algebra.

**Dependencies:** [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Special test function and integral j](#target-gz-7-colmez-test-function), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [Corrected CM multiplicity at 𝔹-split, E-nonsplit places](#target-gz-7-colmez-rev-corrected-cm-multiplicity-at-split).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma8.7(1), first case pp617–618. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-local-m-ramified"></a>

### 7.24 Wild-inclusive ramified local intersection

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified` (theorem).

For E-ramified and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+v(Dv))/2, including wild ramification.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the corrected c=0 multiplicity (1/2)v(Dv λ), not the erroneous tame-only formula inherited from Zha01/YZZ; original Gross lifting proof remains a gate.

**Dependencies:** [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Special test function and integral j](#target-gz-7-colmez-test-function), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [Corrected CM multiplicity at 𝔹-split, E-nonsplit places](#target-gz-7-colmez-rev-corrected-cm-multiplicity-at-split).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma8.7(1), second case pp617–618. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-local-m-division"></a>

### 7.25 Superspecial local intersection

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-division` (theorem).

For B-division (hence E-inert) v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·v(qy2)/2.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the integral upper-half-plane multiplicity of Lemma8.8 and Bv*/Uv≃Z.

**Dependencies:** [Superspecial multiplicity by uniformization](#target-gz-7-colmez-superspecial-m), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma8.7(1), third case pp617–619. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-local-n"></a>

### 7.26 Diagonal-correction local coefficient

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-n` (theorem).

Let (U,φ) be as in §7.2. For every finite place v ∉ S2 and (y,u) ∈ E_v^××F_v^×, n_{φ_v}(y,u) = φ_v(y,u)·½v(q(y)). For 𝔹_v nonsplit this is identically 0, since v(q(y)) = 0 on supp φ_v; for v nonsplit in E and 𝔹_v split it is the c ≥ 1 sum Σ_c m(y^{-1},h_c)vol(E_v^×h_cGL2(O)∩M2(O)_n); for v split it is ½(v(a)+v(d)) for y = diag(a,d). For v ∈ S2: n_{φ_v}(y,u) = −(1+N_v+N_v²)^{-1}·1_{ϖ_v^{-1}(O_{𝔹_v})_2}(y)·1_{O_{F_v}^×}(u). The ψ1 part vanishes, and the ψ2 part equals ½((1+v(a))+(1+v(d))) = 1 on its support. With the corrected Lemma 7.6(2) at S2, c_{φ_v}(1,y,u) = −(2log N_v/(1+N_v+N_v²))ψ2(y,u), so d_{φ_v}(1,y,u) = 0 still holds there.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the chosen order and original 𝔧_v of test-function. Outside S2, omit conductor c = 0 in the nonsplit-E/split-B sum; at division B the norm valuation vanishes on support; in the split case the shell counts give ½(v(a)+v(d)).
2. At S2 compute each summand separately: n_{ψ1} = 0, while n_{ψ2} = ½((1+v(a))+(1+v(d))) = 1 on ψ2 support because v(a)+v(d) = 0. Thus n_φ = −ψ2/(1+N_v+N_v²), not zero. Use c_φ = −2ψ2 log N_v/(1+N_v+N_v²) = 2n_φ log N_v, and log|u q(y)| = 0 there, to obtain d_φ = 0.

**Dependencies:** [Ordinary multiplicity and local pairing](#target-gz-7-colmez-ordinary-pairing), [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Special test function and integral j](#target-gz-7-colmez-test-function), [Finite zero-term correction](#target-gz-7-colmez-c-finite).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma8.7(2) pp617–619. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-superspecial-m"></a>

### 7.27 Superspecial multiplicity by uniformization

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m` (theorem).

For B-division and E-inert v, m(γ,β) vanishes unless qγ qβ is a unit and γ∈Ev*(1+OE,v πv jv); in that support m(γ,β)=v(λγ)/2.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use Čerednik–Drinfeld formal uniformization, reduce to two sections of P¹ over OEv with nonrational reductions, and compute largest congruence exponent for γ=a+bj.

**Dependencies:** `HilbertModularVarietiesAndShimuraCurves:R18.5`, [Special test function and integral j](#target-gz-7-colmez-test-function), `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma8.8 pp619–621. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-vertical-pseudo"></a>

### 7.28 Vertical correction is nonsingular pseudo-theta

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo` (theorem).

Let v be finite, nonsplit in 𝔹 and inert in E, with (U,φ) as in §7.2 (U_v = O_{𝔹_v}^×, φ_v = 1_{O_{𝔹_v}^×}⊗1_{O_{F_v}^×}), and B = B(v), so B_v ≅ M2(F_v). Fix a lift Ṽ = Σ_i a_iW̃_i to Ω̂⊗O_{F_v^ur} of the vertical divisor V_1. For t1,t2 ∈ C_U: j̄_v(Z_*(g,φ)t1,t2) = Σ_{u∈μ_U²\F^×} Σ_{γ∈B^×} r(g,(t1,t2))φ^v(γ,u) l^{(t1,t2)}_{r(g)φ_v}(γ,u), where l^{(t1,t2)}_{φ_v}(γ,u) = Σ_{x∈𝔹_v^×/U_v} φ_v(x, uq(t1^{-1}γt2)/q(x)) 1_{O^×}(q(x)/q(t1^{-1}γt2)) (γ^{-1}z0·Ṽ) = (γ^{-1}z0·Ṽ)·1_{O^×}(q(γ)q(t2)/q(t1))·1_{O^×}(u), and γ^{-1}z0·Ṽ = Σ_i a_i1_{α_iF_v^×GL2(O_{F_v})}(γ^{-1}). This kernel is supported on finitely many cosets of GL2(O_{F_v}) in B_v^× and on u ∈ O^×. It therefore extends by zero to a Schwartz function on B_v×F_v^×, so j̄_v and j_v = ∫_{C_U} j̄_v(Z_*(g)tt1,tt2)dt are finite sums of nonsingular pseudo-theta series on the full space B(v). Remark 8.10: the same holds for any U_v-invariant φ_v with φ_v(0,u) = 0.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the direct kernel in the second displayed formula on p. 623 with the fixed lift Ṽ. Its dependence on t1,t2 enters through q(t2)/q(t1); on φ_v = 1_{O_{𝔹_v}^×}⊗1_{O_F^×} the x-sum reduces to the unit-norm indicator times (γ^{-1}z0·Ṽ). No assertion that t2 fixes every component, and no equivariant-lift argument, is needed.
2. Index the finitely many components of Ṽ by α_i F_v^×GL2(O_F). Their indicators give the direct component pairing on p. 624. Combined with the fixed norm valuation, each such support is a finite union of GL2(O_F)-cosets, hence compact and open away from singular matrices. Extend by zero to a Schwartz function and apply the finite C_U average. This is the accepted amended E17 repair.

**Dependencies:** [Superspecial multiplicity by uniformization](#target-gz-7-colmez-superspecial-m), [Pseudo-theta datum](#target-gz-6-colmez-pseudo-theta), [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension), `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma8.9,Remark8.10 pp622–624. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-vertical-split-zero"></a>

### 7.29 Vertical correction vanishes at B-split places

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-split-zero` (theorem).

At a finite B-split place in the maximal-level setup, jv(Z*t1,t2)=0.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use a smooth auxiliary-level cover with disjoint irreducible fiber components and descend their underlying component decomposition to the quotient.

**Dependencies:** `HilbertModularVarietiesAndShimuraCurves:R18.5`, [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.3 p621. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-kernel-schwartz"></a>

### 7.30 Analytic–arithmetic difference is a finite pseudo-theta sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-kernel-schwartz` (theorem).

For §7.2 data, archimedean K−M=0; at finite nonsplit v, k−m logq extends to Schwartz; dφ=2nφ logq−cφ+(2logδ+log|uqy|)rφ extends to Schwartz on E. All but finitely many local differences vanish identically.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use Lemmas7.4/7.6/8.7 and unramified Iwasawa covariance; combine with the vertical nonsingular series.

**Dependencies:** [Inert logarithmic singularity and diagonal extension](#target-gz-7-colmez-k-inert), [Ramified logarithmic singularity and diagonal extension](#target-gz-7-colmez-k-ramified), [Finite zero-term correction](#target-gz-7-colmez-c-finite), [Diagonal-correction local coefficient](#target-gz-7-colmez-local-n), [Vertical correction is nonsingular pseudo-theta](#target-gz-7-colmez-vertical-pseudo), [Projected derivative decomposition](#target-gz-6-colmez-projected-derivative), [Full local decomposition of the height series](#target-gz-7-colmez-height-decomposition-series), [Archimedean proper-height expression](#target-gz-7-colmez-arch-proper), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §9.1 pp625–627. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-local-cancel-nonsplit"></a>

### 7.31 Nonsplit diagonal cancellation

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-nonsplit` (theorem).

Let v be finite and nonsplit in E, with (U,φ,𝗃_v,j_v) as in §7.2. For (y,u) ∈ E_v×F_v^×: 2k_{φ_v}(1,y,u) − 2m_{φ_v}(y,u)log N_v + d_{φ_v}(1,y,u) = −log|d_vq(𝗃_v)|_v·φ_v(y,u). Here k_{φ_v}(1,·) − m_{φ_v}·log N_v is the Schwartz extension from B(v)_v−E_v to B(v)_v×F_v^× of Lemmas 7.4 and 8.7, evaluated on E_v, and d_{φ_v}(1,y,u) = 2n_{φ_v}(y,u)log N_v − c_{φ_v}(1,y,u) + log|uq(y)|_vφ_v(y,u).

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Insert inert or ramified singularity-subtracted restrictions. In the ramified case α cancels and the remaining v(Dv) term cancels the geometric multiplicity correction.

**Dependencies:** [Analytic–arithmetic difference is a finite pseudo-theta sum](#target-gz-7-colmez-kernel-schwartz), [Wild-inclusive ramified local intersection](#target-gz-7-colmez-local-m-ramified), [Supersingular inert local intersection](#target-gz-7-colmez-local-m-inert), [Superspecial local intersection](#target-gz-7-colmez-local-m-division), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §9.1, Proposition 9.2(1), pp. 627–628. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-local-cancel-split"></a>

### 7.32 Split diagonal cancellation

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-split` (theorem).

For split finite v, with the chosen order and original 𝔧_v of test-function, d_φ(1,y,u) = −log|d_v q(𝔧_v)| φ_v(y,u). At v ∉ S2 use the usual local-n and c-finite formulas. At v ∈ S2 one has c_φ = 2n_φ log N_v, log|u q(y)| = 0 on support, q(𝔧_v) = −1 and |d_v| = 1, so both sides are zero.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. For v ∉ S2, n_φ = ½v(q(y))φ_v, c_φ = φ_v log|d_v q(𝔧_v)|, and u is a unit on support. Substitute in d_φ = 2n_φ log N_v − c_φ + log|u q(y)|φ_v (p. 626). Since log|q(y)| = −v(q(y))log N_v, the valuation terms cancel, leaving −c_φ.
2. At S2 use the separate corrected formulas n_φ = −ψ2/(1+N_v+N_v²), c_φ = 2n_φ log N_v and log|u q(y)| = 0. With the same d_φ convention as Proposition 9.2, the two correction contributions cancel, giving d_φ = 0. The different is a unit since F_v/Q_p is unramified, and the original 𝔧_v has norm −1. Never replace the S2 computation by the usual valuation formula.

**Dependencies:** [Diagonal-correction local coefficient](#target-gz-7-colmez-local-n), [Finite zero-term correction](#target-gz-7-colmez-c-finite), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Proposition9.2(2) p628. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-nonzero-theta"></a>

### 7.33 Nonzero associated weight-one theta

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta` (theorem).

Let (F,E,𝔹,U,φ) be as in §7.2. The weight-one theta series θ_{Ω,1}(g) = Σ_{u∈μ_U²\F^×} Σ_{y∈E} r_E(g)φ(y,u), which is the outer theta series of Ω_φ, is not identically zero. Take g_v = [[0,1],[−1,0]] at v ∈ Σ_f ∪ S2 and g_v = 1 elsewhere. Every term r_E(g)φ(0,u) is ε times a nonnegative number, with ε = Π_{v∈Σ_f}λ(E_v/F_v,ψ_v) ∈ {±1}, and |r_E(g)φ(0,1)| > 0. At v ∈ S2, ∫_{E_v}φ_v(y,1)dy = (1−N_v^{-1})²(1 − 3/(1+N_v+N_v²)) > 0. So the finite sum over u ∈ O_F^{×,+}/μ_U² is nonzero.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the Weil action of E itself, rather than the ambient quaternion algebra, at the specified g. Inert division places contribute their Weil index λ(E_v/F_v,ψ_v), which is independent of u on the allowed support. Their product is the common sign ε.
2. Every constant-term summand is ε times a nonnegative quantity. At S2 the integral is (1−N_v^{-1})²(1−3/(1+N_v+N_v²)) > 0, and the remaining factors at u = 1 have nonzero absolute value. Therefore |r_E(g)φ(0,1)| > 0; the finite sum over O_F^{×,+}/μ_U² has sign ε and cannot vanish. Positivity of the signed constant term is not required.

**Dependencies:** [Special test function and integral j](#target-gz-7-colmez-test-function), `MetaplecticAutomorphicForms:MP.5`.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §9.1, p. 628. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-adjunction-arch"></a>

### 7.34 Archimedean adjunction constant

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-arch` (theorem).

With Petersson norm ||dz||=2 Im z and Q0(t)=(1/2)log((t+1)/(t−1)), the limit of m0(z0,z1)−log(2 Im z1/|z1−z0|) as z1→z0 is 0, so −log||1||w=iw(P,P)/e.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Algebraically rewrite as (1/2)log(1+|z1−z0|²/(4Imz0 Imz1))−(1/2)log(Imz1/Imz0); both limits vanish.

**Dependencies:** [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Residue-normalized adjunction line](#target-gz-2-colmez-residue-line), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §9.2 pp631–632. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-small-level-diagonal"></a>

### 7.35 Extended local diagonal vanishes at small away-v level

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal` (theorem).

For nonsplit finite v, with U'v sufficiently small and U'v normal in Uv away from v as in §9.2, ivbar([1]U',[1]U')=0. For split v it is zero without shrinking.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Bound support in a compact local subgroup; in a totally definite nearby algebra global units modulo central μ are finite; shrink the away-v level to exclude the noncentral cosets.

**Dependencies:** [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §9.2, Lemma 9.5, p. 634 (split case, p. 635). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-modified-projection"></a>

### 7.36 Geometric realization of extended self-intersection

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection` (theorem).

Let (B,E,U) be as in §7.2 with |Σ| > 1, P = [1]_U ∈ X_U(H) (H the Hilbert class field of E), w a finite place of H over v, and R = O_{H_w^ur}. Let U′ = U_vU′^v, where U′^v ⊂ U^v is open, normal and small enough that X_{U′,R} is regular, E^× ∩ U′μ_U = μ_U, and Lemma 9.5 holds. Let π: X_{U′,R} → X_{U,R} be the projection. Then every irreducible component 𝒫′ of the divisor π^*𝒫_R is the image of a section Spec R → X_{U′,R} and occurs in π^*𝒫_R with multiplicity e = [O_E^×:O_F^×]. Moreover i_w(P,P) = ī_v(P,P) = ⟨π^*𝒫_R − e𝒫′, 𝒫′⟩, a proper intersection on the special fibre of X_{U′,R}. If v is split in E, both sides are 0.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Choose U′ away from v so the model is regular and E^× ∩ U′μ_U = μ_U. Since U′_v = U_v contains O_{E_v}^×, the class fields defining the CM lifts and their U-translates are unramified at w over the Hilbert class field H. Thus the lifts are H_w^ur-rational; properness extends them to sections over R.
2. The stabilizer condition gives ramification multiplicity e in π^*𝒫_R. Use small-level diagonal vanishing, Lemma 9.5 and the U/U′ projection sum, dividing by [μ_U:μ_{U′}], to obtain the proper intersection. The coarse projection need not be étale (E18).

**Dependencies:** [Extended local diagonal vanishes at small away-v level](#target-gz-7-colmez-small-level-diagonal), [Diagonal coefficient and modified self-intersection](#target-gz-7-colmez-omega-self), `HilbertModularVarietiesAndShimuraCurves:R18.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Lemma9.4 pp632–635, with E18 caveat. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-adjunction-finite"></a>

### 7.37 Finite adjunction lattice identity

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-finite` (theorem).

For the residue image N at a finite place w, Nw contains OHw and length(Nw/OHw)=iw(P,P)/e.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Pull to the small-level regular model; compare π*O(P/e)|P' with O(P')|P', take the ideal of π*P/e−P', and apply the proper intersection formula.

**Dependencies:** [Geometric realization of extended self-intersection](#target-gz-7-colmez-modified-projection), [Residue-normalized adjunction line](#target-gz-2-colmez-residue-line), [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §9.2 pp633–634. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-arithmetic-adjunction"></a>

### 7.38 Arithmetic adjunction for the CM point

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-arithmetic-adjunction` (theorem).

For compact §7.2 data, i0(P,P)/[OE*:OF*]=−h_LU(P).

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Sum finite residue-lattice lengths and archimedean norms; the arithmetic degree of the residue-normalized line gives the identity.

**Dependencies:** [Archimedean adjunction constant](#target-gz-7-colmez-adjunction-arch), [Finite adjunction lattice identity](#target-gz-7-colmez-adjunction-finite), [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Theorem9.3 pp629–635. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-s2-assumption"></a>

### 7.39 Two auxiliary split places

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption` (definition).

A set S2 of two non-archimedean places of F, split in E and unramified over Q, such that for v ∈ S2 the group U_v is maximal and r(g)φ_v(0,u)=0 for all g ∈ GL2(F_v) and u ∈ F_v^×.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Define the two-place condition inside the imported Schwartz/Weil data.
2. Verify that the special Hecke-difference functions satisfy it; this is the source’s projection growth assumption.

**Dependencies:** `MetaplecticAutomorphicForms:MP.5`.

**Uses.**

- `Yuan–Zhang 2018 Assumption 7.1 p587`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `twoSplitDegeneracy_constructor` | constructor | Two distinct finite E-split, ℚ-unramified maximal-level places with full Weil-orbit zero evaluation. |
| `twoSplitDegeneracy_place_projection` | projection | Each auxiliary place is E-split and its F_v/ℚ_p extension is unramified. |
| `twoSplitDegeneracy_weil_zero` | characterisation | r(g)φv(0,u)=0 for every g∈GL₂(F_v),u∈F_v×. |
| `twoSplitDegeneracy_linear` | relation | The local vanishing subspace is closed under addition and scalar multiplication. |

**Checks.**

- `twoSplitDegeneracy_zero_schwartz` (degenerate): The zero local function satisfies full Weil-orbit vanishing.
- `twoSplitDegeneracy_single_place` (non-example): One split place does not satisfy the two-place assumption.
- `twoSplitDegeneracy_zero_at_identity_only` (non-example): φv(0,u)=0 alone is insufficient: its Fourier/Weil transform can be nonzero at zero.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), Assumption 7.1 p587. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-rev-archimedean-derivative-kernel"></a>

### 7.40 Archimedean derivative kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-archimedean-derivative-kernel` (definition).

For a real place v, let B(v) be the nearby quaternion algebra (split at v), with y = y1 + y2 ∈ B(v)_v = E_v + E_v j and λ(y) = q(y2)/q(y) ∈ F_v (λ(y) < 0 on B(v)^×_+ − E^×). Put k_{v,s}(y) = Γ(s+1)/(2(4π)^s)·∫_1^∞ dt/(t(1−λ(y)t)^{s+1}) and K^{(v)}_φ(g,(t1,t2)) = w_U Σ_{a∈F^×} lim_{s→0} Σ_{y∈µ_U\(B(v)^×_+ − E^×)} r(g,(t1,t2))φ(y)_a k_{v,s}(y), where φ(y)_a is YZZ13's a-th Whittaker coefficient notation. Then I′(0,g,φ)(v) = 2⨍_{C_U}K^{(v)}_φ(g,(t,t))dt is the holomorphic projection of the v-part [YZZ13, Prop. 6.15].

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Use the archimedean Whittaker projection and the Γ-normalized integral for λ<0.
2. Sum with the stated positive-norm/off-E restriction, take the source finite part, and apply the normalized CM orbit average.

**Dependencies:** `AutomorphicSpectralTheory:AS.2`, [Finite CM orbit average](#target-gz-6-colmez-torus-average), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Uses.**

- `Yuan–Zhang 2018 §7.1, Theorem 7.2(1), p. 588`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `archDerivativeKernel_constructor` | constructor | The Γ-normalized integral k_v,s for λ<0 and its nearby-quaternion sum. |
| `archDerivativeKernel_lambda_domain` | projection | λ(y)<0 for the positive-norm off-E inputs. |
| `archDerivativeKernel_torus_average` | compatibility | The projected v-derivative is twice the normalized C_U diagonal average. |
| `archDerivativeKernel_zero_parameter` | simp | For λ<0, k_v,0=½log((1−λ)/(−λ)). |

**Checks.**

- `archDerivativeKernel_lambda_minus_one` (computation): For λ=−1, k_v,0=½log2.
- `archDerivativeKernel_diagonal_limit` (non-example): As λ→0⁻ the value diverges, so λ=0 is not an ordinary kernel input.
- `archDerivativeKernel_normalization_half` (characterisation): Omitting the prefactor 1/2 doubles k_v,0.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §7.1, Theorem 7.2(1), p. 588. Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-colmez-rev-corrected-cm-multiplicity-at-split"></a>

### 7.41 Corrected CM multiplicity at 𝔹-split, E-nonsplit places

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split` (theorem).

Let v be a finite place of F nonsplit in E and split in 𝔹, and B = B(v), so B_v is the division algebra. Let U_v = GL2(O_{F_v}). For c ≥ 0 write E_v^×h_cGL2(O_{F_v}) for the elements β whose lattice has multiplier ring O_{F_v} + ϖ_v^cO_{E_v}. The multiplicity function m on B_v^× ×_{E_v^×} GL2(F_v)/GL2(O_{F_v}), defined away from the image of (1,1), satisfies m(b,β) ≠ 0 only if q(b)q(β) ∈ O_{F_v}^×. In that case, for β ∈ E_v^×h_cGL2(O_{F_v}) and λ(b) = q(b2)/q(b) (b = b1 + b2, b1 ∈ E_v, b2 ⊥ E_v): m(b,β) = ½(v(λ(b))+1) if c = 0 and E_v/F_v is unramified; m(b,β) = ½v(D_vλ(b)) if c = 0 and E_v/F_v is ramified (tame or wild); m(b,β) = N_v^{1−c}(N_v+1)^{-1} if c > 0 and E_v/F_v is unramified; m(b,β) = ½N_v^{−c} if c > 0 and E_v/F_v is ramified. Proof of the c = 0 ramified case: by Gross's theorem, End of the canonical lifting mod π_E^m is O_E + π_E^{m−1}O_{B_v}, so 2m(b,β) = 1 + max_{a∈O_E}v(N(b1−a) + q(b2)). The quotient −q(b2)/N(t) is a non-norm, and 1+p^{v(D_v)} ⊂ N(E_v^×) while 1+p^{v(D_v)−1} is not, so the maximum is v(λ(b)) + v(D_v) − 1.

**Hypotheses.**

- Shared blocks H5, H6, H7, H9, H8.

**Outline.**

1. Import Gross’s lifting endomorphism filtration and the conductor-vs-norm coset classification.
2. At conductor zero maximize the lifting length; the ramified norm conductor gives v(λ)+v(D)−1, including wild ramification.
3. For positive conductor evaluate the local coset-volume factors; keep the unit-norm support and omitted diagonal.

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Special test function and integral j](#target-gz-7-colmez-test-function).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Sources.**

- [yuan-zhang-2018](#source-yuan-zhang-2018), published Annals 187 (2018), §8.3, proof of Lemma 8.7, p. 618 (correcting [YZZ13, Lemma 8.6] and [Zha01, Lemma 5.5.2]). Primary published passage inspected. The node follows the reviewed extraction with the explicit corrections to discriminant characters, S² terms, residue ramification and coefficientwise field normalization; see sourceIssues.

<a id="target-gz-7-classical-height-green-characterization"></a>

### 7.42 Marked Green height characterization

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization` (theorem).

Fix x₀ ≠ y₀ in S and put G(x, y) = ⟨(x) − (x₀), (y) − (y₀)⟩ (x ≠ y₀, y ≠ x₀, x ≠ y). Then ⟨a, b⟩ = Σ_{i,j} n_i m_j G(x_i, y_j) for a = Σ n_i(x_i), b = Σ m_j(y_j) (at least if y₀ ∉ |a|, x₀ ∉ |b|). Conversely any G such that for fixed x the function y ↦ G(x, y) is continuous and harmonic on S ∖ {x, x₀} with logarithmic singularities of residue +1 at y = x and −1 at y = x₀ (g − C log|ρ|² continuous near the point, ρ a local parameter), and symmetrically in x, defines by (2.2) a symbol satisfying (2.1); G is determined up to an additive constant, fixed e.g. by G(x₀, y) = 0 for one y. For S = X₀(N)(ℂ), N > 1, x₀ = ∞, y₀ = 0 this means a function G on 𝔥 × 𝔥 with (2.3a) G(γz, γ′z′) = G(z, z′) for γ, γ′ ∈ Γ₀(N); (b) G continuous and harmonic for z ∉ Γ₀(N)z′; (c) G = e_z log|z − z′|² + O(1) as z′ → z, e_z the order of the stabilizer of z in Γ₀(N); (d) G = 4πy′ + O(1) as z′ = x′ + iy′ → ∞ and O(1) as z′ → any other cusp; G = 4πy/(N|z|²) + O(1) as z → 0 and O(1) as z → any other cusp (local parameters (z′ − z)^{e_z}(1 + O(z′ − z)), e^{2πiz}, e^{−2πi/Nz}).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11.

**Outline.**

1. Apply the principal-divisor law to c=(z)−∞ and d=(z′)−0.
2. The difference of two candidate kernels is a smooth harmonic function on the compact curve, hence constant; the marked cusp normalization fixes it.

**Dependencies:** [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.2), (2.3), p. 237. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-cusp-expansion"></a>

### 7.43 Resolvent cusp expansion

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion` (theorem).

(Quoted from Hejhal [20], (6.5); Fourier development in z.) G_{N,s}(z, z′) = −(4π/(2s − 1)) E_N(z′, s) y^{1−s} + O(e^{−y}) as y = Im z → ∞; at any other cusp G_{N,s}(z, z′) = α(s) Y^{1−s} + O(e^{−Y}), Y = Im(γz) for γ ∈ SL₂(ℝ) carrying the cusp to ∞.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Insert the Fourier expansion of the cusp Eisenstein series into the resolvent.
2. Separate the identity/stabilizer term; continue the remainder and its constant term to s=1.

**Dependencies:** `AutomorphicSpectralTheory:AS.2/automorphic-green`, `AutomorphicSpectralTheory:AS.2/gz-68`, `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.19), p. 240. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-marked-green-kernel"></a>

### 7.44 Marked modular Green kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-marked-green-kernel` (construction).

Let N > 1. G(z, z′) = lim_{s→1}[G_{N,s}(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] + C with C = 2κ_N − λ_N (λ_N as in The constant λ_N (2.21)). It satisfies (2.3a)–(2.3d) (Green's-function description of the height symbol (2.2), (2.3)), tends to 0 as z → ∞, and G(z, z′) = G(w_N z′, w_N z) (2.20); the pole cancels since the residues are κ_N − κ_N − κ_N + κ_N.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11, H10.

**Outline.**

1. Cancel the four residues κ−κ−κ+κ.
2. Check the marked squared-log singularities and harmonicity; choose C=2κ_N−λ_N to obtain the zero limit at ∞.

**Dependencies:** [Marked Green height characterization](#target-gz-7-classical-height-green-characterization), `AutomorphicSpectralTheory:AS.2/automorphic-green`, `AutomorphicSpectralTheory:AS.2/gz-68`, [Resolvent cusp expansion](#target-gz-7-classical-cusp-expansion).

**Uses.**

- `Gross–Zagier 1986 Chapter II, §2, (2.15), (2.20), pp. 239–241`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `markedModularGreen` | constructor | The constant Laurent coefficient of G_N,s+4πE_N(w_Nz,s)+4πE_N(z′,s)+κ_N/(s−1), plus 2κ_N−λ_N. |
| `markedModularGreen_cusp_zero` | simp | The value tends to zero as z→∞ with z′ fixed. |
| `markedModularGreen_singularities` | characterisation | Harmonic away from marked points and diagonal, with the stated squared-log singularities. |
| `markedModularGreen_fricke` | relation | G(z,z′)=G(w_Nz′,w_Nz). |

**Checks.**

- `markedModularGreen_four_residues` (computation): The four residues sum κ−κ−κ+κ=0.
- `markedModularGreen_plain_finite_part` (non-example): Subtracting only κ/(s−1) leaves Laplacian κ rather than zero.
- `markedModularGreen_level_one` (non-example): N=1 makes 0 and ∞ coincide and does not satisfy the two-marked-point construction.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.15), (2.20), pp. 239–241. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-green-constant"></a>

### 7.45 Modular Green constant

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-green-constant` (theorem).

For N > 1: lim_{s→1}[4πE_N(w_N z, s) + κ_N/(s−1)] = κ_N log y + λ_N + O(e^{−y}) (y = Im z → ∞), with λ_N = lim_{s→1}[4πN^{−s}φ(s) ∏_{p|N} (1 − p^{−2s+1})/(1 − p^{−2s}) + κ_N/(s−1)] = κ_N[log N + 2 log 2 − 2γ + 2(ζ′/ζ)(2) − 2Σ_{p|N} p log p/(p² − 1)], γ Euler's constant; also lim_{s→1}[4πE_N(z′, s)(1 − y^{1−s}/(2s−1))] = −κ_N(log y + 2).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Extract the constant term of the cusp Eisenstein series.
2. Its Γ and quadratic Euler-factor logarithmic derivatives give the stated λ_N and fix the additive Green constant.

**Dependencies:** [Marked modular Green kernel](#target-gz-7-classical-marked-green-kernel), `AutomorphicSpectralTheory:AS.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.21), p. 241. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-archimedean-height"></a>

### 7.46 Archimedean modular height formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-archimedean-height` (theorem).

Let N > 1 and x, x′ distinct non-cuspidal points of X₀(N)(ℂ), represented by z, z′ ∈ 𝔥. Then ⟨(x) − (∞), (x′) − (0)⟩_ℂ = lim_{s→1}[G_{N,s}(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] − λ_N + 2κ_N, with G_{N,s}, E_N, κ_N, λ_N as in (2.10), (2.14), (2.13), (2.21).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11, H10.

**Outline.**

1. Contract the marked Green kernel with the disjoint degree-zero divisors.
2. The Eisenstein and scalar terms disappear by degree zero; compare with the squared-norm local symbol.

**Dependencies:** [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), [Marked modular Green kernel](#target-gz-7-classical-marked-green-kernel), [Modular Green constant](#target-gz-7-classical-green-constant).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.22) Proposition, p. 241. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-hecke-kernel-action"></a>

### 7.47 Hecke kernel action

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-kernel-action` (theorem).

For m ≥ 1, (m, N) = 1: T_m acts on constants by σ₁(m) = #{γ ∈ Γ\R_N : det γ = m}, on E_N(z′, s) by m^s σ_{1−2s}(m) = m^s Σ_{d|m} d^{1−2s}, and G_{N,s}(z, z′)|_{z′} T_m = Σ_{γ ∈ R_N/{±1}, det γ = m} g_s(z, γz′). Since T_m((0)) = σ₁(m)(0), T_m((x′) − (0)) = Σ_{γ ∈ Γ\R_N, det γ = m} ((γx′) − (0)), hence ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = Σ_{γ ∈ Γ\R_N, det γ = m} G(z, γz′). [Corrected: the paper justifies this by 'T_m maps each cusp to itself' (p. 241), which is false for general N; only T_m((0)) = σ₁(m)(0) and T_m((∞)) = σ₁(m)(∞) are needed and true.]

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Reindex determinant-m matrices as the usual prime-to-N Hecke cosets.
2. Use invariance of the resolvent and the Eisenstein Hecke eigenvalue σ₁(m).

**Dependencies:** `AutomorphicSpectralTheory:AS.2/automorphic-green`, `ModularCurvesPartII:R14.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, pp. 241–242. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-hecke-green-kernel"></a>

### 7.48 Hecke Green kernel

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel` (definition).

For m ≥ 1, (m, N) = 1: G^m_{N,s}(z, z′) = ½ Σ_{a,b,c,d ∈ ℤ, N | c, ad − bc = m} g_s(z, (az′ + b)/(cz′ + d)) (= G_{N,s}(z, z′)|_{z′}T_m); G¹_{N,s} = G_{N,s}.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Apply the prime-to-N correspondence to the second argument of the resolvent.
2. Pass from SL₂ matrices to their ±1 quotient, retaining the 1/2 convention.

**Dependencies:** `AutomorphicSpectralTheory:AS.2/automorphic-green`, [Hecke kernel action](#target-gz-7-classical-hecke-kernel-action).

**Uses.**

- `Gross–Zagier 1986 Chapter II, §2, (2.24), p. 242`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `heckeGreen` | constructor | The determinant-m resolvent sum modulo ±1 for (m,N)=1. |
| `heckeGreen_one` | simp | G¹_N,s=G_N,s. |
| `heckeGreen_hecke` | compatibility | G^m_N,s=G_N,s\|_{z′}T_m. |
| `heckeGreen_fricke` | relation | Simultaneous Atkin–Lehner invariance. |

**Checks.**

- `heckeGreen_m_one` (compatibility): The identity correspondence returns the original kernel.
- `heckeGreen_sign_quotient` (non-example): The factor 1/2 in the matrix sum is indispensable.
- `heckeGreen_cusp_degree` (computation): For prime ℓ∤N the constant Hecke eigenvalue is ℓ+1, rather than 1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.24), p. 242. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-hecke-archimedean-height"></a>

### 7.49 Hecke archimedean height formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-archimedean-height` (theorem).

Let N > 1, m ≥ 1, (m, N) = 1, x, x′ ∈ X₀(N)(ℂ) non-cuspidal with x ∉ T_m x′, represented by z, z′. Then ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = lim_{s→1}[G^m_{N,s}(z, z′) + 4πσ₁(m)E_N(w_N z, s) + 4πm^s σ_{1−2s}(m)E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)λ_N + 2σ₁(m)κ_N, σ_ν(m) = Σ_{d|m} d^ν.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11, H10.

**Outline.**

1. Use the disjointness criterion and the Hecke kernel action.
2. Contract with c and T_m d^σ, retaining the σ₁(m) cusp terms.

**Dependencies:** [Archimedean modular height formula](#target-gz-7-classical-archimedean-height), [Hecke Green kernel](#target-gz-7-classical-hecke-green-kernel), [CM Hecke disjointness criterion](#target-gz-6-classical-disjointness).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.23) Proposition, p. 242. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-atkin-lehner-invariance"></a>

### 7.50 Atkin–Lehner kernel invariance

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-atkin-lehner-invariance` (theorem).

For every d ‖ N: G^m_{N,s}(w_d z, w_d z′) = G^m_{N,s}(z, z′) (in particular for m = 1), because g_s(γz, γz′) = g_s(z, z′) for γ ∈ SL₂(ℝ) and w_d normalises {γ ∈ R_N : det γ = m}; compatible with the invariance of the height pairing under automorphisms.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Conjugate the determinant-m matrix set by the chosen Atkin–Lehner involution.
2. The reindexing preserves the kernel and both CM inputs.

**Dependencies:** [Hecke Green kernel](#target-gz-7-classical-hecke-green-kernel), `ModularCurvesPartII:R14.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §2, (2.25), p. 242. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-cm-kernel-invariants"></a>

### 7.51 CM kernel invariants

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants` (definition).

Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|. For m ≥ 1, (m, N) = 1, 𝒜 ∈ Cl_K with r_𝒜(m) = 0 (r_𝒜(k) = number of integral ideals of norm k in 𝒜), and τ_{𝒜ᵢ,𝔫} as in the referenced classical source result 61: the values G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) with 𝒜₁𝒜₂⁻¹ = 𝒜 (3.1); γ^m_{N,s}(𝒜; 𝔅) = Σ_{𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅} G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) (3.2); γ^m_{N,s}(𝒜) = Σ_{𝒜₁𝒜₂⁻¹ = 𝒜} G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) = Σ_{𝔅 ∈ Cl_K} γ^m_{N,s}(𝒜; 𝔅) (3.3). Because σ_𝒜 maps τ_{𝒜₁,𝔫} to τ_{𝒜₁𝒜⁻¹,𝔫} and Gal(H/K) permutes the archimedean places of H simply transitively, (3.3) with Proposition (2.23) computes Σ_{v|∞} ⟨c, T_m d^σ⟩_v (c = (x) − (∞), d = (x) − (0)); r_𝒜(m) = 0 is needed for (3.1) to be defined (x ∉ T_m x^σ).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Form the finite class-pair sums of the off-diagonal Hecke kernel.
2. Apply ideal change and Atkin–Lehner reindexing to prove that the choice of norm-N ideal does not affect them.

**Dependencies:** [Hecke Green kernel](#target-gz-7-classical-hecke-green-kernel), [CM Hecke disjointness criterion](#target-gz-6-classical-disjointness), `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §3, (3.1)–(3.3), pp. 242–243`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmKernelInvariant` | constructor | The class-pair sums γ^m_N,s(A;B) and their B-sum γ^m_N,s(A), with r_A(m)=0. |
| `cmKernelInvariant_sum_genus` | projection | Σ_B γ(A;B)=γ(A). |
| `cmKernelInvariant_ideal_independent` | extensionality | Changing the primitive norm-N ideal leaves γ(A;B) unchanged. |
| `cmKernelInvariant_empty` | simp | γ(A;B)=0 unless {A}={B𝔫}. |

**Checks.**

- `cmKernelInvariant_prime_D` (computation): For prime |D| each nonempty refined sum has one class pair.
- `cmKernelInvariant_wrong_genus` (degenerate): A wrong genus has an empty sum.
- `cmKernelInvariant_diagonal` (non-example): If r_A(m)>0, use the diagonal finite-part kernel instead of this off-diagonal definition.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.1)–(3.3), pp. 242–243. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-cm-genus-orbits"></a>

### 7.52 CM genus-orbit count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits` (theorem).

(3.1) depends on 𝔫, but γ^m_{N,s}(𝒜; 𝔅) does not: w_d (d ‖ N) replaces (𝒜₁, 𝒜₂, 𝔫) by (𝒜₁[𝔡]⁻¹, 𝒜₂[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄) (Actions of c, Gal(H/K) and W on Heegner points), leaving 𝒜₁𝒜₂⁻¹ and 𝒜₁𝒜₂[𝔫]⁻¹ unchanged, and G^m_{N,s} is w_d-invariant (2.25). The sum (3.2) has 2^{t−1} terms if {𝒜} = {𝔅𝔫} and is empty otherwise ({𝒜} = genus = class of 𝒜 in Cl_K/Cl_K² ≅ (ℤ/2ℤ)^{t−1}); all 𝔫 of norm N lie in one genus; if D is prime (|Cl_K| odd) the sum has one term.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Use the genus quotient of the ideal-class group to classify admissible pairs.
2. Fix A₁A₂⁻¹ = A and A₁A₂[𝔫]⁻¹ = B. Substitution gives A₂² = B[𝔫]A⁻¹. A nonempty fibre of squaring is a torsor under Cl(K)[2], of cardinality 2^(t−1); it is not a fibre of the genus quotient, whose cardinality is h/2^(t−1).

**Dependencies:** [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), `AnalyticNumberTheory:AN.4`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, p. 243. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-hyperbolic-norm-parameter"></a>

### 7.53 Hyperbolic norm parameter

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter` (theorem).

Let τ₁, τ₂ be Heegner points with the same 𝔫, roots of A_iτ_i² + B_iτ_i + C_i = 0 as in (1.4) with the same β. For γ = (a b; c d) ∈ R_N with det γ = m > 0: g_s(γτ₁, τ₂) = −2Q_{s−1}(1 + |γτ₁ − τ₂|²/(2 Im(γτ₁) Im τ₂)) = −2Q_{s−1}(1 + 2nN/(|D| det γ)) with n = (A₁A₂/N)|cτ₁τ₂ + dτ₂ − aτ₁ − b|² (3.4), and n = (1/N)[c²C₁C₂ + ad(D − B₁B₂)/2 − bc(D + B₁B₂)/2 + a²C₁A₂ + d²A₁C₂ − cdB₁C₂ + acC₁B₂ + b²A₁A₂ + bdA₁B₂ − abB₁A₂] ∈ ℤ (3.5, corrected; see PAPER-GROSS-ZAGIER-86/E4). Hence G^m_{N,s}(τ₁, τ₂) = −2 Σ_{n≥1} ρ^m(n) Q_{s−1}(1 + 2nN/(m|D|)), ρ^m(n) = #{γ ∈ R_N/{±1} : det γ = m, n(γ) = n} (n ≥ 1 when r_{𝒜₁𝒜₂⁻¹}(m) = 0). Example N = 1, D = −4, τ₁ = τ₂ = i: n = a² + b² + c² + d² − 2(ad − bc), (a − d)² + (b + c)² = n, (a + d)² + (b − c)² = n + 4m.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Express the hyperbolic distance invariant by the norm of the corresponding quadratic pair.
2. Check both positive norm contributions and the determinant relation before substituting in Q_(s−1).

**Dependencies:** [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.4), (3.5), p. 244. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-pair-count"></a>

### 7.54 Quadratic-pair representation count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count` (theorem).

Let 𝒜₁, 𝒜₂ ∈ Cl_K, 𝔫 primitive of norm N, 𝔞ᵢ ∈ 𝒜ᵢ integral with 𝔫 | 𝔞ᵢ, N(𝔞ᵢ) = Aᵢ, and — corrected hypothesis, see PAPER-GROSS-ZAGIER-86/E5 — 𝔞₁, 𝔞₂ prime to D; τ_{𝒜ᵢ,𝔫} the roots attached to 𝔞ᵢ by (1.4)–(1.5). Then for m ∈ ℕ (with (m, N) = 1) and r_{𝒜₁𝒜₂⁻¹}(m) = 0: G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) = −2 Σ_{n≥1} ρ^m(n) Q_{s−1}(1 + 2nN/(m|D|)), ρ^m(n) = ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = #{(α, β) ∈ (𝔞₁⁻¹𝔞̄₂⁻¹ × 𝔞₁⁻¹𝔞₂⁻¹𝔫)/{±1} : N(α) = (Nn + m|D|)/(A₁A₂), N(β) = Nn/(A₁A₂), A₁A₂α ≡ A₁A₂β (mod 𝔡)}, 𝔡 = (√D) the different. The bijection is γ ↦ (α, β), α = cτ₁τ̄₂ + dτ̄₂ − aτ₁ − b, β = cτ₁τ₂ + dτ₂ − aτ₁ − b (3.6), with α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹, β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 (3.7), l = A₁A₂N(α), n = N⁻¹A₁A₂N(β) ∈ ℤ (3.8), l − Nn = |D| det γ (3.9), A₁A₂α ≡ A₁A₂β (mod 𝔡) (3.10); the inverse is cτ₁ + d = (A₂/√D)(β − α), aτ₁ + b = (A₂/√D)(τ̄₂β − τ₂α). (r_{𝒜₁𝒜₂⁻¹}(m) = 0 ensures n > 0.)

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Pass from lattice pairs to integral ideal pairs and their generators.
2. Separate the unit orbits from the ramified congruence choices.

**Dependencies:** [Hyperbolic norm parameter](#target-gz-7-classical-hyperbolic-norm-parameter), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.6)–(3.11) Proposition, pp. 244–245. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-ramified-congruence-count"></a>

### 7.55 Ramified-congruence pair count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count` (theorem).

If n ≡ 0 (mod D) (hypotheses of Proposition (3.11): ρ^m as a count of pairs (α, β)): ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = ½ #{α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹ : N(α) = l/(A₁A₂)} · #{β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 : N(β) = Nn/(A₁A₂)} = 2u² r_{𝒜₁𝒜₂⁻¹}(l) r_{𝒜₁𝒜₂[𝔫]⁻¹}(n), l = Nn + m|D|, u = ½#𝒪^×.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. At each l|D compare the two congruence classes of generators.
2. A factor 2 occurs exactly when l divides the relevant norm index; multiply the independent local counts.

**Dependencies:** [Quadratic-pair representation count](#target-gz-7-classical-pair-count), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.12), p. 246. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-prime-discriminant-count"></a>

### 7.56 Prime-discriminant pair count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-discriminant-count` (theorem).

If |D| is prime (hypotheses of Proposition (3.11): ρ^m as a count of pairs (α, β)): ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = u² r_{𝒜₁𝒜₂⁻¹}(nN + m|D|) r_{𝒜₁𝒜₂[𝔫]⁻¹}(n) × (1 if D ∤ n, 2 if D | n); for D ∤ n exactly one of (α, β), (α, −β) satisfies the congruence (a quadratic residue mod D has exactly two square roots).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Specialize the ramified-congruence count to a prime discriminant.
2. Use the single genus and retain the exceptional u=3 unit factor.

**Dependencies:** [Ramified-congruence pair count](#target-gz-7-classical-ramified-congruence-count).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.13), p. 246. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-genus-pair-count"></a>

### 7.57 Genus pair count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count` (theorem).

D arbitrary (standing hypotheses), 𝒜, 𝔅 ∈ Cl_K, r_𝒜(m) = 0: Σ_{𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅} ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = u² δ(n) r_𝒜(nN + m|D|) r_𝔅(n) if {𝒜} = {𝔅𝔫}, and 0 otherwise, where δ(n) = ∏_{p|(n,D)} 2 (3.15) and {𝒜}, {𝔅𝔫} are the genera of 𝒜 and 𝔅[𝔫]. Proof: the other terms come from 𝔞ᵢ ↦ 𝔞ᵢ𝔠 with 𝔠² = (γ₀), (α, β) ↦ (α/N(𝔠), β/γ₀); the 2^{t−1} classes [𝔠] ∈ Cl_K[2] correspond to ±r (mod D) with r² ≡ 1 (mod D).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Apply the genus norm criterion to the ideal pair.
2. Combine the local congruence factors with the unit count; wrong-genus pairs contribute zero.

**Dependencies:** [Ramified-congruence pair count](#target-gz-7-classical-ramified-congruence-count), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.14), (3.15), pp. 246–247. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-genus-kernel-evaluation"></a>

### 7.58 Genus kernel evaluation

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation` (theorem).

Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|. For m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_{N,s}(𝒜; 𝔅) = −2u² Σ_{n≥1} δ(n) r_𝒜(nN + m|D|) r_𝔅(n) Q_{s−1}(1 + 2nN/(m|D|)) if {𝒜} = {𝔅𝔫}, and γ^m_{N,s}(𝒜; 𝔅) = 0 otherwise (δ(n) as in (3.15)).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Insert the quadratic-pair count in the locally uniformly convergent resolvent sum.
2. Regroup by the positive norm index and apply the source Legendre kernel argument.

**Dependencies:** [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), [Genus pair count](#target-gz-7-classical-genus-pair-count).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.16) Proposition, p. 247. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-orbit-kernel-evaluation"></a>

### 7.59 CM orbit kernel evaluation

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-orbit-kernel-evaluation` (theorem).

Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|. For m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_{N,s}(𝒜) = −2u² Σ_{n≥1} δ(n) R_{{𝒜𝔫}}(n) r_𝒜(nN + m|D|) Q_{s−1}(1 + 2nN/(m|D|)), Here R_{{𝒜𝔫}}(n) counts the norm-n integral ideals belonging to {𝒜𝔫}.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Sum the refined genus formula over B.
2. Use the genus fibre count and finite class-group orthogonality.

**Dependencies:** [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [Genus kernel evaluation](#target-gz-7-classical-genus-kernel-evaluation).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, (3.17) Corollary, p. 247. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-genus-character-filter"></a>

### 7.60 Genus-character filter

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter` (theorem).

R_{{𝒜𝔫}}(n) is either R(n) or 0, where R(n) = Σ_{𝒜 ∈ Cl_K} r_𝒜(n) = Σ_{d|n} (D/d) is the number of integral ideals of norm n. If (n, D) = 1 then R_{{𝒜𝔫}}(n) may be replaced by R(n) in (3.17) (r_𝒜(nN + m|D|) ≠ 0 ⇒ (A(nN + m|D|)/p) = 1 ∀p | D ⇒ (AN·n/p) = 1 ∀p | D ⇒ R_{{𝒜𝔫}}(n) = R(n), A any integer prime to D that is a norm from the genus {𝒜}); in general δ(n)R_{{𝒜𝔫}}(n)r_𝒜(nN + m|D|) may be replaced by ∏_{p|(n,D)} (1 + ε̂_p((nN + m|D|)/(nN))) · R(n) r_𝒜(nN + m|D|), where ε̂_p is the character of the group of norms of fractional ideals with ε̂_p(N𝔞) = 1 for 𝔞 principal and ε̂_p(n) = (n/p) for n ∈ ℤ, p ∤ n.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H10.

**Outline.**

1. Multiply by the genus character and sum over A.
2. Use quadratic character orthogonality and the class-independent term to obtain the displayed filter.

**Dependencies:** [Genus kernel evaluation](#target-gz-7-classical-genus-kernel-evaluation), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §3, p. 247. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-cm-eisenstein-sum"></a>

### 7.61 CM Eisenstein sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let E(z, s) = Σ_{γ ∈ Γ_∞\SL₂(ℤ)} Im(γz)^s be the weight-0 Eisenstein series of SL₂(ℤ) (Γ_∞ = ±(1 *; 0 1); this normalization is the one forced by κ_N in (2.13) and by the identity 2^s ζ(2s) E(τ_A, s) = u|D|^{s/2} ζ_K(A, s) used on pp. 248, 252), E_N(z, s) the Eisenstein series (2.14) of Γ₀(N) at ∞, w_N z = −1/(Nz), Re s > 1. Then Σ_{A∈Cl_K} E_N(w_N τ_{A,𝔫}, s) = Σ_{A∈Cl_K} E_N(τ_{A,𝔫}, s) = N^{−s} Π_{p|N}(1 − p^{−2s})^{−1} Σ_{d|N} (μ(d)/d^s) Σ_{A∈Cl_K} E((N/d) τ_{A,𝔫}, s). For each d | N the points (N/d)τ_{A,𝔫} again satisfy quadratic equations over ℤ of discriminant D, and the inner sum is independent of d and equals Σ_{A} E(τ_A, s), where τ_A ∈ 𝔥 is any root of a primitive form of discriminant D in the class A. Hence Σ_A E_N(τ_{A,𝔫}, s) = N^{−s} Π_{p|N}(1 + p^{−s})^{−1} Σ_A E(τ_A, s) (the combination used in the display at the top of p. 249).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Unfold the CM point evaluation of the Eisenstein series.
2. Regroup primitive lattice vectors by integral ideals and extract the quadratic zeta and gamma factors.

**Dependencies:** `AutomorphicSpectralTheory:AS.2`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §4, (4.1) and the paragraph after it, p. 248. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-disjoint-archimedean-sum"></a>

### 7.62 Disjoint archimedean CM formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-disjoint-archimedean-sum` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let x ∈ X₀(N) be a Heegner point for the full ring of integers of K, c = (x) − (∞), d = (x) − (0), σ ∈ Gal(H/K), m ∈ ℕ prime to N, and A ∈ Cl_K with Artin image σ. Assume r_A(m)=0, so no integral ideal representing A has norm m. The archimedean contribution is ⟨c, T_m d^σ⟩_∞ = lim_{s→1} [γ^m_{N,s}(A) − h σ₁(m) κ_N/(s − 1)] + h κ_N [σ₁(m)(log(N/|D|) + 2 Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)], where γ^m_{N,s}(A) is the invariant (3.3) (evaluated in Corollary (3.17)), κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N^{−1} Π_{p|N}(1 + 1/p)^{−1} (2.13), and L(s, ε) is the L-function of K.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11, H10.

**Outline.**

1. Insert the genus/orbit kernel formula and CM Eisenstein evaluation into the disjoint height formula.
2. Take the Laurent constant at s=1, retaining the cancelled pole and logarithmic derivative.

**Dependencies:** [Hecke archimedean height formula](#target-gz-7-classical-hecke-archimedean-height), [CM orbit kernel evaluation](#target-gz-7-classical-orbit-kernel-evaluation), [Archimedean CM height sum](#target-gz-2-classical-archimedean-height-sum), [CM Eisenstein sum](#target-gz-7-classical-cm-eisenstein-sum).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, (4.2) Proposition, p. 249 (derivation pp. 248–249). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-tangent-symbol"></a>

### 7.63 Tangent-normalized CM height symbol

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol` (construction).

Let X be a curve over the number field H, v a place of H, and a, b divisors of degree 0 on X whose supports meet exactly in the point x. Let g be a uniformizing parameter at x (a function on X with ord_x(g) = 1). Define ⟨a, b⟩_v := lim_{y→x} {⟨a_y, b⟩_v − ord_x(a) ord_x(b) log|g(y)|_v}, where a_y is the divisor obtained from a by replacing every occurrence of x by a nearby point y not in the support of b, and ⟨·,·⟩_v on the right is Néron's local symbol of relatively prime divisors. The limit exists by the standard properties of local heights ([14] = Gross, 'Local heights on curves'). This node is the CM specialization of RP.0’s reusable tangent-symbol construction; it introduces no second general local-height machine.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Specialize the reusable tangent-local-symbol construction to the common CM point and its multiplicity r_A(m).
2. Subtract that multiplicity times log|g|_v; changing g modifies only the displayed scalar term.

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.0`, [CM Hecke disjointness criterion](#target-gz-6-classical-disjointness).

**Uses.**

- `Gross–Zagier 1986 Chapter II, §5, (5.1), pp. 249–250`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmTangentHeight` | constructor | Specialize the imported tangent local symbol to c=(x)−∞ and T_m d^σ using the eta-normalized tangent; subtraction coefficient r_A(m). |
| `cmTangentHeight_disjoint` | compatibility | For r_A(m)=0 it is the ordinary Néron symbol. |
| `cmTangentHeight_change` | relation | Replacing g by g′ adds r_A(m)log\|(g/g′)(x)\|_v. |
| `cmTangentHeight_global` | compatibility | Its sum over v equals the global class pairing for one global tangent choice. |

**Checks.**

- `cmTangentHeight_multiplicity` (characterisation): If x occurs twice in T_mx^σ subtract 2log|g|, not log|g|.
- `cmTangentHeight_root_unity` (compatibility): Multiplication of the tangent by μ₆ changes no local value.
- `cmTangentHeight_scaling_product` (non-example): A scalar α with |α|_v≠1 changes the individual place, although the global sum is unchanged.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, (5.1), pp. 249–250. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter I, §9, p. 232; constructed in Chapter II, §5, pp. 249–252 and Chapter III, §8, pp. 262–264. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, (5.3), p. 250. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-tangent-product-formula"></a>

### 7.64 Tangent product formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula` (theorem).

In the setting of (5.1) Local symbol for divisors with a common point (tangent-vector symbol): if g′ is another uniformizing parameter at x and g/g′ has the value α at x, then ⟨a, b⟩′_v = ⟨a, b⟩_v + ord_x(a) ord_x(b) log|α|_v. Consequently ⟨a, b⟩_v depends only on the non-zero tangent vector ∂/∂t at x determined by ∂g/∂t = 1, is unchanged if ∂/∂t is multiplied by a root of unity (|α|_v = 1 for all v), and — g being a single global function — Σ_v ⟨a, b⟩_v is independent of g and (product formula) equals the global height pairing of the classes of a and b [14].

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Sum the tangent change at all places of H.
2. Apply the product formula to the single global scalar; do not assert that its individual local logs vanish.

**Dependencies:** [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), `HeightsRationalPointsAndObstructions:RP.0`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, (5.2) and the following paragraph, p. 250. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-eta-tangent"></a>

### 7.65 Eta-normalized CM tangent

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent` (construction).

ω := η⁴(z) dq/q = 2πi η⁴(z) dz (5.4). It is well defined on X₀(N) only up to a 6th root of unity (η⁴ has a multiplier of order 6), which by (5.2) Change of uniformizer; the sum of local symbols is the global pairing does not affect the local symbols. If x is not an elliptic point of X₀(N) (u = 1), ω is non-zero at x, the tangent vector ∂/∂t is taken dual to ω, and the uniformizing parameter g satisfies ω = (g + a₂g² + a₃g³ + …) dg/g near x. In general ω has order 1/u − 1 at x and g is normalized so that ω = (1/u)(g^{1/u} + higher degree terms) dg/g near x, i.e. ω = d(g^{1/u})·(1 + …) [corrected; the printed display omits the factor 1/u — see issue PAPER-GROSS-ZAGIER-86/E12].

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use Δ(dq/q)^⊗6, rather than assert that η⁴dq/q descends as a differential on the coarse curve.
2. In the orbifold parameter g=c^u(w−z)^u(1+o(1)), differentiate to obtain the necessary factor 1/u; sixth powers remove the branch ambiguity.

**Dependencies:** [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §5, (5.4) and the two paragraphs after it, p. 250`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `etaCMTangent` | constructor | The CM tangent class obtained from Δ(q)(dq/q)^⊗6, with g=(2πiη⁴(z)(w−z))^u(1+o(1)). |
| `etaCMTangent_orbifold` | characterisation | ω=(1/u)(g^(1/u)+higher terms)dg/g. |
| `etaCMTangent_unit_index_one` | compatibility | For u=1 the tangent is dual to ω. |
| `etaCMTangent_ambiguity` | projection | The only branch ambiguity is multiplication by μ₆, invisible to local heights. |

**Checks.**

- `etaCMTangent_ordinary` (computation): For u=1, dg at x equals ω.
- `etaCMTangent_cubic_stabilizer` (non-example): For D=−3, u=3, omission of 1/3 in the orbifold formula introduces a spurious 3log|3|_v.
- `etaCMTangent_global_tensor` (characterisation): The sixth tensor power is defined over the ground field even when a branch of η⁴ is not.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, (5.4) and the two paragraphs after it, p. 250. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-complex-tangent-asymptotic"></a>

### 7.66 Complex tangent asymptotic

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-complex-tangent-asymptotic` (theorem).

Let v be a complex place of H (|·|_v = |·|² on ℂ), g as in (5.4) The differential ω = η⁴ dq/q and the normalized tangent vector at x (corrected normalization). Then log|g(y)|_v − u log|2πi η⁴(z)(w − z)|_v → 0 as y → x, where z, w ∈ 𝔥 map to x, y on X₀(N)(ℂ).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Expand the source local symbol in the uniformizer at the common CM point.
2. Compare its leading term with g=(2πiη⁴(z)(w−z))^u; retain the stabilizer multiplicity u.

**Dependencies:** [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, (5.5), p. 251. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-diagonal-archimedean-height"></a>

### 7.67 Diagonal archimedean CM formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-archimedean-height` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let v be a complex place of H and z, z′ ∈ 𝔥 points mapping to x, x^σ. With R_N = {(a b; c d) ∈ M₂(ℤ) : N | c}, g_s(z, z′) = −2Q_{s−1}(1 + |z − z′|²/(2 Im z Im z′)) (2.9), κ_N, λ_N as in (2.13), (2.21): ⟨c, T_m d^σ⟩_v = lim_{s→1} [Σ_{γ ∈ R_N/±1, det γ = m, γz′ ≠ z} g_s(z, γz′) + 4πσ₁(m) E_N(w_N z, s) + u r_A(m) lim_{w→z} {g_s(z, w) − log|2πi η⁴(z)(w − z)|_v} + 4π m^s σ_{1−2s}(m) E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)(λ_N − 2κ_N) [printed '−σ₁(m)(λ_N + 2κ_N)'; see PAPER-GROSS-ZAGIER-86/E10]. The number of γ ∈ R_N/±1 of determinant m with γz′ = z is u r_A(m).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11.

**Outline.**

1. Apply the preceding local asymptotic to each occurrence of x in T_mx^σ.
2. Combine the disjoint terms with r_A(m) copies of the tangent finite part.

**Dependencies:** [Complex tangent asymptotic](#target-gz-7-classical-complex-tangent-asymptotic), [Archimedean modular height formula](#target-gz-7-classical-archimedean-height), [Hecke Green kernel](#target-gz-7-classical-hecke-green-kernel).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, (5.6), p. 251. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-diagonal-green-kernel"></a>

### 7.68 Diagonal Green finite part

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-green-kernel` (definition).

For all z, z′ ∈ 𝔥 (previously defined only for z ∉ T_m z′): G^m_{N,s}(z, z′) := Σ_{γ ∈ R_N/±1, det γ = m, γz′ ≠ z} g_s(z, γz′) + Σ_{γ ∈ R_N/±1, det γ = m, γz′ = z} lim_{w→z} (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²). With this definition (5.6) is literally the formula of Proposition (2.23); the second sum equals a·g_s(z), a = #{γ ∈ R_N/±1 : det γ = m, γz′ = z} (= u r_A(m) for z, z′ over x, x^σ), g_s(z) the renormalized value Renormalized self-value g_s(z).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the ordinary resolvent off T_m and define the diagonal term by its eta-normalized local finite part.
2. Count the determinant-m diagonal matrices modulo ±1 as u r_A(m).

**Dependencies:** [Hecke Green kernel](#target-gz-7-classical-hecke-green-kernel), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent).

**Uses.**

- `Gross–Zagier 1986 Chapter II, §5, (5.7) and the paragraph after it, p. 251`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `diagonalHeckeGreen` | constructor | Use g_s off the determinant-m diagonal and its eta-normalized finite part on that diagonal. |
| `diagonalHeckeGreen_off_diagonal` | compatibility | Agrees with G^m_N,s off T_m. |
| `diagonalHeckeGreen_diagonal_count` | projection | For CM inputs the diagonal coefficient is u r_A(m). |
| `diagonalHeckeGreen_laurent` | compatibility | The extended kernel has the Laurent pole and tangent-height comparison of the disjoint case. |

**Checks.**

- `diagonalHeckeGreen_no_hit` (compatibility): If r_A(m)=0 no finite-part term occurs.
- `diagonalHeckeGreen_hit_u` (computation): For D=−3, m=1 and σ=1, there are three stabilizer terms modulo ±1.
- `diagonalHeckeGreen_omit_self` (non-example): Deleting all diagonal terms loses u r_A(m)g_s(z), even though the remaining sum converges for Re s>1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, (5.7) and the paragraph after it, p. 251. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-renormalized-self-value"></a>

### 7.69 Renormalized resolvent self-value

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-renormalized-self-value` (theorem).

g_s(z) := lim_{w→z} (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²) = −log|2π (z − z̄) η(z)⁴|² + 2 Γ′/Γ(s) − 2 Γ′/Γ(1).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Subtract the universal diagonal singularity and use the cusp continuation to define the self value.
2. Extract its Laurent residue and eta constant; the unsubtracted diagonal sum is undefined.

**Dependencies:** [Diagonal Green finite part](#target-gz-7-classical-diagonal-green-kernel), `AutomorphicSpectralTheory:AS.2/gz-68`, [Resolvent cusp expansion](#target-gz-7-classical-cusp-expansion), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, p. 251. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-self-value-orbit-sum"></a>

### 7.70 Self-value CM orbit sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-self-value-orbit-sum` (theorem).

Σ_{A∈Cl_K} g_s(τ_A) = 2h[Γ′/Γ(s) + Γ′/Γ(1) − log 2π] + lim_{σ→1} [(2u/π)|D|^{σ/2} ζ_K(σ) − 2h/(σ − 1)] = 2h[Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|].

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Sum the renormalized self values over the CM orbit.
2. Use the ideal-pair calculation and CM Eisenstein evaluation on the diagonal contribution.

**Dependencies:** [Renormalized resolvent self-value](#target-gz-7-classical-renormalized-self-value), [Genus kernel evaluation](#target-gz-7-classical-genus-kernel-evaluation), [CM Eisenstein sum](#target-gz-7-classical-cm-eisenstein-sum).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, §5, first display, p. 252. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-total-archimedean-formula"></a>

### 7.71 Total archimedean CM formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. The archimedean formula (4.2) also applies when r_A(m)>0 after both diagonal normalizations are made: use the tangent local symbol (5.3) with the (5.4) uniformizer fixed by ω=η⁴dq/q and the chosen normalized tangent at x, and use (3.3) with the diagonal Hecke Green finite part (5.7) for γ^m_{N,s}(A). This invariant is then γ^m_{N,s}(A) = (expression in Corollary (3.17)) + 2h u r_A(m) (Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11.

**Outline.**

1. Add the disjoint and diagonal formulas with their tangent asymptotics.
2. Use the global tangent product formula to eliminate dependence on the one global branch choice.

**Dependencies:** [Disjoint archimedean CM formula](#target-gz-7-classical-disjoint-archimedean-sum), [Diagonal archimedean CM formula](#target-gz-7-classical-diagonal-archimedean-height), [Self-value CM orbit sum](#target-gz-7-classical-self-value-orbit-sum), [Tangent product formula](#target-gz-7-classical-tangent-product-formula).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter II, (5.8) Proposition, p. 252. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-degree-one-intersection"></a>

### 7.72 Degree-one CM intersection count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-degree-one-intersection` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let m = 1, v | p with p ∤ ND, and r_A(1) = 0 (σ ≠ 1, so x ≠ x^σ over H). Then ⟨(x) − (∞), (x^σ) − (0)⟩_v = ⟨c, d^σ⟩_v = −½ Σ_{n≥1} Card(Isom_{W/π^n}(x^σ, x)) log q_v. The sum is zero unless x and x^σ meet mod π; by Deuring's theory it is zero if p splits in K; otherwise p is inert (as p ∤ D) and log q_v = 2 log p.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. At good reduction identify degree-one diagram Hom pairs with isomorphisms.
2. Use the source deformation-length formula, quotienting precisely by ±1 and retaining larger stabilizers.

**Dependencies:** [Local intersection height comparison](#target-gz-2-classical-local-intersection-height), `HeegnerPointEulerSystems:HE.2`, [Half Hom count](#target-gz-7-classical-half-hom-count).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, introduction, (0.4) and following paragraph, p. 253. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-supersingular-eichler-order"></a>

### 7.73 Supersingular Eichler realization

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let p be inert in K and p ∤ N (in the paper's illustration p ∤ ND, m = 1). The endomorphism ring R = End_{W/π}(x mod π) of the (supersingular) reduction of the Heegner diagram is an Eichler order of index (level) N in the definite quaternion algebra B over ℚ of discriminant p (ramified exactly at p and ∞), and Hom_{W/π}(x^σ, x) is isomorphic to the left R-module R𝔞 (𝔞 an ideal in the class A). The points x and x^σ meet mod π if and only if R𝔞 is principal; then Card(Isom_{W/π}(x^σ, x)) is the number of generators of R𝔞.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Apply the supersingular reduction theorem for a chosen cyclic-isogeny diagram.
2. Its endomorphism order has level N in the definite quaternion algebra ramified at p and ∞.

**Dependencies:** `HeegnerPointEulerSystems:HE.2`, `ComplexMultiplicationAndExplicitReciprocity:CM.5/supersingular-curve-versus-level-pair`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, introduction, p. 253. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-inert-order-model"></a>

### 7.74 Inert quaternionic order model

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model` (construction).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let p be inert in K (p ∤ ND) and q a prime with pq ≡ −1 (mod D), i.e. −pq ≡ 1 (mod D) (printed: 'q ≡ −p (mod D)', which makes the lattice below an order only when p² ≡ 1 modulo every prime l | D; see the new issue on (0.5) reported with this review; either condition gives (q/l) = (−p/l) for all l | D); then (q) = 𝔮𝔮̄ splits in K and B = K + Kj with jα = ᾱj (α ∈ K) and j² = −pq is the definite quaternion algebra of discriminant p. For some place v | p the order R = End_{W/π}(x mod π) is R = {α + βj ∈ B : α ∈ 𝔡⁻¹, β ∈ 𝔡⁻¹𝔮⁻¹𝔫, α − β integral at all primes dividing 𝔡}, 𝔡 = (√D) the different of K and 𝔫 the primitive ideal of norm N attached to x. For 𝔞 an ideal in the class A: Hom_{W/π}(x^σ, x) ≅ R𝔞 = {α + βj : α ∈ 𝔡⁻¹𝔞, β ∈ 𝔡⁻¹𝔮⁻¹𝔫𝔞̄, α − β integral at 𝔡}. (With the printed q ≡ −p (mod D) the same statements hold after replacing the congruence 'α − β integral at 𝔡' by 'α − pβ integral at 𝔡'.)

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Choose q with pq≡−1 modulo D so that the ramified congruence lattice has integral reduced norms.
2. Identify the lattice and its local completions with the CM reduction order; multiplication on the right conjugates the β coefficient.

**Dependencies:** [Supersingular Eichler realization](#target-gz-7-classical-supersingular-eichler-order), `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Uses.**

- `Gross–Zagier 1986 Chapter III, introduction, (0.5), p. 253 (general version (9.2)–(9.3), p. 265)`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `inertOrderModel` | constructor | The integral congruence lattice in (D,−pq), with pq≡−1 mod D, identified with the CM reduction order at a specified place. |
| `inertOrderModel_norm` | projection | N(α+βj)=Nα+pqNβ is integral on the lattice. |
| `inertOrderModel_discriminant` | characterisation | Reduced discriminant Np; locally Eichler away from p and maximal at p. |
| `inertOrderModel_hom_ideal` | compatibility | Right multiplication by 𝔞 conjugates the β coefficient by 𝔞̄. |

**Checks.**

- `inertOrderModel_correct_q` (computation): D=−7,p=3,N=2 permits q=23, since −69≡1 mod7.
- `inertOrderModel_wrong_q` (non-example): q=11 satisfies q≡−p mod7 but gives nonintegral norms in the printed α≡β lattice; use pq≡−1.
- `inertOrderModel_conjugate_ideal` (characterisation): Multiplication (α+βj)𝔞 yields α𝔞+β𝔞̄j, not β𝔞j.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, introduction, (0.5), p. 253 (general version (9.2)–(9.3), p. 265). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-norm-one-generators"></a>

### 7.75 Norm-one generator count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-norm-one-generators` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. In the setting of (0.5) Explicit model of B and of the order R, and R𝔞, R𝔞 is principal iff it contains b = α + βj with reduced norm Nb = Nα + pqNβ = N𝔞. If b is a generator, the ideals 𝔠 = (α)𝔡𝔞⁻¹ and 𝔠′ = (β)𝔡𝔮𝔫⁻¹𝔞̄⁻¹ are integral (0.6) and satisfy N𝔠 + pN·N𝔠′ = |D| (0.7). Putting n = pN𝔠′ and l = N𝔠 gives a solution of l + nN = |D| with n ≡ 0 (mod p) and r_A(l) ≠ 0; The converse requires actual generators α,β of the stated ideal pairs satisfying the defining lattice and congruence conditions of R𝔞; a numerical solution l+nN=|D| alone does not supply a generator. Count those admissible pairs to obtain their contribution to (0.4).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Count actual α,β in the defining lattice of R𝔞, modulo simultaneous sign, satisfying the reduced-norm equation and the ramified congruences. The norms l,n and class conditions are necessary; retain the ideal-pair and congruence data in the converse.
2. The exceptional unit classes are counted with u=#O_K×/2, not #O_K×.

**Dependencies:** [Inert quaternionic order model](#target-gz-7-classical-inert-order-model).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, introduction, (0.6)–(0.7), p. 254. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-level-reduction-component"></a>

### 7.76 CM level reduction component

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Suppose p | N (so p = 𝔭𝔭̄ splits and v divides exactly one of 𝔫, 𝔫̄, where O/𝔫 ≅ ℤ/Nℤ is the annihilator of ker φ). Writing n=ord_p(N), both section reductions lie in the ordinary locus: their component is 𝓕_{0,n} when v | 𝔫̄ and 𝓕_{n,0} when v | 𝔫.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11.

**Outline.**

1. Use the Deligne–Rapoport reduction and the ordinary CM level isogeny to identify the fibre component.
2. Compare the two cusp sections and the Hecke action on the same component.

**Dependencies:** `HeegnerPointEulerSystems:HE.2`, `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, (3.1) Proposition, p. 256. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-component-orthogonality"></a>

### 7.77 CM component orthogonality

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-component-orthogonality` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. One of the divisors c = (x) − (∞) and d^σ = (x^σ) − (0) (printed 'd = (x^σ) − (0)') has zero intersection with every fibral component 𝓕_{a,b} of X ⊗ A_v: when p | N (so v divides exactly one of 𝔫, 𝔫̄), c does if v | 𝔫 and d^σ does if v | 𝔫̄; when p ∤ N the special fibre is irreducible and both do.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11.

**Outline.**

1. Use the component intersection matrix and its fibre kernel.
2. The corrected divisor has zero pairing with the components; this is an intersection statement and does not require each CM section to be fixed by a torus action.

**Dependencies:** [CM level reduction component](#target-gz-7-classical-level-reduction-component), [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, (3.2) Corollary and proof, pp. 256–257. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-finite-intersection-height"></a>

### 7.78 Finite CM intersection height

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Assume m ≥ 1 is prime to N and r_A(m) = 0. Then ⟨c, T_m d^σ⟩_v = −(x · T_m x^σ) log q.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4, H11.

**Outline.**

1. Apply the regular-model local-height theorem to c and T_m d^σ.
2. The CM component orthogonality removes the vertical correction and gives the explicit horizontal intersection formula.

**Dependencies:** [Local intersection height comparison](#target-gz-2-classical-local-intersection-height), [CM component orthogonality](#target-gz-7-classical-component-orthogonality), `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, (3.3) Proposition, p. 257 (announced as (0.2), p. 252). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-hom-intersection-count"></a>

### 7.79 CM Hom intersection count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count` (theorem).

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Assume m is prime to N and r_A(m) = 0. Then (x · T_m x^σ) = ½ Σ_{n≥1} Card(Hom_{W/πⁿ}(x^σ, x)_{deg m}).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the imported Hecke deformation/isomorphism formula over W/π^n.
2. Regroup degree-m maps by ±1 and sum the lifting lengths.

**Dependencies:** [Half Hom count](#target-gz-7-classical-half-hom-count), [Diagram isomorphism intersection count](#target-gz-7-classical-isomorphism-intersection-count), `HeegnerPointEulerSystems:HE.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, (4.4) Proposition, p. 258 (announced as (0.3), p. 252; proved in §§5–6). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-half-hom-count"></a>

### 7.80 Half Hom count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count` (definition).

For sections y, x over W as in (2.1) Hom_S(y, x) between Γ₀(N)-diagrams, its degree: h_n(y, x)_{deg m} := ½ Card Hom_{W/πⁿ}(y, x)_{deg m}.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Fix actual integral cyclic-isogeny diagrams before taking Hom.
2. The sign involution on nonzero degree-m maps is free; its orbits define the half count.

**Dependencies:** `AbelianSchemesAndArithmeticModuli:A6`, `HeegnerPointEulerSystems:HE.2`.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §4, last sentence before §5, p. 258`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `halfHomCount` | constructor | h_n(y,x)_m=(1/2)#Hom_{W/πⁿ}(y,x)_m for chosen integral cyclic-isogeny diagrams. |
| `halfHomCount_sign_orbits` | characterisation | For m>0 it counts the free ±1 orbits. |
| `halfHomCount_degree_one` | compatibility | Degree-one elements are diagram isomorphisms. |
| `halfHomCount_reduction` | relation | Reduction n+1→n injects the degree-m Hom sets; h_{n+1}≤h_n. |

**Checks.**

- `halfHomCount_empty` (degenerate): An empty Hom degree fibre gives zero.
- `halfHomCount_two_isomorphisms` (computation): If the only degree-one maps are ±f then h_n=1.
- `halfHomCount_stabilizer` (non-example): With six isomorphisms the half count is 3; quotienting by all automorphisms instead gives 1 and changes the coarse intersection weight.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §4, last sentence before §5, p. 258. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-new-hom-set"></a>

### 7.81 New CM homomorphisms

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set` (definition).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). For non-cuspidal W-sections y, x of X and n ≥ 1, reduction Hom_W(y, x) → Hom_{W/πⁿ}(y, x) is injective (4.5); set Hom^{new}_{W/πⁿ}(y, x) := Hom_{W/πⁿ}(y, x) ∖ (image of Hom_W(y, x)) and Aut^{new}_{W/πⁿ}(x) := Aut_{W/πⁿ}(x) ∖ Aut_W(x). For the Heegner points x, x^σ and p non-split in K, under the identification Hom_{W/πⁿ}(x^σ, x) ≅ End_{W/πⁿ}(x)·𝔞 ⊂ B of (7.3)(2), whose image of Hom_W(x^σ, x) ≅ 𝔞 lies in K, an element b is new exactly when b ∉ K, i.e. b₋ ≠ 0.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Embed the characteristic-zero Hom set into every Artinian reduction by rigidity.
2. Take its complement; at a nonsplit CM place new maps are exactly those with nonzero quaternionic anti-linear part.

**Dependencies:** `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §8, Lemma (8.2), p. 263 (Aut^{new}) and (8.4) with the following paragraph, p. 264 (Hom^{new}, and the reading b₋ ≠ 0); uses (4.5), p. 258`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `newCMHom` | constructor | The complement of the injective image Hom_W in Hom_{W/πⁿ}, and analogously for Aut. |
| `newCMHom_partition` | relation | The full degree-m set is the disjoint union of liftable and new maps. |
| `newCMHom_quaternion` | characterisation | At a non-split CM place a map is new iff b₋≠0. |
| `newCMHom_ordinary` | simp | The new set is empty for canonical ordinary CM lifts. |

**Checks.**

- `newCMHom_ordinary_empty` (degenerate): A split prime contributes no new CM maps.
- `newCMHom_cm_scalar` (non-example): An element of K is liftable and is excluded from every valuation sum.
- `newCMHom_nonzero_negative_part` (characterisation): b₋≠0 permits the norm valuation; b₋=0 has no finite lifting-length valuation.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, Lemma (8.2), p. 263 (Aut^{new}) and (8.4) with the following paragraph, p. 264 (Hom^{new}, and the reading b₋ ≠ 0); uses (4.5), p. 258. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-prime-to-p-hom-count"></a>

### 7.82 Prime-to-p Hom decomposition

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-to-p-hom-count` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p ∤ m. Every point y of the divisor T_m x^σ is a Heegner point over H̄ in the sense of Gross [13] (defined over the ring class field of its conductor, not in general over H), with End_{H̄}(y) = O_y an order in K of conductor dividing m. Each y is rational over W ⊗ ℚ_p and is the canonical lifting of its reduction. For every n ≥ 1, h_n(x^σ,x)_{deg m} = Σ_{y ∈ T_m x^σ} h_n(y,x)_{deg 1}. Reason: the kernel of a degree-m isogeny f:x^σ→x over W/π^n has a unique finite étale lift C⊂x^σ over W because p∤m. Passing to the quotient gives the degree-one isomorphism x^σ_C≅x over W/π^n, and this correspondence partitions the Hom count.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Separate the maps already lifting to W from the new maps.
2. For m prime to p, use the étale kernel to identify the prime-to-p degree fibres and their stabilizer count.

**Dependencies:** [Half Hom count](#target-gz-7-classical-half-hom-count), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), `AbelianSchemesAndArithmeticModuli:A6`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §5, (5.1), p. 258. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-isomorphism-intersection-count"></a>

### 7.83 Diagram isomorphism intersection count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Let x and y be W-sections of X which intersect properly (no common component) and reduce to regular, non-cuspidal points of the special fibre. Then (y·x) = Σ_{n≥1} h_n(y,x)_{deg 1} = Σ_{n≥1} ½·#Hom_{W/π^n}(y,x)_{deg 1}. This is a general fact, independent of y and x being Heegner points.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Apply the local deformation length of a diagram isomorphism and sum over isomorphisms.
2. Divide by the correct sign/stabilizer factors; do not assert coarse Artinian Hom is independent of diagram choices.

**Dependencies:** [Half Hom count](#target-gz-7-classical-half-hom-count), `HeegnerPointEulerSystems:HE.2`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §6, (6.1) Proposition, p. 259 (proof pp. 259–260, including (6.2)). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-split-vanishing"></a>

### 7.84 Split CM intersection vanishing

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p splits in K and r_𝒜(m) = 0, then (x·T_m x^σ) = 0 at every place v | p (v ∤ N or v | N alike). Proof: Hom_{W/π^n}(x^σ,x) = Hom_W(x^σ,x) for all n ≥ 1, and this group has no element of degree m since r_𝒜(m) = 0.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use canonical ordinary CM lifting to show every reduced CM map lifts.
2. Thus the new-map part vanishes at split p; any tangent correction is dealt with separately.

**Dependencies:** [New CM homomorphisms](#target-gz-7-classical-new-hom-set), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §7, (7.1) Proposition, p. 261. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-endomorphism-congruence-order"></a>

### 7.85 CM endomorphism congruence order

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p has a unique prime factor 𝔭 in K, and let R = End_{W/π}(x) ⊂ B = K + Kj as in (7.2). Then for all n ≥ 1: End_{W/π^n}(x) = {b ∈ R : D·N(b₋) ≡ 0 mod p·(N𝔭)^{n−1}}.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Import the CM deformation theorem giving the endomorphism congruence filtration.
2. Intersect its quaternionic filtration with the chosen reduction order to obtain End_(W/π^n)(x).

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [Supersingular Eichler realization](#target-gz-7-classical-supersingular-eichler-order).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 1), p. 262. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-hom-quaternion-realization"></a>

### 7.86 CM Hom quaternion realization

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p non-split. For any ideal 𝔞 in the class 𝒜 there is an isomorphism Hom_{W/π^n}(x^σ,x) ≅ End_{W/π^n}(x)·𝔞 ⊂ B, compatible in n. If the isogeny ϕ: x^σ → x corresponds to b ∈ B, then deg ϕ = N(b)/N(𝔞). It rests on Serre's construction x^σ ≅ Hom_O(𝔞, x).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the right ideal realizing Hom between the two CM reductions.
2. Intersect it with the endomorphism congruence filtration and check the norm/degree ratio N(b)/N(𝔞).

**Dependencies:** [CM endomorphism congruence order](#target-gz-7-classical-endomorphism-congruence-order), [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), `AbelianSchemesAndArithmeticModuli:A6`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 2), p. 262 (with (4.2), p. 257). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-inert-disjoint-intersection"></a>

### 7.87 Inert disjoint intersection formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume r_𝒜(m) = 0, p inert in K, v | p (so v ∤ N), and 𝔞 ∈ 𝒜 prime to p (implicit; see PAPER-GROSS-ZAGIER-86/E21). Then q_v = p² and (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞)} ½(1 + ord_p N(b₋)), with R = End_{W/π}(x). For p ∤ D, ord_p N(b₋) is always odd.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the Hom realization and inert lifting length (ord_p N(b₋)+1)/2.
2. Sum only b₋≠0 and then divide by the ±1 action.

**Dependencies:** [CM Hom intersection count](#target-gz-7-classical-hom-intersection-count), [CM Hom quaternion realization](#target-gz-7-classical-hom-quaternion-realization), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 1), p. 262. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-ramified-disjoint-intersection"></a>

### 7.88 Ramified disjoint intersection formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume r_𝒜(m) = 0, p ramified in K with prime 𝔭, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then q_v = p^k with k the order of [𝔭] in Cl_K, and (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞)} ord_p(D·N(b₋)).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the ramified lifting length ord_p(D·N(b₋)), including the different contribution. The disjoint-support hypothesis excludes b₋=0, so this valuation is finite.
2. Sum the new maps and retain the residue degree and ramified local correction.

**Dependencies:** [CM Hom intersection count](#target-gz-7-classical-hom-intersection-count), [CM Hom quaternion realization](#target-gz-7-classical-hom-quaternion-realization), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 2), p. 262. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-self-intersection-tangent"></a>

### 7.89 Tangent self-intersection number

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent` (definition).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Suppose r_𝒜(m) ≠ 0, so c and T_m d^σ share the point x and ⟨c, T_m d^σ⟩_v is defined by Ch. II (5.1)/(5.3) using the tangent vector ∂/∂t at x. Here ∂/∂t is dual to ω = η⁴(q)dq/q when u = 1, is defined in general through the normalisation of the uniformiser g in Ch. II §5, read as ω = (1/u)(g^{1/u} + …)dg/g (printed without the factor 1/u; PAPER-GROSS-ZAGIER-86/E12), and is defined up to a 6th root of unity. Define (x·x) := ord_v(α), where α ∈ H_v^× is given (corrected reading) by ∂/∂t = α·(a basis of the free W-module T_x X). Printed: 'where α∂/∂t is a basis'; see PAPER-GROSS-ZAGIER-86/E16. With this convention the intersection formula (0.2), ⟨c, T_m d^σ⟩_v = −(x·T_m x^σ) log q_v, continues to hold.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Write ∂/∂t=αe with e an integral tangent basis.
2. The principal-divisor tangent law gives (x·x)=ord_v α and hence the negative local-height sign.

**Dependencies:** [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [Local intersection height comparison](#target-gz-2-classical-local-intersection-height).

**Uses.**

- `Gross–Zagier 1986 Chapter III, §8, (8.1), p. 263 (with Ch. II §5, (5.1)–(5.4), pp. 249–250)`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmSelfIntersection` | constructor | ord_v(α) for tangent ∂/∂t=αe, e an integral tangent basis. |
| `cmSelfIntersection_basis` | extensionality | Replacing e by a unit multiple leaves ord_v(α) unchanged. |
| `cmSelfIntersection_scale` | relation | Scaling the tangent by a multiplies α by a and adds ord_v(a). |
| `cmSelfIntersection_height` | compatibility | The diagonal local height is minus this number times log q_v. |

**Checks.**

- `cmSelfIntersection_integral_basis` (computation): A tangent basis has self-intersection zero.
- `cmSelfIntersection_uniformizer` (computation): The tangent πe has self-intersection 1.
- `cmSelfIntersection_reciprocal` (non-example): Defining α∂/∂t=e gives −1 for πe and reverses the local height sign.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.1), p. 263 (with Ch. II §5, (5.1)–(5.4), pp. 249–250). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-new-automorphism-length"></a>

### 7.90 New automorphism length

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length` (theorem).

For a chosen integral Γ₀(N)-diagram x in the smooth coarse locus, assume v∤N and u_x=#Aut_F(x)/2=1 (a non-elliptic point). With the eta-normalized cotangent of the tangent-symbol construction and α as in Chapter III (8.1), ord_v(α)=1/2 Σ_(n≥1)(#Aut_(W/π^n)(x)−#Aut_W(x))=1/2 Σ_(n≥1)#Aut^new_(W/π^n)(x). The sum is finite. Its value is zero exactly when the eta tangent is integral primitive, equivalently no new automorphisms occur at any level. Elliptic points and level primes use cmTensor_stabilizer_height with its nonzero tensor correction; this specialization makes no blanket assertion for them.

**Hypotheses.**

- W is the complete characteristic-zero DVR with uniformizer π and normalized ord_v; x is an actual chosen integral cyclic N-isogeny diagram, with smooth section in the coarse model.
- v∤N and the effective stabilizer u_x equals one; the differential is the specified eta-normalized branch.

**Outline.**

1. Apply cmTensor_stabilizer_height with θ=Δ and k=6.
2. In the non-elliptic, prime-to-N case specialize the tensor correction to zero; for elliptic and level places compute and retain it before the global product-formula cancellation.

**Dependencies:** [Tangent self-intersection number](#target-gz-7-classical-self-intersection-tangent), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `HeegnerPointEulerSystems:HE.2`, [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.2) Lemma, p. 263. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-j-tangent-values"></a>

### 7.91 Special j tangent values

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values` (theorem).

Let N = 1, so X = Y = X₀(1) and X′ = Y′. For a point x as in (8.2), modulo μ₆ (printed 'mod μ₀', PAPER-GROSS-ZAGIER-86/E17): α ≡ j(x)^{2/3}(j(x) − 1728)^{1/2} if j(x) ≠ 0, 1728; α ≡ 2⁶·3⁴ if j(x) = 1728; α ≡ 2⁹·3^{3/2} if j(x) = 0.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Compute the leading modular discriminant/j coordinate at j=0 and j=1728.
2. Apply the corrected cotangent/tangent comparison, keeping the valuations at 2 and 3.

**Dependencies:** [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [Tangent self-intersection number](#target-gz-7-classical-self-intersection-tangent), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.3), p. 263. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-new-hom-intersection"></a>

### 7.92 New Hom intersection formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Allow r_𝒜(m) ≠ 0, with (x·x) defined by (8.1). Using I_v^GZ of classical-modified-intersection, for every generic stabilizer u and v ∤ mN, I_v^GZ(x,T_m x^σ) = ½ Σ_{n≥1} #Hom^{new}_{W/π^n}(x^σ,x)_{deg m}. Consequently the quaternionic formulas (7.4) remain true when p is non-split, provided the sum runs only over b ∈ R𝔞 with b ∉ K, i.e. b₋ ≠ 0; this is needed for the terms ord_p(Nb₋) to make sense. For u=1 and v∤N this also equals the eta-normalized pairing. In all other cases compare to a cotangent pairing by its explicit tensor correction.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.
- The displayed count uses the modified pairing I_v^GZ. Equality with the eta-normalized self-pairing is asserted only for u=1 and v∤N.

**Outline.**

1. Separate the lifted diagonal from new homomorphisms.
2. Use the modified automorphism self-term on the diagonal and the ordinary Hom count on distinct sections; Conrad (10.3) then applies for every generic stabilizer.
3. Specialize the tensor correction only in the non-elliptic prime-to-level case.

**Dependencies:** [CM Hom intersection count](#target-gz-7-classical-hom-intersection-count), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.4), p. 264. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-author-2004](#source-conrad-author-2004), §9 (9.9)–(9.11), and §10 (10.2)–(10.3), author-copy pp.40–43. The all-stabilizer formula is for the modified (·)^GZ self-pairing. For the ordinary-unit case away from N, the discriminant term vanishes; the unqualified elliptic identification needs the recorded refinement.
- [conrad-2004](#source-conrad-2004), §10, (10.2)–(10.3), pp.130–131. The new Hom formula holds for the modified pairing at all generic stabilizers; a cotangent comparison is separate.

<a id="target-gz-7-classical-inert-total-intersection"></a>

### 7.93 Inert total intersection formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-total-intersection` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p inert in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then I_v^GZ(x,T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0} ½(1 + ord_p N(b₋)) + ½·u·r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of classical-modified-intersection.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.
- Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

**Outline.**

1. Use the modified new-Hom formula and the inert lifting/Hecke calculation.
2. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

**Dependencies:** [New Hom intersection formula](#target-gz-7-classical-new-hom-intersection), [Inert disjoint intersection formula](#target-gz-7-classical-inert-disjoint-intersection), [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 1), p. 264. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), Theorem10.5(1), pp.134–139. States this formula for the modified intersection, retaining all stabilizer factors.

<a id="target-gz-7-classical-ramified-total-intersection"></a>

### 7.94 Ramified total intersection formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-total-intersection` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p ramified in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then I_v^GZ(x,T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0} ord_p(D·N(b₋)) + u·r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of classical-modified-intersection.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.
- Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

**Outline.**

1. Use the modified new-Hom formula and the ramified lifting/Hecke calculation.
2. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

**Dependencies:** [New Hom intersection formula](#target-gz-7-classical-new-hom-intersection), [Ramified disjoint intersection formula](#target-gz-7-classical-ramified-disjoint-intersection), [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 2), p. 264. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), Theorem10.5(2), pp.134–139. States this formula for the modified intersection, retaining all stabilizer factors.

<a id="target-gz-7-classical-split-total-intersection"></a>

### 7.95 Split total intersection formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-split-total-intersection` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p = 𝔭𝔭̄ split in K, v | 𝔭. Then I_v^GZ(x,T_m x^σ) = u·r_𝒜(m)·k_𝔭, where k_𝔭 ≥ 0 and k_𝔭 + k_𝔭̄ = ord_𝔭(m) (printed with subscript 𝔭; equal to ord_p(m) since p splits). The k_𝔭 need not be integers: by Conrad (10.8), printed p.139, u·r_𝒜(m)·k_𝔭 = u·κ_𝔭 with κ_𝔭 = Σ_𝔟 ord_𝔭(𝔟) over the integral ideals 𝔟 of norm m in 𝒜^{−1}, so dividing the integer κ_𝔭 by r_𝒜(m) may give a noninteger. Conrad's form: I_v^GZ(x,T_m x^σ) = u·κ_𝔭 with κ_𝔭, κ_𝔭̄ ∈ ℤ≥0 intrinsic to 𝔭, 𝔭̄ and κ_𝔭 + κ_𝔭̄ = r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of classical-modified-intersection.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.
- Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

**Outline.**

1. Use the modified new-Hom formula and the split lifting/Hecke calculation.
2. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

**Dependencies:** [Split CM intersection vanishing](#target-gz-7-classical-split-vanishing), [Special j tangent values](#target-gz-7-classical-j-tangent-values), [New Hom intersection formula](#target-gz-7-classical-new-hom-intersection), [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 3), p. 264. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), Theorem10.5(3), pp.134–139. States this formula for the modified intersection, retaining all stabilizer factors.

<a id="target-gz-7-classical-level-intersection"></a>

### 7.96 Level intersection formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection` (theorem).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v|N, so p splits in K and p∤m. Put J_v=I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(Δ)/(r_x+6). Then J_v=0 for v|𝔫 and J_v=−u r_A(m)ord_p(N) for v|𝔫̄. Here r_x+6=6/u and ord_(v,x)(Δ)=6ord_v(𝔫̄). This is the finite contribution in classical-tensor-global-decomposition, rather than an equality between the modified and arbitrary cotangent pairings.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. The Serre–Tate canonical lift at a split level prime has no new automorphisms; its modified self-value vanishes.
2. Compute the connected and étale level branches using Lemma10.1, then insert the discriminant correction into J_v.

**Dependencies:** [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection), [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition), [CM level reduction component](#target-gz-7-classical-level-reduction-component).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §8, (8.6) Proposition, p. 264. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), Lemma10.1 and Theorem10.4, pp.131–134. The level formula concerns the modified intersection minus the discriminant tensor term.

<a id="target-gz-7-classical-split-height-sum"></a>

### 7.97 Split-prime height sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-split-height-sum` (theorem).

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p splits in K, then ⟨c, T_m d^σ⟩_p^Δ = −u·r_𝒜(m)·h·ord_p(m/N)·log p. The value is the Δ-normalized contribution. At p∤N use κ_𝔭+κ_𝔭̄=r_A(m)ord_p(m); at p|N the discriminant correction produces the N term. The residue-weighted place sum above either split prime is h log p.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Combine the split total intersection and level terms.
2. The global tensor decomposition combines the modified intersection with its discriminant correction, giving the claimed p-height.

**Dependencies:** [Rational-prime CM height sum](#target-gz-2-classical-p-height-sum), [Split total intersection formula](#target-gz-7-classical-split-total-intersection), [Level intersection formula](#target-gz-7-classical-level-intersection), [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, (9.2) Proposition, p. 265. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), TheoremA.1, p.139. Uses the Δ-normalized p contribution for every generic stabilizer.

<a id="target-gz-7-classical-inert-hom-lattice"></a>

### 7.98 Inert CM Hom lattice

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice` (construction).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p inert, v | p, 𝔟 as in Eichler-order model S and Eichler's connecting-ideal theorem (quoted, Eichler [10, p. 118]), 𝔞 ∈ 𝒜 (prime to p and to 𝔡). Then R𝔞 = {α + βj : α ∈ 𝔡^{−1}𝔞, β ∈ 𝔡^{−1}𝔮^{−1}𝔫𝔟̄𝔟^{−1}𝔞̄, α ≡ (−1)^{ord_𝔣(𝔟)}β mod O_𝔣 for 𝔣 | 𝔡}. As printed this holds for 𝔟R = S𝔟; with R𝔟 = 𝔟S replace 𝔟̄𝔟^{−1} by 𝔟𝔟̄^{−1} (PAPER-GROSS-ZAGIER-86/E20).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Choose the connecting ideal with identity 𝔟R=S𝔟.
2. Transport the explicit reduction lattice; its anti-linear coefficient transforms by 𝔟̄/𝔟. Reversing the identity requires reversing that ratio.

**Dependencies:** [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), `ComplexMultiplicationAndExplicitReciprocity:CM.5/supersingular-curve-versus-level-pair`.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, (9.3), p. 265`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `inertCMHomLattice` | constructor | The fractional R𝔞 congruence lattice with connecting ideal chosen by 𝔟R=S𝔟. |
| `inertCMHomLattice_beta` | projection | Its β ideal is 𝔡⁻¹𝔮⁻¹𝔫𝔟̄𝔟⁻¹𝔞̄. |
| `inertCMHomLattice_connecting_convention` | compatibility | Using R𝔟=𝔟S instead replaces 𝔟 by 𝔟̄ in the formula. |
| `inertCMHomLattice_degree` | projection | A lattice element has isogeny degree N(b)/N𝔞. |

**Checks.**

- `inertCMHomLattice_b_one` (computation): 𝔟=O recovers the simpler inert-order lattice.
- `inertCMHomLattice_orientation` (non-example): For non-ambiguous [𝔟], reversing the connecting identity while leaving 𝔟̄/𝔟 fixed changes the lattice.
- `inertCMHomLattice_sign` (compatibility): The lattice and the degree fibre are preserved under b↦−b.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, (9.3), p. 265. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-inert-norm-ideal-map"></a>

### 7.99 Inert norm-ideal map

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map` (construction).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p inert. For b = α + βj ∈ R𝔞 with (9.4) N(b) = N(α) + pq·N(β) = m·N(𝔞) and N(b₋) = pq·N(β) ≠ 0, define, with 𝔟 normalised as in the printed (9.3), i.e. 𝔟R = S𝔟 (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout, see PAPER-GROSS-ZAGIER-86/E20), the integral ideals (9.5) 𝔠 = (α)𝔡𝔞^{−1} and 𝔠′ = (β)𝔡𝔮𝔫^{−1}𝔟̄^{−1}𝔟𝔞̄^{−1}. Then 𝔠 ∈ 𝒜^{−1} and 𝔠′ ∈ 𝒜𝔅²[𝔮𝔫^{−1}], and (9.6) N𝔠 + N·p·N𝔠′ = m|D|. The integer n = p·N𝔠′ is non-zero and ord_p(n) = ord_p(N b₋) (using p ∤ N𝔞). δ(n) = Π_{l | (n,D)} 2 as in Ch. II (3.15).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Multiply α and β by the indicated different and fractional ideals to obtain integral ideals 𝔠 and 𝔠′.
2. Take ideal norms and classes: N𝔠+NpN𝔠′=m|D|; prime-to-p N𝔞 gives the valuation equality.

**Dependencies:** [Inert CM Hom lattice](#target-gz-7-classical-inert-hom-lattice), `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, (9.4)–(9.6), p. 265`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `inertNormIdeals` | constructor | From b=α+βj with N(b)=mN𝔞 and b₋≠0 form the two integral ideals 𝔠,𝔠′ of (9.5). |
| `inertNormIdeals_classes` | projection | [𝔠]=A⁻¹ and [𝔠′]=AB²[𝔮𝔫⁻¹] in the printed connecting convention. |
| `inertNormIdeals_norm` | characterisation | N𝔠+NpN𝔠′=m\|D\|. |
| `inertNormIdeals_valuation` | projection | For p∤N𝔞, ord_p(pN𝔠′)=ord_p N(b₋). |

**Checks.**

- `inertNormIdeals_nonzero` (characterisation): b₋≠0 implies N𝔠′>0, so the finite sum excludes n=0.
- `inertNormIdeals_sign` (characterisation): b and −b produce the same ideal pair.
- `inertNormIdeals_bad_a` (non-example): If p|N𝔞 the valuation equality requires the extra ord_p(N𝔞), so the prime-to-p hypothesis cannot be dropped.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, (9.4)–(9.6), p. 265. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-inert-height-sum"></a>

### 7.100 Inert-prime height sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum` (theorem).

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p is inert in K (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p^Δ = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_{0 < n < m|D|/N, n ≡ 0 (mod p)} ord_p(pn)·r_𝒜(m|D| − nN)·δ(n)·R_{{𝒜𝔮𝔫}}(n/p). Here δ(n) = 2^{#{primes l | (n,D)}}, R_{{𝒞}}(k) is the number of integral ideals of norm k in the genus of 𝒞 (Ch. II (3.17)), and 𝔮 | q is the auxiliary prime of the referenced classical source result 165. The value does not depend on the choice of q, of 𝔮 | q, or of 𝔫 versus 𝔫̄.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Use the corrected u²δ(n) count of preimages of each norm-ideal pair.
2. Multiply by the inert half-valuation length, reindex n=pN𝔠′>0 and sum the residue-weighted places.

**Dependencies:** [Rational-prime CM height sum](#target-gz-2-classical-p-height-sum), [Inert total intersection formula](#target-gz-7-classical-inert-total-intersection), [Level intersection formula](#target-gz-7-classical-level-intersection), [Inert norm-ideal map](#target-gz-7-classical-inert-norm-ideal-map), [Inert unit-orbit count](#target-gz-7-classical-inert-unit-count), `AnalyticNumberTheory:AN.4`, [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, (9.7) Proposition, p. 266. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, introduction, p. 253 (proved as the r_A(m) = 0 case of Proposition (9.7), p. 266). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), (A.9)–(A.10), p.140; Theorem A.17, pp.156–161. Uses the Δ-normalized p contribution for every generic stabilizer.

<a id="target-gz-7-classical-inert-unit-count"></a>

### 7.101 Inert unit-orbit count

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count` (theorem).

Standing notation (Ch. III) with N > 1, p inert in K, the auxiliary prime q chosen with −pq ≡ 1 (mod D) (PAPER-GROSS-ZAGIER-86/E19) and 𝔞 ∈ 𝒜 prime to pD (PAPER-GROSS-ZAGIER-86/E21). Let 𝔠 ∈ 𝒜^{−1} and 𝔠′ be integral ideals with 𝔠′ in the class 𝒜[𝔮𝔫^{−1}]𝔅² for some 𝔅 ∈ Cl_K, with N𝔠 + N·p·N𝔠′ = m|D| and n = p·N𝔠′ > 0. Reversing (9.5) determines α, β up to units of O; integrality of N(α) + pqN(β) = m·N𝔞 forces α ≡ ±β mod O_𝔣 for every prime 𝔣 | 𝔡, and the resulting b = α + βj lie in R_{v′}𝔞 for places v′ | p in one Gal(H/K)-orbit. Each such pair contributes exactly u²·δ(n) elements b ∈ ⊔_{v|p} R_v𝔞/±1 (printed '2·u²·δ(n)', PAPER-GROSS-ZAGIER-86/E22), each of weight ½(1 + ord_p N(b₋)) = ½·ord_p(pn) in Σ_{v|p}(x·T_m x^σ)_v; summing over pairs and over 𝔅 gives the second term of (9.7).

**Hypotheses.**

- Shared blocks H1, H2.

**Outline.**

1. For each norm-ideal pair count the unit generators and ramified congruence choices.
2. Quotient once by the simultaneous sign; this yields u²δ(n), not the printed doubled coefficient.

**Dependencies:** [Inert norm-ideal map](#target-gz-7-classical-inert-norm-ideal-map), `AnalyticNumberTheory:AN.4`.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, proof of Proposition (9.7), p. 266. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-ramified-order-model"></a>

### 7.102 Ramified quaternionic order model

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model` (construction).

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p ramified in K with prime 𝔭; f = order of [𝔭] in Cl_K. There are h/f places v | 𝔭 in H, each with q_v = p^f (printed 'residual degree p^f', PAPER-GROSS-ZAGIER-86/E23). Choose a prime q with (q/p′) = (−1/p′) for all primes p′ ≠ p dividing D and (−q/p) = −1; for the order model one must also impose −q ≡ 1 (mod D/p) (PAPER-GROSS-ZAGIER-86/E19). Then q = 𝔮𝔮̄ splits in K, B has Hilbert symbol (D, −q), and B = K + Kj with j² = −q. With 𝔟 normalised by 𝔟R = S𝔟 as in the printed (9.3) (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout; PAPER-GROSS-ZAGIER-86/E20): (9.8) R𝔞 = {α + βj : α ∈ 𝔭𝔡^{−1}𝔞, β ∈ 𝔭𝔡^{−1}𝔮^{−1}𝔫𝔟̄𝔟^{−1}𝔞̄, α ≡ (−1)^{ord_𝔣(𝔟)}β mod O_𝔣 for 𝔣 | 𝔡} (β missing in print, PAPER-GROSS-ZAGIER-86/E24). The class of 𝔟 is well defined in Cl_K/[𝔭] by v. For b = α + βj ∈ R𝔞 with N(b) = m·N(𝔞) and N(b₋) ≠ 0, (9.9) 𝔠 = (α)𝔡𝔞^{−1} ∈ 𝒜^{−1} and 𝔠′ = (β)𝔡𝔮𝔫^{−1}𝔟̄^{−1}𝔟𝔞̄^{−1} ∈ 𝒜[𝔮𝔫^{−1}]𝔅² are integral and both divisible by 𝔭, and (9.10) N𝔠 + N·N𝔠′ = m|D|. The integer n = N𝔠′ is non-zero, with ord_p(n) = ord_p(D·N(b₋)).

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Choose the ramified model q with −q≡1 modulo D/p and the prescribed nonsquare residue at p.
2. Transport the connecting ideal as in the inert case and form the two norm ideals, each divisible by 𝔭.

**Dependencies:** [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, pp. 266 ((9.8)–(9.10))`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `ramifiedOrderModel` | constructor | The CM reduction lattice in (D,−q), with −q≡1 mod D/p and (−q/p)=−1, together with its norm-ideal map. |
| `ramifiedOrderModel_norm` | projection | N(α+βj)=Nα+qNβ. |
| `ramifiedOrderModel_ideals` | projection | Both integral ideals 𝔠,𝔠′ are divisible by 𝔭 and N𝔠+NN𝔠′=m\|D\|. |
| `ramifiedOrderModel_places` | projection | h/f places, residue size p^f, f=order[𝔭]. |

**Checks.**

- `ramifiedOrderModel_beta_congruence` (non-example): The congruence has α≡(−1)^ord𝔣(𝔟)β; omission of β does not define the claimed lattice.
- `ramifiedOrderModel_p_divides_n` (characterisation): n=N𝔠′ is positive and divisible by p.
- `ramifiedOrderModel_residue_weight` (computation): For f=2 the weight is 2log p at each of h/2 places.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, pp. 266 ((9.8)–(9.10)). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-ramified-height-sum"></a>

### 7.103 Ramified-prime height sum

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum` (theorem).

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p is ramified in K with prime 𝔭 (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p^Δ = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_{0 < n < m|D|/N, n ≡ 0 (mod p)} ord_p(n)·r_𝒜(m|D| − nN)·δ(n)·R_{{𝒜𝔮𝔭𝔫}}(n/p), with δ and R as in (9.7) Inert primes: explicit ⟨c, T_m d^σ⟩_p^Δ and 𝔮 the auxiliary prime of (9.8)–(9.10) Ramified-case model: q, B = (D, −q), R𝔞 and the ideals 𝔠, 𝔠′.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Apply the ramified norm-ideal count and lifting valuation to n=N𝔠′>0.
2. There are h/f places with q_v=p^f; their aggregate log weight is h log p.

**Dependencies:** [Rational-prime CM height sum](#target-gz-2-classical-p-height-sum), [Ramified total intersection formula](#target-gz-7-classical-ramified-total-intersection), [Level intersection formula](#target-gz-7-classical-level-intersection), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model), `AnalyticNumberTheory:AN.4`, [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter III, §9, (9.11) Proposition, p. 267. The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.
- [conrad-2004](#source-conrad-2004), (A.9)–(A.10), p.140; Theorem A.20, p.162. Uses the Δ-normalized p contribution for every generic stabilizer.

<a id="target-gz-7-classical-global-local-archimedean-sum"></a>

### 7.104 Global-local archimedean comparison

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-global-local-archimedean-sum` (theorem).

Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m. For (m, N) = 1, <c, T_m d^σ> = Σ_v <c, T_m d^σ>_v over places v of H (Néron local symbols; when |c| ∩ |T_m d^σ| ≠ ∅, i.e. r_𝒜(m) ≠ 0, defined as in Chap. II §5). By Chap. II Props. (4.2), (5.8) and Chap. IV Prop. (4.6)(a): Σ_{v|∞} <c, T_m d^σ>_v = lim_{s→1}[−2u² Σ_{n≥1} σ_𝒜(−n) r_𝒜(m|D| + nN) Q_{s−1}(1 + 2nN/(m|D|)) − hκσ₁(m)/(s − 1)] + hκ[σ₁(m)(log(N/|D|) + 2Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)] + hu r_𝒜(m)[2(L′/L)(1, ε) − 2γ − 2 log 2π + log|D|], with σ_𝒜(n) = Σ_{d|n} ε_𝒜(n, d) (ε_𝒜(n,d) ∈ {0, 1, −1} as in Chap. IV Prop. (3.2)), κ = κ_N = −12/(N ∏_{p|N}(1 + 1/p)), σ₁(m) = Σ_{d|m} d. This archimedean contribution uses the Δ/eta analytic parameters of classical-tensor-global-decomposition and is paired with the finite superscript Δ contribution.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Translate the local modular height sum into the field-relative canonical pairing.
2. Separate the complex norm, unit index and degree-of-field factors before comparing coefficients.

**Dependencies:** [Total archimedean CM formula](#target-gz-7-classical-total-archimedean-formula), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §1, pp. 306-307 (first display on p. 307). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-classical-finite-height-sum"></a>

### 7.105 Total finite CM height formula

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-height-sum` (theorem).

Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m. Combining Chap. III Props. (9.2), (9.7), (9.11) over all p and Chap. IV Prop. (4.6)(b): for (m, N) = 1, <c, T_m d^σ>_finite^Δ = −u² Σ_{0<n≤m|D|/N} σ′_𝒜(n) r_𝒜(m|D| − nN) + hu r_𝒜(m) log(N/m), where σ′_𝒜(n) = Σ_{d|n} ε_𝒜(n, d) log(n/d²). The finite superscript Δ means Σ_p cmPrimeHeightSum with its discriminant correction; its archimedean partner uses the eta-normalized limit in classical-tensor-global-decomposition.

**Hypotheses.**

- Shared blocks H1, H2, H3, H4.

**Outline.**

1. Add the split-zero, inert and ramified prime height sums with finite support.
2. Use the single-prime logarithm coefficient identity to express their total by the source σ′ sum.

**Dependencies:** [Split-prime height sum](#target-gz-7-classical-split-height-sum), [Inert-prime height sum](#target-gz-7-classical-inert-height-sum), [Ramified-prime height sum](#target-gz-7-classical-ramified-height-sum), [Rational-prime CM height sum](#target-gz-2-classical-p-height-sum), [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), published Invent. Math. 84 (1986), Chapter V, §1, p. 307 (second display). The stated formula and hypotheses are supported by the identified published scan, with the packet's source corrections and proof gates applied. Ambiguous printed symbols were checked against the page image where needed.

<a id="target-gz-7-cm-tensor-stabilizer-height"></a>

### 7.106 CM tensor stabilizer height

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height` (theorem).

Let x be a chosen integral Γ₀(N)-diagram over the complete characteristic-zero DVR W whose section is in the smooth locus of the coarse model. Let ω_x be a nonzero rational cotangent vector, F=Frac(W), u_x=#Aut_F(x)/2, and θ a nonzero global differential tensor of weight k with order r_x at x; assume r_x+k≠0. Define C_x by the leading expansion θ=(C_x t_x^(r_x)+…) (dt_x)^⊗k for dt_x=ω_x, and ord_(v,x)(θ) using the integral universal deformation coordinate. Then (x·x)_(v,ω_x)= 1/2 Σ_(n≥0)(#Aut_(W/π^(n+1))(x)−#Aut_W(x)) + [ord_v(C_x u_x^k)−ord_(v,x)(θ)]/(r_x+k). The sum is finite. For θ=Δ, k=6, u_x=1 and v∤N the tensor-corrected eta intersection equals the new-automorphism sum; at elliptic points and v|N retain the displayed correction.

**Hypotheses.**

- Chosen actual integral diagram and formally smooth one-dimensional deformation ring R₀=W[[T₀]]
- Finite effective stabilizer G=Aut_k(x)/±1 acts faithfully; invariant ring is the coarse completed local ring; x is smooth there

**Outline.**

1. Form the invariant coordinate T_x=Norm_G(T₀)=Π_g\[g](T₀).
2. A g lifts to W/π^(n+1) precisely when the constant term of \[g](T₀) is divisible by π^(n+1); the finite automorphism sum is ord_v(b_x) for T_x=b_xT₀^(u_x)+….
3. Compare the leading coefficient of θ after substitution: ord_(v,x)(θ)=ord_v(C_x u_x^k)+(r_x+k)ord_v(b_x).
4. Use the cotangent intersection parameter-change law; for Δ apply the extra integral leading coefficient instead of deleting it at small residue characteristics.

**Dependencies:** `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [Tangent self-intersection number](#target-gz-7-classical-self-intersection-tangent), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Acceptance.**

- At u_x=1,v∤N the eta correction recovers the historical half automorphism sum.
- At u_x>1 the u_x^k and tensor order terms must be retained.
- Scaling ω by c changes the self-intersection by −ord_v(c).

**Sources.**

- [conrad-author-2004](#source-conrad-author-2004), author final copy §9 Theorem9.2, (9.5)–(9.10), pp.38–40 (published pp.123–126). The full stabilizer-norm proof supplies a tensorial replacement for the omitted historical dyadic argument.
- [conrad-2004](#source-conrad-2004), Published MSRI 49 (2004), §9, Theorem 9.2, pp. 123–125; Definition 9.5, pp. 126–127. The invariant-coordinate norm and differential-tensor leading coefficient give the all-residue-characteristic comparison. Effective stabilizer, coarse smoothness and actual integral diagram hypotheses are essential.

<a id="target-gz-7-classical-modified-intersection"></a>

### 7.107 Modified CM intersection pairing

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection` (construction).

For chosen integral Γ₀(N)-diagrams with sections in the smooth coarse locus over a complete characteristic-zero DVR W, put W_n=W/π^(n+1). Define I_v^GZ(x,x)=½Σ_(n≥0)(#Aut_(W_n)(x)−#Aut_W(x)). For distinct generic sections use their ordinary local intersection number, and extend additively to a Hecke divisor. This is a modified pairing: for a rational cotangent ω_x, a differential tensor θ of weight k, r_x=ord_x(θ)≠−k, and θ=(C_x t_x^(r_x)+…) (dt_x)^⊗k with dt_x=ω_x, I_(v,ω_x)(x,T_m x^σ)=I_v^GZ(x,T_m x^σ)+r_A(m)[ord_v(C_x u_x^k)−ord_(v,x)(θ)]/(r_x+k). Here u_x=#Aut_(Frac(W))(x)/2 is the generic stabilizer, and ord_(v,x)(θ) uses the universal deformation coordinate. The automorphism sum is finite. Its equality with an eta-normalized self-intersection requires the separate non-elliptic prime-to-level specialization.

**Hypotheses.**

- W is a complete characteristic-zero DVR with algebraically closed residue field; the diagrams are chosen over W and their sections lie in the relative smooth coarse locus.
- For the comparison, k is an integer, θ is a nonzero differential tensor with r_x+k≠0, and ω_x is a nonzero rational cotangent.
- For a Hecke divisor, use the classical Heegner hypotheses, gcd(m,N)=1 and multiplicity r_A(m) at x.

**Outline.**

1. Subtract precisely the automorphisms lifting to W at each nilpotent level; rigidity and the stabilizer-norm calculation give finite support.
2. Use the ordinary intersection on each distinct section and the defined self-term on the diagonal.
3. Apply cmTensor_stabilizer_height to the diagonal multiplicity r_A(m); no correction occurs on distinct sections.

**Dependencies:** [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [CM Hom intersection count](#target-gz-7-classical-hom-intersection-count), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height).

**Uses.**

- `Conrad Theorems10.4–10.5, pp.133–135`: The inert, ramified, split and level formulas use this pairing before the discriminant correction.
- `Conrad Theorem9.6 and (9.18), pp.129–130`: Recombine the modified finite contribution with normalized archimedean terms.

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `cmModifiedIntersection` | constructor | The additive CM intersection pairing using the finite new-automorphism sum on the diagonal. |
| `cmModifiedIntersection_disjoint` | compatibility | For distinct generic sections the modified value equals the ordinary local intersection number. |
| `cmModifiedIntersection_diagonal` | simp | On (x,x) the value is one half the sum of #Aut(W_n)−#Aut(W). |
| `cmModifiedIntersection_add` | structure | The second divisor argument is additive, so its diagonal contribution is its multiplicity at x times the self-term. |
| `cmModifiedIntersection_tensor` | compatibility | The cotangent pairing differs by the displayed r_A(m) tensor correction with denominator r_x+k. |

**Checks.**

- `cmModifiedIntersection_no_new_automorphisms` (degenerate): If every reduction automorphism lifts to W, the modified self-value is zero.
- `cmModifiedIntersection_first_level` (computation): If #Aut(W_0)−#Aut(W)=2 and all later differences vanish, the self-value is 1, rather than 2.
- `cmModifiedIntersection_nonzero_correction` (non-example): For u_x=1, k=6, r_x=0, ord_v(C_x)=0 and ord_(v,x)(θ)=6, the cotangent self-value is the modified value minus 1; identifying the two pairings fails.

**Acceptance.**

- Keep the generic stabilizer distinct from the larger special-fiber automorphism group.

**Sources.**

- [conrad-2004](#source-conrad-2004), §9, (9.9)–(9.12), printed pp.126–127. Defines the modified self-pairing and gives its exact tensor correction to the cotangent pairing.

<a id="target-gz-7-classical-tensor-global-decomposition"></a>

### 7.108 Tensor-normalized local-to-global CM height

**Target:** `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition` (theorem).

For the classical Heegner data over H, choose a nonzero global differential tensor θ of weight k, r_x=ord_x(θ)≠−k and u_x the generic stabilizer. At each complex place choose a lift z_v to the upper half-plane and an analytic parameter g_(z_v) for which the pulled-back θ has leading coefficient 1. Then ⟨c,T_m d^σ⟩=−Σ_(v finite)[I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(θ)/(r_x+k)]log q_v+Σ_(v complex)lim_(y_v→z_v)[⟨c_(y_v),T_m d^σ⟩_v−u_x r_A(m)log|g_(z_v)(y_v)|_v]. Complex absolute values are squared. For θ=Δ and k=6, r_x+6=6/u_x, ord_(v,x)(Δ)=6ord_v(𝔫̄), and one may take g_(z_v)(z)=(2πi)η⁴(z_v)(z−z_v). Thus the finite terms use I_v^GZ−u_x r_A(m)ord_v(𝔫̄), and the archimedean terms are exactly the eta-normalized limits in Chapter II §5. Each individual finite term need not equal the local symbol for an independently chosen global cotangent.

**Hypotheses.**

- Shared blocks H3, H4, H11.
- Use one global θ with r_x+k≠0 and the associated fractional ideal with valuations ord_(v,x)(θ); analytic parameters have leading coefficient 1 for its pullback.
- For the Δ specialization, 𝔫 kills the level subgroup, (N)=𝔫𝔫̄; use the connected/étale orientation of classical-level-reduction-component.

**Outline.**

1. Apply the tensor correction at every finite place, and express the remaining ideal contribution as r_A(m)log Norm(a_θ)/(r_x+k).
2. Pull θ to the universal upper-half-plane family. Its order is u_x r_x+k(u_x−1); normalizing the leading coefficient changes the complex tangent logarithm by the global scalar C_x u_x^k.
3. The product formula cancels that scalar across all places; the fractional ideal leaves the displayed finite correction.
4. For Δ, its pullback is ((2πi)η⁴(z)dz)^⊗6, so its analytic order is zero and r_x+6=6/u_x.
5. Use the Kodaira–Spencer isomorphism away from level primes and on the connected level branch. On the étale branch the Serre–Tate coordinate satisfies 1+T=(1+T′)^(p^e), giving ord_(v,x)(Δ)=6ord_v(𝔫̄).

**Dependencies:** [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height), [Tangent product formula](#target-gz-7-classical-tangent-product-formula), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [CM level reduction component](#target-gz-7-classical-level-reduction-component), `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Acceptance.**

- At u_x=3 one has r_x+6=2, not 6; at v|𝔫̄ the finite correction is u_x r_A(m)ord_v(N).
- For r_A(m)=0 the tensor correction vanishes and the ordinary disjoint local-symbol decomposition is recovered.

**Sources.**

- [conrad-2004](#source-conrad-2004), Theorem9.6, (9.16)–(9.18), pp.129–130; Lemma10.1 and its proof, pp.131–133. Recombines all cotangent corrections globally and computes the discriminant ideal, including exceptional stabilizers and both level orientations.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter II §5, (5.3)–(5.5), pp.250–251. The archimedean eta limit is the Δ specialization of the tensor-normalized global decomposition.

**Coverage:** planned. The following boundaries remain:

- Realize the nilpotent CM deformation, integral tensor/coarse-coordinate and local automorphic carriers; complete the requested bad-place approximant and multiplicity proof interfaces. The modified/global tensor comparison and nonzero S¹/S² test-data targets now have explicit nodes and sources.
- The precise unsupported Arakelov, analytic projection and CM lifting supplier extensions listed in the contract audit.

<a id="layer-8"></a>

## Layer 8: The general Gross–Zagier pairing and explicit specializations

**Atlas planets:** χ-Heegner point; Yuan–Zhang–Zhang Gross–Zagier formula; Nonvanishing of Heegner points; Gross–Zagier formula; Global admissible test-vector line; Explicit Gross–Zagier formula.

**Examples.**

- A trivial-character probability point is the class-group trace divided by h; its height pairing is the trace pairing divided by h².
- A nonzero derivative produces a point only when the evaluated local toric product is also nonzero in the same coefficient embedding.

<a id="target-gz-8-chi-isotypic-mordell-weil-space"></a>

### 8.1 The χ-isotypic Mordell–Weil space A(χ)

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/chi-isotypic-mordell-weil-space` (construction).

Let F be a totally real field, K/F a totally imaginary quadratic extension, A/F a simple abelian variety of strict GL(2)-type with M = End⁰(A) a field, L a finite extension of M and χ : K^× \ 𝔸_K^× → L^× a Hecke character of finite order. Put A(K^ab)_ℚ = A(K^ab) ⊗_ℤ ℚ, an M-module through End⁰(A), and let 𝔸_K^× act on A(K^ab)_ℚ ⊗_M L through the reciprocity map t ↦ σ_t (GZ.0's convention). Define A(χ) = {x ∈ A(K^ab)_ℚ ⊗_M L : σ_t x = χ(t)^{-1} x for all t ∈ 𝔸_K^×}; the exponent is fixed so that the χ-Heegner point P_χ(f) = ∫ f(P)^{σ_t} χ(t) dt lies in A(χ), as in YZZ Thm. 1.2, where P_χ(f1) ∈ A(χ) is paired with P_{χ^{-1}}(f2) ∈ A^∨(χ^{-1}). If χ factors through Gal(H/K) for a finite abelian H/K, then A(χ) is the image of the idempotent e_χ = [H:K]^{-1} Σ_{σ ∈ Gal(H/K)} χ(σ) σ on A(H)_ℚ ⊗_M L, and it is a finite-dimensional L-vector space.

**Hypotheses.**

- A simple of strict GL(2)-type over F, M = End⁰(A) a field (YZZ Sec. 1.2.3; CST §1.2).
- χ of finite order with values in L ⊇ M; the reciprocity convention is GZ.0's (arithmetic Frobenius), and changing it replaces A(χ) by A(χ^{-1}). For F = ℚ the ring-class tower is HE.0/ring-class-tower-quotients; for general F only a finite abelian H/K through which χ factors is used.
- Finite dimensionality uses the Mordell–Weil theorem for A over the number field H.
- The sum of all character projectors requires L to be a splitting field for the finite quotient G, in addition to |G| being invertible. A single χ-projector does not require this extra assumption.
- GZ.1/character-height-pairing writes V_χ for the χ(σ)-eigenspace {σx = χ(σ)x}; in this packet's notation V_χ = A(χ^{-1}), and GZ.1's e_χ = |G|^{-1}Σ_σ χ(σ)^{-1}σ is this packet's e_{χ^{-1}}.

**Outline.**

1. σ_t acts L-linearly on A(K^ab)_ℚ ⊗_M L because the Galois action commutes with End⁰(A) for A defined over F ⊂ K.
2. For a fixed χ, character orthogonality gives an idempotent projecting onto the χ^{-1}-eigenspace. If L contains every character of G, the projectors over all characters sum to 1 and give the direct-sum decomposition; without that splitting hypothesis do not claim this sum.
3. Rational invariants descend by finite averaging: represent a vector over a finite Galois extension H′/H, average its conjugates, and divide by [H′:H]. Thus invariants after tensoring with ℚ are A(H)_ℚ, even when a representative point is fixed only modulo torsion. Finite dimensionality then uses Mordell–Weil, whose exact export is a recorded gap.

**Dependencies:** [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), `mathlib:TensorProduct`, `mathlib:Module.End.eigenspace`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `mathlib:NumberField.IsCMField`, [Character-component height pairing](#target-gz-1-character-height-pairing), [Rational Galois descent of Mordell–Weil spaces](#target-gz-1-mordell-weil-galois-descent), `HeightsRationalPointsAndObstructions:RP.1`.

**Uses.**

- `YZZ Thm. 1.2 (p. 9)`: the target space of P_χ(f) and the domain of the L-linear pairing ⟨·,·⟩_L
- `CST Theorem 1.5`: P⁰_χ(f) ∈ A(K^ab)_ℚ ⊗_M L (p.6); reindexing the sum shows that it lies in A(χ)
- `Zhang 2010, Theorem 4.3.1(2)`: dim (A_Π(E^ab) ⊗ ℂ)^χ is the rank statement of Tian–Zhang; Zhang weights his point by χ(σ)^{-1} (p.587), so his χ-eigenspace {τx = χ(τ)x} is A(χ^{-1})⊗ℂ in this node's labelling
- `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`: for χ = 1 the rank of A(K) over O_L is read off from A(1)

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.chiIsotypic` | constructor | A(χ) as the L-submodule {x \| ∀ t, σ_t • x = χ(t)^{-1} • x} of a module with a commuting group action. |
| `TauCeti.GrossZagier.mem_chiIsotypic_iff` | characterisation | x ∈ A(χ) ↔ ∀ t, σ_t • x = χ(t)^{-1} • x. |
| `TauCeti.GrossZagier.chiProjector` | data | e_χ = \|G\|^{-1} Σ_σ χ(σ) • σ for a finite abelian quotient G. |
| `TauCeti.GrossZagier.chiProjector_mem` | projection | e_χ x ∈ A(χ) for every x. |
| `TauCeti.GrossZagier.chiProjector_of_mem` | simp | x ∈ A(χ) → e_χ x = x. |
| `TauCeti.GrossZagier.chiIsotypic_one` | compatibility | A(1) is the submodule of K-rational vectors (fixed by every σ_t). |
| `TauCeti.GrossZagier.chiIsotypic_disjoint` | relation | A(χ) ⊓ A(χ') = ⊥ for χ ≠ χ'. |
| `TauCeti.GrossZagier.sum_chiProjector` | relation | If L contains all characters of the finite abelian quotient G and \|G\| is invertible, Σ_χ e_χ = 1 on the G-module. |
| `TauCeti.GrossZagier.chiIsotypic_map` | functoriality | An L-linear G-equivariant map φ sends x ∈ A(χ) to φ(x) ∈ A′(χ). |

**Checks.**

- `TauCeti.GrossZagier.chiIsotypic_trivial_eq_fixed` (degenerate): For χ = 1 the χ-isotypic subspace is the space of vectors fixed by every σ_t (A(1) = A(K)_ℚ ⊗_M L).
- `TauCeti.GrossZagier.chiProjector_idem` (characterisation): e_χ ∘ e_χ = e_χ, and e_χ ∘ e_χ' = 0 for χ ≠ χ' (orthogonal idempotents).
- `TauCeti.GrossZagier.chiIsotypic_quadratic_sign` (computation): For G = ℤ/2 acting on V = L² by swapping coordinates and χ the nontrivial character, A(χ) = {(a, −a)}, while A(1) = {(a, a)}.
- `TauCeti.GrossZagier.chiIsotypic_ne_whole` (non-example): A(χ) is not A(H)_ℚ ⊗_M L: for G = ℤ/2 swapping coordinates, (1, 0) lies in neither eigenspace.
- `TauCeti.GrossZagier.chiIsotypic_cubic` (computation): For G = ℤ/3 = ⟨σ⟩ acting on V = L³ by σ(a,b,c) = (c,a,b), with ζ ∈ L a primitive cube root of unity and χ(σ) = ζ: A(χ) = L·(1,ζ,ζ²) and A(χ^{-1}) = L·(1,ζ²,ζ), since σ(1,ζ,ζ²) = ζ²(1,ζ,ζ²) = χ(σ)^{-1}(1,ζ,ζ²). Order-two characters cannot distinguish χ from χ^{-1}, so this test fixes the exponent convention.

**Acceptance.**

- For χ = 1, A(χ) = A(K)_ℚ ⊗_M L.
- Torsion points contribute nothing: A(K^ab)_tors ⊗ ℚ = 0.
- Replacing the arithmetic by the geometric reciprocity convention exchanges A(χ) and A(χ^{-1}) (GZ.0/artin-map-convention).

**Sources.**

- [yzz-2013](#source-yzz-2013), Chapter 1, Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements). A(χ) is the domain of YZZ's L-linear pairing.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, before Theorem 1.5, p. 6. The ambient space A(K^ab)_ℚ ⊗_M L and the reciprocity action t ↦ σ_t.
- [zhang-2010](#source-zhang-2010), §4.3, Theorem 4.3.1(2), p. 588. The χ-eigenspace as the object whose dimension the BSD consequences control.

<a id="target-gz-8-l-linear-neron-tate-pairing"></a>

### 8.2 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing` (construction).

Import from GZ.1 the Poincaré height pairing B_{k,M}: V × W → M⊗_ℚℝ for A and A^∨, with the dual M-action in the second slot and tr_{M⊗ℝ/ℝ} B_{k,M}=B_k. For M⊂L define B_{k,L} on (L⊗_M V) × (L⊗_M W) by L-bilinear extension, with target L⊗_M(M⊗_ℚℝ)≃L⊗_ℚℝ. On pure tensors B_{k,L}(a⊗x,b⊗y)=ab⊗B_{k,M}(x,y). Invariant Galois actions give B_{k,L}(A(χ),A^∨(χ′))=0 unless χ′=χ^{-1}. For base-field vectors its full real trace is [L:M]B_k(x,y), rather than B_k itself. Take k=F for the YZZ formula and k=K for CST; the field-relative pairings satisfy B_K=[K:F]B_F on the common algebraic points.

**Hypotheses.**

- M and L finite separable coefficient fields; V and W are rational Mordell–Weil modules with the GZ.1 dual M-actions.
- The Galois action preserves the imported M-pairing and commutes with M and L.
- The M-valued trace characterization is imported, not reconstructed by taking a trace of the L-extension. The YZZ height is relative to F; CST uses the K-relative height, a factor of two for K/F quadratic (CST p.18).
- GZ.1/character-height-pairing writes V_χ for the χ(σ)-eigenspace {σx = χ(σ)x}; in this packet's notation V_χ = A(χ^{-1}), and GZ.1's e_χ = |G|^{-1}Σ_σ χ(σ)^{-1}σ is this packet's e_{χ^{-1}}.

**Outline.**

1. Use the universal property of both tensor products to extend the imported M-bilinear map; associativity identifies the target with L⊗_ℚℝ.
2. Check the pure-tensor formula and both L-scalar laws; Galois invariance extends by linearity.
3. For an unmatched eigencharacter, invariance gives B=χ(t)^{-1}χ′(t)^{-1}B; choose t with product different from one.
4. Apply transitivity of finite separable trace to a base-field coefficient: tr_{L/M}(m)=[L:M]m. Keep the original rational trace recovery at M.
5. For E and M=L=ℚ compare with the full polar form, twice Tau Ceti’s halved Néron–Tate pairing.

**Dependencies:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Endomorphism-field height pairing](#target-gz-1-coefficient-valued-height), [Character-component height pairing](#target-gz-1-character-height-pairing), [The χ-isotypic Mordell–Weil space A(χ)](#target-gz-8-chi-isotypic-mordell-weil-space), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), `mathlib:LinearMap`, `mathlib:TensorProduct`, `mathlib:Algebra.trace`, `mathlib:QuadraticMap.polar`, `tauceti:WeierstrassCurve.Affine.neronTatePairing`.

**Uses.**

- `YZZ Thm. 1.2 (p. 9)`: the left side ⟨P_χ(f1), P_{χ^{-1}}(f2)⟩_L of the Gross–Zagier identity
- `CST Theorems 1.5–1.6`: ⟨P⁰_χ(f1), P⁰_{χ^{-1}}(f2)⟩_{K,L} on the explicit side
- `Skinner 2020, Prop. 2.5.1`: Skinner's ⟨P_K(f), P_K(f)⟩_𝓛 = ⟨P_K(f), λ(P_K(f))⟩_NT, where 𝓛 is a symmetric ample line bundle with polarisation λ (𝓛 is not the coefficient field L)
- [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion): positivity of the Hermitian self-pairing turns one nonzero derivative into all

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.coeffPairing` | constructor | L-bilinear scalar extension of the supplied mixed-source M-bilinear height, with target L⊗_M S; it is not a second construction of the M-valued height. |
| `TauCeti.GrossZagier.trace_coeffPairing` | characterisation | For B valued in M and base-field inputs, tr_{L/M}(B_L(1⊗x,1⊗y))=[L:M]B(x,y); compose with the GZ.1 real trace in the arithmetic case. |
| `TauCeti.GrossZagier.coeffPairing_smul_left` | simp | B_L(a·x,y)=a·B_L(x,y), for a∈L. |
| `TauCeti.GrossZagier.coeffPairing_smul_right` | simp | B_L(x,a·y)=a·B_L(x,y), where W already carries the dual M-action. |
| `TauCeti.GrossZagier.coeffPairing_galois` | relation | ⟨σx, σy⟩_{K,L} = ⟨x, y⟩_{K,L} for σ ∈ Gal(K̄/K). |
| `TauCeti.GrossZagier.coeffPairing_chi_orthogonal` | relation | ⟨A(χ), A^∨(χ')⟩_{K,L} = 0 unless χ' = χ^{-1}. |
| `TauCeti.GrossZagier.coeffPairing_torsion_left` | other | The pairing kills the images of torsion points; after rationalisation these images are zero, so the signature needs characteristic zero (over ZMod p every vector has finite additive order). |
| `TauCeti.GrossZagier.coeffPairing_elliptic` | compatibility | At M=L=ℚ and after tensoring the point groups with ℚ, the BSD height pairing is the rational linear extension of twice Tau Ceti’s neronTatePairing. |
| `TauCeti.GrossZagier.coeffPairing_tmul` | characterisation | On pure tensors the value is ab⊗B(x,y). |

**Checks.**

- `TauCeti.GrossZagier.coeffPairing_rat` (degenerate): If M = L = ℚ the coefficient pairing equals the ℚ-bilinear Néron–Tate pairing (the trace is the identity).
- `TauCeti.GrossZagier.coeffPairing_trace_qsqrt5` (computation): In a quadratic L/M extension, the trace of B_L(1⊗x,1⊗y) is 2B(x,y). In particular, for M=ℚ and L=ℚ(√5), a base value 1 has trace 2.
- `TauCeti.GrossZagier.coeffPairing_eq_bsd` (compatibility): For an elliptic curve with M = L = ℚ, ⟨P, P⟩_{K,L} = 2 · canonicalHeight P over K, the BSD pairing of GZ.0.
- `TauCeti.GrossZagier.coeffPairing_not_trace` (non-example): In a characteristic-zero quadratic L/M extension, a base pairing value 1 has extended trace 2, hence not 1. Reusing the M trace-recovery law after L-extension fails.
- `TauCeti.GrossZagier.coeffPairing_bilinear_qi` (non-example): For M = ℚ, L = ℚ(i) and a base value B(x,y) = 1, the extension gives B_L(i⊗x, i⊗y) = i²·1 = −1; an extension conjugate-linear in one slot would give +1, so the extension is bilinear, not Hermitian.

**Acceptance.**

- Restricted to χ = 1, M = L = ℚ and A = E an elliptic curve with its principal polarisation, ⟨P, P⟩_{K,L} equals the K-relative BSD pairing ⟨P, P⟩_BSD of GZ.0, i.e. twice Tau Ceti's canonicalHeight over K.
- The pairing kills torsion and is ℝ-valued after tr_{L⊗ℝ/ℝ}.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, before Theorem 1.5, p. 6. The coefficient pairing and its trace characterisation.
- [yzz-2013](#source-yzz-2013), Chapter 1, Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements). The pairing in YZZ's main theorem.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2 p.6 and §2.3 p.18 after (2.4). Coefficient-valued height and explicit F-relative versus K-relative comparison.

<a id="target-gz-8-chi-heegner-point"></a>

### 8.3 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point` (construction).

For the ξ-normalized CM point P and f∈π_A, the weighted function t↦f(P)^{σ_t}⊗χ(t) descends to K×\𝔸_K×/𝔸_F× by ω_Aχ|𝔸_F×=1. Let G=Pic_{K/F}(O_c) be a finite quotient through which this weighted integrand factors, h=#G, and P⁰_χ(f)=Σ_{t∈G}f(P)^{σ_t}⊗χ(t), using representatives and the central cancellation. Define the YZZ point P_χ(f)=h⁻¹P⁰_χ(f) in A(K^ab)_ℚ⊗_M L. Neither χ nor the unweighted orbit is separately asserted to descend to G when the central character is nontrivial. For the abstract character projector, instead take a finite Galois quotient G′ through which both the character and orbit factor; collapsing repeated weighted terms recovers the relative average. The point is independent of refinement and satisfies σ_sP_χ=χ(s)⁻¹P_χ. A toric measure of volume v=2L(1,η), with L(1,η) the completed value (factor π^{-1} at each real place of F), gives P^{vol}_χ=v(1⊗P_χ) in ℂ⊗_L(A(K^ab)_ℚ⊗_M L), after fixing L↪ℂ. The analytic scalar v is not asserted to lie in L.

**Hypotheses.**

- The weighted integrand descends through the central-character cancellation and factors through the specified relative ring-class quotient; the finite Galois projector uses the larger quotient G′ when necessary.
- h is invertible in L; the module is rationalized and L has characteristic zero.
- The probability normalization is established by CST §2.3 p.18 and Skinner §2.5 p.341. Erratum item 25 corrects the integration group at book p.82 to Gal(E^ab/E); it does not state a probability convention.
- The analytic integral uses L↪ℂ; its height and curve-volume conventions must also be converted before substituting it into a YZZ formula. For F = ℚ, L(1, η) is π^{-1} times Mathlib's DirichletCharacter.LFunction value at s = 1; for general F it is the completed Hecke L-value imported with CST Lemma 2.3 (toric-integral-versus-finite-sum).

**Outline.**

1. Use HE.1 CM reciprocity and GZ.3 ξ-normalization to obtain the finite orbit and its relative class-group quotient.
2. Sum the character-weighted orbit, divide by h, and reindex to check χ^{-1}-equivariance.
3. If a quotient is refined, every original orbit term is repeated by the kernel size; this cancels against the refined cardinality.
4. Push Haar measure to the finite quotient: probability mass is 1/h per coset; volume-v mass is v/h. Scalar-extend to ℂ for the latter.
5. Use CST Lemma 2.3 and (2.4) for the class-number/relative regulator-unit comparison, and Skinner p.341 for P_K=h_K P(f_1).

**Dependencies:** [The χ-isotypic Mordell–Weil space A(χ)](#target-gz-8-chi-isotypic-mordell-weil-space), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention), `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `mathlib:DirichletCharacter.LFunction`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Uses.**

- `YZZ Thm. 1.2 (p. 9)`: both sides of the Gross–Zagier identity are functions of P_χ(f1), P_{χ^{-1}}(f2)
- `CST Theorems 1.1, 1.5, 1.6`: the explicit formulas are stated for P⁰_χ(f) and its variant with the normalised integral
- `RankZeroOneBSD:BSD.3`: the non-torsion Heegner point in E(K) is P⁰_1(f) = Tr f(P)
- `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`: the point y = Tr_{K(x)/K} ι_A(x) is P⁰_1(f) for the quotient map f
- `Gross–Zagier I (6.3)`: ĥ(c_{χ,f}) of the f-isotypical component of c_χ is the arithmetic side

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.heegnerFinite` | constructor | P⁰_χ(x) = Σ_{g ∈ G} χ(g) • (g • x) for a finite group G acting on a module and a character χ. |
| `TauCeti.GrossZagier.heegnerFinite_smul` | relation | P⁰_χ(h • x) = χ(h)^{-1} • P⁰_χ(x). |
| `TauCeti.GrossZagier.heegnerFinite_mem_chiIsotypic` | projection | h • P⁰_χ(x) = χ(h)^{-1} • P⁰_χ(x), so P⁰_χ(x) ∈ A(χ). |
| `TauCeti.GrossZagier.heegnerFinite_one` | simp | P⁰_1(x) = Σ_g g • x, the trace. |
| `TauCeti.GrossZagier.heegnerFinite_add` | simp | P⁰_χ(x + y) = P⁰_χ(x) + P⁰_χ(y). |
| `TauCeti.GrossZagier.heegnerFinite_map` | functoriality | For an equivariant linear map φ, P⁰_χ(φ x) = φ(P⁰_χ x): the Heegner point of a composite parametrisation is the image point. |
| `TauCeti.GrossZagier.heegnerIntegral_eq` | compatibility | The analytic integral equals (v/h)·(1⊗heegnerFinite), in the complex scalar extension. |
| `TauCeti.GrossZagier.heegnerFinite_inv_eq_gz` | compatibility | Gross–Zagier's eigencomponent c_χ = Σ_σ χ^{-1}(σ) c^σ is P⁰_{χ^{-1}}(c) in this notation; the two conventions differ by χ ↔ χ^{-1} (GZ.0/artin-map-convention). |
| `TauCeti.GrossZagier.heegnerFinite_coeff_smul` | simp | For a ∈ L, P⁰_χ(a • x) = a • P⁰_χ(x), distinct from the group-action equivariance formula. |
| `TauCeti.GrossZagier.heegnerAverage` | constructor | h^{-1}P⁰_χ in the original L-module; this is the YZZ probability-normalized point. |
| `TauCeti.GrossZagier.heegnerAverage_eq_projector` | compatibility | The probability average is the character projector applied to the CM orbit vector. |
| `TauCeti.GrossZagier.heegnerIntegral` | constructor | For v∈ℂ the volume-scaled point is v·(1⊗heegnerAverage) in ℂ⊗_L V. |
| `TauCeti.GrossZagier.heegnerAverage_pairing` | relation | Any L-bilinear pairing of the χ and χ^{-1} averages is h^{-2} times the pairing of the corresponding finite sums. |

**Checks.**

- `TauCeti.GrossZagier.heegnerFinite_trivial_group` (degenerate): For G trivial, P⁰_χ(x) = x.
- `TauCeti.GrossZagier.heegnerFinite_sign_char` (computation): For G = ℤ/2 = {1, σ} and χ(σ) = −1, P⁰_χ(x) = x − σx; for x = (1, 0) in L² with σ swapping coordinates, P⁰_χ(x) = (1, −1).
- `TauCeti.GrossZagier.heegnerFinite_fixed_nontrivial` (non-example): If x is G-fixed and χ ≠ 1 then P⁰_χ(x) = 0: a K-rational point has no χ-component for a nontrivial χ.
- `TauCeti.GrossZagier.heegnerFinite_one_eq_trace` (compatibility): For χ = 1, P⁰_1(x) is the trace Σ_g g • x, the point y_K = Tr_{H/K} P of HE.1.
- `TauCeti.GrossZagier.heegnerFinite_cubic` (computation): For G = ℤ/3 = ⟨σ⟩ acting on L³ by σ(a,b,c) = (c,a,b) and χ(σ) = ζ a primitive cube root of unity: P⁰_χ(e₁) = (1,ζ,ζ²) and σ•P⁰_χ(e₁) = ζ²•P⁰_χ(e₁) = χ(σ)^{-1}•P⁰_χ(e₁); the χ^{-1}-weighted (Gross–Zagier) sum gives (1,ζ²,ζ) instead.
- `TauCeti.GrossZagier.heegnerAverage_sign` (computation): For ℤ/2 swapping the coordinates of ℚ² and χ the sign character, heegnerAverage χ (1,0) = (1/2,−1/2), half of P⁰_χ(1,0) = (1,−1).

**Acceptance.**

- For F = ℚ, B ramified only at ∞ (the modular case), U = U₀(N) and the Heegner condition, P⁰_χ(f) for f = (X₀(N) → E, ∞ ↦ O) is Σ_{[a]} f(P_a)χ([a])^{-1} with P_a the CM point C/a → C/a𝔑^{-1}, because σ_a sends P_b to P_{a^{-1}b} in GZ.0's convention. CST's sum Σ_{[a]} f(P_a)χ([a]) (§1.1; Example p.7) is therefore P⁰_{χ^{-1}}(f); the inversion is invisible in CST's formula, which is symmetric under χ ↔ χ^{-1}.
- For χ = 1, P⁰_1(f) = Tr_{H_c/K} f(P) ∈ A(K).

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, before Theorem 1.5, p. 6. The finite form of the χ-Heegner point.
- [zhang-2010](#source-zhang-2010), §4.2, p. 587. Haar measure of total volume 2L(1, η) on Gal(E^ab/E) and the Hodge-class base point. Zhang weights by χ(σ)^{-1} and works in Alb(X), so his P_χ is this node's volume-scaled point for χ^{-1}, before f is applied.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Theorem 1.6, p. 8. The normalised integral that recovers P⁰_χ from the integral form.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter I §6, p. 230. The classical eigencomponent and its normalisation.
- [yzz-erratum-2026](#source-yzz-erratum-2026), Item 25, correction to book p.82. Corrected integration group; the probability convention comes from the separate CST comparison.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §2.3, Lemma 2.3 p.17 and (2.4) with following paragraph p.18. Relative class-number factor and complete normalization dictionary.

<a id="target-gz-8-toric-integral-versus-finite-sum"></a>

### 8.4 Toric integral versus finite trace

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum` (lemma).

For a χ-weighted orbit factoring through G=Pic_{K/F}(O_c), probability integration is P_χ=P⁰_χ/h in A⊗_M L, whereas volume-v integration is v·(1⊗P_χ) in ℂ⊗_L(A⊗_M L). Thus B_F(P_χ,P_{χ^{-1}})=h^{-2}B_F(P⁰_χ,P⁰_{χ^{-1}}); the complex volume-scaled pairing gains a further v². In CST §2.3 let h_b=#Pic_{K/F}(O_b), κ_b=ker(Pic(O_F)→Pic(O_b)), w_b the torsion-unit quotient, R_b the regulator quotient and r=r_K−r_F. Its class-number identity is L^{(b)}(1,η)||Db²δ||^{1/2}2^{-r}=h_b R_b/(#κ_b w_b); setting ν_b=2^{-r}R_b^{-1}#κ_b w_b gives CST P_χ=2L(1,η)P⁰_χ/h_b. Here L(1,η) is the completed value, with factor π^{-1} at each real place of F (for K=ℚ(i), b=1 the identity gives L(1,η)=1/4=π^{-1}·L(1,χ_{−4})); ||·|| is the absolute ideal norm and L^{(b)} omits the Euler factors at the places dividing b. CST also has B_K=2B_F and vol(X)_YZZ=2vol(X)_CST: CST measure H by dxdy/(4πy²) (p.9), YZZ by dxdy/(2πy²) (as in Zhang 2010 p.580), so CST's pairing (f1,f2) is twice YZZ's. All three conversions must be made together. For F=ℚ and χ=1, the finite sum is the trace point and the YZZ average is its quotient by h_c; Skinner p.341 checks the case c = 1, P_K(f) = h_K·P(f_1).

**Hypotheses.**

- The orbit and χ factor through the finite quotient with h≠0 in L.
- Fix the coefficient embedding for the analytic integral; v=2L(1,η) is a complex scalar.
- Use the same finite-level curve, local toric normalizations and base field when comparing heights.

**Outline.**

1. Equal coset masses give the two finite formulas.
2. Bilinearity gives h^{-2} and v².
3. Prove CST Lemma 2.3 from the two exact sequences (κ_b, unit indices), the local index [Ô_K^×:Ô_b^×] = N(b)/L_b(1,η) and the class-number formulas for K and F; then simplify the coset volume to 2L(1,η)/h_b.
4. Apply CST’s adjacent height and curve-volume comparisons, rather than mixing its point with YZZ’s constant.

**Dependencies:** [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), `mathlib:NumberField.classNumber`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

**Acceptance.**

- CST Theorem 1.6's normalisation #Pic_{K/F}(O_{c1}) (CST print #Pic(O_{c1}); their proof, pp.19–20, uses Pic_{K/F}) / Vol(K^× F̂^× \ K̂^×, dt) · ∫ is exactly the inverse of this factor, so the variation formula reproduces P⁰_χ.
- For F = ℚ, K of class number one and c = 1: #Pic_{K/F}(O_K) = 1 and the factor is the whole toric volume 2L(1, η).

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Theorem 1.6, p. 8. The ratio between the integral and the finite sum.
- [zhang-2010](#source-zhang-2010), §4.2, p. 587. The total volume of the toric measure.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §2.3 Lemma 2.3 pp.17–18, equation (2.4) and following paragraph. Completed L(1,η), relative class number, point, height and curve-volume dictionary.
- [skinner-2020](#source-skinner-2020), Published §2.5 p.341, derivation of Proposition 2.5.1. Trace equals h_K times probability average.

<a id="target-gz-8-heegner-functional-equivariance"></a>

### 8.5 The Heegner map is a toric-invariant functional

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/heegner-functional-equivariance` (lemma).

For t ∈ 𝔸_K^× ⊂ B^× acting on π_A by right translation, P_χ(π_A(t) f) = χ(t)^{-1} P_χ(f). Hence f ↦ P_χ(f) is an element of Hom_{𝔸_K^×}(π_A ⊗ χ, ℂ) ⊗_ℂ (ℂ⊗_L A(χ)), after extending scalars along an embedding L ↪ ℂ; with the local toric spaces of GZ.4, it factors through ⊗_v Hom_{K_v^×}(π_{A,v} ⊗ χ_v, ℂ).

**Hypotheses.**

- ω_A · χ|_{𝔸_F^×} = 1 (YZZ's central-character condition).

**Outline.**

1. CM theory: the Hecke action of t on X^{K^×} agrees with σ_t (HE.1/canonical-model-cm-descent), so (π(t)f)(P) = f(P)^{σ_t} up to the convention of GZ.0.
2. Reindex the finite weighted probability sum by multiplication by t. Apply the central cancellation before using relative class representatives; scalar extension gives the complex toric functional.

**Dependencies:** [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention).

**Acceptance.**

- For F = ℚ and the classical Heegner points, applying σ_a, which sends P_b to P_{a^{-1}b} in GZ.0's convention, multiplies P⁰_χ by χ([a])^{-1} (CST's sum over Pic(O_c)).
- The vanishing of the toric Hom space at one place forces P_χ = 0 (vacuous-case).

**Sources.**

- [zhang-2010](#source-zhang-2010), §4.2, p. 587. The toric equivariance of the height distribution, whose source is the equivariance of P_χ.
- [yzz-2013](#source-yzz-2013), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements). Both sides of Thm. 1.2 lie in the toric Hom spaces, which is what the equivariance gives.

<a id="target-gz-8-general-quaternionic-gross-zagier-identity"></a>

### 8.6 The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity` (theorem).

Let F be totally real, B an incoherent quaternion algebra over 𝔸_F with ramification set Σ(B) of odd cardinality and B_∞ totally definite, X the Shimura curve system of B, A a simple abelian variety over F parametrised by X with M = End⁰(A) and π_A = Hom⁰_ξ(X, A), K/F totally imaginary quadratic with a fixed embedding 𝔸_K ↪ B, L ⊇ M a finite extension and χ : K^× \ 𝔸_K^× → L^× of finite order with ω_A · χ|_{𝔸_F^×} = 1. Then, as an identity in L ⊗_ℚ ℂ, for all f1 ∈ π_A and f2 ∈ π_{A^∨}: ⟨P_χ(f1), P_{χ^{-1}}(f2)⟩_{F,L} = ζ_F(2) L'(1/2, π_A, χ) / (4 L(1, η)² L(1, π_A, ad)) · α(f1, f2). Here L(s, π_A, χ) is the base-change Rankin L-function L(s, π_{A,K} ⊗ χ) in the unitary normalisation (centre 1/2), α = ∏_v α_v is the product of the normalised local toric integrals of GZ.4, P_χ denotes probability averaging, the height is relative to F, ζ_F(2), L(s,π_A,χ), L(1,η) and L(1,π_A,ad) are completed L-functions as CST's dictionary requires (CST Lemma 2.3 uses the completed L(1,η); finite parts would change the constant by (2π²)^{[F:ℚ]}; the book's own wording is unverified), and the local measures are the corrected ones. The volume-scaled complex integral is a separate object. The identity is first an equality of the two elements ⟨P_χ(·), P_{χ^{-1}}(·)⟩_L and α of the space Hom_{𝔸_K^×}(π_A ⊗ χ, ℂ) ⊗ Hom_{𝔸_K^×}(π_{A^∨} ⊗ χ^{-1}, ℂ), of dimension at most one; it is proved for factorisable f1, f2 and extended by bilinearity, and no zero pairing is placed in a denominator.

**Hypotheses.**

- A simple and parametrised by X; χ of finite order; ω_A · χ|_{𝔸_F^×} = 1.
- B incoherent (#Σ(B) odd) and totally definite at infinity; K/F totally imaginary. These are the standing hypotheses of YZZ Secs. 1.2.1 and 1.3.1.
- Root numbers in the base-change convention of the erratum: Σ(A, χ) = {v : ε(1/2, π_{A,v}, χ_v) ≠ χ_v(−1)}; Rankin–Selberg-over-F sources (Zhang 2010, CST) carry the extra η_v(−1), which is the same condition (GZ.0).
- The erratum (item 1) keeps the claim that the tower X is a regular, locally noetherian scheme only under #Σ(B) > 1; in the modular case Σ(B) = {∞} work with the finite-level curves X_U.
- Probability-normalized CM points and F-relative height. The CST comparison changes the point by 2L(1,η), multiplies the height by two and halves the curve volume; keep these changes explicit.

**Outline.**

1. Reduce to the projector form, YZZ Thm. 3.15: ⟨T(f1 ⊗ f2) P_χ, P_{χ^{-1}}⟩_NT = the same constant times α(f1 ⊗ f2), using T_alg(f1 ⊗ f2) = f2^∨ ∘ f1 and the projection formula for heights (YZZ Sec. 1.5.3). Skinner p.341 cites YZZ Thm. 3.13 for the χ=1 point-pairing form; check the numbering against the book.
2. Reduce Thm. 3.15 to the kernel identity (1.5.4) by the arithmetic theta lifting identity (1.5.5) (GZ.6).
3. Reduce the kernel identity for general Schwartz data to degenerate data using the one-dimensionality of the toric Hom spaces (GZ.4) and the local existence results (GZ.7).
4. Prove the degenerate kernel identity by decomposing both kernels over the nonsplit places: archimedean and good finite places by the local intersection computations, bad places by the nearby-quaternion approximation (GZ.7); the coherent kernels left over are perpendicular to σ by Saito–Tunnell at the nearby algebras B(v) (GZ.4).
5. Check the displayed constant against CST (2.4): its point is 2L(1,η) times the probability point after complex extension; its height is K-relative, twice the F-relative height; its curve-volume measure dxdy/(4πy²) is half of YZZ's dxdy/(2πy²), so CST's (f1,f2) is twice YZZ's; then (2.4) reads 8L(1,η)²⟨P_χ,P_{χ^{-1}}⟩_{F,L} = 2·ζ_F(2)L'(1/2,π_A,χ)L(1,π_A,ad)^{-1}·(f1,f2)_YZZ·∏_vβ_v, which is the displayed identity since α = (f1,f2)_YZZ·∏_vβ_v. Convert all three before identifying α and the coefficient ζ_F(2)/(4L(1,η)²L(1,π_A,ad)). The detailed projector-to-kernel argument is inherited from the reviewed decomposition and remains a book-proof gap.

**Dependencies:** [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing), [The Heegner map is a toric-invariant functional](#target-gz-8-heegner-functional-equivariance), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof), [Projected arithmetic kernel identity](#target-gz-6-generating-series-arithmetic-theta-lifting-and-the-kernel-identity), [Nearby quaternionic approximation](#target-gz-7-degenerate-schwartz-functions-local-decomposition-and-approximation), [The motivic centre s = 1 and the unitary centre s = 1/2](#target-gz-0-unitary-and-motivic-centres), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`.

**Acceptance.**

- Vacuous case: if Σ(B) ≠ Σ(A, χ) both sides vanish (vacuous-case).
- Essential case: Σ(B) = Σ(A, χ) forces ε(1/2, π_A, χ) = −1 (essential-case-root-number).
- Specialisation F = ℚ, Σ(B) = {∞}, Heegner hypothesis: recovers CST Theorem 1.1 after toric-integral-versus-finite-sum and the comparison of α with the Petersson norm (classical-gross-zagier-formula).
- Scaling: replacing f1 by c f1 multiplies both sides by c; replacing a local pairing by c times it multiplies α_v by c (decomposition review).

**Sources.**

- [yzz-2013](#source-yzz-2013), Chapter 1, Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements). The theorem with its exact constant.
- [yzz-2013](#source-yzz-2013), Chapter 1, Secs. 1.2.1 and 1.3.1, printed pp. 2–3 and 6 (inherited book locator; checked against public restatements). The standing hypotheses.
- [yzz-erratum-2026](#source-yzz-erratum-2026), Erratum items 1 and 16 (directly read erratum). The structural restriction in the modular case.
- [zhang-2010](#source-zhang-2010), §4.2, Theorem 4.2.1, p. 587. A public statement of the same theorem in distribution form, with the Rankin–Selberg root-number set Σ.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §2.3, equation (2.4) and following normalization comparison, p.18. Public restatement and normalization comparison; the detailed YZZ projector proof remains a source gap.
- [yzz-erratum-2026](#source-yzz-erratum-2026), Erratum items 28–31, 47, 57, 62 (directly read erratum). Corrections inside the projector reduction (T_alg lands in Hom⁰(J_U, J_U^∨); Z(x)_U is a push-forward; the F = ℚ normalising factor is 1/2) and in the height-series and local-height computations; the book-proof gap must be checked against them.

<a id="target-gz-8-vacuous-case"></a>

### 8.7 The zero case: vanishing of the toric Hom space

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/vacuous-case` (theorem).

In the setting of the Yuan–Zhang–Zhang formula, suppose Σ(B) ≠ Σ(A, χ) (equivalently, Hom_{K_v^×}(π_{A,v} ⊗ χ_v, ℂ) = 0 for some place v, by the Saito–Tunnell dichotomy with the erratum's convention). Then P_χ(f) = 0 in A(χ) for every f ∈ π_A, and α(f1, f2) = 0 for all f1, f2; the Gross–Zagier identity holds as 0 = 0 and gives no information about L'(1/2, π_A, χ).

**Hypotheses.**

- ω_A · χ|_{𝔸_F^×} = 1.
- Σ(A, χ) computed with ε(1/2, π_{A,v}, χ_v) ≠ χ_v(−1) (base-change convention).

**Outline.**

1. By heegner-functional-equivariance, f ↦ P_χ(f) lies in Hom_{𝔸_K^×}(π_A ⊗ χ, ℂ) ⊗ A(χ), and a K_A^×-invariant functional on a restricted tensor product restricts to a nonzero local invariant functional at each v if it is nonzero.
2. By Saito–Tunnell (GZ.4) the local space at v is zero exactly when B_v is not the quaternion algebra prescribed by ε(1/2, π_{A,v}, χ_v) χ_v(−1); Σ(B) ≠ Σ(A, χ) means this happens at some v.
3. α is the product of local α_v, and α_v vanishes on the zero local Hom space.

**Dependencies:** [The Heegner map is a toric-invariant functional](#target-gz-8-heegner-functional-equivariance), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity).

**Acceptance.**

- Example: F = ℚ, K with a prime q | N inert in K and q ∥ N, χ = 1, and B = M₂ at q; then Σ(A, 1) contains q and P_1(f) = 0 for every parametrisation by the modular curve — the classical Heegner hypothesis is one sufficient condition that avoids this (Skinner's (ram) case, p.341, is another).
- The vacuous case is recorded, not assumed away: the theorem is stated for all f1, f2.

**Sources.**

- [yzz-2013](#source-yzz-2013), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements). The zero case.

<a id="target-gz-8-essential-case-root-number"></a>

### 8.8 Matching local signs force the global sign −1

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number` (theorem).

If Σ(B) = Σ(A, χ), then the global root number is ε(1/2, π_A, χ) = ∏_v ε(1/2, π_{A,v}, χ_v) = (−1)^{#Σ(B)} = −1, so L(1/2, π_A, χ) = 0 and the Gross–Zagier identity concerns the first derivative. More generally ε(1/2, π_A, χ) = (−1)^{#Σ(A,χ)} whenever ω_A · χ|_{𝔸_F^×} = 1.

**Hypotheses.**

- ω_A · χ|_{𝔸_F^×} = 1, which makes every local ε_v equal to ±1. Separately, ∏_v χ_v(−1) = χ(−1) = 1 because χ is trivial on K^× ∋ −1.
- Base-change root numbers; in the Rankin–Selberg convention the same computation uses ∏_v η_v(−1) = 1.

**Outline.**

1. ε(1/2, π_A, χ) = ∏_v ε_v, and ε_v = χ_v(−1) for v ∉ Σ(A, χ), ε_v = −χ_v(−1) for v ∈ Σ(A, χ), all ε_v = ±1.
2. ∏_v χ_v(−1) = 1 because χ is trivial on K^× ∋ −1; hence ε = (−1)^{#Σ(A,χ)}.
3. #Σ(B) is odd for an incoherent B.

**Dependencies:** [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Acceptance.**

- F = ℚ, Heegner hypothesis (every p | N split in K), χ = 1: Σ(A, 1) = {∞}, so ε = −1 and L(E/K, 1) = 0, as in Gross–Zagier.
- JSW (H): every ℓ | N⁺ splits in K and N⁻ is a squarefree product of an even number of inert primes; Σ(A,1) = {∞} ∪ {q | N⁻}, odd, so ε = −1. Under (gen-H) a ramified ℓ ∥ N⁺ with untwisted Steinberg π_ℓ lies in Σ(A,1): for E = 11a1 and K = ℚ(√−11), Σ(A,1) = {∞, 11} and ε = +1, so JSW's (sign −1) needs a local condition such as Skinner's (ram) (source issue E89).

**Sources.**

- [yzz-2013](#source-yzz-2013), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements). The global sign in the essential case.
- [zhang-2010](#source-zhang-2010), §4.2, p. 586. The parity formula for the root number.
- [jsw-2017](#source-jsw-2017), §4.1, after (gen-H), p. 25. The sign under (H); the (gen-H) case needs an extra local condition at ramified ℓ | N⁺ (source issue E89).

<a id="target-gz-8-nonvanishing-criterion"></a>

### 8.9 Heegner points detect a nonzero central derivative

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion` (theorem).

In the essential case, fix a coefficient embedding ι:L↪ℂ. If both L′(1/2,π_A^ι,χ^ι) and the evaluated local product α^ι(f_1,f_2) are nonzero, then P_χ(f_1) is nonzero: the Gross–Zagier identity has nonzero right side in that same component. Nonzeroness of the form α alone is insufficient. For χ=1, totally real M and a polarization λ with f_2=λ∘f_1, a nonzero probability-averaged point has positive polarized height in every real coefficient realization; by the identity in each real embedding, this implies every conjugate derivative is nonzero. For strict GL(2)-type A, the product L(A/K,s) consequently has order dim A. The corresponding arbitrary-χ converse requires a conjugated dual parametrization and the Hermitian coefficient-height comparison requested from GZ.1; it is not obtained merely by setting f_2=λ∘f_1.

**Hypotheses.**

- Essential case and the nonzero evaluated toric product in the same embedding as the nonzero derivative.
- For the proved trace-point converse: χ=1, totally real coefficient field, positive polarization, and, only to identify Skinner's P_K(f) with h_K·P_1(f_1), his (sqf), (sgn), (ram).
- For the arbitrary finite-character extension: use complex conjugation on χ and the coefficient realization, and the supplied Hermitian comparison; that proof input is recorded separately.

**Outline.**

1. In a single embedding, the nonzero derivative times a nonzero evaluated α has nonzero product; a bilinear pairing with zero input would vanish. The constant is finite and nonzero because ζ_F(2), L(1,η) and L(1,π_A^ι,ad) are finite and nonzero (AL.3).
2. For χ=1 identify the finite trace with h times the probability point (Skinner p.341); positivity of the polarized height detects its nonzero rational point.
3. Apply the identity in each real embedding. Skinner’s coefficient-basis argument shows simultaneous nonzero trace realizations; then multiply the conjugate L-functions.
4. For χ≠1 request the Hermitian scalar-extension comparison, including conjugated dual data; do not infer it from Rosati positivity of an unconjugated bilinear pairing.

**Dependencies:** [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing), [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Character-component height pairing](#target-gz-1-character-height-pairing).

**Acceptance.**

- Skinner Proposition 2.5.1 and Corollary 2.5.2, under (sqf), (sgn), (ram): P_K(f) ≠ 0 ⇒ ord_{s=1} L(A_f/K, s) = [M_f : ℚ].
- Tian–Zhang (Zhang 2010, Theorem 4.3.1(1)): ord_{s=1} L(s, π, χ) = 1 implies the same for every conjugate (external comparison: for χ ≠ 1 this node does not prove it, and Tian–Zhang use Kolyvagin's method).
- A non-example: a nonzero element of the Selmer group of A over K does not give a non-torsion point; the first part of the statement produces the point P_χ(f1) itself.

**Sources.**

- [skinner-2020](#source-skinner-2020), §2.5, Proposition 2.5.1, arXiv v1 p. 12; published p. 341. A nonzero trace point forces a simple zero in the classical rational case.
- [skinner-2020](#source-skinner-2020), §2.5, Corollary 2.5.2, arXiv v1 p. 12; published p. 341. Simultaneous nonvanishing of the conjugates.
- [zhang-2010](#source-zhang-2010), §4.3, Theorem 4.3.1, p. 588. The same simultaneous nonvanishing over a totally real field.
- [yzz-2013](#source-yzz-2013), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements). α is a nonzero generator, so suitable test vectors exist.

<a id="target-gz-8-petersson-norm-and-parametrisation-degree"></a>

### 8.10 Petersson norm, parametrisation degree and Manin constant

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree` (lemma).

Let φ ∈ S₂(Γ₀(N)) be a newform with rational coefficients, ω_φ = 2πi φ(z) dz on X₀(N)(ℂ), f : X₀(N) → E a modular parametrisation of an elliptic curve E/ℚ (optimal or not) with f(∞) = O, ω₀ a Néron differential and C the Manin constant of f in the sense of GZ.3/manin-constant, f^*ω₀ = ±C·ω_φ, a positive integer after choosing the sign (GZ.3/manin-integrality-and-p-unit). Then (φ, φ)_{Γ₀(N)} = ∫_{Γ₀(N)\ℍ} |φ(z)|² dx dy is Tau Ceti's CuspForm.peterssonInnerCosets φ φ at weight 2 for Γ₀(N), equal to peterssonInner 2 D φ φ over the explicit fundamental domain D of CuspForm.peterssonInnerCosets_eq_peterssonInner, and it is positive for φ ≠ 0. With this identification the GZ.3 identities read ∫_{X₀(N)(ℂ)} |ω_φ ∧ ω̄_φ| = 8π² (φ, φ)_{Γ₀(N)} (GZ.3/classical-eigendifferential-period) and 8π² (φ, φ)_{Γ₀(N)} = deg f · ‖ω₀‖² / C² (GZ.3/petersson-composition-comparison), where ‖ω₀‖² = ∫_{E(ℂ)} |ω₀ ∧ ω̄₀|. The new content here is only the identification with the Tau Ceti product.

**Hypotheses.**

- (φ, φ) is integrated against dx dy, the convention of CST and of Tau Ceti's peterssonInner with weight k = 2 ((Im τ)² against dx dy / y²).
- C is part of the data of f (HE.1/parameter-choice-and-degree); no claim C = 1 is made.

**Outline.**

1. Unfold CuspForm.peterssonInnerCosets_eq_peterssonInner: the sum over the cosets of Γ₀(N) (which contains −I) is peterssonInner 2 over a union of translates of the standard domain forming a fundamental domain; at weight 2 the integrand |φ|²(Im τ)² against dx dy / y² is |φ|² dx dy. Positivity combines peterssonInnerCosets_self_re_nonneg and peterssonInnerCosets_self_im (a nonnegative real) with peterssonInnerCosets_self_eq_zero (zero only at φ = 0).
2. Import the two GZ.3 identities (|ω_φ ∧ ω̄_φ| = 8π²|φ|² dx dy, and f finite of degree deg f with f^*ω₀ = ±C ω_φ) and rewrite them with the identification of the first step.

**Dependencies:** `tauceti:UpperHalfPlane.peterssonInner`, `mathlib:UpperHalfPlane.petersson`, `mathlib:CuspForm`, `mathlib:CongruenceSubgroup.Gamma0`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `tauceti:CuspForm.peterssonInnerCosets`, `tauceti:CuspForm.peterssonInnerCosets_eq_peterssonInner`, `tauceti:CuspForm.peterssonInnerCosets_self_eq_zero`, [Eigendifferential period comparison](#target-gz-3-classical-eigendifferential-period), [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison), [Manin constant](#target-gz-3-manin-constant), [Integral Manin constant and p-unit range](#target-gz-3-manin-integrality-and-p-unit), `tauceti:CuspForm.peterssonInnerCosets_self_re_nonneg`, `tauceti:CuspForm.peterssonInnerCosets_self_im`.

**Acceptance.**

- Isogeny test: for ψ : E → E' of degree d with ψ^*ω₀' = c_ψ ω₀, the composite ψ ∘ f has degree d·deg f and Manin constant c_ψ C, and ‖ω₀'‖² = c_ψ² ‖ω₀‖² / d; the combination deg f · ‖ω₀‖² / C² is unchanged, as it must be, since the left side depends only on φ.
- For the X₀(11) parametrisation f = id of 11a1 (deg 1, C = 1), 8π²(φ, φ) = ‖ω₀‖².

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.1, before Theorem 1.1, p. 1. The normalisation of the Petersson norm.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.1, after Theorem 1.1, p. 2. The Manin constant of the parametrisation.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter I §6, after (6.4), p. 230. The Petersson–period identity.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter V §2, display before Theorem (2.1), p. 310. ‖ω‖² = c²‖ω_f‖²/deg π for the parametrisation π with π^*ω = cω_f, i.e. the degree identity.

<a id="target-gz-8-classical-gross-zagier-formula"></a>

### 8.11 The Gross–Zagier formula on X₀(N) for ring-class characters

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula` (theorem).

Let φ ∈ S₂(Γ₀(N)) be a newform, K imaginary quadratic of discriminant D, c ≥ 1, O_c = ℤ + cO_K and χ a primitive character of Pic(O_c). Assume (1) (c, N) = 1, no prime p | N is inert in K, and p splits in K if p² | N; (2) χ([𝔭]) ≠ a_p for every p | (N, D), 𝔭 the prime of O_K above p. Let 𝔑 ⊂ O_c be a proper ideal with O_c/𝔑 ≅ ℤ/Nℤ, P_a ∈ X₀(N)(H_c) the point of C/a → C/a𝔑^{-1}, P_χ = Σ_{[a] ∈ Pic(O_c)} [P_a − ∞] ⊗ χ([a]) ∈ J₀(N)(H_c) ⊗ ℂ and P_χ^φ its φ-isotypic component. Then L'(1, φ, χ) = 2^{−μ(N,D)} · 8π²(φ, φ)_{Γ₀(N)} / (u² √|Dc²|) · ĥ_K(P_χ^φ), where L(s, φ, χ) is the Rankin L-series of φ and the theta series of χ without the archimedean factor (centre s = 1), μ(N, D) is the number of primes dividing (N, D), u = [O_c^× : ℤ^×] and ĥ_K(a) = ⟨a, a⟩_K is the Néron–Tate height on J₀(N) relative to K for the class 2Θ (the canonical pairing of Gross–Zagier I (4.3)), extended Hermitian-linearly. For c = 1, D odd and every p | N split, this is Gross–Zagier's theorem; YZZ Thm. 1.1 states it with the height over H, which is h_K times ĥ_K.

**Hypotheses.**

- Conditions (1)–(2) imply sign −1 for L(s, φ, χ) and B = M₂(ℚ) (CST Lemma 3.1).
- u = [O_c^× : ℤ^×] is half the number of roots of unity in O_c (GZ.0/heegner-unit-index for c = 1).
- Heights relative to K; the cusp ∞ may be replaced by the normalised Hodge class without changing P_χ^φ, cuspidal divisors being Eisenstein.
- The Heegner points P_a are imported from HE.1/cm-cyclic-isogeny-pair, which assumes D_K ∉ {−3, −4}; for K = ℚ(√−1) and ℚ(√−3) (u = 2, 3) the points are requested from HeegnerPointEulerSystems HE.1.

**Outline.**

1. Gross–Zagier's route for c = 1, D odd, (D, N) = 1: put c_χ = Σ_σ χ^{-1}(σ) c^σ; by Galois invariance ⟨c_χ, T_m c_χ⟩ = h Σ_σ χ(σ) ⟨c, T_m c^σ⟩, so L'(f, χ, 1) = Σ_𝒜 χ(𝒜) L'_𝒜(f, 1) = 8π²/(u²|D|^{1/2}) · (1/h) Σ_m ⟨c_χ, T_m c_χ⟩-series paired with f (coefficient-identity), and expanding c_χ in Hecke eigencomponents leaves ĥ(c_{χ,f}) (f, f) because distinct eigencomponents are orthogonal: L'(f, χ, 1) = 8π²(f, f)/(h u² |D|^{1/2}) · ĥ_H(c_{χ,f}), with ĥ_H = h ĥ_K (Gross–Zagier I (6.3)–(6.5)).
2. General c, D and (N, D): special case of CST Theorem 1.5 (explicit-gross-zagier-formula) with F = ℚ, the admissible order R = {(a b; c d) ∈ M₂(ℤ̂) : N | c} and f : X₀(N) → A, ∞ ↦ O in V(π_A, χ).
3. The CM point fixed by K^× represents C/O_c → C/𝔑^{-1}; the sum Σ_{[a]} f(P_a)χ([a]) over Pic(O_c) is P⁰_{χ^{-1}}(f) (chi-heegner-point), which is exactly Gross–Zagier's c_χ (heegnerFinite_inv_eq_gz); apply Theorem 1.5 to χ^{-1}, which also satisfies (1)–(2) and has L(s, φ, χ^{-1}) = L(s, φ, χ).
4. Translate Theorem 1.5: here Σ₁ = Σ_D = {p | (N, D)}, c₁ = c and κ = 1, so 2^{−#Σ_D} = 2^{−μ(N, D)}, u₁ = u and |D_K|‖c₁²‖ = |Dc²|; Σ = ∅ because p | (N, D) forces p ∥ N by condition (1) while ord_p(c/N) < 0, so L^{(Σ)} = L; and (f, f)_{R^×} = deg f.

**Dependencies:** [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing), [Petersson norm, parametrisation degree and Manin constant](#target-gz-8-petersson-norm-and-parametrisation-degree), [The unit index u](#target-gz-0-heegner-unit-index), [The motivic centre s = 1 and the unitary centre s = 1/2](#target-gz-0-unitary-and-motivic-centres), `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `mathlib:NumberField.classNumber`, `mathlib:NumberField.Units.torsionOrder`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, [The main identity on X₀(N): heights as Fourier coefficients](#target-gz-8-coefficient-identity), [The explicit Gross–Zagier formula of Cai–Shu–Tian](#target-gz-8-explicit-gross-zagier-formula), [Admissible orders and the test-vector line V(π, χ)](#target-gz-8-admissible-order-test-vector), `AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Constant check against YZZ Thm. 1.1 as quoted in the decomposition: ⟨P_χ(f), P_χ(f)⟩^H_NT = h u² |D|^{1/2}/(8π²(f, f)) · L'(f, χ, 1) for odd D and c = 1 is the same identity after ⟨,⟩^H = h·ĥ_K.
- Unit factor: K = ℚ(√−3), c = 1 gives u = 3 and the factor 1/9; K = ℚ(i) gives u = 2.
- μ(N, D) > 0 only when a prime of N ramifies in K, allowed by condition (1) when p² ∤ N.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.1, Theorem 1.1, p. 2. The formula with its constant.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.1, conditions (1)–(2), p. 1. The Heegner conditions.
- [yzz-2013](#source-yzz-2013), Chapter 1, Thm. 1.1, printed p. 1 (inherited book locator; checked against public restatements). The classical formula as YZZ quote it.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter I §6, Theorem (6.3) and (6.5), p. 230. The original formula, with heights over H; (6.5) restates it with ĥ_K and ‖ω_f‖² = 8π²(f, f).

<a id="target-gz-8-elliptic-curve-heegner-height-formula"></a>

### 8.12 Heights of Heegner points on an elliptic curve

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula` (theorem).

Let E/ℚ have conductor N, f : X₀(N) → E a modular parametrisation with f(∞) = O, Manin constant C and Néron differential ω₀, and K, c, χ as in classical-gross-zagier-formula. Put P⁰_χ(f) = Σ_{[a] ∈ Pic(O_c)} f(P_a) ⊗ χ([a])^{-1} ∈ E(H_c)_ℂ (chi-heegner-point; CST’s sum with χ([a]) is P⁰_{χ^{-1}}(f) and has the same K-height). Then L'(1, E, χ) = 2^{−μ(N,D)} · 8π²(φ, φ)_{Γ₀(N)} / (u² √|Dc²|) · ĥ_K(P⁰_χ(f)) / deg f = 2^{−μ(N,D)} · ‖ω₀‖² ĥ_K(P⁰_χ(f)) / (C² u² √|Dc²|). For χ = 1 and c = 1, P⁰_1(f) = P_K(f) = Tr_{H_K/K} f(P) ∈ E(K), and ĥ_K(P) = ⟨P, P⟩_BSD computed over K, which is twice Tau Ceti's canonicalHeight for the K-relative height; it is nonzero exactly when P_K(f) has infinite order.

**Hypotheses.**

- Heegner conditions (1)–(2) of CST.
- ĥ_K is the Néron–Tate height relative to K for the class 2(O) (Gross–Zagier I (4.3); the x-height normalisation of GZ.0). With mathlib:NumberField.instAdmissibleAbsValues on K, Tau Ceti's canonicalHeight is the K-relative (O)-height, so ĥ_K = 2·canonicalHeight = GZ.0's ĥ_x over K.
- deg f and C are data of f; replacing f by its composite with an isogeny changes both and leaves the formula invariant.

**Outline.**

1. The φ-isotypic projection commutes with f_*: J₀(N) → E, and the height on E pulls back along f to deg f times the height on the f-isotypic part of J₀(N) (projection formula ⟨f x, f x⟩_E = ⟨x, f^∨ f x⟩_J; since f ∘ f^∨ = [deg f] on E, f^∨ ∘ f acts as deg f on the φ-isotypic part f^∨(E) ⊗ ℂ).
2. Combine classical-gross-zagier-formula with petersson-norm-and-parametrisation-degree.
3. For χ = 1 and c = 1 the χ-sum is the Galois trace over Pic(O_K) ≅ Gal(H_K/K) (GZ.0/trace-versus-average).

**Dependencies:** [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [Petersson norm, parametrisation degree and Manin constant](#target-gz-8-petersson-norm-and-parametrisation-degree), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average), `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`, `mathlib:WeierstrassCurve.Affine.Point`, `mathlib:NumberField.instAdmissibleAbsValues`.

**Acceptance.**

- Gross–Zagier's form L'(E/K, 1) = ‖ω₀‖² ĥ_K(y_K) / (C² u² √|D|) (Gross–Zagier write c for the Manin constant C) for (N, D) = 1 and c = 1 is the case μ = 0.
- Isogeny invariance: for ψ : E → E' of degree d, ĥ(ψ P) = d ĥ(P), deg(ψ ∘ f) = d deg f, and C changes by c_ψ; both sides of the second formula are unchanged.
- For 37.a1 and K = ℚ(√−7) the right side must match L'(E/K, 1) = L'(E, 1) L(E^K, 1), a positive real number; a sign or factor-2 error in the height convention is detected by this check.
- Gross–Zagier I Theorem (7.3) (L'(E, 1) is a nonzero rational multiple of Ω·⟨P, P⟩) is RankZeroOneBSD BSD.5's rationality theorem; this node supplies its Gross–Zagier input (Theorem V (2.1)), and the choice of K with L(E^K, 1) ≠ 0 is BSD.2's.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.1, Theorem 1.1, second display, p. 2. The elliptic-curve formula with the degree of the parametrisation.
- [skinner-2020](#source-skinner-2020), §2.4, p. 11. The trace Heegner point in the rational modular case.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter V §2, Theorem (2.1), p. 311. The elliptic-curve form with the Manin constant c and ‖ω‖² = ∫∫_{E(ℂ)} |ω ∧ ω̄|.

<a id="target-gz-8-admissible-order-test-vector"></a>

### 8.13 Admissible orders and the test-vector line V(π, χ)

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector` (definition).

Let N be the conductor of π^JL, D = D_{K/F}, c ⊂ O_F the largest ideal with χ trivial on ∏_{v∤c} O_{K,v}^× · ∏_{v|c} (1 + cO_{K,v}) (CST’s conductor; this is χ trivial on Ô_c^× only when ω_A is unramified), Σ₁ = {v | N nonsplit in K : ord_v(c) < ord_v(N)}, c₁ the Σ₁-off part of c, N₁ the Σ₁-off part of N and N₂ = N/N₁ its Σ₁-part. An Ô-order R of B_f is admissible for (π, χ) if it has discriminant N, R ∩ K̂ = Ô_{c₁}, and each local component R_v is the admissible local order of GZ.4/admissible-toric-order, including its orientation rule in the split case 0 < ord_v(c₁) < ord_v(N). With U = R̂^×, U^{(N₂)} its N₂-off part, and ω the central character extended to U^{(N₂)} = U′·(Z ∩ U^{(N₂)}) trivially on U′ = ∏_{v∤N₂∞} U′_v (U′_v = U_v for v ∤ N, U′_v ≅ U₁(N)_v for v | N₁), V(π, χ) ⊂ π_A ⊗_M L is the simultaneous eigenspace specified by ω on U^{(N₂)} and by χ_v^{-1} on each K_v^× with v ∈ Σ₁. By GZ.4/toric-test-vectors at each v and multiplicity one, V(π, χ) is one-dimensional over L and every nonzero vector is a test vector: α(f, f') ≠ 0 for nonzero f ∈ V(π_A, χ), f' ∈ V(π_{A^∨}, χ^{-1}) (CST Proposition 3.7).

**Hypotheses.**

- ω_A · χ|_{𝔸_F^×} = 1 and the local condition ε(π_v, χ_v) = χ_v η_v(−1) ε(B_v) (Rankin–Selberg convention of CST, equivalent to the erratum's base-change form).
- At v | N₁ the algebra B_v is split (CST Lemma 3.1(5)).
- The dimension and nonzero-toric conclusions require the actual irreducible local representation, its conductor, the root-number condition and this full admissibility predicate, not just a unit-group intersection or abstract eigenline.

**Outline.**

1. Existence and uniqueness of admissible R_v up to K_v^×-conjugacy away from (c₁, N), and the two conjugacy classes when 0 < ord_v(c₁) < ord_v(N) (CST Lemmas 3.3–3.4).
2. Local test-vector theory: the fixed space is one-dimensional and the local toric integral is nonzero on it (CST Propositions 3.7–3.8, §3.3–3.4); it imports the local toric functional of GZ.4.

**Dependencies:** [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, [Admissible toric order](#target-gz-4-admissible-toric-order), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors), `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`.

**Uses.**

- `CST Theorems 1.5 and 1.8`: the explicit formulas are stated for f ∈ V(π, χ)
- [The explicit Gross–Zagier formula of Cai–Shu–Tian](#target-gz-8-explicit-gross-zagier-formula): the denominator (f1, f2)_{R^×} and the nonvanishing of α
- `JSW Remark 4.2.1`: comparison of Heegner points on X_{N⁺,N⁻} with CST's normalisation
- `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`: the CM point x of the specified level is a test vector exactly when its level is admissible

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.IsAdmissibleOrder` | constructor | CST Definition 1.3: discriminant, optimal intersection, two-maximal-order intersections and the explicitly conductor-selected split orientation when 0<c_v<n_v. |
| `TauCeti.GrossZagier.testVectorLine` | data | V(π, χ): the subspace of π ⊗_M L that is eigen under U^{(N₂)} for the extension of ω trivial on U′, and χ_v^{-1}-eigen under K_v^× for v ∈ Σ₁. |
| `TauCeti.GrossZagier.finrank_testVectorLine` | characterisation | dim_L V(π, χ) = 1 (CST Proposition 3.7). |
| `TauCeti.GrossZagier.localToric_ne_zero_of_mem_testVectorLine` | other | α(f, f') ≠ 0 for nonzero f ∈ V(π_A, χ), f' ∈ V(π_{A^∨}, χ^{-1}). |
| `TauCeti.GrossZagier.isAdmissibleOrder_eichler` | example | For F = ℚ and the Heegner conditions, the Eichler order of level N is admissible. |
| `TauCeti.GrossZagier.mem_testVectorLine_iff` | characterisation | Membership in V(π,χ) is exactly the ω-eigencondition under U and the χ_v^{-1}-eigencondition under the specified local tori. |

**Checks.**

- `TauCeti.GrossZagier.isAdmissibleOrder_eichler_X0` (computation): For K=ℚ(√−7), N=11, c=1, the image !![1,−1;22,−8] of (−7+√−7)/2 has lower-left entry divisible by 11 and satisfies X²+7X+14=0. This tests the explicit embedding fragment. Full admissibility and its CM-point identification require the actual CST order/curve supplier and are recorded as a gap.
- `TauCeti.GrossZagier.testVectorLine_unramified` (degenerate): With trivial ω and the bottom torus subgroup, membership in the test-vector submodule equals the U-fixed condition. The full unramified maximal-order assertion also requires the irreducible local-representation supplier.
- `TauCeti.GrossZagier.testVectorLine_finrank_one` (characterisation): Given the actual line has finrank one, any two test vectors, the first nonzero, are proportional. Proving this dimension from admissibility is the missing arithmetic API, rather than an assumption for arbitrary representations.
- `TauCeti.GrossZagier.newline_not_testVector` (non-example): For a local torus element t with χ(t)≠1, a nonzero t-fixed vector cannot satisfy the required χ^{-1}-eigencondition. This tests the eigenline fragment, modelled on the spherical vector at v ∤ N with χ_v ramified and t ∈ O_{K,v}^×, χ_v(t) ≠ 1; the geometric example additionally requires the CST local representation export.
- `TauCeti.GrossZagier.testVectorLine_inverse_convention` (non-example): For T₁ = ⟨t⟩ with χ(t) = ζ (ζ³ = 1, ζ ≠ 1), U trivial and ω = 1: a vector f with t·f = ζ^{-1} f lies in V, while a nonzero g with t·g = ζ g does not. This detects the χ versus χ^{-1} convention.

**Acceptance.**

- F = ℚ, Heegner conditions: R = {(a b; c d) ∈ M₂(ℤ̂) : N | c} is admissible and f : X₀(N) → A, ∞ ↦ O lies in V(π_A, χ) (CST, Example after Theorem 1.5).
- The line depends on the optimal embedding, not just the level: at v ∤ N with χ_v ramified (c_v ≥ 1), the vector fixed by a maximal order meeting K_v in O_{K,v} is O_{K,v}^×-fixed and χ_v is nontrivial there, so its toric integral is 0; the test line is fixed by a maximal order meeting K_v in O_{c,v}. At v ∥ N, v | D, c_v = 0 the U₀(N)-newline is the test line (CST Proposition 3.8, Lemma 3.4).

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Definition 1.3, p. 5. Admissible orders.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Definition 1.4, p. 6. The test-vector line.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §3.3 Proposition 3.7 p.24. One-dimensional test-vector space under genuine admissibility and local representation hypotheses.

<a id="target-gz-8-explicit-gross-zagier-formula"></a>

### 8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula` (theorem).

Let F be totally real of degree d, A/F an abelian variety parametrised by a Shimura curve with Hilbert newform φ of parallel weight two, K/F totally imaginary with relative discriminant D and absolute discriminant D_K, χ a finite Hecke character of conductor c with values in L ⊇ M. Assume ω_A · χ|_{𝔸_F^×} = 1 and ε(π_{A,v}, χ_v) = χ_v η_v(−1) ε(B_v) for every v. For nonzero f1 ∈ V(π_A, χ), f2 ∈ V(π_{A^∨}, χ^{-1}): L^{(Σ)'}(1, A, χ) = 2^{−#Σ_D} · (8π²)^d (φ, φ)_{U₀(N)} / (u₁² √(|D_K| ‖c₁²‖)) · ⟨P⁰_χ(f1), P⁰_{χ^{-1}}(f2)⟩_{K,L} / (f1, f2)_{R^×}, an equality in L ⊗_ℚ ℂ, with Σ = {v | (N, Dc) : if v ∥ N then ord_v(c/N) ≥ 0}, Σ_D = {v | (N, D) : ord_v(c) < ord_v(N)}, u₁ = #κ_{c₁} · [O_{c₁}^× : O^×] and L^{(Σ)} the L-series with the Euler factors at Σ removed. Special case (CST Special case 1): if moreover ω_A is unramified and (N, Dc) = 1, B is the nearby quaternion algebra at a real place τ, R an admissible O-order of B, U = R̂^×, P = [h₀, 1] with h₀ the K^×-fixed point and u = #κ_c·[O_c^× : O^×], then L'(1, A, χ) = (8π²)^d (φ, φ)_{U₀(N)} / (u² √(|D_K| ‖c²‖)) · ⟨P⁰_χ(f1), P⁰_{χ^{-1}}(f2)⟩_{K,L} / (f1, f2)_U for any non-constant f1 : X_U → A, f2 : X_U → A^∨ sending a Hodge class to torsion, where (f1, f2)_U = f1 ∘ f2^∨.

**Hypotheses.**

- The local sign condition is in the Rankin–Selberg convention; it is the erratum's base-change condition ε(1/2, π_{K,v} ⊗ χ_v) = χ_v(−1) ε(B_v) because the two local root numbers differ by λ(K_v/F_v, ψ_v)² = η_v(−1) (GZ.0).
- (f1, f2)_U = Vol(X_U)(f1, f2) with (f1, f2) = Vol(X_U)^{-1} f1 ∘ f2^∨ ∈ M; for an elliptic curve (f, f)_U = deg f.
- Unit index u₁ includes #κ_{c₁} ∈ {1, 2}, the kernel of Pic(O_F) → Pic(O_{c₁}).
- GZ.0/heegner-unit-index gives u₁ only for F = ℚ and c₁ = 1; the general u₁ is defined here from CST §1.2.

**Outline.**

1. Apply the Yuan–Zhang–Zhang formula to f1 ∈ V(π_A, χ), f2 ∈ V(π_{A^∨}, χ^{-1}) and convert P_χ to P⁰_χ (toric-integral-versus-finite-sum).
2. Evaluate α(f1, f2) at the test vectors by the local computations of CST Proposition 2.5 (formula (2.5)), §3.4 Propositions 3.11–3.12 and Lemmas 3.13–3.14 (assembled in the proof of Theorem 1.5, p.19) and the Petersson pairing formula (CST Proposition 2.1), using the Waldspurger-side normalisations of GZ.5.
3. Compare L(1, π_A, ad) with (φ, φ)_{U₀(N)} (CST Proposition 2.1) and collect the local factors into 2^{−#Σ_D}, u₁ and ‖c₁‖.

**Dependencies:** [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [Admissible orders and the test-vector line V(π, χ)](#target-gz-8-admissible-order-test-vector), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing), [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof), [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), [The unit index u](#target-gz-0-heegner-unit-index), [Admissible toric order](#target-gz-4-admissible-toric-order), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors), [Explicit local toric constants at test vectors](#target-gz-4-explicit-local-toric-constants), [Petersson pairing as a product of Whittaker pairings](#target-gz-5-petersson-whittaker-factorization).

**Acceptance.**

- F = ℚ with the Heegner conditions recovers classical-gross-zagier-formula (CST's Example after Theorem 1.5).
- Special case 2 (ω_A trivial) removes the Euler factors exactly at Σ = {v | (cD, N) : v ∥ N ⇒ v ∤ D}.
- Unit factor u₁ = 1 for K/F with O_{c₁}^× = O^× and κ_{c₁} = 1.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Theorem 1.5, p. 6. The general explicit formula.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Special case 1, p. 7. The coprime special case used for totally real fields.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §2.4, proof of Theorem 1.5, p. 19. Reduction to Proposition 2.5 and Lemmas 3.13–3.14.

<a id="target-gz-8-explicit-formula-variation"></a>

### 8.15 Variation of the explicit formula for other test vectors

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/explicit-formula-variation` (theorem).

With (A, χ), f1 ∈ V(π_A, χ), f2 ∈ V(π_{A^∨}, χ^{-1}) as in explicit-gross-zagier-formula, let S be a finite set of finite places and f1' ∈ π_A, f2' ∈ π_{A^∨} pure tensors agreeing with f1, f2 outside S, with ⟨f'_{1,v}, f'_{2,v}⟩_v ≠ 0 and β⁰(f'_{1,v}, f'_{2,v}) ≠ 0 for v ∈ S, where β⁰(f'_1, f'_2) = ∫_{F_v^× \ K_v^×} ⟨π(t) f'_1, f'_2⟩_v / ⟨f'_1, f'_2⟩_v · χ_v(t) dt. Put P⁰_χ(f1') = #Pic_{K/F}(O_{c₁}) / Vol(K^× F̂^× \ K̂^×) · ∫ f1'(P)^{σ_t} χ(t) dt (CST print #Pic(O_{c₁}), source issue E90; the relative group is needed for agreement with explicit-gross-zagier-formula at S = ∅, and the two counts agree for F = ℚ). Then L^{(Σ)'}(1, A, χ) = 2^{−#Σ_D} (8π²)^d (φ, φ) / (u₁² √(|D_K| ‖c₁²‖)) · ⟨P⁰_χ(f1'), P⁰_{χ^{-1}}(f2')⟩_{K,L} / (f1', f2')_{R^×} · ∏_{v ∈ S} β⁰(f_{1,v}, f_{2,v}) / β⁰(f'_{1,v}, f'_{2,v}), independent of the Haar measures at v ∈ S.

**Hypotheses.**

- Same hypotheses as explicit-gross-zagier-formula; the ratio β⁰/β⁰ is independent of the local measure.

**Outline.**

1. Both sides are bilinear invariant forms; by the one-dimensionality of the toric Hom spaces their ratio for (f1', f2') against (f1, f2) is the ratio of the local toric integrals at v ∈ S.
2. Apply explicit-gross-zagier-formula to (f1, f2) and substitute.

**Dependencies:** [The explicit Gross–Zagier formula of Cai–Shu–Tian](#target-gz-8-explicit-gross-zagier-formula), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Admissible toric order](#target-gz-4-admissible-toric-order), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors), [Explicit local toric constants at test vectors](#target-gz-4-explicit-local-toric-constants).

**Acceptance.**

- CST's example: A = X₀(36), K = ℚ(√−3), p ≡ 2 mod 9 prime, χ the cubic character of K(∛p)/K (c = 3p, c₁ = p, #Σ_D = 1, u₁ = 1), f' = id: here Σ = {3} and the Euler factor at 3 is 1, so L^{(Σ)} = L, and L'(1, A, χ) = 9 · 8π²(φ, φ)_{Γ₀(36)} / √(3p²) · ⟨P⁰_χ(f'), P⁰_{χ^{-1}}(f')⟩_{K,K}, from (f', f')_{R^×} = 2/9 and β⁰(f_v, f_v)/β⁰(f'_v, f'_v) = 1 at v = 2 and 4 at v = 3 (9 = 2^{−1}·(9/2)·4); CST write L'^{(∞)}.
- Taking S = ∅ recovers explicit-gross-zagier-formula.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Theorem 1.6, p. 8. The variation formula.
- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Example after Theorem 1.6, p. 8. The cube-sum example.

<a id="target-gz-8-rational-shimura-curve-heegner-formula"></a>

### 8.16 Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/rational-shimura-curve-heegner-formula` (theorem).

Let f ∈ S₂(Γ₀(N)) be a newform with Hecke field M_f, K imaginary quadratic, and assume (sqf) N squarefree, (sgn) ε(f, K) = −1 and (ram) — if (D, N) ≠ 1 then π_ℓ ≅ σ_ℓ ⊗ ξ_ℓ for ℓ | (D, N) and every ℓ | N/(D, N) splits in K. Then either (Case I) every ℓ | N splits or ramifies in K and X = X₀(N), or (Case II) N = N⁺N⁻ with N⁻ supported on a positive even number of inert primes, while N⁺ consists of the split-prime factors of N (so (D, N) = 1) and X = X_{N⁺,N⁻} the Shimura curve of the indefinite quaternion algebra of discriminant N⁻ and an Eichler order of level N⁺. Let φ : J(X) → A_f be the quotient by the kernel of the f-eigencharacter, P_K(f) ∈ A_f(K) ⊗ M_f the trace Heegner point (Skinner §2.4), L a symmetric ample line bundle on A_f with polarisation λ. Then, for the identity embedding ι : M_f ⊂ ℝ ⊂ ℂ and P_K(f)^ι ∈ A_f(K) ⊗ ℝ, ⟨P_K(f)^ι, P_K(f)^ι⟩_L = h_K² ζ(2) L'(f, K, 1) (f1 ∘ f2^∨)^ι / (4 L(χ_D, 1)² L(Sym² f, 2) vol(X)), with f1 = φ, f2 = λ ∘ φ and f1 ∘ f2^∨ ∈ End⁰(A_f) = M_f. Consequently P_K(f) ≠ 0 if and only if L'(f, K, 1) ≠ 0, and then ord_{s=1} L(A_f/K, s) = [M_f : ℚ].

**Hypotheses.**

- (sqf), (sgn), (ram) as in Skinner §2.5.
- The cusp ∞ (Case I) or the normalised Hodge class (Case II) is used as base point; cuspidal and Hodge divisors are Eisenstein, so P_K(f) is unchanged.
- L(Sym² f, 2), L(χ_D, 1) and ζ(2) are Skinner's notation for YZZ's L(1, π, ad), L(1, η) and ζ_F(2) at F = ℚ, χ = 1, quoted from YZZ Theorem 3.13 with YZZ's normalisation of these values; CST Lemma 2.3 forces the completed L(1, η) in that normalisation, and the book itself is not available to confirm the archimedean factors. For F=ℚ, the completed ζ-value at 2 is ζ_finite(2)/π, and the completed odd quadratic L-value at 1 is L_finite(χ_D,1)/π. These completion factors are the convention dictionary, rather than additional declarations in the compact file.

**Outline.**

1. P_K(f) = h_K · P(f1)^ι with P(f1) the YZZ point of the homomorphism f1 = φ and the CM point P (Skinner §2.5).
2. Apply YZZ Theorem 3.13 as cited by Skinner (the Yuan–Zhang–Zhang formula specialised to F = ℚ, χ = 1, Σ(B) = {∞} ∪ {ℓ | N⁻}; book statement not directly checked).
3. M_f is totally real, so P_K(f)^ι ∈ A_f(K) ⊗ ℝ, where the height of the ample symmetric L is positive definite; id ⊗ ι is injective, so ⟨P_K(f)^ι, P_K(f)^ι⟩_L ≠ 0 iff P_K(f) ≠ 0. f1 ∘ f2^∨ ≠ 0 because λ is an isogeny.
4. The order of vanishing follows from the χ = 1 part of nonvanishing-criterion (every conjugate derivative is nonzero, so L(A_f/K, s) has order [M_f : ℚ]).

**Dependencies:** [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `mathlib:riemannZeta`, `mathlib:DirichletCharacter.LFunction`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`, `mathlib:completedRiemannZeta`.

**Acceptance.**

- Case I with (D, N) = 1 and D odd is the classical Gross–Zagier setting; Case I with ramified primes is JSW's (gen-H) with N⁻ = 1; Case II is JSW's (H) with N⁻ ≠ 1 (here with N squarefree).
- The factor h_K² records the trace normalisation P_K(f) = h_K P(f1): an averaged point would remove it (toric-integral-versus-finite-sum).

**Sources.**

- [skinner-2020](#source-skinner-2020), §2.5, proof of Proposition 2.5.1, p. 12. The height formula and Corollary 2.5.2, quoted by Skinner from YZZ Theorem 3.13 (published p.341).
- [skinner-2020](#source-skinner-2020), §2.4, Cases I and II, p. 10. The quaternionic case.
- [jsw-2017](#source-jsw-2017), §4.1, (gen-H), p. 24. The generalised Heegner hypothesis of the consumers.

<a id="target-gz-8-totally-real-trace-point-nontorsion"></a>

### 8.17 Non-torsion of the trace point on a parametrised GL(2)-type quotient

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/totally-real-trace-point-nontorsion` (theorem).

Let F be totally real, B/F ramified at all real places but one and at a finite set S_B with #S_B ≡ [F:ℚ] − 1 mod 2, R an admissible order for (π_A, 1) in the sense of admissible-order-test-vector, X_U the Shimura curve of U = R̂^×, A/F a simple quotient of J(X_U) of strict GL(2)-type with M = End⁰(A), K/F totally imaginary with ε(1/2, π_{A,v}, 1_{K,v}) = η_v(−1)ε(𝔹_v) for every place v, where 𝔹 is the incoherent algebra with B as nearby algebra (CST Theorem 1.5 (2); in particular every v ∈ S_B is nonsplit in K), x ∈ X_U a CM point by K of the admissible level, and f : X_U → A the quotient map normalised by the Hodge class (ι(P) = m[P] − mξ). Assume ω_A is trivial (CST hypothesis (1) with χ = 1) and (N, D) = 1. Put y = Tr_{K(x)/K} f(x) ∈ A(K)_ℚ; here K(x) = H_K and y = (h_F/#κ_1)·P⁰_1(f) with κ_1 = ker(Pic(O_F) → Pic(O_K)), so y and P⁰_1(f) are torsion together. Then y has infinite order if and only if L'(1, A, 1_K) ≠ 0 in M ⊗ ℂ, if and only if ord_{s=1} L(A/K, s) = [M : ℚ] = dim A. In particular, analytic rank exactly dim A over K for L(A/K, s) certifies that this specified y is non-torsion; analytic rank alone without the admissible level does not.

**Hypotheses.**

- The CM point x has the admissible level, so f is a test vector (α(f, f^∨) ≠ 0); for a non-admissible level y may be torsion although L'(1, A, 1_K) ≠ 0.
- Each conjugate L(s, π_A^ι, 1_K) has root number −1 because the local signs match B (essential-case-root-number), so its order is odd.
- This is the statement HE.7/admissible-rm-kolyvagin-logachev requests; Kolyvagin–Logachev descent (HE.7) then gives rank_ℤ A(K) = dim A.

**Outline.**

1. Apply the special case (N, Dc) = 1 of explicit-gross-zagier-formula with χ = 1: L'(1, A, 1) is a nonzero multiple of ⟨y, λ y⟩_{K,M} / (f, λ ∘ f)_U.
2. Positivity of the Néron–Tate pairing for the polarisation λ (GZ.1) makes ⟨y, λ y⟩_{K,M} totally positive in M ⊗ ℝ when y has infinite order and zero otherwise.
3. Conclude with the χ = 1 part of nonvanishing-criterion: the conjugate derivatives vanish simultaneously, and L(A/K, s) = ∏_ι L(s − 1/2, π_A^ι, 1_K).

**Dependencies:** [The explicit Gross–Zagier formula of Cai–Shu–Tian](#target-gz-8-explicit-gross-zagier-formula), [Admissible orders and the test-vector line V(π, χ)](#target-gz-8-admissible-order-test-vector), [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number), [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, [Admissible toric order](#target-gz-4-admissible-toric-order), [Nonzero toric test vectors](#target-gz-4-toric-test-vectors), `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`.

**Acceptance.**

- For F = ℚ, A = E and B = M₂(ℚ) this is the Gross–Zagier criterion y_K non-torsion ⟺ L'(E/K, 1) ≠ 0.
- The integer m clearing the Hodge denominator scales y by m and does not affect non-torsion.

**Sources.**

- [cai-shu-tian-2014](#source-cai-shu-tian-2014), §1.2, Special case 1, p. 7. The formula for the trace point at an admissible level.
- [zhang-2010](#source-zhang-2010), §4.3, Theorem 4.3.1, p. 588. Corroboration: simultaneous order one for all conjugates (Tian–Zhang), which the formula plus total positivity reproves here.

<a id="target-gz-8-coefficient-identity"></a>

### 8.18 The main identity on X₀(N): heights as Fourier coefficients

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity` (theorem).

Let N > 1, K = ℚ(√D) imaginary quadratic with D odd, (D, N) = 1 and every p | N split in K, x ∈ X₀(N)(H) a Heegner point of discriminant D, c the class of (x) − (∞) in J₀(N)(H), σ ∈ Gal(H/K) ↔ 𝒜 ∈ Cl_K under the Artin map, ⟨ , ⟩ the Néron–Tate pairing over H extended Hermitian to J(H) ⊗ ℂ, u = #O_K^×/2, and Φ_𝒜 = Σ a_{m,𝒜} q^m the weight-two cusp form of Gross–Zagier IV Theorem (6.9), which satisfies L'_𝒜(f, 1) = 8π²|D|^{-1/2} (f, Φ_𝒜) for newforms f. Then for every m ≥ 1 with (m, N) = 1, ⟨c, T_m c^σ⟩ = u² a_{m,𝒜}. Moreover g_𝒜 = Σ_{m ≥ 1} ⟨c, T_m c^σ⟩ q^m is a cusp form of weight two on Γ₀(N) (Gross–Zagier V §1 p.306), so g_𝒜 − u² Φ_𝒜 is an old form, and (f, g_𝒜) = u²|D|^{1/2}/(8π²) · L'_𝒜(f, 1) for every newform f (Gross–Zagier I Theorem (6.1)–(6.2)), where L_𝒜(f, s) = Σ_{(n,DN)=1} ε(n) n^{1−2s} · Σ a_n r_𝒜(n) n^{−s}.

**Hypotheses.**

- N > 1 (N = 1 is treated separately by Gross–Zagier [18]); D odd, so D ≡ 1 mod 4 and (D, 2N) = 1; the Heegner hypothesis D ≡ β² mod 4N.
- g_𝒜 depends on the choice of the Heegner point x only through old forms; ⟨c, T_m c^σ⟩ for (m, N) = 1 does not depend on it (action of W × Gal(H/K)).
- x is built from HE.1/cm-cyclic-isogeny-pair, which assumes D_K ≠ −3, −4; for D = −3 (u = 3) the Heegner point is requested from HeegnerPointEulerSystems HE.1.

**Outline.**

1. g_𝒜 is a cusp form: 𝕋 × S₂(Γ₀(N))_ℚ → ℚ, (T, f) ↦ a₁(Tf), is perfect, so m ↦ ⟨y, T_m z⟩ is the coefficient sequence of a cusp form (classical-height-series-cuspidality).
2. Replace c^σ by d^σ, d = (x) − (0), using that (0) − (∞) is torsion (Manin–Drinfeld), and decompose ⟨c, T_m d^σ⟩ (relatively prime divisors for (m, N) = 1, N > 1) into local heights: archimedean contribution from Chapter II Propositions (4.2) and (5.8) (GZ.7), finite contributions from Chapter III Propositions (9.2), (9.7) and (9.11) (GZ.7).
3. Rewrite both through Chapter IV Proposition (4.6) (the Fourier coefficients of the holomorphic projection of the derivative of the Rankin kernel, GZ.6) and add: ⟨c, T_m c^σ⟩ = u² a_{m,𝒜} for (m, N) = 1.
4. Two cusp forms whose m-th coefficients agree for (m, N) = 1 differ by an old form, which has the same Petersson product with every newform; use L'_𝒜(f, 1) = 8π² u^{-2} |D|^{-1/2} (f, g_𝒜).

**Dependencies:** [Projected Rankin derivative cusp form](#target-gz-6-classical-projected-derivative-cuspform), [Projected Rankin derivative coefficients](#target-gz-6-classical-projected-derivative-coefficients), [Hecke height-series cuspidality](#target-gz-6-classical-height-series-cuspidality), [Prime-to-level newform detection](#target-gz-6-classical-prime-to-level-detection), [Total archimedean CM formula](#target-gz-7-classical-total-archimedean-formula), [Total finite CM height formula](#target-gz-7-classical-finite-height-sum), `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `mathlib:CuspForm`, `mathlib:CongruenceSubgroup.Gamma0`, `tauceti:UpperHalfPlane.peterssonInner`, `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`, `tauceti:CuspForm.peterssonInnerCosets`, `tauceti:TauCeti.cuspFormsOld`, `tauceti:TauCeti.cuspFormsNew`, `tauceti:TauCeti.isCompl_cuspFormsOld_cuspFormsNew`, `tauceti:HeckeRing.GL2.Newform`, `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq`, `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- The identity is between coefficients with (m, N) = 1 only; a statement for all m would be false because g_𝒜 depends on x through old forms.
- Gross–Zagier V §3 announces the indefinite quaternionic analogue (the coefficients a_{m,𝒜} are a fixed multiple of ⟨x, T_m x^σ⟩ on Pic(X)); in this packet that case is the specialisation of the Yuan–Zhang–Zhang formula (general-quaternionic-gross-zagier-identity) to F = ℚ, not a separate theorem.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), Chapter I §6, Theorem (6.1)–(6.2), p. 230. The main identity.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter V §1, p. 307. The coefficient identity and its proof by adding the archimedean and finite local heights.

<a id="target-gz-8-derivative-corollaries"></a>

### 8.19 Corollaries on derivatives: positivity and Galois invariance

**Target:** `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries` (theorem).

Under the hypotheses of the Gross–Zagier formula on X₀(N): (a) for every newform f ∈ S₂(Γ₀(N)) and every character χ of Gal(H/K), L'(f, χ, 1) ≥ 0; (b) either all conjugates L(f^α, χ^α, s), α ∈ Gal(ℚ̄/ℚ), have a simple zero at s = 1, or all have a zero of order ≥ 3; (c) for every newform f and α, ord_{s=1} L(f, s) = 0 iff ord_{s=1} L(f^α, s) = 0, hence also ≥ 2 iff ≥ 2 when the root number w(f) = +1; and if there is an imaginary quadratic K with the Heegner hypothesis, D odd and L(f ⊗ ε_K, 1) ≠ 0 (which forces w(f) = −1, so all orders are odd), then ord_{s=1} L(f, s) = 1 iff ord_{s=1} L(f^α, s) = 1, and ord ≥ 3 iff ord ≥ 3. (Gross–Zagier's '≥ 3' line for w(f) = +1 is not claimed; source issue E91.)

**Hypotheses.**

- (a)–(b): the Heegner hypothesis and D odd, as in coefficient-identity; the order-one part of (c) takes as a hypothesis an imaginary quadratic K with the Heegner hypothesis and L(f ⊗ ε_K, 1) ≠ 0 (such a K forces w(f) = −1, and Waldspurger's theorem provides one when w(f) = −1; its choice belongs to RankZeroOneBSD BSD.2 and is not planned here).
- Galois conjugates are taken on the coefficients of f and the values of χ.

**Outline.**

1. (a) L'(f, χ, 1) = 8π²(f, f)/(h u² |D|^{1/2}) ĥ(c_{χ,f}); here (f, f) > 0 for f ≠ 0 (CuspForm.peterssonInnerCosets_self_re_nonneg, _self_im and _self_eq_zero: a nonnegative real, zero only at f = 0) and the Néron–Tate pairing is positive definite.
2. (b) ord_{s=1} L(f^α, χ^α, s) is odd by the functional equation (sign −1); L'(f^α, χ^α, 1) = 0 iff c_{χ^α, f^α} = 0, and c_{χ^α, f^α} = (c_{χ,f})^α, so all vanish together.
3. Order zero: L(f, 1)/Ω_f is algebraic and Galois-equivariant (Shimura), so L(f, 1) = 0 iff L(f^α, 1) = 0; with equal root numbers this also gives ≥ 2 for w(f) = +1.
4. Order one (w(f) = −1): with K as in (c), L(f^α ⊗ ε_K, 1) ≠ 0 for all α by the same algebraicity applied to f ⊗ ε_K; then ord L(f^α, s) = ord L(f^α/K, s) and (b) with χ = 1 gives simultaneous simple zeros; odd parity turns ≥ 2 into ≥ 3.

**Dependencies:** [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`, `tauceti:CuspForm.peterssonInnerCosets_self_eq_zero`, `ModularSymbolsPadicLFunctions:L1/critical-value-algebraicity`, `tauceti:CuspForm.peterssonInnerCosets_self_re_nonneg`, `tauceti:CuspForm.peterssonInnerCosets_self_im`.

**Acceptance.**

- (a) is what the Riemann hypothesis predicts for the real function L(f, χ, s) on the real axis.
- Agreement with the χ = 1 part of nonvanishing-criterion over a totally real field.

**Sources.**

- [gross-zagier-1986](#source-gross-zagier-1986), Chapter V §1, Corollaries (1.1)–(1.2), pp. 308–309. Positivity.
- [gross-zagier-1986](#source-gross-zagier-1986), Chapter V §1, Corollary (1.3), p. 309. Galois invariance of low orders of vanishing.

**Coverage:** planned. The following boundaries remain:

- Verify the YZZ projector reduction against the book (unavailable) and supply arbitrary-character Hermitian positivity from GZ.1.
- Certify the GZ.1, GZ.4 and GZ.5 contracts (Mordell–Weil descent, CST local β-factors, CST Proposition 2.1) and the Tau Ceti Atkin–Lehner and Galois-conjugation exports.
- Replace the documented algebraic fragments by the missing arithmetic signatures and geometric tests once those carrier types exist.

<a id="layer-9"></a>

## Layer 9: The split ordinary p-adic logarithm/toric formula

**Atlas planets:** BDP p-adic L-function; Brooks's quaternionic p-adic L-function; BDP p-adic Gross–Zagier formula; Brooks's p-adic Gross–Zagier formula.

**Examples.**

- The central-value square adapter sends root 1+T and unit 1 to 1+2T+T². Scaling the root by c scales the series by c².
- At p=5 the factor (1+p−a_p)/p is 1 for a_p=1 and 2 for a_p=−4. At p=1,a_p=2 it vanishes, explaining the p>1 boundary.
- Ô^ur has an infinite residue field; a Weierstrass statement assuming finite residue field cannot be invoked for it.

<a id="target-gz-9-petersson-norm-ratio"></a>

### 9.1 The ratio α(f, f_B) of Petersson norms

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio` (definition).

Let f ∈ S₂(Γ₀(N)) be a newform, N = N⁺N⁻ with N⁻ a squarefree product of an even number of primes, B the indefinite quaternion algebra over ℚ of discriminant N⁻, O_{B,N⁺} an Eichler order of level N⁺ and Γ₀^B(N⁺) its norm-one units. Let f_B be the weight-two cusp form on Γ₀^B(N⁺)\ℍ with the Hecke eigenvalues of f at all ℓ ∤ N⁻ (Jacquet–Langlands), normalised to be defined over ℤ(f)_(p) and nonzero modulo p. Define α(f, f_B) = ⟨f, f⟩_{Γ₀(N)} / ⟨f_B, f_B⟩_{Γ₀^B(N⁺)}, with ⟨g, g⟩_Γ = ∫_{Γ\ℍ} |g(z)|² dx dy, the weight-two Petersson norm. It is algebraic and viewed in the p-adic coefficient field L with the chosen algebraic transfer and embeddings (JSW); the stronger assertion that it lies in precisely the Hecke field needs a specified rational-structure/period comparison, and for N⁻ = 1 with f_B = f it equals 1.

**Hypotheses.**

- The normalisation of f_B (integral at p and nonzero mod p) fixes it up to a unit of ℤ(f)_(p); α(f, f_B) is therefore defined up to the square-norm of such a unit, which is how it enters the interpolation formula 'up to a p-adic unit'.
- For a weight-two form the Petersson integrand is |g(z)|² (Im z)² against the invariant measure dx dy / y², i.e. |g(z)|² dx dy; JSW §5.1 prints dx dy / y² (recorded as a misprint, E3).

**Outline.**

1. Existence and uniqueness up to scalar of f_B: global Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer R17.3) and strong multiplicity one on B^×.
2. The Petersson product target gives the analytic factorization. Algebraicity requires the distinct Harris–Kudla comparison quoted by Brooks after Theorem 8.2, p.4232; the integral rational-structure claim requires Prasanna Theorem 2.4 with its own hypotheses. Neither is exported by the present GZ.5. They are exact source/owner gaps, and the ratio remains a complex number until that comparison and an algebraic embedding are supplied.

**Dependencies:** `tauceti:UpperHalfPlane.peterssonInner`, `mathlib:CuspForm`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, [Petersson pairing as a product of Whittaker pairings](#target-gz-5-petersson-whittaker-factorization).

**Uses.**

- `JSW (5.1.a)`: α(f, f_B) divides the interpolated value
- `Brooks, Theorem 8.2 and Proposition 8.7`: α(f, f_GL2) relates the quaternionic CM sum to L(f, χ^{-1}, 0); Brooks writes α(f, f_GL2) = ⟨f_GL2, f_GL2⟩/⟨f, f⟩ with his f quaternionic, which is numerically the same ratio as α(f, f_B) here (GL₂ norm over quaternionic norm); only the argument order of the notation is reversed
- `Skinner §2.6`: the constant C(f, K) = α(f, f_GL2)^{-1}

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.peterssonRatio` | constructor | α(f, f_B) = ⟨f, f⟩_{Γ₀(N)} / ⟨f_B, f_B⟩_{Γ₀^B(N⁺)} for weight-two Petersson norms. |
| `TauCeti.GrossZagier.peterssonRatio_split` | simp | For N⁻ = 1 and f_B = f, α = 1. |
| `TauCeti.GrossZagier.peterssonRatio_smul` | relation | α(f, u f_B) = α(f, f_B) / \|u\|². |
| `TauCeti.GrossZagier.peterssonRatio_pos` | other | α(f, f_B) > 0. |

**Checks.**

- `TauCeti.GrossZagier.peterssonRatio_self` (degenerate): α(f, f) = 1 when the quaternion algebra is split (N⁻ = 1).
- `TauCeti.GrossZagier.peterssonRatio_scale_two` (computation): Replacing f_B by 2 f_B multiplies α by 1/4.
- `TauCeti.GrossZagier.peterssonRatio_eq_peterssonInner` (compatibility): The numerator is Tau Ceti's peterssonInner 2 D f f for a fundamental domain D of Γ₀(N).
- `TauCeti.GrossZagier.peterssonRatio_not_dxdy_over_ysq` (non-example): The integral of |g|² against dx dy / y² is not Γ-invariant for weight two (it changes by |cz + d|⁴ under γ), so it does not define the norm.

**Acceptance.**

- N⁻ = 1: B = M₂(ℚ), f_B = f and α = 1, so JSW (5.1.a) reduces to BDP's normalisation.
- Scaling f_B by u ∈ ℤ(f)_(p)^× divides α by |u|².

**Sources.**

- [jsw-2017](#source-jsw-2017), §5.1, list after (5.1.a), p. 32. The ratio and its rationality.
- [brooks-2015](#source-brooks-2015), §8.2, after Theorem 8.2, p. 4232. Brooks's notation α(f, f_GL2) for the same ratio, and its rationality.

<a id="target-gz-9-bdp-p-adic-l-function"></a>

### 9.2 The BDP anticyclotomic p-adic L-function in weight two

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function` (definition).

Let f ∈ S₂(Γ₀(N)) be a newform, K imaginary quadratic of discriminant −D_K with (gen-H) for N = N⁺N⁻, p ≥ 3, p ∤ N (good) and p = v v̄ split in K, v fixed by ι_p. Let Γ = Gal(K_∞/K) be the anticyclotomic ℤ_p-extension, O ⊂ L the coefficients (L containing the Hecke field and the Hilbert class field of K), R the completion of the ring of integers of L·ℚ_p^ur, and Λ_R = R⟦Γ⟧. Let Σ_cc be the set of continuous ψ : G_K → ℚ̄_p^× factoring through Γ with ψ^τ = ψ^{-1}, crystalline at v and v̄, of Hodge–Tate weights −n < 0 at v and n at v̄, and ψ^alg its algebraic Hecke character (infinity type (n, −n)). The BDP p-adic L-function is the unique L_p(f) ∈ Λ_R such that for all ψ ∈ Σ_cc with n ≡ 0 mod (p − 1): ψ(L_p(f)) = E_v̄(f, ψ)² · t_K · C(f, ψ) / (α(f, f_B) W(f, ψ)) · Ω_p^{4n} · L(f, ψ^alg, 1) / Ω_∞^{4n}, where E_v̄(f, ψ) = 1 − ψ^alg(ϖ_v̄) a_p p^{-1} + ψ^alg(ϖ_v̄)² p^{-1}, t_K is a power of 2, C(f, ψ) = ¼ π^{2n−1} Γ(n) Γ(n + 1) w_K √D_K ∏_{ℓ|N⁻} (ℓ − 1)/(ℓ + 1), W(f, ψ) is Brooks's constant W(f, χ) of absolute value one (defined before his Proposition 8.5, p. 4235, from the auxiliary ideal b and scalar b_N of Proposition 8.3 and the norm-one scalar W_f following Lemma 8.4), transported by χ^{-1} = ψ^alg|·| (the exact transported expression, and its comparison with the expression displayed by JSW, are part of the normalization gap), α(f, f_B) is the Petersson ratio, Ω_p ∈ R^×, Ω_∞ ∈ ℂ^× are the p-adic and complex CM periods, and L(f, ψ^alg, s) = L(π_K × ψ^alg, s − 1/2). The trivial character (the BDP point) is not in Σ_cc: L_p(f, 1) lies outside the interpolation range.

**Hypotheses.**

- (gen-H): N⁺ divisible only by split or ramified primes, N⁻ a squarefree product of an even number of inert primes; (good) p ∤ N; (split) p = v v̄. The standing JSW convention also requires p to be odd. Each prime dividing (N, D_K) divides N exactly once (Brooks §2.1; Castella–Hsieh (Heeg′)), and when such primes occur Brooks's factor 2^{#S_f} must be included next to t_K, which depends only on K; JSW itself states existence under (H), and BDP's N⁻ = 1 construction also assumes D_K odd.
- Ordinarity of f at p is not assumed: the CM points are ordinary because p splits in K, and L_p(f) is a bounded measure even for supersingular f.
- Uniqueness uses that the n ≡ 0 mod (p − 1) characters give infinitely many distinct values ψ(γ) − 1 in the open unit disc of ℂ_p (inside the maximal ideal of R itself for n ≡ 0 mod (p − 1)p^k, where p^k is the index of the image of 1 + pℤ_p in Γ), and a nonzero element of R⟦T⟧ has finitely many zeros there (Weierstrass preparation).
- The incomplete L_p^Σ(f) = L_p(f) · ∏_{w ∈ Σ} P_w(ε^{-1}Ψ^{-1}(Frob_w)) for a finite set Σ of places not above p interpolates the incomplete L-values; at an inert w = (ℓ) the factor (1 − a_ℓ ℓ^{-1} + ℓ^{-1})(1 + a_ℓ ℓ^{-1} + ℓ^{-1}) can raise the μ-invariant.
- Construct the linear root first: L3h in the GL₂ case, the integral CM-moment measure of quaternionic-bdp-construction in the quaternionic case. The character/period transport fixes its central-value normalization: step 3 computes the unit u by comparing Castella–Hsieh Proposition 3.8 (N⁻ = 1) or the quaternionic CM formula (N⁻ > 1) with the right side of (5.1.a). bdp-square-root-comparison only draws consequences from the resulting identity L_p(f) = u·root² and is not used to prove the interpolation property.

**Outline.**

1. Fix L0 character avatars, the tame branch, L3 periods and the coefficient ring. For N⁻=1 import the already constructed L3h root; for N⁻>1 import the bounded quaternionic root from integral CM moment measures.
2. Apply the specified Λ-unit normalization and square; this is the algebraic constructor bdpLFunction(root,normalization). Construction does not call interpolation or a comparison theorem that assumes L_p already exists.
3. Evaluate the supplied roots and compare the constants to JSW (5.1.a): pass from ψ^alg to Castella–Hsieh’s ψ₀φ (N⁻ = 1) or Brooks’s χ (N⁻ > 1), represent φ(𝔑^{-1}) by a group-like unit and show that the remaining scalar lies in R^×. This fixes u and is the normalization gap; bdp-square-root-comparison restates the computation and does not redo it.
4. Use the requested complete-DVR Weierstrass theorem to prove uniqueness from infinitely many distinct interpolation characters. The compact suggested file records the algebraic square and evaluation only; it states no analytic uniqueness theorem. L4/nonzero-power-series-factorization assumes a finite residue field, so the extension to R=Ô^ur is required explicitly.

**Dependencies:** [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`, `PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization`, `PadicMeasuresIwasawaAlgebras:L1`, `AutomorphicPadicLFunctions:L0`, `AutomorphicPadicLFunctions:L3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `mathlib:PowerSeries`, `mathlib:PowerSeries.eval₂`, `mathlib:IsTopologicallyNilpotent`, `mathlib:ContinuousMonoidHom`, `AutomorphicPadicLFunctions:L3h`, [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), `PadicMeasuresIwasawaAlgebras:L4`, `AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization`, `AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization`.

**Uses.**

- `JSW §5.1.5, Propositions 5.1.6–5.1.7`: the value L_p(f, 1) at the BDP point is the square of a logarithm of a Heegner point
- `HeegnerPointEulerSystems:HE.8b`: char(X_Gr)Λ^ur = (L_BDP²) in BCGS's square-root convention, whose square is this function
- `RankZeroOneBSD:BSD.6a`: the JSW supersingular branch consumes the good-reduction formula for not necessarily ordinary f
- `RankZeroOneBSD:BSD.7a`: the Eisenstein branch compares the BDP function with Katz-type character p-adic L-functions
- `AutomorphicCongruences:L5a`: the BCS two-variable comparison is checked against this one-variable specialisation
- `Skinner 2020, §2.6`: L_p^S(f, 1) ≐ (log_ω P_K(f))² and P_K(f) ≠ 0 iff L_p^S(f, 1) ≠ 0
- [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality): membership of the imprimitive function in O^ur⟦Γ⟧

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.bdpLFunction` | constructor | For an already constructed linear root in Λ_R and a specified Λ_R-unit u, return u·root². The GL₂ root is imported from L3h and the quaternionic root from the CM moment construction. Identifying u with JSW normalization is separate. |
| `TauCeti.GrossZagier.bdpLFunction_interpolation` | characterisation | For ψ ∈ Σ_cc with n ≡ 0 mod (p − 1), ψ(L_p(f)) is given by JSW (5.1.a). |
| `TauCeti.GrossZagier.bdpLFunction_eq_of_interpolation` | extensionality | Two elements of R⟦T⟧ agreeing at infinitely many points ψ(γ) − 1 of the maximal ideal are equal. |
| `TauCeti.GrossZagier.bdpLFunction_eval` | data | A convergent character-evaluation ring map sends u·root² to ev(u)·ev(root)². |
| `TauCeti.GrossZagier.bdpLFunction_eval_one` | simp | The value at the trivial character is the constant coefficient: L_p(f, 1) = constantCoeff L_p(f). |
| `TauCeti.GrossZagier.bdpLFunction_incomplete` | data | L_p^Σ(f) = L_p(f) · ∏_{w ∈ Σ} P_w(ε^{-1}Ψ^{-1}(Frob_w)). |
| `TauCeti.GrossZagier.bdpLFunction_period_change` | relation | Replacing Ω_p by u Ω_p with u ∈ ℤ_p^× (the ambiguity of the formal-group trivialisation, BDP Remark 5.8; for a general unit of R the rescaled values need not come from an element of Λ_R) multiplies ψ(L_p(f)) by u^{4n} for ψ of weight (−n, n). |
| `TauCeti.GrossZagier.bdpLFunction_eq_sq` | compatibility | The adapter equals u·root² for the supplied root and unit; the arithmetic identification of that unit is the square-root-comparison node. |
| `TauCeti.GrossZagier.bdpIncomplete` | data | Multiply the central-value series by the specified finite collection of local Euler-factor series. |

**Checks.**

- `TauCeti.GrossZagier.bdp_square_linear_coefficient` (computation): For normalization unit 1 and supplied root 1+T, the central-value adapter gives 1+2T+T². The linear coefficient is 2, so replacing the square by the root fails this test.
- `TauCeti.GrossZagier.bdp_square_scaling` (compatibility): Replacing the supplied linear root by c times that root multiplies the central-value series by c², with the normalization unit held fixed.
- `TauCeti.GrossZagier.bdp_square_constant_unit` (characterisation): At the trivial character the value is u(0) times root(0)². Changing the normalization unit changes this value; it cannot be silently dropped.
- `TauCeti.GrossZagier.bdpLFunction_eval_zero` (degenerate): Evaluation at T = 0 (the trivial character) is the constant coefficient of the power series.
- `TauCeti.GrossZagier.bdpLFunction_unique` (characterisation): If F ∈ R⟦T⟧ vanishes at infinitely many distinct points of the maximal ideal then F = 0; so the interpolation property determines L_p(f).
- `TauCeti.GrossZagier.bdpLFunction_euler_11a1` (computation): For the minimal model y²+y=x³−x²−10x−20 of 11a1, #E(𝔽₅)=5 and #E(𝔽₂₃)=25. Thus a₅=1 and E₅=1, while a₂₃=−1 and E₂₃=25/23. The curve y²=x³+3x over 𝔽₅ has ten points, hence a₅=−4 and E₅=2, a 5-adic unit although #E(𝔽₅) ≠ 5; and E₂₃ = 25/23 for 11a1 shows that a good-reduction Euler factor need not be a p-adic unit (or even p-integral). These are point-count tests; identifying the modular form and split CM data requires their owners.
- `TauCeti.GrossZagier.bdpLFunction_trivial_not_interpolated` (non-example): The trivial character has Hodge–Tate weight n = 0 and is not in Σ_cc (n > 0, n ≡ 0 mod p − 1): L_p(f, 1) is not an interpolated value. A function interpolating at n = 0, such as the cyclotomic Mazur–Tate–Teitelbaum function at its critical twists, is a different object (and unbounded for supersingular f, whereas L_p(f) is bounded).

**Acceptance.**

- Compatibility with BDP's normalisation for N⁻ = 1: α = 1, and L(f, ψ^alg, 1) = L(f, χ^{-1}, 0) for χ^{-1} = ψ^alg|·|, where χ has BDP/Brooks infinity type (2 + j, −j) with j = n − 1 (so Γ(j + 1)Γ(k + j) = Γ(n)Γ(n + 1) and Ω^{2(k+2j)} = Ω^{4n}; JSW Remark 5.1.1(b) prints j = n + 1, see E87).
- Supersingular test: for a_p = 0 the element still lies in Λ_R (bounded), unlike the cyclotomic p-adic L-function of a supersingular form.
- The trivial character is not interpolated: L(f, K, 1) = 0 under (gen-H) while L_p(f, 1) need not vanish.

**Sources.**

- [jsw-2017](#source-jsw-2017), §5.1, display (5.1.a), p. 32. The definition by interpolation.
- [jsw-2017](#source-jsw-2017), §5.1, Remark 5.1.1(c), p. 32. Measure versus continuous function.
- [bdp-2013](#source-bdp-2013), §5.2, (5.2.3) and Proposition 5.10, pp. 1134–1135. BDP's construction for N⁻ = 1.
- [skinner-2020](#source-skinner-2020), Published §2.6, p. 342 (preprint p. 13 uses O[[Γ]]). Published coefficient ring; supersedes the preprint O[[Γ]] in this citation.

<a id="target-gz-9-bdp-square-root-comparison"></a>

### 9.3 The BDP function is the square of the toric square-root distribution

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison` (comparison).

Assume N⁻ = 1 in bdp-p-adic-l-function, so the Heegner hypothesis holds with N⁺ = N. Let ψ₀ be an anticyclotomic Hecke character of infinity type (1, −1) whose conductor is a power of p (Castella–Hsieh's c_o = 1, so that ψ₀φ is unramified outside p like the characters of Γ), and L_{p,ψ₀}(f) the Castella–Hsieh measure on Γ̃ = Gal(K_{p^∞}/K), the F = ℚ, n⁻ = 1 specialisation of AutomorphicPadicLFunctions L3h's Hsieh distribution. For every p-adic avatar φ̂ of an anticyclotomic character of infinity type (m, −m), m ≥ 0, and p-power conductor, (L_{p,ψ₀}(f)(φ̂) / Ω_p^{2+2m})² = L^alg(1/2, π_K ⊗ ψ₀φ) · e_p(f, ψ₀φ) · φ(𝔑^{-1}) · 2^{#A(ψ₀)+3} ε(f) u_K² √D_K (Castella–Hsieh Prop. 3.8 with c_o = 1). Comparing with JSW (5.1.a), the restriction of L_p(f) to the characters of Γ equals L_{p,ψ₀}(f)², transported to Γ by twisting by ψ̂₀^{-1}, times an explicit unit of Λ_R, whose character evaluations include the character-dependent factor φ(𝔑^{-1}) and the scalar factors t_K, w_K, u_K, ε(f) and 2; the existence and integrality of this comparison unit require the normalization check recorded below. Consequently: L_p(f) is a square in Λ_R up to a unit; its μ-invariant is even and its λ-invariant is even; and the value at the BDP point is the square of an element linear in the Heegner-point logarithm. The square-root distribution, not L_p(f), is what BCGS's 'L_BDP' denotes.

**Hypotheses.**

- N⁻ = 1, i.e. no inert prime divides N; Castella–Hsieh's (Heeg′) then requires their N_f⁻ (the part of N at non-split primes, here the ramified ones) to be squarefree; for N⁻ > 1 Hsieh's GL₂ toric period vanishes because the type-two characters need B ramified at the inert primes of N⁻ (Saito–Tunnell), and Brooks's quaternionic construction replaces it.
- The comparison is an identity of measures, proved on the Zariski-dense set of characters where both interpolation formulas hold.
- Even μ and λ conclusions apply to a nonzero power series, with μ and λ defined over the specified complete discrete valuation ring. For μ the twisted root must have coefficients in R: take L large enough to contain the values of ψ̂₀ (λ-parity holds regardless).
- Castella–Hsieh Proposition 3.8 assumes (ST) and (c_o,pN⁺)=1 as well as (Heeg′); (ST) is vacuous when (N, D_K) = 1; otherwise ψ₀ (with c_o = 1) must be chosen to satisfy it, and that choice is part of the normalization gap. The comparison unit is a target subject to the explicit normalization gap, not a certified supplier export.

**Outline.**

1. By construction (bdp-p-adic-l-function, step 3) L_p(f) = u·g², where g is the image in Λ_R(Γ) of the twisted L3h root and u ∈ Λ_R^× is the unit fixed there by comparing Castella–Hsieh Proposition 3.8 with the right side of (5.1.a) at ψ ∈ Σ_cc, n ≡ 0 mod (p − 1); the next two steps record that comparison, and nothing here re-derives (5.1.a) from the identity.
2. At such ψ pass between JSW's ψ^alg (with χ^{-1} = ψ^alg |·|_{𝔸_K}, JSW Remark 5.1.1(b)) and Castella–Hsieh's ψ₀φ of infinity type (1 + m, −1 − m), and compare the constants of JSW (5.1.a) with those of Castella–Hsieh Proposition 3.8 (both come from the explicit Waldspurger formula of Hsieh Theorem 3.14).
3. The character-dependent factor φ(𝔑^{-1}) must be represented by a group-like unit of Λ_R after the character/twist transport; it is not a fixed scalar in R. Compute the remaining scalar ratio and prove it lies in R^× before deducing equality up to a Λ_R-unit. This calculation is still a gap.

**Dependencies:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L0`, [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L4`.

**Acceptance.**

- Square versus square root: at a simple zero of the square-root distribution L_p(f) has a double zero; a wrong identification would make the λ-invariant odd.
- BCGS/HE.8b check: char(X_Gr) Λ^ur = (L_BDP)² with L_BDP the square-root distribution, i.e. the characteristic ideal is generated by L_p(f) itself up to a unit.

**Sources.**

- [castella-hsieh-2018](#source-castella-hsieh-2018), §3.3, Definition 3.7, p. 13. The square-root measure.
- [castella-hsieh-2018](#source-castella-hsieh-2018), §3.3, Proposition 3.8, p. 13. The square interpolates the central values.

<a id="target-gz-9-quaternionic-bdp-construction"></a>

### 9.4 Brooks's quaternionic p-adic L-function

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction` (construction).

Assume (gen-H) with N⁻ > 1, (good) and (split). Let X = X_{N⁺,N⁻} be the Shimura curve of false elliptic curves with K-level structure, f_B the Jacquet–Langlands form of f normalised as in petersson-norm-ratio, A a false elliptic curve with normalised CM by O_K and level structure t, ω a nonvanishing invariant differential defined over the Hilbert class field, Ω ∈ ℂ^× and Ω_p ∈ ℂ_p^× its complex and Serre–Tate p-adic periods. For a central critical character χ of type two (infinity type (k + j, −j), j ≥ 0, k = 2) put L_p(f, χ) = Ω_p^{2(k+2j)} (1 − χ^{-1}(p̄) a_p + χ^{-2}(p̄) ε_f(p) p^{k−1})² L^alg(f, χ^{-1}, 0), where L^alg(f, χ^{-1}, 0) = α(f, f_GL2)^{-1} W(f, χ)^{-1} C(f, χ) L(f, χ^{-1}, 0) / Ω^{2(k+2j)}. Then L_p(f, χ) = (Σ_{[a] ∈ Cl(O_K)} χ_j^{-1}(a) · θ^j f_B^♭(a ⋆ (A, t, ω̂)))², where θ is the Atkin–Serre operator in Serre–Tate coordinates, χ_j is the character of infinity type (k + 2j, 0) with χ_j^{-1}(a) = χ^{-1}(a)Na^{-j} (Brooks Proposition 8.5), and f_B^♭ = f_B|(VU − UV) the p-depletion; the function χ ↦ L_p(f, χ) extends continuously to the completion Σ̂_cc, and, after the explicit normalization recorded below (including JSW's power of 2, t_K, which Burungale attributes to the sum (5.8)), is given by a measure in Λ_R satisfying JSW (5.1.a). Construct the bounded measure first: at each ordinary CM point the integral Serre–Tate expansion of f_B^♭ is the Amice transform of a Z_p-measure with binomial moments binom(d,m)f_B^♭ evaluated at that point (Burungale Lemma 5.5). The p-depleted local measure is supported on ℤ_p^×; Burungale's Lemma 5.5 places it in 1 + pℤ_p, which matches after the Teichmüller folding of his (5.12). Twist it by the local component at v of the fixed type-two base character, which shifts the moment index by one (x ↦ x^{-1} in JSW’s normalisation of the reciprocity chart; with the inverse chart, compose with inversion), and push it forward along the fixed reciprocity chart to Γ, which is trivial on μ_{p−1} and so performs that folding. At a Γ-character of weight n with (p − 1) | n the twisted, folded moment is θ^j f_B^♭ with j = n − 1; without the twist it would be θ^n f_B^♭, and the right values would occur only for n ≡ 1 mod (p − 1). Then translate by the ideal-class Artin elements, and sum with the fixed tame-character weights as in (5.8). Squaring this linear root gives the central-value function. The compact series adapter starts with an already supplied root. R18.2 supplies the model and P4 supplies its two formal Poincaré trivializations; the scalar automorphic-line and Serre–Tate moment comparison is a separate gap. Bounded-measure and Iwasawa operations are L1 inputs, while Amice surjectivity over Ô^ur is the exact L2 extension requested here. Normalization between Burungale’s tame branch and Brooks’s χ-family is required explicitly, rather than inferred from continuity.

**Hypotheses.**

- k = 2 and trivial nebentypus; χ ranges over type-two central critical characters, where the sign of L(f, χ^{-1}, s) is +1 (an even number of primes divide N⁻).
- The Serre–Tate period Ω_p depends on a basis of the Tate module of the reduction of A; changing it by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^{2(k+2j)}.
- That the continuous function is a measure is Burungale's refinement (JSW Remark 5.1.1(c)); its integral structure is part of this construction. Burungale states §5.2 under his (H1)–(H3) (N squarefree and prime to D_K); for ramified primes in N⁺ the local moment construction must be re-checked.

**Outline.**

1. Import the p-integral differential and its ordinary-CM Serre–Tate expansion from R17.3/R18.2/L3; p-depletion makes the local measure supported on ℤ_p^× (Burungale's Lemma 5.5 places it in 1 + pℤ_p, which matches after the Teichmüller folding of his (5.12)).
2. Use the integral binomial-moment/Amice correspondence from PadicMeasuresIwasawaAlgebras L1 to obtain each bounded local measure.
3. Twist each local measure by the local component of the fixed type-two base character (a shift of the moment index by one), push forward along the fixed reciprocity chart (which folds the Teichmüller classes), translate by ideal-class elements, and take the finite weighted sum (Burungale (5.8)); convolution-square produces a bounded central-value measure. This construction precedes interpolation.
4. Evaluate moments at algebraic characters and identify θ^j f_B^♭. Brooks Propositions 8.5–8.9 and the CM comparison give the displayed squared Waldspurger interpolation.
5. Brooks Proposition 8.10 then supplies the continuity comparison on the completed tame family. It is a consequence/comparison, not the boundedness argument.
6. Transport the fixed tame branch to Γ using L0; specify the period and constant normalization in the comparison gap. Do not assume that a character of Pic(O_c) factors through Γ.
7. Translation by a group-like series is an R-linear operation on Amice transforms, not a unital algebra endomorphism. Scalar linearity gives quadratic scaling of the convolution square.

**Dependencies:** [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `AutomorphicPadicLFunctions:L3`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `PadicMeasuresIwasawaAlgebras:L1`, `AutomorphicPadicLFunctions:L0`, [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula), `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`, `mathlib:AbstractMeasure.amiceTransform`, `mathlib:AbstractMeasure.injective_amiceTransform`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `PadicMeasuresIwasawaAlgebras:L2`, `AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization`, `AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization`.

**Uses.**

- `JSW §5.1`: the existence of L_p(f) ∈ Λ_R with (5.1.a) when N⁻ > 1
- `Brooks Propositions 8.12–8.13`: its value at the BDP point is the square of a logarithm
- `RankZeroOneBSD:BSD.6a`: the quaternionic logarithm comparison of the JSW branch

**API.** Names below are proposed interfaces, not existing declarations.

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GrossZagier.quaternionicBDP` | constructor | The convolution square of the translated finite sum of integral CM moment measures, represented in R⟦T⟧; supplied geometric CM transforms are inputs, not arbitrary scalar CM values. |
| `TauCeti.GrossZagier.quaternionicBDP_eq_sq_sum` | characterisation | L_p(f, χ) = (Σ_{[a]} χ_j^{-1}(a) θ^j f_B^♭(a ⋆ (A, t, ω̂)))² (Brooks Proposition 8.9). |
| `TauCeti.GrossZagier.quaternionicBDP_continuous` | other | χ ↦ L_p(f, χ) extends continuously to Σ̂_cc (Brooks Proposition 8.10). |
| `TauCeti.GrossZagier.quaternionicBDP_period` | relation | Changing Ω_p by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^{2(k+2j)}. |
| `TauCeti.GrossZagier.quaternionicBDP_measure` | compatibility | The integral local transforms define bounded measures via Amice; transport and finite sum commute with character integration, and convolution-square evaluates to the squared CM sum. The geometric moment identity and tame/Γ normalization are separate requested inputs. |
| `TauCeti.GrossZagier.quaternionicBDP_congr` | extensionality | Pointwise equality of the whole local CM Amice series yields equality of the squared measures; equality only at the trivial character is insufficient. |
| `TauCeti.GrossZagier.quaternionicRoot` | data | The linear series Σ_a C(weight(a))·translate_a(CMSeries_a), with CMSeries_a the integral Amice transform and translate_a the transported reciprocity action. |

**Checks.**

- `TauCeti.GrossZagier.quaternionicBDP_sq_sum_one_class` (computation): For class number one the sum has one term, so L_p(f, χ) = (θ^j f_B^♭(A, t, ω̂))².
- `TauCeti.GrossZagier.quaternionicBDP_zero_form` (degenerate): For f_B = 0 the function is identically zero (the construction is quadratic in f_B).
- `TauCeti.GrossZagier.quaternionicBDP_scale` (characterisation): Replacing every local CM Amice transform by c times that transform multiplies the squared measure by c². For real c=2 the Petersson ratio is divided by 4, so both sides of the interpolation formula are multiplied by 4.
- `TauCeti.GrossZagier.quaternionicBDP_is_square` (non-example): The value is a square in R; the unsquared CM sum (the square-root convention) is a different object, which scales by c rather than c² when f_B is replaced by c f_B.

**Acceptance.**

- For N⁻ = 1 the same construction with q-expansions is BDP §5.2, so the two agree on overlapping data.
- Changing the trivialisation of the formal group by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^{2(k+2j)} (BDP Remark 5.8).

**Sources.**

- [brooks-2015](#source-brooks-2015), §8.4, definition before Proposition 8.9, p. 4237. The definition.
- [brooks-2015](#source-brooks-2015), §8.5, Proposition 8.10, p. 4237. Continuity.
- [jsw-2017](#source-jsw-2017), §5.1, p. 31. The measure in the quaternionic case.
- [burungale-2015](#source-burungale-2015), §5.2 pp.27–29, Lemma 5.5 and (5.8). Integral Serre–Tate moments, support and translated sum: actual boundedness construction.

<a id="target-gz-9-quaternionic-cm-waldspurger-formula"></a>

### 9.5 The Waldspurger formula at CM points of X_{N⁺,N⁻}

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula` (theorem).

Let χ be an unramified Hecke character of K of infinity type (k + j, −j), j ≥ 0, whose central character is the nebentypus of f, and let (A, P, ω_ℂ) be the CM triple supplied independently by R18.1, HE.1 and the CM-period interface L3. Then C(f, χ) L(f, χ^{-1}, 0) = α(f, f_GL2) W(f, χ) (Σ_{a ∈ Cl(O_K)} χ^{-1}(a) Na^{-j} (Θ^j_∞ f_B)(a ⋆ (A, P, ω_ℂ)))², with C(f, χ) = ¼ π^{k+2j−1} Γ(j + 1) Γ(k + j) w_K |d_K|^{1/2} 2^{#S_f} ∏_{ℓ | N⁻} (ℓ − 1)/(ℓ + 1), S_f the primes ramified in K dividing N⁺ but not the conductor of the nebentypus, and W(f, χ) of absolute value one. Consequently L^alg(f, χ^{-1}, 0) is algebraic and equals the square of the CM sum of Θ^j_∞ f_B at the algebraic triple (A, t, ω) (Brooks Proposition 8.7).

**Hypotheses.**

- χ unramified, of type two; N⁻ a squarefree product of an even, nonzero number of inert primes; each prime dividing (N, d_K) divides N exactly once (Brooks §2.1). The local computations cited (BDP §4) assume d_K odd (BDP Remark 4.7); for even d_K the exact power of 2 in C(f, χ) is not covered by the cited proofs.
- The complex conjugation on CM triples is compared with an Atkin–Lehner involution (Brooks Propositions 8.3–8.5) to replace |·|² by a square; W(f, χ) records that comparison.

**Outline.**

1. Obtain the algebraic CM triple and complex period before constructing a p-adic measure. This identity provides the analytic input to that construction and does not use its output.
2. Brooks Theorem 8.2 combines Prasanna Theorem 3.2 with the BDP §4 local calculations. The general GZ.5 period identity is only the analytic framework: it does not supply this explicit indefinite-quaternionic rational-structure formula. That precise additional input is the R2 source/owner gap.
3. Brooks Proposition 8.3 and Lemma 8.4: complex conjugation of a CM triple is b ⋆ w_N applied to a rescaled triple; f^ρ ∘ w_N = W_f f.
4. Sum over Cl(O_K) to obtain Proposition 8.5, then divide by Ω^{2(k+2j)} (Proposition 8.7).

**Dependencies:** [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof), [Coherent quaternionic theta specialization](#target-gz-5-coherent-quaternionic-specialization), `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `AutomorphicPadicLFunctions:L3`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, [Petersson pairing as a product of Whittaker pairings](#target-gz-5-petersson-whittaker-factorization).

**Acceptance.**

- For N⁻ = 1 this is BDP Theorem 5.4 (with α = 1).
- Absolute values: |W(f, χ)| = 1, so the formula is consistent with the positivity of L(f, χ^{-1}, 0) up to the square.

**Sources.**

- [brooks-2015](#source-brooks-2015), §8.2, Theorem 8.2, p. 4232. The Waldspurger-type formula.
- [brooks-2015](#source-brooks-2015), §8.3, Proposition 8.5, p. 4235. The squared form.

<a id="target-gz-9-euler-factor-at-bdp-point"></a>

### 9.6 The Euler factor at the BDP point

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point` (lemma).

For a weight-two newform f with trivial nebentypus and p ∤ N, E_p(f) = 1 − a_p/p + 1/p = (1 + p − a_p)/p is nonzero, by |σ(a_p)| ≤ 2√p < p + 1 for each complex embedding. For an elliptic curve E/ℚ with good reduction at p, E_p(E) = #Ẽ(𝔽_p)/p. For elliptic curves and p ≥ 7 its p-adic valuation is 0 if a_p = 1 and −1 otherwise. At p = 5 it is 0 when a₅ = 1 or −4, and −1 otherwise; no such rational-integer dichotomy is asserted for a general Hecke field. For general f, ∏_σ (1 + p − σ(a_p)) = #Ã_f(𝔽_p) ≥ 1. For a finite-order χ prime to p the twisted factor is 1 − χ^{-1}(p̄) a_p/p + χ^{-2}(p̄)/p, obtained from Brooks/BDP at χ′ = χN of infinity type (1, 1), where χ′(p̄) = pχ(p̄).

**Hypotheses.**

- p ∤ N, so f has good reduction at p and ε_f(p) = 1.
- The Hasse bound |a_p| ≤ 2√p for elliptic curves (EllipticCurves Layer 3) and the Ramanujan–Petersson bound for weight-two newforms (AutomorphicGaloisRepresentations R19.1) give |a_p| < p + 1.

**Outline.**

1. 1 + p − a_p = #Ẽ(𝔽_p) ≥ 1 for E (the identity is a point), or > 0 by |a_p| ≤ 2√p < p + 1.
2. For elliptic curves and p ≥ 7, 1 ≤ #Ẽ(𝔽_p) ≤ p + 1 + 2√p < 2p. Hence divisibility by p occurs exactly at #Ẽ = p, and gives valuation zero. At p = 5 Hasse permits #Ẽ = 10 as well as 5; these correspond to a₅ = −4 and 1. Otherwise the numerator is prime to p and E_p has valuation −1.
3. The χ-twisted factor is the specialisation of Brooks's (1 − χ^{-1}(p̄) a_p + χ^{-2}(p̄) ε_f(p) p) at a character of infinity type (1, 1), divided by the norm.

**Dependencies:** `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `AutomorphicGaloisRepresentations:R19.1`.

**Acceptance.**

- 11a1, p = 5 (split in ℚ(√−19)): a₅ = 1, E_p = 1, a unit — p = 5 is anomalous for 11a1.
- 11a1, p = 23 (split in ℚ(√−19), since −19 ≡ 2² mod 23): a₂₃ = −1, so E_p = 25/23 has valuation −1.
- Supersingular p (a_p = 0): E_p = (1 + p)/p, never zero.
- Counterexample to the original p ≥ 5 dichotomy: y² = x³ + 3x over 𝔽₅ has affine point counts 1, 2, 2, 2, 2 for x = 0,1,2,3,4 and the point at infinity, so #E = 10, a₅ = −4, E₅ = 2 and v₅(E₅) = 0.

**Sources.**

- [jsw-2017](#source-jsw-2017), §5.1.5, Proposition 5.1.6, p. 34. The Euler factor at the BDP point.
- [brooks-2015](#source-brooks-2015), §8.6, Proposition 8.12, p. 4239. The χ-twisted factor in weight two.

<a id="target-gz-9-weight-two-abel-jacobi-is-logarithm"></a>

### 9.7 In weight two the p-adic Abel–Jacobi map is the formal logarithm

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm` (lemma).

Let C be X₀(N), X₁(N), X_{N⁺,N⁻} or Brooks's cover ℍ/Γ_{1,N⁺} of it, over a finite extension F_𝔭 of ℚ_p with p ∤ N, J its Jacobian, and ε_f the Hecke projector with ε_f Fil¹H_dR^1(C/F) = F ω_f (after choosing a coefficient field containing the eigenvalues; the full ε_f H¹_dR has dimension two). For a degree-zero divisor D on C over F_𝔭 (for instance ε_f Δ₀ for an arbitrary divisor Δ₀, which is automatically homologically trivial), the p-adic Abel–Jacobi image AJ_p(D)(ω_f) equals log_{ω_f}([D]), where for ω ∈ H⁰(J, Ω¹) = Fil¹H¹_dR the map log_ω : J(F_𝔭) → F_𝔭 is the unique locally analytic homomorphism with d log_ω = ω. On BDP's curve X₁(N) with D = ε_f(Δ_φ − ∞) this is the r = 0 case of BDP's Abel–Jacobi map (its image on X₀(N) is obtained by pushforward along X₁(N) → X₀(N), which pulls ω_f back to ω_f); a choice of base point changes AJ on C(F_𝔭) but not on Pic⁰(C).

**Hypotheses.**

- Good reduction of C at p (p ∤ N); for X_{N⁺,N⁻} the smooth model over ℤ_(p) of R18.2.
- r = 0: the generalized Kuga–Sato variety is C itself and the de Rham target is (S₂ ⊗ F)^∨ = (Fil¹H¹_dR)^∨.
- The coefficient field contains the chosen Hecke eigenvalues and the logarithm is locally analytic. Only the Fil¹ eigenspace is a line.

**Outline.**

1. For r = 0 the p-adic Abel–Jacobi map CH¹(C)₀ → (Fil¹ H¹_dR(C/F))^∨ is given by Coleman integration of holomorphic differentials (BDP §3; Brooks §7.1), and the Coleman integral of a holomorphic form along a degree-zero divisor is the logarithm of the formal group of J evaluated on its class (EffectiveDiophantineMethods ED.4/coleman-abelian-comparison and ED.4/abelian-integral; Brooks §6.4).
2. Hecke-equivariance: the projector ε_f acts compatibly on divisors and on differentials, and log_{ω_f}(ε_f x) = log_{ω_f}(x) since ε_f^* ω_f = ω_f (Brooks Lemma 7.5).

**Dependencies:** `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`, `EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison`, `EffectiveDiophantineMethods:ED.4/abelian-logarithm`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `mathlib:Module.Dual`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `EffectiveDiophantineMethods:ED.4/abelian-integral`.

**Acceptance.**

- Base-point independence: two Abel–Jacobi maps C → J differing by a translation give the same value on degree-zero divisors.
- Cusps are Eisenstein: replacing ∞ by another cusp changes D by a torsion class (Manin–Drinfeld), which log kills.

**Sources.**

- [brooks-2015](#source-brooks-2015), §6.4, p. 4224. The identification.
- [brooks-2015](#source-brooks-2015), §7, Lemma 7.5, p. 4229. The projector does not change the value.
- [bdp-2013](#source-bdp-2013), Remark 2.6 and Proposition 2.7, published p. 1063. The weight-two cycle.

<a id="target-gz-9-bdp-weight-two-heegner-formula"></a>

### 9.8 The BDP p-adic Gross–Zagier formula in weight two

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula` (theorem).

Let f ∈ S₂(Γ₀(N)) be a newform, K of odd discriminant satisfying the Heegner hypothesis in the strong form 'every prime of N splits' (BDP's Assumption 1.9 only needs a cyclic ideal of norm N), c odd and prime to N d_K, p ∤ Nc split in K, and χ a finite-order character of Pic(O_c), viewed as the central critical character χN of infinity type (1, 1) in Σ_cc^{(1)}(𝔑). Let P_a ∈ X₀(N)(H_c) be the image of BDP's CM point a ⋆ (C/O_c, t₀), i.e. the HE.1 pair attached to a^{-1}, C/a^{-1} → C/a^{-1}𝔑_c^{-1} (BDP (1.4.7)–(1.4.8), p.1054, and §5.1, p.1127); with HE.1's own indexing C/a → C/a𝔑_c^{-1} the sum below carries χ(a) in place of χ^{-1}(a). Let ω_f be the differential of f. Use BDP’s continuous p-adic L-function on the completed central-critical character family with fixed tame conductor c and finite type (c, 𝔑, 1), rather than evaluating the Γ-only measure at an arbitrary character of Pic(O_c). For this BDP function, L_p(f, χN) = (1 − χ^{-1}(p̄) a_p p^{-1} + χ^{-2}(p̄) p^{-1})² · (Σ_{[a] ∈ Pic(O_c)} χ^{-1}(a) log_{ω_f}([P_a − ∞]))². For χ = 1 and c = 1 this reads L_p(f, 1) = ((1 + p − a_p)/p)² · log_{ω_f}(P_K)², with P_K = Σ_σ [P^σ − ∞] = the trace Heegner divisor class on J₀(N), and equivalently log_ω(P_K(f))² for the point P_K(f) on A_f with φ^*ω = ω_f.

**Hypotheses.**

- BDP Assumption 5.12 at k = 2: D_K odd, Heegner hypothesis, c odd prime to N d_K, p split and prime to Nc. Also require the finite local signs ε_q(f,χ⁻¹)=+1 at every finite q, condition (4) of Assumption 5.12 (automatic here: with every prime of N split, (N, d_K) = 1 and BDP's exceptional set S(f) is empty, pp.1093–1094); the fixed finite type satisfies its central-critical compatibility.
- The value is at a character outside the range of interpolation; L(f, χ^{-1}, 0) vanishes there, and the formula is a special value, not a derivative.
- This is not a p-adic height formula: it involves the logarithm (Abel–Jacobi image), not the cyclotomic p-adic height of Perrin-Riou.
- The identification of the c = 1 trivial-character value with JSW’s Γ-measure uses a character, period and normalization transport. For general c the tame branch is extra data; χ need not factor through Γ.
- P_a is built from HE.1/cm-cyclic-isogeny-pair, which assumes D_K ∉ {−3, −4}; for D_K = −3 the Heegner point is requested from HeegnerPointEulerSystems HE.1.

**Outline.**

1. Import BDP Theorem 5.13 at r = j = 0 from GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula (stated there under all five clauses of Assumption 5.12): L_p(f, χ') = E(f, χ')² (Σ χ'^{-1}(a) N(a) AJ_F(Δ_{φ_aφ_0})(ω_f))² for χ' of infinity type (1, 1), with c^0/0! = 1 and Ω_p^0 = 1.
2. For r = 0 the cycle attached to φ_a φ_0 is the CM point P_a corrected by a cusp on BDP's curve X₁(N), and AJ_F(P_a − ∞)(ω_f) = log_{ω_f}([P_a − ∞]) (weight-two-abel-jacobi-is-logarithm); push forward along X₁(N) → X₀(N), which pulls ω_f back to ω_f, using isogeny-and-differential-compatibility (a).
3. Rewrite χ^{-1}(a)N(a) for the character χN of infinity type (1, 1) as the finite-order χ^{-1}(a), and the Euler factor at χN as in euler-factor-at-bdp-point.
4. For χ = 1 and c = 1 the sum over Pic(O_K) is the Galois trace; through the quotient φ : J₀(N) → A_f with φ^*ω = ω_f, log_{ω_f}(Q) = log_ω(φ(Q)) (isogeny-and-differential-compatibility).

**Dependencies:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [In weight two the p-adic Abel–Jacobi map is the formal logarithm](#target-gz-9-weight-two-abel-jacobi-is-logarithm), [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point), `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula`, `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`, `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), `AutomorphicPadicLFunctions:L0`, [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), `HeegnerPointEulerSystems:HE.1`.

**Acceptance.**

- Skinner Proposition 2.6.1, Case I: L_p^S(f, 1) ≐ (log_ω P_K(f))², with the Euler factors at S removed.
- Class number one, unit group of order 2: BDP's introduction reduces the formula to L_p(f, 1) = ((1 + p − a_p)/p)² log_{ω_f}(P_A − ∞)².
- A non-example: replacing the logarithm by the p-adic height of P_K gives Perrin-Riou's formula for the cyclotomic derivative, a different statement.

**Sources.**

- [bdp-2013](#source-bdp-2013), §5.3, Theorem 5.13, p. 1137. The general theorem, imported from GH at r = j = 0.
- [bdp-2013](#source-bdp-2013), Introduction, p. 1038. The weight-two case.
- [skinner-2020](#source-skinner-2020), §2.6, Proposition 2.6.1, p. 14. The trace-point form.

<a id="target-gz-9-quaternionic-weight-two-formula"></a>

### 9.9 The quaternionic weight-two formula of Brooks and JSW

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula` (theorem).

Assume p odd, (gen-H) with N⁻ > 1, (-free) N squarefree, (good) and (split). Let X* = X_{N⁺,N⁻}, ℓ₀ ∤ pN a prime split in K with 1 − a_{ℓ₀} + ℓ₀ ≠ 0, ι_{N⁺,N⁻}(x) = (T_{ℓ₀} − ℓ₀ − 1)[x], and x_K^{N⁺,N⁻} ∈ J(X*)(K) the Heegner point of JSW §4.3. Then L_p(f, 1) = (1 − a_{ℓ₀} + ℓ₀)^{-2} · ((1 + p − a_p)/p)² · log_{ω_f}(x_K^{N⁺,N⁻})² up to a p-adic unit, where log_{ω_f} : J(X*)(K_v) ⊗ O → K_v is the logarithm with d log_{ω_f} = ω_f for the O-basis ω_f attached to f_B. Exactly (Brooks Proposition 8.13 with the square restored): for a central critical χ of infinity type (1, 1), L_p(f, χ) = (1 − χ^{-1}(p̄) a_p + χ^{-2}(p̄) ε_f(p) p)² · log_{ω'_f}(Δ'_χ)², with Δ'_χ = φ(ε_f Δ_χ) ∈ Div(C')(H) ⊗ ℚ̄ (in the eigenspace on which Gal(H/K) acts through the finite-order part χN^{-1} or its inverse; K-rational when χN^{-1} is trivial; source issue E93) on the quotient C' = ℍ/Γ_{0,N⁺} and Δ_χ = Σ_a χ^{-1}(a) N(a) P_a, the sum of the CM points a ⋆ (A, t) (Brooks prints P_χ inside the sum; source issue E4).

**Hypotheses.**

- (-free) and (gen-H) as in JSW Proposition 5.1.6, and p odd (Brooks §2.1); f need not be ordinary at p.
- The exact form is Brooks's; JSW's restatement is up to a p-adic unit and replaces Brooks's x̃_K = Σ_σ ε_f[x]^σ by x_K^{N⁺,N⁻}, where ε_f x_K^{N⁺,N⁻} = (a_{ℓ₀} − ℓ₀ − 1) x̃_K (JSW print the factor as 1 − a_{ℓ₀} + ℓ₀, source issue E94; the sign is irrelevant after squaring).
- Brooks prints log_{ω_f}(ε_f Δ_χ) without the square in Propositions 8.12–8.13; Theorem 8.11, from which they are deduced, and JSW's restatement have the square (source issue E2).

**Outline.**

1. Brooks Theorem 8.11 at k = 2, j = 0: L_p(f, χ) = (Euler factor)² · (Σ χ^{-1}(a) N(a) AJ_p(Δ_a)(ω_f))², obtained from the continuity of quaternionic-bdp-construction, θ^{-1} f^♭ as the Coleman primitive (Brooks Lemma 7.3) and the Euler-factor removal of Lemma 8.6.
2. Weight two: compute with Δ_χ rather than ε_f Δ_χ (Brooks Lemma 7.5) and identify AJ_p with log_{ω_f} (weight-two-abel-jacobi-is-logarithm).
3. Descend from C to C' = ℍ/Γ_{0,N⁺} with log_{φ^*ω}(P) = log_ω(φ(P)); Shimura reciprocity shows Δ'_χ is defined over H and is Gal(H/K)-equivariant through the finite part χN^{-1}; it is K-rational when χN^{-1} = 1.
4. JSW's form: log_{ω_f} x_K^{N⁺,N⁻} = log_{ω_f} ε_f x_K^{N⁺,N⁻} = (a_{ℓ₀} − ℓ₀ − 1) log_{ω_f} x̃_K^{N⁺,N⁻}, whose square is (1 − a_{ℓ₀} + ℓ₀)² log_{ω_f}(x̃_K^{N⁺,N⁻})².

**Dependencies:** [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [In weight two the p-adic Abel–Jacobi map is the formal logarithm](#target-gz-9-weight-two-abel-jacobi-is-logarithm), [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula), `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`.

**Acceptance.**

- Squared logarithm: both sides are quadratic in ω_f; replacing ω_f by u ω_f multiplies the right side by u² and the left side through the normalisation of f_B by the same u², a test a non-squared version fails.
- The auxiliary ℓ₀ cancels: changing ℓ₀ multiplies log_{ω_f} x_K (equivalently ε_f x_K) by (1 − a_{ℓ₀'} + ℓ₀')/(1 − a_{ℓ₀} + ℓ₀) and the prefactor by its inverse square.

**Sources.**

- [jsw-2017](#source-jsw-2017), §5.1.5, Proposition 5.1.6, p. 34. The formula used by JSW.
- [brooks-2015](#source-brooks-2015), §8.6, Proposition 8.13, p. 4239. Brooks's statement, printed without the square on the logarithm.
- [brooks-2015](#source-brooks-2015), §8.5, Theorem 8.11, p. 4238. The general-weight theorem, with the square.

<a id="target-gz-9-p-optimal-quotient-formula"></a>

### 9.10 The formula for a p-optimal quotient

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula` (theorem).

Assume (good) and (irred_K): the residual representation of V = V_f is irreducible over G_K. Take the quotient π : J(X*_{N⁺,N⁻}) → A_f to be (ℤ(f), 𝔭)-optimal, i.e. π = φ ∘ π₀ with π₀ an optimal quotient and φ : A₀ → A_f an isogeny such that φ(T_p A₀) ⊄ 𝔭 T_p A_f, 𝔭 the prime of ℤ(f) fixed by ι_p, and ω_{A_f} the differential of A_f with the image of the 𝔭-summand basis. Then π^*(ω_{A_f}) ∈ O^× ω_f, and with y_K = π(x_K^{N⁺,N⁻}), JSW's z_K = y_K/(a_{ℓ₀} − ℓ₀ − 1), and ℓ₀ ∤ pN split in K with 1 − a_{ℓ₀} + ℓ₀ a 𝔭-adic unit: L_p(f, 1) = ((1 + p − a_p)/p)² · log_{ω_{A_f}}(z_K)², equivalently log_{ω_{A_f}}(y_K)², up to a unit in O.

**Hypotheses.**

- The standing JSW §3–§5 setting includes p odd, squarefree N, (split) and (gen-H), with the curve and Hecke auxiliary prime chosen as in quaternionic-weight-two-formula; (good) and (irred_K) supplement that setting rather than replace it.
- (good) p ∤ N; (irred_K); p − 1 > 1 (p odd) for the direct-summand argument of BLR Theorem 4, p. 187.
- The choice of a 𝔭-optimal quotient and of ℓ₀ with 1 − a_{ℓ₀} + ℓ₀ ∈ O^× (possible under (irred_K)).

**Outline.**

1. Néron models of J, A₀ and A_f are abelian schemes over ℤ_p by (good); π, π₀, φ extend.
2. π₀ optimal ⇒ π₀^* Ω¹(A₀/ℤ_p) is a direct summand of Ω¹(J/ℤ_p) (BLR, since p − 1 > 1).
3. Ω¹(A_f/ℤ_p) ⊗ O/p = Lie_{𝔽_p}(A_f[p]⁰)^∨ ⊗ O/p; T_p A₀ → T_p A_f not landing in 𝔭 T_p A_f and irreducibility give A₀[p] ↠ A_f[𝔭^{e_𝔭}], hence injectivity on cotangent spaces, so φ^*ω_{A_f} is part of an O-basis.
4. Substitute log_{π^*ω}(x) = log_ω(π(x)) into quaternionic-weight-two-formula.

**Dependencies:** [The quaternionic weight-two formula of Brooks and JSW](#target-gz-9-quaternionic-weight-two-formula), `EffectiveDiophantineMethods:ED.4/abelian-logarithm`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), `NeronModelsAndSemistableAbelianVarieties:R11.1`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`.

**Acceptance.**

- Without (irred_K) the optimal-quotient differential can fail to be a unit multiple of ω_f, and the formula holds only up to the index of φ^*ω_{A_f} — a test that a version dropping the hypothesis fails.
- For the analogous N⁻ = 1 statement (cotangent argument unchanged; formula from bdp-weight-two-heegner-formula) and E optimal, π^*ω_E = c_E ω_f with the Manin constant c_E; the statement says c_E is a p-adic unit under these hypotheses, consistent with the known results for p odd.

**Sources.**

- [jsw-2017](#source-jsw-2017), §5.1.5, Proposition 5.1.7, p. 34. The p-optimal form.
- [jsw-2017](#source-jsw-2017), §5.1.5, proof of Proposition 5.1.7, pp. 34–35. The proof strategy.

<a id="target-gz-9-logarithm-detects-heegner-point"></a>

### 9.11 The formal logarithm detects non-torsion Heegner points

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/logarithm-detects-heegner-point` (theorem).

Let A be an abelian variety over K with good reduction at v | p, K_v = ℚ_p, and ω a nonzero invariant differential. (a) For an elliptic curve E (dim 1), log_ω(P) ≠ 0 if and only if P ∈ E(K) has infinite order: log_E : E(K_v) → K_v has kernel the torsion subgroup and E(K) ⊂ E(K_v). (b) For A of strict GL(2)-type with M = End⁰(A) a field of degree dim A having a real embedding and ω an M-eigendifferential, the same equivalence holds for actual points by eigenlogarithm-nonvanishing; it is not a consequence of freeness of A(K) ⊗ ℚ_p over M ⊗ ℚ_p, since log_A(P) ≠ 0 only says that some eigencomponent is nonzero. Consequently, under the hypotheses of bdp-weight-two-heegner-formula (resp. quaternionic-weight-two-formula), P_K(f) ≠ 0 if and only if L_p(f, 1) ≠ 0. A nonzero Selmer class whose localisation at v vanishes has Bloch–Kato logarithm zero; the equivalence is for the Kummer classes of global points only.

**Hypotheses.**

- Lie(A) is free of rank one over M ⊗ K_v (strict GL(2)-type), so A(K_v) ⊗ ℚ is free of rank one over M ⊗ ℚ_p.
- E_p(f) ≠ 0 (euler-factor-at-bdp-point) and 1 − a_{ℓ₀} + ℓ₀ ≠ 0 are needed to pass from the logarithm to L_p(f, 1).
- Part (b) needs the real-embedding hypothesis of BSW Theorem 1.1 and an actual algebraic point. Strict GL(2)-type alone does not include this hypothesis.

**Outline.**

1. The logarithm of the commutative p-adic Lie group A(K_v) is a homomorphism with kernel the torsion subgroup and is an isomorphism A(K_v) ⊗ ℚ → Lie(A/K_v) (EffectiveDiophantineMethods ED.4/abelian-logarithm); A(K) ⊂ A(K_v).
2. dim 1: Lie(E/K_v) is one-dimensional and ω ≠ 0 identifies it with K_v, so log_ω(P) = 0 iff log_E(P) = 0 iff P is torsion.
3. GL(2)-type: use eigenlogarithm-nonvanishing for the λ-eigencomponent singled out by ι_p.
4. Insert into the weight-two formulas: L_p(f, 1) is a nonzero multiple of log_ω(P_K(f))² (euler-factor-at-bdp-point).

**Dependencies:** [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [The quaternionic weight-two formula of Brooks and JSW](#target-gz-9-quaternionic-weight-two-formula), [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point), `EffectiveDiophantineMethods:ED.4/abelian-logarithm`, `mathlib:FormalGroup`, [Heegner points have nonzero logarithm in every eigencomponent](#target-gz-9-eigenlogarithm-nonvanishing).

**Acceptance.**

- Skinner Corollary 2.6.2: P_K(f) ≠ 0 iff L^S_𝔭(f, 1) ≠ 0, with the eigencomponent input of eigenlogarithm-nonvanishing (PAPER-SKINNER-20/E6).
- Non-example: for M = ℚ(√5) and a point P with log_A(P) ≠ 0, the projection of log_A(P) to one λ-eigenline can a priori vanish; excluding this needs transcendence, not linear algebra.

**Sources.**

- [skinner-2020](#source-skinner-2020), §2.6, Corollary 2.6.2, p. 14. The detection statement.
- [skinner-2020](#source-skinner-2020), §2.6, after Proposition 2.6.1, p. 14. The logarithm detects the point.

<a id="target-gz-9-bloch-kato-logarithm-of-heegner-class"></a>

### 9.12 Bloch–Kato logarithm of the Heegner Kummer class

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class` (comparison).

Let A/K be an abelian variety with good reduction at v | p, V = V_p A, and κ : A(K) → H¹_f(K, V) the Kummer map (HE.3). Then loc_v κ(P) lies in H¹_f(K_v, V) = H¹_e(K_v, V) (D_cris(V)^{φ=1} = 0 by purity), and under D_dR(V)/Fil⁰ D_dR(V) ≅ Lie(A/K_v) the Bloch–Kato logarithm of loc_v κ(P) is the formal logarithm log_A(P). Hence for an invariant differential ω ∈ H⁰(A, Ω¹) ⊗ K_v, viewed in Fil⁰ D_dR(V^*(1)), the dual of D_dR(V)/Fil⁰ ≅ Lie(A/K_v), ⟨log_BK loc_v κ(P_K(f)), ω⟩ = log_ω(P_K(f)) for ω ∈ H⁰(A_f, Ω¹) ⊗ M_f with φ^*ω = ω_f, and the BDP-point formulas may be written L_p(f, 1) = E_p(f)² ⟨log_BK loc_v κ(P_K(f)), ω⟩² with the exact differential normalisation of the formula used.

**Hypotheses.**

- Good reduction at v; V_p A crystalline, with crystalline Frobenius eigenvalues α/p, |α| = √p (weight −1; none equals 1, so H¹_e = H¹_f).
- The identification D_dR(V_p A)/Fil⁰ ≅ Lie(A) ⊗ K_v and the pairing with differentials use the de Rham comparison (PadicHodgeRegulators L0–L1); the sign convention of log_BK as the inverse of exp_BK is the one fixed there.
- V_f is the λ-summand of V_p(A_f), not its cohomological dual; the geometric L-function in JSW is that of V_f^∨⊗ψ. Identify D_dR(V_f)/Fil⁰ with Lie(A_f)_λ and its dual differential pairing with Fil⁰D_dR(V_f^*(1)) by the supplied comparison conventions. Purity for the Tate module has weight −1, so Frobenius eigenvalues cannot equal 1; dual H¹ has weight +1.

**Outline.**

1. The Kummer image of A(K_v) ⊗ ℚ_p is H¹_f(K_v, V) (Bloch–Kato, Example 3.10.1), and the Bloch–Kato exponential Lie(A) ⊗ K_v → H¹(K_v, V) is the composite of the exponential of the formal group with the Kummer map (PadicHodgeRegulators L1).
2. Invert: log_BK ∘ loc_v ∘ κ = log_A on A(K_v) ⊗ ℚ.
3. Pair with ω ∈ Fil⁰ D_dR(V^*(1)) (for A = A_f, the differential with φ^*ω = ω_f) through the de Rham pairing, as Castella–Hsieh §4.5 do for generalized Heegner classes.

**Dependencies:** [The formal logarithm detects non-torsion Heegner points](#target-gz-9-logarithm-detects-heegner-point), `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`, `PadicHodgeRegulators:L1/abelian-variety-logarithm`, `EffectiveDiophantineMethods:ED.4/abelian-logarithm`, [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), `PadicHodgeRegulators:L1/bloch-kato-logarithm`, `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`.

**Acceptance.**

- A global Selmer class with trivial localisation at v has log_BK = 0 although it may be nonzero: logarithms detect points, not Selmer classes (logarithm-detects-heegner-point).
- Compatibility with GeneralizedHeegnerCycles GH.8's weight-two comparison: the étale Abel–Jacobi class of ε_f(P − ∞) maps to κ(P) under the modular quotient, so the same logarithm appears.

**Sources.**

- [castella-hsieh-2018](#source-castella-hsieh-2018), §4.5, p. 19. The Bloch–Kato logarithm and its domain.
- [castella-hsieh-2018](#source-castella-hsieh-2018), §4.5, Theorem 4.9, p. 20. The logarithm of Heegner classes in the p-adic Gross–Zagier formula.

<a id="target-gz-9-isogeny-and-differential-compatibility"></a>

### 9.13 Compatibility with isogenies, differentials and characters

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility` (lemma).

(a) For a homomorphism φ : A → A' of abelian varieties over K_v and ω' ∈ H⁰(A', Ω¹), log_{φ^*ω'}(P) = log_{ω'}(φ(P)). (b) If π' = ψ ∘ π for an isogeny ψ : A_f → A' with ψ^*ω_{A'} = c_ψ ω_{A_f}, then log_{ω_{A'}}(π'(x)) = c_ψ log_{ω_{A_f}}(π(x)), so log_{ω_{A'}}(π'x)² = c_ψ² log_{ω_{A_f}}(πx)², and a BDP-point formula rewritten with log_{ω_{A'}}² gains the factor c_ψ^{-2}; for a modular parametrisation with π^*ω₀ = c_π ω_f, log_{ω₀}(π x) = c_π log_{ω_f}(x) and the squared identity gains c_π^{-2} when written with log_{ω₀}. (c) For a finite-order character χ of Pic(O_c), Galois transport of the χ-sum must transport the p-adic embedding, completion and differential as well as the points and coefficients. For σ fixing the coefficients and preserving the chosen place, the compatible local automorphism gives σ(Σ χ^{-1}(a) log_ω(P_a)) = Σ χ^{-1}(a) log_{σ ω}(P_a^σ). Complex conjugation exchanges the two places over p and cannot be applied as an automorphism commuting with one fixed local logarithm; its Fricke/character comparison remains a gap. (d) Anticyclotomic specialisation: evaluation of L_p(f) ∈ R⟦Γ⟧ at a character factoring through Γ via the projection Γ̃ → Γ commutes with the projection (pushforward) R⟦Γ̃⟧ → R⟦Γ⟧ induced by Γ̃ → Γ: (ψ∘pr)(μ) = ψ(pr_*μ).

**Hypotheses.**

- Logarithms are the p-adic logarithms of abelian varieties over K_v of EffectiveDiophantineMethods ED.4/abelian-logarithm.
- c_ψ, c_π are nonzero; no claim that they are p-adic units without p-optimality (p-optimal-quotient-formula).

**Outline.**

1. (a) d(log_{ω'} ∘ φ) = φ^*ω' and both sides are homomorphisms vanishing at 0 with the same derivative, so they agree (uniqueness of the logarithm).
2. (b) apply (a) to ψ and to the parametrisation.
3. (c) The place-preserving case is functoriality under a compatible continuous isomorphism of local fields. For a global σ that changes the place, transport the embedding to ι_p ∘ σ^{-1}; the Fricke formula requires an additional precise supplier and is not proved by the cited parametrisation/degree node.
4. (d) the projection R⟦Γ̃⟧ → R⟦Γ⟧ is the ring map induced by Γ̃ → Γ and character evaluation is functorial (PadicMeasuresIwasawaAlgebras L1).

**Dependencies:** [In weight two the p-adic Abel–Jacobi map is the formal logarithm](#target-gz-9-weight-two-abel-jacobi-is-logarithm), `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`, `EffectiveDiophantineMethods:ED.4/abelian-logarithm`, `PadicMeasuresIwasawaAlgebras:L1`, `AutomorphicPadicLFunctions:L0`, [Manin constant](#target-gz-3-manin-constant).

**Acceptance.**

- Brooks §8.6: log_{φ^*ω}(P) = log_ω(φ(P)) for the map C → C'.
- Matches GeneralizedHeegnerCycles GH.8's differential factor: replacing the Abel–Jacobi evaluation by the elliptic logarithm in a squared identity introduces c_π^{-2}, not c_π^{-1}.

**Sources.**

- [brooks-2015](#source-brooks-2015), §8.6, before Proposition 8.13, p. 4239. The pullback rule.
- [jsw-2017](#source-jsw-2017), §5.1.5, p. 34. Compatibility with the Hecke projector and the auxiliary prime.

<a id="target-gz-9-multiplicative-prime-formula"></a>

### 9.14 The weight-two formula at a multiplicative prime

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula` (theorem).

Let E/ℚ be semistable of conductor N, optimal, with modular parametrisation π : X₀(N) → E, π(∞) = O, π^*ω_E = c·ω_f with c ∈ ℤ_(p)^×; let p ≥ 5 divide N exactly (multiplicative reduction, a_p = ±1), K imaginary quadratic with every prime of N split or ramified in K and p split, and L_p(f) ∈ Λ_{R₀} the anticyclotomic p-adic L-function interpolating Γ(n)Γ(n + 1)(1 − a_p p^{-1} φ(𝔭))² (𝔭 the prime above p fixed by ι_p) Ω_p^{4n} L(f/K, φ, 1)/(π^{2n+1} Ω_K^{4n}) at unramified φ of infinity type (−n, n), n > 0 (the square of the twisted Castella–Hsieh measure, extended to p | N). Then L_p(f, 1) = (1 − a_p p^{-1})² · (log_{ω_E} P_K)² up to a p-adic unit, P_K ∈ E(K) the trace Heegner point. The factor 1 − a_p p^{-1} = 1 ∓ p^{-1} is nonzero: there is no exceptional zero in this formula. The exceptional zero occurs instead for the weight-two specialisation of Howard's big Heegner points, where the family factor 1 − a_p^{-1} vanishes when a_p = 1 and Castella's derivative formula Z'_{p,f,0} = 𝓛_p(f, K) · loc_p(κ_f) carries the L-invariant 𝓛_p(f, K) = 𝓛_p(f) − log_p(ϖ_p)/ord_p(ϖ_p); that formula is a statement about Hida families and is owned by GeneralizedHeegnerCycles GH.7.

**Hypotheses.**

- p ∥ N, p ≥ 5, split in K; the Heegner hypothesis allows p | N because p splits.
- ε_p = 0 in Castella's Euler factor (1 − a_p p^{-1} φ(𝔭) + ε_p φ²(𝔭)) since p | N; it is p^{-1} when p ∤ N, recovering euler-factor-at-bdp-point.
- The p-adic L-function is the square of the twisted toric measure: Castella's proof writes L_p(f) := Tw_{ψ^{-1}}(L_{p,ψ}(f)) without the square, while the interpolation he states is that of the square (source issue E5).
- Castella's standing hypothesis (§2.1) that ρ̄_{E,p} is irreducible is not used by the proof of Theorem 3.2, which rests on Castella-exc. Theorems 2.10–2.11 and Bloch–Kato Example 3.10.1, and is deliberately omitted; if the supplier cannot confirm this, add it as a hypothesis.

**Outline.**

1. Extend the BDP construction to p-new f: the p-adic multiplier becomes (1 − a_p χ^{-1}(p̄))² because β_p = 0 (Castella, Theorem 2.10).
2. Import semistable Coleman/rigid Abel–Jacobi integration from the proposed ColemanIntegration Part II. Apply Castella Theorem 2.11 pp.15–16 to the unsquared p-new root; at r=j=0 its value is (1−a_p/p) times the Heegner logarithm. Square only in the central-value adapter.
3. At r = j = 0 the cycle is [(A, A[𝔑]) − (∞)] and AJ_F(Δ)(ω_f) = log_{ω_f}(Δ) by Bloch–Kato Example 3.10.1 for the semistable Jacobian J₀(N) (Castella's proof of Theorem 3.2; the good-reduction node weight-two-abel-jacobi-is-logarithm does not apply since p | N); sum over Gal(H/K) and push to E with π^*ω_E = c ω_f (isogeny-and-differential-compatibility).

**Dependencies:** `EffectiveDiophantineMethods:ED.4/abelian-logarithm`, [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L0`, `ColemanIntegration:L1`, `PadicHodgeRegulators:L1`, [Manin constant](#target-gz-3-manin-constant), [Integral Manin constant and p-unit range](#target-gz-3-manin-integrality-and-p-unit).

**Acceptance.**

- Castella's Theorem 3.2: L_p(f, 1) = (1 − a_p p^{-1} + ε_p)² (log_{ω_E} P_K)² up to a p-adic unit, uniformly for p ∤ N (ε_p = p^{-1}) and p | N (ε_p = 0).
- Split multiplicative a_p = 1: the factor is ((p − 1)/p)² = p^{-2}(p − 1)², of p-adic valuation −2 because p − 1 is a p-adic unit, and never zero; for non-split a_p = −1 it is ((p + 1)/p)², also of valuation −2. Up to a p-adic unit the formula reads L_p(f, 1) ≐ p^{-2}(log_{ω_E} P_K)².
- The L-invariant does not appear: a version of the formula containing 𝓛_p(f) is the big-Heegner-point derivative formula, not this one.

**Sources.**

- [castella-2018-multiplicative](#source-castella-2018-multiplicative), §3, Theorem 3.2, p. 9. The formula, uniform in p ∤ N and p | N.
- [castella-2020-exceptional](#source-castella-2020-exceptional), §2.5, Theorem 2.11, p. 15. The semistable extension of BDP's theorem.
- [castella-2020-exceptional](#source-castella-2020-exceptional), Introduction, Theorem and (0.4), pp. 2–3. The exceptional zero belongs to the big Heegner point, with the L-invariant.

<a id="target-gz-9-bdp-measure-integrality"></a>

### 9.15 The BDP function lies in the Iwasawa algebra

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality` (theorem).

Under (sqf), (sgn), (ram), (flt), (odd) and (L-lrg) of Skinner §2 (Case I: every prime of N split or ramified in K; Case II: N = N⁺N⁻ as in quaternionic-weight-two-formula), let O^ur be the ring of integers of the completion of the maximal unramified extension of L. The imprimitive function L^S_𝔭(f), defined by BDP (Case I) and Brooks (Case II) only as a continuous function on the characters of Γ, is the evaluation map of an element of O^ur⟦Γ⟧. Its coefficients lie in O^ur; they are not known to lie in O, because the p-adic CM period Ω_p is a unit of O^ur that need not lie in L.

**Hypotheses.**

- The Iwasawa-algebra statement needs the interpolation at characters ramified at the primes above p: Brakočević's extension, or the constructions of Eischen–Harris–Li–Skinner and Wan (which also construct the function directly when some ℓ | N is inert or ramified in K).
- Skinner's preprint writes O⟦Γ⟧; the published version corrects this to O^ur⟦Γ⟧ (PAPER-SKINNER-20/E1).

**Outline.**

1. Case I with N⁻ = 1: by bdp-square-root-comparison L_p(f) is a unit times the square of the image of L3h's distribution, which is a measure: Hsieh's interpolation covers characters of p-power conductor (Castella–Hsieh Proposition 3.8 for m ≥ 0 and conductor p^n), i.e. Brakočević's extension. This needs bdp-square-root-comparison in the form allowing squarefree ramified level ((Heeg′) and (ST) for a ψ₀ of p-power conductor); its comparison unit is still subject to the normalization gap.
2. Case II: Burungale §5.2 Lemma 5.5 constructs bounded local CM measures as Amice transforms of integral Serre–Tate expansions. Equation (5.8) forms their finite translated sum. Twist and push forward this linear measure, then square by convolution. Brooks Proposition 8.10 supplies a continuity statement, not a proof of boundedness. Identifying the resulting root with Brooks’s normalization and proving the comparison scalar is integral remain the stated normalization gap.
3. Remove the Euler factors at S ∖ {p} by multiplying by the elements P_w(ε^{-1}Ψ^{-1}(Frob_w)) of O⟦Γ⟧.

**Dependencies:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), `AutomorphicPadicLFunctions:L3h`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:AbstractMeasure.amiceTransform`, `mathlib:AbstractMeasure.injective_amiceTransform`, `PadicMeasuresIwasawaAlgebras:L2`, `AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization`, `AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization`.

**Acceptance.**

- Without the extension to characters ramified at p a continuous function on the crystalline characters is not known to be a measure, and the Iwasawa main conjecture of Skinner §2.7 could not be formulated.
- Coefficient ring test: Ω_p ∉ L in general, so a statement with coefficients in O⟦Γ⟧ is not justified (Skinner's published text corrects the preprint's O⟦Γ⟧).

**Sources.**

- [skinner-2020](#source-skinner-2020), Published §2.6, pp. 342–343. The integrality statement and its sources.
- [castella-hsieh-2018](#source-castella-hsieh-2018), §3.3, Proposition 3.8, p. 13. The interpolation at characters ramified at p.
- [burungale-2015](#source-burungale-2015), §5.2, Lemma 5.5 and (5.8), pp.27–29. Bounded integral local measures and translated linear sum, independent of Brooks continuity.

<a id="target-gz-9-imprimitive-function-dictionary"></a>

### 9.16 Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary` (comparison).

For ψ crystalline of weight (−n, n), n > 0, n ≡ 0 mod (p − 1), let χ be the Hecke character with χ^{-1} = ψ^alg |Nm(·)|_ℚ. Then L^S_𝔭(f) is the imprimitive variant, with the Euler factors at the primes of S = {ℓ | pND} not dividing p removed, of BDP's L_p(f, χ) in Case I and of Brooks's L_p(f, χ) in Case II; the corresponding characters χ, of BDP/Brooks infinity type (2 + j, −j) with j = n − 1, form a subfamily of Σ^{(2)}_cc(𝔫) and Σ^{(2)}_cc(𝔫⁺) respectively; the interpolated values L(f, χ^{-1}, 0) equal L(f, ψ^alg, 1); and the constants correspond by C(f, K) = α(f, f_GL2)^{-1} and w(f, ψ) = w_K w(f, χ)^{-1}. Skinner's further identity e_∞(f, ψ) w_K (2πi)^{1+2n} = C(f, χ, 1) is false as printed (its left side is purely imaginary): the archimedean constants match only together with Skinner's Ω(ψ^alg) and a relation between his CM periods and BDP's, which is part of the normalization gap (E88). In JSW's normalisation the corresponding function, equal to it up to the explicit Λ_R-unit of the normalization gap, is L^Σ_p(f) = L_p(f) ∏_{w ∈ Σ} P_w(ε^{-1}Ψ^{-1}(Frob_w)), with JSW's (5.1.a) related to BDP and Brooks by the same substitution χ^{-1} = ψ^alg|·|_{𝔸_K}.

**Hypotheses.**

- Same hypotheses as bdp-measure-integrality.
- Skinner's e_p(f, ψ) = E_𝔭̄/E_𝔭 is a ratio of Euler-type factors. Because p ∈ S, his L^S also omits the Euler factors at 𝔭 and 𝔭̄, which contribute E_𝔭E_𝔭̄; so e_p·L^S = E_𝔭̄²·L^{S∖{p}}, BDP's and JSW's squared multiplier times the L-value with only the Euler factors away from p removed.

**Outline.**

1. Match the interpolation formulas character by character: Skinner's §2.6 formula, BDP (5.2.3) with Theorem 5.5's L^alg, Brooks §8.4 with Proposition 8.7's L^alg and JSW (5.1.a).
2. Uniqueness of a measure with prescribed values on a dense set of characters (bdp-p-adic-l-function) turns the agreement of values into an identity in O^ur⟦Γ⟧.

**Dependencies:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality), `AutomorphicPadicLFunctions:L0`.

**Acceptance.**

- At ψ = 1 the dictionary gives Skinner's Proposition 2.6.1 from BDP's and Brooks's formulas (bdp-weight-two-heegner-formula, quaternionic-weight-two-formula).
- Removing the Euler factor at an inert w = (ℓ) multiplies by (1 − a_ℓ ℓ^{-1} + ℓ^{-1})(1 + a_ℓ ℓ^{-1} + ℓ^{-1}), which can raise μ (JSW Remark 5.1.4).

**Sources.**

- [skinner-2020](#source-skinner-2020), Published §2.6, pp. 342–343. The identification of L^S_𝔭(f) with the BDP and Brooks functions, the character sets, and the correspondence of constants.

<a id="target-gz-9-eigenlogarithm-nonvanishing"></a>

### 9.17 Heegner points have nonzero logarithm in every eigencomponent

**Target:** `GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing` (theorem).

Let A_f be the modular abelian variety of a weight-two newform f with Hecke field M_f (totally real) and dim A_f = [M_f : ℚ], and ω a nonzero M_f-eigendifferential (a^*ω = σ(a)ω for some σ : M_f ↪ ℚ̄); in (b), σ = ι_p|_{M_f} and log_ω is extended to A_f(K_v) ⊗ M_f through ι_p, so that the Hecke action on ω agrees with the scalar action (Skinner’s φ*ω = ω_f). For the other embeddings log_ω kills P_K(f): with M_f = ℚ(√5) the idempotent is e_f = ½(1⊗1 + ⅕√5⊗√5). (a) Every non-torsion x ∈ A_f(ℚ̄) has log_ω(x) ≠ 0; more generally, for any abelian variety A/ℚ̄ and field F ⊂ End⁰(A) with dim A = [F : ℚ] and at least one real embedding of F, every non-torsion x ∈ A(ℚ̄) has log_ω(x) ≠ 0 for every nonzero F-eigendifferential ω (Burungale–Skinner–Wan Theorem 1.1). (b) In Skinner's Cases I and II, let Q^ξ_K ∈ J(X)(K) ⊗ ℚ be the rational Hodge-divisor class, y = φ(Q^ξ_K) ∈ A_f(K) ⊗ ℚ and P_K(f) = φ(ε_f Q^ξ_K). Then log_ω P_K(f) = log_ω y, and if P_K(f) ≠ 0 then log_ω P_K(f) ≠ 0. (c) Let A₀ be an abelian variety over a totally real field L with O_F ⊂ End_L(A₀) for a totally real F of degree dim A₀ (after an L-isogeny), E ⊇ F totally real, H/K a finite abelian (e.g. ring class) extension of a finite extension K/L, y ∈ A₀(H), and ω₀ a nonzero F-eigendifferential on A₀. For a character χ : Gal(H/K) → O_E^× (necessarily ±1-valued), the χ-twisted sum Σ_τ χ(τ) log_{ω₀}(τ y) is nonzero whenever the algebraic point x = Σ τ(y) ⊗ χ(τ) on the Serre tensor abelian variety A₀⊗_{O_F}O_E is non-torsion (BSW Theorem 2.8(i)). The application to nonvanishing of L^S_𝔭(f, 1) is made in logarithm-detects-heegner-point, which depends on this node, rather than used to prove this node.

**Hypotheses.**

- dim A_f = [M_f : ℚ] and M_f has a real embedding: the input of the p-adic analytic subgroup theorem in BSW's form.
- The statement concerns actual algebraic points and the specific Heegner tensor P_K(f) obtained from one; it asserts nothing about an arbitrary nonzero M_f- or ℂ_p-linear tensor or an arbitrary nonzero cohomology class.
- For (b), φ is Hecke-equivariant, so P_K(f) = φ(ε_f Q^ξ_K) = e_f·(y ⊗ 1) with e_f the image of ε_f in O_f ⊗ M_f (the idempotent of multiplication M_f ⊗ M_f → M_f; e_f = 1 only if M_f = ℚ). Hence P_K(f) ≠ 0 ⇒ y ≠ 0, and since a^*ω = ι_p(a)ω for a ∈ O_f, log_ω kills (1 − e_f), so log_ω P_K(f) = log_ω y; a nonzero integral multiple of y is an actual non-torsion point. For (c), E is totally real and χ has finite order, hence its values are ±1; use the actual Serre tensor variety and point, not an arbitrary nonzero C_p-tensor.

**Outline.**

1. Apply the eigenlogarithm theorem only to actual algebraic points: clear denominators in y ∈ A_f(K) ⊗ ℚ. The analytic subgroup input has an algebraic point as a hypothesis.
2. (a) is imported from DiophantineApproximationAndTranscendence DT.3 (BSW Theorems 1.1 and 2.3, from the p-adic analytic subgroup theorem).
3. (b) Hecke-equivariance gives P_K(f) = e_f·(y ⊗ 1), so P_K(f) ≠ 0 ⇒ y ≠ 0; the eigen-property of ω (ε_f·ω_f = ω_f, Skinner p.344) gives log_ω P_K(f) = log_ω y. Clear denominators in y and apply (a). Do not assert φ ∘ ε_f = φ: it holds for the rational Galois-orbit projector but fails for the M_f-coefficient projector when [M_f : ℚ] > 1.
4. (c) BSW Theorem 2.8(i) for E totally real.

**Dependencies:** [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `DiophantineApproximationAndTranscendence:DT.3`.

**Acceptance.**

- For an elliptic curve (M_f = ℚ) (a) is the elementary fact that the formal logarithm kills only torsion; for [M_f : ℚ] > 1 it is a transcendence theorem: freeness of A_f(K) ⊗ ℚ_p over M_f ⊗ ℚ_p alone does not give componentwise nonvanishing.
- Skinner Corollary 2.6.2 (P_K(f) ≠ 0 ⇔ L^S_𝔭(f, 1) ≠ 0) is proved this way; the gap in its printed deduction is PAPER-SKINNER-20/E6.

**Sources.**

- [bsw-2026](#source-bsw-2026), §1.4, Theorem 1.1, p. 3. The algebraic-point nonvanishing.
- [bsw-2026](#source-bsw-2026), §1.3, p. 3. Why the eigencomponent statement is not elementary.
- [skinner-2020](#source-skinner-2020), §2.6, Corollary 2.6.2, p. 14. The consumer statement.
- [bsw-2026](#source-bsw-2026), §2.3, Theorem 2.8(i), p. 6. The twisted case (c), using only the totally real alternative (i).

**Coverage:** planned. The following boundaries remain:

- Compute the normalization unit of the constructor (Castella–Hsieh or Burungale root against JSW (5.1.a), Brooks’s W(f, χ) transported to JSW’s W(f, ψ), Skinner’s periods), the Γ transport and the fixed-tame-branch dictionary.
- Certify the bounded geometric CM measures and the complete-DVR uniqueness interface, including Weierstrass preparation over Ô^ur.
- Supply the three proposed Part II contracts, Castella’s A′ extension and the missing BDP, logarithm and semistable arithmetic signatures and examples.
- Petersson-ratio algebraicity/integrality and Prasanna’s quaternionic formula; full ordinary moment compatibility and semistable integrations.

## Exact requests

Each entry describes a required interface and its consumers. A stage reference is a request, not evidence that the named supplier already contains the whole interface. Audit IDs above identify known absent or partial specializations.

### Request 1: AutomorphicLFunctionsAndLocalFactors:AL.3

For GL₂ and a quadratic torus character with matching centre, construct the local base-change epsilon factors and prove the Rankin-over-F comparison by ηv(−1), with fixed ψv and self-dual measures. Existing GL_n×GL_{n−1} factors are not this quadratic base-change interface.

**Consumers:** [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional).

**Audit:** R1-epsilon, R1-partial-1.

### Request 2: HeightsRationalPointsAndObstructions:RP.0

General line-bundle Weil heights on projective abelian varieties; bounded-error tensor and pullback laws; the canonical quadratic limit for symmetric L; its uniqueness, positivity for ample L and torsion zero locus using Northcott; compatible relative/absolute normalization and finite-extension local-degree formula. Supply rational scalar extension of the quadratic form. Existing height-class nodes do not yet provide this machine.

**Consumers:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), [The canonical height on E(K) ⊗ ℚ](#target-gz-0-canonical-height-rational).

**Audit:** R1-partial-2.

### Request 3: AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison

The actual dual and twice-rigidified Poincaré line, contravariant dual pullback and biduality. Its algebraic bilinear laws are separately supplied by A2/mumford-map-and-biextension. GZ.1 applies the general height machine to these lines.

**Consumers:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing).

**Audit:** R1-partial-3.

### Request 4: HeightsRationalPointsAndObstructions:RP.1

General Mordell–Weil finite generation for A over a number field from weak descent and the Northcott height argument; reduce the descent height step to Mathlib AddCommGroup.fg_of_descent'.

**Consumers:** [Character-component height pairing](#target-gz-1-character-height-pairing).

### Request 5: ArakelovGeometryAndAbelianHeights:R35.1

Hermitian rational line bundles, Green arithmetic divisors, finite/infinite arithmetic degrees and the product formula with conjugation-compatible metrics; GZ.2 specializes this infrastructure to curve intersections.

**Consumers:** [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing).

**Audit:** R2-Arakelov.

### Request 6: AbelianSchemesAndArithmeticModuli:A2

Canonical principal polarization of the Jacobian and comparison of its theta bundle with the rigidified Poincaré bundle; the full polarization is one half of that for Θ+[-1]*Θ.

**Consumers:** [Faltings–Hriljac comparison](#target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions).

**Audit:** R1-partial-3.

### Request 7: GL2AutomorphicRepresentationsAndTransfer:R17.3

Weight-two Shimura-Jacobian constituent comparison: rational Hecke summands and Hom⁰(J_U,A), their multiplicity one, coefficient field degree equal to dim A, End_F⁰(A) and compatibility with the rational Jacquet–Langlands model. The existing rational-model node supplies transfer descent but not this geometric realization.

**Consumers:** [Strict GL₂ realization and transfer](#target-gz-3-strict-gl2-realization).

**Audit:** R1-integral-JL, R1-partial-5.

### Request 8: NeronModelsAndSemistableAbelianVarieties:R11.1

The minimal invariant differential lattice of an elliptic Néron model, pullback under isogenies and its local valuation; needed to compare Manin constants across an isogeny class.

**Consumers:** [Manin constant](#target-gz-3-manin-constant), [Manin isogeny and twist transfer](#target-gz-3-manin-isogeny-twist-transfer).

**Audit:** R1-cotangent.

### Request 9: ModularCurvesPartII:R14.1

Proper cycle push-forward with generic residue-degree multiplicities, base-change/push-pull and the passage from divisor correspondences on X×X to Hom(J,J∨). Use existing algebraic cycles, rather than replacing a cycle by its reduced image.

**Consumers:** [Special correspondence cycle](#target-gz-6-special-correspondence-cycle).

**Audit:** R1-partial-4.

### Request 10: ModularCurvesPartII:R14.2

Hecke double-coset correspondences on finite-level modular/Shimura curves, their convolution with multiplicities and action on Pic⁰, with level compatibilities.

**Consumers:** [Special correspondence cycle](#target-gz-6-special-correspondence-cycle).

### Request 11: HeegnerPointEulerSystems:HE.1

CM points on the finite-level quaternionic tower, their connected-component labels, ring-class field of definition, reciprocity and Hecke/level transport, with the chosen Artin convention.

**Consumers:** [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class).

**Audit:** R1-extra-units.

### Request 12: AutomorphicSpectralTheory:AS.3

Meromorphic continuation of the mixed incoherent Eisenstein kernel, compact-parameter derivative bounds, regularized torus integration and its constant-term subtraction, including justification of all derivative/integral exchanges.

**Consumers:** [Incoherent central derivative](#target-gz-6-incoherent-central-derivative).

**Audit:** R1-kernel-continuation.

### Request 13: AutomorphicSpectralTheory:AS.4

Holomorphic/cuspidal constituent projection with Petersson adjunction, annihilation of constants/Eisenstein/old components in the new constituent, and compatibility with the relevant theta/correspondence kernels.

**Consumers:** [Arithmetic theta lifting comparison](#target-gz-6-arithmetic-theta-lifting), [Projected arithmetic kernel identity](#target-gz-6-generating-series-arithmetic-theta-lifting-and-the-kernel-identity).

**Audit:** R1-projections.

### Request 14: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

P-divisible groups and deformations over nilpotent thickenings as in the R07.2 stage contract, with lifting of endomorphisms. GZ.7 proves the CM-specialized lifting length and its residue/different normalization from YZZ Chapter 8; canonical/quasicanonical CM filtrations remain exact CM.5/HE.2 requests.

**Consumers:** [Good-place arithmetic identity](#target-gz-7-good-local-arithmetic-identity).

**Audit:** R1-partial-11.

### Request 15: TropicalAndBerkovichArithmetic:TB.3

Connected compact metric-graph Laplacian Δf=−f″dx−Σ outgoing slopes δv; existence and symmetry of the normalized Green kernel for a probability measure; effective resistance, bridge infinity and edge-subdivision compatibility. GZ.2 supplies the genus-weighted canonical-divisor admissibility condition, not this generic graph theory.

**Consumers:** [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure), [Explicit admissible skeleton measure](#target-gz-2-explicit-skeleton-measure).

### Request 16: TropicalAndBerkovichArithmetic:TB.2

Skeleton inclusion and retraction for split semistable curves over a complete discretely valued field not assumed algebraically closed, with finite-Galois descent and unit edge normalization. The existing TB.2 skeleton nodes assume an algebraically closed base and are insufficient as stated.

**Consumers:** [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure).

### Request 17: TropicalAndBerkovichArithmetic:TB.6

Model metric and Chambert-Loir Chern measure comparison c₁(O(f))=−i*(Δf) for norm ‖1‖=eK^(−f∘r), including finite-extension normalization and approximation of graph functions.

**Consumers:** [Explicit admissible skeleton measure](#target-gz-2-explicit-skeleton-measure).

### Request 18: AutomorphicSpectralTheory:AS.4

The compact Riemann-surface Green operator with logarithmic singularity, zero-mean inverse of ddᶜ on zero-mass currents, self-adjointness and smooth off-diagonal regularity; holomorphic one-form hermitian pairing.

**Consumers:** [Arakelov probability form](#target-gz-2-arakelov-probability-form), [Complex admissible metric existence](#target-gz-2-admissible-metric-existence), [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green).

**Audit:** R1-projections.

### Request 19: AutomorphicSpectralTheory:AS.4

Petersson projection onto parallel-weight-two cuspidal forms in each central-character component, its pairing characterization, the regularized Whittaker integral formula and growth hypotheses used by YZZ Proposition6.12. Apply under the two-split-place assumption; do not assume the derivative is square integrable without that growth argument.

**Consumers:** [Projected derivative decomposition](#target-gz-6-colmez-projected-derivative), [Archimedean holomorphic projection of log δ∞·W^(2)](#target-gz-6-colmez-rev-archimedean-holomorphic-projection-of-log).

**Audit:** R1-projections.

### Request 20: GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan

Existing local/adelic GL₂ Iwasawa decomposition, upper-triangular modulus δ_B(diag(a,d))=|a/d| and real positive diagonal convention. GZ.6 defines δ=δ_B^(1/2), the real phase ρ∞, and proves its lower-unipotent identity in the pseudo-theta comparison.

**Consumers:** [Pseudo-theta comparison on a small bad-place compact](#target-gz-6-colmez-pseudo-comparison), [Mixed theta–Eisenstein kernel](#target-gz-6-mixed-theta-eisenstein).

### Request 21: MetaplecticAutomorphicForms:MP.5

Extended Weil action r(g,(t₁,t₂)) on S̄(V×A×), its Gaussian real factors, orthogonal-direct-sum factorization, complement discriminant characters, Fourier/Hecke action and theta convergence for the unit-quotient positive-definite and incoherent quaternionic data.

**Consumers:** [Pseudo-theta datum](#target-gz-6-colmez-pseudo-theta), [Pseudo-theta comparison on a small bad-place compact](#target-gz-6-colmez-pseudo-comparison), [Mixed theta–Eisenstein kernel](#target-gz-6-mixed-theta-eisenstein), [Special test function and integral j](#target-gz-7-colmez-test-function), [Nonzero associated weight-one theta](#target-gz-7-colmez-nonzero-theta).

### Request 22: AutomorphicSpectralTheory:AS.2

Meromorphic Eisenstein/Green-resolvent families and Legendre Q_s(t)=∫₀∞(t+√(t²−1)cosh u)^(−1−s)du, t>1; the CM Green sum initially convergent for Re s>0 with simple-pole continuation at zero. Include zero/nonzero Whittaker branch intertwiner continuation.

**Consumers:** [Mixed theta–Eisenstein kernel](#target-gz-6-mixed-theta-eisenstein), [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Archimedean derivative kernel](#target-gz-7-colmez-rev-archimedean-derivative-kernel).

### Request 23: AutomorphicLFunctionsAndLocalFactors:AL.1

Local additive-character different and self-dual measures, Weil-index/L-factor normalizations, quadratic norm cosets including wild ramification and representation-density Whittaker shell formula. The local norm-congruence shell counts require exact quadratic norm lattices, Haar shell volumes, wild different exponents and finite-support estimates. These are requested extensions of the local quadratic-character/density interface; RP.2 Brauer–Manin evaluation does not supply them.

**Consumers:** [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), [Local Whittaker series for incoherent sections](#target-gz-6-colmez-rev-local-whittaker-series-for-incoherent).

**Audit:** R1-partial-1.

### Request 24: ComplexMultiplicationAndExplicitReciprocity:CM.5

Gross canonical/quasicanonical lifting with endomorphism filtration O_E+π_E^(m−1)O_B, and wild norm conductor v(D); derive the corrected half-valuation ramified CM multiplicity. Distinguish this reusable deformation input from GZ’s weighted height series.

**Consumers:** [Corrected CM multiplicity at 𝔹-split, E-nonsplit places](#target-gz-7-colmez-rev-corrected-cm-multiplicity-at-split), [Supersingular inert local intersection](#target-gz-7-colmez-local-m-inert), [Wild-inclusive ramified local intersection](#target-gz-7-colmez-local-m-ramified).

**Audit:** R1-CM-lifts.

### Request 25: HeegnerPointEulerSystems:HE.2

CM-point reduction and ordinary intersection multiplicities on quaternionic Shimura curves: Zhang’s upper/lower-unipotent formula, plus compatibility with finite-level projection and residue-prime weights.

**Consumers:** [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity).

**Audit:** R1-ordinary-intersections.

### Request 26: HilbertModularVarietiesAndShimuraCurves:R18.5

Finite-level CM class quotient, field-of-definition reciprocity and unramifiedness above division places; compact coarse Q-factorial integral models after permitted unramified base change; chosen maximal order containing O_E; regular small-away-v covers with U′v=Uv and stabilizer multiplicity e; split-fibre component decomposition.

**Consumers:** [Finite CM orbit average](#target-gz-6-colmez-torus-average), [Special test function and integral j](#target-gz-7-colmez-test-function), [Vertical correction vanishes at B-split places](#target-gz-7-colmez-vertical-split-zero), [Geometric realization of extended self-intersection](#target-gz-7-colmez-modified-projection), [Hodge-class terms vanish and the height series splits into horizontal and vertical parts](#target-gz-6-colmez-rev-hodge-class-terms-vanish-and).

**Audit:** R1-partial-12.

### Request 27: HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation

Čerednik–Drinfeld formal/integral upper-half-plane uniformization at division places, components GL₂(Fv)/Fv×GL₂(Ov), their local intersections and CM fixed sections; conventions for nearby B(v).

**Consumers:** [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Superspecial multiplicity by uniformization](#target-gz-7-colmez-superspecial-m), [Vertical correction is nonsingular pseudo-theta](#target-gz-7-colmez-vertical-pseudo), [Extended local diagonal vanishes at small away-v level](#target-gz-7-colmez-small-level-diagonal).

**Audit:** R1-partial-12.

### Request 28: HeightsRationalPointsAndObstructions:RP.0

Canonical Jacobian height for 2Θ, positivity modulo torsion and complex Hermitian extension; specialize the general ample canonical-height machine, without redefining it in GZ.

**Consumers:** [Hecke height-series cuspidality](#target-gz-6-classical-height-series-cuspidality), [Relative-field height comparison](#target-gz-0-classical-relative-field-heights), [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Tangent product formula](#target-gz-7-classical-tangent-product-formula), [Local intersection height comparison](#target-gz-2-classical-local-intersection-height).

**Audit:** R1-partial-2.

### Request 29: HeegnerPointEulerSystems:HE.1

Ideal-class CM points and Hecke correspondences on X₀(N), field-of-definition and Artin reciprocity with the source ideal-inverse convention. Extend the existing HE.1 non-exceptional classical interface to D=−3 and D=−4 where needed, retaining automorphism stabilizers rather than silently imposing u=1.

**Consumers:** [CM Hecke disjointness criterion](#target-gz-6-classical-disjointness), [CM action convention comparison](#target-gz-0-classical-cm-action-conventions), [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [Archimedean CM height sum](#target-gz-2-classical-archimedean-height-sum), [CM Eisenstein sum](#target-gz-7-classical-cm-eisenstein-sum), [Finite CM intersection height](#target-gz-7-classical-finite-intersection-height), [Definite period specialization](#target-gz-5-classical-definite-period-announcement), [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention).

**Audit:** R1-extra-units.

### Request 30: AbelianSchemesAndArithmeticModuli:A6

Hom/End of chosen cyclic N-isogeny diagrams over complete local and Artinian bases; degree equality, finite positive-degree fibres, free sign action and faithful stabilizer action. Do not assert choice-independent Hom for arbitrary coarse Artinian points with extra automorphisms.

**Consumers:** [Half Hom count](#target-gz-7-classical-half-hom-count), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Prime-to-p Hom decomposition](#target-gz-7-classical-prime-to-p-hom-count), [CM Hom quaternion realization](#target-gz-7-classical-hom-quaternion-realization).

**Audit:** R1-diagrams.

### Request 31: HeegnerPointEulerSystems:HE.2

Quasicanonical CM lifting/isogeny intersection calculation over W, including the prime-to-p degree decomposition and the valuation normalization used in the classical Hom sum.

**Consumers:** [Degree-one CM intersection count](#target-gz-7-classical-degree-one-intersection), [Supersingular Eichler realization](#target-gz-7-classical-supersingular-eichler-order), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [CM Hom intersection count](#target-gz-7-classical-hom-intersection-count), [Half Hom count](#target-gz-7-classical-half-hom-count), [Diagram isomorphism intersection count](#target-gz-7-classical-isomorphism-intersection-count), [New automorphism length](#target-gz-7-classical-new-automorphism-length).

**Audit:** R1-ordinary-intersections.

### Request 32: ComplexMultiplicationAndExplicitReciprocity:CM.5

Exact negative-norm coset/congruence lifting count in the quaternionic CM deformation order, including ramified and dyadic ranges.

**Consumers:** [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Split CM intersection vanishing](#target-gz-7-classical-split-vanishing), [CM endomorphism congruence order](#target-gz-7-classical-endomorphism-congruence-order), [Inert disjoint intersection formula](#target-gz-7-classical-inert-disjoint-intersection), [Ramified disjoint intersection formula](#target-gz-7-classical-ramified-disjoint-intersection), [New automorphism length](#target-gz-7-classical-new-automorphism-length), [Special j tangent values](#target-gz-7-classical-j-tangent-values), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model).

**Audit:** R1-CM-lifts.

### Request 33: ComplexMultiplicationAndExplicitReciprocity:CM.5

Canonical ordinary CM lifting and fullness of reduction on CM Hom/End; prove the classical new-Hom vanishing at split places.

**Consumers:** [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Split CM intersection vanishing](#target-gz-7-classical-split-vanishing), [CM endomorphism congruence order](#target-gz-7-classical-endomorphism-congruence-order), [Inert disjoint intersection formula](#target-gz-7-classical-inert-disjoint-intersection), [Ramified disjoint intersection formula](#target-gz-7-classical-ramified-disjoint-intersection), [New automorphism length](#target-gz-7-classical-new-automorphism-length), [Special j tangent values](#target-gz-7-classical-j-tangent-values), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model).

**Audit:** R1-CM-lifts.

### Request 34: MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances

Quaternionic norm-positive/anti-linear decomposition compatible with the embedded K and reduced norm, including norm/degree ratio for connecting Hom ideals.

**Consumers:** [Hyperbolic norm parameter](#target-gz-7-classical-hyperbolic-norm-parameter), [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [Inert norm-ideal map](#target-gz-7-classical-inert-norm-ideal-map), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model).

**Audit:** R1-partial-6.

### Request 35: ComplexMultiplicationAndExplicitReciprocity:CM.5

Gross canonical-lift endomorphism filtration over W/π^n, in the source uniformizer convention; distinguish inert and ramified lengths and state the dyadic exceptions.

**Consumers:** [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Split CM intersection vanishing](#target-gz-7-classical-split-vanishing), [CM endomorphism congruence order](#target-gz-7-classical-endomorphism-congruence-order), [Inert disjoint intersection formula](#target-gz-7-classical-inert-disjoint-intersection), [Ramified disjoint intersection formula](#target-gz-7-classical-ramified-disjoint-intersection), [New automorphism length](#target-gz-7-classical-new-automorphism-length), [Special j tangent values](#target-gz-7-classical-j-tangent-values), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model).

**Audit:** R1-CM-lifts.

### Request 36: ComplexMultiplicationAndExplicitReciprocity:CM.5/supersingular-curve-versus-level-pair

The actual supersingular curve and cyclic-level-pair endomorphism orders, maximal versus Eichler with discriminants p versus Np, and their tracked reduced optimal CM embeddings. GZ.7 proves the connecting Hom ideal identities and orientation-sensitive coefficient ratio.

**Consumers:** [Supersingular Eichler realization](#target-gz-7-classical-supersingular-eichler-order), [Inert CM Hom lattice](#target-gz-7-classical-inert-hom-lattice).

**Audit:** R1-CM-lifts.

### Request 37: AnalyticNumberTheory:AN.4

Genus characters of the ideal class group, ordered fundamental discriminant factorizations, quadratic character evaluations and theta transformation under ramified ideals.

**Consumers:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [Quadratic-pair representation count](#target-gz-7-classical-pair-count), [Ramified-congruence pair count](#target-gz-7-classical-ramified-congruence-count), [Genus pair count](#target-gz-7-classical-genus-pair-count), [Genus-character filter](#target-gz-7-classical-genus-character-filter), [Inert-prime height sum](#target-gz-7-classical-inert-height-sum), [Inert unit-orbit count](#target-gz-7-classical-inert-unit-count), [Ramified-prime height sum](#target-gz-7-classical-ramified-height-sum), [Genus-character factorization](#target-gz-0-classical-genus-character-factorization), [Ramified theta reindexing](#target-gz-6-classical-ramified-theta-reindexing), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), [Genus-sign reversal](#target-gz-6-classical-genus-sign-reversal), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Different ideal reindexing](#target-gz-6-classical-different-reindexing), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity), [Logarithmic prime decomposition](#target-gz-6-classical-logarithmic-prime-decomposition), [Central-value genus-sum filter](#target-gz-5-classical-genus-sum-filter).

**Audit:** R1-genus.

### Request 38: AnalyticNumberTheory:AN.4

The norm representation and genus criterion with Nn+l≡0 mod D and l a norm from the specified class. This hypothesis is necessary for the divisor complement identities.

**Consumers:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [Quadratic-pair representation count](#target-gz-7-classical-pair-count), [Ramified-congruence pair count](#target-gz-7-classical-ramified-congruence-count), [Genus pair count](#target-gz-7-classical-genus-pair-count), [Genus-character filter](#target-gz-7-classical-genus-character-filter), [Inert-prime height sum](#target-gz-7-classical-inert-height-sum), [Inert unit-orbit count](#target-gz-7-classical-inert-unit-count), [Ramified-prime height sum](#target-gz-7-classical-ramified-height-sum), [Genus-character factorization](#target-gz-0-classical-genus-character-factorization), [Ramified theta reindexing](#target-gz-6-classical-ramified-theta-reindexing), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), [Genus-sign reversal](#target-gz-6-classical-genus-sign-reversal), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Different ideal reindexing](#target-gz-6-classical-different-reindexing), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity), [Logarithmic prime decomposition](#target-gz-6-classical-logarithmic-prime-decomposition), [Central-value genus-sum filter](#target-gz-5-classical-genus-sum-filter).

**Audit:** R1-genus.

### Request 39: AutomorphicSpectralTheory:AS.4

Regularized Petersson holomorphic projection in weight two with logarithmic cusp growth, Fourier Mellin finite parts, continuation bounds and orthogonality of boundary Eisenstein families.

**Consumers:** [Logarithmic weight-two projection](#target-gz-6-classical-holomorphic-projection).

**Audit:** R1-projections.

### Request 40: HeegnerPointEulerSystems:HE.1

The field-of-definition and complex conjugation of classical Heegner points and their modular images, in the source Artin/Fricke convention.

**Consumers:** [Quadratic-twist real-period comparison](#target-gz-0-classical-twist-real-period).

**Audit:** R1-extra-units.

### Request 41: AutomorphicLFunctionsAndLocalFactors:AL.3

Identify the arithmetic ideal-class character sum with the GL₂/K base-change Rankin L-function, including every p|N Euler factor and the arithmetic weight-2k shift s↦s−k+1/2. Supply its analytic continuation and exact completed gamma factors. Include the arithmetic-to-unitary coefficient normalization and absolute convergence for Re(s)>k+1/2, for both the ideal-class series and character Euler product, with the ideal-count bound r_A(n)≪_ε n^ε and a strict convergence margin.

**Consumers:** [Classical Rankin normalization](#target-gz-0-classical-rankin-normalization), [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [Rankin absolute convergence](#target-gz-6-classical-absolute-convergence).

**Audit:** R1-epsilon, R1-partial-1.

### Request 42: AnalyticNumberTheory:AN.4

Integral ideal counts by class/norm, finite Fourier inversion, ordered discriminant genus characters, norm/genus congruence criterion and the corrected prime-log decomposition. The genus/sign inputs are general arithmetic; GZ owns only the coefficient/kernel formulas consuming them.

**Consumers:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity), [Logarithmic prime decomposition](#target-gz-6-classical-logarithmic-prime-decomposition), [Genus pair count](#target-gz-7-classical-genus-pair-count), [Inert unit-orbit count](#target-gz-7-classical-inert-unit-count).

**Audit:** R1-genus.

### Request 43: AutomorphicSpectralTheory:AS.2

Scalar level-N weight-one-character Eisenstein families and their zero/nonzero Fourier coefficients; hyperbolic Legendre resolvent with eigenvalue s(s−1), residue −12/[SL₂(ℤ):Γ₀(N)], cusp continuation and CM evaluation. Keep PSL₂ quotient, cusp widths, phases and squared-log normalization explicit.

**Consumers:** [Resolvent cusp expansion](#target-gz-7-classical-cusp-expansion), [CM Eisenstein sum](#target-gz-7-classical-cm-eisenstein-sum), [Eisenstein zero coefficient](#target-gz-6-classical-eisenstein-zero-coefficient), [Eisenstein nonzero coefficient](#target-gz-6-classical-eisenstein-nonzero-coefficient).

### Request 44: MetaplecticAutomorphicForms:MP.5

Classical ideal-class theta series of weight one and character ε, constant r_A(0)=1/w, their ramified cusp transforms and the half-integral-weight/GL₂ theta correspondence used by the arithmetic Rankin kernel.

**Consumers:** [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [Classical Rankin unfolding](#target-gz-6-classical-rankin-unfolding), [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel), [Ramified theta reindexing](#target-gz-6-classical-ramified-theta-reindexing), [Different ideal reindexing](#target-gz-6-classical-different-reindexing).

### Request 45: ModularCurvesPartII:R12.5

Hecke algebra/Fourier coefficient perfect pairing for weight-two cuspidal forms and the Jacobian, trace adjunction, newform orthogonal projection and prime-to-level detection on the newform subspace.

**Consumers:** [Hecke height-series cuspidality](#target-gz-6-classical-height-series-cuspidality), [Classical trace adjunction](#target-gz-6-classical-trace-adjunction), [Prime-to-level newform detection](#target-gz-6-classical-prime-to-level-detection), [Boundary Eisenstein orthogonality](#target-gz-6-classical-boundary-eisenstein-orthogonality).

### Request 46: HeightsRationalPointsAndObstructions:RP.0

Local Néron symbols for degree-zero divisors, with principal-divisor law, tangent extension at common support and its parameter-change law; regular-model comparison with −intersection·log(q_v); relative field-height comparison.

**Consumers:** [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Tangent product formula](#target-gz-7-classical-tangent-product-formula), [Local intersection height comparison](#target-gz-2-classical-local-intersection-height), [Relative-field height comparison](#target-gz-0-classical-relative-field-heights).

**Audit:** R1-partial-2.

### Request 47: AutomorphicLFunctionsAndLocalFactors:AL.0

Generic special-function realization of the terminating polynomial p_(k−1)(t)=Σ_(r=0)^(k−1) binom(k−1,r)(−t)^r/r! and the decaying q_(k−1)(t)=∫₁∞(x−1)^(k−1)x^(−k)e^(−xt)dx, with gamma/Mellin/Legendre continuation identities and permitted differentiation. Confirm the polynomial source normalization before choosing a pinned polynomial API.

**Consumers:** [Integral Rankin kernel values](#target-gz-6-classical-integral-kernel-values), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Rankin Mellin regularization](#target-gz-6-classical-rankin-mellin-regularization).

**Audit:** R1-special-functions.

### Request 48: MetaplecticAutomorphicForms:MP.7

Baruch–Mao 2010 Theorems1.2,1.4, the Kohnen-plus Maass eigenline correspondence including its Hecke operator at 2, and the local real/2-adic Whittaker-normalization comparison. DIT’s unit half-weight vector uses coefficient b(d) and factor 12π; the corresponding GL₂ parameter is r and the half-weight parameter r/2.

**Consumers:** [Half-weight Waldspurger value](#target-gz-5-half-weight-waldspurger-value).

**Audit:** R1-partial-6.

### Request 49: AutomorphicLFunctionsAndLocalFactors:AL.3

Finite Maass twist L(s,φ⊗χ_d), its ramified Euler factors and both signed real gamma factors; distinguish its finite Dirichlet series from the completed automorphic L-function.

**Consumers:** [Half-weight Waldspurger value](#target-gz-5-half-weight-waldspurger-value).

**Audit:** R1-epsilon, R1-partial-1.

### Request 50: tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

Dual graph of a semistable fibre, vertex component genera and residue-field/Galois action; incidence valences and bridge/loop convention compatible with the metrized graph.

**Consumers:** [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure).

### Request 51: tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces

Finite arithmetic-surface intersection of horizontal and vertical Cartier divisors, projection formula, vertical intersection matrix with kernel the total fibre; admissible vertical correction modulo that fibre.

**Consumers:** [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension), [Geometric realization of extended self-intersection](#target-gz-7-colmez-modified-projection).

### Request 52: tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

Regular/minimal proper curve models over complete and number-field DVRs, finite-level model changes, blow-up invariance of the corrected degree-zero pairing.

**Consumers:** [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing).

### Request 53: tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction

Semistable reduction and base change of component/intersection data, including non-split Galois descent and edge-length change by ramification.

**Consumers:** [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension), [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure).

### Request 54: tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property

Jacobian Pic⁰ and Abel–Jacobi map over the actual ground field, descent for rational degree-one divisor classes, normalized Hodge class ξ and compatibility with Hecke correspondences.

**Consumers:** [Faltings–Hriljac comparison](#target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions), [Rational ξ-normalized realization](#target-gz-3-rational-xi-realization), [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class).

### Request 55: HeegnerPointEulerSystems:HE.0

The imaginary quadratic order, its ideal-class group and Hilbert/ring-class extension, with Artin reciprocity in the inverse-ideal convention used here. This supplies order and class-field data; the CM-point and Hecke construction is separately requested from HE.1.

**Consumers:** [CM action convention comparison](#target-gz-0-classical-cm-action-conventions), [Archimedean CM height sum](#target-gz-2-classical-archimedean-height-sum), [Definite period specialization](#target-gz-5-classical-definite-period-announcement), [CM Hecke disjointness criterion](#target-gz-6-classical-disjointness), [CM Eisenstein sum](#target-gz-7-classical-cm-eisenstein-sum), [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), [Finite CM intersection height](#target-gz-7-classical-finite-intersection-height), [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention).

### Request 56: ModularCurvesPartII:R12.5

Weight-two differentials on the compactified modular curve and the differential/q-expansion comparison at the chosen cusp; GZ.3 owns the Manin-constant comparison with the Néron differential.

**Consumers:** [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Manin constant](#target-gz-3-manin-constant), [Modular cusp and boundary correction](#target-gz-7-boundary-cusp-correction).

### Request 57: ModularCurvesPartII:R13.3

Tate-curve cusp charts, cusp widths, stabilizer actions and the local differential/discriminant data on the integral level model.

**Consumers:** [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Manin constant](#target-gz-3-manin-constant), [Modular cusp and boundary correction](#target-gz-7-boundary-cusp-correction), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height).

### Request 58: ModularCurvesPartII:R13.4a

Compactified coarse X₀(N), coarse stabilizer multiplicities and descent of the relevant generic line data.

**Consumers:** [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Manin constant](#target-gz-3-manin-constant), [Modular cusp and boundary correction](#target-gz-7-boundary-cusp-correction), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height).

**Audit:** R1-partial-4.

### Request 59: ModularCurvesPartII:R14.6

Bad-prime integral differential extension and patching for the modular parametrization. Combined with the exact Raynaud uniqueness input already requested, this supplies the integral-model hypotheses used in the Manin integrality and modular-degree arguments; it does not supply a Hodge line.

**Consumers:** [Integral Manin constant and p-unit range](#target-gz-3-manin-integrality-and-p-unit), [Manin constant and modular degree](#target-gz-3-manin-degree-divisibility).

**Audit:** R1-bad-differentials.

### Request 60: AutomorphicFormsOnReductiveGroups:AF.2

Adelic/classical comparison and restricted tensor factorization in the exact central-character and parallel-weight-two constituent.

**Consumers:** [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison).

### Request 61: AutomorphicFormsOnReductiveGroups:AF.3

Petersson pairing of cuspidal weight-two forms with the specified unnormalized and Tamagawa Haar measures and rapid decay.

**Consumers:** [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison).

**Audit:** R1-partial-8.

### Request 62: ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism

The Hecke-equivariant weight-two modular-curve Hodge/Betti comparison, with its i-orientation and integral lattice.

**Consumers:** [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison).

### Request 63: ModularCurvesPartII:R14.3/cup-product-petersson

The existing cup-product/Petersson comparison on X₁(N), including its 4π factor and pairing orientation.

**Consumers:** [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison).

### Request 64: ModularCurvesPartII:R14.2/jacobian-and-functoriality

The existing Pic⁰/Jacobian functoriality and dual pullback/push-forward for modular curves, including degree multiplicity.

**Consumers:** [Picard-valued generating series](#target-gz-6-picard-generating-series).

### Request 65: ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian

The existing Jacobian Hecke and diamond operations with their pullback/Albanese conventions and Néron extension.

**Consumers:** [Picard-valued generating series](#target-gz-6-picard-generating-series).

### Request 66: AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic

The existing scalar classical-to-adelic GL₂ weight/character/level passage, including moderate-growth conditions and the chosen slash action. Include nonholomorphic functions with polynomial growth at every cusp, not just cuspidal or holomorphic forms; use AS.3 for the corresponding Petersson-integrability/growth estimates.

**Consumers:** [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel).

**Audit:** R1-partial-8.

### Request 67: AutomorphicFormsOnReductiveGroups:AF.2/adelic-classical-bijection

The existing inverse classical/adelic function-space comparison with the exact central character and level.

**Consumers:** [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel).

### Request 68: ModularCurvesPartII:R13.1

Compactification by generalized elliptic curves and cyclic level diagrams with their cusp extension.

**Consumers:** [Marked Green height characterization](#target-gz-7-classical-height-green-characterization), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [Trace coset classification](#target-gz-6-classical-trace-coset-classification), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height).

### Request 69: ModularCurvesPartII:R13.3

Tate cusp charts and stabilizer-aware local integral level models, with cusp widths and local parameters.

**Consumers:** [Marked Green height characterization](#target-gz-7-classical-height-green-characterization), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [Trace coset classification](#target-gz-6-classical-trace-coset-classification).

### Request 70: ModularCurvesPartII:R13.4a

The compactified coarse integral modular curve with the stated smoothness/normality and stabilizer quotient hypotheses.

**Consumers:** [Marked Green height characterization](#target-gz-7-classical-height-green-characterization), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [Trace coset classification](#target-gz-6-classical-trace-coset-classification).

**Audit:** R1-partial-4.

### Request 71: ModularCurvesPartII:R13.4b

Comparison of the compactified coarse model with the generic modular curve and its integral local charts.

**Consumers:** [Marked Green height characterization](#target-gz-7-classical-height-green-characterization), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [Trace coset classification](#target-gz-6-classical-trace-coset-classification), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height).

### Request 72: GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification

Actual nonarchimedean irreducible admissible GL₂ representations and their generic/essentially-square-integrable classification, including residue characteristic two.

**Consumers:** [Local toric functional space](#target-gz-4-toric-hom-space).

**Audit:** R1-partial-5.

### Request 73: GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison

Existing local quaternionic Jacquet–Langlands, central characters, norm twists and split/elliptic character signs.

**Consumers:** [Local toric functional space](#target-gz-4-toric-hom-space).

**Audit:** R1-partial-5.

### Request 74: GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison

Existing real discrete-series/quaternionic comparison including the norm twist and matching central character.

**Consumers:** [Local toric functional space](#target-gz-4-toric-hom-space).

**Audit:** R1-partial-5.

### Request 75: AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension

Existing algebraic Mumford map and double-rigidified biextension with additivity in both factors and pullback law.

**Consumers:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing).

**Audit:** R1-partial-3.

### Request 76: AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph

Existing graph pullback of Poincaré with φ_M=2λ, supplying the factor-two polarization comparison without choosing a global representative.

**Consumers:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing).

**Audit:** R1-partial-3.

### Request 77: tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Use its full real period Ω(E)=2∫_{D_W>0} dx/√D_W on the reduced minimal model over ℚ, including finiteness and the fixed equation differential. GZ.0 proves the identity-component comparison and c∞ factor; these are not claimed as existing exports of Layer7.

**Consumers:** [Full real period, identity-component period and c∞](#target-gz-0-real-period-components).

### Request 78: AutomorphicPadicLFunctions:L3h

Export the F = ℚ, n⁻ = 1 specialisation of Hsieh's square-root distribution as Castella–Hsieh's measure L_{p,ψ}(f) on Γ̃ = Gal(K_{p^∞}/K) with coefficients in R, with its interpolation formula (Castella–Hsieh Proposition 3.8) including the factors 2^{#A(ψ)+3}, c_o, ε(f), u_K², √D_K and φ(𝔑^{-1}), and its extension to p-new f (Euler factor 1 − a_p p^{-1} φ(𝔭), 𝔭 the prime above p fixed by ι_p). GZ.9 squares it; it does not construct it.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality).

**Audit:** R1-partial-9.

### Request 79: AutomorphicPadicLFunctions:L0

Define the completed fixed central-critical tame branch for finite type (c,𝔑,ε_f), p-adic/algebraic avatars, fixed auxiliary character ψ and twisting by ψ^{-1}. Export pushforward Γ̃→Γ with evaluation ev_φ(pushforward Tw_{ψ^{-1}} μ)=ev_{ψ^{-1}(φ∘q)} μ. A ring-class character of prime-to-p conductor c need not factor through Γ; transport the c=1 trivial specialization explicitly. Compare Skinner’s geometric Artin convention (published p.342) with this packet’s arithmetic convention by inversion, including the selected p-place.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula), [Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions](#target-gz-9-imprimitive-function-dictionary).

**Audit:** R1-partial-9.

### Request 80: AutomorphicPadicLFunctions:L3

CM periods: the complex period Ω_∞ and the p-adic (Serre–Tate / formal-group) period Ω_p ∈ R^× of an elliptic curve with CM by O_K at a split prime, their dependence on the trivialisation of the formal group, and the algebraicity of the CM values of nearly holomorphic forms via the unit-root splitting at ordinary CM points.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula).

**Audit:** R1-partial-9.

### Request 81: PadicMeasuresIwasawaAlgebras:L1

For R = Ô^ur, the completed maximal unramified extension of the coefficient ring: pushforward of bounded R-valued measures along the fixed reciprocity chart, twisted finite sums, convolution, and the identification of R⟦Γ⟧ with R⟦T⟧ after choosing a generator of Γ. Character evaluation as a ring map is cited as L1/character-integral-algebra-hom; the Amice correspondence is requested from L2.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality).

**Audit:** R1-partial-10.

### Request 82: PadicHodgeRegulators:L1

For an abelian variety with semistable (not good) reduction over a finite extension of ℚ_p — here J₀(N) at p ∥ N — the Bloch–Kato identification log_BK ∘ κ = log_A on A(K_v) ⊗ ℚ_p (Bloch–Kato Example 3.10.1), used to identify Castella's AJ_F with the formal logarithm. The good-reduction case is cited as L1/abelian-variety-logarithm.

**Consumers:** [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula).

**Audit:** R1-semistable-BK.

### Request 83: NeronModelsAndSemistableAbelianVarieties:R11.1

For the p-optimal connected-kernel quotient J → A of JSW Proposition 5.1.7, the BLR statement that the Néron cotangent lattice ω_𝒜 (R11.1/differential-lattice) pulls back to a saturated direct summand of ω_𝒥. The p-adic logarithm itself is cited as EffectiveDiophantineMethods:ED.4/abelian-logarithm.

**Consumers:** [The formula for a p-optimal quotient](#target-gz-9-p-optimal-quotient-formula).

**Audit:** R1-cotangent.

### Request 84: ColemanIntegration:L1

Propose Coleman integration, Part II: semistable Abel–Jacobi integration, extending L1 by rigid/semistable integration on p-new modular curves and the r=j=0 case used by Castella Theorem 2.11. The Part II export, not L1’s existing good-reduction statement, is required at p∥N. The good-reduction Coleman/abelian-integral comparison is cited as EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison.

**Consumers:** [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula).

**Audit:** R1-semistable-integration.

### Request 85: GL2AutomorphicRepresentationsAndTransfer:R17.3

Propose GL2 automorphic representations and transfer, Part II: integral Jacquet–Langlands lattices, for the primitive p-integral differential nonzero modulo p and the compatibility of its lattices under chosen transfer. This extra claim does not follow from the current rational-structure export. Rational transfer, local factors and rational models are cited as R17.3/global-jl, R17.3/local-factors and R17.3/rational-models.

**Consumers:** [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction).

**Audit:** R1-integral-JL, R1-partial-5.

### Request 86: AutomorphicLFunctionsAndLocalFactors:AL.3

For GL₂ over a totally real F and a CM extension K/F: the base-change Rankin L-function L(s, π_K ⊗ χ) with analytic continuation, functional equation and local root numbers ε(1/2, π_{K,v} ⊗ χ_v); the Rankin–Selberg-over-F root numbers and their comparison ε_RS = η_v(−1) ε_BC (Langlands λ-factor); the adjoint L-value L(1, π, ad); and the relation L(f, ψ^alg, s) = L(π_K × ψ^alg, s − 1/2). Also export the completed Hecke L-function L(s, η) of a CM extension K/F, with ζ_K = ζ_F·L(s, η) including archimedean factors, used in CST Lemma 2.3. Rankin–Selberg continuation and the unitary/motivic shift are cited as AL.3/rs-global-functional-equation and AL.3/motivic-unitary-shift.

**Consumers:** [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number), [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character](#target-gz-8-rational-shimura-curve-heegner-formula), [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Corollaries on derivatives: positivity and Galois invariance](#target-gz-8-derivative-corollaries).

**Audit:** R1-epsilon, R1-partial-1.

### Request 87: AutomorphicGaloisRepresentations:R19.1

The Ramanujan–Petersson bound |σ(a_p)| ≤ 2√p for weight-two newforms at p ∤ N, or equivalently ∏_σ (1 + p − σ(a_p)) = #Ã_f(𝔽_p) for the Eichler–Shimura abelian variety, giving 1 + p − a_p ≠ 0.

**Consumers:** [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point).

**Audit:** R1-partial-13.

### Request 88: tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

The Hasse bound and a_p = p + 1 − #Ẽ(𝔽_p) for an elliptic curve with good reduction at p, so that 1 + p − a_p = #Ẽ(𝔽_p) ≥ 1.

**Consumers:** [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point).

### Request 89: DiophantineApproximationAndTranscendence:DT.3

Propose Diophantine approximation and transcendence, Part II: abelian p-adic analytic subgroup theorems. Extend the read DT.3 scope to the actual algebraic-point theorem in BSW Theorems 3.1–3.2 and its eigenlogarithm consequences Theorems 1.1 and 2.8(i), with dim A=[F:Q], a real embedding of F, and totally real E for the Serre tensor character-twisted point. GZ.9 imports this theorem and proves only its modular-quotient specialization.

**Consumers:** [Heegner points have nonzero logarithm in every eigencomponent](#target-gz-9-eigenlogarithm-nonvanishing).

**Audit:** R1-subgroups.

### Request 90: HilbertModularVarietiesAndShimuraCurves:R18.2

Integral quaternionic Shimura models and CM sections; the formal Poincaré trivializations are imported separately from AbelianSchemesAndArithmeticModuliPartII P4. Full Serre–Tate coordinates, scalar theta trivializations and descent of the actual Brooks moments are still a precise compatibility gap.

**Consumers:** [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula), [The quaternionic weight-two formula of Brooks and JSW](#target-gz-9-quaternionic-weight-two-formula), [The formula for a p-optimal quotient](#target-gz-9-p-optimal-quotient-formula).

**Audit:** R1-ordinary-moments.

### Request 91: tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor

The Atkin–Lehner main lemma at level Γ₀(N): a weight-two cusp form whose q-expansion coefficients vanish at every index prime to N is old. The old/new decomposition, newforms and strong multiplicity one are cited as pinned declarations (TauCeti.cuspFormsOld, TauCeti.cuspFormsNew, HeckeRing.GL2.Newform and its strong multiplicity one).

**Consumers:** [The main identity on X₀(N): heights as Fourier coefficients](#target-gz-8-coefficient-identity).

### Request 92: tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality

Existing upstream coefficient fields and Galois stability of newforms/Hecke projectors; identify conjugated forms and coefficient realizations in the low-order corollaries.

**Consumers:** [The main identity on X₀(N): heights as Fourier coefficients](#target-gz-8-coefficient-identity), [Corollaries on derivatives: positivity and Galois invariance](#target-gz-8-derivative-corollaries).

### Request 93: PadicMeasuresIwasawaAlgebras:L2

Surjectivity of the Amice transform for R = Ô^ur: every element of R⟦T⟧ is the transform of a bounded R-valued measure on ℤ_p. Mathlib has the transform, its injectivity over complete ultrametric R and the equivalence only for ℤ_p coefficients. Include restriction of support to 1 + pℤ_p and translation by group-like elements, used for Burungale's integral Serre–Tate moment measures.

**Consumers:** [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality).

**Audit:** R1-partial-10.

### Request 94: PadicMeasuresIwasawaAlgebras:L4

Weierstrass preparation and the factorisation f = ϖ^μ·F·u in O⟦T⟧ for a complete DVR O whose residue field may be infinite (O = Ô^ur); L4/nonzero-power-series-factorization assumes a finite residue field.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison).

**Audit:** R1-partial-10.

### Request 95: HeegnerPointEulerSystems:HE.1

Extend HE.1/cm-cyclic-isogeny-pair to D_K ∈ {−3, −4}: the cyclic N-isogeny C/a → C/𝔑_c⁻¹a and its X₀(N)(H_c) point need no restriction on units; record the extra automorphisms that change u = [O_c^× : ℤ^×].

**Consumers:** [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [The main identity on X₀(N): heights as Fourier coefficients](#target-gz-8-coefficient-identity).

**Audit:** R1-extra-units.

### Request 96: AbelianSchemesAndArithmeticModuliPartII:P4

Use ordinary-infinitesimal-trivialization and translation-trivialization for the completed Poincaré line, including the ordinary CM-type and prime-to-p torsion hypotheses. Compare those exports with the scalar automorphic line and Serre–Tate moment construction used by Brooks; P4 alone does not assert that comparison.

**Consumers:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality).

**Audit:** R1-ordinary-moments.

### Request 97: GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing

Extend the paired bilinear character components to the Rosati/conjugate-dual Hermitian comparison and prove positivity in each coefficient embedding for arbitrary finite χ. The accepted target supplies bilinearity and orthogonality only; this extension is a recorded gap, not an available positivity theorem.

**Consumers:** [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion).

**Audit:** R2-Hermitian.

### Request 98: GrossZagierAndArithmeticHeights:GZ.5

Harris–Kudla algebraicity and Prasanna Theorem 2.4 integrality and Theorem 3.2 indefinite-quaternionic Waldspurger formula with the exact rational structures used by Brooks. The Petersson product target added here proves none of these three rational-structure statements; the source/owner extension remains recorded.

**Consumers:** [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula).

**Audit:** R2-rational-structures.

## Source and interface limits

The source and proof checks in the accepted parts retain their original authorship and independent verdicts. Phrases about an inspected passage in an imported target describe that historical check. This worker rechecked the cited library statements, the new CST constants and Petersson product, the public normalization comparisons, and the author erratum; it did not re-read every historical source. The unavailable 2013 book and 2011 draft are never represented as personally inspected.

The 100 historical source findings remain in their owning [GZ.0 packet](../packets/GrossZagierAndArithmeticHeights--GZ.0.json) and [GZ.8 packet](../packets/GrossZagierAndArithmeticHeights--GZ.8.json). Their IDs are packet-local: overlapping E-numbers are distinguished by packet and source. References to PAPER-GROSS-ZAGIER-86 findings refer to that paper’s reviewed extraction. This primary packet does not attach the earlier independent approvals to its own corrections.

### YZZ Picard modularity and bad-place proof comparisons

The public 2011 draft statements and normalization passages for the Picard series, arithmetic theta lift, projected kernel identity, nonzero degenerate data, nearby-coherent reduction and good local identity have been independently read at the cited locators. The full Chapter4 modularity proof, all integral trace comparisons and every bad-place approximant case remain proof-construction work in the stated prerequisite/gap plan. The 2013 publication is a separate unread edition; no source excerpt is required.

**Affected targets:** [Picard-valued generating series](#target-gz-6-picard-generating-series), [Arithmetic theta lifting comparison](#target-gz-6-arithmetic-theta-lifting), [Good-place arithmetic identity](#target-gz-7-good-local-arithmetic-identity), [Nearby quaternionic approximation](#target-gz-7-degenerate-schwartz-functions-local-decomposition-and-approximation).

### Genus-one resistance-measure proof

Yuan’s author manuscript Proposition A.5 proves c₁(ωa)=(2g−2)i*μ; comparing this with (2g−2)μa gives the stated formula only for g>1. A separate proof from an admissible degree-one bundle or the good/Tate genus-one models is required. The formula is planned for g>0, with this missing argument explicit.

**Affected targets:** [Explicit admissible skeleton measure](#target-gz-2-explicit-skeleton-measure).

### Elliptic and level tensor comparison refinement

The tensor, modified-pairing and global Δ comparisons are now planned explicitly from Conrad Theorem9.2, Theorem9.6, Lemma10.1 and Theorems10.4–10.5. Remaining work is to realize their integral deformation/coarse-coordinate carriers and specialized tests in Lean. Mathematical downstream formulas use I_v^GZ and the discriminant correction; they do not identify them with arbitrary cotangent local symbols.

**Affected targets:** [New automorphism length](#target-gz-7-classical-new-automorphism-length), [Special j tangent values](#target-gz-7-classical-j-tangent-values), [New Hom intersection formula](#target-gz-7-classical-new-hom-intersection), [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection), [Tensor-normalized local-to-global CM height](#target-gz-7-classical-tensor-global-decomposition).

### Historical definite central-value announcement

Gross–Zagier V §3 only announces proportionality. Nodes use the already specified normalized coherent Waldspurger identity instead; matching its exact scalar and rational eigenspace with the historical b_m,A vector needs the definite theta-coefficient comparison from the toric/theta suppliers.

**Affected targets:** [Definite period specialization](#target-gz-5-classical-definite-period-announcement), [Definite central-value square class](#target-gz-5-classical-definite-square-class).

### Half-weight Waldspurger proof normalization

DIT (5.17) is read in the version of record. Its cited Baruch–Mao 2010 local proof and complete 2-adic plus-space dictionary have not been acquired in this run; S6 of the reviewed extraction remains a precise source-proof gate. The supplier request must establish the 12π comparison, both signs of d and unit half-weight norm; the explicit target is planned, not certified by quotation alone.

**Affected targets:** [Half-weight Waldspurger value](#target-gz-5-half-weight-waldspurger-value).

### Nilpotent p-divisible deformation extension

R07.2 owns the exact requested nilpotent p-divisible deformation and endomorphism-lifting extension, but its current finer packet supplies classification over perfect residue fields. No deformation equivalence is inferred from that classification. GZ.7 owns the CM lifting-length calculation, and CM.5/HE.2 supply the requested CM endomorphism/level filtrations. The ownership refinements in revision.ownershipResolutions describe requests, not completed mathematics.

**Affected targets:** [Inert CM Hom lattice](#target-gz-7-classical-inert-hom-lattice).

### Unacquired publication editions

This run did not acquire the 2013 YZZ book, the 2026 published Yuan bigness paper, or the 2023 published Colmez erratum. The accepted parts attribute their earlier checks to the 2011, 2024 and two 2022 author versions; this worker did not re-read those unavailable versions. Their historical locators remain edition-specific evidence, with no numbering or hypothesis transferred to a different edition. Published-edition verification remains a source-access gap. The inherited 224 source/version decisions do not authorize depositing source passages.

**Affected targets:** [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Endomorphism-field height pairing](#target-gz-1-coefficient-valued-height), [Character-component height pairing](#target-gz-1-character-height-pairing), [Elliptic Poincaré comparison](#target-gz-1-elliptic-poincare-comparison), [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension), [Faltings–Hriljac comparison](#target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Rational ξ-normalized realization](#target-gz-3-rational-xi-realization), [Strict GL₂ realization and transfer](#target-gz-3-strict-gl2-realization), [Volume-normalized composition pairing](#target-gz-3-composition-pairing), [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Coherent quaternionic theta specialization](#target-gz-5-coherent-quaternionic-specialization), [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof), [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class), [Picard-valued generating series](#target-gz-6-picard-generating-series), [Arithmetic height kernel](#target-gz-6-arithmetic-height-kernel), [Incoherent central derivative](#target-gz-6-incoherent-central-derivative), [Arithmetic theta lifting comparison](#target-gz-6-arithmetic-theta-lifting), [Projected arithmetic kernel identity](#target-gz-6-generating-series-arithmetic-theta-lifting-and-the-kernel-identity), [Degenerate Schwartz classes](#target-gz-7-degenerate-schwartz-classes), [Good-place arithmetic identity](#target-gz-7-good-local-arithmetic-identity), [Nearby coherent kernel orthogonality](#target-gz-7-nearby-coherent-orthogonality), [Nearby quaternionic approximation](#target-gz-7-degenerate-schwartz-functions-local-decomposition-and-approximation), [Arakelov probability form](#target-gz-2-arakelov-probability-form), [Archimedean admissible metric](#target-gz-2-archimedean-admissible-metric), [Degree-weighted admissible Green function](#target-gz-2-admissible-green-function), [Complex admissible metric existence](#target-gz-2-admissible-metric-existence), [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), [Arakelov dualizing metric](#target-gz-2-arakelov-dualizing-metric), [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure), [Explicit admissible skeleton measure](#target-gz-2-explicit-skeleton-measure), [Admissible metrics at real places](#target-gz-2-real-admissible-descent).

### Split quaternion Shimizu comparison before the Waldspurger consumer

YZZ’s 2011 draft Proposition2.2.1, pp.47–49, separates the nonsplit Siegel–Weil proof from the split argument. Waldspurger1985 II.1–II.2, pp.182–187, has now been acquired and its Shimizu input and split Whittaker unfolding read. The remaining step is the exact normalized local/global contraction, including local factor comparisons and the source’s Shimizu input proof, translated to this packet’s toric probability and quaternionic Tamagawa forms. MP.6 supplies that analytic interface. GQT’s identity modulo the residual image alone does not remove this requirement, and GZ.5 cannot supply its own analytic prerequisite.

**Affected targets:** [Coherent quaternionic theta specialization](#target-gz-5-coherent-quaternionic-specialization), [Waldspurger period formula](#target-gz-5-waldspurger-period-formula-and-its-siegel-weil-proof).

### YZZ projector proof unavailable

The Berkeley erratum was read directly and CST (2.4) p.18 establishes the point/height/volume dictionary with the completed L(1,η) (CST curve volumes are half of YZZ’s); Skinner p.341 independently checks the trivial average. The YZZ book is not available as a cleared copy. The exact T_alg projection and equivalence with Theorem 3.15, with their book proof locators, remain inherited rather than directly verified. Obtain a cleared book and verify the projector reduction before closing this proof.

**Affected targets:** [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [The zero case: vanishing of the toric Hom space](#target-gz-8-vacuous-case), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number).

### Hermitian positivity for arbitrary characters

The trace degree [L:M], base-field height and scalar-extension carrier are specified. Skinner’s totally real trace-point positivity verifies χ=1. For arbitrary finite χ, GZ.1 must supply the Rosati/conjugate-dual Hermitian positivity theorem in every coefficient embedding. Match χ and χ⁻¹ via the chosen complex conjugation, prove zero iff the rationalized point is zero, and then prove simultaneous derivative vanishing. Bilinear positivity cannot be substituted for this input.

**Affected targets:** [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing).

### Integral root normalization and tame-branch transport

The acyclic construction uses the imported L3h root or Burungale Lemma 5.5/(5.8) bounded CM measures before interpolation. Compute the exact ψ₀ twist and Γ̃→Γ pushforward, including the inversion from Skinner’s geometric Artin convention. Compare JSW (5.1.a), CH Proposition 3.8 and Brooks’s CM moments with the same periods; realize φ(𝔑⁻¹) by a group-like unit and prove the remaining scalar is an R-unit. Burungale Theorem 5.6 is not used for an unchecked normalization. For general prime-to-p c, attach BDP’s completed central-critical tame branch and compare its c=1 value, rather than treating every Pic(O_c) character as a Γ-character. The comparison/unit and integrality targets remain conditional on these calculations. Relate Skinner's Ω(ψ^alg), Ω and Ω_p to BDP/Brooks periods; Skinner's printed e_∞–C(f, χ, 1) identity (E88) cannot be used. Compute Brooks's W(f, χ) transported to JSW's W(f, ψ) and compare with JSW's displayed expression.

**Affected targets:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula), [Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions](#target-gz-9-imprimitive-function-dictionary).

### Supplier types and Part II contracts not yet certified

Rational Galois descent, explicit CST local constants and the analytic Petersson product are now targets in this primary plan. The remaining contracts include arbitrary-character Hermitian positivity, Petersson-ratio algebraicity/integrality and Prasanna’s explicit quaternionic formula, integral transfer lattices, semistable integration/logarithms, p-optimal saturated cotangent pullback and the abelian p-adic subgroup theorem. The supplierAudit records which interfaces are absent or partial; no stage-id match certifies those inputs.

**Affected targets:** [The χ-isotypic Mordell–Weil space A(χ)](#target-gz-8-chi-isotypic-mordell-weil-space), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing), [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), [The Heegner map is a toric-invariant functional](#target-gz-8-heegner-functional-equivariance), [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [The zero case: vanishing of the toric Hom space](#target-gz-8-vacuous-case), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number), [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion), [Petersson norm, parametrisation degree and Manin constant](#target-gz-8-petersson-norm-and-parametrisation-degree), [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [Heights of Heegner points on an elliptic curve](#target-gz-8-elliptic-curve-heegner-height-formula), [Admissible orders and the test-vector line V(π, χ)](#target-gz-8-admissible-order-test-vector), [The explicit Gross–Zagier formula of Cai–Shu–Tian](#target-gz-8-explicit-gross-zagier-formula), [Variation of the explicit formula for other test vectors](#target-gz-8-explicit-formula-variation), [Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character](#target-gz-8-rational-shimura-curve-heegner-formula), [Non-torsion of the trace point on a parametrised GL(2)-type quotient](#target-gz-8-totally-real-trace-point-nontorsion), [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula), [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point), [In weight two the p-adic Abel–Jacobi map is the formal logarithm](#target-gz-9-weight-two-abel-jacobi-is-logarithm), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [The quaternionic weight-two formula of Brooks and JSW](#target-gz-9-quaternionic-weight-two-formula), [The formula for a p-optimal quotient](#target-gz-9-p-optimal-quotient-formula), [The formal logarithm detects non-torsion Heegner points](#target-gz-9-logarithm-detects-heegner-point), [Bloch–Kato logarithm of the Heegner Kummer class](#target-gz-9-bloch-kato-logarithm-of-heegner-class), [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula), [The main identity on X₀(N): heights as Fourier coefficients](#target-gz-8-coefficient-identity), [Corollaries on derivatives: positivity and Galois invariance](#target-gz-8-derivative-corollaries), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality), [Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions](#target-gz-9-imprimitive-function-dictionary), [Heegner points have nonzero logarithm in every eigencomponent](#target-gz-9-eigenlogarithm-nonvanishing).

### Complete-DVR analytic uniqueness interface

The ℤ_p prototype uses continuous power-series evaluation on the open unit disc and the accumulating arithmetic points (1+p)^((p−1)p^i)−1. Generalize this to the stated complete DVR R and its fraction field, with coefficient boundedness and convergence proved by the PadicMeasuresIwasawaAlgebras export. An equality on characters without those analytic conditions is insufficient. PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization is stated for a finite residue field; R has residue field 𝔽̄_p, so the factorisation is requested for complete DVRs with arbitrary residue field.

**Affected targets:** [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison).

### Castella A′ extension of the multiplicative-prime formula

RankZeroOneBSD BSD.6/BSD.6a request the multiplicative-prime formula and its period comparison under Castella's erratum hypotheses A′ (Theorem 1.1): multiplicative p > 3, additive primes away from p allowed, a nonsplit residually ramified prime, E(ℚ_p)[p] = 0 and a ramified Heegner ideal. multiplicative-prime-formula is planned only for semistable optimal E with p ≥ 5 and every prime of N split or ramified in K. The extension must be proved, not inferred from the semistable case.

**Affected targets:** [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula).

### Heavy carriers and arithmetic Checks

The reader specifies all heavy geometric and analytic targets, their APIs and mathematical Checks. Their carriers do not exist at the blueprint pins, so WORKERS.md deliberately keeps them out of the compact suggested file. The file checks only available algebraic adapters and height-normalization milestones; it does not construct CM points, toric measures, arithmetic kernels or arbitrary-character Hermitian heights. Typed realization is required in the eventual owning library, and no generic function is substituted for that construction.

**Affected targets:** [The canonical height on E(K) ⊗ ℚ](#target-gz-0-canonical-height-rational), [The unit index u](#target-gz-0-heegner-unit-index), [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Endomorphism-field height pairing](#target-gz-1-coefficient-valued-height), [Character-component height pairing](#target-gz-1-character-height-pairing), [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Admissible arithmetic extension](#target-gz-2-admissible-arithmetic-extension), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Rational ξ-normalized realization](#target-gz-3-rational-xi-realization), [Volume-normalized composition pairing](#target-gz-3-composition-pairing), [Manin constant](#target-gz-3-manin-constant), [Local toric functional space](#target-gz-4-toric-hom-space), [Normalized local toric form](#target-gz-4-normalized-toric-integral), [Admissible toric order](#target-gz-4-admissible-toric-order), [Special correspondence cycle](#target-gz-6-special-correspondence-cycle), [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class), [Picard-valued generating series](#target-gz-6-picard-generating-series), [Arithmetic height kernel](#target-gz-6-arithmetic-height-kernel), [Degenerate Schwartz classes](#target-gz-7-degenerate-schwartz-classes), [Arakelov probability form](#target-gz-2-arakelov-probability-form), [Archimedean admissible metric](#target-gz-2-archimedean-admissible-metric), [Degree-weighted admissible Green function](#target-gz-2-admissible-green-function), [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), [Arakelov dualizing metric](#target-gz-2-arakelov-dualizing-metric), [Admissible reduction-graph measure](#target-gz-2-graph-admissible-measure), [Admissible metrics at real places](#target-gz-2-real-admissible-descent), [Pseudo-theta datum](#target-gz-6-colmez-pseudo-theta), [Mixed theta–Eisenstein kernel](#target-gz-6-mixed-theta-eisenstein), [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Finite CM orbit average](#target-gz-6-colmez-torus-average), [Local derivative and zero-term corrections](#target-gz-6-colmez-local-k-c), [Special test function and integral j](#target-gz-7-colmez-test-function), [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), [Diagonal coefficient and modified self-intersection](#target-gz-7-colmez-omega-self), [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Residue-normalized adjunction line](#target-gz-2-colmez-residue-line), [Two auxiliary split places](#target-gz-7-colmez-s2-assumption), [Archimedean derivative kernel](#target-gz-7-colmez-rev-archimedean-derivative-kernel), [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), [Marked modular Green kernel](#target-gz-7-classical-marked-green-kernel), [Hecke Green kernel](#target-gz-7-classical-hecke-green-kernel), [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), [Archimedean CM height sum](#target-gz-2-classical-archimedean-height-sum), [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [Diagonal Green finite part](#target-gz-7-classical-diagonal-green-kernel), [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [Half Hom count](#target-gz-7-classical-half-hom-count), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Tangent self-intersection number](#target-gz-7-classical-self-intersection-tangent), [Rational-prime CM height sum](#target-gz-2-classical-p-height-sum), [Inert CM Hom lattice](#target-gz-7-classical-inert-hom-lattice), [Inert norm-ideal map](#target-gz-7-classical-inert-norm-ideal-map), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model), [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel), [Genus Eisenstein combination](#target-gz-6-classical-eisenstein-combination), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Modified CM intersection pairing](#target-gz-7-classical-modified-intersection), [The χ-isotypic Mordell–Weil space A(χ)](#target-gz-8-chi-isotypic-mordell-weil-space), [The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})](#target-gz-8-l-linear-neron-tate-pairing), [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [Admissible orders and the test-vector line V(π, χ)](#target-gz-8-admissible-order-test-vector), [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction).

### Supplier extensions and missing source decompositions

The supplierAudit records the independent package review’s 23 absent and 43 partial historical contracts and R2 foundation/rational-structure gaps, their proposed owners and exact consuming targets. Except for the toric Hom redirection and the two partial P4 imports, these are unimplemented extensions requiring owner approval and target/source decomposition; existing stage labels are not proofs or exports. The blueprint is planned, not closed, and upstream packaging must retain this boundary until the contracts are actually supplied.

**Affected targets:** [Base-change signs and measure comparison](#target-gz-0-root-number-and-measure-normalisation-corrections), [Saito–Tunnell dichotomy](#target-gz-4-saito-tunnell-dichotomy-and-the-local-toric-functional), [Classical Rankin normalization](#target-gz-0-classical-rankin-normalization), [Ideal-class Rankin series](#target-gz-6-classical-partial-rankin-series), [Rankin absolute convergence](#target-gz-6-classical-absolute-convergence), [Half-weight Waldspurger value](#target-gz-5-half-weight-waldspurger-value), [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point), [Toric integral versus finite trace](#target-gz-8-toric-integral-versus-finite-sum), [The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)](#target-gz-8-general-quaternionic-gross-zagier-identity), [Matching local signs force the global sign −1](#target-gz-8-essential-case-root-number), [The Gross–Zagier formula on X₀(N) for ring-class characters](#target-gz-8-classical-gross-zagier-formula), [Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character](#target-gz-8-rational-shimura-curve-heegner-formula), [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function), [Corollaries on derivatives: positivity and Galois invariance](#target-gz-8-derivative-corollaries), [Integral Rankin kernel values](#target-gz-6-classical-integral-kernel-values), [Signed divisor sums](#target-gz-6-classical-signed-divisor-sums), [Rankin Mellin regularization](#target-gz-6-classical-rankin-mellin-regularization), [Half Hom count](#target-gz-7-classical-half-hom-count), [New CM homomorphisms](#target-gz-7-classical-new-hom-set), [Prime-to-p Hom decomposition](#target-gz-7-classical-prime-to-p-hom-count), [CM Hom quaternion realization](#target-gz-7-classical-hom-quaternion-realization), [Strict GL₂ realization and transfer](#target-gz-3-strict-gl2-realization), [The ratio α(f, f_B) of Petersson norms](#target-gz-9-petersson-norm-ratio), [Brooks's quaternionic p-adic L-function](#target-gz-9-quaternionic-bdp-construction), [Manin constant](#target-gz-3-manin-constant), [Manin isogeny and twist transfer](#target-gz-3-manin-isogeny-twist-transfer), [The formula for a p-optimal quotient](#target-gz-9-p-optimal-quotient-formula), [Integral Manin constant and p-unit range](#target-gz-3-manin-integrality-and-p-unit), [Manin constant and modular degree](#target-gz-3-manin-degree-divisibility), [Finite local multiplicities and diagonal omission](#target-gz-7-colmez-finite-multiplicity), [Degree-one CM intersection count](#target-gz-7-classical-degree-one-intersection), [Supersingular Eichler realization](#target-gz-7-classical-supersingular-eichler-order), [CM level reduction component](#target-gz-7-classical-level-reduction-component), [CM Hom intersection count](#target-gz-7-classical-hom-intersection-count), [Diagram isomorphism intersection count](#target-gz-7-classical-isomorphism-intersection-count), [New automorphism length](#target-gz-7-classical-new-automorphism-length), [ξ-normalized CM divisor](#target-gz-6-cm-degree-zero-class), [CM Hecke disjointness criterion](#target-gz-6-classical-disjointness), [CM action convention comparison](#target-gz-0-classical-cm-action-conventions), [CM kernel invariants](#target-gz-7-classical-cm-kernel-invariants), [CM genus-orbit count](#target-gz-7-classical-cm-genus-orbits), [Archimedean CM height sum](#target-gz-2-classical-archimedean-height-sum), [CM Eisenstein sum](#target-gz-7-classical-cm-eisenstein-sum), [Finite CM intersection height](#target-gz-7-classical-finite-intersection-height), [Definite period specialization](#target-gz-5-classical-definite-period-announcement), [The Artin-map convention and the Galois action on Heegner points](#target-gz-0-artin-map-convention), [Quadratic-twist real-period comparison](#target-gz-0-classical-twist-real-period), [The BDP p-adic Gross–Zagier formula in weight two](#target-gz-9-bdp-weight-two-heegner-formula), [The main identity on X₀(N): heights as Fourier coefficients](#target-gz-8-coefficient-identity), [Incoherent central derivative](#target-gz-6-incoherent-central-derivative), [Arithmetic theta lifting comparison](#target-gz-6-arithmetic-theta-lifting), [Projected arithmetic kernel identity](#target-gz-6-generating-series-arithmetic-theta-lifting-and-the-kernel-identity), [Arakelov probability form](#target-gz-2-arakelov-probability-form), [Complex admissible metric existence](#target-gz-2-admissible-metric-existence), [Normalized Arakelov Green function](#target-gz-2-normalized-arakelov-green), [Projected derivative decomposition](#target-gz-6-colmez-projected-derivative), [Archimedean holomorphic projection of log δ∞·W^(2)](#target-gz-6-colmez-rev-archimedean-holomorphic-projection-of-log), [Logarithmic weight-two projection](#target-gz-6-classical-holomorphic-projection), [Corrected CM multiplicity at 𝔹-split, E-nonsplit places](#target-gz-7-colmez-rev-corrected-cm-multiplicity-at-split), [Supersingular inert local intersection](#target-gz-7-colmez-local-m-inert), [Wild-inclusive ramified local intersection](#target-gz-7-colmez-local-m-ramified), [Inert quaternionic order model](#target-gz-7-classical-inert-order-model), [Split CM intersection vanishing](#target-gz-7-classical-split-vanishing), [CM endomorphism congruence order](#target-gz-7-classical-endomorphism-congruence-order), [Inert disjoint intersection formula](#target-gz-7-classical-inert-disjoint-intersection), [Ramified disjoint intersection formula](#target-gz-7-classical-ramified-disjoint-intersection), [Special j tangent values](#target-gz-7-classical-j-tangent-values), [Ramified quaternionic order model](#target-gz-7-classical-ramified-order-model), [Inert CM Hom lattice](#target-gz-7-classical-inert-hom-lattice), [The Waldspurger formula at CM points of X_{N⁺,N⁻}](#target-gz-9-quaternionic-cm-waldspurger-formula), [The quaternionic weight-two formula of Brooks and JSW](#target-gz-9-quaternionic-weight-two-formula), [The BDP function lies in the Iwasawa algebra](#target-gz-9-bdp-measure-integrality), [Quadratic-pair representation count](#target-gz-7-classical-pair-count), [Ramified-congruence pair count](#target-gz-7-classical-ramified-congruence-count), [Genus pair count](#target-gz-7-classical-genus-pair-count), [Genus-character filter](#target-gz-7-classical-genus-character-filter), [Inert-prime height sum](#target-gz-7-classical-inert-height-sum), [Inert unit-orbit count](#target-gz-7-classical-inert-unit-count), [Ramified-prime height sum](#target-gz-7-classical-ramified-height-sum), [Genus-character factorization](#target-gz-0-classical-genus-character-factorization), [Ramified theta reindexing](#target-gz-6-classical-ramified-theta-reindexing), [Rankin genus-sign function](#target-gz-6-classical-genus-sign-function), [Genus-sign reversal](#target-gz-6-classical-genus-sign-reversal), [Different ideal reindexing](#target-gz-6-classical-different-reindexing), [Genus sigma identity](#target-gz-6-classical-genus-sigma-identity), [Logarithmic prime decomposition](#target-gz-6-classical-logarithmic-prime-decomposition), [Central-value genus-sum filter](#target-gz-5-classical-genus-sum-filter), [The weight-two formula at a multiplicative prime](#target-gz-9-multiplicative-prime-formula), [Heegner points have nonzero logarithm in every eigencomponent](#target-gz-9-eigenlogarithm-nonvanishing), [Global arithmetic intersection on curves](#target-gz-2-arithmetic-intersection-gluing), [Heegner points detect a nonzero central derivative](#target-gz-8-nonvanishing-criterion), [Normalized local Whittaker terms](#target-gz-6-colmez-whittaker), [Norm congruence shells and ramified correction](#target-gz-7-colmez-norm-shells), [Local Whittaker series for incoherent sections](#target-gz-6-colmez-rev-local-whittaker-series-for-incoherent), [Poincaré height pairing](#target-gz-1-neron-tate-height-and-the-poincare-pairing), [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison), [The canonical height on E(K) ⊗ ℚ](#target-gz-0-canonical-height-rational), [Hecke height-series cuspidality](#target-gz-6-classical-height-series-cuspidality), [Relative-field height comparison](#target-gz-0-classical-relative-field-heights), [Squared-norm complex height symbol](#target-gz-2-classical-complex-height-symbol), [Tangent-normalized CM height symbol](#target-gz-7-classical-tangent-symbol), [Tangent product formula](#target-gz-7-classical-tangent-product-formula), [Local intersection height comparison](#target-gz-2-classical-local-intersection-height), [Faltings–Hriljac comparison](#target-gz-2-hodge-index-theorem-and-admissible-arithmetic-extensions), [Special correspondence cycle](#target-gz-6-special-correspondence-cycle), [Normalized Hodge class](#target-gz-3-normalised-hodge-class-and-xi-parametrised-realisation), [Modular cusp and boundary correction](#target-gz-7-boundary-cusp-correction), [CM tensor stabilizer height](#target-gz-7-cm-tensor-stabilizer-height), [Marked Green height characterization](#target-gz-7-classical-height-green-characterization), [Eta-normalized CM tangent](#target-gz-7-classical-eta-tangent), [Trace coset classification](#target-gz-6-classical-trace-coset-classification), [Local toric functional space](#target-gz-4-toric-hom-space), [Hyperbolic norm parameter](#target-gz-7-classical-hyperbolic-norm-parameter), [Inert norm-ideal map](#target-gz-7-classical-inert-norm-ideal-map), [Petersson and modular-degree comparison](#target-gz-3-petersson-composition-comparison), [Classical Rankin kernel](#target-gz-6-classical-rankin-kernel), [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison), [Compatibility with isogenies, differentials and characters](#target-gz-9-isogeny-and-differential-compatibility), [Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions](#target-gz-9-imprimitive-function-dictionary), [Good-place arithmetic identity](#target-gz-7-good-local-arithmetic-identity), [Finite CM orbit average](#target-gz-6-colmez-torus-average), [Special test function and integral j](#target-gz-7-colmez-test-function), [Vertical correction vanishes at B-split places](#target-gz-7-colmez-vertical-split-zero), [Geometric realization of extended self-intersection](#target-gz-7-colmez-modified-projection), [Hodge-class terms vanish and the height series splits into horizontal and vertical parts](#target-gz-6-colmez-rev-hodge-class-terms-vanish-and), [Regularized archimedean multiplicity](#target-gz-7-colmez-arch-green), [Superspecial multiplicity by uniformization](#target-gz-7-colmez-superspecial-m), [Vertical correction is nonsingular pseudo-theta](#target-gz-7-colmez-vertical-pseudo), [Extended local diagonal vanishes at small away-v level](#target-gz-7-colmez-small-level-diagonal), [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point).

## Suggested file and implementation boundary

The suggested file follows the compact shape required by WORKERS.md: seven light definitions over existing carriers, seven milestone statements, and 23 examples, in 195 lines. It elaborates at the blueprint pins with proof-placeholder warnings only. The reader is definitive; this file is not exhaustive. The following correspondence distinguishes arithmetic targets from their finite algebraic adapters. All target implementation statuses remain unchecked.

| Lean name | Arithmetic target | Scope |
| --- | --- | --- |
| `TauCeti.GrossZagier.unitIndex` | [The unit index u](#target-gz-0-heegner-unit-index) | Actual number-field unit-count definition; used for imaginary quadratic fields. |
| `TauCeti.GrossZagier.chiIsotypic` | [The χ-isotypic Mordell–Weil space A(χ)](#target-gz-8-chi-isotypic-mordell-weil-space) | Inverse-character submodule of a supplied finite representation. The Mordell–Weil rationalization and descent remain the target. |
| `TauCeti.GrossZagier.heegnerFinite` | [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point) | Character-weighted finite sum of a supplied orbit; constructing the CM orbit and parametrization is outside the adapter. |
| `TauCeti.GrossZagier.heegnerAverage` | [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point) | Inverse-cardinality normalization of the supplied finite sum; identifying torus volume is outside the adapter. |
| `TauCeti.GrossZagier.bdpLFunction` | [The BDP anticyclotomic p-adic L-function in weight two](#target-gz-9-bdp-p-adic-l-function) | Specified unit times the square of a supplied power series. It constructs neither the root distribution nor its CM moments. |
| `TauCeti.GrossZagier.bdpIncomplete` | [Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions](#target-gz-9-imprimitive-function-dictionary) | Product with supplied finite Euler factors; the Skinner character/period/tame-branch dictionary remains the target. |
| `TauCeti.GrossZagier.bdpEulerFactor` | [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point) | Actual rational Euler-factor expression; the Hecke eigenvalue and good-prime context are arithmetic hypotheses. |

The milestone statements correspond to the following targets:

- `TauCeti.GrossZagier.pinnedHeight_pairing`: [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison).
- `TauCeti.GrossZagier.pinnedHeight_regulator`: [Pinned and current elliptic height conventions](#target-gz-0-pinned-height-normalization-comparison).
- `TauCeti.GrossZagier.completed_derivative_at_central_zero`: [Classical Rankin normalization](#target-gz-0-classical-rankin-normalization).
- `TauCeti.GrossZagier.heegnerAverage_isotypic`: [The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)](#target-gz-8-chi-heegner-point).
- `TauCeti.GrossZagier.heegnerAverage_pairing`: [Trace versus normalised average of a Galois orbit](#target-gz-0-trace-versus-average).
- `TauCeti.GrossZagier.bdpLFunction_evaluation`: [The BDP function is the square of the toric square-root distribution](#target-gz-9-bdp-square-root-comparison).
- `TauCeti.GrossZagier.bdpEulerFactor_ne_zero`: [The Euler factor at the BDP point](#target-gz-9-euler-factor-at-bdp-point).

## Downstream use and ownership proposals

HeegnerPointEulerSystems consumes the non-torsion point and logarithm identities before its Euler-system arguments. RankZeroOneBSD consumes their exact height, index, period, Manin and Euler-factor constants. Neither rank and finite Sha nor a supersingular p-adic height identity follows merely from the logarithm formula here. Colmez assembly imports the normalized kernel, adjunction, vertical correction and local multiplicity results of Layers 2, 6 and 7.

- GZ.1 keeps the YZZ Poincaré/full-polarization convention, coefficient-valued χ-pairings and elliptic comparison. Import general canonical/local heights and Northcott from RP.0, general Mordell–Weil from RP.1, and reroute BSD.1’s general Mordell–Weil input to RP.1. Northcott alone suffices for the torsion zero-locus argument.
- GZ.2 imports Layers 1, 4, 5 and 7 for dual graphs, regular/minimal models, vertical intersection matrices and their fibre kernel, projection formulas and semistable base change. It keeps admissible archimedean metrics, arithmetic graph measures, global admissible gluing and Faltings–Hriljac.
- Owners: L3h owns the square-root distribution for every totally real F (specialised to F = ℚ, n⁻ = 1 for GZ.9); GH.4 owns BDP Theorem 5.13 for every r ≥ 0 (GH.4/bdp-special-value-formula), as the GH blueprint also proposes; GZ.9 imports both (bdp-square-root-comparison squares the L3h measure; bdp-weight-two-heegner-formula imports Theorem 5.13 at r = j = 0) and owns what is new in weight two: Brooks's quaternionic construction and Proposition 8.13 (= JSW Proposition 5.1.6), JSW Proposition 5.1.7, the multiplicative-prime formula, the formal-logarithm and Bloch–Kato/Kummer comparisons and the isogeny/differential compatibilities. Add the stage edges AutomorphicPadicLFunctions:L3h → GZ.9, GeneralizedHeegnerCycles:GH.4 → GZ.9 and GeneralizedHeegnerCycles:GH.1 → GZ.9 (the last for GH.1/p-adic-abel-jacobi-map and GH.1/generalized-heegner-cycle); all are acyclic (no path from GZ.9 to any of them in research/blueprint/atlas/stage-edges.json). This takes the GH.4 direction rather than the round-1 fix report's GZ.9 → GH.1; the red-team finding allowed either.
- Drop the edge ModularSymbolsPadicLFunctions:L2 → GrossZagierAndArithmeticHeights:GZ.9. Add instead the edges actually used: AutomorphicPadicLFunctions:L0 and L3 → GZ.9 (character avatars, CM periods), HilbertModularVarietiesAndShimuraCurves:R18.1 and R18.2 → GZ.9 (canonical Shimura curves X_{N⁺,N⁻} and their integral models), GL2AutomorphicRepresentationsAndTransfer:R17.3 → GZ.9 (Jacquet–Langlands), ColemanIntegration:L1 → GZ.9, GrossZagierAndArithmeticHeights:GZ.5 → GZ.9 (the CM-value Waldspurger formula) and HeegnerPointEulerSystems:HE.1 → GZ.8. Also add EllipticCurveModularity:R29.5 → GZ.8 and → GZ.9, DiophantineApproximationAndTranscendence:DT.3 → GZ.9, EffectiveDiophantineMethods:ED.4 → GZ.9 and GrossZagierAndArithmeticHeights:GZ.8 → GZ.9 (GZ.9/bdp-weight-two-heegner-formula cites GZ.8/chi-heegner-point); none has a reverse path in research/blueprint/atlas/stage-edges.json. The L0, L3, R18.1, R18.2, R17.3 and HE.1 edges listed above are already implied by existing paths. The former BSD.2 → GZ.8 proposal is withdrawn: the auxiliary quadratic field is a hypothesis, and BSD consumes Gross–Zagier. These are maintainer proposals, not applied atlas edges.
- Replace GZ.9's exceptional-zero clause by: 'the weight-two formula at a multiplicative prime p ∥ N split in K (no exceptional zero)'. The exceptional-zero derivative formula for big Heegner points (Castella Theorem 3.11, with the L-invariant 𝓛_p(f, K)) has no current consumer; if one appears it belongs with the Hida-family classes of GeneralizedHeegnerCycles GH.7, whose blueprint must then plan it (the GH blueprint currently assigns 'exceptional variants' to GZ.9, which this proposal declines). PadicHodgeTheory R06.6's recorded use 'the Tate-period/L-invariant term of the multiplicative exceptional-zero formula' should name GH.7 instead of GZ.9.
- GH.8 imports GZ.9/weight-two-abel-jacobi-is-logarithm and GZ.9/isogeny-and-differential-compatibility and keeps only its family-specific comparisons (stabilised classes, corestriction, uniform lattices, Hida specialisation). This requires revising an accepted packet; until then the two statements are duplicated and must be kept identical.
- Build on L1: rigid/semistable divisor integration and the p-new weight-two Abel–Jacobi/logarithm comparison; good reduction does not cover p∥N. This is a proposed scope extension; no declaration from it is treated as already established.
- Build on R17.3 rational transfer: primitive p-integral Jacquet–Langlands normalization and its lattice compatibility. This is a proposed scope extension; no declaration from it is treated as already established.
- Build on DT.3: analytic subgroup theorem for algebraic points on abelian varieties and BSW eigenlogarithm/Serre tensor consequences. This is a proposed scope extension; no declaration from it is treated as already established.
- NeronModelsAndSemistableAbelianVarieties R11.1, owner of the Néron cotangent lattice (R11.1/differential-lattice), exports its saturated pullback along p-optimal quotients for GZ.9/p-optimal-quotient-formula.
- Redirect the Kobayashi request to the owner of cyclotomic p-adic heights and the rank/Ш request to HeegnerPointEulerSystems HE.7, which consumes GZ.8/totally-real-trace-point-nontorsion. Castella's A′/Theorem 1.1 extension requested by BSD.6/BSD.6a is recorded as a gap of GZ.9/multiplicative-prime-formula.
- AutomorphicLFunctionsAndLocalFactors, Part II: quadratic base-change local comparisons. Required interface: Quadratic base-change epsilon comparison ε_RS=η_v(−1)ε_BC, in the corrected convention. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- AutomorphicLFunctionsAndLocalFactors, Part II: archimedean Rankin special functions. Required interface: The terminating p_(k−1), decaying q_(k−1), gamma/Mellin/Legendre identities and differentiation bounds. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- AbelianSchemesAndArithmeticModuli A6: cyclic-isogeny diagram extension. Required interface: Hom and End of chosen cyclic-isogeny diagrams over complete local and Artinian bases; positive-degree fibres and stabilizers. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- GL2AutomorphicRepresentationsAndTransfer, Part II: integral transfer lattices. Required interface: Primitive integral Jacquet–Langlands lattices, rather than rational transfer alone. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- NeronModelsAndSemistableAbelianVarieties R11.1: p-optimal quotient extension. Required interface: Saturated pullback of the Néron cotangent lattice along the p-optimal connected-kernel quotient in JSW Proposition 5.1.7. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- ModularCurvesPartII R14.6: bad-prime differential extension. Required interface: Integral modular-parametrization differentials at bad primes, with Manin factors retained. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- ComplexMultiplicationAndExplicitReciprocity, Part II: local CM deformation; GZ.7 owns its height multiplicities. Required interface: Ordinary CM multiplicities and quasi-canonical lifting intersections over W (two historical contracts). GZ.7 already states the weighted multiplicity formulas; their deformation input is separate. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- HeegnerPointEulerSystems HE.1/cm-cyclic-isogeny-pair: extra-unit extension. Required interface: The existing CM cyclic-isogeny construction extended to discriminants −3 and −4, including automorphism weights. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- AutomorphicSpectralTheory, Part II: regularized theta-kernel analysis. Required interface: Mixed incoherent-kernel continuation, parameter-uniform derivative bounds and legitimate derivative/integral exchange. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- AutomorphicSpectralTheory, Part II: Green inversion and regularized weight-two projection. Required interface: Four historical contracts: compact-surface Green inversion and holomorphic/Petersson projection including logarithmic growth. GZ.6 states its explicit Fourier formulas, but their analytic existence and growth input is not AS.4. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- ComplexMultiplicationAndExplicitReciprocity, Part II: local CM deformation. Required interface: Three historical contracts: Gross canonical/quasi-canonical lifts, endomorphism filtrations over W/π^n and quaternionic lifting counts, with ramification and dyadic hypotheses. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- AbelianSchemesAndArithmeticModuliPartII P4: compatibility extension, with GZ.9 owning Brooks moments. Required interface: P4 supplies ordinary infinitesimal and translation trivializations of the Poincaré line. It does not supply the entire Brooks scalar automorphic-line/Serre–Tate moment comparison. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- AnalyticNumberTheory, Part II: quadratic norm/genus congruences. Required interface: Norm-representation genus criterion under Nn+l≡0 mod D, with local characters at every prime dividing D. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- PadicHodgeRegulators, Part II: semistable abelian logarithms. Required interface: The semistable abelian comparison log_BK∘κ=log_A, with the Kummer and filtered-module normalizations. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- ColemanIntegration, Part II: semistable Abel–Jacobi integration. Required interface: Semistable weight-two Abel–Jacobi integration; good-reduction Coleman integration does not cover p∥N. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- DiophantineApproximationAndTranscendence, Part II: abelian p-adic subgroups. Required interface: Abelian p-adic analytic subgroup theorem and BSW eigencomponent/Serre-tensor consequences. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.
- ArakelovGeometryAndAbelianHeights R35.1: foundation decomposition required. Required interface: Hermitian rational line bundles, Green arithmetic divisors, arithmetic degree and metric-compatible product formula. R35.1 has no target decomposition; its stage label is not an export. This is an unapplied owner/scope proposal; exact consuming nodes are in supplierAudit. Do not claim this extension from the supplier’s present stage text.

### Upstream normalization note

README.md Layer 9, lines 1178–1182 at TauCetiRoadmap 0d144d04. The README specifies the logarithmic x-height convention. Historical Tau Ceti f790474 instead defines canonicalHeight with denominator 2·4^n and its half-polarized pairing, so that README convention disagrees with the blueprint pin. Current Tau Ceti a91d3aaf has denominator 4^n and now agrees with the README. The factor-two comparison here is specific to the historical pin; the upstream README and library remain read-only.


## References and source versions

Locators belong to the specific edition listed here. In particular, the 2011 YZZ draft and 2013 book have different theorem numbers and pagination. Historical source-inspection records are provenance, not a claim that this run acquired every source. No source passage or book file is included in this repository.

<a id="source-muller-stoll-2016"></a>

### muller-stoll-2016

J. Steffen Müller and Michael Stoll, [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2). arXiv:1509.08748v2 (22 Dec 2015); published in LMS J. Comput. Math. 19 (2016); accessed 2026-09-28.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §1 Introduction and §3 Heights, through Remark 3.1 (pp. 1–4)..

**Public source fingerprint:** `10576e85c77e8e7c590671840586bc4680e638d03daf7802e230a4897ac3384c`.

<a id="source-lmfdb-2026"></a>

### lmfdb-2026

The LMFDB Collaboration, [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/). Web pages read 2026-09-28: elliptic curve 37.a1, and the knowls ec.canonical_height and ec.q.real_period.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** Curve 37.a1: regulator, real period, L′(E,1), Tamagawa product, torsion, analytic Ш, height of (0,0) and the BSD check; knowl ec.canonical_height; knowl ec.q.real_period..

<a id="source-conrad-2004"></a>

### conrad-2004

Brian Conrad (with an appendix by W. R. Mann), [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf). Heegner Points and Rankin L-Series, MSRI Publications 49 (2004) 67–163; SLMath library PDF; printed page = PDF page + 65; accessed 2026-09-28.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §1 Introduction and 'Some conventions' (pp. 67–70); §9 (p. 119), the paragraph on Aut_F(x)..

**Public source fingerprint:** `31396cc7f513d6237155b6afa923c6ef76d2f37101db598d58bea25f0aa677ca`.

<a id="source-cai-shu-tian-2014"></a>

### cai-shu-tian-2014

L. Cai, J. Shu and Y. Tian, [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2). arXiv:1408.1733v2.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §§1–3; §1.1 (Theorems 1.1 and 1.2, the BSD comparison), §1.2 (setting, Definitions 1.3–1.4, Theorem 1.5 with Special cases 1–2 and the X_0(N) example, Theorem 1.6 with the X_0(36) example), §1.3 opening (root-number convention).; §2.3, Lemma 2.3 and (2.4), pp.17–18: relative class number, toric measure, base-field height and curve-volume comparisons; §3.3 Proposition 3.7 p.24..

**Public source fingerprint:** `8d908543404abfbd9c1708ad9af696c4fb71595701bd67cb5bff11b3a8d6ac43`.

<a id="source-gross-zagier-1986"></a>

### gross-zagier-1986

B. H. Gross and D. B. Zagier, [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf). Invent. Math. 84 (1986), 225–320.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** Chapters I–V, especially II–IV; Chapter I §5 (pp. 229: (5.1)–(5.5)), §6 (p. 230: Theorems (6.1)–(6.3), (6.4), (6.5)); Chapter V §1 (pp. 307–309: the coefficient identity, the proof of Theorem (6.3), Corollaries (1.1)–(1.3)), §2 (p. 311: Theorem (2.1), Conjectures (2.2)–(2.3))..

**Public source fingerprint:** `8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521`.

<a id="source-zhang-2010"></a>

### zhang-2010

S.-W. Zhang, [Gross–Zagier formula for GL(2)](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf). CRM lecture notes.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** height and toric-pairing formulation; §3.2–3.3 (Gross–Zagier formula for modular and Shimura curves over Q), §4.2 (Gross–Zagier formula over totally real fields, Theorem 4.2.1, the root-number set Σ and the toric measure of volume 2L(1,η)), §4.3 (Theorems 4.3.1–4.3.3)..

**Public source fingerprint:** `1f46be497752b0795dbef8b06b423ef7bea5203096d3480c6da2642c333e73f0`.

<a id="source-yzz-gross-zagier-erratum"></a>

### yzz-gross-zagier-erratum

X. Yuan, S.-W. Zhang and W. Zhang, [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf). 28 June 2026.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** items 1–42.

**Public source fingerprint:** `e4c4eaeb197ceaf18b02955d90a56e52e4776eca1f31c88c16074adaf19d8d1e`.

<a id="source-jetchev-2008"></a>

### jetchev-2008

D. Jetchev, [Global divisibility of Heegner points and Tamagawa numbers](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/475417137355BE27B3888862CADB0286/S0010437X08003497a.pdf/global_divisibility_of_heegner_points_and_tamagawa_numbers.pdf). Compositio Math. 144 (2008).

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §1.

**Public source fingerprint:** `f887790bbbf0a1831685f697cfe20b403ca515be4c4176705efa24e3077307ed`.

<a id="source-cesnavicius-neururer-saha-2022"></a>

### cesnavicius-neururer-saha-2022

K. Česnavičius, M. Neururer and A. Saha, [The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446). arXiv:1911.09446, 3 November 2022.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** Introduction, Theorems 1.1–1.2.

**Public source fingerprint:** `4d76a0daf4ffa103a4a96f6fafe6de22c44e194cd2c47489c75be8967f1d5448`.

<a id="source-duke-imamoglu-toth-2016"></a>

### duke-imamoglu-toth-2016

W. Duke, Ö. İmamoğlu and Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Ann. Math. 184 (2016), 949–990.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §5, equation (5.17).

**Public source fingerprint:** `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`.

<a id="source-yuan-zhang-2018"></a>

### yuan-zhang-2018

X. Yuan and S. Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Ann. Math. 187 (2018), 533–638.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §§6.2–9.2.

**Public source fingerprint:** `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507`.

<a id="source-gan-qiu-takeda-2014"></a>

### gan-qiu-takeda-2014

W. T. Gan, Y. Qiu and S. Takeda, [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3). arXiv:1207.4709v3.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §1.7.

**Public source fingerprint:** `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5`.

<a id="source-yuan-bigness-2026"></a>

### yuan-bigness-2026

X. Yuan, [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). author manuscript 21 August 2024; Ann. Math. 203 (2026), 15–119 has not been acquired.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** Appendix A.1, A.5, A.6.

**Public source fingerprint:** `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.

<a id="source-yzz-gross-zagier-shimura-curves-2013"></a>

### yzz-gross-zagier-shimura-curves-2013

Xinyi Yuan; Shou-Wu Zhang; Wei Zhang, [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html). Annals of Mathematics Studies 184, Princeton University Press, 2013 (inspected 2026-09-15).

Historical part citation only. The 2013 book is unavailable in the cleared library; no book or unofficial copy was accessed in this run. The author-draft URL tried in this run returned 404. Statements restated by CST, Zhang and Yuan–Zhang can be checked there; un-restated proof locators remain a gap.

**Recorded locators:** Preface and Contents, pp. vii-viii; Chapter 1 'Introduction and Statement of Main Results', pp. 1-19 in full (1.1 the original formula and Thm. 1.1; 1.2.1 incoherent quaternion algebras and Shimura curves; 1.2.2 Hodge classes; 1.2.3 abelian varieties parametrized by Shimura curves; 1.3.1 CM points; 1.3.2 Thm. 1.2 and the local functional alpha_v; 1.4 Thms. 1.3 and 1.4; 1.5.1-1.5.10 the plan of the proof); Chapter 7, opening of the chapter and Sec. 7.1, printed pp. 206-215, in full (7.1.1 Neron-Tate height with Thms. 7.1-7.2 and Prop. 7.3; 7.1.2 the curve case and the factor 1/2; 7.1.3 Gillet-Soule arithmetic intersection and formulas (7.1.1)-(7.1.2); 7.1.4 the arithmetic Hodge index theorem, Thm. 7.4; 7.1.5 admissible arithmetic divisors; 7.1.6 the admissible pairing; 7.1.7 its decomposition into i and j). Secs. 7.1.2-7.1.3 and 7.1.6-7.1.7 were read during the independent review; Verified during the independent review, against locators the packet cites without claiming to have read: Sec. 3.3 Thm. 3.15 (printed p. 84), Sec. 3.4.3 the two descriptions of Z(x)_U (printed p. 93), Sec. 3.6.2 Thm. 3.21 (printed p. 105), Sec. 1.6 p. 23 and Sec. 2.1.5 p. 33 and Sec. 2.4 p. 43 for the three passages the erratum's measure items correct, and a page rendering of printed p. 17.

**Public source fingerprint:** `6a87b131febb325ea59259098117cc79dfeecbeae66f8ebaeac9fbd66e345337`.

<a id="source-conrad-author-2004"></a>

### conrad-author-2004

B. Conrad, with appendix by W. R. Mann, [Gross–Zagier revisited](https://math.stanford.edu/~conrad/papers/gzfinal.pdf). author final copy of MSRI Publications 49 (2004).

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §8 Theorems8.3–8.4 and Remarks8.5–8.6; §9 Theorem9.2 and proof, Definition9.5 and (9.9)–(9.11).

**Public source fingerprint:** `7eac62b943ebd035de37f40df6054e1300ba4a0f02356cca919635eef994fdbe`.

<a id="source-yzz-gross-zagier-shimura-curves-2011-draft"></a>

### yzz-gross-zagier-shimura-curves-2011-draft

Xinyi Yuan; Shou-Wu Zhang; Wei Zhang, [The Gross–Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html). Author draft dated 6 November 2011, 266 PDF pages; author-uploaded public copy. Distinct from the 2013 published book..

Historical part citation only. The 2013 book is unavailable in the cleared library; no book or unofficial copy was accessed in this run. The author-draft URL tried in this run returned 404. Statements restated by CST, Zhang and Yuan–Zhang can be checked there; un-restated proof locators remain a gap.

**Recorded locators:** Independent narrow review of RT-AREA-automorphic-1/19: printed/PDF pp.20–23 and43–55, including §2.1.5 Theorem2.1.1, §2.1.6 nonzero-norm local formula, §2.2.1 Proposition2.2.1 and its nonsplit proof, §2.3 unfolding and §2.4 constants. The split proof referred to Waldspurger was not acquired; neither the 2013 book nor its inherited hash is certified by this draft..

**Public source fingerprint:** `7a6b79df81cf5d88e8a4bfbad5a2a9502dcb7b4ac16631e3d270c69bb71a7235`.

<a id="source-saito-1993"></a>

### saito-1993

Hiroshi Saito, [On Tunnell’s formula for characters of GL(2)](https://www.numdam.org/article/CM_1993__85_1_99_0.pdf). Compositio Mathematica 85 (1993), 99–108, Numdam published scan.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §1, pp.99–100: statement and conventions; §2, pp.100–108: local proof, including residue characteristic two..

**Public source fingerprint:** `a408e77de59464ed1a365169302c7a5518ec6628d9d2df59ac55395d90b366ea`.

<a id="source-waldspurger-1985"></a>

### waldspurger-1985

Jean-Loup Waldspurger, [Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie](https://www.numdam.org/item/CM_1985__54_2_173_0.pdf). Compositio Mathematica 54 (1985), 173–242, Numdam published scan.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** II.1, pp.182–184: Shimizu theorem and its input; II.2, pp.184–187: split Whittaker unfolding and Proposition3..

**Public source fingerprint:** `8617e704eceacf3ee5aa7c266b6f51db44b64e7d59622fc3a7de542e425a3158`.

<a id="source-edixhoven-1990"></a>

### edixhoven-1990

Bas Edixhoven, [Edixhoven, Minimal resolution and stable reduction of X₀(N)](https://www.numdam.org/item/10.5802/aif.1202.pdf). Ann. Inst. Fourier40 (1990), pp.31–67; acquired2026-10-10.

Inherited from accepted GZ.0; no claim that this worker read all listed sections.

**Recorded locators:** §1.1.3, printed pp.34–35.

**Public source fingerprint:** `cff6a257adcae5ca95a9859ec7a0319a363718bac3a40fe8afe146e59da5926a`.

<a id="source-yzz-2013"></a>

### yzz-2013

Xinyi Yuan, Shou-Wu Zhang and Wei Zhang, [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184). Annals of Mathematics Studies 184, Princeton University Press, 2013. Not directly read: no cleared copy available. Book locators are inherited from the accepted integrated decomposition; substantive normalization and statements are checked against the public Zhang, CST and Skinner restatements. The detailed projector proof remains a gap..

Historical part citation only. The 2013 book is unavailable in the cleared library; no book or unofficial copy was accessed in this run. The author-draft URL tried in this run returned 404. Statements restated by CST, Zhang and Yuan–Zhang can be checked there; un-restated proof locators remain a gap.

**Recorded locators:** No direct book reading. Inherited locators: Chapter 1 Theorem 1.2 p.9, §§1.2.1 and 1.3.1 pp.2–3 and 6, §1.5.3 p.14, and Chapter 3 §3.3..

<a id="source-yzz-erratum-2026"></a>

### yzz-erratum-2026

Xinyi Yuan, Shou-Wu Zhang and Wei Zhang, [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf). Author erratum, dated 28 June 2026; Berkeley author copy directly read on 2026-10-08..

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** Items 1–5, 10, 13, 15–16, 23, 25, 30–31, 35, 55, 60 and 62. Item 25 corrects the integration group to Gal(E^ab/E), without specifying probability normalization..

**Public source fingerprint:** `e4c4eaeb197ceaf18b02955d90a56e52e4776eca1f31c88c16074adaf19d8d1e`.

<a id="source-skinner-2020"></a>

### skinner-2020

Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/pdf/1405.7294v1). arXiv:1405.7294v1 (28 May 2014); published in Annals of Mathematics 191 (2020) 329–354; read 2026-10-08 Independently collated with the published PDF (Annals of Mathematics 191 (2020), 329–354) in §2.5–2.6 pp.341–344 by REV-GrossZagierAndArithmeticHeights--GZ.8 on 2026-10-06; earlier node locators remain explicitly to the arXiv text unless stated otherwise. This revision independently collated the indicated published sections on 2026-10-08; their hashes are recorded in sourceVersions..

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** §2.4 (Heegner points P_K(f) in Cases I and II), §2.5 (Proposition 2.5.1 and its derivation from YZZ Theorem 3.13, Corollary 2.5.2), §2.6 (the anticyclotomic p-adic L-function L_p^S(f), Proposition 2.6.1, Corollary 2.6.2).; Published-version collation: §2.5–2.6 pp.341–344..

**Public source fingerprint:** `9e4650618c83394c400a10e990759f9fba42113eedc79fe2fcbe029d6c8381ff`.

<a id="source-jsw-2017"></a>

### jsw-2017

Dimitar Jetchev, Christopher Skinner and Xin Wan, [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/pdf/1512.06894v1). arXiv:1512.06894v1 (21 Dec 2015), the latest arXiv version; published in Cambridge Journal of Mathematics 5 (2017) 369–434. Read the arXiv version 2026-10-08; locators are to it. Independently collated with the published PDF (Cambridge Journal of Mathematics 5 (2017), 369–434) in §5.1 pp.408–413 by REV-GrossZagierAndArithmeticHeights--GZ.8 on 2026-10-06; earlier node locators remain explicitly to the arXiv text unless stated otherwise. This revision independently collated the indicated published sections on 2026-10-08; their hashes are recorded in sourceVersions..

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** §3 opening ((split), (irred_K)), §4.1–4.2 ((H), (gen-H), (sign −1), the Shimura curve X_{N+,N−}, Remark 4.2.1), §5.1 in full (Σ_cc, the interpolation formula (5.1.a), Remark 5.1.1, Proposition 5.1.3, the incomplete L_p^Σ, Remark 5.1.4, Propositions 5.1.6–5.1.7 with proof).; Published-version collation: §5.1 pp.408–413..

**Public source fingerprint:** `908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d`.

<a id="source-brooks-2015"></a>

### brooks-2015

Ernest Hunter Brooks, [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content). International Mathematics Research Notices 2015, no. 12, 4177–4241, doi:10.1093/imrn/rnu062 (published version, EPFL Infoscience copy); read 2026-10-08, pages 62–63 also inspected as rendered images.

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** §1 (Theorem 1.1 and the outline), §6.4 (the case of weight two), §7 Proposition 7.4 and Lemma 7.5, §8 in full (8.1 character spaces, 8.2 Lemma 8.1 and Theorem 8.2, 8.3 Propositions 8.3–8.5 and Lemma 8.4, 8.4 Propositions 8.7–8.9 and Lemma 8.6, 8.5 Proposition 8.10 and Theorem 8.11, 8.6 Propositions 8.12–8.13)..

**Public source fingerprint:** `90898527cf2e7e69bb6eba200dc7646e7f61837fa310299852ea2b958f925219`.

<a id="source-bdp-2013"></a>

### bdp-2013

Massimo Bertolini, Henri Darmon and Kartik Prasanna (appendix by Brian Conrad), [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf). Duke Mathematical Journal 162 (2013), no. 6, 1033–1148, doi:10.1215/00127094-2142056 (published version, from Darmon's publication page); read 2026-10-08.

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** Introduction, the r = j = 0 discussion (pp. 1038–1039), Remark 2.6 and Proposition 2.7, §5 in full (5.1 Theorems 5.1, 5.4, 5.5 and Lemmas 5.2–5.3; 5.2 the p-adic period (5.2.2), the definition (5.2.3)–(5.2.4), Theorems 5.7 and 5.9, Proposition 5.10, Remark 5.11; 5.3 Assumption 5.12, Theorem 5.13 with proof)..

**Public source fingerprint:** `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`.

<a id="source-castella-hsieh-2018"></a>

### castella-hsieh-2018

Francesc Castella and Ming-Lun Hsieh, [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2). arXiv:1505.08165v2 (7 Jan 2017); published in Mathematische Annalen 370 (2018) 567–628; read 2026-10-08.

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** §3.3 (Definition 3.4, the toric period, Proposition 3.6, Definition 3.7 of the measure L_{p,ψ}(f), Proposition 3.8, Theorem 3.9), §4.5 (Bloch–Kato logarithm, Theorem 4.9)..

**Public source fingerprint:** `a98f9f37a45f46b55968e1fde8fc952b909dda91e6239dafc1dd3688fd8b9755`.

<a id="source-castella-2020-exceptional"></a>

### castella-2020-exceptional

Francesc Castella, [On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1). arXiv:1507.04260v1 (15 Jul 2015; manuscript dated 19 Sep 2018); published in Journal of the Institute of Mathematics of Jussieu. Read the arXiv version 2026-10-08; locators are to it..

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** Introduction (the exceptional zero (0.3), the L-invariant (0.4) and the main theorem), §2.5 (Theorems 2.10 and 2.11, the semistable p-adic Gross–Zagier formula), §3.4 (Theorem 3.11)..

**Public source fingerprint:** `f58fcad0d1869ee6888d97b4b73b9a86a806abb95170e7800ae800d62e13a2cf`.

<a id="source-castella-2018-multiplicative"></a>

### castella-2018-multiplicative

Francesc Castella, [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2). arXiv:1704.06608v2 (14 Jun 2017); published in Cambridge Journal of Mathematics 6 (2018). Read the arXiv version 2026-10-08; locators are to it. Independently collated with the published PDF (Cambridge Journal of Mathematics 6 (2018), 1–27) in §3 pp.13–15 by REV-GrossZagierAndArithmeticHeights--GZ.8 on 2026-10-06; earlier node locators remain explicitly to the arXiv text unless stated otherwise. This revision independently collated the indicated published sections on 2026-10-08; their hashes are recorded in sourceVersions..

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** §1 (introduction, the p-adic Waldspurger formula (1.c) for p | N and the role of the L-invariant), §3 (Theorem 3.1 with proof, (3.1), Theorem 3.2 with proof).; Published-version collation: §3 pp.13–15..

**Public source fingerprint:** `23e3ab4e9d99ceba88d3aaf0fa0612b60ac728086f82555f951f4e1853323081`.

<a id="source-bsw-2026"></a>

### bsw-2026

Ashay Burungale, Christopher Skinner and Xin Wan, [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/pdf/2603.20886v2). arXiv:2603.20886v2 (10 May 2026); read 2026-10-08.

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** §1.1–1.4 (the BDP formula (1.1), the question about every eigenlogarithm, Theorem 1.1), §2.3 (Theorem 2.8 for χ-twisted Heegner-type points)..

**Public source fingerprint:** `f2b4a020bf5dbcd33df3a4b30cbf27230dc0d0775312f5e543b03b2486f6a994`.

<a id="source-burungale-2015"></a>

### burungale-2015

Ashay A. Burungale, [On the non-triviality of generalised Heegner cycles modulo p, II: Shimura curves](https://arxiv.org/abs/1504.02342v1). arXiv:1504.02342v1, 9 April 2015; read 2026-10-08. Used for integral measure construction, not an unchecked normalization of Theorem 5.6..

Inherited from accepted GZ.8; no claim that this worker read all listed sections.

**Recorded locators:** §5.2 pp.27–29, Lemma 5.5 and (5.8): integral local CM measures and their translated finite sum..

**Public source fingerprint:** `ebbfda7c2b0f341754a3fcb7dba993846d2101fd8eecb978e0ee1e768350f464`.
