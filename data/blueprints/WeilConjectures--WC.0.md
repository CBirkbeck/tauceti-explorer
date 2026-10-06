# Weil conjectures: the WC.0 job

This is a complete **blueprint**, with proposed declarations and mathematical proof plans, for the eight stages assigned to issue #1005. It follows the accepted RS-17 ownership decisions. Every implementation status is unchecked. Seven geometric stages are planned, with exact supplier requests and provenance gaps; the independent finite-spectrum child is closed as a mathematical dependency plan. “Complete” describes target coverage, not formalization or resolution of those external inputs.

The suggested Lean file is not the roadmap and is not exhaustive. This document is definitive. It supplies concrete baseline-carrier signatures for the independent numerical child, all three new definitions with their APIs and unit-test statements, and selected algebraic cores. It deliberately omits geometric instantiations whose actual rational cohomology, point-groupoid or comparison carriers are unavailable at the pins. Elaboration of admitted statements checks their types; it proves none of the admitted mathematics.

## Ownership and the route through the stages

The finite-extension point tower, arithmetic/geometric Frobenius, rational ℓ-adic realization, general trace formula and general zeta construction are supplied by the CohomologicalPointCounting family in upstream PR196. WC.0 fixes the actual carriers and conventions; WC.1 compares the upstream objects and adds arithmetic descent and the counting applications. There is no second zeta, scheme, cohomology theory, representation ring or elliptic point type.

EDC.2:pairings and EDC.8 own the geometric duality. WC.2 assembles its exact signed functional equation, descends its scalar and makes the parity/sign conventions explicit. DWP.0 owns generic reciprocal linear algebra. WC.3 exports a generic extraction theorem for **any** supplied degreewise-pure realization, and separately applies DWP.4 to projective schemes. WC.6 remains outside this job and can consume that generic extractor with its separately supplied proper/mixed purity.

WC.4 uses a supplied smooth proper family with specified finite-field and complex fibres and an étale transport path. The dimensions are independent of the path; the comparison isomorphism need not be. No assertion gives every finite-field variety a characteristic-zero lift. WC.5 derives all-extension estimates and recurrences and imports the independent Jacobian and elliptic bounds for compatibility.

The independent surface child imports the **whole** diagonal/Frobenius-graph/adjunction/Hodge-index theorem from SF.5. It compares its counts with the WC tower, then combines the root-bound-free curve numerator, WC.2 duality and the independent finite-spectrum converse. No DWP.1, DWP.4, WC.3 or RH-dependent parent WC.5 estimate is an ancestor. The original fourteen finite-spectrum node identifiers and their statements are preserved; two numerical little-o/graded-moment lemmas extend this child.

The general BFP tools belong here: weighted groupoid counts, effective twists, inverse-zeta configuration coefficients, finite Hasse–Weil sieve, polynomial-count cohomology and equivariant polynomial counts. The enumeration of particular moduli spaces remains in MotivicStructuresInModuliOfCurves. The accepted BFP stack Part II has not yet registered its carriers; its scheme results cannot silently be used for DM stacks.

## Conventions and sharp boundaries

* Write q = #k = pᵃ with a ≥ 1, and kᵣ for a genuine degree-r finite extension, r ≥ 1. Composite prime powers are not fields of the form ZMod q. Nᵣ counts Hom over Spec k from Spec kᵣ; no Fintype on every underlying scheme point is assumed.
* Cohomological F is geometric Galois Frobenius, matched by the supplier to scheme q-Frobenius pullback. It acts by q⁻¹ on Q_ℓ(1) and qᵈ on Q_ℓ(−d). Degree-r base extension takes F to Fʳ.
* Pᵢ(T) = det(1 − T Fᵢ) has constant one. Its reciprocal roots are eigenvalues α; its polynomial roots are α⁻¹. Multiplicities are algebraic multiplicities. No semisimplicity is inferred from traces.
* Set χ = Σᵢ(−1)ⁱbᵢ in Z and Δ = ∏ᵢ det(Fᵢ)^((−1)ⁱ). The exact equation is Z(1/(qᵈT)) = (−1)^χ Δ T^χ Z(T), with Δ² = q^(dχ). Negative χ uses field integer powers, not ordinary power-series substitution at T⁻¹.
* Odd-dimensional alternating middle duality makes dχ even; m = dχ/2 is an integer. Descend A = (−1)^χΔ to Q before defining ε = A/qᵐ = ±1. Degree-r extension has εᵣ = (−1)^((r+1)χ)εʳ. A geometric point always has sign −1; it is a useful test against the incorrect formula εᵣ = εʳ.
* Integral reciprocal roots of an integral product do not alone imply rational coefficients of its factors. The factors 1 ± √2T show this. All-conjugates weight separation, Galois-stable multisets and fixed-field descent precede the integrally closed Gauss lemma.
* The connected d ≥ 1 point bound subtracts 1 + q^(dr) and uses the interior weighted Betti sum. For disconnected pure-d schemes subtract cᵣ(1 + q^(dr)), where cᵣ counts fixed geometric components. For d = 0 there is only H⁰: Nᵣ = cᵣ.
* In the weighted finite-spectrum converse a repeated root is visible only if its entire grouped coefficient is nonzero. Characteristic zero is needed for the unweighted multiplicity corollary, not the weighted theorem. R = 0 is separate. The little-o lemma excludes visible roots at the boundary as well as outside it.
* Signed configuration coefficients use **distinct** Frobenius-stable Finsets and sign (−1)^(number of orbits), not parity of the number of geometric points. A two-cycle contributes −1 in degree two. Smooth fibres contribute the empty configuration once.
* Approximate polynomial counts leave low coefficients of the input P undetermined. For P², P = T² + T has error 1 = o(pⁿ), while the unique exact palindromic completion is C = T² + T + 1. The open-U theorem gives Tate **semisimplifications**; the all-Spec-Z theorem additionally uses local p-adic Hodge theory and absence of everywhere-unramified nontrivial number-field extensions to obtain actual Tate representations.

## Target coverage

| Stage | Status | Key declaration plans |
| --- | --- | --- |
| WC.0 | planned | 3; Finite-extension point tower, Geometric Frobenius comparison |
| WC.1 | planned | 15; Closed-point Möbius inversion, Cohomological zeta formula, Rational-series descent, Finite groupoid mass, Signed Frobenius configurations, Inverse-zeta termination |
| WC.2 | planned | 5; Signed zeta functional equation, Middle-degree parity, Functional-equation sign, Equivariant palindromicity |
| WC.3 | planned | 2; Degreewise pure factor extraction, Integral Weil factors |
| WC.4 | planned | 2; Betti comparison in families, Equivariant polynomial point counts |
| WC.5 | planned | 9; All-extension Weil bound, Weil-factor recurrence, Complete-intersection Weil estimate, Polynomial point count, Polynomial-count vanishing criterion, Polynomial counts and Tate cohomology |
| WC.5:power-sum-converse | closed | 16; Finite-spectrum bound, Power-sum converse, Power-sum generating function, Reciprocal spectrum equality, Little-o finite-spectrum lemma, Graded moment approximation |
| WC.5:surface-alternative | planned | 2; Surface proof of the Weil bound, Curve RH by intersection theory |

All stage targets are planned at declaration level. Open owner contracts are listed after the mathematical plans. They are terminal inputs rather than claims that the corresponding geometric theorem has been proved.

## WC.0

### Actual rational points and the finite-extension tower

Identifier: `WeilConjectures:WC.0/finite-extension-point-tower-comparison`. Proposed declaration: `TauCeti.PointCounting.finite_extension_point_tower_comparison`. Theorem.

Let k be a finite field of characteristic p, q=Nat.card k=p^a with a≥1, X→Spec k a finite-type scheme, and r≥1. Identify the WC point set with Hom over Spec k from Spec(FiniteField.Extension k r) to X. Transport the supplied finite-point theorem to this exact carrier, so N_r is its natural cardinal. Every k-algebra isomorphism between degree-r extensions induces the same N_r; chosen inclusions for r|s commute with point transport and with q-power Frobenius. No global Fintype of the underlying topological space of X is installed.

Proof/construction plan:

1. Use the upstream FrobeniusGeometry Layers4–5 fixed-point/extension dictionary and finite-type point finiteness, keeping structural maps to Spec k in every Hom.
2. Apply the pinned finite-field extension cardinal and same-degree algebra-equivalence results. Contravariance of Spec and composition of scheme morphisms prove identity/composition and tower coherence.
3. Compare natural cardinalities under the resulting bijections; field isomorphisms need not be unique and the equality of numbers does not claim unique transport maps.

Prerequisites: `mathlib:FiniteField.Extension`, `mathlib:FiniteField.finrank_extension`, `mathlib:FiniteField.natCard_extension`, `mathlib:FiniteField.algEquivExtension`.

Sources: `deligne-i`, (1.1.1) and §1.2–1.3 pp.273–274: Actual finite-extension counts, not points of a topological space.; `pr196`, FrobeniusGeometry Layers4–5: Supplier constructs the point carriers and finiteness; WC exports their notation and choice comparison.

Acceptance checks:

* For k=F₄, degree r gives q^r=4^r; ZMod 4 is not a field and is rejected.
* For A¹, N_r=q^r; for Spec of a degree-m finite extension, N_r=m if m|r and zero otherwise.
* A field isomorphism changes coordinates but preserves the count and commutes with q-power Frobenius.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Closed points and arithmetic Frobenius orbits

Identifier: `WeilConjectures:WC.0/closed-point-degree-comparison`. Proposed declaration: `TauCeti.PointCounting.closed_point_degree_comparison`. Theorem.

For finite-type X/k as above, identify each imported closed point x with its arithmetic-q-Frobenius orbit on X(k̄), with orbit length [κ(x):k]. The WC degree-m closed-point count a_m is finite and equals the imported orbit count; a point above x is fixed by F_q^r exactly when m|r, and then contributes m. The residue-field degree, not the cardinality q^m, is the Euler-product exponent.

Proof/construction plan:

1. Apply the upstream closed-point/orbit bijection and actual finite-field residue extensions.
2. Use the existing finite-field algebra-embedding count to verify the fibre contribution and transfer the finite degree-m orbit enumeration.
3. Check that changing algebraic closures and chosen extension fields transports the bijection; numbers are independent of these choices.

Prerequisites: `WeilConjectures:WC.0/finite-extension-point-tower-comparison`, `mathlib:FiniteField.natCard_algHom_of_finrank_dvd`.

Sources: `deligne-i`, (1.1.1) and §1.2–1.3: Comparison with the already-owned orbit decomposition.; `pr196`, TraceFormula Layer13; FrobeniusGeometry Layer4: Orbit combinatorics belongs to these suppliers, not a second closed-point theory.

Acceptance checks:

* Spec F_(q²) has a₂=1 and N₂=2; it has no degree-one point.
* A rational closed point has degree one, regardless of q.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Rational coefficients and geometric Frobenius

Identifier: `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`. Proposed declaration: `TauCeti.PointCounting.geometric_frobenius_realization_comparison`. Theorem.

For separated finite-type X/k and a prime ℓ≠p, identify the WC degree-i space with the imported finite-dimensional rational ℓ-adic H_c^i(X_k̄,Q_ℓ), and with H^i for proper X. Identify its WC operator with continuous geometric Galois Frobenius, inverse to the arithmetic generator, and with pullback by the scheme q-Frobenius under the supplied convention bridge. After degree-r base extension the operator is F_q^r. The geometric action on Q_ℓ(1) is q⁻¹ and on Q_ℓ(−d) is q^d. Coefficient extensions preserve characteristic polynomials by scalar extension, dimensions and traces; no rational space is inferred merely from an integral derived carrier.

Proof/construction plan:

1. Consume EllAdicRealization Layers4–10, including perfect finite rational cohomology and the continuous Galois action, and the FrobeniusGeometry pullback/Galois bridge.
2. Compose these supplied identifications with the WC notation; apply their scalar-extension, restriction and proper-support comparisons.
3. Keep the coefficient prime, cohomological degree, structural map and choice of geometric point visible.

Prerequisites: `WeilConjectures:WC.0/finite-extension-point-tower-comparison`, `mathlib:Matrix.charpolyRev`.

Sources: `deligne-i`, (1.4)–(1.5) and §2.1: The compact-support trace convention and top Tate action.; `pr196`, EllAdicRealization Layers4–10: Constructed rational coefficients and Galois action are inputs, not assumptions bearing the final Weil conclusion.

Acceptance checks:

* On P¹ the two even-degree eigenvalues are 1 and q, not 1 and q⁻¹.
* Degree-two base change sends F_q to F_q².
* ℓ=p fails the stated coefficient hypothesis; ℓ=2 with p odd remains allowed.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

## WC.1

### Integral Euler-product comparison

Identifier: `WeilConjectures:WC.1/zeta-function-euler-product-and-point-counts`. Proposed declaration: `TauCeti.PointCounting.zeta_euler_comparison`. Theorem.

For separated finite-type X/k, the upstream point-count zeta Z_X, normalized by Z_X(0)=1, identifies coefficientwise with ∏_(closed x)(1−T^deg(x))⁻¹ in Z[[T]]. In Q[[T]] it identifies with exp(Σ_(r≥1) N_r T^r/r). The product is coefficientwise locally finite. Under the same comparison, finite disjoint unions give products, X=U∐Y with U open and Y closed gives Z_X=Z_U Z_Y, and degree-s base change replaces the point-count sequence N_r by N_(sr). This node compares existing constructions and does not define a zeta object. For finite-type X over Z, the requested arithmetic-zeta interface uses N(x)=#κ(x) for closed x and ζ_X(s)=∏_x(1−N(x)^(−s))⁻¹, with constant-one formal Dirichlet expansion and absolute convergence in a supplied right half-plane. For X over F_q, N(x)=q^deg(x), so ζ_X(s)=Z_X(q^(−s)) wherever these products converge. The general arithmetic object is imported from the point-counting owner extension specified in the gap; its existence is not asserted to be already in PR196 Layer13.

Proof/construction plan:

1. Transport the upstream TraceFormula Layer13 exponential/Euler equality along the WC.0 point and degree comparisons.
2. Use the supplier’s locally finite integral construction to preserve coefficients in Z; the exponential formulation is only over characteristic-zero coefficients.
3. Transport the supplier’s decomposition and extension identities; normalization removes a multiplicative constant.
4. For the arithmetic comparison import the finite-residue-field/bounded-norm finiteness and actual norm-Euler Dirichlet construction with its convergence theorem. Reindex the finite-field specialization by residue degree, then use equality of convergent Euler factors to identify ζ_X(s) with Z_X(q^(−s)). This does not substitute a complex scalar into an arbitrary formal power series outside its convergence domain.

Prerequisites: `WeilConjectures:WC.0/finite-extension-point-tower-comparison`, `WeilConjectures:WC.0/closed-point-degree-comparison`, `SchemeAndStackFoundations:SF.1`.

Sources: `deligne-i`, (1.1.1)–(1.3) pp.273–274: Finite-field zeta specialization and arithmetic notation.; `pr196`, TraceFormula Layer13: Reuse exponential/Euler zeta and all its general functorial identities.

Acceptance checks:

* A¹ has Z=1/(1−qT); P¹ has Z=1/((1−T)(1−qT)).
* An empty scheme has Z=1; Spec F_(q²) has Z=1/(1−T²).
* Test P¹=A¹∐point and finite-base-extension q↦q^s.
* For Spec Z the arithmetic product is the Riemann zeta function; for Spec F_q its specialization is1/(1−q^(−s)).

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Closed-point Möbius inversion

Identifier: `WeilConjectures:WC.1/closed-point-counts-mobius-inversion`. Proposed declaration: `TauCeti.PointCounting.closed_point_counts_mobius`. Theorem.

For the actual extension counts N_r and degree-m closed-point counts a_m, for every r≥1, N_r=Σ_(m|r) m a_m and r a_r=Σ_(m|r) μ(m)N_(r/m), as equalities of integers. Consequently the latter sum is nonnegative and divisible by r, and a_r is recovered without rational-rounding conventions. The formulas include non-geometrically-connected and empty schemes.

Proof/construction plan:

1. Apply the already-owned Frobenius orbit decomposition via the WC.0 closed-point comparison: an orbit of length m contributes m precisely when m divides r.
2. Apply ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq to f(m)=m a_m with f(0)=N(0)=0; specialize to positive indices.
3. Transfer nonnegativity and divisibility from the actual finite count a_r rather than adding them as hypotheses on arbitrary sequences.

Prerequisites: `WeilConjectures:WC.0/closed-point-degree-comparison`, `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`.

Sources: `deligne-i`, (1.2)–(1.3): The point/orbit relation; Möbius inversion is the WC arithmetic export.; `baseline-wc-interfaces`, ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq: Use the existing general inversion theorem.

Acceptance checks:

* For A¹/F₄, a₁=4, a₂=(16−4)/2=6 and a₃=(64−4)/3=20.
* For Spec F_(q²), the inverse recovers only a₂=1.
* For arbitrary fake N₁=0,N₂=1 the divided result is not integral, so actual point counts are essential.

Suggested Lean: signature. Integer divisor sums prototype; geometric identification remains the preceding comparison.

### Cohomological zeta comparison

Identifier: `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`. Proposed declaration: `TauCeti.PointCounting.cohomological_zeta_comparison`. Theorem.

For separated finite-type X/k and ℓ≠p, set P_i(T)=det(1−T F_q | H_c^i(X_k̄,Q_ℓ)). The WC notation identifies the upstream trace and determinant formulas N_r=Σ_i (−1)^i Tr(F_q^r|H_c^i) and Z_X(T)=∏_i P_i(T)^((−1)^(i+1)) in Q_ℓ(T), whose expansion at zero agrees with the integral Euler series. Only finitely many degrees occur. For proper X use ordinary cohomology. Invertibility gives deg P_i=dim H_c^i; the zero space has P_i=1. No RH or semisimplicity is required.

Proof/construction plan:

1. Apply upstream TraceFormula Layer14 using the exact compact-support/rational-coefficient/Frobenius adapter.
2. Use the existing characteristic-polynomial reversal and the DWP.0 determinant/trace interface only in characteristic zero; its generic formal-log statement needs the qualification recorded in the source issues.
3. Compare in the common Laurent-series carrier and use zero normalization. Do not compose a formal series with T⁻¹.

Prerequisites: `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`, `WeilConjectures:WC.1/zeta-function-euler-product-and-point-counts`, `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.reverse_charpoly`, `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`.

Sources: `deligne-i`, (1.5) and §1.15 pp.274–275,279: Trace formula gives the determinant expression.; `pr196`, TraceFormula Layer14: General trace and rationality theorem remains upstream.

Acceptance checks:

* For a proper geometrically connected curve the denominator is (1−T)(1−qT).
* For A¹ use H_c²=Q_ℓ(−1); substituting ordinary H⁰ gives the wrong count.
* A nontrivial Jordan block contributes algebraic multiplicity to traces and determinant, without diagonalization.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Rational-series descent

Identifier: `WeilConjectures:WC.1/rationality-over-q-via-hankel-determinants`. Proposed declaration: `TauCeti.PointCounting.rational_series_descent`. Theorem.

Let K⊂L be fields, f∈K[[T]], and suppose its coefficient image in L[[T]] has a rational presentation P/Q with P,Q∈L[T] and Q(0)≠0, meaning Q f=P after scalar extension. Then f admits such a presentation over K. Applied to the integral WC zeta series and its actual Q_ℓ determinant realization, this yields Z_X∈Q(T), with unique relatively prime numerator and denominator normalized to constant term one. No purity is used.

Proof/construction plan:

1. A rational presentation gives an eventual finite linear recurrence, hence a uniform bound on ranks of finite Hankel matrices (including the finitely many initial exceptional columns).
2. Every relevant minor lies in K; its vanishing is equivalent after the injective field extension. Choose a finite spanning set of columns of the infinite shift/Hankel system over K.
3. Finite-dimensional stabilization gives a nonzero polynomial recurrence over K and a polynomial product Q₀ f. If Q₀ has an initial power of T, cancel it to make Q₀(0) nonzero; normalize its constant.
4. Over a field divide numerator and denominator by their gcd. For f(0)=1 both normalized constants are one, and cross multiplication plus coprimality proves uniqueness.

Prerequisites: `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `mathlib:PowerSeries.ext`.

Sources: `milne-lec`, 27.9 pp.157–158 full proof: Rationality descends along a field extension.; `deligne-i`, (1.5)–(1.7) pp.275–277: Hankel rationality descent used in Weil I.

Acceptance checks:

* The constant series 1 has reduced pair (1,1).
* A denominator with initial T-factor must have it cancelled before expansion at zero.
* Over Q⊂Q_ℓ, the descended object has rational coefficients; this does not yet imply individual degree factors are rational.

Suggested Lean: signature. Concrete PowerSeries over a field extension and denominator-cleared equality.

### Local Fatou integrality

Identifier: `WeilConjectures:WC.1/local-fatou-normalization`. Proposed declaration: `TauCeti.PointCounting.local_fatou_normalization`. Theorem.

For a prime ℓ, let f∈1+T Z_ℓ[[T]] and P,Q∈Q_ℓ[T] be relatively prime, P(0)=Q(0)=1, with Qf=P in Q_ℓ[[T]]. Then every coefficient of P and Q has ℓ-adic norm at most one, so both lie in Z_ℓ[T]. The conclusion is non-strict. The prime may equal the geometric characteristic p.

Proof/construction plan:

1. Pass to a finite splitting extension with the extended ℓ-adic norm, supplied by LocalFieldsRamification Layer0.
2. If Q has a reciprocal root α with norm greater than one, its zero α⁻¹ lies in the open unit disc, where the bounded-coefficient series converges. Evaluate Qf=P there to contradict coprimality.
3. Thus reciprocal roots of Q have norm at most one; the ultrametric inequality bounds its elementary symmetric coefficients. Since f is a unit over Z_ℓ[[T]], apply the same argument to f⁻¹ and P.
4. Retain ≤1 at the boundary, correcting the printed <1 in Milne27.10.

Prerequisites: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `mathlib:Summable.of_norm_bounded`, `mathlib:summable_geometric_of_abs_lt_one`, `mathlib:PowerSeries.ext`.

Sources: `milne-lec`, 27.10 p.158 full proof: Corrected local integrality argument, including ℓ=p.

Acceptance checks:

* f=1/(1−T) has denominator reciprocal root 1 of norm exactly one.
* A common factor in P,Q invalidates the pole argument and must be cancelled.
* Normalize constants to one; arbitrary scalar multiples need not be integral.

Suggested Lean: signature. Q_ℓ PowerSeries with bounded coefficients and normalized coprime polynomials.

### Normalized integral rational zeta

Identifier: `WeilConjectures:WC.1/normalized-integral-zeta-presentation`. Proposed declaration: `TauCeti.PointCounting.normalized_integral_zeta_presentation`. Theorem.

For separated finite-type X/k, the reduced Q(T) zeta presentation is uniquely P/Q with P,Q∈Z[T], P(0)=Q(0)=1 and coprime over Q. Its formal image in Z[[T]] is the imported Euler product. Reduction, numerator, denominator and normalization commute with field embeddings. These P,Q are parity products only after cancellation; this theorem does not identify individual cohomological P_i.

Proof/construction plan:

1. Use rational-series descent and normalize the coprime rational presentation.
2. For every prime ℓ, including p, apply local Fatou to the integral Euler-series coefficients.
3. Write each rational coefficient in reduced numerator/denominator form. If its denominator exceeds one, a prime divisor of the denominator gives ℓ-adic norm greater than one, contradicting local integrality. Hence each coefficient is an integer.
4. Cross multiplication proves uniqueness of the normalized reduced pair and its coefficient embeddings.

Prerequisites: `WeilConjectures:WC.1/rationality-over-q-via-hankel-determinants`, `WeilConjectures:WC.1/local-fatou-normalization`, `WeilConjectures:WC.1/zeta-function-euler-product-and-point-counts`, `mathlib:padicNorm`.

Sources: `milne-lec`, 27.11 p.158 full proof: Global integrality from all primes.; `deligne-i`, (1.6)–(1.7) pp.276–277: Integral normalized reduced presentation precedes weight extraction.

Acceptance checks:

* P¹ has numerator1 and denominator(1−T)(1−qT).
* A cancelled eigenvalue is absent from the reduced pair; reduced pair alone cannot label degrees without purity.
* Include ℓ=p in the integrality check, although étale realization used only ℓ≠p.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Finite groupoid mass

Identifier: `WeilConjectures:WC.1/finite-groupoid-mass`. Proposed declaration: `TauCeti.PointCounting.groupoidMass`. Definition.

For a groupoid C with finitely many isomorphism classes and finite automorphism groups, define mass(C)∈Q as Σ_[x] 1/#Aut_C(x). The quotient is Mathlib’s existing isIsomorphicSetoid; the denominator is the cardinality of its existing Aut x. Each denominator is positive since it contains the identity. The sum is independent of representatives. Applied to the actual finite-field point groupoid of a finite-type stack with finite mass data, this is its weighted point count; finiteness must be proved before application.

Proof/construction plan:

1. Use the existing quotient of isomorphic objects, choose representatives only to form the finite sum, and use rational inverses of positive cardinalities.
2. Conjugation along an isomorphism gives the existing automorphism-group equivalence, proving independence of choices.
3. An equivalence of groupoids bijects classes and preserves automorphism cardinalities. Discrete and one-object computations follow from the existing category constructions.

Prerequisites: `mathlib:CategoryTheory.isIsomorphicSetoid`, `mathlib:CategoryTheory.Aut`, `mathlib:CategoryTheory.Aut.autMulEquivOfIso`, `mathlib:CategoryTheory.SingleObj.groupoid`, `mathlib:Units.toAut`, `mathlib:CategoryTheory.Discrete`.

Sources: `bfp`, Proposition 1.3 and the preceding definition pp.2–3: The numerical weighted count; stack and quotient geometry remain suppliers.

Uses:

* BFP Proposition1.3: Weights stack rational points and finite quotient/twisted forms.
* BFP §7 and §9; MotivicStructuresInModuliOfCurves: Transfers additive counts and automorphism weights to sieve and equivariant applications.

Planning API:

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.PointCounting.groupoidMass_aut_card_iso` | compatibility | If x≅y then #Aut(x)=#Aut(y), so their mass summands agree. |
| `TauCeti.PointCounting.groupoidMass_equivalence` | functoriality | A groupoid equivalence C≌D between finite-mass groupoids preserves mass. |
| `TauCeti.PointCounting.groupoidMass_discrete` | compatibility | For a finite type A, mass(Discrete A)=#A. |
| `TauCeti.PointCounting.groupoidMass_singleObj` | simp | For a finite group G, mass(SingleObj G)=1/#G. |
| `TauCeti.PointCounting.groupoidMass_product` | compatibility | For finite-mass groupoids C,D, mass(C×D)=mass(C)mass(D). |

Unit-test statements (matched by markers in the suggested file):

* `TauCeti.PointCounting.groupoidMass_empty` (degenerate): mass(Discrete Empty)=0.
* `TauCeti.PointCounting.groupoidMass_three` (computation): mass(Discrete(Fin 3))=3.
* `TauCeti.PointCounting.groupoidMass_cyclic_two` (computation): For the group Multiplicative(ZMod 2), the one-object groupoid has mass1/2.
* `TauCeti.PointCounting.groupoidMass_cyclic_two_not_one` (non-example): The same groupoid’s mass is not its number1 of isomorphism classes.

Acceptance checks:

* Summation is over classes, not all representatives; automorphisms are in the denominator.

Suggested Lean: signature. The actual Mathlib Groupoid, isomorphism quotient, Aut, Discrete and SingleObj carriers.

### Stack mass, quotients and the trace formula

Identifier: `WeilConjectures:WC.1/stack-count-comparison`. Proposed declaration: `TauCeti.PointCounting.stack_count_comparison`. Theorem.

For a finite-type stack X/F_q whose rational-point groupoid has finite mass data, compare its weighted count with groupoidMass. It is additive over a finite locally closed stratification. For [Y/G] with Y finite type and G a connected smooth linear algebraic group, the count is #Y(F_q)/#G(F_q), by Lang’s torsor triviality. For a finite-type DM stack with coarse space X_c it equals #X_c(F_q). For a separated finite-type DM stack with bounded finite-dimensional rational compact-support cohomology it equals Σ_i(−1)^i Tr(F_q|H_c^i). These are comparisons with imported stack constructions; a disconnected group requires its torsor forms and is not covered by the connected quotient formula.

Proof/construction plan:

1. Construct the comparison using the supplier’s actual point groupoid and finite-mass theorem, then partition classes by strata.
2. For the connected quotient use Lang’s H¹(F_q,G)=1 and orbit–stabilizer to sum inverse stabilizer orders.
3. For DM coarse spaces use the supplier’s rational cohomology/coarse-space comparison or its finite fibre mass-one theorem, including nonsplit residual gerbes.
4. Apply the stack compact-support trace formula with geometric Frobenius. General Artin-stack unbounded cohomological traces are not substituted for the stated bounded DM case.

Prerequisites: `WeilConjectures:WC.1/finite-groupoid-mass`, `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`, `SchemeAndStackFoundations:SF.1`, `ReductiveGroupsPartII:RG2.3`.

Sources: `bfp`, Proposition 1.3(i)–(iv): Numerical applications of independently constructed stack theory.

Acceptance checks:

* For B(C₂), rational torsor classes each have weight1/2; total mass is1, agreeing with the coarse point, not1/2.
* For [A¹/G_m], q/(q−1) is the mass, rather than the number of geometric orbits.
* For a scheme regarded as a stack all automorphism groups are trivial.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Twists and Frobenius traces

Identifier: `WeilConjectures:WC.1/twisted-frobenius-point-comparison`. Proposed declaration: `TauCeti.PointCounting.twisted_frobenius_point_comparison`. Theorem.

Let X/F_q be separated finite type, with a finite group G of F_q-automorphisms and effective finite descent for the twists under consideration (for example quasiprojective X). For σ∈G, let X^σ be the form for which the transported arithmetic descent operator on geometric points is σF_q. Its rational points are Fix(σF_q); its compact-support count is Σ_i(−1)^i Tr(F_q^*σ^*|H_c^i). For proper X ordinary cohomology suffices. After degree-r extension this same twist has descent operator σ^rF_q^r, which differs in general from the new σ-twist of X/F_(q^r).

Proof/construction plan:

1. Use the supplier’s effective finite descent and the actual Frobenius convention bridge; declare the transported operator to fix the possible inverse-twist convention.
2. The fixed-point bijection and upstream automorphism/trace formula give the count with commuting operators.
3. Iterate the descent cocycle r times; σ is defined over k, hence commutes with F_q. The corresponding cohomological pullbacks commute as well.

Prerequisites: `WeilConjectures:WC.0/finite-extension-point-tower-comparison`, `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`.

Sources: `bfp`, Definition 9.1 and §9.1 pp.21–22: Twisted point counts; geometric construction is imported.; `pr196`, TraceFormula Layer15: Twisted and isotypic trace interfaces are owned upstream.

Acceptance checks:

* σ=1 gives ordinary counts.
* The nonsplit smooth quadric becomes split over F_(q²): its original involution twist has σ²=1 after extension.
* An arbitrary automorphism over k̄ without finite descent data does not meet the hypotheses.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Signed Frobenius configurations

Identifier: `WeilConjectures:WC.1/signed-frobenius-configuration-coefficient`. Proposed declaration: `TauCeti.PointCounting.signedConfigurationCoefficient`. Definition.

Let A be a type with a permutation σ and suppose that for each n the set C_n(σ) of σ-stable finite subsets S⊂A of cardinal n is finite. Define c_n(σ)=Σ_(S∈C_n(σ)) (−1)^o(S)∈Z, where o(S) is the number of σ-orbits contained in S. Use the existing orbit equivalence for the cyclic subgroup generated by σ; o(S) is the cardinality of the image of S in that quotient. The sign counts orbits, not geometric points. For A=X(k̄), σ=arithmetic Frobenius, WC.0 supplies the finite configuration condition from finite closed-point counts of degrees≤n.

Proof/construction plan:

1. Take the existing finite-subset and orbit-quotient carriers; form the finite sum using the stated finiteness of C_n.
2. If n=0, there is only the empty subset and its orbit number is0; if n=1, stable subsets are fixed points and each has sign−1.
3. When A is finite, no configuration of size greater than #A exists. Conjugating σ transports subsets and orbit images, proving invariance.

Prerequisites: `WeilConjectures:WC.0/closed-point-degree-comparison`, `mathlib:MulAction.orbitRel`, `mathlib:Subgroup.zpowers`.

Sources: `bfp`, §7, definition preceding Proposition 7.4 pp.10–11: The weighted configuration coefficient used by the inverse-zeta sieve.

Uses:

* BFP §7 Proposition7.4: Identifies c_n with the inverse-zeta coefficient and controls finite termination.
* BFP Propositions7.1,7.5 and Remark7.6: Sums singularity configurations over the parameter fibre for the Hasse–Weil sieve.

Planning API:

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.PointCounting.signedConfigurationCoefficient_zero` | simp | For every σ satisfying finite-configuration hypotheses, c₀(σ)=1. |
| `TauCeti.PointCounting.signedConfigurationCoefficient_one` | characterisation | c₁(σ)=−#Fix(σ). |
| `TauCeti.PointCounting.signedConfigurationCoefficient_conjugate` | functoriality | A bijection e:A≃B gives c_n(eσe⁻¹)=c_n(σ). |
| `TauCeti.PointCounting.signedConfigurationCoefficient_above_card` | simp | For finite A and n>#A, c_n(σ)=0. |

Unit-test statements (matched by markers in the suggested file):

* `TauCeti.PointCounting.signedConfigurationCoefficient_empty` (degenerate): The empty permutation has c₀=1 and c₁=0.
* `TauCeti.PointCounting.signedConfigurationCoefficient_fixed_two` (computation): For the identity on Bool, (c₀,c₁,c₂)=(1,−2,1).
* `TauCeti.PointCounting.signedConfigurationCoefficient_two_cycle` (computation): For the transposition of Bool, c₁=0 and c₂=−1.
* `TauCeti.PointCounting.signedConfigurationCoefficient_two_cycle_sign` (non-example): The two-cycle’s c₂ is not+1; geometric-cardinality parity is the wrong sign.

Acceptance checks:

* A closed orbit of length2 contributes−1 to c₂, not+1.

Suggested Lean: signature. Actual Finset, Equiv.Perm, Subgroup.zpowers and MulAction.orbitRel, with finite stable-configuration subtypes.

### Inverse zeta and configurations

Identifier: `WeilConjectures:WC.1/inverse-zeta-configuration-formula`. Proposed declaration: `TauCeti.PointCounting.inverse_zeta_configuration_formula`. Theorem.

For separated finite-type Y/F_q, the coefficient of T^n in Z_Y(T)⁻¹ equals c_n(F_q on Y(k̄)). Equivalently it is the sum over partitions λ of n of (−1)^length(λ) times the number of Frobenius-stable distinct-point configurations of orbit lengths λ. A length-m orbit contributes a factor1−T^m. Every coefficient sum is finite; configurations with repeated geometric points are excluded.

Proof/construction plan:

1. Apply the imported locally finite Euler product, invert its unit, and expand ∏_(closed x)(1−T^deg x) coefficientwise.
2. A monomial selects a finite collection of distinct closed points. Under WC.0 it corresponds to a stable geometric subset; total degree is geometric subset size and the sign is the number of selected orbits.
3. Group these subsets by their multiset of orbit lengths; this is the partition formula used by Vakil–Wood. The geometric configuration schemes and finite quotients realizing Y(λ) are supplied by the scheme/quotient owner.

Prerequisites: `WeilConjectures:WC.1/signed-frobenius-configuration-coefficient`, `WeilConjectures:WC.1/zeta-function-euler-product-and-point-counts`, `SchemeAndStackFoundations:SF.1`.

Sources: `bfp`, §7 before Proposition 7.4: Vakil–Wood inverse-zeta formula as used in the paper.

Acceptance checks:

* One rational point gives1−T; one degree-two closed point gives1−T².
* Two rational points give(1−T)², while a two-cycle gives1−T².
* The coefficient at0 is1 even for empty Y.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Termination of the inverse-zeta sieve

Identifier: `WeilConjectures:WC.1/inverse-zeta-even-cohomology-termination`. Proposed declaration: `TauCeti.PointCounting.inverse_zeta_even_termination`. Theorem.

For a nonempty proper Y/F_q with bounded finite-dimensional rational cohomology and H^odd=0, put b=Σ_(i even) dim H^i. Then Z_Y⁻¹=∏_(i even) det(1−T F|H^i) is a polynomial of degree b, c_n=0 for n>b, and Σ_(n=0)^b c_n=0. Nonempty H⁰ contains a Frobenius-fixed vector, even if components are permuted, so the polynomial vanishes at1. The empty case instead has inverse zeta1, b=0 and sum1.

Proof/construction plan:

1. Apply the cohomological zeta comparison; properness identifies compact supports and vanishing removes the odd denominator.
2. Use invertible Frobenius to compute the exact degree as the sum of even dimensions.
3. The sum of constant functions on all geometric connected components is a nonzero fixed vector; hence the H⁰ factor vanishes at1. Evaluate the inverse-zeta polynomial there and identify its coefficients by the configuration formula.

Prerequisites: `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `WeilConjectures:WC.1/inverse-zeta-configuration-formula`.

Sources: `bfp`, Proposition 7.4 p.11 full proof: Finite termination and sum at1; nonempty qualification made explicit.

Acceptance checks:

* A point has c₀=1,c₁=−1 and total0.
* A degree-two finite étale point has c₀=1,c₂=−1 and total0.
* Empty Y has total1 and is excluded from the vanishing assertion.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Hasse–Weil sieve

Identifier: `WeilConjectures:WC.1/hasse-weil-sieve-for-curve-families`. Proposed declaration: `TauCeti.PointCounting.hasse_weil_sieve`. Theorem.

Let a finite-type parameter scheme V/F_q carry a flat surjective family of curves, allowing nonreduced fibres, with each scheme-theoretic singular locus proper of finite type and having no odd rational cohomology. The loci may have positive dimension. For v∈V(F_q), let s_d(v)=c_d(F_q on Sing(C_v)); set S_d=Σ_v s_d(v) and B=max_v Σ_even dim H^i(Sing(C_v)), taking B=0 if V(F_q) is empty. Then #V_smooth(F_q)=#V(F_q)+Σ_(d=1)^B S_d. For k<B, the truncated expression #V(F_q)+Σ_(d=1)^k S_d has exact error Σ_(d=k+1)^B S_d; the tail is supported only on fibres whose even Betti sum exceeds k. Finite type gives finitely many Frobenius-stable configurations of each fixed degree, without a finite geometric point-set assumption. The reduced-curve finite-singular-locus case is a specialization. All terms and weights are explicit; no uniform asymptotic constant is asserted without a supplied bound on these tail configurations.

Proof/construction plan:

1. For a smooth fibre the singular locus is empty and its total signed coefficient sum is1. For every singular fibre the nonempty inverse-zeta termination theorem makes that total0.
2. Sum this indicator over the finite parameter point set and interchange finite sums to obtain the exact sieve formula.
3. Subtract the truncated finite sum. Fibres with Betti bound≤k have no tail; use triangle inequality if a quantitative tail estimate is subsequently supplied.
4. For the finite-singular-locus case, inclusion–exclusion over closed Frobenius orbits agrees with the signs in Proposition7.1; summing geometric-point parity would fail for a degree-two singularity.

Prerequisites: `WeilConjectures:WC.1/inverse-zeta-even-cohomology-termination`, `WeilConjectures:WC.1/signed-frobenius-configuration-coefficient`, `WeilConjectures:WC.0/finite-extension-point-tower-comparison`.

Sources: `bfp`, Propositions 7.1,7.5 and Remark 7.6 pp.10–13 full proofs: General sieve tools only; genus-four model counts belong to MotivicStructuresInModuliOfCurves.

Acceptance checks:

* One degree-two singular orbit contributes−1 at d=2 and excludes the fibre.
* A smooth fibre contributes only d=0, exactly once.
* When V(F_q) is empty every S_d and the smooth count vanish.
* A nonreduced double P¹ has singular support P¹, with inverse zeta(1−T)(1−qT); coefficients1,−(1+q),q sum to0 and terminate at degree2.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Equivariant point-count characters

Identifier: `WeilConjectures:WC.1/equivariant-count-character-lattice`. Proposed declaration: `TauCeti.PointCounting.equivariant_count_character_lattice`. Theorem.

Let X/F_q have a finite F_q-defined group G of automorphisms and effective finite-order twists as in the twist comparison. Let f(σ)=#X^σ(F_q), a conjugacy-invariant function. After choosing a characteristic-zero complex realization of the finite cohomological trace data, expand f=Σ_λ a_λ χ_λ in the complex irreducible-character basis; a_λ is the alternating Frobenius trace on the multiplicity spaces Hom_G(V_λ,H_c^i). Then f has a unique lift to the existing integral complex representation ring R_C(G) if and only if every a_λ is an integer. Under this precise integrality condition its identity value is the ordinary count; additivity and products transport to the ring whenever their summands satisfy that condition. Arbitrary twisted counts need only lie in the complex span of characters, not in the integral virtual-character lattice. The all-Spec-Z polynomial application supplies integrality from actual rational Betti representation classes.

Proof/construction plan:

1. The twist comparison identifies f with the graded Frobenius trace and shows conjugacy invariance. Over C finite-group semisimplicity decomposes cohomology into irreducible types and Frobenius commutes with G, giving the stated coefficients on multiplicity spaces.
2. Apply the pinned virtual-character lattice characterization: integer coordinates are exactly membership in virtualCharacters C G. The existing character-image theorem gives a preimage and finite-group characteristic-zero injectivity gives uniqueness.
3. Use the existing character ring homomorphism for disjoint-union and product identities. An arbitrary integer-valued class function does not satisfy the lattice criterion; BFP Definition9.1 needs this qualification or a complexified ring.
4. For smooth proper all-Spec-Z polynomial counts use the separately proved WC.4 theorem, whose coefficients are actual rational Betti representations. Do not assume general Kisin–Lehrer integrality or rational Schur-index descent.

Prerequisites: `WeilConjectures:WC.1/twisted-frobenius-point-comparison`, `tauceti:TauCeti.repRing`, `tauceti:TauCeti.repRingCharacter`, `tauceti:TauCeti.mem_range_repRingCharacter_iff`, `tauceti:TauCeti.repRingCharacter_injective`, `tauceti:TauCeti.mem_virtualCharacters_iff`.

Sources: `bfp`, Definition 9.1 and §9.1: The character-valued point count uses Kisin–Lehrer, whose source must be collated.

Acceptance checks:

* For the trivial group this recovers the scalar count.
* For a degree-two point with its involution, the values(0,2) give trivial minus sign.
* An arbitrary integer class function is rejected without lattice membership.
* For X=Spec F_(q³), G=C₃ its deck group generated by arithmetic Frobenius g, the three twist counts are(0,0,3). Their complex irreducible-character coordinates are(1,ζ₃,ζ₃²); the count is not an integral virtual character.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Curve numerator before RH

Identifier: `WeilConjectures:WC.1/curve-zeta-numerator-without-rh`. Proposed declaration: `TauCeti.PointCounting.curve_zeta_numerator_without_rh`. Theorem.

For a smooth projective geometrically connected curve C/k of genus g and ℓ≠p, the supplied curve/Jacobian cohomology comparison gives H⁰=Q_ℓ, H²=Q_ℓ(−1), dim H¹=2g and compatible Frobenius action. There is a normalized integral polynomial Π_C(T) of degree2g whose Q_ℓ image is det(1−TF|H¹), and Z_C=Π_C/((1−T)(1−qT)). For every r≥1, N_r=1+q^r−Σ_(j=1)^(2g)α_j^r, with α_j the reciprocal roots counted with multiplicity. This theorem uses curve cohomology, rationality and the integral Euler series, without any root-modulus assertion.

Proof/construction plan:

1. Consume the upstream TraceFormula Layers8,15 curve/Jacobian and endpoint cohomology comparisons; a coherent genus formula alone does not give the rational étale dimension.
2. Specialize the cohomological zeta formula. Multiply its formal integral series by(1−T)(1−qT). Its image is the degree-2g determinant polynomial, so coefficients above degree2g vanish already in Z by injectivity, and the remaining coefficients give Π_C.
3. Use the upstream characteristic-power/trace theorem over characteristic zero to identify every positive extension count with the full algebraic-multiplicity root sum.
4. The curve numerator’s reciprocity comes from the independent WC.2 pairing, not from a purity or Jacobian RH theorem.

Prerequisites: `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `WeilConjectures:WC.1/zeta-function-euler-product-and-point-counts`, `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`.

Sources: `deligne-i`, (1.5) and §2.1: Trace/rationality and curve degree interfaces without RH.; `mustata-zeta`, Remark3.7 and equations(3.8)–(3.10), p.21: Normalized integral curve numerator and positive power sums; correct the source’s g/q typos in Lemma3.8.

Acceptance checks:

* For genus0, Π_C=1 and all positive N_r=1+q^r.
* The eigenvalues here are reciprocal roots; polynomial roots are α_j⁻¹.
* No DWP.1/DWP.4 or WC.3 is an input.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

## WC.2

### Exact signed functional equation

Identifier: `WeilConjectures:WC.2/signed-zeta-functional-equation`. Proposed declaration: `TauCeti.PointCounting.signed_zeta_functional_equation`. Theorem.

Let X/k be smooth proper of pure dimension d and ℓ≠p. For its actual graded rational cohomology let b_i=dim H^i, P_i=det(1−TF_i), χ=Σ_(i=0)^(2d)(−1)^i b_i∈Z, and Δ=∏_(i=0)^(2d) det(F_i)^((−1)^i)∈Q_ℓ×. From the supplied perfect graded Frobenius pairing to Q_ℓ(−d), obtain b_i=b_(2d−i), invertibility and reciprocal spectra with multiplicities. Assemble Z_X(1/(q^dT))=(−1)^χ Δ T^χ Z_X(T) and Δ²=q^(dχ) in Q_ℓ(T). The powers of T, q and determinants with integer exponents are field powers, including negative χ. This is not substitution into an ordinary power series.

Proof/construction plan:

1. Import the actual EDC.2 perfect equivariant pairing and EDC.8 degreewise reciprocal-polynomial/determinant relation; instantiate the DWP.0 reciprocal-spectrum algebra.
2. For each P_i write P_i(1/(q^dT))=(−1)^(b_i) det(F_i) q^(−db_i) T^(−b_i) P_(2d−i)(T). Multiply with exponent(−1)^(i+1), keeping every sign and negative exponent.
3. The determinant pairing gives det(F_i)det(F_(2d−i))=q^(db_i); multiply with parity exponents to obtain Δ²=q^(dχ). Use this to replace q^(dχ)/Δ by Δ in the assembled multiplier.
4. For component permutations retain the actual H⁰/H^(2d) determinants; geometric connectedness is unnecessary for this endpoint.

Prerequisites: `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.8`, `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`, `mathlib:Matrix.charpoly_inv`.

Sources: `deligne-i`, (2.1)–(2.6) pp.280–282: Actual duality and exact multiplier before shorthand signs.; `milne-lec`, 27.12 pp.158–159: Functional-equation consequence of reciprocal pairing.

Acceptance checks:

* For a geometric point (d=0), χ=1, Δ=1 and Z(1/T)=−T Z(T).
* For a degree-two finite étale point, χ=2, Δ=−1 and Z(1/T)=−T² Z(T).
* A genus-two curve has χ=−2 and multiplier q⁻¹ T⁻², testing integer negative powers.
* A Jordan block is allowed; no diagonalization is used.

Suggested Lean: signature. Algebraic assembly is prototyped on finite graded polynomial/determinant data; the geometric instantiation is omitted.

### Middle degree and integral half exponent

Identifier: `WeilConjectures:WC.2/middle-degree-parity`. Proposed declaration: `TauCeti.PointCounting.middle_degree_parity`. Theorem.

For smooth proper pure-d X/k, dχ is even. If d is even this is immediate; if d is odd, the characteristic-zero rational middle pairing on H^d is alternating and nondegenerate, hence b_d is even, and duality pairs every remaining degree with the same parity, so χ is even. Consequently m=dχ/2 is an integer, including χ<0. This argument works for Q₂ coefficients when p≠2; residue characteristic two of Z₂ does not make the coefficient field have characteristic two.

Proof/construction plan:

1. Use EDC.2 graded symmetry and perfectness to obtain an alternating middle form for odd d.
2. The supplied determinant/Pfaffian algebra for a nondegenerate alternating form over characteristic zero forces even dimension; use the degree pairs to compute χ modulo2.
3. Define the integer m using the divisibility conclusion, not a fractional rational power.

Prerequisites: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.8`, `WeilConjectures:WC.2/signed-zeta-functional-equation`.

Sources: `deligne-i`, (2.3)–(2.6): Parity and middle-form sign.; `milne-lec`, 27.12–27.13: Usual half-exponent and its sign require this justification.

Acceptance checks:

* For curves χ=2−2g is even.
* For d=0, m=0 irrespective of the number of components.
* Retain ℓ=2,p odd.

Suggested Lean: signature. Integer parity consequence with the explicit even middle-dimension input; construction of the alternating cohomology form is omitted.

### Rational multiplier and exact sign

Identifier: `WeilConjectures:WC.2/functional-equation-multiplier-descent`. Proposed declaration: `TauCeti.PointCounting.functional_equation_multiplier_descent`. Theorem.

The scalar A=(−1)^χΔ in the signed functional equation descends from Q_ℓ× to Q×: the nonzero quotient Z_X(1/(q^dT))/(T^χ Z_X(T)) is a rational function over Q and is constant after scalar extension, hence constant over Q. With m=dχ/2 integral, ε=A/q^m∈Q satisfies ε²=1, so ε=±1 and Z_X(1/(q^dT))=ε q^m T^χ Z_X(T). For odd d the alternating middle determinant makes ε=+1. For even d, ε=(−1)^N, where N is the algebraic multiplicity of the eigenvalue +q^(d/2) in middle cohomology, equivalently the dimension of its generalized eigenspace. Semisimplicity is not assumed.

Proof/construction plan:

1. Use the normalized rational zeta presentation and the signed equation. Comparing a nonzero coefficient in the rational-function numerator/denominator identity descends the constant scalar.
2. Use Δ²=q^(dχ) and the integral exponent m to prove ε²=1 in Q, and factor ε²−1.
3. Use EDC.8 middle determinant: the symplectic case gives the positive sign; in the even-dimensional symmetric case, pair reciprocal generalized eigenspaces away from ±q^(d/2), leaving ε=(−1)^N.
4. Descend A before dividing by q^m. This avoids selecting a square root of q in Q_ℓ or Q.

Prerequisites: `WeilConjectures:WC.2/signed-zeta-functional-equation`, `WeilConjectures:WC.2/middle-degree-parity`, `WeilConjectures:WC.1/rationality-over-q-via-hankel-determinants`, `EtaleDualityAndPerverseSheaves:EDC.8`.

Sources: `deligne-i`, (2.6): Exact sign through the middle determinant.; `milne-lec`, 27.13 p.159: Multiplicity of +q^(d/2), not an unspecified sign.

Acceptance checks:

* P¹ has ε=+1 and exponent1; P² has ε=−1 and exponent3.
* A geometric point has ε=−1, testing d=0.
* A unipotent middle operator with eigenvalue+1 uses generalized multiplicity, not only eigenspace dimension.

Suggested Lean: signature. The rational scalar descent and ε²=1 core are prototyped; actual middle cohomology is omitted.

### Functional equation under finite extension

Identifier: `WeilConjectures:WC.2/functional-equation-base-extension`. Proposed declaration: `TauCeti.PointCounting.functional_equation_base_extension`. Theorem.

For degree-r extension k_r/k, the same Betti dimensions and χ occur, Frobenius becomes F^r, Δ_r=Δ^r and the exact multiplier becomes(−1)^χΔ^r. Thus the half-power sign is ε_r=(−1)^((r+1)χ)ε^r, with q replaced by q^r. It is not generally ε^r alone. Component-cycle changes are handled by the actual determinant of the powered permutation.

Proof/construction plan:

1. Use the WC.0 restriction/Frobenius-power comparison and determinant of powers to compute Δ_r.
2. Substitute these values into the exact signed formula and cancel the integral powers q^(rm).
3. Retain the factor(−1)^χ rather than powering the whole original multiplier blindly.

Prerequisites: `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`, `WeilConjectures:WC.2/functional-equation-multiplier-descent`.

Sources: `deligne-i`, (2.6) with §1.2–1.5: Assembly with the already supplied extension operator.

Acceptance checks:

* For a geometric point, ε_r=−1 for every r.
* A two-cycle d=0 splits over a quadratic extension and Δ₂=1.
* For curves χ is even, so ε_r=ε^r=+1.

Suggested Lean: signature. Scalar Δ/sign identity on the real integer exponent carrier.

### Equivariant palindromicity

Identifier: `WeilConjectures:WC.2/equivariant-polynomial-duality`. Proposed declaration: `TauCeti.PointCounting.equivariant_polynomial_duality`. Theorem.

Under the smooth proper pure-d polynomial-count hypotheses of the preceding theorem, G-equivariant Poincaré duality gives A_i=[H^(2i)_Betti]=[H^(2d−2i)_Betti]^∨ in the existing rational representation ring. Thus A(T)=T^d A(T⁻¹)^∨ as a Laurent-polynomial identity, with dual applied coefficientwise. Multiplicities of dual irreducibles match; an individual multiplicity polynomial is palindromic when the irreducible is self-dual. For smooth proper DM stacks use the stack duality supplier, not scheme duality.

Proof/construction plan:

1. Apply the supplied finite-group-equivariant actual Poincaré pairing and the WC.4 comparison to rational Betti cohomology.
2. Remove the Tate scalar twist from the G-action since G acts over the base and trivially on that one-dimensional twist.
3. Take representation classes and reverse coefficients. A self-dual character permits scalar palindromicity; otherwise pair dual characters.

Prerequisites: `WeilConjectures:WC.4/equivariant-polynomial-point-counts`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `tauceti:TauCeti.repRing`.

Sources: `bfp`, Remark 9.4 p.22: Representation-valued duality, with self-duality qualification.

Acceptance checks:

* The scalar polynomial of P² is1+T+T².
* Two non-self-dual complex characters must be paired with each other, not each made separately palindromic.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

## WC.3

### Degreewise pure factor extraction

Identifier: `WeilConjectures:WC.3/degreewise-pure-factor-extraction`. Proposed declaration: `TauCeti.PointCounting.degreewise_pure_factor_extraction`. Theorem.

Let q>1 be an integer and let finitely many normalized factors P_i over a characteristic-zero realization field have degree b_i and nonzero reciprocal roots α_(i,j), counted with algebraic multiplicity. Suppose each α is algebraic over Q and every Q-embedding Q(α)→C has modulus q^(i/2). Suppose their alternating product equals a fixed normalized integral-series rational function R∈Q(T), whose reduced numerator and denominator have integer coefficients and constant one. Then each P_i is the coefficient image of a unique polynomial Π_i∈Z[T], Π_i(0)=1 and deg Π_i=b_i. The Π_i are pairwise coprime and uniquely characterized by their weight-i reciprocal-root multiset in the reduced numerator (odd i) or denominator (even i), hence independent of the realization. The assertion applies to any supplied degreewise-pure realization, not only projective étale cohomology.

Proof/construction plan:

1. Distinct weights have distinct positive complex moduli q^(i/2), so no root lies in two P_i and no odd/even cancellation occurs. Multiplicities in the reduced parity products are retained.
2. Take a finite normal splitting field K/Q of the reduced rational numerator and denominator. Galois automorphisms permute each full root multiset, including multiplicity. The all-conjugates weight hypothesis keeps the weight-i submultiset invariant; a single chosen complex embedding would not suffice.
3. Each coefficient of the normalized P_i is fixed by Gal(K/Q); the pinned fixed-element theorem descends it to Q. This is the missing step in the shorthand proof of Milne27.14(c).
4. Reverse the normalized factors to monic polynomials in reciprocal roots; each divides a monic reverse of an integral parity product. Apply the integrally-closed Gauss lemma over Z⊂Q, then reverse back. Uniqueness of the weight partition gives equality across coefficient fields.

Prerequisites: `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `mathlib:IsGalois.mem_range_algebraMap_iff_fixed`, `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd`, `WeilConjectures:WC.1/normalized-integral-zeta-presentation`.

Sources: `deligne-i`, (1.7)⇒(1.6) pp.276–277 full proof: All-conjugates Galois-stable extraction with multiplicities.; `milne-lec`, 27.14(c)–(d) p.159: The algebraic inference is completed by explicit rational descent.

Acceptance checks:

* Factors(1−√2T) and(1+√2T) are coprime and multiply to1−2T², but individually are not rational; root integrality alone is insufficient.
* Two degree labels with the same claimed weight cannot be separated by this theorem; q=1 is excluded.
* Repeated roots within one degree keep their multiplicities; a Jordan block need not be semisimple.
* A zero-dimensional finite étale permutation factor is integral although its roots are not all1.

Suggested Lean: signature. Finite normal splitting-field polynomial core with all complex embeddings and a common reduced integral rational function.

### Integral projective Weil factors

Identifier: `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`. Proposed declaration: `TauCeti.PointCounting.integral_projective_weil_factors`. Theorem.

For actual smooth projective X/k, not assumed geometrically connected, import the proved DWP.4 smooth-projective purity theorem. For each i obtain a unique Π_i∈Z[T], Π_i(0)=1, with coefficient image det(1−TF_q|H^i(X_k̄,Q_ℓ)) for every ℓ≠p. Its degree is b_i, its reciprocal roots are algebraic integers, and every complex conjugate of every reciprocal root has modulus q^(i/2). Factors of distinct degrees are coprime and the integral Π_i and b_i are independent of ℓ. Frobenius semisimplicity is not part of the conclusion.

Proof/construction plan:

1. Use the WC.0 constructed rational realization and DWP.4 theorem, not a proposition-valued realization carrying purity as an assumption.
2. The WC.1 normalized integral zeta supplies the common rational function. Apply the generic factor-extraction theorem to the actual cohomological factors.
3. Invertibility supplies the exact degree. Read all conjugate moduli from DWP.4 and algebraic integrality from the extracted monic reciprocal polynomial.

Prerequisites: `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`, `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `WeilConjectures:WC.3/degreewise-pure-factor-extraction`, `DeligneWeightsAndPurity:DWP.4`.

Sources: `deligne-i`, (1.6)–(1.7): Geometric projective application of the generic extractor, preserving its integrated ID.

Acceptance checks:

* Pⁿ has Π_(2i)=1−q^iT and Π_odd=1.
* No complex fibre or characteristic-zero lift is required.
* Compare coefficient embeddings for two primes ℓ and ℓ′; the integer polynomial is the same.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

## WC.4

### Betti comparison in a supplied family

Identifier: `WeilConjectures:WC.4/betti-comparison-in-a-supplied-family`. Proposed declaration: `TauCeti.PointCounting.betti_comparison_supplied_family`. Theorem.

Let f:X→S be smooth proper with connected base S, ℓ invertible on S, a specified geometric finite-field fibre X_s̄ and a specified complex geometric fibre X_t̄, together with an étale transport path γ:s̄→t̄. Compose the supplied rational ℓ-adic fibre transport and Artin comparison to identify H^i_et(X_s̄,Q_ℓ) with H^i_sing(X_t(C),Q)⊗Q Q_ℓ. The isomorphism depends on γ, but dimensions and Betti numbers do not. The composition is compatible with cup products, Tate twists and finite group actions on the family. No assertion says an arbitrary finite-field variety has such a family or complex fibre.

Proof/construction plan:

1. Verify the hypotheses of EtaleBaseChange Layers7–8 on the supplied family and lift its finite-coefficient transports through EllAdicRealization to rational coefficients.
2. At the specified complex fibre use ComplexComparison Layers10–12 and EllAdicRealization Layer10 to pass from finite to rational singular coefficients.
3. Compose the path-aware maps and use their identity/concatenation laws. Different paths differ by monodromy automorphisms and give the same finite dimension.
4. Outside the smooth-proper case use only a supplied lisse stratum and the compact-support comparison appropriate to it; do not extend the numerical theorem across a jumping stratum.

Prerequisites: `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`.

Sources: `milne-lec`, 27.14(e), with §20.5 and §25.1: Comparison only through an actual family.; `pr196`, EtaleBaseChange Layers7–8; ComplexComparison Layers10–12; EllAdicRealization Layer10: Transport and Artin equivalences are supplied, not reconstructed.

Acceptance checks:

* For a supplied Pⁿ family, b_(2i)=1, b_odd=0 in both fibres.
* Changing γ can change a vector identification but cannot change its dimension.
* If no complex fibre is supplied this theorem cannot be applied; WC.3 still applies.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Equivariant polynomial point counts

Identifier: `WeilConjectures:WC.4/equivariant-polynomial-point-counts`. Proposed declaration: `TauCeti.PointCounting.equivariant_polynomial_point_counts`. Theorem.

Let X be a smooth proper finite-type scheme over Spec Z with a finite group G acting over Z, and suppose its weighted/scalar point counts are polynomial for every finite field. For the complex fibre put A(T)=Σ_i[H^(2i)_sing(X(C),Q)]T^i∈R_Q(G)[T], using the existing representation ring and the actual rational Betti representations. Odd cohomology vanishes; for every q and σ∈G, the character of A(q) at σ is #X^σ(F_q). Coefficients are actual representation classes, hence their complex irreducible multiplicities are nonnegative integers. For rational irreducibles retain Schur indices: dimensions or character inner products over C are not automatically rational-irrep multiplicities. The smooth proper DM version has the same conclusion only after importing the stack comparison/purity/duality contracts recorded in the gap ledger.

Proof/construction plan:

1. Apply the all-Spec-Z polynomial-count/Tate theorem in WC.5, including its full isomorphism conclusion rather than only semisimplification.
2. Use the supplied-family comparison for Spec Z[1/ℓ] and the finite-group-compatible rational Artin theorem to identify the G-action with the actual rational Betti representation.
3. Geometric Frobenius acts by q^i on even Tate cohomology; the twist trace gives Σ_i q^i Tr(σ|H^(2i)_Betti). Construct the polynomial with existing representation-ring classes.
4. Finite-group semisimplicity over Q and extension to C explain multiplicities. For the DM version substitute actual stack carriers and comparison theorems, not scheme carriers.

Prerequisites: `WeilConjectures:WC.4/betti-comparison-in-a-supplied-family`, `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`, `WeilConjectures:WC.1/twisted-frobenius-point-comparison`, `tauceti:TauCeti.repRing`, `tauceti:TauCeti.repRingCharacter`.

Sources: `bfp`, Proposition 9.3 pp.21–22 full proof: Equivariant arithmetic consequence of polynomial count and comparison.

Acceptance checks:

* For P¹ with trivial G, A(T)=1+T.
* For a G-set of rational components, the degree-zero coefficient is the actual permutation representation.
* The nonsplit quadric’s involution sign on its middle classes reproduces1+q², while the split form has1+2q+q².

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

## WC.5

### All-extension Weil bound

Identifier: `WeilConjectures:WC.5/all-extension-point-count-bound`. Proposed declaration: `TauCeti.PointCounting.all_extension_point_count_bound`. Theorem.

For smooth projective geometrically connected X/k of dimension d≥1, for every r≥1, |N_r−(1+q^(dr))|≤Σ_(i=1)^(2d−1) b_i q^(ir/2). The b_i are the canonical degree-factor degrees from WC.3. The constant is their explicit weighted sum, not2b_1 in the curve case. Every extension is included.

Proof/construction plan:

1. Use the actual trace formula, H⁰ eigenvalue1 and H^(2d) eigenvalueq^d from the geometric pairing and connectedness.
2. Apply the imported all-conjugates projective purity through the canonical integral factors, after choosing a common complex splitting field.
3. For each degree use norm of a power and the finite-sum triangle inequality. No diagonalization is needed because trace uses algebraic multiplicities.

Prerequisites: `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`, `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `mathlib:norm_sum_le`.

Sources: `deligne-i`, (1.7) and (8.1): Point-count consequence of degreewise purity.

Acceptance checks:

* For P² the error is q^r and the bound is exactly b₂q^r=q^r.
* The theorem excludes d=0; subtracting two endpoint terms there would double-count H⁰.
* For a curve the right side is b₁q^(r/2)=2gq^(r/2).

Suggested Lean: signature. The finite complex spectral inequality, with the endpoint term separated, is prototyped; the actual geometric application is omitted.

### Component permutations and dimension zero

Identifier: `WeilConjectures:WC.5/components-and-dimension-zero`. Proposed declaration: `TauCeti.PointCounting.component_and_dimension_zero_counts`. Theorem.

For smooth projective pure-d X/k with d≥1 and geometric connected components permuted by σ, let c_r be the number fixed by σ^r. The endpoint trace is c_r(1+q^(dr)); the same interior Betti sum bounds |N_r−c_r(1+q^(dr))|. For d=0, X is finite étale and N_r=c_r exactly; Z_X=∏_(cycles of σ)(1−T^length)⁻¹. A single geometric point has N_r=1, while a degree-m closed point has N_r=m when m|r and zero otherwise.

Proof/construction plan:

1. Identify H⁰ with the permutation representation on geometric components and H^(2d) with its Tate-twisted dual. Both powered permutation traces equal c_r.
2. Subtract these actual endpoint traces for d≥1 and use the interior degreewise root bound.
3. For d=0 there is only H⁰, so use its single trace and the finite étale Euler product rather than subtracting both endpoints.

Prerequisites: `WeilConjectures:WC.5/all-extension-point-count-bound`, `WeilConjectures:WC.0/closed-point-degree-comparison`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

Sources: `deligne-i`, (1.2)–(1.5) and §2.1: Permutation endpoints with the dimension-zero boundary separated.

Acceptance checks:

* A degree-two finite étale point has counts0,2,0,2,… .
* Two rational projective lines have endpoint2(1+q^r).
* Two lines interchanged by Frobenius contribute endpoint0 for odd r and2(1+q^r) for even r.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Curve and elliptic compatibility

Identifier: `WeilConjectures:WC.5/curve-and-elliptic-bound-comparison`. Proposed declaration: `TauCeti.PointCounting.curve_elliptic_bound_comparison`. Theorem.

For a smooth projective geometrically connected genus-g curve, identify the WC all-extension estimate with the independent DWP.1 Jacobian/Rosati estimate using the actual H¹/Jacobian cohomology comparison b₁=2g. For a nonsingular Weierstrass elliptic curve over k, identify its scheme count with the existing WeierstrassCurve.pointCount and Point carrier, and its a_q=q+1−N₁ with the existing frobeniusTrace. The inequality |a_q|≤2√q agrees with the independent EllipticCurves Layer3 Hasse theorem. Its degree-r counterpart uses the same finite-extension count; agreement is a compatibility theorem, not another elliptic or Jacobian proof.

Proof/construction plan:

1. Apply the explicit DWP.1 curve-count and cohomology interfaces, retaining the genus and cohomological-degree identification.
2. Use the nonsingular projective Weierstrass model/Point comparison supplied by the elliptic geometric owner; apply the pinned pointCount_eq_card_point and trace definition.
3. Translate the independent elliptic inequality and recurrence through this equality of point carriers, not through an abstract integer named N.

Prerequisites: `WeilConjectures:WC.5/all-extension-point-count-bound`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:WeierstrassCurve.pointCount`, `tauceti:WeierstrassCurve.pointCount_eq_card_point`, `tauceti:WeierstrassCurve.frobeniusTrace`.

Sources: `milne-lec`, 27.15 and curve specialization: Compatibility application of already-owned curve and elliptic estimates.; `mustata-zeta`, Example3.10 pp.22–23: Curve numerator and elliptic trace convention.

Acceptance checks:

* For g=0 the error is0.
* For g=1, Π₁=1−a_qT+qT² and S₂=a_q²−2q.
* A singular Weierstrass cubic is excluded from the elliptic Point comparison.
* A coherent genus comparison alone is insufficient to establish b₁=2g.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Recurrences from canonical Weil factors

Identifier: `WeilConjectures:WC.5/extension-count-recurrence`. Proposed declaration: `TauCeti.PointCounting.extension_count_recurrence`. Theorem.

For canonical Π_i(T)=1+c_(i,1)T+…+c_(i,b_i)T^(b_i), put S_(i,n)=Tr(F_i^n) with S_(i,0)=b_i. For n≥b_i, S_(i,n)+Σ_(j=1)^(b_i)c_(i,j)S_(i,n−j)=0; for1≤n≤b_i, Newton’s identity is S_(i,n)+Σ_(j=1)^(n−1)c_(i,j)S_(i,n−j)+n c_(i,n)=0. In characteristic zero the first b_i moments recover Π_i. For curves S_n=1+q^n−N_n, S₀=2g. In all dimensions Q_tot=∏_i Π_i is an annihilating recurrence polynomial for the positive point counts, with the algebraic continuation N₀=χ, not a count over F₁. Its order is Σ_i b_i, and cancellations can lower the minimal recurrence order.

Proof/construction plan:

1. Apply the upstream DWP.0 determinant/power-trace/Newton theorem to the canonical factors, using their reverse characteristic-polynomial convention.
2. For each reciprocal root α, the recurrence follows by multiplying its monic reciprocal polynomial by α^(n−b_i) and summing with multiplicity; zero-root and empty-family boundary cases remain legitimate.
3. The characteristic-zero Newton formulas recover each coefficient successively from the moments. Translate to curve extension counts through the root-bound-free curve comparison.
4. Each root moment is annihilated by Q_tot; sum with the cohomological signs. N₀ must beχ to preserve this algebraic sequence.

Prerequisites: `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`, `WeilConjectures:WC.1/curve-zeta-numerator-without-rh`, `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`, `mathlib:Matrix.reverse_charpoly`.

Sources: `milne-lec`, 27.5–27.6: Characteristic-power series and extension traces; new export is the canonical count recurrence.; `deligne-i`, (1.5) and §1.15: Trace/determinant conversion applied to canonical factors.

Acceptance checks:

* An elliptic curve has S_n=a_qS_(n−1)−qS_(n−2), S₀=2, S₁=a_q.
* Π₁ is1−aT+qT²; charpoly(F) isX²−aX+q.
* A repeated root may give minimal recurrence order smaller than b_i; multiplicities still determine Π_i.
* For an empty spectrum b=0, every S_n is0.

Suggested Lean: signature. Exact finite-spectrum polynomial recurrence and Newton identities; no fake finite-field degree-zero count.

### Complete-intersection Weil estimate

Identifier: `WeilConjectures:WC.5/complete-intersection-point-count`. Proposed declaration: `TauCeti.PointCounting.complete_intersection_point_count`. Theorem.

Let X/k be a smooth projective geometrically connected complete intersection of dimension n≥1 and fixed multidegree. Let b′ be the middle Betti number of a smooth complex complete intersection with that same dimension and multidegree, supplied through the complete-intersection cohomology comparison; put b=b′ for n odd and b=b′−1 for n even. For every r≥1, |#X(k_r)−#Pⁿ(k_r)|≤b q^(nr/2). Equivalently only the middle primitive cohomology contributes to the error, with sign(−1)^n and exactly b reciprocal roots. The complex comparison is part of the geometric supplier, not an arbitrary lift assumption.

Proof/construction plan:

1. Import the repeated ample weak-Lefschetz/projective-space complete-intersection decomposition with its Frobenius/Tate maps from EDC.4. The middle primitive dimension is determined by the same multidegree and the supplied comparison family.
2. Use WC.4 for the actual supplied finite-field/complex family or the EDC.4 complete-intersection comparison contract; exclude an unsupported appeal to arbitrary liftability.
3. Cancel the ambient Pⁿ Tate traces in the actual point-count formula and apply projective purity only to the b primitive middle roots.
4. Replace F_q by F_q^r to obtain every extension rather than only the printed r=1 case.

Prerequisites: `WeilConjectures:WC.5/all-extension-point-count-bound`, `WeilConjectures:WC.4/betti-comparison-in-a-supplied-family`, `EtaleDualityAndPerverseSheaves:EDC.4`.

Sources: `deligne-i`, (8.1) pp.301–302 full proof: Requested worked corollary with precise primitive Betti constant.

Acceptance checks:

* A projective linear subspace has b=0 and identical counts to Pⁿ.
* A smooth plane genus-g curve gives b=2g.
* For even n subtract the ambient middle Tate class once; using b′ would lose the sharp constant.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Polynomial point count

Identifier: `WeilConjectures:WC.5/polynomial-point-count`. Proposed declaration: `TauCeti.PointCounting.HasPolynomialPointCount`. Definition.

For an isomorphism-invariant finite-field count function N:Nat→Q and P∈Q[T], HasPolynomialPointCount(N,P) means N(q)=P(q) for every positive prime power q. The count function is obtained from actual finite-field point sets or finite-mass groupoids by the WC.0/1 comparisons; values at0,1 or non-prime-powers are immaterial. A polynomial count is exact on every finite field, not only prime fields, a single field, or an asymptotic sequence. The witness polynomial is unique.

Proof/construction plan:

1. Use the existing IsPrimePow predicate and polynomial evaluation; no new finite-field carrier is introduced.
2. Derive addition and multiplication pointwise and compare exact counts through the geometric sum/product interfaces.
3. For uniqueness use agreement at the infinitely many rational integers2^n, n≥1, and the existing polynomial root theorem over Q.

Prerequisites: `mathlib:IsPrimePow`, `mathlib:Polynomial.eq_of_infinite_eval_eq`.

Sources: `bfp`, §1–§3 polynomial point count; Proposition 9.3: The exact arithmetic predicate used by the cited cohomology consequences.; `vdbe`, Theorem 2.1: Distinguish exact polynomial count from its weaker approximate hypothesis.

Uses:

* vdBE Theorem2.1 and BFP Proposition3.1: Supplies exact or approximate count hypotheses for Tate/vanishing consequences.
* BFP Proposition9.3 and Remark9.4: Produces representation-valued polynomial counts and duality.
* MotivicStructuresInModuliOfCurves: Consumes certified global polynomial witnesses for moduli counts, without placing the moduli enumeration in this packet.

Planning API:

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.PointCounting.HasPolynomialPointCount_eval` | simp | If HasPolynomialPointCount(N,P) and q is a prime power, N(q)=P(q). |
| `TauCeti.PointCounting.HasPolynomialPointCount_unique` | extensionality | Two polynomial witnesses for the same N are equal. |
| `TauCeti.PointCounting.HasPolynomialPointCount_zero` | simp | The zero count has witness0. |
| `TauCeti.PointCounting.HasPolynomialPointCount_add` | compatibility | Witnesses P,Q for N,M give witness P+Q for N+M. |
| `TauCeti.PointCounting.HasPolynomialPointCount_mul` | compatibility | Witnesses P,Q for N,M give witness P Q for the pointwise product. |
| `TauCeti.PointCounting.HasPolynomialPointCount_congr` | characterisation | Two functions agreeing on prime powers have the same polynomial-count witnesses. |

Unit-test statements (matched by markers in the suggested file):

* `TauCeti.PointCounting.polynomialPointCount_projective_line` (computation): N(q)=q+1 has witnessT+1.
* `TauCeti.PointCounting.polynomialPointCount_empty` (degenerate): N(q)=0 has witness0.
* `TauCeti.PointCounting.polynomialPointCount_multiplicative_group` (compatibility): N(q)=q−1 has witnessT−1, which has a negative constant coefficient.
* `TauCeti.PointCounting.polynomialPointCount_prime_fields_insufficient` (non-example): Changing only the value atq=4 to0 in N(q)=q+1 destroys the witnessT+1 despite agreement at every prime.
* `TauCeti.PointCounting.polynomialPointCount_one_field_insufficient` (non-example): T and T+(T−2) agree atq=2 but cannot both witness the same count function.

Acceptance checks:

* No sign constraint on coefficients follows for nonproper varieties; G_m has polynomialT−1.

Suggested Lean: signature. Genuine arithmetic predicate with its full body: all existing IsPrimePow indices, rational Polynomial evaluation.

### Polynomial approximation and odd vanishing

Identifier: `WeilConjectures:WC.5/local-polynomial-count-cutoff`. Proposed declaration: `TauCeti.PointCounting.local_polynomial_count_cutoff`. Theorem.

Let X be a smooth proper pure-d scheme or DM stack over Z_p, s≥d an integer, and choose the geometric/coefficient/comparison data needed to identify its generic rational Betti spaces, with ℓ≠p. Suppose P∈Q[T] and #X(F_(p^n))−P(p^n)=o(p^(sn/2)) for n→∞, using mass for stacks. Then H^k=0 for every odd k≥s. For every j with s≤2j≤2d, P_j=dim H^(2j), every reciprocal Frobenius root there is p^j, and no Frobenius semisimplicity is asserted. The source’s proof must use s in the error exponent. The DM case requires its actual trace, purity and coarse/comparison supplier.

Proof/construction plan:

1. Apply proper smooth base change to the generic/special fibres and the chosen complex comparison; do not declare an arbitrary complex fibre without an embedding/family.
2. Use proper-smooth purity (DWP.7 for schemes; the documented DM/coarse-space/alteration contract for stacks) and the actual trace formula.
3. Apply the independent graded polynomial-approximation lemma with degree range0..2d and cutoff s. If s>2d, all claimed cohomological ranges are empty.
4. Translate multiplicities to dimensions through the actual finite cohomology comparison. Eigenvalue equality does not remove Jordan blocks.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/graded-polynomial-approximation-lemma`, `WeilConjectures:WC.4/betti-comparison-in-a-supplied-family`, `WeilConjectures:WC.1/stack-count-comparison`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`.

Sources: `bfp`, Proposition 3.1 p.6 statement and full proof: Exact cutoff s≥d; the imported extraction already confirmed its d→s misprint.; `vdbe`, Lemma 4.1: Numerical core of the argument.

Acceptance checks:

* The stronger cutoff s>d leaves low odd degrees unconstrained until a duality argument is separately applied.
* A−p eigenvalue at degree2 fails little-o(p^n).
* Replacing little-o by O at the boundary would permit visible roots and is rejected.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Approximate counts and Tate semisimplification

Identifier: `WeilConjectures:WC.5/approximate-counts-and-tate-semisimplification`. Proposed declaration: `TauCeti.PointCounting.approximate_counts_tate_semisimplification`. Theorem.

Let U⊂Spec Z be a nonempty open, X/U smooth proper pure-d of finite type (scheme, or DM stack with the documented stack inputs), and S⊂primes(U) have density1. Suppose P∈Q[T] and, for each p∈S, #X(F_(p^n))=P(p^n)+o(p^(nd/2)) as n→∞. There is a unique palindromic C∈Z[T], C_j=C_(d−j), with nonnegative coefficients, deg C≤d, and C_j=P_j for2j≥d; for every p∈U and n≥1 the exact count is C(p^n). For every ℓ, H^odd(X_Q̄,Q_ℓ)=0 and H^(2j)(X_Q̄,Q_ℓ)^ss≅Q_ℓ(−j)^(C_j) as continuous G_Q-representations, restricted to the good-reduction open. If the generic fibre is nonempty then deg C=d; for an empty family C=0. The input P need not equal C in degrees below d/2.

Proof/construction plan:

1. At each p∈S apply the graded moment lemma at cutoff d using the actual purity/trace theorem and constant fibre dimensions. This kills odd high degrees and identifies even high coefficients and eigenvalues.
2. Apply Frobenius-equivariant Poincaré duality to obtain low-degree vanishing and scalar eigenvalues, and complete the polynomial by C_j=C_(d−j). Comparison fixes dimensions across the supplied connected family.
3. At the density-one good primes, characteristic polynomials agree with the corresponding Tate sum. Apply Chebotarev and characteristic-zero Brauer–Nesbitt recognition from R01.5; only semisimplifications are concluded.
4. Trace is unchanged under semisimplification, so the actual trace formula gives exact counts for every good finite field. The infinitely many values prove uniqueness of C; dimensions make its coefficients nonnegative integers.

Prerequisites: `WeilConjectures:WC.5/local-polynomial-count-cutoff`, `WeilConjectures:WC.4/betti-comparison-in-a-supplied-family`, `WeilConjectures:WC.2/signed-zeta-functional-equation`, `ArithmeticGaloisRepresentations:R01.5`, `mathlib:Polynomial.eq_of_infinite_eval_eq`.

Sources: `vdbe`, Theorem 2.1 and §4 full proof: The v3 open-U statement gives semisimplification; the corrected input-polynomial interpretation preserves its exact conclusion.

Acceptance checks:

* For P², P(T)=T²+T approximates counts with error1=o(p^n), but the exact palindromic polynomial is C(T)=T²+T+1.
* An empty family has C=0, so claiming degree exactly d without nonemptiness is rejected.
* Density-one trace agreement cannot by itself prove that extensions of identical Tate constituents split.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Polynomial counts and full Tate cohomology

Identifier: `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`. Proposed declaration: `TauCeti.PointCounting.polynomial_counts_over_z_tate_cohomology`. Theorem.

For a smooth proper pure-d finite-type scheme X over all Spec Z (or DM stack with the documented extra inputs), exact polynomial point count over every finite field is equivalent to the existence of nonnegative integers C_j such that, for every ℓ, H^odd(X_Q̄,Q_ℓ)=0 and H^(2j)(X_Q̄,Q_ℓ)≅Q_ℓ(−j)^(C_j) as actual continuous G_Q-representations. The unique count polynomial is Σ_j C_j T^j and is palindromic. The full isomorphism conclusion uses all Spec Z, local potential semistability at the coefficient prime and global absence of everywhere-unramified nontrivial finite extensions of Q; it is stronger than the open-U semisimplification conclusion.

Proof/construction plan:

1. Apply the approximate-count theorem with zero error and U=Spec Z to obtain the Tate semisimplification in each degree.
2. Twist H^(2j) by j, so its Jordan–Hölder constituents are trivial. At primes different from ℓ it is unramified by smooth proper base change. At ℓ apply good-reduction crystalline comparison for schemes; the DM route uses the supplier’s potential semistability theorem.
3. Import the local trivial-extension theorem from p-adic Hodge theory: a potentially semistable extension of trivial representations is unramified. Its filtered(φ,N) proof has Fil⁰=D, Fil¹=0 and N=0, and accounts for the unramified extension class; do not assume Frobenius is semisimple.
4. The resulting representation is unramified at every finite prime. Every finite quotient factors through an everywhere-unramified number-field extension. The global discriminant comparison plus the pinned Hermite–Minkowski inequality makes such extensions trivial; continuity then makes the entire representation trivial. This yields the actual Tate isomorphism.
5. Conversely, apply the actual trace formula at each finite-field prime using a different coefficient prime; the Tate traces give the polynomial, and equivariant duality gives palindromicity.

Prerequisites: `WeilConjectures:WC.5/polynomial-point-count`, `WeilConjectures:WC.5/approximate-counts-and-tate-semisimplification`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.2`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences`, `mathlib:NumberField.abs_discr_gt_two`.

Sources: `vdbe`, Theorem 2.1 last clause and §4 Lemma4.2/full proof: The all-Spec-Z full Tate conclusion and its local/global splitting inputs.; `bfp`, §3 and Proposition 9.3: The global cohomology consequence needed for equivariant counts.

Acceptance checks:

* Pⁿ over Z has actual even Tate cohomology and count1+q+…+qⁿ.
* For a single Jordan block, scalar eigenvalues and trace moments alone do not establish this conclusion; the local/global proof is indispensable.
* Removing primes from the base retains the stated semisimplification theorem and loses the all-primes argument.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

## WC.5:power-sum-converse

### Recover one weighted exponential from consecutive moments

Identifier: `WeilConjectures:WC.5:power-sum-converse/recover-consecutive-moments`. Proposed declaration: `TauCeti.FiniteSpectrum.recover_consecutive_moments`. Lemma.

Let K be a field, d a natural number, and β: Fin d → K injective. Put V_ij=β_i^j, with rows indexed by roots and columns by exponents, and A=V⁻¹, the existing nonsingular inverse. For c: Fin d → K, n≥0 and k in Fin d, c_k β_k^n = Σ_{j<d} A_jk (Σ_{i<d} c_i β_i^(n+j)).

Hypotheses: No completeness, norm, nonzero-root or characteristic-zero hypothesis. The empty family has no k..

Proof/construction plan:

1. The determinant criterion makes det V nonzero and hence a unit in K. Apply the existing V V⁻¹=I theorem.
2. Expand the right side and commute the two finite sums. Use β_i^(n+j)=β_i^n β_i^j. The inner sum Σ_j β_i^j A_jk is the (i,k) entry of V A, hence the Kronecker delta.
3. The formula includes β_i=0 and n=0 with the usual zeroth-power convention.

Prerequisites: `mathlib:Matrix.vandermonde`, `mathlib:Matrix.det_vandermonde_ne_zero_iff`, `mathlib:Matrix.mul_nonsing_inv`.

Sources: `mathlib-vandermonde-pin`, Vandermonde.lean: det_vandermonde_ne_zero_iff; NonsingularInverse.lean: mul_nonsing_inv: The pinned algebraic input. This node applies the existing inverse to consecutive moments; it does not rebuild the Vandermonde theorem.

Acceptance checks:

* For d=1 the inverse matrix is [1], so the identity is tautological.
* For β=(2,−2), the k=0 formula is c_0 2^n = S_n/2 + S_(n+1)/4; transposing the inverse would give a wrong formula.
* For β=(0,1) test n=0 and n=1 separately.

### A quantitative bound from a moment window

Identifier: `WeilConjectures:WC.5:power-sum-converse/consecutive-moment-bound`. Proposed declaration: `TauCeti.FiniteSpectrum.consecutive_moment_bound`. Lemma.

Let K be a normed field, β: Fin d → K injective, c: Fin d → K, C,R≥0, and N,n natural with N≤n. Suppose ‖Σ_i c_i β_i^m‖≤C R^m for every m≥N. Then for each k, ‖c_k‖ ‖β_k‖^n ≤ C R^n Σ_{j<d} ‖(V⁻¹)_jk‖ R^j, where V_ij=β_i^j.

Hypotheses: The constant depends on the distinct roots and on R, not on n. R=0 is permitted; use positive n when drawing conclusions from that case..

Proof/construction plan:

1. Apply recover-consecutive-moments and the finite-sum norm inequality. Each n+j is at least N, so each moment has the assumed bound.
2. Use multiplicativity of the field norm and R^(n+j)=R^n R^j. Extract the nonnegative common factors C R^n.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/recover-consecutive-moments`, `mathlib:norm_sum_le`.

Sources: `mathlib-vandermonde-pin`, Vandermonde.lean: det_vandermonde_ne_zero_iff; NonsingularInverse.lean: mul_nonsing_inv: The pinned algebraic input. This node applies the existing inverse to consecutive moments; it does not rebuild the Vandermonde theorem.

Acceptance checks:

* For β=(2,−2), the k=0 constant is 1/2+R/4 in the usual real norm.
* At R=0 and n≥1, the right side is zero.
* Allow c_k=0 without division.

### An eventual exponential bound controls each visible root

Identifier: `WeilConjectures:WC.5:power-sum-converse/distinct-spectrum-bound`. Proposed declaration: `TauCeti.FiniteSpectrum.norm_le_of_distinct_moment_bound`. Theorem.

Let K be a normed field, β: Fin d → K injective, c: Fin d → K, C,R≥0 and N≥0. If ‖Σ_i c_i β_i^n‖≤C R^n for every n≥N, then c_k≠0 implies ‖β_k‖≤R for every k.

Hypotheses: No characteristic-zero or completeness hypothesis. Distinct roots and a nonzero coefficient at the root in question are essential. The estimate may begin at any fixed N..

Proof/construction plan:

1. For R>0, apply consecutive-moment-bound, divide by ‖c_k‖ R^n, and bound (‖β_k‖/R)^n by the fixed nonnegative real number C Σ_j ‖(V⁻¹)_jk‖ R^j / ‖c_k‖.
2. If ‖β_k‖>R, the real base is greater than one. Its powers exceed that number by pow_unbounded_of_one_lt; enlarge the exponent to be at least N, using monotonicity of powers of a base greater than one. This contradicts the bound.
3. For R=0 choose n=max(N,1). Every moment in the window is zero. Recovery gives c_k β_k^n=0, so β_k=0. Equivalently use the existing finite-moment uniqueness theorem on coefficients c_i β_i^n.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/consecutive-moment-bound`, `WeilConjectures:WC.5:power-sum-converse/recover-consecutive-moments`, `mathlib:pow_unbounded_of_one_lt`, `mathlib:Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero`.

Sources: `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

Acceptance checks:

* A zero coefficient gives no bound on its root.
* The weighted pair of distinct roots 2 and −2 may have S_1=0; S_2 detects growth.
* A zero-radius estimate forces every visible root to be zero, even when N>1.

### Combine coincident roots before applying the bound

Identifier: `WeilConjectures:WC.5:power-sum-converse/grouped-spectrum-bound`. Proposed declaration: `TauCeti.FiniteSpectrum.norm_le_of_grouped_moment_bound`. Theorem.

Let K be a normed field, α,w: Fin d → K, C,R≥0 and N≥0. Suppose ‖Σ_i w_i α_i^n‖≤C R^n for every n≥N. For any j such that Σ_{i:α_i=α_j} w_i is nonzero, one has ‖α_j‖≤R.

Hypotheses: Weights may have either sign or cancel. The nonzero hypothesis is on the total weight of the entire fibre, not an individual occurrence..

Proof/construction plan:

1. Take the finite image B of α. For b in B put its coefficient equal to the sum of w_i over α_i=b. Expanding the finite double sum shows that these grouped coefficients have exactly the original moments at every exponent.
2. Enumerate B by Fin(card B), giving an injective root family, and apply distinct-spectrum-bound to the coefficient of α_j. The argument is invariant under the enumeration.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/distinct-spectrum-bound`.

Sources: `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

Acceptance checks:

* Two occurrences of 100 with weights 1 and −1 have zero aggregate coefficient and all moments vanish; no bound on 100 is inferred.
* Two occurrences of 2 with weights 1 and 1 contribute 2·2^n, not 2^n.
* Adding a zero-weight occurrence does not change the conclusion.

### The unweighted power-sum converse in characteristic zero

Identifier: `WeilConjectures:WC.5:power-sum-converse/power-sum-converse`. Proposed declaration: `TauCeti.FiniteSpectrum.norm_le_of_power_sum_bound`. Theorem.

Let K be a normed field of characteristic zero, α: Fin d → K, C,R≥0 and N≥0. If ‖Σ_i α_i^n‖≤C R^n for every n≥N, then ‖α_i‖≤R for every i. In particular this holds for every finite multiset of complex numbers, counting multiplicities, with bounds on all positive powers.

Hypotheses: Characteristic zero is used only to ensure that the positive multiplicity of each distinct root is nonzero in K. No distinctness or nonzero-root condition is imposed on α..

Proof/construction plan:

1. Use grouped-spectrum-bound with every w_i=1. The coefficient at any root is the natural cardinal of a nonempty fibre; its image in K is nonzero by characteristic zero.
2. Represent a finite multiset by any finite enumeration. The sums and conclusion are invariant under a permutation, so no root-set replacement loses multiplicity.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/grouped-spectrum-bound`.

Sources: `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

Acceptance checks:

* The empty family is allowed.
* The pair (2,2) has multiplicity two.
* In characteristic p, p copies of the same nonzero root have zero moments: the characteristic-zero hypothesis cannot be dropped.

### Root bounds are equivalent to all-power bounds

Identifier: `WeilConjectures:WC.5:power-sum-converse/power-sum-bound-iff`. Proposed declaration: `TauCeti.FiniteSpectrum.power_sum_bound_iff`. Theorem.

For a characteristic-zero normed field K, a finite family α and R≥0, the following are equivalent: there exists C≥0 with ‖Σ_i α_i^n‖≤C R^n for every n≥1; every ‖α_i‖≤R. In the reverse direction the explicit choice C=d works.

Hypotheses: An all-positive-power bound is required, not a bound for one exponent or an arbitrary finite initial segment..

Proof/construction plan:

1. The forward direction is power-sum-converse with N=1.
2. For the reverse direction use norm_sum_le, multiplicativity of the norm, monotonicity of natural powers on nonnegative real numbers, and the finite cardinal d. The argument also covers d=0 and R=0.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/power-sum-converse`, `mathlib:norm_sum_le`.

Sources: `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

Acceptance checks:

* For d=0 choose C=0.
* For roots ±M, the first moment vanishes for arbitrary M; the full condition still bounds M.
* Scaled m-th roots of unity have zero moments at exponents 1 through m−1, showing that no fixed finite initial test suffices.

### The nonarchimedean negative-power obstruction

Identifier: `WeilConjectures:WC.5:power-sum-converse/reciprocal-moments-escape-unit-ball`. Proposed declaration: `TauCeti.FiniteSpectrum.reciprocal_moments_escape`. Theorem.

Let K be a normed field, d>0, γ: Fin d → K injective, 0<‖γ_i‖<1 for every i, and c_i≠0 for every i. For every N≥0 there exists n≥max(N,1) with ‖Σ_i c_i (γ_i⁻¹)^n‖>1. For a p-adic field this says that some positive negative-power sum is outside its valuation ring, and that this happens at arbitrarily large exponents.

Hypotheses: The source assumes integral coefficients; the explicit argument here proves the stronger statement for arbitrary nonzero coefficients. The index type is nonempty. No completeness assumption is needed..

Proof/construction plan:

1. If all terms in some tail had norm at most one, apply distinct-spectrum-bound with β_i=γ_i⁻¹, C=R=1 and threshold max(N,1). Inversion is injective on nonzero elements.
2. It follows that ‖γ_i⁻¹‖≤1 for every i, contradicting 0<‖γ_i‖<1. Pick any index using d>0.
3. For the source application use the equivalence between membership in the p-adic valuation ring and norm at most one. This node exports the norm statement and does not construct another valuation ring.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/distinct-spectrum-bound`.

Sources: `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

Acceptance checks:

* For γ=1/3 in the 3-adic norm this hypothesis fails; use γ=3 instead.
* For γ=(p,−p) and c=(1,1), the first moment is zero but an even negative moment eventually leaves the unit ball, including p=2.
* An empty family would contradict the stated existence and is explicitly excluded.

### The convergent rational generating expression

Identifier: `WeilConjectures:WC.5:power-sum-converse/power-sum-generating-series`. Proposed declaration: `TauCeti.FiniteSpectrum.hasSum_power_sum_generating`. Theorem.

Let K be a normed field, β,c: Fin d → K and z in K with ‖β_i z‖<1 for every i. Then Σ_{n≥0} (Σ_i c_i β_i^(n+1)) z^(n+1) converges with sum Σ_i c_i β_i z/(1−β_i z). This is an equality with a specified sum, not a convention for a divergent infinite sum.

Hypotheses: This expression starts at exponent one. Zero roots and repeated roots are allowed. The geometric-series theorem used here does not require K to be complete..

Proof/construction plan:

1. For each i use the existing geometric series at ξ=β_i z and multiply by c_i β_i z. Its n-th term is c_i β_i^(n+1) z^(n+1).
2. View the additive group of K as the commutative topological monoid Multiplicative K. Its multiplication is addition in K and is continuous. Apply the pinned hasProd_prod theorem to the finite family of convergent series in this wrapper, then translate back: this is the finite-sum rule also generated under the name hasSum_sum. Distribute the finite sums and multiplication by z^(n+1). Each denominator is nonzero because ‖β_i z‖<1.

Prerequisites: `mathlib:hasSum_geometric_of_norm_lt_one`, `mathlib:hasProd_prod`.

Sources: `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.

Acceptance checks:

* At z=0 both sides are zero.
* For one root β the value is cβz/(1−βz), not c/(1−βz).
* Repeated roots add their weights in the rational expression.

### A common polynomial denominator for the generating function

Identifier: `WeilConjectures:WC.5:power-sum-converse/generating-numerator-denominator`. Proposed declaration: `TauCeti.FiniteSpectrum.generating_common_denominator`. Lemma.

For a field K and β,c: Fin d → K put D(T)=∏_i(1−β_i T) and N(T)=Σ_i c_i β_i T ∏_{j≠i}(1−β_j T). Then D(0)=1. Whenever all 1−β_i z are nonzero, N(z)/D(z)=Σ_i c_i β_i z/(1−β_i z). Thus N/D in the existing rational-function field is the rational expression of power-sum-generating-series wherever that series is evaluated.

Hypotheses: This is an algebraic identity over any field. D is nonzero since its value at zero is one. The empty product is one and the empty numerator is zero..

Proof/construction plan:

1. For each summand factor D=(1−β_i T)∏_{j≠i}(1−β_j T). The denominator conditions allow cancellation after evaluation.
2. Distribute the sum and divide by the same nonzero D(z). Evaluation at zero gives D(0)=1 directly.

Prerequisites: .

Sources: `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.

Acceptance checks:

* For β=(b,b), N=2cbT(1−bT) when both weights are c; reduction cancels one repeated denominator factor in characteristic zero.
* For d=0, N/D=0/1.
* The numerator has constant term zero.

### The formal power-sum numerator identity

Identifier: `WeilConjectures:WC.5:power-sum-converse/formal-power-sum-product`. Proposed declaration: `TauCeti.FiniteSpectrum.formal_power_sum_product`. Theorem.

Let K be a commutative ring, β,c: Fin d → K, D(T)=∏_i(1−β_i T), and N(T)=Σ_i c_i β_i T ∏_{j≠i}(1−β_j T). Let G be the existing PowerSeries.mk with coefficient zero at index zero and coefficient Σ_i c_i β_i^n at every n>0. Then (D:PowerSeries K) G=(N:PowerSeries K).

Hypotheses: No field, norm, convergence, distinctness, nonzero-root or characteristic-zero assumption. In particular the equality holds over rings with zero divisors. D and N are local polynomial expressions, not newly defined carriers..

Proof/construction plan:

1. Apply PowerSeries.rescale β_i to mk_one_mul_one_sub_eq_one. Its ring-homomorphism laws, rescale_mk and rescale_X give H_i(1−C(β_i)X)=1, where H_i=mk(n↦β_i^n). No geometric-series object is reconstructed.
2. Put G_i=C(c_i β_i)X H_i. Coefficient extensionality, coeff_mk, coeff_C_mul and coeff_succ_mul_X show G=Σ_i G_i: degree zero is zero, and degree n+1 is Σ_i c_i β_i^(n+1). This explicitly removes the zeroth moment, including for zero roots.
3. For each i write D=(1−β_i T)D_i with D_i=∏_{j≠i}(1−β_j T). Map this finite product to PowerSeries via its existing ring inclusion. Commutativity and the preceding inverse identity give D G_i=C(c_i β_i)X D_i.
4. Distribute the finite sum and use that the polynomial inclusion preserves finite sums and products. Its result is exactly the image of N. For d=0 both sides are zero.

Prerequisites: `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.mk_one_mul_one_sub_eq_one`, `mathlib:PowerSeries.rescale`, `mathlib:PowerSeries.rescale_mk`, `mathlib:PowerSeries.rescale_X`, `mathlib:PowerSeries.coeff_succ_mul_X`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:Polynomial.coe_mul`.

Sources: `mathlib-formal-series-pin`, PowerSeries/WellKnown.lean: mk_one_mul_one_sub_eq_one; LaurentSeries.lean: RatFunc.coe_coe and algebraMap_apply_div: Existing formal geometric series and embeddings; the weighted finite-sum specialization and denominator clearing are the explicit argument supplied here.

Acceptance checks:

* For a single root b and weight c, (1−bT)G=cbT, including b=0.
* Two identical roots with weights 1 and −1 give G=N=0 although the unreduced denominator is (1−bT)^2.
* In characteristic two, two copies of the root one with unit weights give G=N=0; no logarithm or division by a positive index is used.

### The rational function has the prescribed formal expansion

Identifier: `WeilConjectures:WC.5:power-sum-converse/formal-rational-comparison`. Proposed declaration: `TauCeti.FiniteSpectrum.formal_power_sum_eq_ratFunc`. Theorem.

Let K be a field and β,c: Fin d → K. With D,N,G as in formal-power-sum-product, the image of G in the existing LaurentSeries K equals the image of N/D from the existing RatFunc K under its algebra map to LaurentSeries K. Thus this rational function has no negative coefficients at the origin, coefficient zero in degree zero, and coefficient Σ_i c_i β_i^n in every degree n>0.

Hypotheses: No characteristic-zero, norm, distinctness or convergence assumption. The comparison uses a common Laurent-series field: it does not assert a nonexistent direct inclusion of every RatFunc into PowerSeries..

Proof/construction plan:

1. By the existing common-denominator node, D(0)=1, hence D is not the zero polynomial. The injective Polynomial-to-PowerSeries and PowerSeries-to-HahnSeries maps show its Laurent image is nonzero.
2. Map formal-power-sum-product into LaurentSeries using the existing ring homomorphism and PowerSeries.coe_mul. This gives image(D)·image(G)=image(N). Divide by the nonzero image(D) in the Laurent series field.
3. RatFunc.coe_coe identifies both polynomial images through RatFunc with their images through PowerSeries; RatFunc.algebraMap_apply_div identifies the resulting quotient with the image of N/D.
4. Apply the existing PowerSeries.coeff_coe and coeff_mk to read off the coefficients. Negative coefficients vanish. The degree-zero coefficient is zero, not Σ_i c_i. All equalities are formal; evaluating at a point requires the separately stated convergence conditions.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/formal-power-sum-product`, `WeilConjectures:WC.5:power-sum-converse/generating-numerator-denominator`, `mathlib:Polynomial.coe_injective`, `mathlib:HahnSeries.ofPowerSeries_injective`, `mathlib:PowerSeries.coe_mul`, `mathlib:RatFunc.coe_coe`, `mathlib:RatFunc.algebraMap_apply_div`, `mathlib:PowerSeries.coeff_coe`, `mathlib:PowerSeries.coeff_mk`.

Sources: `mathlib-formal-series-pin`, PowerSeries/WellKnown.lean: mk_one_mul_one_sub_eq_one; LaurentSeries.lean: RatFunc.coe_coe and algebraMap_apply_div: Existing formal geometric series and embeddings; the weighted finite-sum specialization and denominator clearing are the explicit argument supplied here.

Acceptance checks:

* The empty spectrum maps 0 to the rational function 0/1.
* For b=2,c=3 the positive coefficients begin 6,12,24 while the constant coefficient is zero.
* A zero root and arbitrary weight contribute no positive coefficients and no denominator factor other than one.
* The comparison still holds in characteristic two with cancellation of two identical roots.

### The exact criterion for cancelling a reciprocal root

Identifier: `WeilConjectures:WC.5:power-sum-converse/pole-cancellation-criterion`. Proposed declaration: `TauCeti.FiniteSpectrum.generating_pole_cancellation_iff`. Lemma.

Let β: Fin d → K be injective over a field K and let β_k≠0. For the numerator N of generating-numerator-denominator, N(β_k⁻¹)=c_k ∏_{j≠k}(1−β_j/β_k). Consequently N(β_k⁻¹)=0 if and only if c_k=0. The denominator D has a simple zero there, so the reduced rational function has a pole there exactly when c_k≠0.

Hypotheses: Coincident roots must first be grouped; c_k then means their total weight. The zero root does not define a finite reciprocal pole..

Proof/construction plan:

1. Evaluate the numerator sum. Every i≠k summand includes the factor 1−β_k T and vanishes. The k-th summand has β_k T=1.
2. Each remaining factor is nonzero by injectivity of β and β_k≠0. A product in a field is zero exactly when a factor is zero, giving the criterion.
3. Factor D=(1−β_k T)∏_{j≠k}(1−β_j T). The second factor is nonzero at β_k⁻¹ and the first has degree one. This proves the simple-zero and no-cancellation interpretation algebraically.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/generating-numerator-denominator`.

Sources: `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.

Acceptance checks:

* For one root b≠0 the numerator at b⁻¹ equals c.
* Two weights 1 and −1 on the same root cancel after grouping; a claimed pole must disappear.
* A zero root contributes no positive moment or denominator zero.

### An all-power bound excludes poles in the convergence disc

Identifier: `WeilConjectures:WC.5:power-sum-converse/no-pole-in-bounded-disc`. Proposed declaration: `TauCeti.FiniteSpectrum.no_pole_of_power_sum_bound`. Theorem.

Let K be a normed field, β: Fin d → K injective, every c_i nonzero, C,R≥0 and N≥0. Suppose ‖Σ_i c_i β_i^n‖≤C R^n for n≥N. If R‖z‖<1, then every 1−β_i z is nonzero and the generating series in power-sum-generating-series has its stated rational sum at z. For R>0 this is the open disc of radius 1/R; for R=0 every visible root is zero and the expression is identically zero.

Hypotheses: This proof uses finite-spectrum algebra to establish the bound first; it does not use a pole assertion circularly to prove that same bound. Weights zero after grouping are removed before this denominator assertion..

Proof/construction plan:

1. Apply distinct-spectrum-bound to obtain ‖β_i‖≤R. Then ‖β_i z‖≤R‖z‖<1, proving all denominator conditions and allowing power-sum-generating-series.
2. Use generating-numerator-denominator to identify the sum with N(z)/D(z). The denominator is nonzero on the disc, excluding a rational pole. At R=0 every β_i=0 and each summand vanishes.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/distinct-spectrum-bound`, `WeilConjectures:WC.5:power-sum-converse/power-sum-generating-series`, `WeilConjectures:WC.5:power-sum-converse/generating-numerator-denominator`.

Sources: `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.

Acceptance checks:

* The disc is open; roots of norm R may give poles on its boundary.
* At R=0 the zero rational function is regular everywhere.
* Invisible zero-weight roots are removed; they do not constrain the disc.

### Reciprocal pairing turns the upper bound into equality

Identifier: `WeilConjectures:WC.5:power-sum-converse/reciprocal-pairing-forces-equality`. Proposed declaration: `TauCeti.FiniteSpectrum.norm_eq_of_reciprocal_pairing`. Theorem.

Let α: Fin d → ℂ, τ a permutation of Fin d, R>0, C≥0 and N≥0. Suppose α_i α_(τ(i))=R² for every i and ‖Σ_i α_i^n‖≤C R^n for every n≥N. Then ‖α_i‖=R for every i. Taking R=√q with q>0 yields the all-conjugates curve-RH numerical conclusion from an all-extension bound and a separately supplied reciprocal pairing.

Hypotheses: The pairing and power-sum bound are explicit inputs, not geometric purity hypotheses hidden in a structure. The theorem is instantiated separately in each complex embedding. It does not construct the curve or its cohomology..

Proof/construction plan:

1. Apply power-sum-converse over ℂ to bound both ‖α_i‖ and ‖α_(τ(i))‖ by R.
2. Taking norms in the pairing gives their product R². Since R>0, either strict upper inequality would force a product strictly below R². Thus equality holds for each i.
3. For q>0, R=√q is positive and R²=q. No assertion about all algebraic conjugates is inferred from checking only one embedding.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/power-sum-converse`.

Sources: `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

Acceptance checks:

* For α=(3+4i,3−4i) and R=5, conjugate pairing has product 25 and both moduli are 5.
* The pair (2,8) has product 16 but cannot satisfy a tail bound C·4^n with a fixed C.
* The empty family is a valid vacuous case.

### Little-o finite-spectrum lemma

Identifier: `WeilConjectures:WC.5:power-sum-converse/little-o-visible-root-vanishing`. Proposed declaration: `TauCeti.FiniteSpectrum.norm_lt_of_moments_little_o`. Theorem.

Let K be a normed field, β:Fin d→K injective, c:Fin d→K, R>0, and S_n=Σ_i c_i β_i^n. If ‖S_n‖/R^n→0 as n→∞, then every visible β_k with c_k≠0 satisfies ‖β_k‖<R. For repeated roots first group the full fibre weights; the same strict conclusion holds exactly for nonzero grouped weights. Neither completeness nor characteristic zero is needed for the weighted statement.

Proof/construction plan:

1. Use recover-consecutive-moments. Divide its norm bound by R^n; the j-th shifted moment is a fixed inverse-Vandermonde coefficient times R^j times ‖S_(n+j)‖/R^(n+j).
2. The finite sum tends to zero, so ‖c_k‖(‖β_k‖/R)^n tends to zero. If ‖β_k‖≥R, this is bounded below by the positive constant‖c_k‖, a contradiction.
3. Combine repeated roots before applying the argument. Vanishing grouped weights are invisible and yield no conclusion about those roots.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/recover-consecutive-moments`, `mathlib:norm_sum_le`.

Sources: `vdbe`, Lemma 4.1 proof, §4 pp.7–9: Worker’s inverse-Vandermonde proof of its numerical vanishing step; no geometric purity theorem enters.; `baseline-wc-interfaces`, Matrix.vandermonde: Reuse the existing moment recovery.

Acceptance checks:

* β=R,c=1 gives normalized moments1, so is not little-o.
* The two equal roots β=2R with weights1 and−1 have identically zero moments; visibility excludes them.
* For a single root0<R and nonzero coefficient the conclusion is strict.

Suggested Lean: signature. Actual NormedField, finite indexed sums and Filter.Tendsto of normalized norms.

### Polynomial approximation of graded moments

Identifier: `WeilConjectures:WC.5:power-sum-converse/graded-polynomial-approximation-lemma`. Proposed declaration: `TauCeti.FiniteSpectrum.graded_polynomial_approximation`. Theorem.

Let p>1 be real, r,s natural numbers, b_i finite nonnegative integers for0≤i≤r, α_(i,j)∈C with modulus p^(i/2), and P∈Q[T]. Suppose Σ_i(−1)^i Σ_j α_(i,j)^n−P(p^n)=o(p^(sn/2)) as n→∞. For every odd i≥s, b_i=0. For every even i=2j≥s with i≤r, all α_(i,k)=p^j and P_j=b_i. For every j with2j≥s and2j>r, P_j=0. If s≤r≤2s this includes the exact van den Bogaart–Edixhoven Lemma4.1 range; the high-cutoff conclusion stated here also handles s>r without claiming anything about low polynomial coefficients.

Proof/construction plan:

1. Expand P(p^n) as finitely many weighted exponentials with roots p^j. Combine equal α’s and these polynomial roots, then apply the strict little-o visible-root lemma with R=p^(s/2).
2. Different cohomological degrees have distinct moduli. In an odd degree≥s every grouped coefficient is the negative of a positive multiplicity and cannot cancel a polynomial root of an even weight; it must be absent.
3. In even degree≥s a root other than p^j has positive visible multiplicity and is impossible. At p^j the grouped coefficient is b_(2j)−P_j, hence zero; for degrees beyond r it is−P_j.
4. No eigenvalue semisimplicity is inferred; only roots and algebraic multiplicities occur.

Prerequisites: `WeilConjectures:WC.5:power-sum-converse/little-o-visible-root-vanishing`.

Sources: `vdbe`, Lemma 4.1, full statement and proof: The explicit numerical lemma supporting both the global theorem and BFP’s larger cutoff.; `bfp`, Proposition 3.1 proof p.6: Apply the cutoff s, correcting the printed d in the error term.

Acceptance checks:

* For p=4 and two even-degree roots4, the coefficient of T is2.
* A root−p in even degree2 is excluded by little-o(p^n), though its norm has the correct weight.
* A nontrivial Jordan block with sole eigenvaluep is not excluded by its trace moments.
* Coefficients strictly below s/2 may change without changing the hypothesis.

Suggested Lean: signature. Finite dependent families of complex roots, rational Polynomial and explicit normalized-limit condition.

## WC.5:surface-alternative

### Surface bound and the extension tower

Identifier: `WeilConjectures:WC.5:surface-alternative/surface-all-extension-bound-comparison`. Proposed declaration: `TauCeti.PointCounting.surface_all_extension_bound_comparison`. Theorem.

For a smooth projective geometrically connected genus-g curve C/k and every r≥1, import SF.5’s graph/diagonal Hodge-index theorem with q replaced by q^r. Compare its graph fixed-point count with the actual WC N_r to obtain |N_r−1−q^r|≤2g q^(r/2). The SF.5 contract fixes A={P}×C, B=C×{P}, Γ_r=(x,F_q^r x), A²=B²=0,A·B=1, Δ·A=Δ·B=1, Γ_r·A=1,Γ_r·B=q^r, Δ²=2−2g, Γ_r²=(2−2g)q^r and Δ·Γ_r=N_r. With D=Δ−A−B and E=Γ_r−q^rA−B, D²=−2g,E²=−2gq^r,D·E=N_r−1−q^r, and both are orthogonal to ample A+B. SF.5 owns the surface constructions, adjunction and Hodge-index/Cauchy inequality; WC owns the comparison with the extension tower.

Proof/construction plan:

1. Apply the exact SF.5 theorem over k_r or use its r-th Frobenius graph. Fixed intersections are transverse because the differential of the Frobenius power is0.
2. Use WC.0 to identify these fixed points with Hom(Spec k_r,C) and its finite cardinal, including nonprime q.
3. The supplied surface inequality(D·E)²≤D²E² gives the stated sharp2g bound; retain the g=0 zero-form case without division by g.

Prerequisites: `SchemeAndStackFoundations:SF.5`, `WeilConjectures:WC.0/finite-extension-point-tower-comparison`, `WeilConjectures:WC.0/closed-point-degree-comparison`.

Sources: `mustata-zeta`, Theorem3.6 full proof and Proposition3.9, p.22: Complete graph/adjunction/Hodge-index calculation read; the whole intersection proof remains owned by SF.5.

Acceptance checks:

* Genus0 gives equality N_r=1+q^r.
* Swapping the fibre convention swaps Γ·A and Γ·B; the displayed centered divisors must change too.
* A degree-two Frobenius power uses q², not q, in Γ² and the fibre intersection.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

### Curve RH from the surface bound

Identifier: `WeilConjectures:WC.5:surface-alternative/curve-rh-from-surface-bound`. Proposed declaration: `TauCeti.PointCounting.curve_rh_from_surface_bound`. Theorem.

For the same curve, take the normalized integral degree-2g numerator Π_C from WC.1 and its full reciprocal-root multiset in C. The surface bound for every r≥1 and the root-bound-free trace formula give |Σ_j α_j^r|≤2g q^(r/2). The independent finite-spectrum converse yields |α_j|≤√q for all j. The WC.2 purity-independent reciprocal pairing α↦q/α yields |α_j|=√q. Since the integral numerator includes every conjugate with multiplicity, this proves the all-conjugates curve RH statement and agrees with the exact WC.1 numerator and WC.2 functional equation. No DWP.1/DWP.4 or WC.3/WC.5 estimate is an ancestor of this branch.

Proof/construction plan:

1. Use the root-bound-free curve numerator/trace comparison to translate the supplied all-extension surface inequality into all-positive power-sum bounds.
2. Apply power-sum-converse with R=√q,C=2g,N=1; characteristic zero protects positive multiplicities when equal roots are grouped.
3. Use the actual WC.2 curve duality and the independent reciprocal-pairing equality theorem. Nonzero roots follow from Frobenius invertibility.
4. Apply the result to all roots of the integral numerator in a complex splitting field. Each algebraic conjugate is among these roots, so no single-embedding shortcut occurs.

Prerequisites: `WeilConjectures:WC.5:surface-alternative/surface-all-extension-bound-comparison`, `WeilConjectures:WC.1/curve-zeta-numerator-without-rh`, `WeilConjectures:WC.2/signed-zeta-functional-equation`, `WeilConjectures:WC.5:power-sum-converse/power-sum-converse`, `WeilConjectures:WC.5:power-sum-converse/reciprocal-pairing-forces-equality`.

Sources: `mustata-zeta`, Remark3.7, Lemma3.8 and Theorem3.6, pp.21–22: Independent numerical converse combined with the imported surface proof; source typos corrected.

Acceptance checks:

* Equal-modulus roots ±√q cancel odd moments but are recovered by even moments.
* A bound at r=1 alone cannot constrain every root; require all positive r.
* For genus0 the empty root family gives a vacuous RH assertion and the correct rational zeta.

Suggested Lean: omitted. The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions.

## Exact owner contracts and gaps

PR196 is public and its relevant owner documents were read at head 4bd72379658126cbe9be935656396f0c9dac4de0. The atlas index and reserved-ids do not currently contain their layer identifiers. The packet records exact contracts as gaps rather than fabricating prerequisite IDs or assigning point/cohomology ownership to SF.1. The DM Part II registration and private WC snapshot are likewise unavailable. These are material limits of closure, not missing target plans.

### Private WC snapshot audit

The issue names private F.008/F.009/F.010, B.000–B.015, PointCounting.lean, ZetaFunction.lean, Abstract/ and Statement.lean. The private CBirkbeck/WeilConjectures tree is unavailable to this worker. Reconcile its actual declarations, assumptions and statement interfaces against the public source-backed plan before calling WC.0 closed; no private code has been guessed.

Consumers: `WeilConjectures:WC.0/finite-extension-point-tower-comparison`, `WeilConjectures:WC.0/closed-point-degree-comparison`, `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`.

### PR196 point, orbit and twist interface registration

PR196 at head4bd72379658126cbe9be935656396f0c9dac4de0 owns FrobeniusGeometry Layers4–5: finite Hom over Spec k point sets, same-degree extension transport, arithmetic/geometric Frobenius conventions, closed-point/orbit equivalence and residue degree. TraceFormula Layers13,15 own the Euler/exponential zeta, decomposition/tower laws and effective finite-order twists. Register their stable atlas identifiers, then replace this gap by exact prerequisite links. For twists supply effective descent data (e.g. quasiprojective X), not universal effectiveness. DeligneI(1.1.1) also needs the global finite-type-over-Z norm-Euler/Dirichlet zeta and its convergence interface. The read PR196 TraceFormula Layer13 only supplies the finite-field series. Request this arithmetic extension from that same zeta owner, with actual Dirichlet/analytic carriers and a proved right half-plane of convergence; do not infer it from the finite-field construction.

Consumers: `WeilConjectures:WC.0/finite-extension-point-tower-comparison`, `WeilConjectures:WC.0/closed-point-degree-comparison`, `WeilConjectures:WC.1/zeta-function-euler-product-and-point-counts`, `WeilConjectures:WC.1/twisted-frobenius-point-comparison`, `WeilConjectures:WC.1/inverse-zeta-configuration-formula`.

### PR196 rational realization and trace interface registration

EllAdicRealization Layers4–10 own actual Q_ℓ cohomology, bounded finite dimensions, proper/compact support comparison, continuous Galois actions, Tate twists and rational scalar extensions. TraceFormula Layers8,14–15 own trace/determinant/rationality and curve/Jacobian endpoint/dimension comparisons. Register exact identifiers and supply these actual carriers/maps, not abstract spaces assuming Weil conclusions.

Consumers: `WeilConjectures:WC.0/geometric-frobenius-realization-comparison`, `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`, `WeilConjectures:WC.1/curve-zeta-numerator-without-rh`.

### PR196 supplied-family rational Artin comparison registration

EtaleBaseChange Layers7–9 own lisse finite-level higher direct images and path transport in a supplied smooth proper family with ℓ invertible. ComplexComparison Layers10–12 own Artin comparison and products/action compatibility; EllAdicRealization Layer10 passes to rational coefficients. Supply the actual specified finite-field and complex fibres and path, register their identifiers and prove identity/composition compatibility. No arbitrary characteristic-zero lifting theorem is requested.

Consumers: `WeilConjectures:WC.4/betti-comparison-in-a-supplied-family`.

### DM stack Part II carriers and trace/purity/comparison

The accepted BFP route7 requests EtaleDualityAndPerverseSheavesPartIIStacks ST.0–ST.6, not yet registered. Needed are actual finite-type DM point groupoids with finite isomorphism classes and automorphisms, weighted trace formula, proper-smooth stack/coarse rational cohomology comparison, all-conjugates Frobenius purity, equivariant perfect Poincaré duality, finite-group twists and local potential semistability. Supply the stated hypotheses of vdBE §3 and BFP §§3,9. This is an additional stack case, not an inference from scheme SF.2 or DWP.7.

Consumers: `WeilConjectures:WC.1/stack-count-comparison`, `WeilConjectures:WC.1/twisted-frobenius-point-comparison`, `WeilConjectures:WC.5/local-polynomial-count-cutoff`, `WeilConjectures:WC.5/approximate-counts-and-tate-semisimplification`, `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`, `WeilConjectures:WC.4/equivariant-polynomial-point-counts`, `WeilConjectures:WC.2/equivariant-polynomial-duality`.

### Kisin–Lehrer source collation and realization compatibility

The cited paper is Kisin–Lehrer, Equivariant Poincaré polynomials and counting points over finite fields, J.Algebra247(2002),435–451, DOI10.1006/jabr.2001.9029. The publisher abstract and citation were checked, but the full primary text was unavailable for collation. Reconcile Proposition1.2’s exact equivariant comparison hypotheses with the PR196 supplied-family contract. General count lifting in this packet uses the explicit integer irreducible-coordinate criterion already in the pinned virtual-character API, not an assumed general integrality theorem.

Consumers: `WeilConjectures:WC.1/equivariant-count-character-lattice`.

### Elliptic scheme/Point carrier comparison

The pinned WeierstrassCurve.pointCount_eq_card_point supplies the exact finite Point cardinal under nonsingularity. The actual projective Weierstrass scheme-to-Point bijection remains needed for the WC scheme-count compatibility. Import it from the elliptic geometry owner rather than constructing a second elliptic curve.

Consumers: `WeilConjectures:WC.5/curve-and-elliptic-bound-comparison`.

### Supplier `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`

A finite splitting extension L/Q_ℓ with the extended ℓ-adic norm restricting exactly to the given base norm and complete as a normed field; do not use a separately normalized valuation that rescales its restriction. Supply existence, isometric coefficient embedding, finite polynomial splitting and evaluation in the open unit disc.

Consumers: `WeilConjectures:WC.1/local-fatou-normalization`.

### Supplier `SchemeAndStackFoundations:SF.1`

The actual finite-type rational-point carrier/finiteness, finite étale residue extensions and component objects needed by the consuming point comparison; PR196 retains ownership of point/Frobenius/zeta constructions. For the stack-mass comparison supply actual quotient stacks[Y/G], their F_q-point torsor/action groupoids, equivalence with the action groupoid when H¹(F_q,G)=1, and finite locally closed stratification compatibility. This quotient construction is separate from the unregistered DM cohomology Part II. Also supply finite residue fields of closed points of finite-type Z-schemes and finiteness of closed points with bounded residue norm, for the arithmetic Euler-product comparison.

Consumers: `WeilConjectures:WC.1/stack-count-comparison`, `WeilConjectures:WC.1/inverse-zeta-configuration-formula`, `WeilConjectures:WC.1/zeta-function-euler-product-and-point-counts`.

### Supplier `ReductiveGroupsPartII:RG2.3`

Supply Lang’s theorem H¹(k,G)=1 for every smooth connected linear algebraic group over a finite field k, in the generality already routed to RG2.3 by PAPER-LIPNOWSKI-TSIMERMAN-18/lang-theorem. The WC quotient-mass comparison requires nonreductive connected groups as well. No Lang or torsor construction is replanned in WC.

Consumers: `WeilConjectures:WC.1/stack-count-comparison`.

### Supplier `EtaleDualityAndPerverseSheaves:EDC.2:pairings`

Actual finite-dimensional H^i for smooth proper pure-d schemes, perfect graded Frobenius-equivariant cup pairing H^i×H^(2d−i)→Q_ℓ(−d), graded symmetry and alternating middle pairing in odd d. Supply tensor, finite-group-action and component compatibility; stack cases use their separately recorded Part II.

Consumers: `WeilConjectures:WC.2/signed-zeta-functional-equation`, `WeilConjectures:WC.2/middle-degree-parity`, `WeilConjectures:WC.2/equivariant-polynomial-duality`, `WeilConjectures:WC.5/all-extension-point-count-bound`, `WeilConjectures:WC.5/components-and-dimension-zero`.

### Supplier `EtaleDualityAndPerverseSheaves:EDC.8`

Instantiate the actual perfect pairing to reciprocal determinant-polynomial identities, invertibility, Δ²=q^(dχ), middle alternating-dimension parity, and the exact middle determinant sign using generalized eigenspaces at ±q^(d/2); retain ℓ=2 characteristic-zero coefficients and no semisimplicity premise. Own the geometric duality theorem, not the WC signed zeta assembly.

Consumers: `WeilConjectures:WC.2/signed-zeta-functional-equation`, `WeilConjectures:WC.2/middle-degree-parity`, `WeilConjectures:WC.2/functional-equation-multiplier-descent`.

### Supplier `DeligneWeightsAndPurity:DWP.4`

The proved smooth-projective all-conjugates purity theorem for every reciprocal Frobenius root of actual rational ℓ-adic H^i, with algebraicity and weight i. Do not assume integral/ℓ-independent factors as a premise; WC.3 derives these from the common integral rational zeta. No purity dependency is added to the independent surface branch.

Consumers: `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`.

### Supplier `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

The existing independent elliptic Hasse theorem for a nonsingular Weierstrass curve over any finite field, with its integer pointCount/frobeniusTrace convention; use only compatibility, not a new elliptic proof or an arbitrary-genus inference.

Consumers: `WeilConjectures:WC.5/curve-and-elliptic-bound-comparison`.

### Supplier `EtaleDualityAndPerverseSheaves:EDC.4`

For smooth projective complete intersections, repeated ample weak Lefschetz with Frobenius-equivariant ambient Tate classes, middle primitive decomposition and same-multidegree complex Betti dimension comparison. Supply a genuine comparison family or the complete-intersection comparison contract; WC imports it, computes b=b′ (odd n) or b′−1 (even n), and proves the point-count corollary.

Consumers: `WeilConjectures:WC.5/complete-intersection-point-count`.

### Supplier `ArithmeticGaloisRepresentations:R01.5`

Density-one good-prime Frobenius characteristic-polynomial equality for continuous finite-dimensional characteristic-zero G_Q representations implies isomorphic semisimplifications after a common coefficient field, via Chebotarev density and Brauer–Nesbitt. Require the representations unramified at those good primes, include continuity and lattice/finite-quotient input; no splitting of extensions is inferred.

Consumers: `WeilConjectures:WC.5/approximate-counts-and-tate-semisimplification`.

### Supplier `PadicHodgeTheory:R06.2`

The local extension lemma of vdBE4.2: a potentially semistable continuous p-adic representation of G_Qp whose Jordan–Hölder constituents are trivial is unramified. Supply the finite-extension/descent hypotheses, filtered(φ,N) calculation Fil⁰=D, Fil¹=0,N=0, and unramified extension-class recognition. Crystalline good reduction is the stronger available scheme input; do not assume Frobenius semisimplicity.

Consumers: `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`.

### Supplier `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences`

Using the local/global different comparison and exact tame exponent at every finite prime, prove an everywhere-unramified finite extension L/Q has abs(discr L)=1, including norm/discriminant identification. Combine with the pinned NumberField.abs_discr_gt_two to get degree1. A continuous representation unramified at every finite prime then has trivial finite quotients; use its stable lattice and congruence quotients to conclude triviality.

Consumers: `WeilConjectures:WC.5/polynomial-counts-over-z-and-tate-cohomology`.

### Supplier `SchemeAndStackFoundations:SF.5`

Own the whole curve-surface theorem: construct Δ and Γ_(F_q^r) on C×C, the two fibre classes and ample A+B; prove graph fixed intersections are transverse and counted by actual extension points, adjunction gives Δ²=2−2g and Γ²=(2−2g)q^r, and the fibre intersections match the chosen orientation. Apply Hodge index to centered divisors D=Δ−A−B,E=Γ−q^rA−B; conclude (N_r−1−q^r)²≤4g²q^r, including g=0 without division. The algebraically closed fibre point P need not be k-rational. No DWP purity, RH or WC.5 root estimate is an input.

Consumers: `WeilConjectures:WC.5:surface-alternative/surface-all-extension-bound-comparison`.

## Source versions and corrections

Every locator is to the version recorded below. Full relevant proofs, not only theorem statements, were read. Short packet excerpts are literal locator aids; the proof plans are mathematical paraphrases. The relevant published BFP passages were collated against the downloaded arXiv version. The vdBE journal text was not available for collation; its version-specific hypotheses are recorded explicitly.

* **yu-2022-app-c** — Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe. arXiv:1807.04659v5, 18 July 2022; preprint, not collated with the journal version. [Source](https://arxiv.org/pdf/1807.04659v5).
  Appendix C, printed pp. 79–81: application context, unnumbered negative-power lemma and complete proof. Page 81 visually checked on 26 September 2026; the coefficient and root ring is the integral closure of Z_p in an algebraic closure of Q_p (overbars confirmed). No journal collation is claimed.
  The general normed-field Vandermonde proof in this packet is an explicit alternative argument by this worker, not a transcription of Yu’s elimination proof.
  Appendix C pp.79–81 full lemma/context re-read on 6 October 2026; downloaded v5 hash agrees with prior visually verified copy.

* **milne-lec** — J. S. Milne, Lectures on Étale Cohomology. Version 2.21, 22 March 2013, author’s course notes. [Source](https://www.jmilne.org/math/CourseNotes/LEC.pdf).
  §27, Lemma 27.5 and full proof, printed pp. 155–156, text and page images: trace power sums and their formal logarithmic identity. The weighted positive-exponent geometric expression is the workers’ separate derivation, not a formula quoted from Milne.
  No claim to have read the whole course or to derive its geometric trace formula in this packet.
  §27.5–27.15 full relevant proofs: trace/logarithm, field descent27.9, local Fatou27.10, global integrality27.11, functional equation27.12–13 and summary27.14. Printed pp.158–159 checked as images on 6 October 2026. Author LEC errata section checked the same day.

* **mathlib-vandermonde-pin** — Anne Baanen, Peter Nelson, Lu-Ming Zhang and Mathlib contributors, Vandermonde matrices and nonsingular inverses. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174).
  Mathlib/LinearAlgebra/Vandermonde.lean: definition, determinant criterion and finite moment uniqueness.
  Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean: inverse definition and mul_nonsing_inv.

* **mathlib-formal-series-pin** — Mathlib contributors, Existing formal, Laurent and rational-function series interfaces. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174).
  PowerSeries/Basic.lean: coefficient constructor, extensionality, coefficient shift, rescale and polynomial inclusion.
  PowerSeries/WellKnown.lean: mk_one_mul_one_sub_eq_one and its proof.
  HahnSeries/PowerSeries.lean: ofPowerSeries and its injectivity.
  LaurentSeries.lean: the PowerSeries fraction-field instance, embeddings, coefficient comparison, RatFunc.coe_coe and RatFunc.algebraMap_apply_div.

* **deligne-i** — Pierre Deligne, La conjecture de Weil. I. Publications mathématiques de l’IHÉS 43 (1974), 273–307; Numdam scan. [Source](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf).
  SHA-256: `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`.
  §1.1–1.7 pp.273–277, including full descent proof (1.7)⇒(1.6); §1.15 p.279, complete trace/determinant conversion; §2.1–2.6 pp.280–282, full duality/reciprocity argument; §8.1 pp.301–302, complete complete-intersection application and its cohomological inputs.

* **bfp** — Jonas Bergström, Carel Faber, Sam Payne, Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves. arXiv:2206.07759v2, 17 October 2023; relevant passages collated with the published Annals version recorded separately. [Source](https://arxiv.org/pdf/2206.07759v2).
  SHA-256: `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758`.
  §1 Proposition1.3 and weighted groupoid counts; §3 Proposition3.1 statement/full proof and local/global polynomial-count context; §7 pp.10–13, full inverse-zeta and sieve arguments, Propositions7.1,7.4,7.5 and Remark7.6; §9.1–9.2 pp.21–22, twists, Definition9.1, Proposition9.3 full proof and Remark9.4. Moduli-specific counts and §4 spectral sequences are outside this packet.

* **bfp-published** — Jonas Bergström, Carel Faber, Sam Payne, Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves. Published Annals of Mathematics199(2024),1323–1365; author-hosted version of record. [Source](https://web.ma.utexas.edu/users/sampayne/pdf/PolynomialPointCounts.pdf).
  SHA-256: `9843c296d6f775472ca718be1520c2152d13f5a37dd6928e8e454c2b2d134bd3`.
  Proposition1.3 statement and cited stack-theory interfaces, printed pp.1324–1325; Proposition3.1 and proof, p.1330; §7 full sieve arguments, pp.1336–1339; §9.1–9.2 Definition9.1, Proposition9.3 full proof and Remark9.4, pp.1351–1352. The cutoff typo and generic representation-ring qualification persist in this version. The nonreduced-fibre generality of Proposition7.5 is included in the corrected sieve node.

* **vdbe** — Theo van den Bogaart, Bas Edixhoven, On the cohomology of moduli spaces of curves. arXiv:math/0505178v3, 1 November 2008; v1 (2005) also compared; journal text not collated. [Source](https://arxiv.org/pdf/math/0505178v3).
  SHA-256: `46559f0499ac0c96192bcee9ec11f1d4933bff2285c6d29e97e008f8a8442b3b`.
  §1 updated open-U generality; §2 Theorem2.1 and precise semisimplification/full-isomorphism distinction; §3 cohomology/comparison/purity inputs; §4 complete proof, finite-spectrum Lemma4.1 and full local extension Lemma4.2. §5 examples read only for context.

* **mustata-zeta** — Mircea Mustață, Zeta functions in algebraic geometry. Author-hosted notes; undated PDF as accessed, printed pp.21–22. [Source](https://public.websites.umich.edu/~mmustata/zeta_book.pdf).
  SHA-256: `d83d5617b180d490de60286ca61f07d349c2dadba6d0b61eac1af2f628253b45`.
  §3.3 Theorem3.6, Remarks3.7, Lemma3.8 and complete proof, Theorem3.6 complete graph/adjunction proof, Proposition3.9 complete Hodge-index reduction and Example3.10. Surface theorem is imported from SF.5, not redeveloped here.

* **pr196** — Tau Ceti Roadmap contributors, CohomologicalPointCounting roadmap family. TauCetiProject/TauCetiRoadmap PR196, head 4bd72379658126cbe9be935656396f0c9dac4de0, 6 October 2026. [Source](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196).
  FrobeniusGeometry Layers4–5 complete; EllAdicRealization Layers4–10 complete; TraceFormula Layers13–15 complete; EtaleBaseChange Layers7–9 complete; ComplexComparison Layers10–12 complete. These are mathematical suppliers, not baseline implementations. Their layer IDs are absent from the current atlas.

* **baseline-wc-interfaces** — Mathlib and Tau Ceti contributors, Existing finite-field, polynomial, category and arithmetic interfaces. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. [Source](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174).
  Actual statements and surrounding typeclass hypotheses read in Finite/Extension.lean, Finite/GaloisField.lean, ArithmeticFunction/Moebius.lean, Matrix/Charpoly/Coeff.lean, CategoryTheory/IsomorphismClasses.lean, Endomorphism.lean, SingleObj.lean, Discrete/Basic.lean, Polynomial/GaussLemma.lean, FieldTheory/Galois/Basic.lean, Polynomial/Roots.lean, IsPrimePow.lean and NumberField/Discriminant/Basic.lean; Tau Ceti EllipticCurve/PointCount.lean and RepresentationRing/Basic.lean.

* **kedlaya-rh** — Kiran S. Kedlaya and course note contributors, Two approaches to RH for curves. Weil cohomology in practice, online Lecture5 as accessed 6 October 2026; Math206A lecture14October2019. [Source](https://kskedlaya.org/weil-cohom/chapter-5.html).
  Definition5.1.3 and full Lemma5.1.4 numerical converse; §5.2 full surface proof. The source was an independent check only; the packet uses corrected Mustață and its own finite-spectrum proof. The Bombieri–Stepanov §5.1 argument is outside this job.

The following source issues are proposed findings for independent review. The BFP cutoff typo is an already confirmed imported finding. Each retains its locator, exact correction, reason and correction-search record in the packet. No source is silently “fixed.”

### WeilConjectures/E-WC0-1 (error)

Author course notes v2.21, Lemma 27.5, printed p. 155, final displayed formal logarithmic identity; proof p. 156.

Correction: For the logarithmic identity, require the coefficient field k to have characteristic zero (and the vector space to be finite-dimensional, already implicit in its determinant). The preceding trace/power-sum identity is valid in arbitrary characteristic. The geometric application uses Q_ℓ and is unaffected.

Reason: For k=F_p and φ the identity on a one-dimensional space, the m=p coefficient asks for 1/p in F_p, which does not exist; the ordinary formal logarithm is not defined there. The division-free identity (1−T)·Σ_{n≥1}T^n=T does remain valid and is the route used in this packet. This finding concerns the standalone lemma’s stated coefficient generality, not the rationality theorem over Q_ℓ.

Reach: a stated result. Known status: new

Correction search: Author’s current LEC.pdf: v2.21 dated 22 March 2013; pp. 155–156 inspected as images on 26 September 2026.; https://www.jmilne.org/math/CourseNotes/ — current LEC version listing checked on 26 September 2026.; https://www.jmilne.org/math/CourseNotes/errata.html — complete LEC v2.21 section read on 26 September 2026; no correction to Lemma 27.5’s coefficient characteristic is listed. The 1980 published book is a different text, not the subject of this finding.

### WeilConjectures/E-WC0-2 (misprint)

v2.21 Lemma27.10 proof, printed p.158

Correction: Replace the strict inequality by ≤1.

Reason: The normalized denominator1−T of f=1/(1−T) has coefficient−1 of norm1. The preceding elementary-symmetric ultrametric argument only gives ≤1; that suffices for the intended integrality conclusion.

Reach: the proof. Known status: new

Correction search: LEC.pdf v2.21 printed pp.158–159 checked as images, 6 October 2026.; https://www.jmilne.org/math/CourseNotes/errata.html LEC v2.21 section read 6 October 2026; neither correction is listed.

### WeilConjectures/E-WC0-3 (gap)

v2.21 Summary27.14(c) proof, printed p.159

Correction: Algebraic-integral roots alone give algebraic-integral coefficients, not rational coefficients. Add a Galois-stability/rational descent argument before integrally closed Gauss descent. The WC.3 generic theorem explicitly assumes all-conjugates degreewise weights, as in DeligneI1.7⇒1.6.

Reason: The coprime factors1−√2T and1+√2T have integral reciprocal roots and integral product1−2T², but their individual coefficients are irrational. This witnesses failure of the stated algebraic inference, not a counterexample to the geometric Weil theorem.

Reach: the proof. Known status: new

Correction search: LEC.pdf v2.21 printed pp.158–159 checked as images, 6 October 2026.; https://www.jmilne.org/math/CourseNotes/errata.html LEC v2.21 section read 6 October 2026; neither correction is listed.

### WeilConjectures/E-WC0-4 (misprint)

Published Annals199(2024), Proposition3.1 proof, printed p.1330 (also arXiv2206.07759v2 p.6)

Correction: Use o(p^(ms/2)) in the invocation of vdBE Lemma4.1.

Reason: The proposition assumes cutoff s≥d and its conclusion is in degrees≥s; the exponent d silently strengthens its hypothesis. The generalized graded-moment lemma uses exactly s.

Reach: the proof. Known status: Already confirmed as PAPER-BERGSTROM-FABER-PAYNE-24/E2; imported finding, not a newly claimed erratum.

Correction search: research/blueprint/papers/PAPER-BERGSTROM-FABER-PAYNE-24.result.json sourceIssues and independent review read.; Author-hosted version of record Proposition3.1 full proof collated, 6 October 2026; the same d-for-s typo persists.

### WeilConjectures/E-WC0-5 (misprint)

Author-hosted zeta_book.pdf printed p.21, equation3.10 and Lemma3.8 statement/proof; SHA recorded

Correction: In Lemma3.8 use q^(1/2) for g^(1/2) and2g q^(m/2) for2g^(m/2). Equation3.10 needs a minus before the sum of numerator-factor logarithms.

Reason: The stated root criterion and following triangle estimate use q, as confirmed by equations3.8,3.9,3.11–3.12. For genus0 the correct condition is vacuous; for genus1,q=4, a root of norm2 violates the printed norm≤1 while obeying the intended bound. log Z=Σ positive count terms follows from minus the numerator logarithms. Printed page inspected as an image.

Reach: a stated result. Known status: new

Correction search: Author notes PDF p.21 inspected as an image, 6 October 2026.; https://websites.umich.edu/~mmustata/ notes listing and targeted author-site errata search checked 6 October 2026; no corresponding erratum found.

### WeilConjectures/E-WC0-6 (misprint)

Online Lecture5 Definition5.1.3 and Lemma5.1.4 proof

Correction: The α_i are reciprocal roots. Pole exclusion gives |α_i|≤q^(1/2), reciprocal pairing is α↦q/α, and equality is q^(1/2). With indices1..2g the partner index is2g+1−i after a compatible reordering, not2g−i; the logarithmic sum begins N=1, not0.

Reason: A pole of(1−α_i^dT)⁻¹ has modulus|α_i|^(−d), so no poles in |T|<q^(−d/2) implies the upper bound q^(1/2). Positive multiplicities prevent cancellation. The definition and root-radius convention otherwise disagree; the N=0 term divides by0.

Reach: the proof. Known status: new

Correction search: https://kskedlaya.org/weil-cohom/chapter-5.html accessed 6 October 2026; displayed statements and proof read.; https://kskedlaya.org/math206a-fall19/ course notes listing and targeted author-site errata search checked; no separate correction found.

### WeilConjectures/E-WC0-7 (misprint)

Online Lecture5 §5.2, final matrix and determinant

Correction: The preceding quadratic is2gq a²+2(q+1−N)ab+2g b². Its matrix is[[2gq,q+1−N],[q+1−N,2g]], independent of a,b; nonnegative determinant gives4g²q−(q+1−N)²≥0.

Reason: Expand the source’s immediately preceding inequality. The printed matrix coefficients depend on the test variables and do not represent that quadratic; its determinant bound would fail the genus0 exact count.

Reach: the proof. Known status: new

Correction search: https://kskedlaya.org/weil-cohom/chapter-5.html accessed 6 October 2026; displayed statements and proof read.; https://kskedlaya.org/math206a-fall19/ course notes listing and targeted author-site errata search checked; no separate correction found.

### WeilConjectures/E-WC0-8 (error)

Online Lecture5 Lemma5.2.3(2) and subsequent fibre calculations

Correction: Use normalized degree-one fibre classes over the algebraic closure. For pullbacks of hyperplane sections of degree e, divide the inequality’s right side by e² and replace subsequent intersections1,q by e,eq. Equality concerns numerical equivalence in Néron–Severi⊗R, not equality of divisors.

Reason: Hyperplane pullbacks have class eA,eB. Substitution in the degree-one fibre inequality gives precisely the e² correction. A nonzero principal divisor has numerical class0 and equality, without being a literal linear combination of the two specified effective divisors. SF.5’s requested contract instead uses actual degree-one fibres and only the inequality.

Reach: a stated result. Known status: new

Correction search: https://kskedlaya.org/weil-cohom/chapter-5.html accessed 6 October 2026; displayed statements and proof read.; https://kskedlaya.org/math206a-fall19/ course notes listing and targeted author-site errata search checked; no separate correction found.

### WeilConjectures/E-WC0-9 (misprint)

Online Lecture5 Theorem5.1.5 dimension bound and choice of l

Correction: With m=√q+2g and p^μ=√q the Riemann–Roch lower bound uses l+1−g, not l+g−1. Expanding the dimension comparison gives g+g/(g+1)√q<l<√q.

Reason: The printed lower bound exceeds its upper bound for every q>1, so no such l exists. With the corrected dimension expression (l+1−g)(m+1−g)−(l√q+m+1−g), positivity is l(g+1)−g(√q+g+1)>0. This proof is outside the packet’s mathematical targets and is not used.

Reach: the proof. Known status: new

Correction search: https://kskedlaya.org/weil-cohom/chapter-5.html accessed 6 October 2026; displayed statements and proof read.; https://kskedlaya.org/math206a-fall19/ course notes listing and targeted author-site errata search checked; no separate correction found.

### WeilConjectures/E-WC0-10 (gap)

Published Annals199(2024), Definition9.1, printed p.1351 (also arXiv2206.07759v2 p.22)

Correction: A general class function gives an element of R_C(G)⊗_Z C, not necessarily R_C(G). To lift integrally require integer irreducible-character coordinates. In Proposition9.3 these are supplied by actual Betti representation multiplicities; that conclusion is unchanged.

Reason: Take the smooth proper finite étale variety Spec F_(q³), with deck groupC₃ generated by q-Frobenius g. For σ=1,g,g², σF fixes0,0,3 geometric points, respectively. With ζ₃ primitive, the irreducible-character coordinates are1,ζ₃,ζ₃², so no integral virtual-character lift exists. This is an explicit counterexample to the generic inference from a class function, while the scalar counts remain integers.

Reach: a stated result. Known status: new

Correction search: Published Definition9.1 and full Proposition9.3 proof collated against arXivv2, 6 October 2026; no generic integrality qualification is added.; The accepted extraction sourceIssues contains no finding about Definition9.1.; Author-hosted published copy and author/publication search checked; publication collation result is recorded in sources. No separate corresponding erratum found.

## Suggested file and verification

Mathlib is pinned at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti at f790474821cf4256814db967cb154e7af3d0c369. The baseline declarations were read from those pinned source trees; the inherited finite-spectrum statements were reread. The shared build has the exact Mathlib pin and a different Tau Ceti checkout. This suggested file imports only Mathlib, so its elaboration verifies the exact Mathlib baseline and makes no claim to have elaborated Tau Ceti imports at the requested Tau Ceti pin.

The file contains all sixteen independent finite-spectrum declarations and the three definition bodies with all fifteen API signatures and thirteen new unit-test statements. Its remaining typed cores are integer Möbius inversion, rational-series descent, local Fatou normalization, graded functional-equation assembly and parity/sign/base-extension identities, finite Galois factor extraction, the complex all-extension triangle bound and exact finite-spectrum recurrence/Newton identities. These restricted cores are labelled as such: none is presented as a compiled geometric application.

The remaining twenty-five geometric comparison/application declarations are deliberately omitted because their actual supplier carriers/maps are missing at the baseline: the three WC.0 comparisons; WC.1 zeta/trace/integral-presentation/stack/twist/inverse-zeta/termination/sieve/virtual-character/curve comparisons; WC.2 equivariant polynomial duality; WC.3 projective factors; WC.4 supplied-family comparison and equivariant polynomial count; WC.5 components, curve/elliptic compatibility, complete intersections, local cutoff, approximate-count semisimplification and full Tate theorem; and both surface-child comparisons. Their full mathematical statements, prerequisites, hypotheses and missing contracts appear above. A theorem accepting a proposition named “trace formula” or “Weil realization” would conceal these missing carriers and is not used.

The inherited twenty numerical acceptance examples are preserved. New tests use actual Empty, Discrete(Fin 3), SingleObj(Multiplicative(ZMod 2)), Bool permutations, rational polynomials and the existing prime-power predicate. Groupoid tests expose their genuine finite-class/finite-automorphism data, and configuration tests expose finite stable-configuration data. Their admitted proofs are not executable unit tests; concrete independent arithmetic regression checks supplement these type checks and are summarized in the handoff.

The indexed blueprint checker, the suggested-file elaborator through lean-check, and the cross-file/dependency/acceptance audit passed. Exact results, counts and remaining limitations are in the handoff. No private repository or library build is created.
