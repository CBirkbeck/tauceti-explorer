# Deligne weights, purity and the Weil bounds

This roadmap builds the weight theory of Frobenius from numerical eigenvalue predicates to Deligne's general direct-image theorem, mixed complexes, geometric semisimplicity and absolute hard Lefschetz. It includes the independent Weil estimate for curves and abelian varieties, the proof of Weil I for smooth projective varieties, and the local and analytic arguments that give Weil II's sharp curve theorem. Its arithmetic interfaces transport these conclusions to specified realizations and to Frobenius equidistribution.

The purpose is a reusable library of weights. An eigenvalue is counted with its characteristic-polynomial multiplicity; a mixed sheaf carries a finite filtration by actual subsheaves; a lower complex-weight bound uses Verdier duality; a potentially pure object comes with an arithmetic model. Each definition below has an API derived from its uses and tests that reject an incorrect Frobenius, twist, shift, filtration or normalization convention. Pure arithmetic Frobenius need not be semisimple.

There are two proof chains. In Weil I, symplectic monodromy and positive even tensor powers give the fundamental estimate. Rational local factors of a pencil then give a half-unit middle-degree interval. Cartesian powers remove its error, and weak Lefschetz and duality give every smooth projective degree. For nonconstant coefficients, Weil II instead uses determinantal weights, local monodromy purity and a strict analytic bound. A pencil on a product of curves improves the remaining error by a factor of two. The resulting sharp curve theorem feeds the general direct-image dévissage. Mixed-complex operations and geometric semisimplicity follow, and invariant forms yield absolute hard Lefschetz.

## Scope and boundaries

Every piece of mathematics has one owner. The division follows [RS-17](../restructure/RS-17.result.json). DWP owns numerical Weil and ι-weights, the independent curve/abelian estimate, the Weil I and Weil II purity arguments, the general weight bounds, mixed-complex weight theory, canonical lisse weight filtrations, geometric semisimplicity and absolute hard Lefschetz. It consumes the geometric and analytic constructions that make those arguments possible.

| Supplier or consumer | Boundary |
| --- | --- |
| `SchemeAndStackFoundations`, `AdicCoefficientsAndComparisons` and `EtaleDualityAndPerverseSheaves` | Supply genuine constructible adic/rational coefficient categories, six operations, finiteness, base change, trace, cup products, duality, Gysin maps and weak Lefschetz. DWP proves their weight properties. General perverse purity, decomposition and relative hard Lefschetz remain with EDC.7 and use DWP.9. |
| `LefschetzPencilsAndVanishingCycles` | Supplies trait nearby/vanishing cycles, nilpotent monodromy filtrations, pencil geometry and Picard–Lefschetz calculations. DWP.5 proves the equal-characteristic curve monodromy-weight theorem; DWP.6 uses the coefficient-specific local calculations. LPV.7 owns invariant cycles, including the direct fixed-part proof of Weil II §4.3 and the support-bound steps of 6.2.8–6.2.12. |
| `WeilConjectures` | Owns zeta-facing rationality, integral factor separation and descent (WC.3), functional equations and component-aware higher-dimensional all-extension point-count assembly (WC.5). DWP supplies purity. The smooth proper factor conclusion of Weil II 3.3.9 uses WC.3's algebraic lemma; its DWP.7 declaration supplies that conclusion to the zeta adapter. |
| `AbelianSchemesAndArithmeticModuli`, Tau Ceti `JacobianChallenge` and `EllipticCurves` | Supply polarization, Rosati positivity, Tate realization and the curve/Jacobian comparison. DWP proves the general all-conjugates Weil estimate. The genus-one Hasse theorem is imported for compatibility. The [EllipticCurves link screen](../links/tauceti_TauCetiRoadmap_EllipticCurves.json) identifies this overlap; it does not license a second Hasse development. |
| `InverseGaloisAndArithmeticFundamentalGroups`, `FunctionFieldArithmetic` and `ArithmeticGaloisRepresentations` | Supply arithmetic/geometric fundamental groups, finite-index pullback, finite-coefficient representation models, rank-one class-field inputs and degree-qualified function-field Chebotarev. Number-field prime Chebotarev is a different theorem, as the [Chebotarev link screen](../links/tauceti_TauCetiRoadmap_Chebotarev.json) records. |
| Tau Ceti `ArithmeticDirichletSeries` | Its [link screen](../links/tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.json) distinguishes the actual Dirichlet-series abscissa theorem from DWP.2's ordinary power-series pole comparison. The finite trigonometric positivity identity is reused; the representation-Euler-product argument is specified here with its own hypotheses. |
| Tau Ceti `SchurWeyl`, `ReductiveGroups` and `CompactGroups` | Supply invariant theory, algebraic-group structure and Haar/character theory in their stated generality. Precise extensions for ℓ-adic analytic dimension, conditional Haar masses, maximal-compact comparisons and algebraic-by-discrete Weil monodromy are explicit supplier contracts. Shared vocabulary alone is insufficient to identify these extensions with an existing theorem. |
| `WeightsInEtaleCohomology`, `PadicDifferentialEquationsAndRigidCohomology` and arithmetic realization roadmaps | Import DWP's numerical and cohomological weight results. The first is DWP's arithmetic Part II; it supplies the actual projector, degree and eigenform realization. RD owns pointwise F-isocrystal predicates and rigid/crystalline comparison, using DWP.0's numerical predicates. DWP.10's subquotient transport does not by itself supply rational factors or ℓ-independence. |
| `UniversalHypersurfaceMonodromy` | Supplies full universal-family monodromy and its density applications. DWP gives the analytic Frobenius-equidistribution interface with the specified cohomological and semisimplicity inputs. |

The requested general normal-scheme curve reduction is broader than a projective incidence-complement Bertini theorem. The finite-field base-point-free Jacobian comparison is broader than a pointed Abel–Jacobi construction. Fine fixed-pairing modular-curve representability does not supply full universal elliptic-family SL₂ monodromy. The relevant Part II supplier contracts preserve these distinctions.

## Conventions

Write k₀=𝔽_q, q=pᵃ>1, ℓ≠p and X=X₀×𝔽̄_q. A subscript 0 denotes the finite-field object; dropping it denotes its geometric base change. At a closed point x, N(x)=q_x=q^{deg x}. Unless a declaration states a different base, cohomology is geometric étale cohomology with its indicated rational adic coefficients. Weil II's geometric declarations use separated noetherian schemes with ℓ invertible; the scheme specialisation is the scope used here. Finite-type bases over ℤ[1/ℓ] remain explicit in the general direct-image statements.

F denotes geometric Frobenius. It acts on ℚ_ℓ(1) by q⁻¹, so a Tate twist (r) subtracts 2r from the weight. The q-power scheme endomorphism acts as arithmetic Frobenius on geometric points and on the covariant Tate module; its pullback on cohomology agrees with the geometric Galois action after the stated contravariant comparison. DWP.1 states this comparison, rather than identifying these actions by notation alone.

The Weil group is the pullback of the arithmetic fundamental group along ℤ→Gal(𝔽̄_q/𝔽_q), with 1 sent to geometric Frobenius. Its geometric kernel is open and profinite, and its degree quotient is discrete. The degree map is surjective when X₀ is geometrically connected. A closed-point geometric Frobenius has degree +deg x; its arithmetic coordinate in Weil I §6 is −deg x. For the norm character ω₁=q^(−deg), an exponent r gives weight **−2Re(r)**. The Tate line ℚ_ℓ(1) is the sign test.

A Weil q-number of integer weight n is algebraic over ℚ and has absolute value q^{n/2} at every complex conjugate. Integrality over ℤ is a separate condition. A fixed ι is a field embedding of the coefficient algebraic closure into ℂ, without a continuity assumption; its weight is the real number 2log_q|ια| for α≠0. One fixed-ι modulus does not imply algebraicity or an all-conjugates bound. The all-embeddings comparison retains its prescribed-base extension proof obligation.

Eigenvalues form a multiset of characteristic roots over an algebraic closure. Generalized eigenspaces retain nonsplit Jordan blocks. The ordinary transpose has the original spectrum; the contragredient has inverse spectrum. Exterior eigenvalues multiply distinct positions, including repeated values at different positions. The empty wedge has weight zero; an exterior power above the rank vanishes. Pure zero objects satisfy every purity predicate and have no actual weights. Weight translation of a nonzero scalar twist is asserted on invertible Frobenius modules; a singular zero operator is the regression case.

Mixed sheaves have finite filtrations by subsheaves with pure successive quotients. Their actual weights are those of nonzero quotients. The canonical weight-class decomposition is indexed by ℝ/ℤ, while the canonical increasing lisse weight filtration is indexed by ℤ and need not split. On a normal base, geometric semisimplicity concerns the geometric fundamental group, not arithmetic Frobenius diagonalizability.

Complexes use ordinary cohomological indexing. K has upper weight bound w when ℋ^iK has upper punctual bound w+i; lower bounds are defined by Verdier duality. Thus `K[m](r)` has weight w+m−2r. For example, a weight-w lisse sheaf placed in cohomological degree −1 has complex weight w+1. The perverse indexing of the EDC consumer is a separate normalization. Potential purity requires a supplied finite-type arithmetic model and its required closed-fibre property; no universal spreading assertion is made for arbitrary constructible adic sheaves.

For an ample line bundle L on a smooth projective pure n-dimensional variety, η=c₁(L) lies in H²(X,ℚ_ℓ(1)). Hard Lefschetz is η^r:H^{n−r}(X,ℚ_ℓ)≅H^{n+r}(X,ℚ_ℓ(r)). The top-degree trace equals deg_L(X); strict positivity also requires X nonempty. Additive valuations are normalized by v(q)=1 for Newton couples and by the stated v(N(x)) denominator for stalk polygons. Raw multiplicative formulas require q≠0, and valuation transport fixes q.

## Sources and library baseline

The primary versions are fixed in the two packets' `sources` and `sourceVersions` records. Locators below use printed page numbers. Preprints and published texts are distinguished, and corrected statements are used where the recorded source issues require them.

| Source | Version and role |
| --- | --- |
| P. Deligne, [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | Publ. Math. IHÉS 43 (1974), 273–307: fundamental estimate, pencil rationality, half-unit induction and Cartesian-power purity; §§3, 6–7. |
| P. Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | Publ. Math. IHÉS 52 (1980), 137–252: coefficient and local theory §§1–2, sharp curve theorem and direct images §3, absolute hard Lefschetz §4, mixed complexes and six operations §6. |
| P. Deligne, [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf) | Publ. Math. IHÉS 35 (1968), 107–126, §1: primitive linear-algebra decomposition. |
| N. M. Katz, [SGA 7 II, Exposé XXI](https://web.math.princeton.edu/~nmk/old/niveaucoho.pdf), §5 appendix by P. Deligne | LNM 340 (1973), §5, pp. 384–387: integrality proof, including finite-point evaluation, curve Euler products and dimension induction. |
| J. S. Milne, [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf) | Course notes v2.00, 16 March 2008: Frobenius, degrees and curve/Jacobian comparison. The explicitly unfinished trace-formula step remains an owner input. |
| H. Yu, [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5) | arXiv:1807.04659v5, 18 July 2022: weight and local-system applications. Statements and source issues are scoped to this preprint, not to the unread Annals version. |
| O. Schiffmann, [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf) | Annals 183 (2016), 297–362, Proposition 4.7 and Appendix B; the first packet compares arXiv:1406.3839v2 Proposition 4.8 and its Appendix B. |
| J. Bergström, C. Faber, S. Payne, [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2) | arXiv:2206.07759v2, 17 October 2023, Proposition 4.2: normal-crossings weight spectral sequence. The boundary orientation correction concerns this preprint; the published Annals version was not read. |

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The [reviewed library coverage](../../../data/library-coverage.json) marks the geometric weight targets as unbuilt and identifies existing linear algebra and the narrower upstream examples. Existing characteristic polynomials, generalized eigenspaces, exterior powers, valuations, representations and bilinear forms are imported rather than reconstructed. Tau Ceti's finite-dimensional irreducible Clifford restriction theorem supplies the irreducible case of the geometric-semisimplicity wrapper. No node here claims implementation.

## Layer overview and proof order

| Layer | Purpose | Central output |
| --- | --- | --- |
| DWP.0 | Numerical weights and spectra | Weil numbers, ι-weights, tensor/dual/exterior spectra, reciprocal pairings and weight decomposition |
| DWP.1 | Independent initial estimate | Frobenius on abelian varieties and pure H¹ of curves |
| DWP.2 | Symplectic tensor powers | Fundamental estimate and coarse curve-cohomology bounds |
| DWP.3 | Arithmetic pencil factors | Rational local factors of the radical quotient |
| DWP.4 | Induction and Cartesian powers | Smooth projective purity in every degree |
| DWP.5 | Weil coefficients, local and analytic preparation | Determinantal weights, local monodromy purity, compact Weil form and strict H¹ bound |
| DWP.6 | Square improvement | Sharp parabolic curve purity and compact-support upper bounds |
| DWP.7 | General direct images and integrality | R^if_! weights, smooth proper purity and valuation triangles |
| DWP.8 | Mixed complexes and pure lisse sheaves | Six-operation estimates, weight filtration and geometric semisimplicity |
| DWP.9 | Absolute hard Lefschetz | Lefschetz isomorphisms, primitive decomposition and pairings |
| DWP.10 | Arithmetic interfaces | Stable-subquotient transport, nearby/Newton exports and equidistribution |

The declaration graph determines development order. DWP.5's coefficient-definition prefix precedes its use in DWP.2; its local and analytic suffix uses the earlier estimates. This creates no whole-layer DWP.5↔DWP.2 proof cycle. DWP.6 proves the curve input without DWP.7. The DWP.7 dévissage then feeds DWP.8, and LPV's late invariant-cycle branch supplies DWP.9. DWP.10's individual exports attach when their own prerequisites are available: its equidistribution theorem uses DWP.7 cohomological bounds and DWP.8 geometric semisimplicity, while its basic weight transport uses the earlier numerical theory.

The specifications below preserve the two parts' order: DWP.0–DWP.6 and its DWP.10 exports, followed by DWP.7–DWP.9. Links between them name supplying declarations. Each section gives the statement, hypotheses, API and unit tests where applicable, proof route, direct inputs and acceptance cases. These are mathematical targets; the suggested file contains only the forms supported by genuine existing carriers and a named ledger for the others.

## DWP.0 — Eigenvalue weights and functorial linear algebra

Integer Weil purity requires algebraicity and all conjugates; fixed-ι weights are real numbers at one embedding. Characteristic-root multisets and generalized eigenspaces retain multiplicity and Jordan blocks. Tensor, dual and exterior spectra supply every later weight calculation.

<a id="dwp-0-weil-q-number"></a>

### Weil q-numbers of integer weight

Fix a real number q > 1 and n ∈ ℤ. An element α of a field K of characteristic 0 is a Weil q-number of weight n (Deligne: pure of weight n relative to q) if α is algebraic over ℚ and every complex root of its minimal polynomial over ℚ has absolute value q^{n/2}. The predicate depends only on the minimal polynomial of α. So it is preserved and reflected by every field homomorphism K → K′, and it does not depend on the ambient field or on a chosen splitting field. Equivalently, |σ(α)| = q^{n/2} for every field homomorphism σ : ℚ(α) → ℂ. When K is algebraic over ℚ, it is equivalent to |φ(α)| = q^{n/2} for every field homomorphism φ : K → ℂ. A Weil q-number is nonzero, and its weight is unique. Integrality over ℤ is a separate predicate.

Hypotheses and scope:

- Algebraicity is a clause of the definition. In Mathlib's convention the minimal polynomial of a transcendental element is 0 and has no roots, so the conjugate clause alone would hold vacuously.
- q > 1 is what makes the weight unique; for q = 1 a root of unity would have every weight. In the finite-field applications q = #k₀ = p^a, and at a closed point x the base is q_x = q^{deg x}.
- The comparison with all homomorphisms φ : K → ℂ needs K algebraic over ℚ (ℚ̄ or a number field). A field of characteristic 0 of cardinality greater than 𝔠 has no homomorphism to ℂ, and the condition would be vacuous. For K = ℚ̄_ℓ the comparison with isomorphisms ι : ℚ̄_ℓ ≅ ℂ is the theorem weil-number-iff-iota-pure-for-every-iota.
- Weights are integers, as in Weil II (1.2.1). Real weights are the ι-weights of the node iota-weight.

Atlas landmark: **Weil q-number**.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.0/endomorphism-weights: Weil purity of an endomorphism is this predicate on each eigenvalue
- DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic: products, inverses and conjugates
- FiniteFieldsAndCharacterSums:FF.2/additive-l-function-purity: the reciprocal roots of the L-polynomial are Weil q-numbers of weight 1 (IsWeilNumber.of_aeval_eq_zero)
- MordellLawrenceVenkatesh:LV.1/faltings-finiteness: Frobenius eigenvalues as Weil q-numbers, stable under products and inverses
- PadicDifferentialEquationsAndRigidCohomology:RD.7/weil-factors-rational-and-integral: Weil q-numbers of integral weight as roots of the rigid Weil factors
- DeligneWeightsAndPurity:DWP.1: the all-conjugates bound √q for curves and abelian varieties

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.IsWeilNumber` | data | Algebraicity over ℚ and modulus q^(n/2) at every complex root of the minimal polynomial. |
| `TauCeti.Weights.IsWeilNumber.isAlgebraic` | projection | A Weil q-number is algebraic over ℚ. |
| `TauCeti.Weights.IsWeilNumber.norm_eq` | characterisation | Every field embedding into ℂ sends the Weil number to a number of modulus q^(n/2). |
| `TauCeti.Weights.isWeilNumber_iff_forall_embedding` | characterisation | If the ambient field is algebraic over ℚ, purity is equivalent to the common modulus at every complex embedding. |
| `TauCeti.Weights.isWeilNumber_map_iff` | functoriality | Field homomorphisms preserve and reflect the minimal-polynomial purity predicate. |
| `TauCeti.Weights.IsWeilNumber.of_aeval_eq_zero` | characterisation | If P ∈ ℚ[T] is nonzero, P(α) = 0 and every complex root of P has absolute value q^{n/2}, then α is a Weil q-number of weight n. |
| `TauCeti.Weights.IsWeilNumber.ne_zero` | characterisation | A Weil q-number is nonzero. |
| `TauCeti.Weights.IsWeilNumber.weight_unique` | characterisation | For q>1 a nonzero Weil number has a unique integer weight. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isWeilNumber_roots_T2_sub_T_add_two` | value | The roots of T² − T + 2 are Weil 2-numbers of weight 1: the discriminant is −7, so the roots (1 ± i√7)/2 are complex conjugate with product 2. |
| `TauCeti.Weights.not_isWeilNumber_one_add_sqrt_two` | non-example | 1 + √2 is a Weil q-number for no q > 1 and no n. Its conjugates 1 ± √2 have absolute values with product 1, forcing n = 0, while \|1 + √2\| ≠ 1. It has absolute value q^{1/2} at one real embedding for q = (1 + √2)², so one embedding does not suffice. |
| `TauCeti.Weights.isWeilNumber_inv_not_isIntegral` | non-example | For an integer q ≥ 2, q⁻¹ ∈ ℚ is a Weil q-number of weight −2 and is not integral over ℤ: purity and integrality are separate predicates. |
| `TauCeti.Weights.isWeilNumber_rootOfUnity` | degenerate | A root of unity is a Weil q-number of weight 0 for every q > 1; 0 is a Weil q-number of no weight. |

Proof or construction:

1. Conjugates: the field homomorphisms ℚ(α) → ℂ correspond to the complex roots of the minimal polynomial of α, through the adjoin-root presentation of ℚ(α).
2. Invariance: an injective ℚ-algebra map f satisfies minpoly ℚ (f α) = minpoly ℚ α (mathlib:minpoly.algHom_eq), and a ring homomorphism between fields of characteristic 0 is a ℚ-algebra map.
3. All embeddings of K: when K is algebraic over ℚ, each σ : ℚ(α) → ℂ extends to K → ℂ by mathlib:IsAlgClosed.lift applied to K over ℚ(α).
4. Roots of a rational polynomial P with P(α) = 0: the minimal polynomial divides P, so its complex roots are roots of P.
5. Nonvanishing and uniqueness: q^{n/2} > 0, so α ≠ 0. The minimal polynomial has a complex root, and q^{n/2} = q^{m/2} with q > 1 forces n = m.

Acceptance checks:

- i√q is a Weil q-number of weight 1 for every integer q ≥ 2 (its conjugates are ±i√q).
- For q ∈ ℚ with q > 1 and k ∈ ℤ, q^k is a Weil q-number of weight 2k.
- (3 + 4i)/5 is a Weil q-number of weight 0 for every q > 1, but it is neither an algebraic integer nor a root of unity.

Direct inputs: `mathlib:minpoly.algHom_eq`, `mathlib:IsAlgClosed.lift`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Définition (1.2.1), p. 153; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, Lemme (1.7), p. 276; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §1 pp. 2–3; §7.1 p. 64.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

<a id="dwp-0-weil-number-arithmetic"></a>

### Products, inverses, conjugation and integrality of Weil q-numbers

Let q > 1, and let α, β ∈ K be Weil q-numbers of weights n and m. (i) αβ is a Weil q-number of weight n + m, α⁻¹ one of weight −n, and α^k one of weight kn for k ∈ ℤ. (ii) If q is rational, q^k is a Weil q-number of weight 2k for k ∈ ℤ. (iii) If q is rational, then for every field homomorphism σ : K → ℂ the complex conjugate of σ(α) is q^n/σ(α). In particular α + q^n α⁻¹ is a totally real algebraic number. (iv) If α is integral over ℤ, then n ≥ 0, and if moreover n = 0 then α is a root of unity. A sum of Weil q-numbers is not a Weil q-number in general.

Hypotheses and scope:

- Products need a common field: the conjugates of αβ are the σ(α)σ(β) for σ : ℚ(α, β) → ℂ, and each such σ restricts to embeddings of ℚ(α) and of ℚ(β).
- Integrality is needed in (iv): (3 + 4i)/5 has weight 0 and is not a root of unity, and q⁻¹ has weight −2.
- (iii) uses q ∈ ℚ so that q^n α⁻¹ lies in K.

Proof or construction:

1. Common field: every embedding of ℚ(αβ) into ℂ extends to ℚ(α, β) (mathlib:IsAlgClosed.lift), so the conjugates of αβ are products σ(α)σ(β) of conjugates taken with the same σ.
2. Inverses and powers: |σ(α)⁻¹| = q^{−n/2} and |σ(α)^k| = q^{kn/2}.
3. q^k is rational, it is its own only conjugate, and |q^k| = q^{2k/2}.
4. Complex conjugation: σ(α)·conj(σ(α)) = |σ(α)|² = q^n.
5. Integrality: the norm of α from ℚ(α) to ℚ is a nonzero integer of absolute value q^{nd/2}, where d = [ℚ(α) : ℚ]. So q^{nd/2} ≥ 1 and n ≥ 0. For n = 0 every conjugate has absolute value 1, and mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one applied to the number field ℚ(α) makes α a root of unity.

Acceptance checks:

- 1 + i is a Weil 2-number of weight 1, and (1 + i)² = 2i one of weight 2. The sum (1 + i) + 1 = 2 + i has absolute value √5 and is not a Weil 2-number.
- For α = (1 + i√7)/2 and q = 2: α + 2/α = α + ᾱ = 1, totally real as (iii) predicts.
- ζ₅ has weight 0, is integral and is a root of unity; (3 + 4i)/5 has weight 0 and is neither.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), `mathlib:IsAlgClosed.lift`, `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Définition (1.2.12), p. 156; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.14), p. 156.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`.

<a id="dwp-0-weil-number-base-extension"></a>

### Weil numbers under powers: change of q to q^r

Let q > 1, n ∈ ℤ and r ≥ 1. An element α of K is a Weil q-number of weight n if and only if α^r is a Weil q^r-number of weight n.

Hypotheses and scope:

- r ≥ 1. The backward implication needs algebraicity of α, which follows from that of α^r, since α is a root of T^r − α^r.
- In the finite-field applications, a finite extension of k₀ of degree r replaces the geometric Frobenius F by F^r and q by q^r. At a closed point x of degree d, F_x = F^d and q_x = q^d.

Proof or construction:

1. Every embedding τ : ℚ(α^r) → ℂ extends to σ : ℚ(α) → ℂ (mathlib:IsAlgClosed.lift), and then τ(α^r) = σ(α)^r. Conversely, σ(α)^r is a conjugate of α^r.
2. |σ(α)|^r = (q^r)^{n/2} if and only if |σ(α)| = q^{n/2}, since x ↦ x^r is injective on [0, ∞).
3. α is algebraic over ℚ if and only if α^r is.

Acceptance checks:

- α = 1 + i (q = 2, weight 1): α² = 2i is a Weil 4-number of weight 1, since |2i| = 2 = 4^{1/2}.
- 1 and ζ₃ have the same cube and both have weight 0: the power forgets the difference between α and ζα, but not the weight.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), `mathlib:IsAlgClosed.lift`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.1), p. 275; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1, (1.1.13), p. 152.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`.

<a id="dwp-0-iota-weight"></a>

### ι-weights of nonzero elements of a coefficient field

Let E be a field, ι : E → ℂ a field homomorphism (not assumed continuous; Deligne takes an isomorphism ι : ℚ̄_ℓ ≅ ℂ), and q > 1 real. For α ∈ E^×, the ι-weight of α relative to q is w_{ι,q}(α) = 2 log_q |ι(α)| ∈ ℝ, so that |ι(α)| = q^{w/2}. α is ι-pure of weight β ∈ ℝ if w_{ι,q}(α) = β. The ι-weight is a group homomorphism E^× → ℝ: w(αβ) = w(α) + w(β) and w(α⁻¹) = −w(α). Moreover w_{ι,q}(q) = 2 when q ∈ ℚ, w_{ι,q^r}(α^r) = w_{ι,q}(α) for r ≥ 1, and w_{ι∘τ,q}(α) = w_{ι,q}(τ(α)) for a field homomorphism τ. A Weil q-number of weight n is ι-pure of weight n for every ι. An element of integer ι-weight need not be algebraic or a Weil q-number.

Hypotheses and scope:

- ι need not be continuous and is not canonical; ι-weights depend on ι. Purity for every ι is the theorem weil-number-iff-iota-pure-for-every-iota.
- Weights are real numbers, as Weil II (1.2.8) allows. Restricting to integers would exclude the rank-one real-weight twists of DWP.5.
- 0 has no ι-weight.
- q > 1 is part of the datum. At a closed point x, the Frobenius is F^{deg x} and the base is q^{deg x}, and w_{ι,q^r}(α^r) = w_{ι,q}(α) keeps the weight unchanged.

Atlas landmark: **ι-weight**.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.0/endomorphism-weights: ι-weights of the eigenvalues of an endomorphism
- DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters: a twist by b shifts ι-weights by w_ι(b)
- PadicDifferentialEquationsAndRigidCohomology:RD.6/pointwise-iota-weights: the ι-pure and ι-mixed predicates on Frobenius eigenvalues
- DeligneWeightsAndPurity:DWP.5: pointwise ι-pure Weil sheaves (Weil II (1.2.6))
- WeightsInEtaleCohomology:R34.1: weights for a chosen embedding compared with weights for all embeddings

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.iotaWeight` | constructor | The real number 2 log(\|ια\|)/log(q), with q>1 and α≠0. |
| `TauCeti.Weights.IsIotaPure` | data | Nonvanishing and the specified real ι-weight. |
| `TauCeti.Weights.iotaWeight_mul` | simp | The ι-weight of a product of nonzero scalars is the sum of their weights. |
| `TauCeti.Weights.iotaWeight_inv` | simp | The ι-weight of an inverse is the negative of the weight. |
| `TauCeti.Weights.iotaWeight_pow_base` | simp | Raising α and q to the same positive integer power preserves the ι-weight. |
| `TauCeti.Weights.iotaWeight_comp` | compatibility | Composition of field embeddings transports the ι-weight. |
| `TauCeti.Weights.norm_eq_rpow_iotaWeight` | characterisation | For q>1 and α≠0, the modulus is q raised to half the ι-weight. |
| `TauCeti.Weights.IsWeilNumber.isIotaPure` | compatibility | A Weil number is ι-pure of its integer weight for every complex embedding. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.iotaWeight_q` | value | For q ∈ ℚ with q > 1 and every ι: w_{ι,q}(q) = 2 and w_{ι,q}(q⁻¹) = −2. So ℚ_ℓ(1), on which geometric Frobenius acts by q⁻¹, has weight −2. |
| `TauCeti.Weights.iotaWeight_depends_on_iota` | non-example | For E = ℚ(√2) and q = 2, α = 1 + √2 has ι-weight 2 log₂(1 + √2) at one real embedding and −2 log₂(1 + √2) at the other: the ι-weight depends on ι. |
| `TauCeti.Weights.iotaWeight_transcendental` | non-example | For E=ℚ(t), choose a transcendental complex number z of modulus √2 and send t to z. Then the ι-weight of t relative to 2 is 1, an integer, although t is not algebraic. The numeric test accepts the supplied transcendence and modulus conditions; no Lindemann–Weierstrass theorem is assumed. |
| `TauCeti.Weights.iotaWeight_rootOfUnity` | degenerate | w_{ι,q}(ζ) = 0 for every root of unity ζ ∈ E and every ι. |

Proof or construction:

1. Real.logb q is a homomorphism from the positive reals under multiplication to ℝ, and α ↦ ‖ι(α)‖ is multiplicative on E^×.
2. logb (q^r) (x^r) = logb q x for r ≥ 1 and x > 0.
3. A Weil q-number α satisfies |ι(α)| = q^{n/2}, because ι(α) is a complex root of the minimal polynomial of α (node weil-q-number).

Acceptance checks:

- ℚ_ℓ(r): the geometric Frobenius acts by q^{−r}, of ι-weight −2r for every ι (Weil I (3.1)).
- α = (1 + i√7)/2 ∈ ℚ̄: ι-weight 1 relative to 2 for every ι.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.8), p. 155.

Declaration id: `DeligneWeightsAndPurity:DWP.0/iota-weight`.

<a id="dwp-0-embeddings-into-the-complex-numbers"></a>

### Embeddings into ℂ extending a given embedding, and isomorphisms ℚ̄_ℓ ≅ ℂ

(i) Let E be a field of characteristic 0 with #E ≤ 𝔠, k ⊆ E a countable subfield, and σ : k → ℂ a field homomorphism. Then σ extends to a field homomorphism E → ℂ. (ii) If moreover E is algebraically closed with #E = 𝔠, then σ extends to a field isomorphism E ≅ ℂ. (iii) For every prime ℓ, #ℚ_ℓ = #ℚ̄_ℓ = 𝔠. So field isomorphisms ι : ℚ̄_ℓ ≅ ℂ exist, and every embedding into ℂ of a number field K ⊂ ℚ̄_ℓ extends to one. (iv) If α ∈ E is transcendental over ℚ, then for every transcendental z ∈ ℂ there is a field homomorphism ι : E → ℂ with ι(α) = z, which is an isomorphism in case (ii).

Hypotheses and scope:

- The extensions are not continuous for the ℓ-adic topology and are not canonical. Their existence uses transcendence bases, hence the axiom of choice. Deligne notes in Weil II (1.2.11) that for algebraicity statements the embeddings of the algebraic numbers suffice, and those need no choice.
- Countability of k leaves room: ℂ has transcendence degree 𝔠 over σ(k), at least that of E over k.
- (ii) needs #E = 𝔠, not only #E ≤ 𝔠: a countable algebraically closed field is not isomorphic to ℂ.

Proof or construction:

1. Transcendence degrees: for a countable subfield k, a transcendence basis of ℂ over σ(k) has cardinality 𝔠 (mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt with mathlib:Cardinal.mk_complex). A transcendence basis of E over k has cardinality at most #E ≤ 𝔠.
2. Choose a transcendence basis B of E over k and an injection of B into a transcendence basis of ℂ over σ(k). This gives k(B) → ℂ extending σ.
3. E is algebraic over k(B); extend to E → ℂ by mathlib:IsAlgClosed.lift.
4. For (ii), equip ℂ with its k-algebra structure through σ and match transcendence bases. The pinned classification returns a ring equivalence; prove separately that its construction restricts to σ by tracing the polynomial algebra equivalence and extending it as a base-compatible algebra-closure equivalence. This compatibility is not a theorem exposed by the cited ring-equivalence declaration and is recorded as a precise closure gap. The special k=ℚ isomorphism uses the existing characteristic-zero cardinal classification.
5. (iii): #ℤ_ℓ ≥ 𝔠, because (a_i) ↦ Σ a_i ℓ^i is injective on sequences in {0, 1}. #ℚ_ℓ ≤ 𝔠, because ℚ_ℓ is a quotient of a set of sequences of rationals. #ℚ̄_ℓ = #ℚ_ℓ by mathlib:Algebra.IsAlgebraic.cardinalMk_le_max.
6. (iv): apply (i) or (ii) to k = ℚ(α) with σ : ℚ(α) ≅ ℚ(z), α ↦ z.

Acceptance checks:

- Isomorphisms ℚ̄_5 ≅ ℂ exist, and a given embedding of ℚ(√−1) ⊂ ℚ̄_5 into ℂ extends to one.
- No such isomorphism is continuous: ℓ^n → 0 in ℚ̄_ℓ, while ι(ℓ^n) = ℓ^n → ∞ in ℂ.

Direct inputs: `mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt`, `mathlib:Cardinal.mk_complex`, `mathlib:IsAlgClosed.lift`, `mathlib:IsAlgClosed.equivOfTranscendenceBasis`, `mathlib:IsAlgClosed.ringEquiv_of_equiv_of_charZero`, `mathlib:Algebra.IsAlgebraic.cardinalMk_le_max`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.11), p. 156; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.11), p. 156.

Declaration id: `DeligneWeightsAndPurity:DWP.0/embeddings-into-the-complex-numbers`.

<a id="dwp-0-weil-number-iff-iota-pure-for-every-iota"></a>

### Algebraicity and Weil purity from ι-purity at every ι

Let E be a field of characteristic 0 with #E ≤ 𝔠 (for instance a finite extension of ℚ_ℓ, or ℚ̄_ℓ), q > 1 and n ∈ ℤ. For α ∈ E the following are equivalent: (a) α is a Weil q-number of weight n; (b) |ι(α)| = q^{n/2} for every field homomorphism ι : E → ℂ. If E is algebraically closed with #E = 𝔠, (b) may be restricted to field isomorphisms ι : E ≅ ℂ. In particular, an endomorphism that is ι-pure of weight n for every ι is pure of weight n.

Hypotheses and scope:

- The cardinality bound is needed: a field of characteristic 0 of cardinality greater than 𝔠 has no homomorphism to ℂ, and (b) would be vacuous.
- (b) for a single ι does not imply (a): see the tests of the node iota-weight.

Proof or construction:

1. (a) ⇒ (b): ι(α) is a complex root of the minimal polynomial of α (node weil-q-number).
2. (b) ⇒ α algebraic: if α were transcendental, part (iv) of the lemma embeddings-into-the-complex-numbers gives ι with ι(α) = z for any transcendental z; all but countably many complex numbers are transcendental, so z can be chosen with |z| ≠ q^{n/2}.
3. (b) ⇒ the conjugate condition: every σ : ℚ(α) → ℂ extends to E → ℂ, by part (i) of the lemma with k = ℚ(α), which is countable. So |σ(α)| = q^{n/2}.
4. Isomorphism variant: use part (ii) of the lemma in both steps.

Acceptance checks:

- A root α ∈ ℚ̄_5 of T² − T + 2 satisfies |ι(α)| = √2 for every ι : ℚ̄_5 ≅ ℂ.
- A transcendental t ∈ ℚ_5 (one exists, since #ℚ_5 = 𝔠) is ι-pure of weight 0 relative to 5 for an ι with ι(t) = e^{i}, and of weight 2 for an ι with ι(t) = 5e^{i}.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight), [DWP.0/embeddings-into-the-complex-numbers](#dwp-0-embeddings-into-the-complex-numbers).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota`.

<a id="dwp-0-endomorphism-weights"></a>

### Eigenvalues, Weil purity and ι-weights of an invertible endomorphism

Let E be a field of characteristic 0 with algebraic closure Ē, V a finite-dimensional E-vector space and F an invertible E-linear endomorphism of V. The eigenvalues of F are the roots of its characteristic polynomial det(T − F) in Ē, counted with multiplicity. The multiplicity of α equals the Ē-dimension of the maximal generalized eigenspace of F ⊗ Ē at α. (V, F) is pure of weight n relative to q if every eigenvalue is a Weil q-number of weight n. For a field homomorphism ι : Ē → ℂ, (V, F) is ι-pure of weight β ∈ ℝ if every eigenvalue has ι-weight β, and the ι-weights of (V, F) are the ι-weights of its eigenvalues, a finite subset of ℝ. The multiset of eigenvalues is stable under Aut(Ē/E), so none of these notions depends on the choice of Ē or of a splitting field inside Ē. V = 0 is pure of every weight and has no weights.

Hypotheses and scope:

- F must be invertible, since the eigenvalue 0 has no weight. Frobenius on ℓ-adic cohomology over a finite field is invertible; for a general endomorphism this is a hypothesis.
- Weights are read off the characteristic polynomial through generalized eigenspaces. No eigenbasis and no semisimplicity is assumed, and a Jordan block can be pure.
- In the applications E is ℚ_ℓ, a finite extension of it, or ℚ̄_ℓ; Weil II (1.2.4) applies the terminology to vector spaces with a Frobenius.
- The ι-weights depend on ι only through the multiset {ι(α)}. That multiset does not change when the roots are taken in another splitting field inside Ē, because the roots form one Aut(Ē/E)-stable multiset.

Atlas landmark: **Weights of an endomorphism**.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions: stability under subobjects, quotients and extensions
- DeligneWeightsAndPurity:DWP.0/weight-decomposition: decomposition of V by weight
- DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues: weights on the two sides of a perfect pairing
- DeligneWeightsAndPurity:DWP.2: the weight of a lisse sheaf on a curve through the Frobenius at each closed point (Weil I (3.1))
- DeligneWeightsAndPurity:DWP.5: pointwise purity of Weil sheaves (Weil II (1.2.2), (1.2.6))
- WeilConjectures:WC.3: degreewise purity of Frobenius on H^i

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.eigenvalues` | constructor | The characteristic-root multiset in an algebraic closure, of cardinality dim V. |
| `TauCeti.Weights.IsPure` | data | Every characteristic root is a Weil number of the specified integer weight. |
| `TauCeti.Weights.IsIotaPureEnd` | data | Every characteristic root has the specified real ι-weight. |
| `TauCeti.Weights.iotaWeights` | constructor | The finite set of real ι-weights of characteristic roots. |
| `TauCeti.Weights.count_eigenvalues` | characterisation | Root multiplicity is the dimension of its maximal generalized eigenspace after scalar extension. |
| `TauCeti.Weights.eigenvalues_map_aut` | compatibility | The characteristic-root multiset is invariant under every automorphism of the algebraic closure over the coefficient field. |
| `TauCeti.Weights.isPure_baseChange_iff` | compatibility | Purity is preserved and reflected under coefficient field extension; the ι-variant uses compatible closure embeddings. |
| `TauCeti.Weights.IsPure.isIotaPureEnd` | compatibility | Integer purity implies real ι-purity for every ι. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isPure_jordanBlock` | value | F = [[q, 1], [0, q]] on E² is pure of weight 2 relative to q and is not semisimple: purity does not see Jordan blocks. |
| `TauCeti.Weights.eigenvalues_rotation` | value | F = [[0, −q], [1, 0]] on ℚ² has characteristic polynomial T² + q, no eigenvalue in ℚ, eigenvalues ±i√q in ℚ̄, and is pure of weight 1. |
| `TauCeti.Weights.not_isPure_diag` | non-example | F = diag(1, q) is not pure; its weights are {0, 2}. |
| `TauCeti.Weights.isPure_zero_space` | degenerate | On V = 0, F is pure of every weight and has no weights. |
| `TauCeti.Weights.iotaWeights_singular_twist_rejection` | non-example | On a one-dimensional zero endomorphism F=0, the total log-based numeric iotaWeights core yields {0}. Multiplication by b=2 leaves F=0, so shifting by w₂(2)=2 would falsely give {2}. All iotaWeights_twist assertions therefore require invertible F; purity itself rejects the zero eigenvalue. |

Proof or construction:

1. Eigenvalues: the characteristic polynomial commutes with extension of scalars (mathlib:LinearMap.charpoly_baseChange), and over Ē its roots are the eigenvalues (mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly).
2. Multiplicity: mathlib:LinearMap.finrank_maxGenEigenspace_eq identifies the root multiplicity with the dimension of the maximal generalized eigenspace. These spaces span V ⊗ Ē (mathlib:Module.End.iSup_maxGenEigenspace_eq_top) and are independent (mathlib:Module.End.independent_maxGenEigenspace).
3. Galois stability: det(T − F) has coefficients in E, so every τ ∈ Aut(Ē/E) permutes its roots with multiplicities.
4. Independence of choices: Weil purity depends only on minimal polynomials over ℚ (node weil-q-number), and the multiset of ι-values is invariant by the previous step.

Acceptance checks:

- Jordan block [[q, 1], [0, q]]: pure of weight 2, with a generalized eigenspace of dimension 2 and an eigenspace of dimension 1.
- Frobenius on H¹ of an elliptic curve over 𝔽_q with trace a: characteristic polynomial T² − aT + q, pure of weight 1 because |a| ≤ 2√q (the compatibility case DWP.1 imports).

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight), `mathlib:LinearMap.charpoly_baseChange`, `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`, `mathlib:Module.End.iSup_maxGenEigenspace_eq_top`, `mathlib:Module.End.independent_maxGenEigenspace`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.6), p. 282; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Variante (1.2.4), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`.

<a id="dwp-0-characteristic-polynomial-in-short-exact-sequences"></a>

### Multiplicativity of the characteristic polynomial along an invariant subspace

Let V be a finite-dimensional E-vector space, F ∈ End_E(V), and W ⊆ V an F-stable subspace, with induced endomorphisms F_W of W and F_{V/W} of V/W. Then det(T − F) = det(T − F_W)·det(T − F_{V/W}). Consequently det(1 − tF) = det(1 − tF_W)·det(1 − tF_{V/W}) and det F = det F_W · det F_{V/W}, and the eigenvalue multiset of F is the sum of those of F_W and F_{V/W}.

Hypotheses and scope:

- A vector-space complement of W, which need not be F-stable, gives a block upper-triangular matrix. The statement concerns characteristic polynomials only; the extension need not split F-equivariantly.

Proof or construction:

1. Extend a basis of W to a basis of V. The matrix of F is block upper triangular, with diagonal blocks the matrices of F_W and F_{V/W}.
2. mathlib:Matrix.charpoly_fromBlocks_zero₂₁ computes the characteristic polynomial of a block upper-triangular matrix as the product of those of the diagonal blocks. The split case is mathlib:LinearMap.charpoly_prodMap.
3. The roots of a product are the sum of the roots of the factors.

Acceptance checks:

- Jordan block [[q, 1], [0, q]] with W = E e₁: F_W = q, F_{V/W} = q, and (T − q)² = (T − q)(T − q).

Direct inputs: `mathlib:Matrix.charpoly_fromBlocks_zero₂₁`, `mathlib:LinearMap.charpoly_prodMap`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.3), p. 276.

Declaration id: `DeligneWeightsAndPurity:DWP.0/characteristic-polynomial-in-short-exact-sequences`.

<a id="dwp-0-purity-under-subquotients-and-extensions"></a>

### Purity and weights under subobjects, quotients, extensions and direct sums

Let F be an invertible endomorphism of V and W ⊆ V an F-stable subspace. (i) (V, F) is pure of weight n if and only if (W, F_W) and (V/W, F_{V/W}) are both pure of weight n; the same holds for ι-purity of weight β. (ii) The ι-weights of V are the union of those of W and of V/W, and likewise for a direct sum. (iii) So the pairs (V, F) that are pure of weight n form a class closed under subobjects, quotients and extensions.

Hypotheses and scope:

- F_W and F_{V/W} are invertible when F is: F_W is injective on a finite-dimensional space, and det F = det F_W · det F_{V/W}.
- (i) does not say that an extension of pure objects of the same weight splits: the Jordan block is a non-split extension of (E, q) by (E, q).

Proof or construction:

1. The lemma characteristic-polynomial-in-short-exact-sequences gives the eigenvalue multiset of V as the sum of those of W and V/W.
2. Purity and ι-weights are conditions on each eigenvalue (node endomorphism-weights).

Acceptance checks:

- V = E², F = diag(1, q), W = E e₂: W has weight 2, V/W has weight 0, and V is not pure.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/characteristic-polynomial-in-short-exact-sequences](#dwp-0-characteristic-polynomial-in-short-exact-sequences).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(i), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`.

<a id="dwp-0-characteristic-power-series-and-traces"></a>

### The characteristic power series det(1 − tF) and traces of powers

Let F be an endomorphism of a finite-dimensional vector space V over a field E. (i) det(1 − tF) ∈ E[t] is the reverse of det(T − F): det(1 − tF) = t^{dim V} det(t⁻¹ − F), and over Ē it is ∏(1 − αt) over the eigenvalues α. (ii) Writing D(t)=det(1−tF), in E[[t]] one has −tD′(t)/D(t)=Σ_{n≥1}Tr(F^n)t^n in every characteristic. When E has characteristic 0 this is t(d/dt)log D(t)⁻¹. (iii) If E has characteristic 0, the traces Tr(F^n) for 1 ≤ n ≤ dim V determine det(1 − tF), hence the eigenvalue multiset.

Hypotheses and scope:

- (iii) needs characteristic 0 (characteristic greater than dim V suffices). On 𝔽_p^p, the identity and the zero map have equal traces of all powers.
- The formal logarithm requires characteristic 0 and constant term 1; the quotient D′/D is defined in every characteristic because D(0)=1.

Proof or construction:

1. (i): mathlib:Matrix.reverse_charpoly identifies the reverse of the characteristic polynomial with det(1 − tM). Over an algebraically closed field the characteristic polynomial is the product of the T − α.
2. (ii): along an F-stable flag over Ē, D(t)=∏(1−αt), so −tD′/D=Σ_α αt/(1−αt)=Σ_{n≥1}Tr(F^n)t^n. Descent is coefficientwise injectivity. Only in characteristic 0 identify this quotient with the formal-log derivative.
3. (iii): Newton's identities. In characteristic 0 the power sums p_n = Tr(F^n) = Σ α_i^n for n ≤ d determine the elementary symmetric functions of the α_i, which are the coefficients of det(1 − tF) up to sign (mathlib:Matrix.trace_eq_sum_roots_charpoly gives p₁ = Σ α_i).

Acceptance checks:

- F = diag(1, q): det(1 − tF) = (1 − t)(1 − qt), and Σ (1 + q^n) t^n = t d/dt (−log(1 − t) − log(1 − qt)).
- Over 𝔽_p, id and 0 on 𝔽_p^p: Tr(F^n) = p = 0 for both, while det(1 − t·id) = (1 − t)^p ≠ 1.

Direct inputs: [DWP.0/characteristic-polynomial-in-short-exact-sequences](#dwp-0-characteristic-polynomial-in-short-exact-sequences), `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.trace_eq_sum_roots_charpoly`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.3), p. 275.

Declaration id: `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`.

<a id="dwp-0-spectra-of-polynomials-in-an-endomorphism"></a>

### Eigenvalues of P(F), F^r and F⁻¹, with multiplicities

Let F be an endomorphism of a finite-dimensional E-vector space V with eigenvalue multiset {α₁, …, α_d} ⊂ Ē, and let P ∈ E[T]. Then the eigenvalue multiset of P(F) is {P(α₁), …, P(α_d)}, with multiplicities. In particular F^r has eigenvalues α_i^r (r ≥ 1), and if F is invertible, F⁻¹ has eigenvalues α_i⁻¹. The maximal generalized eigenspace of F at α is contained in that of P(F) at P(α).

Hypotheses and scope:

- The statement is about multisets. Mathlib's spectral mapping theorem (spectrum.map_polynomial_aeval_of_nonempty) is an equality of sets, which loses multiplicities: for F = diag(1, −1) and P = T², the multiset is {1, 1}, while the set is {1}.

Proof or construction:

1. Extend scalars to Ē (mathlib:LinearMap.charpoly_baseChange). V_Ē is the direct sum of the maximal generalized eigenspaces V_α (mathlib:Module.End.iSup_maxGenEigenspace_eq_top, mathlib:Module.End.independent_maxGenEigenspace), and each is F-stable.
2. On V_α, F − α is nilpotent, and P(F) − P(α) = (F − α)Q(F) with Q ∈ Ē[T]. So P(F) − P(α) is nilpotent on V_α, and the characteristic polynomial of P(F) on V_α is (T − P(α))^{dim V_α}.
3. The characteristic polynomial is multiplicative on the direct sum (mathlib:LinearMap.charpoly_prodMap), and dim V_α is the multiplicity of α (mathlib:LinearMap.finrank_maxGenEigenspace_eq).
4. F⁻¹: on V_α, F⁻¹ − α⁻¹ = −α⁻¹F⁻¹(F − α) is nilpotent. Alternatively, mathlib:Matrix.charpoly_inv gives the characteristic polynomial of the inverse matrix through the reversed polynomial.

Acceptance checks:

- F = diag(1, −1), P = T²: eigenvalues {1, 1}, and F² = id.
- The square of the Jordan block [[q, 1], [0, q]] is [[q², 2q], [0, q²]], with eigenvalue q² of multiplicity 2.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), `mathlib:LinearMap.charpoly_baseChange`, `mathlib:Module.End.iSup_maxGenEigenspace_eq_top`, `mathlib:Module.End.independent_maxGenEigenspace`, `mathlib:LinearMap.charpoly_prodMap`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`, `mathlib:Matrix.charpoly_inv`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.1), p. 275.

Declaration id: `DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism`.

<a id="dwp-0-finite-field-base-extension-of-weights"></a>

### Weights under a finite extension of the finite base field

Let F be an invertible endomorphism of V, q > 1 and r ≥ 1. (V, F) is pure of weight n relative to q if and only if (V, F^r) is pure of weight n relative to q^r. For every ι, the ι-weights of F relative to q equal the ι-weights of F^r relative to q^r, with multiplicities. In the finite-field situation, passing from k₀ = 𝔽_q to its extension of degree r replaces the geometric Frobenius F by F^r and q by q^r, so the weights do not change. At a closed point x, F_x = F^{deg x} acts with base q_x = q^{deg x}.

Hypotheses and scope:

- The equivalence concerns weights only: F^r can have a repeated eigenvalue where F has distinct ones (α and ζα with ζ^r = 1).

Proof or construction:

1. The theorem spectra-of-polynomials-in-an-endomorphism with P = T^r: the eigenvalues of F^r are the α_i^r.
2. The theorem weil-number-base-extension for Weil purity, and iotaWeight_pow_base (node iota-weight) for ι-weights.

Acceptance checks:

- F = [[0, −q], [1, 0]] has eigenvalues ±i√q, of weight 1 relative to q. F² = −q·id has eigenvalue −q twice, of weight 1 relative to q².

Direct inputs: [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension), [DWP.0/iota-weight](#dwp-0-iota-weight), [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1, (1.1.13), p. 152.

Declaration id: `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`.

<a id="dwp-0-spectra-of-tensor-products-and-duals"></a>

### Eigenvalues of tensor products, contragredients and Hom spaces

Let F and G be invertible endomorphisms of finite-dimensional E-spaces V and W, with eigenvalue multisets {α_i} and {β_j}. (i) F ⊗ G on V ⊗_E W has eigenvalue multiset {α_i β_j}. (ii) The transpose F^* on V^* has the eigenvalues of F. The contragredient F^∨ = (F⁻¹)^* has eigenvalues {α_i⁻¹}. (iii) On Hom_E(V, W), the endomorphism u ↦ G ∘ u ∘ F⁻¹ has eigenvalues {β_j α_i⁻¹}. (iv) F^{⊗k} on V^{⊗k} has as eigenvalues the products of k eigenvalues, and det F = ∏ α_i. Consequently, if V is pure of weight n and W of weight m, then V ⊗ W is pure of weight n + m, V^∨ of weight −n, Hom(V, W) of weight m − n, and V^{⊗k} of weight kn. The ι-weights behave in the same way.

Hypotheses and scope:

- Dual means the contragredient (F⁻¹)^*, as for representations and for the dual of a lisse sheaf in Weil II (1.2.5)(ii). The transpose F^* has the same eigenvalues as F, not their inverses.
- No semisimplicity is used; multiplicities are dimensions of generalized eigenspaces.

Proof or construction:

1. Over Ē, V = ⊕ V_α and W = ⊕ W_β (maximal generalized eigenspaces), so V ⊗ W = ⊕ V_α ⊗ W_β.
2. On V_α ⊗ W_β, F ⊗ G − αβ = (F − α) ⊗ G + α(1 ⊗ (G − β)) is a sum of two commuting nilpotent endomorphisms, hence nilpotent. The dimensions multiply.
3. Transpose: in the dual basis the matrix of F^* is the transpose, which has the same characteristic polynomial (mathlib:LinearMap.det_dualMap for the determinant). The contragredient is the transpose of F⁻¹, whose eigenvalues are given by the theorem spectra-of-polynomials-in-an-endomorphism.
4. Hom(V, W) ≅ V^* ⊗ W, and u ↦ GuF⁻¹ corresponds to F^∨ ⊗ G.
5. Consistency checks: det(A ⊗ B) = det(A)^{dim W} det(B)^{dim V} (mathlib:Matrix.det_kronecker) and Tr(F ⊗ G) = Tr F · Tr G (mathlib:LinearMap.trace_tensorProduct').
6. Weights: products and inverses of Weil q-numbers (theorem weil-number-arithmetic), and additivity of ι-weights.

Acceptance checks:

- diag(1, q) ⊗ diag(1, q) = diag(1, q, q, q²), with weights 0, 2, 2, 4.
- The contragredient of ℚ_ℓ(1) is ℚ_ℓ(−1): the eigenvalue q⁻¹ becomes q, and the weight −2 becomes 2.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), `mathlib:Matrix.det_kronecker`, `mathlib:LinearMap.trace_tensorProduct'`, `mathlib:LinearMap.det_dualMap`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`.

<a id="dwp-0-eigenvalues-of-exterior-powers"></a>

### Eigenvalues of exterior powers

Let F be an endomorphism of a d-dimensional E-space V, with eigenvalues α₁,…,α_d in an algebraic closure, listed with algebraic multiplicity. The eigenvalue multiset of ∧^k F consists of ∏_{i∈I}α_i for all k-element subsets I⊆{1,…,d}, once per subset of positions. In particular ∧^0 F has sole eigenvalue 1, ∧^d F has sole eigenvalue det F, and ∧^k V=0 for k>d. If F is invertible and pure of weight n, ∧^k F is pure of weight kn; real ι-weights are sums over those positions.

Hypotheses and scope:

- No semisimplicity is assumed; equal eigenvalues in different positions remain distinct choices.

Proof or construction:

1. Extend scalars to the algebraic closure and choose an F-stable full flag, giving an upper triangular matrix with diagonal α₁,…,α_d.
2. Use the existing exteriorPower.map and Module.Basis.exteriorPower. The wedge basis indexed by k-element subsets has a triangular induced matrix with diagonal the indicated products. Its characteristic roots give the multiset; scalar extension commutes with the alternating universal property.
3. The empty wedge, top wedge and out-of-range cases follow from the same basis. Products of Weil numbers add weights, and nonzero ι-weights add.

Acceptance checks:

- For diag(1,q,q), ∧² has eigenvalues q,q,q²: positions, rather than distinct scalar values, control multiplicity.
- For the two-dimensional Jordan block with diagonal q, ∧² has sole eigenvalue q² despite nonsemisimplicity.
- The empty wedge has eigenvalue 1, while k>d gives an empty spectrum.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), [DWP.0/iota-weight](#dwp-0-iota-weight), `mathlib:exteriorPower.map`, `mathlib:Module.Basis.exteriorPower`, `mathlib:LinearMap.charpoly_baseChange`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.5, proof (1.5.3), pp. 164–165.

Declaration id: `DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers`.

<a id="dwp-0-twisting-by-rank-one-characters"></a>

### Twists V^{(b)} and Tate twists V(r)

For b ∈ E^× and an E-space V with invertible F, the twist is V^{(b)} = (V, bF) = V ⊗ E^{(b)}, where E^{(b)} is the rank-one space on which F acts by b (Weil II (1.2.7)). Its eigenvalues are the bα_i, and its ι-weights are those of V shifted by w_{ι,q}(b). With the geometric Frobenius convention, ℚ_ℓ(1) = E^{(q⁻¹)}, and the Tate twist V(r) = V ⊗ ℚ_ℓ(1)^{⊗r} = V^{(q^{−r})} (r ∈ ℤ) shifts weights by −2r. When E contains a square root q^{1/2}, the half twist V^{(q^{−1/2})} shifts weights by −1. It depends on the choice of q^{1/2}: the two choices differ by the twist by −1, of weight 0. Twisting is functorial and exact, satisfies V^{(b)} ⊗ W^{(c)} = (V ⊗ W)^{(bc)}, and dualizes as (V^{(b)})^∨ = (V^∨)^{(b⁻¹)}.

Hypotheses and scope:

- Geometric Frobenius: ℚ_ℓ(1) has eigenvalue q⁻¹ and weight −2 (Weil II (1.2.5)(iv)); with arithmetic Frobenius the signs reverse. The comparison with the Galois action on roots of unity is EtaleDualityAndPerverseSheaves EDC.0's.
- b need not be an ℓ-adic unit. For b not a unit, E^{(b)} is a Weil sheaf on Spec 𝔽_q and not an étale sheaf (Weil II (1.1.14), (1.2.7)).
- For b of non-integral ι-weight the twist shifts ι-weights by a real number. These are DWP.5's rank-one real-weight twists, which are distinct from Tate twists.

Uses that determine the interface:

- GlobalShtukasAndFunctionFieldLanglands:GS.1/modified-commutativity-and-tate-twist: the half Tate twist and the correction factor q^{−d/2}
- DeligneWeightsAndPurity:DWP.5: rank-one real-weight twists
- WeilConjectures:WC.2: the Tate twist in the Poincaré pairing H^i × H^{2d−i} → ℚ_ℓ(−d)
- DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues: a pairing into E^{(c)}

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.twist` | constructor | Multiply the invertible Frobenius endomorphism by a nonzero scalar b. |
| `TauCeti.Weights.tateTwist` | constructor | The integer twist multiplies geometric Frobenius by q^(−r). |
| `TauCeti.Weights.eigenvalues_twist` | characterisation | Multiplication by b multiplies every characteristic root by b. |
| `TauCeti.Weights.iotaWeights_twist` | characterisation | For an invertible endomorphism F, a nonzero scalar twist translates the weight set by the scalar’s ι-weight. The total numeric logarithm at zero does not satisfy this translation rule. |
| `TauCeti.Weights.IsPure.tateTwist` | compatibility | For a positive integral q, an integer Tate twist shifts a pure weight n to n−2r. |
| `TauCeti.Weights.twist_tensor` | compatibility | Scalar twists of tensor factors multiply their scalars. |
| `TauCeti.Weights.twist_twist` | simp | Two successive scalar twists equal the twist by the product. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.tateTwist_weight` | value | ℚ_ℓ(1) = E^{(q⁻¹)} is pure of weight −2, and ℚ_ℓ(r) of weight −2r. |
| `TauCeti.Weights.twist_one` | degenerate | twist 1 F = F, and V(0) = V. |
| `TauCeti.Weights.halfTwist_depends_on_sqrt` | non-example | The half twist depends on the square root: for V = E and F = 1, the choices q^{1/2} and −q^{1/2} give eigenvalues q^{−1/2} and −q^{−1/2}, non-isomorphic Frobenius modules, both of weight −1. |
| `TauCeti.Weights.twist_nonintegral_weight` | non-example | For b with w_{ι,q}(b) = 1/2, for instance b transcendental with \|ι(b)\| = q^{1/4}, E^{(b)} is ι-pure of the non-integral weight 1/2 and is not pure in the sense of Weil numbers. |

Proof or construction:

1. Eigenvalues: det(T − bF) = b^d det(T/b − F), or the theorem spectra-of-tensor-products-and-duals with the rank-one factor E^{(b)}.
2. Weights: w_ι(bα) = w_ι(b) + w_ι(α) (node iota-weight). For Weil numbers, q^{−r}α has weight n − 2r (theorem weil-number-arithmetic).
3. Functoriality, exactness and the tensor and dual formulas hold on underlying spaces, where the twist is the identity.

Acceptance checks:

- H²(ℙ¹) = ℚ_ℓ(−1) has F = q and weight 2; its twist H²(ℙ¹)(1) is ℚ_ℓ with F = 1 and weight 0.

Direct inputs: [DWP.0/iota-weight](#dwp-0-iota-weight), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.7), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(iv), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`.

<a id="dwp-0-reciprocal-pairing-of-eigenvalues"></a>

### Eigenvalues under a Frobenius-equivariant perfect pairing

Let V and V′ be E-spaces of finite dimension d with invertible endomorphisms F and F′, and ⟨ , ⟩ : V × V′ → E a perfect bilinear pairing with ⟨Fx, F′y⟩ = c⟨x, y⟩ for some c ∈ E^×. Then: (i) under the isomorphism V′ ≅ V^* given by the pairing, F′ corresponds to c·(F⁻¹)^*; (ii) the eigenvalue multiset of F′ is {c/α_i}, and det(T − F′) = (−T)^d det(c/T − F) / det F; (iii) over Ē, the maximal generalized eigenspaces satisfy ⟨V_α, V′_β⟩ = 0 unless αβ = c, and the pairing restricts to a perfect pairing V_α × V′_{c/α} → Ē; (iv) if V is pure of weight n and c is a Weil q-number of weight w, then V′ is pure of weight w − n, and likewise for ι-weights. For V′ = V, the eigenvalue multiset of F is stable under α ↦ c/α.

Hypotheses and scope:

- Perfectness is needed: for the zero pairing the equivariance holds for every F′.
- c is the eigenvalue of Frobenius on the target line. For Poincaré duality H^i × H^{2m−i} → H^{2m} ≅ ℚ_ℓ(−m), c = q^m (Weil I (2.4)–(2.5)). The geometric inputs, that cup product commutes with F and that F acts by q^m on H^{2m}, belong to EDC and WC.2.
- No semisimplicity is assumed: (iii) is a statement about generalized eigenspaces.
- The parity of the multiplicity of ±√c for a symmetric or alternating self-pairing, and the sign of the functional equation, are WeilConjectures WC.2's.

Atlas landmark: **Reciprocal pairing**.

Proof or construction:

1. (i): ⟨x, F′y⟩ = c⟨F⁻¹x, y⟩, so the adjoint of F′ with respect to the pairing is cF⁻¹.
2. (ii): the transpose has the same characteristic polynomial. mathlib:Matrix.charpoly_inv expresses the characteristic polynomial of an inverse through the reversed polynomial, and scaling by c gives the formula. The eigenvalues are the c/α_i by the theorem spectra-of-polynomials-in-an-endomorphism applied to F⁻¹.
3. (iii): ⟨Fx, y⟩ = c⟨x, F′⁻¹y⟩, so ⟨(F − α)^N x, y⟩ = ⟨x, (cF′⁻¹ − α)^N y⟩. For x ∈ V_α take N with (F − α)^N x = 0. On V′_β, cF′⁻¹ − α is c/β − α plus a nilpotent, hence invertible unless αβ = c. So ⟨x, y⟩ = 0 unless αβ = c, and perfectness on the direct sums forces each V_α × V′_{c/α} to be perfect.
4. (iv): c/α is a Weil q-number of weight w − n (theorem weil-number-arithmetic), and w_ι(c/α) = w_ι(c) − w_ι(α).

Acceptance checks:

- A curve of genus g: H⁰ × H² with c = q gives eigenvalue 1 on H⁰ and q on H². H¹ × H¹ is alternating with c = q, so the eigenvalues on H¹ are stable under α ↦ q/α.
- The Jordan block F = [[q, 1], [0, q]] paired with V′ = E² for c = q²: F′ = q²(F⁻¹)^* has eigenvalue q with multiplicity 2 and is again a Jordan block.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), `mathlib:Matrix.charpoly_inv`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.5), p. 281; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.5), p. 281; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §1 pp. 2–3; §7.1 p. 64.

Declaration id: `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`.

<a id="dwp-0-disjoint-spectra-no-intertwiner"></a>

### Disjoint spectra: no nonzero Frobenius-equivariant maps between different weights

Let F and G be endomorphisms of finite-dimensional E-spaces V and W whose characteristic polynomials have no common root in Ē, equivalently are coprime in E[T]. Then every E-linear u : V → W with u ∘ F = G ∘ u is zero. In particular: (i) if V is pure of weight n and W pure of weight m ≠ n, relative to q > 1, or ι-pure of weights β ≠ γ, then there is no nonzero equivariant map V → W; (ii) if W ⊆ V is F-stable, with W pure of weight n and V/W pure of weight m ≠ n, then W has a unique F-stable complement.

Hypotheses and scope:

- q > 1 is needed for the weights to separate eigenvalues (node weil-q-number).
- Equal weights allow non-split extensions (the Jordan block) and nonzero maps.

Atlas landmark: **Weight separation**.

Proof or construction:

1. Coprimality: two polynomials with no common root in Ē are coprime (mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed). Write aP_F + bP_G = 1.
2. Cayley–Hamilton: P_F(F) = 0 (mathlib:LinearMap.aeval_self_charpoly). From uF = Gu we get 0 = uP_F(F) = P_F(G)u. Since a(G)P_F(G) = 1 − b(G)P_G(G) = 1, P_F(G) is invertible, and u = 0. No extension of scalars is needed.
3. Different weights give disjoint eigenvalue sets, by uniqueness of the weight (node weil-q-number, q > 1) or of the ι-weight.
4. (ii): with P_n and P_m the characteristic polynomials of W and V/W, V = ker P_n(F) ⊕ ker P_m(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime and Cayley–Hamilton). ker P_n(F) contains W and has the same dimension, so ker P_m(F) is an F-stable complement. It is unique, because an F-stable complement is isomorphic to V/W, hence annihilated by P_m(F).

Acceptance checks:

- V = (E, 1) and W = (E, q): every equivariant map V → W is zero.
- Jordan block: W = E e₁ and V/W both have weight 2, and there is no F-stable complement.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight), `mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, preuve de (1.7) ⇒ (1.6), p. 277.

Declaration id: `DeligneWeightsAndPurity:DWP.0/disjoint-spectra-no-intertwiner`.

<a id="dwp-0-weight-decomposition"></a>

### Decomposition of a Frobenius module by weights

Let F be an invertible endomorphism of a finite-dimensional E-space V, and q > 1. (i) If every eigenvalue of F is a Weil q-number, then V = ⊕_n V_n, a finite sum over n ∈ ℤ. Here V_n = ker P_n(F), and P_n ∈ E[T] is the monic polynomial whose roots are the eigenvalues of weight n, with their multiplicities. Each V_n is F-stable and pure of weight n, and det(T − F) = ∏ P_n. (ii) For ι : Ē → ℂ the same holds over Ē with real weights: V ⊗ Ē = ⊕_β (V ⊗ Ē)_β. (iii) The decompositions are functorial: an equivariant map V → W maps V_n into W_n.

Hypotheses and scope:

- (i) holds over E itself. P_n has coefficients in E because Aut(Ē/E) permutes the eigenvalues, preserving multiplicities and Weil weights, and E is perfect.
- (ii) does not descend to E in general, because the ι-weight is not Galois-invariant. Take E = ℚ and F with characteristic polynomial T² − 2T − 1 (eigenvalues 1 ± √2). For every ι it has the two distinct ι-weights ±2 log₂(1 + √2) relative to 2, but no F-stable line over ℚ.
- Each V_n need not be semisimple.
- Separating the factors of a zeta function, with their integrality and ℓ-independence, is WeilConjectures WC.3's. This node decomposes one Frobenius module.

Atlas landmark: **Weight decomposition**.

Proof or construction:

1. Group the eigenvalues by weight, which is unique for q > 1, and set P_n = ∏_{w(α) = n} (T − α)^{m_α}.
2. P_n ∈ E[T]: it is invariant under Aut(Ē/E) (node endomorphism-weights), and in characteristic 0 the fixed field of Aut(Ē/E) is E.
3. The P_n are pairwise coprime (theorem disjoint-spectra-no-intertwiner, first step), so V = ⊕ ker P_n(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime with Cayley–Hamilton, mathlib:LinearMap.aeval_self_charpoly).
4. The characteristic polynomial of F on V_n is P_n: V_n ⊗ Ē is the sum of the generalized eigenspaces at the roots of P_n, whose dimensions are the multiplicities (mathlib:LinearMap.finrank_maxGenEigenspace_eq).
5. Functoriality: the theorem disjoint-spectra-no-intertwiner applied to the components V_n → W_m with n ≠ m.

Acceptance checks:

- F = diag(1, q) ⊕ [[q, 1], [0, q]] on E⁴: V₀ = E e₁, and V₂ has dimension 3.
- Descent fails for ι-weights: T² − 2T − 1 over ℚ, as in the hypotheses.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), [DWP.0/weil-q-number](#dwp-0-weil-q-number), `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, preuve de (1.7) ⇒ (1.6), p. 277.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weight-decomposition`.

## DWP.1 — The initial curve and abelian-variety estimate

Apply the imported polarizations, Rosati positivity and Tate realization to Frobenius and Verschiebung. The finite-flat degree calculation precedes point counts. The curve comparison uses the Jacobian owner; genus one is checked against the existing Hasse theorem.

<a id="dwp-1-frobenius-endomorphism-over-a-finite-field"></a>

### The q-Frobenius endomorphism of a variety over 𝔽_q

Import scheme Frobenius from SF.0 and instantiate its q-power iterate over 𝔽_q. Let V be a variety (a separated scheme of finite type) over 𝔽_q. The q-Frobenius π_V : V → V is the identity on the underlying space and f ↦ f^q on the structure sheaf. It is an 𝔽_q-morphism. It commutes with every 𝔽_q-morphism φ : W → V, that is φ ∘ π_W = π_V ∘ φ, and on V(𝔽̄_q) it acts by raising coordinates to the q-th power, so V(𝔽_{q^m}) is the fixed-point set of π_V^m. Its differential is 0. For an abelian variety A over 𝔽_q, π_A fixes 0 and is an endomorphism of A, of degree q^g. After extending scalars to 𝔽_{q^m}, the Frobenius is π_A^m.

Hypotheses and scope:

- π_V is the relative (q-power) Frobenius over 𝔽_q, not the absolute p-Frobenius when q = p^a with a > 1.
- On 𝔽̄_q-points π_V agrees with the arithmetic Frobenius acting on coordinates. The geometric Frobenius on étale cohomology is (π_V)^* (Weil I (1.15)); the conventions are those of DWP.0.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism: π†π = q
- DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties: #A(𝔽_{q^m}) = deg(1 − π^m)
- WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology: π_A against the arithmetic and geometric Frobenius
- WeilConjectures:WC.5: point counts as fixed points of the Frobenius

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.frobeniusEndo` | constructor | The supplied scheme q-Frobenius, viewed as an endomorphism over 𝔽_q. |
| `TauCeti.Weights.frobeniusEndo_comp` | compatibility | The q-Frobenius commutes with every morphism over 𝔽_q. |
| `TauCeti.Weights.fixedPoints_frobeniusEndo_pow` | characterisation | The fixed points of the mth Frobenius power on geometric points are the points over 𝔽_(q^m), for m≥1. |
| `TauCeti.Weights.frobeniusEndo_baseChange` | compatibility | Relative Frobenius after degree-m constant extension is the scalar extension of the mth original power. |
| `TauCeti.Weights.AbelianVariety.frobenius` | constructor | The group endomorphism on an abelian variety induced by its supplied scheme Frobenius. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.frobeniusEndo_projectiveLine_fixed` | value | The fixed points of π on ℙ¹(𝔽̄_q) are the q + 1 points of ℙ¹(𝔽_q). |
| `TauCeti.Weights.frobeniusEndo_spec_field` | degenerate | On Spec 𝔽_q, π is the identity. |
| `TauCeti.Weights.frobeniusEndo_not_absolute` | non-example | For q = p², π_V is the square of the absolute Frobenius, not the absolute Frobenius itself; its fixed points on 𝔸¹(𝔽̄_q) are 𝔽_{p²}, not 𝔽_p. |
| `TauCeti.Weights.deg_frobenius_elliptic` | value | For an elliptic curve over 𝔽_q, deg π_E = q. |

Proof or construction:

1. Locally V = Spec R with R an 𝔽_q-algebra, and π_V corresponds to r ↦ r^q, an 𝔽_q-algebra endomorphism since a^q = a for a ∈ 𝔽_q. These glue, since x ↦ x^q commutes with localization.
2. Naturality: an 𝔽_q-algebra map commutes with x ↦ x^q.
3. Points: for x ∈ V(𝔽̄_q) with coordinates (x_i), π_V(x) = (x_i^q). The fixed points of π_V^m are the points with coordinates in 𝔽_{q^m}.
4. d(x^q) = qx^{q−1}dx = 0 in characteristic p.
5. Naturality with respect to addition and the product identity π_(A×A)=π_A×π_A make π_A a group homomorphism. Independently import SF.0’s degree formula: q-Frobenius on a smooth pure g-dimensional scheme over a perfect finite field is finite locally free of degree q^g, computed étale-locally on affine g-space. This does not use the later point-count theorem.

Acceptance checks:

- On ℙ¹ over 𝔽_q, π is [x : y] ↦ [x^q : y^q], and its fixed points are the q + 1 points of ℙ¹(𝔽_q).
- For an elliptic curve E over 𝔽_q, π_E is the q-power Frobenius endomorphism, and 1 − π_E is separable.

Direct inputs: [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `SchemeAndStackFoundations:SF.0`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, p. 75; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, p. 75.

Declaration id: `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`.

<a id="dwp-1-rosati-of-the-frobenius-endomorphism"></a>

### Milne II.1.2: π†π = q

Let A be an abelian variety over 𝔽_q, λ a polarization of A defined over 𝔽_q, and † the Rosati involution of λ. Then π_A^† ∘ π_A = q in End⁰(A), that is π_A^∨ ∘ λ ∘ π_A = q·λ.

Hypotheses and scope:

- λ must be defined over 𝔽_q, so that it commutes with the Frobenius. A polarization over 𝔽_q exists, since A is projective over 𝔽_q (requested from AbelianSchemesAndArithmeticModuli A2).
- This is where the Frobenius–Verschiebung relation enters, as RS-17 keeps it: π^∨ corresponds to the Verschiebung through λ.

Proof or construction:

1. With λ = φ_D for an ample divisor D (over 𝔽̄_q): λ(a) = [t_a^*D − D].
2. For any divisor D′ over 𝔽_q, π^*D′ = qD′: locally D′ = div f and f ∘ π = f^q.
3. For a ∈ A(𝔽̄_q): (π^∨λπ)(a) = [π^*t_{π(a)}^*D − π^*D] = [t_a^*π^*D − π^*D] = [t_a^*(qD) − qD] = qλ(a), using π ∘ t_a = t_{π(a)} ∘ π.

Acceptance checks:

- An elliptic curve with λ the principal polarization: π† = π̂, and π̂π = [q] = deg π.

Direct inputs: [DWP.1/frobenius-endomorphism-over-a-finite-field](#dwp-1-frobenius-endomorphism-over-a-finite-field), `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A2`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Lemma 1.2, p. 76.

Declaration id: `DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism`.

<a id="dwp-1-absolute-values-from-the-rosati-involution"></a>

### Milne II.1.3: α†α = r forces |a|² = r for the roots of P_α

Let A be an abelian variety over a field k with a polarization and Rosati involution †, and α ∈ End⁰(A) with α†α = r ∈ ℤ_{>0}. Then ℚ[α] is a product of fields, stable under †, and † acts on each real factor of ℚ[α] ⊗ ℝ as the identity and on each complex factor as complex conjugation. Every root a of P_α in ℂ satisfies |a|² = r.

Hypotheses and scope:

- The positivity of the Rosati involution (AbelianSchemesAndArithmeticModuli A6/rosati-positivity) is the key input. No Tate isogeny theorem and no cohomological purity is used, as RS-17 requires.
- ℚ[α] is commutative. A factor of ℚ[α] ⊗ ℝ with † trivial is ℝ, and † is conjugation on each factor ℂ.

Proof or construction:

1. ℚ[α] has no nonzero nilpotents. For a ≠ 0 put b = a†a; then Tr(b) > 0 (Rosati positivity), b† = b and Tr(b²) = Tr(b†b) > 0, so b² ≠ 0, b⁴ ≠ 0, and so on. Hence ℚ[α] is a product of fields K_i.
2. † is an automorphism of ℚ[α] (α† = rα⁻¹ ∈ ℚ[α]). It permutes the factors, and positivity forces it to preserve each one: otherwise Tr(aa†) would vanish on a single factor.
3. On ℚ[α] ⊗ ℝ = ∏ ℝ × ∏ ℂ, † is a positive involution of each factor: the identity on ℝ, and complex conjugation on ℂ (the identity of ℂ is not positive: Tr(i·i) < 0).
4. For every σ : ℚ[α] → ℂ, σ(α†) = conj(σ(α)), so r = σ(α†α) = |σ(α)|². So the roots of the minimal polynomial of α have |·|² = r, and by AbelianSchemesAndArithmeticModuli A6/trace-and-degree-on-a-subfield (10.24) the roots of P_α are among them.

Acceptance checks:

- α = [n] on any A: [n]†[n] = n², and P_{[n]} = (X − n)^{2g} has roots of absolute value n.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Lemma 1.3, p. 77; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Lemma 1.3, p. 77.

Declaration id: `DeligneWeightsAndPurity:DWP.1/absolute-values-from-the-rosati-involution`.

<a id="dwp-1-weil-estimate-for-abelian-varieties"></a>

### The Weil estimate for abelian varieties over 𝔽_q

Let A be an abelian variety of dimension g over 𝔽_q. Every root of the characteristic polynomial P_{π_A} ∈ ℤ[X] is a Weil q-number of weight 1: all its complex conjugates have absolute value q^{1/2}. Equivalently, for every ℓ ∤ q, the geometric Frobenius on H¹(A_{𝔽̄_q}, ℚ_ℓ) is pure of weight 1, and the geometric Frobenius on V_ℓA is pure of weight −1. The same holds for π_A^m relative to q^m.

Hypotheses and scope:

- This is the independent abelian-variety proof that RS-17 keeps for DWP.1. It uses the polarization, Rosati positivity and π†π = q. It depends on no Tate isogeny theorem and nothing from DWP.4.
- The statement on H¹ and V_ℓA uses the comparison of the Frobenius conventions: π_A acts on V_ℓA as the arithmetic Frobenius, and on H¹ = (V_ℓA)^∨ the geometric Frobenius has characteristic polynomial P_{π_A} (ArithmeticGaloisRepresentations R01.6; AbelianSchemesAndArithmeticModuli A4).

Atlas landmark: **Weil estimate for abelian varieties**.

Proof or construction:

1. π†π = q (theorem rosati-of-the-frobenius-endomorphism).
2. Theorem absolute-values-from-the-rosati-involution with α = π and r = q: every complex root of P_π has absolute value q^{1/2}. P_π ∈ ℤ[X], so the roots are algebraic and every conjugate is again a root, so they are Weil q-numbers of weight 1 (DWP.0/weil-q-number).
3. On V_ℓA the characteristic polynomial of π is P_π (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-on-tate-module). The geometric Frobenius acts by π⁻¹ on V_ℓA, of weight −1, and by the transpose of π on H¹, of weight 1.
4. Base extension: π_{A ⊗ 𝔽_{q^m}} = π^m, with roots a_i^m (DWP.0/weil-number-base-extension).

Acceptance checks:

- E: y² = x³ − x over 𝔽_3: P_π = X² + 3, with roots ±i√3 of absolute value √3.
- A supersingular elliptic curve over 𝔽_p with a = 0: roots ±i√p.

Direct inputs: [DWP.1/rosati-of-the-frobenius-endomorphism](#dwp-1-rosati-of-the-frobenius-endomorphism), [DWP.1/absolute-values-from-the-rosati-involution](#dwp-1-absolute-values-from-the-rosati-involution), `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension), `ArithmeticGaloisRepresentations:R01.6`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Theorem 1.1(b), p. 75; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Remark 1.4, p. 78.

Declaration id: `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`.

<a id="dwp-1-point-counts-of-abelian-varieties"></a>

### Point counts of abelian varieties over 𝔽_{q^m}, and their bounds

Let A be an abelian variety of dimension g over 𝔽_q with P_{π_A}(X) = ∏_{i=1}^{2g}(X − a_i). Then for all m ≥ 1, N_m = #A(𝔽_{q^m}) = deg(1 − π^m) = P_{π^m}(1) = ∏_i(1 − a_i^m), and |N_m − q^{mg}| ≤ 2g·q^{m(g−1/2)} + (2^{2g} − 2g − 1)·q^{m(g−1)}. The zeta function is Z(A, t) = ∏_{r=0}^{2g} P_r(t)^{(−1)^{r+1}}, where P_r(t) = ∏(1 − a_{i_1}⋯a_{i_r}t) over 1 ≤ i_1 < … < i_r ≤ 2g, the characteristic polynomial of π on ∧^r T_ℓA.

Hypotheses and scope:

- 1 − π^m is separable (its differential is +1) and étale, so its degree is the number of geometric points in its kernel, which is A(𝔽_{q^m}).
- The bound uses the Weil estimate. The leading term ∏ a_i = deg π = q^g is exact.

Proof or construction:

1. d(1−π^m)=1 at the origin, so 1−π^m is étale. Properness and a zero-dimensional kernel make it a finite surjective isogeny. Its geometric kernel is A(𝔽_(q^m)), with multiplicity one. Hence #A(𝔽_(q^m))=deg(1−π^m)=P_(π^m)(1), using the A6 isogeny degree and characteristic-polynomial contracts.
2. The eigenvalues of π^m are the a_i^m (DWP.0/spectra-of-polynomials-in-an-endomorphism), so P_{π^m}(1) = ∏(1 − a_i^m).
3. Expand ∏(1 − a_i^m): the term ∏a_i^m = q^{mg}; the 2g terms that are products of 2g − 1 roots have absolute value q^{m(g−1/2)}; the remaining 2^{2g} − 2g − 1 terms have absolute value at most q^{m(g−1)} (Weil estimate).
4. Zeta function: log Z = Σ N_m t^m/m with N_m = Σ_r (−1)^r Tr(π^m | ∧^r), and the eigenvalues of π on ∧^r T_ℓA are the r-fold products (DWP.0/eigenvalues-of-exterior-powers).

Acceptance checks:

- E: y² = x³ − x over 𝔽_3: N_1 = P_π(1) = 1 + 3 = 4, and |4 − 3| = 1 ≤ 2√3.
- g = 1: the bound reads |N_m − q^m| ≤ 2q^{m/2} + 1, that is Hasse's |N_m − q^m − 1| ≤ 2q^{m/2}, loosened by the constant term.

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), [DWP.1/frobenius-endomorphism-over-a-finite-field](#dwp-1-frobenius-endomorphism-over-a-finite-field), `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/eigenvalues-of-exterior-powers](#dwp-0-eigenvalues-of-exterior-powers).

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Theorem 1.1(a), p. 75; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78.

Declaration id: `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`.

<a id="dwp-1-weil-estimate-for-curves"></a>

### The Weil estimate for curves, through the Jacobian

Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, J its Jacobian, and P_{π_J}(X) = ∏(X − a_i). Then #C(𝔽_{q^m}) = 1 − Σ_i a_i^m + q^m for all m ≥ 1, the a_i are Weil q-numbers of weight 1, |#C(𝔽_{q^m}) − q^m − 1| ≤ 2g·q^{m/2}, and Z(C, t) = P_{π_J}^{rev}(t)/((1 − t)(1 − qt)) with P^{rev}(t) = ∏(1 − a_i t).

Hypotheses and scope:

- Geometric connectedness is needed. If C has components defined only over 𝔽_{q^d}, permuted by the Frobenius, the counts change: two conjugate copies of ℙ¹ over 𝔽_{q²} give #C(𝔽_{q^m}) = 0 for m odd and 2(q^m + 1) for m even. RS-17 keeps these component permutations.
- The fixed-point formula (Γ_α · Δ) = 1 − Tr(α′) + deg α is imported (RS-17: the curve and Jacobian trace comparison of TraceFormula Layer 8, requested from SchemeAndStackFoundations SF.2). The source's own proof of it has a step that the author marks "Needs fixing" (recorded in sourceIssues).

Atlas landmark: **Weil estimate for curves**.

Proof or construction:

1. Import the Abel–Jacobi morphism after choosing a geometric base point P, and its étale H¹ comparison. Frobenius need not fix P: f_P∘π_C and π_J∘f_P differ by a translation, whose action on H¹ is trivial. Thus the comparison on H¹ and on the Jacobian Tate module is Frobenius-equivariant. A rational base point is obtained after finite extension wherever the upstream pointed construction requires it; the base-point-free Jacobian descent is an explicit Part II contract.
2. Fixed points: #C(𝔽_q) = (Γ_{π_C} · Δ) = 1 − Tr(π_J) + deg π_C = 1 − Σ a_i + q (Milne III.11.2, imported).
3. Replace q by q^m: the Frobenius of C ⊗ 𝔽_{q^m} is π_C^m, and π_J^m has eigenvalues a_i^m.
4. The a_i are Weil q-numbers of weight 1 (theorem weil-estimate-for-abelian-varieties applied to J), which gives the bound.
5. Z(C, t) = exp(Σ N_m t^m/m) = ∏(1 − a_i t)/((1 − t)(1 − qt)).

Acceptance checks:

- ℙ¹ (g = 0): #ℙ¹(𝔽_{q^m}) = q^m + 1 and Z = 1/((1 − t)(1 − qt)).
- E: y² = x³ − x over 𝔽_3: 1 − (i√3 + (−i√3)) + 3 = 4 = #E(𝔽_3).

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights).

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Theorem 11.1, p. 118; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Corollary 11.4, p. 119.

Declaration id: `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`.

<a id="dwp-1-weights-of-the-cohomology-of-curves"></a>

### The weights of H⁰, H¹ and H² of a curve over 𝔽_q

Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, and ℓ ∤ q. Then H⁰(C_{𝔽̄_q}, ℚ_ℓ) = ℚ_ℓ is pure of weight 0, H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1) is pure of weight 2, and H¹(C_{𝔽̄_q}, ℚ_ℓ) ≅ H¹(J_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓJ)^∨ is pure of weight 1, with the geometric Frobenius having characteristic polynomial P_{π_J}. The same holds after any finite extension of 𝔽_q.

Hypotheses and scope:

- Geometric connectedness makes H⁰ one-dimensional. For a curve whose components are permuted by the Frobenius, H⁰ is a permutation representation, of weight 0 but not trivial.
- H¹(C) ≅ H¹(J) through the Abel–Jacobi map (Milne III.9.6), and H¹(J) ≅ (T_ℓJ)^∨ (AbelianSchemesAndArithmeticModuli A4). These are imported.

Proof or construction:

1. H⁰: C_{𝔽̄_q} is connected, so H⁰ = ℚ_ℓ with trivial Frobenius action, of weight 0.
2. H²: the trace map H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1), on which the geometric Frobenius acts by q, of weight 2 (DWP.0/twisting-by-rank-one-characters).
3. The étale Abel–Jacobi comparison H¹(J)≅H¹(C) is independent of the geometric base point, since translation acts trivially on H¹. Use the requested base-point-free descent or a finite extension and descent to obtain Frobenius equivariance. H¹(J)=(V_ℓJ)∨, and geometric Frobenius has characteristic polynomial P_{π_J}; its roots have weight 1 by the abelian-variety theorem.

Acceptance checks:

- ℙ¹: H⁰ = ℚ_ℓ (weight 0), H¹ = 0, H² = ℚ_ℓ(−1) (weight 2), and #ℙ¹(𝔽_q) = 1 + q.

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `ArithmeticGaloisRepresentations:R01.6`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Remark 11.5, p. 119; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §1 pp. 2–3; §7.1 p. 64.

Declaration id: `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`.

<a id="dwp-1-compatibility-with-the-hasse-bound"></a>

### Compatibility with the Hasse bound for elliptic curves

For an elliptic curve E over 𝔽_q with a = q + 1 − #E(𝔽_q) (the trace of Frobenius of Tau Ceti EllipticCurves Layer 3), P_{π_E}(X) = X² − aX + q, and the Weil estimate for abelian varieties (g = 1) gives |a| ≤ 2√q. This is the Hasse bound that Tau Ceti EllipticCurves Layer 3 proves independently. The two agree, and this node proves only the identification of the characteristic polynomials.

Hypotheses and scope:

- RS-17: a compatibility proof, not a second proof of Hasse. The Hasse theorem is imported from Tau Ceti EllipticCurves Layer 3.

Proof or construction:

1. P_π(1) = #E(𝔽_q) (theorem point-counts-of-abelian-varieties) and P_π(0) = deg π = q, so P_π = X² − aX + q with a = q + 1 − #E(𝔽_q).
2. The roots α, ᾱ have |α| = √q (Weil estimate), so |a| = |α + ᾱ| ≤ 2√q.
3. Tau Ceti EllipticCurves Layer 3 defines the trace of Frobenius through the same point count, so the two statements concern the same integer.

Acceptance checks:

- y² = x³ − x over 𝔽_3: a = 0. y² + y = x³ over 𝔽_2: #E(𝔽_2) = 3, a = 0, and P = X² + 2.

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), [DWP.1/point-counts-of-abelian-varieties](#dwp-1-point-counts-of-abelian-varieties), `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Theorem 11.1, p. 118.

Declaration id: `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`.

<a id="dwp-1-the-frobenius-and-points-over-extensions"></a>

### Compatibility of the Weil estimate with finite base extension

For A (resp. C) over 𝔽_q and m ≥ 1, the Frobenius of A ⊗ 𝔽_{q^m} over 𝔽_{q^m} is π_A^m, P_{π^m}(X) = ∏(X − a_i^m), and the Weil estimate over 𝔽_{q^m} (weight 1 relative to q^m) is equivalent to that over 𝔽_q (weight 1 relative to q). The same holds for the weights of H⁰, H¹ and H² of curves.

Hypotheses and scope:

- RS-17 keeps compatibility under finite base extension as a review correction. The base-change isomorphism of étale cohomology is imported.

Proof or construction:

1. The Frobenius of V ⊗ 𝔽_{q^m} is π_V^m (node frobenius-endomorphism-over-a-finite-field).
2. The eigenvalues of π^m are the a_i^m, and weights relative to q^m of the a_i^m equal weights relative to q of the a_i (DWP.0/weil-number-base-extension, DWP.0/finite-field-base-extension-of-weights).

Acceptance checks:

- E over 𝔽_3 with P_π = X² + 3: over 𝔽_9, P_{π²} = (X + 3)², with roots −3 of absolute value 3 = 9^{1/2}.

Direct inputs: [DWP.1/frobenius-endomorphism-over-a-finite-field](#dwp-1-frobenius-endomorphism-over-a-finite-field), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension).

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76.

Declaration id: `DeligneWeightsAndPurity:DWP.1/the-frobenius-and-points-over-extensions`.

## DWP.2 — The fundamental symplectic estimate

Open symplectic monodromy, a nondegenerate alternating pairing and rational local polynomials are explicit hypotheses. Positive even tensor powers give the estimate through their invariant and coinvariant spaces. The power-series pole argument here remains distinct from an upstream Dirichlet-series abscissa theorem.

<a id="dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves"></a>

### The Weil I curve coefficient interface

On an open U₀⊂ℙ¹ over 𝔽_q, specialize DWP.5’s common punctual purity predicate to a lisse ℚ_ℓ-sheaf ℱ₀: integer weight β means each closed-point stalk is pure β relative to q^(deg x). The local determinant and Euler product are the WC.1/SF.2 coefficient L-function, with local variable t^(deg x). Changing geometric stalk conjugates Frobenius and leaves its determinant unchanged; tensor weights add, dual weights negate, and the Tate line ℚ_ℓ(r) has weight −2r. This comparison fixes the inputs of Weil I §3 without defining a second purity predicate or L-function.

Hypotheses and scope:

- This is Weil I (3.1): all complex conjugates of the Frobenius eigenvalues, that is, Weil q_x-numbers. DWP.5 generalizes it to Weil II's pointwise purity on schemes of finite type and to real ι-weights, and must identify its predicate with this one on open subsets of ℙ¹.
- F₀ has a fixed ℚ_ℓ-model, as RS-17 keeps. ℚ̄_ℓ enters only through the eigenvalues.
- The geometric Frobenius is used (DWP.0 conventions).

Atlas landmark: **Weight of a lisse sheaf on a curve**.

Proof or construction:

1. Use the common closed-stalk definition and geometric-Frobenius convention. Coefficient-extension invariance identifies the ℚ_ℓ model with its algebraic closure.
2. Import local characteristic-polynomial conjugacy invariance and the Euler determinant formula from WC.1/SF.2. Apply the numeric tensor, dual and Tate identities to the stalks.

Acceptance checks:

- ℚ_ℓ(1) on 𝔾_m has weight −2, and Z(𝔾_m, ℚ_ℓ(1), t) = Z(𝔾_m, ℚ_ℓ, t/q) = (1 − t/q)/(1 − t).
- ℚ_ℓ(r) on U₀ has weight −2r: F_x acts by q_x^{−r}.
- The constant sheaf ℚ_ℓ has weight 0, and the zero sheaf has every weight.
- For q = p odd, the geometrically constant rank-one sheaf on which F_x acts by 2^{deg x} has no weight, since 2 = p^{β/2} has no integer solution β. It is ι-pure of the real weight 2 log_p 2.
- Z(𝔸¹, ℚ_ℓ, t) = 1/(1 − qt).

Direct inputs: [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `WeilConjectures:WC.1`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.1), p. 284; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.1), p. 283.

Declaration id: `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`.

<a id="dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense"></a>

### Open subgroups of Sp(V)(ℚ_ℓ) are Zariski-dense

Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ, and H ⊆ Sp(V, ψ)(ℚ_ℓ) a subgroup open for the ℓ-adic topology. Then H is Zariski-dense in the algebraic group Sp(V, ψ). Consequently, for every algebraic representation W of Sp(V, ψ), such as ⊗^m V, the H-invariants and H-coinvariants of W are the Sp(V, ψ)-invariants and Sp(V, ψ)-coinvariants.

Hypotheses and scope:

- Openness is for the ℓ-adic topology. RS-17 keeps it as the hypothesis of Theorem 3.2, rather than any weaker density statement.
- Connectedness of Sp is essential. An open subgroup of O(V)(ℚ_ℓ) contains an open neighborhood in SO(V), so its closure contains SO(V), but need not contain all components: SO(V)(ℚ_ℓ) itself is an open counterexample to full O-density.

Proof or construction:

1. The Zariski closure Ĥ of H is an algebraic subgroup of Sp(V). Its ℚ_ℓ-points contain the open subgroup H, so its Lie algebra is sp(V) and dim Ĥ = dim Sp(V) (ReductiveGroups Layers 2–3).
2. Sp(V) is connected, so Ĥ = Sp(V).
3. A vector or functional fixed by H is fixed by its Zariski closure, because the action is algebraic.

Acceptance checks:

- Sp_{2g}(ℤ_ℓ) is open in Sp_{2g}(ℚ_ℓ) and Zariski-dense.
- A finite subgroup of Sp(V)(ℚ_ℓ) is neither open nor Zariski-dense when dim V > 0.

Direct inputs: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285.

Declaration id: `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`.

<a id="dwp-2-symplectic-coinvariants-of-even-tensor-powers"></a>

### Coinvariants of ⊗^{2k}V under the symplectic group, over ℚ_ℓ

Let V be a ℚ_ℓ-vector space of dimension 2r ≥ 2 with a nondegenerate alternating form ψ : V ⊗ V → L, where L is one-dimensional (L = ℚ_ℓ(−β)). For a partition P of {1, …, 2k} into pairs {a_i, b_i} with a_i < b_i, let ψ_P : ⊗^{2k}V → L^{⊗k}, v₁ ⊗ … ⊗ v_{2k} ↦ ∏_i ψ(v_{a_i}, v_{b_i}). The ψ_P span the Sp(V, ψ)-invariant maps ⊗^{2k}V → L^{⊗k}. For a suitable subset 𝒫′ of the pair partitions, depending on dim V and k, the ψ_P with P ∈ 𝒫′ induce an isomorphism (⊗^{2k}V)_{Sp(V, ψ)} ≅ (L^{⊗k})^N with N = #𝒫′ ≥ 1. The isomorphism is compatible with every automorphism of V that multiplies ψ by a scalar, acting on L by that scalar.

Hypotheses and scope:

- Over ℂ this is Weyl's first fundamental theorem for Sp (Brauer algebra), imported from Tau Ceti SchurWeyl Layer 9.
- The passage to ℚ_ℓ is proved here, as RS-17 requires: the group Sp and the representation ⊗^{2k}V are defined over ℚ, and invariants of an algebraic group under flat base change of fields commute with extension of scalars. No statement about ℓ-adically open subgroups is transferred by extension of scalars.
- For dim V ≥ 2k all (2k − 1)!! pair partitions are independent. For smaller V the ψ_P are dependent.

Proof or construction:

1. Over ℂ: the Sp-invariant multilinear forms on V^{2k} are spanned by the ψ_P (SchurWeyl Layer 9).
2. Descent to ℚ: choose a symplectic basis defined over ℚ. The invariants of Sp_{2r} over ℚ on (⊗^{2k}ℚ^{2r})^∨ span the complex invariants after ⊗ ℂ, since invariants commute with flat base change. So the ψ_P span over ℚ.
3. Base change to ℚ_ℓ, by the same argument.
4. Coinvariants are dual to the invariants of the dual representation, so choosing a basis 𝒫′ of the span gives the isomorphism, with N = dimension of the invariants.

Acceptance checks:

- dim V = 2, k = 1: (V ⊗ V)_{Sp} ≅ L through ψ, N = 1.
- dim V = 2, k = 2: the invariants of SL₂ on ⊗⁴V have dimension 2 (the Catalan number C₂), while there are 3 pair partitions. The three ψ_P are dependent, and N = 2.

Direct inputs: `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285.

Declaration id: `DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers`.

<a id="dwp-2-compact-cohomology-of-even-tensor-powers"></a>

### Compact cohomology and the L-function of ⊗^{2k}F

Under the hypotheses of Theorem 3.2, with U affine and F₀ ≠ 0: H⁰_c(U, ⊗^{2k}F) = 0, H²_c(U, ⊗^{2k}F) ≅ ℚ_ℓ(−kβ − 1)^N with N ≥ 1 as Frobenius modules, and Z(U₀, ⊗^{2k}F₀, t) = det(1 − F^*t, H¹_c(U, ⊗^{2k}F)) / (1 − q^{kβ+1}t)^N. So Z(U₀, ⊗^{2k}F₀, t) is the Taylor expansion of a rational function whose only poles are at t = q^{−kβ−1}.

Hypotheses and scope:

- U affine: shrinking U₀ changes neither the hypotheses nor the conclusion of Theorem 3.2.
- Weil I (2.10) (H⁰_c = 0 on an affine curve; H²_c = coinvariants(−1)) is requested from EtaleDualityAndPerverseSheaves EDC.2. The trace formula (1.14.3) is requested from SchemeAndStackFoundations SF.2, which carries the CohomologicalPointCounting trace formula that RS-17 names.
- Only the absolute value of the pole, |q^{−kβ−1}|, is used afterwards.

Proof or construction:

1. H⁰_c(U, G) = 0 for a lisse G on the affine curve U (Weil I (2.10)(i), EDC.2).
2. H²_c(U, G) = (G_ū)_{π₁(U, ū)}(−1) (Weil I (2.10)(ii), EDC.2), for G = ⊗^{2k}F.
3. The geometric monodromy is open in Sp, so its coinvariants are the Sp-coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). These are ℚ_ℓ(−kβ)^N (theorem symplectic-coinvariants-of-even-tensor-powers), Frobenius-equivariantly because ψ is a morphism of sheaves into ℚ_ℓ(−β).
4. Trace formula (1.14.3), requested from SF.2: Z = ∏_i det(1 − F^*t, H^i_c)^{(−1)^{i+1}}, and F^* = q^{kβ+1} on H²_c = ℚ_ℓ(−kβ − 1)^N.

Acceptance checks:

- For F₀ the first cohomology of a family of elliptic curves with non-constant j (weight 1, rank 2, ψ the Weil pairing into ℚ_ℓ(−1)) and k = 1: H²_c(U, ⊗²F) ≅ ℚ_ℓ(−2), N = 1, with a pole at t = q^{−2}.

Direct inputs: [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense), [DWP.2/symplectic-coinvariants-of-even-tensor-powers](#dwp-2-symplectic-coinvariants-of-even-tensor-powers), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, Scholie (2.10), p. 282.

Declaration id: `DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers`.

<a id="dwp-2-positivity-of-even-tensor-power-traces"></a>

### Lemma 3.3: nonnegative rational log-derivatives of even tensor powers

Under hypothesis (iii) of Theorem 3.2, for every even integer 2k and every x ∈ |U₀|, the power series t (d/dt) log det(1 − F_x t, ⊗^{2k}F₀)⁻¹ has nonnegative rational coefficients.

Hypotheses and scope:

- Deligne's "positifs" means nonnegative.

Proof or construction:

1. By (iii), det(1 − F_x t, F₀) ∈ ℚ[t], so Tr(F_x^n, F₀) ∈ ℚ for all n (DWP.0/characteristic-power-series-and-traces).
2. Tr(F_x^n, ⊗^{2k}F₀) = Tr(F_x^n, F₀)^{2k} (mathlib:LinearMap.trace_tensorProduct' iterated), a nonnegative rational number.
3. Apply Weil I (1.5.3), the identity (ii) of DWP.0/characteristic-power-series-and-traces.

Acceptance checks:

- F_x with eigenvalues ±i√q and 2k = 2: Tr(F_x^n) is 0 for odd n and ±2q^{n/2} for even n. The negative sign occurs for n ≡ 2 mod 4, but the squares 4q^n are nonnegative.

Direct inputs: [DWP.0/characteristic-power-series-and-traces](#dwp-0-characteristic-power-series-and-traces), `mathlib:LinearMap.trace_tensorProduct'`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.3), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/positivity-of-even-tensor-power-traces`.

<a id="dwp-2-positive-local-factors"></a>

### Lemma 3.4: local factors of even tensor powers have nonnegative coefficients

Under hypothesis (iii) of Theorem 3.2, for every even 2k and x ∈ |U₀|, the local factor det(1 − F_x t^{deg x}, ⊗^{2k}F₀)⁻¹ ∈ ℚ[[t]] has constant term 1 and nonnegative coefficients.

Hypotheses and scope:

- Substituting t^{deg x} for t preserves nonnegativity.

Proof or construction:

1. log det(1 − F_x t, ⊗^{2k}F₀)⁻¹ has no constant term and nonnegative coefficients (lemma positivity-of-even-tensor-power-traces, divided termwise by n).
2. The exponential of a power series with nonnegative coefficients and no constant term has nonnegative coefficients.
3. Substitute t^{deg x}.

Acceptance checks:

- For F₀ = ℚ_ℓ(−1) and 2k = 2: the local factor is 1/(1 − q_x² t^{deg x}) = Σ q_x^{2m} t^{m deg x}.

Direct inputs: [DWP.2/positivity-of-even-tensor-power-traces](#dwp-2-positivity-of-even-tensor-power-traces).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.4), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/positive-local-factors`.

<a id="dwp-2-radius-of-convergence-of-positive-products"></a>

### Lemma 3.5: factors of a product of positive power series converge at least as far

Let (f_i) be a countable family of power series f_i = Σ_n a_{i,n} t^n with constant term 1 and nonnegative real coefficients, such that ord(f_i − 1) → ∞, and let f = ∏_i f_i = Σ_n a_n t^n. Then a_{i,n} ≤ a_n for all i and n. Hence the radius of absolute convergence of each f_i is at least that of f.

Hypotheses and scope:

- Nonnegativity of all coefficients is essential; without it cancellation can make f converge further than a factor.

Proof or construction:

1. Expanding the product, each coefficient a_n is a sum of nonnegative terms, one of which is a_{i,n}·1·1⋯.
2. Comparison of power series with nonnegative coefficients gives the radii.

Acceptance checks:

- f₁ = 1/(1 − t) and f₂ = 1/(1 − t²): f = f₁f₂ has radius 1, and so do f₁ and f₂.
- Without positivity: (1 − t) · 1/(1 − t) = 1 has infinite radius, while the second factor has radius 1.

Direct inputs: none.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.5), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products`.

<a id="dwp-2-poles-of-positive-products"></a>

### Lemma 3.6: poles of the factors lie no closer than the poles of the product

Under the hypotheses of Lemma 3.5, if f and all the f_i are Taylor expansions at 0 of meromorphic functions on ℂ, then inf{|z| : f_i has a pole at z} ≥ inf{|z| : f has a pole at z}.

Hypotheses and scope:

- The functions used (local factors and the L-function of ⊗^{2k}F₀) are rational, hence meromorphic.

Proof or construction:

1. For a function meromorphic on ℂ and holomorphic at 0, the radius of convergence of its Taylor series at 0 is the modulus of its nearest pole. The Taylor series converges on the largest disc of holomorphy, and cannot converge beyond a pole.
2. Apply Lemma 3.5.

Acceptance checks:

- f₁ = 1/(1 − 2t) and f₂ = 1/(1 − t): the product f = f₁f₂ has its nearest pole at 1/2, and the pole of f₂ at 1 lies further out, as the lemma requires.

Direct inputs: [DWP.2/radius-of-convergence-of-positive-products](#dwp-2-radius-of-convergence-of-positive-products).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.6), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/poles-of-positive-products`.

<a id="dwp-2-fundamental-estimate-theorem-3-2"></a>

### Weil I, Theorem 3.2: the fundamental estimate

Let U₀ ⊆ ℙ¹ over 𝔽_q be open, F₀ a lisse ℚ_ℓ-sheaf on U₀, and β ∈ ℤ. Assume (i) F₀ carries a nondegenerate alternating pairing ψ : F₀ ⊗ F₀ → ℚ_ℓ(−β); (ii) the image of the geometric fundamental group π₁(U, ū) in GL(F_ū) is an open subgroup of Sp(F_ū, ψ); (iii) for every x ∈ |U₀|, det(1 − F_x t, F₀) has rational coefficients. Then F₀ has weight β: every eigenvalue of every F_x is an algebraic number all of whose complex conjugates have absolute value q_x^{β/2}.

Hypotheses and scope:

- (ii) is openness for the ℓ-adic topology in the symplectic group of ψ, as RS-17 keeps it.
- (iii) is rationality of the Frobenius polynomials of the fixed ℚ_ℓ-sheaf.
- One may assume U affine and F₀ ≠ 0.
- No purity of cohomology is assumed: the estimate is proved directly from positivity and the poles of the L-function of the even tensor powers.

Atlas landmark: **Fundamental estimate**.

Proof or construction:

1. Reduce to U affine and F₀ ≠ 0.
2. Fix x of degree d and an eigenvalue α of F_x on F₀. By (iii), α is algebraic and every complex conjugate of α is again an eigenvalue. α^{2k} is an eigenvalue of F_x on ⊗^{2k}F₀ (DWP.0/spectra-of-tensor-products-and-duals). So the local factor det(1 − F_x t^d, ⊗^{2k}F₀)⁻¹ has a pole at every t with t^d = α^{−2k}.
3. That local factor is one factor of Z(U₀, ⊗^{2k}F₀, t) = ∏_y (local factor at y). All the factors have nonnegative coefficients (lemma positive-local-factors), and Z is rational with poles only at q^{−kβ−1} (theorem compact-cohomology-of-even-tensor-powers). Lemma poles-of-positive-products gives |α|^{−2k/d} ≥ q^{−kβ−1}, that is, |α| ≤ q_x^{β/2 + 1/(2k)}.
4. Letting k → ∞ gives |α| ≤ q_x^{β/2}.
5. ψ is Frobenius-equivariant with values in ℚ_ℓ(−β), on which F_x acts by q_x^β. So q_x^β/α is also an eigenvalue (DWP.0/reciprocal-pairing-of-eigenvalues with c = q_x^β), and the previous step applied to it gives |α| ≥ q_x^{β/2}. The same argument applies to every complex conjugate of α.

Acceptance checks:

- The first cohomology of a family of elliptic curves over an open subset of ℙ¹ with non-constant j has weight 1, carries the Weil pairing, has monodromy open in SL₂ = Sp₂, and has rational Frobenius polynomials. Theorem 3.2 gives |a_x| ≤ 2√q_x at every fibre, compatibly with the Hasse bound of Tau Ceti EllipticCurves Layer 3.

Direct inputs: [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/compact-cohomology-of-even-tensor-powers](#dwp-2-compact-cohomology-of-even-tensor-powers), [DWP.2/positive-local-factors](#dwp-2-positive-local-factors), [DWP.2/poles-of-positive-products](#dwp-2-poles-of-positive-products), [DWP.0/reciprocal-pairing-of-eigenvalues](#dwp-0-reciprocal-pairing-of-eigenvalues), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/weil-q-number](#dwp-0-weil-q-number).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Théorème (3.2), p. 284; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Théorème (3.2), p. 284; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, proof of (3.2), p. 285.

Declaration id: `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`.

<a id="dwp-2-coarse-bound-on-compact-cohomology"></a>

### Corollary 3.8: the coarse bound on H¹_c(U, F)

Under the hypotheses of Theorem 3.2, with U affine, every eigenvalue α of F^* on H¹_c(U, F) is an algebraic number, and every complex conjugate of α satisfies |α| ≤ q^{β/2 + 1}.

Hypotheses and scope:

- This is an upper bound for H¹_c, not purity. Sharp curve-coefficient purity is DWP.6.

Proof or construction:

1. H⁰_c(U, F) = 0 (U affine), and H²_c(U, F) = (F_ū)_{π₁}(−1) = 0, since the standard representation of Sp has no coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). So by (1.14.3), Z(U₀, F₀, t) = det(1 − F^*t, H¹_c(U, F)).
2. The left side has rational coefficients by its product expansion and (iii). So the polynomial on the right has rational coefficients, 1/α is a root, α is algebraic, and its conjugates are also eigenvalues.
3. With N=rank ℱ and |α_(x,j)|=q_x^(β/2), choose |t|=q^(−β/2−1−ε). Because U₀⊂ℙ¹, the number of its degree-e closed points is at most #ℙ¹(𝔽_(q^e))=q^e+1. Hence Σ_(x,j)|α_(x,j)t^(deg x)|≤N Σ_(e≥1)(q^e+1)q^(−e(1+ε))=N[Σ q^(−eε)+Σ q^(−e(1+ε))]<∞. Both geometric series are required for the original open of ℙ¹.
4. An absolutely convergent product of nonzero factors has no zero, so |1/α| ≥ q^{−β/2−1}.

Acceptance checks:

- β = 1 (a family of elliptic curves): every eigenvalue on H¹_c(U, F) satisfies |α| ≤ q^{3/2}.

Direct inputs: [DWP.2/fundamental-estimate-theorem-3-2](#dwp-2-fundamental-estimate-theorem-3-2), [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.8), p. 286.

Declaration id: `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology`.

<a id="dwp-2-coarse-bound-on-cohomology-of-the-projective-line"></a>

### Corollary 3.9: the two-sided coarse bound on H¹(ℙ¹, j_*F)

Let j : U → ℙ¹ be the inclusion. Under the hypotheses of Theorem 3.2, every eigenvalue α of F^* on H¹(ℙ¹, j_*F) is an algebraic number, and every complex conjugate of α satisfies q^{β/2} ≤ |α| ≤ q^{β/2 + 1}; in Deligne's notation q^{(β+1)/2 − 1/2} ≤ |α| ≤ q^{(β+1)/2 + 1/2}.

Hypotheses and scope:

- Poincaré duality (2.12) for j_*F on ℙ¹ is requested from EtaleDualityAndPerverseSheaves EDC.2.

Proof or construction:

1. The exact sequence 0 → j_!F → j_*F → j_*F/j_!F → 0 has a punctual third term, so H¹_c(U, F) → H¹(ℙ¹, j_*F) is surjective. Every α is therefore an eigenvalue on H¹_c(U, F), and Corollary 3.8 gives |α| ≤ q^{β/2+1}.
2. Poincaré duality (2.12) pairs H¹(ℙ¹, j_*F) with H¹(ℙ¹, j_*F^∨(1)) into ℚ_ℓ, and ψ identifies F^∨ with F(β). So q^{β+1}/α is an eigenvalue (DWP.0/reciprocal-pairing-of-eigenvalues), and |q^{β+1}α⁻¹| ≤ q^{β/2+1} gives |α| ≥ q^{β/2}.

Acceptance checks:

- β = 1: every eigenvalue on H¹(ℙ¹, j_*F) satisfies q^{1/2} ≤ |α| ≤ q^{3/2}. Purity (|α| = q) is DWP.4's sharpening.

Direct inputs: [DWP.2/coarse-bound-on-compact-cohomology](#dwp-2-coarse-bound-on-compact-cohomology), [DWP.0/reciprocal-pairing-of-eigenvalues](#dwp-0-reciprocal-pairing-of-eigenvalues), `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.9), p. 286; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.9), p. 287.

Declaration id: `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line`.

## DWP.3 — Rational local factors of a pencil

Keep the vanishing system, its radical and its quotient separate. Exceptional spectra are Haar-null in each arithmetic degree fibre; continuous conditional masses and degree-qualified finite-quotient Chebotarev give the uniform density bound needed for local rationality.

<a id="dwp-3-radical-quotient-of-the-vanishing-system"></a>

### Arithmetic descent of the pencil radical quotient

For a finite-field Lefschetz pencil on a geometrically connected smooth projective even-dimensional variety, the LPV.4 vanishing system ℰ and its radical quotient ℱ=ℰ/(ℰ∩ℰ⊥) descend to lisse ℚ_ℓ-sheaves ℰ₀ and ℱ₀ over the smooth-parameter open U₀. The supplied perfect alternating pairing on ℱ₀ has values in ℚ_ℓ(−d), with d odd the fixed fibre dimension, so a local geometric Frobenius of degree e acts by a symplectic similitude with multiplier q^(de). The zero quotient is permitted. LPV.4 owns the construction and perfection of the quotient; this node supplies its finite-field descent and arithmetic normalization.

Hypotheses and scope:

- Use the actual LPV.3 pencil and LPV.4 quotient with their fixed ℚ_ℓ model. No replacement of fibre dimension d by point degree e is permitted.

Atlas landmark: **Arithmetic pencil descent**.

Proof or construction:

1. Import the LPV.4 quotient and pairing. Arithmetic Frobenius permutes the vanishing cycles, preserving their span and its radical; the lisse fibre/representation descent equivalence supplies ℰ₀ and ℱ₀.
2. The Frobenius-equivariant cup-product pairing takes values in ℚ_ℓ(−d). Geometric Frobenius acts there by q^(de), giving the multiplier.
3. If the quotient is zero, its local polynomial is 1 and the rationality/purity statements are vacuous; the dimension induction still retains the radical and constant pieces.

Acceptance checks:

- A Lefschetz pencil of plane cubics (X = ℙ², n = 1): ℰ = H¹ of the fibres, ℰ ∩ ℰ^⊥ = 0, and ℱ₀ is the rank-2 sheaf with its Weil pairing into ℚ_ℓ(−1).
- For a pencil of plane cubics, ℱ₀ has rank 2 and ψ is the Weil pairing.
- If ℰ ⊆ ℰ^⊥, then ℱ₀ = 0 and Theorem 6.2 holds trivially.
- ψ need not be perfect on ℰ itself when ℰ ∩ ℰ^⊥ ≠ 0; only the quotient carries a perfect pairing.
- rank ℱ₀ is even, since ℱ₀ carries a perfect alternating pairing.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295.

Declaration id: `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`.

<a id="dwp-3-geometrically-constant-lisse-sheaves"></a>

### Weil I Lemma 6.4: geometrically constant lisse sheaves come from 𝔽_q

Let U₀ be geometrically connected over 𝔽_q and let 𝒢₀ be a lisse ℚ_ℓ-sheaf on U₀ whose pullback 𝒢 to U is constant. Then there are ℓ-adic units α_i ∈ ℚ̄_ℓ with det(1 − F_x t^{deg x}, 𝒢₀) = ∏_i(1 − α_i^{deg x} t^{deg x}) for every x ∈ |U₀|. In fact 𝒢₀ is the pullback of its direct image to Spec 𝔽_q, a representation G₀ of Gal(𝔽̄_q/𝔽_q), and ∏(1 − α_i t) = det(1 − F t, G₀).

Hypotheses and scope:

- The α_i are ℓ-adic units because Gal(𝔽̄_q/𝔽_q) is compact.
- The lemma applies to R^i f_*ℚ_ℓ for i ≠ n, to R^n f_*ℚ_ℓ/ℰ₀ and to ℰ₀ ∩ ℰ₀^⊥, which are geometrically constant for a Lefschetz pencil (LefschetzPencilsAndVanishingCycles LPV.4).

Proof or construction:

1. 𝒢₀ corresponds to a representation of π₁(U₀, u) trivial on π₁(U, u), so it factors through π₁(U₀)/π₁(U) = Gal(𝔽̄_q/𝔽_q).
2. The Frobenius at x maps to F^{deg x} in Gal(𝔽̄_q/𝔽_q), so its eigenvalues are the α_i^{deg x} (DWP.0/finite-field-base-extension-of-weights).

Acceptance checks:

- The Tate twist ℚ_ℓ(−1) on U₀: α = q, and det(1 − F_x t^{deg x}) = 1 − q^{deg x} t^{deg x}.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.4`, [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Lemme (6.4), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.4), p. 296.

Declaration id: `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`.

<a id="dwp-3-zeta-of-the-fibres-and-the-pencil-factorization"></a>

### The zeta functions of the fibres, split into a constant part and the ℱ₀ part

In the setting of radical-quotient-of-the-vanishing-system, there are ℓ-adic units α_1, …, α_N and β_1, …, β_M in ℚ̄_ℓ, with α_i ≠ β_j for all i and j, such that for every x ∈ |U₀|, Z(X_x, t) = [∏_i(1 − α_i^{deg x} t) / ∏_j(1 − β_j^{deg x} t)] · det(1 − F_x t, ℱ₀)^{(−1)^{n+1}}, where t is the variable for the residue field k(x). In particular the right-hand side lies in ℚ(t).

Hypotheses and scope:

- Z(X_x, t) ∈ ℚ(t) is the rationality of the zeta function over ℚ (WeilConjectures WC.1). The cohomological formula is Weil I (1.5.4), requested from SchemeAndStackFoundations SF.2.
- Common α_i = β_j can be cancelled, so they may be assumed distinct. This is the finite eigenvalue family bookkeeping RS-17 asks for, with no appeal to purity.
- No Riemann hypothesis is used: the α and β are arbitrary ℓ-adic units.

Proof or construction:

1. For x ∈ |U₀|, the fibre X_x is smooth projective over k(x), and H^i(X_x̄) is the stalk of R^i f_*ℚ_ℓ at a geometric point over x (proper base change, SF.2).
2. (1.5.4) over k(x): Z(X_x, t) = ∏_i det(1 − F_x t, R^i f_*ℚ_ℓ)^{(−1)^{i+1}}.
3. Filter R^n by ℰ ∩ ℰ^⊥ ⊆ ℰ ⊆ R^n: the factor splits as det(on R^n/ℰ)·det(on ℰ ∩ ℰ^⊥)·det(on ℱ₀) (DWP.0/characteristic-polynomial-in-short-exact-sequences).
4. Lemma geometrically-constant-lisse-sheaves on R^i (i ≠ n), R^n/ℰ₀ and ℰ₀ ∩ ℰ₀^⊥ gives the α and β factors. Cancel common values.
5. Z(X_x, t) ∈ ℚ(t) (WC.1).

Acceptance checks:

- A pencil of plane cubics (n = 1): Z(X_x, t) = det(1 − F_x t, ℱ₀)/((1 − t)(1 − q_x t)). There are no α's, and β = (1, q), from H⁰ = ℚ_ℓ and H² = ℚ_ℓ(−1).

Direct inputs: [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), [DWP.0/characteristic-polynomial-in-short-exact-sequences](#dwp-0-characteristic-polynomial-in-short-exact-sequences), `WeilConjectures:WC.1`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.4), p. 296; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.4), p. 276.

Declaration id: `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`.

<a id="dwp-3-powers-of-a-family-determine-the-family"></a>

### Weil I Lemma 6.7: a family is determined by its n-th powers for enough n

Let K be a finite set of nonnegative integers different from 1, and (δ_j)_{j ≤ Q}, (ε_j)_{j ≤ Q} two families of elements of a field. If, for all sufficiently large n divisible by no element of K, the families (δ_j^n) and (ε_j^n) agree up to order, then (δ_j) and (ε_j) agree up to order.

Hypotheses and scope:

- K must exclude 1: every integer is divisible by 1.
- The families are finite and counted with multiplicity.

Proof or construction:

1. Induction on Q. For each j, the n with δ_0^n = ε_j^n form an ideal n_jℤ.
2. If δ_0 ≠ ε_j for all j, then all n_j ≠ 1, and there are arbitrarily large n divisible by no n_j and no element of K. Then δ_0^n ≠ ε_j^n for all j, contradicting the hypothesis. So δ_0 = ε_{j₀} for some j₀.
3. Remove δ_0 and ε_{j₀} and apply the induction hypothesis.

Acceptance checks:

- δ = (1, −1), ε = (−1, 1): equal. δ = (ζ₃), ε = (1): the cubes agree, but for n not divisible by 3 they differ, and with K = {3} the hypothesis fails, as it should.

Direct inputs: none.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.7), p. 297.

Declaration id: `DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family`.

<a id="dwp-3-open-image-in-the-symplectic-similitude-group"></a>

### Weil I Lemma 6.11: the arithmetic monodromy of ℱ₀ is open in H

Let d be the fixed odd pencil fibre dimension and ℱ₀≠0 its supplied radical quotient with pairing into ℚ_ℓ(−d). Use the arithmetic coordinate a∈ℤ̂, where geometric Frobenius of a degree-e point has a=−e. In a fixed finite ℓ-adic coefficient model define H={(a,g)∈ℤ̂×GSp(ℱ,ψ): μ(g)=q^(−da)}. Then (arithmetic degree,ρ):π₁(U₀)→H has open image H₁, compact because π₁(U₀) is profinite. Its degree-zero image is open in Sp for the ℓ-adic topology.

Hypotheses and scope:

- The openness of the geometric monodromy in Sp(ℱ, ψ) is Weil I (5.10), which LefschetzPencilsAndVanishingCycles LPV.5 owns: open symplectic monodromy for the fixed ℚ_ℓ model.
- ℱ₀ ≠ 0 is assumed. For ℱ₀ = 0 the statements are empty.

Proof or construction:

1. The pairing forces μ(ρ(σ))=q^(−da(σ)), so the map lands in H. In particular a(F_x)=−e gives multiplier q^(de).
2. The arithmetic exact sequence is surjective onto ℤ̂ for geometrically connected U₀. Its geometric kernel image is open in Sp by the fixed-model LPV.5 theorem. Therefore the total image is open in H; its compactness follows from profiniteness.

Acceptance checks:

- For plane cubics the geometric image is a compact open subgroup of Sp₂(ℚ_ℓ)=SL₂(ℚ_ℓ). At degree e its determinant is q^e, not q^(−e).

Direct inputs: [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.10), p. 297; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.10), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`.

<a id="dwp-3-haar-null-exceptional-eigenvalue-locus"></a>

### Weil I Lemma 6.12: the eigenvalue-δ^a locus is closed and Haar-null

For an ℓ-adic unit δ in the fixed finite coefficient field, the locus Z_δ={(a,g)∈H₁: δ^a is an eigenvalue of g} is closed and null in each arithmetic-degree fibre, hence Haar-null in H₁. For a bad geometric eigenvalue δ₀^e the arithmetic-degree locus uses δ=δ₀⁻¹, since a(F_x)=−e.

Hypotheses and scope:

- δ^a for a ∈ ℤ̂ is defined because δ is an ℓ-adic unit.
- This is the compact ℓ-adic Haar-null step that RS-17 asks DWP.3 to prove itself.
- ℱ ≠ 0 is needed: for ℱ = 0 there are no eigenvalues and Z_δ = ∅.

Proof or construction:

1. Closedness: (a, g) ↦ det(δ^a − g) is continuous, and Z_δ is its zero set.
2. At fixed arithmetic coordinate a, the similitude fibre has multiplier q^(−da) and is a translate of Sp. The determinant equation det(δ^a−g)=0 cuts out a proper algebraic subset: in a symplectic basis choose distinct nonzero diagonal parameters avoiding δ^a and its multiplier partner. An ℓ-adic analytic proper algebraic zero set has Haar measure zero in every compact open part of this fibre.
3. H₁ ∩ ({a} × Z_{δ,a}) is null in the fibre of H₁ over a, and Fubini for the projection H₁ → ℤ̂ gives measure 0.

Acceptance checks:

- ℱ of rank 2 and δ = 1: the set of g ∈ SL₂(ℤ_ℓ) with eigenvalue 1 (unipotent-type) is a proper analytic subset of measure 0.

Direct inputs: [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Lemme (6.12), p. 298; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.12), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus`.

<a id="dwp-3-exceptional-frobenius-set-has-density-zero"></a>

### The Frobenius elements landing in a Haar-null set have density zero

Let δ_1, …, δ_Q be ℓ-adic units. The set L of x ∈ |U₀| such that some δ_j^{deg x} is an eigenvalue of F_x on ℱ₀ has Dirichlet density 0. More precisely, the proportion of the closed points of degree n that lie in L tends to 0 as n → ∞. In particular, for every sufficiently large n there are closed points of degree n outside L.

Hypotheses and scope:

- The atlas's completion contract for DWP.3 splits this into two steps. The first is finite-quotient Chebotarev with constant-field degree congruences (imported from FunctionFieldArithmetic FA.5). The second is the approximation of the closed Haar-null set by open neighbourhoods of small measure, proved here. Topological density alone does not give density zero.

Proof or construction:

1. For Z=∪Z_(δ_j⁻¹) choose decreasing conjugation-invariant clopen neighborhoods C_m with intersection Z, from a cofinal family of open normal subgroups of the fixed compact ℓ-adic model H₁.
2. Conditional Haar mass a↦μ_a(C_m∩H₁,a) is a continuous locally constant function on ℤ̂: each C_m comes from a finite quotient. The functions decrease to zero at every a because the exceptional locus is null in every degree fibre. Compactness and Dini’s theorem give uniform convergence to zero; total Haar mass zero alone would not give this uniform statement.
3. For any ε choose one finite quotient with every fibre mass <ε. The requested finite-quotient Chebotarev theorem, with constant-field congruences and its per-degree error, bounds the exceptional fraction at degree e by ε+o(1). The finitely many degree residue classes make the error uniform.
4. Let ε tend to zero. Thus #L_e=o(q^e/e); since U₀ is a geometrically connected open of ℙ¹, its degree-e closed-point count is asymptotic to q^e/e, so every sufficiently large degree has a point outside L.

Acceptance checks:

- For the pencil of plane cubics and δ = 1: 1 is an eigenvalue of F_x on ℱ₀ = H¹(E_x) iff #E_x(k(x)) = det(1 − F_x | H¹) = 0. That is impossible, since E_x has a rational point, so L = ∅.

Direct inputs: [DWP.3/haar-null-exceptional-eigenvalue-locus](#dwp-3-haar-null-exceptional-eigenvalue-locus), [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group), `FunctionFieldArithmetic:FA.5`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.13), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`.

<a id="dwp-3-denominators-away-from-the-exceptional-set"></a>

### Weil I Proposition 6.6: the denominator of (6.6.1) away from K and L

Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units with γ_i ≠ δ_j. There are a finite set K of nonnegative integers different from 1 and a density-zero set L ⊂ |U₀| such that, for x ∉ L with deg x divisible by no element of K, the rational function det(1 − F_x t, ℱ₀)·∏_i(1 − γ_i^{deg x} t) / ∏_j(1 − δ_j^{deg x} t), written in lowest terms, has denominator ∏_j(1 − δ_j^{deg x} t).

Hypotheses and scope:

- The two exceptional sets are exactly where cancellation can happen: δ_j^{deg x} equal to some γ_i^{deg x} (controlled by K), or δ_j^{deg x} an eigenvalue of F_x (controlled by L).

Proof or construction:

1. For each i and j, the n with γ_i^n = δ_j^n form n_{ij}ℤ with n_{ij} ≠ 1 (since γ_i ≠ δ_j). Let K = {n_{ij}}.
2. L = the x with some δ_j^{deg x} an eigenvalue of F_x on ℱ₀, of density 0 (lemma exceptional-frobenius-set-has-density-zero).
3. For x ∉ L with deg x divisible by no element of K, no factor 1 − δ_j^{deg x}t of the denominator cancels against the numerator.

Acceptance checks:

- γ = ∅, δ = (q): the denominator is 1 − q^{deg x} t unless q^{deg x} is an eigenvalue of F_x, which happens only on a density-zero set.

Direct inputs: [DWP.3/exceptional-frobenius-set-has-density-zero](#dwp-3-exceptional-frobenius-set-has-density-zero), [DWP.3/powers-of-a-family-determine-the-family](#dwp-3-powers-of-a-family-determine-the-family).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Proposition (6.6), p. 296; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.13), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set`.

<a id="dwp-3-divisibility-criterion"></a>

### Weil I Proposition 6.8: an intrinsic characterisation of the γ-polynomial

Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units, R(t) = ∏(1 − γ_i t) and S(t) = ∏(1 − δ_j t). If, for every x ∈ |U₀|, ∏_j(1 − δ_j^{deg x} t) divides ∏_i(1 − γ_i^{deg x} t)·det(1 − F_x t, ℱ₀), then S(t) divides R(t). Consequently R(t) is the least common multiple of the S(t) satisfying this hypothesis, which characterises the γ-family intrinsically from the polynomials ∏(1 − γ_i^{deg x}t)·det(1 − F_x t, ℱ₀).

Hypotheses and scope:

- The divisibility is required for every x, but it is used only for x outside the exceptional sets of Proposition 6.6.

Proof or construction:

1. Cancel common pairs γ_i = δ_j until the families are disjoint.
2. Proposition 6.6: for x outside K and L the denominator of (6.6.1) is ∏(1 − δ_j^{deg x}t). But by hypothesis (6.6.1) is a polynomial, so no δ remains after cancellation: S divides R.

Acceptance checks:

- γ = (q, q), δ = (q): S | R. δ = (q²) with γ = (q): the hypothesis fails at a generic x.

Direct inputs: [DWP.3/denominators-away-from-the-exceptional-set](#dwp-3-denominators-away-from-the-exceptional-set).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Proposition (6.8), p. 297.

Declaration id: `DeligneWeightsAndPurity:DWP.3/divisibility-criterion`.

<a id="dwp-3-rationality-of-pencil-local-factors"></a>

### Weil I Theorem 6.2: the local factors of the radical quotient have rational coefficients

In the setting of radical-quotient-of-the-vanishing-system, for every x ∈ |U₀|, det(1 − F_x t, ℱ₀) ∈ ℚ[t].

Hypotheses and scope:

- No Riemann hypothesis, no purity and no semisimplicity is assumed. The proof uses only the rationality of the fibres' zeta functions, geometric constancy of the other pieces, open symplectic monodromy and Chebotarev.
- The statement holds trivially for ℱ₀ = 0.

Atlas landmark: **Rationality theorem (Weil I 6.2)**.

Proof or construction:

1. By the factorization theorem it suffices to show that ∏(1 − α_i t) and ∏(1 − β_j t) have rational coefficients, that is, that the α-family and the β-family are defined over ℚ (6.5).
2. With (γ, δ) = (α, β), the function (6.6.1) is Z(X_x, t) ∈ ℚ(t), since n is odd. By Proposition 6.6, for x ∉ L with deg x divisible by no element of K, the denominator of Z(X_x, t) in lowest terms is ∏(1 − β_j^{deg x}t). So the multiset (β_j^{deg x}) is stable under Gal(ℚ̄/ℚ), and each β_j is algebraic.
3. For σ ∈ Gal(ℚ̄/ℚ), the families (σβ_j) and (β_j) have the same n-th powers for every large n divisible by no element of K, because such n occur as degrees of points outside L (lemma exceptional-frobenius-set-has-density-zero). Lemma 6.7 gives (σβ_j) = (β_j), so ∏(1 − β_j t) ∈ ℚ[t] (6.9).
4. After the β-polynomial is rational, fix a closed point of positive degree e. The polynomial M_x(t)=Z(X_x,t)∏(1−β_j^e t)=∏(1−α_i^e t)det(1−F_x t,ℱ₀) lies in ℚ[t]. Every α_i^e is a reciprocal root of M_x, so every α_i is algebraic. This supplies algebraicity before applying Galois conjugation to the α-family.
5. The polynomials M_x are rational. Proposition 6.8 characterises ∏(1−α_i t) as the lcm of candidate S whose degree-e transforms divide every M_x. For any candidate, one positive-degree point forces each root scalar to be algebraic and an ℓ-adic unit, since M_x has only unit reciprocal roots. Therefore the unit requirement does not break Galois invariance of the intrinsic characterization: a conjugated candidate is again eligible. The α-polynomial is fixed by Gal(ℚ̄/ℚ), hence lies in ℚ[t].
6. Hence det(1 − F_x t, ℱ₀) = Z(X_x, t)·∏(1 − β_j^{deg x}t)/∏(1 − α_i^{deg x}t) ∈ ℚ(t), and being a polynomial it lies in ℚ[t].

Acceptance checks:

- Plane cubics: det(1 − F_x t, ℱ₀) = 1 − a_x t + q_x t², with a_x = q_x + 1 − #E_x(k(x)) ∈ ℤ.

Direct inputs: [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization), [DWP.3/denominators-away-from-the-exceptional-set](#dwp-3-denominators-away-from-the-exceptional-set), [DWP.3/divisibility-criterion](#dwp-3-divisibility-criterion), [DWP.3/powers-of-a-family-determine-the-family](#dwp-3-powers-of-a-family-determine-the-family).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Théorème (6.2), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.9), p. 297.

Declaration id: `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors`.

<a id="dwp-3-coarse-bound-for-the-pencil"></a>

### Weil I Corollary 6.3: the coarse bound on H¹(D, j_*ℱ)

Let j : U → D be the inclusion. Every eigenvalue α of F^* on H¹(D, j_*ℱ) is an algebraic number, and every complex conjugate satisfies q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

Hypotheses and scope:

- This is where DWP.3 meets DWP.2. ℱ₀ satisfies the hypotheses of Theorem 3.2 with β = n: the pairing ψ from radical-quotient-of-the-vanishing-system, open symplectic monodromy (Weil I (5.10), LPV.5), and rational local factors (Theorem 6.2).

Proof or construction:

1. Theorem 3.2's hypotheses hold for ℱ₀ with β = n (Weil I (5.10) and (6.2)).
2. Apply DWP.2/coarse-bound-on-cohomology-of-the-projective-line (Corollary 3.9) with β = n: q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

Acceptance checks:

- Plane cubics (n = 1): the eigenvalues on H¹(D, j_*ℱ) satisfy q^{1/2} ≤ |α| ≤ q^{3/2}.

Direct inputs: [DWP.3/rationality-of-pencil-local-factors](#dwp-3-rationality-of-pencil-local-factors), [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.2/fundamental-estimate-theorem-3-2](#dwp-2-fundamental-estimate-theorem-3-2), [DWP.2/coarse-bound-on-cohomology-of-the-projective-line](#dwp-2-coarse-bound-on-cohomology-of-the-projective-line), `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Corollaire (6.3), p. 295.

Declaration id: `DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil`.

## DWP.4 — Smooth projective purity by induction and powers

Even-dimensional induction first gives the half-unit interval. The outer Leray terms inherit that interval after a Tate twist; they are not assumed pure. Even Cartesian powers remove the error, and weak Lefschetz plus duality recover arbitrary degrees. All three vanishing-cycle cases survive the induction.

<a id="dwp-4-middle-cohomology-half-unit-bound"></a>

### The half-unit bound in even dimension

Let X₀ be smooth projective of pure even dimension d over 𝔽_q, ℓ ≠ char 𝔽_q. Every eigenvalue α of geometric Frobenius on Hᵈ(X,ℚ_ℓ) is algebraic; every complex conjugate satisfies q^(d/2−1/2) ≤ |α| ≤ q^(d/2+1/2). No semisimplicity or degeneration of Leray is required. The induction retains E∩E⊥ and covers zero vanishing cycles, a zero radical quotient, and a nonzero quotient.

Atlas landmark: **Half-unit bound**.

Proof or construction:

1. First separate geometric components after a finite extension; Frobenius-power comparison returns the bound on X₀. Induct on even d, beginning with dimension zero. After a further finite extension choose a pencil, a rational smooth fibre and a smooth hyperplane section Y of that fibre; make exceptional values and vanishing-cycle signs rational.
2. Pullback from X to its blowup along the pencil axis is injective. The degree-d Leray filtration has graded subquotients of A=H²(ℙ¹,R^(d−2)f_*ℚ_ℓ), B=H⁰(ℙ¹,Rᵈf_*ℚ_ℓ), C=H¹(ℙ¹,R^(d−1)f_*ℚ_ℓ). This filtration suffices without any degeneration assertion.
3. Write n=d−1=2m+1. In the nonzero vanishing-cycle case the outer sheaves are geometrically constant. Weak Lefschetz identifies A with H^(d−2)(Y)(−1), and its Gysin transpose makes B a quotient of this same group. Here dim Y=d−2. The induction hypothesis gives the interval q^((d−2)/2−1/2)≤|α|≤q^((d−2)/2+1/2) before twisting; multiplying by q gives the required q^(d/2±1/2) interval. Exact purity is proved only in the following tensor-power node.
4. In the zero-cycle case B is an extension of the same constant-fibre term by skyscrapers ℚ_ℓ(m−n)=ℚ_ℓ(−d/2); C vanishes because Rⁿ is geometrically constant. Make the skyscrapers rational after extension, so their eigenvalues are q^(d/2).
5. For nonzero cycles with E/rad ≠0, sequences (7.1.2) and (7.1.3) give a surjection H¹(j_*E)→C and an injection H¹(j_*E)→H¹(j_*(E/rad)); H¹ of the geometrically constant factors on ℙ¹ vanishes. Apply the pencil coarse bound.
6. If E⊂E⊥, retain (7.1.4) and (7.1.5): C injects into H¹(G), a quotient of the singular-fibre skyscraper sections ℚ_ℓ(−d/2). Thus all cases give the interval. Algebraicity and all conjugates pass through extensions, subquotients and finite-field descent.

Acceptance checks:

- For d=0, Frobenius permutes geometric points and its eigenvalues are roots of unity.
- A quadric surface pencil has E=0 and singular-fibre ℚ_ℓ(−1) terms; these give weight 2 rather than disappearing.

Direct inputs: [DWP.3/coarse-bound-for-the-pencil](#dwp-3-coarse-bound-for-the-pencil), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.4`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §7, Lemme (7.1) and (7.1.1)–(7.1.5), pp. 298–300.

Declaration id: `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`.

<a id="dwp-4-middle-cohomology-purity"></a>

### Purity in the middle degree

For smooth projective X₀ of any pure dimension d over 𝔽_q, every geometric-Frobenius eigenvalue on Hᵈ(X,ℚ_ℓ) is a Weil q-number of weight d.

Atlas landmark: **Middle cohomology purity**.

Proof or construction:

1. For every positive even k, Künneth exhibits αᵏ as an eigenvalue on H^(kd)(Xᵏ). Apply the even-dimensional half-unit theorem to get q^(d/2−1/(2k))≤|α|≤q^(d/2+1/(2k)).
2. Algebraicity of αᵏ implies algebraicity of α; each embedding of ℚ(α) restricts to one of ℚ(αᵏ), so the inequalities hold for every conjugate. Take arbitrarily large even k to get equality.

Acceptance checks:

- A nonsemisimple Frobenius operator is permitted: Künneth uses characteristic roots, not eigenbases.
- Only even k are used; odd-dimensional X is therefore included.

Direct inputs: [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §7, Lemme (7.2), pp. 300–301; proof (7.3), p. 301.

Declaration id: `DeligneWeightsAndPurity:DWP.4/middle-cohomology-purity`.

<a id="dwp-4-smooth-projective-purity"></a>

### The Weil theorem for smooth projective varieties

For every smooth projective X₀ over 𝔽_q and every i≥0, each eigenvalue of geometric Frobenius on Hⁱ(X,ℚ_ℓ) is a Weil q-number of weight i. This is Weil I Lemma 1.7; integral cohomological factors and their ℓ-independence are exported to WC.3 rather than proved again here.

Atlas landmark: **Weil purity theorem**.

Proof or construction:

1. After finite base extension split the finitely many geometric connected components and work with pure dimension on each. Recover the original eigenvalues from their powers.
2. By Poincaré duality it suffices to handle i≤d. For i<d, successive smooth hyperplane sections and weak Lefschetz inject degree i into the middle cohomology of a smooth projective section of dimension i. Apply middle purity; duality supplies degrees above d.

Acceptance checks:

- H^(2r)(ℙᴺ)=ℚ_ℓ(−r), with eigenvalue qʳ and weight 2r; odd degrees vanish.
- Components not defined over 𝔽_q are handled by permutation Frobenius before any point-count main term is identified.
- Smooth proper nonprojective varieties require DWP.7; this theorem asserts projectivity.

Direct inputs: [DWP.4/middle-cohomology-purity](#dwp-4-middle-cohomology-purity), [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §1, Lemme (1.7), p. 276; §7, Lemme (7.2) and proof (7.3), pp. 300–301.

Declaration id: `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`.

## DWP.5 — Weil coefficients, local weights and analytic preparation

The coefficient definitions precede their DWP.2 use. Determinantal weights are not initially punctual weights: their exterior and pullback functoriality is proved separately. Local monodromy purity is an equal-characteristic curve theorem. The analytic suffix uses the compact form and the norm exponent with weight −2Re(r).

<a id="dwp-5-weil-group"></a>

### The Weil group of a finite-field scheme

For connected X₀/𝔽_q with geometric point x, let W(X₀,x)=π₁(X₀,x)×_{Gal(𝔽̄_q/𝔽_q)}ℤ, where 1∈ℤ maps to geometric Frobenius. Its topology makes the geometric kernel open with its profinite topology and the degree quotient discrete. For geometrically connected X₀ the sequence 1→π₁(X,x)→W(X₀,x)→ℤ→0 is exact. A closed-point geometric Frobenius has degree +deg(x). This degree is the negative of the arithmetic coordinate in Weil I §6.

Atlas landmark: **Weil group**.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.5/weil-sheaf: distinguishes Weil descent from continuous Galois descent
- DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution: labels the actual degree fibres

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.WeilGroup` | constructor | The topological pullback group with its projection to π₁ and its geometric-degree homomorphism to ℤ. |
| `TauCeti.Weights.WeilGroup.degree` | projection | The integer degree of a Weil element. |
| `TauCeti.Weights.WeilGroup.geometricKernel` | characterisation | The degree-zero subgroup is the geometric fundamental group for geometrically connected X₀. |
| `TauCeti.Weights.WeilGroup.frobenius_degree` | simp | The local geometric Frobenius has degree deg(x). |
| `TauCeti.Weights.WeilGroup.baseExtension` | functoriality | Over 𝔽_(qᵃ), the Weil group is the subgroup of degrees divisible by a, with the new degree divided by a. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.weilGroup_point` | compatibility | For Spec 𝔽_q, W=ℤ with degree the identity and trivial geometric kernel. |
| `TauCeti.Weights.weilGroup_degree_sign` | non-example | A local geometric Frobenius of degree e has Weil II degree e and Weil I arithmetic coordinate −e. |
| `TauCeti.Weights.weilGroup_base_extension_two` | computation | For Spec 𝔽_(q²) over 𝔽_q, arithmetic degrees lie in 2ℤ; degree-one relative Frobenius maps to degree 2. |

Proof or construction:

1. Use the arithmetic/geometric fundamental sequence supplied by IG.1 and form the group pullback with geometric Frobenius powers. Give each degree coset the translated profinite topology.
2. Restriction from 𝔽_q to 𝔽_p changes the Frobenius generator and the degree by the extension degree; distinguish the corresponding Weil groups rather than identifying their degrees.

Acceptance checks:

- The map to arithmetic π₁ is injective, but the subspace profinite topology on its image is not the Weil topology.

Direct inputs: `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `mathlib:MonoidHom.eqLocus`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1 (1.1.7)–(1.1.13.1), pp. 150–153.

Declaration id: `DeligneWeightsAndPurity:DWP.5/weil-group`.

<a id="dwp-5-weil-sheaf"></a>

### Weil sheaves and étale descent

A constructible Weil sheaf on X₀/𝔽_q is a constructible ℚ̄_ℓ-sheaf on X=X₀×𝔽̄_q together with compatible Weil descent isomorphisms; equivalently an isomorphism F*ℱ≅ℱ for the chosen geometric-Frobenius descent action. For a lisse sheaf on connected X this is a continuous finite-coefficient-model representation of W(X₀,x). An ordinary étale sheaf requires extension of that representation to continuous π₁(X₀,x); a Frobenius isomorphism alone does not ensure it. On a point a rank-one Weil action with scalar b descends étale exactly when b is an ℓ-adic unit.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness: the coefficient objects on which weights are defined
- DeligneWeightsAndPurity:DWP.5/rank-one-normalization: real twists may be Weil lines without a specified étale realization

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.WeilSheaf` | data | A geometric constructible sheaf with Weil descent data. |
| `TauCeti.Weights.WeilSheaf.frobenius` | projection | The invertible action on every closed-point stalk, up to conjugacy. |
| `TauCeti.Weights.WeilSheaf.ofEtale` | constructor | Restrict an étale sheaf to Weil descent. |
| `TauCeti.Weights.WeilSheaf.etaleDescent_iff` | characterisation | For a lisse Weil sheaf, étale descent means extension to a continuous arithmetic fundamental-group representation. Constructible non-lisse sheaves instead use sheaf descent data; a single representation does not describe them. |
| `TauCeti.Weights.WeilSheaf.pullback` | functoriality | Pull back descent along an 𝔽_q-morphism, preserving identity and composition. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.weilSheaf_nonunit` | non-example | On Spec 𝔽_q the scalar ℓ defines a Weil line which has no étale descent. |
| `TauCeti.Weights.weilSheaf_constant` | computation | The constant line with Frobenius 1 descends étale. |
| `TauCeti.Weights.weilSheaf_tate` | compatibility | For ℓ≠p the Tate line has geometric scalar q⁻¹ and agrees with EDC.0, hence descends étale. |

Proof or construction:

1. Import the genuine constructible sheaf and coefficient-lattice categories from SF.2/EDC.0, and equip geometric sheaves with descent isomorphisms satisfying the cocycle law.
2. Apply the lisse fibre/representation equivalence. A continuous profinite image is compact; on a point this gives the unit criterion, and the compact closure of the cyclic unit action gives the converse.

Acceptance checks:

- No ambient topology on ℚ̄_ℓ replaces the explicit finite E/ℚ_ℓ model.

Direct inputs: [DWP.5/weil-group](#dwp-5-weil-group), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `ArithmeticGaloisRepresentations:R01.6`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1 (1.1.6), (1.1.10)–(1.1.14), pp. 150–153.

Declaration id: `DeligneWeightsAndPurity:DWP.5/weil-sheaf`.

<a id="dwp-5-punctual-purity-and-mixedness"></a>

### Punctual purity and finite mixed filtrations

Let ℓ be prime and X be of finite type over ℤ[1/ℓ]; use constructible ℚ̄_ℓ-sheaves, or Weil sheaves when X is over a finite field. Punctual purity of integer weight n requires every geometric-Frobenius eigenvalue at each closed point x to be a Weil N(x)-number of weight n. Fixed-ι punctual purity of real weight β uses |ια|=N(x)^(β/2). Mixedness, respectively ι-mixedness, means existence of a finite filtration by subsheaves with pure, respectively ι-pure, successive quotients. Actual weights are the weights of nonzero quotients; the zero sheaf has no actual weights. Bounds ≤b or ≥b apply to these actual weights. Weight classes modulo ℤ are real weights in ℝ/ℤ; the canonical decomposition into those classes belongs to DWP.8.

Atlas landmark: **Pure and mixed sheaves**.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions: the common predicates on schemes over ℤ[1/ℓ]
- DeligneWeightsAndPurity:DWP.6/sharp-curve-purity: states the real-weight theorem
- PadicDifferentialEquationsAndRigidCohomology:RD.6: imports only numeric predicates; its F-isocrystal stalk category remains its own

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.IsPunctuallyPure` | data | Integer purity at all closed stalks. |
| `TauCeti.Weights.IsPunctuallyIotaPure` | data | Real purity at all closed stalks for a specified coefficient isomorphism ι. |
| `TauCeti.Weights.IsMixed` | data | Existence of a finite integer-pure subsheaf filtration. |
| `TauCeti.Weights.IsIotaMixed` | data | Existence of a finite real-ι-pure subsheaf filtration. |
| `TauCeti.Weights.punctualWeights` | data | The finite set of actual weights of nonzero graded pieces. |
| `TauCeti.Weights.pure_zero` | simp | The zero sheaf is pure of every weight and has empty actual weight set. |
| `TauCeti.Weights.pure_subquotient` | functoriality | Subsheaves and quotient sheaves of a pure sheaf are pure of the same weight. |
| `TauCeti.Weights.mixed_extension` | compatibility | An extension of mixed sheaves is mixed; actual weights form the union. |
| `TauCeti.Weights.pure_tensor` | compatibility | Tensor products add weights; lisse duals negate them. |
| `TauCeti.Weights.pure_tateTwist` | compatibility | Twisting by r∈ℤ subtracts 2r. |
| `TauCeti.Weights.pure_pullback_finitePushforward` | functoriality | Pullback and finite direct image preserve purity, with residue-degree powers of Frobenius included. |
| `TauCeti.Weights.mixed_iff_finite_filtration` | characterisation | Mixedness is precisely a finite subsheaf filtration with pure quotients, with no strictness or canonical splitting built into the predicate. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.punctual_tate_line` | computation | ℚ̄_ℓ(1) is pure of weight −2. |
| `TauCeti.Weights.punctual_zero_weights` | degenerate | The zero sheaf is pure of every weight, mixed, and has empty actual weight set. |
| `TauCeti.Weights.mixed_two_tate_weights` | non-example | ℚ̄_ℓ⊕ℚ̄_ℓ(−1) on Spec 𝔽_q is mixed with actual weights {0,2}, and is not pure of any weight. |
| `TauCeti.Weights.punctual_jordan` | compatibility | The rank-two unipotent Jordan Frobenius on a point is pure of weight 0 although arithmetic Frobenius is not semisimple. |

Proof or construction:

1. Apply the DWP.0 eigenvalue predicates to the actual closed-point stalk Frobenius. Define mixedness through finite filtrations in the imported abelian sheaf category, without inferring it from pointwise spectral decompositions.
2. Characteristic-polynomial exactness on stalks proves purity stability under subobjects, quotients and extensions. Refine filtrations for mixed stability. Stalk base change, finite pushforward and tensor products give the remaining operations; lisse duals negate weights.

Acceptance checks:

- Every mixed sheaf is ι-mixed for every ι, with the same integer actual weights.
- A finite Frobenius module on a point is automatically ι-mixed; this is not an automatic global filtration theorem.

Direct inputs: [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2 (1.2.2)–(1.2.8), pp. 153–155.

Declaration id: `DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness`.

<a id="dwp-5-real-sheaves"></a>

### Totally real and ι-real sheaves

A sheaf is totally real when every closed-point local characteristic polynomial has algebraic totally real coefficients; it is ι-real when those coefficients map into ℝ under the fixed ι. These are coefficient conditions, not assertions that every eigenvalue is real. A pure sheaf of integer weight n is a direct summand of the totally real sheaf ℱ⊕ℱ∨(−n); for real ι-weight β use a rank-one Weil twist of weight 2β in place of the integer Tate normalization.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.5/generalized-majoration: even tensor trace positivity
- DeligneWeightsAndPurity:DWP.6/sharp-curve-purity: real envelope of an external-product system

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.IsTotallyReal` | data | All local polynomial coefficients are algebraic and totally real. |
| `TauCeti.Weights.IsIotaReal` | data | All local polynomial coefficients become real under ι. |
| `TauCeti.Weights.totallyReal_iotaReal` | compatibility | Total reality implies ι-reality for every ι. |
| `TauCeti.Weights.pure_real_envelope` | constructor | The reciprocal-normalized dual direct sum of a pure sheaf is real and contains the original as a direct summand. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.real_nonreal_roots` | non-example | A point module with polynomial T²−T+2 is totally real, although its roots are nonreal. |
| `TauCeti.Weights.real_zero` | degenerate | The zero object has local polynomial 1 and is totally real. |
| `TauCeti.Weights.real_envelope_line` | computation | A pure weight-zero line with scalar (3+4i)/5 has real envelope polynomial T²−(6/5)T+1. |

Proof or construction:

1. Complex conjugation sends a weight-n eigenvalue α to N(x)ⁿ/α. Add the reciprocal-normalized dual spectrum to obtain conjugation-invariant local polynomials for every embedding.
2. For fixed ι and real β use the chosen Weil line with local eigenvalue N(x)^β, not an integer Tate twist when β is not integral.

Acceptance checks:

- ι-real is weaker than totally real. The direct-summand construction preserves the original sheaf.

Direct inputs: [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), [DWP.0/reciprocal-pairing-of-eigenvalues](#dwp-0-reciprocal-pairing-of-eigenvalues).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2 (1.2.12)–(1.2.14), pp. 155–156.

Declaration id: `DeligneWeightsAndPurity:DWP.5/real-sheaves`.

<a id="dwp-5-rank-one-normalization"></a>

### Finite geometric monodromy and rank-one normalization

For normal geometrically connected X₀/𝔽_q, the image of π₁(X) in the abelianization of W(X₀) is an extension of a finite prime-to-p group by a pro-p group. Consequently every rank-one ℓ-adic Weil representation (ℓ≠p, finite coefficient model) has finite geometric image and is a constant Weil character times a finite-order character; it is punctually ι-pure. An irreducible rank-r system becomes finite-determinant after a rank-one Weil twist. Choosing a twist of arbitrary real weight uses Weil lines and does not assert that it is a motivic Tate twist.

Proof or construction:

1. On a smooth curve use the finite-field idèle/class-field description: the geometric abelian quotient is a finite prime-to-p group times a pro-p group. A compact ℓ-adic image has an open pro-ℓ subgroup. The pro-p part has finite image for p≠ℓ, and the finite part remains finite, so geometric rank-one monodromy is finite.
2. For normal higher-dimensional X choose a curve surjecting onto the relevant fundamental group and specialize a relative curve using the uniform lattice monodromy theorem.
3. A character trivial on the geometric kernel factors through degree. Taking a root of its determinant scalar makes an irreducible determinant finite order. Its constant scalar defines the real weight.

Acceptance checks:

- A constant scalar b over 𝔽_q gives local scalar b^(deg x); normalizing over 𝔽_p instead gives b^a at q=pᵃ.
- Finite determinant does not itself prove the conjectural purity statement (1.2.10)(i).

Direct inputs: [DWP.5/weil-group](#dwp-5-weil-group), [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `FunctionFieldArithmetic:FA.4`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `LefschetzPencilsAndVanishingCycles:LPV.5`, [DWP.5/specialization-of-monodromy](#dwp-5-specialization-of-monodromy).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.3 (1.3.1), (1.3.4), (1.3.6), pp. 156–158; §1.11 (1.11.4), pp. 185–186.

Declaration id: `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`.

<a id="dwp-5-determinantal-weights"></a>

### Determinantal weights of irreducible constituents

For a lisse Weil sheaf on normal connected X₀, an irreducible constituent ℱ of rank r has determinantal ι-weight β when det ℱ is punctually ι-pure of weight rβ. The determinantal-weight multiset of any lisse sheaf lists these β with constituent multiplicities. It is independent of a Jordan–Hölder filtration. It is not the multiset of all stalk weights until purity of constituents has been proved.

Atlas landmark: **Determinantal weights**.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.5/generalized-majoration: converts determinantal upper bounds into punctual bounds
- DeligneWeightsAndPurity:DWP.5/local-monodromy-purity: normalizes real weights without presupposing purity

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.determinantalWeight` | data | For an irreducible of rank r>0, the determinant weight divided by r. |
| `TauCeti.Weights.determinantalWeights` | data | The multiset of determinantal weights of irreducible constituents. |
| `TauCeti.Weights.determinantalWeight_det` | characterisation | The determinant is pure of weight r times the determinantal weight. |
| `TauCeti.Weights.determinantalWeights_exact` | compatibility | The multiset for an extension is the sum of those of its subobject and quotient. |
| `TauCeti.Weights.determinantalWeights_twist` | functoriality | A rank-one twist of weight c adds c to every determinantal weight. |
| `TauCeti.Weights.determinantalWeight_pure` | compatibility | For an irreducible punctually pure sheaf of weight β, its determinantal weight is β. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.detWeight_tate` | computation | The Tate line ℚ̄_ℓ(r) has determinantal weight −2r. |
| `TauCeti.Weights.detWeight_zero` | degenerate | The zero sheaf has empty determinantal-weight multiset. |
| `TauCeti.Weights.detWeight_rank_divisor` | non-example | A rank-two pure system of weight 1 has determinant weight 2 and determinantal weight 1, not 2. |

Proof or construction:

1. After finite extension of the base field, treat each geometric component using rank-one normalization on its normal geometrically connected model. Finite-field base-extension comparison preserves the normalized real weight. This gives a unique real weight for det ℱ; divide it by positive rank. Jordan–Hölder uniqueness gives independence of the multiset.
2. Jordan–Hölder factors of an extension are the union of those of its subobject and quotient. A rank-one twist multiplies the rank-r determinant by its rth power, adding the twist weight to the normalized determinantal weight. For a pure constituent, exterior-power spectra identify the determinant weight as r times the punctual weight.

Acceptance checks:

- Vanishing sheaves have the empty multiset; division by rank occurs only for nonzero irreducibles.

Direct inputs: [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/eigenvalues-of-exterior-powers](#dwp-0-eigenvalues-of-exterior-powers), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.3 Définition (1.3.5), p. 158; Corollaire (1.3.12) and Proposition (1.3.13), p. 161.

Declaration id: `DeligneWeightsAndPurity:DWP.5/determinantal-weights`.

<a id="dwp-5-geometric-monodromy-and-central-degree"></a>

### Unipotent radical and central degree in Weil monodromy

For a lisse finite-model Weil system on normal geometrically connected X₀, let G_geom be the Zariski closure of geometric monodromy and G the algebraic-by-discrete extension G_geom⋊ℤ induced by a degree-one lift. The radical of G_geom° is unipotent. If the system is semisimple as a Weil representation, its geometric restriction is semisimple and G_geom° is semisimple. Then degree on Z(G) has finite kernel and image of finite index in ℤ. For a central g of degree m≠0, the spectrum on the determinantal-weight-β constituent has |ια|=q^(mβ/2). Every irreducible Weil system becomes an étale system after a rank-one Weil twist.

Proof or construction:

1. Grothendieck: characters of the radical in the adjoint monodromy action have finite orbit; determinant characters of constituents of its weight spaces have finite geometric image by the rank-one theorem, forcing the radical torus to vanish.
2. Semisimple restriction to a normal subgroup and complete reducibility make geometric monodromy reductive, so its connected radical is trivial. Import the reductive-group central-degree criterion: faithful finite-kernel representations, finite outer automorphism group and centralizer of the derived group.
3. Schur gives a central scalar on each irreducible; the determinant determines its absolute value. For étale descent use the compact normalizer modulo the semisimple geometric group (1.3.15), and normalize the degree scalar to an ℓ-adic unit.

Acceptance checks:

- Arithmetic Frobenius semisimplicity is a hypothesis here, and is not inferred from purity.
- G is an extension by ℤ, not a finite-type algebraic group with infinitely many components.

Direct inputs: [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization), [DWP.5/determinantal-weights](#dwp-5-determinantal-weights), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `ArithmeticGaloisRepresentations:R01.6`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.3 (1.3.7)–(1.3.15), pp. 158–162.

Declaration id: `DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree`.

<a id="dwp-5-determinantal-weight-functoriality"></a>

### Functoriality of determinantal weights

For a dominant morphism f:X′₀→X₀ of normal connected finite-type schemes over 𝔽_q, a lisse Weil sheaf has only determinantal ι-weight β if and only if its pullback does. Tensor products of sheaves having only determinantal weights β and γ have only weight β+γ. If n(β) is the sum of ranks of constituents of weight β, the determinantal weights occurring in ∧^aℱ are exactly Σ_β a(β)β with Σ a(β)=a and 0≤a(β)≤n(β), as a set of occurring weights (not constituent multiplicities).

Hypotheses and scope:

- Use a finite common coefficient model. The zero sheaf and a above total rank have empty weight set; ∧^0 has sole weight 0.

Proof or construction:

1. Pass to the semisimplification and its common algebraic-by-ℤ monodromy group. The central-degree criterion identifies a constituent’s normalized determinant weight with the weight of a central scalar divided by its nonzero degree.
2. For dominant normal pullback, the fundamental-group image has finite index, so the same connected geometric monodromy and a common positive-degree central power give the same purity criterion before and after pullback. This finite-index contract is an IG.1 request, not the projective-pencil Bertini theorem.
3. Tensor central eigenvalues multiply. Exterior-power eigenvalues are distinct-position products; group positions by their determinantal weights and count available dimensions n(β). Taking a central element gives the displayed sums; triangularization passes the formula through nonsplit filtrations.

Acceptance checks:

- For ℚ̄_ℓ⊕ℚ̄_ℓ(−1), ∧² has only determinantal weight 2, not 0 or 4.
- Two copies of a weight-zero line give rank two but only weight zero in ∧²; constituent multiplicity must not be confused with the n(β) rank capacity.

Direct inputs: [DWP.5/determinantal-weights](#dwp-5-determinantal-weights), [DWP.5/geometric-monodromy-and-central-degree](#dwp-5-geometric-monodromy-and-central-degree), [DWP.0/eigenvalues-of-exterior-powers](#dwp-0-eigenvalues-of-exterior-powers), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.3, Corollaire (1.3.12) and Proposition (1.3.13)(i)–(iii), p. 161.

Declaration id: `DeligneWeightsAndPurity:DWP.5/determinantal-weight-functoriality`.

<a id="dwp-5-generalized-majoration"></a>

### Deligne’s generalized majoration theorem

For a normal connected X₀ of finite type over 𝔽_q, the irreducible constituents of a lisse ι-real sheaf are punctually ι-pure. More precisely, on a smooth curve let r be its maximal determinantal weight; every stalk eigenvalue has ι-weight ≤r, and each irreducible constituent of determinantal weight β is punctually pure of weight β. No open symplectic-image or rational-coefficient hypothesis is imposed.

Atlas landmark: **Generalized majoration theorem**.

Proof or construction:

1. Reduce to curves using fundamental-group Bertini and normality. On the curve take even tensor powers; ι-real traces have nonnegative even powers, so local factors have nonnegative real coefficients.
2. The H²_c coinvariant formula and determinantal tensor weights put global poles at weights ≤2kr+2. Compare the local-factor pole radii to obtain w(α)≤r+1/k, then let k increase.
3. Use descending induction on the distinct determinantal weights. For a constituent of weight β, let N be the sum of ranks already known pure at larger weights. The degree-(N+1) exterior power has maximal determinantal weight equal to the sum of those N larger weights plus β, by determinantal-weight-functoriality. Exterior products preserve ι-reality, so the just-proved upper bound applies. Combining the known larger-weight eigenvalues with any eigenvalue of this constituent forces the latter to have weight ≤β. Its determinant has average weight β, so all its eigenvalues have weight β. Tensor and exterior reality follow by conjugation invariance of characteristic-root multisets.

Acceptance checks:

- The real envelope of a pure sheaf recovers its constituent purity without changing the original object.

Direct inputs: [DWP.5/real-sheaves](#dwp-5-real-sheaves), [DWP.5/determinantal-weights](#dwp-5-determinantal-weights), [DWP.5/geometric-monodromy-and-central-degree](#dwp-5-geometric-monodromy-and-central-degree), [DWP.2/positive-local-factors](#dwp-2-positive-local-factors), [DWP.2/poles-of-positive-products](#dwp-2-poles-of-positive-products), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `LefschetzPencilsAndVanishingCycles:LPV.5`, [DWP.0/eigenvalues-of-exterior-powers](#dwp-0-eigenvalues-of-exterior-powers), [DWP.5/determinantal-weight-functoriality](#dwp-5-determinantal-weight-functoriality), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.5 Théorème (1.5.1), Lemme (1.5.2), proof (1.5.3), pp. 164–165.

Declaration id: `DeligneWeightsAndPurity:DWP.5/generalized-majoration`.

<a id="dwp-5-initial-curve-and-boundary-bounds"></a>

### Initial cohomological and boundary weight bounds

For j:U₀→C₀ with C₀ smooth projective over 𝔽_q and ℱ lisse punctually ι-pure of real weight β, boundary eigenvalues of j_*ℱ have ι-weight ≤β, and those on H¹_c(U,ℱ) have weight ≤β+2. These initial non-strict bounds precede the strict analytic bound and the sharp curve theorem.

Proof or construction:

1. Normalize β to zero by a real Weil twist and embed in a real envelope. Generalized majoration, H⁰ invariants and H²_c coinvariants give the coarse compact-cohomology bound using the Euler product in its disc of absolute convergence.
2. Apply the tensor-power trick to boundary sections using invariants and their embedding into tensor invariants: the fixed additive error tends to zero, giving boundary weights ≤β.

Acceptance checks:

- The bound ≤β+2 is deliberately non-strict; the strict bound comes from (2.2.10).

Direct inputs: [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.5/real-sheaves](#dwp-5-real-sheaves), [DWP.5/generalized-majoration](#dwp-5-generalized-majoration), [DWP.2/radius-of-convergence-of-positive-products](#dwp-2-radius-of-convergence-of-positive-products), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.8 Lemme (1.8.1) and Remarque (1.8.2), p. 175.

Declaration id: `DeligneWeightsAndPurity:DWP.5/initial-curve-and-boundary-bounds`.

<a id="dwp-5-local-monodromy-purity"></a>

### The local weight–monodromy theorem on a curve

Let U₀ be a smooth curve over 𝔽_q and ℱ lisse punctually ι-pure of real weight β. At a missing point of its smooth completion take the local Weil representation V and the monodromy filtration M centered at zero after the quasi-unipotent inertia reduction. Then GrᵢᴹV is pure of weight β+i relative to the residue cardinality. With N:V→V(−1), geometric F satisfies FNF⁻¹=q_x⁻¹N in untwisted coordinates. The inertia invariants have only weights ≤β. This is an equal-characteristic curve theorem.

Atlas landmark: **Local weight–monodromy theorem**.

Proof or construction:

1. Pass to a finite cover killing the finite inertia part and use the supplied nilpotent logarithm and SL₂/primitive monodromy-filtration description. Normalize β to zero.
2. For the primitive summand P_(−j), the boundary bound says weights ≤0. Clebsch–Gordan puts α²q_xʲ in P₀ of V⊗V, so w(α)≤−j. Apply the same reasoning to the dual, whose primitive eigenvalue is α⁻¹q_x⁻ʲ, to get the opposite inequality.
3. Recover all graded weights using the monodromy strings and twist signs. Descend along the finite cover: powers of Frobenius preserve relative weights, and roots of unity do not change them.

Acceptance checks:

- For a two-step nodal string with center β=1 the grades have weights 0 and 2 and N maps Gr₁ to Gr₋₁(−1).
- This asserts no mixed-characteristic weight–monodromy theorem for varieties over p-adic fields.

Direct inputs: [DWP.5/initial-curve-and-boundary-bounds](#dwp-5-initial-curve-and-boundary-bounds), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `LefschetzPencilsAndVanishingCycles:LPV.1`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.7 (1.7.1)–(1.7.12), pp. 170–174; §1.8 Théorème (1.8.4), pp. 175–176.

Declaration id: `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`.

<a id="dwp-5-local-weight-corollaries"></a>

### Boundary mixedness and extension of purity

For an ι-mixed local system on a smooth curve, the relative monodromy filtration exists and agrees with the local weight filtration on pure graded pieces. Along a smooth divisor, the relative construction is lisse and compatible with transverse curves and fibres under the tame hypotheses of (1.8.6)–(1.8.7). For an open immersion of finite-type 𝔽_q schemes, underived j_* takes ι-mixed sheaves with weights ≤β to ι-mixed sheaves with weights ≤β. A lisse sheaf pure on a dense open is pure everywhere; on normal X a lisse ι-mixed sheaf has a finite filtration by lisse pure sheaves. On connected X an ι-mixed lisse sheaf pure of weight β at one closed point is pure of weight β everywhere.

Proof or construction:

1. Use the pure local theorem and the supplier’s uniqueness and tensor compatibility of relative monodromy filtrations; restrict to transverse curves to identify divisor grades.
2. For j_* mixedness dévissage the support, normalize, take finite covers to arrange tame behavior, and use the boundary-invariant theorem at generic divisors; no Rj_* bound is claimed.
3. Apply the dense-open upper bound to both a sheaf and its dual to get equality. On normal X extend the generic pure constituent filtration by j_* and intersect with the original lisse sheaf. Ranks of the graded pieces are constant on a connected base, giving the one-point purity criterion.

Acceptance checks:

- The extension statement concerns underived j_*; it is not the six-operation weight theorem.
- For a divisor finite étale over the base these grades commute with specialization as needed by DWP.7.

Direct inputs: [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), `LefschetzPencilsAndVanishingCycles:LPV.1`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.8 Corollaires (1.8.5)–(1.8.12), pp. 176–179.

Declaration id: `DeligneWeightsAndPurity:DWP.5/local-weight-corollaries`.

<a id="dwp-5-stalk-newton-polygon"></a>

### Newton polygons of Frobenius stalks

Fix a rational-valued additive nonarchimedean valuation v on the coefficient algebraic closure normalized by v(p)=1. For a rank-r closed stalk at x with geometric Frobenius eigenvalues α₁,…,αᵣ, let s₁≤…≤sᵣ be v(αᵢ)/v(N(x)), counted with multiplicity. Its Newton polygon has vertices (k,Σ_{i≤k}sᵢ), k=0,…,r, and linear interpolation. Equivalently the kth ordinate is the minimum normalized valuation of products of k distinct eigenvalue positions, the spectrum of the kth exterior power. This is the stalk specialization of the general Newton-polygon convention, not a new p-adic cohomology theory.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.5/nonarchimedean-boundary-bounds: states specialization and the nilpotence bound
- PadicDifferentialEquationsAndRigidCohomology:RD.6: shares normalized slope conventions without duplicating F-isocrystals

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.stalkNewtonPolygon` | constructor | The cumulative-slope polygon normalized by v(N(x)). |
| `TauCeti.Weights.stalkNewtonPolygon_zero` | simp | The origin is (0,0); rank zero has the single origin. |
| `TauCeti.Weights.stalkNewtonPolygon_endpoint` | characterisation | The endpoint is (r,v(det F_x)/v(N(x))). |
| `TauCeti.Weights.stalkNewtonPolygon_exterior` | characterisation | The kth ordinate is the minimum normalized valuation of kth exterior eigenvalues. |
| `TauCeti.Weights.stalkNewtonPolygon_baseExtension` | compatibility | Finite residue-field extension leaves the polygon unchanged. |
| `TauCeti.Weights.stalkNewtonPolygon_tateTwist` | compatibility | Twisting by a adds −a to every normalized slope. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.newton_two_slopes` | computation | The point module diag(1,q) has vertices (0,0),(1,0),(2,1). |
| `TauCeti.Weights.newton_empty` | degenerate | Rank zero has only (0,0). |
| `TauCeti.Weights.newton_base_extension` | compatibility | Replacing diag(1,q) by diag(1,q²) over 𝔽_(q²) retains slopes 0,1, not 0,2. |

Proof or construction:

1. Order the finite multiset of normalized slopes, take cumulative sums, and interpolate. The exterior-power spectrum supplies the minimum-product characterization, including repeated eigenvalues and k=0.

Acceptance checks:

- Frobenius powers and the residue-cardinality powers cancel in normalized slopes.

Direct inputs: [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `mathlib:AddValuation`, `mathlib:Multiset.sort`, [DWP.0/eigenvalues-of-exterior-powers](#dwp-0-eigenvalues-of-exterior-powers).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.10 (1.10.6), p. 183.

Declaration id: `DeligneWeightsAndPurity:DWP.5/stalk-newton-polygon`.

<a id="dwp-5-nonarchimedean-boundary-bounds"></a>

### Nonarchimedean bounds at the boundary

Fix an embedding ι of the coefficient field into an algebraically closed nonarchimedean valued field of characteristic zero. For a lisse Weil sheaf on a smooth curve, a normalized nonarchimedean bound b^(deg x)≤|ια|≤c^(deg x) at closed points extends to every eigenvalue of its local boundary Weil representations. Generic ℓ′-adic units remain units at the boundary. For valuations with v(p)>0, if almost all stalk Newton polygons agree, the boundary polygon lies on or above that polygon with the same endpoint. If local normalized slopes lie in [β,γ], N^(⌊γ−β⌋+1)=0.

Proof or construction:

1. The upper bound for j_* follows from the analytic local-factor/boundary argument applied to an absolute value, as in (1.10.1). Extend from invariants to all monodromy strings using |q|≤1; use the dual for the lower bound.
2. Use exterior powers to turn all cumulative-slope inequalities into the absolute-value inequalities. Rank-one determinant normalization fixes the endpoint.
3. N lowers the normalized Frobenius slope by one; a string longer than γ−β cannot fit in the allowed interval.

Acceptance checks:

- A split ordinary rank-two module has slopes 0,1; specialization can give slopes 1/2,1/2, whose polygon lies above the ordinary one.
- Unit bounds are a separate nonarchimedean statement; real purity alone does not imply them.

Direct inputs: [DWP.5/stalk-newton-polygon](#dwp-5-stalk-newton-polygon), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/eigenvalues-of-exterior-powers](#dwp-0-eigenvalues-of-exterior-powers).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.10 (1.10.1)–(1.10.9), pp. 182–184.

Declaration id: `DeligneWeightsAndPurity:DWP.5/nonarchimedean-boundary-bounds`.

<a id="dwp-5-specialization-of-monodromy"></a>

### Specialization of geometric monodromy

Let f:X→S be smooth with geometrically connected curve fibres, S reduced irreducible with generic point η, and g:S→X a section. For a lisse ℤ_ℓ-sheaf ℱ, after shrinking S to a nonempty open there is, simultaneously for every n, a lisse subgroup of Aut(g*ℱ/ℓⁿ) whose stalk is the image of the geometric fibre fundamental group. If f has a smooth proper curve compactification with boundary finite étale over S, the image is locally constant without further shrinking under the stated tame conditions; the inertia images at sections of the boundary specialize compatibly. The extension (1.11.5) covers finite-type families after stratification and dévissage, with the model and the locally constant image conditions kept explicit.

Proof or construction:

1. At finite level construct the finite étale cover representing the kernel. One finite shrinking handles the first level and the tame ramification data.
2. Higher-level kernels in Aut(ℱ/ℓⁿ) are pro-ℓ; their prime-to-p ramification and the specialization theorem for tame fundamental groups give one common open valid for all levels, not a separate open for each n.
3. For the general case spread the finite models and stratify; reduce the comparison to relative curves by general hyperplane sections, preserving the finite-level images.

Acceptance checks:

- A different shrinking for each n would not prove the ℓ-adic statement.
- This theorem supplies the higher-dimensional proof of the geometric abelianization result; it uses no direct-image weight theorem.

Direct inputs: `ArithmeticGaloisRepresentations:R01.6`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.11 (1.11.1)–(1.11.5), pp. 184–186.

Declaration id: `DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy`.

<a id="dwp-5-hadamard-de-la-vallee-poussin"></a>

### The abstract Hadamard–de la Vallée-Poussin theorem

Let G be a locally compact extension of Γ=ℤ or ℝ by a compact group G⁰; in the ℤ case the center maps onto a finite-index subgroup of Γ, and in the ℝ case the extension is a product. Fix the norm character ω₁, a countable family of conjugacy classes with norms N_v>1, and absolute convergence of the trivial Euler product for real part >1. Regard L as a function on the representation Riemann surfaces r=ρ⊗ω_s. If it continues meromorphically to real part ≥1 and is holomorphic there except a simple pole at r=ω₁, then it has no zeros on real part 1 except possibly at one representation r=ω₁ε with ε a one-dimensional order-two character. The curve application excludes this exception by the connected double-cover zeta comparison. The norm-character translation is part of the statement, so imaginary twists are not incorrectly assigned separate pole conditions.

Atlas landmark: **Hadamard–de la Vallée-Poussin theorem**.

Proof or construction:

1. For Re(s)>1 expand negative logarithmic derivatives as sums of positive Dirac measures on powers of the local classes. Their boundary orders define an integer-valued functional ν on characters with ν(1)=1, ν(nontrivial)≤0, conjugation invariance and ν(ρ⊗ρ̄)≥0.
2. Use Peter–Weyl approximation and normalized compact Haar to test squares of class functions concentrated near the identity. The positivity relations force ν to be supported on at most one nontrivial quadratic character; import the exact finite 3,4,1 coefficient inequality from the arithmetic Dirichlet-series owner, not its whole application.
3. For a curve the quadratic character defines a connected finite étale double cover. Its zeta function and that of the curve both have a simple pole at t=q⁻¹ by the initial curve Weil estimate. Their ratio rules out the exceptional zero.

Acceptance checks:

- The theorem assumes continuation and the pole data for every relevant irreducible; positivity alone does not manufacture continuation.
- The possible quadratic exception belongs to the abstract theorem and is removed only in its curve application.

Direct inputs: [DWP.1/weil-estimate-for-curves](#dwp-1-weil-estimate-for-curves), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`, `FunctionFieldArithmetic:FA.5`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.1 (2.1.1)–(2.1.9), pp. 187–191; §2.2 Corollaire (2.2.9), pp. 195–196.

Declaration id: `DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin`.

<a id="dwp-5-compact-weil-form"></a>

### The compact form of Weil monodromy

Let X₀ be a normal geometrically connected scheme over 𝔽_q and G an algebraic-by-ℤ group satisfying Weil II (2.2.4): (a) its algebraic degree-zero kernel G⁰ is an extension of a finite group by a semisimple group; (b) a finite coefficient field E/ℚ_ℓ models G⁰ and the geometric Weil-group homomorphism is continuous and Zariski dense; (c) an algebraic representation gives an ι-mixed Weil sheaf and its restriction to G⁰ has finite kernel. Fix ι. Write Z_c for the center and choose a maximal compact subgroup U of the complex algebraic quotient G/Z_c. Define G_R as its inverse image in G_ℂ, with discrete degree; its degree-zero kernel is compact. Every local ιF_x has semisimple part conjugate to an element of G_R, uniquely up to G_R conjugacy. Restriction gives an equivalence between algebraic finite-dimensional representations of G and continuous finite-dimensional complex representations of G_R. For an irreducible representation r, use the source’s convention ω₁(g)=q^(−deg g) and |r(z)|=ω₁(z)^Re(r) for positive-degree central z. Its associated sheaf is ι-pure of weight −2Re(r), correcting the printed sign in (2.2.8)(i) and (3.5.1). Thus the scalar q^(τ deg) has Re(r)=−τ and weight 2τ.

Uses that determine the interface:

- DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound: interprets all irreducible Euler factors
- DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution: defines the measured degree-fibre conjugacy space

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.compactWeilForm` | constructor | The inverse image of the chosen maximal compact subgroup of the quotient by the central scalars. |
| `TauCeti.Weights.compactWeilForm.geometricKernel` | projection | The compact degree-zero subgroup and its normalized Haar probability. |
| `TauCeti.Weights.compactWeilForm.degree` | projection | The geometric-degree map to ℤ with central weight action retained. |
| `TauCeti.Weights.compactWeilForm.frobeniusClass` | constructor | The compact conjugacy class of the semisimple Frobenius part in its degree fibre. |
| `TauCeti.Weights.compactWeilForm.conjugacy_iff` | characterisation | Two elements of G_R conjugate in G_ℂ are conjugate in G_R. |
| `TauCeti.Weights.compactWeilForm.representationEquivalence` | equivalence | Algebraic representations of G correspond to continuous finite-dimensional representations of G_R, respecting tensor and dual operations. |
| `TauCeti.Weights.compactWeilForm.normExponent_weight` | compatibility | With ω₁=q^(−deg) as in (2.1.1), an irreducible norm exponent Re(r) gives sheaf weight −2Re(r). In particular ω₁ is the Tate line of weight −2. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.compact_constant_weight` | computation | For a constant pure line of weight β, degree n acts by q^(nβ/2) times a unit complex scalar; the degree-zero kernel is trivial. |
| `TauCeti.Weights.compact_elliptic` | compatibility | For full SL₂ geometric monodromy of H¹ of a nonisotrivial elliptic family, G_R is SU(2)×ℤ and (g,n) acts by q^(n/2)g. |
| `TauCeti.Weights.compact_jordan_part` | non-example | A unipotent Jordan arithmetic Frobenius of weight zero contributes its semisimple class 1; its unipotent part is not declared unitary. |
| `TauCeti.Weights.compact_normCharacter_sign` | non-example | The norm character ω₁=q^(−deg) has Re(ω₁)=1 but the associated Tate line has weight −2, excluding the printed +2Re formula. |

Proof or construction:

1. Use the general maximal-compact/complexification theorem for a semisimple complex group from the reductive and compact-group suppliers; construct the inverse image with the discrete-degree topology.
2. Central-degree scalar magnitudes and generalized majoration determine the eigenvalue moduli in a faithful mixed realization. The Jordan semisimple part can therefore be moved into the compact form.
3. Compact characters separate compact conjugacy classes and extend algebraically across complexification; this proves uniqueness and the representation equivalence, retaining the central scalar exponent.

Acceptance checks:

- The mixed representation with finite kernel on the geometric subgroup is an input; conjecture (1.2.9) is not used to supply it. The geometric subgroup may be disconnected; no faithfulness on the whole degree group is assumed.

Direct inputs: [DWP.5/geometric-monodromy-and-central-degree](#dwp-5-geometric-monodromy-and-central-degree), [DWP.5/generalized-majoration](#dwp-5-generalized-majoration), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.2 (2.2.1)–(2.2.8), pp. 192–195; corrected sign in (2.2.8)(i), p. 195.

Declaration id: `DeligneWeightsAndPurity:DWP.5/compact-weil-form`.

<a id="dwp-5-strict-initial-h1-bound"></a>

### The strict initial H¹ bound

For a smooth curve U₀/𝔽_q and a lisse sheaf punctually ι-pure of real weight β, every eigenvalue on H¹_c(U,ℱ) has ι-weight strictly less than β+2. This bound does not assert β+1; it is the analytic input to the square-improvement argument.

Proof or construction:

1. Normalize β to zero, pass to irreducible constituents and connected geometric monodromy using finite covers and component/base-extension comparisons. The real-envelope majoration constructs the compact form for the required mixed realization.
2. The trace formula gives meromorphic continuation of the representation Euler products. H⁰ and H²_c supply the prescribed trivial poles, and the initial cohomological estimates supply holomorphy to the boundary. Apply abstract Hadamard–de la Vallée-Poussin and exclude the quadratic exception by the connected double cover.
3. Nonvanishing for |t|≤q⁻¹ excludes numerator roots of weight 2; the initial bound already puts them at most 2. Restore the twist to get the strict inequality.

Acceptance checks:

- For a pure weight-zero coefficient, a nonconstant constituent of integer weight <2 has weight ≤1; the integer clause must be proved in the pencil application.

Direct inputs: [DWP.5/initial-curve-and-boundary-bounds](#dwp-5-initial-curve-and-boundary-bounds), [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin), [DWP.5/compact-weil-form](#dwp-5-compact-weil-form), [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.2 Corollaire (2.2.9), pp. 195–196; Corollaire (2.2.10), p. 196.

Declaration id: `DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound`.

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

Direct inputs: [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin), `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.1 (2.1.10)–(2.1.13), pp. 191–192.

Declaration id: `DeligneWeightsAndPurity:DWP.5/abstract-degree-equidistribution`.

## DWP.6 — Sharp curve purity by square improvement

On a product of curves, the coefficient-specific vanishing-cycle cases improve an error δ to δ/2. This argument uses the strict initial bound and local monodromy, without the later general direct-image theorem. Parabolic duality turns the limiting upper bound into purity; compact-support cohomology also retains lower-weight boundary terms.

<a id="dwp-6-coefficient-specific-vanishing-cycles"></a>

### Vanishing cycles with unipotent boundary coefficients

Let S₀ be a smooth projective surface, D₀ a strict normal-crossings divisor, V₀=S₀−D₀, and ℱ₀ a lisse sheaf on V₀ with unipotent local monodromy along D₀. Choose a pencil satisfying Weil II (3.1.1)(A)–(D), with each exceptional fibre having just one of the three indicated singularities. For j_!ℱ on the blown-up pencil, Φ^a vanishes for a≠1. At an ordinary node outside D, Φ¹=ℱ_x(−1)⊗ε(B), where ε(B) is the sign line on the two branches. At a tangency with D, or a transverse intersection of two branches of D, a locally constant graded boundary filtration gives Gr Φ¹=Gr ℱ_x⊗ε(B), with no Tate twist in these two cases.

Proof or construction:

1. Import blowup injectivity, the pencil Leray filtration, the vanishing-cycle triangle and ordinary nodal calculation from the geometric suppliers. For the node tensor that calculation with the locally constant stalk.
2. For tangency apply Φ to 0→j_!ℚ_ℓ→ℚ_ℓ→ℚ_(ℓ,D)→0; the two nearby points give their reduced permutation sign line in degree one.
3. For crossing use the normalization resolution 0→j_!ℚ_ℓ→ℚ_ℓ→i_*ℚ_(ℓ,D′)→ℚ_(ℓ,x)⊗ε(B)→0. The two smooth terms have no vanishing cycles, leaving the sign line in degree one.
4. Dévissage along a finite locally constant graded filtration of the unipotent coefficient gives the general cases. Preserve the arithmetic branch permutation; the sign line has weight zero.

Acceptance checks:

- The ordinary node raises weight by 2 through (−1); the tangency and crossing do not.
- A Frobenius exchange of branches gives scalar −1 on ε(B), which changes no weight.
- Pencil position hypotheses are explicit, including at most one exceptional point per fibre.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.2`, `LefschetzPencilsAndVanishingCycles:LPV.3`, `LefschetzPencilsAndVanishingCycles:LPV.4`, `EtaleDualityAndPerverseSheaves:EDC.4`, [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.1 (3.1.1)–(3.1.5), pp. 197–200.

Declaration id: `DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles`.

<a id="dwp-6-real-cohomological-factors"></a>

### Reality of curve cohomological factors

If U₀ is a smooth finite-field curve and ℱ₀ is lisse, punctually ι-pure of real weight β and ι-real, then each polynomial ι det(1−tF,Hⁱ_c(U,ℱ)) has real coefficients. Geometric connectedness is unnecessary after component and finite-extension descent.

Proof or construction:

1. The local Euler factors and the trace-formula rational function are real. H²_c has weight β+2, while H¹_c has weights strictly below β+2; thus its pole multiset is exactly the weight-(β+2) denominator roots and is conjugation invariant.
2. For affine components H⁰_c vanishes. For projective components express H⁰ as the dual of H² for ℱ∨(1), which is again pure and real, and obtain a real H⁰ polynomial.
3. The remaining numerator is real. Split geometric components over a finite extension and reassemble with Frobenius permutation as in (0.5); no cancellation between degrees is assumed without the strict bound.

Acceptance checks:

- The conclusion concerns polynomial coefficients, not real eigenvalues.
- Using the final sharp curve theorem here would make the square-improvement proof circular.

Direct inputs: [DWP.5/strict-initial-h1-bound](#dwp-5-strict-initial-h1-bound), [DWP.5/real-sheaves](#dwp-5-real-sheaves), [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 Proposition (3.2.1), Remarque (3.2.2), p. 200.

Declaration id: `DeligneWeightsAndPurity:DWP.6/real-cohomological-factors`.

<a id="dwp-6-square-improvement"></a>

### Square improvement on the product of a curve

For a smooth finite-field curve U₀ and lisse punctually ι-pure weight-zero ℱ₀, every eigenvalue α of H¹_c(U,ℱ) satisfies w_ι(α)≤1+2^(−k), for every integer k≥0. The step k→k+1 is proved on a pencil in the compactified surface U₀×U₀ and uses the three coefficient-specific vanishing-cycle cases; it is not a direct application of the general direct-image theorem.

Atlas landmark: **Square improvement**.

Proof or construction:

1. The initial bound supplies k=0. A finite surjective cover by a smooth curve makes boundary monodromy tame unipotent; pullback on compact-support cohomology is injective via the trace map over ℚ_ℓ. Finite base extension arranges general position and rational exceptional values; descend the result.
2. Put ℋ=ℱ⊠ℱ on the open product surface and blow up the pencil axis. Leray in total degree two has terms H²(ℙ¹,R⁰f_!ℋ), H¹(ℙ¹,R¹f_!ℋ), H⁰(ℙ¹,R²f_!ℋ). Blowup pullback is injective and Künneth embeds H¹_c(U,ℱ)⊗H¹_c(U,ℱ) in the abutment.
3. The real envelope ℋ⊕ℋ∨ is pure of weight zero and real. Reality of fibre cohomological polynomials makes the lisse R¹ a direct summand of an ι-real sheaf; generalized majoration supplies its finite pure-constituent filtration. The strict H¹ bound gives all constituent weights <2.
4. The five-term specialization sequence from Φ^a=0 for a≠1 shows R¹ has no sections supported at exceptional values. Intersect its lisse pure filtration with its injection into j_*j*R¹. Every nonconstant graded constituent has a nonzero exceptional quotient somewhere, since otherwise it extends lisse over simply connected ℙ¹ and is geometrically constant.
5. The local monodromy theorem and the three Φ¹ computations make each such nonconstant constituent weight an integer; hence its weight is ≤1. Apply the inductive bound to its H¹. Geometrically constant constituents contribute H¹=0. This bounds the middle Leray term by 2+2^(−k); invariant/coinvariant descriptions bound the two outer terms by 2.
6. The finite Leray filtration transfers the bound to α². Divide by two to get w_ι(α)≤1+2^(−k−1), with no degeneration or semisimplicity assumption.

Acceptance checks:

- The integer-weight step is essential: a real weight <2 need not be ≤1.
- The empty vanishing-cycle case yields a constant constituent and zero H¹, not a failed irreducibility argument.
- No theorem from DWP.7 is used in the proof of its own curve input.

Direct inputs: [DWP.6/coefficient-specific-vanishing-cycles](#dwp-6-coefficient-specific-vanishing-cycles), [DWP.6/real-cohomological-factors](#dwp-6-real-cohomological-factors), [DWP.5/generalized-majoration](#dwp-5-generalized-majoration), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/strict-initial-h1-bound](#dwp-5-strict-initial-h1-bound), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `LefschetzPencilsAndVanishingCycles:LPV.3`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 (3.2.4)–(3.2.14), pp. 201–204.

Declaration id: `DeligneWeightsAndPurity:DWP.6/square-improvement`.

<a id="dwp-6-sharp-curve-purity"></a>

### Purity of parabolic curve cohomology

Let C₀ be a smooth projective finite-field curve, j:U₀→C₀ a dense open, and ℱ₀ lisse and punctually ι-pure of real weight β. For i=0,1,2, every eigenvalue on Hⁱ(C,j_*ℱ) has ι-weight exactly β+i. In degree one this group is the image of H¹_c(U,ℱ)→H¹(U,ℱ). If ℱ is integer-pure for every embedding, the eigenvalues are algebraic Weil q-numbers of weight β+i.

Atlas landmark: **Curve purity theorem**.

Proof or construction:

1. The exact sequence j_!ℱ→j_*ℱ→boundary and square improvement give the upper bound β+1 in degree one by taking all k. The extreme degrees have exact weights β and β+2 from geometric invariants and coinvariants.
2. Apply the upper bound to ℱ∨(1), of weight −β−2. Frobenius-equivariant parabolic Poincaré duality identifies its H¹ eigenvalues with α⁻¹, giving −w_ι(α)≤−β−1. Combine both inequalities.
3. For integer purity run the argument for every embedding. The exact modulus at every complex embedding implies algebraicity and Weil purity by DWP.0’s all-embeddings characterization; the prescribed-embedding extension obligation is retained there. Finite ℓ-adic coefficients alone do not prove algebraicity over ℚ.

Acceptance checks:

- For constant coefficients on a smooth projective genus-g curve, H¹ has weight 1 and dimension 2g.
- For ℚ_ℓ(1) the H¹ weight is −1.
- Purity allows nonsemisimple arithmetic Frobenius.

Direct inputs: [DWP.6/square-improvement](#dwp-6-square-improvement), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`, [DWP.0/embeddings-into-the-complex-numbers](#dwp-0-embeddings-into-the-complex-numbers), [DWP.0/weil-number-iff-iota-pure-for-every-iota](#dwp-0-weil-number-iff-iota-pure-for-every-iota).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 Théorème (3.2.3), (3.2.5), (3.2.15), pp. 200–204; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Proposition 6.1.1 and proof, pp. 42–43.

Declaration id: `DeligneWeightsAndPurity:DWP.6/sharp-curve-purity`.

<a id="dwp-6-compact-support-curve-bound"></a>

### Compact-support bounds for pure curve coefficients

For a smooth finite-field curve U₀ and lisse punctually ι-pure real-weight-β ℱ₀, Hⁱ_c(U,ℱ) has only ι-weights ≤β+i, for i=0,1,2. For integer purity, these are algebraic integer-weight bounds for every complex conjugate. The parabolic image in degree one is pure β+1, while the extra boundary contribution has weights ≤β.

Atlas landmark: **Curve cohomology weight bound**.

Proof or construction:

1. Choose the smooth projective compactification. Local monodromy bounds j_*ℱ at the boundary by β. The exact sequence H⁰(boundary)→H¹_c(U,ℱ)→H¹(C,j_*ℱ) gives the required degree-one upper bound.
2. On affine components H⁰_c=0; on proper components H⁰ is the invariant space of weight β. H²_c is the coinvariant space (−1), of weight β+2. Handle components and finite base extension explicitly.
3. This curve theorem is the input to the geometric dévissage of general Rf_! in DWP.7, whose proof is imported there rather than duplicated here.

Acceptance checks:

- For ℚ_ℓ on 𝔾_m, H¹_c has weight 0 and H²_c has weight 2; H¹_c is not pure of weight 1.
- The result is valid for real ι-weights, not only integral weights.

Direct inputs: [DWP.6/sharp-curve-purity](#dwp-6-sharp-curve-purity), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`, [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 (3.2.3); §3.3 proof of (3.3.1), pp. 200, 204–205.

Declaration id: `DeligneWeightsAndPurity:DWP.6/compact-support-curve-bound`.

## DWP.10 — Arithmetic weight transport and equidistribution interfaces

Stable subquotients inherit weights, while rational factors and ℓ-independence require their own realization inputs. Nearby-cycle and Newton interfaces cite the later companion nodes precisely. Frobenius equidistribution uses cohomological bounds and geometric semisimplicity; full universal-family monodromy and its density application remain owner inputs.

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

Direct inputs: [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §1.2 (1.2.2), (1.2.3), (1.2.6)–(1.2.8), pp. 153–155.

Declaration id: `DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients`.

<a id="dwp-10-compatible-realization-export"></a>

### Compatible degree factors and point counts

For smooth projective X₀/𝔽_q, the WC.3 integral factors Π_i identify the Weil weight-i root multisets across every ℓ≠p, and WC.5 supplies the all-extension point-count estimate. The endpoint for a pure-dimensional scheme with geometric-component permutation σ is c_n(1+q^(nd)), with c_n=#Fix(σⁿ), rather than a universal single q^(nd). To export a compatible stable arithmetic subquotient, supply a normalized rational factor Q(T), independent of ℓ, whose image is exactly its Frobenius factor in every realization. Under that additional hypothesis its roots and weights agree across realizations; purity of the ambient space alone does not construct Q.

Proof or construction:

1. Import the canonical degree-factor theorem from WC.3 and the component-aware bound from WC.5. Use smooth-projective purity only as their weight input, not as a second proof of those owners’ targets.
2. For a supplied rational subquotient factor use the coefficient embeddings and the ambient purity theorem to transfer the common root multiset. Factor identification is an input; no arbitrary Hecke constituent is declared compatible.
3. Track geometric component permutation under each extension, and treat dimension zero by its exact finite-étale cycle formula.

Acceptance checks:

- A degree-two closed point has N_n=2 for even n and 0 for odd n.
- Even a rational ambient polynomial (T²−T+2) can have two different irrational linear subspace factors after splitting; choosing one does not supply a rational compatible factor.

Direct inputs: [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), [DWP.10/weight-transport-to-stable-subquotients](#dwp-10-weight-transport-to-stable-subquotients), `WeilConjectures:WC.3/degreewise-pure-factor-extraction`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`, `WeilConjectures:WC.5/all-extension-point-count-bound`, `WeilConjectures:WC.5/components-and-dimension-zero`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §1 (1.6)–(1.8), pp. 275–277; Weil II §3.3 (3.3.9), p. 207.

Declaration id: `DeligneWeightsAndPurity:DWP.10/compatible-realization-export`.

<a id="dwp-10-finite-residue-semistable-curve-weights"></a>

### Weights in the semistable curve filtration

For a proper semistable curve over a trait with finite residue field, import LPV.7’s Frobenius-equivariant normalization sequence and monodromy filtration of generic H¹ centered at 1. Its graded pieces H¹(Γ), ⊕H¹(Ỹ_v), H₁(Γ)(−1) have weights respectively 0,1,2. The graph may have a Frobenius permutation, and the normalized components may need finite residue-field extension; these change no weight. This is the finite-residue-field curve consequence, not a general mixed-characteristic weight–monodromy theorem.

Proof or construction:

1. The graph groups are subquotients of finite permutation modules, hence have root-of-unity eigenvalues of weight 0. Their (−1) twist has weight 2.
2. Apply initial curve purity to the smooth projective normalization components; after splitting them over a finite extension descend through the power comparison.
3. Import LPV.7’s exact filtration and N-factorization. We supply only Frobenius weights of its graded pieces; do not reconstruct the graph or the general monodromy filtration.

Acceptance checks:

- Split multiplicative genus-one reduction gives gr_0=ℚ_ℓ and gr_2=ℚ_ℓ(−1), weights 0,2, with gr_1=0.
- Good reduction gives only gr_1 of weight 1.
- A nonsplit node has an unramified sign character in the graph pieces; purity is unchanged.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`, [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §1.8 (1.8.4), pp. 175–176; the LPV.7 semistable-curve supplier identifies the three pieces.

Declaration id: `DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights`.

<a id="dwp-10-mixed-nearby-and-newton-exports"></a>

### Mixed nearby cycles and Newton restrictions

The arithmetic consumers use the already planned DWP.8 theorem that nearby-cycle cohomology sheaves of a mixed sheaf remain mixed, and its proper direct-image purity over ℤ[1/ℓ]. For an integral weight-w eigenvalue, DWP.7’s Newton couple (r,s) satisfies r+s=w and r,s≥0; its cohomological valuation triangles retain the separate compact-support/proper and smooth ordinary hypotheses. DWP.0 supplies the shared numeric Weil/ι-weight predicates to RD.6; RD.6 supplies its own F-isocrystal fibres and defines pointwise purity and mixedness there.

Proof or construction:

1. Import the existing companion nodes with their exact hypotheses and weight shifts. Do not infer a nearby-cycle weight upper bound from mixedness alone.
2. Apply the numeric root predicate in the p-adic coefficient field via field-homomorphism invariance; a p-adic realization does not create a second Weil-number definition.
3. For ordinary slopes 0,1 of weight-one curve H¹, compute Newton couples (0,1),(1,0). In the supersingular case compute (1/2,1/2).

Acceptance checks:

- The Tate line has weight −2 and slope −1, hence is not an integral coefficient example.
- Mixed nearby cycles need not be pure of a single weight.

Direct inputs: [DWP.8/nearby-cycles-preserve-mixedness-6-1-13](#dwp-8-nearby-cycles-preserve-mixedness-6-1-13), [DWP.8/variant-over-z-one-over-ell-6-2-7](#dwp-8-variant-over-z-one-over-ell-6-2-7), [DWP.7/newton-couples-3-3-7](#dwp-7-newton-couples-3-3-7), [DWP.7/valuation-triangles-3-3-8](#dwp-7-valuation-triangles-3-3-8), [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §3.3 (3.3.7)–(3.3.8), pp. 206–207; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Théorème (6.1.13), p. 246; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Variante (6.2.7), p. 248.

Declaration id: `DeligneWeightsAndPurity:DWP.10/mixed-nearby-and-newton-exports`.

<a id="dwp-10-frobenius-equidistribution"></a>

### Deligne’s Frobenius equidistribution theorem

In Weil II §2.2’s algebraic-by-ℤ monodromy setting, let X₀/𝔽_q be normal and geometrically connected of dimension N≥1, with the hypotheses (a)–(c) and compact form G_R of DWP.5 (finite kernel is required on the geometric subgroup). Let G_R^i denote degree-i conjugacy classes with the pushforward of normalized compact Haar. For a central z of positive degree d and fixed i, translate by z^(−n) the measure q^(−(nd+i)N) Σ_(x∈X₀(𝔽_(q^(nd+i)))) δ_[ιF_x,ss]. As n→∞ it converges weakly to Haar on the degree-i conjugacy fibre. The sum is over rational points with Frobenius powers, and normalization uses the base dimension N. This is Weil II (3.5.3), not Weil I’s estimate or density of individual Weil numbers.

Atlas landmark: **Frobenius equidistribution**.

Proof or construction:

1. For every irreducible continuous unitary representation of G_R, the corresponding algebraic representation gives a coefficient sheaf ι-pure of weight zero by the compact-form equivalence. Import DWP.7’s general compact-support bounds and its real-ι variant to continue its Euler product, with no zero or pole to the right of N−1/2 except the simple trivial norm-character pole at N. Normality/geometric connectedness identify the top-degree invariant contribution. Nonunitary central weights must be normalized before this analytic boundary is used.
2. Rescale the norm character to replace the abstract convergence boundary 1 by N and apply the degree-fibre equidistribution theorem.
3. Use (3.5.2.1): a degree-e closed point contributes e rational points when e divides m, each with local Frobenius F_x^(m/e). This identifies prime-power degree measures with the rational-point measure. Retain the central translation and every residue class i modulo d.

Acceptance checks:

- The constant test function has limiting integral 1; q^(−m) is correct only when N=1.
- Dimension zero is excluded: a single constant Frobenius orbit need not become Haar-distributed.
- Only semisimple conjugacy classes enter the measured space.

Direct inputs: [DWP.5/compact-weil-form](#dwp-5-compact-weil-form), [DWP.5/abstract-degree-equidistribution](#dwp-5-abstract-degree-equidistribution), [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), [DWP.8/geometric-semisimplicity-theorem-3-4-1-iii](#dwp-8-geometric-semisimplicity-theorem-3-4-1-iii), `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.5 (3.5.1)–(3.5.3), pp. 210–211.

Declaration id: `DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution`.

<a id="dwp-10-finite-field-sato-tate"></a>

### Finite-field Sato–Tate for elliptic families

Let E₀→C₀ be a smooth elliptic family over a smooth geometrically connected finite-field curve, with nonconstant j-invariant. Import the full SL₂ geometric monodromy theorem of Weil II (3.5.5) from its universal elliptic-family/modular-curve supplier. Then the normalized H¹ Frobenius classes lie in SU(2). Define θ_x∈[0,π] by eigenvalues q^(m/2)e^(±iθ_x) at x∈C₀(𝔽_(q^m)); #E_x(𝔽_(q^m))=1+q^m−2q^(m/2)cos θ_x. The measures q^(−m) Σ_x δ_(θ_x) converge to (2/π)sin²θ dθ. The printed density and point-count sign in (3.5.6)–(3.5.7) are corrected as the confirmed source issues record.

Atlas landmark: **Finite-field Sato–Tate**.

Proof or construction:

1. Import elliptic-family full geometric monodromy, including the level structure, finite-index fundamental-group image, and prime-to-p level hypothesis. The determinant q^m and compact-form comparison identify SU(2)×ℤ with action (g,m)↦q^(m/2)g.
2. Apply Frobenius equidistribution with N=1. Push Haar forward to the conjugacy angle using the compact-group Weyl integration supplier.
3. Check mass and trace moments explicitly: ∫(2/π)sin²θ=1; the normalized trace a=2cosθ has mean 0 and second moment 1. The Hasse interval is a∈[−2,2].

Acceptance checks:

- Constant j does not meet the full-monodromy hypothesis.
- The printed (1/(2π))sin²θ has mass 1/4 and is rejected.
- The minus point-count sign agrees with the cohomological trace formula.

Direct inputs: [DWP.10/frobenius-equidistribution](#dwp-10-frobenius-equidistribution), [DWP.5/compact-weil-form](#dwp-5-compact-weil-form), [DWP.1/compatibility-with-the-hasse-bound](#dwp-1-compatibility-with-the-hasse-bound), `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.5 (3.5.4)–(3.5.7), pp. 211–212.

Declaration id: `DeligneWeightsAndPurity:DWP.10/finite-field-sato-tate`.

<a id="dwp-10-weight-acceptance-suite"></a>

### The weight-facing acceptance suite

The common predicates and transports must reproduce: H^(2r)(ℙᴺ)=ℚ_ℓ(−r) of weight 2r and vanishing odd cohomology; H⁰(𝔾_m)=ℚ_ℓ of weight 0, H¹(𝔾_m)=ℚ_ℓ(−1) of weight 2, H¹_c(𝔾_m)=ℚ_ℓ of weight 0 and H²_c(𝔾_m)=ℚ_ℓ(−1) of weight 2; H¹ of a smooth projective genus-g curve of weight 1 with reciprocal pairs α_iα_(i+g)=q; the finite-residue-field semistable graded weights 0,1,2; and the component-aware all-extension point count. In Yu’s unitary Rankin–Selberg use, supplied Lafforgue correspondences make ℱ₁⊗ℱ₂∨ pure of weight zero; its proper curve cohomological factors have distinct weights 0,1,2 and cannot cancel. Correspondence construction, automorphic poles and functional equations remain with their existing owners.

Proof or construction:

1. Import explicit ℙᴺ/𝔾_m cohomology from EDC.3 and WC.7 rather than proving it again. Check each Tate sign against geometric Frobenius q⁻¹ on ℚ_ℓ(1).
2. Use initial curve purity and the alternating duality pairing for Yu’s σ_iσ_(i+g)=q bookkeeping, including multiplicity and odd/zero genus cases.
3. For the supplied pure Rankin–Selberg coefficient, use sharp proper curve purity and numeric disjoint-weight spectra. Import its Euler determinant formula and duality from WC.1/EDC.2; this proves only the weight input to Yu §6.1.1.
4. Import semistable weights and WC.5’s component formula; retain the strict difference between purity of projective cohomology and mixed compact-support cohomology.

Acceptance checks:

- For genus zero the H¹ root multiset is empty; paired-root claims are vacuous.
- The two curve roots of T²−T+2 have product 2, each weight 1, although neither is real.
- The compact-support 𝔾_m example rules out the false assertion that every smooth curve H¹_c is pure weight 1.

Direct inputs: [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), [DWP.6/sharp-curve-purity](#dwp-6-sharp-curve-purity), [DWP.10/weight-transport-to-stable-subquotients](#dwp-10-weight-transport-to-stable-subquotients), [DWP.10/finite-residue-semistable-curve-weights](#dwp-10-finite-residue-semistable-curve-weights), [DWP.10/compatible-realization-export](#dwp-10-compatible-realization-export), `EtaleDualityAndPerverseSheaves:EDC.3`, `WeilConjectures:WC.7`, `WeilConjectures:WC.1`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves`, [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner).

Sources: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu §1 pp. 2–3, Proposition 6.1.1 pp. 42–43, §7.1 p. 64; Weil II (3.2.3).

Declaration id: `DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite`.

## DWP.7 — The direct-image theorem, integrality and cohomological bounds

Sheaf/source and target dévissages reduce Rf_! to a tame relative curve. Sharp curve purity and local boundary bounds are imported from the preceding part. SGA 7 XXI supplies integrality through finite-stalk evaluation, the curve Euler product and dimension induction. Duality supplies lower weights; integrality supplies the valuation triangles.

<a id="dwp-7-weights-mixed-sheaves-definitions"></a>

### Weil II §1.2 weight conventions for DWP.7–DWP.9, imported from DWP.5

Let ℓ be a prime, X a scheme of finite type over ℤ[1/ℓ], and |X| its set of closed points; each x ∈ |X| has a finite residue field k(x) with N(x) = #k(x) prime to ℓ. A sheaf on X is a constructible ℚ̄_ℓ-sheaf (Weil II 1.1.1–1.1.3); when X is of finite type over 𝔽_q it may also be a Weil sheaf (Weil II 1.1.10). For x ∈ |X|, F_x is the geometric Frobenius of k(x) acting on the stalk ℱ_x̄ at a geometric point over x; its characteristic polynomial does not depend on the geometric point. DWP.7–DWP.9 use, with exactly this scope, the predicates that DWP.5 constructs: (a) ℱ is punctually pure of weight n ∈ ℤ when, for every x ∈ |X|, every eigenvalue of F_x on ℱ_x̄ is a Weil N(x)-number of weight n (DWP.0); (b) ℱ is mixed when it has a finite filtration by subsheaves whose successive quotients are punctually pure; the weights of the nonzero quotients are the punctual weights of ℱ, and 'mixed of weights ≤ n' (resp. '≥ n') means that all punctual weights are ≤ n (resp. ≥ n); (c) for a field isomorphism ι : ℚ̄_ℓ ≅ ℂ and β ∈ ℝ, ℱ is punctually ι-pure of weight β when every eigenvalue α of every F_x has ι-weight 2 log_{N(x)} |ια| = β, and ℱ is ι-mixed when it has a finite filtration with punctually ι-pure successive quotients, its punctual ι-weights being those of the nonzero quotients. The zero sheaf is punctually pure of every weight and mixed with empty set of weights. The stabilities of Weil II (1.2.5) hold for (a)–(c): subsheaves, quotients, extensions, inverse images along any morphism of schemes of finite type over ℤ[1/ℓ], direct images along finite morphisms and tensor products (weights add); the dual of a lisse punctually pure sheaf of weight n has weight −n; ℚ̄_ℓ(1) is punctually pure of weight −2, so a Tate twist ℱ(r) shifts weights by −2r. For a morphism Y → S and a closed point s ∈ |S|, the closed points of the fibre Y_s are closed points of Y with the same residue fields, so restriction to Y_s preserves (a)–(c). A mixed sheaf is ι-mixed for every ι, with ι-weights its integer weights.

Hypotheses and scope:

- ℓ invertible on every scheme considered; all schemes of finite type over ℤ[1/ℓ], so that closed points have finite residue fields
- Integer weights in (a)–(b), real ι-weights in (c); 'mixed' always means the integer-weight, all-embeddings notion
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. The predicates and the stabilities (1.2.5) are DWP.5's constructions on the sheaves of EDC.0; this node pins the scope (schemes of finite type over ℤ[1/ℓ], not only over 𝔽_q) that Weil II 3.3.1 needs, so that DWP.5 plans them in that scope.
2. Restriction to fibres over closed points: a closed point of Y_s is closed in Y because Y_s → Y is a closed immersion and s is closed; residue fields agree, so the Frobenius elements agree and each predicate passes to the fibre.
3. Mixed implies ι-mixed: a Weil N(x)-number of weight n has ι-weight n for every ι (DWP.0/iota-weight).

Acceptance checks:

- Acceptance: the constant sheaf ℚ̄_ℓ on Spec 𝔽_q is punctually pure of weight 0, ℚ̄_ℓ(1) of weight −2 and ℚ̄_ℓ(−1) of weight 2.
- Acceptance: the rank-two Weil sheaf on Spec 𝔽_q on which F acts by the Jordan block [[q, 1], [0, q]] is punctually pure of weight 2: weights read eigenvalues, not Jordan blocks.
- Acceptance: on Spec 𝔽_q the rank-one Weil sheaf on which F acts by a transcendental b ∈ ℚ̄_ℓ with |ιb| = q for one ι is ι-pure of weight 2 for that ι but not mixed: ι-purity at one ι does not give algebraicity.

Direct inputs: [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight), [DWP.0/weil-number-iff-iota-pure-for-every-iota](#dwp-0-weil-number-iff-iota-pure-for-every-iota), `EtaleDualityAndPerverseSheaves:EDC.0`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Définition (1.2.2), p. 153; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Notations et conventions, (0.1), p. 144.

Declaration id: `DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions`.

<a id="dwp-7-integral-sheaf"></a>

### Integral sheaves

Let X be a scheme of finite type over ℤ[1/ℓ]. A sheaf ℱ on X is integral (entier) when, for every closed point x ∈ |X|, every eigenvalue of the geometric Frobenius F_x on the stalk ℱ_x̄ is integral over ℤ. For a finite-dimensional ℚ̄_ℓ-space V with an endomorphism F the analogous predicate is: (V, F) is integral when every root of det(T − F) in ℚ̄_ℓ is integral over ℤ; a sheaf on Spec 𝔽_q is integral exactly when its geometric-Frobenius module is. Integrality is a condition separate from purity: ℚ̄_ℓ(1) is pure of weight −2 and not integral.

Hypotheses and scope:

- X of finite type over ℤ[1/ℓ]; ℚ̄_ℓ coefficients
- Integral over ℤ, not over ℤ_ℓ: ℓ-adic integrality of the eigenvalues is automatic for étale sheaves and is not what is meant
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses that determine the interface:

- Weil II Corollaire (3.3.3), p. 205: the integral refinement of the direct-image theorem: weights of R^i f_!ℱ lie between 0 and n+i, and between 2(i−d) and n+i above the fibre dimension
- Weil II Corollaire (3.3.4), p. 206: the lower bounds w ≥ 0 and w ≥ 2(i−d) for H^i_c of an integral sheaf over 𝔽_q
- Weil II (3.3.7)–(3.3.8), p. 206: the p-adic couples (r, s) of an integral eigenvalue are ≥ 0, which places them in the triangles
- DeligneWeightsAndPurity:DWP.7/deligne-integrality-theorem-sga7-xxi: the integrality theorem is a statement about this predicate on R^i f_!ℱ and on R^i f_!ℱ(i−d)
- FiniteFieldsAndCharacterSums:FF.2/deligne-estimate-for-character-sums: character sheaves L_ψ(f) ⊗ L_χ(g) are integral (their Frobenius traces are sums of roots of unity), so their H^i_c have weights ≥ 0

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.IsIntegralEnd` | data | IsIntegralEnd (F : V →ₗ[E] V) : Prop := ∀ α ∈ eigenvalues F, IsIntegral ℤ α, for E a field of characteristic 0 and V finite-dimensional, with eigenvalues F the DWP.0 multiset of roots of the characteristic polynomial in an algebraic closure. |
| `TauCeti.Weights.IsIntegralSheaf` | data | IsIntegralSheaf ℱ : Prop := ∀ x ∈ \|X\|, IsIntegralEnd (F_x acting on ℱ_x̄). |
| `TauCeti.Weights.isIntegralEnd_iff_charpoly` | characterisation | IsIntegralEnd F ↔ every root of det(T − F) in an algebraic closure is integral over ℤ; when det(T − F) has rational coefficients this holds iff it has integer coefficients. |
| `TauCeti.Weights.IsIntegralEnd.of_extension` | other | For an F-stable subspace W ⊆ V: IsIntegralEnd F ↔ IsIntegralEnd (F\|W) ∧ IsIntegralEnd (F on V/W). |
| `TauCeti.Weights.IsIntegralEnd.pow` | other | IsIntegralEnd F → IsIntegralEnd (F ^ r) for r ≥ 1, and conversely: an algebraic number with an integral power is integral. |
| `TauCeti.Weights.IsIntegralEnd.tensor` | other | IsIntegralEnd F → IsIntegralEnd G → IsIntegralEnd (F ⊗ G). |
| `TauCeti.Weights.IsIntegralSheaf.comap` | functoriality | Pullback along any morphism of schemes of finite type over ℤ[1/ℓ] preserves integrality. |
| `TauCeti.Weights.IsIntegralSheaf.finite_pushforward` | functoriality | Direct image along a finite morphism preserves integrality. |
| `TauCeti.Weights.IsIntegralSheaf.twist_neg` | simp | ℱ integral and m ≥ 0 ⇒ ℱ(−m) integral; the converse fails for m > 0. |
| `TauCeti.Weights.IsIntegralSheaf.weights_nonneg` | relation | An integral mixed sheaf has all punctual weights ≥ 0 (Weil II 3.3.2): the norm of an integral Weil q-number of weight n and degree d is a nonzero integer of absolute value q^{nd/2} (DWP.0/weil-number-arithmetic (iv)). |
| `TauCeti.Weights.IsIntegralSheaf.constant` | example | The constant sheaf ℚ̄_ℓ is integral; so is every sheaf ℱ whose Frobenius traces at all closed points of all finite extensions are algebraic integers. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isIntegralEnd_tate_neg_one` | computation | On Spec 𝔽_q, ℚ̄_ℓ(−1) (F acts by q) is integral: q is an algebraic integer. |
| `TauCeti.Weights.not_isIntegralEnd_tate_one` | non-example | On Spec 𝔽_q, ℚ̄_ℓ(1) (F acts by q⁻¹) is not integral although it is punctually pure of weight −2: purity does not imply integrality. |
| `TauCeti.Weights.not_isIntegralEnd_weight_zero` | non-example | For ℓ ≠ 5, the rank-one Weil sheaf on Spec 𝔽_q on which F acts by b = (3 + 4i)/5 is punctually pure of weight 0 (every complex conjugate of b has absolute value 1) but not integral: b is not an algebraic integer. A definition 'integral = weights ≥ 0' fails this test. |
| `TauCeti.Weights.isIntegralEnd_zero` | degenerate | The zero sheaf, and the zero Frobenius module, are integral. |
| `TauCeti.Weights.isIntegralEnd_jordan` | computation | The Frobenius module (ℚ̄_ℓ², [[q, 1], [0, q]]) is integral: integrality reads the characteristic polynomial (T − q)², not a diagonal form. |

Proof or construction:

1. Define the stalkwise predicate on Frobenius modules first, through the eigenvalue multiset of DWP.0/endomorphism-weights, and the sheaf predicate as its conjunction over |X|.
2. Stability under subsheaves, quotients and extensions: the eigenvalue multiset of an extension is the union of those of sub and quotient (DWP.0/characteristic-polynomial-in-short-exact-sequences via DWP.0/purity-under-subquotients-and-extensions).
3. Pullback along g : Y → X: for y ∈ |Y| over x, F_y acts on (g*ℱ)_ȳ = ℱ_x̄ as F_x^{[k(y):k(x)]}; powers of algebraic integers are algebraic integers. Finite direct image: the stalk of f_*ℱ at y is the sum of the induced modules of the stalks at the points over y, whose Frobenius eigenvalues are roots of the eigenvalues at those points (DWP.0/spectra-of-polynomials-in-an-endomorphism), and roots of algebraic integers are algebraic integers.
4. Tensor products: eigenvalues multiply (DWP.0/spectra-of-tensor-products-and-duals). Twist ℱ(−m), m ≥ 0: eigenvalues multiply by N(x)^m.

Acceptance checks:

- The predicate depends only on the eigenvalue multisets at closed points, hence is invariant under change of the geometric points and of the algebraic closure.
- Weil II 3.3.2: an integral mixed sheaf has all punctual weights ≥ 0 (api IsIntegralSheaf.weights_nonneg).

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.3, (3.3.2), p. 205.

Declaration id: `DeligneWeightsAndPurity:DWP.7/integral-sheaf`.

<a id="dwp-7-devissage-in-the-sheaf-and-the-source"></a>

### Dévissages (a), (b), (f) of the direct-image theorem

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] and n ∈ ℤ. Say that a sheaf ℱ on X satisfies P_n(f) when R^i f_!ℱ is mixed of weights ≤ n + i for every i. (a) For an exact sequence 0 → ℱ′ → ℱ → ℱ″ → 0: P_n(f) for ℱ′ and ℱ″ implies P_n(f) for ℱ; P_n(f) for ℱ and ℱ″ implies P_n(f) for ℱ′; if the sequence splits, P_n(f) for ℱ implies P_n(f) for ℱ′. (b) If j : U → X is open with closed complement i : S → X, then P_n(f∘j) for j*ℱ and P_n(f∘i) for i*ℱ imply P_n(f) for ℱ. (f) If f is quasi-finite and ℱ is punctually pure of weight m, then f_!ℱ = R⁰f_!ℱ is punctually pure of weight m and R^i f_!ℱ = 0 for i ≠ 0; hence, by (a), every mixed ℱ of weights ≤ n satisfies P_n(f) when f is quasi-finite. The same statements hold with 'mixed of weights ≤ n + i' replaced by 'ι-mixed of ι-weights ≤ β + i' (β ∈ ℝ) and, for X over 𝔽_q, for Weil sheaves.

Hypotheses and scope:

- f separated of finite type, so that Rf_! = Rf̄_* ∘ j_! for a compactification (EDC.0)
- (f) needs quasi-finiteness of f, not only finite fibres over closed points
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (a) Apply the long exact sequence of R^•f_!. For the second clause, R^i f_!ℱ′ is an extension of a subsheaf of R^i f_!ℱ by a quotient of R^{i−1}f_!ℱ″, which is mixed of weights ≤ n + i − 1 ≤ n + i; conclude by the stabilities of DWP.7/weights-mixed-sheaves-definitions. In the split case R^i f_!ℱ′ is a direct summand of R^i f_!ℱ.
2. (b) Apply (a) to 0 → j_!j*ℱ → ℱ → i_*i*ℱ → 0 with Rf_!j_! = R(fj)_! and Rf_!i_* = R(fi)_! (EDC.0).
3. (f) For f quasi-finite and separated, R^i f_! = 0 for i ≠ 0 and the stalk of f_!ℱ at a geometric point ȳ over y ∈ |Y| is ⊕_{x ↦ y} Ind(ℱ_x̄), the sum over the closed points x of the fibre of the modules induced from ⟨F_x⟩ = ⟨F_y^{d_x}⟩, d_x = [k(x) : k(y)] (proper base change, SF.2). The eigenvalues of F_y on an induced module are the d_x-th roots of the eigenvalues of F_x, and α^{d} is a Weil N(y)^{d}-number of weight m iff α is a Weil N(y)-number of weight m (DWP.0/weil-number-base-extension); N(x) = N(y)^{d_x}.
4. The ι-variant uses the same steps with DWP.0/iota-weight, which satisfies w_{q^r}(α^r) = w_q(α).

Acceptance checks:

- Acceptance: for f = id the class P_n contains exactly the sheaves mixed of weights ≤ n.
- Acceptance: for the finite étale double cover Spec 𝔽_{q²} → Spec 𝔽_q and ℱ = ℚ̄_ℓ, f_*ℚ̄_ℓ has F-eigenvalues ±1 (weight 0), not 1 with multiplicity 2: (f) computes induced modules, not sums of copies.
- Non-example: (a) does not give P_n for ℱ″ from P_n for ℱ and ℱ′ (the connecting map R^i f_!ℱ″ → R^{i+1}f_!ℱ′ raises degree, so it only gives the weaker bound n + i + 1): this direction is not claimed.

Direct inputs: [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`, [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension), [DWP.0/iota-weight](#dwp-0-iota-weight).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.1) a), b), f), p. 204; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.1) f), p. 204.

Declaration id: `DeligneWeightsAndPurity:DWP.7/devissage-in-the-sheaf-and-the-source`.

<a id="dwp-7-devissage-in-the-target"></a>

### Dévissages (c), (d), (e) of the direct-image theorem

Keep the notation P_n(f) of DWP.7/devissage-in-the-sheaf-and-the-source. (c) Let j : V → Y be open with closed complement i : T → Y, and f_V, f_T the base changes of f. Then ℱ satisfies P_n(f) iff ℱ|X_V satisfies P_n(f_V) and ℱ|X_T satisfies P_n(f_T). More generally, a sheaf 𝒢 on Y is mixed of weights ≤ m iff 𝒢|V and 𝒢|T are. (d) If f = g ∘ h with h : X → Z and g : Z → Y separated of finite type, and R^p g_! R^q h_!ℱ is mixed of weights ≤ n + p + q for all p, q, then ℱ satisfies P_n(f); in particular P_n(h) for ℱ together with P_{n+q}(g) for every R^q h_!ℱ implies P_n(f). (e) If g : Y′ → Y is a universal homeomorphism (integral, radicial, surjective), f′ : X′ → Y′ the base change and ℱ′ the pullback of ℱ, then ℱ satisfies P_n(f) iff ℱ′ satisfies P_n(f′); examples: Y′ = Y_red, and for Y normal integral, the normalisation of Y in a purely inseparable extension of its function field. The same statements hold for ι-mixed sheaves with real weights.

Hypotheses and scope:

- Separated finite-type morphisms over ℤ[1/ℓ]
- (e): a universal homeomorphism induces an equivalence of étale sites and isomorphisms of residue fields at closed points (finite fields are perfect)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (c) Proper base change for Rf_! (SF.2, EDC.0) identifies (R^i f_!ℱ)|V = R^i f_{V!}(ℱ|X_V) and (R^i f_!ℱ)|T = R^i f_{T!}(ℱ|X_T). For a sheaf 𝒢, 0 → j_!j*𝒢 → 𝒢 → i_*i*𝒢 → 0 is exact and j_!, i_* preserve mixedness and weights (extension by zero and closed pushforward do not change the nonzero stalks), so 𝒢 is an extension of mixed sheaves of weights ≤ m.
2. (d) The Leray spectral sequence E_2^{pq} = R^p g_! R^q h_!ℱ ⇒ R^{p+q} f_!ℱ (EDC.0) has finitely many nonzero terms; E_∞^{pq} is a subquotient of E_2^{pq}, hence mixed of weights ≤ n + p + q, and R^k f_!ℱ has a finite filtration with quotients E_∞^{p,k−p}.
3. (e) Topological invariance of the étale site (SF.2) gives Rf′_!ℱ′ = g*Rf_!ℱ; g is a bijection on closed points with equal finite residue fields, so a sheaf 𝒢 on Y is mixed of weights ≤ m iff g*𝒢 is.

Acceptance checks:

- Acceptance: for Y = Spec ℤ[1/ℓ], (c) reduces P_n(f) to its restrictions over dense opens and finitely many closed points 𝔽_p.
- Acceptance: the Frobenius twist Y′ = Y over 𝔽_p (absolute Frobenius) is a universal homeomorphism, and (e) is compatible with it.
- Non-example: (c) is false with an arbitrary open cover replaced by a single dense open: weights over T are not controlled by those over V.

Direct inputs: [DWP.7/devissage-in-the-sheaf-and-the-source](#dwp-7-devissage-in-the-sheaf-and-the-source), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.1) c), d), e), p. 204; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.1) e), p. 204.

Declaration id: `DeligneWeightsAndPurity:DWP.7/devissage-in-the-target`.

<a id="dwp-7-tame-cover-of-a-lisse-sheaf-on-a-curve"></a>

### Generic smoothness and tame covers of a lisse sheaf on a curve (Weil II (α), (β))

Let K be a field in which ℓ is invertible, C a separated K-scheme of finite type of dimension 1, and ℱ a lisse ℚ̄_ℓ-sheaf on C. After replacing K by a finite purely inseparable extension (none is needed if K is perfect): (α) there is a finite set Σ of closed points of C_red such that C′ = C_red − Σ is smooth over K; (β) there are a smooth projective curve D̄ over K, a reduced divisor E ⊂ D̄ étale over K, and a finite étale surjective morphism u : D = D̄ − E → C′ such that u*ℱ is tamely ramified along E, and ℱ|C′ is a direct summand of u_*u*ℱ = Ru_*u*ℱ.

Hypotheses and scope:

- ℓ invertible in K; ℱ lisse on C; C of dimension 1
- The direct-summand statement uses ℚ̄_ℓ coefficients: the trace u_*u* → id composed with the adjunction is multiplication by the degree on each component, invertible in ℚ̄_ℓ
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Work first over the perfect closure K^perf (K itself if perfect). Remove all zero-dimensional components and the finitely many nonsmooth points of the reduced one-dimensional components. The remaining C′ is a smooth curve.
2. The lisse sheaf has a continuous representation with a stable O_A-lattice for a finite extension A/ℚ_ℓ (EDC.0). The congruence subgroup ker(GL_r(O_A) → GL_r(O_A/ℓ²)) is open and pro-ℓ. Its inverse image defines a finite étale surjective cover u : D → C′, separately on each component.
3. Over K^perf use the smooth projective models of the components of D (tauceti AlgebraicCurves layer 12). Their finite reduced boundaries E are étale over this perfect field. At each boundary trait wild inertia is pro-p (or trivial in characteristic zero); its continuous image in the pro-ℓ congruence subgroup is trivial since p ≠ ℓ. Thus u*ℱ is tame (LPV.1, the geometric-trait inertia request below).
4. Descend the finite-presentation data C′, u, D̄ and E to some finite purely inseparable K′/K. Enlarge K′ if needed so that smoothness, properness, the open immersion D ⊂ D̄, the finite étale surjective cover and the étale boundary hold there. Topological invariance of the étale site under purely inseparable base change identifies the sheaves and inertia actions and preserves tameness (SF.2). This does not assert that K′ is perfect.
5. For u finite étale, u_* = u_! = Ru_*; the composite of adjunction and trace is multiplication by the componentwise degree, invertible in ℚ̄_ℓ. Divide the trace by that degree to split ℱ|C′ → u_*u*ℱ.

Acceptance checks:

- Acceptance: for K = 𝔽_q, C = 𝔾_m and ℱ the Kummer sheaf of a character of order prime to p, u can be taken to be the identity: ℱ is already tame at 0 and ∞.
- Acceptance: for the Artin–Schreier sheaf L_ψ on 𝔸¹_{𝔽_p}, which is wildly ramified at ∞, u is a nontrivial cover (its pullback to the Artin–Schreier cover y^p − y = x becomes trivial, hence tame).
- Non-example: over K = 𝔽_p(t), the regular curve C = Spec K[x,y]/(y^p−t) is nowhere smooth over K, since its constant field is purely inseparable over K. After K′=K(t^{1/p}) and reduction, it becomes 𝔸¹_{K′}. Thus the purely inseparable extension in (α) cannot be omitted; a curve that is merely nonsmooth at finitely many points would not test this necessity.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.0`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, proof of (3.3.1), p. 205.

Declaration id: `DeligneWeightsAndPurity:DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`.

<a id="dwp-7-spreading-out-to-a-tame-relative-curve"></a>

### Reduction of the direct-image theorem to a tame smooth projective relative curve

Assume Theorem 3.3.1 holds for every quadruple (f̄, D, ℱ, Y) of the following kind: Y is an integral regular scheme of finite type over ℤ[1/ℓ] (the source's 'Y_red lisse'); f̄ : X̄ → Y is projective and smooth of pure relative dimension 1; D ⊂ X̄ is a divisor finite étale over Y; X = X̄ − D with f = f̄|X; and ℱ is a lisse sheaf on X, punctually pure of weight n and tamely ramified along D. Then Theorem 3.3.1 holds for every separated morphism of schemes of finite type over ℤ[1/ℓ] and every sheaf mixed of weights ≤ n. The same reduction holds for ι-mixed sheaves with real weights.

Hypotheses and scope:

- Separated finite-type morphisms over ℤ[1/ℓ]
- Noetherian induction on Y and induction on the relative dimension of f
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Dévissages (b), (c), (d) reduce to f of relative dimension ≤ 1: factor f locally on X through an affine space over Y, decompose by coordinate projections into morphisms of relative dimension ≤ 1, and use (d); (f) disposes of relative dimension 0. Dévissages (a), (b) reduce to ℱ lisse and punctually pure of weight n on X, by the defining filtration of a mixed sheaf and a stratification of X on whose strata ℱ is lisse.
2. By (c) and noetherian induction on Y it suffices to prove the conclusion over a dense open of each irreducible component of Y. Let η be a generic point of Y and apply DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve to the generic fibre X_η and ℱ|X_η, after a finite purely inseparable extension of k(η).
3. Spread out C′, D̄, E, u and the direct-summand splitting to a dense open of the normalisation of Y_red in that purely inseparable extension, by finite-presentation limit arguments for polarised relative curves (tauceti ModularCurves 0E, AdicCoefficientsAndComparisons L2); shrink so that the open is regular (the regular locus of an excellent integral scheme is a dense open) and D̄ → Y is projective and smooth, E finite étale, u finite étale and u*ℱ tamely ramified along E (tameness spreads out from the generic points of E because the ramification is controlled by the pro-ℓ monodromy group Γ of the previous node).
4. By (e) the purely inseparable base change is harmless; by (b), (f), (a) the finitely many points removed in (α) do not matter and ℱ|C′ may be replaced by its summand-carrier u_*u*ℱ, i.e. by u*ℱ on D, since Rf_!u_* = R(fu)_!.

Acceptance checks:

- Acceptance: for f : 𝔸² → 𝔸¹ a coordinate projection over 𝔽_q and ℱ = ℚ̄_ℓ, the reduced situation is X̄ = ℙ¹_{𝔸¹}, D = ∞ × 𝔸¹, ℱ = ℚ̄_ℓ.
- Acceptance: the reduction keeps Y of finite type over ℤ[1/ℓ], so it applies to schemes over ℤ[1/ℓ] with characteristic-zero generic points, where tameness is automatic.
- Non-example: the reduction does not assume f̄ proper from the start; a nonproper X is compactified only after the reduction to a relative curve.

Direct inputs: [DWP.7/devissage-in-the-sheaf-and-the-source](#dwp-7-devissage-in-the-sheaf-and-the-source), [DWP.7/devissage-in-the-target](#dwp-7-devissage-in-the-target), [DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve](#dwp-7-tame-cover-of-a-lisse-sheaf-on-a-curve), `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, proof of (3.3.1), p. 205; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, proof of (3.3.1), p. 205.

Declaration id: `DeligneWeightsAndPurity:DWP.7/spreading-out-to-a-tame-relative-curve`.

<a id="dwp-7-purity-of-the-relative-curve-case"></a>

### The direct-image theorem for a tame smooth projective relative curve

In the reduced situation of DWP.7/spreading-out-to-a-tame-relative-curve (f̄ : X̄ → Y projective and smooth of pure relative dimension 1 over an integral regular Y of finite type over ℤ[1/ℓ], j : X = X̄ − D → X̄ with i : D → X̄ the inclusion of a divisor finite étale over Y, and ℱ lisse on X, punctually pure of weight n and tamely ramified along D), R^i f_!ℱ is mixed of weights ≤ n + i for every i. More precisely Rf_!ℱ = Rf̄_*(j_!ℱ); R^i f̄_*(j_*ℱ) is punctually pure of weight n + i; and i*j_*ℱ carries the filtration induced by the local monodromy filtration M along D, with Gr^M_k(i*j_*ℱ) zero for k > 0 and punctually pure of weight n + k on D for k ≤ 0. The ι-version holds with n replaced by β ∈ ℝ.

Hypotheses and scope:

- f̄ projective smooth of relative dimension 1; D finite étale over Y; ℱ tamely ramified along D
- Used for every isomorphism ι : ℚ̄_ℓ ≅ ℂ to obtain integer weights
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Proper base change and tameness: because D is finite étale over Y and ℱ is tame along D, the formation of j_*ℱ, i*j_*ℱ and the local monodromy filtration M commutes with passage to the fibres X̄_y, y ∈ |Y| (Weil II 1.8.6–1.8.8, imported from DWP.5; base change of j_* for tame sheaves along a relative divisor with normal crossings, EDC.0/SF.2). So R^i f̄_*(j_*ℱ) and i*j_*ℱ may be computed fibrewise.
2. On each fibre, a smooth projective curve over the finite field k(y) with a lisse sheaf punctually ι-pure of weight n on the complement of D_y: DWP.6's theorem (Weil II 3.2.3), applied for every ι, gives that H^i(X̄_ȳ, j_*ℱ) is punctually pure of weight n + i.
3. DWP.5's local weight theorem (Weil II 1.8.4 with 1.8.8, for every ι) gives that Gr^M_k(i*j_*ℱ) vanishes for k > 0 and is punctually pure of weight n + k ≤ n on D.
4. Apply R f̄_* to 0 → j_!ℱ → j_*ℱ → i_*i*j_*ℱ → 0. Since f̄∘i : D → Y is finite, dévissage (f) shows R^q(f̄ i)_*(i*j_*ℱ) vanishes for q ≠ 0 and R⁰ is mixed of weights ≤ n. The long exact sequence then gives R^q f̄_*(j_!ℱ) as an extension of a subsheaf of R^q f̄_*(j_*ℱ) (weight n + q) by a quotient of R^{q−1}(f̄ i)_*(...) (weights ≤ n ≤ n + q), which is mixed of weights ≤ n + q by dévissage (a).

Acceptance checks:

- Acceptance: for Y = Spec 𝔽_q, X̄ = ℙ¹, D = {0, ∞} and ℱ = ℚ̄_ℓ: H¹_c(𝔾_m) = ℚ̄_ℓ (weight 0 ≤ 1), H²_c(𝔾_m) = ℚ̄_ℓ(−1) (weight 2): the bound is an upper bound, attained only in degree 2.
- Acceptance: for an elliptic curve E over 𝔽_q minus its origin and ℱ = ℚ̄_ℓ: H¹_c = H¹(E) is pure of weight 1.
- Non-example: without tameness along D the formation of j_*ℱ need not commute with base change to the fibres, and the fibrewise computation is not available.

Direct inputs: [DWP.7/spreading-out-to-a-tame-relative-curve](#dwp-7-spreading-out-to-a-tame-relative-curve), [DWP.7/devissage-in-the-sheaf-and-the-source](#dwp-7-devissage-in-the-sheaf-and-the-source), [DWP.6/sharp-curve-purity](#dwp-6-sharp-curve-purity), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, proof of (3.3.1), p. 205; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, proof of (3.3.1), p. 205.

Declaration id: `DeligneWeightsAndPurity:DWP.7/purity-of-the-relative-curve-case`.

<a id="dwp-7-fundamental-direct-image-theorem-3-3-1"></a>

### Deligne's fundamental theorem: R^i f_! of a mixed sheaf of weights ≤ n has weights ≤ n + i

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] and ℱ a sheaf on X, mixed of weights ≤ n. Then for every i the sheaf R^i f_!ℱ on Y is mixed of weights ≤ n + i. In particular, for X₀ of finite type over 𝔽_q, Y₀ = Spec 𝔽_q and ℱ₀ mixed of weights ≤ n (a Weil sheaf being allowed), every eigenvalue α of the geometric Frobenius F on H^i_c(X, ℱ) is an algebraic number for which there is an integer w ≤ n + i with |σ(α)| = q^{w/2} for every field embedding σ : ℚ(α) → ℂ.

Hypotheses and scope:

- f separated of finite type over ℤ[1/ℓ] (both characteristic p and mixed characteristic bases)
- ℱ mixed: integer weights in the all-embeddings sense
- Only an upper bound: no lower bound and no purity is asserted
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Fundamental theorem of Weil II**.

Proof or construction:

1. By DWP.7/spreading-out-to-a-tame-relative-curve it suffices to treat the tame smooth projective relative curve, which is DWP.7/purity-of-the-relative-curve-case.
2. The finite-field case is the case Y = Spec 𝔽_q; H^i_c(X, ℱ) is the geometric stalk of R^i f_!ℱ, with F acting as the geometric Frobenius of the closed point (Weil-sheaf variant: Weil II 1.1.10–1.1.14, DWP.5).
3. A sheaf on Spec 𝔽_q mixed of weights ≤ n + i is a Frobenius module whose eigenvalues are Weil q-numbers of integer weights ≤ n + i (DWP.0/weil-q-number).

Acceptance checks:

- Acceptance: X₀ = 𝔾_m, ℱ₀ = ℚ̄_ℓ: weights 0 on H¹_c and 2 on H²_c, both ≤ i.
- Acceptance: X₀ = Spec 𝔽_q ⊔ Spec 𝔽_q, ℱ₀ = ℚ̄_ℓ(1): H⁰_c = ℚ̄_ℓ(1)² has weight −2 ≤ −2 + 0.
- Acceptance (relative, mixed characteristic): for f : 𝔸¹_{ℤ[1/ℓ]} → Spec ℤ[1/ℓ] and ℱ = ℚ̄_ℓ, R²f_!ℚ̄_ℓ = ℚ̄_ℓ(−1) is pure of weight 2 at every closed point 𝔽_p, p ≠ ℓ.
- Non-example: the theorem gives no lower bound: H¹_c(𝔾_m) has weight 0 < 1.

Direct inputs: [DWP.7/spreading-out-to-a-tame-relative-curve](#dwp-7-spreading-out-to-a-tame-relative-curve), [DWP.7/purity-of-the-relative-curve-case](#dwp-7-purity-of-the-relative-curve-case), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.5/weil-sheaf](#dwp-5-weil-sheaf).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.3.1), p. 204; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Introduction, Théorème 1, p. 138.

Declaration id: `DeligneWeightsAndPurity:DWP.7/fundamental-direct-image-theorem-3-3-1`.

<a id="dwp-7-iota-mixed-direct-image-3-3-10"></a>

### The direct-image theorem for ι-mixed sheaves with real weights

Fix a field isomorphism ι : ℚ̄_ℓ ≅ ℂ and β ∈ ℝ. Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] and ℱ an ι-mixed sheaf on X with punctual ι-weights ≤ β. Then for every i, R^i f_!ℱ is ι-mixed, and every punctual ι-weight of R^i f_!ℱ is ≤ β + i and congruent modulo ℤ to one of the punctual ι-weights of ℱ. Over 𝔽_q (Weil sheaves allowed), every eigenvalue of F on H^i_c(X, ℱ) has ι-weight ≤ β + i in such a class. No algebraicity, no integrality and no bound at another embedding follows from this statement.

Hypotheses and scope:

- One fixed ι; real weights
- The integrality argument of Weil II 3.3.2 does not apply to ι-mixed sheaves
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Rerun DWP.7/spreading-out-to-a-tame-relative-curve and DWP.7/purity-of-the-relative-curve-case with ι-weights: the dévissages hold verbatim for ι-mixed sheaves, and DWP.6 and DWP.5 supply the fixed-ι curve and local statements.
2. Weights mod ℤ: in the reduced situation the weights of R^q f̄_*(j_*ℱ) are β + q and those of Gr^M_k are β + k, all in β + ℤ; the dévissages only take extensions and subquotients, so every weight produced lies in the class mod ℤ of a weight of the input.

Acceptance checks:

- Acceptance: on Spec 𝔽_q the rank-one Weil sheaf ℚ̄_ℓ^{(b)} with b = q^{1/3} (a chosen cube root) is ι-pure of weight 2/3 for every ι; for X₀ = 𝔾_m and ℱ₀ the pullback, H¹_c and H²_c have ι-weights 2/3 and 8/3, both ≡ 2/3 mod ℤ.
- Non-example: the conclusion does not say that eigenvalues are algebraic: a transcendental b with |ιb| = 1 gives an ι-pure sheaf of weight 0 whose H⁰ has a transcendental eigenvalue.

Direct inputs: [DWP.7/spreading-out-to-a-tame-relative-curve](#dwp-7-spreading-out-to-a-tame-relative-curve), [DWP.7/purity-of-the-relative-curve-case](#dwp-7-purity-of-the-relative-curve-case), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), [DWP.6/sharp-curve-purity](#dwp-6-sharp-curve-purity), [DWP.0/iota-weight](#dwp-0-iota-weight).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.10), p. 207.

Declaration id: `DeligneWeightsAndPurity:DWP.7/iota-mixed-direct-image-3-3-10`.

<a id="dwp-7-deligne-integrality-theorem-sga7-xxi"></a>

### Deligne's integrality theorem (SGA 7 XXI 5.2.2)

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] whose fibres have dimension ≤ d, and ℱ an integral sheaf on X (DWP.7/integral-sheaf). Then for every i the sheaf R^i f_!ℱ is integral, and for i ≥ d the twist R^i f_!ℱ(i − d) is integral: at every closed point y of Y, every eigenvalue α of F_y on (R^i f_!ℱ)_ȳ is an algebraic integer, and for i ≥ d the number α/N(y)^{i−d} is an algebraic integer.

Hypotheses and scope:

- ℱ integral; fibre dimension ≤ d
- Constant coefficients ℚ̄_ℓ are integral, so the theorem applies to H^i_c(X, ℚ̄_ℓ)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Proper base change for Rf_! reduces each closed stalk to H^i_c of a fibre over a finite field, of dimension ≤ d (SF.2). A constructible ℚ̄_ℓ-sheaf is defined over a finite coefficient extension A/ℚ_ℓ (EDC.0); work there and extend coefficients at the end. SGA 7 XXI §5 takes a completion of a number field at ℓ and T-integrality; take T empty.
2. SGA 7 XXI Lemma 5.2.1: H⁰_c⊂H⁰ injects into H⁰ of a suitable finite closed subscheme, by stratification and evaluation on finitely many stalks. For dim X ≤ d, discard a smaller-dimensional closed subset to obtain a smooth lisse dense open without changing H^{2d}_c. Poincaré duality transposes the injective evaluation map for the dual sheaf into a surjection H⁰(Y, ℱ)(−d) → H^{2d}_c(X, ℱ) for suitable finite Y. These prove integrality of F and q^{d−i}F at i = 0 and i = 2d (EDC.0, EDC.2).
3. Dimension one: the Euler product L(X, ℱ, t) has algebraic-integer coefficients, since each closed-point Frobenius has integral eigenvalues. By the trace formula and cohomological dimension ≤ 2, L = det(1−Ft,H¹_c)/(det(1−Ft,H⁰_c) det(1−Ft,H²_c)). The endpoint factors are integral by the preceding step, so det(1−Ft,H¹_c) has integral coefficients and its reciprocal roots are integral. This is 5.2.2 for curves; dimension zero is evaluation on finite points.
4. Induct on d. By localisation remove a closed subset of dimension < d, handled by induction; on a dense open choose a morphism to a curve with fibres of dimension ≤ d−1. Proper base change and induction show R^qf_!ℱ and R^qf_!ℱ(q−(d−1)) integral on that curve. The curve case makes E₂^{p,q}=H^p_c(Y,R^qf_!ℱ) integral, and also E₂^{p,q}(p+q−d) integral: apply the curve case to the twisted coefficient sheaf. The Leray spectral sequence gives the same two conclusions on H^{p+q}_c(X,ℱ), since integrality is stable under subquotients and extensions.
5. If an induction stratum has dimension e < d, its stronger twist i−e implies the desired twist i−d by a nonnegative power of q; negative Tate twists preserve integrality. Therefore the fibrewise proof gives exactly the displayed relative statement (indeed the source gives both conclusions for all i).

Acceptance checks:

- Acceptance: X₀ = ℙ¹, ℱ₀ = ℚ̄_ℓ, d = 1: the eigenvalue q on H² satisfies q/q^{2−1} = 1 integral.
- Acceptance: X₀ = 𝔾_m (d = 1), H²_c = ℚ̄_ℓ(−1): q/q = 1; H¹_c: eigenvalue 1, integral.
- Non-example: for ℱ₀ = ℚ̄_ℓ(1), which is not integral, H⁰_c(Spec 𝔽_q, ℱ₀) has eigenvalue q⁻¹: the hypothesis on ℱ cannot be dropped.

Direct inputs: [DWP.7/integral-sheaf](#dwp-7-integral-sheaf), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, proof of Corollaire (3.3.3), p. 205; [SGA 7 II, Exposé XXI: Le niveau de la cohomologie des intersections complètes; §5 Appendix on integrality](https://web.math.princeton.edu/~nmk/old/niveaucoho.pdf), Exposé XXI, §5, Lemma 5.2.1 and Théorème 5.2.2, pp. 384–387.

Declaration id: `DeligneWeightsAndPurity:DWP.7/deligne-integrality-theorem-sga7-xxi`.

<a id="dwp-7-integral-weight-bounds-3-3-3"></a>

### Weights of R^i f_! of an integral mixed sheaf lie between 0 (or 2(i − d)) and n + i

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] whose fibres have dimension ≤ d, and ℱ an integral sheaf on X, mixed of weights ≤ n. Then for every i, R^i f_!ℱ is mixed with all punctual weights in [0, n + i]; if i > d, all punctual weights lie in [2(i − d), n + i].

Hypotheses and scope:

- ℱ integral and mixed (integer weights)
- d bounds the dimension of every fibre of f
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Upper bound: DWP.7/fundamental-direct-image-theorem-3-3-1.
2. Lower bound 0: R^i f_!ℱ is integral (DWP.7/deligne-integrality-theorem-sga7-xxi) and mixed, so its weights are ≥ 0 (api IsIntegralSheaf.weights_nonneg).
3. Lower bound 2(i − d) for i > d: R^i f_!ℱ(i − d) is integral and mixed with weights shifted by −2(i − d), hence ≥ 0.

Acceptance checks:

- Acceptance: X₀ = ℙ¹ (d = 1), i = 2: the weight 2 lies in [2(2 − 1), 0 + 2] = {2}.
- Acceptance: X₀ = 𝔾_m (d = 1), i = 1: weight 0 ∈ [0, 1].
- Non-example: for the non-integral sheaf ℚ̄_ℓ(1) on Spec 𝔽_q the weight −2 is negative.

Direct inputs: [DWP.7/fundamental-direct-image-theorem-3-3-1](#dwp-7-fundamental-direct-image-theorem-3-3-1), [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi), [DWP.7/integral-sheaf](#dwp-7-integral-sheaf).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.3), p. 205.

Declaration id: `DeligneWeightsAndPurity:DWP.7/integral-weight-bounds-3-3-3`.

<a id="dwp-7-cohomological-bounds-3-3-2-3-3-6"></a>

### Weight bounds for H^i_c and H^i over a finite field, and purity of the image H^i_c → H^i

Let X₀ be a scheme of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q. (i) (Weil II 3.3.4) If ℱ₀ is mixed of weights ≤ n (a Weil sheaf being allowed), then H^i_c(X, ℱ) is mixed of weights ≤ n + i: every eigenvalue α of F is algebraic, with an integer w ≤ n + i such that every complex conjugate of α has absolute value q^{w/2}. If ℱ₀ is integral then w ≥ 0, and if moreover i > d = dim X₀ then w ≥ 2(i − d). (ii) (3.3.5) If X₀ is smooth and ℱ₀ is lisse and mixed of weights ≥ n, then H^i(X, ℱ) is mixed of weights ≥ n + i. (iii) (3.3.6) If X₀ is smooth and ℱ₀ is lisse and punctually pure of weight n, then the image of H^i_c(X, ℱ) → H^i(X, ℱ) is pure of weight n + i. (iv) (3.3.10) For a fixed ι, (i) without its integral clauses, (ii) and (iii) hold with 'mixed' replaced by 'ι-mixed', n by β ∈ ℝ and weights read as ι-weights.

Hypotheses and scope:

- (ii) and (iii) need X₀ smooth and ℱ₀ lisse: they rest on Poincaré duality
- The integral clauses of (i) need ℱ₀ integral
- (iv) is a statement at one ι; it does not give integer weights
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (i) is the case Y = Spec 𝔽_q of DWP.7/fundamental-direct-image-theorem-3-3-1 and DWP.7/integral-weight-bounds-3-3-3.
2. (ii) Reduce to X₀ of pure dimension N (components). The dual ℱ₀^∨ is lisse and mixed of weights ≤ −n. By (i), H^{2N−i}_c(X, ℱ^∨)(N) is mixed of weights ≤ −n + (2N − i) − 2N = −n − i (reading ℱ^∨ in the printed proof, PAPER-DELIGNE-80/E45). Poincaré duality (EDC.2) gives a Frobenius-equivariant perfect pairing H^i(X, ℱ) × H^{2N−i}_c(X, ℱ^∨)(N) → ℚ̄_ℓ, so the eigenvalues on H^i(X, ℱ) are the inverses of those on H^{2N−i}_c(X, ℱ^∨)(N) (DWP.0/reciprocal-pairing-of-eigenvalues) and have weights ≥ n + i.
3. (iii) The image is a quotient of H^i_c (weights ≤ n + i by (i)) and a subspace of H^i (weights ≥ n + i by (ii)), hence pure of weight n + i (DWP.0/purity-under-subquotients-and-extensions).
4. (iv) Use DWP.7/iota-mixed-direct-image-3-3-10 in place of 3.3.1; the duality step is unchanged.

Acceptance checks:

- Acceptance: X₀ = 𝔾_m, ℱ₀ = ℚ̄_ℓ: H¹_c has weight 0 ≤ 1, H¹ = ℚ̄_ℓ(−1) has weight 2 ≥ 1, and the image H¹_c → H¹ is 0 (pure of weight 1 vacuously).
- Acceptance: X₀ = 𝔸¹ minus the two points of a quadratic extension of 𝔽_q (a closed point of degree 2), ℱ₀ = ℚ̄_ℓ: H¹ has weight 2 with F-eigenvalues q and −q.
- Non-example (smoothness): for the nodal cubic X₀ (projective, singular) and ℱ₀ = ℚ̄_ℓ, H¹(X) = H¹_c(X) = ℚ̄_ℓ has weight 0 < 1: the lower bound (ii) fails without smoothness, although every stalk of ℱ₀ is pure of weight 0.
- Non-example (lissity): on the smooth proper ℙ¹ with ℱ₀ = j_!ℚ̄_ℓ for j : 𝔾_m → ℙ¹ (every stalk is of weight 0 or zero), H¹(ℙ¹, ℱ) = H¹_c(𝔾_m) = ℚ̄_ℓ has weight 0 < 0 + 1: (ii) needs ℱ₀ lisse.

Direct inputs: [DWP.7/fundamental-direct-image-theorem-3-3-1](#dwp-7-fundamental-direct-image-theorem-3-3-1), [DWP.7/integral-weight-bounds-3-3-3](#dwp-7-integral-weight-bounds-3-3-3), [DWP.7/iota-mixed-direct-image-3-3-10](#dwp-7-iota-mixed-direct-image-3-3-10), `EtaleDualityAndPerverseSheaves:EDC.2`, [DWP.0/reciprocal-pairing-of-eigenvalues](#dwp-0-reciprocal-pairing-of-eigenvalues), [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.4), p. 206; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaires (3.3.5) et (3.3.6), p. 206; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.10), p. 207.

Declaration id: `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`.

<a id="dwp-7-newton-couples-3-3-7"></a>

### The p-adic couple of a pure algebraic number

Let q = p^f, n ∈ ℤ, and α an algebraic number which is a Weil q-number of weight n (DWP.0). Let K be a number field containing α and v a valuation of K above p, normalised by v(q) = 1, extended to v : K → ℚ ∪ {∞}. The couple of α at v is (r, s) = (v(α), v(q^n α⁻¹)). Here q^n α⁻¹ ∈ K, and under every embedding σ : K → ℂ it maps to the complex conjugate of σ(α) (DWP.0/weil-number-arithmetic (iii)); so q^n α⁻¹ has the same minimal polynomial over ℚ as α, i.e. it is a Galois conjugate of α. Always r + s = n; if α is integral over ℤ then r ≥ 0 and s ≥ 0.

Hypotheses and scope:

- α a Weil q-number of integer weight n
- v normalised by v(q) = 1, not by v(p) = 1

Uses that determine the interface:

- Weil II Corollaire (3.3.8), p. 206: locates the couples of Frobenius eigenvalues of H^i_c and of H^i (X smooth) in triangles
- DeligneWeightsAndPurity:DWP.7/valuation-triangles-3-3-8: the triangle inequalities are statements about r and s
- Weil II (3.3.7): Newton-polygon slopes of Frobenius: r is the slope of α at v, s that of its complex conjugate

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.newtonCouple` | data | newtonCouple (v : AddValuation K (WithTop ℚ)) (q : K) (n : ℤ) (α : K) : WithTop ℚ × WithTop ℚ := (v α, v (q ^ n * α⁻¹)). |
| `TauCeti.Weights.newtonCouple_fst_add_snd` | characterisation | v q = 1 → α ≠ 0 → (newtonCouple v q n α).1 + (newtonCouple v q n α).2 = n. |
| `TauCeti.Weights.newtonCouple_nonneg` | other | If α and q^n α⁻¹ are integral over ℤ (in particular if α is integral and a Weil q-number of weight n) and v is nonnegative on the integers of K, both coordinates are ≥ 0. |
| `TauCeti.Weights.newtonCouple_swap_conj` | relation | For a Weil q-number α of weight n, the couple of q^n α⁻¹ is the couple of α with its coordinates swapped. |
| `TauCeti.Weights.newtonCouple_galois` | functoriality | For τ ∈ Aut(K) fixing q, newtonCouple (v ∘ τ) q n α = newtonCouple v q n (τ α). In the intended number-field application q is rational, so it is fixed. |
| `TauCeti.Weights.newtonCouple_mul` | simp | For q ≠ 0, newtonCouple v q (n + m) (αβ) = newtonCouple v q n α + newtonCouple v q m β. The raw valuation API needs q ≠ 0 to use integer-power multiplication; it follows from v(q)=1 in the intended normalisation. |
| `TauCeti.Weights.newtonCouple_div_pow` | simp | The couple of α/q^m (weight n − 2m) is (r − m, s − m). |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.newtonCouple_fst_add_snd` | characterisation | r + s = n for every valuation v with v(q) = 1 and every nonzero α. |
| `TauCeti.Weights.newtonCouple_supersingular` | computation | q = p, α = √−p (weight 1, a root of T² + p): at the unique place above p of ℚ(√−p), (r, s) = (1/2, 1/2). |
| `TauCeti.Weights.newtonCouple_ordinary` | computation | q = 5, α = 1 + 2i (weight 1, \|α\|² = 5): at the place v of ℚ(i) with v(1 + 2i) = 1 (normalised v(5) = 1), (r, s) = (1, 0); at the conjugate place (r, s) = (0, 1). |
| `TauCeti.Weights.newtonCouple_tate` | degenerate | α = q^m (weight 2m): (r, s) = (m, m) at every place above p. |
| `TauCeti.Weights.newtonCouple_nonintegral` | non-example | α = q⁻¹ (weight −2): (r, s) = (−1, −1); the nonnegativity of r and s genuinely needs integrality. |
| `TauCeti.Weights.newtonCouple_zero_base` | non-example | In the raw valuation definition, with q=0, α=β=1, n=1 and m=−1, the couple at n+m=0 is (0,0), while the sum of the two couples is (0,∞). Thus the multiplication API requires q ≠ 0. |

Proof or construction:

1. r + s = v(q^n) = n·v(q) = n because v is a valuation.
2. q^n α⁻¹ is a root of the minimal polynomial of α: for one embedding σ, σ(q^n α⁻¹) = conj(σ α), a root of the minimal polynomial; so the minimal polynomials agree. If α is integral, so is every Galois conjugate, hence r, s ≥ 0.

Acceptance checks:

- The couple depends on v only through the place of ℚ(α) below it, and is permuted by Gal(ℚ̄/ℚ) acting on the places above p.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.7), p. 206.

Declaration id: `DeligneWeightsAndPurity:DWP.7/newton-couples-3-3-7`.

<a id="dwp-7-valuation-triangles-3-3-8"></a>

### The p-adic couples of Frobenius eigenvalues lie in triangles

Let X₀ be a scheme of finite type over 𝔽_q, q = p^f, of dimension ≤ d, and i ≥ 0. Let α be an eigenvalue of F on H^i_c(X, ℚ̄_ℓ), or on H^i(X, ℚ̄_ℓ) when X₀ is proper, of weight w, and (r, s) its couple at a place v above p (DWP.7/newton-couples-3-3-7). Then r + s = w ≤ i and r, s ≥ max(0, i − d): (r, s) lies in the lower triangle {r + s ≤ i, r ≥ max(0, i − d), s ≥ max(0, i − d)}. If X₀ is smooth of dimension ≤ d and α is an eigenvalue of F on H^i(X, ℚ̄_ℓ), then r + s = w ≥ i and r, s ≤ min(i, d): (r, s) lies in the upper triangle {r + s ≥ i, r ≤ min(i, d), s ≤ min(i, d)}.

Hypotheses and scope:

- Constant coefficients ℚ̄_ℓ
- Proper X₀ for ordinary cohomology in the first part; smooth X₀ of pure dimension d in the second
- Rests on the integrality theorem DWP.7/deligne-integrality-theorem-sga7-xxi
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Compact support: w ≤ i by DWP.7/cohomological-bounds-3-3-2-3-3-6 (i). The eigenvalue α is integral and, for i ≥ d, α/q^{i−d} is integral (DWP.7/deligne-integrality-theorem-sga7-xxi with ℱ = ℚ̄_ℓ). So r ≥ max(0, i − d). The number q^w α⁻¹ is a Galois conjugate of α (DWP.7/newton-couples-3-3-7), so it is also integral and divisible by q^{i−d}: s ≥ max(0, i − d).
2. Proper X₀: H^i = H^i_c.
3. Smooth X₀ of pure dimension d: Poincaré duality (EDC.2) pairs H^i(X) with H^{2d−i}_c(X)(d), so α = q^d/β for an eigenvalue β of F on H^{2d−i}_c(X) of weight 2d − w. Then r = d − v(β) and s = d − v(q^{2d−w}β⁻¹). By the first part applied in degree 2d − i, v(β) and v(q^{2d−w}β⁻¹) are ≥ max(0, d − i); hence r, s ≤ min(d, i). And w ≥ i by DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii).
4. For smooth X of dimension ≤ d with components of different dimensions, apply the duality argument to each pure-dimensional component of dimension e ≤ d. Its bound r,s ≤ min(i,e) implies r,s ≤ min(i,d); take the finite direct sum. Thus no pure-dimensional hypothesis is needed in the displayed upper triangle, as in the source.

Acceptance checks:

- Acceptance: X₀ = ℙ^d, i = 2k: α = q^k, (r, s) = (k, k) lies in both triangles (on the antidiagonal).
- Acceptance: an ordinary elliptic curve over 𝔽_p, i = 1, d = 1: the unit root has (r, s) = (0, 1) and the other (1, 0), the two corners of the antidiagonal; a supersingular one gives (1/2, 1/2).
- Acceptance: X₀ = 𝔾_m (d = 1): on H²_c the eigenvalue q has (1, 1), with r, s ≥ 2 − 1 = 1; on H¹ (smooth) the eigenvalue q has (1, 1) ≤ (min(1, 1), min(1, 1)).
- Non-example: the source's remark that in ordinary cohomology (r, s) always lies in the union square of the two triangles is stated there without proof and is not part of this node.

Direct inputs: [DWP.7/newton-couples-3-3-7](#dwp-7-newton-couples-3-3-7), [DWP.7/deligne-integrality-theorem-sga7-xxi](#dwp-7-deligne-integrality-theorem-sga7-xxi), [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.8), p. 206; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, after (3.3.8), p. 207.

Declaration id: `DeligneWeightsAndPurity:DWP.7/valuation-triangles-3-3-8`.

<a id="dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11"></a>

### Purity for proper smooth varieties and rational homology manifolds over a finite field

Let X₀ be a scheme of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, a : X₀ → Spec 𝔽_q. (i) If X₀ is proper and smooth and ℱ₀ is lisse and punctually pure of weight n, then H^i(X, ℱ) is pure of weight n + i for every i; the same holds for ι-purity with n ∈ ℝ. (ii) (Weil II 3.3.9) If X₀ is proper and smooth, then for every i the polynomial det(1 − F t, H^i(X, ℚ_ℓ)) has integer coefficients independent of ℓ ≠ p, and its reciprocal roots, the eigenvalues of F, are Weil q-numbers of weight i. (iii) (3.3.11) In (i) and (ii) and in DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii)–(iii), 'smooth of pure dimension N' may be replaced by the condition that X₀ is of pure dimension N and Ra^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N] Frobenius-equivariantly (EDC.1's exceptional inverse image), for instance when X₀ is étale-locally the quotient of a smooth scheme of dimension N by a finite group; then the lower bound and purity statements hold with ℱ₀ = ℚ̄_ℓ.

Hypotheses and scope:

- (i), (ii): X₀ proper AND smooth; projectivity is not assumed
- (iii): the exact dualizing-object hypothesis Ra^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N], not a weaker 'rationally smooth' slogan; coefficients constant
- (ii)'s integrality and ℓ-independence use WC.3's algebraic factor lemma
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Purity of proper smooth cohomology**.

Proof or construction:

1. (i) For X₀ proper, H^i_c = H^i, so DWP.7/cohomological-bounds-3-3-2-3-3-6 (iii) gives purity of weight n + i; the ι-version uses (iv) of that node.
2. (ii) Purity of weight i is (i) with ℱ₀ = ℚ_ℓ (n = 0). The zeta function Z(X₀, t) = ∏_i det(1 − F t, H^i)^{(−1)^{i+1}} is in ℚ(t) with integral power-series expansion and does not depend on ℓ (trace formula, SF.2). Since the factors of different degrees have reciprocal roots of different absolute values, no cancellation occurs, and WC.3's algebraic factor lemma (the argument of Weil I, proof of (1.7) ⇒ (1.6)) extracts each det(1 − F t, H^i) as a polynomial with integer coefficients determined by Z(X₀, t), hence independent of ℓ.
3. (iii) In the proofs of DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii)–(iii) and of (i), smoothness enters only through Poincaré duality H^i(X, ℚ̄_ℓ) ≅ H^{2N−i}_c(X, ℚ̄_ℓ(N))^∨, which follows from Ra^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N] and Verdier duality RΓ(X, Ra^!ℚ_ℓ) = RHom(RΓ_c(X, ℚ_ℓ), ℚ_ℓ) (EDC.1).
4. For π : Y → Y/G with Y smooth of dimension N, the constant sheaf on Y/G is the G-invariant summand of π_*ℚ_ℓ: geometric fibres are single G-orbits, and the averaging idempotent |G|⁻¹∑g exists in ℚ_ℓ even if p divides |G|. Finite proper pushforward commutes with Verdier duality (EDC.1). The self-duality D(π_*ℚ_ℓ) ≅ π_*ℚ_ℓ(N)[2N] from EDC.2 intertwines g with g⁻¹, so the averaging idempotent is self-adjoint. Its image therefore inherits Dℚ_ℓ ≅ ℚ_ℓ(N)[2N]. Glue étale-locally to obtain the rational-homology-manifold condition.

Acceptance checks:

- Acceptance: a smooth proper nonprojective threefold over 𝔽_q (Hironaka's construction, which can be carried out over a finite field) has pure cohomology by (ii) although DWP.4's projective theorem does not apply.
- Acceptance (lisse coefficients): for a smooth proper curve C₀ and an elliptic curve E₀ over 𝔽_q, the geometrically constant sheaf ℱ₀ = a*V with V = H¹(E, ℚ_ℓ) is punctually pure of weight 1, and H^i(C, ℱ) = H^i(C, ℚ_ℓ) ⊗ V is pure of weight i + 1.
- Acceptance: the weighted projective plane ℙ(1, 1, 2) (étale-locally a quotient of 𝔸² by μ₂, p ≠ 2) satisfies (iii) and its H² = ℚ_ℓ(−1) is pure of weight 2.
- Non-example: the nodal cubic (proper, singular) has H¹ = ℚ_ℓ of weight 0: properness alone does not give purity, and Ra^!ℚ_ℓ ≠ ℚ_ℓ(1)[2] there.
- Non-example: 𝔾_m (smooth, not proper) has H¹ of weight 2 ≠ 1.

Direct inputs: [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `WeilConjectures:WC.3`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`, [DWP.0/weil-q-number](#dwp-0-weil-q-number).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.3.9), p. 207; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.3.11), p. 207; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Introduction, p. 138; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Proposition 6.1.1, proof, pp. 42–43.

Declaration id: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`.

## DWP.8 — Mixed complexes, weight filtrations and geometric semisimplicity

The six-operation theory uses cohomological indexing and directional weight bounds. Ext vanishing gives a canonical weight-class decomposition and a strict lisse weight filtration, rather than a splitting. Pure lisse sheaves on a normal base are geometrically semisimple. Potential purity is witnessed by an arithmetic model; arbitrary adic sheaves are not assumed to descend.

<a id="dwp-8-mixed-complexes"></a>

### Mixed complexes and complexes of weights ≤ w

Let X₀ be a scheme of finite type over 𝔽_q (Weil II (6.1.1) a): sheaves are ℚ̄_ℓ-Weil sheaves) and D^b_c(X₀) the bounded derived category of constructible ℚ̄_ℓ-sheaves on X₀ of EDC.0, with cohomology sheaves ℋ^i. A complex K ∈ D^b_c(X₀) is mixed when every ℋ^iK is mixed (DWP.7/weights-mixed-sheaves-definitions); D^b_m(X₀) ⊂ D^b_c(X₀) is the full subcategory of mixed complexes. For w ∈ ℤ, K is mixed of weights ≤ w when, for every i, ℋ^iK is mixed of punctual weights ≤ w + i (Weil II 6.2.2); D^b_{≤w}(X₀) denotes the full subcategory of such K. For a fixed field isomorphism ι : ℚ̄_ℓ ≅ ℂ and w ∈ ℝ, 'ι-mixed of ι-weights ≤ w' is defined in the same way from DWP.5's ι-mixed sheaves. For X of finite type over ℤ[1/ℓ] (context (6.1.1) b), and Weil II 6.2.7) the same definitions apply to constructible ℚ̄_ℓ-sheaves.

Hypotheses and scope:

- X₀ of finite type over 𝔽_q; ℚ̄_ℓ coefficients, ℓ ∤ q
- The shift convention: ℋ^iK is allowed weights up to w + i, not w
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Mixed complexes**.

Uses that determine the interface:

- Weil II Variante (6.2.3), p. 247: Rf_! preserves complexes of weights ≤ n; the definition is designed so that 3.3.1 gives this through the spectral sequence R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K
- Weil II Définition (6.2.4), p. 247: a pure complex is one of weights ≤ n whose dual has weights ≤ −n
- EtaleDualityAndPerverseSheaves:EDC.7: purity of IC_X(L) of weight w + d and of perverse direct images is stated with this weight convention
- WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization: imports the complex weight formalism and the normalisation `F[a](b)` of weight r + a − 2b
- PAPER-YUN-ZHANG-17/58 (Lemma 7.13(1)): bounded-weight terms in long exact sequences of complexes

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.IsMixedComplex` | data | IsMixedComplex K : Prop := ∀ i, IsMixed (ℋ^i K), for K in the bounded constructible derived category of EDC.0. |
| `TauCeti.Weights.HasWeightsLE` | data | HasWeightsLE (w : ℤ) K : Prop := ∀ i, IsMixed (ℋ^i K) ∧ ∀ weight m of ℋ^i K, m ≤ w + i. |
| `TauCeti.Weights.HasIotaWeightsLE` | data | The ι-variant with w : ℝ and DWP.5's ι-mixed sheaves. |
| `TauCeti.Weights.isMixedComplex_triangle` | structure | D^b_m is a triangulated subcategory: two out of three terms of a distinguished triangle mixed ⇒ the third is; closed under shifts and direct summands. |
| `TauCeti.Weights.HasWeightsLE.of_triangle` | structure | For a distinguished triangle K′ → K → K″ →: K′, K″ of weights ≤ w ⇒ K of weights ≤ w. |
| `TauCeti.Weights.hasWeightsLE_shift` | simp | HasWeightsLE (w + 1) (K[1]) ↔ HasWeightsLE w K: ℋ^i(K[1]) = ℋ^{i+1}K. |
| `TauCeti.Weights.hasWeightsLE_twist` | simp | K(r) has weights ≤ w − 2r iff K has weights ≤ w; in particular K(N)[2N] has weights ≤ w iff K has (Weil II 6.2.5 a). |
| `TauCeti.Weights.HasWeightsLE.mono` | other | w ≤ w′ → HasWeightsLE w K → HasWeightsLE w′ K. |
| `TauCeti.Weights.hasWeightsLE_sheaf_iff` | characterisation | A sheaf ℱ placed in degree 0 has weights ≤ w iff ℱ is mixed of punctual weights ≤ w. |
| `TauCeti.Weights.hasWeightsLE_iff_eigenvalues` | characterisation | For mixed K: K has weights ≤ w iff for all i and x ∈ \|X₀\| every eigenvalue of F_x on ℋ^i(K)_x̄ has weight ≤ w + i relative to N(x). |
| `TauCeti.Weights.hasWeightsLE_baseExtension` | compatibility | Weights are unchanged by the base extension 𝔽_q → 𝔽_{q^r} (DWP.0/finite-field-base-extension-of-weights). |
| `TauCeti.Weights.HasWeightsLE.isIotaWeightsLE` | coercion | A complex of weights ≤ w has ι-weights ≤ w for every ι. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.hasWeightsLE_const_shift_neg` | computation | On Spec 𝔽_q, ℚ̄_ℓ[−1] (ℋ¹ = ℚ̄_ℓ of weight 0) has weights ≤ −1 and not ≤ −2; a definition without the shift by i would give ≤ 0. |
| `TauCeti.Weights.hasWeightsLE_const_shift_pos` | computation | On Spec 𝔽_q, ℚ̄_ℓ[1] has weights ≤ 1 and not ≤ 0. |
| `TauCeti.Weights.hasWeightsLE_tate_shift` | computation | ℚ̄_ℓ(1)[2] has weights ≤ 0 (Weil II 6.2.5 a with N = 1): ℋ^{−2} = ℚ̄_ℓ(1) has weight −2 = 0 + (−2). |
| `TauCeti.Weights.hasWeightsLE_zero` | degenerate | The zero complex is mixed and has weights ≤ w for every w. |
| `TauCeti.Weights.not_isMixedComplex_transcendental` | non-example | On Spec 𝔽_q, the rank-one Weil sheaf on which F acts by a transcendental b ∈ ℚ̄_ℓ^× is not mixed (its eigenvalue is not a Weil number), although it is ι-mixed for every ι. |
| `TauCeti.Weights.hasWeightsLE_point_iff` | compatibility | On Spec 𝔽_q, K has weights ≤ w iff every eigenvalue of F on every H^i(K) is a Weil q-number of weight ≤ w + i, i.e. iff each Frobenius module H^i(K) has DWP.0 weights ≤ w + i. |

Proof or construction:

1. D^b_m(X₀) is a strictly full triangulated subcategory: it is closed under isomorphism and shifts, and if K′ → K → K″ → K′[1] is distinguished with two of the three terms mixed, the long exact sequence of cohomology sheaves exhibits each ℋ^i of the third as an extension of a subsheaf by a quotient of mixed sheaves (stabilities, DWP.7/weights-mixed-sheaves-definitions).
2. The same argument shows that if K′ and K″ have weights ≤ w then so has K; direct summands of objects of weights ≤ w have weights ≤ w.
3. For a mixed sheaf the punctual weights are ≤ m iff every eigenvalue of every F_x on the stalks has weight ≤ m: a nonzero constructible sheaf has a nonzero stalk at a closed point.

Acceptance checks:

- On Spec 𝔽_q, K has weights ≤ w iff for every i the Frobenius module H^i(K) has all weights ≤ w + i (DWP.0/endomorphism-weights).

Direct inputs: [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `EtaleDualityAndPerverseSheaves:EDC.0`, [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Définition (6.2.2), p. 247; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, (6.1.1), p. 243.

Declaration id: `DeligneWeightsAndPurity:DWP.8/mixed-complexes`.

<a id="dwp-8-pure-complexes"></a>

### Complexes of weights ≥ w and pure complexes

Let X₀ be of finite type over 𝔽_q, a : X₀ → Spec 𝔽_q, K_{X₀} = Ra^!ℚ̄_ℓ the dualizing complex and D = RHom(−, K_{X₀}) the duality functor of EDC.1, which is involutive on D^b_c(X₀), exchanges f* with Rf^! and Rf_* with Rf_!, and satisfies D(K ⊗ L) = RHom(K, DL). A complex K is mixed of weights ≥ w when DK is mixed of weights ≤ −w (DWP.8/mixed-complexes). K is pure of weight w when it is mixed of weights ≤ w and of weights ≥ w (Weil II 6.2.4). A sheaf ℱ is pure of weight w when the complex ℱ[0] is. The ι-variants (w ∈ ℝ) are defined in the same way. On X₀ smooth of pure dimension d, K_{X₀} = ℚ̄_ℓ(d)[2d] (EDC.2), so K has weights ≥ w iff RHom(K, ℚ̄_ℓ) has weights ≤ −w.

Hypotheses and scope:

- D is Verdier duality relative to Spec 𝔽_q (EDC.1), not absolute Galois duality
- Purity of a complex is a condition on K and on DK; on a singular X₀ it is not a stalkwise condition
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Pure complexes**.

Uses that determine the interface:

- Weil II Proposition (6.2.6), p. 248: proper direct image preserves purity: apply 6.2.3 to K and DK
- Weil II Théorème (6.2.13), p. 250: hard Lefschetz for potentially pure complexes
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the local and global invariant cycle theorems 6.2.9 and 6.2.12 for pure complexes
- EtaleDualityAndPerverseSheaves:EDC.7: IC_X(L) is pure of weight w + d; purity of perverse direct images
- WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization: on smooth X with lisse cohomology, purity of weight w iff H^i pointwise pure of weight w + i

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.HasWeightsGE` | data | HasWeightsGE (w : ℤ) K : Prop := HasWeightsLE (−w) (D K). |
| `TauCeti.Weights.IsPureComplex` | data | IsPureComplex (w : ℤ) K : Prop := HasWeightsLE w K ∧ HasWeightsGE w K. |
| `TauCeti.Weights.hasWeightsGE_dual` | characterisation | HasWeightsGE w (D K) ↔ HasWeightsLE (−w) K, by biduality. |
| `TauCeti.Weights.IsPureComplex.dual` | relation | IsPureComplex w K ↔ IsPureComplex (−w) (D K). |
| `TauCeti.Weights.HasWeightsGE.of_triangle` | structure | Extensions of complexes of weights ≥ w have weights ≥ w; so do direct summands. |
| `TauCeti.Weights.IsPureComplex.of_triangle` | structure | Extensions and direct summands of pure complexes of weight w are pure of weight w. |
| `TauCeti.Weights.hasWeightsGE_shift_twist` | simp | K[1] ≥ w + 1 ↔ K ≥ w; K(r) ≥ w − 2r ↔ K ≥ w. |
| `TauCeti.Weights.hasWeightsGE_iff_rhom_smooth` | characterisation | On X₀ smooth of pure dimension: HasWeightsGE w K ↔ HasWeightsLE (−w) (RHom(K, ℚ̄_ℓ)) (Weil II 6.2.5 b). |
| `TauCeti.Weights.isPureComplex_iff_lisse` | characterisation | On X₀ smooth with all ℋ^iK lisse: IsPureComplex w K ↔ ∀ i, ℋ^iK is punctually pure of weight w + i (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5). |
| `TauCeti.Weights.IsPureComplex.directSum` | other | A finite direct sum of pure complexes of weight w is pure of weight w; a sum containing two nonzero pure summands of distinct weights is mixed but cannot be pure of one weight. The zero complex is pure of every weight. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isPureComplex_const_smooth` | computation | On X₀ smooth of pure dimension d, ℚ̄_ℓ[0] is pure of weight 0 and ℚ̄_ℓ[d] is pure of weight d. |
| `TauCeti.Weights.isPureComplex_point_iff` | compatibility | On Spec 𝔽_q, K is pure of weight w iff every Frobenius module H^i(K) is pure of weight w + i in the sense of DWP.0/endomorphism-weights. |
| `TauCeti.Weights.not_isPureComplex_nodal` | non-example | On the nodal cubic X₀ ⊂ ℙ², ℚ̄_ℓ[0] is mixed of weights ≤ 0 and every stalk is pure of weight 0, but it is not pure: if it were, H¹(X, ℚ̄_ℓ) would be pure of weight 1 (proper direct image, 6.2.6), whereas it is ℚ̄_ℓ of weight 0. |
| `TauCeti.Weights.not_isPureComplex_extensionByZero` | non-example | For j : 𝔾_m → ℙ¹, j_!ℚ̄_ℓ is mixed of weights ≤ 0 but not pure: RΓ(ℙ¹, j_!ℚ̄_ℓ) = RΓ_c(𝔾_m) has H¹ of weight 0 ≠ 1. |
| `TauCeti.Weights.isPureComplex_zero` | degenerate | The zero complex is pure of every weight. |

Proof or construction:

1. Well-definedness only uses the existence of D (EDC.1); DK is mixed when K is (DWP.8/six-operations-preserve-mixedness-6-1-11), so 'weights ≥ w' is a condition on mixed complexes.
2. Closure properties: since D is a triangulated anti-equivalence, the class of complexes of weights ≥ w is closed under extensions, shifts K ≥ w ⇔ K[1] ≥ w + 1 and twists K ≥ w ⇔ K(r) ≥ w − 2r, as for ≤ w.
3. By biduality D² ≅ id (EDC.1), K is pure of weight w iff DK is pure of weight −w.

Acceptance checks:

- On Spec 𝔽_q, D is the linear dual (K_X = ℚ̄_ℓ), and K is pure of weight w iff each H^i(K) is pure of weight w + i.

Direct inputs: [DWP.8/mixed-complexes](#dwp-8-mixed-complexes), `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`, [DWP.8/six-operations-preserve-mixedness-6-1-11](#dwp-8-six-operations-preserve-mixedness-6-1-11).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Définition (6.2.4), p. 247; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, (6.2.1), p. 247.

Declaration id: `DeligneWeightsAndPurity:DWP.8/pure-complexes`.

<a id="dwp-8-generic-mixedness-of-direct-images-6-1-3"></a>

### Generic mixedness of R^i f_* over a base of finite type over ℤ[1/ℓ]

Let S be a scheme of finite type over ℤ[1/ℓ], f : X → Y a morphism of S-schemes of finite type, and ℱ a mixed sheaf on X. Then there is a dense open U ⊂ S over which all the sheaves R^i f_*ℱ are mixed.

Hypotheses and scope:

- S of finite type over ℤ[1/ℓ]; f of finite type; ℱ mixed
- Only a dense open of S: no claim over all of S
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (6.1.4) If X is smooth over Y = S, ℱ lisse and all R^i f_!ℱ^∨ lisse, then R^i f_*ℱ is obtained from R^{2N−i} f_!(ℱ^∨)(N) by relative Poincaré duality (EDC.2, componentwise of relative dimension N), and the latter is mixed by DWP.7/fundamental-direct-image-theorem-3-3-1.
2. (6.1.5) If X is smooth over Y = S and ℱ lisse, shrink S so that the R^i f_!ℱ^∨ are lisse (generic constructibility and local constancy, EDC.0) and apply (6.1.4).
3. (6.1.6)–(6.1.8) Induct on n = dim X_η for open immersions with dense image and S integral. The base n=0 becomes X=Y after shrinking S. In 6.1.7 coordinate projections and induction give mixedness on an open Y′⊂Y whose complement Y₁ is finite over S. For 6.1.8 assume X smooth over S and ℱ lisse; compactify Y over S, with structure b:Y→S, and let j:Y′→Y and i:Y₁→Y. Applying Rb_* to j_!j*Rf_*ℱ → Rf_*ℱ → i_*i*Rf_*ℱ gives a triangle whose first term is mixed by 3.3.1 and the already mixed restriction on Y′, and whose second is R(bf)_*ℱ, mixed by 6.1.5. Thus R(bi)_*i*Rf_*ℱ is mixed. Since bi is finite, its pushforward is exact and reflects mixedness: any sheaf injects into its pullback-pushforward along this finite map, and mixedness is stable under pullback and subobjects. Hence i*Rf_*ℱ is mixed and gluing with Y′ finishes 6.1.8. The finite morphism interface is DWP.7/devissage-in-the-target.
4. (6.1.9) After a finite radicial surjective base change choose j : V → X dense, with V smooth over S and j*ℱ lisse. Apply 6.1.8 to j and to f∘j. Let A be the cone of ℱ → Rj_*j*ℱ, not the cone of j_!j*ℱ → ℱ. Its cohomology is mixed because ℱ and Rj_*j*ℱ are mixed, and is supported on X−V of smaller generic dimension. Induction makes Rf_*A mixed; the triangle Rf_*ℱ → R(fj)_*j*ℱ → Rf_*A then proves the desired mixedness. Universal-homeomorphism invariance descends the result (SF.2).
5. The derived-category arguments are justified at finite level: write ℱ through a projective system of locally free ℤ/ℓ^n-sheaves as in Weil II (1.1.1) and apply the same triangles levelwise (EDC.0's adic formalism).
6. General f: the problem is local on Y and, by the Leray spectral sequence of an affine cover of X, on X; factor an affine f as an open immersion followed by a proper morphism (Nagata, EDC.0) and combine (∗)_n with 3.3.1.

Acceptance checks:

- Acceptance: S = Spec ℤ[1/ℓ], f : 𝔾_m → 𝔸¹ the inclusion over S, ℱ = ℚ̄_ℓ: R¹f_*ℚ̄_ℓ = ℚ̄_ℓ(−1) at 0, mixed of weight 2 over every closed point of S.
- Non-example: the conclusion is generic on S; it does not assert that a constructible sheaf on X_ℚ comes from a mixed sheaf on some X[1/n] (Weil II (6.1.1) b) records that this is unknown).

Direct inputs: [DWP.7/fundamental-direct-image-theorem-3-3-1](#dwp-7-fundamental-direct-image-theorem-3-3-1), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, [DWP.8/mixed-complexes](#dwp-8-mixed-complexes), [DWP.7/devissage-in-the-target](#dwp-7-devissage-in-the-target).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Lemme (6.1.3), p. 244.

Declaration id: `DeligneWeightsAndPurity:DWP.8/generic-mixedness-of-direct-images-6-1-3`.

<a id="dwp-8-direct-image-preserves-mixedness-6-1-2"></a>

### R^i f_* of a mixed sheaf is mixed

Let f : X → Y be a morphism of schemes of finite type over 𝔽_p (Weil sheaves), or of finite type over ℤ[1/ℓ] in the context of Weil II (6.1.1) b) (after inverting finitely many primes), and ℱ a mixed sheaf on X. Then every R^i f_*ℱ is mixed.

Hypotheses and scope:

- Contexts (6.1.1) a) and b) only
- No weight bound is asserted for Rf_*: only mixedness
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. By the generic base change theorem (SGA 4½ [Th. finitude] 1.9, supplied by EDC.0), applied with S = Y, the formation of R^i f_*ℱ commutes with base change over a dense open of Y; by noetherian induction on Y and dévissage (c) of DWP.7/devissage-in-the-target (localisation on the base preserves mixedness of a sheaf) it suffices to know mixedness over a dense open of each stratum.
2. Over a dense open this is DWP.8/generic-mixedness-of-direct-images-6-1-3 applied to S = Y (or to the stratum), with f viewed as a morphism of S-schemes.
3. (6.1.10) Locally on Y and, through the Leray spectral sequence of an affine cover, on X: factor f = g∘j with j an open immersion and g proper; Rg_* = Rg_! preserves mixedness by DWP.7/fundamental-direct-image-theorem-3-3-1 and Rj_* by the case (∗)_n of the lemma.

Acceptance checks:

- Acceptance: j : 𝔾_m → 𝔸¹ over 𝔽_q, ℱ = ℚ̄_ℓ: j_*ℚ̄_ℓ = ℚ̄_ℓ (weight 0) and R¹j_*ℚ̄_ℓ = ℚ̄_ℓ(−1)_0 (weight 2): mixed, with weights above those of ℱ + i allowed.
- Non-example: Rf_* does not preserve the upper weight bound: R¹j_*ℚ̄_ℓ has weight 2 > 0 + 1.

Direct inputs: [DWP.8/generic-mixedness-of-direct-images-6-1-3](#dwp-8-generic-mixedness-of-direct-images-6-1-3), [DWP.7/fundamental-direct-image-theorem-3-3-1](#dwp-7-fundamental-direct-image-theorem-3-3-1), [DWP.7/devissage-in-the-target](#dwp-7-devissage-in-the-target), `EtaleDualityAndPerverseSheaves:EDC.0`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Théorème (6.1.2), p. 243; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, after (6.1.2), p. 243.

Declaration id: `DeligneWeightsAndPurity:DWP.8/direct-image-preserves-mixedness-6-1-2`.

<a id="dwp-8-six-operations-preserve-mixedness-6-1-11"></a>

### Stability of mixed complexes under the six operations and duality

Let f : X → Y be a morphism of schemes of finite type over 𝔽_p (Weil sheaves), or in context (6.1.1) b). Then Rf_*, Rf_!, f* and Rf^! carry D^b_m to D^b_m; so do ⊗, the local RHom (and the local ℰxt^i), and the duality functor D. In particular the dualizing complex K_X = Ra^!ℚ̄_ℓ is mixed, and D^b_m(X) is stable under all the operations of EDC.0–EDC.1.

Hypotheses and scope:

- Contexts (6.1.1) a) and b)
- Mixedness only: the weight estimates are DWP.8/directional-weight-estimates
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Rf_*: DWP.8/direct-image-preserves-mixedness-6-1-2 and the spectral sequence R^pf_*ℋ^qK ⇒ ℋ^{p+q}Rf_*K. Rf_!: 3.3.1 and the same spectral sequence. f* and ⊗: stalks and the stabilities (1.2.5) (DWP.7/weights-mixed-sheaves-definitions); the Tor terms vanish over a field.
2. Rf^! first: locally factor f as a closed immersion i followed by a smooth morphism g of relative dimension N. Rg^! = g*(N)[2N] (EDC.2). For the complementary open j, the triangle i_*i^!L → L → Rj_*j*L (EDC.1) gives i^!L = i*(cone(L → Rj_*j*L))[−1], mixed by the already proved operations and stability under triangles (DWP.8/mixed-complexes).
3. RHom: stratify the first argument into extensions of j_!ℱ, where j : U → X is locally closed and ℱ is lisse. The correct adjunction is RHom(j_!ℱ,L) = Rj_*RHom(ℱ,j^!L) = Rj_*(ℱ^∨ ⊗ j^!L). Use the preceding Rf^! case, tensor, and Rf_*. For an open j, j^!=j*; this equality does not hold for an arbitrary locally closed immersion. Local ℰxt^i are the cohomology sheaves.
4. The dualizing complex K_X = Ra^!ℚ̄_ℓ is mixed by Rf^!, and D=RHom(−,K_X) preserves mixedness by the RHom case. This order avoids assuming RHom or duality stability while proving Rf^!.

Acceptance checks:

- Acceptance: on a smooth X₀ of pure dimension d, K_{X₀} = ℚ̄_ℓ(d)[2d] is mixed, indeed pure of weight 0: ℋ^{−2d} = ℚ̄_ℓ(d) has weight −2d = 0 + (−2d).
- Acceptance: for a closed point i : x → 𝔸¹ over 𝔽_q, i^!ℚ̄_ℓ = ℚ̄_ℓ(−1)[−2] is mixed.

Direct inputs: [DWP.8/direct-image-preserves-mixedness-6-1-2](#dwp-8-direct-image-preserves-mixedness-6-1-2), [DWP.7/fundamental-direct-image-theorem-3-3-1](#dwp-7-fundamental-direct-image-theorem-3-3-1), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`, [DWP.8/mixed-complexes](#dwp-8-mixed-complexes).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Corollaire (6.1.11), p. 246.

Declaration id: `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`.

<a id="dwp-8-mixed-sheaves-with-galois-action-on-the-special-fibre"></a>

### Mixed sheaves on the special fibre with an action of the generic Galois group

Let S be a smooth curve over 𝔽_q (resp. in context (6.1.1) b)), s a closed point, S_(s) the henselisation (a henselian trait) with generic point η, s̄ and η̄ geometric points, I ⊂ Gal(η̄/η) the inertia group, and X an S-scheme of finite type with special fibre X_s. A Galois sheaf on X_s̄ is a sheaf 𝒢 on X_s̄ with a continuous action ρ of Gal(η̄/η) over its action on X_s̄ through Gal(s̄/s) (SGA 7 XIII 1.1, LPV.0). Define (𝒢, ρ) to be mixed as follows. (a) If ρ factors through Gal(s̄/s), (𝒢, ρ) is a sheaf on X_s (SGA 7 XIII (1.1.3)), and it is mixed when that sheaf is. (b) If (𝒢, ρ) has a finite filtration F by Galois subsheaves such that ρ on Gr_F factors through Gal(s̄/s) (unipotent case), it is mixed when Gr_F(𝒢) is mixed in the sense (a). (c) In general the action of I is quasi-unipotent (LPV.1), so (b) applies after replacing Gal(η̄/η) by an open subgroup, i.e. after a finite extension of the trait; (𝒢, ρ) is mixed when it becomes mixed in the sense (b) after such a change of trait. The notion does not depend on the filtration or on the finite extension.

Hypotheses and scope:

- Henselian trait from a smooth curve over 𝔽_q (equal characteristic)
- Continuous Galois action; quasi-unipotence of inertia from LPV.1
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses that determine the interface:

- Weil II Théorème (6.1.13), p. 246: nearby cycles of a mixed sheaf are mixed in this sense
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the weight-filtered specialisation argument of the local invariant cycle theorem applies weights to inertia invariants of nearby cycles
- PAPER-SCHOLZE-12/142 (Deligne's weight–monodromy theorem in equal characteristic): weights of the special-fibre Galois module H^i(X_k̄) with its inertia action

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.IsMixedGalois` | data | IsMixedGalois (𝒢, ρ) : Prop, defined by (a)–(c). |
| `TauCeti.Weights.isMixedGalois_of_unramified` | compatibility | If ρ factors through Gal(s̄/s), IsMixedGalois (𝒢, ρ) ↔ IsMixed of the corresponding sheaf on X_s. |
| `TauCeti.Weights.isMixedGalois_iff_filtration` | characterisation | In the unipotent case, mixedness may be tested on any filtration F with unramified graded pieces. |
| `TauCeti.Weights.isMixedGalois_changeOfTrait` | functoriality | Invariant under finite extension of the trait. |
| `TauCeti.Weights.IsMixedGalois.subquotient` | other | Stable under Galois subsheaves, quotients and extensions. |
| `TauCeti.Weights.IsMixedGalois.tensor` | other | Stable under tensor products. |
| `TauCeti.Weights.IsMixedGalois.invariants` | other | If (𝒢, ρ) is mixed then so is its subsheaf of I-invariants, a sheaf on X_s. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isMixedGalois_trivial` | computation | For X = S and 𝒢 = ℚ̄_ℓ with trivial inertia action, (𝒢, ρ) is mixed of weight 0 (case (a)). |
| `TauCeti.Weights.isMixedGalois_tate_curve` | computation | For the Tate elliptic curve over 𝔽_q((t)) (split multiplicative reduction), H¹(E_η̄, ℚ̄_ℓ) with its unipotent inertia action has the filtration ℚ̄_ℓ ⊂ H¹ with graded pieces ℚ̄_ℓ (weight 0) and ℚ̄_ℓ(−1) (weight 2): mixed, case (b). |
| `TauCeti.Weights.isMixedGalois_quadratic_twist` | computation | A quadratic character of I (tamely ramified, p ≠ 2) becomes trivial after a degree-2 extension of the trait: case (c) applies. |
| `TauCeti.Weights.isMixedGalois_zero` | degenerate | The zero Galois sheaf is mixed. |
| `TauCeti.Weights.not_isMixedGalois_transcendental` | non-example | If a lift of Frobenius acts on the inertia invariants of a rank-one Galois sheaf on X_s̄ = Spec s̄ by a transcendental number, the sheaf is not mixed. |

Proof or construction:

1. Independence of the filtration in (b): two such filtrations have a common refinement (Schreier/Zassenhaus) whose graded pieces are subquotients of both, and mixedness is stable under subquotients and extensions (DWP.7/weights-mixed-sheaves-definitions).
2. Independence of the finite extension in (c): mixedness of a sheaf on X_s is unchanged by the finite base extension k(s) ⊂ k(s′) (Frobenius powers, DWP.0/finite-field-base-extension-of-weights), and any two finite extensions are dominated by a third.
3. Quasi-unipotence (SGA 7 I, LPV.1) guarantees that (c) is always applicable.

Acceptance checks:

- The sheaves of nearby cycles R^iΨ(ℱ) of LPV.0 are Galois sheaves on X_s̄; for ℱ mixed they are mixed in this sense (DWP.8/nearby-cycles-preserve-mixedness-6-1-13).

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.1`, [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, (6.1.12), p. 246.

Declaration id: `DeligneWeightsAndPurity:DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre`.

<a id="dwp-8-nearby-cycles-preserve-mixedness-6-1-13"></a>

### Nearby cycles of a mixed sheaf are mixed

In the setting of DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre, let ℱ be a mixed sheaf on X (X of finite type over S). Then the sheaves of nearby cycles R^iΨ(ℱ) on X_s̄, with their action of Gal(η̄/η), are mixed for every i.

Hypotheses and scope:

- S a smooth curve over 𝔽_q (or context (6.1.1) b)); X of finite type over S
- No weight bound is asserted, only mixedness; the weight–monodromy statements are LPV.7's
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. By the monodromy theorem (LPV.1) replace the trait by a finite extension so that I acts unipotently, through its quotient ℤ_ℓ(1).
2. The monodromy filtration constructions of Weil II (1.6.1), (1.6.14) (LPV.1 for the linear algebra, DWP.5 for its weight interpretation) reduce mixedness of R^iΨ(ℱ) to mixedness of the inertia invariants (R^iΨ(ℱ))^I.
3. As in the proof of Weil II (3.6.1), these invariants are quotients of u*R^iv_*(ℱ|X_η), where u : X_s → X and v : X_η → X are the inclusions (specialisation sequence of LPV.0); they are mixed by DWP.8/six-operations-preserve-mixedness-6-1-11.

Acceptance checks:

- Acceptance: for a smooth proper X over S, R⁰Ψ(ℚ̄_ℓ) = ℚ̄_ℓ and R^iΨ(ℚ̄_ℓ) = 0 for i > 0; the conclusion is that ℚ̄_ℓ on X_s is mixed, indeed pure of weight 0
- Acceptance: for the Tate curve family over the trait (a node with local equation xy = π in relative dimension 1), R¹Ψ(ℚ̄_ℓ) is supported at the node with stalk R¹Φ = ℚ̄_ℓ(−1), on which inertia acts trivially (pure of weight 2); the rank-two unipotent action with graded weights 0 and 2 is on H¹(X_η̄) = H¹(X_s̄, RΨℚ̄_ℓ), whose weight-0 piece is H¹ of the nodal fibre and whose weight-2 piece is H⁰(X_s̄, R¹Ψ)

Direct inputs: [DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre](#dwp-8-mixed-sheaves-with-galois-action-on-the-special-fibre), [DWP.8/six-operations-preserve-mixedness-6-1-11](#dwp-8-six-operations-preserve-mixedness-6-1-11), `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.1`, [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Théorème (6.1.13), p. 246.

Declaration id: `DeligneWeightsAndPurity:DWP.8/nearby-cycles-preserve-mixedness-6-1-13`.

<a id="dwp-8-compact-support-direct-image-upper-weights-6-2-3"></a>

### Rf_! preserves complexes of weights ≤ w

Let f : X₀ → Y₀ be a morphism of schemes of finite type over 𝔽_q. If K ∈ D^b_c(X₀) is mixed of weights ≤ w, then Rf_!K is mixed of weights ≤ w. The ι-variant holds with w ∈ ℝ.

Hypotheses and scope:

- f separated of finite type (Rf_! as in EDC.0)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Use the spectral sequence E₂^{pq} = R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K (printed E₁, PAPER-DELIGNE-80/E70).
2. By DWP.7/fundamental-direct-image-theorem-3-3-1, E₂^{pq} is mixed of punctual weights ≤ p + (q + w); the abutment ℋ^{p+q}Rf_!K has a finite filtration with subquotients of the E₂^{pq}, hence is mixed of punctual weights ≤ (p + q) + w.
3. The ι-variant uses DWP.7/iota-mixed-direct-image-3-3-10.

Acceptance checks:

- Acceptance: for f : 𝔸¹ → Spec 𝔽_q and K = ℚ̄_ℓ[1] (pure of weight 1), RΓ_c(𝔸¹, ℚ̄_ℓ)[1] has H¹ = ℚ̄_ℓ(−1) of weight 2 ≤ 1 + 1.

Direct inputs: [DWP.7/fundamental-direct-image-theorem-3-3-1](#dwp-7-fundamental-direct-image-theorem-3-3-1), [DWP.7/iota-mixed-direct-image-3-3-10](#dwp-7-iota-mixed-direct-image-3-3-10), [DWP.8/mixed-complexes](#dwp-8-mixed-complexes), `EtaleDualityAndPerverseSheaves:EDC.0`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Variante (6.2.3), p. 247.

Declaration id: `DeligneWeightsAndPurity:DWP.8/compact-support-direct-image-upper-weights-6-2-3`.

<a id="dwp-8-twist-shift-and-smooth-lisse-purity-6-2-5"></a>

### Purity on a smooth scheme is pointwise purity of lisse cohomology sheaves

Let X₀ be of finite type over 𝔽_q. (a) For every N ∈ ℤ, K is mixed of weights ≤ w iff K(N)[2N] is; hence in the definition of purity the dualizing complex may be replaced by any complex locally isomorphic to K_{X₀}(N)[2N]. (b) If X₀ is smooth, K has weights ≥ w iff RHom(K, ℚ̄_ℓ) has weights ≤ −w. If moreover every ℋ^iK is lisse, K is pure of weight w iff every ℋ^iK is punctually pure of weight w + i. (c) Consequently, for X₀ smooth and ℱ₀ lisse and punctually pure of weight w, the complex `ℱ₀[m](r)` is pure of weight w + m − 2r. The ι-variants hold.

Hypotheses and scope:

- (b), (c): X₀ smooth; lisse cohomology sheaves
- A stalkwise pure sheaf on a singular X₀ need not be pure (DWP.8/pure-complexes, test not_isPureComplex_nodal)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (a) ℋ^i(K(N)[2N]) = ℋ^{i+2N}(K)(N), whose weights are those of ℋ^{i+2N}K minus 2N; so the bound w + (i + 2N) becomes w + i.
2. (b) On smooth X₀ of pure dimension d, K_{X₀} = ℚ̄_ℓ(d)[2d] (EDC.2), so DK = RHom(K, ℚ̄_ℓ)(d)[2d] and (a) applies. If the ℋ^iK are lisse, the local ℰxt^p(ℋ^iK, ℚ̄_ℓ) vanish for p > 0, so ℋ^{−i}RHom(K, ℚ̄_ℓ) = (ℋ^iK)^∨, mixed with the negatives of the weights of ℋ^iK (DWP.0/spectra-of-tensor-products-and-duals). Thus K ≥ w iff every ℋ^iK has weights ≥ w + i, and together with K ≤ w iff every ℋ^iK has all weights equal to w + i, i.e. is punctually pure of weight w + i (a mixed sheaf all of whose weights equal m is an iterated extension of punctually pure sheaves of weight m, hence punctually pure).
3. (c) ℋ^{−m}(`ℱ₀[m](r)`) = ℱ₀(r), punctually pure of weight w − 2r = (w + m − 2r) + (−m); apply (b).

Acceptance checks:

- Acceptance: on 𝔸^d over 𝔽_q, ℚ̄_ℓ[d] is pure of weight d and ℚ̄_ℓ(1)[2] is pure of weight 0; a half-integral twist needs a chosen square root of q (DWP.0/twisting-by-rank-one-characters), and then `ℚ̄_ℓ[d](d/2)` is pure of weight 0.
- Acceptance: on a smooth curve, a lisse sheaf punctually pure of weight w placed in degree −1 is pure of weight w + 1 (the perverse normalisation of EDC.7).

Direct inputs: [DWP.8/pure-complexes](#dwp-8-pure-complexes), [DWP.8/mixed-complexes](#dwp-8-mixed-complexes), `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`, [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Exemples (6.2.5) a), b), p. 247.

Declaration id: `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`.

<a id="dwp-8-intermediate-direct-image-purity-6-2-5cd"></a>

### j_* of a pure lisse sheaf across a smooth divisor is pure

(c) Let X₀ be a smooth curve over 𝔽_q, j : U₀ → X₀ a dense open and ℱ₀ a lisse sheaf on U₀, punctually pure of weight w (equivalently, by DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5, ℱ₀ is pure of weight w as a sheaf). Then j_*ℱ₀ is pure of weight w. (d) Let X₀ be smooth, D₀ ⊂ X₀ a smooth divisor, j : U₀ = X₀ − D₀ → X₀, and ℱ₀ lisse on U₀, punctually pure of weight w and tamely ramified along D₀. Then j_*ℱ₀ is pure of weight w. The ι-variants hold.

Hypotheses and scope:

- (c): smooth curve; (d): smooth divisor and tame ramification
- ℱ₀ lisse: the source states (c) for a pure sheaf on U₀ and proves it through (1.8.8.1), which concerns lisse sheaves; the lisse case is the one used
- j_* is the underived direct image, placed in degree 0
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Upper bound: j_*ℱ₀ is mixed (1.8.9, DWP.5) and its stalks at points of D₀ (or of X₀ − U₀) are the inertia invariants of ℱ, contained in Ker N ⊂ M₀ (Weil II (1.8.8) 1) and 2)), of weights ≤ w (DWP.5's local weight theorem). So j_*ℱ₀ has weights ≤ w.
2. Lower bound: D(j_*ℱ₀) = j_*(Dℱ₀) up to the shift and twist of the smooth dualizing complex, by the formula RHom(j_*ℱ, ℚ̄_ℓ) = j_*ℋom(ℱ, ℚ̄_ℓ) (Weil II's argument; local duality on a smooth curve or along a smooth divisor for tame ℱ, EDC.1–EDC.2). Since ℱ₀^∨ is lisse and punctually pure of weight −w, the first step gives weights ≤ −w for D(j_*ℱ₀) after renormalising by DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (a).

Acceptance checks:

- Acceptance: j : 𝔾_m → ℙ¹, ℱ₀ = ℚ̄_ℓ: j_*ℚ̄_ℓ = ℚ̄_ℓ on ℙ¹ is pure of weight 0.
- Acceptance: for the Legendre family h over ℙ¹ − {0, 1, ∞}, j_*R¹h_*ℚ̄_ℓ is pure of weight 1: its stalks at the multiplicative points 0 and 1 are the one-dimensional inertia invariants, of weight 0 ≤ 1, its stalk at ∞ (monodromy minus a unipotent) is 0, and its dual is again of this form. Here H¹(ℙ¹, j_*R¹h_*ℚ̄_ℓ) = 0 (Euler characteristic; there are no cusp forms of weight 3 for Γ(2)), so a global test needs Sym^k with nonzero parabolic cohomology
- Non-example: Rj_*ℚ̄_ℓ for j : 𝔾_m → ℙ¹ is not pure of weight 0: R¹j_*ℚ̄_ℓ has weight 2 at 0 and ∞.

Direct inputs: [DWP.8/pure-complexes](#dwp-8-pure-complexes), [DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5](#dwp-8-twist-shift-and-smooth-lisse-purity-6-2-5), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Exemples (6.2.5) c), p. 248.

Declaration id: `DeligneWeightsAndPurity:DWP.8/intermediate-direct-image-purity-6-2-5cd`.

<a id="dwp-8-directional-weight-estimates"></a>

### Weight estimates for the six operations

Let f : X₀ → Y₀ be a morphism of schemes of finite type over 𝔽_q, and a, b, w ∈ ℤ. (i) f* and Rf_! carry complexes of weights ≤ w to complexes of weights ≤ w. (ii) Rf_* and Rf^! carry complexes of weights ≥ w to complexes of weights ≥ w. (iii) D exchanges 'weights ≤ w' and 'weights ≥ −w'. (iv) If K has weights ≤ a and L has weights ≤ b, then K ⊗ L has weights ≤ a + b. (v) If K has weights ≤ a and L has weights ≥ b, then RHom(K, L) has weights ≥ b − a. The ι-variants hold with real weights. No other preservation is asserted: Rf_* and Rf^! need not preserve upper bounds, f* and Rf_! need not preserve lower bounds, and a pure complex need not split into its cohomology sheaves.

Hypotheses and scope:

- Finite type over 𝔽_q; mixed complexes
- Each functor preserves one bound only
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (i) f*: for y ∈ |X₀| over x = f(y), F_y acts on (f*ℋ^iK)_ȳ = ℋ^i(K)_x̄ as F_x^{[k(y):k(x)]} and N(y) = N(x)^{[k(y):k(x)]}, so weights are unchanged (DWP.0/weil-number-base-extension); mixedness passes by (1.2.5). Rf_!: DWP.8/compact-support-direct-image-upper-weights-6-2-3.
2. (iii) is the definition of weights ≥ (DWP.8/pure-complexes) together with biduality (EDC.1). (ii) Rf_* = D Rf_! D and Rf^! = D f* D (EDC.1 exchange isomorphisms), then (i) and (iii).
3. (iv) The spectral sequence of the canonical filtrations gives ℋ^n(K ⊗ L) a finite filtration with subquotients of ⊕_{i+j=n} ℋ^iK ⊗ ℋ^jL (no Tor terms over a field, EDC.0); tensor products of mixed sheaves are mixed with weights adding (1.2.5), so ℋ^n has weights ≤ (a + i) + (b + j) = a + b + n.
4. (v) RHom(K, L) = D(K ⊗ DL) by D(K ⊗ M) = RHom(K, DM) with M = DL and biduality; K ⊗ DL has weights ≤ a − b by (iii), (iv), so its dual has weights ≥ b − a.

Acceptance checks:

- Non-example: for j : 𝔾_m → ℙ¹ and ℚ̄_ℓ (pure of weight 0 on 𝔾_m), Rj_*ℚ̄_ℓ is not of weights ≤ 0 (R¹j_* has weight 2 > 0 + 1), and j_!ℚ̄_ℓ is not of weights ≥ 0 (its dual Rj_*ℚ̄_ℓ(1)[2] has ℋ^{−1} of weight 0 > −0 − 1).
- Acceptance: for X₀ smooth proper and K pure of weight w, (i) and (ii) together give purity of Rf_*K = Rf_!K (DWP.8/proper-direct-image-preserves-purity-6-2-6).
- Acceptance: for L lisse pure of weight b on smooth X₀ and K = ℚ̄_ℓ (pure of weight 0), RHom(ℚ̄_ℓ, L) = L has weights ≥ b.

Direct inputs: [DWP.8/compact-support-direct-image-upper-weights-6-2-3](#dwp-8-compact-support-direct-image-upper-weights-6-2-3), [DWP.8/pure-complexes](#dwp-8-pure-complexes), [DWP.8/six-operations-preserve-mixedness-6-1-11](#dwp-8-six-operations-preserve-mixedness-6-1-11), `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1`, [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, (6.2.1), p. 247.

Declaration id: `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`.

<a id="dwp-8-proper-direct-image-preserves-purity-6-2-6"></a>

### Proper direct images of pure complexes are pure

Let f : X₀ → Y₀ be a proper morphism of schemes of finite type over 𝔽_q and K ∈ D^b_c(X₀) pure of weight w. Then Rf_*K is pure of weight w. In particular, for X₀ proper over 𝔽_q and K pure of weight w, H^i(X, K) is pure of weight w + i for every i. The ι-variant holds.

Hypotheses and scope:

- f proper
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Purity of proper direct images**.

Proof or construction:

1. Rf_* = Rf_! for f proper; Rf_!K has weights ≤ w by DWP.8/compact-support-direct-image-upper-weights-6-2-3.
2. D Rf_*K = Rf_! DK (EDC.1, f proper), and DK has weights ≤ −w, so DRf_*K has weights ≤ −w.
3. For Y₀ = Spec 𝔽_q, a complex is pure of weight w iff each H^i is pure of weight w + i (DWP.8/pure-complexes test isPureComplex_point_iff).

Acceptance checks:

- Acceptance: X₀ smooth proper, K = ℚ̄_ℓ: H^i pure of weight i, agreeing with DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11.
- Acceptance: X₀ = ℙ¹, K = j_*ℱ for a pure lisse ℱ on an open curve (DWP.8/intermediate-direct-image-purity-6-2-5cd): H¹(ℙ¹, j_*ℱ) is pure, which is DWP.6's theorem.
- Non-example: for f non-proper, e.g. 𝔾_m → Spec 𝔽_q and K = ℚ̄_ℓ, Rf_*ℚ̄_ℓ is not pure (H¹ = ℚ̄_ℓ(−1) has weight 2 ≠ 1).

Direct inputs: [DWP.8/compact-support-direct-image-upper-weights-6-2-3](#dwp-8-compact-support-direct-image-upper-weights-6-2-3), [DWP.8/pure-complexes](#dwp-8-pure-complexes), `EtaleDualityAndPerverseSheaves:EDC.1`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Proposition (6.2.6), p. 248.

Declaration id: `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`.

<a id="dwp-8-variant-over-z-one-over-ell-6-2-7"></a>

### Pure complexes over ℤ[1/ℓ]

For X of finite type over ℤ[1/ℓ] with structure map a : X → Spec ℤ[1/ℓ], put K′_X = Ra^!ℚ̄_ℓ and D′ = RHom(−, K′_X). Call K ∈ D^b_c(X) pure of weight w when K is mixed of weights ≤ w (DWP.8/mixed-complexes, read on schemes of finite type over ℤ[1/ℓ]) and D′K is mixed of weights ≤ −w. If X is of finite type over 𝔽_p then K′_X = K_X(−1)[−2], so D′ = D(−1)[−2] and this notion agrees with that of DWP.8/pure-complexes. Proper direct images preserve this purity: for f : X → Y proper over ℤ[1/ℓ] and K pure of weight w, Rf_*K is pure of weight w.

Hypotheses and scope:

- Schemes of finite type over ℤ[1/ℓ]; exceptional inverse image and biduality over the regular one-dimensional base ℤ[1/ℓ] from EDC.1
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. For i : Spec 𝔽_p → Spec ℤ[1/ℓ], i^!ℚ̄_ℓ = ℚ̄_ℓ(−1)[−2]: this is the local cohomology of the henselisation of ℤ_(p), a discrete valuation ring with ℓ invertible, computed by Kummer theory (requested from EDC.1, which identifies i_*i^! with local cohomology; it is the dimension-one case, not Gabber's general absolute purity). So K′_X = Ra_p^! i^!ℚ̄_ℓ = K_X(−1)[−2] and D′K = DK(−1)[−2]; by DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (a) with N = −1 the two bounds agree.
2. Rf_! preserves weights ≤ w over ℤ[1/ℓ] by DWP.7/fundamental-direct-image-theorem-3-3-1 and the spectral sequence of DWP.8/compact-support-direct-image-upper-weights-6-2-3; for f proper D′Rf_* = Rf_*D′ (EDC.1 over ℤ[1/ℓ]); conclude as in DWP.8/proper-direct-image-preserves-purity-6-2-6.

Acceptance checks:

- Acceptance: X = Spec ℤ[1/ℓ], K = ℚ̄_ℓ: a is the identity, so K′_X = ℚ̄_ℓ, D′ℚ̄_ℓ = ℚ̄_ℓ and ℚ̄_ℓ is pure of weight 0 in this sense; for X over 𝔽_p the formula K′_X = K_X(−1)[−2] applies

Direct inputs: [DWP.8/pure-complexes](#dwp-8-pure-complexes), [DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5](#dwp-8-twist-shift-and-smooth-lisse-purity-6-2-5), [DWP.8/compact-support-direct-image-upper-weights-6-2-3](#dwp-8-compact-support-direct-image-upper-weights-6-2-3), [DWP.7/fundamental-direct-image-theorem-3-3-1](#dwp-7-fundamental-direct-image-theorem-3-3-1), `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Variante (6.2.7), p. 248.

Declaration id: `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`.

<a id="dwp-8-geometric-semisimplicity"></a>

### Geometric monodromy and geometrically semisimple lisse sheaves

Let X₀ be a connected normal scheme of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, x̄ a geometric point of X. The arithmetic and geometric fundamental groups π₁(X₀, x̄) ⊃ π₁(X, x̄) fit into 1 → π₁(X, x̄) → π₁(X₀, x̄) → Gal(𝔽̄_q/𝔽_q) → 1 (for X₀ geometrically connected; IG.1), and the Weil group W(X₀, x̄) is the preimage of the subgroup generated by the geometric Frobenius F. A lisse ℚ̄_ℓ-(Weil) sheaf ℱ₀ is a continuous representation ρ of W(X₀, x̄) on V = ℱ_x̄ (EDC.0). Its geometric monodromy group is ρ(π₁(X, x̄)) ⊂ GL(V) (Weil II 1.1.15). ℱ₀ is geometrically semisimple when the pullback ℱ on X is semisimple, i.e. ρ|π₁(X, x̄) is a semisimple representation (V is a direct sum of irreducible π₁(X, x̄)-subrepresentations); it is arithmetically semisimple when ρ is semisimple. For X₀ not geometrically connected, apply the definitions on each connected component of X.

Hypotheses and scope:

- X₀ normal, so that π₁ of a dense open surjects onto π₁(X₀) and lisse sheaves are representations
- Semisimplicity of the restriction to the geometric fundamental group, not of the arithmetic representation
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses that determine the interface:

- Weil II Théorème (3.4.1) (iii), p. 207: the conclusion of the semisimplicity theorem
- Weil II (4.1.3)–(4.1.4), p. 218: complete reducibility of the monodromy representation on H^{n−1}(Y) makes the cup-product form nondegenerate on invariants
- PAPER-ABDURRAHMAN-VENKATESH-25/8 (Lemma 6.5.2): geometric monodromy of a pure lisse sheaf is semisimple, so its Zariski closure has reductive identity component
- PAPER-CADORET-HUI-TAMAGAWA-17/23 (Fact 3.2): geometric semisimplicity from the pure-lisse theorem on a normal base, not arithmetic semisimplicity
- EtaleDualityAndPerverseSheaves:EDC.7: geometric semisimplicity of perverse direct images

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.IsGeometricallySemisimple` | data | For ρ : Representation E W V and a subgroup G ≤ W: IsGeometricallySemisimple ρ G : Prop := IsSemisimpleModule (MonoidAlgebra E G) (ρ.comp G.subtype).asModule; for a lisse sheaf, W = W(X₀, x̄) and G = π₁(X, x̄). |
| `TauCeti.Weights.geometricMonodromyGroup` | data | The image ρ(π₁(X, x̄)) ⊂ GL(V). |
| `TauCeti.Weights.IsGeometricallySemisimple.of_isSemisimple` | relation | For a finite-dimensional representation ρ over a field and G normal in W: ρ semisimple ⇒ ρ\|G semisimple, by the pinned Tau Ceti Clifford theorem on each irreducible summand. |
| `TauCeti.Weights.isGeometricallySemisimple_iff_restrict_open` | characterisation | For X₀ normal and U₀ ⊂ X₀ a dense open: ℱ₀ is geometrically semisimple iff ℱ₀\|U₀ is (π₁(U) → π₁(X) is surjective, IG.0). |
| `TauCeti.Weights.isGeometricallySemisimple_baseExtension` | compatibility | Unchanged by the base extension 𝔽_q → 𝔽_{q^r} (same geometric fundamental group). |
| `TauCeti.Weights.IsGeometricallySemisimple.subquotient` | other | Lisse subsheaves, quotients and direct summands of a geometrically semisimple sheaf are geometrically semisimple; finite direct sums of geometrically semisimple sheaves are. |
| `TauCeti.Weights.IsGeometricallySemisimple.dual` | other | The dual of a geometrically semisimple lisse sheaf is geometrically semisimple. |
| `TauCeti.Weights.maximalGeometricallySemisimpleSubsheaf` | constructor | The largest geometrically semisimple lisse subsheaf (sum of the irreducible lisse subsheaves of ℱ), stable under Frobenius and hence defined over X₀. |
| `TauCeti.Weights.isGeometricallySemisimple_iff_reductive` | relation | With algebraically closed characteristic-zero coefficients and finite-dimensional stalk: ℱ₀ is geometrically semisimple iff the identity component of the Zariski closure of its geometric monodromy group is reductive (tauceti ReductiveGroups layer 6). The closure acts faithfully; invariant subspaces are unchanged by Zariski closure. |
| `TauCeti.Weights.mem_geometricMonodromyGroup` | characterisation | A linear automorphism a belongs to geometricMonodromyGroup ρ G iff a = ρ g for some g ∈ G. When stored as an endomorphism submonoid, every element is invertible since G is a group. |
| `TauCeti.Weights.geometricMonodromyGroup_conjugate` | functoriality | An isomorphism of stalk representations conjugates the geometric monodromy image; changing the geometric base point gives this conjugacy, so geometric semisimplicity is independent of the base point. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isGeometricallySemisimple_jordan` | non-example | On Spec 𝔽_q the rank-two Weil sheaf on which F acts by [[1, 1], [0, 1]] is geometrically semisimple (the geometric group is trivial) but not arithmetically semisimple: purity of weight 0 does not give semisimple Frobenius. |
| `TauCeti.Weights.not_isGeometricallySemisimple_kummer` | non-example | On 𝔾_m over 𝔽_q, the Kummer extension 0 → ℚ̄_ℓ(1) → ℒ → ℚ̄_ℓ → 0 classified by the Kummer class of the coordinate in H¹(𝔾_m, ℚ̄_ℓ(1)) is not geometrically semisimple: its geometric class in H¹(𝔾_{m,𝔽̄_q}, ℚ̄_ℓ(1)) ≅ ℚ̄_ℓ is nonzero. |
| `TauCeti.Weights.isGeometricallySemisimple_point` | degenerate | Every lisse sheaf on Spec 𝔽_q is geometrically semisimple; so is the zero sheaf on any X₀. |
| `TauCeti.Weights.isGeometricallySemisimple_of_semisimple` | compatibility | For a representation ρ of a group W and a normal subgroup G, if ρ is semisimple then ρ\|G is semisimple (Clifford), so arithmetic semisimplicity implies geometric semisimplicity. |

Proof or construction:

1. Ordinary lisse sheaves on normal connected X₀ correspond to continuous finite-dimensional π₁(X₀)-representations; compactness gives a stable lattice over a finite coefficient extension. For lisse Weil sheaves use W(X₀); only its profinite geometric subgroup is required to preserve such a lattice, while the chosen Frobenius may act by any invertible ℓ-adic scalar (Weil II 1.1.14, EDC.0, IG.0).
2. The socle (sum of irreducible subrepresentations) of ρ|π₁(X, x̄) is stable under W(X₀, x̄) because π₁(X, x̄) is normal in it; so geometric semisimplicity is a property of ℱ₀, and the maximal geometrically semisimple lisse subsheaf descends to X₀.
3. For the arithmetic-to-geometric semisimplicity API, finite-dimensionality gives a finite sum of irreducible W-representations. Apply the pinned Tau Ceti Clifford theorem isSemisimpleRepresentation_comp_subtype to each normal-subgroup restriction and take their finite direct sum; this imports the existing theorem rather than planning Clifford theory again.

Acceptance checks:

- Over Spec 𝔽_q every lisse sheaf is geometrically semisimple (π₁ of Spec 𝔽̄_q is trivial).
- Arithmetic semisimplicity implies geometric semisimplicity (Clifford's argument for the normal subgroup π₁(X, x̄)).

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `mathlib:Representation`, `mathlib:IsSemisimpleModule`, `mathlib:Representation.asModule`, `tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1, (1.1.15), p. 153; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (iii), p. 207.

Declaration id: `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`.

<a id="dwp-8-ext-one-of-lisse-sheaves-3-4-2"></a>

### The Ext¹ sequence of lisse sheaves over a finite field

Let X₀ be of finite type over 𝔽_q and ℱ₀, 𝒢₀ lisse sheaves on X₀ (Weil sheaves allowed). (i) There is an exact sequence 0 → H⁰(X, ℋom(ℱ, 𝒢))_F → Ext¹(ℱ₀, 𝒢₀) → H¹(X, ℋom(ℱ, 𝒢))^F, where Ext¹ is the group of extension classes in the abelian category of sheaves on X₀, the right arrow is pullback to X followed by Ext¹(ℱ, 𝒢) = H¹(X, ℋom(ℱ, 𝒢)), and the subscript (resp. superscript) F denotes coinvariants (resp. invariants) of the Weil group W(𝔽̄_q/𝔽_q) = F^ℤ. (ii) For X₀ normal and geometrically connected this is the five-term sequence of Hochschild–Serre for 1 → π₁(X, x̄) → W(X₀, x̄) → ℤ → 1 with coefficients M = Hom(ℱ_x̄, 𝒢_x̄), using H¹(ℤ, N) = N_F and H²(ℤ, N) = 0.

Hypotheses and scope:

- ℱ₀, 𝒢₀ lisse
- Extensions in the category of all (Weil) sheaves on X₀; for lisse ℱ₀, 𝒢₀ an extension is lisse
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (i) (Weil II's argument.) A geometrically trivial extension ℰ₀ of ℱ₀ by 𝒢₀ has a splitting φ : ℱ → ℰ over X; the other splittings are φ − f with f ∈ Hom(ℱ, 𝒢). The extension is trivial over X₀ iff φ − f can be chosen F-invariant, i.e. Fφ − φ ∈ Hom(ℱ, 𝒢) is of the form Ff − f, i.e. has zero image in Hom(ℱ, 𝒢)_F. The map ℰ₀ ↦ class of Fφ − φ is a bijection between geometrically trivial extension classes and Hom(ℱ, 𝒢)_F = H⁰(X, ℋom(ℱ, 𝒢))_F.
2. The image of Ext¹(ℱ₀, 𝒢₀) → Ext¹(ℱ, 𝒢) lies in the F-invariants by transport of structure; Ext¹ of lisse sheaves on X is H¹(X, ℋom(ℱ, 𝒢)) (local ℰxt of lisse sheaves vanish, EDC.0).
3. (ii) Identify extensions of lisse sheaves with extensions of continuous representations (EDC.0, IG.0–IG.1) and apply the continuous Hochschild–Serre spectral sequence (R02.2) to the closed normal subgroup π₁(X, x̄) with discrete quotient ℤ, whose cohomological dimension is 1. The quotient is ℤ with the stated degree map only in the geometrically connected case; for a merely connected X₀ its image is eℤ, and use the geometric component over the finite constant-field extension 𝔽_{q^e} with Frobenius F^e (Weil II 1.1.13.1). The splitting argument in (i) already treats the global F-action without this restriction.

Acceptance checks:

- Acceptance: X₀ = Spec 𝔽_q, ℱ₀ = 𝒢₀ = ℚ̄_ℓ: Ext¹(ℚ̄_ℓ, ℚ̄_ℓ) = ℚ̄_ℓ_F = ℚ̄_ℓ (the unipotent Jordan block), and H¹(X, ·) = 0.
- Acceptance: X₀ = Spec 𝔽_q, ℱ₀ = ℚ̄_ℓ, 𝒢₀ = ℚ̄_ℓ(1): Ext¹ = ℚ̄_ℓ(1)_F = 0 since F − 1 = q⁻¹ − 1 is invertible.

Direct inputs: `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticGaloisDuality:R02.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Lemme (3.4.2), p. 208.

Declaration id: `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2`.

<a id="dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4"></a>

### Extensions between pure lisse sheaves on a smooth scheme

Let X₀ be smooth of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀, 𝒢₀ lisse sheaves on X₀ punctually ι-pure of weights β and γ. (Lemma 3.4.3) A geometrically nontrivial extension 0 → 𝒢₀ → ℰ₀ → ℱ₀ → 0 can exist only if β ≡ γ (mod ℤ) and β > γ. (Lemma 3.4.4) Ext¹(ℱ₀, 𝒢₀) ≠ 0 only if β ≡ γ (mod ℤ) and β ≥ γ.

Hypotheses and scope:

- X₀ smooth (for the H¹ lower bound)
- Punctual ι-purity at one fixed ι
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. ℋom(ℱ, 𝒢) is lisse and punctually ι-pure of weight γ − β (DWP.0/spectra-of-tensor-products-and-duals).
2. By DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii) in its ι-form (iv), H¹(X, ℋom(ℱ, 𝒢)) has ι-weights ≥ γ − β + 1, and by DWP.7/iota-mixed-direct-image-3-3-10 they lie in γ − β + ℤ. F has a nonzero invariant only if it has eigenvalue 1, of weight 0; so H¹(X, ℋom)^F ≠ 0 forces 0 ∈ (γ − β + ℤ) and 0 ≥ γ − β + 1, i.e. β ≡ γ mod ℤ and β > γ. By DWP.8/ext-one-of-lisse-sheaves-3-4-2 a geometrically nontrivial extension has nonzero image in H¹(X, ℋom)^F.
3. (3.4.4) The H⁰ term H⁰(X, ℋom(ℱ, 𝒢)) ⊂ ℋom(ℱ, 𝒢)_x̄ has ι-weight γ − β; its F-coinvariants are nonzero only if F has eigenvalue 1, forcing γ = β. Combine with the previous step through the exact sequence.

Acceptance checks:

- Acceptance: X₀ = Spec 𝔽_q, ℱ₀ = 𝒢₀ = ℚ̄_ℓ (β = γ = 0): Ext¹ ≠ 0 (the Jordan block), consistent with β ≥ γ; all extensions are geometrically trivial.
- Acceptance: X₀ = 𝔾_m, ℱ₀ = ℚ̄_ℓ (β = 0), 𝒢₀ = ℚ̄_ℓ(1) (γ = −2): the Kummer extension is geometrically nontrivial, consistent with β > γ.
- Non-example: for β < γ, e.g. ℱ₀ = ℚ̄_ℓ(1), 𝒢₀ = ℚ̄_ℓ on Spec 𝔽_q, Ext¹ = 0.

Direct inputs: [DWP.8/ext-one-of-lisse-sheaves-3-4-2](#dwp-8-ext-one-of-lisse-sheaves-3-4-2), [DWP.7/cohomological-bounds-3-3-2-3-3-6](#dwp-7-cohomological-bounds-3-3-2-3-3-6), [DWP.7/iota-mixed-direct-image-3-3-10](#dwp-7-iota-mixed-direct-image-3-3-10), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Lemmes (3.4.3)–(3.4.4), p. 208.

Declaration id: `DeligneWeightsAndPurity:DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`.

<a id="dwp-8-weight-decomposition-modulo-z-3-4-1-i"></a>

### The decomposition of an ι-mixed sheaf by weights modulo ℤ

Let X₀ be of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀ an ι-mixed sheaf on X₀ (Weil sheaves allowed). There is a unique decomposition ℱ₀ = ⊕_{b ∈ ℝ/ℤ} ℱ₀(b), almost all summands zero, such that the punctual ι-weights of ℱ₀(b) lie in b. It is functorial: every morphism ℱ₀ → 𝒢₀ of ι-mixed sheaves maps ℱ₀(b) to 𝒢₀(b). Each ℱ₀(b) is a twist ℋ₀^{(c)} (Weil II 1.2.7) of an ι-mixed sheaf ℋ₀ with integer punctual weights, for any c ∈ ℚ̄_ℓ^× with ι-weight in b. Stalkwise, for x ∈ |X₀|: ℱ₀(b)_x̄ = ⊕_{β ∈ b} ℱ_x̄(β), where ℱ_x̄(β) is the sum of the generalised eigenspaces of F_x for the eigenvalues of ι-weight β relative to N(x).

Hypotheses and scope:

- One fixed ι
- ι-mixed sheaves (real weights)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses that determine the interface:

- Weil II Théorème (3.4.1) (i) and Remarque (1.2.8): reduces real ι-weights to integer weights up to twist
- PAPER-CIUBOTARU-HARRIS-26 (equation (5.5)): decomposition of semisimple local systems into constant-field character twists of systems with integral weights
- DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii: the weight filtration is constructed on each integer-weight piece

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.weightClass` | data | weightClass ℱ₀ (b : ℝ/ℤ) : the summand ℱ₀(b), a subsheaf of ℱ₀. |
| `TauCeti.Weights.weightClass_isInternal` | structure | ℱ₀ is the internal direct sum of the ℱ₀(b), with finitely many nonzero. |
| `TauCeti.Weights.weightClass_stalk` | characterisation | (ℱ₀(b))_x̄ = ⊕_{β ∈ b} ℱ_x̄(β), generalised eigenspaces of F_x. |
| `TauCeti.Weights.weightClass_map` | functoriality | φ : ℱ₀ → 𝒢₀ maps ℱ₀(b) into 𝒢₀(b); weightClass is an exact functor; map_id and map_comp hold. |
| `TauCeti.Weights.weightClass_unique` | characterisation | Any decomposition ℱ₀ = ⊕ 𝒜(b) with the weights of 𝒜(b) in b equals the weight-class decomposition. |
| `TauCeti.Weights.weightClass_eq_twist` | relation | ℱ₀(b) ≅ ℋ₀^{(c)} with ℋ₀ of integer ι-weights, for any c of ι-weight in b. |
| `TauCeti.Weights.weightClass_of_integer` | simp | If all punctual ι-weights of ℱ₀ are integers then ℱ₀(0) = ℱ₀. |
| `TauCeti.Weights.weightClass_tensor` | relation | (ℱ₀ ⊗ 𝒢₀)(b) = ⊕_{b′ + b″ = b} ℱ₀(b′) ⊗ 𝒢₀(b″). |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.weightClass_fractional` | computation | On Spec 𝔽_q with ι fixed and a chosen fourth root q^{1/4}, ℚ̄_ℓ ⊕ ℚ̄_ℓ^{(q^{1/4})} has nonzero classes exactly 0 and 1/2 mod ℤ. |
| `TauCeti.Weights.weightClass_integral` | non-example | ℚ̄_ℓ ⊕ ℚ̄_ℓ(1) on Spec 𝔽_q has all of its weight in the class 0: the decomposition is by weight modulo ℤ, not by weight. |
| `TauCeti.Weights.weightClass_depends_on_iota` | non-example | For b = 1 + √2 (an ℓ-adic unit, of norm −1), ℚ̄_ℓ^{(b)} on Spec 𝔽_q has ι-weight 2 log_q(1 + √2) or −2 log_q(1 + √2) according to ι(√2) = ±√2: the class depends on ι. |
| `TauCeti.Weights.weightClass_zero` | degenerate | The zero sheaf has all classes zero. |
| `TauCeti.Weights.weightClass_point` | compatibility | On Spec 𝔽_q, ℱ₀(b) is the sum of the generalised eigenspaces of F whose ι-weights lie in b, i.e. DWP.0's decomposition (ii) regrouped modulo ℤ. |

Proof or construction:

1. (3.4.6) Uniqueness and functoriality: the stalk formula is forced, since a summand whose weights lie in b must contain the generalised eigenspaces of weights in b and no others (DWP.0/weight-decomposition (ii), DWP.0/disjoint-spectra-no-intertwiner).
2. (3.4.7) Existence for X₀ smooth and ℱ₀ a successive extension of lisse punctually ι-pure sheaves: induction on the length; if ℱ₀ is an extension of ℱ″₀ (decomposed) by ℱ′₀ pure of weight β with class b, then for b′ ≠ b the preimage of ℱ″₀(b′) is a trivial extension by DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4 (Ext¹ = 0 when the weights are not congruent mod ℤ); take ℱ₀(b) the preimage of ℱ″₀(b) and ℱ₀(b′) a lifting of ℱ″₀(b′).
3. (3.4.8) General case by induction on dim X₀: replacing X₀ by X₀,red, choose a dense open j : U₀ → X₀ where (3.4.7) applies (generic lissity and smoothness; 1.8.11 of DWP.5 on a normal U₀); the induction hypothesis applies on the complement i : F₀ → X₀. Glue through the equivalence ℱ₀ ↦ (j*ℱ₀, i*ℱ₀, specialisation s : i*ℱ₀ → i*j_*j*ℱ₀); s maps (i*ℱ₀)(b) into i*j_*((j*ℱ₀)(b)) because, by Weil II (1.8.9) (DWP.5) and twisting, the punctual weights of i*j_*((j*ℱ₀)(b)) lie in b.
4. Twist: if c has ι-weight β₀ ∈ b, then ℱ₀(b)^{(c⁻¹)} has integer ι-weights (Weil II 1.2.7, DWP.0/twisting-by-rank-one-characters).

Acceptance checks:

- The decomposition does not separate integer weights: ℚ̄_ℓ ⊕ ℚ̄_ℓ(1) lies entirely in the class 0.
- Remark (1.2.8) of Weil II: a posteriori real ι-weights reduce to integer weights up to twist.

Direct inputs: [DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4](#dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition), [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `EtaleDualityAndPerverseSheaves:EDC.0`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (i), p. 207; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.4.6), p. 209.

Declaration id: `DeligneWeightsAndPurity:DWP.8/weight-decomposition-modulo-z-3-4-1-i`.

<a id="dwp-8-punctual-weight-filtration-3-4-1-ii"></a>

### The weight filtration of a lisse mixed sheaf

Let X₀ be of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀ a lisse ι-mixed sheaf on X₀ whose punctual ι-weights are integers. There is a unique finite increasing filtration W of ℱ₀ by lisse subsheaves W_iℱ₀ (the filtration by punctual weight) such that Gr^W_i ℱ₀ is punctually ι-pure of weight i for every i. It is functorial, and every morphism between lisse ι-mixed sheaves with integer punctual weights is strictly compatible with the weight filtrations. Stalkwise (W_iℱ₀)_x̄ = ⊕_{β ≤ i} ℱ_x̄(β). For a lisse mixed sheaf (integer weights at every ι) the filtration does not depend on ι (Weil II 3.4.9).

Hypotheses and scope:

- ℱ₀ lisse with integer punctual ι-weights
- A filtration, not a splitting: ℱ₀ need not be the direct sum of its graded pieces
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Weight filtration of a lisse mixed sheaf**.

Uses that determine the interface:

- PAPER-CIUBOTARU-HARRIS-26 (Proposition 2.7(2)): the unique functorial strict weight filtration with pure graded pieces of a lisse mixed rational ℓ-adic sheaf
- PAPER-YUN-ZHANG-17/58 (Lemma 7.13(1)): strictness of the weight filtration in long exact sequences to stabilise bounded-weight terms
- WeightsInEtaleCohomology:R34.1: the strict mixed-sheaf filtration exported through RS-17's one-owner handoff
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the weight-filtered exact-sequence argument of the local invariant cycle theorem

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.weightFiltration` | data | weightFiltration ℱ₀ : ℤ → lisse subsheaves of ℱ₀, i ↦ W_iℱ₀, monotone, W_i = 0 for i ≪ 0 and = ℱ₀ for i ≫ 0. |
| `TauCeti.Weights.weightFiltration_gr_pure` | characterisation | Gr^W_i ℱ₀ is lisse and punctually ι-pure of weight i. |
| `TauCeti.Weights.weightFiltration_unique` | characterisation | Any finite increasing filtration by lisse subsheaves with Gr_i punctually ι-pure of weight i equals W. |
| `TauCeti.Weights.weightFiltration_stalk` | characterisation | (W_iℱ₀)_x̄ = ⊕_{β ≤ i} ℱ_x̄(β). |
| `TauCeti.Weights.weightFiltration_map` | functoriality | φ(W_iℱ₀) ⊆ W_i𝒢₀, with map_id and map_comp for the induced maps on Gr^W. |
| `TauCeti.Weights.weightFiltration_strict` | other | φ(W_iℱ₀) = φ(ℱ₀) ∩ W_i𝒢₀; hence Gr^W is an exact functor. |
| `TauCeti.Weights.weightFiltration_tensor` | relation | W_k(ℱ₀ ⊗ 𝒢₀) = Σ_{i+j=k} W_iℱ₀ ⊗ W_j𝒢₀. |
| `TauCeti.Weights.weightFiltration_dual` | relation | W_i(ℱ₀^∨) = (ℱ₀ / W_{−i−1}ℱ₀)^∨. |
| `TauCeti.Weights.weightFiltration_pullback` | functoriality | g*W_iℱ₀ = W_i(g*ℱ₀) for g : Y₀ → X₀. |
| `TauCeti.Weights.weightFiltration_twist` | simp | W_i(ℱ₀(r)) = (W_{i+2r}ℱ₀)(r). |
| `TauCeti.Weights.weightFiltration_indep_iota` | other | For lisse mixed ℱ₀ (integer weights for every ι), W does not depend on ι. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.weightFiltration_kummer` | computation | For the Kummer extension 0 → ℚ̄_ℓ(1) → ℒ → ℚ̄_ℓ → 0 on 𝔾_m over 𝔽_q: W_{−3} = 0, W_{−2} = W_{−1} = ℚ̄_ℓ(1), W_0 = ℒ. |
| `TauCeti.Weights.weightFiltration_pure` | degenerate | For ℱ₀ punctually pure of weight n: W_{n−1} = 0 and W_n = ℱ₀. |
| `TauCeti.Weights.weightFiltration_not_split` | non-example | The Kummer extension ℒ is not isomorphic to Gr^W ℒ = ℚ̄_ℓ(1) ⊕ ℚ̄_ℓ: the weight filtration is not a grading on the sheaf. |
| `TauCeti.Weights.weightFiltration_point` | compatibility | On Spec 𝔽_q, W_iV is the sum of the generalised eigenspaces of F of weight ≤ i; for the Jordan block [[q, 1], [0, q]], W_1 = 0 and W_2 = V. |
| `TauCeti.Weights.weightFiltration_strict_example` | characterisation | The inclusion ℚ̄_ℓ(1) → ℒ is strict: its image meets W_{−2}ℒ in the whole image, and W_{−1} of the cokernel ℚ̄_ℓ is 0. |

Proof or construction:

1. (3.4.6) Uniqueness and functoriality: the stalk formula is forced (DWP.0/weight-decomposition (ii)); a morphism preserves generalised eigenspaces, so f(W_i) ⊆ W_i, and strictness f(W_iℱ₀) = f(ℱ₀) ∩ W_i𝒢₀ holds stalkwise because both sides are the sum of the generalised eigenspaces of weight ≤ i of f(ℱ_x̄).
2. (3.4.7) Existence for X₀ smooth and ℱ₀ a successive extension of lisse punctually ι-pure sheaves: if ℱ₀ is an extension of ℱ″₀ (filtered) by ℱ′₀ pure of integer weight β, then the preimage of W_{β−1}ℱ″₀ is a trivial extension of W_{β−1}ℱ″₀ by ℱ′₀ (DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4: Ext¹(pure of weight < β, pure of weight β) = 0); for i < β take W_iℱ₀ a lifting of W_iℱ″₀, for i ≥ β the preimage of W_iℱ″₀.
3. (3.4.8) General X₀: uniqueness allows descent, so assume X₀ normal; then ℱ₀ = j_*j*ℱ₀ for a dense open j : U₀ → X₀ where (3.4.7) applies (1.8.11 of DWP.5), and W_iℱ₀ := j_*W_ij*ℱ₀ gives Gr^W_i ℱ₀ = j_*Gr^W_i j*ℱ₀, which is lisse and punctually ι-pure of weight i by Weil II (1.8.10) (DWP.5).
4. Independence of ι for mixed sheaves: the eigenvalues are Weil numbers whose weight does not depend on ι (DWP.0/weil-number-iff-iota-pure-for-every-iota), so the stalk formula does not either.

Acceptance checks:

- Over Spec 𝔽_q the filtration is W_iV = ⊕_{n ≤ i} V_n, DWP.0's weight decomposition read as a filtration.

Direct inputs: [DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4](#dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4), [DWP.8/weight-decomposition-modulo-z-3-4-1-i](#dwp-8-weight-decomposition-modulo-z-3-4-1-i), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition), [DWP.0/weil-number-iff-iota-pure-for-every-iota](#dwp-0-weil-number-iff-iota-pure-for-every-iota), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), `EtaleDualityAndPerverseSheaves:EDC.0`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (ii), p. 207; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (ii), p. 207; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Variante (3.4.9), p. 210.

Declaration id: `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`.

<a id="dwp-8-geometric-semisimplicity-theorem-3-4-1-iii"></a>

### Deligne's semisimplicity theorem: pure lisse sheaves are geometrically semisimple

Let X₀ be a normal scheme of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀ a lisse sheaf on X₀ which is punctually ι-pure (of some weight β ∈ ℝ). Then the pullback ℱ of ℱ₀ to X = X₀ ⊗ 𝔽̄_q is semisimple: ℱ₀ is geometrically semisimple. In particular every lisse punctually pure sheaf on a normal X₀ is geometrically semisimple (Weil II 3.4.9, corrected as in PAPER-DELIGNE-80/E47). Arithmetic semisimplicity is not asserted.

Hypotheses and scope:

- X₀ normal
- ℱ₀ lisse and punctually ι-pure at one ι
- Conclusion after base change to 𝔽̄_q only
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Geometric semisimplicity theorem**.

Proof or construction:

1. (3.4.5) For U₀ ⊂ X₀ a dense open and ū a geometric point of U₀, π₁(U, ū) → π₁(X, ū) is surjective (X normal, IG.0); so geometric semisimplicity may be checked on U₀ (DWP.8/geometric-semisimplicity, api isGeometricallySemisimple_iff_restrict_open), and one may assume X₀ smooth.
2. Let ℱ′ be the largest semisimple lisse subsheaf of ℱ (sum of its irreducible lisse subsheaves). It is Frobenius-stable by transport of structure, hence comes from ℱ′₀ ⊂ ℱ₀; put ℱ″₀ = ℱ₀/ℱ′₀. Both are punctually ι-pure of weight β.
3. By DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4 (equal weights, so β > γ fails), the extension of ℱ″₀ by ℱ′₀ is geometrically trivial. If ℱ″ ≠ 0, a simple lisse subsheaf of ℱ″ lifts to ℱ through the geometric splitting, contradicting the maximality of ℱ′. Hence ℱ″ = 0 and ℱ = ℱ′ is semisimple.

Acceptance checks:

- Acceptance: for an elliptic curve family h : E₀ → S₀ over a smooth curve with nonconstant j-invariant, R¹h_*ℚ̄_ℓ (pure of weight 1) is geometrically irreducible, in particular semisimple.
- Non-example: the Kummer extension ℒ on 𝔾_m (mixed of weights −2 and 0, not pure) is not geometrically semisimple: purity cannot be weakened to mixedness.
- Non-example: the unipotent Weil sheaf [[1, 1], [0, 1]] on Spec 𝔽_q is pure of weight 0 and geometrically semisimple but not arithmetically semisimple; purity of a Weil sheaf does not imply that Frobenius acts semisimply.

Direct inputs: [DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4](#dwp-8-extensions-between-pure-lisse-sheaves-3-4-3-3-4-4), [DWP.8/geometric-semisimplicity](#dwp-8-geometric-semisimplicity), `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Théorème (3.4.1) (iii), p. 207; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.4.5), p. 208.

Declaration id: `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`.

<a id="dwp-8-potentially-property-p-3-4-10"></a>

### Sheaves and complexes potentially having a property P

Let P be a property of sheaves (or of complexes) on schemes of finite type over finite fields, for example 'mixed', 'punctually ι-pure of weight β', or 'pure of weight w' in the sense of DWP.8/pure-complexes. Let k be an algebraically closed field with ℓ invertible in k and X a scheme of finite type over k. A sheaf ℱ (resp. a complex K ∈ D^b_c(X)) has potentially the property P when there is a model: an integral scheme S of finite type over ℤ[1/ℓ], a morphism x̄ : Spec k → S, a scheme X_S of finite type over S, a sheaf ℱ_S (resp. complex K_S) on X_S, and an isomorphism of (X_S, ℱ_S) ×_S Spec k (base change along x̄) with (X, ℱ), such that for every closed point s ∈ |S| the restriction of ℱ_S (resp. K_S) to the fibre X_s, a scheme of finite type over the finite field k(s), has the property P. A model is part of the data of a proof that ℱ is potentially P; it is not an existence label.

Hypotheses and scope:

- k algebraically closed, ℓ invertible
- S of finite type over ℤ[1/ℓ]; the condition is at all closed points of S
- For complexes and P = pure, duality on the fibres is relative to k(s)
- P is invariant under isomorphism. Base-field-extension and finite-sum stability of P are separate hypotheses of the corresponding API lemmas.
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Uses that determine the interface:

- Weil II Corollaire (3.4.12), p. 210: potentially punctually ι-pure lisse sheaves on normal X over k algebraically closed are semisimple
- Weil II Théorème (6.2.13), p. 250: hard Lefschetz for potentially pure complexes
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the potentially pure complexes of 6.2.8–6.2.12, with their arithmetic model over a finite-type ℤ[1/ℓ]-base
- DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1: ℚ̄_ℓ on a smooth projective variety over any algebraically closed field is potentially pure, through an arithmetic model

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.Weights.ArithmeticModel` | structure | The data (S, x̄, X_S, ℱ_S or K_S, iso) of a model of (X, ℱ) over an integral S of finite type over ℤ[1/ℓ]. |
| `TauCeti.Weights.PotentiallyHas` | data | PotentiallyHas P ℱ : Prop := ∃ M : ArithmeticModel X ℱ, ∀ s ∈ \|M.S\|, P (M.ℱ_S\|X_s). |
| `TauCeti.Weights.PotentiallyHas.mono` | other | (∀ ℱ, P ℱ → Q ℱ) → PotentiallyHas P ℱ → PotentiallyHas Q ℱ. |
| `TauCeti.Weights.ArithmeticModel.restrict` | constructor | Restrict a model to a dense open of S containing the image of x̄; the fibrewise property is inherited. |
| `TauCeti.Weights.PotentiallyHas.pullback` | functoriality | If g : Y → X spreads out over a model, then g*ℱ is potentially P whenever ℱ is and P is stable under pullback. |
| `TauCeti.Weights.PotentiallyHas.directSum` | other | If the supplied arithmetic witnesses admit a common refinement and P is stable under finite direct sums and finite extensions of finite ground fields, their finite direct sum is potentially P. Pull the witnesses to this common model, use finite-field-extension stability on its closed fibres, and take the direct sum there. A common refinement of arbitrary ℓ-adic sheaf models is not silently asserted. |
| `TauCeti.Weights.potentially_baseChange_algClosed` | compatibility | For an extension k ⊂ k′ of algebraically closed fields, PotentiallyHas P ℱ implies PotentiallyHas P ℱ_{k′}, using the same model and composing x̄ with Spec k′ → Spec k. The converse requires a witnessing model over k′ whose base-point map and fibre identification descend to k; no unconditional converse for arbitrary P is asserted. |
| `TauCeti.Weights.PotentiallyHas.of_iso` | compatibility | For P invariant under isomorphism, an isomorphism of (X,ℱ) with (X′,ℱ′) transports an ArithmeticModel and gives PotentiallyHas P ℱ ↔ PotentiallyHas P ℱ′. |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.potentiallyPure_const_smooth` | computation | For X smooth over k algebraically closed, ℚ̄_ℓ[0] is potentially pure of weight 0: spread X out to X_S smooth over S, and ℚ̄_ℓ on each smooth fibre is pure (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5). |
| `TauCeti.Weights.potentially_of_finite_field` | compatibility | Over k = 𝔽̄_q, a sheaf ℱ₀ on X₀/𝔽_q with property P is potentially P with model S = Spec 𝔽_q. |
| `TauCeti.Weights.not_potentiallyPure_kummer` | non-example | The Kummer extension ℒ on 𝔾_m over ℂ (a nonsplit unipotent local system of rank two) is potentially mixed but not potentially punctually ι-pure: otherwise it would be semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12. |
| `TauCeti.Weights.potentially_zero` | degenerate | The zero sheaf is potentially P for every P satisfied by zero sheaves, with any model. |

Proof or construction:

1. Definition. Shrinking S to a dense open neighbourhood of the image of x̄ preserves the property (closed points of an open of S are closed in S), so models can always be refined.
2. The arithmetic sheaf or complex model is an input witnessing potential P; this definition does not assert that every constructible ℓ-adic sheaf has a finite-type arithmetic model. L2 supplies noetherian approximation for schemes, morphisms and finite-presentation or finite-coefficient data, and refinements of models already given. This distinction is explicit in Weil II 6.1.1 b).

Acceptance checks:

- Over k = 𝔽̄_q, a sheaf defined over a finite subfield 𝔽_{q^r} with property P is potentially P (take S = Spec 𝔽_{q^r}).

Direct inputs: [DWP.8/pure-complexes](#dwp-8-pure-complexes), [DWP.8/mixed-complexes](#dwp-8-mixed-complexes), [DWP.7/weights-mixed-sheaves-definitions](#dwp-7-weights-mixed-sheaves-definitions), `AdicCoefficientsAndComparisons:L2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, (3.4.10), p. 210.

Declaration id: `DeligneWeightsAndPurity:DWP.8/potentially-property-p-3-4-10`.

<a id="dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11"></a>

### R^i f_*ℚ_ℓ of a proper smooth morphism is potentially punctually pure

Let k be algebraically closed with ℓ invertible, X of finite type over k, and f : Y → X proper and smooth. Then for every i the lisse sheaf R^i f_*ℚ_ℓ is potentially punctually pure of weight i: there is a model f_S : Y_S → X_S over an integral S of finite type over ℤ[1/ℓ], with f_S proper and smooth, and for every closed point s of S the sheaf R^i f_{s*}ℚ_ℓ on X_s is lisse and punctually pure of weight i.

Hypotheses and scope:

- f proper and smooth
- Constant coefficients ℚ_ℓ
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Spread out f to a proper smooth f_S : Y_S → X_S over an integral S of finite type over ℤ[1/ℓ] by the standard limit argument (AdicCoefficientsAndComparisons L2: finite presentation of Y, X and f, and eventual properness and smoothness).
2. By proper and smooth base change (SF.2), R^i f_{S*}ℚ_ℓ is lisse and its formation commutes with every base change; so its restriction to X_s is R^i f_{s*}ℚ_ℓ and its base change to k is R^i f_*ℚ_ℓ.
3. For x ∈ |X_s| the stalk at a geometric point over x is H^i of the geometric fibre of the proper smooth Y_x over the finite field k(x); by DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (ii) it is pure of weight i relative to N(x).

Acceptance checks:

- Acceptance: for the Legendre family y² = x(x − 1)(x − λ) over X = ℙ¹ − {0, 1, ∞} over k, R¹f_*ℚ_ℓ is potentially pure of weight 1 with model over ℤ[1/2ℓ].
- Non-example: for f proper but not smooth (a nodal degeneration), R^i f_*ℚ_ℓ need not be lisse, and its stalks at the singular fibre are not pure.

Direct inputs: [DWP.8/potentially-property-p-3-4-10](#dwp-8-potentially-property-p-3-4-10), [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Exemple (3.4.11), p. 210.

Declaration id: `DeligneWeightsAndPurity:DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`.

<a id="dwp-8-potentially-pure-lisse-sheaves-are-semisimple-3-4-12"></a>

### Potentially pure lisse sheaves on a normal variety are semisimple

Let k be algebraically closed with ℓ invertible, X a normal scheme of finite type over k, and ℱ a lisse sheaf on X which is potentially punctually ι-pure (DWP.8/potentially-property-p-3-4-10). Then ℱ is semisimple.

Hypotheses and scope:

- X normal of finite type over an algebraically closed field of any characteristic ≠ ℓ
- A model witnessing potential ι-purity is given
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Choose a model (S, x̄, X_S, ℱ_S) and shrink S so that X_S → S has normal geometric fibres and ℱ_S is lisse (generic normality and lissity, L2).
2. By the specialisation theorem for monodromy groups (Weil II (1.11.1) with (1.11.5), DWP.5), after shrinking S the image of π₁ of the geometric generic fibre in GL(ℱ_x̄) is conjugate to the image of π₁ of the geometric fibre X_s̄ at closed points s, i.e. the geometric monodromy groups of ℱ and of ℱ_S|X_s̄ agree.
3. ℱ_S|X_s is lisse and punctually ι-pure on the normal X_s over the finite field k(s), so it is geometrically semisimple by DWP.8/geometric-semisimplicity-theorem-3-4-1-iii; semisimplicity is a property of the monodromy group, so ℱ is semisimple.

Acceptance checks:

- Acceptance: for X over 𝔽̄_q and ℱ defined over 𝔽_q this is DWP.8/geometric-semisimplicity-theorem-3-4-1-iii.
- Non-example: the Kummer extension on 𝔾_m over ℂ is not semisimple, hence not potentially pure.

Direct inputs: [DWP.8/potentially-property-p-3-4-10](#dwp-8-potentially-property-p-3-4-10), [DWP.8/geometric-semisimplicity-theorem-3-4-1-iii](#dwp-8-geometric-semisimplicity-theorem-3-4-1-iii), [DWP.8/geometric-semisimplicity](#dwp-8-geometric-semisimplicity), [DWP.5/specialization-of-monodromy](#dwp-5-specialization-of-monodromy), `AdicCoefficientsAndComparisons:L2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.4.12), p. 210.

Declaration id: `DeligneWeightsAndPurity:DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12`.

<a id="dwp-8-semisimplicity-of-proper-smooth-direct-images-3-4-13"></a>

### Semisimplicity of R^i f_*ℚ_ℓ for a proper smooth family

Let k be algebraically closed with ℓ invertible, S a normal connected scheme of finite type over k, and f : X → S proper and smooth. Then for every i the lisse sheaf R^i f_*ℚ_ℓ on S is semisimple, i.e. H^i(X_s̄, ℚ_ℓ) is a semisimple representation of π₁(S, s̄).

Hypotheses and scope:

- f proper and smooth; S normal connected of finite type over an algebraically closed field
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Semisimplicity of proper smooth monodromy**.

Proof or construction:

1. R^i f_*ℚ_ℓ is lisse (proper smooth base change, SF.2) and potentially punctually pure of weight i (DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11), hence semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12.

Acceptance checks:

- Acceptance (the case used by hard Lefschetz): for X ⊂ ℙ^N smooth projective over k and the family of smooth hyperplane sections Y_u, u ∈ U = ℙ̌^N − X̌, the representation of π₁(U, u) on H^j(Y_u, ℚ_ℓ) is semisimple for every j.
- Acceptance: for a nonisotrivial elliptic family the monodromy representation on H¹ is irreducible.
- Non-example: for f proper and smooth, R^i f_*ℤ/ℓ need not be semisimple: the statement is for ℚ_ℓ coefficients.

Direct inputs: [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), [DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12](#dwp-8-potentially-pure-lisse-sheaves-are-semisimple-3-4-12), `SchemeAndStackFoundations:SF.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Corollaire (3.4.13), p. 210; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Remarque (3.4.14), p. 210.

Declaration id: `DeligneWeightsAndPurity:DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13`.

<a id="dwp-8-weight-spectral-sequence-of-a-normal-crossings-compactification"></a>

### The weight spectral sequence of a normal crossings compactification

Let X₀ be a smooth proper scheme of pure dimension d over 𝔽_q, D₀ ⊂ X₀ a divisor with normal crossings, U₀ = X₀ − D₀ and j : U₀ → X₀. For m ≥ 1 let ν_m : D^{(m)}₀ → X₀ be the normalisation of the locus of points lying on at least m local branches of D₀ (étale locally the disjoint union of the m-fold intersections of the branches), D^{(0)}₀ = X₀, and ε_m the rank-one orientation sheaf on D^{(m)}₀, the determinant of the permutation representation on the m local branches. Then there is a spectral sequence of Frobenius modules E₁^{m,k} = H^k(D^{(m)}, ε_m) ⇒ H^{m+k}_c(U, ℚ_ℓ), whose d₁ is the alternating sum of the restriction maps; E₁^{m,k} is pure of weight k, the sequence degenerates at E₂, and E₂^{m,k} = Gr^W_k H^{m+k}_c(U, ℚ_ℓ) for the weight filtration of the Frobenius module H^{m+k}_c(U). The same holds for X₀ a smooth proper Deligne–Mumford stack over 𝔽_q with a normal crossings divisor, the D^{(m)} being smooth proper Deligne–Mumford stacks; for the boundary of M̄_{g,n} it reads E₁^{j,k} = ⊕_{|E(G)| = j} (H^k(∏_v M̄_{g_v,n_v}) ⊗ det E(G))^{Aut(G)}.

Hypotheses and scope:

- X₀ smooth proper; D₀ normal crossings (not necessarily strict: the orientation sheaf ε_m records the monodromy of the branches)
- Compact-support form; the ordinary-cohomology form for H^*(U) is its Poincaré dual
- The orientation twist det E(G) cannot be omitted (PAPER-BERGSTROM-FABER-PAYNE-24/E7)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Exactness of 0 → j_!ℚ_ℓ → ℚ_ℓ → ν_{1*}ε_1 → ν_{2*}ε_2 → ⋯ → ν_{d*}ε_d → 0 on X₀: étale locally D₀ is a union of coordinate hyperplanes and the complex is the augmented Čech (Mayer–Vietoris) resolution of the extension by zero, with the signs organised by the orientation sheaves (EDC.0, SF.2).
2. Applying RΓ(X, −) and filtering by the stupid filtration gives E₁^{m,k} = H^k(X, ν_{m*}ε_m) = H^k(D^{(m)}, ε_m) ⇒ H^{m+k}(X, j_!ℚ_ℓ) = H^{m+k}_c(U); the differential d₁ is induced by the maps of the resolution, the signed restriction maps.
3. Each D^{(m)}₀ is smooth proper of dimension d − m and ε_m is a lisse sheaf of finite order, punctually pure of weight 0, so E₁^{m,k} is pure of weight k (DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (i); for stacks, WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks).
4. d_r : E_r^{m,k} → E_r^{m+r,k−r+1} is a Frobenius-equivariant map between pure modules of weights k and k − r + 1, hence zero for r ≥ 2 (DWP.0/disjoint-spectra-no-intertwiner); so E₂ = E_∞ and the abutment filtration has pure graded pieces E₂^{m,k} of weight k, which identifies it with the weight filtration (DWP.0/weight-decomposition).

Acceptance checks:

- Acceptance: X₀ = ℙ¹, D₀ = {0, ∞}: E₁^{0,0} = ℚ_ℓ, E₁^{0,2} = ℚ_ℓ(−1), E₁^{1,0} = ℚ_ℓ², d₁ : ℚ_ℓ → ℚ_ℓ² the diagonal; H¹_c(𝔾_m) = coker d₁ = ℚ_ℓ of weight 0 and H²_c = ℚ_ℓ(−1).
- Acceptance (orientation): for M_{1,2} ⊂ M̄_{1,2}, the twisted E₁ page gives e_c = 𝕃², χ_c = 1, matching #M_{1,2}(𝔽_q) = q²; the untwisted page printed in Bergström–Faber–Payne (3) would give χ_c = 2.
- Non-example: the spectral sequence does not degenerate at E₁: for ℙ¹ ⊃ {0, ∞}, d₁ ≠ 0.

Direct inputs: [DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11](#dwp-7-hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11), `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`, [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition), `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.1`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights` (a future module, not a baseline declaration).

Sources: [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2), proof of Proposition 4.2, p. 7; [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2), proof of Proposition 4.2, p. 7.

Declaration id: `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`.

## DWP.9 — Absolute hard Lefschetz and primitive pairings

Arithmetic models transport the finite-field argument to an arbitrary algebraically closed field with ℓ invertible. Restriction/Gysin adjunction and complete reducibility give a nondegenerate invariant form, proving absolute hard Lefschetz before the perverse relative theory. Invariant-cycle and support-bound theorems retain their separate LPV owner.

<a id="dwp-9-lefschetz-operator"></a>

### The Lefschetz operator of a line bundle

Let k be an algebraically closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n, and L a line bundle on X with first Chern class η = c₁(L) ∈ H²(X, ℚ_ℓ(1)) (EDC.3). The Lefschetz operator is L_η = η ∪ − : H^j(X, ℚ_ℓ(m)) → H^{j+2}(X, ℚ_ℓ(m + 1)), and its r-th iterate is cup product with η^r ∈ H^{2r}(X, ℚ_ℓ(r)). For 0 ≤ r ≤ n: the hard Lefschetz map is η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r)); the primitive part is P^{n−r}(X) = ker(η^{r+1} ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r+2}(X, ℚ_ℓ(r + 1))); the Lefschetz pairing is ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) ∈ ℚ_ℓ(r − n) for x, y ∈ H^{n−r}(X, ℚ_ℓ), where Tr_X : H^{2n}(X, ℚ_ℓ(n)) → ℚ_ℓ is the trace of EDC.2. Tate twists are kept: the source's identification ℤ_ℓ ≅ ℤ_ℓ(1) over k is not used.

Hypotheses and scope:

- X smooth projective of pure dimension n over an algebraically closed field with ℓ invertible
- L arbitrary in the construction; ampleness is a hypothesis of the theorems
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Lefschetz operator**.

Uses that determine the interface:

- Weil II Théorème (4.1.1), p. 217: hard Lefschetz is the bijectivity of the iterates of this operator
- Weil II Corollaire (4.1.5), p. 218: the form Tr(η^i x y) on H^{n−i}(X) is the Lefschetz pairing
- Weil II Théorème (6.2.13), p. 250: the same operator on H^*(X, K) for a complex K
- WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison: the arithmetic Frobenius-equivariant isomorphism η^a : H^{d−a} → H^{d+a}(a) with twists restored
- MotivesAndAlgebraicCycles:MC.7/lefschetz-and-hodge-standard-conjectures: the class inverting η^r, whose algebraicity is the Lefschetz standard conjecture, is defined through this operator and hard Lefschetz
- EtaleDualityAndPerverseSheaves:EDC.7: relative hard Lefschetz for a projective morphism specialises to this operator over a point

The API supplies:

| Declaration | Role | Mathematical statement |
| --- | --- | --- |
| `TauCeti.HardLefschetz.lefschetzOperator` | data | lefschetzOperator η : H^j(X, ℚ_ℓ(m)) →ₗ H^{j+2}(X, ℚ_ℓ(m + 1)), x ↦ η ∪ x. |
| `TauCeti.HardLefschetz.lefschetzOperator_pow` | simp | (lefschetzOperator η)^r = cup product with η^r ∈ H^{2r}(X, ℚ_ℓ(r)). |
| `TauCeti.HardLefschetz.lefschetzOperator_smul` | simp | lefschetzOperator (m • η) = m • lefschetzOperator η, and η(L^{⊗m}) = m • η(L). |
| `TauCeti.HardLefschetz.lefschetzOperator_comm_pullback` | functoriality | For g : X′ → X, g* ∘ L_{η(L)} = L_{η(g*L)} ∘ g*. |
| `TauCeti.HardLefschetz.lefschetzOperator_galois` | functoriality | For (X, L) defined over k₀ ⊂ k, L_η commutes with the action of Gal(k/k₀). |
| `TauCeti.HardLefschetz.lefschetzOperator_eq_gysin_restrict` | characterisation | For L very ample and a smooth hyperplane section i : Y → X, L_η = i_* ∘ i*. |
| `TauCeti.HardLefschetz.lefschetzOperator_selfAdjoint` | relation | Tr_X(L_η x ∪ y) = Tr_X(x ∪ L_η y). |
| `TauCeti.HardLefschetz.lefschetzOperator_pow_top` | relation | η^{n+1} = 0 and Tr_X(η^n) = deg_L(X); if L is ample and X is nonempty, this degree is > 0. For X empty, it is 0. |
| `TauCeti.HardLefschetz.primitivePart` | data | P^{n−r}(X) = ker(η^{r+1} ∪ − on H^{n−r}(X, ℚ_ℓ)). |
| `TauCeti.HardLefschetz.lefschetzPairing` | data | ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) on H^{n−r}(X, ℚ_ℓ), with values in ℚ_ℓ(r − n). |
| `TauCeti.HardLefschetz.lefschetzPairing_symm` | relation | ψ_r(y, x) = (−1)^{n−r} ψ_r(x, y). |

Unit tests distinguish the construction and its conventions:

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.HardLefschetz.lefschetzOperator_projectiveSpace` | computation | For X = ℙ^n and L = 𝒪(1): H^{2j}(ℙ^n, ℚ_ℓ(j)) = ℚ_ℓ·η^j, L_η(η^j) = η^{j+1} for j < n, η^{n+1} = 0, and Tr(η^n) = 1. |
| `TauCeti.HardLefschetz.lefschetzOperator_trivial_bundle` | non-example | For L = 𝒪_X, η = 0 and L_η = 0; on X = ℙ¹, η : H⁰ → H²(1) is the zero map, so ampleness cannot be dropped from hard Lefschetz. |
| `TauCeti.HardLefschetz.lefschetzOperator_degree_zero` | non-example | For an elliptic curve E and a line bundle L of degree 0, c₁(L) = 0 in H²(E, ℚ_ℓ(1)) ≅ ℚ_ℓ (the degree), so L_η = 0 although L may be nontrivial. |
| `TauCeti.HardLefschetz.lefschetzOperator_point` | degenerate | For n = 0 (X a finite set of points) L_η = 0 on H⁰ and P⁰(X) = H⁰(X); the hard Lefschetz map for r = 0 is the identity. |
| `TauCeti.HardLefschetz.lefschetzPairing_curve` | computation | For a smooth projective curve of genus g and L of degree e > 0: ψ₀ on H¹ is Tr(x ∪ y), alternating and nondegenerate on a space of dimension 2g; ψ₁ on H⁰ is x·y·e. |

Proof or construction:

1. η is EDC.3's Chern class; cup product and the trace are EDC.0 and EDC.2. Graded commutativity x ∪ y = (−1)^{ab} y ∪ x for x ∈ H^a, y ∈ H^b and η of even degree give L_η(x) ∪ y = x ∪ L_η(y).
2. c₁(L ⊗ M) = c₁(L) + c₁(M) (EDC.3), so η(L^{⊗m}) = m·η(L) and L_{mη} = m·L_η; for m ≠ 0 this is invertible in ℚ_ℓ, which allows replacing an ample L by a very ample power.
3. For L very ample and Y ⊂ X a smooth hyperplane section in the embedding defined by L, with i : Y → X, η = cl(Y) and L_η = i_* ∘ i* (projection formula for the Gysin map of EDC.3).

Acceptance checks:

- Over a finite field, or for (X, L) defined over a subfield k₀ with k an algebraic closure of k₀, L_η commutes with Gal(k/k₀): η is fixed and cup product is Galois-equivariant.

Direct inputs: `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Théorème (4.1.1), p. 217; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1), p. 217; [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf), (1.5), p. 108.

Declaration id: `DeligneWeightsAndPurity:DWP.9/lefschetz-operator`.

<a id="dwp-9-invariant-form-on-invariants-4-1-4"></a>

### An invariant nondegenerate form stays nondegenerate on the invariants of a completely reducible representation

Let π be a group, K a field, V a finite-dimensional K-vector space with a completely reducible (semisimple) representation of π, and Φ a π-invariant bilinear form on V (Φ(gx, gy) = Φ(x, y) for g ∈ π) which is nondegenerate. Then the restriction of Φ to the invariant subspace V^π is nondegenerate.

Hypotheses and scope:

- V semisimple as a representation of π
- Φ need not be symmetric or alternating

Proof or construction:

1. By complete reducibility V = V^π ⊕ W with W a subrepresentation. W has no nonzero π-invariant linear form: the kernel of such a form would have a π-stable complement, a trivial one-dimensional subrepresentation of W, contained in V^π ∩ W = 0.
2. For v ∈ V^π the linear forms w ↦ Φ(v, w) and w ↦ Φ(w, v) on W are π-invariant (Φ(v, gw) = Φ(gv, gw) = Φ(v, w)), hence zero. So Φ = Φ|V^π ⊕ Φ|W and nondegeneracy of Φ gives nondegeneracy of Φ|V^π.

Acceptance checks:

- Acceptance: V = K² with the swap action of π = ℤ/2 and Φ = the standard dot product (char K ≠ 2): V^π = K·(1, 1), and Φ((1, 1), (1, 1)) = 2 ≠ 0.
- Non-example: for π = ℤ acting on K² by the unipotent matrix [[1, 1], [0, 1]] (not semisimple) and the invariant alternating form Φ = det, V^π = K·e₁ and Φ(e₁, e₁) = 0: complete reducibility cannot be dropped.

Direct inputs: `mathlib:Representation`, `mathlib:Representation.invariants`, `mathlib:IsSemisimpleModule`, `mathlib:Representation.asModule`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:LinearMap.BilinForm.restrict`.

Proposed implementation location: `TauCeti/LinearAlgebra/Lefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Lemme (4.1.4), p. 218.

Declaration id: `DeligneWeightsAndPurity:DWP.9/invariant-form-on-invariants-4-1-4`.

<a id="dwp-9-hyperplane-factorisation-4-1-2"></a>

### Reduction of hard Lefschetz to the middle intersection form on a hyperplane section

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n ≥ 1, L a very ample line bundle, η = c₁(L), i : Y → X the inclusion of a smooth hyperplane section in the embedding defined by L, and η_Y = i*η. (a) The Gysin map i_* : H^j(Y, ℚ_ℓ(m)) → H^{j+2}(X, ℚ_ℓ(m + 1)) is the transpose of i* under Poincaré duality on Y and X, and i_* ∘ i* = L_η. (b) For r ≥ 1 and x ∈ H^{n−r}(X, ℚ_ℓ): η^r ∪ x = i_*(η_Y^{r−1} ∪ i*x). (c) (Weak Lefschetz) i* : H^j(X) → H^j(Y) is an isomorphism for j < n − 1 and injective for j = n − 1; dually i_* : H^j(Y) → H^{j+2}(X)(1) is an isomorphism for j > n − 1 and surjective for j = n − 1. (d) Suppose hard Lefschetz holds for (Y, L|_Y). Then η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r)) is an isomorphism for every r ≠ 1, and it is an isomorphism for r = 1 iff the form ⟨y, y′⟩ = Tr_Y(y ∪ y′) on H^{n−1}(Y, ℚ_ℓ) is nondegenerate on the image of i* : H^{n−1}(X, ℚ_ℓ) → H^{n−1}(Y, ℚ_ℓ) (Weil II 4.1.2).

Hypotheses and scope:

- Y a smooth hyperplane section for a very ample L; X smooth projective of pure dimension n ≥ 1
- Hard Lefschetz for Y is an assumption of (d) (the induction hypothesis), not a conclusion
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. (a) EDC.3 (Gysin map, projection formula, cl(Y) = η) and EDC.2 (Poincaré duality: Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i*x)).
2. (b) η^r ∪ x = η ∪ (η^{r−1} ∪ x) = i_* i*(η^{r−1} ∪ x) = i_*(η_Y^{r−1} ∪ i*x).
3. (c) EDC.4's weak Lefschetz theorem for a smooth hyperplane section of a smooth projective variety, and its Poincaré-dual Gysin form.
4. (d) r = 0 is the identity. For r ≥ 2, in (b) the outer maps i* on H^{n−r} and i_* on H^{(n−1)+(r−1)} are isomorphisms by (c), and the middle map is hard Lefschetz for Y in degree (n − 1) − (r − 1). For r = 1, η = i_* ∘ i* with i* injective onto V = i*H^{n−1}(X) and ker(i_*|H^{n−1}(Y)) = V^⊥ by (a); since dim H^{n−1}(X) = dim H^{n+1}(X) (Poincaré duality), η is bijective iff V ∩ V^⊥ = 0, i.e. iff ⟨ , ⟩ is nondegenerate on V.

Acceptance checks:

- Acceptance: X = ℙ², Y a line: H¹ = 0 and the r = 1 condition is vacuous; η² : H⁰ → H⁴(2) is i_* ∘ η_Y ∘ i*, an isomorphism.
- Acceptance: for a smooth projective surface X ⊂ ℙ^N (n = 2) and a smooth hyperplane section Y, the case r = 1 says that η : H¹(X) → H³(X)(1) is bijective iff Tr_Y(y ∪ y′) is nondegenerate on the image of H¹(X) in H¹(Y).
- Non-example: for r = 1 the weak Lefschetz theorem alone gives only injectivity of i* and surjectivity of i_*; bijectivity of η on H^{n−1} is the nondegeneracy statement, which needs monodromy.

Direct inputs: [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.4`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, proof of (4.1.1) and Lemme (4.1.2), p. 217; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, proof of (4.1.1), p. 217.

Declaration id: `DeligneWeightsAndPurity:DWP.9/hyperplane-factorisation-4-1-2`.

<a id="dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety"></a>

### Arithmetic models of a polarised smooth projective variety and cospecialisation

Let k be algebraically closed with ℓ invertible in k, X a smooth projective k-scheme of pure dimension n and L a very ample line bundle, with X ⊂ P = ℙ^N_k the embedding it defines. There are an integral scheme S of finite type over ℤ[1/ℓ], a morphism x̄ : Spec k → S, a smooth projective morphism f_S : X_S → S of pure relative dimension n with a closed embedding X_S ⊂ ℙ^N_S (L_S = 𝒪(1)|X_S), and an isomorphism (X_S ⊂ ℙ^N_S) ×_S k ≅ (X ⊂ P). For such a model: (i) R^jf_{S*}ℚ_ℓ is lisse and its formation commutes with base change; for every geometric point s̄ of S the cospecialisation isomorphisms H^*(X_s̄, ℚ_ℓ) ≅ H^*(X, ℚ_ℓ) are ring isomorphisms compatible with the traces and carry c₁(L_s̄) to c₁(L); in particular hard Lefschetz holds for (X, L) iff it holds for (X_s̄, L_s̄) for one (equivalently every) closed point s of S. (ii) ℚ̄_ℓ[0] on X is potentially pure of weight 0, with this model (DWP.8/potentially-property-p-3-4-10). (iii) If U_S ⊂ ℙ̌^N_S is the open subscheme of hyperplanes whose section of X_S is smooth over S and g_S : Z_S → U_S the family of these sections, then g_S is smooth projective, its fibre over k is the family g : Z → U of smooth hyperplane sections of X, and R^jg_*ℚ_ℓ is potentially punctually pure of weight j.

Hypotheses and scope:

- k algebraically closed of any characteristic ≠ ℓ
- The model is part of the data; S may be shrunk to any dense open containing the image of x̄
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Noetherian approximation (AdicCoefficientsAndComparisons L2): write k as the filtered union of its finitely generated ℤ[1/ℓ]-subalgebras A; X ⊂ ℙ^N_k is defined by finitely many equations, so descends to X_A ⊂ ℙ^N_A for some A; smoothness, properness, flatness and pure relative dimension n descend after enlarging A and inverting an element. Take S = Spec A.
2. (i) Proper and smooth base change (SF.2): R^jf_{S*}ℚ_ℓ is lisse and commutes with base change; S is connected, so the stalks at any two geometric points are identified along étale paths. Cup product R^a ⊗ R^b → R^{a+b}, the relative trace R^{2n}f_{S*}ℚ_ℓ(n) → ℚ_ℓ (EDC.2) and c₁(L_S) ∈ H⁰(S, R²f_{S*}ℚ_ℓ(1)) (EDC.3, compatible with base change) are morphisms or sections of lisse sheaves, so the identifications respect them.
3. (ii) On each closed fibre X_s, smooth over the finite field k(s), ℚ̄_ℓ[0] is pure of weight 0 (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (b)).
4. (iii) The incidence family is smooth over the open of hyperplanes giving smooth sections (LPV.3/dual-variety, which is the fibre over k; openness over S by the Jacobian criterion), and DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11 applies to g_S over each closed point of S.

Acceptance checks:

- Acceptance: for X = ℙ^n_k, the model S = Spec ℤ[1/ℓ], X_S = ℙ^n_S works, with cospecialisation sending η^j to η^j.
- Acceptance: for k = ℂ and a smooth projective curve of genus g, a model over a finitely generated ℤ[1/ℓ]-algebra exists, and the cospecialisation carries the symplectic cup-product form on H¹ to the one on a reduction modulo p.
- Non-example: a variety over k = ℂ, or a nonisotrivial elliptic curve over an algebraic closure of 𝔽_p(t), is not defined over any finite field; the model is over a finitely generated ℤ[1/ℓ]-algebra, and only its closed fibres are over finite fields.

Direct inputs: [DWP.8/potentially-property-p-3-4-10](#dwp-8-potentially-property-p-3-4-10), [DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5](#dwp-8-twist-shift-and-smooth-lisse-purity-6-2-5), [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Introduction, p. 142; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3, Exemple (3.4.11), p. 210.

Declaration id: `DeligneWeightsAndPurity:DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`.

<a id="dwp-9-global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3"></a>

### The image of H^{n−1}(X) in H^{n−1}(Y) is the monodromy invariants

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n ≥ 1 embedded by a very ample L in P = ℙ^N, U = P̌ − X̌ the open of hyperplanes H with X ∩ H smooth, g : Z → U the family of smooth hyperplane sections, u ∈ U(k), Y = Z_u and i : Y → X. Then the image of i* : H^{n−1}(X, ℚ_ℓ) → H^{n−1}(Y, ℚ_ℓ) is the subspace H^{n−1}(Y, ℚ_ℓ)^{π₁(U, u)} of monodromy invariants. If D ⊂ P̌ is a sufficiently general line through u (a Lefschetz pencil when one exists), the image of π₁(D ∩ U, u) in GL(H^{n−1}(Y)) equals that of π₁(U, u), so the image of i* is also H^{n−1}(Y)^{π₁(D ∩ U, u)} (Weil II 4.1.3).

Hypotheses and scope:

- X smooth projective over an algebraically closed field of characteristic ≠ ℓ
- No hard Lefschetz for X is used; the statement is LPV.7's global invariant cycle theorem in the constant-coefficient case
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. Apply LPV.7:invariant-cycles' global invariant cycle theorem (Weil II 6.2.12, with 6.2.11) to K = ℚ̄_ℓ[0] on X with the integer n − 1 in place of the source's n. Its support hypothesis holds: DK = ℚ̄_ℓ(n)[2n], so DK[−2(n − 1) − 2] = ℚ̄_ℓ(n)[0] has support of dimension n ≤ (n − 1) + 1 − 0 in degree 0 and no other cohomology.
2. K is potentially pure with the model of DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety (ii). For K = ℚ̄_ℓ the open where the R^jg_*q*K are lisse contains U, since g is smooth and projective there (LPV.3/dual-variety); every u ∈ U gives a general section.
3. The identification of H^{n−1}(X, K) with the invariants is through restriction, which is injective by weak Lefschetz (EDC.4).
4. For the pencil form, Bertini surjectivity (LPV.5/bertini-surjectivity-on-fundamental-groups; Weil II 6.2.10.2) identifies the monodromy images of π₁(D ∩ U, u) and π₁(U, u).

Acceptance checks:

- Acceptance: for X = ℙ² (n = 2) and Y a line, H¹(Y) = 0 = H¹(X). For X a smooth cubic surface in ℙ³ and Y a smooth plane section (an elliptic curve), H¹(X) = 0, so the monodromy of the family of smooth plane sections has no nonzero invariants on H¹(Y) ≅ ℚ_ℓ².
- Acceptance: for X = C × C′ a product of curves with L of bidegree (a, b), H¹(X) = H¹(C) ⊕ H¹(C′) injects into H¹(Y) as the invariant part.
- Non-example: the invariant-cycle statement is about invariants of the geometric monodromy group; over a finite field the arithmetic Frobenius is not part of the group π₁(U, u) here.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`, [DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety](#dwp-9-arithmetic-model-of-a-polarised-smooth-projective-variety), `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `EtaleDualityAndPerverseSheaves:EDC.4`, [DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5](#dwp-8-twist-shift-and-smooth-lisse-purity-6-2-5).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.3), p. 218; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Corollaire (6.2.12), p. 250.

Declaration id: `DeligneWeightsAndPurity:DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`.

<a id="dwp-9-hard-lefschetz-4-1-1"></a>

### The hard Lefschetz theorem

Let k be an algebraically closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n, L an ample line bundle on X and η = c₁(L) ∈ H²(X, ℚ_ℓ(1)). Then for every r ≥ 0 the map η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r)) is an isomorphism. If (X, L) = (X₀, L₀) ⊗_{k₀} k for a subfield k₀ of which k is an algebraic closure, the isomorphism is Gal(k/k₀)-equivariant.

Hypotheses and scope:

- X smooth projective of pure dimension n; L ample
- k algebraically closed of any characteristic ≠ ℓ; ℚ_ℓ coefficients (the statement fails integrally in general)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Hard Lefschetz theorem**.

Proof or construction:

1. Reduce to X connected. Since η(L^{⊗m}) = m·η(L) and m is invertible in ℚ_ℓ (DWP.9/lefschetz-operator), assume L very ample, defining X ⊂ P.
2. Induction on n; for n = 0 the case r = 0 is the identity and both sides vanish for r ≥ 1. For n ≥ 1 choose u ∈ U = P̌ − X̌ (nonempty, LPV.3/dual-variety) and Y = X ∩ H_u, smooth projective of pure dimension n − 1 with L|Y very ample; by induction hard Lefschetz holds for Y.
3. By DWP.9/hyperplane-factorisation-4-1-2 (d) it remains to show that ⟨y, y′⟩ = Tr_Y(y ∪ y′) is nondegenerate on V = i*H^{n−1}(X) ⊂ H^{n−1}(Y).
4. V = H^{n−1}(Y)^{π₁(U, u)} by DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3. The representation of π₁(U, u) on H^{n−1}(Y, ℚ_ℓ) is semisimple by DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13 applied to the smooth projective family g : Z → U over the smooth connected U. The form ⟨ , ⟩ is nondegenerate (Poincaré duality on Y, EDC.2) and π₁(U, u)-invariant, being the fibre of the relative pairing R^{n−1}g_*ℚ_ℓ ⊗ R^{n−1}g_*ℚ_ℓ → R^{2n−2}g_*ℚ_ℓ → ℚ_ℓ(1 − n) of lisse sheaves (EDC.2 relative trace).
5. DWP.9/invariant-form-on-invariants-4-1-4 gives nondegeneracy on V.
6. Equivariance: η^r is fixed by Gal(k/k₀) when L is defined over k₀, and cup product is Galois-equivariant (DWP.9/lefschetz-operator api lefschetzOperator_galois).

Acceptance checks:

- Acceptance: X = ℙ^n, L = 𝒪(1): η^r : H^{n−r} → H^{n+r}(r) is ℚ_ℓ·η^{(n−r)/2} ↦ ℚ_ℓ·η^{(n+r)/2} for n − r even and 0 → 0 otherwise.
- Acceptance: a smooth projective curve (n = 1): r = 1 is the isomorphism H⁰ → H²(1) given by multiplication by deg L > 0.
- Acceptance: an abelian surface A over 𝔽̄_p with an ample L: η² : H⁰ → H⁴(2) is multiplication by (L·L) = 2χ(L) > 0, and η : H¹ → H³(1) is an isomorphism between 4-dimensional spaces.
- Acceptance (specialisation): by DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety (i), the theorem for k = ℂ and for k = 𝔽̄_p are equivalent for (X, L) with a model over a finitely generated ℤ[1/ℓ]-algebra.
- Non-example: this is hard Lefschetz, not the Hodge standard conjecture: no sign or positivity condition of Hodge–Riemann type on ψ_r restricted to primitive classes is asserted in characteristic p, and no algebraic correspondence inverting η^r is constructed.
- Non-example: for L not ample (e.g. pulled back from a curve along a fibration X → C with dim X ≥ 2), η^n = 0 on H⁰ and the statement fails.

Direct inputs: [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), [DWP.9/hyperplane-factorisation-4-1-2](#dwp-9-hyperplane-factorisation-4-1-2), [DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3](#dwp-9-global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3), [DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13](#dwp-8-semisimplicity-of-proper-smooth-direct-images-3-4-13), [DWP.9/invariant-form-on-invariants-4-1-4](#dwp-9-invariant-form-on-invariants-4-1-4), `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Théorème (4.1.1), p. 217; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, proof of (4.1.1), p. 218.

Declaration id: `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`.

<a id="dwp-9-lefschetz-decomposition-of-a-graded-operator"></a>

### Primitive decomposition for a graded operator satisfying hard Lefschetz

Let K be a field, n ∈ ℕ, V a finite-dimensional K-vector space which is the internal direct sum of subspaces V^j (0 ≤ j ≤ 2n; V^j = 0 otherwise), and λ ∈ End(V) with λ(V^j) ⊆ V^{j+2}, such that λ^r : V^{n−r} → V^{n+r} is bijective for 0 ≤ r ≤ n. Put P^{n−r} = V^{n−r} ∩ ker λ^{r+1} for 0 ≤ r ≤ n. Then: (i) for 0 ≤ r ≤ n, the maps ⊕_{k ≥ 0} λ^k : ⊕_{k≥0} P^{n−r−2k} → V^{n−r} and ⊕_{k ≥ 0} λ^{r+k} : ⊕_{k≥0} P^{n−r−2k} → V^{n+r} are isomorphisms; (ii) dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}; (iii) if B is a nondegenerate bilinear form on V with B(V^a, V^b) = 0 unless a + b = 2n and B(λx, y) = B(x, λy), then for 0 ≤ r ≤ n the form ψ_r(x, y) = B(λ^r x, y) on V^{n−r} is nondegenerate, the decomposition (i) of V^{n−r} is ψ_r-orthogonal, and ψ_r restricts to a nondegenerate form on P^{n−r}; if moreover B(y, x) = (−1)^a B(x, y) for x ∈ V^a, then ψ_r is (−1)^{n−r}-symmetric.

Hypotheses and scope:

- Hard Lefschetz bijectivity in every degree is the hypothesis
- Any field K

Proof or construction:

1. (i) For 0 ≤ r ≤ n, first prove V^{n−r} = P^{n−r} ⊕ λV^{n−r−2}. If r+2 ≤ n, hard Lefschetz makes λ^{r+2} : V^{n−r−2} → V^{n+r+2} bijective. Choose its unique preimage x′ of λ^{r+1}x; then x−λx′ is primitive. If λx′ is primitive, λ^{r+2}x′=0 forces x′=0, so the sum is direct. For r+2>n both outside-degree spaces vanish, giving the boundary cases in degrees 0 and 1. Iterate this direct-sum decomposition downward by steps of two to get the lower-degree formula; apply the bijection λ^r to obtain the upper-degree formula. This handles both parities and uses only the stated hard Lefschetz maps, as in Deligne (1968) (1.5)–(1.6).
2. (ii) is the dimension count of (i).
3. (iii) ψ_r(x, y) = B(λ^r x, y) is nondegenerate because λ^r : V^{n−r} → V^{n+r} is bijective and B pairs V^{n+r} perfectly with V^{n−r}. For x = λ^a x₀ and y = λ^b y₀ with x₀ ∈ P^{n−r−2a}, y₀ ∈ P^{n−r−2b} and a < b: ψ_r(x, y) = B(λ^{r+a+b}x₀, y₀) = 0, because x₀ is killed by λ^{r+2a+1} and r + a + b ≥ r + 2a + 1; for a > b move the powers of λ onto y₀ instead. So (i) is ψ_r-orthogonal, and ψ_r is nondegenerate on each summand, in particular on P^{n−r}. Symmetry: B(λ^r y, x) = B(y, λ^r x) = (−1)^{n−r}B(λ^r x, y).

Acceptance checks:

- Acceptance: V = H^*(ℙ²) (n = 2): P⁰ = V⁰, P² = 0, V² = λP⁰, V⁴ = λ²P⁰.
- Acceptance: V = H^*(E) of an elliptic curve (n = 1): P⁰ = V⁰, P¹ = V¹ and V² = λP⁰.
- Non-example: if λ^r fails to be bijective for one r (e.g. λ = 0 on H^*(ℙ¹)), (i) fails: V² is not covered.

Direct inputs: `mathlib:DirectSum.IsInternal`, `mathlib:LinearMap.ker`, `mathlib:Module.finrank`, `mathlib:LinearMap.BilinForm.Nondegenerate`.

Proposed implementation location: `TauCeti/LinearAlgebra/Lefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf), Théorème (1.5) and (1.6), p. 108.

Declaration id: `DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator`.

<a id="dwp-9-primitive-decomposition-and-lefschetz-pairings"></a>

### Primitive Lefschetz decomposition and nondegenerate Lefschetz pairings

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n, L ample, η = c₁(L). (i) For 0 ≤ r ≤ n, H^{n−r}(X, ℚ_ℓ) = ⊕_{k≥0} η^k ∪ P^{n−r−2k}(X)(−k) and H^{n+r}(X, ℚ_ℓ(r)) = ⊕_{k≥0} η^{r+k} ∪ P^{n−r−2k}(X)(−k), where P^{n−r}(X) = ker(η^{r+1} on H^{n−r}(X, ℚ_ℓ)) is the primitive part (DWP.9/lefschetz-operator) and η^k ∪ P(−k) denotes the image of P under η^k ∪ − composed with the inverse twist; dim P^{n−r} = b_{n−r} − b_{n−r−2}. (ii) The Lefschetz pairing ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) on H^{n−r}(X, ℚ_ℓ) is nondegenerate and (−1)^{n−r}-symmetric, the decomposition (i) of H^{n−r} is ψ_r-orthogonal, and ψ_r is nondegenerate on P^{n−r}(X). All these are Gal(k/k₀)-equivariant when (X, L) is defined over k₀.

Hypotheses and scope:

- X smooth projective of pure dimension n, L ample
- No sign (Hodge–Riemann) positivity of ψ_r on primitive classes is asserted
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Primitive Lefschetz decomposition**.

Proof or construction:

1. Apply DWP.9/lefschetz-decomposition-of-a-graded-operator to V = ⊕_j H^j(X, ℚ_ℓ(⌊j/2⌋)) after choosing, for the linear algebra only, a generator of ℚ_ℓ(1) over the algebraically closed k, so that λ = L_η is a degree-2 endomorphism; the hypothesis is DWP.9/hard-lefschetz-4-1-1, and B is Poincaré duality Tr_X(x ∪ y) (EDC.2), nondegenerate and graded-symmetric, with B(λx, y) = B(x, λy) (DWP.9/lefschetz-operator).
2. The resulting decompositions and pairings are independent of the chosen generator up to the corresponding twists, so they are stated with twists restored; Galois equivariance follows from that of η and of cup product.

Acceptance checks:

- Acceptance: X a smooth projective surface (n = 2): H² = η·H⁰(−1) ⊕ P²(X), P² = ker(η ∪ − : H² → H⁴(1)), the orthogonal of η for Tr(x ∪ y), and Tr(x ∪ y) is nondegenerate on P².
- Acceptance: X = ℙ^n: P⁰ = H⁰ and every other primitive part is 0.
- Non-example: integrally the decomposition can fail (Weil II 4.3.10: in ℤ_ℓ-cohomology ker(η) on H^n of a hyperplane-section pair can be the whole torsion subgroup); the statement is for ℚ_ℓ.

Direct inputs: [DWP.9/lefschetz-decomposition-of-a-graded-operator](#dwp-9-lefschetz-decomposition-of-a-graded-operator), [DWP.9/hard-lefschetz-4-1-1](#dwp-9-hard-lefschetz-4-1-1), [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf), (1.5)–(1.6), p. 108; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.1.5), proof, p. 218.

Declaration id: `DeligneWeightsAndPurity:DWP.9/primitive-decomposition-and-lefschetz-pairings`.

<a id="dwp-9-alternating-forms-have-even-rank"></a>

### A space with a nondegenerate alternating form has even dimension

Let K be a field and V a finite-dimensional K-vector space carrying a nondegenerate alternating bilinear form B (B(x, x) = 0 for all x). Then dim_K V is even.

Hypotheses and scope:

- Any field K, including characteristic 2 (alternating, not merely skew-symmetric)

Proof or construction:

1. Induction on dim V. If V ≠ 0 pick x ≠ 0 and, by nondegeneracy, y with B(x, y) = 1; W = span(x, y) has Gram matrix [[0, 1], [−1, 0]], so B|W is nondegenerate and V = W ⊕ W^⊥ (B is reflexive since alternating; Mathlib's LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal). B|W^⊥ is alternating and nondegenerate, and dim W = 2.

Acceptance checks:

- Acceptance: K² with B = det is nondegenerate alternating, of dimension 2.
- Non-example: in characteristic 2 the form x₁y₁ on K¹ is symmetric (= skew-symmetric) and nondegenerate but not alternating, on an odd-dimensional space: alternating cannot be weakened to skew-symmetric.

Direct inputs: `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal`, `mathlib:Module.finrank`.

Proposed implementation location: `TauCeti/LinearAlgebra/Lefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.1.5), proof, p. 218.

Declaration id: `DeligneWeightsAndPurity:DWP.9/alternating-forms-have-even-rank`.

<a id="dwp-9-odd-betti-numbers-are-even-4-1-5"></a>

### Odd Betti numbers of smooth projective varieties are even

Let k be algebraically closed with ℓ invertible and X a smooth projective k-scheme. Then b_j(X) = dim_{ℚ_ℓ} H^j(X, ℚ_ℓ) is even for every odd j.

Hypotheses and scope:

- X smooth projective; the statement for smooth proper nonprojective X is not asserted (the source records that it is not known to it in positive characteristic)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Evenness of odd Betti numbers**.

Proof or construction:

1. Reduce to X connected of pure dimension n and choose an ample L, η = c₁(L).
2. For odd j ≤ n write j = n − r; ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) is nondegenerate on H^{n−r}(X, ℚ_ℓ) (DWP.9/primitive-decomposition-and-lefschetz-pairings (ii)) and, n − r being odd, alternating: x ∪ x = −x ∪ x by graded commutativity, so x ∪ x = 0 in characteristic 0 coefficients. After trivialising the one-dimensional target ℚ_ℓ(r − n), DWP.9/alternating-forms-have-even-rank gives b_j even.
3. For odd j > n, b_j = b_{2n−j} by Poincaré duality (EDC.2) and 2n − j < n is odd.

Acceptance checks:

- Acceptance: a smooth projective curve of genus g has b₁ = 2g.
- Acceptance: an abelian variety of dimension g has b_j = C(2g, j), which is even for odd j.
- Non-example: a non-algebraic compact complex manifold (a Hopf surface, b₁ = 1) shows that some algebraic or Kähler input is needed; this node proves only the projective case

Direct inputs: [DWP.9/primitive-decomposition-and-lefschetz-pairings](#dwp-9-primitive-decomposition-and-lefschetz-pairings), [DWP.9/alternating-forms-have-even-rank](#dwp-9-alternating-forms-have-even-rank), `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.1.5), p. 218.

Declaration id: `DeligneWeightsAndPurity:DWP.9/odd-betti-numbers-are-even-4-1-5`.

<a id="dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13"></a>

### Hard Lefschetz for potentially pure complexes

Let k be algebraically closed with ℓ invertible, X ⊂ P = ℙ^N_k a projective k-scheme, η = c₁(𝒪_X(1)) ∈ H²(X, ℚ_ℓ(1)), and K ∈ D^b_c(X, ℚ̄_ℓ) a potentially pure complex, with a model (S, x̄, X_S ⊂ ℙ^N_S, K_S) witnessing potential purity (DWP.8/potentially-property-p-3-4-10). Let n ∈ ℤ be such that for every i, dim Supp ℋ^i(K) ≤ n − i and dim Supp ℋ^i(DK[−2n]) ≤ n − i (dim ∅ = −∞), where D is duality relative to k. Then for every r ≥ 0 the cup product η^r ∪ − : H^{n−r}(X, K) → H^{n+r}(X, K(r)) is an isomorphism.

Hypotheses and scope:

- X projective with the given embedding; η the class of 𝒪(1) of that embedding
- K potentially pure with an explicit model; both support inequalities, for K and for DK[−2n]
- The integer n is part of the statement and need not be dim X
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Hard Lefschetz for pure complexes**.

Proof or construction:

1. Induction on dim X (Weil II 6.2.13, parallel to 4.1.1). If dim X = 0 and ℋ^iK ≠ 0, the hypotheses give 0 ≤ n − i and 0 ≤ n − (−i + 2n) = i − n, so i = n: H^iK = 0 for i ≠ n and the assertion is trivial.
2. For Y = X ∩ H_u a sufficiently general hyperplane section (u in the dense open U where the R^jg_*q*K are lisse), K|Y satisfies the hypotheses with n − 1, and D(K|Y) = (DK)|Y(−1)[−2] (generic transversality; LPV.7:invariant-cycles' proof of 6.2.11, SGA 4½ [Th. finitude] generic acyclicity through EDC.0). As in DWP.9/hyperplane-factorisation-4-1-2, using LPV.7's support-bound weak Lefschetz theorem 6.2.11 (i) for K and for DK, the induction reduces to r = 1, i.e. to the bijectivity of H^{n−1}(X, K) → H^{n−1}(Y, K) → H^{n+1}(X, K)(1), the second map being the transpose of restriction H^{n−1}(X, DK[−2n]) → H^{n−1}(Y, DK[−2n]).
3. It therefore suffices that the perfect duality (EDC.1, Verdier duality on the projective Y over the algebraically closed k) between H^{n−1}(Y, K) and H^{n−1}(Y, DK[−2n]) induces a perfect duality between the images of H^{n−1}(X, K) and H^{n−1}(X, DK[−2n]). By LPV.7's global invariant cycle theorem 6.2.12, applied to K and to DK[−2n] (both potentially pure, D preserving purity, DWP.8/pure-complexes), these images are the π₁(U, u)-invariants. With twists restored, the pairing has values in ℚ̄_ℓ(1): on Y, D_Y(K|Y) = (DK)|Y(−1)[−2], so DK[−2n]|Y = D_Y(K|Y)(1)[−2(n−1)]. Over algebraically closed k this is a one-dimensional constant target; retain its twist when forming Gysin.
4. The representation of π₁(U, u) on H^*(Y_u, K) is semisimple: R^jg_*(q*K)|U is lisse and potentially punctually ι-pure (proper direct image preserves purity on the model, DWP.8/proper-direct-image-preserves-purity-6-2-6 and DWP.8/variant-over-z-one-over-ell-6-2-7, and lisse cohomology sheaves of a pure complex on a smooth base are punctually pure, DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5), hence semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12. Conclude by DWP.9/invariant-form-on-invariants-4-1-4. More explicitly put A=H^{n−1}(Y,K) and B=H^{n−1}(Y,DK[−2n]). The incidence pullback is smooth, so it preserves purity up to the normalised duality twist/shift (DWP.8/directional-weight-estimates); B is dual to A up to the constant Tate line. Thus A⊕B is semisimple with the nondegenerate hyperbolic pairing between A and B. Apply 4.1.4 to A⊕B, whose invariants are A^G⊕B^G; its nondegeneracy says precisely that the pairing A^G×B^G is perfect.
5. The source identifies ℤ_ℓ with ℤ_ℓ(1) to view η in H²(X, ℤ_ℓ); with the twist restored the target is H^{n+r}(X, K(r)).

Acceptance checks:

- Acceptance: for X smooth projective of pure dimension n and K = ℚ̄_ℓ[0], DK[−2n] = ℚ̄_ℓ(n)[0], both supports have dimension n ≤ n − 0, and the theorem is DWP.9/hard-lefschetz-4-1-1.
- Acceptance: for K = IC_X(L) of a pure lisse L on a smooth dense open of a projective X of dimension d, placed in the normalisation K = IC[−d] with n = d, the support conditions are the IC support conditions, and the conclusion is hard Lefschetz for intersection cohomology (consumed by EDC.7).
- Non-example (purity): for j : 𝔾_m → ℙ¹, K = j_!ℚ̄_ℓ and n = 1 the support conditions hold (ℋ⁰K has support ℙ¹ of dimension 1 ≤ 1; DK[−2] = Rj_*ℚ̄_ℓ(1) has ℋ⁰ of support dimension 1 ≤ 1 and ℋ¹ supported on {0, ∞}, of dimension 0 ≤ 0), but η : H⁰(ℙ¹, j_!ℚ̄_ℓ) = 0 → H²(ℙ¹, j_!ℚ̄_ℓ)(1) = ℚ̄_ℓ is not an isomorphism: j_!ℚ̄_ℓ is mixed but not potentially pure.
- Non-example (supports): K = ℚ̄_ℓ on ℙ¹ with n = 0 violates dim Supp ℋ⁰K ≤ 0, and η² : H^{−2} = 0 → H²(ℙ¹, ℚ̄_ℓ(2)) ≠ 0 is not an isomorphism: n is dictated by the support conditions.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`, [DWP.8/potentially-property-p-3-4-10](#dwp-8-potentially-property-p-3-4-10), [DWP.8/pure-complexes](#dwp-8-pure-complexes), [DWP.8/proper-direct-image-preserves-purity-6-2-6](#dwp-8-proper-direct-image-preserves-purity-6-2-6), [DWP.8/variant-over-z-one-over-ell-6-2-7](#dwp-8-variant-over-z-one-over-ell-6-2-7), [DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5](#dwp-8-twist-shift-and-smooth-lisse-purity-6-2-5), [DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12](#dwp-8-potentially-pure-lisse-sheaves-are-semisimple-3-4-12), [DWP.9/invariant-form-on-invariants-4-1-4](#dwp-9-invariant-form-on-invariants-4-1-4), [DWP.9/lefschetz-operator](#dwp-9-lefschetz-operator), `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1`, [DWP.8/directional-weight-estimates](#dwp-8-directional-weight-estimates), `EtaleDualityAndPerverseSheaves:EDC.2`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, Théorème (6.2.13), p. 250; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6, proof of (6.2.13), p. 251.

Declaration id: `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.

<a id="dwp-9-hard-lefschetz-for-pure-lisse-sheaves"></a>

### Hard Lefschetz with coefficients in a potentially pure lisse sheaf

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n embedded by a very ample L, η = c₁(L), and ℱ a lisse ℚ̄_ℓ-sheaf on X which is potentially punctually pure of some weight w, with a model witnessing it. Then for every r ≥ 0, η^r ∪ − : H^{n−r}(X, ℱ) → H^{n+r}(X, ℱ(r)) is an isomorphism. In particular this holds for ℱ = R^jh_*ℚ_ℓ of a smooth projective morphism h : Y → X.

Hypotheses and scope:

- X smooth projective; ℱ lisse and potentially punctually pure (integer weight)
- For a very ample L; an ample L reduces to a power
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Proof or construction:

1. K = ℱ[0] is potentially pure of weight w as a complex: on the smooth closed fibres of a model, a lisse punctually pure sheaf is pure (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (b)).
2. Support conditions with the integer n: ℋ⁰K = ℱ has support of dimension n ≤ n − 0; DK[−2n] = ℱ^∨(n)[0] (X smooth of pure dimension n) likewise. Apply DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13.
3. For ℱ = R^jh_*ℚ_ℓ, potential purity is DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11.

Acceptance checks:

- Acceptance: ℱ = ℚ_ℓ recovers DWP.9/hard-lefschetz-4-1-1.
- Acceptance: for h : E × X → X the constant elliptic family, ℱ = R¹h_*ℚ_ℓ = H¹(E) ⊗ ℚ_ℓ and the statement is hard Lefschetz for X tensored with H¹(E).
- Non-example: no claim is made for lisse sheaves that are not potentially pure, such as a nonsplit unipotent local system on an elliptic curve over ℂ (an extension of ℚ_ℓ by ℚ_ℓ with nonzero class in H¹(E, ℚ_ℓ)), which, being nonsemisimple, is not potentially pure (DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12)

Direct inputs: [DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13](#dwp-9-hard-lefschetz-for-potentially-pure-complexes-6-2-13), [DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5](#dwp-8-twist-shift-and-smooth-lisse-purity-6-2-5), [DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11](#dwp-8-proper-smooth-direct-images-are-potentially-pure-3-4-11), [DWP.8/potentially-property-p-3-4-10](#dwp-8-potentially-property-p-3-4-10).

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Introduction, p. 142.

Declaration id: `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-pure-lisse-sheaves`.

<a id="dwp-9-orthogonal-decomposition-of-a-hyperplane-section-4-3-9"></a>

### Invariant and vanishing cohomology of a hyperplane section are orthogonal complements

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n + 1, L very ample, (X_t)_{t∈D} a Lefschetz pencil of hyperplane sections (LPV.3) with singular set S, u ∈ D − S, Y = X_u, i : Y → X, and E = Ev(Y) ⊂ H^n(Y, ℚ_ℓ) the vanishing subspace (LPV.4). Then H^n(Y, ℚ_ℓ) = i*H^n(X, ℚ_ℓ) ⊕ E, an orthogonal direct sum for the intersection form Tr_Y(x ∪ y), which is nondegenerate on each summand. Consequently E ∩ E^⊥ = 0 (the radical quotient E/(E ∩ E^⊥) of LPV.4 is E itself), and a class that is both invariant under π₁(D − S, u) and vanishing is zero ('Lefschetz's fundamental lemma' over ℚ_ℓ).

Hypotheses and scope:

- ℚ_ℓ coefficients: the ℤ_ℓ statement is false (Weil II 4.3.10)
- A Lefschetz pencil (which may require a Veronese re-embedding, LPV.3)
- Source convention Weil II (0.1): schemes in this node are separated noetherian schemes with ℓ invertible. The packet uses the scheme specialisation explicitly permitted there, rather than claiming the algebraic-space generalisation.

Atlas landmark: **Invariant and vanishing cohomology**.

Proof or construction:

1. For this given Lefschetz pencil, import the direct fixed-part theorem of Weil II (4.3.2)–(4.3.8) from LPV.7:invariant-cycles: i*H^n(X) = H^n(Y)^{π₁(D−S,u)} = E^⊥. The local Picard–Lefschetz description identifies E^⊥ with the invariants (LPV.5). This works for any Lefschetz pencil in the stated hypotheses and does not apply the sufficiently-general-line clause of DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3 to an arbitrary line.
2. By DWP.9/hard-lefschetz-4-1-1 for X and DWP.9/hyperplane-factorisation-4-1-2 (d) (with n + 1 for n), the form is nondegenerate on i*H^n(X) = E^⊥.
3. The form on H^n(Y) is nondegenerate (Poincaré duality, EDC.2), so (E^⊥)^⊥ = E and H^n(Y) = E^⊥ ⊕ (E^⊥)^⊥ = i*H^n(X) ⊕ E, orthogonally, with the form nondegenerate on both summands.

Acceptance checks:

- Acceptance: X = ℙ² with the pencil of conics through four points after the Veronese re-embedding: n = 1, Y a conic, H¹(Y) = 0 = E.
- Acceptance: X a smooth surface in ℙ³ of degree d, Y a plane curve of degree d and genus g = (d − 1)(d − 2)/2: H¹(X) = 0, so E = H¹(Y) of dimension 2g with nondegenerate form.
- Non-example (ℤ_ℓ): in ℤ_ℓ-cohomology the intersection of E and the fixed part is ker(η : H^n(X, ℤ_ℓ) → H^{n+2}(X, ℤ_ℓ)(1)), which can be the whole torsion subgroup after changing the projective embedding (Weil II 4.3.10, after J. Morgan).

Direct inputs: [DWP.9/hard-lefschetz-4-1-1](#dwp-9-hard-lefschetz-4-1-1), [DWP.9/hyperplane-factorisation-4-1-2](#dwp-9-hyperplane-factorisation-4-1-2), `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.2`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`.

Proposed implementation location: `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz` (a future module, not a baseline declaration).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, Corollaire (4.3.9), p. 226; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.3.10), p. 226.

Declaration id: `DeligneWeightsAndPurity:DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`.

## Closure and signature coverage

All eleven current layers have declaration-level plans. The combined graph has 135 nodes, with 177 API entries, 94 mathematical unit tests and 41 atlas landmarks. An internal prerequisite names its supplying node. In particular, the DWP.7 definitions comparison imports DWP.5's Weil-sheaf and punctual-weight definitions; its relative-curve argument imports the local boundary estimates and DWP.6's sharp curve theorem. The DWP.10 mixed-nearby/Newton and equidistribution interfaces import specific DWP.7–DWP.8 nodes. External geometric and analytic prerequisites remain explicit supplier contracts, collected in the [assembly handoff](../handoff/ASM-DeligneWeightsAndPurity.md).

The [suggested file](../suggested/DeligneWeightsAndPurity.lean) gives numerical Weil and ι-weight predicates, characteristic-root operations, reciprocal pairings, actual representation and subgroup cores, stalk-family valuations, integral Frobenius modules, Newton couples and graded Lefschetz linear algebra. Both parts' coverage ledgers are retained. A ledger entry is a mathematical specification awaiting its genuine carrier; it is not an elaborated theorem. In particular, the file supplies neither constructible adic categories nor scheme cohomology by substituting arbitrary propositions for these objects. Every packet node retains `implementationStatus: unchecked`.

Two obligations from the first part remain visible. The isomorphism with ℂ must extend the prescribed base embedding: the existing transcendence-basis classification returns a ring equivalence without that compatibility theorem. Also, geometric and analytic suggested signatures require the actual adic/Weil coefficient, compact-support cohomology, nearby/vanishing-cycle, algebraic-monodromy and compact-Weil interfaces named in their ledgers. The numerical and linear-algebra signatures do not discharge those obligations.

The later part records four more supplier refinements: tame relative-divisor base change for j_* and its local monodromy filtration; the finite-level-to-adic passage for Weil II 6.1.8–6.1.9; stack cohomology for the normal-crossings spectral sequence; and the precise LPV.7 invariant-cycle/support-bound declarations supplying 6.2.11–6.2.12. These requests remain attached to their consuming nodes. The integrality proof has a readable SGA 7 XXI source and an explicit proof plan; it is not an outstanding source gap.

The source corrections are scoped by part and exact version. The first part retains the unfinished Milne trace calculation as an owner input, the Weil II attribution and half-weight scalar twist in Schiffmann's appendix, the SU₂ density (2/π)sin²θ dθ, the H¹ subtraction in point counts, Yu's tensor–Hom order, the finite-index central degree image and the norm-character weight sign. The later part retains the source's arithmetic-base subscript, the dual sheaf in the lower-weight argument, the lisse/normal hypotheses for geometric semisimplicity, the E₂ indexing of the cohomology-sheaf spectral sequence and the boundary orientation representation in the Bergström–Faber–Payne preprint. Their original `sourceIssues` identifiers remain in their packets; the part qualifier distinguishes identifiers reused by the two parts. The specifications also retain the review's positive differential of 1−π^m and the corrected determinant/exterior multiplicities.

The proposed DWP.5 coefficient/local/analytic sublayers and DWP.8 equidistribution branch organize the same mathematics; they have not been applied to the atlas. Likewise, WC.6's factor adapter, LPV.7's invariant-cycle ownership and the named upstream Part II extensions are proposals or supplier obligations, rather than new DWP proofs. The [handoff](../handoff/ASM-DeligneWeightsAndPurity.md) collects all six restructuring proposals and every remaining external request.

Source boundaries also survive assembly. Weil II 1.2.9–1.2.10 states conjectures in the cited 1980 version; determinant normalization is not treated as a proof of their purity, common-number-field or companion conclusions. No assertion about their present status is inferred from that source. The monodromy-filtration linear algebra of §§1.6–1.7 belongs to LPV.1. The Hodge-theoretic analogy in 1.8.14 and the multivariable normal-crossings estimates of §1.9 add no targets to these curve arguments. Schiffmann's full density application remains with the universal-family monodromy owner, and its published explicit-family proof is distinguished from the preprint's moduli-family shortcut.
