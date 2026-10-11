# Periods, motivic L-values and special-value conjectures — PS.8–PS.9

This part builds two explicit arithmetic-period routes. PS.8 starts with the resolved Dwork quartic, derives its period equation from its residue class, fixes the coordinate using an integral marking and monodromy, and proves mirror-map integrality through the quartic modular relation. A separate quintic example computes normalized Frobenius in a formal cohomology basis. Its integral crystalline and limiting-lattice comparison remains an explicitly identified input; no integral action is inferred from the formal matrix alone.

PS.9 constructs convergent multiple zeta values, their word products and tangential regularization, then the mixed-Tate category over Z and the actual motivic period map. The proof route for Brown’s basis theorem includes the one-three evaluation, coaction kernel and 2-adic cut-matrix argument. Applying the period map yields numerical spanning and upper dimension bounds. Numerical independence and period injectivity are separate conjectures.

All statements below are proposed mathematics, not implementation claims. The packet is complete as a target-level planning pass, with both layers **planned**, and is not **closed**: the supplier interfaces and four precise obligations listed below remain. The reader is definitive; the suggested Lean file proposes signatures with missing supplier-dependent conditions identified by name. It does not establish the theorems.

## Conventions and existing work

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The current read-only TauCetiRoadmap and TauCeti trees were also screened, so the plan reuses existing work beyond the older atlas snapshot. Algebraic relative Gauss–Manin and de Rham–Betti comparison are imported from ComplexComparisonPartII:C5, not redefined as a new connection theory. Generic geometric motives, neutral Tannaka reconstruction and comparison torsors belong to MC.4 and MC.6. Generic unipotent groupoids belong to NC.2.

Mathlib’s interval integral is reused for interior iterated integrals. Its ordinary hypergeometric series supplies the rank-two 2F1 series, not a 3F2 definition or continuation theorem. Its formal exponential and compositional inverse are reused. Tau Ceti’s coaugmented TensorWords already includes length zero and all-cut deconcatenation. The computational word coordinates below are a presentation of this module; shuffle is a different multiplication from its existing concatenation.

For the quartic, t is the geometric parameter and z=(4t)⁻⁴ is the normalized mirror parameter. Hartmann sometimes calls t⁻⁴ the hypergeometric parameter and calls our z “w”; that factor 256 is retained in every comparison. Matrices act on columns of basis inputs. For MZVs the summation indices decrease and the first exponent is at least two. Brown’s and Zagier’s increasing-index convention is converted by reversing the entire index list, and Brown’s increasing-time integral word is the reverse of our largest-time-first word. The motivic coaction has the unipotent/de Rham algebra in its first factor and H in its second factor. ζ^m(2) remains in H.

## PS.8 — Arithmetic mirror symmetry and period equations

### The resolved Dwork quartic family

Named target: `quartic_pencil`; packet node `PeriodsAndSpecialValues:PS.8/quartic-pencil`.

For t in B = A¹_C minus {t : t⁴ = 1}, F_t is Σ_i X_i⁴ − 4tX_0X_1X_2X_3 = 0 in P³. Let G = {(a_i) in μ₄⁴ : Πa_i = 1}/diagonal μ₄. Define X→B as the simultaneous minimal resolution of F/G. The quotient has six A₃ singularities; X→B is proper smooth with K3 fibres. Retain the quotient map and the exceptional divisors. t=0 is a smooth Fermat fibre; t=∞ is a degeneration. The coarse coordinate z=(4t)⁻⁴ is used only on t≠0.

Construction or proof route: Check the Jacobian criterion for F_t away from t⁴=1. Form the explicit invariant quotient ΣY_i−4tY₄=0, Π_{i<4}Y_i=Y₄⁴ in P⁴. Resolve the six A₃ loci relatively as in the source; import the general quotient, resolution and cohomological realisation interfaces from the geometry supplier, rather than inventing a generic resolution theory.

Direct inputs: `MotivesAndAlgebraicCycles:MC.2`.

The API serves the source calculation and this layer’s consuming targets:

- `quartic_polynomial` (data): The homogeneous equation is ΣX_i⁴−4tΠX_i.
- `quartic_group` (data): G is the product-one subgroup of μ₄⁴ modulo its diagonal μ₄; its order is 16.
- `quartic_resolution` (projection): The proper resolution X→F/G is an isomorphism away from the six A₃ sections.

Unit tests distinguish the construction:

- `quartic_fermat_test` (computation): At t=0 the equation is ΣX_i⁴.
- `quartic_singular_test` (non-example): At t=1 the point [1:1:1:1] is singular; t=1 is excluded from B.
- `quartic_zero_test` (non-example): t=0 belongs to B although z has a pole there; an ODE singularity after quotienting parameters need not be a singular geometric fibre.

Source: [Heinrich Hartmann, Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), §§2.1–2.5, pp.2–4; §4.1, pp.10–11.

### The normalized quartic residue form

Named target: `quartic_residue`; packet node `PeriodsAndSpecialValues:PS.8/quartic-residue`.

Let Ξ_t=(Σ_i (−1)^i X_i dX_0∧⋯∧hat(dX_i)∧⋯∧dX_3)/F_t. Use Hartmann’s tube-normalized residue, containing a factor 2πi. Its G-invariant residue descends and extends to a nowhere-vanishing relative two-form Ω on X/B. In the affine chart X_0=1 its local expression is 2πi dz₁∧dz₂/(4z₃³−4tz₁z₂).

Construction or proof route: Compute the residue on charts where the indicated partial derivative is nonzero and glue. Use G-invariance and the crepant minimal resolution to descend and extend the form. Retain the tube integration convention in the Betti comparison.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-pencil`, `PeriodsAndSpecialValues:PS.0`, `ComplexComparisonPartII:C5/gauss-manin-connection`.

The API serves the source calculation and this layer’s consuming targets:

- `quartic_residue_local` (simp): On the indicated smooth chart Ω has the displayed 2πi-normalized expression.
- `quartic_residue_invariant` (compatibility): Pullback of Ω to F_t equals the G-invariant residue of Ξ_t.
- `quartic_residue_period` (compatibility): Integration over a two-cycle equals the tube integral of Ξ_t with the same residue convention.

Unit tests distinguish the construction:

- `quartic_residue_factor_test` (computation): At t=0 the local denominator is 4z₃³, and the numerator still contains 2πi.
- `quartic_residue_invariance_test` (compatibility): A product-one diagonal μ₄ substitution leaves the descended form unchanged.
- `quartic_residue_chart_test` (non-example): The displayed quotient is a chart formula only where 4z₃³−4tz₁z₂ is nonzero; zero denominator does not make Ω singular on X_t.

Source: [Heinrich Hartmann, Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), §4.4, pp.16–17.

### Quartic Gauss–Manin reduction

Named target: `quartic_picard_fuchs`; packet node `PeriodsAndSpecialValues:PS.8/quartic-picard-fuchs`.

On B the Gauss–Manin class Ω satisfies D_tΩ=0, where D_t=∂_t³−(6t³∂_t²+7t²∂_t+t)/(1−t⁴). Every locally horizontal two-cycle γ gives D_t∫_γΩ=0. With z=(4t)⁻⁴ and y=t∫_γΩ, the equation becomes L_z y=0 with L_z=θ³−4z(4θ+1)(4θ+2)(4θ+3), θ=z∂_z. The singular coarse parameters are 0,1/256,∞. The pullback identity is L_z=(1−t⁴)/64 · D_t∘m_{1/t}, not D_t∘m_t.

Construction or proof route: Reduce the third parameter derivative of the rational residue form modulo exact forms, using the Jacobian relations in the source. Apply the horizontal-cycle pairing, then θ=−t∂_t/4. Expand the operators to check the scalar and the direction of the multiplication operator.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-residue`, `ComplexComparisonPartII:C5/gauss-manin-connection`.

Acceptance: The constant input gives L_z(1)=−24z=−3/(32t⁴) after pullback. Raw periods have the asymptotic t⁻¹w₀((4t)⁻⁴), not tw₀.

Source: [Heinrich Hartmann, Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), Proposition 4.14, pp.16–17; Proposition 4.26, p.21, corrected by E1.

### The quartic transcendental lattice and marking

Named target: `quartic_lattice`; packet node `PeriodsAndSpecialValues:PS.8/quartic-lattice`.

Use T₀=⟨4⟩⊕U on the ordered basis (h,e,f), Gram matrix G₀=[[4,0,0],[0,0,1],[0,1,0]]. The rank-19 primitive lattice M₂ lies in H²(X_t,Z), and its orthogonal complement is the constant marked rank-three lattice T₀ on the universal cover. M₂⊕T₀ gives a rational splitting; do not assert an integral direct sum. The period line is [p h−e+2p²f] for p in the upper half-plane.

Construction or proof route: Use the quotient/resolution cycles and polarization to construct the marking of the primitive sublattice. Compute the orthogonal complement and discriminate its integral gluing from the rational orthogonal decomposition.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-pencil`, `PeriodsAndSpecialValues:PS.0`.

The API serves the source calculation and this layer’s consuming targets:

- `quartic_gram` (data): The marked pairing has matrix G₀ and determinant −4.
- `quartic_period_line` (data): p maps to [p,−1,2p²], whose self-pairing is zero.
- `quartic_marking_transport` (functoriality): Marked cycles transport along based paths and transport respects concatenation and the pairing.

Unit tests distinguish the construction:

- `quartic_gram_test` (computation): h²=4, e²=f²=0 and e·f=1.
- `quartic_isotropic_test` (computation): For v=(p,−1,2p²), vᵀG₀v=0.
- `quartic_discriminant_test` (non-example): det G₀=−4, so T₀ is not the unimodular lattice ⟨1⟩⊕U.

Source: [Heinrich Hartmann, Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), Theorem 4.8 and Proposition 4.12, pp.13–16; Proposition 4.24, p.20.

### Integral quartic monodromy and period normalization

Named target: `quartic_monodromy`; packet node `PeriodsAndSpecialValues:PS.8/quartic-monodromy`.

At t₀=i/√2 use Hartmann Figure 2 based loops around i,−1,−i,1. In the convention PT_γ(h,e,f)=(h,e,f)M_γ, the matrices are M₁=[[1,0,0],[0,0,1],[0,1,0]], M₂=[[5,1,−3],[−12,−2,9],[4,1,−2]], M₃=[[17,6,−6],[−24,−8,9],[24,9,−8]], M₄=[[5,3,−1],[−4,−2,1],[12,9,−2]], M∞=[[1,4,0],[0,1,0],[−16,−32,1]]. They satisfy M_iᵀG₀M_i=G₀ and M∞M₄M₃M₂M₁=1. For Ω=a h+b e+c f, the row (a,b,c) continues by G₀M_γG₀⁻¹. The coordinate p=−a/b transforms at infinity by p↦p+4 and for γ₁ by p↦−1/(2p).

Construction or proof route: Compute Picard–Lefschetz reflections in the explicitly marked vanishing cycles; multiply in the source’s based-loop order. Pass to the dual period pairing rather than applying the cycle matrix directly to the coordinate row. Use the period-line formula to obtain the Möbius transformations.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-lattice`, `PeriodsAndSpecialValues:PS.8/quartic-picard-fuchs`.

Acceptance: (M∞−1)³=0 but (M∞−1)²≠0. Both the translation and reflection are required to normalize the analytic ratio.

Source: [Heinrich Hartmann, Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), Theorem 4.8, pp.13–16; Propositions 4.21–4.25, pp.19–21.

### The quartic Frobenius solutions

Named target: `quartic_frobenius_series`; packet node `PeriodsAndSpecialValues:PS.8/quartic-frobenius-series`.

Put A_n=(4n)!/(n!)⁴, H_n^(r)=Σ_{j=1}^n j⁻ʳ, H_n=H_n^(1), g_n=4A_n(H_{4n}−H_n), h_n=A_n(16(H_{4n}−H_n)²−16H_{4n}^(2)+4H_n^(2)). Define w₀=ΣA_nzⁿ, g=Σg_nzⁿ, h=Σh_nzⁿ. On a chosen logarithm branch, f₀=w₀, f₁=w₀log z+g, f₂=w₀(log z)²/2+g log z+h/2 form a solution basis for L_z on 0<|z|<1/256. These are periods of tΩ after geometric normalization, rather than Ω itself.

Construction or proof route: Introduce A_n(ρ)=Π_{k=1}^{4n}(4ρ+k)/Π_{k=1}^n(ρ+k)⁴. Differentiate z^ρΣA_n(ρ)zⁿ up to order two at ρ=0, with factorial normalization. The coefficient recurrence n³A_n=4(4n−3)(4n−2)(4n−1)A_{n−1} gives the equation; the ρ-family has residual ρ³z^ρ, which disappears in these derivatives. Apply the ratio test and the distinct logarithmic orders.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-picard-fuchs`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.derivative`.

The API serves the source calculation and this layer’s consuming targets:

- `quartic_coefficient_recurrence` (relation): For n≥1 the displayed third-order recurrence holds.
- `quartic_frobenius_analytic` (compatibility): The formal series define the indicated holomorphic/logarithmic solutions on the radius-1/256 punctured disk.
- `quartic_frobenius_initial` (simp): A₀=1 and g₀=h₀=0; these pin the logarithmic solution’s additive constant.

Unit tests distinguish the construction:

- `quartic_coefficients_test` (computation): A₁=24, A₂=2520 and A₃=369600.
- `quartic_log_coefficient_test` (computation): g₁=104 and g₂=12276.
- `quartic_empty_harmonic_test` (degenerate): H₀^(r)=0, so g₀=h₀=0.

Source: [Heinrich Hartmann, Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), §4.7, pp.21–23, formulas preceding Theorem 4.29.

### Quartic hypergeometric symmetric square

Named target: `quartic_symmetric_square`; packet node `PeriodsAndSpecialValues:PS.8/quartic-symmetric-square`.

On |256z|<1, w₀(z) = ₂F₁(1/8,3/8;1;256z)² = ₃F₂(1/4,1/2,3/4;1,1;256z). Use the existing ordinary hypergeometric series only for ₂F₁. The rank-three equation is the symmetric square of the corresponding rank-two equation.

Construction or proof route: Apply the parameter-specialized second-order equation and derive its symmetric-square third-order operator. Match the normalized analytic solutions at zero using their coefficient recurrences; this identity is an analytic hypergeometric identity, not by itself the Betti period comparison.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-frobenius-series`, `mathlib:ordinaryHypergeometricSeries`.

Acceptance: The coefficient of z is 24 on both sides.

Source: [Bong H. Lian and Shing-Tung Yau, Mirror maps, modular relations and hypergeometric series I](https://arxiv.org/pdf/hep-th/9507151), Proposition 3.1 and proof, pp.3–4; specialization λ=256, ν=1/4.

### Quartic local continuation and reflection

Named target: `quartic_local_continuation`; packet node `PeriodsAndSpecialValues:PS.8/quartic-local-continuation`.

Near t=1 on a slit neighbourhood, let U₁=Γ(1/8)²/Γ(1/2)·₂F₁(1/8,1/8;1/2;1−t⁴) and U₂=Γ(5/8)²/Γ(3/2)·(t⁴−1)^(1/2)₂F₁(5/8,5/8;3/2;1−t⁴). For the branch obtained by continuation from the chosen large-t ray, p=i/√2·(U₁+cot(π/8)U₂)/(U₁−cot(π/8)U₂). Changing the square-root branch sends U₂ to −U₂ and hence p to −1/(2p). This is the correctly parameterized expression from Nagura–Sugiyama; Hartmann’s first upper parameter pair is corrected by E2.

Construction or proof route: Use the Euler integral and the beta/Gamma identity to continue the rank-two hypergeometric solutions from t⁻⁴ to 1−t⁴; the inversion changes the two upper parameters to equal pairs. Differentiate in the Frobenius parameter to obtain the logarithmic companion and the Gamma factors. Fix the branches by the real logarithm at t=i√2 and continue along the source’s paths. The square-root sign change gives the reflection; together with the infinity translation this fixes the additive constant by Hartmann Proposition 4.25.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-symmetric-square`, `PeriodsAndSpecialValues:PS.8/quartic-frobenius-series`, `mathlib:Complex.Gamma_mul_Gamma_eq_betaIntegral`, `mathlib:Complex.Gamma_mul_Gamma_one_sub`.

Acceptance: The first regular solution has coefficient 1/32 at u=1−t⁴=0; Hartmann’s erroneous 1/8,3/8 pair would give 3/32. At U₂=0 the fixed point is p=i/√2.

Source: [Masaru Nagura and Katsuyuki Sugiyama, Mirror Symmetry of K3 and Torus](https://arxiv.org/pdf/hep-th/9312159), §3.3, formula (26), p.9; §5.2, formula (39), p.14.

### The normalized mirror coordinate

Named target: `quartic_mirror_coordinate`; packet node `PeriodsAndSpecialValues:PS.8/quartic-mirror-coordinate`.

In Q[[z]], q(z)=z exp(g(z)/w₀(z)); define Z(q) as its compositional inverse, which exists since q₀=0 and q₁=1. The analytic period coordinate is p=(2πi)⁻¹ f₁/f₀ on the chosen branch, hence exp(2πip)=q(z). Match this p to the geometric marked p by the monodromy theorem, not merely by L_z. Use log z real on the chosen ray t=i√2 and analytic continuation from it.

Construction or proof route: Form the exponential because g/w₀ has zero constant term and w₀ is a unit. Reuse the generic formal-series inverse from Mathlib. Use the local-continuation theorem (corrected E2), maximal-unipotent translation and Hartmann Proposition 4.25 to match the ratio to the integral marking. The common t-rescaling cancels from the ratio.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-frobenius-series`, `PeriodsAndSpecialValues:PS.8/quartic-monodromy`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.substInv`, `PeriodsAndSpecialValues:PS.8/quartic-local-continuation`.

The API serves the source calculation and this layer’s consuming targets:

- `quartic_mirror_initial` (simp): coeff₀(q)=0 and coeff₁(q)=1.
- `quartic_mirror_inverse` (relation): q∘Z=Z∘q=X as formal series.
- `quartic_mirror_period` (compatibility): On the stated branch q=exp(2πip) for the marked geometric period coordinate.

Unit tests distinguish the construction:

- `quartic_mirror_coefficients_test` (computation): q=z+104z²+15188z³+2585184z⁴ modulo z⁵.
- `quartic_inverse_coefficients_test` (computation): Z=q−104q²+6444q³−311744q⁴ modulo q⁵.
- `quartic_scaling_test` (non-example): Replacing z by t⁻⁴ multiplies the parameter by 256 and changes the leading normalization; its series coefficients are not the stated coefficients in z.

Source: [Heinrich Hartmann, Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), Theorem 4.29 and Proposition 4.30, pp.22–23.

### The quartic modular relation

Named target: `quartic_modular_relation`; packet node `PeriodsAndSpecialValues:PS.8/quartic-modular-relation`.

Let x=1/j(q)=q+O(q²), where classical j is normalized by j=q⁻¹+744+⋯, and y=Z(q). Then P(x,y)=0, with P=−x²+xy−432x²y−207xy²−62208x²y²−y³+3456xy³−2985984x²y³. This statement uses the integral q-expansion and Schwarzian equation of the classical normalized j-invariant as a supplier input.

Construction or proof route: Substitute the algebraic modular relation into the Schwarzian equation and verify equality of the rational differential expressions. Match the normalized series at the cusp to select the branch. Keep j versus the source’s J=j/1728 distinct: x=1/(1728J).

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-mirror-coordinate`, `ModularCurvesPartII:R13.3`.

Acceptance: The degree-two homogeneous part is −x²+xy, so ∂_yP₂(1,1)=1.

Source: [Bong H. Lian and Shing-Tung Yau, Arithmetic Properties of Mirror Map and Quantum Coupling](https://arxiv.org/pdf/hep-th/9411234v3), §5.5, equation (5.19), pp.20–21; §§4–5.1 for normalization.

### Integrality of the quartic mirror map

Named target: `quartic_integrality`; packet node `PeriodsAndSpecialValues:PS.8/quartic-integrality`.

Every coefficient of Z(q) and q(z) is an integer. More precisely, for P in Z[x,y] whose least nonzero homogeneous part P_ℓ obeys P_ℓ(1,1)=0 and m=∂_yP_ℓ(1,1)≠0, for x(q)∈q+q²Z[[q]] and a normalized branch y(q)∈q+q²Q[[q]] with P(x,y)=0, coefficient induction gives y∈Z[1/m][[q]]. For the quartic relation ℓ=2 and m=1. No denominator prime is inverted in this integrality assertion; the geometry and crystalline good-prime restrictions are separate.

Construction or proof route: At each coefficient, the first occurrence of the new y-coefficient has multiplier m; the remainder is integral over Z[1/m] by induction. Include x=q+O(q²) among the hypotheses used by the source’s argument. Use x=1/j with its integral expansion and m=1. Formal inversion of a series with leading coefficient one preserves integer coefficients, giving integrality of q. Do not apply Lian–Yau’s prime-degree theorem to degree four.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quartic-modular-relation`, `mathlib:PowerSeries.substInv`.

Acceptance: Z₂=−104 and Z₃=6444 are integers. No enumerative identity or Frobenius congruence is inferred from this result.

Source: [Bong H. Lian and Shing-Tung Yau, Arithmetic Properties of Mirror Map and Quantum Coupling](https://arxiv.org/pdf/hep-th/9411234v3), §6, integral-branch lemma and quartic application, pp.21–23.

### The invariant Dwork quintic family

Named target: `quintic_pencil`; packet node `PeriodsAndSpecialValues:PS.8/quintic-pencil`.

For p an odd prime different from 5 and C_p a completed algebraic closure of Q_p, use V_λ: φ_λ=λΣ_{i=1}^5x_i⁵+Πx_i=0 in P⁴. Its smooth parameter locus is λ≠0 and 1+5⁵λ⁵≠0. The product-one diagonal μ₅ action modulo scalar μ₅ has order 125; the permutation group Σ₅ also acts. Select the rank-four invariant part of H³, not the full rank-204 cohomology. The formal point λ=0 is a degeneration and its limiting extension is not H³ of a smooth boundary fibre.

Construction or proof route: Compute the partial derivatives and the critical parameter equation. Construct the group-invariant projector over Q_p because p≠5. Use the homogeneous twisted de Rham description in the source for the selected invariant part. Do not identify it with an unproved resolved mirror quotient.

Direct inputs: `MotivesAndAlgebraicCycles:MC.2`.

The API serves the source calculation and this layer’s consuming targets:

- `quintic_polynomial` (data): φ_λ=λΣx_i⁵+Πx_i.
- `quintic_invariant_projector` (constructor): The projector is 125⁻¹Σ_{g∈G}g on H³, with compatible Σ₅ action.
- `quintic_smooth_locus` (characterisation): In characteristic zero the stated family is smooth exactly when λ≠0 and 1+5⁵λ⁵≠0.

Unit tests distinguish the construction:

- `quintic_zero_test` (degenerate): At λ=0 the equation is Πx_i=0, a union of coordinate hyperplanes.
- `quintic_rank_test` (non-example): The selected invariant space has dimension 4, whereas the full H³ has dimension 204.
- `quintic_group_test` (computation): The diagonal quotient group has order 125, so its averaging projector is not integral at p=5.

Source: [Ilya Shapiro, Frobenius map on quintic threefolds](https://arxiv.org/pdf/0809.3742v2), §§3.1–3.3, pp.3–5; §4.1.

### The formal quintic cohomology basis

Named target: `quintic_formal_connection`; packet node `PeriodsAndSpecialValues:PS.8/quintic-formal-connection`.

Choose π with π^(p−1)=−p. In the degree-zero homogeneous overconvergent twisted de Rham complex on (x₁,…,x₅,t), deg x_i=1 and deg t=−5, use d+πd(tφ_λ). Let H be the invariant formal extension with C_p[[λ]]-basis e_i=δ^iω, 0≤i≤3, where δ=λ∂_λ+πtλΣx_i⁵. Its relation is δ⁴ω=−g(24ω+50δω+35δ²ω+10δ³ω), g=5⁵λ⁵/(1+5⁵λ⁵). The basis is asserted over C_p[[λ]], with no assertion that it is an integral O_{C_p} lattice.

Construction or proof route: Use the affine twisted hypersurface complex, then retain the homogeneous projective component and group invariants as in §§3.2–3.3. Reduce monomial classes by Lemma 4.8 and Corollary 4.10. The reduced rank-four basis obeys the displayed relation; the logarithmic connection matrix has first three columns e₁,e₂,e₃ and last column −g(24,50,35,10). The affine/projective cohomological comparison and completion compatibility are explicitly audited under gap G1.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quintic-pencil`, `ComplexComparisonPartII:C5/gauss-manin-connection`.

The API serves the source calculation and this layer’s consuming targets:

- `quintic_connection_matrix` (data): The δ-matrix in the column-input convention is the companion matrix just displayed.
- `quintic_boundary_residue` (simp): At λ=0 the residue N sends e₀→e₁→e₂→e₃→0.
- `quintic_pairing` (compatibility): The flat alternating cup pairing obeys (e₀,e₃)=Y₀/(1+5⁵λ⁵), with Y₀≠0; at zero (e₁,e₂)=−Y₀.

Unit tests distinguish the construction:

- `quintic_nilpotence_test` (computation): N⁴=0 and N³e₀=e₃≠0.
- `quintic_pairing_sign_test` (computation): At zero the pairing matrix has entries J₀₃=Y₀, J₁₂=−Y₀, J₂₁=Y₀, J₃₀=−Y₀.
- `quintic_denominator_test` (non-example): The rational connection has a pole when 1+5⁵λ⁵=0; the formal extension at zero does not remove that pole.

Source: [Ilya Shapiro, Frobenius map on quintic threefolds](https://arxiv.org/pdf/0809.3742v2), Definition 4.2, p.5; Lemma 4.12, pp.8–9; SS §2 for the comparison.

### The normalized Dwork Frobenius

Named target: `quintic_dwork_frobenius`; packet node `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`.

On the overconvergent twisted complex raw Frobenius pulls back (x,t,λ) to (x^p,t^p,λ^p) and multiplies by exp(π(t^pφ_{λ^p}(x^p)−tφ_λ(x))). Define F=p⁻²F_raw on the selected H³ model. It is semilinear for λ↦λ^p, satisfies δF=pFδ, and scales the alternating pairing by p³. The factor p⁻² is required to compare with the usual cohomological Frobenius convention.

Construction or proof route: Check that the exponential correction intertwines the two twisted differentials, retaining the differential pullback factors. Reduce to the degree-zero invariant component, normalize by p⁻², and differentiate with respect to the parameter. The comparison with the crystalline Frobenius is a separate target, subject to G1.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quintic-formal-connection`, `CrystallineCohomology:CR.7`.

The API serves the source calculation and this layer’s consuming targets:

- `quintic_frobenius_raw` (data): F_raw is the pullback and exponential-correction operator on the twisted complex.
- `quintic_frobenius_horizontal` (relation): δF=pFδ, with the indicated semilinearity.
- `quintic_frobenius_pairing` (compatibility): (Fx,Fy)=p³σ((x,y)), for the chosen coefficient Frobenius σ.

Unit tests distinguish the construction:

- `quintic_frobenius_scale_test` (compatibility): F_raw=p²F; switching to raw Frobenius multiplies every matrix entry by p².
- `quintic_frobenius_parameter_test` (computation): F(λv)=λ^pF(v).
- `quintic_frobenius_pairing_test` (non-example): The normalized F is a p³-similitude, not an isometry of the pairing.

Source: [Ilya Shapiro, Frobenius map on quintic threefolds](https://arxiv.org/pdf/0809.3742v2), §3.3, pp.4–5; §4.3, pp.9–10.

### The Dwork series and boundary coefficient

Named target: `dwork_coefficients`; packet node `PeriodsAndSpecialValues:PS.8/dwork-coefficients`.

Let exp(z+z^p/p)=Σ_{n≥0}B_nzⁿ. Define σ₀=Σ_{n≥1}B_n(n−1)!, σ₂=Σ_{n≥3}B_n(n−1)!Σ_{1≤j<i≤n−1}(ij)⁻¹, and Δ₃=σ₂−σ₀³/6, as p-adic sums with convergence supplied as an explicit input until G2 is discharged. The boundary coefficient is C=p³·24Δ₃/25. Define these sums only with a HasSum/convergence interface, rather than interpreting a nonsummable total sum as zero.

Construction or proof route: Use the Dwork exponential estimates to justify the two weighted p-adic sums; the precise estimates missing from the source are recorded in G2. For the monomial reduction, define D_{αβ}=[x^α]Π_{i=1}^β(x+i), P_{α,i}=5^(−α−1)D_{α,i−1} for i>0 and P_{α,0}=δ_{α0}, and Q_{α,s}=(−1)^αD_{αs}. Theorem 5.13 expresses each normalized pairing c_{α,I} as the degree 3−#I−α convolution of Q and the five P factors; use empty convolution=0 in negative degree. This provides the explicit coefficient input, rather than an unexplained matrix oracle.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`, `mathlib:PowerSeries.exp`.

The API serves the source calculation and this layer’s consuming targets:

- `dwork_coefficient_recurrence` (relation): B₀=1 and nB_n=B_{n−1}+B_{n−p}, with B_k=0 for negative k.
- `dwork_delta` (data): Δ₃=σ₂−σ₀³/6 and C=p³·24Δ₃/25.
- `dwork_monomial_reduction` (compatibility): The polynomial coefficient convolution of Theorem 5.13 computes c_{α,I}, with c_{3,0}=1, c_{0,0}=c_{1,0}=c_{2,0}=0, and c_{α,I}=0 when α+#I>3.

Unit tests distinguish the construction:

- `dwork_initial_test` (computation): B₀=B₁=1 and B₂=1/2 for every odd p.
- `dwork_low_degree_test` (computation): For 0≤n<p, B_n=1/n!.
- `dwork_threshold_test` (computation): At n=p, B_p=1/p!+1/p; replacing the second term of the exponential by z^p loses this coefficient.

Source: [Ilya Shapiro, Frobenius map on quintic threefolds](https://arxiv.org/pdf/0809.3742v2), §6, pp.15–19; Theorem 6.1.

### Shapiro’s quintic boundary Frobenius matrix

Named target: `quintic_boundary_matrix`; packet node `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`.

Assume the p-adic series defining σ₀ and σ₂ converge and the twisted/projective cohomology comparison used above. In the column-input basis e_i=δ^iω at λ=0, normalized F has matrix [[p³,0,0,0],[0,p²,0,0],[0,0,p,0],[p³·24Δ₃/25,0,0,1]]. Its only possibly nonzero off-diagonal entry is row 3, column 0. The residue N and this matrix satisfy NF=pFN, and FᵀJF=p³J for the displayed boundary alternating matrix J. The source’s numerical evidence for Δ₃ in terms of a p-adic L-value is not promoted to a theorem.

Construction or proof route: Compute the coefficient of F(e₀) by the monomial reduction and Dwork series summation. Simplify the pairings to the cubic correction Δ₃. Use δF=pFδ and the rank-four basis to obtain the remaining columns. Check the pairing and residue relations in the same basis.

Direct inputs: `PeriodsAndSpecialValues:PS.8/dwork-coefficients`, `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`.

Acceptance: F(e₀)=p³e₀+Ce₃ and F(e₃)=e₃, so transposing the displayed matrix fails the residue identity when C≠0. This is a formal limiting matrix over C_p, not an integral matrix claim.

Source: [Ilya Shapiro, Frobenius map on quintic threefolds](https://arxiv.org/pdf/0809.3742v2), Theorem 6.1, pp.15–19, together with §§4.3 and 5.1–5.3.

### The integral crystalline model and matrix transport

Named target: `quintic_crystalline_comparison`; packet node `PeriodsAndSpecialValues:PS.8/quintic-crystalline-comparison`.

For odd p≠5 take the smooth family over Z_p[λ,λ⁻¹,(1+5⁵λ⁵)⁻¹]. Construct its invariant H³ crystalline/F-crystal and compare its rationalization to the Dwork module, with horizontal Frobenius and cup-product pairings. To transport the boundary matrix, require a proved semistable/log extension at λ=0 and its compatibility with the formal C_p[[λ]] extension; specify the transported lattice rather than declaring the e_i integral. This target is conditional on G1: the selected sources do not supply the complete integral and boundary comparison. No theorem that the displayed matrix acts on an integral lattice is asserted before those inputs are proved.

Construction or proof route: Import proper-smooth crystalline finiteness/Frobenius and the group projector; establish the required invariant torsion-freeness in the selected family. Prove the Dwork–crystalline comparison with normalization, then a log/semistable boundary comparison; transport the actual lattice through these maps. Each missing bridge is specified in G1 and requests, not inferred from matching ODEs.

Direct inputs: `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`, `CrystallineCohomology:CR.7`, `CrystallineCohomology:CR.5`, `CrystallineCohomology:CR.6`.

Acceptance: State the lattice over the coefficient ring, the good-prime restrictions, and the change-of-basis matrix before any integral/congruence conclusion. Mirror-map integrality above is already proved independently; neither enumerative equality nor a p-adic L-value identity follows from this conditional target.

Source: [Albert Schwarz and Ilya Shapiro, Twisted de Rham cohomology, homological definition of the integral and Feynman diagrams](https://arxiv.org/pdf/0809.0086), §§2–3, pp.10–13, limitation of crystalline identification; SH §§3–4.

## PS.9 — Multiple zeta values and mixed-Tate periods

### Admissible multiple-zeta indices

Named target: `mzv_indices`; packet node `PeriodsAndSpecialValues:PS.9/mzv-indices`.

An index is a finite list k of positive integers. Its weight is Σk_i and depth is its length. It is admissible when it is empty or its first entry is at least two. Define ζ(k)=Σ_{n₁>⋯>n_r>0}Π_i n_i^(−k_i), as a real convergent sum for admissible k; ζ([])=1. Brown and Zagier use ascending summation indices and require the last index≥2, so ζ_desc(k)=ζ_asc(reverse k). No convergent value is assigned to ζ([1]).

Construction or proof route: Prove absolute convergence for k₁≥2 by bounding the inner nested harmonic sums by powers of 1+log n₁ and summing n₁^−2 times that bound. Enumerate strictly decreasing positive tuples and use the real nonnegative sum; the empty tuple contributes one. Prove the reversal dictionary by reversing the tuple order.

Direct inputs: `mathlib:riemannZeta`, `mathlib:zeta_nat_eq_tsum_of_gt_one`, `mathlib:riemannZeta_two`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_weight_depth` (data): weight(k)=Σk_i and depth(k)=length(k).
- `mzv_convergence` (characterisation): For a nonempty positive index, its positive series converges exactly when k₁≥2.
- `mzv_depth_one` (compatibility): For integer n≥2, ζ([n]) equals the real value of Mathlib’s riemannZeta at n, with the n=0 summand convention reconciled.

Unit tests distinguish the construction:

- `mzv_empty_test` (degenerate): ζ([])=1 and its weight/depth are zero.
- `mzv_two_test` (compatibility): ζ([2])=π²/6.
- `mzv_one_test` (non-example): [1] is not admissible and its harmonic series diverges.

Source: [Kentaro Ihara, Masanobu Kaneko and Don Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), §1, pp.307–308; B introduction, p.1.

### Shuffle and stuffle word algebras

Named target: `word_products`; packet node `PeriodsAndSpecialValues:PS.9/word-products`.

Use the computational coordinate module W=(List {0,1})→₀Q, linearly identified with TauCeti.TensorWords Q (Bool→₀Q); its existing concatenation is not its shuffle product. H¹=Q+Wy consists of empty words and words ending in 1; H⁰=Q+xWy consists of empty words and words starting in 0 and ending in 1. Encode k by 0^(k₁−1)1⋯0^(k_r−1)1. Shuffle recursively interleaves letters with multiplicity. Stuffle on positive-index words recursively interleaves leading indices and adds the merge term (a+b)::(u*v). Extend both products Q-bilinearly, transport stuffle through the encoding, and equip separate wrappers with their commutative algebra structures.

Construction or proof route: Define the shuffle recursion (a u)⧢(b v)=a(u⧢bv)+b(au⧢v) with empty unit. Define the analogous stuffle recursion with positive merge term. Prove associativity and commutativity by labelled interleavings/ordered merges; retain duplicate multiplicities. Identify the underlying direct-sum coordinates with TensorWords and its deconcatenation, while using separate product wrappers.

Direct inputs: `mathlib:Finsupp.single`, `tauceti:TauCeti.TensorWords.of`, `tauceti:TauCeti.TensorWords.deconcatenation`, `PeriodsAndSpecialValues:PS.9/mzv-indices`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_encode` (data): encode(k) is the displayed 0/1 word; positive-index words biject with words ending in 1.
- `mzv_word_products` (relation): Both bilinear products obey the stated recursions and have the empty word as unit.
- `mzv_tensor_words` (equivalence): The coordinate module is linearly equivalent to TensorWords Q (Bool→₀Q), preserving length grading and all-cut deconcatenation, without identifying shuffle with concatenation.

Unit tests distinguish the construction:

- `mzv_shuffle_test` (computation): 01⧢01=4·0011+2·0101.
- `mzv_stuffle_test` (computation): [2]*[2]=2·[2,2]+[4].
- `mzv_encoding_test` (computation): encode([2,1])=011; it is admissible although its last index is one.

Source: [Kentaro Ihara, Masanobu Kaneko and Don Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), §1, pp.307–309.

### Endpoint and tangential iterated integrals

Named target: `iterated_integrals`; packet node `PeriodsAndSpecialValues:PS.9/iterated-integrals`.

For 0<a≤b<1 and w=c::u define I_{a,b}([])=1 and I_{a,b}(c::u)=∫_a^b κ_c(t) I_{a,t}(u) dt, using Mathlib intervalIntegral, κ₀=1/t and κ₁=1/(1−t). For admissible words, the joint endpoint limit a→0+, b→1− exists. For all words use polynomial asymptotic regularization at the tangent +1 at 0 and −1 at 1; its constant term sets the singleton 0 and 1 integrals to zero. In this recursion the head letter has the largest integration time. Brown’s increasing-time word is the reverse of this word.

Construction or proof route: Use compact-interval integrability to construct the recursion. Partition a product of ordered simplices to prove shuffle, with multiplicities. Expand the 1/(1−t) kernels by nonnegative geometric series and apply monotone convergence for admissible endpoints; obtain the decreasing-index sum. Extract tangential regularized constants from logarithmic asymptotics.

Direct inputs: `PeriodsAndSpecialValues:PS.9/word-products`, `mathlib:intervalIntegral`, `Polylogarithms:P.1/classical-polylogarithm`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_iterated_recursion` (relation): The displayed nested intervalIntegral recursion holds on interior cutoffs.
- `mzv_iterated_sum` (compatibility): For admissible k, lim I_{a,b}(encode k)=ζ_desc(k).
- `mzv_iterated_polylog` (compatibility): For n≥1 and 0<b<1, the a→0+ limit of I_{a,b}(0^(n−1)1) is Li_n(b), with Li₁(b)=−log(1−b).

Unit tests distinguish the construction:

- `mzv_iterated_empty_test` (degenerate): I_{a,b}([])=1 even when a=b.
- `mzv_iterated_zeta_test` (compatibility): The endpoint value of 001 is ζ([3]); the endpoint value of 011 is ζ([2,1]).
- `mzv_iterated_divergence_test` (non-example): I_{0,b}(1)=−log(1−b) has no finite limit at b=1; its regularized constant is zero.

Source: [Kentaro Ihara, Masanobu Kaneko and Don Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), §1, pp.308–309; DG §§3.11–3.13, printed pp.42–45.

### Convergent double shuffle and low weights

Named target: `convergent_double_shuffle`; packet node `PeriodsAndSpecialValues:PS.9/convergent-double-shuffle`.

Evaluation Z:H⁰→R is an algebra homomorphism for both shuffle and stuffle products. In particular ζ(2)²=4ζ(3,1)+2ζ(2,2)=2ζ(2,2)+ζ(4), hence 4ζ(3,1)=ζ(4). After regularization comparison below, ζ(2,1)=ζ(3). The ordinary identity ζ(2)²=5ζ(4)/2 also gives ζ(2,2)=3ζ(4)/4.

Construction or proof route: Partition products of absolutely convergent nested sums by the order/equality of summation indices for stuffle. Partition integration simplices for shuffle. Use the explicit low-weight product computations. For ζ(2,1)=ζ(3), use the separate leading-one regularization target rather than evaluating a divergent series.

Direct inputs: `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `PeriodsAndSpecialValues:PS.9/word-products`, `PeriodsAndSpecialValues:PS.9/mzv-indices`, `mathlib:riemannZeta_two`, `mathlib:riemannZeta_four`.

Acceptance: The coefficient 4 on ζ(3,1) retains shuffle multiplicity. The ζ(2,1) equality is a consequence of the regularization theorem, not a premise of this node.

Source: [Kentaro Ihara, Masanobu Kaneko and Don Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), §1, pp.307–309; §2, pp.310–311.

### The two polynomial regularizations

Named target: `polynomial_regularizations`; packet node `PeriodsAndSpecialValues:PS.9/polynomial-regularizations`.

The shuffle and stuffle algebras H¹ each admit a unique polynomial extension of Z on H⁰ with y↦T, denoted Z_⧢ and Z_*. Concretely H¹_⧢≅H⁰_⧢[y] and H¹_*≅H⁰_*[y] with their respective products; apply Z on coefficients. The tangential integral regularization gives Z_⧢. T is a formal divergence parameter, not a numerical value of ζ(1).

Construction or proof route: Triangularly remove leading y letters using each product, obtaining polynomial decomposition over the admissible subalgebra. Extend the admissible evaluation multiplicatively with y↦T and prove uniqueness; compare the shuffle extension to the endpoint logarithmic polynomial.

Direct inputs: `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `PeriodsAndSpecialValues:PS.9/convergent-double-shuffle`, `mathlib:PowerSeries.mk`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_regularization_admissible` (compatibility): Both maps restrict to the constant polynomial ζ(k) for every admissible index.
- `mzv_regularization_y` (simp): Z_⧢(y)=Z_*(y)=T and both send the empty word to 1.
- `mzv_regularization_unique` (universal-property): Any algebra map on the corresponding H¹ extending Z and sending y to T equals the specified extension.

Unit tests distinguish the construction:

- `mzv_regularization_empty_test` (degenerate): Both maps send the empty word to 1.
- `mzv_regularization_two_ones_test` (computation): Z_*([1,1])=(T²−ζ(2))/2 and Z_⧢([1,1])=T²/2.
- `mzv_regularization_leading_test` (computation): Z_*([1,2])=ζ(2)T−ζ(2,1)−ζ(3); Z_⧢([1,2])=ζ(2)T−2ζ(2,1).

Source: [Kentaro Ihara, Masanobu Kaneko and Don Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), Proposition 1, p.309; §3, pp.312–314.

### The regularization comparison operator

Named target: `regularization_operator`; packet node `PeriodsAndSpecialValues:PS.9/regularization-operator`.

Let A(u)=exp(Σ_{n≥2}(−1)^nζ(n)u^n/n)=Σa_ku^k. Define the R-linear automorphism ρ:R[T]→R[T] by ρ(T^m)=Σ_{k=0}^m m!/(m−k)!·a_k T^(m−k), equivalently ρ(exp(Tu))=A(u)exp(Tu). It is triangular with diagonal one, and is not a ring homomorphism.

Construction or proof route: Construct A using the formal exponential and read its first coefficients. Define ρ on the polynomial basis and extend linearly. Triangularity yields the inverse; equivalently replace A by A⁻¹. Do not impose multiplication compatibility, which fails in degree two.

Direct inputs: `PeriodsAndSpecialValues:PS.9/mzv-indices`, `mathlib:PowerSeries.exp`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_rho_monomial` (simp): The displayed coefficient formula gives ρ(T^m).
- `mzv_rho_generating` (characterisation): ρ(exp(Tu))=A(u)exp(Tu) coefficient by coefficient.
- `mzv_rho_inverse` (equivalence): ρ is a linear equivalence, with inverse given by the coefficients of A(u)⁻¹.

Unit tests distinguish the construction:

- `mzv_rho_one_test` (degenerate): ρ(1)=1 and ρ(T)=T.
- `mzv_rho_square_test` (computation): ρ(T²)=T²+ζ(2).
- `mzv_rho_cube_test` (computation): ρ(T³)=T³+3ζ(2)T−2ζ(3).

Source: [Kentaro Ihara, Masanobu Kaneko and Don Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), §2, equations (2.2)–(2.3), pp.309–310.

### Regularized double shuffle

Named target: `regularized_double_shuffle`; packet node `PeriodsAndSpecialValues:PS.9/regularized-double-shuffle`.

For every w∈H¹, Z_⧢(w)=ρ(Z_*(w)). Consequently the constant term of Z_⧢(w₁⧢w₀−w₁*w₀) vanishes for w₁∈H¹ and w₀∈H⁰. In descending notation comparison on [1,2] gives ζ(2,1)=ζ(3), while comparison on [1,1] gives ρ((T²−ζ(2))/2)=T²/2. Completeness of the resulting relation ideal is not asserted.

Construction or proof route: Compare the asymptotic polynomial of finite harmonic sums, with parameter log M+γ, to that of the multiple polylogarithm near 1 via Abelian asymptotics. The Gamma-factor expansion is precisely A(u). Extend from the asymptotic comparison to H¹ by the polynomial decomposition; derive the extended relation with an admissible factor and evaluate the constant term.

Direct inputs: `PeriodsAndSpecialValues:PS.9/polynomial-regularizations`, `PeriodsAndSpecialValues:PS.9/regularization-operator`.

Acceptance: Both divergent-index calculations agree without assigning ζ(1) a convergent value. No inference that double shuffle generates every numerical relation.

Source: [Kentaro Ihara, Masanobu Kaneko and Don Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), Theorem 1 and proof, pp.310,312–314; Theorem 2 and Conjecture 1, pp.310–315.

### The mixed-Tate category over Z

Named target: `mixed_tate_z`; packet node `PeriodsAndSpecialValues:PS.9/mixed-tate-z`.

Inside the Tate-generated triangulated subcategory DMT(Q) of MC.4, take the mixed-Tate heart MT(Q), whose t-structure is justified for number fields by Beilinson–Soulé vanishing. MT(Z) is its full tensor subcategory unramified at every finite prime, equivalently the successive adjacent-weight extensions have Kummer classes in Z×⊗Q=0. Objects have a finite weight filtration with gr^W_{−2n} a sum of Q(n). The canonical fibre functor is ω(M)=⊕_n Hom(Q(n),gr^W_{−2n}M). It is exact faithful Q-linear tensor, making this specific category neutral Tannakian.

Construction or proof route: Import geometric motives and their Tate inversion; restrict to the thick Tate-generated subcategory. Use the rational K-theory/motivic-cohomology comparison and Borel vanishing to establish the mixed-Tate t-structure. Apply the adjacent-weight criterion for unramifiedness, then define the graded fibre functor using the canonical Tate graded pieces. The general category of all mixed motives is not a premise.

Direct inputs: `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`, `MotivesAndAlgebraicCycles:MC.3/tannakian-category`, `BorelRegulators:R.3`, `MotivesAndAlgebraicCycles:MC.4`.

The API serves the source calculation and this layer’s consuming targets:

- `mtz_tate` (constructor): For every integer n, Q(n) belongs to MT(Z) and Q(n)⊗Q(m)=Q(n+m).
- `mtz_weight_fibre` (data): The grade-n fibre is Hom(Q(n),gr^W_{−2n}M); forgetting the grading gives the chosen fibre functor.
- `mtz_unramified` (characterisation): The adjacent-weight Kummer extensions vanish at every finite prime exactly for objects in the selected MT(Z) subcategory.

Unit tests distinguish the construction:

- `mtz_unit_test` (degenerate): The fibre of Q(0) is Q in grade zero.
- `mtz_tate_test` (computation): The fibre of Q(1) is Q in grade one; its Hodge weight is −2.
- `mtz_kummer_test` (non-example): The Kummer extension attached to 2 is an MT(Q) object but not an MT(Z) object, because it is ramified at the prime 2.

Source: [Pierre Deligne and Alexander Goncharov, Groupes fondamentaux motiviques de Tate mixte](https://www.math.ias.edu/files/deligne/Tate.pdf), §§1.1–1.9, printed pp.1–16; §§2.1–2.3, printed pp.17–20.

### Mixed-Tate extensions and the motivic Galois group

Named target: `mixed_tate_galois`; packet node `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`.

Ext¹_MT(Z)(Q(0),Q(n)) is Q for odd n≥3 and zero otherwise, and Ext² between Tate objects vanishes. For ω above, G_MT=Aut^⊗(ω) is G_m⋉U_MT, with Lie U_MT free pronilpotent on one generator in each negative odd degree −3,−5,…; choices of generator lifts are not canonical. The regulator/Hodge-realisation injection on Ext¹ gives the full-faithfulness comparison used in lifting the path structures.

Construction or proof route: Use the rational K-groups of Z and regulator injectivity to compute the extension groups and show the relation space vanishes. The absence of Ext² implies the graded Lie algebra is free. Apply neutral Tannaka reconstruction with the chosen fibre functor. For Hodge full faithfulness use the Ext¹ regulator injection, not injectivity of the motivic numerical period map.

Direct inputs: `PeriodsAndSpecialValues:PS.9/mixed-tate-z`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `BorelRegulators:R.3`, `BorelRegulators:R.4`.

Acceptance: There is no degree-one generator over Z, while over Q the Kummer extension space is nonzero.

Source: [Pierre Deligne and Alexander Goncharov, Groupes fondamentaux motiviques de Tate mixte](https://www.math.ias.edu/files/deligne/Tate.pdf), Propositions 1.9 and 2.2, printed pp.16–19; Proposition 2.14, printed p.25; B §2.5, pp.6–7.

### The motivic path torsor of the three-punctured line

Named target: `motivic_path_torsor`; packet node `PeriodsAndSpecialValues:PS.9/motivic-path-torsor`.

For X=P¹_Q minus {0,1,∞}, construct the unipotent motivic fundamental groupoid and the torsor {}₀Π₁ between tangent +1 at 0 and tangent −1 at 1 as pro/ind-objects in MT(Z). The finite length quotients are constructed by the cosimplicial/bar motives of X; their de Rham coordinate algebra is the shuffle algebra on two letters with all-cut deconcatenation. Betti realisation is the corresponding unipotent path-completion, and the comparison evaluates iterated integrals on the straight path dch.

Construction or proof route: Use the normalized cosimplicial motive and its finite truncations; DG Proposition 3.10 gives the universal homotopy comparison to the simplex construction. Specialize the generic unipotent groupoid interface from NC.2. Identify the logarithmic de Rham complex with the tensor-word model and the Betti comparison with iterated integration. Extend to the specified tangents, proving unramifiedness over Z and the groupoid composition laws.

Direct inputs: `PeriodsAndSpecialValues:PS.9/mixed-tate-z`, `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`, `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `AnabelianGeometryAndNonabelianChabauty:NC.2`, `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_path_word_coordinates` (equivalence): The de Rham path-coordinate algebra is the shuffle-word algebra with its length filtration.
- `mzv_path_composition` (relation): Composition of three paths gives all-cut deconcatenation, including the empty outer factors.
- `mzv_path_betti_comparison` (compatibility): The straight Betti path evaluates the word coordinates by tangentially regularized iterated integrals, with the reversal convention stated above.

Unit tests distinguish the construction:

- `mzv_path_empty_test` (degenerate): The empty word evaluates to 1 on the straight path.
- `mzv_path_cut_test` (computation): The deconcatenation of 01 is 1⊗01+0⊗1+01⊗1, where the two outer 1 symbols denote the empty-word unit.
- `mzv_path_tangent_test` (non-example): The endpoints 0 and 1 are absent from X; their ordinary point-based torsor cannot replace the specified tangential torsor.

Source: [Pierre Deligne and Alexander Goncharov, Groupes fondamentaux motiviques de Tate mixte](https://www.math.ias.edu/files/deligne/Tate.pdf), §§3.10–3.13, printed pp.40–45; Theorem 4.4, printed pp.46–50; §§5.1–5.4, printed pp.56–57.

### Brown’s motivic multiple-zeta algebra and period map

Named target: `motivic_mzv_algebra`; packet node `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`.

Let S=O({}₀Π₁) in the de Rham word model, and let dch:S→R evaluate the straight path. Let J_MT be the largest graded ideal stable under the U_MT coaction and contained in ker(dch), and define H=S/J_MT. This is not the quotient by the entire numerical kernel. For a descending admissible k set ζ^m_desc(k)=I^m(0;reverse(encode k);1). The descended period map per:H→R is a Q-algebra homomorphism with per(ζ^m_desc(k))=ζ_desc(k). Keep ζ^m(2) in H; it is nonzero.

Construction or proof route: Form the sum of the graded stable ideals contained in the numerical kernel and check it stays in the kernel and stable. This is J_MT. Descend straight-path evaluation and the relevant motivic iterated-integral relations to H. The largest stable ideal construction does not presume that the kernel itself is stable or that per is injective.

Direct inputs: `PeriodsAndSpecialValues:PS.9/motivic-path-torsor`, `PeriodsAndSpecialValues:PS.9/word-products`, `mathlib:Ideal.Quotient.mk`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_motivic_period` (compatibility): per sends ζ^m_desc(k) to the decreasing-index convergent sum for admissible k.
- `mzv_motivic_shuffle` (relation): Motivic iterated integrals satisfy shuffle, reflection and tangential vanishing: the empty word gives 1 and nonempty constant-letter endpoint integrals give 0.
- `mzv_motivic_ideal` (universal-property): J_MT is the largest graded U_MT-stable ideal inside ker(dch), so any such ideal factors through its quotient map.

Unit tests distinguish the construction:

- `mzv_motivic_empty_test` (degenerate): ζ^m([])=1 and per(1)=1.
- `mzv_motivic_two_test` (non-example): ζ^m(2)≠0, since its period is π²/6≠0.
- `mzv_motivic_reverse_test` (compatibility): ζ^m_desc(2,1)=I^m(0;1,1,0;1), with period ζ_desc(2,1); using 0,1,1 is the other word convention.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), §§2.1–2.4, pp.3–6; Theorem 2.4 and properties I0–I3.

### The motivic MZV coaction

Named target: `motivic_coaction`; packet node `PeriodsAndSpecialValues:PS.9/motivic-coaction`.

Let U′ be the quotient of U_MT acting faithfully on the path torsor and A=O(U′). The quotient π:H→A kills ζ^m(2). Define Δ:H→A⊗H. For I^m(a₀;a₁,…,a_n;a_{n+1}), sum over subsequences 0=i₀<i₁<⋯<i_k<i_{k+1}=n+1: the first tensor factor is π(Π_{p=0}^k I^m(a_{i_p};a_{i_p+1},…,a_{i_{p+1}−1};a_{i_{p+1}})), and the second is I^m(a₀;a_{i₁},…,a_{i_k};a_{n+1}). All k from 0 to n occur, empty segments are 1, and A is in the first factor. This makes H a graded A-comodule algebra.

Construction or proof route: Apply the motivic path action and express it on coordinate iterated integrals; the subsequence sum describes path insertions into the retained letters. Use the stable ideal to descend to H and project the cut segments to A. Verify coassociativity, counit and the product formula directly on word coordinates.

Direct inputs: `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.

The API serves the source calculation and this layer’s consuming targets:

- `mzv_coaction_cuts` (data): Δ on each iterated-integral generator is the stated subsequence sum, with A first.
- `mzv_coaction_algebra` (structure): Δ is a unital Q-algebra map and obeys the coassociative/counit comodule laws.
- `mzv_coaction_tate` (simp): π(ζ^m(2))=0 and Δζ^m(2)=1⊗ζ^m(2); quotienting A does not kill ζ^m(2) in H.

Unit tests distinguish the construction:

- `mzv_coaction_unit_test` (degenerate): Δ1=1⊗1.
- `mzv_coaction_two_test` (computation): Δζ^m(2)=1⊗ζ^m(2).
- `mzv_coaction_three_test` (computation): Δζ^m(3)=1⊗ζ^m(3)+ζ^a(3)⊗1, where ζ^a=πζ^m.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), Theorem 2.4, pp.4–6; §3.1, p.7.

### The f-alphabet and motivic dimension bound

Named target: `motivic_f_alphabet`; packet node `PeriodsAndSpecialValues:PS.9/motivic-f-alphabet`.

After a noncanonical choice of graded free generators, O(U_MT) is the shuffle algebra on f₃,f₅,… . Adjoining a central polynomial generator f₂ gives H_MT^+=O(U_MT)⊗Q[f₂], with deg f_i=i and deconcatenation coaction on the odd words. H embeds in H_MT^+ as a graded comodule, with ζ^m(2) corresponding to f₂ after normalization. The Hilbert series of H_MT^+ is 1/(1−t²−t³), so dim H_N≤d_N, d₀=1,d₁=0,d₂=1,d_N=d_{N−2}+d_{N−3} for N≥3.

Construction or proof route: Identify the coordinate Hopf algebra of the free prounipotent group by shuffle duality. Separate the even Tate parameter using a chosen rational point as in §2.4. Compute the graded tensor-product generating function; the embedding gives an upper bound, which becomes equality only after the basis theorem.

Direct inputs: `PeriodsAndSpecialValues:PS.9/mixed-tate-galois`, `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/motivic-coaction`, `PeriodsAndSpecialValues:PS.9/word-products`.

Acceptance: d₃=1,d₄=1,d₅=2,d₆=2; no f₁ occurs.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), §2.5 and Lemma 2.5, pp.6–7; §3.1, p.7.

### Coaction derivations and their joint kernel

Named target: `coaction_derivation_kernel`; packet node `PeriodsAndSpecialValues:PS.9/coaction-derivation-kernel`.

For odd r≥3 let D_r=(proj to indecomposables A_r ⊗id)∘(Δ−1⊗id), a derivation H_N→L_r⊗H_{N−r}. For N≥2 the joint kernel of the D_r with odd 3≤r<N in H_N is Qζ^m(N), with even ζ^m(N) a rational nonzero multiple of (ζ^m(2))^(N/2). The word formula removes contiguous length-r segments, projects each removed segment to L_r and leaves the complementary motivic word.

Construction or proof route: Project the explicit cut coaction to indecomposables; products of multiple nonempty cut pieces disappear, giving the contiguous-cut derivation formula. Read the primitive kernel in the f-alphabet and the central f₂ factor, retaining weight and the strict inequality r<N.

Direct inputs: `PeriodsAndSpecialValues:PS.9/motivic-coaction`, `PeriodsAndSpecialValues:PS.9/motivic-f-alphabet`.

Acceptance: At N=3 no r lies in the range, and H₃ is the one-dimensional ζ^m(3) line. The kernel result detects a multiple of ζ^m(N), not zero automatically.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), §3.2 and Theorem 3.3, pp.7–9.

### Motivic double shuffle and regularized leading ones

Named target: `motivic_double_shuffle`; packet node `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`.

In Brown’s H the admissible motivic ζ^m values obey shuffle and stuffle, and the tangential regularized leading-one identities used in Brown Lemma 3.8 hold before applying per. Transport Soudères’s frame-preserving convergent shuffle/stuffle identities to the path-period presentation, then establish the regularized extension in that presentation. The convergence-only framed-motive statements do not by themselves establish every regularized relation; this proof-transport obligation is G3.

Construction or proof route: Use the pullbacks between compactified M₀,n and the products to compare relative cohomology frames; the cubical blowups keep divisors in normal-crossing position for stuffle. Prove the equality of these frames with the tangential path iterated-integral periods in H, and their regularized polynomial extension. Apply the equality in the motivic algebra, rather than relying on injectivity of per. G3 records the explicit missing presentation comparison.

Direct inputs: `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/motivic-path-torsor`, `PeriodsAndSpecialValues:PS.9/regularized-double-shuffle`, `MotivesAndAlgebraicCycles:MC.4`.

Acceptance: ζ^m(2)²=2ζ^m(2,2)+ζ^m(4)=4ζ^m(3,1)+2ζ^m(2,2). The leading-one relations used by the cut-matrix calculation must be proved motivically; numerical identities alone are insufficient.

Source: [Ismaël Soudères, Motivic double shuffle](https://arxiv.org/pdf/0808.0248v3), Proposition 3.8 and proof, §3.2; Proposition 4.24 and proof, §4.3; B Lemma 3.8, pp.10–11.

### Zagier’s one-three coefficients in descending notation

Named target: `zagier_coefficients`; packet node `PeriodsAndSpecialValues:PS.9/zagier-coefficients`.

For a,b≥0 and 1≤r≤a+b+1 define c(a,b,r)=2(−1)^r[binom(2r,2b+2)−(1−2^(−2r))binom(2r,2a+1)] in Q. This is Zagier’s ascending coefficient with a and b interchanged. Empty strings of twos are permitted and ζ({2}⁰)=1. The coefficient is dyadic, which is the arithmetic input to Brown’s determinant argument.

Construction or proof route: Define the rational binomial expression with exact powers of two, treating binomial coefficients above the top index as zero. Translate ascending to descending indices by reversing the entire index word, exchanging the two strings of twos.

Direct inputs: `PeriodsAndSpecialValues:PS.9/mzv-indices`.

The API serves the source calculation and this layer’s consuming targets:

- `zagier_coefficient_formula` (simp): c is the displayed rational expression for 1≤r≤a+b+1.
- `zagier_coefficient_reversal` (compatibility): c_desc(a,b,r)=c_asc(b,a,r).
- `zagier_coefficient_dyadic` (characterisation): The denominator of c(a,b,r), in lowest terms, is a power of two.

Unit tests distinguish the construction:

- `zagier_three_test` (computation): c(0,0,1)=1.
- `zagier_two_three_test` (computation): c(1,0,1)=−2 and c(1,0,2)=9/2; hence the descending ζ(2,3) formula has these coefficients.
- `zagier_three_two_test` (computation): c(0,1,1)=3 and c(0,1,2)=−11/2; hence reversing the index changes both coefficients.

Source: [Don Zagier, Evaluation of multiple zeta values ζ(2,...,2,3,2,...,2)](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4007/annals.2012.175.2.11/fulltext.pdf), Theorem 1, p.978; B Theorem 4.3 and Corollary 4.4, pp.12–13.

### Zagier’s ordinary one-three evaluation

Named target: `zagier_evaluation`; packet node `PeriodsAndSpecialValues:PS.9/zagier-evaluation`.

For a,b≥0, n=a+b+1, ζ_desc({2}^a,3,{2}^b)=Σ_{r=1}^n c(a,b,r)ζ(2r+1)ζ({2}^{n−r}). Also ζ({2}^m)=π^(2m)/(2m+1)!, including m=0. These are numerical equalities; their lift to H is a separate theorem.

Construction or proof route: Compute the generating function of the one-three integrals and the proposed binomial expression. Prove equality at the integer interpolation points and use the growth bounds to conclude equality of the entire generating functions; extract coefficients. The all-two identity comes from the sine-product generating function.

Direct inputs: `PeriodsAndSpecialValues:PS.9/zagier-coefficients`, `PeriodsAndSpecialValues:PS.9/iterated-integrals`, `PeriodsAndSpecialValues:PS.9/mzv-indices`.

Acceptance: ζ_desc(2,3)=−2ζ(3)ζ(2)+(9/2)ζ(5). ζ_desc(3,2)=3ζ(3)ζ(2)−(11/2)ζ(5).

Source: [Don Zagier, Evaluation of multiple zeta values ζ(2,...,2,3,2,...,2)](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4007/annals.2012.175.2.11/fulltext.pdf), Theorem 1, pp.977–979; proof in §§2–4, pp.979–991.

### Brown’s motivic lift of the one-three evaluation

Named target: `motivic_zagier_evaluation`; packet node `PeriodsAndSpecialValues:PS.9/motivic-zagier-evaluation`.

With the same descending coefficient c, ζ^m_desc({2}^a,3,{2}^b)=Σ_{r=1}^{a+b+1}c(a,b,r)ζ^m(2r+1)ζ^m({2}^{a+b+1−r}). This motivic equality follows from coaction induction and the ordinary one-three evaluation, without assuming period-map injectivity.

Construction or proof route: Apply each D_r with r<2a+2b+3 to the difference, using the contiguous cuts, regularized leading-one formulas and induction on weight. All these derivations vanish. The joint-kernel theorem makes the difference αζ^m(2a+2b+3). Apply per and the ordinary Zagier formula: αζ(2a+2b+3)=0. Positivity of this single odd zeta value forces α=0, without a general injectivity assumption.

Direct inputs: `PeriodsAndSpecialValues:PS.9/zagier-evaluation`, `PeriodsAndSpecialValues:PS.9/coaction-derivation-kernel`, `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`, `PeriodsAndSpecialValues:PS.9/zagier-coefficients`.

Acceptance: a=b=0 gives ζ^m(3)=ζ^m(3). The descending weight-five coefficients agree with those above.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), Theorem 4.3 and proof, pp.12–13.

### The Hoffman level filtration

Named target: `hoffman_level`; packet node `PeriodsAndSpecialValues:PS.9/hoffman-level`.

Let B_{N,l} be the finite set of descending words in {2,3} of total weight N and exactly l occurrences of 3. Let H_N^{2,3} be the Q-span of all their motivic values in H_N. F_lH_N^{2,3} is the span of words with at most l threes. Define the free word space W_{N,l}=Q[B_{N,l}] before proving independence. For N=2m+3l, #B_{N,l}=binom(m+l,l); it is zero if m is not a nonnegative integer. Include the empty word at N=l=0.

Construction or proof route: Enumerate the positive index words with the prescribed weight/level; form their free coordinate space and span map into H. Filter by the count of threes. Establish the combinatorial cardinality by choosing the positions of the l threes among m+l entries, without assuming the span map is injective.

Direct inputs: `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.9/word-products`, `mathlib:Submodule.span`, `mathlib:LinearIndependent`.

The API serves the source calculation and this layer’s consuming targets:

- `hoffman_level_span` (data): F_l is the indicated Submodule.span and increases with l.
- `hoffman_level_cardinality` (simp): For N=2m+3l the free word space dimension is binom(m+l,l).
- `hoffman_level_derivation` (compatibility): For odd r≥3, D_r sends F_lH_N^{2,3} into L_r⊗F_{l−1}H_{N−r}^{2,3}, as proved using the one-three evaluation.

Unit tests distinguish the construction:

- `hoffman_empty_test` (degenerate): B_{0,0} contains just the empty word and F₀H₀=Q·1.
- `hoffman_weight_five_test` (computation): B_{5,1} consists of [2,3] and [3,2].
- `hoffman_weight_six_test` (computation): B_{6,0} consists of [2,2,2], B_{6,2} of [3,3], and B_{6,1} is empty.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), §5, pp.13–14; §6, pp.14–17.

### The Hoffman cut matrix

Named target: `hoffman_cut_matrix`; packet node `PeriodsAndSpecialValues:PS.9/hoffman-cut-matrix`.

For N≥3 and l≥1, assemble all odd 3≤r≤N coaction cuts into the map on free spaces W_{N,l}→⊕_r W_{N−r,l−1}. Express each removed one-three segment using the motivic Zagier coefficients and the prescribed leading-one regularization. Denote its rational matrix by M_{N,l}. Use Brown’s reverse-lexicographic ordering on ascending words with 3<2, transported by reversing each descending word. The r=N summand includes the empty word when l=1. The source’s explicit cut formula, not a dimension comparison alone, defines the matrix.

Construction or proof route: Apply the contiguous-cut derivation formula to each formal 2/3 word, distinguish the cuts with one 3 and the regularized boundary contributions, and reduce with the motivic one-three formula. Before taking the actual graded quotient, work in free source and target coordinates. Theorem 6.1 describes the entries modulo the differences of a word and its reverse; Corollary 6.2 identifies the upper-triangular leading matrix in the chosen order.

Direct inputs: `PeriodsAndSpecialValues:PS.9/hoffman-level`, `PeriodsAndSpecialValues:PS.9/coaction-derivation-kernel`, `PeriodsAndSpecialValues:PS.9/motivic-zagier-evaluation`, `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`, `mathlib:Matrix.det`.

The API serves the source calculation and this layer’s consuming targets:

- `hoffman_matrix_entry` (data): An entry is the rational sum of the explicit coaction-cut coefficients landing in that target word and odd weight.
- `hoffman_matrix_square` (characterisation): The source and target free sets have equal cardinality, by deleting the first odd block in Brown’s ordering.
- `hoffman_matrix_leading` (relation): After Brown’s 2-adic column rescaling, the leading matrix is upper triangular modulo 2 with diagonal a unit, with the minimal coefficient in each column supplied by the ascending block (3,2,…,2).

Unit tests distinguish the construction:

- `hoffman_matrix_empty_target_test` (degenerate): At N=3,l=1 the map is the 1×1 matrix (1), targeting the r=3 empty word.
- `hoffman_matrix_weight_five_test` (computation): At N=5,l=1 the source has two words and target is W_{2,0}⊕W_{0,0}, also dimension two.
- `hoffman_matrix_reversal_test` (compatibility): In descending notation the minimal-coefficient block is (2,…,2,3), the reversal of Brown’s (3,2,…,2).

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), §§5–6, Theorem 6.1 and Corollary 6.2, pp.13–17.

### Brown’s 2-adic determinant argument

Named target: `hoffman_matrix_invertible`; packet node `PeriodsAndSpecialValues:PS.9/hoffman-matrix-invertible`.

Every nonempty Hoffman cut matrix M_{N,l} is invertible over Q. The elementary criterion is: for a rational square matrix, if every below-diagonal entry has 2-adic valuation≥1 and each diagonal entry realizes its column’s minimum valuation, which is≤0, then the determinant is nonzero. Rescale each column by a power of two to make that minimum zero; reduction modulo 2 is upper triangular with nonzero diagonal. Brown’s coefficient estimates and leading-cut computation verify these hypotheses.

Construction or proof route: Use the dyadic coefficient symmetry and minimal-column valuation from Corollary 4.4, with the index reversal already applied. Rescale, reduce modulo two and apply the triangular determinant formula. Recover rational nonvanishing by undoing the invertible column rescalings.

Direct inputs: `PeriodsAndSpecialValues:PS.9/hoffman-cut-matrix`, `PeriodsAndSpecialValues:PS.9/zagier-coefficients`.

Acceptance: The criterion concludes det≠0, not that the original rational determinant is an integer or a 2-adic unit.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), Corollary 4.4, pp.12–13; Lemma 7.1 and Theorem 7.3, pp.17–18.

### The motivic Hoffman basis

Named target: `hoffman_motivic_basis`; packet node `PeriodsAndSpecialValues:PS.9/hoffman-motivic-basis`.

For each N≥0, {ζ^m_desc(k) : k is a {2,3}-word of weight N} is a Q-basis of H_N; the empty word is the weight-zero basis and weight one has empty basis. The level induction proves independence via the invertible cut matrices. The number of these words is d_N, matching the Hilbert-series upper bound; hence H=H_MT^+ and every motivic MZV is a rational linear combination of the 2/3 values.

Construction or proof route: Induct on weight and level. A relation in highest level is sent by all D_r to lower-weight relations; invertibility of M_{N,l} forces its top-level coefficients to vanish. Descend the level filtration. The surviving level-zero all-two value is nonzero by its period. Compare independent word count with the upper bound dim H_N≤d_N to prove spanning and equality with the ambient algebra.

Direct inputs: `PeriodsAndSpecialValues:PS.9/hoffman-matrix-invertible`, `PeriodsAndSpecialValues:PS.9/hoffman-level`, `PeriodsAndSpecialValues:PS.9/motivic-f-alphabet`.

Acceptance: H₂=Qζ^m(2), H₃=Qζ^m(3), H₅ has basis ζ^m(2,3),ζ^m(3,2). The independence assertion lives in H, not in its numerical image.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), Theorem 1.1, p.1; Theorem 7.4, pp.18–19.

### Numerical Hoffman spanning and mixed-Tate periods

Named target: `numerical_spanning`; packet node `PeriodsAndSpecialValues:PS.9/numerical-spanning`.

Every convergent numerical MZV of weight N is a rational linear combination of numerical descending 2/3 MZVs of the same weight. Thus dim_Q span{ζ(k):weight(k)=N}≤d_N. Every period of MT(Z) is in the Q[(2πi)⁻¹]-linear span of MZVs, via the localized period algebra supplied by PS.2 and the comparison torsor MC.6. Numerical independence of the 2/3 values, exact numerical dimensions, completeness of double-shuffle relations, and general period-map injectivity remain conjectural assertions, with no theorem depending on them.

Construction or proof route: Apply the actual Q-linear algebra map per to the motivic basis expansion. A surjective image map preserves spanning and yields only an upper dimension bound. Use the equality with the mixed-Tate comodule algebra and invert the Tate period for arbitrary twists. Import PS.2’s P_eff[L⁻¹], evaluation of L⁻¹=(2πi)⁻¹, and its tensor-comparison interface.

Direct inputs: `PeriodsAndSpecialValues:PS.9/hoffman-motivic-basis`, `PeriodsAndSpecialValues:PS.9/motivic-mzv-algebra`, `PeriodsAndSpecialValues:PS.2`, `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

Acceptance: Weight five is spanned numerically by ζ(2,3),ζ(3,2), without an assertion that they are numerically independent. Tate inverse evaluation uses PS.2 localization rather than an effective-period algebra missing the inverse.

Source: [Francis Brown, Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), Corollary 1.2, p.1; Corollary 7.5, p.19.

## Supplier interfaces and remaining proof obligations

- `MotivesAndAlgebraicCycles:MC.2`: Realisation and cup-pairing maps for the selected smooth projective quartic/quintic models, compatible with finite group actions and cycle maps. Generic quotient/resolution geometry used for the quartic is not supplied by the realisation theorem: gap G4 identifies its separate owner requirement.
- `CrystallineCohomology:CR.7`: For the displayed proper smooth quintic over its good-prime base, finite-projective crystalline cohomology with horizontal Frobenius, cup pairing and the order-125 invariant projector; identify the hypotheses required for integral torsion-freeness. This request does not pretend that CR.7 already proves a Dwork comparison.
- `CrystallineCohomology:CR.5`: The log-crystalline realization and Frobenius on a proved log-smooth/semistable model at λ=0, with the residue and pairing interface needed by the boundary transport.
- `CrystallineCohomology:CR.6`: A semistable comparison for the selected quintic degeneration, including compatibility of its log extension, monodromy, cup product and rational Frobenius; only after the model and comparison hypotheses in G1 are verified.
- `ModularCurvesPartII:R13.3`: The Tate-cusp normalization j(q)=q⁻¹+744+⋯ with integral coefficients, x=1/j∈q+q²Z[[q]], and its analytic Schwarzian comparison to the level-one modular invariant. The latter analytic identity must be imported from uniformisation R12.1 or supplied as a precise addition, not inferred from a formal Tate expansion.
- `BorelRegulators:R.3`: The rational K-groups of Z needed for Beilinson–Soulé vanishing and the mixed-Tate Ext¹ computation: one-dimensional in K_{4m+1} for m≥1, zero in the other positive weights apart from K₁(Q) at the rational-field input.
- `BorelRegulators:R.4`: Injectivity of the Borel/Hodge regulator on the rational odd K-groups of number fields, sufficient for DG Proposition 2.14’s Ext¹ realisation injection.
- `MotivesAndAlgebraicCycles:MC.4`: The rational motivic-cohomology/Adams K-theory identification for number fields and the Tate-generated subcategory, sufficient for the specific mixed-Tate t-structure and Ext computations; also relative-cohomology framed motives and their functorial maps for the motivic stuffle comparison.
- `AnabelianGeometryAndNonabelianChabauty:NC.2`: The generic unipotent de Rham/Betti groupoid, finite path truncations and comparison with the bar complex, allowing tangential base points. PS.9 owns only the mixed-Tate three-punctured-line specialization.

### G1: Quintic Dwork, integral crystalline and limiting-lattice bridge

The homogeneous/projective twisted-complex comparison must be proved on the actual overconvergent/completed family; the C_p formal module must be identified with the rationalized invariant proper-smooth F-crystal. Prove integral invariant torsion-freeness, a semistable/log model at λ=0, extension compatibility and the actual transported lattice. SS §3 explicitly does not prove full equality with crystalline Frobenius. Shapiro’s matrix calculation is not this proof. Candidate owner: a source-qualified addition to PadicDifferentialEquationsAndRigidCohomology, coupled with CR.5–CR.7; no claim that their present stage descriptions contain the complete bridge.

Needed by: `PeriodsAndSpecialValues:PS.8/quintic-formal-connection`, `PeriodsAndSpecialValues:PS.8/quintic-dwork-frobenius`, `PeriodsAndSpecialValues:PS.8/quintic-crystalline-comparison`, `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`.

### G2: Weighted Dwork-series convergence estimates

Give quantitative p-adic estimates proving convergence of ΣB_n(n−1)! and the degree-two harmonic-weighted sum for each odd p≠5. The selected Shapiro version asserts the convergence and refers to work in preparation; the checked passages do not supply the full estimate. The boundary theorem is stated with convergence as a premise until this is proved. No divergent total tsum convention substitutes for this premise.

Needed by: `PeriodsAndSpecialValues:PS.8/dwork-coefficients`, `PeriodsAndSpecialValues:PS.8/quintic-boundary-matrix`.

### G3: Transport of motivic stuffle and its regularized extension

Construct the frame-preserving equality between Soudères’s relative-cohomology framed MZVs and Brown’s path-period generators in H, then prove the tangential polynomial extension needed for Brown Lemma 3.8. The sources state the resulting motivic identities, but the complete comparison proof was not established from the passages read. This is an explicit proof dependency, not numerical period injectivity. MC.4 supplies the generic relative motives; the source-specific equality belongs to PS.9.

Needed by: `PeriodsAndSpecialValues:PS.9/motivic-double-shuffle`, `PeriodsAndSpecialValues:PS.9/motivic-zagier-evaluation`, `PeriodsAndSpecialValues:PS.9/hoffman-cut-matrix`, `PeriodsAndSpecialValues:PS.9/hoffman-motivic-basis`.

### G4: Generic finite quotient and relative A3 resolution supplier

The explicit invariant quotient and six A₃ resolutions are given by Hartmann; a reusable algebraic finite quotient/minimal-resolution interface at the required relative generality was not found in the pinned trees or current upstream roadmaps. MC.2 supplies realizations, not resolutions. A geometry-owner addition must supply that interface; the explicit selected-family verification remains in PS.8. Do not relabel this generic missing geometry as existing cohomology.

Needed by: `PeriodsAndSpecialValues:PS.8/quartic-pencil`, `PeriodsAndSpecialValues:PS.8/quartic-residue`.

## Corrections to the selected sources

These entries paraphrase the problem and state the corrected mathematics; no source passage is reproduced.

### PeriodsAndSpecialValues/E1

H, Proposition 4.26 and Example 4.27, PDF p.21; §4.7 normalization. Paraphrase: the form is rescaled by t⁻¹ and the pulled-back hypergeometric operator is a scalar times D_t followed by multiplication by t.

Correction: Rescale the period form by t. With z=t⁻⁴ in H’s unscaled hypergeometric variable, the operator is (1−t⁴)/64 · D_t∘m_{1/t}. Raw periods are t⁻¹ times the hypergeometric solutions.

Check: Put θ=−t∂_t/4. Both sides of the corrected identity have derivative coefficients (1−t⁴)/(64t), −3(t⁴+1)/(64t²), (6/t³−t)/64, −3/(32t⁴). Applied to 1, the printed right-hand side is −t²/8, while the hypergeometric operator gives −3/(32t⁴). The period ratio is unaffected by the common rescaling.

Existing correction search: new: no existing correction located in the searches below; no priority claim beyond the checked version.

### PeriodsAndSpecialValues/E2

H, Theorem 4.28, PDF p.22, U₁ upper parameters; compared with NS formula (26), p.9. Paraphrase: U₁ uses the upper hypergeometric pair (1/8,3/8) in the variable 1−t⁴.

Correction: Use (1/8,1/8) for U₁ in the variable 1−t⁴, as in the original NS formula (26). U₂ keeps (5/8,5/8); those equal parameters are correct in this variable.

Check: Changing from t⁻⁴ to 1−t⁴ includes the hypergeometric inversion transform, so one must not carry over the original unequal upper pair. The regular local solution has linear coefficient 1/32, not 3/32. NS gives the equal pair explicitly and the same square-root reflection.

Existing correction search: The source being cited, Nagura–Sugiyama hep-th/9312159, formula (26), already has the correct equal pair; no separate Hartmann erratum located.

## Layer acceptance and boundary

PS.8 acceptance checks the quartic residue convention, singular geometric versus coarse parameters, the corrected t-rescaling, the integral marking and both monodromy normalizations, the first four mirror coefficients, and the modular branch’s integrality with no inverted coefficient prime. For the quintic it checks the invariant rank, excluded primes, formal basis, p⁻² Frobenius normalization, off-diagonal position, residue and pairing identities. Its integral-lattice acceptance remains subject to G1 and its convergent coefficient sums to G2. These obligations are part of the plan, not claims of a completed comparison. Enumerative mirror identities and the proposed p-adic L-value expression are not inputs or proved outputs.

PS.9 acceptance checks convergence and ordering, both product multiplicities, depth-one library agreement, the two different regularizations of [1,1], comparison on [1,2], Tate-weight normalization, the largest stable ideal rather than the full numerical kernel, the coaction factor order and ζ^m(2), the reversed one-three coefficients, the free-word level construction, the empty-target cut, and the 2-adic determinant argument. It then checks motivic basis versus numerical spanning through per. G3 must be discharged to execute the motivic stuffle-dependent proof chain. The localized Tate period needed for arbitrary MT(Z) twists is PS.2’s, including its evaluation on the inverse.

RS-13 leaves these two layers intact. The added PS.1/PS.6 papers and the confirmed PS.2 Tate-localization finding are outside this part; the handoff points their owning part to the required interface.

## Source versions

Every source was read on 2026-10-11. Hashes refer to the downloaded public PDFs and make differing pagination visible. They do not place source text in this repository.

- `H`: [Period- and mirror-maps for the quartic K3](https://arxiv.org/pdf/1101.4601), Heinrich Hartmann. arXiv 1101.4601; downloaded PDF dated 29 October 2018; PDF page numbers, 29 pages. Read: §§2.1–2.5; §§3–5, especially Theorem 4.8, Proposition 4.14, §§4.6–4.8, Theorem 5.1. SHA-256 `11e54e5ed83a516011217fa7f6fb40d4d890fb7ecf276d7ae398b5ae97a49909`.
- `LYA`: [Arithmetic Properties of Mirror Map and Quantum Coupling](https://arxiv.org/pdf/hep-th/9411234v3), Bong H. Lian and Shing-Tung Yau. v3, 5 December 1994; author-preprint pagination, 32 pages. Read: §§4–6: normalized Schwarzian solutions; §5.5, equations (5.18)–(5.19), and §6 integral-branch argument. SHA-256 `dcf9ee72c383e88d539a710e45947392514e78a1aaa3e4a023fd7a371e8394d0`.
- `LYH`: [Mirror maps, modular relations and hypergeometric series I](https://arxiv.org/pdf/hep-th/9507151), Bong H. Lian and Shing-Tung Yau. arXiv v1, 27 July 1995; 24 pages. Read: §§2–3: Proposition 3.1 and symmetric-square proof; §5.2 screened: prime-degree integrality is not applied to degree four. SHA-256 `3f4aa8fcc1d5cd45cb130a4f1a05c09038eaa45621546fdb82d48af53ff410e6`.
- `SH`: [Frobenius map on quintic threefolds](https://arxiv.org/pdf/0809.3742v2), Ilya Shapiro. v2, 7 October 2008; 19 pages. Read: Entire paper: §§3–6, Definition 4.2, Lemmas 4.12 and 4.15, Theorems 5.2, 5.11, 5.13 and 6.1. SHA-256 `cc57d22b1c173ef1837c6d31af4e76546233f0d9ac053cffa403e6017e551e16`.
- `SS`: [Twisted de Rham cohomology, homological definition of the integral and Feynman diagrams](https://arxiv.org/pdf/0809.0086), Albert Schwarz and Ilya Shapiro. arXiv preprint, 2008; downloaded version. Read: §§2–3: hypersurface/twisted de Rham comparison and Frobenius; stated limitation of crystalline comparison. SHA-256 `733ff216eec53ce563c69e31957cb028775646c76e225c18562f052b7a3981d8`.
- `IKZ`: [Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf), Kentaro Ihara, Masanobu Kaneko and Don Zagier. Compositio Mathematica 142 (2006), 307–338; final author-hosted copy. Read: §§1–3, pp.307–315: Proposition 1, Theorem 1 and its proof, Theorem 2 and Conjecture 1. SHA-256 `0f2ca065e44b28dd8d51d825a46f06e34abf2c2fe9892bdcd01b8a511e692c77`.
- `DG`: [Groupes fondamentaux motiviques de Tate mixte](https://www.math.ias.edu/files/deligne/Tate.pdf), Pierre Deligne and Alexander Goncharov. IAS author preprint, 90 PDF pages; locators below use printed pages (PDF page = printed page + 2). Read: §§1.1–2.6; Proposition 2.14; §§3.10–3.13; Theorem 4.4 and §§4.13–5.4: category, paths, tangential points and unramifiedness. SHA-256 `42039a170972f033f28eb481929aca3fc411a7e041c0f867157a769484ea21a4`.
- `B`: [Mixed Tate motives over Z](https://arxiv.org/pdf/1102.1312), Francis Brown. v1, 7 February 2011; 19 pages; not the differently paginated Annals version. Read: Entire paper: §§2–7, especially Theorems 3.3, 4.3, 6.1, 7.3 and 7.4 and Corollary 7.5. SHA-256 `e795b842a6820ed87685db81e0eeadfc220394d52ec88a95696111b4b0cd8367`.
- `Z`: [Evaluation of multiple zeta values ζ(2,...,2,3,2,...,2)](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4007/annals.2012.175.2.11/fulltext.pdf), Don Zagier. Annals of Mathematics 175 (2012), 977–1000; final author-hosted copy. Read: §§1–4, pp.977–991: Theorem 1, generating functions, integer interpolation and growth proof. SHA-256 `28a98d968fe6998979008164252b5a9711a780c3f009ae6dfa55aae7c41014cd`.
- `SO`: [Motivic double shuffle](https://arxiv.org/pdf/0808.0248v3), Ismaël Soudères. v3, 18 November 2008; mathematical text also checked in ar5iv rendering of this version. Read: §§3.1–3.2 and §4.3: Definition 3.7, Proposition 3.8 and Proposition 4.24 with the frame-preserving maps; convergence hypotheses retained. SHA-256 `91259e395f1a550088e297a006a0e8ab811d48982e25d78c7599e1a596e85f0e`.
- `NS`: [Mirror Symmetry of K3 and Torus](https://arxiv.org/pdf/hep-th/9312159), Masaru Nagura and Katsuyuki Sugiyama. arXiv author preprint, 28 December 1993; PDF/printed pages agree. Read: §§3.2–3.3, pp.5–9; §5.2, pp.13–15: Frobenius solutions, formula (26), and local reflection (39). SHA-256 `3d5b118a8db84976a344e9c13408cefc229853641bb9fae7255b71f322ab6d6d`.
