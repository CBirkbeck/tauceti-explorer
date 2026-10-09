# Gross–Zagier formulas and arithmetic heights: GZ.8–GZ.9

This is the completed target-level pass for the final two layers, revised in round 2 and corrected in place by its independent review, REV-GrossZagierAndArithmeticHeights--GZ.8~2. Part GZ.0 owns GZ.0–GZ.7. The 36 targets below are plans, with all implementation statuses unchecked. Both stages are **planned**, with 7 explicit gaps and 21 supplier requests; neither is closed.

## Objects and normalization

Use GZ.0’s arithmetic Artin convention: σ_a sends the classical CM point P_b to P_{a⁻¹b}. A(χ) is the χ⁻¹-eigenspace. The adelic finite sum P⁰_χ(f) = Σ_t f(P)^{σ_t}χ(t) therefore equals Σ_{[a]} f(P_a)χ([a])⁻¹, and Gross–Zagier’s c_χ is P⁰_{χ⁻¹}. The L-valued YZZ point is the probability average P⁰_χ/h. The integral against a Haar measure of total volume 2L(1,η) lives in a complex scalar extension. For a nontrivial central character it is the weighted integrand that descends to the relative Picard quotient. A finite Galois quotient through which the character and orbit separately factor supplies the abstract projector.

GZ.1 supplies the M-valued height; GZ.8 extends it to L⊗_M(M⊗_ℚℝ). Tracing a base point gains [L:M]. The general YZZ identity uses the F-relative height, probability-averaged points and YZZ’s curve volume, for the measure dxdy/(2πy²). CST’s identity (2.4) differs in three ways:

- its height is relative to K, twice the F-relative one;
- its points are integrated against the measure of total volume 2L(1,η);
- its curve volumes use dxdy/(4πy²), half of YZZ’s.

The three conversions must be made together, and only in this direction do they reproduce YZZ’s constant ζ_F(2)/(4L(1,η)²L(1,π_A,ad)). CST’s Lemma 2.3 forces L(1,η) to be the completed value, with a factor π⁻¹ at each real place of F: for K = ℚ(i) it gives L(1,η) = 1/4, not the finite value π/4. The constants of the general identity are therefore read with completed L-values; the book’s own wording could not be checked. Skinner’s published §2.5, p.341, independently identifies the trace as h times the average. The directly read YZZ erratum item 25 corrects the integration group, without specifying a probability normalization.

The Petersson pairing is the imported weight-two peterssonInner, hence ∫|f|² dx dy. On Γ₀(N) it is Tau Ceti’s peterssonInnerCosets, which is strictly positive on nonzero forms. BDP’s central-value function is the convolution square of a linear root, up to a comparison unit that still needs an explicit calculation. A fixed tame ring-class character family is distinct from the character space of Γ, and the auxiliary Castella–Hsieh character must have p-power conductor.

## Ownership and construction order

L3h owns the GL₂ square-root measure. GeneralizedHeegnerCycles GH.4 owns BDP Theorem 5.13 (GH.4/bdp-special-value-formula), with the complete Assumption 5.12 and the case r=j=0, as the GH blueprint also proposes. GZ.9 imports both. BDP index the CM point of the class [a] by a ⋆ (C/O_c) = C/a⁻¹. With the classical points P_a = C/a, the weight-two sum therefore carries χ(a).

For quaternionic curves the construction runs in this order:

1. GZ.5’s Waldspurger input, the R18.1/R18.2 CM geometry and the integral Serre–Tate expansions.
2. The bounded local CM measures of Burungale Lemma 5.5. The p-depleted local measures live on ℤ_p^× and are pushed forward to Γ, which folds the Teichmüller classes together.
3. The finite translated sum (5.8), then its convolution square.
4. The constructor fixes the normalization unit by comparing the root’s interpolation with JSW (5.1.a).
5. The square-root comparison and analytic uniqueness, which only draw consequences.

Brooks’s continuity estimate does not give boundedness. Translation by a group-like series is R-linear, not a unital algebra endomorphism.

The p-new multiplicative formula uses a separately constructed root. It identifies Castella’s Abel–Jacobi map with the formal logarithm through Bloch–Kato’s Example 3.10.1 for the semistable Jacobian, not through the good-reduction node. Castella’s Theorem 2.11 is linear in the logarithm, and the squared central-value convention gives (1−a_p/p)² log². The Hida-family exceptional-zero derivative has no current consumer; if one appears, it belongs with GH.7.

The suppliers outside this roadmap:

- the abelian p-adic logarithm is imported from EffectiveDiophantineMethods ED.4;
- the BLR cotangent statement is requested from NeronModelsAndSemistableAbelianVarieties R11.1;
- semistable integration, integral Jacquet–Langlands lattices and the abelian analytic-subgroup theorem are proposed Part II extensions of their owners.

## Pinned baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was read at the pin, by the reviser on 2026-10-08 and again by the independent review. Baseline primitives do not supply the arithmetic objects missing from the requests.

- `mathlib:TensorProduct` — Tensor products, for A(K^ab) ⊗_M L and L ⊗_Q ℝ. Source: `Mathlib/LinearAlgebra/TensorProduct/Defs.lean`.
- `mathlib:LinearMap` — Curried linear maps V →ₗ[L] W →ₗ[L] N provide mixed-source bilinear maps. BilinMap requires the same source in both slots and cannot directly type A × A^∨. Source: `Mathlib/Algebra/Module/LinearMap/Defs.lean`.
- `mathlib:Module.Dual` — Linear functionals, for the toric functional ℓ ∈ Hom(π ⊗ χ, L) and for log_ω. Source: `Mathlib/LinearAlgebra/Dual/Defs.lean`.
- `mathlib:Module.End.eigenspace` — Eigenspaces of one endomorphism; the χ-isotypic space is the intersection of the eigenspaces of the σ_t. Source: `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`.
- `mathlib:NumberField.classNumber` — The class number of the maximal order O_K only; not the ring-class number of O_c or the relative Picard group. Source: `Mathlib/NumberTheory/NumberField/ClassNumber.lean`.
- `mathlib:NumberField.Units.torsionOrder` — #μ(K) = #μ(O_K), whose half is the unit index u for c = 1; for c > 1, O_c^× = {±1} and u = 1. Source: `Mathlib/NumberTheory/NumberField/Units/Basic.lean`.
- `mathlib:NumberField.IsCMField` — CM fields: K totally complex and quadratic over its maximal real subfield K⁺; for the packet's K/F with F totally real, F = K⁺. Source: `Mathlib/NumberTheory/NumberField/CMField.lean`.
- `mathlib:CuspForm` — Cusp forms for a subgroup of GL(2, ℝ); does not supply a newform, Hecke projector or Jacquet–Langlands transfer. Source: `Mathlib/NumberTheory/ModularForms/Basic.lean`.
- `mathlib:CongruenceSubgroup.Gamma0` — Γ₀(N) as a subgroup of SL(2, ℤ); a separate map to GL(2, ℝ) is required to use CuspForm. Source: `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`.
- `mathlib:UpperHalfPlane.petersson` — The Petersson integrand conj(f(τ))·f'(τ)·(Im τ)^k. Source: `Mathlib/NumberTheory/ModularForms/Petersson.lean`.
- `tauceti:UpperHalfPlane.peterssonInner` — ∫_D conj(f)·g·(Im τ)^k dμ with dμ = dx dy / y²; for k = 2 and D a fundamental domain of Γ₀(N) it is CST's (φ, φ)_{Γ₀(N)} = ∫|φ|² dx dy. Source: `TauCeti/NumberTheory/ModularForms/Petersson/Basic.lean`.
- `mathlib:DirichletCharacter.LFunction` — Dirichlet L-functions, for L(1, η) with η the quadratic character of K/ℚ. Source: `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`.
- `mathlib:riemannZeta` — ζ(2) = ζ_ℚ(2) in the constant of the Gross–Zagier formula over ℚ. Source: `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`.
- `mathlib:WeierstrassCurve.Affine.Point` — Points of a Weierstrass curve, the carrier of E(K). Source: `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean`.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight` — Tau Ceti's canonical height ½·lim h(x(2ⁿP))/4ⁿ, relative to the base field's admissible absolute values (the (O)-normalised height). Source: `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean`.
- `tauceti:WeierstrassCurve.Affine.neronTatePairing` — The halved polar form of canonicalHeight. Source: `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean`.
- `mathlib:FormalGroup` — One-dimensional formal group laws; does not construct the convergent logarithm of an elliptic curve or the logarithm of a general abelian variety. Source: `Mathlib/RingTheory/FormalGroup/Basic.lean`.
- `mathlib:PowerSeries` — Formal power series R⟦T⟧ only. The isomorphism with R⟦Γ⟧ after choosing a generator is requested from PadicMeasuresIwasawaAlgebras L1. Source: `Mathlib/RingTheory/PowerSeries/Basic.lean`.
- `mathlib:PowerSeries.eval₂` — Defined by extending polynomial evaluation by continuity (IsDenseInducing.extend). The ring map is eval₂Hom, which needs Continuous φ, HasEval a (that is, IsTopologicallyNilpotent a) and a complete, separated, linearly topologised target; the definition alone does not give it. Source: `Mathlib/RingTheory/PowerSeries/Evaluation.lean`.
- `mathlib:QuadraticMap.polar` — The polar form Q(x + y) − Q(x) − Q(y), the BSD pairing of a canonical height. Source: `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`.
- `mathlib:Algebra.trace` — Field trace and trace after scalar extension. Extending an M-valued pairing to L multiplies the trace of a base-field value by [L:M]; the original rational-height trace characterization belongs to GZ.1. Source: `Mathlib/RingTheory/Trace/Defs.lean`.
- `mathlib:IsTopologicallyNilpotent` — Powers tend to zero. This alone neither supplies a complete separated adic topology nor proves convergence of evaluation. Source: `Mathlib/Topology/Algebra/TopologicallyNilpotent.lean`.
- `mathlib:ContinuousMonoidHom` — Continuous characters ψ : Γ → R^×. Source: `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`.
- `mathlib:NumberField.instAdmissibleAbsValues` — Admissible absolute values of a number field: every infinite place with its multiplicity and every finite place, with no division by the degree. Heights built from it, including Tau Ceti canonicalHeight, are relative to the field. Source: `Mathlib/NumberTheory/Height/NumberField.lean`.
- `tauceti:CuspForm.peterssonInnerCosets` — The Petersson product on S_k(Γ) for a finite-index Γ ≤ SL(2, ℤ), applied to Γ.map (mapGL ℝ), as a sum over the cosets of Γ·{±I}; for Γ = Γ₀(N) and k = 2 it is CST's (φ, φ)_{Γ₀(N)} = ∫ |φ|² dx dy. Source: `TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean`.
- `tauceti:CuspForm.peterssonInnerCosets_self_eq_zero` — Strict definiteness: the self-pairing is zero exactly for the zero cusp form, so (φ, φ) > 0 for φ ≠ 0 (the self-pairing is real). Source: `TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean`.
- `tauceti:CuspForm.peterssonInnerCosets_eq_peterssonInner` — The coset product equals peterssonInner over the union of the translates of the interior of the standard domain, a fundamental domain of the image of Γ. Source: `TauCeti/NumberTheory/ModularForms/Petersson/Adjoint.lean`.
- `mathlib:AbstractMeasure.amiceTransform` — Amice transform D(ℤ_p, R) →ₗ[R] R⟦X⟧ by Mahler moments, for a topological ℤ_p-algebra R. Source: `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean`.
- `mathlib:AbstractMeasure.injective_amiceTransform` — Injectivity of the Amice transform for complete ultrametric normed ℤ_p-algebras with bounded scalar action, for example R = Ô^ur. Source: `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean`.
- `mathlib:AbstractMeasure.amiceTransformEquiv` — The Amice transform as a linear equivalence, for ℤ_p coefficients only; surjectivity over Ô^ur is requested from PadicMeasuresIwasawaAlgebras L2. Source: `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean`.
- `tauceti:TauCeti.cuspFormsOld` — The old subspace of S_k(Γ₁(N)), spanned by level-raised forms from proper divisor levels. Source: `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean`.
- `tauceti:TauCeti.cuspFormsNew` — The new subspace of S_k(Γ₁(N)): the Petersson-orthogonal complement of the old subspace. Source: `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean`.
- `tauceti:TauCeti.isCompl_cuspFormsOld_cuspFormsNew` — The old and new subspaces are complements. Source: `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean`.
- `tauceti:HeckeRing.GL2.Newform` — Normalised newforms of level N and weight k with nebentypus, as Hecke eigenforms in the new subspace. Source: `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`.
- `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq` — Strong multiplicity one: two newforms of the same level, weight and nebentypus whose coefficients agree at all indices prime to N outside a finite set are equal. Source: `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean`.
- `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` — Dirichlet class number formula: (s − 1)ζ_K(s) tends to 2^{r₁}(2π)^{r₂}R_K h_K/(w_K √|d_K|) as s → 1⁺, for the finite (not completed) Dedekind zeta function. Completed and finite values of L(1, η) = Res ζ_K / Res ζ_F differ by archimedean factors and must not be mixed. Source: `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`.
- `tauceti:CuspForm.peterssonInnerCosets_self_re_nonneg` — The real part of the self-pairing is nonnegative. Source: `TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean`.
- `tauceti:CuspForm.peterssonInnerCosets_self_im` — The self-pairing is real: its imaginary part is zero. Source: `TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean`.
- `mathlib:completedRiemannZeta` — The completed Riemann zeta function Λ(s) = π^{-s/2}Γ(s/2)ζ(s); Λ(2) = π^{-1}ζ(2) is the completed ζ(2) of the YZZ constant over ℚ. Source: `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`.

## GZ.8 — Gross–Zagier pairing and explicit formulas

### The χ-isotypic Mordell–Weil space A(χ)

Node: `GrossZagierAndArithmeticHeights:GZ.8/chi-isotypic-mordell-weil-space`. Kind: construction.

Let F be a totally real field, K/F a totally imaginary quadratic extension, A/F a simple abelian variety of strict GL(2)-type with M = End⁰(A) a field, L a finite extension of M and χ : K^× \ 𝔸_K^× → L^× a Hecke character of finite order. Put A(K^ab)_ℚ = A(K^ab) ⊗_ℤ ℚ, an M-module through End⁰(A), and let 𝔸_K^× act on A(K^ab)_ℚ ⊗_M L through the reciprocity map t ↦ σ_t (GZ.0's convention). Define A(χ) = {x ∈ A(K^ab)_ℚ ⊗_M L : σ_t x = χ(t)^{-1} x for all t ∈ 𝔸_K^×}; the exponent is fixed so that the χ-Heegner point P_χ(f) = ∫ f(P)^{σ_t} χ(t) dt lies in A(χ), as in YZZ Thm. 1.2, where P_χ(f1) ∈ A(χ) is paired with P_{χ^{-1}}(f2) ∈ A^∨(χ^{-1}). If χ factors through Gal(H/K) for a finite abelian H/K, then A(χ) is the image of the idempotent e_χ = [H:K]^{-1} Σ_{σ ∈ Gal(H/K)} χ(σ) σ on A(H)_ℚ ⊗_M L, and it is a finite-dimensional L-vector space.

Hypotheses:

- A simple of strict GL(2)-type over F, M = End⁰(A) a field (YZZ Sec. 1.2.3; CST §1.2).
- χ of finite order with values in L ⊇ M; the reciprocity convention is GZ.0's (arithmetic Frobenius), and changing it replaces A(χ) by A(χ^{-1}). For F = ℚ the ring-class tower is HE.0/ring-class-tower-quotients; for general F only a finite abelian H/K through which χ factors is used.
- Finite dimensionality uses the Mordell–Weil theorem for A over the number field H.
- The sum of all character projectors requires L to be a splitting field for the finite quotient G, in addition to |G| being invertible. A single χ-projector does not require this extra assumption.
- GZ.1/character-height-pairing writes V_χ for the χ(σ)-eigenspace {σx = χ(σ)x}; in this packet's notation V_χ = A(χ^{-1}), and GZ.1's e_χ = |G|^{-1}Σ_σ χ(σ)^{-1}σ is this packet's e_{χ^{-1}}.

Proof or construction:

1. σ_t acts L-linearly on A(K^ab)_ℚ ⊗_M L because the Galois action commutes with End⁰(A) for A defined over F ⊂ K.
2. For a fixed χ, character orthogonality gives an idempotent projecting onto the χ^{-1}-eigenspace. If L contains every character of G, the projectors over all characters sum to 1 and give the direct-sum decomposition; without that splitting hypothesis do not claim this sum.
3. Rational invariants descend by finite averaging: represent a vector over a finite Galois extension H′/H, average its conjugates, and divide by [H′:H]. Thus invariants after tensoring with ℚ are A(H)_ℚ, even when a representative point is fixed only modulo torsion. Finite dimensionality then uses Mordell–Weil, whose exact export is a recorded gap.

Consumer uses:

- YZZ Thm. 1.2 (p. 9) — the target space of P_χ(f) and the domain of the L-linear pairing ⟨·,·⟩_L
- CST Theorem 1.5 — P⁰_χ(f) ∈ A(K^ab)_ℚ ⊗_M L (p.6); reindexing the sum shows that it lies in A(χ)
- Zhang 2010, Theorem 4.3.1(2) — dim (A_Π(E^ab) ⊗ ℂ)^χ is the rank statement of Tian–Zhang; Zhang weights his point by χ(σ)^{-1} (p.587), so his χ-eigenspace {τx = χ(τ)x} is A(χ^{-1})⊗ℂ in this node's labelling
- HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev — for χ = 1 the rank of A(K) over O_L is read off from A(1)

Planning API:

- `TauCeti.GrossZagier.chiIsotypic` (constructor): A(χ) as the L-submodule {x | ∀ t, σ_t • x = χ(t)^{-1} • x} of a module with a commuting group action.
- `TauCeti.GrossZagier.mem_chiIsotypic_iff` (characterisation): x ∈ A(χ) ↔ ∀ t, σ_t • x = χ(t)^{-1} • x.
- `TauCeti.GrossZagier.chiProjector` (data): e_χ = |G|^{-1} Σ_σ χ(σ) • σ for a finite abelian quotient G.
- `TauCeti.GrossZagier.chiProjector_mem` (projection): e_χ x ∈ A(χ) for every x.
- `TauCeti.GrossZagier.chiProjector_of_mem` (simp): x ∈ A(χ) → e_χ x = x.
- `TauCeti.GrossZagier.chiIsotypic_one` (compatibility): A(1) is the submodule of K-rational vectors (fixed by every σ_t).
- `TauCeti.GrossZagier.chiIsotypic_disjoint` (relation): A(χ) ⊓ A(χ') = ⊥ for χ ≠ χ'.
- `TauCeti.GrossZagier.sum_chiProjector` (relation): If L contains all characters of the finite abelian quotient G and |G| is invertible, Σ_χ e_χ = 1 on the G-module.
- `TauCeti.GrossZagier.chiIsotypic_map` (functoriality): An L-linear G-equivariant map φ sends x ∈ A(χ) to φ(x) ∈ A′(χ).

Unit tests:

- `TauCeti.GrossZagier.chiIsotypic_trivial_eq_fixed` (degenerate): For χ = 1 the χ-isotypic subspace is the space of vectors fixed by every σ_t (A(1) = A(K)_ℚ ⊗_M L).
- `TauCeti.GrossZagier.chiProjector_idem` (characterisation): e_χ ∘ e_χ = e_χ, and e_χ ∘ e_χ' = 0 for χ ≠ χ' (orthogonal idempotents).
- `TauCeti.GrossZagier.chiIsotypic_quadratic_sign` (computation): For G = ℤ/2 acting on V = L² by swapping coordinates and χ the nontrivial character, A(χ) = {(a, −a)}, while A(1) = {(a, a)}.
- `TauCeti.GrossZagier.chiIsotypic_ne_whole` (non-example): A(χ) is not A(H)_ℚ ⊗_M L: for G = ℤ/2 swapping coordinates, (1, 0) lies in neither eigenspace.
- `TauCeti.GrossZagier.chiIsotypic_cubic` (computation): For G = ℤ/3 = ⟨σ⟩ acting on V = L³ by σ(a,b,c) = (c,a,b), with ζ ∈ L a primitive cube root of unity and χ(σ) = ζ: A(χ) = L·(1,ζ,ζ²) and A(χ^{-1}) = L·(1,ζ²,ζ), since σ(1,ζ,ζ²) = ζ²(1,ζ,ζ²) = χ(σ)^{-1}(1,ζ,ζ²). Order-two characters cannot distinguish χ from χ^{-1}, so this test fixes the exponent convention.

Acceptance:

- For χ = 1, A(χ) = A(K)_ℚ ⊗_M L.
- Torsion points contribute nothing: A(K^ab)_tors ⊗ ℚ = 0.
- Replacing the arithmetic by the geometric reciprocity convention exchanges A(χ) and A(χ^{-1}) (GZ.0/artin-map-convention).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`
- `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`
- `mathlib:TensorProduct`
- `mathlib:Module.End.eigenspace`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`
- `GrossZagierAndArithmeticHeights:GZ.1`
- `mathlib:NumberField.IsCMField`
- `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`

Source locators:

- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements) — A(χ) is the domain of YZZ's L-linear pairing.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, before Theorem 1.5, p. 6 — The ambient space A(K^ab)_ℚ ⊗_M L and the reciprocity action t ↦ σ_t.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.3, Theorem 4.3.1(2), p. 588 — The χ-eigenspace as the object whose dimension the BSD consequences control.
### The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1})

Node: `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`. Kind: construction.

Import from GZ.1 the Poincaré height pairing B_{k,M}: V × W → M⊗_ℚℝ for A and A^∨, with the dual M-action in the second slot and tr_{M⊗ℝ/ℝ} B_{k,M}=B_k. For M⊂L define B_{k,L} on (L⊗_M V) × (L⊗_M W) by L-bilinear extension, with target L⊗_M(M⊗_ℚℝ)≃L⊗_ℚℝ. On pure tensors B_{k,L}(a⊗x,b⊗y)=ab⊗B_{k,M}(x,y). Invariant Galois actions give B_{k,L}(A(χ),A^∨(χ′))=0 unless χ′=χ^{-1}. For base-field vectors its full real trace is [L:M]B_k(x,y), rather than B_k itself. Take k=F for the YZZ formula and k=K for CST; the field-relative pairings satisfy B_K=[K:F]B_F on the common algebraic points.

Hypotheses:

- M and L finite separable coefficient fields; V and W are rational Mordell–Weil modules with the GZ.1 dual M-actions.
- The Galois action preserves the imported M-pairing and commutes with M and L.
- The M-valued trace characterization is imported, not reconstructed by taking a trace of the L-extension. The YZZ height is relative to F; CST uses the K-relative height, a factor of two for K/F quadratic (CST p.18).
- GZ.1/character-height-pairing writes V_χ for the χ(σ)-eigenspace {σx = χ(σ)x}; in this packet's notation V_χ = A(χ^{-1}), and GZ.1's e_χ = |G|^{-1}Σ_σ χ(σ)^{-1}σ is this packet's e_{χ^{-1}}.

Proof or construction:

1. Use the universal property of both tensor products to extend the imported M-bilinear map; associativity identifies the target with L⊗_ℚℝ.
2. Check the pure-tensor formula and both L-scalar laws; Galois invariance extends by linearity.
3. For an unmatched eigencharacter, invariance gives B=χ(t)^{-1}χ′(t)^{-1}B; choose t with product different from one.
4. Apply transitivity of finite separable trace to a base-field coefficient: tr_{L/M}(m)=[L:M]m. Keep the original rational trace recovery at M.
5. For E and M=L=ℚ compare with the full polar form, twice Tau Ceti’s halved Néron–Tate pairing.

Consumer uses:

- YZZ Thm. 1.2 (p. 9) — the left side ⟨P_χ(f1), P_{χ^{-1}}(f2)⟩_L of the Gross–Zagier identity
- CST Theorems 1.5–1.6 — ⟨P⁰_χ(f1), P⁰_{χ^{-1}}(f2)⟩_{K,L} on the explicit side
- Skinner 2020, Prop. 2.5.1 — Skinner's ⟨P_K(f), P_K(f)⟩_𝓛 = ⟨P_K(f), λ(P_K(f))⟩_NT, where 𝓛 is a symmetric ample line bundle with polarisation λ (𝓛 is not the coefficient field L)
- GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion — positivity of the Hermitian self-pairing turns one nonzero derivative into all

Planning API:

- `TauCeti.GrossZagier.coeffPairing` (constructor): L-bilinear scalar extension of the supplied mixed-source M-bilinear height, with target L⊗_M S; it is not a second construction of the M-valued height.
- `TauCeti.GrossZagier.trace_coeffPairing` (characterisation): For B valued in M and base-field inputs, tr_{L/M}(B_L(1⊗x,1⊗y))=[L:M]B(x,y); compose with the GZ.1 real trace in the arithmetic case.
- `TauCeti.GrossZagier.coeffPairing_smul_left` (simp): B_L(a·x,y)=a·B_L(x,y), for a∈L.
- `TauCeti.GrossZagier.coeffPairing_smul_right` (simp): B_L(x,a·y)=a·B_L(x,y), where W already carries the dual M-action.
- `TauCeti.GrossZagier.coeffPairing_galois` (relation): ⟨σx, σy⟩_{K,L} = ⟨x, y⟩_{K,L} for σ ∈ Gal(K̄/K).
- `TauCeti.GrossZagier.coeffPairing_chi_orthogonal` (relation): ⟨A(χ), A^∨(χ')⟩_{K,L} = 0 unless χ' = χ^{-1}.
- `TauCeti.GrossZagier.coeffPairing_torsion_left` (other): The pairing kills the images of torsion points; after rationalisation these images are zero, so the signature needs characteristic zero (over ZMod p every vector has finite additive order).
- `TauCeti.GrossZagier.coeffPairing_elliptic` (compatibility): At M=L=ℚ and after tensoring the point groups with ℚ, the BSD height pairing is the rational linear extension of twice Tau Ceti’s neronTatePairing.
- `TauCeti.GrossZagier.coeffPairing_tmul` (characterisation): On pure tensors the value is ab⊗B(x,y).

Unit tests:

- `TauCeti.GrossZagier.coeffPairing_rat` (degenerate): If M = L = ℚ the coefficient pairing equals the ℚ-bilinear Néron–Tate pairing (the trace is the identity).
- `TauCeti.GrossZagier.coeffPairing_trace_qsqrt5` (computation): In a quadratic L/M extension, the trace of B_L(1⊗x,1⊗y) is 2B(x,y). In particular, for M=ℚ and L=ℚ(√5), a base value 1 has trace 2.
- `TauCeti.GrossZagier.coeffPairing_eq_bsd` (compatibility): For an elliptic curve with M = L = ℚ, ⟨P, P⟩_{K,L} = 2 · canonicalHeight P over K, the BSD pairing of GZ.0.
- `TauCeti.GrossZagier.coeffPairing_not_trace` (non-example): In a characteristic-zero quadratic L/M extension, a base pairing value 1 has extended trace 2, hence not 1. Reusing the M trace-recovery law after L-extension fails.
- `TauCeti.GrossZagier.coeffPairing_bilinear_qi` (non-example): For M = ℚ, L = ℚ(i) and a base value B(x,y) = 1, the extension gives B_L(i⊗x, i⊗y) = i²·1 = −1; an extension conjugate-linear in one slot would give +1, so the extension is bilinear, not Hermitian.

Acceptance:

- Restricted to χ = 1, M = L = ℚ and A = E an elliptic curve with its principal polarisation, ⟨P, P⟩_{K,L} equals the K-relative BSD pairing ⟨P, P⟩_BSD of GZ.0, i.e. twice Tau Ceti's canonicalHeight over K.
- The pairing kills torsion and is ℝ-valued after tr_{L⊗ℝ/ℝ}.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`
- `GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height`
- `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`
- `GrossZagierAndArithmeticHeights:GZ.8/chi-isotypic-mordell-weil-space`
- `GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing`
- `mathlib:LinearMap`
- `mathlib:TensorProduct`
- `mathlib:Algebra.trace`
- `mathlib:QuadraticMap.polar`
- `GrossZagierAndArithmeticHeights:GZ.1`
- `tauceti:WeierstrassCurve.Affine.neronTatePairing`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, before Theorem 1.5, p. 6 — The coefficient pairing and its trace characterisation.
- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements) — The pairing in YZZ's main theorem.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2 p.6 and §2.3 p.18 after (2.4) — Coefficient-valued height and explicit F-relative versus K-relative comparison.
### The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f)

Node: `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`. Kind: construction. Planet: **χ-Heegner point**.

For the ξ-normalized CM point P and f∈π_A, the weighted function t↦f(P)^{σ_t}⊗χ(t) descends to K×\𝔸_K×/𝔸_F× by ω_Aχ|𝔸_F×=1. Let G=Pic_{K/F}(O_c) be a finite quotient through which this weighted integrand factors, h=#G, and P⁰_χ(f)=Σ_{t∈G}f(P)^{σ_t}⊗χ(t), using representatives and the central cancellation. Define the YZZ point P_χ(f)=h⁻¹P⁰_χ(f) in A(K^ab)_ℚ⊗_M L. Neither χ nor the unweighted orbit is separately asserted to descend to G when the central character is nontrivial. For the abstract character projector, instead take a finite Galois quotient G′ through which both the character and orbit factor; collapsing repeated weighted terms recovers the relative average. The point is independent of refinement and satisfies σ_sP_χ=χ(s)⁻¹P_χ. A toric measure of volume v=2L(1,η), with L(1,η) the completed value (factor π^{-1} at each real place of F), gives P^{vol}_χ=v(1⊗P_χ) in ℂ⊗_L(A(K^ab)_ℚ⊗_M L), after fixing L↪ℂ. The analytic scalar v is not asserted to lie in L.

Hypotheses:

- The weighted integrand descends through the central-character cancellation and factors through the specified relative ring-class quotient; the finite Galois projector uses the larger quotient G′ when necessary.
- h is invertible in L; the module is rationalized and L has characteristic zero.
- The probability normalization is established by CST §2.3 p.18 and Skinner §2.5 p.341. Erratum item 25 corrects the integration group at book p.82 to Gal(E^ab/E); it does not state a probability convention.
- The analytic integral uses L↪ℂ; its height and curve-volume conventions must also be converted before substituting it into a YZZ formula. For F = ℚ, L(1, η) is π^{-1} times Mathlib's DirichletCharacter.LFunction value at s = 1; for general F it is the completed Hecke L-value imported with CST Lemma 2.3 (toric-integral-versus-finite-sum).

Proof or construction:

1. Use HE.1 CM reciprocity and GZ.3 ξ-normalization to obtain the finite orbit and its relative class-group quotient.
2. Sum the character-weighted orbit, divide by h, and reindex to check χ^{-1}-equivariance.
3. If a quotient is refined, every original orbit term is repeated by the kernel size; this cancels against the refined cardinality.
4. Push Haar measure to the finite quotient: probability mass is 1/h per coset; volume-v mass is v/h. Scalar-extend to ℂ for the latter.
5. Use CST Lemma 2.3 and (2.4) for the class-number/relative regulator-unit comparison, and Skinner p.341 for P_K=h_K P(f_1).

Consumer uses:

- YZZ Thm. 1.2 (p. 9) — both sides of the Gross–Zagier identity are functions of P_χ(f1), P_{χ^{-1}}(f2)
- CST Theorems 1.1, 1.5, 1.6 — the explicit formulas are stated for P⁰_χ(f) and its variant with the normalised integral
- RankZeroOneBSD:BSD.3 — the non-torsion Heegner point in E(K) is P⁰_1(f) = Tr f(P)
- HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev — the point y = Tr_{K(x)/K} ι_A(x) is P⁰_1(f) for the quotient map f
- Gross–Zagier I (6.3) — ĥ(c_{χ,f}) of the f-isotypical component of c_χ is the arithmetic side

Planning API:

- `TauCeti.GrossZagier.heegnerFinite` (constructor): P⁰_χ(x) = Σ_{g ∈ G} χ(g) • (g • x) for a finite group G acting on a module and a character χ.
- `TauCeti.GrossZagier.heegnerFinite_smul` (relation): P⁰_χ(h • x) = χ(h)^{-1} • P⁰_χ(x).
- `TauCeti.GrossZagier.heegnerFinite_mem_chiIsotypic` (projection): h • P⁰_χ(x) = χ(h)^{-1} • P⁰_χ(x), so P⁰_χ(x) ∈ A(χ).
- `TauCeti.GrossZagier.heegnerFinite_one` (simp): P⁰_1(x) = Σ_g g • x, the trace.
- `TauCeti.GrossZagier.heegnerFinite_add` (simp): P⁰_χ(x + y) = P⁰_χ(x) + P⁰_χ(y).
- `TauCeti.GrossZagier.heegnerFinite_map` (functoriality): For an equivariant linear map φ, P⁰_χ(φ x) = φ(P⁰_χ x): the Heegner point of a composite parametrisation is the image point.
- `TauCeti.GrossZagier.heegnerIntegral_eq` (compatibility): The analytic integral equals (v/h)·(1⊗heegnerFinite), in the complex scalar extension.
- `TauCeti.GrossZagier.heegnerFinite_inv_eq_gz` (compatibility): Gross–Zagier's eigencomponent c_χ = Σ_σ χ^{-1}(σ) c^σ is P⁰_{χ^{-1}}(c) in this notation; the two conventions differ by χ ↔ χ^{-1} (GZ.0/artin-map-convention).
- `TauCeti.GrossZagier.heegnerFinite_coeff_smul` (simp): For a ∈ L, P⁰_χ(a • x) = a • P⁰_χ(x), distinct from the group-action equivariance formula.
- `TauCeti.GrossZagier.heegnerAverage` (constructor): h^{-1}P⁰_χ in the original L-module; this is the YZZ probability-normalized point.
- `TauCeti.GrossZagier.heegnerAverage_eq_projector` (compatibility): The probability average is the character projector applied to the CM orbit vector.
- `TauCeti.GrossZagier.heegnerIntegral` (constructor): For v∈ℂ the volume-scaled point is v·(1⊗heegnerAverage) in ℂ⊗_L V.
- `TauCeti.GrossZagier.heegnerAverage_pairing` (relation): Any L-bilinear pairing of the χ and χ^{-1} averages is h^{-2} times the pairing of the corresponding finite sums.

Unit tests:

- `TauCeti.GrossZagier.heegnerFinite_trivial_group` (degenerate): For G trivial, P⁰_χ(x) = x.
- `TauCeti.GrossZagier.heegnerFinite_sign_char` (computation): For G = ℤ/2 = {1, σ} and χ(σ) = −1, P⁰_χ(x) = x − σx; for x = (1, 0) in L² with σ swapping coordinates, P⁰_χ(x) = (1, −1).
- `TauCeti.GrossZagier.heegnerFinite_fixed_nontrivial` (non-example): If x is G-fixed and χ ≠ 1 then P⁰_χ(x) = 0: a K-rational point has no χ-component for a nontrivial χ.
- `TauCeti.GrossZagier.heegnerFinite_one_eq_trace` (compatibility): For χ = 1, P⁰_1(x) is the trace Σ_g g • x, the point y_K = Tr_{H/K} P of HE.1.
- `TauCeti.GrossZagier.heegnerFinite_cubic` (computation): For G = ℤ/3 = ⟨σ⟩ acting on L³ by σ(a,b,c) = (c,a,b) and χ(σ) = ζ a primitive cube root of unity: P⁰_χ(e₁) = (1,ζ,ζ²) and σ•P⁰_χ(e₁) = ζ²•P⁰_χ(e₁) = χ(σ)^{-1}•P⁰_χ(e₁); the χ^{-1}-weighted (Gross–Zagier) sum gives (1,ζ²,ζ) instead.
- `TauCeti.GrossZagier.heegnerAverage_sign` (computation): For ℤ/2 swapping the coordinates of ℚ² and χ the sign character, heegnerAverage χ (1,0) = (1/2,−1/2), half of P⁰_χ(1,0) = (1,−1).

Acceptance:

- For F = ℚ, B ramified only at ∞ (the modular case), U = U₀(N) and the Heegner condition, P⁰_χ(f) for f = (X₀(N) → E, ∞ ↦ O) is Σ_{[a]} f(P_a)χ([a])^{-1} with P_a the CM point C/a → C/a𝔑^{-1}, because σ_a sends P_b to P_{a^{-1}b} in GZ.0's convention. CST's sum Σ_{[a]} f(P_a)χ([a]) (§1.1; Example p.7) is therefore P⁰_{χ^{-1}}(f); the inversion is invisible in CST's formula, which is symmetric under χ ↔ χ^{-1}.
- For χ = 1, P⁰_1(f) = Tr_{H_c/K} f(P) ∈ A(K).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/chi-isotypic-mordell-weil-space`
- `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`
- `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`
- `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`
- `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`
- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`
- `mathlib:DirichletCharacter.LFunction`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, before Theorem 1.5, p. 6 — The finite form of the χ-Heegner point.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, p. 587 — Haar measure of total volume 2L(1, η) on Gal(E^ab/E) and the Hodge-class base point. Zhang weights by χ(σ)^{-1} and works in Alb(X), so his P_χ is this node's volume-scaled point for χ^{-1}, before f is applied.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.6, p. 8 — The normalised integral that recovers P⁰_χ from the integral form.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, p. 230 — The classical eigencomponent and its normalisation.
- [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf), Item 25, correction to book p.82 — Corrected integration group; the probability convention comes from the separate CST comparison.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.3, Lemma 2.3 p.17 and (2.4) with following paragraph p.18 — Relative class-number factor and complete normalization dictionary.
### Toric integral versus finite trace

Node: `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum`. Kind: lemma.

For a χ-weighted orbit factoring through G=Pic_{K/F}(O_c), probability integration is P_χ=P⁰_χ/h in A⊗_M L, whereas volume-v integration is v·(1⊗P_χ) in ℂ⊗_L(A⊗_M L). Thus B_F(P_χ,P_{χ^{-1}})=h^{-2}B_F(P⁰_χ,P⁰_{χ^{-1}}); the complex volume-scaled pairing gains a further v². In CST §2.3 let h_b=#Pic_{K/F}(O_b), κ_b=ker(Pic(O_F)→Pic(O_b)), w_b the torsion-unit quotient, R_b the regulator quotient and r=r_K−r_F. Its class-number identity is L^{(b)}(1,η)||Db²δ||^{1/2}2^{-r}=h_b R_b/(#κ_b w_b); setting ν_b=2^{-r}R_b^{-1}#κ_b w_b gives CST P_χ=2L(1,η)P⁰_χ/h_b. Here L(1,η) is the completed value, with factor π^{-1} at each real place of F (for K=ℚ(i), b=1 the identity gives L(1,η)=1/4=π^{-1}·L(1,χ_{−4})); ||·|| is the absolute ideal norm and L^{(b)} omits the Euler factors at the places dividing b. CST also has B_K=2B_F and vol(X)_YZZ=2vol(X)_CST: CST measure H by dxdy/(4πy²) (p.9), YZZ by dxdy/(2πy²) (as in Zhang 2010 p.580), so CST's pairing (f1,f2) is twice YZZ's. All three conversions must be made together. For F=ℚ and χ=1, the finite sum is the trace point and the YZZ average is its quotient by h_c; Skinner p.341 checks the case c = 1, P_K(f) = h_K·P(f_1).

Hypotheses:

- The orbit and χ factor through the finite quotient with h≠0 in L.
- Fix the coefficient embedding for the analytic integral; v=2L(1,η) is a complex scalar.
- Use the same finite-level curve, local toric normalizations and base field when comparing heights.

Proof or construction:

1. Equal coset masses give the two finite formulas.
2. Bilinearity gives h^{-2} and v².
3. Prove CST Lemma 2.3 from the two exact sequences (κ_b, unit indices), the local index [Ô_K^×:Ô_b^×] = N(b)/L_b(1,η) and the class-number formulas for K and F; then simplify the coset volume to 2L(1,η)/h_b.
4. Apply CST’s adjacent height and curve-volume comparisons, rather than mixing its point with YZZ’s constant.

Acceptance:

- CST Theorem 1.6's normalisation #Pic_{K/F}(O_{c1}) (CST print #Pic(O_{c1}); their proof, pp.19–20, uses Pic_{K/F}) / Vol(K^× F̂^× \ K̂^×, dt) · ∫ is exactly the inverse of this factor, so the variation formula reproduces P⁰_χ.
- For F = ℚ, K of class number one and c = 1: #Pic_{K/F}(O_K) = 1 and the factor is the whole toric volume 2L(1, η).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`
- `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`
- `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`
- `mathlib:NumberField.classNumber`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`
- `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.6, p. 8 — The ratio between the integral and the finite sum.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, p. 587 — The total volume of the toric measure.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.3 Lemma 2.3 pp.17–18, equation (2.4) and following paragraph — Completed L(1,η), relative class number, point, height and curve-volume dictionary.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), Published §2.5 p.341, derivation of Proposition 2.5.1 — Trace equals h_K times probability average.
### The Heegner map is a toric-invariant functional

Node: `GrossZagierAndArithmeticHeights:GZ.8/heegner-functional-equivariance`. Kind: lemma.

For t ∈ 𝔸_K^× ⊂ B^× acting on π_A by right translation, P_χ(π_A(t) f) = χ(t)^{-1} P_χ(f). Hence f ↦ P_χ(f) is an element of Hom_{𝔸_K^×}(π_A ⊗ χ, ℂ) ⊗_ℂ (ℂ⊗_L A(χ)), after extending scalars along an embedding L ↪ ℂ; with the local toric spaces of GZ.4, it factors through ⊗_v Hom_{K_v^×}(π_{A,v} ⊗ χ_v, ℂ).

Hypotheses:

- ω_A · χ|_{𝔸_F^×} = 1 (YZZ's central-character condition).

Proof or construction:

1. CM theory: the Hecke action of t on X^{K^×} agrees with σ_t (HE.1/canonical-model-cm-descent), so (π(t)f)(P) = f(P)^{σ_t} up to the convention of GZ.0.
2. Reindex the finite weighted probability sum by multiplication by t. Apply the central cancellation before using relative class representatives; scalar extension gives the complex toric functional.

Acceptance:

- For F = ℚ and the classical Heegner points, applying σ_a, which sends P_b to P_{a^{-1}b} in GZ.0's convention, multiplies P⁰_χ by χ([a])^{-1} (CST's sum over Pic(O_c)).
- The vanishing of the toric Hom space at one place forces P_χ = 0 (vacuous-case).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`
- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`

Source locators:

- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, p. 587 — The toric equivariance of the height distribution, whose source is the equivariance of P_χ.
- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements) — Both sides of Thm. 1.2 lie in the toric Hom spaces, which is what the equivariance gives.
### The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2)

Node: `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`. Kind: theorem. Planet: **Yuan–Zhang–Zhang Gross–Zagier formula**.

Let F be totally real, B an incoherent quaternion algebra over 𝔸_F with ramification set Σ(B) of odd cardinality and B_∞ totally definite, X the Shimura curve system of B, A a simple abelian variety over F parametrised by X with M = End⁰(A) and π_A = Hom⁰_ξ(X, A), K/F totally imaginary quadratic with a fixed embedding 𝔸_K ↪ B, L ⊇ M a finite extension and χ : K^× \ 𝔸_K^× → L^× of finite order with ω_A · χ|_{𝔸_F^×} = 1. Then, as an identity in L ⊗_ℚ ℂ, for all f1 ∈ π_A and f2 ∈ π_{A^∨}: ⟨P_χ(f1), P_{χ^{-1}}(f2)⟩_{F,L} = ζ_F(2) L'(1/2, π_A, χ) / (4 L(1, η)² L(1, π_A, ad)) · α(f1, f2). Here L(s, π_A, χ) is the base-change Rankin L-function L(s, π_{A,K} ⊗ χ) in the unitary normalisation (centre 1/2), α = ∏_v α_v is the product of the normalised local toric integrals of GZ.4, P_χ denotes probability averaging, the height is relative to F, ζ_F(2), L(s,π_A,χ), L(1,η) and L(1,π_A,ad) are completed L-functions as CST's dictionary requires (CST Lemma 2.3 uses the completed L(1,η); finite parts would change the constant by (2π²)^{[F:ℚ]}; the book's own wording is unverified), and the local measures are the corrected ones. The volume-scaled complex integral is a separate object. The identity is first an equality of the two elements ⟨P_χ(·), P_{χ^{-1}}(·)⟩_L and α of the space Hom_{𝔸_K^×}(π_A ⊗ χ, ℂ) ⊗ Hom_{𝔸_K^×}(π_{A^∨} ⊗ χ^{-1}, ℂ), of dimension at most one; it is proved for factorisable f1, f2 and extended by bilinearity, and no zero pairing is placed in a denominator.

Hypotheses:

- A simple and parametrised by X; χ of finite order; ω_A · χ|_{𝔸_F^×} = 1.
- B incoherent (#Σ(B) odd) and totally definite at infinity; K/F totally imaginary. These are the standing hypotheses of YZZ Secs. 1.2.1 and 1.3.1.
- Root numbers in the base-change convention of the erratum: Σ(A, χ) = {v : ε(1/2, π_{A,v}, χ_v) ≠ χ_v(−1)}; Rankin–Selberg-over-F sources (Zhang 2010, CST) carry the extra η_v(−1), which is the same condition (GZ.0).
- The erratum (item 1) keeps the claim that the tower X is a regular, locally noetherian scheme only under #Σ(B) > 1; in the modular case Σ(B) = {∞} work with the finite-level curves X_U.
- Probability-normalized CM points and F-relative height. The CST comparison changes the point by 2L(1,η), multiplies the height by two and halves the curve volume; keep these changes explicit.

Proof or construction:

1. Reduce to the projector form, YZZ Thm. 3.15: ⟨T(f1 ⊗ f2) P_χ, P_{χ^{-1}}⟩_NT = the same constant times α(f1 ⊗ f2), using T_alg(f1 ⊗ f2) = f2^∨ ∘ f1 and the projection formula for heights (YZZ Sec. 1.5.3). Skinner p.341 cites YZZ Thm. 3.13 for the χ=1 point-pairing form; check the numbering against the book.
2. Reduce Thm. 3.15 to the kernel identity (1.5.4) by the arithmetic theta lifting identity (1.5.5) (GZ.6).
3. Reduce the kernel identity for general Schwartz data to degenerate data using the one-dimensionality of the toric Hom spaces (GZ.4) and the local existence results (GZ.7).
4. Prove the degenerate kernel identity by decomposing both kernels over the nonsplit places: archimedean and good finite places by the local intersection computations, bad places by the nearby-quaternion approximation (GZ.7); the coherent kernels left over are perpendicular to σ by Saito–Tunnell at the nearby algebras B(v) (GZ.4).
5. Check the displayed constant against CST (2.4): its point is 2L(1,η) times the probability point after complex extension; its height is K-relative, twice the F-relative height; its curve-volume measure dxdy/(4πy²) is half of YZZ's dxdy/(2πy²), so CST's (f1,f2) is twice YZZ's; then (2.4) reads 8L(1,η)²⟨P_χ,P_{χ^{-1}}⟩_{F,L} = 2·ζ_F(2)L'(1/2,π_A,χ)L(1,π_A,ad)^{-1}·(f1,f2)_YZZ·∏_vβ_v, which is the displayed identity since α = (f1,f2)_YZZ·∏_vβ_v. Convert all three before identifying α and the coefficient ζ_F(2)/(4L(1,η)²L(1,π_A,ad)). The detailed projector-to-kernel argument is inherited from the reviewed decomposition and remains a book-proof gap.

Acceptance:

- Vacuous case: if Σ(B) ≠ Σ(A, χ) both sides vanish (vacuous-case).
- Essential case: Σ(B) = Σ(A, χ) forces ε(1/2, π_A, χ) = −1 (essential-case-root-number).
- Specialisation F = ℚ, Σ(B) = {∞}, Heegner hypothesis: recovers CST Theorem 1.1 after toric-integral-versus-finite-sum and the comparison of α with the Petersson norm (classical-gross-zagier-formula).
- Scaling: replacing f1 by c f1 multiplies both sides by c; replacing a local pairing by c times it multiplies α_v by c (decomposition review).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`
- `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`
- `GrossZagierAndArithmeticHeights:GZ.8/heegner-functional-equivariance`
- `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum`
- `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`
- `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`
- `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`
- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`
- `GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity`
- `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation`
- `GrossZagierAndArithmeticHeights:GZ.0/unitary-and-motivic-centres`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`

Source locators:

- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements) — The theorem with its exact constant.
- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Secs. 1.2.1 and 1.3.1, printed pp. 2–3 and 6 (inherited book locator; checked against public restatements) — The standing hypotheses.
- [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf), Erratum items 1 and 16 (directly read erratum) — The structural restriction in the modular case.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, Theorem 4.2.1, p. 587 — A public statement of the same theorem in distribution form, with the Rankin–Selberg root-number set Σ.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.3, equation (2.4) and following normalization comparison, p.18 — Public restatement and normalization comparison; the detailed YZZ projector proof remains a source gap.
- [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf), Erratum items 28–31, 47, 57, 62 (directly read erratum) — Corrections inside the projector reduction (T_alg lands in Hom⁰(J_U, J_U^∨); Z(x)_U is a push-forward; the F = ℚ normalising factor is 1/2) and in the height-series and local-height computations; the book-proof gap must be checked against them.
### The zero case: vanishing of the toric Hom space

Node: `GrossZagierAndArithmeticHeights:GZ.8/vacuous-case`. Kind: theorem.

In the setting of the Yuan–Zhang–Zhang formula, suppose Σ(B) ≠ Σ(A, χ) (equivalently, Hom_{K_v^×}(π_{A,v} ⊗ χ_v, ℂ) = 0 for some place v, by the Saito–Tunnell dichotomy with the erratum's convention). Then P_χ(f) = 0 in A(χ) for every f ∈ π_A, and α(f1, f2) = 0 for all f1, f2; the Gross–Zagier identity holds as 0 = 0 and gives no information about L'(1/2, π_A, χ).

Hypotheses:

- ω_A · χ|_{𝔸_F^×} = 1.
- Σ(A, χ) computed with ε(1/2, π_{A,v}, χ_v) ≠ χ_v(−1) (base-change convention).

Proof or construction:

1. By heegner-functional-equivariance, f ↦ P_χ(f) lies in Hom_{𝔸_K^×}(π_A ⊗ χ, ℂ) ⊗ A(χ), and a K_A^×-invariant functional on a restricted tensor product restricts to a nonzero local invariant functional at each v if it is nonzero.
2. By Saito–Tunnell (GZ.4) the local space at v is zero exactly when B_v is not the quaternion algebra prescribed by ε(1/2, π_{A,v}, χ_v) χ_v(−1); Σ(B) ≠ Σ(A, χ) means this happens at some v.
3. α is the product of local α_v, and α_v vanishes on the zero local Hom space.

Acceptance:

- Example: F = ℚ, K with a prime q | N inert in K and q ∥ N, χ = 1, and B = M₂ at q; then Σ(A, 1) contains q and P_1(f) = 0 for every parametrisation by the modular curve — the classical Heegner hypothesis is one sufficient condition that avoids this (Skinner's (ram) case, p.341, is another).
- The vacuous case is recorded, not assumed away: the theorem is stated for all f1, f2.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/heegner-functional-equivariance`
- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`

Source locators:

- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements) — The zero case.
### Matching local signs force the global sign −1

Node: `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`. Kind: theorem.

If Σ(B) = Σ(A, χ), then the global root number is ε(1/2, π_A, χ) = ∏_v ε(1/2, π_{A,v}, χ_v) = (−1)^{#Σ(B)} = −1, so L(1/2, π_A, χ) = 0 and the Gross–Zagier identity concerns the first derivative. More generally ε(1/2, π_A, χ) = (−1)^{#Σ(A,χ)} whenever ω_A · χ|_{𝔸_F^×} = 1.

Hypotheses:

- ω_A · χ|_{𝔸_F^×} = 1, which makes every local ε_v equal to ±1. Separately, ∏_v χ_v(−1) = χ(−1) = 1 because χ is trivial on K^× ∋ −1.
- Base-change root numbers; in the Rankin–Selberg convention the same computation uses ∏_v η_v(−1) = 1.

Proof or construction:

1. ε(1/2, π_A, χ) = ∏_v ε_v, and ε_v = χ_v(−1) for v ∉ Σ(A, χ), ε_v = −χ_v(−1) for v ∈ Σ(A, χ), all ε_v = ±1.
2. ∏_v χ_v(−1) = 1 because χ is trivial on K^× ∋ −1; hence ε = (−1)^{#Σ(A,χ)}.
3. #Σ(B) is odd for an incoherent B.

Acceptance:

- F = ℚ, Heegner hypothesis (every p | N split in K), χ = 1: Σ(A, 1) = {∞}, so ε = −1 and L(E/K, 1) = 0, as in Gross–Zagier.
- JSW (H): every ℓ | N⁺ splits in K and N⁻ is a squarefree product of an even number of inert primes; Σ(A,1) = {∞} ∪ {q | N⁻}, odd, so ε = −1. Under (gen-H) a ramified ℓ ∥ N⁺ with untwisted Steinberg π_ℓ lies in Σ(A,1): for E = 11a1 and K = ℚ(√−11), Σ(A,1) = {∞, 11} and ε = +1, so JSW's (sign −1) needs a local condition such as Skinner's (ram) (source issue E89).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`

Source locators:

- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements) — The global sign in the essential case.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.2, p. 586 — The parity formula for the root number.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §4.1, after (gen-H), p. 25 — The sign under (H); the (gen-H) case needs an extra local condition at ramified ℓ | N⁺ (source issue E89).
### Heegner points detect a nonzero central derivative

Node: `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`. Kind: theorem. Planet: **Nonvanishing of Heegner points**.

In the essential case, fix a coefficient embedding ι:L↪ℂ. If both L′(1/2,π_A^ι,χ^ι) and the evaluated local product α^ι(f_1,f_2) are nonzero, then P_χ(f_1) is nonzero: the Gross–Zagier identity has nonzero right side in that same component. Nonzeroness of the form α alone is insufficient. For χ=1, totally real M and a polarization λ with f_2=λ∘f_1, a nonzero probability-averaged point has positive polarized height in every real coefficient realization; by the identity in each real embedding, this implies every conjugate derivative is nonzero. For strict GL(2)-type A, the product L(A/K,s) consequently has order dim A. The corresponding arbitrary-χ converse requires a conjugated dual parametrization and the Hermitian coefficient-height comparison requested from GZ.1; it is not obtained merely by setting f_2=λ∘f_1.

Hypotheses:

- Essential case and the nonzero evaluated toric product in the same embedding as the nonzero derivative.
- For the proved trace-point converse: χ=1, totally real coefficient field, positive polarization, and, only to identify Skinner's P_K(f) with h_K·P_1(f_1), his (sqf), (sgn), (ram).
- For the arbitrary finite-character extension: use complex conjugation on χ and the coefficient realization, and the supplied Hermitian comparison; that proof input is recorded separately.

Proof or construction:

1. In a single embedding, the nonzero derivative times a nonzero evaluated α has nonzero product; a bilinear pairing with zero input would vanish. The constant is finite and nonzero because ζ_F(2), L(1,η) and L(1,π_A^ι,ad) are finite and nonzero (AL.3).
2. For χ=1 identify the finite trace with h times the probability point (Skinner p.341); positivity of the polarized height detects its nonzero rational point.
3. Apply the identity in each real embedding. Skinner’s coefficient-basis argument shows simultaneous nonzero trace realizations; then multiply the conjugate L-functions.
4. For χ≠1 request the Hermitian scalar-extension comparison, including conjugated dual data; do not infer it from Rosati positivity of an unconjugated bilinear pairing.

Acceptance:

- Skinner Proposition 2.5.1 and Corollary 2.5.2, under (sqf), (sgn), (ram): P_K(f) ≠ 0 ⇒ ord_{s=1} L(A_f/K, s) = [M_f : ℚ].
- Tian–Zhang (Zhang 2010, Theorem 4.3.1(1)): ord_{s=1} L(s, π, χ) = 1 implies the same for every conjugate (external comparison: for χ ≠ 1 this node does not prove it, and Tian–Zhang use Kolyvagin's method).
- A non-example: a nonzero element of the Selmer group of A over K does not give a non-torsion point; the first part of the statement produces the point P_χ(f1) itself.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`
- `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`
- `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`
- `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`
- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.1`

Source locators:

- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.5, Proposition 2.5.1, arXiv v1 p. 12; published p. 341 — A nonzero trace point forces a simple zero in the classical rational case.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.5, Corollary 2.5.2, arXiv v1 p. 12; published p. 341 — Simultaneous nonvanishing of the conjugates.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.3, Theorem 4.3.1, p. 588 — The same simultaneous nonvanishing over a totally real field.
- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, after Thm. 1.2, printed p. 9 (inherited book locator; checked against public restatements) — α is a nonzero generator, so suitable test vectors exist.
### Petersson norm, parametrisation degree and Manin constant

Node: `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree`. Kind: lemma.

Let φ ∈ S₂(Γ₀(N)) be a newform with rational coefficients, ω_φ = 2πi φ(z) dz on X₀(N)(ℂ), f : X₀(N) → E a modular parametrisation of an elliptic curve E/ℚ (optimal or not) with f(∞) = O, ω₀ a Néron differential and C the Manin constant of f in the sense of GZ.3/manin-constant, f^*ω₀ = ±C·ω_φ, a positive integer after choosing the sign (GZ.3/manin-integrality-and-p-unit). Then (φ, φ)_{Γ₀(N)} = ∫_{Γ₀(N)\ℍ} |φ(z)|² dx dy is Tau Ceti's CuspForm.peterssonInnerCosets φ φ at weight 2 for Γ₀(N), equal to peterssonInner 2 D φ φ over the explicit fundamental domain D of CuspForm.peterssonInnerCosets_eq_peterssonInner, and it is positive for φ ≠ 0. With this identification the GZ.3 identities read ∫_{X₀(N)(ℂ)} |ω_φ ∧ ω̄_φ| = 8π² (φ, φ)_{Γ₀(N)} (GZ.3/classical-eigendifferential-period) and 8π² (φ, φ)_{Γ₀(N)} = deg f · ‖ω₀‖² / C² (GZ.3/petersson-composition-comparison), where ‖ω₀‖² = ∫_{E(ℂ)} |ω₀ ∧ ω̄₀|. The new content here is only the identification with the Tau Ceti product.

Hypotheses:

- (φ, φ) is integrated against dx dy, the convention of CST and of Tau Ceti's peterssonInner with weight k = 2 ((Im τ)² against dx dy / y²).
- C is part of the data of f (HE.1/parameter-choice-and-degree); no claim C = 1 is made.

Proof or construction:

1. Unfold CuspForm.peterssonInnerCosets_eq_peterssonInner: the sum over the cosets of Γ₀(N) (which contains −I) is peterssonInner 2 over a union of translates of the standard domain forming a fundamental domain; at weight 2 the integrand |φ|²(Im τ)² against dx dy / y² is |φ|² dx dy. Positivity combines peterssonInnerCosets_self_re_nonneg and peterssonInnerCosets_self_im (a nonnegative real) with peterssonInnerCosets_self_eq_zero (zero only at φ = 0).
2. Import the two GZ.3 identities (|ω_φ ∧ ω̄_φ| = 8π²|φ|² dx dy, and f finite of degree deg f with f^*ω₀ = ±C ω_φ) and rewrite them with the identification of the first step.

Acceptance:

- Isogeny test: for ψ : E → E' of degree d with ψ^*ω₀' = c_ψ ω₀, the composite ψ ∘ f has degree d·deg f and Manin constant c_ψ C, and ‖ω₀'‖² = c_ψ² ‖ω₀‖² / d; the combination deg f · ‖ω₀‖² / C² is unchanged, as it must be, since the left side depends only on φ.
- For the X₀(11) parametrisation f = id of 11a1 (deg 1, C = 1), 8π²(φ, φ) = ‖ω₀‖².

Direct prerequisites:

- `tauceti:UpperHalfPlane.peterssonInner`
- `mathlib:UpperHalfPlane.petersson`
- `mathlib:CuspForm`
- `mathlib:CongruenceSubgroup.Gamma0`
- `EllipticCurveModularity:R29.5/modular-parametrisation`
- `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`
- `tauceti:CuspForm.peterssonInnerCosets`
- `tauceti:CuspForm.peterssonInnerCosets_eq_peterssonInner`
- `tauceti:CuspForm.peterssonInnerCosets_self_eq_zero`
- `GrossZagierAndArithmeticHeights:GZ.3/classical-eigendifferential-period`
- `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`
- `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`
- `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit`
- `tauceti:CuspForm.peterssonInnerCosets_self_re_nonneg`
- `tauceti:CuspForm.peterssonInnerCosets_self_im`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, before Theorem 1.1, p. 1 — The normalisation of the Petersson norm.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, after Theorem 1.1, p. 2 — The Manin constant of the parametrisation.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, after (6.4), p. 230 — The Petersson–period identity.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §2, display before Theorem (2.1), p. 310 — ‖ω‖² = c²‖ω_f‖²/deg π for the parametrisation π with π^*ω = cω_f, i.e. the degree identity.
### The Gross–Zagier formula on X₀(N) for ring-class characters

Node: `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`. Kind: theorem. Planet: **Gross–Zagier formula**.

Let φ ∈ S₂(Γ₀(N)) be a newform, K imaginary quadratic of discriminant D, c ≥ 1, O_c = ℤ + cO_K and χ a primitive character of Pic(O_c). Assume (1) (c, N) = 1, no prime p | N is inert in K, and p splits in K if p² | N; (2) χ([𝔭]) ≠ a_p for every p | (N, D), 𝔭 the prime of O_K above p. Let 𝔑 ⊂ O_c be a proper ideal with O_c/𝔑 ≅ ℤ/Nℤ, P_a ∈ X₀(N)(H_c) the point of C/a → C/a𝔑^{-1}, P_χ = Σ_{[a] ∈ Pic(O_c)} [P_a − ∞] ⊗ χ([a]) ∈ J₀(N)(H_c) ⊗ ℂ and P_χ^φ its φ-isotypic component. Then L'(1, φ, χ) = 2^{−μ(N,D)} · 8π²(φ, φ)_{Γ₀(N)} / (u² √|Dc²|) · ĥ_K(P_χ^φ), where L(s, φ, χ) is the Rankin L-series of φ and the theta series of χ without the archimedean factor (centre s = 1), μ(N, D) is the number of primes dividing (N, D), u = [O_c^× : ℤ^×] and ĥ_K(a) = ⟨a, a⟩_K is the Néron–Tate height on J₀(N) relative to K for the class 2Θ (the canonical pairing of Gross–Zagier I (4.3)), extended Hermitian-linearly. For c = 1, D odd and every p | N split, this is Gross–Zagier's theorem; YZZ Thm. 1.1 states it with the height over H, which is h_K times ĥ_K.

Hypotheses:

- Conditions (1)–(2) imply sign −1 for L(s, φ, χ) and B = M₂(ℚ) (CST Lemma 3.1).
- u = [O_c^× : ℤ^×] is half the number of roots of unity in O_c (GZ.0/heegner-unit-index for c = 1).
- Heights relative to K; the cusp ∞ may be replaced by the normalised Hodge class without changing P_χ^φ, cuspidal divisors being Eisenstein.
- The Heegner points P_a are imported from HE.1/cm-cyclic-isogeny-pair, which assumes D_K ∉ {−3, −4}; for K = ℚ(√−1) and ℚ(√−3) (u = 2, 3) the points are requested from HeegnerPointEulerSystems HE.1.

Proof or construction:

1. Gross–Zagier's route for c = 1, D odd, (D, N) = 1: put c_χ = Σ_σ χ^{-1}(σ) c^σ; by Galois invariance ⟨c_χ, T_m c_χ⟩ = h Σ_σ χ(σ) ⟨c, T_m c^σ⟩, so L'(f, χ, 1) = Σ_𝒜 χ(𝒜) L'_𝒜(f, 1) = 8π²/(u²|D|^{1/2}) · (1/h) Σ_m ⟨c_χ, T_m c_χ⟩-series paired with f (coefficient-identity), and expanding c_χ in Hecke eigencomponents leaves ĥ(c_{χ,f}) (f, f) because distinct eigencomponents are orthogonal: L'(f, χ, 1) = 8π²(f, f)/(h u² |D|^{1/2}) · ĥ_H(c_{χ,f}), with ĥ_H = h ĥ_K (Gross–Zagier I (6.3)–(6.5)).
2. General c, D and (N, D): special case of CST Theorem 1.5 (explicit-gross-zagier-formula) with F = ℚ, the admissible order R = {(a b; c d) ∈ M₂(ℤ̂) : N | c} and f : X₀(N) → A, ∞ ↦ O in V(π_A, χ).
3. The CM point fixed by K^× represents C/O_c → C/𝔑^{-1}; the sum Σ_{[a]} f(P_a)χ([a]) over Pic(O_c) is P⁰_{χ^{-1}}(f) (chi-heegner-point), which is exactly Gross–Zagier's c_χ (heegnerFinite_inv_eq_gz); apply Theorem 1.5 to χ^{-1}, which also satisfies (1)–(2) and has L(s, φ, χ^{-1}) = L(s, φ, χ).
4. Translate Theorem 1.5: here Σ₁ = Σ_D = {p | (N, D)}, c₁ = c and κ = 1, so 2^{−#Σ_D} = 2^{−μ(N, D)}, u₁ = u and |D_K|‖c₁²‖ = |Dc²|; Σ = ∅ because p | (N, D) forces p ∥ N by condition (1) while ord_p(c/N) < 0, so L^{(Σ)} = L; and (f, f)_{R^×} = deg f.

Acceptance:

- Constant check against YZZ Thm. 1.1 as quoted in the decomposition: ⟨P_χ(f), P_χ(f)⟩^H_NT = h u² |D|^{1/2}/(8π²(f, f)) · L'(f, χ, 1) for odd D and c = 1 is the same identity after ⟨,⟩^H = h·ĥ_K.
- Unit factor: K = ℚ(√−3), c = 1 gives u = 3 and the factor 1/9; K = ℚ(i) gives u = 2.
- μ(N, D) > 0 only when a prime of N ramifies in K, allowed by condition (1) when p² ∤ N.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`
- `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`
- `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree`
- `GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index`
- `GrossZagierAndArithmeticHeights:GZ.0/unitary-and-motivic-centres`
- `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`
- `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`
- `mathlib:NumberField.classNumber`
- `mathlib:NumberField.Units.torsionOrder`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`
- `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`
- `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`
- `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`
- `HeegnerPointEulerSystems:HE.1`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, Theorem 1.1, p. 2 — The formula with its constant.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, conditions (1)–(2), p. 1 — The Heegner conditions.
- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184), Chapter 1, Thm. 1.1, printed p. 1 (inherited book locator; checked against public restatements) — The classical formula as YZZ quote it.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, Theorem (6.3) and (6.5), p. 230 — The original formula, with heights over H; (6.5) restates it with ĥ_K and ‖ω_f‖² = 8π²(f, f).
### Heights of Heegner points on an elliptic curve

Node: `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`. Kind: theorem.

Let E/ℚ have conductor N, f : X₀(N) → E a modular parametrisation with f(∞) = O, Manin constant C and Néron differential ω₀, and K, c, χ as in classical-gross-zagier-formula. Put P⁰_χ(f) = Σ_{[a] ∈ Pic(O_c)} f(P_a) ⊗ χ([a])^{-1} ∈ E(H_c)_ℂ (chi-heegner-point; CST’s sum with χ([a]) is P⁰_{χ^{-1}}(f) and has the same K-height). Then L'(1, E, χ) = 2^{−μ(N,D)} · 8π²(φ, φ)_{Γ₀(N)} / (u² √|Dc²|) · ĥ_K(P⁰_χ(f)) / deg f = 2^{−μ(N,D)} · ‖ω₀‖² ĥ_K(P⁰_χ(f)) / (C² u² √|Dc²|). For χ = 1 and c = 1, P⁰_1(f) = P_K(f) = Tr_{H_K/K} f(P) ∈ E(K), and ĥ_K(P) = ⟨P, P⟩_BSD computed over K, which is twice Tau Ceti's canonicalHeight for the K-relative height; it is nonzero exactly when P_K(f) has infinite order.

Hypotheses:

- Heegner conditions (1)–(2) of CST.
- ĥ_K is the Néron–Tate height relative to K for the class 2(O) (Gross–Zagier I (4.3); the x-height normalisation of GZ.0). With mathlib:NumberField.instAdmissibleAbsValues on K, Tau Ceti's canonicalHeight is the K-relative (O)-height, so ĥ_K = 2·canonicalHeight = GZ.0's ĥ_x over K.
- deg f and C are data of f; replacing f by its composite with an isogeny changes both and leaves the formula invariant.

Proof or construction:

1. The φ-isotypic projection commutes with f_*: J₀(N) → E, and the height on E pulls back along f to deg f times the height on the f-isotypic part of J₀(N) (projection formula ⟨f x, f x⟩_E = ⟨x, f^∨ f x⟩_J; since f ∘ f^∨ = [deg f] on E, f^∨ ∘ f acts as deg f on the φ-isotypic part f^∨(E) ⊗ ℂ).
2. Combine classical-gross-zagier-formula with petersson-norm-and-parametrisation-degree.
3. For χ = 1 and c = 1 the χ-sum is the Galois trace over Pic(O_K) ≅ Gal(H_K/K) (GZ.0/trace-versus-average).

Acceptance:

- Gross–Zagier's form L'(E/K, 1) = ‖ω₀‖² ĥ_K(y_K) / (C² u² √|D|) (Gross–Zagier write c for the Manin constant C) for (N, D) = 1 and c = 1 is the case μ = 0.
- Isogeny invariance: for ψ : E → E' of degree d, ĥ(ψ P) = d ĥ(P), deg(ψ ∘ f) = d deg f, and C changes by c_ψ; both sides of the second formula are unchanged.
- For 37.a1 and K = ℚ(√−7) the right side must match L'(E/K, 1) = L'(E, 1) L(E^K, 1), a positive real number; a sign or factor-2 error in the height convention is detected by this check.
- Gross–Zagier I Theorem (7.3) (L'(E, 1) is a nonzero rational multiple of Ω·⟨P, P⟩) is RankZeroOneBSD BSD.5's rationality theorem; this node supplies its Gross–Zagier input (Theorem V (2.1)), and the choice of K with L(E^K, 1) ≠ 0 is BSD.2's.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`
- `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree`
- `GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing`
- `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`
- `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`
- `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`
- `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`
- `EllipticCurveModularity:R29.5/modular-parametrisation`
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`
- `mathlib:WeierstrassCurve.Affine.Point`
- `mathlib:NumberField.instAdmissibleAbsValues`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.1, Theorem 1.1, second display, p. 2 — The elliptic-curve formula with the degree of the parametrisation.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.4, p. 11 — The trace Heegner point in the rational modular case.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §2, Theorem (2.1), p. 311 — The elliptic-curve form with the Manin constant c and ‖ω‖² = ∫∫_{E(ℂ)} |ω ∧ ω̄|.
### Admissible orders and the test-vector line V(π, χ)

Node: `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector`. Kind: definition. Planet: **Global admissible test-vector line**.

Let N be the conductor of π^JL, D = D_{K/F}, c ⊂ O_F the largest ideal with χ trivial on ∏_{v∤c} O_{K,v}^× · ∏_{v|c} (1 + cO_{K,v}) (CST’s conductor; this is χ trivial on Ô_c^× only when ω_A is unramified), Σ₁ = {v | N nonsplit in K : ord_v(c) < ord_v(N)}, c₁ the Σ₁-off part of c, N₁ the Σ₁-off part of N and N₂ = N/N₁ its Σ₁-part. An Ô-order R of B_f is admissible for (π, χ) if it has discriminant N, R ∩ K̂ = Ô_{c₁}, and each local component R_v is the admissible local order of GZ.4/admissible-toric-order, including its orientation rule in the split case 0 < ord_v(c₁) < ord_v(N). With U = R̂^×, U^{(N₂)} its N₂-off part, and ω the central character extended to U^{(N₂)} = U′·(Z ∩ U^{(N₂)}) trivially on U′ = ∏_{v∤N₂∞} U′_v (U′_v = U_v for v ∤ N, U′_v ≅ U₁(N)_v for v | N₁), V(π, χ) ⊂ π_A ⊗_M L is the space of f that are ω-eigen under U^{(N₂)} and χ_v^{-1}-eigen under K_v^× for all v ∈ Σ₁. By GZ.4/toric-test-vectors at each v and multiplicity one, V(π, χ) is one-dimensional over L and every nonzero vector is a test vector: α(f, f') ≠ 0 for nonzero f ∈ V(π_A, χ), f' ∈ V(π_{A^∨}, χ^{-1}) (CST Proposition 3.7).

Hypotheses:

- ω_A · χ|_{𝔸_F^×} = 1 and the local condition ε(π_v, χ_v) = χ_v η_v(−1) ε(B_v) (Rankin–Selberg convention of CST, equivalent to the erratum's base-change form).
- At v | N₁ the algebra B_v is split (CST Lemma 3.1(5)).
- The dimension and nonzero-toric conclusions require the actual irreducible local representation, its conductor, the root-number condition and this full admissibility predicate, not just a unit-group intersection or abstract eigenline.

Proof or construction:

1. Existence and uniqueness of admissible R_v up to K_v^×-conjugacy away from (c₁, N), and the two conjugacy classes when 0 < ord_v(c₁) < ord_v(N) (CST Lemmas 3.3–3.4).
2. Local test-vector theory: the fixed space is one-dimensional and the local toric integral is nonzero on it (CST Propositions 3.7–3.8, §3.3–3.4); it imports the local toric functional of GZ.4.

Consumer uses:

- CST Theorems 1.5 and 1.8 — the explicit formulas are stated for f ∈ V(π, χ)
- GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula — the denominator (f1, f2)_{R^×} and the nonvanishing of α
- JSW Remark 4.2.1 — comparison of Heegner points on X_{N⁺,N⁻} with CST's normalisation
- HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev — the CM point x of the specified level is a test vector exactly when its level is admissible

Planning API:

- `TauCeti.GrossZagier.IsAdmissibleOrder` (constructor): CST Definition 1.3: discriminant, optimal intersection, two-maximal-order intersections and the explicitly conductor-selected split orientation when 0<c_v<n_v.
- `TauCeti.GrossZagier.testVectorLine` (data): V(π, χ): the subspace of π ⊗_M L that is eigen under U^{(N₂)} for the extension of ω trivial on U′, and χ_v^{-1}-eigen under K_v^× for v ∈ Σ₁.
- `TauCeti.GrossZagier.finrank_testVectorLine` (characterisation): dim_L V(π, χ) = 1 (CST Proposition 3.7).
- `TauCeti.GrossZagier.localToric_ne_zero_of_mem_testVectorLine` (other): α(f, f') ≠ 0 for nonzero f ∈ V(π_A, χ), f' ∈ V(π_{A^∨}, χ^{-1}).
- `TauCeti.GrossZagier.isAdmissibleOrder_eichler` (example): For F = ℚ and the Heegner conditions, the Eichler order of level N is admissible.
- `TauCeti.GrossZagier.mem_testVectorLine_iff` (characterisation): Membership in V(π,χ) is exactly the ω-eigencondition under U and the χ_v^{-1}-eigencondition under the specified local tori.

Unit tests:

- `TauCeti.GrossZagier.isAdmissibleOrder_eichler_X0` (computation): For K=ℚ(√−7), N=11, c=1, the image !![1,−1;22,−8] of (−7+√−7)/2 has lower-left entry divisible by 11 and satisfies X²+7X+14=0. This tests the explicit embedding fragment. Full admissibility and its CM-point identification require the actual CST order/curve supplier and are recorded as a gap.
- `TauCeti.GrossZagier.testVectorLine_unramified` (degenerate): With trivial ω and the bottom torus subgroup, membership in the test-vector submodule equals the U-fixed condition. The full unramified maximal-order assertion also requires the irreducible local-representation supplier.
- `TauCeti.GrossZagier.testVectorLine_finrank_one` (characterisation): Given the actual line has finrank one, any two test vectors, the first nonzero, are proportional. Proving this dimension from admissibility is the missing arithmetic API, rather than an assumption for arbitrary representations.
- `TauCeti.GrossZagier.newline_not_testVector` (non-example): For a local torus element t with χ(t)≠1, a nonzero t-fixed vector cannot satisfy the required χ^{-1}-eigencondition. This tests the eigenline fragment, modelled on the spherical vector at v ∤ N with χ_v ramified and t ∈ O_{K,v}^×, χ_v(t) ≠ 1; the geometric example additionally requires the CST local representation export.
- `TauCeti.GrossZagier.testVectorLine_inverse_convention` (non-example): For T₁ = ⟨t⟩ with χ(t) = ζ (ζ³ = 1, ζ ≠ 1), U trivial and ω = 1: a vector f with t·f = ζ^{-1} f lies in V, while a nonzero g with t·g = ζ g does not. This detects the χ versus χ^{-1} convention.

Acceptance:

- F = ℚ, Heegner conditions: R = {(a b; c d) ∈ M₂(ℤ̂) : N | c} is admissible and f : X₀(N) → A, ∞ ↦ O lies in V(π_A, χ) (CST, Example after Theorem 1.5).
- The line depends on the optimal embedding, not just the level: at v ∤ N with χ_v ramified (c_v ≥ 1), the vector fixed by a maximal order meeting K_v in O_{K,v} is O_{K,v}^×-fixed and χ_v is nontrivial there, so its toric integral is 0; the test line is fixed by a maximal order meeting K_v in O_{c,v}. At v ∥ N, v | D, c_v = 0 the U₀(N)-newline is the test line (CST Proposition 3.8, Lemma 3.4).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`
- `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`
- `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order`
- `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Definition 1.3, p. 5 — Admissible orders.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Definition 1.4, p. 6 — The test-vector line.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §3.3 Proposition 3.7 p.24 — One-dimensional test-vector space under genuine admissibility and local representation hypotheses.
### The explicit Gross–Zagier formula of Cai–Shu–Tian

Node: `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`. Kind: theorem. Planet: **Explicit Gross–Zagier formula**.

Let F be totally real of degree d, A/F an abelian variety parametrised by a Shimura curve with Hilbert newform φ of parallel weight two, K/F totally imaginary with relative discriminant D and absolute discriminant D_K, χ a finite Hecke character of conductor c with values in L ⊇ M. Assume ω_A · χ|_{𝔸_F^×} = 1 and ε(π_{A,v}, χ_v) = χ_v η_v(−1) ε(B_v) for every v. For nonzero f1 ∈ V(π_A, χ), f2 ∈ V(π_{A^∨}, χ^{-1}): L^{(Σ)'}(1, A, χ) = 2^{−#Σ_D} · (8π²)^d (φ, φ)_{U₀(N)} / (u₁² √(|D_K| ‖c₁²‖)) · ⟨P⁰_χ(f1), P⁰_{χ^{-1}}(f2)⟩_{K,L} / (f1, f2)_{R^×}, an equality in L ⊗_ℚ ℂ, with Σ = {v | (N, Dc) : if v ∥ N then ord_v(c/N) ≥ 0}, Σ_D = {v | (N, D) : ord_v(c) < ord_v(N)}, u₁ = #κ_{c₁} · [O_{c₁}^× : O^×] and L^{(Σ)} the L-series with the Euler factors at Σ removed. Special case (CST Special case 1): if moreover ω_A is unramified and (N, Dc) = 1, B is the nearby quaternion algebra at a real place τ, R an admissible O-order of B, U = R̂^×, P = [h₀, 1] with h₀ the K^×-fixed point and u = #κ_c·[O_c^× : O^×], then L'(1, A, χ) = (8π²)^d (φ, φ)_{U₀(N)} / (u² √(|D_K| ‖c²‖)) · ⟨P⁰_χ(f1), P⁰_{χ^{-1}}(f2)⟩_{K,L} / (f1, f2)_U for any non-constant f1 : X_U → A, f2 : X_U → A^∨ sending a Hodge class to torsion, where (f1, f2)_U = f1 ∘ f2^∨.

Hypotheses:

- The local sign condition is in the Rankin–Selberg convention; it is the erratum's base-change condition ε(1/2, π_{K,v} ⊗ χ_v) = χ_v(−1) ε(B_v) because the two local root numbers differ by λ(K_v/F_v, ψ_v)² = η_v(−1) (GZ.0).
- (f1, f2)_U = Vol(X_U)(f1, f2) with (f1, f2) = Vol(X_U)^{-1} f1 ∘ f2^∨ ∈ M; for an elliptic curve (f, f)_U = deg f.
- Unit index u₁ includes #κ_{c₁} ∈ {1, 2}, the kernel of Pic(O_F) → Pic(O_{c₁}).
- GZ.0/heegner-unit-index gives u₁ only for F = ℚ and c₁ = 1; the general u₁ is defined here from CST §1.2.

Proof or construction:

1. Apply the Yuan–Zhang–Zhang formula to f1 ∈ V(π_A, χ), f2 ∈ V(π_{A^∨}, χ^{-1}) and convert P_χ to P⁰_χ (toric-integral-versus-finite-sum).
2. Evaluate α(f1, f2) at the test vectors by the local computations of CST Proposition 2.5 (formula (2.5)), §3.4 Propositions 3.11–3.12 and Lemmas 3.13–3.14 (assembled in the proof of Theorem 1.5, p.19) and the Petersson pairing formula (CST Proposition 2.1), using the Waldspurger-side normalisations of GZ.5.
3. Compare L(1, π_A, ad) with (φ, φ)_{U₀(N)} (CST Proposition 2.1) and collect the local factors into 2^{−#Σ_D}, u₁ and ‖c₁‖.

Acceptance:

- F = ℚ with the Heegner conditions recovers classical-gross-zagier-formula (CST's Example after Theorem 1.5).
- Special case 2 (ω_A trivial) removes the Euler factors exactly at Σ = {v | (cD, N) : v ∥ N ⇒ v ∤ D}.
- Unit factor u₁ = 1 for K/F with O_{c₁}^× = O^× and κ_{c₁} = 1.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`
- `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector`
- `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum`
- `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`
- `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`
- `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`
- `GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index`
- `GrossZagierAndArithmeticHeights:GZ.4`
- `GrossZagierAndArithmeticHeights:GZ.5`
- `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order`
- `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.5, p. 6 — The general explicit formula.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Special case 1, p. 7 — The coprime special case used for totally real fields.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §2.4, proof of Theorem 1.5, p. 19 — Reduction to Proposition 2.5 and Lemmas 3.13–3.14.
### Variation of the explicit formula for other test vectors

Node: `GrossZagierAndArithmeticHeights:GZ.8/explicit-formula-variation`. Kind: theorem.

With (A, χ), f1 ∈ V(π_A, χ), f2 ∈ V(π_{A^∨}, χ^{-1}) as in explicit-gross-zagier-formula, let S be a finite set of finite places and f1' ∈ π_A, f2' ∈ π_{A^∨} pure tensors agreeing with f1, f2 outside S, with ⟨f'_{1,v}, f'_{2,v}⟩_v ≠ 0 and β⁰(f'_{1,v}, f'_{2,v}) ≠ 0 for v ∈ S, where β⁰(f'_1, f'_2) = ∫_{F_v^× \ K_v^×} ⟨π(t) f'_1, f'_2⟩_v / ⟨f'_1, f'_2⟩_v · χ_v(t) dt. Put P⁰_χ(f1') = #Pic_{K/F}(O_{c₁}) / Vol(K^× F̂^× \ K̂^×) · ∫ f1'(P)^{σ_t} χ(t) dt (CST print #Pic(O_{c₁}), source issue E90; the relative group is needed for agreement with explicit-gross-zagier-formula at S = ∅, and the two counts agree for F = ℚ). Then L^{(Σ)'}(1, A, χ) = 2^{−#Σ_D} (8π²)^d (φ, φ) / (u₁² √(|D_K| ‖c₁²‖)) · ⟨P⁰_χ(f1'), P⁰_{χ^{-1}}(f2')⟩_{K,L} / (f1', f2')_{R^×} · ∏_{v ∈ S} β⁰(f_{1,v}, f_{2,v}) / β⁰(f'_{1,v}, f'_{2,v}), independent of the Haar measures at v ∈ S.

Hypotheses:

- Same hypotheses as explicit-gross-zagier-formula; the ratio β⁰/β⁰ is independent of the local measure.

Proof or construction:

1. Both sides are bilinear invariant forms; by the one-dimensionality of the toric Hom spaces their ratio for (f1', f2') against (f1, f2) is the ratio of the local toric integrals at v ∈ S.
2. Apply explicit-gross-zagier-formula to (f1, f2) and substitute.

Acceptance:

- CST's example: A = X₀(36), K = ℚ(√−3), p ≡ 2 mod 9 prime, χ the cubic character of K(∛p)/K (c = 3p, c₁ = p, #Σ_D = 1, u₁ = 1), f' = id: here Σ = {3} and the Euler factor at 3 is 1, so L^{(Σ)} = L, and L'(1, A, χ) = 9 · 8π²(φ, φ)_{Γ₀(36)} / √(3p²) · ⟨P⁰_χ(f'), P⁰_{χ^{-1}}(f')⟩_{K,K}, from (f', f')_{R^×} = 2/9 and β⁰(f_v, f_v)/β⁰(f'_v, f'_v) = 1 at v = 2 and 4 at v = 3 (9 = 2^{−1}·(9/2)·4); CST write L'^{(∞)}.
- Taking S = ∅ recovers explicit-gross-zagier-formula.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`
- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.4`
- `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order`
- `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Theorem 1.6, p. 8 — The variation formula.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Example after Theorem 1.6, p. 8 — The cube-sum example.
### Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character

Node: `GrossZagierAndArithmeticHeights:GZ.8/rational-shimura-curve-heegner-formula`. Kind: theorem.

Let f ∈ S₂(Γ₀(N)) be a newform with Hecke field M_f, K imaginary quadratic, and assume (sqf) N squarefree, (sgn) ε(f, K) = −1 and (ram) — if (D, N) ≠ 1 then π_ℓ ≅ σ_ℓ ⊗ ξ_ℓ for ℓ | (D, N) and every ℓ | N/(D, N) splits in K. Then either (Case I) every ℓ | N splits or ramifies in K and X = X₀(N), or (Case II) N = N⁺N⁻ with N⁻ a nontrivial product of an even number of inert primes and N⁺ the product of the primes of N that split in K (so (D, N) = 1) and X = X_{N⁺,N⁻} the Shimura curve of the indefinite quaternion algebra of discriminant N⁻ and an Eichler order of level N⁺. Let φ : J(X) → A_f be the quotient by the kernel of the f-eigencharacter, P_K(f) ∈ A_f(K) ⊗ M_f the trace Heegner point (Skinner §2.4), L a symmetric ample line bundle on A_f with polarisation λ. Then, for the identity embedding ι : M_f ⊂ ℝ ⊂ ℂ and P_K(f)^ι ∈ A_f(K) ⊗ ℝ, ⟨P_K(f)^ι, P_K(f)^ι⟩_L = h_K² ζ(2) L'(f, K, 1) (f1 ∘ f2^∨)^ι / (4 L(χ_D, 1)² L(Sym² f, 2) vol(X)), with f1 = φ, f2 = λ ∘ φ and f1 ∘ f2^∨ ∈ End⁰(A_f) = M_f. Consequently P_K(f) ≠ 0 if and only if L'(f, K, 1) ≠ 0, and then ord_{s=1} L(A_f/K, s) = [M_f : ℚ].

Hypotheses:

- (sqf), (sgn), (ram) as in Skinner §2.5.
- The cusp ∞ (Case I) or the normalised Hodge class (Case II) is used as base point; cuspidal and Hodge divisors are Eisenstein, so P_K(f) is unchanged.
- L(Sym² f, 2), L(χ_D, 1) and ζ(2) are Skinner's notation for YZZ's L(1, π, ad), L(1, η) and ζ_F(2) at F = ℚ, χ = 1, quoted from YZZ Theorem 3.13 with YZZ's normalisation of these values; CST Lemma 2.3 forces the completed L(1, η) in that normalisation, and the book itself is not available to confirm the archimedean factors. In Lean, ζ(2) is completedRiemannZeta 2 = π^{-1}·riemannZeta 2, and L(χ_D, 1) is π^{-1} times DirichletCharacter.LFunction at 1 (chi-heegner-point).

Proof or construction:

1. P_K(f) = h_K · P(f1)^ι with P(f1) the YZZ point of the homomorphism f1 = φ and the CM point P (Skinner §2.5).
2. Apply YZZ Theorem 3.13 as cited by Skinner (the Yuan–Zhang–Zhang formula specialised to F = ℚ, χ = 1, Σ(B) = {∞} ∪ {ℓ | N⁻}; book statement not directly checked).
3. M_f is totally real, so P_K(f)^ι ∈ A_f(K) ⊗ ℝ, where the height of the ample symmetric L is positive definite; id ⊗ ι is injective, so ⟨P_K(f)^ι, P_K(f)^ι⟩_L ≠ 0 iff P_K(f) ≠ 0. f1 ∘ f2^∨ ≠ 0 because λ is an isogeny.
4. The order of vanishing follows from the χ = 1 part of nonvanishing-criterion (every conjugate derivative is nonzero, so L(A_f/K, s) has order [M_f : ℚ]).

Acceptance:

- Case I with (D, N) = 1 and D odd is the classical Gross–Zagier setting; Case I with ramified primes is JSW's (gen-H) with N⁻ = 1; Case II is JSW's (H) with N⁻ ≠ 1 (here with N squarefree).
- The factor h_K² records the trace normalisation P_K(f) = h_K P(f1): an averaged point would remove it (toric-integral-versus-finite-sum).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`
- `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`
- `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum`
- `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`
- `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`
- `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`
- `mathlib:riemannZeta`
- `mathlib:DirichletCharacter.LFunction`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`
- `mathlib:completedRiemannZeta`

Source locators:

- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.5, proof of Proposition 2.5.1, p. 12 — The height formula and Corollary 2.5.2, quoted by Skinner from YZZ Theorem 3.13 (published p.341).
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.4, Cases I and II, p. 10 — The quaternionic case.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §4.1, (gen-H), p. 24 — The generalised Heegner hypothesis of the consumers.
### Non-torsion of the trace point on a parametrised GL(2)-type quotient

Node: `GrossZagierAndArithmeticHeights:GZ.8/totally-real-trace-point-nontorsion`. Kind: theorem.

Let F be totally real, B/F ramified at all real places but one and at a finite set S_B with #S_B ≡ [F:ℚ] − 1 mod 2, R an admissible order for (π_A, 1) in the sense of admissible-order-test-vector, X_U the Shimura curve of U = R̂^×, A/F a simple quotient of J(X_U) of strict GL(2)-type with M = End⁰(A), K/F totally imaginary with ε(1/2, π_{A,v}, 1_{K,v}) = η_v(−1)ε(𝔹_v) for every place v, where 𝔹 is the incoherent algebra with B as nearby algebra (CST Theorem 1.5 (2); in particular every v ∈ S_B is nonsplit in K), x ∈ X_U a CM point by K of the admissible level, and f : X_U → A the quotient map normalised by the Hodge class (ι(P) = m[P] − mξ). Assume ω_A is trivial (CST hypothesis (1) with χ = 1) and (N, D) = 1. Put y = Tr_{K(x)/K} f(x) ∈ A(K)_ℚ; here K(x) = H_K and y = (h_F/#κ_1)·P⁰_1(f) with κ_1 = ker(Pic(O_F) → Pic(O_K)), so y and P⁰_1(f) are torsion together. Then y has infinite order if and only if L'(1, A, 1_K) ≠ 0 in M ⊗ ℂ, if and only if ord_{s=1} L(A/K, s) = [M : ℚ] = dim A. In particular, analytic rank exactly dim A over K for L(A/K, s) certifies that this specified y is non-torsion; analytic rank alone without the admissible level does not.

Hypotheses:

- The CM point x has the admissible level, so f is a test vector (α(f, f^∨) ≠ 0); for a non-admissible level y may be torsion although L'(1, A, 1_K) ≠ 0.
- Each conjugate L(s, π_A^ι, 1_K) has root number −1 because the local signs match B (essential-case-root-number), so its order is odd.
- This is the statement HE.7/admissible-rm-kolyvagin-logachev requests; Kolyvagin–Logachev descent (HE.7) then gives rank_ℤ A(K) = dim A.

Proof or construction:

1. Apply the special case (N, Dc) = 1 of explicit-gross-zagier-formula with χ = 1: L'(1, A, 1) is a nonzero multiple of ⟨y, λ y⟩_{K,M} / (f, λ ∘ f)_U.
2. Positivity of the Néron–Tate pairing for the polarisation λ (GZ.1) makes ⟨y, λ y⟩_{K,M} totally positive in M ⊗ ℝ when y has infinite order and zero otherwise.
3. Conclude with the χ = 1 part of nonvanishing-criterion: the conjugate derivatives vanish simultaneously, and L(A/K, s) = ∏_ι L(s − 1/2, π_A^ι, 1_K).

Acceptance:

- For F = ℚ, A = E and B = M₂(ℚ) this is the Gross–Zagier criterion y_K non-torsion ⟺ L'(E/K, 1) ≠ 0.
- The integer m clearing the Hodge denominator scales y by m and does not affect non-torsion.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`
- `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector`
- `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`
- `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`
- `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`
- `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order`
- `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`

Source locators:

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2), §1.2, Special case 1, p. 7 — The formula for the trace point at an admissible level.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf), §4.3, Theorem 4.3.1, p. 588 — Corroboration: simultaneous order one for all conjugates (Tian–Zhang), which the formula plus total positivity reproves here.
### The main identity on X₀(N): heights as Fourier coefficients

Node: `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`. Kind: theorem.

Let N > 1, K = ℚ(√D) imaginary quadratic with D odd, (D, N) = 1 and every p | N split in K, x ∈ X₀(N)(H) a Heegner point of discriminant D, c the class of (x) − (∞) in J₀(N)(H), σ ∈ Gal(H/K) ↔ 𝒜 ∈ Cl_K under the Artin map, ⟨ , ⟩ the Néron–Tate pairing over H extended Hermitian to J(H) ⊗ ℂ, u = #O_K^×/2, and Φ_𝒜 = Σ a_{m,𝒜} q^m the weight-two cusp form of Gross–Zagier IV Theorem (6.9), which satisfies L'_𝒜(f, 1) = 8π²|D|^{-1/2} (f, Φ_𝒜) for newforms f. Then for every m ≥ 1 with (m, N) = 1, ⟨c, T_m c^σ⟩ = u² a_{m,𝒜}. Moreover g_𝒜 = Σ_{m ≥ 1} ⟨c, T_m c^σ⟩ q^m is a cusp form of weight two on Γ₀(N) (Gross–Zagier V §1 p.306), so g_𝒜 − u² Φ_𝒜 is an old form, and (f, g_𝒜) = u²|D|^{1/2}/(8π²) · L'_𝒜(f, 1) for every newform f (Gross–Zagier I Theorem (6.1)–(6.2)), where L_𝒜(f, s) = Σ_{(n,DN)=1} ε(n) n^{1−2s} · Σ a_n r_𝒜(n) n^{−s}.

Hypotheses:

- N > 1 (N = 1 is treated separately by Gross–Zagier [18]); D odd, so D ≡ 1 mod 4 and (D, 2N) = 1; the Heegner hypothesis D ≡ β² mod 4N.
- g_𝒜 depends on the choice of the Heegner point x only through old forms; ⟨c, T_m c^σ⟩ for (m, N) = 1 does not depend on it (action of W × Gal(H/K)).
- x is built from HE.1/cm-cyclic-isogeny-pair, which assumes D_K ≠ −3, −4; for D = −3 (u = 3) the Heegner point is requested from HeegnerPointEulerSystems HE.1.

Proof or construction:

1. g_𝒜 is a cusp form: 𝕋 × S₂(Γ₀(N))_ℚ → ℚ, (T, f) ↦ a₁(Tf), is perfect, so m ↦ ⟨y, T_m z⟩ is the coefficient sequence of a cusp form (classical-height-series-cuspidality).
2. Replace c^σ by d^σ, d = (x) − (0), using that (0) − (∞) is torsion (Manin–Drinfeld), and decompose ⟨c, T_m d^σ⟩ (relatively prime divisors for (m, N) = 1, N > 1) into local heights: archimedean contribution from Chapter II Propositions (4.2) and (5.8) (GZ.7), finite contributions from Chapter III Propositions (9.2), (9.7) and (9.11) (GZ.7).
3. Rewrite both through Chapter IV Proposition (4.6) (the Fourier coefficients of the holomorphic projection of the derivative of the Rankin kernel, GZ.6) and add: ⟨c, T_m c^σ⟩ = u² a_{m,𝒜} for (m, N) = 1.
4. Two cusp forms whose m-th coefficients agree for (m, N) = 1 differ by an old form, which has the same Petersson product with every newform; use L'_𝒜(f, 1) = 8π² u^{-2} |D|^{-1/2} (f, g_𝒜).

Acceptance:

- The identity is between coefficients with (m, N) = 1 only; a statement for all m would be false because g_𝒜 depends on x through old forms.
- Gross–Zagier V §3 announces the indefinite quaternionic analogue (the coefficients a_{m,𝒜} are a fixed multiple of ⟨x, T_m x^σ⟩ on Pic(X)); in this packet that case is the specialisation of the Yuan–Zhang–Zhang formula (general-quaternionic-gross-zagier-identity) to F = ℚ, not a separate theorem.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform`
- `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-coefficients`
- `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality`
- `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection`
- `GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula`
- `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-height-sum`
- `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`
- `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`
- `mathlib:CuspForm`
- `mathlib:CongruenceSubgroup.Gamma0`
- `tauceti:UpperHalfPlane.peterssonInner`
- `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`
- `tauceti:CuspForm.peterssonInnerCosets`
- `tauceti:TauCeti.cuspFormsOld`
- `tauceti:TauCeti.cuspFormsNew`
- `tauceti:TauCeti.isCompl_cuspFormsOld_cuspFormsNew`
- `tauceti:HeckeRing.GL2.Newform`
- `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq`
- `HeegnerPointEulerSystems:HE.1`

Source locators:

- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §6, Theorem (6.1)–(6.2), p. 230 — The main identity.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p. 307 — The coefficient identity and its proof by adding the archimedean and finite local heights.
### Corollaries on derivatives: positivity and Galois invariance

Node: `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`. Kind: theorem.

Under the hypotheses of the Gross–Zagier formula on X₀(N): (a) for every newform f ∈ S₂(Γ₀(N)) and every character χ of Gal(H/K), L'(f, χ, 1) ≥ 0; (b) either all conjugates L(f^α, χ^α, s), α ∈ Gal(ℚ̄/ℚ), have a simple zero at s = 1, or all have a zero of order ≥ 3; (c) for every newform f and α, ord_{s=1} L(f, s) = 0 iff ord_{s=1} L(f^α, s) = 0, hence also ≥ 2 iff ≥ 2 when the root number w(f) = +1; and if there is an imaginary quadratic K with the Heegner hypothesis, D odd and L(f ⊗ ε_K, 1) ≠ 0 (which forces w(f) = −1, so all orders are odd), then ord_{s=1} L(f, s) = 1 iff ord_{s=1} L(f^α, s) = 1, and ord ≥ 3 iff ord ≥ 3. (Gross–Zagier's '≥ 3' line for w(f) = +1 is not claimed; source issue E91.)

Hypotheses:

- (a)–(b): the Heegner hypothesis and D odd, as in coefficient-identity; the order-one part of (c) takes as a hypothesis an imaginary quadratic K with the Heegner hypothesis and L(f ⊗ ε_K, 1) ≠ 0 (such a K forces w(f) = −1, and Waldspurger's theorem provides one when w(f) = −1; its choice belongs to RankZeroOneBSD BSD.2 and is not planned here).
- Galois conjugates are taken on the coefficients of f and the values of χ.

Proof or construction:

1. (a) L'(f, χ, 1) = 8π²(f, f)/(h u² |D|^{1/2}) ĥ(c_{χ,f}); here (f, f) > 0 for f ≠ 0 (CuspForm.peterssonInnerCosets_self_re_nonneg, _self_im and _self_eq_zero: a nonnegative real, zero only at f = 0) and the Néron–Tate pairing is positive definite.
2. (b) ord_{s=1} L(f^α, χ^α, s) is odd by the functional equation (sign −1); L'(f^α, χ^α, 1) = 0 iff c_{χ^α, f^α} = 0, and c_{χ^α, f^α} = (c_{χ,f})^α, so all vanish together.
3. Order zero: L(f, 1)/Ω_f is algebraic and Galois-equivariant (Shimura), so L(f, 1) = 0 iff L(f^α, 1) = 0; with equal root numbers this also gives ≥ 2 for w(f) = +1.
4. Order one (w(f) = −1): with K as in (c), L(f^α ⊗ ε_K, 1) ≠ 0 for all α by the same algebraicity applied to f ⊗ ε_K; then ord L(f^α, s) = ord L(f^α/K, s) and (b) with χ = 1 gives simultaneous simple zeros; odd parity turns ≥ 2 into ≥ 3.

Acceptance:

- (a) is what the Riemann hypothesis predicts for the real function L(f, χ, s) on the real axis.
- Agreement with the χ = 1 part of nonvanishing-criterion over a totally real field.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`
- `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`
- `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`
- `RankZeroOneBSD:BSD.2/bfh-nonvanishing`
- `tauceti:CuspForm.peterssonInnerCosets_self_eq_zero`
- `ModularSymbolsPadicLFunctions:L1/critical-value-algebraicity`
- `tauceti:CuspForm.peterssonInnerCosets_self_re_nonneg`
- `tauceti:CuspForm.peterssonInnerCosets_self_im`

Source locators:

- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, Corollaries (1.1)–(1.2), pp. 308–309 — Positivity.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, Corollary (1.3), p. 309 — Galois invariance of low orders of vanishing.

Coverage: **planned**. Remaining:

- Verify the YZZ projector reduction against the book (unavailable) and supply arbitrary-character Hermitian positivity from GZ.1.
- Certify the GZ.1, GZ.4 and GZ.5 contracts (Mordell–Weil descent, CST local β-factors, CST Proposition 2.1) and the Tau Ceti Atkin–Lehner and Galois-conjugation exports.
- Replace the documented algebraic fragments by the missing arithmetic signatures and geometric tests once those carrier types exist.

## GZ.9 — BDP and quaternionic logarithm formulas

### The ratio α(f, f_B) of Petersson norms

Node: `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`. Kind: definition.

Let f ∈ S₂(Γ₀(N)) be a newform, N = N⁺N⁻ with N⁻ a squarefree product of an even number of primes, B the indefinite quaternion algebra over ℚ of discriminant N⁻, O_{B,N⁺} an Eichler order of level N⁺ and Γ₀^B(N⁺) its norm-one units. Let f_B be the weight-two cusp form on Γ₀^B(N⁺)\ℍ with the Hecke eigenvalues of f at all ℓ ∤ N⁻ (Jacquet–Langlands), normalised to be defined over ℤ(f)_(p) and nonzero modulo p. Define α(f, f_B) = ⟨f, f⟩_{Γ₀(N)} / ⟨f_B, f_B⟩_{Γ₀^B(N⁺)}, with ⟨g, g⟩_Γ = ∫_{Γ\ℍ} |g(z)|² dx dy, the weight-two Petersson norm. It is algebraic and viewed in the p-adic coefficient field L with the chosen algebraic transfer and embeddings (JSW); the stronger assertion that it lies in precisely the Hecke field needs a specified rational-structure/period comparison, and for N⁻ = 1 with f_B = f it equals 1.

Hypotheses:

- The normalisation of f_B (integral at p and nonzero mod p) fixes it up to a unit of ℤ(f)_(p); α(f, f_B) is therefore defined up to the square-norm of such a unit, which is how it enters the interpolation formula 'up to a p-adic unit'.
- For a weight-two form the Petersson integrand is |g(z)|² (Im z)² against the invariant measure dx dy / y², i.e. |g(z)|² dx dy; JSW §5.1 prints dx dy / y² (recorded as a misprint, E3).

Proof or construction:

1. Existence and uniqueness up to scalar of f_B: global Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer R17.3) and strong multiplicity one on B^×.
2. Rationality of the ratio: Brooks quotes Harris–Kudla [20, Theorem 12.3]; integrality at p for p > k + 1 and p ∤ ∏_{ℓ|N}(ℓ − 1)ℓ(ℓ + 1), the hypothesis as Brooks p. 4232 states it, is Prasanna [31, Theorem 2.4] (the hypothesis in Prasanna's paper itself is not rechecked here); both are imported, not reproved.

Consumer uses:

- JSW (5.1.a) — α(f, f_B) divides the interpolated value
- Brooks, Theorem 8.2 and Proposition 8.7 — α(f, f_GL2) relates the quaternionic CM sum to L(f, χ^{-1}, 0); Brooks writes α(f, f_GL2) = ⟨f_GL2, f_GL2⟩/⟨f, f⟩ with his f quaternionic, which is numerically the same ratio as α(f, f_B) here (GL₂ norm over quaternionic norm); only the argument order of the notation is reversed
- Skinner §2.6 — the constant C(f, K) = α(f, f_GL2)^{-1}

Planning API:

- `TauCeti.GrossZagier.peterssonRatio` (constructor): α(f, f_B) = ⟨f, f⟩_{Γ₀(N)} / ⟨f_B, f_B⟩_{Γ₀^B(N⁺)} for weight-two Petersson norms.
- `TauCeti.GrossZagier.peterssonRatio_split` (simp): For N⁻ = 1 and f_B = f, α = 1.
- `TauCeti.GrossZagier.peterssonRatio_smul` (relation): α(f, u f_B) = α(f, f_B) / |u|².
- `TauCeti.GrossZagier.peterssonRatio_pos` (other): α(f, f_B) > 0.

Unit tests:

- `TauCeti.GrossZagier.peterssonRatio_self` (degenerate): α(f, f) = 1 when the quaternion algebra is split (N⁻ = 1).
- `TauCeti.GrossZagier.peterssonRatio_scale_two` (computation): Replacing f_B by 2 f_B multiplies α by 1/4.
- `TauCeti.GrossZagier.peterssonRatio_eq_peterssonInner` (compatibility): The numerator is Tau Ceti's peterssonInner 2 D f f for a fundamental domain D of Γ₀(N).
- `TauCeti.GrossZagier.peterssonRatio_not_dxdy_over_ysq` (non-example): The integral of |g|² against dx dy / y² is not Γ-invariant for weight two (it changes by |cz + d|⁴ under γ), so it does not define the norm.

Acceptance:

- N⁻ = 1: B = M₂(ℚ), f_B = f and α = 1, so JSW (5.1.a) reduces to BDP's normalisation.
- Scaling f_B by u ∈ ℤ(f)_(p)^× divides α by |u|².

Direct prerequisites:

- `tauceti:UpperHalfPlane.peterssonInner`
- `mathlib:CuspForm`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `GrossZagierAndArithmeticHeights:GZ.5`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`

Source locators:

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, list after (5.1.a), p. 32 — The ratio and its rationality.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.2, after Theorem 8.2, p. 4232 — Brooks's notation α(f, f_GL2) for the same ratio, and its rationality.
### The BDP anticyclotomic p-adic L-function in weight two

Node: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`. Kind: definition. Planet: **BDP p-adic L-function**.

Let f ∈ S₂(Γ₀(N)) be a newform, K imaginary quadratic of discriminant −D_K with (gen-H) for N = N⁺N⁻, p ≥ 3, p ∤ N (good) and p = v v̄ split in K, v fixed by ι_p. Let Γ = Gal(K_∞/K) be the anticyclotomic ℤ_p-extension, O ⊂ L the coefficients (L containing the Hecke field and the Hilbert class field of K), R the completion of the ring of integers of L·ℚ_p^ur, and Λ_R = R⟦Γ⟧. Let Σ_cc be the set of continuous ψ : G_K → ℚ̄_p^× factoring through Γ with ψ^τ = ψ^{-1}, crystalline at v and v̄, of Hodge–Tate weights −n < 0 at v and n at v̄, and ψ^alg its algebraic Hecke character (infinity type (n, −n)). The BDP p-adic L-function is the unique L_p(f) ∈ Λ_R such that for all ψ ∈ Σ_cc with n ≡ 0 mod (p − 1): ψ(L_p(f)) = E_v̄(f, ψ)² · t_K · C(f, ψ) / (α(f, f_B) W(f, ψ)) · Ω_p^{4n} · L(f, ψ^alg, 1) / Ω_∞^{4n}, where E_v̄(f, ψ) = 1 − ψ^alg(ϖ_v̄) a_p p^{-1} + ψ^alg(ϖ_v̄)² p^{-1}, t_K is a power of 2, C(f, ψ) = ¼ π^{2n−1} Γ(n) Γ(n + 1) w_K √D_K ∏_{ℓ|N⁻} (ℓ − 1)/(ℓ + 1), W(f, ψ) is Brooks's constant W(f, χ) of absolute value one (defined before his Proposition 8.5, p. 4235, from the auxiliary ideal b and scalar b_N of Proposition 8.3 and the norm-one scalar W_f following Lemma 8.4), transported by χ^{-1} = ψ^alg|·| (the exact transported expression, and its comparison with the expression displayed by JSW, are part of the normalization gap), α(f, f_B) is the Petersson ratio, Ω_p ∈ R^×, Ω_∞ ∈ ℂ^× are the p-adic and complex CM periods, and L(f, ψ^alg, s) = L(π_K × ψ^alg, s − 1/2). The trivial character (the BDP point) is not in Σ_cc: L_p(f, 1) lies outside the interpolation range.

Hypotheses:

- (gen-H): N⁺ divisible only by split or ramified primes, N⁻ a squarefree product of an even number of inert primes; (good) p ∤ N; (split) p = v v̄. The standing JSW convention also requires p to be odd. Each prime dividing (N, D_K) divides N exactly once (Brooks §2.1; Castella–Hsieh (Heeg′)), and when such primes occur Brooks's factor 2^{#S_f} must be included next to t_K, which depends only on K; JSW itself states existence under (H), and BDP's N⁻ = 1 construction also assumes D_K odd.
- Ordinarity of f at p is not assumed: the CM points are ordinary because p splits in K, and L_p(f) is a bounded measure even for supersingular f.
- Uniqueness uses that the n ≡ 0 mod (p − 1) characters give infinitely many distinct values ψ(γ) − 1 in the open unit disc of ℂ_p (inside the maximal ideal of R itself for n ≡ 0 mod (p − 1)p^k, where p^k is the index of the image of 1 + pℤ_p in Γ), and a nonzero element of R⟦T⟧ has finitely many zeros there (Weierstrass preparation).
- The incomplete L_p^Σ(f) = L_p(f) · ∏_{w ∈ Σ} P_w(ε^{-1}Ψ^{-1}(Frob_w)) for a finite set Σ of places not above p interpolates the incomplete L-values; at an inert w = (ℓ) the factor (1 − a_ℓ ℓ^{-1} + ℓ^{-1})(1 + a_ℓ ℓ^{-1} + ℓ^{-1}) can raise the μ-invariant.
- Construct the linear root first: L3h in the GL₂ case, the integral CM-moment measure of quaternionic-bdp-construction in the quaternionic case. The character/period transport fixes its central-value normalization: step 3 computes the unit u by comparing Castella–Hsieh Proposition 3.8 (N⁻ = 1) or the quaternionic CM formula (N⁻ > 1) with the right side of (5.1.a). bdp-square-root-comparison only draws consequences from the resulting identity L_p(f) = u·root² and is not used to prove the interpolation property.

Proof or construction:

1. Fix L0 character avatars, the tame branch, L3 periods and the coefficient ring. For N⁻=1 import the already constructed L3h root; for N⁻>1 import the bounded quaternionic root from integral CM moment measures.
2. Apply the specified Λ-unit normalization and square; this is the algebraic constructor bdpLFunction(root,normalization). Construction does not call interpolation or a comparison theorem that assumes L_p already exists.
3. Evaluate the supplied roots and compare the constants to JSW (5.1.a): pass from ψ^alg to Castella–Hsieh’s ψ₀φ (N⁻ = 1) or Brooks’s χ (N⁻ > 1), represent φ(𝔑^{-1}) by a group-like unit and show that the remaining scalar lies in R^×. This fixes u and is the normalization gap; bdp-square-root-comparison restates the computation and does not redo it.
4. Use L4 Weierstrass preparation over the complete DVR R to deduce uniqueness from infinitely many distinct interpolation values in its maximal ideal. The suggested uniqueness signature specializes this argument to R=ℤ_p; the general unramified coefficient ring remains a supplier request.

Consumer uses:

- JSW §5.1.5, Propositions 5.1.6–5.1.7 — the value L_p(f, 1) at the BDP point is the square of a logarithm of a Heegner point
- HeegnerPointEulerSystems:HE.8b — char(X_Gr)Λ^ur = (L_BDP²) in BCGS's square-root convention, whose square is this function
- RankZeroOneBSD:BSD.6a — the JSW supersingular branch consumes the good-reduction formula for not necessarily ordinary f
- RankZeroOneBSD:BSD.7a — the Eisenstein branch compares the BDP function with Katz-type character p-adic L-functions
- AutomorphicCongruences:L5a — the BCS two-variable comparison is checked against this one-variable specialisation
- Skinner 2020, §2.6 — L_p^S(f, 1) ≐ (log_ω P_K(f))² and P_K(f) ≠ 0 iff L_p^S(f, 1) ≠ 0
- GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality — membership of the imprimitive function in O^ur⟦Γ⟧

Planning API:

- `TauCeti.GrossZagier.bdpLFunction` (constructor): For an already constructed linear root in Λ_R and a specified Λ_R-unit u, return u·root². The GL₂ root is imported from L3h and the quaternionic root from the CM moment construction. Identifying u with JSW normalization is separate.
- `TauCeti.GrossZagier.bdpLFunction_interpolation` (characterisation): For ψ ∈ Σ_cc with n ≡ 0 mod (p − 1), ψ(L_p(f)) is given by JSW (5.1.a).
- `TauCeti.GrossZagier.bdpLFunction_eq_of_interpolation` (extensionality): Two elements of R⟦T⟧ agreeing at infinitely many points ψ(γ) − 1 of the maximal ideal are equal.
- `TauCeti.GrossZagier.bdpLFunction_eval` (data): A convergent character-evaluation ring map sends u·root² to ev(u)·ev(root)².
- `TauCeti.GrossZagier.bdpLFunction_eval_one` (simp): The value at the trivial character is the constant coefficient: L_p(f, 1) = constantCoeff L_p(f).
- `TauCeti.GrossZagier.bdpLFunction_incomplete` (data): L_p^Σ(f) = L_p(f) · ∏_{w ∈ Σ} P_w(ε^{-1}Ψ^{-1}(Frob_w)).
- `TauCeti.GrossZagier.bdpLFunction_period_change` (relation): Replacing Ω_p by u Ω_p with u ∈ ℤ_p^× (the ambiguity of the formal-group trivialisation, BDP Remark 5.8; for a general unit of R the rescaled values need not come from an element of Λ_R) multiplies ψ(L_p(f)) by u^{4n} for ψ of weight (−n, n).
- `TauCeti.GrossZagier.bdpLFunction_eq_sq` (compatibility): The adapter equals u·root² for the supplied root and unit; the arithmetic identification of that unit is the square-root-comparison node.
- `TauCeti.GrossZagier.bdpIncomplete` (data): Multiply the central-value series by the specified finite collection of local Euler-factor series.

Unit tests:

- `TauCeti.GrossZagier.bdpLFunction_eval_zero` (degenerate): Evaluation at T = 0 (the trivial character) is the constant coefficient of the power series.
- `TauCeti.GrossZagier.bdpLFunction_unique` (characterisation): If F ∈ R⟦T⟧ vanishes at infinitely many distinct points of the maximal ideal then F = 0; so the interpolation property determines L_p(f).
- `TauCeti.GrossZagier.bdpLFunction_euler_11a1` (computation): For the minimal model y²+y=x³−x²−10x−20 of 11a1, #E(𝔽₅)=5 and #E(𝔽₂₃)=25. Thus a₅=1 and E₅=1, while a₂₃=−1 and E₂₃=25/23. The curve y²=x³+3x over 𝔽₅ has ten points, hence a₅=−4 and E₅=2, a 5-adic unit although #E(𝔽₅) ≠ 5; and E₂₃ = 25/23 for 11a1 shows that a good-reduction Euler factor need not be a p-adic unit (or even p-integral). These are point-count tests; identifying the modular form and split CM data requires their owners.
- `TauCeti.GrossZagier.bdpLFunction_trivial_not_interpolated` (non-example): The trivial character has Hodge–Tate weight n = 0 and is not in Σ_cc (n > 0, n ≡ 0 mod p − 1): L_p(f, 1) is not an interpolated value. A function interpolating at n = 0, such as the cyclotomic Mazur–Tate–Teitelbaum function at its critical twists, is a different object (and unbounded for supersingular f, whereas L_p(f) is bounded).

Acceptance:

- Compatibility with BDP's normalisation for N⁻ = 1: α = 1, and L(f, ψ^alg, 1) = L(f, χ^{-1}, 0) for χ^{-1} = ψ^alg|·|, where χ has BDP/Brooks infinity type (2 + j, −j) with j = n − 1 (so Γ(j + 1)Γ(k + j) = Γ(n)Γ(n + 1) and Ω^{2(k+2j)} = Ω^{4n}; JSW Remark 5.1.1(b) prints j = n + 1, see E87).
- Supersingular test: for a_p = 0 the element still lies in Λ_R (bounded), unlike the cyclotomic p-adic L-function of a supersingular form.
- The trivial character is not interpolated: L(f, K, 1) = 0 under (gen-H) while L_p(f, 1) need not vanish.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`
- `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`
- `PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization`
- `PadicMeasuresIwasawaAlgebras:L1`
- `AutomorphicPadicLFunctions:L0`
- `AutomorphicPadicLFunctions:L3`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`
- `mathlib:PowerSeries`
- `mathlib:PowerSeries.eval₂`
- `mathlib:IsTopologicallyNilpotent`
- `mathlib:ContinuousMonoidHom`
- `AutomorphicPadicLFunctions:L3h`
- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`
- `PadicMeasuresIwasawaAlgebras:L4`

Source locators:

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, display (5.1.a), p. 32 — The definition by interpolation.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, Remark 5.1.1(c), p. 32 — Measure versus continuous function.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §5.2, (5.2.3) and Proposition 5.10, pp. 1134–1135 — BDP's construction for N⁻ = 1.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), Published §2.6, p. 342 (preprint p. 13 uses O[[Γ]]) — Published coefficient ring; supersedes the preprint O[[Γ]] in this citation.
### The BDP function is the square of the toric square-root distribution

Node: `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`. Kind: comparison.

Assume N⁻ = 1 in bdp-p-adic-l-function, so the Heegner hypothesis holds with N⁺ = N. Let ψ₀ be an anticyclotomic Hecke character of infinity type (1, −1) whose conductor is a power of p (Castella–Hsieh's c_o = 1, so that ψ₀φ is unramified outside p like the characters of Γ), and L_{p,ψ₀}(f) the Castella–Hsieh measure on Γ̃ = Gal(K_{p^∞}/K), the F = ℚ, n⁻ = 1 specialisation of AutomorphicPadicLFunctions L3h's Hsieh distribution. For every p-adic avatar φ̂ of an anticyclotomic character of infinity type (m, −m), m ≥ 0, and p-power conductor, (L_{p,ψ₀}(f)(φ̂) / Ω_p^{2+2m})² = L^alg(1/2, π_K ⊗ ψ₀φ) · e_p(f, ψ₀φ) · φ(𝔑^{-1}) · 2^{#A(ψ₀)+3} ε(f) u_K² √D_K (Castella–Hsieh Prop. 3.8 with c_o = 1). Comparing with JSW (5.1.a), the restriction of L_p(f) to the characters of Γ equals L_{p,ψ₀}(f)², transported to Γ by twisting by ψ̂₀^{-1}, times an explicit unit of Λ_R, whose character evaluations include the character-dependent factor φ(𝔑^{-1}) and the scalar factors t_K, w_K, u_K, ε(f) and 2; the existence and integrality of this comparison unit require the normalization check recorded below. Consequently: L_p(f) is a square in Λ_R up to a unit; its μ-invariant is even and its λ-invariant is even; and the value at the BDP point is the square of an element linear in the Heegner-point logarithm. The square-root distribution, not L_p(f), is what BCGS's 'L_BDP' denotes.

Hypotheses:

- N⁻ = 1, i.e. no inert prime divides N; Castella–Hsieh's (Heeg′) then requires their N_f⁻ (the part of N at non-split primes, here the ramified ones) to be squarefree; for N⁻ > 1 Hsieh's GL₂ toric period vanishes because the type-two characters need B ramified at the inert primes of N⁻ (Saito–Tunnell), and Brooks's quaternionic construction replaces it.
- The comparison is an identity of measures, proved on the Zariski-dense set of characters where both interpolation formulas hold.
- Even μ and λ conclusions apply to a nonzero power series, with μ and λ defined over the specified complete discrete valuation ring. For μ the twisted root must have coefficients in R: take L large enough to contain the values of ψ̂₀ (λ-parity holds regardless).
- Castella–Hsieh Proposition 3.8 assumes (ST) and (c_o,pN⁺)=1 as well as (Heeg′); (ST) is vacuous when (N, D_K) = 1; otherwise ψ₀ (with c_o = 1) must be chosen to satisfy it, and that choice is part of the normalization gap. The comparison unit is a target subject to the explicit normalization gap, not a certified supplier export.

Proof or construction:

1. By construction (bdp-p-adic-l-function, step 3) L_p(f) = u·g², where g is the image in Λ_R(Γ) of the twisted L3h root and u ∈ Λ_R^× is the unit fixed there by comparing Castella–Hsieh Proposition 3.8 with the right side of (5.1.a) at ψ ∈ Σ_cc, n ≡ 0 mod (p − 1); the next two steps record that comparison, and nothing here re-derives (5.1.a) from the identity.
2. At such ψ pass between JSW's ψ^alg (with χ^{-1} = ψ^alg |·|_{𝔸_K}, JSW Remark 5.1.1(b)) and Castella–Hsieh's ψ₀φ of infinity type (1 + m, −1 − m), and compare the constants of JSW (5.1.a) with those of Castella–Hsieh Proposition 3.8 (both come from the explicit Waldspurger formula of Hsieh Theorem 3.14).
3. The character-dependent factor φ(𝔑^{-1}) must be represented by a group-like unit of Λ_R after the character/twist transport; it is not a fixed scalar in R. Compute the remaining scalar ratio and prove it lies in R^× before deducing equality up to a Λ_R-unit. This calculation is still a gap.

Acceptance:

- Square versus square root: at a simple zero of the square-root distribution L_p(f) has a double zero; a wrong identification would make the λ-invariant odd.
- BCGS/HE.8b check: char(X_Gr) Λ^ur = (L_BDP)² with L_BDP the square-root distribution, i.e. the characteristic ideal is generated by L_p(f) itself up to a unit.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`
- `AutomorphicPadicLFunctions:L3h`
- `AutomorphicPadicLFunctions:L0`
- `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`
- `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`
- `PadicMeasuresIwasawaAlgebras:L1`
- `PadicMeasuresIwasawaAlgebras:L4`

Source locators:

- [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §3.3, Definition 3.7, p. 13 — The square-root measure.
- [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §3.3, Proposition 3.8, p. 13 — The square interpolates the central values.
### Brooks's quaternionic p-adic L-function

Node: `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`. Kind: construction. Planet: **Brooks's quaternionic p-adic L-function**.

Assume (gen-H) with N⁻ > 1, (good) and (split). Let X = X_{N⁺,N⁻} be the Shimura curve of false elliptic curves with K-level structure, f_B the Jacquet–Langlands form of f normalised as in petersson-norm-ratio, A a false elliptic curve with normalised CM by O_K and level structure t, ω a nonvanishing invariant differential defined over the Hilbert class field, Ω ∈ ℂ^× and Ω_p ∈ ℂ_p^× its complex and Serre–Tate p-adic periods. For a central critical character χ of type two (infinity type (k + j, −j), j ≥ 0, k = 2) put L_p(f, χ) = Ω_p^{2(k+2j)} (1 − χ^{-1}(p̄) a_p + χ^{-2}(p̄) ε_f(p) p^{k−1})² L^alg(f, χ^{-1}, 0), where L^alg(f, χ^{-1}, 0) = α(f, f_GL2)^{-1} W(f, χ)^{-1} C(f, χ) L(f, χ^{-1}, 0) / Ω^{2(k+2j)}. Then L_p(f, χ) = (Σ_{[a] ∈ Cl(O_K)} χ_j^{-1}(a) · θ^j f_B^♭(a ⋆ (A, t, ω̂)))², where θ is the Atkin–Serre operator in Serre–Tate coordinates, χ_j is the character of infinity type (k + 2j, 0) with χ_j^{-1}(a) = χ^{-1}(a)Na^{-j} (Brooks Proposition 8.5), and f_B^♭ = f_B|(VU − UV) the p-depletion; the function χ ↦ L_p(f, χ) extends continuously to the completion Σ̂_cc, and, after the explicit normalization recorded below (including JSW's power of 2, t_K, which Burungale attributes to the sum (5.8)), is given by a measure in Λ_R satisfying JSW (5.1.a). Construct the bounded measure first: at each ordinary CM point the integral Serre–Tate expansion of f_B^♭ is the Amice transform of a Z_p-measure with binomial moments binom(d,m)f_B^♭ evaluated at that point (Burungale Lemma 5.5). The p-depleted local measure is supported on ℤ_p^×; Burungale's Lemma 5.5 places it in 1 + pℤ_p, which matches after the Teichmüller folding of his (5.12). Twist it by the local component at v of the fixed type-two base character, which shifts the moment index by one (x ↦ x^{-1} in JSW’s normalisation of the reciprocity chart; with the inverse chart, compose with inversion), and push it forward along the fixed reciprocity chart to Γ, which is trivial on μ_{p−1} and so performs that folding. At a Γ-character of weight n with (p − 1) | n the twisted, folded moment is θ^j f_B^♭ with j = n − 1; without the twist it would be θ^n f_B^♭, and the right values would occur only for n ≡ 1 mod (p − 1). Then translate by the ideal-class Artin elements, and sum with the fixed tame-character weights as in (5.8). Squaring this linear root gives the central-value function. The series prototype takes these integral local Amice transforms as inputs; their geometric construction is supplied by R18.2/L3 and the moment-measure equivalence by PadicMeasuresIwasawaAlgebras L1. Normalization between Burungale’s tame branch and Brooks’s χ-family is required explicitly, rather than inferred from continuity.

Hypotheses:

- k = 2 and trivial nebentypus; χ ranges over type-two central critical characters, where the sign of L(f, χ^{-1}, s) is +1 (an even number of primes divide N⁻).
- The Serre–Tate period Ω_p depends on a basis of the Tate module of the reduction of A; changing it by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^{2(k+2j)}.
- That the continuous function is a measure is Burungale's refinement (JSW Remark 5.1.1(c)); its integral structure is part of this construction. Burungale states §5.2 under his (H1)–(H3) (N squarefree and prime to D_K); for ramified primes in N⁺ the local moment construction must be re-checked.

Proof or construction:

1. Import the p-integral differential and its ordinary-CM Serre–Tate expansion from R17.3/R18.2/L3; p-depletion makes the local measure supported on ℤ_p^× (Burungale's Lemma 5.5 places it in 1 + pℤ_p, which matches after the Teichmüller folding of his (5.12)).
2. Use the integral binomial-moment/Amice correspondence from PadicMeasuresIwasawaAlgebras L1 to obtain each bounded local measure.
3. Twist each local measure by the local component of the fixed type-two base character (a shift of the moment index by one), push forward along the fixed reciprocity chart (which folds the Teichmüller classes), translate by ideal-class elements, and take the finite weighted sum (Burungale (5.8)); convolution-square produces a bounded central-value measure. This construction precedes interpolation.
4. Evaluate moments at algebraic characters and identify θ^j f_B^♭. Brooks Propositions 8.5–8.9 and the CM comparison give the displayed squared Waldspurger interpolation.
5. Brooks Proposition 8.10 then supplies the continuity comparison on the completed tame family. It is a consequence/comparison, not the boundedness argument.
6. Transport the fixed tame branch to Γ using L0; specify the period and constant normalization in the comparison gap. Do not assume that a character of Pic(O_c) factors through Γ.
7. Translation by a group-like series is an R-linear operation on Amice transforms, not a unital algebra endomorphism. Scalar linearity gives quadratic scaling of the convolution square.

Consumer uses:

- JSW §5.1 — the existence of L_p(f) ∈ Λ_R with (5.1.a) when N⁻ > 1
- Brooks Propositions 8.12–8.13 — its value at the BDP point is the square of a logarithm
- RankZeroOneBSD:BSD.6a — the quaternionic logarithm comparison of the JSW branch

Planning API:

- `TauCeti.GrossZagier.quaternionicBDP` (constructor): The convolution square of the translated finite sum of integral CM moment measures, represented in R⟦T⟧; supplied geometric CM transforms are inputs, not arbitrary scalar CM values.
- `TauCeti.GrossZagier.quaternionicBDP_eq_sq_sum` (characterisation): L_p(f, χ) = (Σ_{[a]} χ_j^{-1}(a) θ^j f_B^♭(a ⋆ (A, t, ω̂)))² (Brooks Proposition 8.9).
- `TauCeti.GrossZagier.quaternionicBDP_continuous` (other): χ ↦ L_p(f, χ) extends continuously to Σ̂_cc (Brooks Proposition 8.10).
- `TauCeti.GrossZagier.quaternionicBDP_period` (relation): Changing Ω_p by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^{2(k+2j)}.
- `TauCeti.GrossZagier.quaternionicBDP_measure` (compatibility): The integral local transforms define bounded measures via Amice; transport and finite sum commute with character integration, and convolution-square evaluates to the squared CM sum. The geometric moment identity and tame/Γ normalization are separate requested inputs.
- `TauCeti.GrossZagier.quaternionicBDP_congr` (extensionality): Pointwise equality of the whole local CM Amice series yields equality of the squared measures; equality only at the trivial character is insufficient.
- `TauCeti.GrossZagier.quaternionicRoot` (data): The linear series Σ_a C(weight(a))·translate_a(CMSeries_a), with CMSeries_a the integral Amice transform and translate_a the transported reciprocity action.

Unit tests:

- `TauCeti.GrossZagier.quaternionicBDP_sq_sum_one_class` (computation): For class number one the sum has one term, so L_p(f, χ) = (θ^j f_B^♭(A, t, ω̂))².
- `TauCeti.GrossZagier.quaternionicBDP_zero_form` (degenerate): For f_B = 0 the function is identically zero (the construction is quadratic in f_B).
- `TauCeti.GrossZagier.quaternionicBDP_scale` (characterisation): Replacing every local CM Amice transform by c times that transform multiplies the squared measure by c². For real c=2 the Petersson ratio is divided by 4, so both sides of the interpolation formula are multiplied by 4.
- `TauCeti.GrossZagier.quaternionicBDP_is_square` (non-example): The value is a square in R; the unsquared CM sum (the square-root convention) is a different object, which scales by c rather than c² when f_B is replaced by c f_B.

Acceptance:

- For N⁻ = 1 the same construction with q-expansions is BDP §5.2, so the two agree on overlapping data.
- Changing the trivialisation of the formal group by a ∈ ℤ_p^× multiplies L_p(f, χ) by a^{2(k+2j)} (BDP Remark 5.8).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`
- `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`
- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `AutomorphicPadicLFunctions:L3`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3`
- `HilbertModularVarietiesAndShimuraCurves:R18.2`
- `PadicMeasuresIwasawaAlgebras:L1`
- `AutomorphicPadicLFunctions:L0`
- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`
- `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`
- `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`
- `mathlib:AbstractMeasure.amiceTransform`
- `mathlib:AbstractMeasure.injective_amiceTransform`
- `mathlib:AbstractMeasure.amiceTransformEquiv`
- `PadicMeasuresIwasawaAlgebras:L2`

Source locators:

- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.4, definition before Proposition 8.9, p. 4237 — The definition.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.5, Proposition 8.10, p. 4237 — Continuity.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1, p. 31 — The measure in the quaternionic case.
- [On the non-triviality of generalised Heegner cycles modulo p, II: Shimura curves](https://arxiv.org/abs/1504.02342v1), §5.2 pp.27–29, Lemma 5.5 and (5.8) — Integral Serre–Tate moments, support and translated sum: actual boundedness construction.
### The Waldspurger formula at CM points of X_{N⁺,N⁻}

Node: `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`. Kind: theorem.

Let χ be an unramified Hecke character of K of infinity type (k + j, −j), j ≥ 0, whose central character is the nebentypus of f, and let (A, P, ω_ℂ) be the CM triple supplied independently by R18.1, HE.1 and the CM-period interface L3. Then C(f, χ) L(f, χ^{-1}, 0) = α(f, f_GL2) W(f, χ) (Σ_{a ∈ Cl(O_K)} χ^{-1}(a) Na^{-j} (Θ^j_∞ f_B)(a ⋆ (A, P, ω_ℂ)))², with C(f, χ) = ¼ π^{k+2j−1} Γ(j + 1) Γ(k + j) w_K |d_K|^{1/2} 2^{#S_f} ∏_{ℓ | N⁻} (ℓ − 1)/(ℓ + 1), S_f the primes ramified in K dividing N⁺ but not the conductor of the nebentypus, and W(f, χ) of absolute value one. Consequently L^alg(f, χ^{-1}, 0) is algebraic and equals the square of the CM sum of Θ^j_∞ f_B at the algebraic triple (A, t, ω) (Brooks Proposition 8.7).

Hypotheses:

- χ unramified, of type two; N⁻ a squarefree product of an even, nonzero number of inert primes; each prime dividing (N, d_K) divides N exactly once (Brooks §2.1). The local computations cited (BDP §4) assume d_K odd (BDP Remark 4.7); for even d_K the exact power of 2 in C(f, χ) is not covered by the cited proofs.
- The complex conjugation on CM triples is compared with an Atkin–Lehner involution (Brooks Propositions 8.3–8.5) to replace |·|² by a square; W(f, χ) records that comparison.

Proof or construction:

1. Obtain the algebraic CM triple and complex period before constructing a p-adic measure. This identity provides the analytic input to that construction and does not use its output.
2. Brooks Theorem 8.2: the explicit Waldspurger formula of Prasanna [31, Theorem 3.2] with BDP's local computations (BDP §4), for the toric period of Θ^j_∞ f on B^× (GZ.5 supplies Waldspurger's formula; this node is its specialisation at Maass–Shimura derivatives).
3. Brooks Proposition 8.3 and Lemma 8.4: complex conjugation of a CM triple is b ⋆ w_N applied to a rescaled triple; f^ρ ∘ w_N = W_f f.
4. Sum over Cl(O_K) to obtain Proposition 8.5, then divide by Ω^{2(k+2j)} (Proposition 8.7).

Acceptance:

- For N⁻ = 1 this is BDP Theorem 5.4 (with α = 1).
- Absolute values: |W(f, χ)| = 1, so the formula is consistent with the positivity of L(f, χ^{-1}, 0) up to the square.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`
- `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`
- `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`
- `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`
- `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
- `AutomorphicPadicLFunctions:L3`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `HilbertModularVarietiesAndShimuraCurves:R18.2`
- `GrossZagierAndArithmeticHeights:GZ.5`
- `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`

Source locators:

- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.2, Theorem 8.2, p. 4232 — The Waldspurger-type formula.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.3, Proposition 8.5, p. 4235 — The squared form.
### The Euler factor at the BDP point

Node: `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`. Kind: lemma.

For a weight-two newform f with trivial nebentypus and p ∤ N, E_p(f) = 1 − a_p/p + 1/p = (1 + p − a_p)/p is nonzero, by |σ(a_p)| ≤ 2√p < p + 1 for each complex embedding. For an elliptic curve E/ℚ with good reduction at p, E_p(E) = #Ẽ(𝔽_p)/p. For elliptic curves and p ≥ 7 its p-adic valuation is 0 if a_p = 1 and −1 otherwise. At p = 5 it is 0 when a₅ = 1 or −4, and −1 otherwise; no such rational-integer dichotomy is asserted for a general Hecke field. For general f, ∏_σ (1 + p − σ(a_p)) = #Ã_f(𝔽_p) ≥ 1. For a finite-order χ prime to p the twisted factor is 1 − χ^{-1}(p̄) a_p/p + χ^{-2}(p̄)/p, obtained from Brooks/BDP at χ′ = χN of infinity type (1, 1), where χ′(p̄) = pχ(p̄).

Hypotheses:

- p ∤ N, so f has good reduction at p and ε_f(p) = 1.
- The Hasse bound |a_p| ≤ 2√p for elliptic curves (EllipticCurves Layer 3) and the Ramanujan–Petersson bound for weight-two newforms (AutomorphicGaloisRepresentations R19.1) give |a_p| < p + 1.

Proof or construction:

1. 1 + p − a_p = #Ẽ(𝔽_p) ≥ 1 for E (the identity is a point), or > 0 by |a_p| ≤ 2√p < p + 1.
2. For elliptic curves and p ≥ 7, 1 ≤ #Ẽ(𝔽_p) ≤ p + 1 + 2√p < 2p. Hence divisibility by p occurs exactly at #Ẽ = p, and gives valuation zero. At p = 5 Hasse permits #Ẽ = 10 as well as 5; these correspond to a₅ = −4 and 1. Otherwise the numerator is prime to p and E_p has valuation −1.
3. The χ-twisted factor is the specialisation of Brooks's (1 − χ^{-1}(p̄) a_p + χ^{-2}(p̄) ε_f(p) p) at a character of infinity type (1, 1), divided by the norm.

Acceptance:

- 11a1, p = 5 (split in ℚ(√−19)): a₅ = 1, E_p = 1, a unit — p = 5 is anomalous for 11a1.
- 11a1, p = 23 (split in ℚ(√−19), since −19 ≡ 2² mod 23): a₂₃ = −1, so E_p = 25/23 has valuation −1.
- Supersingular p (a_p = 0): E_p = (1 + p)/p, never zero.
- Counterexample to the original p ≥ 5 dichotomy: y² = x³ + 3x over 𝔽₅ has affine point counts 1, 2, 2, 2, 2 for x = 0,1,2,3,4 and the point at infinity, so #E = 10, a₅ = −4, E₅ = 2 and v₅(E₅) = 0.

Direct prerequisites:

- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`
- `AutomorphicGaloisRepresentations:R19.1`

Source locators:

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, Proposition 5.1.6, p. 34 — The Euler factor at the BDP point.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.6, Proposition 8.12, p. 4239 — The χ-twisted factor in weight two.
### In weight two the p-adic Abel–Jacobi map is the formal logarithm

Node: `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`. Kind: lemma.

Let C be X₀(N), X₁(N), X_{N⁺,N⁻} or Brooks's cover ℍ/Γ_{1,N⁺} of it, over a finite extension F_𝔭 of ℚ_p with p ∤ N, J its Jacobian, and ε_f the Hecke projector with ε_f Fil¹H_dR^1(C/F) = F ω_f (after choosing a coefficient field containing the eigenvalues; the full ε_f H¹_dR has dimension two). For a degree-zero divisor D on C over F_𝔭 (for instance ε_f Δ₀ for an arbitrary divisor Δ₀, which is automatically homologically trivial), the p-adic Abel–Jacobi image AJ_p(D)(ω_f) equals log_{ω_f}([D]), where for ω ∈ H⁰(J, Ω¹) = Fil¹H¹_dR the map log_ω : J(F_𝔭) → F_𝔭 is the unique locally analytic homomorphism with d log_ω = ω. On BDP's curve X₁(N) with D = ε_f(Δ_φ − ∞) this is the r = 0 case of BDP's Abel–Jacobi map (its image on X₀(N) is obtained by pushforward along X₁(N) → X₀(N), which pulls ω_f back to ω_f); a choice of base point changes AJ on C(F_𝔭) but not on Pic⁰(C).

Hypotheses:

- Good reduction of C at p (p ∤ N); for X_{N⁺,N⁻} the smooth model over ℤ_(p) of R18.2.
- r = 0: the generalized Kuga–Sato variety is C itself and the de Rham target is (S₂ ⊗ F)^∨ = (Fil¹H¹_dR)^∨.
- The coefficient field contains the chosen Hecke eigenvalues and the logarithm is locally analytic. Only the Fil¹ eigenspace is a line.

Proof or construction:

1. For r = 0 the p-adic Abel–Jacobi map CH¹(C)₀ → (Fil¹ H¹_dR(C/F))^∨ is given by Coleman integration of holomorphic differentials (BDP §3; Brooks §7.1), and the Coleman integral of a holomorphic form along a degree-zero divisor is the logarithm of the formal group of J evaluated on its class (EffectiveDiophantineMethods ED.4/coleman-abelian-comparison and ED.4/abelian-integral; Brooks §6.4).
2. Hecke-equivariance: the projector ε_f acts compatibly on divisors and on differentials, and log_{ω_f}(ε_f x) = log_{ω_f}(x) since ε_f^* ω_f = ω_f (Brooks Lemma 7.5).

Acceptance:

- Base-point independence: two Abel–Jacobi maps C → J differing by a translation give the same value on degree-zero divisors.
- Cusps are Eisenstein: replacing ∞ by another cusp changes D by a torsion class (Manin–Drinfeld), which log kills.

Direct prerequisites:

- `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`
- `EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison`
- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `mathlib:Module.Dual`
- `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`
- `EffectiveDiophantineMethods:ED.4/abelian-integral`

Source locators:

- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §6.4, p. 4224 — The identification.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §7, Lemma 7.5, p. 4229 — The projector does not change the value.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), Remark 2.6 and Proposition 2.7, published p. 1063 — The weight-two cycle.
### The BDP p-adic Gross–Zagier formula in weight two

Node: `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`. Kind: theorem. Planet: **BDP p-adic Gross–Zagier formula**.

Let f ∈ S₂(Γ₀(N)) be a newform, K of odd discriminant satisfying the Heegner hypothesis in the strong form 'every prime of N splits' (BDP's Assumption 1.9 only needs a cyclic ideal of norm N), c odd and prime to N d_K, p ∤ Nc split in K, and χ a finite-order character of Pic(O_c), viewed as the central critical character χN of infinity type (1, 1) in Σ_cc^{(1)}(𝔑). Let P_a ∈ X₀(N)(H_c) be the image of BDP's CM point a ⋆ (C/O_c, t₀), i.e. the HE.1 pair attached to a^{-1}, C/a^{-1} → C/a^{-1}𝔑_c^{-1} (BDP (1.4.7)–(1.4.8), p.1054, and §5.1, p.1127); with HE.1's own indexing C/a → C/a𝔑_c^{-1} the sum below carries χ(a) in place of χ^{-1}(a). Let ω_f be the differential of f. Use BDP’s continuous p-adic L-function on the completed central-critical character family with fixed tame conductor c and finite type (c, 𝔑, 1), rather than evaluating the Γ-only measure at an arbitrary character of Pic(O_c). For this BDP function, L_p(f, χN) = (1 − χ^{-1}(p̄) a_p p^{-1} + χ^{-2}(p̄) p^{-1})² · (Σ_{[a] ∈ Pic(O_c)} χ^{-1}(a) log_{ω_f}([P_a − ∞]))². For χ = 1 and c = 1 this reads L_p(f, 1) = ((1 + p − a_p)/p)² · log_{ω_f}(P_K)², with P_K = Σ_σ [P^σ − ∞] = the trace Heegner divisor class on J₀(N), and equivalently log_ω(P_K(f))² for the point P_K(f) on A_f with φ^*ω = ω_f.

Hypotheses:

- BDP Assumption 5.12 at k = 2: D_K odd, Heegner hypothesis, c odd prime to N d_K, p split and prime to Nc. Also require the finite local signs ε_q(f,χ⁻¹)=+1 at every finite q, condition (4) of Assumption 5.12 (automatic here: with every prime of N split, (N, d_K) = 1 and BDP's exceptional set S(f) is empty, pp.1093–1094); the fixed finite type satisfies its central-critical compatibility.
- The value is at a character outside the range of interpolation; L(f, χ^{-1}, 0) vanishes there, and the formula is a special value, not a derivative.
- This is not a p-adic height formula: it involves the logarithm (Abel–Jacobi image), not the cyclotomic p-adic height of Perrin-Riou.
- The identification of the c = 1 trivial-character value with JSW’s Γ-measure uses a character, period and normalization transport. For general c the tame branch is extra data; χ need not factor through Γ.
- P_a is built from HE.1/cm-cyclic-isogeny-pair, which assumes D_K ∉ {−3, −4}; for D_K = −3 the Heegner point is requested from HeegnerPointEulerSystems HE.1.

Proof or construction:

1. Import BDP Theorem 5.13 at r = j = 0 from GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula (stated there under all five clauses of Assumption 5.12): L_p(f, χ') = E(f, χ')² (Σ χ'^{-1}(a) N(a) AJ_F(Δ_{φ_aφ_0})(ω_f))² for χ' of infinity type (1, 1), with c^0/0! = 1 and Ω_p^0 = 1.
2. For r = 0 the cycle attached to φ_a φ_0 is the CM point P_a corrected by a cusp on BDP's curve X₁(N), and AJ_F(P_a − ∞)(ω_f) = log_{ω_f}([P_a − ∞]) (weight-two-abel-jacobi-is-logarithm); push forward along X₁(N) → X₀(N), which pulls ω_f back to ω_f, using isogeny-and-differential-compatibility (a).
3. Rewrite χ^{-1}(a)N(a) for the character χN of infinity type (1, 1) as the finite-order χ^{-1}(a), and the Euler factor at χN as in euler-factor-at-bdp-point.
4. For χ = 1 and c = 1 the sum over Pic(O_K) is the Galois trace; through the quotient φ : J₀(N) → A_f with φ^*ω = ω_f, log_{ω_f}(Q) = log_ω(φ(Q)) (isogeny-and-differential-compatibility).

Acceptance:

- Skinner Proposition 2.6.1, Case I: L_p^S(f, 1) ≐ (log_ω P_K(f))², with the Euler factors at S removed.
- Class number one, unit group of order 2: BDP's introduction reduces the formula to L_p(f, 1) = ((1 + p − a_p)/p)² log_{ω_f}(P_A − ∞)².
- A non-example: replacing the logarithm by the p-adic height of P_K gives Perrin-Riou's formula for the cyclotomic derivative, a different statement.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`
- `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`
- `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`
- `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula`
- `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`
- `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`
- `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`
- `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`
- `AutomorphicPadicLFunctions:L0`
- `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`
- `HeegnerPointEulerSystems:HE.1`

Source locators:

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), §5.3, Theorem 5.13, p. 1137 — The general theorem, imported from GH at r = j = 0.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), Introduction, p. 1038 — The weight-two case.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, Proposition 2.6.1, p. 14 — The trace-point form.
### The quaternionic weight-two formula of Brooks and JSW

Node: `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`. Kind: theorem. Planet: **Brooks's p-adic Gross–Zagier formula**.

Assume p odd, (gen-H) with N⁻ > 1, (-free) N squarefree, (good) and (split). Let X* = X_{N⁺,N⁻}, ℓ₀ ∤ pN a prime split in K with 1 − a_{ℓ₀} + ℓ₀ ≠ 0, ι_{N⁺,N⁻}(x) = (T_{ℓ₀} − ℓ₀ − 1)[x], and x_K^{N⁺,N⁻} ∈ J(X*)(K) the Heegner point of JSW §4.3. Then L_p(f, 1) = (1 − a_{ℓ₀} + ℓ₀)^{-2} · ((1 + p − a_p)/p)² · log_{ω_f}(x_K^{N⁺,N⁻})² up to a p-adic unit, where log_{ω_f} : J(X*)(K_v) ⊗ O → K_v is the logarithm with d log_{ω_f} = ω_f for the O-basis ω_f attached to f_B. Exactly (Brooks Proposition 8.13 with the square restored): for a central critical χ of infinity type (1, 1), L_p(f, χ) = (1 − χ^{-1}(p̄) a_p + χ^{-2}(p̄) ε_f(p) p)² · log_{ω'_f}(Δ'_χ)², with Δ'_χ = φ(ε_f Δ_χ) ∈ Div(C')(H) ⊗ ℚ̄ (in the eigenspace on which Gal(H/K) acts through the finite-order part χN^{-1} or its inverse; K-rational when χN^{-1} is trivial; source issue E93) on the quotient C' = ℍ/Γ_{0,N⁺} and Δ_χ = Σ_a χ^{-1}(a) N(a) P_a, the sum of the CM points a ⋆ (A, t) (Brooks prints P_χ inside the sum; source issue E4).

Hypotheses:

- (-free) and (gen-H) as in JSW Proposition 5.1.6, and p odd (Brooks §2.1); f need not be ordinary at p.
- The exact form is Brooks's; JSW's restatement is up to a p-adic unit and replaces Brooks's x̃_K = Σ_σ ε_f[x]^σ by x_K^{N⁺,N⁻}, where ε_f x_K^{N⁺,N⁻} = (a_{ℓ₀} − ℓ₀ − 1) x̃_K (JSW print the factor as 1 − a_{ℓ₀} + ℓ₀, source issue E94; the sign is irrelevant after squaring).
- Brooks prints log_{ω_f}(ε_f Δ_χ) without the square in Propositions 8.12–8.13; Theorem 8.11, from which they are deduced, and JSW's restatement have the square (source issue E2).

Proof or construction:

1. Brooks Theorem 8.11 at k = 2, j = 0: L_p(f, χ) = (Euler factor)² · (Σ χ^{-1}(a) N(a) AJ_p(Δ_a)(ω_f))², obtained from the continuity of quaternionic-bdp-construction, θ^{-1} f^♭ as the Coleman primitive (Brooks Lemma 7.3) and the Euler-factor removal of Lemma 8.6.
2. Weight two: compute with Δ_χ rather than ε_f Δ_χ (Brooks Lemma 7.5) and identify AJ_p with log_{ω_f} (weight-two-abel-jacobi-is-logarithm).
3. Descend from C to C' = ℍ/Γ_{0,N⁺} with log_{φ^*ω}(P) = log_ω(φ(P)); Shimura reciprocity shows Δ'_χ is defined over H and is Gal(H/K)-equivariant through the finite part χN^{-1}; it is K-rational when χN^{-1} = 1.
4. JSW's form: log_{ω_f} x_K^{N⁺,N⁻} = log_{ω_f} ε_f x_K^{N⁺,N⁻} = (a_{ℓ₀} − ℓ₀ − 1) log_{ω_f} x̃_K^{N⁺,N⁻}, whose square is (1 − a_{ℓ₀} + ℓ₀)² log_{ω_f}(x̃_K^{N⁺,N⁻})².

Acceptance:

- Squared logarithm: both sides are quadratic in ω_f; replacing ω_f by u ω_f multiplies the right side by u² and the left side through the normalisation of f_B by the same u², a test a non-squared version fails.
- The auxiliary ℓ₀ cancels: changing ℓ₀ multiplies log_{ω_f} x_K (equivalently ε_f x_K) by (1 − a_{ℓ₀'} + ℓ₀')/(1 − a_{ℓ₀} + ℓ₀) and the prefactor by its inverse square.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`
- `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`
- `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`
- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`
- `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`
- `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`
- `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `HilbertModularVarietiesAndShimuraCurves:R18.2`
- `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`
- `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`

Source locators:

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, Proposition 5.1.6, p. 34 — The formula used by JSW.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.6, Proposition 8.13, p. 4239 — Brooks's statement, printed without the square on the logarithm.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.5, Theorem 8.11, p. 4238 — The general-weight theorem, with the square.
### The formula for a p-optimal quotient

Node: `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`. Kind: theorem.

Assume (good) and (irred_K): the residual representation of V = V_f is irreducible over G_K. Take the quotient π : J(X*_{N⁺,N⁻}) → A_f to be (ℤ(f), 𝔭)-optimal, i.e. π = φ ∘ π₀ with π₀ an optimal quotient and φ : A₀ → A_f an isogeny such that φ(T_p A₀) ⊄ 𝔭 T_p A_f, 𝔭 the prime of ℤ(f) fixed by ι_p, and ω_{A_f} the differential of A_f with the image of the 𝔭-summand basis. Then π^*(ω_{A_f}) ∈ O^× ω_f, and with y_K = π(x_K^{N⁺,N⁻}), JSW's z_K = y_K/(a_{ℓ₀} − ℓ₀ − 1), and ℓ₀ ∤ pN split in K with 1 − a_{ℓ₀} + ℓ₀ a 𝔭-adic unit: L_p(f, 1) = ((1 + p − a_p)/p)² · log_{ω_{A_f}}(z_K)², equivalently log_{ω_{A_f}}(y_K)², up to a unit in O.

Hypotheses:

- The standing JSW §3–§5 setting includes p odd, squarefree N, (split) and (gen-H), with the curve and Hecke auxiliary prime chosen as in quaternionic-weight-two-formula; (good) and (irred_K) supplement that setting rather than replace it.
- (good) p ∤ N; (irred_K); p − 1 > 1 (p odd) for the direct-summand argument of BLR Theorem 4, p. 187.
- The choice of a 𝔭-optimal quotient and of ℓ₀ with 1 − a_{ℓ₀} + ℓ₀ ∈ O^× (possible under (irred_K)).

Proof or construction:

1. Néron models of J, A₀ and A_f are abelian schemes over ℤ_p by (good); π, π₀, φ extend.
2. π₀ optimal ⇒ π₀^* Ω¹(A₀/ℤ_p) is a direct summand of Ω¹(J/ℤ_p) (BLR, since p − 1 > 1).
3. Ω¹(A_f/ℤ_p) ⊗ O/p = Lie_{𝔽_p}(A_f[p]⁰)^∨ ⊗ O/p; T_p A₀ → T_p A_f not landing in 𝔭 T_p A_f and irreducibility give A₀[p] ↠ A_f[𝔭^{e_𝔭}], hence injectivity on cotangent spaces, so φ^*ω_{A_f} is part of an O-basis.
4. Substitute log_{π^*ω}(x) = log_ω(π(x)) into quaternionic-weight-two-formula.

Acceptance:

- Without (irred_K) the optimal-quotient differential can fail to be a unit multiple of ω_f, and the formula holds only up to the index of φ^*ω_{A_f} — a test that a version dropping the hypothesis fails.
- For the analogous N⁻ = 1 statement (cotangent argument unchanged; formula from bdp-weight-two-heegner-formula) and E optimal, π^*ω_E = c_E ω_f with the Manin constant c_E; the statement says c_E is a p-adic unit under these hypotheses, consistent with the known results for p odd.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`
- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`
- `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`
- `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`
- `HilbertModularVarietiesAndShimuraCurves:R18.2`
- `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`
- `NeronModelsAndSemistableAbelianVarieties:R11.1`
- `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`
- `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`

Source locators:

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, Proposition 5.1.7, p. 34 — The p-optimal form.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, proof of Proposition 5.1.7, pp. 34–35 — The proof strategy.
### The formal logarithm detects non-torsion Heegner points

Node: `GrossZagierAndArithmeticHeights:GZ.9/logarithm-detects-heegner-point`. Kind: theorem.

Let A be an abelian variety over K with good reduction at v | p, K_v = ℚ_p, and ω a nonzero invariant differential. (a) For an elliptic curve E (dim 1), log_ω(P) ≠ 0 if and only if P ∈ E(K) has infinite order: log_E : E(K_v) → K_v has kernel the torsion subgroup and E(K) ⊂ E(K_v). (b) For A of strict GL(2)-type with M = End⁰(A) a field of degree dim A having a real embedding and ω an M-eigendifferential, the same equivalence holds for actual points by eigenlogarithm-nonvanishing; it is not a consequence of freeness of A(K) ⊗ ℚ_p over M ⊗ ℚ_p, since log_A(P) ≠ 0 only says that some eigencomponent is nonzero. Consequently, under the hypotheses of bdp-weight-two-heegner-formula (resp. quaternionic-weight-two-formula), P_K(f) ≠ 0 if and only if L_p(f, 1) ≠ 0. A nonzero Selmer class whose localisation at v vanishes has Bloch–Kato logarithm zero; the equivalence is for the Kummer classes of global points only.

Hypotheses:

- Lie(A) is free of rank one over M ⊗ K_v (strict GL(2)-type), so A(K_v) ⊗ ℚ is free of rank one over M ⊗ ℚ_p.
- E_p(f) ≠ 0 (euler-factor-at-bdp-point) and 1 − a_{ℓ₀} + ℓ₀ ≠ 0 are needed to pass from the logarithm to L_p(f, 1).
- Part (b) needs the real-embedding hypothesis of BSW Theorem 1.1 and an actual algebraic point. Strict GL(2)-type alone does not include this hypothesis.

Proof or construction:

1. The logarithm of the commutative p-adic Lie group A(K_v) is a homomorphism with kernel the torsion subgroup and is an isomorphism A(K_v) ⊗ ℚ → Lie(A/K_v) (EffectiveDiophantineMethods ED.4/abelian-logarithm); A(K) ⊂ A(K_v).
2. dim 1: Lie(E/K_v) is one-dimensional and ω ≠ 0 identifies it with K_v, so log_ω(P) = 0 iff log_E(P) = 0 iff P is torsion.
3. GL(2)-type: use eigenlogarithm-nonvanishing for the λ-eigencomponent singled out by ι_p.
4. Insert into the weight-two formulas: L_p(f, 1) is a nonzero multiple of log_ω(P_K(f))² (euler-factor-at-bdp-point).

Acceptance:

- Skinner Corollary 2.6.2: P_K(f) ≠ 0 iff L^S_𝔭(f, 1) ≠ 0, with the eigencomponent input of eigenlogarithm-nonvanishing (PAPER-SKINNER-20/E6).
- Non-example: for M = ℚ(√5) and a point P with log_A(P) ≠ 0, the projection of log_A(P) to one λ-eigenline can a priori vanish; excluding this needs transcendence, not linear algebra.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`
- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`
- `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`
- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`
- `mathlib:FormalGroup`
- `GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing`

Source locators:

- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, Corollary 2.6.2, p. 14 — The detection statement.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, after Proposition 2.6.1, p. 14 — The logarithm detects the point.
### Bloch–Kato logarithm of the Heegner Kummer class

Node: `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`. Kind: comparison.

Let A/K be an abelian variety with good reduction at v | p, V = V_p A, and κ : A(K) → H¹_f(K, V) the Kummer map (HE.3). Then loc_v κ(P) lies in H¹_f(K_v, V) = H¹_e(K_v, V) (D_cris(V)^{φ=1} = 0 by purity), and under D_dR(V)/Fil⁰ D_dR(V) ≅ Lie(A/K_v) the Bloch–Kato logarithm of loc_v κ(P) is the formal logarithm log_A(P). Hence for an invariant differential ω ∈ H⁰(A, Ω¹) ⊗ K_v, viewed in Fil⁰ D_dR(V^*(1)), the dual of D_dR(V)/Fil⁰ ≅ Lie(A/K_v), ⟨log_BK loc_v κ(P_K(f)), ω⟩ = log_ω(P_K(f)) for ω ∈ H⁰(A_f, Ω¹) ⊗ M_f with φ^*ω = ω_f, and the BDP-point formulas may be written L_p(f, 1) = E_p(f)² ⟨log_BK loc_v κ(P_K(f)), ω⟩² with the exact differential normalisation of the formula used.

Hypotheses:

- Good reduction at v; V_p A crystalline, with crystalline Frobenius eigenvalues α/p, |α| = √p (weight −1; none equals 1, so H¹_e = H¹_f).
- The identification D_dR(V_p A)/Fil⁰ ≅ Lie(A) ⊗ K_v and the pairing with differentials use the de Rham comparison (PadicHodgeRegulators L0–L1); the sign convention of log_BK as the inverse of exp_BK is the one fixed there.
- V_f is the λ-summand of V_p(A_f), not its cohomological dual; the geometric L-function in JSW is that of V_f^∨⊗ψ. Identify D_dR(V_f)/Fil⁰ with Lie(A_f)_λ and its dual differential pairing with Fil⁰D_dR(V_f^*(1)) by the supplied comparison conventions. Purity for the Tate module has weight −1, so Frobenius eigenvalues cannot equal 1; dual H¹ has weight +1.

Proof or construction:

1. The Kummer image of A(K_v) ⊗ ℚ_p is H¹_f(K_v, V) (Bloch–Kato, Example 3.10.1), and the Bloch–Kato exponential Lie(A) ⊗ K_v → H¹(K_v, V) is the composite of the exponential of the formal group with the Kummer map (PadicHodgeRegulators L1).
2. Invert: log_BK ∘ loc_v ∘ κ = log_A on A(K_v) ⊗ ℚ.
3. Pair with ω ∈ Fil⁰ D_dR(V^*(1)) (for A = A_f, the differential with φ^*ω = ω_f) through the de Rham pairing, as Castella–Hsieh §4.5 do for generalized Heegner classes.

Acceptance:

- A global Selmer class with trivial localisation at v has log_BK = 0 although it may be nonzero: logarithms detect points, not Selmer classes (logarithm-detects-heegner-point).
- Compatibility with GeneralizedHeegnerCycles GH.8's weight-two comparison: the étale Abel–Jacobi class of ε_f(P − ∞) maps to κ(P) under the modular quotient, so the same logarithm appears.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/logarithm-detects-heegner-point`
- `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`
- `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`
- `PadicHodgeRegulators:L1/abelian-variety-logarithm`
- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`
- `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`
- `PadicHodgeRegulators:L1/bloch-kato-logarithm`
- `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`

Source locators:

- [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §4.5, p. 19 — The Bloch–Kato logarithm and its domain.
- [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §4.5, Theorem 4.9, p. 20 — The logarithm of Heegner classes in the p-adic Gross–Zagier formula.
### Compatibility with isogenies, differentials and characters

Node: `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`. Kind: lemma.

(a) For a homomorphism φ : A → A' of abelian varieties over K_v and ω' ∈ H⁰(A', Ω¹), log_{φ^*ω'}(P) = log_{ω'}(φ(P)). (b) If π' = ψ ∘ π for an isogeny ψ : A_f → A' with ψ^*ω_{A'} = c_ψ ω_{A_f}, then log_{ω_{A'}}(π'(x)) = c_ψ log_{ω_{A_f}}(π(x)), so log_{ω_{A'}}(π'x)² = c_ψ² log_{ω_{A_f}}(πx)², and a BDP-point formula rewritten with log_{ω_{A'}}² gains the factor c_ψ^{-2}; for a modular parametrisation with π^*ω₀ = c_π ω_f, log_{ω₀}(π x) = c_π log_{ω_f}(x) and the squared identity gains c_π^{-2} when written with log_{ω₀}. (c) For a finite-order character χ of Pic(O_c), Galois transport of the χ-sum must transport the p-adic embedding, completion and differential as well as the points and coefficients. For σ fixing the coefficients and preserving the chosen place, the compatible local automorphism gives σ(Σ χ^{-1}(a) log_ω(P_a)) = Σ χ^{-1}(a) log_{σ ω}(P_a^σ). Complex conjugation exchanges the two places over p and cannot be applied as an automorphism commuting with one fixed local logarithm; its Fricke/character comparison remains a gap. (d) Anticyclotomic specialisation: evaluation of L_p(f) ∈ R⟦Γ⟧ at a character factoring through Γ via the projection Γ̃ → Γ commutes with the projection (pushforward) R⟦Γ̃⟧ → R⟦Γ⟧ induced by Γ̃ → Γ: (ψ∘pr)(μ) = ψ(pr_*μ).

Hypotheses:

- Logarithms are the p-adic logarithms of abelian varieties over K_v of EffectiveDiophantineMethods ED.4/abelian-logarithm.
- c_ψ, c_π are nonzero; no claim that they are p-adic units without p-optimality (p-optimal-quotient-formula).

Proof or construction:

1. (a) d(log_{ω'} ∘ φ) = φ^*ω' and both sides are homomorphisms vanishing at 0 with the same derivative, so they agree (uniqueness of the logarithm).
2. (b) apply (a) to ψ and to the parametrisation.
3. (c) The place-preserving case is functoriality under a compatible continuous isomorphism of local fields. For a global σ that changes the place, transport the embedding to ι_p ∘ σ^{-1}; the Fricke formula requires an additional precise supplier and is not proved by the cited parametrisation/degree node.
4. (d) the projection R⟦Γ̃⟧ → R⟦Γ⟧ is the ring map induced by Γ̃ → Γ and character evaluation is functorial (PadicMeasuresIwasawaAlgebras L1).

Acceptance:

- Brooks §8.6: log_{φ^*ω}(P) = log_ω(φ(P)) for the map C → C'.
- Matches GeneralizedHeegnerCycles GH.8's differential factor: replacing the Abel–Jacobi evaluation by the elliptic logarithm in a squared identity introduces c_π^{-2}, not c_π^{-1}.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`
- `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`
- `EllipticCurveModularity:R29.5/modular-parametrisation`
- `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`
- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`
- `PadicMeasuresIwasawaAlgebras:L1`
- `AutomorphicPadicLFunctions:L0`
- `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`

Source locators:

- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §8.6, before Proposition 8.13, p. 4239 — The pullback rule.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §5.1.5, p. 34 — Compatibility with the Hecke projector and the auxiliary prime.
### The weight-two formula at a multiplicative prime

Node: `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`. Kind: theorem.

Let E/ℚ be semistable of conductor N, optimal, with modular parametrisation π : X₀(N) → E, π(∞) = O, π^*ω_E = c·ω_f with c ∈ ℤ_(p)^×; let p ≥ 5 divide N exactly (multiplicative reduction, a_p = ±1), K imaginary quadratic with every prime of N split or ramified in K and p split, and L_p(f) ∈ Λ_{R₀} the anticyclotomic p-adic L-function interpolating Γ(n)Γ(n + 1)(1 − a_p p^{-1} φ(𝔭))² (𝔭 the prime above p fixed by ι_p) Ω_p^{4n} L(f/K, φ, 1)/(π^{2n+1} Ω_K^{4n}) at unramified φ of infinity type (−n, n), n > 0 (the square of the twisted Castella–Hsieh measure, extended to p | N). Then L_p(f, 1) = (1 − a_p p^{-1})² · (log_{ω_E} P_K)² up to a p-adic unit, P_K ∈ E(K) the trace Heegner point. The factor 1 − a_p p^{-1} = 1 ∓ p^{-1} is nonzero: there is no exceptional zero in this formula. The exceptional zero occurs instead for the weight-two specialisation of Howard's big Heegner points, where the family factor 1 − a_p^{-1} vanishes when a_p = 1 and Castella's derivative formula Z'_{p,f,0} = 𝓛_p(f, K) · loc_p(κ_f) carries the L-invariant 𝓛_p(f, K) = 𝓛_p(f) − log_p(ϖ_p)/ord_p(ϖ_p); that formula is a statement about Hida families and is owned by GeneralizedHeegnerCycles GH.7.

Hypotheses:

- p ∥ N, p ≥ 5, split in K; the Heegner hypothesis allows p | N because p splits.
- ε_p = 0 in Castella's Euler factor (1 − a_p p^{-1} φ(𝔭) + ε_p φ²(𝔭)) since p | N; it is p^{-1} when p ∤ N, recovering euler-factor-at-bdp-point.
- The p-adic L-function is the square of the twisted toric measure: Castella's proof writes L_p(f) := Tw_{ψ^{-1}}(L_{p,ψ}(f)) without the square, while the interpolation he states is that of the square (source issue E5).
- Castella's standing hypothesis (§2.1) that ρ̄_{E,p} is irreducible is not used by the proof of Theorem 3.2, which rests on Castella-exc. Theorems 2.10–2.11 and Bloch–Kato Example 3.10.1, and is deliberately omitted; if the supplier cannot confirm this, add it as a hypothesis.

Proof or construction:

1. Extend the BDP construction to p-new f: the p-adic multiplier becomes (1 − a_p χ^{-1}(p̄))² because β_p = 0 (Castella, Theorem 2.10).
2. Import semistable Coleman/rigid Abel–Jacobi integration from the proposed ColemanIntegration Part II. Apply Castella Theorem 2.11 pp.15–16 to the unsquared p-new root; at r=j=0 its value is (1−a_p/p) times the Heegner logarithm. Square only in the central-value adapter.
3. At r = j = 0 the cycle is [(A, A[𝔑]) − (∞)] and AJ_F(Δ)(ω_f) = log_{ω_f}(Δ) by Bloch–Kato Example 3.10.1 for the semistable Jacobian J₀(N) (Castella's proof of Theorem 3.2; the good-reduction node weight-two-abel-jacobi-is-logarithm does not apply since p | N); sum over Gal(H/K) and push to E with π^*ω_E = c ω_f (isogeny-and-differential-compatibility).

Acceptance:

- Castella's Theorem 3.2: L_p(f, 1) = (1 − a_p p^{-1} + ε_p)² (log_{ω_E} P_K)² up to a p-adic unit, uniformly for p ∤ N (ε_p = p^{-1}) and p | N (ε_p = 0).
- Split multiplicative a_p = 1: the factor is ((p − 1)/p)² = p^{-2}(p − 1)², of p-adic valuation −2 because p − 1 is a p-adic unit, and never zero; for non-split a_p = −1 it is ((p + 1)/p)², also of valuation −2. Up to a p-adic unit the formula reads L_p(f, 1) ≐ p^{-2}(log_{ω_E} P_K)².
- The L-invariant does not appear: a version of the formula containing 𝓛_p(f) is the big-Heegner-point derivative formula, not this one.

Direct prerequisites:

- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`
- `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`
- `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`
- `EllipticCurveModularity:R29.5/modular-parametrisation`
- `AutomorphicPadicLFunctions:L3h`
- `AutomorphicPadicLFunctions:L0`
- `ColemanIntegration:L1`
- `PadicHodgeRegulators:L1`
- `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`
- `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit`

Source locators:

- [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2), §3, Theorem 3.2, p. 9 — The formula, uniform in p ∤ N and p | N.
- [On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1), §2.5, Theorem 2.11, p. 15 — The semistable extension of BDP's theorem.
- [On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1), Introduction, Theorem and (0.4), pp. 2–3 — The exceptional zero belongs to the big Heegner point, with the L-invariant.
### The BDP function lies in the Iwasawa algebra

Node: `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`. Kind: theorem.

Under (sqf), (sgn), (ram), (flt), (odd) and (L-lrg) of Skinner §2 (Case I: every prime of N split or ramified in K; Case II: N = N⁺N⁻ as in quaternionic-weight-two-formula), let O^ur be the ring of integers of the completion of the maximal unramified extension of L. The imprimitive function L^S_𝔭(f), defined by BDP (Case I) and Brooks (Case II) only as a continuous function on the characters of Γ, is the evaluation map of an element of O^ur⟦Γ⟧. Its coefficients lie in O^ur; they are not known to lie in O, because the p-adic CM period Ω_p is a unit of O^ur that need not lie in L.

Hypotheses:

- The Iwasawa-algebra statement needs the interpolation at characters ramified at the primes above p: Brakočević's extension, or the constructions of Eischen–Harris–Li–Skinner and Wan (which also construct the function directly when some ℓ | N is inert or ramified in K).
- Skinner's preprint writes O⟦Γ⟧; the published version corrects this to O^ur⟦Γ⟧ (PAPER-SKINNER-20/E1).

Proof or construction:

1. Case I with N⁻ = 1: by bdp-square-root-comparison L_p(f) is a unit times the square of the image of L3h's distribution, which is a measure: Hsieh's interpolation covers characters of p-power conductor (Castella–Hsieh Proposition 3.8 for m ≥ 0 and conductor p^n), i.e. Brakočević's extension. This needs bdp-square-root-comparison in the form allowing squarefree ramified level ((Heeg′) and (ST) for a ψ₀ of p-power conductor); its comparison unit is still subject to the normalization gap.
2. Case II: Burungale §5.2 Lemma 5.5 constructs bounded local CM measures as Amice transforms of integral Serre–Tate expansions. Equation (5.8) forms their finite translated sum. Twist and push forward this linear measure, then square by convolution. Brooks Proposition 8.10 supplies a continuity statement, not a proof of boundedness. Identifying the resulting root with Brooks’s normalization and proving the comparison scalar is integral remain the stated normalization gap.
3. Remove the Euler factors at S ∖ {p} by multiplying by the elements P_w(ε^{-1}Ψ^{-1}(Frob_w)) of O⟦Γ⟧.

Acceptance:

- Without the extension to characters ramified at p a continuous function on the crystalline characters is not known to be a measure, and the Iwasawa main conjecture of Skinner §2.7 could not be formulated.
- Coefficient ring test: Ω_p ∉ L in general, so a statement with coefficients in O⟦Γ⟧ is not justified (Skinner's published text corrects the preprint's O⟦Γ⟧).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`
- `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`
- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`
- `AutomorphicPadicLFunctions:L3h`
- `PadicMeasuresIwasawaAlgebras:L1`
- `mathlib:AbstractMeasure.amiceTransform`
- `mathlib:AbstractMeasure.injective_amiceTransform`
- `PadicMeasuresIwasawaAlgebras:L2`

Source locators:

- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), Published §2.6, pp. 342–343 — The integrality statement and its sources.
- [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2), §3.3, Proposition 3.8, p. 13 — The interpolation at characters ramified at p.
- [On the non-triviality of generalised Heegner cycles modulo p, II: Shimura curves](https://arxiv.org/abs/1504.02342v1), §5.2, Lemma 5.5 and (5.8), pp.27–29 — Bounded integral local measures and translated linear sum, independent of Brooks continuity.
### Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions

Node: `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`. Kind: comparison.

For ψ crystalline of weight (−n, n), n > 0, n ≡ 0 mod (p − 1), let χ be the Hecke character with χ^{-1} = ψ^alg |Nm(·)|_ℚ. Then L^S_𝔭(f) is the imprimitive variant, with the Euler factors at the primes of S = {ℓ | pND} not dividing p removed, of BDP's L_p(f, χ) in Case I and of Brooks's L_p(f, χ) in Case II; the corresponding characters χ, of BDP/Brooks infinity type (2 + j, −j) with j = n − 1, form a subfamily of Σ^{(2)}_cc(𝔫) and Σ^{(2)}_cc(𝔫⁺) respectively; the interpolated values L(f, χ^{-1}, 0) equal L(f, ψ^alg, 1); and the constants correspond by C(f, K) = α(f, f_GL2)^{-1} and w(f, ψ) = w_K w(f, χ)^{-1}. Skinner's further identity e_∞(f, ψ) w_K (2πi)^{1+2n} = C(f, χ, 1) is false as printed (its left side is purely imaginary): the archimedean constants match only together with Skinner's Ω(ψ^alg) and a relation between his CM periods and BDP's, which is part of the normalization gap (E88). In JSW's normalisation the corresponding function, equal to it up to the explicit Λ_R-unit of the normalization gap, is L^Σ_p(f) = L_p(f) ∏_{w ∈ Σ} P_w(ε^{-1}Ψ^{-1}(Frob_w)), with JSW's (5.1.a) related to BDP and Brooks by the same substitution χ^{-1} = ψ^alg|·|_{𝔸_K}.

Hypotheses:

- Same hypotheses as bdp-measure-integrality.
- Skinner's e_p(f, ψ) = E_𝔭̄/E_𝔭 is a ratio of Euler-type factors. Because p ∈ S, his L^S also omits the Euler factors at 𝔭 and 𝔭̄, which contribute E_𝔭E_𝔭̄; so e_p·L^S = E_𝔭̄²·L^{S∖{p}}, BDP's and JSW's squared multiplier times the L-value with only the Euler factors away from p removed.

Proof or construction:

1. Match the interpolation formulas character by character: Skinner's §2.6 formula, BDP (5.2.3) with Theorem 5.5's L^alg, Brooks §8.4 with Proposition 8.7's L^alg and JSW (5.1.a).
2. Uniqueness of a measure with prescribed values on a dense set of characters (bdp-p-adic-l-function) turns the agreement of values into an identity in O^ur⟦Γ⟧.

Acceptance:

- At ψ = 1 the dictionary gives Skinner's Proposition 2.6.1 from BDP's and Brooks's formulas (bdp-weight-two-heegner-formula, quaternionic-weight-two-formula).
- Removing the Euler factor at an inert w = (ℓ) multiplies by (1 − a_ℓ ℓ^{-1} + ℓ^{-1})(1 + a_ℓ ℓ^{-1} + ℓ^{-1}), which can raise μ (JSW Remark 5.1.4).

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`
- `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`
- `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`
- `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`
- `AutomorphicPadicLFunctions:L0`

Source locators:

- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), Published §2.6, pp. 342–343 — The identification of L^S_𝔭(f) with the BDP and Brooks functions, the character sets, and the correspondence of constants.
### Heegner points have nonzero logarithm in every eigencomponent

Node: `GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing`. Kind: theorem.

Let A_f be the modular abelian variety of a weight-two newform f with Hecke field M_f (totally real) and dim A_f = [M_f : ℚ], and ω a nonzero M_f-eigendifferential (a^*ω = σ(a)ω for some σ : M_f ↪ ℚ̄); in (b), σ = ι_p|_{M_f} and log_ω is extended to A_f(K_v) ⊗ M_f through ι_p, so that the Hecke action on ω agrees with the scalar action (Skinner’s φ*ω = ω_f). For the other embeddings log_ω kills P_K(f): with M_f = ℚ(√5) the idempotent is e_f = ½(1⊗1 + ⅕√5⊗√5). (a) Every non-torsion x ∈ A_f(ℚ̄) has log_ω(x) ≠ 0; more generally, for any abelian variety A/ℚ̄ and field F ⊂ End⁰(A) with dim A = [F : ℚ] and at least one real embedding of F, every non-torsion x ∈ A(ℚ̄) has log_ω(x) ≠ 0 for every nonzero F-eigendifferential ω (Burungale–Skinner–Wan Theorem 1.1). (b) In Skinner's Cases I and II, let Q^ξ_K ∈ J(X)(K) ⊗ ℚ be the rational Hodge-divisor class, y = φ(Q^ξ_K) ∈ A_f(K) ⊗ ℚ and P_K(f) = φ(ε_f Q^ξ_K). Then log_ω P_K(f) = log_ω y, and if P_K(f) ≠ 0 then log_ω P_K(f) ≠ 0. (c) Let A₀ be an abelian variety over a totally real field L with O_F ⊂ End_L(A₀) for a totally real F of degree dim A₀ (after an L-isogeny), E ⊇ F totally real, H/K a finite abelian (e.g. ring class) extension of a finite extension K/L, y ∈ A₀(H), and ω₀ a nonzero F-eigendifferential on A₀. For a character χ : Gal(H/K) → O_E^× (necessarily ±1-valued), the χ-twisted sum Σ_τ χ(τ) log_{ω₀}(τ y) is nonzero whenever the algebraic point x = Σ τ(y) ⊗ χ(τ) on the Serre tensor abelian variety A₀⊗_{O_F}O_E is non-torsion (BSW Theorem 2.8(i)). The application to nonvanishing of L^S_𝔭(f, 1) is made in logarithm-detects-heegner-point, which depends on this node, rather than used to prove this node.

Hypotheses:

- dim A_f = [M_f : ℚ] and M_f has a real embedding: the input of the p-adic analytic subgroup theorem in BSW's form.
- The statement concerns actual algebraic points and the specific Heegner tensor P_K(f) obtained from one; it asserts nothing about an arbitrary nonzero M_f- or ℂ_p-linear tensor or an arbitrary nonzero cohomology class.
- For (b), φ is Hecke-equivariant, so P_K(f) = φ(ε_f Q^ξ_K) = e_f·(y ⊗ 1) with e_f the image of ε_f in O_f ⊗ M_f (the idempotent of multiplication M_f ⊗ M_f → M_f; e_f = 1 only if M_f = ℚ). Hence P_K(f) ≠ 0 ⇒ y ≠ 0, and since a^*ω = ι_p(a)ω for a ∈ O_f, log_ω kills (1 − e_f), so log_ω P_K(f) = log_ω y; a nonzero integral multiple of y is an actual non-torsion point. For (c), E is totally real and χ has finite order, hence its values are ±1; use the actual Serre tensor variety and point, not an arbitrary nonzero C_p-tensor.

Proof or construction:

1. Apply the eigenlogarithm theorem only to actual algebraic points: clear denominators in y ∈ A_f(K) ⊗ ℚ. The analytic subgroup input has an algebraic point as a hypothesis.
2. (a) is imported from DiophantineApproximationAndTranscendence DT.3 (BSW Theorems 1.1 and 2.3, from the p-adic analytic subgroup theorem).
3. (b) Hecke-equivariance gives P_K(f) = e_f·(y ⊗ 1), so P_K(f) ≠ 0 ⇒ y ≠ 0; the eigen-property of ω (ε_f·ω_f = ω_f, Skinner p.344) gives log_ω P_K(f) = log_ω y. Clear denominators in y and apply (a). Do not assert φ ∘ ε_f = φ: it holds for the rational Galois-orbit projector but fails for the M_f-coefficient projector when [M_f : ℚ] > 1.
4. (c) BSW Theorem 2.8(i) for E totally real.

Acceptance:

- For an elliptic curve (M_f = ℚ) (a) is the elementary fact that the formal logarithm kills only torsion; for [M_f : ℚ] > 1 it is a transcendence theorem: freeness of A_f(K) ⊗ ℚ_p over M_f ⊗ ℚ_p alone does not give componentwise nonvanishing.
- Skinner Corollary 2.6.2 (P_K(f) ≠ 0 ⇔ L^S_𝔭(f, 1) ≠ 0) is proved this way; the gap in its printed deduction is PAPER-SKINNER-20/E6.

Direct prerequisites:

- `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`
- `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`
- `DiophantineApproximationAndTranscendence:DT.3`

Source locators:

- [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), §1.4, Theorem 1.1, p. 3 — The algebraic-point nonvanishing.
- [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), §1.3, p. 3 — Why the eigencomponent statement is not elementary.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1), §2.6, Corollary 2.6.2, p. 14 — The consumer statement.
- [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2), §2.3, Theorem 2.8(i), p. 6 — The twisted case (c), using only the totally real alternative (i).

Coverage: **planned**. Remaining:

- Compute the normalization unit of the constructor (Castella–Hsieh or Burungale root against JSW (5.1.a), Brooks’s W(f, χ) transported to JSW’s W(f, ψ), Skinner’s periods), the Γ transport and the fixed-tame-branch dictionary.
- Certify the bounded geometric CM measures and the complete-DVR uniqueness interface, including Weierstrass preparation over Ô^ur.
- Supply the three proposed Part II contracts, Castella’s A′ extension and the missing BDP, logarithm and semistable arithmetic signatures and examples.

## Supplier requests

A request specifies missing input; it is not evidence that the supplier already exports it.

- `AutomorphicPadicLFunctions:L3h`: Export the F = ℚ, n⁻ = 1 specialisation of Hsieh's square-root distribution as Castella–Hsieh's measure L_{p,ψ}(f) on Γ̃ = Gal(K_{p^∞}/K) with coefficients in R, with its interpolation formula (Castella–Hsieh Proposition 3.8) including the factors 2^{#A(ψ)+3}, c_o, ε(f), u_K², √D_K and φ(𝔑^{-1}), and its extension to p-new f (Euler factor 1 − a_p p^{-1} φ(𝔭), 𝔭 the prime above p fixed by ι_p). GZ.9 squares it; it does not construct it. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`.
- `AutomorphicPadicLFunctions:L0`: Define the completed fixed central-critical tame branch for finite type (c,𝔑,ε_f), p-adic/algebraic avatars, fixed auxiliary character ψ and twisting by ψ^{-1}. Export pushforward Γ̃→Γ with evaluation ev_φ(pushforward Tw_{ψ^{-1}} μ)=ev_{ψ^{-1}(φ∘q)} μ. A ring-class character of prime-to-p conductor c need not factor through Γ; transport the c=1 trivial specialization explicitly. Compare Skinner’s geometric Artin convention (published p.342) with this packet’s arithmetic convention by inversion, including the selected p-place. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`.
- `AutomorphicPadicLFunctions:L3`: CM periods: the complex period Ω_∞ and the p-adic (Serre–Tate / formal-group) period Ω_p ∈ R^× of an elliptic curve with CM by O_K at a split prime, their dependence on the trivialisation of the formal group, and the algebraicity of the CM values of nearly holomorphic forms via the unit-root splitting at ordinary CM points. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`.
- `PadicMeasuresIwasawaAlgebras:L1`: For R = Ô^ur, the completed maximal unramified extension of the coefficient ring: pushforward of bounded R-valued measures along the fixed reciprocity chart, twisted finite sums, convolution, and the identification of R⟦Γ⟧ with R⟦T⟧ after choosing a generator of Γ. Character evaluation as a ring map is cited as L1/character-integral-algebra-hom; the Amice correspondence is requested from L2. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`.
- `PadicHodgeRegulators:L1`: For an abelian variety with semistable (not good) reduction over a finite extension of ℚ_p — here J₀(N) at p ∥ N — the Bloch–Kato identification log_BK ∘ κ = log_A on A(K_v) ⊗ ℚ_p (Bloch–Kato Example 3.10.1), used to identify Castella's AJ_F with the formal logarithm. The good-reduction case is cited as L1/abelian-variety-logarithm. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`.
- `NeronModelsAndSemistableAbelianVarieties:R11.1`: For the p-optimal connected-kernel quotient J → A of JSW Proposition 5.1.7, the BLR statement that the Néron cotangent lattice ω_𝒜 (R11.1/differential-lattice) pulls back to a saturated direct summand of ω_𝒥. The p-adic logarithm itself is cited as EffectiveDiophantineMethods:ED.4/abelian-logarithm. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`.
- `ColemanIntegration:L1`: Propose Coleman integration, Part II: semistable Abel–Jacobi integration, extending L1 by rigid/semistable integration on p-new modular curves and the r=j=0 case used by Castella Theorem 2.11. The Part II export, not L1’s existing good-reduction statement, is required at p∥N. The good-reduction Coleman/abelian-integral comparison is cited as EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`.
- `GL2AutomorphicRepresentationsAndTransfer:R17.3`: Propose GL2 automorphic representations and transfer, Part II: integral Jacquet–Langlands lattices, for the primitive p-integral differential nonzero modulo p and the compatibility of its lattices under chosen transfer. This extra claim does not follow from the current rational-structure export. Rational transfer, local factors and rational models are cited as R17.3/global-jl, R17.3/local-factors and R17.3/rational-models. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`.
- `AutomorphicLFunctionsAndLocalFactors:AL.3`: For GL₂ over a totally real F and a CM extension K/F: the base-change Rankin L-function L(s, π_K ⊗ χ) with analytic continuation, functional equation and local root numbers ε(1/2, π_{K,v} ⊗ χ_v); the Rankin–Selberg-over-F root numbers and their comparison ε_RS = η_v(−1) ε_BC (Langlands λ-factor); the adjoint L-value L(1, π, ad); and the relation L(f, ψ^alg, s) = L(π_K × ψ^alg, s − 1/2). Also export the completed Hecke L-function L(s, η) of a CM extension K/F, with ζ_K = ζ_F·L(s, η) including archimedean factors, used in CST Lemma 2.3. Rankin–Selberg continuation and the unitary/motivic shift are cited as AL.3/rs-global-functional-equation and AL.3/motivic-unitary-shift. Consumers: `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`, `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum`, `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`, `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`, `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.8/rational-shimura-curve-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`.
- `AutomorphicGaloisRepresentations:R19.1`: The Ramanujan–Petersson bound |σ(a_p)| ≤ 2√p for weight-two newforms at p ∤ N, or equivalently ∏_σ (1 + p − σ(a_p)) = #Ã_f(𝔽_p) for the Eichler–Shimura abelian variety, giving 1 + p − a_p ≠ 0. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`.
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`: The Hasse bound and a_p = p + 1 − #Ẽ(𝔽_p) for an elliptic curve with good reduction at p, so that 1 + p − a_p = #Ẽ(𝔽_p) ≥ 1. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`.
- `DiophantineApproximationAndTranscendence:DT.3`: Propose Diophantine approximation and transcendence, Part II: abelian p-adic analytic subgroup theorems. Extend the read DT.3 scope to the actual algebraic-point theorem in BSW Theorems 3.1–3.2 and its eigenlogarithm consequences Theorems 1.1 and 2.8(i), with dim A=[F:Q], a real embedding of F, and totally real E for the Serre tensor character-twisted point. GZ.9 imports this theorem and proves only its modular-quotient specialization. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing`.
- `HilbertModularVarietiesAndShimuraCurves:R18.2`: Export the ordinary CM deformation on an appropriate fine moduli cover, the integral Serre–Tate coordinate and its change under ideal action, unit-root/Hodge comparison and descent of differential moment values to the coarse canonical curve. A generic smooth integral model alone does not supply these properties. The good model and Hecke extension are cited as R18.2/carayol-split-model and R18.2/hecke-integral-extension. Candidate owner to check for the ordinary CM part: AbelianSchemesAndArithmeticModuliPartII P4 (ordinary CM formal trivializations). Consumers: `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`.
- `GrossZagierAndArithmeticHeights:GZ.1`: Mordell–Weil finite generation over a number field H, rational Galois descent A(H)^G⊗ℚ≃A(K)⊗ℚ by norm averaging. Extend its coefficient-height export with the conjugated-dual Hermitian comparison for finite χ and positivity in every coefficient embedding; unconjugated Rosati bilinearity is insufficient. GZ.8 itself owns only L-scalar extension. Consumers: `GrossZagierAndArithmeticHeights:GZ.8/chi-isotypic-mordell-weil-space`, `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`, `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`.
- `GrossZagierAndArithmeticHeights:GZ.4`: Export the explicit normalized local β-factors at the admissible-order test vectors used in CST Theorems 1.5–1.6 (CST Propositions 3.11–3.12 and Lemma 3.13). The admissible orders and test-vector lines are cited as GZ.4/admissible-toric-order and GZ.4/toric-test-vectors. Consumers: `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-formula-variation`.
- `GrossZagierAndArithmeticHeights:GZ.5`: CST Proposition 2.1 Petersson/adjoint-L comparison with its level, volume and conductor constants, and Prasanna's explicit indefinite-quaternionic Waldspurger formula at Maass–Shimura derivatives used in Brooks Theorem 8.2. Export algebraicity of the Petersson ratio α(f, f_B) under the chosen coefficient embeddings. Brooks Proposition 8.5 itself is planned here (GZ.9/quaternionic-cm-waldspurger-formula) and CM periods are requested from AutomorphicPadicLFunctions L3. Consumers: `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`.
- `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`: The Atkin–Lehner main lemma at level Γ₀(N): a weight-two cusp form whose q-expansion coefficients vanish at every index prime to N is old. The old/new decomposition, newforms and strong multiplicity one are cited as pinned declarations (TauCeti.cuspFormsOld, TauCeti.cuspFormsNew, HeckeRing.GL2.Newform and its strong multiplicity one). Consumers: `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`.
- `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`: Existing upstream coefficient fields and Galois stability of newforms/Hecke projectors; identify conjugated forms and coefficient realizations in the low-order corollaries. Consumers: `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`.
- `PadicMeasuresIwasawaAlgebras:L2`: Surjectivity of the Amice transform for R = Ô^ur: every element of R⟦T⟧ is the transform of a bounded R-valued measure on ℤ_p. Mathlib has the transform, its injectivity over complete ultrametric R and the equivalence only for ℤ_p coefficients. Include restriction of support to 1 + pℤ_p and translation by group-like elements, used for Burungale's integral Serre–Tate moment measures. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`.
- `PadicMeasuresIwasawaAlgebras:L4`: Weierstrass preparation and the factorisation f = ϖ^μ·F·u in O⟦T⟧ for a complete DVR O whose residue field may be infinite (O = Ô^ur); L4/nonzero-power-series-factorization assumes a finite residue field. Consumers: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`.
- `HeegnerPointEulerSystems:HE.1`: Extend HE.1/cm-cyclic-isogeny-pair to D_K ∈ {−3, −4}: the cyclic N-isogeny C/a → C/𝔑_c⁻¹a and its X₀(N)(H_c) point need no restriction on units; record the extra automorphisms that change u = [O_c^× : ℤ^×]. Consumers: `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`.

## Explicit gaps

### YZZ projector proof unavailable

The Berkeley erratum was read directly and CST (2.4) p.18 establishes the point/height/volume dictionary with the completed L(1,η) (CST curve volumes are half of YZZ’s); Skinner p.341 independently checks the trivial average. The YZZ book is not available as a cleared copy. The exact T_alg projection and equivalence with Theorem 3.15, with their book proof locators, remain inherited rather than directly verified. Obtain a cleared book and verify the projector reduction before closing this proof.

Consumers: `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`, `GrossZagierAndArithmeticHeights:GZ.8/vacuous-case`, `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`.

### Hermitian positivity for arbitrary characters

The trace degree [L:M], base-field height and scalar-extension carrier are specified. Skinner’s totally real trace-point positivity verifies χ=1. For arbitrary finite χ, GZ.1 must supply the Rosati/conjugate-dual Hermitian positivity theorem in every coefficient embedding. Match χ and χ⁻¹ via the chosen complex conjugation, prove zero iff the rationalized point is zero, and then prove simultaneous derivative vanishing. Bilinear positivity cannot be substituted for this input.

Consumers: `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`, `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`.

### Integral root normalization and tame-branch transport

The acyclic construction uses the imported L3h root or Burungale Lemma 5.5/(5.8) bounded CM measures before interpolation. Compute the exact ψ₀ twist and Γ̃→Γ pushforward, including the inversion from Skinner’s geometric Artin convention. Compare JSW (5.1.a), CH Proposition 3.8 and Brooks’s CM moments with the same periods; realize φ(𝔑⁻¹) by a group-like unit and prove the remaining scalar is an R-unit. Burungale Theorem 5.6 is not used for an unchecked normalization. For general prime-to-p c, attach BDP’s completed central-critical tame branch and compare its c=1 value, rather than treating every Pic(O_c) character as a Γ-character. The comparison/unit and integrality targets remain conditional on these calculations. Relate Skinner's Ω(ψ^alg), Ω and Ω_p to BDP/Brooks periods; Skinner's printed e_∞–C(f, χ, 1) identity (E88) cannot be used. Compute Brooks's W(f, χ) transported to JSW's W(f, ψ) and compare with JSW's displayed expression.

Consumers: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`.

### Supplier types and Part II contracts not yet certified

The 21 requests specify genuine input statements, not established exports: finite Mordell–Weil descent and Hermitian positivity (GZ.1); CST local β-factors (GZ.4); CST Proposition 2.1 and Petersson-ratio algebraicity (GZ.5); the Atkin–Lehner main lemma and Galois conjugation of newforms (Tau Ceti); character avatars, CM periods and the Castella–Hsieh specialisation (L0, L3, L3h); complete-DVR measure transport, Amice surjectivity and Weierstrass preparation (PMI L1, L2, L4); ordinary CM deformation and Serre–Tate coordinates (R18.2); Néron cotangent saturation for p-optimal quotients (R11.1); p-integral Jacquet–Langlands lattices (R17.3); semistable integration (Coleman L1) and the semistable Bloch–Kato logarithm (PHR L1); base-change root numbers, adjoint and Hecke L-values (AL.3); the weight-two Ramanujan and Hasse bounds; Heegner points for D_K ∈ {−3, −4} (HE.1); and abelian analytic-subgroup/Serre tensor eigenlogarithms (DT.3). Statements already planned in other blueprints are cited by node id: GH.4/bdp-special-value-formula, ED.4/abelian-logarithm and coleman-abelian-comparison, L1/abelian-variety-logarithm, R18.1, R17.3 and R18.2 nodes, GZ.3 and GZ.4 nodes, BSD.2/bfh-nonvanishing and MSPL L1/critical-value-algebraicity. Several of those blueprints are not yet accepted, so their contracts are not certified. Three Part II scope extensions (Coleman integration, GL2 transfer, Diophantine approximation) are proposed, not certified. Supply typed exports in the owners and verify each direct application, including the Fricke/differential conventions.

Consumers: `GrossZagierAndArithmeticHeights:GZ.8/chi-isotypic-mordell-weil-space`, `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`, `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`, `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum`, `GrossZagierAndArithmeticHeights:GZ.8/heegner-functional-equivariance`, `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`, `GrossZagierAndArithmeticHeights:GZ.8/vacuous-case`, `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`, `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`, `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree`, `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-formula-variation`, `GrossZagierAndArithmeticHeights:GZ.8/rational-shimura-curve-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.8/totally-real-trace-point-nontorsion`, `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`, `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`, `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`, `GrossZagierAndArithmeticHeights:GZ.9/logarithm-detects-heegner-point`, `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`, `GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing`.

### Arithmetic Lean signatures and geometric examples remain unavailable

The suggested file now states the L-base-change pairing, probability/complex integral dictionary, actual Tau Ceti Petersson/height compatibility, topology-bearing ℤ_p uniqueness, and integral-power-series quaternionic fragments with concrete algebraic examples. Missing API signatures: IsAdmissibleOrder, finrank_testVectorLine, localToric_ne_zero_of_mem_testVectorLine, isAdmissibleOrder_eichler, bdpLFunction_interpolation, quaternionicBDP_measure. Missing named arithmetic conclusions: actual general/classical/explicit Gross–Zagier and coefficient/corollary identities; genuine local toric nonvanishing; BDP and quaternionic interpolation/logarithm formulas, p-optimal and multiplicative formulas; Abel–Jacobi, Bloch–Kato, isogeny and Fricke comparisons; global logarithm/eigenlogarithm nonvanishing; imprimitive-measure equality. These await the supplier carriers and hypotheses listed in the requests; no arbitrary proposition or measure/logarithm placeholder is used to simulate them. Named generic test lemmas and the example declarations (including order-three tests over 𝔽₇ that detect the χ versus χ⁻¹ convention) test the available algebraic fragments, not actual CM curves or constructed geometric measures. The independent review elaborated the full file, with the pinned Tau Ceti sources of its two Tau Ceti imports inlined because the shared build lacks their compiled modules; placeholder proofs give its only warnings. This checks the signatures, not the arithmetic statements they stand in for.

Consumers: `GrossZagierAndArithmeticHeights:GZ.8/chi-isotypic-mordell-weil-space`, `GrossZagierAndArithmeticHeights:GZ.8/l-linear-neron-tate-pairing`, `GrossZagierAndArithmeticHeights:GZ.8/chi-heegner-point`, `GrossZagierAndArithmeticHeights:GZ.8/toric-integral-versus-finite-sum`, `GrossZagierAndArithmeticHeights:GZ.8/heegner-functional-equivariance`, `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`, `GrossZagierAndArithmeticHeights:GZ.8/vacuous-case`, `GrossZagierAndArithmeticHeights:GZ.8/essential-case-root-number`, `GrossZagierAndArithmeticHeights:GZ.8/nonvanishing-criterion`, `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree`, `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `GrossZagierAndArithmeticHeights:GZ.8/admissible-order-test-vector`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-formula-variation`, `GrossZagierAndArithmeticHeights:GZ.8/rational-shimura-curve-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.8/totally-real-trace-point-nontorsion`, `GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-bdp-construction`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-cm-waldspurger-formula`, `GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point`, `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`, `GrossZagierAndArithmeticHeights:GZ.9/logarithm-detects-heegner-point`, `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `GrossZagierAndArithmeticHeights:GZ.8/coefficient-identity`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`, `GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing`.

### Complete-DVR analytic uniqueness interface

The ℤ_p prototype uses continuous power-series evaluation on the open unit disc and the accumulating arithmetic points (1+p)^((p−1)p^i)−1. Generalize this to the stated complete DVR R and its fraction field, with coefficient boundedness and convergence proved by the PadicMeasuresIwasawaAlgebras export. An equality on characters without those analytic conditions is insufficient. PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization is stated for a finite residue field; R has residue field 𝔽̄_p, so the factorisation is requested for complete DVRs with arbitrary residue field.

Consumers: `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`.

### Castella A′ extension of the multiplicative-prime formula

RankZeroOneBSD BSD.6/BSD.6a request the multiplicative-prime formula and its period comparison under Castella's erratum hypotheses A′ (Theorem 1.1): multiplicative p > 3, additive primes away from p allowed, a nonsplit residually ramified prime, E(ℚ_p)[p] = 0 and a ramified Heegner ideal. multiplicative-prime-formula is planned only for semistable optimal E with p ≥ 5 and every prime of N split or ramified in K. The extension must be proved, not inferred from the semistable case.

Consumers: `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`.

## Suggested Lean file and validation

The suggested file declares 51 of the 57 API names and all 33 test names, with 44 example declarations. The six absent API names and the missing arithmetic headline signatures are listed at the end of the file and in the gap on Lean signatures. The matrix and eigenline tests assert exactly the fragments that are actually typed; they do not claim full admissibility. Several concrete tests distinguish wrong definitions:

- swap and cyclic-shift actions, of order two over ℚ and order three over 𝔽₇; the order-three test detects the χ versus χ⁻¹ convention;
- pure tensors over ℚ and ℂ, which separate a bilinear extension from a Hermitian one;
- finite-field point counts;
- nonconstant power series.

None of them certifies a constructed geometric CM measure.

The review elaborated the whole file with `lean-check` at Mathlib 082e2d3. The shared build lacks the compiled Tau Ceti modules the file imports, so the pinned Tau Ceti f790474 sources of their import closure (17 modules) were inlined into a scratch copy. The file elaborates with no errors, and `sorry` is its only warning. The packet checker reports zero errors and zero warnings.

## Sources checked in this revision

- [The Gross–Zagier Formula on Shimura Curves](https://press.princeton.edu/books/paperback/9780691155920/the-gross-zagier-formula-on-shimura-curves-ams-184). Annals of Mathematics Studies 184, Princeton University Press, 2013. Not directly read: no cleared copy available. Book locators are inherited from the accepted integrated decomposition; substantive normalization and statements are checked against the public Zhang, CST and Skinner restatements. The detailed projector proof remains a gap. Relevant reading: No direct book reading. Inherited locators: Chapter 1 Theorem 1.2 p.9, §§1.2.1 and 1.3.1 pp.2–3 and 6, §1.5.3 p.14, and Chapter 3 §3.3.
- [Erratum: Gross–Zagier Formula On Shimura Curves](https://math.berkeley.edu/~yxy/preprints/erratum-GZSC.pdf). Author erratum, dated 28 June 2026; Berkeley author copy directly read on 2026-10-08. Relevant reading: Items 1–5, 10, 13, 15–16, 23, 25, 30–31, 35, 55, 60 and 62. Item 25 corrects the integration group to Gal(E^ab/E), without specifying probability normalization. SHA-256: `e4c4eaeb197ceaf18b02955d90a56e52e4776eca1f31c88c16074adaf19d8d1e`.
- [Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf). Science China Mathematics 53 (2010), no. 3, 573–592, doi:10.1007/s11425-010-0046-2; author's PDF read 2026-10-08 Relevant reading: §3.2–3.3 (Gross–Zagier formula for modular and Shimura curves over Q), §4.2 (Gross–Zagier formula over totally real fields, Theorem 4.2.1, the root-number set Σ and the toric measure of volume 2L(1,η)), §4.3 (Theorems 4.3.1–4.3.3). SHA-256: `1f46be497752b0795dbef8b06b423ef7bea5203096d3480c6da2642c333e73f0`.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/abs/1408.1733v2). arXiv:1408.1733v2 (18 Nov 2014); published in Algebra & Number Theory 8 (2014) 2523–2572; read 2026-10-08 Relevant reading: §1.1 (Theorems 1.1 and 1.2, the BSD comparison), §1.2 (setting, Definitions 1.3–1.4, Theorem 1.5 with Special cases 1–2 and the X_0(N) example, Theorem 1.6 with the X_0(36) example), §1.3 opening (root-number convention).; §2.3, Lemma 2.3 and (2.4), pp.17–18: relative class number, toric measure, base-field height and curve-volume comparisons; §3.3 Proposition 3.7 p.24. SHA-256: `8d908543404abfbd9c1708ad9af696c4fb71595701bd67cb5bff11b3a8d6ac43`.
- [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294v1). arXiv:1405.7294v1 (28 May 2014); published in Annals of Mathematics 191 (2020) 329–354; read 2026-10-08 Independently collated with the published PDF (Annals of Mathematics 191 (2020), 329–354) in §2.5–2.6 pp.341–344 by REV-GrossZagierAndArithmeticHeights--GZ.8 on 2026-10-06; earlier node locators remain explicitly to the arXiv text unless stated otherwise. This revision independently collated the indicated published sections on 2026-10-08; their hashes are recorded in sourceVersions. Relevant reading: §2.4 (Heegner points P_K(f) in Cases I and II), §2.5 (Proposition 2.5.1 and its derivation from YZZ Theorem 3.13, Corollary 2.5.2), §2.6 (the anticyclotomic p-adic L-function L_p^S(f), Proposition 2.6.1, Corollary 2.6.2).; Published-version collation: §2.5–2.6 pp.341–344. SHA-256: `9e4650618c83394c400a10e990759f9fba42113eedc79fe2fcbe029d6c8381ff`.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1). arXiv:1512.06894v1 (21 Dec 2015), the latest arXiv version; published in Cambridge Journal of Mathematics 5 (2017) 369–434. Read the arXiv version 2026-10-08; locators are to it. Independently collated with the published PDF (Cambridge Journal of Mathematics 5 (2017), 369–434) in §5.1 pp.408–413 by REV-GrossZagierAndArithmeticHeights--GZ.8 on 2026-10-06; earlier node locators remain explicitly to the arXiv text unless stated otherwise. This revision independently collated the indicated published sections on 2026-10-08; their hashes are recorded in sourceVersions. Relevant reading: §3 opening ((split), (irred_K)), §4.1–4.2 ((H), (gen-H), (sign −1), the Shimura curve X_{N+,N−}, Remark 4.2.1), §5.1 in full (Σ_cc, the interpolation formula (5.1.a), Remark 5.1.1, Proposition 5.1.3, the incomplete L_p^Σ, Remark 5.1.4, Propositions 5.1.6–5.1.7 with proof).; Published-version collation: §5.1 pp.408–413. SHA-256: `908562efdddaf46b2653317294cb65ae627802bc996400a779b1cd51b5a7d49d`.
- [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content). International Mathematics Research Notices 2015, no. 12, 4177–4241, doi:10.1093/imrn/rnu062 (published version, EPFL Infoscience copy); read 2026-10-08, pages 62–63 also inspected as rendered images Relevant reading: §1 (Theorem 1.1 and the outline), §6.4 (the case of weight two), §7 Proposition 7.4 and Lemma 7.5, §8 in full (8.1 character spaces, 8.2 Lemma 8.1 and Theorem 8.2, 8.3 Propositions 8.3–8.5 and Lemma 8.4, 8.4 Propositions 8.7–8.9 and Lemma 8.6, 8.5 Proposition 8.10 and Theorem 8.11, 8.6 Propositions 8.12–8.13). SHA-256: `90898527cf2e7e69bb6eba200dc7646e7f61837fa310299852ea2b958f925219`.
- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf). Duke Mathematical Journal 162 (2013), no. 6, 1033–1148, doi:10.1215/00127094-2142056 (published version, from Darmon's publication page); read 2026-10-08 Relevant reading: Introduction, the r = j = 0 discussion (pp. 1038–1039), Remark 2.6 and Proposition 2.7, §5 in full (5.1 Theorems 5.1, 5.4, 5.5 and Lemmas 5.2–5.3; 5.2 the p-adic period (5.2.2), the definition (5.2.3)–(5.2.4), Theorems 5.7 and 5.9, Proposition 5.10, Remark 5.11; 5.3 Assumption 5.12, Theorem 5.13 with proof). SHA-256: `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`.
- [Heegner cycles and p-adic L-functions](https://arxiv.org/abs/1505.08165v2). arXiv:1505.08165v2 (7 Jan 2017); published in Mathematische Annalen 370 (2018) 567–628; read 2026-10-08 Relevant reading: §3.3 (Definition 3.4, the toric period, Proposition 3.6, Definition 3.7 of the measure L_{p,ψ}(f), Proposition 3.8, Theorem 3.9), §4.5 (Bloch–Kato logarithm, Theorem 4.9). SHA-256: `a98f9f37a45f46b55968e1fde8fc952b909dda91e6239dafc1dd3688fd8b9755`.
- [On the exceptional specializations of big Heegner points](https://arxiv.org/abs/1507.04260v1). arXiv:1507.04260v1 (15 Jul 2015; manuscript dated 19 Sep 2018); published in Journal of the Institute of Mathematics of Jussieu. Read the arXiv version 2026-10-08; locators are to it. Relevant reading: Introduction (the exceptional zero (0.3), the L-invariant (0.4) and the main theorem), §2.5 (Theorems 2.10 and 2.11, the semistable p-adic Gross–Zagier formula), §3.4 (Theorem 3.11). SHA-256: `f58fcad0d1869ee6888d97b4b73b9a86a806abb95170e7800ae800d62e13a2cf`.
- [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2). arXiv:1704.06608v2 (14 Jun 2017); published in Cambridge Journal of Mathematics 6 (2018). Read the arXiv version 2026-10-08; locators are to it. Independently collated with the published PDF (Cambridge Journal of Mathematics 6 (2018), 1–27) in §3 pp.13–15 by REV-GrossZagierAndArithmeticHeights--GZ.8 on 2026-10-06; earlier node locators remain explicitly to the arXiv text unless stated otherwise. This revision independently collated the indicated published sections on 2026-10-08; their hashes are recorded in sourceVersions. Relevant reading: §1 (introduction, the p-adic Waldspurger formula (1.c) for p | N and the role of the L-invariant), §3 (Theorem 3.1 with proof, (3.1), Theorem 3.2 with proof).; Published-version collation: §3 pp.13–15. SHA-256: `23e3ab4e9d99ceba88d3aaf0fa0612b60ac728086f82555f951f4e1853323081`.
- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf). Inventiones mathematicae 84 (1986), 225–320; Zagier author scan with text layer, read 2026-10-08. Relevant reading: Chapter I §5 (pp. 229: (5.1)–(5.5)), §6 (p. 230: Theorems (6.1)–(6.3), (6.4), (6.5)); Chapter V §1 (pp. 307–309: the coefficient identity, the proof of Theorem (6.3), Corollaries (1.1)–(1.3)), §2 (p. 311: Theorem (2.1), Conjectures (2.2)–(2.3)). SHA-256: `8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521`.
- [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/abs/2603.20886v2). arXiv:2603.20886v2 (10 May 2026); read 2026-10-08 Relevant reading: §1.1–1.4 (the BDP formula (1.1), the question about every eigenlogarithm, Theorem 1.1), §2.3 (Theorem 2.8 for χ-twisted Heegner-type points). SHA-256: `f2b4a020bf5dbcd33df3a4b30cbf27230dc0d0775312f5e543b03b2486f6a994`.
- [On the non-triviality of generalised Heegner cycles modulo p, II: Shimura curves](https://arxiv.org/abs/1504.02342v1). arXiv:1504.02342v1, 9 April 2015; read 2026-10-08. Used for integral measure construction, not an unchecked normalization of Theorem 5.6. Relevant reading: §5.2 pp.27–29, Lemma 5.5 and (5.8): integral local CM measures and their translated finite sum. SHA-256: `ebbfda7c2b0f341754a3fcb7dba993846d2101fd8eecb978e0ee1e768350f464`.

## Source corrections and review verdicts

Each entry carries the verdict of the independent review REV-GrossZagierAndArithmeticHeights--GZ.8~2. That review re-checked E2–E7, which REV-GrossZagierAndArithmeticHeights--GZ.8 had confirmed earlier, and added E87–E94, numbered after the E1–E86 of the sibling packet for GZ.0–GZ.7. The descriptions below are in our own words; no source excerpt is reproduced.

- **GrossZagierAndArithmeticHeights/E2** (misprint): The logarithm is squared: L_p(f, χ) = (1 − χ^{-1}(p̄) a_p + χ^{-2}(p̄) ε_f(p) p)² · log_{ω_f}(ε_f Δ_χ)², and likewise log_{ω'_f}(Δ'_χ)² in Proposition 8.13. Reason: Both propositions specialize Theorem 8.11 to weight two, whose right side is the square of the Abel–Jacobi sum; the left side L_p(f, χ) is quadratic in f_B (Proposition 8.9), while the printed right side is linear in ω_f. JSW Proposition 5.1.6, citing Brooks Proposition 8.13, prints log² ω_f.
- **GrossZagierAndArithmeticHeights/E3** (misprint): For weight-two forms the Petersson norm is ∫_{Γ\ℍ} |g(z)|² y² · dx dy / y² = ∫_{Γ\ℍ} |g(z)|² dx dy. Reason: Under γ ∈ Γ, |g(γz)|² = |cz + d|⁴ |g(z)|² while dx dy / y² is invariant, so the printed integrand is not Γ-invariant and the integral over Γ\ℍ is not defined; the factor y² (weight two) is missing. CST §1.1 uses ∫|φ|² dx dy; Brooks names the Petersson products without displaying a normalisation.
- **GrossZagierAndArithmeticHeights/E4** (misprint): Δ_χ = Σ_{[a]} χ^{-1}(a) N(a) P_a, the χ-weighted sum of the CM points a ⋆ (A, t); the summand does not depend on a as printed. Reason: The indexed point P_a, representing a⋆(A,t), occurs in the preceding proof. The printed P_χ is independent of the summation index and therefore cannot express that sum. An orthogonality argument would require the finite-order twist χN^{-1}, not the central-critical χ itself.
- **GrossZagierAndArithmeticHeights/E5** (misprint): L_p(f) := Tw_{ψ^{-1}}(L_{p,ψ}(f))², with the period, character-dependent Λ-unit and scalar-unit normalization comparison made explicit: the cited Castella–Hsieh object is a square-root measure, whereas Theorem 3.1 interpolates central values. Reason: Castella–Hsieh Proposition 3.8 gives (L_{p,ψ}(f)(φ̂)/Ω_p^{2r+2m})² = L^alg(1/2, π_K ⊗ ψφ) · (...); a twist does not change degree, so Tw_{ψ^{-1}}(L_{p,ψ}(f)) interpolates square roots of L-values, not the L-values of Theorem 3.1. Theorem 3.2 (L_p(f, 1) = (...)² (log P_K)²) is also consistent only with the square.
- **GrossZagierAndArithmeticHeights/E6** (misprint): Use L(f,χ^{-1},0) in the right-hand side, consistent with the left-hand side and Proposition 8.5. Reason: Proposition 8.5 relates the same toric CM sum to L(f,χ^{-1},0); Corollary 8.8 and Proposition 8.9 use that square. Node quaternionic-bdp-construction copied the missing inverse and is now corrected.
- **GrossZagierAndArithmeticHeights/E7** (misprint): The Euler factor is (1 − a_p(f)p^{-1} + p^{-1})². The coefficient a_p(f) is the usual Hecke coefficient. Reason: The cited weight-two BDP formula, also printed correctly in JSW Proposition 5.1.6, substitutes the norm character with value p at p̄, producing a_p/p. The packet already uses that correct factor. In particular the printed factor is inconsistent with (1+p−a_p)/p for the same Hecke normalization.
- **GrossZagierAndArithmeticHeights/E87** (misprint): j = n − 1: with χ^{-1} = ψ^alg|·|_{𝔸_K}, χ has infinity type (−n − 1, n − 1) in JSW's convention, i.e. (2 + j, −j) with j = n − 1. Reason: ψ^alg_∞(z) = z^n z̄^{-n} and |z|_ℂ = z z̄ give χ_∞(z) = z^{−n−1} z̄^{n−1}. JSW's own C(f, ψ) and Ω^{4n} agree with Brooks's C(f, χ) (through Γ(j + 1)Γ(k + j)) and Ω^{2(k+2j)} only for j = n − 1, and the BDP point n = 0 then corresponds to j = −1.
- **GrossZagierAndArithmeticHeights/E88** (error): The two sides differ. With e_∞(f, ψ) = 4(2π)^{−2n−1}Γ(n)Γ(n + 1) and n even the left side is 4i·w_K·Γ(n)Γ(n + 1), whereas BDP Theorem 4.6 at c = 1 (k = 2, j = n − 1) gives ¼π^{2n−1}Γ(n)Γ(n + 1)w_K|d_K|^{1/2}2^{#S_f}. The interpolation formulas agree only after Skinner's Ω(ψ^alg) and his CM periods are matched with BDP's, and then only up to a unit. Reason: Direct substitution: the left side is purely imaginary and the right side is positive. Nothing downstream changes, since Skinner states his results up to units.
- **GrossZagierAndArithmeticHeights/E89** (error): (sign −1) holds under (H). Under (gen-H) one needs, at each ramified ℓ | N⁺, a local condition ensuring that ℓ is not in the Saito–Tunnell set, for example Skinner's (ram): ℓ ∥ N with π_ℓ the Steinberg representation twisted by the unramified quadratic character. Reason: Take E = 11a1 (a₁₁ = +1, split multiplicative) and K = ℚ(√−11): N = N⁺ = 11 ramifies in K and N⁻ = 1, so (gen-H) holds. Over the ramified K₁₁ the curve stays split multiplicative, so its local root number is −1; the complex place contributes −1 and all other places +1. Hence ε(E/K) = +1, not −1.
- **GrossZagierAndArithmeticHeights/E90** (misprint): The normalising count should be #Pic_{K/F}(O_{c₁}), the order of K̂^×/K^×F̂^×Ô_{c₁}^×. Reason: For f1 ∈ V(π, χ) the integrand is right Ô_{c₁}^×-invariant and the quotient of K^×F̂^×\K̂^× by Ô_{c₁}^× is Pic_{K/F}(O_{c₁}), so with S = ∅ the printed normalisation gives h_F/#κ_{c₁} times the finite sum of Theorem 1.5, and the formula would differ from Theorem 1.5 by (h_F/#κ_{c₁})². The joint proof of Theorems 1.9 and 1.6 (arXiv pp.19–20, published p.2553) uses #Pic_{K/F}(O_{c₁}) in the constant L(π, χ) for both f and f', and treats Theorem 1.6 the same way. The two counts agree when h_F = #κ_{c₁}, in particular for F = ℚ.
- **GrossZagierAndArithmeticHeights/E91** (gap): The '≥ 3' statement follows only when the root number of f is −1 (odd orders, where it is equivalent to 'not 1'). For root number +1 it amounts to Galois invariance of order exactly 2, which the argument does not give; the other three statements are proved. Reason: With even orders e = 2 for f and e' = 4 for f^α, the order-zero, order-one and '≥ 2' statements all hold, equal parity holds, and the '≥ 3' statement fails, so the stated reduction does not imply the fourth line in that case.
- **GrossZagierAndArithmeticHeights/E92** (misprint): Taken with coefficients in a field containing the Hecke eigenvalues of f, the projector cuts the holomorphic part to a line: ε_f Fil¹H¹_dR(C/F) = Fω_f. The whole f-part ε_f H¹_dR(C/F) is two-dimensional. Reason: By the Hodge decomposition the Hecke eigensystem of f occurs in H¹_dR twice, once on the holomorphic class ω_f and once on a class outside Fil¹ (over ℂ, the antiholomorphic class of the conjugate form), so no projector has a one-dimensional image on all of H¹_dR; with rational coefficients the image would be the whole Galois orbit, of dimension 2[ℚ(f):ℚ]. Section 6.4 and Lemma 7.5 only use ε_f on Fil¹ and on degree-zero divisors, so the argument is unaffected.
- **GrossZagierAndArithmeticHeights/E93** (error): Δ′_χ lies in Div(C′)(H) ⊗ ℚ̄, H the Hilbert class field, in the eigenspace on which Gal(H/K) acts through the finite-order part χN^{-1} (or its inverse, depending on the reciprocity normalisation); it is K-rational when χN^{-1} is trivial, the case used by Jetchev–Skinner–Wan. Reason: Write χ = χ₀N with χ₀ a class-group character (the sums run over Cl(K)). Then Δ_χ = Σ_a χ₀^{-1}(a)P_a, and the images on C′ of the CM points a ⋆ (A, t) are defined over H and permuted by Gal(H/K) through the action of Pic(O_K) on the index a. Hence σ_b(Δ′_χ) = χ₀(b)^{±1}Δ′_χ, which is not Δ′_χ for some b whenever χ₀ ≠ 1 and Δ′_χ ≠ 0. Only the field-of-definition clause is wrong; the identity between L_p(f, χ) and the squared logarithm does not use it.
- **GrossZagierAndArithmeticHeights/E94** (misprint): ε_f x_K^{N⁺,N⁻} = (a_{ℓ₀} − ℓ₀ − 1) x̃_K^{N⁺,N⁻}, so log_{ω_f} x_K^{N⁺,N⁻} = (a_{ℓ₀} − ℓ₀ − 1) log_{ω_f} x̃_K^{N⁺,N⁻}: the factor is the negative of the printed one. Reason: x_K^{N⁺,N⁻} is the Gal(H/K)-trace of (T_{ℓ₀} − ℓ₀ − 1)[x] and ε_f T_{ℓ₀} = a_{ℓ₀} ε_f, so ε_f x_K^{N⁺,N⁻} = (a_{ℓ₀} − ℓ₀ − 1) Σ_σ ε_f[x]^σ. JSW's own §4.3 normalisation z_K = y_K/(a(ℓ₀) − ℓ₀ − 1) and Skinner's Q_K(f) = (a_ℓ(f) − 1 − ℓ)^{-1} ε_f[D_{K,ℓ}] (published p.340) use this sign. Proposition 5.1.6 squares the factor, so nothing changes.

## Proposed ownership changes

- RT-AREA-iwasawa-1/11: GZ.9 planned the GL₂ BDP square-root distribution (also planned by AutomorphicPadicLFunctions L3h) and the weight-two case of BDP Theorem 5.13 (stated in general by GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula in the GH blueprint; the decomposition node GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images states only the simplified Main Theorem, with χ̄(p̄) printed for χ⁻¹(p̄)). Owners: L3h owns the square-root distribution for every totally real F (specialised to F = ℚ, n⁻ = 1 for GZ.9); GH.4 owns BDP Theorem 5.13 for every r ≥ 0 (GH.4/bdp-special-value-formula), as the GH blueprint also proposes; GZ.9 imports both (bdp-square-root-comparison squares the L3h measure; bdp-weight-two-heegner-formula imports Theorem 5.13 at r = j = 0) and owns what is new in weight two: Brooks's quaternionic construction and Proposition 8.13 (= JSW Proposition 5.1.6), JSW Proposition 5.1.7, the multiplicative-prime formula, the formal-logarithm and Bloch–Kato/Kummer comparisons and the isogeny/differential compatibilities. Add the stage edges AutomorphicPadicLFunctions:L3h → GZ.9, GeneralizedHeegnerCycles:GH.4 → GZ.9 and GeneralizedHeegnerCycles:GH.1 → GZ.9 (the last for GH.1/p-adic-abel-jacobi-map and GH.1/generalized-heegner-cycle); all are acyclic (no path from GZ.9 to any of them in research/blueprint/atlas/stage-edges.json). This takes the GH.4 direction rather than the round-1 fix report's GZ.9 → GH.1; the red-team finding allowed either.
- The stage edge ModularSymbolsPadicLFunctions:L2 → GZ.9 (p-stabilised modular-symbol measures) is not used: neither the BDP nor the Brooks construction uses modular symbols, and no GZ.9 node needs L2. Drop the edge ModularSymbolsPadicLFunctions:L2 → GrossZagierAndArithmeticHeights:GZ.9. Add instead the edges actually used: AutomorphicPadicLFunctions:L0 and L3 → GZ.9 (character avatars, CM periods), HilbertModularVarietiesAndShimuraCurves:R18.1 and R18.2 → GZ.9 (canonical Shimura curves X_{N⁺,N⁻} and their integral models), GL2AutomorphicRepresentationsAndTransfer:R17.3 → GZ.9 (Jacquet–Langlands), ColemanIntegration:L1 → GZ.9, GrossZagierAndArithmeticHeights:GZ.5 → GZ.9 (the CM-value Waldspurger formula) and HeegnerPointEulerSystems:HE.1 → GZ.8. Also add EllipticCurveModularity:R29.5 → GZ.8 and → GZ.9, RankZeroOneBSD:BSD.2 → GZ.8, DiophantineApproximationAndTranscendence:DT.3 → GZ.9, EffectiveDiophantineMethods:ED.4 → GZ.9 and GrossZagierAndArithmeticHeights:GZ.8 → GZ.9 (GZ.9/bdp-weight-two-heegner-formula cites GZ.8/chi-heegner-point); none has a reverse path in research/blueprint/atlas/stage-edges.json. The L0, L3, R18.1, R18.2, R17.3 and HE.1 edges listed above are already implied by existing paths.
- GZ.9's stage text asks for 'a multiplicative exceptional-zero formula ... with its Tate-period/L-invariant term whenever consumed by the corrected BSD multiplicative branch'. The weight-two BDP formula at a multiplicative prime has the nonvanishing factor (1 − a_p p^{-1})² and no exceptional zero (Castella, Theorem 2.11; Castella CJM Theorem 3.2), and that formula is what the multiplicative BSD branch (Castella CJM Theorem A, in RankZeroOneBSD BSD.6a) consumes; it is planned here as multiplicative-prime-formula. The L-invariant appears only in the derivative formula for Howard's big Heegner points at an exceptional weight-two point (Castella, Theorem 3.11), a Hida-family statement. Replace GZ.9's exceptional-zero clause by: 'the weight-two formula at a multiplicative prime p ∥ N split in K (no exceptional zero)'. The exceptional-zero derivative formula for big Heegner points (Castella Theorem 3.11, with the L-invariant 𝓛_p(f, K)) has no current consumer; if one appears it belongs with the Hida-family classes of GeneralizedHeegnerCycles GH.7, whose blueprint must then plan it (the GH blueprint currently assigns 'exceptional variants' to GZ.9, which this proposal declines). PadicHodgeTheory R06.6's recorded use 'the Tate-period/L-invariant term of the multiplicative exceptional-zero formula' should name GH.7 instead of GZ.9.
- The accepted GeneralizedHeegnerCycles--GH.8 packet plans weight-two comparisons (weight-zero-cycle, differential-evaluation) that coincide with GZ.9's weight-two-abel-jacobi-is-logarithm and isogeny-and-differential-compatibility. GZ.9 precedes GH.8 in the stage graph (GZ.9 → HE.8 → GH.8), so GZ.9 cannot import them. GH.8 imports GZ.9/weight-two-abel-jacobi-is-logarithm and GZ.9/isogeny-and-differential-compatibility and keeps only its family-specific comparisons (stabilised classes, corestriction, uniform lattices, Hida specialisation). This requires revising an accepted packet; until then the two statements are duplicated and must be kept identical.
- Coleman integration, Part II: semistable Abel–Jacobi integration Build on L1: rigid/semistable divisor integration and the p-new weight-two Abel–Jacobi/logarithm comparison; good reduction does not cover p∥N. This is a proposed scope extension; no declaration from it is treated as already established.
- GL2 automorphic representations and transfer, Part II: integral lattices Build on R17.3 rational transfer: primitive p-integral Jacquet–Langlands normalization and its lattice compatibility. This is a proposed scope extension; no declaration from it is treated as already established.
- Diophantine approximation and transcendence, Part II: abelian p-adic subgroups Build on DT.3: analytic subgroup theorem for algebraic points on abelian varieties and BSW eigenlogarithm/Serre tensor consequences. This is a proposed scope extension; no declaration from it is treated as already established.
- GZ.9/p-optimal-quotient-formula needs the BLR statement that, for the p-optimal connected-kernel quotient J → A of JSW Proposition 5.1.7, the Néron cotangent lattice of A pulls back to a saturated direct summand of that of J. The p-adic abelian logarithm is EffectiveDiophantineMethods:ED.4/abelian-logarithm, and AbelianSchemesAndArithmeticModuliPartII already exists with other content, so no abelian-schemes Part II is proposed. NeronModelsAndSemistableAbelianVarieties R11.1, owner of the Néron cotangent lattice (R11.1/differential-lattice), exports its saturated pullback along p-optimal quotients for GZ.9/p-optimal-quotient-formula.
- Incoming requests: RankZeroOneBSD--BSD.0 asks GZ.9 for Kobayashi's supersingular p-adic Gross–Zagier formula, which is a p-adic height formula; GZ.9 concerns the logarithm (Abel–Jacobi) formula and its stage text separates it from p-adic height derivative formulas. EffectiveDiophantineMethods asks GZ.8 for rank A_f(ℚ) = dim A_f and finiteness of Ш, but GZ.8 supplies only the non-torsion trace point (totally-real-trace-point-nontorsion). Redirect the Kobayashi request to the owner of cyclotomic p-adic heights and the rank/Ш request to HeegnerPointEulerSystems HE.7, which consumes GZ.8/totally-real-trace-point-nontorsion. Castella's A′/Theorem 1.1 extension requested by BSD.6/BSD.6a is recorded as a gap of GZ.9/multiplicative-prime-formula.
