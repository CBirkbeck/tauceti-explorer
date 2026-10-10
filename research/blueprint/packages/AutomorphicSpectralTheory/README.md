# Automorphic spectral theory and trace distributions

Construct automorphic L² decomposition, Eisenstein packets, weighted cohomology and trace distributions, tested by modular kernels and unramified function-field GLₙ formulas.

## Scope and prerequisites

Use **SelfAdjointSpectralTheory** for projection measures, Borel calculus and self-adjoint partial operators, **OperatorIdeals** for Schatten/Hilbert–Schmidt theory, and **CompactGroups** for Peter–Weyl and compact kernels. Add measurable multiplicities, direct integrals, L² kernels and complex trace with native `LinearPMap` adjoints/resolvents; noncompact groups need smoothing estimates.

Use **AdelicAlgebraicGroups** AA.0–AA.3 for adelic topology, quotient measures, heights and reduction; **ReductiveGroupsPartII** for local structure; **SmoothRepresentationsOfLocalGroups** SR.1–SR.4 for Hecke algebras, normalized induction, admissibility and spherical data. Add rational global Bruhat indexing and analytic intertwiner estimates.

Use **AutomorphicFormsOnReductiveGroups** AF.0–AF.3 for adelic functions, real representations, restricted tensors, constant terms and cusp data; **ArithmeticLocallySymmetricSpaces** ALS.5 for cohomology comparison; **AutomorphicLFunctionsAndLocalFactors** AL.0–AL.3 for Fourier–Laplace inversion, Hecke/GLₙ/GL×GL factors and `AL.0/bessel-k`. Extend this for GL×classical, exterior/symmetric and Asai factors.

Stabilization, endoscopy and Galois applications consume this theory. Orbital integrals/local packets precede spectral construction; rank-one analysis precedes arithmetic applications.

## Conventions and order

Hilbert spaces are complete and complex, with conjugate-first inner products. Direct-integral sections have a countable fundamental sequence and agree almost everywhere. Projection measures are strongly countably additive. Trace requires trace class; diagonal kernels require a specified representative or factorization.

Induction uses δ_P^(1/2), or a^(ν+ρ_P), and AA.0/AA.2 quotient measures. Weyl denominators, covolumes and stabilizer cardinalities are explicit. The spectral resolvent (A−zI)⁻¹ is minus the native (zI−A)⁻¹; Stone uses U(t)=exp(itA), generator iA.

Yu, DIT and Gross–Zagier targets/tests use Y, D and G respectively:

- **Y:** F=𝔽_q(X), X smooth, projective and geometrically connected; n>0; everywhere-unramified GLₙ data, except general compact-group assertions. Probability Haar is normalized on the entire character group: with r components each has mass 1/r. The degree sign and half-modulus convention are fixed; gcd(e,n)=1 is imposed only where stated.
- **D:** Γ=PSL₂(ℤ), Δ=−y²(∂x²+∂y²), dμ=dxdy/y², e(x)=exp(2πix). Displayed index, sign, parameter and boundary restrictions are hypotheses.
- **G:** Gross–Zagier uses Δ_GZ=+y²(∂x²+∂y²). Positive-base powers use the real logarithm; displayed frequency, parameter and off-orbit restrictions and measure normalizations are hypotheses.

For F=y^(k/2)f, the coefficient and unitary-weight operators satisfy
Δ_classical f=y^(−k/2)(Δ_unitary F+(k²/4−k/2)F); at k=1/2 the shift is −3/16. Green sums use Γ₀(N)/{±I}, whereas Eisenstein sums use Γ_∞\Γ.

Build AS.0, AS.1–AS.2, AS.3, AS.4 in order; AS.5 adds AF/ALS cochains. AS.6's local Paley–Wiener/multiplier prefix uses AS.0 and AF.1: general Levi SF compact pictures, K∩M covariance, half-modulus, finite K-types, holomorphy and induction in stages. Its trace suffix needs convergent quotient-centralizer orbital integrals, pseudo-coefficients and finite-place Bernstein trace images. Modular cores need oriented quadratic cycles with genus-character signs.

Names extend `TauCeti.AutomorphicSpectral`; API/test leaves extend their target. AS.k.j labels targets; AA/SR/AF/AL/ALS suppliers; B library; S bibliography.

`SpecialFunctions` is a consumer comparison interface. I/J agree with QM.2's principal-power regularized ₀F̃₁ formulas, with arguments +y²/4 and −y²/4 respectively; K agrees with AL.0's Mellin integral; Λ agrees with Mathlib `completedRiemannZeta`. Require these equations for the supplied functions. Checks: I₀(0)=1; J_{1/2}(y)=√(2/(πy))sin y; K_{1/2}(y)=√(π/(2y))e^(−y) for y>0; Λ(1−s)=Λ(s). Sources: [DLMF 10.2.2](https://dlmf.nist.gov/10.2.E2), [10.25.2](https://dlmf.nist.gov/10.25.E2), [10.32.10](https://dlmf.nist.gov/10.32.E10); the named suppliers own these functions.

## AS.0 — Hilbert fields, vector analysis and rank-one kernels

### AS.0.1 — Measurable separable Hilbert fields

`measurable_hilbert_field`

On a standard Borel space X, a measurable Hilbert field consists of complete complex Hilbert spaces Hₓ and a complex-linear space M of sections: x↦‖s(x)‖ is measurable for s∈M; a section t lies in M exactly when x↦⟪t(x),s(x)⟫ is measurable for every s∈M; and M contains a countable sequence whose values are dense in every fibre. Equality and changes of fundamental sequence preserve M, not merely the individual fibres.

Assume: X is standard Borel; fibres are separable; inner products conjugate the first variable.

API:

- `ofFundamental`: A sequence with measurable pairwise Gram entries and pointwise dense span generates exactly one saturated measurable-section space.
- `mem_iff_pairing`: s∈M iff its pairings with every fundamental section are measurable.
- `map_isometry`: A fibrewise unitary carrying one fundamental sequence to measurable sections transports M; identity and composition agree.

Tests:

- `constant_scalar`: For the standard constant ℂ field, with the constant-one section in M, M is exactly the measurable complex functions.
- `zero_fibre`: If every fibre is zero, M contains the unique section.
- `fundamental_change`: Adding measurable limits of finite rational combinations to a fundamental sequence leaves M unchanged.

Source: S1, §2 Definition 1 and Example 4.

Uses: B1.

### AS.0.2 — Direct integral Hilbert space

`direct_integral`

For a measurable Hilbert field and a σ-finite Borel measure μ, form square-integrable measurable sections s with ∫‖s(x)‖²dμ<∞, quotient by equality μ-almost everywhere, and give the quotient inner product ∫⟪s(x),t(x)⟫dμ. This is complete and separable for a standard Borel σ-finite measure. Null fibres and null subsets have no effect. Scalar-valued and finite atomic instances identify with Mathlib L² and weighted Hilbert sums.

Assume: The field is measurable in the preceding saturated/countable sense; μ is σ-finite.

API:

- `mk`: A measurable square-integrable section has a canonical class.
- `mk_eq_mk`: Two such classes agree iff the sections agree μ-almost everywhere.
- `inner_mk`: The inner product of classes is the integral of fibre inner products.
- `reindex`: A measure-preserving Borel isomorphism and measurable fibrewise unitaries induce a unitary reindexing map.

Tests:

- `scalar_L2`: The standard constant ℂ field, with the constant-one section in M, identifies unitarily with L²(μ;ℂ).
- `two_atoms`: For μ=aδ₀+bδ₁ with a,b>0, ‖(v₀,v₁)‖²=a‖v₀‖²+b‖v₁‖².
- `null_singleton`: Changing a section on a μ-null singleton leaves its class unchanged even when its value changes.

Source: S1, §4 Definition26, p.13; Theorem27, pp.13–14, p.3.

Uses: AS.0.1; B1; B3.

### AS.0.3 — Decomposable operators

`decomposable_operator`

An operator field Aₓ:Hₓ→Kₓ is measurable when it carries every measurable section to a measurable section. If ess supₓ‖Aₓ‖<∞, it induces a bounded operator D(A) between the direct integrals by [s]↦[x↦Aₓs(x)]. Its norm equals ess sup‖Aₓ‖; adjoints and compositions are fibrewise, and two fields induce the same operator iff they agree almost everywhere.

Assume: σ-finite standard Borel base; measurable separable fields; essentially bounded operator norm.

API:

- `apply_mk`: D(A)[s]=[Aₓsₓ].
- `norm_eq_essSup`: ‖D(A)‖=ess supₓ‖Aₓ‖.
- `adjoint`: D(A)⁎=D(A⁎); D(B∘A)=D(B)∘D(A).

Tests:

- `identity`: For the identity operator field, its decomposable operator is the identity on the direct integral and has norm one on a nonzero scalar fibre model.
- `null_change`: Changing A on a null set induces the same operator.
- `unbounded_multiplier`: Multiplication by the real coordinate on L²(ℝ) has no bounded extension agreeing almost everywhere on all compactly supported vectors.

Source: S1, §2 Definition2; §4 Definition26 and Theorem27, p.3.

Uses: AS.0.2.

### AS.0.4 — Isometric integration maps

`isometric_integration_map`

Let D be a dense linear subspace of a direct integral and W₀:D→H a linear map into a complete Hilbert space satisfying ⟪W₀u,W₀v⟫=∫⟪uₓ,vₓ⟫dμ. Then W₀ extends uniquely to a linear isometry W of the entire direct integral. Its range is closed; W is unitary onto H exactly when the range of W₀ is dense. An isometry alone does not prove spectral completeness.

Assume: D is dense; the stated Gram identity holds for every u,v∈D.

Source: S2, §§0.4–0.5 Theorems0.23,0.26, pp.22–24.

Uses: AS.0.2.

### AS.0.5 — Projection-valued measures

`projection_valued_measure`

Consume SelfAdjointSpectralTheory SA-B14–SA-B33; the listed API/tests specify the real spectral-coordinate adapter.

A projection-valued measure E on ℝ (or ℂ for a bounded normal operator) assigns an orthogonal projection E(B) to each Borel set, with E(∅)=0, E(total)=1 and strong countable additivity on disjoint Borel sets. Strong additivity means convergence after application to each vector; operator-norm additivity is not imposed. The scalar measure μᵥ(B)=⟪v,E(B)v⟫ is positive with total mass ‖v‖².

Assume: H is a complete complex Hilbert space.

API:

- `scalarMeasure`: E gives positive finite scalar measures μᵥ and polarized complex measures μᵤ,ᵥ.
- `inter`: E(B)E(C)=E(B∩C) for Borel B,C.
- `borelIntegral`: Bounded Borel functions integrate to bounded operators, with indicators mapping to E(B).

Tests:

- `finite_diagonal`: For diag(a,b), E(B)=diag(1_B(a),1_B(b)).
- `empty`: E(∅)=0 and E(total)=1, including the zero Hilbert space.
- `multiplication`: On L²(ℝ), E(B) is multiplication by 1_B.

Source: S2, §3.1 equations (3.5)–(3.15); PDF page 100.

Uses: the stated native analytic/Hilbert-space interfaces.

### AS.0.6 — Herglotz representation

`herglotz_representation`

Consume Tau Ceti's `exists_isFiniteMeasure_eq_nevanlinnaKernel_add`: a holomorphic F with Im F≥0 on the upper half-plane has F(z)=a+bz+∫(1+tz)/(t−z)dρ(t), with ρ finite positive, a=Re F(i) and b≥0. Convert by dν=(1+t²)dρ to F(z)=a+bz+∫[(t−z)⁻¹−t/(1+t²)]dν; establish uniqueness in this convention. For resolvents, identify b=0 and finite mass by the asymptotic at i∞; polarize to reconstruct the spectral measure.

Adapter API: `weightedMeasure` preserves positivity; `weighted_mass` gives ∫(1+t²)⁻¹dν=ρ(ℝ); `integral_conversion` equates the integrable kernels. Tests: ρ=0 gives ν=0; ρ=δ₂ gives ν=5δ₂ and weighted mass 1.

Assume: The sign is the resolvent convention (A−z)⁻¹; a resolvent written (z−A)⁻¹ has the opposite sign.

Source: S2, §3.4 Theorem 3.20, p.107; S30, §10.1 Theorem 10.5, equation (10.1), and proof, printed pp.125–126.

Uses: Tau Ceti `Analysis.Complex.Pick.Nevanlinna`; Mathlib `Measure.withDensity` and change-of-density integration.

### AS.0.7 — Unbounded self-adjoint spectral theorem

`unbounded_selfadjoint_spectral`

Consume SelfAdjointSpectralTheory SA-E01–SA-E47 and its native LinearPMap interface. The additional target here is the separable measurable-multiplicity/direct-integral model.

For a densely defined self-adjoint partial linear map A on H there is a unique projection-valued measure E on ℝ with A=∫t dE(t), domain {v:∫t²dμᵥ(t)<∞}. The bounded Borel calculus satisfies f(A)⁎=conj(f)(A), multiplication, and dominated strong convergence. For general Borel f, the domain is {v:∫|f|²dμᵥ<∞}; real f gives self-adjoint f(A). If H is separable, a unitary multiplication model is a countable sum of cyclic L² measures, hence a measurable-multiplicity direct integral. This extends, and agrees with, the existing Stone correspondence.

Assume: A is self-adjoint, not merely symmetric or essentially self-adjoint on an unspecified domain.

Source: S2, §3.1 Theorems 3.1–3.7; §3.3 Theorem 3.17, pp.88–96,105.

Uses: AS.0.5; AS.0.6; AS.0.2; B12.

### AS.0.8 — Bounded normal spectral theorem

`bounded_normal_spectral`

Consume SelfAdjointSpectralTheory SA-B01–SA-B36 for the normal bounded Borel calculus; construct its measurable-multiplicity/direct-integral model here.

For a bounded normal operator N on a separable complex Hilbert space there is a unique projection-valued Borel measure on its compact spectrum in ℂ with N=∫z dE(z). Its bounded Borel calculus extends the continuous functional calculus and gives a multiplication direct-integral model, including multiplicities. This is a spectral-measure extension; the existing finite-dimensional self-adjoint eigenbasis is the finite atomic special case.

Assume: N⁎N=NN⁎; H is separable and complete.

Source: S2, §3.1 bounded functional calculus and §3.3 multiplication models.

Uses: AS.0.7; AS.0.5; AS.0.2; B21.

### AS.0.9 — Hilbert–Schmidt operators

`hilbert_schmidt`

Consume OperatorIdeals OI-B32–OI-B41, OI-B90 and OI-C01–OI-C14. The new target here identifies general L² kernels with these imported operators, extending the continuous compact-kernel case of CompactGroups.

For a bounded operator A:H→K between separable Hilbert spaces define the squared Hilbert–Schmidt norm by Σ_j‖Ae_j‖² for any orthonormal basis of H. Finiteness is basis independent. These operators form a complete normed vector space and a two-sided operator ideal; finite-rank operators are dense in this norm. On scalar L² spaces, a square-integrable kernel gives a Hilbert–Schmidt operator with exactly its kernel L² norm.

Assume: Complete separable complex Hilbert spaces; countable orthonormal bases.

API:

- `norm_basis`: ‖A‖HS²=Σ_j‖Ae_j‖² for every orthonormal basis.
- `ideal_bound`: ‖BAC‖HS≤‖B‖‖A‖HS‖C‖.
- `kernel_norm`: For K∈L²(X×Y), the integral operator has HS norm ‖K‖₂.

Tests:

- `rank_one`: For v↦⟪u,v⟫w, ‖A‖HS=‖u‖‖w‖.
- `infinite_identity`: On a Hilbert space with an ℕ-indexed Hilbert basis the identity has no Hilbert–Schmidt representative.
- `finite_identity`: On an n-dimensional Hilbert space the actual identity is Hilbert–Schmidt and has Hilbert–Schmidt norm √n.

Source: S2, §6.3 equations (6.8)–(6.13), Lemma 6.10; PDF page 152.

Uses: B2; B1; B22.

### AS.0.10 — Trace-class operators and trace norm

`trace_class`

Consume OperatorIdeals OI-B29–OI-B30, OI-B46–OI-B52 and OI-B83 for the trace-class carrier and gauge. Construct the basis-independent complex operator trace and the displayed trace API here.

A bounded operator A on a separable Hilbert space is trace class iff its singular values are summable, equivalently A=BC for two Hilbert–Schmidt operators. Define ‖A‖₁=Σs_j(A) and tr A=Σ⟪e_j,Ae_j⟫. The diagonal series is absolutely convergent and basis independent, |tr A|≤‖A‖₁, and tr(AD)=tr(DA) for bounded D. Trace norm convergence permits passage through trace, unlike strong convergence alone.

Assume: Trace is operator trace, with the first inner-product slot conjugated.

API:

- `trace_basis`: tr A=Σ_j⟪e_j,Ae_j⟫ with absolute convergence for any basis.
- `mul_hs`: BC is trace class and ‖BC‖₁≤‖B‖HS‖C‖HS.
- `trace_cyclic`: For trace-class A and bounded D, tr(AD)=tr(DA).
- `trace_continuous`: |tr(A−B)|≤‖A−B‖₁.

Tests:

- `rank_one_trace`: tr(v↦⟪u,v⟫w)=⟪u,w⟫.
- `diagonal_harmonic`: The bounded diagonal operator with basis coefficients 1/(n+1) is Hilbert–Schmidt and has no trace-class representative.
- `projection_trace`: An orthogonal projection of rank r has trace and trace norm r.

Source: S2, §6.2 Theorems 6.6–6.7; §6.3 Lemma 6.13, Corollary 6.14 and Lemmas 6.15–6.16, printed pp.136–144.

Uses: AS.0.9; B22; B24.

### AS.0.11 — Diagonal trace under a factorization hypothesis

`kernel_trace_diagonal`

Let X be σ-finite and K₁,K₂∈L²(X×X). The trace-class product T₁T₂ has trace ∫_{X×X}K₁(x,y)K₂(y,x)dμ(x)dμ(y). If specified representatives give K(x,z)=∫K₁(x,y)K₂(y,z)dμ(y) at every diagonal point almost everywhere, with that diagonal measurable, then tr(T₁T₂)=∫K(x,x)dμ(x). A bare equivalence class K∈L²(X×X) does not define K(x,x); continuity or the displayed factorization must fix the representative.

Assume: Fubini is applied to the absolutely integrable product, bounded by ‖K₁‖₂‖K₂‖₂.

Source: S2, §6.3 kernel expansion (6.10)–(6.12) and Lemma 6.15.

Uses: AS.0.9; AS.0.10; B2.

### AS.0.12 — Nuclear Fréchet and LF test spaces

`nuclear_lf_space`

For Hausdorff locally convex complex E, define Fréchet by completeness and a countable seminorm topology. Nuclear maps admit Banach factorizations Σ_jλ_jℓ_j⊗v_j with Σ_j|λ_j|<∞ and bounded functionals/vectors; nuclear spaces require these factorizations for strengthened seminorm quotient maps. A strict LF space is a countable inductive limit of Fréchet spaces with closed topological embeddings. Fixed-level, fixed-compact-support smooth adelic functions are nuclear Fréchet, and their support/level limit is the nuclear LF space 𝓓(G(𝔸)). Quasi-completeness means completeness of every closed bounded subset.

Assume: A countable exhaustion and a second-countable finite-dimensional real Lie group are fixed; nonarchimedean test functions are locally constant.

API:

- `supportLevelPiece`: Compact support and finite level define a nuclear Fréchet subspace with seminorms sup‖D f‖.
- `inclusion`: Increasing support and lowering finite level give continuous closed embeddings and their induced LF maps.
- `bounded_stage`: A bounded set in the strict LF test space is contained and bounded in one Fréchet stage.
- `distributionDual`: Continuous complex-linear functionals form the strong and weak distribution duals with their named topologies.

Tests:

- `finite_group`: The constant finite-group function stages induce exactly the usual finite-dimensional topology on their function space.
- `real_line`: For real smooth compactly supported tests, the support-stage construction agrees with Mathlib TestFunction topology, and each fixed-support stage embeds as a closed subspace.
- `escaping_support`: The translates by n of a fixed nonzero real test function are not von Neumann bounded in the actual LF topology; failure of a common support alone is not the conclusion.

Source: S26, Appendix A.0.1, A.0.5 and A.0.6; PDF page 145.

Uses: `AF.0/smooth-adelic-function`; B6; B25; B26.

### AS.0.13 — Quasi-complete vector integration and summation

`locally_convex_integration`

For a quasi-complete Hausdorff locally convex E and a continuous E-valued map on a σ-compact locally compact Radon space, integrability of every continuous seminorm gives a unique vector integral characterized by all continuous linear functionals. Absolutely seminorm-summable families admit unordered sums and continuous linear maps commute with both constructions. A nuclear continuous map carries summable families to absolutely summable families. Bochner integrals in complete normed spaces agree with this integral.

Assume: Every seminorm integral is finite; summable and absolutely summable are different hypotheses.

Source: S26, Appendix A.0.2 and Lemmas A.0.6.1–A.0.6.2; PDF page 145.

Uses: AS.0.12; B3; B2.

### AS.0.14 — Completed projective tensor products

`projective_tensor`

For Hausdorff locally convex E,F, the completed projective tensor product E⊗̂πF is the Hausdorff completion for the largest locally convex topology making the canonical bilinear map continuous. Continuous bilinear maps to a complete target correspond uniquely to continuous linear maps from E⊗̂πF. For complete nuclear spaces, the associated kernel descriptions and absolutely summable decompositions have the topology and completeness assumptions of BPCZ A.0.7; no purely algebraic tensor product is substituted.

Assume: The completion and separated quotient are explicit; the universal target is complete.

API:

- `tensor`: The canonical continuous bilinear map sends (e,f) to e⊗f.
- `lift`: Each continuous bilinear b:E×F→H, H complete, has a unique continuous linear extension.
- `map_comp`: Continuous maps on both factors induce tensor maps respecting identity and composition.

Tests:

- `scalar_unit`: ℂ⊗̂πE≅E for complete E, by z⊗e↦ze.
- `finite_matrix`: ℂᵐ⊗̂πℂⁿ≅ℂ^(m×n).
- `zero`: If either factor is zero, the completed product is zero.

Source: S26, Appendix A.0.7; PDF page 148.

Uses: AS.0.12; AS.0.13.

### AS.0.15 — Vector-valued Schwartz spaces

`vector_schwartz`

For finite-dimensional real V and quasi-complete locally convex E, define 𝓢(V,E) by smoothness and finiteness of sup_v(1+‖v‖)^N p(Df(v)) for every N, constant-coefficient differential operator D and continuous seminorm p; these define its topology. For complete nuclear E, identify it with 𝓢(V)⊗̂πE under the completeness hypotheses of A.0.9. The normed-target and continuous-postcomposition cases consume Mathlib's SchwartzMap.

Assume: V finite dimensional; E Hausdorff quasi-complete; tensor identification assumes the stronger stated completeness/nuclearity.

API:

- `tensor_apply`: (φ⊗e)(v)=φ(v)e.
- `map`: A continuous linear map E→F acts pointwise continuously on Schwartz spaces.
- `fourier`: The vector Fourier transform commutes with continuous scalar functionals and is a continuous automorphism with the dual Haar normalization.

Tests:

- `scalar`: For E=ℂ this agrees with Mathlib SchwartzMap.
- `gaussian_tensor`: The transform of e^(−π‖v‖²)e is the same Gaussian times e for self-dual Euclidean measure.
- `constant`: A nonzero constant E-valued map on ℝ is not Schwartz.

Source: S26, Appendix A.0.8–A.0.9, Lemma A.0.9.1; PDF page 149.

Uses: AS.0.14; AS.0.13; B19; B20.

### AS.0.16 — Weak and strong meromorphic operator families

`operator_meromorphic`

On a finite-dimensional complex parameter domain U, a continuous-operator family A:E→F is strongly meromorphic with locally finite polar hyperplanes if locally a finite product q of defining linear forms makes qA holomorphic for the topology of uniform convergence on bounded sets. Weak meromorphy tests ℓ(A(z)e), but its equivalence to strong meromorphy requires one common local denominator, barrelled E, quasi-complete F, and locally bounded regularized maps. Laurent coefficients along a transverse coordinate are continuous operators; finite-rank polar parts are an additional conclusion, not part of the definition.

Assume: One common denominator and the specified bounded-set topology are essential.

API:

- `regularize`: Strong meromorphy is equivalent to a local common scalar denominator giving bounded-set holomorphy.
- `coefficient`: A transverse Laurent coefficient is obtained by a continuous vector Cauchy integral.
- `compose`: Continuous fixed pre- and post-composition commute with regularization and Laurent coefficients.

Tests:

- `scalar_pole`: For A(z)=z⁻¹id, the residue at 0 is id and is infinite rank when E is infinite dimensional.
- `removable`: A holomorphic family has zero negative Laurent coefficients.
- `pointwise_orders`: For the direct-sum family with nth coordinate z^(−n), every finitely supported vector has a local denominator, but no common exponent and radius regularize all basis vectors.

Source: S26, Appendix A.0.3–A.0.5 holomorphy; Arthur 2005 §7 motivates meromorphic extension; PDF page 146.

Uses: AS.0.12; AS.0.13; B6.

### AS.0.17 — Analytic Fredholm continuation

`analytic_fredholm`

For a norm-holomorphic compact-operator family K(z) on a connected open subset of ℂ, either 1−K(z) is nowhere invertible, or its inverse is norm-meromorphic with discrete poles and finite-rank principal parts. At one invertible point the second alternative holds globally; its inverse agrees with the ordinary bounded inverse away from poles. This one-variable theorem does not by itself supply several-variable hyperplane geometry of Eisenstein singularities.

Assume: Banach-space norm holomorphy; compact K(z); a known invertible point when claiming continuation.

Source: S2, §6.2 Fredholm alternative and analytic perturbation motivation; PDF page 148.

Uses: AS.0.16; B23.

### AS.0.18 — Distributional and dominated spectral interchanges

`distribution_convergence`

For the continuous dual of the LF test space, weak distributional convergence means convergence on every fixed test function; strong convergence means uniform convergence on every bounded test set. A uniformly seminorm-dominated family of kernels or spectral integrals admits sum–integral interchange, differentiation and distributional passage to a limit using the cited Mathlib integrability theorems and locally convex integration. Strong convergence follows only when the estimates are uniform on bounded test sets; pointwise convergence alone is insufficient.

Assume: The majorant is integrable and uniform in the asserted parameter neighborhood and test set.

Source: S26, Appendix A.0.2–A.0.5; PDF page 146.

Uses: AS.0.12; AS.0.13; B2; B3; B4.

### AS.0.19 — Vector Phragmén–Lindelöf principle

`vector_phragmen_lindelof`

Let V be a Hausdorff quasi-complete complex locally convex space and C>0. Let Z_±: {Re s>C}→V be holomorphic of finite order in vertical strips. Let H⊂V′ be total (its common kernel is zero). Suppose every ℓ∘Z_±, ℓ∈H, extends to an entire scalar function of finite order in vertical strips and satisfies ℓZ_+(s)=ℓZ_−(−s). Then uniquely Z_± extend to entire V-valued functions of finite order in vertical strips, satisfying Z_+(s)=Z_−(−s). Order≤d means that for every d′>d, exp(−|s|^(d′))Z(s) is bounded in each closed vertical strip of the domain. Finite order is not a polynomial bound.

Assume: V is quasi-complete and Hausdorff; C>0; one finite order for each initial vector family; H is a linear total subspace of the continuous dual. Scalar entire continuation, finite strip order and the reflected functional equation hold for every ℓ∈H.

Source: S26, Appendix A.0.8 definition; Lemma A.0.10.1, printed p.332.

Uses: AS.0.13; AS.0.16.

### AS.0.20 — Cycle coordinates for the spectral character cover

`yu_145`

Let w permute equal-rank blocks of M. Index its nonempty cycles by j, with length l_j≥1 and common block rank d_j≥1; N_j=l_j*d_j and n=ΣN_j. In unit-circle coordinates z_(j,t), define T by ∏_(j,t)z_(j,t)^d_j=1; A consists of cycle-constant u_j with ∏u_j^N_j=1; B satisfies ∏_t v_(j,t)^d_j=1 separately for each j, and B0 satisfies ∏_t v_(j,t)=1 separately. Embed A and B in T. These are respectively Im X_M^G, Im X_L^G, Im X_M^L and its identity component, L=L_w.

Assume: Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

API:

- `cycleTori`: Construct closed subgroups T,A,B,B0 of finite products of Circle from positive integral cycle/rank data.
- `componentProduct`: The map B→∏_j μ_(d_j), v↦(∏_t v_(j,t))_j is onto with connected kernel B0.
- `embedCentral`: A embeds by repeating u_j in its l_j coordinates, and its intersection with B0 is ∏_j μ_(l_j).

Tests:

- `test1`: For one cycle l=2,d=1: A=μ₂, B=B0={(z,z⁻¹)}.
- `test2`: For one cycle l=1,d=2: B=μ₂ while B0={1}; replacing B by its identity component loses two points.
- `test3`: For w=1, every l_j=1, A=T and B=∏_j μ_(d_j), with B0={1}.

Source: S19, §§5.2.2–5.2.3 pp32–36.

Uses: AS.1.11; AS.6.23; AS.6.24; B2.

### AS.0.21 — Difference map on every Weyl cycle

`yu_146`

For the groups in145, δ_w:B→B0, v↦v/w⁻¹(v), is surjective, with kernel ∏_j μ_(N_j). Every fibre has ∏_j N_j points, even when B is disconnected.

Assume: Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

Source: S19, §§5.2.2–5.2.3 pp32–36.

Uses: AS.0.20; B2.

### AS.0.22 — Degree and fibres of the spectral cover

`yu_147`

The continuous homomorphism mu_w:A×B→T, (a,c)↦a*δ_w(c), is onto with |ker mu_w|=D=(∏l_j)(∏N_j)=|w|*|X_L^L|. For any tau∈T its fibre consists of the finite pairs a∈A, b∈B0 with tau=a*b, followed by c∈B with δ_w(c)=b. There are ∏l_j outer pairs and ∏N_j inner lifts.

Assume: Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

Source: S19, §§5.2.2–5.2.3 pp32–36.

Uses: AS.0.20; AS.0.21; B2.

### AS.0.23 — Normalized transfer along a finite compact-group cover

`yu_148`

For a continuous surjective homomorphism p:H→K of compact abelian Lie groups with finite kernel F of size D>0, define Tr_p f(y)=D⁻¹Σ_(p(x)=y) f(x). For continuous f this is continuous, and for smooth f it is smooth. Every group carries probability Haar.

Assume: Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

API:

- `transfer`: Use any lift x of y and average f(x*k) over k∈ker p; prove lift independence.
- `integralTransfer`: For continuous f, ∫_K Tr_p f=∫_H f, by kernel averaging, Haar invariance and142.
- `pullbackTransfer`: For continuous g on K, Tr_p(g∘p)=g; for a character χ of H the transfer vanishes unless χ is trivial on ker p, in which case it is the descended character.

Tests:

- `test1`: Tr_id f=f and Tr_p 1=1 for every nonempty finite fibre.
- `test2`: For the circle square-cover, normalized transfer of z² is the target coordinate and transfer of z is zero.
- `test3`: For the same degree-two cover the normalized transfer of one is one, whereas the unnormalized kernel sum is two.

Source: S19, §§5.2.2–5.2.3 pp32–36.

Uses: B2; B13; B14; B15.

### AS.0.24 — Pointwise character inversion gives the fibre average

`yu_149`

For p:H→K as in148 and smooth complex f on H, at every y∈K the absolutely convergent character sum Σ_(χ∈Khat) ∫_H χ(p(x)/y)*f(x) dx equals Tr_p f(y). Equivalently the coefficient indexed by χ is the (χ⁻¹)-Fourier coefficient of Tr_p f. Apply p=mu_w and y=lambda_pi to obtain (5.2.12) with factor D⁻¹.

Assume: Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

Source: S19, §5.2.3, equation (5.2.12), printed p.35; compact smooth Fourier argument via §§5.2.1–5.2.3, pp.32–36.

Uses: AS.0.22; AS.0.23; AS.0.25; B2; B13; B14; B15; B27.

### AS.0.25 — Smooth Fourier decay on the character groups in the trace formula

`yu_150`

On a finite product of Circle and a finite abelian group, a smooth complex function has absolutely summable Fourier coefficients. For torus dimension d and integer s with 2s>d, |fhat(k)|≤C(1+4π²||k||²)^(-s). The statement includes dimension zero and is uniform in a compact auxiliary parameter when the corresponding derivatives are uniformly bounded.

Assume: Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

Source: S19, §5.2.3, equation (5.2.12), printed p.35; smooth Fourier justification.

Uses: B2; B13; B14; B15.

### AS.0.26 — Whittaker M and W functions

`dit_112`

For y>0 put M_{μ,ν}(y)=Γ(1+2ν)e^(−y/2)y^(ν+1/2) regularized ₁F₁(ν−μ+1/2;1+2ν;y). Initially when Re(ν±μ+1/2)>0 this equals y^(ν+1/2)e^(y/2)Γ(1+2ν)/[Γ(ν+μ+1/2)Γ(ν−μ+1/2)] ∫₀¹ t^(ν+μ−1/2)(1−t)^(ν−μ−1/2)e^(−yt)dt. Define W by y^(ν+1/2)e^(y/2)/Γ(ν−μ+1/2) ∫₁∞t^(ν+μ−1/2)(t−1)^(ν−μ−1/2)e^(−yt)dt in that region, then continue. The M series in the statement is entire in y after stripping the y power and meromorphic in ν; W has decaying normalization.

Assume: y>0; initial Euler-integral assumptions Re(ν±μ+1/2)>0; continuation excludes uncompensated gamma poles.

API:

- `eulerIntegral`: For y>0 and Re(ν±μ+1/2)>0, the series-defined M agrees with its displayed Euler integral; W is defined by the convergent tail integral in this region and continued separately.
- `hypergeometricSeries`: For Re(s)>0, M_{μ,s−1/2}(y)=e^(−y/2)y^s Γ(2s)·regularized ₁F₁(s−μ;2s;y), using Mathlib Complex.regularizedHGFun with singleton numerator and denominator multisets.
- `decayingNormalization`: At positive infinity, W has leading term y^μ exp(−y/2), fixing its scale.

Tests:

- `test1`: M_{0,1/2}(y)=2 sinh(y/2).
- `test2`: At μ=1, ν=1/2 and y>0, M_{1,1/2}(y)=y e^(−y/2), so the growing-asymptotic coefficient vanishes.
- `test3`: For t>0, M_{0,1/2}(2t sin(π/2))=2 sinh(t); replacing the argument by t sin(π/2) gives the wrong value.

Source: S22, DIT11 Appendix A, (A.1)–(A.2), p. 977; DIT16 §5, p. 961; the series for M_{μ,s−1/2} is the display on DIT16 p. 984.

Uses: B7; B8; B9.

### AS.0.27 — Whittaker–Bessel comparison

`dit_113`

For y>0 and Re(ν+1/2)>0, I_ν(y)=2^(−2ν−1/2)Γ(ν+1)⁻¹y^(−1/2)M_{0,ν}(2y) and K_ν(y)=√(π/(2y))W_{0,ν}(2y). Beyond this initial integral range, use continued W and exceptional-parameter limits; a divergent totalized integral is not W. Reconcile every factor2√y in weight-zero expansions.

Source: S22, DIT11 Appendix A, (A.1)–(A.2) and the Bessel comparisons, p.977.

Uses: B7; B8; B9; rank-one special-function input contract; AL.0/bessel-k; I-Bessel rank-one definition; AS.0.26.

### AS.0.28 — Whittaker differential and asymptotic API

`dit_114`

W and M satisfy w″+(−1/4+μ/y+(1/4−ν²)/y²)w=0. For Re(s)>0, M_{μ,s−1/2}(y)=y^s(1+O(y)) near0. Away from exceptional parameters its large-y growing term and the decaying W asymptotic have the gamma constants in DIT11 (A.4). Uniform derivative bounds are needed before differentiation under integrals. More explicitly, W_{μ,ν}~y^μe^(−y/2), M_{μ,ν}~Γ(1+2ν)/Γ(ν−μ+1/2)y^(−μ)e^(y/2) in the initial Euler-integral region, continued only where the growing coefficient is nonzero.

Source: S22, DIT11 Appendix A, (A.3)–(A.5), printed p.977.

Uses: B7; B8; B9; AS.0.26.

### AS.0.29 — Correct sine-power integral

`dit_115`

For Re(ν)>0 and complex β, ∫_0^π e^{iβθ}sin^(ν−1)θ dθ=πe^{iπβ/2}Γ(ν)/(2^(ν−1)Γ((ν+β+1)/2)Γ((ν−β+1)/2)), interpreted via reciprocal gamma. The factor2^(ν−1) is missing in the displayed source formula on p984.

Source: S21, AppendixA, p984; [23]3.892(1).

Uses: AS.0.26; B5; B10; J-Bessel rank-one definition; AS.0.27.

### AS.0.30 — New Whittaker cycle integral

`dit_118`

For μ∈C,t>0,Re(s)>0, ∫_0^π exp(±i(t cosθ+μθ))M_{μ,s−1/2}(2t sinθ)dθ/sinθ = exp(±iπμ/2)(2π)^(3/2)2^(−s)Γ(2s)[Γ((s+1+μ)/2)Γ((s+1−μ)/2)]⁻¹ t^(1/2)J_{s−1/2}(t). Establish the ODE by integration by parts and its t^s leading coefficient using115, then117.

Source: S21, Lemma 7, display (9.4), p. 980 (statement); restated as (A.1), Appendix A, p. 983; proof Appendix A, pp. 983–985.

Uses: AS.0.26; B5; B10; J-Bessel rank-one definition.

### AS.0.31 — Endpoint-justified integration by parts for both signs

`dit_165`

Let H_ε(t)=t^(−s)∫₀^π exp(εi(t cosθ+μθ))M_{μ,s−1/2}(2t sinθ)dθ/sinθ, μ∈ℂ, Re(s)>0, t>0, ε=±1. Then f_ε=t^sH_ε satisfies f_ε″+(1−s(s−1)/t²)f_ε=0. On every compact parameter set with Re(s)≥σ>0 the integrands and their first two t derivatives are bounded by C sin^(σ−1)θ; the integration-by-parts endpoint terms are O(δ^σ). The calculation works for both signs without complex conjugation.

Source: S21, Appendix A, proof of (A.1), p.984: Whittaker angular integration by parts and the differential equation for the angular integral, with vanishing endpoint terms..

Uses: AS.0.26; B5; B10.

### AS.0.32 — Series expansion (A.2) of the Whittaker cycle integral

`dit_appendix_a2_series_of_whittaker_cycle_integral`

For μ ∈ ℂ, Re(s) > 0 and t > 0, ∫_0^π e^{i(t cos θ+μθ)} M_{μ,s−1/2}(2t sin θ) dθ/sin θ = 2π e(μ/4) Γ(2s) Σ_{ℓ≥0} Σ_{m+n=ℓ} (−1)^m (s−μ)_n Γ(s+n) / ( m! n! Γ(2s+n) Γ((n+s+m+μ+1)/2) Γ((n+s−m−μ+1)/2) ) · t^{s+ℓ}. The double series converges absolutely for every t, and the reciprocal gammas are entire. The paper writes (s−μ)_n as Γ(s−μ+n)/Γ(s−μ), so the printed prefactor is 2π e(μ/4)Γ(2s)/Γ(s−μ).

Source: S21, Appendix A, (A.2), p. 985 (derivation p. 984).

Uses: AS.0.26; B5; B10.

### AS.0.33 — Series expansion (A.3) of G(s,μ) t^{1/2} J_{s−1/2}(t)

`dit_appendix_a3_series_of_rhs`

For μ ∈ ℂ, Re(s) > 0, t > 0: G(s,μ) t^{1/2} J_{s−1/2}(t) = π^{3/2} e(μ/4) 2^{2−2s} Γ(2s) / (Γ((s+1+μ)/2) Γ((s+1−μ)/2)) · Σ_{r≥0} (−1)^r 2^{−2r} / (r! Γ(s+1/2+r)) · t^{s+2r}, where G(s,μ) = e(μ/4)(2π)^{3/2}2^{−s}Γ(2s)/(Γ((s+1+μ)/2)Γ((s+1−μ)/2)).

Source: S21, Appendix A, (A.3), p. 985.

Uses: AS.0.26; B5; B10; J-Bessel rank-one definition.

### AS.0.34 — Agreement of the first coefficients of (A.2) and (A.3)

`dit_appendix_a_leading_coefficient_match`

The t^s coefficients in (A.2) and (A.3) both equal 2π e(μ/4)Γ(s)/(Γ((s+1+μ)/2)Γ((s+1−μ)/2)). In (A.2) the t^(s+1) coefficient vanishes by cancellation of (m,n)=(1,0),(0,1), using ((s−μ)/2)/Γ((s−μ)/2+1)=1/Γ((s−μ)/2). The t^(s+2) coefficients also agree. The shared ODE and Frobenius uniqueness from c₀ imply (A.1).

Source: S21, Appendix A, p. 985 (last paragraph of the proof).

Uses: AS.0.26; B5; B10.

### AS.0.35 — Legendre function of the second kind Q_{s−1} (2.5), (2.6)

`gz_64`

For t>1 and complex s with Re(s)>0, define Q_{s−1}(t)=∫₀∞(t+√(t²−1)cosh u)^(−s)du with the positive real base. It equals Γ(s)²/[2Γ(2s)](2/(1+t))^s ₂F₁(s,s;2s;2/(1+t)), satisfies ((1−t²)Q′)′+s(s−1)Q=0, and for integer s=k≥1 equals the Q_{k−1} of GZ IV(5.7). In particular Q₀(t)=½log((t+1)/(t−1)) and Q₁(t)=tQ₀(t)−1.

API:

- `integral`: Use the positive-base convergent integral for Re(s)>0.
- `hypergeometric`: Compare with the displayed ₂F₁ formula on its open-disc argument.
- `integer_specialization`: The integer k case is the same Q_{k−1}, with Q₀,Q₁ as stated.

Tests:

- `q_zero`: At s=1, Q₀(3)=½log2.
- `q_one`: At s=2, Q₁(3)=3/2 log2−1.
- `boundary`: t=1 has a logarithmic singularity and is excluded from the ordinary pointwise definition.

Source: S29, Chapter II, §2, (2.5), (2.6), p. 238.

Uses: B7; B9; B5.

### AS.0.36 — Asymptotics of Q_{s−1} (2.7), (2.8)

`gz_65`

Q_{s−1}(t) = −½ log(t − 1) + O(1) as t ↘ 1 (2.7), and Q_{s−1}(t) = O(t^{−s}) as t → ∞ (2.8) (s > 1 fixed).

Source: S29, Chapter II, §2, (2.7), (2.8), p. 238.

Uses: B7; B9; B5; AS.0.35.

### AS.0.37 — Point-pair invariants g and g_s (2.4), (2.9)

`gz_66`

g(z, z′) = log(|z − z′|²/|z̄ − z′|²) satisfies a′) g(γz, γz′) = g(z, z′) for γ ∈ PSL₂(ℝ); b′) continuous and harmonic in each variable on 𝔥 × 𝔥 ∖ diagonal; c′) g = log|z − z′|² + O(1) as z′ → z; but Σ_{γ ∈ Γ₀(N)} g(z, γz′) diverges (barely). For s > 1, g_s(z, z′) = −2Q_{s−1}(1 + |z − z′|²/(2yy′)) (z ≠ z′) (2.9) satisfies a′), c′) (by (2.7)) and Δg_s = s(s−1)g_s in each variable; g₁ = g. The positive spectral Laplacian convention of DIT is −Δ_GZ, so its eigenvalue here is s(1−s).

API:

- `invariant`: Simultaneous PSL₂(ℝ) action preserves g_s.
- `s_one`: At s=1, −2Q₀(cosh dist)=log(|z−z′|²/|z−bar z′|²).
- `laplace`: Off the diagonal, Δ_GZ g_s=s(s−1)g_s in either variable.

Tests:

- `symmetry`: g_s(z,z′)=g_s(z′,z).
- `singularity`: The diagonal value is not a finite smooth kernel.
- `bare_sum`: The Γ₀(N) sum at s=1 diverges; subtract the pole before taking the finite part.

Source: S29, Chapter II, §2, (2.4), (2.9), pp. 238–239.

Uses: AS.0.35; B16; B17.

### AS.0.38 — Asymptotics of the Legendre function Q_{s−1}(t) as t ↘ 1

`gz_108`

For the Legendre function of the second kind Q_{s−1} (s > 1, s near 1) as t ↘ 1: Q_{s−1}(t) = ½ log((t + 1)/(t − 1)) − (Γ′/Γ(s) − Γ′/Γ(1)) + o(1).

Source: S29, Chapter II, §5, display after (5.7), p. 251.

Uses: B7; B9; B5; AS.0.35.

### AS.0.39 — The archimedean integral V_s(t)

`gz_207`

Fix k ≥ 1. For s ∈ ℂ with Re(s) > 1−k and t ∈ ℝ: V_s(t) = ∫_{−∞}^{∞} e^{−2πixt} dx / ((x+i)^{2k−1}(x²+1)^s). This is the Fourier transform of x ↦ (x+i)^{−(2k−1)}(x²+1)^{−s}, which is absolutely integrable exactly when Re(s) > 1−k.

API:

- `fourier_integral`: V_s is the explicit Lebesgue Fourier integral in Re(s)>1−k.
- `integrable_iff`: The seed norm is integrable exactly for Re(s)>1−k.
- `parameter_derivative`: Differentiate in a compact sub-half-plane using the logarithmic majorant.

Tests:

- `k_one`: At k=1, the initial absolutely integrable domain is Re(s)>0.
- `threshold`: At Re(s)=1−k the seed norm decays like |x|⁻¹ and is not integrable.
- `zero_frequency`: t=0 equals the gamma formula in AS.0/gz-212.

Source: S29, Chapter IV, (3.2) Proposition, p. 277.

Uses: B9; B5.

### AS.0.40 — Proposition (3.3a): the value V_s(0)

`gz_212`

For k ≥ 1: V_s(0) = (−1)^k π i 2^{−2s−2k+3} Γ(2s+2k−2)/(Γ(s)Γ(s+2k−1)). This holds for Re(s) > 1−k and gives the meromorphic continuation of V_s(0) in s.

Source: S29, Chapter IV, §3, (3.3) Proposition a), p. 277; proofs pp. 279–280.

Uses: B9; B5; AS.0.39.

### AS.0.41 — Proposition (3.3b): holomorphy of V_s(t) in s and exponential decay in t

`gz_213`

For t ≠ 0 the function s ↦ V_s(t) continues holomorphically to all s ∈ ℂ and satisfies, locally uniformly in s, V_s(t) = |t|^{O(1)} e^{−2π|t|} as |t| → ∞.

Source: S29, Chapter IV, §3, (3.3) Proposition b), p. 277; proof pp. 280–281.

Uses: B9; B5; AS.0.39; AS.0.26.

### AS.0.42 — Proposition (3.3c): V*_s(t) is entire and satisfies V*_s(t) = sign(t) V*_{2−2k−s}(t)

`gz_214`

For t ≠ 0 set V*_s(t) = (π|t|)^{−s−2k+1} Γ(s+2k−1) V_s(t). At Gamma poles the product means its removable holomorphic extension, rather than multiplication of totalized pointwise Gamma values. Then V*_s(t) is entire in s and V*_s(t) = sign(t) V*_{2−2k−s}(t). For t > 0 this comes from V*_s(t) = ∫_0^∞ u^{s+k−1} e^{−πt(u+1/u)} ∫_{−∞}^{∞} e^{−πtv²} (v + (u^{1/2}+u^{−1/2})/i)^{2k−1} dv du/u.

Source: S29, Chapter IV, §3, (3.3) Proposition c), p. 278; proof p. 280.

Uses: B9; B5; AS.0.39; AS.0.26.

### AS.0.43 — Proposition (3.3d): V_{−r}(t) for integers 0 ≤ r ≤ k−1

`gz_215`

Let r ∈ ℤ with 0 ≤ r ≤ k−1. Then V_{−r}(t) = 0 for t < 0 and V_{−r}(t) = 2πi(−1)^{k−r} p_{k,r}(4πt) e^{−2πt} for t > 0, where p_{k,r}(t) = (t/2)^{2k−2−2r} Σ_{j=0}^{r} C(r, j) (−t)^j/(2k−2r−2+j)! (a polynomial). Here V_{−r}(t) = ∫ (x−i)^r (x+i)^{−(2k−1−r)} e^{−2πixt} dx, conditionally convergent for r = k−1.

Source: S29, Chapter IV, §3, (3.3) Proposition d), p. 278; proof p. 281.

Uses: B9; B5; AS.0.39.

### AS.0.44 — Proposition (3.3e): ∂_s V_s(t) at the centre s = 1−k for t < 0

`gz_216`

For t < 0: ∂/∂s V_s(t)|_{s=1−k} = −2πi q_{k−1}(4π|t|) e^{−2πt}, where q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1} x^{−k} e^{−xt} dx (t > 0).

Source: S29, Chapter IV, §3, (3.3) Proposition e), p. 278; proof p. 281.

Uses: B9; B5; AS.0.39.

### AS.0.45 — K-Bessel expression for V*_s(t), t > 0

`gz_217`

For t > 0: V*_s(t) = i Σ_{a,b,c≥0, 2a+b+c=2k−1} (−1)^{k−a}(2k−1)!/((2a)! b! c!) · Γ(a+½)/(πt)^{a+½} · ∫_0^∞ u^{s+k+(b−c)/2−2} e^{−πt(u+1/u)} du = (2(−1)^k i/t^{1/2}) Σ_{a,b,c≥0, 2a+b+c=2k−1} (2k−1)!/(a! b! c!) · (−1/(4πt))^a · K_{s+k−1+(b−c)/2}(2πt). For k = 1: V*_s(t) = (−2i/√t)(K_{1/2+s}(2πt) + K_{1/2−s}(2πt)). The functional equation (3.3c) for t > 0 follows from K_ν = K_{−ν} by interchanging b and c.

Source: S29, Chapter IV, §3, proof of (3.3), p. 280.

Uses: B9; B5; AS.0.39; AS.0.26; rank-one special-function input contract; AL.0/bessel-k.

### AS.0.46 — Entire continuation of Schwartz families

`schwartz_family_continuation`

Let A be finite-dimensional real and C>0. Two scalar families Z₊(a,s), Z₋(a,s) are entire of finite order in vertical strips at each a, satisfy Z₊(a,s)=Z₋(a,−s), and, on Re(s)>C, take values holomorphically in the usual Fréchet Schwartz space. On this initial half-plane each family has one finite strip-order exponent for every weighted derivative seminorm; constants may depend on the seminorm and the strip. There are unique entire Schwartz-valued continuations agreeing with those scalar values. They agree with the initial families, satisfy the reflected functional equation and have finite order in the full Schwartz topology on every vertical strip.

Assume: Finite-dimensional A with its usual Schwartz seminorm topology; both scalar and vector hypotheses of BPCZ Corollary A.0.11.1. A single initial order exponent controls all Schwartz seminorms, rather than only the sup norm of the values.

Source: S26, Corollary A.0.11.1, pp.332–333; PDF page 150.

Uses: AS.0.19; AS.0.15.

### AS.0.47 — Entire continuation of LF dual families

`lf_dual_continuation`

Let W be an LF space, H⊂W a dense linear subspace, and C>0. Suppose Z_±(s,·) are continuous functionals for Re(s)>C, with each scalar Z_±(s,w) holomorphic of one common order≤d in vertical strips. On H they have entire scalar finite-order continuation with Z_+(s,h)=Z_−(−s,h). Then Z_± extend as entire W′-valued finite-order functions and their functional equation holds on every w∈W. Here W′ carries the weak topology of pointwise convergence, as fixed in BPCZ A.0.1; no strong-dual holomorphy is inferred from this citation.

Assume: W is LF; H is dense; d is common to all initial scalar evaluations.

Source: S26, Corollary A.0.11.2, p.333.

Uses: AS.0.19; AS.0.12; B6.

## AS.1 — Normalized induction and convergent Eisenstein families

### AS.1.1 — Normalized induced Hilbert families

`induced_family`

Fix P=MN and a discrete unitary representation σ of M(𝔸)¹, with its automorphic multiplicity space. H_P is the space of measurable functions on N(𝔸)M(F)A_M(ℝ)⁰\G(𝔸) whose m-slices lie in the σ-isotypic discrete space and with ∫_K∫_[M]¹|φ(mk)|²dm dk finite. I_P(λ,g)φ(x)=φ(xg)exp((λ+ρ_P)(H_P(xg)−H_P(x))). The carrier is independent of λ. H_P⁰ consists of smooth, finite-level, K-finite vectors lying in a finite sum of inducing irreducible spaces. A holomorphic section is a holomorphic map to a fixed finite-dimensional subspace of H_P⁰; its flat sections are constant in this compact picture.

Assume: F is a number field; G is connected reductive; compatible Iwasawa measures have vol K=vol(N(F)\N(𝔸))=1; work on G(𝔸)¹ or quotient A_G(ℝ)⁰ throughout.

API:

- `action_comp`: I_P(λ,gh)=I_P(λ,g)I_P(λ,h).
- `unitary_axis`: For λ imaginary, I_P(λ,g) is unitary.
- `flat_section`: A fixed φ∈H_P⁰ gives an entire flat section λ↦φ; evaluation and right translation are holomorphic.
- `local_tensor`: For factorizable σ and section, I_P(σ,λ) is the restricted tensor product of the local normalized inductions.

Tests:

- `whole_group`: For P=G on G(𝔸)¹, ρ_P=H_P=0 and I_P is right translation on the discrete inducing space.
- `rank_one_half_modulus`: The GL₂ open-cell torus model acts by r^(s+1/2)f(rx), and preserves the L² norm for purely imaginary s.
- `unnormalized_not_unitary`: Dropping the half-modulus in the same dilation model, at r=4 a nonzero vector has half its original norm.

Source: S3, §7 pp.32–34.

Uses: `AA.2/log-height`; `AA.2/modulus-character`; `AA.2/automorphic-quotient-measure`; `AF.3/cuspidal-automorphic-representation`; AS.0.2.

### AS.1.2 — Eisenstein series in the convergence chamber

`eisenstein_series`

For φ∈H_P⁰ and Re λ−ρ_P in the open positive chamber, define E_P(g,φ,λ)=Σ_{δ∈P(F)\G(F)}φ(δg)exp((λ+ρ_P)H_P(δg)). The sum uses the full rational coset space, is independent of representatives, and is linear in φ. It defines an automorphic smooth function, with right equivariance E(g,I_P(λ,h)φ,λ)=E(gh,φ,λ). Parameter continuation is a separate AS.2 result.

Assume: Re(λ−ρ_P)(α∨)>0 for every simple root of P; φ is smooth K-finite finite-level discrete inducing data.

API:

- `linear`: E_P is complex linear in the inducing vector.
- `automorphic`: E_P(γg,φ,λ)=E_P(g,φ,λ) for γ∈G(F).
- `right_equivariant`: E(g,I_P(λ,h)φ,λ)=E(gh,φ,λ).

Tests:

- `whole_group`: For P=G, E_G(g,φ,0)=φ(g).
- `zero`: E(g,0,λ)=0.
- `sl2_positive`: For Γ=SL₂(ℤ), the spherical section gives Σ_{Γ∞\Γ}Im(γz)^s for Re s>1, with λ=s−1/2.

Source: S3, §7 equation (7.1) and Lemma 7.1, pp.32–35.

Uses: AS.1.1; `AA.3/siegel-covering-adelic`.

### AS.1.3 — Absolute and differentiated chamber convergence

`eisenstein_convergence`

On Re λ∈ρ_P+(𝔞_P*)⁺ the series defining E_P and the unipotent integrals defining M(w,λ) converge absolutely, locally uniformly for g in compact sets and λ in compact subsets of that chamber. They are holomorphic in λ. Every fixed right archimedean differential operator and finite-level translation can be applied termwise; resulting functions have moderate growth on Siegel sets uniformly on compact parameter subsets. For a finite-dimensional inducing space and fixed derivative, a finite power of the adelic height bounds the absolute majorant.

Assume: The inducing vectors are H_P⁰; local uniformity stays strictly inside the chamber; differentiated bounds are for a fixed finite family of derivatives.

Source: S3, §7 Lemma 7.1; §13 paragraph after Proposition 13.2, pp.32–35.

Uses: AS.1.1; `AA.3/height-siegel-estimate`; `AF.3/cuspidal-spectrum-discrete`; B4.

### AS.1.4 — Convergent Weyl intertwining integrals

`convergent_intertwiner`

For w∈W(𝔞_P,𝔞_Q), choose a rational representative ŵ. In the common compact picture M(w,λ)φ(x)=exp(−(wλ+ρ_Q)H_Q(x))∫_{(N_Q∩ŵN_Pŵ⁻¹)(𝔸)\N_Q(𝔸)}φ(ŵ⁻¹nx)exp((λ+ρ_P)H_P(ŵ⁻¹nx))dn. The chamber convergence theorem defines this on H_P⁰. Rational representatives and compatible quotient measures give the same map to H_Q; it intertwines I_P(λ) with I_Q(wλ). This object precedes both the constant-term and pseudo-Eisenstein inner-product formulas.

Assume: Re λ−ρ_P is positive; Haar measures and rational Weyl representatives are fixed compatibly.

API:

- `intertwines`: M(w,λ)I_P(λ,g)=I_Q(wλ,g)M(w,λ).
- `identity`: M(1,λ)=id for P=Q.
- `holomorphic_chamber`: Every compact-picture matrix coefficient is holomorphic in the chamber.

Tests:

- `identity_quotient`: The actual point-quotient integral returns the original vector.
- `sl2_spherical`: The convergent real spherical integral times its finite-prime Euler product gives ξ(2s−1)/ξ(2s) on the spherical eigenline.
- `target_parabolic`: The block-permutation slice transports inducing labels and parameter and permutes section coordinates in its integral; general induction requires the coherence interface.

Source: S3, §7 equation (7.2) and Lemma7.1, p.34.

Uses: AS.1.1; AS.1.3; `AA.2/quotient-measure-transitivity`; B30.

### AS.1.5 — Finite Weyl constant-term formula

`cuspidal_constant_term`

For cuspidal inducing φ∈H_P,cusp⁰, the N_Q constant term of E_P equals the sum over W(𝔞_P,𝔞_Q) of exp((wλ+ρ_Q)H_Q(g))(M(w,λ)φ)(g). When the Weyl set is empty the term is zero. For an arbitrary parabolic constant term, the general formula groups rational Bruhat cells by double cosets: each surviving summand is an Eisenstein series on M_Q induced from the appropriate constant term of φ, with its own Levi intertwiner. The displayed finite exponential formula is asserted only for associate Q and cuspidal data.

Assume: Initial equality is in absolute convergence; N_Q(F)\N_Q(𝔸) has volume one; the simple associate formula uses cuspidal data.

Source: S5, §3 Lemma 3 and following Bruhat computation.

Uses: AS.1.2; AS.1.4; `AF.3/constant-term`; `SR.2`.

### AS.1.6 — Paley–Wiener pseudo-Eisenstein series

`pseudo_eisenstein`

Fix cuspidal data (P,σ). Let Ψ:(𝔞_P^G)_ℂ*→H_P,cusp,σ⁰ be entire, valued in one finite-dimensional subspace, and the Fourier–Laplace transform of a smooth compactly supported function on 𝔞_P^G. Set ψ(g)=∫_{Λ+i(𝔞_P^G)*}exp((λ+ρ_P)H_P(g))Ψ(λ,g)dλ and Eψ(g)=Σ_{P(F)\G(F)}ψ(δg). Fourier inversion makes ψ compactly supported in the projected height H_P^G, so the result is independent of Λ. The dual measure satisfies ∫_{i(𝔞_P^G)*}∫_{𝔞_P^G} h(H)e^(−λ(H))dH dλ=h(0); no extra (2π)^rank factor is inserted. This is the fixed trivial A_G(ℝ)⁰-character version on G(F)\G(𝔸)¹ (equivalently the quotient by A_G(ℝ)⁰): λ vanishes on 𝔞_G and the inducing central action is compatible. Arthur Lemmas12.2–12.4 first use all of 𝔞_P and L²(G(F)\G(𝔸)); that full-height version is a separate construction and does not automatically descend to the central quotient.

Assume: The compact-picture coefficient space is fixed and finite dimensional; Ψ is Paley–Wiener, not merely an arbitrary entire function. Fix the trivial split-central character, parameters in (𝔞_P^G)_ℂ* and the matching central restriction of the inducing datum. In the full-height variant use 𝔞_P and the full arithmetic quotient instead.

API:

- `contour_independent`: The inverse-transform ψ is independent of the real shift Λ.
- `linear`: Ψ↦Eψ is complex linear.
- `eisenstein_integral`: For Λ with Λ−ρ_P in the open positive chamber (the absolute-convergence region of AS.1/eisenstein-convergence), Eψ(g)=∫_{Λ+i(𝔞_P^G)*} E_P(g,Ψ(λ),λ)dλ.

Tests:

- `zero`: The zero Paley–Wiener section gives zero.
- `split_torus`: For a split torus, P=G: the full-height construction is inverse Fourier–Laplace transformation on 𝔞_G, whereas the fixed-central-character construction has 𝔞_P^G=0.
- `wrong_entire_growth`: For V=ℂ, Ψ(z)=exp(z⁴) is entire but not Paley–Wiener and does not qualify for this construction. More generally exp(z⁴)v is excluded only when v≠0.

Source: S3, §12 preceding Lemma 12.2, pp.64–66.

Uses: AS.1.1; AS.1.2; AS.1.4; `AL.0`.

### AS.1.7 — Square-integrability of pseudo-Eisenstein series

`pseudo_eisenstein_l2`

For the fixed-central-character pseudo-Eisenstein series just defined, Eψ belongs to L²(G(F)\G(𝔸)¹), equivalently L²(G(F)\G(𝔸)/A_G(ℝ)⁰), using parameters and compact height support in 𝔞_P^G. If one instead uses the full 𝔞_P transform of Arthur Lemma12.2, the target is L²(G(F)\G(𝔸)); no descent through the split centre is asserted for an arbitrary full-height section. Both assertions concern finite-dimensional cuspidal Paley–Wiener sections, not an individual unitary-axis Eisenstein series.

Assume: Cuspidal inducing vectors; smooth compact height support before summation; compatible quotient measures. The split-central convention and height space agree with the preceding construction; the full-height and fixed-central variants are not identified.

Source: S3, §12 Lemma 12.2, pp.64–66.

Uses: AS.1.6; AS.1.4; B2.

### AS.1.8 — Langlands pseudo-Eisenstein inner product

`pseudo_eisenstein_inner_product`

With Mathlib’s conjugate-first inner product, ⟪Eψ′,Eψ⟫=∫_{Λ+i(𝔞_P^G)*}Σ_{w∈W(𝔞_P,𝔞_Q)}⟪Ψ′(−overline(wλ)),M(w,λ)Ψ(λ)⟫dλ, where Ψ is attached to (P,σ), Ψ′ to (Q,σ′), and Λ−ρ_P is positive. Only compatible inducing cuspidal isotypic spaces contribute. The conjugation in −overline(wλ) is essential: the second section is evaluated on the reflected real contour. On an imaginary contour after justified continuation this becomes wλ. Use the same fixed-central datum and quotient as pseudo-eisenstein. For the full-height version replace 𝔞_P^G by 𝔞_P and use the full arithmetic quotient on both sides.

Assume: Paley–Wiener sections of the preceding construction; the equality is first proved in the absolute-convergence chamber. Central restriction, contour dimension and both L² measures use the same variant; conjugation is retained in the reflected contour.

Source: S5, §4 Corollary formula (2).

Uses: AS.1.7; AS.1.5; B2.

### AS.1.9 — Cuspidal-data generated subspaces

`cuspidal_datum_space`

A cuspidal datum χ is a Weyl-associate class of (P,σ), with σ occurring in L²_cusp([M_P]¹), from AF.3. Let L²_χ be the closed G(𝔸)¹-invariant span of its pseudo-Eisenstein series. Association transports both σ and P; identifying parabolics alone loses spectral information.

Assume: The central quotient/G(𝔸)¹ convention is fixed; equivalence includes the representation.

API:

- `generator_mem`: Each Eψ attached to χ lies in L²_χ.
- `right_invariant`: Right translation preserves L²_χ.
- `associate_eq`: Weyl-associate pairs define the same subspace, with the representation transported by that Weyl element.

Tests:

- `whole_group_cusp`: For χ represented by (G,σ), L²_χ is the σ-isotypic cuspidal summand.
- `inequivalent_same_levi`: Distinct closed generated blocks remain distinct in the quotient by equality of cuspidal_datum_space; identifying this block relation with AF Weyl-associate cuspidal data is required.
- `zero_generators`: The closed span of the zero generator set is the zero subspace.

Source: S3, §12 Lemma 12.4 and its definition, pp.64–66.

Uses: AS.1.7; `AF.3/cuspidal-automorphic-representation`.

### AS.1.10 — Elementary orthogonal cuspidal-data decomposition

`cuspidal_data_orthosum`

The L²_χ form an orthogonal Hilbert sum equal to L²([G]¹), with dense finite sums. Orthogonality uses the convergent pseudo-Eisenstein inner-product formula; density uses parabolic-rank induction and constant-term Fourier inversion. This precedes continuation and Plancherel parametrization.

For generators Sχ, require `OrthogonalFamily` of closed spans and dense span of ⋃χ Sχ. `IsHilbertSum.mkInternal` gives H ≃ₗᵢ `lp (fun χ => cuspidal_datum_space (Sχ)) 2`; inverse single coordinates are inclusions; coordinate sums converge to their inverse image. Prove these inputs automorphically. Checks: repeated blocks fail orthogonality when nonzero; zero generators in ℂ fail density; one full block gives H.

Assume: All cuspidal associate classes χ occur; reductive Levis use the same quotient measures.

Source: S3, §12 Lemma 12.4, equation (12.4), pp.64–66.

Uses: AS.1.9; AS.1.8; `AF.3/constant-term-transitivity`; Mathlib `IsHilbertSum.mkInternal` (`l2Space`).

### AS.1.11 — Unramified character tori and central degree lattices

`yu_010`

For M=∏GL_ni let M(A)^0 be the simultaneous kernel of rational-character degrees, Xi_M the central lattice generated by a in each block, X_M=Hom(M(A)/M(A)^0,C*)≅(C*)^r and X_M^L the characters trivial on Z_L(A). The latter need not be connected; Im denotes its unitary subgroup.

API:

- `detCoordinates`: identify the unramified characters of a product Levi
- `trivialOnCenter`: construct X_M^L with its components
- `unitaryPart`: restrict to probability-Haar compact character tori

Tests:

- `test1`: For M=G=GL_n, X_G^G={z∈C*:z^n=1}.
- `test2`: For M=GL₂ and L=M, Im X_M^L=μ₂ has two points and is not connected.
- `test3`: For M=GL_a×GL_b in G=GL_(a+b), X_M^G is given by x^a y^b=1, rather than xy=1 unless a=b=1.

Source: S19, §2.2.3, p. 9 (M(A)^0, Ξ_M, X_M, X_M^L); unitary parts Im X in §4.

Uses: `AA.0/restricted-haar-product`.

### AS.1.12 — Induced spherical sections with a fixed normalization

`yu_060`

For each R∈P(M), fix the inducing character s_R explicitly. The spherical section space consists of phi on M(F)N_R(A)\G(A)/K with s_R⁻¹ phi|_M∈pi; its basis is s_R*phi_pi. Laf97 p284 and Yu p32 use s_R=rho_R (with P to be replaced by R in Yu); Yu p39 uses s_R=rho_R⁻¹. Use yu_153 to transport conventions and fix the choice matching the Rankin–Selberg normalizers.

API:

- `sphericalSection`: For specified s_R, extend phi_pi by phi_R(nmk)=s_R(m)phi_pi(m).
- `leviRestriction`: Recover phi_pi by multiplying the Levi restriction by s_R⁻¹.
- `parameterTwist`: transport along an unramified lambda

Tests:

- `test1`: For prescribed s_R, the Levi restriction of s_R*phi_pi multiplied by s_R⁻¹ equals phi_pi.
- `test2`: For R=G the modular character is1, so both displayed rho conventions give the same section.
- `test3`: Apply yu_060 to the constant vector one with ρ=2: the positive section gives two and the inverse section gives one half.

Source: S19, §5.2.2 and§5.3.2 pp32,39.

Uses: AS.4.11; AS.4.12; `AA.0/restricted-haar-product`; AS.1.1.

### AS.1.13 — Explicit transport between induction normalization conventions

`yu_153`

Fix positive inducing characters s_R on M(A). Define A_R,pi^s by s_R⁻¹*phi|_M∈pi and spherical basis phi_R(nmk)=s_R(m)*phi_pi(m). For a second convention t_R, C_R^(s→t) multiplies by t_R/s_R in Iwasawa coordinates. Transport each operator by M^t_(R′|R)=C_R′ M^s_(R′|R) C_R⁻¹. Yu p32 and Laf97 p284 use s_R=rho_R in their membership formula (Yu writes P); Yu p39 uses s_R=rho_R⁻¹. One cannot identify their numerical normalizers until this dictionary, including parameter conventions, is checked.

API:

- `normalizedSection`: From a fixed positive character s_R, extend a Levi spherical vector by multiplication by s_R; independence follows from its triviality on M∩K.
- `changeConvention`: C_R^(t→u)∘C_R^(s→t)=C_R^(s→u), and C_R^(s→s)=Id.
- `conjugateOperators`: Transport domains, intertwining identities and norms together; a closed composition on A_P is conjugated by C_P, hence has unchanged finite-dimensional trace.

Tests:

- `test1`: The actual section transport from ρ to ρ⁻¹ sends a value-two vector to one half when ρ=2.
- `test2`: Restricting s_R*phi_pi and multiplying by s_R⁻¹ recovers phi_pi exactly.
- `test3`: The squared norm of the transported section, integrated with the compensating factor |ρ|⁴, equals the original integrated squared norm.

Source: S19, §§5.2.2–5.2.3 pp32–36.

Uses: AS.1.12; AS.2.14; `AA.0/restricted-haar-product`; AS.1.1.

### AS.1.14 — Nonholomorphic Eisenstein series

`dit_57`

For Re(s)>1, E(z,s)=Σ_{Γ∞\PSL₂(Z)}Im(γz)^s=(1/2)y^sΣ_{gcd(c,d)=1}|cz+d|^(−2s). The half accounts for ±(c,d). Prove local normal convergence and ΔE=s(1−s)E.

API:

- `cosetSum`: Define E by ΣIm(γz)^s in Re(s)>1.
- `primitivePairs`: The coprime(c, d) expression has factor 1/2 for ±pairs.
- `automorphy`: E(γz, s)=E(z, s) and ΔE=s(1−s)E in the normal-convergence region.

Tests:

- `test1`: Along the imaginary axis E(iy,2)/y² tends to one as y tends to infinity, testing the actual Eisenstein leading constant term.
- `test2`: Summing primitive pairs without 1/2 doubles E.
- `test3`: The critical-line value requires continuation and cannot be obtained by declaring the initial series convergent there.

Source: S21, (5.2).

Uses: AS.1.3.

### AS.1.15 — Completed Eisenstein series

`dit_58`

Let Λ(s)=π^(−s/2)Γ(s/2)ζ(s), and E*(z,s)=Λ(2s)E(z,s), with meromorphic values interpreted through continuation. Its critical-line use includes the limit at t=0.

API:

- `completion`: Multiply E(z, s) by Λ(2 s) where Λ is the completed scalar zeta.
- `constantTerm`: Its constant Fourier coefficient is Λ(2 s)y^s+Λ(2−2 s)y^(1−s).
- `continuation`: Define equality with the initial completion on Re(s)>1 and extend meromorphically.

Tests:

- `test1`: Residues at 0 and 1 are −1/2 and +1/2.
- `test2`: At critical t=0, cancellations between meromorphic pieces require a limit.
- `test3`: An uncompleted E period cannot be substituted into Theorem 3 without dividing by Λ(2 s).

Source: S21, (5.3).

Uses: AS.1.3; AS.1.14; `AL.0`; `AL.1/hecke-l-functional-equation`; `AL.1/global-zeta-integral`.

### AS.1.16 — Weight-zero Bessel–Kloosterman coefficient

`dit_88`

For mn≠0 and Re(s)>1, Φ(m,n;s)=Σ_{c>0}c⁻¹K(m,n;c)B_{2s−1}(4π√|mn|/c), using I for mn<0 and J for mn>0. This sign convention must match the F_{−m} residue.

API:

- `signBranch`: Use I_{2 s−1} for mn<0 and J_{2 s−1} for mn>0.
- `initialConvergence`: The series over c defines Φ in Re(s)>1 for fixed nonzero m,n.
- `resolventComparison`: Identify Φwith the actual Fourier coefficient of F_m before continuation.

Tests:

- `test1`: m=n=1 uses J.
- `test2`: m=−1, n=1 uses I.
- `test3`: The guarded nonzero-frequency coefficient returns no value at index zero and the actual dit_88 coefficient at index one.

Source: S21, §8, p974.

Uses: AS.0.26; AS.0.27; I-Bessel rank-one definition; J-Bessel rank-one definition; finite Kloosterman rank-one definition.

### AS.1.17 — Weight-zero Poincaré family

`dit_89`

For m≠0 and Re(s)>1 let F_m(z,s)=Σ_{Γ∞\Γ}√Im(γz) I_{s−1/2}(2π|m|Im(γz))e(m Re(γz)); F_0=E. No L² assumption is imposed on the exponentially growing seed.

API:

- `seed`: Use √yI_{s−1/2}(2π|m|y)e(mx) for nonzero m.
- `automorphicSum`: The coset sum is Γ-invariant in Re(s)>1.
- `resolventContinuation`: Relate the seed and Fourier expansion to the resolvent rather than assuming the growing series is L².

Tests:

- `test1`: m=0 gives E by a separate definition.
- `test2`: The absolute value of m occurs in the Bessel argument but not in the phase.
- `test3`: The large-argument I-Bessel asymptotic makes the nonzero Poincaré seed's squared cusp norm nonintegrable for real s>1; the seed is not an L² vector.

Source: S21, (8.1).

Uses: AS.1.3; AS.0.26; AS.0.27; I-Bessel rank-one definition.

### AS.1.18 — Poincaré eigenfunction and convergence

`dit_90`

F_m converges normally on compact sets for Re(s)>1, is Γ-invariant and satisfies ΔF_m=s(1−s)F_m. The differentiated series needs its own compact majorant.

Source: S21, §8, p973.

Uses: AS.0.26; AS.0.27; I-Bessel rank-one definition.

### AS.1.19 — Weight-two Poincaré one-form

`dit_105`

For smooth φ:(0,∞)→ℂ with φ(y)≪y^ε near zero, ε>0, and m∈ℤ, define P_m(τ,φ)=Σ_(γ∈Γ∞\Γ)e(m Re(γτ))φ(Im(γτ))·d(γτ)/dτ. It has weight two, making P_m dτ invariant. The value bound suffices for absolute convergence and Lemma6 unfolding; φ from (9.2) satisfies it for Re(s)>1. The paper's stronger y^(1+ε) bound is unnecessary for these value assertions. Differentiating the series needs additional derivative bounds.

API:

- `oneFormSum`: Sum the seed times d(γz), including the Möbius derivative.
- `weightTwo`: P_m(γz)γ′(z)=P_m(z), so the one-form P_m dz descends to the quotient.
- `parameterBounds`: Expose small-y bounds for φ and the derivatives actually used in normal convergence.

Tests:

- `test1`: For a smooth compactly supported seed, inversion transforms the actual Poincaré coefficient with derivative z^(−2), as required for the descended weight-two one-form.
- `test2`: Reversing the interval orientation negates the integral of the actual dit_105 one-form pulled back along a parametrized cycle.
- `test3`: The smooth seed y²sin(exp(1/y)) satisfies the order-two value bound, including the ε=1 small-y condition, but has no uniformly bounded derivative near zero.

Source: S21, §9, p979.

Uses: AS.1.3.

### AS.1.20 — Differentiated Whittaker seed

`dit_110`

For the weight-zero seed of F_m, −2i∂_zF_m is the weight-two Poincaré series with seed −s|m|^(−1/2)(2πy)⁻¹ Γ(s)/Γ(2s) M_{sgn(m),s−1/2}(4π|m|y)e(mx).

Source: S21, (9.2).

Uses: AS.0.26; AS.0.27.

### AS.1.21 — Fourier expansion of F_m(z,s) (cited)

`dit_fourier_expansion_weight0_poincare`

Let m≠0 and Re(s)>1. Then F_m(z,s)=f_m(z,s)+2|m|^{1/2−s}σ_{2s−1}(|m|)((2s−1)Λ(2s))⁻¹y^{1−s}+2y^{1/2}Σ_{n≠0}Φ(m,n;s)K_{s−1/2}(2π|n|y)e(nx), with Λ(s)=π^{−s/2}Γ(s/2)ζ(s) and Φ as in item 88.

Source: S21, §8, p.974, citing [20] and [16].

Uses: AS.0.26; AS.0.27.

### AS.1.22 — Weight-0 Eisenstein series E_N(z, s) at ∞ (2.14)

`gz_69`

Construct the cusp-∞ normalized level-N adapter E_N to the imported congruence-class weight-zero Eisenstein series of ER.7: E_N=[2ζ(2s)∏_{p|N}(1−p^(−2s))]⁻¹ Σ_{v∈(ℤ/Nℤ)×} E_{(0,v)} for Re(s)>1. Prove this equals Σ_{Γ∞\Γ₀(N)}Im(γz)^s, and that E_1 agrees with AS.1/dit-57. Under Δ_GZ=+y²(∂x²+∂y²), Δ_GZ E_N=s(s−1)E_N; −4πE_N has residue κ_N=−12/[SL₂(ℤ):Γ₀(N)] at s=1.

API:

- `congruence_adapter`: Use the stated finite sum of ER.7 congruence classes divided by the Euler/zeta factor.
- `coset_sum`: The adapter equals the primitive coset sum in Re(s)>1.
- `level_one`: At N=1 it equals the DIT E with the same half for ±pairs.

Tests:

- `level_one_test`: N=1 gives E and residue3/π.
- `prime_level`: For N=p the congruence-pair Eisenstein continuation, with Mathlib Riemann zeta normalization, gives residue 3/[π(p+1)] at s=1.
- `nonprimitive`: The actual unrestricted nonzero integer-pair Eisenstein sum at s=2 equals 2ζ(4) times the primitive-coset dit_57 series and differs from that normalized series.

Source: S29, Chapter II, §2, (2.14), p. 239.

Uses: AS.1/dit-57; congruence-group input contract; AS.1.14; B30.

### AS.1.23 — E_N via the SL₂(ℤ) series (2.16)

`gz_70`

For N ≥ 1: E_N(z, s) = N^{−s} ∏_{p|N} (1 − p^{−2s})⁻¹ Σ_{d|N} μ(d) d^{−s} E((N/d)z, s), E = E₁ the SL₂(ℤ) series; consequently E_N(w_N z, s) = N^{−s} ∏_{p|N}(1 − p^{−2s})⁻¹ Σ_{d|N} μ(d) d^{−s} E(dz, s) (p. 241).

Source: S29, Chapter II, §2, (2.16), p. 240; p. 241.

Uses: AS.1/dit-57; congruence-group input contract; AS.1.14; AS.1.22; B32.

### AS.1.24 — Non-holomorphic Eisenstein series E_s = E_{M,ε,2k−1,s} of level M = N|D|

`gz_179`

Let D<0 be a fundamental discriminant, ε its odd primitive quadratic character, δ=|D|, k≥1 and (N,D)=1. With M = N|D|: E_s(z) = E_{M,ε,2k−1,s}(z) = L^{(N)}(2s+2k−1, ε) Σ_{±(∗ ∗; c d) ∈ Γ_∞\Γ₀(M)} ε(d)(cz+d)^{−(2k−1)} y^s |cz+d|^{−2s} = ½ Σ_{c,d∈ℤ, c≡0 (mod M), (d,M)=1} ε(d)(cz+d)^{−(2k−1)} y^s |cz+d|^{−2s}, for Re(s) large. Here L^{(N)}(s, ε) = Σ_{(n,N)=1} ε(n)n^{−s} and Γ_∞ = {±(1 n; 0 1)}. E_s ∈ M̃_{2k−1}(Γ₀(M), ε). (The two expressions agree: pull out g = gcd(c,d), which is prime to M, and pair ±(c,d) using ε(−1)(−1)^{2k−1} = 1.)

API:

- `primitive_to_full`: The L^(N) factor converts the primitive coset sum into the half unrestricted sum.
- `automorphy`: The series has weight2k−1 and Nebentypus ε on Γ₀(Nδ).
- `n_one`: For N=1 it is the D₁=1 case of AS.1/gz-192.

Tests:

- `sign_pair`: With an odd character, negating both lattice indices leaves the actual gz_179 summand unchanged; the half-sum equals the series constructor.
- `n_one_test`: N=1 gives levelδ.
- `wrong_parity`: With an even character and an absolutely summable odd-weight lattice family, the actual gz_179 series vanishes by cancellation of opposite indices.

Source: S29, Chapter IV, §1, p. 271.

Uses: AS.1.1; AS.1.3; `AL.0`; `AL.1/hecke-l-functional-equation`; `AL.1/global-zeta-integral`.

### AS.1.25 — Eisenstein series E^{(D₁)}_s attached to a decomposition D = D₁·D₂ (2.1)

`gz_192`

Fix an odd negative fundamental discriminant D, k≥1 and a factorization D=D₁D₂ into fundamental discriminants, allowing D_i=1. Let ε_i be the primitive quadratic characters of conductors |D_i|. For sufficiently large Re(s), define E_s^(D₁)(z) by half the sum over integer pairs (m,n) with D₂ dividing m of ε₁(m)ε₂(n)(mz+n)^(−2k+1) Im(z)^s |mz+n|^(−2s). Its transformation law has weight 2k−1 and character ε₁ε₂ on Γ₀(|D|). The case D₁=1 recovers the level-|D₂| series. Genus characters and ramified ideals are imported arithmetic data for the consumers, rather than part of this analytic definition.

API:

- `pair_sum`: Use ½Σ_{D₂|m}ε₁(m)ε₂(n)(mz+n)^(−2k+1)y^s|mz+n|^(−2s).
- `d1_one`: D₁=1 recovers E^(1)_s of GZ IV(1.2).
- `automorphy`: The coefficient pair transforms by ε(d), giving weight2k−1 on Γ₀(δ).

Tests:

- `d1_one_test`: D₁=1 gives the levelδ series.
- `odd_product`: When the product of the two character parities is odd, simultaneous sign reversal preserves the actual two-character lattice summand and its half-sum is gz_192.
- `nonfundamental`: The constructor guard using the upstream fundamental-discriminant criterion accepts 12 and rejects 16. The raw analytic lattice sum alone does not construct primitive arithmetic characters.

Source: S29, Chapter IV, §2, (2.1), p. 273.

Uses: AS.1.1; AS.1.3; `AL.0`; `AL.1/hecke-l-functional-equation`; `AL.1/global-zeta-integral`; B31.

### AS.1.26 — Poisson (Lipschitz-type) identity for Σ_l (z+l)^{−(2k−1)}|z+l|^{−2s}

`gz_208`

For k ≥ 1, z = x+iy ∈ ℌ and Re(s) > 1−k: Σ_{l∈ℤ} 1/((z+l)^{2k−1}|z+l|^{2s}) = y^{−2s−2k+2} Σ_{r∈ℤ} V_s(ry) e^{2πirx}. Termwise Poisson requires the value/derivative decay proved from the explicit seed; general L¹ Fourier inversion alone is insufficient.

Source: S29, Chapter IV, §3, proof of (3.2), p. 278.

Uses: AS.0.39.

### AS.1.27 — Fourier expansion of E^{(D₁)}_s

`gz_209`

Let D<0 be an odd fundamental discriminant, δ=|D|, ε its primitive quadratic character, k≥1, N≥1 and (D,2N)=1. For a factorization D=D₁D₂ into fundamental discriminants (allowing D_i=1), put δ_i=|D_i|, ε_i=ε_(D_i), and κ(D₁)=1 or i according to its sign. Write E_s^(D₁)(z)=Σ_n e_s^(D₁)(n,y)e(nx). The constant coefficient is L(2s+2k−1,ε)y^s if (D₁,D₂)=(1,D), is V_s(0)L(2s+2k−2,ε)y^(−s−2k+2) if (D₁,D₂)=(D,1), and is zero otherwise. For n≠0 it is [ε₁(δ₂)κ(D₂)/δ₂^(2s+2k−3/2)]·[Σ_(m|n,m>0)ε₁(m)ε₂(n/m)m^(−2s−2k+2)]·y^(−s−2k+2)V_s(ny), with L(s,ε)=Σ_(n≥1)ε(n)n^(−s). The formula holds initially for large Re(s) and continues meromorphically.

Source: S29, Chapter IV, §3, proof of (3.2), pp. 278–279.

Uses: AS.0.39; AS.1.25; AS.1.26.

### AS.1.28 — Growth of the SL₂(ℤ) Eisenstein series: E(z,s) = y^s + O(y^{1−s}) (quoted input)

`gz_241`

For real s > 1 let E(z,s) = Σ_{γ∈Γ_∞\SL₂(ℤ)} Im(γz)^s = Σ_{(c,d)=1, mod ±} y^s/|cz+d|^{2s}. Then E(z,s) = y^s + O(y^{1−s}) as y → ∞ (uniformly in x).

Source: S29, Chapter IV §5 proof of (5.1), p.289; estimate follows from II(2.17), inspected p.240.

Uses: AS.2.16.

### AS.1.29 — Fourier expansion of the weight-0 Eisenstein series and of E_{2,s} (quoted 'well-known')

`gz_265`

For E(z,s) = Σ_{Γ∞\SL₂(ℤ)} Im(γz)^s (weight 0): E(z,s) = y^s + π^{1/2}Γ(s−½)ζ(2s−1)/(Γ(s)ζ(2s)) · y^{1−s} + (2π^s y^{1/2}/(Γ(s)ζ(2s))) Σ_{m≠0} |m|^{1/2−s} σ_{2s−1}(m) K_{s−1/2}(2π|m|y) e^{2πimx}, σ_ν(m) = Σ_{d|m} d^ν, K_ν = K-Bessel function. The identity (cz+d)^{−2}|cz+d|^{−2s} y^s = (2i/(s+1)) ∂/∂z (y^{s+1}/|cz+d|^{2s+2}) gives E_{2,s}(z) = (2i/(s+1)) ∂/∂z E(z, s+1), hence E_{2,s}(z) = y^s − π^{1/2} s Γ(s+½)ζ(2s+1)/(Γ(s+2)ζ(2s+2)) · y^{−1−s} + Σ_{m≠0} e_{2,s}(m,y)e^{2πimz} with e_{2,s}(m,y) = (2π^{s+1}|m|^{−s−1/2}/(Γ(s+2)ζ(2s+2))) σ_{2s+1}(m) e^{2πmy} (∂/∂y − 2πm)(√y K_{s+1/2}(2π|m|y)).

Source: S29, Chapter IV, §6, proof of (6.2), pp. 298-299.

Uses: AS.2.16; AS.1.19.

## AS.2 — Meromorphic continuation, local normalization and residues

### AS.2.1 — Local standard intertwining operators

`local_intertwiner`

For a characteristic-zero local field k, a Levi M of a connected reductive G and irreducible admissible π of M(k), J_Q|P(π_λ):H_P(π)→H_Q(π) is the quotient unipotent integral with half-modulus twists, initially where Re λ is sufficiently positive relative to π. Its K-finite matrix coefficients continue meromorphically; they are rational in q^(−λ(α∨)) for nonarchimedean k. The fixed compact picture and normalized induction are imported; this node owns the analytic integral and its continuation.

Assume: P,Q have common Levi M; π is admissible; sufficiently positive means relative to the exponents of π, not a uniform chamber for all π.

API:

- `intertwines`: J_Q|P(π_λ) intertwines I_P(π_λ) and I_Q(π_λ).
- `identity`: J_P|P(π_λ)=id.
- `meromorphic_coefficients`: Each fixed K-finite matrix coefficient is meromorphic in λ, rational in the exponential coordinates over nonarchimedean k.

Tests:

- `identity_test`: When P=Q the integral is the identity.
- `p_adic_gl2_spherical`: For GL₂(k), unramified χ₁⊗χ₂ and hyperspecial normalization, the nontrivial Weyl integral on the spherical vector equals (1−q⁻¹z)/(1−z), z=χ₁(ϖ)/χ₂(ϖ), in |z|<1.
- `raw_not_unitary`: The continued spherical eigenline, identified with the valuation-shell integral in its chamber, sends one to a vector of norm 3/4 at q=2,z=−1; it does not preserve norm on the unitary axis.

Source: S3, §21 pp.134–135 preceding Theorem 21.4.

Uses: `SR.2`; `SR.3`; `AF.1`; AS.0.16.

### AS.2.2 — Harish-Chandra μ-function

`mu_function`

For irreducible admissible π and opposite P,P̄ with Levi M, the composition J_P|P̄(π_λ)J_P̄|P(π_λ) is the scalar μ_M(π_λ)⁻¹ times the identity as a meromorphic family. This defines the measure-dependent μ-function with the specified Haar measures. It is not the global scattering matrix, and a change of the two unipotent measures rescales μ inversely by their product. Rank-one root factors control the higher-rank Plancherel density.

Assume: Characteristic-zero local field; irreducible admissible inducing representation; generic irreducibility and analytic continuation identify the scalar meromorphically.

API:

- `opposite_composition`: J_P|P̄ J_P̄|P=μ_M⁻¹ id as meromorphic families.
- `measure_change`: Multiplying the two unipotent measures by c,d multiplies μ⁻¹ by cd.
- `rank_one_product`: The reduced-root rank-one composition scalars give the higher-rank μ-product with the fixed measures.

Tests:

- `no_roots`: For M=G the point integral gives μ=1.
- `gl2_spherical`: For unramified GL₂, μ⁻¹=c(z)c(z⁻¹), c(z)=(1−q⁻¹z)/(1−z), interpreted meromorphically.
- `measure_scaling`: Rescaling both opposite measures by 2 changes μ⁻¹ by 4; μ is not measure independent.

Source: S3, §21 p.135 before Theorem 21.4.

Uses: AS.2.1.

### AS.2.3 — Existence of local normalizing factors

`local_normalization`

There exist scalar meromorphic r_Q|P(π_λ), products of reduced-root rank-one factors, such that R_Q|P=r_Q|P⁻¹J_Q|P is transitive: R_R|P=R_R|Q R_Q|P. It is equivariant under Weyl transport and compatible with induction in stages. For unitary π, R_Q|P is analytic and unitary on i𝔞_M* and R_Q|P(λ)*=R_P|Q(−overline λ). K-finite coefficients are rational in λ(α∨) over real fields and in q^(−λ(α∨)) over nonarchimedean fields. For tempered π, r_Q|P has no zeros or poles in the open P-positive chamber. For unramified π and hyperspecial K with the normalized spherical vector, R_Q|P maps that vector to its counterpart in H_Q. The factors are choices satisfying these properties, not a canonical global L-function for every reductive group.

Assume: Characteristic-zero local fields; connected reductive G; irreducible admissible π; unitary, tempered and spherical clauses carry their own additional hypotheses.

Source: S14, §2 Theorem 2.1; §§3–4.

Uses: AS.2.2; AS.2.1; `SR.4`.

### AS.2.4 — Langlands meromorphic continuation and functional equations

`eisenstein_continuation`

For φ∈H_P⁰, E_P(g,φ,λ) and M(w,λ)φ extend meromorphically to all 𝔞_P,ℂ*. On each finite inducing/K-type block there is a common local product of affine linear forms clearing the polar divisor. They obey E_Q(g,M(w,λ)φ,wλ)=E_P(g,φ,λ) and M(vw,λ)=M(v,wλ)M(w,λ). On i𝔞_P* both families are regular and M(w,λ) extends to a unitary H_P→H_Q. Regularity here is for actual unitary discrete inducing data and the global family; a scalar normalizing factor or arbitrary nonunitary local family can still have a pole.

Assume: Number field; discrete inducing H_P⁰; hyperplane denominators are local and on fixed finite blocks; the whole smooth Fréchet family requires the explicit seminorm extension.

Source: S3, §7 Theorem 7.2(a), equations (7.3)–(7.4), pp.32–35.

Uses: AS.1.10; AS.1.8; AS.1.4; AS.0.7; AS.0.16; AS.0.17.

### AS.2.5 — Local–global factorization and adjoints

`intertwiner_factorization`

For a factorizable discrete π=⊗′π_v and vector, the global M_Q|P restricted to its π-isotypic inducing space is m_disc(π) copies of ⊗′J_Q|P(π_v,λ), first in the common convergence chamber and then meromorphically. With compatible chosen local factors, R_Q|P(global)=⊗′R_Q|P(local) is a finite product on a spherical-outside-S vector. M_Q|P=r_Q|P R_Q|P, where r_Q|P is the analytically continued Euler product; no absolute Euler-product convergence is asserted on the unitary axis. Globally M(w,λ)*=M(w⁻¹,−overline(wλ)) and the cocycle implies the inverse on the regular unitary axis.

Assume: Restricted tensor factorization of automorphic π is an imported theorem; outside S data and normalizations are hyperspecial spherical.

Source: S3, §21 equations (21.13)–(21.14).

Uses: AS.2.3; AS.2.4; AS.1.1; `AF.2/flath-factorization`.

### AS.2.6 — Polar hyperplanes and ordered Eisenstein residues

`residue_calculus`

On a fixed finite inducing/K-type block, regularize E and M near a parameter λ₀ by a finite affine-root hyperplane product. For an ordered list of independent hyperplanes choose transverse coordinates z₁,…,z_r and define the ordered residue by successive z_j⁻¹ Laurent coefficients. It is a continuous linear map of inducing vectors, with the order and coordinates included as data. Residues that meet Langlands’s square-integrability exponent criterion give residual automorphic forms; a pole of M alone does not certify a nonzero L² residue of E.

Assume: Common denominator; an ordered independent hyperplane flag; the L² assertion additionally requires every surviving exponent to lie in the appropriate negative cone modulo center.

API:

- `coefficient`: Ordered residues compose Laurent-coefficient maps. Each Cauchy circle has positive radius, contains no other pole and uses a common denominator with holomorphy on the punctured closed ball.
- `constant_term`: Constant term commutes with a justified common-denominator residue and reveals its exponents.
- `change_coordinate`: Changing transverse coordinates transforms residue differential forms by the determinant; a scalar residue requires the chosen coordinates.

Tests:

- `two_simple_poles`: The ordered residue of v/(z₁z₂) is v in either coordinate order.
- `holomorphic_zero`: A holomorphic family has zero residue.
- `pole_not_residue`: The scalar family 1/z² has a pole at zero and residue zero.

Source: S3, §12 p.66 discussion of contour shifts.

Uses: AS.2.4; AS.1.5; AS.0.16; `AF.3`.

### AS.2.7 — Classical-group Shahidi normalization

`shahidi_normalization`

For H_{a+m} with Levi G_{E/F}(a)×H_m, τ unitary generic self-dual and σ in a relevant generic local L-packet, define β_v(s)=L_v(1+s,τ×σ)L_v(1+2s,τ,ρ)ε_v(s,τ×σ,ψ)ε_v(2s,τ,ρ,ψ)/(L_v(s,τ×σ)L_v(2s,τ,ρ)) and N_v(s)=β_v(s)M_v(s). Here ρ=∧² for even orthogonal, Sym² for odd orthogonal, and Asai⊗ξ^m for unitary groups. The dual target is τ*=ι(τ)∨ with |det|^(−s). Local L/ε factors and the additive character are supplied by the parameter theory; the factors are multiplied in precisely this orientation.

Assume: Characteristic-zero local field; relevant classical-group packet with generic parameter; specified ψ and compatible measures; self-dual is conjugate-self-dual in the unitary case.

API:

- `normalized_eq`: N_v=β_v M_v with β_v equal to the displayed L/ε ratio.
- `target`: N_v maps I(τ|det|^s⊗σ) to I(τ*|det|^(−s)⊗σ).
- `global_product`: On factorizable data the global scalar ratio uses L(s,τ×σ)L(2s,τ,ρ) divided by the shifted L-factors and ε-factors, as in (5.2)–(5.4).

Tests:

- `spherical`: If the spherical raw eigenvalue times the local-factor normalizer is one, the normalized operator fixes that vector.
- `orthogonal_parity`: For the two-dimensional Satake parameter (2,3), exterior-square weight 6 and symmetric-square weights 4,6,9 give different actual normalized operators at a regular parameter.
- `unitary_dual`: For a one-dimensional representation, the normalizer's cross-factor argument is the inverse conjugate character. Check that argument explicitly.

Source: S20, §5.1 equations (5.3)–(5.4).

Uses: AS.2.1; `AL.3`.

### AS.2.8 — Irreducibility of generic packet standard modules

`generic_standard_module`

For the relevant generic local parameter φ⁺ of a generic global Arthur parameter, each σ in Π_φ⁺(H_m) is the irreducible standard module induced from tempered unitary τ(φ_i)|det|^β_i and σ₀, with 1/2>β₁>⋯>β_t>0. The unitary generic self-dual τ has a symmetric standard-module realization with tempered unitary pieces and exponents 1/2>α₁>⋯>α_d>0. These bounds and irreducibility are retained for every pure inner form occurring in the theorem.

Assume: φ⁺ is a local component of an H_m-relevant generic global Arthur parameter, not an arbitrary generic nonunitary parameter.

Source: S20, Appendix B Proposition B.1 and (B.5)–(B.6).

Uses: `SR.3`; `AF.1`.

### AS.2.9 — Tempered GL intertwiner half-plane

`tempered_gl_intertwiner`

For unitary tempered τ,τ′ on general linear groups, the Mœglin–Waldspurger normalized rank-one GL×GL intertwiner is holomorphic and nonzero on Re s>−1. This is a statement about the source’s rank-one parameter convention, transported unchanged to (B.7)–(B.8); it is not a claim that every normalization of a reducible induced GL representation is invertible everywhere in that half-plane.

Assume: Tempered unitary GL data and the MW normalization; the conclusion is nonzero, not necessarily invertible at a reducibility point.

Source: S20, Appendix B after (B.7)–(B.9), citing [66].

Uses: AS.2.3; `SR.3`.

### AS.2.10 — Tempered classical standard integral half-plane

`tempered_standard_intertwiner`

For unitary tempered GL data τ and a tempered classical packet member σ₀, the raw rank-one standard operator M(w,τ⊗σ₀,s) is holomorphic and nonzero for Re s>0. The normalizing L-factors equal those of the generic tempered member σ₀° and are holomorphic and nonzero there, so the source’s normalized operator has the same property. This is the positive-open-half-plane input, before shifting by |α|<1/2.

Assume: σ₀ is in the tempered packet of the generic parameter used in Appendix B; characteristic-zero local field.

Source: S20, Appendix B p.87.

Uses: AS.2.7; `AF.1`; `SR.3`.

### AS.2.11 — Generic classical normalized intertwiner bound

`generic_normalized_intertwiner`

For a generic unitary member of the relevant classical packet and unitary generic GL inducing data, the Shahidi normalized rank-one operator is holomorphic and nonzero for Re s≥1/2, with the source’s parameter and ρ convention. The general theorem reduces the nongeneric members to this input plus the tempered shifted factors.

Assume: Generic member of a relevant generic unitary packet; normalization is (5.4).

Source: S20, Appendix B proof of Theorem B.2.

Uses: AS.2.7; classical packet input contract.

### AS.2.12 — Jiang–Zhang intertwiner holomorphy

`jiang_zhang_holomorphy`

Let φ⁺ be the local component of an H_m-relevant generic global Arthur parameter. If τ is irreducible admissible unitary generic self-dual on G_{E/F}(a)(k) and σ∈Π_φ⁺(H_m), then N(w₀,τ⊗σ,s) with (5.4) normalization is holomorphic and nonzero for Re s≥1/2. This includes nongeneric members of pure inner forms; it does not include arbitrary local Arthur parameters or nonunitary τ.

Assume: All hypotheses are those of Appendix B Theorem B.2; the local factors use the same packet and ψ.

Source: S20, Appendix B Theorem B.2 = §5.1 Theorem 5.1.

Uses: AS.2.8; AS.2.9; AS.2.10; AS.2.11.

### AS.2.13 — GLₙ isobaric automorphic sums

`isobaric_sum`

For cuspidal automorphic representations π_i of GL_{n_i}(𝔸_F), with specified real/unitary twists and Σn_i=n, the isobaric sum ⊞_iπ_i is the automorphic GL_n representation with those cuspidal Langlands data, equivalently the Langlands quotient of the normalized parabolic induction in its prescribed order. Its unramified Satake multiset is the union of the summands’ multisets and its standard L-function is their product. Existence/uniqueness is a general GL_n theorem; the symbol does not mean a Hilbert direct sum of representations of different groups.

Assume: Cuspidal GL_{n_i} data and their twists; compatible Langlands order; strong multiplicity one is required for uniqueness from almost-all Satake parameters.

API:

- `satake_union`: At a place where all summands are unramified, the Satake eigenvalues concatenate.
- `standard_L_product`: L(s,⊞π_i)=∏_i L(s,π_i) with the summand twists retained.
- `permutation`: Permuting summands with the corresponding Langlands ordering gives the same isobaric representation.

Tests:

- `single`: The isobaric sum of a single cusp π is π.
- `two_characters`: For unramified characters χ₁,χ₂ the GL₂ Satake polynomial is (1−χ₁(ϖ)T)(1−χ₂(ϖ)T).
- `not_hilbert_sum`: π₁⊕π₂ is not the isobaric GL_{n₁+n₂} representation: it does not even carry the same group action.

Source: S28, Notation preceding automorphic representation results.

Uses: AS.1.1; AS.2.4; `AL.2`; `SR.4`.

### AS.2.14 — Intertwiners and operator-valued families

`yu_061`

Construct M_(R'|R)(w,lambda) by the convergent unipotent integral and meromorphic continuation on induced sections. It satisfies the composition and unitary-axis identities. Ratios M_R(lambda,P;mu)=M_(R|P)(lambda)^−1 M_(R|P)(lambda/mu) give the operator-valued (G,M)-family on its regular domain.

API:

- `integralIntertwiner`: define on the domain of absolute convergence
- `continueOperator`: prove meromorphic continuation and functional equations
- `ratioFamily`: form the regular operator family on the unitary domain

Tests:

- `test1`: The actual regular-point family constructor on a same-parabolic input is the identity, using its typed identity data.
- `test2`: The ratio family built from the inverse regular intertwiner and yu_061 at λ/μ gives the identity at μ=1.
- `test3`: Composition of two members of the typed regular family agrees with its composed member. The source integral, continuation and Weyl transport must supply the identity/cocycle data.

Source: S19, §5.2.2–5.2.3 pp32–35.

Uses: AS.6.25; AS.1.12; AS.1.4; AS.2.4.

### AS.2.15 — Scalar intertwiners on spherical sections

`yu_066`

Let (P,π) be a good everywhere-unramified discrete pair, M=M_P, fix nonzero spherical φ_Π for each discrete Π and φ_π their tensor product, and for R in P(M) let φ_R(nmk)=ρ_R(m)φ_π(m) with ρ_R=δ_R^{1/2}. For S,R in P(M): M_{R|S}(λ)φ_S=n_{R|S}(π,λ)φ_R with n_{R|S}(π,λ)=∏_{β in Φ(Z_M,G), β in Φ_S ∩ Φ_{R̄}} n_β(π,λ^{−β^∨}) (equivalently ∏_{α in Φ_R ∩ Φ_S̄} n_{−α}(π,λ^{α^∨})), n_β as in (5.1.1); for L ⊇ M and Q,Q' in P(L) group the factors over β restricting to α in Φ(Z_L,G). In particular M(w,λ)φ_P=n_π(w,λ)φ_P for (w,1) in stab(P,π). The factor q^{(1−g)n_in_j} comes from vol(N(F)\N(A))=1 versus local vol(N(O_v))=1 (vol(F\A)=q^{g−1} for the product measure). Prove the local Gindikin–Karpelevich factors, the restricted Euler product and the global Haar factor separately.

Source: S19, Proposition5.3.4 p39.

Uses: AS.1.12; AS.2.14; `AL.3`; `SR.4`.

### AS.2.16 — Eisenstein Fourier expansion

`dit_59`

E*(z,s)=Λ(2s)y^s+Λ(2−2s)y^(1−s)+2√y Σ_{n≠0}|n|^(s−1/2)σ_{1−2s}(|n|)K_{s−1/2}(2π|n|y)e(nx). Prove local convergence and parameter continuation of the expansion.

Source: S21, §5, (5.3), p962.

Uses: AS.1.15; AS.2.4.

### AS.2.17 — Eisenstein continuation and residues

`dit_60`

E*(z,s) extends meromorphically with only simple poles at s=0,1, residues −1/2,+1/2, and E*(z,s)=E*(z,1−s). Do not infer this function-valued statement from scalar ζ continuation alone.

Source: S21, §5, text before (5.4), (5.4) and (5.5), p962.

Uses: AS.1.15; AS.2.4.

### AS.2.18 — Weight-zero resolvent kernel

`dit_91`

Construct the kernel G(z,z′;s) of (Δ−s(1−s))⁻¹ on modular L² off spectrum, with its cusp realization and continuation. Native bounded-inverse analyticity applies to genuine spectral gaps. At s₀=1/2+ir, r>0, a cuspidal eigenvalue is embedded in continuous spectrum: the finite-rank subtraction in (8.4) requires meromorphic continuation in weighted/test spaces, not operator-norm holomorphy on full L².

API:

- `inverseEquation`: (Δ−s(1−s))R_s=1 on its domain, assuming membership in the native bounded-inverse resolvent set; algebraic bijectivity alone is insufficient.
- `kernelSymmetry`: The actual self-adjoint resolvent kernel obeys R_s(z,z′)=conj(R_conj(s)(z′,z)), with conjugation of the parameter as well as exchange of the spatial variables.
- `restrictedResolvent`: For the closed reducing complement C and its partial Laplacian Δ_C, require s₀(1−s₀) in its bounded-inverse resolvent set; the complement inverse is then holomorphic near s₀. `operatorAdjoint` adapts SA-D20 to R_s*=R_conj(s), requiring both shifts off spectrum; a spatial kernel requires its own realization.

Tests:

- `test1`: On the constant eigenline, the scalar Laplacian resolvent is −1/[s(1−s)] off its poles.
- `test2`: At the parameter 1/2+it for the scalar Laplacian eigenvalue 1/4+t², its defining inverse equation has no solution for every right-hand side; a bounded inverse cannot be used there.
- `test3`: The actual scalar resolvent on the eigenline of eigenvalue 1/4 is (s−1/2)^(−2), so the parameter pole is double at the threshold.

Source: S21, §8 (8.2)–(8.4), pp.973–974, citing Fay [20, Theorem 3.1, p.173] and Hejhal [27].

Uses: AS.0.7; AS.0.16; AS.4.8; SelfAdjointSpectralTheory SA-D20; native `LinearPMap.resolvent`, `IsResolventAt`, `analyticAt_resolvent`.

### AS.2.19 — Finite-rank resolvent polar part

`dit_92`

Let s₀=1/2+ir with r>0, and let {u} be an orthonormal basis of the Δ-eigenspace with eigenvalue 1/4+r². With the convention (8.2), (Δ−s(1−s))∫_F G(z,z′;s)u(z)dμ(z)=u(z′), the polar part of G at s₀ is (1/4+r²−s(1−s))⁻¹ Σ_u conj(u(z)) u(z′), as in (8.4). Since 1/4+r²−s(1−s)=(s−s₀)(2s₀−1)+O((s−s₀)²), Res_{s₀}(2s−1)G(z,z′;s)=Σ_u conj(u(z))u(z′).

Source: S21, (8.4).

Uses: AS.0.7; AS.0.16; AS.4.8; AS.2.18.

### AS.2.20 — Poincaré residue theorem

`dit_93`

For m≠0, F_m extends meromorphically to Re(s)>0 and Res_{s=1/2+ir}[(2s−1)F_m(z,s)]=Σ_φ2a(m)||φ||⁻²φ(z), with the real Hecke normalization a(m); equivalently the residue of (2s−1)F_{−m} uses 2a(−m). The eigenspace sum contains all Hecke eigenforms at λ. The displayed simple-pole formula assumes r>0; the threshold r=0 has a quadratic parameter denominator.

Source: S21, Proposition3, pp973–974.

Uses: AS.0.7; AS.0.16; AS.4.8; AS.2.18; AS.1.17; AS.2.22.

### AS.2.21 — Bessel coefficient residue

`dit_94`

Let m,n≠0. Then Φ(m,n;s) continues meromorphically to Re(s)>0, and Res_{s=1/2+ir}(2s−1)Φ(−m,n;s)=2Σ_φ⟨φ,φ⟩⁻¹a(−m)a(n)=2Σ_φ⟨φ,φ⟩⁻¹a(−1)a(m)a(n). The sum runs over all Hecke–Maass cusp forms φ with eigenvalue 1/4+r², and the a(n) are real. The paper prints a(m)a(n), which is correct only for the even φ (see the new source issue on p.975). Assume r>0 for the simple-pole parameter residue; arbitrary complex orthonormal bases require conjugation in the polar projector.

Source: S21, §8, pp974–975.

Uses: AS.0.7; AS.0.16; AS.4.8; AS.2.18; AS.1.16; AS.2.20.

### AS.2.22 — Fourier expansion of the weight-0 resolvent kernel (Fay Thm 3.1, cited)

`dit_resolvent_fourier_expansion_weight0`

Let Re(s)>1 and let y′>max_{γ∈Γ}Im(γz), which holds for example when z lies in the standard fundamental domain and y′>y. Then G(z,z′;s)=(2s−1)⁻¹y′^{1−s}E(z,s)+√y′Σ_{m≠0}F_{−m}(z,s)K_{s−1/2}(2π|m|y′)e(mx′).

Source: S21, (8.3), p.973, citing Fay [20, Thm 3.1, p.173].

Uses: AS.0.7; AS.0.16; AS.4.8; AS.2.18.

### AS.2.23 — Meromorphic continuation of G_{N,s}; residue κ_N (2.13)

`gz_68`

(Quoted from Hejhal [20].) G_{N,s}(z, z′) extends meromorphically in s to a neighbourhood of s = 1 with a simple pole at s = 1 of residue κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N⁻¹ ∏_{p|N} (1 + 1/p)⁻¹, independent of z, z′. Consequently lim_{s→1}[G_{N,s} − κ_N/(s−1)] is not harmonic: its Laplacian is κ_N ≠ 0. The automorphic kernel is G_{N,s}(z,z′)=Σ_{γ∈Γ₀(N)}−2Q_{s−1}(1+|z−γz′|²/(2y Im(γz′))), initially Re(s)>1 and z outside the Γ-orbit of z′. Its finite part at s=1 has Δ_GZ equal to κ_N and is not harmonic; the cusp-corrected arithmetic Green function is owned by GZ.7.

Source: S29, Chapter II, §2, (2.13), p. 239.

Uses: AS.0.35; AS.2.18; AS.0.37; AS.2.24.

### AS.2.24 — Level-N automorphic Green kernel

`automorphic_green`

For N≥1 and z,z′∈𝔥 off the Γ₀(N)-orbit diagonal, construct G_{N,s}(z,z′), initially Σ_{γ∈Γ₀(N)/{±I}}g_s(z,γz′) for Re(s)>1, and then its meromorphic continuation near s=1. Here g_s=−2Q_{s−1}(1+|z−z′|²/(2yy′)); Γ is interpreted as the effective projective action, with each ±I pair counted once. It is Γ-invariant in each variable, symmetric in z,z′ and satisfies Δ_GZ G=s(s−1)G away from its diagonal. This is the analytic resolvent kernel, not the cusp-corrected arithmetic Green function of GZ.7.

Assume: N≥1; the two points are outside the orbit diagonal; the effective projective-group sum and hyperbolic measure dxdy/y² are fixed. For the initial sum Re(s)>1; continuation uses the quoted Hejhal result and the spectral/resolvent inputs.

API:

- `initial_sum`: For Re(s)>1 off the orbit diagonal G_{N,s}=Σ_{Γ₀(N)/±I}g_s(z,γz′), absolutely and locally uniformly.
- `symmetry`: G_{N,s}(z,z′)=G_{N,s}(z′,z); invariance holds in both variables with the effective-group convention.
- `eigenfunction`: Away from the orbit diagonal Δ_GZ,z G_{N,s}=Δ_GZ,z′ G_{N,s}=s(s−1)G_{N,s}.

Tests:

- `full_level_residue`: At N=1 the s=1 residue is −12, with hyperbolic quotient volume π/3.
- `point_pair_symmetry`: For the identity summand g_s(z,z′)=g_s(z′,z), since the point-pair invariant is symmetric.
- `finite_part_not_harmonic`: For N=1, subtracting −12/(s−1) leaves a Green finite part with Δ_GZ value −12 off the modular orbit. Test with the coordinate gzLaplacian.

Source: S29, ChapterII §2 equations(2.10)–(2.13), p.239.

Uses: AS.0.35; AS.0.36; AS.0.37; AS.0.7; AS.1/dit-57; congruence-group input contract; modular Laplacian input contract.

## AS.3 — Truncation, Maass–Selberg relations and wave packets

### AS.3.1 — Parabolic truncation cones and denominators

`truncation_cones`

For P⊂Q use the relative simple roots Δ_P^Q and their dual fundamental weights Δ̂_P^Q on 𝔞_P^Q. τ_P^Q(H) is the indicator that every α(H)>0; τ̂_P^Q(H) is the indicator that every ϖ(H)>0. Set θ_P^Q(ν)=vol(𝔞_P^Q/ℤ(Δ_P^Q)∨)⁻¹∏_{α∈Δ_P^Q}ν(α∨), using the fixed Lebesgue measure. These root and dual-weight cones are different. Their alternating incidence sums satisfy the Langlands combinatorial cancellation identities. Cone boundaries use strict positivity; the constant-term support complement therefore uses ≤0.

Assume: A compatible relative root datum and dual Lebesgue measures are fixed; rank-zero products and cone indicators are 1.

API:

- `rank_zero`: For P=Q, τ=τ̂=θ=1.
- `alternating_sum`: The incidence alternating sum of root/dual-weight cone products vanishes off the rank-zero interval, with Arthur Identity 6.2 signs.
- `theta_homogeneous`: θ_P^Q(tν)=t^dim(𝔞_P^Q)θ_P^Q(ν).

Tests:

- `rank_one`: For one coroot α∨, θ(ν)=ν(α∨)/vol(𝔞/ℤα∨).
- `boundary`: At α(H)=0 the strict root-cone indicator is 0.
- `a2_distinction`: The named A₂ simple-root cutoff is zero at root coordinates (−1,3), while the cutoff for the two inverse-Cartan fundamental weights is one.

Source: S3, §6 Identity 6.2; §15 denominator (15.7), p.84.

Uses: `AA.3/relative-chamber`; `AA.3/minimal-parabolic-data`.

### AS.3.2 — Arthur truncation operator

`arthur_truncation`

For sufficiently regular T∈𝔞₀⁺ define Λᵀf(g)=Σ_{P⊃P₀}(−1)^dim(𝔞_P^G)Σ_{δ∈P(F)\G(F)}f_P(δg)τ̂_P(H_P(δg)−T), where f_P=∫_{N_P(F)\N_P(𝔸)}f(ng)dn. For locally bounded measurable automorphic f, the inner sum is finite at each g and locally finite on compact g-sets. T is projected to each 𝔞_P. This function truncation is distinct from diagonal kernel truncation kᵀ, although they give the same integrated distribution for sufficiently regular T relative to test-function support.

Assume: Number field; compatible measures with vol[N_P]=1; regularity of T is a reduction-theoretic threshold.

API:

- `cusp_fixed`: If every proper constant term of f vanishes, Λᵀf=f.
- `linear`: Λᵀ is complex linear on its domain.
- `local_finite`: On each compact g-set only finitely many rational cosets can contribute for fixed regular T.

Tests:

- `cusp`: A cuspidal automorphic form is unchanged, not annihilated, by Λᵀ.
- `sl2_constant`: The one-cusp strip model at T=log Y truncates one to 1_(y≤Y); identifying it globally uses the large-Y reduction theorem.
- `rank_zero`: When G has no proper rational parabolic, Λᵀ=id.

Source: S3, §13 equation (13.1).

Uses: AS.3.1; `AF.3/constant-term`; `AA.3/siegel-finiteness-adelic`.

### AS.3.3 — Self-adjoint projection and constant-term support

`truncation_projection`

For sufficiently regular T, the P-constant term of Λᵀf vanishes unless every ϖ(H_P(g)−T)≤0. Moreover ΛᵀΛᵀ=Λᵀ. For locally bounded f and compactly supported continuous h, ⟪Λᵀf,h⟫=⟪f,Λᵀh⟫ whenever the displayed pairings are defined. It extends as an orthogonal projection on L². The support inequality is non-strict, correcting the strict inequality printed in Arthur 1980 Lemma 1.1.

Assume: Regular T; the initial self-adjointness formula uses one compactly supported factor before L² extension.

Source: S3, §13 Proposition 13.1(a)–(c) and correction after statement.

Uses: AS.3.2; AS.3.1; B2.

### AS.3.4 — Rapid decay of truncated uniform-moderate families

`truncation_rapid_decay`

If f is smooth of uniform moderate growth (one height exponent N₀ works for all archimedean derivatives, with derivative-dependent constants), Λᵀf is rapidly decreasing on every Siegel set for regular T. Quantitatively, for each desired decay exponent N, input N₀ and finite level K₀, there are finitely many differential operators X_i and a differentiability order r such that sup_{x∈S}‖x‖^N∫_Ω|Λᵀf_ω(x)|dω is bounded by a fixed constant times sup_y‖y‖^(−N₀)Σ_i∫_Ω|X_i f_ω(y)|dω. Thus a regular unitary Eisenstein series truncates to L², and dominated parameter families can be integrated after truncation.

Assume: The quantitative bound is for fixed T/S/N/N₀/K₀; input is C^r and measurable in ω; right side finite.

Source: S3, §13 Proposition 13.2(a)–(b), (13.5)–(13.6).

Uses: AS.3.3; AS.1.3; AS.2.4; `AA.3/height-siegel-estimate`.

### AS.3.5 — Exact cuspidal Maass–Selberg relations

`cuspidal_maass_selberg`

For cuspidal φ∈H_P⁰ and φ′∈H_R⁰ and regular T, the truncated Gram pairing ⟪ΛᵀE_R(φ′,λ′),ΛᵀE_P(φ,λ)⟫ equals ωᵀ(λ,λ′;φ,φ′)=Σ_QΣ_{w∈W(𝔞_P,𝔞_Q)}Σ_{w′∈W(𝔞_R,𝔞_Q)}exp((wλ+overline(w′λ′))(T_Q))⟪M(w′,λ′)φ′,M(w,λ)φ⟫/θ_Q^G(wλ+overline(w′λ′)). Initially take generic regular parameters; at a denominator zero take the holomorphic limit of the whole finite sum. The sum is zero for nonassociate P,R. Exact equality here requires cuspidal inducing data.

Assume: Cuspidal inducing vectors; regular T; meromorphic continuation of both sides; generic parameters first; conjugate-first Gram convention.

Source: S9, Introduction formula (1); §9 ωᵀ formula.

Uses: AS.3.4; AS.3.1; AS.1.5; AS.2.4.

### AS.3.6 — Discrete-data Maass–Selberg asymptotics

`discrete_maass_selberg_asymptotic`

For fixed cuspidal support χ and finite K-type set Γ, arbitrary discrete inducing vectors φ∈H_P,χ,Γ⁰ and φ′∈H_R,χ,Γ⁰ on the imaginary axes satisfy |⟪ΛᵀE_R(φ′,λ′),ΛᵀE_P(φ,λ)⟫−ωᵀ(λ,λ′;φ,φ′)|≤ρ(λ,λ′)‖φ‖‖φ′‖exp(−ε‖T‖). For each fixed δ>0 and sufficiently large N, this holds when every α(T)>δ‖T‖>N; ε>0 and ρ is locally bounded on i𝔞_P*×i𝔞_R*. The ωᵀ finite sum has the preceding operator form, but equality for general discrete data is replaced by this error estimate.

Assume: Number field; fixed χ,Γ; T remains away from all walls; no global polynomial bound for ρ is inferred from local boundedness.

Source: S9, §9 Theorem 9.1, Q=G, printed p.69.

Uses: AS.3.5; AS.2.6.

### AS.3.7 — Regular Eisenstein wave packets

`eisenstein_wave_packet`

Let F_P be a smooth compactly supported function on i(𝔞_P/𝔞_G)* with values in a fixed finite-dimensional H_P⁰ subspace and whose support avoids any poles of the chosen inducing continuation. Define W_P(F)(g)=∫E_P(g,F_P(λ),λ)dλ. This initially defines a smooth automorphic function by compact-parameter integration. For an associate family impose F_Q(wλ)=M(w,λ)F_P(λ) and sum n_P⁻¹W_P(F_P), with n_P=Σ_Q|W(𝔞_P,𝔞_Q)|. The weighted family is an L² wave packet by the norm theorem; its construction is here, before AS.3’s pairings, while onto completeness belongs to AS.4.

Assume: Finite-dimensional smooth inducing space; compact smooth spectral support; compatible dual measure and central quotient.

API:

- `linear`: F↦W(F) is complex linear.
- `right_equivariant`: Right translation acts by the corresponding induced action on F_P(λ).
- `truncate_integral`: Λᵀ commutes with the compact-parameter integral under the quantitative truncation estimates.

Tests:

- `zero`: Zero sections give zero packets.
- `rank_zero`: For P=G on [G]¹ the zero-dimensional integral gives the inducing vector.
- `weyl_overcount`: The roadmap constructor over a two-element Weyl orbit with measure half counting sends a compatible constant section v to v; omitting the denominator gives 2v.

Source: S3, §7 Theorem 7.2(b) wave-packet formula, pp.32–35.

Uses: AS.2.4; AS.2.5; AS.0.13; AS.3.4.

### AS.3.8 — Integrated wave-packet Gram identities

`wave_packet_gram`

For compact spectral wave packets F,F′, the truncated pairing is the double integral of the truncated Eisenstein Gram pairing. For cuspidal inducing data insert the exact ωᵀ sum; for general discrete data insert ωᵀ plus the uniformly exponentially small error on compact parameter support. After imposing associate symmetry, the T→∞ limit is Σ_P n_P⁻¹∫⟪F′_P(λ),F_P(λ)⟫dλ. This proves the isometric dense-domain norm identity, separately from surjectivity.

Assume: Compact smooth spectral support; compatible associate symmetry; controlled regular T-cone for the discrete error estimate.

Source: S3, §7 Theorem 7.2(b) and §12 contour discussion; PDF page 35, pp.32–35.

Uses: AS.3.7; AS.3.5; AS.3.6; B2.

### AS.3.9 — Coalescing parameters and residue Gram forms

`singular_parameter_limits`

Near coincident regular parameters, the complete Maass–Selberg Weyl sum extends as the actual truncated Gram function even when individual θ denominators vanish. Differentiating that full regularized identity gives Gram forms of parameter derivatives. For ordered polar flags with a common denominator, take the chosen residue coefficients on both sides; the resulting residue Gram form uses the same coordinate/order conventions. No positivity or L² membership is deduced from a formal Laurent coefficient alone.

Assume: Differentiation and residues have the common denominator and locally uniform derivative majorants; exact equality is the cuspidal formula, while general discrete data retains its controlled error.

Source: S9, §§3–6 taking residues of the cuspidal pairing.

Uses: AS.3.5; AS.3.6; AS.2.6; B4.

### AS.3.10 — GL_n relative root spaces and degree projections

`yu_022`

Using the imported rational root spaces of AA.3, construct their determinant-degree coordinate adapter for function-field GL_n. For M=∏GL_ni, use determinant coordinates for a_M and its dual. Projection a_B→a_M takes block sums, while dual projection takes block averages. Relative roots are det_i/ni−det_j/nj, coroots e_i−e_j, a_M^G has coordinate sum zero and its dual has Σni x_i=0.

API:

- `blockProjection`: implement sums on a_M and averages on its dual
- `relativeRoot`: construct det_i/ni−det_j/nj and coroots
- `fundamentalWeight`: export the prefix inequalities with exact denominators

Tests:

- `test1`: The actual block projection for 1|23 sends (1,2,3) to (1,5), and its averaged dual projection gives (1,5/2).
- `test2`: For the single rank-n block, n>0, subtracting the central projection gives the zero relative-height vector for every input.
- `test3`: For blocks of ranks1 and2, α(x,y)=x−y/2 and α∨=(1,−1), with the degree-zero condition x+y=0.

Source: S19, §3.1.1–3.1.6 pp13–15.

Uses: AS.1.11; `AA.0/restricted-haar-product`; `AA.3/relative-chamber`; `AA.3/minimal-parabolic-data`.

### AS.3.11 — Chamber functions and parabolic height

`yu_023`

Import the root/fundamental-weight cones from AS.3/truncation-cones and specialize their height argument to the function-field determinant-degree lattice. Define tau_P and hat-tau_P as strict positive-root/fundamental-weight cone indicators. For g=nmk, H_P(g) is the vector of determinant degrees of m. Record block-weight denominators and proper-parabolic conventions in the truncation cutoff.

API:

- `height`: extract Levi determinant degrees from Iwasawa decomposition
- `tau`: test strict simple-root inequalities
- `hatTau`: test strict fundamental-weight inequalities

Tests:

- `test1`: The empty product of cone conditions for GL₁ is1.
- `test2`: A point on a required wall, with the corresponding pairing zero, does not satisfy the strict cone condition.
- `test3`: For the determinant-height homomorphism with trivial unipotent and compact factors, the named height of nmk is that of m, and both actual cone cutoffs agree.

Source: S19, §3.1.3–3.1.6 pp14–15.

Uses: AS.3.10; `AA.0/restricted-haar-product`; AS.3.1.

### AS.3.12 — Generic auxiliary chamber selector

`yu_056`

Choose kappa in the positive chamber outside every relative-root hyperplane for every semistandard Levi. The unique Q_L with all its simple roots positive on kappa orders the Levi blocks. Merely requiring nonzero projections to a_L is insufficient.

API:

- `avoidHyperplanes`: choose a point off the finite union of relative-root walls
- `orderedParabolic`: recover Q_L from the signs
- `weylTransport`: relate a semistandard Levi to the ordered standard one

Tests:

- `test1`: The vector (3,2,1) fails membership in the selector for the crossed partition {1,3}|{2}, because its block averages are equal.
- `test2`: The vector (2,0) belongs to the actual GL₂ regular selector and chooses the positive ordered parabolic.
- `test3`: Multiplying a generic kappa by a positive real preserves every relative-root sign, hence preserves every Q_L.

Source: S19, §5.1.1 p29.

Uses: AS.3.10; AS.6.23; `AA.0/restricted-haar-product`.

### AS.3.13 — Degree-filtered lattice cone series

`yu_058`

Let M be standard, Q in P(M) and s in W_n/W^Q with sQs^{-1} standard. Let φ_Q be the indicator of {H in a_{s(M)} : for all α in Δ_Q, ϖ_{s(α)}(H)≤0 if α(κ)>0 and ϖ_{s(α)}(H)>0 if α(κ)<0}, where ϖ_{s(α)} in Δ̂_{sQs^{-1}} is dual to s(α)^∨, and let ε(Q)=#{α in Δ_Q : α(κ)<0}. Then 1̂_Q(λ) on X_M^G is the analytic continuation of (−1)^{ε(Q)}Σ_{H in a_{M,Z}/X_*(Z_G)} φ_Q(s(H))λ^{−H}, which converges where |λ^{α^∨}|<1 for all α in Φ(Z_M,G) with α(κ)>0 (a region meeting every component of X_M^G). For semi-standard L and Q in P(L), 1̂_Q(λ):=1̂_{wQw^{-1}}(w(λ)), where w in W_n/W^{Q_L} is the unique element with wQ_Lw^{-1} standard. For ζ a primitive n-th root of unity, η=ζ^{deg det} in X_G^G and e in Z, 1̂^e_Q(λ)=n^{-1}Σ_{k=1}^n ζ^{ek}1̂_Q(λη^k); it is the part of the series with Σ_iH_i≡e (mod n), and 1̂_Q=Σ_{e=0}^{n−1}1̂^e_Q.

API:

- `coneSeries`: define in a convergence chamber then continue
- `degreeFourierProjector`: select a degree residue by the finite Fourier sum
- `sumResidues`: recover the unfiltered series

Tests:

- `test1`: For n=1 the Fourier degree projector has one term and hat1_Q^0=hat1_Q.
- `test2`: Summing hat1_Q^e over e=0,..,n−1 recovers hat1_Q.
- `test3`: For n=2,zeta=−1, the even/odd projectors of a function f are (f(lambda)±f(lambda*eta))/2.

Source: S19, §5.2.1 pp31–32.

Uses: AS.3.11; AS.6.24; AS.3.12; `AA.0/restricted-haar-product`.

### AS.3.14 — Floor-vector expression for the cone series

`yu_059`

For ordered block prefix ranks r_s^i, H_Q^e=s^−1(floor(e r_s^0/n)−floor(e r_s^1/n),..,floor(e r_s^(r−1)/n)−floor(e r_s^r/n)) belongs to the integral a_L lattice with total degree −e. Then hat1_Q^e=lambda^H∏_{alpha∈Delta_Q}(1−lambda^alpha∨)^−1; for e=−1 this is (−1)^(r−1)(∏lambda_i)/theta_Q.

Source: S19, Proposition5.2.1 p32.

Uses: AS.3.10; AS.6.24; AS.3.13; `AA.0/restricted-haar-product`.

### AS.3.15 — Degree floor-monomial family

`yu_115`

Set I_Q^e=H_Q^e+s^−1(0,1,..,1). The functions lambda↦lambda^I_Q^e form a (G,M)-family, and hat1_Q^e=(−1)^dim(a_M^G)lambda^I_Q^e/theta_Q. Adjacent-block compatibility follows from the floor identities on the wall.

API:

- `floorExponent`: add the ordered (0,1,..,1) vector
- `wallAgreement`: prove adjacent exponent compatibility
- `cutoffFactor`: recover hat1_Q^e with the single theta denominator

Tests:

- `test1`: The named floor-height and shifted-exponent constructions for ranks (1,2), total rank three and degree one give H=(0,−1), I=(0,0).
- `test2`: The total of H_Q^e is−e and the total of I_Q^e is r−1−e.
- `test3`: For two blocks, λ₂⁻¹/(1−λ₁/λ₂)=−1/(λ₁−λ₂). Multiplication by linear θ cancels the pole, whereas its inverse doubles the denominator.

Source: S19, LemmaA.1 p75; Laf97 Lemma5(ii)p301.

Uses: AS.6.25; AS.3.14; `AA.0/restricted-haar-product`.

### AS.3.16 — Translated degree-cutoff vanishing

`yu_116`

Let n≥1, gcd(e,n)=1, M a standard Levi of GL_n and μ₀∈X_M^G. Suppose the (G,M)-family (c_Q) is defined on a domain containing μ₀^ℤ, c_M^Q is independent of Q∈P(L) for each L∈L(M), and c_Q(λμ₀)=c_Q(λ). Then lim_(λ→1) Σ_(Q∈P(M)) 1̂_Q^e(λμ₀)c_Q(λμ₀)=0 unless μ₀∈X_G^G. Coprimality is essential; the conclusion can fail otherwise.

Source: S19, LemmaA.2 pp75–76.

Uses: AS.6.27; AS.6.31; AS.3.15; `AA.0/restricted-haar-product`.

### AS.3.17 — Dependence of cutoff values only on degree order

`yu_117`

Under the same partial-value compatibility, lim_(mu→1)Σ_Qhat1_Q^e(mu)c_Q(mu) depends only on the order of e in Z/nZ. On a Levi with block sizes m_j, the top-degree floor-monomial contribution vanishes unless n|e m_j for every j; product descent gives the assertion.

Source: S19, LemmaA.3 pp76–77.

Uses: AS.6.27; AS.3.14; AS.3.15; `AA.0/restricted-haar-product`.

### AS.3.18 — Quasi-polynomiality of the Γ-lattice counts and determination from the deep chamber

`yu_157`

Let M_P ≅ GL(n_1) × ⋯ × GL(n_r), e ∈ Z and e_i ∈ Z/n_iZ, and let h = h^e_{(e_i)} = {(d_1, …, d_r) ∈ Z^r : Σ d_i = e, d_i ≡ e_i mod n_i}. (a) [Ch15, Prop 4.5.5] On lattice points T ∈ Hom(X^*(B), Z) ≅ Z^n with T_1 ≥ ⋯ ≥ T_n, the finite sum T ↦ Σ_{H∈h} Γ_{(n_1,…,n_r)}(H, T) agrees with a quasi-polynomial Σ_{ν∈f} p_ν(T) q^{⟨ν,T⟩}, with f ⊂ (2πi/log q) X^*(B) ⊗ Q finite and each p_ν a polynomial. Yu's Γ_I equals Chaudouard's Γ_P. (b) Two such quasi-polynomials that agree at all lattice points T with d(T) ≥ c agree on all lattice points of the closed chamber, in particular at T = 0. (c) (Remarque 3.3.3) Γ_I(·, 0) ≡ 0 for r > 1 and Γ_{(n)} ≡ 1.

Source: S19, §3.3.1, p. 20, and Remarque 3.3.3, p. 19; [Ch15, Définition 4.5.3, Proposition 4.5.5].

Uses: `AA.0/restricted-haar-product`; AS.3.10; AS.3.11.

### AS.3.19 — Vanishing of the degree-e cone sum on a proper Levi

`yu_175`

For a standard Levi L=∏_(i=1)^k GL_(m_i) of GL_n with k≥2, put d=gcd(m₁,…,m_k). The sum Σ_(Q∈P(L))1̂_Q^e(λ) is identically zero on X_L^G unless (n/d) divides e, hence vanishes for gcd(e,n)=1. When (n/d) divides e it is a single monomial taking root-of-unity values. For L=T⊂GL₂ and e=0 it is identically one.

Source: S19, Appendix A, pp. 75–76, input to Lemme A.2 (supplement; not stated in the paper).

Uses: `AA.0/restricted-haar-product`.

## AS.4 — Automorphic spectral completeness

### AS.4.1 — Measurable associate spectral parameters

`associate_parameter_fields`

For each associate class 𝒫 of rational parabolics take measurable families F_P:i(𝔞_P/𝔞_G)*→H_P with F_Q(wλ)=M(w,λ)F_P(λ), and norm² Σ_{P∈𝒫}n_P⁻¹∫‖F_P(λ)‖²dλ, n_P=Σ_{Q∈𝒫}|W(𝔞_P,𝔞_Q)|. This closed symmetric subspace of the Hilbert direct sum is the quotient-free model of the measurable Weyl parameter space. Choosing Borel fundamental domains gives an equivalent quotient model with stabilizers and multiplicity spaces retained. The discrete inducing representation of each Levi includes its cuspidal and already constructed residual parts. Lebesgue measure is dual to the fixed height measure; residual atoms are not absorbed into it.

Assume: Number field; countably many discrete inducing constituents at each level/K-type; compatible central quotient and unitary-axis intertwiner fields.

API:

- `symmetric_norm`: The symmetric-family norm is Σ_P n_P⁻¹∫‖F_P‖².
- `weyl_transport`: F_P↦F_Q(wλ) is the unitary fibre transport M(w,λ), satisfying identity and composition.
- `quotient_equiv`: A Borel orbit-domain model with the orbit/stabilizer measure is unitarily equivalent to the symmetric-family model.

Tests:

- `rank_zero`: A constant section over the single point with n_G=1 maps to an actual field vector whose squared norm is the original squared norm.
- `rank_one`: For a reflected compatible section over the real parameter line with n_P=2, the actual field vector has half the full integrated squared norm.
- `stabilizer_not_removed`: A nonzero vector fixed by the stabilizer operator defines a nonzero point-field vector, with the reciprocal stabilizer norm factor retained.

Source: S3, §7 Theorem 7.2(b), definition of L̂_𝒫, pp.32–35.

Uses: AS.0.1; AS.0.2; AS.0.3; AS.2.4; AS.2.5.

### AS.4.2 — Unitary Eisenstein spectral map

`spectral_map`

On smooth compactly supported symmetric associate families define U(F)=Σ_P n_P⁻¹∫E_P(g,F_P(λ),λ)dλ. Extend by the wave-packet Gram identity to the direct sum over associate classes. The resulting map is an isometry intertwining G(𝔸)¹. The spectral orthosum theorem proves it onto L²([G]¹), so its inverse, the spectral transform, is a unitary equivalence, not just an isometric embedding.

Assume: Dense smooth compact spectral domain in the symmetric-family Hilbert space; all discrete Levi data are included.

API:

- `packet_apply`: On the dense domain U equals the normalized sum of Eisenstein integrals.
- `norm`: ‖U(F)‖²=Σ_P n_P⁻¹∫‖F_P(λ)‖².
- `right_intertwines`: U I(g)=R(g)U; after onto completeness its inverse has the same intertwining property.

Tests:

- `cusp_component`: The P=G cuspidal component maps identically to the AF.3 cuspidal subspace.
- `zero`: U(0)=0.
- `proper_isometry`: A proper closed inclusion of Hilbert spaces satisfies the norm law but fails the required surjectivity condition.

Source: S3, §7 Theorem 7.2(b), pp.32–35.

Uses: AS.4.1; AS.3.7; AS.3.8; AS.0.4.

### AS.4.3 — Completeness of the automorphic spectral decomposition

`spectral_orthosum`

The isometric map U from all associate classes is onto L²([G]¹). Equivalently the closed invariant images L²_𝒫 are pairwise orthogonal and their Hilbert sum is all of L². A vector perpendicular to all wave packets is zero: project it to every elementary χ-block, apply the pseudo-Eisenstein pairing, shift the contour and include every residual contribution. Orthogonality or an isometric map alone is insufficient.

Assume: All associate parabolics and all discrete inducing representations of their Levis; ordered residual terms from every crossed polar flag.

Source: S3, §7 Theorem 7.2(b), equation (7.5); §12, pp.32–35.

Uses: AS.4.2; AS.1.10; AS.2.6.

### AS.4.4 — Residual discrete automorphic spectrum

`residual_spectrum`

Import L²_cusp and its finite-multiplicity decomposition from AF.3. Define L²_disc as the closed sum of irreducible closed invariant subrepresentations in L², and L²_res=L²_disc∩(L²_cusp)⊥. The residual construction identifies L²_res with the closed span of the nonzero square-integrable ordered Eisenstein residues from proper Levi cuspidal data. Define L²_cont=(L²_disc)⊥. These are orthogonal closed invariant spaces; a formal residue outside the L² exponent criterion is not a residual summand.

Assume: The complete spectral theorem and the negative-exponent residue criterion; cuspidal space is imported rather than reconstructed.

API:

- `orthogonal`: L²_disc=L²_cusp⊕L²_res and L²=L²_disc⊕L²_cont.
- `residue_mem`: A nonzero ordered residue satisfying the negative-exponent criterion defines a vector in L²_res.
- `projection_equivariant`: The three orthogonal projections commute with the unitary right action and every bounded integrated Hecke action.

Tests:

- `anisotropic`: If G is anisotropic modulo center, there are no proper rational parabolics and L²_res=L²_cont=0.
- `sl2_constant`: The modular Eisenstein residue is 3/π. If the discrete Hilbert space is the orthogonal sum of cusp space and the nonzero constant line, the residual space is that line.
- `non_l2_pole`: For a surviving cusp power y^a with a≥1/2, there is no L² representative for the hyperbolic cusp measure, so the power cannot be a vector in any L² residual subspace.

Source: S3, §7 and §12 contour residues, pp.32–35.

Uses: AS.4.3; AS.2.6; `AF.3/cuspidal-spectrum-discrete`.

### AS.4.5 — Finite multiplicity in the discrete spectrum

`discrete_finite_multiplicity`

Every irreducible unitary automorphic representation occurs in L²_disc([G]¹) with finite multiplicity. At fixed compact open finite level, finite K∞-type set and fixed infinitesimal character, the corresponding discrete automorphic space is finite dimensional. The cuspidal part is supplied by AF.3; the new conclusion concerns residual constituents, their finite multiplicity and the combination. This does not assert that the whole residual Hilbert space is finite dimensional.

Assume: Fixed central character and the number-field quotient; finite level, K-types and infinitesimal character only in the finite-dimensional clause.

Source: S3, §7 discrete decomposition and §12, pp.32–35.

Uses: AS.4.4; `AF.2`; `AF.3/cuspidal-spectrum-discrete`.

### AS.4.6 — Hecke and central-character spectral compatibility

`hecke_central_compatibility`

For an L¹ compactly supported finite Hecke test h, U⁻¹R(h)U is the decomposable field I_P(λ,h) and ‖R(h)‖≤‖h‖₁. The field preserves the associate symmetry and all cusp/residual/continuous projections. Restricting to a fixed unitary central character uses the matching induced central character and quotient measures. Twisting by a unitary global character transports the spectral decomposition and Haar data; a nonunitary twist requires the corresponding change of weighted Hilbert norm and is not asserted as unitary on the original space.

Assume: The transform is onto; h has finite level and integrable compact support; the central character is unitary in the L² model.

Source: S3, §7 representation decomposition and §§12,15, pp.32–35.

Uses: AS.4.3; AS.4.4; AS.0.3; `SR.1`; `AA.2/quotient-norm-one-comparison`.

### AS.4.7 — Compact quotient discrete spectral specialization

`compact_quotient_spectrum`

For a cocompact lattice Γ in a real reductive G with fixed central quotient and finite level as appropriate, L²(Γ\G) is a discrete Hilbert sum of irreducible unitary representations with finite multiplicities. Smooth compactly supported convolution is trace class and admits its smooth periodized kernel. This allows Γ\G compact while G itself is noncompact; compact-group Peter–Weyl supplies the distinct Γ={1}, G compact specialization. On a finite-volume noncompact quotient, arbitrary full-space convolution need not be trace class.

Assume: Cocompact lattice and actual quotient measure; smooth compact test; admissible real representation theory; central quotient removes any noncompact split-center direction.

Source: S3, §§3–4 compact quotient trace formula; PDF page 8.

Uses: AS.0.9; AS.0.10; AS.0.11; `AA.3/arithmetic-quotient-compact`; `AF.1`; B11; B22.

### AS.4.8 — GL₂ modular spectral expansion

`gl2_spectral_expansion`

On PSL₂(ℤ)\ℍ with dμ=dx dy/y², Δ=−y²(∂ₓ²+∂ᵧ²) has constant eigenvector, a countable orthogonal cusp spectrum and continuous generalized eigenfunctions E(z,1/2+it). For f∈C_c∞, f=3π⁻¹∫f dμ+Σ_φ⟪φ,f⟫φ/‖φ‖²+(4π)⁻¹∫_ℝ⟪E(·,1/2+it),f⟫E(z,1/2+it)dt, in L² and locally uniformly. A level subgroup has one Eisenstein family per cusp and its scattering matrix, not the one-cusp formula unchanged. Cusp eigenvalues can be denoted 1/4+r² with r real or purely imaginary; the general spectral theorem does not remove exceptional eigenvalues.

Assume: Compact smooth f; one-cusp full modular group in the displayed formula; orthogonal nonzero cusp eigenvectors; standard E normalization.

Source: S21, §5 equations (5.1)–(5.6).

Uses: AS.4.3; AS.4.4; AS.2.4; modular Laplacian input contract.

### AS.4.9 — Modular Weyl law and spectral summability

`modular_weyl_estimates`

For the full modular cusp spectrum counted with multiplicity, N(X)=#{φ:λ_φ≤X}∼X/12. For compactly supported smooth f, its cusp and Eisenstein coefficients decrease faster than every fixed inverse spectral power after repeated integration by parts with Δ; on compact z-sets the eigenfunction/Eisenstein bounds and Weyl counting make the spectral expansion absolutely summable after sufficiently many derivatives. These estimates justify the hyperbolic Weyl-integral pairings for the compact core; cusp-end integrals require their separate endpoint bounds.

Assume: Actual spectral values λ_φ; no assertion λ_φ>1/4 is used; fixed compact z-set and fixed smooth f.

Source: S21, §5 equation (5.10) and paragraph after (5.11).

Uses: AS.4.8.

### AS.4.10 — Wallach tempered cuspidality criterion

`wallach_cuspidality`

For a semisimple real group arising from a Q-group and an arithmetic lattice Γ as in Wallach, any (𝔤,K)-homomorphism from a tempered Harish-Chandra module V into A(Γ\G)∩L²(Γ\G) has cuspidal image. Consequently a square-integrable automorphic representation with tempered archimedean component is cuspidal in this setting. For a general reductive group and an essentially tempered archimedean component, first remove the specified positive central twist and pass to the finite-volume central quotient; the transfer of this criterion requires a separate central-reduction proof.

Assume: Wallach Theorem 4.3’s arithmetic semisimple setting; the essentially tempered central extension is distinguished as an additional adaptation.

Source: S18, §4 Theorem 4.3 and its proof pp.233–234.

Uses: `AF.1`; `AF.3/constant-term`; AS.4.4.

### AS.4.11 — Discrete spherical spectrum

`yu_017`

For a fixed central character theta, use the paper's |theta|-weighted L² norm on the central quotient and take irreducible spherical constituents of the discrete subspace. Cuspidal constituents are discrete; residual constituents must not be discarded.

API:

- `weightedNorm`: use theta's absolute-value normalization
- `discreteSubspace`: separate discrete from continuous spectral pieces
- `cuspidalInclusion`: embed cuspidal constituents without identifying them with all discrete ones

Tests:

- `test1`: In the constant-line model, one lies in the discrete span and residual space and has point-quotient norm one. Its GL₂ embedding requires the automorphic comparison.
- `test2`: For |theta|=1 the |theta|-weighted integrand equals |phi|².
- `test3`: When the section and its weight transform by the same nonzero central character, the actual integrated yu_017 norm is unchanged under central translation.

Source: S19, §2.3.3, pp. 10–11, Définition 2.3.4 and the definition of L²(M_P(F)\M_P(A))_θ^K.

Uses: AS.1.11; `AA.0/restricted-haar-product`.

### AS.4.12 — Discrete pairs, their equivalence and stabilizers

`yu_018`

A pair (P,pi) has standard P and a discrete spherical representation of M_P, with central character trivial on Xi_M. Quotient by Weyl transport and unramified twists in X_M^G; stab(P,pi) comprises the corresponding pairs (w,lambda).

API:

- `pair`: construct standard-parabolic discrete data
- `weylTwistEquiv`: transport both the parabolic and coefficient representation
- `stabilizer`: record the Weyl element and its compensating character

Tests:

- `test1`: (1,1) belongs to stab(P,pi).
- `test2`: (w,tau) is in the stabilizer precisely when w normalizes M and w(pi⊗tau)=pi.
- `test3`: The inverse stabilizer element of (w,tau) is (w⁻¹,w(tau)⁻¹), in the convention of Yu (5.2.11).

Source: S19, §2.3.3 pp11–12.

Uses: AS.1.11; AS.4.11; `AA.0/restricted-haar-product`.

### AS.4.13 — Good representatives of discrete pairs

`yu_019`

Choose pi=⊗_i Π_i^⊗mi with equal representatives of each inertial class and distinct classes for distinct i. Then stabilizers split into permutations of equal factors and their twist stabilizers. These choices are required in the zero/pole and cycle computations.

API:

- `groupEqualTypes`: choose one representative of each inertial class
- `cycleData`: decompose stabilizing permutations on multiplicity blocks
- `stabilizerCard`: compute factorial and twist factors

Tests:

- `test1`: Two raw representations in the same inertial class have equal chosen representatives under yu_019, so their distinguished tuple is fixed by transposition.
- `test2`: For two distinct inertial classes and a representative section of the class map, transposition does not fix the actual distinguished tuple.
- `test3`: When twisting preserves the distinguished tuple's inertial classes, its Weyl/twist stabilizer is the product of permutation and twist stabilizers.

Source: S19, §2.3.3, p. 12 ('bon représentant'); used in §6.2.1 and §6.4.1.

Uses: AS.4.12; `AA.0/restricted-haar-product`.

### AS.4.14 — Moeglin–Waldspurger classification

`yu_020`

(Moeglin–Waldspurger, [MW89, Théorème p. 606].) Let Π be a discrete everywhere-unramified automorphic representation of G_n(A). There are d | n, the standard parabolic P with M_P = G_d × ⋯ × G_d (ν = n/d factors), and an everywhere-unramified cuspidal representation π of G_d(A) such that, with |g| = q^{deg det g} and π̃ = π|·|^{(ν−1)/2} ⊗ π|·|^{(ν−3)/2} ⊗ ⋯ ⊗ π|·|^{−(ν−1)/2}, Π ≅ π̃ as H_G-modules via t_P at every place. The pair (π, ν) is unique. Conversely, for every everywhere-unramified cuspidal π of G_d(A) and every ν ≥ 1, π̃ viewed as an H_G-module via t_P is isomorphic to the H_G-module of a discrete everywhere-unramified representation of G_{νd}(A), denoted π ⊠ ν.

Source: S19, §2.3.4, p. 12, Théorème 2.3.6 (the theorem is on p. 12 only).

Uses: AS.4.11; `AA.0/restricted-haar-product`.

### AS.4.15 — Residual twist stabilizers

`yu_021`

Fix(pi box ν)≅Fix(pi). Two such discrete constituents are inertially equivalent exactly when their ν agree and their cuspidal inputs are inertially equivalent.

Source: S19, Proposition 2.3.7 p13.

Uses: AS.4.14; `AA.0/restricted-haar-product`.

### AS.4.16 — A stabilizing twist fixes the spherical function

`yu_065`

If lambda_pi∈Fix(pi), multiplication by lambda_pi acts as the identity on A_(P,pi). First evaluate the scalar at a degree-zero nonvanishing point for cuspidal pi; extend to residual pi by the Eisenstein residue construction. On the full smooth G(A)-span it is an intertwiner, not generally the identity.

Source: S19, Proposition5.3.1 andRemark5.3.2 pp36–39.

Uses: AS.4.14; AS.4.15; AS.1.12; `AA.0/restricted-haar-product`.

### AS.4.17 — Residual discrete forms are residues of cuspidal Eisenstein series

`yu_166`

(Langlands; Moeglin–Waldspurger 1994, V.3.13(iii).) Let π be an everywhere-unramified discrete, non-cuspidal automorphic representation of G_n(A). For every φ in π there are a discrete pair (P',π') all of whose factors are cuspidal, a cuspidal φ' in A_{P',π'} and a point λ' in X_{P'}^G such that φ(g)=Res_{λ'}E(φ',·)(g) for all g in G(A), where E(φ',λ) is the Eisenstein series of φ' (MW94 II.1.5) and Res_{λ'} is an iterated residue operator at λ'. Moreover E(φ'λ0,λ)=λ0·E(φ',λ) for λ0 in X_G^G.

Source: S19, §5.3.1, pp. 38–39, proof of Proposition 5.3.1 (citing [MW94, V.3.13(iii)] and [MW94, II.1.5]).

Uses: `AA.0/restricted-haar-product`; AS.4.14; AS.2.14; AS.1.12.

### AS.4.18 — Cusp decay for the Stokes input

`dit_138`

For u=E(z,1/2+it), its derivative constant terms are O(Y^(−1/2)) for fixed t, with the t=0 limit treated separately; nonconstant terms decay exponentially. Cusp forms have exponential decay. Hence the horizontal derivative integral tends to0 and u is absolutely integrable on each finite-width core cusp.

Source: S21, Lemma1 proof, p972.

Uses: AS.2.16; AS.4.8.

### AS.4.19 — Vanishing of the Weyl integrals of the wrong sign

`dit_wrong_sign_weyl_integrals_vanish`

Let D>0 be a fundamental discriminant, D=d′d a factorization into fundamental discriminants with genus character χ, and u either E(z,s) with Re(s)=1/2 or ⟨φ,φ⟩^{−1}φ for a Hecke–Maass cusp form φ (λ its eigenvalue). If d′,d>0 then Σ_{A∈Cl⁺(K)} χ(A)(λ/2)∫_{F_A}u dμ = 0 (this includes the trivial character d′=1). If d′,d<0 then Σ_{A∈Cl⁺(K)} χ(A)∫_{∂F_A}u y^{−1}|dz| = 0.

Source: S21, §5, p963, paragraph after (5.12).

Uses: AS.2.16; AS.4.8.

### AS.4.20 — Absolute integrability of E(z,s) over F_A on the critical line

`dit_eisenstein_integrable_over_core`

For Re(s)=1/2, E(z,s) is absolutely integrable over F_A with respect to dμ=y^{−2}dxdy.

Assume: D. The imported core has a compact part and finitely many cusp ends of finite width; use the geometric carrier supplied by the oriented Fuchsian-core geometry. At removable points use the continued value of E.

Source: S21, §5, p963 ('by (5.3)').

Uses: AS.2.16; AS.4.8.

## AS.5 — Weighted cohomology and cuspidal support

### AS.5.1 — Weighted L² de Rham complexes

`weighted_l2_complex`

On X_K=G(F)\G(𝔸)/(A_G(ℝ)⁰K∞K_f), with an algebraic coefficient local system E and its invariant metric, an admissible positive smooth weight p satisfies |Dp|≤C_D p for every archimedean differential operator. Define L_p^q(E)={measurable E-valued q-forms ω: pω∈L² and p dω∈L²}, where dω is the distributional local-system derivative. Give it the graph norm and differential d. The union over sufficiently decreasing exponential Siegel weights computes ordinary de Rham cohomology; the single weight p=1 instead gives an L² complex. Use p_λ comparable to exp(λ(H(g))) on Siegel sets and eventually N_P-invariant in the deep P-cusp.

Assume: Neat finite level or the orbifold variant with its stabilizer conventions; finite-dimensional algebraic E; fixed quotient measure and metric; d interpreted distributionally.

API:

- `domain`: ω lies in L_p^q iff pω and its distributional p dω are L².
- `weight_comparison`: If p≤Cq, there is a continuous complex inclusion L_q^•→L_p^•.
- `d_squared`: The distributional derivative squares to zero on the graph domain.

Tests:

- `unit_weight`: For p=1 this is the maximal L² de Rham graph complex.
- `rank_zero`: On a compact quotient all admissible weights bounded above and below give the same form domain and cohomology.
- `cusp_power`: For the power vector y^a, weight y^b and its actual radial differential ay^a, membership in the named graph domain is equivalent to a+b<1/2; the critical boundary fails membership.

Source: S17, §2.1 (1)–(7); §2.2 current comparison.

Uses: `ALS.5/de-rham-comparison`; `AA.3/adelic-height`; AS.0.18.

### AS.5.2 — Weighted regularization and relative cochains

`weighted_regularization`

At every admissible weight p the smooth all-derivative weighted forms compute the distributional graph-complex cohomology. On fixed finite K-types, regularization by convolution and the Casimir/Sobolev homotopies preserve equivalent weights and induce quasi-isomorphisms. Passing through finite level and the decreasing-weight union identifies the complex with the relative (𝔪_G,K∞) cochains of uniformly moderate-growth smooth functions, tensor E and the required central balancing twist. The topological/de Rham comparison itself is imported from ALS.5.

Assume: Admissible derivative bounds on p; algebraic E; 𝔪_G=𝔤_ℂ/𝔞_G,ℂ; use the full possibly disconnected K∞.

Source: S17, §§2.2–2.3 and §3 Theorems 2–3.

Uses: AS.5.1; `AF.1a/relative-lie-cochain-complex`; `ALS.5/de-rham-comparison`.

### AS.5.3 — Finite-infinitesimal-character functor

`finite_character_functor`

Let Z=Z(U(𝔪_G)) and J⊂Z a finite-codimension ideal. For a (𝔤,K)-module V define Fin_J(V)=⋃_{n≥1}{v:J^n v=0}, equivalently the filtered union Hom_Z(Z/J^n,V). It is a left-exact functor; R^i Fin_J(V)=colim_n Ext_Z^i(Z/J^n,V) with the compatible (𝔤,K) structure. The central algebra and infinitesimal characters are imported from AF.1; this node owns the uniform-ideal torsion functor rather than a second infinitesimal-character carrier.

Assume: Complex Harish-Chandra category; J finite codimensional; the category’s injective resolution and compatible central action are specified.

API:

- `mem_iff`: v∈Fin_J(V) iff J^n v=0 for some n.
- `map`: A central-compatible module map restricts to Fin_J, preserving identity and composition.
- `left_exact`: For 0→U→V→W, 0→Fin_J(U)→Fin_J(V)→Fin_J(W) is exact at the first two terms.

Tests:

- `zero_ideal`: For J=0, Fin_J(V)=V.
- `unit_ideal`: For J=Z, Fin_J(V)=0.
- `nilpotent_jordan`: On the actual polynomial module defined by the size-two nilpotent Jordan operator, finite_character_functor for (X) is the whole module, although X does not annihilate every vector.

Source: S17, §4 definition before Theorem 7 and Theorem 7(1)–(2).

Uses: `AF.1/infinitesimal-character`; B28; B29.

### AS.5.4 — Derived finite-character and coefficient comparison

`derived_finite_character`

The finite-character functor preserves injective (𝔤,K)-modules and its derived functors are the filtered Ext groups stated above. If E is a finite-dimensional (𝔤,K)-module and J=Ann_Z(E∨), inclusion Fin_J(V)→V induces the relative-cohomology comparison once V is Fin_J-acyclic; in general the comparison is the derived one, with the spectral sequence for R^iFin_J(V), not an unconditional underived equality.

Assume: Finite-dimensional E and J=Ann_Z(E∨); derived resolutions in the actual Harish-Chandra module category.

Source: S17, §4 Theorem 7 and equation (4.4).

Uses: AS.5.3; `AF.1a/relative-cohomology-functoriality`.

### AS.5.5 — Franke constant-term filtration

`franke_filtration`

For fixed J and an associate parabolic class {P}, every Fin_J uniform-moderate form has finitely many constant-term exponents: f_{N_Q}(g)=Σ_λ exp((ρ_Q+λ)H_Q(g)) f_{Q,λ}(H_Q(g),g), with polynomial height coefficients and smooth Levi functions. Decompose each real exponent as λ=λ₊+λ₋ by Franke’s root/fundamental-weight decomposition (§6 Lemma 1). Let F_J be the finite set of possible (Re λ)₊. Choose T:F_J→ℤ with T(λ)<T(θ) whenever λ≠θ and θ∈λ−closure(positive root cone). Define the descending filtration F_T^i by f_{Q,λ}=0 whenever T((Re λ)₊)<i for every Q. At weighted boundary use S_{p_{−r}+log}=⋃_n S_{w^(−n)p_{−r}} and S_{p_{−r}−log}=⋂_n S_{w^n p_{−r}}, with w the positive logarithmic Siegel height of §5. The filtration is finite and (𝔤,K,G_f)-stable.

Assume: r in the closed positive chamber; J finite codimensional; all constant terms, not only the minimal one; the ordering function is strictly compatible with the source root cone.

API:

- `mem_iff`: f∈F_T^i iff every nonzero constant-term coefficient has T((Re λ)₊)≥i.
- `descending`: F_T^(i+1)⊂F_T^i and the filtration has finite length.
- `levi_compatible`: The positive-part decomposition commutes with Levi projection as in §6 (6), so the induced Levi filtrations agree.

Tests:

- `single_weight`: If the only exponent weight has T-value j, F_T^i is the whole space for i≤j and zero for i>j.
- `no_exponents`: The zero vector belongs to every step.
- `rank_only_fails`: For two exponent coefficients of one parabolic with T-values zero and one, only the vector supported at exponent one belongs to step one. Parabolic rank alone cannot define the filtration.

Source: S17, §6 (1)–(9), printed pp.232–233.

Uses: AS.5.3; `AF.3/constant-term-transitivity`; AS.3.1.

### AS.5.6 — Principal values of meromorphic Eisenstein jets

`eisenstein_principal_value`

For a finite set of polar hyperplanes through λ_t choose a transverse direction ξ avoiding each hyperplane. A meromorphic germ f has f(λ_t+zξ)=Σ_{k≫−∞}a_k z^k; define MW_ξ(f)=a₀. Holomorphic jets at λ_t are finite linear combinations of parameter derivatives. Applying MW_ξ to such a derivative of E gives a smooth automorphic principal value. It need not be equivariant as an unfiltered map; in the appropriate Franke graded quotient it is equivariant and independent of ξ.

Assume: A common finite hyperplane divisor and transverse ξ; target complete locally convex space; graded independence is the theorem below, not part of the raw definition.

API:

- `holomorphic_eval`: For a holomorphic germ, MW_ξ(f)=f(λ_t).
- `linear`: MW_ξ is linear and commutes with continuous fixed target maps.
- `graded_independent`: The induced Eisenstein-jet map to the prescribed graded quotient is independent of ξ.

Tests:

- `simple_pole`: MW(z⁻¹v+w)=w.
- `holomorphic`: MW of a constant vector v is v.
- `direction_dependence`: Restrict the same named germ (z₁,z₂)↦z₁/z₂ along directions (1,1) and (2,1): the actual principal values are one and two.

Source: S17, §6 (12)–(13), printed pp.235–236.

Uses: AS.0.16; AS.2.4; AS.5.5.

### AS.5.7 — Eisenstein description of the graded pieces

`franke_graded_isomorphism`

For r in the closed positive chamber, each graded piece F_T^i/F_T^(i+1) of Fin_J S_{p_{−r}+log}^{{P}} is the direct sum over Levi ranks k of the colimit, under Weyl transport, of M(t)=W(u_t)⊗D_t with T(Re λ_t)=i (choose an equivalent shifted ordering so all filtration indices are positive). Here t=(R,Λ,χ) has R containing a member of {P}, continuous central character Λ, infinitesimal character χ in the finite J-support, Re λ_t in the closed positive chamber and in r−closure(positive root cone); u_t=Λ exp(−λ_tH_R) is unitary inducing data, W(u_t) is its induced discrete automorphic module, and D_t is the space of finite-order holomorphic functionals supported at λ_t. The map is MW_ξ applied to the corresponding derivative of E. It is a (𝔤,K,G_f)-isomorphism independent of ξ.

Assume: All index conditions in Franke §6 (10)–(14), including J-support and weighted exponent bounds; colimit identifies Weyl-isomorphic data, not a free direct sum over repetitions.

Source: S17, §6 Theorem 14, equation (14).

Uses: AS.5.5; AS.5.6; AS.4.4.

### AS.5.8 — Acyclicity of weighted smooth spaces

`weighted_finite_character_acyclic`

For r in the closed positive chamber, R^i Fin_J(S_{p_{−r}+log}([G]))=0 for i>0. For the stronger S_{p_{−r}−log} space the same holds when r lies in the intersection of the closed positive Weyl chamber with the interior of the positive root cone. Passing to the union over sufficiently decreasing weights gives Fin_J-acyclicity of the uniform-moderate-growth smooth space. This acyclicity concerns the derived central torsion functor, not vanishing of every relative Lie algebra cohomology group.

Assume: Finite-codimension J; weights and log modifications as above; the second clause additionally requires r in the interior of the positive root cone.

Source: S17, §7 Theorem 16.

Uses: AS.5.4; AS.5.7; AS.3.4.

### AS.5.9 — Acyclic parabolic constant-term resolution

`constant_term_resolution`

Let S_c be the weighted smooth functions whose P-constant terms vanish in every sufficiently deep P-cusp. For the finite poset of proper standard parabolics, the constant-term map S_p([G])/S_c([G])→lim_P S_p[P] is an isomorphism and R^i lim_P S_p[P]=0 for i>0, with the restriction maps and their compatible weights specified by Franke §7.1. The associated finite alternating parabolic complex therefore resolves that quotient. This is the acyclic boundary complex used in the Fin_J induction.

Assume: Admissible weights; the actual constant-term transition maps; functions are finite-level and K-finite as in Franke.

Source: S17, §7.1 Theorem 17.

Uses: AS.5.1; AS.5.5; AS.3.3.

### AS.5.10 — Franke ordinary-cohomology comparison

`franke_comparison`

For a connected reductive number-field group, algebraic finite-dimensional E, and finite level K_f, the inclusions A_J([G])=Fin_J S_umg([G])→S_umg([G])→C∞([G]) induce isomorphisms on H^q(𝔪_G,K∞;−⊗E) when J=Ann_Z(E∨), the central annihilator of the contragredient coefficient module. Through the ALS.5 de Rham comparison this equals ordinary H^q(X_K,𝓔), with the split-central balancing twist and full disconnected K∞ invariants. The isomorphisms are compatible with level changes and finite Hecke correspondences. This is ordinary cohomology; replacing it by cusp or L² cohomology would change the theorem.

Assume: Algebraic E; the finite-level neat/orbifold conventions of ALS.5; 𝔪_G removes the split-center Lie algebra; coefficient central character is balanced.

Source: S17, §7.4 Theorem 18.

Uses: AS.5.2; AS.5.8; AS.5.4; AS.5.9; `ALS.5/de-rham-comparison`; `AF.2/smooth-automorphic-forms`.

### AS.5.11 — GLₙ and SLₙ cuspidal cohomology diagram

`gl_sl_cuspidal_diagram`

At level one and trivial algebraic coefficients, the BCG diagram compares ⊕_πH*(𝔰𝔩_n,O(n);π∞) with H*_cusp(GL_n(ℤ),ℂ), and the corresponding SO(n) sum with H*_cusp(SL_n(ℤ),ℂ). The top is the O(n)/SO(n)-invariant part of the bottom. For odd n the two cusp cohomologies agree; for even n, the SO(n) cohomology of the unique tempered cohomological archimedean constituent is free over ℂ[ℤ/2], giving dim H*_cusp(SL_n)=2 dim H*_cusp(GL_n). Nonvanishing is equivalent to a level-one weight-zero cusp π. In the displayed sums multiplicity one and one-dimensional spherical finite vectors are the GL_n inputs.

Assume: Level-one GL_n/Q, trivial coefficients; algebraic cohomological weight-zero convention; full O(n), not just its identity component.

Source: S25, Remark 1.2, pp.511–512.

Uses: `ALS.5/cuspidal-cohomology`; `AF.1`.

### AS.5.12 — Franke–Schwermer cuspidal-support decomposition

`franke_schwermer_support`

For finite-codimension J, the space A_J(G) of automorphic forms decomposes algebraically as a direct sum over associate classes of parabolics and Weyl-associate cuspidal data on their Levis, generated by Laurent coefficients and derivatives of the corresponding cuspidal Eisenstein series with infinitesimal character in J-support. The resulting relative-cohomology decomposition is Hecke compatible. For a general reductive group this is a cuspidal-support decomposition; the phrase isobaric automorphic representation is reserved for the GL_n specialization.

Assume: Fixed J and central balancing; every coefficient belongs to the actual automorphic space; Weyl equivalence includes cuspidal data.

Source: S24, §3 proof of Lemma 3.1, citing FS98 Theorem 2.3.

Uses: AS.5.7; AS.5.10; AS.1.9.

### AS.5.13 — Isobaric realization of GLₙ cohomology eigenclasses

`isobaric_realization`

For an ordinary cohomology Hecke eigenclass of the arithmetic quotient of Res_{F/ℚ}PGL_n with algebraic coefficients over ℂ, its unramified Hecke eigenvalues outside a finite set are those of an isobaric GL_n automorphic representation, obtained from a cuspidal-support summand of the Franke–Schwermer decomposition. The class may be Eisenstein; the theorem does not force that isobaric representation to be cuspidal or tempered. For a general reductive group the conclusion is realization in a cuspidal-support Eisenstein module, not an undefined general-group isobaric sum.

Assume: Complex algebraic coefficients; anemic unramified Hecke eigenclass; GL_n/PGL_n central convention; no assertion about torsion classes.

Source: S24, §3 proof of Lemma 3.1.

Uses: AS.5.12; AS.2.13.

## AS.6 — Paley–Wiener theory and trace distributions

### AS.6.1 — Real invariant Paley–Wiener theorem

`real_invariant_paley_wiener`

For a real reductive algebraic group G with maximal compact K and radius r>0, the trace transforms of smooth bi-K-finite functions supported in the radius-r ball are exactly the collections F_i(δ,ν) on basic representations induced from limits of discrete series of Levi subgroups satisfying: finite support in δ; entire scalar Paley–Wiener bounds of type r in ν; K-conjugacy/Weyl invariance; and every induction-in-stages additivity relation (iv) of Clozel–Delorme Theorem 1. The LF image carries the quotient topology. All four conditions are required; a Weyl-invariant entire function alone is insufficient.

Assume: The real reductive algebraic setting and basic representations of Clozel–Delorme §0; Haar, norm/radius, and normalized induction are fixed. The induced families in this local theorem come from the requested AF.1 real-parabolic compact picture, not AS.1 global adelic automorphic induction.

Source: S16, §0 Theorem 1(i)–(iv), pp.194–195; §5 Theorem 1′.

Uses: AS.0.12; `AF.1`; `AF.1/sf-representation`.

### AS.6.2 — Real operator Paley–Wiener theorem

`real_operator_paley_wiener`

For Arthur’s real reductive group G and K, Fourier transformation f↦{I_B(σ,λ,f)} is a topological algebra isomorphism C_c^∞(G,K)→PW(G,K). At fixed radius N and finite K-type set Γ it identifies C_N^∞(G)_Γ with PW_N(G)_Γ: entire finite-dimensional operator families with all seminorms sup e^(−N||Re λ||)(1+||λ||)^n||F_B(σ,λ)|| finite and all differential matrix-coefficient relations (III.4.1) inherited from the induced representations. The relations include derivatives, not just ordinary intertwining covariance.

Assume: The representation, radius and finite-K-type conventions of Arthur Acta III §4; finite-dimensional matrix coefficient spaces. The induced families in this local theorem come from the requested AF.1 real-parabolic compact picture, not AS.1 global adelic automorphic induction.

Source: S11, III §4 Theorem 4.1, pp.84–85.

Uses: AS.0.15; AS.0.12; `AF.1/sf-representation`; `AF.1`.

### AS.6.3 — Arthur spectral multipliers

`spectral_multiplier`

For a compactly supported W-invariant distribution γ on the real Cartan space h, and f∈C_c^∞(G,K), construct the unique f_γ with π(f_γ)=γ̂(ν_π)π(f) for every irreducible admissible π. A radius-N input and radius-N_γ distribution give radius≤N+N_γ output with the same finite K-types. The multiplier is a continuous convolution-central endomorphism of the Hecke LF space.

Assume: Real reductive group; infinitesimal character ν_π as a W-orbit; Fourier–Laplace convention γ̂(ν)=γ(exp⟨ν,·⟩).

API:

- `character`: π(f_γ)=γ̂(ν_π)π(f) for every irreducible admissible π, with ν_π its infinitesimal-character W-orbit.
- `composition`: (f_γ)_η=f_(γ*η).
- `support`: A radius N input and radius N_γ multiplier have output supported in radius N+N_γ, with the same K-types.

Tests:

- `dirac`: The Dirac distribution at 0 acts as identity.
- `central_polynomial`: For the distribution whose transform is the Harish-Chandra polynomial p_z, f_γ=zf.
- `zero`: The zero distribution sends every f to zero.

The growth step is `PaleyWienerBound.mul_of_polynomialGrowth`: a symbol bounded by C e^(R|Re s|)(1+|s|)^d maps radius-r rapid decay to radius r+R, using the input seminorm n+d. The operator-family proof must also preserve every differentiated relation (III.4.1) and fixed K-types before applying the radius-preserving inverse transform. Tests: (1+s)^d keeps radius; exp(as) adds |a|; zero yields zero. Spatial support needs the full transform.

Source: S11, III §4 Theorem 4.2 and its proof, pp.86–87.

Uses: AS.6.2; AS.0.13.

### AS.6.4 — Automorphic convolution kernels

`automorphic_kernel`

For f∈C_c^∞(G(𝔸)^1), define K_f(x,y)=Σ_{γ∈G(F)}f(x⁻¹γy), the kernel of right convolution on [G]^1=G(F)\G(𝔸)^1. For P=MN define K_{P,f}(x,y)=∫_{N_P(𝔸)}Σ_{γ∈M_P(F)}f(x⁻¹γny)dn. Geometric summation uses the semisimple-part equivalence classes o, while spectral projection uses Weyl-cuspidal classes χ. The two kernels have distinct indices and must not be identified term by term.

Assume: Connected reductive number-field G; rational quotient, Haar and N(F)\N(𝔸) volume-one conventions; smooth finite-level compact support.

API:

- `operator`: R(f)u(x)=∫_[G] K_f(x,y)u(y)dy on smooth compactly supported quotient functions.
- `constant_term`: The parabolic kernel is obtained by the indicated unipotent integral and rational Levi sum.
- `adjoint`: For a rational index family equipped with an explicit inversion reindexing j↦j⁻¹, K_{f*}(x,y)=conj K_f(y,x). The source rational subgroup supplies that reindexing.

Tests:

- `finite_group`: For finite G(F) inside a finite group, unfolding gives the usual finite convolution matrix.
- `noncompact_diagonal`: The compact logarithmic seed on ℝ with trivial lattice gives a periodized kernel with nonintegrable diagonal on the infinite-volume quotient. The modular cusp estimate requires a separate comparison.
- `adjoint_swap`: For an inversion-stable rational index family with explicit bijective inversion reindexing and f(g)=conj f(g⁻¹), the actual periodized kernel is Hermitian.

Source: S3, §4 (4.1)–(4.2) and §14 spectral kernels; PDF page 8.

Uses: `AA.2/automorphic-quotient-measure`; `AA.3/siegel-covering-adelic`; AS.4.2.

### AS.6.5 — Coarse truncated trace kernels

`coarse_truncated_kernel`

For a positive regular T, define k_f^T(x)=Σ_{P⊃P₀}(−1)^dim(a_P/a_G)Σ_{δ∈P(F)\G(F)}τ̂_P(H_P(δx)−T)K_{P,f}(δx,δx). Keeping only a geometric class o or spectral class χ defines k_o^T or k_χ^T. Its integral J^T(f) is a regularized trace, not the ordinary trace of R(f) on noncompact [G]. At fixed f the class integrals are polynomials of degree≤dim(a₀/a_G) for sufficiently regular T.

Assume: Number-field test function and measures above; dual-weight open cone indicators, all standard parabolics including G; T sufficiently regular relative to supp f.

API:

- `decomposition`: k_f^T=Σ_o k_o^T=Σ_χ k_χ^T with the absolute integrated convergence theorem.
- `levi_translation`: Translation of T is expressed using Γ′-cone integrals and constant-term test functions on Levis.
- `canonical_value`: J(f) is the polynomial J^T(f) evaluated at Arthur’s distinguished point T₀, not its leading coefficient.

Tests:

- `anisotropic`: With only the whole-group parabolic, the actual coarse_truncated_kernel equals the original kernel diagonal.
- `rank_one`: In the constant-term logarithmic cusp model, the actual two-parabolic truncated diagonal is integrable on positive heights and its integral is T for T≥0, a degree-one polynomial.
- `zero_test`: f=0 gives k_f^T=0 and J^T(f)=0.

Source: S3, §§5–6 definition; §9 polynomial dependence; §14 (14.2).

Uses: AS.6.4; AS.3.1; `AA.3/adelic-height`.

### AS.6.6 — Coarse trace formula

`coarse_trace_identity`

For f∈C_c^∞(G(𝔸)^1) and T sufficiently regular relative to supp f, Σ_o∫|k_o^T| and Σ_χ∫|k_χ^T| are finite, and Σ_o J_o^T(f)=J^T(f)=Σ_χ J_χ^T(f). Each spectral class integral is also ∫_[G] Λ₂^T K_χ(x,x)dx. Polynomial evaluation at T₀ gives Σ_o J_o(f)=Σ_χ J_χ(f). This compares the class totals, without a bijection between o and χ.

Assume: Number-field G, smooth compact support at fixed finite level; sufficiently regular truncation; consistent quotient measures.

Source: S3, §14 Theorem 14.1; §16 (16.1); PDF page 74.

Uses: AS.6.5; B3.

### AS.6.7 — Arthur (G,M)-families

`gm_family`

Fix G,M and a Haar measure on a_M^G. A (G,M)-family is a smooth collection c_P:ia_M*→ℂ indexed by P∈P(M), whose adjacent members agree on their shared wall. Put θ_P(λ)=vol(a_M^G/ℤΔ_P∨)⁻¹∏_{α∈Δ_P}λ(α∨). Away from walls c_M(λ)=Σ_P c_P(λ)/θ_P(λ); wall cancellation extends it smoothly, with c_M=c_M(0). Restriction to Levi subspaces and parabolics yields the families used in splitting and descent. Operator-valued families use the corresponding vector-valued version.

Assume: Finite rational parabolic/root data; smoothness on the imaginary real vector space; coroot lattice covolume and fixed Haar.

API:

- `wall`: Adjacent c_P,c_P′ have identical restrictions to the common wall.
- `product`: Pointwise multiplication and restriction produce (G,M)-families.
- `regularized_sum`: c_M is the unique smooth extension of Σ_P c_P/θ_P, evaluated at zero.

Tests:

- `rank_zero`: For a genuine one-member gm_family with no walls, the actual regularized zero value equals its member at zero.
- `rank_one`: For a genuine two-member family with agreement on the shared wall, the full regularized sum has limit c₊′(0)−c₋′(0), and its zero-value construction has that value.
- `bad_wall`: No actual gm_family on a domain containing the shared wall can have constant members one and zero on the adjacent parabolics.

Source: S3, §17 definition and Lemma 17.1, pp.93–94.

Uses: AS.3.1; AS.0.15.

### AS.6.8 — Splitting and descent of Arthur families

`gm_splitting`

For (G,M)-families c,d the product has (cd)_M=Σ_{Q∈F(M)}c_M^Q d_Q′. If c_M^L is independent of Q∈P(L), this becomes Σ_{L∈L(M)}c_M^L d_L. The two-factor descent/splitting coefficients d_M^G(L₁,L₂) vanish unless a_M^{L₁}⊕a_M^{L₂}→a_M^G is an isomorphism; otherwise they are the determinant of this map with the fixed measures. Applied to local factors this gives the weighted orbital/character splitting formulas with normalized constant-term functions.

Assume: Smooth wall-compatible families; the indicated independence for the shorter Levi-only sum; the section selecting Q₁,Q₂ and all measures in Arthur §17.

Source: S3, §17 Lemmas 17.4–17.6, (17.8), (17.12)–(17.14).

Uses: AS.6.7; AS.3.1.

### AS.6.9 — Weighted orbital integrals

`weighted_orbital_integral`

For γ∈M(F_S) with connected G_γ=M_γ, define J_M^G(γ,f)=|D^G(γ)|^(1/2)∫_{G_γ(F_S)\G(F_S)} f(x⁻¹γx)v_M(x)dx. Here v_M is the zero value of the family exp(−λH_P(x)), hence the volume of the convex hull of {−H_P(x)} in a_M^G. For arbitrary γ use the canonical induced-class measure/central-shift limit of Arthur Theorem18.2, not the same integral when the centralizer condition fails. Import the unweighted orbital-integral carrier and singular extension from ET.1; this construction owns only the weight, its estimates, splitting and descent.

Assume: Local/product-local connected centralizers, compatible Haar quotient and coroot covolumes; smooth compact support; absolute convergence before identifying a distribution.

API:

- `weight`: v_M(x)=lim_(λ→0)Σ_P exp(−λH_P(x))/θ_P(λ).
- `full_levi`: J_G(γ,f)=|D^G(γ)|^(1/2)O_γ(f) with the imported quotient measure.
- `splitting`: For two place sets, J_M is Σ d_M^G(L₁,L₂)J_M^{L₁}(γ₁,f₁,Q₁)J_M^{L₂}(γ₂,f₂,Q₂).

Tests:

- `rank_zero`: M=G gives weight 1.
- `rank_one_volume`: The actual two-height weight with coroot covolume vol is r·vol for r≥0, and the named point-quotient weighted orbital integral with discriminant one takes exactly that value.
- `measure_scaling`: Scaling the centralizer Haar by c scales the quotient integral by c⁻¹; the global centralizer-volume coefficient scales by c and cancels it.

Source: S3, §18 (18.3), Theorem 18.2, (18.10).

Uses: orbital/pseudo-coefficient input contract; AS.6.7; AS.6.8.

### AS.6.10 — Normalized weighted characters

`weighted_character`

Fix π unitary on M(F_S), P∈P(M) and normalized local intertwiners R. The family ℛ_Q(Λ,π_λ)=R_(Q|P)(π_λ)⁻¹R_(Q|P)(π_(λ+Λ)) has wall compatibility. Its regularized zero value ℛ_M gives J_M(π_λ,f)=tr(ℛ_M(π_λ,P)I_P(π_λ,f)). Fourier integration over ia_M,S*/ia_G,S* defines J_M(π,X,f), where Z=H_G(X) and f is restricted to height Z. The definition for nonunitary data uses the specified finite contour combination; no pole-free unitary formula is asserted there.

Assume: S has Arthur’s closure property; fixed finite K-types of f; analytic unitary-axis normalized intertwiners; quotient Haar/Fourier dual measures.

API:

- `trace`: J_M(π_λ,f)=tr(ℛ_M(π_λ,P)I_P(π_λ,f)).
- `full_levi`: For M=G, ℛ_G=1 and J_G is the ordinary character.
- `parabolic_independence`: Conjugating by normalized R identifies the definitions for different P, so their traces agree.

Tests:

- `full_levi_test`: M=G recovers tr π(f).
- `rank_one_derivative`: On a finite-dimensional invertible slice, the weighted character is tr(R(λ)⁻¹R′(λ)·test); its trace-class witness belongs to this product.
- `normalization_change`: The scalar families exp(z)Id and Id have weighted traces one and zero at z=0: imaginary-axis unitarity does not fix the logarithmic-derivative weight.

Source: S3, §21 (21.11)–(21.16); §23 (23.1)–(23.2).

Uses: AS.2.3; AS.6.7; AS.0.10.

### AS.6.11 — Fine geometric expansion

`fine_geometric_expansion`

Given a compact support neighborhood Δ⊂G(𝔸)^1, there is S_Δ such that for every S⊃S_Δ and f supported in Δ at S with spherical unit outside S, J(f)=Σ_M |W₀^M|/|W₀^G| Σ_{γ∈(M(F))_(M,S)}a^M(S,γ)J_M(γ,f). Each inner sum is finite. The coefficients are defined from unipotent distributions in connected semisimple centralizers and their volume/descent factors; they depend on S and the equivalence class. They are not all ordinary centralizer volumes.

Assume: Number field; sufficiently large S depending on support and ramification; Arthur connected-centralizer and (M,S)-equivalence conventions.

Source: S3, §19 Theorems 19.1–19.2 and Corollary 19.3 (19.10).

Uses: AS.6.6; AS.6.9; AS.6.8.

### AS.6.12 — Fine spectral expansion

`fine_spectral_expansion`

For f in the adelic bi-K-finite Hecke algebra H(G), J(f)=Σ_{t≥0}Σ_{M,L⊃M}Σ_{s∈W^L(M)_reg} (|W₀^M|/|W₀^G|)|det(s−1)|_(a_M^L)⁻¹ ∫_(ia_L*/ia_G*) tr(ℳ_L(λ,P)M_P(s,0)I_(P,t)(λ,f))dλ, with ℳ_L the regularized family built from global M. Decomposing M=rR separates global logarithmic r-derivatives and local normalized weighted characters. For each t all displayed integrals converge absolutely; Σ_t|J_t(f)|<∞. Joint absolute convergence after taking the absolute value inside every t-integral is not supplied. The L=G terms include singular continuous contributions as well as the genuine discrete spectrum. The Jacobian acts on a_M^L, as in (21.5), Corollary21.3 and Arthur1988global p.520.

Assume: Number-field connected reductive G; f∈H(G), including finite archimedean K-types; quotient determinant space a_M^L and its Haar; t=minimum-norm imaginary infinitesimal-character height.

Source: S3, §21 Theorem 21.6, Corollary 21.7; Remarks 3–4; Arthur88global Theorem4.4; S3, §21 (21.5), p.130, and Corollary21.3, p.134; S13, Theorem4.4 proof, p.520, first coefficient in the proof.

Uses: AS.6.3; AS.6.10; AS.6.6; AS.3.6; AS.2.5.

### AS.6.13 — Almost compact invariant Fourier spaces

`almost_compact_test_space`

For S with the closure property (an archimedean place, or only finite places of one residual characteristic), a_G,S=H_G(G(F_S)) is closed. H_ac(G)_Γ consists of functions with fixed finite K-types Γ for which f(x)b(H_G(x))∈H(G)_Γ for every compactly supported smooth b on a_G,S. I_ac(G)_Γ consists of character-side functions φ(π,Z), satisfying φ(π_λ,Z)=exp(λZ)φ(π,Z), for which φ b lies in the invariant Fourier image I(G)_Γ for every such b. Take the LF union in Γ. The weighted Fourier map φ_M(f)(π,X)=J_M(π,X,f) is continuous H_ac(G)→I_ac(M).

Assume: Tempered π on G(F_S); central Fourier dual quotient ia_G*/ia_G,S∨, with periods 2πℤ; the invariant PW image, not all functions on tempered representations.

API:

- `cutoff`: Membership means every compact smooth height cutoff belongs to the same Γ piece of H or I.
- `height_covariance`: φ(π_λ,Z)=e^(λZ)φ(π,Z).
- `weighted_fourier`: φ_M(f)(π,X)=J_M(π,X,f), a continuous linear map into I_ac(M).

Tests:

- `compact_input`: H(G) embeds into H_ac(G).
- `semisimple`: If a_G=0 then H_ac(G)=H(G), and likewise for I.
- `fiberwise_only`: A smooth coefficient family can have compact support per K-type and finitely many types at each height, yet involve all labels within one compact height interval. No fixed finite-type almost-compact space contains it.

Source: S3, §23 pp.146–148 and Proposition 23.1.

Uses: AS.6.10; AS.6.1.

### AS.6.14 — Invariantization by Levi recursion

`invariant_recursion`

Define I_M^G(γ,f)=J_M^G(γ,f)−Σ_{L⊃M,L≠G}Î_M^L(γ,φ_L(f)) and the parallel I_M^G(π,X,f) with the same lower-Levi subtraction. Define I^G(f)=J^G(f)−Σ_{L≠G}(|W₀^L|/|W₀^G|)Î^L(φ_L(f)). Hats mean factoring a distribution through the invariant character image, not choosing a representative test function. Simultaneous induction proves conjugation invariance and annihilation of every test function with zero character transform, so every subtraction is well-defined.

Assume: S has closure property; H_ac domain; induction on proper Levis; character support is proved for these distributions, not assumed for all invariant distributions.

API:

- `recursion`: The defining subtraction uses every proper Levi L containing M.
- `invariance`: Matching the conjugation defect of J with the weighted lower-Levi defects gives I(conjugate f)=I(f) in the linear model; the distribution construction supplies this compatibility.
- `character_support`: In the linear model, J=Î∘transform+Σ_L weight_L·lower_L∘φ_L implies I=Î∘transform, so transform f=0 implies I(f)=0. Arthur's induction supplies the factorization.

Tests:

- `full_levi`: I_G(γ,f)=J_G(γ,f) and I_G(π,Z,f)=tr π(f^Z).
- `zero_transform`: Construct J from a character-image functional plus the lower-Levi correction; invariant_recursion then vanishes when transform f=0.
- `rank_one`: The global GL₂ recursion (23.10) has proper-Levi Weyl coefficient 1/2; the local I_M^G recursion (23.3) has coefficient one.

Source: S3, §23 Theorems 23.2–23.3, (23.3)–(23.4), (23.10).

Uses: AS.6.9; AS.6.13; AS.6.6.

### AS.6.15 — Invariant trace formula

`invariant_trace_formula`

For f∈H(G), I(f)=lim_S Σ_M (|W₀^M|/|W₀^G|)Σ_{γ∈Γ(M)_S}a^M(γ)I_M(γ,f)=lim_T Σ_M (|W₀^M|/|W₀^G|)∫_{Π(M)_T}a^M(π)I_M(π,f)dπ. The geometric limit stabilizes for S sufficiently large depending only on support and ramification, and is finite. For each height bound T the spectral integral converges absolutely and the limit equals Σ_t I_t(f). The weak multiplier estimate is Σ_{t>T}|I_t(f_α)|≤C exp(kT) sup_{ν∈h_u*(r,T)}|α̂(ν)|, with C,k,r depending on f and α supported in a fixed-radius Cartan ball. This does not assert joint absolute convergence of every spectral term.

Assume: Number-field connected reductive G; adelic K-finite Hecke input; consistent normalizing factors, determinants and measures.

Source: S3, §23 Theorem23.4 (23.11)–(23.13); Arthur88global §§3–6.

Uses: AS.6.14; AS.6.11; AS.6.12; AS.6.3.

### AS.6.16 — Trace formula for compact quotients

`compact_trace_specialization`

If G(F)\G(𝔸)^1 is compact (equivalently G has no proper F-parabolic), smooth compactly supported convolution is trace class and its trace equals ∫_[G]K_f(x,x)dx=Σ_[γ] vol(G_γ(F)\G_γ(𝔸)^1)∫_{G_γ(𝔸)\G(𝔸)}f(x⁻¹γx)dx=Σ_πm(π)tr π(f). Use the same connected/full centralizer convention in both volume and orbital integral. The convolution spectrum is discrete with finite multiplicities; compactness of G itself is not required.

Assume: Compact arithmetic quotient; smooth finite-level f; compatible quotient measures; disconnected centralizer index retained.

Source: S3, §1 compact quotient formula; §16 (16.1)′′; PDF page 8.

Uses: AS.6.4; AS.6.6; AS.4.7; AS.0.11.

### AS.6.17 — Real Euler–Poincaré test functions

`general_euler_poincare`

Import the discrete-series/pseudo-coefficient and relative-cohomology carriers from ET.1 and AF.1a. For a finite-dimensional real reductive coefficient ξ, construct f_ξ of arbitrarily prescribed positive support radius with tr π(f_ξ)=Σ_q(−1)^q dim H^q(𝔤,K;π⊗ξ) for every finite-length admissible π. If G has no discrete series, this Euler characteristic is identically zero and f_ξ=0 is admissible. This is the full finite-length Euler–Poincaré character identity beyond the tempered pseudo-coefficient indicator.

Assume: Clozel–Delorme real group conventions; finite-length Harish-Chandra module and finite-dimensional ξ; split-center/central-character balancing when passing to adelic groups.

API:

- `trace_identity`: For every finite-length admissible π, tr π(f_ξ)=EP(𝔤,K;π⊗ξ). In the scalar model an invertible trace map E≃ₗℂ constructs f from the alternating cohomology sum.
- `induced_vanishing`: Properly induced representations have zero EP. The rank-one cochain model has nonzero cohomology in degrees zero and one but zero alternating dimension.
- `no_discrete_series`: Without discrete series, EP is zero. The scalar image construction gives the zero test element when supplied with the zero Euler sum; the representation theorem establishes that sum.

Tests:

- `compact_group`: The actual EP test element for the degree-zero relative cochain model has trace one, equal to its one-dimensional zeroth cohomology.
- `no_discrete_series_test`: Finite relative cochains of zero Euler characteristic give zero in the scalar-trace EP construction; the no-discrete-series theorem supplies this condition representation by representation.
- `parabolic_induction`: The rank-one relative cochain construction has EP trace zero while H⁰ and H¹ each have dimension one.

Source: S16, §5 Theorem3, pp.213–215.

Uses: AS.6.1; orbital/pseudo-coefficient input contract; `AF.1a/relative-lie-cochain-complex`.

### AS.6.18 — L²-Lefschetz traces of Hecke operators

`l2_lefschetz`

For Arthur’s reductive Q-group, coefficient ξ, level K_f and central balancing character, the alternating trace of h on finite-dimensional L² relative cohomology is Σ_{π∈Π_disc}m_disc(π)EP(𝔪_G,K∞;π∞⊗ξ)tr π_f(h)=I(f_ξ⊗h). The invariant geometric expansion computes this trace with lower-Levi corrections. In CT20’s split classical integral groups at level one, h=∏_p1_{G(ℤ_p)} with vol G(ℤ_p)=1 gives EP(G;λ)=T_geom(G;λ); its elliptic term is Σ_[γ finite order]vol(G_γ(ℚ)\G_γ(𝔸))O_γ(h)tr(γ|V_λ), with signed Euler–Poincaré measure at infinity and the matching local centralizer measures. Residual cohomology contributes unless a separate theorem excludes it.

Assume: Finite-dimensional algebraic coefficient; finite level; full K∞ component convention; invariant quotient by the split center. CT specialization uses the groups and coefficient regularity stated in §1.4. Arthur assumes G(ℝ)/A_G(ℝ)^0 has a compact Cartan subgroup; see §2, p.264. CT20 §1.4 uses its listed split classical groups admitting discrete series (in particular the even orthogonal cases allowed there).

Source: S15, Arthur89 §2, p.264 (compact-Cartan hypothesis), Proposition 2.1; §3 Proposition 3.2; §6 Theorem 6.1; CT20 §1.4.

Uses: AS.6.17; AS.6.15; AS.4.3; AS.4.5.

### AS.6.19 — Truncated geometric kernel and fixed-degree trace

`yu_024`

Form k_P by the prescribed rational Levi sum, central Xi_G sum and unipotent integral; k^T is the alternating sum over P(F)\G(F) with hat-tau_P(H−T). Set J_e^T=∫_{G(F)\G(A)^e} k^T(x,x) dx and J_e=J_e^0, with convergence proved separately.

API:

- `parabolicKernel`: assemble rational sums and unipotent integration
- `truncate`: form the locally finite alternating parabolic sum
- `fixedDegreeIntegral`: integrate only after convergence and quotient-measure proofs

Tests:

- `test1`: For G=GL₁, the parabolic truncation sum has only P=G and k^T=k_G.
- `test2`: Writing J_e^T as an integral is permitted after integrability of the restricted diagonal kernel has been proved; the value at T=0 is J_e.
- `test3`: The actual fixed-degree integral of the two-parabolic cusp model on [0,2T] is T and differs from the whole-group-only integral when T>0.

Source: S19, §3.2.1 pp15–16.

Uses: AS.4.12; AS.3.11; `AA.0/restricted-haar-product`.

### AS.6.20 — Convergence and quasipolynomial continuation

`yu_025`

The truncated fixed-degree integral is absolutely convergent; T↦J_e^T is quasipolynomial in the lattice sense, with its extension determined by values sufficiently deep in the positive chamber. T=0 evaluation is not untruncated integration or an unjustified limit of finite counts.

Source: S19, §3.2.1; Theorem 3.3.1; Laf97 p227; Ch15 Definition4.5.3.

Uses: AS.6.19; `AA.0/restricted-haar-product`.

### AS.6.21 — Characteristic-polynomial refinements of the group and Lie kernels

`yu_038`

For monic p∈Fq[X] of degree n restrict the large-T kernels to matrices/endormorphisms with characteristic polynomial p and extend their integrals quasipolynomially. If p(0)≠0, End(E) and Aut(E) fibres coincide; hence J_e=Σ_{p(0)≠0} tildeJ_p,e.

API:

- `charpolyFibre`: restrict kernel sums to a monic degree-n polynomial
- `lieKernel`: replace automorphisms by all endomorphisms
- `continueInT`: extend each truncated integral quasipolynomially

Tests:

- `test1`: The scalar matrix a·Id belongs to the (X−a)^n characteristic-polynomial fibre.
- `test2`: For n>0, the zero matrix belongs to the X^n fibre, is not invertible, and does not belong to the (X−1)^n fibre.
- `test3`: For A in the p characteristic-polynomial fibre, A is invertible iff p has nonzero constant term; on a bundle use the corresponding global Cayley–Hamilton inverse.

Source: S19, AppendixB pp78–79.

Uses: AS.6.19; AS.6.20; `AA.0/restricted-haar-product`; AS.3.18.

### AS.6.22 — Coprime scalar-nilpotent vanishing and the Fourier comparison

`yu_039`

(Chaudouard, D = 0.) Let gcd(n,e) = 1. (a) [Ch15, Thm 6.2.1] For monic p ∈ F_q[X] of degree n, the T = 0 value J̃_{p,e} of the Lie-algebra quasi-polynomial vanishes unless p = (X−α)^n with α ∈ F_q, in which case J̃_{p,e} = J̃_{nilp,e}. (b) [Ch15, Cor 5.2.3] For every T and e, Σ_p J̃^T_{p,e} = J^{T,e}_0 = q^{n²(1−g)} J^{T,e}_K, with K a canonical divisor. (c) [Ch15, Cor 5.2.2] Since deg K = 2g−2, J^{0,e}_K is the mass Σ 1/|Aut| of the groupoid of semistable Higgs bundles (E, θ: E → E ⊗ ω) of rank n and degree e over F_q. Hence J_e = (q−1)J̃_{nilp,e} = ((q−1)/q) Σ_p J̃_{p,e} = ((q−1)/q) q^{−n²(g−1)} mass(Higgs^{ss}_{n,e}(X_1)(F_q)).

Source: S19, Appendix B, p. 79; [Ch15, Théorème 6.2.1, Corollaires 5.2.2–5.2.3].

Uses: AS.6.20; AS.6.21; `AA.0/restricted-haar-product`.

### AS.6.23 — Weyl permutations and fixed Levis

`yu_047`

Let M be a semi-standard Levi subgroup of G=GL_n and w in W_n (a permutation matrix). Put w(M)=wMw^{-1}; then w(a_M)=a_{w(M)} and w induces an isomorphism w: X_M^G -> X_{w(M)}^G, w(λ)(m)=λ(w^{-1}mw) for m in w(M)(A). If w(M)=M (so w permutes the blocks of M, necessarily among blocks of equal size), there is a smallest Levi subgroup L_w containing M and w; it is characterized by a_{L_w}=ker((w−id)|a_M), its blocks are the unions of the blocks of M along the cycles of the block permutation induced by w, and w acts trivially on X_{L_w}^G. For M ⊆ L, restriction of characters gives an inclusion X_L^G ⊆ X_M^G. Track the lattices a_{M,Z}, a_{L,Z} as well as the real spaces.

API:

- `leviFromCycles`: construct L_w from the permutation orbits
- `fixedVectorSpace`: identify a_L with ker(w−1)
- `centralCharacterAction`: prove w fixes X_L^G

Tests:

- `test1`: For w=1 the minimal fixed Levi is M.
- `test2`: For M=GL_d×GL_d and w swapping the two blocks, L_w=GL_(2d).
- `test3`: For M=GL₁^4 and w=(12)(34), L_w=GL₂×GL₂ up to permutation, rather than GL₄.

Source: S19, §4.1.1, p. 21, and §4.1.3, p. 22.

Uses: AS.1.11; AS.3.10; `AA.0/restricted-haar-product`.

### AS.6.24 — Multiplicative and linear torus pairings

`yu_048`

In determinant coordinates set X_M^G={(lambda_i):∏lambda_i^ni=1}. Write lambda^H=∏lambda_i^H_i but <lambda,H>=Σlambda_i H_i, using the coordinate embedding, not a logarithm. The finite central subgroup X_G^G is mu_n.

API:

- `multiplicativePairing`: evaluate lambda^H with integer exponents
- `linearPairing`: evaluate the coordinate-linear form without logarithms
- `centralRoots`: identify X_G^G with mu_n

Tests:

- `test1`: lambda^(H+K)=lambda^H*lambda^K for integral H,K.
- `test2`: For H=(1,−1), lambda^H=lambda1/lambda2 whereas <lambda,H>=lambda1−lambda2.
- `test3`: For H=0 the multiplicative pairing is1 and the additive pairing is0.

Source: S19, §4.1.5–4.1.6, p. 22.

Uses: AS.1.11; AS.3.10; `AA.0/restricted-haar-product`.

### AS.6.25 — Arthur theta denominator and multiplicative families

`yu_049`

For a semi-standard Levi L, the chambers of a_L^G correspond to P(L) via P ↦ {H in a_L^G : α(H)>0 for all α in Δ_P}; P̄ denotes the opposite parabolic (Φ_P̄=−Φ_P), and P,Q in P(L) are adjacent when |Φ_P̄ ∩ Φ_Q|=1. For Q in P(M) and λ in X_M put θ_Q(λ)=∏_{α in Δ_Q}⟨λ,α^∨⟩ (the linear pairing of 4.1.6, so ⟨λ,α^∨⟩=λ_u−λ_v for α^∨=e_{M,u}−e_{M,v}); this differs from Arthur's θ_Q by a volume factor. Let Ω ⊆ X_M^G or X_M be a domain. A family (c_P)_{P in P(M)} of holomorphic functions on Ω is a (G,M)-family if c_P(λ)=c_{P'}(λ) for every adjacent pair P,P' and every λ in Ω with λ^{α^∨}=1, where α is the unique root in Φ_P ∩ Φ_{P̄'}. For such a family c_M(λ)=Σ_{Q in P(M)} c_Q(λ)θ_Q(λ)^{-1} is meromorphic on Ω. A domain around a noncentral translate must be specified when one is used.

API:

- `adjacentCompatibility`: state equality on the multiplicative coroot wall
- `theta`: construct the product of coordinate differences
- `regularizedSum`: name the sum before proving removable singularities

Tests:

- `test1`: For GL₂ with diagonal Levi, theta_B=lambda1−lambda2 and theta_Bop=lambda2−lambda1.
- `test2`: The multiplicative wall equation from the actual coroot (1,−1) rejects any yu_049 family with constant adjacent members one and two on the whole character domain.
- `test3`: For M=G, theta_G=1 and the single holomorphic member automatically satisfies the adjacency condition.

Source: S19, §4.1.2, p. 21, and §4.2.1, p. 23, Définition 4.2.1 and (4.2.1).

Uses: AS.3.10; AS.6.23; AS.6.24; `AA.0/restricted-haar-product`; AS.6.7; AS.6.8.

### AS.6.26 — Regularized family value and descent

`yu_050`

(a) Let (c_Q)_{Q in P(M)} be meromorphic on X_M^G (or X_M) and a (G,M)-family on a neighbourhood of λ0 in X_M^G (or X_M). Then c_M(λ)=Σ_Q c_Q(λ)θ_Q(λ)^{-1} is regular at λ0. (b) For a (G,M)-family near 1 put c_M=lim_{λ→1}c_M(λ). For L in L(M), R in P(L) and Q in P^L(M), c^R_Q(λ)=c_{QN_R}(λ) (QN_R the unique element of P(M) contained in R with QN_R ∩ L=Q) is an (L,M)-family near 1, with value c^R_M=lim_{λ→1}Σ_{Q in P^L(M)} c^R_Q(λ)θ^L_Q(λ)^{-1}, θ^L_Q(λ)=∏_{α in Δ^L_Q}⟨λ,α^∨⟩. (c) For Q in P(L) and λ in X_L^G, c_Q(λ):=c_P(λ) for any P in P(M) with P ⊆ Q is independent of P and defines a (G,L)-family near 1.

Source: S19, §4.2.1–4.2.2, p. 23, Théorème 4.2.2 and (4.2.2)–(4.2.5).

Uses: AS.6.25; `AA.0/restricted-haar-product`; AS.6.7; AS.6.8.

### AS.6.27 — Product formula for families

`yu_051`

If c_M^Q is independent of Q∈P(L) for every L⊇M, then (cd)_M=Σ_L c_M^L d_L in Yu's normalization. This hypothesis is essential; the formula is not asserted for arbitrary families without the partial-value compatibility.

Source: S19, §4.2.2, pp. 23–24, Proposition 4.2.3 (variant of Arthur 1981, Corollary 6.5).

Uses: AS.6.26; `AA.0/restricted-haar-product`; AS.6.7; AS.6.8.

### AS.6.28 — Root-product derivative formula

`yu_052`

For each root beta choose c_beta meromorphic on C*, regular at 1 with c_beta(1)=1. The products c_Q=∏_{beta∈Phi_Q} c_beta(lambda^beta∨) form a family; c_M=Σ_F ∏_{beta∈F}c_beta'(1), where F ranges over root subsets forming a basis of a_M^{G,*}.

Source: S19, Theorem4.2.4 pp24–26.

Uses: AS.6.25; AS.6.26; `AA.0/restricted-haar-product`; AS.6.7; AS.6.8.

### AS.6.29 — Root-coordinate Haar integral

`yu_053`

For a root basis F and continuous functions fβ on S¹, the root-coordinate homomorphism p:Im X_M^G→(S¹)^F is surjective with finite kernel and pushes probability Haar to probability Haar. Thus ∫∏β fβ(pβ(λ))dλ=∏β(1/(2πi))∮ fβ(z)dz/z. Equivalently, including ∏βpβ(λ) in the integrand gives ∏β(1/(2πi))∮ fβ(z)dz, as in Yu Lemma4.2.5.

Source: S19, Lemma4.2.5 p26.

Uses: AS.6.24; AS.6.28; `AA.0/restricted-haar-product`.

### AS.6.30 — Argument-principle integral of a family

`yu_054`

Assume each c_beta is meromorphic on a neighborhood of the closed unit disk and nonzero and finite on S1. For the ratio root-product family, its integrated regularized value is Σ_F∏_{beta∈F}(N(c_beta)−P(c_beta)), counting multiplicities in |z|<1. Rational L-ratios satisfy the needed extension assumption when boundary singularities are absent.

Source: S19, Corollary4.2.6 p27.

Uses: AS.6.28; AS.6.29; `AA.0/restricted-haar-product`.

### AS.6.31 — Ambient independence and central-translation vanishing

`yu_055`

(a) [Lemme 4.2.7] If c_Q(λ)=∏_{β in Φ_Q} c_β(λ^{β^∨}) as in Théorème 4.2.4, then for every L in L(M) the value c^R_M is independent of R in P(L) (write c^L_M): c^R_Q=∏_{β in Φ(Z_M,N_Q)}c_β(λ^{β^∨})·∏_{β in Φ(Z_M,N_R)}c_β(λ^{β^∨}), and the second factor tends to 1. (b) [Lemme 4.2.8] Let μ0 in X_M^G and let (c_Q) be a (G,M)-family on a domain containing μ0^Z such that c^R_M is independent of R in P(L) for every L in L(M) and c_Q(λμ0)=c_Q(λ) wherever c_Q is defined. Then lim_{λ→1}Σ_{Q in P(M)} θ_Q(λμ0)^{-1}c_Q(λμ0)=0 unless μ0 in X_G^G, and for μ0 in X_G^G it equals μ_{01}^{−dim a_M^G} c_M, where μ_{01} is the (common) first coordinate of μ0.

Source: S19, Lemmas4.2.7–4.2.8 pp27–29.

Uses: AS.6.26; AS.6.27; AS.6.28; `AA.0/restricted-haar-product`; AS.6.7; AS.6.8.

### AS.6.32 — Finite-kernel torus Fourier inversion

`yu_062`

For L=L_w, the map mu_w:Im X_L^G×Im X_M^L→Im X_M^G, (mu,lambda')↦lambda' mu/w^−1(lambda'), is surjective with finite kernel of size |w||X_L^L|, where |w| is the product of cycle lengths. Haar Fourier inversion converts the character sum into a normalized sum over its finite fibres.

Source: S19, §5.2.3 pp34–35.

Uses: AS.0.20; AS.0.21; AS.0.22; AS.0.23; AS.0.24; `AA.0/restricted-haar-product`; B13; B14; B15.

### AS.6.33 — Corrected Arthur–Lafforgue spectral expression

`yu_063`

For G=GL_n over F_q(X), n>0, the everywhere-unramified trace at T=0 is J_eta=Σ_[(P,pi)] |stab(P,pi)|⁻¹ Σ_[(w,tau)∈stab(P,pi)] ∫_(lambda∈A) D⁻¹ Σ_[(a,c)∈mu_w⁻¹(tau)] F_eta(lambda,a,c) d lambda. Here A=Im X_L^G, B=Im X_M^L, L=L_w, mu_w(a,c)=a*c/w⁻¹(c), D=|w||X_L^L|, and F_eta is the exact ordered regularized trace151 with h_Q(v)=hat1_Q(v eta⁻¹). Haar on A has total mass one, including all components. The finite fibre is equivalently a∈A,b∈B0,tau=a*b,c∈B,δ_w(c)=b. Replacing h_Q by hat1_Q^e gives J_e for every e∈Z. No good-representative hypothesis is required for this spectral identity. The scalar specialization uses compatible spherical vectors, intertwiners, L-factors and Haar measures. Here F_η is the ordered operator trace defined in AS.6/yu-151; both the all-lifts fiber sum and D⁻¹ are retained.

Source: S19, Theorem5.2.2 andCorollary5.2.3 pp33–36; corrected Laf97 theorem.

Uses: AS.4.12; AS.6.19; AS.6.20; AS.3.13; AS.2.14; AS.6.32; AS.6.34; AS.6.35; `AA.0/restricted-haar-product`.

### AS.6.34 — Typed finite-fibre operator trace

`yu_151`

For a discrete pair (P,pi), (w,tau)∈stab(P,pi), L=L_w, a∈A, b∈B0, tau=a*b and c∈B with δ_w(c)=b, put z=lambda*c for lambda∈A. Define R_Q(z;v)=M_(R|P)(z)⁻¹∘M_(R|P)(z/v), where R∈P^Q(M), v∈X_L^G. For h_Q=hat1_Q(·eta⁻¹) or hat1_Q^e, set F_h(lambda,a,c)=lim_(mu→1 in X_L^G) Tr_(A_P,pi)[(Σ_(Q∈P(L))h_Q(mu*a) R_Q(z;mu*a))∘M(w,w⁻¹(c))∘U_tau]. U_tau is multiplication by tau. The Q-sum is continued holomorphically before evaluation at mu=1; the other parameters are unitary.

API:

- `stabilizerTransport`: U_tau:A_P,pi→A_P,pi⊗tau followed by M(w,w⁻¹c):A_P,pi⊗tau→A_P,w(pi⊗tau)=A_P,pi closes the endomorphism because stab means w(pi⊗tau)=pi.
- `regularizedFamily`: For a fixed fibre and lambda form the meromorphic Q-sum, prove its extension near mu=1 by adjacent-wall gluing, then take the finite-dimensional trace.
- `spectralContribution`: Integrate F_h over probability Haar on A and average over the D-point fibre; multiply by |stab(P,pi)|⁻¹. Choice of R within P^Q(M) does not change the operator.

Tests:

- `test1`: For all cycle lengths one, count the actual finite kernel of the map (a,c)↦aδ(c) on the constructed A×B cover: its cardinal is ∏d_j, retaining every finite component.
- `test2`: In the general stabilizer case U_tau alone need not end in A_P,pi; the trace is formed only after the Weyl transport closes the endomorphism.
- `test3`: For M=L=G the parabolic sum has one term and R_G(z;v)=Id; the formula reduces to the finite character average of h_G(a) times Tr(M(1,c)∘U_tau).

Source: S19, §§5.2.2–5.2.3 pp32–36.

Uses: AS.4.12; AS.3.13; AS.2.14; AS.0.20; AS.0.22; `AA.0/restricted-haar-product`; AS.6.25; AS.6.26.

### AS.6.35 — Degree Fourier recovery of the spectral contribution

`yu_152`

Let n>0, zeta primitive of order n and eta=zeta^deg. If J_(eta^k)=Σ_(e mod n)zeta^(ek) J_e, then J_e=n⁻¹Σ_(k mod n)zeta^(−ek)J_(eta^k). In151 this replaces hat1_Q(mu*a*eta^(−k)) by hat1_Q^e(mu*a)=n⁻¹Σ_k zeta^(ek)hat1_Q(mu*a*eta^k), leaving the fibre, operator order and denominator unchanged. It holds for every integer e, not just coprime e.

Source: S19, §§5.2.2–5.2.3 pp32–36.

Uses: AS.3.13; AS.6.34; `AA.0/restricted-haar-product`; B13; B14; B15.

### AS.6.36 — Twisted truncated trace and its degree decomposition

`yu_164`

Let n≥1, ζ an n-th root of unity and η=ζ^{deg det} in X_G^G. Define J^T_η:=∫_{G(F)\G(A)/Ξ_G} η(g)k^T(g,g)dg, with k^T Arthur's truncated kernel (item 024) and Ξ_G=a^Z (a a fixed idele of degree 1, as a scalar matrix, so deg det a=n). Since G(F) ⊂ G(A)^0, k^T(g,g) is Ξ_G-invariant, and G(F)\G(A)^e → G(F)\G(A)/Ξ_G is a measure-preserving bijection onto the classes with deg det ≡ e (mod n), one has J^T_η=Σ_{e=1}^n ζ^e J^T_e with J^T_e=∫_{G(F)\G(A)^e}k^T(x,x)dx, and J^T_e depends only on e mod n. Hence, for ζ primitive, J^T_{η^k}=Σ_{e=1}^nζ^{ek}J^T_e for all k in Z and J^T_e=n^{-1}Σ_{k=1}^nζ^{−ek}J^T_{η^k} for all e in Z.

Source: S19, §5.2.3, p. 33, equation (5.2.8); p. 36, displays before Corollaire 5.2.3.

Uses: `AA.0/restricted-haar-product`; AS.6.19; AS.6.35.

### AS.6.37 — Lafforgue's spectral expansion before Fourier inversion, twisted by η

`yu_165`

(Lafforgue 1997, VI §2, through Lemme 9 and Corollaire 10, with the change of variable μ_Q ↦ μ_Qη^{-1} at the start of step (e), p. 304.) For G=GL_n over the function field F of X_1 and η in X_G^G, J_η=J_η^{T=0} equals the sum, over inertial classes of everywhere-unramified discrete pairs (P,π) and over continuous characters χ of Im X_{M_P}^G, of |stab(P,π)|^{-1}Σ_{(w,λ_π) in stab(P,π)} lim_{μ0 in X_{L_w}^G, μ0→1} Σ_{Q in P(L_w)} ∫_{Im X_{L_w}^G}∫_{Im X_{M_P}^G} 1̂_Q(μμ0η^{-1}) χ(λ w(λ_π)μ0μ/w(λ)) Tr_{A_{P,π}}(M_Q(λ,P;μμ0) ∘ M(w^{-1},w(λ)) ∘ w(λ_π)^{-1}) dλ dμ, with probability Haar measures. The Q-sum is continued holomorphically as a whole before μ0→1 (Laf97 Corollaire 10), using the isometry of intertwiners on the unitary axis, the functional equation, and the relations w(λ0)^{H_P}M(w,λ)φ=M(w,λλ0^{-1})(φλ0^{H_P}) and M(w,λμ)=M(w,λ) for μ in X_{L_w}^G.

Source: S19, §5.2.3, p. 34, proof of Théorème 5.2.2, equation (5.2.10).

Uses: `AA.0/restricted-haar-product`; AS.2.14; AS.6.36; AS.6.34; AS.0.24.

### AS.6.38 — Arthur's root-basis identity for θ-sums

`yu_169`

Let m=dim a_M^G and β_1,…,β_m distinct elements of Φ(Z_M,G). For ξ in a_{M,C}^* with ⟨ξ,α^∨⟩≠0 for all α in Φ(Z_M,G), Σ'_Q θ_Q(ξ)^{-1}∏_{j=1}^m⟨ξ,β_j^∨⟩, summed over the Q in P(M) with {β_1,…,β_m} ⊆ Φ_Q, equals 0 if the β_j are linearly dependent and 1 if they form a basis of a_M^{G,*}. Here θ_Q is Yu's unnormalized θ_Q. In type A every basis of relative coroots generates the full lattice {x in Z^r: Σx=0}, so Arthur's volume factors cancel.

Assume: G=GL_n with a specified block Levi M and Yu’s unnormalized θ; m=dim a_M^G, the β_j are distinct relative roots, and every relative-coroot pairing with ξ is nonzero. The selected parabolics contain all β_j. The value1 uses type-A unimodularity; for another root system a covolume factor must be retained.

Source: S19, §4.2.3 proof of Théorème4.2.4, p.26, k=m case; citing Ar82 pp.1319–1320.

Uses: AS.3.1; AS.3.10; `AA.3/relative-chamber`.

## Library prerequisites

B labels identify the following declarations at Mathlib `082e2d37` and Tau Ceti `f7904748`.

- **B1**: `mathlib:MeasureTheory.L2.inner_def`.
- **B2**: `mathlib:MeasureTheory.integral_prod`.
- **B3**: `mathlib:MeasureTheory.integral_tsum`.
- **B4**: `mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le`.
- **B5**: `mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le`.
- **B6**: `mathlib:WithSeminorms.banach_steinhaus`.
- **B7**: `mathlib:Complex.regularizedHGFun`.
- **B8**: `mathlib:Complex.radius_regularizedHGFunSeries_eq_top`.
- **B9**: `mathlib:Complex.betaIntegral_eq_Gamma_mul_div`.
- **B10**: `mathlib:Complex.Gamma_mul_Gamma_add_half`.
- **B11**: `tauceti:TauCeti.stdPeterWeylBasis`.
- **B12**: `tauceti:IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`.
- **B13**: `mathlib:MonoidHom.measurePreserving`.
- **B14**: `mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable`.
- **B15**: `mathlib:AddChar.expect_eq_ite`.
- **B16**: `mathlib:UpperHalfPlane.cosh_dist`.
- **B17**: `mathlib:UpperHalfPlane.tanh_half_dist`.
- **B18**: `tauceti:TauCeti.vitali`.
- **B19**: `mathlib:SchwartzMap`.
- **B20**: `mathlib:SchwartzMap.postcompCLM`.
- **B21**: `mathlib:LinearMap.IsSymmetric.eigenvectorBasis`.
- **B22**: `tauceti:IsCompactOperator.finiteDimensional_eigenspace`.
- **B23**: `tauceti:TauCeti.isFredholm_one_sub`.
- **B24**: `tauceti:ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`.
- **B25**: `mathlib:TestFunction`.
- **B26**: `mathlib:TestFunction.topologicalSpace`.
- **B27**: `mathlib:AddChar.complexBasis`.
- **B28**: `mathlib:Module.AEval'`.
- **B29**: `mathlib:Module.AEval'.X_smul_of`.
- **B30**: `mathlib:zeta_eq_tsum_one_div_nat_add_one_cpow`.
- **B31**: `tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant`.
- **B32**: `mathlib:ArithmeticFunction.moebius`.

## References

- **S1 (yetter)**: David N. Yetter, [Measurable Categories](https://arxiv.org/pdf/math/0309185). arXiv:math/0309185v2, 6 September 2004.

- **S2 (teschl)**: Gerald Teschl, [Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf). author PDF of second edition.

- **S3 (arthur05)**: James Arthur, [An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf). Clay Mathematics Proceedings 4 (2005), 1–263.

- **S4 (langlands)**: Robert P. Langlands, [On the Functional Equations Satisfied by Eisenstein Series](https://publications.ias.edu/sites/default/files/functional-equations-eisenstein_rpl_8.pdf). IAS electronic transcription, 235 PDF pages, dated 2 December2015 and updated 22 July2016, of LNM544(1976); AppendixIII includes editorial reconstruction notices; not collated against the printed 337-page edition.

- **S5 (langlands66)**: Robert P. Langlands, [Eisenstein Series](https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf). Proc. Sympos. Pure Math. 9 (1966), 235–252, IAS transcription.

- **S6 (arthur78)**: James Arthur, [A Trace Formula for Reductive Groups I: Terms Associated to Classes in G(Q)](https://www.claymath.org/library/cw/arthur/pdf/7.pdf). Duke Math. J. 45 (1978), 911–952.

- **S7 (arthur80)**: James Arthur, [A Trace Formula for Reductive Groups II: Applications of a Truncation Operator](https://www.claymath.org/library/cw/arthur/pdf/9.pdf). Compositio Math. 40 (1980), 87–121.

- **S8 (arthur81)**: James Arthur, [The Trace Formula in Invariant Form](https://www.claymath.org/library/cw/arthur/pdf/10.pdf). Annals of Math. 114 (1981), 1–74.

- **S9 (arthur82ms)**: James Arthur, [On the Inner Product of Truncated Eisenstein Series](https://www.claymath.org/library/cw/arthur/pdf/12.pdf). Duke Math. J. 49 (1982), 35–70.

- **S10 (arthur83pw)**: James Arthur, [Multipliers and a Paley-Wiener Theorem for Real Reductive Groups](https://www.claymath.org/library/cw/arthur/pdf/17.pdf). 1983 expository article, Arthur archive no.17.

- **S11 (arthur83acta)**: James Arthur, [A Paley-Wiener Theorem for Real Reductive Groups](https://www.claymath.org/library/cw/arthur/pdf/15.pdf). Acta Math. 150 (1983), 1–89.

- **S12 (arthur88local)**: James Arthur, [The Invariant Trace Formula I: Local Theory](https://www.claymath.org/library/cw/arthur/pdf/26.pdf). JAMS 1 (1988), 323–383.

- **S13 (arthur88global)**: James Arthur, [The Invariant Trace Formula II: Global Theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf). JAMS 1 (1988), 501–554.

- **S14 (arthur89weighted)**: James Arthur, [Intertwining Operators and Residues I: Weighted Characters](https://www.claymath.org/library/cw/arthur/pdf/28.pdf). J. Funct. Anal. 84 (1989), 19–84.

- **S15 (arthur89lefschetz)**: James Arthur, [The L²-Lefschetz Numbers of Hecke Operators](https://www.claymath.org/library/cw/arthur/pdf/32.pdf). Invent. Math. 97 (1989), 257–290.

- **S16 (clozeldelorme90)**: Laurent Clozel and Patrick Delorme, [Le théorème de Paley-Wiener invariant pour les groupes de Lie réductifs II](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf). Ann. ENS 23 (1990), 193–228.

- **S17 (franke)**: Jens Franke, [Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf). Ann. ENS 31 (1998), 181–279.

- **S18 (wallach)**: Nolan R. Wallach, [On the Constant Term of a Square Integrable Automorphic Form](https://mathweb.ucsd.edu/~nwallach/tempered-cuspidal.pdf). Monogr. Stud. Math. 18 (1984), 227–237, author scan.

- **S19 (yu23)**: Hongjie Yu, [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5). arXiv:1807.04659v5, 18 July 2022.

- **S20 (jiangzhang20)**: Dihua Jiang and Lei Zhang, [Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4). arXiv:1508.03205v4.

- **S21 (dit16)**: William Duke, Özlem İmamoğlu and Árpád Tóth, [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Annals of Math. 184 (2016), 949–990.

- **S22 (dit11)**: William Duke, Özlem İmamoğlu and Árpád Tóth, [Cycle Integrals of the j-Function and Mock Modular Forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf). Annals of Math. 173 (2011), 947–981.

- **S23 (cg20)**: Frank Calegari and David Geraghty, [Minimal Modularity Lifting for Non-regular Symplectic Representations](https://arxiv.org/pdf/1907.08691). arXiv:1907.08691v1, July 2019.

- **S24 (cgh20)**: Frank Calegari, David Geraghty and Michael Harris, [Bloch–Kato Conjectures for Automorphic Motives](https://arxiv.org/pdf/1907.08694). arXiv:1907.08694v1, July2019.

- **S25 (bcg25)**: George Boxer, Frank Calegari and Toby Gee, [Cuspidal Cohomology of GLₙ(Z) and SLₙ(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf). author WeightZero PDF.

- **S26 (bpcz22)**: Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, [The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf). Publ. Math. IHES 135 (2022), 183–337.

- **S27 (ct20)**: Gaëtan Chenevier and Olivier Taïbi, [Discrete Series Multiplicities for Classical Groups over Z and Level 1 Algebraic Cusp Forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHES 131 (2020), 261–323.

- **S28 (bcgp21)**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Abelian Surfaces over Totally Real Fields Are Potentially Modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publ. Math. IHES 134 (2021), 153–501.

- **S29 (gz86)**: Benedict H. Gross and Don B. Zagier, [Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Invent. Math. 84 (1986), 225–320.

- **S30 (shapiro25)**: Jacob Shapiro, [Functional Analysis: Princeton University MAT520 Lecture Notes](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT520_fall_2025/MAT520_Lecture_Notes.pdf). Fall 2025; last typeset 10 December 2025.
