# Weil conjectures and cohomological zeta functions

This roadmap connects rational points over finite fields to the integral zeta function, its cohomological degree factors, and its functional equation. Its endpoint is a theorem about an actual smooth proper scheme over a finite field: integral factors independent of the coefficient prime, reciprocal roots of the prescribed absolute values in every complex embedding, the signed functional equation, and trace formulas for every finite extension. The same interfaces support point-count recurrences, polynomial-count criteria, weighted stack counts, and explicit curve and surface calculations.

The constructions start with rational-point sets and rational étale cohomology supplied by **CohomologicalPointCounting**. The proof of purity belongs to **DeligneWeightsAndPurity**. Perfect pairings, cycle classes, weak Lefschetz, and correspondence traces belong to **EtaleDualityAndPerverseSheaves**. Here the work is to compare those constructions, prove the arithmetic descent and integrality statements, separate factors by weight, and expose consequences that retain their exact hypotheses.

There are two routes for curves. The general route imports purity and then takes traces. A second route imports the graph-of-Frobenius Hodge-index inequality on the product of a curve with itself and proves root bounds from estimates for all powers. The numerical argument is independent of the purity theorem. This distinction makes it possible to use either proof without a circular dependency.

## Scope and suppliers

The geometric inputs have named owners. The following table fixes the contracts used below; mentioning an input means using that owner's construction and theorem.

| Owner and layer | Input used here |
| --- | --- |
| CohomologicalPointCounting, FrobeniusGeometry Layers 4–5 | Finite rational-point sets, chosen finite-field extension towers, and the closed-point/Frobenius-orbit dictionary. |
| FrobeniusGeometry Layer 7; EllAdicRealization Layers 4–10, especially Layer 8 | Rational adic cohomology, finite-dimensional compact-support groups, coefficient change, continuous Galois action, and the identification of geometric Frobenius with pullback by scheme Frobenius. |
| TraceFormula Layers 11–14 | All-power trace formulas, open–closed additivity, Künneth, group-action compatibility, zeta and sheaf L-functions with determinant formulas. |
| TraceFormula Layers 7–8, 12 and 15 | Independent finite-étale, projective-space, affine-space, multiplicative-group, and curve/Jacobian computations. |
| EtaleBaseChange Layers 7–9; ComplexComparison Layers 10–12 | Smooth proper transport, singular/étale comparison, and compatibility with cup products and finite group actions. |
| SchemeAndStackFoundations:SF.1 and SF.2 | Stack and coarse-space constructions, effective finite descent, and the scheme operations needed to connect these geometric inputs. |
| EtaleDualityAndPerverseSheaves:EDC.1:biduality, EDC.2:pairings, EDC.3, EDC.4 and EDC.8 | Dualizing objects, Frobenius-equivariant graded pairings, cycle classes, weak Lefschetz, and determinant reciprocity for correspondences. |
| DeligneWeightsAndPurity:DWP.0, DWP.1, DWP.4, DWP.7 and DWP.10 | Weil numbers and trace/determinant algebra; the independent curve/Jacobian route; projective purity; smooth proper purity and mixed-weight bounds; comparison examples. |
| SchemeAndStackFoundations:SF.5 | Surface intersections, adjunction, Hodge index, and the graph/diagonal inequality used in the alternative curve proof. |
| PadicDifferentialEquationsAndRigidCohomology:RD.7 | The separate rigid/crystalline determinant comparison, with linear q-Frobenius. |
| ArithmeticGaloisRepresentations:R01.5; PadicHodgeTheory:R06.2 and R06.5 | Density-one Frobenius determination of semisimplifications, potential semistability, and good-reduction crystalline comparison. |

The CohomologicalPointCounting specifications used here are the [family at commit 4bd72379658126cbe9be935656396f0c9dac4de0](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting). Their mathematical interfaces are used through SchemeAndStackFoundations:SF.2. They supply the cohomology and trace formulas rather than another definition of zeta in this roadmap.

Stack applications additionally require the stack exports of **SchemeAndStackFoundations, Part II** and **EtaleDualityAndPerverseSheaves, Part II**: finite-mass point groupoids; rational compact-support cohomology and its trace formula; rational coarse-space comparison in the characteristic being used; smooth proper base change; and Frobenius-compatible stack duality. Each application below specifies which of these it needs. A scheme theorem is not transported to a stack merely by changing the type of its argument.

Effective twists belong to SF.1. They are separate from the equivariant trace formula: a formula for an operator does not construct the descended form. Lang's theorem for connected smooth linear algebraic groups is imported from **ReductiveGroupsPartII:RG2.3**. Arithmetic zeta functions over finite-type schemes over ℤ require the arithmetic Euler-product extension of the point-counting owner. Numerical Picard descent and the special surface invariants are imported in WC.7 from **NumericalPicardAndContractionDescent**, **EnriquesSurfacesAndIntegralNonexistence**, and **GenusOneFibrationsAndRationalEllipticSurfaces**.

The independent elliptic Hasse theorem remains in **EllipticCurves, Layer 3**. The function-field/curve dictionary, Artin–Schreier models, and genus conversions remain in **AlgebraicCurves, Layers 7, 10 and 12**, with **FunctionFieldArithmetic:FA.3**. Identifying coherent genus with the chosen curve convention does not by itself identify the first étale Betti number; that requires the curve/Jacobian realization.

## Conventions

Fix an actual finite field k of characteristic p and cardinality q = p^f, with f ≥ 1. The extension k_r/k has degree r ≥ 1 and cardinality q^r. All formulas allow nonprime q. For a finite-type k-scheme X, N_r denotes the natural cardinality of Hom over Spec k from Spec k_r to X. Field-isomorphism transport is part of this notation. Finiteness belongs to the rational-point theorem; it is never inferred from finiteness of the topological space of X.

Arithmetic Frobenius on geometric points sends coordinates to their q-th powers. On rational ℓ-adic cohomology, ℓ is prime and ℓ ≠ p, and F denotes **geometric Galois Frobenius**, inverse to the arithmetic generator. The supplier's convention bridge identifies this F with pullback by the scheme q-Frobenius. Thus geometric Frobenius on ℚ_ℓ(1) is q⁻¹, and on ℚ_ℓ(−d) is q^d. Extension to k_r replaces F by F^r.

For separated finite-type X, use H_c^i(X over the algebraic closure, ℚ_ℓ). For proper X these agree with H^i. Write

$$
P_{i,\ell}(T)=\det(1-TF\mid H_c^i),\qquad b_{i,\ell}=\dim H_c^i.
$$

The polynomial has constant term one. Its **reciprocal roots** are the eigenvalues of F; its zeros are their inverses. All eigenvalue lists retain algebraic multiplicities, including nonsemisimple Frobenius. An invertible F makes the degree equal to the dimension. A zero-dimensional vector space contributes the polynomial one.

Z_X has constant term one and satisfies

$$
Z_X(T)=\prod_i P_{i,\ell}(T)^{(-1)^{i+1}}.
$$

This determinant identity is an identity of rational functions with a specified expansion at zero. An Euler product first lives in ℤ[[T]], and its exponential expression lives in ℚ[[T]]. Reciprocal substitution belongs to a rational-function or Laurent-series field, not to arbitrary ordinary power series. Negative Euler exponents use integer powers.

For smooth proper pure-d X put

$$
\chi=\sum_{i=0}^{2d}(-1)^i b_i\in\mathbb Z,\qquad
\Delta=\prod_{i=0}^{2d}\det(F_i)^{(-1)^i}.
$$

The determinant multiplier is retained until rational descent proves its field of definition. Purity of weight i means algebraicity over ℚ and modulus q^{i/2} under **every** complex embedding of the eigenvalue field. A modulus statement in one embedding is insufficient. In mixed-sheaf statements the weights are integral algebraic weights.

For a stack, a count is a rational **mass**, summing inverse automorphism orders over isomorphism classes. Stack zeta expressions use the supplier's weighted trace-series construction; integer coefficients are not inferred from rational masses. For a smooth proper scheme over Spec ℤ, a polynomial count is an exact identity at every positive prime power, with values elsewhere irrelevant.

## Existing library interfaces

Use Mathlib at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti at f790474821cf4256814db967cb154e7af3d0c369. The algebraic targets below extend the following interfaces.

* **Finite fields:** `FiniteField.Extension k p r`, with the prime and positive-degree instances, `finrank_extension`, `natCard_extension`, `algEquivExtension`, and `natCard_algHom_of_finrank_dvd`. These provide fields and algebra maps; the geometric point transport is a separate comparison.
* **Determinants:** `Matrix.charpolyRev`, `Matrix.reverse_charpoly`, `Matrix.eval_charpolyRev`, `Matrix.coeff_charpolyRev_eq_neg_trace`, and `Matrix.charpoly_inv`. The chosen determinant is det(1 − TF), rather than det(T − F).
* **Series:** `PowerSeries.mk`, coefficient extensionality, rescaling and polynomial inclusion; `HahnSeries.ofPowerSeries_injective`; and the existing maps from `RatFunc` and power series to `LaurentSeries`. The Laurent-series field is the common carrier when a rational expression is compared with a formal expansion.
* **Descent and integrality:** `IsGalois.mem_range_algebraMap_iff_fixed` for a finite Galois extension, `IsIntegrallyClosed.eq_map_mul_C_of_dvd` for factors of monic polynomials, Möbius inversion, `padicNorm`, and polynomial equality from infinitely many evaluations.
* **Finite spectra:** `Matrix.vandermonde`, `det_vandermonde_ne_zero_iff`, `mul_nonsing_inv`, geometric-series summation, and the finite-sum norm inequality.
* **Groupoids and characters:** `CategoryTheory.isIsomorphicSetoid`, `Aut`, `Aut.autMulEquivOfIso`, discrete categories, single-object groupoids, action categories, and Tau Ceti's `repRing`, `repRingCharacter`, its injectivity for finite groups in characteristic zero, and its virtual-character image criterion.
* **Elliptic counts:** `WeierstrassCurve.pointCount`, `pointCount_eq_card_point`, and `frobeniusTrace`. The first counts affine solutions and adds infinity; its comparison with the elliptic point carrier requires nonsingularity.

Mathlib's `Scheme.EllAdicCohomology` is an additive-group construction from an integral pro-étale sheaf. Rational finite-dimensional spaces, compact support, continuous Frobenius, and the trace theorem are additional geometric inputs. The roadmap uses the supplier's rational construction explicitly.

## WC.0 — Rational points and Frobenius conventions

This layer fixes the geometric meaning of every later count and determinant. Its three comparisons prevent the field, point-set and cohomological conventions from diverging.

### Rational points in an extension tower

For finite-type X → Spec k and r ≥ 1, identify the supplied finite rational-point type with Hom over Spec k from Spec k_r to X. Define the count notation N_r by the natural cardinal of that type. If L/k and L′/k have degree r, a k-algebra isomorphism between them induces a point bijection, so the count is independent of the extension model. For r dividing s, chosen extension inclusions must give commuting point-transport squares and commute with q-power Frobenius.

The comparison exports finiteness on the actual Hom type. It does not install a finite type on the underlying scheme or its algebraic-closure points. The finite-field cardinality theorem makes #k_r = q^r, rather than p^r when q is not prime.

**Inputs:** Mathlib's finite-field extension, dimension, cardinality and isomorphism declarations above; FrobeniusGeometry Layers 4–5 through SF.2. **Source:** Deligne I, §1.4(a)–(d), equation (1.4.1), pp. 274–275; FrobeniusGeometry Layers 4–5. Suggested name: `TauCeti.PointCounting.finite_extension_point_tower_comparison`.

### Closed points as Frobenius orbits

Identify the closed points of finite-type X/k with arithmetic-q-Frobenius orbits on X over the algebraic closure. The orbit corresponding to x has length deg(x) = [κ(x):k]. There are finitely many degree-m closed points for each m. An orbit of length m contributes m points over k_r precisely when m divides r, and contributes none otherwise.

This comparison supplies both the closed-point counts a_m and their relation to N_r. The exponent in 1 − T^{deg(x)} is the residue-field **degree**. The norm #κ(x) = q^{deg(x)} appears instead in the arithmetic Dirichlet Euler factor.

**Inputs:** the extension-tower comparison; `FiniteField.natCard_algHom_of_finrank_dvd`; FrobeniusGeometry Layer 4 and TraceFormula Layer 13. **Source:** Deligne I, §1.4(c)–(d), p. 275. Suggested name: `TauCeti.PointCounting.closed_point_degree_comparison`.

### The rational geometric-Frobenius realization

For separated finite-type X/k and ℓ ≠ p, identify the spaces used in this roadmap with the supplier's finite-dimensional rational H_c^i. For proper X also identify them with H^i. The operator must be the continuous geometric Galois generator and, under the convention bridge, the pullback by q-Frobenius. Verify F_{k_r} = F_k^r and the Tate scalars q⁻¹ on ℚ_ℓ(1) and q^d on ℚ_ℓ(−d).

The comparison includes compatibility with coefficient extension: dimensions, traces and characteristic polynomials transport by the specified scalar-extension maps. Rationalization is a construction with its own finiteness theorem; the existence of integral cohomology groups alone does not supply these conclusions.

**Inputs:** the point-tower comparison; EllAdicRealization Layers 4–10, including continuous action in Layer 8; FrobeniusGeometry Layer 7; `Matrix.charpolyRev`. **Source:** Deligne I, §1.15, p. 279, and §2.2, pp. 280–281. Suggested name: `TauCeti.PointCounting.geometric_frobenius_realization_comparison`.

The convention checks are a geometric point, a degree-two closed point, and ℙ¹ over 𝔽₄. Their expected scalars and counts distinguish inverse Frobenius, degree from norm, and q from p before later formulas are used.

## WC.1 — Integral zeta arithmetic, masses and configurations

The first part of this layer derives rational and integral arithmetic presentations without purity. The second part supplies the counting operations used for stacks, twists and sieves. Curve numerators are available here before any Riemann-hypothesis assertion.

### Euler product and point-count series

For separated finite-type X/k, compare the point-counting owner's Z_X coefficientwise with

$$
\prod_{x\text{ closed}}(1-T^{\deg(x)})^{-1}\in\mathbb Z[[T]],
\qquad
\exp\!\left(\sum_{r\ge1}N_r T^r/r\right)\in\mathbb Q[[T]].
$$

The product is locally finite in each coefficient. Z_X(0) = 1. Finite disjoint unions give products of zeta functions; an open–closed decomposition X = U ⨿ Y gives Z_X = Z_U Z_Y. After extension of degree s, the sequence is N_{sr}. These are identifications with the owner's constructions and preserve their coefficient maps.

For a finite-type scheme over ℤ, the arithmetic extension uses the closed-point norm N(x) = #κ(x), with Euler factor (1 − N(x)^{−s})⁻¹. Its formal Dirichlet expansion has constant term one; an analytic comparison requires a supplied right half-plane of absolute convergence. Over 𝔽_q, the substitution is ζ_X(s) = Z_X(q^{−s}) in that convergence region. The general arithmetic construction and convergence theorem belong to the point-counting owner's arithmetic extension.

**Inputs:** both point comparisons in WC.0; TraceFormula Layer 13; SF.1 and the arithmetic extension for the last assertion. **Source:** Deligne I, §§1.1–1.1.3, pp. 273–274. Suggested name: `TauCeti.PointCounting.zeta_euler_comparison`.

### Closed-point Möbius inversion

For r ≥ 1 the orbit comparison gives integer identities

$$
N_r=\sum_{m\mid r}m a_m,\qquad
r a_r=\sum_{m\mid r}\mu(m)N_{r/m}.
$$

Consequently the second sum is nonnegative and divisible by r. Recovering a_r uses this divisibility, not a rational rounding rule. Empty schemes and permuted geometric components satisfy the same identities.

The algebraic form takes arbitrary integer-valued a and N with the first identity and derives the second by Mathlib's Möbius inversion. Nonnegativity is a separate consequence of their geometric meaning.

**Inputs:** WC.0 closed points; `ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`. **Source:** Deligne I, §1.4(d) and (1.4.1), p. 275; Mathlib's stated Möbius theorem. Suggested name: `TauCeti.PointCounting.closed_point_counts_mobius`.

### The cohomological determinant comparison

For separated finite-type X/k use the actual compact-support realization and compare the imported identities

$$
N_r=\sum_i(-1)^i\operatorname{Tr}(F_i^r),\qquad
Z_X(T)=\prod_i\det(1-TF_i)^{(-1)^{i+1}}\in\mathbb Q_\ell(T).
$$

Only finitely many degrees occur, and the rational expression has the specified Euler-series expansion at zero. For proper X pass to ordinary cohomology through the supplied isomorphism. Frobenius is invertible, so deg P_{i,ℓ} = b_{i,ℓ}, including P = 1 for the zero space. Neither eigenvalue purity nor semisimplicity is used.

**Inputs:** WC.0 rational realization; the Euler comparison; TraceFormula Layers 12–13 for constant coefficients and Layer 14 for sheaves; DWP.0/characteristic-power-series-and-traces; `Matrix.charpolyRev` and `reverse_charpoly`. **Source:** Deligne I, §§1.5–1.5.4, pp. 275–276, and §1.15, p. 279. Suggested name: `TauCeti.PointCounting.cohomological_zeta_comparison`.

### Rational-series descent

Let K → L be a field extension and f ∈ K[[T]]. Suppose there are P,Q ∈ L[T], Q(0) ≠ 0, with Q times the coefficient image of f equal to P. Then there are such numerator and denominator polynomials over K. This is a statement about equality of formal series and does not depend on analytic convergence.

A proof may use eventual recurrences, finite Hankel rank and descent of the resulting linear equations. Applying it with K = ℚ and L = ℚ_ℓ to the Euler series gives Z_X ∈ ℚ(T). Reduce the fraction and normalize each constant coefficient to one. Uniqueness of the reduced pair follows over the field; integrality comes next.

**Inputs:** `PowerSeries.ext` and polynomial/field algebra; the cohomological comparison for the geometric application. **Source:** Milne, Lemma 27.9 and proof, pp. 156–157; Deligne I, proof of (1.7) ⇒ (1.6), p. 276, for the Hankel descent. Suggested name: `TauCeti.PointCounting.rational_series_descent`.

### Local Fatou normalization

Let ℓ be any prime. If f ∈ 1 + Tℤ_ℓ[[T]] and P,Q ∈ ℚ_ℓ[T] are coprime with P(0) = Q(0) = 1 and Qf = P, every coefficient of P and Q has ℓ-adic norm **at most** one. Thus both polynomials are integral. The coefficient norm hypothesis is inclusive at one.

In a splitting field, a denominator reciprocal root of norm greater than one would give a zero of Q in the convergence disc of f. Evaluating Qf = P there contradicts coprimality. Apply the argument to f⁻¹ as well for the numerator. This local statement applies even when ℓ = p, although p cannot be used as the coefficient prime in the étale trace formula.

**Inputs:** local fields and their finite extensions from **LocalFieldsRamification, Layer 0**; norm comparison for series, `Summable.of_norm_bounded`, geometric-series summability, and `PowerSeries.ext`. **Source:** Milne, Lemma 27.10 and proof, p. 158. Suggested name: `TauCeti.PointCounting.local_fatou_normalization`.

### The normalized integral rational presentation

For separated finite-type X/k, let Z_X = U/V be the reduced rational presentation over ℚ, normalized by U(0) = V(0) = 1. Then U,V belong to ℤ[T] and are coprime over ℚ. Their expansion is exactly the integral Euler series. Normalization, reduction, numerator and denominator commute with field embeddings.

Apply local Fatou at every rational prime and then use that a rational number integral at every prime is an integer. No weight statement enters this step. The reduced U and V are parity products after cancellations; individual cohomological factors need a separate argument.

**Inputs:** the preceding three zeta/descent/integrality targets; Mathlib `padicNorm` and rational arithmetic. **Source:** Milne, Proposition 27.11 and proof, p. 158; Deligne I, proof of (1.7) ⇒ (1.6), p. 276. Suggested name: `TauCeti.PointCounting.normalized_integral_zeta_presentation`.

### Finite groupoid mass

For a groupoid C whose isomorphism-class quotient is finite and whose automorphism groups are finite, define

$$
\operatorname{mass}(C)=\sum_{[x]\in\pi_0 C}\frac1{\#\operatorname{Aut}(x)}\in\mathbb Q.
$$

Use Mathlib's `isIsomorphicSetoid` and `Aut`. Automorphism cardinalities are positive because the identity exists. An isomorphism conjugates automorphism groups, so the summand is independent of representatives. The finiteness data are arguments, to be proved before applying the definition to a point groupoid.

The definition is `TauCeti.PointCounting.groupoidMass`. Its API is:

| Name in TauCeti.PointCounting | Hypotheses and conclusion |
| --- | --- |
| `groupoidMass_aut_card_iso` | An isomorphism x ≅ y identifies the finite automorphism cardinalities. |
| `groupoidMass_equivalence` | An equivalence C ≌ D between finite-mass groupoids preserves mass. |
| `groupoidMass_discrete` | For finite A, mass(Discrete A) = #A. |
| `groupoidMass_singleObj` | For a finite group G, mass(SingleObj G) = 1/#G. |
| `groupoidMass_product` | For finite-mass C,D, mass(C × D) = mass(C)mass(D). |
| `groupoidMass_sum` | For finite-mass C,D, mass(C ⊕ D) = mass(C) + mass(D). |
| `groupoidMass_actionCategory` | For a finite group G acting on finite Y, mass(ActionCategory G Y) = #Y/#G. |

The last assertion follows by orbit–stabilizer, including nonfree actions. For a sum or action category, the Lean signature carries any groupoid instance that instance search requires explicitly.

Definition checks: the empty discrete groupoid has mass 0; a discrete three-element set has mass 3; the single-object groupoid for the group of order two has mass 1/2, hence differs from 1; and the regular action of that group on itself has mass 1, despite having two objects. These checks distinguish objects from isomorphism classes and preserve automorphism denominators.

**Inputs:** `isIsomorphicSetoid`, `Aut.autMulEquivOfIso`, `SingleObj.groupoid`, `Units.toAut`, `Discrete`, products, sums and `ActionCategory`. **Source:** Bergström–Faber–Payne, §1, weighted count preceding Proposition 1.3, published pp. 1324–1325; elementary equivalence and orbit–stabilizer consequences. The API and checks use the same definition and source.

### Stack mass, quotients and traces

Compare a finite-type stack's weighted count with groupoidMass on its actual finite-field point groupoid, assuming the finite-class and finite-automorphism conditions. A finite locally closed stratification gives an additive mass formula.

For [Y/G], with Y finite type and G a connected smooth linear algebraic group over k, Lang's torsor triviality gives #Y(k)/#G(k). A disconnected group requires the torsor forms; the connected formula cannot be used without them. For a finite-type DM stack with coarse space X_c, the rational weighted count equals #X_c(k). For a separated finite-type DM stack with bounded finite-dimensional rational compact-support cohomology and its stack trace theorem, the mass is the alternating Frobenius trace.

**Inputs:** finite groupoid mass; WC.0 rational realization; SF.1 and the stack Part II count/coarse/trace exports; RG2.3 for Lang. **Source:** Bergström–Faber–Payne, Proposition 1.3(i)–(iv), published pp. 1324–1325. Suggested name: `TauCeti.PointCounting.stack_count_comparison`.

### Twists and Frobenius

Let a finite group G act over k on separated finite-type X, and assume effective finite descent for the forms under consideration; quasiprojectivity is a sufficient setting. For σ ∈ G, let X^σ be the descended form whose arithmetic action on transported geometric points is σF_q. Its k-points are Fix(σF_q), and the compact-support trace formula gives their count as the alternating trace of F_q*σ* on H_c^i. Properness permits ordinary cohomology.

The action is defined over k, so it commutes with Frobenius. Extension of this fixed twist to k_r has descent operator σ^rF_q^r. It usually differs from constructing the σ-twist anew over k_r, whose operator is σF_q^r. This distinction is part of the comparison API.

**Inputs:** WC.0 point transport; the cohomological comparison; SF.1 effective descent; TraceFormula Layers 11 and 14 for actions and isotypic factors. **Source:** Bergström–Faber–Payne, §§9.1–9.2 and Remark 9.2, published pp. 1351–1352. Suggested name: `TauCeti.PointCounting.twisted_frobenius_point_comparison`.

### The integral character lattice

Under those twist hypotheses, f(σ) = #X^σ(k) is a class function. In a characteristic-zero complex realization of the finite cohomological trace data, expand f = Σ_λ a_λχ_λ in the irreducible-character basis. Here a_λ is the alternating Frobenius trace on the multiplicity spaces Hom_G(V_λ,H_c^i).

There is a unique lift of f to the integral complex representation ring if and only if every a_λ is an integer. Its value at the identity then recovers the ordinary count; addition and product agree with representation-ring operations whenever the summands lie in this lattice. Merely being a Frobenius trace of a class function does not establish lattice membership. WC.5 will provide an application where actual Betti representation classes establish integrality.

**Inputs:** the twist comparison; Tau Ceti `repRing`, `repRingCharacter`, `mem_range_repRingCharacter_iff`, `repRingCharacter_injective`, and `mem_virtualCharacters_iff`, with a finite group and characteristic-zero coefficients. **Source:** Bergström–Faber–Payne, Definition 9.1 and its surrounding discussion, published p. 1351; the precise lattice qualification uses Tau Ceti's character-image criterion. Suggested name: `TauCeti.PointCounting.equivariant_count_character_lattice`.

### Signed Frobenius configurations

Let σ be a permutation of a type A. Assume that for each n there are finitely many σ-stable finite subsets S of A of cardinality n. Let o(S) be the number of orbits of σ contained in S, computed by the image of S in the orbit quotient for the cyclic subgroup generated by σ. Define

$$
c_n(\sigma)=\sum_{|S|=n,\ \sigma S=S}(-1)^{o(S)}\in\mathbb Z.
$$

The definition is `TauCeti.PointCounting.signedConfigurationCoefficient`. A finite subset contains distinct points. Its sign counts orbits, so an orbit of length two has sign −1. For A = X over the algebraic closure, the finite configuration condition follows from WC.0's finiteness of closed points of every bounded degree.

| Name in TauCeti.PointCounting | Hypotheses and conclusion |
| --- | --- |
| `signedConfigurationCoefficient_zero` | Under finite-configuration hypotheses, c₀ = 1. |
| `signedConfigurationCoefficient_one` | c₁ = −#Fix(σ). |
| `signedConfigurationCoefficient_conjugate` | A bijection A ≃ B transports σ and preserves every c_n. |
| `signedConfigurationCoefficient_above_card` | For finite A and n > #A, c_n = 0. |
| `signedConfigurationCoefficient_sumCongr` | For permutations of A and B with the required finiteness, c_n(σ ⊕ τ) = Σ_{i+j=n} c_i(σ)c_j(τ). |
| `signedConfigurationCoefficient_generating` | For finite A, Σ_{n≤#A} c_nT^n = ∏_{O orbit}(1 − T^{#O}) in ℤ[T]. |

Definition checks: the empty permutation has c₀ = 1 and c₁ = 0; two fixed points give coefficients 1, −2, 1; one two-cycle gives c₁ = 0 and c₂ = −1; the latter c₂ differs from +1. The convolution check ensures that disjoint union agrees with multiplication of generating polynomials.

**Inputs:** WC.0 closed points; `MulAction.orbitRel`, `Subgroup.zpowers`, finite subsets and the existing quotient. **Source:** Bergström–Faber–Payne, §7, equation (8), Definition 7.3 and equation (9), published pp. 1337–1338. The API and checks are finite combinatorial consequences of this definition.

### Inverse zeta and configuration coefficients

For separated finite-type Y/k, the coefficient of T^n in Z_Y⁻¹ is c_n of arithmetic Frobenius on geometric points. Grouping by partitions λ of n gives a sum of (−1)^{length(λ)} times the number of distinct-point configurations with those orbit lengths. A degree-m orbit contributes 1 − T^m.

Every coefficient sum is finite although the whole geometric point set may be infinite. The proof uses the Euler product and bounded-degree closed-point finiteness, then the finite generating-polynomial API coefficientwise.

**Inputs:** signed configurations; the Euler product; SF.1 for the geometric configuration interpretation. **Source:** Bergström–Faber–Payne, §7, equation (8), published p. 1337, citing the configuration identity of Vakil–Wood. Suggested name: `TauCeti.PointCounting.inverse_zeta_configuration_formula`.

### Termination for proper even cohomology

Let Y be nonempty and proper over k, with bounded finite-dimensional rational cohomology and no odd cohomology. Put B = Σ_{i even} dim H^i. Then

$$
Z_Y^{-1}=\prod_{i\text{ even}}\det(1-TF_i)
$$

is a polynomial of degree B, so c_n = 0 for n > B. Moreover Σ_{n=0}^B c_n = 0. Indeed the constant function gives a Frobenius-fixed vector in H⁰ even if components are permuted, so the product vanishes at T = 1. For empty Y the inverse zeta is 1 and the coefficient sum is 1.

**Inputs:** cohomological and configuration comparisons. **Source:** Bergström–Faber–Payne, Proposition 7.4 and proof, published p. 1338. Suggested name: `TauCeti.PointCounting.inverse_zeta_even_termination`.

### The Hasse–Weil sieve

Let V be a finite-type parameter scheme over k carrying a surjective family of curves. Fibres may be nonreduced. Suppose each scheme-theoretic singular locus Y_v is proper of finite type and has no odd rational cohomology; positive-dimensional singular loci are allowed. For v ∈ V(k), set s_n(v) = c_n(F on Y_v), S_n = Σ_v s_n(v), and B = max_v Σ_{i even} dim H^i(Y_v), with B = 0 if V(k) is empty.

Then the number of smooth fibres is

$$
\#V_{\mathrm{smooth}}(k)=\#V(k)+\sum_{n=1}^{B}S_n.
$$

For 0 ≤ h < B, the exact error after truncating at h is Σ_{n=h+1}^B S_n. A fibre contributes to this tail only when its even Betti sum exceeds h. Finiteness is coefficientwise configuration finiteness, not finiteness of all geometric singular points. The reduced-curve case specializes to finite singular loci. No flatness assumption or unproved uniform asymptotic estimate is introduced into the sieve.

**Inputs:** termination, signed configurations and WC.0 finite parameter points; the proper singular-locus hypotheses are supplied by the application. **Source:** Bergström–Faber–Payne, Propositions 7.1 and 7.5, Remark 7.6 and their proofs, published pp. 1336–1339. Suggested name: `TauCeti.PointCounting.hasse_weil_sieve`.

### A curve numerator before root bounds

For a smooth projective geometrically connected curve C/k of genus g, use the independent curve/Jacobian realization to obtain H⁰ = ℚ_ℓ, H² = ℚ_ℓ(−1) and dim H¹ = 2g with their actual Frobenius actions. The numerator Π_C has constant term one, integer coefficients and degree 2g, and its ℚ_ℓ image is det(1 − TF on H¹). Thus

$$
Z_C=\frac{\Pi_C(T)}{(1-T)(1-qT)},\qquad
N_r=1+q^r-\sum_{j=1}^{2g}\alpha_j^r\quad(r\ge1).
$$

The α_j are all reciprocal roots with multiplicity. One can derive integrality directly from Π_C = (1 − T)(1 − qT)Z_C and the integral series once the cohomological numerator is a polynomial. Rational descent identifies its coefficients. This construction asserts no modulus bound and is available to the surface proof of curve RH.

**Inputs:** the cohomological and Euler comparisons; DWP.0 trace/determinant algebra; TraceFormula Layers 8 and 15 for the curve/Jacobian comparison, including b₁ = 2g. **Source:** Deligne I, §§1.5–1.5.4, pp. 275–276; Mustață, Remark 3.7 and equations (3.8)–(3.10), p. 21. Suggested name: `TauCeti.PointCounting.curve_zeta_numerator_without_rh`.

## WC.2 — Duality and the signed functional equation

This layer uses duality without purity. Its algebraic assembly accepts the perfect graded pairing and the resulting determinant reciprocity; the smooth proper geometric application obtains that pairing from EDC.2. The dualizing-object application in WC.6 uses the corresponding pairing from EDC.1 biduality.

### The determinant multiplier

For smooth proper X/k of pure dimension d, the imported Frobenius-equivariant perfect pairing is

$$
H^i\otimes H^{2d-i}\longrightarrow\mathbb Q_\ell(-d).
$$

Its target has Frobenius scalar q^d. It gives b_i = b_{2d−i}, invertible operators, and a reciprocal eigenvalue correspondence α ↔ q^d/α with multiplicities. The determinant identity supplied by this pairing is used as linear algebra, so no diagonalization is needed.

Set χ and Δ as in the conventions. Assemble the exact equation

$$
Z_X(1/(q^dT))=(-1)^\chi\Delta T^\chi Z_X(T),
\qquad \Delta^2=q^{d\chi}
$$

in ℚ_ℓ(T). More explicitly, with δ_i = det F_i, each degree identity is

$$
P_i(1/(q^dT))
=(-1)^{b_i}\delta_i q^{-db_i}T^{-b_i}P_{2d-i}(T).
$$

Taking the alternating product and pairing determinants yields the displayed zeta equation. The algebraic signature can state these degree identities on polynomials over any field and prove the product identity there. Its evaluated form assumes q and T nonzero and the displayed denominators nonzero; the geometric statement is in the rational-function field.

**Inputs:** WC.1 cohomological comparison; EDC.2:pairings and EDC.8; DWP.0/reciprocal-pairing-of-eigenvalues; `Matrix.charpoly_inv`. **Source:** Deligne I, §§2.3–2.6, pp. 281–282; Milne, Theorem 27.12 and proof, p. 158. Suggested name: `TauCeti.PointCounting.signed_zeta_functional_equation`.

### The integral half exponent

For the same X, dχ is even. If d is even there is nothing to prove. If d is odd, the middle pairing is alternating and nondegenerate over a field of characteristic zero, so b_d is even. Every other degree is paired with a degree of the same parity, and χ is even. Consequently m = dχ/2 belongs to ℤ, including when χ is negative.

The algebraic parity signature needs only the symmetric Betti list b_i = b_{2d−i} and evenness of b_d when d is odd. Its geometric specialization imports the alternating-pairing theorem. Rational ℚ₂ coefficients are allowed when p ≠ 2: the residue field of ℤ₂ does not change the characteristic of ℚ₂.

**Inputs:** the signed assembly; EDC.2:pairings and EDC.8. **Source:** Deligne I, §2.6, p. 281; Milne, Theorem 27.12 and Remark 27.13, pp. 158–159. Suggested name: `TauCeti.PointCounting.middle_degree_parity`.

### Rational descent and the exact sign

The scalar A = (−1)^χΔ belongs to ℚ×. Indeed

$$
Z_X(1/(q^dT))/(T^\chi Z_X(T))
$$

is a nonzero rational function over ℚ by WC.1, and its coefficient image is constant over ℚ_ℓ. A nonzero coefficient comparison descends the constant. With m = dχ/2, define ε = A/q^m. Since ε² = 1, it is one of +1 and −1. The rational equation is

$$
Z_X(1/(q^dT))=\varepsilon q^mT^\chi Z_X(T).
$$

For odd d, the alternating middle pairing gives ε = +1. For even d, ε = (−1)^e, where e is the algebraic multiplicity of the eigenvalue **+q^{d/2}** in H^d. This is the dimension of the generalized eigenspace. It need not be the dimension of the eigenspace, and Frobenius semisimplicity is not assumed.

**Inputs:** the signed equation and parity; WC.1 rational descent; the determinant-sign input from EDC.8. **Source:** Deligne I, §2.6, pp. 281–282; Milne, Remark 27.13, p. 159. Suggested name: `TauCeti.PointCounting.functional_equation_multiplier_descent`.

### Finite extension and the sign

Under extension k_r/k, the Betti list and χ stay fixed, F becomes F^r, and Δ_r = Δ^r. The exact multiplier is (−1)^χΔ^r. The normalized sign obeys

$$
\varepsilon_r=(-1)^{(r+1)\chi}\varepsilon^r,
$$

with q replaced by q^r in the functional equation. In particular, raising ε alone to the r-th power can give the wrong answer. The determinant of the powered permutation handles nontrivial component cycles automatically.

**Inputs:** WC.0 Frobenius extension compatibility and the preceding multiplier descent. **Source:** Deligne I, §2.6, pp. 281–282, together with the base-extension argument in §7.2 ⇒ §1.7, p. 301. Suggested name: `TauCeti.PointCounting.functional_equation_base_extension`.

A geometric point has χ = 1 and ε = −1. The projective plane has χ = 3 and multiplier −q³T³. A genus-two curve has χ = −2 and multiplier q⁻¹T⁻². These are checks of the same rational-function identity. The equivariant coefficientwise duality application appears after the polynomial-count theorem in WC.5.

## WC.3 — Separating integral factors by weight

The arithmetic presentation of WC.1 determines a reduced numerator and denominator. Purity makes the contribution of each cohomological degree distinguishable inside those polynomials. The generic extraction theorem is kept independent of projectivity so that WC.6 can use it again.

### Generic degreewise extraction

Let q > 1 be an integer. Consider finitely many normalized polynomials P_i over a characteristic-zero realization field. Their reciprocal roots α_{i,j} are nonzero and algebraic over ℚ, with multiplicities b_i. Suppose each α_{i,j} has modulus q^{i/2} under every ℚ-embedding of its number field into ℂ. Suppose the alternating product of the P_i is a fixed R ∈ ℚ(T), whose reduced numerator and denominator are in ℤ[T] with constant coefficient one.

Then each P_i is the coefficient image of a unique Π_i ∈ ℤ[T], normalized by Π_i(0) = 1 and of degree b_i. Different degrees give Π_i that are coprime over ℚ. For odd i, Π_i is the weight-i part of the reduced numerator; for even i, it is the weight-i part of the reduced denominator. This characterizes the factors independently of a realization field or coefficient prime.

The proof has three distinct steps. Since q > 1, the degree moduli differ, so no reciprocal root cancels across different degrees. In a finite Galois splitting field over ℚ, the set of roots belonging to each weight is Galois stable, giving rational coefficients. Reversing normalized factors makes their reciprocal roots roots of monic integral polynomials; integral closure or Gauss's lemma then gives integer coefficients for Π_i. The degree statement uses nonzero reciprocal roots. The theorem applies to any actual realization with these hypotheses.

**Inputs:** WC.1 normalized integral presentation; DWP.0/weil-q-number; `IsGalois.mem_range_algebraMap_iff_fixed` under finite-dimensional Galois hypotheses and `IsIntegrallyClosed.eq_map_mul_C_of_dvd`. **Source:** Deligne I, proof of (1.7) ⇒ (1.6), pp. 276–277; Milne, §27.14(c)–(d) and proof, p. 159. Suggested name: `TauCeti.PointCounting.degreewise_pure_factor_extraction`.

### The projective Weil factors

For smooth projective X/k, import the actual projective purity theorem from DWP.4. No geometric-connectedness hypothesis is needed. Apply generic extraction to the WC.1 determinant expression. For every i there is a unique Π_i ∈ ℤ[T] whose coefficient image equals det(1 − TF on H^i) for every ℓ ≠ p. It has constant coefficient one and degree b_i.

Its reciprocal roots are algebraic integers, and every complex conjugate of each has modulus q^{i/2}. Factors in different degrees are coprime; both the factors and their degrees are independent of ℓ. This conclusion contains no Frobenius semisimplicity statement.

**Inputs:** WC.0 rational realization; WC.1 cohomological comparison; generic extraction; DWP.4 projective purity. **Source:** Deligne I, Theorem 1.6 and Lemma 1.7, p. 276, with the extraction proof on pp. 276–277. Suggested name: `TauCeti.PointCounting.integral_projective_weil_factors`.

The zero space gives Π_i = 1. A permutation in degree zero retains its cycle factors and all roots of unity with their multiplicities. A unipotent block has the same polynomial as its semisimplification; this does not identify the two operators. These checks preserve the scope of the theorem.

## WC.4 — Betti numbers in a specified comparison family

### Transport to a complex fibre

Let f:X → S be smooth proper, S connected, and ℓ invertible on S. Specify a geometric finite-field fibre, a complex geometric fibre, and an étale transport path γ between them. Compose the supplied rational fibre transport with Artin comparison to obtain

$$
H^i_{\mathrm{et}}(X_{\bar s},\mathbb Q_\ell)
\simeq
H^i_{\mathrm{sing}}(X_t(\mathbb C),\mathbb Q)
\otimes_{\mathbb Q}\mathbb Q_\ell.
$$

The isomorphism depends on γ; dimensions and Betti numbers do not. Compatibility with cup products, Tate twists and finite group actions is part of the supplied comparison. The exact family and path are arguments. No conclusion constructs a lifting family or complex variety from an arbitrary finite-field scheme.

**Inputs:** WC.0 rational realization; EtaleBaseChange Layers 7–8 for lisse higher direct images and transport; ComplexComparison Layers 10–12; EllAdicRealization Layer 10. **Source:** Milne, §27.14(e), p. 159, with proper-smooth transport in Theorems 20.2–20.4, pp. 127–128, its lifting application in Theorem 20.5, p. 129, and Artin comparison in Theorem 21.1, p. 130; the named comparison layers specify the maps and compatibilities. Suggested name: `TauCeti.PointCounting.betti_comparison_supplied_family`.

This interface can compare a complete intersection with a supplied complex complete intersection, or compare the fibres of a family over Spec ℤ after removing the coefficient prime. A case with no specified complex fibre still has the WC.3 factor theorem; it does not receive a complex Betti comparison. Equivariant polynomial counts use this transport only after WC.5 establishes the Tate conclusion.

## WC.5 — Counts, finite spectra and polynomial consequences

This layer has a numerical component that is useful independently of algebraic geometry, then applications to canonical factors and arithmetic families. The surface route is an independent branch at the end.

### Finite spectra: recovering a root from a window of moments

Let K be a field, β:Fin d → K injective, and c:Fin d → K arbitrary. Let V have entries V_{ij} = β_i^j, with rows indexed by roots and columns by exponents, and let A = V⁻¹ be Mathlib's nonsingular inverse. For n ≥ 0 and k < d,

$$
c_k\beta_k^n
=\sum_{j<d}A_{jk}\left(\sum_{i<d}c_i\beta_i^{n+j}\right).
$$

Distinctness makes V invertible. The coefficient uses A_{jk}, not A_{kj}: a moment window is the row vector (c_iβ_i^n)_i multiplied by V. Zero roots and arbitrary characteristic are allowed. For an empty family there is no k.

**Inputs:** `Matrix.vandermonde`, `det_vandermonde_ne_zero_iff`, `mul_nonsing_inv`. **Source:** Mathlib, LinearAlgebra/Vandermonde and Matrix/NonsingularInverse, the named determinant and inverse theorems; this is their finite-matrix consequence. Suggested name: `TauCeti.FiniteSpectrum.recover_consecutive_moments`.

### A quantitative moment-window bound

Now let K be a normed field, C,R ≥ 0, and suppose |Σ_i c_iβ_i^m| ≤ CR^m for all m ≥ N. For n ≥ N, the previous identity and the triangle inequality give

$$
\lVert c_k\rVert\lVert\beta_k\rVert^n
\le CR^n\sum_{j<d}\lVert A_{jk}\rVert R^j.
$$

The window constant depends on β and R but not on n. No division by R or c_k appears, so R = 0 and zero coefficients are permitted. Use positive n when deducing a conclusion from the zero-radius case.

**Inputs:** moment recovery and Mathlib `norm_sum_le`. **Source:** the same Vandermonde and inverse declarations, with finite-sum norm inequalities. Suggested name: `TauCeti.FiniteSpectrum.consecutive_moment_bound`.

### Visible distinct roots

With the same eventual bound and an injective β, c_k ≠ 0 implies |β_k| ≤ R. If R > 0 and |β_k| > R, the quantitative bound contradicts unbounded powers of |β_k|/R. If R = 0, positive tail moments vanish and the recovery identity forces c_kβ_k^n = 0.

This theorem needs neither completeness nor characteristic zero. The tail may begin at any fixed N. A root with zero coefficient is invisible and has no asserted bound.

**Inputs:** the moment-window bound; unbounded powers for a ratio greater than one; the Vandermonde moment-uniqueness theorem for the zero case. **Source:** Hongjie Yu, Appendix C, unnumbered finite-spectrum lemma and proof, p. 81; the weighted distinct-root form is proved by the explicit matrix argument above. Suggested name: `TauCeti.FiniteSpectrum.norm_le_of_distinct_moment_bound`.

### Grouping coincident roots

For α,w:Fin d → K with possible repeats, write a_β = Σ_{i:α_i=β}w_i. If the weighted moment sum is eventually bounded by CR^n, every root with a_β ≠ 0 has modulus at most R. Grouping takes place before the distinct-root theorem. A nonzero individual w_i is insufficient if the full fibre sum vanishes.

**Inputs:** the visible distinct-root theorem and finite fibre grouping. **Source:** Yu, Appendix C, p. 81; grouping is the finite algebraic reduction to distinct roots. Suggested name: `TauCeti.FiniteSpectrum.norm_le_of_grouped_moment_bound`.

### The unweighted power-sum converse

For a characteristic-zero normed field and any finite family α, an eventual bound |Σ_iα_i^n| ≤ CR^n, C,R ≥ 0, implies |α_i| ≤ R for every i. Equal roots have a positive integer multiplicity, and its image in K is nonzero. This is exactly the use of characteristic zero. Neither nonzero roots nor distinctness are required.

**Inputs:** the grouped-spectrum theorem. **Source:** Yu, Appendix C, p. 81. Suggested name: `TauCeti.FiniteSpectrum.norm_le_of_power_sum_bound`.

### Equivalence with bounds for all positive powers

For such a family and R ≥ 0, every root has modulus at most R if and only if there exists C ≥ 0 with |Σ_iα_i^n| ≤ CR^n for every n ≥ 1. In the forward direction take C = d. The converse uses the preceding theorem.

The quantifier over all positive powers is essential: a first moment, or any prescribed finite initial window without control of the tail, can miss cancellation.

**Inputs:** the power-sum converse and `norm_sum_le`. **Source:** Yu, Appendix C, p. 81; the reverse estimate is the finite triangle inequality. Suggested name: `TauCeti.FiniteSpectrum.power_sum_bound_iff`.

### Reciprocal moments escaping the unit ball

Let K be a normed field, d > 0, γ injective, 0 < |γ_i| < 1 and c_i ≠ 0 for every i. For every N there exists n ≥ max(N,1) such that

$$
\left\lVert\sum_i c_i(\gamma_i^{-1})^n\right\rVert>1.
$$

Otherwise the distinct-root theorem with R = C = 1 would bound every inverse root by one. In a p-adic field the displayed sum lies outside the valuation ring. The explicit proof works for arbitrary nonzero coefficients, not only integral coefficients, and proves escape arbitrarily far out.

**Inputs:** the distinct-spectrum bound. **Source:** Yu, Appendix C, p. 81, with this stronger coefficient generality supplied by the preceding proof. Suggested name: `TauCeti.FiniteSpectrum.reciprocal_moments_escape`.

### The convergent generating expression

For a normed field K, finite β,c, and z with |β_i z| < 1 for every i, the positive-exponent series has the specified sum

$$
\sum_{n\ge0}\left(\sum_i c_i\beta_i^{n+1}\right)z^{n+1}
=\sum_i\frac{c_i\beta_i z}{1-\beta_i z}.
$$

State it using `HasSum`, rather than assigning a totalized infinite sum to a possibly divergent series. Repeated and zero roots are allowed. Each geometric series already has a sum in K; completeness is unnecessary here.

**Inputs:** Mathlib `hasSum_geometric_of_norm_lt_one` and finite interchange of sums. **Source:** Milne, Lemma 27.5 and proof, pp. 155–156; Mustață, proof of Lemma 3.8, equations (3.11)–(3.12), p. 21. Suggested name: `TauCeti.FiniteSpectrum.hasSum_power_sum_generating`.

### A common numerator and denominator

Over any field K define local polynomial expressions

$$
D(T)=\prod_i(1-\beta_iT),\qquad
B(T)=\sum_i c_i\beta_iT\prod_{j\ne i}(1-\beta_jT).
$$

Then D(0) = 1, hence D ≠ 0. Whenever all factors 1 − β_i z are nonzero, B(z)/D(z) = Σ_i c_iβ_i z/(1 − β_i z). Thus B/D is a well-defined element of the existing rational-function field, and is the rational expression of the convergent sum. For an empty family D = 1 and B = 0.

**Inputs:** polynomial evaluation, finite products and field algebra. **Source:** Milne, Lemma 27.5, pp. 155–156; Mustață, equations (3.11)–(3.12), p. 21, with denominators explicitly combined. Suggested name: `TauCeti.FiniteSpectrum.generating_common_denominator`.

### The formal polynomial identity

Over any commutative ring K, retain the same D and B and let G be the existing PowerSeries constructor with coefficient zero at index zero and coefficient Σ_i c_iβ_i^n at n > 0. Then

$$
D G=B\quad\text{in }K[[T]].
$$

This theorem requires no norm, convergence, characteristic restriction, root distinctness, or field hypothesis. It holds with zero divisors. Prove the single-root geometric coefficient identity and multiply by the remaining factors, then sum. D, B and G are local expressions on existing carriers, not new structures.

**Inputs:** `PowerSeries.mk`, `coeff_mk`, `ext`, `mk_one_mul_one_sub_eq_one`, rescaling and coefficient multiplication, and polynomial inclusion. **Source:** Mathlib, RingTheory/PowerSeries/WellKnown, the named geometric-series product identity, with Basic's coefficient and rescale API. Suggested name: `TauCeti.FiniteSpectrum.formal_power_sum_product`.

### Comparison in Laurent series

When K is a field, the image of G in LaurentSeries K equals the image of B/D from RatFunc K under its existing algebra map. Since D(0) = 1, cancellation in the Laurent-series field follows from DG = B. The resulting expansion has no negative terms, constant coefficient zero, and positive coefficients Σ_i c_iβ_i^n.

This uses a common field of Laurent series. It does not require, or assert, a direct inclusion of every rational function into power series.

**Inputs:** the formal product and common-denominator identities; polynomial inclusion injectivity, `HahnSeries.ofPowerSeries_injective`, `RatFunc.coe_coe`, `RatFunc.algebraMap_apply_div` and coefficient comparison. **Source:** Mathlib, RingTheory/LaurentSeries and HahnSeries/PowerSeries, the named embeddings and rational-function compatibility declarations. Suggested name: `TauCeti.FiniteSpectrum.formal_power_sum_eq_ratFunc`.

### The exact pole-cancellation criterion

Let β be injective over a field and β_k ≠ 0. Evaluating B at β_k⁻¹ leaves only the k-th summand:

$$
B(\beta_k^{-1})=c_k\prod_{j\ne k}(1-\beta_j/\beta_k).
$$

All displayed factors are nonzero, so this value is zero exactly when c_k = 0. D has a simple zero there. The reduced rational function therefore has a pole at β_k⁻¹ exactly when c_k ≠ 0. With repeats, first group the roots and use their total coefficient. A zero root has no finite reciprocal pole.

**Inputs:** the common numerator and denominator. **Source:** Milne, Lemma 27.5, pp. 155–156; Mustață, proof of Lemma 3.8, p. 21, with cancellation explicitly resolved. Suggested name: `TauCeti.FiniteSpectrum.generating_pole_cancellation_iff`.

### No poles in the bounded disc

Suppose β is injective, every c_i is nonzero, and the weighted moments satisfy an eventual CR^n bound with C,R ≥ 0. If R|z| < 1, then all 1 − β_i z are nonzero and the positive generating series has the rational sum above. For R > 0 this is the open disc of radius 1/R. For R = 0 every visible root is zero and the generating expression vanishes.

Use the finite-spectrum bound first and then geometric summation. Pole analysis is a consequence and is not used circularly to establish the root bound. Coefficients that become zero after grouping must be removed before asserting denominator nonvanishing.

**Inputs:** distinct-spectrum bound, generating sum and common denominator. **Source:** Milne, Lemma 27.5, pp. 155–156; Mustață, equations (3.11)–(3.12), p. 21. Suggested name: `TauCeti.FiniteSpectrum.no_pole_of_power_sum_bound`.

### Reciprocal pairing upgrades the bound to equality

Let α be a finite complex family, τ a permutation of its index set, R > 0, and suppose α_iα_{τ(i)} = R². If its unweighted moments are eventually bounded by CR^n with C ≥ 0, the converse gives |α_i| ≤ R. Multiplying the two bounds in each pair and using the product R² forces |α_i| = R.

Taking R = √q gives the numerical curve-RH conclusion. In geometry the reciprocal pairing is an explicit duality input, and this argument is applied in every complex embedding.

**Inputs:** the unweighted converse and the specified reciprocal pairing. **Source:** Mustață, Remark 3.7, p. 21. Suggested name: `TauCeti.FiniteSpectrum.norm_eq_of_reciprocal_pairing`.

### A strict bound from little-o moments

For a normed field K, injective β, coefficients c and R > 0, suppose |Σ_i c_iβ_i^n|/R^n tends to zero. Then c_k ≠ 0 implies |β_k| < R. Apply moment recovery to consecutive shifts: every recovered c_kβ_k^n/R^n tends to zero, which excludes a visible root on or outside the boundary.

For repeated roots, group the full fibre coefficients first. The weighted statement needs neither completeness nor characteristic zero.

**Inputs:** moment recovery and finite norm inequalities. **Source:** van den Bogaart–Edixhoven, Lemma 4.1 and proof, pp. 6–7, with this weighted form obtained by the Vandermonde argument. Suggested name: `TauCeti.FiniteSpectrum.norm_lt_of_moments_little_o`.

### Polynomial approximation of graded moments

Let p > 1 be real; let r,s be natural numbers and b_i finite nonnegative integers for 0 ≤ i ≤ r. Let α_{i,j} be complex numbers of modulus p^{i/2}. If P ∈ ℚ[T] and

$$
\sum_{i=0}^r(-1)^i\sum_j\alpha_{i,j}^n-P(p^n)
=o(p^{sn/2}),
$$

then b_i = 0 for odd i ≥ s. For even i = 2j ≥ s with i ≤ r, P_j = b_i and every α_{i,k} equals the positive real p^j. Also P_j = 0 whenever 2j ≥ s and 2j > r.

Group the combined roots from the graded moments and the polynomial terms. At or above the cutoff, the strict little-o bound forces each total coefficient to vanish. Distinct cohomological moduli prevent cancellation between different degrees. Odd-degree coefficients have one sign and cannot cancel; in an even degree only the polynomial root p^j can remain. This formulation also handles s > r and makes no assertion about lower polynomial coefficients.

**Inputs:** the strict visible-root theorem. **Source:** van den Bogaart–Edixhoven, Lemma 4.1, pp. 6–7, whose range is s ≤ r ≤ 2s; Bergström–Faber–Payne, proof of Proposition 3.1, published p. 1330. The unrestricted high-cutoff form is the stated numerical extension. Suggested name: `TauCeti.FiniteSpectrum.graded_polynomial_approximation`.

The numerical checks include an empty spectrum; repeated roots with their multiplicities; roots 2 and −2 whose first moment vanishes and second moment is 8; a root with cancelling fibre weights; and two equal roots in characteristic two whose multiplicity disappears. Four roots 1, i, −1, −i have their first three moments zero and fourth moment 4. Further checks fix the inverse-Vandermonde transpose, zero-radius tails, zero at the origin, positive rather than zero exponents, repeated denominators, a zero root with no finite pole, and the reciprocal pair 3 ± 4i of modulus 5. Formal-series checks include an empty family, one root, characteristic-two cancellation, and the special constant coefficient at the origin.

### The all-extension Weil estimate

For smooth projective geometrically connected X/k of dimension d ≥ 1 and every r ≥ 1,

$$
\left|N_r-(1+q^{dr})\right|
\le\sum_{i=1}^{2d-1}b_i q^{ir/2}.
$$

The b_i are degrees of the canonical integral factors of WC.3. Geometric connectedness identifies H⁰ and H^{2d} with the scalar endpoint lines, so only interior degrees appear in the error. Apply the all-power trace formula and the triangle inequality to the eigenvalues in any complex embedding. For curves the coefficient is b₁ = 2g, with no additional factor of two.

**Inputs:** WC.3 projective factors; WC.1 all-power trace comparison; EDC.2:pairings for the endpoints; `norm_sum_le`. **Source:** Deligne I, Lemma 1.7, p. 276, and the trace application in Theorem 8.1 and proof, pp. 301–302. Suggested name: `TauCeti.PointCounting.all_extension_point_count_bound`.

### Components and dimension zero

For smooth projective pure-d X/k with d ≥ 1, let σ permute its geometric connected components and let c_r be the number fixed by σ^r. The endpoint trace is c_r(1 + q^{dr}); the same interior sum bounds

$$
\left|N_r-c_r(1+q^{dr})\right|.
$$

For d = 0, X is finite étale and there is only degree-zero cohomology: N_r = c_r. Its zeta is the product of (1 − T^m)⁻¹ over component cycles of lengths m. A geometric point gives N_r = 1. A single degree-m closed point gives m if m divides r and zero otherwise. The dimension-zero case is kept separate so that the same line is not counted twice as both endpoints.

**Inputs:** WC.0 orbit dictionary; the preceding estimate for positive dimension; EDC.2 pairings for the top permutation module; TraceFormula Layer 7 for finite-étale cohomology. **Source:** Deligne I, §§1.4–1.5, pp. 274–275, and §2.5, p. 281. Suggested name: `TauCeti.PointCounting.component_and_dimension_zero_counts`. The explicit finite-étale factor comparison is used again in WC.7.

### Compatibility with curve and elliptic bounds

For a smooth projective geometrically connected genus-g curve, use the actual curve/Jacobian comparison b₁ = 2g to identify the WC bound with the independent Jacobian/Rosati bound from DWP.1. For a nonsingular Weierstrass elliptic model, identify the scheme count with `WeierstrassCurve.pointCount` and its existing point type. Its trace a_q = q + 1 − N₁ is `frobeniusTrace`, and |a_q| ≤ 2√q agrees with the independent Hasse theorem.

Make the same comparison over each k_r using WC.0's extension transport. The result is agreement of counts and estimates. It does not repeat the Jacobian or elliptic proof.

**Inputs:** the all-extension estimate; DWP.1/weil-estimate-for-curves and DWP.1/weights-of-the-cohomology-of-curves; **EllipticCurves, Layer 3**; Tau Ceti `pointCount`, `pointCount_eq_card_point` with ellipticity and finite affine solutions, and `frobeniusTrace`. **Source:** Milne, Theorem 27.15, p. 159, for the purity estimate; Mustață, Example 3.10, pp. 22–23, for elliptic normalization. Suggested name: `TauCeti.PointCounting.curve_elliptic_bound_comparison`.

### Recurrences and Newton recovery

Let a canonical factor be Π_i(T) = 1 + c_{i,1}T + ⋯ + c_{i,b_i}T^{b_i} and set S_{i,n} = Tr(F_i^n), with the algebraic zeroth moment S_{i,0} = b_i. Then for n ≥ b_i,

$$
S_{i,n}+\sum_{j=1}^{b_i}c_{i,j}S_{i,n-j}=0.
$$

For 1 ≤ n ≤ b_i, Newton's identity reads

$$
S_{i,n}+\sum_{j=1}^{n-1}c_{i,j}S_{i,n-j}+n c_{i,n}=0.
$$

In characteristic zero the first b_i moments recover the factor recursively. These algebraic statements are valid for any finite list of roots, including repeated roots and a zero-dimensional list. Their geometric application requires the appropriate factor realization, but not a root-modulus bound.

For a genus-g curve, S_n = 1 + q^n − N_n and S₀ = 2g. In any dimension, Q_total = ∏_i Π_i annihilates the point-count moment sequence after the algebraic continuation N₀ = χ. This is not a point count over a field with one element. Its degree Σ_i b_i is an upper bound on recurrence order; cancellations can reduce the minimal order.

**Inputs:** DWP.0 trace/determinant algebra and `Matrix.reverse_charpoly`; WC.3 for general canonical projective factors and WC.1's root-bound-free curve numerator for curves. **Source:** Milne, Lemma 27.5 and Theorem 27.6, pp. 155–156; Deligne I, equation (1.5.3), pp. 275–276, and §1.15, p. 279. Suggested name: `TauCeti.PointCounting.extension_count_recurrence`.

### Complete intersections

Let X/k be a smooth projective geometrically connected complete intersection of dimension n ≥ 1 and fixed multidegree. Through the complete-intersection comparison, let b′ be the middle Betti number of a smooth complex complete intersection of the same dimension and multidegree. Put b = b′ if n is odd and b = b′ − 1 if n is even. Then for all r ≥ 1,

$$
\left|\#X(k_r)-\#\mathbb P^n(k_r)\right|\le b q^{nr/2}.
$$

Weak Lefschetz identifies the nonmiddle cohomology with projective space. The middle primitive part has exactly b reciprocal roots and is the only error term, with trace sign (−1)^n. The complex model and comparison come from the complete-intersection supplier, rather than an arbitrary lifting assumption for all varieties.

**Inputs:** the Weil estimate; WC.4 comparison in the supplied family; EDC.4 weak Lefschetz and the primitive-middle comparison. **Source:** Deligne I, Theorem 8.1 and its proof, pp. 301–302. Suggested name: `TauCeti.PointCounting.complete_intersection_point_count`.

### Exact polynomial point count

For an isomorphism-invariant count function N:ℕ → ℚ and P ∈ ℚ[T], define `TauCeti.PointCounting.HasPolynomialPointCount N P` by

$$
\forall q\in\mathbb N,\quad
\operatorname{IsPrimePow}(q)\ \Longrightarrow\ N(q)=P(q).
$$

Mathlib's prime-power predicate means p^r with p prime and r ≥ 1. Values of N at 0, 1 and non-prime-powers do not affect the predicate. Actual point sets or finite-mass groupoids supply N through WC.0 and WC.1. This definition does not create geometric point sets from a numerical function.

| Name in TauCeti.PointCounting | Hypotheses and conclusion |
| --- | --- |
| `HasPolynomialPointCount_eval` | A witness and a prime-power q give N(q) = P(q). |
| `HasPolynomialPointCount_unique` | Two polynomial witnesses for the same N are equal. |
| `HasPolynomialPointCount_zero` | The zero function has witness zero. |
| `HasPolynomialPointCount_add` | Witnesses P,Q for N,M give witness P + Q for the pointwise sum. |
| `HasPolynomialPointCount_mul` | Witnesses P,Q give witness PQ for the pointwise product. |
| `HasPolynomialPointCount_congr` | Functions equal on prime powers have exactly the same witnesses. |

Uniqueness uses infinitely many prime-power evaluations and Mathlib's `Polynomial.eq_of_infinite_eval_eq`. The operation lemmas transport disjoint-union and product counts when the geometric comparisons supply those operations.

Definition checks: N(q) = q + 1 has witness T + 1 for a projective line; the empty count has witness zero; N(q) = q − 1 has witness T − 1 for the multiplicative group. Replacing N(4) by zero while retaining q + 1 elsewhere fails the predicate, despite agreement at every prime. Two distinct polynomials can agree at q = 2, so one field does not identify a witness.

**Inputs:** `IsPrimePow`, polynomial evaluation and infinite-evaluation equality. **Source:** Bergström–Faber–Payne, §1 polynomial-count property, published p. 1324, and Proposition 9.3, p. 1352; van den Bogaart–Edixhoven, Theorem 2.1, hypothesis (*), p. 3. The API and checks use this exact quantifier.

### A local cutoff for approximate polynomial counts

Let X be smooth proper of pure relative dimension d over ℤ_p and s ≥ d an integer. Choose the geometric, coefficient and comparison data giving the generic rational Betti spaces, with ℓ ≠ p. Suppose P ∈ ℚ[T] and

$$
\#X(\mathbb F_{p^n})-P(p^n)=o(p^{sn/2})\quad(n\longrightarrow\infty).
$$

Then H^k vanishes for odd k ≥ s. For s ≤ 2j ≤ 2d, P_j = dim H^{2j}, and all reciprocal Frobenius roots in that degree are p^j. These are eigenvalue and dimension conclusions, not semisimplicity conclusions.

For a DM stack, use mass and the actual stack trace, purity, smooth proper transport and rational comparison contracts. The same graded-moment argument then applies. The error exponent used throughout the proof is s, so it remains valid when s > d.

**Inputs:** graded polynomial approximation; WC.4 supplied comparison; WC.1 stack trace where applicable; DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 and the stack purity application in WC.6. **Source:** Bergström–Faber–Payne, Proposition 3.1 and proof, published p. 1330; van den Bogaart–Edixhoven, Lemma 4.1, pp. 6–7. Suggested name: `TauCeti.PointCounting.local_polynomial_count_cutoff`.

### Approximate counts and Tate semisimplification

Let U be a nonempty open in Spec ℤ, and X/U smooth proper of finite type and pure relative dimension d. Let S be a set of primes in U of **Dirichlet density one**. Suppose a fixed P ∈ ℚ[T] satisfies, for each p ∈ S,

$$
\#X(\mathbb F_{p^n})=P(p^n)+o(p^{nd/2})
\quad\text{as }n\longrightarrow\infty.
$$

There is a unique palindromic polynomial C ∈ ℤ[T] with nonnegative coefficients, degree at most d, and C_j = P_j for 2j ≥ d. For every p in U and n ≥ 1 the exact count is C(p^n). If the generic fibre is nonempty, deg C = d; an empty family gives C = 0.

For every ℓ, the actual generic Galois representation has H^odd = 0 and

$$
H^{2j}(X_{\overline{\mathbb Q}},\mathbb Q_\ell)^{\mathrm{ss}}
\simeq\mathbb Q_\ell(-j)^{C_j}.
$$

Smooth proper transport supplies the good-reduction Frobenius traces; duality recovers low degrees from the high-cutoff conclusions; the density-one theorem identifies the semisimplifications. Varying ℓ permits the exact count at any good prime, including one equal to an initially chosen coefficient prime.

The input P may have incorrect lower coefficients. For example, on ℙ² the approximation T² + T has error 1, which is little-o of p^n, while the exact count is T² + T + 1. The theorem constructs C instead of asserting P = C. For a DM stack, all of the stack trace, comparison, purity and duality inputs are explicit requirements.

**Inputs:** the local cutoff; WC.4 transport; WC.2 duality; **ArithmeticGaloisRepresentations:R01.5** for density-one Frobenius determination; polynomial equality on infinitely many evaluations. **Source:** van den Bogaart–Edixhoven, Theorem 2.1, p. 3, and proof in §4, pp. 6–9. Suggested name: `TauCeti.PointCounting.approximate_counts_tate_semisimplification`.

### Polynomial counts over all Spec ℤ

For smooth proper finite-type X over **all** Spec ℤ, of pure relative dimension d, exact polynomial counts over every finite field are equivalent to the existence of nonnegative integers C_j such that for every ℓ,

$$
H^{\mathrm{odd}}=0,\qquad
H^{2j}(X_{\overline{\mathbb Q}},\mathbb Q_\ell)
\simeq\mathbb Q_\ell(-j)^{C_j}
$$

as actual continuous Galois representations. The unique count polynomial is Σ_j C_jT^j and is palindromic. This is stronger than the open-U result.

To remove semisimplification, twist each even-degree representation to weight zero. Good reduction gives unramifiedness away from ℓ, and local potential semistability at ℓ is supplied by R06.2/R06.5. The local extension theorem used in van den Bogaart–Edixhoven's Lemma 4.2 makes successive extensions of trivial representations unramified at ℓ. The global absence of nontrivial everywhere-unramified extensions of ℚ then splits the resulting representation. The all-Spec-ℤ hypothesis is necessary for this argument. The reverse implication is the all-power trace formula at each prime with a different coefficient prime.

The DM version has the same conclusion only with the stack extension of the comparison and local p-adic inputs, as well as trace, purity and duality. The theorem does not infer that extension from the scheme case.

**Inputs:** exact polynomial count; the open-U theorem; **PadicHodgeTheory:R06.2**, **R06.5/crystalline-comparison-good-reduction**; **NumberFieldArithmetic, Layer 6** for the global ramification consequence, supported by `NumberField.abs_discr_gt_two`; the stack Part II contracts when applicable. **Source:** van den Bogaart–Edixhoven, Theorem 2.1 last clause, p. 3, Lemma 4.2 and the end of the proof, pp. 8–10; Bergström–Faber–Payne, §3, p. 1330, and Proposition 9.3, p. 1352. Suggested name: `TauCeti.PointCounting.polynomial_counts_over_z_tate_cohomology`.

### Equivariant polynomial counts

Let a finite group G act over ℤ on such a smooth proper scheme X, and assume scalar polynomial point counts at every finite field. Use the actual rational Betti representations of its complex fibre to form

$$
A(T)=\sum_j[H^{2j}_{\mathrm{sing}}(X(\mathbb C),\mathbb Q)]T^j
\in R_{\mathbb Q}(G)[T].
$$

Odd cohomology vanishes. For every q and σ ∈ G, the character of A(q) at σ is #X^σ(𝔽_q), where the twist is constructed over that field. Functorial comparison intertwines G and Frobenius, and the preceding full Tate theorem makes Frobenius q^j times the identity in degree 2j. Hence the coefficients are actual representation classes, with nonnegative integral complex multiplicities.

For rational irreducible representations, retain their Schur indices and endomorphism fields when extracting multiplicities. Complex character inner products alone do not automatically give rational-irrep multiplicities. The DM version also requires effective twists and the stack comparison/purity/duality and arithmetic inputs.

**Inputs:** WC.4 comparison; the all-Spec-ℤ Tate theorem; WC.1 twists and character-lattice comparison; Tau Ceti `repRing` and `repRingCharacter`. **Source:** Bergström–Faber–Payne, Proposition 9.3 and proof, published p. 1352. Suggested name: `TauCeti.PointCounting.equivariant_polynomial_point_counts`.

### Equivariant palindromicity

Under the preceding hypotheses with pure relative dimension d, G-equivariant Poincaré duality identifies the coefficient in degree j with the dual of that in degree d − j. In the existing rational representation ring,

$$
A_j=A_{d-j}^{\vee},\qquad
A(T)=T^d A(T^{-1})^{\vee}.
$$

The second equality is a Laurent-polynomial identity, with dual applied to each coefficient. Multiplicity polynomials for dual irreducibles are paired. Each is palindromic when that irreducible is self-dual. A DM application uses stack duality, rather than the scheme pairing.

**Inputs:** equivariant polynomial counts; EDC.2:pairings, or the stack Part II pairing; Tau Ceti representation-ring duality. **Source:** Bergström–Faber–Payne, Remark 9.4, published p. 1352. Suggested name: `TauCeti.PointCounting.equivariant_polynomial_duality`.

### The independent surface route to curve bounds

For a smooth projective geometrically connected curve C/k of genus g and every r ≥ 1, import the SF.5 graph/diagonal Hodge-index theorem over k_r and compare its fixed-point count with N_r.

Its surface contract works on C × C over the algebraic closure. Set A = {P} × C, B = C × {P}, Δ the diagonal, and Γ_r the graph (x,F_q^r x). The intersection convention is

$$
A^2=B^2=0,\quad A B=1,\quad
\Delta A=\Delta B=1,\quad
\Gamma_r A=1,\quad\Gamma_r B=q^r,
$$

$$
\Delta^2=2-2g,\quad
\Gamma_r^2=(2-2g)q^r,\quad
\Delta\Gamma_r=N_r.
$$

With D = Δ − A − B and E = Γ_r − q^rA − B, both are orthogonal to the ample divisor A + B, and

$$
D^2=-2g,\quad E^2=-2gq^r,\quad DE=N_r-1-q^r.
$$

Hodge index gives |N_r − 1 − q^r| ≤ 2gq^{r/2}. SF.5 owns the intersections, adjunction, ampleness and Hodge-index inequality. Here the comparison transports that result to the exact extension-point tower, retaining every r.

**Inputs:** SF.5 surface theorem; WC.0 point-tower and orbit comparisons. **Source:** Mustață, proof of Theorem 3.6 and Proposition 3.9, p. 22, with the fibre labels fixed as above. Suggested name: `TauCeti.PointCounting.surface_all_extension_bound_comparison`.

### Curve RH from the surface bound

Take the WC.1 integral degree-2g numerator Π_C, which was constructed without a root bound. Its trace formula and the surface estimate give |Σ_jα_j^r| ≤ 2gq^{r/2} for every positive r. The finite-spectrum converse gives |α_j| ≤ √q. The purity-independent reciprocal pairing from WC.2 then forces equality.

Since Π_C has rational integral coefficients, its full reciprocal-root multiset includes every complex conjugate with multiplicity. This establishes the all-conjugates curve RH statement and agrees with the same numerator and functional equation. This route has no dependence on DWP.1, DWP.4, WC.3 projective purity, or the Weil estimate earlier in WC.5.

**Inputs:** surface all-extension bound; WC.1 curve numerator and trace formula; WC.2 duality; finite-spectrum converse and reciprocal-pairing equality. **Source:** Mustață, Remark 3.7, Lemma 3.8 and Theorem 3.6, pp. 21–22. Suggested name: `TauCeti.PointCounting.curve_rh_from_surface_bound`.

## WC.6 — Smooth proper and mixed extensions

This layer reuses the preceding arithmetic and determinant algebra with broader geometric inputs. Smooth proper purity is an import from DWP.7, while the mixed statement controls the divisor of an L-function and has a different conclusion.

### Integral factors for smooth proper schemes

Let X/k be smooth proper of finite type and dimension at most d. For every i there is a unique Π_i ∈ ℤ[T] whose coefficient image is det(1 − TF on H^i) for every prime ℓ ≠ p. It has constant coefficient one, degree dim H^i, and reciprocal roots that are algebraic integers pure of weight i in every complex embedding. For i > 2d or empty X, Π_i = 1. The factors and dimensions are independent of ℓ.

Projectivity, geometric connectedness and Frobenius semisimplicity are not hypotheses. DWP.7 supplies actual smooth proper purity. WC.1 supplies the normalized integral rational zeta, and the **generic** extraction theorem in WC.3 separates the factors. This application reuses those arguments without invoking the projective specialization.

The examples must include a genuine smooth proper nonprojective variety from DWP.10, with its actual construction and cohomology comparison. Projective spaces alone do not exercise the removal of projectivity. The empty scheme and a degree-m finite étale point separately check trivial factors and a nontrivial degree-zero permutation.

**Inputs:** SF.2 actual geometry; WC.0 realization; WC.1 cohomological comparison and normalized integral presentation; WC.3 generic degreewise extraction; DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11; `Matrix.charpolyRev` and `eval_charpolyRev`. **Source:** Deligne II, Corollary 3.3.9 and proof, p. 207; Deligne I, proof of (1.7) ⇒ (1.6), pp. 276–277. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.exists_unique_integral_degree_factors_of_smooth_proper`.

### Reciprocal zeros and poles of mixed L-functions

Let X/k be separated finite type of dimension at most d. Let ℓ ≠ p and let a constructible algebraic ℚ̄_ℓ-sheaf descend to a finite extension E/ℚ_ℓ, mixed of integral weights at most n in the all-complex-conjugates sense. Use its closed-point Euler product and rational compact-support determinant realization L(X,ℱ,T) ∈ E(T).

If β ≠ 0 is a zero or pole of the **reduced** rational function, then α = β⁻¹ is algebraic over ℚ and has an integral weight w ≤ n + 2d: every conjugate has modulus q^{w/2}. Compact-support degree i contributes weights at most n + i, and i ≤ 2d. Cancellation can remove a divisor contribution but cannot introduce a new reciprocal root.

There is no smoothness or properness assumption. The result does not assert integer coefficients or ℓ-independence for individual cohomological factors, nor weight exactly i. A sheaf with a real weight relative to only one chosen embedding does not meet the algebraic mixedness hypothesis here.

**Inputs:** SF.2; DWP.7/weights-mixed-sheaves-definitions and DWP.7/cohomological-bounds-3-3-2-3-3-6; TraceFormula Layer 14; matrix determinants and `RatFunc`. **Source:** Deligne II, Corollary 3.3.4, p. 206; SGA 4½, Rapport, §§3.1–3.4 and 3.6, pp. 86–88, for determinant rationality and the closed-point formula. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.reciprocal_divisor_weight_le`.

### The smooth proper signed equation

For smooth proper pure-d X/k, apply WC.2 to the actual graded pairing and the canonical factors just obtained. With b_i = deg Π_i, χ = Σ_i(−1)^i b_i and Δ the alternating determinant, Δ is the same nonzero rational number for every ℓ, and

$$
\Delta^2=q^{d\chi},\qquad
Z_X(1/(q^dT))=(-1)^\chi\Delta T^\chi Z_X(T)
\quad\text{in }\mathbb Q(T).
$$

The determinants can also be read from the highest coefficients of Π_i: their normalization makes this another check of ℓ-independence. Integer exponents handle negative χ. This is the WC.2 theorem on the smooth proper factor package, not a second construction of the multiplier.

**Inputs:** smooth proper integral factors; WC.2 signed assembly, parity and multiplier descent; EDC.2:pairings and EDC.8; SF.2. **Source:** Deligne I, §§2.3–2.6, pp. 281–282, with (1.5.4). Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_of_smooth_proper`.

### Proper rational homology manifolds

Let X/k be proper finite type of pure dimension d. For every ℓ under consideration suppose its actual dualizing object has a **Frobenius-equivariant** isomorphism

$$
a^!\mathbb Q_\ell\simeq\mathbb Q_\ell(d)[2d],
\qquad a:X\longrightarrow\operatorname{Spec}k.
$$

This geometric dualizing-object condition gives the rational homology-manifold form of duality. DWP.7 then gives weight i for constant H^i. WC.1 and generic extraction yield normalized integral Π_i, independent of ℓ. EDC.1 biduality must supply the perfect graded Frobenius pairing and its determinant reciprocity; the algebraic WC.2 assembly gives the signed functional equation with the actual Δ and integer χ.

The geometric isomorphism is the hypothesis. It is not replaced by a field asserting purity or RH. No smoothness is required once this dualizing-object contract is supplied.

**Inputs:** DWP.7 smooth-proper/homology-manifold weight theorem; EDC.1:biduality and EDC.8 for the pairing/determinant extension; WC.1 normalized zeta; WC.3 generic extraction; WC.2 algebraic assembly; SF.2. **Source:** Deligne II, §3.3.11, p. 207. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.weil_factors_of_dualizing_constant`.

### Smooth proper DM stack purity

For a smooth proper finite-type DM stack over k and ℓ ≠ p, its genuine finite-dimensional rational H^i, with geometric Frobenius, is pure of weight i in every complex embedding. Rational coefficients impose no restriction that ℓ be prime to stabilizer orders, and no global quotient presentation is a hypothesis.

Use the stack rational-cohomology and duality contracts, with the appropriate finite-characteristic coarse/étale comparison. The constant-coefficient argument then passes through the homology-manifold purity theorem. This target is a purity application. Stack masses, stack zeta rationality and stack duality are the separate Part II exports used by applications.

**Inputs:** SF.1 and its stack Part II cohomology/coarse-space extension; the stack duality extension of EDC.1; DWP.7 homology-manifold purity. **Source:** Bergström–Faber–Payne, proof of Proposition 3.1, published p. 1330, and proof of Proposition 4.2, p. 1331; Deligne II, §3.3.11, p. 207. van den Bogaart–Edixhoven, Lemma 3.2, p. 5, gives the coarse comparison in characteristic zero; the finite-characteristic version is a distinct supplier requirement. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.pure_cohomology_of_smooth_proper_dm_stack`.

### The rigid/crystalline comparison boundary

For smooth proper X over 𝔽_q, RD.7 supplies the equality between its rigid/crystalline Frobenius determinants and the canonical integral degree factors. When q = p^f, the comparison uses the **linear** q-Frobenius φ^f, rather than comparing a p-semilinear map as though it were an ordinary linear endomorphism. Degreewise weight separation reuses WC.3's generic extraction after the RD trace and purity inputs.

The imported equality is an equality of characteristic polynomials with specified coefficient maps. It does not assert a universal equivalence between crystalline and ℓ-adic cohomology spaces. **Source and owner:** **PadicDifferentialEquationsAndRigidCohomology:RD.7**; Kedlaya, Notes on isocrystals, §§8.1–8.8 and 9.1–9.7, pp. 20–22, and §§10.1–10.3, p. 27 of arXiv v6; Fourier transforms and p-adic Weil II, published §5.3, Proposition 5.3.1, Theorem 5.3.2 and consequences (a)–(c), pp. 1445–1446 (preprint §6.6, pp. 50–52). This is the interface to that roadmap's theorem.

## WC.7 — Geometric calculations and the assembled theorem

The examples in this layer compare the canonical factors with independently constructed geometry. A matrix with the expected eigenvalues is a useful convention check, but the geometric application also needs a comparison identifying that matrix with Frobenius on the specified scheme. Counts over every extension use the same Frobenius operator and the all-power trace formula. The cycle and surface calculations therefore use WC.1's trace theorem and WC.5's recurrence interfaces, while purity is used to identify their canonical integral factors.

### Projective spaces

Let n ≥ 0 and take the actual projective space ℙⁿ/k. The supplier's hyperplane class identifies H^{2j} with ℚ_ℓ(−j) for 0 ≤ j ≤ n, and all odd groups vanish. Thus

$$
\Pi_{2j}(T)=1-q^jT\quad(0\le j\le n),\qquad
\Pi_i(T)=1\quad\text{otherwise},
$$

$$
Z_{\mathbb P^n}(T)=\prod_{j=0}^n(1-q^jT)^{-1},\qquad
N_r=\sum_{j=0}^n q^{jr}\quad(r\ge1).
$$

The cohomology computation and its Frobenius action precede the zeta calculation. They are not reconstructed by guessing eigenvalues from the point count. For n = 0 the answer is 1/(1 − T), consistent with the dimension-zero branch of WC.5. For n = 1, N₁ = q + 1 and the signed multiplier is qT².

**Inputs:** SF.2 projective-space construction; TraceFormula Layer 12 hyperplane computation and Layer 13; WC.6 smooth proper factors; WC.1 all-power trace formula; WC.5 recurrence interface. **Source:** CohomologicalPointCounting, TraceFormula Layer 12 projective-space computation and Layers 13–15 worked examples; Deligne I, §§1.5 and 2.5–2.6, pp. 275–276 and 281–282, specialized to these Tate classes. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_projective_space`.

### Finite étale schemes

For finite étale X/k, write its finite geometric point set as disjoint Frobenius orbits of lengths m₁,…,m_s, each positive. Frobenius acts by the corresponding permutation on H⁰. Its characteristic determinant is

$$
\Pi_0(T)=\prod_{a=1}^s(1-T^{m_a}),\qquad
\Pi_i(T)=1\ (i>0),\qquad
N_r=\sum_{a:m_a\mid r}m_a.
$$

This identifies the actual canonical factor with the orbit polynomial, including multiplicities when orbit lengths coincide. For Spec k_m there is a single factor 1 − T^m, and the count is m for m ∣ r and zero otherwise. Its zeros are roots of unity, as weight zero requires. Empty X has the empty product one and every count zero. This is the geometric factor application of the WC.0 orbit dictionary and WC.5 dimension-zero calculation.

**Inputs:** SF.2 finite étale schemes; WC.0 closed points; TraceFormula Layer 7 independent permutation cohomology; WC.1 determinant trace formula; WC.6 smooth proper factors. **Source:** TraceFormula Layer 7 and its finite-étale examples; Deligne I, §1.4(c)–(d), p. 275; SGA 4½, Rapport, Corollary 3.4 and Remark 3.5, pp. 87–88. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.degree_factor_finite_etale_orbits`.

### Products and Künneth

Let X,Y/k be smooth proper, with canonical degree factors and actual Frobenius operators F_i,G_j. The Frobenius-equivariant Künneth isomorphism gives, for each n,

$$
\Pi_n(X\times_kY,T)
\mapsto\prod_{i+j=n}\det(1-T(F_i\otimes G_j))
$$

under the specified map from ℤ[T] to the coefficient field. Tensor products multiply eigenvalues; direct sums multiply determinant polynomials. This formula agrees with N_r(X × Y) = N_r(X)N_r(Y) for every r ≥ 1, since traces of tensor products multiply. It does not give a product formula Z_{X×Y} = Z_XZ_Y.

For ℙ¹ × ℙ¹ the degree factors are 1 − T, (1 − qT)² and 1 − q²T in degrees 0,2,4, and one in every odd degree. Hence

$$
Z(T)=\frac1{(1-T)(1-qT)^2(1-q^2T)},\qquad
N_r=(1+q^r)^2.
$$

**Inputs:** SF.2 fibre products; TraceFormula Layers 11–12 Künneth and group actions, Layer 13 determinant realization; WC.6 factors; the projective-space computation; WC.5 all-power traces and recurrences. **Source:** TraceFormula Layers 11–13 and the product example; Deligne I, §1.5.3, pp. 275–276, with the supplier's Künneth isomorphism. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_product_of_smooth_proper`.

### Curves and their Jacobians

Let C/k be smooth proper and geometrically connected of genus g. The curve/Jacobian realization compares the canonical Π₁ with det(1 − TF | H¹_et) and with the Frobenius polynomial of its Jacobian. Then

$$
\Pi_0=1-T,\quad \Pi_2=1-qT,\quad
\deg\Pi_1=2g,\qquad
\Pi_1(T)=q^gT^{2g}\Pi_1(1/(qT)),
$$

$$
N_r=1+q^r-S_r,\qquad S_r=\operatorname{Tr}(F^r\mid H^1),\quad r\ge1.
$$

The identification with the Jacobian is a comparison of constructions, including Frobenius and Tate conventions. It imports the curve/Jacobian Betti-number theorem; coherent genus alone does not supply it. WC.5 recovers the polynomial and all S_r from the initial moments, and gives the recurrence and the precise pole multiplicities. None of these trace identities requires semisimplicity. The numerator comparison with WC.1 remains valid before RH is supplied; WC.6 additionally identifies the canonical integral factor and its pure reciprocal roots.

At g = 0, Π₁ = 1 and N_r = 1 + q^r. At g = 1, writing a = q + 1 − N₁ gives Π₁ = 1 − aT + qT² and S_r = aS_{r−1} − qS_{r−2}, with S₀ = 2. These normalizations connect the curve factor to the independent elliptic point-count carrier.

**Inputs:** SF.2 curves; TraceFormula Layers 8 and 15 curve/Jacobian realization; WC.1 curve numerator; WC.6 smooth proper factors and signed equation; WC.5 recurrence and moment recovery. **Source:** TraceFormula Layers 8 and 15; Deligne I, §§1.5–1.5.4, pp. 275–276; Mustață, Remark 3.7, equations (3.8)–(3.10), p. 21. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.degree_one_factor_curve`.

### An elliptic curve over 𝔽₅

Use the actual Weierstrass curve with a₁ = a₂ = a₃ = a₆ = 0 and a₄ = −1 over 𝔽₅, giving y² = x³ − x. Its discriminant is 64, nonzero modulo 5, so its smooth proper completion is an elliptic curve. For x = 0,1,2,3,4, the numbers of affine y-solutions are 1,1,2,2,1 respectively. The point at infinity gives N₁ = 8 and a = −2. Therefore

$$
\Pi_1=1+2T+5T^2,\qquad
Z_E(T)=\frac{1+2T+5T^2}{(1-T)(1-5T)}.
$$

The reciprocal roots have sum −2 and product 5. The all-extension recurrence is

$$
S_0=2,\quad S_1=-2,\quad
S_r=-2S_{r-1}-5S_{r-2}\quad(r\ge2).
$$

It gives S₂ = −6 and N₂ = 1 + 25 − (−6) = 32. The calculation must compare the enumeration with `WeierstrassCurve.pointCount_eq_card_point` and the scheme's point dictionary. Checking the affine equation or a 2 × 2 companion matrix alone is only part of this geometric application.

**Inputs:** the curve factor comparison; SF.2 model and point dictionary; Mathlib `WeierstrassCurve`, `WeierstrassCurve.Δ`, and `WeierstrassCurve.Affine.Equation`; Tau Ceti `pointCount`, `pointCount_eq_card_point` and `frobeniusTrace`; WC.5 recurrence. **Source:** TraceFormula Layers 8 and 15, elliptic specialization; the elementary enumeration just given uses the specified equation, with the genus-one normalization of Mustață, Example 3.10, pp. 22–23. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.zeta_weierstrass_five`.

### A genus-two curve with negative Euler characteristic

Let C/𝔽₂ be the smooth projective curve of the function field defined by y² + y = x⁵. The Artin–Schreier supplier constructs the model, proves geometric connectedness, and gives genus 2 and a single rational point at infinity. Its reduced pole order is 5, and the Artin–Schreier different and Hurwitz formula supply the genus. The affine equation is not itself the proper model.

For k_r = 𝔽_{2^r}, the map y ↦ y² + y has kernel of size two and image the trace-zero elements. Thus

$$
N_r=1+2\,\#\{x\in k_r:\operatorname{Tr}_{k_r/\mathbb F_2}(x^5)=0\}.
$$

Finite-field evaluations for r = 1,2,3,4 give N_r = 3,5,9,33. Accordingly S₁ = S₂ = S₃ = 0 and S₄ = −16. Newton recovery of the degree-four numerator yields

$$
\Pi_1(T)=1+4T^4,\qquad
Z_C(T)=\frac{1+4T^4}{(1-T)(1-2T)}.
$$

The Euler characteristic is χ = 2 − 2g = −2, and Δ = 1/2. The rational-function identity is

$$
Z_C(1/(2T))=\tfrac12T^{-2}Z_C(T).
$$

This example exercises integer powers and reciprocal substitution. An attempted identity using a natural-valued Euler characteristic would discard its exponent. Beyond the four initial counts, the numerator supplies S_{r+4} + 4S_r = 0 for r ≥ 0, with S₀ = 4, hence every extension count.

**Inputs:** the curve factor comparison and WC.5 Newton/recurrence API; **FunctionFieldArithmetic:FA.3**; **AlgebraicCurves, Layer 10** Artin–Schreier model, reduced local invariant and different; **Layer 7** Hurwitz; **Layer 12B–12E** model/place/genus dictionary. **Source:** TraceFormula Layer 15 curve factors, combined with those AlgebraicCurves supplier contracts; the displayed finite-field trace calculation and Newton identities determine this specialization. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.zeta_artin_schreier_genus_two`.

### The sign for the projective plane

The independently realized factors of ℙ²/k are 1 − T, 1 − qT and 1 − q²T. Thus χ = 3, Δ = q³, d = 2 and

$$
Z_{\mathbb P^2}(1/(q^2T))=-q^3T^3Z_{\mathbb P^2}(T).
$$

The minus sign is required. It comes from (−1)^χ, not from a discretionary convention for a square root of q^{dχ}. The factors also give N_r = 1 + q^r + q^{2r}; direct substitution in this rational expression checks the sign for every prime power q.

**Inputs:** projective-space factors; WC.6 signed smooth proper equation, itself reusing WC.2; Mathlib `RatFunc`. **Source:** Deligne I, §2.6, pp. 281–282, specialized to the projective-space computation. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_projective_plane`.

### The multiplicative group and compact support

For the actual multiplicative group 𝔾_m/k and constant coefficients, the localization sequence for {0} ⊂ 𝔸¹ gives H_c¹ ≅ ℚ_ℓ with F = 1 and H_c² ≅ ℚ_ℓ(−1) with F = q. All other compact-support groups vanish. Hence

$$
P_{1,c}=1-T,\qquad P_{2,c}=1-qT,\qquad
Z_{\mathbb G_m}(T)=\frac{1-T}{1-qT},\qquad N_r=q^r-1.
$$

The reciprocal zero 1 has weight 0, whereas the reciprocal pole q has weight 2. In particular the degree-one compact-support group has weight zero. This is compatible with the mixed upper bound and illustrates why the smooth proper pure-degree rule cannot be applied to an open curve. The comparison identifies the localization realization with the ordinary/compact-support example from DWP.10 and with the arithmetic zeta expression.

**Inputs:** SF.2; TraceFormula Layer 12 localization and Layer 13 all-power trace formula; DWP.10 ordinary/compact-support example; WC.6 mixed divisor bound; WC.5 recurrence compatibility. **Source:** TraceFormula Layer 12 multiplicative-group example; SGA 4½, Rapport, §§3.1–3.2 and 3.6, pp. 86 and 88, for the compact-support determinant convention. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.l_function_multiplicative_group`.

### Frobenius from base-field algebraic cycles

Let X/k be smooth proper, let j ≥ 0 and ℓ ≠ p. Suppose the actual base-field cycle map

$$
\mathrm{CH}^j(X)\otimes\mathbb Q_\ell
\longrightarrow H^{2j}(X_{\bar k},\mathbb Q_\ell(j))
$$

is surjective. The image of every base-field cycle is Galois invariant by cycle-class equivariance. Therefore F is the identity on the twisted group, and is q^j times the identity on untwisted H^{2j}. This conclusion is an equality of endomorphisms, not just an equality of eigenvalue multisets.

Surjectivity from CH^j(X_{k̄}) instead would only say that geometric cycles span. Frobenius can permute those classes. The descent to k in the hypothesis is what forces scalar action. This distinction remains essential in the numerical Picard applications below.

**Inputs:** SF.2; EDC.3 cycle maps and their Galois/Tate compatibilities; WC.0 Frobenius convention. **Source:** Schröer, §7 Tate-twist discussion, p. 20, and proof of Proposition 7.1, p. 21. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.frobenius_scalar_of_surjective_base_cycle_map`.

### Zeta factors from algebraic cycles

Let X/k be smooth proper geometrically connected of dimension d. For a prime ℓ ≠ p, assume every odd H^{2j+1} is zero and every base-field cycle map above, for 0 ≤ j ≤ d, is surjective. Write b_{2j} = dim H^{2j}. Then

$$
\Pi_{2j}(T)=(1-q^jT)^{b_{2j}},\quad
\Pi_{2j+1}(T)=1,\qquad
Z_X(T)=\prod_{j=0}^d(1-q^jT)^{-b_{2j}}.
$$

WC.6 identifies these polynomials with the canonical integral factors. In particular the b_{2j} are independent of ℓ, although the hypothesis may be checked at one chosen coefficient prime. The determinant calculation itself uses the scalar-action theorem and WC.1; it does not use root bounds to infer scalar action. At degree zero geometric connectedness gives b₀ = 1.

**Inputs:** base-field scalar Frobenius; WC.1 cohomological determinant comparison; WC.6 canonical factors; SF.2 actual scheme. **Source:** Schröer, Proposition 7.1 and proof, pp. 20–21. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.zeta_of_surjective_base_cycles`.

### Counts over every extension from cycles

Under the preceding cycle hypotheses, for every r ≥ 1,

$$
N_r=\sum_{j=0}^d b_{2j}q^{jr}.
$$

The same base-field cycles identify F once; the extension theorem uses its powers F^r. There is no separate descent assumption for each extension. The all-power trace formula or the logarithmic derivative of the displayed zeta product gives the count, and WC.5's recurrence agrees with both. In particular N₁ ≥ 1, since b₀ = 1 and all summands are nonnegative. The dimension-zero connected case gives N_r = 1.

**Inputs:** scalar Frobenius and the cycle zeta product; WC.1 all-power trace formula; WC.5 recurrence interface; SF.2 rational-point finiteness. **Source:** Schröer, Proposition 7.1 point-count conclusion and proof, pp. 20–21. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.count_extension_of_surjective_base_cycles`.

### Surfaces with constant numerical Picard group

Let X/k be smooth proper geometrically connected of dimension two. Assume b₁ = 0, b₂ = ρ(X_{k̄}), and the étale numerical Picard local system Num_{X/k} is constant. Here ρ is the rank of the geometric numerical divisor lattice. The numerical Picard supplier must provide two geometric comparisons: the injection of the rational numerical divisor space into H²(1), which becomes an isomorphism when b₂ = ρ; and descent of numerical divisor classes to base-field cycles after multiplication by nonzero integers. Over a finite field the relevant descent obstruction vanishes or is killed by rationalization. These inputs turn constancy of Num into surjectivity of the base-field codimension-one cycle map.

Duality gives b₃ = b₁ = 0. Geometric connectedness and the fundamental class identify the endpoint groups. The result is

$$
\Pi_0=1-T,\quad \Pi_2=(1-qT)^{b_2},\quad
\Pi_4=1-q^2T,\quad \Pi_1=\Pi_3=1,
$$

$$
Z_X(T)=\frac1{(1-T)(1-qT)^{b_2}(1-q^2T)},\qquad
N_r=1+b_2q^r+q^{2r}\quad(r\ge1).
$$

The statement allows nonprime q; N₁ is the count over k, not a count over its prime subfield. Its mere-proper formulation requires the numerical divisor comparison in that generality. A projective Hodge-index theorem can be used only after projectivity is proved, or after the owner supplies its extension to this proper-surface setting.

**Inputs:** cycle zeta product and all-extension count; EDC.2:pairings; EDC.3 cycle maps; SF.5 surface intersections; **NumericalPicardAndContractionDescent** for the specified lattice comparison and base-defined divisor descent. That owner's construction is a prerequisite, not a numerical lattice defined in this layer. **Source:** Schröer, Corollary 7.2 and proof, p. 21, with the divisor-cycle discussion on pp. 19–20. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.count_surface_of_constant_num`.

### Twenty-five points over 𝔽₂

Let X/k be either an Enriques surface or a smooth projective geometrically rational surface equipped with a relatively minimal genus-one fibration X → ℙ¹. Suppose the numerical Picard local system is constant. The surface suppliers prove b₁ = 0 and b₂ = ρ = 10 for these cases, with the characteristic-sensitive definitions of an Enriques surface and of a genus-one fibration. The preceding theorem gives

$$
Z_X(T)=\frac1{(1-T)(1-qT)^{10}(1-q^2T)},\qquad
N_r=1+10q^r+q^{2r}\quad(r\ge1).
$$

For k = 𝔽₂, N₁ = 25 and N₂ = 57. A genus-one fibration need not have a section, so none is added. In the second case both geometric rationality and relative minimality are retained; their role is to supply the stated invariants, and they are not discarded merely because the final numerical expression is simple.

**Inputs:** the constant-Num surface theorem; **EnriquesSurfacesAndIntegralNonexistence** and **GenusOneFibrationsAndRationalEllipticSurfaces** for the actual surface types and b₁,b₂,ρ computations; **NumericalPicardAndContractionDescent** for the numerical lattice contract. **Source:** Schröer, Corollary 7.3 and proof, p. 21. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.count_enriques_or_rational_genus_one`.

### A maximal-count criterion for rational surfaces

Let X/k be a smooth projective geometrically rational surface and put ρ = rank Pic(X_{k̄}). The rational-surface supplier identifies Pic(X_{k̄}) as a finite-rank free lattice with Pic⁰ = 0, identifies Pic ⊗ ℚ_ℓ with H²(1), and proves that the Galois action has finite image. Then

$$
\operatorname{Pic}_{X/k}\text{ is constant}
\quad\Longleftrightarrow\quad
N_1=1+\rho q+q^2.
$$

For the forward implication the lattice classes descend rationally, so scalar Frobenius gives the count. For the converse let A be Frobenius on the twisted Picard space. The trace formula gives N₁ = 1 + q Tr(A) + q². Since A has finite order, its complex eigenvalues are roots of unity. Equality Tr(A) = ρ forces the real part of every eigenvalue to be one, hence every eigenvalue is one. Finite order in characteristic zero then makes A the identity, and faithfulness of rationalization for a free lattice gives the identity on Pic. Continuity and the procyclic finite-field Galois group give constancy of the étale local system.

The freeness, Pic⁰ = 0 and finite-order hypotheses are supplied by geometric rationality. This argument does not provide a criterion for arbitrary Picard schemes with a positive-dimensional Pic⁰ or torsion. It is a consequence of the surface trace comparison and the finite lattice action, rather than a separate purity theorem.

**Inputs:** SF.2 actual rational surface; SF.5 surface comparison; EDC.2:pairings and EDC.3 cycle classes; WC.1 trace and WC.5 finite-spectrum compatibility; **NumericalPicardAndContractionDescent** for the free Picard/H² comparison and finite-order action. **Source:** Schröer, §7 and Corollary 7.2, pp. 19–21; the reverse implication is the finite-order trace argument above. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.constant_picard_iff_maximal_count_rational_surface`.

### The smooth proper endpoint

For an actual smooth proper geometrically connected X/k of pure dimension d, the arithmetic point-count series has a normalized rational representative Z_X ∈ ℚ(T) and canonical polynomials Π_i ∈ ℤ[T]. The interfaces assembled here give:

* The Euler product and exponential series agree with the expansion of Z_X at zero, with constant term one.
* For every prime ℓ ≠ p, Π_i maps to det(1 − TF | H^i(X_{k̄},ℚ_ℓ)). Its degree is the cohomology dimension, independently of ℓ, and it is one outside 0 ≤ i ≤ 2d.
* Every reciprocal root α of Π_i is algebraic integral, and every complex embedding satisfies |σ(α)| = q^{i/2}.
* Z_X = ∏_i Π_i^{(−1)^{i+1}} and, for every r ≥ 1, N_r = Σ_i(−1)^i Tr(F^r | H^i).
* With integer χ = Σ_i(−1)^i deg Π_i and the actual rational nonzero determinant multiplier Δ, Δ² = q^{dχ} and Z_X(1/(q^dT)) = (−1)^χ ΔT^χ Z_X(T).

The endpoint assembles the individual comparisons rather than using any one conclusion as a field of an input structure. It makes no semisimplicity assumption. Betti numbers of a complex fibre are additionally compared only when the actual smooth proper family and path of WC.4 are supplied. An arbitrary finite-field scheme is not asserted to lift to characteristic zero. For mixed sheaves the separate reciprocal-divisor upper-weight theorem remains the available export; individual integral pure-degree factors are not inferred from it.

Applications can consume a single interface—such as the all-power trace formula for a recurrence—without importing every part of the endpoint. The dimension-zero and negative-Euler-characteristic examples test the edges of the signed equation, while the open-curve example tests the distinction between degree and weight.

**Inputs:** WC.0 actual point/Frobenius comparisons; WC.1 arithmetic zeta, normalized rationality and all-power trace formula; WC.2 signed determinant assembly; WC.3 generic factor extraction; WC.4 supplied-family comparison; WC.5 numerical/recurrence interfaces; WC.6 smooth proper factors and mixed divisor bound; SF.2; DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11. **Source:** Deligne II, Corollary 3.3.9 and §3.3.11, p. 207; Deligne I, §§1.4–1.7 and 2.2–2.6, pp. 274–277 and 280–282; TraceFormula Layers 13–15. Suggested name: `TauCeti.AlgebraicGeometry.WeilZeta.weil_conclusions_of_smooth_proper`.

## References and the interfaces they support

The locators above refer to printed pagination unless a particular arXiv version is specified. Statements and constructions in this roadmap use the following primary sources and supplier specifications.

* **Pierre Deligne, La conjecture de Weil. I**, Publications Mathématiques de l'IHÉS **43** (1974), 273–307. [Freely readable article](https://www.numdam.org/item/PMIHES_1974__43__273_0/). §§1.1–1.7, pp. 273–277, give the point, series and factor conventions; §§2.2–2.6, pp. 280–282, give the signed duality calculation; Theorem 8.1 and proof, pp. 301–302, give the complete-intersection estimate. The proof of projective purity is consumed through DWP.4.
* **Pierre Deligne, La conjecture de Weil. II**, Publications Mathématiques de l'IHÉS **52** (1980), 137–252. [Freely readable article](https://www.numdam.org/item/PMIHES_1980__52__137_0/). Corollary 3.3.4, p. 206, and §§3.3.7–3.3.11, pp. 206–207, supply the mixed bounds and smooth proper/homology-manifold applications through DWP.7.
* **Pierre Deligne, Cohomologie étale (SGA 4½)**, Lecture Notes in Mathematics **569** (1977), exposé *Rapport sur la formule des traces*. [Freely readable volume](https://publications.ias.edu/sites/default/files/Number32.pdf). §§3.1–3.4 and 3.6, pp. 86–88, fix the determinant, trace, closed-point and compact-support formulas. The general trace theorem remains with the cohomological point-counting supplier.
* **J. S. Milne, Lectures on Étale Cohomology**, version 2.21, 22 March 2013. [Author's course notes](https://www.jmilne.org/math/CourseNotes/LEC.pdf). Theorems 20.2–20.5, pp. 127–129, and Theorem 21.1, p. 130, are the base-change, lifting and complex-comparison sources; §27, pp. 155–160, gives the finite-spectrum, descent, local integrality and functional-equation arguments used here.
* **Mircea Mustață, Zeta functions in algebraic geometry**, §3.3, Theorem 3.6 through Example 3.10, pp. 21–23. [Author's notes](https://public.websites.umich.edu/~mmustata/zeta_book.pdf). These provide the independent surface-intersection proof of curve bounds and the all-power root-bound argument.
* **Theo van den Bogaart and Bas Edixhoven, Algebraic stacks whose number of points over finite fields is a polynomial**, arXiv:math/0505178v3. [Freely readable preprint](https://arxiv.org/abs/math/0505178). Theorem 2.1, p. 3, smooth proper stack comparison in §3, pp. 4–6, Lemma 4.1, pp. 6–7, and Lemma 4.2 and the proof in §4, pp. 8–10, support the polynomial-count and Tate consequences.
* **Jonas Bergström, Carel Faber and Sam Payne, Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves**, Annals of Mathematics **199** (2024), 1323–1365. [Authors' freely readable published text](https://web.ma.utexas.edu/users/sampayne/pdf/PolynomialPointCounts.pdf); [arXiv:2206.07759](https://arxiv.org/abs/2206.07759). Proposition 1.3, pp. 1324–1325, concerns stack counts; Proposition 3.1, p. 1330, supplies the local cutoff; §7, pp. 1336–1339, supplies signed configurations, inverse zeta and the sieve; §§9.1–9.2, pp. 1351–1352, supply twists and equivariant polynomial counts. This roadmap uses those general counting results, not a new plan for the moduli spaces treated in the paper.
* **Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe**, arXiv:1807.04659v5, Appendix C, pp. 79–81, especially the unnumbered finite-spectrum lemma on p. 81. [Freely readable preprint](https://arxiv.org/abs/1807.04659). The finite-spectrum layer develops its numerical mechanism with explicit weights and cancellation; the other arguments about automorphic forms and moduli in that paper belong to their respective owners.
* **Stefan Schröer, There is no Enriques surface over the integers**, arXiv:2004.07025v3, §7, pp. 19–21, especially Proposition 7.1 and Corollaries 7.2–7.3. [Freely readable preprint](https://arxiv.org/abs/2004.07025). These are the cycle, numerical Picard and explicit surface point-count applications. The surface constructions and invariants remain with the named surface suppliers.
* **Kiran S. Kedlaya, Notes on isocrystals**, arXiv:1606.01321v6, §§8.1–8.8 and 9.1–9.7, pp. 20–22, and §§10.1–10.3, p. 27. [Freely readable preprint](https://arxiv.org/abs/1606.01321). **Fourier transforms and p-adic “Weil II”**, Compositio Mathematica **142** (2006), 1426–1450, Proposition 5.3.1, Theorem 5.3.2 and the ensuing consequences, pp. 1445–1446. [Published article](https://doi.org/10.1112/S0010437X06002338); [freely readable preprint](https://arxiv.org/abs/math/0210149). These support the rigid/crystalline interface imported from RD.7.
* **Tau Ceti, CohomologicalPointCounting family**, [specifications at commit 4bd72379658126cbe9be935656396f0c9dac4de0](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting). FrobeniusGeometry, EllAdicRealization, TraceFormula, EtaleBaseChange and ComplexComparison give the actual carrier and comparison contracts listed in the supplier table. **AlgebraicCurves**, [Layers 7, 10 and 12](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicCurves), supplies the function-field/model/genus interfaces for the Artin–Schreier example.
