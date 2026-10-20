# Roadmap: Drinfeld modules, t-motives and characteristic-p special values

**Summary.** This roadmap builds the theory of Drinfeld modules over the ring `A` of functions on a smooth projective curve over a finite field `F` that are regular away from a fixed closed point `∞`, and of Anderson's t-modules and their motives over `F[t]`. Starting from the twisted polynomial ring `L{τ}`, which Mathlib provides as `SkewPolynomial` and FiniteFieldsAndCharacterSums identifies with q-linearized polynomials, it defines Drinfeld modules over fields and over arbitrary `A`-schemes, proves the rank theorem without assuming that `∞` is rational, and constructs kernels, ideal torsion, Tate modules and their Galois representations. It proves Drinfeld's uniformization of Drinfeld modules over `C_∞` by `A`-lattices and fixes the normalizations of the Carlitz exponential, logarithm, period and of the Anderson–Thakur function `Ω`. It constructs the Drinfeld moduli schemes with level structure, Pink's Satake compactification, algebraic Drinfeld modular forms and Hecke operators, and the arithmetic compactification of Hartl–Yu. It develops Anderson t-modules, effective `A`-motives, dual t-motives and the abelian/`A`-finite dictionary, and proves the Tate theorem and the semisimplicity of rational Tate modules over finitely generated fields (Taguchi, Tamagawa, Stalder). It proves Taelman's class formula `L(E/R) = [R : U(E/R)]·|H(E/R)|` for Drinfeld modules over the integers of finite extensions of `F(θ)`, with the Carlitz module and a module with nonzero class module as worked cases. It constructs Drinfeld's elliptic sheaves, the anti-equivalence with Drinfeld modules and the two-leg shtuka they define. Finally it builds Papanikolas's Tannakian theory of rigid analytically trivial pre-t-motives and the Anderson–Brownawell–Papanikolas criterion, and proves the end theorems: the transcendence degree of the period field of a rigid analytically trivial t-motive equals the dimension of its motivic Galois group ([§8.42](#dm-8-period-transcendence)), and Carlitz logarithms of algebraic arguments that are linearly independent over `F(θ)` are algebraically independent over its algebraic closure ([§8.50](#dm-8-carlitz-logarithm-independence)).

## Scope and ownership

This roadmap owns, layer by layer:

- **DM.0.** Drinfeld `A`-modules over fields and over arbitrary `F`-algebras (on line bundles), the rank theorem for every `A`, morphisms and isogenies, rank invariance and separability of isogenies, kernels as finite group schemes, standardization over nonreduced bases, and the Carlitz module with its products `D_i`, `ℓ_i`.
- **DM.2.** The coefficient Frobenius twist on power series, the complete algebraically closed field `C_∞`, projective `A`-lattices, lattice exponentials, Drinfeld uniformization and its morphisms, the Carlitz exponential, logarithm and period, the Anderson–Thakur function `Ω` and the invariant period power.
- **DM.4.** Anderson t-modules and `A`-modules, effective `A`-motives, the contravariant motive functor and the abelian anti-equivalence, purity and weights, uniformizability, Carlitz tensor powers, effective dual t-motives, pre-t-motives, the star anti-isomorphism, invariant factors over a discretely valued skew field, and the dual realization of t-module points with the equality of abelian and `A`-finite.
- **DM.1.** Finite `F`-shtukas and Drinfeld's functor, the semilinear Lang lemma, ideal torsion as a finite locally free group scheme, étaleness away from the characteristic, geometric torsion bases, Tate modules and their continuous Galois representations, local shtukas and divisible local Anderson modules, and the realization at the characteristic place.
- **DM.3.** Level structures, the moduli stack and its fine level schemes, generalized Drinfeld modules, Pink's Satake compactification and its reciprocal model, section rings of ample line bundles on normal projective schemes, algebraic Drinfeld modular forms, Hecke correspondences and the arithmetic Satake compactification.
- **DM.5.** Rational motives and their Tate realization, the Tate Hom map, its injectivity and saturation, local algebraization and the Tate period ring, the Tate theorem, simplicity of Drinfeld motives and the semisimplicity of rational Tate representations.
- **DM.6.** Monic cardinalities of finite `F[t]`-modules, Taelman's integral models, their Euler-product `L`-values, unit lattices and class modules, normalized covolumes, determinants of nuclear operators on compact `F`-vector spaces, the trace formula, the tangent determinant identity, Taelman's class formula, depth-one Carlitz power sums and the two worked examples.
- **DM.7.** Elliptic sheaves on `C × S`, their normalized form, the elliptic sheaf of a Drinfeld module, the anti-equivalence with Drinfeld modules, the two-leg shtuka they define, and the comparisons of realizations away from and at the characteristic.
- **DM.8.** Semilinear fixed-vector descent and the Betti comparison, the arithmetic entire subring, twisting limits, constant fields and separability of the analytic difference fields, rigid analytic triviality, Anderson's uniformizability criterion, the neutral Tannakian category of rigid analytically trivial pre-t-motives, difference Galois groups and their torsors, the identification with the motivic Galois group, the Anderson–Brownawell–Papanikolas lifting criterion, the period transcendence theorem, the Carlitz group, and the algebraic independence of Carlitz logarithms.

It uses the following and states none of it again:

- **Mathlib** (pinned `082e2d37e8`): the skew polynomial ring `SkewPolynomial` (the carrier of `L{τ}`), the Frobenius algebra map `FiniteField.frobeniusAlgHom`, `iterateFrobeniusEquiv`, polynomials and their evaluation, restricted power series `PowerSeries.IsRestricted`, normed fields, completions and spectral norms, fixed submodules `LinearMap.fixedSubmodule` and scalar extension `LinearMap.liftBaseChange`, `LinearMap.charpoly`, linear and algebraic independence, transcendence degree `Algebra.trdeg`, intermediate fields, `Algebra.IsGeometricallyReduced`, commutative Hopf algebras, and sheaves of modules on schemes.
- **Tau Ceti**: the additive group as a functor of points and kernels of Hopf-algebra maps as group schemes (pinned), the smoothness criterion for geometrically reduced commutative Hopf algebras (pinned), Fitting ideals and their base change (current library), the restricted-series Weierstrass preparation and unit criterion (current library). Tau Ceti's `TauCeti.TateModule` is the `ℤ_p`-Tate module of an abelian group; the Tate modules of [§1.8](#dm-1-tate-module) are modules over the completions `A_λ` of a Dedekind ring at a prime and are a different object.
- **FiniteFieldsAndCharacterSums** owns q-linearized polynomials over commutative `F`-algebras: the identification of `R{τ}` with q-linearized polynomials under composition, the `F`-linearity of their evaluation, the separability criterion and subspace polynomials (its shared linearized-polynomial targets, *frobenius-ore-polynomial-comparison*, *linearized-polynomial-eval-linear*, *linearized-polynomial-separable-iff*, *subspace-polynomial-is-linearized*).
- **TauCetiRoadmap AlgebraicCurves** (Layers 2, 3, 5 and 12), **JacobianChallenge** (Layers A–C), **AlgebraicVectorBundles** (L0B, L1A–L1B, L2B), **SchemeAndStackFoundations**, **RestrictedPowerSeries**, **NewtonPolygons** and **StableReduction** (Layer 0): curves, divisors and Riemann–Roch, completions at places, line bundles and coherent cohomology with base change, vector bundles and relative spectra, schemes, descent, quotients, torsors and cohomology, restricted and entire power series with their Weierstrass theory, Newton polygons, zero counts and entire products; the exact items are listed in [Exact supplier contracts](#exact-supplier-contracts).
- **ReductiveGroupsPartII**: Lang's theorem for smooth connected groups over finite fields (RG2.3.7) and Weil restriction (RG2.0a.2).
- **MotivesAndAlgebraicCycles**, Layer 6: neutral Tannakian reconstruction over an arbitrary field, generation and finite-type criteria, and the faithful-flatness and closed-immersion criteria for group maps (§§6.1–6.3).
- **FunctionFieldArithmetic**: divisor lattices in completed adeles (§2.1); exact constants and place degrees are supplied by AlgebraicCurves Layers 0 and 5.

<a id="dm-8-tate-analytic-interface"></a>

The analytic-ring interface is supplied by RestrictedPowerSeries Layer 1 and §§3.2, 4.3, 5.1–5.2, together with the current Tau Ceti declarations below. Specialize to the radius-one algebra `𝕋` over `C_∞`, with `𝕃 = Frac(𝕋)`. Its complete multiplicative Gauss norm, Weierstrass preparation and principal ideal property are inputs here. For `f ≠ 0` use the normalization `f = cPu`: `P` monic with the zeros of `f` in the closed unit disc, `c ≠ 0`, and `u(0) = 1` with strictly small tail. In particular `t − a` is a unit exactly when `|a| > 1`; nonzero determinant over `𝕋` does not imply membership in `GL_r(𝕋)`. This is the supplier's factorization specialized to `C_∞`, not an additional target (Pap, §2.2.4, p. 7).

<a id="dm-8-tensor-generated-subcategory"></a>

The notation `⟨S⟩` uses the strictly full tensor subcategory generated by `S`, supplied by MotivesAndAlgebraicCycles §6.3: close under the unit, finite sums, tensor products, duals and subquotients. In particular `⟨X⟩` consists of subquotients of sums of mixed tensor powers of `X` and `X^∨`. This general construction is an input, rather than a target here.

Boundaries with neighbouring roadmaps:

- GlobalShtukasAndFunctionFieldLanglands owns general global `G`-shtukas, their moduli and V. Lafforgue's theorem; it compares the elliptic sheaves of DM.7 with one-leg shtukas. ExcursionOperatorsAndSpectralAction owns `D`-elliptic sheaves for a division algebra `D`, which for `D = M_d(F)` are the elliptic sheaves of DM.7 by Morita equivalence. HeckeStacksAndLocalShtukas owns local shtukas in mixed characteristic; the equal-characteristic local shtukas of [§1.10](#dm-1-local-shtuka) are a different category.
- PadicDifferentialEquationsAndRigidCohomology recognizes neutral Tannakian categories of `p`-adic differential modules; DiophantineApproximationAndTranscendence owns transcendence in characteristic zero, including Picard–Vessiot and Mahler methods. The difference Galois theory and transcendence of DM.8 are in characteristic `p`, for the inverse Frobenius twist.
- OperatorTheory owns nuclear operators on complex Banach spaces; the nuclear determinants of [§6.3](#dm-6-nuclear-determinant) live on compact `F`-vector spaces.
- Multiple zeta values in positive characteristic and the Zagier–Hoffman and Thakur basis conjectures are given downstream by DrinfeldModulesAndTModulesPartII, which builds on the difference-equation theory of DM.8, in particular [§8.51](#dm-8-constant-denominator).

## Conventions

- **The coefficient ring.** `F` is a finite field with `q = p^m` elements. `C` is a smooth projective geometrically connected curve over `F` with a closed point `∞` of degree `δ`, `A = Γ(C − ∞, 𝒪_C)` and `K_0 = Frac(A)`. For nonzero `a ∈ A`, `deg_A(a) = −δ·ord_∞(a) = log_q #(A/(a))`. In the polynomial case `A = F[t]`. A coefficient algebra is an `F`-algebra `R` with an `F`-algebra map `γ : A → R`, the characteristic map; its characteristic is `ker γ`, and generic characteristic means `γ` injective. Over `F[t]` write `θ = γ(t)`: the letter `t` is the variable of `A` and `θ` its image.
- **Twisted polynomials.** `R{τ}` is the ring of twisted polynomials with `τc = c^q τ`; it is Mathlib's `SkewPolynomial R` for the action of `ℕ` by iterates of `c ↦ c^q` (`frobeniusAction`), written `OrePolynomial F R` in the suggested file, with `OrePolynomial.tau`, `OrePolynomial.C` and the rule `OrePolynomial.tau_mul_C`. It acts on `R` by q-linearized polynomials and multiplication is composition. The differential `∂f` of `f ∈ R{τ}` is its `τ⁰`-coefficient. Evaluation on the points of a finite field need not be faithful, so identities of twisted polynomials or of group-scheme maps are never replaced by equalities of functions on one finite set of points.
- **Inverse twists and dual motives.** On a perfect coefficient field `σ(c) = c^(1/q)`. On power series and matrices `σ` acts coefficientwise and fixes the variable `t`, and `f^(n) = σ^(−n)(f)` is the `n`-fold coefficient q-Frobenius; twisting never substitutes `t^q` for `t`. The ring `L[t, σ]` has `σc = c^(1/q)σ` and `σt = tσ`. The star map sends `Σ a_i τ^i` to `Σ a_i^(1/q^i) σ^i` and reverses products; on matrices it also transposes.
- **Variance.** The τ-motive of a t-module `E` is contravariant: `M(E) = Hom(E, G_a)` as `F`-module schemes, with `A` acting through `E` and `τ` by q-Frobenius on values. The dual motive of a coordinate t-module is the row module `L[σ]^(1×d)`, and an intertwiner `U` induces `h ↦ hU^∗`, so the dual construction is covariant.
- **Analytic normalizations.** `C_∞` is the completion of an algebraic closure of the completion `K_∞` of `K_0` at `∞`, with `|a| = q^(deg_A a)`; for `F[θ]` this gives `|θ| = q`. The Carlitz module is `C_t = θ + τ`. Its exponential is `exp_C(z) = Σ z^(q^i)/D_i`, entire, and its logarithm `log_C(z) = Σ z^(q^i)/ℓ_i` converges exactly on `|z| < q^(q/(q−1))`, where it inverts `exp_C`. Fix `ρ` with `ρ^(q−1) = −θ`. The period `π_BP = θρ ∏_(i≥1) (1 − θ^(1−q^i))^(−1)` generates `ker exp_C` as an `F[θ]`-module and has `|π_BP| = q^(q/(q−1))`; Ngo Dac's normalization is `π_ND = −π_BP`. The Anderson–Thakur function `Ω(t) = ρ^(−q) ∏_(i≥1) (1 − t/θ^(q^i))` satisfies the twisted equation `Ω^(−1) = (t − θ)Ω` and `1/Ω(θ) = −π_BP`; the exponent `(−1)` on a function always denotes the twist, never the reciprocal. Papanikolas's period `π̃ = −1/Ω(θ)`, used throughout DM.8, is therefore `π_BP`. Two-term witness: for `q = 2` one has `ρ = θ`, `|π_BP| = 4`, and `π_BP = (θ² + θ)·log_C(1)` ([§6.13](#dm-6-carlitz-class-examples)).
- **Difference equations.** In DM.8, `𝕋` is the radius-one restricted power series ring in `C_∞[[t]]`, `𝕃` its fraction field, `𝔼` the ring of entire series whose coefficients are algebraic over `k = F_q(θ)` and generate a finite extension of `k_∞ = F_q((1/θ))`, and `K = k̄(t)`. For a pre-t-motive with basis column `m`, `σ(m) = Φm`; a fundamental matrix satisfies `σ(Ψ) = ΦΨ`, its columns span the solutions of the vector equation, and `Ψ^(−1)m` is a basis of the Betti realization. The difference torsor is built from `Ψ₁^(−1)Ψ₂` with right multiplication.
- **Two notations for the polynomial case.** Layers DM.0–DM.7 write `F` for the finite field and `θ = γ(t)`. Layer DM.8 follows Papanikolas: `A = F_q[θ]` and `k = F_q(θ)` are coefficient rings inside `C_∞`, `t` is an independent variable, and the constant field of the difference equations is `F_q(t)`. The two readings agree through `γ`.
- **The semilinear setting (S).** Several statements of DM.8 and [§1.3](#dm-1-semilinear-lang) are about the following data: fields `F` and `L` with `L` an `F`-algebra; an `L`-vector space `V`, also an `F`-vector space through a scalar tower; an `F`-algebra automorphism `σ` of `L`; and an `F`-linear endomorphism `f` of `V` with `f(a·v) = σ(a)·f(v)`. No perfection, characteristic, finiteness or invertibility of `f` is assumed unless stated (`IsSemilinear`). *Exact constants* means that `σ(a) = a` holds exactly for `a` in the image of `F` (`HasExactConstants`).
- **Hypotheses are explicit.** Rank, generic characteristic, abelianness, `A`-finiteness, purity, uniformizability and rigid analytic triviality are separate conditions, stated wherever they are used. Not every t-module is abelian or uniformizable, and not every pre-t-motive is rigid analytically trivial.

## Exact supplier contracts

### From Mathlib (pinned at `082e2d37e8`)

- `SkewPolynomial R` with its ring structure for an action `MulSemiringAction (Multiplicative ℕ) R`, `SkewPolynomial.X`, `SkewPolynomial.C`, `SkewPolynomial.coeff`, `SkewPolynomial.support`; `FiniteField.frobeniusAlgHom` (the `F`-algebra endomorphism `x ↦ x^q` of an `F`-algebra); `iterateFrobeniusEquiv`; `Polynomial.eval₂RingHom'`, `Polynomial.aeval`.
- `PowerSeries.IsRestricted` and `PowerSeries.IsRestricted.subring`, `PowerSeries.map`, `RatFunc`; `NormedField`, `IsUltrametricDist`, `UniformSpace.Completion` with `NormedField.instCompletableTopField`, `spectralNorm`; `tsum`, `tprod`.
- `LinearMap.fixedSubmodule`, `LinearMap.mem_fixedSubmodule_iff`, `LinearMap.liftBaseChange`, `Module.Basis.baseChange`, `Module.finrank_baseChange`, `LinearMap.finrank_le_finrank_of_injective`, `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`, `linearIndependent_iff'`, `linearIndependent_finSucc`, `linearIndependent_iff_finset_linearIndependent`, `LinearIndependent.finite`, `Submodule.mem_span_range_iff_exists_fun`.
- `LinearMap.charpoly`, `Matrix.det`, `Matrix.GeneralLinearGroup`, `Algebra.adjoin`, `IntermediateField.adjoin`, `MvPolynomial.aeval`, `AlgebraicIndependent`, `Algebra.trdeg`, `Algebra.IsGeometricallyReduced`, `CommHopfAlgCat`, `Algebra.TensorProduct.includeLeft/includeRight`, `AlgebraicGeometry.Spec`, `AlgebraicGeometry.IsClosedImmersion.spec_of_surjective`.
- `AlgebraicGeometry.Scheme.Modules`, `AlgebraicGeometry.Scheme.Modules.pullback`, `SheafOfModules.IsLocallyFree`, `SheafOfModules.IsFinitePresentation`.

### From Tau Ceti

- Pinned (`f790474`): `TauCeti.AdditiveGroup.gaPointsMulEquiv` (the points of `G_a`), `TauCeti.CommHopfAlgCat.kernelSpec` (kernels of Hopf-algebra maps as group schemes), `TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced` (a geometrically reduced commutative Hopf algebra of finite type over a field is smooth).
- Current library: `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, `TauCeti.fittingIdeal_baseChange`; the restricted-series Gauss norm (`TauCeti.PowerSeries.norm_eq_gaussNorm`), Weierstrass preparation with uniqueness (`TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`), the unit criterion and `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`. These are cited where used and are not at the pin.

### From TauCetiRoadmap roadmaps

- **AlgebraicCurves.** Layer 2 (*affine models — the Dedekind bridge*): finite normalization over `F[t]`, the Dedekind affine ring of a curve minus a point and the place/prime dictionary. Layer 3 (*divisors, `L(D)`, Riemann's theorem, and the genus*): divisors, Riemann–Roch spaces, the product formula `deg (f)_0 = deg (f)_∞`, and the divisor/fractional-ideal comparison. Layer 5 (*consequences of Riemann–Roch, and local components*): completions of the local rings at places with their residue fields and uniformizers. Layer 12 (§12E): `H⁰(X, 𝒪_X(D)) = L(D)`. The formula `deg_A(a) = −δ·ord_∞(a) = dim_F A/(a)` follows from the product formula and the fractional-ideal comparison.
- **JacobianChallenge.** Layer A (line bundles, divisors, degree), Layer B (coherent cohomology over a field, Riemann–Roch `χ(L) = deg L + 1 − g`, Serre duality), Layer C (coherent higher direct images under proper maps, flat base change, semicontinuity, and local freeness of `f_∗F` when `H¹` vanishes on fibres of a relative curve).
- **AlgebraicVectorBundles.** L0B (quasi-coherent and finite locally free sheaves, invertible sheaves), L1A–L1B (relative `Spec` and its anti-equivalence with quasi-coherent algebras), L2B (geometric vector bundles: the total space of a locally free sheaf and its section-valued universal property).
- **SchemeAndStackFoundations.** §0.3 (Proj, base change and the relative Proj), §0.7 (dimension theory of schemes of finite type over a field: `dim X = trdeg` of the function field, invariance under field extension), §0.20 (Japanese and Nagata rings: finiteness of normalization), §0.21 (excellent rings), §1.1 (fpqc descent of quasi-coherent modules; with AlgebraicVectorBundles L1A–L1B this descends affine morphisms), §1.13 and §1.15 (group algebraic spaces, actions and torsors), §1.17 (quotients by finite groups, `finiteGroupQuotient_projective`: a finite group acting on a projective scheme over a Noetherian base has a projective quotient with a descended ample line bundle), §1.23 (fine and coarse moduli, coarse spaces of finite quotient stacks), §§2.3, 2.6, 2.9–2.10 (torsors and `H¹`, quasi-coherent cohomology and Serre vanishing for ample bundles, the sheaf `𝔾_a` and the comparison of Zariski, étale and fppf cohomology of quasi-coherent sheaves; in particular `H¹_fppf(Spec F, 𝔾_a) = 0` for every field `F`), §2.11 (Hilbert 90), §2.15 (étale cohomology of a field is Galois cohomology), §3.2 (degree bounds for line bundles on curves), §§4.1 and 4.3 (formal smoothness, the infinitesimal lifting criterion and deformation functors).
- **RestrictedPowerSeries.** Layer 1 (Gauss norms, completeness, radius change), §3.2 (units of restricted algebras: a nonzero series over a field is a unit exactly when its constant coefficient is its unique dominant coefficient), §4.3 (Weierstrass preparation and normalization), §§5.1–5.2 (Weierstrass polynomials; `𝕋_n` is a Noetherian factorial Jacobson ring whose maximal ideals are generated by polynomials), §7.2 (entire series: closure, evaluation, completeness, division by polynomials).
- **NewtonPolygons.** §1.3 (the spectral norm on algebraic extensions of a complete field and the value group of the completion), §2.2 (Gauss norms as supporting values of the Newton polygon), §4.3 (analytic multiplicity and exact zero counts in closed and open discs over a complete algebraically closed extension), §5.3 (entire factorisation: a nonzero entire series is the product `∏(1 − X/α)` over its zeros, finitely many in each bounded disc; a family with finitely many members in each bounded ball is the zero divisor of an entire product; entire units are constants).
- **StableReduction.** Layer 0 (operations on relative curves and DVR extensions), through the current Tau Ceti Fitting-ideal declarations listed above.

### From other roadmaps

- **FiniteFieldsAndCharacterSums**, shared linearized polynomials (its targets *frobenius-ore-polynomial-comparison*, *linearized-polynomial-eval-linear*, *linearized-polynomial-separable-iff*, *subspace-polynomial-is-linearized*): for `F` with `q` elements and a commutative `F`-algebra `R`, the additive bijection `Σ a_i τ^i ↦ Σ a_i X^(q^i)` from `R{τ}` onto q-linearized polynomials, carrying multiplication to composition; the `F`-linearity of evaluation in any commutative `R`-algebra; over a field, separability of a nonzero q-linearized polynomial exactly when its `X`-coefficient is nonzero, with `q^(deg_τ)` distinct roots after splitting; and, for a finite `F`-subspace `U` of a field, the q-linearity of `∏_(u∈U) (X − u)`, of q-degree `dim_F U`.
- **ReductiveGroupsPartII.** RG2.3.7 (*lang-theorem*): for a smooth connected group `H` over `F`, the Lang map `g ↦ g^(−1)F(g)` is finite étale and surjective; RG2.0a.2: Weil restriction of group schemes along finite locally free maps, used for `Res_(A/a | F) GL_r`.
- **MotivesAndAlgebraicCycles**, Layer 6: §6.1–§6.2 (for a neutral Tannakian category `(𝒞, ω)` over any field `k`, `Aut^⊗(ω)` is an affine group scheme and `𝒞 ≃ Rep(Aut^⊗(ω))`), §6.3 (the group is of finite type exactly when one object tensor-generates; for a tensor functor `U : 𝒟 → 𝒞` with compatible fibre functors, `G_𝒞 → G_𝒟` is faithfully flat exactly when `U` is fully faithful with image closed under subobjects, and a closed immersion exactly when every object of `𝒞` is a subquotient of an object in the image).
- **FunctionFieldArithmetic.** §2.1 (divisor lattices: a global function field is discrete and cocompact in its adeles). Exact constants use AlgebraicCurves Layer 0, and completions and place degrees use Layer 5; no degree-one divisor is required for the chosen `∞`.

## How to read the build

The layers are labelled DM.0–DM.8 and are presented in build order: DM.0, DM.2, DM.4, DM.1, DM.3, DM.5, DM.6, DM.7, DM.8. Targets are numbered `k.n` after their layer label DM.k. Layer DM.0 is the algebra of Drinfeld modules over fields and families. Layer DM.2 is the analytic theory over `C_∞` and fixes the Carlitz normalizations used in DM.6 and DM.8; it depends only on DM.0. Layer DM.4 introduces t-modules and their motives, which the torsion theory needs: Layer DM.1 describes ideal torsion through finite shtukas attached to the motive, so it follows DM.4. Layer DM.3 (moduli and modular forms) uses torsion and level structures. Layer DM.5 (the Tate theorem) uses torsion and motives. Layer DM.6 (Taelman's class formula) needs only DM.0 and DM.2 and can be read directly after them. Layer DM.7 uses motives, torsion and the Tate realization. Layer DM.8 uses DM.2 and DM.4 and is the transcendence part; its first group of targets is linear algebra that needs nothing else. A reader interested only in the transcendence of Carlitz logarithms can read DM.0, DM.2, DM.4 and DM.8.

## Layer DM.0: Drinfeld modules, relative families and Carlitz arithmetic

A Drinfeld module over a field is an `F`-algebra map `φ : A → L{τ}` whose differential is the characteristic map and which is not the scalar map. The general rank theorem shows that `deg_τ φ_a = r·deg_A(a)` for a unique integer `r ≥ 1`, without assuming that `∞` is rational; it is proved before rank is used for torsion or moduli. Over an arbitrary `F`-algebra the module lives on a line bundle, and a linear change of frame is distinguished from the nonlinear standardization needed over nonreduced bases. The Carlitz module and its products `D_i` and `ℓ_i` fix the conventions used by every subsequent layer.

<a id="dm-0-drinfeld-module"></a>

### 0.1 Drinfeld modules (`DrinfeldModule`)

**Definition.** Let `L` be a field with an `F`-algebra structure and a characteristic map `γ : A → L`. Here `F` is the exact constant field of `K_0`, since `C` is geometrically connected. A Drinfeld `A`-module over `L` is an `F`-algebra map `φ : A → L{τ}`, `a ↦ φ_a`, with `∂φ_a = γ(a)` for every `a`, which is not the scalar map `a ↦ γ(a)τ⁰`. Its characteristic is `ker γ`; it has generic characteristic when `γ` is injective. Through the identification of `L{τ}` with `F`-linear endomorphisms of the additive group (FiniteFieldsAndCharacterSums, *frobenius-ore-polynomial-comparison*), `φ` is an action of `A` on `G_a` over `L`, natural in the commutative `L`-algebra of values. The rank is not part of the definition: [§0.3](#dm-0-rank-general) produces it.

- `DrinfeldModule.toRingHom`: the ring map `A → L{τ}`, compatible with `F`.
- `DrinfeldModule.coeff_zero`: `∂φ_a = γ(a)`.
- `DrinfeldModule.charIdeal`: `ker γ`.
- `DrinfeldModule.baseChange`: extension of scalars along an `F`-algebra map of fields `L → L'` (applied coefficientwise) gives a Drinfeld module over `L'` with characteristic map the composite; identity and composition laws hold.
- `DrinfeldModule.ext`: for fixed `L` and `γ`, two Drinfeld modules with the same `φ_a` for every `a` are equal.

*Construction.* Bundle the ring map, its compatibility with `F`, the differential condition and the non-scalar condition. The point action on a commutative `L`-algebra `B` evaluates `φ_a` as a q-linearized polynomial, which is `F`-linear by FiniteFieldsAndCharacterSums *linearized-polynomial-eval-linear*. (BP, §2.3, p. 5; Har, Definition 3.7, p. 10, for the non-scalar condition.) *Needs:* FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*, *linearized-polynomial-eval-linear*; Mathlib `SkewPolynomial`, `RingHom.ker`.

**Checks.**

- For `C_t = θ + τ` over `F[t]`, the point action is `C_t(x) = θx + x^q`, and `∂C_a = a(θ)`.
- The scalar map `a ↦ γ(a)τ⁰` satisfies the differential condition but fails the non-scalar condition.
- Over `L = F` with `γ(t) = 0`, `φ_t = τ` is a Drinfeld module of characteristic `(t)`, although `φ` itself is injective; the characteristic is the kernel of `γ`, not of `φ`.

<a id="dm-0-rank-polynomial-ring"></a>

### 0.2 Rank over the polynomial ring (`DrinfeldModule.natDegree_eq_rank_mul`)

**Theorem.** Let `A = F[t]` and `φ_t = θ + g_1τ + ⋯ + g_rτ^r` with `g_r ≠ 0` and `r ≥ 1`, over a field `L`. Every nonzero `a ∈ F[t]` satisfies `deg_τ φ_a = r·deg_t a`, and if `d = deg a` the leading coefficient of `φ_a` is `lc(a)·g_r^(1 + q^r + ⋯ + q^(r(d−1)))`, the exponent being `0` when `d = 0`.

Also prove `OrePolynomial.existsUnique_rightDivRem`: for `f ≠ 0` and any `g ∈ L{τ}`, there are unique `Q, R` with `g = Qf + R` and either `R = 0` or `deg_τ R < deg_τ f`. This holds over every coefficient field `L`, including imperfect fields. Cancel a leading term by `cτ^n f`, using the inverse of the nonzero coefficient `(lc f)^(q^n)`; induction lowers the degree. Uniqueness uses degree additivity. No inverse Frobenius is needed for this direction of division. (BP, §4.2, p. 16.)

*Proof sketch.* Write `φ_a = a(φ_t)`. In `L{τ}` the leading coefficient of a product is `(lc f)·(lc g)^(q^(deg f))`, so the leading coefficient of `φ_t^d` is `g_r^(1 + q^r + ⋯ + q^(r(d−1)))` and its degree is `rd`. Lower powers of `φ_t` have smaller degree, so no cancellation occurs in the top degree; a field has no zero divisors. (BP, §2.3, p. 5.) *Needs:* [§0.1](#dm-0-drinfeld-module); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*; Mathlib `Polynomial.aeval`.

**Checks.**

- Division by `1` has remainder zero: the remainder condition must include `R = 0`, since its natural degree is zero.
- Dividing `τC(c)` on the right by `τ` gives quotient `C(c^q)` and zero remainder; the opposite quotient would violate `τc = c^qτ` when `c^q ≠ c`.
- The divisor `f = 0` is excluded: if `g = 0`, every quotient with zero remainder would satisfy the equation, violating uniqueness.
- For nonzero constants `c ∈ F`, `φ_c = c` has degree zero and leading coefficient `c`.
- For `C_t = θ + τ` and `a = t²`, `C_(t²) = θ² + (θ + θ^q)τ + τ²`: degree two, leading coefficient one.

<a id="dm-0-rank-general"></a>

### 0.3 The general rank theorem (`DrinfeldModule.exists_rank`)

**Theorem.** Let `A = Γ(C − ∞, 𝒪_C)` with `δ = deg ∞` arbitrary, and let `φ` be a Drinfeld `A`-module over a field `L`. There is a unique integer `r ≥ 1` with `deg_τ φ_a = r·deg_A(a)` for every nonzero `a ∈ A`, where `deg_A(a) = −δ·ord_∞(a) = log_q #(A/(a))`. A rational `∞` is not assumed, and the integrality of `r` is part of the assertion.

*Proof sketch.* Since `L{τ}` is a domain and `deg_τ` is additive, `a ↦ −deg_τ φ_a` extends to a discrete valuation of `K_0` that is nonpositive on `A`; it is centred at `∞`, the only place not over `A`, so `deg_τ φ_a = c·deg_A(a)` for a rational `c > 0`. To see that `c` is an integer, let `A ⊗_F L` act on `M = L{τ}` by `L` on the left and `A` on the right through `φ`. For a nonconstant `a`, the right division theorem of [§0.2](#dm-0-rank-polynomial-ring) shows that `M` is free of rank `deg_τ φ_a` over the commutative polynomial ring `L[T]`, where `T` acts by right multiplication by `φ_a`. Scalar multiplication by `L` is on the left; this is not the subring generated inside the noncommutative Ore ring. Since `A ⊗_F L` is finite over `L[T]`, `M` is finitely generated over it, and the nonzero norm of a nonzero element shows torsion-freeness. This is a Dedekind domain; it is therefore projective of some rank `r`, and `dim_L M/Mφ_a = r·dim_F A/(a)`, which gives `deg_τ φ_a = r·deg_A(a)`. The degree identity `deg_A(a) = −δ·ord_∞(a) = dim_F A/(a)` comes from the product formula of AlgebraicCurves Layer 3. (Har, Lemma 1.4, p. 4, Definition 3.7 and Theorem 3.9, pp. 10–12; BP, §4.2, p. 16.) *Needs:* [§0.1](#dm-0-drinfeld-module); [§0.2](#dm-0-rank-polynomial-ring) (right division); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*; AlgebraicCurves Layers 2, 3 and 5.

**Checks.**

- For `A = F[t]` this recovers [§0.2](#dm-0-rank-polynomial-ring) with `r = deg_τ φ_t`.
- The degree of `a` depends on `δ`: at a point `∞` of degree `δ`, using `−ord_∞(a)` alone gives `δr` instead of `r`.
- The valuation argument alone gives a rational proportionality factor; the module rank is what makes it an integer.

<a id="dm-0-rank"></a>

### 0.4 The rank invariant (`DrinfeldModule.rank`)

**Definition.** The rank of a Drinfeld module over a field is the integer `r` of [§0.3](#dm-0-rank-general), normalized by `log_q #(A/(a))`. Over `F[t]` it is `deg_τ φ_t`. In a relative family ([§0.9](#dm-0-relative-drinfeld-module)) it is the locally constant function given by the fibres.

- `DrinfeldModule.rank`: the integer `r` with `deg_τ φ_a = r·deg_A(a)`.
- `DrinfeldModule.rank_pos`: `0 < rank φ`; over `F[t]` this is `DrinfeldModule.natDegree_X_pos`.
- `DrinfeldModule.rank_baseChange`: `rank(baseChange φ) = rank φ`.

*Construction.* Use the uniqueness in [§0.3](#dm-0-rank-general); field extension preserves nonzero leading coefficients and hence the degree formula. (Har, Definition 3.7, p. 10.) *Needs:* [§0.3](#dm-0-rank-general); [§0.2](#dm-0-rank-polynomial-ring).

**Checks.**

- `rank(C) = 1` for the Carlitz module.
- `rank(φ_t = τ²) = 2` over `F`.
- At a point `∞` of degree `δ > 1`, normalizing by `−ord_∞` alone yields `δr`, which is the wrong invariant.

<a id="dm-0-carlitz-module"></a>

### 0.5 The Carlitz module (`carlitz`)

**Definition.** For a field `L` over `F` and `θ ∈ L`, the Carlitz module is the Drinfeld `F[t]`-module with `C_t = θ + τ`, for the characteristic map `t ↦ θ`. Its rank is one, `C_t` acts by `x ↦ θx + x^q`, and it has generic characteristic exactly when `θ` is transcendental over `F`.

- `carlitz`: the Drinfeld module with `C_t = θ + τ`.
- `carlitz_toRingHom_X`: `C_t = θ + τ`.
- `carlitz_rank`: `rank C = 1`.
- `carlitz_coeff_zero`: `∂C_a = a(θ)`.

*Construction.* Evaluate polynomials in `t` at `θ + τ` in the noncommutative ring `L{τ}`: this is a ring map because `θ + τ` commutes with the constants `F`, which are fixed by the q-power map. The constant coefficient is evaluation at `θ`; degree one proves the non-scalar condition. (BP, §2.2, pp. 3–5.) *Needs:* [§0.1](#dm-0-drinfeld-module); [§0.2](#dm-0-rank-polynomial-ring); Mathlib `Polynomial.eval₂RingHom'`.

**Checks.**

- `C_(t²) = θ² + (θ + θ^q)τ + τ²`.
- At `θ = 0`, `C_t = τ` and `C[t] = Spec L[X]/(X^q)`, a connected group scheme of order `q`.
- The `τ`-coefficient of `C_(t²)` is `θ + θ^q`, not `2θ` unless `θ^q = θ`: `τ` and `θ` do not commute.

<a id="dm-0-drinfeld-module-hom"></a>

### 0.6 Morphisms and isogenies (`DrinfeldModule.Hom`)

**Definition.** For Drinfeld modules `φ`, `ψ` over the same `(L, γ)`, `Hom(φ, ψ)` is the set of `u ∈ L{τ}` with `u φ_a = ψ_a u` for every `a ∈ A`. It is an `A`-module through `a·u = ψ_a u = u φ_a`, and composition is multiplication in `L{τ}`. An isogeny is a nonzero morphism; an isomorphism is a nonzero constant `u = c ∈ L^×`. `End(φ)` is an `A`-algebra, which can be noncommutative in special characteristic.

- `DrinfeldModule.Hom`: the intertwiners, as an additive subgroup of `L{τ}` with its `A`-module structure.
- `DrinfeldModule.Hom.id`, `DrinfeldModule.Hom.comp`, `DrinfeldModule.Hom.comp_assoc`: identity `1`, composition `v ∘ u = vu`, associativity and unit laws.
- `DrinfeldModule.Hom.smul`: `a·u = ψ_a u`.
- `DrinfeldModule.isogeny_iff`: over a field, `u` is an isogeny exactly when `u ≠ 0`.
- `DrinfeldModule.Hom.ext`: morphisms with the same twisted polynomial are equal.

*Construction.* Take the simultaneous equalizer of the intertwining equations; it is closed under addition and under the `A`-action by commutativity of `A`. Units of `L{τ}` are the nonzero constants because degrees add. (BP, §2.3, p. 5, and §2.4, pp. 6–7.) *Needs:* [§0.1](#dm-0-drinfeld-module); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*.

**Checks.**

- `1 ∈ Hom(φ, φ)`.
- For `c ≠ 0`, `c ∈ Hom(φ, ψ)` exactly when `ψ_a = c φ_a c^(−1)` for all `a`.
- For `φ_t = τ²` over `F_(q²)`, both `τ` and every constant of `F_(q²)` are endomorphisms, and `τ·c = c^q·τ` shows they need not commute.

<a id="dm-0-isogeny-rank"></a>

### 0.7 Rank invariance and separability of isogenies (`DrinfeldModule.rank_eq_of_isogeny`)

**Theorem.** Let `u : φ → ψ` be a nonzero morphism of Drinfeld modules over a field with the same characteristic map. Then `rank φ = rank ψ`; the kernel of `u` has order `q^(deg_τ u)` as a group scheme, and it is étale exactly when `∂u ≠ 0`. In generic characteristic every nonzero morphism has `∂u ≠ 0`; in special characteristic a Frobenius isogeny can have `∂u = 0`.

*Proof sketch.* Compare `τ`-degrees in `u φ_a = ψ_a u`. The derivative of the q-linearized polynomial of `u` is `∂u`, so the separability criterion of FiniteFieldsAndCharacterSums gives étaleness. If `u = Σ_(i≥j) u_iτ^i` with `u_j ≠ 0` and `j > 0`, comparing `τ^j`-coefficients in `u φ_a = ψ_a u` gives `γ(a)^(q^j) = γ(a)` for every `a`, impossible when `γ(A)` is infinite. (Har, Lemma 3.8(b), p. 10, Corollaries 5.11 and 5.17, pp. 20 and 23.) *Needs:* [§0.6](#dm-0-drinfeld-module-hom); [§0.4](#dm-0-rank); FiniteFieldsAndCharacterSums *linearized-polynomial-separable-iff*.

**Checks.**

- `τ : (φ_t = τ²) → (φ_t = τ²)` over `F` is an isogeny with `∂τ = 0`, so it is inseparable.
- A nonzero constant has degree zero and trivial kernel.

<a id="dm-0-kernel-scheme"></a>

### 0.8 Kernels of isogenies (`DrinfeldKernel`)

**Definition.** For a nonzero morphism `u` with q-linearized polynomial `P_u ∈ L[X]`, the kernel `ker u = Spec L[X]/(P_u)` is the closed subgroup scheme of `G_a` with its inherited `A`-action; it is the kernel of the Hopf-algebra map of `u` in the sense of Tau Ceti. Its coordinate algebra is free of rank `q^(deg_τ u)` over `L`, and its geometric points alone need not determine it.

- `DrinfeldKernel.coordinateAlgebra`: `L[X]/(P_u)`.
- `DrinfeldKernel.points`: for an `L`-algebra `B`, the points are the `x ∈ B` with `P_u(x) = 0`.
- `DrinfeldKernel.baseChange`: kernel formation commutes with extension of the coefficient field.

*Construction.* The additive group-scheme endomorphism attached to `u` has comultiplication-compatible coordinate map `X ↦ P_u(X)`; `P_u` is additive, so `(P_u)` is a Hopf ideal and Tau Ceti's kernel construction applies. Dividing by the invertible leading coefficient gives the basis `1, X, …, X^(q^d − 1)`, `d = deg_τ u`. The kernel of the zero map is `G_a` itself and is not finite. (Har, Definition 5.1, p. 15, and §6, pp. 23–24.) *Needs:* [§0.6](#dm-0-drinfeld-module-hom); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*; Tau Ceti `TauCeti.CommHopfAlgCat.kernelSpec`, `TauCeti.AdditiveGroup.gaPointsMulEquiv`.

**Checks.**

- `ker c = Spec L` for a nonzero constant `c`.
- `ker τ² = Spec L[X]/(X^(q²))`: order `q²`, one geometric point.
- At `θ ≠ 0`, `ker C_t` has order `q` and is étale; scheme order and the number of geometric points agree only in the étale case.

<a id="dm-0-relative-drinfeld-module"></a>

### 0.9 Relative Drinfeld modules (`RelativeDrinfeldModule`)

**Definition.** Let `S` be a scheme over `A` (through `γ`). A Drinfeld module of rank `r ≥ 1` over `S` is an invertible sheaf `ℰ` on `S` together with a ring map `φ : A → End_F(G_ℰ)` to the `F`-linear endomorphisms of the additive group of `ℰ`, with differential `γ`, such that on every open where `ℰ` is trivialized `φ_a = Σ_i b_i(a)τ^i` with `b_i(a) = 0` for `i > r·deg_A(a)` and `b_(r·deg_A a)(a)` a unit, for every nonzero `a`. A change of linear frame by `u ∈ 𝒪_S^×` sends `b_i` to `u^(1−q^i) b_i`, so `b_i` is a section of `ℰ^(⊗(1−q^i))`. The rank can vary between open and closed components of `S`. The invertible sheaf and its geometric vector bundle are those of AlgebraicVectorBundles L0B and L2B.

- `RelativeDrinfeldModule.pullback`: pullback of `ℰ` and `φ` along a morphism of `A`-schemes.
- `RelativeDrinfeldModule.coeff_changeFrame`: `b_i` becomes `u^(1−q^i) b_i` under a frame change by `u`.
- `RelativeDrinfeldModule.rank_fiber`: the rank of each geometric fibre is the given locally constant rank.
- `RelativeDrinfeldModule.ext`: on a fixed invertible sheaf, two actions agree when their restrictions to every affine open agree for every `a ∈ A`.

*Construction.* Glue the local twisted-polynomial actions with the transformation law of the coefficients, and check that the degree and unit conditions do not depend on the linear frame. Descent of the line bundle along fpqc covers uses SchemeAndStackFoundations §1.1 and Hilbert 90 (§2.11) to pass from fpqc to Zariski trivializations. (Pin, Definitions 3.1–3.2, p. 10, Proposition 3.4, pp. 11–12, and Definition 3.5, p. 12; Har, Theorem 3.9, pp. 10–12.) *Needs:* FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*; AlgebraicVectorBundles L0B, L2B; SchemeAndStackFoundations §§1.1, 2.11.

**Checks.**

- Over `S = Spec L` with `ℰ = 𝒪`, this is the field definition with its rank.
- `φ_t = θ + sτ` over `F[θ, s]` fails the unit condition at `s = 0`, so it is not a rank-one family over the whole base.
- For `C_t = θ + τ`, a frame change by `u` gives `θ + u^(1−q)τ`.

<a id="dm-0-relative-standardization"></a>

### 0.10 Standardization over nonreduced bases (`RelativeDrinfeldModule.standardize`)

**Theorem.** Fix a rank `r ≥ 1` ([§0.9](#dm-0-relative-drinfeld-module)). Over an affine `A`-scheme `Spec R`, call an action on `G_(a,R)` *quasi-standard* if, for every nonzero `a`, the coefficients `b_i(a)` with `i > r·deg_A(a)` are nilpotent and `b_(r·deg_A a)(a)` is a unit. Every quasi-standard action is conjugate to a standard one (no coefficients above degree `r·deg_A(a)`) by a unique additive coordinate change `u = 1 + Σ_(i≥1) u_iτ^i` with nilpotent `u_i`. Between standard forms, every invertible intertwining coordinate change is a constant. Consequently the definition of [§0.9](#dm-0-relative-drinfeld-module) agrees with the definition allowing nilpotent higher coefficients, and transition maps between standard trivializations are linear frames.

*Proof sketch.* Hartl attributes the existence and uniqueness of `u` to Drinfeld and Matignon; it follows by induction on the nilpotence order of the ideal generated by the higher coefficients, solving for `u` one coefficient at a time modulo successive powers of that ideal. For a standard intertwiner compare top coefficients in the commutation relation, as in Hartl's Lemma 3.8(b). Constant transition cocycles define the invertible sheaf by descent. (Har, Definition 3.7 and Lemma 3.8, p. 10, Theorem 3.9, pp. 10–12.) *Needs:* [§0.9](#dm-0-relative-drinfeld-module); SchemeAndStackFoundations §1.1.

**Checks.**

- Over the dual numbers `L[ε]`, `(1 + ετ)` conjugates the standard Carlitz family to a quasi-standard family with a nonzero `ετ²`-term; the conjugation is not a linear frame.
- Over a reduced `R`, quasi-standard and standard coincide.
- Every invertible intertwiner between standard forms is a constant unit; an arbitrary constant unit need not intertwine them.

<a id="dm-0-carlitz-products"></a>

### 0.11 Carlitz denominator products (`carlitzD`, `carlitzEll`)

**Definition.** For `A = F[θ]` put `[i] = θ^(q^i) − θ`, `D_0 = ℓ_0 = 1`, `D_i = ∏_(j=0)^(i−1) (θ^(q^i) − θ^(q^j))` and `ℓ_i = ∏_(j=1)^(i) (θ − θ^(q^j))`. Then `D_i = [i]·D_(i−1)^q` and `ℓ_i = −[i]·ℓ_(i−1)` for `i ≥ 1`. These are identities in any commutative `F`-algebra with an element `θ`; the inverses of `D_i` and `ℓ_i` exist when `θ` is transcendental over `F`.

- `carlitzBracket`: `[i] = θ^(q^i) − θ`.
- `carlitzD`: `D_i`, with `D_0 = 1`.
- `carlitzEll`: the signed product `ℓ_i`, with `ℓ_0 = 1`.
- `carlitzD_succ`: `D_(i+1) = [i+1]·D_i^q`.
- `carlitzEll_succ`: `ℓ_(i+1) = −[i+1]·ℓ_i`.

*Construction.* Expand the products and use that `x ↦ x^q` is a ring map in characteristic `p`. The sign of `ℓ_i` is kept distinct from the unsigned product of the brackets. (ND, §2.2, p. 7, and §4.2, p. 17.) *Needs:* [§0.5](#dm-0-carlitz-module); Mathlib `FiniteField.frobeniusAlgHom`.

**Checks.**

- `D_0 = ℓ_0 = 1` and `[0] = 0`.
- `D_1 = θ^q − θ`, `D_2 = (θ^(q²) − θ)(θ^(q²) − θ^q)`.
- `ℓ_1 = θ − θ^q = −D_1`, which differs from `D_1` in odd characteristic.

### Examples

- The Carlitz module over `F(θ)` has rank one, generic characteristic, and `End(C) = F[t]`. Over `F` with `θ = 0` the module `C_t = τ` has characteristic `(t)`, and every `t`-power torsion group scheme `Spec F[X]/(X^(q^n))` is connected.
- `φ_t = τ²` over `F_(q²)` is a rank-two module of characteristic `(t)` whose endomorphism ring contains the noncommuting elements `τ` and `F_(q²)`.

### Dependencies

Mathlib (`SkewPolynomial`, polynomial evaluation, `FiniteField.frobeniusAlgHom`); Tau Ceti (kernels of Hopf-algebra maps, the points of `G_a`); FiniteFieldsAndCharacterSums (shared linearized polynomials); AlgebraicCurves Layers 2, 3 and 5; AlgebraicVectorBundles L0B, L2B; SchemeAndStackFoundations §§1.1, 2.11.

## Layer DM.2: Analytic uniformization and period conventions

This layer works over the completed algebraic closure `C_∞` of `K_∞`. Lattices in `C_∞` give entire `F`-linear exponentials, and every Drinfeld module over `C_∞` of generic characteristic comes from a unique lattice; morphisms correspond to scalars. The Carlitz exponential, logarithm, period and the Anderson–Thakur function `Ω` are then fixed once, with their signs, because DM.6 and DM.8 use them in exact identities. The coefficient Frobenius twist on power series opens the layer, since `Ω` is characterized by a twisted functional equation.

<a id="dm-8-coefficient-twist"></a>

### 2.1 Coefficient Frobenius twist (`coefficientTwist`)

**Definition.** Let `𝒞` be a perfect field of characteristic `p` and `q = p^m`. Let `σ_𝒞` be the inverse of the `m`-fold `p`-Frobenius of `𝒞`. Its coefficientwise extension `σ` to `𝒞[[t]]` is a ring automorphism fixing `t`; write `f^(n) = σ^(−n)(f)` for `n ∈ ℤ`. It extends entrywise to matrices and restricts to the polynomial, entire and restricted-series subrings and their fraction fields. The twist never raises the variable `t` to a `q`-th power.

- `coefficientTwist_coeff`: the `n`-th coefficient of `σ(f)` is `σ_𝒞` of the `n`-th coefficient of `f`.
- `coefficientTwist_X`: `σ(t) = t`.
- `coefficientTwist_C`: `σ(c) = σ_𝒞(c)` for constants.
- `coefficientTwist_mul`: `σ(fg) = σ(f)σ(g)`, and the entrywise twist commutes with matrix multiplication.
- `coefficientTwist_symm`: the coefficient map of `σ_𝒞^(−1)` is the inverse of `σ` on series.

*Construction.* Use Mathlib's `iterateFrobeniusEquiv` on coefficients and `PowerSeries.map`; the inverse is the map of the inverse equivalence, checked coefficientwise. Restrictedness is preserved because coefficient norms are raised to the power `1/q`; the extension to fraction fields is by the universal property. (Pap, §2.2.5, pp. 7–8; ABP, §2.2, p. 6.) *Needs:* Mathlib `iterateFrobeniusEquiv`, `PowerSeries.map`.

**Checks.**

- The series `t` is fixed, in every characteristic.
- For `c ∈ 𝒞` with `c^q ≠ c`, the constant series `c` is not fixed.
- The twist of `(t − a)(t − b)` is `(t − σ_𝒞(a))(t − σ_𝒞(b))`; substituting `t^q` for `t` would give a different polynomial.

<a id="dm-2-c-infinity"></a>

### 2.2 The field `C_∞` (`CInfty`)

**Definition.** Let `K_∞` be the completion of `K_0` at `∞` with the absolute value `|a| = q^(deg_A a)`, extend it to an algebraic closure by the spectral norm, and let `C_∞` be the completion of that algebraic closure. It is a complete algebraically closed nonarchimedean field of characteristic `p` containing `K_0`; for `F[θ]` and rational `∞`, `|θ| = q`. It is unique up to isometric `K_∞`-isomorphism.

- `CInfty`: the completed algebraic closure of `K_∞`.
- `CInfty.norm_algebraMap`: the embedding of `K_∞` is isometric.
- `CInfty.isAlgClosed`: `C_∞` is algebraically closed.
- `CInfty.completeSpace`: `C_∞` is complete.

*Construction.* The completion `K_∞` at a place is AlgebraicCurves Layer 5. The spectral norm on an algebraic extension of a complete field and the value group of the completion are NewtonPolygons §1.3, with Mathlib's `spectralNorm` and `UniformSpace.Completion`. For algebraic closedness in characteristic `p`, first show the completion is perfect (Cauchy sequences of `p`-th roots), then apply Krasner's perturbation argument to a separable polynomial whose coefficients are approximated by algebraic ones, as in Crew's Corollary 1.2.8.5; the characteristic-zero argument for `ℂ_p` does not apply verbatim. (Cre, Proposition 1.2.8.4 and Corollary 1.2.8.5, pp. 34–35.) *Needs:* AlgebraicCurves Layer 5; NewtonPolygons §1.3; Mathlib `UniformSpace.Completion`, `NormedField.instCompletableTopField`, `spectralNorm`.

**Checks.**

- For `F[θ]`, `|θ| = q`.
- Every `c ∈ C_∞` has a unique `q`-th root.
- No nonzero `a ∈ A` maps to zero: the embedding `A → C_∞` has generic characteristic. A finite field is not a substitute for `C_∞`.

<a id="dm-2-a-lattice"></a>

### 2.3 Projective `A`-lattices (`ALattice`)

**Definition.** An `A`-lattice in `C_∞` is a finitely generated projective `A`-submodule `Λ ⊂ C_∞` of positive rank such that `{λ ∈ Λ : |λ| ≤ R}` is finite for every `R ≥ 0`. Its rank is `dim_(K_0) K_0 ⊗_A Λ`. In the category of lattices of a fixed rank `r`, morphisms `Λ → Λ'` are scalars `c ∈ C_∞` with `cΛ ⊂ Λ'`, and isomorphisms are homotheties by nonzero `c`. Finiteness of bounded balls is required; topological discreteness alone is not enough.

- `ALattice`: a projective `A`-submodule of positive rank with finite bounded subsets.
- `ALattice.rank`: `dim_(K_0) K_0 ⊗_A Λ`.
- `ALattice.scale`: `cΛ` is a lattice for `c ≠ 0`.
- `ALattice.card_quotient`: for `a ≠ 0`, `#(a^(−1)Λ/Λ) = #(A/(a))^(rank Λ)`.
- `ALattice.ext`: lattices with the same underlying submodule are equal.

*Construction.* Finite generation and torsion-freeness over the Dedekind ring `A` give projectivity (AlgebraicCurves Layer 2). (BP, §2.4, pp. 6–7.) *Needs:* [§2.2](#dm-2-c-infinity); AlgebraicCurves Layer 2.

**Checks.**

- For `A = F[θ]`, `A ⊂ C_∞` is a rank-one lattice.
- A nonprincipal ideal `I ⊂ A` is a rank-one lattice that is projective but not free.
- `F̄[θ] = F̄·A ⊂ C_∞` is a discrete `A`-submodule whose closed unit ball contains the infinite set `F̄`; it fails the bounded-ball condition.

<a id="dm-2-lattice-exponential"></a>

### 2.4 The exponential of a lattice (`ALattice.exp`)

**Definition.** For an `A`-lattice `Λ` put `e_Λ(z) = z ∏_(0≠λ∈Λ) (1 − z/λ)`, the limit of the finite products over an exhausting sequence of finite `F`-subspaces of `Λ`. It is an entire `F`-linear function with derivative one and zero set exactly `Λ`, each zero simple; the product converges uniformly on bounded discs, and `e_Λ : C_∞ → C_∞` is surjective.

- `ALattice.exp`: the entire product `e_Λ`.
- `ALattice.exp_add`, `ALattice.exp_smul`: `e_Λ(x + y) = e_Λ(x) + e_Λ(y)` and `e_Λ(cx) = c·e_Λ(x)` for `c ∈ F`.
- `ALattice.exp_eq_zero_iff`: `e_Λ(z) = 0 ⟺ z ∈ Λ`.
- `ALattice.exp_scale`: `e_(cΛ)(cz) = c·e_Λ(z)` for `c ≠ 0`.
- `ALattice.exp_surjective`: `e_Λ` is surjective.

*Construction.* For a finite `F`-subspace `U ⊂ Λ`, the normalized product `z ∏_(0≠u∈U)(1 − z/u)` is `F`-linear, being a scalar multiple of the subspace polynomial of `U` (FiniteFieldsAndCharacterSums *subspace-polynomial-is-linearized*). Finiteness of bounded balls makes the zero family discrete in the sense of NewtonPolygons §5.3, which supplies the entire product with exactly this zero divisor and its uniform convergence; `F`-linearity passes to the limit. A nonconstant entire function `e_Λ − c` is not a unit of the entire ring (entire units are constants, NewtonPolygons §5.3), so it has a zero: `e_Λ` is surjective. (BP, §2.4 and Theorem 2.1, pp. 6–7.) *Needs:* [§2.3](#dm-2-a-lattice); FiniteFieldsAndCharacterSums *subspace-polynomial-is-linearized*; NewtonPolygons §§4.3, 5.3; RestrictedPowerSeries §7.2.

**Checks.**

- The coefficient of `z` in `e_Λ` is one.
- `e_Λ(λ) = 0` for `λ ∈ Λ` and `e_Λ(z) ≠ 0` for `z ∉ Λ`.
- Replacing `Λ` by `cΛ` conjugates `e_Λ` by `z ↦ cz`; omitting the initial factor `z` fails the derivative test.

<a id="dm-2-lattice-drinfeld-module"></a>

### 2.5 The Drinfeld module of a lattice (`ALattice.drinfeldModule`)

**Definition.** For an `A`-lattice `Λ` of rank `r` and nonzero `a ∈ A` put `φ^Λ_a(X) = aX ∏_(0≠v∈a^(−1)Λ/Λ) (1 − X/e_Λ(v))`, and `φ^Λ_0 = 0`. The product does not depend on representatives, `φ^Λ_a` is q-linearized, `e_Λ(az) = φ^Λ_a(e_Λ(z))`, and `a ↦ φ^Λ_a` is a Drinfeld module of rank `r` over `C_∞` with characteristic map the inclusion `A ⊂ C_∞`.

- `ALattice.drinfeldModule`: the Drinfeld module `φ^Λ`.
- `ALattice.exp_functionalEquation`: `e_Λ(az) = φ^Λ_a(e_Λ(z))`.
- `ALattice.drinfeldModule_rank`: `rank φ^Λ = rank Λ`.
- `ALattice.drinfeldModule_scale`: `φ^(cΛ)_a(X) = c·φ^Λ_a(c^(−1)X)`.

*Construction.* `e_Λ(a^(−1)Λ/Λ)` is a finite `F`-subspace, so the product is a scalar multiple of a subspace polynomial. Both sides of the functional equation are entire with derivative `a` and the same simple zeros `a^(−1)Λ`, so they agree by the uniqueness in NewtonPolygons §5.3; surjectivity of `e_Λ` then gives additivity and multiplicativity of `a ↦ φ^Λ_a`. The degree is `#(a^(−1)Λ/Λ) = #(A/(a))^r`. Papikian's displayed finite product omits the factor `a`, without which the derivative would be one. (Pik, Theorem 2.3 and proof, pp. 6–7; BP, §2.4, p. 6.) *Needs:* [§2.4](#dm-2-lattice-exponential); [§0.1](#dm-0-drinfeld-module); FiniteFieldsAndCharacterSums *subspace-polynomial-is-linearized*.

**Checks.**

- `φ^Λ_1(X) = X`.
- For nonconstant `a`, the coefficient of `X` is `a`, not one.
- For `Λ = π_BP·A` with the period of [§2.9](#dm-2-carlitz-period), `φ^Λ` is the Carlitz module.

<a id="dm-2-uniformization"></a>

### 2.6 Drinfeld's uniformization theorem (`DrinfeldModule.uniformization`)

**Theorem.** Let `φ` be a Drinfeld `A`-module of rank `r ≥ 1` over `C_∞` with generic characteristic. There is a unique entire `F`-linear function `exp_φ` with derivative one and `exp_φ(az) = φ_a(exp_φ(z))` for all `a`. It is surjective, and its kernel is an `A`-lattice of rank `r`. The constructions `φ ↦ ker exp_φ` and `Λ ↦ φ^Λ` are mutually inverse equivalences between rank-`r` Drinfeld modules over `C_∞` and rank-`r` `A`-lattices with scalar morphisms. Nothing is asserted for general t-modules or for families.

*Proof sketch.* For `A = F[t]` and `φ_t = θ + Σ_(j=1)^r g_jτ^j`, the coefficients `α_i` of `exp_φ = Σ α_i z^(q^i)` are forced by `α_0 = 1` and `(θ^(q^i) − θ)α_i = Σ_(j=1)^(min(r,i)) g_j α_(i−j)^(q^j)`; the estimate on these coefficients gives infinite radius. The kernel is an `A`-submodule by the functional equation; its zeros are simple, and finitely many lie in each bounded disc (NewtonPolygons §§4.3, 5.3), so it has finite bounded balls. Comparing `#ker(φ_a) = #(A/(a))^r` with the `a`-division points of the kernel gives `#(a^(−1)Λ/Λ) = #(A/(a))^r`, hence rank `r` over the Dedekind ring `A`. For general `A`, restrict to `F[t] ⊂ A` for a nonconstant `t`, over which `A` is finite: the exponential of the restricted module is the exponential of `φ`, its kernel is an `A`-submodule that is a lattice of rank `r·[A : F[t]]` over `F[t]`, hence finitely generated and projective of rank `r` over `A`. Surjectivity is [§2.4](#dm-2-lattice-exponential) applied to the kernel, using `exp_φ = e_(ker exp_φ)` (same zeros, derivative one). (BP, Theorem 2.1, p. 7, and §2.5, pp. 7–8.) *Needs:* [§2.5](#dm-2-lattice-drinfeld-module); [§0.3](#dm-0-rank-general); AlgebraicCurves Layer 5; NewtonPolygons §§4.3, 5.3.

**Checks.**

- A nonprincipal ideal lattice gives a rank-one Drinfeld module whose kernel lattice stays projective and is not free.
- The exponential of a general t-module need not be surjective ([§4.6](#dm-4-uniformizability)); the theorem is for Drinfeld modules.
- For the Carlitz module the kernel is `π_BP·F[θ]` ([§2.9](#dm-2-carlitz-period)).

<a id="dm-2-exponential-morphisms"></a>

### 2.7 Morphisms under uniformization (`DrinfeldModule.homEquivLattice`)

**Theorem.** Let `φ`, `ψ` be Drinfeld modules over `C_∞` of the same rank `r` with generic characteristic and lattices `Λ_φ`, `Λ_ψ`. Taking the differential is a bijection `Hom(φ, ψ) ≅ {c ∈ C_∞ : cΛ_φ ⊂ Λ_ψ}`, and the morphism `u` attached to `c` satisfies `u(exp_φ(z)) = exp_ψ(cz)`. The bijection is `A`-linear and compatible with identities and composition; in particular homotheties classify isomorphisms.

*Proof sketch.* For `c ≠ 0`, equal ranks and finite generation make `c^(−1)Λ_ψ/Λ_φ` finite. Its image under `exp_φ` is a finite `F`-subspace `U`, and the polynomial `u(X) = cX ∏_(v∈U, v≠0)(1 − X/v)` has differential `c`. Comparing its simple zeros and linear term with `exp_ψ(cz)` gives `u ∘ exp_φ = exp_ψ ∘ c`. The zero scalar corresponds to `u = 0`. Uniqueness follows from surjectivity of `exp_φ`, and the functional equations give the intertwining relation. (BP, §2.4, pp. 6–7.) *Needs:* [§2.6](#dm-2-uniformization); [§0.6](#dm-0-drinfeld-module-hom).

**Checks.**

- A nonzero morphism is separable, and `c = 0` corresponds only to `u = 0`.
- For `A = F[t]`, `Λ = A` and `Λ' = A + Aα` with `α ∈ F_(q²) ∖ F`: the scalar `1` gives `Λ ⊂ Λ'`, but it is not the differential of a morphism between modules of ranks one and two; the equal-rank hypothesis is needed.
- `c ↦ u` is multiplicative: the composite of the morphisms attached to `c` and `c'` is attached to `cc'`.
- For `Λ_φ = A`, `Λ_ψ = t^(−1)A` and `c = 1`, the nonzero roots are `exp_φ(t^(−1)A/A)`; applying `exp_ψ` instead would give only zero and could not produce the degree-`q` morphism.

<a id="dm-2-carlitz-exponential"></a>

### 2.8 Carlitz exponential and logarithm (`carlitzExp`, `carlitzLog`)

**Definition.** For `A = F[θ]` with `|θ| = q`, `exp_C(z) = Σ_(i≥0) z^(q^i)/D_i` is entire and satisfies `exp_C(θz) = θ·exp_C(z) + exp_C(z)^q`. The series `log_C(z) = Σ_(i≥0) z^(q^i)/ℓ_i` converges exactly for `|z| < q^(q/(q−1))`, in particular at `z = 1`, and there `exp_C(log_C(z)) = z`. The logarithm is not entire.

- `carlitzExp`: `Σ z^(q^i)/D_i`.
- `carlitzExp_functionalEquation`: `exp_C(θz) = θ·exp_C(z) + exp_C(z)^q`.
- `carlitzLog`: `Σ z^(q^i)/ℓ_i`.
- `carlitzExp_carlitzLog`: for `|z| < q^(q/(q−1))`, `log_C(z)` converges and `exp_C(log_C(z)) = z`; `log_C` is the compositional inverse of `exp_C` on this disc.
- `carlitzExp_log_one`: `exp_C(log_C(1)) = 1`.

*Construction.* The recurrence `D_i = [i]D_(i−1)^q` of [§0.11](#dm-0-carlitz-products) is the coefficient recurrence of [§2.6](#dm-2-uniformization) for `C_t = θ + τ`, and `|D_i| = q^(i·q^i)` gives infinite radius. Since `|ℓ_i| = q^(q + q² + ⋯ + q^i)`, the term `z^(q^i)/ℓ_i` tends to zero exactly when `|z| < q^(q/(q−1))`; at the boundary the terms have constant absolute value. The recurrence `ℓ_i = −[i]ℓ_(i−1)` makes `log_C` the formal inverse of `exp_C`, and convergence on the disc gives the identity of functions. (BP, §2.2, pp. 3–5; Pap, §1.2.2, p. 4.) *Needs:* [§0.11](#dm-0-carlitz-products); [§2.6](#dm-2-uniformization).

**Checks.**

- The `z^q`-coefficient of `exp_C` is `(θ^q − θ)^(−1)`.
- `exp_C(0) = log_C(0) = 0`.
- The `z^q`-coefficient of `log_C` is `(θ − θ^q)^(−1)`; using `D_1` instead gives the wrong sign in odd characteristic.

<a id="dm-2-carlitz-period"></a>

### 2.9 The Carlitz period (`carlitzPeriod`)

**Definition.** Choose `ρ ∈ C_∞` with `ρ^(q−1) = −θ` and put `π_BP = θρ ∏_(i≥1) (1 − θ^(1−q^i))^(−1)`. Then `ker exp_C = π_BP·F[θ]` and `|π_BP| = q^(q/(q−1))`. Replacing `ρ` by `ξρ` with `ξ ∈ F^×` replaces `π_BP` by `ξπ_BP`. Ngo Dac's period `π_ND = −π_BP` generates the same lattice.

- `carlitzPeriod`: the product `π_BP` for the chosen `ρ`.
- `carlitzExp_eq_zero_iff`: `exp_C(z) = 0 ⟺ z ∈ π_BP·F[θ]`.
- `norm_carlitzPeriod`: `|π_BP| = q^(q/(q−1))`.
- `carlitzPeriod_changeRoot`: replacing `ρ` by `ξρ` replaces `π_BP` by `ξπ_BP`.

*Construction.* The factors converge since `|θ^(1−q^i)| → 0`. The kernel of `exp_C` is a rank-one lattice by [§2.6](#dm-2-uniformization); its generator is a nonzero element of minimal absolute value, and comparing the product expansion of `exp_C` with the `t`-torsion `θx + x^q = 0`, whose nonzero roots are the `(q−1)`-th roots of `−θ`, identifies it with `π_BP`. (BP, §2.2, pp. 4–5.) *Needs:* [§2.8](#dm-2-carlitz-exponential); [§2.3](#dm-2-a-lattice).

**Checks.**

- `π_BP ≠ 0` and `exp_C(π_BP) = 0`.
- `π_ND = −π_BP` gives the same `F[θ]`-lattice.
- For `q = 2`, `|π_BP| = 4`.

<a id="dm-2-omega"></a>

### 2.10 The Anderson–Thakur function (`carlitzOmega`)

**Definition.** For the same `ρ`, put `Ω(t) = ρ^(−q) ∏_(i≥1) (1 − t/θ^(q^i))`. It is entire in `t` and a unit of the radius-one Tate algebra `𝕋`. Its inverse coefficient twist satisfies `Ω^(−1) = (t − θ)Ω`. Its zeros are the `θ^(q^i)`, `i ≥ 1`, each simple; so `Ω(θ) ≠ 0` and `1/Ω(θ) = −π_BP = π_ND`.

- `carlitzOmega`: the entire product `Ω(t)`.
- `carlitzOmega_twist`: `Ω^(−1) = (t − θ)Ω`.
- `carlitzOmega_eval_theta`: `1/Ω(θ) = −π_BP`.
- `carlitzOmega_zeros`: the zeros are exactly the `θ^(q^i)`, `i ≥ 1`, each simple.

*Construction.* The zeros `θ^(q^i)` have absolute value tending to infinity, so the product is entire with this zero divisor (NewtonPolygons §5.3). On `|t| ≤ 1` each factor is a unit, and the constant coefficient is the unique dominant one, so `Ω` is a unit of `𝕋` (RestrictedPowerSeries §3.2). Applying the inverse twist of [§2.1](#dm-8-coefficient-twist) shifts the product by one index; the relation `ρ^(q−1) = −θ` turns the extra factor `ρ^(−1)(1 − t/θ)` into `(t − θ)ρ^(−q)`. Evaluate at `θ` and compare with the product defining `π_BP`, keeping the sign. (ND, §4.2, pp. 17–18; BP, §4.3, p. 16.) *Needs:* [§2.9](#dm-2-carlitz-period); [§2.1](#dm-8-coefficient-twist); RestrictedPowerSeries §§3.2, 7.2; NewtonPolygons §5.3; Mathlib `PowerSeries.IsRestricted.subring`.

**Checks.**

- `Ω(0) = ρ^(−q)`.
- `Ω(θ) ≠ 0` but `Ω(θ^q) = 0`.
- `Ω` has no zeros on `|t| ≤ 1`, while it has infinitely many zeros on `C_∞`: a unit of `𝕋` need not be a zero-free entire function.

<a id="dm-2-period-power"></a>

### 2.11 The invariant period power (`carlitzPeriod_pow`)

**Theorem.** `π_BP^(q−1) = π_ND^(q−1) = −θ^q ∏_(i≥1) (1 − θ^(1−q^i))^(−(q−1))` lies in `K_∞^×` and does not depend on the choice of `ρ`. The period itself is not in `K_∞` when `q > 2`.

*Proof sketch.* Raise the defining product to the power `q − 1` and substitute `ρ^(q−1) = −θ`; the sign `−1` between the two periods has `(q−1)`-th power one; every factor lies in `K_∞`. For `q > 2` the valuation `−q/(q−1)` of the period is not an integer, while the value group of `K_∞` is `ℤ`. (ND, §4.2, p. 17, and §2, pp. 5–7.) *Needs:* [§2.9](#dm-2-carlitz-period).

**Checks.**

- For `q = 2`, `ρ = θ` and `π_BP ∈ K_∞`.
- For `q = 3`, `|π_BP| = 3^(3/2)` is not a power of `3` with integer exponent, so `π_BP ∉ K_∞`.

### Examples

- For `q = 2`: `ρ = θ`, `π_BP = θ² ∏_(i≥1)(1 − θ^(1−2^i))^(−1)`, `|π_BP| = 4`, and `exp_C` maps the disc `|z| ≤ 2` isometrically onto itself (used in [§6.13](#dm-6-carlitz-class-examples)).
- The Carlitz logarithm converges at `1` and `exp_C(log_C(1)) = 1`; in [§6.12](#dm-6-small-power-sum) `log_C(1)` is identified with `ζ_A(1)`.

### Dependencies

Layer DM.0; Mathlib (`iterateFrobeniusEquiv`, `PowerSeries.map`, `PowerSeries.IsRestricted`, completions, `spectralNorm`); FiniteFieldsAndCharacterSums (subspace polynomials); AlgebraicCurves Layers 2 and 5; RestrictedPowerSeries §§3.2, 7.2; NewtonPolygons §§1.3, 4.3, 5.3.

## Layer DM.4: Anderson modules, effective motives and dual conventions

Anderson t-modules are higher-dimensional analogues of Drinfeld modules, with a nilpotent part allowed in the differential. Their contravariant motives are effective `A`-motives; abelian t-modules correspond exactly to motives that are finite free over the twisted polynomial ring after a faithfully flat extension. Dual t-motives use the inverse twist `σ` and are covariant; the star map converts between the two conventions. Over a perfect field, finite generation of the motive and of the dual motive are equivalent (Maurischat), which is proved here through invariant factors over a discretely valued skew field. The layer ends with pre-t-motives, the rational difference modules on which DM.8 builds its Tannakian category.

<a id="dm-4-t-module"></a>

### 4.1 Anderson t-modules (`TModule`)

**Definition.** For `A = F[t]` and a field `L` over `F` with `γ(t) = θ`, a `d`-dimensional t-module is an `F`-algebra map `Φ : F[t] → Mat_d(L{τ})`, acting on `G_a^d`, such that `dΦ_t = θI_d + N` with `N` nilpotent. More generally an Anderson `A`-module over an `F`-algebra `R` is an `F`-module scheme that is fpqc-locally isomorphic to `G_a^d`, with an `A`-action satisfying `(dΦ_a − γ(a))^d = 0` on its Lie algebra for every `a ∈ A`. Morphisms are matrices `U` over `L{τ}` with `UΦ_a = Ψ_aU`. A t-module is *abelian* when its contravariant motive ([§4.3](#dm-4-contravariant-motive)) is finite locally free over `A ⊗_F R` (over a field: finitely generated over `L[t]`); this is an additional condition.

- `TModule`: the matrix action with nilpotent differential at `t`.
- `TModule.differential`: the constant-coefficient matrix `dΦ_t`.
- `TModule.Hom`, `TModule.Hom.id`, `TModule.Hom.comp`: intertwining matrices `UΦ_t = Ψ_tU`, composed by matrix multiplication.
- `TModule.IsAbelian`: the motive is finitely generated over `L[t]`.
- `TModule.ofDrinfeld`: the one-dimensional t-module of a Drinfeld `F[t]`-module.
- `TModule.ext`: in fixed coordinates over `F[t]`, equality of the actions of `t` determines the t-module.

*Construction.* Apply FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison* entrywise to identify `F`-linear polynomial maps `G_a^d → G_a^e` with `e × d` matrices over `L{τ}`. A nilpotent differential at `t` gives the condition for every `a`, since `dΦ_a = a(dΦ_t)`. The relative definition descends the coordinate description along fpqc covers (SchemeAndStackFoundations §1.1, AlgebraicVectorBundles L1A–L1B, L2B). (Har, Definition 1.2, p. 2, Definition 3.1, p. 7, Lemma 3.2 and Remark 3.3, p. 8.) *Needs:* [§0.1](#dm-0-drinfeld-module); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*; SchemeAndStackFoundations §1.1; AlgebraicVectorBundles L1A–L1B, L2B.

**Checks.**

- For `d = 1` and `Φ_t = θ + τ` the differential is `θ`, and the motive has rank one.
- `Φ_t = θI_2 + [[0, 1], [0, 0]]` has nilpotent part with square zero and is a t-module.
- A differential `diag(θ, θ + 1)` fails the nilpotence condition.
- The scalar action `Φ_t = θI_d` is a t-module, but for `d > 0` its motive is not finitely generated over `L[t]`, so it is not abelian.

<a id="dm-4-effective-a-motive"></a>

### 4.2 Effective `A`-motives (`EffectiveAMotive`)

**Definition.** Put `A_R = A ⊗_F R`, `σ = id_A ⊗ Frob_(q,R)` and `J = ker(A_R → R, a ⊗ b ↦ γ(a)b)`. An effective `A`-motive of rank `r` and dimension `d` is a finite projective `A_R`-module `M` of rank `r` with an injective `A_R`-linear map `τ_M : σ^∗M → M`, where `σ^∗M = M ⊗_(A_R,σ) A_R`, whose cokernel is locally free of rank `d` over `R` and annihilated by `J^d`. Morphisms are `A_R`-linear maps commuting with `τ`. Without a dimension, Hartl calls `M` effective when some power `J^n` kills the cokernel; over a nonreduced `R` that weaker condition does not determine a dimension. No perfection of `R` is required.

- `EffectiveAMotive`: finite projective `M` with `τ_M : σ^∗M → M` and the cokernel conditions.
- `EffectiveAMotive.rank`, `EffectiveAMotive.dimension`: the `A_R`-rank of `M` and the `R`-rank of `coker τ_M`.
- `EffectiveAMotive.baseChange`: extension of `R` carries `τ_M` and the ideal `J`.
- `EffectiveAMotive.matrix`: for `M = L[t]^r`, a matrix `Θ` with `det Θ = c(t − θ)^d`, `c ∈ L^×`, defines rank `r` and dimension `d`, once the annihilation of the cokernel by `(t − θ)^d` is checked.
- `EffectiveAMotive.dimension_bound`: in dimension `d`, `J^d` kills the cokernel; over a field this follows from nilpotence on a `d`-dimensional space, over a nonreduced `R` it is a condition.
- `EffectiveAMotive.matrix_ext`: in a fixed basis of a free motive, the Frobenius matrix determines the object.

*Construction.* Define `σ^∗M` by scalar extension and `τ_M` as a linear map from it; the module cokernel and its support at `J` are then defined. Over nonreduced or imperfect coefficients the linearization is essential: the image of a raw semilinear map is not a submodule. (Har, Definition 1.1, p. 2, Definition 2.1, p. 4, Propositions 2.3–2.4, pp. 5–6.) *Needs:* AlgebraicCurves Layer 2; AlgebraicVectorBundles L0B; Mathlib `Module.End`.

**Checks.**

- For `M = L[t]` and `τ_M` multiplication by `t − θ` after the twist: rank one, dimension one (the Carlitz motive).
- Multiplication by `(t − θ)^n` on `L[t]` has dimension `n`.
- Multiplication by `t − b` with `b ≠ θ` has cokernel supported at the wrong point and is not effective for `γ`.
- For `R = F[ε]/(ε²)`, `γ(t) = 0` and `τ_M` multiplication by `t − ε` on `R[t]`: the cokernel `R` has rank one and is killed by `t²` but not by `t`, so `M` is effective in the weak sense and fails the dimension-one condition.

<a id="dm-4-contravariant-motive"></a>

### 4.3 The motive of a t-module (`TModule.motive`)

**Definition.** For an Anderson `A`-module `E` over `R`, `M(E) = Hom_(F-module schemes/R)(E, G_(a,R))`, with `A` acting by precomposition with `φ_a`, `R` by postcomposition with scalars and `τ` by postcomposition with the q-Frobenius. For `E = G_a^d` in coordinates this is the row module `R{τ}^(1×d)`. A morphism `f : E → E'` induces `M(f) : M(E') → M(E)` by precomposition. If `E` is abelian of rank `r` and dimension `d`, `M(E)` is an effective `A`-motive of rank `r` and dimension `d`, and `coker τ_M ≅ Hom_R(Lie E, R)`.

- `TModule.motive`: `L{τ}^(1×d)` with `t` acting on the right through `Φ_t`.
- `TModule.motiveMap`: for `U : Φ → Ψ`, `M(U) : M(Ψ) → M(Φ)`, `m ↦ mU`.
- `TModule.motiveMap_comp`: `M(VU) = M(U) ∘ M(V)`.
- `TModule.motiveLieDual`: `coker τ_M ≅ (Lie Φ)^∨` for abelian `Φ`.

*Construction.* The row representation is FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison* entrywise. The `A`-action is right composition with `φ_a` and commutes with left multiplication by `τ` and `R`. Differentiation kills the image of the linearized `τ` and identifies the cokernel with the dual of the Lie algebra; finite projectivity and support at `J` follow from abelianness and nilpotence of the differential. Hartl's display (3.5) in the arXiv version lists the target of the comparison map in the reversed order; the published display and the contravariant convention give `Hom(M(E'), M(E))`. (Har, Remark 3.3, p. 8, Theorem 3.5 and proof, pp. 8–9.) *Needs:* [§4.1](#dm-4-t-module); [§4.2](#dm-4-effective-a-motive); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*.

**Checks.**

- For the Carlitz module, with generator `1`: `τ·1 = (t − θ)·1`.
- A morphism `Φ → Ψ` gives a map `M(Ψ) → M(Φ)`, not one in the original direction.
- The `n`-th Carlitz tensor power has motive rank one and Lie-dual quotient of dimension `n`.
- For `Φ_t = θ` on `G_a`, each `τ^i` is a `t`-eigenvector with eigenvalue `θ^(q^i)`; the row motive is not finitely generated over `L[t]`.

<a id="dm-4-abelian-antiequivalence"></a>

### 4.4 The abelian anti-equivalence (`TModule.motive_fullyFaithful`)

**Theorem.** The functor `E ↦ M(E)` is fully faithful from abelian Anderson `A`-modules over `R` to effective `A`-motives over `R`. Its essential image consists of the effective motives that become finite free left `R'{τ}`-modules after some faithfully flat extension `R → R'`. The rank of `M(E)` over `A_R` is the rank of `E`, and `coker τ_M` has `R`-rank the dimension of `E`. For `A = F[t]` over a field this is the category of effective `L[t]`-motives that are finite free over `L{τ}`, not the category of all effective motives.

*Proof sketch.* After a faithfully flat extension choose an `R'{τ}`-basis; right multiplication by `a ∈ A` in this basis reconstructs `φ_a`, and the cokernel condition gives the nilpotent differential. Intertwining matrices identify morphisms, in the reversed direction. Descend the reconstructed module scheme and its morphisms by fpqc descent of affine schemes (SchemeAndStackFoundations §1.1 with AlgebraicVectorBundles L1B). (Har, Theorem 3.5 and proof, pp. 8–9.) *Needs:* [§4.3](#dm-4-contravariant-motive); [§4.2](#dm-4-effective-a-motive); SchemeAndStackFoundations §1.1; AlgebraicVectorBundles L1B.

**Checks.**

- The motive `L[t]` with `τ = (t − θ)^n` reconstructs the `n`-dimensional t-module `C^⊗n` of [§4.7](#dm-4-carlitz-tensor-power).
- An effective motive that is not locally finite free over `R{τ}` is not assigned an Anderson module.
- For a Drinfeld module over `A = F[t]` of rank `r`, `M(φ) = L{τ}` has basis `1, τ, …, τ^(r−1)` over `L[t]`.

<a id="dm-4-purity"></a>

### 4.5 Purity and weights (`EffectiveTMotive.IsPure`)

**Definition.** Let `M` be an abelian t-motive of rank `r` over `L[t]`, and extend it to `L((1/t))`. It is *pure* if there are positive integers `u`, `v` and an `L[[1/t]]`-lattice `H ⊂ M ⊗ L((1/t))` of rank `r` with `t^u H = τ^v H`, where `τ^v` is the `v`-fold linearized Frobenius. For `r > 0`, its weight `d/r` (with `d` the dimension) equals `u/v` for every such lattice. The zero motive satisfies the lattice condition with `H = 0` for every `u, v > 0`; it has no intrinsic weight, and all assertions about its numerical weight require `r > 0`. Purity is a property, not part of the definition of a t-module or an effective motive.

- `EffectiveTMotive.IsPure`: existence of an infinity lattice with `t^u H = τ^v H`.
- `EffectiveTMotive.PureLattice`: a pair `u, v > 0` and a lattice `H` satisfying the spanning, rank and equality conditions.
- `EffectiveTMotive.weight`: `d/r`, for positive rank.
- `EffectiveTMotive.weight_eq`: at positive rank, every purity lattice has `weight = u/v`.
- `EffectiveTMotive.isPure_tensor`: tensor products of pure motives are pure; when both ranks are positive their weights add.

*Construction.* Compare determinants in `t^uH = τ^vH`: `det τ_M = c(t − θ)^d` has `1/t`-adic valuation `−d`, so `τ^v` changes the valuation of a lattice determinant by `−vd` and `t^u` by `−ur`, which gives `ur = vd`; dividing by `rv` is permitted only at positive rank. A common iterate compares two choices. Over imperfect coefficients use the linearized pullback rather than the image of the raw Frobenius. (BP, §4.1, p. 15; Mau, Definition 7.1, p. 35.) *Needs:* [§4.2](#dm-4-effective-a-motive); [§4.4](#dm-4-abelian-antiequivalence); AlgebraicCurves Layer 5.

**Checks.**

- The Carlitz motive has `r = d = 1` and weight one.
- The `n`-th Carlitz tensor power has `r = 1`, `d = n` and weight `n`, not `1/n`.
- The direct sum of the Carlitz motive and its second tensor power has slopes one and two and is not pure.
- For the zero motive `t^uH = τ^vH = 0` for every pair, so the equality cannot determine a weight: the positive-rank hypothesis is necessary.

<a id="dm-4-uniformizability"></a>

### 4.6 Uniformizable t-modules (`TModule.IsUniformizable`)

**Definition.** For a t-module `E` over `C_∞` with generic characteristic (so `|θ| > 1`) and `dΦ_t = θI + N`, there is a unique entire `F`-linear map `exp_E : C_∞^d → E(C_∞)` with differential the identity and `exp_E(dΦ_t z) = Φ_t(exp_E z)`. `E` is *uniformizable* when `exp_E` is surjective. Its kernel `Λ_E` is discrete and stable under `dΦ_a`. The comparison of uniformizability with rigid analytic triviality is [§8.18](#dm-8-anderson-uniformizability).

- `TModule.exp`: the normalized entire exponential.
- `TModule.exp_functionalEquation`: `exp_E(dΦ_t z) = Φ_t(exp_E z)`.
- `TModule.IsUniformizable`: surjectivity of `exp_E`.
- `TModule.periodLattice`: `ker exp_E` with the action of `dΦ_a`.

*Construction.* Write `exp_E = Σ_i α_i z^(q^i)` with matrices `α_i`, `α_0 = I`. The functional equation determines `α_i` from `α_0, …, α_(i−1)` through the operator `X ↦ X·(dΦ_t)^[q^i] − dΦ_t·X` (entrywise `q^i`-th power), which is invertible for `i ≥ 1` because the eigenvalues `θ` and `θ^(q^i)` of the two matrices differ in generic characteristic; the resulting estimate gives infinite radius. (BP, §3.1, pp. 8–10, and Theorem 4.2, p. 16.) *Needs:* [§2.2](#dm-2-c-infinity); [§4.1](#dm-4-t-module); RestrictedPowerSeries §7.2.

**Checks.**

- For `d = 1` and a Drinfeld module over `C_∞`, `exp_E` and `Λ_E` are those of [§2.6](#dm-2-uniformization).
- Every Carlitz tensor power `C^⊗n` with `n ≥ 1` is uniformizable ([§8.18](#dm-8-anderson-uniformizability)).
- The scalar t-module `Φ_t = θI_d` has `exp_E = id` and zero period lattice; it is uniformizable even though for `d > 0` it is not abelian.
- The zero entire map satisfies the functional equation but has differential zero for `d > 0`, so it is not the normalized exponential.

<a id="dm-4-carlitz-tensor-power"></a>

### 4.7 Carlitz tensor powers (`carlitzTensor`)

**Definition.** For `n ≥ 1`, `C^⊗n` is the t-module on `G_a^n` with `Φ_t = θI_n + N_n + E_(n,1)τ`, where `N_n` has ones on the superdiagonal and `E_(n,1)` is the matrix unit in the bottom-left corner. It is abelian and pure of weight `n`; its uniformizability over `C_∞` is proved with the analytic criterion in [§8.18](#dm-8-anderson-uniformizability). Its motive is free of rank one over `L[t]` with `τm = (t − θ)^n m`: dimension `n`, rank one.

- `carlitzTensor`: the `n × n` matrix `θI_n + N_n + E_(n,1)τ`.
- `carlitzTensor_differential`: `dΦ_t = θI + N_n` with `N_n^n = 0`.
- `carlitzTensor_motive`: `M(C^⊗n) ≅ L[t]` with `τm = (t − θ)^n m`.
- `carlitzTensor_rank_dimension`: motive rank one, dimension `n`.

*Construction.* Compute the motive from the row generator: `t` acts on the generator through the bottom row, and the relations show that `L{τ}^(1×n)` is cyclic over `L[t]` with `τ` acting by `(t − θ)^n`. The rank-one lattice at infinity gives purity of weight `n`. The analytic assertion is the later named target `carlitzTensor.uniformizable` in [§8.18](#dm-8-anderson-uniformizability); the algebraic construction here does not use that criterion. (BP, §3.3, pp. 10–11, and §4.3, pp. 16–17.) *Needs:* [§4.3](#dm-4-contravariant-motive); [§4.4](#dm-4-abelian-antiequivalence); [§4.5](#dm-4-purity); [§4.6](#dm-4-uniformizability); [§2.10](#dm-2-omega).

**Checks.**

- For `n = 1`, `Φ_t = θ + τ` is the Carlitz module.
- For `n = 2`, `t·(x, y) = (θx + y, θy + x^q)`.
- For `n = 2` the motive has rank one over `L[t]`, not two, while its `τ`-cokernel has `L`-dimension two.

<a id="dm-4-inverse-twist-dual-motive"></a>

### 4.8 Effective dual t-motives (`EffectiveDualTMotive`)

**Definition.** Over a perfect field `L` containing `F`, let `L[t, σ]` have `σc = c^(1/q)σ` and `σt = tσ`. An effective dual t-motive is a finite free `L[t]`-module `H` with a left `L[t, σ]`-module structure such that `(t − θ)^ℓ (H/σH) = 0` for some `ℓ ≥ 0`; `σH` is an `L[t]`-submodule because `L` is perfect. It is *`A`-finite* when in addition `H` is finite free over `L[σ]`, of rank `d`; this is the condition that matches `d`-dimensional t-modules, and it is not part of Ngo Dac's broader effective definition.

- `EffectiveDualTMotive`: `H` with the inverse-twisted `σ` and characteristic-supported quotient.
- `EffectiveDualTMotive.matrix`: in a basis, `σh = Φh` with the inverse coefficient twist.
- `EffectiveDualTMotive.IsAFinite`: `H` is finite free over `L[σ]`.
- `EffectiveDualTMotive.baseChange`: extension to a perfect field `L'` preserves the matrix and the support condition.
- `EffectiveDualTMotive.ext`: in a fixed basis and with fixed inverse Frobenius, the matrix determines the dual motive.

*Construction.* Use the inverse twist of [§2.1](#dm-8-coefficient-twist) with the variable `t` fixed; the `σ`-cokernel expresses the support condition, and `A`-finiteness is a separate predicate. (ND, Definition 4.1 and §4.1, pp. 16–17; Pap, §3.4.1, p. 17.) *Needs:* [§4.2](#dm-4-effective-a-motive); [§2.1](#dm-8-coefficient-twist).

**Checks.**

- For `H = L[t]` and `σh = (t − θ)h`, the quotient `H/σH` has dimension one.
- `σh = (t − θ)^n h` gives rank one and quotient dimension `n`.
- Using `q`-th powers instead of `q`-th roots of coefficients breaks the relation `σc = c^(1/q)σ`.

<a id="dm-4-star-adapter"></a>

### 4.9 The star anti-isomorphism (`oreStar`)

**Definition.** For `f = Σ a_iτ^i ∈ L{τ}` over a perfect field put `f^∗ = Σ a_i^(1/q^i) σ^i ∈ L[σ]`. Then `(fg)^∗ = g^∗f^∗`. For matrices set `(U^∗)_(ij) = (U_(ji))^∗`, so that `(UV)^∗ = V^∗U^∗`. For a coordinate t-module `Φ`, its dual motive is the row module `L[σ]^(1×d)` with `t` acting on the right by `Φ_t^∗`. An intertwiner `U : Φ → Ψ` induces `h ↦ hU^∗` from the dual motive of `Φ` to that of `Ψ`: the dual construction is covariant. Finite freeness over `L[t]` is a separate (`A`-finiteness) condition.

- `oreStar`: `Σ a_iτ^i ↦ Σ a_i^(1/q^i)σ^i`.
- `oreStar_mul`: `(fg)^∗ = g^∗f^∗`.
- `matrixOreStar`: entrywise star followed by transpose.
- `TModule.dualMotive`: the row `L[σ]`-module with `t` acting by `Φ_t^∗`.
- `TModule.dualMotiveMap`: `U` induces right multiplication by `U^∗`, in the same direction as `U`.

*Construction.* Check `(cτ^i)^∗ = c^(1/q^i)σ^i` on monomials and reversal on products of monomials, extend additively, and transpose for matrices; apply the star to `UΦ_t = Ψ_tU`. (BP, §4.4, pp. 17–18.) *Needs:* [§4.1](#dm-4-t-module); [§4.8](#dm-4-inverse-twist-dual-motive); [§2.1](#dm-8-coefficient-twist); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*.

**Checks.**

- `(c)^∗ = c` for constants.
- `(aτ²)^∗ = a^(1/q²)σ²`.
- `(τa)^∗ = (a^qτ)^∗ = aσ`, whereas `τ^∗a^∗ = σa = a^(1/q)σ`: the order of multiplication reverses.
- A `d' × d` intertwiner becomes a `d × d'` matrix after star-transpose.

<a id="dm-4-skew-invariant-factors"></a>

### 4.10 Invariant factors over a discretely valued skew field (`SkewLaurent.lastInvariantFactor_slopes`)

**Theorem.** Let `𝕂` be a skew field complete for a discrete valuation `v`, with valuation ring `𝒪` and a uniformizer `σ`; the case used here is the skew Laurent series field `𝕂 = K({σ})` in `σ = τ^(−1)` over a perfect field `K`, with `𝒪 = K{{σ}}`. Let `t` be a central variable.

1. (Invariant factors.) A left `𝕂[t]`-module `M` of finite `𝕂`-dimension `d` is isomorphic to `⊕_(i=1)^d 𝕂[t]/𝕂[t]λ_i` with monic `λ_i` such that `λ_i` divides `λ_(i+1)` on both sides; the `λ_i` are unique up to similarity. These are quotients by left ideals; factors with `λ_i = 1` are zero.
2. (Newton decomposition.) Split off the `t`-primary nilpotent summand of `M`. The remaining summand, on which `t` is invertible, is a direct sum of modules `𝕂[t]/𝕂[t]f` with `f(0) ≠ 0` whose Newton polygons (for `v`) have a single edge. For such a summand of dimension `e` and slope `s` there is an `𝒪`-lattice `Λ` with `es ∈ ℤ` and `σ^(es) t^e Λ = Λ`. Any relation `σ^b t^a Λ' = Λ'`, `a ≠ 0`, determines `s = b/a`.
3. (Positivity criterion.) Assume `d ≥ 1`. For `D ∈ Mat_d(𝕂)` let `λ_d` be the last invariant factor of `tI − D`, and let `s_n` be the least **nonnegative** integer with all entries of `D, D², …, D^n` of valuation at least `−s_n`. Then `λ_d(0) ≠ 0` and all its Newton slopes are positive if and only if for some `n ≥ 1` the matrix `σ^(s_n)D^n` has full rank `d` modulo `σ^(s_n)`, if and only if the stacked block matrix `(σ^(s_n)D^j)_(j=1..n)` has rank `d` modulo `σ^(s_n)`, if and only if the row block matrix has rank `d` modulo `σ^(s_n)`. Here the rank modulo `σ^s` of an integral matrix is the number of its nonzero diagonal invariant factors `σ^ν` with `ν < s`, not invertibility over `𝒪/(σ^s)`.

*Proof sketch.* `𝒪` is a skew principal ideal domain, and `𝕂[t]` has left and right division with remainder, so row and column operations diagonalize `tI − D` (Mau, Theorem 1.8 and Lemmas 2.5–2.6). Fitting decomposition separates the nilpotent and invertible actions of the central variable. On the invertible part, the Newton polygon of a product concatenates those of its factors (Mau, Proposition 2.3), and the single-edge lattice construction gives 2 (Mau, Theorems 3.8–3.9, 3.11). For 3 with `D` invertible use Mau's Theorem 4.1, with his invariant-factor meaning of rank (Definition 1.10). If `D` is singular, the stacked matrix has a nonzero common right kernel and the row matrix has a nonzero common left kernel; each has rank less than `d` over `𝕂`, so its modular rank is also less than `d`. The constant-term condition fails as well. Zero coefficients are omitted in Mau's Newton polygon (Definition 2.1), so nilpotent factors must be retained separately rather than assigned vacuous positive slopes. (Mau, Definition 1.10, p. 8, Definition 2.1, p. 9, Theorem 3.6, p. 17, Theorems 3.8–3.11, pp. 17–20, Theorem 4.1, p. 22; left ideals and the zero-primary summand are made explicit here.) *Needs:* Mathlib `Matrix`, division rings, Fitting decomposition of a finite-dimensional endomorphism.

**Checks.**

- For `d = 1` and `D = (c)`, `λ_1 = t − c` has the single slope `−v(c)`. For the Carlitz matrix `c = θ + τ = θ + σ^(−1)` (valuation `−1`) the slope is `1` and `σ^nD^n` is a unit modulo `σ^n`; both sides of 3 hold.
- For the scalar matrix `D = (θ)` (valuation `0`) the slope is `0`, every `s_n` is `0`, and the rank modulo `σ^0` is zero: both sides of 3 fail, matching that the scalar t-module is neither abelian nor `A`-finite.
- Invariant factors are unique only up to similarity: `𝕂[t]/(t − c) ≅ 𝕂[t]/(t − aca^(−1))` for `a ≠ 0`.
- For `D = 0` in dimension one, `λ_1 = t` has no finite edge, but `λ_1(0) = 0` and every rank condition fails. The same obstruction occurs for a nonzero nilpotent Jordan block.
- Over the commutative subcase `𝕂 = k((σ))`, `diag(1, σ)` has rank two modulo `σ²`, rank one modulo `σ`, and rank zero modulo `1`. It is not invertible modulo `σ²`.
- For `f = t − c` in the inverse-Frobenius skew field with `c^(1/q) ≠ c`, `σf − fσ = (c − c^(1/q))σ ≠ 0`. This nonzero constant-degree term cannot lie in `f𝕂[t]`; that right ideal does not define a left-module quotient.

<a id="dm-4-dual-realization"></a>

### 4.11 Dual motives and t-module points (`TModule.dualRealization`)

**Theorem.** Let `L` be perfect and `H = L[σ]^(1×d)` the row dual motive of a coordinate t-module `Φ`. The map `δ_1(Σ h_iσ^i) = Σ h_i^(q^i)`, applied coordinatewise, induces an `F`-linear `A`-module isomorphism `H/(σ − 1)H ≅ E(L)`, where `t` acts on `H` by right multiplication by `Φ_t^∗` and on `E(L) = L^d` through `Φ_t`; here `(σ − 1)H` is the image of `σ − 1`, an `F`-subspace, not an `L`-submodule. An effective dual t-motive that is finite free over both `L[t]` and `L[σ]` comes in this way from an `A`-finite t-module, and over a perfect field a t-module is abelian if and only if it is `A`-finite (Maurischat); the same holds for Anderson `A`-modules by restriction along a finite extension `F[t] ⊂ A`. This concerns the motives of actual t-modules; it does not add `σ`-finiteness to the broader definition of [§4.8](#dm-4-inverse-twist-dual-motive).

*Proof sketch.* Reduce `σ`-degree using `σ − 1` and the inverse twist; `δ_1` vanishes on `(σ − 1)H` and each class has a unique constant representative. The star relation identifies the `t`-actions. For abelian ⟺ `A`-finite, let `D` be the matrix of `Φ_t` over the skew Laurent field: the motive is finitely generated over `L[t]` if and only if the left block-power rank criterion holds, and the dual motive if and only if the right criterion holds (Mau, Propositions 6.4–6.5 and 6.1); both are equivalent to a nonzero constant term and positive slopes of the last invariant factor of `tI − D` by [§4.10](#dm-4-skew-invariant-factors). For general `A` choose a nonconstant `t ∈ A` (AlgebraicCurves Layer 5); `A` is finite over `F[t]`, so finite generation over `A ⊗_F L` and over `L[t]` agree. (BP, Theorem 4.3, p. 18, §4.5, pp. 18–19; Mau, Theorem 6.6 and proof, pp. 34–35, Corollary 8.1, p. 43.) *Needs:* [§4.9](#dm-4-star-adapter); [§4.8](#dm-4-inverse-twist-dual-motive); [§4.10](#dm-4-skew-invariant-factors); AlgebraicCurves Layers 2 and 5.

**Checks.**

- For `H = L[t]` with `σh = (t − θ)h`, the quotient `H/(σ − 1)H` is `L` with `t` acting by `x ↦ θx + x^q`: the Carlitz points.
- Replacing `(σ − 1)H` by the `L`-submodule it generates destroys the point action.
- For the scalar t-module `Φ_t = θ`, neither the motive nor the dual motive is finitely generated over `L[t]`, consistent with the equivalence.

<a id="dm-4-pre-t-motive"></a>

### 4.12 Pre-t-motives (`PreTMotive`)

**Definition.** Let `k̄` be an algebraic closure of `k = F_q(θ)` in `C_∞` and `K = k̄(t)`, with `σ` acting on `K` by the inverse coefficient twist. Let `K[σ, σ^(−1)]` be the twisted Laurent polynomial ring with `σf = f^(−1)σ`. A pre-t-motive is a left `K[σ, σ^(−1)]`-module that is finite-dimensional over `K`; morphisms are module maps. A basis column `m` gives a matrix `Φ_m ∈ GL_r(K)` with `σm = Φ_m m`; writing `σ(B)` for the entrywise twist, a morphism given in bases `m`, `n` by `φ(f·m) = f·B·n` satisfies `σ(B)Φ_n = Φ_mB`, and for another basis `n` with `m = Bn` one has `Φ_m = σ(B)Φ_nB^(−1)`. Tensor products are taken over `K` with diagonal `σ` (Kronecker products of matrices); the internal Hom `Hom(P, Q)` is `Hom_K(P, Q)` with `σ·ρ = σ ∘ ρ ∘ σ^(−1)`; the unit `𝟙` is `K` with `σf = f^(−1)`; the dual `P^∨ = Hom(P, 𝟙)` has matrix `(Φ_m^(−1))^tr` (here `^(−1)` is the matrix inverse). The Carlitz motive `C` is `K` with `σf = (t − θ)f^(−1)`, and `C(n)` is `C^⊗n`, `𝟙` or `(C^∨)^⊗(−n)`. An `A`-finite effective dual t-motive `H` over `k̄` gives the pre-t-motive `K ⊗_(k̄[t]) H`.

- `PreTMotive`: left `K[σ, σ^(−1)]`-modules of finite `K`-dimension.
- `PreTMotive.matrix`: the matrix `Φ_m` of a basis, with the change-of-basis and morphism rules above.
- `PreTMotive.tensor`, `PreTMotive.internalHom`, `PreTMotive.dual`: the tensor structure, with `Φ_(m⊗n) = Φ_m ⊗ Φ_n` (Kronecker product) and `Φ_(m^∨) = (Φ_m^(−1))^tr`.
- `PreTMotive.unit`, `PreTMotive.end_unit`: `End(𝟙) = F_q(t)`, because the elements of `K` fixed by `σ` are exactly `F_q(t)`.
- `PreTMotive.carlitz`: `C(n)` with matrix `(t − θ)^n`.
- `PreTMotive.ofDualMotive`: the rationalization `H ↦ K ⊗_(k̄[t]) H` of `A`-finite effective dual t-motives.
- `PreTMotive.isRigidAbelian`: the category is a rigid abelian `F_q(t)`-linear tensor category; the internal Hom is compatible with tensor products and `P ≅ P^∨∨`.

*Construction.* The ring `K[σ, σ^(−1)]` is a domain with centre `F_q(t)`. A rational function fixed by the coefficientwise inverse Frobenius has, after normalizing its denominator to be monic, coefficients fixed by Frobenius, hence in `F_q`; this gives `End(𝟙) = F_q(t)`. Bijectivity of `σ` on tensor products, internal Homs and duals is checked on matrices. (Pap, §3.1, p. 9, §3.2, pp. 9–11, Lemma 3.2.9 and Theorem 3.2.13, p. 11, §3.4.1–3.4.2, p. 17.) *Needs:* [§4.8](#dm-4-inverse-twist-dual-motive); [§4.7](#dm-4-carlitz-tensor-power); [§2.1](#dm-8-coefficient-twist); Mathlib `RatFunc`, `SkewPolynomial`.

**Checks.**

- `Hom(𝟙, C) = 0`: a nonzero `f ∈ K` with `(t − θ)f^(−1) = f` would have `deg f + 1 = deg f`.
- `C ⊗ C^∨ ≅ 𝟙`, and the matrix of `C^∨` is `1/(t − θ)`.
- Multiplication by `θ` on `𝟙` is not a morphism: `σθ = θ^(1/q)σ`, so `End(𝟙)` is `F_q(t)`, not `K`.

### Examples

- `C^⊗2` on `G_a²` with `t·(x, y) = (θx + y, θy + x^q)` has motive `L[t]` with `τ = (t − θ)²`, dual motive `L[t]` with `σ = (t − θ)²`, weight two, and pre-t-motive `C(2)`.
- The scalar t-module `Φ_t = θI_d` is neither abelian nor `A`-finite.

### Dependencies

Layers DM.0 and DM.2; Mathlib (`SkewPolynomial`, matrices, `RatFunc`, `Module.End`); FiniteFieldsAndCharacterSums (Frobenius twisted polynomials); AlgebraicCurves Layers 2 and 5; AlgebraicVectorBundles L0B, L1A–L1B, L2B; SchemeAndStackFoundations §1.1; RestrictedPowerSeries §7.2.

## Layer DM.1: Ideal torsion, Tate modules and characteristic completion

Torsion of a Drinfeld module is controlled by its motive: for a nonzero ideal `I`, the `I`-torsion group scheme corresponds to the finite shtuka `M/IM` under Drinfeld's functor. This gives finite local freeness of degree `#(A/I)^r` for every nonzero ideal, étaleness exactly away from the characteristic, and, through the semilinear Lang lemma, free torsion modules over separably closed fields. Tate modules at primes away from the characteristic follow, with their continuous Galois action; nonprincipal primes are handled through the canonical division-module description. At the characteristic place the completed motive is an effective local shtuka, which corresponds to the divisible local Anderson module of `p`-power torsion. This layer uses the motives of DM.4 and is read after it.

<a id="dm-1-finite-shtuka"></a>

### 1.1 Finite shtukas and Drinfeld's functor (`FiniteShtuka`, `FiniteShtuka.drinfeldGroup`)

**Definition.** Let `R` be an `F`-algebra with `σ = Frob_(q,R)`. A finite `F`-shtuka over `R` is a finite locally free `R`-module `V` with an `R`-linear map `F_V : σ^∗V → V`; morphisms are `R`-linear maps commuting with `F_V`. It is *étale* when `F_V` is an isomorphism, and then its `τ`-invariants over an `R`-algebra `R'` are the `F`-vector space `V^τ(R') = {v ∈ V ⊗_R R' : v = F_V(σ^∗v)}`. Drinfeld's functor sends `V` to the group scheme `Dr_q(V) = Spec((⊕_n Sym^n_R V)/(v^(⊗q) − F_V(σ^∗v) : v ∈ V))`, with comultiplication `v ↦ v ⊗ 1 + 1 ⊗ v` and `F`-action `[a]v = av`. In the other direction, an `F`-module scheme `G` gives `M_q(G) = Hom_(R-groups, F-linear)(G, G_(a,R))` with `F_(M_q(G))` induced by postcomposition with the q-Frobenius of `G_a`. A *strict* `F`-module scheme is an `F`-module scheme that is a relative complete intersection and whose `F`-action lifts to Faltings's canonical deformation so as to act on the co-Lie complex through `γ : F → R` (Faltings, Abrashkin).

- `FiniteShtuka`: the category of pairs `(V, F_V)`, `F`-linear.
- `FiniteShtuka.IsEtale`, `FiniteShtuka.tauInvariants`: étaleness and the `τ`-invariants `V^τ(R')`.
- `FiniteShtuka.drinfeldGroup`: `Dr_q(V)`, a contravariant functor to finite locally free `F`-module schemes.
- `FiniteShtuka.ofGroup`: `M_q(G)`, compatible with base change: `M_q(G) ⊗_R S = M_q(G ×_R S)`.
- `StrictFModuleScheme`: the strictness predicate; it is fpqc-local on `R` for finite locally free `G`.

*Construction.* `Dr_q(V)` is a closed subgroup scheme of the vector group of `V`, and the ideal is stable under comultiplication because `v ↦ v^(⊗q) − F_V(σ^∗v)` is additive; `(av)^(⊗q) − F_V(σ^∗(av)) = a^q(v^(⊗q) − F_V(σ^∗v))` with `a^q = a` gives the `F`-action. The strictness of `Dr_q(V)` comes from its canonical deformation `Spec((⊕ Sym^n V)/(I·I_0))`. Fpqc-locality of strictness is faithfully flat descent of the unique lift (Hartl, Lemma 4.4). (Har, Definitions 4.1, 4.2 and 4.5, pp. 12–14, Example 4.3 and Lemma 4.4, p. 13.) *Needs:* SchemeAndStackFoundations §1.1; AlgebraicVectorBundles L1A–L1B; Mathlib `CommHopfAlgCat`.

**Checks.**

- `V = R` with `F_V = 0` gives `Dr_q(V) = Spec R[X]/(X^q)`, connected of order `q`; with `F_V = 1` it gives the constant group `Spec R[X]/(X^q − X) = F_R`, which is étale.
- `G_(a,R)^d` is strict, and `M_q(G_(a,R)) = R{τ}`.
- A positive-rank finite shtuka with `F_V` nilpotent is not étale and its `τ`-invariants over a field are zero, although `Dr_q(V)` has order `q^(rank V)`.

<a id="dm-1-finite-shtuka-equivalence"></a>

### 1.2 The finite shtuka equivalence (`FiniteShtuka.antiEquivalence`)

**Theorem.** Over every `F`-algebra `R`, the functors `Dr_q` and `M_q` are mutually quasi-inverse anti-equivalences between finite `F`-shtukas over `R` and finite locally free strict `F`-module schemes over `R`. Both are `F`-linear and exact. For `G = Dr_q(V)`: `G` is étale over `R` if and only if `V` is étale; the natural maps `V → M_q(Dr_q(V))` and `G → Dr_q(M_q(G))` are isomorphisms; and the co-Lie complex of `G` is the complex `σ^∗V → V` given by `F_V`, so the co-Lie module of `G` is `coker F_V`.

*Proof sketch.* The theorem is Abrashkin's, with the étale, unit and co-Lie statements proved by Hartl–Singh; Hartl's §4 recalls it. Reduce by faithfully flat descent to a local presentation; the comparison `V → M_q(Dr_q(V))` sends `v` to the homomorphism `ξ ↦ v`, and the map `G → Dr_q(M_q(G))` sends `m` to `m^∗(ξ)`; the Frobenius relation `(m^∗ξ)^q = m^∗(ξ^q)` makes it well defined. The Jacobian criterion identifies étaleness with invertibility of `F_V`. (Har, Theorem 4.7, pp. 14–15; Example 4.6, p. 14, for the canonical isomorphism `E ≅ Dr_q(M_q(E))` of an abelian Anderson module.) *Needs:* [§1.1](#dm-1-finite-shtuka); SchemeAndStackFoundations §§1.1, 4.1.

**Checks.**

- For `V = R` with `F_V` multiplication by `c ∈ R^×`, `Dr_q(V) = Spec R[X]/(X^q − cX)` is étale, matching `F_V` invertible.
- The co-Lie module of `Dr_q(R, 0)` is `R` (one-dimensional, not étale), while that of `Dr_q(R, 1)` is `0`.
- For an abelian Anderson module `E`, `M_q(E)` is the motive `M(E)` of [§4.3](#dm-4-contravariant-motive) and `E ≅ Dr_q(M(E))`.

<a id="dm-1-semilinear-lang"></a>

### 1.3 The semilinear Lang lemma (`semilinear_lang`)

**Theorem.** Let `L` be a separably closed field containing `F`, and let `φ` be a `q`-semilinear map (`φ(cv) = c^qφ(v)`) of a finite-dimensional `L`-vector space `V` whose linearization `L ⊗_(L,Frob_q) V → V` is invertible. Then the fixed vectors `V^φ` form an `F`-vector space of dimension `dim_L V`, and `L ⊗_F V^φ → V` is an isomorphism. In matrix form: for every `Φ ∈ GL_r(L)` there is `B ∈ GL_r(L)` with `ΦB^[q] = B` (`B^[q]` the matrix of entrywise `q`-th powers), unique up to right multiplication by `GL_r(F)`. The raw semilinear map need not be surjective when `L` is imperfect. If `L` is moreover perfect, the same holds for inverse-semilinear maps: for every `Φ ∈ GL_r(L)` there is `B ∈ GL_r(L)` with `B^(−1) = ΦB` for the entrywise inverse twist `B^(−1)`. The same statements hold with `GL_r` replaced by `Res_((A/I) | F) GL_r` for a nonzero ideal `I ⊂ A`, giving free `A/I`-modules of rank `r` of fixed vectors.

*Proof sketch.* Lang's theorem for the smooth connected group `GL_r` over `F` (ReductiveGroupsPartII RG2.3.7) says that `g ↦ g^(−1)Frob(g)` is finite étale and surjective; over a separably closed field the fibres are nonempty finite étale `L`-schemes, so they have `L`-points. Choosing `g` with `g^(−1)Frob(g) = Φ` gives `B = g^(−1)` with `ΦB^[q] = B`; its columns are `L`-independent fixed vectors, and a fixed vector `Bc` has `c^[q] = c`, so `c ∈ F^r`. The inverse-twist form is the same equation for the inverse Frobenius, obtained by applying the Frobenius once. For `Res_((A/I)|F) GL_r`, use RG2.0a.2 for the Weil restriction, which is again smooth and connected. (Har, proof of Proposition 6.5, p. 26, which Hartl credits to Anderson for fields.) *Needs:* ReductiveGroupsPartII RG2.3.7, RG2.0a.2.

**Checks.**

- For `V = L` and `φ(c) = c^q`, `V^φ = F`.
- For `L = F̄`, `r = 1` and `Φ = (a)`, a solution is `b` with `a·b^q = b`, i.e. `b^(q−1) = a^(−1)`; its `q − 1` choices differ by `F^×`.
- Over the non-separably-closed field `F` itself, `φ(c) = a·c^q` with `a ∈ F^×`, `a ≠ 1`, has `V^φ = 0`: separable closedness is needed.
- For `L = F(t)^sep`, `φ(x) = x^q` has invertible linearization and fixed space `F`, although `t` has no `q`-th root in `L` and the raw map is not surjective.

<a id="dm-1-ideal-torsion"></a>

### 1.4 Ideal torsion (`DrinfeldModule.idealTorsion`)

**Definition.** For a nonzero ideal `I ⊂ A` and a Drinfeld module (or abelian Anderson module) `E` over `S`, the `I`-torsion `E[I] = ker(E → E^n, x ↦ (φ_(a_1)x, …, φ_(a_n)x))` for generators `a_1, …, a_n` of `I`. It does not depend on the generators, `E[I](S') = {x ∈ E(S') : φ_a(x) = 0 for all a ∈ I}`, it is an `A/I`-module scheme, `E[A] = 0`, `E[(a)] = ker φ_a`, and `E[IJ] ≅ E[I] × E[J]` when `I + J = A`.

- `DrinfeldModule.idealTorsion`: the closed `A/I`-module subscheme `E[I]`.
- `DrinfeldModule.idealTorsion_span_singleton`: `E[(a)] = ker φ_a`.
- `DrinfeldModule.idealTorsion_baseChange`: `E[I] ×_S S'` is the `I`-torsion of the pullback.
- `DrinfeldModule.idealTorsion_mul`: for `I + J = A`, `E[IJ] ≅ E[I] × E[J]`.

*Construction.* On affine charts quotient the coordinate ring by the q-linearized polynomials of the generators. A smaller generating set factors through a larger one, giving independence; elements `a ∈ I`, `b ∈ J` with `a + b = 1` give the Chinese-remainder splitting `x ↦ (φ_b x, φ_a x)`. (Har, Definition 6.1, p. 23, Lemmas 6.2–6.3, p. 24.) *Needs:* [§0.9](#dm-0-relative-drinfeld-module); [§0.8](#dm-0-kernel-scheme); Mathlib `Ideal.span`.

**Checks.**

- `E[A]` is the zero group scheme, of order one.
- `C[(t)] = Spec L[X]/(θX + X^q)` for the Carlitz module.
- At `θ = 0`, `C[(t)]` has length `q` although its geometric points form the zero group.

<a id="dm-1-finite-flat-torsion"></a>

### 1.5 Torsion is finite locally free (`DrinfeldModule.idealTorsion_finiteLocallyFree`)

**Theorem.** Let `E` be an abelian Anderson `A`-module (for instance a Drinfeld module of rank `r`) over `R`, with motive `M = M(E)`, and let `I ≠ 0` be an ideal. Then `E[I]` is a finite locally free strict `F`-module scheme over `R`, and there are canonical `A`-equivariant isomorphisms `M/IM ≅ M_q(E[I])` of finite shtukas and `Dr_q(M/IM) ≅ E[I]`. For a Drinfeld module of rank `r`, `E[I]` has degree `#(A/I)^r`. This holds for nonprincipal `I` and without assuming `γ(I)` invertible.

*Proof sketch.* `A` is Dedekind, so by the Chinese remainder splitting and exactness of `Dr_q` ([§1.2](#dm-1-finite-shtuka-equivalence)) it suffices to treat `I = 𝔭^e`. Choose `z ∈ A` congruent modulo `I` to a uniformizer at `𝔭`; multiplication by `z^(e−n)` gives exact sequences `0 → E[𝔭^(e−n)] → E[𝔭^e] → E[𝔭^n] → 0` of fpqc sheaves, and induction from the principal case `E[(a)] = ker φ_a` (finite locally free by [§0.8](#dm-0-kernel-scheme) over a field and by Hartl's isogeny results in general) gives local freeness and the comparison with `M/𝔭^eM`. `M/IM` is locally free of rank `r·dim_F(A/I)` over `R`, so `Dr_q(M/IM)` has degree `q^(r·dim_F A/I) = #(A/I)^r`. (Har, Theorem 6.4 and proof, pp. 24–26.) *Needs:* [§1.4](#dm-1-ideal-torsion); [§1.2](#dm-1-finite-shtuka-equivalence); [§4.2](#dm-4-effective-a-motive); [§4.3](#dm-4-contravariant-motive); AlgebraicCurves Layers 2 and 3.

**Checks.**

- A nonprincipal ideal of `A` still gives torsion of degree `#(A/I)^r`.
- At the characteristic, `E[I]` is finite flat but not étale: for `C_t = τ` over `F`, `C[(t)] = Spec F[X]/(X^q)`.
- For `I = (a)` principal, the degree is `q^(deg_τ φ_a) = q^(r·deg_A a)`, as in [§0.8](#dm-0-kernel-scheme).

<a id="dm-1-etale-torsion"></a>

### 1.6 Torsion is étale away from the characteristic (`DrinfeldModule.idealTorsion_etale_iff`)

**Theorem.** For an abelian Anderson `A`-module of positive dimension on every fibre (in particular a Drinfeld module), `E[I]` is étale over `R` if and only if `γ(I)` generates the unit ideal of `R`, that is `I·A_R + J = A_R` with `J = ker(A_R → R)` as in [§4.2](#dm-4-effective-a-motive). Over a field this means `I` is coprime to the characteristic. For an Anderson module with zero-dimensional components, the unit-ideal criterion is imposed only on its positive-dimensional locus; the torsion on a zero-dimensional component is the trivial étale group. For principal `I = (a)` the differential is `dΦ_a = γ(a)I + N_a` with `N_a` nilpotent (for a Drinfeld module it is the scalar `γ(a)`); an isogeny has invertible differential exactly when its kernel is étale.

*Proof sketch.* If `R·γ(I) = R`, cover `Spec R` by the opens where some `γ(a_i)` is a unit; there `E[I]` is a closed subscheme of `E[(a_i)] = ker φ_(a_i)`, which is étale because its q-linearized polynomial has unit linear coefficient (FiniteFieldsAndCharacterSums *linearized-polynomial-separable-iff*); flatness from [§1.5](#dm-1-finite-flat-torsion) then gives étaleness. Conversely, if `R·γ(I)` lies in a maximal ideal, the differentials `dφ_(a_i)` are nilpotent and commute, so their kernels meet nontrivially and the Jacobian criterion fails. Equivalently, the co-Lie module of `E[I]` is `coker(τ_M mod I)`, which vanishes exactly when `I·A_R + J = A_R` ([§1.2](#dm-1-finite-shtuka-equivalence)). (Har, Theorem 6.4(b) and proof, pp. 25–26.) *Needs:* [§1.5](#dm-1-finite-flat-torsion); FiniteFieldsAndCharacterSums *linearized-polynomial-separable-iff*.

**Checks.**

- For `C_t = τ` at `θ = 0`, `C[(t)]` is connected while `C[(t − 1)]` is étale.
- For the Carlitz module over `F(θ)`, every `C[(a)]` with `a ≠ 0` is étale.
- For `φ_t = τ²` over `F`, `φ[(t)] = Spec F[X]/(X^(q²))` is not étale, and `γ(t) = 0` is not a unit.
- The zero Anderson module has trivial étale `I`-torsion even when `γ(I) = 0`; the converse needs positive dimension, as in Har, Definition 1.2.

<a id="dm-1-geometric-torsion-basis"></a>

### 1.7 Torsion over separably closed fields (`DrinfeldModule.idealTorsion_free`)

**Theorem.** Let `I` be a nonzero ideal with `R·γ(I) = R`, and let `L'` be a separably closed field over `R`. Then `M/IM` is an étale finite shtuka, `(M/IM)^τ(L')` is a free `A/I`-module of rank `r`, and there is an `A/I`-linear isomorphism `E[I](L') ≅ Hom_(A/I)((M/IM)^τ(L'), Hom_F(A/I, F))`, `P ↦ (m ↦ (ā ↦ m ∘ φ_a(P)))`. In particular `E[I](L')` is free of rank `r` over `A/I`, and the `π_1` of `Spec R` acts continuously.

*Proof sketch.* `τ_M` is invertible modulo `I` because `I·A_R + J = A_R`. After choosing a local basis of `M/IM` over `(A/I) ⊗_F R`, the semilinear Lang lemma for `Res_((A/I)|F) GL_r` ([§1.3](#dm-1-semilinear-lang)) gives a finite étale cover over which the `τ`-invariants form a free `A/I`-module of rank `r`. The pairing is evaluation through the dualizing module `Hom_F(A/I, F)`; it is perfect by [§1.2](#dm-1-finite-shtuka-equivalence) applied to `Dr_q(M/IM) = E[I]`. The duality uses the trace-dual module explicitly rather than identifying the two sides silently. (Har, Proposition 6.5 and Theorem 6.6, p. 26.) *Needs:* [§1.6](#dm-1-etale-torsion); [§1.3](#dm-1-semilinear-lang); [§4.3](#dm-4-contravariant-motive).

**Checks.**

- For rank `r`, `E[I](L')` has `#(A/I)^r` points.
- The statement fails at the characteristic: `C[(t)](F̄) = 0` for `C_t = τ`.
- For the Carlitz module and `I = (a)`, `C[(a)](L') ≅ A/(a)` (Carlitz cyclotomy).

<a id="dm-1-tate-module"></a>

### 1.8 Tate modules (`DrinfeldModule.tateModule`)

**Definition.** Let `λ ≠ ker γ` be a nonzero prime of `A`, `A_λ = lim A/λ^n` and `K_λ = Frac(A_λ)`. The `λ`-adic Tate module of a Drinfeld module `E` over a field `L` is `T_λE = Hom_A(K_λ/A_λ, E[λ^∞](L^sep))`, equivalently `lim_n E[λ^n](L^sep)` along the maps `φ_z : E[λ^(n+1)] → E[λ^n]` for an element `z ∈ λ ∖ λ²`; different choices are identified through the division-module description; the coordinates of a compatible sequence do depend on `z`. It is free of rank `r` over `A_λ`; `V_λE = K_λ ⊗ T_λE`. The transition maps are not multiplication by a global generator, which a nonprincipal `λ` does not have.

- `DrinfeldModule.tateModule`: the `A_λ`-module `T_λE`.
- `DrinfeldModule.tateModule_mod`: canonical evaluation gives `(λ^(−n)A_λ/A_λ) ⊗_(A_λ) T_λE ≅ E[λ^n](L^sep)`. Choosing `z` gives `T_λE/λ^nT_λE ≅ E[λ^n](L^sep)` by evaluation at `z^(−n)`; changing `z` changes this identification.
- `DrinfeldModule.tateMap`: a morphism `u` induces `T_λu`, functorially.
- `DrinfeldModule.tateModule_free`: `T_λE` is free of rank `rank E`.
- `DrinfeldModule.tateModule.lift`, `DrinfeldModule.tateModule.ext`: compatible systems of `λ^n`-torsion points define elements, determined by their finite levels.

*Construction.* By [§1.7](#dm-1-geometric-torsion-basis) each `E[λ^n](L^sep)` is free of rank `r` over `A/λ^n`; `φ_z` maps `E[λ^(n+1)]` onto `E[λ^n]` with kernel `E[λ]`, because `(z) + λ^(n+1) = λ` and the orders match; compatible bases lift to a basis of the limit. The division-module description is canonical; a choice of `z` identifies it with the inverse limit. (Sta, Definition 2.26 and Proposition 2.28, pp. 12–14.) *Needs:* [§1.7](#dm-1-geometric-torsion-basis); AlgebraicCurves Layer 5.

**Checks.**

- For the Carlitz module and `λ` away from the characteristic, `T_λC` has rank one. Replacing the parameter `z` by `uz` multiplies the level-`n` evaluation identification by `u^(−n)`; a parameter-free evaluation at `z^(−n)` is not defined.
- For `φ_t = τ²` over `F` and `λ = (t − 1)`, `T_λφ` has rank two.
- A nonzero isogeny induces an injection with finite cokernel, hence an isomorphism of rational Tate modules.
- For `C_t = τ` the separable `t`-power torsion is zero: there is no rank-one `t`-adic Tate module at the characteristic.

<a id="dm-1-continuous-galois-action"></a>

### 1.9 The Tate representation (`DrinfeldModule.tateGaloisAction`)

**Definition.** The Galois group `G_L = Gal(L^sep/L)` acts on `T_λE`, `A_λ`-linearly and continuously for the inverse-limit topology, giving `ρ_λ : G_L → Aut_(A_λ)(T_λE)`, and `GL_r(A_λ)` after choosing a basis. Modulo `λ^n` it is the action on `E[λ^n](L^sep)`; each stabilizer of a finite level is open because a finite separable extension splits that torsion.

- `DrinfeldModule.tateGaloisAction`: the continuous `A_λ`-linear action of `G_L`.
- `DrinfeldModule.tateGaloisAction_mod`: reduction modulo `λ^n` is the torsion action.
- `DrinfeldModule.tateMap_equivariant`: `T_λu` commutes with `G_L`.

*Construction.* The étale torsion schemes correspond to finite continuous `G_L`-sets (SchemeAndStackFoundations §2.15); compatible actions pass to the limit, and naturality of the torsion maps gives equivariance. (Pik, §3.2, pp. 12–14.) *Needs:* [§1.8](#dm-1-tate-module); [§1.6](#dm-1-etale-torsion); SchemeAndStackFoundations §2.15.

**Checks.**

- For separably closed `L` the action is trivial.
- Over `F_(q^m)`, arithmetic Frobenius acts on torsion points by `x ↦ x^(q^m)`.
- Changing the basis by `B` replaces each matrix `ρ(g)` by `B^(−1)ρ(g)B`.

<a id="dm-1-local-shtuka"></a>

### 1.10 Local shtukas and divisible local Anderson modules (`LocalShtuka`)

**Definition.** Let `𝔭 ⊂ A` be a maximal ideal with residue field `F_𝔭` of size `q̂ = q^f`, let `z ∈ K_0` be a uniformizer at `𝔭`, so that `F_𝔭[[z]] ≅ Â_𝔭`, and let `R` be an `A`-algebra in which `γ(𝔭)` is nilpotent. The completion `Â_(𝔭,R) = (F_𝔭 ⊗_F R)[[z]]` splits as the product over `i ∈ ℤ/f` of the factors `Â_(𝔭,R)/𝔞_i ≅ R[[z]]` on which `a ⊗ 1` acts as `1 ⊗ γ(a)^(q^i)` for `a ∈ F_𝔭`; `σ` permutes the factors cyclically and `σ̂ = σ^f` preserves each, acting by `b ↦ b^q̂` on `R` and fixing `z`. A local shtuka of rank `r` over `R` is a locally free `R[[z]]`-module `M̂` of rank `r` with an isomorphism `τ_M̂ : σ̂^∗M̂[1/(z − γ(z))] ≅ M̂[1/(z − γ(z))]`; it is *effective* when `τ_M̂(σ̂^∗M̂) ⊂ M̂` and *étale* when equality holds. A `𝔭`-divisible local Anderson module is an fppf sheaf `G` of `F_𝔭[[z]]`-modules that is `z`-torsion and `z`-divisible, whose `G[z^n]` are finite locally free strict `F_𝔭`-module schemes, and on whose co-Lie module `(z − γ(z))^d = 0` for some `d`.

- `LocalShtuka`: locally free `R[[z]]`-modules with `τ_M̂`, effective and étale variants.
- `LocalShtuka.ofMotive`: `M̂_𝔭(M) = (M ⊗ Â_(𝔭,R)/𝔞_0, τ_M^f)`, the local shtuka at `𝔭` of an `A`-motive; it is effective exactly when `M` is.
- `DivisibleLocalAndersonModule`: the sheaves `G` above, with dimension `rank ω_G`.
- `LocalShtuka.drinfeldGroup`: `Dr_q̂(M̂) = colim_n Dr_q̂(M̂/z^nM̂)`, a direct limit of fppf sheaves.

*Construction.* The splitting is the Chinese remainder theorem for the ideals `𝔞_i`, after lifting `F_𝔭` into `Â_𝔭` (Hensel, AlgebraicCurves Layer 5); `J·Â_(𝔭,R)/𝔞_0 = (z − γ(z))` and `J` is the unit ideal on the other factors, so the motive is recovered from its `𝔞_0`-factor. Each `M̂/z^nM̂` is a finite `F_𝔭`-shtuka and [§1.2](#dm-1-finite-shtuka-equivalence) (for `q̂`) gives the finite levels. (Har, §7 introduction, Definition 7.1, Example 7.2 and Definition 7.3, pp. 27–28.) *Needs:* [§1.2](#dm-1-finite-shtuka-equivalence); [§4.2](#dm-4-effective-a-motive); AlgebraicCurves Layer 5.

**Checks.**

- If `F_𝔭 = F` then `f = 1`, `σ̂ = σ` and `M̂_𝔭(M) = M ⊗ Â_(𝔭,R)`.
- For `f > 1`, the factor `𝔞_0` is preserved by `σ^f` and not by `σ`.
- `M̂ = R[[z]]` with `τ = z − γ(z)` is effective of rank one and not étale; with `τ = 1` it is étale.

<a id="dm-1-local-shtuka-equivalence"></a>

### 1.11 The local shtuka equivalence (`LocalShtuka.antiEquivalence`)

**Theorem.** The functors `Dr_q̂` and `M_q̂(G) = lim M_q̂(G[z^n])` are mutually quasi-inverse anti-equivalences between effective local shtukas over `R` and `𝔭`-divisible local Anderson modules over `R`. They are `F_𝔭[[z]]`-linear, exact and preserve étale objects; `G` is a formal Lie group exactly when `τ_M̂` is topologically nilpotent; and `ω_(Dr_q̂(M̂)) ≅ coker τ_M̂`.

*Proof sketch.* Pass to the limit in [§1.2](#dm-1-finite-shtuka-equivalence) along the closed immersions `Dr_q̂(M̂/z^nM̂) → Dr_q̂(M̂/z^(n+1)M̂)`; the co-Lie statement is the finite-level statement in the limit. Hartl cites Hartl–Singh for this theorem. (Har, Theorem 7.4, p. 28.) *Needs:* [§1.10](#dm-1-local-shtuka); [§1.2](#dm-1-finite-shtuka-equivalence).

**Checks.**

- `M̂ = R[[z]]`, `τ = 1` corresponds to the constant étale module `K_𝔭/Â_𝔭` (étale, dimension zero).
- `M̂ = R[[z]]`, `τ = z − γ(z)` has `coker τ ≅ R`: dimension one.
- Over `R = F_𝔭` with `γ(z) = 0`, `τ = z` is topologically nilpotent and the module is a formal Lie group.

<a id="dm-1-characteristic-local-realization"></a>

### 1.12 The realization at the characteristic place (`DrinfeldModule.charLocalRealization`)

**Theorem.** Let `E` be an abelian Anderson `A`-module (for instance a Drinfeld module of rank `r`) over `R` with motive `M`, and let `𝔭` be a maximal ideal with `γ(𝔭)` nilpotent in `R`. Then every `E[𝔭^n]` is a finite locally free strict `F_𝔭`-module scheme, `E[𝔭^∞] = colim_n E[𝔭^n]` is a `𝔭`-divisible local Anderson module, and there are canonical isomorphisms `M_q̂(E[𝔭^∞]) ≅ M̂_𝔭(M)`, `E[𝔭^∞] ≅ Dr_q̂(M̂_𝔭(M))` and `E[𝔭^n] ≅ Dr_q̂(M̂/𝔭^nM̂)`. For a Drinfeld module of rank `r`, `M̂_𝔭(M)` is an effective local shtuka of rank `r` whose `τ`-cokernel is locally free of rank one over `R` and killed by `z − γ(z)`. Freeness over `R[[z]]` holds after choosing a local frame.

*Proof sketch.* Complete the motive at `𝔭` and keep the distinguished factor `𝔞_0`, on which `F_𝔭` acts through the completed characteristic map; iterating `τ` `f` times returns to that factor. The finite levels are [§1.5](#dm-1-finite-flat-torsion) for `I = 𝔭^n`, and the limit is [§1.11](#dm-1-local-shtuka-equivalence). The connected–étale decomposition of the finite levels is kept separate from separable points. (Har, Theorem 7.6, p. 28.) *Needs:* [§1.11](#dm-1-local-shtuka-equivalence); [§1.5](#dm-1-finite-flat-torsion); [§4.2](#dm-4-effective-a-motive).

**Checks.**

- For `φ_t = τ²` over `F` and `𝔭 = (t)`, `φ[t^n] = Spec F[X]/(X^(q^(2n)))` is connected of order `q^(2n)`.
- For `𝔭` of degree `f`, the distinguished factor is preserved by `τ^f` but in general not by `τ`.
- Replacing `φ[t^n]` by its separable points turns all these connected kernels into the zero group, losing the realization.

### Examples

- For the Carlitz module over `F(θ)` and a monic irreducible `P ∈ F[t]`, `C[(P)](F(θ)^sep) ≅ A/(P)`, and `ρ_P` is the Carlitz cyclotomic character `G_(F(θ)) → A_P^×`.
- For the Carlitz module over `F` with `θ = 0` (characteristic `(t)`), `C[t^∞]` is the formal Lie group with local shtuka `F[[z]]`, `τ = z`.

### Dependencies

Layers DM.0 and DM.4; FiniteFieldsAndCharacterSums (linearized separability); ReductiveGroupsPartII RG2.0a.2, RG2.3.7; AlgebraicCurves Layers 2, 3 and 5; AlgebraicVectorBundles L1A–L1B; SchemeAndStackFoundations §§1.1, 2.15, 4.1; Mathlib `CommHopfAlgCat`, `Ideal.span`.

## Layer DM.3: Level moduli, Satake compactification and modular forms

Full level structures away from the characteristic rigidify Drinfeld modules: the level-`N` functor is represented by a smooth affine scheme of relative dimension `r − 1` over `A[1/N]`, and the unlevelled moduli stack is its quotient. Generalized Drinfeld modules, which allow the rank to drop on fibres, give Pink's Satake compactification, unique by a normality and weak-separation property; an explicit reciprocal model seeds the construction. The dual of the Lie algebra is ample on the compactification and its sections are the algebraic Drinfeld modular forms, with Hecke operators defined by pullback and trace. Over `A[1/N]` the arithmetic compactification of Hartl–Yu extends all of this.

<a id="dm-3-level-structure"></a>

### 3.1 Level structures (`DrinfeldLevel`)

**Definition.** For a nonzero proper ideal `N ⊂ A` and an `A[1/N]`-scheme `S` (where `A[1/N] = Γ(Spec A − V(N), 𝒪)`), a full level-`N` structure on a Drinfeld module `E` of rank `r` over `S` is an `A`-linear isomorphism of finite étale `S`-group schemes `(N^(−1)/A)^r_S ≅ E[N]`. No generator of `N` is chosen, and the source is the ideal quotient `N^(−1)/A`, not a chosen basis of `(A/N)^r`. For `N' ⊂ N`, restriction to `N`-torsion forgets the extra level.

- `DrinfeldLevel`: the isomorphism `(N^(−1)/A)^r_S ≅ E[N]`.
- `DrinfeldLevel.pullback`: pullback along a map of `A[1/N]`-schemes.
- `DrinfeldLevel.forget`: restriction from level `N'` to level `N ⊃ N'`.
- `DrinfeldLevel.change`: the action of `Aut_A((N^(−1)/A)^r)` (`≅ GL_r(A/N)` after a choice) by precomposition.
- `DrinfeldLevel.ext`: level structures on the same family agree when their group-scheme maps agree.

*Construction.* `E[N]` is finite étale over `A[1/N]` by [§1.6](#dm-1-etale-torsion) and fibrewise free of rank `r` by [§1.7](#dm-1-geometric-torsion-basis); the isomorphism functor is a finite étale torsor of frames, and restriction is compatible with composition. (HY, §2, equation (2.4) and Theorem 2.3, pp. 7–8.) *Needs:* [§1.4](#dm-1-ideal-torsion); [§1.6](#dm-1-etale-torsion); [§1.7](#dm-1-geometric-torsion-basis); SchemeAndStackFoundations §1.1.

**Checks.**

- For `A = F[t]` and `N = (t)`, a level structure is an ordered `F`-basis of `ker φ_t`.
- For the Carlitz module and `N = (t)` away from `θ = 0`, a nonzero `t`-torsion section is a full level.
- In rank two, sending both basis vectors to the same nonzero torsion point is not a level structure.
- For `φ_t = τ` at the characteristic `(t)`, the connected kernel of length `q` is not isomorphic to the étale constant group `F`.

<a id="dm-3-fine-moduli-scheme"></a>

### 3.2 Fine moduli schemes (`DrinfeldModuli.fine`)

**Theorem.** For every nonzero proper `N ⊂ A`, the functor of Drinfeld modules of rank `r` with full level-`N` structure on `A[1/N]`-schemes is represented by an affine smooth scheme `M_r(N)` of finite type and relative dimension `r − 1` over `A[1/N]`, with a universal family. For a compact open `K ⊂ GL_r(Â)`, call `K` *fine* if its image in some `GL_r(A/𝔭)` is unipotent, and let `N_K` be the largest ideal with `K(N_K) ⊂ K`. The `K`-level moduli problem over `A[1/N_K]` is representable by a smooth scheme when `K` is fine, and has a coarse moduli scheme in general. The two-prime condition needed for a level functor over all of `Spec A` is not required on these bases.

*Proof sketch.* Over a principal-level chart the standard coefficients and the torsion equations give an explicit affine scheme; infinitesimal deformations of a Drinfeld module with level structure form a space of dimension `r − 1` and are unobstructed, so the functor is formally smooth of finite presentation, hence smooth (SchemeAndStackFoundations §§4.1, 4.3); this is Drinfeld's argument, which Hartl–Yu cite. For fine `K`, a scalar fixing a fine level acts both semisimply and unipotently on torsion, hence trivially, so finite-group quotients of the principal-level schemes by the image of `K` (SchemeAndStackFoundations §1.17) are fine; for general `K` they are coarse. (HY, Theorem 2.3, p. 8, Definition 2.6, Lemma 2.7 and Proposition 2.8, pp. 10–11.) *Needs:* [§3.1](#dm-3-level-structure); [§0.10](#dm-0-relative-standardization); SchemeAndStackFoundations §§1.1, 1.17, 4.1, 4.3.

**Checks.**

- For `A = F[t]`, `N = (t)` and `r = 1`, `M_1((t))` is zero-dimensional over `F(t)`.
- In rank two the principal-level generic fibre is a smooth affine curve.
- A scalar `c ∈ F^×` fixes no full level-`N` structure unless `c = 1`, which is why the level schemes are fine.

<a id="dm-3-moduli-functor"></a>

### 3.3 The moduli stack (`DrinfeldModuli`)

**Definition.** For `r ≥ 1`, the Drinfeld moduli stack assigns to an `A`-scheme `S` the groupoid of Drinfeld modules of rank `r` over `S` ([§0.9](#dm-0-relative-drinfeld-module)) and their isomorphisms, with pullback. It is an fpqc stack and a smooth Deligne–Mumford stack of relative dimension `r − 1` over `Spec A`. Over `A[1/N]`, the level-`N` scheme is an étale atlas and the quotient by `Aut_A((N^(−1)/A)^r)` recovers the unlevelled stack. Its set of isomorphism classes is not its stack structure.

- `DrinfeldModuli`: the fibred groupoid of rank-`r` Drinfeld modules.
- `DrinfeldModuli.pullback`: base change with its coherence.
- `DrinfeldModuli.levelAtlas`: the fine level scheme is an étale atlas on `A[1/N]`.
- `DrinfeldModuli.quotientPresentation`: the quotient stack of the level atlas by the frame group is the unlevelled stack there.

*Construction.* Descend line bundles, the q-linearized actions and level frames along fpqc covers (SchemeAndStackFoundations §1.1). Two coprime nonzero ideals `N`, `N'` give level atlases covering `Spec A`; the quotient presentations glue, and the coarse space of a finite quotient stack is SchemeAndStackFoundations §1.23. (HY, Theorem 2.3 and §2 equations (2.7)–(2.9), pp. 8–9, Proposition 2.8, pp. 10–11.) *Needs:* [§0.9](#dm-0-relative-drinfeld-module); [§3.1](#dm-3-level-structure); [§3.2](#dm-3-fine-moduli-scheme); SchemeAndStackFoundations §§1.1, 1.23.

**Checks.**

- The unlevelled Carlitz object has automorphism group `F^×`; with a nontrivial full level it has trivial stabilizer.
- The relative dimensions in ranks one and two are zero and one.
- Replacing each groupoid by its set of isomorphism classes loses the automorphism group `F^×` when `q > 2`.

<a id="dm-3-generalized-drinfeld-module"></a>

### 3.4 Generalized Drinfeld modules (`GeneralizedDrinfeldModule`)

**Definition.** A generalized Drinfeld `A`-module of rank at most `r` over an `A`-scheme `S` is an invertible sheaf `ℰ` with an `F`-linear `A`-action `φ_a = Σ_(i=0)^(r·deg_A a) b_i(a)τ^i` on its additive group, with differential `γ`, such that every fibre over a field is a Drinfeld module of positive rank at most `r`; the coefficients `b_i(a)` are sections of `ℰ^(⊗(1−q^i))`. It is *weakly separating* if for every algebraically closed field `L` over the base, each isomorphism class of Drinfeld modules over `L` occurs at only finitely many points of `S(L)`. The global degree bound cannot be replaced by a fibrewise bound over a nonreduced base.

- `GeneralizedDrinfeldModule`: the bounded action on a line bundle with positive-rank fibres.
- `GeneralizedDrinfeldModule.coeff`: `b_i(a) ∈ Γ(S, ℰ^(⊗(1−q^i)))`.
- `GeneralizedDrinfeldModule.pullback`: the degree bound and fibre conditions survive base change.
- `GeneralizedDrinfeldModule.IsWeaklySeparating`: finiteness of the fibres of each geometric isomorphism class.
- `GeneralizedDrinfeldModule.ext`: on a fixed line bundle, the coefficients on a trivializing cover determine the family.

*Construction.* Glue the bounded twisted-polynomial descriptions under changes of trivialization, as in [§0.9](#dm-0-relative-drinfeld-module), with the invertible sheaf of AlgebraicVectorBundles L0B. Weak separation is a condition on the classifying map and is not preserved by arbitrary base change. (Pin, Definitions 3.1–3.2, p. 10, Definition 3.9, p. 13.) *Needs:* [§0.9](#dm-0-relative-drinfeld-module); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*; AlgebraicVectorBundles L0B, L2B.

**Checks.**

- Over `F(θ)[g]`, `φ_t = θ + τ + gτ²` has generic rank two and rank one at `g = 0`; it is generalized of rank at most two.
- Where all positive coefficients vanish the fibre is scalar, so such a family is excluded.
- Over `F(θ)[ε]/(ε²)`, `θ + τ + ετ³` has fibre rank one but violates the degree bound for rank at most one.
- A constant family over a positive-dimensional affine line is not weakly separating.

<a id="dm-3-reciprocal-compactification"></a>

### 3.5 The reciprocal model (`DrinfeldReciprocalScheme`)

**Definition.** Let `V = F^r`, `S = Sym_F V` and `Q(V) = Frac(S)`. Let `R(V) ⊂ Q(V)` be the `F`-algebra generated by the reciprocals `1/v` of the nonzero `v ∈ V`, graded by `deg(1/v) = 1`, and `Q_r = Proj R(V)`. Then `Q_r` is a normal integral projective `F`-scheme; over `F[t, 1/t]` the open subscheme where no reciprocal vanishes is the complement of all `F`-rational hyperplanes in `P^(r−1)`, which is the principal level-`(t)` moduli scheme, and the action `φ_t(X) = tX ∏_(0≠v∈V) (1 − X/v)` on `𝒪(−1)` extends it to a weakly separating generalized Drinfeld module of rank at most `r` on `Q_r × Spec F[t, 1/t]`, with Lie dual `𝒪(1)`.

- `DrinfeldReciprocalRing`: the graded subalgebra `R(V)` of `Frac(Sym_F V)`.
- `DrinfeldReciprocalScheme`: `Q_r = Proj R(V)`.
- `DrinfeldReciprocalScheme.universalAction`: `tX ∏(1 − X/v)` on `𝒪(−1)`.
- `DrinfeldReciprocalScheme.lieDual`: `Lie(E)^∨ ≅ 𝒪(1)`.

*Construction.* The reciprocals satisfy `1/(cv) = c^(−1)/v` and `(1/v)(1/w) = (1/(v + w))(1/v + 1/w)` when `v, w, v + w ≠ 0`, and these relations present `R(V)`; `R(V)` is a Cohen–Macaulay normal domain and `Q_r` is projectively normal (Pink–Schieder). For normality, PS Theorem 2.7 makes `R(V)` finite free over a polynomial subring on `r` generators, giving a regular sequence of full dimension and the Cohen–Macaulay property. PS Theorem 8.4 supplies regularity in codimension one independently of normality; Serre's `R₁` and `S₂` criterion then applies (PS, proof of Theorem 1.7, p. 9). Reverse the source's negative grading so that each reciprocal has degree one. The dense open is computed by localization (SchemeAndStackFoundations §0.3). Some degree-one reciprocal is nonzero at each point of `Proj`, so no fibre is scalar; finite permutations of reciprocal values give weak separation. Expand the product over unordered subsets of `V ∖ {0}`; Hartl–Yu's display (3.7) sums over ordered tuples and overcounts by factorials. (HY, Lemma 3.10 and Proposition 3.11 with proof, pp. 17–19; PS, Theorems 1.6–1.7 and 1.11, pp. 5–6.) *Needs:* [§3.4](#dm-3-generalized-drinfeld-module); FiniteFieldsAndCharacterSums *subspace-polynomial-is-linearized*; SchemeAndStackFoundations §0.3.

**Checks.**

- For `r = 1`, `R(V)` is a polynomial ring in one generator of degree one and `Q_1 = Spec F`.
- For `r = 2`, `Q_2 = P^1`, embedded by `𝒪(1)` of degree `q`, and the open part removes the `q + 1` rational points; `dim R(V)_n = 1 + qn` (PS, Theorem 1.10).
- Removing the factor `t` from `φ_t` gives derivative one instead of `t` and fails the differential condition.

<a id="dm-3-satake-compactification"></a>

### 3.6 Pink's Satake compactification (`DrinfeldSatake`)

**Theorem.** Let `K ⊂ GL_r(Â)` be fine and `K_0 = Frac(A)`. There is a normal integral projective `K_0`-scheme `M̄_r(K)` containing `M_r(K)_(K_0)` as a dense open, together with a weakly separating generalized Drinfeld module extending the universal family; the pair is unique up to unique isomorphism restricting to the given family. This is a statement about the generic fibre; it gives neither arbitrary integral base change nor an explicit boundary stratification.

- `DrinfeldSatake`: the normal projective compactification with its generalized family.
- `DrinfeldSatake.openImmersion`: `M_r(K) ↪ M̄_r(K)`, dense.
- `DrinfeldSatake.unique`: the unique compatible isomorphism between two compactifications.
- `DrinfeldSatake.changeLevel`: a finite level map extends uniquely, compatibly with composition.

*Proof sketch.* Uniqueness: the normalization of the closure of the diagonal in a product of two candidates has finite projections, because isomorphisms of generalized families extend and weak separation forbids positive-dimensional fibres; finite birational maps of normal schemes are isomorphisms. Existence for `A = F[t]`, level `(t)`, is [§3.5](#dm-3-reciprocal-compactification). For general `A` and `K`, take the normalization in the function field (SchemeAndStackFoundations §§0.20–0.21) and finite quotients (SchemeAndStackFoundations §1.17, with the descended ample line bundle), as in Pink's Lemmas 4.4–4.5. (Pin, Definition 4.1 and Theorem 4.2, p. 14, proof pp. 14–16.) *Needs:* [§3.4](#dm-3-generalized-drinfeld-module); [§3.2](#dm-3-fine-moduli-scheme); [§3.5](#dm-3-reciprocal-compactification); SchemeAndStackFoundations §§0.20, 0.21, 1.17.

**Checks.**

- In rank one the compactification is the zero-dimensional moduli scheme itself.
- For `F[t]`, level `(t)` and rank two, `M̄_2 = P^1` with `q + 1` cusps.
- Normality, projectivity and weak separation alone do not give a decomposition of the boundary into lower-rank moduli strata.

<a id="dm-3-section-ring"></a>

### 3.7 Section rings of ample line bundles (`sectionRing_proj_iso`)

**Theorem.** Let `X` be a normal integral scheme, proper over a Noetherian ring `R_0`, with an ample invertible sheaf `ℒ`. Then `Γ_∗(X, ℒ)_(≥0) = ⊕_(n≥0) H⁰(X, ℒ^(⊗n))` is a finitely generated `R_0`-algebra, it is a normal domain, and the canonical map `X → Proj Γ_∗(X, ℒ)_(≥0)` is an isomorphism. This includes dimension zero.

*Proof sketch.* Finite generation is Serre's theorem for proper schemes over a Noetherian ring (Stacks, Lemma 30.16.1, Tag 0B5T), and the isomorphism with `Proj` holds for every universally closed morphism with an ample sheaf (Stacks, Lemma 29.44.17, Tag 0C6J). For normality, trivialize `ℒ` at the generic point and embed the integer-graded section ring `R_ℤ` in `K(X)[T, T^(−1)]`. It is the ring of global functions on the complement of the zero section in the total space of `ℒ^(−1)`, hence integrally closed because that scheme is normal integral. The nonnegative section ring is `R_ℤ ∩ K(X)[T]`; both rings are integrally closed in a common overfield, so their intersection is integrally closed. This argument does not require negative-degree sections to vanish. (Pin, Theorem 5.7 and its normality argument, p. 21; Stacks, Tags 0B5T and 0C6J for finite generation and `Proj`.) *Needs:* SchemeAndStackFoundations §§0.3, 2.6; AlgebraicVectorBundles L2B.

**Checks.**

- For `X = P^1` and `ℒ = 𝒪(1)`, the section ring is `R_0[x, y]`.
- For `X = P^1` and `ℒ = 𝒪(q)`, the section ring is the `q`-th Veronese subring, still normal, with `dim_F` of degree `n` equal to `qn + 1`.
- For `ℒ = 𝒪` (not ample) on `P^1`, the section ring is `R_0[s]` with `Proj` a point, not `P^1`.
- For the identity `X = Spec R_0` with `R_0` a normal Noetherian domain and `ℒ = 𝒪`, the section ring is `R_0[T]`. All negative tensor powers also have sections, including when `R_0` is a DVR; their vanishing is not a consequence of relative ampleness.

<a id="dm-3-modular-forms"></a>

### 3.8 Algebraic Drinfeld modular forms (`DrinfeldModularForm`)

**Definition.** For fine `K` let `ω = Lie(E)^∨` be the dual of the Lie algebra of the generalized family on `M̄_r(K)`. The space of modular forms of weight `k ≥ 0` is `M_k(K) = H⁰(M̄_r(K), ω^(⊗k))`; cusp forms are those vanishing on the reduced boundary; multiplication of sections makes `⊕_k M_k(K)` a graded `K_0`-algebra. The line `ω` is ample, the ring of modular forms is a finitely generated normal domain, and its `Proj` is `M̄_r(K)`. For nonfine `K`, take invariants at a fine normal subgroup `K'`, not sections of a line bundle on the coarse space. These are algebraic modular forms; their comparison with analytic holomorphy is a separate theorem.

- `DrinfeldModularForm`: global sections of `ω^(⊗k)`.
- `DrinfeldModularForm.mul`: weights add.
- `DrinfeldModularForm.cusp`: the kernel of restriction to the reduced boundary.
- `DrinfeldModularForm.levelInvariants`: for a fine normal `K' ⊂ K`, `M_k(K) = M_k(K')^(K/K')`.
- `DrinfeldModularForm.ext`: sections agreeing on an open cover are equal; evaluation at geometric points is not used as extensionality.

*Construction.* On the reciprocal model `ω` is the sheaf `𝒪(1)` of `Proj R(V)` (of degree `q` on `P^1` when `r = 2`), which is ample; ampleness descends along the finite surjective maps of the construction (SchemeAndStackFoundations §§1.17, 3.5), and [§3.7](#dm-3-section-ring) gives the ring structure and `Proj`. Serre vanishing (SchemeAndStackFoundations §2.6) controls the dimensions in large weight. (Pin, Lemma 5.1, p. 19, Theorem 5.3, Definition 5.4, Proposition 5.5 and Theorem 5.6, p. 20, Theorem 5.7, p. 21.) *Needs:* [§3.6](#dm-3-satake-compactification); [§3.5](#dm-3-reciprocal-compactification); [§3.7](#dm-3-section-ring); SchemeAndStackFoundations §§0.3, 1.17, 2.6, 3.5; AlgebraicVectorBundles L0B.

**Checks.**

- The constant section `1` is a modular form of weight zero, and `M_0(K)` is the ring of global functions of the compactification.
- For `A = F[t]`, level `(t)`, rank two: `ω` has degree `q` on `P^1`, `dim M_k = qk + 1`, and for `k ≥ 1` the `q + 1` cusp conditions give `dim S_k = qk − q`.
- A section on the open moduli scheme with a pole at a cusp is not a modular form.

<a id="dm-3-hecke-correspondence"></a>

### 3.9 Hecke correspondences and operators (`DrinfeldHecke`)

**Definition.** For `g ∈ GL_r(A_f)` with entries in `Â` and compact open `K`, put `K' = K ∩ g^(−1)Kg`. The correspondence `M_r(K) ← M_r(K') → M_r(K)` has the forgetful map `J_1` and the map `J_g` given by the quotient isogeny; both extend to finite maps of Satake compactifications. On weight-`k` forms, `T_g = (J_g)_∗ ∘ J_1^∗`, where the pullback is composed with the Lie-dual identification of the isogeny and the pushforward is the trace over cosets. It depends only on `KgK`. For `gK'g^(−1) ⊂ K`, `(J_g)_∗ J_g^∗ = [K : gK'g^(−1)]·id`, where the index is read in characteristic `p` and may be zero.

- `DrinfeldHecke`: the pair `J_1`, `J_g`.
- `DrinfeldHecke.pullback`: the section map with the Lie-dual identification.
- `DrinfeldHecke.trace`: the coset-sum pushforward.
- `DrinfeldHecke.operator`: `T_g = (J_g)_∗ J_1^∗`.
- `DrinfeldHecke.doubleCoset`: `KgK = KhK` implies `T_g = T_h`.

*Construction.* Quotient isogenies come from ideal torsion ([§1.4](#dm-1-ideal-torsion)); in generic characteristic the isogeny identifies Lie lines. Extend the finite maps by uniqueness of the compactification, define the trace at a common fine normal level and check independence by transitivity; the degree is never inverted. (Pin, Propositions 2.6–2.7, pp. 6–7, Proposition 4.11, p. 18, Lemma 5.1, p. 19, §6 equations (6.1)–(6.9), pp. 21–23, Proposition 6.10, pp. 23–24.) *Needs:* [§3.8](#dm-3-modular-forms); [§3.6](#dm-3-satake-compactification); [§1.4](#dm-1-ideal-torsion); [§0.7](#dm-0-isogeny-rank); SchemeAndStackFoundations §§0.20, 1.17.

**Checks.**

- For `g = 1` and `K' = K`, `T_1 = id`.
- For a fine normal `K' ⊂ K`, trace after pullback is `[K : K']·id`.
- If `p` divides `[K : K']` that composite is zero, so a trace normalized by dividing by the degree is undefined.

<a id="dm-3-integral-compactification"></a>

### 3.10 The arithmetic Satake compactification (`DrinfeldSatake.integral`)

**Theorem.** For every fine compact open `K ⊂ GL_r(Â)`, the moduli scheme `M_r(K)` over `Spec A[1/N_K]` has a normal integral projective flat compactification over `A[1/N_K]` with a weakly separating generalized Drinfeld module extending the universal family; both are unique up to unique compatible isomorphism, and the Lie-dual line is ample. For fine `K' ⊂ K`, the level map extends, after base change to `A[1/N_(K')]`, to a finite surjective open map that pulls back the family and the Lie-dual line. Flatness of that finite map and normality or Cohen–Macaulayness of every special fibre are not asserted.

*Proof sketch.* The seed is the reciprocal model over `F[t, 1/t]`. For coefficient restriction normalize the closure of the fine moduli image in the seed; generalized actions extend over a normal base. Take the finite quotient at a principal sublevel; fineness descends the line bundle, normality and weak separation (SchemeAndStackFoundations §1.17). Torsion-freeness over the Dedekind base gives flatness, finite surjective descent gives ampleness, and normalized-diagonal uniqueness gives level functoriality. (HY, Definition 3.1, Theorem 3.2, Lemmas 3.3 and 3.6–3.8 with proofs, pp. 12–16, Proposition 3.11, pp. 18–19.) *Needs:* [§3.5](#dm-3-reciprocal-compactification); [§3.2](#dm-3-fine-moduli-scheme); [§3.4](#dm-3-generalized-drinfeld-module); [§3.6](#dm-3-satake-compactification); SchemeAndStackFoundations §§0.20, 0.21, 1.17.

**Checks.**

- For `F[t]`, level `(t)`, the model is `Q_r × Spec F[t, 1/t]`.
- Its generic fibre is Pink's compactification, by the uniqueness of [§3.6](#dm-3-satake-compactification).
- Over `Spec A` itself, with the level primes retained, the theorem is not asserted.

### Examples

- `A = F[t]`, `r = 2`, level `(t)`: `M_2((t))` is `P^1_(F[t,1/t])` minus the `q + 1` rational sections, `M̄_2 = P^1`, `ω = 𝒪(q)`, and `M_k` has dimension `qk + 1`.
- In rank one every `M_1(K)` is finite étale over `A[1/N_K]` and equal to its compactification.

### Dependencies

Layers DM.0, DM.1 (and through them DM.4); FiniteFieldsAndCharacterSums (linearized polynomials); AlgebraicVectorBundles L0B, L2B; SchemeAndStackFoundations §§0.3, 0.20, 0.21, 1.1, 1.17, 1.23, 2.6, 3.5, 4.1, 4.3; the Stacks project lemmas cited in [§3.7](#dm-3-section-ring).

## Layer DM.5: The integral and rational Tate theorem

For Drinfeld modules over a field `L` finitely generated over `F`, homomorphisms are detected by Tate modules: `A_λ ⊗ Hom(E, E') → Hom_(G_L)(T_λE, T_λE')` is an isomorphism for every prime `λ` away from the characteristic, and rational Tate modules are semisimple. The proof passes to motives, embeds rational `A`-motives into restricted Frobenius modules over two successive coefficient completions, and algebraizes Frobenius-equivariant maps through a period ring defined by valuations; the integral statement adds a saturation argument with quotient isogenies. Stalder's treatment covers coefficient fields of arbitrary transcendence degree and both generic and special characteristic.

<a id="dm-5-rational-motive-realization"></a>

### 5.1 Rational motives and their Tate realization (`AMotive.rationalTate`)

**Definition.** Let `L` be a coefficient field with characteristic map `γ`. The category of rational `A`-motives (isomotives) has the effective `A`-motives as objects and `Hom^0(M, N) = K_0 ⊗_A Hom(M, N)`. For a prime `λ ≠ ker γ` with residue field `F_λ` and local parameter `z`, let `L_(λ)` be the total quotient ring of `(F_λ ⊗_F L)[[z]]`, keeping every residue-field factor (it is a finite product of fields). Put `K_(0,λ) = Frac(A_λ)`. The rational Tate realization `V_λ(M)` is the `K_(0,λ)`-module of `τ`-invariants of `M ⊗ L^sep_(λ)`. Put `D_λ = Hom_F(K_λ/A_λ, F)`, with `A_λ` acting by precomposition with multiplication. This residue-dual module is free of rank one, with trivial coefficient-field Galois action. The canonical duality is `T_λE ≅ Hom_(A_λ)(T_λ(M(E)), D_λ)`; rationally its values lie in `K_λ ⊗ D_λ`. Choosing a local parameter and the residue-field trace identifies `D_λ` with `A_λ`, and then gives the ordinary dual. The finite-level pairing is that of [§1.7](#dm-1-geometric-torsion-basis); an ordinary scalar-valued duality without this choice is not declared canonical.

- `AMotive.HomIsogeny`: `K_0 ⊗_A Hom(M, N)`.
- `AMotive.rationalTate`: the completed `τ`-fixed realization `V_λ(M)`.
- `AMotive.rationalTateMap`: morphisms of motives act on `τ`-invariants.
- `residueDualModule`: `D_λ`, with its precomposition action.
- `residueDualModule.parameterBasis`: for a uniformizer `z`, the functional `x ↦ Tr_(F_λ/F)(coeff_(z^(−1)) x)` generates `D_λ` freely over `A_λ`.
- `DrinfeldModule.motiveTateDual`: the canonical `D_λ`-valued integral pairing and its rationalization, equivariantly.
- `AMotive.torsion_annihilator`: if a finite torsion `A_L`-module `Q` has a Frobenius linearization whose kernel and cokernel are supported at `J`, some nonzero `a ∈ A` kills `Q`. The condition is on both kernel and cokernel.
- `AMotive.isogeny_factor_scalar`: an injective map of effective motives of equal rank factors a scalar isogeny: there are `a ∈ A ∖ {0}` and a reverse map whose two composites are multiplication by `a`. Thus scalar localization really inverts these isogenies.

*Construction.* Localize `Hom` at the nonzero elements of `A` and check composition. For the torsion-annihilator target split off the part with invertible Frobenius linearization, descend it to finite `A`-torsion by the semilinear Lang lemma, and filter the remaining nilpotent part by modules killed by Frobenius; its support is at the characteristic. In generic characteristic the distinct Frobenius translates of `J` rule out the nilpotent part. Applying the resulting nonzero `A`-annihilator to a motive quotient gives the reverse map in `isogeny_factor_scalar`. Completing at `λ` makes `τ_M` invertible since `λ` is away from `J`; the semilinear Lang lemma ([§1.3](#dm-1-semilinear-lang)) at each finite level and passage to the limit give a realization of rank `rank M`. For the duality, pair a compatible motive vector with the value of a division-module map at `x ∈ K_λ/A_λ`, using the finite-level evaluation pairing. This gives the functional in `D_λ`; perfection follows at finite levels. Laurent coefficients and the nondegenerate residue trace prove the parameter-basis claim. (Hartl, Theorem 6.6, p. 26, for the finite-level duality.) The rational coefficient field `K_(0,λ,L) = Frac(K_(0,λ) ⊗_F L)` is kept distinct from the completed ring `L_(λ)`. (Sta, Definitions 2.1–2.2, pp. 5–6, Theorem 2.17(d), pp. 9–10, Proposition 2.20 and Definition 2.22, pp. 10–11, Definition 2.26, pp. 12–13, Proposition 2.28, pp. 13–14, Proposition 4.7, p. 24.) *Needs:* [§4.2](#dm-4-effective-a-motive); [§4.3](#dm-4-contravariant-motive); [§1.8](#dm-1-tate-module); [§1.7](#dm-1-geometric-torsion-basis); AlgebraicCurves Layer 5.

**Checks.**

- The identity morphism realizes as the identity.
- A nonzero isogeny of Drinfeld modules becomes an isomorphism of isomotives.
- For transcendental `θ`, `Q = L[t]/(t − θ)` with zero Frobenius has no nonzero `F[t]`-annihilator. Its linearization kernel is supported at `t = θ^q`, so it fails the two-support hypothesis even though the cokernel is supported at `t = θ`.
- For `A_λ = F[[z]]`, the basis functional sends `z^(−1)` to `1` and `z^(−2)` to `0`.
- The functional `z·ℓ_z` sends `z^(−2)` to `1`; it is nonzero but is not a basis, since `z` is a nonunit. Thus the action is precomposition, and arbitrary nonzero functionals are not generators.
- Replacing `z` by `uz` for `u ∈ F^×` changes the coefficient functional by `ℓ_(uz) = uℓ_z`, so a scalar-valued identification depends on the parameter.
- The Carlitz motive realization has the inverse character of the Carlitz point realization; the residue-dual line has trivial Galois action.

<a id="dm-5-tate-hom-map"></a>

### 5.2 The Tate Hom map (`DrinfeldModule.tateHomMap`)

**Definition.** For Drinfeld modules `E`, `E'` of ranks `r`, `r'` over the same `(L, γ)` and a prime `λ ≠ ker γ`, `α_λ : A_λ ⊗_A Hom_L(E, E') → Hom_(A_λ, G_L)(T_λE, T_λE')` is `b ⊗ u ↦ b·T_λu`. It is `A_λ`-linear, compatible with composition and identities, and becomes the rational comparison after inverting `λ`. The module `Hom_L(E, E')` is finite projective over `A`, of rank at most `rr'`; it is free when `A = F[t]`, and its localization at any nonzero prime is free. It is defined for every coefficient field; the Tate theorem below needs `L` finitely generated over `F`.

- `DrinfeldModule.tateHomMap`: `α_λ(b ⊗ u) = b·T_λu`.
- `DrinfeldModule.tateHomMap_tmul`: `α_λ(1 ⊗ u) = T_λu`.
- `DrinfeldModule.tateHomMap_comp`: compatibility with composition.
- `DrinfeldModule.tateHomMap_rational`: the scalar extension to `K_(0,λ)` is the rational comparison.
- `DrinfeldModule.hom_finiteProjective`: `Hom_L(E, E')` is finite projective of rank at most `rr'`.

*Construction.* Use the torsion-induced maps of [§1.8](#dm-1-tate-module); bilinearity gives the tensor lift; equivariance and composition hold at every finite level. For finite projectivity and the rank bound, apply Har, Corollary 2.6, p. 7, to the motives and use the fully faithful contravariant functor of [§4.4](#dm-4-abelian-antiequivalence). (Sta, Proposition 5.16, p. 34; Har, Corollary 2.6, p. 7.) *Needs:* [§1.8](#dm-1-tate-module); [§1.9](#dm-1-continuous-galois-action); [§0.6](#dm-0-drinfeld-module-hom); [§4.4](#dm-4-abelian-antiequivalence).

**Checks.**

- `α_λ(1 ⊗ id) = id`.
- For `a ∈ A`, `α_λ(1 ⊗ φ_a) = a·id`.
- For `φ_t = τ²` over `F_(q²)` and `λ = (t − 1)`, both `τ` and the constants of `F_(q²)` are endomorphisms; the source is not cyclic over `A`.
- If `A` has a nonprincipal ideal `I`, the rank-one modules over `C_∞` uniformized by `A` and `I` have `Hom ≅ {c : cA ⊂ I} = I`, by [§2.7](#dm-2-exponential-morphisms). Thus a global free basis cannot be assumed over a general `A`.

<a id="dm-5-tate-image-saturation"></a>

### 5.3 Saturation of the Tate image (`DrinfeldModule.tateHomMap_saturated`)

**Theorem.** For `E`, `E'` over the same field `L` and `λ` away from the characteristic, the map `Hom_L(E, E') ⊗_A A/λ → Hom(E[λ], E'[λ])` is injective. Consequently the image of `A_λ ⊗ Hom_L(E, E')` in `Hom_(A_λ, G_L)(T_λE, T_λE')` is saturated: if `z·h` lies in the image for a uniformizer `z` of `A_λ` and an equivariant `h`, then `h` lies in the image. Nonprincipal `λ` is allowed.

*Proof sketch.* A morphism `u : E → E'` killing the finite group scheme `ker φ_a` factors as `u = w φ_a` with `w ∈ Hom(E, E')`: divide `u` by `φ_a` on the right in `L{τ}`; the remainder is a q-linearized polynomial of degree less than `deg_τ φ_a` vanishing on `ker φ_a`, hence zero, and `w` intertwines because `L{τ}` is a domain. Choose `z ∈ λ ∖ λ²`, write `(z) = λJ` with `J` coprime to `λ` and pick `s ∈ J ∖ λ`. If `u` kills `E[λ]`, then `u φ_s` kills `E[λ] × E[J] = E[(z)] = ker φ_z`, so `s·u = z·w` and `u ∈ λ·(Hom ⊗ A_(λ))`. Since `Hom` is finite projective by [§5.2](#dm-5-tate-hom-map), membership in `λ Hom` is detected at `λ`; this proves injectivity modulo `λ` without a global basis. Choose a basis after localizing at `λ`; lift its coefficients to `A_λ` and apply the same finite-level divisibility argument to obtain saturation, using torsion-freeness of `T_λE'`. Stalder uses this step without proof. (Sta, Proposition 5.16(a) and proof, p. 34; Pik, §3.1, pp. 10–12.) *Needs:* [§0.6](#dm-0-drinfeld-module-hom); [§0.8](#dm-0-kernel-scheme); [§1.4](#dm-1-ideal-torsion); [§1.6](#dm-1-etale-torsion); [§5.2](#dm-5-tate-hom-map).

**Checks.**

- For the Carlitz module, `End(C) ⊗ A_λ = A_λ` and division by `λ` is visible directly.
- For `u = φ_z` itself, `u` kills `E[λ]` and indeed `u ∈ λ·End(E) ⊗ A_(λ)`.
- The rational comparison being bijective does not by itself give saturation; the integral statement needs the factorization through `φ_z`.

<a id="dm-5-tate-injectivity"></a>

### 5.4 Injectivity of the Tate comparison (`DrinfeldModule.tateHomMap_injective`)

**Theorem.** For Drinfeld modules over a field and `λ` away from the characteristic, `α_λ` is injective. In particular a morphism acting as zero on every `λ`-power torsion scheme is zero. For equal ranks `r`, the projective module of [§5.2](#dm-5-tate-hom-map) has rank at most `r²`.

*Proof sketch.* A nonzero twisted polynomial cannot kill torsion schemes of unbounded order, so `Hom(E, E') → Hom(T_λE, T_λE')` is injective. Finite projectivity is supplied independently in [§5.2](#dm-5-tate-hom-map). Iterate the divisibility argument of [§5.3](#dm-5-tate-image-saturation) to inject `Hom(E, E')/λ^n` into `Hom(E[λ^n], E'[λ^n])`. If `x ∈ A_λ ⊗ Hom` maps to zero, reduction modulo every `λ^n` puts it in `λ^n(A_λ ⊗ Hom)`; this is a finite free module over the complete DVR `A_λ`, so its separatedness gives `x = 0`. (Sta, Proposition 2.28, pp. 12–14; Har, Corollary 2.6, p. 7.) *Needs:* [§5.2](#dm-5-tate-hom-map); [§5.3](#dm-5-tate-image-saturation); [§0.8](#dm-0-kernel-scheme); [§1.7](#dm-1-geometric-torsion-basis).

**Checks.**

- A nonzero constant endomorphism induces a nonzero Tate map.
- For the Carlitz module, `End(C) = A` has rank `1 = r²`.
- For `φ_t = τ²` over `F_(q²)`, `End(φ)` has rank four, the maximum `r²`.

<a id="dm-5-period-ring"></a>

### 5.5 The Tate period ring (`TatePeriodRing`)

**Definition.** Let `L` be finitely generated over `F`. Let `σ` be the `q`-coefficient Frobenius, fixing `z`. Choose a projective normal `F`-model `X` of `L`. Let `Σ^sep` be the inverse limit of the sets of prime Weil divisors on its normalizations in finite Galois subextensions of `L^sep/L`, and normalize each associated valuation by its ramification index over `X`. For `x ∈ Σ^sep` put `v_x(f) = inf_n min_j v_x(a_(n,j))`, taking every residue-field component of every Laurent coefficient. Inside `L^sep_(λ)`, let `B^+` consist of series with `v_x(f) > −∞` for every `x`, such that the exceptional `x` with `v_x(f) < 0` have finite image among the prime divisors of `X`; let `S` be the set of invertible integral series `s` with `σ(s)/s ∈ K_(0,λ) ⊗_F L`; and set `B = B^+[S^(−1)]`. Then `B^σ = K_(0,λ)`, `B^(G_L) = K_(0,λ,L)`, every coordinate of a `τ`-fixed basis vector of a `λ`-restricted finite-rank system lies in `B`, and `B ⊗_(K_(0,λ)) V_λ(M) ≅ B ⊗_(K_(0,λ,L)) M`. The full completion cannot replace `B` in the algebraization argument.

- `TatePeriodRing`: the valuation-bounded ring `B^+` localized at the Frobenius units `S`.
- `TatePeriodRing.sigmaFixed`: `B^σ = K_(0,λ)`.
- `TatePeriodRing.galoisFixed`: `B^(G_L) = K_(0,λ,L)`.
- `TatePeriodRing.comparison`: `B ⊗ V_λ(M) ≅ B ⊗ M` for `λ`-restricted systems.

*Construction.* Projective normal models exist by projective closure and finite normalization (SchemeAndStackFoundations §§0.20–0.21), in any transcendence degree. Bound coefficient poles by an effective Cartier divisor `D` from a homogeneous section of a projective embedding; the coefficients then lie in `H⁰(X, 𝒪_X(nD))`, finite-dimensional by proper coherent finiteness (SchemeAndStackFoundations §2.6). Construct integral Frobenius units and invert them; the formal functional equations put all solutions into `B`. The fixed-ring identities come before any invariant tensor argument. (Sta, Claim 5.2 and Lemma 5.3, p. 27, Theorem 5.4 and Definition 5.5, p. 28, Proposition 6.2, pp. 35–36, Definitions 6.6 and 6.10, pp. 37–38, Propositions 6.14 and 6.21, pp. 40 and 43, Theorem 6.23, p. 43.) *Needs:* [§5.1](#dm-5-rational-motive-realization); AlgebraicCurves Layer 5; SchemeAndStackFoundations §§0.20, 0.21, 2.6.

**Checks.**

- The local parameter `z` is fixed by `σ`, so `K_(0,λ)` embeds in the fixed ring.
- For `L = F(x)`, the constant coefficient `x` lies in `B^+`, but `σ(x) = x^q ≠ x`; the Frobenius-fixed ring cannot contain all coefficient constants.
- For `L = F(x)`, `f = Σ_(n≥0) x^n z^n` has `v_∞(f) = −∞` and is excluded from `B^+`. Nevertheless `f = (1 − xz)^(−1)` lies in `K_(0,λ,L) ⊂ B`: the localization is essential.
- Keeping only one extension of each base valuation would not be Galois-stable; the condition uses every compatible extension in `Σ^sep`.

<a id="dm-5-local-algebraization"></a>

### 5.6 Local algebraization (`AMotive.localAlgebraization`)

**Theorem.** Let `L` be finitely generated over `F` (so `L` has finitely many roots of unity), `K_(0,L) = Frac(K_0 ⊗_F L)`, `K_(0,λ,L) = Frac(K_(0,λ) ⊗_F L)` and `L_(λ)` as above. Call a finite projective module with invertible Frobenius linearization *restricted*, and *`λ`-restricted* if it has a finite projective integral lattice at `λ` with invertible Frobenius. Then scalar extension `K_(0,L) → K_(0,λ,L)` is `K_(0,λ)/K_0`-fully faithful on restricted modules and preserves semisimple objects, and scalar extension `K_(0,λ,L) → L_(λ)` is fully faithful on `λ`-restricted objects and preserves semisimple objects. So completed Frobenius-equivariant maps are algebraic over the rational coefficient ring. When `L` is finite the two local rings agree; in positive transcendence degree they do not.

*Proof sketch.* For the first extension reduce to finite and to one-variable purely transcendental extensions; Frobenius-fixed denominators descend to the constant field, and `K_(0,λ)/K_0` is separable through a separating local parameter. For the second, the period ring of [§5.5](#dm-5-period-ring) with its two fixed-ring identities constructs a fully faithful realization; every invariant subobject is quasigeometric and the descended lattice supplies the `λ`-restricted condition. (Sta, Theorem 3.11 with proof, pp. 18–21, Theorem 4.8 and Proposition 4.9, pp. 25–26, Theorem 5.15, p. 33.) *Needs:* [§5.5](#dm-5-period-ring); [§5.1](#dm-5-rational-motive-realization); AlgebraicCurves Layer 5.

**Checks.**

- For finite `L` the two local coefficient rings coincide.
- For `L = F(x)` the field `K_(0,λ,L)` is strictly smaller than `L_(λ)`.
- The scalar extensions preserve semisimplicity of the objects, which is what the semisimplicity theorem transfers.

<a id="dm-5-tate-surjectivity"></a>

### 5.7 The Tate theorem for Drinfeld modules (`DrinfeldModule.tateHomMap_bijective`)

**Theorem.** Let `L` be finitely generated over `F`, let `E`, `E'` be Drinfeld `A`-modules over the same `(L, γ)`, and let `λ ≠ ker γ`. Then `α_λ : A_λ ⊗_A Hom_L(E, E') → Hom_(A_λ, G_L)(T_λE, T_λE')` is an isomorphism, and so is its rational version. Both generic and special characteristic are allowed; different characteristic maps, an algebraically closed coefficient field in place of a finitely generated one, or `λ` equal to the characteristic are not.

*Proof sketch.* Pass contravariantly to motives ([§4.4](#dm-4-abelian-antiequivalence)) and dualize their Tate realizations. Local algebraization makes the rational motive Hom fully faithful into Galois-equivariant maps after coefficient localization, giving rational bijectivity; integral injectivity and saturation ([§5.4](#dm-5-tate-injectivity), [§5.3](#dm-5-tate-image-saturation)) upgrade it to the integral isomorphism. (Sta, Proposition 5.16(a, b) and proof, p. 34, Proposition 4.2, p. 22, Theorem 5.15, p. 33.) *Needs:* [§5.1](#dm-5-rational-motive-realization); [§5.6](#dm-5-local-algebraization); [§5.4](#dm-5-tate-injectivity); [§5.3](#dm-5-tate-image-saturation); [§4.4](#dm-4-abelian-antiequivalence).

**Checks.**

- Over a finite field, equivariant endomorphisms of `T_λE` are the centralizer of the arithmetic Frobenius.
- For `φ_t = τ²` over `F_(q²)`, the Tate centralizer keeps the extra endomorphisms and has rank four.
- Over an algebraically closed field of generic characteristic (not finitely generated) the Galois action is trivial: a rank-two Drinfeld module without complex multiplication has `End(E) = A` of rank one while `End(T_λE)` has rank four, so the finite-generation hypothesis cannot be dropped.

<a id="dm-5-drinfeld-motive-simple"></a>

### 5.8 Drinfeld motives are simple (`DrinfeldModule.motive_isSimple`)

**Theorem.** The rational motive `K_0 ⊗_A M(E)` of a Drinfeld module `E` of rank `r` over a field `L` is a simple object of the category of rational `A`-motives over `L`. In particular it is semisimple.

*Proof sketch.* Represent a nonzero subobject by a motive map after clearing a nonzero `A`-denominator, with image `N ⊂ M(E) = L{τ}`. It is an `A_L`-submodule stable under `τ`, hence a left ideal of `L{τ}`. Right division by a nonzero element of least degree gives `N = L{τ}f`. The quotient has finite `L`-dimension `deg_τ f`, so `N` and `M(E)` have equal `A_L`-rank. The inclusion is therefore an isogeny of motives, and `AMotive.isogeny_factor_scalar` of [§5.1](#dm-5-rational-motive-realization) makes it invertible after localizing at `A ∖ {0}`. Merely exhibiting an annihilator in `A_L` would not suffice for this localization. This argument also avoids assuming that dividing by an inseparable `f` preserves the characteristic map. (BP, §4.2, p. 16, for division and the motive; Sta, Proposition 2.20, p. 10, for scalar factors of isogenies; the introductory statement on p. 3 is semisimplicity.) *Needs:* [§5.1](#dm-5-rational-motive-realization); [§4.3](#dm-4-contravariant-motive); [§0.2](#dm-0-rank-polynomial-ring) `OrePolynomial.existsUnique_rightDivRem`; [§5.1](#dm-5-rational-motive-realization) `AMotive.isogeny_factor_scalar`.

**Checks.**

- For the Carlitz module, `M(C) = L{τ}` has rank one and is trivially simple.
- A general effective t-motive need not be simple: `M(C) ⊕ M(C^⊗2)` has the proper subobject `M(C)`.
- The left ideal `L{τ}φ_a` of `M(E)` is a subobject of finite index, not a proper subobject of the isomotive.

<a id="dm-5-tate-semisimplicity"></a>

### 5.9 Semisimplicity of rational Tate modules (`DrinfeldModule.rationalTate_isSemisimple`)

**Theorem.** For `L` finitely generated over `F` and `λ` away from the characteristic, the rational Tate realization of a semisimple `A`-isomotive is a semisimple `K_(0,λ)`-representation of `G_L`. In particular `V_λE` is semisimple for every Drinfeld module `E` over `L`. A general effective Anderson motive is not assumed semisimple.

*Proof sketch.* The rational motive category embeds faithfully into restricted Frobenius modules and preserves semisimplicity; each of the two local scalar extensions preserves semisimple objects ([§5.6](#dm-5-local-algebraization)); the local Frobenius/Galois equivalence transfers semisimplicity to the representation. For Drinfeld modules, the motive is simple by [§5.8](#dm-5-drinfeld-motive-simple), and duality preserves semisimplicity. (Sta, Theorem 1.1, pp. 2–3, proof pp. 33–34, Proposition 4.2, p. 22.) *Needs:* [§5.6](#dm-5-local-algebraization); [§5.1](#dm-5-rational-motive-realization); [§5.8](#dm-5-drinfeld-motive-simple).

**Checks.**

- For two Drinfeld modules `E`, `E'`, the realization of `M(E) ⊕ M(E')` is `V_λE^∨ ⊕ V_λE'^∨`, semisimple as a direct sum of realizations of simple isomotives.
- A representation with a nonzero nilpotent Jordan block is not semisimple merely because it is the realization of some effective motive.
- For the Carlitz module `V_λC` is one-dimensional, hence simple.

### Examples

- For a Drinfeld module `E` of rank `r` over a finite field `F_(q^m)`, the Tate theorem identifies `A_λ ⊗ End(E)` with the commutant of the Frobenius in `End(T_λE)`, and `End(E)` is an order in a division algebra over `K_0`.
- For the Carlitz module over any finitely generated `L ⊃ F(θ)` with `θ` transcendental, `End(C) = A` and `End_(G_L)(T_λC) = A_λ`.

### Dependencies

Layers DM.0, DM.1 and DM.4; AlgebraicCurves Layer 5; SchemeAndStackFoundations §§0.20, 0.21, 2.6.

## Layer DM.6: Euler values, regulators and Taelman class modules

Taelman's class formula expresses the Euler product `L(E/R)` of a Drinfeld module over the integers `R` of a finite extension of `F(θ)` as the product of a regulator, the normalized covolume of the exponential unit lattice, and the monic cardinality of a finite class module. Both sides are elements of `F((T^(−1)))`. The proof writes the Euler product as a determinant of a nuclear operator on a compact `F`-vector space (the trace formula) and compares it with the exponential through an infinitely tangent isomorphism. The layer needs only DM.0 and DM.2. The Carlitz module, for which the formula is `ζ_A(1) = log_C(1)`, and a scaled Carlitz module with nonzero class module are worked out completely.

<a id="dm-6-fitting-polynomial"></a>

### 6.1 Monic cardinalities (`finiteModuleCardinality`)

**Definition.** For a finite `F[t]`-module `M` (finite-dimensional over `F`), `|M| = det_(F[T])(T − t_M) ∈ F[T]`, the characteristic polynomial of the action of `t`; equivalently the monic generator of the Fitting ideal `Fitt_0(M)` with `t` renamed `T`. It is a monic polynomial, not the integer cardinality: `#M = q^(deg |M|)`. It is multiplicative in short exact sequences and `|0| = 1`. The variable `T` is kept distinct from the coefficient `θ` of integral models.

- `finiteModuleCardinality`: `det(T − t_M)`.
- `finiteModuleCardinality_zero`: `|0| = 1`.
- `finiteModuleCardinality_exact`: for `0 → M' → M → M'' → 0`, `|M| = |M'|·|M''|`.
- `finiteModuleCardinality_fitting`: the ideal generated by `|M|` is `Fitt_0(M)` under `t ↦ T`.

*Construction.* Use `LinearMap.charpoly` of the `F`-linear map `t_M`; block-triangular determinants give multiplicativity. The comparison with Fitting ideals uses Tau Ceti's `TauCeti.fittingIdeal` (current library) and the rational canonical form over `F[t]`. (Tae, notation on p. 369 and §2, p. 376.) *Needs:* Mathlib `LinearMap.charpoly`, `Module.End`; Tau Ceti `TauCeti.fittingIdeal` (current library), through StableReduction Layer 0.

**Checks.**

- For `M = F[t]/(t² + t + 1)`, `|M| = T² + T + 1`.
- The zero module has `|0| = 1`, not `0`.
- For `M = F[t]/(t)`, `|M| = T` whereas `#M = q`: the two invariants differ.

<a id="dm-6-integral-model"></a>

### 6.2 Taelman's integral models (`TaelmanModel`)

**Definition.** Fix `A = F[t]`, a finite extension `K/F(θ)` (possibly inseparable), the integral closure `R` of `F[θ]` in `K`, and `γ(t) = θ`. An integral model is `E_t = θ + r_1τ + ⋯ + r_nτ^n` with all `r_i ∈ R` and `r_n ≠ 0`; `n` is the generic rank, and `n = 0` (the scalar model) is admitted as a degenerate case. No unit condition on `r_n` is imposed, so the model can have bad reduction. Put `K_∞ = R ⊗_(F[θ]) F((1/θ))`, a finite product of completions of `K` at the places above `∞`, in which `R` is discrete and cocompact. On `Lie(E) = R`, `t` acts by `θ`, separately from the action `E_t` on the same additive group.

- `TaelmanModel`: the twisted polynomial `θ + Σ r_iτ^i` over `R`.
- `TaelmanModel.points`: the `F[t]`-module `E(B)` on the additive group of any `R`-algebra `B`.
- `TaelmanModel.lie`: the tangent module, with `t` acting by `θ`.
- `TaelmanModel.reduce`: reduction modulo a maximal ideal `𝔪 ⊂ R` gives the finite `F[t]`-module `E(R/𝔪)`.
- `TaelmanModel.ext`: the twisted polynomial `E_t` determines the model.

*Construction.* `E_t` acts on every `R`-algebra by evaluation. Discreteness and cocompactness of `R` in `K_∞` follow from the discreteness and cocompactness of `K` in its adeles (FunctionFieldArithmetic §2.1), since `R` is `K` intersected with the integral adeles at the finite places. (Tae, Definition 2 and Remarks 1–2, p. 371.) *Needs:* [§0.5](#dm-0-carlitz-module); FiniteFieldsAndCharacterSums *frobenius-ore-polynomial-comparison*; AlgebraicCurves Layers 2 and 5; FunctionFieldArithmetic §2.1.

**Checks.**

- `r_1 = 1`, `n = 1` gives the Carlitz model, with good reduction everywhere.
- For `q = 2`, `E_t = θ + θ³τ` has generic rank one and reduces to the scalar (rank-zero) module at `(θ)`.
- For `n = 0` the exponential is the identity and every local factor of [§6.5](#dm-6-euler-l-value) is one.

<a id="dm-6-nuclear-determinant"></a>

### 6.3 Nuclear determinants on compact `F`-vector spaces (`FiniteFieldNuclearDet`)

**Definition.** Let `V` be a compact topological `F`-vector space with a nonarchimedean norm inducing its topology (`F` with the trivial norm). A continuous `F`-linear endomorphism is *locally contracting* if on some open invariant subspace `U` its norm decreases by a factor `c < 1`. For `Φ = Σ_(n≥1) φ_nZ^n` with locally contracting coefficients, define `det_(F[[Z]])(1 + Φ | V)` modulo `Z^N` as the determinant on the finite-dimensional quotient `V/U` for a common contracting open `U` of `φ_1, …, φ_(N−1)`; the residues are compatible and do not depend on `U`. This theory is distinct from nuclear operators on complex Banach spaces.

- `FiniteFieldNuclearDet`: the series `det(1 + Φ | V) ∈ F[[Z]]`.
- `FiniteFieldNuclearDet_trunc`: modulo `Z^N` it is the finite quotient determinant at any common contracting open.
- `FiniteFieldNuclearDet_exact`: multiplicativity in invariant short exact sequences.
- `FiniteFieldNuclearDet_cyclic`: for continuous `a`, `b` with `a`, `ab` and `ba` locally contracting, `det(1 + abZ) = det(1 + baZ)`.

*Construction.* Every finite list of locally contracting coefficients has a common contracting open; on a smaller common open the contracting part contributes determinant one modulo the required power of `Z`; finite-dimensional determinant identities pass to the limit. The cyclic law is Taelman's Theorem 2 with `a` replaced by `−a`, under its three contraction hypotheses. (Tae, Definitions 3–5 and Propositions 6–10, pp. 377–379, Theorem 2, p. 380.) *Needs:* [§6.1](#dm-6-fitting-polynomial).

**Checks.**

- The zero series has determinant one.
- For `V = F` and `Φ = aZ`, `det(1 + Φ) = 1 + aZ`.
- The identity of `F[[u]]` is not locally contracting, so it is not an admissible coefficient.

<a id="dm-6-trace-formula"></a>

### 6.4 The trace formula (`TaelmanModel.traceFormula`)

**Theorem.** In the setting of [§6.2](#dm-6-integral-model), let `M` be a finite projective `R`-module with a `q`-semilinear `τ_M`, and let `Θ ∈ R{τ}[[Z]]·τZ` act through `τ_M` (no `Z^0` or `τ^0` term). Then `∏_𝔪 det(1 + Θ | M/𝔪M) = det(1 + Θ | (M ⊗_R K_∞)/M)^(−1)` in `F[[Z]]`, the product running over all maximal ideals of `R`; the coefficients of `Θ` on the compact quotient are nuclear and both sides converge. The condition that `Θ` is divisible by `τ` is essential.

*Proof sketch.* Operators with a positive power of `τ` are locally contracting on the compact quotient. Localization exact sequences isolate finitely many primes at each `Z`-adic precision; Anderson's commutator factorization reduces a general `Θ` to local factors, and determinant exactness and the cyclic law give the Euler product. (Tae, §3 setup, pp. 381–382, Theorem 3 and proof, pp. 382–384.) *Needs:* [§6.3](#dm-6-nuclear-determinant); [§6.2](#dm-6-integral-model).

**Checks.**

- `Θ = (1 − E_tT^(−1))/(1 − θT^(−1)) − 1`, with `Z = T^(−1)`, gives the `L`-value determinant of [§6.5](#dm-6-euler-l-value) after inverting each local factor.
- For `Θ` a scalar without `τ` the formula fails: the quotient determinant is not defined.
- For `M = 0` both sides are one.

<a id="dm-6-euler-l-value"></a>

### 6.5 The `L`-value of an integral model (`TaelmanModel.lValue`)

**Definition.** For an integral model, `L(E/R) = ∏_𝔪 |R/𝔪| / |E(R/𝔪)|` in `1 + T^(−1)F[[T^(−1)]]`, with `θ` renamed `T` in the monic cardinalities, over all maximal ideals `𝔪` of `R`, using the reduction actually given by the model even where `r_n` vanishes. The product converges. The value lies in characteristic `p` and depends on the chosen model; it is not a complex `L`-value.

- `TaelmanModel.localFactor`: `|R/𝔪| / |E(R/𝔪)|`.
- `TaelmanModel.lValue`: the convergent product over all maximal ideals.
- `TaelmanModel.lValue_constantCoeff`: the `T^0`-coefficient is one.
- `TaelmanModel.lValue_carlitz`: for the Carlitz model, `L(C/R) = ζ_R(1)`.

*Construction.* Each local factor is a ratio of characteristic polynomials of `θ` and of `E_t` on the finite module `R/𝔪`; their difference is a Frobenius operator with the local degree bound, so only finitely many primes contribute modulo each power of `T^(−1)`. The trace formula identifies the product with one determinant. (Tae, definition after Remark 2, p. 371, Remark 5, pp. 373–374, §5, pp. 388–389.) *Needs:* [§6.2](#dm-6-integral-model); [§6.1](#dm-6-fitting-polynomial); [§6.4](#dm-6-trace-formula).

**Checks.**

- The scalar model has `L = 1`.
- For the Carlitz model over `F[θ]`, a degree-one prime `(θ − b)` gives the factor `(T − b)/(T − b − 1)`.
- For `q = 2` and `E_t = θ + θ³τ`, the factor at `(θ)` is one, not `T/(T − 1)`.

<a id="dm-6-unit-lattice"></a>

### 6.6 The unit lattice (`TaelmanModel.units`)

**Definition.** For an integral model, the coefficient recurrence gives an entire, continuous and open exponential `exp_E : K_∞ → E(K_∞)` with derivative one and `exp_E(θx) = E_t(exp_E(x))`. The unit lattice is `U(E/R) = exp_E^(−1)(E(R))`. It is a discrete cocompact `F[θ]`-lattice in `K_∞`, free of rank `[K : F(θ)]`. `exp_E` need not be surjective on `K_∞`, which is not `C_∞`; the periods lying in `K_∞` are contained in `U`.

- `TaelmanModel.exp`: the normalized exponential on `K_∞`.
- `TaelmanModel.units`: `exp_E^(−1)(E(R))`.
- `TaelmanModel.mem_units`: `x ∈ U ⟺ exp_E(x) ∈ E(R)`.
- `TaelmanModel.units_rank`: `rank U = [K : F(θ)]`.
- `TaelmanModel.exp_linear`: `exp_E(θx) = E_t(exp_E(x))`.

*Construction.* Solve the recurrence on every completion above `∞` with uniform local inverse estimates. Openness of `exp_E` and discreteness of `R` give discreteness of `U`; compactness of `K_∞/R` and the local inverse give cocompactness; a discrete cocompact `F[θ]`-submodule of a finite-dimensional `F((1/θ))`-space is free of full rank. (Tae, Propositions 2–3 and proofs, pp. 371–372.) *Needs:* [§6.2](#dm-6-integral-model); [§2.8](#dm-2-carlitz-exponential); AlgebraicCurves Layer 5.

**Checks.**

- For the scalar model, `U = R`.
- For the Carlitz module over `F[θ]`, `U = F[θ]·log_C(1)`.
- For `q = 2` and `E_t = θ + θ³τ`, `U = (π_BP/θ³)·F[θ]`, a rank-one lattice whose generator has absolute value `1/2`.

<a id="dm-6-class-module"></a>

### 6.7 The class module (`TaelmanModel.classModule`)

**Definition.** For an integral model, `H(E/R) = E(K_∞)/(E(R) + exp_E(K_∞))` as an `F[t]`-module. It is finite: the quotient by `E(R)` is compact and the quotient by the open image of `exp_E` is discrete. The denominator is an additive `F[t]`-submodule, generally not a `K_∞`-subspace. Its monic cardinality `|H|` is the class factor.

- `TaelmanModel.classModule`: `E(K_∞)/(E(R) + exp_E(K_∞))`.
- `TaelmanModel.classModule_finite`: `H` is finite.
- `TaelmanModel.classCardinality`: `|H|`.
- `TaelmanModel.classModule_exact`: `0 → K_∞/U → E(K_∞)/E(R) → H → 0`, the first map induced by `exp_E`.

*Construction.* Linearity of `exp_E` from the `θ`-action to the `E`-action makes the sum an `F[t]`-submodule; the quotient is both compact and discrete. (Tae, definition before Proposition 5 and its proof, p. 373.) *Needs:* [§6.6](#dm-6-unit-lattice); [§6.1](#dm-6-fitting-polynomial).

**Checks.**

- For the scalar model, `H = 0` and `|H| = 1`.
- For the Carlitz module over `F[θ]`, `H = 0`.
- For `q = 2` and `E_t = θ + θ³τ` over `F_2[θ]`, `H ≅ F_2[t]/(t)`, generated by the class of `θ^(−1)`, and `|H| = T`.

<a id="dm-6-lattice-covolume"></a>

### 6.8 Normalized covolumes (`latticeCovolume`)

**Definition.** Let `V` be a finite-dimensional `F((1/θ))`-vector space and `Λ_1`, `Λ_2` discrete cocompact `F[θ]`-lattices. Choose `g ∈ GL(V)` with `gΛ_1 = Λ_2` and let `[Λ_1 : Λ_2]` be the monic representative of `F^× · ι(det g)`, where `ι` renames `θ` as `T`. It does not depend on `g`; for lattices inside a common lattice `Λ` it equals `|Λ/Λ_2| / |Λ/Λ_1|`; it is multiplicative in successive pairs and continuous. The class formula uses `[R : U]`, in that orientation.

- `latticeCovolume`: `[Λ_1 : Λ_2]`.
- `latticeCovolume_self`: `[Λ : Λ] = 1`.
- `latticeCovolume_trans`: `[Λ_1 : Λ_3] = [Λ_1 : Λ_2][Λ_2 : Λ_3]`.
- `latticeCovolume_index`: the ratio of monic cardinalities for lattices in a common lattice.

*Construction.* Lattice bases give `g`; another choice changes `det g` by an element of `GL(Λ_1)`, whose determinant lies in `F[θ]^× = F^×`. The common-overlattice formula follows from diagonal forms over the principal ideal domain `F[θ]`. (Tae, Proposition 4 and proof, pp. 372–373.) *Needs:* [§6.1](#dm-6-fitting-polynomial); AlgebraicCurves Layer 5.

**Checks.**

- `[A : A] = 1`.
- `[A : θA] = T` while `[θA : A] = T^(−1)`.
- For `q = 2`, `[A : (π_BP/θ³)A] = ι(π_BP/θ³)`, with leading term `T^(−1)`.

<a id="dm-6-tangent-comparison"></a>

### 6.9 Infinitely tangent maps (`InfinitelyTangent`)

**Definition.** For lattices `Λ_i ⊂ V` and finite `F[t]`-modules `H_i`, put `M_i = (V/Λ_i) × H_i`. A continuous `F`-linear map `β : M_1 → M_2` is *`N`-tangent to the identity* on `V` if, on some open `U ⊂ V` with `U ∩ Λ_i = {0}` for both lattices, its `V/Λ_2`-component restricts to an isometry and its local lift satisfies `‖β(v) − v‖ ≤ ‖θ^(−N)‖·‖v‖`; it is *infinitely tangent* if it is `N`-tangent for every `N ≥ 1`, with `U` allowed to depend on `N`. For a continuous `F`-linear isomorphism `β`, define `Δ_β = Σ_(n≥1) (θ − β^(−1)tβ)θ^(n−1)T^(−n)` on `M_1`, where `θ` denotes the source action of `t`. `β` need not be `F[t]`-linear.

- `InfinitelyTangent`: the isometric local estimate for every `N`.
- `tangentDelta`: the operator series `Δ_β`.
- `InfinitelyTangent.exp`: an everywhere-convergent q-linear exponential with derivative one is infinitely tangent on lattice quotients.
- `tangentDelta_id`: for the identity with equal `t`-actions, `Δ = 0`.

*Construction.* Lift locally on opens avoiding lattice translates and require the isometry explicitly; an exponential with derivative one is `N`-tangent on a small enough disc for each `N`; transport the `t`-actions across `β`. (Tae, Definitions 6–7, Proposition 12 and the definition of `Δ_β`, pp. 385–386.) *Needs:* [§6.8](#dm-6-lattice-covolume); [§6.6](#dm-6-unit-lattice).

**Checks.**

- The identity is infinitely tangent, with `Δ = 0`.
- A series `x + Σ_(i≥1) e_ix^(q^i)` of infinite radius is `N`-tangent on a small enough disc for each `N`.
- For `c ≠ 1`, `x ↦ cx` is not infinitely tangent: its first-order error violates the estimates.

<a id="dm-6-tangent-determinant"></a>

### 6.10 The tangent determinant identity (`tangentDelta_det`)

**Theorem.** For a continuous `F`-linear isomorphism `β : (V/Λ_1) × H_1 → (V/Λ_2) × H_2` infinitely tangent to the identity on `V`, `Δ_β` is nuclear and `det(1 + Δ_β | M_1) = [Λ_1 : Λ_2]·|H_2| / |H_1|`. No determinant of an arbitrary infinite-dimensional automorphism is used.

*Proof sketch.* Compute directly when the lattices lie in a common lattice and the comparison is a local identity. Approximate a general lattice by one sharing such an overlattice, to a prescribed `T`-adic precision; `N`-tangency leaves the nuclear determinant unchanged to that precision. (Tae, Theorem 4 and proof, pp. 386–388.) *Needs:* [§6.9](#dm-6-tangent-comparison); [§6.3](#dm-6-nuclear-determinant); [§6.8](#dm-6-lattice-covolume); [§6.1](#dm-6-fitting-polynomial).

**Checks.**

- The identity with equal lattices and modules gives determinant one.
- With `H_1 = H_2 = 0` the determinant is the covolume alone; for the inverse Carlitz exponential, `Λ_1 = A`, `Λ_2 = A·log_C(1)`, it is `ι(log_C(1))`.
- Exchanging the roles of `H_1` and `H_2` inverts the class factor.

<a id="dm-6-class-number-formula"></a>

### 6.11 Taelman's class formula (`TaelmanModel.classFormula`)

**Theorem.** For every integral model `E/R`, including nonunit leading coefficient and rank zero, `L(E/R) = [R : U(E/R)]·|H(E/R)|` in `F((T^(−1)))`, with the local factors of the chosen model. Nothing is asserted here for general `A`, higher-dimensional t-motives or complex `L`-values.

*Proof sketch.* The trace formula identifies `L(E/R)` with `det(1 + Θ | K_∞/R)` for `Θ = (1 − E_tT^(−1))/(1 − θT^(−1)) − 1`. The exponential gives `0 → K_∞/U → E(K_∞)/E(R) → H → 0`; split the finite quotient continuously as an `F`-vector space and compare with `(K_∞/U) × H` by an infinitely tangent isomorphism. Apply [§6.10](#dm-6-tangent-determinant) with `Λ_1 = R`, `Λ_2 = U`, `H_1 = 0`, `H_2 = H`. (Tae, Theorem 1, p. 373, §5 proof, pp. 388–389.) *Needs:* [§6.5](#dm-6-euler-l-value); [§6.7](#dm-6-class-module); [§6.8](#dm-6-lattice-covolume); [§6.4](#dm-6-trace-formula); [§6.10](#dm-6-tangent-determinant).

**Checks.**

- For the Carlitz module this is `ζ_A(1) = log_C(1)`.
- For `q = 2` and `E_t = θ + θ³τ` over `F_2[θ]`, `|H| = T` and `L = ι(π_BP/θ²)` ([§6.13](#dm-6-carlitz-class-examples)).
- Dropping the class factor in the second example gives a Laurent series with leading term `T^(−1)`, while the Euler product has leading term one.

<a id="dm-6-small-power-sum"></a>

### 6.12 Depth-one Carlitz power sums (`carlitzPowerSum_eq`)

**Theorem.** For `A = F[θ]` let `A_(d,+)` be the monic polynomials of degree `d` and `S_d(s) = Σ_(a∈A_(d,+)) a^(−s)`. For `d ≥ 0` and `1 ≤ s ≤ q`, `S_d(s) = ℓ_d^(−s)`. Frobenius gives `S_d(ps) = S_d(s)^p`. In particular `ζ_A(1) = Σ_d ℓ_d^(−1) = log_C(1)` (`tsum_monic_inv_eq_carlitzLog_one`). The formula `ℓ_d^(−s)` is not asserted for other `s`.

*Proof sketch.* The generating identity for the Carlitz products gives the small-degree coefficient; use the signed products of [§0.11](#dm-0-carlitz-products); Frobenius extends along `p`-power exponents within the stated range; the sum over `d` converges in `K_∞` and matches `log_C(1)` term by term. (Tha, §§2.2–2.3, pp. 536–537.) *Needs:* [§0.11](#dm-0-carlitz-products); [§2.8](#dm-2-carlitz-exponential).

**Checks.**

- For `q = 2`, `d = 1`, `s = 3`: `S_1(3) = (θ² + θ + 1)/(θ(θ + 1))³`, which differs from `ℓ_1^(−3) = (θ(θ + 1))^(−3)`; the range `s ≤ q` is needed.
- For `d = 0`, `S_0(s) = 1`.
- For `d = 1`, `s = 1`: `Σ_(c∈F) 1/(θ + c) = 1/(θ − θ^q) = ℓ_1^(−1)`.

<a id="dm-6-carlitz-class-examples"></a>

### 6.13 The Carlitz module and a nonzero class module (`TaelmanModel.carlitz_classFormula`)

**Theorem.** For the Carlitz module over `F[θ]`, `H = 0`, `U = F[θ]·log_C(1)` and `L(C/A) = ζ_A(1) = log_C(1)` after renaming `θ` as `T`. For `q = 2` let `E_t = θ + θ³τ` over `F_2[θ]`. Then `exp_E(x) = θ^(−3)exp_C(θ³x)`, `U_E = (π_BP/θ³)·F_2[θ]`, `H_E ≅ F_2[t]/(t)` with generator the class of `θ^(−1)`, and `L(E/A) = ι(π_BP/θ²)`. So `|H_E| = T` is indispensable.

*Proof sketch.* At `q = 2`, `|π_BP| = 4` and `π_BP ∈ K_∞`. Any `x ∈ K_∞` reduces modulo `π_BP·A` to `|x| ≤ 2`, and on that disc `exp_C` is an isometric bijection (higher terms are strictly smaller), so `exp_C(K_∞) = θF_2[[θ^(−1)]]`. Since `θ³·E_t = C_t·θ³`, conjugation gives `exp_E(K_∞) = θ^(−2)F_2[[θ^(−1)]]`, which meets `A` in zero; the quotient by `A` has the single class `θ^(−1)`, and `E_t(θ^(−1)) = 1 + θ ∈ A`, so `t` kills it. The unit lattice is `θ^(−3)·ker exp_C`. Away from `(θ)` the reduction is conjugate to Carlitz; at `(θ)` the local factor is one; so `L(E/A) = ζ_A(1)(T − 1)/T`. From `C_(t+1)(1) = θ` and injectivity of `exp_C` on `|x| ≤ 2`, `π_BP/θ = log_C(θ) = (θ + 1)log_C(1)`, so `π_BP = (θ² + θ)log_C(1)` and `L(E/A) = ι(π_BP/θ²)`, which is also the regulator `ι(π_BP/θ³)` times `T`. The second example is computed here from the definitions and the Carlitz period; it is not an example of the source. (Tae, Example 3, p. 373, Definition 2 and Remark 2, p. 371.) *Needs:* [§2.9](#dm-2-carlitz-period); [§2.8](#dm-2-carlitz-exponential); [§6.11](#dm-6-class-number-formula); [§6.12](#dm-6-small-power-sum).

**Checks.**

- `exp_E` has derivative one and satisfies `exp_E(θx) = E_t(exp_E(x))`.
- `|π_BP/θ³| = 1/2`, so the regulator has leading term `T^(−1)`.
- `E_t(θ^(−1)) = θ·θ^(−1) + θ³·θ^(−2) = 1 + θ`.

### Examples

- Carlitz over `F[θ]`: `L(C/A) = Σ_(a monic) 1/a = log_C(1)`, regulator `log_C(1)`, class module zero.
- `q = 2`, `E_t = θ + θ³τ`: regulator `ι(π_BP/θ³)`, class module `F_2[t]/(t)`, `L = ι(π_BP/θ²)`.

### Dependencies

Layers DM.0 and DM.2; Mathlib `LinearMap.charpoly`; Tau Ceti `TauCeti.fittingIdeal` (current library); FiniteFieldsAndCharacterSums (linearized polynomials); AlgebraicCurves Layers 2 and 5; FunctionFieldArithmetic §2.1.

## Layer DM.7: Normalized elliptic sheaves and shtuka comparisons

Drinfeld's elliptic sheaves are periodic chains of vector bundles on `C × S` with a Frobenius modification at the characteristic and a pole at `∞`. The normalized ones correspond to Drinfeld modules: the motive of a Drinfeld module, filtered by `τ`-degree at infinity, glues to such a chain, and the sections of the chain recover the module. The chain gives a global shtuka with two legs, which is how this roadmap connects to the function-field Langlands correspondence, and its completions realize the Tate modules and the local shtuka at the characteristic.

<a id="dm-7-elliptic-sheaf"></a>

### 7.1 Elliptic sheaves (`EllipticSheaf`)

**Definition.** Let `S` be an `F`-scheme with a characteristic map `c : S → C − ∞`, and `σ = id_C × Frob_(q,S)` on `C × S`. An elliptic sheaf of rank `r` over `S` is a family of vector bundles `ℰ_i` (`i ∈ ℤ`) of rank `r` on `C × S` with injections `j_i : ℰ_i → ℰ_(i+1)` and `τ_i : σ^∗ℰ_i → ℰ_(i+1)` such that `j_(i+1)τ_i = τ_(i+1)σ^∗j_i`, with a periodicity isomorphism `ℰ_(i+rδ) ≅ ℰ_i(∞)` compatible with `j` and `τ`, such that each `coker j_i` is supported on `∞ × S` with pushforward to `S` a line bundle, and each `coker τ_i` is supported on the graph of `c` with pushforward a line bundle. Morphisms are compatible chain maps `ℰ_i → ℰ'_(i+n)` with a nonnegative shift independent of `i` locally on `S`, identified when they agree after further `j`-shifts, and glued over `S`. On a quasi-compact base one can choose a single bound for the shift. The bundles live on the global curve `C`.

- `EllipticSheaf`: the periodic chain with `j`, `τ` and the cokernel conditions.
- `EllipticSheaf.periodic`: `ℰ_(i+rδ) ≅ ℰ_i(∞)`, compatible with `j` and `τ`.
- `EllipticSheaf.characteristic`: the characteristic leg `c` read off from the `τ`-cokernel.
- `EllipticSheaf.Hom`, `EllipticSheaf.Hom.ext`: locally bounded-shift chain morphisms modulo further inclusions, equal when the component maps agree after a common shift.
- `EllipticSheaf.baseChange`: pullback preserves the chain, the characteristic and the cokernel conditions.

*Construction.* Use locally free sheaves and their pullbacks (AlgebraicVectorBundles L0B, Mathlib `AlgebraicGeometry.Scheme.Modules`) and divisor twists (JacobianChallenge Layer A); build the integer-indexed diagram with its commuting squares; compose morphisms by adding shifts. Fixed-index maps alone would miss isogenies of positive degree. (Wie, Definition 5.1, p. 72, Proposition 5.5 and Lemma 5.7, pp. 73–74, §5.4, pp. 80–84.) *Needs:* [§0.9](#dm-0-relative-drinfeld-module); JacobianChallenge Layer A; AlgebraicVectorBundles L0B; Mathlib `AlgebraicGeometry.Scheme.Modules`, `AlgebraicGeometry.Scheme.Modules.pullback`, `SheafOfModules.IsLocallyFree`, `SheafOfModules.IsFinitePresentation`.

**Checks.**

- For `A = F[t]`, `C = P^1` and the Carlitz module: `ℰ_i = 𝒪(i)`, `j` the inclusion at `∞`, and `τ` multiplication by `t − θ` from `σ^∗𝒪(i)` to `𝒪(i + 1)`.
- For rank two and `δ = 1`, twisting by `∞` advances the index by two.
- Replacing `σ = id_C × Frob_S` by the absolute Frobenius of `C × S` changes the degree of every `ℰ_i` and is incompatible with the periodicity.
- On `S = ⨿_(n≥0) Spec F` with `φ_t = τ²`, the maps `u_n = τ^n` commute with `φ_t` and define a morphism of the constant Drinfeld family. Their shifts are unbounded globally; a globally bounded definition of Hom would miss this morphism.

<a id="dm-7-normalized-elliptic-sheaf"></a>

### 7.2 Normalized elliptic sheaves (`NormalizedEllipticSheaf`)

**Definition.** An elliptic sheaf is *normalized* if `χ(ℰ_(−1), s) = 0` on every fibre over a field and the maps `τ_i` induce isomorphisms `σ^∗(ℰ_i/ℰ_(i−1)) ≅ ℰ_(i+1)/ℰ_i`; equivalently the images of `ℰ_i` and `σ^∗ℰ_i` span `ℰ_(i+1)` and meet in `σ^∗ℰ_(i−1)`. Then `H⁰(ℰ_(−1), s) = H¹(ℰ_(−1), s) = 0`, and for `i ≥ 0`, `H¹(ℰ_i, s) = 0` and `dim H⁰(ℰ_i, s) = i + 1`. So `pr_(S∗)ℰ_0` is a line bundle and `deg ℰ_(−1) = r(g − 1)`.

- `NormalizedEllipticSheaf`: the Euler-characteristic and transversality conditions.
- `NormalizedEllipticSheaf.sections`: the filtered family `pr_(S∗)ℰ_i`.
- `NormalizedEllipticSheaf.h0`: fibre dimensions `max(i + 1, 0)`.
- `NormalizedEllipticSheaf.h1`: `H¹` vanishes on fibres for `i ≥ −1`.
- `NormalizedEllipticSheaf.line`: `pr_(S∗)ℰ_0` is invertible, and its dual is the line of the Drinfeld module.

*Construction.* Transversality gives `0 → σ^∗ℰ_(i−1) → ℰ_i ⊕ σ^∗ℰ_i → ℰ_(i+1) → 0`; fibrewise Riemann–Roch (JacobianChallenge Layer B) and the first nonzero section locate index zero; cohomology and base change (JacobianChallenge Layer C) give the pushforward line and the sections. (Wie, Definition 5.9, Lemma 5.12, Corollary 5.13 and Proposition 5.14, pp. 75–77.) *Needs:* [§7.1](#dm-7-elliptic-sheaf); JacobianChallenge Layers A, B and C.

**Checks.**

- On `P^1`, `ℰ_(−1) = 𝒪(−1)` has `H⁰ = H¹ = 0`, and `ℰ_0 = 𝒪` has one section.
- Shifting the Carlitz chain to `ℰ_i = 𝒪(i + 1)` gives `χ(ℰ_(−1)) = 1` and fails normalization.
- The Drinfeld line is `(pr_(S∗)ℰ_0)^∨`: the sections are the motive generator, not the point line.

<a id="dm-7-drinfeld-to-sheaf"></a>

### 7.3 The elliptic sheaf of a Drinfeld module (`DrinfeldModule.ellipticSheaf`)

**Definition.** For a Drinfeld module `E` of rank `r` over `S` in standard form, its motive `M` is locally free of rank `r` over `A ⊗_F 𝒪_S` and of rank one over `𝒪_S{τ}`. Over a local coefficient ring `R`, inside `M ⊗_A K_0`, let `ℰ_(i,∞)` consist of the elements of `τ`-degree at most `i` in the filtration `deg_τ(m ⊗ a) = deg_τ(m) − rδ·ord_∞(a)`; gluing with `M` on `(C − ∞) × S` gives `ℰ_i`. Inclusion gives `j_i`, left multiplication by `τ` gives `σ^∗ℰ_i → ℰ_(i+1)`, and a local inverse uniformizer at `∞` gives `ℰ_(i+rδ) = ℰ_i(∞)`. These form a normalized elliptic sheaf.

- `DrinfeldModule.ellipticSheaf`: the glued chain.
- `DrinfeldModule.ellipticSheaf_affine`: its restriction to `(C − ∞) × S` is `M(E)`.
- `DrinfeldModule.ellipticSheaf_periodic`: the shift by `rδ` is the twist by `𝒪(∞)`.
- `DrinfeldModule.ellipticSheafMap`: a morphism `u : E → E'` of degree at most `n` on an open of `S` gives a chain map with shift `n` from the sheaf of `E'` to that of `E`.

*Construction.* Finite generators of the degree filtration and its one-dimensional graded pieces give finite presentation; projectivity over `R ⊗ 𝒪_(C,∞)` uses fibres, nilpotent-base flatness and finite coefficient descent; glue across the punctured neighbourhood of `∞` (AlgebraicCurves Layer 3, JacobianChallenge Layer A). Check the characteristic quotient and transversality; the sections recover the `τ`-degree filtration. A morphism of degree at most `n` shifts the filtration by at most `n`, contravariantly; these bounds are local on the base and the maps glue. (Wie, §§3.4–3.6, Proposition 3.10 and Lemmas 3.11–3.17, pp. 40–48, §5.3.3, pp. 79–80, §5.4.1, pp. 81–82.) *Needs:* [§4.3](#dm-4-contravariant-motive); [§0.10](#dm-0-relative-standardization); [§7.2](#dm-7-normalized-elliptic-sheaf); JacobianChallenge Layers A, B and C; AlgebraicCurves Layer 3.

**Checks.**

- The Carlitz motive `L[t]` gives `ℰ_i = 𝒪(i)` and Frobenius factor `t − θ`.
- A rank-two Drinfeld module gives bundles of rank two, although its motive is of rank one over `L{τ}`.
- An isogeny of positive degree cannot in general be represented by maps `ℰ_i → ℰ'_i` for all `i`; shifts are needed.

<a id="dm-7-elliptic-antiequivalence"></a>

### 7.4 The elliptic sheaf dictionary (`DrinfeldModule.ellipticSheafEquiv`)

**Theorem.** The construction of [§7.3](#dm-7-drinfeld-to-sheaf) is an anti-equivalence between Drinfeld `A`-modules of rank `r` over `S` in standard form and normalized elliptic sheaves of rank `r` over `S` with locally bounded-shift morphisms. The inverse takes the line `(pr_(S∗)ℰ_0)^∨` and the sheaf of `𝒪_S{τ}`-modules `pr_(S∗)(ℰ_0|_((C − ∞) × S))`, locally free of rank one, on which the right action of `A` gives the Drinfeld module. Characteristic and rank are preserved, and level structures on the good open correspond. Equivalently it is a covariant equivalence with the opposite category of elliptic sheaves.

*Proof sketch.* Normalized cohomology identifies the generator line and its Frobenius iterates; the affine sections form the `τ`-module, and multiplication by `a ∈ A` respects the filtration with unit leading term. Construct the inverse action locally and descend (SchemeAndStackFoundations §1.1). Both constructions recover the same filtered module; morphisms reverse composition. Wiedmann states an equivalence with a convention on affine-module morphisms; with the contravariant motive and locally bounded-shift morphisms it is an anti-equivalence, and at a non-rational `∞` each length-one quotient of the degree filtration carries the residue field of `∞`, permuted by Frobenius, which is why the period is `rδ`. (Wie, Theorem 5.10 and proof, pp. 75–84, Proposition 5.21, pp. 78–79, §5.4.2, pp. 82–84.) *Needs:* [§7.3](#dm-7-drinfeld-to-sheaf); [§7.2](#dm-7-normalized-elliptic-sheaf); [§4.4](#dm-4-abelian-antiequivalence); SchemeAndStackFoundations §1.1.

**Checks.**

- The generator of the sections is dual to the point-line generator, as for the motive functor.
- Applying the inverse to the Carlitz chain `ℰ_i = 𝒪(i)` returns `C_t = θ + τ`.
- A degree-one isogeny `u` corresponds to a chain map of shift one, and composites add shifts.

<a id="dm-7-shtuka-export"></a>

### 7.5 The two-leg shtuka of an elliptic sheaf (`EllipticSheaf.shtukaDatum`)

**Definition.** From a normalized elliptic sheaf take `ℰ_0` and `α = j_0^(−1)τ_0 : σ^∗ℰ_0|_U ≅ ℰ_0|_U` on `U = (C × S) − ((∞ × S) ∪ Γ_c)`. The cokernels of `τ` and `j` bound the zero at the characteristic and the pole at `∞` of this `GL_r`-modification. At a rational `∞` both are length-one modifications; at general `δ` the pole and its residue factors are kept as the periodic chain, not replaced by a rational leg. The global shtuka category in which this datum lies is defined independently in GlobalShtukasAndFunctionFieldLanglands, which compares elliptic sheaves with one-leg shtukas.

- `EllipticSheaf.shtukaDatum`: `ℰ_0` with `α = j_0^(−1)τ_0` away from the legs.
- `EllipticSheaf.shtukaDatum_zero`: the characteristic modification and its length-one cokernel.
- `EllipticSheaf.shtukaDatum_pole`: the modification at `∞` inherited from `j_0` and the chain.
- `EllipticSheaf.shtukaDatum_baseChange`: compatibility with base change.

*Construction.* Restrict to where both injections are isomorphisms and compose in the Frobenius direction; pass from the vector bundle to its `GL_r`-frame torsor (AlgebraicVectorBundles L0B, SchemeAndStackFoundations §1.15); record the two modifications with their cokernels and restrict levels. (Wie, Definition 5.1 and Remark 5.2, pp. 72–73, §5.4, pp. 80–84.) *Needs:* [§7.3](#dm-7-drinfeld-to-sheaf); AlgebraicVectorBundles L0B; SchemeAndStackFoundations §1.15.

**Checks.**

- For the Carlitz chain on `P^1`, `α` is multiplication by `t − θ` in the affine trivialization.
- The zero leg is `t = θ` and the pole is `∞`.
- The inverse `(t − θ)^(−1)` exchanges zero and pole and is not the Frobenius direction used here.

<a id="dm-7-tate-realization"></a>

### 7.6 Tate modules from elliptic sheaves (`EllipticSheaf.tateDual`)

**Theorem.** For the normalized elliptic sheaf of a Drinfeld module `E` over a field and `λ` away from the characteristic, the `τ`-fixed part of the completion at `λ` of the affine motive pairs perfectly with `T_λE` into the residue-dual line `D_λ` of [§5.1](#dm-5-rational-motive-realization), with an `A_λ`-linear Galois-equivariant pairing obtained at each level `λ^n` from the finite shtuka equivalence. The pairing is compatible with morphisms of Drinfeld modules, shifts of chain maps, base extension and level structures.

*Proof sketch.* Reduce `M` modulo `λ^n` and apply [§1.2](#dm-1-finite-shtuka-equivalence) with the evaluation pairing of [§1.7](#dm-1-geometric-torsion-basis); pass to the limit along the division maps of [§1.8](#dm-1-tate-module). (Har, Definition 6.1, p. 23, Theorem 6.4, pp. 24–26, Proposition 6.5 and Theorem 6.6, p. 26.) *Needs:* [§7.4](#dm-7-elliptic-antiequivalence); [§5.1](#dm-5-rational-motive-realization); [§1.8](#dm-1-tate-module); [§1.9](#dm-1-continuous-galois-action); [§1.7](#dm-1-geometric-torsion-basis).

**Checks.**

- For the Carlitz module the point Tate character and the motive character are inverse to each other.
- Shifting a chain map by one index does not change the induced map on Tate modules.
- Base extension of the field commutes with the pairing.

<a id="dm-7-characteristic-comparison"></a>

### 7.7 The characteristic place for elliptic sheaves (`EllipticSheaf.charLocalShtuka`)

**Theorem.** Let `𝔭` be the characteristic and `R` an `A`-algebra in which `γ(𝔭)` is nilpotent. Completing the affine motive of the elliptic sheaf at `𝔭` and keeping the distinguished factor gives the effective local shtuka `M̂_𝔭(M)` of [§1.12](#dm-1-characteristic-local-realization), of rank `r`, with the `q^(deg 𝔭)`-Frobenius and a rank-one cokernel killed by `z − γ(z)`; its finite levels correspond to the full `𝔭`-power torsion group schemes. This compares completed motives and finite torsion; it is not a separable-point Tate representation at the characteristic.

*Proof sketch.* Identify the affine motive through the dictionary of [§7.4](#dm-7-elliptic-antiequivalence), complete and split the coefficient factors, iterate `τ` by the residue degree, and apply [§1.11](#dm-1-local-shtuka-equivalence). (Har, Theorem 6.4, pp. 24–26, Definition 7.1 and Example 7.2, p. 27, Theorems 7.4 and 7.6, p. 28.) *Needs:* [§7.4](#dm-7-elliptic-antiequivalence); [§1.12](#dm-1-characteristic-local-realization).

**Checks.**

- For `φ_t = τ²` over `F` and `𝔭 = (t)`, the connected torsion of length `q^(2n)` at level `t^n` is preserved.
- For the Carlitz module in characteristic `(t)`, the local shtuka is `F[[z]]` with `τ = z`.
- Separable points at the characteristic are zero for `φ_t = τ²`, while the local shtuka has rank two.

### Examples

- The Carlitz elliptic sheaf on `P^1`: `ℰ_i = 𝒪(i)`, `j` the inclusion, `τ = t − θ`, shtuka `(𝒪, t − θ)` with legs `θ` and `∞`.
- A rank-two Drinfeld module over `F[t]` gives a chain of rank-two bundles with `ℰ_(i+2) = ℰ_i(∞)`.

### Dependencies

Layers DM.0, DM.1, DM.4 and DM.5; AlgebraicCurves Layer 3; JacobianChallenge Layers A, B and C; AlgebraicVectorBundles L0B; SchemeAndStackFoundations §§1.1, 1.15; Mathlib sheaves of modules on schemes.

## Layer DM.8: Rigid analytic motives, periods and Carlitz logarithms

This layer proves Papanikolas's theorem: for a pre-t-motive with a rigid analytic trivialization `Ψ` whose `σ`-matrix is polynomial with determinant supported at `t = θ`, the transcendence degree of the field generated by the entries of `Ψ(θ)` equals the dimension of the motivic Galois group; and its application to Carlitz logarithms. It opens with linear algebra of fixed vectors of a semilinear map, which gives the Betti realization and its dimension criterion. Then come the analytic rings of difference equations, rigid analytic triviality and Anderson's comparison with uniformizability, the neutral Tannakian category of rigid analytically trivial pre-t-motives over `F_q(t)`, the difference Galois group and its torsor, and the identification of the two groups. The Anderson–Brownawell–Papanikolas criterion lifts algebraic relations at `t = θ` to polynomial relations among entire functions and gives the period theorem; the Carlitz case is then computed explicitly. Notation follows the conventions: `k = F_q(θ)`, `k̄` its algebraic closure in `C_∞`, `K = k̄(t)`, `𝕋`, `𝕃`, `𝔼` as there.

<a id="dm-8-fixed-coefficients"></a>

### 8.1 Fixed coefficients of fixed combinations (`coeff_fixed_of_sum_fixed`)

**Lemma.** In the semilinear setting (S) of the conventions, let `v : I → V` be a finite family of vectors fixed by `f` that is `L`-linearly independent. If `c : I → L` and `Σ_i c_i v_i` is fixed by `f`, then `σ(c_i) = c_i` for every `i`. Exact constants are not needed.

*Proof sketch.* Applying `f` gives `Σ_i σ(c_i)v_i = Σ_i c_i v_i`; independence gives `σ(c_i) − c_i = 0`. (Pap, Lemma 3.3.7, pp. 12–13, whose minimal-relation argument works for any field automorphism and semilinear map.) *Needs:* Mathlib `linearIndependent_iff'`.

**Checks.**

- For `L = ℂ`, `F = ℝ`, `σ` complex conjugation, `V = ℂ`, `f = σ` and `v = (1)`, a fixed multiple `c·1` has `c` real.
- For the empty family the statement is vacuous.
- Independence is necessary: with `v = (1, 1)`, the fixed combination `i·1 + (−i)·1 = 0` has non-fixed coefficients.

<a id="dm-8-fixed-span-descent"></a>

### 8.2 Descent of spans of fixed vectors (`mem_span_iff_of_fixed`)

**Lemma.** In setting (S) with exact constants, let `v : I → V` be a finite `L`-linearly independent family of fixed vectors and `w` a fixed vector. Then `w` lies in the `L`-span of the `v_i` if and only if it lies in their `F`-span.

*Proof sketch.* Write `w = Σ c_i v_i` with `c_i ∈ L`; [§8.1](#dm-8-fixed-coefficients) makes each `c_i` fixed, and exact constants put it in `F`. The converse uses the scalar tower. (Pap, Lemma 3.3.7, pp. 12–13.) *Needs:* [§8.1](#dm-8-fixed-coefficients); Mathlib `Submodule.mem_span_range_iff_exists_fun`.

**Checks.**

- For complex conjugation and `v = (1)`, the fixed vectors in the `ℂ`-span are exactly the real axis.
- For the empty family, a fixed `w` lies in either span exactly when `w = 0`.
- For `σ = id` on `ℂ` with `F = ℝ` (no exact constants), `w = i` is fixed and in the `ℂ`-span of `1` but not in its `ℝ`-span.

<a id="dm-8-finite-fixed-independence"></a>

### 8.3 Independence of finite fixed families (`linearIndependent_of_fixed_fin`)

**Lemma.** In setting (S) with exact constants, if `v : Fin n → V` is `F`-linearly independent and each `v_i` is fixed by `f`, then `v` is `L`-linearly independent, for every `n ≥ 0`.

*Proof sketch.* Induct on `n`, splitting off the first vector with `linearIndependent_finSucc`: if it lay in the `L`-span of the (inductively `L`-independent) tail, [§8.2](#dm-8-fixed-span-descent) would put it in the `F`-span. (Pap, Lemma 3.3.7, pp. 12–13.) *Needs:* [§8.2](#dm-8-fixed-span-descent); Mathlib `linearIndependent_finSucc`.

**Checks.**

- For `n = 1`, independence means `v_0 ≠ 0`, in both senses.
- The pair `(1, 1)` over `ℚ` is excluded by the independence hypothesis.
- The `ℝ`-independent pair `(1, i)` is not a fixed family for conjugation, and is not `ℂ`-independent.

<a id="dm-8-fixed-independence"></a>

### 8.4 Linear independence of fixed vectors (`linearIndependent_of_fixed`)

**Theorem.** In setting (S) with exact constants, every `F`-linearly independent family `v : I → V` of vectors fixed by `f` is `L`-linearly independent, for any index type `I`.

*Proof sketch.* Linear independence is checked on finite subfamilies; reindex a finite subfamily by `Fin n` and apply [§8.3](#dm-8-finite-fixed-independence). No finite-dimensionality of `V` and no finite order of `σ` are used. (Pap, Lemma 3.3.7, pp. 12–13.) *Needs:* [§8.3](#dm-8-finite-fixed-independence); Mathlib `linearIndependent_iff_finset_linearIndependent`.

**Checks.**

- Exact constants and fixedness are both needed: `σ = id` on `ℂ` with `F = ℝ` fails the first; for conjugation, `(1, i)` fails the second.
- The theorem gives independence of an `F`-basis of the fixed submodule before its finiteness is known.
- For `f = id` and `σ = id` with `F = L`, the statement is a tautology.

<a id="dm-8-betti-comparison-injective"></a>

### 8.5 Injectivity of the Betti comparison (`bettiComparison_injective`)

**Lemma.** In setting (S) with exact constants, let `W = f.fixedSubmodule ⊂ V` (an `F`-submodule). The `L`-linear map `κ : L ⊗_F W → V`, `a ⊗ w ↦ a·w` (Mathlib's `(W.subtype).liftBaseChange L`), is injective. No finite-dimensionality is assumed.

*Proof sketch.* Choose an `F`-basis `b` of `W`; its image in `V` is a fixed `F`-independent family, hence `L`-independent by [§8.4](#dm-8-fixed-independence). `b.baseChange L` is a basis of `L ⊗_F W` mapped by `κ` to that family, so `κ` is injective. (Pap, Lemma 3.3.7 and Proposition 3.3.8, pp. 12–13.) *Needs:* [§8.4](#dm-8-fixed-independence); Mathlib `LinearMap.fixedSubmodule`, `LinearMap.liftBaseChange`, `Module.Basis.baseChange`, `Module.Free.chooseBasis`, `Module.Basis.injective_constr_of_linearIndependent`.

**Checks.**

- For complex conjugation, `ℂ ⊗_ℝ ℝ → ℂ` is bijective.
- For `f = 2·id` on `ℚ` (`σ = id`, `F = L = ℚ`) the fixed space is zero, and `κ` is injective but not surjective.
- For the zero space `κ` is the map between zero spaces.

<a id="dm-8-fixed-space-finite"></a>

### 8.6 The fixed space is finite-dimensional (`fixedSubmodule_finiteDimensional`)

**Lemma.** In setting (S) with exact constants, if `V` is finite-dimensional over `L` then `f.fixedSubmodule` is finite-dimensional over `F` (while `V` need not be finite-dimensional over `F`).

*Proof sketch.* An `F`-basis of the fixed space is `L`-independent in `V` ([§8.4](#dm-8-fixed-independence)), so its index set is finite. Finiteness is proved directly, not read off from a `finrank`, which is zero for infinite-dimensional spaces. (Pap, Proposition 3.3.8, pp. 12–13.) *Needs:* [§8.4](#dm-8-fixed-independence); Mathlib `LinearIndependent.finite`, `Module.Basis.finiteDimensional_of_finite`.

**Checks.**

- For conjugation on `ℂ` the fixed space has real dimension one.
- For `2·id` on `ℚ` the fixed space is zero-dimensional.
- For `L = ℝ(x)` over `F = ℝ` with `σ = id`, `V = L` is infinite-dimensional over `F` while the fixed space `L` is not finite over `F`: exact constants are needed.

<a id="dm-8-fixed-dimension-bound"></a>

### 8.7 The dimension bound (`finrank_fixedSubmodule_le`)

**Lemma.** In setting (S) with exact constants and `V` finite-dimensional over `L`, `dim_F(f.fixedSubmodule) ≤ dim_L V`.

*Proof sketch.* `κ` is injective ([§8.5](#dm-8-betti-comparison-injective)) and `dim_L(L ⊗_F W) = dim_F W` (Mathlib `Module.finrank_baseChange`), with `W` finite-dimensional by [§8.6](#dm-8-fixed-space-finite). (Pap, Proposition 3.3.8, pp. 12–13.) *Needs:* [§8.5](#dm-8-betti-comparison-injective); [§8.6](#dm-8-fixed-space-finite); Mathlib `LinearMap.finrank_le_finrank_of_injective`, `Module.finrank_baseChange`.

**Checks.**

- Conjugation on `ℂ`: equality `1 ≤ 1`.
- `2·id` on `ℚ`: strict inequality `0 < 1`.
- The zero space: both sides are zero.

<a id="dm-8-betti-comparison-dimension"></a>

### 8.8 The dimension criterion (`bettiComparison_bijective_iff`)

**Theorem.** In setting (S) with exact constants and `V` finite-dimensional over `L`, the comparison `κ : L ⊗_F f.fixedSubmodule → V` is bijective if and only if `dim_F(f.fixedSubmodule) = dim_L V`.

*Proof sketch.* The forward direction is invariance of `finrank` under the linear equivalence `κ`. Conversely, equal finite dimensions and injectivity of `κ` give surjectivity. (Pap, Proposition 3.3.8, pp. 12–13.) *Needs:* [§8.5](#dm-8-betti-comparison-injective); [§8.6](#dm-8-fixed-space-finite); Mathlib `Module.finrank_baseChange`, `LinearEquiv.finrank_eq`, `LinearMap.injective_iff_surjective_of_finrank_eq_finrank`.

**Checks.**

- The identity on `ℚ` and conjugation on `ℂ` have bijective comparison maps.
- The zero-dimensional object qualifies.
- `2·id` on `ℚ` is invertible but has no nonzero fixed vector: invertibility of `f` does not make `κ` bijective.

<a id="dm-8-fixed-basis-coordinates"></a>

### 8.9 Constant coordinates in a fixed basis (`fixed_iff_exists_unique_coords`)

**Lemma.** In setting (S) with exact constants, let `b` be an `L`-basis of `V` indexed by a finite type, with every `b_i` fixed. Then `w ∈ V` is fixed if and only if `w = Σ_i c_i b_i` for a unique `c : I → F`.

*Proof sketch.* Expand `w` in the basis; [§8.1](#dm-8-fixed-coefficients) and exact constants put the coefficients in `F`, uniquely by injectivity of `F → L`; the converse is `F`-linearity of `f`. (Pap, Lemma 4.1.6, p. 22, with Lemma 3.3.7.) *Needs:* [§8.1](#dm-8-fixed-coefficients); Mathlib `Module.Basis.span_eq`, `Submodule.mem_span_range_iff_exists_fun`.

**Checks.**

- For conjugation and the basis `(1)` of `ℂ`, the fixed vectors have real coordinates.
- For the empty basis the coordinate family is empty.
- For a basis containing a non-fixed vector (for conjugation, `(i)`) the statement fails: `1 = (−i)·i` is fixed with non-real coordinate.

<a id="dm-8-entire-series"></a>

### 8.10 Arithmetic entire series (`IsArithmeticEntire`)

**Definition.** `𝔼` is the subring of `C_∞[[t]]` of series `f = Σ a_n t^n` whose coefficients are algebraic over `k`, which are entire (`|a_n|·u^n → 0` for every `u > 0`), and for which `k_∞(a_n : n ≥ 0)` is finite over `k_∞`. Evaluation at `z ∈ C_∞` is `Σ a_n z^n`. `𝔼` lies in the radius-one Tate algebra `𝕋`. Entire series in general are RestrictedPowerSeries §7.2; the two arithmetic conditions are those of Anderson–Brownawell–Papanikolas.

- `IsArithmeticEntire`: algebraic coefficients, entire, finite coefficient field over `k_∞`.
- `arithmeticEntire_eval`: evaluation is a ring map `𝔼 → C_∞`.
- `arithmeticEntire_polynomial`: polynomials with coefficients algebraic over `k` lie in `𝔼`.
- `arithmeticEntire_le_restricted`: `𝔼 ⊂ 𝕋`.
- `arithmeticEntire_eval_polynomial`: evaluation agrees with polynomial evaluation.

*Construction.* Closure under sums and products uses entire-series closure (RestrictedPowerSeries §7.2) and the compositum of two finite coefficient fields. (Pap, §§2.2.3–2.2.4, p. 7; ABP, §2.4, p. 7.) *Needs:* [§2.2](#dm-2-c-infinity); RestrictedPowerSeries §7.2; Mathlib `PowerSeries.IsRestricted`, `IntermediateField.adjoin`.

**Checks.**

- `0 ∈ 𝔼` and evaluates to zero.
- A constant algebraic over `k` lies in `𝔼` and evaluates to itself.
- `Σ t^n` is excluded: its coefficients do not tend to zero at radius one.

<a id="dm-8-twisting-limit"></a>

### 8.11 Limits of Frobenius twists (`tendsto_twist_iterate`)

**Theorem.** For `f ∈ 𝕋` of Gauss norm at most one there are `s ≥ 1` and a polynomial `P` with coefficients in the algebraic closure of `F_q` in `C_∞` such that `f^(ns) → P` in the Gauss norm as `n → ∞`, where `f^(m)` is the `m`-fold positive coefficient twist. `P ≠ 0` exactly when `|f| = 1`. For a single coefficient: `a^(q^(ns)) → 0` if `|a| < 1`; if `|a| = 1`, for suitable `s` the sequence tends to the Teichmüller representative of the residue of `a`. The limit coefficients need not lie in `F_q`.

*Proof sketch.* The residue field of `C_∞` is `F̄_q`; choose a common Frobenius period for the finitely many residues of the factorization of [the analytic-ring supplier contract](#dm-8-tate-analytic-interface). The strictly small unit tail tends to one uniformly; norm less than one forces the constant to zero. (Pap, Lemmas 2.2.6–2.2.7, p. 8.) *Needs:* [§2.1](#dm-8-coefficient-twist); [the analytic-ring supplier contract](#dm-8-tate-analytic-interface).

**Checks.**

- For a constant in `F_(q²) ∖ F_q` the limit lies in `F_(q²)`, so `s = 2` is needed.
- A series of norm less than one tends to zero.
- A unit of norm one has a nonzero polynomial limit.

<a id="dm-8-analytic-fixed-fields"></a>

### 8.12 Constants of the analytic rings (`fixedPoints_tateAlgebra`)

**Theorem.** For the inverse coefficient twist `σ`: `𝕋^σ = F_q[t]` and `𝕃^σ = F_q(t)`, the `σ`-fixed elements of `K = k̄(t)` are `F_q(t)`, and `F_q(t) ∩ 𝕋 = F_q[t]`. The same holds for `σ^n` with `F_q` replaced by `F_(q^n)`. These are statements about the Tate algebra over `C_∞`, not about the full Laurent series field, whose constants are `F_q((t))`.

*Proof sketch.* A fixed restricted series has coefficients in `F_q` tending to zero, so it is a polynomial. For a fixed fraction the polar divisor is `σ`-stable; its monic denominator has coefficients in `F_q`; clearing it reduces to the series case. For rational functions normalize numerator and denominator. (Pap, Lemma 3.3.2, p. 12, §2.2.5, pp. 7–8.) *Needs:* [§2.1](#dm-8-coefficient-twist); [the analytic-ring supplier contract](#dm-8-tate-analytic-interface); Mathlib `RatFunc`.

**Checks.**

- `t` and `1/(t − 1)` are fixed fractions.
- A fixed formal series with infinitely many nonzero coefficients in `F_q` is not in `𝕋`.
- `F_q(t) ∩ 𝕋` contains no element with a pole in the closed unit disc.

<a id="dm-8-mac-lane-separability"></a>

### 8.13 Separability and geometric reducedness (`isSeparable_iff_not_exists_pthRoot`)

**Theorem.** For a field `k_0` of characteristic `p` and a field extension `L'/k_0`, the following are equivalent: `L'` is separable over `k_0`; `L' ⊗_(k_0) k_0^(1/p)` is reduced; `L'` is geometrically reduced over `k_0` (Mathlib's `Algebra.IsGeometricallyReduced`). If `k_0 = κ(t)` with `κ` perfect, then `k_0^(1/p) = k_0(t^(1/p))`, and `L'/k_0` is separable if and only if `t` has no `p`-th root in `L'`. Separability here is the general notion, not algebraic separability (`Algebra.IsSeparable`), which would force `L'/k_0` to be algebraic.

*Proof sketch.* The first equivalences are Mac Lane's criterion (Stacks, Lemma 10.44.2, Tag 030W). For `k_0 = κ(t)` with `κ` perfect, `{t}` is a `p`-basis, so `k_0^(1/p) = k_0[X]/(X^p − t)` and `L' ⊗ k_0^(1/p) = L'[X]/(X^p − t)`, which is reduced exactly when `X^p − t` has no root in `L'`, i.e. is irreducible over `L'`. (Stacks, Tag 030W; Pap, §4.1.1, p. 21.) *Needs:* Mathlib `Algebra.IsGeometricallyReduced`, `Polynomial`.

**Checks.**

- `L' = k_0(t^(1/p))` is not separable over `k_0 = κ(t)`.
- `L' = k_0(x)` with `x` transcendental is separable over `k_0`, though not algebraic.
- Over a perfect `k_0` every extension is separable.

<a id="dm-8-analytic-separability"></a>

### 8.14 The analytic difference fields (`analyticTower_admissible`)

**Theorem.** In the tower `F_q(t) ⊂ k̄(t) ⊂ 𝕃`, `σ` fixes `F_q(t)`, its fixed fields in `k̄(t)` and in `𝕃` are exactly `F_q(t)`, and `𝕃/k̄(t)` is separable in the general sense (neither finite nor algebraic).

*Proof sketch.* The constants are [§8.12](#dm-8-analytic-fixed-fields). `k̄` is perfect, so by [§8.13](#dm-8-mac-lane-separability) it suffices that `t` has no `p`-th root in `𝕃`; inside the Laurent series field such a root would have `t`-adic order `1/p`. (Pap, §4.1.1, p. 21.) *Needs:* [§8.12](#dm-8-analytic-fixed-fields); [§8.13](#dm-8-mac-lane-separability); [§2.2](#dm-2-c-infinity).

**Checks.**

- The same tower with `σ` replaced by the identity of `𝕃` has fixed field `𝕃`, not `F_q(t)`.
- `𝕃` contains transcendental elements over `k̄(t)` such as `Ω`, so the extension is not algebraic.
- `t^(1/p) ∉ 𝕃`.

<a id="dm-8-rigid-triviality"></a>

### 8.15 Rigid analytic triviality (`IsRigidAnalyticallyTrivial`)

**Definition.** For a pre-t-motive `P` ([§4.12](#dm-4-pre-t-motive)) let `V = 𝕃 ⊗_K P` with the induced semilinear `σ`, regarded as an `F_q(t)`-linear map, and let the Betti realization be `P^B = V^σ`, its fixed `F_q(t)`-subspace. `P` is rigid analytically trivial when the comparison `𝕃 ⊗_(F_q(t)) P^B → V`, `a ⊗ v ↦ av`, is bijective. Bijectivity includes surjectivity; injectivity is automatic and does not suffice.

- `IsRigidAnalyticallyTrivial`: bijectivity of the comparison.
- `isRigidAnalyticallyTrivial_iff_finrank`: for finite-dimensional `V`, with exact constants, it holds iff `dim_(F_q(t)) P^B = dim_𝕃 V`.
- `isRigidAnalyticallyTrivial_congr`: an `𝕃`-linear isomorphism intertwining the operators preserves and reflects it.

*Construction.* Apply [§8.8](#dm-8-betti-comparison-dimension) to `f = σ` on `V`, with exact constants `𝕃^σ = F_q(t)` from [§8.12](#dm-8-analytic-fixed-fields). (Pap, §3.3.1, p. 12, Proposition 3.3.8, p. 13.) *Needs:* [§8.8](#dm-8-betti-comparison-dimension); [§4.12](#dm-4-pre-t-motive); [§4.8](#dm-4-inverse-twist-dual-motive); [§4.9](#dm-4-star-adapter); [§8.12](#dm-8-analytic-fixed-fields).

**Checks.**

- The unit `𝟙` is rigid analytically trivial (`1` is a fixed basis vector).
- The zero object is rigid analytically trivial.
- The rank-one pre-t-motive with `σ`-matrix `t` is not rigid analytically trivial: a solution `ψ ∈ 𝕃^×` of `σ(ψ) = tψ` would have the same order at `t = 0` on both sides, since the twist preserves orders at `0`, while multiplication by `t` raises it by one. A nonzero constant matrix `c ∈ C_∞^×`, by contrast, is trivialized by a constant.

<a id="dm-8-fundamental-matrix"></a>

### 8.16 Fundamental matrices (`IsFundamentalMatrix`)

**Definition.** For a field automorphism `σ` of `𝕃` and `Φ ∈ GL_r(K)`, a fundamental matrix is `Ψ ∈ GL_r(𝕃)` with `σ(Ψ) = ΦΨ` (entrywise twist). A rigid analytic trivialization over `𝕋` is a fundamental matrix in `GL_r(𝕋)`; a matrix with merely nonzero determinant in `𝕃` does not meet the integral condition.

- `IsFundamentalMatrix`: invertibility and the equation `σ(Ψ) = ΦΨ`.
- `IsFundamentalMatrix.changeBasis`: replacing the basis `m` by `Bm` sends `Φ` to `σ(B)ΦB^(−1)` and `Ψ` to `BΨ`.
- `IsFundamentalMatrix.mul_const`: `ΨC` is fundamental for `C ∈ GL_r(F_q(t))`.
- `IsFundamentalMatrix.unique`: every solution `X` of `σ(X) = ΦX` (rectangular allowed) is `ΨC` for a unique constant `C` over `F_q(t)`, invertible when `X` is square invertible.

*Construction.* Entrywise equations on matrices over `𝕃`; uniqueness is [§8.9](#dm-8-fixed-basis-coordinates) applied to `Ψ^(−1)X`. (Pap, §4.1.6, p. 22, Proposition 3.3.9, p. 13.) *Needs:* [§2.1](#dm-8-coefficient-twist); [§8.9](#dm-8-fixed-basis-coordinates); Mathlib `Matrix.GeneralLinearGroup`.

**Checks.**

- For `Φ = 1`, `Ψ = 1` is fundamental.
- The empty matrix is fundamental in rank zero.
- For `σ = id` over `ℚ` and `Φ = 2`, no invertible scalar is fundamental.

<a id="dm-8-fundamental-betti-basis"></a>

### 8.17 Fundamental matrices and Betti bases (`isRigidAnalyticallyTrivial_iff_exists_fundamental`)

**Theorem.** Let `P` be a pre-t-motive of dimension `r` with basis column `m` and `σ(m) = Φm`. `P` is rigid analytically trivial if and only if `Φ` has a fundamental matrix in `GL_r(𝕃)`. If `Ψ` is one, the entries of `Ψ^(−1)m` form an `F_q(t)`-basis of `P^B`, and the columns of `Ψ` form an `F_q(t)`-basis of the solutions of `σ(v) = Φv`: two different coordinate conventions.

*Proof sketch.* `σ(Ψ^(−1)m) = Ψ^(−1)Φ^(−1)Φm = Ψ^(−1)m`, so `Ψ^(−1)m` is a fixed basis; conversely a fixed `𝕃`-basis written as `Bm` gives `Ψ = B^(−1)`. Uniqueness of coordinates is [§8.9](#dm-8-fixed-basis-coordinates). (Pap, Proposition 3.3.9(a, b), p. 13, §4.1.6, p. 22.) *Needs:* [§8.16](#dm-8-fundamental-matrix); [§8.15](#dm-8-rigid-triviality); [§8.9](#dm-8-fixed-basis-coordinates); [§4.12](#dm-4-pre-t-motive).

**Checks.**

- For `𝟙` (`Φ = 1`) one may take `Ψ = 1`, and `P^B = F_q(t)·1`.
- For the Carlitz motive (`Φ = t − θ`), `Ψ = Ω` and `P^B = F_q(t)·(1/Ω)`.
- Identifying solution columns with fixed motive vectors without inverting `Ψ` gives the wrong basis.

<a id="dm-8-anderson-uniformizability"></a>

### 8.18 Anderson's uniformizability criterion (`TModule.isUniformizable_iff`)

**Theorem.** Let `E` be an abelian t-module over `C_∞` with motive `M(E)`. Then `E` is uniformizable if and only if `M(E)` is rigid analytically trivial, if and only if the period lattice `ker exp_E` is a free `F_q[t]`-module of rank `rank M(E)`. Dually, for an `A`-finite t-module, `E` is uniformizable if and only if its dual motive is rigid analytically trivial, that is, its `σ`-matrix `Φ ∈ Mat_r(C_∞[t])` has `Ψ ∈ GL_r(𝕋)` with `Ψ^(−1) = ΦΨ`. In particular `carlitzTensor.uniformizable` states that `C^⊗n` is uniformizable for every `n ≥ 1`, by the dual trivialization `Ω^n`.

*Proof sketch.* The `t`-division points of `E(C_∞)` are described through the motive by Anderson's "switcheroo" (Hartl–Juschka, Proposition 5.12): the torsion `E[a](C_∞)` is the dual of the `τ`-invariants of `M/aM`, with values in `Hom_F(A/a, F)`, by the finite-shtuka evaluation pairing ([§1.7](#dm-1-geometric-torsion-basis)). A rigid analytic trivialization identifies the inverse limit of these with a lattice of full rank in `Lie E`, whose exponential image is everything; conversely a full-rank period lattice gives enough `τ`-invariants over `𝕋`. On the dual side, the maps `δ_1` to points ([§4.11](#dm-4-dual-realization)) and `δ_0` to `Lie E` of Hartl–Juschka's Proposition 5.8 connect solutions of the difference equation over the ring of functions on `C_∞` minus the orbit of `θ` with logarithms of points. (BP, Theorem 4.2, p. 16, §4.5, p. 18; HJ, Remark 5.31(b) and Theorem 5.32, pp. 72–73.) *Needs:* [§4.6](#dm-4-uniformizability); [§4.7](#dm-4-carlitz-tensor-power); [§4.11](#dm-4-dual-realization); [§8.17](#dm-8-fundamental-betti-basis); [the analytic-ring supplier contract](#dm-8-tate-analytic-interface).

**Checks.**

- Every Drinfeld module over `C_∞` is uniformizable ([§2.6](#dm-2-uniformization)), and its motive is rigid analytically trivial.
- The Carlitz tensor power `C^⊗n` is uniformizable; its dual motive is trivialized by `Ω^n`.
- For a uniformizable `E`, `E[a](C_∞) ≅ Λ_E/aΛ_E`.

<a id="dm-8-integral-trivialization"></a>

### 8.19 Integral trivializations (`exists_fundamental_tate`)

**Theorem.** Let `P` be rigid analytically trivial with a polynomial `σ`-matrix `Φ ∈ Mat_r(k̄[t])` with `det Φ = c(t − θ)^s`, `c ∈ k̄^×`, `s ≥ 0`. Then `Φ` has a fundamental matrix `Ψ ∈ GL_r(𝕋)`. For the corresponding `A`-finite dual t-motive `H`, its `𝕋`-fixed module is free of rank `r` over `F_q[t]`, with basis `Ψ^(−1)m`, and the integral and rational notions of rigid analytic triviality agree.

*Proof sketch.* Clear the denominators of fixed vectors by `σ`-fixed polynomials to get an integral fixed lattice with rationalization `P^B`. The determinant of a lattice basis is a constant times `Ω^s` times a polynomial over `F_q`; if that polynomial had positive degree, a relation modulo it, its Frobenius limits ([§8.11](#dm-8-twisting-limit)) and a finite-field trace would give a smaller fixed relation, contradicting the basis. So the determinant is a unit of `𝕋`. (Pap, Proposition 3.3.9(c), pp. 13–15, Proposition 3.4.7, p. 19.) *Needs:* [§8.17](#dm-8-fundamental-betti-basis); [§8.11](#dm-8-twisting-limit); [§8.12](#dm-8-analytic-fixed-fields); [the analytic-ring supplier contract](#dm-8-tate-analytic-interface); [§4.8](#dm-4-inverse-twist-dual-motive); [§4.12](#dm-4-pre-t-motive); [§2.10](#dm-2-omega).

**Checks.**

- For the Carlitz motive, `Ψ = Ω ∈ 𝕋^×`.
- For `Φ = 1`, `Ψ = 1`.
- A polynomial `Φ` alone does not give a trivialization: `Φ = t` has no fundamental matrix over `𝕃` ([§8.15](#dm-8-rigid-triviality)).

<a id="dm-8-betti-exact-tensor"></a>

### 8.20 Exactness and tensor compatibility of the Betti realization (`betti_exact_tensor`)

**Theorem.** For a short exact sequence `0 → P → Q → R → 0` of pre-t-motives with `Q` rigid analytically trivial, `P` and `R` are rigid analytically trivial. On rigid analytically trivial objects the Betti realization is exact and faithful, and the canonical maps `P^B ⊗_(F_q(t)) Q^B → (P ⊗_K Q)^B` and `(P^B)^∨ → (P^∨)^B` are isomorphisms.

*Proof sketch.* Fixed vectors are left exact and scalar extension is exact; an isomorphism for `Q` forces the comparisons for the sub and the quotient to be isomorphisms by injectivity and dimension count. A morphism vanishing on a Betti basis vanishes on the scalar extension. Kronecker products of fundamental matrices trivialize tensor products and inverse transposes trivialize duals; the natural maps, not just dimensions, are identified. Papanikolas's proof of Proposition 3.3.14 uses one rank for both factors; the ranks `r` and `s` are independent and the tensor matrix has size `rs`. (Pap, Propositions 3.3.11–3.3.14, pp. 15–16.) *Needs:* [§8.15](#dm-8-rigid-triviality); [§8.17](#dm-8-fundamental-betti-basis); [§8.5](#dm-8-betti-comparison-injective); [§4.12](#dm-4-pre-t-motive).

**Checks.**

- `C ⊗ C^∨ ≅ 𝟙` has Betti realization `F_q(t)`, with fundamental matrix `Ω·(1/Ω) = 1`.
- A subobject of a rigid analytically trivial object is rigid analytically trivial.
- The dual of the Carlitz motive is trivialized by `1/Ω`.

<a id="dm-8-graded-gm"></a>

### 8.21 Graded vector spaces and `G_m` (`gradedVect_tannakaGroup`)

**Theorem.** For any field `k_0` (including positive characteristic, beyond the rational pure-Tate specialization in MotivesAndAlgebraicCycles §6.10), the category of `ℤ`-graded finite-dimensional `k_0`-vector spaces with the forgetful fibre functor is neutral Tannakian, and its group is `G_m`, acting on the degree-`n` part through `x ↦ x^n`.

*Proof sketch.* A tensor automorphism of the forgetful functor on a graded `R`-module is determined on each degree-`n` line by its value on the degree-one object, which is a unit `x ∈ R^×`, and is then `x^n` in degree `n`; reconstruction is MotivesAndAlgebraicCycles §§6.1–6.2. (DeMi, Example 2.30, p. 28.) *Needs:* MotivesAndAlgebraicCycles §§6.1–6.2.

**Checks.**

- The degree-zero part is the trivial representation.
- Over `k_0 = F_q(t)` the group is `G_m` over `F_q(t)`, not over `F_q`.
- The subcategory of even degrees has group `G_m/μ_2`, which is again `G_m` via `x ↦ x²`.

<a id="dm-8-neutral-category"></a>

### 8.22 The neutral Tannakian category of t-motives (`tMotives_neutralTannakian`)

**Theorem.** The strictly full subcategory `ℛ` of rigid analytically trivial pre-t-motives is rigid abelian `F_q(t)`-linear; each `Hom_ℛ(P, Q)` is finite-dimensional over `F_q(t)`; its unit has endomorphisms `F_q(t)`; and `ω(P) = P^B` is an exact faithful `F_q(t)`-linear tensor functor to finite-dimensional vector spaces. So `ℛ` is neutral Tannakian over the imperfect field `F_q(t)`. Let `𝒯 = ⟨S⟩` for the family `S` of rationalized rigid analytically trivial `A`-finite dual t-motives; `𝒯` is the category of t-motives, with the same fibre functor. It is not the category of all effective dual motives, and not every t-module is uniformizable.

*Proof sketch.* Closure and exactness are [§8.20](#dm-8-betti-exact-tensor); `End(𝟙) = F_q(t)` is [§4.12](#dm-4-pre-t-motive). `Hom(P, Q) = (Hom(P, Q))^σ`, the fixed vectors of the internal Hom, is finite-dimensional by [§8.6](#dm-8-fixed-space-finite). Reconstruction over an arbitrary field is MotivesAndAlgebraicCycles §§6.1–6.2, with no characteristic-zero assumption. (Pap, §3.2.2, p. 9, Theorem 3.3.15, pp. 16–17, Definition 3.4.10, p. 19.) *Needs:* [§8.20](#dm-8-betti-exact-tensor); [§8.6](#dm-8-fixed-space-finite); [§8.12](#dm-8-analytic-fixed-fields); [the tensor-generation supplier contract](#dm-8-tensor-generated-subcategory); [§4.12](#dm-4-pre-t-motive); [§4.11](#dm-4-dual-realization); MotivesAndAlgebraicCycles §§6.1–6.2.

**Checks.**

- `𝟙` and the Carlitz motive lie in `𝒯`.
- `End(𝟙) = F_q(t)`, not `K`.
- The rank-one pre-t-motive with `σ`-matrix `t` is not rigid analytically trivial, so it is not in `ℛ`.

<a id="dm-8-admissible-fields"></a>

### 8.23 Admissible difference fields (`IsAdmissibleTower`)

**Definition.** A `σ`-admissible tower is a pair of field extensions `F_0 ⊂ K_1 ⊂ L_1` with `F_0`-algebra automorphisms `σ_K` of `K_1` and `σ_L` of `L_1` compatible with `K_1 → L_1`, whose fixed fields are exactly `F_0` (`K_1^σ = L_1^σ = F_0`), and such that `L_1/K_1` is separable in the general sense (geometrically reduced). No algebraic closedness, finiteness or characteristic hypothesis is included.

- `IsAdmissibleTower.compat`: `σ_L(a) = σ_K(a)` for `a ∈ K_1`.
- `IsAdmissibleTower.constants`: `σ_L(a) = a` iff `a ∈ F_0`, and likewise in `K_1`.
- `IsAdmissibleTower.separable`: `L_1/K_1` is geometrically reduced.

*Construction.* A predicate on the given fields and automorphisms; separability is `Algebra.IsGeometricallyReduced`, not `Algebra.IsSeparable`, which would force algebraicity ([§8.13](#dm-8-mac-lane-separability)). The analytic tower `F_q(t) ⊂ k̄(t) ⊂ 𝕃` is admissible by [§8.14](#dm-8-analytic-separability). (Pap, §4.1.1, p. 21.) *Needs:* Mathlib `Algebra.IsGeometricallyReduced`, `AlgEquiv`, `IsScalarTower`.

**Checks.**

- `ℚ ⊂ ℚ ⊂ ℚ` with identities is admissible.
- `ℝ ⊂ ℝ ⊂ ℂ` with conjugation on `ℂ` is admissible.
- `ℝ ⊂ ℝ ⊂ ℂ` with the identity on `ℂ` is not: the fixed field is too large.

<a id="dm-8-solution-space"></a>

### 8.24 Solution spaces (`solutionSpace`)

**Definition.** For an admissible tower and `Φ ∈ Mat_r(K_1)`, `Sol(Φ) ⊂ L_1^r` is the `F_0`-subspace of vectors with `σ(v) = Φv`. It has `F_0`-dimension at most `r`. If `Φ` is invertible and `Ψ` fundamental, every solution is `Ψc` for a unique `c ∈ F_0^r`; rectangular solution matrices are treated column by column.

- `solutionSpace`: `{v : σ(v) = Φv}` as an `F_0`-submodule.
- `solutionSpace_finrank_le`: finite-dimensional of dimension at most `r`.
- `solutionSpace_coords`: a fundamental `Ψ` gives the linear isomorphism `F_0^r ≅ Sol(Φ)`, `c ↦ Ψc`.

*Construction.* The twist and matrix multiplication are `F_0`-linear, so the equalizer is an `F_0`-subspace. For invertible `Φ`, solutions are the fixed vectors of `Φ^(−1)σ`, and [§8.4](#dm-8-fixed-independence) applies. For singular `Φ`, on the `L_1`-span `W` of the solutions `σ(W) = Φ(W)` and `σ` preserves dimension, so `Φ` is injective on `W` and the same minimal-relation descent works. (Pap, §§4.1.3–4.1.6, pp. 21–22.) *Needs:* [§8.23](#dm-8-admissible-fields); [§8.16](#dm-8-fundamental-matrix); [§8.4](#dm-8-fixed-independence).

**Checks.**

- With `σ = id` and `Φ = 1` over `ℚ`, the solution space is everything.
- With `σ = id` and `Φ = 2` in rank one over `ℚ`, it is zero.
- A repeated nonzero solution column is dependent although each column is a solution.

<a id="dm-8-solution-ring"></a>

### 8.25 The solution ring (`solutionRing`)

**Definition.** For an admissible tower, `Φ ∈ GL_r(K_1)` and a fundamental `Ψ ∈ GL_r(L_1)`, let `𝒮 = K_1[Ψ_(ij), det(Ψ)^(−1)] ⊂ L_1` be the `K_1`-subalgebra generated by the entries and the inverse determinant, `Λ = K_1(Ψ_(ij))` the subfield, and `Z = Spec 𝒮`, a closed `K_1`-subscheme of `GL_r`. Evaluation `K_1[X_(ij), det(X)^(−1)] → L_1` has image `𝒮`, and `Λ = Frac(𝒮)`.

- `solutionRing`: `Algebra.adjoin` of the entries and `det(Ψ)^(−1)`.
- `solutionRing_le`: `𝒮 ≤ B` for a subalgebra `B` exactly when `B` contains the entries and `det(Ψ)^(−1)`.
- `solutionField_eq_fractionRing`: `Λ` is the fraction field of `𝒮`.
- `solutionRing_twist`: `σ` restricts to a semilinear ring automorphism of `𝒮`.

*Construction.* Mathlib `Algebra.adjoin`, `Matrix.det`, `AlgebraicGeometry.Spec`, with the closed immersion from the surjective coordinate map. `σ(Ψ) = ΦΨ` makes `𝒮` stable under `σ` and `σ^(−1)`. (Pap, §4.2.1, p. 22.) *Needs:* [§8.16](#dm-8-fundamental-matrix); [§8.23](#dm-8-admissible-fields); Mathlib `Algebra.adjoin`, `IntermediateField.adjoin`, `AlgebraicGeometry.IsClosedImmersion.spec_of_surjective`.

**Checks.**

- For `Ψ = 1` in rank one, `𝒮 = Λ = K_1`.
- For the empty matrix, `𝒮 = K_1` (empty determinant one).
- For a transcendental scalar `z`, `𝒮 = K_1[z, z^(−1)]`; omitting `det^(−1)` gives the wrong ring.

<a id="dm-8-comparison-algebra"></a>

### 8.26 The comparison algebra (`comparisonAlgebra`)

**Definition.** In `L_1 ⊗_(K_1) L_1` put `Ψ_1 = (Ψ_(ij) ⊗ 1)`, `Ψ_2 = (1 ⊗ Ψ_(ij))` and `D = Ψ_1^(−1)Ψ_2`. Let `Δ = F_0[D_(ij), det(D)^(−1)] ⊂ L_1 ⊗_(K_1) L_1` and `Γ = Spec Δ`. The diagonal twist fixes `D`. `L_1 ⊗ L_1` need not be a domain; `Γ` is a closed subscheme of `GL_(r, F_0)` whose group structure is a theorem ([§8.30](#dm-8-difference-torsor)).

- `comparisonMatrix`: `D = Ψ_1^(−1)Ψ_2`, in that order.
- `comparisonAlgebra_le`: `Δ` is the least `F_0`-subalgebra containing the entries of `D` and `det(D)^(−1)`.
- `comparisonMatrix_fixed`: the diagonal twist fixes `D`.
- `comparisonMatrix_cocycle`: in the triple tensor product, `D_12D_23 = D_13`.

*Construction.* Map matrix entries along the two inclusions, invert and multiply; `σ(Ψ) = ΦΨ` cancels `Φ` in `σ(D)`. (Pap, §§4.2.1–4.2.2, p. 22.) *Needs:* [§8.25](#dm-8-solution-ring); Mathlib `Algebra.TensorProduct.includeLeft`, `Algebra.TensorProduct.includeRight`, `Algebra.adjoin`.

**Checks.**

- For `Ψ = 1`, `D = 1` and `Δ = F_0`.
- For the empty matrix, `Δ = F_0`.
- For a scalar `z`, `D = z^(−1) ⊗ z`; the order distinguishes the right action from the reversed convention.

<a id="dm-8-invariant-ideal-descent"></a>

### 8.27 Invariant ideals descend (`invariantIdeal_descent`)

**Theorem.** In `L_1[X_(ij), det(X)^(−1)]` let `σ_0` act on coefficients and fix the variables. Extension and contraction are mutually inverse bijections between ideals of `F_0[X_(ij), det(X)^(−1)]` and `σ_0`-stable ideals of `L_1[X_(ij), det(X)^(−1)]`.

*Proof sketch.* Write an element in an `F_0`-basis of monomials with finite support and normalize one coefficient to one; subtracting the twist shortens the support; exact constants finish the induction. (Pap, Lemma 4.2.3, p. 23.) *Needs:* [§8.23](#dm-8-admissible-fields); Mathlib `Ideal.map`, `Ideal.comap`.

**Checks.**

- The zero ideal and the unit ideal correspond to themselves.
- For `σ_0 = id` (no exact constants unless `L_1 = F_0`) the statement fails: every ideal is stable.
- `(X − 1)` over `F_0` extends to the `σ_0`-stable ideal `(X − 1)` over `L_1`.

<a id="dm-8-solution-ring-simple"></a>

### 8.28 The solution ring is difference-simple (`solutionRing_simple`)

**Theorem.** `𝒮` has no proper nonzero ideal stable under `σ`; equivalently, the kernel of evaluation is maximal among proper ideals stable under `σ_1`, where `σ_1` twists coefficients and sends `X` to `ΦX`. Stability under inclusion suffices because the coordinate ring is Noetherian.

*Proof sketch.* Translate by `Ψ` to turn `σ_1` into `σ_0`. Extend a putative invariant ideal to a maximal ideal over the constants, which gives a finite extension `E/F_0` and a second fundamental matrix whose ratio to `Ψ` lies in `GL_r(E)`; Noetherian stabilization and faithful flatness of field extensions force equality. Only the `L_1`-coefficient case of [§8.27](#dm-8-invariant-ideal-descent) is used here. (Pap, Corollary 4.2.5, p. 24.) *Needs:* [§8.25](#dm-8-solution-ring); [§8.27](#dm-8-invariant-ideal-descent); SchemeAndStackFoundations §1.1.

**Checks.**

- For `Ψ = 1`, `𝒮 = K_1` is a field and trivially simple.
- For `𝒮 = K_1[z, z^(−1)]` with `σ(z) = cz`, the ideal `(z − 1)` is not stable unless `c = 1`.
- A domain is not required of `𝒮 ⊗ 𝒮`, only of `𝒮`.

<a id="dm-8-solution-invariant-ideal-descent"></a>

### 8.29 Ideal descent over the solution ring (`solutionRing_invariantIdeal_descent`)

**Theorem.** Every `σ`-stable ideal of `𝒮[X_(ij), det(X)^(−1)]` (twist on coefficients) is generated by its intersection with `F_0[X_(ij), det(X)^(−1)]`, and extension and contraction are mutually inverse on such ideals. This is asserted for the difference-simple `𝒮`, not for an arbitrary difference algebra.

*Proof sketch.* Take an element of minimal support modulo the contracted ideal; its leading-coefficient ideal is `σ`-stable and nonzero, hence everything by [§8.28](#dm-8-solution-ring-simple), so the leading coefficient can be taken to be one; subtract the twist and use exact constants. (Pap, Lemma 4.2.7, p. 25.) *Needs:* [§8.28](#dm-8-solution-ring-simple); [§8.27](#dm-8-invariant-ideal-descent).

**Checks.**

- For `𝒮 = K_1` this is [§8.27](#dm-8-invariant-ideal-descent) with `L_1 = K_1`.
- The unit ideal is generated by `1 ∈ F_0[X]`.
- Over a non-simple difference ring the leading-coefficient step fails.

<a id="dm-8-difference-torsor"></a>

### 8.30 The difference Galois group and its torsor (`differenceGaloisGroup`)

**Theorem.** For every admissible tower and fundamental `Ψ`, `Δ` carries the Hopf structure of `GL_r`: comultiplication `D_(ij) ↦ Σ_k D_(ik) ⊗ D_(kj)`, counit `D_(ij) ↦ δ_(ij)` and antipode `D ↦ D^(−1)`. So `Γ = Spec Δ` is a closed `F_0`-subgroup scheme of `GL_r`. `Z = Spec 𝒮` is a right `Γ_(K_1)`-torsor: `(u, v) ↦ (u, u^(−1)v)` gives `Z ×_(K_1) Z ≅ Z ×_(K_1) Γ_(K_1)`, equivalently `𝒮 ⊗_(K_1) 𝒮 ≅ 𝒮 ⊗_(F_0) Δ`; and `Z_(L_1) ≅ Γ_(L_1)` by `u ↦ Ψ^(−1)u`. These are isomorphisms of schemes and coordinate rings, not only bijections of points.

*Proof sketch.* Conjugate defining ideals by `X ↦ Ψ^(−1)X` and descend by [§8.27](#dm-8-invariant-ideal-descent) and [§8.29](#dm-8-solution-invariant-ideal-descent). The cocycle of [§8.26](#dm-8-comparison-algebra) gives the multiplication, the identity and the swap give counit and antipode, descended by faithful flatness; the torsor statement is affine descent (SchemeAndStackFoundations §§1.1, 1.13, 1.15). (Pap, Propositions 4.2.4 and 4.2.8, pp. 23–25, Theorem 4.2.11, p. 26.) *Needs:* [§8.26](#dm-8-comparison-algebra); [§8.27](#dm-8-invariant-ideal-descent); [§8.29](#dm-8-solution-invariant-ideal-descent); [§8.28](#dm-8-solution-ring-simple); SchemeAndStackFoundations §§1.1, 1.13, 1.15; Mathlib `CommHopfAlgCat`.

**Checks.**

- For `Ψ = 1`, `Γ` is trivial and `Z = Spec K_1`.
- For the Carlitz equation `σ(Ω) = (t − θ)Ω` over the analytic tower, `Γ = G_m` ([§8.46](#dm-8-carlitz-group)).
- The torsor isomorphism is an isomorphism of coordinate rings, which is stronger than a bijection on `L_1`-points.

<a id="dm-8-relative-algebraic-closure"></a>

### 8.31 `k̄(t)` is relatively closed in the solution field (`algebraicClosure_solutionField`)

**Theorem.** For the analytic tower `F_q(t) ⊂ k̄(t) ⊂ 𝕃`, every element of `Λ = k̄(t)(Ψ_(ij))` algebraic over `k̄(t)` lies in `k̄(t)`. (This is relative algebraic closedness, not algebraic closedness of `k̄(t)`.)

*Proof sketch.* Adjoin all twists of a relatively algebraic element; the field `H` they generate is finite and separable over `k̄(t)` because `Λ` is finitely generated and [§8.14](#dm-8-analytic-separability) holds. `H` is the function field of a smooth projective curve over the perfect field `k̄` (AlgebraicCurves Layer 12), and the twist acts on it through base change along the automorphism of `k̄`. A `σ`-stable effective divisor above infinity of large degree has a finite-dimensional, `σ`-stable space of sections containing generators of `H` (SchemeAndStackFoundations §3.2, AlgebraicCurves §12E). The semilinear Lang lemma ([§1.3](#dm-1-semilinear-lang), inverse-twist form over `k̄`) gives a `σ`-fixed basis, whose elements lie in `𝕃^σ = F_q(t)` ([§8.12](#dm-8-analytic-fixed-fields)); so `H = k̄(t)`. (Pap, Proposition 4.3.3, pp. 26–27.) *Needs:* [§8.25](#dm-8-solution-ring); [§8.14](#dm-8-analytic-separability); [§8.12](#dm-8-analytic-fixed-fields); [§1.3](#dm-1-semilinear-lang); AlgebraicCurves Layer 12; SchemeAndStackFoundations §3.2; JacobianChallenge Layer B.

**Checks.**

- For `Ψ = Ω` (Carlitz), `Λ = k̄(t)(Ω)` is purely transcendental of degree one, and the statement holds trivially.
- `t^(1/p) ∉ Λ`, consistent with separability.
- A finite separable extension of `k̄(t)` stable under `σ` and contained in `𝕃` is `k̄(t)` itself.

<a id="dm-8-difference-smooth-dimension"></a>

### 8.32 Smoothness and dimension of the difference group (`differenceGaloisGroup_dim`)

**Theorem.** If `K_1` is relatively algebraically closed in `Λ` for an admissible tower, then `Γ` is geometrically integral and smooth over `F_0`, `Z` is geometrically integral and smooth over `K_1`, and `dim_(F_0) Γ = trdeg_(K_1) Λ`. For the analytic tower the hypothesis is [§8.31](#dm-8-relative-algebraic-closure). Smoothness uses the group structure: geometric reducedness alone is not a smoothness criterion for arbitrary schemes.

*Proof sketch.* Separability and relative algebraic closure make `𝒮` geometrically integral; transfer geometric reducedness and irreducibility across the torsor after an algebraically closed extension. Tau Ceti's criterion that a geometrically reduced commutative Hopf algebra of finite type is smooth gives smoothness of `Γ`, and `Z` is smooth by the torsor trivialization and descent. Dimension of finite-type schemes is the transcendence degree of the function field, invariant under field extension (SchemeAndStackFoundations §0.7). (Pap, Theorem 4.3.1, p. 26, Corollary 4.3.4, p. 27.) *Needs:* [§8.30](#dm-8-difference-torsor); [§8.31](#dm-8-relative-algebraic-closure); Tau Ceti `TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced`; SchemeAndStackFoundations §§0.7, 1.15.

**Checks.**

- For `Ψ = 1`, `Γ` is trivial and `trdeg = 0`.
- For the Carlitz motive, `dim Γ = 1 = trdeg_(k̄(t)) k̄(t)(Ω)`.
- Over an imperfect `F_0` a geometrically reduced non-group scheme need not be smooth; the group structure is used.

<a id="dm-8-difference-invariants"></a>

### 8.33 The difference Galois action and its invariants (`differenceGalois_fixedField`)

**Theorem.** Right multiplication gives `Γ(F_0) ≅ Aut_σ(𝒮/K_1) ≅ Aut_σ(Λ/K_1)`. For geometric invariants, extend `σ` to an algebraic closure of `L_1`, let `F_n` be the `σ^n`-fixed field, and assume `(F_n, K̄_1, L̄_1)` is `σ^n`-admissible for every `n` and `F̄_0 = ∪F_n`. On the corresponding geometrically integral solution field `Λ̃`, the elements fixed by `Γ(F̄_0)` are exactly `K̄_1`, and `Λ ∩ Λ̃^(Γ(F̄_0)) = K_1`. The analytic tower has these properties. Zariski density of `Γ(F_0)` over the imperfect `F_0` is not assumed.

*Proof sketch.* A `σ`-commuting automorphism sends `Ψ` to `Ψγ` with `γ` constant by exact constants, and preserving `𝒮` puts `γ` in `Γ(F_0)`. For an invariant rational function, after extending to an algebraically closed field the closed points of the finite-type scheme are rational and dense (Mathlib `isJacobsonRing_of_finiteType`); reducedness and the torsor identity equate its two pullbacks, so it is constant. Relative algebraic closure descends the intersection to `K_1`. (Pap, §§4.4.1–4.4.5, pp. 27–28, Theorem 4.4.6, p. 28.) *Needs:* [§8.30](#dm-8-difference-torsor); [§8.32](#dm-8-difference-smooth-dimension); [§8.12](#dm-8-analytic-fixed-fields); SchemeAndStackFoundations §1.1; Mathlib `isJacobsonRing_of_finiteType`.

**Checks.**

- For `Ψ = 1` both automorphism groups are trivial.
- For the Carlitz motive, `γ ∈ G_m(F_q(t)) = F_q(t)^×` acts by `Ω ↦ γΩ`.
- The invariants are computed after passing to `F̄_0`; the rational points `Γ(F_0)` alone need not be dense.

<a id="dm-8-tannakian-identification"></a>

### 8.34 The difference group is the motivic Galois group (`differenceGaloisGroup_eq_motivic`)

**Theorem.** For a t-motive `M ∈ 𝒯` with matrix `Φ` and fundamental `Ψ`, the difference Galois group `Γ_Ψ` is isomorphic over `F_q(t)` to the motivic Galois group `Γ_M = Aut^⊗(ω|_⟨M⟩)`. Every `N ∈ ⟨M⟩` has a fundamental matrix with entries in `𝒮`, so `𝒮_R ⊗_(F_q(t)) N^B → 𝒮_R ⊗_K N` is bijective for every `F_q(t)`-algebra `R`. The functor `⟨M⟩ → Rep_(F_q(t))(Γ_Ψ)` is fully faithful, realizes every stable Betti subspace as a submotive, and every representation of `Γ_Ψ` is a subquotient of an object in its image; the induced homomorphism is faithfully flat and a closed immersion, hence an isomorphism.

*Proof sketch.* `Γ_Ψ` acts on `𝒮` by `Ψ ↦ Ψγ` and on the Betti basis `Ψ^(−1)m`, functorially in `F_q(t)`-algebras. For fullness reduce `Hom(P, N)` to `Hom(𝟙, Hom(P, N))`; invariant coefficient functions descend by [§8.33](#dm-8-difference-invariants). A stable Betti subspace has defining equations whose coefficients are invariant, hence in `K`, and the block matrix gives a rigid analytically trivial submotive. Since `M^B` is a faithful representation of `Γ_Ψ ⊂ GL(M^B)`, every representation is a subquotient of a mixed tensor power of `M^B` (DeMi, Proposition 2.20(b)); the criteria of MotivesAndAlgebraicCycles §6.3 then give faithful flatness and closed immersion. Papanikolas's kernel matrix in the proof of Lemma 4.5.7 is the vertical block `(−C; I_(s−m))`. (Pap, Lemma 4.5.2 and Theorem 4.5.3, pp. 28–29, Propositions 4.5.6–4.5.9, pp. 30–31, Theorem 4.5.10, p. 32.) *Needs:* [§8.22](#dm-8-neutral-category); [§8.30](#dm-8-difference-torsor); [§8.33](#dm-8-difference-invariants); [the tensor-generation supplier contract](#dm-8-tensor-generated-subcategory); [§4.12](#dm-4-pre-t-motive); MotivesAndAlgebraicCycles §§6.1–6.3.

**Checks.**

- For `M = 𝟙`, both groups are trivial.
- For the Carlitz motive both groups are `G_m` ([§8.46](#dm-8-carlitz-group)).
- The identification holds as group schemes, tested on all `F_q(t)`-algebras, not only on points.

<a id="dm-8-entire-from-equation"></a>

### 8.35 Restricted solutions are entire (`isArithmeticEntire_of_twist_eq`)

**Theorem.** If `Φ ∈ Mat_r(k̄[t])` with `det Φ(0) ≠ 0` and `ψ ∈ 𝕋^r` satisfies `σ(ψ) = Φψ`, then every component of `ψ` lies in `𝔼`: its coefficients are algebraic over `k`, generate a finite extension of `k_∞`, and decay at every radius. When `det Φ = c(t − θ)^s` the condition `det Φ(0) ≠ 0` holds because `θ ≠ 0`.

*Proof sketch.* By the semilinear Lang lemma ([§1.3](#dm-1-semilinear-lang), inverse twist over `k̄`) normalize `Φ(0)` to the identity. The coefficient recursion then makes every coefficient algebraic over `k`; on the small tail solve inverse-Frobenius differences by convergent sums of positive twists, the fixed difference vanishing because it is strictly small, which bounds the coefficient field over `k_∞`; the same recursion with weights `C^n` for every `C > 1` gives infinite radius. (ABP, Proposition 3.1.3, pp. 9–10; Pap, Proposition 5.1.3, p. 32.) *Needs:* [§8.10](#dm-8-entire-series); [§2.1](#dm-8-coefficient-twist); [the analytic-ring supplier contract](#dm-8-tate-analytic-interface); [§1.3](#dm-1-semilinear-lang).

**Checks.**

- For the Carlitz equation `ψ^(−1) = (t − θ)ψ`, `ψ = Ω` is entire.
- For `Φ = 1`, the solutions in `𝕋` are the constants `F_q[t]`, which are entire.
- With `Φ = t` (so `Φ(0) = 0`) the hypothesis fails and there is no nonzero solution in `𝕋`.

<a id="dm-8-schwarz-jensen"></a>

### 8.36 Zero counts and growth of entire functions (`entire_norm_le_of_zeros`)

**Theorem.** Let `f` be a nonzero entire series over a complete algebraically closed nonarchimedean field and `0 < r_1 < r_2`. If `f` has at least `N` zeros (with multiplicity) in the closed disc `|z| ≤ r_1`, then `‖f‖_(r_1) ≤ (r_1/r_2)^N ‖f‖_(r_2)` for the Gauss norms. This is the quantitative comparison between two radii; finiteness of the zeros of a nonzero entire function in a bounded disc is supplied by NewtonPolygons §5.3.

*Proof sketch.* The number of zeros in `|z| ≤ r_1` is the largest dominant index `u_(r_1)(f)` of the Newton polygon (NewtonPolygons §4.3), and the Gauss norm is the supporting value at the dominant index (NewtonPolygons §2.2): `‖f‖_(r_2) ≥ |a_u|r_2^u = ‖f‖_(r_1)(r_2/r_1)^u` for `u = u_(r_1)(f) ≥ N`. (ABP, §3.4, pp. 13–16, where this estimate enters the auxiliary-function argument.) *Needs:* NewtonPolygons §§2.2, 4.3; RestrictedPowerSeries §7.2.

**Checks.**

- For `f = z^N`, equality `r_1^N = (r_1/r_2)^N r_2^N` holds.
- For `f = 1` (no zeros) the bound with `N = 0` is `1 ≤ 1`.
- `Ω` has the zeros `θ^(q^i)` and the bound applies on discs containing finitely many of them.

<a id="dm-8-abp-estimates"></a>

### 8.37 Arithmetic estimates for the ABP criterion (`abp_size_estimates`)

**Theorem.** Let `k ⊂ K_2 ⊂ k̄` with `K_2/k` finite separable of degree `d`, let `K_3` be the perfect closure of `K_2` in `k̄` and `𝒪` the integral closure of `A = F_q[θ]` in `K_3`; let `size(x)` be the maximum of the absolute values of the `k`-conjugates of `x`, extended to matrices and polynomials by maxima of coefficients. Then: a nonzero `x ∈ 𝒪` has `|x| ≥ size(x)^(1−d)`; a nonzero root `λ` of multiplicity `ν` of a nonzero `f = Σ a_iz^i ∈ 𝒪[z]` has `|λ|^ν ≥ (max_i size(a_i))^(−d)`; and for `C > 1` and `0 < r < s`, a matrix `M ∈ Mat_(r×s)(𝒪)` or `Mat_(r×s)(𝒪[t])` with `size(M) < C` has a nonzero kernel vector over the same ring with `size(x) < C^(r/(s−r))`, with no fixed degree bound in the polynomial case.

*Proof sketch.* The product of the conjugates of a nonzero integral element is a nonzero element of `A`, of absolute value at least one; extraction of `p`-th roots transports this to the perfect closure. Translate a polynomial by its root and use the first nonzero term. For the kernel vector, Riemann–Roch on the curve of `K_2` (AlgebraicCurves Layers 3 and 5) counts the integral elements of bounded size, and pigeonhole gives the small vector; for polynomial matrices pass to coefficient bases of bounded degree and increase the degree until the ratio of rows to columns approaches `r/s`. (ABP, §§3.2–3.3, pp. 10–13, Lemmas 3.3.3–3.3.6.) *Needs:* AlgebraicCurves Layers 3 and 5; JacobianChallenge Layer B.

**Checks.**

- For `x ∈ A ∖ {0}` (`d = 1`), `|x| ≥ 1 = size(x)^0`.
- For `x = θ^(−1)` (not integral) the first bound fails: integrality is needed.
- For `r ≥ s` there need be no nonzero kernel vector, so `r < s` is needed.

<a id="dm-8-abp-lifting"></a>

### 8.38 The Anderson–Brownawell–Papanikolas criterion (`abp_lifting`)

**Theorem.** Let `Φ ∈ Mat_r(k̄[t])` with `det Φ = c(t − θ)^s`, `c ∈ k̄^×`, `s ≥ 0`, and let `ψ ∈ 𝔼^r` satisfy `σ(ψ) = Φψ`. For every row `w ∈ k̄^r` with `w·ψ(θ) = 0` there is a polynomial row `P ∈ k̄[t]^r` with `P·ψ = 0` as entire functions and `P(θ) = w`. The coefficients of `P` need not be constant or lie in `F_q[t]`.

*Proof sketch.* In rank one, a zero at `θ` propagates along the inverse-Frobenius orbit `θ^(q^(−i))`, infinitely many distinct points of bounded absolute value, so the function vanishes by [§8.36](#dm-8-schwarz-jensen). In general, clear denominators and use [§8.37](#dm-8-abp-estimates) to build polynomial rows of bounded size with a long run of prescribed zeros along the orbit; the auxiliary function satisfies a scalar difference equation of bounded size. If it never vanished identically, its leading coefficient would be bounded below by the Liouville estimate and above, exponentially decreasingly, by [§8.36](#dm-8-schwarz-jensen). A vanishing auxiliary row, twisted through adjugate matrices, has nonzero value at `θ` on the line of `w`; rescale. (ABP, Theorem 3.1.1, pp. 7–8, proof §3.4, pp. 13–16; Pap, Theorem 5.1.1, p. 32.) *Needs:* [§8.10](#dm-8-entire-series); [§8.37](#dm-8-abp-estimates); [§8.36](#dm-8-schwarz-jensen); [§2.1](#dm-8-coefficient-twist).

**Checks.**

- For `r = 1`, `Φ = t − θ`, `ψ = Ω`: `Ω(θ) ≠ 0`, so only `w = 0` occurs and `P = 0` works.
- For `Φ = I_2` and `ψ = (1, t)`, the relation `w = (θ, −1)` at `θ` lifts to `P = (t, −1)`, which is not constant.
- Without the determinant condition the criterion fails in general; the hypothesis `det Φ = c(t − θ)^s` is used for the orbit argument.

<a id="dm-8-specialization-rank"></a>

### 8.39 Specialization preserves relation rank (`rank_relations_eq`)

**Theorem.** Under the hypotheses of [§8.38](#dm-8-abp-lifting), the `k̄[t]`-rank of the module generated by the entries of `ψ` equals the `k̄`-dimension of the span of the entries of `ψ(θ)`; equivalently, the `k̄`-linear relations at `θ` and the `k̄(t)`-linear relations among the entries of `ψ` have the same dimension, and evaluation of polynomial relations at `θ` is onto the relations at `θ`.

*Proof sketch.* The module of polynomial relations is saturated in `k̄[t]^r`, since the quotient embeds in the domain `𝔼`; so it is a direct summand over the principal ideal domain `k̄[t]`, and a basis specializes to independent rows. [§8.38](#dm-8-abp-lifting) supplies all relations at `θ`. (Pap, Proposition 5.1.5, pp. 32–33.) *Needs:* [§8.38](#dm-8-abp-lifting); [§4.8](#dm-4-inverse-twist-dual-motive); Mathlib `Module.finrank`, `Submodule.span`.

**Checks.**

- For `ψ = (Ω)` both ranks are one.
- For `ψ = (Ω, Ω)` both sides have a one-dimensional relation space, spanned by `(1, −1)`.
- The statement is for systems satisfying the ABP hypotheses, not for arbitrary vectors of entire functions.

<a id="dm-8-degree-span"></a>

### 8.40 Bounded monomial spans (`degreeSpan`)

**Definition.** For a family `x : I → B` in an `F_0`-algebra and `d ≥ 0`, `D_d(x)` is the `F_0`-span of the monomials `∏_i x_i^(e_i)` with `Σ_i e_i ≤ d`, including the monomial `1`. It is the image of the polynomials of total degree at most `d` under evaluation, finite-dimensional for finite `I`, and `D_d ⊂ D_(d+1)`. For the entries of `Ψ`, the column formed by `1` and the columns of `Ψ^(⊗n)`, `1 ≤ n ≤ d`, spans `D_d` over `K`, and its value at `θ` spans `D_d(Ψ(θ))` over `k̄`; it satisfies the block system `[1] ⊕ Φ^(⊕r) ⊕ (Φ^(⊗2))^(⊕r²) ⊕ ⋯ ⊕ (Φ^(⊗d))^(⊕r^d)` of size `1 + Σ_(n=1)^d r^(2n)`.

- `degreeSpan`: `D_d(x)`.
- `degreeSpan_zero`: `D_0(x) = F_0·1`.
- `degreeSpan_mono`: `d ≤ e` implies `D_d(x) ≤ D_e(x)`.
- `degreeSpan_eq_map`: `D_d` is the image of the degree-at-most-`d` polynomials.
- `degreeSpan_finiteDimensional`: finite-dimensional for finite `I`.

*Construction.* Mathlib `Submodule.span` of the monomials, compared with `MvPolynomial.aeval`. The block size `1 + Σ r^(2n)` is valid also for `r = 1` and `r = 0`; Papanikolas writes it as `(r^(2d+2) − 1)/(r² − 1)`, which is undefined at `r = 1`. (Pap, proof of Theorem 5.2.2, p. 33.) *Needs:* [§8.16](#dm-8-fundamental-matrix); Mathlib `Submodule.span`, `MvPolynomial.aeval`.

**Checks.**

- `D_0` contains `1` even for the empty family.
- For `x = (0)`, every `D_d` is `F_0·1`.
- For a transcendental `x`, `1, x, x²` give `dim D_2 = 3`.

<a id="dm-8-generator-growth"></a>

### 8.41 Growth of bounded monomial spans (`finrank_degreeSpan_eventually_poly`)

**Theorem.** Let `B = k_0[x_1, …, x_n]` be a finitely generated domain over a field `k_0`. The function `d ↦ dim_(k_0) D_d(x)` agrees for large `d` with a polynomial of degree `trdeg_(k_0) Frac(B)` with positive leading coefficient (the constant `1` when `B = k_0`). Hence if `B = k_0[x]` and `B' = k_0'[x']` are finitely generated domains over possibly different fields with `dim D_d(x) = dim D_d(x')` for all `d`, then `trdeg_(k_0) Frac(B) = trdeg_(k_0') Frac(B')`.

For a standard graded finite-type `k_0`-algebra `S` with `S_0 = k_0`, first prove `standardGraded_hilbertPolynomial`: the function `d ↦ dim_(k_0) S_d` is eventually a polynomial in `ℚ[d]`; and `standardGraded_hilbertPolynomial_degree`: its degree is `dim S − 1`, with degree `−1` for the zero polynomial. These general graded statements are part of this target, including for non-domain `S` (Stacks, Proposition 10.58.7 and Lemma 10.117.1, Tags 00JV and 00P6).

*Proof sketch.* For eventual polynomiality, induct on degree-one generators, split off the submodule killed by a power of the last generator, and use the exact sequence for multiplication by that generator on the quotient. Finite differences integrate in the binomial-polynomial basis. For the degree formula, extend the field to an infinite one without changing graded dimensions and choose a linear homogeneous Noether normalization: comparison with a finite module over the parameter polynomial ring bounds cumulative dimensions above and below by positive multiples of `d^(dim S)`. The eventual polynomial therefore has degree `dim S − 1`. Apply these results to `B^h = ⊕_d D_d(x)u^d ⊂ B[u]`, generated in degree one with `(B^h)_d ≅ D_d(x)` and `Frac(B^h) = Frac(B)(u)`. Finite-type dimension equals transcendence degree (SchemeAndStackFoundations §0.7), giving the asserted degree and positivity. Mathlib's `Polynomial.hilbertPoly` supplies the coefficient formula once a rational Hilbert series is known; it does not supply Hilbert–Serre or the dimension comparison. Its polynomial coefficient field is `ℚ`, irrespective of `char k_0`. (Pap, proof of Theorem 5.2.2, p. 33; Stacks, Tags 00JV and 00P6.) *Needs:* [§8.40](#dm-8-degree-span); SchemeAndStackFoundations §0.7 (finite-type dimension); Mathlib graded algebras, `Polynomial.hilbertPoly`, `Algebra.trdeg`.

**Checks.**

- `B = k_0[x]` with `x` transcendental: `dim D_d = d + 1`, degree one.
- `B = k_0[x, y]` free: `dim D_d = (d + 1)(d + 2)/2`, degree two.
- `B = k_0[x]/(x²)` is not a domain: `dim D_d = 2` for `d ≥ 1`, degree zero, though `B ≠ k_0`.

<a id="dm-8-period-transcendence"></a>

### 8.42 Papanikolas's period theorem (`trdeg_periods_eq_dim`)

**Theorem.** Let `M ∈ 𝒯` have `σ`-matrix `Φ ∈ Mat_r(k̄[t]) ∩ GL_r(k̄(t))` with `det Φ = c(t − θ)^s`, `c ≠ 0`, `s ≥ 0`, and let `Ψ ∈ GL_r(𝕋)` have entries in `𝔼` with `σ(Ψ) = ΦΨ`. Then `trdeg_(k̄) k̄(Ψ_(ij)(θ)) = dim Γ_M = trdeg_(k̄(t)) k̄(t)(Ψ_(ij))`. Rigid analytic triviality and the determinant condition provide such a `Ψ` ([§8.19](#dm-8-integral-trivialization), [§8.35](#dm-8-entire-from-equation)); the theorem does not apply to a pre-t-motive without one.

*Proof sketch.* Form the bounded tensor-monomial system of [§8.40](#dm-8-degree-span); its determinant is again a constant times a power of `t − θ` and its entries are entire. [§8.39](#dm-8-specialization-rank) gives `dim_K D_d(Ψ) = dim_(k̄) D_d(Ψ(θ))` for every `d`, so the transcendence degrees agree by [§8.41](#dm-8-generator-growth). [§8.32](#dm-8-difference-smooth-dimension) and [§8.34](#dm-8-tannakian-identification) identify the function-field transcendence degree with `dim Γ_M`. (Pap, Theorem 5.2.2, p. 33.) *Needs:* [§8.40](#dm-8-degree-span); [§8.41](#dm-8-generator-growth); [§8.39](#dm-8-specialization-rank); [§8.35](#dm-8-entire-from-equation); [§8.19](#dm-8-integral-trivialization); [§8.34](#dm-8-tannakian-identification); [§8.32](#dm-8-difference-smooth-dimension).

**Checks.**

- For the Carlitz motive: `trdeg k̄(Ω(θ)) = 1 = dim G_m`, so `π̃` is transcendental.
- For `M = 𝟙`: both sides are zero.
- Equality of dimensions alone does not identify which entries are algebraically independent; [§8.50](#dm-8-carlitz-logarithm-independence) adds the linear analysis.

<a id="dm-8-carlitz-deformation"></a>

### 8.43 Deformations of Carlitz logarithms (`carlitzLogDeformation`)

**Definition.** For `α ∈ k̄` with `|α| < q^(q/(q−1))`, put `L_α(t) = Σ_(i≥0) α^(q^i) / ∏_(j=1)^i (t − θ^(q^j))` (empty product one). It is a restricted series, converges for `|t| < q^q`, satisfies `σ(L_α) = σ(α) + L_α/(t − θ)`, and `L_α(θ) = log_C(α)`. `L_α` need not be entire; `Ω·L_α` is entire.

- `carlitzLogDeformation_zero`: `L_0 = 0`.
- `carlitzLogDeformation_add`: `L_(α+β) = L_α + L_β` in the small disc; it is `F_q`-linear there.
- `carlitzLogDeformation_twist`: `σ(L_α) = σ(α) + L_α/(t − θ)`.
- `carlitzLogDeformation_eval`: `L_α(θ) = log_C(α)`.

*Construction.* Each factor `t − θ^(q^j)` has nonzero constant term and is inverted in `C_∞[[t]]`; the norm bound gives convergence. Shifting the summation index after the inverse twist proves the functional equation, and evaluation at `θ` gives the series `log_C(α)` of [§2.8](#dm-2-carlitz-exponential) because `∏_(j=1)^i (θ − θ^(q^j)) = ℓ_i`. (Pap, §6.1.1, p. 34.) *Needs:* [§8.10](#dm-8-entire-series); [§2.1](#dm-8-coefficient-twist); [§2.8](#dm-2-carlitz-exponential).

**Checks.**

- `L_0 = 0`.
- `L_(−β) = −L_β`.
- For nonzero `α` the constant coefficient of `L_α` is nonzero.

<a id="dm-8-logarithm-matrices"></a>

### 8.44 The logarithm extension (`logPhi`, `logPsi`)

**Definition.** For small algebraic `α_1, …, α_r`, on the index set `{0} ⊔ Fin r` let `Φ` have `Φ_00 = t − θ`, `Φ_(i0) = σ(α_i)(t − θ)` and `Φ_(ii) = 1` for `i > 0`, zero elsewhere; let `Ψ` have `Ψ_00 = Ω`, `Ψ_(i0) = ΩL_(α_i)` and `Ψ_(ii) = 1`, zero elsewhere. Then `det Φ = t − θ`, `det Ψ = Ω`, `σ(Ψ) = ΦΨ`, and `Ψ ∈ GL_(r+1)(𝕋)` has entire entries. The pre-t-motive `X` with matrix `Φ` is an extension `0 → C → X → 𝟙^r → 0`.

- `logPhi_apply`, `logPsi_apply`: the displayed entries.
- `logMatrices_det`: `det Φ = t − θ`, `det Ψ = Ω`.
- `logMatrices_twist`: `σ(Ψ) = ΦΨ`.

*Construction.* Block matrices; the equation follows from those of `Ω` and `L_α`; `ΩL_α` is entire by [§8.35](#dm-8-entire-from-equation). The basis column includes the coordinate `m_0` that Papanikolas's notation omits. (Pap, §6.1.2 and Proposition 6.1.3, pp. 34–35.) *Needs:* [§8.43](#dm-8-carlitz-deformation); [§8.35](#dm-8-entire-from-equation); [§2.10](#dm-2-omega); [§4.12](#dm-4-pre-t-motive).

**Checks.**

- With `r = 0`, `Φ = t − θ` and `Ψ = Ω`: the Carlitz motive.
- With one argument `α = 0`, the matrices split as Carlitz plus unit.
- Two equal arguments give equal off-diagonal entries, so independence of the `α_i` is not automatic.

<a id="dm-8-logarithm-motive-membership"></a>

### 8.45 The logarithm extension is a t-motive (`logMotive_mem`)

**Theorem.** The pre-t-motive `X` of [§8.44](#dm-8-logarithm-matrices) lies in `𝒯`. Indeed `C ⊗ X` is the rationalization of a rigid analytically trivial `A`-finite dual t-motive `M` over `k̄[t]` with `σ`-matrix `(t − θ)Φ`, sitting in `0 → C^⊗2 → M → C^r → 0`, finite free over `k̄[t]` and over `k̄[σ]`, with `(t − θ)^n M ⊂ σM` for `n ≥ 2`; since `𝒯` contains `C^∨` and is closed under tensor products, `X ∈ 𝒯`.

*Proof sketch.* The explicit matrix gives the extension and the annihilation condition. Both `C^⊗2` and `C^r` are finitely generated over `k̄[σ]`; lifts of generators of the quotient together with generators of the submodule prove the same for `M`. It is already finite free over `k̄[t]`, so ABP, Proposition 4.3.2, now implies finite freeness over `k̄[σ]`; that proposition requires finite generation over both rings and does not infer it from the annihilation condition. The fundamental matrix gives rigid analytic triviality. (Pap, Proposition 6.1.3, pp. 34–35; ABP, Proposition 4.3.2, p. 21.) *Needs:* [§8.44](#dm-8-logarithm-matrices); [§8.22](#dm-8-neutral-category); [§4.8](#dm-4-inverse-twist-dual-motive); [§4.11](#dm-4-dual-realization); [§4.12](#dm-4-pre-t-motive).

**Checks.**

- For `r = 0`, `M = C^⊗2` and `X = C`.
- `(t − θ)^n M ⊂ σM` for `n ≥ 2`, while freeness over `k̄[t]` alone would not give membership.
- `C^∨ ⊗ (C ⊗ X) ≅ X`.

<a id="dm-8-carlitz-group"></a>

### 8.46 The Carlitz motivic Galois group (`carlitz_galoisGroup`)

**Theorem.** For the Carlitz motive `C` (matrix `t − θ`, fundamental `Ω`), `Hom_𝒯(C(m), C(n))` is `F_q(t)` for `m = n` and zero otherwise, and `Γ_C ≅ G_m` over `F_q(t)`. In particular the Carlitz period `π̃ = −1/Ω(θ)` is transcendental over `k̄` (`transcendental_carlitzPeriod`).

*Proof sketch.* The difference equation for `Hom(C(m), C(n))` has solutions constant multiples of `Ω^(m−n)`, and a nonzero power of `Ω` has infinitely many zeros or poles, so it is not rational and the only solution in `K` is zero; so the category `⟨C⟩` is equivalent to `ℤ`-graded `F_q(t)`-vector spaces and [§8.21](#dm-8-graded-gm) gives `G_m`. Apply [§8.42](#dm-8-period-transcendence) to the rank-one Carlitz matrix. Papanikolas writes the coefficient field of the graded category in the proof of Theorem 3.5.4 incorrectly; it is `F_q(t)`. (Pap, Lemma 3.5.3 and Theorem 3.5.4, pp. 20–21; ABP, §3.1.2, p. 8.) *Needs:* [§8.22](#dm-8-neutral-category); [§8.12](#dm-8-analytic-fixed-fields); [§8.21](#dm-8-graded-gm); [§8.42](#dm-8-period-transcendence); [§2.10](#dm-2-omega); [§2.9](#dm-2-carlitz-period).

**Checks.**

- `End(C) = F_q(t)`.
- `Hom(𝟙, C) = 0`.
- `π̃` is transcendental, and so is every nonzero element of `π̃·k̄`.

<a id="dm-8-logarithm-group-linear"></a>

### 8.47 The logarithm group (`logGaloisGroup_linear`)

**Theorem.** For the logarithm motive `X`, `Γ_X` is a smooth geometrically connected closed subgroup of `G = {[[a, 0], [v, I_r]] : a invertible}`. The projection `π : Γ_X → G_m`, `a`, is faithfully flat and smooth, and its kernel `V` is a vector subgroup of `G_a^r` over `F_q(t)`. Consequently, if linear forms `F_1, …, F_s` define `V` and `γ = (b_0, b) ∈ Γ_X(F_q(t))` has `b_0 ∉ F_q`, the ideal of `Γ_X` is generated by `G_i = (b_0 − 1)F_i(v) − F_i(b)(a − 1)`.

*Proof sketch.* The comparison matrix places `Γ_X` in `G`, and the subobject `C` makes `π` faithfully flat (MotivesAndAlgebraicCycles §6.3). `Γ_X` is smooth and geometrically connected ([§8.32](#dm-8-difference-smooth-dimension)); over an algebraic closure choose a point above `a = t`, which has infinite multiplicative order. A matrix `[[a, 0], [w, I]]` with `a ≠ 1` is conjugate by a translation to `diag(a, I)`: take the translation parameter `w/(a − 1)`. The closure of its cyclic subgroup is therefore a conjugate copy of `G_m` contained in `Γ_X`, and `π` restricts to an isomorphism on that torus. This proves `logGaloisGroup.splitAfterAlgebraicClosure` and surjectivity on Lie algebras; since `Γ_X` is smooth, `π` and its kernel `V` are smooth. For `g = [[a, 0], [w, I]]`, `g^(−1)[[1, 0], [v, I]]g = [[1, 0], [av, I]]`, so over the algebraic closure `V` is a smooth subgroup of `G_a^r` stable under all scalars, hence a linear subspace; the linear forms in its ideal descend to `F_q(t)`. Since `V` is a vector group, torsors under it over `F_q(t)` are trivial (`H¹(F_q(t), 𝔾_a) = 0`, SchemeAndStackFoundations §§2.3, 2.6, 2.9–2.10), which gives a rational `γ`; its cyclic closure with `V` generates `Γ_X`. Papanikolas asserts the Lie-algebra surjectivity; the explicit cyclic-closure argument supplies it without assuming a general splitting theorem for algebraic groups. (Pap, §§6.2.1–6.2.4, Propositions 6.2.3 and 6.2.5, pp. 35–36.) *Needs:* [§8.45](#dm-8-logarithm-motive-membership); [§8.46](#dm-8-carlitz-group); [§8.34](#dm-8-tannakian-identification); [§8.32](#dm-8-difference-smooth-dimension); SchemeAndStackFoundations §§1.13, 1.15, 2.3, 2.6, 2.9, 2.10; MotivesAndAlgebraicCycles §6.3.

**Checks.**

- For `r = 0`, `Γ_X = G_m` and `V = 0`.
- If all `α_i = 0`, `V = 0` and `Γ_X = G_m`.
- A surjection of smooth groups need not be smooth in characteristic `p` (Frobenius of `G_m`). Here `[[1, 0], [c, I]] diag(a, I) [[1, 0], [−c, I]] = [[a, 0], [(a − 1)c, I]]`; setting `c = w/(a − 1)` exhibits the required torus, also in characteristic two.

<a id="dm-8-logarithm-linear-relations"></a>

### 8.48 Linear relations among logarithms (`dim_logGaloisGroup_eq`)

**Theorem.** Let `N` be the `k`-linear span of `π̃, log_C(α_1), …, log_C(α_r)` for small algebraic arguments. Then `dim Γ_X = dim_k N`. More precisely, each linear form `F = Σ c_iv_i` defining `V`, with `γ = (b_0, b)` as above, gives the relation `(b_0(θ) − 1)Σ c_i(θ)log_C(α_i) − Σ c_i(θ)b_i(θ)π̃ = 0`, and these span all `k`-linear relations. Evaluation `F_q(t) → F_q(θ)` at `t = θ` is defined because `θ` is transcendental over `F_q`, and the auxiliary rational coefficient is regular at `θ`.

*Proof sketch.* The linear equations `G_i` translate into torsor equations; a pole of their coefficients at `θ` would propagate along an infinite twist orbit, so they are regular there. Divide by `Ω` and evaluate with `π̃ = −1/Ω(θ)`: the independent forms give `r + 1 − dim Γ_X` independent `k`-relations. Conversely `trdeg ≤ dim_k N`, and [§8.42](#dm-8-period-transcendence) gives `trdeg = dim Γ_X`. (Pap, §6.3.1 and Theorem 6.3.2, pp. 36–37.) *Needs:* [§8.47](#dm-8-logarithm-group-linear); [§8.42](#dm-8-period-transcendence); [§8.43](#dm-8-carlitz-deformation); [§2.10](#dm-2-omega); [§2.8](#dm-2-carlitz-exponential).

**Checks.**

- For `r = 0`, `N = kπ̃` and `dim Γ_X = 1`.
- For `α_1 = α_2`, the relation `log_C(α_1) − log_C(α_2) = 0` appears.
- `k`-linear relations are distinct from `k̄`-algebraic ones, which the next targets exclude.

<a id="dm-8-logarithm-division"></a>

### 8.49 Reduction to small logarithms (`carlitzLog_division`)

**Theorem.** For `λ ∈ C_∞` with `exp_C(λ) ∈ k̄^×` there are `n ≥ 0`, `α ∈ k̄^×` with `|α| < q^(q/(q−1))`, and `f ∈ F_q[θ]` such that `λ = θ^n log_C(α) + f π̃`. If `exp_C(λ) = 0`, then `λ ∈ F_q[θ]π̃`. So any finite family of logarithms with algebraic exponentials lies in the `k`-span of `π̃` and finitely many small principal logarithms.

*Proof sketch.* If `exp_C(λ)` is small take it as `α`; otherwise solve `θx + x^q = β` repeatedly in `k̄`: the Newton polygon of `X^q + θX − β` has a root of absolute value `|β|^(1/q)` (NewtonPolygons §3.3), so division points shrink until the local inverse applies. Carlitz equivariance gives `exp_C(θ^n log_C(α)) = exp_C(λ)`, and [§2.9](#dm-2-carlitz-period) gives the period term. The case `exp_C(λ) = 0` is treated separately; the printed division lemma covers only nonzero exponentials. (Pap, Lemma 6.4.1, pp. 37–38, §1.2, pp. 3–4.) *Needs:* [§2.8](#dm-2-carlitz-exponential); [§2.9](#dm-2-carlitz-period); NewtonPolygons §3.3.

**Checks.**

- `λ = π̃` has `exp_C(λ) = 0` and lies in `F_q[θ]π̃`.
- `λ = log_C(1)` is already small (`n = 0`, `α = 1`, `f = 0`).
- For `q = 2`, `λ = π̃/θ` has `exp_C(λ) = θ`, and `π̃/θ = log_C(θ)` with `|θ| = 2 < 4`.

<a id="dm-8-carlitz-logarithm-independence"></a>

### 8.50 Algebraic independence of Carlitz logarithms (`algebraicIndependent_carlitzLog`)

**Theorem.** Let `λ_1, …, λ_r ∈ C_∞` with `exp_C(λ_i) ∈ k̄` for all `i`. If they are linearly independent over `k = F_q(θ)`, they are algebraically independent over `k̄`. The linear condition is over `k`, not `k̄`; no principal branch is fixed for arbitrary `λ_i`; a nonzero period (with exponential zero) is allowed. The result is for Carlitz logarithms only, not for all Drinfeld modules of higher rank.

*Proof sketch.* By [§8.49](#dm-8-logarithm-division) the `λ_i` lie in a finite-dimensional `k`-space `N` spanned by `π̃` and small principal logarithms, and [§8.48](#dm-8-logarithm-linear-relations) with [§8.42](#dm-8-period-transcendence) gives `trdeg_(k̄) k̄(N) = dim_k N`. A `k`-basis of `N` has as many elements as this transcendence degree, so it is algebraically independent over `k̄`; extend the given independent family to such a basis by an invertible `k`-linear change of coordinates and discard the extra vectors. (Pap, Theorem 6.4.2, p. 38, Theorem 1.2.6, p. 4.) *Needs:* [§8.49](#dm-8-logarithm-division); [§8.48](#dm-8-logarithm-linear-relations); [§8.42](#dm-8-period-transcendence); Mathlib `AlgebraicIndependent`, `Algebra.trdeg`.

**Checks.**

- A single nonzero Carlitz logarithm with algebraic exponential is transcendental, including `π̃`.
- The pair `(λ, λ)` fails the linear hypothesis and satisfies `X_1 − X_2 = 0`.
- For `q = 2`, `π̃` and `log_C(1)` are `k`-linearly dependent (`π̃ = (θ² + θ)log_C(1)`, [§6.13](#dm-6-carlitz-class-examples)), so the theorem says nothing about the pair, as it must.

<a id="dm-8-constant-denominator"></a>

### 8.51 Frobenius-invariant denominators (`denominator_mem_constants`)

**Theorem.** Let `Φ_i ∈ Mat_(r_i)(k̄[t])` with `det Φ_i = c_i(t − θ)^(s_i)`, `c_i ≠ 0`, for `i = 1, 2`. If `B ∈ Mat_(r_1×r_2)(k̄(t))` satisfies `σ(B)Φ_2 = Φ_1B`, then the monic least common denominator of the entries of `B` lies in `F_q[t]`: a nonzero polynomial over `F_q` clears all entries. `B` is rational; the polynomial entries printed in Chang–Papanikolas–Yu's Proposition 2.2.1 are a misprint.

*Proof sketch.* The denominator of `σ(B)` divides `den(B)·(t − θ)^(s_2)`; a pole at `θ` would propagate under repeated twists to infinitely many distinct poles, using both determinant conditions. So the monic denominator is `σ`-fixed and lies in `F_q[t]` by [§8.12](#dm-8-analytic-fixed-fields). This also shows that rationalization is full on Hom after tensoring with `F_q(t)`. (Pap, Proposition 3.4.5, pp. 18–19; CPY, Proposition 2.2.1, p. 6.) *Needs:* [§2.1](#dm-8-coefficient-twist); [§8.12](#dm-8-analytic-fixed-fields); [§4.8](#dm-4-inverse-twist-dual-motive); Mathlib `RatFunc`.

**Checks.**

- `B = 1/t` with `Φ_1 = Φ_2 = 1`: `σ(B) = B` and the denominator `t` lies in `F_q[t]`.
- `B = 1/(t − θ)` is not a solution for `Φ_1 = Φ_2 = 1`, since `σ(B) = 1/(t − θ^(1/q))`.
- For `Φ_1 = Φ_2 = t − θ` (the Carlitz motive), the morphisms are the constants `F_q(t)`.

### Examples

- The Carlitz period: `σ(Ω) = (t − θ)Ω`, `Γ_C = G_m`, `π̃ = −1/Ω(θ)` transcendental over `k̄`.
- For `q > 2`, `π̃ ∉ K_∞` while `log_C(1) ∈ K_∞`, so `π̃` and `log_C(1)` are `k`-linearly independent and therefore algebraically independent over `k̄`. For `q = 2` they are dependent (`π̃ = (θ² + θ)log_C(1)`), and so are `log_C(1)` and `log_C(θ + 1) = θ·log_C(1)`, because `C_t(1) = θ + 1`.

### Dependencies

Layers DM.1 (the semilinear Lang lemma), DM.2 and DM.4; Mathlib (fixed submodules, scalar extension, `RatFunc`, `PowerSeries.IsRestricted`, `Algebra.adjoin`, `AlgebraicIndependent`, `Algebra.trdeg`, `Algebra.IsGeometricallyReduced`, `Polynomial.hilbertPoly`, `CommHopfAlgCat`); Tau Ceti (Hopf-algebra smoothness, restricted-series Weierstrass theory); RestrictedPowerSeries Layer 1, §§3.2, 4.3, 5.1–5.2, 7.2; NewtonPolygons §§2.2, 3.3, 4.3; AlgebraicCurves Layers 3, 5 and 12; JacobianChallenge Layer B; SchemeAndStackFoundations §§0.7, 1.1, 1.13, 1.15, 2.3, 2.6, 2.9, 2.10, 3.2; MotivesAndAlgebraicCycles §§6.1–6.3; the Stacks project lemma cited in [§8.13](#dm-8-mac-lane-separability).

## Worked examples

- **The Carlitz module, end to end.** `C_t = θ + τ` over `F(θ)` has rank one ([§0.5](#dm-0-carlitz-module)), `C[(a)](F(θ)^sep) ≅ A/(a)` ([§1.7](#dm-1-geometric-torsion-basis)), exponential `Σ z^(q^i)/D_i` with kernel `π_BP·F[θ]` ([§2.9](#dm-2-carlitz-period)), motive `L[t]` with `τ = t − θ` ([§4.3](#dm-4-contravariant-motive)), elliptic sheaf `ℰ_i = 𝒪(i)` on `P^1` ([§7.1](#dm-7-elliptic-sheaf)), `L(C/A) = ζ_A(1) = log_C(1)` with trivial class module ([§6.13](#dm-6-carlitz-class-examples)), and motivic Galois group `G_m` with transcendental period ([§8.46](#dm-8-carlitz-group)).
- **A nonzero class module.** For `q = 2` and `E_t = θ + θ³τ` over `F_2[θ]`: `U = (π_BP/θ³)F_2[θ]`, `H ≅ F_2[t]/(t)`, `L(E/A) = ι(π_BP/θ²)` ([§6.13](#dm-6-carlitz-class-examples)).
- **A supersingular rank-two module.** `φ_t = τ²` over `F_(q²)`: endomorphisms include `τ` and `F_(q²)`, all torsion at `(t)` is connected, and `T_λφ` has rank two at `λ = (t − 1)` with Tate endomorphism ring of rank four ([§0.6](#dm-0-drinfeld-module-hom), [§1.12](#dm-1-characteristic-local-realization), [§5.7](#dm-5-tate-surjectivity)).
- **Modular curves of rank two.** `A = F[t]`, level `(t)`: `M̄_2 = P^1` with `q + 1` cusps, `ω = 𝒪(q)`, `dim M_k = qk + 1`, `dim S_k = qk − q` for `k ≥ 1` ([§3.8](#dm-3-modular-forms)).
- **Carlitz tensor powers.** `C^⊗2`: `t·(x, y) = (θx + y, θy + x^q)`, motive of rank one with `τ = (t − θ)²`, weight two, uniformizable, trivialized by `Ω²` ([§4.7](#dm-4-carlitz-tensor-power), [§8.18](#dm-8-anderson-uniformizability)).

## Downstream consumers

- GlobalShtukasAndFunctionFieldLanglands, which compares the elliptic sheaves and their shtukas of [§7.5](#dm-7-shtuka-export) with one-leg shtukas.
- ExcursionOperatorsAndSpectralAction, whose `D`-elliptic sheaves specialize to the elliptic sheaves of DM.7 for `D = M_d(F)`.
- DrinfeldModulesAndTModulesPartII (multiple zeta values in positive characteristic), which uses the difference-equation theory of DM.8, the Anderson–Thakur function of [§2.10](#dm-2-omega) and [§8.51](#dm-8-constant-denominator).
- FunctionFieldArithmetic, which uses the normalizations of Layer DM.0 for its equal-characteristic local class field theory.

## Notes on the sources

The following slips in the sources are corrected in the targets above.

- Papikian, proof of Theorem 2.3, p. 7: the finite product defining `φ^Λ_a` needs the factor `a` ([§2.5](#dm-2-lattice-drinfeld-module)). Brownawell–Papanikolas, §2.4, p. 6: the polynomial attached to `a` is `P_[Λ:aΛ](az)`.
- Hartl, arXiv version, display (3.5) in the proof of Theorem 3.5, p. 9: the target is `Hom(M(E'), M(E))`, as in the published display. Hartl, Lemma 3.8(b), proof, p. 10: the unit used is `f` itself.
- Hartl–Yu, Proposition 3.11 and proof, pp. 18–19: the line bundles are on `Q_(r, A[1/t])`; display (3.7), p. 18: the sum runs once over subsets of `V ∖ {0}`, not over ordered tuples.
- Stalder, recap after Proposition 6.21 (arXiv p. 43; published p. 595): the Galois-fixed ring is `Frac(F_λ ⊗ L)`, not the completed ring; proof of Proposition 6.4, p. 36: the denominator `q^m − 1` is kept; proof of Theorem 5.4, p. 28: `(V_λ(M)^∨ ⊗ V_λ(N))^G = Hom_G(V_λ(M), V_λ(N))`.
- Maurischat, Theorems 3.6 and 3.8, p. 17: left-module quotients use left ideals. The zero-primary part is separated before the single-edge decomposition; in Theorem 4.1, p. 22, the slope condition includes nonzero constant term, so a nilpotent matrix is excluded. The lattice exponent uses the dimension of its summand, and rank modulo a uniformizer power has the invariant-factor meaning of Definition 1.10, p. 8 ([§4.10](#dm-4-skew-invariant-factors)).
- Wiedmann, proof of Proposition 5.15, p. 77: the section dimensions come from Proposition 5.14.
- Papanikolas: proof of Proposition 3.3.14, p. 16, independent ranks `r`, `s` for the two factors; §3.4.1, p. 17, and Proposition 3.4.7, p. 19, the representing matrix is `r × r`; proof of Theorem 3.5.4, p. 21, the coefficient field of the graded category is `F_q(t)`; proof of Lemma 4.5.7, p. 30, the kernel matrix is the vertical block `(−C; I_(s−m))`; proof of Theorem 5.2.2, p. 33, the block size is `Σ_(n=0)^d r^(2n)`, which is `d + 1` when `r = 1`; proof of Proposition 6.1.3, p. 34, the basis column includes `m_0`; proof of Theorem 6.4.2, p. 38, logarithms with exponential zero are handled by the period lattice, not by Lemma 6.4.1.
- Chang–Papanikolas–Yu, Proposition 2.2.1, p. 6: the matrix `B` has entries in `k̄(t)`, not `k̄[t]`.
- Pink–Schieder's normality theorem for the reciprocal ring is Theorem 1.7 of the arXiv version cited here, with projective normality of `Q_r` in Theorem 1.11.

## References

- [ABP] G. W. Anderson, W. D. Brownawell, M. A. Papanikolas, *Determination of the algebraic relations among special Γ-values in positive characteristic*, Ann. of Math. 160 (2004), 237–313; preprint [arXiv:math/0207168v1](https://arxiv.org/abs/math/0207168v1) (page numbers of the preprint).
- [BP] W. D. Brownawell, M. A. Papanikolas, *A rapid introduction to Drinfeld modules, t-modules, and t-motives*, [arXiv:1806.03919v1](https://arxiv.org/abs/1806.03919v1).
- [CPY] C.-Y. Chang, M. A. Papanikolas, J. Yu, *An effective criterion for Eulerian multizeta values in positive characteristic*, [arXiv:1411.0124v2](https://arxiv.org/abs/1411.0124v2).
- [Cre] R. Crew, *Local class field theory*, notes, 2019, [PDF](https://people.clas.ufl.edu/rcrew/files/LCFT.pdf).
- [DeMi] P. Deligne, J. S. Milne, *Tannakian categories*, revised 2018, [PDF](https://www.jmilne.org/math/xnotes/tc2018.pdf).
- [Har] U. Hartl, *Isogenies of abelian Anderson A-modules and A-motives*, Ann. Sc. Norm. Super. Pisa XIX (2019), 1429–1470; [arXiv:1706.06807v1](https://arxiv.org/abs/1706.06807v1) (page numbers of the preprint).
- [HJ] U. Hartl, A.-K. Juschka, *Pink's theory of Hodge structures and the Hodge conjecture over function fields*, [arXiv:1607.01412v2](https://arxiv.org/abs/1607.01412v2).
- [HY] U. Hartl, C.-F. Yu, *Arithmetic Satake compactifications and algebraic Drinfeld modular forms*, [arXiv:2009.13934v2](https://arxiv.org/abs/2009.13934v2).
- [Mau] A. Maurischat, *Abelian equals A-finite for Anderson A-modules*, Ann. Inst. Fourier (2026), [doi:10.5802/aif.3754](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf) (page numbers of the online-first article).
- [ND] T. Ngo Dac, *On Zagier–Hoffman's conjectures in positive characteristic*, Ann. of Math. 194 (2021); preprint [hal-03298790](https://hal.science/hal-03298790).
- [Pap] M. A. Papanikolas, *Tannakian duality for Anderson–Drinfeld motives and algebraic independence of Carlitz logarithms*, Invent. Math. 171 (2008), 123–174; preprint [arXiv:math/0506078v2](https://arxiv.org/abs/math/0506078v2) (page numbers of the preprint).
- [Pik] M. Papikian, *An overview of the theory of Drinfeld modules*, lecture notes, 2017, [PDF](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf).
- [Pin] R. Pink, *Compactification of Drinfeld modular varieties and Drinfeld modular forms of arbitrary rank*, author copy of arXiv:1008.0013v4, 2012, [PDF](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf).
- [PS] R. Pink, S. Schieder, *Compactification of a Drinfeld period domain over a finite field*, [arXiv:1007.4796v3](https://arxiv.org/abs/1007.4796v3) (page numbers of the preprint).
- [Sta] N. Stalder, *The semisimplicity conjecture for A-motives*, Compos. Math. 146 (2010), 561–598; [arXiv:0809.0224v1](https://arxiv.org/abs/0809.0224v1) (page numbers of the preprint).
- [Stacks] The Stacks project, Tags [00JV](https://stacks.math.columbia.edu/tag/00JV), [00P6](https://stacks.math.columbia.edu/tag/00P6), [030W](https://stacks.math.columbia.edu/tag/030W), [0B5T](https://stacks.math.columbia.edu/tag/0B5T), [0C6J](https://stacks.math.columbia.edu/tag/0C6J).
- [Tae] L. Taelman, *Special L-values of Drinfeld modules*, Ann. of Math. 175 (2012), 369–391, [PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf).
- [Tha] D. S. Thakur, *Power sums with applications to multizeta and zeta zero distribution for F_q[t]*, Finite Fields Appl. 15 (2009), 534–552, [PDF](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf).
- [Wie] S. Wiedmann, *Drinfeld modules and elliptic sheaves*, thesis, 2005, [PDF](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf).
