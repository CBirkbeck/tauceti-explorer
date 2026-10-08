# Automorphic forms on reductive groups

This roadmap builds the analytic and representation-theoretic interfaces needed to pass between classical forms, functions on adelic quotients, local representations and cohomology. It starts from the existing Lie-group, compact-group, highest-weight, modular-form and number-field libraries. General adelic points, Haar normalization, heights and reduction theory belong to AdelicAlgebraicGroups; smooth representations of nonarchimedean groups belong to SmoothRepresentationsOfLocalGroups. The arithmetic spaces and their Betti cohomology belong to ArithmeticLocallySymmetricSpaces, and the Hilbert spectral decomposition belongs to AutomorphicSpectralTheory. These interfaces are imported through exact node references or explicit requests.

The seven stages have a complete target-level plan: every target is specified and its prerequisite chain reaches a pinned declaration, another roadmap or an identified gap. Each stage is **planned**, none is **closed**. This distinction matters for the analytic classification and arithmetic comparisons: the mathematical specifications below do not assert that their suppliers or proofs have been implemented. Every node remains unchecked. The existing independent review is preserved; a new independent review must assess this revision.

The catalogue contains 100 nodes (26 definitions, 25 constructions and 49 theorems), 306 API items, 207 specified tests and 30 planets. It preserves all ninety reviewed node identifiers and adds ten prerequisites or distinctly named helper constructions. There are 56 checked baseline declarations, 43 supplier requests and 22 gaps.

The [packet](../packets/AutomorphicFormsOnReductiveGroups.json) is the dependency graph; the [suggested file](../suggested/AutomorphicFormsOnReductiveGroups.lean) proposes native signatures. The per-node scope and omission records below are part of the specification. A named signature can express a generic construction without providing its arithmetic specialization or every assertion in a multi-part target. A name in a comment and a weaker helper are never counted as the original target.

## Conventions

Let F be a number field, F∞=F⊗ℚℝ, and G a connected reductive F-group. Write G(𝔸)=G(F∞)×G(𝔸_f), Γ=G(F), and [G]=Γ\G(𝔸). The derived complex Lie algebra is 𝔤=(Lie G(F∞))⊗ℝℂ. The fixed compact subgroup K∞ is supplied with its actual Lie inclusion and adjoint action; its component group is retained. Square integrability is on the specified split-central or central-character quotient, with its Haar measure, rather than on an unnormalized full centre.

Right translation means R(y)f(g)=f(gy), hence R(yz)=R(y)R(z). Differentiation uses this action: R(X)f(g) differentiates f(g exp(tX)) at t=0. With L_Xh(y) differentiating h(exp(tX)y), R(X)R(h)f=R(−L_Xh)f. On enveloping algebras the minus sign extends through the principal anti-automorphism. Convolution is f*h(g)=∫f(x)h(x⁻¹g)dx, with an actual Haar measure and the required left/right invariance. The finite Hecke algebra uses the same right-action convention and a fixed level-volume normalization.

An admissible height is continuous, at least one, submultiplicative and polynomially comparable with the supplied arithmetic height. Smoothing also uses inversion invariance and integrability of a sufficiently large inverse power against Haar measure. The native growth seminorms use max(1,height), so they are meaningful for a supplied nonnegative height before arithmetic comparison. The real matrix norm must be proper in the required direction: closed image in End(E), or an enlargement by inverse-dual/inverse-determinant data, is essential. Closed image only in GL(E) does not control approach to a singular matrix.

A compatible pair (𝔮,K) includes an injective map Lie(K)⊗ℝℂ→𝔮, a smooth compact adjoint action and the equality between its derivative and the inner Lie action. A compatible module has locally finite smooth compact action, an actual Lie representation, derivative equality and adjoint covariance. Relative cochains are horizontal K-equivariant alternating maps; their bracket term inserts [x_i,x_j] first and has sign (−1)^(i+j). Degree-zero cohomology consists of simultaneous Lie and compact invariants. The absolute characteristic-zero complex uses the same sign convention and is the sole full-complex export to ALS.4.

Harish-Chandra parameters label the centre character χ_λ; a highest-weight module of weight μ has parameter μ+ρ. The restricted dual differentiates with a minus sign; complex conjugation is a different operation. For GL₂ the weight-k two-ray model has Casimir k(k−2)/4, including zero at k=2 and 30 at k=12. This algebraic model is specified separately from the integrated GL₂/O₂ discrete or limit series and its central parameter.

GSp₄ uses two coordinate lattices. For the split algebraic torus the characters are all (a,b;c_T)∈ℤ³. Compact-Cartan coordinates (a,b;c_H) satisfy c_H≡a+b modulo 2, with c_H=a+b+2c_T. For the selected positive roots, ρ_T=(2,1;−3/2) and ρ_H=(2,1;0). Coherent coefficients transport to (−b,−a;a+b+2c_T), and the Harish-Chandra parameter is (a−1,b−2;a+b+2c_T). The Siegel-Levi longest element swaps a and b; the full type-C₂ longest element is (−a,−b;c_T+a+b). A compact wall belongs to a single closed compact-dominant chamber and does not define a two-chamber noncompact limit. These conventions are grounded in Calegari–Geraghty §§2.0.1–2.0.2, pp.6–9 and §5.3, pp.21–23 of the cited preprint.

The coherent Hodge stabilizer K^h contains the noncompact split centre A∞. For central-balanced coefficients, compare (𝔭_h,K^h) with (𝔭_h/𝔞∞,K^h/A∞) on the chosen component; the compact Pair cannot silently accept K^h. The general full-disconnected-group degree-vanishing assertion in Harris Theorem 3.4 is not adopted: Goldring–Koskivirta Theorem 10.1.2 and Remark 10.1.3 retain the contributing degree and record the GL₂ obstruction.

A field of rationality is a fixed field of the finite-part scalar-twist stabilizer. A model over that field is separate data. A torsion eigenclass records both a ring character and a nonzero class; the character is not uniquely recovered from a nonfaithful class. Reduction/semilinear transport requires nonzero image. A finite residue field gives a maximal kernel even if the eigenvalue map is not surjective. Integral H¹ torsion is not asserted by the Betti example; integral torsion and residual cohomology are distinguished.

Gross’s rational coefficient convention is f(γg)=γf(g), f(gu)=f(g). The level convention is f(γgu)=u⁻¹f(g); transport is f(g)↦g_p⁻¹f(g) when the coefficient action extends. At fixed central character ψ, use f(γgzu)=ψ(z)u⁻¹f(g), triviality of ψ on rational central elements and matching inverse coefficient action on Z_f∩J. Central-quotient finite class sets and effective stabilizers have their own AA requests; ordinary class-number finiteness under discrete rational centre does not cover positive-unit-rank tori.

For Maass forms the Laplacian is −y²(∂²_x+∂²_y), the measure is dx dy/y² on a fundamental domain, and T_m has the factor m^(−1/2). The Hecke Fourier normalization is 2√y∑_{n≠0}a(n)K_ir(2π|n|y)e(nx), a(1)=1; it does not impose L² norm one. The native Fourier carrier uses real r. The imaginary spectral branch remains a gap. The five DIT values 91.14134, 148.43213, 190.13154, 206.41679 and 260.68740 are a reported numerical dataset (the third even, the others odd), not exact eigenvalues or a proof of ordering, simplicity or a spectral lower bound. See DIT §5, pp.961–963, (5.6)–(5.11).

## Stage interfaces and coverage

| Stage | Objects and results | Nodes | Planets | Coverage |
|---|---|---:|---:|---|
| AF.0 | Test functions and growth | 8 | 3 | planned |
| AF.1a | Continuous cohomology, van Est and invariant forms | 10 | 3 | planned |
| AF.1 | Real reductive representation foundations | 22 | 6 | planned |
| AF.2 | Automorphic spaces and representations | 15 | 4 | planned |
| AF.3 | Constant terms and cusp forms | 12 | 4 | planned |
| AF.4 | Algebraic weights and rational structures | 25 | 6 | planned |
| AF.5 | Comparison examples and transport | 8 | 4 | planned |

AF.1a supplies compatible modules and cochains to AF.1. AF.0 uses the real Lie-group prefix of AF.1, and AF.1 imports heights from AA.3. Classification/globalization is a subsequent prefix within the same real-representation owner. AF.2 uses these analytic and algebraic outputs; AF.3 consumes rational parabolics and reduction theory from AA; AF.4 separates local weights from arithmetic rationality applications; AF.5 supplies dictionaries using the existing classical modular-form owner. The packet’s internal node graph is acyclic. The combined stage graph still needs the recorded prefix splits; no assertion of external stage-graph acyclicity is made.

## AF.0. Test functions and growth

The smooth carrier is a union over finite compact-open levels, with smooth archimedean slices. The test carrier imposes compact support. Fixed support/level derivative seminorms determine its LF topology, while the place-indexed tensor description imports SR.1 and AA.1. Schwartz pieces keep compact finite support and control both left and right enveloping derivatives against every positive height power. This two-sided condition is what permits the Haar smoothing argument for a general supplied submultiplicative height.

Uniform moderate growth uses one exponent for every derivative; the derivative constants can depend on the enveloping operator. At a fixed level and exponent, the seminorms determine the Fréchet target, with an LF passage through levels and exponents. The translation estimate changes the derivative by inverse adjoint action. Haar convolution differentiates the test factor with the anti-automorphism convention, so smoothing a moderate function preserves its exponent. Finite Hecke maps are actual level-preserving integrals and must match the finite double-coset sum with volume factors. Strictness, completeness, joint continuity and the exact arithmetic/parabolic adapters are named analytic/supplier refinements; the typed carrier alone does not prove them.

**Required refinements for closure.**

- Prove the strict LF, completeness and joint-continuity properties of the stated smooth/test/Schwartz and uniform-growth topologies; complete the local restricted-Hecke-tensor adapter and rational-parabolic constant-term map using AA and SR native exports.
- Discharge AA.3 polynomial Haar-integrability and genuine adelic-height comparison. Complete the convolution anti-involution/Fubini operator identities and finite-Hecke coset/level compatibility, beyond the typed integral and growth statements.

### Smooth functions on G(𝔸)

**Definition** `AF.0/smooth-adelic-function`. Proposed declaration: `TauCeti.Automorphic.SmoothAdelicFunction`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

Let G be a connected reductive group over a number field F, G(𝔸) = G(F_∞) × G(𝔸_f) with F_∞ = F ⊗_ℚ ℝ, and let G(F_∞) carry its real Lie group structure. A function f : G(𝔸) → ℂ is smooth if there is a compact open subgroup J ⊆ G(𝔸_f) with f(g j) = f(g) for all j ∈ J, and for every g_f ∈ G(𝔸_f) the function g_∞ ↦ f(g_∞ g_f) on G(F_∞) is C^∞. The smooth functions form a ℂ-algebra C^∞(G(𝔸)) = ⋃_J C^∞(G(𝔸))^J stable under right translation by G(𝔸); U(𝔤_∞,ℂ) acts on it by the derived right regular action R(X)f(g) = d/dt f(g exp(tX))\|_{t=0}.

**Hypotheses.** G connected reductive over a number field F; G(F_∞) is given the Lie group structure of AF.1/real-points-lie-group; G(𝔸_f) the restricted-product topology of AdelicAlgebraicGroups AA.1

**Construction or proof route.**

1. Write G(𝔸) = G(F_∞) × G(𝔸_f) using AdelicAlgebraicGroups:AA.1/adelic-points-split.
2. Smoothness at the finite places is right invariance under some compact open J; at infinity it is ContMDiff ∞ of each restriction g_∞ ↦ f(g_∞ g_f).
3. Closure under sums, products and right translation: J ∩ yJy⁻¹ is compact open and g_∞ ↦ f(g_∞ y_∞ g_f y_f) is a composite of a smooth map with a diffeomorphism.
4. The derived action is defined on each C^∞(G(𝔸))^J and is a Lie algebra action because left-invariant vector fields on G(F_∞) form the Lie algebra (Mathlib GroupLieAlgebra).

**Direct prerequisites.** `AdelicAlgebraicGroups:AA.1/adelic-points-split`, `AF.1/real-points-lie-group`, `mathlib:ContMDiff`, `mathlib:GroupLieAlgebra`

**Uses.** AF.0/uniform-moderate-growth-space: the carrier on which growth conditions are imposed. AF.2/automorphic-form: automorphic forms are smooth functions in this sense. AF.3/constant-term: constant terms of smooth functions are smooth.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.SmoothAdelicFunction` | data | The subalgebra of functions G(𝔸) → ℂ that are smooth. |
| `Automorphic.SmoothAdelicFunction.exists_level` | projection | Every smooth f is right invariant under some compact open J ⊆ G(𝔸_f). |
| `Automorphic.SmoothAdelicFunction.rightTranslate` | functoriality | R(y)f(g) = f(gy) is smooth for y ∈ G(𝔸), with R(yz) = R(y)R(z). |
| `Automorphic.SmoothAdelicFunction.derivAction` | structure | X ↦ R(X) is a Lie algebra action of 𝔤_∞ on C^∞(G(𝔸)) commuting with R(y_f) for y_f ∈ G(𝔸_f). |
| `Automorphic.SmoothAdelicFunction.derivAction_conj` | relation | R(y_∞) R(X) R(y_∞)⁻¹ = R(Ad(y_∞)X). |
| `Automorphic.SmoothAdelicFunction.iUnion_level` | characterisation | C^∞(G(𝔸)) is the directed union of the J-invariant subspaces over compact open J. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `smoothAdelicFunction_const` | degenerate | Constant functions are smooth with J = G(𝔸_f) ∩ any compact open; R(X)1 = 0. |
| `smoothAdelicFunction_gl1_example` | computation | For G = GL_1/ℚ the function x ↦ \|x_∞\|^s ∏_p 1_{ℤ_p^×}(x_p) is smooth with J = \hat ℤ^×. |
| `smoothAdelicFunction_not_of_continuous` | non-example | A continuous function on GL_1(𝔸_ℚ) that is not invariant under any open subgroup of \hat ℤ^× (for example x ↦ \|x_p − 1\|_p truncated) is not smooth: continuity at the finite places is weaker than local constancy. |
| `smoothAdelicFunction_archContinuous_not_smooth` | non-example | On the real GL₁ carrier the function \|log\|x\|\| is continuous and fails smoothness at \|x\|=1; this archimedean obstruction is separate from the finite-place continuity counterexample. |

**Acceptance.**

- For G = GL_1 over ℚ a function on 𝔸^× that is C^∞ in the archimedean variable and invariant under ker(\hat ℤ^× → (ℤ/Nℤ)^×) is smooth.
- A function on G(𝔸) which is C^∞ at infinity but not invariant under any compact open subgroup of G(𝔸_f) is not smooth (the characteristic function of a non-open closed subgroup of ℤ_p^× pulled back to GL_1(𝔸)).

**Native signature scope.** Native Lie-group/local-profinite product with smooth archimedean slices, compact-open finite level, actual mfderiv action and conjugation. Arithmetic specialization imports AA.1 and realPoints. The finite-place continuity counterexample uses the actual ℤ_p-unit norm around 1, independently of the separately named nonsmooth real-log helper.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.1, arXiv p. 17. Supplies the automorphic-form definition. The packet places the archimedean variable on the left using commutation of G(F_∞) and G(𝔸_f).

### Adelic test functions C_c^∞(G(𝔸))

**Construction** `AF.0/adelic-test-functions`. Proposed declaration: `TauCeti.Automorphic.TestFunction`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

Atlas planet: **Adelic test functions**.

C_c^∞(G(𝔸)) is the space of smooth compactly supported functions. Its algebraic carrier is C_c^∞(G(F_∞)) ⊗ C_c^∞(G(𝔸_f)); the finite factor is the directed union of finite-place tensor products with distinguished vectors 1_{G(O_v)} outside a finite set. Its LF topology is the inductive limit of C_C^∞(G(F_∞)) ⊗ C_c(G(𝔸_f)/J), with finite support on the discrete coset set and fixed compact C. The finite subgroup J acts only on the finite factor. Convolution f*h(g)=∫f(x)h(x⁻¹g)dx for the fixed Haar measure makes it an associative algebra.

**Hypotheses.** Haar measure dx on G(𝔸) fixed as a restricted product of local Haar measures (AdelicAlgebraicGroups AA.0); integral model of G over O_{F,S} fixed (AdelicAlgebraicGroups AA.1)

**Construction or proof route.**

1. Archimedean factor: smooth compactly supported functions on the Lie group G(F_∞) with the LF topology (union over compacts of the Fréchet spaces of C^∞ functions supported in the compact).
2. Finite factor: import the locally constant compactly supported carrier and its convolution from SmoothRepresentationsOfLocalGroups SR.1 at each finite place; the restricted tensor product over places is the directed limit (3.2.2) of Getz's notes using AdelicAlgebraicGroups:AA.1/restricted-product-comparison.
3. Identify the tensor product with functions on G(𝔸): a smooth compactly supported function is a finite sum of products f_∞ ⊗ f_f because its support is in G(F_∞) × C with C compact open-covered by finitely many J-cosets.
4. Convolution is well defined and associative by Fubini (AdelicAlgebraicGroups:AA.0/restricted-haar-split) and unimodularity (AdelicAlgebraicGroups:AA.1/unimodular-reductive).

**Direct prerequisites.** `AF.0/smooth-adelic-function`, `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.1/restricted-product-comparison`, `AdelicAlgebraicGroups:AA.0/restricted-haar-split`, `AdelicAlgebraicGroups:AA.1/unimodular-reductive`, `mathlib:HasCompactMulSupport`

**Uses.** AF.0/convolution-to-uniform-growth: right convolution R(f) by a test function smooths moderate-growth functions. AF.2/automorphic-forms-module: the Hecke algebra C_c^∞(G(𝔸_f)) acts on automorphic forms. AutomorphicSpectralTheory:AS.6: test functions of the trace formula. GL2AutomorphicRepresentationsAndTransfer:R16.1: specialised to GL₂ over number fields.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.TestFunction` | data | The space C_c^∞(G(𝔸)) with its LF topology. |
| `Automorphic.TestFunction.convolution` | structure | Haar convolution is associative and bilinear and continuous for the LF topology; the algebra is nonunital when dim G(F_∞)>0. A compact-open finite-level corner has its normalized idempotent unit. |
| `Automorphic.TestFunction.tmulEquiv` | equivalence | C_c^∞(G(F_∞)) ⊗_ℂ C_c^∞(G(𝔸_f)) ≃ C_c^∞(G(𝔸)), f_∞ ⊗ f_f ↦ (g ↦ f_∞(g_∞) f_f(g_f)). |
| `Automorphic.TestFunction.restrictedTensor` | characterisation | C_c^∞(G(𝔸_f)) is the directed union over S of C_c^∞(G(F_S)) ⊗ ⊗_{v∉S} 1_{G(O_v)}. |
| `Automorphic.TestFunction.unitIdempotent` | simp | e_J * e_J = e_J and e_J * f = f for f left J-invariant, with e_J = vol(J)⁻¹ 1_J. |
| `Automorphic.TestFunction.ofLocal` | compatibility | At a finite place the factor agrees with SR.1's locally constant compactly supported functions and their convolution. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `testFunction_idempotent` | computation | For J = ∏_p ℤ_p^× ⊆ GL_1(𝔸_{ℚ,f}) with vol(J) = 1, 1_J * 1_J = 1_J. |
| `testFunction_zero` | degenerate | The zero function is the only test function supported on the empty set; convolution with 0 is 0. |
| `testFunction_no_unit` | non-example | If dim G(F_∞)>0, no smooth compactly supported function is a convolution identity. Restrict to an archimedean shrinking-bump approximate identity: an identity kernel would represent the Dirac distribution, which is not a smooth density. Finite/discrete zero-dimensional groups can have a Haar-normalized Dirac-function identity. |
| `testFunction_local_compat` | compatibility | At a single finite place v, restricting to functions of the form f_v ⊗ ⊗_{w≠v}1_{G(O_w)} recovers SR.1's Hecke algebra of G(F_v) up to the factor ∏_{w≠v} vol(G(O_w)). |

**Acceptance.**

- For G = GL_1/ℚ, 1_{[1,2]}-smoothed bump at infinity times 1_{\hat ℤ^×} is a test function and its convolution square is computed by the product of the archimedean convolution and vol(\hat ℤ^×)·1_{\hat ℤ^×}.
- If the archimedean group has positive dimension, the smooth convolution algebra has no unit: its distributional unit is the Dirac mass. For a fixed compact open J and its Haar measure, e_J=vol(J)⁻¹1_J is the unit on J-biinvariant functions of the finite factor. A zero-dimensional trivial group is an exception to the first assertion.

**Native signature scope.** Native compact support, fixed-support/level and LF derivative-seminorm topology, Haar convolution and anti-involution. Local place-indexed restricted-tensor adapters are omitted by name.

**Signatures requiring supplier input.** `TauCeti.Automorphic.TestFunction.restrictedTensor`, `TauCeti.Automorphic.TestFunction.ofLocal`, `testFunction_local_compat`. The local restricted-product test-function carrier and the identification of compact support with a finite-place tensor require SR.1 local Hecke exports and AA.1 adelic topology. The generic Lie/local-profinite product carrier does not identify a place-indexed adelic tensor. Owner/input: SmoothRepresentationsOfLocalGroups:SR.1; AdelicAlgebraicGroups:AA.1.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §3.2, (3.2.1)-(3.2.2), p. 17. The finite factor C_c^∞(G(𝔸_f)) and its description as a direct limit over finite sets of places.
- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.2, arXiv p. 17. The test-function space as a dense subalgebra of the Schwartz algebra.

### The Schwartz algebra S(G(𝔸))

**Construction** `AF.0/adelic-schwartz-space`. Proposed declaration: `TauCeti.Automorphic.SchwartzFunction`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

For C ⊆ G(𝔸_f) compact and J ⊆ G(𝔸_f) compact open, S(G(𝔸), C, J) is the Fréchet space of smooth J-biinvariant functions supported in G(F_∞) × C with finite seminorms ‖f‖_{r,X,Y} = sup_g ‖g‖^r \|(R(X)L(Y)f)(g)\| for r ≥ 1, X, Y ∈ U(𝔤_∞,ℂ), where ‖·‖ is a height on G(𝔸). S(G(𝔸)) is the inductive limit over (C, J); it is an algebra under convolution containing C_c^∞(G(𝔸)) as a dense subalgebra.

**Hypotheses.** Height ‖·‖ on G(𝔸) from AdelicAlgebraicGroups:AA.3/adelic-height

**Construction or proof route.**

1. Define the seminorms and check that they are finite on test functions.
2. Completeness of each S(G(𝔸),C,J) follows from uniform convergence of all derivatives on G(F_∞) × C.
3. Convolution: ‖xy‖ ≤ ‖x‖‖y‖ and ‖x⁻¹‖ ≤ C‖x‖^{N₀} (AdelicAlgebraicGroups:AA.3/height-representation-comparison), together with polynomial volume growth of height balls in G(F_∞), give ∫ ‖x‖^{−N} dx < ∞ on each J-level for N large and bound the seminorms of f*h.
4. Density of C_c^∞ by multiplying with smooth cut-offs whose derivatives are bounded uniformly.

**Direct prerequisites.** `AF.0/adelic-test-functions`, `AdelicAlgebraicGroups:AA.3/adelic-height`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`

**Uses.** AF.1/casselman-wallach-globalization: V^∞ = π(S(G))V for the archimedean Schwartz algebra (Bernstein–Krötz §1). AF.1/dixmier-malliavin: the adelic form V^∞ = S(G(𝔸))·V for F- and SLF-representations of G(𝔸) (BPCZ (2.5.3.2)). AF.0/convolution-to-uniform-growth: S(G(𝔸)) acts by right convolution on functions of uniform moderate growth.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.SchwartzFunction` | data | The LF space S(G(𝔸)). |
| `Automorphic.SchwartzFunction.seminorm` | projection | The seminorms ‖f‖_{r,X,Y}; each is continuous. |
| `Automorphic.SchwartzFunction.convolution` | structure | S(G(𝔸)) is a topological algebra under convolution. |
| `Automorphic.SchwartzFunction.ofTestFunction` | coercion | The continuous inclusion C_c^∞(G(𝔸)) → S(G(𝔸)), with dense image. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `schwartzFunction_gaussian_gl1` | computation | For GL_1/ℚ, e^{-π(x_∞²+x_∞^{-2})}1_{\hat ℤ^×}(x_f) is Schwartz for the standard height and has unweighted supremum e^{-2π}, attained at x_∞=±1; it is not compactly supported. |
| `schwartzFunction_const_not` | non-example | The constant 1 on GL_1(𝔸_ℚ) is not Schwartz: ‖x‖^r·1 is unbounded. |
| `schwartzFunction_compact_group` | degenerate | If G(F_∞) is compact then S(G(𝔸)) = C_c^∞(G(𝔸)) as topological algebras. |

**Acceptance.**

- For G = GL_1/ℚ, x ↦ e^{-π(x_∞²+x_∞^{-2})}·1_{\hat ℤ^×}(x_f) lies in S(G(𝔸)) but not in C_c^∞(G(𝔸)).
- The constant function 1 is not in S(G(𝔸)) for any G with G(𝔸) noncompact.

**Native signature scope.** Native two-sided derivative growth seminorms and LF carrier on a Lie/local-profinite product. Completeness, density and joint continuity are signatures with analytic proofs outstanding; adelic height comes from AA.3.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.2, arXiv p. 17. Definition of the global Schwartz space and its topology.

### Moderate growth

**Definition** `AF.0/moderate-growth`. Proposed declaration: `TauCeti.Automorphic.HasModerateGrowth`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

Atlas planet: **Moderate growth**.

Let ‖·‖ be a height on G(𝔸) (AdelicAlgebraicGroups:AA.3/adelic-height). A function φ : G(𝔸) → ℂ has moderate growth if there are C, N > 0 with \|φ(g)\| ≤ C‖g‖^N for all g ∈ G(𝔸). On G(F_∞), φ is slowly increasing if \|φ(x)\| ≤ C‖x‖^r for a norm ‖g‖ = tr(σ(g)*σ(g))^{1/2} attached to a finite-dimensional representation σ with finite kernel, closed image in End(E), and a K_∞-invariant Hermitian norm. If the image is only closed in GL(E), enlarge σ by its inverse-dual representation or by the inverse determinant. The notion is independent of the height (respectively of the norm).

**Hypotheses.** Heights as in AdelicAlgebraicGroups AA.3, satisfying ‖xy‖ ≤ ‖x‖‖y‖ and ‖x⁻¹‖ ≤ C₀‖x‖^{N₀}

**Construction or proof route.**

1. Define the predicate with the fixed height and the archimedean norm.
2. Independence: two heights satisfy ‖g‖' ≤ C‖g‖^M (AdelicAlgebraicGroups:AA.3/height-representation-comparison), so moderate growth for one is moderate growth for the other with a changed exponent.
3. Moderate growth is preserved by sums, products and by left translation by G(F) and right translation by G(𝔸), by submultiplicativity of the height.

**Direct prerequisites.** `AdelicAlgebraicGroups:AA.3/adelic-height`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`, `AF.0/smooth-adelic-function`

**Uses.** AF.2/automorphic-form: condition (moderate growth) in the definition of an automorphic form. AF.3/cusp-form-rapid-decay: the bound improved to rapid decay for cusp forms. MetaplecticAutomorphicForms:MP.5: moderate growth of theta series. AutomorphicSpectralTheory:AS.1: Eisenstein series in the convergence region are of moderate growth.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.HasModerateGrowth` | data | The predicate ∃ C N, ∀ g, \|φ g\| ≤ C‖g‖^N. |
| `Automorphic.HasModerateGrowth.of_height` | characterisation | Independence of the height: moderate growth for ‖·‖ iff for ‖·‖'. |
| `Automorphic.HasModerateGrowth.add` | structure | Moderate-growth functions form a subalgebra of functions G(𝔸) → ℂ. |
| `Automorphic.HasModerateGrowth.comp_mul_right` | functoriality | If φ has moderate growth then so does g ↦ φ(gy), with the same exponent. |
| `Automorphic.HasModerateGrowth.of_bounded` | simp | Bounded functions have moderate growth with N = 0. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `hasModerateGrowth_const` | degenerate | A constant function has moderate growth with N = 0. |
| `hasModerateGrowth_abs_det` | computation | For the standard GL_1 adelic height H(x)=∏_v max(\|x_v\|_v,\|x_v\|_v⁻¹), the norm character \|x\|^s has bound H(x)^{\|Re(s)\|}. For another polynomially equivalent height, the exponent changes by the comparison power. |
| `hasModerateGrowth_exp_not` | non-example | g ↦ exp(\|g_∞\|) on GL_1(𝔸_ℚ) fails moderate growth. |
| `hasModerateGrowth_classical_compat` | compatibility | For φ_f attached to a holomorphic modular form f of weight k (AF.5/gl2-classical-to-adelic), φ_f has moderate growth iff f is holomorphic at the cusps (Mathlib ModularForm.bdd_at_cusps'). |

**Acceptance.**

- Every bounded function has moderate growth; \|det\|^s on GL_n(𝔸) has moderate growth for every s ∈ ℂ.
- g ↦ exp(‖g_∞‖) does not have moderate growth on GL_1(𝔸_ℚ).

**Native signature scope.** Native polynomial bound for a supplied normalized height and explicit comparison inequality. Real/adelic GL₁ tests use the corresponding coordinate models; construction of the arithmetic height remains AA-owned.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.2, Definitions 6.7-6.8, pp. 30-31. The archimedean predicate; the notes add that the definition is independent of the choice of norm.
- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13, (13.2)-(13.4), p. 70. The adelic height and its submultiplicativity.
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §1.2 and its remark, pp.189–190; §4.3(4), p.195. The closed-image-in-End condition controls escape toward a singular matrix. The inverse-dual enlargement gives a height controlling both g and g⁻¹; polynomial comparisons change growth exponents.

### Functions of uniform moderate growth T([G])

**Construction** `AF.0/uniform-moderate-growth-space`. Proposed declaration: `TauCeti.Automorphic.UniformModerateGrowth`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

Atlas planet: **Functions of uniform moderate growth**.

Let [G] = G(F)\G(𝔸). T_N([G]) is the space of smooth left G(F)-invariant φ with \|(R(X)φ)(g)\| ≪_X ‖g‖_{[G]}^N for every X ∈ U(𝔤_∞,ℂ), where ‖g‖_{[G]} = inf_{γ ∈ G(F)} ‖γg‖. For fixed J, T_N([G])^J is a Fréchet space with the seminorms sup ‖g‖^{-N}\|R(X)φ(g)\|; T_N([G]) is the strict LF limit over J and T([G]) = ⋃_N T_N([G]) a (non-strict) LF space. The same definitions apply to [G]_P = M_P(F)N_P(𝔸)\G(𝔸) for a parabolic P.

**Hypotheses.** Heights from AdelicAlgebraicGroups AA.3

**Construction or proof route.**

1. Define the seminorms and the Fréchet topology on each T_N([G])^J; completeness from uniform convergence of derivatives on compacta and the weight ‖g‖^{-N}.
2. Take the strict inductive limit over J and the union over N.
3. Show T_N ⊆ T_{N'} continuously for N ≤ N', and record that a function of uniform moderate growth has moderate growth (X = 1).

**Direct prerequisites.** `AF.0/smooth-adelic-function`, `AF.0/moderate-growth`, `AdelicAlgebraicGroups:AA.3/adelic-height`

**Uses.** AF.2/smooth-automorphic-forms: automorphic forms are the Z(𝔤)-finite vectors of T([G]) (BPCZ 2.7.1). AF.3/constant-term: constant terms map T([G]) to T([G]_P). AutomorphicSpectralTheory:AS.3: truncation transforms uniformly tempered functions into rapidly decreasing ones (Arthur §13). AutomorphicSpectralTheory:AS.5: functions of uniform moderate growth are the coefficients of the weighted comparison.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.UniformModerateGrowth` | data | The LF space T([G]) and its pieces T_N([G])^J. |
| `Automorphic.UniformModerateGrowth.seminorm` | projection | The continuous seminorms p_{N,X}(φ) = sup_g ‖g‖^{-N}\|R(X)φ(g)\|. |
| `Automorphic.UniformModerateGrowth.mono` | structure | T_N ⊆ T_{N'} continuously for N ≤ N'. |
| `Automorphic.UniformModerateGrowth.hasModerateGrowth` | compatibility | Every φ ∈ T([G]) has moderate growth. |
| `Automorphic.UniformModerateGrowth.ofParabolic` | functoriality | Constant terms give continuous maps T([G]) → T([G]_P) with a growth exponent allowed to change. Left G(F)-invariance by itself does not imply left N_P(𝔸)-invariance. |
| `Automorphic.UniformModerateGrowth.rightTranslate` | functoriality | For a normalized continuous submultiplicative height, N≥0 and y∈G(𝔸), right translation is a linear endomorphism of T_N([G]); its level changes from J to y_f^{-1}Jy_f. |
| `Automorphic.UniformModerateGrowth.rightTranslate_seminorm` | relation | p_{N,u}(R(y)f)≤height(y)^N p_{N,Ad(y_∞^{-1})u}(f). |
| `Automorphic.UniformModerateGrowth.derivative` | structure | Right differentiation by u∈U(𝔤_∞,ℂ) is a linear endomorphism of T_N([G]). |
| `Automorphic.UniformModerateGrowth.derivative_val` | simp | The underlying function of the derivative operator is the actual derived right-regular action R(u)f. |
| `Automorphic.UniformModerateGrowth.derivative_seminorm` | relation | p_{N,v}(R(u)f)=p_{N,vu}(f); multiplication order is v followed by u in the left U-module action. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `uniformModerateGrowth_const` | degenerate | 1 lies in T_0([G]); derivatives by elements of the augmentation ideal of U(𝔤) vanish. The element 1+X has positive filtered degree but sends 1 to 1, so filtered positive degree is insufficient. |
| `uniformModerateGrowth_gl1_character` | computation | For a Hecke character χ of GL_1/ℚ, χ ∈ T_N([GL_1]) for N ≥ \|Re(shift χ)\|, and R(X)χ = ds·χ for X the generator of Lie(ℝ_{>0}). |
| `uniformModerateGrowth_not_of_moderate` | non-example | On the positive GL₁ norm coordinate t, φ(t)=sin(exp(t²)) is bounded but its Euler derivative is not polynomially height-bounded. Equivalently, in x=log(t), use height exp(\|x\|), φ(x)=sin(exp(exp(2x))) and derivative 2exp(2x)exp(exp(2x))cos(exp(exp(2x))). The native example tests these logarithmic-coordinate bounds; AA identifies the adelic norm quotient. |
| `uniformModerateGrowth_arthur_compat` | compatibility | On G(ℚ)\G(𝔸)^1, membership in T([G]) is Arthur's 'uniformly tempered'. |

**Acceptance.**

- Constant functions lie in T_0([G]); rapid decay of a cusp form is tested on Siegel sets modulo A_∞ with fixed central character, rather than negative powers of the full adelic height along the centre.
- A function of moderate growth whose derivatives are unbounded polynomially (built from a rapidly oscillating bounded function at infinity) is not of uniform moderate growth.

**Native signature scope.** Native smooth left-Γ-invariant functions with all enveloping derivatives bounded by one exponent; max(1,height) makes the seminorm nonnegative. This is the full fixed-Γ carrier for a supplied height, not an assertion of Arthur’s actual parabolic export.

**Signatures requiring supplier input.** `TauCeti.Automorphic.UniformModerateGrowth.ofParabolic`, `uniformModerateGrowth_arthur_compat`. The actual M_P(F)N_P(𝔸) left quotient, its quotient height and Arthur’s rational-parabolic growth space require AA.2/AA.3 exports. An arbitrary subgroup Γ and height are not this parabolic quotient. Owner/input: AdelicAlgebraicGroups:AA.2; AdelicAlgebraicGroups:AA.3.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.7, arXiv p. 18. Definition and LF topology.
- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13, p. 70. The same condition under the name uniformly tempered, on G(ℚ)\G(𝔸)^1.

### Stability of growth spaces under translation and differentiation

**Theorem** `AF.0/growth-translation-differentiation`. Proposed declaration: `TauCeti.Automorphic.UniformModerateGrowth.rightTranslate_mem`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

For N ≥ 0, y ∈ G(𝔸) and X ∈ U(𝔤_∞,ℂ): (i) R(y) maps T_N([G]) to itself, with p_{N,Z}(R(y)φ) ≤ ‖y‖^N p_{N,Ad(y_∞)^{-1}Z}(φ); (ii) R(X) maps T_N([G]) continuously to itself; (iii) the map (y, φ) ↦ R(y)φ is continuous G(𝔸) × T_N([G])^J → T_N([G]) on each level, so T_N([G])^J is a smooth Fréchet representation of G(F_∞) of moderate growth; (iv) left translation by G(F) is trivial. The same holds for moderate-growth functions without derivatives.

**Hypotheses.** The archimedean factor is a finite-dimensional real Lie group; the finite factor is locally profinite.; The continuous height has height≥1 and is submultiplicative; N≥0. The genuine adelic height and its comparison bounds are supplied by AA.3.

**Construction or proof route.**

1. (i) ‖gy‖ ≤ ‖g‖‖y‖ gives the bound for X = 1; for general Z use R(y)R(Z) = R(Ad(y_∞)Z)R(y) and finite-dimensionality of U_{≤k}(𝔤) under Ad.
2. (ii) is immediate from the definition of the seminorms.
3. (iii) Continuity in y at the identity follows from the mean value theorem along one-parameter subgroups at infinity and J-invariance at the finite places; moderate growth of the representation is (i).
4. (iv) by left G(F)-invariance of elements of T([G]).

**Direct prerequisites.** `AF.0/uniform-moderate-growth-space`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`

**Acceptance.**

- For G = GL_1/ℚ and φ = \|·\|^s, R(y)φ = \|y\|^s φ exhibits the factor ‖y‖^N with N = \|Re s\| sharp.
- The statement fails for left translation by elements of G(𝔸) \ G(F): left translates are not G(F)-invariant.

**Native signature scope.** Native right translation and derivative maps with the stated seminorm bounds under normalized submultiplicative continuous height; joint continuity/completeness requires the LF analytic proof identified in coverage.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.8, arXiv p. 18. Right translation acts continuously; the levels T_N([G])^J are SF representations of G(F_∞) in the sense of Bernstein–Krötz.
- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13, (13.2), p. 70. The estimate behind (i).

### Convolution produces uniform moderate growth

**Theorem** `AF.0/convolution-to-uniform-growth`. Proposed declaration: `TauCeti.Automorphic.UniformModerateGrowth.convolution_mem`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

If φ is continuous of moderate growth with exponent N and f∈S(G(𝔸)), right convolution R(f)φ(g)=∫f(y)φ(gy)dy converges absolutely and has uniform moderate growth with the same exponent. For X∈𝔤, put L_X f(y)=d/dt f(exp(tX)y)\|₀; then R(X)R(f)φ=R(−L_X f)φ, by change of variables y↦exp(−tX)y. Extend to U(𝔤) using its principal anti-automorphism. R(f*h)=R(f)R(h).

**Hypotheses.** φ is continuous, left G(F)-invariant, with a bound C·height^N for N≥0; f belongs to the two-sided derivative Schwartz space.; The height is continuous, ≥1, submultiplicative and inversion invariant. A fixed left and right Haar measure satisfies integrability of height^{-r} for some r, supplied by AA.3.

**Construction or proof route.**

1. Absolute convergence: \|f(y)\| ≤ C_r‖y‖^{-r} and \|φ(gy)\| ≤ C‖g‖^N‖y‖^N; choose r with ∫ ‖y‖^{N-r}dy < ∞ on the support level.
2. For X∈𝔤, change variables z=exp(tX)y in the Haar integral. Differentiation gives −L_X f. Iterated derivatives use the principal anti-automorphism; domination follows from the Schwartz seminorms.
3. Bound all derivatives by the original growth exponent, using the polynomial volume estimate.
4. Apply Fubini with the proven absolute integrability to obtain R(f*h)=R(f)R(h).

**Direct prerequisites.** `AF.0/adelic-schwartz-space`, `AF.0/uniform-moderate-growth-space`, `AF.0/growth-translation-differentiation`, `AdelicAlgebraicGroups:AA.0/restricted-haar-split`

**Acceptance.**

- A bounded continuous but nonsmooth function of the positive idele norm (for example min(1,\|log t\|)) becomes smooth after test-function convolution.
- On GL_1, φ(x)=exp(x_∞^4+x_∞^{-4}) is not moderate, and convolution against the positive Schwartz function exp(−x_∞²−x_∞^{-2}) can diverge.

**Native signature scope.** Native actual Haar integral and all-left/right-derivative Schwartz smoothing under normalized submultiplicative inversion-invariant height and inverse-height integrability. The integral membership statement is present; the principal anti-automorphism/Fubini identities remain refinements.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.8, (2.5.8.6), arXiv p. 18. The stronger statement for distributions; for a moderate-growth function the representing function is R(f)φ.
- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.8, arXiv p. 18. The module structure.

### Hecke action of C_c^∞(G(𝔸_f)) on growth spaces

**Theorem** `AF.0/finite-hecke-action`. Proposed declaration: `TauCeti.Automorphic.heckeAction`. Module: `TauCeti/Automorphic/Growth`. Realises `AF.0`.

For a compact open J ⊆ G(𝔸_f), the Hecke algebra H(G(𝔸_f)//J) of J-biinvariant compactly supported functions acts on the J-invariants of the space of smooth left G(F)-invariant functions of moderate growth, and of T_N([G]), by R(f)φ(g) = ∫_{G(𝔸_f)} f(y)φ(gy)dy = Σ_{i} f(y_i) vol(J) φ(g y_i) for JyJ = ⊔ y_i J. This action commutes with R(X), X ∈ U(𝔤_∞), with R(g_∞) for g_∞ ∈ G(F_∞), preserves the exponent N, and satisfies R(f*h) = R(f)R(h); for J' ⊆ J it is compatible with the inclusion of J-invariants into J'-invariants via e_J.

**Hypotheses.** J compact open; Haar measure on G(𝔸_f) as fixed in AF.0/adelic-test-functions

**Construction or proof route.**

1. Write a J-biinvariant f as a finite combination of 1_{JyJ} and JyJ as a finite union of right cosets y_iJ (compactness of JyJ and openness of J).
2. The finite sum formula is the integral; G(F)-invariance and smoothness are preserved termwise.
3. Growth: ‖g y_i‖ ≤ ‖g‖‖y_i‖ with finitely many y_i keeps the exponent N.
4. Commutation with the archimedean action because the finite and archimedean factors of G(𝔸) commute; associativity from convolution.

**Direct prerequisites.** `AF.0/adelic-test-functions`, `AF.0/growth-translation-differentiation`, `SmoothRepresentationsOfLocalGroups:SR.1`

**Acceptance.**

- For GL_2/ℚ, J = GL_2(\hat ℤ) and f = 1_{J diag(p,1) J}, R(f) acts on the J-invariant functions as the sum over the p+1 right cosets, matching the classical Hecke operator T_p up to the normalisation of AF.5/gl2-hecke-normalisation.
- The action of 1_J is vol(J)·id on J-invariants.

**Native signature scope.** Native bi-J-invariant finite Haar integral on level uniform-growth functions, with explicit Lie, finite-dimensional, local compactness, Borel and height hypotheses. The global SR tensor/coset-level adapter remains a supplier input.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §3.4, p. 18. The convolution action of the global Hecke algebra; here restricted to the finite factor on smooth growth spaces.
- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §24, p. 158. Right convolution by the nonarchimedean Hecke algebra H(G(𝔸_fin), K₀).

## AF.1a. Continuous cohomology, van Est and invariant forms

The pair and module interfaces make derivative compatibility explicit before any cohomology is formed. Relative cochains are a subspace of ordinary alternating maps, with horizontal and full compact equivariance equations. This permits a native differential, square-zero identity, quotient interpretation, coefficient maps and the long exact sequence. The compact case and the abelian vector-group case discriminate between relative and absolute cochains. Disconnected compact groups require the actual finite component action, not a connected-only replacement.

Continuous cochains are homogeneous equivariant continuous functions. The comparison with Mathlib uses its iterated continuous-map model under local compactness; degree zero is checked by its kernel-to-invariants equivalence. Smooth cochains carry actual smooth orbit hypotheses. Smoothing comparison is typed for finite-dimensional coefficients, while the cited quasi-complete extension requires an exact topological export. Van Est additionally needs the embedded maximal compact, the quotient geometry and the differentiation map. The invariant-form target requires a smooth manifold de Rham complex, which normed-space forms do not supply. Relative Ext needs the Koszul/PBW resolution; the long exact sequence does not provide that resolution. The absolute characteristic-zero complex and its Kostant consumer contract belong to this single cochain owner.

**Required refinements for closure.**

- Complete manifold-valued smooth forms/exterior derivative/Poincaré lemma, and the finite-component maximal-compact input; type the native van Est map with coefficient and cup compatibility. Extend beyond the finite-dimensional prototype only under the verified quasi-complete hypotheses.
- Construct and check the relative Koszul/PBW resolution for Ext; complete pair restriction, disconnected compact action and cup-product contracts.
- Prove the central-balanced Hodge-pair quotient comparison. Extend the absolute characteristic-zero complex/Kostant result to compatible reductive Levi action and scalar descent for ALS.4; no integral or positive-characteristic theorem is claimed.

### Pairs (𝔮, K)

**Definition** `AF.1a/gk-pair`. Proposed declaration: `TauCeti.RelativeLieCohomology.Pair`. Module: `TauCeti/RepresentationTheory/LieCohomology/Relative`. Realises `AF.1a`.

A pair (𝔮, K) consists of a compact Lie group K (not necessarily connected), a finite-dimensional complex Lie algebra 𝔮, a continuous action Ad : K → Aut(𝔮) by Lie algebra automorphisms and a K-equivariant injective Lie algebra map ι : 𝔨_ℂ → 𝔮 from the complexified Lie algebra of K, such that the differential of Ad is ad ∘ ι. The main examples are (𝔤_ℂ, K) for a real Lie group G with compact subgroup K, and (𝔮, K) for a Hodge parabolic subalgebra 𝔮 ⊇ 𝔨_ℂ of 𝔤_ℂ (Harris's (𝔭, K∞) for the Hodge parabolic). A morphism (𝔮, K) → (𝔮', K') is a Lie algebra map and a continuous homomorphism intertwining Ad and ι. For the coherent Hodge pair with K^h containing A_∞, first take a central-balanced coefficient and use (𝔭_h/𝔞_∞,K^h/A_∞) on the chosen positive component. The compact-pair construction alone does not include the noncompact K^h; the required quotient comparison is an explicit gap.

**Hypotheses.** K a compact Lie group with Lie algebra 𝔨 (Mathlib GroupLieAlgebra); 𝔮 finite-dimensional over ℂ; A general θ-stable parabolic need not contain all of 𝔨. In the coherent application, 𝔭_h=𝔨^h_ℂ⊕𝔭⁻. K^h contains the split centre and is noncompact; after balancing coefficients and quotienting by A_∞, use the compact group K^h/A_∞ and its differentiated action.

**Construction or proof route.**

1. Bundle the data; the compatibility d(Ad)(Y) = [ι(Y), ·] is a hypothesis.
2. Build the pair (𝔤_ℂ, K) of a real Lie group G ⊇ K from the adjoint action (Tau Ceti Lie adjoint representation) and complexification.
3. Build the pair (𝔮, K) for a K-stable subalgebra 𝔮 ⊇ 𝔨_ℂ by restriction.

**Direct prerequisites.** `mathlib:GroupLieAlgebra`, `mathlib:LieSubalgebra`, `tauceti:lieMap`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`

**Uses.** AF.1a/relative-lie-cochain-complex: the complex Hom_K(∧^q(𝔮/𝔨_ℂ), V) is attached to a pair. AF.4/coherent-relative-cohomology: Harris's (𝔭_h, K∞)-cohomology is the relative cohomology of a parabolic pair. BorelRegulators:R.2: pairs (𝔤𝔩_n(ℂ), U(n)) and their block inclusions.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RelativeLieCohomology.Pair` | data | The structure (𝔮, K, Ad, ι) with the derivative compatibility. |
| `RelativeLieCohomology.Pair.ofLieGroup` | constructor | The pair (𝔤_ℂ, K) of a real Lie group G and compact subgroup K. |
| `RelativeLieCohomology.Pair.ofSubalgebra` | constructor | The pair (𝔮, K) of a K-stable subalgebra 𝔮 ⊇ ι(𝔨_ℂ). |
| `RelativeLieCohomology.Pair.Hom` | functoriality | Morphisms of pairs, with identity and composition. |
| `RelativeLieCohomology.Pair.identityComponent` | projection | The pair (𝔮, K°) and the morphism (𝔮, K°) → (𝔮, K). |
| `RelativeLieCohomology.Pair.compact` | constructor | For a compact Lie group K and its actual complexified tangent Lie algebra identification φ, the compact pair has inclusion φ and conjugation-derived adjoint action. |
| `RelativeLieCohomology.Pair.compact_iota` | simp | The compact pair inclusion sends X to φ(X); it is therefore surjective and its tangent quotient is zero. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `pair_compact` | degenerate | For G = K compact, the pair (𝔨_ℂ, K) has 𝔮/𝔨_ℂ = 0. |
| `pair_gl2_O2` | computation | (𝔤𝔩_2(ℂ), O(2)): dim 𝔮/𝔨_ℂ = 3 and the nontrivial component of O(2) acts on 𝔮/𝔨_ℂ with eigenvalues (1, 1, −1). |
| `pair_not_without_k` | non-example | (𝔭^-, K^h) for GSp_4(ℝ) is not a pair: 𝔭^- does not contain 𝔨_ℂ. |
| `pair_ofLieGroup_compat` | compatibility | Pair.ofLieGroup G K has Lie algebra map ι equal to the complexified Tau Ceti lieMap of the inclusion K → G. |

**Acceptance.**

- (𝔤𝔩_n(ℂ), O(n)) and (𝔤𝔩_n(ℂ), SO(n)) are pairs with a morphism given by the identity and the inclusion SO(n) ⊆ O(n).
- For GSp_4(ℝ), after central balancing the Hodge pair is (𝔭_h/𝔞_∞,K^h/A_∞), where 𝔭_h=𝔨^h_ℂ⊕𝔭⁻. The noncompact group K^h itself is not an input to the compact-pair carrier, and 𝔭⁻ alone does not contain the compact Lie algebra.

**Native signature scope.** Native finite-dimensional normed complex Lie algebra, actual compact Lie group Ad action, injective differentiated inclusion and derivative/covariance equations; Pair.compact uses a Lie algebra equivalence with complexLie(K). The noncompact Hodge stabilizer is explicitly excluded pending central quotient.

**Signatures requiring supplier input.** `TauCeti.RelativeLieCohomology.Pair.identityComponent`, `pair_gl2_O2`, `pair_not_without_k`. The identity-component embedded Lie subgroup and differentiated inclusion, and the GL₂/O₂ algebraic-to-real embedding, require native LieGroups/ALS.0 inputs. The example which deletes the compact compatibility condition needs a separate concrete incompatible action, not a Prop-valued pair. Owner/input: tauceti:TauCetiRoadmap/LieGroups; ArithmeticLocallySymmetricSpaces:ALS.0.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §3, p. 11. The pair (𝔤, K) with K possibly disconnected.
- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §2.2, arXiv v1 p. 8 (Duke p. 810). The pair (Lie Q⁻, K^h) for the θ-stable parabolic (K^h_ℂ rendered 'KC h' in the PDF text).

### (𝔮, K)-modules

**Definition** `AF.1a/gk-module`. Proposed declaration: `TauCeti.RelativeLieCohomology.GKModule`. Module: `TauCeti/RepresentationTheory/LieCohomology/Relative`. Realises `AF.1a`, `AF.1`.

Atlas planet: **(𝔤, K)-module**.

A (𝔮, K)-module is a complex vector space V with a Lie algebra representation of 𝔮 and a representation of K such that (1) V is a union of finite-dimensional K-stable subspaces on which K acts continuously; (2) for Y ∈ 𝔨 and v ∈ V, d/dt(exp(tY)v)\|_{t=0} = ι(Y)v; (3) k·(X·(k⁻¹·v)) = (Ad(k)X)·v for k ∈ K, X ∈ 𝔮. Morphisms are linear maps commuting with 𝔮 and K. They form an abelian category (𝔮, K)-Mod with kernels, cokernels, direct sums and tensor products with finite-dimensional (𝔮, K)-modules. For a real Lie group G with compact K ⊆ G this is the category of (𝔤, K)-modules.

**Hypotheses.** (𝔮, K) a pair (AF.1a/gk-pair); The locally finite K action is smooth on each finite-dimensional orbit span, and its differential agrees with the restricted Lie action on Lie(K)_ℂ; local finiteness alone supplies neither compatibility nor countable dimension.

**Construction or proof route.**

1. Encode the 𝔮-action as a Mathlib LieModule and the K-action as a Representation; state (1)-(3).
2. Kernels and cokernels: subquotients inherit (1)-(3) because finite-dimensional K-stable subspaces map to such.
3. Tensor product with a finite-dimensional (𝔮,K)-module F: the diagonal actions satisfy (1)-(3).
4. For the pair (𝔤_ℂ,K), this is the locally K-finite compatible-module convention. Getz Definition 5.14 additionally requires a countable algebraic direct sum. Complete reducibility identifies locally finite continuous K-modules with arbitrary direct sums of finite-dimensional irreducibles; it does not make that sum countable. Countability is an additional condition and follows for Harish-Chandra modules from finite generation over the finite-dimensional Lie algebra’s enveloping algebra.

**Direct prerequisites.** `AF.1a/gk-pair`, `mathlib:LieModule`, `mathlib:Representation`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-2-complete-reducibility`

**Uses.** AF.1/admissible-gk-module: admissibility, K-types and infinitesimal characters are properties of (𝔤, K)-modules. AF.1a/relative-lie-cochain-complex: coefficients of relative Lie algebra cohomology. AF.2/automorphic-forms-module: the space of automorphic forms is a (𝔤, K_∞) × G(𝔸_f)-module. AutomorphicLFunctionsAndLocalFactors:AL.2: local zeta integrals at the archimedean places use (𝔤,K)-modules of GL_n(ℝ), GL_n(ℂ). MetaplecticAutomorphicForms:MP.5: genuine (𝔤, K̃)-modules on the metaplectic cover.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RelativeLieCohomology.GKModule` | data | The category of (𝔮, K)-modules. |
| `RelativeLieCohomology.GKModule.abelian` | instance | (𝔮, K)-Mod is abelian, with exact forgetful functor to vector spaces. |
| `RelativeLieCohomology.GKModule.tensorFinite` | structure | Tensor product with a finite-dimensional (𝔮, K)-module F and its exactness. |
| `RelativeLieCohomology.GKModule.restrict` | functoriality | Restriction along a morphism of pairs, with id and comp laws. |
| `RelativeLieCohomology.GKModule.ofContRepresentation` | constructor | From a finite-dimensional continuous representation of a real Lie group G ⊇ K, by differentiation. |
| `RelativeLieCohomology.GKModule.deriv_eq` | compatibility | For Y ∈ 𝔨, the 𝔮-action of ι(Y) is the derivative of the K-action (condition (2)). |
| `RelativeLieCohomology.GKModule.toLieRingModule` | compatibility | The associated Mathlib Lie ring module has bracket [X,v]=ρ(X)v; the Lie homomorphism identity supplies Jacobi. |
| `RelativeLieCohomology.GKModule.toLieModule` | compatibility | The same action is a Mathlib complex Lie module, using linearity in both variables. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `gkModule_trivial` | degenerate | ℂ with zero 𝔮-action and trivial K-action is a (𝔮, K)-module (the trivial module). |
| `gkModule_sl2_weight` | computation | For (𝔰𝔩_2(ℂ), SO(2)), the module ⊕_{ℓ ≥ k, ℓ ≡ k (2)} ℂv_ℓ with H v_ℓ = ℓ v_ℓ (H the generator of 𝔨_ℂ) and raising/lowering as in Getz–Hahn §6.5 satisfies (2): exp(θ·iH)·v_ℓ = e^{iℓθ}v_ℓ. |
| `gkModule_not_locally_finite` | non-example | L²(SO(2)) with the regular action is not a (𝔰𝔬_2, SO(2))-module: it is not a union of finite-dimensional K-stable subspaces (only its K-finite vectors are). |
| `gkModule_fd_compat` | compatibility | For G connected and V a finite-dimensional continuous representation, ofContRepresentation V restricted to 𝔤 is the Tau Ceti lieMap of the representation. |

**Acceptance.**

- Every finite-dimensional continuous representation of a connected real Lie group G gives a (𝔤, K)-module by differentiation.
- The (𝔤𝔩_2, O(2))-modules π_k of Getz–Hahn §6.5 satisfy (1)-(3).

**Native signature scope.** Native Lie action, compact action, finite-dimensional orbit spans, smooth scalar orbit maps, derivative compatibility and covariance, with kernel/cokernel/tensor/dual morphism constructors. Integrated SL₂/O₂ test is omitted by name.

**Signatures requiring supplier input.** `gkModule_sl2_weight`. The integrated SL₂ discrete-series (𝔤,O₂)-module is needed for the original named weight test. The distinct GL2.WeightModel has genuine algebraic operators and an actual Circle derivative, but it does not identify that classified representation. Owner/input: AF.1/gl2-real-discrete-series; native classification gap.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.3, Definition 5.14, p. 26. Conditions (2)–(3) agree. The present general module category drops the source’s countability condition (1); local finiteness alone is strictly weaker. Harish-Chandra modules meet the countability condition.
- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, Remark 4.1, p. 21. K-finite vectors of a Banach representation form a (g,K)-module.

### Relative Lie algebra cochain complex C^•(𝔮, K; V)

**Construction** `AF.1a/relative-lie-cochain-complex`. Proposed declaration: `TauCeti.RelativeLieCohomology.cochains`. Module: `TauCeti/RepresentationTheory/LieCohomology/Relative`. Realises `AF.1a`, `AF.1`.

Atlas planet: **Relative Lie algebra cohomology**.

For a pair (𝔮, K) and a (𝔮, K)-module V, C^q(𝔮, K; V) = Hom_K(∧^q(𝔮/𝔨_ℂ), V), identified with the alternating maps ω : ∧^q 𝔮 → V with i_Y ω = 0 for Y ∈ 𝔨_ℂ and k·ω(Ad(k)⁻¹ ·) = ω for k ∈ K. The differential is the Chevalley–Eilenberg differential d ω(x_0,…,x_q) = Σ_i (−1)^i x_i·ω(…, x̂_i, …) + Σ_{i<j} (−1)^{i+j} ω([x_i, x_j], …, x̂_i, …, x̂_j, …), which preserves the relative cochains and satisfies d² = 0. H^q(𝔮, K; V) is its cohomology. When K is disconnected, C^•(𝔮, K; V) = C^•(𝔮, K°; V)^{K/K°}.

**Hypotheses.** (𝔮, K) a pair, V a (𝔮, K)-module

**Construction or proof route.**

1. Absolute Chevalley–Eilenberg complex Hom(∧^q 𝔮, V) with the displayed differential, d² = 0 by the Jacobi identity and the module axiom (Mathlib supplies only degrees ≤ 2; the general complex is built here).
2. The relative subcomplex: invariance and basicness (i_Y ω = 0, θ_Y ω = 0 for Y ∈ 𝔨_ℂ) are preserved by d (Cartan's formulas θ_Y = d i_Y + i_Y d).
3. K-invariance: the K-action on the absolute complex commutes with d; take K-invariants, which for connected K are the 𝔨-invariants by condition (2).
4. Identify Hom_K(∧^q(𝔮/𝔨_ℂ), V) with the basic K-invariant cochains.

**Direct prerequisites.** `AF.1a/gk-module`, `mathlib:ExteriorAlgebra`, `mathlib:LieModule`

**Uses.** AF.1a/van-est-isomorphism: van Est identifies continuous cohomology with H^•(𝔤, K; V). AF.4/cohomological-representation: cohomological representations have H^•(𝔤, K; π ⊗ V) ≠ 0. ArithmeticLocallySymmetricSpaces:ALS.5: comparison of Betti, de Rham and relative Lie algebra cohomology. AutomorphicSpectralTheory:AS.5: relative Lie algebra cohomology of spaces of automorphic forms. BorelRegulators:R.2: imported relative cochains for (𝔤𝔩_n(ℂ), U(n)).

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RelativeLieCohomology.cochains` | data | C^q(𝔮, K; V) as a submodule of the alternating q-forms 𝔮 [⋀^Fin q]→ₗ[ℂ] V, with the Chevalley–Eilenberg differential d; packaged as a CochainComplex (ModuleCat ℂ) ℕ in the implementation. |
| `RelativeLieCohomology.cochains_eq_hom` | characterisation | C^q(𝔮, K; V) ≃ Hom_K(∧^q(𝔮/𝔨_ℂ), V). |
| `RelativeLieCohomology.d_comp_d` | simp | d ∘ d = 0. |
| `RelativeLieCohomology.cohomology` | data | H^q(𝔮, K; V) as the homology of the complex. |
| `RelativeLieCohomology.H0_eq_invariants` | characterisation | H^0(𝔮, K; V) = V^{𝔮, K} = {v : 𝔮v = 0, Kv = v}. |
| `RelativeLieCohomology.disconnected` | relation | C^•(𝔮, K; V) = C^•(𝔮, K°; V)^{K/K°} and H^q(𝔮, K; V) = H^q(𝔮, K°; V)^{K/K°}. |
| `RelativeLieCohomology.d_lowDegree_compat` | compatibility | The ambient relative Chevalley–Eilenberg differential in degree one, after the alternating-to-Mathlib one/two-cochain identifications for the actual ρ-induced Lie module, equals Mathlib d₁₂. In degree zero the all-degree complex sends v to (X↦ρ(X)v); Mathlib at this pin does not name a d₀₁ map. Comparison in degree two uses Mathlib d₂₃ and the same bracket/sign convention. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `relativeCochains_compact` | degenerate | For 𝔮 = 𝔨_ℂ, H^q(𝔮, K; V) = 0 for q > 0 and H^0 = V^K. |
| `relativeCochains_vector_group` | computation | For abelian 𝔮, zero differentiated compact inclusion, trivial compact adjoint action and trivial coefficients, the relative differential is zero and H^q is the space of alternating q-linear maps; the ℝ^n trivial-compact specialization has dimension binom(n,q). |
| `relativeCochains_sl2_trivial` | computation | H^q(𝔰𝔩_2(ℂ), SO(2); ℂ) is ℂ for q = 0, 2 and 0 for q = 1. |
| `relativeCochains_O2_component` | non-example | H^2(𝔰𝔩_2(ℂ), O(2); ℂ) = 0 although H^2(𝔰𝔩_2(ℂ), SO(2); ℂ) = ℂ: the reflection acts by −1 on ∧²(𝔤/𝔨). A definition ignoring K/K° gets this wrong. |

**Acceptance.**

- For K compact and 𝔮 = 𝔨_ℂ: C^q = 0 for q > 0 and H^0 = V^K.
- For G = ℝ^n, K = 1 and trivial coefficients: C^q = ∧^q(ℝ^n)^* ⊗ ℂ with zero differential, so H^q = ∧^q(ℂ^n)^*.

**Native signature scope.** Native all-degree horizontal K-equivariant alternating maps with explicit CE differential, d², quotient/cohomology and degree-one Mathlib bridge. The vector-group example has zero bracket/inclusion and trivial action; it computes actual cohomology. Disconnected compact action and SL₂ examples require the native component export. The named d_lowDegree_compat states degree one; degree-zero action evaluation and the d₂₃ comparison are required refinements. No Mathlib d₀₁ declaration is asserted.

**Signatures requiring supplier input.** `TauCeti.RelativeLieCohomology.disconnected`, `relativeCochains_sl2_trivial`, `relativeCochains_O2_component`. The differentiated K° embedding and the finite component quotient action must come from the LieGroups owner. The SL₂/O₂ cohomology computations also require the actual reductive pair and component involution. A generic Pair does not select those arithmetic examples. Owner/input: tauceti:TauCetiRoadmap/LieGroups; ArithmeticLocallySymmetricSpaces:ALS.0.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §3, p. 11. The definition and following formulas specify the based/invariant Chevalley–Eilenberg subcomplex used by this node.
- Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §15.2.2, p. 108. The same construction for the parabolic pair (𝔭, K∞); see AF.4/coherent-relative-cohomology.

### Functoriality and long exact sequences of relative Lie algebra cohomology

**Theorem** `AF.1a/relative-cohomology-functoriality`. Proposed declaration: `TauCeti.RelativeLieCohomology.longExact`. Module: `TauCeti/RepresentationTheory/LieCohomology/Relative`. Realises `AF.1a`, `AF.1`.

(i) H^q(𝔮, K; −) is an additive functor on (𝔮, K)-modules and a short exact sequence 0 → V' → V → V'' → 0 of (𝔮, K)-modules gives a long exact sequence … → H^q(𝔮, K; V') → H^q(𝔮, K; V) → H^q(𝔮, K; V'') → H^{q+1}(𝔮, K; V') → …; (ii) a morphism of pairs (𝔮', K') → (𝔮, K) induces restriction maps C^•(𝔮, K; V) → C^•(𝔮', K'; V\|), functorial in both variables; (iii) cup product C^p(𝔮, K; V) ⊗ C^q(𝔮, K; W) → C^{p+q}(𝔮, K; V ⊗ W) induces a product compatible with (ii), graded commutative after the coefficient flip V⊗W≅W⊗V (for an algebra coefficient, require a commutative equivariant multiplication); (iv) H^•(𝔮, K; V) = Ext^•_{(𝔮,K)}(ℂ, V) in the category of (𝔮, K)-modules.

**Hypotheses.** (𝔮, K) a pair; modules as in AF.1a/gk-module

**Construction or proof route.**

1. (i) Hom_K(∧^q(𝔮/𝔨_ℂ), −) is exact on (𝔮, K)-modules because K-modules that are unions of finite-dimensional continuous representations are semisimple (complete reducibility, Tau Ceti CompactGroups Layer 2); apply the snake lemma.
2. (ii) pull back alternating forms along 𝔮'/𝔨'_ℂ → 𝔮/𝔨_ℂ; K'-invariance from equivariance.
3. (iii) The shuffle product of alternating forms commutes with d up to the Leibniz sign.
4. (iv) The standard relative Koszul resolution U(𝔮) ⊗_{U(𝔨_ℂ)} ∧^•(𝔮/𝔨_ℂ) is a projective resolution of ℂ in (𝔮, K)-Mod.

**Direct prerequisites.** `AF.1a/relative-lie-cochain-complex`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-2-complete-reducibility`

**Acceptance.**

- For the extension 0 → ℂ → V → ℂ → 0 of (ℝ, 1)-modules given by a nilpotent Jordan block, the connecting map H^0(ℂ) → H^1(ℂ) is an isomorphism.
- For the real Lie group GL_n(ℂ), take its real Lie algebra and then complexify: 𝔤_ℂ≅𝔤𝔩_n(ℂ)⊕𝔤𝔩_n(ℂ). Relative to U(n), trivial-coefficient cohomology is the exterior algebra on primitive generators in degrees 1,3,…,2n−1.

**Native signature scope.** The named longExact signature states the exact sequence with explicit injectivity, surjectivity and Function.Exact hypotheses. Coefficient maps are present. Pair restriction, shuffle cup product and the relative Ext/resolution comparison are distinct required refinements, not implied by longExact.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §3, (10), p. 11. Restriction maps induced by inclusions of pairs.
- Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet-Langlands correspondence](https://arxiv.org/abs/1806.10563), §7.1. Used with tensor products F^* ⊗ A_q(λ) and Künneth-type decompositions.

### Continuous and differentiable cochain complexes of a Lie group

**Construction** `AF.1a/differentiable-cochains`. Proposed declaration: `TauCeti.VanEst.smoothCochains`. Module: `TauCeti/RepresentationTheory/LieCohomology/VanEst`. Realises `AF.1a`.

Let G be a real Lie group with finitely many components and V a finite-dimensional continuous real or complex representation. C^q_c(G; V) = C(G^{q+1}, V)^G (homogeneous continuous cochains) and C^q_∞(G; V) = C^∞(G^{q+1}, V)^G (smooth cochains), with the homogeneous differential. The Mathlib continuous cochains TopRep.homogeneousCochains (iterated maps C(G, C(G, …, V))) are identified with C(G^{q+1}, V)^G for locally compact G. The inclusion C^•_∞ ⊆ C^•_c is a quasi-isomorphism (smoothing comparison).

**Hypotheses.** G a Lie group with finitely many components; V finite-dimensional with an actual continuous G action.; The wider quasi-complete locally convex coefficient comparison is not asserted until the exact Borel–Wallach hypotheses have been verified. The compact-open exponential-law identification is a topology bridge, not a definitional equality.

**Construction or proof route.**

1. Exponential law: for locally compact Hausdorff G, C(G, C(G^q, V)) ≅ C(G^{q+1}, V) (compact-open topology), giving the identification with Mathlib's model (the Mathlib TODO in ContCohomology/Basic).
2. Smooth cochains form a subcomplex since the homogeneous differential is a signed sum of face restrictions.
3. Smoothing: convolution with an approximate identity in C_c^∞(G) gives a chain homotopy inverse on the relatively injective resolutions C(G^{•+1}, V) and C^∞(G^{•+1}, V) (Hochschild–Mostow); both compute the relative derived functors of invariants, hence the comparison is a quasi-isomorphism.

**Direct prerequisites.** `mathlib:TopRep.homogeneousCochains`, `mathlib:continuousCohomology`, `mathlib:LieGroup`, `mathlib:ContMDiff`, `mathlib:ContinuousCohomology.d₀kerIso`

**Uses.** AF.1a/van-est-isomorphism: the smooth cochains are differentiated to relative Lie cochains. BorelRegulators:R.2: continuous cohomology of GL_n(ℂ) and its restriction to arithmetic groups. Polylogarithms:P.2: degree-three continuous and differentiable cochains for GL_2(ℂ).

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `VanEst.continuousCochains` | data | The complex C(G^{•+1}, V)^G. |
| `VanEst.smoothCochains` | data | The complex C^∞(G^{•+1}, V)^G. |
| `VanEst.continuousCochainsEquivMathlib` | equivalence | Isomorphism with Mathlib's TopRep.homogeneousCochains for locally compact G. |
| `VanEst.smoothing_quasiIso` | characterisation | The inclusion of smooth cochains is a quasi-isomorphism. |
| `VanEst.cochains_map` | functoriality | Naturality in continuous (smooth) homomorphisms G' → G and equivariant maps of coefficients. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `continuousCochains_compact` | degenerate | For G compact, H^q = 0 for q > 0. |
| `continuousCochains_R` | computation | H^1_c(ℝ; ℝ) = ℝ and H^q_c(ℝ; ℝ) = 0 for q ≥ 2. |
| `continuousCochains_discrete_not` | non-example | For G = ℤ (discrete) continuous cochains are all cochains and H^1(ℤ; ℝ) = ℝ but ℤ has infinitely many components: van Est does not apply to it. |
| `continuousCochains_mathlib_compat` | compatibility | In degree 0 the identification with Mathlib's continuousCohomology is the identity on invariants V^G. |

**Acceptance.**

- For G compact, both complexes are acyclic in positive degrees (averaging) and H^0 = V^G.
- For G = ℝ and V = ℝ trivial, H^1 is ℝ, spanned by the homomorphism t ↦ t, in both models.

**Native signature scope.** Native real/complex homogeneous continuous complexes, finite-dimensional smooth complex and smoothing inclusion with actual smooth orbit hypotheses. The Mathlib currying bridge is a locally compact group comparison, with degree-zero evaluation through d₀kerIso. Quasi-complete infinite-dimensional coefficients require an extension; no stronger theorem is claimed.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §3, Remark 3.1 and proof of Theorem 3.3, pp. 12-13. Comparison of the locally smooth, smooth and continuous cochain models.
- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), Introduction, p. 2. The continuous-cochain (van Est) cohomology for topological vector space coefficients.

### Invariant differential forms on G/K

**Construction** `AF.1a/invariant-forms-complex`. Proposed declaration: `TauCeti.VanEst.invariantForms`. Module: `TauCeti/RepresentationTheory/LieCohomology/VanEst`. Realises `AF.1a`.

For G a real Lie group with compact subgroup K and V a finite-dimensional smooth G-module, Ω^q(G/K; V)^G is the space of G-invariant V-valued smooth q-forms on the homogeneous manifold G/K with the exterior derivative. Evaluation at the base point eK identifies Ω^q(G/K; V)^G with Hom_K(∧^q(𝔤/𝔨), V), and under this identification the exterior derivative becomes the relative Chevalley–Eilenberg differential, including when K is disconnected (K/K° acts on both sides) and with the sign conventions of AF.1a/relative-lie-cochain-complex.

**Hypotheses.** G a real Lie group, K⊆G compact, V a finite-dimensional continuous representation with its induced smooth action.

**Construction or proof route.**

1. G/K is a smooth manifold (closed-subgroup theorem, Tau Ceti LieGroups Layer 2) with T_{eK}(G/K) = 𝔤/𝔨.
2. A G-invariant form is determined by its value at eK, which must be K-invariant under the isotropy representation; conversely every such value extends by translation.
3. Compute d of an invariant form with the Maurer–Cartan equation on G: it is the Chevalley–Eilenberg differential on basic K-invariant cochains.
4. This step needs smooth differential forms of all degrees with exterior derivative on manifolds, recorded as a gap.

**Direct prerequisites.** `AF.1a/relative-lie-cochain-complex`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `mathlib:GroupLieAlgebra`

**Uses.** AF.1a/van-est-isomorphism: the de Rham side of the van Est comparison. BorelRegulators:R.2: invariant forms on GL_n(ℂ)/U(n) represent the Borel classes. ArithmeticLocallySymmetricSpaces:ALS.5: invariant forms descend to forms on Γ\G/K; that comparison is ALS.5's.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `VanEst.invariantForms` | data | The complex Ω^•(G/K; V)^G. |
| `VanEst.invariantFormsEquivRelative` | equivalence | The isomorphism of complexes Ω^•(G/K; V)^G ≅ C^•(𝔤_ℂ, K; V ⊗ ℂ) (complex coefficients) by evaluation at eK. |
| `VanEst.invariantForms_d` | characterisation | Under the isomorphism, d corresponds to the relative Chevalley–Eilenberg differential. |
| `VanEst.invariantForms_componentAction` | relation | The action of K/K° on invariant forms for (G, K°) corresponds to its action on relative cochains. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `invariantForms_vector_group` | computation | For G = ℝ^n, K = 1, Ω^q(ℝ^n)^{ℝ^n} = ∧^q(ℝ^n)^* with zero differential. |
| `invariantForms_compact` | degenerate | For K = G compact, G/K is a point and the complex is V^G in degree 0. |
| `invariantForms_not_all_forms` | non-example | Ω^•(Γ\G/K) for a lattice Γ is not the invariant-form complex: for Γ = Γ(3) the de Rham cohomology of Γ(3)\𝔥 in degree 1 is nonzero while H^1(𝔰𝔩_2, SO(2); ℂ) = 0. |

**Acceptance.**

- For G = ℝ^n, K = 1 and trivial coefficients, invariant forms are the constant-coefficient forms and d = 0.
- For G = SL_2(ℝ), K = SO(2), the invariant 2-form on the upper half-plane is the hyperbolic area form y⁻²dx∧dy, and it is closed and not exact among invariant forms.

**Signatures requiring supplier input.** `TauCeti.VanEst.invariantForms`, `TauCeti.VanEst.invariantFormsEquivRelative`, `TauCeti.VanEst.invariantForms_d`, `TauCeti.VanEst.invariantForms_componentAction`, `invariantForms_vector_group`, `invariantForms_compact`, `invariantForms_not_all_forms`. The native manifold-valued smooth de Rham complex with exterior derivative, the quotient-manifold structure on G/K and evaluation at its base point are absent. Normed-space alternating maps and the relative algebraic complex do not supply this manifold complex. Owner/input: LieGroups, Part II / smooth differential forms gap.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §3, Lemma 3.2, p. 12. Cochains on G/K versus K-relative cochains on G; the evaluation at the identity coset.

### The van Est isomorphism

**Theorem** `AF.1a/van-est-isomorphism`. Proposed declaration: `TauCeti.VanEst.vanEstIso`. Module: `TauCeti/RepresentationTheory/LieCohomology/VanEst`. Realises `AF.1a`.

Atlas planet: **van Est isomorphism**.

For a finite-dimensional real Lie group G with finitely many components, a maximal compact subgroup K, and a finite-dimensional continuous real or complex G-module V, differentiation gives natural isomorphisms H_c^q(G;V)≅H^q(𝔤,K;V) in all degrees. They respect coefficient maps, morphisms of pairs and cup products with their coefficient flip. The invariant-form formulation is conditional on the smooth de Rham complex and Poincaré lemma recorded as a gap. The quasi-complete locally convex coefficient extension needs the exact smooth-cochain comparison hypotheses and is not asserted merely by reference to an unread book.

**Hypotheses.** G has finitely many components; K maximal compact, so G/K is diffeomorphic to a Euclidean space (Cartan–Iwasawa–Malcev); V finite-dimensional and continuous; the wider quasi-complete locally convex extension is a separate unresolved source/scope gap.

**Construction or proof route.**

1. The complexes C^∞(G^{•+1}, V) and C^∞((G/K)^{•+1}, V) are relatively injective resolutions of V; since K is compact, G-cohomology may be computed with the K-relative resolution (Wockel Proposition 2.8 for continuous cochains).
2. Use the double complex of G-invariant forms on (G/K)^{p+1}; G/K is diffeomorphic to ℝ^d, so the Poincaré lemma (contracting homotopy along geodesic rays of the Cartan decomposition) makes each row a resolution.
3. Taking G-invariants, the two edge maps identify H_c(G; V) with the cohomology of invariant forms Ω^•(G/K; V)^G, which is H^•(𝔤, K; V) by AF.1a/invariant-forms-complex.
4. The composite is Wockel's differentiation map D_n (Theorem 3.3); naturality and cup products follow from the explicit formula for D_n.

**Direct prerequisites.** `AF.1a/differentiable-cochains`, `AF.1a/invariant-forms-complex`, `AF.1a/relative-cohomology-functoriality`, `AF.1a/cartan-iwasawa-malcev`

**Acceptance.**

- Compact G: both sides vanish in positive degrees and equal V^G in degree 0.
- G = ℝ^n with trivial coefficients: H^q_c(ℝ^n; ℝ) ≅ ∧^q(ℝ^n)^*.
- G = GL_n(ℂ), K = U(n), V = ℝ: H^•_c(GL_n(ℂ); ℝ) ≅ H^•(𝔤𝔩_n(ℂ), 𝔲(n); ℝ) ≅ H^•(U(n); ℝ), an exterior algebra on generators in degrees 1, 3, …, 2n−1, whose degree 2m−1 generators carry the Borel regulator classes.
- Disconnected example: for G = GL_2(ℝ), K = O(2), H^2_c(GL_2(ℝ); ℝ) = 0 while H^2_c(GL_2(ℝ)°; ℝ) ≠ 0.

**Signatures requiring supplier input.** `TauCeti.VanEst.vanEstIso`. The native embedded maximal compact subgroup, quotient-manifold/contractibility data and identification of its Lie algebra with the relative Pair are required to define the differentiation/evaluation comparison. Smooth and continuous complexes alone do not give this comparison map. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.0; smooth differential forms gap.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §3, Theorem 3.3, p. 13. Theorem 3.3: D_n : H^n_{loc,s}((G,K);A) → H^n_Lie((g,K);a) is an isomorphism, under the standing hypotheses of §3 (finitely many components, K maximal compact, quasi-complete smooth coefficients).
- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §3, p. 11. Standing hypotheses of the theorem.

### G/K is a Euclidean space

**Theorem** `AF.1a/cartan-iwasawa-malcev`. Proposed declaration: `TauCeti.VanEst.quotient_maximalCompact_euclidean`. Module: `TauCeti/RepresentationTheory/LieCohomology/VanEst`. Realises `AF.1a`.

Let G be a real Lie group with finitely many components. Then G has maximal compact subgroups, any two are conjugate, every compact subgroup lies in one, and for K maximal compact the manifold G/K is diffeomorphic to ℝ^d. For G = G(ℝ) the real points of a connected reductive group over ℝ with Cartan involution θ and K = G^θ, the diffeomorphism is K × 𝔭 → G, (k, X) ↦ k exp X, so G/K ≅ 𝔭.

**Hypotheses.** G has finitely many connected components

**Construction or proof route.**

1. Reductive case: import the Cartan decomposition (Tau Ceti LieGroups Layer 9) and the existence of a Cartan involution for real reductive groups (ArithmeticLocallySymmetricSpaces ALS.0 constructs Cartan involutions and maximal compact subgroups for G(F_∞)).
2. General case (Cartan–Iwasawa–Malcev–Mostow): reduce to the connected component, split off the solvable radical, and use the reductive case on the Levi quotient; this is the classical structure theorem, for which this packet records the proof route only (source gap).
3. Conjugacy of maximal compacts: every compact subgroup fixes a point of the contractible nonpositively curved space G/K (Cartan fixed-point theorem) in the reductive case.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `ArithmeticLocallySymmetricSpaces:ALS.0`

**Acceptance.**

- GL_n(ℝ)/O(n) is the space of positive definite symmetric matrices, an open cone of dimension n(n+1)/2.
- For G = ℝ^× (two components) K = {±1} and G/K ≅ ℝ_{>0} ≅ ℝ.

**Signatures requiring supplier input.** `TauCeti.VanEst.quotient_maximalCompact_euclidean`. The native maximal compact Lie subgroup, quotient-manifold charts and Euclidean diffeomorphism require the LieGroups/ALS.0 export. For the stated non-reductive finite-component theorem, an original proof source is also unresolved. Owner/input: tauceti:TauCetiRoadmap/LieGroups; ArithmeticLocallySymmetricSpaces:ALS.0.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), §2, Proposition 2.8, p. 9. The hypotheses under which maximal compact subgroups are used for the relative comparison.

### van Est acceptance computations

**Theorem** `AF.1a/van-est-acceptance`. Proposed declaration: `TauCeti.VanEst.acceptance`. Module: `TauCeti/RepresentationTheory/LieCohomology/VanEst`. Realises `AF.1a`.

(i) For K compact, H^q_c(K; V) = 0 for q > 0 (averaging over Haar measure). (ii) For the vector group ℝ^n and trivial coefficients, H^q_c(ℝ^n; ℝ) = ∧^q(ℝ^n)^*. (iii) For GL_n(ℂ) with K = U(n), H^•_c(GL_n(ℂ); ℝ) ≅ H^•(𝔤𝔩_n(ℂ), 𝔲(n); ℝ) ≅ H^•(U(n); ℝ) (compact dual), so in the stable range the continuous cohomology is an exterior algebra on primitive classes in degrees 1, 3, 5, …. (iv) For GL_2(ℝ) with K = O(2), the component group O(2)/SO(2) acts on H^2(𝔤𝔩_2, SO(2); ℝ) = ℝ by −1, so H^2_c(GL_2(ℝ); ℝ) = 0 ≠ H^2_c(GL_2(ℝ)°; ℝ).

**Hypotheses.** Hypotheses of AF.1a/van-est-isomorphism

**Construction or proof route.**

1. (i) Haar averaging (Tau Ceti haarAverage) gives a contracting homotopy of the continuous cochains.
2. (ii) Relative cochains of (ℝ^n, 1) with trivial coefficients have zero differential.
3. (iii) The compact dual: 𝔤𝔩_n(ℂ) = 𝔲(n) ⊕ i𝔲(n) and H^•(𝔤, 𝔨; ℝ) = H^•(𝔲(n) ⊕ 𝔲(n), 𝔲(n)_diag; ℝ) ≅ H^•(U(n); ℝ) by Cartan's theorem on compact Lie algebra cohomology (invariant forms on the compact group).
4. (iv) compute the action of the reflection diag(1, −1) on ∧²(𝔤/𝔨).

**Direct prerequisites.** `AF.1a/van-est-isomorphism`, `tauceti:TauCeti.haarAverage`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-0-normalized-haar-measure-and-averaging`

**Acceptance.**

- Each of (i)-(iv) is a stated acceptance case of the layer.

**Signatures requiring supplier input.** `TauCeti.VanEst.acceptance`. The stated reductive and regulator acceptance comparisons need the actual van Est map, differentiated compact embedding and symmetric-space identification. Separate continuous cohomology calculations are present under their own names. Owner/input: AF.1a/van-est-isomorphism; BorelRegulators; ALS.0.

**Sources for this target.**

- Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1), Introduction, p. 2. The compact dual computes the relative Lie algebra cohomology of semisimple G (Section 5).

### Absolute Chevalley–Eilenberg complex

**Construction** `AF.1a/absolute-lie-cochain-complex`. Proposed declaration: `TauCeti.RelativeLieCohomology.AbsoluteLie.complex`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.1a`.

For a characteristic-zero field k, a k-Lie algebra 𝔲 and a Lie module V, set C^q(𝔲,V)=Alt_k(𝔲^q,V). The differential on c is the sum Σ_i(−1)^i x_i·c(x_0,…,x̂_i,…,x_q)+Σ_{i<j}(−1)^{i+j}c([x_i,x_j],x_0,…,x̂_i,…,x̂_j,…,x_q), with the bracket inserted first. It squares to zero. The complex is functorial in coefficient Lie-module maps; its cohomology is ker d/im d. This is the single absolute-complex export for ALS.4, compatible with the native degree-one and degree-two Mathlib cochains.

**Hypotheses.** k is a field of characteristic zero; 𝔲 and V carry compatible native LieAlgebra and LieModule structures. Finite-dimensionality is unnecessary for construction, and is added for Kostant.

**Construction or proof route.**

1. Use alternating multilinear maps as cochains. Each action and bracket term is multilinear; antisymmetry and the Jacobi identity make the sum alternating.
2. In d² the action-action terms combine to the commutator identity, action-bracket terms cancel, and three-bracket terms cancel by Jacobi. The pinned low-degree d₁₂ has exactly this bracket-first sign convention.
3. Coefficient morphisms commute with both terms, giving a native module-valued cochain complex and its homology functor.

**Direct prerequisites.** `mathlib:LieModule`, `mathlib:LieModule.Cohomology.oneCochain`, `mathlib:LieModule.Cohomology.twoCochain`, `mathlib:LieModule.Cohomology.d₁₂`

**Uses.** ArithmeticLocallySymmetricSpaces:ALS.4: Supplies the absolute nilpotent Lie-cohomology complex used in boundary calculations. AutomorphicFormsOnReductiveGroups:AF.4/kostant-parabolic-cohomology: Provides the cohomology carrier and Levi-equivariant differential.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RelativeLieCohomology.AbsoluteLie.cochains` | data | Alternating q-cochains, including C^0=V. |
| `RelativeLieCohomology.AbsoluteLie.differential` | constructor | The signed action-plus-bracket differential, with the bracket inserted first. |
| `RelativeLieCohomology.AbsoluteLie.d_comp_d` | relation | The composite of successive differentials is zero. |
| `RelativeLieCohomology.AbsoluteLie.complex` | structure | The cochain complex in modules over k. |
| `RelativeLieCohomology.AbsoluteLie.map` | functoriality | A coefficient Lie-module morphism gives a cochain map; identity and composition are preserved. |
| `RelativeLieCohomology.AbsoluteLie.lowDegree_compat` | compatibility | Degree-one and degree-two linear equivalences identify d with Mathlib d₁₂. |
| `RelativeLieCohomology.AbsoluteLie.cohomology` | data | The native module-valued homology object of the complex, functorial in coefficient maps. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `absoluteCochains_abelian` | computation | For an abelian Lie algebra and trivial coefficients every differential is zero. |
| `absoluteCochains_zero` | degenerate | For 𝔲=0, C^q=0 for q>0 and H^0=V. |
| `absoluteCochains_lowDegree` | compatibility | For a one-cochain f, df(x,y)=x·f(y)−y·f(x)−f([x,y]), matching Mathlib d₁₂. |

**Acceptance.**

- For an abelian Lie algebra and trivial coefficients every differential is zero.
- For 𝔲=0, C^q=0 for q>0 and H^0=V.
- For a one-cochain f, df(x,y)=x·f(y)−y·f(x)−f([x,y]), matching Mathlib d₁₂.

**Native signature scope.** Native all-degree characteristic-zero alternating CE complex with all signs, coefficient maps and degree-one/two Mathlib identifications. A compatible reductive Levi action, splitting-field descent and Kostant representation decomposition require further supplier exports.

**Sources for this target.**

- B. Kostant, [Lie algebra cohomology and the generalized Borel–Weil theorem](https://people.tamu.edu/~jml/kostant61.pdf), §3.1, pp.334–335. The alternating cochain differential and coefficient action agree after identifying cochains with exterior dual tensors.

## AF.1. Real reductive representation foundations

Real points are imported as a Lie group with comparison to the algebraic tangent/Lie functor. The reductive datum retains the maximal compact inclusion, Cartan involution, adjoint action, centre and finite components. Harish-Chandra modules are compatible modules that are admissible and enveloping-finitely-generated. The equivalence with central finiteness is a reductive finite-type theorem, not a property of an arbitrary Pair. Centre characters can be stated directly; their Cartan/Weyl parameterization imports highest-weight theory with the missing group-level central/isogeny integration.

A smooth Fréchet realization is modeled natively as a closed subspace of a countable product of complete Banach spaces, with joint continuity, smooth coordinate orbit maps and polynomial seminorm growth. Its K-finite vectors inherit the actual derivative action. A G-continuous norm records a Banach completion whose smooth K-finite subspace is exactly the supplied module. Normalized induction uses a supplied smooth realization and positive modular character before canonical globalization is claimed. Casselman embedding, discrete-series reduction and Bernstein–Krötz goodness are the route to Casselman–Wallach equivalence; the theorem is not used to define its own preliminary induction or matrix coefficients.

Temperedness and square integrability use actual quotient-Haar coefficients in a supplied continuous/unitary realization. Compact Cartan and absolute ranks govern discrete-series existence modulo the split centre. The real Weil group has j²=−1 and complex conjugation, so it is nonsplit. Its finite-dimensional representations feed the GL_n local correspondence, which remains the sole higher-rank archimedean classification supplier to AL.2. The GL₂ algebraic two-ray model fixes brackets, Casimir and circle rotation; integrated O₂ action, central parameter, irreducibility and identification with discrete/limit series are separate native outputs.

**Required refinements for closure.**

- Supply the native algebraic real-points, reductive datum, Cartan/Iwasawa and integrated parabolic/classification interfaces from their owners; the reader and per-node omission records specify every absent main/API/test name.
- Refine Casselman embedding, Harish-Chandra discrete series, Langlands classification, Dixmier–Malliavin and Vogan unitary-dual proof interiors. Knapp’s public GL_n construction is a checked statement source, not the full general proof.
- Complete Bernstein–Krötz polynomial K-type/Sobolev/goodness reductions and canonical globalization; compare the supplied quotient-Haar coefficient realizations with this globalization. Finish integrated GL₂/O₂ and principal-series tests beyond the algebraic weight model.

### The real Lie group G(ℝ) of a linear algebraic group

**Construction** `AF.1/real-points-lie-group`. Proposed declaration: `TauCeti.RealReductive.realPoints`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

Let G be a linear algebraic group over ℝ (for a number field F, apply this to Res_{F/ℚ}G, so G(F_∞) = ∏_{v\|∞} G(F_v)). Choosing a closed embedding ι : G → GL_n over ℝ, G(ℝ) is a closed subgroup of GL_n(ℝ) and hence an embedded real Lie group; the resulting Lie group structure does not depend on ι, its Lie algebra is Lie(G)(ℝ) = Lie(G) ⊗ ℝ with bracket from the algebraic Lie algebra, algebraic homomorphisms G → H induce smooth homomorphisms G(ℝ) → H(ℝ) with differential the algebraic differential, the adjoint action is the algebraic adjoint representation, orbit maps G(ℝ) → X(ℝ), g ↦ g·x, are smooth, and for a closed algebraic subgroup H the quotient G(ℝ)/H(ℝ) is a smooth manifold with tangent space 𝔤/𝔥 at the base point. G(ℝ) has finitely many connected components.

**Hypotheses.** G affine of finite type over ℝ (smooth, since char 0)

**Construction or proof route.**

1. G(ℝ) = ι⁻¹(GL_n(ℝ)) ∩ zero set of the defining polynomials is closed in GL_n(ℝ) (AdelicAlgebraicGroups AA.1 / ReductiveGroupsPartII topology on points).
2. Closed-subgroup theorem (Tau Ceti LieGroups Layer 2) makes G(ℝ) an embedded Lie subgroup with Lie algebra lieSubalgebraOfSubgroup.
3. Identify lieSubalgebraOfSubgroup with Lie(G)(ℝ) ⊆ 𝔤𝔩_n(ℝ): X ∈ Lie(G)(ℝ) iff exp(tX) satisfies the defining equations for all t (Tau Ceti ReductiveGroups Layer 2 differential criterion).
4. Independence of ι: two embeddings differ by an algebraic, hence smooth, isomorphism of closed subgroups; uniqueness of the smooth structure on a closed subgroup.
5. Finitely many components: Whitney's theorem on real algebraic sets (G(ℝ) is a real algebraic variety).

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `AdelicAlgebraicGroups:AA.1/adelic-points`, `mathlib:LieGroup`, `mathlib:Matrix.GeneralLinearGroup`, `tauceti:TauCeti.Lie.lieSubalgebraOfSubgroup`, `tauceti:lieMap`

**Uses.** ShimuraData:D0: real analytic group charts for G(ℝ), the Deligne torus and Hilbert groups. ShimuraData:D2: tangent spaces of orbits G(ℝ)·h and separation of the orbit. AF.0/smooth-adelic-function: smoothness at infinity is smoothness on this Lie group. AF.1/real-reductive-group: the ambient Lie group of a real reductive group.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.realPoints` | constructor | The Lie group structure on G(ℝ), with LieGroup instance. |
| `RealReductive.realPoints_lieAlgebra` | equivalence | Lie(G(ℝ)) ≃ Lie(G)(ℝ) as real Lie algebras. |
| `RealReductive.realPoints_map` | functoriality | An algebraic homomorphism f : G → H gives a smooth homomorphism f(ℝ) with lieMap f(ℝ) = df; map_id and map_comp. |
| `RealReductive.realPoints_Ad` | compatibility | The Lie-group adjoint action of G(ℝ) is the algebraic adjoint representation. |
| `RealReductive.realPoints_orbitMap` | other | Orbit maps of algebraic actions are smooth; G(ℝ)/H(ℝ) is a manifold with T_{eH} = 𝔤/𝔥. |
| `RealReductive.realPoints_finite_components` | structure | G(ℝ)/G(ℝ)° is finite. |
| `RealReductive.realPoints_GL_compat` | compatibility | For G = GL_n the structure agrees with Mathlib's Lie group structure on Matrix.GeneralLinearGroup. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `realPoints_gl1` | computation | For G = G_m, G(ℝ) = ℝ^× has two components and Lie algebra ℝ with exp = Real.exp onto the identity component. |
| `realPoints_trivial` | degenerate | For the trivial group, G(ℝ) is a point and its Lie algebra is 0. |
| `realPoints_SO2_not_dense` | non-example | The Lie algebra of SO(2) ⊆ GL_2(ℝ) is 1-dimensional; the subgroup of rational rotations is not closed and is not the real points of an algebraic subgroup, so the construction does not apply to it. |
| `realPoints_deligne_torus` | compatibility | For S = Res_{ℂ/ℝ}G_m, S(ℝ) ≅ ℂ^× as Lie groups and Lie(S)(ℝ) ≅ ℂ. |

**Acceptance.**

- GL_n(ℝ) as the units of M_n(ℝ) recovers Mathlib's Lie group structure on units of a normed algebra; Lie algebra 𝔤𝔩_n(ℝ).
- SL_2(ℝ): Lie algebra the trace-zero matrices; G(ℝ) connected. O(2): two components.
- The Deligne torus S = Res_{ℂ/ℝ}G_m has S(ℝ) = ℂ^× with Lie algebra ℂ (ShimuraData D0 consumer).

**Signatures requiring supplier input.** `TauCeti.RealReductive.realPoints`, `TauCeti.RealReductive.realPoints_lieAlgebra`, `TauCeti.RealReductive.realPoints_map`, `TauCeti.RealReductive.realPoints_Ad`, `TauCeti.RealReductive.realPoints_orbitMap`, `TauCeti.RealReductive.realPoints_finite_components`, `TauCeti.RealReductive.realPoints_GL_compat`, `realPoints_gl1`, `realPoints_trivial`, `realPoints_SO2_not_dense`, `realPoints_deligne_torus`. The pinned algebraic group/comodule object, its real-points manifold and differential comparison are supplier types; the Mathlib Lie-group prototype assumes a Lie group and does not reconstruct this algebraic-to-real functor. Owner/input: tauceti:TauCetiRoadmap/ReductiveGroups; tauceti:TauCetiRoadmap/LieGroups.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §3.3, p. 17. G(F_∞) as a real Lie group.
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.1, p. 22. The GL_n case of the Lie algebra and exponential.

### Real reductive groups with maximal compact subgroup

**Definition** `AF.1/real-reductive-group`. Proposed declaration: `TauCeti.RealReductive.Datum`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

A real reductive group in the sense used here is the datum (G, K, θ) where G = 𝐆(ℝ) for a connected reductive group 𝐆 over ℝ (or 𝐆(F_∞) for 𝐆 over a number field), θ is a Cartan involution of G and K = G^θ is the corresponding maximal compact subgroup; 𝔤 = 𝔨 ⊕ 𝔭 is the Cartan decomposition. K meets every component of G and K/K° ≅ G/G° is finite. The invariants rank G (absolute rank of 𝔤_ℂ), rank K, the split rank of the centre and dim G/K are attached to the datum. Cartan involutions and maximal compact subgroups are imported from ArithmeticLocallySymmetricSpaces ALS.0.

**Hypotheses.** 𝐆 connected reductive over ℝ

**Construction or proof route.**

1. Import a Cartan involution θ and K = G^θ from ALS.0 (Cartan involutions, maximal compact subgroups and symmetric space for G(F_∞)).
2. Cartan decomposition 𝔤 = 𝔨 ⊕ 𝔭 and G = K exp 𝔭 from Tau Ceti LieGroups Layer 9; hence K meets every component and K/K° ≅ G/G°.
3. Uniqueness of K up to G°-conjugacy (all maximal compacts conjugate) from ALS.0.

**Direct prerequisites.** `AF.1/real-points-lie-group`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `ShimuraData:D5/gsp4-centralizer`

**Uses.** AF.1/admissible-gk-module: (𝔤, K)-modules for this K. AF.2/automorphic-form: K_∞-finiteness of automorphic forms. AF.4/l0-q0-invariants: the invariants rank G − rank K and dim G/K. EndoscopicTransferAndUnitaryTraceComparison:ET.1: pseudocoefficients of discrete series of real groups.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.Datum` | data | The structure (G, K, θ) with θ a Cartan involution and K = G^θ. |
| `RealReductive.Datum.cartanDecomp` | projection | 𝔤 = 𝔨 ⊕ 𝔭 as ±1-eigenspaces of dθ. |
| `RealReductive.Datum.componentGroup` | structure | K/K° ≃ G/G°, a finite group. |
| `RealReductive.Datum.ofAlgebraic` | constructor | The datum attached to 𝐆(ℝ) via ALS.0. |
| `RealReductive.Datum.conj` | relation | Any two data for the same 𝐆 are conjugate by G°. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `datum_GLn` | computation | For GL_n(ℝ) with n≥1: K=O(n), dim 𝔭=n(n+1)/2 and K/K°≅ℤ/2. For n=0 the group and its component group are trivial. |
| `datum_compact` | degenerate | If 𝐆(ℝ) is compact (e.g. a definite unitary group) then K = G and 𝔭 = 0. |
| `datum_not_any_compact` | non-example | SO(2) ⊆ GL_2(ℝ) is compact but not maximal: it misses a component of GL_2(ℝ), so (GL_2(ℝ), SO(2)) is not a datum. |
| `datum_lie_compat` | compatibility | For 𝐆 = GL_n the Cartan decomposition is the polar decomposition of Tau Ceti LieGroups Layer 9. |

**Acceptance.**

- GL_n(ℝ) with θ(g) = (g^t)⁻¹, K = O(n), 𝔭 = symmetric matrices.
- For GSp_4(ℝ), full maximal compact K=GSp_4(ℝ)∩O(4) has negative-similitude components. Its positive-similitude subgroup is U(2); the Hodge stabilizer K^h=ℝ_{>0}U(2) is noncompact and has only positive similitudes.

**Signatures requiring supplier input.** `TauCeti.RealReductive.Datum`, `TauCeti.RealReductive.Datum.cartanDecomp`, `TauCeti.RealReductive.Datum.componentGroup`, `TauCeti.RealReductive.Datum.ofAlgebraic`, `TauCeti.RealReductive.Datum.conj`, `datum_GLn`, `datum_compact`, `datum_not_any_compact`, `datum_lie_compat`. An integrated native algebraic reductive datum with Cartan involution, maximal compact inclusion, finite component group and decompositions is needed. A general compact compatible Pair is not a reductive datum. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.0; ReductiveGroupsPartII.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §3.3, p. 17. The maximal compact subgroup K_∞ fixed throughout.
- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §1, p. 2. The datum (G, K) of the globalization theory.

### K-types and K-finite vectors

**Construction** `AF.1/k-finite-vectors`. Proposed declaration: `TauCeti.RealReductive.kFinite`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

Let K be a compact Lie group and V a representation of K that is a union of finite-dimensional continuous subrepresentations, or a continuous representation on a complete locally convex space. For an irreducible representation σ ∈ K̂, the σ-isotypic subspace V(σ) is the image of the projector E_σ = d(σ)∫_K conj(χ_σ(k)) π(k) dk; the K-finite vectors V_K = ⊕_σ V(σ) (algebraic direct sum) are those whose K-orbit spans a finite-dimensional space. For a smooth vector of a representation of G ⊇ K, K-finiteness can be detected by 𝔨: the span of 𝔨-iterates is finite-dimensional.

**Hypotheses.** K compact Lie group; V complete locally convex with continuous K-action

**Construction or proof route.**

1. Peter–Weyl and complete reducibility for compact groups (Tau Ceti CompactGroups Layers 2, 5, 6) give the projectors E_σ and E_σE_τ = δ_{στ}E_σ.
2. V_K = ⊕ V(σ) and V_K is dense when V is complete (approximate identity on K).
3. The 𝔨-criterion for smooth vectors (Getz–Hahn Proposition 5.12) using the exponential.

**Direct prerequisites.** `AF.1a/gk-module`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-2-complete-reducibility`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`, `tauceti:TauCeti.peterWeylBasis`, `mathlib:ContRepresentation`

**Uses.** AF.1/admissible-gk-module: admissibility is finiteness of the dimensions of V(σ). AF.2/automorphic-form: automorphic forms are K_∞-finite. AF.1/smooth-vectors: the K-finite vectors of a Banach representation form a (𝔤,K)-module.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.isotypic` | data | V(σ) for σ ∈ K̂ as the range of the projector E_σ. |
| `RealReductive.kFinite` | data | The submodule V_K of K-finite vectors. |
| `RealReductive.kFinite_eq_iSup_isotypic` | characterisation | V_K = ⊕_σ V(σ) as an internal direct sum. |
| `RealReductive.kFinite_dense` | other | V_K is dense in V when V is complete. |
| `RealReductive.kFinite_iff_lie` | characterisation | For smooth v, v ∈ V_K iff span{X·v : X ∈ U(𝔨)} is finite-dimensional. |
| `RealReductive.isotypic_map` | functoriality | K-equivariant maps send V(σ) to W(σ). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `kFinite_SO2_L2` | computation | For L²(SO(2)), V(e^{inθ}) is one-dimensional for each n ∈ ℤ. |
| `kFinite_trivial` | degenerate | For the trivial group K = 1, V_K = V. |
| `kFinite_not_all` | non-example | The function θ ↦ \|θ\| on SO(2) (a continuous non-trigonometric-polynomial function) lies in L²(SO(2)) but not in V_K. |
| `kFinite_peterWeyl_compat` | compatibility | For V = L²(K), V_K is the span of the Peter–Weyl matrix coefficients (Tau Ceti peterWeylBasis). |
| `kFinite_finiteDim` | degenerate | For every finite-dimensional compact-group module, the K-finite submodule is the entire carrier. |

**Acceptance.**

- For K = SO(2) and V = L²(SO(2)), V(σ_n) = ℂe^{inθ} and V_K is the space of trigonometric polynomials.
- For K = O(2) and V = L²(O(2)), the isotypic component of the 2-dimensional representation σ_n (n ≥ 1) has dimension (dim σ_n)² = 4 (Peter–Weyl).

**Native signature scope.** Native finite compact-orbit span, multiplicity/isotypic/projector signatures and actual probability-Haar Circle L² Fourier examples. Circle is the angular SO₂ model; the original pinned Peter–Weyl basis comparison is omitted separately.

**Signatures requiring supplier input.** `TauCeti.RealReductive.kFinite_iff_lie`, `kFinite_peterWeyl_compat`. The Lie-iteration comparison requires a native differentiated continuous/smooth realization and compact identity-component integration. The Peter–Weyl test must use the pinned CompactGroups L²/basis interface; the Circle L² examples are distinct expressible calculations. Owner/input: tauceti:TauCetiRoadmap/CompactGroups; tauceti:TauCetiRoadmap/LieGroups.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.2, Definition 5.10, p. 26. V_fin = ⊕_{σ ∈ K̂} V(σ).
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.2, Proposition 5.12, p. 26. The 𝔨-criterion for smooth vectors.

### Admissible (𝔤, K)-modules and Harish-Chandra modules

**Definition** `AF.1/admissible-gk-module`. Proposed declaration: `TauCeti.RealReductive.HCModule`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

Atlas planet: **Harish-Chandra module**.

Let (G, K) be a real reductive group. A (𝔤, K)-module V is admissible (weakly admissible) if dim Hom_K(σ, V) < ∞ for every σ ∈ K̂. It is Z(𝔤)-finite if an ideal of finite codimension in the centre Z(𝔤) of U(𝔤_ℂ) annihilates it. A Harish-Chandra module is a finitely generated admissible (𝔤, K)-module; equivalently a Z(𝔤)-finite admissible (𝔤, K)-module. Harish-Chandra modules form an abelian category HC closed under subquotients, finite direct sums, tensor products with finite-dimensional (𝔤, K)-modules and the duality V ↦ Ṽ (K-finite vectors of the algebraic dual), with Ṽ̃ = V.

**Hypotheses.** (G, K) a real reductive group (AF.1/real-reductive-group)

**Construction or proof route.**

1. Define the predicates using K-isotypic components (AF.1/k-finite-vectors) and the centre of U(𝔤_ℂ) (Mathlib Subalgebra.center of UniversalEnvelopingAlgebra).
2. Equivalence of the two descriptions: Bernstein–Krötz Theorem 4.3, using Harish-Chandra's theorem (AF.1/harish-chandra-admissibility) and Osborne's U(𝔤) = U(𝔫)F Z(𝔤)U(𝔨).
3. Closure properties and duality: Ṽ is weakly admissible and Z(𝔤)-finite, hence Harish-Chandra; Ṽ̃ = V since each V(σ) is finite-dimensional.

**Direct prerequisites.** `AF.1a/gk-module`, `AF.1/k-finite-vectors`, `AF.1/real-reductive-group`, `mathlib:UniversalEnvelopingAlgebra`, `mathlib:Subalgebra.center`

**Uses.** AF.1/casselman-wallach-globalization: the source category of the globalization functor. AF.2/harish-chandra-finiteness: spaces of automorphic forms with fixed K-types and ideal are admissible. AF.4/cohomological-representation: cohomology of admissible modules twisted by finite-dimensional V. AutomorphicLFunctionsAndLocalFactors:AL.3: finite-length admissible real (𝔤,K)-modules carry the archimedean Rankin–Selberg integrals. EndoscopicTransferAndUnitaryTraceComparison:ET.1: Harish-Chandra characters of admissible representations.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.IsAdmissible` | data | The predicate ∀ σ, finrank Hom_K(σ, V) < ∞. |
| `RealReductive.IsZFinite` | data | Annihilated by an ideal of finite codimension of Z(𝔤). |
| `RealReductive.HCModule` | data | The full subcategory of Harish-Chandra modules. |
| `RealReductive.HCModule.abelian` | instance | HC is abelian and closed under subquotients. |
| `RealReductive.HCModule.dual` | constructor | The dual Ṽ and the natural isomorphism Ṽ̃ ≅ V. |
| `RealReductive.HCModule.tensorFinite` | structure | V ⊗ F is Harish-Chandra for F finite-dimensional. |
| `RealReductive.HCModule.iff_zFinite` | characterisation | An admissible (𝔤,K)-module is finitely generated iff it is Z(𝔤)-finite. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `hcModule_trivial` | degenerate | The trivial (𝔤, K)-module ℂ is Harish-Chandra with infinitesimal character that of the trivial representation. |
| `hcModule_discrete_series_SL2` | computation | For SL_2(ℝ), the holomorphic discrete series D_k has K-types e^{ilθ}, l ≥ k, l ≡ k mod 2, each with multiplicity one. |
| `hcModule_tensor_not_fg` | non-example | D_k ⊗ D_l for SL_2(ℝ) is admissible but not finitely generated (Bernstein–Krötz Remark 4.1(b)). |
| `hcModule_finiteDim_compat` | compatibility | A finite-dimensional algebraic representation of 𝐆 restricted to (𝔤, K) is a Harish-Chandra module with infinitesimal character χ_{λ+ρ} (Tau Ceti vermaCentralCharacter). |
| `hcModule_finiteDim` | compatibility | A finite-dimensional compatible Pair module is the underlying module of HCModule.ofFiniteDimensional; no algebraic highest-weight parameter is asserted by this helper. |

**Acceptance.**

- Every finite-dimensional (𝔤, K)-module is a Harish-Chandra module.
- The tensor product of two holomorphic discrete series of SL_2(ℝ) is admissible but not finitely generated, hence not Harish-Chandra (Bernstein–Krötz Remark 4.1(b)).

**Native signature scope.** Native admissibility plus enveloping finite generation on a compatible Pair. This carrier is not the reductive Z-finite equivalence; those closure and classification outputs have explicit omissions. hcModule_finiteDim is a separate compatible-module helper; the original highest-weight χ_{λ+ρ} comparison is omitted.

**Signatures requiring supplier input.** `TauCeti.RealReductive.HCModule.dual`, `TauCeti.RealReductive.HCModule.tensorFinite`, `TauCeti.RealReductive.HCModule.iff_zFinite`, `hcModule_discrete_series_SL2`, `hcModule_tensor_not_fg`, `hcModule_finiteDim_compat`. Closure and the Z-finite equivalence use a genuine reductive datum and the finite-type theorem, not an arbitrary compatible Pair. The classified SL₂ discrete-series and infinite non-finitely-generated tensor counterexample need those native modules. Owner/input: AF.1/real-reductive-group; AF.1/harish-chandra-admissibility.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, p. 22. Definition via the equivalent conditions of Theorem 4.3.
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.3, p. 26. Admissibility as finite K-multiplicities.

### Infinitesimal characters and generalized infinitesimal-character subspaces

**Definition** `AF.1/infinitesimal-character`. Proposed declaration: `TauCeti.RealReductive.InfChar`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

Atlas planet: **Infinitesimal character**.

Let Z(𝔤) be the centre of U(𝔤_ℂ). An infinitesimal character is a ℂ-algebra homomorphism χ : Z(𝔤) → ℂ. Via the Harish-Chandra isomorphism γ : Z(𝔤) ≅ S(𝔥_ℂ)^W for a Cartan subalgebra 𝔥_ℂ ⊆ 𝔤_ℂ, infinitesimal characters correspond to W-orbits of λ ∈ 𝔥_ℂ^*: χ_λ(z) = γ(z)(λ), with χ_λ = χ_μ iff μ ∈ Wλ. A (𝔤,K)-module V has infinitesimal character χ if z·v = χ(z)v; its generalized χ-eigenspace is V_χ = {v : (z − χ(z))^n v = 0 ∀ z, some n}. Normalisation: the finite-dimensional irreducible representation of highest weight μ has infinitesimal character χ_{μ+ρ}.

**Hypotheses.** 𝔤_ℂ reductive; Cartan subalgebra 𝔥_ℂ and positive system fixed for the normalisation of γ

**Construction or proof route.**

1. Harish-Chandra isomorphism for reductive 𝔤_ℂ: import from Tau Ceti LieHighestWeight Layers 7 and 9 (centre of U(L), Harish-Chandra projection, dot-invariants), extended to the reductive case through 𝔤_ℂ = 𝔷 ⊕ [𝔤,𝔤].
2. χ_λ = χ_μ iff μ ∈ Wλ (Harish-Chandra), and the highest-weight normalisation from Tau Ceti vermaCentralCharacter: the centre acts on a highest weight vector of weight μ by χ_{μ+ρ}.
3. Generalized eigenspaces are (𝔤, K)-submodules because Z(𝔤) is central and K-invariant (K acts on Z(𝔤) through Ad, trivially on Z(𝔤) for connected G and through outer automorphisms otherwise; for disconnected K the eigenspaces are permuted by K/K°, so we take the Z(𝔤)^K-generalized eigenspaces).

**Direct prerequisites.** `AF.1/admissible-gk-module`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`, `tauceti:TauCeti.vermaCentralCharacter`, `mathlib:Subalgebra.center`, `mathlib:UniversalEnvelopingAlgebra`

**Uses.** AF.2/automorphic-form: Z(𝔤)-finiteness in the definition of automorphic forms. AF.4/infinitesimal-character-of-weight: cohomological representations have the infinitesimal character of V_λ^∨. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic π has the infinitesimal character of an algebraic representation; uniqueness of the weight. AF.1/harish-chandra-admissibility: finitely many irreducibles with a given infinitesimal character.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.InfChar` | data | Algebra homomorphisms Z(𝔤) →ₐ[ℂ] ℂ. |
| `RealReductive.infCharOf` | constructor | χ_λ for λ ∈ 𝔥_ℂ^*, through the Harish-Chandra isomorphism. |
| `RealReductive.infCharOf_eq_iff` | characterisation | χ_λ = χ_μ ↔ ∃ w ∈ W, μ = w λ. |
| `RealReductive.HasInfChar` | data | V has infinitesimal character χ. |
| `RealReductive.genEigenspace` | constructor | The generalized eigenspace V_χ as a sub-(𝔤, K°)-module. |
| `RealReductive.infChar_highestWeight` | compatibility | The irreducible finite-dimensional module of highest weight μ has infinitesimal character χ_{μ+ρ} (agrees with Tau Ceti vermaCentralCharacter μ). |
| `RealReductive.infChar_casimir` | simp | χ_λ(Ω) = ⟨λ, λ⟩ − ⟨ρ, ρ⟩ for the Casimir Ω of an invariant form. |
| `RealReductive.infCharOfHC` | constructor | For an irreducible Harish-Chandra module whose compact action commutes with the enveloping centre, Schur’s lemma constructs its scalar complex central character. This construction is distinct from the Cartan-parameter map infCharOf and requires no chosen residue-algebra isomorphism. |
| `RealReductive.infCharOfHC_spec` | characterisation | Every central element acts by the scalar supplied by the constructed irreducible-module character. |
| `RealReductive.infCharOfHC_eq_iff` | relation | For such an irreducible module A and a character χ, infCharOfHC(A)=χ exactly when A has infinitesimal character χ. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `infChar_trivial_gl2` | computation | The trivial representation of GL_2(ℝ) has infinitesimal character χ_ρ with ρ = (1/2, −1/2) and Casimir value 0. |
| `infChar_weyl_invariant` | characterisation | χ_{(a,b)} = χ_{(b,a)} for 𝔤𝔩_2. |
| `infChar_k_weight` | computation | The weight-k discrete series of GL_2(ℝ) has infinitesimal character χ_{((k−1)/2, −(k−1)/2)}, the same as Sym^{k−2} ⊗ det^{(2−k)/2}-normalised. |
| `infChar_not_linear_action` | non-example | χ_λ is invariant under the linear Weyl action on λ (after the ρ-shift built into γ), not under the dot action on the highest weight μ = λ − ρ: χ_{μ+ρ} = χ_{w(μ+ρ)} ≠ χ_{wμ+ρ} in general. |

**Acceptance.**

- For 𝔤 = 𝔤𝔩_2 with Casimir Δ = (1/4)(H² + 2XY + 2YX), the discrete series of weight k has Δ = k(k−2)/4, the value on the (k−1)-dimensional representation Sym^{k−2}.
- The trivial representation of GL_n(ℝ) has infinitesimal character ρ = ((n−1)/2, (n−3)/2, …, (1−n)/2).

**Native signature scope.** Native centre algebra homomorphism, scalar central action, generalized eigenspace and irreducible Schur construction with central K-equivariance. Normalized Cartan Harish-Chandra parameterization requires the reductive highest-weight export.

**Signatures requiring supplier input.** `TauCeti.RealReductive.infCharOf`, `TauCeti.RealReductive.infCharOf_eq_iff`, `TauCeti.RealReductive.infChar_highestWeight`, `TauCeti.RealReductive.infChar_casimir`, `infChar_trivial_gl2`, `infChar_weyl_invariant`, `infChar_k_weight`, `infChar_not_linear_action`. The Cartan/root/Weyl datum and normalized reductive Harish-Chandra isomorphism must extend the pinned semisimple highest-weight interface, including central weights. The generic centre character is native but does not parameterize Cartan Weyl orbits. Owner/input: tauceti:TauCetiRoadmap/LieHighestWeight; algebraic-group classification gap.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, p. 21. Irreducible (𝔤,K)-modules have an infinitesimal character.
- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, p. 21. Z(𝔤)-finiteness and its description by finitely many characters.
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.5, p. 34. The modules π_k with Δv_ℓ = k(k−2)/4 v_ℓ.

### Harish-Chandra's admissibility and finiteness theorem

**Theorem** `AF.1/harish-chandra-admissibility`. Proposed declaration: `TauCeti.RealReductive.admissible_of_irreducible`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

Atlas planet: **Harish-Chandra admissibility theorem**.

Let (G, K) be a real reductive group. (i) Every irreducible (𝔤, K)-module is admissible; (ii) for each infinitesimal character χ there are only finitely many irreducible (𝔤, K)-modules with infinitesimal character χ; (iii) a (𝔤, K)-module that is admissible and Z(𝔤)-finite is finitely generated and of finite length, with finite K-multiplicities bounded uniformly in terms of dim σ on irreducibles; (iv) for every irreducible unitary representation of G on a Hilbert space, the K-finite vectors form an irreducible Harish-Chandra module (unitary representations are admissible).

**Hypotheses.** (G, K) real reductive with K maximal compact

**Construction or proof route.**

1. Harish-Chandra Theorem 4.2 (Bernstein–Krötz p.21) supplies admissibility and finite infinitesimal-character fibres. Its distribution-character proof is an explicit source gap. Casselman embedding and finite principal-series multiplicities give the admissibility consequence only after the separate embedding theorem, and do not by themselves prove finiteness of the character fibre.
2. For an already admissible module, use Bernstein–Krötz Theorem 4.3: finite generation, central finiteness and finite generation over 𝔫 are equivalent. Verify the finite-length step from central-character finiteness and admissibility, rather than asserting an embedding without its hypothesis.
3. (iv): for unitary irreducible π, π(E_σ) projections and Harish-Chandra's bound dim Hom_K(σ, π) ≤ dim σ.
4. Record Bernstein–Krötz Theorem 4.3 as the characterisation used in AF.1/admissible-gk-module.

**Direct prerequisites.** `AF.1/admissible-gk-module`, `AF.1/infinitesimal-character`, `AF.1/principal-series`

**Acceptance.**

- For SL_2(ℝ) at the trivial infinitesimal character χ_ρ, there are four irreducible Harish-Chandra modules: ℂ, D_2^+, D_2^−, and the irreducible odd normalized principal series I(sgn,ν=1).
- The space of K-finite automorphic forms with fixed K-type and ideal J is finite-dimensional (AF.2/harish-chandra-finiteness) — the global consequence.
- With normalized induction f(a_tg)=t^{ν+1}f(g) and parity ε, the infinitesimal character of I(ε,ν) depends on ν². At ν=1, ε=1 is irreducible; ε=0 has constituents ℂ,D_2^+,D_2^−. Thus the trivial infinitesimal character has four irreducible classes, not three.

**Signatures requiring supplier input.** `TauCeti.RealReductive.admissible_of_irreducible`. The theorem needs the native real reductive datum and its irreducible integrated admissible action; generic Pair irreducibility does not imply admissibility. Owner/input: AF.1/real-reductive-group; reductive classification gap.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, Theorem 4.2, p. 21. Theorem 4.2 (i); (ii) is finiteness of the fibres of V ↦ χ_V.
- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, Theorem 4.3, p. 21. Finite generation ⇔ Z(𝔤)-finiteness ⇔ finite generation over 𝔫.
- Bill Casselman, [Representations of SL2(R)](https://personal.math.ubc.ca/~cass/research/pdf/Irr.pdf), §10, Proposition 10.8, p.27 (Casimir normalization in Proposition 10.7, p.26). Normalized exponent ν=s; odd parity at ν=1 is irreducible. See the review for the full infinitesimal-character example.

### Minimal principal series I^∞(W)

**Construction** `AF.1/principal-series`. Proposed declaration: `TauCeti.RealReductive.principalSeries`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

Fix an Iwasawa decomposition G = NAK and the minimal parabolic P_min = MAN with M = Z_K(A). For a finite-dimensional smooth representation W of P_min (in particular σ ⊗ e^{ν+ρ} ⊗ 1 with σ ∈ M̂, ν ∈ 𝔞_ℂ^*), I^∞(W) is the space of smooth f : G → W with f(pg) = p·f(g), with the Fréchet topology of compact convergence of all derivatives and G acting by right translation R(g)f(x) = f(xg). It is an admissible smooth Fréchet representation of moderate growth; its K-finite vectors I(W) form a Harish-Chandra module, and restriction to K gives I(W) ≅ Ind_{M∩K}^K(W\|) as K-modules (Frobenius reciprocity for K-types).

**Hypotheses.** (G, K) real reductive; Iwasawa decomposition from Tau Ceti LieGroups Layer 9; For SL_2, normalized I(ε,ν) uses f(diag(t,t⁻¹)g)=\|t\|^{ν+1}sgn(t)^ε f(g). Reducibility occurs exactly when ν∈ℤ and ν≡ε+1 mod 2; the contragredient pairing uses the dual inducing coefficient and opposite parameter.

**Construction or proof route.**

1. Iwasawa decomposition G = NAK (Tau Ceti LieGroups Layer 9) identifies I^∞(W) with smooth functions on K with M∩K-equivariance.
2. Fréchet topology and continuity of R; moderate growth from the Iwasawa projection estimates.
3. K-types: Frobenius reciprocity for the compact group K (Tau Ceti InductionRestriction for finite groups is the model; for compact K use Peter–Weyl).
4. Admissibility: each K-type σ occurs with multiplicity dim Hom_{M∩K}(σ, W) ≤ dim σ · dim W.

**Direct prerequisites.** `AF.1/real-reductive-group`, `AF.1/admissible-gk-module`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`

**Uses.** AF.1/casselman-embedding: target of the Casselman embedding. AF.1/casselman-wallach-globalization: the principal-series case of the globalization theorem (Bernstein–Krötz §§8, 12). AF.1/langlands-classification: Langlands quotients are quotients of induced representations. AutomorphicSpectralTheory:AS.1: archimedean components of induced representations in Eisenstein series.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.principalSeries` | constructor | I^∞(W) as an SF representation of G. |
| `RealReductive.principalSeries_kFinite` | projection | I(W) = K-finite vectors, a Harish-Chandra module. |
| `RealReductive.principalSeries_restrictK` | characterisation | I(W)\|_K ≅ Ind_{M∩K}^K(W\|_{M∩K})_K. |
| `RealReductive.principalSeries_map` | functoriality | P_min-maps W → W' induce G-maps I^∞(W) → I^∞(W'); exactness in W. |
| `RealReductive.principalSeries_dual` | relation | The dual of I(σ ⊗ e^{ν+ρ}) is I(σ^∨ ⊗ e^{−ν+ρ}) via ∫_K pairing. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `principalSeries_GL1` | degenerate | For G = ℝ^× (P_min = G), I^∞(χ) = ℂ with G acting by χ. |
| `principalSeries_SL2_ktypes` | computation | For SL_2(ℝ), σ = triv on M = {±1}, I(e^{ν+ρ}) has K-types {e^{2inθ}} each with multiplicity one. |
| `principalSeries_not_irreducible` | non-example | For SL_2(ℝ) and ν = ρ (W = e^{2ρ}) I(W) is reducible: it contains the trivial representation as a quotient and D_2^± as subrepresentations; irreducibility is not automatic. |
| `principalSeries_hc_compat` | compatibility | I(W) satisfies the Harish-Chandra module conditions of AF.1/admissible-gk-module. |

**Acceptance.**

- For SL_2(ℝ) and W = e^{s}: I(W) has K-types e^{i2nθ} (or odd) each with multiplicity one; it is reducible exactly at the integral points s ∈ ℤ + parity.
- For GL_1(ℝ) = ℝ^×, P_min = G and I^∞(χ) = χ is one-dimensional.

**Signatures requiring supplier input.** `TauCeti.RealReductive.principalSeries`, `TauCeti.RealReductive.principalSeries_kFinite`, `TauCeti.RealReductive.principalSeries_restrictK`, `TauCeti.RealReductive.principalSeries_map`, `TauCeti.RealReductive.principalSeries_dual`, `principalSeries_GL1`, `principalSeries_SL2_ktypes`, `principalSeries_not_irreducible`, `principalSeries_hc_compat`. The actual minimal real parabolic M A N, its root-normalized characters and integrated compact picture require native reductive/Cartan exports. The separately named normalizedInduction carrier has explicit covariance for a supplied subgroup and realization. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.0; ReductiveGroupsPartII.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, p. 22. Definition of I^∞(W) and its Fréchet topology.

### Casselman's subrepresentation theorem

**Theorem** `AF.1/casselman-embedding`. Proposed declaration: `TauCeti.RealReductive.casselman_embedding`. Module: `TauCeti/RepresentationTheory/RealReductive/Basic`. Realises `AF.1`.

Every Harish-Chandra module V ≠ 0 of a real reductive group (G, K) embeds into the K-finite vectors I(W) of a minimal principal series representation, with W a finite-dimensional P_min-module; for V irreducible one may take W = σ ⊗ e^{ν+ρ} irreducible. Nonzero finite-dimensional ordinary 𝔫-coinvariants alone do not establish an embedding of an arbitrary nonsimple module; the injective map for the full module is the Casselman subrepresentation theorem.

**Hypotheses.** V a Harish-Chandra module

**Construction or proof route.**

1. Use Bernstein–Krötz Theorem 4.4, p.23, which states an embedding of every Harish-Chandra module into I(W) for finite-dimensional W; its proof is referred to Wallach, Corollary 4.2.4, and remains a source gap.
2. Finite generation over 𝔫 makes ordinary coinvariants finite-dimensional, but does not establish nonvanishing or an injective evaluation map. The completed Jacquet-module/asymptotic argument and separation of vectors must be verified in a proof source. For an irreducible module a nonzero equivariant map is injective.

**Direct prerequisites.** `AF.1/principal-series`, `AF.1/admissible-gk-module`

**Acceptance.**

- For the trivial representation of SL_2(ℝ): ℂ ↪ I(e^{0}) as the constant functions (ν = −ρ), the generalised principal series containing the trivial representation as a subrepresentation.
- Each SL_2(ℝ) discrete series D_k^± embeds into I(sgn^k ⊗ e^{(k−1)α/2+ρ}).

**Signatures requiring supplier input.** `TauCeti.RealReductive.casselman_embedding`. The genuine minimal principal-series object, finite-length Harish-Chandra category and continuous/globalized embedding carrier require native reductive data and classification interfaces. No arbitrary target representation is substituted. Owner/input: AF.1/principal-series; AF.1/real-reductive-group.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §4, Theorem 4.4, p.23. The whole-module embedding is the cited theorem. The source refers its proof to Wallach; ordinary coinvariant finiteness is not substituted for the embedding.

### Smooth Fréchet representations of moderate growth

**Definition** `AF.1/sf-representation`. Proposed declaration: `TauCeti.RealReductive.SFRep`. Module: `TauCeti/RepresentationTheory/RealReductive/Globalization`. Realises `AF.1`.

A Fréchet representation (π, E) of a real reductive group G is a continuous representation on a Fréchet space. It is an F-representation of moderate growth if for each continuous seminorm p there are a continuous seminorm q and N with p(π(g)v) ≤ ‖g‖^N q(v); it is smooth (an SF-representation) if every vector is smooth, E = E^∞, and the Fréchet topology is the one defined by the seminorms v ↦ p(Xv), X ∈ U(𝔤). It is admissible (an SAF-representation) if its K-finite vectors form a Harish-Chandra module. SAF is the category with continuous G-maps; E ↦ E_K is a functor SAF → HC.

**Hypotheses.** Norm ‖g‖ on G from a faithful representation (AdelicAlgebraicGroups AA.3 heights at the archimedean place)

**Construction or proof route.**

1. Define moderate growth through the norm; independence of the norm by the comparison of heights.
2. Smooth vectors E^∞ of a Banach representation with its Sobolev seminorms (Getz–Hahn Definition 5.2, Lemma 5.3, Proposition 5.5 for density).
3. The functor E ↦ E_K: K-finite vectors of an SF-representation are smooth and stable under 𝔤 (Bernstein–Krötz Remark 4.1(a)).

**Direct prerequisites.** `AF.1/k-finite-vectors`, `AF.1/admissible-gk-module`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`, `mathlib:ContRepresentation`

**Uses.** AF.1/casselman-wallach-globalization: the target category of globalization. AF.0/growth-translation-differentiation: levels T_N([G])^J of the growth space are SF-representations of G(F_∞). AutomorphicLFunctionsAndLocalFactors:AL.2: Godement–Jacquet integrals on smooth Fréchet globalizations. MetaplecticAutomorphicForms:MP.0: smooth oscillator representation as an SF-representation of the metaplectic group.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.SFRep` | data | Smooth moderate-growth Fréchet representations with continuous G-maps. |
| `RealReductive.SFRep.kFinite` | functoriality | The functor E ↦ E_K to (𝔤, K)-modules. |
| `RealReductive.SFRep.smoothVectors` | constructor | The SF-representation E^∞ of smooth vectors of a Banach representation of moderate growth. |
| `RealReductive.SFRep.derivAction` | structure | The Lie algebra action on E, continuous for the Fréchet topology. |
| `RealReductive.SFRep.SAF` | data | The full subcategory of admissible SF-representations. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `sfRep_trivial` | degenerate | ℂ with trivial action is an SAF-representation. |
| `sfRep_principalSeries` | computation | I^∞(e^{ν}) for SL_2(ℝ) is SAF with K-finite vectors the trigonometric polynomials in the K-picture. |
| `sfRep_L2_not_smooth` | non-example | The Hilbert space of a unitary principal series of SL_2(ℝ) is a Banach representation of moderate growth but not an SF-representation: not every vector is smooth; its smooth vectors form the SF-representation. |
| `sfRep_kFinite_compat` | compatibility | For E ∈ SAF, E_K is a Harish-Chandra module (AF.1/admissible-gk-module). |
| `sfRep_smoothVectors_nonexample` | non-example | A vector with a nonsmooth orbit map does not belong to the defined smooth-vector submodule. This carrier criterion accompanies the separate concrete L² principal-series test. |

**Acceptance.**

- The principal series I^∞(W) is SAF.
- A Hilbert representation of G is not in general an SF-representation: its smooth vectors form one.

**Native signature scope.** Native jointly continuous smooth representation on a closed subspace of a countable product of complete complex Banach spaces, with polynomial growth and derivative seminorms. This models a Fréchet realization, without asserting canonical globalization or a concrete L² nonsmooth example.

**Signatures requiring supplier input.** `sfRep_principalSeries`, `sfRep_L2_not_smooth`. Principal-series and the concrete nonsmooth L² regular representation require integrated reductive/parabolic and Haar-Hilbert Lie action inputs. The membership criterion helper has a different name and is not counted as the L² counterexample. Owner/input: AF.1/principal-series; native Lie/Hilbert realization gap.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §1, p. 2. The category SAF and the functor E ↦ E^{K-fin}.
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.1, Definition 5.2, p. 22. Smooth vectors.

### G-continuous norms and the Sobolev order

**Definition** `AF.1/g-continuous-norms`. Proposed declaration: `TauCeti.RealReductive.GContinuousNorm`. Module: `TauCeti/RepresentationTheory/RealReductive/Globalization`. Realises `AF.1`.

A norm p on a Harish-Chandra module V is G-continuous if the completion V_p is a Banach representation of G whose K-finite vectors are V. For k ∈ ℕ_0 the k-th Sobolev norm p_k(v) = (Σ_{\|α\| ≤ k} p(X^α v)²)^{1/2} uses a basis of 𝔤. The Sobolev order p ≺ q holds if p ≤ C q_k for some C, k; p and q are Sobolev-equivalent if p ≺ q and q ≺ p. Every Harish-Chandra module admits a G-continuous norm, and for a G-continuous norm p the smooth vectors V_p^∞ form a nuclear Fréchet space because K-multiplicities are polynomially bounded; every G-continuous norm is Sobolev-equivalent to a K-invariant Hermitian norm.

**Hypotheses.** V a Harish-Chandra module of a real reductive group; A G-continuous norm realizes the exact Harish-Chandra module as the K-finite smooth vectors in its G-continuous completion; a dense K-equivariant map into an unrelated G representation does not suffice.

**Construction or proof route.**

1. Existence: Casselman's embedding V ↪ I(W) and the L²(K) norm on I(W).
2. Polynomial bound on K-multiplicities dim Hom_K(σ, V) ≤ C(1 + \|σ\|)^d (Bernstein–Krötz §5), hence nuclearity of V_p^∞.
3. K-invariant Hermitian representative of each Sobolev class (Bernstein–Krötz Theorem 5.5).

**Direct prerequisites.** `AF.1/sf-representation`, `AF.1/casselman-embedding`

**Uses.** AF.1/casselman-wallach-globalization: the globalization theorem is the statement that all G-continuous norms are Sobolev-equivalent. AutomorphicLFunctionsAndLocalFactors:AL.3: continuity estimates for archimedean Rankin–Selberg integrals in Sobolev norms.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.GContinuousNorm` | data | Norms p on V with V_p a Banach representation. |
| `RealReductive.sobolevNorm` | constructor | The k-th Sobolev norm p_k. |
| `RealReductive.SobolevLE` | relation | The preorder p ≺ q and the equivalence relation. |
| `RealReductive.exists_gContinuousNorm` | other | Every Harish-Chandra module has a G-continuous norm. |
| `RealReductive.smoothCompletion_nuclear` | structure | V_p^∞ is a nuclear Fréchet space. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `gContinuous_finiteDim` | degenerate | On a finite-dimensional module every norm is G-continuous and all are Sobolev-equivalent. |
| `gContinuous_principalSeries` | computation | On I(e^ν) for SL_2(ℝ), ‖f‖ = ‖f\|_K‖_{L²(K)} is G-continuous. |
| `gContinuous_not_arbitrary` | non-example | On the principal-series K-finite vectors for SL_2(ℝ), with basis e^{2inθ}, use the norm Σ_{n∈ℤ}(1+\|n\|)!\|a_n\|. A suitable noncompact translation is unbounded for this norm, so it is not G-continuous; factorial weights must be defined for negative indices too. |
| `gContinuous_norm_equivalence` | compatibility | Two genuine norms on a finite-dimensional complex space dominate one another by positive constants; this proves the comparison component, independently of integration to G. |

**Acceptance.**

- On I(W) the L²(K)-norm is G-continuous.
- The supremum norm on the K-finite vectors of I(W) and the L²(K) norm are Sobolev-equivalent.

**Native signature scope.** Native completion/realization data with exact smooth derivative-compatible K-finite subspace, dense embedding and Sobolev seminorm construction. The finite-dimensional norm helper is separately named; existence for every reductive HC module and nuclearity remain omitted.

**Signatures requiring supplier input.** `TauCeti.RealReductive.exists_gContinuousNorm`, `TauCeti.RealReductive.smoothCompletion_nuclear`, `gContinuous_finiteDim`, `gContinuous_principalSeries`, `gContinuous_not_arbitrary`. Existence of an integrated Banach realization for every HC module and nuclearity of its smooth completion need the native reductive datum, SF completion and canonical globalization functor. Finite-dimensional norm comparison is a distinctly named helper. Owner/input: AF.1/real-reductive-group; AF.1/casselman-wallach-globalization.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §1, p. 2. Definition and Sobolev order.
- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §1, p. 3. Nuclearity from polynomially bounded K-multiplicities.

### Casselman–Wallach globalization theorem

**Theorem** `AF.1/casselman-wallach-globalization`. Proposed declaration: `TauCeti.RealReductive.casselmanWallach`. Module: `TauCeti/RepresentationTheory/RealReductive/Globalization`. Realises `AF.1`.

Atlas planet: **Casselman–Wallach globalization**.

For a real reductive group G with maximal compact K: (i) any two G-continuous norms on a Harish-Chandra module V are Sobolev-equivalent; (ii) consequently V has a unique SAF-globalization V^∞ (the smooth vectors of V_p for any G-continuous p), and V^∞ = π(S(G))V; (iii) the functor SAF → HC, E ↦ E_K, is an equivalence of categories, with quasi-inverse V ↦ V^∞; (iv) every (𝔤, K)-morphism V → W extends uniquely to a continuous G-map V^∞ → W^∞ with closed range, and V ↦ V^∞ is exact; (v) V is irreducible iff V^∞ is algebraically simple as an S(G)-module.

**Hypotheses.** G linear real reductive, K maximal compact; V a Harish-Chandra module

**Construction or proof route.**

1. Bernstein–Krötz §7: V is 'good' iff its K-finite matrix coefficients satisfy lower bounds uniform in K-types (Theorem 7.1).
2. Minimal principal series are good: Dirac-type sequences and lower bounds for matrix coefficients (Theorem 12.3), with an explicit section S(G) → V^∞ depending holomorphically on the parameter (Theorems 8.1, 12.8).
3. Use the single real-owner Langlands and discrete-series reduction, then goodness under the required extensions, induction and finite-dimensional tensor operations (§9). Casselman embedding and its dual quotient are inputs, not by themselves a substitute for that reduction. The original classification proof interiors remain recorded gaps.
4. (iii)-(v) follow formally from uniqueness of globalizations and exactness (closed range by the open mapping theorem).

**Direct prerequisites.** `AF.1/g-continuous-norms`, `AF.1/principal-series`, `AF.1/casselman-embedding`, `AF.1/sf-representation`, `AF.0/adelic-schwartz-space`, `AF.1/langlands-classification`, `AF.1/discrete-series`

**Acceptance.**

- For SL_2(ℝ), the smooth vectors of the Hilbert space of the discrete series D_k equal the closure of D_k in I^∞(W) for its Casselman embedding.
- Exactness: the SL_2(ℝ) sequence 0 → D_2^+ ⊕ D_2^- → I(e^{2ρ}) → ℂ → 0 globalizes to an exact sequence of SAF-representations.

**Signatures requiring supplier input.** `TauCeti.RealReductive.casselmanWallach`. The native HC and SAF categories over a genuine real reductive datum, morphism topology and canonical quasi-inverse functors are needed to state the equivalence. The generic SFRep carrier and K-finite derivative do not assert this equivalence. Owner/input: AF.1/real-reductive-group; AF.1/casselman-embedding.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §1, Theorem 1.1, p. 3. The globalization theorem in the form proved.
- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §1, p. 2. Equivalence SAF ≃ HC and V^∞ = π(S(G))V.

### Dixmier–Malliavin factorization

**Theorem** `AF.1/dixmier-malliavin`. Proposed declaration: `TauCeti.RealReductive.dixmierMalliavin`. Module: `TauCeti/RepresentationTheory/RealReductive/Globalization`. Realises `AF.1`.

(i) Every smooth vector of a smooth Fréchet representation (π, E) of a real Lie group G is a finite sum Σ π(f_i)v_i with f_i ∈ C_c^∞(G), v_i ∈ E; in particular C_c^∞(G) = C_c^∞(G) * C_c^∞(G). (ii) Adelic form: for an SF- or SLF-representation E of G(𝔸) (strict inductive limit over compact open J ⊆ G(𝔸_f) of SF-representations of G(F_∞)), E^∞ = S(G(𝔸))·E and S(G(𝔸)) = S(G(𝔸)) * C_c^∞(G(𝔸)).

**Hypotheses.** G a real Lie group (for (ii), G(𝔸) for G reductive over a number field); The smooth-vector space is defined by C^∞ orbit maps for the actual jointly continuous moderate-growth action. The measure is the specified Haar measure. A one-term test-function reconstruction of a K-finite Z-finite function is the separate Harish-Chandra convolution lemma (AF.2), not a consequence of Dixmier–Malliavin alone.

**Construction or proof route.**

1. (i) Dixmier–Malliavin 1978: write the Dirac distribution at 1 as Σ f_i * D_i with D_i in a suitable finite-order distribution algebra, using a factorization of rapidly decreasing sequences; this packet records the statement with the original proof route (Bull. Sci. Math. 102, 1978), which was not read: see the gap.
2. (ii) apply (i) at each level J and to the finite part, where e_J acts as an identity on J-invariants.

**Direct prerequisites.** `AF.1/sf-representation`, `AF.0/adelic-schwartz-space`, `AF.0/adelic-test-functions`

**Acceptance.**

- For G = ℝ acting on S(ℝ) by translation, every Schwartz function is a finite sum of convolutions f * g with f ∈ C_c^∞(ℝ).
- For a K-finite vector in an SAF representation one can take a single term π(f)v (from AF.1/casselman-wallach-globalization (ii)).

**Signatures requiring supplier input.** `TauCeti.RealReductive.dixmierMalliavin`. The locally convex integration/action of C_c∞(G) on the full SF closed-Banach-product carrier, with its LF test topology, is needed. Banach Bochner integration does not give a native integral into a general Fréchet representation; the original analytic proof is also unread. Owner/input: AF.0/adelic-test-functions; AF.1/sf-representation; locally convex integral gap.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §2, Remark 2.19, p. 12. Statement (i).
- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.5.3, arXiv p. 17. Smooth vectors of G(𝔸)-representations for the adelic form (2.5.3.2).
- Dihua Jiang, Lei Zhang, [Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/abs/1508.03205v4), Appendix A, proof of Proposition A.1, arXiv p. 84. The lemma as used for local zeta integrals.

### Real reductive representation theory (proposed sub-layer AF.1b)

**Definition** `AF.1/real-reductive-representation-theory`. Proposed declaration: `TauCeti.RealReductive.IrrAdmissible`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

Parent node grouping the classification material of AF.1: tempered and (essentially) square-integrable representations, discrete series and their limits with Harish-Chandra parameters, the Langlands classification, the Weil groups W_ℝ and W_ℂ and Langlands' correspondence for GL_n(ℝ) and GL_n(ℂ), and Vogan's classification of the generic unitary dual of GL_n over ℝ and ℂ. It is proposed in `restructure` as the sub-layer AF.1b.

**Hypotheses.** (G, K) real reductive (AF.1/real-reductive-group)

**Construction or proof route.**

1. Group the nodes whose parent is this node; each is planned below with its own sources.

**Direct prerequisites.** `AF.1/admissible-gk-module`, `AF.1/infinitesimal-character`

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.2: archimedean standard L-factors are defined through Langlands' correspondence for GL_n(ℝ), GL_n(ℂ). AutomorphicLFunctionsAndLocalFactors:AL.3: archimedean Rankin–Selberg factors. GL2AutomorphicRepresentationsAndTransfer:R16.2: explicit GL₂(ℝ), GL₂(ℂ) cases. EndoscopicTransferAndUnitaryTraceComparison:ET.1: discrete series and their parameters for pseudocoefficients.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.IrrAdmissible` | data | The set of isomorphism classes of irreducible Harish-Chandra modules of (G, K). |
| `RealReductive.IrrAdmissible.infChar` | projection | The infinitesimal character map, with finite fibres (AF.1/harish-chandra-admissibility). |
| `RealReductive.IrrAdmissible.dual` | structure | Contragredient as an involution of IrrAdmissible. |
| `RealReductive.IrrAdmissible.twist` | functoriality | Twisting by characters of G/[G,G]: (π ⊗ χ). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `irr_compact` | degenerate | For G compact, IrrAdmissible = Ĝ, the finite-dimensional irreducibles. |
| `irr_GL1R` | computation | For G = ℝ^×, IrrAdmissible = {\|x\|^s sgn(x)^ε : s ∈ ℂ, ε ∈ {0,1}} (Tau Ceti GlobalNumberFields Layer 10 classification of characters of ℝ^×). |
| `irr_dual_not_conj` | non-example | For GL_n(ℝ), the contragredient of π is not its complex conjugate in general: \|x\|^s has dual \|x\|^{−s} and conjugate \|x\|^{s̄}. |

**Acceptance.**

- Every node of the sub-layer has this node as parent and AF.1 as the realised stage.

**Native signature scope.** Native isomorphism quotient of irreducible admissible compatible modules, restricted differentiated dual and explicit character dual counterexample. Class-level dual/twist and the GL₁/compact classification tests remain omitted.

**Signatures requiring supplier input.** `TauCeti.RealReductive.IrrAdmissible.dual`, `TauCeti.RealReductive.IrrAdmissible.twist`, `irr_compact`, `irr_GL1R`. The class-level restricted dual and central-character twist must preserve irreducibility/admissibility under the native reductive HC theorems. A minus differentiated dual and a one-dimensional character counterexample are present but do not certify these quotient-class constructions. Owner/input: AF.1/admissible-gk-module; AF.1/real-reductive-group.

**Sources for this target.**

- Robert P. Langlands, [On the notion of an automorphic representation](https://publications.ias.edu/sites/default/files/notion-ps.pdf), p. 1. The organising principle of the sub-layer.

### Tempered, square-integrable and essentially square-integrable representations

**Definition** `AF.1/tempered-square-integrable`. Proposed declaration: `TauCeti.RealReductive.IsTempered`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

A supplied irreducible admissible continuous representation π of a real reductive G (with split centre A_G) is square-integrable modulo the centre (discrete series) if it has a unitary central character and its K-finite matrix coefficients are in L²(G/A_G); essentially square-integrable if some twist by a character of G/[G,G] is; tempered if its K-finite matrix coefficients lie in L^{2+ε}(G/A_G) for all ε > 0; essentially tempered if a twist is tempered.

**Hypotheses.** (G, K) real reductive; Haar measure on G/A_G; For matrix coefficients on G/A_G, require a unitary central character (or first remove a specified real central norm twist and apply the criterion to the unitary representative). Absolute values then descend to the quotient.; Matrix coefficients are formed on the supplied smooth Fréchet moderate-growth realization, or the supplied unitary Hilbert realization used in the tempered/discrete-series classification. No existence of a globalization for an arbitrary Harish-Chandra module is presumed at this definition; comparison with its eventual canonical realization is a subsequent globalization consequence.; Here K-finite matrix coefficients mean g↦ℓ(π(g)v) with v K-finite and ℓ K-finite in the continuous contragredient; in the unitary Hilbert realization use two K-finite vectors. No assertion about arbitrary distribution vectors in the full continuous dual is implicit.

**Construction or proof route.**

1. Start with the supplied continuous representation and its continuous-dual matrix coefficients; the SF representation interface is independent of the Casselman–Wallach theorem. For the unitary classification use the given Hilbert realization and its smooth/K-finite vectors.
2. Define the integrability predicates on G/A_G with the unitary central-character convention.
3. The classification by unitary induction from discrete series and their nondegenerate limits, and the compatibility with the subsequent canonical SAF realization, are separate proof/comparison obligations in the named gap. The definition alone proves neither.

**Direct prerequisites.** `AF.1/real-reductive-representation-theory`, `AF.1/sf-representation`

**Uses.** AF.4/borel-wallach-tempered-range: the cohomology range applies to tempered cohomological representations. AF.1/archimedean-llc-gln: temperedness corresponds to bounded parameters. AF.4/mirkovic-tempered-coherent: tempered representations with nonzero coherent cohomology.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.IsSquareIntegrable` | data | Matrix coefficients in L²(G/A_G) with unitary central character. |
| `RealReductive.IsTempered` | data | Matrix coefficients in L^{2+ε}(G/A_G) for every ε > 0. |
| `RealReductive.IsEssentiallyTempered` | data | Some twist by a character of G/[G,G] is tempered. |
| `RealReductive.IsSquareIntegrable.isTempered` | relation | Square-integrable implies tempered. |
| `RealReductive.IsTempered.twist_unitary` | functoriality | Twisting by a unitary character preserves temperedness. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `tempered_SL2_ds` | computation | D_k (k ≥ 2) of SL_2(ℝ) is square-integrable. |
| `tempered_trivial_not` | non-example | The trivial representation of SL_2(ℝ) is not tempered: its matrix coefficient 1 is not in L^{2+ε}. |
| `tempered_compact` | degenerate | For G compact every irreducible representation is square-integrable. |
| `tempered_GL1` | compatibility | For G = ℝ^×, a character is tempered iff it is unitary (\|x\|^{it} sgn^ε), essentially tempered always. |
| `tempered_infinite_volume_trivial` | non-example | The trivial one-dimensional realization on a Haar quotient of infinite volume is not tempered, since its nonzero coefficient is constant. Identification with a noncompact semisimple quotient is a separate arithmetic/classification input. |

**Acceptance.**

- Discrete series of SL_2(ℝ) are square-integrable; unitary principal series are tempered but not square-integrable.
- The trivial representation of SL_2(ℝ) is not tempered.

**Native signature scope.** Native quotient-Haar MemLp predicates for K-finite continuous-dual coefficients on a supplied jointly continuous Banach realization and unitary central character. Canonical Hilbert realization and classified examples are not manufactured.

**Signatures requiring supplier input.** `tempered_SL2_ds`, `tempered_trivial_not`, `tempered_GL1`. The concrete classified discrete-series and GL₁/split-centre quotient realizations are required for these tests. The native predicate already uses actual quotient Haar integrability and K-finite continuous-dual coefficients; it does not construct canonical realizations. Owner/input: AF.1/discrete-series; matrix-coefficient realization gap.

**Sources for this target.**

- Tasho Kaletha, [Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), §5.1, arXiv p. 31. The three classes of irreducible admissible representations of real groups.
- Wee Teck Gan, Atsushi Ichino, [The Shimura-Waldspurger correspondence for Mp_2n](https://arxiv.org/abs/1705.10106v3), §1, arXiv p. 4. Square-integrability and temperedness as properties of local representations.

### Harish-Chandra's discrete series: existence criterion and parametrization

**Theorem** `AF.1/discrete-series`. Proposed declaration: `TauCeti.RealReductive.discreteSeries`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

Atlas planet: **Discrete series**.

Let (G, K) be real reductive with G connected modulo its centre for simplicity of statement (the component group acting on parameters in general). (i) G has square-integrable (modulo centre) representations iff rank(𝔤_ℂ) − dim A_G = rank(𝔨_ℂ), i.e. G/A_G has a compact Cartan, equivalently G has a Cartan compact modulo A_G. (ii) Then, for each λ ∈ i𝔱^* regular with λ − ρ_G integral (λ ∈ X^*(T) + ρ), there is a discrete series π(λ, C) attached to the Weyl chamber C containing λ, with infinitesimal character χ_λ; π(λ, C) ≅ π(λ', C') iff (λ', C') = w(λ, C) for w ∈ W_K = N_K(T)/T, the Weyl group of K; the lowest K-type has highest weight λ + ρ_n − ρ_c (Blattner). (iii) For λ singular but C-dominant (non-degenerate: no simple compact root of C is orthogonal to λ), π(λ, C) is a non-degenerate limit of discrete series, tempered and nonzero. Example: the split classical groups over ℤ with discrete series are SO_{2n+1}, Sp_{2n} and SO_{4n} (and SO_{2n} with n odd has none).

**Hypotheses.** (G, K) real reductive; T ⊆ K a maximal torus of K which is a Cartan subgroup of G (case (ii)-(iii)); Fix the unitary character on A_G and include it in the parameter. The compact Cartan and λ,ρ in the displayed root formula are for the group modulo A_G; extend by the chosen central character. Square-integrability and limits here use that unitary central normalization.

**Construction or proof route.**

1. (i) Harish-Chandra's criterion; necessity via the character theory of discrete series, sufficiency via the construction in (ii); the Chenevier–Taïbi example is the computation of rank G(ℝ) vs rank K for split classical groups.
2. (ii) Parametrization by Harish-Chandra parameters; Blattner's formula for the lowest K-type; uniqueness modulo W_K.
3. (iii) Limits via Zuckerman's translation functors from the discrete series; non-degeneracy criterion of Knapp–Zuckerman.
4. The proofs are Harish-Chandra's (Acta Math. 1965-66) and Knapp–Zuckerman; this packet records the statements with their sources as cited by the papers below.

**Direct prerequisites.** `AF.1/tempered-square-integrable`, `AF.1/infinitesimal-character`, `AF.1/real-reductive-group`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`

**Acceptance.**

- SL_2(ℝ): λ = (k−1)/2·α with k ≥ 2 gives D_k^± (two chambers); λ = 0 gives the two limits of discrete series D_1^±.
- SO_{2n}(ℝ)-split with n odd (e.g. SO(3,3)) has rank G = n > rank K = n−1, hence no discrete series.

**Signatures requiring supplier input.** `TauCeti.RealReductive.discreteSeries`. The native compact Cartan, Harish-Chandra parameters, central character and discrete-series isomorphism-class constructor require integrated real reductive classification. A scalar parameter or arbitrary class is not an adequate signature. Owner/input: AF.1/real-reductive-group; reductive classification gap.

**Sources for this target.**

- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §1.4, arXiv p. 8. The existence criterion specialised to split classical groups.
- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §5.3, proof of Theorem 5.5 (arXiv v1 p. 22; Duke p. 828). Harish-Chandra's parametrization π(λ, C) used for GSp_4(ℝ); see AF.4/gsp4-discrete-series.
- Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §5.1.6, p. 22. (Limits of) discrete series π(λ, C) with λ possibly on a wall of C.

### Langlands classification

**Theorem** `AF.1/langlands-classification`. Proposed declaration: `TauCeti.RealReductive.langlandsClassification`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

Let (G, K) be real reductive. Every irreducible admissible (𝔤, K)-module is the unique irreducible quotient J(P, σ, ν) (Langlands quotient) of a standard module Ind_P^G(σ ⊗ e^{ν}) with P = MAN a standard parabolic, σ an irreducible tempered representation of M and ν ∈ 𝔞^* in the open positive chamber for P; the triple (P, σ, ν) is unique up to K-conjugacy. Tempered representations are the constituents of Ind_P^G(σ) with σ (limits of) discrete series of M and ν unitary.

**Hypotheses.** (G, K) real reductive; Allow P=G for an already tempered representation, with zero induction parameter. For an arbitrary standard Levi use irreducible tempered inducing data. A requirement that P be cuspidal while allowing arbitrary tempered data does not state the general Langlands classification.

**Construction or proof route.**

1. Langlands' 1973 classification: existence of Langlands data through the leading exponents of matrix coefficients (Casselman's asymptotics, AF.1/casselman-embedding), uniqueness through the standard intertwining operator whose image is the Langlands quotient.
2. Tempered representations: Knapp–Zuckerman classification by (limits of) discrete series of Levi subgroups (AF.1/discrete-series).
3. The statement is recorded from its sources; the proof (Langlands, On the classification of irreducible representations of real algebraic groups, Math. Surveys Monogr. 31) was not read.

**Direct prerequisites.** `AF.1/principal-series`, `AF.1/tempered-square-integrable`, `AF.1/discrete-series`, `AF.1/casselman-embedding`, `AF.1/normalized-real-parabolic-induction`

**Acceptance.**

- SL_2(ℝ): the trivial representation is the Langlands quotient J(P_min, triv, ρ).
- GL_2(ℝ): the finite-dimensional representation Sym^{k−2} ⊗ det^s is the Langlands quotient of the principal series whose subrepresentation is D_k ⊗ det^{s'}.

**Signatures requiring supplier input.** `TauCeti.RealReductive.langlandsClassification`. Native standard modules from actual real parabolics, tempered Levi classes, dominant chamber and their irreducible quotients are required to state the classification bijection. Owner/input: AF.1/normalized-real-parabolic-induction; native reductive classification gap.

**Sources for this target.**

- Robert P. Langlands, [On the notion of an automorphic representation](https://publications.ias.edu/sites/default/files/notion-ps.pdf), p. 1. The classification principle, with [4] Langlands' classification for real groups.
- Wee Teck Gan, Atsushi Ichino, [The Shimura-Waldspurger correspondence for Mp_2n](https://arxiv.org/abs/1705.10106v3), §1, arXiv p. 4. Use of the Langlands classification for real groups.

### The Weil groups W_ℝ and W_ℂ and their representations

**Definition** `AF.1/weil-group-real`. Proposed declaration: `TauCeti.RealReductive.WeilGroupReal`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

W_ℂ = ℂ^× and W_ℝ = ℂ^× ⊔ jℂ^× with j² = −1 ∈ ℂ^× and jzj⁻¹ = z̄, a non-split extension 1 → ℂ^× → W_ℝ → Gal(ℂ/ℝ) → 1; the norm map W_ℝ → ℝ^× (z ↦ \|z\|², j ↦ −1) is the abelianization. Every continuous semisimple finite-dimensional representation of W_ℂ is a sum of characters z ↦ z^p z̄^q (p, q ∈ ℂ, p − q ∈ ℤ); every irreducible representation of W_ℝ is either a character of ℝ^× pulled back by the norm (1-dimensional) or the 2-dimensional induced representation Ind_{W_ℂ}^{W_ℝ}(z^p z̄^q) with p − q ∈ ℤ ∖ {0} (and Ind(z^p z̄^q) ≅ Ind(z^q z̄^p)). A representation is tempered (bounded) if its image is relatively compact.

**Hypotheses.** The presentation is the nonsplit extension: j²=−1∈ℂ^× and jzj⁻¹=z̄. Every element outside ℂ^× squares to −\|z\|², so there is no element of order two above complex conjugation; merely asserting that j has order four is insufficient.

**Construction or proof route.**

1. Construct W_ℝ as the subgroup ℂ^× ∪ jℂ^× of ℍ^× (Hamilton quaternions); continuity and topology from ℍ.
2. Characters of ℂ^× from Tau Ceti GlobalNumberFields Layer 10 classification ((z/\|z\|)^k\|z\|^s).
3. Irreducibles of W_ℝ: Clifford theory for the index-2 subgroup ℂ^×: a character χ of ℂ^× either extends (χ = χ∘conj, giving two extensions) or induces irreducibly.
4. Abelianization: [W_ℝ, W_ℝ] = S¹ ⊆ ℂ^×, giving W_ℝ^{ab} ≅ ℝ^×.

**Direct prerequisites.** `AF.1/real-reductive-representation-theory`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `mathlib:Representation`

**Uses.** AF.1/archimedean-llc-gln: the parameter side of Langlands' correspondence. AutomorphicLFunctionsAndLocalFactors:AL.1: archimedean L- and ε-factors of W_ℝ-representations (Tate's normalisation, Chenevier–Taïbi route) are AL.1's. AF.4/c-l-algebraic: algebraicity conditions are read off the restriction of parameters to ℂ^×.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.WeilGroupReal` | data | W_ℝ as a topological group with the inclusion ℂ^× → W_ℝ and j. |
| `RealReductive.WeilGroupReal.norm` | projection | The abelianization W_ℝ → ℝ^×, z ↦ z z̄, j ↦ −1. |
| `RealReductive.WeilGroupReal.irreducible_classification` | characterisation | Irreducible continuous representations are 1-dimensional characters of ℝ^× via the norm, or Ind(z^p z̄^q) with p − q ∈ ℤ \ {0}. |
| `RealReductive.WeilGroupReal.restrict_complex` | functoriality | Restriction to W_ℂ = ℂ^× of a representation; semisimplicity. |
| `RealReductive.WeilGroupReal.IsTempered` | data | Bounded image. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `weilReal_j_sq` | computation | j² = −1 ∈ ℂ^× ⊆ W_ℝ and j z j⁻¹ = z̄. |
| `weilReal_ab` | characterisation | The abelianization of W_ℝ is ℝ^× via the norm map. |
| `weilComplex_irreducible_dim_one` | degenerate | Every irreducible continuous representation of W_ℂ is 1-dimensional. |
| `weilReal_not_split` | non-example | W_ℝ is not the semidirect product ℂ^× ⋊ ℤ/2: every jz outside ℂ^× has square −\|z\|², so no element above complex conjugation has order two. The order of the selected j alone does not establish nonsplitting. |
| `weilReal_character_compat` | compatibility | Characters of W_ℝ correspond to the continuous characters \|x\|^s sgn^ε of ℝ^× of Tau Ceti GlobalNumberFields Layer 10. |
| `weilReal_normCharacter` | computation | For an actual homomorphism χ:ℝ×→ℂ×, its pullback to Wℝ evaluates at w as χ(norm(w)). The continuous-character/infinity-type classification remains the distinct compatibility target. |

**Acceptance.**

- The induced representation Ind(z^{k−1}·\|z\|^{1−k}) is the 2-dimensional parameter of the weight-k discrete series of GL_2(ℝ).
- Every irreducible representation of W_ℂ = ℂ^× is one-dimensional; every irreducible symplectic representation of W_ℝ is two-dimensional (Gan–Ichino §6.2).

**Native signature scope.** Native nonsplit ℂ××Bool multiplication, j²=−1, conjugation, real/complex norm characters and finite-dimensional irreducible dimension classification. Local GL_n correspondence is a separate missing classification interface. weilReal_normCharacter is a separate composition test; the full native infinity-type compatibility example is omitted.

**Signatures requiring supplier input.** `weilReal_character_compat`. The exact continuous-character and infinity-type comparison requires the native GlobalNumberFields Layer 10 character carrier and its real norm pullback. The generic character-composition example has the distinct normCharacter helper name and is not counted as that supplier comparison. Owner/input: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic.

**Sources for this target.**

- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §2.1, arXiv p. 13. Definition of W_ℝ (the PDF text drops the ⊔ and the overline on z).
- Wee Teck Gan, Atsushi Ichino, [The Shimura-Waldspurger correspondence for Mp_2n](https://arxiv.org/abs/1705.10106v3), §6.1, arXiv p. 22. Irreducible representations of W_ℂ = L_ℂ are 1-dimensional.

### Langlands' correspondence for GL_n(ℝ) and GL_n(ℂ)

**Theorem** `AF.1/archimedean-llc-gln`. Proposed declaration: `TauCeti.RealReductive.recGL`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

Atlas planet: **Archimedean local Langlands for GL_n**.

For F = ℝ or ℂ there is a natural bijection rec_F : π ↦ L(π) between isomorphism classes of irreducible admissible Harish-Chandra modules of GL_n(F) and n-dimensional continuous semisimple representations of W_F, such that: (i) n = 1 is the classification of characters of F^× (via W_F^{ab} ≅ F^×); (ii) det ∘ L(π) corresponds to the central character; (iii) L(π ⊗ χ∘det) = L(π) ⊗ L(χ), L(π^∨) = L(π)^∨; (iv) π is essentially square-integrable iff L(π) is irreducible (so only n ≤ 2 for ℝ and n = 1 for ℂ), π is tempered iff L(π) has bounded image; (v) the infinitesimal character of π is read off from the restriction of L(π) to ℂ^×: if L(π)\|_{ℂ^×} = ⊕_{i=1}^n z^{p_i} z̄^{q_i}, then for F = ℝ the infinitesimal character of π is χ_{(p_1, …, p_n)} (the q_i are a permutation of the p_i), and for F = ℂ, on 𝔤_ℂ = 𝔤𝔩_n(ℂ) × 𝔤𝔩_n(ℂ), it is (χ_{(p_i)}, χ_{(q_i)}); (vi) the weight-k discrete series D_k ⊗ \|det\|^s of GL_2(ℝ) (k ≥ 2) corresponds to Ind_{W_ℂ}^{W_ℝ}((z/\|z\|)^{k−1}\|z\|^{2s}). The compatibility with Godement–Jacquet L- and ε-factors is AutomorphicLFunctionsAndLocalFactors AL.2's statement.

**Hypotheses.** F ∈ {ℝ, ℂ}

**Construction or proof route.**

1. Langlands classification for GL_n(F) (AF.1/langlands-classification): every irreducible is a Langlands quotient of an induced representation from GL_1's and (for ℝ) GL_2 discrete series.
2. Map the Langlands data to the direct sum of the parameters of the inducing data (characters of F^× and, for ℝ, Ind(z^p z̄^q) for D_k ⊗ \|det\|^s).
3. Bijectivity: uniqueness of Langlands data and of the decomposition of semisimple W_F-representations into irreducibles.
4. Properties (ii)-(v) are checked on inducing data; (vi) is the n = 2 discrete-series case.
5. Knapp, Local Langlands correspondence: the archimedean case, §§3–4, Theorems 2 and 5 (pp.403,406), gives the explicit real and complex parameter constructions and bijections. These passages have been read; the original Langlands classification and discrete-series proof interiors remain recorded gaps.

**Direct prerequisites.** `AF.1/langlands-classification`, `AF.1/weil-group-real`, `AF.1/discrete-series`, `AF.1/gl2-real-discrete-series`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`

**Acceptance.**

- n = 1: rec_ℝ(\|x\|^s sgn(x)^ε) is the character of W_ℝ through the norm.
- The trivial representation of GL_2(ℝ) corresponds to \|·\|^{1/2} ⊕ \|·\|^{−1/2} (via the norm), not to an irreducible parameter.
- GL_n(ℂ): every parameter is a sum of characters, so the only essentially square-integrable representations are the characters of GL_1(ℂ).

**Signatures requiring supplier input.** `TauCeti.RealReductive.recGL`. The native GL_n(ℝ)/GL_n(ℂ) classified admissible classes and continuous semisimple Weil parameters, with normalization of central characters/local factors, require the reductive classification and AL.2 interfaces. The nonsplit Weil-group carrier alone is insufficient. Owner/input: AF.1/discrete-series; AF.1/langlands-classification; AutomorphicLFunctionsAndLocalFactors:AL.2.

**Sources for this target.**

- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §2.1, arXiv p. 13. The bijection as stated.
- Wee Teck Gan, Atsushi Ichino, [The Shimura-Waldspurger correspondence for Mp_2n](https://arxiv.org/abs/1705.10106v3), §6.1, arXiv p. 22. The case F = ℂ: essentially square-integrable representations of GL_n(ℂ) exist only for n = 1.
- Anthony W. Knapp, [Local Langlands correspondence: the archimedean case](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf), §3, Theorem 2, p.403, and §4, Theorem 5, p.406. The scanned public survey states the real and complex GL_n archimedean correspondences, after the explicit parameter constructions. Its local-factor formulas and normalization are stated in §§3–4; full classification proof closure remains a gap.

### The (𝔤𝔩_2, O(2))-modules D_k of GL_2(ℝ)

**Construction** `AF.1/gl2-real-discrete-series`. Proposed declaration: `TauCeti.RealReductive.GL2.discreteSeries`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

For k ≥ 1 and μ ∈ ℂ, D_k(μ) is the (𝔤𝔩_2, O(2))-module with basis v_ℓ (\|ℓ\| ≥ k, ℓ ≡ k mod 2), rotation r_θ acting by e^{iℓθ}, diag(1,−1) exchanging v_ℓ and v_{−ℓ}, X v_ℓ = ½(k+ℓ)v_{ℓ+2}, Y v_ℓ = ½(k−ℓ)v_{ℓ−2} (so Y v_k = 0 and X v_{−k} = 0), the centre element Z = 1_2 acting by μ and the Casimir Δ = ¼(H² + 2XY + 2YX) acting by k(k−2)/4. D_k(μ) is irreducible admissible; for k ≥ 2 it is the discrete series of weight k (essentially square-integrable), for k = 1 the limit of discrete series. Every irreducible admissible (𝔤𝔩_2, O(2))-module is finite-dimensional, a principal series, or some D_k(μ).

**Hypotheses.** k ≥ 1, μ ∈ ℂ

**Construction or proof route.**

1. Check the relations [H, X] = 2X, [H, Y] = −2Y, [X, Y] = H on the basis, and compatibility of the O(2)-action (condition (2) of AF.1a/gk-module).
2. Irreducibility: any nonzero submodule contains some v_ℓ and the raising/lowering coefficients ½(k ± ℓ) are nonzero for \|ℓ\| > k.
3. Casimir value from Y v_k = 0: Δ v_k = ¼(k² − 2k)v_k = k(k−2)/4 v_k.
4. Classification of irreducibles of (𝔤𝔩_2, O(2)) by K-types and the Casimir eigenvalue (Getz–Hahn §6.5).

**Direct prerequisites.** `AF.1/real-reductive-representation-theory`, `AF.1a/gk-module`, `AF.1/infinitesimal-character`, `AF.1/gl2-algebraic-weight-model`

**Uses.** AF.5/gl2-dictionary: holomorphic cusp forms of weight k generate D_k at infinity. AF.1/archimedean-llc-gln: parameter (vi) of the correspondence. GL2AutomorphicRepresentationsAndTransfer:R16.6: 'holomorphic representations' of weight k are those with π_∞ ≅ D_k. AutomorphicLFunctionsAndLocalFactors:AL.2: L(s, D_k) = Γ_ℂ(s + (k−1)/2) (with the unitary normalisation).

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.GL2.discreteSeries` | constructor | D_k(μ) as a (𝔤𝔩_2, O(2))-module. |
| `RealReductive.GL2.discreteSeries_casimir` | simp | Δ acts on D_k(μ) by k(k−2)/4. |
| `RealReductive.GL2.discreteSeries_ktypes` | characterisation | The SO(2)-types of D_k(μ) are e^{iℓθ}, \|ℓ\| ≥ k, ℓ ≡ k mod 2, each with multiplicity one. |
| `RealReductive.GL2.discreteSeries_irreducible` | structure | D_k(μ) is irreducible and admissible. |
| `RealReductive.GL2.classification` | characterisation | Every irreducible admissible (𝔤𝔩_2, O(2))-module is finite-dimensional, an irreducible principal series, or D_k(μ). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `gl2DS_casimir_k2` | computation | On D_2(μ), Δ = 0. |
| `gl2DS_casimir_k12` | computation | On D_12(μ) (Ramanujan Δ's archimedean type), Δ = 12·10/4 = 30. |
| `gl2DS_lowest` | degenerate | Y v_k = 0 and X v_{−k} = 0: v_{±k} span the minimal K-type. |
| `gl2DS_not_k2_minus_1` | non-example | The value (k² − 1)/4 is not the Casimir eigenvalue on D_k (for k = 2 it would be 3/4 ≠ 0); see sourceIssues E1. |

**Acceptance.**

- D_2(0) has the infinitesimal character of the trivial representation: Δ = 0.
- D_k(μ) with k ≥ 2 embeds in the principal series whose Langlands quotient is Sym^{k−2} twisted.

**Signatures requiring supplier input.** `TauCeti.RealReductive.GL2.discreteSeries`, `TauCeti.RealReductive.GL2.discreteSeries_casimir`, `TauCeti.RealReductive.GL2.discreteSeries_ktypes`, `TauCeti.RealReductive.GL2.discreteSeries_irreducible`, `TauCeti.RealReductive.GL2.classification`, `gl2DS_casimir_k2`, `gl2DS_casimir_k12`, `gl2DS_lowest`, `gl2DS_not_k2_minus_1`. The integrated GL₂/O₂ discrete or limit series, its central μ parameter, admissibility and irreducible-class constructor are absent. The separately named algebraic weight model computes operators and angular derivative without impersonating these objects. Owner/input: AF.1/discrete-series; native reductive classification gap.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.5, p. 34. Definition of π_k with the displayed action (1)-(6), including Δv_ℓ = k(k−2)/4 v_ℓ.

### Vogan's generic unitary dual of GL_n(ℝ) and GL_n(ℂ)

**Theorem** `AF.1/vogan-generic-unitary-dual`. Proposed declaration: `TauCeti.RealReductive.voganGenericUnitary`. Module: `TauCeti/RepresentationTheory/RealReductive/Langlands`. Realises `AF.1`.

For F = ℝ or ℂ, every irreducible generic unitary representation of GL_m(F) is isomorphic to an irreducible unitarily induced representation Ind_P^{GL_m}(τ_1\|det\|^{β_1} ⊗ … ⊗ τ_t\|det\|^{β_t} ⊗ σ_0 ⊗ τ_t\|det\|^{−β_t} ⊗ … ⊗ τ_1\|det\|^{−β_1}) with 1/2 > β_1 > … > β_t > 0 and τ_i, σ_0 irreducible unitary generic tempered; conversely such inductions are irreducible, generic and unitary.

**Hypotheses.** F ∈ {ℝ, ℂ}

**Construction or proof route.**

1. Vogan, The unitary dual of GL(n) over an archimedean field (Invent. Math. 83, 1986), specialised to generic representations; statement as used by Jiang–Zhang Appendix B.
2. Genericity and irreducibility of the inductions via the Langlands classification and the archimedean correspondence.

**Direct prerequisites.** `AF.1/archimedean-llc-gln`, `AF.1/tempered-square-integrable`, `AF.1/langlands-classification`

**Acceptance.**

- n = 1: generic unitary = unitary characters.
- GL_2(ℝ): the complementary series Ind(\|·\|^β ⊗ \|·\|^{−β}) with 0 < β < 1/2 are generic unitary; β = 1/2 gives the reducible induction containing the trivial representation.

**Signatures requiring supplier input.** `TauCeti.RealReductive.voganGenericUnitary`. The native generic unitary GL_n classes, Whittaker-model condition and normalized Levi induction require classification and AL.3 exports. A generic representation and a formal partition cannot state this classification. Owner/input: AF.1/langlands-classification; AutomorphicLFunctionsAndLocalFactors:AL.3.

**Sources for this target.**

- Dihua Jiang, Lei Zhang, [Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/abs/1508.03205v4), Appendix B, proof of Theorem B.2, arXiv p. 86. The generic unitary dual (B.5) with 1/2 > β_1 > … > β_t > 0.

### Normalized real parabolic induction

**Construction** `AF.1/normalized-real-parabolic-induction`. Proposed declaration: `TauCeti.RealReductive.normalizedInduction`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.1`.

Let G be real reductive and P=M_PA_PN_P a real parabolic. Given an actual smooth moderate-growth Fréchet realization (σ,V) of M_P and λ∈𝔞_{P,ℂ}^*, define E_{σ,λ}={f∈C^∞(G,V):f(namg)=a^{ρ_P+λ}σ(m)f(g)}, where ρ_P is half the sum of roots in Lie N_P with multiplicities. Give this space the compact-picture C^∞(K,V) subspace topology and the right-translation action. Its K-finite part is normalized algebraic parabolic induction. Construction uses the supplied realization of σ, before claiming a canonical globalization; when σ is irreducible good, Bernstein–Krötz Proposition 9.6 identifies E_{σ,λ} with that globalization. It agrees with minimal principal series for finite-dimensional σ.

**Hypotheses.** The Langlands decomposition and real Lie structures are imported; σ is supplied as a concrete smooth Fréchet representation of moderate growth.; The canonical SAF/globalization comparison is a subsequent theorem, not a prerequisite of the carrier. The sign convention is left covariance and right translation.

**Construction or proof route.**

1. Form the smooth equivariant-map subspace with the displayed δ_P^{1/2}a^λ factor. Restriction to K gives the compact-picture space, with inverse by the Langlands decomposition.
2. The seminorms of uniform derivatives on compact subsets of K give the Fréchet topology; translation is smooth and has polynomial seminorm growth under the stated inducing estimates.
3. The algebraic K-finite carrier is defined directly using orbit spans. Only after this construction compare with the canonical globalization through Proposition 9.6 and the separate goodness theorem.

**Direct prerequisites.** `AF.1/principal-series`, `AF.1/sf-representation`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`

**Uses.** AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification: Forms the standard module from tempered Levi data before taking its unique quotient. EndoscopicTransferAndUnitaryTraceComparison:ET.1: Supplies normalized real induction with an explicit modular-character convention.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.normalizedInduction` | constructor | The smooth equivariant carrier with left factor a^{ρ_P+λ}σ(m). |
| `RealReductive.normalizedInduction.rightTranslate` | structure | Right translation preserves covariance and gives a smooth group action. |
| `RealReductive.normalizedInduction.restrictK` | equivalence | Restriction to the compact-picture equivariant maps is a topological linear equivalence. |
| `RealReductive.normalizedInduction.map` | functoriality | Continuous M_P-intertwiners induce G-intertwiners and preserve identity and composition. |
| `RealReductive.normalizedInduction.transitivity` | relation | Normalized induction in stages, adding the corresponding half-modular exponents. |
| `RealReductive.normalizedInduction.minimal_compat` | compatibility | For a minimal parabolic and finite-dimensional inducing coefficient it is principalSeries. |
| `RealReductive.normalizedInduction.globalization` | compatibility | For irreducible good inducing Harish-Chandra modules Proposition 9.6 identifies the constructed carrier with the canonical SAF globalization. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `normalizedInduction_top` | degenerate | For P=G, ρ_P=0 and evaluation at 1 identifies the induced space with the inducing representation. |
| `normalizedInduction_SL2` | computation | For t>0 and ν∈ℂ the scalar normalized factor sqrt(t²)·exp(ν log t) equals exp((ν+1)log t); in the SL₂ diagonal Langlands coordinate this is t^{ν+1}. The group-coordinate identification uses the imported decomposition. |
| `normalizedInduction_covariance` | characterisation | Every induced f satisfies f(pg)=sqrt(δ_P(p))η(p)σ(p)f(g), with the displayed square-root modular factor. This tests the carrier directly. Agreement with principalSeries remains the minimal_compat API and acceptance assertion, requiring its native parabolic data. |

**Acceptance.**

- For P=G, ρ_P=0 and evaluation at 1 identifies the induced space with the inducing representation.
- For SL₂ with a=diag(t,t⁻¹), t>0, the scalar normalized covariance is t^{ν+1}; the missing +1 would give unnormalized induction.
- The minimal finite-dimensional carrier and right action agree with principalSeries, including the contragredient parameter −ν.

**Native signature scope.** Native smooth covariance with an explicit positive modular character and supplied σ/η, right translation and a conditional compact picture with its geometric bijection hypothesis. Minimal-parabolic, nested transitivity and canonical SAF identification remain omitted.

**Signatures requiring supplier input.** `TauCeti.RealReductive.normalizedInduction.transitivity`, `TauCeti.RealReductive.normalizedInduction.minimal_compat`, `TauCeti.RealReductive.normalizedInduction.globalization`. Transitivity and minimal/CW comparison require actual nested real parabolics with root modular characters, their Levi/compact picture and native SAF globalization. The supplied smooth-covariance carrier and conditional compact-picture map are genuine partial constructions. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.0; AF.1/principal-series; AF.1/casselman-wallach-globalization.

**Sources for this target.**

- Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3), §9.3, pp.39–40, Proposition 9.6. The compact-picture induction carrier is constructed from an inducing smooth representation, then compared with the good module’s canonical globalization.

### The algebraic GL₂ weight model

**Construction** `AF.1/gl2-algebraic-weight-model`. Proposed declaration: `TauCeti.RealReductive.GL2.WeightModel`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.1`.

For k≥1, take the subspace of finitely supported complex sequences indexed by integers ℓ with \|ℓ\|≥k and ℓ≡k modulo 2. On basis vectors set H v_ℓ=ℓv_ℓ, Xv_ℓ=(k+ℓ)v_{ℓ+2}/2 and Yv_ℓ=(k−ℓ)v_{ℓ−2}/2. These preserve the subspace, satisfy [H,X]=2X, [H,Y]=−2Y and [X,Y]=H, and give Δ=(H²+2XY+2YX)/4=k(k−2)/4. Circle rotation z acts by z^ℓ. This fixes the algebraic normalization; the O(2) extension, central parameter, irreducibility and analytic discrete-series identification are additional parts of the discreteSeries node.

**Hypotheses.** k≥1; finite support and both weight rays are part of the carrier.

**Construction or proof route.**

1. Construct H, X and Y as linear combinations of their values on the native finitely supported basis. The boundary coefficient vanishes at ℓ=±k, giving stability.
2. Compute the three commutators on each basis vector. Compute XY+YX to obtain the scalar Casimir formula on the whole ambient finitely supported space.
3. Define the circle representation by its integer characters and differentiate z=exp(iθ), with the fixed rotation sign.

**Direct prerequisites.** `mathlib:Finsupp.linearCombination`, `mathlib:Circle.coeHom`

**Uses.** AutomorphicFormsOnReductiveGroups:AF.1/gl2-real-discrete-series: Provides the explicit algebraic carrier and operators that the classified GL₂ module must identify with.. AutomorphicFormsOnReductiveGroups:AF.1a/gk-module: Tests the sign of differentiation of the compact rotation weights..

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.GL2.WeightModel` | constructor | The finite-support parity and two-ray weight subspace. |
| `RealReductive.GL2.weightH` | constructor | H v_ℓ=ℓv_ℓ. |
| `RealReductive.GL2.weightX` | constructor | X v_ℓ=(k+ℓ)v_{ℓ+2}/2. |
| `RealReductive.GL2.weightY` | constructor | Y v_ℓ=(k−ℓ)v_{ℓ−2}/2. |
| `RealReductive.GL2.weightModel_stable` | structure | H, X and Y preserve the weight subspace. |
| `RealReductive.GL2.weightModel_bracket` | relation | The three sl₂ commutation relations. |
| `RealReductive.GL2.weightCasimir` | constructor | Δ=(H²+2XY+2YX)/4. |
| `RealReductive.GL2.weightModel_casimir` | simp | Δ=k(k−2)/4 on the algebraic model. |
| `RealReductive.GL2.weightCircle` | constructor | z v_ℓ=z^ℓv_ℓ. |
| `RealReductive.GL2.weightCircle_apply` | simp | The circle action evaluated in one weight coordinate. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `weightModel_casimir_k2` | computation | At k=2 the model Casimir is zero. |
| `weightModel_casimir_k12` | computation | At k=12 the model Casimir is 30. |
| `weightModel_lowest` | degenerate | Yv_k=0 and Xv_{−k}=0. |
| `weightModel_not_k2_minus_1` | non-example | At k=2, 3/4 is not the Casimir scalar. |
| `weightModel_circle_derivative` | compatibility | Differentiating the actual circle action at angle zero gives iH on each weight vector, with the chosen angular convention. |

**Acceptance.**

- At k=2 the model Casimir is zero.
- At k=12 the model Casimir is 30.
- Yv_k=0 and Xv_{−k}=0.
- At k=2, 3/4 is not the Casimir scalar.

**Native signature scope.** Native finite-support parity/two-ray submodule, H/X/Y operators, brackets, Casimir and Circle angular derivative. Tests explicitly use k=2 and k=12; integrated GL₂/O₂ discrete-series classification remains omitted.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.5, p.34, displayed actions (1)–(6). The explicit algebraic action and corrected Casimir scalar; identification with the discrete series is kept separate.

## AF.2. Automorphic spaces and representations

An automorphic form has five explicit conditions: smoothness, rational left invariance, moderate growth, compact finiteness and annihilation by a cofinite ideal of the enveloping centre. Smooth automorphic forms use uniform growth and central translation finiteness without imposing K-finiteness. Harish-Chandra’s reconstruction kernel yields uniform growth, and fixed-K-type/central-ideal finiteness feeds admissibility and finite multiplicity. Central translation finiteness is a theorem under those hypotheses, not a consequence of commuting operators.

Automorphic representations are irreducible admissible subquotients of the actual function module, quotiented by compatible isomorphism. Multiplicity is the dimension of an equivariant Hom space; the native extended-natural value records infinity honestly before arithmetic finiteness is established. Restricted tensors are a vector-space direct limit and contain sums of pure tensors. Stabilization by idempotents produces a nonunital algebra. Flath factorization passes through simple finite-dimensional corners and their directed system. The proof generates an invariant corner subspace under the full algebra rather than assuming invariant complements. Its archimedean input is the supported bi-K-finite distribution algebra and the U(𝔤)⊗_{U(𝔨)}R(K) balance quotient. The PBW/transverse-order comparison and the global nonunital-module adapter remain explicit refinements. Holomorphic coefficient-valued SL₂ and the classical component dictionary use their existing suppliers.

**Required refinements for closure.**

- Read and refine Harish-Chandra’s reconstruction kernel and fixed-K-type/cofinite-central-ideal finiteness proof interiors; use them for uniform growth, admissible subquotients and finite multiplicity. Supply AA finite-level component stabilizers and actual quotient dictionaries.
- Complete archimedean distribution/PBW comparison, restricted nonunital-module factorization and the native spherical Satake export. Flath’s algebraic corner proof is read; the Hilbert/discrete-spectrum comparison has extra analytic inputs.
- Complete coefficient-valued holomorphic SL₂ and the actual central-translation-finiteness argument, including the cited finite real classification; retain AL genericity and higher-rank dictionary ownership boundaries.

### Automorphic forms

**Definition** `AF.2/automorphic-form`. Proposed declaration: `TauCeti.Automorphic.AutomorphicForm`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Atlas planet: **Automorphic form**.

Let G be connected reductive over a number field F, K_∞ ⊆ G(F_∞) a maximal compact subgroup (AF.1/real-reductive-group) and Z(𝔤) the centre of U(𝔤_∞,ℂ). An automorphic form on G is a function φ : G(𝔸) → ℂ such that (1) φ(γg) = φ(g) for γ ∈ G(F); (2) φ is smooth (AF.0/smooth-adelic-function), in particular right invariant under a compact open subgroup of G(𝔸_f); (3) φ is right K_∞-finite; (4) φ is Z(𝔤)-finite: annihilated by an ideal J ⊆ Z(𝔤) of finite codimension; (5) φ has moderate growth (AF.0/moderate-growth). A(G) denotes the space of automorphic forms; for a character ω of A_G (split component of the centre) or a unitary character χ of Z_G(F)\Z_G(𝔸), A(G)_χ is the subspace with φ(zg) = χ(z)φ(g). A(G, J_f, ξ, J) is the subspace fixed by J_f ⊆ G(𝔸_f), of K_∞-type set ξ and killed by J. Automorphic forms are not assumed square-integrable, cuspidal, generic or of multiplicity one.

**Hypotheses.** G connected reductive over a number field F; K_∞ maximal compact in G(F_∞)

**Construction or proof route.**

1. Intersect the five conditions as subspaces of functions on G(F)\G(𝔸).
2. Stability under right translation by G(𝔸_f), under U(𝔤) and K_∞ (AF.0/growth-translation-differentiation; Z(𝔤) is central and commutes with R(g_∞) for g_∞ ∈ G(F_∞)°; finitely many K_∞-translates of J are needed for disconnected G(F_∞)).
3. Record the variants with central character and the fixed-type subspaces.

**Direct prerequisites.** `AF.0/smooth-adelic-function`, `AF.0/moderate-growth`, `AF.1/k-finite-vectors`, `AF.1/infinitesimal-character`, `AF.1/real-reductive-group`, `AdelicAlgebraicGroups:AA.2/split-centre`

**Uses.** AF.3/cusp-form: cusp forms are automorphic forms with vanishing constant terms. AF.4/cohomological-representation: cohomological automorphic representations are generated by automorphic forms. AutomorphicSpectralTheory:AS.1: Eisenstein series are automorphic forms. GL2AutomorphicRepresentationsAndTransfer:R16.1: the GL₂ specialisation of the space of automorphic forms. MetaplecticAutomorphicForms:MP.5: genuine automorphic forms on covers follow the same definition.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.AutomorphicForm` | data | The ℂ-subspace A(G) of functions G(𝔸) → ℂ satisfying (1)-(5). |
| `Automorphic.AutomorphicForm.leftInvariant` | projection | φ(γg) = φ(g) for γ ∈ G(F). |
| `Automorphic.AutomorphicForm.exists_level` | projection | Each φ is right invariant under some compact open J_f. |
| `Automorphic.AutomorphicForm.exists_ideal` | projection | Each φ is killed by an ideal of finite codimension of Z(𝔤). |
| `Automorphic.AutomorphicForm.withCentralChar` | constructor | The subspace A(G)_χ for a character χ of Z_G(F)\Z_G(𝔸). |
| `Automorphic.AutomorphicForm.fixedType` | constructor | The subspace A(G, J_f, ξ, J). |
| `Automorphic.AutomorphicForm.toUniformModerateGrowth` | compatibility | A(G) ⊆ T([G]) (AF.2/automorphic-forms-uniform-growth). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `automorphicForm_const` | degenerate | The constant function 1 is an automorphic form, killed by the augmentation ideal of Z(𝔤). |
| `automorphicForm_gl1_character` | computation | For a Hecke character χ of GL_1/ℚ, χ ∈ A(GL_1) and the Casimir-free ideal is generated by (d/dt − s) where χ = \|·\|^s on ℝ_{>0}. |
| `automorphicForm_log_not_eigen` | characterisation | For GL_1/ℚ, g ↦ log\|g\| is an automorphic form (killed by (d/dt)²) but is not an eigenfunction: Z(𝔤)-finiteness is weaker than having an infinitesimal character. |
| `automorphicForm_not_K_finite` | non-example | For φ_Δ (weight 12) and the right translate R(g_∞)φ_Δ by a noncompact g_∞ ∈ GL_2(ℝ)^+, the translate is a smooth automorphic form whose SO(2)-types are infinite in number: it is not K_∞-finite, hence not an automorphic form in the Borel–Jacquet sense. |
| `automorphicForm_classical_compat` | compatibility | For G = SL_2/ℚ, φ ∈ A(G)^{SL_2(\hat ℤ)} of K-type e^{ikθ} with J = (Δ − k(k−2)/4) and holomorphy correspond to M_k(SL_2(ℤ)) via AF.5/gl2-dictionary. |

**Acceptance.**

- Constant functions are automorphic forms that are not cuspidal (for G with a proper rational parabolic).
- For GL_1/ℚ, the automorphic forms are the finite linear combinations of Hecke characters times polynomials in log\|g\| (Z(𝔤)-finiteness allows generalized eigenfunctions).
- The function φ_f attached to a weight-k cusp form f (AF.5/gl2-dictionary) is an automorphic form for GL_2/ℚ.
- Right translation by central elements preserves K-finiteness. To test failure of K-finiteness under general archimedean translation, use a noncentral element such as diag(2,1) in GL_2(ℝ) on an infinite-dimensional discrete series.

**Native signature scope.** Native actual smooth function submodule with left arithmetic invariance, moderate growth, K-finiteness and annihilation by a cofinite central ideal. The genuine arithmetic group/height is supplied; the concrete classified GL₁/classical examples require their dictionaries.

**Signatures requiring supplier input.** `automorphicForm_gl1_character`, `automorphicForm_log_not_eigen`, `automorphicForm_not_K_finite`, `automorphicForm_classical_compat`. The GL₁ adelic/Hecke-character and classical modular-form dictionaries, and the actual cofinite centre action for the concrete GL₂ non-K-finite examples, need AA and AF.5 native exports. Constants and the generic five-condition function space are present. Owner/input: AdelicAlgebraicGroups:AA.1–AA.3; AF.5/gl1-dictionary; AF.5/gl2-dictionary.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.3, Definition 6.12, p. 31. Conditions (1)-(5) of the definition (Getz–Hahn also imposes A_G-invariance; we keep A_G-invariance as the variant with central character).
- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.7.1, arXiv p. 23. The smooth (Fréchet) variant without K_∞-finiteness; see AF.2/smooth-automorphic-forms.
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §4.2(a)–(d), p.195; §4.3(4), p.195. The fixed simple Hecke idempotent includes uniform finite-level invariance and finitely many K-types; central finiteness and polynomial growth complete the definition.

### Automorphic forms have uniform moderate growth

**Theorem** `AF.2/automorphic-forms-uniform-growth`. Proposed declaration: `TauCeti.Automorphic.AutomorphicForm.mem_uniformModerateGrowth`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Every automorphic form φ ∈ A(G) lies in T([G]): there is N with \|R(X)φ(g)\| ≪_X ‖g‖^N for all X ∈ U(𝔤_∞). More precisely (Harish-Chandra), there is α ∈ C_c^∞(G(F_∞)), which may be taken K_∞-conjugation invariant and supported in any neighbourhood of 1, with φ = R(α)φ = φ * α̌; then AF.0/convolution-to-uniform-growth gives the uniform bound with the moderate-growth exponent of φ.

**Hypotheses.** φ an automorphic form

**Construction or proof route.**

1. The (𝔤, K_∞)-module generated by φ is finitely generated and Z(𝔤)-finite, hence admissible (AF.1/harish-chandra-admissibility).
2. Borel–Jacquet §2.2, p.193, invokes a reconstruction kernel α with R(α)φ=φ and the derivative-growth conclusion, referring to Harish-Chandra Lemma 14. The K-type projector has finite-dimensional image only on each admissible K-isotypic component; an arbitrary approximate identity is not an exact reconstruction. Construct the kernel through the specified Harish-Chandra lemma, whose original proof remains a gap.
3. Apply AF.0/convolution-to-uniform-growth to φ = R(α)φ.

**Direct prerequisites.** `AF.2/automorphic-form`, `AF.0/convolution-to-uniform-growth`, `AF.1/harish-chandra-admissibility`

**Acceptance.**

- For the constant function 1 one may take α ≥ 0 with ∫α = 1.
- The statement fails for smooth K-finite functions that are not Z(𝔤)-finite: a moderate-growth function on GL_1(ℚ)\GL_1(𝔸) with rapidly oscillating archimedean part has unbounded derivatives.

**Signatures requiring supplier input.** `TauCeti.Automorphic.AutomorphicForm.mem_uniformModerateGrowth`. The actual reductive arithmetic datum, adelic height and Harish-Chandra reconstruction kernel with fixed central ideal are needed as native hypotheses. A generic Pair and subgroup do not imply this theorem. Owner/input: AdelicAlgebraicGroups:AA.3; AF.2/harish-chandra-finiteness; reconstruction-kernel gap.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.7.1, arXiv p. 23. The modern definition presupposes uniform moderate growth; the theorem identifies its K_∞-finite vectors with A(G).
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.2, Theorem 6.10, p. 31. Admissibility input [HC68].
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §1.6(2), p.191; Lemma 2.1 and §2.2, p.193. These identify the admissible generated module and reference the exact test-kernel reconstruction and common growth exponent. They do not supply the original analytic proof.

### Smooth automorphic forms and their K_∞-finite vectors

**Construction** `AF.2/smooth-automorphic-forms`. Proposed declaration: `TauCeti.Automorphic.SmoothAutomorphicForm`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

A^∞(G) is the subspace of Z(𝔤)-finite functions in T([G]) (smooth automorphic forms), with the LF topology induced from T([G]); it is a smooth representation of G(𝔸) (an SLF-representation level by level). Its K_∞-finite vectors are exactly A(G): A^∞(G)_{K_∞} = A(G). For fixed J_f and ideal J, A^∞(G)^{J_f}_J is an SAF-representation of G(F_∞) of finite length whose Harish-Chandra module is A(G, J_f, ·, J), so the two categories are linked by the Casselman–Wallach globalization.

**Hypotheses.** G connected reductive over F

**Construction or proof route.**

1. A^∞(G) is closed in each T_N([G])^{J_f} after fixing J (kernel of continuous operators R(z), z ∈ J).
2. K_∞-finite vectors of A^∞(G) satisfy (1)-(5) of AF.2/automorphic-form; conversely A(G) ⊆ T([G]) by AF.2/automorphic-forms-uniform-growth.
3. A^∞(G)^{J_f}_J is admissible with Harish-Chandra module A(G, J_f, ·, J) (AF.2/harish-chandra-finiteness); identify it with the globalization (AF.1/casselman-wallach-globalization).

**Direct prerequisites.** `AF.2/automorphic-form`, `AF.2/automorphic-forms-uniform-growth`, `AF.0/uniform-moderate-growth-space`, `AF.1/casselman-wallach-globalization`

**Uses.** AF.2/automorphic-representation: smooth automorphic representations are irreducible subquotients of A^∞(G). AutomorphicLFunctionsAndLocalFactors:AL.3: global Rankin–Selberg integrals of smooth cusp forms. AutomorphicSpectralTheory:AS.5: relative Lie algebra cohomology of A(G) versus all smooth functions of uniform moderate growth.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.SmoothAutomorphicForm` | data | A^∞(G) ⊆ T([G]) with its topology. |
| `Automorphic.SmoothAutomorphicForm.kFinite_eq` | characterisation | A^∞(G)_{K_∞} = A(G). |
| `Automorphic.SmoothAutomorphicForm.globalization` | equivalence | A^∞(G)^{J_f}_J is the Casselman–Wallach globalization of A(G, J_f, ·, J). |
| `Automorphic.SmoothAutomorphicForm.rightTranslate` | functoriality | Right translation by G(𝔸) acts continuously. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `smoothAutomorphic_const` | degenerate | 1 ∈ A^∞(G) and is K_∞-finite. |
| `smoothAutomorphic_kfinite_compat` | compatibility | The K_∞-finite vectors of A^∞(GL_1) are the finite sums of Hecke characters times polynomials in log\|·\|. |
| `smoothAutomorphic_not_kfinite` | non-example | A^∞(GL_2) contains non-K_∞-finite vectors (convergent sums over K-types), which are not in A(GL_2). |
| `smoothAutomorphic_carrier_obstruction` | non-example | A smooth automorphic vector whose compact orbit span is infinite dimensional cannot be an automorphic form. Construction of the GL₂ convergent-series instance is a separate target. |

**Acceptance.**

- For G compact at infinity, A^∞(G) = A(G).
- For GL_2/ℚ, the smooth vectors of the representation generated by a cusp form of weight k are the Casselman–Wallach globalization of D_k ⊗ (finite part).

**Native signature scope.** Native smooth left-invariant uniform-growth centrally translation-finite functions. The carrier-obstruction helper is named separately from the original convergent GL₂ infinite K-type example; the CW identification is omitted.

**Signatures requiring supplier input.** `TauCeti.Automorphic.SmoothAutomorphicForm.kFinite_eq`, `TauCeti.Automorphic.SmoothAutomorphicForm.globalization`, `smoothAutomorphic_kfinite_compat`, `smoothAutomorphic_not_kfinite`. The canonical SAF globalization and finite-level arithmetic quotient comparison identify this concrete function space with the smooth globalization. A supplied generic automorphic action is not that equivalence, nor the GL₂ convergent infinite K-type example. Owner/input: AF.1/casselman-wallach-globalization; AA.2; native classification gap.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.7.1, arXiv p. 23. Definition of smooth automorphic forms (BPCZ's A_P(G)).

### Harish-Chandra's finiteness theorem for automorphic forms

**Theorem** `AF.2/harish-chandra-finiteness`. Proposed declaration: `TauCeti.Automorphic.AutomorphicForm.finiteDimensional_fixedType`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Atlas planet: **Harish-Chandra finiteness theorem**.

For a compact open J_f ⊆ G(𝔸_f), a finite set ξ of K_∞-types and an ideal J ⊆ Z(𝔤) of finite codimension, the space A(G, J_f, ξ, J) of automorphic forms that are J_f-invariant, of K_∞-types in ξ and killed by J is finite-dimensional. Equivalently, A(G)^{J_f}_J is an admissible (𝔤, K_∞)-module; for G with A_G-invariance or a fixed central character the same holds without the hypothesis that J contains the centre's directions.

**Hypotheses.** J ⊆ Z(𝔤) of finite codimension; J_f compact open; ξ finite; The compact-group projector is the genuine finite sum of isotypic Haar projectors, not an arbitrary idempotent linear map. Elliptic regularity and the Harish-Chandra finiteness argument are separate analytic inputs.

**Construction or proof route.**

1. Reduce to finitely many arithmetic quotients: G(𝔸) = ⊔_i G(F)t_iG(F_∞)J_f (AdelicAlgebraicGroups:AA.3/component-decomposition) and the bijection (6.3.1) A(ξ_∞ ⊗ ξ_{J_f}, J) ≅ ⊕_i A(Γ_i, ξ_∞, J) (AF.2/adelic-classical-bijection).
2. Harish-Chandra's theorem for Γ\G(F_∞): A(Γ, ξ, J) is finite-dimensional, via the representation φ = φ * α (AF.2/automorphic-forms-uniform-growth), reduction theory on Siegel sets (AdelicAlgebraicGroups AA.3) and the decay of φ − φ_P on Siegel sets.
3. Source pins: Getz–Hahn Theorem 6.10 citing [HC68]; Harish-Chandra's proof is recorded with the gap on HC68.

**Direct prerequisites.** `AF.2/automorphic-form`, `AF.2/adelic-classical-bijection`, `AF.2/automorphic-forms-uniform-growth`, `AdelicAlgebraicGroups:AA.3/component-decomposition`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, `AF.1/harish-chandra-admissibility`

**Acceptance.**

- For GL_2/ℚ, J_f = K_0(N), ξ = {weight k} and J = ⟨Δ − k(k−2)/4, Z⟩, the space contains the image of S_k(Γ_0(N)) (finite-dimensional, Mathlib/Tau Ceti dimension results) and of the weight-k holomorphic Eisenstein series.
- Without fixing J the space is infinite-dimensional (Maass forms for all Laplace eigenvalues).

**Signatures requiring supplier input.** `TauCeti.Automorphic.AutomorphicForm.finiteDimensional_fixedType`. The native reductive arithmetic group and finite-level component stabilizers are needed to state fixed-K-type/cofinite-central-ideal finiteness. For arbitrary subgroups and heights the statement is false. Owner/input: AdelicAlgebraicGroups:AA.2; AF.1/real-reductive-group; Harish-Chandra finiteness gap.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.2, Theorem 6.10, p. 31. Theorem 6.10, citing Harish-Chandra [HC68].
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), Theorem 1.7, p.191; §4.3(i), p.195. The finite-dimensionality theorem has a finite K-type projector and cofinite central ideal. Its general analytic proof is referenced to Harish-Chandra; adelic fixed-level finiteness follows from the finite arithmetic-component decomposition.

### Adelic and classical automorphic forms

**Theorem** `AF.2/adelic-classical-bijection`. Proposed declaration: `TauCeti.Automorphic.AutomorphicForm.classicalEquiv`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Let J_f ⊆ G(𝔸_f) be compact open and G(𝔸) = ⊔_{i=1}^h G(F) t_i G(F_∞) J_f with t_i ∈ G(𝔸_f) and Γ_i = G(F) ∩ t_i J_f t_i⁻¹ G(F_∞) (arithmetic subgroups of G(F_∞)). Then φ ↦ (x ↦ φ(x t_i))_i is a (𝔤, K_∞)-equivariant bijection between the J_f-invariant automorphic forms on G(𝔸) of type (ξ, J) and ⊕_i A(Γ_i, ξ, J), the classical automorphic forms on Γ_i\G(F_∞) (smooth, slowly increasing, K_∞-finite, Z(𝔤)-finite).

**Hypotheses.** Finiteness of the class set G(F)\G(𝔸_f)/J_f modulo the image of G(F_∞); The components are indexed by distinct double cosets, not an arbitrary covering family. Γ_i=G(F)∩g_iJg_i⁻¹ (with the required real component/centre adjustment); their equality with these stabilizers is essential to injectivity.

**Construction or proof route.**

1. Component decomposition from AdelicAlgebraicGroups:AA.3/component-decomposition.
2. Restriction to G(F_∞)t_i identifies J_f-invariant left G(F)-invariant functions with Γ_i-invariant functions on G(F_∞).
3. Moderate growth corresponds to slowly increasing (heights restricted to G(F_∞)t_i, AdelicAlgebraicGroups:AA.3/height-representation-comparison).

**Direct prerequisites.** `AF.2/automorphic-form`, `AdelicAlgebraicGroups:AA.3/component-decomposition`, `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`

**Acceptance.**

- For GL_2/ℚ and J_f = K_0(N), h = 1 and Γ_1 = {γ ∈ GL_2(ℤ) : N \| c} (strong approximation for SL_2 and det(K_0(N)) = \hat ℤ^×).
- For GL_1 over a number field with class number h_F > 1 and J_f = \hat O_F^×, there are h_F components.

**Signatures requiring supplier input.** `TauCeti.Automorphic.AutomorphicForm.classicalEquiv`. The actual finite adelic double cosets, arithmetic real stabilizers and classical fixed-level growth/module carrier require AA.2. Generic left-invariant functions have no such chosen arithmetic component dictionary. Owner/input: AdelicAlgebraicGroups:AA.2.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.3, (6.3.1), p. 31. The bijection A(ξ_∞ ⊗ ξ_{K^∞}, J) ≅ ⊕_i A(Γ_i(K^∞), ξ_∞, J), φ ↦ (x_i ↦ φ(x_i t_i)).
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §4.3(1)–(2), p.195. The restriction-and-gluing bijection uses pairwise distinct double cosets and the actual rational stabilizer in the archimedean group. Its growth comparison follows from §1.2 and §4.3(4).

### A(G) as a (𝔤, K_∞) × G(𝔸_f)-module

**Construction** `AF.2/automorphic-forms-module`. Proposed declaration: `TauCeti.Automorphic.AutomorphicForm.gkModule`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

A(G) is a (𝔤, K_∞)-module under the derived right action of U(𝔤) and right translation by K_∞, and a smooth representation of G(𝔸_f) by right translation; the two actions commute. Equivalently A(G) is a nondegenerate module over the global Hecke algebra H = H_∞ ⊗ C_c^∞(G(𝔸_f)), H_∞ the algebra of K_∞-finite distributions on G(F_∞) supported on K_∞. Admissible (𝔤, K_∞) × G(𝔸_f)-modules are those whose (K_∞-type, J_f)-isotypic parts are finite-dimensional. The category of automorphic subquotients has as objects subquotients of A(G) (or of A(G)_χ) and (𝔤, K_∞) × G(𝔸_f)-maps.

**Hypotheses.** G connected reductive over F; Use the compatible crossed (𝔤,K)-action, including the adjoint covariance, and the commuting finite Hecke action. A(G) is a union of finite-type pieces; it is not asserted admissible as one unrestricted module.

**Construction or proof route.**

1. Stability of A(G) under the actions (AF.2/automorphic-form steps).
2. The archimedean Hecke algebra H(G(F_∞), K_∞): K_∞-finite distributions supported on K_∞ act through the (𝔤, K_∞)-structure; the fundamental idempotents 1_σ = d(σ)/vol(K_∞)·conj(χ_σ)dk project to K-types (Getz–Hahn Definition 3.6).
3. Nondegeneracy: every φ is fixed by some e_{J_f} ⊗ 1_ξ.

**Direct prerequisites.** `AF.2/automorphic-form`, `AF.0/finite-hecke-action`, `AF.1a/gk-module`, `AF.1/k-finite-vectors`

**Uses.** AF.2/automorphic-representation: automorphic representations are irreducible subquotients of this module. AF.4/rationality-field: Aut(ℂ)-twists of admissible (𝔤, K_∞) × G(𝔸_f)-modules. AutomorphicSpectralTheory:AS.4: Hecke and central character compatibility of the spectral decomposition.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.AutomorphicForm.gkModule` | instance | The (𝔤, K_∞)-module structure on A(G). |
| `Automorphic.AutomorphicForm.finiteAction` | instance | The smooth G(𝔸_f)-action, commuting with the (𝔤, K_∞)-action. |
| `Automorphic.GlobalHeckeModule` | data | Nondegenerate modules over H = H_∞ ⊗ C_c^∞(G(𝔸_f)); admissibility. |
| `Automorphic.AutomorphicSubquotient` | data | The category of subquotients of A(G) with (𝔤, K_∞) × G(𝔸_f)-maps. |
| `Automorphic.AutomorphicForm.heckeAction_compat` | compatibility | The C_c^∞(G(𝔸_f))-action is the restriction of AF.0/finite-hecke-action to A(G). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `automorphicModule_trivial` | degenerate | ℂ·1 ⊆ A(G) is a submodule on which 𝔤 acts by 0 and G(𝔸_f) trivially. |
| `automorphicModule_gl1` | computation | For GL_1/ℚ and a Hecke character χ, ℂχ is a one-dimensional submodule on which 𝔸_f^× acts by χ_f. |
| `automorphicModule_not_G_infty` | non-example | A(G) is not stable under right translation by G(F_∞) when G(F_∞) is noncompact: translates of K_∞-finite vectors are not K_∞-finite in general (only A^∞(G) carries the G(F_∞)-action). |

**Acceptance.**

- For G = GL_1/ℚ, A(G) = ⊕ over Hecke characters χ of the generalized eigenspaces, each a direct sum of (𝔤𝔩_1, O(1)) × 𝔸_f^×-modules.
- The finite Hecke operators of AF.0/finite-hecke-action preserve A(G)^{J_f}.

**Native signature scope.** Native differentiated compatible GK action and finite translation action on the actual function space using a supplied derivative-identifying Lie equivalence. Finite/global Hecke compatibility and concrete arithmetic examples need SR/AA inputs.

**Signatures requiring supplier input.** `TauCeti.Automorphic.AutomorphicForm.heckeAction_compat`, `automorphicModule_trivial`, `automorphicModule_gl1`, `automorphicModule_not_G_infty`. The full finite/restricted Hecke algebra and its nonunital module action require SR.1/AA.1 exports. Concrete GL₁ arithmetic and non-G∞-stability tests require the actual character/classification dictionaries. The derived GK and finite-group actions are native. Owner/input: SmoothRepresentationsOfLocalGroups:SR.1; AdelicAlgebraicGroups:AA.1; AF.5/gl1-dictionary.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §3.4, p. 18. The global Hecke algebra acting on automorphic forms.
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.5, Definition 5.18, p. 29. The (𝔤, K_∞) × G(𝔸_f)-module structure.

### Automorphic representations

**Definition** `AF.2/automorphic-representation`. Proposed declaration: `TauCeti.Automorphic.AutomorphicRepresentation`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Atlas planet: **Automorphic representation**.

An automorphic representation of G(𝔸) is an irreducible admissible (𝔤, K_∞) × G(𝔸_f)-module isomorphic to a subquotient of A(G) (Borel–Jacquet). A smooth automorphic representation is a topologically irreducible subquotient of A^∞(G); its K_∞-finite vectors form an automorphic representation and, conversely, an automorphic representation determines its smooth version by Casselman–Wallach globalization at infinity. By Langlands' Proposition 2, π is automorphic iff it is a constituent of Ind_{P(𝔸)}^{G(𝔸)}σ for a parabolic P = MN and a cuspidal automorphic representation σ of M(𝔸). The multiplicity of an irreducible admissible π in A(G), m(π) = dim Hom(π, A(G)), is finite; it is not required to be 0 or 1.

**Hypotheses.** G connected reductive over F

**Construction or proof route.**

1. Definition as irreducible subquotients; admissibility is automatic for subquotients of A(G) by AF.2/harish-chandra-finiteness.
2. Finite multiplicity: an embedding π → A(G) is determined by the image of the finite-dimensional space π^{J_f}(ξ), which lands in the finite-dimensional A(G, J_f, ξ, J_π).
3. Comparison with Getz–Hahn Definition 5.18 (subquotients of L²): for subrepresentations of the discrete spectrum the K-finite smooth vectors are automorphic forms (AF.3/cuspidal-spectrum-discrete in the cuspidal case; AutomorphicSpectralTheory AS.4 for the residual case).
4. Langlands' Proposition 2 (constituents of parabolic induction from cuspidal data) is recorded as a characterisation; its proof uses Eisenstein series and is AutomorphicSpectralTheory's (AS.1-AS.2).

**Direct prerequisites.** `AF.2/automorphic-forms-module`, `AF.2/harish-chandra-finiteness`, `AF.2/smooth-automorphic-forms`

**Uses.** AF.2/flath-factorization: automorphic representations factor as restricted tensor products. AF.3/cuspidal-automorphic-representation: the cuspidal ones. AF.4/cohomological-representation: cohomological automorphic representations. GL2AutomorphicRepresentationsAndTransfer:R16.4: multiplicity one for GL₂ is a theorem about this notion. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic automorphic representations of GL_n.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.AutomorphicRepresentation` | data | Isomorphism classes of irreducible admissible (𝔤, K_∞) × G(𝔸_f)-modules occurring as subquotients of A(G). |
| `Automorphic.AutomorphicRepresentation.multiplicity` | projection | Extended natural dimension of Hom(π,A(G)): finite dimension gives its ordinary natural value and infinite dimension gives ∞. Harish-Chandra finiteness specializes this to a natural number for the actual automorphic space. |
| `Automorphic.AutomorphicRepresentation.multiplicity_finite` | other | For the actual arithmetic automorphic space, the extended multiplicity is finite. |
| `Automorphic.AutomorphicRepresentation.centralCharacter` | projection | The central character ω_π of Z_G(F)\Z_G(𝔸) (continuous, determined by Schur's lemma). |
| `Automorphic.AutomorphicRepresentation.smooth` | equivalence | Bijection with smooth automorphic representations via K_∞-finite vectors and globalization. |
| `Automorphic.AutomorphicRepresentation.twist` | functoriality | Twisting by a character of G(F)\G(𝔸) that factors through G/[G,G] preserves automorphy. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `autRep_trivial` | degenerate | The trivial representation is automorphic with multiplicity 1 (constants). |
| `autRep_gl1` | computation | For GL_1/ℚ, automorphic representations ↔ Hecke characters (Tau Ceti GlobalNumberFields Layer 9 HeckeCharacter). |
| `autRep_mult_not_one` | non-example | Multiplicity one is not part of the definition: for SL_n (n ≥ 3) or for inner forms, automorphic multiplicities greater than one occur (Blasius); the multiplicity API records an extended natural number and finite multiplicity supplies a natural value. |

**Acceptance.**

- The trivial representation of G(𝔸) is automorphic (spanned by the constant function).
- For GL_1, automorphic representations are exactly the Hecke characters.
- The trivial representation of SL_2(𝔸) is automorphic but not generic (AF.2/nongeneric-automorphic).

**Native signature scope.** Native irreducible admissible subquotient occurrence, isomorphism class and Hom-space multiplicity in ℕ∞. Infinite dimension maps to ∞; finite multiplicity is a separate omitted arithmetic theorem. Central characters and smooth/twist outputs need supplier structures.

**Signatures requiring supplier input.** `TauCeti.Automorphic.AutomorphicRepresentation.multiplicity_finite`, `TauCeti.Automorphic.AutomorphicRepresentation.centralCharacter`, `TauCeti.Automorphic.AutomorphicRepresentation.smooth`, `TauCeti.Automorphic.AutomorphicRepresentation.twist`, `autRep_trivial`, `autRep_gl1`, `autRep_mult_not_one`. Finite multiplicity needs native fixed-type finiteness; central character, twists and smooth realization require integrated adelic centre and SAF/classification exports. The concrete occurrence tests need the arithmetic dictionaries and an actual multiplicity-greater-than-one example. Owner/input: AF.2/harish-chandra-finiteness; AA.1; AF.1/casselman-wallach-globalization; AS.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §5.5, Definition 5.18, p. 29. The L² formulation; the Borel–Jacquet formulation uses subquotients of A(G).
- Robert P. Langlands, [On the notion of an automorphic representation](https://publications.ias.edu/sites/default/files/notion-ps.pdf), Proposition 2, p. 2. Langlands' characterisation.
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §4.5–4.6, pp.196–197. Automorphy is a subquotient condition in the admissible Hecke/(g,K) category. The underlying object has a finite-adelic group action, without asserting an action of the entire archimedean group on K-finite vectors.

### Restricted tensor products

**Construction** `AF.2/restricted-tensor-product`. Proposed declaration: `TauCeti.Automorphic.RestrictedTensor`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Given vector spaces W_v (v in a countable index set Ξ) and nonzero vectors φ_v^0 ∈ W_v for v ∉ Ξ_0 (Ξ_0 finite), the restricted tensor product ⊗'_v W_v = lim_→S ⊗_{v∈S} W_v (S ⊇ Ξ_0 finite) with transition maps ⊗_{v∈S} w_v ↦ ⊗_{v∈S} w_v ⊗ ⊗_{v∈S'−S} φ_v^0. Similarly for algebras A_v with idempotents a_v^0 (the restricted tensor product algebra), and for modules W_v over A_v with a_v^0φ_v^0 = φ_v^0 for almost all v. The isomorphism class depends on (φ_v^0) only up to scalars at each place.

**Hypotheses.** Ξ countable, Ξ_0 finite; φ_v^0 ≠ 0

**Construction or proof route.**

1. Directed colimit of vector spaces over finite subsets S ⊇ Ξ_0.
2. Functoriality: families B_v with B_vφ_v^0 = φ_v^0 for almost all v induce ⊗B_v.
3. Restricted tensor product of algebras and of modules; rescaling φ_v^0 gives isomorphic modules.

**Direct prerequisites.** `mathlib:PiTensorProduct`, `mathlib:Module.DirectLimit`

**Uses.** AF.2/flath-factorization: the target of Flath's theorem. AF.0/adelic-test-functions: C_c^∞(G(𝔸_f)) as a restricted tensor product. GL2AutomorphicRepresentationsAndTransfer:R16.4: concrete restricted-tensor factorization comparisons for GL₂.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.RestrictedTensor` | constructor | ⊗'_v (W_v, φ_v^0) as a directed colimit. |
| `Automorphic.RestrictedTensor.of` | constructor | The map ⊗_{v∈S} W_v → ⊗'_v W_v. |
| `Automorphic.RestrictedTensor.map` | functoriality | ⊗B_v for families fixing φ_v^0 almost everywhere; map_id, map_comp. |
| `Automorphic.RestrictedTensor.algebra` | structure | The native module colimit acquires a nonunital ring structure by idempotent stabilization. Finite tensor inclusions preserve multiplication; a global identity need not exist. The compatible restricted-module action is a separate supplier-dependent extension. |
| `Automorphic.RestrictedTensor.rescale` | equivalence | Rescaling the φ_v^0 gives an isomorphic module. |
| `Automorphic.RestrictedTensor.IsRestrictedPureFamily` | data | An actual family equals the reference entries outside a finite set. |
| `Automorphic.RestrictedTensor.tprod` | constructor | Pure-tensor constructor on precisely these restricted families. |
| `Automorphic.RestrictedTensor.algebra_mul_of` | compatibility | The finite-tensor inclusion preserves multiplication for idempotent stabilization. |
| `Automorphic.RestrictedTensor.algebra_mul_tprod` | simp | Multiply corresponding entries in a common finite tensor stage. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `restrictedTensor_finite` | degenerate | If Ξ = Ξ_0 is finite, ⊗'_v W_v = ⊗_v W_v. |
| `restrictedTensor_polynomial` | computation | ⊗'_{i≥1}(ℂ[X_i], 1) ≅ ℂ[X_1, X_2, …]. |
| `restrictedTensor_not_full` | non-example | ⊗'_v W_v is not the full infinite tensor product: the vector ⊗_v w_v with w_v ∉ ℂφ_v^0 for infinitely many v is not defined. |

**Acceptance.**

- C_c^∞(G(𝔸_f)) ≅ ⊗'_v C_c^∞(G(F_v)) with respect to e_{K_v} = vol(K_v)⁻¹1_{K_v} (Getz–Hahn Example 7.3).
- ℂ[X_1, X_2, …] = ⊗'_i ℂ[X_i] with respect to the units.

**Native signature scope.** Native finite-subset tensor direct limit and its finite-support universal maps; algebra gives a NonUnitalRing with stabilization idempotents, not an unjustified global unit. The nonunital Hecke module adapter and Flath theorem require SR exports.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §7.1, p. 35. Restricted tensor products of algebras and modules, (7.1.2), Remark 7.1 and Examples 7.2-7.3.

### Spherical vectors have dimension at most one

**Theorem** `AF.2/spherical-dimension-one`. Proposed declaration: `TauCeti.Automorphic.finrank_spherical_le_one`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Let v be a finite place at which G has a reductive model over O_v and K_v = G(O_v) is hyperspecial. Then the spherical Hecke algebra C_c^∞(G(F_v)//K_v) is commutative (via the Satake isomorphism, SmoothRepresentationsOfLocalGroups SR.4), (G(F_v), K_v) is a Gelfand pair, and dim π_v^{K_v} ≤ 1 for every irreducible admissible representation π_v of G(F_v). For connected reductive G this holds for all but finitely many places v: the AA.1 integral model, spread out to a smooth model with connected reductive fibres (the ReductiveGroupsPartII RG2.3 request), makes G(O_v) hyperspecial outside a finite set.

**Hypotheses.** K_v hyperspecial (G_{O_v} reductive)

**Construction or proof route.**

1. Import commutativity of C_c^∞(G(F_v)//K_v) from SR.4's Satake isomorphism (RT-AREA-automorphic-1/26).
2. If C_c^∞(G//K) is commutative then every finite-dimensional irreducible complex module over it is one-dimensional; V^K is finite-dimensional by admissibility and an irreducible (or zero) module for irreducible V (Getz–Hahn Proposition 7.9), so dim V^K ≤ 1 (Proposition 8.6).
3. Hyperspecial at almost all places: AdelicAlgebraicGroups:AA.1/integral-model-exists gives only a finitely presented Hopf model over O_{F,S}. For connected reductive G, after enlarging S the model is smooth with connected reductive fibres, so G(O_v) is hyperspecial for v∉S; this spreading-out is requested from ReductiveGroupsPartII RG2.3, the same input AdelicAlgebraicGroups AA.3/good-maximal-compact uses.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.1/integral-model-exists`, `ReductiveGroupsPartII:RG2.3`

**Acceptance.**

- GL_2(ℚ_p), K = GL_2(ℤ_p): unramified principal series have one-dimensional K-fixed lines; Steinberg has none.
- For the non-hyperspecial Iwahori subgroup I the algebra C_c^∞(G//I) is noncommutative and dim(St^I) = 1 but dim(π^I) = 2 for unramified principal series of GL_2.

**Signatures requiring supplier input.** `TauCeti.Automorphic.finrank_spherical_le_one`. A native spherical local Hecke algebra with the exact commutative Satake export and an irreducible admissible smooth module is required. A commutativity assertion about an unspecified algebra is not substituted. Owner/input: SmoothRepresentationsOfLocalGroups:SR.3; SmoothRepresentationsOfLocalGroups:SR.4.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §8, Proposition 8.6, p. 39. Gelfand-pair criterion; the proof's 'dim(V^K) = 1' should read ≤ 1 (sourceIssues E2).

### Flath's tensor product theorem

**Theorem** `AF.2/flath-factorization`. Proposed declaration: `TauCeti.Automorphic.flath`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Atlas planet: **Flath's tensor product theorem**.

Let π be an irreducible admissible (𝔤, K_∞) × G(𝔸_f)-module (for example an automorphic representation). Then there are irreducible admissible (𝔤_v, K_v)-modules π_v at the archimedean places and irreducible admissible smooth representations π_v of G(F_v) at the finite places, with π_v unramified (π_v^{K_v} ≠ 0, hence one-dimensional) for almost all v, such that π ≅ ⊗'_v π_v, the restricted tensor product with respect to spherical vectors φ_v^0 ∈ π_v^{K_v}. The factors π_v are unique up to isomorphism, and the spherical vectors φ_v^0 are unique up to scalars.

**Hypotheses.** π irreducible admissible; K_v hyperspecial for v outside a finite set Ξ_0

**Construction or proof route.**

1. Encode each finite-place smooth representation as a nondegenerate module over its Hecke algebra; encode each archimedean compatible module through H(𝔤,K).
2. Use finite-corner-tensor-factorization at every finite collection of nonzero idempotents. Admissibility makes each corner finite-dimensional; irreducibility of corners uses generation from an arbitrary submodule, not a direct-sum hypothesis.
3. Directed corner inclusions identify the local factors compatibly and recover the original nondegenerate module as their restricted tensor product (Flath Theorems 2–3, pp.181–182).
4. At the good hyperspecial places the commutative spherical Hecke algebra gives an invariant line. Changing its nonzero generator by a scalar gives the rescaling isomorphism; uniqueness of factors follows from their local isotypic restrictions. Theorem 4’s Hilbert tensor factorization uses additional spectral inputs and is not substituted for this algebraic theorem.

**Direct prerequisites.** `AF.2/restricted-tensor-product`, `AF.2/spherical-dimension-one`, `AF.2/automorphic-forms-module`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `AF.2/finite-corner-tensor-factorization`, `AF.2/archimedean-hecke-algebra`

**Acceptance.**

- For a Hecke character χ = ⊗χ_v, the factors are the local characters χ_v, unramified (trivial on O_v^×) for almost all v.
- For π attached to a newform f of level N, π_p is unramified exactly for p ∤ N (AF.5/gl2-dictionary).

**Signatures requiring supplier input.** `TauCeti.Automorphic.flath`. The restricted nonunital Hecke algebra module category, local smooth carriers and archimedean balanced action must be connected by their native exports. The restricted tensor vector space/nonunital ring and finite corner lemma are typed but do not give this module equivalence. Owner/input: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.1; AF.2/archimedean-hecke-algebra.

**Sources for this target.**

- D. Flath, [Decomposition of representations into tensor products](https://doi.org/10.1090/pspum/033.1/546596), Theorems 1–3 and number-field formulation, pp.179–182. The idempotented-algebra proof covers the archimedean Hecke factors as well as the totally disconnected finite factors; the Hilbert statement is a distinct theorem.

### Automorphic representations need not be generic or cuspidal

**Theorem** `AF.2/nongeneric-automorphic`. Proposed declaration: `TauCeti.Automorphic.trivial_not_generic`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

(i) The trivial representation 1 of SL_2(𝔸_ℚ) (more generally of G(𝔸) for G with a nontrivial unipotent radical of a proper parabolic over F) is an automorphic representation, realised on the constant functions, which is not generic: for every nontrivial character ψ of N(F)\N(𝔸) of the upper triangular unipotent N, the Whittaker functional φ ↦ ∫_{N(F)\N(𝔸)} φ(n)ψ⁻¹(n)dn vanishes on it. (ii) The constant functions are not cuspidal: their constant term along the Borel subgroup is the constant function itself (with N(F)\N(𝔸) of volume one).

**Hypotheses.** G = SL_2 over ℚ (for definiteness)

**Construction or proof route.**

1. Constants are automorphic forms (AF.2/automorphic-form test automorphicForm_const).
2. ∫_{ℚ\𝔸} ψ⁻¹(x)dx = 0 for ψ ≠ 1 (character orthogonality on the compact group ℚ\𝔸, Tau Ceti GlobalNumberFields Layer 5).
3. Constant term along B: ∫_{N(ℚ)\N(𝔸)} 1 dn = 1 ≠ 0.

**Direct prerequisites.** `AF.2/automorphic-representation`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`

**Acceptance.**

- Both (i) and (ii) are the acceptance requirements of the roadmap ('a general reductive automorphic representation need not be generic'; a noncuspidal automorphic form of moderate growth).
- Holomorphic Eisenstein series of weight k≥4 for SL_2(ℤ) are noncuspidal automorphic forms of moderate growth and have nonzero Whittaker/Fourier coefficients σ_{k−1}(n). This does not assert that every constituent of an Eisenstein representation is generic. Their general construction belongs to AS.1.

**Signatures requiring supplier input.** `TauCeti.Automorphic.trivial_not_generic`. The actual trivial adelic automorphic representation and its Whittaker/Fourier coefficient against a nontrivial adelic additive character require AA/GlobalNumberFields and AL genericity exports. Owner/input: AdelicAlgebraicGroups:AA.1; tauceti:TauCetiRoadmap/GlobalNumberFields; AutomorphicLFunctionsAndLocalFactors:AL.3.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.3, Definition 6.13, p. 31. Cuspidality, which constants fail.

### Coefficient-valued holomorphic forms on SL_2 over a totally real field

**Definition** `AF.2/holomorphic-sl2-forms`. Proposed declaration: `TauCeti.Automorphic.SL2.HolomorphicForm`. Module: `TauCeti/Automorphic/AutomorphicForm`. Realises `AF.2`.

Let F_0 be totally real, H = SL_2 and K ⊆ H(𝔸_{0,f}) compact open. A_hol(H(𝔸_0), K, k) is the space of smooth, left H(F_0)-invariant, right K-invariant functions of moderate growth on H(𝔸_0) of parallel weight k under SO(2)^{[F_0:ℚ]} and killed by the lowering operator ½(i 1; 1 −i) at every real place. It is finite-dimensional with a Q̄-structure given by q-expansions at i∞. For a Q̄-vector space W, A_hol(·)_L ⊗_L W is the space of formal Hilbert q-series indexed by the appropriate totally positive fractional ideal (q^{1/N}-series only when F_0=ℚ) with W-coefficients that are finite L-combinations of q-expansions. For φ of weight k and h_f ∈ H(𝔸_{0,f}), φ^♭_{h_f}(τ) = \|a_∞\|^{−k/2}φ(h_∞, h_f) defines a classical holomorphic form for h_fKh_f⁻¹ ∩ H(F_0).

**Hypotheses.** F_0 totally real; k ∈ ℤ; K compact open

**Construction or proof route.**

1. Specialise AF.2/automorphic-form to SL_2/F_0 with the K_∞-type of parallel weight k and the holomorphy condition (which implies Z(𝔤)-finiteness).
2. Finite-dimensionality from AF.2/harish-chandra-finiteness.
3. q-expansion and ℚ-structure: transport through φ ↦ φ^♭ to classical Hilbert modular forms and use the rationality of their q-expansion spaces (for F_0 = ℚ, Mathlib/Tau Ceti modular forms; in general imported from the Hilbert modular forms roadmap through AF.5/gl2-dictionary).
4. Coefficient extension: A_hol(·)_ℚ ⊗_ℚ W ⊆ W[[q^{1/N}]].

**Direct prerequisites.** `AF.2/automorphic-form`, `AF.2/harish-chandra-finiteness`, `AF.2/adelic-classical-bijection`

**Uses.** AF.3/sl2-fourier-vanishing: the vanishing criterion is applied to holomorphic coefficient-valued forms. GrossZagierAndArithmeticHeights:GZ.5: generating series of special cycles are coefficient-valued holomorphic forms (Zhang's AFL approach).

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.SL2.HolomorphicForm` | data | A_hol(H(𝔸_0), K, k) as a finite-dimensional ℂ-vector space. |
| `Automorphic.SL2.HolomorphicForm.qExpansion` | projection | The q-expansion at i∞ and its injectivity. |
| `Automorphic.SL2.HolomorphicForm.rationalStructure` | structure | The ℚ-subspace of forms with rational q-expansion and A_hol ≅ A_hol,ℚ ⊗ ℂ. |
| `Automorphic.SL2.HolomorphicForm.flat` | compatibility | φ ↦ φ^♭_{h_f}, landing in classical holomorphic forms for h_fKh_f⁻¹ ∩ H(F_0). |
| `Automorphic.SL2.HolomorphicForm.coefficient` | constructor | W-valued forms A_hol(·)_L ⊗_L W. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `sl2Hol_weight12` | computation | For F_0 = ℚ, K = SL_2(\hat ℤ), k = 12: dim = 2. |
| `sl2Hol_negative` | degenerate | For k < 0 the space is 0. |
| `sl2Hol_flat_compat` | compatibility | For F_0 = ℚ, φ^♭ of the adelization of f ∈ M_k(SL_2(ℤ)) is f (Mathlib ModularForm). |
| `sl2Hol_not_exp_growth` | non-example | Functions of exponential growth e^{Ca} (Zhang's A_exp for F_0 = ℚ) are not in A_hol: moderate growth fails. |

**Acceptance.**

- For F_0 = ℚ, K = SL_2(\hat ℤ), k = 12: dimension 2, spanned by E_12 and Δ, with q-expansions in ℚ[[q]].
- k < 0 gives 0.

**Signatures requiring supplier input.** `TauCeti.Automorphic.SL2.HolomorphicForm`, `TauCeti.Automorphic.SL2.HolomorphicForm.qExpansion`, `TauCeti.Automorphic.SL2.HolomorphicForm.rationalStructure`, `TauCeti.Automorphic.SL2.HolomorphicForm.flat`, `TauCeti.Automorphic.SL2.HolomorphicForm.coefficient`, `sl2Hol_weight12`, `sl2Hol_negative`, `sl2Hol_flat_compat`, `sl2Hol_not_exp_growth`. Native adelic SL₂ and its rational arithmetic quotient, algebraic coefficient, holomorphic raising/lowering action and q-expansion dictionary must import the existing ModularForms owner. A function on the upper half-plane alone is not the specified adelic coefficient-valued object. Owner/input: AdelicAlgebraicGroups:AA.1–AA.2; tauceti:TauCetiRoadmap/ModularForms; algebraic-group classification gap.

**Sources for this target.**

- Wei Zhang, [Weil representation and arithmetic fundamental lemma](https://arxiv.org/abs/1909.02697), §1.2, (1.12)-(1.13), arXiv p. 7. Notation of §1.2: A_hol(H(𝔸_0), K, k), the Whittaker coefficients W_{φ,ξ} and the expansion (1.13).

### Finite-corner tensor factorization

**Theorem** `AF.2/finite-corner-tensor-factorization`. Proposed declaration: `TauCeti.Automorphic.finiteCornerFactorization`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.2`.

Let A₁ and A₂ be unital complex algebras and V a nonzero finite-dimensional simple A₁⊗_ℂA₂-module. Then V≅V₁⊗_ℂV₂ with each Vᵢ a finite-dimensional simple Aᵢ-module, uniquely up to isomorphism. For an irreducible admissible nondegenerate module over an idempotented algebra, every nonzero finite-dimensional idempotent corner eV is simple over eAe; a proper corner submodule is ruled out by generating it under the full algebra, without assuming it has a complementary submodule.

**Hypotheses.** Finite-dimensional over ℂ, which is algebraically closed. Corner reduction uses a directed approximate identity and nondegeneracy; admissibility makes eV finite-dimensional.

**Construction or proof route.**

1. Choose a simple A₁-submodule S of V. Schur plus an eigenvalue over ℂ identifies End_{A₁}(S) with ℂ; apply the native density theorem to obtain the full End_ℂ(S) image.
2. The commuting A₂ action generates the S-isotypic module V. Evaluation S⊗Hom_{A₁}(S,V)→V is an isomorphism and the multiplicity space is simple over A₂, by simplicity of V.
3. For a corner submodule U⊂eV, form AU. Simplicity gives AU=V and e(AU)=eAe U=U, so U=eV. This handles all invariant subspaces and repairs the direct-sum-only argument in Getz Proposition 7.9.
4. Use the native IsIdempotentElem.Corner carrier for eAe; the tensor-corner identification is supplied by the Hecke/restricted-tensor API.

**Direct prerequisites.** `mathlib:jacobson_density`, `mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective`, `mathlib:LinearMap.bijective_or_eq_zero`, `mathlib:Module.End.exists_eigenvalue`, `mathlib:IsIdempotentElem.Corner`

**Acceptance.**

- For A₁=M_r(ℂ) and A₂=M_s(ℂ), the standard tensor module has dimension rs and the two factors have dimensions r and s.
- For A₂=ℂ the second factor is the one-dimensional scalar module.
- A nonsimple representation need not be an exterior tensor: 1⊗1⊕sgn⊗sgn for C₂×C₂ has a rank-two character matrix.

**Native signature scope.** Native commuting finite-dimensional complex algebra actions and simplicity imply a tensor factorization. Uniqueness and lifting from simple idempotent corners to the infinite restricted nonunital module are separate Flath refinements.

**Sources for this target.**

- D. Flath, [Decomposition of representations into tensor products](https://doi.org/10.1090/pspum/033.1/546596), Theorem 1 and proof, pp.179–180; §1, p.180. Factorization uses finite simple corners and compatibility as idempotents grow; irreducibility is established by generation from an arbitrary corner submodule.

### Archimedean Hecke algebra

**Construction** `AF.2/archimedean-hecke-algebra`. Proposed declaration: `TauCeti.RealReductive.archimedeanHeckeAlgebra`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.2`.

For a compatible pair (𝔤,K), let R(K) be the convolution algebra of K-finite matrix coefficients, embedded as distributions on K using normalized Haar measure. H(𝔤,K) is the convolution algebra of distributions on G supported on K and finite under left and right K translation. As a vector space it identifies with U(𝔤)⊗_{U(𝔨)}R(K), using the differential actions on R(K). For a finite set S of irreducible K-types the sum e_S of their central matrix-coefficient idempotents is an idempotent; the e_S form a directed approximate identity. Compatible locally K-finite (𝔤,K)-modules are the nondegenerate H(𝔤,K)-modules, with (u⊗μ)v=ρ(u)σ(μ)v and e_S projecting to the S-isotypic subspace.

**Hypotheses.** K is compact; 𝔤 is the complexified real tangent Lie algebra with the actual differentiated K action.; The analytic support realization is in the continuous dual of C∞(G) with compact derivative seminorms, whose elements are compactly supported distributions. The test-function LF dual instead contains all distributions and needs an explicit compact-support subspace. The balance uses the actual differentiated inclusion 𝔨→𝔤 and both U(𝔨) actions.

**Construction or proof route.**

1. Import matrix coefficients and compact Haar convolution from CompactGroups. Embed them in the continuous dual of the archimedean test space.
2. Differentiate distributions supported on K. Quotient the algebraic tensor by the balance relations from U(𝔨); PBW and the transverse-order filtration give the vector-space identification. The source states this identification without its full analytic proof, retained as a gap.
3. Convolution gives the multiplication. The finite K-type projectors are compatible idempotents and exhaust each locally K-finite module.
4. Integrated K action and the enveloping action descend through the balance relation. Conversely recover the compatible K and Lie actions from a nondegenerate module.

**Direct prerequisites.** `AF.0/adelic-test-functions`, `AF.1a/gk-pair`, `AF.1a/gk-module`, `mathlib:UniversalEnvelopingAlgebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`

**Uses.** AutomorphicFormsOnReductiveGroups:AF.2/flath-factorization: Encodes archimedean compatible modules as idempotented modules before applying finite-corner factorization. AutomorphicFormsOnReductiveGroups:AF.2/automorphic-forms-module: Integrates the compatible Lie/K actions and supplies finite-type projectors.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `RealReductive.archimedeanHeckeAlgebra` | data | The supported bi-K-finite distribution convolution algebra. |
| `RealReductive.archimedeanHeckeAlgebra.tensorEquiv` | equivalence | U(𝔤)⊗_{U(𝔨)}R(K) identifies with the underlying vector space, with the balance actions specified. |
| `RealReductive.archimedeanHeckeAlgebra.idempotent` | constructor | For irreducible τ, e_τ is dim(τ) times its inverse character density against normalized Haar measure; finite sums e_S are idempotents and e_S e_T=e_S for S⊆T. |
| `RealReductive.archimedeanHeckeAlgebra.moduleEquiv` | equivalence | Compatible locally K-finite modules are precisely nondegenerate modules over the algebra. |
| `RealReductive.archimedeanHeckeAlgebra.action_tmul` | simp | u⊗μ acts by the derived enveloping action after the integrated K action. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `archHecke_compact` | degenerate | When G=K the U(𝔨) balance collapses the tensor carrier to R(K). |
| `archHecke_circle` | computation | For K=U(1), Fourier idempotents satisfy e_m e_n=0 for m≠n and e_n²=e_n; e_n acts as the weight-n projector. |
| `archHecke_not_unital` | non-example | For K=U(1) infinitely many K-types occur, so no finite sum of e_n is an identity for the full algebra. |
| `archHecke_compact_projector` | computation | The actual normalized character distribution of one irreducible compact type is an idempotent. |

**Acceptance.**

- When G=K the U(𝔨) balance collapses the tensor carrier to R(K).
- For K=U(1), Fourier idempotents satisfy e_m e_n=0 for m≠n and e_n²=e_n; e_n acts as the weight-n projector.
- For K=U(1) infinitely many K-types occur, so no finite sum of e_n is an identity for the full algebra.

**Native signature scope.** Native continuous dual of C∞ with derivative seminorm topology, supported bi-K-finite distributions, convolution, local idempotents, actual U(g)/U(k) balance quotient and module-action equivalence signatures. The PBW/transverse-order analytic comparison proof is a recorded gap.

**Sources for this target.**

- D. Flath, [Decomposition of representations into tensor products](https://doi.org/10.1090/pspum/033.1/546596), §2, p.182, number-field case. The archimedean Hecke algebra is an idempotented algebra whose nondegenerate modules encode compatible (g,K)-modules; this supplies the archimedean factors missing from a purely totally disconnected Flath argument.

### Finiteness of the central translation orbit

**Theorem** `AF.2/central-translation-finiteness`. Proposed declaration: `TauCeti.Automorphic.centralTranslationFinite`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.2`.

For every automorphic form φ, the span of {R(z)φ:z∈Z_G(𝔸)} is finite-dimensional. Indeed all central translates lie in the same fixed compact-open level, finite collection of K-types and cofinite enveloping-centre ideal as φ. The central action on this finite-dimensional span splits into finitely many joint generalized characters. This is a consequence of Harish-Chandra fixed-type finiteness, not an inference merely from finite-dimensional derivative orbits.

**Hypotheses.** Connected reductive G over a number field; the polynomial height is translation compatible.; Harish-Chandra fixed-type finiteness is the analytic input; no continuity or topology of a putative dense central-character span is asserted.

**Construction or proof route.**

1. Central translations commute with both K-type projectors and the derived enveloping action, preserve finite-level invariance, and preserve polynomial growth.
2. Apply AF.2/harish-chandra-finiteness to the common fixed-type space; it contains the whole central orbit.
3. A commuting family on a finite-dimensional complex vector space generates a finite-dimensional commutative algebra. Its Artinian primary decomposition gives finitely many joint generalized-character summands.

**Direct prerequisites.** `AF.2/automorphic-form`, `AF.2/harish-chandra-finiteness`

**Acceptance.**

- A Hecke character has a one-dimensional central translation orbit.
- On GL₁, log\|g\| and the constant function span a two-dimensional central orbit; it is generalized-character finite and is not a character eigenline.
- The whole centre orbit stays in a single fixed-type space, even though the centre has infinitely many elements.

**Signatures requiring supplier input.** `TauCeti.Automorphic.centralTranslationFinite`. The native arithmetic real reductive group, fixed K-type/cofinite central ideal finiteness and finite-level quotient are needed. Commuting central operators alone do not prove a finite orbit span. Owner/input: AF.2/harish-chandra-finiteness; AdelicAlgebraicGroups:AA.2; native reductive classification gap.

**Sources for this target.**

- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §4.3(i),(iv), p.195; Theorem 1.7, p.191. The formal central-translation deduction is justified by containment in one fixed-type finite-dimensional space.

## AF.3. Constant terms and cusp forms

The constant term integrates over N_P(F)\N_P(𝔸) with Haar mass one. The native quotient is a left arithmetic quotient, and its integrand descends because the function is left rational-invariant. Rational parabolic conjugation must preserve the quotient measure through the product formula. Nested constant terms require an actual fibre multiplication map and Fubini measure comparison; the generic integral identity does not construct this arithmetic geometry.

Cuspidality is the common kernel for every proper rational parabolic. Empty proper-parabolic families explain the anisotropic case; a nonzero constant term detects failure, and constants fail whenever the family is nonempty. Arithmetic rapid decay uses reduction theory and the original Harish-Chandra estimate. L² and discreteness require a fixed unitary central character and the actual arithmetic Hilbert quotient, supplied to the spectral owner. A cuspidal representation is a discrete constituent, not an arbitrary subquotient of a function space. SL₂ generation and Fourier vanishing import local root groups and the additive adelic quotient.

The Maass test bank uses the native upper-half-plane action, positive Laplacian, hyperbolic measure, cusp condition and divisor Hecke formula. The real-parameter Bessel expansion fixes the factor 2√y and parity/scaling convention. PGL₂ adelization, the exceptional imaginary parameter branch and the exact spectral realization have separate contracts. The numerical source report stays numerical.

**Required refinements for closure.**

- Supply the actual rational parabolic/unipotent quotient family and probability measures from AA, with compatible transitivity; prove smooth/automorphic preservation and maximal-standard-parabolic sufficiency.
- Read Harish-Chandra’s rapid-decay proof and complete the AS L²/discrete-spectrum interfaces with fixed unitary central character. Construct the native cuspidal representations and SL₂/Fourier-vanishing comparisons.
- Finish PGL₂ Maass adelization and the imaginary spectral-parameter Bessel branch. The five DIT eigenvalues remain numerical acceptance data; no exact ordering or simplicity theorem is inferred.

### Compactness of N(F)\N(𝔸) and its normalised measure

**Theorem** `AF.3/unipotent-quotient-compact`. Proposed declaration: `TauCeti.Automorphic.isCompact_unipotentQuotient`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

Let N be a unipotent group over a number field F (for example the unipotent radical N_P of a rational parabolic P). Then N(F) is discrete and cocompact in N(𝔸); N(F)\N(𝔸) carries a unique right N(𝔸)-invariant probability measure dn, and for a normal series N = N_0 ⊇ N_1 ⊇ … ⊇ N_r = 1 with N_i/N_{i+1} ≅ G_a^{d_i} defined over F, integration over N(F)\N(𝔸) is the iterated integral over the (F\𝔸)^{d_i}.

**Hypotheses.** N unipotent over F, in particular F-split (char 0); The standard additive fundamental domain for ℚ\𝔸 is measurable, not a topological product with a half-open interval. The adelic unipotent quotient is compact; its finite-level archimedean quotients, rather than the entire adelic carrier, are finite-dimensional nilmanifolds.

**Construction or proof route.**

1. A unipotent group in characteristic zero has a composition series over F with vector-group quotients (Tau Ceti ReductiveGroups Layer 5).
2. Base case G_a: F discrete and F\𝔸 compact (Tau Ceti GlobalNumberFields Layer 5).
3. Induction: N_{i+1}(𝔸)N(F)/N(F) closed, fibration of compact spaces; strong approximation for unipotent groups (AdelicAlgebraicGroups:AA.4/ga-strong-approximation, AA.3/unipotent-class-number-one).
4. Measure: quotient measure (AdelicAlgebraicGroups:AA.2/quotient-measure) normalised to total mass 1; Fubini in stages (AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity).

**Direct prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`, `AdelicAlgebraicGroups:AA.2/quotient-measure`, `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`, `AdelicAlgebraicGroups:AA.3/unipotent-class-number-one`

**Acceptance.**

- N = G_a over ℚ: ℚ\𝔸_ℚ has a measurable fundamental domain \hat ℤ × [0,1) with total mass 1.
- For the upper unipotent N⊆GL_3, N(F)\N(𝔸) is a compact adelic Heisenberg quotient, fibred over (F\𝔸)² with fibre F\𝔸. Its finite-level real quotients are compact Heisenberg nilmanifolds.

**Signatures requiring supplier input.** `TauCeti.Automorphic.isCompact_unipotentQuotient`. The rational unipotent algebraic group and its adelic points, arithmetic embedding and Haar normalization require AA.1/AA.4. The generic quotient carrier does not select a rational unipotent group. Owner/input: AdelicAlgebraicGroups:AA.1; AdelicAlgebraicGroups:AA.4.

**Sources for this target.**

- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12, (12.1), p. 64. Integration over N_P(ℚ)\N_P(𝔸) in the cuspidality condition.

### Constant term along a parabolic

**Construction** `AF.3/constant-term`. Proposed declaration: `TauCeti.Automorphic.constantTerm`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

Atlas planet: **Constant term**.

For a rational parabolic P = M_P N_P of G and a continuous left G(F)-invariant function φ on G(𝔸), the constant term is φ_P(g) = ∫_{N_P(F)\N_P(𝔸)} φ(ng) dn with the probability measure of AF.3/unipotent-quotient-compact. The integral converges absolutely; φ_P is left M_P(F)N_P(𝔸)-invariant; φ ↦ φ_P commutes with right translation by G(𝔸), with R(X) for X ∈ U(𝔤_∞), with K_∞ and with the Hecke action of C_c^∞(G(𝔸_f)); it maps smooth functions to smooth functions, T_N([G]) to T_N([G]_P), and automorphic forms on G to automorphic forms on [G]_P (Z(𝔤)-finite K_∞-finite functions of uniform moderate growth on M_P(F)N_P(𝔸)\G(𝔸)).

**Hypotheses.** P a proper rational parabolic subgroup with Levi decomposition P = M_P N_P over F; For the stated fibre integral assume φ is continuous (smooth for the smoothness conclusion). Ambient local integrability alone gives no restriction/integrability statement on every lower-dimensional unipotent fibre. P=G is allowed as the identity constant term; cuspidality tests only proper parabolics.

**Construction or proof route.**

1. Convergence: continuity on the compact N_P(F)\N_P(𝔸).
2. Invariance: for m ∈ M_P(F), φ_P(mg) = ∫ φ(n m g) dn = ∫ φ(m (m⁻¹nm) g) dn and m normalises N_P preserving dn.
3. Equivariance: right translations commute with left integration; differentiation under the integral sign; Hecke operators are right convolutions.
4. Growth: ‖ng‖ ≤ ‖n‖‖g‖ with n in a compact fundamental domain of N_P(F)\N_P(𝔸) (AF.0/growth-translation-differentiation).

**Direct prerequisites.** `AF.3/unipotent-quotient-compact`, `AF.0/uniform-moderate-growth-space`, `AF.2/automorphic-form`, `AF.0/finite-hecke-action`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`

**Uses.** AF.3/cusp-form: cuspidality is vanishing of all constant terms. AutomorphicSpectralTheory:AS.1: constant terms of Eisenstein series as Weyl sums of intertwining operators. AutomorphicSpectralTheory:AS.3: Arthur's truncation is built from constant terms and their transitivity. AutomorphicLFunctionsAndLocalFactors:AL.3: the global unfolding for cuspidal data uses vanishing constant terms. MetaplecticAutomorphicForms:MP.5: constant terms of genuine forms on covers.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.constantTerm` | data | φ ↦ φ_P on continuous left G(F)-invariant functions. |
| `Automorphic.constantTerm_leftInvariant` | characterisation | φ_P(m n g) = φ_P(g) for m ∈ M_P(F), n ∈ N_P(𝔸). |
| `Automorphic.constantTerm_rightTranslate` | functoriality | (R(y)φ)_P = R(y)(φ_P), and likewise for R(X), K_∞ and Hecke operators. |
| `Automorphic.constantTerm_automorphic` | structure | φ ∈ A(G) ⇒ φ_P ∈ A_P(G), and T_N([G]) → T_N([G]_P) is continuous. |
| `Automorphic.constantTerm_top` | simp | For P = G, φ_G = φ. |
| `Automorphic.constantTerm_const` | simp | The constant term of the constant function c is c. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `constantTerm_const` | degenerate | For φ ≡ c, φ_P ≡ c for every P. |
| `constantTerm_gl2_eisenstein` | computation | For the weight-k level-one holomorphic Eisenstein series E_k = 1 − (2k/B_k)Σσ_{k−1}(n)q^n, the constant term of its adelization along B at diag(y^{1/2}, y^{−1/2}) is y^{k/2}. |
| `constantTerm_cusp_compat` | compatibility | For f ∈ M_k(SL_2(ℤ)), φ_{f,B} = 0 iff f ∈ S_k(SL_2(ℤ)) (vanishing of a_0, Mathlib CuspForm). |
| `constantTerm_not_full_N` | non-example | For a nontrivial unipotent radical N, its adelic Haar measure has infinite mass, so the nonzero constant function is not integrable on N(𝔸). On N(F)\N(𝔸) its probability integral is the constant itself. |
| `constantTerm_top` | degenerate | For the identity parabolic, N=1, the probability quotient integral returns the original function. |

**Acceptance.**

- For GL_2/ℚ and φ_f attached to f ∈ M_k(SL_2(ℤ)) with Fourier expansion Σ a_n q^n, φ_{f,B}(diag(y^{1/2}, y^{−1/2})) = a_0 y^{k/2}.
- For G = GL_1 there is no proper parabolic: the constant term map is not defined (the set of proper parabolics is empty).

**Native signature scope.** Native integral over the actual left arithmetic quotient Γ_N\N with a supplied invariant probability measure, compactness, continuous integrand and explicit conjugation/fibre measure transport. Full rational-parabolic automorphic preservation and classical examples require AA exports.

**Signatures requiring supplier input.** `TauCeti.Automorphic.constantTerm_automorphic`, `constantTerm_gl2_eisenstein`, `constantTerm_cusp_compat`. Preservation of automorphic central finiteness needs the actual rational parabolic quotient/module identification. GL₂ Eisenstein and classical cusp comparisons additionally need the adelic/classical dictionary. The native left arithmetic quotient integral and its Fubini transport are already stated. Owner/input: AdelicAlgebraicGroups:AA.2–AA.4; AF.5/gl2-dictionary.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.3, Definition 6.13, p. 31. The integral ∫_{N(𝔸)} φ(ng)dn in the definition of cuspidality (over N(F)\N(𝔸)).
- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.7.1, arXiv p. 23. Constant terms φ_Q as maps between spaces of automorphic forms on [G]_P.

### Transitivity and conjugation of constant terms

**Theorem** `AF.3/constant-term-transitivity`. Proposed declaration: `TauCeti.Automorphic.constantTerm_constantTerm`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

(i) For rational parabolics Q ⊆ P, (φ_P)_Q = φ_Q, where the outer constant term is along the parabolic Q ∩ M_P of M_P (equivalently along N_Q, using N_Q = N_P ⋊ (N_Q ∩ M_P)). (ii) For γ ∈ G(F), φ_{γPγ⁻¹}(g) = φ_P(γ⁻¹g). Hence φ_P = 0 for all proper rational P iff φ_P = 0 for all proper standard parabolics (containing a fixed minimal P_0), iff φ_P = 0 for the maximal standard parabolics.

**Hypotheses.** Q ⊆ P rational parabolics; P_0 a minimal rational parabolic (AdelicAlgebraicGroups:AA.3/minimal-parabolic-data)

**Construction or proof route.**

1. (i) Fubini on N_Q(F)\N_Q(𝔸), with base (N_Q∩M_P)(F)\(N_Q∩M_P)(𝔸) and fibre N_P(F)\N_P(𝔸), using compatible normalized quotient measures.
2. (ii) Change of variables n ↦ γnγ⁻¹ and left G(F)-invariance of φ.
3. Every rational parabolic is G(F)-conjugate to a standard one (AdelicAlgebraicGroups:AA.3/minimal-parabolic-data); every proper standard parabolic is contained in a maximal one; apply (i)-(ii).
4. For Q⊆P, N_P⊆N_Q. Integrate over the N_P fibre first and then over the quotient N_Q/N_P; normalized quotient measures and Fubini give (φ_P)_Q=φ_Q.

**Direct prerequisites.** `AF.3/constant-term`, `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`, `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`

**Acceptance.**

- GL_3: φ_{B} = (φ_{P_{2,1}})_{B∩M} for the Borel B ⊆ P_{2,1}.
- GL_2: there is one standard proper parabolic (B), so cuspidality is the single condition φ_B = 0.

**Signatures requiring supplier input.** `TauCeti.Automorphic.constantTerm_constantTerm`. Native nested rational parabolics, their Levi unipotent quotient fibre map and product-formula measure identification are required. The generic multiplication/Fubini input is separately named constantTerm_fibreFormula and does not claim the arithmetic construction. Owner/input: AdelicAlgebraicGroups:AA.4.

**Sources for this target.**

- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601), §2.7.1, arXiv p. 23. Cuspidality tested on proper standard parabolics only.

### Cusp forms

**Definition** `AF.3/cusp-form`. Proposed declaration: `TauCeti.Automorphic.CuspForm`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

Atlas planet: **Cusp form**.

An automorphic form φ ∈ A(G) is cuspidal (a cusp form) if φ_P = 0 for every proper rational parabolic subgroup P of G. A_0(G) ⊆ A(G) is the subspace of cusp forms, stable under the (𝔤, K_∞) × G(𝔸_f)-action. More generally a locally integrable left G(F)-invariant function is cuspidal if its constant terms along proper parabolics vanish almost everywhere; L²_cusp is the closed subspace of L²(G(F)A_G\G(𝔸)) (or L²(G(F)Z(𝔸)\G(𝔸), χ)) of cuspidal functions.

**Hypotheses.** G connected reductive over F

**Construction or proof route.**

1. Kernel of the constant term maps (AF.3/constant-term), intersected over proper parabolics; by AF.3/constant-term-transitivity it suffices to use maximal standard ones, a finite set.
2. Stability under the actions by the equivariance of constant terms.
3. L²-version: constant terms of L² functions are defined almost everywhere by Fubini; the cuspidal subspace is closed and G(𝔸)-invariant.

**Direct prerequisites.** `AF.3/constant-term`, `AF.3/constant-term-transitivity`, `AF.2/automorphic-forms-module`, `AdelicAlgebraicGroups:AA.2/central-character-l2`

**Uses.** AF.3/cusp-form-rapid-decay: cusp forms decay rapidly on Siegel sets. AF.3/cuspidal-spectrum-discrete: the cuspidal spectrum is discrete with finite multiplicities. AutomorphicSpectralTheory:AS.4: the cuspidal part of the spectral decomposition. AutomorphicLFunctionsAndLocalFactors:AL.3: the cusp-form carrier of Rankin–Selberg integrals. GL2AutomorphicRepresentationsAndTransfer:R16.4: cuspidal multiplicity for GL₂. RankZeroOneBSD:BSD.2: cuspidal inputs for Waldspurger/Gross–Zagier.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.CuspForm` | data | The subspace A_0(G) of cuspidal automorphic forms. |
| `Automorphic.CuspForm.constantTerm_eq_zero` | characterisation | φ ∈ A_0(G) ↔ ∀ P proper, φ_P = 0. |
| `Automorphic.CuspForm.iff_maximal_standard` | characterisation | It suffices to test the maximal standard parabolics. |
| `Automorphic.CuspForm.submodule` | structure | A_0(G) is a (𝔤, K_∞) × G(𝔸_f)-submodule of A(G). |
| `Automorphic.L2Cusp` | data | The closed G(𝔸)-invariant subspace L²_cusp of L²(G(F)A_G\G(𝔸)) (and with central character). |
| `Automorphic.CuspForm.classical_compat` | compatibility | For GL_2/ℚ, adelizations of Mathlib CuspForms are cusp forms (AF.5/gl2-dictionary). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `cuspForm_anisotropic` | degenerate | For G anisotropic mod centre, A_0(G) = A(G). |
| `cuspForm_delta` | computation | The adelization of Ramanujan's Δ ∈ S_12(SL_2(ℤ)) is a cusp form on GL_2/ℚ. |
| `cuspForm_const_not` | non-example | The constant function 1 on SL_2(ℚ)\SL_2(𝔸) is not a cusp form (constant term 1). |
| `cuspForm_eisenstein_not` | non-example | The adelization of E_4 is not a cusp form: its constant term along B is nonzero. |
| `cuspForm_nonzero_constantTerm` | non-example | A specified proper-parabolic constant term which is nonzero excludes membership in the cuspidal kernel. |

**Acceptance.**

- For GL_2/ℚ, φ_f is a cusp form iff f is a cusp form at every cusp (AF.5/gl2-dictionary).
- For G anisotropic modulo its centre every automorphic form is cuspidal (AF.3/anisotropic-cuspidal).
- Constant functions are not cusp forms when G has a proper rational parabolic (AF.2/nongeneric-automorphic).

**Native signature scope.** Native kernel of the complete supplied family of proper-parabolic quotient integrals on the actual automorphic function space. Empty-family and nonzero-constant-term tests are actual kernel computations. The arithmetic identification of the family, classical tests and Hilbert cusp space are omitted.

**Signatures requiring supplier input.** `TauCeti.Automorphic.CuspForm.iff_maximal_standard`, `TauCeti.Automorphic.CuspForm.submodule`, `TauCeti.Automorphic.L2Cusp`, `TauCeti.Automorphic.CuspForm.classical_compat`, `cuspForm_delta`, `cuspForm_eisenstein_not`. The native complete rational-parabolic family, fixed unitary central quotient Haar L² carrier and classical cusp/eisenstein dictionaries are required. A supplied indexed family of subgroup integrals defines genuine kernels but does not identify maximal standard parabolics or the discrete Hilbert space. Owner/input: AdelicAlgebraicGroups:AA.2–AA.4; AutomorphicSpectralTheory:AS.0/AS.4; AF.5/gl2-dictionary.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.3, Definition 6.13, p. 31. Definition: vanishing of ∫φ(ng)dn for all parabolic P = MN and all g.
- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12, p. 64. The L² cuspidal subspace.

### Groups anisotropic modulo the centre have no proper rational parabolics

**Theorem** `AF.3/anisotropic-cuspidal`. Proposed declaration: `TauCeti.Automorphic.cuspForm_eq_top_of_anisotropic`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

If G is anisotropic modulo its centre over F (the derived group contains no F-split torus G_m), then G has no proper rational parabolic subgroup; consequently every automorphic form on G is cuspidal, A_0(G) = A(G), and G(F)Z_G(𝔸)\G(𝔸) is compact.

**Hypotheses.** The derived group G^der has F-rank 0

**Construction or proof route.**

1. A proper rational parabolic P is P(λ) for a non-central F-cocharacter λ of G (dynamic description, Tau Ceti ReductiveGroups Layer 7; Tau Ceti defines P(λ)); λ composed with G → G/Z_G gives a nontrivial split torus in G^ad, contradicting anisotropy.
2. Hence the set of proper parabolics is empty and the cuspidality condition is vacuous.
3. Compactness: AdelicAlgebraicGroups:AA.3/compactness-anisotropic (Borel–Harish-Chandra).

**Direct prerequisites.** `AF.3/cusp-form`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3/compactness-anisotropic`

**Acceptance.**

- The multiplicative group D^× of a quaternion division algebra over ℚ: anisotropic modulo the centre, all automorphic forms cuspidal.
- GL_2 over ℚ is not anisotropic modulo centre (the diagonal torus modulo centre is split).

**Signatures requiring supplier input.** `TauCeti.Automorphic.cuspForm_eq_top_of_anisotropic`. The native rational-parabolic family and anisotropy theorem from the reductive owner must establish that the proper family is empty. The empty-family kernel calculation is present as a separate example. Owner/input: tauceti:TauCetiRoadmap/ReductiveGroups; AdelicAlgebraicGroups:AA.4.

**Sources for this target.**

- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12, p. 64. The compact-quotient case.

### Cusp forms are rapidly decreasing

**Theorem** `AF.3/cusp-form-rapid-decay`. Proposed declaration: `TauCeti.Automorphic.CuspForm.rapidDecay`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

Atlas planet: **Rapid decay of cusp forms**.

Let φ ∈ A_0(G) be a cusp form (with a central character, or A_G-invariant). Then φ is rapidly decreasing on Siegel sets: for every Siegel set 𝔖 ⊆ G(𝔸)^1 (AdelicAlgebraicGroups:AA.3/adelic-siegel-set) and every N > 0 there is C with \|φ(g)\| ≤ C‖g‖^{−N} for g ∈ 𝔖; the same holds for all derivatives R(X)φ. In particular φ is bounded on G(F)A_G\G(𝔸), and φ ∈ S([G]) (Schwartz space of [G] modulo A_G).

**Hypotheses.** φ cuspidal automorphic form, normalised by a unitary central character or A_G-invariance; Rapid decay is measured on reduction-theoretic Siegel sets modulo A_∞ with fixed unitary central character. It is not a negative full-height bound along the unconstrained split centre, nor a theorem on an arbitrary subset called a Siegel set.

**Construction or proof route.**

1. On a Siegel set for a minimal parabolic P_0 use the estimate that, for a smooth function of uniform moderate growth, φ(g) − φ_P(g) is rapidly decreasing in the directions where the roots of P grow (Fourier expansion along the abelian quotients of N_P and integration by parts with Lie derivatives).
2. For a cusp form all φ_P vanish, so φ itself decays in every direction of the positive chamber of A_0.
3. Siegel sets cover G(F)\G(𝔸)^1 (AdelicAlgebraicGroups:AA.3/siegel-covering-adelic) and heights on them are controlled by AdelicAlgebraicGroups:AA.3/height-siegel-estimate.
4. Source: Harish-Chandra (LNM 62, Lemma 10) and Moeglin–Waldspurger I.2.18, not freely available; the statement as used is recorded from Arthur and Franke (proof-source gap).

**Direct prerequisites.** `AF.3/cusp-form`, `AF.2/automorphic-forms-uniform-growth`, `AdelicAlgebraicGroups:AA.3/adelic-siegel-set`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`

**Acceptance.**

- For f ∈ S_k(SL_2(ℤ)), y^{k/2}\|f(x+iy)\| → 0 exponentially as y → ∞ (Mathlib exponential decay of cusp forms), which is the SL_2(ℤ) Siegel-set case.
- Fails for noncuspidal forms: the constant function 1 is not rapidly decreasing on a Siegel set of SL_2.

**Signatures requiring supplier input.** `TauCeti.Automorphic.CuspForm.rapidDecay`. Native arithmetic reduction data/Siegel sets, quotient height and rational cuspidality are required for the rapid-decay estimate; an arbitrary subgroup family has no such theorem. The original Harish-Chandra analytic proof remains a source gap. Owner/input: AdelicAlgebraicGroups:AA.3–AA.4; rapid-decay proof gap.

**Sources for this target.**

- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13, p. 70. Definition of rapid decrease on Siegel sets, used for cusp forms.
- Jens Franke, [Harmonic analysis in weighted L2-spaces](https://www.numdam.org/item/ASENS_1998_4_31_2_181_0.pdf), §2, p. 22 of the scan (printed p. 202). Cuspidal functions of moderate growth are rapidly decreasing (Franke's Theorem 5 context).
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §1.8, p.192; §4.4, p.196. The real cusp bound and its adelic transport are stated modulo the split centre with a central character. The rapid-decay proof is referenced to Harish-Chandra §4 and is not reproduced by this article.

### Square integrability of cusp forms

**Theorem** `AF.3/cusp-forms-square-integrable`. Proposed declaration: `TauCeti.Automorphic.CuspForm.memL2`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

If φ is a cusp form with unitary central character χ (or A_G-invariant), then φ ∈ L²(G(F)Z_G(𝔸)\G(𝔸), χ) (resp. L²(G(F)A_G\G(𝔸))), and in fact φ is bounded. The K_∞-finite Z(𝔤)-finite vectors of L²_cusp are cusp forms, A_0(G)_χ ⊆ L²_cusp,χ, and A_0(G)_χ is dense in L²_cusp,χ.

**Hypotheses.** unitary central character χ; Square integrability is on the AA.2 quotient with unitary central character. Residues of Eisenstein series can be square-integrable, so no blanket non-L² assertion is made. The converse smoothness statement requires elliptic regularity for K-finite, Z-finite L² vectors.

**Construction or proof route.**

1. Boundedness from rapid decay on finitely many Siegel sets (AF.3/cusp-form-rapid-decay) and finite volume of G(F)Z_G(𝔸)\G(𝔸) (AdelicAlgebraicGroups:AA.3/finite-volume).
2. Conversely, a K_∞-finite Z(𝔤)-finite L² cuspidal function has moderate growth (Sobolev estimate on smooth vectors of the right regular representation, BPCZ (2.5.4.1)) and is therefore a cusp form.
3. Density: smooth K-finite vectors are dense in any unitary representation (AF.1/k-finite-vectors), and by AF.3/cuspidal-spectrum-discrete each irreducible constituent is admissible with Z(𝔤)-finite K-finite vectors.

**Direct prerequisites.** `AF.3/cusp-form-rapid-decay`, `AdelicAlgebraicGroups:AA.3/finite-volume`, `AdelicAlgebraicGroups:AA.2/central-character-l2`, `AF.1/k-finite-vectors`

**Acceptance.**

- Petersson norms of cusp forms on Γ_0(N) are finite (Tau Ceti ModularForms Layer 3), the GL_2/ℚ case.
- The unitary adelization of the holomorphic Eisenstein series E_4 is not square-integrable; cuspidality is essential. This test says nothing about square-integrable Eisenstein residues.

**Signatures requiring supplier input.** `TauCeti.Automorphic.CuspForm.memL2`. The actual unitary central-character arithmetic Haar quotient and reduction/integrability theorem are required for MemLp. Generic CuspForm kernels have no supplied arithmetic L² measure. Owner/input: AdelicAlgebraicGroups:AA.3; AutomorphicSpectralTheory:AS.0; AF.3/cusp-form-rapid-decay.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.3, p. 32. ∪_{ξ,J} A_0(ξ, J) ⊆ L²_0(G(F)A_G\G(𝔸)) and density.
- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12, Theorem 12.1, p. 64. Used for the density statement.

### Discreteness of the cuspidal spectrum (Gelfand–Graev–Piatetski-Shapiro)

**Theorem** `AF.3/cuspidal-spectrum-discrete`. Proposed declaration: `TauCeti.Automorphic.L2Cusp.discrete`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

Atlas planet: **Discreteness of the cuspidal spectrum**.

For every f ∈ C_c^∞(G(𝔸)) the operator R(f) restricted to L²_cusp(G(F)A_G\G(𝔸)) (or L²_cusp with unitary central character) is compact (Hilbert–Schmidt for suitable f). Consequently L²_cusp decomposes as a Hilbert direct sum ⊕̂_π m_cusp(π)·π of irreducible unitary representations of G(𝔸) with finite multiplicities m_cusp(π) < ∞, and only finitely many π with a given K_∞-type, level J_f and infinitesimal character occur.

**Hypotheses.** G connected reductive over F; unitary central character or A_G-quotient

**Construction or proof route.**

1. Kernel estimate: on cuspidal functions R(f) has kernel Σ_γ f(x⁻¹γy) minus its constant-term corrections; for cuspidal φ the corrections integrate to 0, and the corrected kernel is bounded on Siegel sets × Siegel sets (rapid decay estimate, AF.3/cusp-form-rapid-decay).
2. A bounded kernel on a finite-measure space gives a Hilbert–Schmidt operator, hence compact.
3. Spectral theorem for compact self-adjoint operators R(f * f^*) and an approximate identity give the discrete decomposition with finite multiplicities.
4. Finiteness for fixed (K_∞-type, J_f, χ): each such π contributes to the finite-dimensional space of AF.2/harish-chandra-finiteness.

**Direct prerequisites.** `AF.3/cusp-forms-square-integrable`, `AF.3/cusp-form-rapid-decay`, `AF.0/adelic-test-functions`, `AF.2/harish-chandra-finiteness`, `mathlib:IsCompactOperator`, `AdelicAlgebraicGroups:AA.3/siegel-finiteness-adelic`

**Acceptance.**

- Compact quotient (anisotropic G): the whole L² is discrete (Arthur §1 argument).
- For GL_2/ℚ with trivial central character at level one, the cuspidal spectrum consists of the representations generated by level-one holomorphic and Maass eigenforms, each with multiplicity one (the multiplicity-one statement itself is GL2AutomorphicRepresentationsAndTransfer R16.4's).

**Signatures requiring supplier input.** `TauCeti.Automorphic.L2Cusp.discrete`. The native cuspidal Hilbert representation on the arithmetic central quotient and the AS compact/discrete spectral decomposition interface are required. Owner/input: AutomorphicSpectralTheory:AS.1; AutomorphicSpectralTheory:AS.4.

**Sources for this target.**

- James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12, Theorem 12.1, p. 64. The theorem; Arthur indicates the proof via the compact-quotient argument combined with the vanishing of constant terms.
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §4.6, pp.196–197. The stated cuspidal Hilbert decomposition is discrete with finite multiplicity at fixed unitary central character. The spectral theorem is attributed to Gelfand–Piatetski-Shapiro, whose proof remains a separate obligation.

### Cuspidal automorphic representations

**Definition** `AF.3/cuspidal-automorphic-representation`. Proposed declaration: `TauCeti.Automorphic.CuspidalRepresentation`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

A cuspidal automorphic representation of G(𝔸) (with unitary central character χ) is an irreducible closed G(𝔸)-subrepresentation of L²_cusp,χ, or equivalently (passing to K_∞-finite vectors) an irreducible (𝔤, K_∞) × G(𝔸_f)-submodule of A_0(G)_χ. Its cuspidal multiplicity m_cusp(π) is finite (AF.3/cuspidal-spectrum-discrete). Every cuspidal automorphic representation is an automorphic representation (AF.2/automorphic-representation); subrepresentation, not subquotient, is required.

**Hypotheses.** unitary central character χ; The L² cuspidal category uses a unitary central character. A nonunitary central norm twist is essentially cuspidal, rather than itself a subrepresentation of that unitary Hilbert space. In a function-space prototype the selected subspace itself must be invariant under both Lie and K actions.

**Construction or proof route.**

1. Definition via L²_cusp; the K-finite vectors of an irreducible closed subspace lie in A_0(G) by AF.3/cusp-forms-square-integrable.
2. Equivalence of the L² and (𝔤, K_∞) × G(𝔸_f) formulations by Casselman–Wallach at infinity (AF.1/casselman-wallach-globalization) and admissibility.
3. Non-unitary twists: π ⊗ \|·\|^s of a cuspidal π is 'cuspidal' in the sense of A_0(G) but not unitary; record the convention that cuspidal automorphic representations are unitary up to such twists where the consumer needs it.

**Direct prerequisites.** `AF.3/cuspidal-spectrum-discrete`, `AF.3/cusp-forms-square-integrable`, `AF.2/automorphic-representation`

**Uses.** AF.4/cohomological-representation: cuspidal cohomological representations and their rationality. AutomorphicLFunctionsAndLocalFactors:AL.3: Rankin–Selberg L-functions of cuspidal representations. GL2AutomorphicRepresentationsAndTransfer:R16.4: strong multiplicity one for cuspidal GL₂ representations. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic cuspidal representations of GL_n.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.CuspidalRepresentation` | data | Irreducible closed subrepresentations of L²_cusp,χ (with their K-finite models). |
| `Automorphic.CuspidalRepresentation.multiplicity` | projection | m_cusp(π) ∈ ℕ. |
| `Automorphic.CuspidalRepresentation.toAutomorphic` | coercion | Every cuspidal representation is automorphic. |
| `Automorphic.CuspidalRepresentation.kFinite` | equivalence | Bijection with irreducible submodules of A_0(G)_χ up to isomorphism. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `cuspidalRep_gl1` | degenerate | For GL_1 every unitary Hecke character is a cuspidal automorphic representation. |
| `cuspidalRep_delta` | computation | The representation generated by Δ has π_∞ ≅ D_12(0) and π_p unramified for all p. |
| `cuspidalRep_trivial_not` | non-example | The trivial representation of SL_2(𝔸) is automorphic but not cuspidal. |
| `cuspidalRep_subquotient_not` | non-example | An irreducible subquotient of A_0(G) that is not a submodule is not a cuspidal automorphic representation in this definition (for unitary χ, A_0(G)_χ is semisimple, so the distinction only matters for non-unitary χ). |

**Acceptance.**

- For GL_1, every Hecke character is cuspidal (no proper parabolics).
- For GL_2/ℚ, the representation generated by the adelization of Δ is cuspidal with π_∞ ≅ D_12.

**Signatures requiring supplier input.** `TauCeti.Automorphic.CuspidalRepresentation`, `TauCeti.Automorphic.CuspidalRepresentation.multiplicity`, `TauCeti.Automorphic.CuspidalRepresentation.toAutomorphic`, `TauCeti.Automorphic.CuspidalRepresentation.kFinite`, `cuspidalRep_gl1`, `cuspidalRep_delta`, `cuspidalRep_trivial_not`, `cuspidalRep_subquotient_not`. The native irreducible Hilbert summands of the actual discrete cuspidal spectrum, their smooth/K-finite realization and finite multiplicity are required. The generic automorphic subquotient class is a different carrier. Owner/input: AutomorphicSpectralTheory:AS.4; AF.3/cuspidal-spectrum-discrete; AF.1/casselman-wallach-globalization.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.3, Definition 6.15, p. 32. Definition, with the remark that subrepresentation (not subquotient) is meant.

### Generation of SL_2 by unipotent subgroups

**Theorem** `AF.3/sl2-generation`. Proposed declaration: `TauCeti.Automorphic.SL2.closure_unipotent_eq_top`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

(i) For any field k, SL_2(k) is generated by the upper unipotent subgroup N(k) and any single element of SL_2(k) \ B(k). (ii) For a nonarchimedean local field with ring of integers O and uniformizer ϖ, SL_2 of the field is generated by N(ϖ^{−c−1}O) and N^-(ϖ^cO) for every integer c.

**Hypotheses.** k a field; for (ii) a nonarchimedean local field

**Construction or proof route.**

1. (i) For g∉B with lower-left entry c≠0, upper unipotent row/column operations produce t(c)w∈NgN, not necessarily w. This element conjugates N to N^−. The upper and lower unipotent groups generate SL_2(k) by elementary matrices.
2. (ii) diag(t, t⁻¹) and the Weyl element are products of elements of N(ϖ^{−c−1}O) and N^-(ϖ^cO) by explicit 2×2 identities; then use the Iwasawa/Cartan decompositions of SL_2 (ReductiveGroupsPartII RG2.4).
3. The upper-unipotent Bruhat reduction preserves the lower-left entry c and yields t(c)w, not w unless c has been normalized. Conjugation still takes the upper unipotent to the lower one and elementary generation completes the argument.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.4`, `mathlib:Matrix.SpecialLinearGroup`

**Acceptance.**

- Over 𝔽_2, SL_2(𝔽_2) = GL_2(𝔽_2) ≅ S_3 is generated by (1 1; 0 1) and the non-upper-triangular element (0 1; 1 0).
- Over ℚ_p with c = 0: N(p^{−1}ℤ_p) and N^-(ℤ_p) generate SL_2(ℚ_p), while N(ℤ_p) and N^-(ℤ_p) generate only SL_2(ℤ_p).

**Signatures requiring supplier input.** `TauCeti.Automorphic.SL2.closure_unipotent_eq_top`. Native local/adelic SL₂, elementary root subgroup embeddings and nonarchimedean Cartan/Iwasawa decomposition are RG2 exports. An arbitrary group generated by two supplied subgroups would assume the target. Owner/input: ReductiveGroupsPartII:RG2.4.

**Sources for this target.**

- Wei Zhang, [Weil representation and arithmetic fundamental lemma](https://arxiv.org/abs/1909.02697), §13.3, proof of Lemma 13.6, arXiv p. 64. Statement (i); (ii) is the local generation input [27, Prop. 8.1.2].

### Unit-index Fourier vanishing criterion for SL_2

**Theorem** `AF.3/sl2-fourier-vanishing`. Proposed declaration: `TauCeti.Automorphic.SL2.eq_const_of_fourierCoeff_eq_zero`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

Let F_0 be totally real, ψ = ⊗ψ_v the standard additive character of F_0\𝔸_0, c_v the level of ψ_v, and B a finite set of finite places. Let φ be continuous on H(𝔸_0) = SL_2(𝔸_0), left H(F_0)-invariant and right invariant under K = ∏_{v∤∞}K_v with K_v = m(ϖ_v^{c_v})⁻¹ SL_2(O_v) m(ϖ_v^{c_v}) for v ∈ B (m(a) = diag(a, 1)). With W_{φ,ξ}(h) = ∫_{F_0\𝔸_0} φ(n(b)h)ψ(−ξb)db (db of total mass 1), suppose W_{φ,ξ}(h_∞) = 0 for all h_∞ ∈ H(F_{0,∞}) and all ξ ∈ F_0^× with v(ξ) = 0 for every v ∈ B. Then φ is constant; in particular φ = 0 if φ has parallel weight n ≠ 0.

**Hypotheses.** φ continuous, left H(F_0)-invariant, right K-invariant as stated

**Construction or proof route.**

1. Fourier uniqueness on the compact group F_0\𝔸_0 (Tau Ceti GlobalNumberFields Layer 5 and Pontryagin duality via ψ): a continuous function with all Fourier coefficients zero vanishes.
2. Induction on B (Zhang pp. 956-957): for v_0 ∈ B, average over N(ϖ^{−c−1}O_{v_0}) using K_{v_0}-invariance and ψ_{v_0}(ξb) = 1 when v_0(ξ) ≥ 1, to remove the condition at v_0.
3. Base case: all W_{φ,ξ} vanish for ξ ≠ 0, so φ(h) = W_{φ,0}(h) is left N(𝔸_0)-invariant; together with H(F_0)-invariance and AF.3/sl2-generation (ii) and strong approximation for SL_2 (AdelicAlgebraicGroups:AA.4/strong-approximation-theorem), φ is invariant under a dense subgroup, hence constant.
4. Parallel weight n ≠ 0: a constant function has weight 0.

**Direct prerequisites.** `AF.3/sl2-generation`, `AF.2/holomorphic-sl2-forms`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`

**Acceptance.**

- With B = ∅ the criterion says: a continuous automorphic function on SL_2(𝔸_0) all of whose nonconstant Fourier coefficients vanish identically at infinity is constant.
- The hypothesis on K_v at v ∈ B cannot be dropped: for K_v smaller, coefficients with v(ξ) ≠ 0 can carry a nonzero form.

**Signatures requiring supplier input.** `TauCeti.Automorphic.SL2.eq_const_of_fourierCoeff_eq_zero`. The actual adelic additive quotient Fourier expansion and SL₂ root subgroup action, including the zero-mode character, require GlobalNumberFields/RG2 inputs. No untyped Fourier coefficient family is substituted. Owner/input: tauceti:TauCetiRoadmap/GlobalNumberFields; ReductiveGroupsPartII:RG2.4.

**Sources for this target.**

- Wei Zhang, [Weil representation and arithmetic fundamental lemma](https://arxiv.org/abs/1909.02697), §13.3, Lemma 13.6, arXiv p. 64. Lemma 13.6 as stated, with K_v from (13.3).

### Level-one Hecke–Maass cusp forms and their Hecke operators

**Definition** `AF.3/maass-cusp-forms`. Proposed declaration: `TauCeti.Automorphic.MaassCuspForm`. Module: `TauCeti/Automorphic/ConstantTerm`. Realises `AF.3`.

A level-one Maass cusp form is a smooth SL_2(ℤ)-invariant function φ on the upper half-plane with ‖φ‖² = ⟨φ, φ⟩ < ∞, Δφ = λφ for the hyperbolic Laplacian with λ = 1/4 + r² (r ≥ 0 or r ∈ i(0, 1/2]), and zero constant term at i∞. The weight-zero Hecke operators T_m f(z) = m^{−1/2} Σ_{ad=m, a,d>0} Σ_{b mod d} f((az+b)/d) preserve this space, are self-adjoint and commute, satisfy T_mT_n = Σ_{d \| (m,n)} T_{mn/d²}, and a Hecke–Maass cusp form is a simultaneous eigenfunction, normalised so that φ(z) = 2√y Σ_{n≠0} a(n)K_{ir}(2π\|n\|y)e(nx) with a(1) = 1. Then a(−n) = a(−1)a(n), a(−1) = ±1 (even/odd), a(n) ∈ ℝ, φ(−z̄) = a(−1)φ(z), and T_nφ = a(n)φ. Adelically these are the cusp forms on PGL_2/ℚ of level one with K_∞-type trivial on SO(2), with ‖φ‖ kept distinct from 1 (the normalisation a(1) = 1 is not the L²-normalisation).

**Hypotheses.** level one; weight zero

**Construction or proof route.**

1. Construct the classical smooth SL_2(ℤ)-invariant L² Laplace eigenspace with vanishing constant Fourier coefficient directly on the upper half-plane. The PGL_2 adelization comparison is a subsequent outgoing API, supplied by AF.5 and the PGL_2 dictionary, not an input to this carrier.
2. Fourier expansion in K-Bessel functions: separation of variables for Δ on y > 0 and moderate growth exclude the I-Bessel solutions (K-Bessel integral representation from AutomorphicLFunctionsAndLocalFactors AL.0, per PAPER-ZHANG-21/98's route).
3. Hecke operators as the classical form of AF.0/finite-hecke-action at T_p = [GL_2(ℤ_p) diag(p,1) GL_2(ℤ_p)], normalised by p^{−1/2}; self-adjointness from the Petersson inner product; multiplicativity.
4. Parity: the reflection z ↦ −z̄ commutes with Δ and the T_n, so eigenforms are even or odd, giving a(−n) = a(−1)a(n).

**Direct prerequisites.** `AF.3/cusp-form`, `AF.3/cusp-forms-square-integrable`, `AF.0/finite-hecke-action`, `AutomorphicLFunctionsAndLocalFactors:AL.0`

**Uses.** AutomorphicSpectralTheory:AS.4: the level-one spectral expansion uses the Hecke–Maass basis (DIT (5.1)). AF.3/cuspidal-spectrum-discrete: the level-one cuspidal spectrum of PGL_2/ℚ with SO(2)-type 0.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.MaassCuspForm` | data | Level-one weight-zero Maass cusp forms with eigenvalue λ. |
| `Automorphic.MaassCuspForm.heckeOperator` | constructor | T_m with the normalisation m^{−1/2} Σ_{ad=m} Σ_{b mod d}. |
| `Automorphic.MaassCuspForm.hecke_mul` | relation | T_mT_n = Σ_{d\|(m,n)} T_{mn/d²}. |
| `Automorphic.MaassCuspForm.hecke_selfAdjoint` | structure | T_m is self-adjoint for the Petersson inner product. |
| `Automorphic.MaassCuspForm.fourierCoeff_neg` | relation | a(−n) = a(−1)a(n) with a(−1) = ±1 for a normalised Hecke eigenform. |
| `Automorphic.MaassCuspForm.toAdelic` | compatibility | The adelization is a cusp form on PGL_2/ℚ of level one with T_p acting by p^{1/2}·(adelic Hecke operator) normalisation. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `maass_hecke_mul_prime` | computation | T_pT_p = T_{p²} + T_1 for p prime. |
| `maass_parity_even` | computation | For an even normalized Hecke eigenform, a(−n)=a(n) and reflection z↦−z̄ fixes the form. The third reported numerical eigenform is an acceptance instance, not a formal exact eigenvalue assertion. |
| `maass_constant_not` | non-example | The constant function is a Laplace eigenfunction (λ = 0) of finite norm but is not a cusp form: its constant term is nonzero. |
| `maass_norm_not_one` | non-example | Scaling by c multiplies the Petersson squared norm by \|c\|² and multiplies a(1) by c. Thus a(1)=1 and unit Petersson norm are distinct normalization operations; no assertion that every a(1)-normalized form has norm unequal to one is needed. |

**Acceptance.**

- DIT §5, p.962 reports numerical approximations to the first five level-one eigenvalues: 91.14134, 148.43213, 190.13154, 206.41679 and 260.68740, to five decimal places. It reports the third as even and the others as odd; simplicity is conjectural. These values are a numerical acceptance dataset, not exact spectral existence or ordering theorems.

**Native signature scope.** Native SL₂(ℤ)-invariant smooth upper-half-plane functions, hyperbolic volume on the standard domain, positive Laplacian, L² and zero constant Fourier coefficient; normalized divisor Hecke formula and parity/scaling tests are actual. The Fourier prototype treats real r; the imaginary branch and PGL₂ adelization remain gaps.

**Signatures requiring supplier input.** `TauCeti.Automorphic.MaassCuspForm.toAdelic`. The native PGL₂ adelic automorphic/cuspidal carrier and the weight-zero classical-to-adelic component map are required. The hyperbolic Laplacian, measure, Hecke formula and real spectral-parameter Fourier carrier are native. Owner/input: AdelicAlgebraicGroups:AA.1–AA.2; AF.5/gl2-dictionary.

**Sources for this target.**

- W. Duke, Ö. Imamoḡlu, Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, (5.6)-(5.7), p. 962. Normalisation (5.7) with a(1) = 1 and the parity a(−n) = a(−1)a(n) = ±a(n).
- W. Duke, Ö. Imamoḡlu, Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, p. 962. Definition ('< ∞' and 'i∞' are garbled in the PDF text).

## AF.4. Algebraic weights and rational structures

Algebraic weights belong to the integral character lattice of the algebraic group, including its central/isogeny constraints. Semisimple Lie highest weights alone do not integrate all these modules. A supplied finite-dimensional compatible coefficient gives the native IsCohomologicalWith predicate; the full cohomological predicate additionally requires an irreducible algebraic coefficient. Wigner’s lemma compares the representation’s character with that of the contragredient coefficient. Relative Ext/PBW supplies its proof route. The ℓ₀ invariant uses absolute real Lie-algebra ranks, and q₀ is first a rational dimension formula; reductive parity gives integrality.

Tempered cohomological ranges, Vogan–Zuckerman classification and Clozel purity retain their original group, unitarity and global genericity hypotheses. Coherent cohomology uses the Hodge parabolic and split-central quotient rather than the ordinary compact pair. GSp₄ distinguishes the split and compact lattices, four chambers, noncompact-wall limits and the chosen component. The published Harris correction bounds the degree-vanishing claim; the rejected parameter-uniqueness counterexample is not adopted. Kostant’s characteristic-zero nilradical cohomology has one summand for each minimal left Levi Weyl-coset representative of the appropriate length, with dot-action weight. Compatible Levi action and rational descent are required; no integral or mod-p decomposition follows.

Local ℤ_p stable lattices give a native input to the global O_E coefficient family, which still requires algebraic integration and adelic level data. Rationality fields are fixed fields of finite-part twists. Rational models and Clozel’s cohomological rationality theorem consume the actual ALS/AS comparison. Torsion eigenclasses consume integral Betti and Hecke outputs; transport requires a nonzero reduced class and does not assert a characteristic-zero lift. The local-weight prefix precedes those arithmetic applications to avoid a supplier cycle.

**Required refinements for closure.**

- Obtain integral algebraic highest-weight integration and native coherent Hodge/central/component exports; complete full algebraic/C/L-cohomological signatures beyond supplied-coefficient and GL₂ weight helpers.
- Read/refine the Borel–Wallach, Vogan–Zuckerman, BHR, Clozel, Harris and Schmid/Williams/Mirković proof inputs at their stated scope. Preserve the published Harris degree-vanishing correction and both GSp₄ coordinate lattices.
- Complete global coefficient lattices, normalized finite-part rational structures and torsion cohomology/Hecke comparison using ALS/AS imports. Semilinear reduction needs a nonzero image eigenclass; no integral H¹ torsion or universal characteristic-zero lift is asserted.

### Algebraic weights and the representations V_λ

**Definition** `AF.4/algebraic-weight`. Proposed declaration: `TauCeti.Automorphic.AlgebraicWeight`. Module: `TauCeti/Automorphic/AlgebraicWeight`. Realises `AF.4`.

Atlas planet: **Algebraic highest weight**.

Let G be connected reductive over a number field F, E ⊆ ℂ a number field splitting Res_{F/ℚ}G and containing the values of all embeddings of F used here, and G_ℂ = (Res_{F/ℚ}G)_ℂ = ∏_{σ: F → ℂ} G ×_{F,σ} ℂ with maximal torus T = ∏_σ T_σ and Borel B. An algebraic weight is λ = (λ_σ)_σ ∈ X^*(T) = ⊕_σ X^*(T_σ); it is dominant for B if each λ_σ is. For λ dominant, V_λ = ⊗_σ V_{λ_σ} is the irreducible algebraic representation of Res_{F/ℚ}G over ℂ (defined over E) with highest weight λ. For GL_n, dominant weights are λ_σ = (λ_{σ,1} ≥ … ≥ λ_{σ,n}) ∈ ℤ^n; V_λ^∨ = V_{−w_0λ}. A weight is parallel if λ_σ is independent of σ, and regular if each λ_σ + ρ is regular.

**Hypotheses.** G split over E; fixed Borel pair (B, T) over E; The coefficient field splits Res_{F/ℚ}G and contains the values of all relevant embeddings. ReductiveGroups Layer 1 supplies the comodule carrier, not the integration/highest-weight classification of rational representations of a general split reductive group.

**Construction or proof route.**

1. Use the algebraic-group highest-weight classification for a split reductive group with its integral character lattice. ReductiveGroups Layer 1 supplies representations/comodules, not this classification. LieHighestWeight Layers 4 and 9 supply the semisimple and central Lie-algebra parts; integration to the algebraic group remains an explicit prerequisite gap.
2. Tensor products over the embeddings σ give the representations of Res_{F/ℚ}G_ℂ.
3. Duality V_λ^∨ ≅ V_{−w_0λ} from the longest Weyl element (Tau Ceti RootSystems Layer 4).

**Direct prerequisites.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`, `mathlib:RootPairing`

**Uses.** AF.4/cohomological-representation: coefficient systems V_λ for (𝔤, K)-cohomology. AF.4/coefficient-lattices: integral structures on V_λ. AutomorphicGaloisRepresentationsPartII:AG2.0: dominant weights (ℤ^n)^{Hom(F,Ω),+} and the representations Ξ_a. ArithmeticLocallySymmetricSpaces:ALS.1: local systems from algebraic representations with stable lattices.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.AlgebraicWeight` | data | X^*(T) for the split torus of Res_{F/ℚ}G_ℂ, indexed by embeddings σ. |
| `Automorphic.AlgebraicWeight.IsDominant` | data | Dominance for the fixed Borel. |
| `Automorphic.AlgebraicWeight.rep` | constructor | V_λ as an algebraic representation over E. |
| `Automorphic.AlgebraicWeight.rep_dual` | relation | V_λ^∨ ≅ V_{−w_0λ}. |
| `Automorphic.AlgebraicWeight.IsRegular` | data | λ_σ + ρ regular for all σ. |
| `Automorphic.AlgebraicWeight.rep_highestWeight` | characterisation | V_λ is irreducible with highest weight λ and every irreducible algebraic representation is some V_λ. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `algWeight_gl2_dim` | computation | For GL_2/ℚ and λ = (k−2, 0), dim V_λ = k − 1. |
| `algWeight_zero` | degenerate | λ = 0 gives the trivial representation. |
| `algWeight_dual_gl3` | computation | For GL_3, the dual of V_{(2,1,0)} is V_{(0,−1,−2)}. |
| `algWeight_not_nondominant` | non-example | λ = (0, 1) for GL_2 is not dominant; there is no irreducible representation with highest weight (0,1) for the upper-triangular Borel. |

**Acceptance.**

- GL_2 over ℚ: λ = (k−2, 0) gives V_λ = Sym^{k−2}(std), of dimension k−1.
- GL_1 over a number field F: λ = (n_σ)_σ ∈ ℤ^{Hom(F,ℂ)} with V_λ the character x ↦ ∏_σ σ(x)^{n_σ}.

**Signatures requiring supplier input.** `TauCeti.Automorphic.AlgebraicWeight`, `TauCeti.Automorphic.AlgebraicWeight.IsDominant`, `TauCeti.Automorphic.AlgebraicWeight.rep`, `TauCeti.Automorphic.AlgebraicWeight.rep_dual`, `TauCeti.Automorphic.AlgebraicWeight.IsRegular`, `TauCeti.Automorphic.AlgebraicWeight.rep_highestWeight`, `algWeight_gl2_dim`, `algWeight_zero`, `algWeight_dual_gl3`, `algWeight_not_nondominant`. The integral character lattice with isogeny/central constraint and integration from highest weights to rational reductive-group representations require a genuine group-level classification export. Semisimple Lie modules or comodules alone do not define V_λ. Owner/input: ReductiveGroups, Part II / algebraic-group classification gap; tauceti:TauCetiRoadmap/LieHighestWeight.

**Sources for this target.**

- George Boxer, Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf), §1.3.7, p. 4. Highest-weight representations attached to algebraic weights (here of K_∞ = M_μ(ℝ)).
- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §1.4, arXiv p. 11. Dominant weights of G(ℂ) indexing the coefficient representations V_λ.

### Infinitesimal characters of algebraic weights and uniqueness of the weight

**Theorem** `AF.4/infinitesimal-character-of-weight`. Proposed declaration: `TauCeti.Automorphic.AlgebraicWeight.infChar_rep`. Module: `TauCeti/Automorphic/AlgebraicWeight`. Realises `AF.4`.

For λ dominant, V_λ has infinitesimal character χ_{λ+ρ} (AF.1/infinitesimal-character), and V_λ^∨ has χ_{−w_0(λ)+ρ} = χ_{−(λ+ρ)}. If an admissible (𝔤_∞, K_∞)-module π_∞ has the infinitesimal character of V_λ^∨ for some dominant λ, then λ is unique. For GL_n(F ⊗ ℝ), π_∞ has the infinitesimal character of V_λ^∨ iff the infinitesimal character at σ is the W-orbit of −(λ_σ + ρ), the multiset {−λ_{σ,i} + i − (n+1)/2 : 1 ≤ i ≤ n}.

**Hypotheses.** λ dominant

**Construction or proof route.**

1. Highest-weight normalisation of AF.1/infinitesimal-character (Tau Ceti vermaCentralCharacter).
2. Uniqueness: two dominant weights λ, μ with χ_{λ+ρ} = χ_{μ+ρ} have μ + ρ ∈ W(λ + ρ); both are strictly dominant, so they are equal (Tau Ceti dominantChamber is a strict fundamental domain on the open chamber).
3. Duality: χ_{−w_0(λ)+ρ} = χ_{−w_0(λ+ρ)} = χ_{−(λ+ρ)}.

**Direct prerequisites.** `AF.4/algebraic-weight`, `AF.1/infinitesimal-character`, `tauceti:TauCeti.dominantChamber`, `tauceti:TauCeti.exists_mem_dominantChamber`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`

**Acceptance.**

- GL_2: V_{(k−2,0)} = Sym^{k−2} has infinitesimal character χ_{(k−3/2, −1/2)}, the W-orbit {(k−3/2, −1/2), (−1/2, k−3/2)}.
- Two non-isomorphic algebraic representations have different infinitesimal characters.

**Signatures requiring supplier input.** `TauCeti.Automorphic.AlgebraicWeight.infChar_rep`. The native rational algebraic representation V_λ, Cartan/root datum and normalized Harish-Chandra parameter λ+ρ are required. The centre-character helper does not identify that representation. Owner/input: AF.4/algebraic-weight; AF.1/infinitesimal-character.

**Sources for this target.**

- George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944), §1, arXiv p. 1. Weights of automorphic representations defined through the infinitesimal character of an algebraic representation.
- George Boxer, Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf), §1.3.3, p. 3. Dominant representatives of infinitesimal characters.

### C-algebraic and L-algebraic representations

**Definition** `AF.4/c-l-algebraic`. Proposed declaration: `TauCeti.Automorphic.IsCAlgebraic`. Module: `TauCeti/Automorphic/AlgebraicWeight`. Realises `AF.4`.

Atlas planet: **C-algebraic and L-algebraic**.

At every archimedean embedding, let μ represent the Harish-Chandra-normalized infinitesimal character. L-algebraic means μ∈X^*(T); C-algebraic means μ−ρ∈X^*(T). A Buzzard–Gee twisting element is a Galois-invariant integral weight θ pairing to 1 with each simple coroot. The central rational weight θ−ρ defines the norm twist: π is C-algebraic iff π⊗\|·\|^{θ−ρ} is L-algebraic. For GL_n choose θ=(n−1,n−2,…,0), so θ−ρ=((n−1)/2,…,(n−1)/2) and the twist is \|det\|^{(n−1)/2}. Chenevier–Taïbi’s additional ±1 scalar condition on ℝ^× in the real Weil parameter is a separate normalization/purity convention, not equivalent to bare L-algebraicity.

**Hypotheses.** G connected reductive over F; Borel pair over a splitting field

**Construction or proof route.**

1. State the two integrality conditions on the infinitesimal character parameter.
2. Twisting element for GL_n: \|det\|^{(n−1)/2} shifts the parameter by ((n−1)/2, …, (n−1)/2), turning ρ-integrality into integrality.
3. Comparison with Chenevier–Taïbi's definition via the archimedean correspondence (AF.1/archimedean-llc-gln, property (v)).

**Direct prerequisites.** `AF.4/infinitesimal-character-of-weight`, `AF.1/archimedean-llc-gln`, `AF.1/weil-group-real`

**Uses.** AutomorphicGaloisRepresentationsPartII:AG2.0: C-algebraic/L-algebraic distinction and the half-root twist in the normalisation of r_{π,ι}. AF.4/clozel-purity: purity of algebraic cuspidal representations. GL2AutomorphicRepresentationsAndTransfer:R16.6: the ε·cyclotomic^{k−1} determinant normalisation bridge.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.IsLAlgebraic` | data | Infinitesimal character parameters in X^*(T). |
| `Automorphic.IsCAlgebraic` | data | Infinitesimal character parameters in ρ + X^*(T). |
| `Automorphic.isCAlgebraic_iff_isLAlgebraic_twist` | relation | For GL_n: C-algebraic π ↔ L-algebraic π ⊗ \|det\|^{(n−1)/2}. |
| `Automorphic.isLAlgebraic_iff_of_rho_integral` | characterisation | If ρ ∈ X^*(T) the two notions coincide. |
| `Automorphic.IsAlgebraicCT_compat` | compatibility | Via the archimedean LLC, record Chenevier–Taïbi’s separate scalar ±1 condition on the central ℝ^× in W_ℝ. A comparison after a purity/norm twist requires the common parameter weight and scalar condition as explicit hypotheses; bare L-algebraicity alone is not equivalent. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `algebraic_gl1` | compatibility | For GL_1, C-algebraic = L-algebraic = type A_0 (Tau Ceti HeckeCharacter.IsAlgebraic). |
| `algebraic_trivial_gl2` | computation | The trivial representation of GL_2(𝔸_ℚ) has infinitesimal character (1/2, −1/2): C-algebraic, not L-algebraic; \|det\|^{1/2} is L-algebraic. |
| `algebraic_sl2_rho_integral` | degenerate | For SL_2, X^*(T) = ℤ·(α/2) contains ρ = α/2, so C- and L-algebraic agree; for PGL_2, X^*(T) = ℤα does not contain ρ and they differ. |
| `algebraic_maass_not` | non-example | A Maass cusp form with Laplace eigenvalue 1/4 + r², r > 0 real, has infinitesimal character (ir, −ir) and is neither C- nor L-algebraic. |

**Acceptance.**

- GL_2/ℚ: for a weight-k newform with the unitary normalisation, π_∞ = D_k has infinitesimal character ((k−1)/2, −(k−1)/2); for k even π is C-algebraic and not L-algebraic, and π ⊗ \|det\|^{1/2} is L-algebraic.
- GL_1: a Hecke character is C-algebraic iff L-algebraic iff of Weil type A_0 (Tau Ceti GlobalNumberFields Layer 10 HeckeCharacter.IsAlgebraic).

**Signatures requiring supplier input.** `TauCeti.Automorphic.IsCAlgebraic`, `TauCeti.Automorphic.IsLAlgebraic`, `TauCeti.Automorphic.isCAlgebraic_iff_isLAlgebraic_twist`, `TauCeti.Automorphic.isLAlgebraic_iff_of_rho_integral`, `TauCeti.Automorphic.IsAlgebraicCT_compat`, `algebraic_gl1`, `algebraic_trivial_gl2`, `algebraic_sl2_rho_integral`, `algebraic_maass_not`. The actual reductive torus character lattice, ρ-shift and all archimedean classified Langlands/Harish-Chandra parameters are required to distinguish C- and L-algebraic representations. Owner/input: AF.4/algebraic-weight; AF.1/archimedean-llc-gln; native reductive classification gap.

**Sources for this target.**

- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §2.1, arXiv p. 13. Algebraicity at infinity for GL_n(ℝ).
- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §1.2, arXiv p. 5. Algebraicity of cuspidal π of PGL_m (the PDF renders ½ℤ as '21 Z').
- Kevin Buzzard; Toby Gee, [The conjectural connections between automorphic representations and Galois representations](https://arxiv.org/pdf/1009.0785v3), §5.2, Proposition 5.2.2, p.27. δ denotes the half-sum ρ; θ is the integral twisting element, and θ−δ is the central rational twist.

### Cohomological representations

**Definition** `AF.4/cohomological-representation`. Proposed declaration: `TauCeti.Automorphic.IsCohomological`. Module: `TauCeti/Automorphic/Cohomological`. Realises `AF.4`.

Atlas planet: **Cohomological representation**.

An irreducible admissible archimedean module π is cohomological if H^•(𝔤,K;π⊗V)≠0 for an irreducible finite-dimensional algebraic representation V of Res_{F/ℚ}G. An automorphic representation is cohomological when its infinite part is. Wigner’s lemma forces the infinitesimal character of π to equal that of V^∨. With the connected complex reductive group and character lattice fixed, V is uniquely determined; an arbitrary twist of its K-component action need not be algebraic.

**Hypotheses.** G connected reductive over F, K_∞ maximal compact

**Construction or proof route.**

1. Predicate defined via AF.1a/relative-lie-cochain-complex with coefficients π_∞ ⊗ V (tensor product of a (𝔤, K)-module with a finite-dimensional one).
2. For disconnected K_∞ record both H^•(𝔤, K_∞) and H^•(𝔤, K_∞°) (the component group acts on the latter).

**Direct prerequisites.** `AF.1a/relative-lie-cochain-complex`, `AF.4/algebraic-weight`, `AF.1/admissible-gk-module`, `AF.4/cohomological-with-coefficient`

**Uses.** AF.4/borel-wallach-tempered-range: degrees of cohomology of tempered cohomological representations. AF.4/clozel-rationality: rationality of cohomological cuspidal representations. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic = cohomological for GL_n. ArithmeticLocallySymmetricSpaces:ALS.5: cuspidal cohomology of X_K decomposes over cohomological π.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.IsCohomological` | data | ∃ V irreducible algebraic, H^•(𝔤, K; π ⊗ V) ≠ 0. |
| `Automorphic.IsCohomological.coefficient` | projection | The unique algebraic coefficient V with the connected complex reductive group and integral character lattice fixed. Disconnected K changes invariant cohomology, not uniqueness of the algebraic coefficient. |
| `Automorphic.IsCohomological.infChar` | characterisation | π cohomological for V ⇒ π has the infinitesimal character of V^∨. |
| `Automorphic.IsCohomological.twist` | functoriality | Twisting π by an algebraic character χ changes V to V ⊗ χ^{-1}. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `cohomological_trivial` | degenerate | The trivial representation is cohomological for V = ℂ (H^0 = ℂ). |
| `cohomological_D_k` | computation | For D_k(μ) on GL_2(ℝ), an algebraic coefficient of highest weight (a,b) must satisfy a−b=k−2 and a+b=−μ. Thus D_k(0) is cohomological exactly for even k≥2, with Sym^{k−2}⊗det^{(2−k)/2}; D_k(2−k) is cohomological with Sym^{k−2} for every k≥2. |
| `cohomological_D1_not` | non-example | The limit of discrete series D_1 of GL_2(ℝ) is not cohomological: its infinitesimal character (0, 0) is not that of any V^∨ (which would need (a + 1/2, b − 1/2) with a ≥ b). |
| `cohomological_ip_compat` | compatibility | For unitary π the definition agrees with Ichino–Prasanna §7.1 (Vogan–Zuckerman's class). |

**Acceptance.**

- Finite-dimensional V^∨ itself is cohomological for V (H^0 ≠ 0).
- For D_k(2−k), coefficient V=Sym^{k−2} gives two degree-1 classes for (𝔤𝔩_2,SO(2)A_∞), and one after the full O(2) invariants. For unitary D_k(0), replace V by Sym^{k−2}⊗det^{(2−k)/2}, requiring even k≥2.

**Signatures requiring supplier input.** `TauCeti.Automorphic.IsCohomological`, `TauCeti.Automorphic.IsCohomological.coefficient`, `TauCeti.Automorphic.IsCohomological.infChar`, `TauCeti.Automorphic.IsCohomological.twist`, `cohomological_trivial`, `cohomological_D_k`, `cohomological_D1_not`, `cohomological_ip_compat`. The native irreducible algebraic coefficient family V_λ and classified representation require the group-level integration export. IsCohomologicalWith has a separately supplied finite-dimensional coefficient and is not counted as this unrestricted algebraic predicate. Owner/input: AF.4/algebraic-weight; algebraic-group classification gap.

**Sources for this target.**

- Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet-Langlands correspondence](https://arxiv.org/abs/1806.10563), §7.1, arXiv p. 40. Definition (for unitary π, the case classified by Vogan–Zuckerman).

### Wigner's lemma

**Theorem** `AF.4/wigner-lemma`. Proposed declaration: `TauCeti.Automorphic.infChar_eq_of_relativeCohomology_ne_zero`. Module: `TauCeti/Automorphic/Cohomological`. Realises `AF.4`.

Let V be an admissible (𝔤, K)-module with infinitesimal character χ and F a finite-dimensional (𝔤, K)-module with infinitesimal character χ_F. If H^•(𝔤, K; V ⊗ F^∨) ≠ 0 (equivalently Ext^•_{(𝔤,K)}(F, V) ≠ 0), then χ = χ_F. More generally Z(𝔤) acts on H^•(𝔤, K; V ⊗ F^∨) through both χ and χ_F, so the cohomology vanishes unless they agree. In addition, if z∈Z(G)∩K acts on V and F through distinct scalars, every relative cochain with coefficients V⊗F^∨ is zero: Ad(z) is trivial on 𝔤/𝔨 while its coefficient action is the nontrivial ratio of those scalars. For the split central Lie algebra the corresponding balancing condition is already forced by equality of infinitesimal characters.

**Hypotheses.** V, F as stated; The dual central action is induced by the genuine principal anti-automorphism X↦−X of U(𝔤), restricted to its centre. An arbitrary algebra endomorphism is not a substitute for that action.

**Construction or proof route.**

1. H^•(𝔤, K; V ⊗ F^∨) = Ext^•_{(𝔤,K)}(F, V) (AF.1a/relative-cohomology-functoriality (iv)).
2. Z(𝔤) acts on Ext^•(F, V) through its action on either argument (Yoneda: centre acts on the category by natural endomorphisms).
3. If χ ≠ χ_F pick z with χ(z) ≠ χ_F(z); z − χ(z) acts by 0 and by χ_F(z) − χ(z) ≠ 0, so Ext vanishes.
4. For the finite/compact central-character obstruction, apply K-invariance of a relative cochain to z∈Z(G)∩K. Its trivial adjoint action leaves only the ratio of the two scalar coefficient characters, so a nontrivial ratio annihilates every cochain.

**Direct prerequisites.** `AF.1a/relative-cohomology-functoriality`, `AF.1/infinitesimal-character`

**Acceptance.**

- H^•(𝔰𝔩_2, SO(2); D_k ⊗ Sym^{m}) = 0 unless m = k − 2.
- For G compact, H^0(𝔤, K; V ⊗ F^∨) = Hom_G(F, V) and the lemma is Schur's lemma for infinitesimal characters.

**Native signature scope.** Native tensor-cohomology central-character equality for a supplied compatible finite coefficient, using the contragredient character. The relative Ext/PBW proof is a gap; this statement does not assume that every coefficient integrates algebraically.

**Sources for this target.**

- Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet-Langlands correspondence](https://arxiv.org/abs/1806.10563), §7.1, arXiv p. 40. Context: nonvanishing forces the infinitesimal character of F^∨ (Borel–Wallach I.4.1, as used).
- G. Harder, A. Raghuram, [Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §3.1.4, p.17; §3.1.5, Proposition 3.11, p.19. The infinitesimal-character constraint and the separate component/central-character action in the cohomological GL_n application.

### The invariants ℓ₀ and q₀

**Definition** `AF.4/l0-q0-invariants`. Proposed declaration: `TauCeti.Automorphic.ell0`. Module: `TauCeti/Automorphic/Cohomological`. Realises `AF.4`.

For a real reductive group (G_∞, K_∞) with A_∞ the identity component of the real points of the maximal ℚ-split torus in the centre of Res_{F/ℚ}G: ℓ₀ = rank G_∞ − rank K_∞ − rank A_∞ (absolute ranks of real Lie groups: dimensions of Cartan subalgebras), and q₀ is defined by 2q₀ + ℓ₀ = dim G_∞/K_∞A_∞, the dimension of the symmetric space. For Res_{F/ℚ}PGL_n with F of signature (r_1, r_2): ℓ₀ = r_1·⌊(n−1)/2⌋ + r_2(n−1) (that is r_1(n−1)/2 for n odd, r_1(n−2)/2 for n even, plus r_2(n−1)) and 2q₀ + ℓ₀ = r_1(n² − 1 − n(n−1)/2) + r_2(n² − 1). For F imaginary CM of degree 2d: ℓ₀ = d(n − 1), 2q₀ + ℓ₀ = d(n² − 1), q₀ = d(n² − n)/2. For PGL_2 over a number field H, ℓ₀ = r_2(H), the number of complex places.

**Hypotheses.** G_∞ real reductive with maximal compact K_∞; A_∞ is the connected real points of the maximal ℚ-split central torus of Res_{F/ℚ}G. Compactness modulo the full real centre is a different condition; e.g. a real-quadratic restriction-of-scalars torus has a larger real centre than A_∞.

**Construction or proof route.**

1. Absolute ranks via Mathlib LieAlgebra.rank of the complexified Lie algebras (rank SL_n(ℝ) = n − 1, rank SO_n(ℝ) = ⌊n/2⌋, rank SL_n(ℂ) = 2(n−1) as a real group, rank SU_n = n − 1).
2. Dimensions: dim SL_n(ℝ) − dim SO_n(ℝ) = n² − 1 − n(n−1)/2; dim SL_n(ℂ) − dim SU_n = n² − 1.
3. Signature bookkeeping from Mathlib NumberField.InfinitePlace (nrRealPlaces + 2·nrComplexPlaces = [F:ℚ]); for H ⊋ F with F imaginary quadratic, r_2(H) = [H:ℚ]/2 ≥ 2.

**Direct prerequisites.** `AF.1/real-reductive-group`, `mathlib:LieAlgebra.rank`, `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`

**Uses.** AF.4/borel-wallach-tempered-range: the degree range [q₀, q₀ + ℓ₀]. GL2ModularityLifting:R32.3: ℓ₀ > 0 patching (Calegari–Geraghty) for PGL_2 over imaginary quadratic fields. ArithmeticLocallySymmetricSpaces:ALS.0: dim X_K = 2q₀ + ℓ₀.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.ell0` | data | ℓ₀ = rank G_∞ − rank K_∞ − rank A_∞. |
| `Automorphic.q0` | data | q₀ with 2q₀ + ℓ₀ = dim G_∞/K_∞A_∞. |
| `Automorphic.ell0_resPGL` | example | The closed formula for Res_{F/ℚ}PGL_n in terms of (r_1, r_2) and n. |
| `Automorphic.ell0_PGL2` | example | ℓ₀(Res_{H/ℚ}PGL_2) = r_2(H). |
| `Automorphic.two_q0_add_ell0` | characterisation | 2q₀ + ℓ₀ is the dimension of the symmetric space, so q₀ is an integer. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `ell0_PGL2_Q` | computation | ℓ₀(PGL_2/ℚ) = 0 and q₀ = 1. |
| `ell0_imag_quad` | computation | ℓ₀(Res_{F/ℚ}PGL_2) = 1, q₀ = 1 for F imaginary quadratic. |
| `ell0_compact` | degenerate | For an actually compact real group G(F_∞), A_∞ is trivial, ℓ₀=0 and q₀=0. Compactness modulo the full real centre alone is insufficient. |
| `ell0_not_split_rank` | non-example | Reading 'rank' as ℝ-split rank gives the wrong value: for SL_2(ℂ), split rank 1 and rank SU_2 = 1 would give ℓ₀ = 0, but the absolute rank of SL_2(ℂ) as a real group is 2, giving ℓ₀ = 1. |
| `pglRanks_Q_numeric` | computation | The PGL_n rank/dimension formulas at (r₁,r₂,n)=(1,0,2) give ℓ₀=0 and q₀=1. Actual identification with the arithmetic real group is required separately. |
| `pglRanks_imagQuad_numeric` | computation | The rank/dimension formulas at (0,1,2) give ℓ₀=1 and q₀=1, prior to identifying the imaginary-quadratic real group. |
| `pglRanks_absolute_not_split_numeric` | non-example | At one complex place the absolute-rank PGL₂ formula gives one; substituting the displayed split-rank difference 1−1 gives zero. This is a numerical convention test, not the Lie-algebra rank-identification theorem. |

**Acceptance.**

- PGL_2/ℚ: ℓ₀ = 0, q₀ = 1 (the upper half-plane).
- PGL_2 over an imaginary quadratic field: ℓ₀ = 1, q₀ = 1 (hyperbolic 3-space, cohomology in degrees 1 and 2).
- PGL_3/ℚ: ℓ₀ = 1, 2q₀ + ℓ₀ = 5, q₀ = 2.

**Native signature scope.** Native absolute LieAlgebra.rank differences and rational q₀ dimension relation; integrality is a separate hypothesis/theorem. PGL_n/field-signature formulas are tested as numeric formulas with supplied Lie ranks/dimensions; actual arithmetic group identification remains a supplier requirement. The original arithmetic examples are omitted by name; the native formula examples have distinct pglRanks names.

**Signatures requiring supplier input.** `ell0_PGL2_Q`, `ell0_imag_quad`, `ell0_not_split_rank`. The actual arithmetic real group, its compact/split-central Lie algebras and their absolute ranks/dimensions require the realPoints/ALS.0 export. The PGL_n formula computations have separately named numeric tests and are not counted as these group-identification examples. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.0; AF.1/real-points-lie-group.

**Sources for this target.**

- Frank Calegari, David Geraghty, [Modularity lifting beyond the Taylor-Wiles method](https://arxiv.org/abs/1207.4224), §8.4, arXiv p. 80. Definition and meaning of ℓ₀ and q₀ for Res_{F/ℚ}PGL(n).
- Frank Calegari, David Geraghty, [Modularity lifting beyond the Taylor-Wiles method](https://arxiv.org/abs/1207.4224), §1, arXiv p. 3. The general invariant (printed with rank(G); read as ranks of real Lie groups, PAPER-CALEGARI-GERAGHTY-18 E2).
- Frank Calegari, David Geraghty, Michael Harris, [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/abs/1907.08694v1), Standalone §3.1 (published §A.3.1), arXiv p. 4. The imaginary CM case.

### Cohomology of tempered cohomological representations (Borel–Wallach)

**Theorem** `AF.4/borel-wallach-tempered-range`. Proposed declaration: `TauCeti.Automorphic.relativeCohomology_tempered_range`. Module: `TauCeti/Automorphic/Cohomological`. Realises `AF.4`.

Atlas planet: **Borel–Wallach tempered range**.

For an irreducible tempered cohomological module π and a central-balanced algebraic coefficient V (A_∞ acts trivially on π⊗V), use the split-centre-quotiented pair (𝔤/𝔞_∞,K_∞°), equivalently (𝔤,K_∞°A_∞). The cited tempered cohomology range is [q₀,q₀+ℓ₀], with dimensions binom(ℓ₀,i) times the bottom multiplicity. The raw pair (𝔤,K_∞°) includes the exterior cohomology of the split central Lie algebra and does not satisfy this range without that adjustment. The automorphic comparison is conditional on the ALS/AS supplier statements.

**Hypotheses.** π_∞ tempered and cohomological

**Construction or proof route.**

1. Tempered cohomological representations are fundamental series: π_∞ = Ind_P^G(δ ⊗ ν) with δ a discrete series (or limit) of the Levi of the fundamental parabolic and ν unitary (AF.1/langlands-classification, AF.1/discrete-series).
2. Delorme's lemma (Shapiro for (𝔤,K)-cohomology of induced modules) reduces to the discrete series of the Levi, which has cohomology in the middle degree only, tensored with ∧^•(𝔞^*) of the split part, giving binom(ℓ₀, i).
3. Proof sources Borel–Wallach III.5.1 and VII.6.7 are not freely available: recorded with the proof route (gap).

**Direct prerequisites.** `AF.4/cohomological-representation`, `AF.4/l0-q0-invariants`, `AF.1/tempered-square-integrable`, `AF.1/langlands-classification`, `AF.4/wigner-lemma`

**Acceptance.**

- PGL_2 over an imaginary quadratic field: tempered cohomological π_∞ contribute in degrees 1 and 2 (ℓ₀ = 1, q₀ = 1).
- PGL_2/ℚ: D_k contributes in degree 1 only (ℓ₀ = 0, q₀ = 1).
- The trivial representation of PGL_2/ℚ (non-tempered) contributes in degrees 0 and 2, outside [1, 1].

**Signatures requiring supplier input.** `TauCeti.Automorphic.relativeCohomology_tempered_range`. The native arithmetic real reductive datum and cohomological unitary/tempered representation with its compact-centre quotient are required for the cohomological range. Generic Lie ranks alone do not assert the theorem. Owner/input: AF.1/real-reductive-group; AF.4/cohomological-representation; Borel–Wallach proof gap.

**Sources for this target.**

- Frank Calegari, David Geraghty, [Modularity lifting beyond the Taylor-Wiles method](https://arxiv.org/abs/1207.4224), §8.4, arXiv p. 80. The tempered range, citing Borel–Wallach [9] Theorem VII.6.7.
- Frank Calegari, David Geraghty, Michael Harris, [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/abs/1907.08694v1), Standalone §3.1 (published §A.3.1), proof of Lemma 3.1 (published Lemma A.3), arXiv p. 5. Cohomology outside [q₀, q₀ + ℓ₀] comes from non-tempered Π.
- G. Harder, A. Raghuram, [Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §3.1.5, Proposition 3.11 and its proof, p.19. Source-scoped GL_n check: bottom and top degrees, the exterior factor z/s and component-group multiplicities; not a proof of the whole general reductive tempered theorem.

### Vogan–Zuckerman classification of unitary cohomological representations

**Theorem** `AF.4/vogan-zuckerman`. Proposed declaration: `TauCeti.Automorphic.voganZuckerman`. Module: `TauCeti/Automorphic/Cohomological`. Realises `AF.4`.

Let G be connected real reductive with maximal compact K, 𝔤 = 𝔨 ⊕ 𝔭, and 𝔱 ⊆ 𝔨 a Cartan subalgebra. For a θ-stable parabolic 𝔮 = 𝔩 ⊕ 𝔲 (non-negative eigenspaces of ad x, x ∈ i𝔱_0) and λ ∈ 𝔩^* the differential of a unitary character of L with ⟨α, λ\|_𝔱⟩ ≥ 0 for α ∈ Δ(𝔲), there is a unique irreducible unitary (𝔤, K)-module A_𝔮(λ) with infinitesimal character λ\|_𝔱 + ρ containing the K-type of highest weight λ\|_𝔱 + 2ρ(𝔲 ∩ 𝔭), all of whose K-types have highest weights λ\|_𝔱 + 2ρ(𝔲∩𝔭) + Σ_{α ∈ Δ(𝔲∩𝔭)} n_α α (n_α ≥ 0). Every irreducible unitary (𝔤, K)-module π with H^•(𝔤, K; π ⊗ F^∗) ≠ 0 for an irreducible finite-dimensional F of highest weight γ is some A_𝔮(λ) with λ\|_𝔱 = γ, and H^i(𝔤, K; A_𝔮(λ) ⊗ F^∗) ≅ Hom_{L∩K}(∧^{i−R}(𝔩 ∩ 𝔭), ℂ) with R = dim(𝔲 ∩ 𝔭). When G/K is Hermitian, 𝔭 = 𝔭^+ ⊕ 𝔭^−, and with R^± = dim(𝔲 ∩ 𝔭^±), H^{p,q}(𝔤, K; A_𝔮(λ) ⊗ F^∗) ≅ Hom_{L∩K}(∧^{2i}(𝔩 ∩ 𝔭), ℂ) for (p,q) = (i + R^+, i + R^−), and H^{p,q} = 0 if p − q ≠ R^+ − R^−.

**Hypotheses.** G connected; π unitary irreducible; For the statement quoted from Ichino–Prasanna §7.1, restrict to its equal-rank Hermitian setting after the specified central quotient. A compact Cartan 𝔱⊆𝔨 is not available for every connected real reductive group. The general Cartan 𝔱⊕𝔞 version requires a separate verified statement.

**Construction or proof route.**

1. Construction of A_𝔮(λ) by cohomological induction (Zuckerman functors) and unitarity (Vogan).
2. Classification: Vogan–Zuckerman 1984, Theorem 5.6 (and Theorem 5.3 for the K-types); cohomology computation Theorem 3.3/Proposition 6.19 for the Hodge decomposition.
3. Statements recorded from Ichino–Prasanna §7.1, who quote Vogan–Zuckerman; the scanned original was consulted for orientation (gap for a full proof decomposition).

**Direct prerequisites.** `AF.4/cohomological-representation`, `AF.4/wigner-lemma`, `AF.1/real-reductive-group`, `AF.1/infinitesimal-character`

**Acceptance.**

- SL_2(ℝ): 𝔮 = 𝔤 gives the trivial representation (A_𝔤(0) = ℂ); 𝔮 = Borel θ-stable gives D_2^± with H^1 one-dimensional of Hodge type (1,0) resp. (0,1).
- For U(p, q) the A_𝔮(λ) with 𝔩 = 𝔲(p_1, q_1) ⊕ 𝔲(p_2, q_2) contribute to the Hodge types predicted by (R^+, R^−).

**Signatures requiring supplier input.** `TauCeti.Automorphic.voganZuckerman`. The native θ-stable parabolic, Levi central character, cohomological induction A_q(λ) and unitary classified module are required. A generic pair cannot label these constructors. Owner/input: AF.1/real-reductive-group; reductive classification gap.

**Sources for this target.**

- Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet-Langlands correspondence](https://arxiv.org/abs/1806.10563), §7.1, arXiv p. 40. The classification, with the modules A_𝔮(λ) and their cohomology stated in §7.1.
- David A. Vogan Jr., Gregg J. Zuckerman, [Unitary representations with non-zero cohomology](https://www.numdam.org/item/CM_1984__53_1_51_0.pdf), Theorem 5.6 and Proposition 6.19 (Numdam scan). Title of the source of the classification and Hodge computation.

### Tempered cohomological representations of GL_n(ℝ) (Clozel)

**Theorem** `AF.4/gln-tempered-cohomological`. Proposed declaration: `TauCeti.Automorphic.GLn.temperedCohomological`. Module: `TauCeti/Automorphic/Cohomological`. Realises `AF.4`.

Let π_∞ be a tempered irreducible representation of GL_n(ℝ) with the infinitesimal character of the trivial representation and nonzero (𝔤𝔩_n, SO(n))-cohomology. If n is even, π_∞ is unique up to isomorphism, its restriction to GL_n(ℝ)° is a sum of two irreducibles, and its (𝔤𝔩_n, SO(n))-cohomology is a free ℂ[O(n)/SO(n)] ≅ ℂ[ℤ/2]-module. If n is odd, there are exactly two such π_∞, differing by the sign character, and O(n)/SO(n) acts on the cohomology of one trivially and of the other by −1. If π is a cuspidal automorphic representation of GL_n/ℚ of weight zero (π_∞ with trivial infinitesimal character), then π_∞ is one of these, in particular H^•(𝔰𝔩_n, SO(n); π_∞) ≠ 0.

**Hypotheses.** π_∞ tempered; infinitesimal character ρ

**Construction or proof route.**

1. Tempered representations of GL_n(ℝ) with regular integral infinitesimal character: by AF.1/archimedean-llc-gln, the parameter is ⊕ of Ind(z^{p}z̄^{−p}) with distinct p ∈ ½ℤ_{>0} plus, for n odd, a character sgn^ε; determined by the infinitesimal character except for ε.
2. Cohomology: fundamental series (AF.4/borel-wallach-tempered-range) and the O(n)/SO(n) action through the central character at −1 (n odd) or the two components (n even); Clozel Lemme 3.14.
3. Cuspidal case: π_∞ is generic and unitary, hence by Vogan's classification (AF.1/vogan-generic-unitary-dual) and Clozel's purity (AF.4/clozel-purity) tempered.

**Direct prerequisites.** `AF.4/borel-wallach-tempered-range`, `AF.1/archimedean-llc-gln`, `AF.1/vogan-generic-unitary-dual`, `AF.4/clozel-purity`

**Acceptance.**

- n = 2: π_∞ = D_2, and H^1(𝔤𝔩_2, SO(2); D_2) ≅ ℂ[ℤ/2] (holomorphic and antiholomorphic classes exchanged by the reflection).
- For n=1 and π_∞∈{1,sgn}, the raw pair (𝔤𝔩_1,K°) has H^0=H^1=ℂ. Quotienting by A_∞ leaves only degree 0. The component O(1)/SO(1) acts by π_∞(−1).

**Signatures requiring supplier input.** `TauCeti.Automorphic.GLn.temperedCohomological`. The native GL_n tempered/cohomological classes, integrated algebraic weights and Vogan induced discrete blocks are required. Owner/input: AF.4/cohomological-representation; AF.1/vogan-generic-unitary-dual.

**Sources for this target.**

- George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944), §1, Remark 1.2, arXiv p. 4. Even case.
- George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944), §1, Remark 1.2, arXiv p. 4. Odd case.

### Clozel's purity lemma

**Theorem** `AF.4/clozel-purity`. Proposed declaration: `TauCeti.Automorphic.clozelPurity`. Module: `TauCeti/Automorphic/Cohomological`. Realises `AF.4`.

Let Π be a cuspidal automorphic representation of GL_n(𝔸_F) which is algebraic in Clozel's sense (its archimedean infinitesimal characters satisfy the integrality of AF.4/c-l-algebraic). Then Π_∞ is essentially tempered and pure: at each archimedean place the restriction of its L-parameter to ℂ^× is ⊕_i z^{p_i} z̄^{q_i} with p_i + q_i = w independent of i (and of the place).

**Hypotheses.** Π cuspidal, algebraic; Clozel’s algebraic convention and the chosen determinant twist are fixed. For D_k(μ), its two exponents have common p+q=μ (μ=2s for D_k(0)⊗\|det\|^s); this is not always k−1.

**Construction or proof route.**

1. Π_∞ is unitary generic (cuspidal: Whittaker models exist for GL_n by Shalika–Piatetski-Shapiro; the global Whittaker expansion is AutomorphicLFunctionsAndLocalFactors AL.3's), hence of Vogan's form (AF.1/vogan-generic-unitary-dual) with complementary exponents 0 < β < 1/2.
2. Algebraicity forces the infinitesimal character exponents to lie in ½ℤ with integral differences, which excludes 0 < β < 1/2 shifts; hence all β = 0 and Π_∞ is essentially tempered; purity follows.
3. Proof source Clozel, Motifs et formes automorphes, Lemme 4.9 (Ann Arbor 1988) not freely available (gap).

**Direct prerequisites.** `AF.4/c-l-algebraic`, `AF.1/vogan-generic-unitary-dual`, `AF.1/archimedean-llc-gln`, `AutomorphicLFunctionsAndLocalFactors:AL.3`

**Acceptance.**

- For π_∞=D_k(μ)=D_k(0)⊗\|det\|^{μ/2}, the two archimedean parameter exponents have p+q=μ. Unitary D_k(0) has common weight 0; its cohomological twist D_k(2−k) has common weight 2−k. Algebraicity and purity must be stated in this fixed normalization.
- Non-algebraic Maass forms are not covered: the lemma says nothing about Selberg's eigenvalue conjecture.

**Signatures requiring supplier input.** `TauCeti.Automorphic.clozelPurity`. The native archimedean GL_n parameters with integral weights and global cuspidal/genericity hypotheses are required; purity is not a theorem for arbitrary local representations. Owner/input: AF.4/c-l-algebraic; AutomorphicLFunctionsAndLocalFactors:AL.3.

**Sources for this target.**

- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §7.2, proof of Theorem 7.11, arXiv p. 40. Statement as used.
- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §2.1, arXiv p. 13. Purity and the two notions of algebraicity.

### Compact and noncompact roots for Hermitian real groups

**Definition** `AF.4/hermitian-positive-system`. Proposed declaration: `TauCeti.Automorphic.Hermitian.IsHCPositive`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

Let G be real reductive with rank(𝔤_ℂ)−dim A_∞=rank(𝔨_ℂ) and G/(KA_∞) Hermitian, H⊆K a compact Cartan of G/A_∞, and 𝔤_ℂ = 𝔨_ℂ ⊕ 𝔭^+ ⊕ 𝔭^− the Harish-Chandra decomposition. The roots Φ of H_ℂ on 𝔤_ℂ split into compact roots Φ_c (occurring in 𝔨_ℂ) and noncompact roots Φ_n (in 𝔭^+ ⊕ 𝔭^−). A Harish-Chandra positive system is a positive system Φ^+ with Φ_n^+ = Φ^+ ∩ Φ_n equal to the set of roots of 𝔭^+; Φ_n^+ is forced, while the compact part Φ_c^+ is an additional choice. For GSp_4(ℝ) in the coordinates of Calegari–Geraghty: Φ = {±(2,0;0), ±(0,2;0), ±(1,1;0), ±(1,−1;0)}, Φ_c = {±(1,−1;0)}, Φ_n^+ = {(0,2;0), (1,1;0), (2,0;0)}, and either compact root may be declared positive (Calegari–Geraghty choose (1,−1;0)). The Hodge parabolic is 𝔭_h=𝔨^h_ℂ⊕𝔭^− (resp. ⊕𝔭^+), with K^h=A_∞K on the chosen positive component. On central-balanced coefficients its compact relative pair is (𝔭_h/𝔞_∞,K^h/A_∞); keep split-central coordinates in the unquotiented notation.

**Hypotheses.** Equal rank after the split-central quotient; Hermitian symmetric space G/(KA_∞); chosen positive real component.; For Hermitian coherent cohomology distinguish the compact K from K^h, the Hodge stabilizer containing A_∞. Use the fixed positive component and compact Borel convention from ShimuraData D5; a choice of noncompact positive roots alone does not choose compact positive roots.; The roots (±2,0;0), (0,±2;0), ±(1,1;0), ±(1,−1;0) are compact-Cartan coordinates. In the split algebraic torus the chosen positive roots are (1,−1;0), (0,2;−1), (1,1;−1), (2,0;−1), with ρ_T=(2,1;−3/2).

**Construction or proof route.**

1. Harish-Chandra decomposition of 𝔭_ℂ under the centre of 𝔨 (from ShimuraData D2/D3 Hodge decomposition of 𝔤_ℂ under ad h).
2. Root decomposition relative to the compact Cartan H (Tau Ceti LieHighestWeight Layer 1 root spaces over ℂ).
3. Explicit GSp_4 computation: C⁻¹h(t_1, t_2; 0)C = diag(−it_1, −it_2, it_2, it_1).

**Direct prerequisites.** `AF.1/real-reductive-group`, `AF.1a/gk-pair`, `ShimuraData:D3`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`

**Uses.** AF.4/gsp4-discrete-series: parameters π(λ, C) are relative to Weyl chambers of this root system. AF.4/bhr-coherent-cohomology: the degree i = #(Φ(C)^+ ∩ Φ_n^+). CoherentCohomologyOfShimuraVarieties: Harris's automorphic description of coherent cohomology.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.Hermitian.compactRoots` | data | Φ_c ⊆ Φ. |
| `Automorphic.Hermitian.noncompactRoots` | data | Φ_n = Φ \ Φ_c. |
| `Automorphic.Hermitian.IsHCPositive` | data | Positive systems with Φ_n^+ = roots of 𝔭^+. |
| `Automorphic.Hermitian.hodgeParabolic` | constructor | The Hodge subalgebra 𝔨^h_ℂ⊕𝔭⁻; its compact relative pair after the split-central quotient and balanced coefficients, with the quotient comparison supplied separately. |
| `Automorphic.Hermitian.gsp4_roots` | example | The explicit GSp_4(ℝ) roots in Calegari–Geraghty coordinates. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `hermitian_sl2` | degenerate | For SL_2(ℝ), Φ_c = ∅. |
| `hermitian_gsp4_count` | computation | For GSp_4(ℝ), \|Φ_c\| = 2 and \|Φ_n^+\| = 3. |
| `hermitian_choice_not_forced` | non-example | The compact positive root is not determined by 𝔭^+: both (1,−1;0) and (−1,1;0) give Harish-Chandra positive systems. |
| `hermitian_pilloni_compat` | compatibility | Pilloni’s lower-triangular split-torus positive roots are {e₂−e₁, −2e₁+e₃, −e₁−e₂+e₃, −2e₂+e₃}, with half-sum ρ_T=(−2,−1;3/2). After passage to compact Cartan coordinates the half-sum is ρ_H=(−2,−1;0); the corresponding positive systems are related by the specified coordinate/conjugation transport. |

**Acceptance.**

- SL_2(ℝ): Φ_c = ∅, Φ_n^+ = {α} with 𝔭^+ the holomorphic tangent direction.
- GSp_4(ℝ): both choices Φ_c^+ = {(1,−1;0)} and {(−1,1;0)} are Harish-Chandra positive systems with the same Φ_n^+ (Calegari–Geraghty write 'forced'; sourceIssues E3).

**Signatures requiring supplier input.** `TauCeti.Automorphic.Hermitian.IsHCPositive`, `TauCeti.Automorphic.Hermitian.compactRoots`, `TauCeti.Automorphic.Hermitian.noncompactRoots`, `TauCeti.Automorphic.Hermitian.hodgeParabolic`, `TauCeti.Automorphic.Hermitian.gsp4_roots`, `hermitian_sl2`, `hermitian_gsp4_count`, `hermitian_choice_not_forced`, `hermitian_pilloni_compat`. The native Hermitian Shimura cocharacter, compact/noncompact roots, Hodge parabolic and differentiated positive-component stabilizer require ShimuraData exports. The distinct numeric GSp₄ transport does not define a Hermitian pair. Owner/input: ShimuraData:D3; ShimuraData:D5; Hodge-stabilizer quotient gap.

**Sources for this target.**

- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §2.2, arXiv p. 8 (Duke p. 810). Definition of compact and noncompact roots and the positive system.
- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §2.2, arXiv p. 8. Their choice; only Φ_n^+ is forced.

### (𝔭_h, K)-cohomology and the L²/cuspidal coherent cohomology spaces

**Construction** `AF.4/coherent-relative-cohomology`. Proposed declaration: `TauCeti.Automorphic.coherentCohomology`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

For the Hermitian Hodge pair K^h and 𝔭_h=𝔨^h_ℂ⊕𝔭⁻, extend V_σ to 𝔭_h by letting 𝔭⁻ act trivially. Restrict the coefficient W⊗V_σ to the central-balanced isotypic part where A_∞ acts trivially. Coherent cohomology H^•(𝔭_h,K^h;W⊗V_σ) is then computed by Hom_{K^h}(∧^•𝔭⁻,W⊗V_σ), equivalently by the compact relative pair (𝔭_h/𝔞_∞,K^h/A_∞) once the explicit quotient comparison is supplied. The differential is the relative Chevalley–Eilenberg differential of AF.1a. Globally apply this to the corresponding central-character pieces of A_(2)(G) (AS.4) and A_0(G) (AF.3) to define H^i_(2),σ and H^i_cusp,σ with their finite Hecke actions.

**Hypotheses.** G Hermitian, K = K^h; V_σ extends to 𝔭_h by letting its nilpotent summand 𝔭⁻ act trivially. Use the actual Hodge stabilizer K^h, not the full disconnected maximal compact, and balance the central action when needed. With 𝔭⁻ of SO(2)-weight −2, holomorphic D_k^+ has H^0 with χ_{−k}; antiholomorphic D_k^− has H^1 with χ_{k−2}.

**Construction or proof route.**

1. Balance the split-central coefficient action and import the Lie/group quotient comparison; then apply AF.1a relative cochains to (𝔭_h/𝔞_∞,K^h/A_∞). Without this comparison the compact-pair supplier is insufficient.
2. Global spaces by applying the functor to A_{(2)}(G) and A_0(G); functoriality in G(𝔸_f) gives Hecke modules.

**Direct prerequisites.** `AF.1a/relative-lie-cochain-complex`, `AF.4/hermitian-positive-system`, `AF.3/cusp-form`, `AutomorphicSpectralTheory:AS.4`

**Uses.** AF.4/bhr-coherent-cohomology: computation for (limits of) discrete series. IntegralCoherentHeckeComplexes: Harris's automorphic description of coherent cohomology (Theorem 3.10.1 of BCGP21). HigherHidaAndColemanTheory: classical coherent cohomology in higher Hida theory.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.coherentCohomology` | constructor | H^•(𝔭_h,K^h;W⊗V_σ) for the specified Hodge pair, p^−-trivial extension of V_σ and central-balanced coefficient, via the split-central quotient comparison. |
| `Automorphic.coherentCohomology_eq` | characterisation | Hom_{K^h}(∧^•𝔭⁻,W⊗V_σ), with the relative differential, computes coherent cohomology on the central-balanced part. |
| `Automorphic.coherentCohomology_L2` | constructor | H^i_{(2),σ} and H^i_{cusp,σ} with their G(𝔸_f)-actions. |
| `Automorphic.coherentCohomology_cusp_to_L2` | functoriality | The map H^i_{cusp,σ} → H^i_{(2),σ} induced by A_0 ⊆ A_{(2)}. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `coherent_sl2_H0` | computation | H^0(𝔭_h, SO(2); D_k ⊗ χ_{−k}) = ℂ for the holomorphic discrete series. |
| `coherent_trivial_module` | degenerate | For W = ℂ trivial and V_σ trivial, H^i(𝔭_h, K; ℂ) = (∧^i 𝔭^{−,*})^K. |
| `coherent_not_gK` | non-example | (𝔭_h, K)-cohomology differs from (𝔤, K)-cohomology: for SL_2(ℝ), H^0(𝔭_h, K; D_k ⊗ χ_{−k}) = ℂ while H^0(𝔤, K; D_k ⊗ V) = 0 for every finite-dimensional V. |

**Acceptance.**

- For SL_2(ℝ), with 𝔭^− of weight −2: D_k^+⊗χ_{−k} contributes H^0, and D_k^−⊗χ_{k−2} contributes H^1. The coefficient in degree 1 is different from the coefficient in degree 0, except at the limit k=1.
- For GSp_4, the spaces H^i_{cusp,σ} with i ∈ {0,1,2,3}.

**Signatures requiring supplier input.** `TauCeti.Automorphic.coherentCohomology`, `TauCeti.Automorphic.coherentCohomology_eq`, `TauCeti.Automorphic.coherentCohomology_L2`, `TauCeti.Automorphic.coherentCohomology_cusp_to_L2`, `coherent_sl2_H0`, `coherent_trivial_module`, `coherent_not_gK`. The noncompact Hodge stabilizer K^h, split-central quotient and balanced coefficient, and the actual coherent arithmetic L²/cusp modules require ShimuraData/AA/AS inputs. A compact Pair cannot accept K^h without this quotient comparison. Owner/input: ShimuraData:D3/D5; AdelicAlgebraicGroups; AutomorphicSpectralTheory:AS.4; AF.1a central-balanced quotient gap.

**Sources for this target.**

- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §5.3, arXiv p. 19 (Duke p. 825). Definition of H^i_{(2),σ} and H^i_{cusp,σ}.
- Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §15.2.2, p. 108. (𝔭, K_∞)-cohomology after Harris [30].

### (Limits of) discrete series of GSp_4(ℝ) and their parameters

**Construction** `AF.4/gsp4-discrete-series`. Proposed declaration: `TauCeti.Automorphic.GSp4.dsRep`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

In split-algebraic-torus coordinates μ=(a,b;c_T), X*(T)=ℤ³ with M-dominance a≥b. The compact Cartan coordinates (a_H,b_H;c_H) have lattice c_H≡a_H+b_H modulo 2, and ρ_H=(2,1;0). The coefficient on the compact Cartan transported from μ is (−b,−a;a+b+2c_T), and its Harish-Chandra parameter is (a−1,b−2;a+b+2c_T), with central twist w=−(a+b+2c_T). The four closed chambers in compact coordinates are C₀={a_H≥b_H≥0}, C₁={a_H≥−b_H≥0}, C₂={−b_H≥a_H≥0}, C₃={−b_H≥−a_H≥0}; the central coordinate is unrestricted. Put w_{0,M}(a_H,b_H;c_H)=(b_H,a_H;c_H), so C_{3−i}=−w_{0,M}C_i. For λ∈C∩(X*(H_ℂ)+ρ_H), π(λ,C) is a discrete series in the interior and a nondegenerate limit on a single noncompact wall; π(λ,C)*=π(−w_{0,M}λ,−w_{0,M}C). The split weight μ is regular when (a−1,b−2) is in an open chamber and a limit weight when it lies in exactly two closed chambers. The three limit families are (a,2;c_T) with a≥2, (a,3−a;c_T) with a≥2, and (1,b;c_T) with b≤1. In Pilloni’s transported coordinates λ=(λ₁,0;c) with λ₁<0 yields the holomorphic and generic limits; his numerical cohomological condition is r≠2, k+r≠1 and k+2r≠3. Identifying these coordinate predicates with the classified representations is part of the imported real and Hermitian group data.

**Hypotheses.** G = GSp_4 over ℝ; The four chambers and limits are first classified for the positive-similitude component with K^h=ℝ_{>0}U(2). Passing to the full group and its negative-similitude components requires the specified induction/restriction convention, which remains a gap rather than identifying K^h with full K.; Do not impose compact-Cartan parity on the split torus. The split positive roots have central terms and ρ_T=(2,1;−3/2); use the explicit transport, not a silent identification with ρ_H. The swap is w_{0,M}, not the longest element of W_G (E15).

**Construction or proof route.**

1. Chambers from the root data of AF.4/hermitian-positive-system and the longest element of W_M.
2. Harish-Chandra's parametrisation (AF.1/discrete-series) specialised to GSp_4(ℝ); the contragredient formula from π(λ, C)^* having parameter −w_0(λ, C).
3. Weight families: solve the chamber inequalities for (a−1, b−2) on two chambers.
4. Translate between Calegari–Geraghty and Pilloni coordinates; apply the recorded corrections (sourceIssues E3-E5).

**Direct prerequisites.** `AF.4/hermitian-positive-system`, `AF.1/discrete-series`, `ShimuraData:D5`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`

**Uses.** AF.4/bhr-coherent-cohomology: the representations whose coherent cohomology is computed. GSp4NonregularModularityLifting: non-regular (limit of discrete series) weights in Calegari–Geraghty's Theorem 7.11. HigherHidaAndColemanTheory: Pilloni's π(λ)^h and π(λ)^g in singular weight.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.GSp4.chamber` | data | The four chambers C_0, …, C_3. |
| `Automorphic.GSp4.dsRep` | constructor | π(λ, C) for λ ∈ C ∩ (X^*(H_ℂ) + ρ), discrete series or limit. |
| `Automorphic.GSp4.dsRep_dual` | relation | π(λ,C)*≅π(−w_{0,M}λ,−w_{0,M}C) in the compact Cartan coordinates. |
| `Automorphic.GSp4.IsRegularWeight` | data | For μ∈ℤ³ with a≥b, (a−1,b−2) lies in one open chamber; the central parameter is transported separately. |
| `Automorphic.GSp4.IsLimitWeight` | data | For μ∈ℤ³ with a≥b, (a−1,b−2) lies in exactly two closed chambers. |
| `Automorphic.GSp4.limitWeight_families` | characterisation | The three families of limit weights. |
| `Automorphic.GSp4.holomorphicLimit` | constructor | π(λ)^h and π(λ)^g for λ = (λ_1, 0; c), λ_1 < 0. |
| `Automorphic.GSp4.coherentCoefficient` | compatibility | (a,b;c_T)↦(−b,−a;a+b+2c_T). |
| `Automorphic.GSp4.coherentCoefficient_parity` | characterisation | Every transported coefficient satisfies compact-Cartan parity. |
| `Automorphic.GSp4.hcParameter` | compatibility | (a,b;c_T)↦(a−1,b−2;a+b+2c_T). |
| `Automorphic.GSp4.pilloniCohomological` | characterisation | The three numerical Pilloni regularity walls are r=2, k+r=1, k+2r=3. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `gsp4_chambers_union` | characterisation | C_0 ∪ C_1 ∪ C_2 ∪ C_3 = {a ≥ b} (in the (a,b) coordinates). |
| `gsp4_limit_family` | computation | (a, 2; c) with a ≥ 2 has (a−1, 0) ∈ C_0 ∩ C_1. |
| `gsp4_cohomological_weight` | computation | The Pilloni regularity-wall predicate fails at (k,r)=(0,2) and holds at (3,3). Identification of this predicate with the classified cohomological representation is part of dsRep, not the numeric example. |
| `gsp4_compact_wall_not` | non-example | A point (t,t;c_H) with t>0 is on the compact wall of C₀ alone, not on two chambers; it therefore fails the noncompact-wall limit-weight criterion. The negative-coordinate Pilloni statement is read after the explicit positive-system conversion. |

**Acceptance.**

- μ = (3, 2; c): (a−1, b−2) = (2, 0) lies on the wall b = 0 shared by C_0 and C_1, so μ is a limit weight (family 1, a = 3); μ = (4, 3; c) gives (3, 1) in the interior of C_0 only, a regular weight.
- The weight (k, r) = (3, 3) is cohomological; (k, r) = (0, 2) is not (r = 2).

**Native signature scope.** Native split-torus ℤ³ and compact-Cartan parity transport, chamber/regular/limit predicates, limit families and Pilloni numerical regularity walls. Original dsRep and dual/holomorphic-limit constructors are omitted. Numerical tests do not assert existence of a classified representation.

**Signatures requiring supplier input.** `TauCeti.Automorphic.GSp4.dsRep`, `TauCeti.Automorphic.GSp4.dsRep_dual`, `TauCeti.Automorphic.GSp4.holomorphicLimit`. Native GSp₄ discrete and limit isomorphism classes with positive-similitude Hodge component and central character are required for dsRep, dual and holomorphicLimit. Chamber/weight-coordinate predicates are native and explicitly have only that numerical scope. Owner/input: AF.1/discrete-series; ShimuraData:D3/D5; coherent component gap.

**Sources for this target.**

- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §5.3, Definition 5.7, arXiv p. 23 (Duke p. 830). Definition 5.7 and the three families.
- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §5.3, arXiv p. 21 (Duke p. 828). The chambers (the page prints C_0, …, C_4 for four chambers; sourceIssues E4).
- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §5.3, proof of Theorem 5.5, arXiv p. 22. Harish-Chandra parametrisation and contragredient.
- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §2.0.1, pp.6–8, and §5.3, pp.21–23, arXiv:1907.08691v1. Split-torus character lattice and root central terms; compact-Cartan lattice; coefficient transport; chambers and Harish-Chandra parameter. The longest-element label is corrected in E15.

### Coherent cohomology of (limits of) discrete series (Blasius–Harris–Ramakrishnan, Harris)

**Theorem** `AF.4/bhr-coherent-cohomology`. Proposed declaration: `TauCeti.Automorphic.coherentCohomology_discreteSeries`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

Atlas planet: **Coherent cohomology of discrete series**.

In the CG GSp_4 coordinates, for σ=(−b,−a;a+b+2c), the Harish-Chandra parameter of π^* is λ=(2−b,1−a;−a−b−2c). The chamber C_j has i=#(Φ(C_j)^+∩Φ_n^+)=3−j. Equivalently the contributing π has parameter (a−1,b−2;a+b+2c) in C_i. With Pilloni λ=(λ_1,0;c), λ_1<0, and V of highest weight (−λ_1+1,2;−c), the quoted Hodge-pair result has one-dimensional H^0 for π(λ)^h and H^1 for π(λ)^g. This is the precise source-coordinate statement; full-group component conventions and any asserted vanishing outside those degrees require verification and are not inferred from Harris’s general Theorem 3.4.

**Hypotheses.** G Hermitian; π_∞ discrete series or non-degenerate limit

**Construction or proof route.**

1. Blasius–Harris–Ramakrishnan 1994, Theorem 3.2.1, via Schmid's realisation of discrete series in L²-∂̄-cohomology and Zuckerman translation to limits.
2. Degree: the number of noncompact positive roots of C that are positive for the Harish-Chandra system.
3. GSp_4 specialisations: Pilloni Theorem 15.2.2.1(1) and Calegari–Geraghty §7.2 (Harris Theorem 3.4).
4. The BHR proof and original Schmid/translation proof interiors remain unread. Harris’s public published survey has now been inspected at §§3.1–3.5; Goldring–Koskivirta Remark 10.1.3 corrects its general extra degree-vanishing claim. Do not extrapolate connected-pair calculations to a full disconnected group.

**Direct prerequisites.** `AF.4/coherent-relative-cohomology`, `AF.4/gsp4-discrete-series`, `AF.4/hermitian-positive-system`, `AF.1/discrete-series`

**Acceptance.**

- For SL_2(ℝ), with 𝔭^− of weight −2: D_k^+⊗χ_{−k} contributes H^0, and D_k^−⊗χ_{k−2} contributes H^1. The coefficient in degree 1 is different from the coefficient in degree 0, except at the limit k=1.
- GSp_4: π(λ, C_0) (holomorphic) in degree 0, π(λ, C_3) (antiholomorphic) in degree 3.

**Signatures requiring supplier input.** `TauCeti.Automorphic.coherentCohomology_discreteSeries`. The native coherent Hodge-pair complex and classified discrete series, with the verified component/degree convention, are required. The published correction forbids an unrestricted full-disconnected degree-vanishing signature. Owner/input: AF.4/coherent-relative-cohomology; AF.4/gsp4-discrete-series; coherent vanishing gap.

**Sources for this target.**

- Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §15.2.2, Theorem 15.2.2.1(1), p. 108. Part (1).
- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §5.3, proof of Theorem 5.5, arXiv p. 22. λ and i = #(Φ(C)^+ ∩ Φ_n^+).

### Tempered representations with coherent cohomology are (limits of) discrete series (Mirković)

**Theorem** `AF.4/mirkovic-tempered-coherent`. Proposed declaration: `TauCeti.Automorphic.isDiscreteSeries_of_coherentCohomology_ne_zero`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

Let G be Hermitian and π_∞ an irreducible essentially tempered (𝔤, K)-module with H^i(𝔭_h, K; π_∞ ⊗ V_σ) ≠ 0 for some i. Then π_∞ is a discrete series or a non-degenerate limit of discrete series. For π ∈ A_{(2)}(G) with π_∞ essentially tempered this applies at every archimedean place.

**Hypotheses.** π_∞ essentially tempered; Use the equal-rank Hermitian Hodge pair and the coefficient extended trivially across 𝔭⁻, with the appropriate central normalization and positive-component convention. Harris §3.5 is a public statement source; the original Mirković proof is still unread.

**Construction or proof route.**

1. Mirković's theorem as quoted by Harris (1990, Theorem 3.5): tempered modules are fundamental series; the (𝔭_h, K)-cohomology of a properly induced tempered module vanishes by a Shapiro-type argument unless the inducing parabolic is cuspidal of compact type.
2. Harris (1990) §3.5 is publicly available and was read in the preceding independent review as a statement source; the original Mirković proof remains the explicitly unread proof supplier.

**Direct prerequisites.** `AF.4/coherent-relative-cohomology`, `AF.1/tempered-square-integrable`, `AF.1/langlands-classification`, `AF.1/discrete-series`

**Acceptance.**

- SL_2(ℝ): the tempered principal series has no (𝔭_h, K)-cohomology with any σ.
- Non-tempered: the trivial representation of SL_2(ℝ) has (𝔭_h, K)-cohomology in degree 0 and is not a (limit of) discrete series, so temperedness is necessary.

**Signatures requiring supplier input.** `TauCeti.Automorphic.isDiscreteSeries_of_coherentCohomology_ne_zero`. The native coherent Hodge-pair cohomology and tempered/unitary classified representation are required to state the discreteness criterion with its compact/central assumptions. Owner/input: AF.4/coherent-relative-cohomology; AF.1/discrete-series.

**Sources for this target.**

- Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1), §5.3, Theorem 5.6, arXiv p. 23. Use of Mirković's theorem via Harris [37, Theorem 3.5].
- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3), §3.10, proof of Theorem 3.10.1, arXiv v3 p. 73. The same input at each real place.
- Michael Harris, [Automorphic forms and the cohomology of vector bundles on Shimura varieties](https://www.jmilne.org/math/Books/AA1988b.pdf), §3, Theorem 3.5 (Mirković), printed p.63 (PDF p.75). Scanned published statement; its preceding Hodge-pair and real-component hypotheses are retained.

### Large-weight classification and temperedness for coherent cohomology of GSp_4

**Theorem** `AF.4/bhr-large-weight`. Proposed declaration: `TauCeti.Automorphic.GSp4.coherent_classification_largeWeight`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

(i) (Blasius–Harris–Ramakrishnan, Proposition 2.4.5 and proof of Theorem 4.2.3) If π ∈ A_{(2)}(G) has nonzero (𝔭_h, K)-cohomology with coefficients V_κ and the infinitesimal character of π_∞ is far enough from the root hyperplanes it does not lie on, then π_∞ is essentially tempered. (ii) (Pilloni, Theorem 15.2.2.1(2)) There is R such that if λ = (λ_1, 0; c) with λ_1 < 0 and −λ_1 ≥ R (printed λ_1 ≥ R; sourceIssues E6), V = V_{(−λ_1+1,2;−c)} and π_∞ is an irreducible essentially unitary representation of GSp_4(ℝ), then H^0(𝔭, K_∞; π_∞ ⊗ V) ≠ 0 implies π_∞ ≅ π(λ)^h, and H^1(𝔭, K_∞; π_∞ ⊗ V) ≠ 0 implies π_∞ ≅ π(λ)^g. (iii) (Pitale–Schmidt lowest-weight theory) If H^0(𝔭_h, K; π_v ⊗ V_{κ_v}) ≠ 0 then π_v is the holomorphic discrete series or holomorphic limit of discrete series of weight (k_v, l_v); for l_v > 2 only the holomorphic discrete series contributes, in degree 0, and for l_v = 2 the holomorphic (degree 0) and generic (degree 1) limits, each one-dimensional.

**Hypotheses.** G = GSp_4 (over each real place of a totally real field); The threshold is quantified as ∃R>0, ∀λ_1<0 with −λ_1≥R, with λ_2=0 and the fixed central coefficient. Pilloni’s subsequent k≥R−1 specialization confirms the intended large-weight sign; the proof source remains a gap.

**Construction or proof route.**

1. (i) Casselman–Osborne: the infinitesimal character is determined by κ; unitary non-tempered representations have parameters close to walls (Vogan's classification bounds), so large regular parameters force temperedness.
2. (ii) Combine (i) with AF.4/mirkovic-tempered-coherent and AF.4/bhr-coherent-cohomology.
3. (iii) Lowest K-type analysis for GSp_4(ℝ) (Pitale–Schmidt §2.3).
4. Sources BHR 1994 and Pitale–Schmidt 2009 not read (gap); statements recorded from Pilloni and BCGP21.

**Direct prerequisites.** `AF.4/bhr-coherent-cohomology`, `AF.4/mirkovic-tempered-coherent`, `AF.4/gsp4-discrete-series`, `AF.1/tempered-square-integrable`

**Acceptance.**

- Parallel weight κ = (k, k) with k ≥ 3 at every real place: H^0 sees exactly the holomorphic discrete series.
- The constant R cannot be removed: for small weights non-tempered unitary representations (Saito–Kurokawa type) have nonzero H^0 or H^1.

**Signatures requiring supplier input.** `TauCeti.Automorphic.GSp4.coherent_classification_largeWeight`. The native coherent complex, integrated sufficiently regular algebraic coefficient and discrete/limit classes require Hodge and classification exports. Numeric regularity walls alone are not this classification. Owner/input: AF.4/coherent-relative-cohomology; AF.4/gsp4-discrete-series.

**Sources for this target.**

- Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §15.2.2, Theorem 15.2.2.1(2), p. 108. Part (2), with the printed λ_1 ≥ R to be read −λ_1 ≥ R.
- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3), §3.10, proof of Theorem 3.10.1, arXiv v3 p. 73. Temperedness under regularity; the three nonvanishing cases at each real place follow.

### Limits of discrete series indexed by C(κ) for GSp_{2g} (Harris)

**Theorem** `AF.4/harris-limits-gsp2g`. Proposed declaration: `TauCeti.Automorphic.GSp2g.limitDiscreteSeries`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

Let (G, X) be the Siegel Shimura datum for GSp_{2g}, μ its cocharacter with parabolic P_μ and Levi M_μ, K^h⊆G(ℝ) the stabiliser of h (a real form of M_μ), V_κ the representation of K^h of highest weight κ ∈ X^*(T)^{M_μ,+} and 𝔭_μ = Lie P_μ. Define C(κ) = {w ∈ ^MW : w⁻¹w_{0,M}(κ + ρ) ∈ X^*(T)^−_ℚ}, read in X^*(T)_ℚ (sourceIssues E7), where ^MW are the Kostant representatives and X^*(T)^−_ℚ = −X^*(T)^+_ℚ the antidominant cone. C(κ) is nonempty and w⁻¹w_{0,M}(κ + ρ) is independent of w ∈ C(κ); if ν + ρ := −w⁻¹w_{0,M}(κ+ρ) is regular, C(κ) has exactly one element. For w ∈ C(κ) there exists a non-degenerate limit of discrete series π_∞(κ, w) of G(ℝ), determined by (κ, w), such that π_∞(κ, w) ⊗ V_κ has (𝔭_μ,K^h)-cohomology in degree ℓ(w). Uniqueness is to be read with the full parameter/chamber data (κ,w), not as a claim that the degree alone classifies representations. The alleged GSp_4 same-length counterexample in E8 is rejected: its minimal representatives have lengths 0,1,2,3. Any stronger uniqueness solely from nonvanishing in a degree remains unverified.

**Hypotheses.** G = GSp_{2g}; κ ∈ X^*(T)^{M_μ,+}; The Hodge stabilizer K^h includes A_∞ and lies in the positive-similitude component. Use central-balanced coefficients and the split-central quotient comparison to the compact pair; passing to full G(ℝ) is the separate component gap already recorded.

**Construction or proof route.**

1. Nonemptiness and independence: X^*(T)^−_ℚ is a fundamental domain for W on X^*(T)_ℚ (Tau Ceti exists_mem_dominantChamber and RootSystems Layer 4 uniqueness), and ^MW × W_M → W is a bijection.
2. Existence of π_∞(κ, w) and the cohomology degree: Harris 1990, Theorem 3.4, via AF.4/bhr-coherent-cohomology for the chamber w·C.
3. Import ^MW, w_{0,M} from ShimuraData D3 and ρ and the GSp_{2g} cones from ShimuraData D5 (request).

**Direct prerequisites.** `AF.4/bhr-coherent-cohomology`, `AF.4/hermitian-positive-system`, `ShimuraData:D3`, `ShimuraData:D5`, `tauceti:TauCeti.exists_mem_dominantChamber`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`

**Acceptance.**

- g = 1: C(κ) for κ = k gives the holomorphic (w = Id, degree 0) or antiholomorphic (degree 1) discrete series of GL_2(ℝ), and the limit of discrete series at k = 1 where C(κ) has two elements.
- g = 2 recovers the GSp_4 chambers C_0, …, C_3 of AF.4/gsp4-discrete-series.

**Signatures requiring supplier input.** `TauCeti.Automorphic.GSp2g.limitDiscreteSeries`. The native symplectic root/Weyl/Levi data, genuine limit representations and coherent Hodge component are required; Kostant representatives are supplied by ShimuraData rather than redefined here. Owner/input: ShimuraData:D3/D5; AF.1/discrete-series; coherent vanishing gap.

**Sources for this target.**

- George Boxer, Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf), §1.3.7, Theorem 1.3.8, p. 4. Theorem 1.3.8 ([Har90], Thm. 3.4); existence used, the uniqueness clause corrected.
- George Boxer, Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf), §1.3.3, p. 3. C(κ) (defined on p. 3 with X^*(T)^+, to be read in X^*(T)_ℚ as on p. 48).
- Wushi Goldring; Jean-Stefan Koskivirta, [Strata Hasse invariants, Hecke algebras and Galois representations](https://link.springer.com/article/10.1007/s00222-019-00882-5), Theorem 10.1.2 and Remark 10.1.3. The warning concerns Harris’s extra vanishing-in-other-degrees claim; use the retained one-dimensional contributing degree only, and separately verify component conventions.

### Holomorphic discrete series of Sp_{2n}(ℝ) and U(n,n) with scalar minimal K-type

**Theorem** `AF.4/holomorphic-ds-sp2n-unn`. Proposed declaration: `TauCeti.Automorphic.holomorphicDiscreteSeries_minimalKType`. Module: `TauCeti/Automorphic/CoherentCohomological`. Realises `AF.4`.

Let 𝒢 = Sp_{2n}/ℝ (resp. U(n,n)/ℝ) with maximal compact K ≅ U(n) (resp. U(n) × U(n)) and χ : K → ℂ^×, g_0 ↦ det(g_0) (resp. (g_1, g_2) ↦ det(g_1)det(g_2)⁻¹). For k > n (resp. k ≥ n) there is a unique discrete series representation π_k of 𝒢(ℝ) with minimal K-type χ^{⊗k}; its infinitesimal character is (k−1, k−2, …, k−n) ∈ ℝ^n (resp. (k − ½, k − 3/2, …, k − n + ½, n − ½ − k, …, 3/2 − k, ½ − k) ∈ ℝ^{2n}).

**Hypotheses.** k > n for Sp_{2n}, k ≥ n for U(n,n)

**Construction or proof route.**

1. Harish-Chandra parameter λ = Λ_k + δ_c − δ_nc from the lowest K-type Λ_k = restriction of χ^{⊗k} (Blattner), with 2δ_nc = (n+1, …, n+1) and 2δ_c = (n−1, n−3, …) (Scholze's proof).
2. λ regular and dominant for the holomorphic chamber exactly when k > n (resp. k ≥ n).
3. Uniqueness from AF.1/discrete-series (ii).

**Direct prerequisites.** `AF.1/discrete-series`, `AF.4/hermitian-positive-system`

**Acceptance.**

- n = 1, Sp_2 = SL_2: π_k = D_k^+ for k > 1 with infinitesimal character k − 1.
- For k = n with Sp_{2n} the parameter is singular (a limit), consistent with the strict inequality.

**Signatures requiring supplier input.** `TauCeti.Automorphic.holomorphicDiscreteSeries_minimalKType`. Native holomorphic discrete-series constructors, Harish-Chandra chambers and minimal compact-type representations for Sp/U(n,n) are required. Owner/input: AF.1/discrete-series; ShimuraData; reductive classification gap.

**Sources for this target.**

- Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://arxiv.org/abs/1306.2070), §5.1, Proposition 5.1.1, arXiv p. 79. Proposition 5.1.1.

### Integral coefficient systems from algebraic representations

**Construction** `AF.4/coefficient-lattices`. Proposed declaration: `TauCeti.Automorphic.StableLattice`. Module: `TauCeti/Automorphic/AlgebraicWeight`. Realises `AF.4`.

Let V be an algebraic representation of G over a number field E (for example V_λ), O_E its integers, and J_f ⊆ G(𝔸_f) compact open. A J_f-stable lattice is an O_E ⊗ \hat ℤ-lattice L ⊆ V ⊗_ℚ 𝔸_f (equivalently a family of O_{E,ℓ}-lattices L_ℓ ⊆ V ⊗ ℚ_ℓ, equal to a fixed L_0 ⊗ ℤ_ℓ for almost all ℓ) stable under J_f acting through its ℓ-components. Such lattices exist; for two J_f-stable lattices L, L' there is N ≥ 1 with L[1/N] = L'[1/N], so the coefficient modules agree after inverting the primes dividing N. The coefficient lattice on each component, with the action of its arithmetic stabilizer on the transported lattice and the specified J_f-action is the input for local systems on X_{J_f} (ArithmeticLocallySymmetricSpaces ALS.1) and for algebraic modular forms (AF.5).

**Hypotheses.** V algebraic over E; J_f compact open; The lattice is stable under J_f (or its specified p-part); on component g_i, the arithmetic stabilizer preserves the transported lattice. No global G(F)-stable integral lattice is claimed. A rank-one O_E lattice may be a nonprincipal fractional ideal, so a free O_E example must use E=ℚ or assume principality.

**Construction or proof route.**

1. At each relevant finite place, the setwise stabilizer of a chosen lattice L_0 is open. A compact subgroup J has a finite orbit of L_0; the sum of its orbit lattices is a J-stable lattice. Setwise stabilization, rather than pointwise fixation of L_0, is required. Assemble the local choices with the fixed integral model outside finitely many places.
2. At almost all ℓ, J_ℓ = G(ℤ_ℓ) for the integral model and V comes from a representation of the model, so L_0 ⊗ ℤ_ℓ is stable.
3. Comparison: two lattices agree at almost all ℓ and are commensurable at the rest.

**Direct prerequisites.** `AF.4/algebraic-weight`, `AdelicAlgebraicGroups:AA.1/integral-points-level`, `AdelicAlgebraicGroups:AA.1/integral-model`, `AF.4/local-stable-lattice`

**Uses.** ArithmeticLocallySymmetricSpaces:ALS.1: local systems on X_K from algebraic representations with stable lattices. AF.5/algebraic-modular-forms: integral algebraic modular forms valued in L. AF.4/torsion-hecke-eigenclasses: integral cohomology with coefficients L.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.StableLattice` | data | J_f-stable O_E ⊗ \hat ℤ-lattices in V ⊗ 𝔸_f. |
| `Automorphic.StableLattice.exists` | other | Existence for every compact open J_f. |
| `Automorphic.StableLattice.eq_localization` | characterisation | Two stable lattices agree after inverting finitely many primes. |
| `Automorphic.StableLattice.map` | functoriality | Restriction to smaller J_f and conjugation by g ∈ G(𝔸_f): gL is gJ_fg⁻¹-stable. |
| `Automorphic.StableLattice.reduction` | projection | L/ϖL as a k_E[J_f]-module. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `lattice_trivial` | degenerate | For E=ℚ and the trivial rank-one representation, a finite-adelic lattice is c·ℤhat for c∈𝔸_f^× (up to ℤhat^×). For general E, rank-one integral lattices are invertible fractional ideals and need not be principal. |
| `lattice_sym2` | computation | For Sym²(ℚ²) under GL_2(\hat ℤ), Sym² and the divided-power lattice differ only at 2 (index 2). |
| `lattice_not_unique` | non-example | Stable lattices are not unique: ℓ·L is another one, and at ℓ = 2 Sym²(ℤ_2²) and Γ²(ℤ_2²) are non-homothetic. |
| `lattice_chevalley_compat` | compatibility | For split G and dominant λ, the Chevalley/Kostant lattice of V_λ (Tau Ceti) is G(\hat ℤ)-stable. |

**Acceptance.**

- GL_2/ℚ, V = Sym^{k−2}(ℚ²): L = Sym^{k−2}(\hat ℤ²) is GL_2(\hat ℤ)-stable; the divided-power lattice Γ^{k−2} differs from it only at primes ≤ k − 2.
- For k − 2 < p the two lattices agree at p, which is the source of the condition p > k − 2 in integral Eichler–Shimura statements.

**Signatures requiring supplier input.** `TauCeti.Automorphic.StableLattice`, `TauCeti.Automorphic.StableLattice.exists`, `TauCeti.Automorphic.StableLattice.eq_localization`, `TauCeti.Automorphic.StableLattice.map`, `TauCeti.Automorphic.StableLattice.reduction`, `lattice_trivial`, `lattice_sym2`, `lattice_not_unique`, `lattice_chevalley_compat`. The native number-field algebraic coefficient V_λ, O_E integral model and finite-adelic restricted-product level action require AA/RG integration exports. LocalStableLattice is a distinct ℤ_p construction, not the global lattice family. Owner/input: AdelicAlgebraicGroups:AA.1; AF.4/algebraic-weight; ReductiveGroups, Part II.

**Sources for this target.**

- Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://arxiv.org/abs/2407.21237), §4.2.2, arXiv p. 72. Lattices W_{ξ,τ} in locally algebraic representations stable under the level at p (the lattice must be in the tensor product over v ∈ S_p∖{℘}: sourceIssues E9).
- Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet-Langlands correspondence](https://arxiv.org/abs/1806.10563), §2, arXiv p. 13. Algebraic representations over number fields giving local systems.

### Field of rationality and fields of definition

**Definition** `AF.4/rationality-field`. Proposed declaration: `TauCeti.Automorphic.rationalityField`. Module: `TauCeti/Automorphic/AlgebraicWeight`. Realises `AF.4`.

Aut(ℂ) acts on isomorphism classes of admissible (𝔤, K_∞) × G(𝔸_f)-modules through the finite part: (π^∞)^τ = π^∞ ⊗_{ℂ,τ} ℂ. The field of rationality ℚ(π^∞) is the fixed field of {τ ∈ Aut(ℂ) : (π^∞)^τ ≅ π^∞}. A field of definition is a subfield E ⊆ ℂ with an E-structure π^∞_E (a smooth G(𝔸_f)-representation over E with π^∞_E ⊗_E ℂ ≅ π^∞). Every field of definition contains ℚ(π^∞), but ℚ(π^∞) need not be one; existence of a model over a finite extension of ℚ(π^∞) is a separate theorem.

**Hypotheses.** π^∞ admissible irreducible; Aut(ℂ) twists the smooth finite-part algebraic action; it is not applied to a continuous archimedean action. For a classical weight-k eigenform the finite rationality field comparison uses the cohomological algebraic normalization D_k(2−k), not an automatic equality for its unitary normalization with square-root prime factors.

**Construction or proof route.**

1. Aut(ℂ)-twist on smooth representations of G(𝔸_f) (no topology on ℂ needed: smooth = all stabilisers open).
2. Fixed field via Galois correspondence for Aut(ℂ/ℚ) (closed subgroups).

**Direct prerequisites.** `AF.2/automorphic-forms-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`

**Uses.** AF.4/clozel-rationality: the theorem bounds ℚ(π^∞) and produces a model. AutomorphicGaloisRepresentationsPartII:AG2.0: field of rationality M_π versus fields of realisation of r_{π,ι}. GL2AutomorphicRepresentationsAndTransfer:R16.4: rational structures for the actual cohomological GL₂ representations.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.galoisTwist` | functoriality | π ↦ π^τ, compatible with composition in Aut(ℂ). |
| `Automorphic.rationalityField` | data | ℚ(π^∞) as an IntermediateField ℚ ℂ. |
| `Automorphic.IsFieldOfDefinition` | data | E admits an E-structure on π^∞. |
| `Automorphic.rationalityField_le` | relation | Every field of definition contains ℚ(π^∞). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `rationality_trivial` | degenerate | The trivial representation has ℚ(π^∞) = ℚ and is defined over ℚ. |
| `rationality_gl1_finite_order` | computation | A Dirichlet character χ of order m has ℚ(χ) = ℚ(ζ_m) when primitive with values generating it. |
| `rationality_not_definition` | non-example | ℚ(π) is not always a field of definition: the descent obstruction is a class in a Brauer group (example: a representation of a quaternion group realised over ℚ(i) with rational character but no ℚ-model), so 'stabiliser field = field of definition' is false in general. |
| `rationality_modularForms_compat` | compatibility | For GL₂/ℚ newforms in the cohomological algebraic finite-part normalization D_k(2−k), the rationality field agrees with the character/eigenvalue field of Tau Ceti ModularForms Layer 8G. The unitary finite-part normalization may adjoin square-root prime factors. |

**Acceptance.**

- GL_1: ℚ(χ_f) for a Hecke character of finite order is the field generated by its values.
- For a classical GL_2/ℚ newform f, the field of rationality of its cohomologically normalized finite part (infinite component D_k(2−k)) is ℚ(a_n(f)). The finite part of the unitary D_k(0) normalization may introduce square-root prime factors. Import the exact algebraic Hecke-field comparison from ModularForms Layer 8G.

**Native signature scope.** Native scalar twist by an actual field automorphism, equivariant isomorphism stabilizer, its fixed subfield and scalar-extension model. This generic finite-part algebra does not assert smooth arithmetic descent or supply an obstruction example.

**Signatures requiring supplier input.** `rationality_not_definition`, `rationality_modularForms_compat`. The native finite-part modular-form dictionary and a concrete representation with an obstruction to descent to its rationality field are required for the two tests. The fixed-field definition and scalar-twist model are native but do not exhibit that obstruction. Owner/input: AF.5/gl2-dictionary; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; rationality descent gap.

**Sources for this target.**

- George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944), §1, arXiv p. 1. The cohomological realisation through which rationality is proved.

### Rationality of cohomological cuspidal representations (Clozel)

**Theorem** `AF.4/clozel-rationality`. Proposed declaration: `TauCeti.Automorphic.clozelRationality`. Module: `TauCeti/Automorphic/AlgebraicWeight`. Realises `AF.4`.

Atlas planet: **Clozel's rationality theorem**.

Let π be a cuspidal automorphic representation of GL_n(𝔸_F), F a number field, which is regular algebraic (cohomological: π_∞ ⊗ V_λ has nonzero (𝔤, K)-cohomology for some dominant λ). Then ℚ(π^∞) is a number field and π^∞ has a model over ℚ(π^∞) (Clozel, Théorème 3.13). More generally, for G reductive over F and π cuspidal cohomological with coefficients V_λ defined over E, contributing to cuspidal cohomology H^•_cusp(X_K, V_λ), the field ℚ(π^∞) is a number field, and π^∞ is defined over a finite extension of ℚ(π^∞), provided the cuspidal cohomology is a Hecke-stable direct summand of H^•(X_K, V_λ) defined over E (true for GL_n by Clozel/Franke).

**Hypotheses.** π cuspidal and cohomological; for general G, cuspidal cohomology is an E-rational Hecke summand

**Construction or proof route.**

1. Cuspidal cohomology H^•_cusp(X_K, V_λ ⊗ ℂ) = ⊕_π m(π) H^•(𝔤, K; π_∞ ⊗ V_λ) ⊗ (π^∞)^K (Borel–Wallach / AutomorphicSpectralTheory AS.5 and ArithmeticLocallySymmetricSpaces ALS.5 comparison).
2. Betti cohomology H^•(X_K, V_λ) has an E-structure stable under Hecke operators (ALS.1, ALS.3); for GL_n cuspidal cohomology is an E-rational summand (Clozel, using Franke's theorem and the strong multiplicity one / regularity).
3. Aut(ℂ/E) permutes the π^K-isotypic pieces; finiteness of the set of π with given K and λ gives a number field ℚ(π^∞); a model over ℚ(π^∞) for GL_n from Whittaker newforms (unique up to scalars); in general a model over a finite extension.
4. Proof source (Clozel 1990, Théorème 3.13) not freely available; recorded as gap.

**Direct prerequisites.** `AF.4/rationality-field`, `AF.4/cohomological-representation`, `AF.3/cuspidal-automorphic-representation`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `AutomorphicSpectralTheory:AS.5`

**Acceptance.**

- GL_2/ℚ: for a newform f of weight k ≥ 2, ℚ(π_f^∞) = ℚ(a_n(f)) is a number field (Tau Ceti ModularForms Layer 8).
- Maass forms (non-cohomological) are excluded: their Hecke eigenvalues are not known to be algebraic.

**Signatures requiring supplier input.** `TauCeti.Automorphic.clozelRationality`. The native characteristic-zero cuspidal Betti/relative-cohomology decomposition and finite-part smooth rational model are required. Field-of-rationality alone does not assert an E-model. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.1/ALS.5; AutomorphicSpectralTheory:AS.5; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category.

**Sources for this target.**

- George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944), §1, arXiv p. 1. Cuspidal cohomology of GL_n(ℤ) realises cohomological cuspidal π (the input of the rationality proof).
- Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1), §1.2, arXiv p. 5. Context: algebraic cuspidal π of GL_m.
- G. Harder, A. Raghuram, [Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §2.3.4, pp.14–15. The GL_n cohomological rationality route through rational Betti/Hecke cohomology and strong multiplicity one, with E enlarged to split the isotypical summand. The full Clozel theorem remains the named imported theorem.

### Torsion Hecke eigenclasses

**Definition** `AF.4/torsion-hecke-eigenclasses`. Proposed declaration: `TauCeti.Automorphic.TorsionEigenSystem`. Module: `TauCeti/Automorphic/AlgebraicWeight`. Realises `AF.4`.

A torsion-coefficient Hecke eigenclass is data (c,θ): a nonzero c∈H^i(X_J,L⊗O_E/λ^m) and a ring homomorphism θ:T→O_E/λ^m satisfying tc=θ(t)c for all t. A nonfaithful cyclic class need not determine θ uniquely. For m=1 and finite residue field k, im θ is a finite subfield of k, so ker θ is maximal and lies in the support. Integral torsion eigenclasses use a separately specified eigenvalue ring/system. These are defined through integral Betti cohomology and are not assumed to lift to characteristic-zero cusp forms.

**Hypotheses.** X_{J_f} the locally symmetric space of level J_f; L a stable lattice; Use neat/torsion-free levels, or the ALS groupoid coefficient complex with stabilizers, for integral base change. The weight-2 reduction test uses the actual Hecke-equivariant integral eigenclass/lattice, not an automatic lift through arbitrary orbifold torsion.

**Construction or proof route.**

1. Integral cohomology and Hecke action from ALS.1 (local systems from stable lattices) and ALS.3 (Hecke correspondences on complexes).
2. Eigen-systems as ring homomorphisms out of the image of T in End(H^i(X_{J_f}, L/λ^m)); support of the finite T-module.

**Direct prerequisites.** `AF.4/coefficient-lattices`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.3`

**Uses.** GL2ModularityLifting:R32.3: non-Eisenstein maximal ideals of torsion cohomology in ℓ₀ > 0 patching. AutomorphicGaloisRepresentationsPartII:AG2.0: torsion eigen-systems as inputs to Galois representations. CompletedCohomologyPartII:CC.2: completed cohomology localised at 𝔪.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.TorsionEigenSystem` | data | Ring homomorphisms T → O_E/λ^m arising from eigenclasses in H^•(X_{J_f}, L/λ^m). |
| `Automorphic.TorsionEigenSystem.maximalIdeal` | projection | For a finite residue field, ker θ is maximal even if θ is not surjective: its finite image is a subfield. |
| `Automorphic.TorsionEigenSystem.of_char_zero` | relation | Choose an integral eigenclass as well as integral eigenvalues; reduction gives a torsion system only when the class has nonzero image. The semilinear transport supplies the equation; ALS supplies the cohomological map. |
| `Automorphic.TorsionEigenSystem.lattice_indep` | compatibility | Independence of the lattice for λ not dividing the comparison index of AF.4/coefficient-lattices. |
| `Automorphic.TorsionEigenSystem.map` | functoriality | For κ:Λ→Λ′ and a κ-semilinear Hecke-equivariant map f, transport the eigenclass and system to (f(c),κ∘θ) provided f(c)≠0. |
| `Automorphic.TorsionEigenSystem.map_sys` | simp | The transported eigenvalue system is κ∘θ. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `torsion_trivial_coeff` | degenerate | For L = O_E and i = 0, H^0(X_{J_f}, k) gives the Eisenstein system (for GL_2, T_ℓ ↦ 1 + ℓ, the degree of the Hecke correspondence). |
| `torsion_reduction` | compatibility | The reduction mod λ of the eigen-system of a weight-2 newform with integral coefficients is a torsion eigen-system on H^1(Γ_0(N), k). |
| `torsion_not_lift` | non-example | H^1(Γ,ℤ)=Hom(Γ,ℤ) is torsion-free. In the universal-coefficient sequence, mod-p H^1 can acquire nonliftable classes from p-torsion in H^2(Γ,ℤ) (equivalently torsion in integral homology H_1), as occurs for arithmetic/Bianchi groups. A definition restricted to reductions of characteristic-zero cusp forms would miss this mechanism. |
| `eigenclass_zero_not` | degenerate | The zero coefficient module has no eigenclass data because the class must be nonzero. |
| `eigenclass_reduce_nonzero` | compatibility | A semilinear Hecke-equivariant reduction whose class remains nonzero satisfies the reduced eigen-equation. |
| `eigenclass_finite_image_maximal` | characterisation | A system with values in a finite field has maximal kernel without requiring surjectivity. |

**Acceptance.**

- For arithmetic/Bianchi groups, torsion in H_1(Γ,ℤ), equivalently in H^2(Γ,ℤ), can contribute mod-p H^1 classes that do not lift integrally. H^1(Γ,ℤ)=Hom(Γ,ℤ) itself has no torsion.
- The GL_2/ℚ weight-2 reduction comparison requires a neat level and a specified integral Hecke-equivariant model with the appropriate base-change and characteristic-zero lifting theorem. No blanket assertion about every eigensystem in an arbitrary orbifold H^1 is made; this precise lifting comparison remains a prerequisite gap.

**Native signature scope.** Native ring character plus nonzero eigenvector and semilinear transport with nonzero image. A finite residue field makes the kernel maximal without requiring surjectivity. The arithmetic Betti/lattice specialization and no-lift counterexample require ALS.

**Signatures requiring supplier input.** `TauCeti.Automorphic.TorsionEigenSystem.of_char_zero`, `TauCeti.Automorphic.TorsionEigenSystem.lattice_indep`, `torsion_trivial_coeff`, `torsion_reduction`, `torsion_not_lift`. Native integral Betti cohomology with J-stable coefficient lattice and compatible Hecke action are required for characteristic-zero reduction and lattice-independence statements and the arithmetic tests. The generic nonzero eigenclass/map records no universal lift and requires a nonzero image. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.1; ArithmeticLocallySymmetricSpaces:ALS.3.

**Sources for this target.**

- Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://arxiv.org/abs/1306.2070), §5.1, arXiv p. 82. Hecke algebras acting on (torsion) cohomology of locally symmetric spaces in Scholze's setting.

### Kostant’s parabolic Lie-cohomology theorem

**Theorem** `AF.4/kostant-parabolic-cohomology`. Proposed declaration: `TauCeti.RelativeLieCohomology.kostant`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.4`.

Let 𝔤 be complex semisimple, choose positive roots and a standard parabolic 𝔭=𝔪⋉𝔲 with 𝔲 consisting of its positive non-Levi root spaces. For a dominant integral highest weight λ and its finite-dimensional irreducible V_λ, H^q(𝔲,V_λ)≅⊕_{w∈{}^MW, ℓ(w)=q} V^𝔪_{w(λ+ρ)−ρ}. Here {}^MW consists of minimal representatives of W_M\W, equivalently w⁻¹ sends positive Levi roots to positive roots. The representation on cochains is the coefficient action tensored with the contragredient action on exterior powers of 𝔲; the complete Levi weight, including its centre, is retained. Each summand occurs once. For a reductive 𝔤 a fixed central character extends the formula by its unchanged central weight.

**Hypotheses.** Complex semisimple Lie algebra, standard parabolic, finite-dimensional irreducible coefficient of dominant integral highest weight.; The complex theorem is the verified source result. Descent to a general splitting field of characteristic zero requires the algebraic coefficient and scalar-extension comparison requested for ALS.4; no integral or positive-characteristic formula is asserted.

**Construction or proof route.**

1. The finite-dimensional Hodge decomposition identifies cohomology with harmonic cochains (Kostant Proposition 2.1, §§3.3–3.5).
2. On a Levi highest-weight isotypic component of weight ξ, the Laplacian is ½(‖λ+ρ‖²−‖ξ+ρ‖²) (Theorem 5.7, pp.353–354). The complete operator computation in Theorem 4.4 remains a precisely identified proof input to refine.
3. Lemmas 5.8–5.12, pp.355–360, bound the weights. Equality occurs precisely at w(λ+ρ)−ρ, with multiplicity one; the extremal coefficient vector times the wedge of inverted root duals is a harmonic representative.
4. Proposition 5.13, pp.361–362, fixes the left-W_M-coset representative convention and the degree as the number of inverted roots. Theorem 5.14, pp.362–363, then gives the Levi decomposition. Extend the semisimple statement across the reductive centre by tensoring the scalar central character.

**Direct prerequisites.** `AF.1a/absolute-lie-cochain-complex`, `AF.4/algebraic-weight`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`

**Uses.** ArithmeticLocallySymmetricSpaces:ALS.4: Exports the absolute positive-nilradical complex, Levi action and left-W_M-coset Kostant decomposition over a splitting characteristic-zero field. Rational descent is required; the consumer does not supply its own cochain theory..

**Acceptance.**

- For 𝔤=sl₂ and the upper positive-root nilradical, a highest weight m≥0 has H⁰ of Cartan weight m and H¹ of weight −m−2, each one-dimensional.
- For P=G, the nilradical is zero and only w=1 occurs, so H⁰=V_λ and every positive degree vanishes.
- The longest-root negative weight uses the dot-action shift; ordinary wλ without ρ fails the sl₂ H¹ value.

**Signatures requiring supplier input.** `TauCeti.RelativeLieCohomology.kostant`. The native split reductive parabolic/Levi root datum, irreducible highest-weight module and compatible Levi action on the absolute nilradical complex are required for the length-indexed W_M\W decomposition. The all-degree absolute complex is native; no integral/mod-p or arbitrary chosen decomposition is substituted. Owner/input: ArithmeticLocallySymmetricSpaces:ALS.4 consumer contract; tauceti:TauCetiRoadmap/LieHighestWeight; reductive parabolic exports.

**Sources for this target.**

- B. Kostant, [Lie algebra cohomology and the generalized Borel–Weil theorem](https://people.tamu.edu/~jml/kostant61.pdf), Theorem 5.14 and proof, pp.362–363; Proposition 5.13, pp.361–362; Theorem 5.7, pp.353–354. The original complex semisimple theorem fixes the Levi action, dot action, multiplicity and cohomological degree; the cosets are W_M\W.

### Local stable coefficient lattices

**Construction** `AF.4/local-stable-lattice`. Proposed declaration: `TauCeti.Automorphic.LocalStableLattice`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.4`.

For a prime p, finite-dimensional coordinate space ℚ_p^n and compact subgroup J⊆GL_n(ℚ_p), a local stable lattice is a finitely generated ℤ_p-submodule L whose ℚ_p-span is the whole coordinate space and which is setwise invariant under J. Such a lattice exists. Two lattices are commensurable by a power of p, and gL is stable under gJg⁻¹. This is the local input to the finite-adelic lattice family, rather than a replacement for that family.

**Hypotheses.** p prime; J compact. No algebraic-group integration or global G(F)-stable lattice is assumed.

**Construction or proof route.**

1. The stabilizer of a standard lattice is open. The compact J-orbit of that lattice is finite, so its sum is finitely generated, spans the ambient vector space and is J-stable.
2. Use finite generators in each lattice to obtain the two p-power containment bounds. A common larger exponent works in both directions.
3. Transport the lattice by the actual matrix linear automorphism; apply gJg⁻¹ to gL.

**Direct prerequisites.** `mathlib:PadicInt`, `AF.4/algebraic-weight`

**Uses.** AutomorphicFormsOnReductiveGroups:AF.4/coefficient-lattices: Assembles the local components after the number-field/integral-model suppliers fix the almost-everywhere lattice..

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.LocalStableLattice` | constructor | Finitely generated, full-span ℤ_p-submodules setwise stable under J. |
| `Automorphic.LocalStableLattice.exists` | other | A compact J has a stable lattice. |
| `Automorphic.LocalStableLattice.eq_localization` | relation | There is m≥0 with p^mL⊆L′ and p^mL′⊆L. |
| `Automorphic.LocalStableLattice.map` | functoriality | gL is gJg⁻¹-stable. |
| `Automorphic.LocalStableLattice.standard` | constructor | The coordinate lattice ℤ_p^n. |
| `Automorphic.LocalStableLattice.standard_mem` | characterisation | Membership in the coordinate lattice is coordinatewise p-integrality. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `localLattice_standard` | computation | If every matrix of J has p-integral entries, the coordinate lattice is J-stable. |
| `localLattice_rank_zero` | degenerate | In rank zero the only stable lattice is the zero submodule. |
| `localLattice_not_unique` | non-example | For n>0, pL is a distinct stable lattice: uniqueness is not part of the carrier. |

**Acceptance.**

- If every matrix of J has p-integral entries, the coordinate lattice is J-stable.
- In rank zero the only stable lattice is the zero submodule.
- For n>0, pL is a distinct stable lattice: uniqueness is not part of the carrier.

**Native signature scope.** Native ℤ_p finitely generated full-ℚ_p-span submodule invariant under a compact GL_n subgroup, existence, map and commensurability. This is a local input with separate names, not the missing global O_E adelic lattice family.

**Sources for this target.**

- Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://arxiv.org/abs/2407.21237), §4.2.2, arXiv p.72. The p-adic stable-coefficient-lattice use; the displayed compact-orbit construction is the local linear algebra supporting it.

### Relative cohomology with a supplied coefficient

**Construction** `AF.4/cohomological-with-coefficient`. Proposed declaration: `TauCeti.Automorphic.IsCohomologicalWith`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.4`.

For a compatible (𝔮,K)-module A and a specified finite-dimensional compatible coefficient B, IsCohomologicalWith(A,B) means that H^n(𝔮,K;A⊗B) is nonzero for some n≥0. It selects a witnessing degree. If A has scalar infinitesimal character χ and B∨ has scalar character χ∨, nonzero cohomology implies χ=χ∨ by Wigner’s lemma. The unrestricted supplied-coefficient predicate does not assert that B is irreducible algebraic; that requirement belongs to IsCohomological.

**Hypotheses.** K compact and both actions compatible with its actual differentiated inclusion; B finite-dimensional.

**Construction or proof route.**

1. Use the actual tensor-product module and relative cochain complex. Select a nonzero degree from the existential statement.
2. The central action on Ext blocks yields Wigner’s equality with the contragredient coefficient. The minus sign on the differentiated dual action is essential; the relative resolution proof remains a recorded gap.

**Direct prerequisites.** `AF.1a/relative-lie-cochain-complex`, `AF.1/infinitesimal-character`, `AF.4/wigner-lemma`

**Uses.** AutomorphicFormsOnReductiveGroups:AF.4/cohomological-representation: Supplies the cohomology predicate before imposing irreducible algebraic coefficient provenance..

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.IsCohomologicalWith` | data | Nonzero relative cohomology of A⊗B in some degree. |
| `Automorphic.IsCohomologicalWith.nonzeroDegree` | projection | A chosen degree with nonzero cohomology. |
| `Automorphic.IsCohomologicalWith.nonzeroDegree_nonzero` | characterisation | The selected degree has nonzero cohomology. |
| `Automorphic.IsCohomologicalWith.infChar` | relation | The character of A equals that of B∨ when both are scalar and cohomology is nonzero. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `cohomologicalWith_trivial` | degenerate | The trivial module with trivial coefficient has nonzero H⁰. |
| `cohomological_zero_coefficient` | computation | A zero coefficient has zero cohomology in every degree. |
| `cohomological_wrong_character` | non-example | Different scalar characters for A and B∨ preclude cohomology. |

**Acceptance.**

- The trivial module with trivial coefficient has nonzero H⁰.
- A zero coefficient has zero cohomology in every degree.
- Different scalar characters for A and B∨ preclude cohomology.

**Native signature scope.** Native nonzero relative cohomology with an explicitly supplied finite-dimensional coefficient, witness degree and contragredient character equality. The full cohomological predicate must also require irreducible algebraic coefficient provenance from the native integration supplier.

**Sources for this target.**

- Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet-Langlands correspondence](https://arxiv.org/abs/1806.10563), §7.1, arXiv p.40. The relative cohomology with a fixed finite-dimensional coefficient underlying the cohomological predicate.

## AF.5. Comparison examples and transport

The GL₁ dictionary imports Hecke characters and infinity types from GlobalNumberFields. The GL₂ dictionary imports classical slash actions, characters, diamonds, normalized Hecke operators and newforms from ModularForms. Adelization fixes the positive-determinant and rotation convention and must be compatible with the inverse slash/diamond action. Higher-rank L-functions, genericity and spectral applications stay with their existing owners.

Algebraic modular forms are coefficient-valued double-coset functions, in both Gross rational and level-action conventions. A finite class set yields an evaluation equivalence with stabilizer invariants. Full arithmetic stabilizers, sufficiently small levels and invertible orders govern freeness and base change; the C₂ sign example distinguishes a valid invariant-base-change hypothesis from an invalid unconditional statement. Weighted Hecke operators require coefficient action on the chosen semigroup and representatives lying in the actual double coset. The fixed-central-character branch uses central double cosets and descended effective stabilizers, with a separate finiteness request for positive-unit-rank centres. Weil restriction/product transport consumes actual RG2 and AA isomorphisms and preserves arithmetic central finiteness through the cited Langlands result.

**Required refinements for closure.**

- Finish native GL₁/GL₂ adelic/classical component maps, positive-determinant/rotation conventions, slash and diamond inverse actions, and the normalized Hecke dictionary using the existing ModularForms owners.
- Discharge AA ordinary and central-quotient finite class-set/effective-stabilizer inputs for algebraic modular forms. Prove arithmetic compact comparison, definite quaternion ideal-class tests and the positive-unit-rank central-character extension.
- Complete scalar-restriction, product and generalized central-character transport with actual smooth/K/Lie and arithmetic identifications. Resolve the proposed owner/stage-prefix splits through the orchestrator, without claiming unsplit stage acyclicity.

### The GL_1 dictionary: automorphic representations of GL_1 are Hecke characters

**Theorem** `AF.5/gl1-dictionary`. Proposed declaration: `TauCeti.Automorphic.GL1.automorphicRepresentationEquiv`. Module: `TauCeti/Automorphic/GL1`. Realises `AF.5`.

Atlas planet: **GL₁ automorphic dictionary**.

Let F be a number field. (i) The automorphic representations of GL_1(𝔸_F) are exactly the Hecke characters χ ∈ HeckeCharacter F = ContinuousMonoidHom(IdeleClassGroup F, ℂ^×) (Tau Ceti GlobalNumberFields Layer 9), viewed as (𝔤𝔩_1, K_∞) × 𝔸_f^×-modules ℂχ; each occurs with multiplicity one and is cuspidal. (ii) A(GL_1) = ⊕_χ A(GL_1)_{(χ)}, where A(GL_1)_{(χ)} = χ·ℂ[log\|·\|] (generalized eigenspaces). (iii) The infinity type of χ (ContinuousInfinityType: (s_w, ε_w) at real w, (s_w, k_w) at complex w, GlobalNumberFields Layer 10) is the archimedean component π_∞ under the identification of irreducible (𝔤𝔩_1, K_∞)-modules with characters of F_∞^×; the finite conductor of χ is the conductor of π^∞ (the minimal conductor ideal defined by triviality on the standard local principal-unit subgroups); the unitary twist χ\|·\|^{−shift χ} corresponds to the unitary normalisation of π. (iv) π is C-algebraic (= L-algebraic, ρ = 0) iff χ is algebraic of type A_0.

**Hypotheses.** F a number field; The finite conductor is the minimal ideal specified by triviality on the standard local principal-unit groups, not a largest arbitrary open subgroup.

**Construction or proof route.**

1. GL_1(F)\GL_1(𝔸_F) is the idele class group (AdelicAlgebraicGroups:AA.5/gl1-adelic-quotient).
2. Automorphic forms on an abelian group: Z(𝔤) = U(𝔤) acts through derivatives; K_∞-finiteness and Z-finiteness give finite sums of characters times polynomials in log\|·\| (Pontryagin duality on the compact norm-one quotient, AdelicAlgebraicGroups:AA.2/split-centre-decomposition).
3. Irreducible subquotients are one-dimensional: Hecke characters; multiplicity one since a character is determined by its values.
4. Infinity types and conductors are read off from the local components (Tau Ceti GlobalNumberFields Layers 9, 10); A_0 ↔ C-algebraic since ρ = 0.

**Direct prerequisites.** `AdelicAlgebraicGroups:AA.5/gl1-adelic-quotient`, `AdelicAlgebraicGroups:AA.2/split-centre-decomposition`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `AF.2/automorphic-representation`, `AF.4/c-l-algebraic`, `mathlib:NumberField.IdeleClassGroup`

**Acceptance.**

- F = ℚ: Hecke characters of finite order ↔ primitive Dirichlet characters (GlobalNumberFields Layer 9 dictionary), with parity = π_∞(−1).
- The norm character \|·\|_𝔸 is automorphic with infinity type s = 1 and conductor 1; it is algebraic (type A_0 with n_σ = 1).

**Signatures requiring supplier input.** `TauCeti.Automorphic.GL1.automorphicRepresentationEquiv`. The native idele-class Hecke-character carrier and the adelic GL₁ automorphic class are required for the equivalence; character classification is imported from GlobalNumberFields. Owner/input: tauceti:TauCetiRoadmap/GlobalNumberFields; AdelicAlgebraicGroups:AA.1–AA.2.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §10.1, proof of Theorem 10.8, p. 47. Automorphic representations of GL_1 are idele class characters.

### Adelization of classical modular forms for GL_2/ℚ

**Construction** `AF.5/gl2-classical-to-adelic`. Proposed declaration: `TauCeti.Automorphic.GL2.adelize`. Module: `TauCeti/Automorphic/GL2Dictionary`. Realises `AF.5`.

Atlas planet: **Adelization of modular forms**.

Let N ≥ 1, χ a Dirichlet character mod N, k ≥ 1 and f : ℍ → ℂ satisfying f\|_kγ = χ(d)f for γ = (a b; c d) ∈ Γ_0(N). With K_0(N) = {(a b; c d) ∈ GL_2(\hat ℤ) : c ≡ 0 mod N} and the character λ_χ(k) = χ_N(d_N) of K_0(N) (χ viewed on (ℤ/N)^×), strong approximation GL_2(𝔸_ℚ) = GL_2(ℚ)GL_2(ℝ)^+K_0(N) gives a well-defined function φ_f(γ g_∞ k) = λ_χ(k)⁻¹·(f\|_k g_∞)(i) for γ ∈ GL_2(ℚ), g_∞ ∈ GL_2(ℝ)^+, k ∈ K_0(N), where (f\|_k g)(z) = det(g)^{k/2} j(g, z)^{−k} f(gz) and j(g, z) = cz + d (so φ_f(g_∞) = det(g_∞)^{k/2} j(g_∞, i)^{−k} f(g_∞i)). φ_f is left GL_2(ℚ)-invariant, satisfies φ_f(g r_θ) = e^{ikθ}φ_f(g), φ_f(zg) = ω_χ(z)φ_f(g) for z in the centre, where ω_χ is the Hecke character with ω_χ\|_{ℝ_{>0}} = 1, ω_χ(−1_∞) = (−1)^k and finite part χ⁻¹ on \hat ℤ^× (with the convention λ_χ), and φ_f is right invariant under K_1(N).

**Hypotheses.** χ(−1) = (−1)^k (otherwise f = 0); slash action with the det^{k/2} normalisation (Mathlib's SlashAction on GL(2,ℝ)^+ uses det^{k−1}; the comparison is part of the API); Use r_θ=[[cos θ,sin θ],[−sin θ,cos θ]], so φ_f(gr_θ)=e^{ikθ}φ_f(g). The archimedean displayed upper-half-plane formula is on det(g)>0; extend to the other component using the adelic decomposition, not the positive-half-plane formula applied to negative determinants.

**Construction or proof route.**

1. Strong approximation for SL_2 and det(K_0(N)) = \hat ℤ^× give GL_2(𝔸) = GL_2(ℚ)GL_2(ℝ)^+K_0(N) (AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component, AA.4/strong-approximation-theorem).
2. Well-definedness: GL_2(ℚ) ∩ GL_2(ℝ)^+K_0(N) = Γ_0(N) and the transformation law of f with χ(d).
3. Weight: (f\|_k(g r_θ))(i) = e^{ikθ}(f\|_k g)(i) since r_θ fixes i and j(r_θ, i) = e^{−iθ}.
4. Central character from the action of scalars z·1 ∈ ℚ^× ℝ_{>0} \hat ℤ^× and f\|_k(−1) = (−1)^k f.

**Direct prerequisites.** `AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component`, `AdelicAlgebraicGroups:AA.5/upper-half-plane-action-conventions`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `mathlib:SlashAction`, `mathlib:ModularForm`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`

**Uses.** AF.5/gl2-dictionary: the dictionary theorem. GL2AutomorphicRepresentationsAndTransfer:R16.6: comparison of primitive classical forms with holomorphic GL₂ representations. AutomorphicGaloisRepresentations:R19.1: basic GL₂/ℚ classical-to-adelic realisation (RS-21 owner AF.5). MetaplecticAutomorphicForms:MP.8: automorphic realisation of the normalised elliptic newform.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.GL2.adelize` | constructor | f ↦ φ_f from Mathlib ModularForm (Γ_1(N) with character χ) to functions on GL_2(𝔸_ℚ). |
| `Automorphic.GL2.adelize_left` | characterisation | φ_f(γg) = φ_f(g) for γ ∈ GL_2(ℚ). |
| `Automorphic.GL2.adelize_weight` | simp | φ_f(g r_θ) = e^{ikθ}φ_f(g). |
| `Automorphic.GL2.adelize_level` | simp | φ_f(gk) = λ_χ(k)⁻¹φ_f(g) for k ∈ K_0(N). |
| `Automorphic.GL2.adelize_central` | projection | φ_f(zg) = ω_χ(z)φ_f(g) with ω_χ the Hecke character attached to χ (GlobalNumberFields Layer 9 dictionary). |
| `Automorphic.GL2.adelize_slash_compat` | compatibility | Comparison with Mathlib's SlashAction normalisation det^{k−1}j^{−k}: (f ∣[k] g) = det(g)^{k/2−1}(f\|_k g). |
| `Automorphic.GL2.adelize_injective` | other | f ↦ φ_f is injective and linear. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `adelize_Delta_level` | computation | φ_Δ is right GL_2(\hat ℤ)-invariant and φ_Δ(diag(y, 1)_∞) = y^6 Δ(iy). |
| `adelize_zero` | degenerate | φ_0 = 0, and for χ(−1) ≠ (−1)^k the source space is 0. |
| `adelize_weight_sign` | non-example | With j(g, z)^{+k} instead of j(g, z)^{−k} the resulting function is not left GL_2(ℚ)-invariant: for f = Δ and γ = (0 −1; 1 0) the two sides differ by the factor j(γ, z)^{2k}. |
| `adelize_slash_mathlib` | compatibility | For g ∈ GL_2(ℝ)^+, Mathlib's (f ∣[k] g)(i) equals det(g)^{k/2−1}·(f\|_k g)(i). |

**Acceptance.**

- For f = Δ (N = 1, χ = 1, k = 12) φ_Δ is right GL_2(\hat ℤ)-invariant with trivial central character.
- The central character of φ_f for χ of conductor N is the Hecke character whose finite part on \hat ℤ^× is χ⁻¹ (with the convention λ_χ above); the opposite convention changes χ to χ⁻¹ and must be fixed once.

**Signatures requiring supplier input.** `TauCeti.Automorphic.GL2.adelize`, `TauCeti.Automorphic.GL2.adelize_left`, `TauCeti.Automorphic.GL2.adelize_weight`, `TauCeti.Automorphic.GL2.adelize_level`, `TauCeti.Automorphic.GL2.adelize_central`, `TauCeti.Automorphic.GL2.adelize_slash_compat`, `TauCeti.Automorphic.GL2.adelize_injective`, `adelize_Delta_level`, `adelize_zero`, `adelize_weight_sign`, `adelize_slash_mathlib`. The native adelic GL₂ quotient, component representatives, positive-determinant factorization and classical modular form with character/slash action are supplier types. The map cannot be stated against the Mathlib-only generic function carrier as the original adelization. Owner/input: AdelicAlgebraicGroups:AA.1–AA.2; tauceti:TauCetiRoadmap/ModularForms.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.4, p. 32. The archimedean part of the adelization (Getz–Hahn use j(g, z) = det(g)^{−1/2}(cz + d), which equals our det^{k/2}j^{−k} normalisation).
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.4, Remark 6.20, p. 33. Passage to adelic forms on GL_2(𝔸) at level K_0(N).

### The GL_2/ℚ dictionary between modular forms and automorphic forms

**Theorem** `AF.5/gl2-dictionary`. Proposed declaration: `TauCeti.Automorphic.GL2.modularFormEquiv`. Module: `TauCeti/Automorphic/GL2Dictionary`. Realises `AF.5`.

Atlas planet: **GL₂/ℚ modular–automorphic dictionary**.

With φ_f as in AF.5/gl2-classical-to-adelic: (i) f ↦ φ_f is an isomorphism from M_k(Γ_0(N), χ) onto the space of automorphic forms φ on GL_2(𝔸_ℚ) with φ(gk) = λ_χ(k)⁻¹φ(g) (k ∈ K_0(N)), central character ω_χ, right SO(2)-type e^{ikθ}, killed by the lowering operator L = ½(H − i(X + Y)) ∈ 𝔰𝔩_2(ℂ) (H = diag(1, −1), X = E_{12}, Y = E_{21}; L lowers the SO(2)-weight by 2; it equals −i times Zhang's ½(i 1; 1 −i)) (equivalently, R(L)φ_f = 0 iff f is holomorphic), and with Casimir eigenvalue Δφ = (k(k−2)/4)φ for Δ = ¼(H² + 2XY + 2YX); (ii) f is a cusp form iff φ_f is cuspidal (φ_{f,B} = 0, which unwinds to vanishing of the constant term at every cusp); (iii) moderate growth of φ_f is equivalent to holomorphy of f at the cusps (bounded at cusps); (iv) translation and the Lie action agree: the raising operator ½(H + i(X + Y)) maps φ_f to a constant multiple of φ_{δ_k f}, where δ_k f = ∂_z f + (k/(2iy)) f is the Maass–Shimura operator of weight k to k + 2 (the constant is fixed with the normalisations); (v) for k ≥ 2 a cusp form f that is a newform generates an irreducible cuspidal automorphic representation π_f with π_{f,∞} ≅ D_k(0) (AF.1/gl2-real-discrete-series) and π_{f,p} unramified for p ∤ N.

**Hypotheses.** k ≥ 1; χ(−1) = (−1)^k; The cusp condition is boundedness of the holomorphic classical f at every cusp; y^{k/2}\|f(z)\| need not be bounded for a noncuspidal modular form. The exact scalar in the raising-operator comparison remains to be computed in these matrix and slash conventions, rather than asserted without a value.

**Construction or proof route.**

1. (i) Surjectivity: given φ of the stated type, f(z) = φ(g_z) j(g_z, i)^k det(g_z)^{−k/2} with g_z = (y^{1/2} xy^{−1/2}; 0 y^{−1/2}) recovers f; holomorphy ⇔ R(L)φ = 0 (Cauchy–Riemann in the coordinates of g_z).
2. Casimir: write Δ = ¼(H² + 2H + 4YX) (using XY − YX = H) in the weight basis and evaluate on φ_f, of SO(2)-weight k and killed by L, to get k(k−2)/4; Getz–Hahn's Lemma 6.19 prints ¼(k² − 1), contradicted by their §6.5 (sourceIssues E1).
3. (ii) Constant term along B at g = n(x)a(y)k equals the 0-th Fourier coefficient of f\|_kγ at the cusp γ∞ (AF.3/constant-term), via the double coset decomposition GL_2(ℚ)\GL_2(𝔸)/B(𝔸)… over cusps of Γ_0(N).
4. (iii) Moderate growth of φ_f gives polynomial growth of the holomorphic f at every cusp. Its Fourier expansion then has no negative terms, so f is bounded at the cusp (Mathlib bdd_at_cusps′); conversely bounded f yields polynomial growth of φ_f. The expression y^{k/2}\|f\| need not be bounded for a noncuspidal f.
5. (iv) Lie action: compute R(X), R(Y), R(H) on φ_f in coordinates; translation by G(ℝ)^+ is the slash action.
6. (v) Irreducibility and local components: π_{f,∞} has lowest weight k, Casimir k(k−2)/4, hence ≅ D_k(0) by the classification; unramified at p ∤ N by K_0(N)-invariance.

**Direct prerequisites.** `AF.5/gl2-classical-to-adelic`, `AF.2/automorphic-form`, `AF.3/cusp-form`, `AF.3/constant-term`, `AF.1/gl2-real-discrete-series`, `AF.2/adelic-classical-bijection`, `mathlib:CuspForm`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

**Acceptance.**

- k = 12, N = 1: S_12(SL_2(ℤ)) = ℂΔ ≅ the space of cusp forms of weight 12, level GL_2(\hat ℤ), Casimir 30, trivial central character.
- k = 2: Casimir eigenvalue 0 (the infinitesimal character of the trivial representation), consistent with Eichler–Shimura in weight 2.
- M_k(Γ_0(N), χ) for χ(−1) ≠ (−1)^k is 0 on both sides.

**Signatures requiring supplier input.** `TauCeti.Automorphic.GL2.modularFormEquiv`. The native adelization/deadelization carriers and newform/conductor/multiplicity-one exports from the existing ModularForms owner are required. Owner/input: AF.5/gl2-classical-to-adelic; tauceti:TauCetiRoadmap/ModularForms.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.4, Lemma 6.19, p. 33. The dictionary for cusp forms, with the Casimir ideal corrected to ⟨Δ − k(k−2)/4, Z⟩ (sourceIssues E1).
- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.5, p. 34. Archimedean component D_k(0) (same Casimir misprint).

### Hecke operators and diamond operators in the GL_2/ℚ dictionary

**Theorem** `AF.5/gl2-hecke-normalisation`. Proposed declaration: `TauCeti.Automorphic.GL2.hecke_adelize`. Module: `TauCeti/Automorphic/GL2Dictionary`. Realises `AF.5`.

For p∤N, vol(GL_2(ℤ_p))=1, and the determinant-unitary adelization φ_f, let R_p=R(1_{K_p diag(p,1)K_p}). Then R_p φ_f=p^{1−k/2}φ_{T_p f}, or φ_{T_p f}=p^{k/2−1}R_pφ_f. For a newform the operator p^{−1/2}R_p has eigenvalue a_p/p^{(k−1)/2}; no additional determinant twist is applied to this already unitary adelization. Right translation by a K_0(N) lift with lower-right entry d multiplies φ_f by χ(d)⁻¹; the classical diamond χ(d) corresponds to the inverse right-translation operator. The cohomological twist D_k(2−k) and its rational finite-part normalization are recorded separately.

**Hypotheses.** p ∤ N

**Construction or proof route.**

1. Use right cosets q_bK_p, q_b=[[p,b],[0,1]], 0≤b<p, and q_∞K_p with q_∞=diag(1,p). Pull rational q_i to the left in φ_f(g_∞q_i,f), so the archimedean argument is q_i⁻¹g_∞.
2. At the upper-half-plane point z this gives p^{−k/2}Σ_b f((z−b)/p)+χ(p)p^{k/2}f(pz); the nebentypus factor in the second term comes from q_∞⁻¹ at primes dividing N. Periodicity replaces −b by b.
3. Compare with T_pf=χ(p)p^{k−1}f(pz)+p⁻¹Σ_b f((z+b)/p). Hence R_pφ_f=p^{1−k/2}φ_{T_pf}. Multiply R_p by p^{−1/2} to obtain a_p/p^{(k−1)/2}.
4. Compare χ(d)⁻¹ in the adelic level transformation with the classical χ(d) diamond eigenspace; use inverse right translation for the classical diamond. The pinned modular-form Hecke endomorphisms require this explicit scalar/slash normalization bridge.

**Direct prerequisites.** `AF.5/gl2-dictionary`, `AF.0/finite-hecke-action`, `tauceti:HeckeRing.GL2.heckeSlashModularFormEnd`, `tauceti:HeckeRing.GL2.twistedHeckeSlashModularFormCharEnd`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`

**Acceptance.**

- Δ: τ(p) = p^{5}·(eigenvalue of R(1_{K diag(p,1) K}) on φ_Δ), e.g. τ(2) = −24.
- The normalised eigenvalue a_p/p^{(k−1)/2} of a newform is bounded by 2 (Deligne), the temperedness of π_{f,p}; this bound is not used here.

**Signatures requiring supplier input.** `TauCeti.Automorphic.GL2.hecke_adelize`. The native normalized classical T_p with nebentypus and finite adelic double-coset action on the actual adelization carrier are required, including the diamond inverse action. Owner/input: tauceti:TauCetiRoadmap/ModularForms; AF.5/gl2-classical-to-adelic.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §6.4, Remark 6.20, p. 33. Level K_0(N) adelic forms, on which the local Hecke algebras act.

### Algebraic automorphic forms on groups compact at infinity

**Definition** `AF.5/algebraic-modular-forms`. Proposed declaration: `TauCeti.Automorphic.AlgebraicModularForm`. Module: `TauCeti/Automorphic/AlgebraicModularForm`. Realises `AF.5`.

Atlas planet: **Algebraic modular forms**.

Let G be connected reductive over a number field F with G(F ⊗ ℝ) compact modulo the centre (more precisely: G(F_∞)/A_∞ compact and Z_G(F) discrete in Z_G(𝔸_f)), E a number field, O_E its integers, A an O_E-algebra, M a finite A-module with a continuous action of a compact open J_f ⊆ G(𝔸_f) through finitely many places (for example a J_f-stable lattice in an algebraic representation V_λ restricted through J_p, possibly twisted by an inertial type, AF.4/coefficient-lattices). The space of algebraic modular forms is S(J_f, M) = {f : G(F)\G(𝔸_f) → M : f(gu) = u⁻¹·f(g) for u ∈ J_f}. Equivalently (rational form, Gross) for V an algebraic representation over E: {f : G(𝔸_f)/J_f → V(E) : f(γg) = γ·f(g)}, the two related by f ↦ (g ↦ g_p⁻¹ f(g)) after extending scalars to E_p. When the coefficient action extends to the chosen Hecke semigroup, Hecke operators [J_f g J_f] act by Σ_i g_i·f(x g_i) over J_f g J_f = ⊔ g_iJ_f; change of level J'_f ⊆ J_f gives restriction S(J_f, M) → S(J'_f, M) and trace S(J'_f, M) → S(J_f, M). J_f is sufficiently small if for some finite place v its projection to G(F_v) has no nontrivial element of finite order.

**Hypotheses.** G(F_∞) compact modulo centre; M finite over A with J_f-action through a finite set of places; Retain BOTH G(F_∞)/A_∞ compact and Z_G(F) discrete in Z_G(𝔸_f). The coefficient action may be continuous p-adic and need not factor through a finite quotient; only its mod-λ^m reduction does under the stated finite-module hypotheses. For weighted Hecke sums the coefficient action must extend to the chosen Hecke semigroup; a bare J_f action supplies only scalar Hecke operators at places acting trivially on M. The Gross rational comparison applies to an actual algebraic coefficient extended to the p-adic points, not an arbitrary inertial-type twist.

**Construction or proof route.**

1. Use finitely many double-coset representatives and continuous J_f covariance, giving values in the stabilizer-invariant coefficient modules. A finite p-adic coefficient module in the sense of finite generation can have infinite J_f image; it need not have an open kernel. For finite mod-λ^m coefficients, the action factors through a finite quotient and a sufficiently deep J′ acts trivially.
2. Hecke operators and level change as finite sums (AdelicAlgebraicGroups:AA.4/hecke-correspondence, AA.4/double-coset-level-map).
3. For an algebraic representation whose action extends to the p-adic points, twisting f(g) by g_p^−1 compares rational and p-adic conventions after scalar extension. This comparison is not asserted for an arbitrary inertial-type coefficient.

**Direct prerequisites.** `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.4/hecke-correspondence`, `AdelicAlgebraicGroups:AA.4/double-coset-level-map`, `AF.4/coefficient-lattices`, `AF.4/algebraic-weight`, `mathlib:DoubleCoset.Quotient`, `mathlib:DoubleCoset.mk`

**Uses.** HilbertModularVarietiesAndShimuraCurves:R18.3: definite quaternionic instance with integral coefficients, Hecke operators and level change (RS-23 owner AF.5). GL2ModularityLifting:R32.3: patching with algebraic modular forms on definite groups. CompletedCohomologyPartII:CC.2: p-adic completions Ŝ_{ξ,τ}(U^℘, E) of these spaces (Ding §4.2.2).

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.AlgebraicModularForm` | data | Gross’s rational coefficient convention {f:G(𝔸_f)→V(E) : f(γg)=γf(g), f(gu)=f(g)} as an E-module; its scalar-ring abstraction is the suggested AlgebraicModularForm carrier. |
| `Automorphic.LevelAlgebraicModularForm` | data | The J_f-coefficient convention {f:G(F)\G(𝔸_f)→M : f(gu)=u⁻¹f(g)} as an A-module, with the actual coefficient representation of J_f supplied. |
| `Automorphic.AlgebraicModularForm.hecke` | constructor | The operator [J_f g J_f]. |
| `Automorphic.AlgebraicModularForm.res` | functoriality | Restriction to smaller level, with res ∘ res = res. |
| `Automorphic.AlgebraicModularForm.trace` | functoriality | Trace to larger level by the finite coset sum; trace ∘ res = [J_f:J′_f]·id, without a smallness assumption. Integral coefficient transport uses the corresponding weighted sum. |
| `Automorphic.AlgebraicModularForm.rationalEquiv` | equivalence | For an actual algebraic coefficient extended to the selected p-adic factor, transport f↦(g↦g_p⁻¹f(g)) identifies the rational and J_f-coefficient conventions; inverse transport multiplies by g_p. An arbitrary inertial-type J_f-representation is not covered by this equivalence. |
| `Automorphic.IsSufficientlySmall` | data | BCGP25 Definition 5.7.2. |
| `Automorphic.AlgebraicModularForm.baseChange` | compatibility | S(J_f, M) ⊗_A B ≅ S(J_f, M ⊗_A B) when J_f is sufficiently small (freeness). |
| `Automorphic.AlgebraicModularForm.trivialEquiv` | equivalence | For trivial scalar coefficients, canonical evaluation identifies the rational carrier with A-valued functions on the baseline double-coset quotient im(Γ)\G_f/J. |
| `Automorphic.AlgebraicModularForm.trivialEquiv_apply` | simp | The equivalence sends f evaluated at the double-coset class of g to f(g). |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `amf_trivial_coeff` | computation | For M = A trivial, S(J_f, A) = A^{G(F)\G(𝔸_f)/J_f}. |
| `amf_zero` | degenerate | S(J_f, 0) = 0. |
| `amf_definite_quaternion` | computation | For D = the definite quaternion algebra over ℚ ramified at {2, ∞} and a maximal order, h = 1 and S(\hat O^×, ℤ) = ℤ. |
| `amf_not_small_basechange` | non-example | Non-small level can obstruct coefficient base change. The finite-stabilizer model Γ=C₂ acting by −1 on M=ℤ has M^Γ=0 but (M⊗𝔽₂)^Γ=𝔽₂. Divisibility p∣\|Γ\| alone does not force failure: trivial coefficients give a counterexample to that universal claim. |

**Acceptance.**

- For a definite quaternion algebra D/ℚ, maximal order O, J_f=Ohat^× and M=ℤ, S(J_f,ℤ)=ℤ^h where h is the ideal class number. It is not the type number of maximal orders. This specializes R18.3.
- Definite unitary group G/F^+ (BCGP25 §5.7, Ding §4.2.2) with M = W_{ξ,τ} a lattice in σ(τ) ⊗ L(ξ): the spaces S_{ξ,τ}(U^℘U_℘, O_E/ϖ^k) whose limit Ŝ_{ξ,τ} is the completed cohomology of CompletedCohomologyPartII.

**Native signature scope.** Native Gross rational and level-coefficient carriers, weighted semigroup Hecke maps with exact right-coset support, scalar transport and canonical tensor base-change. Arithmetic finite class set, quaternion test and compact-infinity comparison require AA/classification suppliers.

**Signatures requiring supplier input.** `amf_definite_quaternion`. The native definite quaternion algebra, finite adelic ideal-class set and its class-number calculation require the arithmetic supplier. Generic coefficient-valued double-coset functions and all native Hecke/base-change formulas are already present. Owner/input: AdelicAlgebraicGroups:AA.3; quaternion arithmetic owner.

**Sources for this target.**

- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §5.7.2, arXiv p. 131. Definition 5.7.2; the spaces S_λ(U, A) of §5.7 are functions with f(gu) = u⁻¹f(g).
- Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://arxiv.org/abs/2407.21237), §4.2.2, arXiv p. 72. Coefficient lattices with inertial types (the lattice should be in the tensor product over v ∈ S_p∖{℘}: sourceIssues E9).

### Finiteness and the automorphic comparison for algebraic modular forms

**Theorem** `AF.5/algebraic-modular-forms-structure`. Proposed declaration: `TauCeti.Automorphic.AlgebraicModularForm.equivSum`. Module: `TauCeti/Automorphic/AlgebraicModularForm`. Realises `AF.5`.

With G compact at infinity as in AF.5/algebraic-modular-forms: (i) G(F)\G(𝔸_f)/J_f = {t_1, …, t_h} is finite and S(J_f, M) ≅ ⊕_i M^{Γ_i} with Γ_i = G(F) ∩ t_iJ_ft_i⁻¹ finite under the discrete-centre hypothesis of AF.5/algebraic-modular-forms; (ii) if J_f is sufficiently small, all full Γ_i are trivial and S(J_f, M) ≅ M^h is finite free when M is; (iii) for M = V_λ ⊗ ℂ, S(J_f, V_λ) ≅ Hom_{G(F_∞)}(V_λ^∨, A(G)^{J_f}) (algebraic modular forms of weight λ are automorphic forms whose archimedean component is the finite-dimensional V_λ^∨), compatibly with Hecke operators; so the irreducible G(𝔸_f)-constituents of lim_J S(J, V_λ ⊗ ℂ) are the finite parts of automorphic representations π with π_∞ ≅ V_λ^∨, each appearing with multiplicity m(π).

**Hypotheses.** G(F_∞) compact modulo centre; for (ii) J_f sufficiently small; Use the full finite stabilizers Γ_i under the two hypotheses of AF.5/algebraic-modular-forms. A merely compact-mod-real-centre group may have infinite integral central stabilizers. Definite quaternion groups have no proper rational parabolics, so constants are cuspidal; no Eisenstein summand is inferred from the constant function. GL_1/ℚ and imaginary-quadratic GL_1 meet the compact-mod-A_∞ condition, whereas general positive-unit-rank examples need their actual split-centre calculation.; For p-adic J_f coefficients, Γ_i acts on M through γ↦t_i^−1γt_i∈J_f. For the rational convention it acts through the algebraic G(F)-representation. These actions are related by the stated transport, not silently identified.

**Construction or proof route.**

1. (i) Finiteness of class numbers (AdelicAlgebraicGroups:AA.3/class-number-finite) and discreteness of G(F) in G(𝔸_f) (compactness at infinity), so Γ_i is discrete in the compact t_iJ_ft_i⁻¹, hence finite.
2. (ii) A sufficiently small J_f has torsion-free projection at some v, and Γ_i embeds in it.
3. (iii) In the prescribed A_∞-central character matching V_λ^∨, the quotient G(F_∞)/A_∞ is compact. Its finite-dimensional isotypic decomposition, followed by evaluation at g_∞=1, gives the rational-coefficient Gross dictionary. Actual compactness of G(F_∞) is not assumed; the split-central action must first be matched.

**Direct prerequisites.** `AF.5/algebraic-modular-forms`, `AF.2/automorphic-form`, `AF.2/automorphic-representation`, `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.4/neat-level-exists`

**Acceptance.**

- For a definite quaternion algebra and λ=0, the whole space S(J_f,ℂ), including constants, is cuspidal: there are no proper rational parabolics. Constants afford the trivial representation; they are not an Eisenstein summand.
- GL_1/ℚ and GL_1 over an imaginary quadratic field have compact G(F_∞)/A_∞ and discrete rational centre in the finite adeles. When r_1+r_2≥2, the positive archimedean norm coordinates modulo the diagonal A_∞ have a noncompact ℝ^{r_1+r_2−1} factor. The norm-one imaginary-quadratic torus is compact and also satisfies the hypothesis.

**Native signature scope.** Native evaluation equivalence given actual exhaustive unique double-coset representatives, full stabilizer invariants and invertible-stabilizer-order base change. The signature does not prove arithmetic class-number finiteness or the automorphic archimedean comparison.

**Sources for this target.**

- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §5.7, arXiv p. 133. A_λ = lim_U S_λ(U, ℚ̄_2) and its irreducible constituents as finite parts of automorphic representations.

### Restriction of scalars, products and central characters

**Theorem** `AF.5/transport-compatibilities`. Proposed declaration: `TauCeti.Automorphic.automorphicForm_resScalarsEquiv`. Module: `TauCeti/Automorphic/AlgebraicModularForm`. Realises `AF.5`.

(i) For a finite extension E/F and G over E, Res_{E/F}G(𝔸_F) = G(𝔸_E) and Res_{E/F}G(F) = G(E) as topological groups (AdelicAlgebraicGroups:AA.1/base-change-adelic); this identifies A(Res_{E/F}G) with A(G) (with 𝔤_∞ and K_∞ matched) and automorphic, cuspidal and cohomological representations on both sides (Res_{E/F}V_λ ↔ V_λ, and ℓ₀, q₀ are preserved). (ii) For G = G_1 × G_2, A(G) ⊇ A(G_1) ⊗ A(G_2) as an algebraic external tensor product map; no density assertion is made without a specified completion/topology; irreducible automorphic representations of G are exactly π_1 ⊠ π_2 with π_i automorphic, and cuspidal ones are products of cuspidal ones. (iii) Central characters: A(G) = ⊕_ω A(G)_{(ω)} over characters ω of Z_G(F)\Z_G(𝔸) (generalized eigenspaces), the decomposition being compatible with (i)-(ii). Inner forms: no identification of automorphic forms on G and an inner form G' is asserted; transfer (Jacquet–Langlands and endoscopic) is owned by the transfer roadmaps (GL2AutomorphicRepresentationsAndTransfer R17.3, EndoscopicTransferAndUnitaryTraceComparison).

**Hypotheses.** E/F finite separable; G_1, G_2 reductive over F

**Construction or proof route.**

1. (i) Points of Weil restrictions (ReductiveGroupsPartII RG2.0a; AdelicAlgebraicGroups AA.1 base change of adelic points) and Lie algebras Lie(Res G)(ℝ) = Lie(G)(E ⊗ ℝ).
2. (ii) Products: Z(𝔤_1 × 𝔤_2) = Z(𝔤_1) ⊗ Z(𝔤_2), K = K_1 × K_2; irreducible admissible modules of a product are exterior tensor products (Getz–Hahn Theorem 7.11); automorphy of each factor by restricting to G_i(𝔸) × {1}.
3. Fix a finite K-type projector ξ, a compact-open finite level J_f and a cofinite central ideal I killing φ. Central translations commute with ξ and preserve the J_f-invariance, I-annihilation and polynomial-growth conditions, so the entire central orbit lies in the finite-dimensional fixed-type space of AF.2/harish-chandra-finiteness. A commuting family on this finite-dimensional complex space has a joint generalized-character decomposition.
4. Borel–Jacquet §4.3(iv), p.195, gives central-translation finiteness as a consequence of §4.3(i) and Theorem 1.7. This closes the formal deduction from the fixed-type theorem; the proof-closure gap is the analytic finiteness theorem itself, not an independent inference from finitely many differential operators.

**Direct prerequisites.** `AdelicAlgebraicGroups:AA.1/base-change-adelic`, `AdelicAlgebraicGroups:AA.1/product-adelic`, `ReductiveGroupsPartII:RG2.0a`, `AF.2/automorphic-representation`, `AF.3/cuspidal-automorphic-representation`, `AF.4/cohomological-representation`, `AF.2/central-translation-finiteness`

**Acceptance.**

- Res_{K/ℚ}GL_2 for K real quadratic: automorphic forms on it are Hilbert automorphic forms on GL_2/K.
- GL_2 is the quotient of G_m × SL_2 by μ_2, not a direct product, so (ii) does not apply to it; it applies only to direct products.

**Signatures requiring supplier input.** `TauCeti.Automorphic.automorphicForm_resScalarsEquiv`. The native Weil restriction/product algebraic group, adelic-point isomorphisms and arithmetic central-ideal transport require RG2/AA exports. An arbitrary group isomorphism does not identify those arithmetic constructions. Owner/input: ReductiveGroupsPartII:RG2.0a; AdelicAlgebraicGroups:AA.1.

**Sources for this target.**

- Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf), §7.3, Theorem 7.11, p. 37. Irreducible admissible representations of products (the finite-place input of (ii)).
- A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598), §4.3(i),(iv), p.195; §1.7, p.191. Every central translate remains in the same finite-type finite-dimensional space. Generalized-character splitting is a finite-dimensional linear-algebra consequence, conditional on Harish-Chandra finiteness.

### Algebraic modular forms with central character

**Construction** `AF.5/central-character-algebraic-modular-forms`. Proposed declaration: `TauCeti.Automorphic.CentralCharacterAlgebraicModularForm`. Module: `TauCeti/Automorphic/Foundations`. Realises `AF.5`.

Let G(F_∞)/A_∞ be compact, Z_f=Z_G(𝔸_f), J⊂G(𝔸_f) compact open, M a finite coefficient module with a continuous J action, and ψ:Z_f→A^× a continuous character. Define S_ψ(J,M)={f:G(𝔸_f)→M : f(γgzu)=ψ(z)u⁻¹f(g)} for γ∈G(F),z∈Z_f,u∈J. Require ψ trivial on Z_G(F), and the J action on Z_f∩J to be multiplication by ψ⁻¹. The relevant class set is G(F)\G(𝔸_f)/(Z_fJ). For each class representative t the effective stabilizer consists of pairs (γ,z,u) with γtzu=t, modulo the central pairs acting trivially; its coefficient action is ψ(z)u⁻¹. Values give S_ψ(J,M)≅⊕_t M^{Γ_t^{eff}}. Class-number finiteness and finiteness of effective stabilizers require the stated compact-mod-centre arithmetic supplier theorem. This branch handles positive-unit-rank tori which the discrete-rational-centre construction excludes.

**Hypotheses.** G(F_∞)/A_∞ is compact; the central character is compatible with rational centre and the coefficient action on Z_f∩J.; Use the central quotient class set and effective stabilizer action. Do not retain the unmodified G(F)\G(𝔸_f)/J finiteness or claim its infinite rational-central stabilizers are finite.; Hecke coefficient action must extend to the chosen semigroup and commute with ψ; integral base change is asserted when the effective stabilizer orders are invertible or they act trivially at small level.

**Construction or proof route.**

1. The compatibility conditions make the displayed transformation law independent of central/level overlap. It defines a coefficient submodule.
2. Use the requested central-quotient class-number theorem from AA.3. Evaluation on representatives identifies the carrier with effective-stabilizer invariants; central pairs act trivially by compatibility.
3. Extend the coefficient action to the Hecke semigroup to obtain the weighted coset sum; restriction and trace preserve ψ. Averaging finite effective stabilizers gives base change when their orders are invertible.

**Direct prerequisites.** `AF.5/algebraic-modular-forms`, `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.4/hecke-correspondence`

**Uses.** PAPER-BOXER-CALEGARI-GEE-PILLONI-25/5.7-algebraic-forms: Supplies the central-character integral algebraic-form convention. HilbertModularVarietiesAndShimuraCurves:R18.3: Specializes the central-quotient and effective-stabilizer construction to definite quaternion groups.

**API.**

| Name | Role | Mathematical contract |
|---|---|---|
| `Automorphic.CentralCharacterAlgebraicModularForm` | data | The carrier with f(γgzu)=ψ(z)u⁻¹f(g) and the rational-centre/level compatibility. |
| `Automorphic.CentralCharacterAlgebraicModularForm.equivSum` | equivalence | Values at central-quotient classes identify the carrier with the direct sum of effective-stabilizer invariants. |
| `Automorphic.CentralCharacterAlgebraicModularForm.hecke` | constructor | Weighted Hecke coset sums for a coefficient action extending to the semigroup and commuting with ψ. |
| `Automorphic.CentralCharacterAlgebraicModularForm.res` | functoriality | Restriction to smaller level with the restricted coefficient action. |
| `Automorphic.CentralCharacterAlgebraicModularForm.trace` | functoriality | Weighted trace to larger level, with trace after restriction equal to the index. |
| `Automorphic.CentralCharacterAlgebraicModularForm.baseChange` | compatibility | Base change of effective-stabilizer invariants when their orders are invertible, or when sufficiently small level makes them trivial. |

**Specified tests.**

| Name | Kind | Discriminating statement |
|---|---|---|
| `centralAMF_split_torus` | computation | For G=G_m over a real quadratic field, Z_f=G(𝔸_f), ψ=1 and trivial coefficients, the central-quotient class set has one element and S_ψ=A despite positive rank of rational units. |
| `centralAMF_trivial_centre` | compatibility | When Z_f is trivial the carrier agrees with LevelAlgebraicModularForm. |
| `centralAMF_incompatible` | non-example | For one-dimensional coefficients, if some z∈Z_f∩J acts by a scalar unequal to ψ(z)⁻¹, every compatible form vanishes; the unrestricted carrier must not be used. |

**Acceptance.**

- For G=G_m over a real quadratic field, Z_f=G(𝔸_f), ψ=1 and trivial coefficients, the central-quotient class set has one element and S_ψ=A despite positive rank of rational units.
- When Z_f is trivial the carrier agrees with LevelAlgebraicModularForm.
- For one-dimensional coefficients, if some z∈Z_f∩J acts by a scalar unequal to ψ(z), every compatible form vanishes; the unrestricted carrier must not be used.

**Native signature scope.** Native ψ-weighted equivariance, overlap compatibility, stabilizer values, effective endomorphism units, central double-coset evaluation and tensor base-change. Arithmetic central-quotient class/stabilizer finiteness for positive-unit-rank centres is an AA request.

**Sources for this target.**

- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §5.7.2, pp.130–131. The coefficient covariance f(gu)=u⁻¹f(g) is the source model. The central-character variant is its explicit compatible transformation-law extension here, with central-quotient finiteness separately requested; the source’s compact unitary setting does not prove that extension’s arithmetic finiteness.

## Native signature correspondence

The final name audit finds 515 named Lean declarations and 102 labeled examples. Of the 100 packet main names, 43 occur as declarations, 197 of 306 API name occurrences are present, and 102 of 207 test name occurrences are present. These are syntactic counts, subject to every scope qualification above; they are not counts of formalized results. Tests sharing a name are counted against the corresponding packet occurrence.

Every absent main/API/example name is listed under its node, with the actual native type or geometric/arithmetic condition it requires. The packet’s suggestedOmissions records the same names and their full mathematical required signatures. Present partial multi-part theorems are qualified under native signature scope: the long exact sequence does not include Ext or cup products; the low-degree CE bridge currently states degree one; GSp₄ predicates do not instantiate discrete representations; finite-dimensional rank tests do not construct arithmetic groups. Distinct helper names avoid counting the local lattice, supplied coefficient, norm comparison or algebraic weight model as their stronger targets.

The suggested file elaborated with the shared pinned Mathlib build, with no errors and only proof-placeholder warnings. Pinned Tau Ceti source statements were read, but its modules are not available in that shared build, so those module-level comparisons were not compiled. Elaboration validates the native types and hypotheses; all proofs and implementation statuses remain unchecked.

## Pinned baseline

Tau Ceti commit: `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib commit: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Every entry below was checked against its actual source statement at the pin. Low-degree absolute cochains, existing manifold Lie differentiation and semisimple highest-weight machinery are imported; the plan does not rebuild them.

| Declaration | Source at the pin | Exact contribution |
|---|---|---|
| `mathlib:ContMDiff` | [Mathlib/Geometry/Manifold/ContMDiff/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/ContMDiff/Defs.lean) | C^n maps between manifolds with corners (ContMDiff I I' n f); used for smoothness at the archimedean places. |
| `mathlib:ContRepresentation` | [Mathlib/RepresentationTheory/Continuous/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean) | A monoid homomorphism into continuous linear endomorphisms; each operator is continuous. Joint continuity of the G action is an additional condition, not a structure field here. |
| `mathlib:CuspForm` | [Mathlib/NumberTheory/ModularForms/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Cusp forms: slash-invariant, holomorphic and zero at every cusp. |
| `mathlib:ExteriorAlgebra` | [Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean) | The exterior algebra of a module (as the Clifford algebra of the zero form), with its graded pieces ⋀[R]^q M. |
| `mathlib:GroupLieAlgebra` | [Mathlib/Geometry/Manifold/GroupLieAlgebra.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/GroupLieAlgebra.lean) | The Lie algebra of a Lie group as the tangent space at 1, with its Lie algebra structure via invariant vector fields. |
| `mathlib:HasCompactMulSupport` | [Mathlib/Topology/Algebra/Support.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Support.lean) | Compact (multiplicative) support; the additive form HasCompactSupport is generated from it by to_additive. |
| `mathlib:IsCompactOperator` | [Mathlib/Analysis/Normed/Operator/Compact/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Operator/Compact/Basic.lean) | A map is compact when there exists a compact subset of the codomain whose inverse image is a neighbourhood of zero; for linear maps this agrees with mapping some zero neighbourhood into a compact set. |
| `mathlib:LieAlgebra.rank` | [Mathlib/Algebra/Lie/Rank.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Rank.lean) | The rank of a finite free Lie algebra (via the characteristic polynomial of ad); for a reductive complex Lie algebra, the dimension of a Cartan subalgebra. |
| `mathlib:LieGroup` | [Mathlib/Geometry/Manifold/Algebra/LieGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/Algebra/LieGroup.lean) | Lie groups: groups with C^n manifold structure and C^n multiplication and inversion. |
| `mathlib:LieModule` | [Mathlib/Algebra/Lie/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Basic.lean) | Lie modules over a Lie algebra (bracket compatible with scalars; LieRingModule supplies the action). |
| `mathlib:LieSubalgebra` | [Mathlib/Algebra/Lie/Subalgebra.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Subalgebra.lean) | Lie subalgebras of a Lie algebra. |
| `mathlib:Matrix.GeneralLinearGroup` | [Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | GL(n, R) as the units of the matrix ring. |
| `mathlib:Matrix.SpecialLinearGroup` | [Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean) | SL(n, R) as matrices of determinant one. |
| `mathlib:ModularForm` | [Mathlib/NumberTheory/ModularForms/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Modular forms for a subgroup Γ of GL(2,ℝ): slash-invariant, holomorphic and bounded at every cusp. |
| `mathlib:NumberField.IdeleClassGroup` | [Mathlib/NumberTheory/NumberField/AdeleRing.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/AdeleRing.lean) | The idele class group 𝔸_K^×/K^× of a number field. |
| `mathlib:NumberField.InfinitePlace` | [Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean) | Infinite places of a number field, with nrRealPlaces and nrComplexPlaces. |
| `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` | [Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean) | nrRealPlaces K + 2·nrComplexPlaces K = [K:ℚ]. |
| `mathlib:Representation` | [Mathlib/RepresentationTheory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) | Linear representations G →* (V →ₗ[k] V) of a monoid on a module. |
| `mathlib:RestrictedProduct` | [Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean) | Restricted products Πʳ i, [R i, A i] of families with respect to a filter (cofinite for adelic constructions). |
| `mathlib:RootPairing` | [Mathlib/LinearAlgebra/RootSystem/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean) | Root pairings (root data/root systems) with roots, coroots and reflections. |
| `mathlib:SlashAction` | [Mathlib/NumberTheory/ModularForms/SlashActions.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/SlashActions.lean) | The slash action class; the weight-k action of GL(2,ℝ)^+ on functions on ℍ with Mathlib's det^{k−1} j^{−k} normalisation. |
| `mathlib:Subalgebra.center` | [Mathlib/Algebra/Algebra/Subalgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean) | The centre of an algebra as a subalgebra; applied to U(𝔤_ℂ) it is Z(𝔤). |
| `mathlib:TopRep.homogeneousCochains` | [Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) | Homogeneous continuous cochains of a topological representation, as a cochain complex of topological modules. |
| `mathlib:UniversalEnvelopingAlgebra` | [Mathlib/Algebra/Lie/UniversalEnveloping.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/UniversalEnveloping.lean) | The universal enveloping algebra of a Lie algebra, with its universal property (lift). |
| `mathlib:continuousCohomology` | [Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) | Continuous cohomology of a topological representation as homology of the homogeneous continuous cochains. |
| `tauceti:HeckeRing.GL2.heckeSlashModularFormEnd` | [TauCeti/NumberTheory/ModularForms/HeckeSlash/ModularForm.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/ModularForm.lean) | The double-coset Hecke operator acting on modular forms for a congruence subgroup (bundled endomorphism). |
| `tauceti:HeckeRing.GL2.twistedHeckeSlashModularFormCharEnd` | [TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/ModularForm.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/ModularForm.lean) | The twisted double-coset Hecke operator on modular forms with nebentypus character χ (bundled endomorphism of the χ-eigenspace). |
| `tauceti:TauCeti.Lie.lieSubalgebraOfSubgroup` | [TauCeti/Geometry/Lie/Subgroup/LieAlgebra.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Lie/Subgroup/LieAlgebra.lean) | Lie span of real exponential directions whose one-parameter subgroups lie in the subgroup. The embedded closed-subgroup comparison and complexification require their separate LieGroups supplier theorems. |
| `tauceti:TauCeti.dominantChamber` | [TauCeti/LinearAlgebra/RootSystem/Chamber.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Chamber.lean) | The closed dominant chamber of a base of a root pairing. |
| `tauceti:TauCeti.exists_mem_dominantChamber` | [TauCeti/LinearAlgebra/RootSystem/Chamber.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Chamber.lean) | Every weight is Weyl-conjugate into the closed dominant chamber. |
| `tauceti:TauCeti.haarAverage` | [TauCeti/RepresentationTheory/Compact/Averaging.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/Averaging.lean) | Normalized compact-group Haar average for the normed complete coefficient setting of the pinned file (finite-dimensional coefficients satisfy it); not an unrestricted locally convex integral. |
| `tauceti:TauCeti.peterWeylBasis` | [TauCeti/RepresentationTheory/Compact/PeterWeyl.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/PeterWeyl.lean) | The Peter–Weyl Hilbert basis of L²(G) by normalised matrix coefficients, for a skeleton of the unitary dual of a compact group. |
| `tauceti:TauCeti.vermaCentralCharacter` | [TauCeti/Algebra/Lie/HighestWeight/CentralCharacter.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/HighestWeight/CentralCharacter.lean) | Central character for the split Killing-semisimple Lie algebra under its PBW/Cartan hypotheses. The general reductive extension (including arbitrary central weights) is an imported LieHighestWeight Layer 9 target, not supplied by this declaration alone. |
| `tauceti:lieMap` | [TauCeti/Geometry/Lie/Functor.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Lie/Functor.lean) | The Lie functor on smooth homomorphisms: the differential at 1 as a Lie algebra map between left-invariant derivations. |
| `mathlib:PiTensorProduct` | [Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean) | Tensor product of an indexed family of modules; use finite-place tensor factors with its tprod/lift/reindex API. |
| `mathlib:Module.DirectLimit` | [Mathlib/Algebra/Colimit/Module.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Colimit/Module.lean) | Module colimit for linear transition maps, with of/lift/universal property; directed-system hypotheses are needed for the canonical union description. |
| `mathlib:LieModule.Cohomology.oneCochain` | [Mathlib/Algebra/Lie/Cochain.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Cochain.lean) | Degree-one Lie cochains as linear maps; the complete all-degree complex remains new. |
| `mathlib:LieModule.Cohomology.twoCochain` | [Mathlib/Algebra/Lie/Cochain.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Cochain.lean) | Degree-two skew cochains in the pinned low-degree model. |
| `mathlib:LieModule.Cohomology.d₁₂` | [Mathlib/Algebra/Lie/Cochain.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Cochain.lean) | The degree-one to degree-two differential with coefficient-action and bracket signs; compared with the full alternating complex. |
| `mathlib:jacobson_density` | [Mathlib/RingTheory/SimpleModule/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/SimpleModule/Basic.lean) | Density on finite subsets of a semisimple module, relative to its module-endomorphism ring. |
| `mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective` | [Mathlib/RingTheory/SimpleModule/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/SimpleModule/Basic.lean) | Surjectivity onto the double endomorphism ring when the semisimple module is finite over its endomorphism ring; the complex scalar-endomorphism reduction is a separate Schur step. |
| `mathlib:LinearMap.bijective_or_eq_zero` | [Mathlib/RingTheory/SimpleModule/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/SimpleModule/Basic.lean) | Schur lemma for maps between simple modules; it alone does not identify a division algebra with the scalar field. |
| `mathlib:Module.End.exists_eigenvalue` | [Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean) | A nonzero finite-dimensional vector space over an algebraically closed field admits an eigenvalue for every endomorphism; combined with Schur to identify the commutant with scalars. |
| `mathlib:IsIdempotentElem.Corner` | [Mathlib/RingTheory/Idempotents.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Idempotents.lean) | The eAe carrier for an idempotent in a ring, with its native ring structure and identity e; do not recreate this carrier. |
| `tauceti:leftInvariantDerivationLieEquivGroupLieAlgebra` | [TauCeti/Geometry/Lie/Functor.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Lie/Functor.lean) | The pinned Lie equivalence between left-invariant derivations and the tangent Lie algebra. The automorphic differentiated actions import this equivalence instead of planning it again. |
| `mathlib:Finsupp.linearCombination` | [Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean) | Linear map from finitely supported coefficients to an actual family of vectors; constructs the GL₂ H/X/Y operators. |
| `mathlib:LinearMap.baseChange` | [Mathlib/LinearAlgebra/TensorProduct/Tower.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Tower.lean) | Canonical A⊗M→A⊗N induced by an R-linear map, with the pure-tensor equation; used in algebraic-form base change. |
| `mathlib:UpperHalfPlane.volume_def` | [Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean) | The native hyperbolic upper-half-plane measure dx dy/y². |
| `mathlib:PiTensorProduct.instRing` | [Mathlib/RingTheory/PiTensorProduct.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PiTensorProduct.lean) | Finite tensor products of complex algebras carry their actual ring structure, with multiplication on pure tensors. Idempotent stabilization gives a separate nonunital colimit construction. |
| `mathlib:Function.MulExact` | [Mathlib/Algebra/Exact/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Exact/Basic.lean) | The multiplicative exactness predicate and its source-generated additive Function.Exact: the second actual map vanishes precisely on the image of the first. The pinned source generates Exact, while the static declaration index lists MulExact. |
| `mathlib:MeasureTheory.Lp` | [Mathlib/MeasureTheory/Function/LpSpace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Function/LpSpace/Basic.lean) | The native a.e.-equivalence Lp carrier with its integrability condition; used for the Circle L² counterexample. |
| `mathlib:Circle.coeHom` | [Mathlib/Analysis/Complex/Circle.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/Circle.lean) | The native circle-to-complex multiplicative homomorphism whose integer powers give rotation weights. |
| `mathlib:PadicInt` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | The native p-adic integer ring, given by the norm-at-most-one subring of ℚ_p; used for local integral lattices. |
| `mathlib:ContinuousCohomology.d₀kerIso` | [Mathlib/RepresentationTheory/Homological/ContCohomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/LowDegree.lean) | The continuous linear equivalence from the kernel of the degree-zero homogeneous differential to representation invariants, evaluating a cocycle at the identity; its inverse is the constant equivariant map. |
| `mathlib:DoubleCoset.Quotient` | [Mathlib/GroupTheory/DoubleCoset.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/DoubleCoset.lean) | The native double-coset quotient by two subgroups, implemented as the quotient by equality of their double coset sets; its subgroup relation is the usual y=hxk equation. |
| `mathlib:DoubleCoset.mk` | [Mathlib/GroupTheory/DoubleCoset.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/DoubleCoset.lean) | The canonical map of a group element to its native double-coset quotient class. |

## Supplier requests

These requests state obligations rather than accepted exports. AA and ShimuraData have matching mathematical plans with needs_changes reviews; their references are conditional inputs. Where SR, ALS, AS and RG2 have no precise packet node, the request retains the exact stage contract. Proposed prefix splits require maintainer integration; they are not new independent owners.

**R1.** `ShimuraData:D3`. Kostant representatives ^MW of W_M\W, the longest element w_{0,M} of the Levi M_μ of the Siegel parabolic, and the coordinates of X^*(T) for GSp_{2g} used by Boxer–Pilloni §1.3, as data that AF.4 can quote.

Consumers: `AF.4/harris-limits-gsp2g`, `AF.4/hermitian-positive-system`.

**R2.** `ShimuraData:D5`. ρ, the dominant and antidominant rational cones, and the explicit GSp₄ root datum with both coordinate lattices: the split algebraic torus has X^*(T)=ℤ³ with coordinates (a,b;c_T); the compact Cartan has coordinates (a,b;c_H) with c_H≡a+b modulo 2. Supply the conversion c_H=a+b+2c_T, ρ_T=(2,1;−3/2) and ρ_H=(2,1;0) for the chosen positive roots, for the chambers C₀–C₃.

Consumers: `AF.4/harris-limits-gsp2g`, `AF.4/gsp4-discrete-series`.

**R3.** `ArithmeticLocallySymmetricSpaces:ALS.1`. Betti cohomology H^•(X_K, L) with coefficients in local systems attached to J_f-stable lattices L of algebraic representations (AF.4/coefficient-lattices supplies the lattices), with its E-rational structure.

Consumers: `AF.4/torsion-hecke-eigenclasses`, `AF.4/clozel-rationality`.

**R4.** `ArithmeticLocallySymmetricSpaces:ALS.3`. Hecke action of the abstract Hecke algebra on H^•(X_K, L) and on its reductions, compatible with change of lattice.

Consumers: `AF.4/torsion-hecke-eigenclasses`, `AF.4/clozel-rationality`.

**R5.** `ArithmeticLocallySymmetricSpaces:ALS.5`. The comparison of Betti cohomology with relative Lie algebra cohomology of automorphic forms in characteristic zero, Hecke equivariant, as needed to realise cuspidal cohomological π in H^•(X_K, V_λ).

Consumers: `AF.4/clozel-rationality`.

**R6.** `AutomorphicSpectralTheory:AS.5`. The identification of cuspidal cohomology H^•_cusp(X_K, V_λ ⊗ ℂ) with ⊕_π m(π)H^•(𝔤, K; π_∞ ⊗ V_λ) ⊗ (π^∞)^K and its Hecke stability.

Consumers: `AF.4/clozel-rationality`.

**R7.** `AutomorphicSpectralTheory:AS.4`. The space A_{(2)}(G) of square-integrable automorphic forms (discrete spectrum) as a (𝔤, K) × G(𝔸_f)-module, for the coherent L²-cohomology H^i_{(2),σ}.

Consumers: `AF.4/coherent-relative-cohomology`.

**R8.** `AutomorphicLFunctionsAndLocalFactors:AL.3`. Genericity (existence of a global Whittaker model) of cuspidal automorphic representations of GL_n, used in Clozel's purity lemma to apply Vogan's generic unitary dual at infinity.

Consumers: `AF.4/clozel-purity`.

**R9.** `ArithmeticLocallySymmetricSpaces:ALS.0`. A Cartan involution θ of G(F_∞) for connected reductive G over a number field, the maximal compact subgroup K_∞ = G(F_∞)^θ, G°-conjugacy of maximal compact subgroups, and the diffeomorphism K_∞ × 𝔭 → G(F_∞), so that G(F_∞)/K_∞ ≅ 𝔭. AF.1 builds (𝔤, K_∞)-modules for this K_∞ and AF.1a uses G/K ≅ 𝔭 for van Est.

Consumers: `AF.1/real-reductive-group`, `AF.1a/cartan-iwasawa-malcev`.

**R10.** `AutomorphicLFunctionsAndLocalFactors:AL.0`. The integral representation K_ν(y) = ½∫_ℝ e^{−y cosh t − νt}dt of the K-Bessel function with K_{−ν} = K_ν, and the fact that the solutions of the Fourier-coefficient ODE of a Laplace eigenfunction of moderate growth on y > 0 are multiples of √y K_{ir}(2π\|n\|y) (PAPER-ZHANG-21/98 route to AL.0).

Consumers: `AF.3/maass-cusp-forms`.

**R11.** `ReductiveGroupsPartII:RG2.0a`. Weil restriction Res_{E/F} of affine group schemes with (Res_{E/F}G)(R) = G(R ⊗_F E) functorially, used to identify Res_{E/F}G(𝔸_F) with G(𝔸_E).

Consumers: `AF.5/transport-compatibilities`.

**R12.** `ReductiveGroupsPartII:RG2.4`. The Iwasawa and Cartan decompositions of SL_2 over a nonarchimedean local field (SL_2 = N·T·SL_2(O) and SL_2(O)·diag(ϖ^n, ϖ^{−n})·SL_2(O)), used to show that N(ϖ^{−c−1}O) and N^-(ϖ^cO) generate SL_2.

Consumers: `AF.3/sl2-generation`.

**R13.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`. The abelian category of smooth complex representations of G(F_v), compact-open invariants V^K and admissibility, and the Aut(ℂ)-twist of smooth representations; used for Flath's theorem and fields of rationality.

Consumers: `AF.2/flath-factorization`, `AF.4/rationality-field`.

**R14.** `SmoothRepresentationsOfLocalGroups:SR.1`. The Hecke algebra C_c^∞(G(F_v)) of locally constant compactly supported functions with convolution and the idempotents e_K = vol(K)⁻¹1_K, and H(G//K) = e_K C_c^∞ e_K, for the finite factors of adelic test functions.

Consumers: `AF.0/adelic-test-functions`, `AF.0/finite-hecke-action`, `AF.2/spherical-dimension-one`.

**R15.** `SmoothRepresentationsOfLocalGroups:SR.3`. Admissibility of irreducible smooth complex representations of G(F_v) (dim π^K < ∞) and Schur's lemma for them, as inputs to Flath's factorization.

Consumers: `AF.2/flath-factorization`.

**R16.** `SmoothRepresentationsOfLocalGroups:SR.4`. Commutativity of the spherical Hecke algebra C_c^∞(G(F_v)//K_v) for K_v hyperspecial (through the Satake isomorphism), so that dim π_v^{K_v} ≤ 1 (RT-AREA-automorphic-1/26).

Consumers: `AF.2/spherical-dimension-one`.

**R17.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`. Import: classification of continuous characters of ℝ^× and ℂ^×, ContinuousInfinityType and AlgebraicInfinityType, HeckeCharacter.IsAlgebraic (type A_0).

Consumers: `AF.1/archimedean-llc-gln`, `AF.1/weil-group-real`, `AF.5/gl1-dictionary`.

**R18.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`. Import: K discrete in 𝔸_K and 𝔸_K/K compact, with the Haar probability measure on 𝔸_K/K and Fourier analysis (character orthogonality) on it.

Consumers: `AF.2/nongeneric-automorphic`, `AF.3/sl2-fourier-vanishing`, `AF.3/unipotent-quotient-compact`.

**R19.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`. Import: the carrier HeckeCharacter K = ContinuousMonoidHom(IdeleClassGroup K, ℂˣ), local components, finite conductor, shift and unitary part.

Consumers: `AF.5/gl1-dictionary`.

**R20.** `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`. Import: modular forms with character (nebentypus) for Γ_0(N), Γ_1(N) and diamond operators.

Consumers: `AF.5/gl2-classical-to-adelic`, `AF.5/gl2-dictionary`.

**R21.** `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`. Import: Hecke operators T_p on modular forms with character and their coset description.

Consumers: `AF.5/gl2-hecke-normalisation`.

**R22.** `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`. Import newform existence and conductor packaging; consume Layer 5 separately for multiplicity one and cross-level uniqueness.

Consumers: `AF.5/gl2-dictionary`.

**R23.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`. Import the algebraic group representation/comodule carrier and its tensor/dual API. Highest-weight integration/classification is not supplied by this layer; see the explicit algebraic-group classification gap.

Consumers: `AF.4/algebraic-weight`.

**R24.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`. Import: Lie(G), the differential of homomorphisms and the Lie algebra of a closed subgroup, for comparison with the real Lie algebra of G(ℝ).

Consumers: `AF.1/real-points-lie-group`.

**R25.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`. Import: the structure of unipotent groups in characteristic zero (composition series with vector-group quotients).

Consumers: `AF.3/unipotent-quotient-compact`.

**R26.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`. Import: reductive and semisimple groups and their centres.

Consumers: `AF.1/real-reductive-group`.

**R27.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Import: Borel subgroups, maximal tori, parabolic subgroups and Levi decompositions, root data with Weyl group; the dynamic description P(λ) of parabolics.

Consumers: `AF.3/anisotropic-cuspidal`, `AF.3/constant-term`, `AF.4/algebraic-weight`.

**R28.** `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-0-normalized-haar-measure-and-averaging`. Import: normalised Haar measure and averaging on compact groups.

Consumers: `AF.1a/van-est-acceptance`.

**R29.** `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-2-complete-reducibility`. Import: complete reducibility of continuous finite-dimensional representations of compact groups.

Consumers: `AF.1/k-finite-vectors`, `AF.1a/gk-module`, `AF.1a/relative-cohomology-functoriality`.

**R30.** `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`. Import: the Peter–Weyl theorem (density of matrix coefficients and the L² Hilbert basis).

Consumers: `AF.1/k-finite-vectors`, `AF.1/principal-series`.

**R31.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`. Import: the closed-subgroup theorem (closed subgroups of finite-dimensional real Lie groups are embedded Lie subgroups with Lie algebra lieSubalgebraOfSubgroup).

Consumers: `AF.1/real-points-lie-group`, `AF.1a/invariant-forms-complex`.

**R32.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`. Import: complexification of Lie algebras of real Lie groups and real forms.

Consumers: `AF.1a/gk-pair`.

**R33.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`. Import: the Cartan decomposition K × 𝔭 → G and the Iwasawa decomposition G = KAN for real reductive groups.

Consumers: `AF.1/principal-series`, `AF.1/real-reductive-group`, `AF.1a/cartan-iwasawa-malcev`.

**R34.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`. Import: root space decompositions of complex reductive Lie algebras with respect to a Cartan subalgebra.

Consumers: `AF.4/hermitian-positive-system`.

**R35.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`. Import the finite-dimensional highest-weight classification under its split Killing-semisimple characteristic-zero hypotheses. For general reductive Lie algebras combine Layer 9 and impose the algebraic group character lattice separately.

Consumers: `AF.4/algebraic-weight`.

**R36.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`. Import: the centre Z(U(L)), central characters χ_λ and the Harish-Chandra isomorphism with the dot action.

Consumers: `AF.1/infinitesimal-character`.

**R37.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`. Import: reductive Lie algebras (𝔤 = 𝔷 ⊕ [𝔤,𝔤]) and their irreducible representations, for the Harish-Chandra isomorphism of reductive 𝔤_ℂ.

Consumers: `AF.1/infinitesimal-character`.

**R38.** `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`. Import: chambers, the strict fundamental domain property of the closed dominant chamber and the longest element w_0.

Consumers: `AF.1/discrete-series`, `AF.4/algebraic-weight`, `AF.4/gsp4-discrete-series`, `AF.4/harris-limits-gsp2g`, `AF.4/infinitesimal-character-of-weight`.

**R39.** `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`. Import fixed-character newspace multiplicity one and newform–newform cross-level strong multiplicity one, with normalization a₁=1 and the allowed finite exceptional set.

Consumers: `AF.5/gl2-dictionary`.

**R40.** `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`. Import the algebraic finite Hecke-algebra/rational coefficient-field comparison and conjugate newform construction. Discontinuous Aut(ℂ) is not applied to analytic limits. Use the cohomological finite-part normalization.

Consumers: `AF.4/rationality-field`, `AF.4/clozel-rationality`.

**R41.** `ReductiveGroupsPartII:RG2.3`. For connected reductive G over a number field F, a smooth model with connected reductive fibres over O_{F,S} for some finite S, so that G(O_v) is a hyperspecial maximal compact subgroup for every finite v∉S. AF.2 uses it to place the spherical Gelfand-pair statement at almost all places; AdelicAlgebraicGroups requests the same spreading-out for AA.3/good-maximal-compact. The bare Hopf model of AA.1/integral-model-exists does not give it.

Consumers: `AF.2/spherical-dimension-one`.

**R42.** `AdelicAlgebraicGroups:AA.3`. For G(F_∞)/A_∞ compact, prove finiteness of G(F)\G(𝔸_f)/(Z_G(𝔸_f)J) and of its effective arithmetic stabilizers after quotienting the rational central subgroup; include the positive-unit-rank torus case.

Consumers: `AF.5/central-character-algebraic-modular-forms`.

**R43.** `AdelicAlgebraicGroups:AA.4`. Central-character descent of double-coset Hecke and level correspondences, with full effective stabilizer action and coefficient semigroup transport compatible with ψ.

Consumers: `AF.5/central-character-algebraic-modular-forms`.

## Source ledger and reading provenance

Citations are mathematical statements in our own words, with theorem, section and page locators. This ledger records source versions and the portions used for these targets; it is not a section-by-section digest. Historical readSections entries belong to the preceding plan or independent reviews and are retained as that provenance. revisionReadSections and the three new source entries identify readings in this run. Knapp, Casselman, Buzzard–Gee, Harris and the published Goldring–Koskivirta correction are retained independent-review readings rather than fresh readings claimed by this worker.

**getz-hahn.** Jayce R. Getz, [An introduction to automorphic representations (course notes)](https://sites.math.duke.edu/~jgetz/aut_reps.pdf). Lecture notes, version of 13 March 2015 (89 pp.), author-hosted PDF.

SHA-256: `e52f7da0685c7e330f096b3f23beaf8832972067d191f77e3c05ac3113fff0ac`. Access/read metadata: 2026-10-06.

This run’s reading locators: §§6–8, pp.29–40, reread 2026-10-08: height, tensor and irreducibility corrections E11–E14.

Retained preceding-plan/review locators: §3 Hecke algebras and Definition 3.10, pp. 16-19; §5 smooth vectors, K-finite vectors and (g,K)-modules, pp.21–29, including Definition 5.10 p.26 and Definition 5.18 p.29; §6 automorphic forms, Definitions 6.7-6.15, Theorem 6.10, §6.4 Lemma 6.19, pp. 29-33; §7 restricted tensor products and Flath's theorem, pp. 34-38; §8 Gelfand pairs and Proposition 8.6, pp. 38-40; §10.1 Weil groups and GL1 reciprocity, pp.45–47.

**arthur-trace.** James Arthur, [An introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf). Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 1-263; Clay PDF.

SHA-256: `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §1 adelic groups and Haar measure, pp. 7-13; §12 cuspidal functions and Theorem 12.1, pp. 63-66; §13 height functions (13.2)-(13.4), rapidly decreasing and uniformly tempered functions, pp. 69-71.

**bernstein-kroetz.** Joseph Bernstein, Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/abs/0812.1684v3). arXiv:0812.1684v3 (16 April 2013); Israel J. Math. 199 (2014) 45-111.

SHA-256: `f5f2e79d87532c9ac46389d7eb1606e0301eac0ba7c7972ab628e278e091ca3e`. Access/read metadata: 2026-10-06.

This run’s reading locators: §§4.1–4.4, pp.21–23, and §9.3, pp.39–40, read 2026-10-08; Proposition 9.6 proof including the dual minimal-globalization argument.

Retained preceding-plan/review locators: §1 Introduction and Theorem 1.1, pp. 2-4; §2 G-continuous norms, Sobolev norms and Remark 2.19 (Dixmier-Malliavin), pp. 5-13; §4 Harish-Chandra modules, Theorem 4.2, p. 21; §§5, 7, 8 statements (Theorems 5.5, 7.1, 8.1); REV-FIX-RT-AREA-automorphic-1~3: §9.3 pp.39–40, definition E_{σ,λ}, Proposition 9.6 and its compact Hilbert-picture/double-induction proof; introduction pp.2–4 and §4 p.22 rechecked.

**langlands-notion.** Robert P. Langlands, [On the notion of an automorphic representation](https://publications.ias.edu/sites/default/files/notion-ps.pdf). Automorphic Forms, Representations and L-functions, Proc. Sympos. Pure Math. 33, Part 1 (1979), 203-207; IAS archive PDF.

SHA-256: `c998090bcbbd0fde660e335ea0d62609c785c3f1e644e48967850a6a3892844d`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: Whole note, pp. 1-7: constituents of induced representations, Proposition 2.

**wockel-vanest.** Christoph Wockel, [Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces](https://arxiv.org/abs/1401.1037v1). arXiv:1401.1037v1 (6 January 2014).

SHA-256: `e2b911da78c856e1399e6527b2eabf3ccacf47f689257c6197f6b4ace014f4a2`. Access/read metadata: 2026-10-06.

This run’s reading locators: §3, pp.11–14, read 2026-10-08: Theorem3.3, Proposition3.4, finite component group and quasi-complete smooth coefficient hypotheses; the cited Guichardet comparison remains an original-proof input..

Retained preceding-plan/review locators: §1 recap of topological group cohomology, pp. 3-7; §2 Propositions 2.7-2.10, pp. 8-11; §3 relative Lie algebra cohomology, Remark 3.1, Lemma 3.2 and Theorem 3.3 (van Est), pp. 11-13.

**vogan-zuckerman.** David A. Vogan Jr., Gregg J. Zuckerman, [Unitary representations with non-zero cohomology](https://www.numdam.org/item/CM_1984__53_1_51_0.pdf). Compositio Math. 53 (1984), 51-90; Numdam scan.

SHA-256: `ccaaf5ad243ccb85d3db629ff7677ca5b80b7e2d71e502d21fa1b773863b78a4`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §§2, 5-6: theta-stable parabolics, the modules A_q(lambda), Theorem 5.6 and Proposition 6.19 (as quoted in Ichino-Prasanna §7.1).

**franke98.** Jens Franke, [Harmonic analysis in weighted L2-spaces](https://www.numdam.org/item/ASENS_1998_4_31_2_181_0.pdf). Ann. Sci. École Norm. Sup. (4) 31 (1998), 181-279; Numdam.

SHA-256: `3c0465f6413bf156d8574f4bc94f1768cb7ff650deec645e46171b24f269c58b`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §§1-2 spaces of functions of uniform moderate growth (scanned text, read for orientation only).

**zhang21.** Wei Zhang, [Weil representation and arithmetic fundamental lemma](https://arxiv.org/abs/1909.02697). Ann. of Math. 193 (2021), no. 3; arXiv:1909.02697.

SHA-256: `f58b275c97b2675123f44994c91fde9406d6928f6d659b7b8a0f196112d3f61c`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §1.2 notation on automorphic forms (1.5)-(1.13); §13.3 Lemma 13.6 and its proof.

**jiang-zhang20.** Dihua Jiang, Lei Zhang, [Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/abs/1508.03205v4). Ann. of Math. 191 (2020), no. 3; arXiv:1508.03205v4.

SHA-256: `d97bf3048aa10de52f07ae5bbbc3970c974996ae4193d9cd7f12b17890df7bb4`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: Appendix A, proof of Proposition A.1 (Dixmier-Malliavin), arXiv p. 84; Appendix B, proof of Theorem B.2 (Vogan's generic unitary dual), arXiv p. 86.

**gan-ichino18.** Wee Teck Gan, Atsushi Ichino, [The Shimura-Waldspurger correspondence for Mp_2n](https://arxiv.org/abs/1705.10106v3). Ann. of Math. 188 (2018), no. 3; arXiv:1705.10106v3.

SHA-256: `5d1408c5f8bc15a5ceec04a465ceb80cb7265da218138d5a746418ee8b4b291d`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §1.1, §5.1, §6.1-6.2 (archimedean parameters), arXiv pp. 2-24.

**dit16.** W. Duke, Ö. Imamoḡlu, Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Ann. of Math. 184 (2016), no. 3, 949-990; publisher PDF.

SHA-256: `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`. Access/read metadata: 2026-10-06.

This run’s reading locators: §5, pp.961–963, equations (5.6)–(5.11), read 2026-10-08; Fourier/Hecke normalization and the explicitly numerical eigenvalue report.

Retained preceding-plan/review locators: §5, (5.6)-(5.11), pp. 961-963.

**kaletha16.** Tasho Kaletha, [Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5). Ann. of Math. 184 (2016), no. 2; arXiv:1304.3292v5.

SHA-256: `8f88e61e4a86c69ed2e03b760d1517c6f5da167422b5ac8d637af2203bca12a4`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §5.1 and §5.6 (real groups, infinitesimal equivalence).

**boxer-pilloni.** George Boxer, Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf). Invent. Math. 244 (2026); authors' preprint PDF.

SHA-256: `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §1.3, Theorem 1.3.8 and the definition of C(kappa); §4.3, paragraph after Remark 4.3.10.

**cg18.** Frank Calegari, David Geraghty, [Modularity lifting beyond the Taylor-Wiles method](https://arxiv.org/abs/1207.4224). Invent. Math. 211 (2018); arXiv:1207.4224.

SHA-256: `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb`. Access/read metadata: 2026-10-06.

This run’s reading locators: §8.4, p.80, read 2026-10-08: absolute real Lie-algebra ranks, symmetric-space dimensions and the Borel–Wallach VII.6.7 input.

Retained preceding-plan/review locators: §1 (the invariant l0); §5.5 Remark 5.14; §8.4 (l0 and q0 for Res PGL(n)).

**cg20.** Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691v1). Duke Math. J. 169 (2020); arXiv:1907.08691v1 (main text) and arXiv:1907.08694v1 (appendix).

SHA-256: `39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059`. Access/read metadata: 2026-10-06.

This run’s reading locators: §§2.0.1–2.0.2, pp.6–9, read 2026-10-08: split-torus and compact-Cartan coordinates, longest Levi element and Hodge parabolic; §5.3, pp.21–23, read 2026-10-08: Theorems 5.5–5.6, proofs and Definition 5.7; component, weight, contragredient and vanishing conventions.

Retained preceding-plan/review locators: §2.1-2.2 (roots of GSp4, positive system); §5.3 (relative Lie algebra cohomology, Theorems 5.5-5.6, Definition 5.7); §7.2 proof of Theorem 7.11.

**cg20-appendix.** Frank Calegari, David Geraghty, Michael Harris, [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/abs/1907.08694v1). arXiv:1907.08694v1; published as the appendix to Minimal modularity lifting for nonregular symplectic representations.

SHA-256: `8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed`. Access/read metadata: 2026-10-06.

This run’s reading locators: Standalone §3.1, pp.4–5, read 2026-10-08: characteristic-zero cohomological range, integral torsion caveat and Franke–Schwermer dependency.

Retained preceding-plan/review locators: Standalone §3.1, pp.4–5, Lemma 3.1 and proof (published appendix §A.3.1, Lemma A.3).

**pilloni20.** Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), no. 9; author's PDF.

SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §5.1-5.3 (GSp4 roots, (limits of) discrete series, cohomological weights); §15.2 (limits of discrete series and Theorem 15.2.2.1).

**ichino-prasanna23.** Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet-Langlands correspondence](https://arxiv.org/abs/1806.10563). Forum Math. Pi 11 (2023); arXiv:1806.10563.

SHA-256: `058fda94ad08d245dcdf01672e5915beacb8458e6b49498b7e15debbf828aad5`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §7.1 (Vogan-Zuckerman modules and their cohomology).

**bcg25.** George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944). J. Amer. Math. Soc. (2025); arXiv:2309.15944.

SHA-256: `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §1, Remark 1.2.

**ding25.** Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://arxiv.org/abs/2407.21237). Publ. Math. IHÉS 142 (2025); arXiv:2407.21237.

SHA-256: `a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §4.2.2 (definite unitary groups and spaces of p-adic automorphic forms).

**bpcz22.** Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601). Publ. Math. IHÉS 135 (2022); arXiv:2007.05601.

SHA-256: `5c23180ed16b06a514a86b24d3cc9643ef4a4a4292af4b7b72c5dbf714a5483e`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §2.5 (F- and SLF-representations, Dixmier-Malliavin (2.5.3.2)).

**chenevier-taibi20.** Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/abs/1907.08783v1). Publ. Math. IHÉS 131 (2020); arXiv:1907.08783v1.

SHA-256: `81b7fe2c31d0ab4ac7465c7d5209611638fa0d8c7c4ff11f7f4746866491742c`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §1.4 (split classical groups with discrete series); §2.1 (the Langlands correspondence for GL_n(R), W_R).

**bcgp21.** George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3). Publ. Math. IHÉS 134 (2021); arXiv:1812.09269v3.

SHA-256: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §3.10, proof of Theorem 3.10.1 (archimedean inputs).

**bcgp25.** George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1). arXiv:2502.20645v1.

SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`. Access/read metadata: 2026-10-06.

This run’s reading locators: §5.7.2, pp.130–132, read 2026-10-08: coefficient covariance, smallness and weighted Hecke conventions.

Retained preceding-plan/review locators: §1.8 (conventions); §5.7 (definite unitary groups and algebraic automorphic forms, 5.7.2).

**scholze15.** Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://arxiv.org/abs/1306.2070). Ann. of Math. 182 (2015), 945-1066; arXiv:1306.2070.

SHA-256: `e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §5.1, Proposition 5.1.1.

**knapp94.** Anthony W. Knapp, [Local Langlands correspondence: the archimedean case](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf). Public version read by independent reviewer; see readSections.

SHA-256: `684de4bcfc50e448fe52fddc863392012581b43097f40f8bcc4c83dbc5a2dfbb`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §§2–4, pp.399–406: GL_n(ℝ), GL_n(ℂ), Weil representations and the correspondence; scanned PDF inspected; §5, pp.407–408: general real-group reduction and packet/local-factor context (not a full general classification proof).

**casselman-sl2.** Bill Casselman, [Representations of SL2(R)](https://personal.math.ubc.ca/~cass/research/pdf/Irr.pdf). Public version read by independent reviewer; see readSections.

SHA-256: `1e6427e91f3c38d3ab743eccb67af39dc20ac15564c21bf4010c47e2747e4a89`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §10, Propositions 10.7–10.8, pp.26–27: parity and reducibility.

**buzzard-gee.** Kevin Buzzard; Toby Gee, [The conjectural connections between automorphic representations and Galois representations](https://arxiv.org/pdf/1009.0785v3). Public version read by independent reviewer; see readSections.

SHA-256: `52e4f5bf0215a7c0833cb6429552716c85ccbd67761e29d9cae61c42a038853d`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: §2.3: C- and L-algebraicity and the rho shift; §5.2: twisting elements and the theta-minus-rho character; §7.2: GL_n and twisting normalizations; §8.1: conjectural general algebraic field-of-definition discussion, distinguished from the established regular cuspidal Clozel theorem (whose original proof remains unread).

**harris90-survey.** Michael Harris, [Automorphic forms and the cohomology of vector bundles on Shimura varieties](https://www.jmilne.org/math/Books/AA1988b.pdf). Public version read by independent reviewer; see readSections.

SHA-256: `ead5b841dbafb65c1796f8dc7d4f331271947b63b3ef2923efa1cdadf5bff62d`. Access/read metadata: 2026-10-06.

Retained preceding-plan/review locators: Article pp.41–91 in Automorphic Forms, Shimura Varieties, and L-functions II (1990); scanned printed pp.58–63 inspected, especially §§3.1–3.5.

**goldring-koskivirta.** Wushi Goldring; Jean-Stefan Koskivirta, [Strata Hasse invariants, Hecke algebras and Galois representations](https://link.springer.com/article/10.1007/s00222-019-00882-5). Published open-access article, Inventiones mathematicae (2019), DOI 10.1007/s00222-019-00882-5.

Retained preceding-plan/review locators: Theorem 10.1.2, Remark 10.1.3, Corollary 10.1.4 (website cross-numbered subsection 15.1.3): retained contributing degree and Harris correction.

**hr.** G. Harder, A. Raghuram, [Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2). arXiv:1405.6513v2 (28 June 2015), 82 pages; source version independently read in REV-FIX-RT-AREA-automorphic-1~3.

SHA-256: `1d3af2de1c1a370dc339e10c74cda84f5e6f5b25c09810bfdf8bbbbc8df6ca06`. Access/read metadata: recorded in the independent review.

This run’s reading locators: §§2.3.1–2.3.4, pp.13–15; §§3.1.4–3.1.5, pp.17–19; §§4.2.1–4.2.3, pp.25–27, read 2026-10-08 for dominant GL_n weights, parity/purity and normalized cohomological discrete blocks..

Retained preceding-plan/review locators: §§2.3.1–2.3.4, pp.13–15: level/Hecke functoriality, coefficient extension and the GL_n inner-spectrum rationality field; §§3.1.4–3.1.5, pp.17–19: Wigner’s lemma, normalized induced D_λ and Proposition 3.11, including split-centre and component terms; §§4.2.1–4.2.3, pp.25–27: boundary fibration, Proposition 4.3 and Kostant (4.5).

**borel-jacquet79.** A. Borel and H. Jacquet, [Automorphic forms and automorphic representations](https://doi.org/10.1090/pspum/033.1/546598). Proc. Sympos. Pure Math. 33, Part 1 (1979), pp.189–207; maintainer-cleared reading copy.

SHA-256: `2da78c21d85062b64a4c3b4370e2a145d5da8349ffe80cba9cd8cdb195cf593f`. Access/read metadata: 2026-10-08.

This run’s reading locators: §§1.1–1.8, pp.189–192: norm hypotheses, fixed-type finiteness and the referenced analytic lemmas; §§2.1–2.2, pp.193–194: generated admissible modules and the referenced reconstruction lemma; §§3.1–4.8, pp.194–198: finite-level dictionaries, admissibility, central translations and cuspidal spectrum.

Read in place from the maintainer-cleared library. No file, passage or source extraction is deposited in the repository..

**flath79.** D. Flath, [Decomposition of representations into tensor products](https://doi.org/10.1090/pspum/033.1/546596). Proc. Sympos. Pure Math. 33, Part 1 (1979), pp.179–183.

SHA-256: `2da78c21d85062b64a4c3b4370e2a145d5da8349ffe80cba9cd8cdb195cf593f`. Access/read metadata: 2026-10-08.

This run’s reading locators: Theorems 1–3, pp.179–182: algebraic factorization through finite idempotent corners; §2, p.182: the archimedean Hecke algebra and number-field formulation; Theorem 4 and proof discussion, pp.182–183: Hilbert formulation and its additional analytic hypotheses.

Read in place in the maintainer-cleared volume; no copy or source extraction retained.

**kostant61.** B. Kostant, [Lie algebra cohomology and the generalized Borel–Weil theorem](https://people.tamu.edu/~jml/kostant61.pdf). Annals of Mathematics 74 (1961), pp.329–387.

SHA-256: `72c2799109e38d68c0095347a4831df88e20a71d11ae14500a7102e9a60b35fd`. Access/read metadata: 2026-10-08.

This run’s reading locators: §§2.1–3.7, pp.333–337: finite-dimensional harmonic representatives and cochain sign conventions; Proposition 2.1 beginning p.332 not fully inspected; §§5.3–5.14, pp.348–363: the Levi action, Laplacian scalar, weight bound, Weyl-coset convention and Theorem 5.14; Corollary 5.15 p.364; §4, pp.346–347, Lemma 4.4 and Theorem 4.4 including the operator computation; the earlier operator prerequisites remain a refinement obligation.

The cleared Corvallis volume was read in place for Borel–Jacquet and Flath. No file or passage from it was copied or extracted into the repository or scratch space. Unread original proof sources are listed as gaps below; public secondary statements and cleared-source referrals are not counted as having read their cited original proofs.

## Source corrections and limits

The preceding independent review confirmed nine of E1–E10 and rejected E8. Those verdicts are preserved. E11–E15 are new, unreviewed findings from this run. Source-version scope and the searched-for correction metadata remain in the packet. The targets use corrected mathematics; the rejected E8 proposal is retained only as history and is not used to delete parameterized uniqueness.

**E1.** confirmed; error. Source `getz-hahn`, §6.4, Lemma 6.19 and Remark 6.20 (p. 33), repeated in §6.5 (p. 34); notes version of 13 March 2015.

Correction: With ∆ = (1/4)(H² + 2XY + 2YX), a weight-k form φ_f killed by the lowering operator satisfies ∆φ_f = (k(k−2)/4)φ_f; the ideal is ⟨∆ − k(k−2)/4, Z⟩.

Reason: The notes' own §6.5 gives ∆v_ℓ = (k(k−2)/4)v_ℓ on the discrete series π_k generated by such forms. Check at k = 2: weight-2 holomorphic forms have the infinitesimal character of the trivial representation, on which ∆ acts by 0, whereas (k²−1)/4 = 3/4. With the printed ideal the target space of Lemma 6.19 is 0 for k ≥ 2, so the stated isomorphism is false as printed.

**E2.** confirmed; misprint. Source `getz-hahn`, §8, proof of Proposition 8.6, p. 40.

Correction: dim(V^K) ≤ 1 for all irreducible admissible V (V^K may be 0).

Reason: A supercuspidal representation of GL_2(ℚ_p) has no GL_2(ℤ_p)-fixed vectors, so dim V^K = 0; the Gelfand-pair criterion only needs ≤ 1.

**E3.** confirmed; misprint. Source `cg20`, §2.2, p. 810 (arXiv:1907.08691v1 p. 8).

Correction: Only the noncompact part Φ_n^+ is forced by the condition Φ_n^+ = roots of 𝔭^+; the compact positive root ±(1,−1;0) is a further choice.

Reason: Both {(1,−1;0)} ∪ Φ_n^+ and {(−1,1;0)} ∪ Φ_n^+ are positive systems (each is the positive system of a regular element of the corresponding chamber) with the same noncompact part.

**E4.** confirmed; misprint. Source `cg20`, §5.3, p. 828 (arXiv:1907.08691v1 p. 21).

Correction: There are four chambers C_0, …, C_3 (as listed immediately after), defined in §2.1.

Reason: The list that follows contains exactly C_0, C_1, C_2, C_3; \|W_G/W_M\| = 4 for GSp_4.

**E5.** confirmed; error. Source `pilloni20`, §5.1.6, p. 22, and §15.2.1, p. 107 (author's PDF).

Correction: −λ_1 ≥ λ_2 > λ_1 in both places.

Reason: λ_2 = λ_1 is a compact wall, which carries no (limit of) discrete series; the region −λ_1 ≥ λ_2 > −λ_1 printed on p. 107 is empty.

**E6.** confirmed; misprint. Source `pilloni20`, §15.2.2, Theorem 15.2.2.1(2), p. 108 (author's PDF).

Correction: −λ_1 ≥ R.

Reason: The theorem concerns λ = (λ_1, 0; c) with λ_1 < 0, so λ_1 ≥ R > 0 is impossible; large weight means −λ_1 large.

**E7.** confirmed; misprint. Source `boxer-pilloni`, §1.3.3, p. 3 (authors' preprint).

Correction: The condition must be read in X^*(T)_ℚ (κ + ρ need not be integral), as in the definition on p. 48: w⁻¹w_{0,M}(κ + ρ) ∈ X^*(T)^−_ℚ.

Reason: ρ is half-integral for GSp_{2g}, so −w⁻¹w_{0,M}(κ+ρ) is not in X^*(T) in general and the set as printed can be empty.

**E8.** rejected; error. Source `boxer-pilloni`, §1.3.7, Theorem 1.3.8, p. 4 (authors' preprint).

The proposed correction is not adopted. The asserted GSp₄ counterexample is false: its four minimal Siegel Weyl representatives have lengths 0,1,2,3, so there are no two of length 1. The source labels the representation by full data (κ,w); same-degree representations with other parameter data do not disprove that parameterized uniqueness. Do not silently delete source uniqueness on this evidence. A stronger uniqueness-from-degree reading remains a stated gap.

**E9.** confirmed; misprint. Source `ding25`, §4.2.2, arXiv:2407.21237 p. 72.

Correction: W_{ξ,τ} should be a ∏_{v ∈ S_p∖{℘}} GL_n(O_{F_v^+})-invariant lattice in ⊗_{v ∈ S_p∖{℘}} σ(τ_v) ⊗ L(ξ_v).

Reason: It is acted on by ∏_{v∈S_p∖{℘}} U_v in the definition of S_{ξ,τ} that follows.

**E10.** confirmed; error. Source `harris90-survey`, §3, Theorem 3.4, printed p.63 (PDF p.75).

Correction: Retain the one-dimensional contributing degree with the source parameter convention. The general extra vanishing assertion fails for the full disconnected GL_2(ℝ); the connected semisimple case is a valid special case.

Reason: Goldring–Koskivirta Remark 10.1.3 explicitly identifies this error. For the weight-one full GL_2 limit, the holomorphic and antiholomorphic components contribute degrees 0 and 1 with the same coefficient.

**E11.** unreviewed; error. Source `getz-hahn`, Definitions 6.7–6.8, pp.30–31; notes version of 13 March 2015.

Correction: Require the image to be closed in End(E), or enlarge by inverse-dual or inverse-determinant data; use two-sided polynomial height comparisons.

Reason: On ℝ× the representations x↦x and x↦x⁻¹ both have finite kernel. The function x↦\|x\|⁻¹ is polynomially bounded in 1+\|x\|⁻¹ but not in 1+\|x\| near zero. Borel–Jacquet §1.2 explicitly gives the stronger closed-image-in-End hypothesis.

**E12.** unreviewed; error. Source `getz-hahn`, §7.1, restricted tensor product definition, p.35; notes version of 13 March 2015.

Correction: Take the vector-space direct limit of finite tensor products with transition maps tensoring the distinguished vectors; sums of pure tensors are included.

Reason: Already for two two-dimensional factors, 1⊗1+x⊗x has coefficient matrix of rank two and is not pure. A set of restricted pure sequences is not closed under addition.

**E13.** unreviewed; gap. Source `getz-hahn`, Proof of Proposition 7.9, pp.36–37; notes version of 13 March 2015.

Correction: Start with any invariant subspace U of a nonzero corner, generate the full module from U, then recover U by the same idempotent.

Reason: A proper invariant subspace need not have an invariant complement. Flath Theorem 1, pp.179–180, gives the generation argument and handles every submodule.

**E14.** unreviewed; error. Source `getz-hahn`, Theorem 7.11, p.37; notes version of 13 March 2015.

Correction: Require an irreducible admissible representation on both sides of the factorization theorem; reducible admissible objects can be sums or extensions.

Reason: For C₂×C₂, the admissible module 1⊗1⊕sgn⊗sgn has a rank-two character matrix. Every single exterior tensor has a rank-one character matrix, so this module does not have the asserted form. Flath Theorem 1 states the irreducible hypothesis.

**E15.** unreviewed; error. Source `cg20`, §2.0.1, arXiv:1907.08691v1 p.7, description of w₀.

Correction: The swap is the longest element w_{0,M} of the Siegel Levi Weyl group. The full type-C₂ longest element is (a,b;c_T)↦(−a,−b;c_T+a+b). Use w_{0,M} in the compact-chamber contragredient formula.

Reason: The swap sends the positive root (0,2;−1) to the positive root (2,0;−1), so it does not reverse all positive roots. The stated full longest element sends each of the four displayed positive roots to its negative.

## Gaps that prevent closure

**G1. Smooth differential forms on manifolds.** The invariant-form complex Ω^•(G/K; V)^G needs smooth V-valued differential forms of every degree on a manifold with the exterior derivative and the Poincaré lemma. Mathlib has forms only on normed spaces (Analysis/Calculus/DifferentialForm) and Tau Ceti only smooth two-forms; no roadmap of the atlas plans the smooth de Rham complex of a manifold. The van Est proof can bypass forms through the smooth cochain complex (Wockel §3) for the cohomological statement, but the layer's invariant-form target needs the de Rham complex.

Needed by `AF.1a/invariant-forms-complex`, `AF.1a/van-est-isomorphism`.

**G2. Cartan–Iwasawa–Malcev for non-reductive Lie groups.** For general Lie groups with finitely many components the existence and conjugacy of maximal compact subgroups and G/K ≅ ℝ^d (Cartan–Iwasawa–Malcev–Mostow) are stated with their proof route only; no freely readable proof source was read. All consumers in the atlas (BorelRegulators, Polylogarithms, ALS.5) use reductive G(ℝ), which is covered through ALS.0 and Tau Ceti LieGroups Layer 9.

Needed by `AF.1a/cartan-iwasawa-malcev`.

**G3. Dixmier–Malliavin proof source not read.** The original proof (J. Dixmier, P. Malliavin, Factorisations de fonctions et de vecteurs indéfiniment différentiables, Bull. Sci. Math. (2) 102 (1978) 305-330) was not read in this review; the node states the theorem as quoted by Bernstein–Krötz Remark 2.19, BPCZ (2.5.3.2) and Jiang–Zhang Appendix A, with the proof route only. A follow-up must read the proof and decompose the factorization of rapidly decreasing sequences.

Needed by `AF.1/dixmier-malliavin`.

**G4. Langlands classification and discrete series proofs not read.** The proofs of the Langlands classification (Langlands, Math. Surveys Monogr. 31, 1989) and of Harish-Chandra's discrete series theorems (Acta Math. 113 (1965), 116 (1966)) were not read in this review. The nodes state the theorems as the cited papers use them. A follow-up must read a proof source (for example Knapp, Representation theory of semisimple groups, Chapters IX-XIV) and refine the two nodes, at lemma level, into Casselman's asymptotics, the standard intertwining operators and Harish-Chandra's character theory.

Needed by `AF.1/langlands-classification`, `AF.1/discrete-series`.

**G5. Proof source for the archimedean local Langlands correspondence.** Knapp’s public author-hosted survey has now been read in §§2–4, pp.399–406, including the explicit GL_n correspondence. Its construction and theorem statement are available; a complete classification/proof-closure audit and the local factor bridge to AL.2 remain required. The earlier assertion that this survey is not freely available is removed.

Needed by `AF.1/archimedean-llc-gln`.

**G6. Vogan's unitary dual not read.** Vogan, The unitary dual of GL(n) over an archimedean field, Invent. Math. 83 (1986) 449-505, was not read in this review; the node records the statement as Jiang–Zhang (B.5) use it.

Needed by `AF.1/vogan-generic-unitary-dual`.

**G7. Harish-Chandra reconstruction kernel and fixed-type finiteness proof interiors.** Borel–Jacquet §§1.6–1.7, p.191, and §2.2, p.193, were read in the maintainer-cleared Corvallis volume. They state the fixed-type finiteness theorem and invoke Harish-Chandra Lemma 14 for a reconstruction kernel and derivative growth. Their references to Harish-Chandra LNM 62, Theorem 1/Lemma 14, and the enveloping-algebra finiteness input to Lemma 2.1 are not a proof-closure substitute. Read a permitted original proof source and name the nonroutine kernel/finiteness prerequisites.

Needed by `AF.2/automorphic-forms-uniform-growth`, `AF.2/central-translation-finiteness`.

**G8. Proof source for rapid decay of cusp forms.** Borel–Jacquet §1.8, p.192, and §4.4, p.196, were read in the cleared Corvallis volume: the article states the real rapid-decay result and proves the elementary adelic transport by unipotent strong approximation. The analytic decay estimate itself is referred to Harish-Chandra §4. That proof remains unread and must be supplied before closure.

Needed by `AF.3/cusp-form-rapid-decay`.

**G9. Proof sources for Borel–Wallach, Blasius–Harris–Ramakrishnan, Harris, Clozel not read.** Borel–Wallach (Continuous cohomology…, 2nd ed., 2000), Blasius–Harris–Ramakrishnan (Duke 73, 1994), Harris (Perspect. Math. 11, 1990; J. Differential Geom. 32, 1990), Clozel (Motifs et formes automorphes, 1990), Pitale–Schmidt (IMRN 2009) and the full Vogan–Zuckerman proofs were not read; the nodes record statements from the papers that use them, at their locators. A follow-up reads these sources and refines the proofs. Independent review located Harris’s published survey in the public Milne-edited volume and read pp.58–63; Theorem 3.5 is now a primary statement citation. The Schmid/Williams/Mirković proof interiors, BHR, Clozel and the other proof sources remain unread. Goldring–Koskivirta supplies a published correction to Harris’s general degree-vanishing claim.

Needed by `AF.4/borel-wallach-tempered-range`, `AF.4/bhr-coherent-cohomology`, `AF.4/mirkovic-tempered-coherent`, `AF.4/bhr-large-weight`, `AF.4/harris-limits-gsp2g`, `AF.4/clozel-purity`, `AF.4/clozel-rationality`, `AF.4/gln-tempered-cohomological`, `AF.4/vogan-zuckerman`.

**G10. Relative Ext and Wigner lemma closure.** Construct the relative Koszul/PBW resolution and prove its relative projectivity/exactness in the locally K-finite smooth compatible category before identifying relative cohomology with Ext. The finite-dimensional compact-group invariants functor supplies exactness but not this resolution.

Needed by `AF.1a/relative-cohomology-functoriality`, `AF.4/wigner-lemma`.

**G11. Native reductive datum and classification signatures.** The file now has actual differentiated compatible pairs/modules, closed countable-Banach-product smooth Fréchet representations, derivative-compatible K-finite functors, G-continuous Banach realizations, normalized induction and quotient-Haar matrix-coefficient predicates. Remaining native inputs are algebraic realPoints/Datum, integrated Cartan/Iwasawa/positive-root data, the classified discrete/principal/Langlands objects and their canonical globalization. Exact per-name omissions are listed in the reader; arbitrary Prop stand-ins are not used.

Needed by `AF.1a/gk-pair`, `AF.1a/gk-module`, `AF.1/real-reductive-group`, `AF.1/admissible-gk-module`, `AF.1/infinitesimal-character`, `AF.1/principal-series`, `AF.1/sf-representation`, `AF.1/g-continuous-norms`, `AF.1/casselman-wallach-globalization`, `AF.1/dixmier-malliavin`, `AF.1/real-reductive-representation-theory`, `AF.1/tempered-square-integrable`, `AF.1/discrete-series`, `AF.1/langlands-classification`, `AF.1/archimedean-llc-gln`, `AF.1/gl2-real-discrete-series`.

**G12. Maass adelization and spectral acceptance.** The file states the native upper-half-plane Laplacian, hyperbolic L² carrier, zero constant Fourier coefficient, normalized Hecke operators and parity/scaling examples. The PGL₂ adelization map still needs the actual AA quotient and AF.5 dictionary. DIT’s five values are a numerical dataset, and simplicity is conjectural; no exact ordering, Selberg lower bound or imaginary-spectral-parameter Bessel comparison is inferred from that report.

Needed by `AF.3/maass-cusp-forms`.

**G13. Algebraic group highest-weight classification supplier.** LieHighestWeight Layer 4 classifies semisimple Lie algebra modules; Layer 9 retains arbitrary central Lie weights. To obtain rational representations of a general reductive algebraic group, impose the integral character lattice/isogeny constraint and prove integration. ReductiveGroups Layer 1 only supplies comodules. Request the additional theorem from the owner as a Part II extension; do not infer it from the existing Layer 1 statement.

Needed by `AF.4/algebraic-weight`, `AF.4/infinitesimal-character-of-weight`.

**G14. Coherent component and vanishing conventions.** Resolve the positive-similitude Hodge stabilizer versus the full disconnected group for all discrete/limit modules. Goldring–Koskivirta Theorem 10.1.2 and Remark 10.1.3 retain the one-dimensional contributing degree but explicitly warn that Harris Theorem 3.4 vanishing in every other degree is false already for full GL_2; connected semisimple groups are a valid special case. Do not extend degree concentration or uniqueness-from-degree beyond verified hypotheses.

Needed by `AF.4/gsp4-discrete-series`, `AF.4/bhr-coherent-cohomology`, `AF.4/mirkovic-tempered-coherent`, `AF.4/harris-limits-gsp2g`.

**G15. Unverified or incomplete supplier exports.** AA and ShimuraData packets were read and have needs_changes reviews; their matching statements are conditional prerequisites, not accepted closure. SR, ALS, AS and RG2 campaign statements were read, but exact packet declarations were absent. AL.0 has a Bessel plan; AL.3 has no genericity node in the current packet. Preserve these precise requests, verify the eventual declaration/hypotheses and resolve the algebraic-group classification extension; do not count absent exports as supplied.

Needed by `AF.1a/relative-cohomology-functoriality`, `AF.1a/van-est-isomorphism`, `AF.1/real-reductive-group`, `AF.2/harish-chandra-finiteness`, `AF.2/automorphic-representation`, `AF.2/spherical-dimension-one`, `AF.2/flath-factorization`, `AF.3/maass-cusp-forms`, `AF.4/algebraic-weight`, `AF.4/clozel-purity`, `AF.4/coherent-relative-cohomology`, `AF.4/harris-limits-gsp2g`, `AF.4/coefficient-lattices`, `AF.4/clozel-rationality`, `AF.4/torsion-hecke-eigenclasses`, `AF.5/algebraic-modular-forms`, `AF.5/algebraic-modular-forms-structure`.

**G16. Native signatures not supplied at the pinned baseline.** The reader gives an explicit inventory of every omitted main declaration, API item and named example, grouped by node with the exact missing native input and owner. Present generic constructions use actual carrier equations; local lattice and supplied-coefficient/weight-model helpers have distinct names. A matching comment, a weaker helper or a chosen arbitrary isomorphism is not counted as the original theorem. The full packet targets remain mathematical specifications requiring these suppliers, not elaborated classification or arithmetic outputs.

Needed by `AF.0/smooth-adelic-function`, `AF.0/adelic-test-functions`, `AF.0/adelic-schwartz-space`, `AF.0/moderate-growth`, `AF.0/uniform-moderate-growth-space`, `AF.1a/gk-pair`, `AF.1a/gk-module`, `AF.1a/relative-lie-cochain-complex`, `AF.1a/differentiable-cochains`, `AF.1a/invariant-forms-complex`, `AF.1/real-points-lie-group`, `AF.1/real-reductive-group`, `AF.1/k-finite-vectors`, `AF.1/admissible-gk-module`, `AF.1/infinitesimal-character`, `AF.1/principal-series`, `AF.1/sf-representation`, `AF.1/g-continuous-norms`, `AF.1/real-reductive-representation-theory`, `AF.1/tempered-square-integrable`, `AF.1/weil-group-real`, `AF.1/gl2-real-discrete-series`, `AF.2/automorphic-form`, `AF.2/smooth-automorphic-forms`, `AF.2/automorphic-forms-module`, `AF.2/automorphic-representation`, `AF.2/restricted-tensor-product`, `AF.2/holomorphic-sl2-forms`, `AF.3/constant-term`, `AF.3/cusp-form`, `AF.3/cuspidal-automorphic-representation`, `AF.3/maass-cusp-forms`, `AF.4/algebraic-weight`, `AF.4/c-l-algebraic`, `AF.4/cohomological-representation`, `AF.4/l0-q0-invariants`, `AF.4/hermitian-positive-system`, `AF.4/coherent-relative-cohomology`, `AF.4/gsp4-discrete-series`, `AF.4/coefficient-lattices`, `AF.4/rationality-field`, `AF.4/torsion-hecke-eigenclasses`, `AF.5/gl2-classical-to-adelic`, `AF.5/algebraic-modular-forms`.

**G17. Compact-pair versus Hodge-stabilizer quotient comparison.** K^h is noncompact because it contains A_∞. On coefficients where A_∞ acts trivially, identify the Hodge relative cochain complex for (𝔭_h,K^h) with that for (𝔭_h/𝔞_∞,K^h/A_∞), including the differentiated inclusion and component action. Import the actual central group/Lie quotient from AA/ALS/LieGroups suppliers, then prove this comparison in AF.1a; a general θ-stable parabolic does not contain all of k, and a compact-pair structure cannot silently accept K^h.

Needed by `AF.1a/gk-pair`, `AF.4/hermitian-positive-system`, `AF.4/coherent-relative-cohomology`, `AF.4/bhr-coherent-cohomology`, `AF.4/mirkovic-tempered-coherent`, `AF.4/harris-limits-gsp2g`.

**G18. Consumer contracts for the AF real and cochain prefixes.** The real-representation and local-weight splits are proposals, not integrated stages. Globalization must consume the Casselman/classification/discrete-series reduction in the single real owner. ALS.4 requests the AF.1a absolute algebraic cochain complex over a characteristic-zero E, compatible Levi action and parabolic Kostant theorem: the existing relative complex over C is not that exact supplier. Extend the sole AF.1a owner rather than construct cochains in ALS.4. Mathlib already has low-degree absolute Lie cochains; the requested output is the full compatible complex and Kostant result, not a second low-degree theory. Original proof sources and native signatures remain governed by the existing gaps/revision, with no integral or mod-p Kostant claim.

Needed by `AF.1/casselman-wallach-globalization`, `AF.1a/relative-lie-cochain-complex`, `AF.4/clozel-rationality`.

**G19. Matrix-coefficient realization existence and comparison.** Coefficient integrability is now expressed on an actual quotient Haar measure with a supplied jointly continuous Banach representation, unitary central character and K-finite continuous-dual coefficient. Existence of canonical discrete/tempered Hilbert realizations and comparison with CW’s SAF globalization still require the original classification and globalization proof inputs.

Needed by `AF.1/tempered-square-integrable`, `AF.1/langlands-classification`, `AF.1/casselman-wallach-globalization`.

**G20. Archimedean PBW and distribution comparison.** The file now has the compactly supported C∞ dual, actual supported bi-K-finite convolution carrier, finite-type idempotents, U(𝔤)/U(𝔨) balance quotient and action/nondegenerate-module equivalence statements. Flath p.182 does not prove the transverse-order/PBW analytic identification. Its proof and the continuity/support transport are a remaining source refinement, rather than an absent placeholder carrier.

Needed by `AF.2/archimedean-hecke-algebra`, `AF.2/flath-factorization`.

**G21. Kostant operator prerequisites and rational descent.** Theorem 4.4 and its proof, including Lemma 4.4 pp.346–347, and the full Theorem 5.14 proof/Proposition 5.13 were read. The earlier operator identities, finite-dimensional harmonic decomposition and reductive central extension need lemma-level refinement. Scalar extension and descent from a splitting characteristic-zero field remain required for ALS.4; neither integral nor positive-characteristic decomposition follows.

Needed by `AF.4/kostant-parabolic-cohomology`.

**G22. Central-quotient algebraic modular-form finiteness.** AA.3/class-number-finite supplies the ordinary finite class set under its centre hypotheses. The central-quotient version needed for positive-unit-rank tori, finiteness of the descended effective stabilizers and central-character coefficient transport are requested from AA.3/AA.4; the current ordinary class-set theorem does not discharge them.

Needed by `AF.5/central-character-algebraic-modular-forms`.

## Structure proposals and next review

**Proposal 1: split.** AF.1 combines the algebraic and analytic foundations ((𝔤, K)-modules, Harish-Chandra modules, infinitesimal characters, Casselman–Wallach globalization, Dixmier–Malliavin) with the classification of irreducible representations (tempered and discrete series, Harish-Chandra parameters, Langlands classification, W_ℝ and Langlands' correspondence for GL_n(ℝ), GL_n(ℂ), Vogan's generic unitary dual). RT-AREA-automorphic-1/2 asks for the classification to be planned (archimedean local Langlands) and proposes AF.1b as one option.

Create AutomorphicFormsOnReductiveGroups:AF.1b ‘Real reductive representation theory’ containing casselman-embedding, tempered-square-integrable, discrete-series, langlands-classification, weil-group-real, archimedean-llc-gln, gl2-real-discrete-series, vogan-generic-unitary-dual and casselman-wallach-globalization. Preserve current node ids pending maintainer integration. AF.1 keeps the real group and algebraic Harish-Chandra interfaces, infinitesimal characters, principal-series and norm/Schwartz prerequisites; AF.1a supplies compatible pairs, modules and cochains. Casselman embedding precedes classification; globalization consumes embedding and the classification/discrete-series reduction. AF.1b imports these independent AF.1/AF.1a prefixes and supplies AF.2, AF.4, AL.2/AL.3, R16.2/R16.6 and ET.1. AL.1 retains Tate’s rank-one factors; the higher Weil-representation factor dictionary is AL.2 using the single AF classification owner. Do not introduce a second AL.1a classification. The current stages are unsplit, so this proposal is not a claim of full stage-graph closure. Discrete series are modulo centre with compact-Cartan rank and central-character conventions, not equality of real split ranks. Define matrix-coefficient integrability on a supplied continuous/unitary realization before general globalization; compare with the canonical SAF realization afterwards. Keep the original existence/classification proofs and this comparison as explicit gaps.

**Proposal 2: rescope.** RT-AREA-automorphic-1/29: the relative Lie algebra cochain complex was planned in both AF.1 and AF.1a, and RS-04 names AF.1 its owner. AF.1a must not depend on AF.1's analysis.

AF.1a owns pairs (𝔮, K), (𝔮, K)-modules and the relative Lie algebra cochain complex with functoriality, long exact sequences and cup products (nodes AF.1a/gk-pair, gk-module, relative-lie-cochain-complex, relative-cohomology-functoriality; the last three also realise AF.1). Add the stage edge AF.1a → AF.1. Redirect RS-04's owner entry 'Relative Lie algebra cochain complex' and its link AF.1 → AS.5 to AF.1a → AS.5; BorelRegulators R.2 keeps importing from AF.1a. AF.1's description should say that it imports the (𝔤, K)-module category and relative cochains from AF.1a.

**Proposal 3: rescope.** RS-04 links AdelicAlgebraicGroups AA.3 → AF.1 (heights feed the real representation theory), while the AdelicAlgebraicGroups packet's node AA.3/height-representation-comparison requests the archimedean norm comparison from AF.1, which would make AF.1 and AA.3 depend on each other.

Keep RS-04's direction AA.3 → AF.1: AA.3 proves the comparison ‖g‖_ι' ≤ C‖g‖_ι^N for real points as well (it is polynomial algebra on matrix entries and needs no representation theory), and AF.1 imports it (AF.1/sf-representation uses AA.3/height-representation-comparison). The AdelicAlgebraicGroups request to AF.1 should be withdrawn in its revision. In addition add the stage edges ALS.0 → AF.1 (Cartan involutions), AF.1 → AF.0 (Lie group structure of G(F_∞)), SR.4 → AF.2 (RT-AREA-automorphic-1/26), ALS.1, ALS.3, ALS.5, AS.5 → AF.4 (RT-AREA-automorphic-1/30), AS.4 → AF.4 (A_(2)(G) for coherent L²-cohomology), ShimuraData D3, D5 → AF.4, AutomorphicLFunctionsAndLocalFactors AL.0 → AF.3 (K-Bessel functions) and AL.3 → AF.4 (genericity of cuspidal GL_n representations). Use the exact earlier supplier prefixes: the combined packet graph still has stage-boundary cycles, including ALS.5 → AF.4 → ALS.5. The separate AF.4 local-prefix and ALS.5 comparison/application splits below are required before claiming acyclicity of these exports.

**Proposal 4: split.** RT-AREA-automorphic-1/30: local cohomological weights must precede Betti comparison; rationality and torsion eigenclasses consume it.

Export an early AF.4:local-weights prefix with algebraic-weight, coefficient-lattices, cohomological-representation, wigner-lemma and vogan-zuckerman. Its current fine-node inputs are AF.1/AF.1a, AA.1 integral models and the existing highest-weight/root suppliers; it imports no ALS or AS.5 result. Keep torsion-hecke-eigenclasses after ALS.1/ALS.3, and clozel-rationality after the actual ALS.5 comparison and AS.5 inputs, retaining its GL_n and explicitly conditional general-group scopes. ALS.5 and AS.5 comparison proofs may use the local prefix, never this rationality suffix. Coordinate with the existing ALS.5 comparison versus automorphic-applications split; preserve node ids until maintainer integration.

The independent review should check the repaired conventions and source findings, the exact native hypotheses and the completeness of the omission inventory against the seven target sets. Closure work discharges the specified supplier exports and analytic proof gaps, implements the missing native signatures without weakening their names, and integrates the prefix splits before claiming that the combined stage graph is acyclic. The mathematical catalogue is complete at target level; its stages remain open for those exact obligations.
