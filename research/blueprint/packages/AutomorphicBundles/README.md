# Automorphic bundles and classical automorphic forms

An automorphic form has a coefficient, a field of definition and a condition at
the boundary. This roadmap constructs these three pieces together. Starting
from a Shimura datum, it turns a representation of the Hodge parabolic into a
vector bundle on the canonical model, extends that bundle across a toroidal
boundary and defines classical and cuspidal forms as sections. It then equips
those section spaces with Hecke operators and Fourier–Jacobi expansions. The
modular, Hilbert, Siegel and unitary examples fix the conventions needed to use
the construction in arithmetic applications.

A representation of the entire coefficient group carries additional structure:
Betti and étale local systems, and a filtered de Rham bundle with a connection.
A representation of a Levi or parabolic alone does not acquire a flat
connection. Keeping this distinction visible connects classical coherent
coefficients with their Hodge–Tate comparisons without changing their meaning.

The principal references are Milne for canonical principal bundles and
rationality, Deligne for absolute Hodge tensors, Lan for integral PEL boundary
charts and expansions, Diamond for ramified Hilbert coefficients, and
Boxer–Calegari–Gee–Pilloni for the classical Siegel comparisons. Source labels
below refer to the editions in the references; page numbers follow those
editions. All mathematical statements are specifications for library work.
[Suggested.lean](Suggested.lean) gives proposed Lean forms; this README is the
specification.

## Scope and neighbouring roadmaps

The roadmap owns the canonical automorphic principal bundle, the associated
coefficient functor, its realization comparisons, canonical and subcanonical
extensions, classical section spaces, geometric Hecke actions and their
Fourier–Jacobi expansions. The following inputs have separate owners.

| Supplier | Interface used here |
|---|---|
| `ShimuraData:D3` | Reflex compact dual, filtration parabolic, Borel embedding and homogeneous variation |
| `ShimuraVarieties:V1`, `V2`, `V4`–`V8`, `V8.general` | Analytic tower, minimal model, CM reciprocity, canonical families, connected and general conjugation, arithmetic finite étale tower |
| `AbelianSchemesAndArithmeticModuli:A4`, `A5` | Relative H¹, Hodge sequence, Gauss–Manin connection, comparison maps and abelian-type descent |
| `PELModuli:M0`, `M3`, `M5` | PEL data and actual fine-level Siegel and unitary families |
| `HilbertModularVarietiesAndShimuraCurves:H0`–`H4` | Hilbert data and families, ramified splitting models, unit/polarization quotients and central level kernels |
| `ShimuraCompactifications:C0`–`C6`, `C2.general`, `C3.general` | Fans, cusp stabilizers, toroidal models, reduced Cartier boundary, refinements, Mumford families and the specified integral formal charts |
| `AlgebraicModuliForArithmeticGeometry:R09.3`, `R09.5` | fpqc quasi-coherent descent and finite tame coarse quotients |
| `ComplexComparisonPartII:C0`, `C2` | Analytification and projective coherent GAGA |
| `SchemeAndStackFoundations:SF.0`, `SF.1`, `SF.2` | Quasi-coherent tensor/trace, atlas descent and qcqs section-colimit comparison, coherent cohomology |
| `AdicSpacesPartII:F0` | Formal completion, completion of morphisms and coherent-section detection near a closed subset |
| `AdelicAlgebraicGroups:AA.4` | Double-coset correspondences, degrees and the Cartesian square with its product hypothesis |
| `AlgebraicModularFormsAndSerreWeights:R15.1`, `R15.2` | Modular Hodge line, Tate normalization, all-weight analytic comparison, integral q-expansion principle and modular Hecke operators |
| Tau Ceti ClassicalGroups layers 2–3 | Schur construction and complex highest-weight representations |
| `HodgeTateAndCanonicalSubgroups:T6:comparison` | Logarithmic finite-dimensional de Rham/Hodge–Tate comparison and its compact-support version |

Generic algebraic torsors and contracted products, central quotient tori,
tensor-stabilizer representability and rational/integral representation theory
belong to the reductive-group direction (`ReductiveGroupsPartII`). The precise
supplier contracts are collected below. Borel-character line bundles on full
flags in Tau Ceti LieGroups layer 8 do not replace coefficients for a Hodge
parabolic on a reflex compact dual.

The geometric modular-form objects remain with R15.1–R15.2. The GL₂ targets
here compare their objects with the uniform automorphic construction. Tau
Ceti ModularForms layer 10C owns its analytic automorphy sheaf and dimension
formulas. Neither a second modular-form carrier nor a second Hecke algebra is
required here.

Higher integral coherent cohomology and Hecke-equivariant perfect complexes
belong to `AutomorphicBundlesPartII`. Locally analytic and overconvergent
weights belong to `OverconvergentAutomorphicForms`; the analytic/derived VB
functor belongs to `HigherHidaAndColemanTheory`. The dual BGG/Kostant supplier
for the Siegel comparison is `LieHighestWeightPartIICompletedCategoryO`.
These last two supplier directions require the finite-dimensional contracts
specified below, without an invented layer identifier.

Consumers include HodgeTateAndCanonicalSubgroups T1, T2 and T6:comparison,
PerfectoidShimuraVarieties S6, AutomorphicGaloisRepresentationsPartII AG2.1a
and AG2.4, TorsionCohomologyInfrastructure TC.1, HilbertModularVarietiesAndShimuraCurves
H5, OverconvergentAutomorphicForms O1/O6/O8, AutomorphicPadicLFunctions,
AutomorphicCongruences, IntegralIwasawaTheory and PadicFamilies. Analytic
p-level families of Hilbert expansions are the overconvergent consumer's
work. Multiplication of Siegel Fourier–Jacobi expansions and their analytic
Fourier-series comparison are additional consumer interfaces, beyond the
rank-one analytic comparison specified here.

## Conventions

Fix a Shimura datum (G, X), its reflex field E, a finite level K, and a
coefficient field L containing E over which the actual coefficient is
defined. L need not equal E. Choose L ↪ ℂ when making an analytic comparison.
The characteristic-zero Hodge/abelian construction and the general-data
construction have separate layers. Every integral assertion names a good
PEL base or a ramified Hilbert model explicitly.

Write Gᶜ = G/Z_s, where Z_s removes the excess real-split central torus; this
is neither the whole centre nor the adjoint group. Arithmetic descent checks
the action of the ineffective centre and every finite stabilizer on fibres.
Neatness does not remove infinite central units. At a non-neat level use
equivariant sheaves on the stack; passage to a coarse space requires its own
fibre-triviality and tame hypotheses.

Use the cohomological Hodge filtration unless homology is explicitly named.
With μ_h(z) = h_ℂ(z,1), its action on H^{p,q} is z^(−p).
The filtration parabolic is P_H = P(μ_h⁻¹), its Levi is M = Z_G(μ_h), and the
BCGP Hodge–Tate convention uses the opposite P_HT = P(μ_h) and left cosets.
Identify the two flag conventions by the stated inversion/duality comparison.
The fibre highest weight λ and the function character −w₀,M λ are different
labels. Tate and similitude lines remain explicit throughout.

For a right P-torsor T use (t,v) ∼ (tp,ρ(p)⁻¹v), so a section is a function
f(tp) = ρ(p)⁻¹f(t). For a left action on X use
J(gh,x) = J(g,hx)J(h,x). The resulting slash operator is
(f|g)(x) = J(g,x)⁻¹f(gx), with f|(gh) = (f|g)|h. In Lean,
`e.trans f` applies e and then f. The determinant-negative GL₂(ℝ) scalar law
is semilinear over ℂ; the linear compatibility test is restricted to SL₂.

Write V(J) for the automorphic coefficient and V(J)^can_Σ for its normalized
canonical extension on S_Σ. Put V(J)^sub_Σ = V(J)^can_Σ ⊗ I_D, where D is
the **reduced** boundary. Boundary frames characterize the canonical
extension; its restriction to the open variety alone does not. Minimal
pushforwards are coherent and need not be locally free. A boundary blow-up
need not pull back a subcanonical extension isomorphically.

Over L set M(J,K;L) = H⁰(S_Σ,V(J)^can_Σ) and
S(J,K;L) = H⁰(S_Σ,V(J)^sub_Σ). These are section spaces on a proper model.
On Lan's good-prime integral model the scalar notation is
AF(k,M) = Γ(S_Σ,ω_tor^k ⊗_R M), k ≥ 0, with M an arbitrary R-module.
For vector coefficients use Ecan(W) = V(W)^can and Esub(W) = Ecan(W) ⊗ I_D.
The integral coefficient interfaces have stronger hypotheses than the field
case; their exact contracts appear under B5.

At a cusp Φ retain the character lattice X_Φ, its cone, the abelian torsor
C_Φ, the invertible character sheaves Ψ_Φ(ℓ), the finite cover of the
lower-dimensional moduli stack and the **full** cusp stabilizer. The
boundary determinant line is L_Φ = det_ℤ(X_Φ) ⊗ ω_A. The relative invariant
differential on a Tate fibre is du/u; dq/q lives on the base.

Use H_g = tr_p₁ ∘ θ_g ∘ p₂* and T_g = ν(g)H_g, with ν a multiplicative
K-bi-invariant character of the admissible monoid into R×. Trace means the
finite locally free trace extended using the specified toric refinement
comparison. For GL₂ choose ν(g) = det(g)⁻¹ when comparing with the analytic
normalization. An unramified modular ℓ-correspondence has degree ℓ+1, so
T_ℓ(1) = (ℓ+1)/ℓ in weight zero. Use BCGP's transposed correspondence
convention, and compare it with the existing inverse/right-coset Hecke action.

For Hodge–Tate comparisons ℚ_p(1) has weight −1 and Sen eigenvalue +1.
BCGP §4.5 includes the μ-weight twist in the classical VB⁰ comparison;
§4.8 uses untwisted coherent coefficients and puts the twists in the
decomposition. Count each twist once.

## Existing library interfaces

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`. The following existing interfaces
are the starting points, with the limited scope shown.

| Interface | Use |
|---|---|
| Mathlib `SlashAction`, `LinearEquiv.trans`, `trans_symm`, `symm_apply_eq`, `automorphismGroup`, `applyDistribMulAction` | Normalized linear cocycles and the existing indexed right action |
| Mathlib `UpperHalfPlane.denom_ne_zero`, `denom_cocycle`, `denom_cocycle'`; `ModularForm.SL_slash_apply`, `slash_action_eq'_iff`, `smul_slash` | Scalar GL₂ convention comparison, including determinant-sign semilinearity |
| Mathlib `ModularForm`, `CuspForm`, `UpperHalfPlane.qExpansion`, `ModularForm.qExpansion_injective`, `ModularForm.isCuspForm_iff_coeffZero_eq_zero` | Analytic scalar objects; the constant-coefficient cusp criterion here is the full-level case |
| Mathlib `ModularForm.trace`, `CuspForm.trace` | Unnormalized analytic sums at finite relative index; geometric trace is a separate construction |
| Mathlib `AlgebraicGeometry.Scheme.Modules`, `.presheaf`, `.pushforward`, `.pushforward_obj_obj`, `.Hom.app` | Actual scheme module sheaves and their maps |
| Mathlib `SheafOfModules.sections`, `sectionsMap`, `sectionsMap_id`, `sectionsMap_comp`; `AlgebraicGeometry.tilde.isoTop` | Compatible sections and evaluation of affine tilde modules |
| Tau Ceti `AlgebraicGeometry.Scheme.Modules.tensorProduct` | Sheafified scheme-module tensor product |
| Mathlib `CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono` | Propagate injectivity through the two left-exact coefficient rows |
| Mathlib `IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`, `induction_on_isQuotientEquivQuotientPrime` | Finite prime filtrations and exact-sequence induction |
| Mathlib `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`, `IsHausdorff.of_isLocalRing`, `AdicCompletion.of_injective` | Finite-stalk separation over a Noetherian local ring at a proper ideal |
| Mathlib `PowerSeries.isUnit_iff_constantCoeff`, `Algebra.trace_algebraMap_of_basis` | Completion-map obstruction and finite-free trace normalization |
| Tau Ceti `HeckeCosetModule.instRingHeckeRing`, `HeckeRing.GL2.heckeRingHomCharSpace`, `twistedHeckeSlashSum_diagCosetGamma0_of_prime` | Existing convolution ring and analytic nebentypus action at good primes |

The associated **algebraic** bundle of a group-scheme torsor is required.
Tau Ceti's balanced product for covering spaces with discrete fibre does not
provide it. Scheme module sheaves likewise do not identify a supplied scheme
with a Shimura model or a supplied sheaf with its canonical coefficient.

## Layers

| Layer | Output | Main preceding inputs |
|---|---|---|
| B0 | Coefficient group, descent and analytic coefficients | D3, analytic tower, reductive-group and descent interfaces |
| B1 | Hodge/abelian canonical principal bundle | B0, A4, canonical families, absolute Hodge theory |
| B1.general | General canonical principal bundle | B0, connected conjugation and second jets |
| B2 | Associated bundles and realizations | B0–B1, algebraic tensor/connection descent |
| B2.general | General associated bundles and realizations | B1.general, B2's functorial interfaces |
| B3 | Canonical/subcanonical extensions | B2, C0–C5, coherent foundations |
| B3.general | General boundary extension and functoriality | B2.general, C2.general/C3.general |
| B4 | Classical forms and explicit weights | B2–B3.general, modular/Hilbert/PEL families |
| B5 | Hecke action, expansions and classical Siegel comparisons | B0–B4, integral coefficient contracts, C0–C6, F0, SF.0–SF.2, T6:comparison |

All proposed names lie under `AutomorphicBundles`; names in the text omit
that common prefix. Suggested module homes are
`TauCeti/Geometry/Shimura/AutomorphicBundles/`, with `Principal`,
`Coefficients`, `Extensions`, `ClassicalForms`, `FourierJacobi`, `Hecke`,
`Hilbert` and `SiegelComparison` submodules. A functorial map API includes
identity and composition laws with the datum, level, base and coefficient
hypotheses held fixed. These laws also test independence of proof terms.


## B0. Associated coefficients and descent

The first layer fixes the coefficient group and the algebraic and analytic descent conventions.
Use the generic algebraic torsor/contracted-product interface of the reductive-group direction,
the reflex flag and Borel embedding of D3, and the effective arithmetic quotient of V1. The
central and coefficient-field checks belong to the construction, before choosing a weight.

### The coefficient quotient Gᶜ — `centralSplitQuotient`

For a reductive ℚ-group in a Shimura datum, form the algebraic quotient Gᶜ = G/Z_s. Here Z_s is
the largest central ℚ-subtorus that splits over ℝ and has no nonzero ℚ-split subtorus; use
Milne's character-lattice description, equivalently Lan's removal of excess real split rank.
Algebraic representations factor through the quotient exactly when Z_s acts trivially. For GL₂
this torus is trivial; for Res_{F/ℚ}GL₂ with F totally real of degree d its dimension is d−1.
The quotient retains central characters that an adjoint quotient would erase.

**API.**

- `centralSplitQuotient_quotient`: The algebraic epimorphism q:G→Gᶜ has kernel Z_s.
- `centralSplitQuotient_factor`: If ρ|Z_s=1 there is a unique ρᶜ with ρ=ρᶜ∘q.
- `centralSplitQuotient_factor_iff`: An algebraic representation factors through q iff Z_s acts trivially.

**Tests.**

- `centralSplitQuotient_test_gl2`: For G=GL2/Q, ranks of its centre over Q and R agree, so Z_s=1 and Gᶜ=G.
- `centralSplitQuotient_test_hilbert`: For G=Res(F/Q)GL2 with [F:Q]>1 totally real, Z_s has dimension [F:Q]−1; replacing Gᶜ by G without a central condition admits forbidden coefficients.
- `centralSplitQuotient_test_trivial`: The trivial representation factors through Gᶜ and stays trivial.

**Prerequisites.** The group-action and field hypotheses stated above.

**Sources.** [Milne90], III §1, p.52; III §3, p.58; [LanIntro], §5.3 Theorem 5.3.1, p.63.

### Ineffective stabilizers and coefficient descent — `ineffectiveFibreDescent`

Separate the arithmetic group from its effective action on the Hermitian domain. Check the
action of its ineffective central kernel on every coefficient fibre before descending the
analytic bundle. For a finite tame quotient in characteristic zero, descent of an equivariant
locally free coefficient to the coarse space is equivalent to trivial stabilizer actions on the
fibres. An infinite arithmetic central kernel needs the separate effective-quotient argument; a
neat group can still contain nontrivial central units. Retain the stack coefficient whenever the
fibre-triviality or tame assumption fails.

**Prerequisites.** B0 `centralSplitQuotient`; `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Sources.** [Milne90], III §8, pp.63–64.

### Hodge and opposite parabolic conventions — `hodgeParabolicConvention`

Fix μ_h(z)=h_ℂ(z,1) acting by z^(−p) on H^{p,q}, with F^a=⊕_{p≥a}H^{p,q}.
Construct the filtration stabilizer
P_H=P(μ_h⁻¹), with Levi Z_G(μ_h), from D3's filtration and compact-dual interfaces. Compare it
explicitly with the opposite P_HT=P(μ_h) and BCGP's left-coset flag. The comparison includes
inversion of left/right cosets and the required dual coefficient. A sign choice for μ alone does
not identify the two associated bundles.

**Prerequisites.** `ShimuraData:D3/filtration-parabolic`; `ShimuraData:D3/compact-dual`.

**Sources.** [CS], §2.3, pp.669–671; [BCGP], §3.2.13–3.2.16, p.44; §4.8 before Remark 4.8.1, p.101.

### Equivariant coefficients on the compact dual — `compactDualCoefficient`

Over the actual coefficient field L, let V be a finite-dimensional algebraic representation of
P_Hᶜ. Define its Gᶜ-equivariant bundle on the compact dual by Gᶜ×^{P_Hᶜ}V, using
(g,v)∼(gp,ρ(p)⁻¹v). Allow parabolic representations with nontrivial unipotent action as well as
representations factoring through the Levi. Supply morphisms, tensor/dual/unit identifications
and pullback. On the GL₂ flag the tautological character gives O(−1); its inverse gives O(1).

**API.**

- `compactDualCoefficient_fibre`: At the base flag the P-equivariant fibre is V with action ρ.
- `compactDualCoefficient_inflate`: The coefficient for an M representation equals that for its inflation to P.
- `compactDualCoefficient_tensor`: Associated coefficients preserve tensor products, duals and the tensor unit.
- `compactDualCoefficient_map`: For a Pᶜ-equivariant linear map u:V→W over the fixed coefficient field, the induced map sends [g,v] to [g,u(v)] on the associated compact-dual bundles.
- `compactDualCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `compactDualCoefficient_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `compactDualCoefficient_test_unit`: The trivial one-dimensional representation yields O_X̌.
- `compactDualCoefficient_test_gl2`: For G=GL2/L and P the stabilizer of Le₁, the contracted-product bundle for χ(p)=a when pe₁=ae₁ is O_(P¹)(−1), via [g,v]↦vge₁; the inverse character χ⁻¹ gives O_(P¹)(1). The cohomological Hodge convention must declare which of these characters is used.
- `compactDualCoefficient_test_unipotent`: The standard P representation with a nontrivial upper-triangular unipotent action is not isomorphic as P-module to its associated graded inflation.

**Prerequisites.** B0 `centralSplitQuotient`; B0 `hodgeParabolicConvention`; `ShimuraData:D3/reflex-flag-descent`;
`AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

**Sources.** [Milne90], III §2, Remark 2.3(a), pp.54–56.

### The analytic filtration torsor — `homogeneousHodgeTorsor`

Pull the compact-dual P_Hᶜ-torsor back along the actual Borel embedding X→X̌. Its quotient by
the unipotent radical is the torsor of graded Hodge frames. Give the compatible action and
associated coefficient identification. A connection on the full group torsor does not
automatically give a flat connection on this filtration reduction.

**API.**

- `homogeneousHodgeTorsor_filtered_frames`: A point is a tensor-compatible frame identifying the reference and varying filtrations.
- `homogeneousHodgeTorsor_graded`: The U quotient parametrizes individual frames of the graded pieces.
- `homogeneousHodgeTorsor_pullback_coefficient`: Associating a P coefficient to this torsor is the Borel pullback of its compact-dual bundle.

**Tests.**

- `homogeneousHodgeTorsor_test_point`: At the reference point the torsor has its reference frame.
- `homogeneousHodgeTorsor_test_standard`: For the symplectic standard representation the associated filtration is the Hodge exact sequence.
- `homogeneousHodgeTorsor_test_graded`: Two filtered frames differing by a nonidentity unipotent element have the same graded frame, but remain distinct filtered frames.

**Prerequisites.** B0 `compactDualCoefficient`; `ShimuraData:D3/borel-embedding`;
`ShimuraData:D3/homogeneous-variation`.

**Sources.** [CS], §2.3, p.670.

### Analytic arithmetic-quotient coefficients — `analyticCoefficient`

For the actual arithmetic quotient of X, descend the Borel-pulled homogeneous coefficient
through the effective group. Require a torsion-free effective action and trivial action of the
ineffective kernel on fibres, or retain the equivariant stack formulation. Obtain its
holomorphic bundle structure from the Borel embedding and coefficient, rather than from a
quotient of smooth spaces alone.

On an adelic component write the coefficient as Γ\(G(ℝ)×V)/K_∞, with
(g,v)·k=(gk,ρ(k)⁻¹v). Its holomorphic structure is the one induced by the
compact-dual coefficient, with the same ineffective-kernel descent condition.

**API.**

- `analyticCoefficient_local_trivial`: A small quotient chart identifies the coefficient with its holomorphic product bundle.
- `analyticCoefficient_section_equiv`: Sections correspond to equivariant functions under the diagonal fibre relation.
- `analyticCoefficient_change_frame`: Changing the frame conjugates the transition cocycle and preserves the descended bundle.
- `analyticCoefficient_map`: An equivariant morphism u between the supplied compact-dual coefficients descends on each effective analytic quotient; in a compatible frame it sends the class of (x,v) to (x,u(v)).
- `analyticCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `analyticCoefficient_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `analyticCoefficient_test_trivial`: The trivial representation gives the holomorphic structure sheaf on Γ_eff\X.
- `analyticCoefficient_test_odd`: The −1 stabilizer acts by −1 on an odd-weight GL2 coefficient, so that coefficient does not descend to the coarse quotient unless that stabilizer is removed.
- `analyticCoefficient_test_rank`: The local rank equals dim V, independent of the arithmetic component.

**Prerequisites.** B0 `ineffectiveFibreDescent`; B0 `homogeneousHodgeTorsor`.

**Sources.** [HarrisBundles], Entire note, pp.1–2.

### Sections as equivariant functions — `sectionsEquivariant`

Identify sections of the associated bundle of a right P-torsor T with coefficient-valued
functions satisfying f(tp)=ρ(p)⁻¹f(t). In a local frame on a left arithmetic quotient this
becomes f(γx)=J(γ,x)f(x), where J(gh,x)=J(g,hx)J(h,x). Establish the identifications with their
regular or holomorphic hypotheses, and their compatibility with coefficient maps and frame
changes.

**Prerequisites.** B0 `compactDualCoefficient`; B0 `analyticCoefficient`.

**Sources.** [HarrisBundles], p.1, equation (1) and its consistency check.

### Descent over the coefficient field — `coefficientGaloisDescent`

For a finite Galois splitting extension L/E, descend the equivariant coefficient using its
actual semilinear transport maps and cocycle. Tensor, dual and base-extension operations commute
with this descent. A highest weight descends only with the representation's Galois datum; use
its stabilizer field where necessary. In an embedding-labelled example a parallel tensor
survives permutation of factors, whereas a nonparallel label is not automatically defined over
E.

**API.**

- `coefficientGaloisDescent_base_change`: The descended coefficient tensored with L is the original J with its given descent maps.
- `coefficientGaloisDescent_unique`: Morphisms over E are exactly L-morphisms compatible with all d_σ.
- `coefficientGaloisDescent_associate`: Descent commutes with association to a descended principal torsor.
- `coefficientGaloisDescent_map`: A coefficient morphism commuting with the actual semilinear Galois descent isomorphisms descends uniquely; its base change is the supplied split-coefficient morphism.
- `coefficientGaloisDescent_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `coefficientGaloisDescent_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `coefficientGaloisDescent_test_identity`: For L=E and the identity datum descent returns J.
- `coefficientGaloisDescent_test_parallel`: For a real quadratic F split by L/E, the split tensor of the two embedding-labelled Hodge lines with equal exponent r admits the factor-swap descent isomorphism; applying the nontrivial permutation twice is identity. Retain the actual descent datum of the underlying HB family.
- `coefficientGaloisDescent_test_nonparallel`: For a real quadratic F and weight (k1,k2) with k1≠k2, the nontrivial embedding permutation does not fix the label; it cannot be descended by declaring all d_σ identities.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`; B0
`compactDualCoefficient`.

**Sources.** [Milne90], III §5, Theorem 5.1, p.61.

### Algebraic and analytic coefficient descent — `geometricAnalyticCoefficients`

Compare the analytification of the actual algebraic associated coefficient with the holomorphic
bundle constructed from the same torsor and representation. The comparison respects equivariant
sections and tensor maps. Prove it by descent on the named torsor charts; no assertion of
coherent GAGA for a nonproper open variety is needed.

**Prerequisites.** B0 `coefficientGaloisDescent`; B0 `analyticCoefficient`; `ComplexComparisonPartII:C0`.

**Sources.** [Milne90], III §3, Lemma 3.1 and Propositions 3.2–3.5, pp.58–59.


## B1. Canonical principal bundles of Hodge and abelian type

Begin with the actual Hodge-type universal family and its degree-one comparisons. Finite tensors
specify the group, absolute Hodge theory transports those tensors, and their de Rham frames
construct the torsor. The filtration reduction, CM normalization and independence of embedding
then identify its canonical rational model. Connected central-isogeny descent supplies the
abelian-type extension.

### Reductive groups as tensor stabilizers — `finiteTensorStabilizer`

For a faithful representation of a reductive group in characteristic zero, choose finitely many
mixed tensors whose scheme-theoretic pointwise stabilizer is exactly the group. Include duals
and the stated Tate-coordinate convention. Stabilizing a line up to scalar is a weaker condition
and does not provide the tensor-preserving frame torsor used here.

**Prerequisites.** The group-action and field hypotheses stated above.

**Sources.** [Deligne], §3 Proposition 3.1(a–c), pp.22–23; [CS], §2.3, p.667.

### Absolute Hodge tensors in abelian families — `absoluteHodgePropagation`

Let A be an abelian variety over an algebraically closed field of characteristic zero,
with a chosen embedding into ℂ. Every rational Hodge tensor built from H¹(A), its dual
and Tate twists is absolute Hodge. For a smooth proper abelian family over a connected
smooth complex base, a horizontal tensor of type (0,0) at every fibre propagates from
being absolute Hodge at one fibre to being absolute Hodge at all fibres. Retain the
compatible Betti, de Rham and étale realizations in this propagation. This gives
absolute Hodge classes without an assertion that they are algebraic cycles or that
every motive has an abelian realization.

**Prerequisites.** `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [Deligne], Main Theorem 2.11, p.19; Principle B, Theorem 2.12, p.20,
and Theorem 2.15, p.21; Proposition 6.1, pp.41–42; [CS], §2.3 Lemma 2.3.2, pp.668–669.

### Descended Hodge-tensor realizations — `hodgeTensorRealizations`

For a Hodge-type datum with a chosen symplectic embedding and sufficiently small level,
let A/S be the universal abelian scheme over the canonical reflex field E. Realize the
finite defining family of rational Hodge tensors in H=H₁(A)=(R¹π_*)∨ and its Betti,
étale and de Rham tensor constructions, including Tate twists. The de Rham tensors
are horizontal, lie in the required filtration and descend to E using arithmetic
Galois invariance and absolute-Hodge comparison.
The standard homology module is the dual of relative H¹ and carries the declared Tate lines. The
realizations preserve the tensor relations defining Gᶜ.

**API.**

- `hodgeTensorRealizations_horizontal`: The de Rham defining tensors satisfy ∇sα,dR=0.
- `hodgeTensorRealizations_compare`: The Betti–de Rham and Betti–étale comparisons send each sα to its named realization, with the same Tate normalization.
- `hodgeTensorRealizations_galois`: After base change to Ebar the named tensor sections are fixed by Gal(Ebar/E), hence descend to E.

**Tests.**

- `hodgeTensorRealizations_test_endomorphism`: An algebraic endomorphism of A acts compatibly in all three degree-one realizations.
- `hodgeTensorRealizations_test_polarization`: The polarization tensor is valued in the specified Tate line; ignoring that line changes GSp to Sp.
- `hodgeTensorRealizations_test_zero`: Adding a zero tensor does not change the simultaneous stabilizer or the descended frame torsor.

**Prerequisites.** B1 `finiteTensorStabilizer`; B1 `absoluteHodgePropagation`;
`AbelianSchemesAndArithmeticModuli:A4`; `PELModuli:M3`; `ShimuraVarieties:V5`;
`ShimuraVarieties:V8`.

**Sources.** [CS], Lemmas 2.3.1–2.3.2, pp.668–669; [AG], §3.3; §3.5, pp.418–422.

### The tensor-preserving de Rham frame torsor — `tensorFrameTorsor`

Define the de Rham frame functor by tensor-preserving isomorphisms η:V⊗O→H_dR. The right action
is η·g=η∘g. Prove representability and local nonemptiness from the tensor comparison, then
identify it as the relevant principal torsor. Being a closed subfunctor of an isomorphism scheme
by itself proves neither local nonemptiness nor the torsor property.

**API.**

- `tensorFrameTorsor_frame`: A T point is an invertible frame of H carrying every reference tensor to its de Rham realization.
- `tensorFrameTorsor_right_action`: η·g=η∘g, and T×G→T×_S T is an isomorphism.
- `tensorFrameTorsor_coefficient`: T×^G V identifies with H_dR for the chosen faithful coefficient.

**Tests.**

- `tensorFrameTorsor_test_identity`: For a constant tensor-equipped bundle V⊗O_S, identity is a global frame and T≃G×S.
- `tensorFrameTorsor_test_sp`: For a polarization with a separately varying similitude line, the correct tensor frame group is GSp; fixing the alternating form with no Tate line incorrectly yields Sp.
- `tensorFrameTorsor_test_rank`: An isomorphism frame exists only between equal-rank modules and must preserve all tensors, not just the polarization.

**Prerequisites.** B1 `finiteTensorStabilizer`; B1 `hodgeTensorRealizations`; B0 `centralSplitQuotient`.

**Sources.** [AG], Proposition 3.5.1, pp.421–422; [CS], §2.3, p.670.

### The filtered frame reduction — `filtrationReduction`

Construct the equivariant filtration map from the tensor frame torsor to the reflex-field
compact dual. Over a field where the reference parabolic is defined, identify its inverse image
with a P_Hᶜ-reduction and its unipotent quotient with graded frames. The reflex flag can have no
rational point, so do not choose a reference filtration over E without a hypothesis; nonsplit
flag forms test this distinction.

**API.**

- `filtrationReduction_flag_map`: γ(ηg)=g⁻¹γ(η) in the chosen right-torsor convention.
- `filtrationReduction_parabolic_fibre`: After choosing the reference flag over L, its inverse image is exactly the tensor-preserving filtered frames.
- `filtrationReduction_levi`: Quotienting the filtered-frame torsor by U identifies frames of gr_F H individually.

**Tests.**

- `filtrationReduction_test_siegel`: For the standard Siegel family γ records the Hodge subbundle, with its actual Lagrangian condition.
- `filtrationReduction_test_zero`: For a rank-zero coefficient the induced filtration is zero, even though the principal datum remains the same.
- `filtrationReduction_test_no_point`: For the quaternionic Shimura curve of the division algebra B=(−1,3)/Q, the compact dual is the Severi–Brauer conic of B and has no Q-point; the rational γ:Π→X̌_Q does not furnish a section Spec Q→X̌_Q. B is split over R, while 3 is not a norm from Q(i), so this tests an actual nonsplit flag form.

**Prerequisites.** B1 `tensorFrameTorsor`; B0 `homogeneousHodgeTorsor`; `ShimuraData:D3/reflex-flag-descent`.

**Sources.** [CS], §2.3, pp.669–671.

### Canonical principal bundles of Hodge type — `hodgeCanonicalPrincipalBundle`

For a Hodge-type Shimura datum in characteristic zero, construct the canonical Gᶜ-principal
bundle over the reflex canonical model, its filtration map, its full-group flat connection and
its Hecke tower maps. Compare with the analytic torsor and impose the CM-period normalization at
special points. The integral tensor-frame construction at a particular good prime is additional
model-specific work, not an all-prime consequence.

**Prerequisites.** B1 `tensorFrameTorsor`; B1 `filtrationReduction`; `ShimuraVarieties:V4`.

**Sources.** [Milne90], III §3, p.58; Theorem 4.3, pp.59–60; Example 4.4(a), p.60; [AG], §3.5, Proposition 3.5.1 and proof, pp.421–422.

### Independence of symplectic embedding — `embeddingIndependence`

Compare the canonical principal bundles obtained from two faithful symplectic embeddings of the
same Hodge-type datum. Use a common tensor realization and tensor projectors to produce the
canonical comparison. Check its cocycle for three embeddings and compatibility with filtration,
connection, Hecke maps and CM normalization.

**Prerequisites.** B1 `hodgeCanonicalPrincipalBundle`; B1 `hodgeTensorRealizations`; B1 `finiteTensorStabilizer`.

**Sources.** [CS], Remark 2.3.3; Lemma 2.3.4, pp.669–670; [AG], §3.5, proof of Proposition 3.5.1, p.422.

### The special-point normalization — `cmPrincipalNormalization`

At a special point identify the principal-bundle fibre with the corresponding CM period torsor.
Verify reciprocity compatibility with the actual special-point transport. This fixes the
canonical rational model and comparison isomorphisms; it does not supply a preferred frame, a
numerical period or a trivialization of the period torsor.

**Prerequisites.** B1 `hodgeCanonicalPrincipalBundle`; `ShimuraVarieties:V4`.

**Sources.** [Milne90], III Theorem 4.1, p.59; Example 4.2(b), p.59; Remark 4.5, p.60.

### Canonical principal bundles of abelian type — `abelianCanonicalPrincipalBundle`

Pass from Hodge-type data to abelian-type data through the stated connected central-isogeny and
finite-quotient constructions. Descend the bundle, filtration, connection and tower maps,
checking that the quotient kernel acts trivially on the coefficient fibres. Compatibility with
connected-component transport is part of the construction.

**Prerequisites.** B1 `hodgeCanonicalPrincipalBundle`; B1 `embeddingIndependence`; B1 `cmPrincipalNormalization`;
B0 `ineffectiveFibreDescent`; `ShimuraVarieties:V6`.

**Sources.** [Milne88], §7, Lemmas 7.1–7.3 and Proposition 7.4, pp.29–31; [Milne90], III §4, Theorems 4.1/4.3 and Remark 4.5(ii), pp.59–60.

### Hecke pullback of the canonical torsor — `principalHeckePullback`

Along the supplied finite étale arithmetic level maps and Hecke translations, construct the
canonical isomorphisms between the pulled-back principal bundles. They preserve the filtration
map, full-group connection and special-point normalization, and satisfy identity and composition
laws. Trace on coherent sections is a separate B5 operation.

**Prerequisites.** B1 `abelianCanonicalPrincipalBundle`; `ShimuraVarieties:V1`; `ShimuraVarieties:V8`.

**Sources.** [Milne90], III Proposition 2.1(a), p.55; Proposition 3.2, p.58; Remark 4.5(i–ii), p.60.


## B1.general. Canonical principal bundles for general data

The general-data route uses connected conjugation and its principal-automorphism argument. The
adjoint second-jet realization and the rank-one rational-point reduction precede continuous
effective descent. This is a characteristic-zero construction for general pure data; it does not
assume that the datum has a universal abelian family.

### Conjugation of connected principal bundles — `connectedPrincipalConjugation`

Fix a connected datum (G,X) with G semisimple simply connected, σ∈Aut(ℂ), and a
special point x. Construct the algebraic isomorphism from the σ-conjugate connected
standard principal bundle to that of the transported datum, normalized by the period
torsor at x. Preserve the compact-dual map, flat connection and connected Hecke-group
action. Under V7's conjugate-datum identification the comparison is independent of
auxiliary choices. Use the rank-one reduction and faithful adjoint-jet realization
below to prove that the normalization controls principal automorphisms.

**Prerequisites.** B1 `abelianCanonicalPrincipalBundle`; `ShimuraVarieties:V7`; B1.general
`generalConnectedReduction`.

**Sources.** [Milne88], Theorem 3.10 and Corollary 3.11, pp.18–20.

### The adjoint bundle and second jets — `adjointJetRealization`

Realize the adjoint coefficient faithfully inside the second jets of the tangent bundle in the
connected conjugation argument. Prove equivariance and the induced restriction on principal
automorphisms. Use the corrected order-two injection in Milne's Lemmas 9.3–9.4; an order-one
tangent realization and the withdrawn Harris 1984 assertion do not replace it.

**Prerequisites.** `ShimuraData:D3/compact-dual`; `ShimuraVarieties:V7`.

**Sources.** [Milne88], §9 Lemmas 9.3–9.4, pp.33–34.

### The general connected bundle reduction — `generalConnectedReduction`

Reduce the connected principal-bundle conjugation theorem to type-A₁ subdata after the
prescribed totally real auxiliary extension. Separate algebraic-group generation in Lemma 9.5
from generation of rational points in Lemma 9.2. The latter requires the stated special tori,
local isotropy, simplicity and continuity arguments. Do not invoke the stronger rational-point
assertion in §8.1, which its footnote leaves conjectural.

**Prerequisites.** B1.general `adjointJetRealization`; B1 `abelianCanonicalPrincipalBundle`; `ShimuraVarieties:V7`.

**Sources.** [Milne88], §9 Lemmas 9.1–9.5, pp.33–34.

### General canonical principal models — `generalPrincipalModel`

For a general pure Shimura datum satisfying Milne II (2.1), descend the normalized connected
principal bundles on the neat effective canonical tower to a canonical Gᶜ-torsor over E.
Its analytification is the homogeneous standard principal bundle, with its canonical
flat connection. Prove the continuity and effectivity of the Weil descent datum and
its compatibility with components and level maps. A family of motives is not an
additional assumed carrier for this construction.

**Prerequisites.** B1.general `generalConnectedReduction`; B0 `centralSplitQuotient`; `ShimuraVarieties:V7`;
`ShimuraVarieties:V8.general`.

**Sources.** [Milne90], III Theorem 4.3 and Example 4.4, pp.59–60.

### The rational compact-dual map — `generalCompactDualMap`

Descend the equivariant compact-dual map along the general principal-bundle descent datum. It is
defined over E with its reflex flag target and is compatible with conjugation. A rational point
of that flag variety is not needed for the map and is not asserted by its existence.

**Prerequisites.** B1.general `generalPrincipalModel`; `ShimuraData:D3/reflex-flag-descent`.

**Sources.** [Milne90], III Theorem 4.6, pp.60–61.

### Normalized conjugation and its cocycle — `generalConjugationCocycle`

Prove the two-step cocycle for the special-point-normalized conjugation transports of general
principal bundles and their compact-dual maps. Keep all coefficient-field transports. Rational
Betti statements retain the ℚ-defined weight hypothesis of Milne III Theorem 6.2.

**Prerequisites.** B1.general `generalPrincipalModel`; B1.general `generalCompactDualMap`; B1.general
`generalConnectedReduction`; `ShimuraVarieties:V7`.

**Sources.** [Milne90], III Theorem 4.1, p.59; Remark 4.5, p.60; Theorem 6.2, p.62.


## B2. Associated bundles and realizations

Pull the compact-dual coefficient to the canonical torsor and descend along its group action.
This gives the coherent automorphic bundle for parabolic coefficients. Full-group coefficients
additionally use arithmetic local-system and filtered-connection descent. Keep the
representation field, highest-weight label and homology/cohomology switch in every comparison.

### The automorphic coefficient functor — `automorphicVectorBundle`

Use the canonical principal bundle and its equivariant compact-dual map to descend γ*J to an
automorphic vector bundle V(J) over the actual coefficient field L. For a parabolic or Levi
representation take J from B0. Give a tensor, dual, unit and coefficient-map functor with
base-field and level compatibility. A full-group representation is required for the additional
flat realization; a GL₂ parabolic Hodge-line character need not extend to a rank-one GL₂
representation.

**API.**

- `automorphicVectorBundle_pullback`: Π*V(J)≃γ*J with the specified Gᶜ descent action.
- `automorphicVectorBundle_levi`: For ρ:M→GL(V), V(Jρ)≃P_dR×^{P_H}V after inflation.
- `automorphicVectorBundle_tensor`: V preserves tensor products, duals and the unit through canonical descent isomorphisms.
- `automorphicVectorBundle_scalar_extension`: V(J)⊗_L L′≃V(J⊗_L L′) for every field extension L′/L.
- `automorphicVectorBundle_map`: A Pᶜ-equivariant linear map u:V→W induces the associated coefficient map V(u) on the fixed canonical model; after pulling back to the principal torsor it is the constant map u.
- `automorphicVectorBundle_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `automorphicVectorBundle_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `automorphicVectorBundle_test_unit`: For J=O_X̌ with trivial fibre action, V(J)=O_S.
- `automorphicVectorBundle_test_hodge`: In the Siegel cohomology convention, the Hodge-line/standard Levi coefficient gives e*Ω¹_A/S, not its inverse.
- `automorphicVectorBundle_test_nonflat`: For the upper-triangular P in GL2, χ(diag(a,d))=a defines a rank-one associated automorphic coefficient. It is not the restriction of a one-dimensional GL2 representation: det^n restricts to a^n d^n and cannot equal a for any n. The full-group flat-connection functor therefore cannot be applied to this coefficient by declaring χ to extend.

**Prerequisites.** B1 `abelianCanonicalPrincipalBundle`; B1 `filtrationReduction`; B0 `compactDualCoefficient`; B0
`coefficientGaloisDescent`;
`AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

**Sources.** [Milne90], III §5, Theorem 5.1, p.61; [CS], Lemma 2.3.5, pp.670–671.

### The algebraic automorphic bundle comparison — `automorphicAnalyticComparison`

After L↪ℂ identify V(J)^an with B0's holomorphic quotient coefficient, using the same torsor,
inverse fibre action and effective arithmetic descent. Check coefficient maps, tensors and the
section transformation law under this identification.

**Prerequisites.** B2 `automorphicVectorBundle`; B0 `geometricAnalyticCoefficients`; B0 `sectionsEquivariant`.

**Sources.** [Milne90], III §3, Proposition 3.5, pp.58–59; III §5, Theorem 5.1, p.61.

### Highest weights and coefficient conventions — `leviHighestWeightConvention`

For a split Levi over L and a dominant weight λ, label the coefficient fibre by the actual
representation V_λ. In BCGP's left-coset function realization its Borel character is −w₀,Mλ. The
dual representation has highest weight −w₀,Mλ as a different statement. Provide the explicit
conversion, including similitude characters, and the Galois descent datum for nonsplit forms.

**Prerequisites.** B0 `hodgeParabolicConvention`; B0 `compactDualCoefficient`; B0 `coefficientGaloisDescent`;
`tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification`.

**Sources.** [BCGP], §3.2.13–3.2.16, p.44; Example 3.2.18, p.45.

### Betti coefficients of a full-group representation — `bettiCoefficientLocalSystem`

For a finite-dimensional rational full-group Gᶜ-representation W and a neat effective
arithmetic component Γ\X, form the Betti local system Γ\(X×W), with its arithmetic
monodromy. Its associated holomorphic flat bundle is the full-group automorphic
coefficient. When the projected weight is ℚ-defined and W has one pure weight, use
D3's rational variation of Hodge structure. Treat mixed weights weight by weight.
Preserve the homology/cohomology dual convention and Tate lines in the Siegel specialization.

**API.**

- `bettiCoefficientLocalSystem_monodromy`: On Γ\X the local monodromy is the representation of Γ on W.
- `bettiCoefficientLocalSystem_tensor`: Betti coefficients preserve tensor products and duals.
- `bettiCoefficientLocalSystem_complex_flat`: W_B⊗_Q O_an is the full-group coefficient with its flat connection.
- `bettiCoefficientLocalSystem_map`: A full-Gᶜ representation intertwiner u:V→W induces a map of the descended Betti local systems with fibre u and preserves monodromy.
- `bettiCoefficientLocalSystem_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `bettiCoefficientLocalSystem_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `bettiCoefficientLocalSystem_test_unit`: For W=Q with trivial action, W_B is the constant rational local system.
- `bettiCoefficientLocalSystem_test_standard`: For the Siegel homology representation, W_B=H₁ of the actual universal abelian family, not R¹π_*Q without a dual.
- `bettiCoefficientLocalSystem_test_levi`: The GL2 upper-triangular Levi character (a,d)↦a is not the restriction of any one-dimensional GL2 representation (whose character is det^n). It cannot be supplied as a full-group rank-one Betti input without an extension.

**Prerequisites.** B0 `centralSplitQuotient`; B0 `ineffectiveFibreDescent`; B2 `automorphicAnalyticComparison`;
`ShimuraData:D3/homogeneous-variation`.

**Sources.** [AG], §3.3, p.418; [Milne90], III §6, pp.61–62, including Remark 6.1 and Theorem 6.2.

### Étale coefficients from the canonical tower — `etaleCoefficientLocalSystem`

Choose a stable ℤ_ℓ lattice in a full-group ℓ-adic coefficient and compatible compact ℓ-levels.
Descend its finite lattice quotients on the arithmetic étale tower, take the inverse limit and
invert ℓ to obtain the local system over the canonical coefficient field. Prove independence of
the lattice after inversion and Hecke compatibility. Arithmetic ℚ_ℓ(1) and the geometrically
constant rank-one sheaf have different Galois actions.

**API.**

- `etaleCoefficientLocalSystem_finite_level`: The lattice modulo ℓⁿ is the finite étale sheaf associated to the chosen level quotient action.
- `etaleCoefficientLocalSystem_lattice_independence`: After tensoring with Q_ℓ the result is independent of a stable lattice through the common rational representation.
- `etaleCoefficientLocalSystem_hecke`: Level and Hecke pullbacks preserve the descended sheaf and its canonical arithmetic Galois structure.
- `etaleCoefficientLocalSystem_map`: A continuous full-Gᶜ Q_ℓ-representation intertwiner u:V→W induces the map of the descended arithmetic ℓ-adic local systems; it respects the actual finite-level tower and arithmetic Galois action.
- `etaleCoefficientLocalSystem_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `etaleCoefficientLocalSystem_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `etaleCoefficientLocalSystem_test_unit`: The trivial representation gives the constant Q_ℓ sheaf over E.
- `etaleCoefficientLocalSystem_test_abelian`: The symplectic homology coefficient gives (R¹π_*Q_ℓ)∨ with its arithmetic action.
- `etaleCoefficientLocalSystem_test_arithmetic`: Over Spec Q the étale coefficients Q_ℓ and Q_ℓ(1) have the same one-dimensional geometric/complex realization but different arithmetic Galois actions (trivial versus cyclotomic). Forgetting the arithmetic tower/action cannot characterize the descended coefficient.

**Prerequisites.** B0 `centralSplitQuotient`; B1 `principalHeckePullback`; `ShimuraVarieties:V8`;
`ShimuraVarieties:V1`.

**Sources.** [AG], §3.3 Proposition 3.3.1, pp.418–419; [Milne90], III §6, Remark 6.1, p.62.

### Filtered de Rham full-group coefficients — `filteredDeRhamCoefficient`

Let W be an algebraic full-group Gᶜ-representation over a number field L containing E.
The canonical principal bundle associates to W a locally free de Rham coefficient
with integrable connection and Hodge filtration from γ. Prove Griffiths transversality
and the corresponding analytic horizontal-section description. In Hodge type this
agrees with the matching tensor construction in the universal family's relative
H₁,dR; its regular-singular boundary extension is a B3 target. Parabolic or Levi-only
coefficients use the associated-bundle functor without this flat structure.

**API.**

- `filteredDeRhamCoefficient_connection`: ∇²=0 and the connection descends from Π.
- `filteredDeRhamCoefficient_filtration`: F^aW_dR is the locally direct-summand filtration encoded by γ.
- `filteredDeRhamCoefficient_transversality`: ∇F^a⊂F^{a−1}⊗Ω¹_S; tensors and duals carry the induced filtered connections.
- `filteredDeRhamCoefficient_map`: A full-Gᶜ representation intertwiner induces a horizontal filtration-preserving map between the associated de Rham coefficients; its principal-frame map is u.
- `filteredDeRhamCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `filteredDeRhamCoefficient_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `filteredDeRhamCoefficient_test_unit`: The tensor unit is (O_S,d) with its weight-zero filtration.
- `filteredDeRhamCoefficient_test_hodge`: For H¹dR of an abelian family F¹=e*Ω¹_A/S and the connection is Gauss–Manin.
- `filteredDeRhamCoefficient_test_levi`: For the GL2 upper-triangular Levi, (a,d)↦a does not extend to a one-dimensional GL2 representation, since no a^n d^n equals a. Its associated line cannot be treated as a rank-one input to the full-group filtered connection functor.

**Prerequisites.** B2 `automorphicVectorBundle`; B1 `hodgeCanonicalPrincipalBundle`;
`ShimuraData:D3/homogeneous-variation`; `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [Milne90], III §5, Theorem 5.1, p.61; III §6, pp.61–62; [AG], §3.5, Proposition 3.5.1, p.421.

### Betti, étale and de Rham comparison — `realizationComparison`

For a rational Gᶜ-representation W and an embedding L↪ℂ, identify
W_B⊗ℚ_ℓ≃W_ℓ|S_ℂ under the algebraic/analytic étale comparison, and
W_B⊗O^an≃W_dR^an as flat holomorphic bundles.
When the projected weight is ℚ-defined and W is pure, these identifications respect
the Hodge filtration and rational variation. Preserve the defining tensors, duals,
Tate twists and Hecke pullbacks. The comparison requested here does not add
crystalline or B_dR assertions.

**Prerequisites.** B2 `bettiCoefficientLocalSystem`; B2 `etaleCoefficientLocalSystem`; B2
`filteredDeRhamCoefficient`; `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [AG], Proposition 3.3.1; Proposition 3.5.1, pp.418–422; [Milne90], III §6, pp.61–62.

### Tensor and Hecke coherence of coefficients — `coefficientTensorHecke`

Prove coherent compatibility of the associated-coefficient and full-group realization functors
with tensor products, duals, units, coefficient maps and finite-level/Hecke pullbacks. Include
the associativity, unit and composition diagrams. Exactness here is characteristic-zero
representation exactness; an integral lattice requires its own flatness or projectivity
hypotheses.

**Prerequisites.** B2 `automorphicVectorBundle`; B1 `principalHeckePullback`; B2 `realizationComparison`.

**Sources.** [Milne90], III §3, Lemma 3.1, p.58; III §5, p.61; III §6, p.62.

### The Siegel tautological coefficient sequence — `siegelTautologicalSequence`

On the split opposite flag P_HT\G for GSp_{2g}, construct the sequence
0→L_(0,…,0,−1;1)→O⊗St→L_(1,0,…,0;1)→0. Both outer terms have rank g. Compare it with the actual
Hodge sequence using the opposite/dual conversion and declared Tate character. Its realization
in the solid analytic category is a separately supplied comparison.

**Prerequisites.** B0 `compactDualCoefficient`; B0 `hodgeParabolicConvention`; B2 `leviHighestWeightConvention`;
`PELModuli:M0`.

**Sources.** [BCGP], Remark 3.2.19, p.45; Remark 4.8.1, p.101.


## B2.general. Associated coefficients for general data

Use the general canonical principal bundle of B1.general with the same associated-bundle
interface as B2. Its extra work is descent and conjugation compatibility of the actual
realizations, rather than a new representation category or a private bundle carrier.

### General automorphic coefficient models — `generalAssociatedModel`

Apply the same associated-coefficient functor to B1.general's canonical principal bundle and
compact-dual map. Obtain general-data V(J) over the actual field of definition, with tensor,
dual, pullback, analytic and normalized conjugation compatibilities. This uses the common
algebraic contracted-product interface, without a second coefficient construction.

**Prerequisites.** B1.general `generalPrincipalModel`; B1.general `generalCompactDualMap`; B2
`automorphicVectorBundle`; B0 `coefficientGaloisDescent`; B1.general `generalConjugationCocycle`.

**Sources.** [Milne90], III Theorem 5.1, p.61.

### General full-group realizations — `generalFlatRealizations`

For rational full-group coefficients on a general pure datum, construct Betti, arithmetic ℓ-adic
and filtered de Rham realizations using the general canonical torsor and tower. Give their
comparisons and tensor/Hecke maps. No universal abelian family or family of motives is assumed
for the general datum.

**Prerequisites.** B2.general `generalAssociatedModel`; B1.general `generalPrincipalModel`; B2
`etaleCoefficientLocalSystem`; B2 `realizationComparison`; `ShimuraVarieties:V8.general`.

**Sources.** [Milne90], III §6, pp.61–62; [LanIntro], §5.3, pp.63–64.

### Conjugation of rational realizations — `generalRealizationConjugation`

Transport the general associated bundles and full-group realizations through normalized
conjugation. Check their comparison cocycles, coefficient-field changes and filtration maps. The
rational Betti comparison requires the weight to be ℚ-defined; its absence cannot be repaired by
simply forgetting the field of definition.

**Prerequisites.** B2.general `generalFlatRealizations`; B1.general `generalConjugationCocycle`; B1
`cmPrincipalNormalization`.

**Sources.** [Milne90], III Theorem 6.2, p.62.


## B3. Canonical and subcanonical boundary extensions

Construct coefficients on the supplied degeneration charts and glue with their normalized
boundary frames. Canonical and reduced-boundary extensions have different refinement maps;
section comparisons use the specified direct-image theorems. Logarithmic connections belong to
the full-group coefficients. The minimal pushforward is a coherent sheaf with separate
positivity requirements for scalar line descent.

### Coefficients on degeneration charts — `boundaryCoefficientChart`

On the supplied neat characteristic-zero Hodge/PEL toroidal chart, describe the coefficient
using the actual semi-abelian degeneration or one-motive and its graded frames. Extend to the
specified good integral PEL base only with C5's finite locally free representations. Identify
the relative invariant differentials and coefficient transports on overlaps; the torus
differential is du/u, not the base differential dq/q.

**API.**

- `boundaryCoefficientChart_restrict`: Restriction to the open family is the given filtered/graded automorphic coefficient.
- `boundaryCoefficientChart_hodge`: The Hodge coefficient is e*Ω¹_G/SΣ of the supplied semi-abelian extension.
- `boundaryCoefficientChart_transition`: Degeneration-chart transition maps induce tensor-compatible frame/coefficient isomorphisms.
- `boundaryCoefficientChart_map`: A morphism of the prescribed boundary representations induces a chart-coefficient morphism compatible with the canonical frame and with every chart transition.
- `boundaryCoefficientChart_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `boundaryCoefficientChart_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `boundaryCoefficientChart_test_tate`: The dimension-one Hodge frame at a multiplicative fibre is generated by du/u.
- `boundaryCoefficientChart_test_unit`: The trivial coefficient extends to O of each cusp chart.
- `boundaryCoefficientChart_test_base`: The base logarithmic differential dq/q is not identified with the relative invariant differential du/u.

**Prerequisites.** B2 `automorphicVectorBundle`; `ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`.

**Sources.** [HLTT], Appendix B.8, pp.270–271; [LanIntro], §4.2.7, pp.49–50.

### The canonical automorphic extension — `canonicalExtension`

Construct the locally free canonical extension V^can_Σ on the specified smooth toroidal model,
characterized by canonical boundary frames and the corresponding growth normalization. Give its
normalized coefficient-map and tensor functor. Use the Hodge/abelian characteristic-zero
construction, and the specific C5 good-integral coefficients where stated. Equality on the open
variety cannot characterize an extension, since boundary twists have the same restriction.

**API.**

- `canonicalExtension_restrict`: j*V(J)^can_Σ≃V(J) with the given canonical open comparison.
- `canonicalExtension_boundary_frame`: On a canonical cusp chart V(J)^can is the locally free coefficient of the specified extended frame torsor.
- `canonicalExtension_tensor`: The canonical extension functor preserves tensor products, duals and the unit.
- `canonicalExtension_unique`: A chart-normalized extension with these transition maps has a unique isomorphism preserving its normalization.
- `canonicalExtension_map`: For a coefficient map induced by an algebraic Pᶜ-representation intertwiner, the prescribed canonical chart maps glue to its canonical extension; it restricts to the original coefficient map and respects canonical chart normalization. An arbitrary morphism on the open without this chart condition is not an admitted input.
- `canonicalExtension_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `canonicalExtension_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `canonicalExtension_test_unit`: The canonical extension of the unit coefficient is O_SΣ.
- `canonicalExtension_test_hodge`: For an elliptic/PEL Hodge coefficient it is the semi-abelian invariant-differential bundle.
- `canonicalExtension_test_twist`: For nonempty boundary D, V^can(D) has the same open restriction but fails the specified canonical boundary-frame normalization.

**Prerequisites.** B3 `boundaryCoefficientChart`; B2 `automorphicVectorBundle`; `ShimuraCompactifications:C2`; B3
`canonicalExtensionGluing`.

**Sources.** [Milne90], V §6, pp.90–91; [HLTT], Appendix B.8, p.271.

### Gluing the canonical extension — `canonicalExtensionGluing`

Glue the chartwise canonical coefficient by the actual boundary-frame transition isomorphisms.
Prove the overlap cocycle, compatibility with the open bundle and uniqueness among extensions
with these normalized charts. Normality of the compactification alone does not establish the
gluing or uniqueness.

**Prerequisites.** B3 `boundaryCoefficientChart`; `ShimuraCompactifications:C2`; `ShimuraCompactifications:C4`;
`AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

**Sources.** [Milne90], V §6 Theorem 6.1, p.90.

### The subcanonical automorphic extension — `subcanonicalExtension`

For the reduced normal-crossings Cartier boundary i:D↪S_Σ set V^sub_Σ=V^can_Σ⊗I_D=V^can_Σ(−D).
Construct 0→V^sub_Σ→V^can_Σ→i_*i*V^can_Σ→0 with the applicable field or relative tensor
hypotheses. At a crossing q₁q₂=0 the cusp ideal is (q₁q₂); vanishing only in (q₁,q₂), or
twisting by 2D, gives a different condition.

**API.**

- `subcanonicalExtension_ideal`: V^sub≃V^can⊗I_D with D reduced.
- `subcanonicalExtension_inclusion`: V^sub→V^can is the kernel of restriction to D.
- `subcanonicalExtension_restrict`: j*V^sub≃V, while boundary restriction of its included sections is zero.
- `subcanonicalExtension_map`: A coefficient morphism u^can induces u^sub=u^can⊗id_(I_D); the boundary inclusions commute with u^sub and u^can.
- `subcanonicalExtension_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `subcanonicalExtension_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `subcanonicalExtension_test_empty`: For an empty boundary, V^sub=V^can.
- `subcanonicalExtension_test_crossing`: On Spec k[q1,q2] with reduced D=V(q1q2), the unit subcanonical ideal is (q1q2), so sections vanish on both components.
- `subcanonicalExtension_test_multiplicity`: For a full divisor 2D, V^can(−2D) is not the reduced-boundary subcanonical extension.

**Prerequisites.** B3 `canonicalExtension`; `ShimuraCompactifications:C2`.

**Sources.** [LanIntro], §4.2.7, p.50; [HLTT], Appendix B.8, p.271.

### Canonical coefficients under fan refinement — `refinementCanonicalExtension`

For a smooth fan refinement f:S_Σ′→S_Σ identify f*V^can_Σ with V^can_Σ′ and construct the
natural boundary-ideal map f*V^sub_Σ→V^sub_Σ′. In general f*D≥D′, so the latter map need not be
an isomorphism. Use C3's f_*O=O and f_*I_D′=I_D to identify pushforwards and section spaces,
with coherent composition laws.

**Prerequisites.** B3 `canonicalExtension`; B3 `subcanonicalExtension`; `ShimuraCompactifications:C3`.

**Sources.** [HarrisLoc], §1.4, Theorem 1.4.2 and (1.4.3), p.10.

### Fan independence of canonical and cusp sections — `fanIndependentSections`

Use a common smooth projective refinement to identify H⁰ of canonical extensions, and separately
of subcanonical extensions, for different fans in characteristic zero. Prove independence of the
common refinement and the three-fan cocycle. The required assertions concern section spaces and
the specified ideal pushforward, without a blanket theorem about higher direct images.

**Prerequisites.** B3 `refinementCanonicalExtension`; `ShimuraCompactifications:C3`.

**Sources.** [LanIntro], §4.2.7, p.49; [HarrisLoc], §1.4, (1.4.3), pp.10–11.

### The logarithmic full-group extension — `logarithmicConnectionExtension`

For a full-group coefficient with regular singular connection and unipotent local monodromy,
extend the connection logarithmically with nilpotent residues and the zero-exponent
normalization. Identify its underlying bundle with the canonical extension and retain
logarithmic Griffiths transversality. Nonunipotent monodromy requires a specified residue
interval and is outside this nilpotent-residue identification.

**API.**

- `logarithmicConnectionExtension_restrict`: Restriction gives the original integrable flat connection.
- `logarithmicConnectionExtension_residue`: Each boundary residue is nilpotent in the unipotent zero-exponent normalization.
- `logarithmicConnectionExtension_tensor`: In that normalization the logarithmic extension preserves tensor products and duals, with induced residue actions.
- `logarithmicConnectionExtension_map`: A horizontal map between the admitted regular-singular full-group coefficients extends to a horizontal map between their normalized logarithmic extensions and commutes with the residues.
- `logarithmicConnectionExtension_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `logarithmicConnectionExtension_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `logarithmicConnectionExtension_test_unit`: The unit coefficient extends to (O_SΣ,d) with zero residues.
- `logarithmicConnectionExtension_test_tate`: For a nodal elliptic degeneration the rank-two coefficient has nonzero nilpotent monodromy residue, while its determinant has zero residue.
- `logarithmicConnectionExtension_test_nonunipotent`: A rank-one local system with monodromy −1 cannot be put in a nilpotent-residue normalization without a cover or a different exponent choice.

**Prerequisites.** B2 `filteredDeRhamCoefficient`; B3 `canonicalExtension`; B3 `boundaryCoefficientChart`.

**Sources.** [LanIntro], §4.2.7, p.50; [Milne90], V §6, proof of Theorem 6.1, p.91.

### Coherent coefficients on the minimal model — `minimalCoherentPushforward`

For the proper toroidal-to-minimal morphism between the specified Noetherian characteristic-zero
models, form π_*V^can. Prove coherence, equality of global section spaces and fan independence
using refinements. Do not assume it is a vector bundle at the minimal boundary; coherent ideals
such as (x,y) on a nodal chart distinguish coherence from local freeness.

**API.**

- `minimalCoherentPushforward_sections`: H⁰(Smin,π_*V^can)=H⁰(SΣ,V^can).
- `minimalCoherentPushforward_coherent`: Proper pushforward of the coherent canonical coefficient is coherent.
- `minimalCoherentPushforward_refinement`: Compatible fan refinements induce a canonical isomorphism of these degree-zero pushforwards.
- `minimalCoherentPushforward_map`: For a morphism u:F→G of the admitted canonical or subcanonical coefficients, π_*u is its coherent sheaf pushforward on the specified minimal model.
- `minimalCoherentPushforward_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `minimalCoherentPushforward_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `minimalCoherentPushforward_test_proper_open`: When the Shimura variety is proper and π is identity, the minimal coefficient is V.
- `minimalCoherentPushforward_test_rank`: On the open S the pushforward restricts to V.
- `minimalCoherentPushforward_test_singular`: On the noetherian nodal affine scheme Spec L[x,y]/(xy), the ideal (x,y) is coherent but is not locally free at the origin: its generic rank is one and its fibre modulo (x,y) has dimension two. This non-example tests the inference from coherent pushforward to local freeness; it does not identify that ideal with every automorphic coefficient.

**Prerequisites.** B3 `canonicalExtension`; B3 `refinementCanonicalExtension`; `ShimuraCompactifications:C2`;
`mathlib:AlgebraicGeometry.Scheme.Modules`; `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`;
`mathlib:SheafOfModules.sections`; `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`;
`mathlib:AlgebraicGeometry.Scheme.Modules.pushforward_obj_obj`; `ShimuraVarieties:V2`;
`ShimuraVarieties:V8`.

**Sources.** [LanIntro], §4.2.7, pp.49–50.

### Minimal Hodge-line descent with positivity — `minimalHodgeLineComparison`

Under the supplied positivity, finite-generation and compactification hypotheses, descend a
sufficiently divisible positive power of the determinant Hodge line to an ample line on the
minimal model. Identify its toroidal pullback and the corresponding sections. This does not
descend an arbitrary automorphic vector bundle or remove the required divisibility.

**Prerequisites.** B3 `minimalCoherentPushforward`; `ShimuraCompactifications:C5`; `ShimuraCompactifications:C6`;
`HilbertModularVarietiesAndShimuraCurves:H2`.

**Sources.** [LanIntro], §4.2.7, p.49; [HLTT], §3.4.1, pp.109–110.

### Rationality of the canonical extension — `canonicalRationalDescent`

Descend the chart-normalized canonical and reduced-boundary subcanonical extensions to their
actual coefficient field L, and prove compatibility with field extension. Transport the boundary
ideal and normalized comparison maps in the descent datum. No all-prime integral extension
follows from this rationality statement.

**Prerequisites.** B3 `canonicalExtension`; B3 `canonicalExtensionGluing`; B3 `subcanonicalExtension`; B0
`coefficientGaloisDescent`; `ShimuraCompactifications:C2`; B2 `automorphicVectorBundle`.

**Sources.** [Milne90], V §6 Theorem 6.2, p.91.


## B3.general. General-data boundary extensions

Use the general characteristic-zero boundary charts and transported fans. The canonical
normalization, logarithmic comparison and ideal-pushforward rules have the same meaning as in
B3. All general-data formal boundary and connection interfaces remain attached as prerequisites.

### General canonical automorphic extensions — `generalCanonicalExtension`

Extend the general-data coefficient to the supplied characteristic-zero general toroidal model,
using the general boundary chart and canonical normalization. Give gluing, rationality,
canonical and subcanonical coefficients and their functorial maps. The construction uses
C2.general's boundary data without asserting a universal abelian degeneration for general
Shimura data.

**Prerequisites.** B2.general `generalAssociatedModel`; B3 `canonicalExtension`; B3 `subcanonicalExtension`; B3
`canonicalRationalDescent`; `ShimuraCompactifications:C2.general`.

**Sources.** [Milne90], V §6 Theorems 6.1–6.2, pp.90–91; [LanIntro], §4.2.7, pp.49–50.

### General logarithmic realization comparison — `generalLogarithmicComparison`

For a general full-group coefficient satisfying regular singularity and unipotence, compare the
canonical extension with the zero-exponent logarithmic connection extension. Preserve
filtration, residues and the normalized general conjugation map. The generic regular-singular
connection interface is a required supplier input.

**Prerequisites.** B2.general `generalFlatRealizations`; B3.general `generalCanonicalExtension`; B3
`logarithmicConnectionExtension`; B1.general `generalConjugationCocycle`;
`ShimuraCompactifications:C2.general`.

**Sources.** [Milne90], V §6, Theorem 6.1(c) and proof, p.91; [LanIntro], §4.2.7, p.50.

### General boundary and conjugation compatibility — `generalBoundaryFunctoriality`

Prove that general canonical and subcanonical section spaces and coefficient maps respect
compatible fan refinements, compactified Hecke maps and normalized conjugation. Use common
refinements and the reduced-boundary ideal pushforward for subcanonical sections. Retain the
distinction between their pushforward/section comparison and arbitrary subcanonical pullback
isomorphisms.

**Prerequisites.** B3.general `generalCanonicalExtension`; B3 `refinementCanonicalExtension`; B3
`fanIndependentSections`; B1.general `generalConjugationCocycle`;
`ShimuraCompactifications:C3.general`.

**Sources.** [HarrisLoc], Theorem 1.4.2 and (1.4.3), pp.10–11; [Milne90], V §6, p.91.


## B4. Classical forms and explicit weights

Take global sections on the proper toroidal model, and compare them with holomorphic
transformation laws through the actual canonical boundary frame and projective GAGA. The
functional automorphy-factor adapter reuses SlashAction. Modular, Hilbert, Siegel and GU(1,1)
examples then determine the differential, determinant and similitude conventions. Field base
change and the finite-dimensional classical VB normalization complete this layer.

### Classical automorphic forms — `classicalForms`

For an automorphic coefficient on a smooth projective toroidal model S_Σ/L, define
M(J,K;L)=H⁰(S_Σ,V(J)^can). The definition applies to the Hodge/abelian and general coefficients
through their corresponding B2–B3 layers. Use fan-independent sections for the level space,
proper coherent finiteness for finite dimension, and tensoring of sections for multiplication.
H⁰ on the nonproper open Shimura variety is not a substitute.

**API.**

- `classicalForms_section`: A classical form is a global section of the canonical coefficient.
- `classicalForms_fan`: Common refinements induce a canonical identification of M for different smooth projective fans.
- `classicalForms_multiply`: Tensoring sections gives M(J1)×M(J2)→M(J1⊗J2).
- `classicalForms_map`: A map u:V^can→W^can on the supplied model induces H⁰(u):M(V)→M(W). In the supplied Scheme.Modules section map this is exactly SheafOfModules.sectionsMap u.
- `classicalForms_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `classicalForms_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `classicalForms_test_unit`: For a proper geometrically connected model and trivial coefficient, M=L.
- `classicalForms_test_curve`: For the modular Hodge coefficient ω^k the space agrees with the geometric modular-form owner’s proper-curve sections.
- `classicalForms_test_open`: For Spec L[t] with coefficient O, H⁰=L[t] has the infinite independent family 1,t,t²,…; it cannot replace the proper geometrically connected model, whose unit coefficient has H⁰=L.
- `classicalForms_test_map_id`: For any supplied Scheme.Modules coefficient V and section s, the supplied-section forgetting sends the identity coefficient map to s.
- `classicalForms_test_map_comp`: For supplied Scheme.Modules maps u:V→W and v:W→U, mapping a section by v∘u equals mapping first by u then by v.
- `classicalForms_test_map_zero`: For any supplied Scheme.Modules map u:V→W, its global-section map sends the compatible section whose value on every open is zero to the zero compatible section.

**Prerequisites.** B3 `canonicalExtension`; B3 `fanIndependentSections`; B3.general `generalCanonicalExtension`;
B3.general `generalBoundaryFunctoriality`; `mathlib:AlgebraicGeometry.Scheme.Modules`;
`mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`; `mathlib:SheafOfModules.sections`.

**Sources.** [Milne90], III §2, p.55 (including the holomorphy-at-infinity caveat); III §7, Definition 7.1, p.62; [LanIntro], §4.2.7, p.50.

### Cuspidal automorphic forms — `cuspForms`

Define S(J,K;L)=H⁰(S_Σ,V(J)^sub). The boundary sequence identifies its image in M with the
kernel of restriction to the reduced boundary. This means vanishing in every boundary
component's ideal in the canonical frame. Use the subcanonical ideal-pushforward comparison for
fan independence. Left exactness suffices for the kernel statement; neither H¹-vanishing nor
Koecher's extension theorem makes boundary vanishing automatic.

**API.**

- `cuspForms_include`: S(J)↪M(J) is induced by the boundary-ideal inclusion.
- `cuspForms_kernel`: A form is cuspidal iff its restriction to every reduced boundary component is zero.
- `cuspForms_tensor`: The product of a cusp form with a classical form is cuspidal in the tensor coefficient.
- `cuspForms_map`: A map between canonical coefficients induces the boundary-compatible map on their I_D twists and hence S(u):S(V)→S(W); the inclusions into classical forms commute with this map.
- `cuspForms_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `cuspForms_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Tests.**

- `cuspForms_test_empty`: If D=∅, S(J)=M(J).
- `cuspForms_test_constant`: For nonempty boundary and trivial coefficient on a proper geometrically connected model, a nonzero constant is not cuspidal.
- `cuspForms_test_crossing`: At a two-component crossing a holomorphic coefficient is cuspidal iff it lies in the product ideal (q1q2), not merely (q1,q2).

**Prerequisites.** B3 `subcanonicalExtension`; B4 `classicalForms`; B3 `fanIndependentSections`;
`mathlib:AlgebraicGeometry.Scheme.Modules`; `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`;
`mathlib:SheafOfModules.sections`.

**Sources.** [LanIntro], §4.2.7, p.50; [BCGP], §4.8.2, Theorem 4.8.2, p.101.

### The normalized automorphy factor — `AutomorphyFactor`

For a left group action on a complex domain X and a finite-dimensional complex coefficient V,
define a holomorphic linear factor J:Γ×X→GL_ℂ(V) by holomorphy in x, J(1,x)=1 and
J(gh,x)=J(g,hx)J(h,x). Its sections satisfy f(gx)=J(g,x)f(x). Canonical extension and cusp
growth are additional conditions in the specified boundary frame: holomorphic extension and
membership in the reduced boundary ideal, respectively. Frame change u gives
J′(g,x)=u(gx)J(g,x)u(x)⁻¹. The functional Lean form keeps the concrete linear equations and
omits the unavailable holomorphic carrier.

**API.**

- `AutomorphyFactor_one`: J(1,x)=id.
- `AutomorphyFactor_mul`: J(gh,x)=J(g,hx)∘J(h,x), with the indicated shifted base point.
- `AutomorphyFactor_change_frame`: A holomorphic frame change u gives J′(g,x)=u(gx)J(g,x)u(x)⁻¹ and an isomorphic coefficient.
- `AutomorphyFactor_forget`: Forgetting holomorphy yields the normalized linear cocycle input for the existing SlashAction adapter.
- `AutomorphyFactor_ext`: Two normalized functional factors with identical coefficient maps at every (k,g,x) are equal; the law proofs carry no extra data. The holomorphic refinement additionally retains its declared analytic hypotheses.
- `AutomorphyFactor_change_frame_id`: Gauge change by the constant identity frame returns the original normalized functional factor.
- `AutomorphyFactor_change_frame_comp`: Changing first by u and then by v equals changing by x↦v(x)∘u(x). This is the displayed order of frame composition, not its reverse.

**Tests.**

- `AutomorphyFactor_test_unit`: The constant identity coefficient is normalized and satisfies the shifted cocycle.
- `AutomorphyFactor_test_frame`: For any invertible frame function u, J(g,x)=u(gx)u(x)⁻¹ satisfies the shifted cocycle.
- `AutomorphyFactor_test_order`: For Q² let Sx(a,b)=(a+b,b), Sy(a,b)=(a,a+b). The constant functional factor J(g,x)=g for the evaluation action of GL(Q²) has J(SxSy,x)(1,0)=(2,1) and J(SySx,x)(1,0)=(1,1). Reversing coefficient composition fails this test.
- `AutomorphyFactor_test_shift`: On C₂ acting on itself by left multiplication, choose frames u(1)=id and u(t)=Sx on Q². Gauge-changing the identity factor gives J(t²,1)(0,1)=(0,1), whereas the unshifted square J(t,1)²(0,1)=(2,1). Thus the base-point shift is necessary.

**Prerequisites.** B0 `analyticCoefficient`; B0 `sectionsEquivariant`; B3 `canonicalExtension`; B3
`subcanonicalExtension`; `mathlib:LinearEquiv.trans`.

**Sources.** [LanIntro], §4.2.7, pp.49–50.

### The convention adapter to SlashAction — `slashActionOfAutomorphyFactor`

Let β index weights, G be a monoid acting on X on the left, R a semiring and V an R-module. A
family J(k,g,x):V≃_R V with the normalized shifted cocycle defines the existing SlashAction β G
(X→V) by (f|_k g)(x)=J(k,g,x)⁻¹(f(gx)). Prove its additive and R-linear laws, its dependence
only on the coefficient maps and its equality with precomposition when J=1. Its right-action
multiplication is f|_k(gh)=(f|_k g)|_k h.

**API.**

- `slashActionOfAutomorphyFactor_map_apply`: The map evaluates to J(k,g,x)⁻¹(f(gx)).
- `slashActionOfAutomorphyFactor_invariant_iff`: ∀g,f|_k g=f iff ∀g,x,f(gx)=J(k,g,x)f(x).
- `slashActionOfAutomorphyFactor_map_smul`: Slash is R-linear on functions.
- `slashActionOfAutomorphyFactor_congr`: Pointwise equal coefficient families give equal SlashAction values, independent of proof terms.
- `slashActionOfAutomorphyFactor_map_of_trivial`: If J is identity, map is precomposition by the left base action.

**Tests.**

- `slashActionOfAutomorphyFactor_test_trivial`: For identity J, f|g is x↦f(gx).
- `slashActionOfAutomorphyFactor_test_zero`: The zero function is fixed for every normalized coefficient.
- `slashActionOfAutomorphyFactor_test_frame`: The point-dependent frame cocycle u(gx)u(x)⁻¹ yields exactly u(x)u(gx)⁻¹f(gx).
- `slashActionOfAutomorphyFactor_test_noncommuting`: For the two rational shears, applying the inverse composite in the wrong order changes the value on (1,0).
- `slashActionOfAutomorphyFactor_test_inverse`: The rational shearX applied to the constant (0,1) has slash value (−1,1), detecting an operator that forgets the inverse.
- `slashActionOfAutomorphyFactor_test_sl2`: For SL2(Z), V=C and J(k,g,z)=denom(g,z)^k as a scalar linear automorphism, the adapter equals Mathlib’s scalar slash action.
- `slashActionOfAutomorphyFactor_test_zero_noncocycle`: The normalized nonzero factor on C2 with nonidentity value 2 transforms the zero section but fails J(gh)=J(g)J(h); this is not accepted as an adapter input.
- `slashActionOfAutomorphyFactor_test_semilinear`: The determinant-negative GL2(R) slash law has conjugated scalar multiplication and cannot be represented by this C-linear adapter.

**Prerequisites.** `mathlib:SlashAction`; `mathlib:LinearEquiv.trans`; `mathlib:LinearEquiv.trans_symm`;
`mathlib:LinearEquiv.symm_apply_eq`; `mathlib:LinearEquiv.automorphismGroup`;
`mathlib:LinearEquiv.applyDistribMulAction`.

**Sources.** [LanIntro], §4.2.7, p.49.

### Evaluation of the slash adapter — `slashActionOfAutomorphyFactor_map_apply`

For exactly the family and hypotheses used in slashActionOfAutomorphyFactor, evaluate the map as
J(k,g,x)⁻¹(f(gx)). This is the defining-map formula, without an additional invertibility or
nonzero-section assumption.

**Prerequisites.** B4 `slashActionOfAutomorphyFactor`.

**Sources.** [LanIntro], §4.2.7, p.49.

### Invariance and the transformation law — `slashActionOfAutomorphyFactor_invariant_iff`

For the same normalized linear family, prove that f|_k g=f for every g is equivalent to
f(gx)=J(k,g,x)f(x) for every g,x. Apply the linear equivalence at each point; no cancellation of
a selected nonzero section is involved.

**Prerequisites.** B4 `slashActionOfAutomorphyFactor_map_apply`; `mathlib:LinearEquiv.symm_apply_eq`.

**Sources.** [LanIntro], §4.2.7, p.49.

### The inverse-base right cocycle — `inverse_base_action_cocycle`

If G and H are groups and J:G×X→H obeys the left shifted cocycle, the right base action x·g=g⁻¹x
has factor J_right(x,g)=J(g⁻¹,x). Its law is J((gh)⁻¹,x)=J(h⁻¹,g⁻¹x)J(g⁻¹,x). This changes the
action on the base; the right slash action on functions is the separate construction above.

**Prerequisites.** B4 `AutomorphyFactor`.

**Sources.** [LanIntro], §4.2.7, p.49.

### When a section detects a scalar cocycle — `cocycle_at_of_automorphy_of_ne_zero`

For a monoid action, a field K and scalar functions J:G×X→K and f:X→K satisfying
f(gx)=J(g,x)f(x), prove the shifted cocycle at any x where f(x)≠0. Compare f((gh)x) with its
iterated transformation and cancel f(x). There is no such deduction at a zero of f; the
identically zero section imposes no cocycle condition.

**Prerequisites.** The group-action and field hypotheses stated above.

**Sources.** [LanIntro], §4.2.7, p.49.

### Geometric and analytic classical forms — `analyticClassicalComparison`

Under L↪ℂ, compare M with holomorphic equivariant sections of the analytic coefficient whose
components extend holomorphically in canonical cusp frames. Compare S with those components in
the reduced boundary ideal. Use the local removable-singularity result for logarithmic growth
and coordinatewise divisibility, then projective coherent GAGA on S_Σ. Scalar boundedness on the
Baily–Borel model requires the separately descended scalar line. A degree-zero kernel comparison
in the course notes does not prove a full Dolbeault resolution.

**Prerequisites.** B4 `classicalForms`; B4 `cuspForms`; B2 `automorphicAnalyticComparison`; B0
`sectionsEquivariant`; B3 `canonicalExtension`; B3 `subcanonicalExtension`; B3
`minimalHodgeLineComparison`; `ComplexComparisonPartII:C2`.

**Sources.** [LanIntro], §4.2.7, pp.49–50; [HarrisLog], p.3, degree-zero kernels only.

### The GL₂ Hodge-line specialization — `gl2HodgeLineComparison`

At a fine modular level on the actual modular-curve model, identify ω=e*Ω¹_{E/S}, its
generalized-elliptic canonical extension and weight-k coefficient ω^k for every integer k;
negative powers mean duals. Import R15.1's proper-curve geometric forms and their all-cusp
analytic comparison to Mathlib ModularForm/CuspForm. Match the uniformization, Hodge dual
convention, holomorphy and every cusp condition. Use SL₂ for the ℂ-linear factor adapter and the
separate semilinear law for determinant-negative GL₂.

**Prerequisites.** B2 `automorphicAnalyticComparison`; B4 `analyticClassicalComparison`;
`AlgebraicModularFormsAndSerreWeights:R15.1`; `mathlib:ModularForm`; `mathlib:CuspForm`;
`mathlib:ModularForm.SL_slash_apply`; `mathlib:ModularForm.slash_action_eq'_iff`;
`mathlib:ModularForm.smul_slash`; `mathlib:UpperHalfPlane.denom_ne_zero`;
`mathlib:UpperHalfPlane.denom_cocycle`; `mathlib:UpperHalfPlane.denom_cocycle'`.

**Sources.** [LanIntro], §4.2.7, pp.49–50; [HarrisBundles], pp.1–2.

### Arithmetic Hilbert weights — `HilbertArithmeticWeight`

For the finite set I of real embeddings of F, define HilbertArithmeticWeight by integers k_τ and
a common integer w with k_τ≡w mod 2. Put m_τ=(w−k_τ)/2 and prove 2m_τ=w−k_τ. Define addition and
extensionality by the actual integer data. This is a weight label; field and central descent are
separate theorems. Allow negative k_τ and negative determinant exponents.

**API.**

- `HilbertArithmeticWeight_k`: The embedding-indexed integer k_τ.
- `HilbertArithmeticWeight_w`: The common integer central weight w.
- `HilbertArithmeticWeight_detExponent`: m_τ=(w−k_τ)/2.
- `HilbertArithmeticWeight_two_mul_detExponent`: 2m_τ=w−k_τ for every τ.
- `HilbertArithmeticWeight_add`: Pointwise k addition and w addition preserve arithmetic parity.
- `HilbertArithmeticWeight_ext`: Arithmetic weights with the same embedding-indexed k and the same w are equal; parity proofs carry no extra data.

**Tests.**

- `HilbertArithmeticWeight_test_zero`: k=0,w=0 is an arithmetic weight and every m_τ=0.
- `HilbertArithmeticWeight_test_negative`: For one embedding, k=4,w=2 gives m=−1, so forbidding negative determinant twists would lose an allowed weight.
- `HilbertArithmeticWeight_test_parity`: k=3,w=2 violates parity and is not an arithmetic weight.

**Prerequisites.** Integer arithmetic and the stated parity condition.

**Sources.** [Milne90], III §8, pp.63–64; [LanIntro], §4.2.7, pp.49–50; [Diamond21], §3.2, tensor coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12.

### The split Hilbert coefficient — `hilbertCoefficient`

Over a characteristic-zero splitting field L for F and the actual Hilbert–Blumenthal family,
take H¹_dR=⊕_τH_τ and ω=⊕_τω_τ, with ranks two and one. Set δ_τ=det H_τ and
ω^{(k,w)}=⊗_τ(ω_τ^{k_τ}⊗δ_τ^{(w−k_τ)/2}). In cohomological frames t_τ acts on ω_τ by t_τ and on
δ_τ by t_τ², giving the central character Norm(t)^w. Homology frames invert it. Tensor products
correspond to addition of arithmetic weights.

**API.**

- `hilbertCoefficient_formula`: The line equals the displayed tensor of ω_τ powers and determinant powers.
- `hilbertCoefficient_central`: Its cohomological-frame central action is Norm(t)^w.
- `hilbertCoefficient_add`: Coefficient tensor products correspond to addition of arithmetic weights.

**Tests.**

- `hilbertCoefficient_test_rational`: For F=Q, (k,w=k) has m=0 and gives ω^k.
- `hilbertCoefficient_test_determinant`: For every embedding k_τ=0,w=2, the coefficient is ⊗_τdet H_τ.
- `hilbertCoefficient_test_negative`: At k_τ=4,w=2 the determinant factor is δ_τ⁻¹; replacing m by its absolute value changes the central character.

**Prerequisites.** B4 `HilbertArithmeticWeight`; B2 `automorphicVectorBundle`; B0 `hodgeParabolicConvention`;
`HilbertModularVarietiesAndShimuraCurves:H1`; `HilbertModularVarietiesAndShimuraCurves:H2`.

**Sources.** [Milne90], III §8, pp.63–64; [LanIntro], §4.2.7, pp.49–50; [Diamond21], §3.2, tensor coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12.

### The Hilbert central-action check — `hilbertCentralDescent`

For the actual Res_{F/ℚ}GL₂ or G* quotient and its ineffective central subgroup C, the split
coefficient descends precisely when Norm(t)^w, or its homology inverse, is trivial on C. Totally
positive norm-one units pass this test, but remaining signs and finite stabilizers need their
own check. Use H0/H3/H4's true polarization and unit quotient for G*, retaining the stack
coefficient if descent fails.

**Prerequisites.** B4 `hilbertCoefficient`; B0 `ineffectiveFibreDescent`;
`HilbertModularVarietiesAndShimuraCurves:H0`; `HilbertModularVarietiesAndShimuraCurves:H3`;
`HilbertModularVarietiesAndShimuraCurves:H4`.

**Sources.** [Milne90], III §8, pp.63–64; [Diamond21], §3.2, tensor coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12.

### Hilbert coefficients without a global splitting — `unsplitHilbertDescent`

Before a splitting extension use the O_F⊗O-linear Hodge and de Rham modules with their
determinant/norm constructions, rather than global embedding idempotents. After splitting,
descend the labelled tensor coefficient using the actual Galois permutation of embeddings and
representation datum, together with the central descent condition. Its field is the
weight/representation field and can exceed the reflex field. Integral versions require the
indicated finite locally free hypotheses.

**Prerequisites.** B4 `hilbertCoefficient`; B0 `coefficientGaloisDescent`; B4 `hilbertCentralDescent`;
`HilbertModularVarietiesAndShimuraCurves:H1`; `HilbertModularVarietiesAndShimuraCurves:H2`.

**Sources.** [Milne90], III §5, Theorem 5.1, p.61; III §8, pp.63–64.

### Siegel Schur and determinant coefficients — `siegelCoefficient`

For a rank-g cohomological Hodge bundle ω and dominant integer λ₁≥⋯≥λ_g, set a_i=λ_i−λ_g and
define S_a(ω)⊗det(ω)^{λ_g} in characteristic zero. Declare the similitude/Tate character
independently. For a good integral base require the actual integral Schur representation.
Compare with BCGP's two tautological Levi coefficients using the opposite/dual switch from B2,
without asserting a split Hodge sequence. Scalar λ=(r,…,r) gives det(ω)^r; λ=(1,0,…,0) gives the
rank-g ω.

**API.**

- `siegelCoefficient_schur`: The coefficient is S_(λ−λ_g)(ω)⊗det(ω)^{λ_g} with its separately declared central twist.
- `siegelCoefficient_scalar`: For λ=(r,…,r) the coefficient is det(ω)^r.
- `siegelCoefficient_standard`: For λ=(1,0,…,0) it is ω.

**Tests.**

- `siegelCoefficient_test_g1`: For g=1 the coefficient is the modular Hodge-line power ω^{λ₁}.
- `siegelCoefficient_test_det`: For λ=(−1,…,−1) it is det(ω)⁻¹, not a polynomial-only Schur coefficient.
- `siegelCoefficient_test_standard`: For g>1, λ=(1,0,…,0) yields rank g, so replacing every Siegel coefficient by a scalar determinant power fails.

**Prerequisites.** B2 `automorphicVectorBundle`; B2 `leviHighestWeightConvention`; `PELModuli:M3`; `PELModuli:M5`;
`AbelianSchemesAndArithmeticModuli:A4`;
`tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-2-the-weyl-construction-via-young-symmetrizers`.

**Sources.** [BCGP], §3.2.19, p.45; §4.8.1–4.8.2, pp.101–102; [HLTT], Appendix B.8, pp.270–271.

### A split unitary coefficient test — `unitaryCoefficient`

For the imaginary-quadratic GU(1,1) PEL datum over L containing the two labelled embeddings τ
and barτ, take H¹_dR=H_τ⊕H_barτ with rank-two summands and rank-one Hodge lines. In
cohomological graded frames the GL₁×GL₁×G_m coefficient (k,l;n) is ω_τ^k⊗ω_barτ^l⊗ν^n, with ν
the specified similitude/Tate line. Negative exponents use duals. Conjugation swaps k and l and
transports the PEL datum; no universal determinant identification of ν is assumed.

**API.**

- `unitaryCoefficient_formula`: The labelled weight coefficient is ω_τ^k⊗ω_barτ^l⊗ν^n.
- `unitaryCoefficient_dual`: The dual weight is (−k,−l;−n), with dualized similitude line.
- `unitaryCoefficient_conjugate`: The embedding permutation transports (k,l;n) to (l,k;n) and the transported PEL coefficient.

**Tests.**

- `unitaryCoefficient_test_unit`: Weight (0,0;0) gives O.
- `unitaryCoefficient_test_line`: Weight (1,0;0) gives ω_τ, while (0,1;0) gives the differently labelled ω_barτ.
- `unitaryCoefficient_test_twist`: Weight (0,0;1) is ν, so erasing the formal similitude/Tate line loses a coefficient even when k=l=0.

**Prerequisites.** B2 `automorphicVectorBundle`; B0 `coefficientGaloisDescent`; B0 `ineffectiveFibreDescent`;
`PELModuli:M0`; `PELModuli:M3`; `PELModuli:M5`.

**Sources.** [HLTT], Appendix B.8, pp.270–271; [CS], §2.3, pp.669–670.

### Rational forms and field base change — `numberFieldFormsBaseChange`

For a proper toroidal model over L and a coherent canonical or subcanonical coefficient F, prove
finite dimension of H⁰ and the field-extension isomorphism H⁰(S_Σ,F)⊗_L L′≃H⁰(S_Σ×_L L′,F_L′).
Under L↪ℂ this identifies the rational classical or cusp space inside its analytic counterpart.
Check products and coefficient maps. An integral special-fibre base-change assertion would
require different hypotheses.

**Prerequisites.** B4 `classicalForms`; B4 `cuspForms`; B3 `canonicalRationalDescent`; B4
`analyticClassicalComparison`.

**Sources.** [Milne90], III §7, Definition 7.1 and Proposition 7.2, p.62; Corollary 7.3, p.63.

### The classical VB coefficient normalization — `classicalVBTateNormalization`

In BCGP's Hodge-type setting, fix neat tame K^p, a p-adic field large enough for the split group
and reflex embeddings, compatible toroidal fans and the separately supplied rational Hodge–Tate
M-torsor/VB functor. For an algebraic Levi coefficient L_κ identify VB⁰_Σ(L_κ)≃ω^{κ,sm}(κ(μ)),
where ω^{κ,sm}=colim_{K_p}ω^κ_{K_p} has the classical rational structure. Transport the
comparison when the group action moves fans, using compatible refinements. The μ-weight twist
belongs to this identification; §4.8's coherent convention is untwisted.

**Prerequisites.** B2 `automorphicVectorBundle`; B1 `filtrationReduction`; B3 `canonicalExtension`; B2
`leviHighestWeightConvention`; B1 `principalHeckePullback`; B3 `fanIndependentSections`.

**Sources.** [BCGP], §4.5, proof end p.78.


## B5. Hecke action and Fourier expansions

This layer has four distinct geometric settings: determinant-weight good-prime PEL coefficients,
finite-projective vector coefficients on the specified PEL charts, prime-to-p ramified Hilbert
coefficients, and the characteristic-zero classical Siegel comparison. State the base and model
in each target. The expansion argument passes through prime quotients, finite prime filtrations,
then arbitrary coefficient modules; the geometric detection assumptions must be established
before that algebraic reduction.

### Integral coefficient interfaces used by B5

The B2–B4 field construction is used on the integral bases only with the
following model-specific interfaces. They retain the same owner and do not
identify arbitrary integral modules with field coefficients.

- **B4 section functor.** On the good-prime PEL model use
  AF(k,M)=Γ(X,ω_tor^k⊗_R M) and Γ(X,Ecan(W)⊗_R M), with their cuspidal
  versions, for each R-module M. Require coefficient-map functoriality and
  qcqs section/filtered-colimit compatibility. Do not substitute Γ(E)⊗M.
- **B3 comparison with coefficients.** Fan refinements and compactified
  Hecke maps must compare the actual section modules with M coefficients,
  including torsion, and transport the reduced-boundary ideal. Finite
  projective summands are handled by a split finite-free presentation
  ([StacksProjective], Lemma 10.78.2) and the toric direct-image theorem.
- **B2/B3 integral representations.** A finite projective Levi coefficient
  over the good base has Ecan(W), Esub(W), the isomorphism θ_g with its
  cocycle, and the boundary bundle E₀(W) on the abelian torsor. Its completed
  pullback comparison is [LanHigher], Proposition 5.6, pp.11–13. A
  filtration on that torsor need not descend through the stabilizer.
- **B2/B4 ramified Hilbert line.** For Noetherian O-algebras and integer
  vectors (k,m), use the ramified splitting-model A_(k,m) under the actual
  trivial-unit-character hypothesis, dual powers, coherent minimal
  pushforward and the coefficient-line boundary comparison. H2/C6 supply
  the model and geometry. This includes weights beyond B4's parallel
  k+2m=w arithmetic case ([Diamond22], §§6.1–6.3, pp.24–26).

### Scalar coefficients and formal restriction

**Fourier-Jacobi coefficient modules on the abelian torsor.**

On Lan's smooth proper good-prime PEL toroidal stack X over the indicated localization R of
reflex integers, or its field version, let k≥0 and let M be any R-module. At a cusp Φ, use its
abelian torsor C_Φ, character line Ψ_Φ(ℓ) and boundary determinant line L_Φ=det_ℤ(X_Φ)⊗ω_A.
Define C_Φ(ℓ;k,M)=Γ(C_Φ,Ψ_Φ(ℓ)⊗L_Φ^k⊗_R M). Coefficient families are products over the specified
character degrees, with full stabilizer transport. An expression through a pushforward on the
lower-dimensional moduli stack requires its own projection/base-change comparison.

**Hypotheses and scope.** The PEL datum, base, cusp label, character lattice, torsor and sheaves are those of the supplied
toroidal chart. Do not assume that the lower-dimensional moduli object is a scheme or that its
finite cover is trivial. No arbitrary-base or arbitrary-Levi-weight extension is included.

**API.**

- `FJCoefficient.map`: An R-linear map M to N induces coefficient maps in every degree, respecting identity and composition.
- `FJCoefficient.transport`: A supplied cusp-label or stabilizer isomorphism transports the lattice degree, invertible sheaf and coefficient section together, with composition law.
- `FJCoefficient.family_ext`: Two coefficient families are equal exactly when their components agree in every degree after the specified transports.

**Tests.**

- `FJCoefficient.zeroCoefficients`: With coefficient module M = 0, every C_Phi(ell;k,M) is zero.
- `FJCoefficient.tateTrivialization`: For C_Phi = Spec R, Psi_Phi(n) and L_Phi trivialized by the Tate-chart data, C_Phi(n;k,M) identifies with M by evaluation in those trivializations.
- `FJCoefficient.notFiniteSupport`: For the rank-one formal chart R[[q]] over nonzero R, the coefficient family of (1-q)^(-1) has coefficient 1 in every nonnegative degree; the expansion target must not impose finite support.

**Prerequisites.** `ShimuraCompactifications:C0`; `ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`;
`mathlib:AlgebraicGeometry.Scheme.Modules`;
`tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct`;
`mathlib:AlgebraicGeometry.tilde.isoTop`; B3 `boundaryCoefficientChart`.

**Sources.** [LanPEL], 7.1.2.1-7.1.2.4, first coefficient expression in (7.1.2.3), pp.534–535.

**Expansion by restriction to a formal cusp chart.**

For a nonempty stratum (Φ,δ,σ), restrict AF(k,M) to its actual formal completion, pull back to
the supplied Mumford chart, identify ω_tor with L_Φ and extract the degree components. This
defines an R-linear map into ∏_{ℓ∈σ∨}C_Φ(ℓ;k,M), equivariant for the actual chart stabilizer.
Its image has the completion/support conditions of the chart; the unrestricted product target
does not assert surjectivity or a product description of the completed algebra.

**Hypotheses and scope.** The standing good-prime PEL, weight and coefficient conditions of fj-coefficient-module. The
formal-chart isomorphism identifies the universal degenerating family and the boundary ideal,
not just the underlying point set.

**API.**

- `FourierJacobi.localExpansion`: Given the actual formal restriction, Mumford chart and Hodge comparison from the suppliers, return the R-linear local expansion with its degree-indexed coefficient target and stabilizer equivariance.
- `FourierJacobi.local_coeff`: Evaluation in degree ell equals the coefficient obtained from the actual completed section on the Mumford chart.
- `FourierJacobi.local_add`: The local expansion sends f+g to the sum of the two coefficient families.
- `FourierJacobi.local_smul`: The local expansion commutes with multiplication by every scalar in R.

**Tests.**

- `FourierJacobi.local_zero`: The expansion of the zero section has every coefficient zero.
- `FourierJacobi.local_tate_monomial`: On the rank-one formal Tate chart, the local section q^n(du/u)^k has coefficient 1 in degree n and 0 in every other degree. This is a local-chart test, not a claim that the monomial extends to a global modular form.
- `FourierJacobi.local_coefficient_map`: Applying M to N to a section and then expanding gives the degreewise coefficient map applied to its expansion.

**Prerequisites.** B5 (Fourier-Jacobi coefficient modules on the abelian torsor); `ShimuraCompactifications:C0`;
`ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`; `AdicSpacesPartII:F0`; B3
`canonicalExtension`; B3 `boundaryCoefficientChart`.

**Sources.** [LanPEL], 7.1.2.1 and 7.1.2.3-7.1.2.4, pp.534–535; [LanErrata], Items 75-76.

**Comparison of cone expansions through a common completion.**

For positive cones with σ₁ a face of the closure of σ₂, σ₂∨⊂σ₁∨. Compare expansions of a global
section by pulling it to the common completion along the union of positive-cone strata, then
mapping continuously to the individual stratum completions. The σ₁ coefficients agree on σ₂∨ and
vanish on σ₁∨∖σ₂∨. Incidence chains and the support theorem put the resulting family in the dual
of the fan support. This is a theorem for sections in the common image, not a map on arbitrary
separate completed rings. The homogeneous degree maps, continuity, Mumford coefficient
comparison and stack descent are required hypotheses.

**Hypotheses and scope.** Both local expansions are the pullbacks of the SAME section on the common boundary completion,
compatibly with the universal Mumford family and the Hodge identification. The construction of
that common section and chart is a C4/early-C5 obligation, not an assumption that the comparison
theorem already holds. C0/F0 supply degreewise coefficient extraction on the relevant
boundary-adic completion and its compatibility with the two continuous maps to stratum
completions. Use the admissible fan's incidence and support theorems; arbitrary cones need not
be comparable. The zero cone need not belong to the positive part.

The common-completion hypothesis is necessary even on an affine toric surface. The origin
completion of k[x,y] is k[[x,y]], while the completion along x=0 on the face chart D(y) is
k[y,y⁻¹][[x]]. A ring map between these completions extending the face immersion would preserve
x and y. It cannot exist: 1−y is a unit in k[[x,y]], but its constant coefficient is not a unit
in k[y,y⁻¹]. Use the common boundary completion and its maps to the individual completions
instead. Degreewise compatibility then compares only the common section; it does not manufacture
a ring map between the two completions.

**Prerequisites.** B5 (Expansion by restriction to a formal cusp chart); `ShimuraCompactifications:C0`;
`ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`; `AdicSpacesPartII:F0`;
`mathlib:PowerSeries.isUnit_iff_constantCoeff`; `AdicSpacesPartII:F0/completion-of-morphism`;
`ShimuraCompactifications:C0/relative-face-open`.

**Sources.** [LanPEL], Argument after 7.1.2.5, printed p. 536; common completion preceding (6.2.5.22), p. 482, and Remark 6.2.5.30, p. 485; [EGAI], Chapter I, 10.9.1–10.9.3, printed pp. 198–199 (physical PDF 197–198).

**The cusp-label Fourier-Jacobi morphism.**

Define FJ_Φ by the compatible local coefficients on P_Φ∨. Its target is the full-cusp-stabilizer
fixed submodule of ∏_{ℓ∈P_Φ∨}C_Φ(ℓ;k,M), including the stabilizer's action on degrees and
invertible coefficient sheaves. Extending it by zero to a cone recovers the local expansion.
Coefficients may have infinite support, and descent to invariants uses no group average.

**Hypotheses and scope.** The preceding local-expansion and cone-comparison hypotheses. The full stabilizer action is
supplied by the cusp data; invariance under one cone stabilizer alone is insufficient.

**API.**

- `FourierJacobi.expansion`: Given compatible local expansions and the support theorem, return the R-linear map to the actual full-stabilizer invariant coefficient family, characterized by its local coefficient evaluations.
- `FourierJacobi.coeff`: The ell-th coefficient is evaluation of the family in C_Phi(ell;k,M).
- `FourierJacobi.constantTerm`: The constant term is evaluation at degree zero, with its coefficient sheaf and stabilizer invariance retained.
- `FourierJacobi.coefficient_naturality`: An R-linear coefficient map M to N commutes with the global expansion and with each coefficient evaluation. Its proof obligation is the separate coefficient-naturality node below.

**Tests.**

- `FourierJacobi.global_zero`: The zero section maps to the zero invariant family.
- `FourierJacobi.global_local`: Extending the global family to sigma-dual by zero gives the local expansion for that cone.
- `FourierJacobi.no_averaging`: For a trivial action of the cyclic group of order p on F_p, the invariant submodule is all of F_p. A construction that multiplies a section by the group sum, or divides by p, does not give this invariant-section identification.

**Prerequisites.** B5 (Comparison of cone expansions through a common completion); B5 (Fourier-Jacobi coefficient
modules on the abelian torsor); `ShimuraCompactifications:C1`; `ShimuraCompactifications:C4`.

**Sources.** [LanPEL], 7.1.2.6-7.1.2.8 and preceding argument, pp.536–537.

**Refinement invariance of the expansion.**

For a compatible smooth fan refinement π:X_Σ′→X_Σ and the coefficient-sensitive section
comparison, prove that pulling a section back preserves every FJ_Φ coefficient. Common
refinements give canonical, cocycle-compatible identifications for different fans. For finite
projective coefficients pass through splittings of finite free modules and the toric
direct-image comparison; flatness alone does not express a module as a union of free submodules.

**Hypotheses and scope.** Only the specified good-prime PEL setting is included. The section-comparison input must apply
to M, including its torsion; degree-zero structure-sheaf pushforward without coefficient
compatibility is not sufficient.

**Prerequisites.** B5 (The cusp-label Fourier-Jacobi morphism); B3 integral coefficient interface;
`ShimuraCompactifications:C3`; B3 `refinementCanonicalExtension`; B3 `fanIndependentSections`.

**Sources.** [LanPEL], 7.1.2.9 and proof, using 7.1.1.4-7.1.1.5, pp.532–533, 537; [StacksProjective], 00NX, equivalence of finite projective and direct summand of finite free.

**Boundary restriction from the constant term.**

At a stratum from a positive cone, reduction of a global expansion modulo its stratum ideal
retains just its degree-zero coefficient. Every nonzero degree in P_Φ∨ lies in that ideal by
positivity. To descend the constant to the lower-dimensional moduli stack use full
Γ_Φ-invariance and the true quotient of its finite cover. Restriction on the cover alone does
not identify a section on the quotient.

**Hypotheses and scope.** The positive-cone and stratum-ideal hypotheses of Lan 7.1.2.11-7.1.2.13. Retain the
determinant-Hodge coefficient and all indicated pullbacks; the claim is not asserted for every
Levi representation.

**Prerequisites.** B5 (The cusp-label Fourier-Jacobi morphism); `ShimuraCompactifications:C0`;
`ShimuraCompactifications:C1`; `ShimuraCompactifications:C4`.

**Sources.** [LanPEL], 7.1.2.10-7.1.2.13 and proofs, pp.537–539; [LanErrata], Item 77.

**Naturality in the coefficient module.**

For a fixed model, weight and finite cusp collection I, set F(M)=AF(k,M) and
G(M)=∏_{i∈I}FJE_Φᵢ(k,M). For every R-linear coefficient map a:M→N, prove
G(a)∘FJ_I,M=FJ_I,N∘F(a). Check formal restriction, Hodge identification and degree projection on
the actual charts, then descend the transports and invariance. This functoriality requires no
exactness assertion for completion on arbitrary modules.

**Hypotheses and scope.** Use the geometric maps constructed in local-fj-expansion and global-fj-expansion, not unrelated
maps chosen to make a square commute. The cusp stabilizers act R-linearly and the coefficient
maps intertwine the actions.

**Prerequisites.** B5 (The cusp-label Fourier-Jacobi morphism); B5 (Expansion by restriction to a formal cusp
chart); B5 (Fourier-Jacobi coefficient modules on the abelian torsor); `AdicSpacesPartII:F0`.

**Sources.** [LanPEL], The geometric composition in 7.1.2.3 and the diagram in 7.1.2.14, pp.535, 539.

**Left exactness of Hodge-section coefficient change.**

For a short exact coefficient sequence 0→N→M→Q→0 on the supplied R-flat model, prove
0→AF(k,N)→AF(k,M)→AF(k,Q) is left exact. Local freeness of the Hodge coefficient and R-flatness
on the atlas give exactness after tensoring; descend the quasi-coherent sequence and take
sections. Surjectivity onto AF(k,Q) is not asserted.

**Hypotheses and scope.** The toroidal model X is flat over R and omega_tor^k is locally free over O_X, as supplied by
early C5 and B3/B4. Sections and tensor products are taken on the actual algebraic stack or an
equivalent descent presentation, not its coarse space.

**Prerequisites.** B4 integral coefficient interface; `ShimuraCompactifications:C5`;
`SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.1`; B3 `canonicalExtension`; B4
`classicalForms`.

**Sources.** [LanPEL], First paragraph of the proof of 7.1.2.14, printed p. 539.

**Left exactness of invariant coefficient families.**

For the same short exact coefficient sequence, prove left exactness of 0→G(N)→G(M)→G(Q),
including the products over character degrees and full stabilizer invariants. On each R-flat
abelian-torsor chart use locally free tensoring and section left exactness. Products have
componentwise unique kernel lifts; equivariance and uniqueness make those lifts invariant.
Neither right exactness of invariants nor their commutation with filtered colimits is used.

**Hypotheses and scope.** Each C_Phi is flat over R and each character-Hodge coefficient sheaf Psi_Phi(ell) tensor L_Phi^k
is invertible on C_Phi. Obtain these geometric facts from C4/early C5. The full stabilizer
actions are R-linear, preserve the transported coefficient sequence, and are the same actions as
in global-fj-expansion. The stabilizer need not be finite or have invertible order.

**Prerequisites.** B5 (Fourier-Jacobi coefficient modules on the abelian torsor); B5 (The cusp-label Fourier-Jacobi
morphism); `ShimuraCompactifications:C1`; `ShimuraCompactifications:C4`;
`ShimuraCompactifications:C5`; `SchemeAndStackFoundations:SF.0`;
`SchemeAndStackFoundations:SF.1`.

**Sources.** [LanPEL], 7.1.2.14, first paragraph and exact-row diagram on printed p. 539.


### The expansion principle with arbitrary coefficients

**The prime-quotient coefficient case.**

For a prime ideal p of the field or Dedekind base R, including p=0, put S=R/p. Assume the chosen
base-changed strata meet every irreducible component of the reduced model X_S and the completed
coefficient charts are compatible with this base change. Then the joint expansion on AF(k,S) is
injective. At neat level use C5/neat-strata-detect-geometric-components with its good-prime
regular base and fan/no-self-intersection assumptions; non-neat coverage requires a separate
branch or level-descent comparison. Zero coefficients give zero completed sections, finite-stalk
Krull separation gives zero near the selected strata, and reducedness plus component detection
gives global zero.

**Hypotheses and scope.** The early-C5 good-prime model is smooth over the regular base R; hence X and each residue-field
model used here are reduced and locally Noetherian, with locally free pulled-back Hodge line. F0
still supplies separated homogeneous coefficient extraction and identification with completion
of the actual Hodge sheaf; SF.1 supplies the passage through a flat atlas. Local adic separation
of a finite stalk at a proper ideal is already a pinned Mathlib theorem, and ordinary
coherent-section detection near a closed subset is already a precise F0 node. Use AF(k,R/p) =
Gamma(X_S,omega_S^k) through the closed-base-change sheaf identification. Do not replace this by
AF(k,R) tensor_R S without a base-change theorem.

The base-change step compares finite thickenings first: (P/I^(n+1)P)⊗_R S≃P_S/I_S^(n+1)P_S.
These identifications commute with n and chart transport, so their inverse systems can be
compared without moving tensor past an arbitrary inverse limit. At a selected stratum point, the
Noetherian finite stalk is separated at its proper stratum ideal by Mathlib's existing
Krull-intersection theorem. The corresponding completion-detection theorem gives an open zero
locus; reducedness and fibrewise component coverage make it dense in each component. Carry this
zero-locus argument through the actual flat atlas, without requiring every affine atlas chart to
meet a selected stratum.

**Prerequisites.** B5 (Expansion by restriction to a formal cusp chart); B5 (The cusp-label Fourier-Jacobi
morphism); `ShimuraCompactifications:C5`; `AdicSpacesPartII:F0`;
`SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.1`;
`mathlib:Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`; `mathlib:IsHausdorff.of_isLocalRing`;
`mathlib:AdicCompletion.of_injective`; `AdicSpacesPartII:F0/completion-detects-near-closed`;
`ShimuraCompactifications:C5/neat-strata-detect-geometric-components`.

**Sources.** [LanPEL], 7.1.2.14(1), p. 539; 6.4.1.1(2)-(5), p. 520; 6.4.1.2, p. 523; [StacksKrull], 00IP, Lemma 10.51.4; [StacksStein], 0A18, Theorem 76.36.4 and Lemma 76.36.9 (also tag 0E0D); [EGAI], Chapter I, Proposition 10.8.11 and proof, printed p. 197 (physical PDF 196).

**Propagation through a coefficient extension.**

For the two actual left-exact coefficient rows of 0→N→M→Q→0, injectivity of FJ on AF(k,N) and
AF(k,Q) implies injectivity on AF(k,M). Apply Mathlib's short-complex monicity theorem to the
natural expansion morphism; its first-row monomorphisms and exactness are precisely the two
preceding lemmas. Nonsplit coefficient extensions and torsion are allowed. Surjectivity of the
last global-section map is unnecessary.

**Hypotheses and scope.** Use the exact section row, the monic first coefficient-family map, and the naturality squares
supplied by the preceding nodes. Do not add a surjectivity assumption on AF(k,M) to AF(k,Q), or
invert a coefficient characteristic or a stabilizer order.

**Prerequisites.** B5 (Naturality in the coefficient module); B5 (Left exactness of Hodge-section coefficient
change); B5 (Left exactness of invariant coefficient families);
`mathlib:CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`.

**Sources.** [LanPEL], The left-exact coefficient functors in the proof of 7.1.2.14, pp.539–540.

**Finite coefficients by a prime filtration.**

If the prime-quotient geometric hypotheses hold for every p, deduce FJ injectivity for every
finitely generated R-module. Use the existing Noetherian prime-filtration induction: zero
coefficients, transport from a module linearly equivalent to R/p, and propagation through a
short exact coefficient sequence. Repeated prime factors, R/pⁿ and finite nonfree projective
coefficients are included. The prime filtration does not assert finite length, and coefficient
surjectivity is not section surjectivity.

**Hypotheses and scope.** R is the indicated field or Dedekind domain, hence Noetherian. No principal-ideal-domain or
semilocal assumption is made. Use the existing Mathlib induction for any commutative Noetherian
R and Module.Finite R M. Its prime case is a finite module N together with a linear equivalence
to R/p, so preserve that form across module universes. No complete-local coefficient category or
additional R03.3 scope theorem is required.

**Prerequisites.** B5 (The prime-quotient coefficient case); B5 (Propagation through a coefficient extension); B5
(Naturality in the coefficient module);
`mathlib:IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`;
`mathlib:IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`.

**Sources.** [StacksPrime], 00L0, Lemma 10.62.1; [LanPEL], 7.1.1.4 and the reduction in 7.1.2.14(1), pp.532–533, 539–540; [MathlibPrime], IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime, with its preceding RelSeries existence theorem, at the pinned Mathlib commit.

**Joint injectivity at a component-detecting collection of cusps.**

In Lan's setting choose finitely many nonempty strata whose union meets every irreducible
component of X. Require early C5 to relate this total-space hypothesis to the prime-quotient
detection used above, including the needed non-neat descent. Then FJ_I on AF(k,M) is injective
for every R-module M. A section comes from a finitely generated submodule N⊂M by qcqs
section-colimit compatibility. Naturality and injection G(N)→G(M) reduce its vanishing to the
finite-coefficient theorem. There is no interchange of an infinite coefficient product with a
filtered colimit.

**Hypotheses and scope.** The source's smooth proper good-prime PEL model, k nonnegative, and M an arbitrary R-module. The
finite collection is component-detecting in the source's sense. No claim is made that any chosen
single cusp detects all components. Use the actual qcqs stack section/filtered-colimit
comparison. No colimit theorem for the infinite Fourier-Jacobi coefficient product is assumed.

For an arbitrary M, lift a section to AF(k,N) for a finite submodule N. If its expansion becomes
zero over M, use the injective coefficient-family map G(N)→G(M) to make it zero over N and apply
finite-coefficient injectivity. Only the section functor commutes with this colimit; no
colimit/product identity is needed for G.

**Prerequisites.** B5 (Finite coefficients by a prime filtration); B5 (Naturality in the coefficient module); B5
(Left exactness of invariant coefficient families); B4 integral coefficient interface;
`ShimuraCompactifications:C5`; `SchemeAndStackFoundations:SF.0`;
`SchemeAndStackFoundations:SF.1`; B4 `classicalForms`.

**Sources.** [LanPEL], 7.1.2.14(1), proof, and the module reduction in 7.1.1.4, pp.532–533, 539–540; [StacksColimit], 0GQZ, Lemma 103.13.5, G=O_X.

**Recognition of a coefficient submodule from expansions.**

For M₁⊂M and the same detecting cusps, a section in AF(k,M) comes from AF(k,M₁) exactly when
every chosen expansion lies in the corresponding image of the invariant coefficient family with
M₁ coefficients. Map the section to M/M₁, use naturality and injectivity for that quotient, then
the kernel/image equality of the AF row. The quotient need not be finite or flat, so the
arbitrary-coefficient theorem is essential.

**Hypotheses and scope.** The standing good-prime PEL and component-detection hypotheses. Use the geometric coefficient
functors and the inclusion M1 into M; membership is in their images, not an informal statement
about scalar entries.

**Prerequisites.** B5 (Joint injectivity at a component-detecting collection of cusps); B5 (Naturality in the
coefficient module); B5 (Left exactness of Hodge-section coefficient change); B5 (Left exactness
of invariant coefficient families).

**Sources.** [LanPEL], 7.1.2.14(2) and its exact-row diagram, pp.539–540.

**Cuspidality from boundary restrictions.**

For a neat smooth toroidal model with reduced relative normal-crossings boundary D, suppose the
boundary coefficient sequence remains exact after tensoring with the chosen M. The image of
Γ(X,ω_tor^k(−D)⊗_R M) consists exactly of sections restricting to zero on D. If the boundary
charts detect that restriction, this is equivalent to vanishing of the required constant terms
at all proper boundary labels. Over a nonreduced base geometric-point vanishing is insufficient,
and a single maximal-cusp constant term does not replace all boundary restrictions.

**Hypotheses and scope.** Neatness, smoothness and the stated relative normal-crossings boundary; use B3's actual
subcanonical extension. For nonflat M, retain the relative flatness/exactness checks of the
boundary sequence. No general-coarse-space vector-bundle claim is included.

**Prerequisites.** B4 integral coefficient interface; B5 (Boundary restriction from the constant term);
`ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`; B3 `subcanonicalExtension`; B4
`cuspForms`.

**Sources.** [LanIntro], 4.2.7, printed p. 50.


### Geometric Hecke operators

**Geometric Hecke operators on classical sections.**

For an admissible prime-to-characteristic g let K_g=K∩gKg⁻¹ and use X_K←p₁X_Kg→p₂X_K. On
compatible toroidal refinements the actual coefficient realization gives θ_g:p₂*E→p₁*E. Define
H_g=tr_p₁ θ_g p₂* on Γ(X_K,E⊗_R M), then T_g=ν(g)H_g for the specified K-bi-invariant
multiplicative unit-valued character ν. Trace is finite locally free trace transported through
the supplied toric-refinement comparison. Prove independence of representatives and refinement,
coefficient-map compatibility and preservation of subcanonical sections using the
reduced-boundary transport.

**Hypotheses and scope.** Use actual bundle sections, including coefficients inside the sheaf; Γ(E)⊗M is not substituted.
p1 is finite locally free on a compatible intermediate model; a further fan refinement can be
proper rather than finite. Its coefficient-sensitive pushforward comparison is required. θ_g
uses the right-translation and isogeny convention; ν is part of the level/weight normalization,
not division by every correspondence degree.

**API.**

- `ClassicalHecke.operator`: The R-linear composite ν(g)tr_p1 θ_g p2* on the actual section module.
- `ClassicalHecke.operator_one`: The identity correspondence with ν(1)=1 acts as identity.
- `ClassicalHecke.coefficient_map`: An R-linear coefficient map M→N commutes with T_g, by coefficient-compatible pullback, trace and θ_g.
- `ClassicalHecke.refinement`: Transport across the B3 section comparison along a common fan refinement intertwines T_g, with identity and composition laws.

**Tests.**

- `ClassicalHecke.identity`: The identity correspondence acts as identity on canonical and subcanonical sections.
- `ClassicalHecke.weightZeroTrace`: For a finite-free degree-d chart and the trivial bundle, the raw operator on 1 is d, not 1; the normalized value is ν(g)d.
- `ClassicalHecke.modularNormalization`: Over C, after the imported modular comparison and correct coset orientation, GL2 det⁻¹-scaled isogeny pull-identify-trace agrees with the existing HeckeRing.GL2.heckeRingHomCharSpace action; at an unramified prime its coefficients have the character-weighted ℓ^(k−1) term.

**Prerequisites.** `AdelicAlgebraicGroups:AA.4/hecke-correspondence`;
`AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset`; B2 integral coefficient interface; B3
integral coefficient interface; B4 integral coefficient interface;
`ShimuraCompactifications:C3`; `SchemeAndStackFoundations:SF.0`;
`mathlib:Algebra.trace_algebraMap_of_basis`; B2 `automorphicVectorBundle`; B2
`coefficientTensorHecke`; B1 `principalHeckePullback`; B3 `canonicalExtension`; B3
`subcanonicalExtension`; B3 `fanIndependentSections`; B3.general `generalBoundaryFunctoriality`;
B4 `classicalForms`; B4 `cuspForms`.

**Sources.** [LanPEL], 6.4.3.1–6.4.3.4, pp.527–530; [Diamond22], §6.1, weight/level pullback convention, p.24; [BCGP], §1.8, pp.17–18.

**Convolution law for the geometric Hecke action.**

With these correspondence, coefficient-cocycle, trace/base-change and
multiplicative-normalization hypotheses, extend [KgK]↦T_g to a unital ring homomorphism from the
existing integral Hecke ring to End_R Γ(X_K,E⊗_R M). Its action restricts to cusp sections.
Compare the inverse/right-coset orientation with HeckeCosetModule convolution and retain the
integer multiplicities from the correspondence decomposition.

**Hypotheses and scope.** Require the full double-coset fibre-product/Mackey decomposition, not a false Cartesian square
for an arbitrary normal finer level. Coefficient traces satisfy composition and finite-flat base
change; normalization ν is multiplicative and bi-K-invariant.

**Prerequisites.** B5 (Geometric Hecke operators on classical sections);
`AdelicAlgebraicGroups:AA.4/hecke-cartesian`; `tauceti:HeckeCosetModule.instRingHeckeRing`;
`tauceti:HeckeRing.GL2.heckeRingHomCharSpace`; `SchemeAndStackFoundations:SF.0`.

**Sources.** [BCGP], §1.8, Hecke conventions, pp.17–18; [Diamond22], §6.1, p.24.

**Hecke action at non-neat level.**

For a normal neat K′⊲K with finite quotient Γ, identify sections of the actual equivariant
coefficient on [X_K′/Γ] with Γ(X_K′,E⊗_R M)^Γ. Construct the K-Hecke action on this equalizer
using the K_g correspondence and common neat covers of both legs. Prove stability, independence
of cover and agreement with stack pull-identify-trace. The AA.4 Cartesian comparison requires
its U′L=U hypothesis; normality of a chosen cover alone does not supply that square or its
double coset.

**Hypotheses and scope.** The quotient means the stack with its bundle action; no coarse-space vector bundle descent is
assumed. No inversion of |Γ| is required for the equalizer. Hecke compatibility uses the refined
correspondence and Mackey sum, not restriction of a single K′-double-coset operator.

**Prerequisites.** B5 (Geometric Hecke operators on classical sections); B5 (Convolution law for the geometric
Hecke action); `AdelicAlgebraicGroups:AA.4/hecke-cartesian`; `SchemeAndStackFoundations:SF.1`;
`ShimuraCompactifications:C3`.

**Sources.** [Diamond22], §6.1, non-small U and normal fine U′, p.24; §6.2, normal-level invariants argument immediately before Proposition 6.2.1, p.25; [LanPEL], 7.1.2.6–7.1.2.8, pp.536–537.

**Tate and analytic q-expansion comparison.**

Specialize rank-one FJ to R15.1's Tate q-expansion and its analytic comparison with
UpperHalfPlane.qExpansion h at q=exp(2πiτ/h), using the same differential frame. At full level
n≥3 the owner's family is Tate(qⁿ) over ℤ[1/n,ζ_n][[q]], with Kodaira–Spencer sending the square
of the invariant differential to n dq/q. Import the all-component integral principle, cusp exact
sequence and geometric modular Hecke operators from R15.2. Compare their normalization with the
existing analytic Hecke action.

**Hypotheses and scope.** Match the selected cusp, width h>0 in the actual subgroup strict periods, roots of unity and
descent data. Levels 1 and 2 use the owner’s stack/rigidifying-cover descent. One infinity
constant detects cuspidality only in the full modular group case already proved in Mathlib.

**Prerequisites.** B5 (Expansion by restriction to a formal cusp chart); B5 (Geometric Hecke operators on classical
sections);
`AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`;
`AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`;
`AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`;
`AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`;
`AlgebraicModularFormsAndSerreWeights:R15.2/cuspidal-exact-sequence-equivariance`;
`mathlib:UpperHalfPlane.qExpansion`; `mathlib:ModularForm.qExpansion_injective`;
`mathlib:ModularForm.isCuspForm_iff_coeffZero_eq_zero`;
`tauceti:HeckeRing.GL2.heckeRingHomCharSpace`.

**Sources.** [LanPEL], 7.1.2.1–7.1.2.4, pp.534–535; [LanIntro], §4.2.7, pp.49–50.


### Vector coefficients and ramified Hilbert expansions

**Fourier–Jacobi expansion with vector coefficients.**

On Lan's neat good-prime PEL model over a Noetherian allowed coefficient algebra R, let W be a
finite projective representation of the actual Levi. Import Ecan(W) and its boundary pullback
identification with a locally free E₀(W) on the abelian torsor C. For any M define degree-ℓ
coefficients Γ(C,Ψ(ℓ)⊗E₀(W)⊗_R M) and extract them by completed restriction. Keep the completion
support and full stabilizer transports before taking invariants. In general characteristic zero
require C3.general's proven mixed-boundary/coefficient comparison; Milne VII Conjecture 4.1 is
not that proof. The boundary filtration on C need not descend to its stabilizer quotient.

**Hypotheses and scope.** The PEL bundle W is finite projective and the fan smooth/projective as in Lan Higher §2;
arbitrary infinite-dimensional or p-adic analytic representations are not included. The
degree-zero coefficient module is Γ(C,Ψ(ell)⊗E0⊗M). Definition 5.10 also treats higher
cohomology, which is not replaced here by a degree-zero product. E0’s filtration is on C. Its
graded pieces descend locally over the lower base, but the whole filtration need not descend
through the stabilizer quotient.

**API.**

- `VectorFourierJacobi.expansion`: Given the actual finite-projective representation bundle and its completed boundary identification, return the R-linear vector expansion into the full-stabilizer invariant family of sections of Ψ(ell) tensor E0(W) tensor_R M.
- `VectorFourierJacobi.coefficient`: Extract the degree-ell section of Ψ(ell)⊗E0(W)⊗M from the completed boundary restriction.
- `VectorFourierJacobi.coefficient_map`: An equivariant R-linear representation map W→W′ and a coefficient map M→M′ induce commuting degreewise maps, respecting identities and composition.
- `VectorFourierJacobi.transport`: A cusp transport moves the lattice degree, Ψ and E0 together and intertwines extraction.
- `VectorFourierJacobi.determinant`: The determinant-Hodge representation specializes to the scalar FJ map, under B3’s supplied boundary bundle isomorphism.
- `VectorFourierJacobi.refinement`: The canonical section comparison for a common fan refinement intertwines vector expansions and has its cocycle law.

**Tests.**

- `VectorFourierJacobi.zeroRepresentation`: For W=0 or M=0 every coefficient and expansion is zero.
- `VectorFourierJacobi.rankTwoMonomial`: On a trivial rank-two local coefficient bundle and rank-one chart, q^n(v1,v2) has vector coefficient (v1,v2) at n and zero at other degrees.
- `VectorFourierJacobi.scalarSpecialization`: For the determinant-Hodge representation giving ω^k the expansion equals the scalar map after the actual boundary-line identification.

**Prerequisites.** B5 (Fourier-Jacobi coefficient modules on the abelian torsor); B5 (Expansion by restriction to a
formal cusp chart); B5 (Comparison of cone expansions through a common completion); B5 (The
cusp-label Fourier-Jacobi morphism); B2 integral coefficient interface; B3 integral coefficient
interface; B4 integral coefficient interface; `ShimuraCompactifications:C3.general`;
`ShimuraCompactifications:C4`; B2 `automorphicVectorBundle`; B2 `leviHighestWeightConvention`;
B3 `canonicalExtension`; B3 `boundaryCoefficientChart`; B3.general `generalCanonicalExtension`;
B4 `classicalForms`.

**Sources.** [LanHigher], Author-hosted preprint, Proposition 5.6 and proof, pp.11–13; Remark 5.7, p.13; [LanHigher], Author-hosted preprint, Corollaries 5.8–5.9 and Definition 5.10, p.13; [Milne90], VII.4, Conjecture 4.1, p.102.

**Expansion principle for locally free automorphic coefficients.**

Let R be Noetherian and X qcqs smooth over R in the supplied setup. Require finite-rank locally
free Ecan, R-flat abelian-torsor charts with locally free E₀, the actual formal graded
comparison/descent, and finitely many strata meeting every irreducible component of X_(R/p) for
each prime p. Then joint vector FJ is injective for every R-module M and recognizes images from
M₁⊂M. Its boundary-zero criterion identifies Esub sections when the relative boundary tensor
sequence is exact. Use prime filtrations, the two left-exact rows and qcqs colimits as in the
scalar proof.

**Hypotheses and scope.** The component condition is fibrewise after every prime reduction, including the zero prime when
present; total-model density alone is not used as this hypothesis. Use the sheaf colimit theorem
on qcqs stacks via SF.1, or schemes at neat level. Products of coefficient modules are not
asserted to commute with filtered colimits. This is a derived vector-bundle extension of Lan’s
scalar argument, with the formal identification from Higher Koecher’s principle; it is not
claimed as a literal statement of either paper.

**Prerequisites.** B5 (Fourier–Jacobi expansion with vector coefficients); B5 (Naturality in the coefficient
module); B5 (Left exactness of Hodge-section coefficient change); B5 (Left exactness of
invariant coefficient families); B5 (Finite coefficients by a prime filtration); B5 (Recognition
of a coefficient submodule from expansions); B5 (Boundary restriction from the constant term);
B5 (Cuspidality from boundary restrictions);
`AdicSpacesPartII:F0/completion-detects-near-closed`; `SchemeAndStackFoundations:SF.1`; B3
integral coefficient interface; B4 integral coefficient interface; B3 `canonicalExtension`; B3
`subcanonicalExtension`; B4 `classicalForms`; B4 `cuspForms`.

**Sources.** [LanPEL], Proposition 7.1.2.14, pp.539–540; [LanHigher], Author-hosted preprint, Proposition 5.6, p.11.

**Hilbert cusp q-expansions and coefficient lines.**

Let F≠ℚ be totally real, p possibly ramified, O the valuation ring of a sufficiently large
p-adic field with embedding set Θ, and U=U^p GL₂(O_F,p). For a Noetherian O-algebra R and
integer vectors (k,m), require χ_(k+2m),R to be trivial on O_F×∩U. Use the actual ramified
splitting-model line A_(k,m) and M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_*A). For cusp data 0→I→H→J→0 with
polarization and level, set Λ=d_F⁻¹I⁻¹J. Choose fine prime-to-p N≥3, ζ_N∈O and a splitting of H.
Its coefficient line is D_(k,m),c=⊗_θ(I⁻¹)_θ^{kθ}⊗(d_F(IJ)⁻¹)_θ^{mθ}. Define the expansion into
completed line-valued series indexed by N⁻¹Λ_+∪{0}; prove splitting, representative and
fine-level transport with the actual unit action. The minimal pushforward need not be locally
free.

**Hypotheses and scope.** All the weight, level and trivial-unit-character conditions are part of the definition; p=2 and
ramified p are not discarded. The ramified Pappas–Rapoport splitting model and its automorphic
line are imported from H2/B2/B3 and the Hilbert cusp geometry from C6. The series includes zero
and totally positive degrees in the stated fractional lattice; the coefficient line and unit
action cannot be replaced by a naked scalar monoid algebra.

**API.**

- `HilbertQExpansion.map`: The R-linear formal restriction q_c into the coefficient-line series in the specified fractional positive lattice.
- `HilbertQExpansion.coeff`: Extract the D_c⊗R coefficient of t∈N⁻¹Λ_+∪{0}, including zero.
- `HilbertQExpansion.transport`: The canonical lattice/line isomorphism for a cusp representative or splitting change intertwines the transformed series; transports compose.
- `HilbertQExpansion.coefficient_map`: A Noetherian O-algebra map R→R′ commutes with each coefficient after base change of the actual form.
- `HilbertQExpansion.fineLevel`: Restriction to a fine U(N) and any cusp above c gives the same expansion after the canonical line/lattice identifications.

**Tests.**

- `HilbertQExpansion.zero`: The zero form has zero coefficient in every degree; over the zero coefficient ring all forms and coefficients vanish.
- `HilbertQExpansion.localMonomial`: On a chosen formal cusp chart and coefficient-line trivialization, q^t d has coefficient d at t and zero elsewhere; no global form or unit invariance of this local monomial is asserted.
- `HilbertQExpansion.unitTransport`: A family supported at a positive t moved to a different degree by a cusp unit, with nonzero coefficient only at t, is not invariant unless its full transported orbit satisfies the unit relation. It cannot be declared the expansion of a descended form.

**Prerequisites.** B5 (Fourier–Jacobi expansion with vector coefficients);
`HilbertModularVarietiesAndShimuraCurves:H2`; `HilbertModularVarietiesAndShimuraCurves:H3`;
`ShimuraCompactifications:C6`; B2 integral coefficient interface; B3 integral coefficient
interface; B4 integral coefficient interface; B2 `automorphicVectorBundle`; B3
`canonicalExtension`; B3 `minimalCoherentPushforward`; B4 `HilbertArithmeticWeight`; B4
`hilbertCoefficient`; B4 `unsplitHilbertDescent`; B4 `hilbertCentralDescent`.

**Sources.** [Diamond22], §6.1 and §6.2, pp.24–25.

**Hilbert q-expansion principle.**

In this prime-to-p Hilbert setting, take cusps S meeting every connected component of Ymin,
equivalently surjecting onto F_+×\A_F,f×/det(U). Diamond's q_S is injective. For a Noetherian
O-subalgebra R′⊂R, coefficients in D_c⊗_O R′ at every c∈S recognize a form over R′. Require the
ramified formal-chart and component/fibre comparison from C6/H2/H3. For general U descend from a
normal fine cover by invariants. General Iwahori special fibres can have irreducible components
without cusps, so this detection principle does not extend to them.

**Hypotheses and scope.** Retain the weight/unit condition over both rings and the exact prime-to-p level U. The
determinant surjectivity is the source’s component condition, not merely the choice of one
representative in a polarization class. Before importing the vector proof at torsion R, C6 must
supply the actual fibrewise detection argument; it remains an explicit input rather than an
inferred smoothness claim for every ramified integral model.

**Prerequisites.** B5 (Hilbert cusp q-expansions and coefficient lines); B5 (Expansion principle for locally free
automorphic coefficients); B5 (Recognition of a coefficient submodule from expansions);
`ShimuraCompactifications:C6`; `HilbertModularVarietiesAndShimuraCurves:H2`;
`HilbertModularVarietiesAndShimuraCurves:H3`; `SchemeAndStackFoundations:SF.1`.

**Sources.** [Diamond22], Proposition 6.2.1 and following Iwahori warning, p.25.

**Hilbert cusp forms and all cusp constants.**

Define the Hilbert cusp space as the kernel of the product of constant-term maps over all cusps,
with each constant in its actual line D_c⊗_O R and cusp-unit invariants. Under the
canonical/subcanonical comparison and exact boundary tensor sequence this equals the image of
Γ(Ytor,A_(k,m)(−D)⊗_O R). Constants are independent of the splitting. In §6.3's
characteristic-zero or O-flat setting a nonparallel pair (kθ,mθ) has zero invariant constants
and every form is cuspidal; no such assertion is made for arbitrary torsion coefficients.

**Hypotheses and scope.** Use every required boundary component and its unit/line action. One infinity coefficient at
arbitrary level is insufficient. B3/C6 supply the precise Hilbert boundary ideal and tensor
exactness, including the ramified model; Koecher extension does not replace the cusp ideal.

**Prerequisites.** B5 (Hilbert cusp q-expansions and coefficient lines); B5 (Boundary restriction from the constant
term); B5 (Cuspidality from boundary restrictions); B3 integral coefficient interface;
`ShimuraCompactifications:C6`; B3 `subcanonicalExtension`.

**Sources.** [Diamond22], §6.3, p.26.

**Hecke action on Fourier–Jacobi coefficients.**

Complete the actual Hecke correspondence at its cusps and define the coefficient operator H_g^FJ
by its lattice transport, coefficient-bundle identification and finite trace. Prove
FJ∘T_g=ν(g)H_g^FJ∘FJ, compatible with coefficient change and refinement. At a good modular ℓ∤N
this becomes b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ), including n=0 and with the second coefficient zero
if ℓ∤n. In Diamond's normalized Hilbert coefficients, for v∤np use r_m^t(T_v f)=r_m^(ϖ_v
t)(f)+Nm(v)r_m^(ϖ_v⁻¹t)(S_v f); for U₁(n) and v|n omit the second term. Keep the
coefficient-line/χ_m normalization and actual central correspondence S_v.

**Hypotheses and scope.** Require formal trace/base-change and actual degree/cusp maps from C3/C4; ordinary toric
inclusions alone do not give them. The modular geometric normalization requires ℓ invertible and
the source’s good-prime hypotheses. Diamond’s displayed formulas use primes outside p; no saving
trace or U_p at p is inferred. Retain the different cusp/component t in the Hilbert formula and
its character normalization.

**Prerequisites.** B5 (Geometric Hecke operators on classical sections); B5 (Hecke action at non-neat level); B5
(Tate and analytic q-expansion comparison); B5 (Hilbert cusp q-expansions and coefficient
lines); B5 (Fourier–Jacobi expansion with vector coefficients); `ShimuraCompactifications:C3`;
`ShimuraCompactifications:C4`; `ShimuraCompactifications:C6`;
`AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`;
`tauceti:HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`.

**Sources.** [Diamond22], Proposition 6.5.1, equation (6.1) and Remark 6.5.2, pp.27–29; [LanPEL], 5.4.3.8–5.4.3.10 and 6.4.3, pp.438–439 and 527–530.


### Classical Siegel Hodge–Tate comparisons

**Classical algebraic bundles in the Hodge–Tate coefficient functor.**

Import B4's μ-normalized classical VB⁰ identification for finite-dimensional algebraic
M-dominant L_κ, neat tame K^p and a sufficiently large p-adic field E. Compare coherent level
cohomology with colim_{K_p}RΓ(X_KpK^p,ω^κ_Kp), a complex of smooth admissible
G(ℚ_p)-representations, with the corresponding normalization. Give the subcanonical version
using the actual boundary ideal, and compatibility with level maps, prime-to-p Hecke maps and
fan changes through common refinements. For GSp₄ the (1,0;−1) check gives ω_A(−1)⊗O^sm. The VB
carrier and its finite-dimensional descent/acyclicity come from HigherHidaAndColemanTheory.

**Hypotheses and scope.** The bundle is finite-dimensional and algebraic, not a locally analytic Coleman coefficient.
Retain the μ normalization; §4.8 uses untwisted coherent bundles and applies its Tate twists
separately. Use HigherHidaAndColemanTheory for the complete VB carrier and its
finite-dimensional comparison interface.

**Prerequisites.** `HodgeTateAndCanonicalSubgroups:T6:comparison`; `SchemeAndStackFoundations:SF.2`;
`ShimuraCompactifications:C3.general`; B5 (Geometric Hecke operators on classical sections); B1
`hodgeCanonicalPrincipalBundle`; B1 `principalHeckePullback`; B2 `automorphicVectorBundle`; B2
`leviHighestWeightConvention`; B3 `canonicalExtension`; B3 `subcanonicalExtension`; B3
`fanIndependentSections`; B3.general `generalBoundaryFunctoriality`; B4
`classicalVBTateNormalization`.

**Sources.** [BCGP], §§4.6.1–4.6.2, pp.81–82; §§4.5.17–4.5.22 for refinement context.

**Classical Siegel Hodge–Tate decomposition.**

For BCGP's finite-level GSp₄ toroidal model, take an integral dominant κ=(k₁,k₂;w) with 0≥k₁≥k₂
and k₁+k₂+w even. Let V_κ∨ be the actual canonical pro-Kummer-étale coefficient. With the
untwisted coherent convention of §4.8 put λ₀=(k₁,k₂;−w), λ₁=(2−k₁,k₂;−w), λ₂=(3−k₂,k₁+1;−w),
λ₃=(3−k₂,3−k₁;−w), and 2a₀=k₁+k₂+w, 2a₁=2−k₁+k₂+w, 2a₂=4−k₂+k₁+w, 2a₃=6−k₁−k₂+w. For i≥0 specify
the G_ℚp×T_KpK^p-equivariant comparison Hⁱ(X,V_κ∨)⊗_ℚp C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj)(−a_j), with
negative coherent degrees zero. Use the logarithmic/pro-Kummer cohomology in the source, its
actual comparison and dual BGG/Kostant inputs; a spectral sequence alone does not establish the
displayed decomposition.

**Hypotheses and scope.** Keep all four weights, central weight −w, shifts i−j and separate Tate twists −a_j. Parity makes
every a_j integral. Require T6/B1’s logarithmic comparison and canonical local system, together
with the dual BGG/Kostant identification and the degeneration/Hecke comparison underlying the
theorem attributed to Faltings–Chai.

For κ=0 the four λ_j are (0,0;0), (2,0;0), (3,1;0), (3,3;0) and a_j=0,1,2,3. At i=0 only the j=0
term can survive. The parity test excludes (0,0;1), so half-weight division is exact integer
division only under the hypothesis. T6:comparison supplies logarithmic cohomology; the dual BGG
calculation and the comparison attributed by BCGP to Faltings–Chai Theorem 6.2 supply the
decomposition proof.

**Prerequisites.** `HodgeTateAndCanonicalSubgroups:T6:comparison`; `SchemeAndStackFoundations:SF.2`; B5 (Classical
algebraic bundles in the Hodge–Tate coefficient functor); B5 (Convolution law for the geometric
Hecke action); B1 `hodgeCanonicalPrincipalBundle`; B2 `etaleCoefficientLocalSystem`; B2
`leviHighestWeightConvention`; B3 `canonicalExtension`; B4 `siegelCoefficient`.

**Sources.** [BCGP], §4.8.1 and Theorem 4.8.2, pp.101–102.

**Compact-support Siegel Hodge–Tate decomposition.**

For exactly the datum, integral weight, coefficient and Tate convention of the preceding
comparison, specify H_cⁱ(X,V_κ∨)⊗_ℚp C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj(−D))(−a_j), equivariantly for
G_ℚp×T_KpK^p. Here D is the actual reduced toroidal boundary and H_c the supplied
compact-support logarithmic/étale theory. Its boundary comparison and duality are separate
prerequisites; ordinary cohomology and degree-zero constant-term vanishing alone do not imply
this formula.

**Hypotheses and scope.** Use the same four λ_j and a_j, all component boundary ideals and compact-support functoriality.
The boundary/logarithmic compact-support comparison and duality are supplier inputs. It is not a
formal consequence of degree-zero cuspidality or of the ordinary decomposition.

**Prerequisites.** `HodgeTateAndCanonicalSubgroups:T6:comparison`; `SchemeAndStackFoundations:SF.2`; B5 (Classical
algebraic bundles in the Hodge–Tate coefficient functor); B5 (Convolution law for the geometric
Hecke action); B5 (Classical Siegel Hodge–Tate decomposition); B5 (Cuspidality from boundary
restrictions); B1 `hodgeCanonicalPrincipalBundle`; B2 `etaleCoefficientLocalSystem`; B2
`leviHighestWeightConvention`; B3 `canonicalExtension`; B3 `subcanonicalExtension`; B4
`siegelCoefficient`; B4 `cuspForms`.

**Sources.** [BCGP], Theorem 4.8.2, compact-support display, pp.101–102.


## Supplier contracts

These interfaces connect the targets above to their geometric and algebraic
foundations. They specify the mathematics required from each owner, rather
than treating a supplier's title as a theorem with unrestricted hypotheses.

**Reductive-group direction (`ReductiveGroupsPartII`).** Supply algebraic
principal torsors and contracted products with finite locally free
representations, fpqc descent, pullback and tensor/dual coherence; the
central torus and quotient construction used in B0; tensor-stabilizer
representability in characteristic zero; and the rational, nonsplit and
integral representation forms required for the Levi coefficients. Complex
Schur functors alone do not provide the integral associated bundle.

**Absolute Hodge and period comparison.** B1 needs the absolute-Hodge
foundation, the CM part of Deligne's proof and the compatible relative
tensor comparisons, together with a CM period torsor and continuous
effective principal-bundle descent. Deligne Theorem 2.11, Principles B
2.12/2.15 and Proposition 6.1 locate these inputs (pp.19–21, 41–42).
The general principal construction additionally needs the faithful
second-jet injection and its equivariant functoriality, and the
principal-automorphism argument of Milne88 Lemmas 9.1–9.4 (pp.33–34).
V7 supplies the generating rank-one data and normalized variety descent;
it does not replace the principal-bundle argument.

**Full-group realization descent.** B2 and B2.general require the actual
arithmetic quotient local system, continuous lattice descent on the
ℓ-adic tower, algebraic filtered-connection descent and the tensor-compatible
horizontal-section comparison. A4's family comparisons supply the abelian
case, while the representation-level functors and their weight restrictions
remain part of this coefficient interface. The integral CM étale extension
in AG §3.3 (pp.418–419) uses its particular integral CM stack and finite
étale ℓ-level tower; it is stronger than the generic-fibre B2 coefficient.

**Arithmetic centre.** R09.5 supplies finite tame coarse descent. Infinite
ineffective central kernels require the analytic effective quotient and
its algebraic coefficient-group comparison, with fibre triviality proved
on the kernel. H0/H3/H4 provide the Hilbert groups and their true unit
quotients.

**Canonical boundary normalization.** B3 uses Milne90 V §6 (pp.90–91),
HLTT Appendix B.8 (pp.270–271) and the specified degeneration charts.
The boundary construction requires the Deligne–Harris local growth and
transition comparison, general-data canonical charts, and a regular-singular
connection interface with the exact monodromy/residue hypotheses. Relative
integral extensions use C5's good-base coefficients. The local analytic
input for B4 is a removable-singularity and coordinatewise vanishing
theorem; HarrisLog p.3 supplies degree-zero kernel information, not a full
Dolbeault-resolution proof. Projective GAGA belongs to C2 of
ComplexComparisonPartII and is applied to the proper toroidal model.

**Coherent sections.** SF.0–SF.2 supply the locally free tensor/ideal
dictionary, proper coherent finiteness, flat field base change and degree-zero
section maps. For arbitrary integral coefficients distinguish tensoring
inside the sheaf from tensoring the global-section module. Neither
Γ(E)⊗M≃Γ(E⊗M) nor special-fibre base change is assumed without a theorem.
For the qcqs stack colimit theorem use [StacksColimit], Lemma 103.13.5,
with G=O_X and its site hypotheses.

**Formal boundary charts.** C0 supplies the homogeneous ideal J of the
union of positive-cone strata and its quotient degree maps; C4 and early
C5 supply the common Mumford-family chart mapping to X and the compatible
Hodge section. F0/completion-of-morphism gives the scheme completion maps
when J maps into the individual stratum ideal I_σ. The ring direction is
from the common J-adic completion to the individual I_σ-adic completion.
Separated degree projections must commute with these maps, and SF.1 must
transport the calculation through the actual stack atlas. An ordinary
face-open immersion alone supplies none of this completed comparison.
See [EGAI], I 10.9.1–10.9.3, pp.198–199, and [LanPEL], the common
completion preceding (6.2.5.22), p.482, and Remark 6.2.5.30, p.485.

**Reduction and component detection.** At each finite ideal thickening,
SF.0/F0 compare (P/I^(n+1)P)⊗_R S with P_S/I_S^(n+1)P_S, naturally in n
and the chart transports. Take the inverse limit of these identified
systems; this step does not commute arbitrary tensor products with inverse
limits. Identify the resulting system with C5's actual Mumford coefficient
map. For a locally Noetherian scheme and coherent sheaf,
F0/completion-detects-near-closed supplies vanishing near the selected
closed subset ([EGAI], I Proposition 10.8.11, p.197). Stack vanishing
requires the flat-atlas descent of SF.1.

At neat level use C5/neat-strata-detect-geometric-components and its
neat-boundary-intersection-smooth, neat-boundary-open-fiberwise-dense,
neat-stratum-closure-component and neat-stratum-closure-proper
prerequisites. The regular Noetherian base, good-prime, neat and
fan/no-self-intersection assumptions stay attached. Its generic geometric
ingredient belongs to SF.1: a smooth proper algebraic space over the
regular base has a finite étale Stein factor; smooth proper boundary
intersections have clopen images in that factor, and fibrewise-dense opens
therefore detect the required geometric fibre components. Use
[StacksStein], Lemma 76.36.1, Theorem 76.36.4 and Lemma 76.36.9.
At non-neat level prove the branch or level-change coverage and descent;
the inverse image of a chosen stratum need not detect every component of
an arbitrary neat cover. This arithmetic-base Stein factor is distinct
from the Shimura minimal compactification.

The C5 toroidal/formal-chart interface precedes B5's constant-term theorem;
the minimal-boundary factorization in Lan §7.2.3 consumes that theorem.
Keep these two endpoints separate in the dependency graph. A C5 import
here always means the early chart interface when the minimal construction
is not explicitly named.

**Trace and non-neat correspondences.** SF.0 supplies local-to-global finite
projective trace, projection formula, transitivity and finite-flat base
change for the actual coefficients. C3 and B3 supply toric refinement
pushforward and the reduced-boundary transport, then completed coefficient
trace compatibility. The proper-duality counit in SF.2 is a different
trace. AA.4's Cartesian square requires U′L=U. For arbitrary normal neat
covers use the true common refinement and Mackey decomposition, followed
by stack descent of the section equalizer, without averaging.

**Ramified Hilbert specialization.** C6/H2/H3 identify Diamond's actual
Pappas–Rapoport splitting-model cusp completion, fractional lattice,
weight line, unit action and determinant components, including the
fibre-detection argument in Proposition 6.2.1 ([Diamond22], pp.24–26).
Reuse C6's hilbert-q-expansion-comparison, hilbert-q-expansion-module-injective,
hilbert-q-expansion-injective, hilbert-q-expansion-coefficient-descent and
hilbert-boundary-constant-term on their tame, discriminant-inverted
overlap. Those hypotheses do not supply the ramified or p=2 case.
Rapoport's Theorem 6.7 cited in Diamond's proof is a further underlying
input. General Iwahori cusp coverage is false in the stated special-fibre
generality.

**Classical p-adic comparisons.** The rational Hodge–Tate M-torsor, its
finite-dimensional VB realization and solid analytic embedding are
separate comparison inputs to B4, with the μ twist and fan transport.
They consume B1–B3; they are not prerequisites for constructing those
layers. HigherHidaAndColemanTheory supplies the VB carrier and its
finite-dimensional descent/acyclicity interface. The dual BGG/Kostant
calculation belongs to LieHighestWeightPartIICompletedCategoryO, beyond
the scope of Tau Ceti LieHighestWeight. T6:comparison and SF.2 supply
the actual logarithmic/compact-support cohomology, degeneration, duality
and Hecke/Galois functoriality. [BCGP], Theorem 4.8.2, pp.101–102, states
the two decompositions and attributes them to Faltings–Chai Theorem 6.2.
The four-weight calculation specifies their coefficients; the underlying
comparison proof and boundary functoriality are additional inputs.

## Examples that fix the interfaces

- For GL₂, the tautological compact-dual line has degree −1, while the
  cohomological modular Hodge coefficient of weight k is ω^k. The
  coefficient/dual comparison determines the sign; identifying both by
  an unqualified character would reverse a weight.
- On a proper geometrically connected model the unit coefficient has
  section space L. On Spec L[t] it has the infinite independent family
  1,t,t²,… . Properness is essential to the finite-dimensional statement.
- At a two-component boundary crossing, cusp membership is divisibility
  by q₁q₂. After a blow-up the exceptional boundary can have a different
  pullback multiplicity; use ideal pushforward to compare cusp sections.
- For an arithmetic Hilbert weight with k=4,w=2 at one embedding, the
  determinant exponent is −1. Replacing it by a nonnegative exponent
  changes the central character.
- A formal series (1−q)⁻¹ has nonzero coefficients in all degrees over a
  nonzero ring. A finite-support target loses valid completed sections.
- Over ℤ/4, reduction to ℤ/2 is not injective, and the coefficient 2 is
  nonzero nilpotent. The expansion proof must use both terms in an
  extension, rather than test only a residue field of each coefficient
  module.
- For the shear action of C₂ on (ℤ/2)², the second-coordinate quotient is
  surjective before invariants and need not be surjective after invariants.
  Only the left-exact invariant functor enters the argument.
- In the Siegel comparison κ=0 gives coherent weights (0,0;0), (2,0;0),
  (3,1;0), (3,3;0), Tate exponents 0,−1,−2,−3 and coherent degrees i,i−1,
  i−2,i−3. Every compact-support term additionally has the twist −D.
  The putative weight (0,0;1) fails parity and must not be accepted by
  integer division of a half-weight.

The roadmap's endpoint is usable classical and cuspidal coefficients over
their actual number fields and specified integral PEL/Hilbert bases, with
coherent functorial maps, Hecke actions and coefficient-detecting expansions.
The supplier contracts above remain part of the prerequisites for that
endpoint.


## References

- **Milne90.** J. S. Milne, *Canonical models of (mixed) Shimura varieties and automorphic vector bundles*. Corrected author revision, 11 March 2018; cited chapter and page numbering. [Milne90]

[Milne90]: https://www.jmilne.org/math/xnotes/AA.pdf

- **Milne88.** J. S. Milne, *Automorphic vector bundles on connected Shimura varieties*. Author TeX copy of Invent. Math. 92 (1988), pp.91–128 [Milne88]

[Milne88]: https://jmilne.org/math/articles/1988aT.pdf

- **LanIntro.** Kai-Wen Lan, *An Example-Based Introduction to Shimura Varieties*. Author-hosted introduction; cited section and printed page numbering. [LanIntro]

[LanIntro]: https://www.kwlan.org/articles/intro-sh-ex.pdf

- **AG.** F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*. Version of record, Annals of Mathematics 187 (2018), 391–531 [AG]

[AG]: https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf

- **CS.** A. Caraiani, P. Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. Version of record, Annals of Mathematics 186 (2017), 649–766 [CS]

[CS]: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf

- **BCGP.** G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1, 28 February 2025. [BCGP]

[BCGP]: https://arxiv.org/pdf/2502.20645v1

- **HLTT.** M. Harris, K.-W. Lan, R. Taylor, J. Thorne, *On the rigid cohomology of certain Shimura varieties*. Author-hosted manuscript; cited manuscript page numbering. [HLTT]

[HLTT]: https://www.kwlan.org/articles/rigcoh.pdf

- **HarrisLoc.** M. Harris, *Beilinson–Bernstein localization over Q and periods of automorphic forms*. Author-hosted manuscript; cited manuscript page numbering. [HarrisLoc]

[HarrisLoc]: https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf

- **HarrisBundles.** M. Harris, *Vector bundles (Cours 2013, 4fibres)*. Author-hosted course notes, 2013. [HarrisBundles]

[HarrisBundles]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf

- **HarrisLog.** M. Harris, *Logarithmic growth (Cours 2013, 8logarithmique)*. Author-hosted course notes, 2013. [HarrisLog]

[HarrisLog]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/8logarithmique.pdf

- **HarrisToric.** M. Harris, *Torus embeddings (Cours 2013, 7torique)*. Author-hosted course notes, 2013. [HarrisToric]

[HarrisToric]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/7torique.pdf

- **Deligne.** P. Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties*. Revised author TeX copy, 1 October 2018, of LNM 900 (1982), pp.9–100 [Deligne]

[Deligne]: https://jmilne.org/math/Documents/Deligne82.pdf

- **Diamond21.** Fred Diamond, *Geometric weight-shifting operators on Hilbert modular forms in characteristic p*. arXiv:2011.14128v2, 18 September 2021. [Diamond21]

[Diamond21]: https://arxiv.org/pdf/2011.14128v2

- **LanPEL.** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties*. Author-hosted thesis revision, 14 March 2021, with book numbering. [LanPEL]

[LanPEL]: https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf

- **LanErrata.** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties - Errata*. 14 March 2021 [LanErrata]

[LanErrata]: https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf

- **StacksPrime.** The Stacks Project Authors, *Lemma 10.62.1: prime filtrations of finite modules*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksPrime]

[StacksPrime]: https://stacks.math.columbia.edu/tag/00L0

- **StacksKrull.** The Stacks Project Authors, *Krull's intersection theorem*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksKrull]

[StacksKrull]: https://stacks.math.columbia.edu/tag/00IP

- **StacksColimit.** The Stacks Project Authors, *Filtered colimits and finitely presented modules on algebraic stacks*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksColimit]

[StacksColimit]: https://stacks.math.columbia.edu/tag/0GQZ

- **StacksProjective.** The Stacks Project Authors, *Finite projective modules*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksProjective]

[StacksProjective]: https://stacks.math.columbia.edu/tag/00NX

- **StacksStein.** The Stacks Project Authors, *Stein factorization for algebraic spaces*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksStein]

[StacksStein]: https://stacks.math.columbia.edu/tag/0A18

- **MathlibPrime.** Jinzhao Pan and the Mathlib contributors, *Prime filtrations and exact-sequence induction for finite modules*. Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174 [MathlibPrime]

[MathlibPrime]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean

- **EGAI.** A. Grothendieck, with J. Dieudonné, *Éléments de géométrie algébrique I: Le langage des schémas*. Publications Mathématiques de l’IHÉS 4 (1960), journal scan served by Numdam [EGAI]

[EGAI]: https://www.numdam.org/article/PMIHES_1960__4__5_0.pdf

- **LanHigher.** Kai-Wen Lan, *Higher Koecher’s principle*. Author-hosted preprint; cover directs readers to Mathematical Research Letters 23 (2016), 163–199, DOI 10.4310/MRL.2016.v23.n1.a9 for the official version. Locators below use the preprint pagination, not journal pagination. [LanHigher]

[LanHigher]: https://www.kwlan.org/articles/Koecher.pdf

- **Diamond22.** Fred Diamond, *Compactifications of Iwahori-level Hilbert modular varieties*. arXiv:2211.06922v1, 13 November 2022 (PDF cover date) [Diamond22]

[Diamond22]: https://arxiv.org/pdf/2211.06922v1
