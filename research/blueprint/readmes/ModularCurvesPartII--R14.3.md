# Modular curves, Part II: cohomology, level change and modular quotients

A primitive weight-two newform gives a quotient of a modular Jacobian. Its integral realizations, the two maps at a raised prime, and the special fibre connect analytic Hecke theory with the finite modules used in modularity arguments. This part constructs that bridge on the actual modular curves. Higher weights use the symmetric powers of the universal elliptic curve's relative degree-one system.

The assigned stages are R14.3–R14.6. The target-level planning pass is **complete**, with all four stages **planned**. Five proof-chain or range gaps and 23 exact supplier requests remain. No declaration is claimed implemented. This continues the earlier checkpoint, retaining its correct declaration ids and expanding the previously unread stages. The accepted RS-06 ownership rules govern the boundaries below.

| Stage | Target | Nodes | Planets | Coverage |
|---|---|---:|---:|---|
| R14.3 | Integral realizations and pairings | 14 | 5 | planned |
| R14.4 | Ihara and level change | 10 | 6 | planned |
| R14.5 | Weight-two modular quotients | 8 | 4 | planned |
| R14.6 | Reduction and Taylor–Wiles modules | 11 | 5 | planned |

## Imports and conventions

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 15 declaration statements listed in the packet were read at those commits. They include the abstract local-system carrier and its pullback, representation symmetric powers, principal congruence subgroups, group cohomology with Shapiro and the trivial-action character comparison, the abelian-variety carrier, and the elementary image/kernel maps used below. Mathlib's degree-one pro-étale carrier is untwisted and additive; it alone does not supply the integral coefficient, module or comparison API.

The current upstream ModularForms roadmap already owns the oldspace span, primitive newforms, strong multiplicity one, the integral homological symbol lattice, its period functional and coefficient fields. JacobianChallenge owns generic Abel–Jacobi maps. AlgebraicTopology owns relative and twisted chains, cochains and duality; current Tau Ceti twisted-cochain declarations postdate the pin. These existing constructions are imports. The new targets here are their geometric modular-curve comparisons and applications.

Use the fine point-of-exact-order model X₁(N), with N≥5, its open Y₁(N) and J₁(N)=Pic⁰(X₁(N)). A coarse or stack level requires its supplied descent data; taking invariants is not exact when a stabilizer order is divisible by the coefficient characteristic. The geometric mixed level at a prime p∤N is Γ₁(N)∩Γ₀(p), rather than Γ₁(Np).

There are two Hecke conventions. For the correspondence maps π₁,π₂, the Picard convention is Alb(π₁)∘Pic⁰(π₂); the Albanese convention is Alb(π₂)∘Pic⁰(π₁). The classical cotangent action is Albanese, and the Picard action is its adjoint. The involution w_ζ transports one to the other. The quotient A_f uses the Picard convention throughout. Tate modules and untwisted cohomology differ by a dual or a Tate twist; Conrad's cup/Weil comparison also has a sign, retained below.

For integral statements O is a complete DVR finite over Z_ℓ, with uniformizer π and fraction field K. Étale coefficients require ℓ invertible on the base. The compact characteristic-zero Ihara theorem permits ℓ|N. At a semistable fibre of characteristic p, the Tate filtration stated here requires ℓ≠p. CDT's prime q for a finite coefficient field is independent of the level-changing prime p, and its ordinary-character kernel bound imposes no q≠p restriction.

## Dependency route

R13.2 supplies the actual curve and universal family, R14.1 its correspondences, and the initial R14.2 prefix its Jacobian, Tate carrier and both Hecke actions. R14.3 constructs the coefficient/support maps and proves the curve-level comparisons. R14.4 applies the lattice-tree amalgam, correctly graded Lyndon sequence and congruence-kernel theorem to the specific level-change maps. R14.5 uses the rational rank-two theorem to compute the actual connected-subvariety quotient. R14.6 applies lower-tier Néron graph/Tate interfaces and the finite diamond-cover cochains.

The R14.2 carrier prefix must be separated from its rank-two conclusion: the latter imports the theorem here. Likewise, the modular semistable comparison uses R11.3/R11.4 without an upward dependency on the weights roadmap. Its nearby-cycle interpretation remains with that owner. The unresolved RS-06 label for general étale–Betti comparison is requested through the lower SF.2 integration layer; de Rham comparison is not a replacement.

## R14.3. Cohomological realizations and pairings

Construct the actual relative H¹ systems before their symmetric powers. The compact-support image, the boundary sequence and coefficient reduction remain separate until the stated vanishing hypotheses identify them. The weight-two rational theorem covers the full Hecke algebra, including old blocks; it does not assert integral Gorensteinness.

### The weight-two Shimura isomorphism is Hecke-equivariant

**Theorem** · `weight-two-shimura-isomorphism` · planet “Weight-two Shimura isomorphism”.

For N ≥ 5, the Hodge decomposition gives S₂(Γ₁(N), ℂ) ⊕ S̄₂(Γ₁(N), ℂ) ≅ H¹(X₁(N)^an, ℤ) ⊗ ℂ, and it identifies ⟨n⟩ ⊕ ⟨n⟩̄ with ⟨n⟩^*, T_p ⊕ T̄_p with T_p^* = (π₁^{(p)})_* ∘ (π₂^{(p)})^* and w_N ⊕ w̄_N with w^*_{e^{2πi/N}}, where π₁^{(p)}, π₂^{(p)} : X₁(N, p) → X₁(N) are the degeneracy maps and (π₁^{(p)})_* is the trace.

Hypotheses and conventions: N ≥ 5 (for N < 5 both sides vanish); the Betti-side integral structure is Tau Ceti ModularForms Layer 8's modular-symbol lattice, whose comparison with H¹(X₁(N)^an, ℤ) is part of this stage.

Proof route:

- Hodge decomposition of the compact Riemann surface X₁(N)^an with H⁰(Ω¹) = S₂(Γ₁(N), ℂ).
- Compute T_p^* on H¹ through the trace along π₁^{(p)} (stalkwise sum with ramification multiplicities) and pullback along π₂^{(p)}; compare with the double-coset action on cusp forms.
- Diamond operators and w_ζ are induced by automorphisms, so pullback commutes with the Hodge decomposition.

Acceptance:

- Conrad omits the proof of the compatibility; a complete proof must check the trace formula against the classical double coset (ModularCurvesPartII R12.5 normalises the differentials and Hecke operators).

Imports: `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `ModularCurvesPartII:R14.3/integral-comparison`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 64 (printed page; PDF page 68) — The isomorphism.; **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 65 (printed page; PDF page 69) — Theorem 5.1.

### Cup product and the Petersson product

**Theorem** · `cup-product-petersson`.

With H²(X₁(N)^an, ℤ) ≅ ℤ by the i-orientation, the cup product pairing on H¹(X₁(N)^an, ℤ) and the non-normalised Petersson product satisfy (Sh(f₁ + ḡ₁), Sh(f₂ + ḡ₂)) = 4π(⟨f₁, g₂⟩ − ⟨f₂, g₁⟩).

Hypotheses and conventions: The cup-product pairing is perfect; the Petersson integral converges by exponential decay at the cusps.

Proof route:

- Use the normalization of Sh in Conrad §5.1, pp. 63–65, rather than unscaled f dz. Compute the wedge of the resulting harmonic representatives and evaluate using the specified i-orientation; with the non-normalized Petersson measure the factor is 4π as in Theorem 5.2, p. 66.

Acceptance:

- Only adjoints matter downstream; the factor 4π is harmless.

Imports: `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `ModularCurvesPartII:R12.5`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 66 (printed page; PDF page 70) — Theorem 5.2 and its use.

### Hecke operators are self-adjoint for the w_ζ-twisted pairing

**Lemma** · `hecke-twisted-self-adjoint`.

With [x, y] = (x, w^*_ζ y) for ζ = e^{2πi/N}, every T ∈ T₁(N) is self-adjoint on H¹(X₁(N)^an, ℤ); for (·,·) the adjoint of T_p^* (p ∤ N) is ⟨p⁻¹⟩^* T_p^* and that of ⟨n⟩^* is ⟨n⁻¹⟩^*. The same holds for any primitive N-th root ζ.

Hypotheses and conventions: T₁(N) ⊂ End_ℤ H¹(X₁(N)^an, ℤ) generated by the T_p^* and ⟨n⟩^*; commutative and finite flat over ℤ (Tau Ceti ModularForms Layer 8 owns the integral Hecke algebra).

Proof route:

- Transport the classical Petersson adjoints (T_p for p | N via w_N) through cup-product-petersson.
- w^*_{ζ^j} ∘ w^*_ζ = ⟨j⟩^*, a unit commuting with T₁(N), reduces general ζ to e^{2πi/N}.

Acceptance:

- The case T = T_p^* with p | N is the subtle one; keep it.

Imports: `ModularCurvesPartII:R14.3/cup-product-petersson`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 66 (printed page; PDF page 70) — Corollary 5.3.

### H¹ is free of rank two over the Hecke algebra

**Theorem** · `betti-free-rank-two` · planet “Rational rank-two cohomology”.

H¹(X₁(N)^an, ℚ) is free of rank 2 over ℚ ⊗ T₁(N), and Hom_ℚ(ℚ ⊗ T₁(N), ℚ) is free of rank 1 (ℚ ⊗ T₁(N) is Gorenstein). Consequently V_ℓ(N) = ℚ_ℓ ⊗ T_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗ T₁(N) for either Hecke action.

Hypotheses and conventions: Characteristic zero coefficients; integral freeness is not claimed (it can fail at Eisenstein maximal ideals).

Proof route:

- Use the twisted perfect pairing to identify rational H¹ with its Q-dual as Hecke modules.
- Over C, the coefficient pairing (f,T)↦a₁(Tf) identifies the dual of S₂, rather than S₂ itself at this point of the proof, with C⊗T. The q-expansion principle and faithful Hecke action prove nondegeneracy on both sides.
- Apply Hodge decomposition to conclude that the dual of H¹ over C is free of rank two; transfer through self-duality and faithfully flat descent over the semilocal rational Hecke algebra.
- Once H¹ is free rank two and self-dual, its two Hecke-dual summands show Hom_Q(Q⊗T,Q) is projective of full support. Q-dimension comparison gives rank one, hence freeness over the semilocal ring.
- Transport to V_ℓJ via the initial Tate comparison, preserving the two adjoint Hecke conventions.

Acceptance:

- Integral freeness after localising at a non-Eisenstein maximal ideal is a separate statement (remaining work).
- This is rational rank-two freeness for the full Hecke algebra of Conrad §5.1, including old blocks; it asserts neither integral Gorensteinness nor integral rank-two freeness at every maximal ideal.

Imports: `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`, `ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `ModularCurvesPartII:R14.3/weight-two-tate-comparison`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 69 (printed page; PDF page 73) — Corollary 5.9.; **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 70 (printed page; PDF page 74) — The key reduction in the proof.

### Geometric weight coefficient systems

**Construction** · `relative-coefficient-system` · planet “Symmetric-power coefficient systems”.

For the universal elliptic curve f:E→Y₁(N), N≥5, construct L_B=R¹f_an,*ℤ and L_{ℓ,n}=R¹f_et,*ℤ/ℓⁿ, with ℓ invertible on the base. Their geometric fibres are H¹ of the elliptic fibre, locally free of rank two. For r=k−2≥0 set L_r=Sym^r L, of rank r+1. The coefficient maps along an isogeny are induced by its pullback on relative H¹; integral lattices and duals are retained before any inversion of ℓ.

Hypotheses and conventions: A universal elliptic curve from R13.2; k≥2, n≥1, ℓ prime; finite étale statements require ℓ invertible. For coarse levels lacking a fine universal family, use a supplied fine cover with its descent data; descent invariants are not exact if the deck-group order is not invertible.

Proof route:

- Import the universal family and proper smooth base change to construct relative degree-one sheaves; on the analytic side transport fibre cohomology through local trivializations.
- Apply the existing symmetric-power functor to each transport map; its identity/composition laws give a local system.
- Use the elliptic cup product and isogeny pullback to fix the covariant/contravariant and Tate-twist conventions.

Uses: `ModularCurvesPartII:R14.3/parabolic-cohomology`: Actual coefficients for parabolic cohomology.; `AutomorphicGaloisRepresentations:R19.1`: Higher-weight geometric eigenspace input with its lattice.

Planning API, in namespace `TauCeti.ModularCurves`:

- `relativeBettiH1` (constructor): The rank-two Betti local system of the supplied universal elliptic family.
- `relativeEtaleH1` (constructor): The finite ℤ/ℓⁿ relative degree-one étale local system.
- `weightCoefficients` (constructor): Sym^{k−2} of the relative H¹ local system, using the existing representation symmetric-power functor.
- `weightCoefficients_fibre` (characterisation): Its fibre at y is Sym^{k−2} H¹(E_y,A), naturally in y and the coefficient ring A.
- `weightCoefficients_isogeny` (functoriality): The coefficient morphism is Sym^{k−2} of the isogeny pullback; identity and composite isogenies give identity and composite maps.
- `weightCoefficients_compare` (compatibility): Artin comparison identifies the finite Betti and étale systems and their isogeny maps.

Discrimination tests:

- `weightCoefficients_two` (degenerate): At k=2, Sym⁰ L is the constant rank-one system.
- `weightCoefficients_three` (computation): At k=3, a fibre is L_y and has rank two.
- `weightCoefficients_compat` (compatibility): On every monodromy representation ρ, the action is exactly Representation.symmetricPower ρ (k−2).
- `weightCoefficients_unipotent` (non-example): At k=3 a cusp loop with fibre matrix [[1,w],[0,1]], w nonzero, acts nontrivially over ℤ; the coefficient system is not constant.

Acceptance:

- For r=0 the coefficient system is constant; for r=1 its fibre has rank two.
- No universal elliptic family is silently put on a coarse level-one curve.

Imports: `ModularCurvesPartII:R13.2`, `AbelianSchemesAndArithmeticModuli:A4`, `tauceti:TauCeti.LocalCoefficientSystem`, `tauceti:TauCeti.LocalCoefficientSystem.pullback`, `tauceti:Representation.symmetricPower`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Source locators: **DELIGNE-355**, §§3.9–3.11, pp. 154–156; §3.16, pp. 157–158 — Relative H¹ of the universal elliptic curve gives the weight-r coefficient system and its isogeny maps; Deligne works rationally, so finite coefficient base change is imported explicitly.

### Finite and adic parabolic cohomology

**Construction** · `parabolic-cohomology` · planet “Parabolic cohomology”.

For j:Y→X the supplied compactification and the geometric L_r with A=O, O/πⁿ or K=Frac(O), define H¹_par(Y,L_r)=im(H¹_c(Y,L_r)→H¹(Y,L_r)). Define finite étale analogues first and take compatible inverse limits for the O-adic realization, with O a finite extension of ℤ_ℓ. For constant weight-two coefficients, H¹_par(Y,A)=im(H¹(X,A)→H¹(Y,A)); for these smooth curves the latter map is injective. Twisted coefficients use j_*L_r and the local boundary sequence, not extension by zero identified with direct image.

Hypotheses and conventions: N≥5 or a supplied torsion-free fine cover; j and its finite cusp set D=X\Y are fixed. Adic notation denotes the inverse-limit lattice, not merely tensoring rational Deligne cohomology.

Proof route:

- Import absolute and relative twisted cochains and compact supports from AlgebraicTopology, and finite étale cohomology from EDC.0.
- Construct the map forgetting support; use its image submodule as the parabolic group.
- Use the boundary exact sequence to compare with compactification cohomology; establish finite coefficient transition maps before taking limits.

Uses: `ModularCurvesPartII:R14.3/boundary-exact-sequence`: Specify the support map whose image is parabolic.; `ModularCurvesPartII:R14.4/degeneracy-cohomology`: Source and target of integral pullbacks.

Planning API, in namespace `TauCeti.ModularCurves`:

- `parabolicH1` (constructor): The image submodule of the actual support-forgetting map u:H¹_c→H¹.
- `mem_parabolicH1` (characterisation): x lies in parabolicH1 u exactly when x=u(y) for a compact-support class y.
- `parabolicH1_inclusion` (projection): The canonical injection into ordinary H¹.
- `parabolicH1_map` (functoriality): For a commuting square b∘u=v∘a, b induces a map of the images; identity and composition are respected.
- `parabolicH1_compact` (compatibility): For proper Y=X, the support map is an isomorphism and parabolic H¹ is ordinary H¹.
- `parabolicH1_inverseLimit` (compatibility): Under the finite generation and transition hypotheses of integral-comparison, the finite-level parabolic system recovers the specified O-lattice.

Discrimination tests:

- `parabolicH1_id` (degenerate): The image of the identity support map is the entire module.
- `parabolicH1_zero` (computation): A zero support map has zero parabolic image.
- `parabolicH1_Gm` (non-example): For Y=G_m(C), constant ℤ coefficients, ordinary H¹≅ℤ but parabolic H¹=0.
- `parabolicH1_compact_test` (compatibility): For the compact curve X₀(11), parabolic constant ℤ H¹ has rank two.

Acceptance:

- On an open genus-zero curve, ordinary boundary classes need not be parabolic.
- The degree-one pro-étale ℤ_ℓ carrier in Mathlib is an untwisted comparison target, not the whole coefficient API.

Imports: `ModularCurvesPartII:R14.3/relative-coefficient-system`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `EtaleDualityAndPerverseSheaves:EDC.0`, `mathlib:LinearMap.range`, `mathlib:AlgebraicGeometry.Scheme.EllAdicCohomology`.

Source locators: **DELIGNE-355**, Definition 3.9, pp. 154–155; (3.20), pp. 159–160 — Parabolic cohomology is the compact-support image. Its integral/finite realization needs the imported cochain and étale infrastructure.

### Boundary and interior cohomology

**Theorem** · `boundary-exact-sequence`.

For a smooth open complex or étale curve with finite puncture set D, the support-forgetting map fits into the cohomology sequence of j_!L→Rj_*L→i_*i^*Rj_*L. In degree one, H¹_par is ker(H¹(Y,L)→⊕_{c∈D}H¹(I_c,L_c)); the neighboring H⁰ and H²_c terms are retained. For trivial A coefficients on a connected curve with s cusps, 0→H¹(X,A)→H¹(Y,A)→A^D→A→0 is exact, where the last map sums residues (and the étale terms carry the residue Tate twist).

Hypotheses and conventions: ℓ is invertible for étale coefficients; local punctured-disc/tame inertia comparison is part of the supplier request. The displayed constant-coefficient residue sequence ending A→0 assumes D is nonempty. If D is empty, retain H²(X,A) and use the identity support map; there is no final residue-surjection claim.

Proof route:

- Apply the localization triangle for j_! and Rj_*; compute each boundary stalk by local inertia cohomology.
- For constant coefficients the local invariant and residue groups are rank one; global orientation/trace identifies the final sum map.
- Pullbacks and traces of finite correspondences induce morphisms of this sequence.

Acceptance:

- Y=X\{one cusp} has no additional ordinary degree-one rank; with two cusps it has one boundary generator.
- Do not replace H¹_par by all of H¹ before a localization argument.

Imports: `ModularCurvesPartII:R14.3/parabolic-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.3`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Source locators: **DELIGNE-355**, Definition 3.9 and (3.20), pp. 154–155, 159–160 — The image formulation and duality require keeping the support and boundary terms distinct.

### Integral comparison and change of level

**Comparison** · `integral-comparison`.

For the supplied smooth finite-type modular curves over Q̄, a chosen embedding Q̄↪C, and finite locally constant ℤ/ℓⁿ coefficients from the universal family, Artin comparison gives H^i_et(Y,L_{r,ℓ,n})≅H^i_B(Y_an,L_{r,B}/ℓⁿ), with compact-support analogues and their support maps. These identify finite parabolic images. After proving the required inverse-limit exactness and finite generation, they give the adic comparison; for r=0 this also identifies the actual compact-curve lattice with Mathlib’s pro-étale EllAdicCohomology in degree one. Pullback, trace, cup product and level maps commute with comparison.

Hypotheses and conventions: The comparison includes local-system coefficients and compact support, not merely constant rational cohomology. Derived-limit obstructions must be eliminated by finite coefficient Mittag–Leffler systems; reduction modulo π commutes only under the torsion hypotheses of localized-freeness.

Proof route:

- Import the general étale–Betti comparison required by RS-06.
- Use naturality with j_!→Rj_* and finite correspondences; apply the coefficient comparison from relative-coefficient-system.
- Apply finite generation and Mittag–Leffler exactness to the finite systems; separately request the comparison with Mathlib’s pro-étale carrier.

Acceptance:

- Trace composed with pullback is degree times identity in each realization.
- Changing the complex embedding changes the comparison choice; Galois invariance is not asserted for that choice.

Imports: `ModularCurvesPartII:R14.3/relative-coefficient-system`, `ModularCurvesPartII:R14.3/parabolic-cohomology`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`.

Source locators: **DELIGNE-355**, Definition 3.9 and discussion of W_ℓ, pp. 154–156; Corollary 4.2, p. 161 — The same geometric space has Betti and algebraic adic descriptions; the general comparison and integral passage are imported rather than re-proved here.

### Hecke operators with relative coefficients

**Theorem** · `geometric-hecke-coefficients`.

For a good prime q∤Nℓ and the actual isogeny correspondence Y₁(N,q) with maps q₁,q₂ and its universal isogeny, T_q on H¹_par(Y,L_r) is trace along q₁ after pullback along q₂ and the induced coefficient map. Its comparison with the classical weight k=r+2 operator uses Deligne’s normalization, including the q^{r+1} term in the good-prime Hecke polynomial. Diamond and prime-to-level degeneracy maps preserve the parabolic image; functorial traces satisfy the projection formula and trace∘pullback=degree.

Hypotheses and conventions: Both direction and scalar normalization are fixed by the universal isogeny, not by an arbitrary action on an unnamed cohomology module.

Proof route:

- Import the geometric correspondence and finite-map traces; apply Sym^r of the isogeny map.
- Make the compact-support and ordinary squares commute, obtaining the map on their images.
- Apply comparison and the analytic normalization of ModularForms; distinguish T_q from a rescaled double-coset operator.

Acceptance:

- At r=0 this recovers the weight-two Shimura convention.
- Changing the isogeny pullback to its dual without changing Tate twists must fail the pairing adjoint test.

Imports: `ModularCurvesPartII:R14.3/integral-comparison`, `ModularCurvesPartII:R14.3/parabolic-cohomology`, `ModularCurvesPartII:R14.1`, `EtaleDualityAndPerverseSheaves:EDC.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.

Source locators: **DELIGNE-355**, Propositions 3.18–3.19 and (3.20), pp. 158–160 — The isogeny pull-push construction matches the classical Hecke operator with its weight factor.

### Parabolic Poincaré pairing

**Theorem** · `parabolic-duality` · planet “Parabolic Poincaré duality”.

The elliptic cup product L⊗L→A(−1) induces Sym^r L⊗Sym^r L→A(−r). For A=K it is perfect. For finite or integral coefficients assume r! is a unit (in particular ℓ>r); then the symmetrized tensor pairing is perfect with the chosen normalization. On parabolic H¹ it induces a pairing into A(−r−1), alternating for even r and symmetric for odd r. The rational pairing is nondegenerate; integral/finite perfection is exported only in the localized setting of localized-freeness, where boundary and coefficient-reduction obstructions vanish. Pullback and trace are adjoint.

Hypotheses and conventions: A complete DVR O of residue characteristic ℓ; finite coefficients O/πⁿ; integral conclusion additionally needs finite freeness and boundary conditions. At ℓ≤r no integral perfectness is inferred from Deligne’s rational statement; a different divided-power lattice would require its own comparison.

Proof route:

- Form the coefficient pairing by symmetrizing products of the alternating rank-two elliptic pairing; invert r! when necessary.
- Apply EDC.2 curve duality to j_*L and its dual, or Betti Poincaré–Lefschetz duality.
- Restrict the compact-support/ordinary pairing to their common image, using the vanishing and exactness hypotheses to prove integral perfection.
- The sign is the coefficient sign (−1)^r times the degree-one cup sign.

Acceptance:

- r=0 gives an alternating curve pairing; r=1 gives a symmetric pairing.
- A rationally perfect pairing whose determinant is divisible by ℓ is not an integral acceptance case.

Imports: `ModularCurvesPartII:R14.3/relative-coefficient-system`, `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`, `ModularCurvesPartII:R14.3/localized-freeness`, `EtaleDualityAndPerverseSheaves:EDC.2`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Source locators: **DELIGNE-355**, (3.20), pp. 159–160 — Coefficient pairing, rational nondegeneracy, parity and the degree formula are stated there; integral perfection requires the extra lattice hypotheses.

### Non-Eisenstein removal of the boundary

**Theorem** · `boundary-non-eisenstein`.

For weight-two constant coefficients at a torsion-free congruence level and an anemic Hecke maximal ideal m of residue characteristic ℓ≥3, call m non-Eisenstein if its good-prime eigenvalues are not ψ₁(q)+qψ₂(q) with ψ₁,ψ₂ finite congruence characters and diamond product ψ₁ψ₂. The cusp boundary modules and H⁰(Y,O/π) have only those Eisenstein eigensystems. Thus they vanish after localization at m, and H¹_c→H¹ identifies its localized image with ordinary localized H¹. For Sym^r coefficients the same implication is a separate requested calculation, not an assertion from the weight-two source.

Hypotheses and conventions: Anemic operators exclude level and residue-characteristic primes; fine level removes stabilizer torsion. In weight two this definition is an algebraic Hecke condition; the identification with residual Galois irreducibility is a consequence in R19, not a prerequisite here.

Proof route:

- Compute the two parts of the good-prime correspondence on cusps from R14.1: one permutes with multiplicity q and the other with multiplicity one.
- Diagonalize the finite cusp action after extending residue coefficients; obtain the displayed sums of congruence characters.
- Apply exact localization to the boundary sequence; compute H⁰ by constants.

Acceptance:

- An Eisenstein maximal ideal may retain cusp classes.
- The statement does not demand a Galois representation theorem to define non-Eisenstein localization.

Imports: `ModularCurvesPartII:R14.3/boundary-exact-sequence`, `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`, `ModularCurvesPartII:R14.1`.

Source locators: **TAYLOR-WILES**, Proof of Proposition 1 and preceding localization setup, author pp. 6–8 — Localized irreducible weight-two cohomology replaces open-curve cohomology by the cuspidal module; the boundary calculation must precede that replacement.

### Finite generation and localized integral freeness

**Theorem** · `localized-freeness`.

For a torsion-free congruence modular curve Y and a finite free O-local system L, H¹(Y,L) is O-finite. If H⁰(Y,L/π)_m=0, the localized group H¹(Y,L)_m is O-torsion-free, hence O-free; if in addition the boundary sequence localizes to zero, it equals H¹_par(Y,L)_m, and reduction gives H¹_par(Y,L)_m/πⁿ≅H¹_par(Y,L/πⁿ)_m. Constant weight-two coefficients satisfy these conditions at the non-Eisenstein ideals of boundary-non-eisenstein. Higher-weight claims retain the displayed vanishing conditions until the separate boundary gap is resolved.

Hypotheses and conventions: O is a complete DVR finite over ℤ_ℓ; anemic localization is a direct summand of the completed O-finite Hecke module. Use a finite graph deformation retract of the noncompact torsion-free quotient; its two-term cochain complex has finite free terms.

Proof route:

- Import the Fuchsian finite-type/free-group model and twisted cochains.
- The coefficient sequence 0→L→L→L/π→0 shows π-torsion in H¹ is the image of H⁰(L/π); the localized vanishing kills it.
- A finite torsion-free module over a DVR is free; graph cohomological dimension one removes H² obstructions to reduction.
- Use the boundary sequence at O and finite levels to identify ordinary and parabolic groups under the stated vanishings.

Acceptance:

- No freeness over the integral Hecke algebra is asserted.
- At level divisible by ℓ, or with coarse stabilizers, the displayed geometric and vanishing hypotheses must be checked afresh.

Imports: `ModularCurvesPartII:R14.3/boundary-exact-sequence`, `ModularCurvesPartII:R14.3/boundary-non-eisenstein`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

Source locators: **TAYLOR-WILES**, Proof of Proposition 1, author pp. 7–8 — Free congruence groups give finite cochains; compact localized cohomology is recovered only after boundary removal.; **DELIGNE-355**, Definition 3.9 and (3.20), pp. 154–155, 159–160 — The integral statement refines the rational parabolic realization with explicit torsion hypotheses.

### Modular symbols and the geometric lattice

**Comparison** · `symbols-geometric-comparison`.

For the supplied torsion-free congruence quotient, identify the homological modular-symbol module of ModularForms Layer 8 with relative H₁(X_an,D;Sym^r lattice) using its Manin presentation, with the appropriate coefficient dual when pairing against L_r. The boundary map corresponds to restriction to cusp divisors. The cuspidal kernel modulo torsion pairs with H¹_par; rationally, and integrally under the torsion and perfectness hypotheses already displayed, this gives its dual cohomological lattice. The period map of ModularForms is integration against this homology and acts on symbols by transpose, not by an identification of forms with symbols.

Hypotheses and conventions: The symbol lattice is the existing coinvariants of Div⁰(P¹(Q))⊗Sym^r(ℤ²), not a second definition of that object. Integral conclusions use the local coefficient dual and saturation; the whole symbol module contains boundary and may contain torsion.

Proof route:

- Import Manin generators and relations and the relative singular-chain model.
- Send a cusp difference with coefficient to its geodesic chain; use polygon relations and endpoint boundary maps to obtain the comparison.
- Use duality to pass from cuspidal relative homology to parabolic cohomology, keeping the torsion-free quotient and coefficient dual explicit.
- Match integration and Hecke pull-push to the existing period functional.

Acceptance:

- The period map lands in the dual of symbols, as the current ModularForms roadmap requires.
- The boundary quotient is not erroneously retained as part of compact H¹.

Imports: `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `ModularCurvesPartII:R14.3/parabolic-duality`.

Source locators: **DELIGNE-355**, §3.11, p. 156 and (3.20), pp. 159–160 — Geometric cohomology is the realization underlying the period comparison; the integral symbol presentation is imported from its existing owner.; **RIBET-STEIN-SERRE-LECTURES**, Theorems 5.1–5.2, pp. 65–66 — Weight-two Hodge classes and integration determine the normalization of the comparison.

### The actual Jacobian Tate realization

**Comparison** · `weight-two-tate-comparison`.

For J=Pic⁰(X₁(N)/Q), the canonical comparison identifies T_ℓJ with H¹_et(X₁(N)_Q̄,ℤ_ℓ(1)) and with the dual of untwisted H¹, using the principal polarization; equivalently T_ℓJ is integral first homology after Betti comparison. The comparison is functorial for Picard and Albanese actions, which are adjoint rather than identical. After tensoring Q_ℓ it transports the rational rank-two computation to V_ℓJ for both Hecke conventions.

Hypotheses and conventions: This comparison precedes rank-two freeness. The initial Tate carrier and functoriality from R14.2 must not depend on betti-free-rank-two.

Proof route:

- Apply the Kummer sequence for the Jacobian/Picard functor to identify ℓⁿ torsion with finite curve H¹(1).
- Pass to limits using the supplied Tate module construction; compare cup and Weil pairings.
- Use polarization to relate Picard pullback to Albanese norm; apply the integral comparison on the Betti side.

Acceptance:

- A Tate twist or a dual cannot be omitted when comparing T_ℓJ with untwisted H¹.
- The comparison supplies the actual Jacobian module, not an abstract module declared free by definition.
- With Conrad’s Weil-pairing convention, the diagram comparing cup and Weil pairings anticommutes (§5.1, p. 69). Preserve that sign; it does not change the resulting adjoints.

Imports: `ModularCurvesPartII:R14.2`, `AbelianSchemesAndArithmeticModuli:A4`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `ModularCurvesPartII:R14.3/integral-comparison`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, §5.1, (5.4) and Theorem 5.8, pp. 68–69; Corollary 5.9, pp. 69–70 — The Tate/homology comparison and the two Hecke actions transport the rational freeness theorem.

## R14.4. Ihara and level change

Ordinary degree-one characters have a congruence kernel. Compact weight-two Γ₁ cohomology has integral saturated injectivity. Selected Taylor–Wiles roots have finite-coefficient control. These are three distinct conclusions, with distinct levels and localizations.

### The two geometric degeneracy pullbacks

**Construction** · `degeneracy-cohomology`.

For Γ=Γ₁(N) and p prime with p∤N, put Γ′=Γ₁(N)∩Γ₀(p); both maps δ₁,δ_p:X_Γ′→X_Γ come from the moduli correspondence. With the specified isogeny coefficient maps, define d_p(x,y)=δ₁^*x+δ_p^*y on the compact, ordinary, compact-support or parabolic cohomology groups where those maps are defined. On ordinary group characters the kernel equation is equally expressed by D_p(ψ,φ)=ψ|_{Γ′}−φ∘(g↦AgA⁻¹), A=diag(p,1), after negating the second summand. This sign change is recorded, not treated as a change of level.

Hypotheses and conventions: Mixed Γ₁(N)∩Γ₀(p) is not Γ₁(Np). Coefficients O or O/πⁿ; constant coefficients for the integral compact Ihara result, Sym^r only with explicitly checked coefficient maps.

Proof route:

- Import δ₁,δ_p from R14.1 and their coefficient maps from R14.3.
- Form the coprod of the actual two pullbacks; prove the support squares and common anemic Hecke equivariance.
- Identify conjugation by A with the second analytic level map; negation of one source copy relates sum and difference conventions.

Uses: `ModularCurvesPartII:R14.4/compact-ihara`: The compact weight-two map whose mod-ℓ injection gives saturation.; `ModularCurvesPartII:R14.4/principal-ihara`: The ordinary restriction difference used in the congruence-kernel theorem.

Planning API, in namespace `TauCeti.ModularCurves`:

- `degeneracyH1` (constructor): For the actual pullbacks a,b:H→H′, degeneracyH1 a b sends (x,y) to a(x)+b(y).
- `degeneracyH1_apply` (simp): Evaluation on a pair is the sum of its two geometric images.
- `degeneracyH1_fst` (simp): The first source inclusion composes to a.
- `degeneracyH1_snd` (simp): The second source inclusion composes to b.
- `degeneracyH1_hecke` (compatibility): If a and b intertwine the same anemic operators, their coprod intertwines the product action.
- `degeneracyH1_sign` (equivalence): Negating the second source converts the sum convention into the ordinary restriction-difference convention.

Discrimination tests:

- `degeneracyH1_first` (computation): With a=id and b=0 on O, (3,5) maps to 3.
- `degeneracyH1_diagonal` (non-example): With a=b=id on O, (1,−1) is in the kernel; injection is a geometric theorem, not a generic property of coprods.
- `degeneracyH1_zero` (degenerate): Two zero maps give the zero map.
- `degeneracyH1_comp` (compatibility): Postcomposing by c gives degeneracyH1 (c∘a) (c∘b).

Acceptance:

- Away from Np the map commutes with T_q and diamonds.
- Do not substitute a map to Γ₁(Np) unless the extra covering and its torsion are explicitly handled.

Imports: `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`, `mathlib:LinearMap.coprod`.

Source locators: **RIBET-1984**, §3, p. 507; §4, pp. 510–513 — The mixed-level degeneracy map on Jacobians and compact cohomology.; **CDT-2025**, §4.6, Lemma 4.6.2, p. 33 — Ordinary degree-one restriction uses the difference of the two character maps.

### The principal-level SL₂ amalgam

**Theorem** · `modular-amalgam` · planet “The SL₂ amalgam”.

For N≥3 and prime p∤N, let Γ_N(R)=ker(SL₂(R)→SL₂(ℤ/N)) for R=ℤ[1/p], and Γ(N)=Γ_N(ℤ). The natural inclusions and conjugation by A=diag(p,1) identify Γ_N(ℤ[1/p]) with Γ(N)*_{Γ(N)∩Γ₀(p)}A⁻¹Γ(N)A. The associated SL₂(Q_p) lattice tree has a fundamental edge with these vertex and edge stabilizers; the action preserves vertex type. The central quotient or signed Γ(N) variant must be changed consistently throughout the presentation.

Hypotheses and conventions: p and N are coprime; A is invertible over ℤ[1/p] and conjugates preserve reduction level because p is a unit modulo N. The tree vertices are homothety classes of rank-two ℤ_p lattices; adjacent representatives have quotient of order p.

Proof route:

- Construct the lattice tree and verify connectivity and unique geodesics by elementary divisors over ℤ_p.
- Identify the standard adjacent-lattice stabilizers in SL₂ and their arithmetic intersections.
- Use strong approximation/density, together with surjectivity of reductions prime to p, to show the principal congruence arithmetic group has that edge as fundamental domain.
- Apply the tree presentation, retaining the two distinct embeddings of the edge subgroup.

Acceptance:

- At p|N the statement is not asserted.
- An unrestricted PGL₂ action that exchanges vertex types does not have this same amalgam.

Imports: `mathlib:groupCohomology.H1`.

Source locators: **SERRE-TREES**, II §1.4, Theorem 3 and Corollary 2, p. 110 — Fundamental-edge criterion and SL₂(ℤ[1/p]) presentation.; **CDT-2025**, §4.4, pp. 27–28; proof of Lemma 4.6.2, pp. 33–34 — The principal-level subgroup has the corresponding amalgam.

### Congruence subgroup property of SL₂(ℤ[1/p])

**Theorem** · `congruence-subgroup-property` · planet “Congruence subgroup property”.

For a prime p every finite-index subgroup H of SL₂(ℤ[1/p]) contains ker(SL₂(ℤ[1/p])→SL₂(ℤ/m)) for some positive m coprime to p. The same conclusion, intersected with Γ_N(ℤ[1/p]), holds for every finite-index subgroup of that principal-level group. This is the split real S-arithmetic specialization of Serre’s congruence kernel theorem, with S={∞,p}; it is not a statement about all finite-index subgroups of SL₂(ℤ).

Hypotheses and conventions: Serre’s condition |S|≥2 and the real-place alternative both hold. The proof uses the specific S-arithmetic congruence kernel theorem; its deeper central-extension input is recorded as a gap rather than imported from an unrelated profinite-power roadmap.

Proof route:

- Apply Serre §2.6 Theorem 2 and Corollary 3 with Q and S={∞,p}.
- Translate the trivial congruence kernel into the stated finite-index containment.
- A finite-index subgroup of Γ_N is also finite index in SL₂(ℤ[1/p]); intersect the congruence kernel with Γ_N.

Acceptance:

- Finite characters of Γ_N(ℤ[1/p]) factor through a finite congruence quotient.
- The conclusion is not derived from mere density of the group in SL₂(Q_p).

Imports: `ModularCurvesPartII:R14.4/modular-amalgam`.

Source locators: **SERRE-CSP**, §2.6, Theorem 2 and Corollary 3, pp. 498–500 — The real-place S-arithmetic congruence kernel is trivial when S contains at least two places.; **CDT-2025**, Proof of Lemma 4.6.2, p. 34 — A finite character of the amalgam factors through a congruence quotient by this theorem.

### Lyndon sequence for the modular amalgam

**Theorem** · `lyndon-exact-sequence` · planet “Lyndon exact sequence”.

For the actual amalgam G=G₁*_{H}G₂ of modular-amalgam and a G-module M, there is a natural exact sequence …→H^i(G,M)→H^i(G₁,M)⊕H^i(G₂,M)→H^i(H,M)→H^{i+1}(G,M)→…, with the middle map the difference of restrictions along the two embeddings. At i=0 it begins with invariants. The same sequence is equivariant for double-coset maps that preserve the diagram, using restriction and transfer with the displayed coefficient actions.

Hypotheses and conventions: M is an actual representation of the amalgam; the two restricted modules on H are identified through that representation. The degree of the first displayed group is i, not i−1.

Proof route:

- Use the cellular chain sequence of the contractible tree: 0→ℤ[G/H]→ℤ[G/G₁]⊕ℤ[G/G₂]→ℤ→0.
- Apply a group-cohomology resolution, Shapiro and the connecting morphisms, or equivalent classifying-space Mayer–Vietoris.
- Construct correspondence maps on this chain sequence to obtain the equivariance required for the normalized U_p² argument.
- Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

Acceptance:

- H⁰(G,M) is the kernel of the difference on vertex invariants.
- For trivial M=F_q, an agreeing pair of characters descends to a character of G.

Imports: `ModularCurvesPartII:R14.4/modular-amalgam`, `mathlib:groupCohomology.H1`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `mathlib:groupCohomology.coindIso`.

Source locators: **SERRE-TREES**, II §2.8, Proposition 13 and example, pp. 168–170 — Tree homology gives the exact cohomological sequence, with the correct degree.; **CALEGARI-GERAGHTY**, Lemma 9.6, pp. 89–90 (author preprint); Springer-layout author copy PDF pp. 122–123 — The modular double-coset application uses this sequence; its displayed degree is corrected here.

### Congruence classes in ordinary H¹

**Definition** · `congruence-classes` · planet “Congruence cohomology classes”.

For Γ(N)⊂SL₂(ℤ), N≥3, and a prime q, identify ordinary H¹(Γ(N),F_q) with Hom(Γ(N),F_q) for the trivial additive action. Define H¹_cong as the subspace of characters ψ for which Γ(M)⊂ker ψ for some positive M divisible by N. Equivalently it is the directed union of the pullbacks of characters of finite congruence quotients Γ(N)/Γ(M). It is not defined as all ordinary cohomology or as the parabolic subspace.

Hypotheses and conventions: All principal kernels are taken in SL₂(ℤ), consistently with the chosen signed/central quotient convention.

Proof route:

- Use the trivial-action H¹-to-character comparison.
- The common refinement lcm(M₁,M₂) proves closure under addition and scalar multiplication, giving a submodule.
- Use quotient descent to prove the finite-congruence-quotient characterization.

Uses: `ModularCurvesPartII:R14.4/principal-ihara`: Precise kernel bound.; `ModularCurvesPartII:R14.4/enhanced-ihara`: The residual congruence-class conclusion at Γ₁(p) level.

Planning API, in namespace `TauCeti.ModularCurves`:

- `congruenceClasses` (constructor): For the directed family Γ(M) inside Γ(N), the submodule of additive characters killing one of these kernels.
- `mem_congruenceClasses` (characterisation): Membership is equivalent to vanishing on some Γ(M), N|M.
- `congruenceClasses_refine` (relation): A character killing Γ(M) also kills Γ(M′) whenever M|M′.
- `congruenceClasses_quotient` (universal-property): A character killing Γ(M) descends uniquely to Γ(N)/Γ(M).
- `congruenceClasses_restrict` (functoriality): Restriction to a deeper principal subgroup preserves congruence classes.
- `congruenceClasses_H1` (compatibility): The classifying map is the actual trivial-action H¹/character isomorphism.

Discrimination tests:

- `congruenceClasses_zero` (degenerate): The zero character kills every deeper principal subgroup.
- `congruenceClasses_finiteQuotient` (compatibility): Pulling back a character of Γ(N)/Γ(M) gives a member.
- `congruenceClasses_joint` (characterisation): If ψ kills Γ(M₁) and φ kills Γ(M₂), ψ+φ kills Γ(lcm(M₁,M₂)).
- `congruenceClasses_noncongruence` (non-example): At Γ(3) with F₅ coefficients the congruence subspace is zero, whereas ordinary H¹ has dimension three. A nonzero ordinary character is therefore not a congruence class. Use the pro-3 level factor and the perfectness/abelianization of the other SL₂(Z_p) factors, as in CDT §4.5, to check the finite congruence quotients.

Acceptance:

- The zero character is congruence; every character pulled from Γ(N)/Γ(M) is congruence.
- A character known only to have finite image is not thereby proved congruence.

Imports: `mathlib:groupCohomology.H1`, `mathlib:CongruenceSubgroup.Gamma`, `mathlib:groupCohomology.H1IsoOfIsTrivial`, `tauceti:CongruenceSubgroup.Gamma_le_Gamma_of_dvd`.

Source locators: **CDT-2025**, §4.5, definition of H¹_cong, pp. 29–30; Lemma 4.6.2, p. 33 — The ordinary characters trivial at a deeper principal level are exactly the congruence classes.

### Principal-level Ihara modulo congruence classes

**Theorem** · `principal-ihara` · planet “Ihara modulo congruence classes”.

For N≥3 and primes p,q with p∤N, the kernel of D_p:H¹(Γ(N),F_q)²→H¹(Γ(N)∩Γ₀(p),F_q), D_p(ψ,φ)(g)=ψ(g)−φ(AgA⁻¹), is contained in H¹_cong(Γ(N),F_q)². There is no requirement q≠p in this ordinary character theorem, and no unconditional injectivity assertion.

Hypotheses and conventions: Trivial F_q coefficients; ordinary group cohomology, not compact cohomology or an arbitrary Sym^r system.

Proof route:

- An element of the kernel is an agreeing pair of additive characters for the amalgam, so it extends to a character of Γ_N(ℤ[1/p]).
- Its image is finite. Apply congruence-subgroup-property to its kernel.
- Restrict the resulting congruence factorization back to each integral vertex subgroup; both original characters lie in H¹_cong.

Acceptance:

- Kernel zero follows only after independently killing the congruence subspaces in the chosen quotient/localization.
- The q=p case is covered by this character argument, not by ℓ-adic geometric smoothness.

Imports: `ModularCurvesPartII:R14.4/degeneracy-cohomology`, `ModularCurvesPartII:R14.4/congruence-classes`, `ModularCurvesPartII:R14.4/lyndon-exact-sequence`, `ModularCurvesPartII:R14.4/congruence-subgroup-property`.

Source locators: **CDT-2025**, Lemma 4.6.2 with proof, pp. 33–34 — Kernel classes extend to the S-arithmetic group and are therefore congruence characters.

### The enhanced principal-level kernel bound

**Theorem** · `enhanced-ihara`.

With N,p,q as in principal-ihara, the kernel of the same restriction difference into H¹(Γ(N)∩Γ₁(p),F_q) is also contained in H¹_cong(Γ(N),F_q)². The congruence-invariance criterion used here says that if every conjugation difference for a character of a principal subgroup is congruence, then the character itself is congruence, as in CDT Corollary 4.5.3 with the SL₂(Z/N)-action induced by ambient SL₂(ℤ) conjugations.

Hypotheses and conventions: This is still trivial-coefficient ordinary H¹ and still a kernel bound, not automatic injectivity.

Proof route:

- Restriction to Γ(N)∩Γ₁(p) implies that the disagreement on Γ(N)∩Γ₀(p) is a congruence class because the quotient of these two groups is congruence.
- Follow the ambient conjugations in CDT Lemma 4.6.3 and apply Corollary 4.5.3 to the two source characters.
- Use the principal-level kernel bound after the congruence error is removed.

Acceptance:

- The enhancement is not proved by treating restriction across a finite quotient as injective when q divides its order.

Imports: `ModularCurvesPartII:R14.4/principal-ihara`, `ModularCurvesPartII:R14.4/congruence-classes`, `ModularCurvesPartII:R14.4/congruence-invariance`.

Source locators: **CDT-2025**, Corollary 4.5.3, p. 29; Lemma 4.6.3, p. 34 — Congruence invariance strengthens the Γ₀(p) kernel bound to Γ₁(p); the ambient conjugations must be retained.

### Compact weight-two Ihara and saturation

**Theorem** · `compact-ihara` · planet “Compact Ihara lemma”.

For N≥5 and prime p∤N, let X′ be the compact curve of Γ₁(N)∩Γ₀(p). The map δ₁^*+δ_p^*:H¹(X₁(N),F_ℓ)²→H¹(X′,F_ℓ) is injective for every prime ℓ. Equivalently the sum of the two Jacobian pullbacks J₁(N)²→Jac(X′) has trivial kernel (Ribet Corollary 4.2). The corresponding integral H¹ map has torsion-free cokernel; after O-extension it is saturated and remains injective modulo πⁿ. For Γ₀(N), Ribet Theorem 4.3 gives kernel the anti-diagonal Shimura subgroup, not unconditional injectivity; localization away from its Eisenstein support removes that kernel.

Hypotheses and conventions: Weight two means constant coefficients. The compact curves are smooth in characteristic zero, so no ℓ∤N hypothesis is added to this Betti statement. The Γ₀ version needs a supplied Shimura subgroup and its Eisenstein Hecke action; small levels and stabilizers use their actual compact curves.

Proof route:

- Ribet’s compact homology proof quotients ordinary abelianizations by the subgroups generated by parabolics; the amalgam and CSP show the two-map integral homology map is surjective.
- Dualize the compact free homology lattices to obtain integral cohomology injection with saturated image.
- Alternatively use the zero Jacobian kernel of Corollary 4.2 and the Tate comparison; reduce the saturated integral map at every ℓ.
- For Γ₀ retain the anti-diagonal Shimura kernel of Theorem 4.3 and remove it only under the explicit support hypothesis.

Acceptance:

- This supplies the mixed-level, weight-two cohomological Ihara input of R20.2 even when ℓ|N.
- It does not supply the exceptional-image or multiplicity-one steps of mod-two level lowering.
- For N=11,p=2, the source compact rank is 2·2=4, and its image in the mixed level has saturated rank four.

Imports: `ModularCurvesPartII:R14.4/degeneracy-cohomology`, `ModularCurvesPartII:R14.4/modular-amalgam`, `ModularCurvesPartII:R14.4/congruence-subgroup-property`, `ModularCurvesPartII:R14.3/weight-two-tate-comparison`, `ModularCurvesPartII:R14.2`.

Source locators: **RIBET-1984**, Theorem 4.1, Corollary 4.2 and Theorem 4.3, pp. 510–513 — The compact Jacobian result and its parabolic homology proof yield integral saturation, including the distinct Γ₀ kernel.

### Taylor–Wiles degeneracy control

**Theorem** · `taylor-wiles-root-control`.

For constant coefficients O/πⁿ, odd residue characteristic ℓ, torsion-free modular level Γ with p∤Nℓ, and a localized cyclotomic-determinant residual eigensystem at which p≡1 mod ℓ and T_p has residual roots α,β with αβ=1 and α≠β, the two degeneracy images identify H^i(Y,O/πⁿ)_m² with the sum of the two selected old-root factors in H^i(Y₀(p),O/πⁿ). Localization additionally at U_p−α identifies its factor with one copy of H^i(Y,O/πⁿ)_m. The operator normalization is the one in CG Lemma 9.6; in the general character setting the off-diagonal diamonds must be restored and checked, not suppressed.

Hypotheses and conventions: α,β∉{1,−1} follows from odd ℓ and αβ=1, α≠β. The full anemic localized target is not asserted to have no additional U_p=±1 factors; those are killed in the selected U_p²−1 localization.

Proof route:

- Compute trace∘pullback matrix [[p+1,T_p],[T_p,p+1]] and its determinant (p+1)²−T_p²; it is a unit at the selected residual roots.
- Use the correctly graded Lyndon sequence: the normalized double-coset operator for diag(p,p⁻¹) acts as identity on the amalgam terms.
- Localize at U_p²−1 to remove both adjacent amalgam terms and identify the two-copy old factors.
- Apply the idempotent for the distinct roots and descend across any elementary two-group component quotient, whose order is invertible.

Acceptance:

- The repeated-root case α=β is excluded.
- The proof cannot use exact invariants for a quotient whose order is divisible by ℓ.

Imports: `ModularCurvesPartII:R14.4/lyndon-exact-sequence`, `ModularCurvesPartII:R14.4/degeneracy-cohomology`, `ModularCurvesPartII:R14.3/localized-freeness`.

Source locators: **CALEGARI-GERAGHTY**, Lemma 9.6 and Remarks 9.7–9.8, pp. 88–90; author Springer-layout copy PDF pp. 120–123 — The all-degree finite-coefficient root-control argument; the degree and determinant misprints are corrected, and localization at the root is made explicit.

### Congruence invariance of ordinary characters

**Theorem** · `congruence-invariance`.

For N≥3, prime q and η∈H¹(Γ(N),F_q), let SL₂(Z/N) act by the conjugations of ambient SL₂(Z). If gη−η belongs to H¹_cong(Γ(N),F_q) for every g∈SL₂(Z/N), then η itself belongs to H¹_cong. Equivalently, the direct limit of ordinary H¹ over principal levels, with restriction transition maps, has no SL₂(Ẑ)-invariants. This direct-limit character input is the specific prerequisite of enhanced-ihara, rather than a completion of the completed-cohomology roadmap.

Hypotheses and conventions: The action factors through the finite quotient because inner conjugation acts trivially on trivial-coefficient H¹. The coefficient prime may be 2 or 3; the proof retains the exceptional small-prime calculations.

Proof route:

- Pass to the restriction direct limit; its kernel from a finite level consists exactly of the congruence classes, and the hypothesis makes the image invariant.
- Follow CDT §§4.5.4–4.5.9: finite SL₂ homology, continuous cohomology of SL₂(Z_p), Künneth and Hochschild–Serre isolate coefficient primes 2,3,5 and show the relevant H² restriction vanishes at deeper levels.
- Use the genus-zero cusp representation at levels 3 and 5 with coefficients F₃ and F₅ respectively; at coefficient prime 2 use the level-8 to level-16 calculation. Lemma 4.5.11’s printed F₃ at level 5 is replaced by F₅, as required in its application.
- Apply the two five-term sequences of (4.5.10) and the corrected finite-level invariant computations to kill the invariant limit class. The source’s computer calculation at levels 8/16 and Lazard/adjoint-cohomology inputs remain proof-chain refinements in the recorded gap.

Acceptance:

- The condition must hold for every ambient finite-quotient conjugation, not just one level-changing element.
- An arbitrary noncongruence character cannot be declared congruence just because its codomain is finite.

Imports: `ModularCurvesPartII:R14.4/congruence-classes`, `mathlib:groupCohomology.H1`.

Source locators: **CDT-2025**, Theorem 4.5.2 and Corollary 4.5.3, p. 29; Lemmas 4.5.4–4.5.11 and proof, pp. 30–32; published §§4.5–4.6, pp. 661–666 — The no-invariants theorem gives the finite-level criterion; retain the small-prime proof and corrected coefficient in the level-5 computation.

## R14.5. Weight-two modular quotients

The connected abelian subvariety generated by Hecke-ideal images is formed before taking its quotient. Dimension and differential eigenspaces are proved consequences. Analytic oldform multiplicities are imported from the current owner and transported through the geometric comparisons.

### The Hecke prime and coefficient field of a newform

**Definition** · `newform-hecke-prime` · planet “Newform Hecke prime”.

For a normalized cuspidal newform f of weight exactly two and primitive level N, import its coefficient field K_f from ModularForms Layers 8/8G. The geometric Hecke action gives the eigenvalue character λ_f:T₁(N)→K_f. Set p_f=ker λ_f; it is a minimal prime and (T₁(N)/p_f)⊗Q≅K_f. Coefficient fields, integrality of eigenvalues and the notion of newform are imports, not definitions of this layer.

Hypotheses and conventions: f a normalised newform of weight 2 and level exactly N (Tau Ceti ModularForms Layer 4).

Proof route:

- The eigenvalue map T₁(N) → ℂ has image the order ℤ[a_n(f)] ⊂ K_f; its kernel is prime.
- Minimality: T₁(N) ⊗ ℚ is reduced on the newform part (multiplicity one), so p_f is minimal.

Uses: `ModularCurvesPartII:R14.5/modular-quotient`: The actual ideal cutting out the modular quotient.; `ModularCurvesPartII:R14.5/quotient-tate-exact`: The ideal acting on the rational Tate module.

Planning API, in namespace `TauCeti.ModularCurves`:

- `heckePrime` (constructor): Kernel ideal of the imported geometric eigenvalue character λ_f.
- `mem_heckePrime` (characterisation): t∈p_f iff λ_f(t)=0.
- `heckePrime_isPrime` (structure): The character lands in a field, so p_f is prime.
- `heckePrime_quotient` (equivalence): The rationalized quotient is K_f; the integral quotient is the eigenvalue order, not necessarily the maximal order.
- `heckePrime_conjugate` (compatibility): Postcomposing λ_f with a field embedding does not change its kernel.

Discrimination tests:

- `heckePrime_int` (computation): The kernel of ℤ→ℚ is zero.
- `heckePrime_projection` (characterisation): For the first projection ℚ×ℚ→ℚ, the kernel is {0}×ℚ.
- `heckePrime_embedding` (compatibility): An injective field embedding on the target preserves the kernel.

Acceptance:

- Weak multiplicity one gives a_n(f) ∈ K_f for all n.

Imports: `ModularCurvesPartII:R14.2`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`, `mathlib:RingHom.ker`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 73 (printed page; PDF page 77) — K_f.; **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 73 (printed page; PDF page 77) — p_f.

### The modular abelian variety A_f

**Construction** · `modular-quotient` · planet “Modular abelian quotient”.

With the Picard Hecke action on J₁(N), let B_f be the connected abelian subvariety generated by all images t(J₁(N)), t∈p_f. Define A_f=J₁(N)/B_f over Q with its surjective quotient map q_f. It has good reduction outside N and an action of the order T₁(N)/p_f; the K_f action is in End⁰(A_f). This is a quotient by an actual abelian subvariety, not a pointwise module quotient or an assumed Galois representation.

Hypotheses and conventions: N ≥ 5 (for N < 5, S₂(Γ₁(N)) = 0). Convention: Conrad takes the Picard ( )^* action of T₁(N) on Pic⁰; Ribet–Stein take the quotient by the image of the annihilator of f in T; the two give isogenous quotients.

Proof route:

- Form the abelian subvariety Σ_{t ∈ p_f} t(J₁(N)) (finitely many generators of p_f suffice) and take the quotient abelian variety over ℚ (AbelianSchemesAndArithmeticModuli A2).
- Good reduction over ℤ[1/N]: J₁(N) is the Néron model of an abelian scheme over ℤ[1/N] and quotients of abelian schemes by abelian subschemes are abelian schemes (or Néron–Ogg–Shafarevich).

Uses: `ModularCurvesPartII:R14.5/modular-quotient-dimension`: Compute the dimension from the actual quotient Tate module.; `EllipticCurveModularity:R29.5`: The surjective quotient and nonconstant curve map, before any isogeny to a specified elliptic curve.

Planning API, in namespace `TauCeti.ModularCurves`:

- `modularQuotient` (constructor): The actual abelian variety J₁(N)/B_f, with the chosen Picard convention.
- `modularQuotient_map` (projection): The surjective Q-homomorphism q_f:J₁(N)→A_f with connected kernel B_f.
- `modularQuotient_kills` (relation): q_f∘t=0 for every t∈p_f.
- `modularQuotient_lift` (universal-property): A homomorphism h:J₁(N)→B killing all p_f images descends uniquely through q_f.
- `modularQuotient_baseChange` (functoriality): Formation and the quotient map commute with field extension.
- `modularQuotient_hecke` (compatibility): The quotient order acts faithfully in characteristic zero; the induced rational action is K_f in End⁰(A_f).

Discrimination tests:

- `modularQuotient_zeroIdeal` (degenerate): The quotient attached to the zero ideal of an acting algebra is the supplied Jacobian itself.
- `modularQuotient_unitIdeal` (degenerate): The quotient for the unit ideal is the zero abelian variety; this tests the image-generated-kernel convention.
- `modularQuotient_level11` (computation): For the rational weight-two newform of level 11 and trivial character, the J₀(11) quotient has dimension one.
- `modularQuotient_weight` (non-example): No Jacobian quotient is defined for a weight-12 level-one newform by this constructor.

Acceptance:

- A_f is nonzero when f exists (modular-quotient-dimension).
- Do not assert a quotient of a modular-curve Jacobian for weight > 2.

Imports: `ModularCurvesPartII:R14.5/newform-hecke-prime`, `ModularCurvesPartII:R14.2`, `AbelianSchemesAndArithmeticModuli:A6`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 73 (printed page; PDF page 77) — Definition 5.13.; **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 73 (printed page; PDF page 77) — Good reduction.; **RIBET-STEIN-SERRE-LECTURES**, Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33) — Ribet–Stein's formulation.

### Tate module of the actual modular quotient

**Comparison** · `quotient-tate-exact`.

For the actual quotient q_f:J₁(N)→A_f, the induced map identifies V_ℓ(A_f) with V_ℓ(J₁(N))/p_fV_ℓ(J₁(N)) as a module over Q_ℓ⊗T₁(N), with the chosen Picard convention. Generic exactness of rational Tate modules for abelian-subvariety quotients is imported; integral exactness is not inferred by tensoring this rational statement.

Hypotheses and conventions: ℓ prime; base characteristic zero. B_f is the actual connected image-generated kernel from modular-quotient.

Proof route:

- Import rational Tate exactness for a connected abelian-subvariety quotient.
- Choose finitely many generators of p_f; the sum of their abelian images is B_f and gives a surjection J^a→B_f.
- Apply rational Tate exactness again to identify its image with p_fV_ℓJ.

Acceptance:

- Test: an isogeny B → A with kernel of order ℓ is surjective on V_ℓ but not on T_ℓ.

Imports: `ModularCurvesPartII:R14.5/modular-quotient`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A6`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 73 (printed page; PDF page 77) — The claim in the proof of Theorem 5.14.; **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 73 (printed page; PDF page 77) — Its proof.

### Shimura's theorem: dim A_f = [K_f : ℚ]

**Theorem** · `modular-quotient-dimension` · planet “Shimura dimension theorem”.

dim A_f = [K_f : ℚ], and V_ℓ(A_f) = V_ℓ(J₁(N))/p_f V_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗_ℚ K_f. In particular A_f ≠ 0 and dim V_ℓ(A_f) = 2[K_f : ℚ].

Hypotheses and conventions: The Frobenius characteristic polynomial on V_ℓ(A_f) is AutomorphicGaloisRepresentations R19.1/R19.6's statement, not a defining property of A_f.

Proof route:

- V_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗ T₁(N) (betti-free-rank-two).
- quotient-tate-exact applied to p_f J₁(N) → J₁(N) → A_f → 0 identifies V_ℓ(A_f) with V_ℓ(J₁(N))/p_f.
- Hence V_ℓ(A_f) is free of rank 2 over ℚ_ℓ ⊗ T₁(N)/p_f = ℚ_ℓ ⊗ K_f, of ℚ_ℓ-dimension 2[K_f : ℚ] = 2 dim A_f.

Acceptance:

- Check on N = 11 (dimension 1) and N = 23 (dimension 2).

Imports: `ModularCurvesPartII:R14.5/quotient-tate-exact`, `ModularCurvesPartII:R14.3/betti-free-rank-two`, `ModularCurvesPartII:R14.5/newform-hecke-prime`, `AbelianSchemesAndArithmeticModuli:A4`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 73 (printed page; PDF page 77) — Theorem 5.14.; **RIBET-STEIN-SERRE-LECTURES**, Chapter 2, §2.3.1, p. 28 (printed; PDF page 32) — Ribet–Stein's statement.

### Differentials on A_f

**Theorem** · `modular-quotient-differentials`.

Pullback along J₁(N) → A_f identifies H⁰(A_f, Ω¹) ⊗ ℂ with the span of the Galois conjugates f^σ (σ : K_f ↪ ℂ) in S₂(Γ₁(N), ℂ) = Cot₀(J₁(N)_ℂ), when T₁(N) acts on J₁(N) through the Albanese action (T_p)_*, whose cotangent action is the classical one; with the Picard action T_p^* the image is w_ζ of that span.

Hypotheses and conventions: Conrad's warning: the Picard action on Cot₀ is the Petersson adjoint of the classical action; w_ζ conjugates one action into the other.

Proof route:

- Cot₀(A_f) ↪ Cot₀(J₁(N)) is the subspace killed by p_f for the induced action on cotangent spaces.
- For the Albanese action this is the classical action; the p_f-eigenspace of S₂(Γ₁(N), ℂ) is ⊕_σ ℂ f^σ (multiplicity one for newforms), of dimension [K_f : ℚ] = dim A_f.

Acceptance:

- Fix the Hecke-action convention before identifying differentials; the two choices differ by w_ζ.
- For the Picard convention keep the w_ζ transport; do not silently use the cotangent action of the Albanese operator.

Imports: `ModularCurvesPartII:R14.5/modular-quotient`, `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint`, `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`, `ModularCurvesPartII:R14.2`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 68 (printed page; PDF page 72) — The cotangent identification and the adjoint warning.

### Trivial character: the quotient of J₀(N)

**Comparison** · `trivial-character-J0`.

If χ_f is trivial, let p_f⁰ ⊂ T₀(N) be the kernel of the eigenvalue map on the Hecke algebra of J₀(N). Then A_f⁰ := J₀(N)/p_f⁰J₀(N) is an abelian variety over ℚ of dimension [K_f : ℚ], and the map J₀(N) → J₁(N) (pullback along X₁(N) → X₀(N)) induces an isogeny A_f⁰ → A_f compatible with the K_f-actions.

Hypotheses and conventions: The pullback J₀(N) → J₁(N) is Hecke-equivariant with finite kernel.

Proof route:

- Apply the J₁ argument to J₀(N) with H¹(X₀(N)) free of rank 2 over ℚ ⊗ T₀(N) (same proof as betti-free-rank-two).
- The composite J₀(N) → J₁(N) → A_f kills p_f⁰J₀(N) and is nonzero on V_ℓ; compare dimensions.

Acceptance:

- Consumers (EllipticCurveModularity R29.5) use the J₀(N) quotient; keep the isogeny explicit.
- Diamond eigenvalues must all equal one; a nontrivial-character form is not assigned a J₀ quotient.

Imports: `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33) — The construction applied to J₀(N).

### Oldforms: A_f inside J₁(M) for N | M

**Theorem** · `oldform-comparison` · planet “Oldform multiplicity”.

Let f have primitive level N and weight two, and let N|M. For the anemic Hecke algebra at level M, the rational abelian factor attached to the Galois orbit of f is isogenous over Q to A_f^{τ(M/N)}, where τ counts positive divisors. The degeneracy images for d|M/N give that factor up to isogeny. This uses the complete fixed-character oldspace and cross-level multiplicity-one theorem imported from ModularForms Layers 4/5; an eigenvector at raised level can be a linear combination of these images. The simple isogeny factor A_f is attached to the primitive eigensystem, whereas the full raised-level anemic quotient has the stated larger dimension.

Hypotheses and conventions: The anemic operators exclude primes dividing M. Character transport is the fixed character of f pulled to modulus M; do not count a different character’s oldspace.

Proof route:

- Import the fixed-character oldspace basis {V_d f:d|M/N} and the completeness/unique primitive-pair statement.
- For each Galois conjugate the basis has τ(M/N) independent images; the leading q exponent proves independence, and imported completeness excludes other forms with that primitive eigensystem.
- Use weight-two Shimura comparison to identify the rational Hecke block, then Poincaré complete reducibility and the degeneracy homomorphisms to obtain the Q-isogeny.

Acceptance:

- M=N gives one copy; M=Np with p∤N gives two; M=Np² gives three, not four.
- No mod-ℓ saturation follows from this rational isogeny statement.

Imports: `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`, `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`, `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `ModularCurvesPartII:R14.1`, `AbelianSchemesAndArithmeticModuli:A6`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, §3.6, p. 40; Corollary 5.9, pp. 69–70; Theorem 5.14, p. 73 — The two old images at a prime and the rational Tate/dimension theorem motivate the geometric transfer. The complete all-divisor analytic theorem is imported from its existing owner, not attributed to this excerpt.

### The Abel–Jacobi composite to A_f is nonconstant

**Theorem** · `abel-jacobi-composite-nonzero`.

For any supplied rational base point c∈X₁(N)(Q), the composite q_f∘AJ_c:X₁(N)→A_f is nonconstant and sends c to zero. The same assertion holds for a supplied point of X₀(N) and its trivial-character quotient. The argument uses A_f≠0 and the generation of the Jacobian by AJ_c; it does not require the rational-cusp construction of R14.6.

Hypotheses and conventions: A_f ≠ 0; the Abel–Jacobi map and its universal property are Tau Ceti JacobianChallenge Layer F.

Proof route:

- Import AJ_c and its universal property for the supplied rational point.
- If the composite is constant, its value is zero because AJ_c(c)=0.
- Since the image of AJ_c generates J, the quotient homomorphism is zero, contradicting surjectivity onto A_f≠0.

Acceptance:

- No isogeny to a target curve is asserted here (that is EllipticCurveModularity R29.5).

Imports: `ModularCurvesPartII:R14.5/modular-quotient`, `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 74 (printed page; PDF page 78) — Conrad's use of a rational cusp as base point.

## R14.6. Bad-prime and patching interfaces

Compute the integral character lattice and its weighted monodromy, retaining component-group torsion. Prove the finite diamond-cover minus-module theorem by its free-group cochains; its augmentation map is geometric data for the patching owner. The weight-two special-fibre relation has one owner here.

### Reduction of the supplied modular Hecke action

**Application** · `neron-hecke-extension`.

Apply R14.2’s existing Néron extension of the actual modular Hecke endomorphisms. At p∤N, reduce them on the good abelian fibre J_p; at semistable primes use the induced torus, character and component-group maps of R11.6. The degeneracy morphisms of curves need not extend across their correspondence prime in the same form; the Jacobian endomorphism is what is reduced.

Hypotheses and conventions: Pic⁰_{X₁(N)/ℤ[1/N]} is an abelian scheme, hence the Néron model of its generic fibre.

Proof route:

- Import the endomorphisms and their already-owned generic Néron extension.
- Take the appropriate special fibre; apply the generic functoriality on tori, characters and components.
- Match the reduced operator to the specific modular correspondence on the special fibre.

Acceptance:

- The degeneracy maps π_i^{(p)} themselves do not exist over ℤ[1/N] near p; only the induced endomorphisms extend.

Imports: `ModularCurvesPartII:R14.2`, `NeronModelsAndSemistableAbelianVarieties:R11.6`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 72 (printed page; PDF page 76) — The extension.

### The Eichler–Shimura relation

**Theorem** · `special-fibre-eichler-shimura` · planet “Eichler–Shimura relation”.

For p∤N and J_p=Pic⁰(X₁(N)_Fp), let F be the p-power Frobenius endomorphism and V its Verschiebung, so FV=VF=[p]. In End_Fp(J_p), the Albanese Hecke operator satisfies (T_p)_*=F+⟨p⟩_*V. Over F̄_p, for a chosen primitive Nth root ζ, w_ζ⁻¹Fw_ζ=⟨p⟩_*⁻¹F. This is the weight-two special-fibre relation exported to R19.1; identification of a selected eigencomponent’s Galois characteristic polynomial is the consumer’s theorem.

Hypotheses and conventions: p prime, p∤N; the supplied proper curve and its Jacobian have good reduction. V is the actual Verschiebung, identified with the polarization dual of F; w_ζ is only required over the field containing ζ.

Proof route:

- On the ordinary dense locus, the good-prime isogeny correspondence consists of the Frobenius graph and its transpose with the diamond twist; import this special-fibre correspondence statement from R14.1/R13.2.
- Equality of correspondence actions on degree-zero divisors yields equality of Jacobian endomorphisms by Albanese functoriality; extend by density.
- For w_ζ use Frobenius on level roots of unity and the dual isogeny relation, exactly as in Conrad’s proof.

Acceptance:

- The extra w_ζ relation is part of the statement; it is used to identify the characteristic polynomial of Frobenius (AutomorphicGaloisRepresentations R19.1).

Imports: `ModularCurvesPartII:R14.6/neron-hecke-extension`, `ModularCurvesPartII:R13.2`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`, `AbelianSchemesAndArithmeticModuli:A4`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Theorem 5.16 and proof, pp. 74–77 — The actual Jacobian endomorphism identity, its w_ζ conjugation and the Frobenius/Verschiebung convention.

### Cusp-normalised Abel–Jacobi maps

**Construction** · `rational-cusp-abel-jacobi` · planet “Cusp-normalised Abel–Jacobi maps”.

Use the supplied rational cusp ∞ of X₀(N), and a specified rational cusp c of the chosen X₁(N) point-of-exact-order moduli model (Conrad uses 0), to specialize the imported AJ construction: AJ_c(x)=[x−c]. It is over Q, sends c to zero and is a closed immersion when the genus is positive. For a degeneracy morphism α:X′→X and rational cusp c′, α_*AJ_{c′}(x)=AJ_c(α(x))+[α(c′)−c]. Hecke compatibility is on degree-zero divisors; without a base-point correction this is not an equality of point maps.

Hypotheses and conventions: Rationality is proved for the chosen cusp and moduli model; the cusp named ∞ on X₁(N) is not assumed rational in every model.

Proof route:

- Import cusp fields and the precise moduli model from R12.3; select the rational cusp there.
- Instantiate JacobianChallenge Layer F’s actual morphism and immersion theorem.
- Compute pushforward of [x−c′] to obtain the base-point correction; compute the Hecke action on degree-zero divisors.

Uses: `EllipticCurveModularity:R29.5`: A rational normalized curve map once the modular quotient is identified.; `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`: The Albanese description with a rational point on the good fibre.

Planning API, in namespace `TauCeti.ModularCurves`:

- `abelJacobiInfty` (constructor): The imported AJ for X₀(N), based at its supplied rational cusp ∞.
- `abelJacobiInfty_cusp` (simp): AJ_∞(∞)=0.
- `abelJacobiInfty_injective` (characterisation): AJ_∞ is a closed immersion for genus at least one; no immersion conclusion for genus zero.
- `abelJacobi_changeBase` (relation): AJ_b(x)=AJ_c(x)−AJ_c(b).
- `abelJacobi_degeneracy` (compatibility): α_*AJ_{c′}(x)=AJ_c(αx)+[αc′−c].
- `abelJacobi_hecke` (compatibility): On degree-zero divisors D, the induced endomorphism sends [D] to [T(D)] using the chosen Picard/Albanese convention.

Discrimination tests:

- `abelJacobi_X011` (computation): For the genus-one curve X₀(11), AJ_∞ is an isomorphism with its Jacobian.
- `abelJacobi_genus0` (degenerate): For X₀(1), the Jacobian and AJ image are zero; the curve map is not injective.
- `abelJacobi_baseChange_test` (compatibility): For any supplied rational cusp b, AJ_b(b)=0 and AJ_b(x)=AJ_∞(x)−AJ_∞(b).
- `abelJacobi_degeneracy_offset` (non-example): If [αc′−c]≠0, the uncorrected identity α_*AJ_{c′}=AJ_c∘α fails already at c′.

Acceptance:

- No modular parametrisation of an elliptic curve is asserted here.

Imports: `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.2`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, Appendix by B. Conrad, p. 74 (printed page; PDF page 78) — The base-point choice.

### The modular supersingular character lattice

**Construction** · `supersingular-character-lattice` · planet “Supersingular character lattice”.

For the mixed level Γ₁(M)∩Γ₀(p), M≥5 and p∤M, use R13.5’s split geometric semistable fibre: its two smooth components are the two copies of X₁(M)_F̄p and they meet at the finite supersingular level-point set S. Orient every edge from the first component to the second. The toric character group is canonically Z[S]⁰=ker(Σ:Z[S]→Z), compatibly with good-prime Hecke correspondences, diamonds and geometric Frobenius (including the action on orientations). Thickness is retained in the monodromy pairing rather than in this unweighted boundary map.

Hypotheses and conventions: The two-component description is a supplied theorem for the mixed Γ₀(p) model, not a claim about X₁(Mp). If a regular model introduces subdivisions, compare graph homology by contraction; the stable thickness data must be preserved.

Proof route:

- Import the actual fibre normalization, nodes and their correspondences from R13.5.
- Its dual graph has two vertices and edges S; the boundary of each edge is v₂−v₁, so the cycle lattice is ker Σ.
- Import R11.4’s X*(torus)=H₁(dual graph,Z), and transport the actual operators through the incidence-chain description.

Uses: `ModularCurvesPartII:R14.6/modular-monodromy`: The concrete integral lattice carrying the monodromy form.; `SerreWeightAndLevelOptimisation:R20.2`: The actual toric lattice, with degeneracy and Hecke maps.

Planning API, in namespace `TauCeti.ModularCurves`:

- `supersingularDegreeZero` (constructor): The kernel of total sum on the free abelian module on the supplied finite set S.
- `mem_supersingularDegreeZero` (characterisation): A combination belongs exactly when its coefficients sum to zero.
- `supersingularDifference` (constructor): For s,t∈S, the generator [s]−[t].
- `supersingularDifference_diagonal` (simp): The difference with equal endpoints is zero.
- `supersingularDegreeZero_graph` (equivalence): For the supplied two-component fibre, this kernel is the actual integral H₁ graph lattice and torus character group.
- `supersingularDegreeZero_correspondence` (compatibility): A supplied geometric graph correspondence induces its character map via incidence chains; no division by an edge multiplicity is used.

Discrimination tests:

- `supersingularDegreeZero_singleton` (degenerate): With one supersingular edge the kernel is zero.
- `supersingularDegreeZero_two` (computation): With two edges the kernel is generated by (1,−1) and is free of rank one.
- `supersingularDegreeZero_difference` (characterisation): For distinct s,t, [s]−[t] is a nonzero degree-zero element.
- `supersingularDegreeZero_notComponent` (non-example): The one-loop lattice with edge thickness h has character rank one for every h, although its component cokernel has order h.

Acceptance:

- If |S|=s≥1, rank X*=s−1.
- Character group means integral graph homology, not its dual or the component group.

Imports: `ModularCurvesPartII:R13.5`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `ModularCurvesPartII:R14.6/neron-hecke-extension`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, §3.9, pp. 44–46; §3.10.2, p. 48 — The semistable mixed-level Jacobian has a toric part and two good-reduction Jacobian factors; character groups carry the level-change action.

### Modular monodromy and component sequence

**Comparison** · `modular-monodromy`.

For the actual semistable modular Jacobian at p and its supplied regular or weighted stable dual graph, transport R11.4’s integral monodromy map μ:X*(J^∨)→Hom(X*(J),Z). The sequence 0→X*(J^∨)→Hom(X*(J),Z)→Φ_J(F̄p)→0 is exact. Under the principal polarization and graph identification, μ is the edge pairing Σ_e h_e a_e b_e, with positive thickness h_e; a regular semistable model uses h_e=1. It is perfect over Q but need not be unimodular over Z. The ℓ-primary component group is its tensor cokernel, including ℓ dividing the determinant.

Hypotheses and conventions: Use the actual model; the component sequence is geometric over F̄p with descent action retained.

Proof route:

- Import the dual character lattice and monodromy sequence from R11.4.
- Identify it with the graph intersection pairing via R13.5’s supplied node thicknesses.
- Use Néron functoriality to compare endomorphisms and their adjoints; derive the Hecke action on Φ from the cokernel.

Acceptance:

- For two vertices joined by two edges of thickness one, the generator (1,−1) has monodromy value 2 and component cokernel Z/2.
- No ℓ-primary information is recovered by inverting ℓ first.

Imports: `ModularCurvesPartII:R14.6/supersingular-character-lattice`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `ModularCurvesPartII:R13.5`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, §3.9, pp. 44–46; §3.10.2, p. 48 — The modular character and component groups enter level lowering; the generic integral monodromy theorem is imported from R11.4.

### Integral modular character maps and exactness

**Theorem** · `character-degeneracy-sequences`.

Every supplied degeneracy homomorphism of semistable modular Jacobians induces the contravariant character map and the compatible monodromy/component diagram of R11.6. For a supplied exact sequence of special-fibre tori 0→T₁→T→T₂→0, the resulting character sequence 0→X*(T₂)→X*(T)→X*(T₁)→0 is integral and Hecke-equivariant. An old/new abelian isogeny decomposition alone does not provide this exact torus sequence: the concrete modular integral kernel, cokernel and saturation must be computed from the graph maps. The pivot character sequence 0→X_p(J_pq(K))→X_q(J(K,pq))→X_q(J(K,q))²→0 of Ribet–Stein (3.2) requires its quaternionic/Cerednik–Drinfeld input and remains an explicitly recorded ownership/source gap in this part.

Hypotheses and conventions: All tori and maps in an exactness assertion are specified geometric objects; if only an isogeny is known, retain its finite lattice error. J_pq(K) in the pivot sequence is a Shimura-curve Jacobian, not a modular-curve Jacobian of level pq.

Proof route:

- Import generic character functoriality, then identify the specific maps on the normalization graph supplied by R13.5.
- Dualize a proved exact torus sequence; compute any finite lattice error instead of erasing it by rationalization.
- For the pivot sequence retain the explicit quaternionic term and request the missing model-to-graph comparison with its correct owner; do not re-prove level lowering here.

Acceptance:

- A finite isogeny kernel can give a nonzero finite character cokernel.
- The character maps reverse the direction of torus maps.

Imports: `ModularCurvesPartII:R14.6/modular-monodromy`, `ModularCurvesPartII:R14.6/supersingular-character-lattice`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `ModularCurvesPartII:R13.5`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, §3.10.2, equation (3.2), p. 48 — The pivot sequence includes a different Shimura-curve Jacobian; the Cerednik–Drinfeld proof is cited but not supplied by the excerpt.

### The semistable modular Tate filtration

**Application** · `semistable-tate-interface`.

For an actual semistable modular Jacobian J over Q_p and ℓ≠p, import the saturated filtration T_ℓ(J)_t⊂T_ℓ(J)_f⊂T_ℓ(J), with T_t≅Hom(X*(J),Z_ℓ(1)), T_f=T_ℓ(J)^{I_p}, and T_f/T_t the Tate module of the abelian part of the special fibre. The ranks are t,t+2a,2(t+a), respectively. Identify the inertia/monodromy map with the modular monodromy pairing and the induced Hecke maps. This is the actual integral input for R20’s ramification arguments; the p-adic semistable representation case belongs to p-adic comparison owners.

Hypotheses and conventions: ℓ≠p and actual semistable reduction; no claim T_f=T^{I_p} at ℓ=p.

Proof route:

- Apply R11.3 and the actual toric character computation.
- Use R11.4/R34.3 to match the monodromy operator and Weil pairing.
- Transport the supplied degeneracy and Hecke maps through the filtration.
- Use the lower-tier R11.3 Tate filtration and R11.4 graph comparison for this modular application. No completion of the higher-tier weights roadmap is needed; its nearby-cycle interpretation belongs to the weights owner.

Acceptance:

- The toric torsion is Hom(X*,μ_ℓ), with the cyclotomic twist.
- Inertia invariants of residual torsion need not be the reduction of integral invariants; the finite monodromy cokernel matters.

Imports: `ModularCurvesPartII:R14.6/modular-monodromy`, `NeronModelsAndSemistableAbelianVarieties:R11.3`.

Source locators: **RIBET-STEIN-SERRE-LECTURES**, §3.9, pp. 45–46; §3.10.3, pp. 48–49 — Toric torsion embeds into inertia-fixed modular Jacobian torsion; the semistable comparison is imported from its general owner.

### The finite Taylor–Wiles modular cover

**Construction** · `taylor-wiles-cover` · planet “Taylor–Wiles modular cover”.

Fix odd residue characteristic ℓ and a finite set Q of primes q∤Nℓ with q≡1 mod ℓ. Let H_q be the prime-to-ℓ subgroup of (Z/q)× and Δ_q=(Z/q)×/H_q, Δ_Q=∏Δ_q. At q, Γ̄_Q has Γ₀(q) level and Γ_Q is the inverse image of H_q under the diamond quotient. Retain the fixed base level at N, and intersect both groups with the same auxiliary Γ₁(R), with R≥5 a prime coprime to Nℓ∏Q, to remove stabilizers. Then Γ_Q⊲Γ̄_Q with quotient Δ_Q, and Y_Q→Ȳ_Q is an actual finite étale analytic cover with that deck group. Complex conjugation ξ=diag(−1,1) normalizes both groups and acts trivially on Δ_Q. For the actual H¹(Y_Q,O), define M_Q^- as the kernel of ξ+1, and then take the specified anemic and selected U_q-root localization.

Hypotheses and conventions: O complete DVR finite over Z_ℓ; all auxiliary cover data and level maps are fixed. The open cover is unramified; its compactification can ramify at cusps and is not assumed étale there. Selected residual roots are distinct, and the cyclotomic-determinant specialization uses q≡1 and α_qβ_q=1.

Proof route:

- Build the subgroup from the actual congruence conditions and identify its finite diamond quotient using the Chinese remainder map.
- Import the torsion-free analytic quotients and their cover action; verify ξ conjugation on the congruence subgroup and quotient.
- Use the actual group/Betti H¹ module with deck action, form its minus eigenspace and complete/localize the commuting Hecke action.

Uses: `ModularCurvesPartII:R14.6/taylor-wiles-freeness`: Actual geometric O[Δ_Q]-module for the freeness theorem.; `ModularCurvesPartII:R14.6/augmentation-control`: The level quotient whose augmentation specialization returns the base module.

Planning API, in namespace `TauCeti.ModularCurves`:

- `taylorWilesLevel` (constructor): The congruence subgroup Γ_Q and its cover of the specified Γ̄_Q quotient.
- `taylorWilesLevel_quotient` (equivalence): Γ̄_Q/Γ_Q≅Δ_Q, with the actual diamond action.
- `taylorWilesLevel_conjugation` (compatibility): ξ fixes Δ_Q and commutes with its action on H¹.
- `taylorWilesMinus` (constructor): The ξ=−1 submodule of the actual cover H¹, before the specified commuting Hecke localization.
- `mem_taylorWilesMinus` (characterisation): x lies in M^- iff ξx=−x.
- `taylorWilesMinus_projector` (projection): Since 2 is a unit, (1−ξ)/2 projects to the minus submodule.
- `taylorWilesMinus_coefficients` (functoriality): Coefficient change and deck/Hecke-equivariant morphisms commute with minus projection under the proved base-change hypotheses.

Discrimination tests:

- `taylorWilesMinus_id` (degenerate): If ξ=id and 2 is invertible, the minus module is zero.
- `taylorWilesMinus_neg` (characterisation): If ξ=−id, the minus module is the whole module.
- `taylorWilesMinus_swap` (computation): For ξ(x,y)=(y,x) on O², the minus submodule is {(a,−a):a∈O}.
- `taylorWilesLevel_empty` (degenerate): For Q empty the diamond quotient is trivial and the selected cover is the base cover.
- `taylorWilesMinus_two` (non-example): In characteristic two the kernel of ξ+1 need not be a complementary direct summand; the projector statement requires 2 invertible.

Acceptance:

- Q=empty gives Δ_Q=1 and the fixed auxiliary base-level module.
- The choice of root is part of the Hecke localization, not a new definition of an abstract free module.

Imports: `ModularCurvesPartII:R14.3/parabolic-cohomology`, `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`, `ModularCurvesPartII:R14.1`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Source locators: **TAYLOR-WILES**, Definition of Δ_Q, Γ_Q, Γ̄_Q and auxiliary R, author pp. 4–7; Proposition 1, pp. 7–8 — The actual finite diamond cover and minus cohomology module used in the freeness proof.

### Finite-level Taylor–Wiles freeness

**Theorem** · `taylor-wiles-freeness` · planet “Taylor–Wiles freeness”.

For the actual cover and O of taylor-wiles-cover, H¹(Y_Q,O)^− is finite free over O[Δ_Q], with rank equal to rank_O H¹(Ȳ_Q,O)^−. Each commuting completed anemic/selected-root Hecke localization is an O[Δ_Q]-direct summand and is therefore also finite free. At the non-Eisenstein ideals of R14.3, boundary removal identifies this with the compact cuspidal module. Reduction modulo πⁿ yields a finite free (O/πⁿ)[Δ_Q]-module of the same rank. The plus eigenspace and Hecke-rank-one multiplicity claims are not conclusions of Proposition 1.

Hypotheses and conventions: Odd ℓ; Δ_Q is an abelian ℓ-group; the congruence group Γ̄_Q is torsion-free and free of finite rank. The finite-level identification with cohomology modulo πⁿ uses localized-freeness or the minus-cochain computation, not merely a claim that rational invariants commute with integral reduction.

Proof route:

- Apply Shapiro: H¹(Γ_Q,O)=H¹(Γ̄_Q,O[Δ_Q]). Since Γ̄_Q is free, its cocycle module is finite free over O[Δ_Q].
- ξ acts trivially on Δ_Q, so all coboundaries are in the plus eigenspace; minus H¹ equals minus cocycles, a projective summand.
- O[Δ_Q] is local for a finite ℓ-group over the complete DVR, so that finite projective module is free.
- Over Frac(O), finite cover descent identifies Δ_Q invariants with base cohomology, giving the stated rank; prove coefficient reduction by the same finite free minus complex.
- Completed commuting Hecke localization is an idempotent summand; use boundary removal only for the stated non-Eisenstein modules.
- Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

Acceptance:

- This is freeness over O[Δ_Q], not over the localized Hecke algebra.
- For Δ_Q of order ℓ, the O-rank is ℓ times the O[Δ_Q]-rank.
- Nothing is asserted about weight-one coherent cohomology by this weight-two argument.

Imports: `ModularCurvesPartII:R14.6/taylor-wiles-cover`, `ModularCurvesPartII:R14.3/localized-freeness`, `ModularCurvesPartII:R14.3/boundary-non-eisenstein`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `mathlib:groupCohomology.coindIso`, `ModularCurvesPartII:R14.6/diamond-group-ring-local`.

Source locators: **TAYLOR-WILES**, Proposition 1 and proof, author pp. 7–8 — The minus cocycle/direct-summand argument proves finite group-ring freeness and its base rank.

### Augmentation and selected-root specialization

**Theorem** · `augmentation-control`.

Let I_Q be the augmentation ideal of O[Δ_Q]. For the minus modules of the actual covers, M_Q^-/I_QM_Q^- identifies with H¹(Ȳ_Q,O)^−, via Shapiro’s induced-coefficient complex and its augmentation. At the cyclotomic-determinant Taylor–Wiles roots of taylor-wiles-root-control, successive root selection at q∈Q identifies the localized base-side module with the fixed-level localized module. All maps commute with anemic Hecke operators and reduction modulo πⁿ. A finite free O[Δ_Q] module M satisfies rank_O(M/I_QM)=rank_{O[Δ_Q]}M; this numerical fact is used only after the actual geometric specialization map has been proved.

Hypotheses and conventions: The same auxiliary R-level is retained at both ends. Removing R requires a separate checked level-control argument and its source hypotheses. Distinct residual roots, q∤Nℓ and odd ℓ; no repeated-root specialization.

Proof route:

- On the Shapiro free-group complex, augmentation is coefficient change O[Δ_Q]→O. The degree-zero coboundaries are plus, so minus projection and its H¹ commute with this change.
- Use finite group-ring freeness and the exact minus complex to prove augmentation and coefficient compatibility.
- Apply the finite-level degeneracy root-control theorem successively; retain the actual root idempotents.
- Export the geometric module and specialization data to generic patching owners, which own inverse systems and the ring theorem.

Acceptance:

- A rank equality without the specialization morphism is insufficient.
- This does not remove an auxiliary R-level on its own.

Imports: `ModularCurvesPartII:R14.6/taylor-wiles-freeness`, `ModularCurvesPartII:R14.4/taylor-wiles-root-control`.

Source locators: **TAYLOR-WILES**, Proof of Proposition 1, author pp. 7–8 — The free-group/Shapiro computation supplies the module used for augmentation control.; **CALEGARI-GERAGHTY**, Lemma 9.6, pp. 88–90 — Distinct-root finite-level control identifies the auxiliary Γ₀(q) level with the selected fixed-level module.

### The local diamond group ring

**Theorem** · `diamond-group-ring-local`.

For O a complete DVR of residue characteristic ℓ and Δ a finite abelian ℓ-group, O[Δ] is a commutative local ring. Its maximal ideal is generated by the maximal ideal of O and every [δ]−1. Every finite projective O[Δ]-module is free. These are the precise algebra facts used in the finite-level Taylor–Wiles minus-module argument.

Hypotheses and conventions: Δ is the finite diamond group of taylor-wiles-cover; the assertion is not made for a finite group of order prime to ℓ.

Proof route:

- Reduce modulo the uniformizer: the augmentation ideal in the group algebra of a finite ℓ-group over the residue field is nilpotent, using ([δ]−1)^{ℓ^a}=0.
- Every maximal ideal of the finite O-algebra lies over the maximal ideal of O; its residue algebra has the unique augmentation maximal ideal.
- Apply the finite-projective-over-local-ring freeness theorem; use augmentation and generic fibre invariants to compute rank.

Acceptance:

- Δ=1 recovers O.
- For Δ=C₂ and ℓ odd the group ring has distinct trivial and sign factors, so this local-ring conclusion is false.

Imports: `ModularCurvesPartII:R14.6/taylor-wiles-cover`.

Source locators: **TAYLOR-WILES**, Proof of Proposition 1, author pp. 7–8 — The minus cohomology is projective over the local diamond group ring, hence free.

## Supplier requests

A request records a precise interface, rather than presuming the supplier's whole roadmap is finished. The packet records the dependent declarations for each request.

- **`ModularCurvesPartII:R12.3`**: Actual cusp fields and a Q-rational cusp on the chosen X₁(N) model; distinguish 0 on the (E,P) model from infinity on X₀(N).
- **`ModularCurvesPartII:R12.5`**: Weight-two differentials/analytic S₂ comparison with the cotangent Hecke convention and q-expansion normalization.
- **`ModularCurvesPartII:R13.2`**: Actual smooth fine elliptic family, compactification, universal elliptic curve on its open locus, and good reduction over Z[1/N].
- **`ModularCurvesPartII:R13.5`**: The mixed Γ₁(M)∩Γ₀(p) semistable fibre for M≥5 and p∤M: the two normalized components, supersingular intersection set with level structures, node thicknesses and correspondence action. Supply a regular resolution when thicknesses exceed one.
- **`ModularCurvesPartII:R14.1`**: Actual finite Hecke and two degeneracy correspondences, diamond and Atkin–Lehner maps; pullback/norm orientation, degree, cusp action and compatibility on moduli and divisors.
- **`ModularCurvesPartII:R14.2`**: Initial Jacobian, Picard/Albanese Hecke endomorphisms, polarization and Tate carrier/functoriality, before any rational rank-two theorem. Split the carrier/action prefix from the existing Tate-compatibility node which cites R14.3; its rank-two consequence is supplied here. Include integral Hecke algebra identification with ModularForms Layer 8.
- **`AbelianSchemesAndArithmeticModuli:A4`**: Actual ℓ-power torsion and inverse-limit Tate module, its 2g rank and Weil pairing; the curve-Picard Kummer comparison needed in weight-two-tate-comparison.
- **`AbelianSchemesAndArithmeticModuli:A6`**: General quotient by a connected abelian subvariety over Q, field of definition, extension across a good-reduction abelian scheme and rational Tate exactness, using Poincaré reducibility. A3 finite-flat-kernel quotients do not alone supply this positive-dimensional quotient.
- **`EtaleDualityAndPerverseSheaves:EDC.0`**: Finite locally constant coefficient cohomology and compact supports on smooth curves, constructibility, finite generation and proper smooth base change for R¹ of the universal elliptic family.
- **`EtaleDualityAndPerverseSheaves:EDC.2`**: Curve Poincaré–Lefschetz/étale duality with coefficient duals and twists; restrict to the parabolic image and prove integral perfection only under the displayed torsion and boundary vanishings.
- **`EtaleDualityAndPerverseSheaves:EDC.3`**: Finite étale trace, pullback, projection formula, degree composition and the j_!→Rj_* localization triangle, including punctured-disc/inertia boundary stalks.
- **`SchemeAndStackFoundations:SF.2`**: Integrate the general finite-coefficient étale–Betti comparison with locally constant coefficients, compact support, traces and cup products required by accepted RS-06 as UPSTREAM:CohomologicalPointCounting:ComplexComparison:etale-Betti. Also supply finite-generation/Mittag–Leffler inverse-limit exactness and comparison to the pinned pro-étale EllAdicCohomology carrier. The checkout has no resolvable roadmap anchor for that RS-06 upstream label; do not substitute de Rham comparison.
- **`NeronModelsAndSemistableAbelianVarieties:R11.3`**: Semistable integral Tate filtration at ℓ≠p: T_tor⊂T_f=T^{I_p}⊂T, toric term Hom(X*(T),Z_ℓ(1)), finite quotient T_ℓ of the abelian reduction; keep saturation hypotheses.
- **`NeronModelsAndSemistableAbelianVarieties:R11.4`**: Generic graph identification X*(T)=H₁(dual graph,Z), weighted monodromy into its Z-dual and component-group cokernel, retaining all node thicknesses and primary torsion.
- **`NeronModelsAndSemistableAbelianVarieties:R11.6`**: Generic Néron extension and contravariant maps on characters; exact character sequences only when an exact sequence of reduction tori is given. This does not prove exactness for an arbitrary old/new modular isogeny.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`**: Use the current all-degeneracy-map oldspace span and primitive conductor/newform input; for f of conductor N at level M count the copies indexed by d|M/N, retaining arbitrary linear combinations.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`**: Use the current strong multiplicity-one/eigenform characterization to identify the primitive simple factor independently of the ambient old level; no new analytic multiplicity-one proof is planned.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`**: Import the integral homological symbol lattice, Manin presentation, cuspidal boundary map, period functional into the dual of symbols, integral finite Hecke algebra and eigenvalue field; comparison to actual geometric cohomology is new here.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`**: Use the current coefficient-field and Galois-conjugate rationality statements to descend the weight-two differential block and its Hecke ideal.
- **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`**: Use the supplied generic Abel–Jacobi morphism x↦[x−c], its cotangent/universal property and change-of-base-point formula; this part only specializes the modular rational cusp and quotient composite.
- **`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`**: Use current relative/twisted singular chains, functoriality and compactification-pair homology; the specific modular-symbol comparison and tree stabilizers remain here.
- **`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`**: Use current cochains with local coefficients, relative/compact-support cohomology, cup product and Poincaré–Lefschetz duality with the chosen orientation; no new generic twisted cochain definition is planned.
- **`tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`**: Supply finite type of the torsion-free congruence quotient, its finite graph deformation retract and finitely generated free fundamental group, with the exact fine/auxiliary-level hypotheses.

## Remaining proof-chain and range gaps

### Integral higher-weight boundary and lattice range

Deligne supplies rational Sym^r cohomology. Prove the exact good-prime Hecke eigensystems on H⁰ and cusp inertia cohomology for Sym^r integral coefficients; specify residual ideals where they vanish and where reduction and saturated parabolic comparison hold. For ℓ≤r symmetrization need not be perfect: choose a divided-power/dual lattice with a sourced comparison or retain a weaker pairing. The present conditional theorem does not claim unconditional integral freeness or perfectness in that range.

Affected declarations: `parabolic-duality`, `boundary-non-eisenstein`, `localized-freeness`, `symbols-geometric-comparison`.

### Deep input to the S-arithmetic congruence kernel theorem

Serre 1970 §2.6 gives the correct real-place specialization, but its proof depends on central Mennicke-symbol/congruence-kernel calculations and the Moore/class-field-theory input. Those intermediate theorems have not been decomposed against the baseline. A follow-up must supply that exact proof chain; an unrelated profinite arithmetic action theorem cannot replace it.

Affected declarations: `congruence-subgroup-property`.

### Tree fundamental edge and enhanced congruence-character proof

Refine the principal-level fundamental-edge argument and CDT Corollary 4.5.3 conjugation-invariance criterion against existing finite-group and approximation APIs. The source statements and the target proof routes are read, but the strong-approximation/reduction-surjectivity and finite congruence quotient sublemmas are not yet supplier-closed. This is a proof-chain gap, not permission to erase the congruence subspace from ordinary Ihara. For congruence-invariance, supply the exact continuous-cohomology, Künneth and Hochschild–Serre proof interfaces, Lazard’s uniform-group calculation, adjoint-cohomology vanishing, and a reproducible proof of the level-8/16 computations used in CDT §4.5.11. These source inputs are not declarations established by the pinned ordinary H¹ carrier.

Affected declarations: `modular-amalgam`, `enhanced-ihara`, `congruence-invariance`.

### Integral modular old/new and quaternionic pivot exactness

Ribet–Stein §3.10.2 equation (3.2), p. 48 involves a quaternionic Shimura-curve Jacobian J′_{pq}(K). The exact sequence 0→X_p(J′_{pq}(K))→X_q(J(K,pq))→X_q(J(K,q))²→0 needs the specific Cerednik–Drinfeld identification and integral Hecke-compatible maps. Generic Néron functoriality and a rational old/new isogeny do not establish this integral sequence. Keep the conditional torus theorem here; arrange a lower-tier geometric interface before the higher Hilbert/Shimura-curve roadmap consumes it, or explicitly narrow the requested consumer. Retain finite cokernels and component groups until that proof is supplied.

Affected declarations: `character-degeneracy-sequences`.

### Extensions of the exact Ihara consumer range

The compact constant-coefficient Γ₁(N) result includes ℓ|N on characteristic-zero curves and has no exceptional residual-image hypothesis. It does not by itself prove level lowering, nor a uniform Sym^r/coarse Γ₀(N) or characteristic-ℓ fibre result. R20/R22 must use the stated fine/mixed-level weight-two prefix, or specify a sourced further injectivity theorem with its stabilizer, coefficient and exceptional-image hypotheses; Γ₀(N) has a Shimura-subgroup kernel.

Affected declarations: `compact-ihara`, `taylor-wiles-root-control`.

## Consumer handoff

R19.1/R19.6 construct eigenspace projectors and Galois representations, using the actual coefficient lattice and weight-two quotient supplied here. RT-AREA-langlands-2/9 is handled by the proposed scoped link **R14.6 → R19.1**: the weight-two Jacobian Eichler–Shimura proof is imported from here. R19 retains the higher Sym^{k−2} congruence of Deligne Proposition 4.8/Theorem 4.9 and deduces its characteristic polynomials. Neither construction is a prerequisite for the early weight-two boundary calculation.

R20's weight-two mixed-level compact prefix can use saturation even when ℓ divides the original level. Any further level-lowering or exceptional residual-image theorem belongs to its owner, with its own hypotheses. R22's other Ihara/level-raising settings require an explicit comparison to the precise statement here. R29.5 receives the rational-cusp Abel–Jacobi map and nonzero quotient composite; identifying A_f with a given elliptic curve waits for its isogeny theorem. Generic deformation, inverse-system patching and R=T remain with their existing owners.

## Source checks

The two Calegari–Geraghty slips are scoped to the author copies actually read. In Lemma 9.6's proof, the 2×2 matrix determinant is (q+1)²−T_q²; the sign printed in those copies is its negative and does not change invertibility. The Lyndon segment has H^i(G) before H^i(Γ)²→H^i(H), followed by H^{i+1}(G). The earlier displayed degree is wrong. Serre's tree sequence and degree-zero invariants independently fix it. The packet records both findings and the version digests. The publisher lists a correction but did not serve its text, so confirmation against it remains requested; no novelty claim is made.

CDT Lemma 4.5.11 displays F₃ in its level-five assertion (preprint p. 31; published p. 663), although the application requires F₅. With F₃ the asserted vanishing of invariants is false: X(5) has genus zero and twelve cusps, so the all-ones cusp-residue vector is nonzero and has sum zero in F₃. The node uses the intended F₅ calculation, retaining its small-prime proof as a gap. The same coefficient appears in the published author offprint; no correction was found in the listings checked, and novelty remains unconfirmed.

### RIBET-STEIN-SERRE-LECTURES

Kenneth A. Ribet and William A. Stein (appendices by Brian Conrad and Kevin Buzzard), *Lectures on Serre's conjectures (with an appendix by Brian Conrad, The Shimura construction in weight 2, and by Kevin Buzzard)*. Author revision dated 23 November 2010, not identified with the pagination of the 2001 published chapter. Printed page = PDF page minus 4. [Source](https://wstein.org/papers/serre/ribet-stein.pdf).

Read: §2.3.1, pp. 28–29; §§3.5–3.6, pp. 39–40; §§3.9–3.11, pp. 43–50; Conrad appendix §§5.1–5.3, pp. 63–79, including the proof of Theorem 5.16. The analytic results and the arithmetic level-lowering conclusions themselves remain with their owners.

Retrieved 2026-10-11; SHA-256 `e1bf2b5cd14de064bcb48c4ca843251198db74dd8bcfaad63c26f6773f63f604`.

### DELIGNE-355

Pierre Deligne, *Formes modulaires et représentations ℓ-adiques*. Séminaire Bourbaki, exposé 355 (1968–1969), pp. 139–172; Numdam scan [Source](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf).

Read: §§3.9–3.20, pp. 154–159, and §§4.1–4.2, pp. 160–161; geometric coefficients, Hecke normalization and duality. Higher-weight Galois construction and congruence conclusions belong to R19. PDF page 17 carries printed page 154.

Retrieved 2026-10-11; SHA-256 `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c`.

### RIBET-1984

Kenneth A. Ribet, *Congruence relations between modular forms*. Proceedings ICM Warsaw 1983, published 1984, pp. 503–514; author scan [Source](https://math.berkeley.edu/~ribet/Articles/icm.pdf).

Read: §§2–4, pp. 506–513: degeneracy maps, Theorem 4.1, Corollary 4.2, Theorem 4.3 and the compact homology argument.

Retrieved 2026-10-11; SHA-256 `44f74c2a9e33cfe01b7c890da07bedd97bc9b81cf4883b9b3f3cdfb87826c97c`.

### CDT-2025

Frank Calegari, Vesselin Dimitrov and Yunqing Tang, *The unbounded denominators conjecture*. arXiv:2109.09040 author preprint dated 18 September 2024, fetched 11 October 2026; compared with the author-hosted published JAMS 38 (2025), 627–702 offprint in §§4.4–4.6, pp. 659–666. Node locators distinguish preprint and journal pages. [Source](https://arxiv.org/pdf/2109.09040).

Read: Author preprint §§4.4–4.6, printed pp. 27–34, including Corollary 4.5.3 and Lemmas 4.6.2–4.6.3. Rechecked the PDF itself; printed pages equal PDF pages. Published offprint §§4.4–4.6, pp. 659–666, including the level-5 coefficient and the proof of Theorem 4.5.2.

Retrieved 2026-10-11; SHA-256 `9bffb12953db37d237e75451ed659219d955bf57d55da8dbc09ad888f62956ad`.

### CALEGARI-GERAGHTY

Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*. arXiv:1207.4224 author preprint, fetched 11 October 2026; comparison with author-hosted Springer-layout copy, PDF pp. 120–123 [Source](https://arxiv.org/pdf/1207.4224).

Read: §9.1, Lemma 9.6 and Remarks 9.7–9.8, pp. 88–90; only the Q, constant-coefficient, finite-level specialization is exported here.

Retrieved 2026-10-11; SHA-256 `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb`.

### SERRE-TREES

Jean-Pierre Serre, *Arbres, amalgames, SL₂*. Astérisque 46, third edition 1983 (original 1977), Numdam scan [Source](https://www.numdam.org/item/AST_1983__46__1_0.pdf).

Read: II §1.4, Theorem 3 and Corollary 2, p. 110; II §2.8, Proposition 13 and Lyndon example, pp. 168–170.

Retrieved 2026-10-11; SHA-256 `7f048d9e38961ee8a082d6c5fc994e61112f809d9b1ade5d6c33d3c79cc8e947`.

### SERRE-CSP

Jean-Pierre Serre, *Le problème des groupes de congruence pour SL₂*. Annals of Mathematics 92 (1970), pp. 489–527; author-hosted scan [Source](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf).

Read: Introduction pp. 489–490; §2.6, Theorem 2 and Corollary 3, pp. 498–500; specialization to Q with S={infinity,p}.

Retrieved 2026-10-11; SHA-256 `2a079cca247de1b4765a4c5cb0d70ef1351ee192115fa34a9cd41c3fa1ec5e37`.

### TAYLOR-WILES

Richard Taylor and Andrew Wiles, *Ring-theoretic properties of certain Hecke algebras*. Author manuscript dated 7 October 1994, pp. 1–22; Proposition 1 on pp. 7–8 (published Annals 141 (1995), pp. 553–572 has different pagination) [Source](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf).

Read: Setup and local/residual hypotheses, pp. 1–6; Proposition 1 with its group-cohomological proof, pp. 7–8. No patching or R=T theorem is planned here.

Retrieved 2026-10-11; SHA-256 `3a58acd02155b8849871bbc716e30a05072a5fc80bc0e26122a453400b3731b9`.

Sources attached by the manager to R12/R13/R14.1/R14.2 are outside this part's scope. The actual cusp/model/correspondence interfaces are requested from those stages, preserving their ownership of modular polynomials, scalar framing, integral models and Gross–Zagier's Hecke pairing. The added CDT and Calegari–Geraghty R14.4 assignments are covered above, including their key group-theoretic inputs and explicit proof-chain gaps.

## Suggested file and follow-up

The suggested file elaborates the monodromy symmetric-power signature, parabolic-image and commuting-square core, actual principal-level congruence-character subspace, degeneracy coprod, Hecke kernel, supersingular degree-zero lattice, minus kernel/projector and rational rank-two base change. The geometric declarations, APIs and tests whose carriers are absent at the pin appear in its registry of signatures awaiting supplier carriers under the same names. Constructing an arbitrary support map or involution does not establish that it is the geometric one required here.

A follow-up should close the five named proof/range gaps and discharge the exact supplier interfaces, then elaborate the geometric signatures awaiting supplier carriers using those constructed carriers. All four stages stay `planned`; no stage is declared closed by treating supplier requests as proved mathematics.
