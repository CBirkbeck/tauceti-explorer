# Drinfeld modules and t-modules: DM.0–DM.7

This roadmap connects the rank-one additive-group description of Drinfeld modules to their torsion, analytic lattices, moduli spaces, Anderson motives, Tate realizations, class formula and elliptic sheaves. Every layer below is planned at target level. The proof inputs and supplier contracts at the end distinguish this completed planning pass from mathematical closure. None of these declarations is claimed to be implemented.

Let F be a finite field of cardinality q. A general coefficient ring is A=Γ(C−∞,O_C), where C/F is a smooth projective geometrically connected curve and ∞ is a closed point of degree δ. Its fraction field is Q, and deg_A(a)=−δ ord∞(a) for a nonzero a. A coefficient algebra carries an F-algebra map γ:A→R. In the polynomial case write A=F[t], with θ=γ(t). The letters t and θ distinguish the algebraic variable from its coefficient-field image. In the class formula T is the independent Laurent-series variable used to record monic cardinalities.

Write R{τ} for the Ore ring with τc=c^qτ. It acts by q-linearized polynomials; multiplication means composition. FF.4 owns this generic theory over arbitrary commutative F-algebras. Evaluation on the R-points of a finite field can fail to be faithful, so identities of polynomials and group-scheme maps take precedence over equalities of functions on one finite point set. The differential is the τ⁰ coefficient. The inverse operator σ in dual motives acts on coefficients by a q-th root and fixes t. Its direction is specified separately from the forward Frobenius of an Anderson motive.

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The actual statements of the cited declarations were read at those pins. The current TauCetiRoadmap AlgebraicVectorBundles and JacobianChallenge documents, and their suggested files, supply the style and geometry interfaces; the newer vector-bundle roadmap is used even though it is absent from the atlas snapshot. Its sheaf, divisor and bundle work is imported.

The accompanying suggested file proposes native algebraic signatures and concrete tests. Where a geometric or completed-realization supplier interface is not yet fixed, it identifies the omitted signature explicitly; no arbitrary proposition stands in for that condition. The reader and packet give the full mathematical target.

Current Tau Ceti also contains the generic Fitting-ideal presentation and base-change theory used by IntegralHeckeAndGaloisDeterminants. Those declarations are absent from the older pinned build. The finite-module cardinality here adds the characteristic-polynomial comparison; it imports the shared Fitting theory through the existing StableReduction foundations.

Current Tau Ceti also contains the generic Fitting-ideal presentation and base-change theory used by IntegralHeckeAndGaloisDeterminants. Those declarations are absent from the older pinned build. The finite-module cardinality here adds the characteristic-polynomial comparison; it imports the shared Fitting theory through the existing StableReduction foundations.


## DM.0. Drinfeld modules, relative families and Carlitz arithmetic

Field objects and relative families share the same differential and Ore convention. Rank is established before it is used in torsion or moduli. The relative version distinguishes a standard linear frame from nonlinear nilpotent-base standardization.



### Drinfeld modules

Target `DrinfeldModulesAndTModules:DM.0/drinfeld-module` (definition). Fix a finite field F of size q, a smooth projective geometrically connected curve C/F, a closed point ∞ of degree δ, A=Γ(C−∞,O_C), and an F-algebra field L with characteristic map γ:A→L. A Drinfeld module is an F-algebra map φ:A→L{τ} with ∂φ_a=γ(a), not equal to the scalar map C∘γ. The q-Frobenius Ore ring and its identification with F-linear polynomial group endomorphisms are supplied by FF.4. The characteristic is ker γ; generic characteristic means γ injective. The rank theorem below supplies r rather than imposing a potentially circular definition.

Hypotheses: F finite; L field; A as specified, with exact constant field F.

Construction or proof route:


1. Import the FF.4 composition-ring comparison.

2. Define the characteristic using the constant-coefficient homomorphism; evaluate on every commutative L-algebra to obtain the group-scheme action.

3. Use the rank theorem to reconcile this field definition with constant positive rank.


API uses:


- DM.1: Forms torsion kernels.

- DM.4: Produces a one-dimensional abelian Anderson module.


Proposed declarations:


- `DrinfeldModule.map` (projection): The F-algebra map φ:A→L{τ}.

- `DrinfeldModule.constantCoeff_map` (simp): ∂φ_a=γ(a).

- `DrinfeldModule.charIdeal` (data): charIdeal φ=ker γ.

- `DrinfeldModule.baseChange` (functoriality): Coefficient extension along an injective F-algebra field map carries φ to a Drinfeld module; identity and composition hold.


Unit tests:


- `DrinfeldModule.test_carlitz` (computation): For C_t=θ+τ, C_t(x)=θx+x^q.

- `DrinfeldModule.test_scalar_rejected` (non-example): The map a↦C(γ(a)) fails the non-scalar condition.

- `DrinfeldModule.test_special_characteristic` (degenerate): Over F, φ_t=τ has characteristic (t), even though φ itself is injective.


Acceptance: C_t=θ+τ has characteristic evaluation at θ. The action on group-scheme points is natural in the value algebra.


Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-eval-linear`, `mathlib:RingHom.ker`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.3, p. 5. The field definition fixes the constant coefficient and excludes scalar actions.


### Rank over the polynomial ring

Target `DrinfeldModulesAndTModules:DM.0/rank-polynomial-ring` (theorem). For A=F[t] and φ_t=θ+g_1τ+⋯+g_rτ^r with g_r≠0, r≥1, every nonzero a∈F[t] satisfies deg_τ φ_a=r deg_t a. If d=deg a, its leading coefficient is lc(a)·g_r^(Σ_{i=0}^{d−1}q^(ri)), with empty exponent sum zero.

Hypotheses: L field; φ a Drinfeld F[t]-module.

Construction or proof route:


1. Expand a(φ_t) using the polynomial algebra-map universal property.

2. FF.4’s Ore multiplication gives the leading coefficient of each power.

3. The maximal degree term is unique; field nonzero coefficients preclude cancellation.


Acceptance: For nonzero constants the degree is zero and leading coefficient is the constant. For C_t=θ+τ and a=t² the image is θ²+(θ+θ^q)τ+τ².


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `mathlib:Polynomial.aeval`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.3, p. 5. The polynomial-ring rank is the τ-degree of the image of t.


### The general rank theorem

Target `DrinfeldModulesAndTModules:DM.0/rank-general` (theorem). For A=Γ(C−∞,O_C) with arbitrary δ=deg∞, a field Drinfeld A-module has a unique integer r≥1 such that deg_τφ_a=r deg_A(a), where deg_A(a)=−δ ord∞(a)=log_q #(A/(a)), for all a≠0. A rational ∞ is not assumed. The assertion includes integrality of r.

Hypotheses: The curve and field hypotheses of drinfeld-module.

Construction or proof route:


1. τ-degree is additive on products and gives an infinity valuation on Frac(A).

2. Import the function-ring degree and Riemann–Roch facts.

3. Identify L{τ} with the finite projective A⊗F L motive of the one-dimensional module; its rank supplies the integer r. The final finite-projectivity/integrality input is recorded as a gap rather than inferred from proportional valuations alone.


Acceptance: The degree of a depends on δ. For F[t], recover rank-polynomial-ring.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `FunctionFieldArithmetic:FA.1`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Lemma 1.4, p. 4; Definition 3.7 and Corollary 3.9, pp. 9–11. The source normalizes degree by the residue-field degree at infinity and compares rank-r Drinfeld modules with dimension-one abelian Anderson modules.


### The rank invariant

Target `DrinfeldModulesAndTModules:DM.0/rank` (construction). Define rank φ as the unique r supplied by rank-general, normalized by log_q|A/(a)|. Its value is locally constant in relative families; over F[t] it is the nonzero τ-degree of φ_t.

Hypotheses: A and L as in drinfeld-module.

Construction or proof route:


1. Use uniqueness in rank-general to choose r.

2. Field extension preserves nonzero leading coefficients and hence the degree formula.


API uses:


- DM.1: Sets the rank of the Tate module.

- DM.3: Specifies each moduli component.


Proposed declarations:


- `DrinfeldModule.rank` (data): The integer r with deg_τφ_a=r deg_A(a).

- `DrinfeldModule.rank_pos` (characterisation): 0<rank φ.

- `DrinfeldModule.rank_baseChange` (functoriality): rank(baseChange φ)=rank φ.


Unit tests:


- `DrinfeldModule.rank_test_carlitz` (computation): rank(C)=1.

- `DrinfeldModule.rank_test_tau_square` (computation): rank(φ_t=τ² over F)=2.

- `DrinfeldModule.rank_test_infinity_degree` (non-example): At a point ∞ of degree δ, using −ord∞(a) alone yields δr, and fails the normalization whenever δ>1.


Acceptance: The invariant is positive and unchanged by field extension.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/rank-general`, `DrinfeldModulesAndTModules:DM.0/rank-polynomial-ring`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Definition 3.7, pp. 9–10. The leading-degree formula specifies the relative rank.


### The Carlitz module

Target `DrinfeldModulesAndTModules:DM.0/carlitz-module` (construction). For θ∈L, C:F[t]→L{τ} is the F-algebra map with C_t=θ+τ. Its characteristic is evaluation at θ, rank is one, and C_t acts as x↦θx+x^q. Generic characteristic holds exactly when θ is transcendental over F.

Hypotheses: L field containing F.

Construction or proof route:


1. Apply the polynomial algebra-map universal property to Cθ+τ.

2. The constant coefficient is evaluation at θ; degree one proves the non-scalar property.


API uses:


- DM.2: Fixes the exponential recurrence and period.

- DM.6: Tests the class formula and depth-one sums.


Proposed declarations:


- `carlitz` (constructor): The Drinfeld module C determined by C_t=θ+τ.

- `carlitz_map_X` (simp): C_t=Cθ+τ.

- `carlitz_rank` (compatibility): rank(C)=1.

- `carlitz_constantCoeff` (simp): ∂C_a=a(θ).


Unit tests:


- `carlitz_test_square` (computation): C_t²=θ²+(θ+θ^q)τ+τ².

- `carlitz_test_theta_zero` (degenerate): At θ=0, C_t=τ and C[t]=Spec L[X]/(X^q).

- `carlitz_test_noncommuting` (non-example): The τ-coefficient of C_t² is θ+θ^q, not 2θ unless θ^q=θ.


Acceptance: C_t²=θ²+(θ+θ^q)τ+τ².


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module`, `DrinfeldModulesAndTModules:DM.0/rank-polynomial-ring`, `mathlib:Polynomial.aeval`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.2, pp. 3–5. The modern Carlitz sign is plus τ; its exponential and torsion use this convention.


### Morphisms and isogenies

Target `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom` (definition). For φ and ψ over the same (L,γ), Hom(φ,ψ) consists of u∈L{τ} with uφ_a=ψ_a u for every a. It is an A-module through a·u=ψ_a u=uφ_a. Composition is Ore multiplication. A field isogeny is a nonzero such u; an isomorphism is a scalar u=Cc with c∈L×. End(φ) is an A-algebra, potentially noncommutative in special characteristic.

Hypotheses: Same A, coefficient field and characteristic map.

Construction or proof route:


1. Take the simultaneous equalizer of the intertwiners.

2. Closure under addition and the A-action follows from commutation.

3. The Ore degree theorem identifies units as invertible constants.


API uses:


- DM.5: Provides the source of the Tate comparison.

- DM.7: Requires bounded shifts on elliptic-sheaf morphisms.


Proposed declarations:


- `DrinfeldModule.Hom` (constructor): The intertwiner A-module.

- `DrinfeldModule.Hom.comp` (structure): v∘u=v u; identity is 1.

- `DrinfeldModule.Hom.smul` (simp): a·u=ψ_a u.

- `DrinfeldModule.isogeny_iff` (characterisation): Over a field, u is an isogeny iff u≠0.


Unit tests:


- `Hom_test_identity` (degenerate): 1 belongs to Hom(φ,φ).

- `Hom_test_scalar_conjugation` (compatibility): Cc∈Hom(φ,ψ) iff ψ_a=Cc φ_a C(c⁻¹), for c≠0.

- `Hom_test_extra_endomorphism` (computation): For φ_t=τ² over F_{q²}, τ and every scalar in F_{q²} are endomorphisms; they need not commute.


Acceptance: Identity and composition satisfy category laws.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.3, p. 5; §2.5, pp. 7–8. Intertwining polynomials are the morphisms, and scalar conjugation describes isomorphisms.


### Rank invariance and separability

Target `DrinfeldModulesAndTModules:DM.0/isogeny-rank` (theorem). A nonzero intertwiner u:φ→ψ over a field forces rank φ=rank ψ. Its kernel has scheme order q^(deg_τu); it is étale iff ∂u≠0. In generic characteristic ∂u≠0 for every nonzero u. In special characteristic a Frobenius isogeny may have ∂u=0.

Hypotheses: φ and ψ have the same characteristic map.

Construction or proof route:


1. Compare τ-degrees in uφ_a=ψ_a u.

2. FF.4 identifies the derivative of the kernel polynomial as ∂u.

3. If the first nonzero coefficient has index i>0, commutation gives γ(a)^(q^i)=γ(a) for all a; generic γ(A) is infinite, a contradiction.


Acceptance: τ:φ_t=τ²→φ_t=τ² over F is inseparable. A nonzero scalar has degree zero and trivial kernel.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom`, `DrinfeldModulesAndTModules:DM.0/rank`, `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-separable-iff`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Lemma 3.8(b), p. 10; Corollaries 5.11 and 5.17, pp. 19 and 22. The source controls leading degrees and separability of isogenies.


### Drinfeld kernel schemes

Target `DrinfeldModulesAndTModules:DM.0/kernel-scheme` (construction). For a nonzero intertwiner u with q-linearized polynomial P_u, define ker(u)=Spec L[X]/(P_u), with the inherited additive Hopf structure and A-action. It is the general affine group-scheme kernel already provided by Tau Ceti, specialized to the map u of G_a. Its coordinate algebra is free of rank q^(deg_τu); geometric points alone need not determine it.

Hypotheses: L field; u≠0; the kernel of the zero map is G_a and is not finite.

Construction or proof route:


1. Use FF.4 to obtain the additive group-scheme endomorphism.

2. P_u is primitive, so its principal ideal is a Hopf ideal.

3. Apply kernelSpec and divide by the invertible leading coefficient to obtain the monic basis 1,…,X^(q^deg−1).


API uses:


- DM.1: Principal ideal torsion is this kernel.

- DM.3: Level structures identify finite étale group schemes.


Proposed declarations:


- `DrinfeldKernel.coordinateAlgebra` (constructor): L[X]/(P_u).

- `DrinfeldKernel.points` (characterisation): For an L-algebra B, points are x∈B with P_u(x)=0.

- `DrinfeldKernel.baseChange` (functoriality): Kernel formation commutes with coefficient extension.


Unit tests:


- `DrinfeldKernel_test_scalar` (degenerate): ker(Cc)=Spec L for c≠0.

- `DrinfeldKernel_test_frobenius` (computation): ker(τ²)=Spec L[X]/(X^(q²)); its order is q² and its geometric point set has size one.

- `DrinfeldKernel_test_etale` (compatibility): At θ≠0, ker(C_t) has order q and is étale.


Acceptance: Scheme order and root count agree only in the étale case.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `tauceti:TauCeti.CommHopfAlgCat.kernelSpec`, `tauceti:TauCeti.AdditiveGroup.gaPointsMulEquiv`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Definition 5.1, p. 15; §6, pp. 23–24. Isogenies have finite locally free scheme-theoretic kernels, and torsion uses these kernels.


### Relative Drinfeld modules

Target `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module` (definition). Over an A-scheme S, take the additive group of an invertible O_S-module E and a ring map φ:A→End_F(E) with differential γ. Locally in a linear trivialization, φ_a=Σ b_i(a)τ^i; for a≠0 its highest nonzero degree is r deg_A(a), its coefficient is a unit, and all higher coefficients vanish. Rank r is positive and locally constant on S. Changes of linear frame by u∈O_S× send b_i to u^(1−q^i)b_i. The invertible sheaf and its vector group are imported from AlgebraicVectorBundles, not reconstructed.

Hypotheses: S an A-scheme; standard form; rank can vary between open-and-closed components.

Construction or proof route:


1. Import invertible sheaves, their pullbacks and relative vector groups.

2. Glue the local Ore actions using the coefficient transformation law.

3. Check the degree and differential conditions are invariant under linear frames.


API uses:


- DM.3: Defines the moduli functor.

- DM.7: Descent of the one-dimensional underlying group.


Proposed declarations:


- `RelativeDrinfeldModule.pullback` (functoriality): Pull back the line bundle and action along a map of A-schemes.

- `RelativeDrinfeldModule.coeff_changeFrame` (relation): b_i becomes u^(1−q^i)b_i.

- `RelativeDrinfeldModule.rank_fiber` (compatibility): The rank of each geometric fibre is the specified locally constant rank.


Unit tests:


- `RelativeDrinfeldModule_test_field` (compatibility): Over Spec L with E=O, recover the field definition and rank.

- `RelativeDrinfeldModule_test_nonunit` (non-example): φ_t=θ+sτ over F[θ,s] fails rank one at s=0 and is not a rank-one family on the whole base.

- `RelativeDrinfeldModule_test_frame` (computation): For rank-one C_t=θ+τ, a frame change by u gives θ+u^(1−q)τ.


Acceptance: The field fibre recovers drinfeld-module.


Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.


Sources: [PINK-2012](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf), Definition 3.1, pp. 9–10; Proposition 3.5, pp. 10–11. Pink specifies the line-bundle version in standard form, with fibrewise rank and coefficient conditions.


### Standardization over nonreduced bases

Target `DrinfeldModulesAndTModules:DM.0/relative-standardization` (theorem). The relative definition that allows nilpotent coefficients above r deg_A(a) is equivalent to the standard line-bundle definition: locally a unique additive coordinate change with constant coefficient one removes the higher nilpotent terms. Between standard forms, invertible intertwining coordinate changes are scalar. This theorem is required before treating arbitrary additive coordinates as linear frames.

Hypotheses: Positive rank; affine local charts; nilpotent higher coefficients as in Hartl Definition 3.7.

Construction or proof route:


1. Use the standardization input of Hartl Lemma 3.8(a).

2. For a standard intertwiner compare its top coefficient in the commutation relation as in Lemma 3.8(b).

3. Scalar transition cocycles give the invertible sheaf by descent.


Acceptance: Over dual numbers, (1+ετ) conjugates a standard family to a possibly nonstandard one; this is not a linear frame.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module`, `SchemeAndStackFoundations:SF.1`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Definition 3.7, Lemma 3.8 and Corollary 3.9, pp. 9–11. The source distinguishes nilpotent higher terms from standard form and derives linear transitions.


### Carlitz denominator products

Target `DrinfeldModulesAndTModules:DM.0/carlitz-products` (construction). For A=F[θ], set [i]=θ^(q^i)−θ, D_0=ℓ_0=1, D_i=∏_{j=0}^{i−1}(θ^(q^i)−θ^(q^j)) and ℓ_i=∏_{j=1}^i(θ−θ^(q^j)). Then D_i=[i]D_{i−1}^q and ℓ_i=−[i]ℓ_{i−1} for i≥1. These are polynomial identities; inverse denominators require transcendental θ or localization.

Hypotheses: F finite; θ an indeterminate for nonvanishing claims.

Construction or proof route:


1. Expand the products and use q-power Frobenius.

2. Keep the sign in ℓ_i distinct from the unsigned product of [j].


API uses:


- DM.2: Exponential and logarithm coefficients.

- DM.6: Γ_n and S_d(s) normalizations.


Proposed declarations:


- `carlitzBracket` (constructor): [i]=θ^(q^i)−θ.

- `carlitzD` (constructor): The product D_i, with D_0=1.

- `carlitzEll` (constructor): The signed product ℓ_i, with ℓ_0=1.

- `carlitzD_succ` (relation): D_(i+1)=[i+1]D_i^q.

- `carlitzEll_succ` (relation): ℓ_(i+1)=−[i+1]ℓ_i.


Unit tests:


- `carlitzProducts_test_zero` (degenerate): D_0=ℓ_0=1 and [0]=0.

- `carlitzProducts_test_two` (computation): D_2=(θ^(q²)−θ)(θ^(q²)−θ^q).

- `carlitzProducts_test_sign` (non-example): ℓ_1=−D_1, which differs from D_1 in odd characteristic.


Acceptance: D_1=θ^q−θ and ℓ_1=θ−θ^q.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/carlitz-module`, `mathlib:FiniteField.frobeniusAlgHom`.


Sources: [NGODAC-2021](https://hal.science/hal-03298790/document), §2.2, p. 7; §4.2, p. 17. These products normalize Carlitz factorials and the depth-one power sums.


## DM.1. Ideal torsion, Tate modules and characteristic completion

Scheme-theoretic torsion preserves connected length at the characteristic place. Point Tate modules use only primes away from that place. The completion and finite-shtuka comparison supply the characteristic realization with its own Frobenius and effectiveness bound.



### Ideal torsion

Target `DrinfeldModulesAndTModules:DM.1/ideal-torsion` (construction). For a nonzero ideal I⊂A and a relative rank-r Drinfeld module E/S, define E[I]=⋂_{a∈I}ker φ_a as an A-stable closed subgroup scheme. Finite generators give the same scheme independent of their choice. E[A] is the zero group; E[(a)]=ker φ_a. Coprime ideals give E[IJ]≅E[I]×E[J].

Hypotheses: I nonzero; S an A-scheme; E relative in standard form.

Construction or proof route:


1. On affine charts quotient O_S[X] by the q-polynomials for generators of I.

2. Use additive intertwiners and the ideal identity to prove independence.

3. Bézout idempotents give the Chinese-remainder splitting.


API uses:


- DM.1: Forms the λ-power inverse system.

- DM.3: Defines level structures as scheme isomorphisms.


Proposed declarations:


- `DrinfeldModule.idealTorsion` (constructor): The closed subgroup E[I].

- `DrinfeldModule.idealTorsion_principal` (compatibility): E[(a)]=ker φ_a.

- `DrinfeldModule.idealTorsion_baseChange` (functoriality): Base change of E[I] equals the I-torsion of the pulled-back family.

- `DrinfeldModule.idealTorsion_crt` (equivalence): For I+J=A, E[IJ]≅E[I]×E[J].


Unit tests:


- `idealTorsion_test_unit` (degenerate): E[A] is the zero group scheme of order one.

- `idealTorsion_test_carlitz` (computation): C[(t)]=Spec L[X]/(θX+X^q).

- `idealTorsion_test_scheme_points` (non-example): At θ=0 this scheme has length q, although its geometric points form the zero group.


Acceptance: The unit ideal has degree one, not zero.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module`, `DrinfeldModulesAndTModules:DM.0/kernel-scheme`, `mathlib:Ideal.span`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Definition 6.1, Proposition 6.3, pp. 23–24. The source defines ideal torsion and establishes principal and coprime-ideal comparisons.


### Finite locally free torsion

Target `DrinfeldModulesAndTModules:DM.1/finite-flat-torsion` (theorem). E[I] is finite locally free over S of degree #(A/I)^r for every nonzero ideal I. This holds without I being principal and without invertibility of γ(I). The corresponding effective motive satisfies Dr_q(M/IM)≅E[I] in the finite-shtuka/strict-group comparison.

Hypotheses: E rank r; I nonzero.

Construction or proof route:


1. For principal I use the monic q-polynomial quotient basis.

2. For arbitrary I use the finite-shtuka comparison for the finite locally free O_S-module M/IM.

3. Hartl Theorem 6.4 gives flatness; geometric fibres and the Dedekind ideal norm give the degree.


Acceptance: A nonprincipal ideal still has degree #(A/I)^r. At characteristic, flatness does not imply étaleness.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.1/ideal-torsion`, `DrinfeldModulesAndTModules:DM.4/effective-a-motive`, `SchemeAndStackFoundations:SF.2`, `FunctionFieldArithmetic:FA.1`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Theorem 6.4, pp. 24–25. This is the finite locally free ideal-torsion theorem and motive comparison.


### The prime-to-characteristic condition

Target `DrinfeldModulesAndTModules:DM.1/etale-torsion` (theorem). E[I] is étale over S iff γ(I)O_S=O_S. Over a field this means I is coprime to ker γ. For a principal ideal the derivative is γ(a). An isogeny has an invertible differential exactly when its kernel is étale.

Hypotheses: Nonzero I; E a relative Drinfeld module.

Construction or proof route:


1. Use the conormal or co-Lie description in the finite-shtuka comparison.

2. For a principal generator compute the q-polynomial derivative by FF.4.

3. Localize on S to reduce the ideal condition to a generator with unit image.


Acceptance: For C_t=τ at θ=0, t-torsion is connected; (t−1)-torsion is étale.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.1/finite-flat-torsion`, `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-separable-iff`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Theorem 6.4(b), pp. 24–25. Invertibility of the characteristic ideal image characterizes étaleness.


### Geometric torsion bases

Target `DrinfeldModulesAndTModules:DM.1/geometric-torsion-basis` (theorem). If I is prime to the characteristic and Ω is a separably closed coefficient field, E[I](Ω) is a free A/I-module of rank r. For its motive, (M/IM)^τ is free of the same rank; the realization of E[I] is its finite-field dual, with the dualizing A/I-module Hom_F(A/I,F) made explicit.

Hypotheses: I nonzero and γ(I) generates the unit ideal.

Construction or proof route:


1. Hartl Lemma 6.5 supplies Frobenius frames using Lang’s morphism for restriction of scalars of GL_r.

2. Apply the perfect pairing of Theorem 6.6; use the finite-field trace dual rather than identifying variance silently.


Acceptance: Rank r gives #(A/I)^r geometric points. The assertion is false at the characteristic prime.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.1/etale-torsion`, `DrinfeldModulesAndTModules:DM.4/contravariant-motive`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Lemma 6.5 and Theorem 6.6, pp. 25–26. The source proves freeness and the duality of torsion with motive invariants.


### Drinfeld Tate modules

Target `DrinfeldModulesAndTModules:DM.1/tate-module` (construction). For a nonzero prime λ≠ker γ, put A_λ=lim A/λ^n and define the λ-adic Tate module from the λ-power torsion over L^sep. For general A use the canonical division-module description Hom_A(K_λ/A_λ,E[λ^∞](L^sep)), or identify it with the inverse system after choosing a local uniformizer and proving independence of that choice. Transition maps are not multiplication by a nonexistent global generator of a nonprincipal ideal. T_λE is free of rank r over A_λ; V_λE=Frac(A_λ)⊗T_λE.

Hypotheses: λ a nonzero prime away from characteristic; K_λ=Frac(A_λ).

Construction or proof route:


1. Use geometric-torsion-basis at λ^n.

2. Surjectivity of division maps and compatible lifted bases give the completed free module.

3. Identify coordinate choices with the canonical division-module model.


API uses:


- DM.5: Tate Hom comparison.

- DM.7: Elliptic-sheaf realization comparison.


Proposed declarations:


- `DrinfeldModule.tateModule` (constructor): The canonical A_λ-module T_λE.

- `DrinfeldModule.tateModule_mod` (compatibility): T_λE/λ^nT_λE≅E[λ^n](L^sep), with the division-coordinate convention fixed.

- `DrinfeldModule.tateMap` (functoriality): u acts on torsion and induces T_λu; identity and composition hold.

- `DrinfeldModule.tateModule_rank` (characterisation): T_λE is free of rank rank E.


Unit tests:


- `tateModule_test_carlitz` (computation): For C and λ≠char, rank_Aλ T_λC=1.

- `tateModule_test_tau_square` (computation): For φ_t=τ² over F and λ=(t−1), rank T_λφ=2.

- `tateModule_test_isogeny` (compatibility): A nonzero isogeny induces an injection with finite torsion cokernel, hence a rational Tate isomorphism.

- `tateModule_test_char_rejected` (non-example): For φ_t=τ, the t-power separable torsion is zero; it cannot be a rank-one t-adic Tate module.


Acceptance: For a principal λ=(ℓ), points satisfy φ_ℓ(x_(n+1))=x_n.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.1/geometric-torsion-basis`, `FunctionFieldArithmetic:FA.2`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Definitions 2.26 and Proposition 2.28, pp. 12–14. Motive Tate modules are Frobenius invariants; the Drinfeld torsion realization uses their dual.


### The continuous Tate representation

Target `DrinfeldModulesAndTModules:DM.1/continuous-galois-action` (construction). The natural G_L-action on T_λE is A_λ-linear and continuous for the inverse-limit topology. It gives ρ_λ:G_L→Aut_Aλ(T_λE), and a choice of basis gives GL_r(A_λ). Modulo λ^n its action is the finite torsion action; each stabilizer is open because a finite separable extension splits that torsion.

Hypotheses: L a coefficient field; λ away from characteristic.

Construction or proof route:


1. The finite étale coordinate algebra produces finite continuous Galois sets.

2. Take compatible actions in the inverse limit and use the inverse-limit basis of neighborhoods.

3. Naturality of torsion maps makes every T_λu equivariant.


API uses:


- DM.5: Forms equivariant Hom and tests the Frobenius centralizer.


Proposed declarations:


- `DrinfeldModule.tateGaloisAction` (structure): The continuous A_λ-linear G_L-action.

- `DrinfeldModule.tateGaloisAction_mod` (compatibility): Reduction modulo λ^n agrees with the torsion action.

- `DrinfeldModule.tateMap_equivariant` (functoriality): T_λu commutes with G_L.


Unit tests:


- `tateGaloisAction_test_sepclosed` (degenerate): For separably closed L, the Galois action is trivial.

- `tateGaloisAction_test_finite_field` (computation): Over F_{q^m}, arithmetic Frobenius acts on torsion by x↦x^(q^m).

- `tateGaloisAction_test_basis` (compatibility): Changing a Tate basis by B replaces every action matrix R by B⁻¹RB.


Acceptance: A basis change conjugates ρ; the representation is intrinsically basis free.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.1/tate-module`, `DrinfeldModulesAndTModules:DM.1/etale-torsion`, `SchemeAndStackFoundations:SF.2`.


Sources: [PAPIKIAN-2017](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf), §3.2, pp. 12–14. Finite torsion representations and their Tate limit carry the Galois action.


### The characteristic-place realization

Target `DrinfeldModulesAndTModules:DM.1/characteristic-local-realization` (construction). Fix a characteristic prime p, residue field F_p of size qhat=q^f, an F_p-algebra R, and a characteristic map A→R whose local uniformizer image is nilpotent. Complete an effective A-motive at p. Split F_p⊗F R into its f coefficient factors and take the distinguished characteristic factor; τ^f induces a qhat-Frobenius linearization on a free R[[z]]-module of rank r. It becomes invertible after z−γ(z) is inverted and has an effective cokernel bound inherited from dimension one. The finite reductions correspond to p-power strict finite group schemes, including the connected part. Import the general local-shtuka category and bounds from HS2.

Hypotheses: The coefficient splitting, nilpotent characteristic parameter and finite locally free motive are required.

Construction or proof route:


1. Apply the completion and coefficient-factor decomposition of Hartl §7.

2. Iterate Frobenius f times to return to the characteristic factor.

3. Compare the finite reductions by the finite-shtuka functor, keeping the connected–étale decomposition separate from separable points.


API uses:


- DM.7: The characteristic local comparison retains the effective bound.


Proposed declarations:


- `DrinfeldModule.charLocalRealization` (constructor): The distinguished completed module with τ^f.

- `DrinfeldModule.charLocalRealization_rank` (compatibility): Its R[[z]]-rank is r.

- `DrinfeldModule.charLocalRealization_mod` (compatibility): The finite reductions realize the full characteristic torsion group schemes.


Unit tests:


- `charLocal_test_supersingular` (computation): For φ_t=τ² over F, φ[t^n]=Spec F[X]/(X^(q^(2n))) is connected of order q^(2n).

- `charLocal_test_residue_degree` (non-example): For degree-f p, the characteristic factor is preserved by τ^f, generally not by τ.

- `charLocal_test_points_insufficient` (non-example): Replacing φ[t^n] by its separable points turns all these connected kernels into the zero group.


Acceptance: For φ_t=τ² and p=(t), the p-power kernels retain nonzero scheme length despite having one geometric point.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/effective-a-motive`, `SchemeAndStackFoundations:SF.2`, `HeckeStacksAndLocalShtukas:HS2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), §7, pp. 27–28. The local object uses a residue-degree Frobenius and a distinguished coefficient factor.


## DM.2. Analytic uniformization and period conventions

The normalized absolute value, the bounded-ball lattice condition and the sign of the Carlitz period fix the analytic conventions. Infinite products are treated as limits over finite subspaces. The entire products and their restricted-series realizations use the existing AdicSpaces foundations.



### The analytic coefficient field

Target `DrinfeldModulesAndTModules:DM.2/c-infinity` (construction). Let K=Frac(A), K_∞ its completion at ∞, choose its real-valued absolute value normalized by |a|=q^(deg_A(a)), and extend it to an algebraic closure. C_∞ is the completion of that normed algebraic closure. It is a complete algebraically closed nonarchimedean field of characteristic p containing K; for F[θ] and rational ∞, |θ|=q. The choice of norm extension is unique up to the appropriate isometric K_∞-isomorphism.

Hypotheses: A as in DM.0; fixed norm extension and completion.

Construction or proof route:


1. Import the completion and real-norm interface from FA.2.

2. Use the spectral norm for algebraic extensions.

3. For algebraic closedness in characteristic p, first prove perfectness of the completion by Cauchy p-th roots, then apply the simple-root perturbation/Krasner argument of Crew Corollary 1.2.8.5. Do not apply a characteristic-zero Mathlib theorem.


API uses:


- DM.2: Convergence and surjectivity of exponential functions.

- DM.8: Analytic coefficient field for periods and twists.


Proposed declarations:


- `CInfty` (constructor): Completion of the normed algebraic closure of K_∞.

- `CInfty.norm_algebraMap` (compatibility): The embedding preserves the chosen norm on K_∞.

- `CInfty.isAlgClosed` (instance): C_∞ is algebraically closed.

- `CInfty.complete` (instance): C_∞ is complete.


Unit tests:


- `CInfty_test_theta` (computation): For F[θ], ‖θ‖=q.

- `CInfty_test_qroot` (characterisation): Every c∈C_∞ has a unique q-th root.

- `CInfty_test_generic` (non-example): No nonzero a∈A maps to zero; a finite coefficient field is not a substitute for C_∞.


Acceptance: The embedding A→C_∞ has generic characteristic.


Direct prerequisites: `FunctionFieldArithmetic:FA.2`, `mathlib:UniformSpace.Completion`, `mathlib:NormedField.instCompletableTopField`.


Sources: [CREW-2019](https://people.clas.ufl.edu/rcrew/files/LCFT.pdf), Proposition 1.2.8.4 and Corollary 1.2.8.5, pp. 34–35. The completion argument applies in positive characteristic; the perturbation step uses separable roots.


### Projective A-lattices

Target `DrinfeldModulesAndTModules:DM.2/a-lattice` (definition). An A-lattice in C_∞ is a finitely generated projective A-submodule Λ⊂C_∞ of positive rank such that {λ∈Λ:‖λ‖≤R} is finite for each finite R≥0. Its rank is the dimension of K⊗AΛ. Morphisms are scalars c∈C_∞ with cΛ⊂Λ′; isomorphisms are homotheties by nonzero c. Bounded-ball finiteness is required; mere topological discreteness is insufficient.

Hypotheses: Generic embedding A⊂C_∞; A Dedekind.

Construction or proof route:


1. Use the native Submodule, Module.Finite and Module.Projective notions.

2. Finite generation and torsion-freeness over Dedekind A give projectivity.

3. Define the scalar morphism category and homothety relation.


API uses:


- DM.2: Weierstrass product and inverse uniformization.

- DM.6: The unit lattice is in K_∞-type spaces with the same discrete/cocompact distinction.


Proposed declarations:


- `ALattice` (constructor): A positive-rank projective A-submodule with finite bounded intersections.

- `ALattice.rank` (data): dim_K(K⊗AΛ).

- `ALattice.scale` (functoriality): cΛ is a lattice for c≠0.

- `ALattice.quotient_card` (relation): For a≠0, #(a⁻¹Λ/Λ)=#(A/(a))^(rank Λ).


Unit tests:


- `ALattice_test_principal` (computation): For A=F[θ], A is a rank-one lattice.

- `ALattice_test_nonprincipal` (compatibility): For a nonprincipal ideal I⊂A embedded in K_∞, I is a rank-one projective lattice and is not free as an A-module.

- `ALattice_test_discrete_constants` (non-example): The algebraic closure of F inside C_∞ is discrete but has infinitely many elements of norm one; it fails the bounded-ball condition.


Acceptance: Nonprincipal ideal lattices must be accepted.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/c-infinity`, `FunctionFieldArithmetic:FA.1`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.4–2.5, pp. 6–8. The lattice correspondence uses finite projective modules and scalar homotheties.


### Lattice exponential

Target `DrinfeldModulesAndTModules:DM.2/lattice-exponential` (construction). For an A-lattice Λ define e_Λ(z)=z∏_{0≠λ∈Λ}(1−z/λ), as the limit over finite F-subspaces exhausting Λ. It is an entire F-linear function with derivative one and kernel exactly Λ. The product converges uniformly on every bounded disk, and e_Λ is surjective on C_∞.

Hypotheses: Λ an A-lattice; C_∞ as constructed above.

Construction or proof route:


1. Finite subspace polynomials from FF.4 give normalized additive partial products.

2. Bounded-ball finiteness makes each tail factor uniformly approach one.

3. The analytic zero/product and nonarchimedean Newton-polygon input gives the kernel and surjectivity. This analytic input is requested explicitly.


API uses:


- DM.2: Constructs φ_Λ and identifies morphisms.


Proposed declarations:


- `ALattice.exp` (constructor): The entire normalized product e_Λ.

- `ALattice.exp_add` (structure): e_Λ(x+y)=e_Λ(x)+e_Λ(y), and e_Λ(cx)=c e_Λ(x) for c∈F.

- `ALattice.exp_ker` (characterisation): e_Λ(z)=0 iff z∈Λ.

- `ALattice.exp_scale` (functoriality): e_(cΛ)(cz)=c e_Λ(z) for c≠0.


Unit tests:


- `latticeExp_test_derivative` (characterisation): The coefficient of z is one.

- `latticeExp_test_kernel` (compatibility): For nonzero λ∈Λ, e_Λ(λ)=0, while e_Λ(z)≠0 for z∉Λ.

- `latticeExp_test_scaling` (computation): Replacing Λ by cΛ conjugates the exponential by z↦cz; omitting its initial z factor fails the derivative test.


Acceptance: e_(cΛ)(cz)=c e_Λ(z).


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/a-lattice`, `FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`, `mathlib:PowerSeries.IsRestricted.subring`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.4 and Theorem 2.1, pp. 6–7. The normalized product constructs the exponential in the Drinfeld–lattice correspondence.


### The module of a lattice

Target `DrinfeldModulesAndTModules:DM.2/lattice-drinfeld-module` (construction). For a≠0, define φ^Λ_a(X)=aX∏_{0≠v∈a⁻¹Λ/Λ}(1−X/e_Λ(v)), and set φ^Λ_0=0. This is independent of representatives, is q-linearized, and e_Λ(az)=φ^Λ_a(e_Λ(z)). The scalar factor a gives the required derivative a. The map a↦φ^Λ_a is a rank-r Drinfeld module with r=rank Λ.

Hypotheses: The generic embedding of A; lattice rank r.

Construction or proof route:


1. Use the finite F-subspace e_Λ(a⁻¹Λ/Λ) and its subspace polynomial.

2. Compare normalized entire functions with equal simple zeros; the finite quotient determines the degree.

3. Surjectivity of e_Λ proves the additive and multiplicative laws for φ.


API uses:


- DM.2: Inverse functor for uniformization.

- DM.3: Analytic points of level moduli.


Proposed declarations:


- `ALattice.drinfeldModule` (constructor): The Drinfeld module φ^Λ.

- `ALattice.exp_functionalEquation` (relation): e_Λ(az)=φ^Λ_a(e_Λ(z)).

- `ALattice.drinfeldModule_rank` (compatibility): rank(φ^Λ)=rank Λ.

- `ALattice.drinfeldModule_scale` (functoriality): φ^(cΛ)_a(X)=c φ^Λ_a(c⁻¹X).


Unit tests:


- `latticeModule_test_one` (degenerate): φ^Λ_1(X)=X.

- `latticeModule_test_linear` (non-example): For nonconstant a, the coefficient of X is a, not one.

- `latticeModule_test_carlitz` (compatibility): For Λ=πA with the Carlitz period normalization below, φ^Λ=C.


Acceptance: φ^Λ_a has derivative a and degree |A/(a)|^r.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/lattice-exponential`, `DrinfeldModulesAndTModules:DM.0/drinfeld-module`, `FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`.


Sources: [PAPIKIAN-2017](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf), Theorem 2.3 and proof, pp. 6–7. The theorem states the functional equation; its displayed finite product needs the factor a, as recorded under sourceIssues.


### Drinfeld uniformization

Target `DrinfeldModulesAndTModules:DM.2/uniformization` (theorem). Every rank-r Drinfeld A-module φ over C_∞ in generic characteristic has a unique entire F-linear exponential exp_φ with derivative one and exp_φ(az)=φ_a(exp_φ(z)). It is surjective; its kernel is a projective A-lattice of rank r. These functors give an equivalence between field Drinfeld modules over C_∞ and A-lattices with scalar morphisms. No automatic statement is asserted for arbitrary t-modules or families.

Hypotheses: C_∞, generic characteristic, rank r≥1.

Construction or proof route:


1. For F[t], the coefficient recurrence is α_0=1 and (θ^(q^i)−θ)α_i=Σ_{j=1}^{min(r,i)}g_j α_(i−j)^(q^j).

2. Establish infinite radius and simple zeros from the analytic input.

3. The functional equation gives the A-module kernel; quotient torsion counts and the infinite-place finiteness input give projective rank r.

4. For general A, restrict along a separating F[t]⊂A and recover the full A-action by uniqueness; the exact general-A kernel-rank input is recorded.


Acceptance: A nonprincipal ideal lattice stays projective, not artificially free. The exponential of a general t-module may be nonsurjective.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/lattice-drinfeld-module`, `DrinfeldModulesAndTModules:DM.0/rank-general`, `FunctionFieldArithmetic:FA.2`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), Theorem 2.1, pp. 7–8. The Drinfeld–lattice classification is stated with rank and the field setting.


### Morphisms in uniformization

Target `DrinfeldModulesAndTModules:DM.2/exponential-morphisms` (comparison). For φ,ψ over C_∞, differentiation gives a bijection Hom(φ,ψ)≅{c∈C_∞:cΛ_φ⊂Λ_ψ}; the corresponding polynomial u satisfies u(exp_φ(z))=exp_ψ(cz). It is compatible with A-actions, identities and composition. In particular scalar homothety classifies isomorphisms.

Hypotheses: Generic characteristic over C_∞.

Construction or proof route:


1. Construct u from the finite quotient when c≠0 and use the normalized product.

2. Differentiating gives ∂u=c; uniqueness follows from surjectivity.

3. Use the functional equations to verify intertwining.


Acceptance: A nonzero morphism is separable; c=0 corresponds only to u=0.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/uniformization`, `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.5, pp. 7–8. The Weierstrass–Drinfeld dictionary matches intertwiners with lattice scalars.


### Carlitz exponential and logarithm

Target `DrinfeldModulesAndTModules:DM.2/carlitz-exponential` (construction). For transcendental θ with ‖θ‖=q, exp_C(z)=Σ_{i≥0}z^(q^i)/D_i is entire and satisfies exp_C(θz)=θ exp_C(z)+exp_C(z)^q. The local inverse is log_C(z)=Σ z^(q^i)/ℓ_i on its convergence disk, in particular at z=1. The logarithm is not declared entire.

Hypotheses: A=F[θ]; C_t=θ+τ; the norm normalization above.

Construction or proof route:


1. Use carlitzD_succ for the exponential recurrence and degree(D_i)=i q^i for infinite radius.

2. Use carlitzEll_succ for the logarithm recurrence.

3. The normalized local inverse theorem identifies the two series on a sufficiently small disk.


API uses:


- DM.6: The Carlitz unit lattice and ζ_A(1).

- DM.8: Period and logarithm inputs.


Proposed declarations:


- `carlitzExp` (constructor): Σ z^(q^i)/D_i.

- `carlitzExp_functionalEquation` (relation): exp_C(θz)=θexp_C(z)+exp_C(z)^q.

- `carlitzLog` (constructor): The local inverse series Σ z^(q^i)/ℓ_i.

- `carlitzExp_log_one` (example): exp_C(log_C(1))=1.


Unit tests:


- `carlitzExp_test_coeff` (computation): The z^q coefficient is (θ^q−θ)⁻¹.

- `carlitzExp_test_zero` (degenerate): exp_C(0)=log_C(0)=0.

- `carlitzExp_test_log_sign` (non-example): The z^q coefficient of log_C is (θ−θ^q)⁻¹; using D_1 gives the wrong sign in odd characteristic.


Acceptance: log_C converges at one because ‖ℓ_i‖ grows rapidly.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/carlitz-products`, `DrinfeldModulesAndTModules:DM.2/uniformization`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.2, pp. 3–5. The source gives the exponential coefficients, Carlitz equation and period setting.


### The Carlitz period

Target `DrinfeldModulesAndTModules:DM.2/carlitz-period` (construction). Choose ρ∈C_∞ with ρ^(q−1)=−θ. Set π_BP=θρ∏_{i≥1}(1−θ^(1−q^i))⁻¹. Then ker exp_C=π_BP A and ‖π_BP‖=q^(q/(q−1)). Changing ρ by ξ∈F× changes π_BP by ξ. The source-selected Ngo Dac period is π_ND=−π_BP; it generates the same lattice.

Hypotheses: A=F[θ], generic characteristic, chosen ρ.

Construction or proof route:


1. The factors converge as θ^(1−q^i)→0.

2. The product formula for exp_C and the minimal nonzero zero identify the lattice generator.

3. Compute the norm and the root-of-unity dependence.


API uses:


- DM.2: Normalizes Ω(θ) and π^(q−1).

- DM.8: Carlitz period supplier contract.


Proposed declarations:


- `carlitzPeriod` (constructor): The product π_BP with the chosen root ρ.

- `carlitzPeriod_ker` (characterisation): exp_C(z)=0 iff z∈π_BP A.

- `carlitzPeriod_norm` (data): ‖π_BP‖=q^(q/(q−1)).

- `carlitzPeriod_changeRoot` (functoriality): Replacing ρ by ξρ replaces π by ξπ.


Unit tests:


- `carlitzPeriod_test_zero` (characterisation): π_BP≠0 and exp_C(π_BP)=0.

- `carlitzPeriod_test_sign` (compatibility): π_ND=−π_BP gives the same A-lattice.

- `carlitzPeriod_test_norm` (computation): For q=2, ‖π_BP‖=4.


Acceptance: The lattice is independent of multiplication by F×.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/carlitz-exponential`, `DrinfeldModulesAndTModules:DM.2/a-lattice`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §2.2, pp. 4–5. The source uses π_BP; the sign adapter to Ngo Dac’s Ω normalization is specified here.


### The Anderson–Thakur Omega function

Target `DrinfeldModulesAndTModules:DM.2/omega` (construction). For the same root ρ, define Ω(t)=ρ^(−q)∏_{i≥1}(1−t/θ^(q^i)). It is entire in t and a unit of the radius-one Tate algebra. Coefficientwise inverse q-twist, fixing t, satisfies Ω^(−1)=(t−θ)Ω. Its simple zeros are θ^(q^i), i≥1, so Ω(θ)≠0 and Ω(θ)⁻¹=π_ND=−π_BP.

Hypotheses: A=F[θ]; fixed ρ; inverse coefficient twist imported from DM.8; restricted-series algebra imported from Mathlib and the existing AdicSpaces roadmap.

Construction or proof route:


1. Uniform convergence on every disk gives the entire product.

2. The zero locations lie outside the unit disk; the restricted-series criterion gives a Tate unit.

3. Shift the product under the inverse coefficient twist and use ρ^(q−1)=−θ.

4. Evaluate at θ and compare products, retaining the sign.


API uses:


- DM.8: Rigid trivialization of the Carlitz dual motive.

- Characteristic-p multiple-zeta consumers: They import Ω and its normalization from here.


Proposed declarations:


- `carlitzOmega` (constructor): The entire product Ω(t).

- `carlitzOmega_twist` (relation): Ω^(−1)=(t−θ)Ω.

- `carlitzOmega_at_theta` (compatibility): Ω(θ)⁻¹=−π_BP.

- `carlitzOmega_zeros` (characterisation): The zeros are exactly θ^(q^i), i≥1, each simple.


Unit tests:


- `carlitzOmega_test_constant` (computation): Ω(0)=ρ^(−q).

- `carlitzOmega_test_theta` (characterisation): Ω(θ)≠0 but Ω(θ^q)=0.

- `carlitzOmega_test_tate_unit` (non-example): Ω has no zeros on ‖t‖≤1; being a Tate unit does not mean being a zero-free entire function.


Acceptance: Twisting does not replace the variable t by t^q.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/carlitz-period`, `DrinfeldModulesAndTModules:DM.8/coefficient-twist`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`, `mathlib:PowerSeries.IsRestricted.subring`.


Sources: [NGODAC-2021](https://hal.science/hal-03298790/document), §4.2, pp. 17–18. The product, inverse-twist equation and choice 1/Ω(θ)=π fix the normalization.


### The invariant Carlitz period power

Target `DrinfeldModulesAndTModules:DM.2/period-power` (theorem). π_BP^(q−1)=π_ND^(q−1)=−θ^q∏_{i≥1}(1−θ^(1−q^i))^(−(q−1)) belongs to K_∞×. It is independent of the root ρ. The period itself need not lie in K_∞ when q>2.

Hypotheses: The period/root convention above.

Construction or proof route:


1. Raise the defining product to q−1 and substitute ρ^(q−1)=−θ.

2. The scalar sign between the two periods has (q−1)-st power one.

3. Every factor is in K_∞ and their product converges there.


Acceptance: For q>2 the valuation −q/(q−1) excludes π from K_∞, whose valuation group is Z.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/carlitz-period`.


Sources: [NGODAC-2021](https://hal.science/hal-03298790/document), §4.2, p. 17; §2 notation, pp. 5–7. The period normalization supplies the root-independent power used in depth-one special values.


## DM.3. Level moduli, Satake compactification and modular forms

The good-open fine moduli scheme, the generic Satake model and the integral Satake model have different bases and hypotheses. The modular line is the dual of the Lie line. Compactification statements retain weak separation, normalization and the exact fine-level condition.



### Prime-to-characteristic level structures

Target `DrinfeldModulesAndTModules:DM.3/level-structure` (definition). For a nonzero proper ideal N⊂A and an A[1/N]-scheme S, a full level-N structure on a rank-r Drinfeld module E is an A-linear isomorphism of finite étale S-group schemes (N⁻¹/A)^r_S→E[N]. Here A[1/N]=Γ(Spec A−V(N),O); no generator of N is chosen. For N′⊂N, restriction to N-torsion forgets the extra level. The domain is canonically an ideal-quotient module, not a chosen (A/N)^r basis.

Hypotheses: Rank r fixed; all primes dividing N inverted on S.

Construction or proof route:


1. Use ideal torsion and its étaleness in DM.1.

2. Define the isomorphism functor and its finite étale torsor of frames.

3. Restrict along N⁻¹/A⊂N′⁻¹/A and check identity and successive restrictions.


API uses:


- DM.3: Fine moduli, change of level and Hecke correspondences.

- DM.7: Level data transports across the elliptic-sheaf dictionary.


Proposed declarations:


- `DrinfeldLevel` (constructor): An A-linear finite étale group-scheme isomorphism (N⁻¹/A)^r_S≅E[N].

- `DrinfeldLevel.pullback` (functoriality): Pullback of E and the level along an A[1/N]-scheme map.

- `DrinfeldLevel.forget` (functoriality): Restrict a level-N′ structure to N-torsion for N′⊂N.

- `DrinfeldLevel.change` (structure): GL_r(A/N) acts by precomposition after the ideal-quotient identification; the intrinsic frame group is Aut_A((N⁻¹/A)^r).


Unit tests:


- `DrinfeldLevel_test_rank_one` (computation): For Carlitz and (t) away from θ=0, a nonzero t-torsion section gives a full level.

- `DrinfeldLevel_test_basis` (non-example): For rank two, sending both basis vectors to the same nonzero torsion point is not a level structure.

- `DrinfeldLevel_test_characteristic` (non-example): For φ_t=τ at characteristic (t), the length-q connected kernel is not isomorphic to the étale constant F-group scheme.


Acceptance: For A=F[t] and N=(t), the level is an ordered F-basis of ker φ_t.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.1/ideal-torsion`, `DrinfeldModulesAndTModules:DM.1/etale-torsion`, `DrinfeldModulesAndTModules:DM.1/geometric-torsion-basis`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-YU-2025](https://arxiv.org/pdf/2009.13934v2), §2, equation (2.4) and Theorem 2.3, pp. 7–8. The good open base uses a group-scheme isomorphism from the fractional-ideal quotient.


### The Drinfeld moduli stack

Target `DrinfeldModulesAndTModules:DM.3/moduli-functor` (construction). For r≥1, define the groupoid over each A-scheme S of rank-r relative Drinfeld modules and their isomorphisms, with pullback along base maps. It is an fpqc stack and a smooth Deligne–Mumford stack of relative dimension r−1 over Spec A. On A[1/N], full level-N objects define its frame cover; the quotient groupoid of the fine level scheme by Aut_A((N⁻¹/A)^r) recovers the unlevelled stack. Its set of isomorphism classes is not its stack structure.

Hypotheses: Fixed A, rank r and standard relative convention; N nonzero proper on the stated good open.

Construction or proof route:


1. Descend line bundles, q-linearized action maps and level frames using SF.1–SF.2.

2. Construct the fine cover on each good open by fine-moduli-scheme.

3. Use two coprime nonzero ideals to cover Spec A; quotient presentations glue and prove the stack assertions.


API uses:


- DM.3: Locates fine level schemes and coarse quotients.

- DM.7: Transports the relative moduli interpretation.


Proposed declarations:


- `DrinfeldModuli` (constructor): The fibred groupoid of rank-r relative Drinfeld modules.

- `DrinfeldModuli.pullback` (functoriality): Base pullback with identity/composition coherence.

- `DrinfeldModuli.levelAtlas` (compatibility): The fine level scheme gives an étale atlas on A[1/N].

- `DrinfeldModuli.quotientPresentation` (equivalence): The quotient stack of the level atlas by the frame group is the unlevelled stack on that base.


Unit tests:


- `DrinfeldModuli_test_rank_one` (computation): The unlevelled Carlitz object has the scalar automorphism group F×; a full nontrivial good level has trivial stabilizer.

- `DrinfeldModuli_test_dimension` (characterisation): Relative dimensions at ranks one and two are zero and one.

- `DrinfeldModuli_test_iso_classes` (non-example): Replacing each groupoid by its set of isomorphism classes loses the automorphism group when q>2.


Acceptance: Rank-one scalar automorphisms F× remain in the unlevelled groupoid.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module`, `DrinfeldModulesAndTModules:DM.3/level-structure`, `DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-YU-2025](https://arxiv.org/pdf/2009.13934v2), Theorem 2.3 and §2 equations (2.7)–(2.9), pp. 8–9; Proposition 2.8, pp. 10–11. The fine-level cover and its finite quotient give the stack presentation; the source states scheme-level results, and stack gluing is a supplier input.


### Fine level representability and smoothness

Target `DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme` (theorem). For any nonzero proper N⊂A, the full level-N functor over Spec A[1/N] is represented by an affine smooth scheme M_r(N) of finite type and relative dimension r−1, with universal family. For a compact open K⊂GL_r(Â), call K fine if its image in some GL_r(A/p) is unipotent. Write N_K for the largest ideal with K(N_K)⊂K. The K-level moduli scheme over A[1/N_K] is a fine smooth moduli scheme when K is fine; for general K it is coarse. These assertions do not require the two-prime condition needed for an all-characteristics level functor over Spec A.

Hypotheses: r≥1; A as in DM.0; level primes inverted; K fine for a universal family.

Construction or proof route:


1. Construct principal-level charts from the standard coefficient and torsion equations.

2. Infinitesimal deformations give a formally smooth rank-r−1 space; finite presentation supplies smoothness.

3. Use finite quotients and descent. A scalar fixing a fine level acts both semisimply and unipotently on torsion, hence is one.

4. The precise chart/deformation proof in Drinfeld §5 is an explicit source proof gap; Hartl–Yu states the result and proves the fine-subgroup extension.


Acceptance: At A=F[t], level (t), rank one is zero-dimensional over F(t). At rank two the principal-level generic fiber is a smooth affine curve.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.3/level-structure`, `DrinfeldModulesAndTModules:DM.0/relative-standardization`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-YU-2025](https://arxiv.org/pdf/2009.13934v2), Theorem 2.3, p. 8; Definition 2.6, Lemma 2.7 and Proposition 2.8, pp. 10–11. The source gives the good-open smoothness, level rigidity, and fine/coarse distinction.


### Generalized Drinfeld modules

Target `DrinfeldModulesAndTModules:DM.3/generalized-drinfeld-module` (definition). A generalized Drinfeld A-module of rank ≤r over S is a line bundle E with an F-linear A-action, differential γ, every field fiber a Drinfeld module of positive rank ≤r, and the global degree bound φ_a=Σ_{i=0}^{r deg_A(a)}b_iτ^i. Coefficients b_i are sections of E^(1−q^i). Isomorphisms preserve the line-bundle structure. Weakly separating means that for each algebraically closed field L over the base, any fixed Drinfeld-module isomorphism class occurs at only finitely many points of S(L). The global bound cannot be replaced by a fiberwise bound on nonreduced bases.

Hypotheses: S an A-scheme; fixed integer r≥1; standard F-linear line bundle.

Construction or proof route:


1. Glue the bounded q-linearized coefficient descriptions under line-bundle changes.

2. Define field-fiber positivity and weak separation independently of level.

3. Pullback preserves generalized families; weak separation is a condition on the resulting classifying map, not invariant under arbitrary positive-dimensional base change.


API uses:


- DM.3: Defines generic and arithmetic Satake compactifications and their universal family.


Proposed declarations:


- `GeneralizedDrinfeldModule` (constructor): Bounded F-linear action on a line bundle with positive-rank field fibers.

- `GeneralizedDrinfeldModule.coefficient` (projection): b_i(a)∈Γ(S,E^(1−q^i)).

- `GeneralizedDrinfeldModule.pullback` (functoriality): The degree-bound and fiber conditions survive base pullback.

- `GeneralizedDrinfeldModule.isWeaklySeparating` (characterisation): Every geometric isomorphism class has a finite fiber in S(L).


Unit tests:


- `generalized_test_boundary` (computation): Over F(θ)[g], φ_t=θ+τ+gτ² has generic rank two and rank one at g=0; it is generalized of rank ≤2.

- `generalized_test_scalar` (non-example): At a point where all positive τ-coefficients vanish the fiber is scalar, so the family is rejected.

- `generalized_test_nilpotents` (non-example): Over F(θ)[ε]/(ε²), θ+τ+ετ³ has fiber rank one but fails the rank-≤1 global degree bound.

- `generalized_test_constant_family` (non-example): A constant family over a positive-dimensional affine line is not weakly separating.


Acceptance: Boundary rank drops are positive; a scalar action alone is not allowed.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `SchemeAndStackFoundations:SF.0`.


Sources: [PINK-2012](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf), Definitions 3.1 and 3.9, pp. 9–13. Generalized families permit rank drops, while weak separation controls compactification uniqueness.


### The generic Satake compactification

Target `DrinfeldModulesAndTModules:DM.3/satake-compactification` (construction). For fine K, a Satake compactification of M_r(K)/K_0, where K_0=Frac(A), is a normal integral proper K_0-scheme containing M_r(K) densely, together with a weakly separating generalized Drinfeld module extending its universal family. It exists, is projective, and is unique together with the extension up to unique isomorphism restricting to the given family. This is a generic-fiber theorem; it neither supplies arbitrary integral base change nor an explicit general boundary stratification.

Hypotheses: r≥1; fine compact open K⊂GL_r(Â); generic base K_0.

Construction or proof route:


1. The normalized closure of the diagonal compares two candidates; extension of isomorphisms and weak separation make its projections finite and hence isomorphisms.

2. Construct the F[t], (t)-level case by reciprocal-compactification.

3. Use normalization for coefficient restriction and finite quotients for change of level, exactly as Pink Lemmas 4.4–4.5 and Theorem 4.2.


API uses:


- DM.3: Carries the modular-form line and compact Hecke maps.


Proposed declarations:


- `DrinfeldSatake` (constructor): The normal proper generic compactification with its generalized family.

- `DrinfeldSatake.openImmersion` (projection): M_r(K)↪M̄_r(K), dense.

- `DrinfeldSatake.unique` (universal-property): A unique compatible isomorphism joins any two such compactifications.

- `DrinfeldSatake.changeLevel` (functoriality): A finite level map extends uniquely to the compactifications, compatibly with compositions.


Unit tests:


- `satake_test_rank_one` (degenerate): The compactification equals the zero-dimensional rank-one moduli scheme.

- `satake_test_rank_two` (computation): For F[t] and level (t), its generic rank-two compactification is P¹ with q+1 cusps.

- `satake_test_general_boundary` (non-example): Normal projectivity and weak separation alone do not provide a named disjoint union of every lower-rank moduli stratum.


Acceptance: At rank one there is no smaller positive-rank boundary. At rank two and A=F[t], level (t), the compactification is P¹ and has q+1 missing rational points.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.3/generalized-drinfeld-module`, `DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme`, `DrinfeldModulesAndTModules:DM.3/reciprocal-compactification`, `SchemeAndStackFoundations:SF.4`.


Sources: [PINK-2012](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf), Definition 4.1, Theorem 4.2 and proof, pp. 13–16. The universal property uses normality, weak separation and extension of the generic family.


### The principal-level reciprocal model

Target `DrinfeldModulesAndTModules:DM.3/reciprocal-compactification` (construction). Let V=F^r, S=Sym_F V and Q(V)=Frac(S). In Q(V), let R(V) be generated by 1/v for nonzero v∈V, graded with deg(1/v)=1. Q_r=Proj R(V) is normal, integral and projective. On A[1/t] for A=F[t], its open principal-level scheme is the complement of all F-rational hyperplanes in P^(r−1), embedded by reciprocals. The generalized action is φ_t(X)=tX∏_{v≠0}(1−(1/v)X) on the line O(−1), and its Lie dual is O(1). It is weakly separating. This model supplies both generic and arithmetic construction seeds.

Hypotheses: r≥1; q-linearized finite-subspace product imported from FF.4; in the integral model t is inverted.

Construction or proof route:


1. Use the reciprocal relations 1/(cv)=c⁻¹/v and (1/v)(1/w)=(1/(v+w))(1/v+1/w) when v,w,v+w≠0.

2. Construct Proj and identify its dense open by localization.

3. Normality of R(V) is the Pink–Schieder input cited by the source; record its uninspected proof as a precise gap.

4. The nonvanishing of some degree-one reciprocal at each Proj point prevents rank zero; finite permutations of reciprocal values prove weak separation.


API uses:


- DM.3: The existence proof starts with this explicit principal-level model.


Proposed declarations:


- `DrinfeldReciprocalRing` (constructor): The graded reciprocal subalgebra R(V)⊂Frac(Sym_F V).

- `DrinfeldReciprocalScheme` (constructor): Q_r=Proj R(V).

- `DrinfeldReciprocalScheme.universalAction` (data): The bounded action tX∏(1−X/v) on O(−1).

- `DrinfeldReciprocalScheme.lieDual` (compatibility): Lie(E)∨≅O(1).


Unit tests:


- `reciprocal_test_rank_one` (computation): For r=1, the reciprocal ring is a polynomial ring in one degree-one generator, so Proj is a point.

- `reciprocal_test_rank_two` (computation): Q_2 is P¹ and its open removes the q+1 F-rational points.

- `reciprocal_test_product_scalar` (non-example): Removing the factor t from φ_t gives derivative one rather than t and fails the characteristic-map condition.


Acceptance: At rank one Q_1 is Spec F; at rank two Q_2 is P¹.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.3/generalized-drinfeld-module`, `FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`, `SchemeAndStackFoundations:SF.4`.


Sources: [HARTL-YU-2025](https://arxiv.org/pdf/2009.13934v2), Lemma 3.10 and Proposition 3.11 with proof, pp. 17–19. The model works over A[1/t], and the source reduces normality to Pink–Schieder.


### Algebraic Drinfeld modular forms

Target `DrinfeldModulesAndTModules:DM.3/modular-forms` (definition). On the generic Satake compactification for fine K, set ω=Lie(E)∨ and M_k(K)=H⁰(M̄_r(K),ω^⊗k), k≥0; a cusp form vanishes on the reduced boundary. The multiplication of sections makes ⊕_k M_k(K) a graded K_0-algebra. The line ω is ample and the section ring is a finitely generated normal integral domain whose Proj recovers M̄. For nonfine K use invariants at a fine normal sublevel, not a nonexistent universal line on coarse moduli. These are algebraic modular forms; their agreement with analytic holomorphy is a separate comparison.

Hypotheses: Generic base; k a nonnegative integer; fine K for the line-bundle formulation.

Construction or proof route:


1. Identify the Lie dual under standard coordinates.

2. Pull back to the reciprocal model and use finite-surjective descent of ampleness.

3. Import section-ring and coherent-cohomology theorems from SF.4 and the existing JacobianChallenge/AlgebraicVectorBundles roadmaps.

4. Take fine-level invariants to make level-independent spaces for general K.


API uses:


- DM.3: Hecke pullback, trace and graded ring.

- Function-field modular-form consumers: Algebraic form spaces with a precise line convention.


Proposed declarations:


- `DrinfeldModularForm` (constructor): Global sections of ω^⊗k.

- `DrinfeldModularForm.mul` (structure): Weight-k and weight-l sections multiply to weight k+l.

- `DrinfeldModularForm.cusp` (characterisation): Kernel of restriction to the reduced boundary.

- `DrinfeldModularForm.levelInvariants` (compatibility): At a fine normal sublevel K′, M_k(K)=M_k(K′)^(K/K′).


Unit tests:


- `modularForm_test_one` (degenerate): The constant section 1 is a weight-zero form.

- `modularForm_test_rank_two` (computation): At A=F[t], level (t), rank two, ω has degree q and dim M_k=qk+1; for k≥1 the q+1 cusp vanishing conditions give dim cusp forms qk−q.

- `modularForm_test_boundary` (non-example): A section on the open moduli scheme with a pole at a cusp is not a global section on the compactification.


Acceptance: Weight zero is the ring of global functions of the projective compactification.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.3/satake-compactification`, `DrinfeldModulesAndTModules:DM.3/reciprocal-compactification`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.0`.


Sources: [PINK-2012](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf), Theorem 5.3, Definition 5.4, Proposition 5.5 and Theorem 5.6, pp. 19–20. The ample Lie-dual line defines algebraic forms, and coarse levels are handled by invariants.


### Drinfeld Hecke correspondences and operators

Target `DrinfeldModulesAndTModules:DM.3/hecke-correspondence` (construction). For g∈GL_r(A_f) with entries in Â and compact open K, put K′=K∩g⁻¹Kg. The correspondence is M_r(K)←J_1 M_r(K′)→J_g M_r(K), using quotient isogenies. Its maps extend finitely to the generic Satake compactifications. The induced operator on weight-k forms is T_g=(J_g)_*∘J_1^*, with pullback composed with the isogeny’s Lie-dual identification and pushforward defined by the finite coset trace. It depends only on KgK. For gK′g⁻¹⊂K, (J_g)_*J_g^*=[K:gK′g⁻¹] id; the integer is viewed in characteristic p and may be zero.

Hypotheses: Generic-fiber moduli; g integral at every finite place for the specified line normalization; use fine sublevels and invariants if K is not fine.

Construction or proof route:


1. Construct quotient isogenies from ideal torsion, and identify the Lie line in generic characteristic.

2. Extend the finite maps and isogenies by Satake uniqueness and generalized-family extension.

3. Use a common normal fine level and sum translates to define trace; independence follows from subgroup transitivity.

4. Double-coset convolution follows from the finite correspondence decomposition, without dividing by its degree.


API uses:


- DM.3: Computes modular-form change of level and Hecke actions.


Proposed declarations:


- `DrinfeldHecke` (constructor): The pair J_1,J_g from K∩g⁻¹Kg.

- `DrinfeldHecke.pullback` (functoriality): The section map using the Lie-dual identification.

- `DrinfeldHecke.trace` (data): The coset sum pushforward.

- `DrinfeldHecke.operator` (data): T_g=(J_g)_*J_1^*.

- `DrinfeldHecke.doubleCoset` (characterisation): KgK=KhK implies T_g=T_h.


Unit tests:


- `Hecke_test_identity` (degenerate): For g=1 and K′=K, T_1=id.

- `Hecke_test_level_trace` (compatibility): For a fine normal sublevel K′⊂K, trace∘pullback=[K:K′] id.

- `Hecke_test_characteristic_index` (non-example): If p divides [K:K′], that composite is zero on forms; a normalized trace dividing by the degree is undefined.


Acceptance: A change of level with g=1 has pullback followed by trace equal to its finite index.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.3/modular-forms`, `DrinfeldModulesAndTModules:DM.3/satake-compactification`, `DrinfeldModulesAndTModules:DM.1/ideal-torsion`, `DrinfeldModulesAndTModules:DM.0/isogeny-rank`, `SchemeAndStackFoundations:SF.4`.


Sources: [PINK-2012](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf), Propositions 2.6–2.7, pp. 6–7; Proposition 4.11, p. 18; Lemma 5.1, p. 19; §6 equations (6.1)–(6.9) and Proposition 6.10, pp. 21–23. The normalization is pullback by J_1 followed by trace along J_g; degree is not inverted.


### The arithmetic Satake compactification

Target `DrinfeldModulesAndTModules:DM.3/integral-compactification` (theorem). For every fine compact open K⊂GL_r(Â), with N_K the largest ideal satisfying K(N_K)⊂K, M_r(K) over Spec A[1/N_K] has a normal integral projective flat Satake compactification carrying a weakly separating generalized Drinfeld module extending the universal family. Both are unique up to unique compatible isomorphism, and the Lie-dual line is ample. For fine K′⊂K, the level map extends to a finite surjective open map after extending the base to A[1/N_K′], and pulls back the family and Lie-dual line. No flatness of this finite level map or normality/Cohen–Macaulayness of every special fiber is asserted.

Hypotheses: r≥1; fine K; excellent Dedekind A; the indicated good open base, not Spec A with level primes retained.

Construction or proof route:


1. Use the explicit reciprocal model over F[t,1/t] as the seed.

2. For coefficient restriction, normalize the closure of the fine moduli image in that seed; generalized action maps extend over a normal base.

3. Take the finite quotient at a principal sublevel; fineness descends the line bundle, normality and weak separation.

4. Dedekind-base torsion-freeness gives flatness; finite-surjective descent gives ampleness.

5. Normalized diagonal uniqueness and common-level quotients prove level functoriality.


Acceptance: For F[t], level (t), the model is Q_r×Spec F[t,1/t]. Its generic fiber is Pink’s compactification by the defining universal property.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.3/reciprocal-compactification`, `DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme`, `DrinfeldModulesAndTModules:DM.3/generalized-drinfeld-module`, `SchemeAndStackFoundations:SF.4`.


Sources: [HARTL-YU-2025](https://arxiv.org/pdf/2009.13934v2), Definition 3.1, Theorem 3.2 and Lemmas 3.3, 3.6–3.8 with proofs, pp. 12–16; Proposition 3.11, pp. 18–19. This is the separately sourced integral extension; the source explicitly distinguishes finite level maps from flat maps.


## DM.4. Anderson modules, effective motives and dual conventions

A t-module can have a nilpotent differential without being abelian or uniformizable. Finite projectivity over the coefficient ring, Ore-freeness, purity and analytic surjectivity are stated separately. The contravariant motive and inverse-twist dual motive are related through an explicit star operation.



### Anderson t-modules

Target `DrinfeldModulesAndTModules:DM.4/t-module` (definition). For A=F[t] and an F-algebra field L with γ(t)=θ, a d-dimensional t-module is the F-algebra map Φ:F[t]→Mat_d(L{τ}) acting on G_a^d such that dΦ_t=θI_d+N with N nilpotent. More intrinsically, an Anderson A-module over R is fpqc-locally G_a^d as an F-module scheme and satisfies (dΦ_a−γ(a)I)^d=0 for every a∈A. Morphisms are matrices U with UΦ_a=Ψ_aU. Abelianness means that its contravariant motive is finite locally free over A⊗F R; it is an additional hypothesis.

Hypotheses: d≥1 for nontrivial examples; polynomial-ring field coordinate version and relative Anderson version distinguished.

Construction or proof route:


1. Use FF.4 entrywise to identify F-linear polynomial maps with matrices over the Ore ring.

2. Use the polynomial algebra-map universal property; the nilpotent differential at t implies the required condition for every a.

3. Define the matrix intertwiners and their category laws.

4. Descend the coordinate description to fpqc forms, using SF.2.


API uses:


- DM.4: The motive functor and tensor-power examples.

- DM.8: Only abelian/A-finite, analytically trivial eligible objects enter period theorems.


Proposed declarations:


- `TModule` (constructor): The matrix Ore action with nilpotent differential at t.

- `TModule.differential` (projection): The constant-coefficient matrix dΦ_t.

- `TModule.Hom` (constructor): Polynomial intertwiners UΦ_t=Ψ_tU.

- `TModule.isAbelian` (characterisation): M(Φ) is finite locally free over L[t].

- `TModule.ofDrinfeld` (compatibility): The dimension-one matrix action of a Drinfeld F[t]-module.


Unit tests:


- `TModule_test_carlitz` (compatibility): For d=1 and Φ_t=θ+τ the differential is θ and the motive has rank one.

- `TModule_test_nilpotent` (computation): For Φ_t=θI_2+[[0,1],[0,0]], the nilpotent part squares to zero and is allowed.

- `TModule_test_semisimple_differential` (non-example): A diagonal differential diag(θ,θ+1) fails the nilpotence condition.

- `TModule_test_nonabelian` (non-example): The scalar action Φ_t=θI_d is a t-module but, for d>0, its row motive is not finite over L[t].


Acceptance: Rank-one Drinfeld modules are dimension-one Anderson modules, while motive rank need not equal dimension.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `mathlib:Module.End`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Definition 1.2, pp. 3–4; §3 and Remark 3.3, pp. 7–8. The relative definition records the nilpotent differential and abelianness; the coordinate motive is a row module.


### Effective A-motives

Target `DrinfeldModulesAndTModules:DM.4/effective-a-motive` (definition). Put A_R=A⊗F R, σ=id_A⊗Frob_q,R and J=ker(A_R→R, a⊗b↦γ(a)b). An effective A-motive of rank r and dimension d is a finite projective A_R-module M of rank r with an injective A_R-linear map τ_M:σ* M→M whose cokernel is locally free of rank d over R and killed by some power of J. Here σ*M=M⊗_(A_R,σ) A_R. Morphisms are A_R-linear maps commuting with this linearized Frobenius. For polynomial A over a field, coker dimension is d and (t−θ)^n kills it for some n; d also bounds a nilpotence exponent. No perfection of R is required.

Hypotheses: A as in DM.0; commutative F-algebra R and characteristic map γ; locally constant r,d.

Construction or proof route:


1. Define scalar extension along σ with native tensor products and its linearized map.

2. Form the module cokernel and support at J.

3. Over nonreduced or imperfect coefficients use linearization, not the raw semilinear image; scalar extension is essential.


API uses:


- DM.4: Contravariant anti-equivalence.

- DM.5: Rational motive category and Tate realizations.

- DM.1 and DM.7: Characteristic completion and torsion comparisons.


Proposed declarations:


- `EffectiveAMotive` (constructor): Finite projective M with τ_M:σ*M→M and the specified cokernel.

- `EffectiveAMotive.rank` (data): The A_R-module rank.

- `EffectiveAMotive.dimension` (data): The R-rank of coker τ_M.

- `EffectiveAMotive.baseChange` (functoriality): Coefficient extension carries the linearized Frobenius and its support ideal.

- `EffectiveAMotive.matrix` (compatibility): For free L[t]^r, a matrix Θ with det Θ=c(t−θ)^d, c∈L×, gives rank r and dimension d; the cokernel nilpotence must be checked.


Unit tests:


- `EffectiveAMotive_test_carlitz` (computation): For M=L[t], τ_M is multiplication by t−θ after q-coefficient twist; rank=dimension=1.

- `EffectiveAMotive_test_tensor` (computation): Multiplication by (t−θ)^n on rank-one L[t] has dimension n.

- `EffectiveAMotive_test_support` (non-example): Multiplication by t−b with b≠θ has cokernel at the wrong characteristic point.

- `EffectiveAMotive_test_linearization` (non-example): Over an imperfect L, the set of values of the raw q-semilinear τ need not be an L-submodule and cannot be used directly as its module cokernel.


Acceptance: The Frobenius fixes A and raises only coefficient-ring elements to q-th powers.


Direct prerequisites: `FunctionFieldArithmetic:FA.1`, `mathlib:Module.End`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Definition 2.1 and Proposition 2.3, pp. 5–6. Finite projectivity, the linearized map and relative cokernel distinguish effective motives from arbitrary difference modules.


### The contravariant motive functor

Target `DrinfeldModulesAndTModules:DM.4/contravariant-motive` (construction). For an Anderson A-module E/R, set M(E)=Hom_(F-module schemes/R)(E,G_a,R). A acts by precomposition with φ_a and R acts by postcomposition with scalars; τ acts by postcomposition with q-Frobenius. When E is coordinate G_a^d this is the row module R{τ}^{1×d}. For a morphism f:E→E′, M(f):M(E′)→M(E) is precomposition by f. If E is abelian of rank r and dimension d, this is an effective A-motive and coker τ_M≅Hom_R(Lie E,R).

Hypotheses: The relative abelianness condition for the effective-motive conclusion; coordinate description valid without it.

Construction or proof route:


1. Entrywise FF.4 gives the row representation.

2. The A-action is right composition with φ_a and commutes with left τ and R.

3. Differentiation kills the linearized τ-image, producing the Lie-dual quotient.

4. Finite projectivity and support at J follow from abelianness and the nilpotent differential.


API uses:


- DM.4: Recovering the Anderson module.

- DM.5 and DM.7: Transports Hom and realization comparisons.


Proposed declarations:


- `TModule.motive` (constructor): M(Φ)=L{τ}^{1×d} with right-composition t-action.

- `TModule.motiveMap` (functoriality): For U:Φ→Ψ, M(U):M(Ψ)→M(Φ), m↦mU.

- `TModule.motiveMap_comp` (structure): M(VU)=M(U)∘M(V).

- `TModule.motiveLieDual` (compatibility): coker τ_M≅(Lie Φ)∨ in the abelian range.


Unit tests:


- `motive_test_carlitz` (computation): With generator 1, the Carlitz relation is τ·1=(t−θ)·1.

- `motive_test_variance` (non-example): A map Φ→Ψ produces a map M(Ψ)→M(Φ), not one in the original direction.

- `motive_test_dimension_rank` (computation): The n-th Carlitz tensor power has motive rank one and Lie-dual quotient dimension n.

- `motive_test_scalar_not_finite` (non-example): For Φ_t=θ on G_a, each τ^i is a t-eigenvector of eigenvalue θ^(q^i); the row motive is not finitely generated over L[t].


Acceptance: An intertwiner U is sent to right multiplication by U on row motives.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/t-module`, `DrinfeldModulesAndTModules:DM.4/effective-a-motive`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Remark 3.3 and Theorem 3.5 with proof, pp. 7–9. Precomposition makes the functor contravariant; the explicit proof fixes the source display’s reversed Hom convention.


### The abelian Anderson anti-equivalence

Target `DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence` (theorem). The contravariant functor E↦M(E) is fully faithful from abelian Anderson A-modules over R to effective A-motives. Its essential image consists exactly of effective motives that become finite free left R′{τ}-modules after a faithfully flat coefficient extension R→R′. Rank over A_R is the Anderson rank, and coker τ_M has R-rank equal to the group dimension. For polynomial A over a field, the corresponding category is effective L[t]-motives finite free over L{τ}; this is not the category of all effective A-motives.

Hypotheses: Same coefficient algebra and characteristic; abelianness and fpqc-local Ore freeness; no generic-characteristic assumption in the relative theorem.

Construction or proof route:


1. Choose an Ore basis after faithfully flat extension.

2. Right matrices for the A-action reconstruct φ; the cokernel condition gives its nilpotent differential.

3. Intertwiner matrices identify Hom in the reversed direction.

4. Use effective fpqc descent of affine groups and morphisms to descend the reconstructed object.


Acceptance: The n-th Carlitz tensor motive reconstructs an n-dimensional t-module. A general effective motive without local Ore freeness is not assigned an Anderson module.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/contravariant-motive`, `DrinfeldModulesAndTModules:DM.4/effective-a-motive`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), Theorem 3.5 and proof, pp. 8–9. The theorem gives full faithfulness and the precise fpqc-local Ore-free essential image.


### Purity of polynomial-ring motives

Target `DrinfeldModulesAndTModules:DM.4/purity` (definition). For an abelian t-motive M of rank r over L[t], extend it to L((1/t)). It is pure if there are positive integers u,v and an L[[1/t]]-lattice H of rank r such that t^uH=τ^vH, interpreted via v-fold linearized coefficient Frobenius. The weight is u/v, independent of this choice, and equals d/r for a nonzero pure effective motive of dimension d. Purity is additional data/property, not part of the definition of every t-module or every effective motive.

Hypotheses: Polynomial A; pure effective finite-rank motive; the positive-dimension weight statement is in this range. The raw Frobenius-image lattice formulation in the Suggested coordinate model uses perfect L; over imperfect coefficients use the linearized scalar-pullback formulation, not an unlinearized image.

Construction or proof route:


1. Specify the infinity lattice and iterate of the linearized map.

2. Compare determinants of τ^v on the lattice to identify u/v=d/r.

3. A common iterate compares two choices and proves weight independence.


API uses:


- DM.4: Distinguishes eligible analytic motives.

- DM.8: Purity hypotheses must be retained when a period theorem uses them.


Proposed declarations:


- `EffectiveTMotive.isPure` (characterisation): Existence of an infinity lattice with t^uH=τ^vH.

- `EffectiveTMotive.weight` (data): The rational u/v for a pure motive.

- `EffectiveTMotive.weight_eq` (compatibility): For a pure effective nonzero motive, weight=d/r.

- `EffectiveTMotive.pureTensor` (functoriality): Tensor products of pure motives are pure with weights added.


Unit tests:


- `purity_test_carlitz` (computation): Carlitz has r=d=1 and weight one.

- `purity_test_tensor_power` (computation): The n-th Carlitz tensor power has r=1,d=n and weight n.

- `purity_test_mixed` (non-example): The direct sum of Carlitz and its second tensor power has different slopes one and two and is not pure.


Acceptance: Carlitz tensor power n has weight n, not 1/n.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/effective-a-motive`, `DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence`, `FunctionFieldArithmetic:FA.2`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §4.1, p. 15. Purity uses a Frobenius-stable infinity lattice and fixes the rank/dimension weight convention.


### Uniformizable t-modules

Target `DrinfeldModulesAndTModules:DM.4/uniformizability` (definition). For an abelian t-module E over C_∞ with differential θI+N, its unique normalized entire exponential exp_E:C_∞^d→E(C_∞) intertwines dΦ_t with Φ_t. Uniformizable means this map is surjective. Its kernel Λ_E is discrete and carries the differential A-action. Export this predicate and the exponential to DM.8, whose rigid-triviality comparison identifies it with analytic triviality under the abelian hypotheses. The rigid predicate and its comparison are owned by DM.8; they are not prerequisites for defining exp_E or uniformizability here.

Hypotheses: C_∞; abelian t-module, generic characteristic, exact analytic hypotheses of the selected theorem.

Construction or proof route:


1. Solve the matrix coefficient recurrence; the nilpotent differential gives unique coefficients and infinite radius.

2. Form the kernel and the surjectivity predicate using the actual exponential map.

3. Export the normalized exponential, its kernel and the surjectivity predicate to the DM.8 rigid-triviality comparison; its proof is the consumer’s responsibility. No circular prerequisite on that comparison is introduced.


API uses:


- DM.4: Uniformization of Carlitz tensor powers.

- DM.8: Eligibility for period and logarithm statements.


Proposed declarations:


- `TModule.exp` (constructor): The normalized entire differential-intertwining exponential.

- `TModule.exp_functionalEquation` (relation): exp_E(dΦ_t z)=Φ_t(exp_E z).

- `TModule.isUniformizable` (characterisation): Function.Surjective exp_E.

- `TModule.periodLattice` (data): ker exp_E with the differential A-action.


Unit tests:


- `uniformizable_test_drinfeld` (compatibility): For d=1 and a Drinfeld module over C_∞, the exponential and lattice agree with DM.2.

- `uniformizable_test_tensor_power` (computation): Every positive Carlitz tensor power is uniformizable.

- `uniformizable_test_predicate` (non-example): For an object whose exponential image is a proper subgroup, the surjectivity predicate is false even if its exponential is entire.


Acceptance: Every field Drinfeld module in DM.2 is uniformizable, but the definition for general t-modules retains surjectivity as a condition.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/c-infinity`, `DrinfeldModulesAndTModules:DM.4/t-module`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §3.1, pp. 8–10; Theorem 4.2, §4.1, p. 16. The source makes surjectivity a separate property and states the analytic triviality equivalence in the abelian setting.


### Carlitz tensor powers

Target `DrinfeldModulesAndTModules:DM.4/carlitz-tensor-power` (construction). For n≥1 define C^⊗n on G_a^n by Φ_t=θI_n+N_n+E_(n,1)τ, where N_n has ones on the superdiagonal. It is abelian, uniformizable and pure. Its contravariant motive is free of rank one over L[t], with τ m=(t−θ)^n m; its group dimension is n and motive rank is one. Under tensor products of motives, these rank-one motives multiply their exponents.

Hypotheses: n≥1; θ generic and coefficient extension to C_∞ for uniformizability.

Construction or proof route:


1. Construct the nilpotent matrix and its bottom-left Frobenius term.

2. Use the row-generator relations to compute the cyclic L[t]-motive and its cokernel.

3. The infinity-lattice relation gives purity and weight n; analytic trivialization imports the Carlitz Ω supplier to show uniformizability.


API uses:


- DM.4: Checks motive and dual conventions.

- DM.8: Period matrix Ω^n and positive-characteristic special values.


Proposed declarations:


- `carlitzTensor` (constructor): The n-dimensional matrix t-module.

- `carlitzTensor_differential` (simp): dΦ_t=θI+N_n, with N_n^n=0.

- `carlitzTensor_motive` (compatibility): M(C^⊗n)≅L[t], τ m=(t−θ)^n m.

- `carlitzTensor_rank_dimension` (data): Motive rank one and dimension n.


Unit tests:


- `carlitzTensor_test_one` (compatibility): n=1 is the Carlitz module.

- `carlitzTensor_test_two` (computation): For n=2, t·(x,y)=(θx+y,θy+x^q).

- `carlitzTensor_test_rank` (non-example): For n=2 the motive rank is one, not two, while its τ-cokernel has L-dimension two.


Acceptance: At n=1 recover θ+τ.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/contravariant-motive`, `DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence`, `DrinfeldModulesAndTModules:DM.4/purity`, `DrinfeldModulesAndTModules:DM.4/uniformizability`, `DrinfeldModulesAndTModules:DM.2/omega`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §3.3, pp. 10–11; §4.3, pp. 16–17. The matrix has nilpotent superdiagonal and bottom-left τ, and the motive has rank one.


### Effective dual t-motives

Target `DrinfeldModulesAndTModules:DM.4/inverse-twist-dual-motive` (definition). Over a perfect coefficient field L containing F, let L[t,σ] have σc=c^(1/q)σ and σt=tσ. An effective dual t-motive is a finite free L[t]-module H with inverse-q-semilinear σ and (t−θ)^ℓ(H/σH)=0 for some ℓ≥0; the image here is an L[t]-submodule because L is perfect. In the finite-dimensional t-module correspondence also require H finite free over L[σ], of rank d; call that condition A-finiteness on the dual side. These two versions are distinguished explicitly. The Ngo Dac source uses the first, broader effective definition.

Hypotheses: L perfect; generic θ in period applications; the L[σ]-freeness condition is not silently added to Ngo Dac Definition 4.1.

Construction or proof route:


1. Import inverse coefficient twisting from DM.8.

2. Define the Ore module with variable t fixed by the twist.

3. Use its σ-cokernel to express characteristic support; maintain the stronger Ore-freeness eligibility as a separate condition.


API uses:


- DM.4: The star adapter and point realization.

- DM.8 and characteristic-p multiple-zeta consumers: Difference equations with the Ngo Dac σ convention.


Proposed declarations:


- `EffectiveDualTMotive` (constructor): Finite free L[t]-module H with inverse-twist σ and characteristic-supported quotient.

- `EffectiveDualTMotive.matrix` (projection): In a basis, σh=Φh with inverse coefficient twist.

- `EffectiveDualTMotive.isAFinite` (characterisation): The corresponding row Ore module is finite free over L[σ].

- `EffectiveDualTMotive.baseChange` (functoriality): Perfect coefficient extension preserves the defining matrix and support condition.


Unit tests:


- `dualMotive_test_carlitz` (computation): For H=L[t], σh=(t−θ)h, the quotient has dimension one.

- `dualMotive_test_tensor` (computation): σh=(t−θ)^n h gives rank one and quotient dimension n.

- `dualMotive_test_twist` (non-example): Using q-th coefficient powers instead of q-th roots changes σc=c^(1/q)σ and fails the inverse-twist relation.


Acceptance: A rank-one Carlitz dual motive has σh=(t−θ)^n h.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/effective-a-motive`, `DrinfeldModulesAndTModules:DM.8/coefficient-twist`.


Sources: [NGODAC-2021](https://hal.science/hal-03298790/document), Definition 4.1 and §4.1, pp. 16–17. The effective definition fixes σ-direction and characteristic support, without requiring L[σ]-freeness.


### The star anti-isomorphism

Target `DrinfeldModulesAndTModules:DM.4/star-adapter` (construction). For a scalar Ore polynomial f=Σ a_iτ^i set f*=Σ a_i^(1/q^i)σ^i. Then (fg)*=g*f*. For matrices also transpose: (U*)_(ij)=(U_(ji))* so that (UV)*=V*U*. Given a coordinate t-module Φ, its row dual motive is L[σ]^{1×d} with t acting on the right by Φ_t*. An intertwiner U:Φ→Ψ induces h↦hU* from the row module for Φ to that for Ψ, so this dual construction is covariant. Finite freeness over L[t] is a separate A-finiteness hypothesis.

Hypotheses: L perfect; fixed q; coordinate t-modules; matrix sizes match.

Construction or proof route:


1. Check σc=c^(1/q)σ on scalar monomials.

2. Extend additively and reverse multiplication; transpose accounts for matrix order.

3. Apply the operation to UΦ_t=Ψ_tU and derive the dual right-module intertwiner.


API uses:


- DM.4: Covariant dual motive and point realization.

- DM.8: Reconciles σ- and τ-matrix equations without changing conventions.


Proposed declarations:


- `oreStar` (constructor): Σ a_iτ^i↦Σ a_i^(1/q^i)σ^i.

- `oreStar_mul` (relation): oreStar(fg)=oreStar(g)oreStar(f).

- `matrixOreStar` (constructor): Entrywise star followed by transpose.

- `TModule.dualMotive` (constructor): The row L[σ]-module with t acting by Φ_t*.

- `TModule.dualMotiveMap` (functoriality): U induces right multiplication by U*, in the same direction on t-modules.


Unit tests:


- `oreStar_test_scalar` (degenerate): (Cc)*=Cc.

- `oreStar_test_monomial` (computation): (aτ²)*=a^(1/q²)σ².

- `oreStar_test_order` (non-example): (τ·a)*=aσ, whereas τ* a*=σa=a^(1/q)σ; multiplication order must reverse.

- `oreStar_test_matrix` (compatibility): A d′×d intertwiner becomes a d×d′ matrix after star-transpose.


Acceptance: The scalar polynomial θ+τ has star θ+σ.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/t-module`, `DrinfeldModulesAndTModules:DM.4/inverse-twist-dual-motive`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `DrinfeldModulesAndTModules:DM.8/coefficient-twist`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), §4.4, pp. 17–18. The star operation relates τ-polynomial t-modules and σ-polynomial dual motives; abelian and A-finite conditions are distinguished.


### Dual motives and t-module points

Target `DrinfeldModulesAndTModules:DM.4/dual-realization` (comparison). For the row dual module H=L[σ]^{1×d} associated to Φ over a perfect field, define δ₁(Σ h_iσ^i)=Σ h_i^(q^i) coordinatewise. It induces an F-linear A-module isomorphism H/(σ−1)H≅E(L), with the t-action inherited from Φ_t*. The denominator means the F-linear image of σ−1, not an L-linear submodule. For an effective dual motive finite free over both L[t] and L[σ], this reconstructs its A-finite t-module; over perfect L this is abelian as well: Maurischat Theorem 6.6 proves abelian iff A-finite, and Corollary 8.1 extends this equivalence to Anderson A-modules by restriction along a finite extension A/F[t]. This theorem concerns finite generation of the motive of an actual Anderson module; it does not add Ore-finiteness to the broader effective dual-motive definition.

Hypotheses: Perfect L; finite Ore rank d; use A-finiteness for a finite L[t]-rank dual motive.

Construction or proof route:


1. Reduce σ-degree using (σ−1) and inverse coefficient twist.

2. δ₁ is zero on this image and each row has a unique constant representative in the quotient.

3. The star relation identifies the t-action with the original coordinate action.

4. For a matrix D defining Φ_t, use the left and right block-power rank criteria of Propositions 6.4 and 6.5. Theorem 4.1 identifies both criteria with positive slopes of the last invariant factor of tI−D over the complete valued skew field L({σ}); Proposition 6.1 turns either criterion into both finite-generation conclusions. This Laurent σ=τ⁻¹ convention is distinct from the literal star dual module.

5. For general A choose a nonconstant t by Riemann–Roch; A is finite over F[t], so finite generation over A⊗F L is equivalent to finite generation over L[t]. Retain perfect coefficients; no relative nonperfect-base theorem is asserted.


Acceptance: For H=L[t], σh=(t−θ)h, the quotient realizes Carlitz points; using an L-linear quotient destroys the point action.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/star-adapter`, `DrinfeldModulesAndTModules:DM.4/inverse-twist-dual-motive`, `FiniteFieldsAndCharacterSums:FF.4`, `FunctionFieldArithmetic:FA.1`.


Sources: [BP-RAPID](https://arxiv.org/pdf/1806.03919v1), Theorem 4.3, §4.4, p. 18; §4.5, pp. 18–19. The δ₁ quotient uses Frobenius-adjusted coefficients and only F-linearity. [MAURISCHAT-2026](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf), Theorem 6.6 and proof, pp. 34–35; Corollary 8.1 and proof, p. 43. Over a perfect field, finite generation of the motive and dual motive are equivalent, including general A by finite coefficient restriction.


## DM.5. The integral and rational Tate theorem

The integral Tate Hom map is separated from rational full faithfulness. The inspected proof factors coefficient extension through a rational local coefficient algebra and then through the full completed algebra. The period ring supplies the second algebraization step; integral saturation remains an explicit proof input.



### Rational motives and their Tate realization

Target `DrinfeldModulesAndTModules:DM.5/rational-motive-realization` (construction). Let K_0=Frac(A) and L a coefficient field with fixed γ. Rationalize the effective A-motive category by Hom⁰(M,N)=K_0⊗A Hom(M,N). For λ≠ker γ put L_(λ)=Frac((F_λ⊗F L)[[z]]) after a residue-field splitting, where F_λ=A/λ and z is a local parameter. Complete M to this coefficient ring and take τ-invariants after L→L^sep; this gives its rational Tate realization V_λ(M) over K_0,λ. For a Drinfeld module E, V_λ(E) is canonically dual to V_λ(M(E)); the dual changes the motive’s Hom direction back to the group’s direction. The precise finite-level pairing is supplied by the finite-shtuka realization.

Hypotheses: Effective finite-rank motives with characteristic λ avoided; splitting factors are retained, not discarded.

Construction or proof route:


1. Localize Hom at nonzero elements of A and prove well-defined composition.

2. Complete the module and its linearized Frobenius; it is invertible at λ.

3. Use finite-shtuka pairing and passage to inverse limits for the dual identification.


API uses:


- DM.5: The Tate comparison and semisimplicity proof route.


Proposed declarations:


- `AMotive.HomIsogeny` (constructor): K_0⊗A Hom(M,N).

- `AMotive.rationalTate` (constructor): The completed τ-fixed rational realization.

- `AMotive.rationalTateMap` (functoriality): A motive morphism acts covariantly on τ-invariants.

- `DrinfeldModule.motiveTateDual` (compatibility): V_λ(E)≅V_λ(M(E))∨ with equivariant finite-level pairing.


Unit tests:


- `rationalMotive_test_identity` (degenerate): The identity motive morphism realizes as the identity.

- `rationalMotive_test_isogeny` (compatibility): A nonzero Drinfeld isogeny becomes an isomorphism after rationalization.

- `rationalMotive_test_carlitz_dual` (non-example): The rank-one Carlitz motive realization has inverse character to the Carlitz point realization; identifying them without dualization reverses the Galois character.


Acceptance: Dualizing twice restores the Drinfeld Hom direction.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/effective-a-motive`, `DrinfeldModulesAndTModules:DM.4/contravariant-motive`, `DrinfeldModulesAndTModules:DM.1/tate-module`, `SchemeAndStackFoundations:SF.2`, `FunctionFieldArithmetic:FA.2`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Definitions 2.1–2.2, pp. 5–6; Definitions 2.26 and Proposition 2.28, pp. 12–14; Proposition 4.7, pp. 24–25. The rational motive category and its completed Frobenius realization fix the coefficient rings. The Drinfeld point duality is read with Hartl §6.


### The Tate Hom map

Target `DrinfeldModulesAndTModules:DM.5/tate-hom-map` (construction). For Drinfeld modules E,E′ over the same (L,γ) and λ≠ker γ, define α_λ:A_λ⊗A Hom_L(E,E′)→Hom_(A_λ,G_L)(T_λE,T_λE′) by b⊗u↦b·T_λu. It is A_λ-linear, commutes with composition and identities, and becomes the corresponding K_0,λ-linear rational comparison after inverting λ. It is defined over any coefficient field, but the Tate isomorphism below requires finite generation over F.

Hypotheses: Same characteristic map and nonzero finite prime away from it; no finite-generation hypothesis needed just to define α.

Construction or proof route:


1. Use the torsion-induced maps of DM.1.

2. Bilinearity gives the tensor-product lift.

3. Equivariance and composition hold at every finite level and hence in the limit.


API uses:


- DM.5: Injectivity, saturation and Tate surjectivity.


Proposed declarations:


- `DrinfeldModule.tateHomMap` (constructor): α_λ(b⊗u)=b T_λu.

- `DrinfeldModule.tateHomMap_pure` (simp): The image of 1⊗u is T_λu.

- `DrinfeldModule.tateHomMap_comp` (functoriality): The comparison respects composition.

- `DrinfeldModule.tateHomMap_rational` (compatibility): Scalar extension to K_0,λ is the rational comparison.


Unit tests:


- `tateHom_test_identity` (degenerate): α_λ(1⊗id)=id.

- `tateHom_test_scalar` (computation): For a∈A, α_λ(1⊗φ_a)=a·id.

- `tateHom_test_extra_endomorphisms` (non-example): For φ_t=τ² over F_{q²}, λ=(t−1), both τ and F_{q²} scalars are endomorphisms; the domain is not assumed cyclic over A.


Acceptance: For a scalar a∈A the induced action is multiplication by a.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.1/tate-module`, `DrinfeldModulesAndTModules:DM.1/continuous-galois-action`, `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Proposition 5.16, p. 34. The integral and rational Hom maps are the natural realization maps, under the selected fixed-characteristic hypotheses.


### Injectivity of the Tate comparison

Target `DrinfeldModulesAndTModules:DM.5/tate-injectivity` (theorem). The natural integral Tate comparison α_λ is injective for field Drinfeld modules with λ away from characteristic. In particular a morphism acting as zero on every λ-power torsion scheme is zero. The tensor statement uses finite torsion-freeness of the Hom A-module, not only pointwise injectivity of u↦T_λu.

Hypotheses: The field, characteristic and prime hypotheses of tate-hom-map.

Construction or proof route:


1. A nonzero q-polynomial cannot kill torsion of unbounded scheme order.

2. Boundedness and lattice arguments make Hom a finite torsion-free A-module.

3. If a completion-linear combination acts trivially, reduce modulo λ^n and use λ-divisibility of Hom: vanishing on E[λ^n] implies factorization through the ideal isogeny. This integral division input is recorded with tate-image-saturation.


Acceptance: Any nonzero scalar endomorphism induces a nonzero Tate map.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.5/tate-hom-map`, `DrinfeldModulesAndTModules:DM.0/kernel-scheme`, `DrinfeldModulesAndTModules:DM.1/geometric-torsion-basis`, `DrinfeldModulesAndTModules:DM.5/tate-image-saturation`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Proposition 2.28, pp. 12–14. Faithful integral and rational realizations and finite Hom bounds. [PAPIKIAN-2017](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf), §3.1, pp. 10–12. The Drinfeld Tate map and its injectivity route in the public lecture notes.


### Local algebraization of motive maps

Target `DrinfeldModulesAndTModules:DM.5/local-algebraization` (theorem). Let L be finitely generated over F. Put K_0,L=Frac(K_0⊗F L), K_0,λ,L=Frac(K_0,λ⊗F L), and L_(λ)=Frac((F_λ⊗F L)[[z]]). A restricted module means a finite projective module with invertible Frobenius linearization; at λ it has a finite-projective integral lattice with invertible Frobenius. Extension K_0,L→K_0,λ,L is K_0,λ/K_0-fully faithful on such modules and preserves semisimple objects. Extension K_0,λ,L→L_(λ) is fully faithful on the λ-restricted objects and preserves semisimple objects. Thus completed Frobenius-equivariant maps are algebraized over the rational coefficient ring. The first ring is not the full completed Laurent-series ring unless L is finite.

Hypotheses: Finitely generated coefficient field L, hence finitely many roots of unity; K_0,λ/K_0 separable; the λ-restricted integral model condition is explicit.

Construction or proof route:


1. For scalar extension, reduce to finite and one-variable transcendental extensions; Frobenius-fixed denominators descend to the constant field.

2. Prove separability of the function-field completion by a separating local parameter.

3. Use the period ring and its two fixed-ring identities to construct a full faithful left-adjoint realization functor.

4. Every invariant subobject is quasigeometric; the descended lattice supplies the λ-restricted condition.


Acceptance: When L is finite the two local coefficient rings agree; for positive transcendence degree they need not.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.5/period-ring`, `DrinfeldModulesAndTModules:DM.5/rational-motive-realization`, `FunctionFieldArithmetic:FA.2`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Theorem 3.11 with proof, pp. 18–21; Theorem 4.8 and Proposition 4.9, pp. 25–26; Theorem 5.15, p. 33. The two scalar extensions separate constant completion from coefficient completion, and each has its own full-faithfulness argument.


### The Tate period ring

Target `DrinfeldModulesAndTModules:DM.5/period-ring` (construction). For finitely generated L/F choose a proper normal F-model X of its function field and compatible extensions of each prime-divisor valuation to L^sep. Inside L_(λ)^sep, let B⁺ be the Laurent series whose coefficients have valuation bounded below at every compatible prime divisor and are integral outside a finite set of divisors of X. Let S consist of invertible integral local series s with σ(s)/s∈K_0,λ⊗F L. Set B=B⁺[S⁻¹]. It has B^σ=K_0,λ and B^G_L=K_0,λ,L, contains every τ-fixed solution of a λ-restricted finite-rank system, and yields B⊗_(K_0,λ) V_λ(M)≅B⊗_(K_0,λ,L)M. Full completion cannot replace B in the algebraization argument.

Hypotheses: L finitely generated over F; normal proper model; valuation extensions normalized by ramification; finite residue factors retained; σ is q-coefficient Frobenius fixing z.

Construction or proof route:


1. Use finite-dimensionality of bounded-divisor global sections to control coefficient sets.

2. Construct integral Frobenius units and invert them; the formal functional equations move all solutions into B.

3. Prove the σ-fixed and Galois-fixed ring identities before applying invariant tensor arguments.

4. The semilinear fixed-vector basis gives the comparison isomorphism. The construction and properties are proved in Stalder §6, not posited as fields in a structure.


API uses:


- DM.5: The second local scalar extension and Tate surjectivity.


Proposed declarations:


- `TatePeriodRing` (constructor): The valuation-bounded ring B⁺ localized at the specified Frobenius units.

- `TatePeriodRing.sigmaFixed` (characterisation): B^σ=K_0,λ.

- `TatePeriodRing.galoisFixed` (characterisation): B^G_L=K_0,λ,L.

- `TatePeriodRing.comparison` (equivalence): B⊗V_λ(M)≅B⊗M for λ-restricted systems.


Unit tests:


- `TatePeriodRing_test_constants` (compatibility): The scalar K_0,λ embeds into B and is σ-fixed.

- `TatePeriodRing_test_galois` (non-example): The fixed ring is K_0,λ,L, not all of L_(λ), when L has positive transcendence degree.

- `TatePeriodRing_test_solution` (characterisation): Every coordinate of a τ-fixed basis vector for a λ-restricted system lies in B.


Acceptance: The Galois-fixed ring is the rational coefficient ring K_0,λ,L, not the larger completed ring L_(λ).


Direct prerequisites: `DrinfeldModulesAndTModules:DM.5/rational-motive-realization`, `FunctionFieldArithmetic:FA.2`, `SchemeAndStackFoundations:SF.0`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Claim 5.2 and Proposition 5.5, pp. 27–28; Definitions 6.1 and 6.12, pp. 35 and 38–39; Propositions 6.14 and 6.21, pp. 40 and 43; Theorem 6.23, p. 43. The valuation-defined subring provides both exact fixed rings and contains the Frobenius solutions.


### Integral Hom division and saturation

Target `DrinfeldModulesAndTModules:DM.5/tate-image-saturation` (theorem). For E,E′ over the same coefficient field and λ away from characteristic, the image of A_λ⊗A Hom_L(E,E′) in Hom_(A_λ,G_L)(T_λE,T_λE′) is saturated. Equivalently, if z·h is in the image for a local uniformizer z and h is an integral equivariant Tate map, then h is in the image. Prove this by finite-level kernel factorization/divisibility of algebraic intertwiners, using descent of the quotient isogeny. Rational surjectivity alone does not prove this assertion.

Hypotheses: Same characteristic; prime-to-characteristic torsion; finite-projective Hom; local uniformizer chosen only in the completed DVR.

Construction or proof route:


1. If a morphism kills a finite ideal-torsion subgroup, factor it through the corresponding quotient Drinfeld module.

2. Translate divisibility in the completed Hom lattice to the corresponding λ-adic torsion kernels, without assuming λ principal in A.

3. Use inverse-limit completeness to identify the full integral lattice. The selected Tate source invokes saturation without proof; this exact input is a recorded gap.


Acceptance: For a rank-one Carlitz module the completed endomorphism lattice is A_λ, so division by λ is visible directly.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom`, `DrinfeldModulesAndTModules:DM.1/ideal-torsion`, `DrinfeldModulesAndTModules:DM.1/etale-torsion`, `DrinfeldModulesAndTModules:DM.5/tate-hom-map`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Proposition 5.16(a) and proof, p. 34. The source passes from rational to integral Hom using a saturation statement it calls known but does not prove.


### The Drinfeld Tate theorem

Target `DrinfeldModulesAndTModules:DM.5/tate-surjectivity` (theorem). Let L be finitely generated over F, let E,E′ be Drinfeld A-modules over the same (L,γ), and let λ≠ker γ. The comparison α_λ:A_λ⊗A Hom_L(E,E′)→Hom_(A_λ,G_L)(T_λE,T_λE′) is an isomorphism. Inverting λ yields the rational version. The theorem allows both generic and special characteristic; it does not permit different characteristic maps, an algebraically closed infinite coefficient field in place of a finitely generated one, or λ equal to the characteristic.

Hypotheses: Exact fixed-characteristic and finitely generated coefficient-field hypotheses.

Construction or proof route:


1. Pass contravariantly to effective motives and dualize their Tate realizations.

2. Apply local-algebraization to the rational motive Hom category, whose embedding is fully faithful after coefficient localization.

3. Combine rational bijectivity with integral injectivity and tate-image-saturation.

4. The integral last step remains a named proof input; neither the rational theorem nor Tamagawa’s earlier sketch supplies it by itself.


Acceptance: For a finite coefficient field, equivariant endomorphisms are the centralizer of arithmetic Frobenius on T_λE. For φ_t=τ² over F_{q²}, the Tate centralizer must retain its extra endomorphisms, not be forced to dimension one.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.5/rational-motive-realization`, `DrinfeldModulesAndTModules:DM.5/local-algebraization`, `DrinfeldModulesAndTModules:DM.5/tate-injectivity`, `DrinfeldModulesAndTModules:DM.5/tate-image-saturation`, `DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Proposition 5.16(a,b) and proof, p. 34; Proposition 4.2, pp. 21–22; Theorem 5.15, p. 33. This public source treats finitely generated coefficient fields of arbitrary transcendence degree; its integral saturation step is kept explicit.


### Semisimplicity of rational Tate representations

Target `DrinfeldModulesAndTModules:DM.5/tate-semisimplicity` (theorem). For finitely generated L/F and λ away from characteristic, the rational Tate realization of a semisimple A-isomotive is a semisimple K_0,λ-representation of G_L. In particular the rational Tate representation of every Drinfeld module is semisimple. The latter uses the separate fact that a Drinfeld motive is simple in the rational motive category; a general effective Anderson motive is not assumed semisimple.

Hypotheses: Finitely generated L; fixed characteristic avoided by λ; motive semisimplicity for the general version.

Construction or proof route:


1. The rational motive category embeds faithfully in restricted Frobenius modules and preserves semisimplicity.

2. Each of the two local scalar extensions preserves semisimple objects by local-algebraization.

3. The local Frobenius/Galois equivalence transfers semisimplicity to the representation.

4. The Drinfeld-motive simplicity proof, derived from its Ore-module rank-one presentation and degree, is a precise remaining source input. Duality preserves the semisimplicity of the Drinfeld point realization.


Acceptance: A representation with a nonzero nilpotent Jordan extension is not semisimple merely because it is a Tate realization of some effective motive.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.5/local-algebraization`, `DrinfeldModulesAndTModules:DM.5/rational-motive-realization`, `DrinfeldModulesAndTModules:DM.4/contravariant-motive`.


Sources: [STALDER-2008](https://arxiv.org/pdf/0809.0224v1), Theorem 1.1, pp. 2–3 and proof, pp. 33–34; Proposition 4.2, pp. 21–22. The theorem assumes a semisimple A-isomotive; its Drinfeld consequence also needs simplicity of the associated motive.


## DM.6. Euler values, regulators and Taelman class modules

The Laurent-series Euler product belongs to a chosen integral model over the integral closure of F[θ]. Its exponential unit lattice and finite class module both occur in the determinant formula. A scaled Carlitz model with nonzero class module checks the class factor.



### Monic module cardinalities

Target `DrinfeldModulesAndTModules:DM.6/fitting-polynomial` (definition). For a finite-dimensional F-vector space M with A=F[t]-action, define |M|=det_(F[T])(T−t_M), equivalently the unique monic generator of Fitt_0(M) after renaming t as T. This is a polynomial, not the integer cardinality. It is multiplicative in short exact sequences; |0|=1 and #M=q^(deg |M|). The variable T is kept distinct from the coefficient θ used in the integral model.

Hypotheses: F finite; M finite as a set, with an F[t]-module structure.

Construction or proof route:


1. Use the native determinant of the t-endomorphism and its characteristic polynomial.

2. Import the current Tau Ceti fittingIdeal and its presentation/base-change API cited by the existing IntegralHeckeAndGaloisDeterminants roadmap, then use rational canonical decomposition over F[t] to compare its monic generator with the characteristic polynomial. Fitting ideals themselves are not planned here.

3. Block-triangular determinants prove exact-sequence multiplicativity.


API uses:


- DM.6: Local Euler factors, covolumes, determinants and the class formula.


Proposed declarations:


- `finiteModuleCardinality` (constructor): det(T−t_M).

- `finiteModuleCardinality_zero` (simp): |0|=1.

- `finiteModuleCardinality_exact` (structure): For 0→M′→M→M″→0, |M|=|M′||M″|.

- `finiteModuleCardinality_fitting` (compatibility): The ideal generated by |M| is Fitt_0(M), under t↦T.


Unit tests:


- `cardinality_test_cyclic` (computation): For M=F[t]/(t²+t+1), |M|=T²+T+1.

- `cardinality_test_zero` (degenerate): The zero module has |0|=1, not zero.

- `cardinality_test_integer` (non-example): For M=F[t]/(t), |M|=T whereas #M=q; these are different invariants.


Acceptance: F[t]/(a) has cardinality polynomial a(T) when a is monic.


Direct prerequisites: `mathlib:Module.End`, `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`, `mathlib:LinearMap.charpoly`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Definition 1, p. 370 and §2 notation, p. 375. The determinant is the monic module cardinality entering every local Euler factor and the class term.


### Taelman integral Drinfeld models

Target `DrinfeldModulesAndTModules:DM.6/integral-model` (definition). Fix A=F[t], a finite field extension K/F(θ), R the integral closure of F[θ] in K, and γ(t)=θ. An integral model is E_t=θ+r_1τ+⋯+r_nτ^n with r_i∈R and r_n≠0. A positive n is the generic rank; the zero-rank scalar model is included as a determinant-theory test. No unit condition on r_n is imposed. Put K_∞=R⊗_(F[θ])F((1/θ)), a product of the finite completed fields at infinity, with R discrete and cocompact. This model can have bad reduction, unlike the constant-rank relative family of DM.0.

Hypotheses: Finite K/F(θ), including inseparable finite extensions; full integral closure R; chosen integral coefficients.

Construction or proof route:


1. Use the polynomial action defined by E_t on each R-algebra.

2. Import normalization and completion from FunctionFieldArithmetic.

3. Keep Lie(E)=R with scalar t-action θ separate from the E-action on the same additive set.


API uses:


- DM.6: Defines the scope of every class-formula object.


Proposed declarations:


- `TaelmanModel` (constructor): The integral Ore polynomial θ+Σ r_iτ^i with the indicated generic rank.

- `TaelmanModel.points` (structure): The F[t]-module E(B) on the additive group of any R-algebra B.

- `TaelmanModel.lie` (compatibility): The tangent A-module has scalar t-action θ.

- `TaelmanModel.reduce` (functoriality): Coefficient reduction to R/m supplies the local finite A-module.


Unit tests:


- `TaelmanModel_test_carlitz` (compatibility): r_1=1 gives the everywhere-good Carlitz model.

- `TaelmanModel_test_bad_reduction` (computation): For q=2, E_t=θ+θ³τ has rank one generically and scalar rank-zero reduction at (θ).

- `TaelmanModel_test_zero_rank` (degenerate): With n=0 the exponential is the identity and all local cardinality ratios are one.


Acceptance: At a bad prime, the reduction may have smaller rank, including rank zero.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/carlitz-module`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `FunctionFieldArithmetic:FA.1`, `FunctionFieldArithmetic:FA.2`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Definition 2 and Remarks 1–2, p. 371. The theorem’s definition explicitly permits a nonunit leading coefficient and the rank-zero case.


### The model-dependent L-value

Target `DrinfeldModulesAndTModules:DM.6/euler-l-value` (construction). For the chosen Taelman integral model, define L(E/R)=∏_(m maximal in R)|R/m|/|E(R/m)| in 1+T⁻¹F[[T⁻¹]], with θ renamed T in cardinality polynomials. The product converges. Include every maximal ideal, with the finite reduced t-action actually given by the model, even if the leading coefficient vanishes there. The value is characteristic-p valued and depends on the integral model; it is not automatically a complex Artin L-value or a canonical bad-reduction Goss factor of the generic module.

Hypotheses: The full integral-model hypotheses above; fixed coefficient/series variable convention.

Construction or proof route:


1. Compute each finite module determinant for multiplication by θ and the E_t action.

2. The difference is a q-Frobenius operator with the local degree bound; finite primes of bounded residue degree are finite in number.

3. The nuclear trace formula proves convergence and identifies the product with one determinant.


API uses:


- DM.6: The left side of the class formula.


Proposed declarations:


- `TaelmanModel.localFactor` (constructor): |R/m|/|E(R/m)|.

- `TaelmanModel.lValue` (constructor): The convergent product over all maximal ideals.

- `TaelmanModel.lValue_constant` (simp): Its T⁰ coefficient is one.

- `TaelmanModel.lValue_carlitz` (compatibility): For Carlitz, L(C/R)=ζ_R(1).


Unit tests:


- `lValue_test_scalar` (degenerate): The scalar rank-zero model has L=1.

- `lValue_test_carlitz_prime` (computation): At R=F[θ], a degree-one prime (θ−b) gives factor (T−b)/(T−b−1).

- `lValue_test_bad_prime` (computation): For q=2, E_t=θ+θ³τ, the factor at (θ) is one, not T/(T−1).


Acceptance: For Carlitz, the local denominator at a monic irreducible P is P(T)−1.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/integral-model`, `DrinfeldModulesAndTModules:DM.6/fitting-polynomial`, `DrinfeldModulesAndTModules:DM.6/trace-formula`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Definition following Remark 2, p. 371; Remark 5, pp. 373–374; §5, pp. 388–389. The Euler product retains bad primes and records dependence on the chosen integral model.


### The exponential unit lattice

Target `DrinfeldModulesAndTModules:DM.6/unit-lattice` (construction). For a Taelman model the coefficient recurrence gives an entire continuous open exponential exp_E:K_∞→E(K_∞), A-linear from the scalar differential action to the E-action and derivative one. Define U(E/R)=exp_E⁻¹(E(R)). It is a discrete cocompact A-lattice in K_∞, free of rank [K:F(θ)]. This does not assert surjectivity of exp_E on K_∞; the coefficient field is not C_∞. The periods in K_∞ are contained in U.

Hypotheses: The integral-model setting, including its product of completions and scalar A-action on the source.

Construction or proof route:


1. Solve the recurrence on every infinity factor and prove uniform local inverse estimates.

2. Openness and discreteness of R imply discreteness of its exponential preimage.

3. Compact quotient and the near-identity local exponential give cocompactness.

4. Use the PID lattice structure in the finite-dimensional local vector space for finite freeness and rank.


API uses:


- DM.6: The regulator/covolume factor and exact sequence for the determinant proof.


Proposed declarations:


- `TaelmanModel.exp` (constructor): The normalized entire functional-equation exponential on K_∞.

- `TaelmanModel.units` (constructor): The scalar-action submodule exp_E⁻¹(E(R)).

- `TaelmanModel.units_mem` (characterisation): x∈U iff exp_E(x)∈E(R).

- `TaelmanModel.units_rank` (data): rank_A U=[K:F(θ)].

- `TaelmanModel.exp_linear` (compatibility): exp_E(θx)=E_t(exp_E(x)).


Unit tests:


- `units_test_scalar` (degenerate): For the scalar rank-zero model, U=R.

- `units_test_carlitz` (computation): For C/F[θ], U=A log_C(1).

- `units_test_scaled_carlitz` (computation): For q=2 and E_t=θ+θ³τ, U=(π/θ³)A, a rank-one lattice whose generator has norm 1/2.


Acceptance: The unit lattice rank is the field-extension degree, not the Drinfeld rank.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/integral-model`, `DrinfeldModulesAndTModules:DM.2/carlitz-exponential`, `FunctionFieldArithmetic:FA.2`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Propositions 2–3 and proofs, pp. 371–372. The exponential is continuous and open; its preimage lattice is discrete and cocompact.


### The Taelman class module

Target `DrinfeldModulesAndTModules:DM.6/class-module` (construction). For a Taelman model define H(E/R)=E(K_∞)/(E(R)+exp_E(K_∞)), as an A-module. It is finite: quotienting by E(R) gives a compact group, and quotienting by the open exponential image gives a discrete one. The denominator is an additive A-submodule; it is generally not a K_∞-linear subspace. Its monic cardinality |H| is the class factor.

Hypotheses: The integral-model and exponential setting above.

Construction or proof route:


1. Use the scalar/E-action linearity of exp_E to form the A-submodule sum.

2. Show the quotient is both compact and discrete, hence finite.

3. Form its native finite-module cardinality polynomial.


API uses:


- DM.6: The class factor and the split exact sequence used in the tangent determinant identity.


Proposed declarations:


- `TaelmanModel.classModule` (constructor): E(K_∞)/(E(R)+exp_E(K_∞)).

- `TaelmanModel.classModule_finite` (instance): The class module is finite.

- `TaelmanModel.classCardinality` (data): The monic Fitting polynomial of H.

- `TaelmanModel.classModule_exact` (structure): 0→K_∞/U→E(K_∞)/E(R)→H→0, with the first map induced by exp_E.


Unit tests:


- `classModule_test_scalar` (degenerate): For the scalar rank-zero model H=0 and |H|=1.

- `classModule_test_carlitz` (compatibility): For C/F[θ], H=0.

- `classModule_test_nonzero` (computation): For q=2 and E_t=θ+θ³τ over F₂[θ], H≅F₂[t]/(t), represented by the class of θ⁻¹, and |H|=T.


Acceptance: A nonzero class module must remain visible in the main formula.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/unit-lattice`, `DrinfeldModulesAndTModules:DM.6/fitting-polynomial`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Definition preceding Proposition 5 and its proof, p. 373. The class module retains the failure of the integral points and exponential image to fill E(K_∞).


### Normalized lattice covolumes

Target `DrinfeldModulesAndTModules:DM.6/lattice-covolume` (definition). Let V be a finite-dimensional F((1/θ))-vector space and Λ₁,Λ₂ discrete cocompact F[θ]-lattices. Choose σ∈GL(V) with σΛ₁=Λ₂. Define [Λ₁:Λ₂] as the monic representative of F×·ι(det σ), where ι renames θ as T. This does not depend on σ. For lattices contained in a common over-lattice Λ, it equals |Λ/Λ₂|/|Λ/Λ₁|. It is continuous in both lattices and multiplicative in successive pairs. The class formula uses [R:U], in that orientation.

Hypotheses: Full-rank discrete cocompact lattices in the same local vector space; monic means leading Laurent coefficient one.

Construction or proof route:


1. Free lattice bases provide σ.

2. Changing lattice bases changes its determinant by an F×-unit.

3. Diagonal PID quotients prove the common-over-lattice formula, while continuity extends it to all pairs.


API uses:


- DM.6: Regulator term and tangent determinant identity.


Proposed declarations:


- `latticeCovolume` (constructor): The normalized determinant [Λ₁:Λ₂].

- `latticeCovolume_self` (simp): [Λ:Λ]=1.

- `latticeCovolume_trans` (relation): [Λ₁:Λ₃]=[Λ₁:Λ₂][Λ₂:Λ₃].

- `latticeCovolume_index` (compatibility): For a common over-lattice, the stated ratio of monic cardinalities.


Unit tests:


- `covolume_test_one` (degenerate): [A:A]=1.

- `covolume_test_scalar` (computation): [A:θA]=T, while [θA:A]=T⁻¹.

- `covolume_test_scaled_period` (computation): For q=2, [A:(π/θ³)A]=ι(π/θ³), with leading term T⁻¹.


Acceptance: For Λ₂=aΛ₁ with a monic, the ratio is a(T)^dim V.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/fitting-polynomial`, `FunctionFieldArithmetic:FA.2`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Proposition 4 and proof, pp. 372–373. The monic determinant orientation is [Λ₁:Λ₂]=|Λ/Λ₂|/|Λ/Λ₁|.


### Finite-field nuclear determinants

Target `DrinfeldModulesAndTModules:DM.6/nuclear-determinant` (construction). Let V be a compact topological F-vector space. A continuous F-linear endomorphism is locally contracting if on some open invariant subspace U its norm decreases by a constant c<1. For Φ=Σ_(n≥1)φ_nZ^n with locally contracting coefficients define det_(F[[Z]])(1+Φ|V) modulo Z^N using a common contracting nucleus for φ₁,…,φ_(N−1) and the determinant on the finite quotient V/U; the compatible residues define the series. It is independent of nuclei and norm choice. Exact-sequence multiplicativity and det(1+AB)=det(1+BA) hold in the stated nuclear range. This finite-field compact-vector-space theory differs from the complex Banach nuclear-operator theory already owned by OperatorTheory.

Hypotheses: F finite; compact V; continuous endomorphisms; norm/topology chosen as in Taelman §2; each coefficient locally contracting and no constant coefficient. The compact F-vector space is normed, with its nonarchimedean norm inducing the topology and the trivial norm on F. Local contraction is measured in this norm.

Construction or proof route:


1. Every finite coefficient list admits a common nucleus.

2. On a smaller common nucleus, the contracting piece contributes determinant one modulo the required power of Z.

3. Finite-dimensional determinant identities descend to the inverse limit of truncations.

4. Prove invariance under equivalent compact norms and functorial conjugation.


API uses:


- DM.6: Trace formula and infinitely tangent comparison determinants.


Proposed declarations:


- `FiniteFieldNuclearDet` (constructor): The finite-nucleus limit det(1+Φ|V).

- `FiniteFieldNuclearDet_trunc` (characterisation): Modulo Z^N it is the finite quotient determinant at any common nucleus.

- `FiniteFieldNuclearDet_exact` (structure): Multiplicativity for invariant short exact sequences in the nuclear range.

- `FiniteFieldNuclearDet_cyclic` (relation): det(1+AB)=det(1+BA) when both sides satisfy the nuclear hypotheses.


Unit tests:


- `nuclearDet_test_zero` (degenerate): The zero operator series has determinant one.

- `nuclearDet_test_finite` (compatibility): For V=F and Φ=aZ, det(1+Φ)=1+aZ.

- `nuclearDet_test_infinite_identity` (non-example): The identity on F[[u]] is not locally contracting; it is not a nuclear coefficient under this definition.


Acceptance: For finite-dimensional V, recover the ordinary determinant.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/fitting-polynomial`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Definitions 3–5 and Propositions 6–11, pp. 375–379. Nuclearity is coefficientwise local contraction and the determinant is a compatible finite-quotient limit.


### The finite-field trace formula

Target `DrinfeldModulesAndTModules:DM.6/trace-formula` (theorem). For R and K_∞ in the integral-model setting, a finite projective R-module M with q-Frobenius-semilinear τ_M, and Θ∈R{τ}[[Z]]·τZ acting through τ_M, the product over maximal ideals satisfies ∏_m det(1+Θ|M/mM)=det(1+Θ|(M⊗R K_∞)/M)⁻¹. The right-hand coefficients are nuclear. Both sides converge in F[[Z]]. The Frobenius-divisibility condition on Θ is essential; scalar multiplication alone is not this trace formula.

Hypotheses: Finite projective M over R; τ_M semilinear with respect to r↦r^q; Θ has no Z⁰ or τ⁰ term.

Construction or proof route:


1. Prove local contraction for positive-Frobenius operators on the compact quotient.

2. Use localization exact sequences to isolate finite primes.

3. Apply Anderson’s commutator factorization to reduce arbitrary nuclear Θ to finite local factors.

4. Use determinant exactness/cyclic invariance to pass to the Euler product.


Acceptance: Specializing Θ=(1−E_tT⁻¹)/(1−θT⁻¹)−1 gives the L-value determinant, after taking the inverse of each local factor.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/nuclear-determinant`, `DrinfeldModulesAndTModules:DM.6/integral-model`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Theorem 3 and proof, pp. 379–384. The formula applies to positive-Frobenius series on finite projective modules, with the inverse on the compact quotient.


### Infinitely tangent comparison maps

Target `DrinfeldModulesAndTModules:DM.6/tangent-comparison` (definition). For lattices Λ_i⊂V and finite A-modules H_i put M_i=(V/Λ_i)×H_i. A continuous F-linear map γ:M₁→M₂ is N-tangent to the identity on V if, on some open U⊂V avoiding both lattices, its V/Λ₂ component restricts to an isometry and its local lift obeys ‖γ(v)−v‖≤‖θ^(−N)‖‖v‖. It is infinitely tangent if this holds for every N≥1, with U allowed to vary. For a continuous F-linear isomorphism γ define Δ_γ=Σ_(n≥1)(θ−γ⁻¹tγ)θ^(n−1)T^(−n) on M₁, where θ denotes the source t-action in this operator formula.

Hypotheses: Finite-dimensional local V, full lattices, finite H_i; local comparison in quotient charts; γ need not be A-linear.

Construction or proof route:


1. Define the local lifts after avoiding lattice translates and require the isometry explicitly.

2. The differential-one entire exponential is infinitely tangent by shrinking its inverse-function neighborhood for each N.

3. Transport t-actions across γ to obtain the operator series.


API uses:


- DM.6: The covolume/class determinant identity.


Proposed declarations:


- `InfinitelyTangent` (characterisation): For each positive N, the specified isometric local estimate holds.

- `tangentDelta` (constructor): Σ(t−γ⁻¹tγ)t^(n−1)T^(−n).

- `InfinitelyTangent.exp` (compatibility): A normalized everywhere-convergent q-linear exponential is infinitely tangent on admissible lattice quotients.

- `tangentDelta_identity` (simp): For identity comparison with equal t-action, Δ=0.


Unit tests:


- `tangent_test_identity` (degenerate): The identity is infinitely tangent and has Δ=0.

- `tangent_test_additive_exponential` (compatibility): A series x+Σ_(i≥1)e_ix^(q^i) of infinite radius obeys the N-tangent estimate on a sufficiently small disk for each N.

- `tangent_test_wrong_derivative` (non-example): For c≠1, scalar x↦cx is not infinitely tangent: its first-order error cannot satisfy all N-estimates.


Acceptance: Infinitely tangent maps can compare distinct t-actions and need not be module homomorphisms.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/lattice-covolume`, `DrinfeldModulesAndTModules:DM.6/unit-lattice`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Definitions 6–7, Proposition 12 and the definition of Δ_γ, pp. 385–386. The norm estimate alone is not the whole condition: an isometry on a common open chart is required.


### The tangent determinant identity

Target `DrinfeldModulesAndTModules:DM.6/tangent-determinant` (theorem). For a continuous F-linear isomorphism γ:(V/Λ₁)×H₁→(V/Λ₂)×H₂ infinitely tangent to the identity on V, the series Δ_γ is nuclear and det(1+Δ_γ|M₁)=[Λ₁:Λ₂]·|H₂|/|H₁|. This fixes the covolume orientation and the class numerator. No determinant of an arbitrary infinite-dimensional automorphism is used.

Hypotheses: The tangent-comparison hypotheses; γ an isomorphism; H_i finite A-modules.

Construction or proof route:


1. Compute when Λ_i have a common over-lattice and the comparison is an admissible local identity.

2. Approximate an arbitrary lattice by one sharing such an over-lattice, modulo a prescribed T-adic precision.

3. N-tangency makes the nuclear determinant unchanged to that precision; pass through all precisions.


Acceptance: An identity comparison with equal lattices and finite modules yields determinant one.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/tangent-comparison`, `DrinfeldModulesAndTModules:DM.6/nuclear-determinant`, `DrinfeldModulesAndTModules:DM.6/lattice-covolume`, `DrinfeldModulesAndTModules:DM.6/fitting-polynomial`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Theorem 4 and proof, pp. 386–388. The identity gives [Λ₁:Λ₂]|H₂|/|H₁|, with no hidden degree normalization.


### Taelman’s class formula

Target `DrinfeldModulesAndTModules:DM.6/class-number-formula` (theorem). For every Taelman integral model E/R, including nonunit leading coefficient and rank zero, L(E/R)=[R:U(E/R)]·|H(E/R)| in F((T⁻¹)). All local factors are those of the chosen integral model. The formula is not generalized here to arbitrary A, arbitrary higher-dimensional t-motives, or complex L-values.

Hypotheses: Exactly integral-model; exponential, lattice and monic-cardinality normalizations fixed above.

Construction or proof route:


1. The trace formula identifies L with det(1+Θ|K_∞/R), Θ=(1−E_tT⁻¹)/(1−θT⁻¹)−1.

2. The exponential gives 0→K_∞/U→E(K_∞)/E(R)→H→0.

3. Split the finite quotient continuously as an F-vector space; compare to (K_∞/U)×H by an infinitely tangent isomorphism.

4. Apply tangent-determinant with Λ₁=R, Λ₂=U, H₁=0, H₂=H.


Acceptance: For Carlitz recover ζ_A(1)=log_C(1). For E_t=θ+θ³τ over F₂[θ], retain |H|=T and recover L=ι(π/θ²).


Direct prerequisites: `DrinfeldModulesAndTModules:DM.6/euler-l-value`, `DrinfeldModulesAndTModules:DM.6/class-module`, `DrinfeldModulesAndTModules:DM.6/lattice-covolume`, `DrinfeldModulesAndTModules:DM.6/trace-formula`, `DrinfeldModulesAndTModules:DM.6/tangent-determinant`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Theorem 1, p. 373; §5 proof, pp. 388–389. The theorem treats the chosen integral model and keeps its finite class module.


### Depth-one Carlitz power sums

Target `DrinfeldModulesAndTModules:DM.6/small-power-sum` (theorem). For A=F[θ] let A_(d,+) be its finite set of monic degree-d polynomials and S_d(s)=Σ_(a∈A_(d,+))a^(−s). For d≥0 and 1≤s≤q, S_d(s)=ℓ_d^(−s) with ℓ_d=∏_(i=1)^d(θ−θ^(q^i)). Frobenius gives S_d(ps)=S_d(s)^p for p=char F. In particular ζ_A(1)=Σ_dℓ_d⁻¹=log_C(1). The formula ℓ_d^(−s) is not asserted for every s.

Hypotheses: Integer s≥1; θ transcendental; the small-exponent formula requires s≤q.

Construction or proof route:


1. The Carlitz generating product/partial fraction identity computes the small-degree coefficient.

2. Use the product denominators from DM.0, retaining their sign.

3. Apply characteristic-p Frobenius to extend along p-power exponents, while keeping its exact range.

4. The d-sum converges in K_∞ and matches the Carlitz logarithm at one.


Acceptance: For q=2,d=1,s=3, S₁(3)=(θ²+θ+1)/(θ(θ+1))³ differs from ℓ₁⁻³. For d=0, the only monic constant is one, so S₀(s)=1.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/carlitz-products`, `DrinfeldModulesAndTModules:DM.2/carlitz-exponential`.


Sources: [THAKUR-2009](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf), §§2.2–2.3, pp. 536–537. The depth-one generating identity gives the small-exponent specialization; its range is retained.


### Carlitz and a nonzero class module

Target `DrinfeldModulesAndTModules:DM.6/carlitz-class-examples` (theorem). For Carlitz over F[θ], H=0, U=A log_C(1), and L(C/A)=ζ_A(1)=log_C(1), after renaming θ as T. For q=2, define E_t=θ+θ³τ over F₂[θ]. Then exp_E(x)=θ⁻³exp_C(θ³x), U_E=(π/θ³)A, H_E≅F₂[t]/(t), and L(E/A)=ι(π/θ²). The class is represented by θ⁻¹ and t annihilates it. Thus |H_E|=T is indispensable.

Hypotheses: First example the Carlitz integral model; second q=2, K=F₂(θ), R=F₂[θ], π the DM.2 period lying in K_∞ in this case.

Construction or proof route:


1. At q=2, ‖π‖=4 and π∈K_∞. Reduce any x modulo πA to degree ≤1 by cancelling leading terms.

2. On the degree-≤1 ball, exp_C is an isometric bijection: higher terms are strictly smaller, and the complete-field contraction argument gives its inverse. Hence exp_C(K_∞)=θF₂[[θ⁻¹]].

3. Scalar conjugation by θ³ yields exp_E(K_∞)=θ⁻²F₂[[θ⁻¹]]. Its intersection with A is zero, and the quotient modulo A has the single basis class θ⁻¹.

4. E_t(θ⁻¹)=1+θ lies in A, proving H_E≅A/(t); the unit lattice is θ⁻³ker exp_C.

5. Away from (θ), the reduction is conjugate to Carlitz; at (θ), its local factor is one. Thus L(E/A)=ζ_A(1)(T−1)/T=ι(π/θ²), also matching regulator times T. The period relation at q=2 is π=(θ²+θ)log_C(1), obtained from the Carlitz torsion equation and the monic product normalization.


Acceptance: Dropping the class term in the second example gives a Laurent series with leading term T⁻¹ instead of the Euler product’s leading term one.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.2/carlitz-period`, `DrinfeldModulesAndTModules:DM.2/carlitz-exponential`, `DrinfeldModulesAndTModules:DM.6/class-number-formula`, `DrinfeldModulesAndTModules:DM.6/small-power-sum`.


Sources: [TAELMAN-2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf), Example 3, p. 373; Definition 2 and Remark 2, p. 371. The first case is stated in the paper. The scaled q=2 example is derived here from these definitions and the sourced Carlitz period, with every calculation shown; it is not attributed as a source example.


## DM.7. Normalized elliptic sheaves and shtuka comparisons

The bundles lie on the original global curve C. Frobenius acts on the coefficient base. Normalization, transverse quotients and the bounded index shift of morphisms are part of the dictionary. General global shtukas consume this construction through its two-leg datum.



### Elliptic sheaves on the global curve

Target `DrinfeldModulesAndTModules:DM.7/elliptic-sheaf` (definition). On C×F S put σ=id_C×Frob_q,S. A rank-r elliptic sheaf consists of vector bundles E_i, i∈Z, and injections j_i:E_i→E_(i+1), τ_i:σ*E_i→E_(i+1), satisfying j_(i+1)τ_i=τ_(i+1)σ*j_i and a compatible periodicity E_(i+rδ)≅E_i(∞). Each j_i cokernel is supported on ∞×S and its pushforward to S is a line bundle; each τ_i cokernel is supported on the graph of the characteristic c:S→C−∞ and its pushforward is a line bundle. Maps are bounded-shift compatible chain maps E_i→E′_(i+n), with n≥0 independent of i, identified under further j-shifts. For the Drinfeld correspondence use the normalized/transverse subcategory below. These are bundles on the original global curve C.

Hypotheses: C smooth projective geometrically connected over F; ∞ closed of degree δ; r≥1; characteristic leg disjoint from ∞; coherent injections and finite-flat length-one cokernels as specified.

Construction or proof route:


1. Import native coherent locally free sheaves and effective divisor twists from the existing AlgebraicVectorBundles and AlgebraicCurves roadmaps via SF.0.

2. Build the integer-indexed periodic diagram with the Frobenius pullback and its commutative squares.

3. Define bounded-shift morphisms and compose by adding shifts; fixed-index maps alone miss nonconstant Drinfeld isogenies.


API uses:


- DM.7: Normalized Drinfeld dictionary and Tate/local comparisons.

- GlobalShtukasAndFunctionFieldLanglands:GS.2: Consumes this special-case export, without owning this definition.


Proposed declarations:


- `EllipticSheaf` (constructor): The global vector-bundle chain with j, τ and rδ-periodicity.

- `EllipticSheaf.periodic` (data): E_(i+rδ)≅E_i(∞), respecting j and τ.

- `EllipticSheaf.characteristic` (projection): The finite characteristic leg c determined by the τ-cokernel.

- `EllipticSheaf.Hom` (constructor): Compatible chain morphisms with a uniform bounded index shift, modulo further inclusions.

- `EllipticSheaf.baseChange` (functoriality): Pullback preserves the chain, characteristic and quotient-line conditions.


Unit tests:


- `EllipticSheaf_test_rank_one` (computation): For F[t], C=P¹ and Carlitz, E_i=O(i), j is the infinity inclusion, and τ is multiplication by t−θ from σ*O(i) to O(i+1).

- `EllipticSheaf_test_rank_two` (compatibility): At r=2, δ=1 the twist by ∞ advances two indices, not one.

- `EllipticSheaf_test_curve` (non-example): Bundles on a Fargues–Fontaine curve do not define this chain on C×S.

- `EllipticSheaf_test_frobenius` (non-example): Replacing σ=id_C×Frob_S by the absolute Frobenius of C×S changes the degree of every E_i and fails periodicity compatibility.


Acceptance: For rational ∞ and rank one, E_(i+1)=E_i(∞); for rank two, E_(i+2)=E_i(∞).


Direct prerequisites: `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:SheafOfModules.IsLocallyFree`, `mathlib:SheafOfModules.IsFinitePresentation`.


Sources: [WIEDMANN-2005](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf), Definition 5.1, p. 72; Propositions 5.5 and Lemma 5.7, pp. 73–74; §5.4, pp. 80–84. The diagram, r·deg∞ periodicity and quotient line conditions are explicit; the normalized transversality identifies the characteristic support.


### Normalized elliptic sheaves

Target `DrinfeldModulesAndTModules:DM.7/normalized-elliptic-sheaf` (definition). The normalized Drinfeld subcategory consists of elliptic sheaves with χ(E_(−1),s)=0 on every field fiber and with τ_i inducing isomorphisms σ*(E_i/E_(i−1))≅E_(i+1)/E_i. Equivalently, the images of E_i and σ*E_i span E_(i+1) and intersect in σ*E_(i−1). In this subcategory, H⁰(E_(−1),s)=H¹(E_(−1),s)=0; for i≥0, H¹(E_i,s)=0 and dim H⁰(E_i,s)=i+1. Thus pr_S*E_0 is a line bundle and the normalized degree is deg E_(−1)=r(g−1).

Hypotheses: Same disjoint characteristic leg; exact scalar-field/Frobenius pullback; fiberwise Euler characteristic and the transverse diagram condition.

Construction or proof route:


1. Use the exact transverse square to obtain 0→σ*E_(i−1)→E_i⊕σ*E_i→E_(i+1)→0.

2. Apply fiberwise Riemann–Roch and the first nonzero section argument to locate index zero.

3. Import cohomology and base change to produce the pushforward line and the finite-step sections.


API uses:


- DM.7: Recovering the Drinfeld module and fixing the degree/index convention.


Proposed declarations:


- `NormalizedEllipticSheaf` (constructor): An elliptic sheaf with χ(E_(−1))=0 and transverse τ/j quotients.

- `NormalizedEllipticSheaf.sections` (data): The filtered family pr_S*E_i.

- `NormalizedEllipticSheaf.h0` (characterisation): Fiber dimensions max(i+1,0).

- `NormalizedEllipticSheaf.h1` (characterisation): H¹ vanishes on fibers for i≥−1.

- `NormalizedEllipticSheaf.line` (compatibility): pr_S*E_0 is invertible; its dual is the underlying Drinfeld line.


Unit tests:


- `normalized_test_carlitz` (computation): On P¹, E_(−1)=O(−1) has H⁰=H¹=0, and E_0=O has one section.

- `normalized_test_shift` (non-example): Shifting the Carlitz chain to E_i=O(i+1) gives χ(E_(−1))=1 and fails normalization.

- `normalized_test_direction` (compatibility): The inverse Drinfeld line is (pr_S*E_0)∨ because the sections are the contravariant motive generator, not its point line.


Acceptance: Normalization fixes an index and cannot be dropped without changing the moduli category.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.7/elliptic-sheaf`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:SheafOfModules.IsLocallyFree`, `mathlib:SheafOfModules.IsFinitePresentation`.


Sources: [WIEDMANN-2005](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf), Definition 5.9, Lemma 5.12, Corollary 5.13 and Proposition 5.14, pp. 75–77. Euler normalization and transverse quotients give the section dimensions used by the inverse functor.


### The elliptic sheaf of a Drinfeld module

Target `DrinfeldModulesAndTModules:DM.7/drinfeld-to-sheaf` (construction). For a standard relative rank-r Drinfeld A-module E on S, its contravariant motive M is finite locally free of rank r over A⊗F O_S and locally free of rank one over O_S{τ}. Filter a local Ore presentation by τ-degree. On a local coefficient algebra R, inside M⊗A K define the infinity lattice E_(i,∞) by deg_τ(m⊗a)=deg_τ(m)−rδ ord∞(a)≤i. Glue this with the motive on (C−∞)×S to obtain E_i. Inclusion gives j_i, left τ gives σ*E_i→E_(i+1), and multiplication by a local inverse uniformizer gives E_(i+rδ)=E_i(∞). These bundles form a normalized elliptic sheaf.

Hypotheses: Relative standard rank r, general A and ∞; the gluing is on the original global curve, with fpqc/Zariski coordinate descent.

Construction or proof route:


1. Finite generators for the infinity-degree filtration and its successive quotient line prove finite presentation.

2. Prove projectivity over R⊗O_(C,∞), using field fibers, the nilpotent-base flatness argument and finite coefficient descent.

3. Glue the finite projective modules across the punctured infinity neighborhood using the existing vector-bundle patching interface.

4. Check the characteristic quotient and transverse squares; sections recover the τ-degree filtration and the normalized cohomology.

5. Coordinate changes act contravariantly on the motive; a degree-n intertwiner shifts the filtration by at most n.


API uses:


- DM.7: The anti-equivalence and special-case shtuka export.


Proposed declarations:


- `DrinfeldModule.ellipticSheaf` (constructor): The glued chain from the Ore-degree filtration.

- `DrinfeldModule.ellipticSheaf_affine` (compatibility): Its restriction to C−∞ is M(E).

- `DrinfeldModule.ellipticSheaf_periodic` (compatibility): An rδ-index shift equals tensoring by O(∞).

- `DrinfeldModule.ellipticSheafMap` (functoriality): A degree-n u:E→E′ gives a bounded-shift chain map from the sheaf of E′ to that of E.


Unit tests:


- `toSheaf_test_carlitz` (computation): The Carlitz motive L[t] gives E_i=O(i) and Frobenius factor t−θ.

- `toSheaf_test_rank_two` (characterisation): A rank-two Drinfeld module yields bundles of rank two, although its Ore module is rank one.

- `toSheaf_test_isogeny_shift` (non-example): A positive-degree isogeny cannot in general be represented by maps E_i→E′_i for every i; bounded shifts are required.


Acceptance: The construction’s affine restriction is M(E), not a new free rank-r τ-module.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.4/contravariant-motive`, `DrinfeldModulesAndTModules:DM.0/relative-standardization`, `DrinfeldModulesAndTModules:DM.7/normalized-elliptic-sheaf`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `FunctionFieldArithmetic:FA.1`.


Sources: [WIEDMANN-2005](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf), §§3.4–3.6, Propositions 3.10 and Lemmas 3.11–3.17, pp. 40–48; §5.3.3, pp. 79–80; §5.4.1, pp. 81–82. The infinity filtration, projectivity, gluing and arbitrary-base line-bundle version are spelled out.


### The normalized elliptic-sheaf dictionary

Target `DrinfeldModulesAndTModules:DM.7/elliptic-antiequivalence` (comparison). The contravariant filtered-motive construction gives an anti-equivalence between standard relative Drinfeld A-modules of rank r and normalized transverse elliptic sheaves of rank r with bounded-shift morphisms. The inverse uses the line (pr_S*E_0)∨ and the Ore module Γ((C−∞)×S,E_0), locally free of rank one over O_S{τ}; right A-action reconstructs the Drinfeld map. Equivalently, this is a covariant equivalence with the opposite elliptic-sheaf category; no self-duality identification of that category is asserted. Characteristic and rank are preserved, and good-open level structures transport through the finite-shtuka pairing.

Hypotheses: The normalized/transverse/disjoint-leg conditions and morphism convention above; standard relative Drinfeld objects.

Construction or proof route:


1. Use the normalized cohomology to identify the generator line and its Frobenius iterates.

2. The affine sections form the Ore module; multiplication by a∈A respects the filtration and has unit leading term.

3. Construct the inverse action locally and descend the line-bundle maps.

4. The two constructions recover the same filtered module; evaluate the morphism maps to verify reversed composition and natural inverse isomorphisms.


Acceptance: The generator of sections is dual to the point-line generator, as in the motive functor.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.7/drinfeld-to-sheaf`, `DrinfeldModulesAndTModules:DM.7/normalized-elliptic-sheaf`, `DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence`, `SchemeAndStackFoundations:SF.2`.


Sources: [WIEDMANN-2005](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf), Theorem 5.10 and proof, pp. 75–84; Proposition 5.21, pp. 78–79; §5.4.2, pp. 82–84. The source calls the categories equivalent; the contravariant Hom-to-G_a convention fixes the opposite category here. Bounded-shift morphism reconciliation is an explicit source gap.


### The two-leg global shtuka export

Target `DrinfeldModulesAndTModules:DM.7/shtuka-export` (construction). From the elliptic chain take E_0 and α=j_0⁻¹τ_0:σ*E_0|_U≅E_0|_U, where U=(C×S)−((∞×S)∪Γ_c). The τ- and j-cokernels provide the characteristic zero and infinity pole bounds of a GL_r-modification. At rational ∞ they are length-one modifications; at general δ the pole support and residue factors are retained as the specified infinity chain rather than replaced by a rational leg. Export this datum to the independently defined global G-shtuka category in GS.2. The global category does not supply elliptic sheaves back to this construction.

Hypotheses: Normalized elliptic sheaf, characteristic disjoint from infinity; use its actual bound and coefficient ring.

Construction or proof route:


1. Restrict where both injections are isomorphisms and compose in the stated Frobenius direction.

2. Pass from the rank-r vector bundle to its GL_r frame torsor using existing vector-bundle APIs.

3. Record the two modifications with their cokernels and preserve levels by restriction.

4. GS.2 consumes the resulting datum; no dependency on its elliptic-sheaf-realisation node is introduced.


API uses:


- GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack: Embeds this GL_r special case.

- GlobalShtukasAndFunctionFieldLanglands:GS.2/elliptic-sheaf-realisation: Imports the definition and dictionary from DM.7.


Proposed declarations:


- `EllipticSheaf.shtukaDatum` (constructor): E_0 with α=j_0⁻¹τ_0 away from its legs.

- `EllipticSheaf.shtukaDatum_zero` (data): The characteristic modification and its effective length-one cokernel.

- `EllipticSheaf.shtukaDatum_pole` (data): The infinity modification inherited from j_0 and the periodic chain.

- `EllipticSheaf.shtukaDatum_baseChange` (functoriality): The construction commutes with coefficient-base pullback.


Unit tests:


- `shtukaExport_test_carlitz` (computation): For Carlitz on P¹, α is multiplication by t−θ on the affine trivialization.

- `shtukaExport_test_legs` (characterisation): The zero leg is t=θ and the pole is ∞.

- `shtukaExport_test_direction` (non-example): The inverse (t−θ)⁻¹ swaps zero and pole data and is not the selected Frobenius direction.


Acceptance: The Frobenius acts on S, leaving the global curve fixed.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.7/drinfeld-to-sheaf`, `SchemeAndStackFoundations:SF.0`.


Sources: [WIEDMANN-2005](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf), Definition 5.1 and Remark 5.2, pp. 72–73; §5.4, pp. 80–84. The two injections and their disjoint quotient supports give the rational Frobenius modification.


### Prime-to-characteristic realization comparison

Target `DrinfeldModulesAndTModules:DM.7/tate-realization` (comparison). For a normalized elliptic sheaf attached to E and λ away from the characteristic, complete its affine motive M at λ. Its τ-fixed completed realization is canonically dual to T_λE, with the A_λ-linear Galois pairing obtained at each λ^n level from the finite-shtuka functor. The pairing is compatible with all Drinfeld morphisms, bounded shifts of elliptic-chain maps, base extension and prime-to-characteristic level frames.

Hypotheses: Field coefficient L for Galois realization, λ away from ker γ; full completed residue factors; contravariant motive convention.

Construction or proof route:


1. Reduce M modulo λ^n and apply the strict finite-shtuka/group-scheme anti-equivalence.

2. Identify the torsion points with the dual Frobenius-fixed module by the evaluation pairing.

3. Pass through the chosen division coordinates to the Tate limit and duality.


Acceptance: For Carlitz the point Tate character and the motive-fixed character are inverse, as required by the pairing.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.7/elliptic-antiequivalence`, `DrinfeldModulesAndTModules:DM.5/rational-motive-realization`, `DrinfeldModulesAndTModules:DM.1/tate-module`, `DrinfeldModulesAndTModules:DM.1/continuous-galois-action`, `SchemeAndStackFoundations:SF.2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), §6, Theorems 6.1 and 6.4 and Corollary 6.5, pp. 23–26. Finite-shtuka torsion realizes the motive reductions; inverse limits give the prime-to-characteristic comparison.


### The effective characteristic local comparison

Target `DrinfeldModulesAndTModules:DM.7/characteristic-comparison` (comparison). For characteristic p and an F_p-algebra R with nilpotent uniformizer image γ(z), completing the affine motive of the elliptic sheaf and selecting the characteristic residue factor gives the same rank-r effective local shtuka as DM.1, with q^(deg p)-Frobenius and the dimension-one cokernel bound. Its finite reductions correspond to the full p-power strict finite group schemes. This is a comparison of completed motives and finite torsion, not a characteristic-place rank-r separable-point Tate representation or an unrestricted crystalline/étale comparison.

Hypotheses: Nilpotent characteristic parameter; residue coefficient algebra F_p; all completion/splitting and effectiveness hypotheses of DM.1/characteristic-local-realization; general local category supplied by HS2.

Construction or proof route:


1. Identify affine motive restrictions through the elliptic dictionary.

2. Complete and split coefficient factors; iterate τ by the residue degree.

3. Apply the same strict finite-group correspondence used in DM.1, retaining connected torsion and its bound.


Acceptance: For φ_t=τ² over F, connected length q^(2n) at level t^n is preserved under this comparison.


Direct prerequisites: `DrinfeldModulesAndTModules:DM.7/elliptic-antiequivalence`, `DrinfeldModulesAndTModules:DM.1/characteristic-local-realization`, `SchemeAndStackFoundations:SF.2`, `HeckeStacksAndLocalShtukas:HS2`.


Sources: [HARTL-2017](https://arxiv.org/pdf/1706.06807v1), §6, pp. 23–26 and §7, pp. 27–28. The finite realization and local completion need the specified characteristic factor and effective Frobenius bound.


## Shared prerequisites and ownership

Generic q-linearized polynomials and the Ore/composition comparison have one owner, FF.4. Its four existing blueprint nodes are imported; the inherited generic Ore nodes are removed from DM.0. This implements RT-AREA-finitefields/13. The local adapter uses the native skew-polynomial type and does not create another owner. The perfect-field abelian/A-finite comparison additionally requests generic valued-skew-field algebra as FiniteFieldsAndCharacterSums, Part II.


DM.8 supplies coefficient twists. The underlying restricted-series/analytic foundations come from AdicSpaces and the pinned native power-series library. Uniformizability and its exponential belong to DM.4; DM.8 consumes them for rigid triviality. Moving that generic analytic prerequisite off the coarse DM.8 interface avoids a part-to-part cycle. GS.2 consumes the two-leg export; it is not an incoming prerequisite for elliptic sheaves.


AlgebraicVectorBundles: Current main, including its Suggested file, already owns locally free/invertible sheaves, pullbacks and vector-bundle APIs absent from the atlas snapshot. SF.0 requests forward to that existing roadmap and AlgebraicCurves/JacobianChallenge. No vector-bundle foundations are re-planned.


AdicSpaces: Restricted-series and Tate-algebra foundations are imported here. DM.8/tate-analytic-interface currently has a coarse DM.2 prerequisite; point it to DM.2/c-infinity plus the existing AdicSpaces/native restricted-series input when reconciling the two parts. Uniformizability and its exponential are defined in DM.4; the rigid-triviality comparison is an outgoing DM.8 consumer, avoiding a cycle.


IntegralHeckeAndGaloisDeterminants: Its current Layer 6 already cites current Tau Ceti fittingIdeal, fittingIdeal_eq_minorsIdeal_ker, fittingIdeal_quotient_zero and fittingIdeal_baseChange. These declarations were read at Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; they are absent at the pinned f790474 build. DM.6 defines only monic finite-module cardinalities and imports their Fitting compatibility. The Suggested compatibility signature is explicitly omitted at the old pin rather than reimplementing Fitting ideals.


Supplier contracts:


- `FunctionFieldArithmetic:FA.1`: The ring A=Γ(C−∞,O_C), its Dedekind ideal arithmetic, finite quotients, deg_A(a)=−deg(∞)ord∞(a), tensor coefficient rings, and divisor/Riemann–Roch inputs. Use existing AlgebraicCurves and JacobianChallenge targets wherever they already provide these; no duplicate global-curve plan.

- `FunctionFieldArithmetic:FA.2`: Completions at ∞ and λ, normalized nonarchimedean norms, residue-degree splitting, A_λ and its finite-quotient limit, and finite products of infinity completions for finite K/F(θ). No Drinfeld or motive definition is requested.

- `SchemeAndStackFoundations:SF.0`: Native schemes, locally free and invertible sheaves, vector groups, divisor twists, cohomology/base change and gluing. Forward vector-bundle and divisor inputs to the current AlgebraicVectorBundles, AlgebraicCurves and JacobianChallenge roadmaps; do not re-plan what they contain.

- `SchemeAndStackFoundations:SF.1`: Descent for invertible sheaves, group actions and level frames, representable moduli functors, algebraic stacks and coarse quotients. Apply these to the Drinfeld functor; they do not define Drinfeld modules.

- `SchemeAndStackFoundations:SF.2`: Strict finite F_q-module schemes, finite-shtuka anti-equivalence and its exactness/étale criterion (Hartl Theorem 4.7), finite étale descent, Frobenius Lang solutions for GL_r and compatible inverse limits. The strict action and residue-field factors must be retained.

- `SchemeAndStackFoundations:SF.4`: Normalization under finite field extension, finite group quotients of normal projective schemes, finite integral extension of generalized families, Proj and ample invertible sheaves/section rings. These are the general geometric tools used by the Pink and Hartl–Yu compactifications.

- `HeckeStacksAndLocalShtukas:HS2`: Effective local GL_r-shtukas over residue-coefficient algebras, Frobenius q^(deg p), nilpotent characteristic parameter, finite-flat cokernel/dimension-one bound and the finite-reduction comparison. No characteristic-place separable-point Tate module is inferred.

- `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`: Use the existing AdicSpaces Tate-algebra and restricted-series targets, together with Mathlib PowerSeries.IsRestricted.subring. Supply the nonarchimedean Weierstrass/Newton-polygon and normalized infinite-product arguments needed for lattice exponentials and Ω. This is an analytic extension contract, not a new Tate-algebra definition.

- `FiniteFieldsAndCharacterSums:FF.4`: Import the four existing nodes frobenius-ore-polynomial-comparison, linearized-polynomial-eval-linear, linearized-polynomial-separable-iff and subspace-polynomial-is-linearized over arbitrary commutative F_q-algebras. FF.4 alone owns the Ore/composition comparison. The local Suggested adapter specializes Mathlib SkewPolynomial without defining a second owner. For the perfect-field abelian/A-finite comparison, the generic algebra extension is FiniteFieldsAndCharacterSums, Part II: complete discretely valued skew fields, left/right skew polynomial invariant factors, Newton decomposition and the matrix block-rank/positive-slope criterion of Maurischat §§3–4. These generic tools have one supplier; DM.4 only applies them to an Anderson matrix.

- `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`: Import the shared Fitting-ideal presentation and base-change theory already in current Tau Ceti (a91d3aaf), as used by StableReduction and IntegralHeckeAndGaloisDeterminants. At the older pinned build these declarations are absent. DM.6 adds only the characteristic-polynomial/monic-generator comparison for finite F[t]-modules, and must not re-plan the generic Fitting ideal.


## Scope of the suggested signatures

The mathematical targets above keep their stated generality. The suggested file has an interface register under every target and proposed API/test name. It distinguishes native signatures, concrete examples, coordinate bindings under another name, and exact omissions. An omitted condition has its full mathematical statement here; no unknown proposition substitutes for it.


DM.0 has native field actions, polynomial rank, intertwiners, affine kernels and standard affine families with actual frame conjugation. The general curve ring and full line-bundle action remain supplier interfaces. DM.1 has scheme spectra of ideal kernels, principal division-coordinate Tate limits and coefficient-automorphism equivariance. These signatures do not establish the full nonprincipal completed-module topology, absolute-Galois continuity or characteristic-factor local shtuka.


DM.2 uses the native uniform completion of an algebraic closure with a supplied extending norm, projective lattices with finite bounded intersections, restricted power series and the explicit Carlitz products. Its lattice-to-module signature specializes to F[t]. General-A analytic surjectivity, kernel rank and the infinity embedding remain the recorded proof/supplier inputs.


DM.3 has split point-level frames, bounded trivialized generalized actions and the ungraded reciprocal subalgebra. The full finite-étale scheme level, classifying stack, graded Proj, compactification, sections and finite trace maps remain exact native omissions. Point-count or affine-ring calculations do not assert those geometric constructions.


DM.4 has affine matrix t-modules and their actual motives, finite-free polynomial effective motives, inverse-twist dual motives and perfect-field purity lattices. The inverse coefficient automorphism explicitly satisfies the q-root equation; broad dual effectivity does not impose Ore-finiteness. General projective A-motives and relative reconstruction import the shared curve/sheaf and finite-shtuka interfaces. DM.5 has a principal completed-tensor Hom map and its algebraic properties; the rational A-isomotive, period-ring and full continuous realization signatures remain exact omissions.


DM.6 has separate point/Lie module actions, local factors, exponential units, class quotients, a one-place F[t] class formula and discriminating Carlitz examples. Its determinant uses compact vector spaces with a nonarchimedean norm and the trivial finite-field norm. Native finite-nucleus and exact-sequence signatures are present; the cyclic signature specializes to operators linear in the series variable. The general finite-product infinity field, global convergence, compact quotient charts, trace formula and tangent determinant retain their supplier contracts. The tangent operator coefficients are native; a same-chart estimate alone is insufficient for the quotient theorem.


DM.7 has a native module-sheaf diagram component with injections, Frobenius squares, periodic isomorphisms and bounded-shift maps. It is not the full elliptic-sheaf definition. Rank, divisor support, compatible quotient lines, normalization/cohomology and the inverse section line require the existing bundle/curve interfaces, with the variance and non-rational infinity residue-factor checks recorded below.


## Native baseline

These statements were read at the recorded pins. Existing generic definitions are imported rather than planned as targets.


- `mathlib:SkewPolynomial` in `Mathlib/Algebra/SkewPolynomial/Basic.lean`: SkewPolynomial R := SkewMonoidAlgebra R (Multiplicative ℕ); the twist φ is read off a MulSemiringAction (Multiplicative ℕ) R, which the user must supply. Its docstring names the q-power Frobenius and Papikian's Drinfeld-module book as the motivating case.

- `mathlib:SkewPolynomial.monomial_mul_monomial` in `Mathlib/Algebra/SkewPolynomial/Basic.lean`: monomial n r * monomial m s = monomial (n + m) (r * φ^[n] s): the twisted multiplication rule.

- `mathlib:FiniteField.frobeniusAlgHom` in `Mathlib/FieldTheory/Finite/Basic.lean`: For a finite field K of cardinality q and a commutative K-algebra R, the K-algebra endomorphism x ↦ x^q of R (coe_frobeniusAlgHom).

- `mathlib:FiniteField.coe_frobeniusAlgHom` in `Mathlib/FieldTheory/Finite/Basic.lean`: ⇑(frobeniusAlgHom K R) = (· ^ q).

- `mathlib:Polynomial.aeval` in `Mathlib/Algebra/Polynomial/AlgebraMap.lean`: Evaluation R[X] →ₐ[R] A at an element of any R-algebra A, commutative or not: the universal property of R[X].

- `mathlib:Polynomial.algHom_ext` in `Mathlib/Algebra/Polynomial/AlgebraMap.lean`: R-algebra maps out of R[X] agreeing on X are equal.

- `mathlib:Polynomial.Separable` in `Mathlib/FieldTheory/Separable.lean`: p is separable: p and its derivative are coprime.

- `mathlib:Polynomial.card_rootSet_eq_natDegree` in `Mathlib/FieldTheory/Separable.lean`: A separable polynomial that splits in K has exactly natDegree roots there.

- `mathlib:Module.End` in `Mathlib/Algebra/Module/LinearMap/End.lean`: The ring of R-linear endomorphisms of a module.

- `mathlib:RingHom.ker` in `Mathlib/RingTheory/Ideal/Maps.lean`: The kernel ideal of a ring homomorphism.

- `mathlib:Ideal.span` in `Mathlib/RingTheory/Ideal/Span.lean`: The ideal generated by a set.

- `tauceti:TauCeti.CommHopfAlgCat.kernelSpec` in `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Kernel.lean`: For a Hopf-algebra map H→K, the affine group-scheme kernel is quotientSpec K by kernelHopfIdeal. The map is contravariant on spectra; this already constructs the general kernel.

- `tauceti:TauCeti.AdditiveGroup.gaPointsMulEquiv` in `TauCeti/Algebra/AlgebraicGroup/AdditiveGroup/Basic.lean`: The convolution group of algebra maps from SymmetricAlgebra R R is multiplicatively equivalent to the additive group of a commutative R-algebra. This supplies the additive-group functor of points.

- `mathlib:PowerSeries.IsRestricted.subring` in `Mathlib/RingTheory/PowerSeries/Restricted.lean`: For a normed commutative ultrametric ring R and radius c, the restricted power series form a subring of PowerSeries R; restricted means that norm(coeff n) times c^n tends to zero. This carrier is reused, not redefined as a Tate algebra.

- `mathlib:LinearMap.charpoly` in `Mathlib/LinearAlgebra/Charpoly/Basic.lean`: For an endomorphism of a finite free module over a commutative ring, its characteristic polynomial is the matrix characteristic polynomial in a chosen basis. DM.6 specializes this native operation to finite-dimensional F-vector spaces.

- `mathlib:UniformSpace.Completion` in `Mathlib/Topology/UniformSpace/Completion.lean`: The separated quotient of Cauchy filters on a uniform space. The native completion field and normed-field instances in Mathlib/Analysis/Normed/Module/Completion.lean were also read and are reused; the extended norm on the algebraic closure remains an explicit input.

- `mathlib:NormedField.instCompletableTopField` in `Mathlib/Analysis/Normed/Field/Instances.lean`: Every normed field is a completable topological field; this supplies the completion-field instance in the C-infinity prototype.

- `mathlib:AlgebraicGeometry.Scheme.Modules` in `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`: For a scheme X, X.Modules is the category SheafOfModules X.ringCatSheaf, with its native categorical morphisms.

- `mathlib:AlgebraicGeometry.Scheme.Modules.pullback` in `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`: For f:X→Y, pullback f is the functor Y.Modules→X.Modules, left adjoint to the native pushforward.

- `mathlib:SheafOfModules.IsLocallyFree` in `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean`: A module sheaf is locally free when it admits local generator data whose maps from the corresponding free sheaves are isomorphisms. Finite rank is a separate condition.

- `mathlib:SheafOfModules.IsFinitePresentation` in `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean`: A module sheaf is finitely presented when it admits local quasicoherent presentations with finitely many generators and relations. This is already Mathlib, also reused by Tau Ceti FinitelyPresentedSheaf.


## Proof and interface inputs

Every DM.0–DM.7 target is planned. The following exact inputs remain; no stage is mathematically closed.


- **General rank integrality.** Establish that a non-scalar field Drinfeld action has integral positive proportionality factor deg_τ φ_a/deg_A(a). The displayed valuation proportionality alone gives a rational number. Use the finite projective A_L-module route of Hartl Theorem 3.9, or inspect a full direct integrality proof, without assuming the rank definition as its proof. Consuming targets: `DrinfeldModulesAndTModules:DM.0/rank-general`, `DrinfeldModulesAndTModules:DM.0/rank`.

- **Nilpotent-base standardization.** Hartl Lemma 3.8(a), pp. 8–9, cites Drinfeld and Matignon for the unique normalized nonlinear Ore conjugation. Inspect that proof or give the finite nilpotent-induction argument. The current pass establishes the exact statement and its distinction from linear frame change. Consuming targets: `DrinfeldModulesAndTModules:DM.0/relative-standardization`.

- **Analytic surjectivity and general-A kernel rank.** The BP survey states Theorem 2.1 but does not provide the complete nonarchimedean zero/surjectivity and general-A projective kernel-rank proof. The requested AdicSpaces analytic input and a full uniformization proof must discharge these steps. Finite-subspace products, normalization and the exponential recurrence are specified. Consuming targets: `DrinfeldModulesAndTModules:DM.2/lattice-exponential`, `DrinfeldModulesAndTModules:DM.2/uniformization`.

- **Reciprocal-ring normality proof input.** Hartl–Yu Proposition 3.11 imports Pink–Schieder Theorems 1.9 and 1.11 for the normality of the reciprocal Proj seed. Inspect those proofs or establish the stated normality in the supplier. The arithmetic extension/gluing and finite-quotient route of Hartl–Yu Theorem 3.2 has been read. Consuming targets: `DrinfeldModulesAndTModules:DM.3/reciprocal-compactification`, `DrinfeldModulesAndTModules:DM.3/satake-compactification`, `DrinfeldModulesAndTModules:DM.3/integral-compactification`.

- **Integral Tate image saturation.** Stalder Proposition 5.16(a), preprint p. 34 and published p. 588, asserts saturation as known. Supply the exact integral argument: λ-divisibility of a realized Hom map descends to divisibility in Hom_A(E,F), using finite-shtuka torsion and the quotient isogeny; retain nonprincipal λ. Rational full faithfulness is proved by the inspected period-ring route. Consuming targets: `DrinfeldModulesAndTModules:DM.5/tate-injectivity`, `DrinfeldModulesAndTModules:DM.5/tate-image-saturation`, `DrinfeldModulesAndTModules:DM.5/tate-surjectivity`.

- **Drinfeld semisimple-motive input.** Stalder Theorem 1.1 assumes a semisimple A-isomotive. Prove that the rational motive of a field Drinfeld module is simple, or inspect the precise reference supplying it, before deducing unconditional semisimplicity of its point Tate representation. Consuming targets: `DrinfeldModulesAndTModules:DM.5/tate-semisimplicity`.

- **Elliptic-chain morphism category.** Wiedmann Theorem 5.10 and proof use an equivalence convention with affine-module morphisms. Reconcile it fully with the bounded-shift chain morphisms and the contravariant Hom(E,G_a) convention stated here. The object construction, infinity projectivity/gluing, normalized cohomology and inverse line have been read. At a non-rational infinity point, verify the residue-factor/descent normalization of each length-one quotient in the degree filtration, including how Frobenius permutes the factors, before claiming the unrestricted relative correspondence. The period rδ and the pushforward-to-S line condition are explicit, rather than replacing infinity by a rational leg. Consuming targets: `DrinfeldModulesAndTModules:DM.7/elliptic-antiequivalence`.

- **Native geometric and analytic signature integration.** The Suggested file distinguishes elaborated native signatures, coordinate restrictions and exact omissions under the packet names. The full relative line-bundle action, absolute-Galois continuity, characteristic local objects, scheme-level frames, moduli/Satake/forms/Hecke, general-A motives, rational period rings, global-product Taelman convergence and trace/tangent quotient constructions, and normalized elliptic-chain support/cohomology require the recorded shared supplier interfaces. C-infinity completion, restricted series and polynomial-case purity lattices already have native coordinate signatures; those do not discharge the omitted general statements. No unknown proposition encodes an omitted condition. Consuming targets: `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module`, `DrinfeldModulesAndTModules:DM.1/characteristic-local-realization`, `DrinfeldModulesAndTModules:DM.3/moduli-functor`, `DrinfeldModulesAndTModules:DM.3/satake-compactification`, `DrinfeldModulesAndTModules:DM.4/purity`, `DrinfeldModulesAndTModules:DM.5/period-ring`, `DrinfeldModulesAndTModules:DM.7/elliptic-sheaf`.

- **Valued-skew-field proof inputs.** Theorem 4.1 and §6 of Maurischat have been inspected, but the left/right invariant-factor and Newton-decomposition proofs in §3 remain to be read and implemented by the FF.4 Part II supplier. The perfect-field abelian iff A-finite statement is planned using the exact positive-slope criterion, without treating the generic Ore adapter as its proof. Consuming targets: `DrinfeldModulesAndTModules:DM.4/dual-realization`.

- **Fine moduli chart and deformation proof.** Hartl–Yu Theorem 2.3 states good-open affine smooth representability and cites Drinfeld §5 for the principal-level chart and infinitesimal deformation argument. The fine-subgroup extension in Proposition 2.8 has been read; a full chart/deformation proof remains an exact input to the SF.1/SF.2 moduli supplier and the stated stack consequence. Consuming targets: `DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme`, `DrinfeldModulesAndTModules:DM.3/moduli-functor`.


## Source register

The locators use printed page numbers, except where a manuscript page is explicitly identified. These are the actual versions read; every statement above is in this roadmap’s own words. The public Papikian lecture notes are distinct from the uncleared book. No restricted book was used.


- **BP-RAPID**: W. Dale Brownawell and Matthew A. Papanikolas, [A rapid introduction to Drinfeld modules, t-modules, and t-motives](https://arxiv.org/pdf/1806.03919v1). arXiv:1806.03919v1, 11 June 2018. Read 11 October 2026: §§1–2.5, pp. 1–8; §§3.1–3.5, pp. 8–13; §§4.1–4.6, pp. 13–20. Read for the definitions, analytic formulas and motive conventions used here. SHA-256 `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d`.

- **PINK-2012**: Richard Pink, [Compactification of Drinfeld modular varieties and Drinfeld modular forms of arbitrary rank](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf). Author copy of arXiv:1008.0013v4, 16 March 2012. Read 11 October 2026: §1, pp. 3–4; Propositions 2.6–2.7, pp. 6–7; §3, pp. 9–13; §4, pp. 13–18; §§5–6, pp. 19–24; §7, pp. 25–27. SHA-256 `408d485d17dbede3ae02b9b90f132a37947d567e8f2697bdcb6c6cb8c41c9639`.

- **HARTL-2017**: Urs Hartl, [Isogenies of abelian Anderson A-modules and A-motives](https://arxiv.org/pdf/1706.06807v1). arXiv:1706.06807v1, 22 June 2017. Read 11 October 2026: Lemma 1.4 and §2, pp. 3–6; §3, pp. 7–11; §4 definitions, pp. 11–13; Corollaries 5.11–5.19, pp. 19–23; §6, pp. 23–26; §7 definitions and local completion, pp. 27–28. The proof of the finite-shtuka equivalence is a supplier request, not asserted as read. SHA-256 `bca3f51ed9bf5f215a12bdf2390b4718cb3a951a3e71c01fb87541fefafcd31f`.

- **PAPIKIAN-2017**: Mihran Papikian, [An overview of the theory of Drinfeld modules](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf). Public lecture notes, last modified 9 October 2017. Read 11 October 2026: §2.2, pp. 6–7; §3.1, pp. 10–12; §3.2, pp. 12–14. These are lecture notes, not the uncleared book. SHA-256 `6c10dd09df294795f41228ee5ba8b24232c43d7ed1c6485ba0bdb6ad8da21c43`.

- **TAELMAN-2012**: Lenny Taelman, [Special L-values of Drinfeld modules](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf). Annals of Mathematics 175 (2012), 369–391. Read 11 October 2026: §1 definitions and Theorem 1, pp. 369–374; §§2–5 determinant theory, trace formula and class-formula proof, pp. 375–389. SHA-256 `46699398350f09a5e9baf53ae7b414102633fa86c0fc1abc11dee82ee6d0032d`.

- **WIEDMANN-2005**: Stefan Wiedmann, [Drinfeld modules and elliptic sheaves](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf). Revised English thesis, 26 August 2005. Read 11 October 2026: §§3.4–3.6, pp. 40–48; §4.6, pp. 69–71; §5, pp. 72–84; §6.1, p. 85. The infinity construction and normalized cohomology were read; bounded-shift variance and non-rational infinity residue-factor descent remain precise gaps. SHA-256 `dfb9028260ce487088763691bf55b9644a9598976fa9db183b936c491fec828d`.

- **TAMAGAWA-1994**: Akio Tamagawa, [Generalization of Anderson’s t-motives and Tate conjecture](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0884-17.pdf). RIMS Kokyuroku 884 (1994), 154–159. Read 11 October 2026: §§0–3, pp. 154–158, including the fixed characteristic requirement and local algebraization sketch. SHA-256 `f88b80a69f4fc13dec1db2a88081adeb9f8666283893ea232ed11076b6205aec`.

- **STALDER-2008**: Nicolas Stalder, [The Semisimplicity Conjecture for A-Motives](https://arxiv.org/pdf/0809.0224v1). arXiv:0809.0224v1; downloaded artifact carries the date 23 November 2018. Read 11 October 2026: Theorem 1.1, pp. 2–3; Definitions 2.1–2.2, pp. 5–6; Definitions 2.26 and Proposition 2.28, pp. 12–14; Theorem 3.11 and proof, pp. 18–21; §4 realization and coefficient-extension route, pp. 21–26; §§5–6, pp. 26–43. Proposition 5.16(a) is inspected and its integral saturation proof input remains recorded. Published Proposition 5.16, p. 588, and Proposition 6.21 and following recap, p. 595, were separately collated. SHA-256 `ba000e658d82e781d46e5f550c221e100516c46ea881cd23c68bae5da063142a`.

- **NGODAC-2021**: Tuan Ngo Dac, [On Zagier-Hoffman’s conjectures in positive characteristic](https://hal.science/hal-03298790/document). HAL hal-03298790v1, manuscript dated 29 March 2021; not collated against Annals 194 (2021), 361–392. Read 11 October 2026: Notation and depth-one power sums in §2, pp. 5–7; Definition 4.1 and §4.2, pp. 16–18. Only items routed to DM.0, DM.2, DM.4 and DM.6 are developed here; DM.8 machinery is imported. SHA-256 `f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d`.

- **THAKUR-2009**: Dinesh S. Thakur, [Power sums with applications to multizeta and zeta zero distribution for F_q[t]](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf). Finite Fields and Their Applications 15 (2009), 534–552. Read 11 October 2026: §§2.2–2.3, pp. 536–537: depth-one sums, generating function, and its small-exponent specialization. SHA-256 `d31f4a4be1e6cb1aaf9bdc574070066b1057f043df3ec437cd71784c0933168f`.

- **CREW-2019**: Richard Crew, [Local Class Field Theory](https://people.clas.ufl.edu/rcrew/files/LCFT.pdf). Public author notes, 6 April 2019. Read 11 October 2026: Proposition 1.2.8.4 and Corollary 1.2.8.5, pp. 34–35; algebraic closedness of completion in positive characteristic. SHA-256 `aa902052096f5d11095b0f57100d96f79cde4e560c9e2ffd51de1b3302545b42`.

- **HARTL-YU-2025**: Urs Hartl and Chia-Fu Yu, [Arithmetic Satake compactifications and algebraic Drinfeld modular forms](https://arxiv.org/pdf/2009.13934v2). arXiv:2009.13934v2, 8 January 2025; not collated against the 2025 journal version. Read 11 October 2026: Definitions 2.1–2.6, Theorem 2.3 and Proposition 2.8, pp. 7–10; Definition 3.1, Theorem 3.2, Lemmas 3.3 and 3.6–3.8 with proofs, pp. 12–16; Lemma 3.10 and Proposition 3.11 with proof, pp. 17–19. General special-fiber Cohen–Macaulayness is a conjecture and is not a target here. SHA-256 `7c4fe158c3503fc2e7096ea237c1e1932dfa074b3a62416e6040c92d773da2af`.

- **HARTL-PUBLISHED**: Urs Hartl, [Isogenies of abelian Anderson A-modules and A-motives](https://journals.sns.it/index.php/annaliscienze/article/download/668/654/886). Annali della Scuola Normale Superiore di Pisa XIX (2019), 1429–1470. Read 11 October 2026: Theorem 3.5 and proof, pp. 1439–1441, especially display (3.5), p. 1440; Lemma 3.8 and proof of (b), pp. 1441–1443. Part (a) cites earlier proofs; it is not claimed discharged. Targeted collation only. SHA-256 `a0f16971c626d020451f7d872399e15c06786c1ce3d0cab739639649d1dcc75f`.

- **STALDER-PUBLISHED**: Nicolas Stalder, [The semisimplicity conjecture for A-motives](https://www.research-collection.ethz.ch/bitstreams/47bc6b90-ad56-4a15-a6c8-46b7da8de09f/download). Compositio Mathematica 146 (2010), 561–598. Read 11 October 2026: Proposition 5.16 and proof, p. 588; Proposition 6.21, its proof and following recap, p. 595. Targeted collation only. SHA-256 `d1e133a5465ec129bbfc6c6f8fe1df8e35bc23d1b9381f1c1a7a0f43ff48aacf`.

- **MAURISCHAT-2026**: Andreas Maurischat, [Abelian equals A-finite for Anderson A-modules](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf). Annales de l’Institut Fourier, online-first 26 January 2026, DOI 10.5802/aif.3754. Read 11 October 2026: §4, Theorem 4.1 and proof, pp. 22–24; §5 conventions, pp. 25–27; §6, Propositions 6.1, 6.4, 6.5 and Theorem 6.6 with proofs, pp. 28–35; §8, Corollary 8.1 and proof, p. 43. The §3 skew-field normal-form/Newton inputs are a supplier contract. SHA-256 `4cf80d50c882ee43b71f9e6fbe9a50eb1e88d94efb8afae17dcd9ae51bb2201e`.


## Corrections used in the targets

The following six findings identify the version and locator. Their descriptions paraphrase the source; they copy no passage. Independent review must confirm them.


- **E1**, PAPIKIAN-2017, Public lecture notes, Theorem 2.3 proof, p. 7 (misprint). The displayed finite product for φ_a has initial X and factors (1−X/e_Λ(λ)), with no initial scalar a, while the argument requires differential a. Correction: Use aX∏_(0≠λ∈a⁻¹Λ/Λ)(1−X/e_Λ(λ)). Reason: The displayed product has derivative one at zero. The functional equation e_Λ(az)=φ_a(e_Λ(z)) has derivatives a on the left and φ_a′(0) on the right. The correction also gives φ_c=cX for constants c. Effect: the proof. Correction search: The public lecture URL and author/seminar listing were checked on 2026-10-11; a search for Papikian Drinfeld Theorem 2.3 errata found no correction. The uncleared book was not used. Status: new.

- **E2**, HARTL-2017, arXiv:1706.06807v1, proof of Theorem 3.5, display (3.5), p. 7; published display (3.5), p. 1440 (misprint). The preprint display gives the target Hom(M,M′) while the map takes m′ to m′∘f for f:E→E′. Correction: The target is Hom(M(E′),M(E)); the published display gives this corrected target. Reason: Composition m′∘f starts with a function on E′ and produces a function on E, reversing the objects. The surrounding preprint proof already uses this direction. Effect: nothing. Correction search: arXiv:1706.06807 version listing; Hartl publications page; published journal PDF, pp. 1439–1441. Status: Corrected in the published Annali XIX (2019) display (3.5), p. 1440, inspected on 2026-10-11..

- **E3**, STALDER-PUBLISHED, Compositio 146 (2010), recap after Proposition 6.21, p. 595; arXiv:0809.0224v1, p. 41 (misprint). The recap identifies B^G with the full completed coefficient ring F_(K,λ), although Proposition 6.21 identifies it with the smaller rational coefficient extension F_(λ,K). Correction: Use B^G=F_(λ,K)=Frac(F_λ⊗F_q K), retaining the distinction from Frac((F_λ,res⊗F_q K)[[z]]). Reason: Proposition 6.21 proves the smaller equality, and Claim 5.2 requires exactly that equality for local algebraization. For infinite K the rational scalar extension and full coefficient completion differ. Effect: nothing. Correction search: The arXiv version listing; Cambridge Compositio article and erratum search; ETH deposited version of record, p. 595. No separate correction found on 2026-10-11. Status: new.

- **E4**, HARTL-YU-2025, arXiv:2009.13934v2, Proposition 3.11 and proof, p. 19 (misprint). Three line-bundle subscripts use A[1/r] for the reciprocal compactification that the same proposition defines over A[1/t]. Correction: Use Q_(r,A[1/t]) in the O(1) and O(−1) subscripts. Reason: r is the rank integer, while the coefficient element inverted throughout the construction and its base is t. The surrounding line-bundle construction is over Q_r⊗F_q A[1/t]. Effect: nothing. Correction search: arXiv:2009.13934 version listing and v2; Hartl publications page; Wiley 2025 article/erratum search. This finding is scoped to v2; the journal text was not collated. Status: new.

- **E5**, WIEDMANN-2005, Revised English thesis, proof of Proposition 5.15, p. 77 (misprint). The proof attributes cohomology/section conclusions to Proposition 5.15 itself. Correction: Use Proposition 5.14 for the normalized cohomology and section dimensions. Reason: Proposition 5.14, immediately preceding, proves the required vanishing and dimensions; Proposition 5.15 is the conclusion presently being proved. Effect: nothing. Correction search: The public revised English thesis and its Göttingen listing, checked on 2026-10-11; no separate erratum located. Status: new.

- **E6**, HARTL-PUBLISHED, Published Lemma 3.8(b), proof, p. 1442; arXiv:1706.06807v1, p. 9 (misprint). After choosing f∈1+I with fI=0 and I contained in every prime, the proof calls 1−f a unit. Correction: Use f itself as the unit; multiplying fI=0 by f⁻¹ gives I=0. Reason: Here I lies in the nilradical, so f=1+i is invertible while 1−f=−i is nilpotent and is generally not invertible in a nonzero ring. The corrected argument gives exactly the stated conclusion. Effect: the proof. Correction search: arXiv:1706.06807 version listing; Hartl publications page and its author PDF; published Annali XIX (2019) PDF, p. 1442; targeted Lemma 3.8 erratum search on 2026-10-11. No correction located. Status: new.
