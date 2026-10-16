# Deligne weights, purity and the Weil bounds

This roadmap builds Deligne's proofs of the Riemann hypothesis over finite fields and the theory of weights that grew out of them. The first endpoint is Weil I: for a smooth projective variety X₀ over 𝔽\_q, every eigenvalue of the geometric Frobenius on H^i(X, ℚ\_ℓ) is an algebraic number all of whose complex conjugates have absolute value q^{i/2}, and the characteristic polynomials of Frobenius have integer coefficients independent of ℓ (Weil I, Theorem 1.6). The later endpoints come from Weil II: purity of proper smooth varieties, integrality and p-adic constraints on Frobenius eigenvalues, mixedness of nearby cycles, weight filtrations and geometric semisimplicity of pure lisse sheaves, the weight spectral sequence of a normal crossings compactification, absolute hard Lefschetz, and the equidistribution of Frobenius with the function-field Sato–Tate theorem. These are different theorems at different stages of construction. Neither the trace formula alone nor an abstract "Weil cohomology" proves the bounds.

## Ownership and boundaries

The weight foundations are owned by EtaleDualityAndPerverseSheaves, layer EDC.7, which needs them for the decomposition theorem and sits below this roadmap in the upstream order. EDC.7 plans: Weil q-numbers and ι-weights; eigenvalue multisets, twists, tensor and dual spectra and reciprocal pairings of Frobenius modules; the Weil estimate for abelian varieties and for curves through the Jacobian; the Weil group, Weil sheaves, punctual purity and mixedness, totally real sheaves, rank-one normalisation and determinantal weights (Weil II §1.1–§1.3); generalised majoration and the local weight–monodromy theorem on a curve (§1.4–§1.8); specialisation of monodromy (§1.11); the abstract Hadamard–de la Vallée-Poussin theorem and the compact form (§2.1–§2.2); the positive Euler-product comparison of Weil I §3; sharp purity on curves and square improvement (Weil II §3.1–§3.2); Weil II's fundamental theorem 3.3.1 with its reduction to a tame relative curve; and the mixed and pure complexes with their stability under the six operations (§6.1–§6.2). This roadmap imports those declarations by their EDC.7 ids, listed under each layer below.

This roadmap keeps Weil I's own proof — the fundamental estimate (Theorem 3.2), rationality of the pencil local factors (Theorem 6.2), the dimension induction (§7) and Theorem 1.6 — so that the Riemann hypothesis for smooth projective varieties does not depend on Weil II. It keeps the nonarchimedean local bounds and abstract equidistribution of Weil II §1.10 and §2.1, the consequences of Weil II 3.3.1 in §3.3 (integral sheaves, Deligne's integrality theorem, cohomological bounds, Newton couples and triangles, proper smooth purity and its extension to Deligne–Mumford stacks), §3.4 (Ext¹ of lisse sheaves, weight decomposition and filtration, geometric semisimplicity and its potentially pure variants), (6.1.13), (6.2.5)(c)–(d), (6.2.7), the weight spectral sequence, absolute hard Lefschetz (§4.1, §4.3, (6.2.13)), Weil II §3.5 and the arithmetic exports.

Six statements that the plan cited from roadmaps outside the upstream order are planned here: rationality descent with Fatou's lemma and the weight separation of zeta factors (both from WeilConjectures, through the copies in PadicDifferentialEquationsAndRigidCohomology RD.7), Weil I Theorem 1.6 and the point-count bounds (from WeilConjectures WC.3 and WC.5), purity of smooth proper Deligne–Mumford stacks (from WeilConjectures WC.6) and Chebotarev density for finite covers of curves (from FunctionFieldArithmetic FA.5). Those roadmaps import them from here.

Other inputs come from their owners: étale coefficients, duality, cycle classes and weak Lefschetz from EtaleDualityAndPerverseSheaves EDC.0–EDC.4; Lefschetz pencils, nearby cycles, local monodromy and the late invariant-cycle theorems from LefschetzPencilsAndVanishingCycles; sites, compact support, base change, the trace formula and stacks from SchemeAndStackFoundations SF.0–SF.2; fundamental groups and the arithmetic–geometric exact sequence from InverseGaloisAndArithmeticFundamentalGroups IG.0–IG.1; the continuous Hochschild–Serre sequence from ArithmeticGaloisDuality R02.2; noetherian approximation from AdicCoefficientsAndComparisons L2; and from the Tau Ceti roadmaps RepresentationTheory (SchurWeyl, CompactGroups), ReductiveGroups, ModularCurves, AlgebraicCurves and EllipticCurves. The general p-adic weight–monodromy conjecture is not a target here; its proved case belongs to DeligneWeightsAndPurityPartII.

## Conventions

Write k₀ = 𝔽\_q with q = p^a > 1, ℓ ≠ p, X = X₀ ⊗ k̄₀ and q_x = q^{deg x} = N(x). Cohomology means geometric étale cohomology with the indicated ℓ-adic coefficients. Frobenius on cohomology is the **geometric Frobenius**: it acts on ℚ\_ℓ(1) by q⁻¹, so the twist (r) subtracts 2r from the weight. The q-power scheme endomorphism acts as the arithmetic Frobenius on geometric points and on Tate modules; its pullback on cohomology is the geometric Frobenius. The Weil group gives the geometric Frobenius degree +1. Weil I §6 writes arithmetic degrees; a geometric Frobenius of a degree-e point has arithmetic coordinate −e, and on the vanishing system of an odd-dimensional pencil fibre of dimension d its cup-product multiplier is q^{de}.

A fixed ι is a field embedding of the coefficient algebraic closure into ℂ; no continuity is assumed. Integer Weil purity includes algebraicity and every complex conjugate. Real ι-purity is a statement at one embedding and does not imply algebraicity. A pure zero object satisfies every purity predicate and has no weights. Purity never implies that an arithmetic Frobenius is semisimple. The transpose and the contragredient are distinguished: their spectra are α and α⁻¹.

Zeta functions are Z(X₀, t) = ∏\_x (1 − t^{deg x})⁻¹ ∈ 1 + tℤ[[t]], and the cohomological formula is Z(X₀, t) = ∏\_i det(1 − tF | H^i_c(X, ℚ\_ℓ))^{(−1)^{i+1}} (Weil I (1.5.4)). For a curve the Chebotarev statement uses arithmetic Frobenius classes; the geometric Frobenius class is the inverse.

## The layers and the proof order

| Layer | Purpose | Kept here | Imported from EDC.7 |
| --- | --- | --- | --- |
| DWP.0 | Frobenius-module weights and zeta factors | Weight separation, weight decomposition, rationality descent and Fatou, pure factors of a zeta function | Weil numbers, ι-weights, spectra, twists, pairings |
| DWP.1 | Initial Weil estimate | Abelian point counts, Hasse compatibility, base extension | Curve and abelian Weil estimates, Rosati lemmas, curve weights |
| DWP.2 | Weil I's fundamental estimate | Theorem 3.2 with its inputs and Corollaries 3.8–3.9 | Positive Euler-product comparison |
| DWP.3 | Pencil local factors | Weil I §6 and the curve Chebotarev theorem | — |
| DWP.4 | Dimension induction | Weil I §7, Lemma 1.7 and Theorem 1.6 | — |
| DWP.5 | Local and analytic preparation | Newton polygons, nonarchimedean boundary bounds, abstract equidistribution | Weil sheaves, purity, determinantal weights, local weights, majoration, compact form |
| DWP.6 | Curves | Compact-support bounds on curves | Sharp curve purity, square improvement |
| DWP.7 | Consequences of the fundamental theorem | Integrality, cohomological bounds, Newton triangles, proper and stack purity | Weil II 3.3.1 and its reduction |
| DWP.8 | Mixed complexes and semisimplicity | Nearby cycles, (6.2.5cd), (6.2.7), Ext¹, weight filtration, semisimplicity, weight spectral sequence | Mixed and pure complexes, six-operation bounds |
| DWP.9 | Absolute hard Lefschetz | All thirteen targets | Primitive decomposition (abstract form) |
| DWP.10 | Arithmetic interfaces | Exports, point-count bounds, equidistribution, Sato–Tate, acceptance suite | — |

The proof order follows the declaration graph rather than the labels. Weil I's route runs DWP.2 → DWP.3 → DWP.4 and uses only the curve estimates and positivity lemmas from EDC.7, never Weil II. Weil II's route runs through EDC.7's fundamental theorem to DWP.7 and DWP.8, then DWP.9; Weil II §3.5 (at DWP.10, proposed sublayer DWP.8:equidistribution) uses DWP.5's abstract equidistribution, EDC.7's compact form and DWP.7's bounds. DWP.4 uses all three pencil cases (no vanishing cycles, zero radical quotient, nonzero quotient), retains the radical E ∩ E^⊥ and uses Leray only through subquotients. For the exceptional set of Weil I §6 the curve Chebotarev theorem (DWP.3) is applied to the finite quotients of the ℓ-adic image, and Haar nullity is proved in every arithmetic degree fibre.

## Layer specifications

Every item states the mathematical declaration, its hypotheses, its proof or construction, its acceptance checks, its direct inputs and its sources. API names are suggested library names. A planet is a visible landmark of its layer; its choice does not assert an implementation. Items marked as coming from an accepted part keep their declaration ids; where this plan corrects them, the corrected text and inputs are shown.

<a id="dwp-0"></a>

## DWP.0 — Eigenvalue weights and functorial linear algebra

Keeps weight separation and the weight decomposition of a Frobenius module; Weil numbers, ι-weights and the eigenvalue linear algebra are imported from EDC.7 (listed below). Adds the two zeta-factor statements moved down from WeilConjectures through RD.7.

Imported from EtaleDualityAndPerverseSheaves EDC.7 (owner since the accepted transfer of 2026-10-14):

- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number` — Weil q-numbers of integer weight (formerly `DWP.0/weil-q-number`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic` — Products, inverses, conjugation and integrality of Weil q-numbers (formerly `DWP.0/weil-number-arithmetic`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-base-extension` — Weil numbers under powers: change of q to q^r (formerly `DWP.0/weil-number-base-extension`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-weight` — ι-weights of nonzero elements of a coefficient field (formerly `DWP.0/iota-weight`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-embeddings-into-the-complex-numbers` — Embeddings into ℂ extending a given embedding, and isomorphisms ℚ̄\_ℓ ≅ ℂ (formerly `DWP.0/embeddings-into-the-complex-numbers`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-iff-iota-pure-for-every-iota` — Algebraicity and Weil purity from ι-purity at every ι (formerly `DWP.0/weil-number-iff-iota-pure-for-every-iota`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights` — Eigenvalues, Weil purity and ι-weights of an invertible endomorphism (formerly `DWP.0/endomorphism-weights`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights` — Eigenvalues, Weil purity and ι-weights of an invertible endomorphism (formerly `DWP.0/characteristic-polynomial-in-short-exact-sequences`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-under-subquotients-and-extensions` — Purity and weights under subobjects, quotients, extensions and direct sums (formerly `DWP.0/purity-under-subquotients-and-extensions`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-characteristic-power-series-and-traces` — The characteristic power series det(1 − tF) and traces of powers (formerly `DWP.0/characteristic-power-series-and-traces`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-polynomials-in-an-endomorphism` — Eigenvalues of P(F), F^r and F⁻¹, with multiplicities (formerly `DWP.0/spectra-of-polynomials-in-an-endomorphism`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights` — Weights under a finite extension of the finite base field (formerly `DWP.0/finite-field-base-extension-of-weights`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals` — Eigenvalues of tensor products, contragredients and Hom spaces (formerly `DWP.0/spectra-of-tensor-products-and-duals`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-eigenvalues-of-exterior-powers` — Eigenvalues of exterior powers (formerly `DWP.0/eigenvalues-of-exterior-powers`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-twisting-by-rank-one-characters` — Twists V^{(b)} and Tate twists V(r) (formerly `DWP.0/twisting-by-rank-one-characters`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-reciprocal-pairing-of-eigenvalues` — Eigenvalues under a Frobenius-equivariant perfect pairing (formerly `DWP.0/reciprocal-pairing-of-eigenvalues`).

<a id="dwp-0-disjoint-spectra-no-intertwiner"></a>

### Disjoint spectra: no nonzero Frobenius-equivariant maps between different weights

Let F and G be endomorphisms of finite-dimensional E-spaces V and W whose characteristic polynomials have no common root in Ē, equivalently are coprime in E\[T]. Then every E-linear u : V → W with u ∘ F = G ∘ u is zero. In particular: (i) if V is pure of weight n and W pure of weight m ≠ n, relative to q > 1, or ι-pure of weights β ≠ γ, then there is no nonzero equivariant map V → W; (ii) if W ⊆ V is F-stable, with W pure of weight n and V/W pure of weight m ≠ n, then W has a unique F-stable complement.

q > 1 is needed for the weights to separate eigenvalues (EDC.7/weight-weil-q-number).

Equal weights allow non-split extensions (the Jordan block) and nonzero maps.

Atlas landmark: **Weight separation**.

Proof or construction:

1. Coprimality: two polynomials with no common root in Ē are coprime (mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed). Write aP_F + bP_G = 1.
2. Cayley–Hamilton: P_F(F) = 0 (mathlib:LinearMap.aeval_self_charpoly). From uF = Gu we get 0 = uP_F(F) = P_F(G)u. Since a(G)P_F(G) = 1 − b(G)P_G(G) = 1, P_F(G) is invertible, and u = 0. No extension of scalars is needed.
3. Different weights give disjoint eigenvalue sets, by uniqueness of the weight (EDC.7/weight-weil-q-number, q > 1) or of the ι-weight.
4. (ii): with P_n and P_m the characteristic polynomials of W and V/W, V = ker P_n(F) ⊕ ker P_m(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime and Cayley–Hamilton). ker P_n(F) contains W and has the same dimension, so ker P_m(F) is an F-stable complement. It is unique, because an F-stable complement is isomorphic to V/W, hence annihilated by P_m(F).

Acceptance checks:

- V = (E, 1) and W = (E, q): every equivariant map V → W is zero.
- Jordan block: W = E e₁ and V/W both have weight 2, and there is no F-stable complement.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-weight`, `mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, preuve de (1.7) ⇒ (1.6), p. 277. Factors of different weights are coprime.

Declaration id: `DeligneWeightsAndPurity:DWP.0/disjoint-spectra-no-intertwiner`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-0-weight-decomposition"></a>

### Decomposition of a Frobenius module by weights

Let F be an invertible endomorphism of a finite-dimensional E-space V, and q > 1. (i) If every eigenvalue of F is a Weil q-number, then V = ⊕\_n V_n, a finite sum over n ∈ ℤ. Here V_n = ker P_n(F), and P_n ∈ E\[T] is the monic polynomial whose roots are the eigenvalues of weight n, with their multiplicities. Each V_n is F-stable and pure of weight n, and det(T − F) = ∏ P_n. (ii) For ι : Ē → ℂ the same holds over Ē with real weights: V ⊗ Ē = ⊕\_β (V ⊗ Ē)\_β. (iii) The decompositions are functorial: an equivariant map V → W maps V_n into W_n.

(i) holds over E itself. P_n has coefficients in E because Aut(Ē/E) permutes the eigenvalues, preserving multiplicities and Weil weights, and E is perfect.

(ii) does not descend to E in general, because the ι-weight is not Galois-invariant. Take E = ℚ and F with characteristic polynomial T² − 2T − 1 (eigenvalues 1 ± √2). For every ι it has the two distinct ι-weights ±2 log₂(1 + √2) relative to 2, but no F-stable line over ℚ.

Each V_n need not be semisimple.

Separating the factors of a zeta function, with their integrality and ℓ-independence, is DWP.0/weight-separated-factor-extraction, applied to smooth projective varieties in DWP.4/integral-cohomological-factors. This node decomposes one Frobenius module.

Atlas landmark: **Weight decomposition**.

Proof or construction:

1. Group the eigenvalues by weight, which is unique for q > 1, and set P_n = ∏\_{w(α) = n} (T − α)^{m_α}.
2. P_n ∈ E\[T]: it is invariant under Aut(Ē/E) (node endomorphism-weights), and in characteristic 0 the fixed field of Aut(Ē/E) is E.
3. The P_n are pairwise coprime (theorem disjoint-spectra-no-intertwiner, first step), so V = ⊕ ker P_n(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime with Cayley–Hamilton, mathlib:LinearMap.aeval_self_charpoly).
4. The characteristic polynomial of F on V_n is P_n: V_n ⊗ Ē is the sum of the generalized eigenspaces at the roots of P_n, whose dimensions are the multiplicities (mathlib:LinearMap.finrank_maxGenEigenspace_eq).
5. Functoriality: the theorem disjoint-spectra-no-intertwiner applied to the components V_n → W_m with n ≠ m.

Acceptance checks:

- F = diag(1, q) ⊕ \[\[q, 1], \[0, q]] on E⁴: V₀ = E e₁, and V₂ has dimension 3.
- Descent fails for ι-weights: T² − 2T − 1 over ℚ, as in the hypotheses.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights`, [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, preuve de (1.7) ⇒ (1.6), p. 277. The eigenvalues of a given weight form a Galois-stable set, so their polynomial has coefficients in the base field.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weight-decomposition`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-0-rational-zeta-descent-and-fatou"></a>

### Rational power series descend to ℚ and have integral normalised numerator and denominator (Fatou)

(a) Descent of rationality. Let k ⊂ L be fields and f ∈ k\[\[t]]. If there are A, B ∈ L\[t] with B(0) ≠ 0 and Bf = A in L\[\[t]], then there are such A, B in k\[t]; that is, k\[\[t]] ∩ L(t) = k(t) inside L((t)). (b) Local Fatou. Let ℓ be a prime (ℓ = p allowed), f ∈ 1 + tℤ\_ℓ\[\[t]], and G, H ∈ ℚ\_ℓ\[t] coprime with G(0) = H(0) = 1 and Hf = G. Then G, H ∈ ℤ\_ℓ\[t]. (c) Global Fatou. If f ∈ 1 + tℤ\[\[t]] lies in ℚ(t), there are unique coprime A, B ∈ 1 + tℤ\[t] with f = A/B; the reciprocal roots of A and of B are algebraic integers. The equality is in ℚ\[\[t]], and A, B do not depend on any auxiliary field in which f was first shown to be rational.

(a): any field extension k ⊂ L.

(b): f has ℓ-adically integral coefficients and constant term 1; G, H coprime with constant term 1.

(c): f has integer coefficients and constant term 1.

Uses:

- [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization): (a) puts the fibre zeta functions Z(X_x, t), integral and rational over ℚ\_ℓ by the cohomological formula, into ℚ(t).
- [DWP.0/weight-separated-factor-extraction](#dwp-0-weight-separated-factor-extraction): (c) gives the reduced integral presentation A/B that the pure factors are read off from.

Proof or construction:

1. (a) Bf = A with deg A ≤ N and deg B ≤ M is a system of linear equations over k in the coefficients of A and B; equivalently the Hankel determinants of order > M of the coefficient sequence of f beyond degree N vanish. A linear system with coefficients in k that has a nonzero solution over L has one over k, and B(0) ≠ 0 can be arranged after cancelling a power of t (Deligne, Weil I, proof of (1.7) ⇒ (1.6), p. 276; Milne, Lemma 27.9).
2. (b) Work in a finite extension of ℚ\_ℓ splitting H, with the extended absolute value. If a reciprocal root α of H had |α| > 1, then α⁻¹ lies in the open unit disc, where f converges because its coefficients have absolute value at most 1; evaluating Hf = G at α⁻¹ gives G(α⁻¹) = 0, contradicting coprimality. So the reciprocal roots of H have absolute value at most 1; since 1/f ∈ 1 + tℤ\_ℓ\[\[t]] and (1/f)G = H, the same holds for G. Elementary symmetric functions of elements of absolute value at most 1 have absolute value at most 1 (Milne, Lemma 27.10, with the non-strict inequality at the boundary).
3. (c) Write f = A/B in lowest terms over ℚ with A(0) = B(0) = 1, which is possible because f(0) = 1 and B(0) ≠ 0 after (a). Apply (b) at every prime ℓ to get A, B ∈ ℤ\_ℓ\[t] for all ℓ, hence A, B ∈ ℤ\[t]. The reciprocal roots of a polynomial in 1 + tℤ\[t] are the roots of its reverse, a monic integer polynomial, hence algebraic integers (Deligne, Weil I, p. 276, Fatou's lemma).

Acceptance checks:

- Z(ℙ¹\_{𝔽\_q}, t) = 1/((1 − t)(1 − qt)): A = 1 and B = (1 − t)(1 − qt) lie in 1 + tℤ\[t].
- Integrality cannot be dropped: f = 1/(1 − t/2) ∈ 1 + tℚ\[\[t]] is rational with denominator 1 − t/2 ∉ ℤ\[t].
- Coprimality cannot be dropped in (b): G = H = 1 − t/ℓ with f = 1 is a non-reduced presentation that is not integral.
- Boundary case: f = 1/(1 − t) ∈ 1 + tℤ\_ℓ\[\[t]] has a reciprocal root of absolute value exactly 1, so the bound in (b) is ≤ 1, not < 1.

Direct inputs: `mathlib:PowerSeries.ext`, `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, proof of (1.7) ⇒ (1.6), pp. 276–277. Shows by Hankel determinants that the integral zeta series, rational over ℚ\_ℓ, is rational over ℚ, and invokes Fatou's lemma to give the coprime integral numerator and denominator constant term 1. [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Lemma 27.9 and proof, pp. 156–157; Lemma 27.10 and proof, p. 158 (v2.21). Lemma 27.9: rationality over a larger field descends to the smaller field. Lemma 27.10: the coprime normalised numerator and denominator of an ℓ-adically integral rational series are ℓ-adically integral.

Declaration id: `DeligneWeightsAndPurity:DWP.0/rational-zeta-descent-and-fatou`. New in this plan (moved down; formerly `WeilConjectures:WC.1/rationality-over-q-via-hankel-determinants`, `WeilConjectures:WC.1/local-fatou-normalization`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/rational-zeta-descent-and-fatou`).

<a id="dwp-0-weight-separated-factor-extraction"></a>

### Weight separation: the pure factors of a rational zeta function are unique, rational and integral

Let q > 1 be an integer and R ∈ 1 + tℤ\[\[t]] ∩ ℚ(t), written R = A/B with A, B ∈ 1 + tℤ\[t] coprime (DWP.0/rational-zeta-descent-and-fatou (c)). Let L be a field of characteristic 0 with algebraic closure L̄ and P_0, …, P_N ∈ 1 + tL\[t] with ∏\_{i=0}^{N} P_i^{(−1)^{i+1}} = R in L\[\[t]], such that every reciprocal root of P_i in L̄ is a Weil q-number of weight i (EDC.7/weight-weil-q-number). Then: (1) the P_i are pairwise coprime, and A = ∏\_{i odd} P_i, B = ∏\_{i even} P_i in L\[t]; (2) for each i there is a unique Π\_i ∈ 1 + tℤ\[t] whose image in L\[t] is P_i, namely Π\_i = ∏(1 − αt)^{m(α)}, the product over the reciprocal roots α of A (i odd) or B (i even) that are Weil q-numbers of weight i, with their multiplicities m(α); (3) the reciprocal roots of Π\_i are algebraic integers and deg Π\_i = deg P_i; (4) if (P′\_i) is a second family over another field L′ of characteristic 0 with the same R and the same purity property, then P_i and P′\_i are images of the same Π\_i. The integrality in (2)–(3) comes from Fatou's lemma and the separation of weights, not from the alternating product alone: without purity, cancellation between degrees can occur and R does not determine the factors.

q > 1 an integer; R ∈ 1 + tℤ\[\[t]] rational.

L a field of characteristic 0; P_i ∈ 1 + tL\[t] with alternating product R.

Every reciprocal root of P_i is a Weil q-number of weight i (all complex conjugates of absolute value q^{i/2}).

Atlas landmark: **Pure factors of a rational zeta function**.

Uses:

- [DWP.4/integral-cohomological-factors](#dwp-4-integral-cohomological-factors): extracts the integral, ℓ-independent factors of a smooth projective variety from DWP.4's purity.
- [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11): gives (ii), the integral ℓ-independent factors of a smooth proper variety, from Weil II purity.
- `PadicDifferentialEquationsAndRigidCohomology:RD.7`: the rigid realisation's factors are the same integral Π\_i (to be imported in place of its own copy).

Proof or construction:

1. Weights separate: a Weil q-number has a unique weight (EDC.7/weight-weil-q-number), so P_i and P_j have no common root for i ≠ j. Hence ∏\_{i odd} P_i and ∏\_{i even} P_i are coprime, and their quotient is a reduced presentation of R over L. Comparing with the reduced presentation A/B over ℚ, both normalised by constant term 1, gives (1).
2. Let K ⊂ L̄ be the splitting field over ℚ of AB. The set of reciprocal roots of AB of weight i, with multiplicities, is stable under Gal(K/ℚ), because being a Weil q-number of weight i depends only on the minimal polynomial over ℚ (EDC.7/weight-weil-q-number, EDC.7/weight-weil-number-arithmetic). So the coefficients of Π\_i are fixed by Gal(K/ℚ) and lie in ℚ (mathlib:IsGalois.mem_range_algebraMap_iff_fixed).
3. The reverse of Π\_i is a monic factor in ℚ\[T] of the monic integral reverse of A or B, so by Gauss's lemma it has integer coefficients (mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd); equivalently its roots are algebraic integers by DWP.0/rational-zeta-descent-and-fatou (c).
4. Uniqueness and (4): Π\_i is described by R alone, so any second pure family gives the same polynomials (Deligne, Weil I, end of the proof of (1.7) ⇒ (1.6), p. 277).

Acceptance checks:

- X = ℙ¹\_{𝔽\_q}: R = 1/((1 − t)(1 − qt)), P_0 = 1 − t (weight 0), P_1 = 1, P_2 = 1 − qt (weight 2).
- Elliptic curve E/𝔽\_7, y² = x³ + x + 1, with #E(𝔽\_7) = 5: R = (1 − 3t + 7t²)/((1 − t)(1 − 7t)) and Π\_1 = 1 − 3t + 7t², whose reciprocal roots have absolute value 7^{1/2}.
- Purity is needed: P_0 = 1, P_1 = P_2 = 1 − 2t give the alternating product R = 1, as do P_0 = P_1 = P_2 = 1, so R does not determine the factors; the hypothesis excludes this because 2 cannot be a Weil q-number of weight 1 and of weight 2.

Direct inputs: [DWP.0/rational-zeta-descent-and-fatou](#dwp-0-rational-zeta-descent-and-fatou), `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic`, `mathlib:IsGalois.mem_range_algebraMap_iff_fixed`, `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, proof of (1.7) ⇒ (1.6), pp. 276–277. From purity of every eigenvalue the factors are pairwise coprime, so the cohomological product is already reduced; each factor's roots are the roots of the reduced numerator or denominator with the right absolute value, a Galois-stable set, so the factor has rational, then integral, coefficients independent of the cohomology theory. [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), 27.14(c)–(d), p. 159 (v2.21). Summary statement that the factors are integral and independent of ℓ once purity holds.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weight-separated-factor-extraction`. New in this plan (moved down; formerly `WeilConjectures:WC.3/degreewise-pure-factor-extraction`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/weight-separated-factor-extraction`).

<a id="dwp-1"></a>

## DWP.1 — Curves and abelian varieties: the initial Weil estimate

Keeps abelian-variety point counts, the Hasse compatibility and base extension; the curve and abelian Weil estimates are imported from EDC.7, scheme Frobenius from SchemeAndStackFoundations SF.0.

Imported from EtaleDualityAndPerverseSheaves EDC.7 (owner since the accepted transfer of 2026-10-14):

- `SchemeAndStackFoundations:SF.0` — the q-power Frobenius of a scheme over 𝔽\_q (formerly `DWP.1/frobenius-endomorphism-over-a-finite-field`, absorbed as a proof step).
- `AbelianSchemesAndArithmeticModuli:A6/frobenius-semisimplicity` — the q-power Frobenius of a scheme over 𝔽\_q (formerly `DWP.1/rosati-of-the-frobenius-endomorphism`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-absolute-values-from-the-rosati-involution` — Milne II.1.3: α†α = r forces |a|² = r for the roots of P_α (formerly `DWP.1/absolute-values-from-the-rosati-involution`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties` — The Weil estimate for abelian varieties over 𝔽\_q (formerly `DWP.1/weil-estimate-for-abelian-varieties`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-curves` — The Weil estimate for curves, through the Jacobian (formerly `DWP.1/weil-estimate-for-curves`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weights-of-the-cohomology-of-curves` — The weights of H⁰, H¹ and H² of a curve over 𝔽\_q (formerly `DWP.1/weights-of-the-cohomology-of-curves`).

<a id="dwp-1-point-counts-of-abelian-varieties"></a>

### Point counts of abelian varieties over 𝔽\_{q^m}, and their bounds

Let A be an abelian variety of dimension g over 𝔽\_q with P_{π\_A}(X) = ∏\_{i=1}^{2g}(X − a_i). Then for all m ≥ 1, N_m = #A(𝔽\_{q^m}) = deg(1 − π^m) = P_{π^m}(1) = ∏\_i(1 − a_i^m), and |N_m − q^{mg}| ≤ 2g·q^{m(g−1/2)} + (2^{2g} − 2g − 1)·q^{m(g−1)}. The zeta function is Z(A, t) = ∏\_{r=0}^{2g} P_r(t)^{(−1)^{r+1}}, where P_r(t) = ∏(1 − a_{i_1}⋯a_{i_r}t) over 1 ≤ i_1 < … < i_r ≤ 2g, the characteristic polynomial of π on ∧^r T_ℓA.

1 − π^m is separable (its differential is +1) and étale, so its degree is the number of geometric points in its kernel, which is A(𝔽\_{q^m}).

The bound uses the Weil estimate. The leading term ∏ a_i = deg π = q^g is exact.

Proof or construction:

1. d(1−π^m)=1 at the origin, so 1−π^m is étale. Properness and a zero-dimensional kernel make it a finite surjective isogeny. Its geometric kernel is A(𝔽\_(q^m)), with multiplicity one. Hence #A(𝔽\_(q^m))=deg(1−π^m)=P_(π^m)(1), using the A6 isogeny degree and characteristic-polynomial contracts.
2. The eigenvalues of π^m are the a_i^m (EDC.7/weight-spectra-of-polynomials-in-an-endomorphism), so P_{π^m}(1) = ∏(1 − a_i^m).
3. Expand ∏(1 − a_i^m): the term ∏a_i^m = q^{mg}; the 2g terms that are products of 2g − 1 roots have absolute value q^{m(g−1/2)}; the remaining 2^{2g} − 2g − 1 terms have absolute value at most q^{m(g−1)} (Weil estimate).
4. Zeta function: log Z = Σ N_m t^m/m with N_m = Σ\_r (−1)^r Tr(π^m | ∧^r), and the eigenvalues of π on ∧^r T_ℓA are the r-fold products (EDC.7/weight-eigenvalues-of-exterior-powers).

Acceptance checks:

- E: y² = x³ − x over 𝔽\_3: N_1 = P_π(1) = 1 + 3 = 4, and |4 − 3| = 1 ≤ 2√3.
- g = 1: the bound reads |N_m − q^m| ≤ 2q^{m/2} + 1, that is Hasse's |N_m − q^m − 1| ≤ 2q^{m/2}, loosened by the constant term.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties`, `SchemeAndStackFoundations:SF.0/absolute-frobenius`, `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-polynomials-in-an-endomorphism`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-eigenvalues-of-exterior-powers`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Theorem 1.1(a), p. 75. Theorem 1.1: N_m = ∏(1 − a_i^m) and the bound. [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76. dπ = 0, so π − 1 is étale. [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78. The zeta factorization and its exterior-power interpretation.

Declaration id: `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-1-compatibility-with-the-hasse-bound"></a>

### Compatibility with the Hasse bound for elliptic curves

For an elliptic curve E over 𝔽\_q with a = q + 1 − #E(𝔽\_q) (the trace of Frobenius of Tau Ceti EllipticCurves Layer 3), P_{π\_E}(X) = X² − aX + q, and the Weil estimate for abelian varieties (g = 1) gives |a| ≤ 2√q. This is the Hasse bound that Tau Ceti EllipticCurves Layer 3 proves independently. The two agree, and this node proves only the identification of the characteristic polynomials.

RS-17: a compatibility proof, not a second proof of Hasse. The Hasse theorem is imported from Tau Ceti EllipticCurves Layer 3.

Proof or construction:

1. P_π(1) = #E(𝔽\_q) (theorem point-counts-of-abelian-varieties) and P_π(0) = deg π = q, so P_π = X² − aX + q with a = q + 1 − #E(𝔽\_q).
2. The roots α, ᾱ have |α| = √q (Weil estimate), so |a| = |α + ᾱ| ≤ 2√q.
3. Tau Ceti EllipticCurves Layer 3 defines the trace of Frobenius through the same point count, so the two statements concern the same integer.

Acceptance checks:

- y² = x³ − x over 𝔽\_3: a = 0. y² + y = x³ over 𝔽\_2: #E(𝔽\_2) = 3, a = 0, and P = X² + 2.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties`, [DWP.1/point-counts-of-abelian-varieties](#dwp-1-point-counts-of-abelian-varieties), `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Theorem 11.1, p. 118. |N − q − 1| ≤ 2g√q, which for g = 1 is Hasse's bound.

Declaration id: `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-1-the-frobenius-and-points-over-extensions"></a>

### Compatibility of the Weil estimate with finite base extension

For A (resp. C) over 𝔽\_q and m ≥ 1, the Frobenius of A ⊗ 𝔽\_{q^m} over 𝔽\_{q^m} is π\_A^m, P_{π^m}(X) = ∏(X − a_i^m), and the Weil estimate over 𝔽\_{q^m} (weight 1 relative to q^m) is equivalent to that over 𝔽\_q (weight 1 relative to q). The same holds for the weights of H⁰, H¹ and H² of curves.

RS-17 keeps compatibility under finite base extension as a review correction. The base-change isomorphism of étale cohomology is imported.

Proof or construction:

1. The Frobenius of V ⊗ 𝔽\_{q^m} is π\_V^m (the q-Frobenius of SchemeAndStackFoundations:SF.0).
2. The eigenvalues of π^m are the a_i^m, and weights relative to q^m of the a_i^m equal weights relative to q of the a_i (EDC.7/weight-weil-number-base-extension, EDC.7/weight-finite-field-base-extension-of-weights).

Acceptance checks:

- E over 𝔽\_3 with P_π = X² + 3: over 𝔽\_9, P_{π²} = (X + 3)², with roots −3 of absolute value 3 = 9^{1/2}.

Direct inputs: `SchemeAndStackFoundations:SF.0/absolute-frobenius`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-base-extension`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76. Replacing π by π^m.

Declaration id: `DeligneWeightsAndPurity:DWP.1/the-frobenius-and-points-over-extensions`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-2"></a>

## DWP.2 — Weil I's fundamental estimate, with its actual hypotheses

Keeps Weil I Theorem 3.2 and its corollaries; the positive-product lemmas are EDC.7/weight-positive-euler-product-comparison.

Imported from EtaleDualityAndPerverseSheaves EDC.7 (owner since the accepted transfer of 2026-10-14):

- `EtaleDualityAndPerverseSheaves:EDC.7/weight-positive-euler-product-comparison` — Positive even-tensor Euler products and comparison of poles (formerly `DWP.2/positivity-of-even-tensor-power-traces`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-positive-euler-product-comparison` — Positive even-tensor Euler products and comparison of poles (formerly `DWP.2/positive-local-factors`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-positive-euler-product-comparison` — Positive even-tensor Euler products and comparison of poles (formerly `DWP.2/radius-of-convergence-of-positive-products`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-positive-euler-product-comparison` — Positive even-tensor Euler products and comparison of poles (formerly `DWP.2/poles-of-positive-products`, absorbed as a proof step).

<a id="dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves"></a>

### The Weil I curve coefficient interface

On an open U₀⊂ℙ¹ over 𝔽\_q, specialize EDC.7’s common punctual purity predicate (EDC.7/weight-punctual-purity-and-mixedness) to a lisse ℚ\_ℓ-sheaf ℱ₀: integer weight β means each closed-point stalk is pure β relative to q^(deg x). The local determinant and Euler product are the SF.2 coefficient L-function, with local variable t^(deg x). Changing geometric stalk conjugates Frobenius and leaves its determinant unchanged; tensor weights add, dual weights negate, and the Tate line ℚ\_ℓ(r) has weight −2r. This comparison fixes the inputs of Weil I §3 without defining a second purity predicate or L-function.

This is Weil I (3.1): all complex conjugates of the Frobenius eigenvalues, that is, Weil q_x-numbers. DWP.5 generalizes it to Weil II's pointwise purity on schemes of finite type and to real ι-weights, and must identify its predicate with this one on open subsets of ℙ¹.

F₀ has a fixed ℚ\_ℓ-model, as RS-17 keeps. ℚ̄\_ℓ enters only through the eigenvalues.

The geometric Frobenius is used (DWP.0 conventions).

Atlas landmark: **Weight of a lisse sheaf on a curve**.

Proof or construction:

1. Use the common closed-stalk definition and geometric-Frobenius convention. Coefficient-extension invariance identifies the ℚ\_ℓ model with its algebraic closure.
2. Import local characteristic-polynomial conjugacy invariance and the Euler determinant formula from SF.2. Apply the numeric tensor, dual and Tate identities to the stalks.

Acceptance checks:

- ℚ\_ℓ(1) on 𝔾\_m has weight −2, and Z(𝔾\_m, ℚ\_ℓ(1), t) = Z(𝔾\_m, ℚ\_ℓ, t/q) = (1 − t/q)/(1 − t).
- ℚ\_ℓ(r) on U₀ has weight −2r: F_x acts by q_x^{−r}.
- The constant sheaf ℚ\_ℓ has weight 0, and the zero sheaf has every weight.
- For q = p odd and ℓ≠2,p, the geometrically constant rank-one sheaf on which F_x acts by 2^{deg x} has no weight, since 2 = p^{β/2} has no integer solution β. It is ι-pure of the real weight 2 log_p 2.
- Z(𝔸¹, ℚ\_ℓ, t) = 1/(1 − qt).

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-twisting-by-rank-one-characters`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.1), p. 284. The weight of a lisse sheaf on a curve; ℚ\_ℓ(r) has weight −2r. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.1), p. 283. U₀ is the complement in ℙ¹ of finitely many closed points.

Declaration id: `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense"></a>

### Open subgroups of Sp(V)(ℚ\_ℓ) are Zariski-dense

Let V be a finite-dimensional ℚ\_ℓ-vector space with a nondegenerate alternating form ψ, and H ⊆ Sp(V, ψ)(ℚ\_ℓ) a subgroup open for the ℓ-adic topology. Then H is Zariski-dense in the algebraic group Sp(V, ψ). Consequently, for every algebraic representation W of Sp(V, ψ), such as ⊗^m V, the H-invariants and H-coinvariants of W are the Sp(V, ψ)-invariants and Sp(V, ψ)-coinvariants.

Openness is for the ℓ-adic topology. RS-17 keeps it as the hypothesis of Theorem 3.2, rather than any weaker density statement.

Connectedness of Sp is essential. An open subgroup of O(V)(ℚ\_ℓ) contains an open neighborhood in SO(V), so its closure contains SO(V), but need not contain all components: SO(V)(ℚ\_ℓ) itself is an open counterexample to full O-density.

Proof or construction:

1. The Zariski closure Ĥ of H is an algebraic subgroup of Sp(V). Its ℚ\_ℓ-points contain the open subgroup H, so its Lie algebra is sp(V) and dim Ĥ = dim Sp(V) (ReductiveGroups Layers 2–3).
2. Sp(V) is connected, so Ĥ = Sp(V).
3. A vector or functional fixed by H is fixed by its Zariski closure, because the action is algebraic.

Acceptance checks:

- Sp_{2g}(ℤ\_ℓ) is open in Sp_{2g}(ℚ\_ℓ) and Zariski-dense.
- A finite subgroup of Sp(V)(ℚ\_ℓ) is neither open nor Zariski-dense when dim V > 0.

Direct inputs: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285. π₁ is Zariski-dense in Sp.

Declaration id: `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-2-symplectic-coinvariants-of-even-tensor-powers"></a>

### Coinvariants of ⊗^{2k}V under the symplectic group, over ℚ\_ℓ

Let V be a ℚ\_ℓ-vector space of dimension 2r ≥ 2 with a nondegenerate alternating form ψ : V ⊗ V → L, where L is one-dimensional (L = ℚ\_ℓ(−β)). For a partition P of {1, …, 2k} into pairs {a_i, b_i} with a_i < b_i, let ψ\_P : ⊗^{2k}V → L^{⊗k}, v₁ ⊗ … ⊗ v_{2k} ↦ ∏\_i ψ(v_{a_i}, v_{b_i}). The ψ\_P span the Sp(V, ψ)-invariant maps ⊗^{2k}V → L^{⊗k}. For a suitable subset 𝒫′ of the pair partitions, depending on dim V and k, the ψ\_P with P ∈ 𝒫′ induce an isomorphism (⊗^{2k}V)\_{Sp(V, ψ)} ≅ (L^{⊗k})^N with N = #𝒫′ ≥ 1. The isomorphism is compatible with every automorphism of V that multiplies ψ by a scalar, acting on L by that scalar.

Over ℂ this is Weyl's first fundamental theorem for Sp (Brauer algebra), imported from Tau Ceti SchurWeyl Layer 9.

The passage to ℚ\_ℓ is proved here, as RS-17 requires: the group Sp and the representation ⊗^{2k}V are defined over ℚ, and invariants of an algebraic group under flat base change of fields commute with extension of scalars. No statement about ℓ-adically open subgroups is transferred by extension of scalars.

For dim V ≥ 2k all (2k − 1)!! pair partitions are independent. For smaller V the ψ\_P are dependent.

Proof or construction:

1. Over ℂ: the Sp-invariant multilinear forms on V^{2k} are spanned by the ψ\_P (SchurWeyl Layer 9).
2. Descent to ℚ: choose a symplectic basis defined over ℚ. The invariants of Sp_{2r} over ℚ on (⊗^{2k}ℚ^{2r})^∨ span the complex invariants after ⊗ ℂ, since invariants commute with flat base change. So the ψ\_P span over ℚ.
3. Base change to ℚ\_ℓ, by the same argument.
4. Coinvariants are dual to the invariants of the dual representation, so choosing a basis 𝒫′ of the span gives the isomorphism, with N = dimension of the invariants.

Acceptance checks:

- dim V = 2, k = 1: (V ⊗ V)\_{Sp} ≅ L through ψ, N = 1.
- dim V = 2, k = 2: the invariants of SL₂ on ⊗⁴V have dimension 2 (the Catalan number C₂), while there are 3 pair partitions. The three ψ\_P are dependent, and N = 2.

Direct inputs: `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285. The coinvariants of π₁ are those of Sp, computed by Weyl's theorem.

Declaration id: `DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-2-compact-cohomology-of-even-tensor-powers"></a>

### Compact cohomology and the L-function of ⊗^{2k}F

Under the hypotheses of Theorem 3.2, with U affine and F₀ ≠ 0: H⁰\_c(U, ⊗^{2k}F) = 0, H²\_c(U, ⊗^{2k}F) ≅ ℚ\_ℓ(−kβ − 1)^N with N ≥ 1 as Frobenius modules, and Z(U₀, ⊗^{2k}F₀, t) = det(1 − F^\*t, H¹\_c(U, ⊗^{2k}F)) / (1 − q^{kβ+1}t)^N. So Z(U₀, ⊗^{2k}F₀, t) is the Taylor expansion of a rational function whose only poles are at t = q^{−kβ−1}.

U affine: shrinking U₀ changes neither the hypotheses nor the conclusion of Theorem 3.2.

Weil I (2.10) (H⁰\_c = 0 on an affine curve; H²\_c = coinvariants(−1)) is requested from EtaleDualityAndPerverseSheaves EDC.2. The trace formula (1.14.3) is requested from SchemeAndStackFoundations SF.2, which carries the CohomologicalPointCounting trace formula that RS-17 names.

Only the absolute value of the pole, |q^{−kβ−1}|, is used afterwards.

Proof or construction:

1. H⁰\_c(U, G) = 0 for a lisse G on the affine curve U (Weil I (2.10)(i), EDC.2).
2. H²\_c(U, G) = (G_ū)\_{π₁(U, ū)}(−1) (Weil I (2.10)(ii), EDC.2), for G = ⊗^{2k}F.
3. The geometric monodromy is open in Sp, so its coinvariants are the Sp-coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). These are ℚ\_ℓ(−kβ)^N (theorem symplectic-coinvariants-of-even-tensor-powers), Frobenius-equivariantly because ψ is a morphism of sheaves into ℚ\_ℓ(−β).
4. Trace formula (1.14.3), requested from SF.2: Z = ∏\_i det(1 − F^\*t, H^i_c)^{(−1)^{i+1}}, and F^\* = q^{kβ+1} on H²\_c = ℚ\_ℓ(−kβ − 1)^N.

Acceptance checks:

- For F₀ the first cohomology of a family of elliptic curves with non-constant j (weight 1, rank 2, ψ the Weil pairing into ℚ\_ℓ(−1)) and k = 1: H²\_c(U, ⊗²F) ≅ ℚ\_ℓ(−2), N = 1, with a pole at t = q^{−2}.

Direct inputs: [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense), [DWP.2/symplectic-coinvariants-of-even-tensor-powers](#dwp-2-symplectic-coinvariants-of-even-tensor-powers), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285. Z(U₀, ⊗^{2k}F₀, t) is rational, with poles only at q^{−kβ−1}. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, Scholie (2.10), p. 282. H⁰\_c vanishes on an affine curve.

Declaration id: `DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-2-fundamental-estimate-theorem-3-2"></a>

### Weil I, Theorem 3.2: the fundamental estimate

Let U₀ ⊆ ℙ¹ over 𝔽\_q be open, F₀ a lisse ℚ\_ℓ-sheaf on U₀, and β ∈ ℤ. Assume (i) F₀ carries a nondegenerate alternating pairing ψ : F₀ ⊗ F₀ → ℚ\_ℓ(−β); (ii) the image of the geometric fundamental group π₁(U, ū) in GL(F_ū) is an open subgroup of Sp(F_ū, ψ); (iii) for every x ∈ |U₀|, det(1 − F_x t, F₀) has rational coefficients. Then F₀ has weight β: every eigenvalue of every F_x is an algebraic number all of whose complex conjugates have absolute value q_x^{β/2}.

(ii) is openness for the ℓ-adic topology in the symplectic group of ψ, as RS-17 keeps it.

(iii) is rationality of the Frobenius polynomials of the fixed ℚ\_ℓ-sheaf.

One may assume U affine and F₀ ≠ 0.

No purity of cohomology is assumed: the estimate is proved directly from positivity and the poles of the L-function of the even tensor powers.

Atlas landmark: **Fundamental estimate**.

Proof or construction:

1. Reduce to U affine and F₀ ≠ 0.
2. Fix x of degree d and an eigenvalue α of F_x on F₀. By (iii), α is algebraic and every complex conjugate of α is again an eigenvalue. α^{2k} is an eigenvalue of F_x on ⊗^{2k}F₀ (EDC.7/weight-spectra-of-tensor-products-and-duals). So the local factor det(1 − F_x t^d, ⊗^{2k}F₀)⁻¹ has a pole at every t with t^d = α^{−2k}.
3. That local factor is one factor of Z(U₀, ⊗^{2k}F₀, t) = ∏\_y (local factor at y). All the factors have nonnegative coefficients (EDC.7/weight-positive-euler-product-comparison), and Z is rational with poles only at q^{−kβ−1} (theorem compact-cohomology-of-even-tensor-powers). The pole comparison of EDC.7/weight-positive-euler-product-comparison gives |α|^{−2k/d} ≥ q^{−kβ−1}, that is, |α| ≤ q_x^{β/2 + 1/(2k)}.
4. Letting k → ∞ gives |α| ≤ q_x^{β/2}.
5. ψ is Frobenius-equivariant with values in ℚ\_ℓ(−β), on which F_x acts by q_x^β. So q_x^β/α is also an eigenvalue (EDC.7/weight-reciprocal-pairing-of-eigenvalues with c = q_x^β), and the previous step applied to it gives |α| ≥ q_x^{β/2}. The same argument applies to every complex conjugate of α.

Acceptance checks:

- The first cohomology of a family of elliptic curves over an open subset of ℙ¹ with non-constant j has weight 1, carries the Weil pairing, has monodromy open in SL₂ = Sp₂, and has rational Frobenius polynomials. Theorem 3.2 gives |a_x| ≤ 2√q_x at every fibre, compatibly with the Hasse bound of Tau Ceti EllipticCurves Layer 3.

Direct inputs: [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/compact-cohomology-of-even-tensor-powers](#dwp-2-compact-cohomology-of-even-tensor-powers), `EtaleDualityAndPerverseSheaves:EDC.7/weight-positive-euler-product-comparison`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-reciprocal-pairing-of-eigenvalues`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Théorème (3.2), p. 284. The hypotheses (i)–(iii). [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Théorème (3.2), p. 284. Hypothesis (ii): open symplectic monodromy. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, proof of (3.2), p. 285. The limit k → ∞.

Declaration id: `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-2-coarse-bound-on-compact-cohomology"></a>

### Corollary 3.8: the coarse bound on H¹\_c(U, F)

Under the hypotheses of Theorem 3.2, with U affine, every eigenvalue α of F^\* on H¹\_c(U, F) is an algebraic number, and every complex conjugate of α satisfies |α| ≤ q^{β/2 + 1}.

This is an upper bound for H¹\_c, not purity. Sharp curve-coefficient purity is DWP.6.

Proof or construction:

1. H⁰\_c(U, F) = 0 (U affine), and H²\_c(U, F) = (F_ū)\_{π₁}(−1) = 0, since the standard representation of Sp has no coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). So by (1.14.3), Z(U₀, F₀, t) = det(1 − F^\*t, H¹\_c(U, F)).
2. The left side has rational coefficients by its product expansion and (iii). So the polynomial on the right has rational coefficients, 1/α is a root, α is algebraic, and its conjugates are also eigenvalues.
3. With N=rank ℱ and |α\_(x,j)|=q_x^(β/2), choose |t|=q^(−β/2−1−ε). Because U₀⊂ℙ¹, the number of its degree-e closed points is at most #ℙ¹(𝔽\_(q^e))=q^e+1. Hence Σ\_(x,j)|α\_(x,j)t^(deg x)|≤N Σ\_(e≥1)(q^e+1)q^(−e(1+ε))=N\[Σ q^(−eε)+Σ q^(−e(1+ε))]<∞. Both geometric series are required for the original open of ℙ¹.
4. An absolutely convergent product of nonzero factors has no zero, so |1/α| ≥ q^{−β/2−1}.

Acceptance checks:

- β = 1 (a family of elliptic curves): every eigenvalue on H¹\_c(U, F) satisfies |α| ≤ q^{3/2}.

Direct inputs: [DWP.2/fundamental-estimate-theorem-3-2](#dwp-2-fundamental-estimate-theorem-3-2), [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.8), p. 286. Rationality of Z and the convergence argument.

Declaration id: `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-2-coarse-bound-on-cohomology-of-the-projective-line"></a>

### Corollary 3.9: the two-sided coarse bound on H¹(ℙ¹, j_\*F)

Let j : U → ℙ¹ be the inclusion. Under the hypotheses of Theorem 3.2, every eigenvalue α of F^\* on H¹(ℙ¹, j_\*F) is an algebraic number, and every complex conjugate of α satisfies q^{β/2} ≤ |α| ≤ q^{β/2 + 1}; in Deligne's notation q^{(β+1)/2 − 1/2} ≤ |α| ≤ q^{(β+1)/2 + 1/2}.

Poincaré duality (2.12) for j_\*F on ℙ¹ is requested from EtaleDualityAndPerverseSheaves EDC.2.

Proof or construction:

1. The exact sequence 0 → j_!F → j_\*F → j_\*F/j_!F → 0 has a punctual third term, so H¹\_c(U, F) → H¹(ℙ¹, j_\*F) is surjective. Every α is therefore an eigenvalue on H¹\_c(U, F), and Corollary 3.8 gives |α| ≤ q^{β/2+1}.
2. Poincaré duality (2.12) pairs H¹(ℙ¹, j_\*F) with H¹(ℙ¹, j_\*F^∨(1)) into ℚ\_ℓ, and ψ identifies F^∨ with F(β). So q^{β+1}/α is an eigenvalue (EDC.7/weight-reciprocal-pairing-of-eigenvalues), and |q^{β+1}α⁻¹| ≤ q^{β/2+1} gives |α| ≥ q^{β/2}.

Acceptance checks:

- β = 1: every eigenvalue on H¹(ℙ¹, j_\*F) satisfies q^{1/2} ≤ |α| ≤ q^{3/2}. Purity (|α| = q) is DWP.4's sharpening.

Direct inputs: [DWP.2/coarse-bound-on-compact-cohomology](#dwp-2-coarse-bound-on-compact-cohomology), `EtaleDualityAndPerverseSheaves:EDC.7/weight-reciprocal-pairing-of-eigenvalues`, `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.9), p. 286. Surjectivity of H¹\_c(U, F) → H¹(ℙ¹, j_\*F). [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.9), p. 287. The dual eigenvalue q^{β+1}/α.

Declaration id: `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-3"></a>

## DWP.3 — Pencil local-factor rationality and the radical quotient

Keeps Weil I §6 (rationality of the pencil local factors); adds the curve Chebotarev theorem moved down from FunctionFieldArithmetic FA.5.

<a id="dwp-3-radical-quotient-of-the-vanishing-system"></a>

### Arithmetic descent of the pencil radical quotient

For a finite-field Lefschetz pencil on a geometrically connected smooth projective even-dimensional variety, the LPV.4 vanishing system ℰ and its radical quotient ℱ=ℰ/(ℰ∩ℰ⊥) descend to lisse ℚ\_ℓ-sheaves ℰ₀ and ℱ₀ over the smooth-parameter open U₀. The supplied perfect alternating pairing on ℱ₀ has values in ℚ\_ℓ(−d), with d odd the fixed fibre dimension, so a local geometric Frobenius of degree e acts by a symplectic similitude with multiplier q^(de). The zero quotient is permitted. LPV.4 owns the construction and perfection of the quotient; this node supplies its finite-field descent and arithmetic normalization.

Use the actual LPV.3 pencil and LPV.4 quotient with their fixed ℚ\_ℓ model. No replacement of fibre dimension d by point degree e is permitted.

Atlas landmark: **Arithmetic pencil descent**.

Proof or construction:

1. Import the LPV.4 quotient and pairing. Arithmetic Frobenius permutes the vanishing cycles, preserving their span and its radical; the lisse fibre/representation descent equivalence supplies ℰ₀ and ℱ₀.
2. The Frobenius-equivariant cup-product pairing takes values in ℚ\_ℓ(−d). Geometric Frobenius acts there by q^(de), giving the multiplier.
3. If the quotient is zero, its local polynomial is 1 and the rationality/purity statements are vacuous; the dimension induction still retains the radical and constant pieces.

Acceptance checks:

- A Lefschetz pencil of plane cubics (X = ℙ², n = 1): ℰ = H¹ of the fibres, ℰ ∩ ℰ^⊥ = 0, and ℱ₀ is the rank-2 sheaf with its Weil pairing into ℚ\_ℓ(−1).
- For a pencil of plane cubics, ℱ₀ has rank 2 and ψ is the Weil pairing.
- If ℰ ⊆ ℰ^⊥, then ℱ₀ = 0 and Theorem 6.2 holds trivially.
- ψ need not be perfect on ℰ itself when ℰ ∩ ℰ^⊥ ≠ 0; only the quotient carries a perfect pairing.
- rank ℱ₀ is even, since ℱ₀ carries a perfect alternating pairing.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295. The vanishing part ℰ, a local system on U. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295. The alternating cup-product ψ and the induced perfect pairing on ℰ₀/(ℰ₀ ∩ ℰ₀^⊥). [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295. X connected of even dimension n + 1.

Declaration id: `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-3-geometrically-constant-lisse-sheaves"></a>

### Weil I Lemma 6.4: geometrically constant lisse sheaves come from 𝔽\_q

Let U₀ be geometrically connected over 𝔽\_q and let 𝒢₀ be a lisse ℚ\_ℓ-sheaf on U₀ whose pullback 𝒢 to U is constant. Then there are ℓ-adic units α\_i ∈ ℚ̄\_ℓ with det(1 − F_x t^{deg x}, 𝒢₀) = ∏\_i(1 − α\_i^{deg x} t^{deg x}) for every x ∈ |U₀|. In fact 𝒢₀ is the pullback of its direct image to Spec 𝔽\_q, a representation G₀ of Gal(𝔽̄\_q/𝔽\_q), and ∏(1 − α\_i t) = det(1 − F t, G₀).

The α\_i are ℓ-adic units because Gal(𝔽̄\_q/𝔽\_q) is compact.

The lemma applies to R^i f_\*ℚ\_ℓ for i ≠ n, to R^n f_\*ℚ\_ℓ/ℰ₀ and to ℰ₀ ∩ ℰ₀^⊥, which are geometrically constant for a Lefschetz pencil (LefschetzPencilsAndVanishingCycles LPV.4).

Proof or construction:

1. 𝒢₀ corresponds to a representation of π₁(U₀, u) trivial on π₁(U, u), so it factors through π₁(U₀)/π₁(U) = Gal(𝔽̄\_q/𝔽\_q).
2. The Frobenius at x maps to F^{deg x} in Gal(𝔽̄\_q/𝔽\_q), so its eigenvalues are the α\_i^{deg x} (EDC.7/weight-finite-field-base-extension-of-weights).

Acceptance checks:

- The Tate twist ℚ\_ℓ(−1) on U₀: α = q, and det(1 − F_x t^{deg x}) = 1 − q^{deg x} t^{deg x}.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.4`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Lemme (6.4), p. 295. Lemma 6.4. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.4), p. 296. 𝒢₀ is a pullback from Spec 𝔽\_q.

Declaration id: `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-3-zeta-of-the-fibres-and-the-pencil-factorization"></a>

### The zeta functions of the fibres, split into a constant part and the ℱ₀ part

In the setting of radical-quotient-of-the-vanishing-system, there are ℓ-adic units α\_1, …, α\_N and β\_1, …, β\_M in ℚ̄\_ℓ, with α\_i ≠ β\_j for all i and j, such that for every x ∈ |U₀|, Z(X_x, t) = \[∏\_i(1 − α\_i^{deg x} t) / ∏\_j(1 − β\_j^{deg x} t)] · det(1 − F_x t, ℱ₀)^{(−1)^{n+1}}, where t is the variable for the residue field k(x). In particular the right-hand side lies in ℚ(t).

Z(X_x, t) ∈ ℚ(t) is the rationality of the zeta function over ℚ: Z(X_x, t) ∈ ℤ\[\[t]] is rational over ℚ\_ℓ by the cohomological formula, so DWP.0/rational-zeta-descent-and-fatou (a) applies. The cohomological formula is Weil I (1.5.4), requested from SchemeAndStackFoundations SF.2.

Common α\_i = β\_j can be cancelled, so they may be assumed distinct. This is the finite eigenvalue family bookkeeping RS-17 asks for, with no appeal to purity.

No Riemann hypothesis is used: the α and β are arbitrary ℓ-adic units.

Proof or construction:

1. For x ∈ |U₀|, the fibre X_x is smooth projective over k(x), and H^i(X_x̄) is the stalk of R^i f_\*ℚ\_ℓ at a geometric point over x (proper base change, SF.2).
2. (1.5.4) over k(x): Z(X_x, t) = ∏\_i det(1 − F_x t, R^i f_\*ℚ\_ℓ)^{(−1)^{i+1}}.
3. Filter R^n by ℰ ∩ ℰ^⊥ ⊆ ℰ ⊆ R^n: the factor splits as det(on R^n/ℰ)·det(on ℰ ∩ ℰ^⊥)·det(on ℱ₀) (EDC.7/weight-endomorphism-weights).
4. Lemma geometrically-constant-lisse-sheaves on R^i (i ≠ n), R^n/ℰ₀ and ℰ₀ ∩ ℰ₀^⊥ gives the α and β factors. Cancel common values.
5. Z(X_x, t) ∈ ℚ(t), by the cohomological formula and DWP.0/rational-zeta-descent-and-fatou (a).

Acceptance checks:

- A pencil of plane cubics (n = 1): Z(X_x, t) = det(1 − F_x t, ℱ₀)/((1 − t)(1 − q_x t)). There are no α's, and β = (1, q), from H⁰ = ℚ\_ℓ and H² = ℚ\_ℓ(−1).

Direct inputs: [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights`, [DWP.0/rational-zeta-descent-and-fatou](#dwp-0-rational-zeta-descent-and-fatou), `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.4), p. 296. The factorization of Z(X_x, t). [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.4), p. 276. The cohomological formula for Z.

Declaration id: `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-3-powers-of-a-family-determine-the-family"></a>

### Weil I Lemma 6.7: a family is determined by its n-th powers for enough n

Let K be a finite set of nonnegative integers different from 1, and (δ\_j)\_{j ≤ Q}, (ε\_j)\_{j ≤ Q} two families of elements of a field. If, for all sufficiently large n divisible by no element of K, the families (δ\_j^n) and (ε\_j^n) agree up to order, then (δ\_j) and (ε\_j) agree up to order.

K must exclude 1: every integer is divisible by 1.

The families are finite and counted with multiplicity.

Proof or construction:

1. Induction on Q. For each j, the n with δ\_0^n = ε\_j^n form an ideal n_jℤ.
2. If δ\_0 ≠ ε\_j for all j, then all n_j ≠ 1, and there are arbitrarily large n divisible by no n_j and no element of K. Then δ\_0^n ≠ ε\_j^n for all j, contradicting the hypothesis. So δ\_0 = ε\_{j₀} for some j₀.
3. Remove δ\_0 and ε\_{j₀} and apply the induction hypothesis.

Acceptance checks:

- δ = (1, −1), ε = (−1, 1): equal. δ = (ζ₃), ε = (1): the cubes agree, but for n not divisible by 3 they differ, and with K = {3} the hypothesis fails, as it should.

Direct inputs: .

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.7), p. 297. Induction on the size of the family.

Declaration id: `DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-3-open-image-in-the-symplectic-similitude-group"></a>

### Weil I Lemma 6.11: the arithmetic monodromy of ℱ₀ is open in H

Let d be the fixed odd pencil fibre dimension and ℱ₀≠0 its supplied radical quotient with pairing into ℚ\_ℓ(−d). Use the arithmetic coordinate a∈ℤ̂, where geometric Frobenius of a degree-e point has a=−e. In a fixed finite ℓ-adic coefficient model define H={(a,g)∈ℤ̂×GSp(ℱ,ψ): μ(g)=q^(−da)}. Then (arithmetic degree,ρ):π₁(U₀)→H has open image H₁, compact because π₁(U₀) is profinite. Its degree-zero image is open in Sp for the ℓ-adic topology.

The openness of the geometric monodromy in Sp(ℱ, ψ) is Weil I (5.10), which LefschetzPencilsAndVanishingCycles LPV.5 owns: open symplectic monodromy for the fixed ℚ\_ℓ model.

ℱ₀ ≠ 0 is assumed. For ℱ₀ = 0 the statements are empty.

Proof or construction:

1. The pairing forces μ(ρ(σ))=q^(−da(σ)), so the map lands in H. In particular a(F_x)=−e gives multiplier q^(de).
2. The arithmetic exact sequence is surjective onto ℤ̂ for geometrically connected U₀. Its geometric kernel image is open in Sp by the fixed-model LPV.5 theorem. Therefore the total image is open in H; its compactness follows from profiniteness.

Acceptance checks:

- For plane cubics the geometric image is a compact open subgroup of Sp₂(ℚ\_ℓ)=SL₂(ℚ\_ℓ). At degree e its determinant is q^e, not q^(−e).

Direct inputs: [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.10), p. 297. π₁(U₀) acts by symplectic similitudes. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.10), p. 298. The group H.

Declaration id: `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-3-haar-null-exceptional-eigenvalue-locus"></a>

### Weil I Lemma 6.12: the eigenvalue-δ^a locus is closed and Haar-null

For an ℓ-adic unit δ in the fixed finite coefficient field, the locus Z_δ={(a,g)∈H₁: δ^a is an eigenvalue of g} is closed and null in each arithmetic-degree fibre, hence Haar-null in H₁. For a bad geometric eigenvalue δ₀^e the arithmetic-degree locus uses δ=δ₀⁻¹, since a(F_x)=−e.

δ^a for a ∈ ℤ̂ is defined because δ is an ℓ-adic unit.

This is the compact ℓ-adic Haar-null step that RS-17 asks DWP.3 to prove itself.

ℱ ≠ 0 is needed: for ℱ = 0 there are no eigenvalues and Z_δ = ∅.

Proof or construction:

1. Closedness: (a, g) ↦ det(δ^a − g) is continuous, and Z_δ is its zero set.
2. At fixed arithmetic coordinate a, the similitude fibre has multiplier q^(−da) and is a translate of Sp. The determinant equation det(δ^a−g)=0 cuts out a proper algebraic subset: in a symplectic basis choose distinct nonzero diagonal parameters avoiding δ^a and its multiplier partner. An ℓ-adic analytic proper algebraic zero set has Haar measure zero in every compact open part of this fibre.
3. H₁ ∩ ({a} × Z_{δ,a}) is null in the fibre of H₁ over a, and Fubini for the projection H₁ → ℤ̂ gives measure 0.

Acceptance checks:

- ℱ of rank 2 and δ = 1: the set of g ∈ SL₂(ℤ\_ℓ) with eigenvalue 1 (unipotent-type) is a proper analytic subset of measure 0.

Direct inputs: [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group), `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Lemme (6.12), p. 298. Z is closed of measure zero. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.12), p. 298. Fubini over the projection to ℤ̂.

Declaration id: `DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-3-function-field-chebotarev"></a>

### Chebotarev density for finite Galois covers of a curve over 𝔽\_q, with constant-field degrees and explicit error

Let X₀ be a smooth projective geometrically connected curve of genus g_X over 𝔽\_q with function field K, M/K a finite Galois extension with group G, 𝔽\_{q^h} the field of constants of M (the algebraic closure of 𝔽\_q in M), N = Gal(M/K𝔽\_{q^h}) ⊴ G, so that G/N is cyclic of order h generated by the image φ of the q-power arithmetic Frobenius, g_M the genus of M over 𝔽\_{q^h}, and R the sum of the degrees of the closed points of X₀ ramified in M. For a conjugacy class C of G and r ≥ 1, let π\_C(r) be the number of closed points x of X₀ of degree r, unramified in M, whose arithmetic Frobenius class is C. (i) If C does not map to φ^r in G/N, then π\_C(r) = 0. (ii) If C maps to φ^r, then |r·π\_C(r) − (#C/#N)(q^r + 1)| ≤ (2g_M + r(1 + 2g_X)) q^{r/2} + r + R. (iii) Hence, for a fixed class C mapping to φ^{r₀}, as r → ∞ through r ≡ r₀ (mod h) the proportion of degree-r closed points of X₀ with Frobenius class C tends to h·#C/#G = #C/#N; for the geometric Frobenius F_x = Frob_x⁻¹ the same holds with C replaced by C⁻¹ and φ^r by φ^{−r}. For a connected finite Galois étale cover of an open U₀ ⊂ X₀ the ramified points lie in X₀ − U₀.

X₀ smooth projective geometrically connected over 𝔽\_q; M/K finite Galois (separable); r ≥ 1.

The only arithmetic input is Weil's bound for smooth projective geometrically connected curves over finite fields, applied to the twisted curves of M and to X₀ over 𝔽\_{q^d}, d | r; no L-function, no Weil II and no number-field Chebotarev theorem is used.

Atlas landmark: **Function-field Chebotarev density**.

Proof or construction:

1. (i): the Frobenius of a closed point x acts on the constants 𝔽\_{q^h} ⊂ M as the q^{deg x}-power map, so its class maps to φ^{deg x} in G/N.
2. Kosters's parametrisation: for γ ∈ G mapping to the Frobenius of the base, the rational places of K whose Frobenius set contains γ are the images of the rational places of a geometrically irreducible function field M_γ over the base field, the fixed field of the twisted Frobenius (F′, γ) in the constant extension of M, with explicit fibre cardinalities; M_γ has genus g_M (Kosters, Theorem 1.1 and Lemmas 1.3–1.4).
3. Apply this over 𝔽\_{q^r} to M𝔽\_{q^r}/K𝔽\_{q^r}, whose group is the preimage of ⟨φ^r⟩ in G and whose geometric group is N, and use Weil's bound for M_γ (EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-curves): the number of points of X₀(𝔽\_{q^r}) unramified in M with Frobenius in C differs from (#C/#N)(q^r + 1) by at most 2g_M q^{r/2} + R, summing Kosters's Corollary 1.2 over the classes of the smaller group contained in C and bounding ramified points by R.
4. A closed point of degree r gives r points of X₀(𝔽\_{q^r}), all with Frobenius in its class; points over closed points of degree d | r, d ≤ r/2, number at most Σ\_{d ≤ r/2} #X₀(𝔽\_{q^d}) ≤ r((1 + 2g_X) q^{r/2} + 1) by Weil's bound for X₀. Subtract and use #C ≤ #N to get (ii); (iii) follows because the error is O(q^{r/2}) while the main term is (#C/#N) q^r.

Acceptance checks:

- Constant extension M = K𝔽\_{q^h}: G = ℤ/h, N = 1, and the only class occurring in degree r is φ^r, with r·π\_{φ^r}(r) = r·(number of degree-r closed points) ≈ q^r.
- h = 1 (M/K geometric): the main coefficient is #C/#G, the classical density.
- Quadratic geometric extension y² = f(x) of 𝔽\_q(x), q odd, with f squarefree of degree 2g + 1: G = N = ℤ/2, and the split and inert degree-r places each have proportion tending to 1/2.
- For U₀ = 𝔾\_m and the Kummer cover t ↦ t^m (m | q − 1): the cover is a constant-field-trivial cyclic extension ramified at 0 and ∞, so R = 2 and every class of ℤ/m has density 1/m.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-curves`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [A short proof of a Chebotarev density theorem for function fields](https://arxiv.org/pdf/1404.6345v1), Theorem 1.1, Corollary 1.2, Lemmas 1.3–1.4 and their proofs, pp. 1–5 (arXiv:1404.6345v1). Parametrises the degree-one places with a given Frobenius class by the rational places of a geometrically irreducible twisted function field, and deduces over a finite field the count with main term (q + 1)/#N and error 2g√q/#N; the degree-r bound here is that statement over 𝔽\_{q^r} with the ramified and lower-degree points removed. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (6.13), p. 298. The proof of Proposition 6.6 combines Lemma 6.12 with the Čebotarev density theorem to show that the closed points with an exceptional eigenvalue have density zero; this node is the curve Čebotarev input that step needs.

Declaration id: `DeligneWeightsAndPurity:DWP.3/function-field-chebotarev`. New in this plan (moved down; formerly `FunctionFieldArithmetic:FA.5/degree-sensitive-chebotarev`).

<a id="dwp-3-exceptional-frobenius-set-has-density-zero"></a>

### The Frobenius elements landing in a Haar-null set have density zero

Let δ\_1, …, δ\_Q be ℓ-adic units. The set L of x ∈ |U₀| such that some δ\_j^{deg x} is an eigenvalue of F_x on ℱ₀ has Dirichlet density 0. More precisely, the proportion of the closed points of degree n that lie in L tends to 0 as n → ∞. In particular, for every sufficiently large n there are closed points of degree n outside L.

The atlas's completion contract for DWP.3 splits this into two steps. The first is finite-quotient Chebotarev with constant-field degree congruences (DWP.3/function-field-chebotarev, applied to the finite quotients of the ℓ-adic image). The second is the approximation of the closed Haar-null set by open neighbourhoods of small measure, proved here. Topological density alone does not give density zero.

Proof or construction:

1. For Z=∪Z_(δ\_j⁻¹) choose decreasing conjugation-invariant clopen neighborhoods C_m with intersection Z, from a cofinal family of open normal subgroups of the fixed compact ℓ-adic model H₁.
2. Conditional Haar mass a↦μ\_a(C_m∩H₁,a) is a continuous locally constant function on ℤ̂: each C_m comes from a finite quotient. The functions decrease to zero at every a because the exceptional locus is null in every degree fibre. Compactness and Dini’s theorem give uniform convergence to zero; total Haar mass zero alone would not give this uniform statement.
3. For any ε choose one finite quotient with every fibre mass <ε. The requested finite-quotient Chebotarev theorem, with constant-field congruences and its per-degree error, bounds the exceptional fraction at degree e by ε+o(1). The finitely many degree residue classes make the error uniform.
4. Let ε tend to zero. Thus #L_e=o(q^e/e); since U₀ is a geometrically connected open of ℙ¹, its degree-e closed-point count is asymptotic to q^e/e, so every sufficiently large degree has a point outside L.

Acceptance checks:

- For the pencil of plane cubics and δ = 1: 1 is an eigenvalue of F_x on ℱ₀ = H¹(E_x) iff #E_x(k(x)) = det(1 − F_x | H¹) = 0. That is impossible, since E_x has a rational point, so L = ∅.

Direct inputs: [DWP.3/haar-null-exceptional-eigenvalue-locus](#dwp-3-haar-null-exceptional-eigenvalue-locus), [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group), [DWP.3/function-field-chebotarev](#dwp-3-function-field-chebotarev), `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.13), p. 298. Density zero via Chebotarev.

Declaration id: `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-3-denominators-away-from-the-exceptional-set"></a>

### Weil I Proposition 6.6: the denominator of (6.6.1) away from K and L

Let (γ\_i)\_{i ≤ P} and (δ\_j)\_{j ≤ Q} be families of ℓ-adic units with γ\_i ≠ δ\_j. There are a finite set K of nonnegative integers different from 1 and a density-zero set L ⊂ |U₀| such that, for x ∉ L with deg x divisible by no element of K, the rational function det(1 − F_x t, ℱ₀)·∏\_i(1 − γ\_i^{deg x} t) / ∏\_j(1 − δ\_j^{deg x} t), written in lowest terms, has denominator ∏\_j(1 − δ\_j^{deg x} t).

The two exceptional sets are exactly where cancellation can happen: δ\_j^{deg x} equal to some γ\_i^{deg x} (controlled by K), or δ\_j^{deg x} an eigenvalue of F_x (controlled by L).

Proof or construction:

1. For each i and j, the n with γ\_i^n = δ\_j^n form n_{ij}ℤ with n_{ij} ≠ 1 (since γ\_i ≠ δ\_j). Let K = {n_{ij}}.
2. L = the x with some δ\_j^{deg x} an eigenvalue of F_x on ℱ₀, of density 0 (lemma exceptional-frobenius-set-has-density-zero).
3. For x ∉ L with deg x divisible by no element of K, no factor 1 − δ\_j^{deg x}t of the denominator cancels against the numerator.

Acceptance checks:

- γ = ∅, δ = (q): the denominator is 1 − q^{deg x} t unless q^{deg x} is an eigenvalue of F_x, which happens only on a density-zero set.

Direct inputs: [DWP.3/exceptional-frobenius-set-has-density-zero](#dwp-3-exceptional-frobenius-set-has-density-zero), [DWP.3/powers-of-a-family-determine-the-family](#dwp-3-powers-of-a-family-determine-the-family).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Proposition (6.6), p. 296. The denominator in lowest terms. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.13), p. 298. The proof of (6.6).

Declaration id: `DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-3-divisibility-criterion"></a>

### Weil I Proposition 6.8: an intrinsic characterisation of the γ-polynomial

Let (γ\_i)\_{i ≤ P} and (δ\_j)\_{j ≤ Q} be families of ℓ-adic units, R(t) = ∏(1 − γ\_i t) and S(t) = ∏(1 − δ\_j t). If, for every x ∈ |U₀|, ∏\_j(1 − δ\_j^{deg x} t) divides ∏\_i(1 − γ\_i^{deg x} t)·det(1 − F_x t, ℱ₀), then S(t) divides R(t). Consequently R(t) is the least common multiple of the S(t) satisfying this hypothesis, which characterises the γ-family intrinsically from the polynomials ∏(1 − γ\_i^{deg x}t)·det(1 − F_x t, ℱ₀).

The divisibility is required for every x, but it is used only for x outside the exceptional sets of Proposition 6.6.

Proof or construction:

1. Cancel common pairs γ\_i = δ\_j until the families are disjoint.
2. Proposition 6.6: for x outside K and L the denominator of (6.6.1) is ∏(1 − δ\_j^{deg x}t). But by hypothesis (6.6.1) is a polynomial, so no δ remains after cancellation: S divides R.

Acceptance checks:

- γ = (q, q), δ = (q): S | R. δ = (q²) with γ = (q): the hypothesis fails at a generic x.

Direct inputs: [DWP.3/denominators-away-from-the-exceptional-set](#dwp-3-denominators-away-from-the-exceptional-set).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Proposition (6.8), p. 297. The intrinsic characterisation of R(t).

Declaration id: `DeligneWeightsAndPurity:DWP.3/divisibility-criterion`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-3-rationality-of-pencil-local-factors"></a>

### Weil I Theorem 6.2: the local factors of the radical quotient have rational coefficients

In the setting of radical-quotient-of-the-vanishing-system, for every x ∈ |U₀|, det(1 − F_x t, ℱ₀) ∈ ℚ\[t].

No Riemann hypothesis, no purity and no semisimplicity is assumed. The proof uses only the rationality of the fibres' zeta functions, geometric constancy of the other pieces, open symplectic monodromy and Chebotarev.

The statement holds trivially for ℱ₀ = 0.

Atlas landmark: **Rationality theorem (Weil I 6.2)**.

Proof or construction:

1. By the factorization theorem it suffices to show that ∏(1 − α\_i t) and ∏(1 − β\_j t) have rational coefficients, that is, that the α-family and the β-family are defined over ℚ (6.5).
2. With (γ, δ) = (α, β), the function (6.6.1) is Z(X_x, t) ∈ ℚ(t), since n is odd. By Proposition 6.6, for x ∉ L with deg x divisible by no element of K, the denominator of Z(X_x, t) in lowest terms is ∏(1 − β\_j^{deg x}t). So the multiset (β\_j^{deg x}) is stable under Gal(ℚ̄/ℚ), and each β\_j is algebraic.
3. For σ ∈ Gal(ℚ̄/ℚ), the families (σβ\_j) and (β\_j) have the same n-th powers for every large n divisible by no element of K, because such n occur as degrees of points outside L (lemma exceptional-frobenius-set-has-density-zero). Lemma 6.7 gives (σβ\_j) = (β\_j), so ∏(1 − β\_j t) ∈ ℚ\[t] (6.9).
4. After the β-polynomial is rational, fix a closed point of positive degree e. The polynomial M_x(t)=Z(X_x,t)∏(1−β\_j^e t)=∏(1−α\_i^e t)det(1−F_x t,ℱ₀) lies in ℚ\[t]. Every α\_i^e is a reciprocal root of M_x, so every α\_i is algebraic. This supplies algebraicity before applying Galois conjugation to the α-family.
5. The polynomials M_x are rational. Proposition 6.8 characterises ∏(1−α\_i t) as the lcm of candidate S whose degree-e transforms divide every M_x. For any candidate, one positive-degree point forces each root scalar to be algebraic and an ℓ-adic unit, since M_x has only unit reciprocal roots. Therefore the unit requirement does not break Galois invariance of the intrinsic characterization: a conjugated candidate is again eligible. The α-polynomial is fixed by Gal(ℚ̄/ℚ), hence lies in ℚ\[t].
6. Hence det(1 − F_x t, ℱ₀) = Z(X_x, t)·∏(1 − β\_j^{deg x}t)/∏(1 − α\_i^{deg x}t) ∈ ℚ(t), and being a polynomial it lies in ℚ\[t].

Acceptance checks:

- Plane cubics: det(1 − F_x t, ℱ₀) = 1 − a_x t + q_x t², with a_x = q_x + 1 − #E_x(k(x)) ∈ ℤ.

Direct inputs: [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization), [DWP.3/denominators-away-from-the-exceptional-set](#dwp-3-denominators-away-from-the-exceptional-set), [DWP.3/divisibility-criterion](#dwp-3-divisibility-criterion), [DWP.3/powers-of-a-family-determine-the-family](#dwp-3-powers-of-a-family-determine-the-family), [DWP.3/exceptional-frobenius-set-has-density-zero](#dwp-3-exceptional-frobenius-set-has-density-zero).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Théorème (6.2), p. 295. Theorem 6.2: rational coefficients. [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.9), p. 297. The proof of 6.2 from 6.6–6.8.

Declaration id: `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-3-coarse-bound-for-the-pencil"></a>

### Weil I Corollary 6.3: the coarse bound on H¹(D, j_\*ℱ)

Let j : U → D be the inclusion. Every eigenvalue α of F^\* on H¹(D, j_\*ℱ) is an algebraic number, and every complex conjugate satisfies q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

This is where DWP.3 meets DWP.2. ℱ₀ satisfies the hypotheses of Theorem 3.2 with β = n: the pairing ψ from radical-quotient-of-the-vanishing-system, open symplectic monodromy (Weil I (5.10), LPV.5), and rational local factors (Theorem 6.2).

Proof or construction:

1. Theorem 3.2's hypotheses hold for ℱ₀ with β = n (Weil I (5.10) and (6.2)).
2. Apply DWP.2/coarse-bound-on-cohomology-of-the-projective-line (Corollary 3.9) with β = n: q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

Acceptance checks:

- Plane cubics (n = 1): the eigenvalues on H¹(D, j_\*ℱ) satisfy q^{1/2} ≤ |α| ≤ q^{3/2}.

Direct inputs: [DWP.3/rationality-of-pencil-local-factors](#dwp-3-rationality-of-pencil-local-factors), [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.2/fundamental-estimate-theorem-3-2](#dwp-2-fundamental-estimate-theorem-3-2), [DWP.2/coarse-bound-on-cohomology-of-the-projective-line](#dwp-2-coarse-bound-on-cohomology-of-the-projective-line), `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Corollaire (6.3), p. 295. Corollary 6.3 from (3.2) and (3.9).

Declaration id: `DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil`. From the accepted part `DeligneWeightsAndPurity--DWP.0`.

<a id="dwp-4"></a>

## DWP.4 — Weil I: dimension induction and tensor-power removal of the error

Keeps Weil I §7 and adds Weil I Theorem 1.6, moved down from WeilConjectures WC.3.

<a id="dwp-4-middle-cohomology-half-unit-bound"></a>

### The half-unit bound in even dimension

Let X₀ be smooth projective of pure even dimension d over 𝔽\_q, ℓ ≠ char 𝔽\_q. Every eigenvalue α of geometric Frobenius on Hᵈ(X,ℚ\_ℓ) is algebraic; every complex conjugate satisfies q^(d/2−1/2) ≤ |α| ≤ q^(d/2+1/2). No semisimplicity or degeneration of Leray is required. The induction retains E∩E⊥ and covers zero vanishing cycles, a zero radical quotient, and a nonzero quotient.

Atlas landmark: **Half-unit bound**.

Proof or construction:

1. First separate geometric components after a finite extension; Frobenius-power comparison returns the bound on X₀. Induct on even d, beginning with dimension zero. After a further finite extension choose a pencil, a rational smooth fibre and a smooth hyperplane section Y of that fibre; make exceptional values and vanishing-cycle signs rational.
2. Pullback from X to its blowup along the pencil axis is injective. The degree-d Leray filtration has graded subquotients of A=H²(ℙ¹,R^(d−2)f_\*ℚ\_ℓ), B=H⁰(ℙ¹,Rᵈf_\*ℚ\_ℓ), C=H¹(ℙ¹,R^(d−1)f_\*ℚ\_ℓ). This filtration suffices without any degeneration assertion.
3. Write n=d−1=2m+1. In the nonzero vanishing-cycle case the outer sheaves are geometrically constant. Weak Lefschetz identifies A with H^(d−2)(Y)(−1), and its Gysin transpose makes B a quotient of this same group. Here dim Y=d−2. The induction hypothesis gives the interval q^((d−2)/2−1/2)≤|α|≤q^((d−2)/2+1/2) before twisting; multiplying by q gives the required q^(d/2±1/2) interval. Exact purity is proved only in the following tensor-power node.
4. In the zero-cycle case B is an extension of the same constant-fibre term by skyscrapers ℚ\_ℓ(m−n)=ℚ\_ℓ(−d/2); C vanishes because Rⁿ is geometrically constant. Make the skyscrapers rational after extension, so their eigenvalues are q^(d/2).
5. For nonzero cycles with E/rad ≠0, sequences (7.1.2) and (7.1.3) give a surjection H¹(j_\*E)→C and an injection H¹(j_\*E)→H¹(j_\*(E/rad)); H¹ of the geometrically constant factors on ℙ¹ vanishes. Apply the pencil coarse bound.
6. If E⊂E⊥, retain (7.1.4) and (7.1.5): C injects into H¹(G), a quotient of the singular-fibre skyscraper sections ℚ\_ℓ(−d/2). Thus all cases give the interval. Algebraicity and all conjugates pass through extensions, subquotients and finite-field descent.

Acceptance checks:

- For d=0, Frobenius permutes geometric points and its eigenvalues are roots of unity.
- A quadric surface pencil has E=0 and singular-fibre ℚ\_ℓ(−1) terms; these give weight 2 rather than disappearing.

Direct inputs: [DWP.3/coarse-bound-for-the-pencil](#dwp-3-coarse-bound-for-the-pencil), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights`, `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.4`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §7, Lemme (7.1) and (7.1.1)–(7.1.5), pp. 298–300. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-4-middle-cohomology-purity"></a>

### Purity in the middle degree

For smooth projective X₀ of any pure dimension d over 𝔽\_q, every geometric-Frobenius eigenvalue on Hᵈ(X,ℚ\_ℓ) is a Weil q-number of weight d.

Atlas landmark: **Middle cohomology purity**.

Proof or construction:

1. For every positive even k, Künneth exhibits αᵏ as an eigenvalue on H^(kd)(Xᵏ). Apply the even-dimensional half-unit theorem to get q^(d/2−1/(2k))≤|α|≤q^(d/2+1/(2k)).
2. Algebraicity of αᵏ implies algebraicity of α; each embedding of ℚ(α) restricts to one of ℚ(αᵏ), so the inequalities hold for every conjugate. Take arbitrarily large even k to get equality.

Acceptance checks:

- A nonsemisimple Frobenius operator is permitted: Künneth uses characteristic roots, not eigenbases.
- Only even k are used; odd-dimensional X is therefore included.

Direct inputs: [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §7, Lemme (7.2), pp. 300–301; proof (7.3), p. 301. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.4/middle-cohomology-purity`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-4-smooth-projective-purity"></a>

### The Weil theorem for smooth projective varieties

For every smooth projective X₀ over 𝔽\_q and every i≥0, each eigenvalue of geometric Frobenius on Hⁱ(X,ℚ\_ℓ) is a Weil q-number of weight i. This is Weil I Lemma 1.7; integral cohomological factors and their ℓ-independence (Weil I Theorem 1.6) are DWP.4/integral-cohomological-factors.

Atlas landmark: **Weil purity theorem**.

Proof or construction:

1. After finite base extension split the finitely many geometric connected components and work with pure dimension on each. Recover the original eigenvalues from their powers.
2. By Poincaré duality it suffices to handle i≤d. For i<d, successive smooth hyperplane sections and weak Lefschetz inject degree i into the middle cohomology of a smooth projective section of dimension i. Apply middle purity; duality supplies degrees above d.

Acceptance checks:

- H^(2r)(ℙᴺ)=ℚ\_ℓ(−r), with eigenvalue qʳ and weight 2r; odd degrees vanish.
- Components not defined over 𝔽\_q are handled by permutation Frobenius before any point-count main term is identified.
- Smooth proper nonprojective varieties require DWP.7; this theorem asserts projectivity.

Direct inputs: [DWP.4/middle-cohomology-purity](#dwp-4-middle-cohomology-purity), `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-under-subquotients-and-extensions`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights`, `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §1, Lemme (1.7), p. 276; §7, Lemme (7.2) and proof (7.3), pp. 300–301. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-4-integral-cohomological-factors"></a>

### Weil I, Theorem 1.6: integral, ℓ-independent factors of a smooth projective variety

Let X₀ be a smooth projective variety over 𝔽\_q, not assumed geometrically connected, X = X₀ ⊗ 𝔽̄\_q, and F the geometric Frobenius. For each i there is a unique Π\_i ∈ 1 + tℤ\[t] such that, for every prime ℓ ≠ p, the image of Π\_i in ℚ\_ℓ\[t] is det(1 − tF | H^i(X, ℚ\_ℓ)). Its degree is b_i = dim H^i(X, ℚ\_ℓ), so the Betti numbers b_i do not depend on ℓ; its reciprocal roots are algebraic integers and Weil q-numbers of weight i; the Π\_i are pairwise coprime; and Z(X₀, t) = ∏\_i Π\_i^{(−1)^{i+1}} is the reduced presentation of the zeta function, with numerator ∏\_{i odd} Π\_i and denominator ∏\_{i even} Π\_i. Frobenius semisimplicity is not part of the conclusion.

X₀ smooth and projective over 𝔽\_q; geometric connectedness is not needed.

ℓ ≠ p; F is the geometric Frobenius, acting invertibly on each H^i.

The purity input is DWP.4/smooth-projective-purity, proved without Weil II; this is Weil I's route, before DWP.7.

Atlas landmark: **Integrality and ℓ-independence of Weil factors**.

Proof or construction:

1. The Euler product shows Z(X₀, t) ∈ 1 + tℤ\[\[t]], and the Grothendieck trace formula gives Z(X₀, t) = ∏\_i det(1 − tF | H^i(X, ℚ\_ℓ))^{(−1)^{i+1}} in ℚ\_ℓ(t) (Weil I (1.5.4); SchemeAndStackFoundations:SF.2). So Z(X₀, t) lies in ℤ\[\[t]] ∩ ℚ\_ℓ(t), hence in ℚ(t), with coprime A, B ∈ 1 + tℤ\[t] (DWP.0/rational-zeta-descent-and-fatou (a), (c)).
2. Each P_i := det(1 − tF | H^i) has degree b_i because F is invertible, and its reciprocal roots are the eigenvalues of F, Weil q-numbers of weight i by DWP.4/smooth-projective-purity.
3. DWP.0/weight-separated-factor-extraction with L = ℚ\_ℓ gives a unique Π\_i ∈ 1 + tℤ\[t] with image P_i, with algebraic integer reciprocal roots, and part (4) of that theorem shows Π\_i is the same for every ℓ ≠ p. The reduced presentation is part (1).

Acceptance checks:

- ℙⁿ: Π\_{2i} = 1 − q^i t for 0 ≤ i ≤ n and Π\_{2i+1} = 1.
- Elliptic curve E/𝔽\_7, y² = x³ + x + 1: Π\_0 = 1 − t, Π\_1 = 1 − 3t + 7t², Π\_2 = 1 − 7t, and the trace formula gives #E(𝔽\_7) = 1 + 7 − 3 = 5.
- X₀ = ℙ¹\_{𝔽\_{q²}} regarded over 𝔽\_q (two geometric components swapped by Frobenius): Π\_0 = 1 − t², Π\_2 = 1 − q²t², Π\_1 = 1; the degrees are b_0 = b_2 = 2.
- No complex fibre or characteristic-zero lift is used, and two primes ℓ, ℓ′ ≠ p give the same integer polynomial.

Direct inputs: [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), [DWP.0/rational-zeta-descent-and-fatou](#dwp-0-rational-zeta-descent-and-fatou), [DWP.0/weight-separated-factor-extraction](#dwp-0-weight-separated-factor-extraction), `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Théorème (1.6), p. 276; proof of (1.7) ⇒ (1.6), pp. 276–277. Theorem 1.6 asserts that for a smooth projective variety over 𝔽\_q the characteristic polynomial of Frobenius on each H^i has integer coefficients independent of ℓ and complex roots of absolute value q^{i/2}; the text deduces it from Lemma 1.7 by the rationality, Fatou and Galois-stability argument.

Declaration id: `DeligneWeightsAndPurity:DWP.4/integral-cohomological-factors`. New in this plan (moved down; formerly `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`).

<a id="dwp-5"></a>

## DWP.5 — Weil II local weights and the analytic preparation

Keeps the nonarchimedean (Newton-polygon) local bounds and the abstract degree equidistribution; Weil sheaves, purity, determinantal weights, local monodromy weights, majoration, Hadamard–de la Vallée-Poussin and the compact form are imported from EDC.7.

Imported from EtaleDualityAndPerverseSheaves EDC.7 (owner since the accepted transfer of 2026-10-14):

- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-group` — The Weil group of a finite-field scheme (formerly `DWP.5/weil-group`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-sheaf` — Weil sheaves and étale descent (formerly `DWP.5/weil-sheaf`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness` — Punctual purity and finite mixed filtrations (formerly `DWP.5/punctual-purity-and-mixedness`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-real-sheaves` — Totally real and ι-real sheaves (formerly `DWP.5/real-sheaves`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` — Finite geometric monodromy and rank-one normalization (formerly `DWP.5/rank-one-normalization`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-determinantal-weights` — Determinantal weights of irreducible constituents (formerly `DWP.5/determinantal-weights`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` — Unipotent radical and central degree in Weil monodromy (formerly `DWP.5/geometric-monodromy-and-central-degree`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-determinantal-weight-functoriality` — Functoriality of determinantal weights (formerly `DWP.5/determinantal-weight-functoriality`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-generalized-majoration` — Deligne’s generalized majoration theorem (formerly `DWP.5/generalized-majoration`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-initial-curve-and-boundary-bounds` — Initial cohomological and boundary weight bounds (formerly `DWP.5/initial-curve-and-boundary-bounds`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-monodromy-purity` — The local weight–monodromy theorem on a curve (formerly `DWP.5/local-monodromy-purity`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` — Boundary mixedness and extension of purity (formerly `DWP.5/local-weight-corollaries`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-specialization-of-monodromy` — Specialization of geometric monodromy (formerly `DWP.5/specialization-of-monodromy`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-hadamard-de-la-vallee-poussin` — The abstract Hadamard–de la Vallée-Poussin theorem (formerly `DWP.5/hadamard-de-la-vallee-poussin`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` — The compact form of Weil monodromy (formerly `DWP.5/compact-weil-form`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-strict-initial-h1-bound` — The strict initial H¹ bound (formerly `DWP.5/strict-initial-h1-bound`).

<a id="dwp-5-stalk-newton-polygon"></a>

### Newton polygons of Frobenius stalks

Fix a rational-valued additive nonarchimedean valuation v on the coefficient algebraic closure normalized by v(p)=1. For a rank-r closed stalk at x with geometric Frobenius eigenvalues α₁,…,αᵣ, let s₁≤…≤sᵣ be v(αᵢ)/v(N(x)), counted with multiplicity. Its Newton polygon has vertices (k,Σ\_{i≤k}sᵢ), k=0,…,r, and linear interpolation. Equivalently the kth ordinate is the minimum normalized valuation of products of k distinct eigenvalue positions, the spectrum of the kth exterior power. This is the stalk specialization of the general Newton-polygon convention, not a new p-adic cohomology theory.

Uses:

- [DWP.5/nonarchimedean-boundary-bounds](#dwp-5-nonarchimedean-boundary-bounds): states specialization and the nilpotence bound
- `PadicDifferentialEquationsAndRigidCohomology:RD.6`: shares normalized slope conventions without duplicating F-isocrystals

API:

- `TauCeti.Weights.stalkNewtonPolygon` (constructor): The cumulative-slope polygon normalized by v(N(x)).
- `TauCeti.Weights.stalkNewtonPolygon_zero` (simp): The origin is (0,0); rank zero has the single origin.
- `TauCeti.Weights.stalkNewtonPolygon_endpoint` (characterisation): The endpoint is (r,v(det F_x)/v(N(x))).
- `TauCeti.Weights.stalkNewtonPolygon_exterior` (characterisation): The kth ordinate is the minimum normalized valuation of kth exterior eigenvalues.
- `TauCeti.Weights.stalkNewtonPolygon_baseExtension` (compatibility): Finite residue-field extension leaves the polygon unchanged.
- `TauCeti.Weights.stalkNewtonPolygon_tateTwist` (compatibility): Twisting by a adds −a to every normalized slope.

Unit tests:

- `TauCeti.Weights.newton_two_slopes` (computation): The point module diag(1,q) has vertices (0,0),(1,0),(2,1).
- `TauCeti.Weights.newton_empty` (degenerate): Rank zero has only (0,0).
- `TauCeti.Weights.newton_base_extension` (compatibility): Replacing diag(1,q) by diag(1,q²) over 𝔽\_(q²) retains slopes 0,1, not 0,2.

Proof or construction:

1. Order the finite multiset of normalized slopes, take cumulative sums, and interpolate. The exterior-power spectrum supplies the minimum-product characterization, including repeated eigenvalues and k=0.

Acceptance checks:

- Frobenius powers and the residue-cardinality powers cancel in normalized slopes.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`, `mathlib:AddValuation`, `mathlib:Multiset.sort`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-eigenvalues-of-exterior-powers`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.10 (1.10.6), p. 183. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.5/stalk-newton-polygon`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-5-nonarchimedean-boundary-bounds"></a>

### Nonarchimedean bounds at the boundary

Fix an embedding ι of the coefficient field into an algebraically closed nonarchimedean valued field of characteristic zero. For a lisse Weil sheaf on a smooth curve, a normalized nonarchimedean bound b^(deg x)≤|ια|≤c^(deg x) at closed points extends to every eigenvalue of its local boundary Weil representations. Generic ℓ′-adic units remain units at the boundary. For valuations with v(p)>0, if almost all stalk Newton polygons agree, the boundary polygon lies on or above that polygon with the same endpoint. If local normalized slopes lie in \[β,γ], N^(⌊γ−β⌋+1)=0.

Proof or construction:

1. The upper bound for j_\* follows from the analytic local-factor/boundary argument applied to an absolute value, as in (1.10.1). Extend from invariants to all monodromy strings using |q|≤1; use the dual for the lower bound.
2. Use exterior powers to turn all cumulative-slope inequalities into the absolute-value inequalities. Rank-one determinant normalization fixes the endpoint.
3. N lowers the normalized Frobenius slope by one; a string longer than γ−β cannot fit in the allowed interval.

Acceptance checks:

- A split ordinary rank-two module has slopes 0,1; specialization can give slopes 1/2,1/2, whose polygon lies above the ordinary one.
- Unit bounds are a separate nonarchimedean statement; real purity alone does not imply them.

Direct inputs: [DWP.5/stalk-newton-polygon](#dwp-5-stalk-newton-polygon), `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-monodromy-purity`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-eigenvalues-of-exterior-powers`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.10 (1.10.1)–(1.10.9), pp. 182–184. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.5/nonarchimedean-boundary-bounds`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-5-abstract-degree-equidistribution"></a>

### Character decay and degree-fibre equidistribution

In the abstract compact-by-ℤ setting, add hypotheses (C) of (2.1.10): all irreducible Euler products are nonvanishing and holomorphic on Re(s)≥1 except the simple trivial norm-character pole; and (D): norms are powers of q. Fix a positive-degree central element z of degree d. The translated, normalized prime-power Dirac measures on degree nd+i conjugacy fibres converge weakly to the pushforward of normalized Haar on the corresponding degree-i fibre. The measures count powers with their degree weights; replacing them with rational-point Frobenius classes requires the actual identity (3.5.2.1).

Proof or construction:

1. Subtract the Haar main term from the negative logarithmic-derivative measure. The trivial factor cancels its unique pole, so its Fourier–Laplace transform extends holomorphically past the convergence boundary.
2. For each nontrivial irreducible character, Cauchy coefficient estimates on a disk of radius greater than one give exponential decay of the normalized degree coefficients after central translation.
3. Use compact-group character density and bounded total mass to pass from characters to continuous class functions. Retain degree residue classes modulo d.

Acceptance checks:

- An average over all degrees does not replace convergence in a fixed degree progression.
- Constant test function 1 verifies mass normalization on each fibre.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-hadamard-de-la-vallee-poussin`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.1 (2.1.10)–(2.1.13), pp. 191–192. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.5/abstract-degree-equidistribution`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-6"></a>

## DWP.6 — Pure local systems on curves and the square-improvement argument

Keeps the compact-support bound on curves; sharp curve purity (Weil II 3.2.3) and square improvement are imported from EDC.7.

Imported from EtaleDualityAndPerverseSheaves EDC.7 (owner since the accepted transfer of 2026-10-14):

- `EtaleDualityAndPerverseSheaves:EDC.7/weight-coefficient-specific-vanishing-cycles` — Vanishing cycles with unipotent boundary coefficients (formerly `DWP.6/coefficient-specific-vanishing-cycles`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-real-cohomological-factors` — Reality of curve cohomological factors (formerly `DWP.6/real-cohomological-factors`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-square-improvement` — Square improvement on the product of a curve (formerly `DWP.6/square-improvement`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-sharp-curve-purity` — Purity of parabolic curve cohomology (formerly `DWP.6/sharp-curve-purity`).

<a id="dwp-6-compact-support-curve-bound"></a>

### Compact-support bounds for pure curve coefficients

For a smooth finite-field curve U₀ and lisse punctually ι-pure real-weight-β ℱ₀, Hⁱ\_c(U,ℱ) has only ι-weights ≤β+i, for i=0,1,2. For integer purity, these are algebraic integer-weight bounds for every complex conjugate. The parabolic image in degree one is pure β+1, while the extra boundary contribution has weights ≤β.

Atlas landmark: **Curve cohomology weight bound**.

Proof or construction:

1. Choose the smooth projective compactification. Local monodromy bounds j_\*ℱ at the boundary by β. The exact sequence H⁰(boundary)→H¹\_c(U,ℱ)→H¹(C,j_\*ℱ) gives the required degree-one upper bound.
2. On affine components H⁰\_c=0; on proper components H⁰ is the invariant space of weight β. H²\_c is the coinvariant space (−1), of weight β+2. Handle components and finite base extension explicitly.
3. This curve theorem is the input to the geometric dévissage of general Rf_! in DWP.7, whose proof is imported there rather than duplicated here.

Acceptance checks:

- For ℚ\_ℓ on 𝔾\_m, H¹\_c has weight 0 and H²\_c has weight 2; H¹\_c is not pure of weight 1.
- The result is valid for real ι-weights, not only integral weights.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-sharp-curve-purity`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-under-subquotients-and-extensions`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 (3.2.3); §3.3 proof of (3.3.1), pp. 200, 204–205. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.6/compact-support-curve-bound`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-7"></a>

## DWP.7 — The fundamental direct-image theorem and sharp cohomological bounds

Keeps integral sheaves, Deligne’s integrality theorem, the cohomological bounds, Newton couples and triangles and proper smooth purity; Weil II 3.3.1 and its reduction are imported from EDC.7. Adds stack purity moved down from WeilConjectures WC.6, with one recorded gap.

Imported from EtaleDualityAndPerverseSheaves EDC.7 (owner since the accepted transfer of 2026-10-14):

- `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness` — Punctual purity and finite mixed filtrations (formerly `DWP.7/weights-mixed-sheaves-definitions`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-spreading-out-to-a-tame-relative-curve` — Reduction of the direct-image theorem to a tame smooth projective relative curve (formerly `DWP.7/devissage-in-the-sheaf-and-the-source`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-spreading-out-to-a-tame-relative-curve` — Reduction of the direct-image theorem to a tame smooth projective relative curve (formerly `DWP.7/devissage-in-the-target`, absorbed as a proof step).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-tame-cover-of-a-lisse-sheaf-on-a-curve` — Generic smoothness and tame covers of a lisse sheaf on a curve (Weil II (α), (β)) (formerly `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-spreading-out-to-a-tame-relative-curve` — Reduction of the direct-image theorem to a tame smooth projective relative curve (formerly `DWP.7/spreading-out-to-a-tame-relative-curve`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-of-the-relative-curve-case` — The direct-image theorem for a tame smooth projective relative curve (formerly `DWP.7/purity-of-the-relative-curve-case`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-fundamental-direct-image-theorem-3-3-1` — Deligne's fundamental theorem: R^i f_! of a mixed sheaf of weights ≤ n has weights ≤ n + i (formerly `DWP.7/fundamental-direct-image-theorem-3-3-1`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-mixed-direct-image-3-3-10` — The direct-image theorem for ι-mixed sheaves with real weights (formerly `DWP.7/iota-mixed-direct-image-3-3-10`).

<a id="dwp-7-integral-sheaf"></a>

### Integral sheaves

Let X be a scheme of finite type over ℤ\[1/ℓ]. A sheaf ℱ on X is integral (entier) when, for every closed point x ∈ |X|, every eigenvalue of the geometric Frobenius F_x on the stalk ℱ\_x̄ is integral over ℤ. For a finite-dimensional ℚ̄\_ℓ-space V with an endomorphism F the analogous predicate is: (V, F) is integral when every root of det(T − F) in ℚ̄\_ℓ is integral over ℤ; a sheaf on Spec 𝔽\_q is integral exactly when its geometric-Frobenius module is. Integrality is a condition separate from purity: ℚ̄\_ℓ(1) is pure of weight −2 and not integral.

X of finite type over ℤ\[1/ℓ]; ℚ̄\_ℓ coefficients

Integral over ℤ, not over ℤ\_ℓ: ℓ-adic integrality of the eigenvalues is automatic for étale sheaves and is not what is meant

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses:

- Weil II Corollaire (3.3.3), p. 205: the integral refinement of the direct-image theorem: weights of R^i f_!ℱ lie between 0 and n+i, and between 2(i−d) and n+i above the fibre dimension
- Weil II Corollaire (3.3.4), p. 206: the lower bounds w ≥ 0 and w ≥ 2(i−d) for H^i_c of an integral sheaf over 𝔽\_q
- Weil II (3.3.7)–(3.3.8), p. 206: the p-adic couples (r, s) of an integral eigenvalue are ≥ 0, which places them in the triangles
- [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi): the integrality theorem is a statement about this predicate on R^i f_!ℱ and on R^i f_!ℱ(i−d)
- `FiniteFieldsAndCharacterSums:FF.2/deligne-estimate-for-character-sums`: character sheaves L_ψ(f) ⊗ L_χ(g) are integral (their Frobenius traces are sums of roots of unity), so their H^i_c have weights ≥ 0

API:

- `TauCeti.Weights.IsIntegralEnd` (data): IsIntegralEnd (F : V →ₗ\[E] V) : Prop := ∀ α ∈ eigenvalues F, IsIntegral ℤ α, for E a field of characteristic 0 and V finite-dimensional, with eigenvalues F the DWP.0 multiset of roots of the characteristic polynomial in an algebraic closure.
- `TauCeti.Weights.IsIntegralSheaf` (data): IsIntegralSheaf ℱ : Prop := ∀ x ∈ |X|, IsIntegralEnd (F_x acting on ℱ\_x̄).
- `TauCeti.Weights.isIntegralEnd_iff_charpoly` (characterisation): IsIntegralEnd F ↔ every root of det(T − F) in an algebraic closure is integral over ℤ; when det(T − F) has rational coefficients this holds iff it has integer coefficients.
- `TauCeti.Weights.IsIntegralEnd.of_extension` (other): For an F-stable subspace W ⊆ V: IsIntegralEnd F ↔ IsIntegralEnd (F|W) ∧ IsIntegralEnd (F on V/W).
- `TauCeti.Weights.IsIntegralEnd.pow` (other): IsIntegralEnd F → IsIntegralEnd (F ^ r) for r ≥ 1, and conversely: an algebraic number with an integral power is integral.
- `TauCeti.Weights.IsIntegralEnd.tensor` (other): IsIntegralEnd F → IsIntegralEnd G → IsIntegralEnd (F ⊗ G).
- `TauCeti.Weights.IsIntegralSheaf.comap` (functoriality): Pullback along any morphism of schemes of finite type over ℤ\[1/ℓ] preserves integrality.
- `TauCeti.Weights.IsIntegralSheaf.finite_pushforward` (functoriality): Direct image along a finite morphism preserves integrality.
- `TauCeti.Weights.IsIntegralSheaf.twist_neg` (simp): ℱ integral and m ≥ 0 ⇒ ℱ(−m) integral; the converse fails for m > 0.
- `TauCeti.Weights.IsIntegralSheaf.weights_nonneg` (relation): An integral mixed sheaf has all punctual weights ≥ 0 (Weil II 3.3.2): the norm of an integral Weil q-number of weight n and degree d is a nonzero integer of absolute value q^{nd/2} (EDC.7/weight-weil-number-arithmetic (iv)).
- `TauCeti.Weights.IsIntegralSheaf.constant` (example): The constant sheaf ℚ̄\_ℓ is integral; so is every sheaf ℱ whose Frobenius traces at all closed points of all finite extensions are algebraic integers.

Unit tests:

- `TauCeti.Weights.isIntegralEnd_tate_neg_one` (computation): On Spec 𝔽\_q, ℚ̄\_ℓ(−1) (F acts by q) is integral: q is an algebraic integer.
- `TauCeti.Weights.not_isIntegralEnd_tate_one` (non-example): On Spec 𝔽\_q, ℚ̄\_ℓ(1) (F acts by q⁻¹) is not integral although it is punctually pure of weight −2: purity does not imply integrality.
- `TauCeti.Weights.not_isIntegralEnd_weight_zero` (non-example): For ℓ ≠ 5, the rank-one Weil sheaf on Spec 𝔽\_q on which F acts by b = (3 + 4i)/5 is punctually pure of weight 0 (every complex conjugate of b has absolute value 1) but not integral: b is not an algebraic integer. A definition 'integral = weights ≥ 0' fails this test.
- `TauCeti.Weights.isIntegralEnd_zero` (degenerate): The zero sheaf, and the zero Frobenius module, are integral.
- `TauCeti.Weights.isIntegralEnd_jordan` (computation): The Frobenius module (ℚ̄\_ℓ², \[\[q, 1], \[0, q]]) is integral: integrality reads the characteristic polynomial (T − q)², not a diagonal form.

Proof or construction:

1. Define the stalkwise predicate on Frobenius modules first, through the eigenvalue multiset of EDC.7/weight-endomorphism-weights, and the sheaf predicate as its conjunction over |X|.
2. Stability under subsheaves, quotients and extensions: the eigenvalue multiset of an extension is the union of those of sub and quotient (EDC.7/weight-endomorphism-weights via EDC.7/weight-purity-under-subquotients-and-extensions).
3. Pullback along g : Y → X: for y ∈ |Y| over x, F_y acts on (g\*ℱ)\_ȳ = ℱ\_x̄ as F_x^{\[k(y):k(x)]}; powers of algebraic integers are algebraic integers. Finite direct image: the stalk of f_\*ℱ at y is the sum of the induced modules of the stalks at the points over y, whose Frobenius eigenvalues are roots of the eigenvalues at those points (EDC.7/weight-spectra-of-polynomials-in-an-endomorphism), and roots of algebraic integers are algebraic integers.
4. Tensor products: eigenvalues multiply (EDC.7/weight-spectra-of-tensor-products-and-duals). Twist ℱ(−m), m ≥ 0: eigenvalues multiply by N(x)^m.

Acceptance checks:

- The predicate depends only on the eigenvalue multisets at closed points, hence is invariant under change of the geometric points and of the algebraic closure.
- Weil II 3.3.2: an integral mixed sheaf has all punctual weights ≥ 0 (api IsIntegralSheaf.weights_nonneg).

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-under-subquotients-and-extensions`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-polynomials-in-an-endomorphism`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.3, (3.3.2), p. 205. Definition of integral sheaves and the nonnegativity of their weights (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.7/integral-sheaf`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-7-deligne-integrality-theorem-sga7-xxi"></a>

### Deligne's integrality theorem (SGA 7 XXI 5.2.2)

Let f : X → Y be a separated morphism of schemes of finite type over ℤ\[1/ℓ] whose fibres have dimension ≤ d, and ℱ an integral sheaf on X (DWP.7/integral-sheaf). Then for every i the sheaf R^i f_!ℱ is integral, and for i ≥ d the twist R^i f_!ℱ(i − d) is integral: at every closed point y of Y, every eigenvalue α of F_y on (R^i f_!ℱ)\_ȳ is an algebraic integer, and for i ≥ d the number α/N(y)^{i−d} is an algebraic integer.

ℱ integral; fibre dimension ≤ d

Constant coefficients ℚ̄\_ℓ are integral, so the theorem applies to H^i_c(X, ℚ̄\_ℓ)

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Proper base change for Rf_! reduces each closed stalk to H^i_c of a fibre over a finite field, of dimension ≤ d (SF.2). A constructible ℚ̄\_ℓ-sheaf is defined over a finite coefficient extension A/ℚ\_ℓ (EDC.0); work there and extend coefficients at the end. SGA 7 XXI §5 takes a completion of a number field at ℓ and T-integrality; take T empty.
2. SGA 7 XXI Lemma 5.2.1: H⁰\_c⊂H⁰ injects into H⁰ of a suitable finite closed subscheme, by stratification and evaluation on finitely many stalks. For dim X ≤ d, discard a smaller-dimensional closed subset to obtain a smooth lisse dense open without changing H^{2d}\_c. Poincaré duality transposes the injective evaluation map for the dual sheaf into a surjection H⁰(Y, ℱ)(−d) → H^{2d}\_c(X, ℱ) for suitable finite Y. These prove integrality of F and q^{d−i}F at i = 0 and i = 2d (EDC.0, EDC.2).
3. Dimension one: the Euler product L(X, ℱ, t) has algebraic-integer coefficients, since each closed-point Frobenius has integral eigenvalues. By the trace formula and cohomological dimension ≤ 2, L = det(1−Ft,H¹\_c)/(det(1−Ft,H⁰\_c) det(1−Ft,H²\_c)). The endpoint factors are integral by the preceding step, so det(1−Ft,H¹\_c) has integral coefficients and its reciprocal roots are integral. This is 5.2.2 for curves; dimension zero is evaluation on finite points.
4. Induct on d. By localisation remove a closed subset of dimension < d, handled by induction; on a dense open choose a morphism to a curve with fibres of dimension ≤ d−1. Proper base change and induction show R^qf_!ℱ and R^qf_!ℱ(q−(d−1)) integral on that curve. The curve case makes E₂^{p,q}=H^p_c(Y,R^qf_!ℱ) integral, and also E₂^{p,q}(p+q−d) integral: apply the curve case to the twisted coefficient sheaf. The Leray spectral sequence gives the same two conclusions on H^{p+q}\_c(X,ℱ), since integrality is stable under subquotients and extensions.
5. If an induction stratum has dimension e < d, its stronger twist i−e implies the desired twist i−d by a nonnegative power of q; negative Tate twists preserve integrality. Therefore the fibrewise proof gives exactly the displayed relative statement (indeed the source gives both conclusions for all i).

Acceptance checks:

- Acceptance: X₀ = ℙ¹, ℱ₀ = ℚ̄\_ℓ, d = 1: the eigenvalue q on H² satisfies q/q^{2−1} = 1 integral.
- Acceptance: X₀ = 𝔾\_m (d = 1), H²\_c = ℚ̄\_ℓ(−1): q/q = 1; H¹\_c: eigenvalue 1, integral.
- Non-example: for ℱ₀ = ℚ̄\_ℓ(1), which is not integral, H⁰\_c(Spec 𝔽\_q, ℱ₀) has eigenvalue q⁻¹: the hypothesis on ℱ cannot be dropped.

Direct inputs: [DWP.7/integral-sheaf](#dwp-7-integral-sheaf), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-sheaf`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, proof of Corollaire (3.3.3), p. 205. Weil II cites the relative fibrewise consequence; the original proof in SGA 7 XXI §5 is independently read below. [SGA 7 II, Exposé XXI: Le niveau de la cohomologie des intersections complètes; §5 Appendix on integrality](https://web.math.princeton.edu/~nmk/old/niveaucoho.pdf), Exposé XXI, §5, Lemma 5.2.1 and Théorème 5.2.2, pp. 384–387. Original statement, with mathematical notation normalised; take T empty. The proof uses the endpoint lemma, Euler product for curves, and dimension induction with Leray.

Declaration id: `DeligneWeightsAndPurity:DWP.7/deligne-integrality-theorem-sga7-xxi`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-7-integral-weight-bounds-3-3-3"></a>

### Weights of R^i f_! of an integral mixed sheaf lie between 0 (or 2(i − d)) and n + i

Let f : X → Y be a separated morphism of schemes of finite type over ℤ\[1/ℓ] whose fibres have dimension ≤ d, and ℱ an integral sheaf on X, mixed of weights ≤ n. Then for every i, R^i f_!ℱ is mixed with all punctual weights in \[0, n + i]; if i > d, all punctual weights lie in \[2(i − d), n + i].

ℱ integral and mixed (integer weights)

d bounds the dimension of every fibre of f

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Upper bound: EDC.7/weight-fundamental-direct-image-theorem-3-3-1.
2. Lower bound 0: R^i f_!ℱ is integral (DWP.7/deligne-integrality-theorem-sga7-xxi) and mixed, so its weights are ≥ 0 (api IsIntegralSheaf.weights_nonneg).
3. Lower bound 2(i − d) for i > d: R^i f_!ℱ(i − d) is integral and mixed with weights shifted by −2(i − d), hence ≥ 0.

Acceptance checks:

- Acceptance: X₀ = ℙ¹ (d = 1), i = 2: the weight 2 lies in \[2(2 − 1), 0 + 2] = {2}.
- Acceptance: X₀ = 𝔾\_m (d = 1), i = 1: weight 0 ∈ \[0, 1].
- Non-example: for the non-integral sheaf ℚ̄\_ℓ(1) on Spec 𝔽\_q the weight −2 is negative.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-fundamental-direct-image-theorem-3-3-1`, [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi), [DWP.7/integral-sheaf](#dwp-7-integral-sheaf).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.3), p. 205. Statement (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.7/integral-weight-bounds-3-3-3`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-7-cohomological-bounds-3-3-2-3-3-6"></a>

### Weight bounds for H^i_c and H^i over a finite field, and purity of the image H^i_c → H^i

Let X₀ be a scheme of finite type over 𝔽\_q, X = X₀ ⊗ 𝔽̄\_q. (i) (Weil II 3.3.4) If ℱ₀ is mixed of weights ≤ n (a Weil sheaf being allowed), then H^i_c(X, ℱ) is mixed of weights ≤ n + i: every eigenvalue α of F is algebraic, with an integer w ≤ n + i such that every complex conjugate of α has absolute value q^{w/2}. If ℱ₀ is integral then w ≥ 0, and if moreover i > d = dim X₀ then w ≥ 2(i − d). (ii) (3.3.5) If X₀ is smooth and ℱ₀ is lisse and mixed of weights ≥ n, then H^i(X, ℱ) is mixed of weights ≥ n + i. (iii) (3.3.6) If X₀ is smooth and ℱ₀ is lisse and punctually pure of weight n, then the image of H^i_c(X, ℱ) → H^i(X, ℱ) is pure of weight n + i. (iv) (3.3.10) For a fixed ι, (i) without its integral clauses, (ii) and (iii) hold with 'mixed' replaced by 'ι-mixed', n by β ∈ ℝ and weights read as ι-weights.

(ii) and (iii) need X₀ smooth and ℱ₀ lisse: they rest on Poincaré duality

The integral clauses of (i) need ℱ₀ integral

(iv) is a statement at one ι; it does not give integer weights

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (i) is the case Y = Spec 𝔽\_q of EDC.7/weight-fundamental-direct-image-theorem-3-3-1 and DWP.7/integral-weight-bounds-3-3-3.
2. (ii) Reduce to X₀ of pure dimension N (components). The dual ℱ₀^∨ is lisse and mixed of weights ≤ −n. By (i), H^{2N−i}\_c(X, ℱ^∨)(N) is mixed of weights ≤ −n + (2N − i) − 2N = −n − i (reading ℱ^∨ in the printed proof, PAPER-DELIGNE-80/E45). Poincaré duality (EDC.2) gives a Frobenius-equivariant perfect pairing H^i(X, ℱ) × H^{2N−i}\_c(X, ℱ^∨)(N) → ℚ̄\_ℓ, so the eigenvalues on H^i(X, ℱ) are the inverses of those on H^{2N−i}\_c(X, ℱ^∨)(N) (EDC.7/weight-reciprocal-pairing-of-eigenvalues) and have weights ≥ n + i.
3. (iii) The image is a quotient of H^i_c (weights ≤ n + i by (i)) and a subspace of H^i (weights ≥ n + i by (ii)), hence pure of weight n + i (EDC.7/weight-purity-under-subquotients-and-extensions).
4. (iv) Use EDC.7/weight-iota-mixed-direct-image-3-3-10 in place of 3.3.1; the duality step is unchanged.

Acceptance checks:

- Acceptance: X₀ = 𝔾\_m, ℱ₀ = ℚ̄\_ℓ: H¹\_c has weight 0 ≤ 1, H¹ = ℚ̄\_ℓ(−1) has weight 2 ≥ 1, and the image H¹\_c → H¹ is 0 (pure of weight 1 vacuously).
- Acceptance: X₀ = 𝔸¹ minus the two points of a quadratic extension of 𝔽\_q (a closed point of degree 2), ℱ₀ = ℚ̄\_ℓ: H¹ has weight 2 with F-eigenvalues q and −q.
- Non-example (smoothness): for the nodal cubic X₀ (projective, singular) and ℱ₀ = ℚ̄\_ℓ, H¹(X) = H¹\_c(X) = ℚ̄\_ℓ has weight 0 < 1: the lower bound (ii) fails without smoothness, although every stalk of ℱ₀ is pure of weight 0.
- Non-example (lissity): on the smooth proper ℙ¹ with ℱ₀ = j_!ℚ̄\_ℓ for j : 𝔾\_m → ℙ¹ (every stalk is of weight 0 or zero), H¹(ℙ¹, ℱ) = H¹\_c(𝔾\_m) = ℚ̄\_ℓ has weight 0 < 0 + 1: (ii) needs ℱ₀ lisse.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-fundamental-direct-image-theorem-3-3-1`, [DWP.7/integral-weight-bounds-3-3-3](#dwp-7-integral-weight-bounds-3-3-3), `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-mixed-direct-image-3-3-10`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-reciprocal-pairing-of-eigenvalues`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-under-subquotients-and-extensions`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.4), p. 206. Read from the page image. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaires (3.3.5) et (3.3.6), p. 206. Corollary 3.3.6, read from the page image; 3.3.5 is stated just above it with the same smooth/lisse hypotheses. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.10), p. 207. The ι-forms (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-7-newton-couples-3-3-7"></a>

### The p-adic couple of a pure algebraic number

Let q = p^f, n ∈ ℤ, and α an algebraic number which is a Weil q-number of weight n (DWP.0). Let K be a number field containing α and v a valuation of K above p, normalised by v(q) = 1, extended to v : K → ℚ ∪ {∞}. The couple of α at v is (r, s) = (v(α), v(q^n α⁻¹)). Here q^n α⁻¹ ∈ K, and under every embedding σ : K → ℂ it maps to the complex conjugate of σ(α) (EDC.7/weight-weil-number-arithmetic (iii)); so q^n α⁻¹ has the same minimal polynomial over ℚ as α, i.e. it is a Galois conjugate of α. Always r + s = n; if α is integral over ℤ then r ≥ 0 and s ≥ 0.

α a Weil q-number of integer weight n

v normalised by v(q) = 1, not by v(p) = 1

Uses:

- Weil II Corollaire (3.3.8), p. 206: locates the couples of Frobenius eigenvalues of H^i_c and of H^i (X smooth) in triangles
- [DWP.7/valuation-triangles-3-3-8](#dwp-7-valuation-triangles-3-3-8): the triangle inequalities are statements about r and s
- Weil II (3.3.7): Newton-polygon slopes of Frobenius: r is the slope of α at v, s that of its complex conjugate

API:

- `TauCeti.Weights.newtonCouple` (data): newtonCouple (v : AddValuation K (WithTop ℚ)) (q : K) (n : ℤ) (α : K) : WithTop ℚ × WithTop ℚ := (v α, v (q ^ n \* α⁻¹)).
- `TauCeti.Weights.newtonCouple_fst_add_snd` (characterisation): v q = 1 → α ≠ 0 → (newtonCouple v q n α).1 + (newtonCouple v q n α).2 = n.
- `TauCeti.Weights.newtonCouple_nonneg` (other): If α and q^n α⁻¹ are integral over ℤ (in particular if α is integral and a Weil q-number of weight n) and v is nonnegative on the integers of K, both coordinates are ≥ 0.
- `TauCeti.Weights.newtonCouple_swap_conj` (relation): For a Weil q-number α of weight n, the couple of q^n α⁻¹ is the couple of α with its coordinates swapped.
- `TauCeti.Weights.newtonCouple_galois` (functoriality): For τ ∈ Aut(K) fixing q, newtonCouple (v ∘ τ) q n α = newtonCouple v q n (τ α). In the intended number-field application q is rational, so it is fixed.
- `TauCeti.Weights.newtonCouple_mul` (simp): For q ≠ 0, newtonCouple v q (n + m) (αβ) = newtonCouple v q n α + newtonCouple v q m β. The raw valuation API needs q ≠ 0 to use integer-power multiplication; it follows from v(q)=1 in the intended normalisation.
- `TauCeti.Weights.newtonCouple_div_pow` (simp): The couple of α/q^m (weight n − 2m) is (r − m, s − m).

Unit tests:

- `TauCeti.Weights.newtonCouple_fst_add_snd` (characterisation): r + s = n for every valuation v with v(q) = 1 and every nonzero α.
- `TauCeti.Weights.newtonCouple_supersingular` (computation): q = p, α = √−p (weight 1, a root of T² + p): at the unique place above p of ℚ(√−p), (r, s) = (1/2, 1/2).
- `TauCeti.Weights.newtonCouple_ordinary` (computation): q = 5, α = 1 + 2i (weight 1, |α|² = 5): at the place v of ℚ(i) with v(1 + 2i) = 1 (normalised v(5) = 1), (r, s) = (1, 0); at the conjugate place (r, s) = (0, 1).
- `TauCeti.Weights.newtonCouple_tate` (degenerate): α = q^m (weight 2m): (r, s) = (m, m) at every place above p.
- `TauCeti.Weights.newtonCouple_nonintegral` (non-example): α = q⁻¹ (weight −2): (r, s) = (−1, −1); the nonnegativity of r and s genuinely needs integrality.
- `TauCeti.Weights.newtonCouple_zero_base` (non-example): In the raw valuation definition, with q=0, α=β=1, n=1 and m=−1, the couple at n+m=0 is (0,0), while the sum of the two couples is (0,∞). Thus the multiplication API requires q ≠ 0.

Proof or construction:

1. r + s = v(q^n) = n·v(q) = n because v is a valuation.
2. q^n α⁻¹ is a root of the minimal polynomial of α: for one embedding σ, σ(q^n α⁻¹) = conj(σ α), a root of the minimal polynomial; so the minimal polynomials agree. If α is integral, so is every Galois conjugate, hence r, s ≥ 0.

Acceptance checks:

- The couple depends on v only through the place of ℚ(α) below it, and is permuted by Gal(ℚ̄/ℚ) acting on the places above p.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.7), p. 206. Read from the page image.

Declaration id: `DeligneWeightsAndPurity:DWP.7/newton-couples-3-3-7`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-7-valuation-triangles-3-3-8"></a>

### The p-adic couples of Frobenius eigenvalues lie in triangles

Let X₀ be a scheme of finite type over 𝔽\_q, q = p^f, of dimension ≤ d, and i ≥ 0. Let α be an eigenvalue of F on H^i_c(X, ℚ̄\_ℓ), or on H^i(X, ℚ̄\_ℓ) when X₀ is proper, of weight w, and (r, s) its couple at a place v above p (DWP.7/newton-couples-3-3-7). Then r + s = w ≤ i and r, s ≥ max(0, i − d): (r, s) lies in the lower triangle {r + s ≤ i, r ≥ max(0, i − d), s ≥ max(0, i − d)}. If X₀ is smooth of dimension ≤ d and α is an eigenvalue of F on H^i(X, ℚ̄\_ℓ), then r + s = w ≥ i and r, s ≤ min(i, d): (r, s) lies in the upper triangle {r + s ≥ i, r ≤ min(i, d), s ≤ min(i, d)}.

Constant coefficients ℚ̄\_ℓ

Proper X₀ for ordinary cohomology in the first part; smooth X₀ of pure dimension d in the second

Rests on the integrality theorem DWP.7/deligne-integrality-theorem-sga7-xxi

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Compact support: w ≤ i by DWP.7/cohomological-bounds-3-3-2-3-3-6 (i). The eigenvalue α is integral and, for i ≥ d, α/q^{i−d} is integral (DWP.7/deligne-integrality-theorem-sga7-xxi with ℱ = ℚ̄\_ℓ). So r ≥ max(0, i − d). The number q^w α⁻¹ is a Galois conjugate of α (DWP.7/newton-couples-3-3-7), so it is also integral and divisible by q^{i−d}: s ≥ max(0, i − d).
2. Proper X₀: H^i = H^i_c.
3. Smooth X₀ of pure dimension d: Poincaré duality (EDC.2) pairs H^i(X) with H^{2d−i}\_c(X)(d), so α = q^d/β for an eigenvalue β of F on H^{2d−i}\_c(X) of weight 2d − w. Then r = d − v(β) and s = d − v(q^{2d−w}β⁻¹). By the first part applied in degree 2d − i, v(β) and v(q^{2d−w}β⁻¹) are ≥ max(0, d − i); hence r, s ≤ min(d, i). And w ≥ i by DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii).
4. For smooth X of dimension ≤ d with components of different dimensions, apply the duality argument to each pure-dimensional component of dimension e ≤ d. Its bound r,s ≤ min(i,e) implies r,s ≤ min(i,d); take the finite direct sum. Thus no pure-dimensional hypothesis is needed in the displayed upper triangle, as in the source.

Acceptance checks:

- Acceptance: X₀ = ℙ^d, i = 2k: α = q^k, (r, s) = (k, k) lies in both triangles (on the antidiagonal).
- Acceptance: an ordinary elliptic curve over 𝔽\_p, i = 1, d = 1: the unit root has (r, s) = (0, 1) and the other (1, 0), the two corners of the antidiagonal; a supersingular one gives (1/2, 1/2).
- Acceptance: X₀ = 𝔾\_m (d = 1): on H²\_c the eigenvalue q has (1, 1), with r, s ≥ 2 − 1 = 1; on H¹ (smooth) the eigenvalue q has (1, 1) ≤ (min(1, 1), min(1, 1)).
- Non-example: the source's remark that in ordinary cohomology (r, s) always lies in the union square of the two triangles is stated there without proof and is not part of this node.

Direct inputs: [DWP.7/newton-couples-3-3-7](#dwp-7-newton-couples-3-3-7), [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi), [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.8), p. 206. Read from the page image; the triangles are given by the two printed diagrams ('si i ≤ d', 'si i ≥ d'), whose regions agree with the inequalities stated here. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, after (3.3.8), p. 207. The proof is left to the reader; the square statement is excluded (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.7/valuation-triangles-3-3-8`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11"></a>

### Purity for proper smooth varieties and rational homology manifolds over a finite field

Let X₀ be a scheme of finite type over 𝔽\_q, X = X₀ ⊗ 𝔽̄\_q, a : X₀ → Spec 𝔽\_q. (i) If X₀ is proper and smooth and ℱ₀ is lisse and punctually pure of weight n, then H^i(X, ℱ) is pure of weight n + i for every i; the same holds for ι-purity with n ∈ ℝ. (ii) (Weil II 3.3.9) If X₀ is proper and smooth, then for every i the polynomial det(1 − F t, H^i(X, ℚ\_ℓ)) has integer coefficients independent of ℓ ≠ p, and its reciprocal roots, the eigenvalues of F, are Weil q-numbers of weight i. (iii) (3.3.11) In (i) and (ii) and in DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii)–(iii), 'smooth of pure dimension N' may be replaced by the condition that X₀ is of pure dimension N and Ra^!ℚ\_ℓ ≅ ℚ\_ℓ(N)\[2N] Frobenius-equivariantly (EDC.1's exceptional inverse image), for instance when X₀ is étale-locally the quotient of a smooth scheme of dimension N by a finite group; then the lower bound and purity statements hold with ℱ₀ = ℚ̄\_ℓ.

(i), (ii): X₀ proper AND smooth; projectivity is not assumed

(iii): the exact dualizing-object hypothesis Ra^!ℚ\_ℓ ≅ ℚ\_ℓ(N)\[2N], not a weaker 'rationally smooth' slogan; coefficients constant

(ii)'s integrality and ℓ-independence use the algebraic factor lemma DWP.0/weight-separated-factor-extraction

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Purity of proper smooth cohomology**.

Proof or construction:

1. (i) For X₀ proper, H^i_c = H^i, so DWP.7/cohomological-bounds-3-3-2-3-3-6 (iii) gives purity of weight n + i; the ι-version uses (iv) of that node.
2. (ii) Purity of weight i is (i) with ℱ₀ = ℚ\_ℓ (n = 0). The zeta function Z(X₀, t) = ∏\_i det(1 − F t, H^i)^{(−1)^{i+1}} is in ℚ(t) with integral power-series expansion and does not depend on ℓ (trace formula, SF.2). Since the factors of different degrees have reciprocal roots of different absolute values, no cancellation occurs, and the algebraic factor lemma DWP.0/weight-separated-factor-extraction (the argument of Weil I, proof of (1.7) ⇒ (1.6)), after DWP.0/rational-zeta-descent-and-fatou puts Z(X₀, t) in ℚ(t), extracts each det(1 − F t, H^i) as a polynomial with integer coefficients determined by Z(X₀, t), hence independent of ℓ.
3. (iii) In the proofs of DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii)–(iii) and of (i), smoothness enters only through Poincaré duality H^i(X, ℚ̄\_ℓ) ≅ H^{2N−i}\_c(X, ℚ̄\_ℓ(N))^∨, which follows from Ra^!ℚ\_ℓ ≅ ℚ\_ℓ(N)\[2N] and Verdier duality RΓ(X, Ra^!ℚ\_ℓ) = RHom(RΓ\_c(X, ℚ\_ℓ), ℚ\_ℓ) (EDC.1).
4. For π : Y → Y/G with Y smooth of dimension N, the constant sheaf on Y/G is the G-invariant summand of π\_\*ℚ\_ℓ: geometric fibres are single G-orbits, and the averaging idempotent |G|⁻¹∑g exists in ℚ\_ℓ even if p divides |G|. Finite proper pushforward commutes with Verdier duality (EDC.1). The self-duality D(π\_\*ℚ\_ℓ) ≅ π\_\*ℚ\_ℓ(N)\[2N] from EDC.2 intertwines g with g⁻¹, so the averaging idempotent is self-adjoint. Its image therefore inherits Dℚ\_ℓ ≅ ℚ\_ℓ(N)\[2N]. Glue étale-locally to obtain the rational-homology-manifold condition.

Acceptance checks:

- Acceptance: a smooth proper nonprojective threefold over 𝔽\_q (Hironaka's construction, which can be carried out over a finite field) has pure cohomology by (ii) although DWP.4's projective theorem does not apply.
- Acceptance (lisse coefficients): for a smooth proper curve C₀ and an elliptic curve E₀ over 𝔽\_q, the geometrically constant sheaf ℱ₀ = a\*V with V = H¹(E, ℚ\_ℓ) is punctually pure of weight 1, and H^i(C, ℱ) = H^i(C, ℚ\_ℓ) ⊗ V is pure of weight i + 1.
- Acceptance: the weighted projective plane ℙ(1, 1, 2) (étale-locally a quotient of 𝔸² by μ₂, p ≠ 2) satisfies (iii) and its H² = ℚ\_ℓ(−1) is pure of weight 2.
- Non-example: the nodal cubic (proper, singular) has H¹ = ℚ\_ℓ of weight 0: properness alone does not give purity, and Ra^!ℚ\_ℓ ≠ ℚ\_ℓ(1)\[2] there.
- Non-example: 𝔾\_m (smooth, not proper) has H¹ of weight 2 ≠ 1.

Direct inputs: [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness`, [DWP.0/weight-separated-factor-extraction](#dwp-0-weight-separated-factor-extraction), [DWP.0/rational-zeta-descent-and-fatou](#dwp-0-rational-zeta-descent-and-fatou), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.9), p. 207. Smooth proper purity with integral ℓ-independent factors (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.11), p. 207. Role of smoothness; the condition (\*) Ra^!Q_ℓ = Q_ℓ(n)\[2n] follows in the same paragraph. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Introduction, p. 138. The lisse-coefficient form (i) (OCR cleaned). [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Proposition 6.1.1, proof, pp. 42–43. A consumer: purity of H^i of a pure lisse sheaf on a smooth proper curve separates the three factors.

Declaration id: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-7-purity-of-smooth-proper-dm-stacks"></a>

### Purity of the cohomology of smooth proper Deligne–Mumford stacks over 𝔽\_q

Let 𝒳₀ be a smooth proper Deligne–Mumford stack of finite type over 𝔽\_q, 𝒳 = 𝒳₀ ⊗ 𝔽̄\_q, and ℓ ≠ p. For every i, H^i(𝒳, ℚ\_ℓ) is finite-dimensional and pure of weight i: every eigenvalue of the geometric Frobenius is a Weil q-number of weight i. No global quotient presentation and no condition that ℓ is prime to the stabiliser orders is imposed, since the coefficients are rational. This is a purity statement only; weighted point counts of stacks, rationality of their zeta functions and duality on stacks are not part of it.

𝒳₀ smooth and proper over 𝔽\_q, Deligne–Mumford, of finite type; ℓ invertible.

Coefficients ℚ\_ℓ (or ℚ̄\_ℓ); with torsion coefficients the comparison with the coarse space fails when ℓ divides a stabiliser order.

Proof or construction:

1. Let π : 𝒳₀ → C₀ be the coarse moduli space, a proper algebraic space over 𝔽\_q, étale-locally the quotient of a smooth scheme by a finite group (SchemeAndStackFoundations:SF.1). Since the stabilisers are finite and the coefficients are rational, Rπ\_\*ℚ\_ℓ = ℚ\_ℓ (invariants under a finite group are exact on ℚ\_ℓ-modules), so H^i(C, ℚ\_ℓ) → H^i(𝒳, ℚ\_ℓ) is a Frobenius-equivariant isomorphism (requested from SchemeAndStackFoundations:SF.1).
2. C₀ is of pure dimension N on each component and étale-locally a quotient of a smooth scheme by a finite group, so Ra^!ℚ\_ℓ ≅ ℚ\_ℓ(N)\[2N] Frobenius-equivariantly, the hypothesis of DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (iii) (Weil II (3.3.11)); applied to the proper C₀ it gives purity of H^i(C, ℚ\_ℓ), hence of H^i(𝒳, ℚ\_ℓ). The extension of (3.3.11) from schemes to proper algebraic spaces with quotient singularities is the recorded gap on Weil II (3.3.11) for algebraic spaces.
3. Check for a global quotient \[Y/G] with Y smooth proper and G finite: H^i(\[Y/G], ℚ\_ℓ) = H^i(Y_{𝔽̄\_q}, ℚ\_ℓ)^G is a Frobenius-stable subspace of a pure space, hence pure, even when ℓ divides |G|.

Acceptance checks:

- For a scheme regarded as a Deligne–Mumford stack the statement is DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (i) with constant coefficients.
- For \[Y/G] with Y smooth proper and G finite, invariants of a pure representation stay pure, even when ℓ divides |G|.
- A smooth nonproper stack is not admitted: for B𝔾\_m-type or open stacks compact-support and ordinary cohomology have mixed weights.
- M̄\_{1,1} over 𝔽\_q, whose coarse space is the j-line ℙ¹: H⁰ = ℚ\_ℓ and H² = ℚ\_ℓ(−1), pure of weights 0 and 2, and H¹ = 0.

Direct inputs: `SchemeAndStackFoundations:SF.1`, [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), `EtaleDualityAndPerverseSheaves:EDC.1:biduality`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Remarque (3.3.11), p. 207. Remarks that smoothness enters the preceding results only through Poincaré duality, so that it may be replaced by the condition Ra^!ℚ\_ℓ = ℚ\_ℓ(N)\[2N], which holds for a scheme étale-locally the quotient of a smooth scheme of dimension N by a finite group. The coarse space of a smooth Deligne–Mumford stack has this local form; that it is an algebraic space rather than a scheme is the recorded gap. [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2), Proof of Proposition 3.1, p. 6; proof of Proposition 4.2, p. 7 (arXiv:2206.07759v2). The point-count and cohomology arguments use purity of the cohomology of the smooth proper Deligne–Mumford stacks M̄\_{g,n} and of their boundary strata.

Declaration id: `DeligneWeightsAndPurity:DWP.7/purity-of-smooth-proper-dm-stacks`. New in this plan (moved down; formerly `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`).

<a id="dwp-8"></a>

## DWP.8 — Mixed complexes, weight filtrations and geometric semisimplicity

Keeps nearby-cycle mixedness, Ext¹ and extensions of pure lisse sheaves, the weight decomposition and filtration, geometric semisimplicity (3.4.1–3.4.13), (6.2.5cd), (6.2.7) and the weight spectral sequence; the mixed-complex formalism is imported from EDC.7.

Imported from EtaleDualityAndPerverseSheaves EDC.7 (owner since the accepted transfer of 2026-10-14):

- `EtaleDualityAndPerverseSheaves:EDC.7/weight-mixed-complexes` — Mixed complexes and complexes of weights ≤ w (formerly `DWP.8/mixed-complexes`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-pure-complexes` — Complexes of weights ≥ w and pure complexes (formerly `DWP.8/pure-complexes`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-generic-mixedness-of-direct-images-6-1-3` — Generic mixedness of R^i f_\* over a base of finite type over ℤ\[1/ℓ] (formerly `DWP.8/generic-mixedness-of-direct-images-6-1-3`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-direct-image-preserves-mixedness-6-1-2` — R^i f_\* of a mixed sheaf is mixed (formerly `DWP.8/direct-image-preserves-mixedness-6-1-2`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-six-operations-preserve-mixedness-6-1-11` — Stability of mixed complexes under the six operations and duality (formerly `DWP.8/six-operations-preserve-mixedness-6-1-11`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-support-direct-image-upper-weights-6-2-3` — Rf_! preserves complexes of weights ≤ w (formerly `DWP.8/compact-support-direct-image-upper-weights-6-2-3`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5` — Purity on a smooth scheme is pointwise purity of lisse cohomology sheaves (formerly `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-directional-weight-estimates` — Weight estimates for the six operations (formerly `DWP.8/directional-weight-estimates`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-proper-direct-image-preserves-purity-6-2-6` — Proper direct images of pure complexes are pure (formerly `DWP.8/proper-direct-image-preserves-purity-6-2-6`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-semisimplicity` — Geometric monodromy and geometrically semisimple lisse sheaves (formerly `DWP.8/geometric-semisimplicity`).
- `EtaleDualityAndPerverseSheaves:EDC.7/weight-potentially-property-p-3-4-10` — Sheaves and complexes potentially having a property P (formerly `DWP.8/potentially-property-p-3-4-10`).

<a id="dwp-8-mixed-sheaves-with-galois-action-on-the-special-fibre"></a>

### Mixed sheaves on the special fibre with an action of the generic Galois group

Let S be a smooth curve over 𝔽\_q (resp. in context (6.1.1) b)), s a closed point, S_(s) the henselisation (a henselian trait) with generic point η, s̄ and η̄ geometric points, I ⊂ Gal(η̄/η) the inertia group, and X an S-scheme of finite type with special fibre X_s. A Galois sheaf on X_s̄ is a sheaf 𝒢 on X_s̄ with a continuous action ρ of Gal(η̄/η) over its action on X_s̄ through Gal(s̄/s) (SGA 7 XIII 1.1, LPV.0). Define (𝒢, ρ) to be mixed as follows. (a) If ρ factors through Gal(s̄/s), (𝒢, ρ) is a sheaf on X_s (SGA 7 XIII (1.1.3)), and it is mixed when that sheaf is. (b) If (𝒢, ρ) has a finite filtration F by Galois subsheaves such that ρ on Gr_F factors through Gal(s̄/s) (unipotent case), it is mixed when Gr_F(𝒢) is mixed in the sense (a). (c) In general the action of I is quasi-unipotent (LPV.1), so (b) applies after replacing Gal(η̄/η) by an open subgroup, i.e. after a finite extension of the trait; (𝒢, ρ) is mixed when it becomes mixed in the sense (b) after such a change of trait. The notion does not depend on the filtration or on the finite extension.

Henselian trait from a smooth curve over 𝔽\_q (equal characteristic)

Continuous Galois action; quasi-unipotence of inertia from LPV.1

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses:

- Weil II Théorème (6.1.13), p. 246: nearby cycles of a mixed sheaf are mixed in this sense
- `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`: the weight-filtered specialisation argument of the local invariant cycle theorem applies weights to inertia invariants of nearby cycles
- PAPER-SCHOLZE-12/142 (Deligne's weight–monodromy theorem in equal characteristic): weights of the special-fibre Galois module H^i(X_k̄) with its inertia action

API:

- `TauCeti.Weights.IsMixedGalois` (data): IsMixedGalois (𝒢, ρ) : Prop, defined by (a)–(c).
- `TauCeti.Weights.isMixedGalois_of_unramified` (compatibility): If ρ factors through Gal(s̄/s), IsMixedGalois (𝒢, ρ) ↔ IsMixed of the corresponding sheaf on X_s.
- `TauCeti.Weights.isMixedGalois_iff_filtration` (characterisation): In the unipotent case, mixedness may be tested on any filtration F with unramified graded pieces.
- `TauCeti.Weights.isMixedGalois_changeOfTrait` (functoriality): Invariant under finite extension of the trait.
- `TauCeti.Weights.IsMixedGalois.subquotient` (other): Stable under Galois subsheaves, quotients and extensions.
- `TauCeti.Weights.IsMixedGalois.tensor` (other): Stable under tensor products.
- `TauCeti.Weights.IsMixedGalois.invariants` (other): If (𝒢, ρ) is mixed then so is its subsheaf of I-invariants, a sheaf on X_s.

Unit tests:

- `TauCeti.Weights.isMixedGalois_trivial` (computation): For X = S and 𝒢 = ℚ̄\_ℓ with trivial inertia action, (𝒢, ρ) is mixed of weight 0 (case (a)).
- `TauCeti.Weights.isMixedGalois_tate_curve` (computation): For the Tate elliptic curve over 𝔽\_q((t)) (split multiplicative reduction), H¹(E_η̄, ℚ̄\_ℓ) with its unipotent inertia action has the filtration ℚ̄\_ℓ ⊂ H¹ with graded pieces ℚ̄\_ℓ (weight 0) and ℚ̄\_ℓ(−1) (weight 2): mixed, case (b).
- `TauCeti.Weights.isMixedGalois_quadratic_twist` (computation): A quadratic character of I (tamely ramified, p ≠ 2) becomes trivial after a degree-2 extension of the trait: case (c) applies.
- `TauCeti.Weights.isMixedGalois_zero` (degenerate): The zero Galois sheaf is mixed.
- `TauCeti.Weights.not_isMixedGalois_transcendental` (non-example): If a lift of Frobenius acts on the inertia invariants of a rank-one Galois sheaf on X_s̄ = Spec s̄ by a transcendental number, the sheaf is not mixed.

Proof or construction:

1. Independence of the filtration in (b): two such filtrations have a common refinement (Schreier/Zassenhaus) whose graded pieces are subquotients of both, and mixedness is stable under subquotients and extensions (EDC.7/weight-punctual-purity-and-mixedness).
2. Independence of the finite extension in (c): mixedness of a sheaf on X_s is unchanged by the finite base extension k(s) ⊂ k(s′) (Frobenius powers, EDC.7/weight-finite-field-base-extension-of-weights), and any two finite extensions are dominated by a third.
3. Quasi-unipotence (SGA 7 I, LPV.1) guarantees that (c) is always applicable.

Acceptance checks:

- The sheaves of nearby cycles R^iΨ(ℱ) of LPV.0 are Galois sheaves on X_s̄; for ℱ mixed they are mixed in this sense (DWP.8/nearby-cycles-preserve-mixedness-6-1-13).

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, (6.1.12), p. 246. Clause (b); clauses (a) and (c) are in the same paragraph (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-nearby-cycles-preserve-mixedness-6-1-13"></a>

### Nearby cycles of a mixed sheaf are mixed

In the setting of DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre, let ℱ be a mixed sheaf on X (X of finite type over S). Then the sheaves of nearby cycles R^iΨ(ℱ) on X_s̄, with their action of Gal(η̄/η), are mixed for every i.

S a smooth curve over 𝔽\_q (or context (6.1.1) b)); X of finite type over S

No weight bound is asserted, only mixedness; the weight–monodromy statements are LPV.7's

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. By the monodromy theorem (LPV.1) replace the trait by a finite extension so that I acts unipotently, through its quotient ℤ\_ℓ(1).
2. The monodromy filtration constructions of Weil II (1.6.1), (1.6.14) (LPV.1 for the linear algebra, DWP.5 for its weight interpretation) reduce mixedness of R^iΨ(ℱ) to mixedness of the inertia invariants (R^iΨ(ℱ))^I.
3. As in the proof of Weil II (3.6.1), these invariants are quotients of u\*R^iv_\*(ℱ|X_η), where u : X_s → X and v : X_η → X are the inclusions (specialisation sequence of LPV.0); they are mixed by EDC.7/weight-six-operations-preserve-mixedness-6-1-11.

Acceptance checks:

- Acceptance: for a smooth proper X over S, R⁰Ψ(ℚ̄\_ℓ) = ℚ̄\_ℓ and R^iΨ(ℚ̄\_ℓ) = 0 for i > 0; the conclusion is that ℚ̄\_ℓ on X_s is mixed, indeed pure of weight 0
- Acceptance: for the Tate curve family over the trait (a node with local equation xy = π in relative dimension 1), R¹Ψ(ℚ̄\_ℓ) is supported at the node with stalk R¹Φ = ℚ̄\_ℓ(−1), on which inertia acts trivially (pure of weight 2); the rank-two unipotent action with graded weights 0 and 2 is on H¹(X_η̄) = H¹(X_s̄, RΨℚ̄\_ℓ), whose weight-0 piece is H¹ of the nodal fibre and whose weight-2 piece is H⁰(X_s̄, R¹Ψ)

Direct inputs: [DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre](#dwp-8-mixed-sheaves-with-galois-action-on-the-special-fibre), `EtaleDualityAndPerverseSheaves:EDC.7/weight-six-operations-preserve-mixedness-6-1-11`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Théorème (6.1.13), p. 246. Statement; proof in the following paragraph (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/nearby-cycles-preserve-mixedness-6-1-13`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-intermediate-direct-image-purity-6-2-5cd"></a>

### j_\* of a pure lisse sheaf across a smooth divisor is pure

(c) Let X₀ be a smooth curve over 𝔽\_q, j : U₀ → X₀ a dense open and ℱ₀ a lisse sheaf on U₀, punctually pure of weight w (equivalently, by EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5, ℱ₀ is pure of weight w as a sheaf). Then j_\*ℱ₀ is pure of weight w. (d) Let X₀ be smooth, D₀ ⊂ X₀ a smooth divisor, j : U₀ = X₀ − D₀ → X₀, and ℱ₀ lisse on U₀, punctually pure of weight w and tamely ramified along D₀. Then j_\*ℱ₀ is pure of weight w. The ι-variants hold.

(c): smooth curve; (d): smooth divisor and tame ramification

ℱ₀ lisse: the source states (c) for a pure sheaf on U₀ and proves it through (1.8.8.1), which concerns lisse sheaves; the lisse case is the one used

j_\* is the underived direct image, placed in degree 0

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Upper bound: j_\*ℱ₀ is mixed (1.8.9, DWP.5) and its stalks at points of D₀ (or of X₀ − U₀) are the inertia invariants of ℱ, contained in Ker N ⊂ M₀ (Weil II (1.8.8) 1) and 2)), of weights ≤ w (EDC.7's local weight theorem, EDC.7/weight-local-monodromy-purity). So j_\*ℱ₀ has weights ≤ w.
2. Lower bound: D(j_\*ℱ₀) = j_\*(Dℱ₀) up to the shift and twist of the smooth dualizing complex, by the formula RHom(j_\*ℱ, ℚ̄\_ℓ) = j_\*ℋom(ℱ, ℚ̄\_ℓ) (Weil II's argument; local duality on a smooth curve or along a smooth divisor for tame ℱ, EDC.1–EDC.2). Since ℱ₀^∨ is lisse and punctually pure of weight −w, the first step gives weights ≤ −w for D(j_\*ℱ₀) after renormalising by EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5 (a).

Acceptance checks:

- Acceptance: j : 𝔾\_m → ℙ¹, ℱ₀ = ℚ̄\_ℓ: j_\*ℚ̄\_ℓ = ℚ̄\_ℓ on ℙ¹ is pure of weight 0.
- Acceptance: for the Legendre family h over ℙ¹ − {0, 1, ∞}, j_\*R¹h_\*ℚ̄\_ℓ is pure of weight 1: its stalks at the multiplicative points 0 and 1 are the one-dimensional inertia invariants, of weight 0 ≤ 1, its stalk at ∞ (monodromy minus a unipotent) is 0, and its dual is again of this form. Here H¹(ℙ¹, j_\*R¹h_\*ℚ̄\_ℓ) = 0 (Euler characteristic; there are no cusp forms of weight 3 for Γ(2)), so a global test needs Sym^k with nonzero parabolic cohomology
- Non-example: Rj_\*ℚ̄\_ℓ for j : 𝔾\_m → ℙ¹ is not pure of weight 0: R¹j_\*ℚ̄\_ℓ has weight 2 at 0 and ∞.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-pure-complexes`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-monodromy-purity`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Exemples (6.2.5) c), p. 248. Clause (c) with its proof; (d) is the tame smooth-divisor analogue (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/intermediate-direct-image-purity-6-2-5cd`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-variant-over-z-one-over-ell-6-2-7"></a>

### Pure complexes over ℤ\[1/ℓ]

For X of finite type over ℤ\[1/ℓ] with structure map a : X → Spec ℤ\[1/ℓ], put K′\_X = Ra^!ℚ̄\_ℓ and D′ = RHom(−, K′\_X). Call K ∈ D^b_c(X) pure of weight w when K is mixed of weights ≤ w (EDC.7/weight-mixed-complexes, read on schemes of finite type over ℤ\[1/ℓ]) and D′K is mixed of weights ≤ −w. If X is of finite type over 𝔽\_p then K′\_X = K_X(−1)\[−2], so D′ = D(−1)\[−2] and this notion agrees with that of EDC.7/weight-pure-complexes. Proper direct images preserve this purity: for f : X → Y proper over ℤ\[1/ℓ] and K pure of weight w, Rf_\*K is pure of weight w.

Schemes of finite type over ℤ\[1/ℓ]; exceptional inverse image and biduality over the regular one-dimensional base ℤ\[1/ℓ] from EDC.1

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. For i : Spec 𝔽\_p → Spec ℤ\[1/ℓ], i^!ℚ̄\_ℓ = ℚ̄\_ℓ(−1)\[−2]: this is the local cohomology of the henselisation of ℤ\_(p), a discrete valuation ring with ℓ invertible, computed by Kummer theory (requested from EDC.1, which identifies i_\*i^! with local cohomology; it is the dimension-one case, not Gabber's general absolute purity). So K′\_X = Ra_p^! i^!ℚ̄\_ℓ = K_X(−1)\[−2] and D′K = DK(−1)\[−2]; by EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5 (a) with N = −1 the two bounds agree.
2. Rf_! preserves weights ≤ w over ℤ\[1/ℓ] by EDC.7/weight-fundamental-direct-image-theorem-3-3-1 and the spectral sequence of EDC.7/weight-compact-support-direct-image-upper-weights-6-2-3; for f proper D′Rf_\* = Rf_\*D′ (EDC.1 over ℤ\[1/ℓ]); conclude as in EDC.7/weight-proper-direct-image-preserves-purity-6-2-6.

Acceptance checks:

- Acceptance: X = Spec ℤ\[1/ℓ], K = ℚ̄\_ℓ: a is the identity, so K′\_X = ℚ̄\_ℓ, D′ℚ̄\_ℓ = ℚ̄\_ℓ and ℚ̄\_ℓ is pure of weight 0 in this sense; for X over 𝔽\_p the formula K′\_X = K_X(−1)\[−2] applies

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-pure-complexes`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-support-direct-image-upper-weights-6-2-3`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-fundamental-direct-image-theorem-3-3-1`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Variante (6.2.7), p. 248. Statement; 'La proposition (6.2.6) reste vraie' closes the paragraph (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-ext-one-of-lisse-sheaves-3-4-2"></a>

### The Ext¹ sequence of lisse sheaves over a finite field

Let X₀ be of finite type over 𝔽\_q and ℱ₀, 𝒢₀ lisse sheaves on X₀ (Weil sheaves allowed). (i) There is an exact sequence 0 → H⁰(X, ℋom(ℱ, 𝒢))\_F → Ext¹(ℱ₀, 𝒢₀) → H¹(X, ℋom(ℱ, 𝒢))^F, where Ext¹ is the group of extension classes in the abelian category of sheaves on X₀, the right arrow is pullback to X followed by Ext¹(ℱ, 𝒢) = H¹(X, ℋom(ℱ, 𝒢)), and the subscript (resp. superscript) F denotes coinvariants (resp. invariants) of the Weil group W(𝔽̄\_q/𝔽\_q) = F^ℤ. (ii) For X₀ normal and geometrically connected this is the five-term sequence of Hochschild–Serre for 1 → π₁(X, x̄) → W(X₀, x̄) → ℤ → 1 with coefficients M = Hom(ℱ\_x̄, 𝒢\_x̄), using H¹(ℤ, N) = N_F and H²(ℤ, N) = 0.

ℱ₀, 𝒢₀ lisse

Extensions in the category of all (Weil) sheaves on X₀; for lisse ℱ₀, 𝒢₀ an extension is lisse

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (i) (Weil II's argument.) A geometrically trivial extension ℰ₀ of ℱ₀ by 𝒢₀ has a splitting φ : ℱ → ℰ over X; the other splittings are φ − f with f ∈ Hom(ℱ, 𝒢). The extension is trivial over X₀ iff φ − f can be chosen F-invariant, i.e. Fφ − φ ∈ Hom(ℱ, 𝒢) is of the form Ff − f, i.e. has zero image in Hom(ℱ, 𝒢)\_F. The map ℰ₀ ↦ class of Fφ − φ is a bijection between geometrically trivial extension classes and Hom(ℱ, 𝒢)\_F = H⁰(X, ℋom(ℱ, 𝒢))\_F.
2. The image of Ext¹(ℱ₀, 𝒢₀) → Ext¹(ℱ, 𝒢) lies in the F-invariants by transport of structure; Ext¹ of lisse sheaves on X is H¹(X, ℋom(ℱ, 𝒢)) (local ℰxt of lisse sheaves vanish, EDC.0).
3. (ii) Identify extensions of lisse sheaves with extensions of continuous representations (EDC.0, IG.0–IG.1) and apply the continuous Hochschild–Serre spectral sequence (R02.2) to the closed normal subgroup π₁(X, x̄) with discrete quotient ℤ, whose cohomological dimension is 1. The quotient is ℤ with the stated degree map only in the geometrically connected case; for a merely connected X₀ its image is eℤ, and use the geometric component over the finite constant-field extension 𝔽\_{q^e} with Frobenius F^e (Weil II 1.1.13.1). The splitting argument in (i) already treats the global F-action without this restriction.

Acceptance checks:

- Acceptance: X₀ = Spec 𝔽\_q, ℱ₀ = 𝒢₀ = ℚ̄\_ℓ: Ext¹(ℚ̄\_ℓ, ℚ̄\_ℓ) = ℚ̄\_ℓ\_F = ℚ̄\_ℓ (the unipotent Jordan block), and H¹(X, ·) = 0.
- Acceptance: X₀ = Spec 𝔽\_q, ℱ₀ = ℚ̄\_ℓ, 𝒢₀ = ℚ̄\_ℓ(1): Ext¹ = ℚ̄\_ℓ(1)\_F = 0 since F − 1 = q⁻¹ − 1 is invertible.

Direct inputs: `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticGaloisDuality:R02.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Lemme (3.4.2), p. 208. Statement (OCR cleaned); proof follows on the same page.

Declaration id: `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4"></a>

### Extensions between pure lisse sheaves on a smooth scheme

Let X₀ be smooth of finite type over 𝔽\_q, ι : ℚ̄\_ℓ ≅ ℂ, and ℱ₀, 𝒢₀ lisse sheaves on X₀ punctually ι-pure of weights β and γ. (Lemma 3.4.3) A geometrically nontrivial extension 0 → 𝒢₀ → ℰ₀ → ℱ₀ → 0 can exist only if β ≡ γ (mod ℤ) and β > γ. (Lemma 3.4.4) Ext¹(ℱ₀, 𝒢₀) ≠ 0 only if β ≡ γ (mod ℤ) and β ≥ γ.

X₀ smooth (for the H¹ lower bound)

Punctual ι-purity at one fixed ι

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. ℋom(ℱ, 𝒢) is lisse and punctually ι-pure of weight γ − β (EDC.7/weight-spectra-of-tensor-products-and-duals).
2. By DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii) in its ι-form (iv), H¹(X, ℋom(ℱ, 𝒢)) has ι-weights ≥ γ − β + 1, and by EDC.7/weight-iota-mixed-direct-image-3-3-10 they lie in γ − β + ℤ. F has a nonzero invariant only if it has eigenvalue 1, of weight 0; so H¹(X, ℋom)^F ≠ 0 forces 0 ∈ (γ − β + ℤ) and 0 ≥ γ − β + 1, i.e. β ≡ γ mod ℤ and β > γ. By DWP.8/ext-one-of-lisse-sheaves-3-4-2 a geometrically nontrivial extension has nonzero image in H¹(X, ℋom)^F.
3. (3.4.4) The H⁰ term H⁰(X, ℋom(ℱ, 𝒢)) ⊂ ℋom(ℱ, 𝒢)\_x̄ has ι-weight γ − β; its F-coinvariants are nonzero only if F has eigenvalue 1, forcing γ = β. Combine with the previous step through the exact sequence.

Acceptance checks:

- Acceptance: X₀ = Spec 𝔽\_q, ℱ₀ = 𝒢₀ = ℚ̄\_ℓ (β = γ = 0): Ext¹ ≠ 0 (the Jordan block), consistent with β ≥ γ; all extensions are geometrically trivial.
- Acceptance: X₀ = 𝔾\_m, ℱ₀ = ℚ̄\_ℓ (β = 0), 𝒢₀ = ℚ̄\_ℓ(1) (γ = −2): the Kummer extension is geometrically nontrivial, consistent with β > γ.
- Non-example: for β < γ, e.g. ℱ₀ = ℚ̄\_ℓ(1), 𝒢₀ = ℚ̄\_ℓ on Spec 𝔽\_q, Ext¹ = 0.

Direct inputs: [DWP.8/ext-one-of-lisse-sheaves-3-4-2](#dwp-8-ext-one-of-lisse-sheaves-3-4-2), [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-mixed-direct-image-3-3-10`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Lemmes (3.4.3)–(3.4.4), p. 208. Lemma 3.4.3; Lemma 3.4.4 replaces 'β > γ' by 'β ≥ γ' for Ext¹ ≠ 0 (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-weight-decomposition-modulo-z-3-4-1-i"></a>

### The decomposition of an ι-mixed sheaf by weights modulo ℤ

Let X₀ be of finite type over 𝔽\_q, ι : ℚ̄\_ℓ ≅ ℂ, and ℱ₀ an ι-mixed sheaf on X₀ (Weil sheaves allowed). There is a unique decomposition ℱ₀ = ⊕\_{b ∈ ℝ/ℤ} ℱ₀(b), almost all summands zero, such that the punctual ι-weights of ℱ₀(b) lie in b. It is functorial: every morphism ℱ₀ → 𝒢₀ of ι-mixed sheaves maps ℱ₀(b) to 𝒢₀(b). Each ℱ₀(b) is a twist ℋ₀^{(c)} (Weil II 1.2.7) of an ι-mixed sheaf ℋ₀ with integer punctual weights, for any c ∈ ℚ̄\_ℓ^× with ι-weight in b. Stalkwise, for x ∈ |X₀|: ℱ₀(b)\_x̄ = ⊕\_{β ∈ b} ℱ\_x̄(β), where ℱ\_x̄(β) is the sum of the generalised eigenspaces of F_x for the eigenvalues of ι-weight β relative to N(x).

One fixed ι

ι-mixed sheaves (real weights)

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses:

- Weil II Théorème (3.4.1) (i) and Remarque (1.2.8): reduces real ι-weights to integer weights up to twist
- PAPER-CIUBOTARU-HARRIS-26 (equation (5.5)): decomposition of semisimple local systems into constant-field character twists of systems with integral weights
- [DWP.8/punctual-weight-filtration-3-4-1-ii](#dwp-8-punctual-weight-filtration-3-4-1-ii): the weight filtration is constructed on each integer-weight piece

API:

- `TauCeti.Weights.weightClass` (data): weightClass ℱ₀ (b : ℝ/ℤ) : the summand ℱ₀(b), a subsheaf of ℱ₀.
- `TauCeti.Weights.weightClass_isInternal` (structure): ℱ₀ is the internal direct sum of the ℱ₀(b), with finitely many nonzero.
- `TauCeti.Weights.weightClass_stalk` (characterisation): (ℱ₀(b))\_x̄ = ⊕\_{β ∈ b} ℱ\_x̄(β), generalised eigenspaces of F_x.
- `TauCeti.Weights.weightClass_map` (functoriality): φ : ℱ₀ → 𝒢₀ maps ℱ₀(b) into 𝒢₀(b); weightClass is an exact functor; map_id and map_comp hold.
- `TauCeti.Weights.weightClass_unique` (characterisation): Any decomposition ℱ₀ = ⊕ 𝒜(b) with the weights of 𝒜(b) in b equals the weight-class decomposition.
- `TauCeti.Weights.weightClass_eq_twist` (relation): ℱ₀(b) ≅ ℋ₀^{(c)} with ℋ₀ of integer ι-weights, for any c of ι-weight in b.
- `TauCeti.Weights.weightClass_of_integer` (simp): If all punctual ι-weights of ℱ₀ are integers then ℱ₀(0) = ℱ₀.
- `TauCeti.Weights.weightClass_tensor` (relation): (ℱ₀ ⊗ 𝒢₀)(b) = ⊕\_{b′ + b″ = b} ℱ₀(b′) ⊗ 𝒢₀(b″).

Unit tests:

- `TauCeti.Weights.weightClass_fractional` (computation): On Spec 𝔽\_q with ι fixed and a chosen fourth root q^{1/4}, ℚ̄\_ℓ ⊕ ℚ̄\_ℓ^{(q^{1/4})} has nonzero classes exactly 0 and 1/2 mod ℤ.
- `TauCeti.Weights.weightClass_integral` (non-example): ℚ̄\_ℓ ⊕ ℚ̄\_ℓ(1) on Spec 𝔽\_q has all of its weight in the class 0: the decomposition is by weight modulo ℤ, not by weight.
- `TauCeti.Weights.weightClass_depends_on_iota` (non-example): For b = 1 + √2 (an ℓ-adic unit, of norm −1), ℚ̄\_ℓ^{(b)} on Spec 𝔽\_q has ι-weight 2 log_q(1 + √2) or −2 log_q(1 + √2) according to ι(√2) = ±√2: the class depends on ι.
- `TauCeti.Weights.weightClass_zero` (degenerate): The zero sheaf has all classes zero.
- `TauCeti.Weights.weightClass_point` (compatibility): On Spec 𝔽\_q, ℱ₀(b) is the sum of the generalised eigenspaces of F whose ι-weights lie in b, i.e. DWP.0's decomposition (ii) regrouped modulo ℤ.

Proof or construction:

1. (3.4.6) Uniqueness and functoriality: the stalk formula is forced, since a summand whose weights lie in b must contain the generalised eigenspaces of weights in b and no others (DWP.0/weight-decomposition (ii), DWP.0/disjoint-spectra-no-intertwiner).
2. (3.4.7) Existence for X₀ smooth and ℱ₀ a successive extension of lisse punctually ι-pure sheaves: induction on the length; if ℱ₀ is an extension of ℱ″₀ (decomposed) by ℱ′₀ pure of weight β with class b, then for b′ ≠ b the preimage of ℱ″₀(b′) is a trivial extension by DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4 (Ext¹ = 0 when the weights are not congruent mod ℤ); take ℱ₀(b) the preimage of ℱ″₀(b) and ℱ₀(b′) a lifting of ℱ″₀(b′).
3. (3.4.8) General case by induction on dim X₀: replacing X₀ by X₀,red, choose a dense open j : U₀ → X₀ where (3.4.7) applies (generic lissity and smoothness; 1.8.11 of DWP.5 on a normal U₀); the induction hypothesis applies on the complement i : F₀ → X₀. Glue through the equivalence ℱ₀ ↦ (j\*ℱ₀, i\*ℱ₀, specialisation s : i\*ℱ₀ → i\*j_\*j\*ℱ₀); s maps (i\*ℱ₀)(b) into i\*j_\*((j\*ℱ₀)(b)) because, by Weil II (1.8.9) (DWP.5) and twisting, the punctual weights of i\*j_\*((j\*ℱ₀)(b)) lie in b.
4. Twist: if c has ι-weight β₀ ∈ b, then ℱ₀(b)^{(c⁻¹)} has integer ι-weights (Weil II 1.2.7, EDC.7/weight-twisting-by-rank-one-characters).

Acceptance checks:

- The decomposition does not separate integer weights: ℚ̄\_ℓ ⊕ ℚ̄\_ℓ(1) lies entirely in the class 0.
- Remark (1.2.8) of Weil II: a posteriori real ι-weights reduce to integer weights up to twist.

Direct inputs: [DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4](#dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition), [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), `EtaleDualityAndPerverseSheaves:EDC.7/weight-twisting-by-rank-one-characters`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (i), p. 207. Statement (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.4.6), p. 209. The stalk description proving uniqueness (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/weight-decomposition-modulo-z-3-4-1-i`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-punctual-weight-filtration-3-4-1-ii"></a>

### The weight filtration of a lisse mixed sheaf

Let X₀ be of finite type over 𝔽\_q, ι : ℚ̄\_ℓ ≅ ℂ, and ℱ₀ a lisse ι-mixed sheaf on X₀ whose punctual ι-weights are integers. There is a unique finite increasing filtration W of ℱ₀ by lisse subsheaves W_iℱ₀ (the filtration by punctual weight) such that Gr^W_i ℱ₀ is punctually ι-pure of weight i for every i. It is functorial, and every morphism between lisse ι-mixed sheaves with integer punctual weights is strictly compatible with the weight filtrations. Stalkwise (W_iℱ₀)\_x̄ = ⊕\_{β ≤ i} ℱ\_x̄(β). For a lisse mixed sheaf (integer weights at every ι) the filtration does not depend on ι (Weil II 3.4.9).

ℱ₀ lisse with integer punctual ι-weights

A filtration, not a splitting: ℱ₀ need not be the direct sum of its graded pieces

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Weight filtration of a lisse mixed sheaf**.

Uses:

- PAPER-CIUBOTARU-HARRIS-26 (Proposition 2.7(2)): the unique functorial strict weight filtration with pure graded pieces of a lisse mixed rational ℓ-adic sheaf
- PAPER-YUN-ZHANG-17/58 (Lemma 7.13(1)): strictness of the weight filtration in long exact sequences to stabilise bounded-weight terms
- `WeightsInEtaleCohomology:R34.1`: the strict mixed-sheaf filtration exported through RS-17's one-owner handoff
- `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`: the weight-filtered exact-sequence argument of the local invariant cycle theorem

API:

- `TauCeti.Weights.weightFiltration` (data): weightFiltration ℱ₀ : ℤ → lisse subsheaves of ℱ₀, i ↦ W_iℱ₀, monotone, W_i = 0 for i ≪ 0 and = ℱ₀ for i ≫ 0.
- `TauCeti.Weights.weightFiltration_gr_pure` (characterisation): Gr^W_i ℱ₀ is lisse and punctually ι-pure of weight i.
- `TauCeti.Weights.weightFiltration_unique` (characterisation): Any finite increasing filtration by lisse subsheaves with Gr_i punctually ι-pure of weight i equals W.
- `TauCeti.Weights.weightFiltration_stalk` (characterisation): (W_iℱ₀)\_x̄ = ⊕\_{β ≤ i} ℱ\_x̄(β).
- `TauCeti.Weights.weightFiltration_map` (functoriality): φ(W_iℱ₀) ⊆ W_i𝒢₀, with map_id and map_comp for the induced maps on Gr^W.
- `TauCeti.Weights.weightFiltration_strict` (other): φ(W_iℱ₀) = φ(ℱ₀) ∩ W_i𝒢₀; hence Gr^W is an exact functor.
- `TauCeti.Weights.weightFiltration_tensor` (relation): W_k(ℱ₀ ⊗ 𝒢₀) = Σ\_{i+j=k} W_iℱ₀ ⊗ W_j𝒢₀.
- `TauCeti.Weights.weightFiltration_dual` (relation): W_i(ℱ₀^∨) = (ℱ₀ / W_{−i−1}ℱ₀)^∨.
- `TauCeti.Weights.weightFiltration_pullback` (functoriality): g\*W_iℱ₀ = W_i(g\*ℱ₀) for g : Y₀ → X₀.
- `TauCeti.Weights.weightFiltration_twist` (simp): W_i(ℱ₀(r)) = (W_{i+2r}ℱ₀)(r).
- `TauCeti.Weights.weightFiltration_indep_iota` (other): For lisse mixed ℱ₀ (integer weights for every ι), W does not depend on ι.

Unit tests:

- `TauCeti.Weights.weightFiltration_kummer` (computation): For the Kummer extension 0 → ℚ̄\_ℓ(1) → ℒ → ℚ̄\_ℓ → 0 on 𝔾\_m over 𝔽\_q: W_{−3} = 0, W_{−2} = W_{−1} = ℚ̄\_ℓ(1), W_0 = ℒ.
- `TauCeti.Weights.weightFiltration_pure` (degenerate): For ℱ₀ punctually pure of weight n: W_{n−1} = 0 and W_n = ℱ₀.
- `TauCeti.Weights.weightFiltration_not_split` (non-example): The Kummer extension ℒ is not isomorphic to Gr^W ℒ = ℚ̄\_ℓ(1) ⊕ ℚ̄\_ℓ: the weight filtration is not a grading on the sheaf.
- `TauCeti.Weights.weightFiltration_point` (compatibility): On Spec 𝔽\_q, W_iV is the sum of the generalised eigenspaces of F of weight ≤ i; for the Jordan block \[\[q, 1], \[0, q]], W_1 = 0 and W_2 = V.
- `TauCeti.Weights.weightFiltration_strict_example` (characterisation): The inclusion ℚ̄\_ℓ(1) → ℒ is strict: its image meets W_{−2}ℒ in the whole image, and W_{−1} of the cokernel ℚ̄\_ℓ is 0.

Proof or construction:

1. (3.4.6) Uniqueness and functoriality: the stalk formula is forced (DWP.0/weight-decomposition (ii)); a morphism preserves generalised eigenspaces, so f(W_i) ⊆ W_i, and strictness f(W_iℱ₀) = f(ℱ₀) ∩ W_i𝒢₀ holds stalkwise because both sides are the sum of the generalised eigenspaces of weight ≤ i of f(ℱ\_x̄).
2. (3.4.7) Existence for X₀ smooth and ℱ₀ a successive extension of lisse punctually ι-pure sheaves: if ℱ₀ is an extension of ℱ″₀ (filtered) by ℱ′₀ pure of integer weight β, then the preimage of W_{β−1}ℱ″₀ is a trivial extension of W_{β−1}ℱ″₀ by ℱ′₀ (DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4: Ext¹(pure of weight < β, pure of weight β) = 0); for i < β take W_iℱ₀ a lifting of W_iℱ″₀, for i ≥ β the preimage of W_iℱ″₀.
3. (3.4.8) General X₀: uniqueness allows descent, so assume X₀ normal; then ℱ₀ = j_\*j\*ℱ₀ for a dense open j : U₀ → X₀ where (3.4.7) applies (1.8.11 of DWP.5), and W_iℱ₀ := j_\*W_ij\*ℱ₀ gives Gr^W_i ℱ₀ = j_\*Gr^W_i j\*ℱ₀, which is lisse and punctually ι-pure of weight i by Weil II (1.8.10) (DWP.5).
4. Independence of ι for mixed sheaves: the eigenvalues are Weil numbers whose weight does not depend on ι (EDC.7/weight-weil-number-iff-iota-pure-for-every-iota), so the stalk formula does not either.

Acceptance checks:

- Over Spec 𝔽\_q the filtration is W_iV = ⊕\_{n ≤ i} V_n, DWP.0's weight decomposition read as a filtration.

Direct inputs: [DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4](#dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4), [DWP.8/weight-decomposition-modulo-z-3-4-1-i](#dwp-8-weight-decomposition-modulo-z-3-4-1-i), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition), `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-iff-iota-pure-for-every-iota`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (ii), p. 207. Statement (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (ii), p. 207. Strictness (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Variante (3.4.9), p. 210. The mixed (all-ι) form; the second half of 3.4.9 needs 'lisse' and 'X₀ normal' (PAPER-DELIGNE-80/E47).

Declaration id: `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-geometric-semisimplicity-theorem-3-4-1-iii"></a>

### Deligne's semisimplicity theorem: pure lisse sheaves are geometrically semisimple

Let X₀ be a normal scheme of finite type over 𝔽\_q, ι : ℚ̄\_ℓ ≅ ℂ, and ℱ₀ a lisse sheaf on X₀ which is punctually ι-pure (of some weight β ∈ ℝ). Then the pullback ℱ of ℱ₀ to X = X₀ ⊗ 𝔽̄\_q is semisimple: ℱ₀ is geometrically semisimple. In particular every lisse punctually pure sheaf on a normal X₀ is geometrically semisimple (Weil II 3.4.9, corrected as in PAPER-DELIGNE-80/E47). Arithmetic semisimplicity is not asserted.

X₀ normal

ℱ₀ lisse and punctually ι-pure at one ι

Conclusion after base change to 𝔽̄\_q only

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Geometric semisimplicity theorem**.

Proof or construction:

1. (3.4.5) For U₀ ⊂ X₀ a dense open and ū a geometric point of U₀, π₁(U, ū) → π₁(X, ū) is surjective (X normal, IG.0); so geometric semisimplicity may be checked on U₀ (EDC.7/weight-geometric-semisimplicity, api isGeometricallySemisimple_iff_restrict_open), and one may assume X₀ smooth.
2. Let ℱ′ be the largest semisimple lisse subsheaf of ℱ (sum of its irreducible lisse subsheaves). It is Frobenius-stable by transport of structure, hence comes from ℱ′₀ ⊂ ℱ₀; put ℱ″₀ = ℱ₀/ℱ′₀. Both are punctually ι-pure of weight β.
3. By DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4 (equal weights, so β > γ fails), the extension of ℱ″₀ by ℱ′₀ is geometrically trivial. If ℱ″ ≠ 0, a simple lisse subsheaf of ℱ″ lifts to ℱ through the geometric splitting, contradicting the maximality of ℱ′. Hence ℱ″ = 0 and ℱ = ℱ′ is semisimple.

Acceptance checks:

- Acceptance: for an elliptic curve family h : E₀ → S₀ over a smooth curve with nonconstant j-invariant, R¹h_\*ℚ̄\_ℓ (pure of weight 1) is geometrically irreducible, in particular semisimple.
- Non-example: the Kummer extension ℒ on 𝔾\_m (mixed of weights −2 and 0, not pure) is not geometrically semisimple: purity cannot be weakened to mixedness.
- Non-example: the unipotent Weil sheaf \[\[1, 1], \[0, 1]] on Spec 𝔽\_q is pure of weight 0 and geometrically semisimple but not arithmetically semisimple; purity of a Weil sheaf does not imply that Frobenius acts semisimply.

Direct inputs: [DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4](#dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4), `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-semisimplicity`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (iii), p. 207. Statement (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.4.5), p. 208. The proof (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11"></a>

### R^i f_\*ℚ\_ℓ of a proper smooth morphism is potentially punctually pure

Let k be algebraically closed with ℓ invertible, X of finite type over k, and f : Y → X proper and smooth. Then for every i the lisse sheaf R^i f_\*ℚ\_ℓ is potentially punctually pure of weight i: there is a model f_S : Y_S → X_S over an integral S of finite type over ℤ\[1/ℓ], with f_S proper and smooth, and for every closed point s of S the sheaf R^i f_{s\*}ℚ\_ℓ on X_s is lisse and punctually pure of weight i.

f proper and smooth

Constant coefficients ℚ\_ℓ

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Spread out f to a proper smooth f_S : Y_S → X_S over an integral S of finite type over ℤ\[1/ℓ] by the standard limit argument (AdicCoefficientsAndComparisons L2: finite presentation of Y, X and f, and eventual properness and smoothness).
2. By proper and smooth base change (SF.2), R^i f_{S\*}ℚ\_ℓ is lisse and its formation commutes with every base change; so its restriction to X_s is R^i f_{s\*}ℚ\_ℓ and its base change to k is R^i f_\*ℚ\_ℓ.
3. For x ∈ |X_s| the stalk at a geometric point over x is H^i of the geometric fibre of the proper smooth Y_x over the finite field k(x); by DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (ii) it is pure of weight i relative to N(x).

Acceptance checks:

- Acceptance: for the Legendre family y² = x(x − 1)(x − λ) over X = ℙ¹ − {0, 1, ∞} over k, R¹f_\*ℚ\_ℓ is potentially pure of weight 1 with model over ℤ\[1/2ℓ].
- Non-example: for f proper but not smooth (a nodal degeneration), R^i f_\*ℚ\_ℓ need not be lisse, and its stalks at the singular fibre are not pure.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-potentially-property-p-3-4-10`, [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Exemple (3.4.11), p. 210. Statement; 'Ceci résulte d'un argument standard de passage à la limite, pour construire f₀ : Y₀→X₀/S₀ propre et lisse, et de (3.3.9) appliqué aux fibres de f₀' (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-potentially-pure-lisse-sheaves-are-semisimple-3-4-12"></a>

### Potentially pure lisse sheaves on a normal variety are semisimple

Let k be algebraically closed with ℓ invertible, X a normal scheme of finite type over k, and ℱ a lisse sheaf on X which is potentially punctually ι-pure (EDC.7/weight-potentially-property-p-3-4-10). Then ℱ is semisimple.

X normal of finite type over an algebraically closed field of any characteristic ≠ ℓ

A model witnessing potential ι-purity is given

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Choose a model (S, x̄, X_S, ℱ\_S) and shrink S so that X_S → S has normal geometric fibres and ℱ\_S is lisse (generic normality and lissity, L2).
2. By the specialisation theorem for monodromy groups (Weil II (1.11.1) with (1.11.5), DWP.5), after shrinking S the image of π₁ of the geometric generic fibre in GL(ℱ\_x̄) is conjugate to the image of π₁ of the geometric fibre X_s̄ at closed points s, i.e. the geometric monodromy groups of ℱ and of ℱ\_S|X_s̄ agree.
3. ℱ\_S|X_s is lisse and punctually ι-pure on the normal X_s over the finite field k(s), so it is geometrically semisimple by DWP.8/geometric-semisimplicity-theorem-3-4-1-iii; semisimplicity is a property of the monodromy group, so ℱ is semisimple.

Acceptance checks:

- Acceptance: for X over 𝔽̄\_q and ℱ defined over 𝔽\_q this is DWP.8/geometric-semisimplicity-theorem-3-4-1-iii.
- Non-example: the Kummer extension on 𝔾\_m over ℂ is not semisimple, hence not potentially pure.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-potentially-property-p-3-4-10`, [DWP.8/geometric-semisimplicity-theorem-3-4-1-iii](#dwp-8-geometric-semisimplicity-theorem-3-4-1-iii), `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-semisimplicity`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-specialization-of-monodromy`, `AdicCoefficientsAndComparisons:L2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.4.12), p. 210. Statement; 'Le théorème de spécialisation (1.11.1), (1.11.5) permet de généraliser (3.4.1) (iii)' (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-8-semisimplicity-of-proper-smooth-direct-images-3-4-13"></a>

### Semisimplicity of R^i f_\*ℚ\_ℓ for a proper smooth family

Let k be algebraically closed with ℓ invertible, S a normal connected scheme of finite type over k, and f : X → S proper and smooth. Then for every i the lisse sheaf R^i f_\*ℚ\_ℓ on S is semisimple, i.e. H^i(X_s̄, ℚ\_ℓ) is a semisimple representation of π₁(S, s̄).

f proper and smooth; S normal connected of finite type over an algebraically closed field

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Semisimplicity of proper smooth monodromy**.

Proof or construction:

1. R^i f_\*ℚ\_ℓ is lisse (proper smooth base change, SF.2) and potentially punctually pure of weight i (DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11), hence semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12.

Acceptance checks:

- Acceptance (the case used by hard Lefschetz): for X ⊂ ℙ^N smooth projective over k and the family of smooth hyperplane sections Y_u, u ∈ U = ℙ̌^N − X̌, the representation of π₁(U, u) on H^j(Y_u, ℚ\_ℓ) is semisimple for every j.
- Acceptance: for a nonisotrivial elliptic family the monodromy representation on H¹ is irreducible.
- Non-example: for f proper and smooth, R^i f_\*ℤ/ℓ need not be semisimple: the statement is for ℚ\_ℓ coefficients.

Direct inputs: [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), [DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12](#dwp-8-potentially-pure-lisse-sheaves-are-semisimple-3-4-12), `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.4.13), p. 210. Statement (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Remarque (3.4.14), p. 210. Its use in DWP.9 (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-8-weight-spectral-sequence-of-a-normal-crossings-compactification"></a>

### The weight spectral sequence of a normal crossings compactification

Let X₀ be a smooth proper scheme of pure dimension d over 𝔽\_q, D₀ ⊂ X₀ a divisor with normal crossings, U₀ = X₀ − D₀ and j : U₀ → X₀. For m ≥ 1 let ν\_m : D^{(m)}₀ → X₀ be the normalisation of the locus of points lying on at least m local branches of D₀ (étale locally the disjoint union of the m-fold intersections of the branches), D^{(0)}₀ = X₀, and ε\_m the rank-one orientation sheaf on D^{(m)}₀, the determinant of the permutation representation on the m local branches. Then there is a spectral sequence of Frobenius modules E₁^{m,k} = H^k(D^{(m)}, ε\_m) ⇒ H^{m+k}\_c(U, ℚ\_ℓ), whose d₁ is the alternating sum of the restriction maps; E₁^{m,k} is pure of weight k, the sequence degenerates at E₂, and E₂^{m,k} = Gr^W_k H^{m+k}\_c(U, ℚ\_ℓ) for the weight filtration of the Frobenius module H^{m+k}\_c(U). The same holds for X₀ a smooth proper Deligne–Mumford stack over 𝔽\_q with a normal crossings divisor, the D^{(m)} being smooth proper Deligne–Mumford stacks; for the boundary of M̄\_{g,n} it reads E₁^{j,k} = ⊕\_{|E(G)| = j} (H^k(∏\_v M̄\_{g_v,n_v}) ⊗ det E(G))^{Aut(G)}.

X₀ smooth proper; D₀ normal crossings (not necessarily strict: the orientation sheaf ε\_m records the monodromy of the branches)

Compact-support form; the ordinary-cohomology form for H^\*(U) is its Poincaré dual

The orientation twist det E(G) cannot be omitted (PAPER-BERGSTROM-FABER-PAYNE-24/E7)

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Exactness of 0 → j_!ℚ\_ℓ → ℚ\_ℓ → ν\_{1\*}ε\_1 → ν\_{2\*}ε\_2 → ⋯ → ν\_{d\*}ε\_d → 0 on X₀: étale locally D₀ is a union of coordinate hyperplanes and the complex is the augmented Čech (Mayer–Vietoris) resolution of the extension by zero, with the signs organised by the orientation sheaves (EDC.0, SF.2).
2. Applying RΓ(X, −) and filtering by the stupid filtration gives E₁^{m,k} = H^k(X, ν\_{m\*}ε\_m) = H^k(D^{(m)}, ε\_m) ⇒ H^{m+k}(X, j_!ℚ\_ℓ) = H^{m+k}\_c(U); the differential d₁ is induced by the maps of the resolution, the signed restriction maps.
3. Each D^{(m)}₀ is smooth proper of dimension d − m and ε\_m is a lisse sheaf of finite order, punctually pure of weight 0, so E₁^{m,k} is pure of weight k (DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (i); for stacks, DWP.7/purity-of-smooth-proper-dm-stacks).
4. d_r : E_r^{m,k} → E_r^{m+r,k−r+1} is a Frobenius-equivariant map between pure modules of weights k and k − r + 1, hence zero for r ≥ 2 (DWP.0/disjoint-spectra-no-intertwiner); so E₂ = E_∞ and the abutment filtration has pure graded pieces E₂^{m,k} of weight k, which identifies it with the weight filtration (DWP.0/weight-decomposition).

Acceptance checks:

- Acceptance: X₀ = ℙ¹, D₀ = {0, ∞}: E₁^{0,0} = ℚ\_ℓ, E₁^{0,2} = ℚ\_ℓ(−1), E₁^{1,0} = ℚ\_ℓ², d₁ : ℚ\_ℓ → ℚ\_ℓ² the diagonal; H¹\_c(𝔾\_m) = coker d₁ = ℚ\_ℓ of weight 0 and H²\_c = ℚ\_ℓ(−1).
- Acceptance (orientation): for M_{1,2} ⊂ M̄\_{1,2}, the twisted E₁ page gives e_c = 𝕃², χ\_c = 1, matching #M_{1,2}(𝔽\_q) = q²; the untwisted page printed in Bergström–Faber–Payne (3) would give χ\_c = 2.
- Non-example: the spectral sequence does not degenerate at E₁: for ℙ¹ ⊃ {0, ∞}, d₁ ≠ 0.

Direct inputs: [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), [DWP.7/purity-of-smooth-proper-dm-stacks](#dwp-7-purity-of-smooth-proper-dm-stacks), [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition), `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.1`.

Sources: [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2), proof of Proposition 4.2, p. 7. The geometric instance for DM stacks; the E₁ term must carry det E(G) (PAPER-BERGSTROM-FABER-PAYNE-24/E7). [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2), proof of Proposition 4.2, p. 7. Galois equivariance of the ℓ-adic weight spectral sequence.

Declaration id: `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-9"></a>

## DWP.9 — Absolute hard Lefschetz after weights

All thirteen targets kept; the graded-operator lemma is narrowed to the pairings, citing EDC.7/abstract-primitive-decomposition.

<a id="dwp-9-lefschetz-operator"></a>

### The Lefschetz operator of a line bundle

Let k be an algebraically closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n, and L a line bundle on X with first Chern class η = c₁(L) ∈ H²(X, ℚ\_ℓ(1)) (EDC.3). The Lefschetz operator is L_η = η ∪ − : H^j(X, ℚ\_ℓ(m)) → H^{j+2}(X, ℚ\_ℓ(m + 1)), and its r-th iterate is cup product with η^r ∈ H^{2r}(X, ℚ\_ℓ(r)). For 0 ≤ r ≤ n: the hard Lefschetz map is η^r ∪ − : H^{n−r}(X, ℚ\_ℓ) → H^{n+r}(X, ℚ\_ℓ(r)); the primitive part is P^{n−r}(X) = ker(η^{r+1} ∪ − : H^{n−r}(X, ℚ\_ℓ) → H^{n+r+2}(X, ℚ\_ℓ(r + 1))); the Lefschetz pairing is ψ\_r(x, y) = Tr_X(η^r ∪ x ∪ y) ∈ ℚ\_ℓ(r − n) for x, y ∈ H^{n−r}(X, ℚ\_ℓ), where Tr_X : H^{2n}(X, ℚ\_ℓ(n)) → ℚ\_ℓ is the trace of EDC.2. Tate twists are kept: the source's identification ℤ\_ℓ ≅ ℤ\_ℓ(1) over k is not used.

X smooth projective of pure dimension n over an algebraically closed field with ℓ invertible

L arbitrary in the construction; ampleness is a hypothesis of the theorems

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Lefschetz operator**.

Uses:

- Weil II Théorème (4.1.1), p. 217: hard Lefschetz is the bijectivity of the iterates of this operator
- Weil II Corollaire (4.1.5), p. 218: the form Tr(η^i x y) on H^{n−i}(X) is the Lefschetz pairing
- Weil II Théorème (6.2.13), p. 250: the same operator on H^\*(X, K) for a complex K
- `WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison`: the arithmetic Frobenius-equivariant isomorphism η^a : H^{d−a} → H^{d+a}(a) with twists restored
- `MotivesAndAlgebraicCycles:MC.7/lefschetz-and-hodge-standard-conjectures`: the class inverting η^r, whose algebraicity is the Lefschetz standard conjecture, is defined through this operator and hard Lefschetz
- `EtaleDualityAndPerverseSheaves:EDC.7`: relative hard Lefschetz for a projective morphism specialises to this operator over a point

API:

- `TauCeti.HardLefschetz.lefschetzOperator` (data): lefschetzOperator η : H^j(X, ℚ\_ℓ(m)) →ₗ H^{j+2}(X, ℚ\_ℓ(m + 1)), x ↦ η ∪ x.
- `TauCeti.HardLefschetz.lefschetzOperator_pow` (simp): (lefschetzOperator η)^r = cup product with η^r ∈ H^{2r}(X, ℚ\_ℓ(r)).
- `TauCeti.HardLefschetz.lefschetzOperator_smul` (simp): lefschetzOperator (m • η) = m • lefschetzOperator η, and η(L^{⊗m}) = m • η(L).
- `TauCeti.HardLefschetz.lefschetzOperator_comm_pullback` (functoriality): For g : X′ → X, g\* ∘ L_{η(L)} = L_{η(g\*L)} ∘ g\*.
- `TauCeti.HardLefschetz.lefschetzOperator_galois` (functoriality): For (X, L) defined over k₀ ⊂ k, L_η commutes with the action of Gal(k/k₀).
- `TauCeti.HardLefschetz.lefschetzOperator_eq_gysin_restrict` (characterisation): For L very ample and a smooth hyperplane section i : Y → X, L_η = i_\* ∘ i\*.
- `TauCeti.HardLefschetz.lefschetzOperator_selfAdjoint` (relation): Tr_X(L_η x ∪ y) = Tr_X(x ∪ L_η y).
- `TauCeti.HardLefschetz.lefschetzOperator_pow_top` (relation): η^{n+1} = 0 and Tr_X(η^n) = deg_L(X); if L is ample and X is nonempty, this degree is > 0. For X empty, it is 0.
- `TauCeti.HardLefschetz.primitivePart` (data): P^{n−r}(X) = ker(η^{r+1} ∪ − on H^{n−r}(X, ℚ\_ℓ)).
- `TauCeti.HardLefschetz.lefschetzPairing` (data): ψ\_r(x, y) = Tr_X(η^r ∪ x ∪ y) on H^{n−r}(X, ℚ\_ℓ), with values in ℚ\_ℓ(r − n).
- `TauCeti.HardLefschetz.lefschetzPairing_symm` (relation): ψ\_r(y, x) = (−1)^{n−r} ψ\_r(x, y).

Unit tests:

- `TauCeti.HardLefschetz.lefschetzOperator_projectiveSpace` (computation): For X = ℙ^n and L = 𝒪(1): H^{2j}(ℙ^n, ℚ\_ℓ(j)) = ℚ\_ℓ·η^j, L_η(η^j) = η^{j+1} for j < n, η^{n+1} = 0, and Tr(η^n) = 1.
- `TauCeti.HardLefschetz.lefschetzOperator_trivial_bundle` (non-example): For L = 𝒪\_X, η = 0 and L_η = 0; on X = ℙ¹, η : H⁰ → H²(1) is the zero map, so ampleness cannot be dropped from hard Lefschetz.
- `TauCeti.HardLefschetz.lefschetzOperator_degree_zero` (non-example): For an elliptic curve E and a line bundle L of degree 0, c₁(L) = 0 in H²(E, ℚ\_ℓ(1)) ≅ ℚ\_ℓ (the degree), so L_η = 0 although L may be nontrivial.
- `TauCeti.HardLefschetz.lefschetzOperator_point` (degenerate): For n = 0 (X a finite set of points) L_η = 0 on H⁰ and P⁰(X) = H⁰(X); the hard Lefschetz map for r = 0 is the identity.
- `TauCeti.HardLefschetz.lefschetzPairing_curve` (computation): For a smooth projective curve of genus g and L of degree e > 0: ψ₀ on H¹ is Tr(x ∪ y), alternating and nondegenerate on a space of dimension 2g; ψ₁ on H⁰ is x·y·e.

Proof or construction:

1. η is EDC.3's Chern class; cup product and the trace are EDC.0 and EDC.2. Graded commutativity x ∪ y = (−1)^{ab} y ∪ x for x ∈ H^a, y ∈ H^b and η of even degree give L_η(x) ∪ y = x ∪ L_η(y).
2. c₁(L ⊗ M) = c₁(L) + c₁(M) (EDC.3), so η(L^{⊗m}) = m·η(L) and L_{mη} = m·L_η; for m ≠ 0 this is invertible in ℚ\_ℓ, which allows replacing an ample L by a very ample power.
3. For L very ample and Y ⊂ X a smooth hyperplane section in the embedding defined by L, with i : Y → X, η = cl(Y) and L_η = i_\* ∘ i\* (projection formula for the Gysin map of EDC.3).

Acceptance checks:

- Over a finite field, or for (X, L) defined over a subfield k₀ with k an algebraic closure of k₀, L_η commutes with Gal(k/k₀): η is fixed and cup product is Galois-equivariant.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Théorème (4.1.1), p. 217. The class η and the cup product by its powers; the source suppresses the twist by fixing ℤ\_ℓ ≅ ℤ\_ℓ(1) over k (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1), p. 217. The temporary trivialisation which this plan does not use (OCR cleaned). [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf), (1.5), p. 108. Definition of the primitive part (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/lefschetz-operator`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-9-invariant-form-on-invariants-4-1-4"></a>

### An invariant nondegenerate form stays nondegenerate on the invariants of a completely reducible representation

Let π be a group, K a field, V a finite-dimensional K-vector space with a completely reducible (semisimple) representation of π, and Φ a π-invariant bilinear form on V (Φ(gx, gy) = Φ(x, y) for g ∈ π) which is nondegenerate. Then the restriction of Φ to the invariant subspace V^π is nondegenerate.

V semisimple as a representation of π

Φ need not be symmetric or alternating

Proof or construction:

1. By complete reducibility V = V^π ⊕ W with W a subrepresentation. W has no nonzero π-invariant linear form: the kernel of such a form would have a π-stable complement, a trivial one-dimensional subrepresentation of W, contained in V^π ∩ W = 0.
2. For v ∈ V^π the linear forms w ↦ Φ(v, w) and w ↦ Φ(w, v) on W are π-invariant (Φ(v, gw) = Φ(gv, gw) = Φ(v, w)), hence zero. So Φ = Φ|V^π ⊕ Φ|W and nondegeneracy of Φ gives nondegeneracy of Φ|V^π.

Acceptance checks:

- Acceptance: V = K² with the swap action of π = ℤ/2 and Φ = the standard dot product (char K ≠ 2): V^π = K·(1, 1), and Φ((1, 1), (1, 1)) = 2 ≠ 0.
- Non-example: for π = ℤ acting on K² by the unipotent matrix \[\[1, 1], \[0, 1]] (not semisimple) and the invariant alternating form Φ = det, V^π = K·e₁ and Φ(e₁, e₁) = 0: complete reducibility cannot be dropped.

Direct inputs: `mathlib:Representation`, `mathlib:Representation.invariants`, `mathlib:IsSemisimpleModule`, `mathlib:Representation.asModule`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:LinearMap.BilinForm.restrict`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Lemme (4.1.4), p. 218. Statement; the proof is the one given (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/invariant-form-on-invariants-4-1-4`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-9-hyperplane-factorisation-4-1-2"></a>

### Reduction of hard Lefschetz to the middle intersection form on a hyperplane section

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n ≥ 1, L a very ample line bundle, η = c₁(L), i : Y → X the inclusion of a smooth hyperplane section in the embedding defined by L, and η\_Y = i\*η. (a) The Gysin map i_\* : H^j(Y, ℚ\_ℓ(m)) → H^{j+2}(X, ℚ\_ℓ(m + 1)) is the transpose of i\* under Poincaré duality on Y and X, and i_\* ∘ i\* = L_η. (b) For r ≥ 1 and x ∈ H^{n−r}(X, ℚ\_ℓ): η^r ∪ x = i_\*(η\_Y^{r−1} ∪ i\*x). (c) (Weak Lefschetz) i\* : H^j(X) → H^j(Y) is an isomorphism for j < n − 1 and injective for j = n − 1; dually i_\* : H^j(Y) → H^{j+2}(X)(1) is an isomorphism for j > n − 1 and surjective for j = n − 1. (d) Suppose hard Lefschetz holds for (Y, L|\_Y). Then η^r ∪ − : H^{n−r}(X, ℚ\_ℓ) → H^{n+r}(X, ℚ\_ℓ(r)) is an isomorphism for every r ≠ 1, and it is an isomorphism for r = 1 iff the form ⟨y, y′⟩ = Tr_Y(y ∪ y′) on H^{n−1}(Y, ℚ\_ℓ) is nondegenerate on the image of i\* : H^{n−1}(X, ℚ\_ℓ) → H^{n−1}(Y, ℚ\_ℓ) (Weil II 4.1.2).

Y a smooth hyperplane section for a very ample L; X smooth projective of pure dimension n ≥ 1

Hard Lefschetz for Y is an assumption of (d) (the induction hypothesis), not a conclusion

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (a) EDC.3 (Gysin map, projection formula, cl(Y) = η) and EDC.2 (Poincaré duality: Tr_X(i_\*y ∪ x) = Tr_Y(y ∪ i\*x)).
2. (b) η^r ∪ x = η ∪ (η^{r−1} ∪ x) = i_\* i\*(η^{r−1} ∪ x) = i_\*(η\_Y^{r−1} ∪ i\*x).
3. (c) EDC.4's weak Lefschetz theorem for a smooth hyperplane section of a smooth projective variety, and its Poincaré-dual Gysin form.
4. (d) r = 0 is the identity. For r ≥ 2, in (b) the outer maps i\* on H^{n−r} and i_\* on H^{(n−1)+(r−1)} are isomorphisms by (c), and the middle map is hard Lefschetz for Y in degree (n − 1) − (r − 1). For r = 1, η = i_\* ∘ i\* with i\* injective onto V = i\*H^{n−1}(X) and ker(i_\*|H^{n−1}(Y)) = V^⊥ by (a); since dim H^{n−1}(X) = dim H^{n+1}(X) (Poincaré duality), η is bijective iff V ∩ V^⊥ = 0, i.e. iff ⟨ , ⟩ is nondegenerate on V.

Acceptance checks:

- Acceptance: X = ℙ², Y a line: H¹ = 0 and the r = 1 condition is vacuous; η² : H⁰ → H⁴(2) is i_\* ∘ η\_Y ∘ i\*, an isomorphism.
- Acceptance: for a smooth projective surface X ⊂ ℙ^N (n = 2) and a smooth hyperplane section Y, the case r = 1 says that η : H¹(X) → H³(X)(1) is bijective iff Tr_Y(y ∪ y′) is nondegenerate on the image of H¹(X) in H¹(Y).
- Non-example: for r = 1 the weak Lefschetz theorem alone gives only injectivity of i\* and surjectivity of i_\*; bijectivity of η on H^{n−1} is the nondegeneracy statement, which needs monodromy.

Direct inputs: [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.4`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, proof of (4.1.1) and Lemme (4.1.2), p. 217. Lemma 4.1.2; the factorisation η^i = Gysin ∘ η^{i−1} ∘ restriction and the use of weak Lefschetz precede it (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, proof of (4.1.1), p. 217. The case r ≥ 2 (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/hyperplane-factorisation-4-1-2`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety"></a>

### Arithmetic models of a polarised smooth projective variety and cospecialisation

Let k be algebraically closed with ℓ invertible in k, X a smooth projective k-scheme of pure dimension n and L a very ample line bundle, with X ⊂ P = ℙ^N_k the embedding it defines. There are an integral scheme S of finite type over ℤ\[1/ℓ], a morphism x̄ : Spec k → S, a smooth projective morphism f_S : X_S → S of pure relative dimension n with a closed embedding X_S ⊂ ℙ^N_S (L_S = 𝒪(1)|X_S), and an isomorphism (X_S ⊂ ℙ^N_S) ×\_S k ≅ (X ⊂ P). For such a model: (i) R^jf_{S\*}ℚ\_ℓ is lisse and its formation commutes with base change; for every geometric point s̄ of S the cospecialisation isomorphisms H^\*(X_s̄, ℚ\_ℓ) ≅ H^\*(X, ℚ\_ℓ) are ring isomorphisms compatible with the traces and carry c₁(L_s̄) to c₁(L); in particular hard Lefschetz holds for (X, L) iff it holds for (X_s̄, L_s̄) for one (equivalently every) closed point s of S. (ii) ℚ̄\_ℓ\[0] on X is potentially pure of weight 0, with this model (EDC.7/weight-potentially-property-p-3-4-10). (iii) If U_S ⊂ ℙ̌^N_S is the open subscheme of hyperplanes whose section of X_S is smooth over S and g_S : Z_S → U_S the family of these sections, then g_S is smooth projective, its fibre over k is the family g : Z → U of smooth hyperplane sections of X, and R^jg_\*ℚ\_ℓ is potentially punctually pure of weight j.

k algebraically closed of any characteristic ≠ ℓ

The model is part of the data; S may be shrunk to any dense open containing the image of x̄

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Noetherian approximation (AdicCoefficientsAndComparisons L2): write k as the filtered union of its finitely generated ℤ\[1/ℓ]-subalgebras A; X ⊂ ℙ^N_k is defined by finitely many equations, so descends to X_A ⊂ ℙ^N_A for some A; smoothness, properness, flatness and pure relative dimension n descend after enlarging A and inverting an element. Take S = Spec A.
2. (i) Proper and smooth base change (SF.2): R^jf_{S\*}ℚ\_ℓ is lisse and commutes with base change; S is connected, so the stalks at any two geometric points are identified along étale paths. Cup product R^a ⊗ R^b → R^{a+b}, the relative trace R^{2n}f_{S\*}ℚ\_ℓ(n) → ℚ\_ℓ (EDC.2) and c₁(L_S) ∈ H⁰(S, R²f_{S\*}ℚ\_ℓ(1)) (EDC.3, compatible with base change) are morphisms or sections of lisse sheaves, so the identifications respect them.
3. (ii) On each closed fibre X_s, smooth over the finite field k(s), ℚ̄\_ℓ\[0] is pure of weight 0 (EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5 (b)).
4. (iii) The incidence family is smooth over the open of hyperplanes giving smooth sections (LPV.3/dual-variety, which is the fibre over k; openness over S by the Jacobian criterion), and DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11 applies to g_S over each closed point of S.

Acceptance checks:

- Acceptance: for X = ℙ^n_k, the model S = Spec ℤ\[1/ℓ], X_S = ℙ^n_S works, with cospecialisation sending η^j to η^j.
- Acceptance: for k = ℂ and a smooth projective curve of genus g, a model over a finitely generated ℤ\[1/ℓ]-algebra exists, and the cospecialisation carries the symplectic cup-product form on H¹ to the one on a reduction modulo p.
- Non-example: a variety over k = ℂ, or a nonisotrivial elliptic curve over an algebraic closure of 𝔽\_p(t), is not defined over any finite field; the model is over a finitely generated ℤ\[1/ℓ]-algebra, and only its closed fibres are over finite fields.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-potentially-property-p-3-4-10`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5`, [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Introduction, p. 142. Specialisation from finite fields to arbitrary algebraically closed fields (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Exemple (3.4.11), p. 210. The limit argument building the model (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-9-global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3"></a>

### The image of H^{n−1}(X) in H^{n−1}(Y) is the monodromy invariants

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n ≥ 1 embedded by a very ample L in P = ℙ^N, U = P̌ − X̌ the open of hyperplanes H with X ∩ H smooth, g : Z → U the family of smooth hyperplane sections, u ∈ U(k), Y = Z_u and i : Y → X. Then the image of i\* : H^{n−1}(X, ℚ\_ℓ) → H^{n−1}(Y, ℚ\_ℓ) is the subspace H^{n−1}(Y, ℚ\_ℓ)^{π₁(U, u)} of monodromy invariants. If D ⊂ P̌ is a sufficiently general line through u (a Lefschetz pencil when one exists), the image of π₁(D ∩ U, u) in GL(H^{n−1}(Y)) equals that of π₁(U, u), so the image of i\* is also H^{n−1}(Y)^{π₁(D ∩ U, u)} (Weil II 4.1.3).

X smooth projective over an algebraically closed field of characteristic ≠ ℓ

No hard Lefschetz for X is used; the statement is LPV.7's global invariant cycle theorem in the constant-coefficient case

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Apply LPV.7:invariant-cycles' global invariant cycle theorem (Weil II 6.2.12, with 6.2.11) to K = ℚ̄\_ℓ\[0] on X with the integer n − 1 in place of the source's n. Its support hypothesis holds: DK = ℚ̄\_ℓ(n)\[2n], so DK\[−2(n − 1) − 2] = ℚ̄\_ℓ(n)\[0] has support of dimension n ≤ (n − 1) + 1 − 0 in degree 0 and no other cohomology.
2. K is potentially pure with the model of DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety (ii). For K = ℚ̄\_ℓ the open where the R^jg_\*q\*K are lisse contains U, since g is smooth and projective there (LPV.3/dual-variety); every u ∈ U gives a general section.
3. The identification of H^{n−1}(X, K) with the invariants is through restriction, which is injective by weak Lefschetz (EDC.4).
4. For the pencil form, Bertini surjectivity (LPV.5/bertini-surjectivity-on-fundamental-groups; Weil II 6.2.10.2) identifies the monodromy images of π₁(D ∩ U, u) and π₁(U, u).

Acceptance checks:

- Acceptance: for X = ℙ² (n = 2) and Y a line, H¹(Y) = 0 = H¹(X). For X a smooth cubic surface in ℙ³ and Y a smooth plane section (an elliptic curve), H¹(X) = 0, so the monodromy of the family of smooth plane sections has no nonzero invariants on H¹(Y) ≅ ℚ\_ℓ².
- Acceptance: for X = C × C′ a product of curves with L of bidegree (a, b), H¹(X) = H¹(C) ⊕ H¹(C′) injects into H¹(Y) as the invariant part.
- Non-example: the invariant-cycle statement is about invariants of the geometric monodromy group; over a finite field the arithmetic Frobenius is not part of the group π₁(U, u) here.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`, [DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety](#dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety), `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.3), p. 218. Statement (OCR cleaned); the source cites SGA 7 XVIII (5.6.10) and its own §4.3 for proofs. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Corollaire (6.2.12), p. 250. The global invariant cycle theorem used here, owned by LPV.7:invariant-cycles (read from the page image).

Declaration id: `DeligneWeightsAndPurity:DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-9-hard-lefschetz-4-1-1"></a>

### The hard Lefschetz theorem

Let k be an algebraically closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n, L an ample line bundle on X and η = c₁(L) ∈ H²(X, ℚ\_ℓ(1)). Then for every r ≥ 0 the map η^r ∪ − : H^{n−r}(X, ℚ\_ℓ) → H^{n+r}(X, ℚ\_ℓ(r)) is an isomorphism. If (X, L) = (X₀, L₀) ⊗\_{k₀} k for a subfield k₀ of which k is an algebraic closure, the isomorphism is Gal(k/k₀)-equivariant.

X smooth projective of pure dimension n; L ample

k algebraically closed of any characteristic ≠ ℓ; ℚ\_ℓ coefficients (the statement fails integrally in general)

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Hard Lefschetz theorem**.

Proof or construction:

1. Reduce to X connected. Since η(L^{⊗m}) = m·η(L) and m is invertible in ℚ\_ℓ (DWP.9/lefschetz-operator), assume L very ample, defining X ⊂ P.
2. Induction on n; for n = 0 the case r = 0 is the identity and both sides vanish for r ≥ 1. For n ≥ 1 choose u ∈ U = P̌ − X̌ (nonempty, LPV.3/dual-variety) and Y = X ∩ H_u, smooth projective of pure dimension n − 1 with L|Y very ample; by induction hard Lefschetz holds for Y.
3. By DWP.9/hyperplane-factorisation-4-1-2 (d) it remains to show that ⟨y, y′⟩ = Tr_Y(y ∪ y′) is nondegenerate on V = i\*H^{n−1}(X) ⊂ H^{n−1}(Y).
4. V = H^{n−1}(Y)^{π₁(U, u)} by DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3. The representation of π₁(U, u) on H^{n−1}(Y, ℚ\_ℓ) is semisimple by DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13 applied to the smooth projective family g : Z → U over the smooth connected U. The form ⟨ , ⟩ is nondegenerate (Poincaré duality on Y, EDC.2) and π₁(U, u)-invariant, being the fibre of the relative pairing R^{n−1}g_\*ℚ\_ℓ ⊗ R^{n−1}g_\*ℚ\_ℓ → R^{2n−2}g_\*ℚ\_ℓ → ℚ\_ℓ(1 − n) of lisse sheaves (EDC.2 relative trace).
5. DWP.9/invariant-form-on-invariants-4-1-4 gives nondegeneracy on V.
6. Equivariance: η^r is fixed by Gal(k/k₀) when L is defined over k₀, and cup product is Galois-equivariant (DWP.9/lefschetz-operator api lefschetzOperator_galois).

Acceptance checks:

- Acceptance: X = ℙ^n, L = 𝒪(1): η^r : H^{n−r} → H^{n+r}(r) is ℚ\_ℓ·η^{(n−r)/2} ↦ ℚ\_ℓ·η^{(n+r)/2} for n − r even and 0 → 0 otherwise.
- Acceptance: a smooth projective curve (n = 1): r = 1 is the isomorphism H⁰ → H²(1) given by multiplication by deg L > 0.
- Acceptance: an abelian surface A over 𝔽̄\_p with an ample L: η² : H⁰ → H⁴(2) is multiplication by (L·L) = 2χ(L) > 0, and η : H¹ → H³(1) is an isomorphism between 4-dimensional spaces.
- Acceptance (specialisation): by DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety (i), the theorem for k = ℂ and for k = 𝔽̄\_p are equivalent for (X, L) with a model over a finitely generated ℤ\[1/ℓ]-algebra.
- Non-example: this is hard Lefschetz, not the Hodge standard conjecture: no sign or positivity condition of Hodge–Riemann type on ψ\_r restricted to primitive classes is asserted in characteristic p, and no algebraic correspondence inverting η^r is constructed.
- Non-example: for L not ample (e.g. pulled back from a curve along a fibration X → C with dim X ≥ 2), η^n = 0 on H⁰ and the statement fails.

Direct inputs: [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), [DWP.9/hyperplane-factorisation-4-1-2](#dwp-9-hyperplane-factorisation-4-1-2), [DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3](#dwp-9-global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3), [DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13](#dwp-8-semisimplicity-of-proper-smooth-direct-images-3-4-13), [DWP.9/invariant-form-on-invariants-4-1-4](#dwp-9-invariant-form-on-invariants-4-1-4), `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Théorème (4.1.1), p. 217. Statement; the twists are restored here (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, proof of (4.1.1), p. 218. The semisimplicity input (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-9-lefschetz-decomposition-of-a-graded-operator"></a>

### Primitive decomposition for a graded operator satisfying hard Lefschetz

Parts (i) and (ii) are EDC.7/abstract-primitive-decomposition, for the graded Lefschetz object (EDC.7/graded-lefschetz-object) in finite-dimensional K-vector spaces with the trivial twist, after reindexing V^{n+j} as L^j; they are cited here, not planned again. This node owns (iii), the Lefschetz pairings on the primitive parts. Let K be a field, n ∈ ℕ, V a finite-dimensional K-vector space which is the internal direct sum of subspaces V^j (0 ≤ j ≤ 2n; V^j = 0 otherwise), and λ ∈ End(V) with λ(V^j) ⊆ V^{j+2}, such that λ^r : V^{n−r} → V^{n+r} is bijective for 0 ≤ r ≤ n. Put P^{n−r} = V^{n−r} ∩ ker λ^{r+1} for 0 ≤ r ≤ n. Then: (i) for 0 ≤ r ≤ n, the maps ⊕\_{k ≥ 0} λ^k : ⊕\_{k≥0} P^{n−r−2k} → V^{n−r} and ⊕\_{k ≥ 0} λ^{r+k} : ⊕\_{k≥0} P^{n−r−2k} → V^{n+r} are isomorphisms; (ii) dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}; (iii) if B is a nondegenerate bilinear form on V with B(V^a, V^b) = 0 unless a + b = 2n and B(λx, y) = B(x, λy), then for 0 ≤ r ≤ n the form ψ\_r(x, y) = B(λ^r x, y) on V^{n−r} is nondegenerate, the decomposition (i) of V^{n−r} is ψ\_r-orthogonal, and ψ\_r restricts to a nondegenerate form on P^{n−r}; if moreover B(y, x) = (−1)^a B(x, y) for x ∈ V^a, then ψ\_r is (−1)^{n−r}-symmetric.

Hard Lefschetz bijectivity in every degree is the hypothesis

Any field K

Proof or construction:

1. (i) For 0 ≤ r ≤ n, first prove V^{n−r} = P^{n−r} ⊕ λV^{n−r−2}. If r+2 ≤ n, hard Lefschetz makes λ^{r+2} : V^{n−r−2} → V^{n+r+2} bijective. Choose its unique preimage x′ of λ^{r+1}x; then x−λx′ is primitive. If λx′ is primitive, λ^{r+2}x′=0 forces x′=0, so the sum is direct. For r+2>n both outside-degree spaces vanish, giving the boundary cases in degrees 0 and 1. Iterate this direct-sum decomposition downward by steps of two to get the lower-degree formula; apply the bijection λ^r to obtain the upper-degree formula. This handles both parities and uses only the stated hard Lefschetz maps, as in Deligne (1968) (1.5)–(1.6).
2. (ii) is the dimension count of (i).
3. (iii) ψ\_r(x, y) = B(λ^r x, y) is nondegenerate because λ^r : V^{n−r} → V^{n+r} is bijective and B pairs V^{n+r} perfectly with V^{n−r}. For x = λ^a x₀ and y = λ^b y₀ with x₀ ∈ P^{n−r−2a}, y₀ ∈ P^{n−r−2b} and a < b: ψ\_r(x, y) = B(λ^{r+a+b}x₀, y₀) = 0, because x₀ is killed by λ^{r+2a+1} and r + a + b ≥ r + 2a + 1; for a > b move the powers of λ onto y₀ instead. So (i) is ψ\_r-orthogonal, and ψ\_r is nondegenerate on each summand, in particular on P^{n−r}. Symmetry: B(λ^r y, x) = B(y, λ^r x) = (−1)^{n−r}B(λ^r x, y).

Acceptance checks:

- Acceptance: V = H^\*(ℙ²) (n = 2): P⁰ = V⁰, P² = 0, V² = λP⁰, V⁴ = λ²P⁰.
- Acceptance: V = H^\*(E) of an elliptic curve (n = 1): P⁰ = V⁰, P¹ = V¹ and V² = λP⁰.
- Non-example: if λ^r fails to be bijective for one r (e.g. λ = 0 on H^\*(ℙ¹)), (i) fails: V² is not covered.

Direct inputs: `mathlib:DirectSum.IsInternal`, `mathlib:LinearMap.ker`, `mathlib:Module.finrank`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `EtaleDualityAndPerverseSheaves:EDC.7/abstract-primitive-decomposition`, `EtaleDualityAndPerverseSheaves:EDC.7/graded-lefschetz-object`.

Sources: [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf), Théorème (1.5) and (1.6), p. 108. The primitive decomposition for an endomorphism of degree 2 whose iterates satisfy hard Lefschetz (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-9-primitive-decomposition-and-lefschetz-pairings"></a>

### Primitive Lefschetz decomposition and nondegenerate Lefschetz pairings

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n, L ample, η = c₁(L). (i) For 0 ≤ r ≤ n, H^{n−r}(X, ℚ\_ℓ) = ⊕\_{k≥0} η^k ∪ P^{n−r−2k}(X)(−k) and H^{n+r}(X, ℚ\_ℓ(r)) = ⊕\_{k≥0} η^{r+k} ∪ P^{n−r−2k}(X)(−k), where P^{n−r}(X) = ker(η^{r+1} on H^{n−r}(X, ℚ\_ℓ)) is the primitive part (DWP.9/lefschetz-operator) and η^k ∪ P(−k) denotes the image of P under η^k ∪ − composed with the inverse twist; dim P^{n−r} = b_{n−r} − b_{n−r−2}. (ii) The Lefschetz pairing ψ\_r(x, y) = Tr_X(η^r ∪ x ∪ y) on H^{n−r}(X, ℚ\_ℓ) is nondegenerate and (−1)^{n−r}-symmetric, the decomposition (i) of H^{n−r} is ψ\_r-orthogonal, and ψ\_r is nondegenerate on P^{n−r}(X). All these are Gal(k/k₀)-equivariant when (X, L) is defined over k₀.

X smooth projective of pure dimension n, L ample

No sign (Hodge–Riemann) positivity of ψ\_r on primitive classes is asserted

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Primitive Lefschetz decomposition**.

Proof or construction:

1. Apply DWP.9/lefschetz-decomposition-of-a-graded-operator to V = ⊕\_j H^j(X, ℚ\_ℓ(⌊j/2⌋)) after choosing, for the linear algebra only, a generator of ℚ\_ℓ(1) over the algebraically closed k, so that λ = L_η is a degree-2 endomorphism; the hypothesis is DWP.9/hard-lefschetz-4-1-1, and B is Poincaré duality Tr_X(x ∪ y) (EDC.2), nondegenerate and graded-symmetric, with B(λx, y) = B(x, λy) (DWP.9/lefschetz-operator).
2. The resulting decompositions and pairings are independent of the chosen generator up to the corresponding twists, so they are stated with twists restored; Galois equivariance follows from that of η and of cup product.

Acceptance checks:

- Acceptance: X a smooth projective surface (n = 2): H² = η·H⁰(−1) ⊕ P²(X), P² = ker(η ∪ − : H² → H⁴(1)), the orthogonal of η for Tr(x ∪ y), and Tr(x ∪ y) is nondegenerate on P².
- Acceptance: X = ℙ^n: P⁰ = H⁰ and every other primitive part is 0.
- Non-example: integrally the decomposition can fail (Weil II 4.3.10: in ℤ\_ℓ-cohomology ker(η) on H^n of a hyperplane-section pair can be the whole torsion subgroup); the statement is for ℚ\_ℓ.

Direct inputs: [DWP.9/lefschetz-decomposition-of-a-graded-operator](#dwp-9-lefschetz-decomposition-of-a-graded-operator), [DWP.9/hard-lefschetz-4-1-1](#dwp-9-hard-lefschetz-4-1-1), [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf), (1.5)–(1.6), p. 108. The primitive decomposition in the abstract setting (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.1.5), proof, p. 218. Nondegeneracy of the Lefschetz pairing (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/primitive-decomposition-and-lefschetz-pairings`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-9-alternating-forms-have-even-rank"></a>

### A space with a nondegenerate alternating form has even dimension

Let K be a field and V a finite-dimensional K-vector space carrying a nondegenerate alternating bilinear form B (B(x, x) = 0 for all x). Then dim_K V is even.

Any field K, including characteristic 2 (alternating, not merely skew-symmetric)

Proof or construction:

1. Induction on dim V. If V ≠ 0 pick x ≠ 0 and, by nondegeneracy, y with B(x, y) = 1; W = span(x, y) has Gram matrix \[\[0, 1], \[−1, 0]], so B|W is nondegenerate and V = W ⊕ W^⊥ (B is reflexive since alternating; Mathlib's LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal). B|W^⊥ is alternating and nondegenerate, and dim W = 2.

Acceptance checks:

- Acceptance: K² with B = det is nondegenerate alternating, of dimension 2.
- Non-example: in characteristic 2 the form x₁y₁ on K¹ is symmetric (= skew-symmetric) and nondegenerate but not alternating, on an odd-dimensional space: alternating cannot be weakened to skew-symmetric.

Direct inputs: `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal`, `mathlib:Module.finrank`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.1.5), proof, p. 218. The parity argument uses exactly this lemma (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/alternating-forms-have-even-rank`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-9-odd-betti-numbers-are-even-4-1-5"></a>

### Odd Betti numbers of smooth projective varieties are even

Let k be algebraically closed with ℓ invertible and X a smooth projective k-scheme. Then b_j(X) = dim_{ℚ\_ℓ} H^j(X, ℚ\_ℓ) is even for every odd j.

X smooth projective; the statement for smooth proper nonprojective X is not asserted (the source records that it is not known to it in positive characteristic)

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Evenness of odd Betti numbers**.

Proof or construction:

1. Reduce to X connected of pure dimension n and choose an ample L, η = c₁(L).
2. For odd j ≤ n write j = n − r; ψ\_r(x, y) = Tr_X(η^r ∪ x ∪ y) is nondegenerate on H^{n−r}(X, ℚ\_ℓ) (DWP.9/primitive-decomposition-and-lefschetz-pairings (ii)) and, n − r being odd, alternating: x ∪ x = −x ∪ x by graded commutativity, so x ∪ x = 0 in characteristic 0 coefficients. After trivialising the one-dimensional target ℚ\_ℓ(r − n), DWP.9/alternating-forms-have-even-rank gives b_j even.
3. For odd j > n, b_j = b_{2n−j} by Poincaré duality (EDC.2) and 2n − j < n is odd.

Acceptance checks:

- Acceptance: a smooth projective curve of genus g has b₁ = 2g.
- Acceptance: an abelian variety of dimension g has b_j = C(2g, j), which is even for odd j.
- Non-example: a non-algebraic compact complex manifold (a Hopf surface, b₁ = 1) shows that some algebraic or Kähler input is needed; this node proves only the projective case

Direct inputs: [DWP.9/primitive-decomposition-and-lefschetz-pairings](#dwp-9-primitive-decomposition-and-lefschetz-pairings), [DWP.9/alternating-forms-have-even-rank](#dwp-9-alternating-forms-have-even-rank), `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.1.5), p. 218. Statement (OCR cleaned); 'Ce résultat devrait valoir sans hypothèse de projectivité, mais je ne sais pas le prouver en caractéristique ≠ 0' follows.

Declaration id: `DeligneWeightsAndPurity:DWP.9/odd-betti-numbers-are-even-4-1-5`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13"></a>

### Hard Lefschetz for potentially pure complexes

Let k be algebraically closed with ℓ invertible, X ⊂ P = ℙ^N_k a projective k-scheme, η = c₁(𝒪\_X(1)) ∈ H²(X, ℚ\_ℓ(1)), and K ∈ D^b_c(X, ℚ̄\_ℓ) a potentially pure complex, with a model (S, x̄, X_S ⊂ ℙ^N_S, K_S) witnessing potential purity (EDC.7/weight-potentially-property-p-3-4-10). Let n ∈ ℤ be such that for every i, dim Supp ℋ^i(K) ≤ n − i and dim Supp ℋ^i(DK\[−2n]) ≤ n − i (dim ∅ = −∞), where D is duality relative to k. Then for every r ≥ 0 the cup product η^r ∪ − : H^{n−r}(X, K) → H^{n+r}(X, K(r)) is an isomorphism.

X projective with the given embedding; η the class of 𝒪(1) of that embedding

K potentially pure with an explicit model; both support inequalities, for K and for DK\[−2n]

The integer n is part of the statement and need not be dim X

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Hard Lefschetz for pure complexes**.

Proof or construction:

1. Induction on dim X (Weil II 6.2.13, parallel to 4.1.1). If dim X = 0 and ℋ^iK ≠ 0, the hypotheses give 0 ≤ n − i and 0 ≤ n − (−i + 2n) = i − n, so i = n: H^iK = 0 for i ≠ n and the assertion is trivial.
2. For Y = X ∩ H_u a sufficiently general hyperplane section (u in the dense open U where the R^jg_\*q\*K are lisse), K|Y satisfies the hypotheses with n − 1, and D(K|Y) = (DK)|Y(−1)\[−2] (generic transversality; LPV.7:invariant-cycles' proof of 6.2.11, SGA 4½ \[Th. finitude] generic acyclicity through EDC.0). As in DWP.9/hyperplane-factorisation-4-1-2, using LPV.7's support-bound weak Lefschetz theorem 6.2.11 (i) for K and for DK, the induction reduces to r = 1, i.e. to the bijectivity of H^{n−1}(X, K) → H^{n−1}(Y, K) → H^{n+1}(X, K)(1), the second map being the transpose of restriction H^{n−1}(X, DK\[−2n]) → H^{n−1}(Y, DK\[−2n]).
3. It therefore suffices that the perfect duality (EDC.1, Verdier duality on the projective Y over the algebraically closed k) between H^{n−1}(Y, K) and H^{n−1}(Y, DK\[−2n]) induces a perfect duality between the images of H^{n−1}(X, K) and H^{n−1}(X, DK\[−2n]). By LPV.7's global invariant cycle theorem 6.2.12, applied to K and to DK\[−2n] (both potentially pure, D preserving purity, EDC.7/weight-pure-complexes), these images are the π₁(U, u)-invariants. With twists restored, the pairing has values in ℚ̄\_ℓ(1): on Y, D_Y(K|Y) = (DK)|Y(−1)\[−2], so DK\[−2n]|Y = D_Y(K|Y)(1)\[−2(n−1)]. Over algebraically closed k this is a one-dimensional constant target; retain its twist when forming Gysin.
4. The representation of π₁(U, u) on H^\*(Y_u, K) is semisimple: R^jg_\*(q\*K)|U is lisse and potentially punctually ι-pure (proper direct image preserves purity on the model, EDC.7/weight-proper-direct-image-preserves-purity-6-2-6 and DWP.8/variant-over-z-one-over-ell-6-2-7, and lisse cohomology sheaves of a pure complex on a smooth base are punctually pure, EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5), hence semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12. Conclude by DWP.9/invariant-form-on-invariants-4-1-4. More explicitly put A=H^{n−1}(Y,K) and B=H^{n−1}(Y,DK\[−2n]). The incidence pullback is smooth, so it preserves purity up to the normalised duality twist/shift (EDC.7/weight-directional-weight-estimates); B is dual to A up to the constant Tate line. Thus A⊕B is semisimple with the nondegenerate hyperbolic pairing between A and B. Apply 4.1.4 to A⊕B, whose invariants are A^G⊕B^G; its nondegeneracy says precisely that the pairing A^G×B^G is perfect.
5. The source identifies ℤ\_ℓ with ℤ\_ℓ(1) to view η in H²(X, ℤ\_ℓ); with the twist restored the target is H^{n+r}(X, K(r)).

Acceptance checks:

- Acceptance: for X smooth projective of pure dimension n and K = ℚ̄\_ℓ\[0], DK\[−2n] = ℚ̄\_ℓ(n)\[0], both supports have dimension n ≤ n − 0, and the theorem is DWP.9/hard-lefschetz-4-1-1.
- Acceptance: for K = IC_X(L) of a pure lisse L on a smooth dense open of a projective X of dimension d, placed in the normalisation K = IC\[−d] with n = d, the support conditions are the IC support conditions, and the conclusion is hard Lefschetz for intersection cohomology (consumed by EDC.7).
- Non-example (purity): for j : 𝔾\_m → ℙ¹, K = j_!ℚ̄\_ℓ and n = 1 the support conditions hold (ℋ⁰K has support ℙ¹ of dimension 1 ≤ 1; DK\[−2] = Rj_\*ℚ̄\_ℓ(1) has ℋ⁰ of support dimension 1 ≤ 1 and ℋ¹ supported on {0, ∞}, of dimension 0 ≤ 0), but η : H⁰(ℙ¹, j_!ℚ̄\_ℓ) = 0 → H²(ℙ¹, j_!ℚ̄\_ℓ)(1) = ℚ̄\_ℓ is not an isomorphism: j_!ℚ̄\_ℓ is mixed but not potentially pure.
- Non-example (supports): K = ℚ̄\_ℓ on ℙ¹ with n = 0 violates dim Supp ℋ⁰K ≤ 0, and η² : H^{−2} = 0 → H²(ℙ¹, ℚ̄\_ℓ(2)) ≠ 0 is not an isomorphism: n is dictated by the support conditions.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-potentially-property-p-3-4-10`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-pure-complexes`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-proper-direct-image-preserves-purity-6-2-6`, [DWP.8/variant-over-z-one-over-ell-6-2-7](#dwp-8-variant-over-z-one-over-ell-6-2-7), `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5`, [DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12](#dwp-8-potentially-pure-lisse-sheaves-are-semisimple-3-4-12), [DWP.9/invariant-form-on-invariants-4-1-4](#dwp-9-invariant-form-on-invariants-4-1-4), [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-directional-weight-estimates`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Théorème (6.2.13), p. 250. Read from the page image. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, proof of (6.2.13), p. 251. The semisimplicity input (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-9-hard-lefschetz-for-pure-lisse-sheaves"></a>

### Hard Lefschetz with coefficients in a potentially pure lisse sheaf

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n embedded by a very ample L, η = c₁(L), and ℱ a lisse ℚ̄\_ℓ-sheaf on X which is potentially punctually pure of some weight w, with a model witnessing it. Then for every r ≥ 0, η^r ∪ − : H^{n−r}(X, ℱ) → H^{n+r}(X, ℱ(r)) is an isomorphism. In particular this holds for ℱ = R^jh_\*ℚ\_ℓ of a smooth projective morphism h : Y → X.

X smooth projective; ℱ lisse and potentially punctually pure (integer weight)

For a very ample L; an ample L reduces to a power

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. K = ℱ\[0] is potentially pure of weight w as a complex: on the smooth closed fibres of a model, a lisse punctually pure sheaf is pure (EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5 (b)).
2. Support conditions with the integer n: ℋ⁰K = ℱ has support of dimension n ≤ n − 0; DK\[−2n] = ℱ^∨(n)\[0] (X smooth of pure dimension n) likewise. Apply DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13.
3. For ℱ = R^jh_\*ℚ\_ℓ, potential purity is DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11.

Acceptance checks:

- Acceptance: ℱ = ℚ\_ℓ recovers DWP.9/hard-lefschetz-4-1-1.
- Acceptance: for h : E × X → X the constant elliptic family, ℱ = R¹h_\*ℚ\_ℓ = H¹(E) ⊗ ℚ\_ℓ and the statement is hard Lefschetz for X tensored with H¹(E).
- Non-example: no claim is made for lisse sheaves that are not potentially pure, such as a nonsplit unipotent local system on an elliptic curve over ℂ (an extension of ℚ\_ℓ by ℚ\_ℓ with nonzero class in H¹(E, ℚ\_ℓ)), which, being nonsemisimple, is not potentially pure (DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12)

Direct inputs: [DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13](#dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13), `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5`, [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), `EtaleDualityAndPerverseSheaves:EDC.7/weight-potentially-property-p-3-4-10`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Introduction, p. 142. The lisse-coefficient variant as a case of 6.2.13 (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-pure-lisse-sheaves`. From the accepted part `DeligneWeightsAndPurity--DWP.7` (corrected here).

<a id="dwp-9-orthogonal-decomposition-of-a-hyperplane-section-4-3-9"></a>

### Invariant and vanishing cohomology of a hyperplane section are orthogonal complements

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n + 1, L very ample, (X_t)\_{t∈D} a Lefschetz pencil of hyperplane sections (LPV.3) with singular set S, u ∈ D − S, Y = X_u, i : Y → X, and E = Ev(Y) ⊂ H^n(Y, ℚ\_ℓ) the vanishing subspace (LPV.4). Then H^n(Y, ℚ\_ℓ) = i\*H^n(X, ℚ\_ℓ) ⊕ E, an orthogonal direct sum for the intersection form Tr_Y(x ∪ y), which is nondegenerate on each summand. Consequently E ∩ E^⊥ = 0 (the radical quotient E/(E ∩ E^⊥) of LPV.4 is E itself), and a class that is both invariant under π₁(D − S, u) and vanishing is zero ('Lefschetz's fundamental lemma' over ℚ\_ℓ).

ℚ\_ℓ coefficients: the ℤ\_ℓ statement is false (Weil II 4.3.10)

A Lefschetz pencil (which may require a Veronese re-embedding, LPV.3)

Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Invariant and vanishing cohomology**.

Proof or construction:

1. For this given Lefschetz pencil, import the direct fixed-part theorem of Weil II (4.3.2)–(4.3.8) from LPV.7:invariant-cycles: i\*H^n(X) = H^n(Y)^{π₁(D−S,u)} = E^⊥. The local Picard–Lefschetz description identifies E^⊥ with the invariants (LPV.5). This works for any Lefschetz pencil in the stated hypotheses and does not apply the sufficiently-general-line clause of DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3 to an arbitrary line.
2. By DWP.9/hard-lefschetz-4-1-1 for X and DWP.9/hyperplane-factorisation-4-1-2 (d) (with n + 1 for n), the form is nondegenerate on i\*H^n(X) = E^⊥.
3. The form on H^n(Y) is nondegenerate (Poincaré duality, EDC.2), so (E^⊥)^⊥ = E and H^n(Y) = E^⊥ ⊕ (E^⊥)^⊥ = i\*H^n(X) ⊕ E, orthogonally, with the form nondegenerate on both summands.

Acceptance checks:

- Acceptance: X = ℙ² with the pencil of conics through four points after the Veronese re-embedding: n = 1, Y a conic, H¹(Y) = 0 = E.
- Acceptance: X a smooth surface in ℙ³ of degree d, Y a plane curve of degree d and genus g = (d − 1)(d − 2)/2: H¹(X) = 0, so E = H¹(Y) of dimension 2g with nondegenerate form.
- Non-example (ℤ\_ℓ): in ℤ\_ℓ-cohomology the intersection of E and the fixed part is ker(η : H^n(X, ℤ\_ℓ) → H^{n+2}(X, ℤ\_ℓ)(1)), which can be the whole torsion subgroup after changing the projective embedding (Weil II 4.3.10, after J. Morgan).

Direct inputs: [DWP.9/hard-lefschetz-4-1-1](#dwp-9-hard-lefschetz-4-1-1), [DWP.9/hyperplane-factorisation-4-1-2](#dwp-9-hyperplane-factorisation-4-1-2), `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.2`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.3.9), p. 226. Statement (OCR cleaned). [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.3.10), p. 226. The ℚ\_ℓ form of Lefschetz's fundamental lemma and its integral failure (OCR cleaned).

Declaration id: `DeligneWeightsAndPurity:DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`. From the accepted part `DeligneWeightsAndPurity--DWP.7`.

<a id="dwp-10"></a>

## DWP.10 — Arithmetic interfaces and acceptance checks

Keeps the arithmetic exports and acceptance suite and Weil II §3.5 (proposed sublayer DWP.8:equidistribution); adds the point-count bounds moved down from WeilConjectures WC.5.

<a id="dwp-10-weight-transport-to-stable-subquotients"></a>

### Weights on stable arithmetic subquotients

Let (V,F) be a finite-dimensional invertible Frobenius module and let a commuting algebra of correspondences act on V. Every Frobenius-stable correspondence-stable subquotient of a pure weight-w module is pure of weight w; for a mixed module its actual weights are a subset of those of V. Scalar extension preserves and reflects purity, tensor products add pure weights, duals negate them and an integer Tate twist subtracts 2r. A Hecke eigenspace inherits the conclusion only when it is actually Frobenius-stable. This statement does not imply ℓ-independence of a chosen eigenspace.

Atlas landmark: **Weight transport**.

Proof or construction:

1. Use the actual invariant subspace and quotient characteristic-polynomial factorization, without diagonalizing the commuting algebra or Frobenius. Apply the common numeric predicates, which are invariant under coefficient extension.
2. For mixed modules intersect the finite filtration with the subobject and take quotient filtrations; remove zero graded pieces.
3. Apply the tensor/dual/twist spectrum identities. A Hecke eigencondition alone is not a substitute for commutation and Frobenius stability.

Acceptance checks:

- A size-two Jordan block at eigenvalue 1 and its invariant line are both pure weight 0.
- A Hecke-stable line moved by Frobenius is excluded.
- A mixed module diag(1,q) admits a weight-0 stable line and a weight-2 quotient; neither inherits the entire actual weight set.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-under-subquotients-and-extensions`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-twisting-by-rank-one-characters`, [DWP.0/weight-decomposition](#dwp-0-weight-decomposition).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §1.2 (1.2.2), (1.2.3), (1.2.6)–(1.2.8), pp. 153–155. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-10-point-count-bounds"></a>

### Point-count bounds for smooth projective varieties over 𝔽\_q, with component permutations

Let X₀ be a smooth projective variety over 𝔽\_q of pure dimension d, X = X₀ ⊗ 𝔽̄\_q, N_r = #X₀(𝔽\_{q^r}), b_i = deg Π\_i = dim H^i(X, ℚ\_ℓ) (DWP.4/integral-cohomological-factors), and let σ be the permutation of the finite set π₀(X) of geometric connected components induced by Frobenius, c_r the number of components fixed by σ^r. (i) If d ≥ 1, then for every r ≥ 1, |N_r − c_r(1 + q^{dr})| ≤ Σ\_{i=1}^{2d−1} b_i q^{ir/2}. (ii) If d = 0, X₀ is finite étale and N_r = c_r for every r ≥ 1; Z(X₀, t) = ∏\_{cycles of σ} (1 − t^{length})⁻¹. (iii) In particular, for X₀ geometrically connected of dimension d ≥ 1, |N_r − (1 + q^{dr})| ≤ Σ\_{i=1}^{2d−1} b_i q^{ir/2}, and for a smooth projective geometrically connected curve of genus g, |N_r − (q^r + 1)| ≤ 2g q^{r/2}. The bound uses all interior degrees with their Betti numbers; it is not a statement about one degree.

X₀ smooth projective of pure dimension d over 𝔽\_q; r ≥ 1.

The endpoint terms are traces on H⁰ and H^{2d}: for d = 0 only H⁰ occurs and both endpoints must not be subtracted.

Atlas landmark: **Point-count bounds from purity**.

Proof or construction:

1. Trace formula for proper X₀ (SchemeAndStackFoundations:SF.2): N_r = Σ\_i (−1)^i Tr(F^r | H^i(X, ℚ\_ℓ)), algebraic multiplicities and no diagonalisation.
2. H⁰(X, ℚ\_ℓ) is the permutation representation of Frobenius on π₀(X), so Tr(F^r | H⁰) = c_r; for d ≥ 1, Poincaré duality identifies H^{2d} with the dual of H⁰ twisted by ℚ\_ℓ(−d), so Tr(F^r | H^{2d}) = c_r q^{dr} (EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology).
3. For 0 < i < 2d, Tr(F^r | H^i) is the sum of the r-th powers of the b_i eigenvalues, each of absolute value q^{i/2} under every complex embedding (DWP.4/smooth-projective-purity); the triangle inequality (mathlib:norm_sum_le) gives |Tr(F^r | H^i)| ≤ b_i q^{ir/2}. Sum over i.
4. d = 0: X₀ is a finite disjoint union of spectra of finite fields; a closed point of degree m has m points over 𝔽\_{q^r} when m | r and none otherwise, which is c_r, and the Euler product gives the cycle formula.

Acceptance checks:

- ℙ²: N_r = 1 + q^r + q^{2r}, the error is q^r and the bound b_2 q^r = q^r is attained.
- A degree-two closed point Spec 𝔽\_{q²}: N_r = 0, 2, 0, 2, … for r = 1, 2, 3, 4, and c_r is the same sequence.
- Two projective lines exchanged by Frobenius (ℙ¹\_{𝔽\_{q²}} over 𝔽\_q): c_r = 0 for odd r and 2 for even r, N_r = c_r(1 + q^r) exactly, as the bound with b_1 = 0 requires.
- Genus-one curve E/𝔽\_7, y² = x³ + x + 1: N_1 = 5 and |5 − 8| = 3 ≤ 2·7^{1/2}.

Direct inputs: [DWP.4/integral-cohomological-factors](#dwp-4-integral-cohomological-factors), [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`, `mathlib:norm_sum_le`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (1.4)–(1.5), pp. 274–276; Théorème (8.1) and proof, pp. 301–302. (1.4)–(1.5) give the point count as the alternating sum of Frobenius traces; Theorem 8.1 proves the corresponding bound for a smooth complete intersection by combining that formula with the purity of Lemma 1.7, which is the argument stated here for all interior degrees.

Declaration id: `DeligneWeightsAndPurity:DWP.10/point-count-bounds`. New in this plan (moved down; formerly `WeilConjectures:WC.5/all-extension-point-count-bound`, `WeilConjectures:WC.5/components-and-dimension-zero`).

<a id="dwp-10-compatible-realization-export"></a>

### Compatible degree factors and point counts

For smooth projective X₀/𝔽\_q, the integral factors Π\_i of DWP.4/integral-cohomological-factors identify the Weil weight-i root multisets across every ℓ≠p, and DWP.10/point-count-bounds gives the all-extension point-count estimate. The endpoint for a pure-dimensional scheme with geometric-component permutation σ is c_n(1+q^(nd)), with c_n=#Fix(σⁿ), rather than a universal single q^(nd). To export a compatible stable arithmetic subquotient, supply a normalized rational factor Q(T), independent of ℓ, whose image is exactly its Frobenius factor in every realization. Under that additional hypothesis its roots and weights agree across realizations; purity of the ambient space alone does not construct Q.

Proof or construction:

1. Use the canonical degree-factor theorem DWP.4/integral-cohomological-factors (through DWP.0/weight-separated-factor-extraction) and the component-aware bound DWP.10/point-count-bounds. Use smooth-projective purity only as their weight input, not as a second proof of those owners’ targets.
2. For a supplied rational subquotient factor use the coefficient embeddings and the ambient purity theorem to transfer the common root multiset. Factor identification is an input; no arbitrary Hecke constituent is declared compatible.
3. Track geometric component permutation under each extension, and treat dimension zero by its exact finite-étale cycle formula.

Acceptance checks:

- A degree-two closed point has N_n=2 for even n and 0 for odd n.
- Even a rational ambient polynomial (T²−T+2) can have two different irrational linear subspace factors after splitting; choosing one does not supply a rational compatible factor.

Direct inputs: [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), [DWP.10/weight-transport-to-stable-subquotients](#dwp-10-weight-transport-to-stable-subquotients), [DWP.0/weight-separated-factor-extraction](#dwp-0-weight-separated-factor-extraction), [DWP.4/integral-cohomological-factors](#dwp-4-integral-cohomological-factors), [DWP.10/point-count-bounds](#dwp-10-point-count-bounds).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1 (1.6)–(1.8), pp. 275–277. Degree factors and the smooth-projective Weil conclusions, planned here as DWP.4/integral-cohomological-factors and DWP.10/point-count-bounds. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.3 (3.3.9), p. 207. Independence of the smooth proper degree factors; compatible subquotient factors still require their own rational factor input.

Declaration id: `DeligneWeightsAndPurity:DWP.10/compatible-realization-export`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-10-finite-residue-semistable-curve-weights"></a>

### Weights in the semistable curve filtration

For a proper semistable curve over a trait with finite residue field, import LPV.7’s Frobenius-equivariant normalization sequence and monodromy filtration of generic H¹ centered at 1. Its graded pieces H¹(Γ), ⊕H¹(Ỹ\_v), H₁(Γ)(−1) have weights respectively 0,1,2. The graph may have a Frobenius permutation, and the normalized components may need finite residue-field extension; these change no weight. This is the finite-residue-field curve consequence, not a general mixed-characteristic weight–monodromy theorem.

Proof or construction:

1. The graph groups are subquotients of finite permutation modules, hence have root-of-unity eigenvalues of weight 0. Their (−1) twist has weight 2.
2. Apply initial curve purity to the smooth projective normalization components; after splitting them over a finite extension descend through the power comparison.
3. Import LPV.7’s exact filtration and N-factorization. We supply only Frobenius weights of its graded pieces; do not reconstruct the graph or the general monodromy filtration.

Acceptance checks:

- Split multiplicative genus-one reduction gives gr_0=ℚ\_ℓ and gr_2=ℚ\_ℓ(−1), weights 0,2, with gr_1=0.
- Good reduction gives only gr_1 of weight 1.
- A nonsplit node has an unramified sign character in the graph pieces; purity is unchanged.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weights-of-the-cohomology-of-curves`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-twisting-by-rank-one-characters`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §1.8 (1.8.4), pp. 175–176; the LPV.7 semistable-curve supplier identifies the three pieces. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-10-mixed-nearby-and-newton-exports"></a>

### Mixed nearby cycles and Newton restrictions

The arithmetic consumers use the already planned DWP.8 theorem that nearby-cycle cohomology sheaves of a mixed sheaf remain mixed, and its proper direct-image purity over ℤ\[1/ℓ]. For an integral weight-w eigenvalue, DWP.7’s Newton couple (r,s) satisfies r+s=w and r,s≥0; its cohomological valuation triangles retain the separate compact-support/proper and smooth ordinary hypotheses. DWP.0 supplies the shared numeric Weil/ι-weight predicates to RD.6; RD.6 supplies its own F-isocrystal fibres and defines pointwise purity and mixedness there.

Proof or construction:

1. Import the existing companion nodes with their exact hypotheses and weight shifts. Do not infer a nearby-cycle weight upper bound from mixedness alone.
2. Apply the numeric root predicate in the p-adic coefficient field via field-homomorphism invariance; a p-adic realization does not create a second Weil-number definition.
3. For ordinary slopes 0,1 of weight-one curve H¹, compute Newton couples (0,1),(1,0). In the supersingular case compute (1/2,1/2).

Acceptance checks:

- The Tate line has weight −2 and slope −1, hence is not an integral coefficient example.
- Mixed nearby cycles need not be pure of a single weight.

Direct inputs: [DWP.8/nearby-cycles-preserve-mixedness-6-1-13](#dwp-8-nearby-cycles-preserve-mixedness-6-1-13), [DWP.8/variant-over-z-one-over-ell-6-2-7](#dwp-8-variant-over-z-one-over-ell-6-2-7), [DWP.7/newton-couples-3-3-7](#dwp-7-newton-couples-3-3-7), [DWP.7/valuation-triangles-3-3-8](#dwp-7-valuation-triangles-3-3-8), `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-weight`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §3.3 (3.3.7)–(3.3.8), pp. 206–207. The stated result and proof, with the conventions and supplier boundaries specified here. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Théorème (6.1.13), p. 246. The nearby-cycle cohomology sheaves remain mixed; this does not assert a single pure weight. [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Variante (6.2.7), p. 248. The modified duality convention and proper-direct-image purity over ℤ\[1/ℓ].

Declaration id: `DeligneWeightsAndPurity:DWP.10/mixed-nearby-and-newton-exports`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-10-frobenius-equidistribution"></a>

### Deligne’s Frobenius equidistribution theorem

In Weil II §2.2’s algebraic-by-ℤ monodromy setting, let X₀/𝔽\_q be normal and geometrically connected of dimension N≥1, with the hypotheses (a)–(c) and compact form G_R of EDC.7/weight-compact-weil-form (finite kernel is required on the geometric subgroup). Let G_R^i denote degree-i conjugacy classes with the pushforward of normalized compact Haar. For a central z of positive degree d and fixed i, translate by z^(−n) the measure q^(−(nd+i)N) Σ\_(x∈X₀(𝔽\_(q^(nd+i)))) δ\_\[ιF_x,ss]. As n→∞ it converges weakly to Haar on the degree-i conjugacy fibre. The sum is over rational points with Frobenius powers, and normalization uses the base dimension N. This is Weil II (3.5.3), not Weil I’s estimate or density of individual Weil numbers.

Atlas landmark: **Frobenius equidistribution**.

Proof or construction:

1. For every irreducible continuous unitary representation of G_R, the corresponding algebraic representation gives a coefficient sheaf ι-pure of weight zero by the compact-form equivalence. Import DWP.7’s general compact-support bounds and its real-ι variant to continue its Euler product, with no zero or pole to the right of N−1/2 except the simple trivial norm-character pole at N. Normality/geometric connectedness identify the top-degree invariant contribution. Nonunitary central weights must be normalized before this analytic boundary is used.
2. Rescale the norm character to replace the abstract convergence boundary 1 by N and apply the degree-fibre equidistribution theorem.
3. Use (3.5.2.1): a degree-e closed point contributes e rational points when e divides m, each with local Frobenius F_x^(m/e). This identifies prime-power degree measures with the rational-point measure. Retain the central translation and every residue class i modulo d.

Acceptance checks:

- The constant test function has limiting integral 1; q^(−m) is correct only when N=1.
- Dimension zero is excluded: a single constant Frobenius orbit need not become Haar-distributed.
- Only semisimple conjugacy classes enter the measured space.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form`, [DWP.5/abstract-degree-equidistribution](#dwp-5-abstract-degree-equidistribution), [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), [DWP.8/geometric-semisimplicity-theorem-3-4-1-iii](#dwp-8-geometric-semisimplicity-theorem-3-4-1-iii), `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.5 (3.5.1)–(3.5.3), pp. 210–211. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-10-finite-field-sato-tate"></a>

### Finite-field Sato–Tate for elliptic families

Let E₀→C₀ be a smooth elliptic family over a smooth geometrically connected finite-field curve, with nonconstant j-invariant. Import the full SL₂ geometric monodromy theorem of Weil II (3.5.5) from its universal elliptic-family/modular-curve supplier. Then the normalized H¹ Frobenius classes lie in SU(2). Define θ\_x∈\[0,π] by eigenvalues q^(m/2)e^(±iθ\_x) at x∈C₀(𝔽\_(q^m)); #E_x(𝔽\_(q^m))=1+q^m−2q^(m/2)cos θ\_x. The measures q^(−m) Σ\_x δ\_(θ\_x) converge to (2/π)sin²θ dθ. The printed density and point-count sign in (3.5.6)–(3.5.7) are corrected as the confirmed source issues record.

Atlas landmark: **Finite-field Sato–Tate**.

Proof or construction:

1. Import elliptic-family full geometric monodromy, including the level structure, finite-index fundamental-group image, and prime-to-p level hypothesis. The determinant q^m and compact-form comparison identify SU(2)×ℤ with action (g,m)↦q^(m/2)g.
2. Apply Frobenius equidistribution with N=1. Push Haar forward to the conjugacy angle using the compact-group Weyl integration supplier.
3. Check mass and trace moments explicitly: ∫(2/π)sin²θ=1; the normalized trace a=2cosθ has mean 0 and second moment 1. The Hasse interval is a∈\[−2,2].

Acceptance checks:

- Constant j does not meet the full-monodromy hypothesis.
- The printed (1/(2π))sin²θ has mass 1/4 and is rejected.
- The minus point-count sign agrees with the cohomological trace formula.

Direct inputs: [DWP.10/frobenius-equidistribution](#dwp-10-frobenius-equidistribution), `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form`, [DWP.1/compatibility-with-the-hasse-bound](#dwp-1-compatibility-with-the-hasse-bound), `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.5 (3.5.4)–(3.5.7), pp. 211–212. The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.10/finite-field-sato-tate`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).

<a id="dwp-10-weight-acceptance-suite"></a>

### The weight-facing acceptance suite

The common predicates and transports must reproduce: H^(2r)(ℙᴺ)=ℚ\_ℓ(−r) of weight 2r and vanishing odd cohomology; H⁰(𝔾\_m)=ℚ\_ℓ of weight 0, H¹(𝔾\_m)=ℚ\_ℓ(−1) of weight 2, H¹\_c(𝔾\_m)=ℚ\_ℓ of weight 0 and H²\_c(𝔾\_m)=ℚ\_ℓ(−1) of weight 2; H¹ of a smooth projective genus-g curve of weight 1 with reciprocal pairs α\_iα\_(i+g)=q; the finite-residue-field semistable graded weights 0,1,2; and the component-aware all-extension point count. In Yu’s unitary Rankin–Selberg use, supplied Lafforgue correspondences make ℱ₁⊗ℱ₂∨ pure of weight zero; its proper curve cohomological factors have distinct weights 0,1,2 and cannot cancel. Correspondence construction, automorphic poles and functional equations remain with their existing owners.

Proof or construction:

1. Import explicit ℙᴺ/𝔾\_m cohomology from EDC.3 rather than proving it again. Check each Tate sign against geometric Frobenius q⁻¹ on ℚ\_ℓ(1).
2. Use initial curve purity and the alternating duality pairing for Yu’s σ\_iσ\_(i+g)=q bookkeeping, including multiplicity and odd/zero genus cases.
3. For the supplied pure Rankin–Selberg coefficient, use sharp proper curve purity and numeric disjoint-weight spectra. Import its Euler determinant formula from SF.2 and its duality from EDC.2; this proves only the weight input to Yu §6.1.1.
4. Import semistable weights and the component formula of DWP.10/point-count-bounds; retain the strict difference between purity of projective cohomology and mixed compact-support cohomology.

Acceptance checks:

- For genus zero the H¹ root multiset is empty; paired-root claims are vacuous.
- The two curve roots of T²−T+2 have product 2, each weight 1, although neither is real.
- The compact-support 𝔾\_m example rules out the false assertion that every smooth curve H¹\_c is pure weight 1.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weights-of-the-cohomology-of-curves`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-sharp-curve-purity`, [DWP.10/weight-transport-to-stable-subquotients](#dwp-10-weight-transport-to-stable-subquotients), [DWP.10/finite-residue-semistable-curve-weights](#dwp-10-finite-residue-semistable-curve-weights), [DWP.10/compatible-realization-export](#dwp-10-compatible-realization-export), `EtaleDualityAndPerverseSheaves:EDC.3`, `SchemeAndStackFoundations:SF.2`, [DWP.10/point-count-bounds](#dwp-10-point-count-bounds), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves`, [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner).

Sources: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu §1 pp. 2–3, Proposition 6.1.1 pp. 42–43, §7.1 p. 64; Weil II (3.2.3). The stated result and proof, with the conventions and supplier boundaries specified here.

Declaration id: `DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite`. From the accepted part `DeligneWeightsAndPurity--DWP.0` (corrected here).



## Cross-roadmap contracts

Each entry names the supplier layer, the exact statement needed and the declarations that use it.

- `SchemeAndStackFoundations:SF.2`: The Grothendieck–Lefschetz trace formula for lisse (and constructible) ℚ\_ℓ-sheaves on a curve over 𝔽\_q in the form of Weil I (1.14.3), Z(U₀, F₀, t) = ∏\_i det(1 − F^\*t, H^i_c(U, F))^{(−1)^{i+1}}, with finiteness of H^i_c. This is the CohomologicalPointCounting trace formula (TraceFormula Layer 14) that RS-17 names as DWP.2's supplier. The fixed-point formula for a curve and its Jacobian, #Fix(α) = (Γ\_α · Δ) = 1 − Tr(α′ | T_ℓJ) + deg α (Milne, Abelian Varieties, III.11.2; RS-17 names it the curve and Jacobian trace comparison of TraceFormula Layer 8). Proper base change for the pencil f : X̃ → D (the stalk of R^i f_\*ℚ\_ℓ at a geometric point over x is H^i(X_x̄)), and the trace formula (1.5.4) for the fibres. Frobenius-equivariant finite-dimensional ℓ-adic Künneth and Leray with an actual finite filtration of the abutment; finite-extension descent of smooth embeddings, pencils and singular-value/sign data. Finite surjective curve-cover pullback and rational trace splitting for compact-support cohomology, including ramified finite covers; Leray/Künneth and finite-field descent in the surface pencil. Closed geometric stalks, pullback and finite pushforward/descent interfaces in the actual étale coefficient categories, with local conjugacy invariance and finite-model compatibility. Used by [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/compact-cohomology-of-even-tensor-powers](#dwp-2-compact-cohomology-of-even-tensor-powers), [DWP.2/coarse-bound-on-compact-cohomology](#dwp-2-coarse-bound-on-compact-cohomology), [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization), [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), [DWP.4/middle-cohomology-purity](#dwp-4-middle-cohomology-purity), [DWP.10/frobenius-equidistribution](#dwp-10-frobenius-equidistribution), [DWP.4/integral-cohomological-factors](#dwp-4-integral-cohomological-factors), [DWP.10/point-count-bounds](#dwp-10-point-count-bounds).
- `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`: The first fundamental theorem for the complex symplectic group: the Sp(V)-invariant multilinear forms on V^{2k} are spanned by the pair contractions ψ\_P (Brauer algebra), with the dimension of the invariants. Used by [DWP.2/symplectic-coinvariants-of-even-tensor-powers](#dwp-2-symplectic-coinvariants-of-even-tensor-powers).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`: Zariski closure of a subgroup of the ℚ\_ℓ-points of a linear algebraic group as an algebraic subgroup, and connectedness of Sp_{2g}. Used by [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`: The Lie algebra of an algebraic subgroup over ℚ\_ℓ, and the fact that an algebraic subgroup whose ℚ\_ℓ-points contain an ℓ-adically open subgroup of G(ℚ\_ℓ) has full dimension. Its ℓ-adic analytic open-subgroup dimension comparison is requested in ReductiveGroups, Part II, together with the actual analytic local charts; the algebraic Lie API alone is not asserted to prove it. Used by [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense).
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`: The trace of Frobenius a = q + 1 − #E(𝔽\_q) and the Hasse bound |a| ≤ 2√q, with which the abelian-variety estimate is compared (not reproved). Used by [DWP.1/compatibility-with-the-hasse-bound](#dwp-1-compatibility-with-the-hasse-bound).
- `LefschetzPencilsAndVanishingCycles:LPV.4`: The lisse sheaf R^n f_\*ℚ\_ℓ on U = D − S, the vanishing part ℰ as a π₁(U₀)-stable subsheaf defined over 𝔽\_q, the cup-product pairing into ℚ\_ℓ(−n), and geometric constancy of R^i f_\*ℚ\_ℓ (i ≠ n), R^n/ℰ and ℰ ∩ ℰ^⊥ (Weil I §5). Used by [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves).
- `EtaleDualityAndPerverseSheaves:EDC.4`: Weak Lefschetz and its Gysin transpose; blowup pullback injectivity and codimension-two blowup decomposition, all Frobenius-equivariant without hard Lefschetz. Used by [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity).
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`: Arithmetic/geometric exact sequence, geometric Frobenius degree convention, tame specialization of curve fundamental groups, and connected finite étale cover classification. For dominant morphisms of normal connected finite-type schemes, provide finite-index image of π₁ and invariance of the connected geometric monodromy group, with component and constant-field degree comparisons; used in Weil II (1.3.13)(i). Used by [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), [DWP.3/function-field-chebotarev](#dwp-3-function-field-chebotarev).
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`: Normalized Haar probability, character orthogonality and density among continuous class functions; conjugacy separation, and the SU(2) engine with chamber density (2/π)sin²θ. Haar disintegration over a compact quotient and continuity of conditional fibre mass for clopen finite-quotient sets; Dini’s theorem gives uniform decay from pointwise null fibres. Proper algebraic subsets of fixed ℓ-adic analytic symplectic cosets are null; if absent, extend CompactGroups, Part II for this analytic-measure input. Used by [DWP.5/abstract-degree-equidistribution](#dwp-5-abstract-degree-equidistribution), [DWP.10/finite-field-sato-tate](#dwp-10-finite-field-sato-tate), [DWP.3/exceptional-frobenius-set-has-density-zero](#dwp-3-exceptional-frobenius-set-has-density-zero), [DWP.3/haar-null-exceptional-eigenvalue-locus](#dwp-3-haar-null-exceptional-eigenvalue-locus).
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`: Weil II (3.5.5) full SL₂ geometric monodromy for a smooth elliptic family with nonconstant j: prime-to-p level n≥3, finite-index image into the universal level curve, and finite-index ℓ-adic SL₂ image. If the roadmap does not supply the exact universal family theorem, add ModularCurves, Part II; no new pencil open-image proof substitutes for it. Used by [DWP.10/finite-field-sato-tate](#dwp-10-finite-field-sato-tate).
- `EtaleDualityAndPerverseSheaves:EDC.3`: Frobenius-equivariant projective-space and multiplicative-group cohomology with compact support and duality, used as the weight acceptance examples (ℙᴺ, 𝔾\_m) of DWP.10. Used by [DWP.10/weight-acceptance-suite](#dwp-10-weight-acceptance-suite).
- `SchemeAndStackFoundations:SF.0`: Absolute p-Frobenius of characteristic-p schemes, its q=p^a iterate as an 𝔽\_q-morphism, base change and naturality; the DWP.1 adapter identifies its geometric-point action and induced abelian-variety endomorphism. Include compatibility with products and the finite locally free degree q^g theorem for q-Frobenius on smooth pure g-dimensional schemes over 𝔽\_q, via étale local coordinates, independent of point counts or weights. Used by [DWP.1/point-counts-of-abelian-varieties](#dwp-1-point-counts-of-abelian-varieties), [DWP.1/the-frobenius-and-points-over-extensions](#dwp-1-the-frobenius-and-points-over-extensions).
- `EtaleDualityAndPerverseSheaves:EDC.0`: The bounded derived category D^b_c(X, ℚ̄\_ℓ) of constructible ℚ̄\_ℓ-sheaves (and of ℚ̄\_ℓ-Weil sheaves over 𝔽\_q), on schemes of finite type over 𝔽\_q and over ℤ\[1/ℓ], with cohomology sheaves ℋ^i; Rf_\* and Rf_! for separated finite-type f (through a compactification), f\*, ⊗ and RHom, with their long exact sequences, the Leray spectral sequences R^pg_!R^qh_! ⇒ R^{p+q}(gh)\_! and R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K, and stalkwise Künneth with field coefficients; ordinary lisse sheaves on a normal connected scheme as continuous representations of π₁ with a stable lattice over the integers of a finite extension of ℚ\_ℓ, and lisse Weil sheaves as Weil-group representations with a stable lattice on the profinite geometric subgroup (not necessarily stable under Frobenius), local ℰxt of lisse sheaves vanishing in positive degree; generic constructibility and generic base change (SGA 4½ \[Th. finitude] 1.9, 2.16), and the commutation with base change of j_\* (and of the local monodromy filtration) for a lisse sheaf tamely ramified along a divisor finite étale over the base. For SGA 7 XXI 5.2.1–5.2.2: cohomological dimension H^i_c(X,ℱ)=0 for i>2 dim X, finite evaluation detecting H⁰, constructible coefficient descent to a finite ℓ-adic coefficient field, localisation triangles, and Frobenius-equivariant spectral sequences with finite filtrations. Used by [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi), [DWP.8/ext-one-of-lisse-sheaves-3-4-2](#dwp-8-ext-one-of-lisse-sheaves-3-4-2), [DWP.8/weight-decomposition-modulo-z-3-4-1-i](#dwp-8-weight-decomposition-modulo-z-3-4-1-i), [DWP.8/punctual-weight-filtration-3-4-1-ii](#dwp-8-punctual-weight-filtration-3-4-1-ii), [DWP.8/geometric-semisimplicity-theorem-3-4-1-iii](#dwp-8-geometric-semisimplicity-theorem-3-4-1-iii), [DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification](#dwp-8-weight-spectral-sequence-of-a-normal-crossings-compactification), [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), [DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13](#dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13).
- `EtaleDualityAndPerverseSheaves:EDC.1`: f^! right adjoint to Rf_! for separated finite-type morphisms of schemes of finite type over 𝔽\_q, over an algebraically closed field, and over the regular one-dimensional base ℤ\[1/ℓ] (SGA 4½ \[Th. finitude] 4.3 for biduality there); K_X = Ra^!ℚ̄\_ℓ and D = RHom(−, K_X) with biduality D² ≅ id on D^b_c, the exchange isomorphisms D Rf_! ≅ Rf_\* D and D f\* ≅ Rf^! D, the formula D(K ⊗ L) ≅ RHom(K, DL), and Verdier duality RΓ(X, DK) ≅ RHom(RΓ\_c(X, K), ℚ̄\_ℓ) with its perfect pairings over an algebraically closed field; and, through the identification of i_\*i^! with local cohomology, i^!ℚ\_ℓ ≅ ℚ\_ℓ(−1)\[−2] for a closed point i of Spec ℤ\[1/ℓ] (local cohomology of a henselian discrete valuation ring with ℓ invertible, by Kummer theory). Used by [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), [DWP.8/intermediate-direct-image-purity-6-2-5cd](#dwp-8-intermediate-direct-image-purity-6-2-5cd), [DWP.8/variant-over-z-one-over-ell-6-2-7](#dwp-8-variant-over-z-one-over-ell-6-2-7), [DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13](#dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13).
- `EtaleDualityAndPerverseSheaves:EDC.2`: Poincaré duality on a smooth X of pure dimension N over 𝔽\_q or over an algebraically closed field: a^!ℚ\_ℓ ≅ ℚ\_ℓ(N)\[2N] and the Frobenius-equivariant perfect pairing H^i(X, ℱ) × H^{2N−i}\_c(X, ℱ^∨(N)) → ℚ̄\_ℓ for lisse ℱ; the relative trace R^{2N}f_!ℚ\_ℓ(N) → ℚ\_ℓ for smooth f of relative dimension N, compatible with base change, giving for smooth proper f the fibrewise cup-product pairings R^jf_\*ℚ\_ℓ ⊗ R^{2N−j}f_\*ℚ\_ℓ → ℚ\_ℓ(−N) as morphisms of lisse sheaves. Smooth relative purity for any smooth morphism f of relative dimension e over the stated bases: Rf^!L ≅ f\*L(e)\[2e] for constructible complexes L, including when the target is singular. Together with directional lower bounds and twist/shift cancellation this shows smooth incidence pullback preserves purity. Used by [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), [DWP.7/valuation-triangles-3-3-8](#dwp-7-valuation-triangles-3-3-8), [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), [DWP.8/intermediate-direct-image-purity-6-2-5cd](#dwp-8-intermediate-direct-image-purity-6-2-5cd), [DWP.8/variant-over-z-one-over-ell-6-2-7](#dwp-8-variant-over-z-one-over-ell-6-2-7), [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), [DWP.9/hyperplane-factorisation-4-1-2](#dwp-9-hyperplane-factorisation-4-1-2), [DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety](#dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety), [DWP.9/hard-lefschetz-4-1-1](#dwp-9-hard-lefschetz-4-1-1), [DWP.9/primitive-decomposition-and-lefschetz-pairings](#dwp-9-primitive-decomposition-and-lefschetz-pairings), [DWP.9/odd-betti-numbers-are-even-4-1-5](#dwp-9-odd-betti-numbers-are-even-4-1-5), [DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9](#dwp-9-orthogonal-decomposition-of-a-hyperplane-section-4-3-9), [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi), [DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13](#dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13).
- `EtaleDualityAndPerverseSheaves:EDC.3`: The first Chern class c₁ : Pic(X) → H²(X, ℚ\_ℓ(1)), additive, compatible with pullback and with base change in smooth projective families; the cycle class cl(Y) = c₁(𝒪(Y)) of a smooth divisor; the Gysin map i_\* of a smooth hyperplane section i : Y → X with the projection formula i_\*(i\*x) = cl(Y) ∪ x and Tr_X(i_\*y ∪ x) = Tr_Y(y ∪ i\*x); and Tr_X(c₁(L)^n) = deg_L(X). Used by [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), [DWP.9/hyperplane-factorisation-4-1-2](#dwp-9-hyperplane-factorisation-4-1-2), [DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety](#dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety).
- `EtaleDualityAndPerverseSheaves:EDC.4`: Weak Lefschetz for a smooth hyperplane section Y of a smooth projective X of pure dimension n over an algebraically closed field with ℓ invertible: i\* : H^j(X, ℚ\_ℓ) → H^j(Y, ℚ\_ℓ) is an isomorphism for j < n − 1 and injective for j = n − 1, and the dual statement for the Gysin map. Used by [DWP.9/hyperplane-factorisation-4-1-2](#dwp-9-hyperplane-factorisation-4-1-2), [DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3](#dwp-9-global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3).
- `SchemeAndStackFoundations:SF.2`: Proper base change for Rf_!; smooth and proper base change (R^jf_\*ℚ\_ℓ lisse with formation commuting with base change, for f proper smooth); topological invariance of the étale site under universal homeomorphisms; the excision sequence 0 → j_!j\* → id → i_\*i\* → 0; the Grothendieck–Lefschetz trace formula Z(X₀, t) = ∏ det(1 − Ft, H^i_c)^{(−1)^{i+1}} with Z independent of ℓ. For the integrality proof, the Euler product and Grothendieck–Lefschetz trace formula with arbitrary constructible coefficient sheaf ℱ, not only constant coefficients, and the dense-open fibration of a positive-dimensional affine variety over a curve with fibres of dimension ≤ dim X−1. Used by [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi), [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), [DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13](#dwp-8-semisimplicity-of-proper-smooth-direct-images-3-4-13), [DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification](#dwp-8-weight-spectral-sequence-of-a-normal-crossings-compactification), [DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety](#dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety).
- `AdicCoefficientsAndComparisons:L2`: Noetherian approximation: descent of schemes of finite type, closed embeddings into ℙ^N, morphisms, smoothness, properness, flatness, pure relative dimension, normality of fibres, finite-presentation and finite-coefficient data from an algebraically closed field (or a function field) to a finitely generated ℤ\[1/ℓ]-algebra; refinement of an already supplied arithmetic ℓ-adic sheaf/complex model (no assertion that every constructible ℓ-adic sheaf has such a model), after shrinking; dense regular locus of an integral scheme of finite type over ℤ\[1/ℓ]. Used by [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), [DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12](#dwp-8-potentially-pure-lisse-sheaves-are-semisimple-3-4-12), [DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety](#dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety).
- `ArithmeticGaloisDuality:R02.2`: The continuous ℓ-adic Hochschild–Serre sequence for a closed normal subgroup with quotient ℤ̂, and its Weil-group variant with discrete quotient ℤ, for finite-dimensional continuous ℚ̄\_ℓ-representations, with H¹(ℤ, N) = N_F, H²(ℤ, N) = 0; the five-term exact sequence 0 → H¹(ℤ, M^{π₁(X)}) → H¹(W, M) → H¹(π₁(X), M)^F. Used by [DWP.8/ext-one-of-lisse-sheaves-3-4-2](#dwp-8-ext-one-of-lisse-sheaves-3-4-2).
- `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`: Weil II 6.2.8–6.2.12 over any algebraically closed field k with ℓ invertible, for potentially pure complexes with an explicit arithmetic model (DWP.8/potentially-property-p-3-4-10): the local invariant cycle theorem 6.2.9; the support-bound weak Lefschetz theorem 6.2.11 (i) for K and for DK; for a general hyperplane section Y, D(K|Y) = (DK)|Y(−1)\[−2] and K|Y satisfies the support hypothesis with n − 1; 6.2.11 (ii); and the global invariant cycle theorem 6.2.12, including its constant-coefficient case K = ℚ̄\_ℓ on a smooth projective X (Weil II 4.1.3). The direct proof of 4.1.3 in Weil II §4.3 ((4.3.2)–(4.3.8), relative cohomology and the injectivity (4.3.6)) is the argument 6.2.11 (ii) refers to and belongs with it. The direct constant-coefficient fixed-part theorem (4.3.2)–(4.3.8) is required for every Lefschetz pencil satisfying 4.3.1, not just a sufficiently general line in the dual projective space. Used by [DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3](#dwp-9-global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3), [DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13](#dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13), [DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9](#dwp-9-orthogonal-decomposition-of-a-hyperplane-section-4-3-9).
- `LefschetzPencilsAndVanishingCycles:LPV.1`: Quasi-unipotence of the inertia action on nearby cycles and on ℓ-adic sheaves over a henselian trait (SGA 7 I), the tame character, the nilpotent logarithm N and the monodromy filtration constructions of Weil II (1.6.1), (1.6.14). Also the tame/wild inertia construction for boundary henselian traits of curves over any field with ℓ invertible: wild inertia is pro-p in residue characteristic p > 0 and trivial in characteristic zero; a continuous homomorphism from a pro-p group to a pro-ℓ group is trivial for p ≠ ℓ. This geometric-trait scope is required here; the finite-residue-field scope of tauceti LocalFieldsRamification alone does not supply it. Quasi-unipotence here is in the geometric/arithmetic setting of SGA 7 and Weil II 6.1.12, at closed points of smooth curves over finite fields or spread models in 6.1.1 b); it is not an assertion for arbitrary representations of an arbitrary inertia group. Used by [DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre](#dwp-8-mixed-sheaves-with-galois-action-on-the-special-fibre), [DWP.8/nearby-cycles-preserve-mixedness-6-1-13](#dwp-8-nearby-cycles-preserve-mixedness-6-1-13).
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`: The dictionary between smooth projective geometrically connected curves over a perfect field and their function fields, with the genus, constant-field extensions (which preserve the genus) and the places of a finite separable extension; the smooth projective model of a smooth curve with its finite set of points at infinity. Used by [DWP.3/function-field-chebotarev](#dwp-3-function-field-chebotarev).
- `InverseGaloisAndArithmeticFundamentalGroups:IG.0`: For X normal connected and U ⊂ X a dense open, π₁(U, ū) → π₁(X, ū) is surjective (SGA 1 V 8.2); lisse sheaves as continuous representations of π₁. Used by [DWP.8/ext-one-of-lisse-sheaves-3-4-2](#dwp-8-ext-one-of-lisse-sheaves-3-4-2), [DWP.8/geometric-semisimplicity-theorem-3-4-1-iii](#dwp-8-geometric-semisimplicity-theorem-3-4-1-iii).
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`: The exact sequence 1 → π₁(X, x̄) → π₁(X₀, x̄) → Gal(𝔽̄\_q/𝔽\_q) → 1 for X₀ geometrically connected of finite type over 𝔽\_q, and the Weil group W(X₀, x̄) as the preimage of F^ℤ. Used by [DWP.8/ext-one-of-lisse-sheaves-3-4-2](#dwp-8-ext-one-of-lisse-sheaves-3-4-2).
- `SchemeAndStackFoundations:SF.1`: Étale cohomology of Deligne–Mumford stacks of finite type over 𝔽\_q with ℚ\_ℓ coefficients and Frobenius, the resolution of j_!ℚ\_ℓ by normalised strata of a normal crossings divisor (for the stacky weight spectral sequence), and the coarse moduli space π : 𝒳 → C of a proper Deligne–Mumford stack with Rπ\_\*ℚ\_ℓ = ℚ\_ℓ, so that H^i(C, ℚ\_ℓ) → H^i(𝒳, ℚ\_ℓ) is a Frobenius-equivariant isomorphism, C étale-locally a quotient of a smooth scheme by a finite group when 𝒳 is smooth. Used by [DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification](#dwp-8-weight-spectral-sequence-of-a-normal-crossings-compactification), [DWP.7/purity-of-smooth-proper-dm-stacks](#dwp-7-purity-of-smooth-proper-dm-stacks).
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality`: Biduality D∘D ≅ id for constructible ℚ̄\_ℓ-complexes on schemes of finite type over 𝔽\_q, with K_X = Ra^!ℚ̄\_ℓ, and its compatibility with Frobenius; used to read the purity of H^i on the coarse space of a smooth proper Deligne–Mumford stack from the dualizing complex ℚ\_ℓ(N)\[2N]. Used by [DWP.7/purity-of-smooth-proper-dm-stacks](#dwp-7-purity-of-smooth-proper-dm-stacks).

## Gaps

### Unavailable geometric and analytic interfaces in suggested signatures

The pinned libraries lack the actual constructible ℓ-adic/Weil coefficient categories, closed-stalk descent, compact-support cohomology, vanishing-cycle objects and algebraic-by-discrete Weil-monodromy realization interfaces used by the geometric and representation-Euler-family statements. Their precise theorem/API/test specifications are in the packet and synchronized reader; suggested-file entries that require these carriers are explicitly omitted with names and supplier blockers, as PROTOCOL §13 requires. They are not replaced by opaque proposition parameters or fabricated cohomology fields. The file elaborates numerical definitions and genuine subgroup, stalk-family and valuation cores; instantiation as schemes/sheaves or the compact Weil representation category is an owner-interface obligation. Standalone positivity, multiset and error-removal lemmas elaborate without those interfaces.

Needed by: [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense), [DWP.2/symplectic-coinvariants-of-even-tensor-powers](#dwp-2-symplectic-coinvariants-of-even-tensor-powers), [DWP.2/compact-cohomology-of-even-tensor-powers](#dwp-2-compact-cohomology-of-even-tensor-powers), [DWP.2/fundamental-estimate-theorem-3-2](#dwp-2-fundamental-estimate-theorem-3-2), [DWP.2/coarse-bound-on-compact-cohomology](#dwp-2-coarse-bound-on-compact-cohomology), [DWP.2/coarse-bound-on-cohomology-of-the-projective-line](#dwp-2-coarse-bound-on-cohomology-of-the-projective-line), [DWP.1/point-counts-of-abelian-varieties](#dwp-1-point-counts-of-abelian-varieties), [DWP.1/compatibility-with-the-hasse-bound](#dwp-1-compatibility-with-the-hasse-bound), [DWP.1/the-frobenius-and-points-over-extensions](#dwp-1-the-frobenius-and-points-over-extensions), [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization), [DWP.3/powers-of-a-family-determine-the-family](#dwp-3-powers-of-a-family-determine-the-family), [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group), [DWP.3/haar-null-exceptional-eigenvalue-locus](#dwp-3-haar-null-exceptional-eigenvalue-locus), [DWP.3/exceptional-frobenius-set-has-density-zero](#dwp-3-exceptional-frobenius-set-has-density-zero), [DWP.3/denominators-away-from-the-exceptional-set](#dwp-3-denominators-away-from-the-exceptional-set), [DWP.3/divisibility-criterion](#dwp-3-divisibility-criterion), [DWP.3/rationality-of-pencil-local-factors](#dwp-3-rationality-of-pencil-local-factors), [DWP.3/coarse-bound-for-the-pencil](#dwp-3-coarse-bound-for-the-pencil), [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), [DWP.4/middle-cohomology-purity](#dwp-4-middle-cohomology-purity), [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), [DWP.5/stalk-newton-polygon](#dwp-5-stalk-newton-polygon), [DWP.5/nonarchimedean-boundary-bounds](#dwp-5-nonarchimedean-boundary-bounds), [DWP.5/abstract-degree-equidistribution](#dwp-5-abstract-degree-equidistribution), [DWP.6/compact-support-curve-bound](#dwp-6-compact-support-curve-bound), [DWP.10/weight-transport-to-stable-subquotients](#dwp-10-weight-transport-to-stable-subquotients), [DWP.10/compatible-realization-export](#dwp-10-compatible-realization-export), [DWP.10/finite-residue-semistable-curve-weights](#dwp-10-finite-residue-semistable-curve-weights), [DWP.10/mixed-nearby-and-newton-exports](#dwp-10-mixed-nearby-and-newton-exports), [DWP.10/frobenius-equidistribution](#dwp-10-frobenius-equidistribution), [DWP.10/finite-field-sato-tate](#dwp-10-finite-field-sato-tate), [DWP.10/weight-acceptance-suite](#dwp-10-weight-acceptance-suite).

### Weil II (3.3.11) for proper algebraic spaces with quotient singularities

DWP.7/purity-of-smooth-proper-dm-stacks applies Weil II (3.3.11) to the coarse moduli space of a smooth proper Deligne–Mumford stack, a proper algebraic space that is étale-locally the quotient of a smooth scheme by a finite group. DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (iii) and the six operations of EtaleDualityAndPerverseSheaves are stated for schemes. No layer below this roadmap extends the weight bounds and Ra^! to algebraic spaces; the earlier owner of this step, a proposed stacks Part II of EtaleDualityAndPerverseSheaves, is outside the upstream order. For a global quotient \[Y/G] by a finite group the statement holds by taking invariants, and this is the case used for M̄\_{g,n} through a smooth projective finite cover; the general step remains open.

Needed by: [DWP.7/purity-of-smooth-proper-dm-stacks](#dwp-7-purity-of-smooth-proper-dm-stacks).

## Pinned library inputs

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each statement was read in the pinned source.

- `mathlib:minpoly.algHom_eq` (theorem, `Mathlib/FieldTheory/Minpoly/Basic.lean`): minpoly A (f x) = minpoly A x for an injective A-algebra map f: the Weil-number predicate, defined through the minimal polynomial over ℚ, is invariant under field homomorphisms.
- `mathlib:IsAlgClosed.lift` (definition, `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`): For algebraic torsion-free domain R-algebras S and an algebraically closed field M carrying a torsion-free R-algebra structure, constructs an R-algebra homomorphism S→M. It extends the chosen base algebra map, not an arbitrary embedding without first installing that algebra structure.
- `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (theorem, `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean`): Kronecker: an algebraic integer of a number field all of whose complex embeddings have norm 1 is a root of unity (integral Weil numbers of weight 0).
- `mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt` (theorem, `Mathlib/FieldTheory/IsAlgClosed/Classification.lean`): An uncountable algebraically closed field has a transcendence basis (over a countable ring) of its own cardinality: trdeg(ℂ/σ(k)) = 𝔠.
- `mathlib:Cardinal.mk_complex` (theorem, `Mathlib/Analysis/Complex/Cardinality.lean`): #ℂ = 𝔠.
- `mathlib:IsAlgClosed.equivOfTranscendenceBasis` (definition, `Mathlib/FieldTheory/IsAlgClosed/Classification.lean`): A ring equivalence between algebraically closed R-algebras from equipotent transcendence bases. The declaration returns a ring equivalence and does not state compatibility with a prescribed embedding of R; that compatibility is a separate obligation in the DWP.0 extension lemma.
- `mathlib:IsAlgClosed.ringEquiv_of_equiv_of_charZero` (theorem, `Mathlib/FieldTheory/IsAlgClosed/Classification.lean`): Two uncountable algebraically closed fields of characteristic 0 of the same cardinality are isomorphic: ℚ̄\_ℓ ≅ ℂ.
- `mathlib:Algebra.IsAlgebraic.cardinalMk_le_max` (theorem, `Mathlib/RingTheory/Algebraic/Cardinality.lean`): #L ≤ max #R ℵ₀ for L algebraic over R: #ℚ̄\_ℓ = #ℚ\_ℓ.
- `mathlib:LinearMap.charpoly_baseChange` (theorem, `Mathlib/LinearAlgebra/Charpoly/BaseChange.lean`): For a finite free module over a commutative ring R and any commutative R-algebra A, the base-changed characteristic polynomial is the coefficient image under R→A.
- `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly` (theorem, `Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean`): Over a domain, f has eigenvalue μ iff μ is a root of f.charpoly.
- `mathlib:LinearMap.finrank_maxGenEigenspace_eq` (theorem, `Mathlib/LinearAlgebra/Eigenspace/Zero.lean`): finrank (maxGenEigenspace φ μ) = rootMultiplicity μ φ.charpoly: multiplicities are dimensions of generalized eigenspaces.
- `mathlib:Module.End.iSup_maxGenEigenspace_eq_top` (theorem, `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean`): Over an algebraically closed field, the maximal generalized eigenspaces of an endomorphism of a finite-dimensional space span it.
- `mathlib:Module.End.independent_maxGenEigenspace` (theorem, `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`): The maximal generalized eigenspaces for distinct eigenvalues are independent.
- `mathlib:Matrix.charpoly_fromBlocks_zero₂₁` (theorem, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`): The characteristic polynomial of a block triangular matrix with a zero lower-left block is the product of those of the diagonal blocks.
- `mathlib:LinearMap.charpoly_prodMap` (theorem, `Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean`): (f₁.prodMap f₂).charpoly = f₁.charpoly \* f₂.charpoly.
- `mathlib:Matrix.reverse_charpoly` (theorem, `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`): M.charpoly.reverse = M.charpolyRev = det(1 − X·M): the characteristic power series det(1 − tF).
- `mathlib:Matrix.trace_eq_sum_roots_charpoly` (theorem, `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`): Over an algebraically closed field, the trace is the sum of the roots of the characteristic polynomial.
- `mathlib:Matrix.charpoly_inv` (theorem, `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`): A⁻¹.charpoly = (−1)^n · C(det A)⁻¹ · A.charpolyRev for invertible A: the characteristic polynomial of the inverse through the reversed polynomial.
- `mathlib:Matrix.det_kronecker` (theorem, `Mathlib/LinearAlgebra/Matrix/Kronecker.lean`): det (A ⊗ₖ B) = det A ^ card n \* det B ^ card m.
- `mathlib:LinearMap.trace_tensorProduct'` (theorem, `Mathlib/LinearAlgebra/Trace.lean`): For the surrounding finite-free commutative-ring module hypotheses, the trace of the tensor-product map is the product of traces; the field case suffices here.
- `mathlib:LinearMap.det_dualMap` (theorem, `Mathlib/LinearAlgebra/Determinant.lean`): For a finite free module the determinant of the ordinary transpose dual map equals the original determinant. The inverse dual needed for a Frobenius contragredient requires an inverse first.
- `mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed` (theorem, `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`): p, q ∈ k\[X] are coprime iff they have no common root in an algebraically closed extension K.
- `mathlib:LinearMap.aeval_self_charpoly` (theorem, `Mathlib/LinearAlgebra/Charpoly/Basic.lean`): Cayley–Hamilton: aeval f f.charpoly = 0.
- `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime` (theorem, `Mathlib/RingTheory/Polynomial/Basic.lean`): For coprime p, q: ker p(f) ⊔ ker q(f) = ker (pq)(f).
- `mathlib:AddValuation` (definition, `Mathlib/RingTheory/Valuation/Basic.lean`): For a ring R and a linearly ordered additive commutative monoid with top Γ, AddValuation R Γ is Valuation R with multiplicative order-dual value group; it has v(0)=∞, v(1)=0, v(xy)=v(x)+v(y) and v(x+y)≥min(v(x),v(y)). It supplies the existing valuation object, not a new Newton-polygon definition.
- `mathlib:Multiset.sort` (definition, `Mathlib/Data/Multiset/Sort.lean`): For a decidable transitive antisymmetric total relation, sort turns a multiset into its sorted list. The accompanying pairwise_sort and sort_eq statements identify its order and underlying multiset; cumulative normalized slopes use this existing operation.
- `mathlib:MonoidHom.eqLocus` (definition, `Mathlib/Algebra/Group/Subgroup/Ker.lean`): The equalizer subgroup of two monoid homomorphisms from a group to a monoid. The Weil-group pullback core is the equality locus of the two projected arithmetic-degree homomorphisms.
- `mathlib:exteriorPower.map` (definition, `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`): For a linear map f:M→ₗ\[R]N over a commutative ring, the induced map on nth exterior powers, with map_apply_ιMulti and map_comp. It supplies the construction, not its characteristic polynomial.
- `mathlib:Module.Basis.exteriorPower` (definition, `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean`): From a basis indexed by a linearly ordered type, constructs the exterior basis indexed by n-element finsets. It supplies the wedge basis for the triangular-matrix argument, not the spectral theorem.
- `mathlib:Representation` (abbrev, `Mathlib/RepresentationTheory/Basic.lean`): Representation k G V := G →\* (V →ₗ\[k] V): the carrier for the monodromy representations of π₁ and of the Weil group on stalks and on cohomology.
- `mathlib:Representation.asModule` (def, `Mathlib/RepresentationTheory/Basic.lean`): The underlying module of a representation, viewed as a MonoidAlgebra k G-module; semisimplicity of a representation is IsSemisimpleModule of this module.
- `mathlib:Representation.invariants` (def, `Mathlib/RepresentationTheory/Invariants.lean`): The submodule {v | ∀ g, ρ g v = v} of invariants: the monodromy invariants H^{n−1}(Y)^{π₁} of Weil II 4.1.3–4.1.4.
- `mathlib:IsSemisimpleModule` (class, `Mathlib/RingTheory/SimpleModule/Basic.lean`): A module is semisimple when its submodule lattice is complemented (every submodule has a complement): complete reducibility, used for geometric semisimplicity and in Lemma 4.1.4.
- `mathlib:LinearMap.BilinForm.Nondegenerate` (abbrev, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): Nondegeneracy of a bilinear form (LinearMap.Nondegenerate: separating on both sides), for Poincaré duality, Lefschetz pairings and Lemma 4.1.4.
- `mathlib:LinearMap.BilinForm.restrict` (def, `Mathlib/LinearAlgebra/BilinearForm/Basic.lean`): Restriction of a bilinear form to a submodule W (domRestrict₁₂), used for the form on the invariants and on primitive parts.
- `mathlib:LinearMap.BilinForm.IsAlt` (def, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): Alternating bilinear forms (B x x = 0), for the parity of odd Betti numbers.
- `mathlib:LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal` (theorem, `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean`): Over a field and for a finite-dimensional space and a reflexive B: (B.restrict W).Nondegenerate ↔ IsCompl W (B.orthogonal W). Alternating forms are reflexive (IsAlt.isRefl), giving V = W ⊕ W^⊥ in the finite-dimensional even-rank induction.
- `mathlib:DirectSum.IsInternal` (def, `Mathlib/Algebra/DirectSum/Basic.lean`): A family of submodules is internal when the canonical map from their direct sum is bijective: the graded pieces V^j and the primitive decomposition.
- `mathlib:LinearMap.ker` (def, `Mathlib/Algebra/Module/Submodule/Ker.lean`): Kernel of a (semi)linear map: the primitive part P^{n−r} = V^{n−r} ∩ ker λ^{r+1}.
- `mathlib:Module.finrank` (def, `Mathlib/LinearAlgebra/Dimension/Finrank.lean`): Dimension of a finite-dimensional vector space: Betti numbers and the dimension count dim P^{n−r} = b_{n−r} − b_{n−r−2}.
- `tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` (theorem, `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean`): Over a field, a finite-dimensional irreducible representation restricted to any normal subgroup is semisimple. For a finite-dimensional semisimple representation, decompose into finitely many irreducibles and apply this theorem to each. No finite-group or characteristic-zero hypothesis.
- `mathlib:PowerSeries.ext` (theorem, `Mathlib/RingTheory/PowerSeries/Basic.lean`): Two formal power series with the same coefficients are equal; the identities of DWP.0/rational-zeta-descent-and-fatou are coefficientwise.
- `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd` (theorem, `Mathlib/RingTheory/Polynomial/GaussLemma.lean`): Gauss's lemma: over an integrally closed domain R with fraction field K, a divisor in K\[X] of a monic polynomial over R is, after normalising its leading coefficient, the image of a polynomial over R.
- `mathlib:IsGalois.mem_range_algebraMap_iff_fixed` (theorem, `Mathlib/FieldTheory/Galois/Basic.lean`): For a finite Galois extension E/F, an element of E lies in F exactly when every element of Gal(E/F) fixes it.
- `mathlib:norm_sum_le` (theorem, `Mathlib/Analysis/Normed/Group/Basic.lean`): The triangle inequality for a finite sum in a seminormed additive group.

## Maintainer-added sources

Every item that the extractions of Weil I, Weil II, Bergström–Faber–Payne and Yu route to this roadmap, with where it is planned. "Proof step" means that the item is a step or hypothesis of the cited declaration, at the granularity of a target-level plan; "EDC.7" means that its owner is now EtaleDualityAndPerverseSheaves EDC.7; "not a target" items are conjectures, pointers and analogies of the source that no stage states.

| Item | Locator | Status | Planned at | Note |
| --- | --- | --- | --- | --- |
| `PAPER-DELIGNE-74/s3-3.7-open-subgroup-zariski-dense` | §3, (3.7), p. 285 | covered | `DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`, `DWP.2/symplectic-coinvariants-of-even-tensor-powers` | Zariski density of an open subgroup of Sp(V)(ℚ\_ℓ) and the resulting equality of coinvariants. |
| `PAPER-DELIGNE-74/s3-3.7-H0c-vanishing` | §3, (3.7), p. 285 | covered | `DWP.2/compact-cohomology-of-even-tensor-powers` | H⁰\_c of a lisse sheaf on the affine curve U vanishes. |
| `PAPER-DELIGNE-74/s3-3.8-closed-point-count` | §3, proof of (3.8), p. 286 | proof step | `DWP.2/coarse-bound-on-compact-cohomology` | The count #ℙ¹(𝔽\_{q^e}) = q^e + 1 bounding the degree-e closed points of U₀ ⊂ ℙ¹, with both geometric series of the corrected estimate (PAPER-DELIGNE-74/E16), is a proof step of Corollary 3.8. |
| `PAPER-DELIGNE-74/s6-6.10-homotopy-exact-sequence` | §6, (6.10)–(6.11), pp. 297–298 | proof step | `DWP.3/open-image-in-the-symplectic-similitude-group`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1` | The arithmetic–geometric exact sequence 1 → π₁(U) → π₁(U₀) → ℤ̂ → 1 for geometrically connected U₀ is imported from IG.1 in the proof of Lemma 6.11. |
| `PAPER-DELIGNE-80/s0-conjecture-iota-mixed-announcement` | Introduction, p. 142 | not a target |  | Introduction pointer to conjecture (1.2.9); see that item. |
| `PAPER-DELIGNE-80/s0-determinantal-weights-announcement` | Introduction, p. 142 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-determinantal-weights` | Introduction pointer to (1.3); the definition is EDC.7/weight-determinantal-weights. |
| `PAPER-DELIGNE-80/s0-equidistribution-3.5` | Introduction, p. 143 | covered | `DWP.10/frobenius-equidistribution`, `DWP.10/finite-field-sato-tate` | Introduction pointer to (3.5); both theorems are planned at DWP.10 (proposed sublayer DWP.8:equidistribution). |
| `PAPER-DELIGNE-80/s0-newton-hodge-1.10.7` | Introduction, p. 143 | covered | `DWP.5/nonarchimedean-boundary-bounds` | The semicontinuity (1.10.7) is planned; the Newton = Hodge application to complete intersections is proved in other work (Illusie) and is not a target here. |
| `PAPER-DELIGNE-80/s0-simplification-weil-I-3.7` | Introduction, p. 142 | not a target |  | Introduction pointer: (3.7) re-derives the applications of Weil I §8 from Théorème 1. Those applications (exponential sums) belong to FiniteFieldsAndCharacterSums FF.2, which imports DWP.7. |
| `PAPER-DELIGNE-80/s1a-1.1.10-Fq-to-Fp-invariance` | §1, (1.1.10), p. 152 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-group`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-sheaf` | A remark on the Weil group and Weil sheaves, now owned with them by EDC.7; no DWP target uses the change of base field from 𝔽\_q to 𝔽\_p. |
| `PAPER-DELIGNE-80/s1a-1.1.13-frobenius-in-weil-group` | §1, (1.1.13), p. 152 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-group` | Frobenius elements in W(X₀, x̄) and their degree; the well-definedness up to conjugacy is part of the EDC.7 construction. |
| `PAPER-DELIGNE-80/s1a-1.1.13.1-degree-map` | §1, (1.1.13), (1.1.13.1), p. 153 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-group` | The degree map and its image nℤ when X₀ is not geometrically connected are part of EDC.7/weight-weil-group. |
| `PAPER-DELIGNE-80/s1a-1.1.14-counterexample-Ql` | §1, (1.1.14), p. 153 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-sheaf` | The descent criterion for Weil sheaves with its non-unit counterexample. |
| `PAPER-DELIGNE-80/s1a-1.1.15-arithmetic-geometric-pi1-monodromy` | §1, (1.1.15), p. 153 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-semisimplicity` | Arithmetic and geometric fundamental groups and the geometric monodromy group (1.1.15). |
| `PAPER-DELIGNE-80/s1a-1.1.6-l-adic-representation` | §1, (1.1.6), p. 150 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-sheaf` | ℓ-adic representations with a finite coefficient model; the general profinite-by-discrete form is the EDC.7 Weil-sheaf interface, with ArithmeticGaloisRepresentations R01.6 for finite models. |
| `PAPER-DELIGNE-80/s1a-1.2.10-remarks-drinfeld` | §1, (1.2.10), p. 155–156 | not a target |  | Remarks on the conjecture (1.2.10) and on Drinfeld’s rank-two work; not a statement any DWP target uses. |
| `PAPER-DELIGNE-80/s1a-1.2.10i-conjecture` | §1, (1.2.10)(i), p. 155 | not a target |  | Conjecture (1.2.10)(i), recorded at its locator in sourceBoundaries of the DWP.0 part; conjectural in the source and not introduced as a theorem. Its later status is not asserted here. |
| `PAPER-DELIGNE-80/s1a-1.2.10ii-conjecture` | §1, (1.2.10)(ii), p. 155 | not a target |  | Conjecture (1.2.10)(ii); as for (i). |
| `PAPER-DELIGNE-80/s1a-1.2.10iii-conjecture` | §1, (1.2.10)(iii), p. 155 | not a target |  | Conjecture (1.2.10)(iii); as for (i). |
| `PAPER-DELIGNE-80/s1a-1.2.10iv-conjecture` | §1, (1.2.10)(iv), p. 155 | not a target |  | Conjecture (1.2.10)(iv); as for (i). |
| `PAPER-DELIGNE-80/s1a-1.2.10v-conjecture` | §1, (1.2.10)(v), p. 155 | not a target |  | Conjecture (1.2.10)(v); as for (i). |
| `PAPER-DELIGNE-80/s1a-1.2.10vi-conjecture` | §1, (1.2.10)(vi), p. 155 | not a target |  | Conjecture (1.2.10)(vi); as for (i). |
| `PAPER-DELIGNE-80/s1a-1.2.12-totally-real` | §1, (1.2.12), p. 156 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-real-sheaves` | Totally real lisse sheaves. |
| `PAPER-DELIGNE-80/s1a-1.2.14-direct-factor-totally-real` | §1, (1.2.14), p. 156 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-real-sheaves` | ℱ is a direct summand of the totally real ℱ ⊕ ℱ^∨(−n). |
| `PAPER-DELIGNE-80/s1a-1.2.9-conjecture-iota-mixed` | §1, (1.2.9), p. 155 | not a target |  | Conjecture (1.2.9); conjectural in the source. Theorem (1.5.1), the partial result towards it, is EDC.7/weight-generalized-majoration. |
| `PAPER-DELIGNE-80/s1a-1.3-setting` | §1, (1.3), p. 156 | not a target |  | Standing hypotheses of §1.3 (X₀ normal geometrically connected), carried as hypotheses by the EDC.7 §1.3 targets. |
| `PAPER-DELIGNE-80/s1a-1.3.1-abelianised-geometric-pi1` | §1, (1.3.1), p. 156 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` | Theorem (1.3.1). |
| `PAPER-DELIGNE-80/s1a-1.3.1-kernel-quotient-of-local-units` | §1, (1.3.1), proof, p. 157 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` | The idelic step of the curve proof of (1.3.1); EDC.7 narrowed the former FunctionFieldArithmetic FA.4 input to the IG.1 curve abelianised-Weil finiteness corollary. |
| `PAPER-DELIGNE-80/s1a-1.3.10-automorphisms-reductive` | §1, (1.3.10), proof, p. 160 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | A recalled structure fact (SGA 3 XXIV) inside the proof of (1.3.10); owned with that lemma. |
| `PAPER-DELIGNE-80/s1a-1.3.10-lemma-central-degree` | §1, (1.3.10), p. 160 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | Lemma (1.3.10); the receiving target states the central-degree conclusion used later, and the four equivalent conditions are its proof. |
| `PAPER-DELIGNE-80/s1a-1.3.11-deg-on-centre` | §1, (1.3.11), p. 160 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | Corollary (1.3.11). |
| `PAPER-DELIGNE-80/s1a-1.3.12-determinantal-weight-via-central-element` | §1, (1.3.12), p. 161 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-determinantal-weight-functoriality` | Corollary (1.3.12). |
| `PAPER-DELIGNE-80/s1a-1.3.15-normaliser-compact` | §1, (1.3.15), p. 161–162 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Lemma (1.3.15) supports the compact-form construction now owned by EDC.7. |
| `PAPER-DELIGNE-80/s1a-1.3.4-katz-variant` | §1, (1.3.4), Variante, p. 158 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` | Katz’s variant reaches (1.3.4) in higher dimension from the curve case; EDC.7 owns (1.3.4). |
| `PAPER-DELIGNE-80/s1a-1.3.4i-rank-one-finite-geometric-monodromy` | §1, (1.3.4)(i), p. 157–158 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` | Proposition (1.3.4)(i). |
| `PAPER-DELIGNE-80/s1a-1.3.4ii-rank-one-iota-pure` | §1, (1.3.4)(ii), p. 157–158 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` | Proposition (1.3.4)(ii), with weight the weight of c. |
| `PAPER-DELIGNE-80/s1a-1.3.5-determinantal-weights` | §1, (1.3.5), p. 158 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-determinantal-weights` | Definition (1.3.5). |
| `PAPER-DELIGNE-80/s1a-1.3.7-algebraic-monodromy-group` | §1, (1.3.7), (1.3.7.1), p. 158–159 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | The algebraic monodromy groups G⁰ ⊂ G (1.3.7). |
| `PAPER-DELIGNE-80/s1a-1.3.7-representations-of-G` | §1, (1.3.7), p. 159 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Representations of G as Weil sheaves. |
| `PAPER-DELIGNE-80/s1a-1.3.8-grothendieck-radical-unipotent` | §1, (1.3.8), p. 159 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | Grothendieck’s theorem (1.3.8). |
| `PAPER-DELIGNE-80/s1a-1.3.9-restriction-semisimple` | §1, (1.3.9), proof, p. 159 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | Clifford restriction step of (1.3.9). |
| `PAPER-DELIGNE-80/s1a-1.3.9-semisimple-monodromy` | §1, (1.3.9), p. 159 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | Corollary (1.3.9). |
| `PAPER-DELIGNE-80/s1b-1.8.10-cor-purity-extends-from-open` | §1, Corollaire (1.8.10), p. 178 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | Corollary (1.8.10). |
| `PAPER-DELIGNE-80/s1b-1.8.11-cor-lisse-mixed-successive-extension` | §1, Corollaire (1.8.11), p. 178 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | Corollary (1.8.11). |
| `PAPER-DELIGNE-80/s1b-1.8.12-cor-pure-at-one-point` | §1, Corollaire (1.8.12), p. 178 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | Corollary (1.8.12). |
| `PAPER-DELIGNE-80/s1b-1.8.14-def-variation-of-mixed-hodge-structure` | §1, (1.8.14), p. 179 | not a target |  | A Hodge-theoretic analogy in the source (recorded in the DWP.0 part sourceBoundaries); variations of mixed Hodge structure are not planned here. |
| `PAPER-DELIGNE-80/s1b-1.8.5-cor-relative-monodromy-equals-weight-filtration` | §1, Corollaire (1.8.5), p. 176 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | Corollary (1.8.5). |
| `PAPER-DELIGNE-80/s1b-1.8.6-setup-divisor` | §1, (1.8.6), p. 176 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | The set-up (1.8.6) is the hypothesis of the divisor case in the receiving target. |
| `PAPER-DELIGNE-80/s1b-1.8.7-cor-divisor-monodromy-filtration` | §1, Corollaire (1.8.7), p. 176 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | Corollary (1.8.7); the receiving target states the divisor case under the tame hypotheses of (1.8.6)–(1.8.7). |
| `PAPER-DELIGNE-80/s1b-1.8.9-cor-jstar-preserves-mixedness` | §1, Corollaire (1.8.9), p. 177 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | Corollary (1.8.9). |
| `PAPER-DELIGNE-80/s1c-1.10-setup-absolute-values` | §1, (1.10), p. 182 | proof step | `DWP.5/nonarchimedean-boundary-bounds` | The choice of an archimedean or nonarchimedean ι is the opening hypothesis of the target. |
| `PAPER-DELIGNE-80/s1c-1.10.1-boundary-bound` | §1, Lemme (1.10.1), p. 182 | proof step | `DWP.5/nonarchimedean-boundary-bounds`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-initial-curve-and-boundary-bounds` | Lemma (1.10.1) is the first proof step of the nonarchimedean target; its archimedean case is the boundary estimate of EDC.7/weight-initial-curve-and-boundary-bounds. |
| `PAPER-DELIGNE-80/s1c-1.10.2-eigenvalues-at-boundary` | §1, (1.10.2), p. 182 | proof step | `DWP.5/nonarchimedean-boundary-bounds` | The convention for the eigenvalues of F_s through a lift to the local Weil group is part of the statement ("eigenvalues of its local boundary Weil representations"). |
| `PAPER-DELIGNE-80/s1c-1.10.3-non-archimedean-bounds-at-boundary` | §1, Théorème (1.10.3), pp. 182–183 | covered | `DWP.5/nonarchimedean-boundary-bounds` | Theorem (1.10.3). |
| `PAPER-DELIGNE-80/s1c-1.10.5-units-extend` | §1, Corollaire (1.10.5) and following remark, p. 183 | covered | `DWP.5/nonarchimedean-boundary-bounds` | Corollary (1.10.5). |
| `PAPER-DELIGNE-80/s1c-1.10.6-newton-polygon` | §1, (1.10.6), p. 183 | covered | `DWP.5/stalk-newton-polygon` | Newton polygons (1.10.6). |
| `PAPER-DELIGNE-80/s1c-1.10.7-newton-polygon-specialization` | §1, Corollaire (1.10.7), p. 183 | covered | `DWP.5/nonarchimedean-boundary-bounds` | Corollary (1.10.7). |
| `PAPER-DELIGNE-80/s1c-1.10.9-nilpotence-bound` | §1, (1.10.8), Corollaire (1.10.9), p. 184 | covered | `DWP.5/nonarchimedean-boundary-bounds` | Corollary (1.10.9). |
| `PAPER-DELIGNE-80/s1c-1.11.1-specialization-of-monodromy` | §1, Proposition (1.11.1), p. 184 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-specialization-of-monodromy` | Proposition (1.11.1). |
| `PAPER-DELIGNE-80/s1c-1.11.2-local-system-criterion` | §1, Remarque (1.11.2), p. 185 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-specialization-of-monodromy` | Remark (1.11.2), used inside the receiving target. |
| `PAPER-DELIGNE-80/s1c-1.11.3-specialization-of-inertia` | §1, Remarque (1.11.3), p. 185 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-specialization-of-monodromy` | Remark (1.11.3). |
| `PAPER-DELIGNE-80/s1c-1.11.4-proof-of-1.3.1` | §1, (1.11.4), pp. 185–186 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` | The general proof of (1.3.1). |
| `PAPER-DELIGNE-80/s1c-1.11.5-general-f` | §1, Remarque (1.11.5), p. 186 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-specialization-of-monodromy` | Remark (1.11.5). |
| `PAPER-DELIGNE-80/s2-2.1.10-hypotheses-C-D` | §2, (2.1.10), p. 191 | covered | `DWP.5/abstract-degree-equidistribution` | Hypotheses (C) and (D). |
| `PAPER-DELIGNE-80/s2-2.1.10-measures` | §2, (2.1.10), p. 192 | proof step | `DWP.5/abstract-degree-equidistribution` | The conjugacy-class space and the measures μ^♮, μ₀ are the objects of the statement ("translated, normalized prime-power Dirac measures", "pushforward of normalized Haar"). |
| `PAPER-DELIGNE-80/s2-2.1.11-holomorphic-transform` | §2, Proposition (2.1.11), p. 192 | proof step | `DWP.5/abstract-degree-equidistribution` | Proposition (2.1.11) is the first proof step (the Fourier–Laplace transform extends holomorphically past the boundary). |
| `PAPER-DELIGNE-80/s2-2.1.12-equidistribution` | §2, Théorème (2.1.12), p. 192 | covered | `DWP.5/abstract-degree-equidistribution` | Theorem (2.1.12). |
| `PAPER-DELIGNE-80/s2-2.1.13-character-sums-decay` | §2, Corollaire (2.1.13), p. 192 | proof step | `DWP.5/abstract-degree-equidistribution` | Corollary (2.1.13) is the second proof step (exponential decay of the normalised character coefficients). |
| `PAPER-DELIGNE-80/s2-2.1.2-example-serre` | §2, Exemple (2.1.2), p. 188 | not a target |  | The case Γ ≅ ℝ, treated by reference to Serre; the targets use only Γ ≅ ℤ (finite fields). |
| `PAPER-DELIGNE-80/s2-2.1.3-example-weil-group-curve` | §2, Exemple (2.1.3), p. 188 | proof step | `DWP.10/frobenius-equidistribution` | The Weil group of a curve as an instance of (2.1.1) is the specialisation step of the equidistribution theorem. |
| `PAPER-DELIGNE-80/s2-2.2.1-compact-form` | §2, (2.2.1), pp. 192–193 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | The compact form G_ℝ (2.2.1). |
| `PAPER-DELIGNE-80/s2-2.2.2-conjugacy-descends` | §2, Lemme (2.2.2), p. 193 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Lemma (2.2.2), the uniqueness clause of the receiving target. |
| `PAPER-DELIGNE-80/s2-2.2.3-jordan-decomposition` | §2, (2.2.3), p. 193 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Jordan decomposition in G_ℂ, used for the semisimple part in the receiving target. |
| `PAPER-DELIGNE-80/s2-2.2.4-setup` | §2, (2.2.4), pp. 193–194 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Hypotheses (2.2.4) a)–c). |
| `PAPER-DELIGNE-80/s2-2.2.5-example-monodromy-group` | §2, Exemple (2.2.5), p. 194 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | Example (2.2.5): the monodromy group of a semisimple ι-mixed lisse sheaf satisfies (2.2.4). |
| `PAPER-DELIGNE-80/s2-2.2.6-frobenius-in-compact-form` | §2, Proposition (2.2.6), p. 194 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Proposition (2.2.6). |
| `PAPER-DELIGNE-80/s2-2.2.7-data` | §2, (2.2.7), pp. 194–195 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form`, `DWP.10/frobenius-equidistribution` | The data (2.2.7); the rescaling of ω₁ by the dimension is a proof step of DWP.10/frobenius-equidistribution. |
| `PAPER-DELIGNE-80/s2-2.2.8-i-equivalences-and-weights` | §2, Proposition (2.2.8)(i), p. 195 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Proposition (2.2.8)(i), with the sign correction (DeligneWeightsAndPurity/E8 of the DWP.0 part, PAPER-DELIGNE-80/E38). |
| `PAPER-DELIGNE-80/s3-3.1.2-epsilon-B` | §3, (3.1.2), p. 199 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-coefficient-specific-vanishing-cycles` | The orientation line ε(B) of the two branches at a node. |
| `PAPER-DELIGNE-80/s3-3.1.3.3-kummer-description` | §3, (3.1.3.3), p. 199 | not a target |  | The source says this description is not used later. |
| `PAPER-DELIGNE-80/s3-3.3.7-newton-couples` | §3, (3.3.7), p. 206 | covered | `DWP.7/newton-couples-3-3-7` | (3.3.7). |
| `PAPER-DELIGNE-80/s3-3.3.8-triangles` | §3, Corollaire (3.3.8), pp. 206–207 | covered | `DWP.7/valuation-triangles-3-3-8` | Corollary (3.3.8). |
| `PAPER-DELIGNE-80/s3-3.5.1-L-function-continuation` | §3, (3.5.1), p. 211 | proof step | `DWP.10/frobenius-equidistribution` | The analytic properties of L(τ) are the first proof step, from the compact-support bounds of DWP.7 and EDC.7. |
| `PAPER-DELIGNE-80/s3-3.5.1-monodromy-setup` | §3, (3.5.1), pp. 210–211 | covered | `DWP.10/frobenius-equidistribution` | The set-up of (3.5.1). |
| `PAPER-DELIGNE-80/s3-3.5.2-rational-points-frobenius` | §3, (3.5.2), (3.5.2.1), p. 211 | proof step | `DWP.10/frobenius-equidistribution` | The measure identity (3.5.2.1), with its printed indices corrected, is the third proof step. |
| `PAPER-DELIGNE-80/s3-3.5.3-equidistribution` | §3, Théorème (3.5.3), p. 211 | covered | `DWP.10/frobenius-equidistribution` | Theorem (3.5.3). |
| `PAPER-DELIGNE-80/s3-3.5.4-elliptic-family` | §3, Exemple (3.5.4), p. 211 | proof step | `DWP.10/finite-field-sato-tate` | Λ²V ≅ ℚ\_ℓ(−1), so degree-m elements act with determinant q^m: the first proof step. |
| `PAPER-DELIGNE-80/s3-3.5.5-monodromy-SL2` | §3, Lemme (3.5.5), pp. 211–212 | proof step | `DWP.10/finite-field-sato-tate`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing` | Lemma (3.5.5) is imported from the elliptic-family monodromy supplier, with the Part II request recorded in the requests and upstream notes. |
| `PAPER-DELIGNE-80/s3-3.5.6-frobenius-angle` | §3, (3.5.6), p. 212 | covered | `DWP.10/finite-field-sato-tate` | (3.5.6), with the corrected density and point-count sign (DeligneWeightsAndPurity/E4, E5 of the DWP.0 part). |
| `PAPER-DELIGNE-80/s3-3.5.7-sato-tate-function-field` | §3, Proposition (3.5.7), p. 212 | covered | `DWP.10/finite-field-sato-tate` | Proposition (3.5.7). |
| `PAPER-DELIGNE-80/s6-6.1.13-vanishing-cycles-mixed` | §6, Théorème (6.1.13), p. 246 | covered | `DWP.8/nearby-cycles-preserve-mixedness-6-1-13` | Theorem (6.1.13). |
| `PAPER-DELIGNE-80/s6-6.2.7-variant-over-Z-1-ell` | §6, Variante (6.2.7), p. 248 | covered | `DWP.8/variant-over-z-one-over-ell-6-2-7` | Variant (6.2.7). |
| `PAPER-BERGSTROM-FABER-PAYNE-24/weight-spectral-sequence` | arXiv:2206.07759v2, proof of Proposition 4.2, (3), p. 7; proof of Corollary 9.5, p. 23 | covered | `DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `DWP.7/purity-of-smooth-proper-dm-stacks` | The orientation-twisted E₁ term (DeligneWeightsAndPurity/E6 of the DWP.7 part, PAPER-BERGSTROM-FABER-PAYNE-24/E7); the stack purity it needs is now this roadmap’s DWP.7/purity-of-smooth-proper-dm-stacks instead of WeilConjectures WC.6. |
| `PAPER-YU-23/041` | Yu arXiv:1807.04659v5 (18 July 2022), §1 p2; §7.1 | EDC.7 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-base-extension` | Weil numbers with weight and integrality separated, and k-th powers under base extension. |
| `PAPER-YU-23/042` | Yu arXiv:1807.04659v5 (18 July 2022), Proposition6.1.1 proof; WeilII and trace/duality inputs | covered | `DWP.6/compact-support-curve-bound`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-sharp-curve-purity`, `DWP.10/weight-acceptance-suite` | Purity of curve cohomology with pure lisse coefficients; the Euler product is SchemeAndStackFoundations SF.2’s and the H⁰/H² duality is EtaleDualityAndPerverseSheaves EDC.2:pairings (corrected Hom directions, DeligneWeightsAndPurity/E6 of the DWP.0 part). |

## Confirmed red-team findings

- **RT-AREA-etale/1** (high). Weil II §3.5 is planned: DWP.10/frobenius-equidistribution (3.5.1–3.5.3) and DWP.10/finite-field-sato-tate (3.5.4–3.5.7, with the corrected density (2/π)sin²θ dθ and point-count sign, DeligneWeightsAndPurity/E4–E5 of the DWP.0 part), resting on DWP.5/abstract-degree-equidistribution (§2.1) and EDC.7/weight-compact-weil-form (§2.2), with Haar probability from Tau Ceti RepresentationTheory/CompactGroups Layer 6. The proposed sublayer DWP.8:equidistribution is kept in restructure; until it exists the two theorems stay on DWP.10. PAPER-SCHIFFMANN-16/36 is routed to this equidistribution theorem for its analytic input, with the Zariski-density theorem and the Katz–Sarnak universal-curve monodromy left to the LefschetzPencilsAndVanishingCycles Part II on universal hypersurface monodromy. Schiffmann’s \[D1] label is recorded as DeligneWeightsAndPurity/E2 of the DWP.0 part. Since 2026-10-14 the Weil-number bookkeeping that the finding left with DWP.0 belongs to EDC.7 (EDC.7/weight-weil-q-number).
- **RT-AREA-etale/9** (medium). PadicDifferentialEquationsAndRigidCohomology RD.6 should import Weil q-numbers and ι-weights rather than redefine them. Their owner is now EtaleDualityAndPerverseSheaves:EDC.7 (EDC.7/weight-weil-q-number, EDC.7/weight-iota-weight), so the edge the fix proposed, DWP.0 → RD.6, becomes EDC.7 → RD.6; RD.6 keeps only pointwise purity and mixedness of overconvergent F-isocrystals. The restructure entry records this, and the RS-17 owner record for Weil-number bookkeeping is updated to EDC.7 with DWP.0 and RD.6 among its former owners.

## What other roadmaps import from here

Requests that other plans make of these layers, with the declarations that answer them after the EDC.7 transfer.

- ArithmeticStatistics → `DWP.7`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-fundamental-direct-image-theorem-3-3-1`, [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6). Weil II Théorème 1 now has its owner in EDC.7; the cohomological bound for H^j_c stays at DWP.7.
- AutomorphicGaloisRepresentationsPartII → `DWP.7`: [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11). Proper smooth purity; the Kuga–Sato summand and its twist are the consumer’s.
- AutomorphicGaloisRepresentationsPartII → `DWP.0`: [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition). Weight separation of Frobenius modules.
- AutomorphicGaloisRepresentationsPartII → `DWP.8`: [DWP.8/punctual-weight-filtration-3-4-1-ii](#dwp-8-punctual-weight-filtration-3-4-1-ii), [DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification](#dwp-8-weight-spectral-sequence-of-a-normal-crossings-compactification). The general weight formalism; the stratum complexes of Caraiani §7 are the consumer’s.
- DeligneWeightsAndPurityPartII → `DWP.5`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-monodromy-purity`. The equal-characteristic local weight–monodromy theorem moved to EDC.7; the Part II plans its own p-adic predicate.
- EffectiveDiophantineMethods → `DWP.1`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties`, [DWP.1/point-counts-of-abelian-varieties](#dwp-1-point-counts-of-abelian-varieties). The Weil estimate for abelian varieties moved to EDC.7; point counts stay at DWP.1.
- FiniteFieldsAndCharacterSums → `DWP.5`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries`. Weil II (1.8.12) and the inertia local weight bound.
- FiniteFieldsAndCharacterSums → `DWP.7`: [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-mixed-direct-image-3-3-10`. Both the fixed-ι and the all-conjugates versions.
- FiniteFieldsAndCharacterSums → `DWP.8`: [DWP.8/geometric-semisimplicity-theorem-3-4-1-iii](#dwp-8-geometric-semisimplicity-theorem-3-4-1-iii), [DWP.8/punctual-weight-filtration-3-4-1-ii](#dwp-8-punctual-weight-filtration-3-4-1-ii), `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-semisimplicity`.
- FiniteFieldsAndCharacterSums → `DWP.1`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties`.
- FiniteFieldsAndCharacterSums → `DWP.6`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-sharp-curve-purity`. Weil II 3.2.3 moved to EDC.7.
- FiniteFieldsAndCharacterSums → `DWP.0`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic`.
- FunctionFieldArithmetic → `DWP.0`: no declaration of this roadmap. Brauer–Nesbitt for semisimple representations in characteristic 0 is representation theory, not a weight statement; no stage of this roadmap states it. The request should go to the representation-theory owner.
- GlobalShtukasAndFunctionFieldLanglands → `DWP.0`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-twisting-by-rank-one-characters`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`. Half Tate twists are rank-one Weil twists; the Satake normalisation is the consumer’s.
- GlobalShtukasAndFunctionFieldLanglands → `DWP.10`: no declaration of this roadmap. Ramanujan–Petersson for GL_r over a function field is a consequence of L. Lafforgue’s correspondence, which that roadmap plans; DWP.10 supplies only the purity of the cohomology it uses (DWP.10/weight-transport-to-stable-subquotients).
- GlobalShtukasAndFunctionFieldLanglands → `DWP.7`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-fundamental-direct-image-theorem-3-3-1`, [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6).
- HodgeStructuresPartII → `DWP.7`: [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6). The weight-one identification of Esnault–Groechenig is the consumer’s.
- LefschetzPencilsAndVanishingCycles → `DWP.5`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries`. Weil II (1.8.8); the owner is now in the same tier as LPV.
- LogarithmicPotentialTheoryAndAlgebraicIntegers → `DWP.1`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties`, [DWP.1/point-counts-of-abelian-varieties](#dwp-1-point-counts-of-abelian-varieties).
- MordellLawrenceVenkatesh → `DWP.0`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number`, `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic`.
- MordellLawrenceVenkatesh → `DWP.1`: `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties`.
- MotivesAndAlgebraicCycles → `DWP.9`: [DWP.9/hard-lefschetz-4-1-1](#dwp-9-hard-lefschetz-4-1-1).
- WeilConjectures → `DWP.4`: [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), [DWP.4/integral-cohomological-factors](#dwp-4-integral-cohomological-factors). WC.3 now imports Theorem 1.6 from DWP.4 instead of planning it.
- WeilConjectures → `DWP.10`: [DWP.10/weight-acceptance-suite](#dwp-10-weight-acceptance-suite).

## Structure and ownership proposals

### Rescope: DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves

Accepted ownership transfer (EtaleDualityAndPerverseSheaves EDC.7, revision 2, review of 2026-10-14): the weight foundations that EDC.7’s decomposition theorem needs moved down from tier 11 to tier 10. 65 part targets of this roadmap are retired: the Weil-number and Frobenius-module linear algebra of DWP.0 (16 of 18), the curve and abelian Weil estimates of DWP.1 (6 of 9), the four positive-product lemmas of DWP.2, the Weil II §1–§2 coefficient, local and analytic theory of DWP.5 (16 of 19), four of the five DWP.6 targets, the Weil II 3.3.1 proof chain of DWP.7 (8 of 15) and the mixed-complex formalism of DWP.8 (11 of 24).

Apply assembly.retiredByTransfer to the part packets, readers and suggested files at their next revision: delete the retired targets, replace every citation of a retired id by its receiving EDC.7 target (DWP.1/frobenius-endomorphism-over-a-finite-field by SchemeAndStackFoundations SF.0, as EDC.7’s handoff directs for generic uses of scheme Frobenius), and apply assembly.importedPrerequisites and assembly.importedNodeCorrections. Planet names carried by retired targets go with them to EDC.7. Stage edges: add EDC.7 → DWP.0, DWP.1, DWP.2, DWP.3, DWP.4, DWP.5, DWP.6, DWP.7, DWP.8, DWP.9, DWP.10 (each induced by node prerequisites), and drop the atlas edges DWP.7 → EDC.7, DWP.8 → EDC.7 and DWP.9 → EDC.7, which no EDC.7 prerequisite supports after its revision; with them the new edges would close cycles, without them the layer graph is acyclic (no EDC.7 node cites this roadmap). This roadmap keeps Weil I’s main theorem (DWP.2–DWP.4), the later Weil II consequences (DWP.7 integrality, cohomological bounds and proper purity; DWP.8 semisimplicity and weight filtrations; DWP.9 hard Lefschetz) and the arithmetic exports of DWP.10.

The 65 owner records are the retired targets listed under each layer above.

### Rescope: DeligneWeightsAndPurity, WeilConjectures, FunctionFieldArithmetic, PadicDifferentialEquationsAndRigidCohomology

Upstream order: this roadmap is tier 11 and cited WeilConjectures (10 citations) and FunctionFieldArithmetic (3), both outside the 94 roadmaps of the Caraiani–Newton order. The notions move down here; those roadmaps import them. Two of them are the RD.7 nodes that the PadicDifferentialEquationsAndRigidCohomology assembly (proposal for RD.7, accepted parent review) assigned to DWP.0 for exactly this move.

Owners after the move: rationality descent and Fatou’s lemma for integral zeta series → DWP.0/rational-zeta-descent-and-fatou (formerly WC.1/rationality-over-q-via-hankel-determinants, WC.1/local-fatou-normalization, RD.7/rational-zeta-descent-and-fatou); weight separation of the pure factors of a rational zeta function → DWP.0/weight-separated-factor-extraction (formerly WC.3/degreewise-pure-factor-extraction, RD.7/weight-separated-factor-extraction); Weil I Theorem 1.6, integral ℓ-independent factors of a smooth projective variety → DWP.4/integral-cohomological-factors (formerly WC.3/integral-factors-and-ell-independence-from-purity); all-extension point-count bounds with component permutations → DWP.10/point-count-bounds (formerly WC.5/all-extension-point-count-bound, WC.5/components-and-dimension-zero; this replaces the RS-17 owner record that gave them to WC.5); purity of smooth proper Deligne–Mumford stacks → DWP.7/purity-of-smooth-proper-dm-stacks (formerly WC.6/purity-for-smooth-proper-dm-stacks); finite-cover function-field Chebotarev with constant-field degrees → DWP.3/function-field-chebotarev (formerly FA.5/degree-sensitive-chebotarev; this replaces the RS-17 owner record that gave it to FA.5 and agrees with DWP.3’s stage text). WC.1, WC.3, WC.5, WC.6, FA.5 and RD.7 replace their copies by citations of these nodes; RD.7 keeps its rigid applications and its planet moves to DWP.0. The WC.1 Euler-product and trace-formula citations were already co-cited from SchemeAndStackFoundations SF.2 and now rest on SF.2 alone; the WC.7 ℙᴺ/𝔾\_m examples rest on EtaleDualityAndPerverseSheaves EDC.3.

- Rationality descent of power series and Fatou’s lemma for integral zeta series → `DeligneWeightsAndPurity:DWP.0/rational-zeta-descent-and-fatou` (formerly `WeilConjectures:WC.1`, `PadicDifferentialEquationsAndRigidCohomology:RD.7`).
- Weight separation and integrality of the pure factors of a rational zeta function → `DeligneWeightsAndPurity:DWP.0/weight-separated-factor-extraction` (formerly `WeilConjectures:WC.3`, `PadicDifferentialEquationsAndRigidCohomology:RD.7`).
- Weil I Theorem 1.6 (integral ℓ-independent factors of a smooth projective variety) → `DeligneWeightsAndPurity:DWP.4/integral-cohomological-factors` (formerly `WeilConjectures:WC.3`).
- All-extension point-count bounds for smooth projective varieties with component permutations → `DeligneWeightsAndPurity:DWP.10/point-count-bounds` (formerly `WeilConjectures:WC.5`).
- Purity of the cohomology of smooth proper Deligne–Mumford stacks over finite fields → `DeligneWeightsAndPurity:DWP.7/purity-of-smooth-proper-dm-stacks` (formerly `WeilConjectures:WC.6`).
- Chebotarev density for finite Galois covers of curves over finite fields, with constant-field degrees → `DeligneWeightsAndPurity:DWP.3/function-field-chebotarev` (formerly `FunctionFieldArithmetic:FA.5`).

### Rescope: DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves

DWP.9/lefschetz-decomposition-of-a-graded-operator restated, for vector spaces, the primitive decomposition that EDC.7/abstract-primitive-decomposition owns for graded Lefschetz objects in an abelian category with a Tate twist (BBD 5.4.10), a lower-tier and more general statement.

Keep the DWP.9 node, which DWP.9/primitive-decomposition-and-lefschetz-pairings cites, narrowed to its part (iii), the Lefschetz pairings on the primitive parts; its parts (i)–(ii) cite EDC.7/abstract-primitive-decomposition (assembly.importedNodeCorrections and importedPrerequisites).

- Primitive decomposition of a graded object satisfying hard Lefschetz → `EtaleDualityAndPerverseSheaves:EDC.7/abstract-primitive-decomposition` (formerly `DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator`).

### Split: DeligneWeightsAndPurity

RT-AREA-etale/1: Weil II §3.5 has no layer of its own; its two theorems sit at DWP.10 among the arithmetic exports.

Create the sublayer DeligneWeightsAndPurity:DWP.8:equidistribution, after DWP.5, DWP.7 and DWP.8, holding DWP.10/frobenius-equidistribution and DWP.10/finite-field-sato-tate (Weil II 3.5.1–3.5.7) with Haar probability from Tau Ceti RepresentationTheory/CompactGroups Layer 6; DWP.10 imports it. The DWP.5 sublayer split proposed by the DWP.0 part (coefficients, local, analytic) is withdrawn: after the EDC.7 transfer DWP.5 keeps three targets (stalk Newton polygons, nonarchimedean boundary bounds, abstract degree equidistribution).

### Rescope: DeligneWeightsAndPurity, PadicDifferentialEquationsAndRigidCohomology, EtaleDualityAndPerverseSheaves

RT-AREA-etale/9: RD.6 redefines Weil-number ι-weights; the fix asked for an edge DWP.0 → RD.6. The owner of Weil numbers and ι-weights is now EDC.7.

Add the edge EtaleDualityAndPerverseSheaves:EDC.7 → PadicDifferentialEquationsAndRigidCohomology:RD.6 instead of DWP.0 → RD.6; RD.6 imports EDC.7/weight-weil-q-number and EDC.7/weight-iota-weight and defines only pointwise purity and mixedness of overconvergent F-isocrystals. The RS-17 owner record for Weil-number and ι-weight bookkeeping names EDC.7, with DWP.0, R34.1, WC.2, DWP.5, R34.5 and RD.6 as former owners.

- Weil-number and ι-weight definitions and Frobenius-equivariant reciprocal-spectrum linear algebra → `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number` (formerly `DeligneWeightsAndPurity:DWP.0`, `WeightsInEtaleCohomology:R34.1`, `WeilConjectures:WC.2`, `DeligneWeightsAndPurity:DWP.5`, `WeightsInEtaleCohomology:R34.5`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`).

### Rescope: tauceti:TauCetiRoadmap/ModularCurves, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups

Kept from the DWP.0 part, restricted to what the surviving targets use: the full SL₂ monodromy of a nonisotrivial elliptic family in characteristic p (Weil II 3.5.5) and Haar disintegration over the degree quotient. The ReductiveGroups and JacobianChallenge Part II requests of that entry belong to targets now owned by EDC.7, whose packet carries them.

Request ModularCurves, Part II for universal elliptic-family SL₂ monodromy with the nonconstant-j finite-index passage, and CompactGroups, Part II for continuous conditional Haar disintegration over a compact quotient. Do not replan their existing constructions.

## Source corrections

The mistakes recorded by the two parts, which this plan inherits. Both parts number their findings from the same DeligneWeightsAndPurity/E sequence, so each is cited with its part. This pass read Weil I §§1, 6 and 8, Weil II (3.3.11), Kosters §1 and Milne LEC §27 and found no new mistake.

- **DeligneWeightsAndPurity/E1** (part DWP.0; milne-abelian-varieties, Chapter III, proof of Proposition 11.2, p. 119 (footnote 6); gap). Footnote 6 marks the displayed identity for pullback degrees as requiring repair. Correction: The pullback-degree/intersection calculation is explicitly unfinished as printed. No repaired theta-divisor calculation is certified here. The curve-bound node requests the fixed-point formula from its trace/Jacobian supplier and does not use this incomplete proof as a supplied theorem.
- **DeligneWeightsAndPurity/E2** (part DWP.0; schiffmann-higgs, arXiv:1406.3839v2, Appendix B pp. 35–36 and bibliography \[D1] p. 37; published Appendix B p. 357, \[Del74] reference; misprint). The bibliography lists \[D1] as La conjecture de Weil I., in Publ. Math., volume 52, year 1981, pages 313–428; the citation in Appendix B points to 3.5.3. Correction: The equidistribution source is Deligne, La conjecture de Weil II, Publ. Math. IHÉS 52 (1980), 137–252, §3.5.3. The published reference \[Del74] names Weil I but its §3.5.3 citation is likewise a Weil II theorem.
- **DeligneWeightsAndPurity/E3** (part DWP.0; schiffmann-higgs, arXiv:1406.3839v2, Appendix B p. 35; published Appendix B p. 357; error). The source writes H¹(−1) and gives q^(−n/2)σ\_i as the normalized eigenvalues. Correction: Choose a square root of q with positive ι-image and tensor with its inverse degree character, the chosen half-weight normalization H¹(1/2). This is a rank-one Weil scalar twist, not the integer twist (−1).
- **DeligneWeightsAndPurity/E4** (part DWP.0; deligne-weil-ii, (3.5.6)–(3.5.7), p. 212; misprint). The source gives (1/(2π))sin²θ dθ as the angle density for SU(2). Correction: Use (2/π)sin²θ dθ on \[0,π].
- **DeligneWeightsAndPurity/E5** (part DWP.0; deligne-weil-ii, (3.5.6), p. 212; misprint). The source includes +2cosθ q^(n/2) in the point count corresponding to eigenvalues q^(n/2)e^(±iθ). Correction: The count is 1+q^n−2cosθ q^(n/2).
- **DeligneWeightsAndPurity/E6** (part DWP.0; yu-local-systems, Yu arXiv v5, (6.1.1)–(6.1.2), pp. 42–43; misprint). The source asserts H⁰(ℱ₁⊗ℱ₂∨)=Hom(ℱ₁,ℱ₂) and similarly reverses the order for H². Correction: Use H⁰=Hom(ℱ₂,ℱ₁) and H²=Hom(ℱ₁,ℱ₂)∨(−1).
- **DeligneWeightsAndPurity/E7** (part DWP.0; deligne-weil-ii, §1.3, Lemme (1.3.10)(iv), p. 160; misprint). The source describes the centre’s image as a finite subgroup of Z. Correction: Replace finite subgroup by subgroup of finite index in ℤ.
- **DeligneWeightsAndPurity/E8** (part DWP.0; deligne-weil-ii, §2.2, Proposition (2.2.8)(i), p. 195; repeated in §3.5 (3.5.1), p. 211; misprint). The source assigns weight +2Re(r) to the associated irreducible sheaf. Correction: Use −2Re(r) with the source convention ω₁=q^(−deg).
- **DeligneWeightsAndPurity/E2** (part DWP.7; deligne-weil-ii, Introduction, Théorème 1 (3.3.1), p. 138, lines 1-2 of the statement (published text, Numdam scan); misprint). The source specifies X as the space on which the sheaf is defined. Correction: … un faisceau mixte de poids ≤n sur X₀.
- **DeligneWeightsAndPurity/E3** (part DWP.7; deligne-weil-ii, §3, proof of Corollaire (3.3.5), p. 206, lines 2–3 of the proof (published text, Numdam scan); misprint). H_c^{2N−i}(X, ℱ)(N) Correction: … le groupe H_c^{2N−i}(X, ℱ^∨)(N) est mixte de poids ≤ −n+(2N−i)−2N = −n−i.
- **DeligneWeightsAndPurity/E4** (part DWP.7; deligne-weil-ii, §3, Variante (3.4.9), p. 210 (published text, Numdam scan); error). The source claims geometric semisimplicity for every pure sheaf. Correction: … et que tout faisceau lisse ponctuellement pur sur X₀ normal est géométriquement semi-simple.
- **DeligneWeightsAndPurity/E5** (part DWP.7; deligne-weil-ii, §6, proof of Variante (6.2.3), p. 247 (published text, Numdam scan); misprint). E₁^{pq} = R^pf_!ℋ^qK Correction: E₂^{pq} = R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K (and 'le terme E₂^{pq}').
- **DeligneWeightsAndPurity/E6** (part DWP.7; bergstrom-faber-payne-24, arXiv:2206.07759v2 (17 Oct 2023), proof of Proposition 4.2, display (3), p. 7; error). E_1^{j,k} = ⊕\_{|E(G)|=j} H^k(M̃\_G) Correction: E_1^{j,k} = ⊕\_{|E(G)|=j} (H^k(∏\_v M̄\_{g_v,n_v}) ⊗ det E(G))^{Aut(G)} = H^k(D̃^{(j)}, ε^j), with ε^j the orientation local system of the j boundary branches; and 'M_{g,n}' in the same sentence should read 'M_{g′,n′}'.

## Sources and reading

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Pierre Deligne, Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages. Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 1): §1 (1.1)–(1.15), pp. 273–279, including the proof of (1.7) ⇒ (1.6); §2 (2.1)–(2.14), pp. 280–283; §3 (3.1)–(3.6), pp. 283–284; cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 2): §3 (3.1)–(3.9) in full, pp. 283–287, and Scholie (2.10), p. 282; cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 4): (5.12)–(5.13) and §6 (6.1)–(6.13), pp. 294–298, in full; codex-ibFXG8, 2026-10-06: checked §1–§3 conventions and §5.12–§7.3 pp. 294–300; all §6 and §7 cases read.; Codex codex-fH0uPG, independent review 2026-10-06: Cited passages in §§1–3, §§5.12–7.3, printed pp. 275–301, including all pencil rationality, half-unit induction and tensor-power cases.; Codex codex-aflhpc, revision 2026-10-08: rechecked Scholie (2.10) p. 282, (3.5)–(3.9) pp. 285–287, (5.12)–(5.13), §6 and every §7 induction/tensor-power case, pp. 295–301, against the corrected proof and supplier contracts.; Codex codex-cujRop, independent review 2026-10-08: Cited numerical, duality and fundamental-estimate passages §§1–3 pp. 275–287, and pencil rationality/induction §§5.12–7.3 pp. 294–301; all source hypotheses and three pencil cases compared independently.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Pierre Deligne, Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR (printed page = PDF page + 135); locators give printed pages. Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 1): (1.1.11)–(1.1.15), pp. 152–153; §1.2 (1.2.1)–(1.2.14), pp. 153–156; the opening of §1.3, pp. 156–157; codex-ibFXG8, 2026-10-06: §1.1–§1.11, §2.1–§2.2, §3.1–§3.5 read in full, with §1.6/§1.7 imported from LPV.1, §1.9 recorded as an unused source boundary and §3.3/§3.4 owned by the companion packet; §6.1.13/§6.2.7 are companion-node imports.; Codex codex-fH0uPG, independent review 2026-10-06: Cited passages of §§1.1–1.5, 1.7–1.8, 1.10–1.11, §§2.1–2.2, §§3.1–3.3 and 3.5, plus 6.1.13 p. 246 and 6.2.7 p. 248; erratum page images checked.; Codex codex-aflhpc, revision 2026-10-08: rechecked (1.1.6)–(1.2.9) pp. 150–155; §1.3 pp. 156–162; §1.5 pp. 164–165; §1.7–§1.8 pp. 170–179; §1.10–§1.11 pp. 182–186; §2.1–§2.2 pp. 187–196; (3.2.1)–(3.2.15) pp. 200–204; (3.3.7)–(3.3.8) pp. 206–207; §3.5 pp. 211–212; (6.1.13) p. 246 and (6.2.7) p. 248. These are checks of corrected targets and imported interfaces, not a new plan for the companion part.; Codex codex-cujRop, independent review 2026-10-08: Cited coefficient, monodromy, analytic and curve passages §§1.1–1.5 pp. 150–165, §§1.7–1.8 pp. 170–179, §§1.10–1.11 pp. 182–186, §§2.1–2.2 pp. 187–196, §§3.1–3.2 pp. 197–204, §§3.3/3.5 pp. 206–207, 210–212, plus 6.1.13 p. 246 and 6.2.7 p. 248; source-issue page images independently inspected.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), J. S. Milne, Course notes, version 2.00 (March 16, 2008); printed page = PDF page − 6. Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 3): Chapter II §1, pp. 75–78, in full; Chapter III §§9–11, pp. 113–119 (Corollary 9.6, Theorem 11.1, Proposition 11.2 with its proof, Lemma 11.3, Corollary 11.4, Remark 11.5); the author's errata page for v2.00; Codex codex-fH0uPG, independent review 2026-10-06: Chapter II §1 pp. 75–78 and Chapter III trace/Jacobian passages pp. 113–119, including the marked unfinished proof.; Codex codex-aflhpc, revision 2026-10-08: Chapter II §1 pp. 75–78 and Chapter III §11 pp. 118–119 rechecked, including the differential of 1−π, exterior products, the Hasse specialization and the unfinished proof warning.; Codex codex-cujRop, independent review 2026-10-08: II §1 pp. 75–78 and III §§9–11 pp. 113–119, including Corollary 9.6, the Frobenius degree/count signs and III.11.2 footnote 6; public errata index rechecked.
- [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Hongjie Yu, arXiv:1807.04659v5, 18 July 2022; supplied lead: Annals of Mathematics 197 (2023), no. 2; locators refer to the public author preprint. Read: §1 pp. 2–3 (Weil roots and reciprocal pairing); §2.1 (Weil/étale conventions); §6.1 Proposition 6.1.1 and proof pp. 42–43; §7.1 pp. 64–65 (the numeric inputs of routed items 041–042). Automorphic arguments and Hall-algebra targets are outside this part.; Codex codex-fH0uPG, independent review 2026-10-06: Weight-facing passages §§1–2, 6.1 pp. 42–43 and 7.1 pp. 64–65, in public arXiv v5 only.; Codex codex-aflhpc, revision 2026-10-08: public v5 Proposition 6.1.1 and (6.1.1)–(6.1.2) pp. 42–43, and §7.1 p. 64 rechecked for tensor–Hom order and reciprocal spectra; no journal-version comparison or new automorphic plan.; Codex codex-cujRop, independent review 2026-10-08: Public v5 Proposition 6.1.1 and its proof pp. 42–43, with tensor–Hom ordering and the imported purity/pole bounds compared.
- [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf), Olivier Schiffmann, Annals of Mathematics 183 (2016), 297–362; published Proposition 4.7 and Appendix B; compared arXiv:1406.3839v2 Proposition 4.8. Read: Published Proposition 4.7 p. 321, Appendix B pp. 357–358 and bibliography p. 359; preprint v2 Appendix B pp. 35–36 and bibliography \[D1]. Only routed equidistribution/density inputs are in this scope.; Codex codex-fH0uPG, independent review 2026-10-06: Published Proposition 4.7, Appendix B and bibliography compared with arXiv v2 Proposition 4.8, Appendix B and bibliography; analytic supplier, half twist and density-owner distinctions checked.; Codex codex-aflhpc, revision 2026-10-08: published Appendix B pp. 357–358 compared with arXiv v2 Appendix B pp. 35–36 and the cited bibliography entries, for the half-weight normalization and the analytic/geometric supplier boundary.; Codex codex-cujRop, independent review 2026-10-08: Published Appendix B pp. 357–358 and bibliography p. 359 compared with v2 Appendix B pp. 35–36 and bibliography p. 37 for analytic ownership, family monodromy, half twist and the Weil II citation.
- [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf), Pierre Deligne, Publ. Math. IHÉS 35 (1968), 107–126; Numdam scan with OCR; locators give printed pages. Read: claude-B5OXsE, 2026-10-06: §1, (1.1)–(1.9), pp. 107–109 (the primitive decomposition (1.5)–(1.6) for a degree-2 endomorphism with the hard Lefschetz property); Codex codex-dp1avM, independent review, 2026-10-06: §1 pp. 107–108, especially primitive decomposition (1.5)–(1.6).
- [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2), Jonas Bergström, Carel Faber, Sam Payne, arXiv:2206.07759v2 (17 October 2023); published in Annals of Mathematics 199 (2024), no. 3 (the published version was not read). Read: claude-B5OXsE, 2026-10-06: §4, Proposition 4.2 and its proof, pp. 6–7, with the recorded correction PAPER-BERGSTROM-FABER-PAYNE-24/E7 to display (3); Codex codex-dp1avM, independent review, 2026-10-06: arXiv v2 §4 Proposition 4.2, pp. 6–7; orientation correction scoped to this version.
- [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Hongjie Yu, arXiv:1807.04659v5 (18 July 2022); published in Annals of Mathematics 197 (2023), no. 2 (the published version was not read). Read: claude-B5OXsE, 2026-10-06: §6.1, Proposition 6.1.1 and its proof, pp. 42–43 (the use of Deligne's purity theorem for pure lisse coefficients on a smooth proper curve); Codex codex-dp1avM, independent review, 2026-10-06: arXiv v5 §6.1 Proposition 6.1.1, pp. 42–43.
- [SGA 7 II, Exposé XXI: Le niveau de la cohomologie des intersections complètes; §5 Appendix on integrality](https://web.math.princeton.edu/~nmk/old/niveaucoho.pdf), Nicholas M. Katz; §5 appendix by Pierre Deligne, SGA 7 II, Lecture Notes in Mathematics 340 (1973), Exposé XXI, public scan on Nicholas Katz’s Princeton page; §5 pp. 384–387. Read: Codex codex-dp1avM, independent review, 2026-10-06: §5.0–§5.2.2 and the proof of 5.2.2, pp. 384–387.
- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), J. S. Milne, Version 2.21, 22 March 2013 (PDF page = printed page). Read: §27: Lemma 27.9 (p. 156), Lemma 27.10 (p. 158), Summary 27.14 (p. 159); read 2026-10-16
- [A short proof of a Chebotarev density theorem for function fields](https://arxiv.org/pdf/1404.6345v1), Michiel Kosters, arXiv:1404.6345v1 (25 April 2014). Read: §§1.1–1.3: Theorem 1.1, Corollary 1.2, Lemmas 1.3–1.4 and their proofs, pp. 1–5; read 2026-10-16

## Suggested Lean file

`research/blueprint/suggested/DeligneWeightsAndPurity.lean` (1,978 lines) joins the files of the two accepted parts, in their current versions, and adds the targets of the whole-roadmap plan. It imports only Mathlib. The numerical definitions now owned by EtaleDualityAndPerverseSheaves EDC.7 (Weil numbers, ι-weights, eigenvalue multisets, twists, the Weil group, punctual purity, totally real predicates, geometric semisimplicity, the positivity lemmas of Weil I §3) are kept verbatim under EDC.7's names, so that the statements of this roadmap elaborate without importing another suggested file; the name ledger at the end of the file lists them. The new section states rationality of power series (`IsRationalSeries`), descent along field extensions (`isRationalSeries_of_map`), local and global Fatou (`local_fatou`, `exists_integral_presentation`), the zeta series of ℙ¹ (`zetaProjectiveLine`), weight separation of zeta factors (`weight_separated_factor_extraction`) and the numerical core of the point-count bounds (`norm_interior_trace_le`), with tests for ℙ¹, ℙ², the swapped pair of lines, the elliptic curve y² = x³ + x + 1 over 𝔽₇ and the series 1/(1 − t/2). Weil I Theorem 1.6, purity of smooth proper Deligne–Mumford stacks and the curve Chebotarev theorem need étale cohomology of varieties and stacks over finite fields and Frobenius classes of places, which are not at the pins, so they are stated in this document only. The file elaborates with `lean-check` at the pinned Mathlib: exit 0, 131 warnings for proofs left open and no other diagnostics; a `run_cmd` audit of a copy (with the examples renamed to theorems) finds no statement whose type contains a placeholder.
